#!/usr/bin/env python3
"""Floating-point radial test on the physical long-cuff Miller–Schupp bands."""

import argparse
import math
from pathlib import Path

import numpy as np
from numpy.polynomial.legendre import leggauss


DELTA = 1 / 16
CUFF_LENGTH = 2 * math.acosh(5)
FUNNEL_RESPONSE = 144 * CUFF_LENGTH
WORD = "XyyxYYY"
LONGITUDE_SQUARE = np.diag([0.0, 0.0, 0.0, 1.0])
TRIAL_NODES = np.array([0, 48, 52, 54, 56, 58, 59, 60, 61, 62, 64]) / 512
TRIAL_VALUES = np.array([1, 4, 28, 68, 153, 340, 514, 765, 974, 1000, 1000]) / 1000
SLACK_RADII = np.array([1, 8, 48, 64, 256, np.inf])


def flat_step(value):
    """H, 1-H, H', H'' with the small end coefficient retained."""
    value = np.asarray(value, dtype=float)
    step = np.where(value <= 0, 0.0, 1.0)
    complement = np.where(value <= 0, 1.0, 0.0)
    slope = np.zeros_like(value)
    curvature = np.zeros_like(value)
    changing = (0 < value) & (value < 1)
    x = value[changing]
    m = -1 / x + 1 / (1 - x)
    odds = np.exp(-np.abs(m))
    denominator = 1 + odds
    step[changing] = np.where(m < 0, odds, 1) / denominator
    complement[changing] = np.where(m < 0, 1, odds) / denominator
    m_1 = x**-2 + (1 - x)**-2
    m_2 = -2 * x**-3 + 2 * (1 - x)**-3
    slope[changing] = odds / denominator**2 * m_1
    curvature[changing] = odds / denominator**2 * (m_2 + (1 - 2 * step[changing]) * m_1**2)
    return step, complement, slope, curvature


def marked_path(theta):
    """Position and two derivatives with respect to the physical longitude."""
    letter_time = 7 * theta / (2 * np.pi)
    index = np.floor(letter_time).astype(int) % 7
    letters = np.asarray(list(WORD))[index]
    step, complement, slope, curvature = flat_step(letter_time - np.floor(letter_time))
    inverse = np.char.isupper(letters)
    direction = np.where(inverse, -1, 1)
    sign = np.where(np.char.lower(letters) == "x", 1, -1)[..., None]
    phase = 2 * np.pi * np.where(inverse, complement, step)
    cosine, sine = np.cos(phase), np.sin(phase)
    angle_velocity = (7 * direction * slope)[..., None]
    angle_acceleration = (49 * direction * curvature / (2 * np.pi))[..., None]
    tangent = np.stack((-sine, cosine), axis=-1)
    acceleration = np.stack((-cosine, -sine), axis=-1)
    return (
        sign * np.stack((cosine - 1, sine), axis=-1),
        sign * tangent * angle_velocity,
        sign * (acceleration * angle_velocity**2 + tangent * angle_acceleration),
    )


def angular_rule(longitude_order, polar_order, azimuth_order, half_letter=False):
    theta_nodes, theta_weights = leggauss(longitude_order)
    letter_width = 2 * np.pi / 7
    if half_letter:
        theta = letter_width * (1 + theta_nodes) / 4
        theta_weights *= 14 * letter_width / 4
    else:
        theta = (letter_width * (np.arange(7)[:, None] + (1 + theta_nodes) / 2)).ravel()
        theta_weights = np.tile(letter_width * theta_weights / 2, 7)
    polar, polar_weights = leggauss(polar_order)
    azimuth = 2 * np.pi * (np.arange(azimuth_order) + 0.5) / azimuth_order
    w, psi = np.meshgrid(polar, azimuth, indexing="ij")
    horizontal = np.sqrt(1 - w**2)
    p = np.stack((horizontal * np.cos(psi), horizontal * np.sin(psi), w), axis=-1).reshape(-1, 3)
    sphere_weights = np.repeat(polar_weights * (2 * np.pi / azimuth_order), azimuth_order)
    return (
        np.repeat(theta, p.shape[0]),
        np.tile(p, (theta.size, 1)),
        (theta_weights[:, None] * sphere_weights[None, :]).ravel(),
    )


