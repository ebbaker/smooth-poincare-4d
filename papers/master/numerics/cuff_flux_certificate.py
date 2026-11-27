"""Exact whole-circle flux bounds for the frozen degree-18 scalar comparator.

The calculation uses only rational arithmetic. It validates boundary normal
derivatives, including the two response columns. The interior equation and
cuff-length root require separate certificates.
"""

import json
from fractions import Fraction as Q
from math import comb, lcm
from pathlib import Path


INPUT = Path(__file__).with_name("whole_pants_residual_d18.json")
BOUNDS = {
    "outer": (Q("9e-10"), Q("1.8e-8"), Q("1.7e-8")),
    "right": (Q("1.8e-9"), Q("3.3e-8"), Q("3.1e-8")),
}
PARAMETER_RADII = (Q("2e-5"), Q("5e-5"))
ONE = (1,)
ZERO = (0,)


def add(a, b):
    result = list(a if len(a) >= len(b) else b)
    for i, value in enumerate(b if len(a) >= len(b) else a):
        result[i] += value
    while len(result) > 1 and not result[-1]:
        result.pop()
    return tuple(result)


def scale(a, factor):
    return tuple(value * factor for value in a) if factor else ZERO


def multiply(a, b):
    result = [0] * (len(a) + len(b) - 1)
    for i, u in enumerate(a):
        if u:
            for j, v in enumerate(b):
                if v:
                    result[i + j] += u * v
    return tuple(result)


def powers(polynomial, degree):
    result = [ONE]
    for _ in range(degree):
        result.append(multiply(result[-1], polynomial))
    return result


def recurrence(first, first_flux, determinant, determinant_flux, degree):
    """Recurrence P[k+1]=2*P[1]*P[k]-determinant*P[k-1], and radial derivative."""
    polynomials, fluxes = [ONE, first], [ZERO, first_flux]
    for k in range(1, degree):
        polynomial = add(scale(multiply(first, polynomials[k]), 2),
                         scale(multiply(determinant, polynomials[k - 1]), -1))
        flux = scale(add(multiply(first_flux, polynomials[k]),
                         multiply(first, fluxes[k])), 2)
        flux = add(flux, scale(add(multiply(determinant_flux, polynomials[k - 1]),
                                  multiply(determinant, fluxes[k - 1])), -1))
        polynomials.append(polynomial)
        fluxes.append(flux)
    return polynomials, fluxes


def distance_and_flux(center, radius, pole):
    """Squared distance to a real pole in t=cos(angle), and radial derivative."""
    a = center - pole
    return (a * a + radius * radius, 2 * a * radius), (2 * radius, 2 * a)


def angular_terms(center, radius, pole, degree):
    d, d_flux = distance_and_flux(center, radius, pole)
    return recurrence((center - pole, radius), (0, 1), d, d_flux, degree)


def outer_fluxes(center, radius, degree, modes):
    d, d_flux = distance_and_flux(center, radius, 0)
    scaled_radius = add(scale(d, Q(1, 8)), (-1,))
    scaled_flux = scale(d_flux, Q(1, 8))
    chebyshev, cheb_flux = recurrence(scaled_radius, scaled_flux, ONE, ZERO, degree)
    angular, ang_flux = angular_terms(center, radius, 0, modes)
    return [scale(add(multiply(ang_flux[k], chebyshev[j]),
                      multiply(angular[k], cheb_flux[j])), Q(1, 4**k))
            for k in range(0, modes + 1, 2) for j in range(degree + 1)]


def hole_fluxes(center, radius, pole, degree, modes):
    """Return radial derivatives over the common positive denominator D**n."""
    d, d_flux = distance_and_flux(center, radius, pole)
    n = modes + degree + 1
    d_powers = powers(d, n)
    first = add((Q(1, 8),), scale(d, -1))
    chebyshev, cheb_flux = recurrence(
        first, scale(d_flux, -1), d_powers[2], scale(multiply(d, d_flux), 2), degree)
    angular, ang_flux = angular_terms(center, radius, pole, modes)
    numerators = []
    for k in range(modes + 1):
        for j in range(degree + 1):
            power = k + j
            numerator = multiply(angular[k], chebyshev[j])
            flux = add(multiply(ang_flux[k], chebyshev[j]),
                       multiply(angular[k], cheb_flux[j]))
            flux = add(multiply(flux, d), scale(multiply(numerator, d_flux), -power))
            numerators.append(scale(multiply(flux, d_powers[n - power - 1]), Q(1, 4**k)))
    return numerators, d_powers


def combination(polynomials, columns):
    result = [ZERO] * 3
    for polynomial, row in zip(polynomials, columns):
        for i, coefficient in enumerate(row):
            result[i] = add(result[i], scale(polynomial, coefficient))
    return result


