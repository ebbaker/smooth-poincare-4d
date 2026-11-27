#!/usr/bin/env python3
"""Validate the frozen scalar residual on 2 <= |z| <= 4 of the native pants."""

import argparse
import json
from fractions import Fraction as Q
from math import factorial
from pathlib import Path

from interior_residual_certificate import Interval, PARAMETER_RADII, cos_nodes, interval, sample_bounds


ANGULAR_HALF_WIDTH = Q(1, 16)
CAUCHY_RADIUS = Q(1, 64)
BERNSTEIN_PARAMETER = 3
FLUX_ERROR = Q("2e-9")
TARGET = Q(1, 8000)
COMPLEX_CASES = ((1, 5, 40_000, 27), (2, 12, 100_000, 28), (7, 3000, 12_000_000, 33))


def dyadic(text):
    return Q.from_float(float.fromhex(text))


def shifted_chebyshev(center):
    """Coefficients of T_j(2(center+w)-1), in ascending powers of w."""
    diagonal = 2 * center - 1
    polynomials = [[Q(1)], [diagonal, Q(2)]]
    for degree in range(2, 19):
        previous, second_previous = polynomials[-1], polynomials[-2]
        coefficients = [Q(0)] * (degree + 1)
        for k, value in enumerate(previous):
            coefficients[k] += 2 * diagonal * value
            coefficients[k + 1] += 4 * value
        for k, value in enumerate(second_previous):
            coefficients[k] -= value
        polynomials.append(coefficients)
    return polynomials


def radial_bound(coefficients, shifted, radius):
    """Absolute bound after exact cancellation inside each radial mode."""
    return sum(abs(sum(coefficients[j] * shifted[j][k] for j in range(k, 19))) * radius**k
               for k in range(19))


def complex_correction_bound(data, center, half_width):
    base = [dyadic(value) for value in data["coefficients"]]
    responses = [[dyadic(row[i]) for row in data["response"]] for i in range(2)]
    radial_radius = Q(5, 3) * half_width
    angular_imaginary = Q(4, 3) * ANGULAR_HALF_WIDTH
    angle_factor = (1 + angular_imaginary) / (1 - angular_imaginary)
    z_bound = (center + radial_radius) * angle_factor + CAUCHY_RADIUS
    z_lower = (center - radial_radius) / angle_factor - CAUCHY_RADIUS
    assert z_lower > Q(8, 5) and z_bound < 5
    outer_center = center**2 / 16
    outer_radius = (2 * center * radial_radius + radial_radius**2
                    + 2 * z_bound * CAUCHY_RADIUS + CAUCHY_RADIUS**2) / 16
    outer_polynomials = shifted_chebyshev(outer_center)
    hole_polynomials = shifted_chebyshev(Q(0))
    hole_chart_radius = 1 / (4 * (z_lower - 1))
    correction = Q(0)
    for row_index in range(32):
        start = 19 * row_index
        stop = start + 19
        if row_index < 11:
            angular = (z_bound / 4)**(2 * row_index)
            polynomials, radius = outer_polynomials, outer_radius
        else:
            angular = 2 * hole_chart_radius**(row_index - 11)
            polynomials, radius = hole_polynomials, hole_chart_radius**2
        radial = radial_bound(base[start:stop], polynomials, radius)
        for slack, response in zip(PARAMETER_RADII, responses):
            radial += slack * radial_bound(response[start:stop], polynomials, radius)
        correction += angular * radial
    assert correction < 7
    assert sum(abs(dyadic(value)) for value in data["parameters"]) + sum(PARAMETER_RADII) < Q(13, 100)
    return correction


