#!/usr/bin/env python3
"""Reproduce the SP4-ZERO-E01 radial comparison with NumPy alone."""

import numpy as np

from e01_fourier import grid, solve, transfer_symbol


EPSILONS = (0.0, -0.5, 0.5)
INTERIOR_RADIUS = 2.0


def radial_factors(radius_squared, epsilon):
    t = 1.0 / (1.0 + radius_squared)
    a = 1.0 + epsilon * t * (1.0 - t)
    g1 = np.exp(-epsilon * t)
    if epsilon > 0:
        c = 1 + epsilon / 4
        b = np.sqrt(epsilon / c)
        log_g2 = b * (np.arctanh(b * (t - 0.5)) + np.arctanh(b / 2))
    elif epsilon < 0:
        c = 1 + epsilon / 4
        b = np.sqrt(-epsilon / c)
        log_g2 = -b * (np.arctan(b * (t - 0.5)) + np.arctan(b / 2))
    else:
        log_g2 = np.zeros_like(t)
    return a, g1, np.exp(log_g2)


def sampled_graph(coordinates, radius_squared, epsilon, half_width, tapered):
    t = 1 / (1 + radius_squared)
    deformation = epsilon * t * (1 - t)
    scalar = deformation / (2 + deformation)
    if tapered:
        fraction = np.sqrt(radius_squared) / half_width
        s = np.clip((fraction - 0.70) / 0.25, 0, 1)
        scalar *= (1 - s)**3 * (1 + 3 * s + 6 * s**2)
    graph = transfer_symbol(*coordinates).swapaxes(-1, -2)
    graph *= scalar[..., None, None] * np.array([1, -1, -1])
    return graph


def exact_triple(coordinates, radius_squared, epsilon):
    a, g1, g2 = radial_factors(radius_squared, epsilon)
    alphas = np.stack((a, 1 / a, 1 / a), axis=-1)
    gs = np.stack((g1, g2, g2), axis=-1)
    plus = np.eye(3) * (gs * (alphas + 1) / 2)[..., None, :]
    minus = transfer_symbol(*coordinates).swapaxes(-1, -2)
    minus *= (gs * (alphas - 1) / 2)[..., None, :]
    return plus, minus


def compare(n, half_width, epsilon, *, tapered=False, alternate_zero=False):
    axis = grid(n, half_width)
    coordinates = np.ix_(axis, axis, axis, axis)
    radius_squared = sum(x * x for x in coordinates)
    interior = radius_squared <= INTERIOR_RADIUS**2
    interior_coordinates = tuple(axis[indices] for indices in np.nonzero(interior))
    exact_plus, exact_minus = exact_triple(interior_coordinates, radius_squared[interior], epsilon)
    graph = sampled_graph(coordinates, radius_squared, epsilon, half_width, tapered)
    result = solve(graph, half_width)
    error = max(np.max(np.abs(result.plus[interior] - exact_plus)),
                np.max(np.abs(result.minus[interior] - exact_minus)))
    plus_error = np.max(np.abs(result.plus[interior] - exact_plus), axis=(0, 1))
    minus_error = np.max(np.abs(result.minus[interior] - exact_minus), axis=(0, 1))
    mean_minus = np.max(np.abs(result.minus.mean(axis=(0, 1, 2, 3))))
    difference = float("nan")
    if alternate_zero:
        other = solve(graph, half_width, zero_mode=np.eye(3))
        difference = max(np.max(np.abs(result.plus[interior] - other.plus[interior])),
                         np.max(np.abs(result.minus[interior] - other.minus[interior])))
    return (error, np.maximum(plus_error, minus_error), result.iterations,
            result.residual, int(interior.sum()), mean_minus, difference)


def main():
    families = (
        ("resolution", ((17, 5.0), (25, 5.0), (33, 5.0)), False),
        ("box", ((13, 3.25), (21, 5.25), (33, 8.25)), False),
        ("taper", ((25, 5.0), (33, 5.0)), True),
    )
    print(f"NumPy {np.__version__}; fixed physical comparison ball |x| <= {INTERIOR_RADIUS:g}")
    print("sweep n L h eps points iterations residual error col_1 col_2 col_3 mean_minus delta_zero p")
    worst_error = 0.0
    for sweep, meshes, tapered in families:
        for epsilon in EPSILONS:
            previous_error = previous_scale = None
            for n, half_width in meshes:
                h = 2 * half_width / n
                scale = 1 / half_width if sweep == "box" else h
                result = compare(n, half_width, epsilon, tapered=tapered,
                                 alternate_zero=(sweep == "resolution" and n == 17))
                error, columns, iterations, residual, count, mean_minus, delta_zero = result
                order = float("nan")
                if previous_error and error:
                    order = np.log(previous_error / error) / np.log(previous_scale / scale)
                print(f"{sweep} {n} {half_width:.3f} {h:.9f} {epsilon:+.1f} {count} "
                      f"{iterations} {residual:.5e} {error:.9e} "
                      f"{' '.join(f'{value:.9e}' for value in columns)} "
                      f"{mean_minus:.5e} {delta_zero:.5e} {order:.4f}", flush=True)
                previous_error, previous_scale = error, scale
                worst_error = max(worst_error, error)
    if worst_error > 0.08:
        raise SystemExit("calibration tolerance exceeded")


if __name__ == "__main__":
    main()
