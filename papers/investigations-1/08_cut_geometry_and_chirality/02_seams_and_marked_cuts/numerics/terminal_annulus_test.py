#!/usr/bin/env python3
"""Fixed-profile B06 exterior diagnostics, E20. No optimization."""

from pathlib import Path
from fractions import Fraction
import runpy

import numpy as np
from numpy.polynomial.legendre import leggauss


FROZEN = runpy.run_path(str(Path(__file__).with_name("seam_relaxation.py")))
PARAMETERS = np.asarray(FROZEN["REPLAY_PROFILE"])
START = FROZEN["STARTS"][2]
SIZE = FROZEN["RESOLUTIONS"][-1]
CUTS = (1 / 2, 3 / 4, 13 / 16, 7 / 8)


class Annulus(FROZEN["Quadrature"]):
    """Use frozen profile evaluation on a specified exterior grid."""

    def __init__(self, cut, order):
        self.size = SIZE
        nodes, weights = leggauss(order)
        edges = np.linspace(cut, 1, 25)
        left, right = edges[:-1, None], edges[1:, None]
        points = (left + right + (right - left) * nodes) / 2
        cell_weights = (right - left) * weights / 2
        self.x = points.ravel()
        self.q = self.x**2
        self.weights = cell_weights.ravel()
        self.axial_basis, self.transverse_basis = self.basis(self.q)
        self.length, *_ = self.profiles(PARAMETERS, START)

        cell_volumes = np.sum(cell_weights * self.volume_speed(points), axis=1)
        tails = np.r_[np.cumsum(cell_volumes[:0:-1])[::-1], 0]
        partial_points = (points[:, :, None] + right[:, :, None]
                          + (right[:, :, None] - points[:, :, None]) * nodes) / 2
        partial_weights = (right[:, :, None] - points[:, :, None]) * weights / 2
        interior_tails = np.sum(partial_weights * self.volume_speed(partial_points), axis=2)
        self.v = -(interior_tails + tails[:, None]).ravel()
        self.l = float(np.sum(cell_volumes))
        self.cut = cut

    def original_profile(self, points):
        q = points**2
        split = 1 + self.size
        return self.profile_jets(
            q, self.length, PARAMETERS[1:split], PARAMETERS[split:], START[-1], self.basis(q),
        )

    def volume_speed(self, points):
        x = points.ravel()
        length, (w, _, _), (r, _, _) = self.original_profile(x)
        a, u = 4 * length * x * np.exp(w), x * r
        return (length * np.exp(2 * u) / a).reshape(points.shape)

    def transformed(self, x):
        length, (w, w_q, w_qq), (r, r_q, r_qq) = self.original_profile(x)
        q = x**2
        a, u = 4 * length * x * np.exp(w), x * r
        h_a = (1 / x + 2 * x * w_q) / length
        h_u = (r + 2 * q * r_q) / length
        h_as = (-1 / q + 2 * w_q + 4 * q * w_qq) / length**2
        h_us = x * (6 * r_q + 4 * q * r_qq) / length**2

        horizontal_product = a * np.exp(-u)
        v_s = np.exp(2 * u) / a
        y = np.exp(3 * u) / a
        anisotropy = -(np.log(a) + u) / 2
        y_v = y * (3 * h_u - h_a) / v_s
        u_v = -(h_a + h_u) / (2 * v_s)

        shape = np.array([h_u, h_a, -h_u])
        shape_s = np.array([h_us, h_as, -h_us])
        log_product_s = h_a - h_u
        log_product_ss = h_as - h_us
        rescaled_shape = np.sqrt(horizontal_product) * (shape - log_product_s / 2)
        rescaled_shape_s = horizontal_product * (
            shape_s - log_product_ss / 2 + log_product_s / 2 * (shape - log_product_s / 2)
        )
        lengths = np.array([np.sqrt(y), np.exp(-anisotropy), np.exp(anisotropy)])
        direct_axial, direct_plus_square = chiral_data(lengths, rescaled_shape, rescaled_shape_s)
        return y, anisotropy, y_v, u_v, direct_axial, direct_plus_square


def chiral_data(lengths, shape, shape_s):
    """Direct E19 Cartan computation in the cyclic (k,i,j) orientation."""
    radial = -shape_s - shape**2
    structure = 2 * lengths**2 / lengths[0]
    connection = np.sum(structure, axis=0) / 2 - structure
    tangent = np.empty_like(radial)
    mixed = np.empty_like(radial)
    for i, j, k in ((0, 1, 2), (1, 2, 0), (2, 0, 1)):
        tangent[i] = connection[i] * structure[i] - connection[j] * connection[k] - shape[j] * shape[k]
        mixed[i] = -structure[i] * shape[i] + connection[k] * shape[j] + connection[j] * shape[k]
    curvature = radial + tangent
    scalar = 2 * np.sum(curvature, axis=0)
    plus = curvature / 2 - scalar / 12 + mixed
    return plus[0], np.sum(plus**2, axis=0)


