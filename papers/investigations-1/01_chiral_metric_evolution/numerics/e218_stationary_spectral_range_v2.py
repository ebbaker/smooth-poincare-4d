#!/usr/bin/env python3
"""Exact B104 certificate, revision 2: correct the E199 endpoint basis.

23 November 2026. Lead integration of the located E219 correction.
The frozen v1 is retained as e218_stationary_spectral_range.py.
Only p, r and their provenance comment change the calculation; the
reported four combinations and canonical certificate JSON are unchanged.
"""

import argparse
import json
import sys
from dataclasses import dataclass
from fractions import Fraction
from itertools import combinations, product
from math import comb, lcm

sys.dont_write_bytecode = True
from e202_general_stationary_pinching import AXES, CLEAR, EDGES, J, V, scalar_block, unpack


def sign_int(value):
    return (value > 0) - (value < 0)


def radical_sign(rational, radical):
    """Sign of rational + radical*sqrt(14), with exact input."""
    left, right = sign_int(rational), sign_int(radical)
    if left == right or right == 0:
        return left
    if left == 0:
        return right
    return left * sign_int(rational**2 - 14 * radical**2)


@dataclass(frozen=True)
class Field:
    rational: Fraction = Fraction(0)
    radical: Fraction = Fraction(0)

    def __add__(self, other):
        if not isinstance(other, Field):
            other = Field(other)
        return Field(self.rational + other.rational, self.radical + other.radical)

    __radd__ = __add__

    def __neg__(self):
        return Field(-self.rational, -self.radical)

    def __sub__(self, other):
        return self + (-other)

    def __mul__(self, other):
        if not isinstance(other, Field):
            other = Field(other)
        a, b = self.rational, self.radical
        c, d = other.rational, other.radical
        return Field(a * c + 14 * b * d, a * d + b * c)

    __rmul__ = __mul__

    def sign(self):
        return radical_sign(self.rational, self.radical)

    def pairs(self):
        return [str(self.rational), str(self.radical)]


DELTA = Field(Fraction(-1), Fraction(1, 2))
EDGE_NAMES = ["12", "13", "23"]


def evaluate(block, a, b):
    """Map square coordinates to u=1+DELTA*a*b, v=1+DELTA*a."""
    u, v = 1 + DELTA * a * b, 1 + DELTA * a
    max_u = max(i for row in block for entry in row for i, _ in entry.terms)
    max_v = max(j for row in block for entry in row for _, j in entry.terms)
    up, vp = [Field(1)], [Field(1)]
    for _ in range(max_u):
        up.append(up[-1] * u)
    for _ in range(max_v):
        vp.append(vp[-1] * v)
    power = [[x * y for y in vp] for x in up]
    return [[sum(c * power[i][j] for (i, j), c in entry.terms.items())
             for entry in row] for row in block]


def principal_minors(matrix):
    d, e, f = (matrix[i][i] for i in range(3))
    x, y, z = matrix[0][1], matrix[0][2], matrix[1][2]
    return {
        "0": d, "1": e, "2": f,
        "01": d * e - x * x,
        "02": d * f - y * y,
        "12": e * f - z * z,
        "012": d * e * f + 2 * x * y * z - d * z * z - e * y * y - f * x * x,
    }


def screen(block):
    grid = [Fraction(i, 16) for i in range(17)]
    counts = {name: [0, 0, 0] for name in principal_minors(block)}
    zeros = []
    for a, b in product(grid, repeat=2):
        matrix = evaluate(block, a, b)
        for name, value in principal_minors(matrix).items():
            sign = value.sign()
            if sign < 0:
                return {"counterexample": {"a": str(a), "b": str(b), "minor": name,
                                           "value": value.pairs(),
                                           "matrix": [[n.pairs() for n in row] for row in matrix]}}
            counts[name][1 - sign] += 1
            if sign == 0:
                zeros.append({"a": str(a), "b": str(b), "minor": name})
    return {"grid_shape": [17, 17], "distinct_triangle_points": 273,
            "minor_sign_counts_positive_zero_negative": counts, "zeros": zeros}