def normal_chart_data(theta, p):
    """Differential and known second derivative of the inverse marked tube map."""
    center, velocity, acceleration = marked_path(theta)
    jacobian = np.zeros((theta.size, 3, 4))
    jacobian[..., :3] = np.eye(3) / DELTA
    jacobian[:, :2, 3] = -velocity / DELTA
    derivative_jacobian = np.zeros_like(jacobian)
    derivative_jacobian[:, :2, 3] = -acceleration / DELTA
    radial_gradient = np.einsum("...i,...ij->...j", p, jacobian)
    planar_square = np.einsum("...mi,...mj->...ij", jacobian, jacobian)
    projected_square = planar_square - radial_gradient[..., :, None] * radial_gradient[..., None, :]
    projected_derivative = np.einsum("...mi,...mj->...ij", derivative_jacobian, jacobian)
    projected_derivative += np.swapaxes(projected_derivative, -1, -2)
    return center, p, radial_gradient, projected_square, projected_derivative, derivative_jacobian


def end_metrics(s, chart, metric_at):
    """Both product tensors and first jets in (x, y, phi, theta)."""
    center, p, dr, projected_square, projected_derivative, derivative_jacobian = chart
    r = 1 + s
    hessian_r = projected_square / r
    hessian_r[..., 3, 3] += np.einsum("...i,...i->...", p, derivative_jacobian[..., 3])
    radial_square = dr[..., :, None] * dr[..., None, :]
    derivative_radial_square = hessian_r[..., :, :, None] * dr[..., None, None, :]
    derivative_radial_square += dr[..., None, :, None] * hessian_r[..., :, None, :]
    a_hyp = radial_square + math.sinh(r)**2 * LONGITUDE_SQUARE
    a_sph = projected_square / r**2
    da = derivative_radial_square * (1 - r**-2)
    da -= (2 / r**3) * dr[..., :, None, None] * projected_square[..., None, :, :]
    da += math.sinh(2 * r) * dr[..., :, None, None] * LONGITUDE_SQUARE
    da[..., 3, :, :] += projected_derivative / r**2

    location = center + DELTA * r * p[..., :2]
    q, dq = metric_at(location[..., 0], location[..., 1])
    phi = np.pi / 3 + DELTA * r * p[..., 2]
    b_hyp = np.zeros_like(a_hyp)
    b_hyp[..., :2, :2] = q
    b_sph = np.zeros_like(a_sph)
    b_sph[..., 2, 2] = 1
    b_sph[..., 3, 3] = np.sin(phi)**2
    db = np.zeros_like(da)
    db[..., :2, :2, :2] = dq
    db[..., 2, 3, 3] = np.sin(2 * phi)
    return dr, hessian_r, a_hyp, a_sph, da, b_hyp, b_sph, db


def connection_scalar(first_derivatives, metric_inverse, contraction, with_dual=False):
    """Contract the first-kind Christoffel products with the band inverse."""
    first_kind = (
        first_derivatives
        + np.swapaxes(first_derivatives, -3, -2)
        - np.moveaxis(first_derivatives, -3, -1)
    ) / 2
    raised = np.einsum("...li,...ikp->...lkp", contraction, first_kind)
    raised = np.einsum("...jk,...lkp->...ljp", contraction, raised)
    inner = np.einsum("...ljp,...pq->...ljq", raised, metric_inverse)
    trace = np.einsum("...ij,...ijp->...p", contraction, first_kind)
    trace_dual = np.einsum("...pq,...p->...q", metric_inverse, trace)
    if with_dual:
        dual = inner - contraction[..., :, :, None] * trace_dual[..., None, None, :]
        return np.einsum("...ijq,...ijq->...", dual, first_kind), dual
    return np.einsum("...ljq,...ljq->...", inner, first_kind) - np.einsum("...q,...q->...", trace, trace_dual)