def diagnostics(cut, order):
    collar = Annulus(cut, order)
    y, u, y_v, u_v, lambda_k, plus_square = collar.transformed(collar.x)
    y_end, u_end, y_v_end, u_v_end, *_ = collar.transformed(np.array([cut, 1]))
    floor = np.exp(-2 * collar.l)
    p_floor = floor * (1 - floor)
    p_derivative_floor = 2 * floor - 4 * floor**2
    c_floor = np.cosh(2 * u_end[0])
    boundary = p_floor * y_v_end[0] + (6 * p_floor - p_derivative_floor) * (y_end[0] - 1)

    measure = collar.weights * collar.volume_speed(collar.x)
    exponential = np.exp(2 * collar.v)
    p = exponential * (-np.expm1(2 * collar.v))
    c, d = np.cosh(2 * u), 2 * np.sinh(2 * u)
    moment = measure @ (p * (8 * (c - 1) + 4 * d**2 / y + 4 * y * u_v**2 + 12 * d * u_v))
    integrated_by_parts = (
        measure @ (4 * p * (d**2 / y + y * u_v**2) + (40 * exponential**2 - 16 * exponential) * (c - 1))
        - 12 * p_floor * (c_floor - 1)
    )
    square = measure @ (4 * p * (np.sqrt(y) * u_v + d / np.sqrt(y))**2)
    nonnegative_potential = measure @ (8 * exponential**2 * (c - 1))
    c_boundary = -4 * p_floor * (c_floor - 1)
    integrated_moment = square + nonnegative_potential + c_boundary
    p_squared = 1 / 24 - floor**2 / 4 + floor**3 / 3 - floor**4 / 8
    direct_axial_moment = measure @ (6 * p * lambda_k)
    exact_residual = 4 - boundary - moment
    bound = exact_residual**2 / (96 * p_squared)
    energy = measure @ plus_square / 4
    axial_energy = measure @ (1.5 * lambda_k**2) / 4
    original = collar.residual(PARAMETERS, START)
    original_energy = original @ original

    np.testing.assert_allclose([y_end[1], u_end[1], y_v_end[1], u_v_end[1]], [3, 0, 0, 0], atol=2e-12)
    np.testing.assert_allclose(measure @ p**2, p_squared, atol=2e-12)
    np.testing.assert_allclose([integrated_by_parts, integrated_moment], moment, atol=2e-11)
    np.testing.assert_allclose([direct_axial_moment, energy], [-exact_residual, original_energy], atol=2e-10)
    assert 0 <= bound <= axial_energy + 1e-9 <= energy + 1e-8

    return dict(
        l=collar.l, radial_length=measure @ (1 / np.sqrt(y)), t=floor,
        y_inner=y_end[0], u_inner=u_end[0], y_v_inner=y_v_end[0], u_v_inner=u_v_end[0],
        y_normal_inner=-np.sqrt(y_end[0]) * y_v_end[0],
        u_normal_inner=-np.sqrt(y_end[0]) * u_v_end[0],
        B=boundary, J=moment, J_square=square, J_potential=nonnegative_potential, J_boundary=c_boundary,
        I=p_squared, deficit=exact_residual, threshold=12 * np.sqrt(p_squared),
        required_J=4 - boundary - 12 * np.sqrt(p_squared),
        lower_bound=bound, axial_energy=axial_energy, transverse_energy=energy - axial_energy, energy=energy,
    )


def main():
    preceding = []
    for order in (8, 16):
        print(f"24 equal x cells, {order} Gauss nodes per cell:")
        for index, cut in enumerate(CUTS):
            data = diagnostics(cut, order)
            if order == 8:
                preceding.append(data)
            else:
                np.testing.assert_allclose(list(data.values()), list(preceding[index].values()), atol=2e-10)
            print(f"  x={cut:.4f}")
            print("   ", " ".join(f"{name}={value:.10f}" for name, value in data.items()))
    t = Fraction(39, 100)
    I_upper = Fraction(1, 24) - t**2 / 4 + t**3 / 3 - t**4 / 8
    B_upper = Fraction(1, 4) * Fraction(9, 5) + Fraction(32, 25) * Fraction(27, 20)
    deficit_lower = 4 - B_upper - Fraction(1, 20)
    assert I_upper < Fraction(21, 1000)
    assert deficit_lower == Fraction(443, 250)
    assert deficit_lower**2 / (96 * Fraction(21, 1000)) > Fraction(31, 20)
    print("Exact box arithmetic checked; it does not certify profile membership.")


if __name__ == "__main__":
    main()
