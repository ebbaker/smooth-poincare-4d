#!/usr/bin/env python3
"""Floating-point chiral integrals on a fitted native Miller–Schupp band."""

import argparse
from pathlib import Path

import numpy as np
from numpy.polynomial.legendre import leggauss

from hopf_cuff_fit import evaluate_metric
from native_rayleigh_fit import (
    DELTA,
    angular_rule,
    curvature_from_jets,
    end_metrics,
    exact_model_metric,
    flat_step,
    marked_path,
    normal_chart_data,
)


FIRST, SECOND = np.triu_indices(4, k=1)
I, J = FIRST[:, None], SECOND[:, None]
K, L = FIRST[None, :], SECOND[None, :]
SIGNED_PAIR = np.zeros((4, 4), dtype=int)
SIGNED_PAIR[FIRST, SECOND] = 1
SIGNED_PAIR[SECOND, FIRST] = -1
PAIR_INDEX = np.zeros((4, 4), dtype=int)
PAIR_INDEX[FIRST, SECOND] = PAIR_INDEX[SECOND, FIRST] = np.arange(6)

STAR = np.zeros((6, 6))
STAR[[5, 4, 3], [0, 1, 2]] = [1, -1, 1]
STAR += STAR.T.copy()
CHIRAL = np.stack([(np.eye(6) + sign * STAR)[:, :3] / np.sqrt(2) for sign in (1, -1)])


def wedge(matrix):
    """Induced matrix on the six coordinate two-forms in increasing pair order."""
    return matrix[..., I, K] * matrix[..., J, L] - matrix[..., I, L] * matrix[..., J, K]


def christoffel_products(dg, inverse):
    """First-kind connection products for the entries R(i,j,l,k)."""
    gamma = (dg + np.swapaxes(dg, -3, -2) - np.moveaxis(dg, -3, -1)) / 2
    contracted = gamma @ inverse[..., None, :, :]
    return (
        np.sum(contracted[..., I, L, :] * gamma[..., J, K, :], axis=-1)
        - np.sum(contracted[..., J, L, :] * gamma[..., I, K, :], axis=-1)
    )


def physical_curvature(s, ends):
    """First-jet curvature operator in a positive oriented orthonormal frame."""
    dr, d2r, a_hyp, a_sph, da, b_hyp, b_sph, db = ends
    a, b = a_hyp + a_sph, b_hyp + b_sph
    switch, complement, slope, curvature = flat_step(np.asarray(16 * s - 1))
    dswitch = 16 * slope * dr
    d2switch = 256 * curvature * (dr[..., :, None] * dr[..., None, :]) + 16 * slope * d2r
    diff, ddiff = b - a, db - da
    g = complement * a + switch * b
    dg = complement * da + switch * db + dswitch[..., :, None, None] * diff[..., None, :, :]

    def switched_second_derivative(p, q, u, v):
        return (d2switch[..., p, q] * diff[..., u, v]
                + dswitch[..., p] * ddiff[..., q, u, v]
                + dswitch[..., q] * ddiff[..., p, u, v])

    cutoff = (
        switched_second_derivative(I, L, J, K) + switched_second_derivative(J, K, I, L)
        - switched_second_derivative(I, K, J, L) - switched_second_derivative(J, L, I, K)
    ) / 2
    frame = np.linalg.inv(np.linalg.cholesky(g))
    connection = (
        christoffel_products(dg, np.linalg.inv(g))
        - complement * christoffel_products(da, np.linalg.inv(a))
        - switch * christoffel_products(db, np.linalg.inv(b))
    )
    coordinate_curvature = (
        complement * (wedge(a_sph) - wedge(a_hyp))
        + switch * (wedge(b_sph) - wedge(b_hyp))
        + cutoff + connection
    )
    frame_on_two_forms = wedge(frame)
    operator = frame_on_two_forms @ coordinate_curvature @ np.swapaxes(frame_on_two_forms, -1, -2)
    return operator, g, frame


def ricci_contraction(operator):
    """Contract i in R(i,j,i,k) in an oriented orthonormal frame."""
    ricci = np.zeros(operator.shape[:-2] + (4, 4))
    for index in range(4):
        rows = PAIR_INDEX[index, :, None]
        cols = PAIR_INDEX[index, None, :]
        signs = SIGNED_PAIR[index, :, None] * SIGNED_PAIR[index, None, :]
        ricci += signs * operator[..., rows, cols]
    return ricci


def energy_densities(operator):
    scalar = 2 * np.trace(operator, axis1=-2, axis2=-1)
    blocks = np.einsum("aiu,...ij,ajv->...auv", CHIRAL, operator, CHIRAL)
    chiral_weyl = blocks - scalar[..., None, None, None] * np.eye(3) / 12
    signed = np.sum(chiral_weyl**2, axis=(-2, -1))

    # The full operator norm uses a separate Ricci/Schouten subtraction.
    p = (ricci_contraction(operator) - scalar[..., None, None] * np.eye(4) / 6) / 2
    identity = np.eye(4)
    schouten_operator = (
        p[..., I, K] * identity[J, L] + p[..., J, L] * identity[I, K]
        - p[..., I, L] * identity[J, K] - p[..., J, K] * identity[I, L]
    )
    mean = np.sum((operator - schouten_operator)**2, axis=(-2, -1)) / 2
    return np.column_stack((signed, mean)), scalar


