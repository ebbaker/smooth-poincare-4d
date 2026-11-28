#!/usr/bin/env python3
"""Run the frozen E02 gate cases and evaluate the B01 continuum bounds."""

from fractions import Fraction
from math import isqrt
from platform import machine, python_version

import numpy as np

from e01_fourier import grid, solve


HALF_WIDTH = 4
MAIN_GRID = 17
STRESS_GRID = 25
GAUSS_ORDER = 64
CENTERS = (Fraction(1, 2), Fraction(2, 3), Fraction(3, 4), Fraction(4, 5))
WEIGHTS = {"A": (16, 8, 4, 2, 1), "B": (16, -8, 4, -2, 1)}
BASE = tuple(Fraction(t) for t in ("0", "-1/4", "1/4", "-5/16", "5/16"))
STRESS = {"A": (Fraction("-33/64"), Fraction("-3/4")), "B": (Fraction("3/4"),)}
BREAKS = np.array([-2.0, -1.0, 0.0, 1.0, 2.0])


def spline_derivatives(x):
    """Return h, h', h'' for the piecewise cubic in B01."""
    radius = np.abs(x)
    inner, outer = radius <= 1, (radius > 1) & (radius <= 2)
    proximity = 2 - radius
    value = np.select(
        [inner, outer], [1 - 1.5 * radius**2 + 0.75 * radius**3, proximity**3 / 4]
    )
    first = np.sign(x) * np.select(
        [inner, outer], [-3 * radius + 2.25 * radius**2, -0.75 * proximity**2]
    )
    second = np.select([inner, outer], [-3 + 4.5 * radius, 1.5 * proximity])
    return np.stack((value, first, second))


def bump(x):
    """Use the rescaled mollifier on Gaussian nodes strictly inside (-1, 1)."""
    return np.exp(-1 / (1 - x**2))


def smoothed_axis(axis):
    """Compute all three convolved quantities by piecewise Gauss quadrature."""
    nodes, weights = np.polynomial.legendre.leggauss(GAUSS_ORDER)
    normalizer = weights @ bump(nodes)
    result = np.empty((3, axis.size))
    for index, x in enumerate(axis):
        knots = 64 * (x - BREAKS)
        interior = np.sort(knots[(knots > -1) & (knots < 1)])
        endpoints = np.concatenate(([-1], interior, [1]))
        middles = (endpoints[1:] + endpoints[:-1]) / 2
        half_widths = (endpoints[1:] - endpoints[:-1]) / 2
        quadrature_points = middles[:, None] + half_widths[:, None] * nodes
        measure = half_widths[:, None] * weights * bump(quadrature_points)
        values = spline_derivatives(x - quadrature_points / 64)
        result[:, index] = np.einsum("kij,ij->k", values, measure) / normalizer
    return result


def tensor_derivative(axis_factors, *indices):
    """Use zero, first, or second convolved derivative in each axis."""
    factors = [factor[indices.count(i)] for i, factor in enumerate(axis_factors)]
    return np.einsum("i,j,k,l->ijkl", *factors)


def profile_fields(axis, profile):
    """Evaluate the profile, transverse gradient, and transverse Hessian."""
    common = smoothed_axis(axis)
    shifted = [smoothed_axis(axis - float(center)) for center in CENTERS]
    shape = (axis.size,) * 4
    value = np.zeros(shape)
    gradient = np.zeros(shape + (3,))
    hessian = np.zeros(shape + (3, 3))
    for center, numerator in enumerate(WEIGHTS[profile]):
        weight = numerator / 31
        factors = [common] * 4
        if center:
            factors[center - 1] = shifted[center - 1]
        value += weight * tensor_derivative(factors)
        for i in range(3):
            gradient[..., i] += weight * tensor_derivative(factors, i + 1)
            for j in range(i, 3):
                hessian[..., i, j] += weight * tensor_derivative(factors, i + 1, j + 1)
    for i, j in ((1, 0), (2, 0), (2, 1)):
        hessian[..., i, j] = hessian[..., j, i]
    return value, gradient, hessian