def sectional_trace(metric_component, contraction):
    composed = contraction @ metric_component
    return np.trace(composed, axis1=-2, axis2=-1)**2 - np.einsum("...ij,...ji->...", composed, composed)


def scalar_gradient_gains(a, b, g_inverse, b_inverse, switch, complement, switch_gradient, dual_difference, radii):
    """Pointwise gain allowing a perturbation of grad(log H) at fixed H and Hopf data."""
    planar_inverse = b_inverse[..., :2, :2]
    jacobian = np.sqrt(np.linalg.det(b[..., :2, :2]))
    m = g_inverse[..., :2, :2]
    planar_switch_gradient = switch_gradient[..., :2]
    cutoff_linear = 2 * (
        np.einsum("...ij,...j->...i", m, planar_switch_gradient)
        - np.trace(m, axis1=-2, axis2=-1)[..., None] * planar_switch_gradient
    )
    dual = dual_difference[..., :2, :2, :2]
    connection_linear = switch * (2 * np.einsum("...ijj->...i", dual) - np.einsum("...jji->...i", dual))
    linear_size = jacobian * np.linalg.norm(cutoff_linear + connection_linear, axis=-1)
    w = (switch * complement) * (b @ g_inverse @ a)
    planar_w = w[..., :2, :2]
    penalty = jacobian**2 / 2 * np.linalg.det(m) * np.trace(
        planar_inverse @ planar_w @ planar_inverse, axis1=-2, axis2=-1
    )
    if not np.any(penalty > 0):
        return np.zeros(linear_size.shape + radii.shape)
    unconstrained_radius = np.divide(linear_size / 2, penalty, out=np.zeros_like(penalty), where=penalty > 0)
    displacement = np.minimum(unconstrained_radius[..., None], radii)
    return (linear_size[..., None] - penalty[..., None] * displacement) * displacement


def curvature_from_jets(s, ends, slack_radii=None):
    """Return scalar curvature, metric and inverse in the exterior chart."""
    dr, hessian_r, a_hyp, a_sph, da, b_hyp, b_sph, db = ends
    a = a_hyp + a_sph
    b = b_hyp + b_sph
    switch, complement, slope, curvature = flat_step(np.asarray(16 * s - 1))
    dswitch = 16 * slope * dr
    d2switch = 256 * curvature * dr[..., :, None] * dr[..., None, :] + 16 * slope * hessian_r
    difference, derivative_difference = b - a, db - da
    g = complement * a + switch * b
    dg = complement * da + switch * db + dswitch[..., :, None, None] * difference[..., None, :, :]
    g_inverse = np.linalg.inv(g)

    # R(G) from the end curvature tensors, cutoff product rule, and connection products.
    ra = sectional_trace(a_sph, g_inverse) - sectional_trace(a_hyp, g_inverse)
    rb = sectional_trace(b_sph, g_inverse) - sectional_trace(b_hyp, g_inverse)
    switch_gradient = np.einsum("...ij,...j->...i", g_inverse, dswitch)
    cutoff = np.einsum("...ij,...ji->...", g_inverse @ d2switch @ g_inverse, difference)
    cutoff -= np.einsum("...ij,...ij->...", g_inverse, d2switch) * np.einsum(
        "...ij,...ij->...", g_inverse, difference
    )
    cutoff += 2 * (
        np.einsum("...il,...k,...lik->...", g_inverse, switch_gradient, derivative_difference)
        - np.einsum("...il,...k,...kil->...", g_inverse, switch_gradient, derivative_difference)
    )
    scalar = complement * ra + switch * rb + cutoff
    scalar -= complement * connection_scalar(da, np.linalg.inv(a), g_inverse)
    b_inverse = np.linalg.inv(b)
    if slack_radii is None:
        scalar += connection_scalar(dg, g_inverse, g_inverse)
        scalar -= switch * connection_scalar(db, b_inverse, g_inverse)
        return scalar, g, g_inverse
    mixed_connection, mixed_dual = connection_scalar(dg, g_inverse, g_inverse, with_dual=True)
    outer_connection, outer_dual = connection_scalar(db, b_inverse, g_inverse, with_dual=True)
    scalar += mixed_connection - switch * outer_connection
    gains = scalar_gradient_gains(
        a, b, g_inverse, b_inverse, switch, complement, switch_gradient, mixed_dual - outer_dual, slack_radii
    )
    return scalar, g, g_inverse, gains