def tube_coordinate_jets(theta, ends):
    """Transform all end jets to framed Cartesian tube coordinates and longitude."""
    _, velocity, acceleration = marked_path(theta)
    dr, d2r, a_hyp, a_sph, da, b_hyp, b_sph, db = ends
    jacobian = np.broadcast_to(np.diag([DELTA, DELTA, DELTA, 1.0]), (theta.size, 4, 4)).copy()
    jacobian[:, :2, 3] = velocity
    second = np.zeros((theta.size, 4))
    second[:, :2] = acceleration

    def pullback(metric):
        return np.swapaxes(jacobian, -1, -2) @ metric @ jacobian

    def pullback_first(metric, derivative):
        result = np.einsum("...ak,...bi,...cj,...abc->...kij", jacobian, jacobian, jacobian, derivative)
        extra = np.einsum("...a,...ab,...bj->...j", second, metric, jacobian)
        result[:, 3, 3, :] += extra
        result[:, 3, :, 3] += extra
        return result

    band_dr = np.einsum("...i,...ij->...j", dr, jacobian)
    band_d2r = pullback(d2r)
    band_d2r[:, 3, 3] += np.sum(dr * second, axis=-1)
    return (band_dr, band_d2r, pullback(a_hyp), pullback(a_sph), pullback_first(a_hyp + a_sph, da),
            pullback(b_hyp), pullback(b_sph), pullback_first(b_hyp + b_sph, db))


def check_curvature(metric_at):
    theta, p, _ = angular_rule(5, 4, 8)
    chart = normal_chart_data(theta, p)
    largest_scalar_error = 0.0
    largest_chart_error = 0.0
    for s in (0.0, 1 / 16, 0.069, 0.079, 0.092, 0.108, 0.121, 1 / 8):
        ends = end_metrics(s, chart, metric_at)
        operator, _, frame = physical_curvature(s, ends)
        energies, scalar = energy_densities(operator)
        reference, _, _ = curvature_from_jets(s, ends)
        largest_scalar_error = max(largest_scalar_error, np.max(np.abs(scalar - reference)))
        np.testing.assert_allclose(scalar, reference, atol=1e-5, rtol=5e-7)
        np.testing.assert_allclose(energies[:, :2].mean(axis=1), energies[:, 2], atol=2e-8, rtol=1e-8)
        tube_operator, _, _ = physical_curvature(s, tube_coordinate_jets(theta, ends))
        tube_energies, _ = energy_densities(tube_operator)
        chart_error = np.max(np.abs(energies - tube_energies) / np.maximum(1.0, tube_energies))
        largest_chart_error = max(largest_chart_error, chart_error)
        assert chart_error < 1e-5, (s, chart_error)
        if s <= 1 / 16 or s == 1 / 8:
            hyp, sph = ends[2:4] if s <= 1 / 16 else ends[5:7]
            expected_ricci = frame @ (sph - hyp) @ np.swapaxes(frame, -1, -2)
            np.testing.assert_allclose(ricci_contraction(operator), expected_ricci, atol=2e-8)
            expected_spectrum = np.broadcast_to([-1, 0, 0, 0, 0, 1], operator.shape[:-1])
            np.testing.assert_allclose(np.linalg.eigvalsh(operator), expected_spectrum, atol=2e-8)
            np.testing.assert_allclose(energies, 0, atol=1e-12)
    print(f"Largest scalar discrepancy on check slices: {largest_scalar_error:.6g}")
    print(f"Largest scaled chiral-density discrepancy across coordinate charts: {largest_chart_error:.6g}")


def integrate(metric_at, radial_cells, radial_order, longitude_order, polar_order, azimuth_order):
    theta, p, angular_weights = angular_rule(longitude_order, polar_order, azimuth_order)
    chart = normal_chart_data(theta, p)
    points, weights = leggauss(radial_order)
    radial_nodes = np.linspace(1 / 16, 1 / 8, radial_cells + 1)
    energies = np.zeros(3)
    for left, right in zip(radial_nodes[:-1], radial_nodes[1:]):
        half_width = (right - left) / 2
        for point, weight in zip(points, weights):
            s = (left + right) / 2 + half_width * point
            operator, g, _ = physical_curvature(s, end_metrics(s, chart, metric_at))
            density, _ = energy_densities(operator)
            volume = DELTA**3 * (1 + s)**2 * np.sqrt(np.linalg.det(g))
            energies += half_width * weight * ((angular_weights * volume) @ density)
    return energies


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--fit", type=Path, help="saved NPZ harmonic marking fit")
    parser.add_argument("--self-test", action="store_true")
    parser.add_argument("--radial", type=int, default=24, help="cells on the switching region")
    parser.add_argument("--radial-order", type=int, default=3)
    parser.add_argument("--longitude", type=int, default=12, help="nodes in each of all seven letters")
    parser.add_argument("--polar", type=int, default=6)
    parser.add_argument("--azimuth", type=int, default=12)
    args = parser.parse_args()
    if not args.fit and not args.self_test:
        parser.error("supply --fit or --self-test")
    if min(args.radial, args.radial_order, args.longitude, args.polar, args.azimuth) < 1:
        parser.error("quadrature orders and radial cell count must be positive")
    if args.self_test:
        check_curvature(exact_model_metric)
    if args.fit:
        def fitted_metric(x, y):
            return evaluate_metric(args.fit, x, y)

        check_curvature(fitted_metric)
        result = integrate(fitted_metric, args.radial, args.radial_order, args.longitude, args.polar, args.azimuth)
        print(f"One complete band E+, E-, full-operator mean: {result[0]:.10g}, {result[1]:.10g}, {result[2]:.10g}")
        print(f"E+ - E-: {result[0] - result[1]:.10g}")
        print(f"One complete band in units of pi^2: {result[2] / np.pi**2:.10g}")


if __name__ == "__main__":
    main()