def energy_ratio(t, fields, spacing):
    """Midpoint sum of the chiral Weyl density against flat chart dx."""
    field, gradient, hessian = fields
    denominator = 1 - t * field
    a = (1 + t * field) / denominator
    product = gradient[..., :, None] * gradient[..., None, :]
    curvature = (
        (2 * t / denominator**2)[..., None, None] * hessian
        + (4 * t**2 / denominator**3)[..., None, None] * product
    )
    curvature -= np.trace(curvature, axis1=-2, axis2=-1)[..., None, None] * (np.eye(3) / 3)
    density = np.einsum("...ij,...ij->...", curvature, curvature) / a
    return float(density.sum() * spacing**4 / (16 * np.pi**2))


def fourier_bound_squared(profile):
    """Exact second moment of the translation polynomial from B01."""
    weights = [Fraction(numerator, 31) for numerator in WEIGHTS[profile]]
    h = [1 - Fraction(3, 2) * x**2 + Fraction(3, 4) * x**3 for x in CENTERS]
    mean = weights[0] + sum(w * value for w, value in zip(weights[1:], h))
    variance = sum(w**2 * (1 - value**2) for w, value in zip(weights[1:], h))
    return mean**2 + variance


def continuum_bounds(profile, t):
    """Rational enclosures, including the stated conservative constants."""
    b2 = fourier_bound_squared(profile)
    scale = 10**9
    b_upper = Fraction(isqrt(b2.numerator * scale**2 // b2.denominator) + 1, scale)
    v = abs(t) * b_upper
    m = (1 - v) / (1 + v)
    d = 1 if profile == "A" and t < 0 else 1 - v
    derivative_bound = 14 * abs(t) / d**2 + 9 * t**2 / d**3
    minimum_lower = d * max(0, (1 - 2 * v) / (1 - v))
    # 3 < pi and sqrt(6) < 5/2.
    yamabe_test_lower = Fraction(288, 5) * m - 2 * derivative_bound
    energy_upper = derivative_bound**2 / (144 * m)
    return minimum_lower, yamabe_test_lower, energy_upper


def rounded_bound(value, places, upper):
    """Round a Fraction to a fixed number of decimal places outwards."""
    scale = 10**places
    scaled = value * scale
    rounded = scaled.numerator // scaled.denominator
    if upper and scaled.denominator != 1:
        rounded += 1
    sign = "-" if rounded < 0 else ""
    whole, decimal = divmod(abs(rounded), scale)
    return f"{sign}{whole}.{decimal:0{places}d}"


def run_grid(profile, parameters, n):
    """Evaluate the specified profile and parameters on one periodic grid."""
    axis = grid(n, HALF_WIDTH)
    fields = profile_fields(axis, profile)
    for t in parameters:
        signed_profile = float(t) * fields[0]
        graph = signed_profile[..., None, None] * np.eye(3)
        solution = solve(graph, HALF_WIDTH)
        singular_values = np.linalg.svd(solution.plus, compute_uv=False)
        chart_min = np.min((1 - signed_profile) * singular_values[..., -1])
        if not np.isfinite(chart_min) or not np.isfinite(solution.residual):
            raise RuntimeError("the solve returned a nonfinite diagnostic")
        sampled = f"{min(1, chart_min):.9f}"
        minimum, yamabe_test, energy = continuum_bounds(profile, t)
        lower = rounded_bound(minimum, 6, upper=False)
        displayed = Fraction(sampled)
        error = max(abs(displayed - Fraction(lower)), abs(displayed - 1))
        numerical_energy = energy_ratio(float(t), fields, 2 * HALF_WIDTH / n)
        print(
            profile, str(t), n, solution.iterations, f"{solution.residual:.3e}",
            f"{numerical_energy:.9f}", sampled, lower,
            rounded_bound(error, 6, upper=True),
            rounded_bound(yamabe_test, 6, upper=False),
            rounded_bound(energy, 6, upper=True),
            flush=True,
        )


def main():
    print(f"Python {python_version()} NumPy {np.__version__} {machine()}")
    print(f"Box half-width {HALF_WIDTH}; Gauss-Legendre order {GAUSS_ORDER} per segment")
    for profile in WEIGHTS:
        print(f"b_{profile}^2={fourier_bound_squared(profile)}")
    print("profile t n iterations relative_residual numerical_e/T sampled_min min_L error_U K_L energy_U")
    for profile, stress in STRESS.items():
        run_grid(profile, BASE + stress, MAIN_GRID)
        run_grid(profile, stress, STRESS_GRID)


if __name__ == "__main__":
    main()