def slice_coefficients(s, chart, angular_weights, metric_at, slack_radii=None):
    ends = end_metrics(s, chart, metric_at)
    scalar, g, g_inverse, *slack = curvature_from_jets(s, ends, slack_radii)
    dr = ends[0]
    inverse_lapse_square = np.einsum("...i,...ij,...j->...", dr, g_inverse, dr)
    jacobian = DELTA**3 * (1 + s)**2
    volume = jacobian * np.sqrt(np.linalg.det(g))
    terms = np.array([
        np.dot(angular_weights, 6 * volume * inverse_lapse_square),
        np.dot(angular_weights, scalar * volume),
        np.dot(angular_weights, volume),
    ])
    return np.concatenate((terms, (angular_weights * volume) @ slack[0])) if slack else terms


def assemble(radial_cells, radial_order, chart, angular_weights, metric_at, slack_radii=None):
    nodes = np.union1d(np.linspace(0.0, 1 / 8, radial_cells + 1), TRIAL_NODES)
    points, weights = leggauss(radial_order)
    stiffness = np.zeros((nodes.size, nodes.size))
    mass = np.zeros_like(stiffness)
    trial_on_nodes = np.interp(nodes, TRIAL_NODES, TRIAL_VALUES)
    trial_terms = np.zeros(2)
    trial_slack = np.zeros(0 if slack_radii is None else len(slack_radii))
    records = []
    for i, (left, right) in enumerate(zip(nodes[:-1], nodes[1:])):
        width = right - left
        derivative = np.array([-1.0, 1.0]) / width
        trial_endpoints = trial_on_nodes[i:i+2]
        for point, weight in zip(points, weights):
            unit = (point + 1) / 2
            radial = left + width * unit
            shape = np.array([1 - unit, unit])
            if radial <= 1 / 16:
                measure = 8 * np.pi**2 * math.sinh(1 + radial)
                gradient, potential = 6 * measure, 0.0
            else:
                values = slice_coefficients(radial, chart, angular_weights, metric_at, slack_radii)
                gradient, potential, measure = values[:3]
                trial_slack += width * weight * (shape @ trial_endpoints)**2 * values[3:]
            basis_products = shape[:, None] * shape[None, :]
            # Both actual isometrically exchanged bands, with the cap and exterior constants.
            stiffness[i:i+2, i:i+2] += width * weight * (
                gradient * derivative[:, None] * derivative[None, :] + potential * basis_products
            )
            mass[i:i+2, i:i+2] += width * weight * measure * basis_products
            trial_terms += width * weight * np.array([
                gradient * (derivative @ trial_endpoints)**2,
                potential * (shape @ trial_endpoints)**2,
            ])
            records.append([radial, gradient, potential, measure])
    np.testing.assert_allclose(trial_terms.sum(), trial_on_nodes @ stiffness @ trial_on_nodes, atol=1e-5)
    return nodes, stiffness, mass, np.asarray(records), trial_terms, trial_slack


def minimum_radial_profile(stiffness, mass):
    """A sign test with band-only L2 normalization, unrelated to a full eigenvalue."""
    chol = np.linalg.cholesky(mass)
    transformed = np.linalg.solve(chol, stiffness)
    transformed = np.linalg.solve(chol, transformed.T).T
    values, vectors = np.linalg.eigh((transformed + transformed.T) / 2)
    profile = np.linalg.solve(chol.T, vectors[:, 0])
    peak = profile[np.argmax(np.abs(profile))]
    profile /= peak
    return values[0], profile, profile @ stiffness @ profile