def cuff_polynomials(center, radius, outward_sign, target_flux, degree, modes, weights):
    """Return common denominator and signed residual numerators for three fields."""
    outer = outer_fluxes(center, radius, degree, modes)
    right, right_powers = hole_fluxes(center, radius, 1, degree, modes)
    left, left_powers = hole_fluxes(center, radius, -1, degree, modes)
    denominator = multiply(right_powers[-1], left_powers[-1])

    outer_columns = weights[:len(outer)]
    hole_columns = weights[len(outer):]
    assert len(hole_columns) == len(right) == len(left)
    parity_weights = [tuple((-1)**(i // (degree + 1)) * value for value in row)
                       for i, row in enumerate(hole_columns)]
    outer_sum = combination(outer, outer_columns)
    right_sum = combination(right, hole_columns)
    left_sum = combination(left, parity_weights)
    numerators = []
    for i in range(3):
        total = multiply(outer_sum[i], denominator)
        total = add(total, multiply(right_sum[i], left_powers[-1]))
        total = add(total, multiply(left_sum[i], right_powers[-1]))
        if i == 0:
            _, grad0 = distance_and_flux(center, radius, 0)
            _, gradr = distance_and_flux(center, radius, 1)
            _, gradl = distance_and_flux(center, radius, -1)
            total = add(total, scale(multiply(grad0, denominator), Q(1, 64)))
            total = add(total, scale(multiply(
                multiply(gradr, right_powers[-2]), left_powers[-1]), Q(-3, 4)))
            total = add(total, scale(multiply(
                multiply(gradl, left_powers[-2]), right_powers[-1]), Q(-3, 4)))
        total = scale(total, outward_sign)
        if i == 0:
            total = add(total, scale(denominator, -target_flux))
        numerators.append(total)
    return denominator, numerators


def bernstein(polynomial, degree):
    """Bernstein coefficients on the full t interval [-1,1]."""
    power = [sum(((-1)**(j - i)) * 2**i * comb(j, i) * polynomial[j]
                 for j in range(i, len(polynomial))) for i in range(degree + 1)]
    return [sum(Q(comb(i, j), comb(degree, j)) * power[j]
                for j in range(i + 1)) for i in range(degree + 1)]


def integer_coefficients(values):
    denominator = lcm(*(Q(value).denominator for value in values))
    return [int(value * denominator) for value in values]


def bisect_bernstein(coefficients):
    """Midpoint subdivision, with a common positive integer scaling."""
    degree = len(coefficients) - 1
    left = [coefficients[0] << degree]
    right = [coefficients[-1] << degree]
    row = coefficients
    for depth in range(1, degree + 1):
        row = [a + b for a, b in zip(row, row[1:])]
        left.append(row[0] << (degree - depth))
        right.append(row[-1] << (degree - depth))
    return left, right[::-1]


def prove_nonnegative(coefficients, max_depth=28):
    pending = [(integer_coefficients(coefficients), 0)]
    max_used, accepted = 0, 0
    while pending:
        row, depth = pending.pop()
        if min(row) >= 0:
            max_used = max(max_used, depth)
            accepted += 1
        else:
            if min(row[0], row[-1]) < 0:
                raise ValueError("the proposed bound fails at an exact dyadic endpoint")
            if depth == max_depth:
                raise ValueError("subdivision budget exhausted before proving the bound")
            pending.extend((child, depth + 1) for child in bisect_bernstein(row))
    return max_used, accepted


def load_columns(document):
    def dyadic(value):
        return Q.from_float(float.fromhex(value))

    return [(dyadic(coefficient), *(dyadic(value) for value in response))
            for coefficient, response in zip(document["coefficients"], document["response"], strict=True)]


def main():
    document = json.loads(INPUT.read_text())
    degree, modes = document["degree"], document["modes"]
    assert (degree, modes) == (18, 20)
    weights = load_columns(document)
    for name, center, radius, sign, flux in [
        ("outer", 0, 4, 1, Q(-1, 2)), ("right", 1, Q(1, 4), -1, 8)
    ]:
        denominator, numerators = cuff_polynomials(
            center, radius, sign, flux, degree, modes, weights)
        n = max(len(denominator), *(len(p) for p in numerators)) - 1
        ratio_denominator = bernstein(denominator, n)
        for index, (numerator, bound) in enumerate(zip(numerators, BOUNDS[name])):
            ratio_numerator = bernstein(numerator, n)
            proofs = [prove_nonnegative([bound * q + sign * p for p, q in
                                        zip(ratio_numerator, ratio_denominator)])
                      for sign in (-1, 1)]
            print(f"{name:5s}, column {index}: bound {float(bound):.6g}, "
                  f"degree {n}, depths and leaves {proofs}", flush=True)

    assert all(a <= b for a, b in zip(BOUNDS["outer"], BOUNDS["right"]))
    bulk = BOUNDS["right"]
    box = bulk[0] + sum(radius * bound for radius, bound in zip(PARAMETER_RADII, bulk[1:]))
    assert box < Q("1.803e-9")
    print(f"Uniform full-boundary flux bound in the parameter box: {float(box):.7g}")


if __name__ == "__main__":
    main()