def square_power(polynomial):
    """Return numerator pairs of the substituted power polynomial and its scale."""
    degree_a = max(i + j for i, j in polynomial.terms)
    degree_b = max(i for i, _ in polynomial.terms)
    shifted = [[0] * (degree_b + 1) for _ in range(degree_a + 1)]
    for (m, n), coefficient in polynomial.terms.items():
        for i in range(m + 1):
            for j in range(n + 1):
                shifted[i + j][i] += coefficient * comb(m, i) * comb(n, j)

    # The coefficient of a^r b^s has the shared factor DELTA^r.
    numerator = []
    x, y = 1, 0
    for r, row in enumerate(shifted):
        scale = 2**(degree_a - r)
        numerator.append([(c * x * scale, c * y * scale) for c in row])
        x, y = -2 * x + 14 * y, x - 2 * y
    assert any(x or y for x, y in numerator[-1])
    assert any(row[-1][0] or row[-1][1] for row in numerator)
    return numerator, 2**degree_a


def to_bernstein_rows(rows, degree):
    """Convert the first axis in power coordinates, clearing a positive scale."""
    common = lcm(*(comb(degree, r) for r in range(len(rows))))
    column_weights = [common // comb(degree, r) for r in range(len(rows))]
    weights = [[comb(i, r) * column_weights[r] for r in range(min(i + 1, len(rows)))]
               for i in range(degree + 1)]
    out = []
    for line_weights in weights:
        out.append([(sum(w * c[0] for w, c in zip(line_weights, col)),
                     sum(w * c[1] for w, c in zip(line_weights, col)))
                    for col in zip(*rows)])
    return out, common


def bernstein(power, degree_a, degree_b):
    rows, scale_a = to_bernstein_rows(power, degree_a)
    columns, scale_b = to_bernstein_rows(list(zip(*rows)), degree_b)
    return list(zip(*columns)), scale_a * scale_b


def check_bernstein_at(rows, denominator, value, a, b):
    n, m = len(rows) - 1, len(rows[0]) - 1
    w_a = [comb(n, i) * a**i * (1 - a)**(n - i) for i in range(n + 1)]
    w_b = [comb(m, j) * b**j * (1 - b)**(m - j) for j in range(m + 1)]
    total = sum(Field(*rows[i][j]) * w_a[i] * w_b[j]
                for i, j in product(range(n + 1), range(m + 1)))
    assert total == value * denominator


def coefficient_signs(rows):
    return [[radical_sign(*entry) for entry in row] for row in rows]


def counts(signs):
    return [sum(row.count(s) for row in signs) for s in (1, 0, -1)]


def strata_with_zero_value(signs, bounds):
    """Describe zero strata from the support of nonnegative coefficients."""
    def axis_support(low, high, degree):
        return [([str(low), str(low)], [0]), ([str(low), str(high)], range(degree + 1)),
                ([str(high), str(high)], [degree])]

    n, m = len(signs) - 1, len(signs[0]) - 1
    return [[a, b] for (a, i_support), (b, j_support) in product(
        axis_support(*bounds[0], n), axis_support(*bounds[1], m))
            if not any(signs[i][j] for i, j in product(i_support, j_support))]


def certify(polynomial, sample_values):
    power, substitution_scale = square_power(polynomial)
    n, m = len(power) - 1, len(power[0]) - 1
    rows, scale = bernstein(power, n, m)
    denominator = scale * substitution_scale
    for (a, b), value in sample_values.items():
        check_bernstein_at(rows, denominator, value, a, b)

    signs = coefficient_signs(rows)
    tally = counts(signs)
    box = [(Fraction(0), Fraction(1))] * 2
    result = {"natural_degrees_a_b": [n, m], "scale_denominator": denominator,
              "intervals_a_b": [[str(lo), str(hi)] for lo, hi in box],
              "coefficient_sign_counts_positive_zero_negative": tally,
              "zero_coefficient_indices": [[i, j] for i, row in enumerate(signs)
                                           for j, sign in enumerate(row) if sign == 0]}
    if tally[2] == 0:
        result["zero_strata_a_b"] = strata_with_zero_value(signs, box)
    return result


def continuum(block):
    minors = principal_minors(block)
    names = ("0", "01", "012")
    samples = {coordinates: principal_minors(evaluate(block, *coordinates)) for coordinates in
               ((Fraction(0), Fraction(0)), (Fraction(1), Fraction(0)),
                (Fraction(1), Fraction(1)), (Fraction(2, 3), Fraction(1, 5)))}
    return {name: certify(minors[name], {point: sample[name] for point, sample in samples.items()})
            for name in names}


def check_axial_endpoint(block):
    """Check the edge radical and its agreement with E199 (8)."""
    t = 1 + DELTA
    inv_t = Field(0, Fraction(1, 7))
    axial_matrix = evaluate(block, Fraction(1), Fraction(0))
    k = [-t * Fraction(1, 2), Field(1), Field(-1)]
    assert all(sum(c * z for c, z in zip(row, k)) == Field() for row in axial_matrix)
    minors = principal_minors(axial_matrix)
    assert minors["0"].sign() > 0 and minors["01"].sign() > 0 and minors["012"] == Field()

    # At u=1 the same test vector already becomes strictly negative beyond the endpoint.
    twice_k = [-V, 2, -2]
    difference = sum(twice_k[i] * block[i][j] * twice_k[j]
                     for i, j in product(range(3), repeat=2)) - 8 * CLEAR * V**2 * (7 - 2 * V**2)
    axial_coefficients = {}
    for (_, v_power), value in difference.terms.items():
        axial_coefficients[v_power] = axial_coefficients.get(v_power, 0) + value
    assert all(value == 0 for value in axial_coefficients.values())

    # E199 sparse RREF basis specialized at t^2 = 7/2; see E219 audit.
    p = Fraction(16, 11) * inv_t
    r = Fraction(5, 11) * inv_t
    u199 = Fraction(8, 3) * inv_t
    v199 = Fraction(5, 6) * inv_t
    w199 = Fraction(11, 6) * inv_t
    basis_off_free = {
        6: {2: -1, 5: -1}, 7: {0: -1, 1: 1},
        10: {3: p, 9: r}, 11: {3: r, 9: p}, 12: {4: inv_t, 8: inv_t},
        13: {0: -u199, 1: v199}, 14: {2: -u199, 5: -w199},
        15: {4: r, 8: -p}, 16: {4: p, 8: -r}, 17: {3: inv_t, 9: -inv_t},
        18: {2: -v199, 5: w199}, 19: {0: v199, 1: -u199},
    }
    basis = {j: {**entries, j: 1} for j, entries in basis_off_free.items()}
    half = Fraction(1, 2)
    combinations_199 = [({14: 1, 18: 1, 6: -t * half}, 1, Field(1)),
                        ({13: 1, 19: -1, 7: -t * half}, 0, Field(-1)),
                        ({10: half, 11: -half, 17: half}, 2, inv_t),
                        ({16: half, 15: -half, 12: half}, 3, -inv_t)]
    for coefficients, axis, scale in combinations_199:
        x = unpack([sum(f * basis[j].get(i, 0) for j, f in coefficients.items())
                    for i in range(20)])
        for a, (i, j) in product(AXES, EDGES):
            z = sum(J[i][a][b] * J[j][b][c] * x[c][i][j]
                    for b, c in product(AXES, repeat=2))
            assert Field() + z == (scale * k[EDGES.index((i, j))] if a == axis else Field())

    return {"parameters_a_b": [1, 0], "M": [[z.pairs() for z in row] for row in axial_matrix],
            "edge_radical_generator": [z.pairs() for z in k], "scalar_inertia_pos_zero_neg": [2, 1, 0],
            "full_inertia_pos_zero_neg": [8, 4, 0],
            "E199_vectors_8_axes_1_based": [axis + 1 for _, axis, _ in combinations_199],
            "E199_vectors_8_scales_of_generator": [scale.pairs() for _, _, scale in combinations_199],
            "axial_identity": "(-v/2,1,-1)^T G(1,v) (-v/2,1,-1) = v^2*(7-2*v^2)"}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--screen-only", action="store_true")
    args = parser.parse_args()
    block = scalar_block()
    result = {"field_pairs": "[rational, radical] for rational+radical*sqrt(14)",
              "edge_order": EDGE_NAMES, "screen": screen(block)}
    if not args.screen_only and "counterexample" not in result["screen"]:
        certificate = continuum(block)
        result["certificate"] = {"leaves_per_minor": 1, "subdivision_depth_a_b": [0, 0],
                                 "elevation_a_b": [0, 0], "leading_minors": certificate}
        if all(entry["coefficient_sign_counts_positive_zero_negative"][2] == 0
               for entry in certificate.values()):
            assert certificate["0"]["zero_strata_a_b"] == certificate["01"]["zero_strata_a_b"] == []
            assert certificate["012"]["zero_strata_a_b"] == [[["1", "1"], ["0", "0"]]]
            result["status"] = "full region certified"
            result["endpoint"] = check_axial_endpoint(block)
        else:
            result["status"] = "inconclusive at natural degree"
    print(json.dumps(result, indent=2))


if __name__ == "__main__":
    main()