def exact_model_metric(x, y):
    """Half-plane metric translated away from the tube footprint."""
    q = (2 + y)[..., None, None]**-2 * np.eye(2)
    dq = np.zeros(q.shape[:-2] + (2, 2, 2))
    dq[..., 1, :, :] = -2 * (2 + y)[..., None, None]**-3 * np.eye(2)
    return q, dq


def remove_log_h_gradient(q, dq):
    """Keep H and the Hopf first jet and set only grad(log H) to zero."""
    hopf = (q[..., 0, 0] - q[..., 1, 1]) / 4 - 0.5j * q[..., 0, 1]
    hopf_derivative = (dq[..., 0, 0] - dq[..., 1, 1]) / 4 - 0.5j * dq[..., 0, 1]
    trace = np.trace(q, axis1=-2, axis2=-1) / 2
    jacobian = np.sqrt(np.linalg.det(q))
    high_stretch = (trace + jacobian) / 2
    known_trace_derivative = 2 * np.real(hopf.conj()[..., None] * hopf_derivative) / high_stretch[..., None]
    fitted_trace_derivative = np.trace(dq, axis1=-2, axis2=-1) / 2
    removed = fitted_trace_derivative - known_trace_derivative
    return dq - removed[..., :, None, None] * np.eye(2)