def verify_complex_constants():
    one_pole_bound = Q(5, 3) + Q(1, 11) + (Q(25, 36) + Q(4, 121)) / 3
    assert 2 * one_pole_bound + Q("1.6e-14") < 5
    phi_squared = Q(13, 4)**2
    for correction, exponential, supremum, _ in COMPLEX_CASES:
        argument = Q(25, 64) + correction
        partial = sum(argument**k / factorial(k) for k in range(32))
        tail = argument**32 / factorial(32) / (1 - argument / 33)
        assert partial + tail < exponential
        assert Q(1, 16) + 4 * 64**2 * correction + 2 * exponential * (1 + 156 * phi_squared) < supremum


def nodes(center, half_width, unit):
    return interval(center) + interval(half_width) * unit


def polar_sample_bounds(data, r, t):
    radial = Interval(r.lo[:, None], r.hi[:, None])
    angular = Interval(t.lo[None, :], t.hi[None, :])
    square = angular * angular
    denominator = 1 + square
    z = (radial * (1 - square) / denominator, 2 * radial * angular / denominator)
    return sample_bounds(data, axes=(r, t), coordinates=z)


def verify_tile(data, r_center, t_center, half_width, correction, stages):
    cosine = cos_nodes(stages, positive=False)
    unit = Interval([value.lo for value in cosine], [value.hi for value in cosine])
    radial = nodes(r_center, half_width, unit)
    angular = nodes(t_center, ANGULAR_HALF_WIDTH, unit)
    residual, lower, upper = polar_sample_bounds(data, radial, angular)
    rho = Q(BERNSTEIN_PARAMETER)
    # Absolute complex bounds for the residual and half reaction are derived in the note.
    _, _, bound, degree = next(case for case in COMPLEX_CASES if correction < case[0])
    tail = 8 * bound * rho**(-degree - 1) / (1 - 1 / rho)**2
    norming = (1 - (Q(22, 7) * degree / (2 * 2**stages))**2 / 2)**-2
    middle = (Q.from_float(upper) + Q.from_float(lower)) / 2
    spread = (Q.from_float(upper) - Q.from_float(lower)) / 2
    max_residual = norming * (Q.from_float(residual) + tail) + tail
    min_reaction = middle - norming * (spread + tail) - tail
    ratio = (max_residual + Q(2, 3) * FLUX_ERROR) / (2 * min_reaction) if min_reaction > 0 else Q(1)
    return max_residual, min_reaction, ratio


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--tile", type=int, help="run a single radial-major tile")
    parser.add_argument("--outer-only", action="store_true", help="use the finer radial tiling on 3.75 <= |z| <= 4")
    args = parser.parse_args()
    data = json.loads(Path(__file__).with_name("whole_pants_residual_d18.json").read_text())
    assert (data["degree"], data["modes"]) == (18, 20)
    verify_complex_constants()
    if args.outer_only:
        half_width = Q(1, 32)
        radial_centers = [Q(121 + 2 * index, 32) for index in range(4)]
    else:
        half_width = Q(1, 8)
        radial_centers = [Q(17 + 2 * index, 8) for index in range(8)]
    angular_centers = [Q(1 + 2 * index, 16) for index in range(8)]
    corrections = {center: complex_correction_bound(data, center, half_width) for center in radial_centers}
    print("Bound on the complex mode correction:", float(max(corrections.values())), flush=True)
    tiles = [(r, t) for r in radial_centers for t in angular_centers]
    indices = range(len(tiles)) if args.tile is None else [args.tile]
    results = []
    for index in indices:
        radial, angular = tiles[index]
        residual, reaction, ratio = verify_tile(data, radial, angular, half_width, corrections[radial], stages=6)
        if ratio >= TARGET:
            residual, reaction, ratio = verify_tile(data, radial, angular, half_width, corrections[radial], stages=7)
        results.append((residual, reaction, ratio))
        print(index, float(residual), float(reaction), float(ratio), flush=True)
    max_residual, min_reaction, max_ratio = max(x[0] for x in results), min(x[1] for x in results), max(x[2] for x in results)
    print("Max residual, min half reaction, max weighted residual:",
          float(max_residual), float(min_reaction), float(max_ratio))
    assert max_ratio < TARGET


if __name__ == "__main__":
    main()