def self_test():
    theta, p, weights = angular_rule(5, 4, 8)
    chart = normal_chart_data(theta, p)
    for s in (0, 1 / 16, 1 / 8):
        ends = end_metrics(s, chart, exact_model_metric)
        scalar, _, _ = curvature_from_jets(s, ends)
        assert np.max(np.abs(scalar)) < 1e-8, (s, np.max(np.abs(scalar)))
    gradient, potential, measure = slice_coefficients(0, chart, weights, exact_model_metric)
    exact_measure = 8 * np.pi**2 * np.sinh(1)
    np.testing.assert_allclose([gradient, potential, measure], [6 * exact_measure, 0, exact_measure],
                               rtol=1e-11, atol=1e-9)
    assert math.isclose(np.sum(weights), 8 * np.pi**2)
    _, _, half_weights = angular_rule(5, 4, 8, half_letter=True)
    assert math.isclose(np.sum(half_weights), 8 * np.pi**2)
    print("Pure A/B scalar curvature and pure A radial measure checks passed")

    s = 0.116
    ends = end_metrics(s, chart, exact_model_metric)
    base, _, _, gains = curvature_from_jets(s, ends, SLACK_RADII)
    jacobian = np.sqrt(np.linalg.det(ends[5][..., :2, :2]))
    linear = []
    for direction in range(2):
        displacement = np.zeros_like(ends[-1])
        displacement[..., direction, :2, :2] = 100 * jacobian[:, None, None] * np.eye(2)
        up = curvature_from_jets(s, (*ends[:-1], ends[-1] + displacement))[0]
        down = curvature_from_jets(s, (*ends[:-1], ends[-1] - displacement))[0]
        linear.append((up - down) / 200)
    penalty = (base - (up + down) / 2) / 100**2
    linear_size = np.hypot(*linear)
    distance = np.minimum((linear_size / (2 * penalty))[:, None], SLACK_RADII)
    expected = (linear_size[:, None] - penalty[:, None] * distance) * distance
    np.testing.assert_allclose(gains, expected, rtol=1e-4, atol=1e-7)
    planar_metric = ends[5][..., :2, :2]
    planar_derivative = ends[-1][..., :2, :2, :2]
    np.testing.assert_allclose(remove_log_h_gradient(planar_metric, planar_derivative), 0, atol=1e-12)
    print("Gradient envelope agrees with direct scalar evaluations")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--fit", type=Path, help="saved NPZ harmonic marking fit")
    parser.add_argument("--self-test", action="store_true")
    parser.add_argument("--radial", type=int, default=64)
    parser.add_argument("--radial-order", type=int, default=2)
    parser.add_argument("--longitude", type=int, default=8, help="nodes per letter, or half-letter with --half-letter")
    parser.add_argument("--half-letter", action="store_true", help="integrate one reflected half of the first letter")
    parser.add_argument("--polar", type=int, default=6)
    parser.add_argument("--azimuth", type=int, default=12)
    parser.add_argument("--gradient-slack", action="store_true", help="maximize over grad(log H) perturbations")
    parser.add_argument("--absolute-gradient", action="store_true", help="use the analytic radius 39 around zero")
    parser.add_argument("--output", type=Path, help="optional NPZ data output")
    args = parser.parse_args()
    if args.self_test:
        self_test()
    if args.fit is None:
        if not args.self_test:
            parser.error("supply --fit or --self-test")
        return
    if args.radial < 2 or args.radial % 2 or min(args.radial_order, args.longitude, args.polar, args.azimuth) < 1:
        parser.error("use an even radial cell count and positive quadrature orders")

    from hopf_cuff_fit import evaluate_metric

    def fitted_metric(x, y):
        q, dq = evaluate_metric(args.fit, x, y)
        return q, remove_log_h_gradient(q, dq) if args.absolute_gradient else dq

    theta, p, angular_weights = angular_rule(args.longitude, args.polar, args.azimuth, args.half_letter)
    chart = normal_chart_data(theta, p)
    radii = np.array([39.0]) if args.absolute_gradient else SLACK_RADII if args.gradient_slack else None
    nodes, neumann, mass, records, trial_terms, trial_slack = assemble(
        args.radial, args.radial_order, chart, angular_weights, fitted_metric, radii
    )
    closed = neumann.copy()
    closed[-1, -1] += FUNNEL_RESPONSE
    ones = np.ones(nodes.size)
    neumann_value, neumann_profile, neumann_numerator = minimum_radial_profile(neumann, mass)
    closed_value, closed_profile, closed_numerator = minimum_radial_profile(closed, mass)
    if args.absolute_gradient:
        print("Floating-point diagnostic for the zero-gradient center at the fitted H and Hopf data")
    else:
        print("Floating-point diagnostic for the fitted native marking")
    print(f"Constant two-band numerator, Neumann: {ones @ neumann @ ones:.9g}")
    print(f"Constant two-band plus funnel numerator, original: {ones @ closed @ ones:.9g}")
    print(f"Lowest radial band-normalized quotients, Neumann and original: {neumann_value:.9g}, {closed_value:.9g}")
    print(f"Peak-one profile numerators, Neumann and original: {neumann_numerator:.9g}, {closed_numerator:.9g}")
    print(f"Profile endpoints, Neumann: {neumann_profile[0]:.9g}, {neumann_profile[-1]:.9g}")
    print(f"Profile endpoints, original: {closed_profile[0]:.9g}, {closed_profile[-1]:.9g}")
    print(f"Frozen profile, two-band kinetic: {trial_terms[0]:.9g}")
    print(f"Frozen profile, two-band potential: {trial_terms[1]:.9g}")
    print(f"Frozen profile, three funnels: {FUNNEL_RESPONSE:.9g}")
    print(f"Frozen profile, Neumann and original: {trial_terms.sum():.9g}, "
          f"{trial_terms.sum() + FUNNEL_RESPONSE:.9g}")
    if radii is not None:
        print("Fixed fitted q and Hopf derivative, pointwise scalar maximization over grad(log H)")
        for radius, gain in zip(radii, trial_slack):
            print(f"radius {radius:g}, two-band gain {gain:.9g}, "
                  f"original numerator {trial_terms.sum() + FUNNEL_RESPONSE + gain:.9g}")
    if args.output:
        np.savez(args.output, nodes=nodes, neumann=neumann, closed=closed, mass=mass, slices=records,
                 neumann_profile=neumann_profile, closed_profile=closed_profile, trial_nodes=TRIAL_NODES,
                 trial_values=TRIAL_VALUES, trial_terms=trial_terms, trial_slack=trial_slack)


if __name__ == "__main__":
    main()
