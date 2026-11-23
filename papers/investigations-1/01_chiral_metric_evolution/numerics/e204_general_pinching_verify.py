#!/usr/bin/env python3
"""Verify E202's full form and inverse Bernstein expansion independently."""

import json
import sys
from collections import defaultdict
from fractions import Fraction as F
from itertools import combinations, combinations_with_replacement, product
from math import comb, lcm
from pathlib import Path

sys.dont_write_bytecode = True
from e189_stationary_kernel_verify import (
    BASE, INTERNAL, SIGMA, TRIPLES, WEDGES, action, bianchi_matrices,
    bracket_with_sigma, components, cross_matrix, form_sum, hodge,
    one_form_tuple, permutation_sign, scaled, wedge,
)


HERE = Path(__file__).resolve().parent
EDGES = tuple(combinations(INTERNAL, 2))
LABELS = tuple(product(BASE, range(len(EDGES))))
ONCE = tuple((a,) for a in BASE)

# The cleared full Gram has degree at most 15 separately in u and v.
# Both node sets and their entire Cartesian product lie in the test triangle.
FIRST_AXIS = tuple(1 + F(i, 60) for i in range(16))
SECOND_AXIS = tuple(F(5, 4) + F(i, 60) for i in range(16))


def clear(u, v):
    return 12 * (u * v)**3 * (1 + u) * (1 + v) * (u + v)


def check_coframe():
    columns = [[hodge(WEDGES[a][i]) for a in BASE] for i in INTERNAL]
    matrices = [list(zip(*(components((c,), ONCE) for c in cols))) for cols in columns]
    for i, sigma in enumerate(SIGMA):
        assert hodge(sigma) == sigma
        for j, other in enumerate(SIGMA):
            assert wedge(sigma, other) == ({tuple(BASE): 2} if i == j else {})
    for i, j in product(INTERNAL, repeat=2):
        for a in BASE:
            unit = tuple(F(a == b) for b in BASE)
            value = action(matrices[i], action(matrices[j], unit))
            if i == j:
                assert value == tuple(-x for x in unit)
            else:
                k = 3 - i - j
                sign = permutation_sign((i, j, k))
                assert value == tuple(sign * x for x in action(matrices[k], unit))
    return matrices


def exterior_row(arrays, i):
    return form_sum(scaled(arrays[a][i][j], WEDGES[a][j])
                    for a, j in product(BASE, INTERNAL))


def scaled_fields(d, factor, direction, edge, bianchi_inverse, quaternion):
    """Recover H, X, and Xi for L times one kernel basis vector."""
    i, j = EDGES[edge]
    unit = tuple(F(a == direction) for a in BASE)
    off = action(quaternion[i], action(quaternion[j], unit))
    h = [[[F(0) for _ in INTERNAL] for _ in INTERNAL] for _ in BASE]
    h[direction][i][i] = factor * d[j] / d[i]
    h[direction][j][j] = -factor * d[i] / d[j]
    for a, value in enumerate(off):
        h[a][i][j] = h[a][j][i] = -factor * value

    trace = [sum(array[k][k] for k in INTERNAL) / 3 for array in h]
    x = [[[h[a][k][l] - (trace[a] if k == l else 0) for l in INTERNAL]
          for k in INTERNAL] for a in BASE]
    total = sum(di * di for di in d)
    for a in BASE:
        assert sum(x[a][k][k] for k in INTERNAL) == 0
        assert sum(d[k]**2 * h[a][k][k] for k in INTERNAL) == 0
        shift = sum(d[k]**2 * x[a][k][k] for k in INTERNAL) / total
        assert all(h[a][k][l] == x[a][k][l] - (shift if k == l else 0)
                   for k, l in product(INTERNAL, repeat=2))
    for other, (k, l) in enumerate(EDGES):
        recovered = action(quaternion[k], action(quaternion[l], [x[a][k][l] for a in BASE]))
        assert recovered == tuple(factor * (other == edge) * value for value in unit)
    weights = [[[h[a][k][l] * d[l] for l in INTERNAL] for k in INTERNAL] for a in BASE]
    assert all(not exterior_row(weights, k) for k in INTERNAL)

    y = [[[x[a][k][l] / (d[k] + d[l]) for l in INTERNAL] for k in INTERNAL] for a in BASE]
    assert all((d[k] + d[l]) * y[a][k][l] == x[a][k][l]
               for a, k, l in product(BASE, INTERNAL, INTERNAL))
    # This unknown is lambda*L*b. Use the unstarred three-form solve.
    rhs = [scaled(-1 / d[k], exterior_row(y, k)) for k in INTERNAL]
    b = action(bianchi_inverse, components(rhs, TRIPLES))
    assert bracket_with_sigma(one_form_tuple(b)) == rhs
    xi = []
    for a in BASE:
        adjoint = cross_matrix(*(b[4 * k + a] for k in INTERNAL))
        matrix = [[2 * (d[l] - d[k]) * y[a][k][l] + 4 * d[k] * d[l] * adjoint[k][l]
                   for l in INTERNAL] for k in INTERNAL]
        assert all(matrix[k][l] == -matrix[l][k] for k, l in product(INTERNAL, repeat=2))
        xi.append(matrix)
    return h, x, xi


def polarized_full(d, first, second):
    """Polarization of R/lambda with the scaled input coordinates."""
    h1, x1, xi1 = first
    h2, x2, xi2 = second
    principal = 4 * sum(d[i]**2 * h1[a][i][j] * h2[a][i][j]
                        for a, i, j in product(BASE, INTERNAL, INTERNAL))
    correction = sum((d[i]**2 - d[j]**2) *
                     (x1[a][i][j] * xi2[a][i][j] + x2[a][i][j] * xi1[a][i][j])
                     for a, (i, j) in product(BASE, EDGES))
    return principal + correction


def reduced_clear_block(u, v):
    """Compute 2*L*G directly by the edge scalar formula at one node."""
    d = (F(1), u, v)
    factor = clear(u, v)
    incidence = ((u, v, F(0)), (-F(1), F(0), v), (F(0), -F(1), -u))
    diagonal = [[value / d[i] for value in row] for i, row in enumerate(incidence)]
    means = [sum(row[p] for row in diagonal) / 3 for p in INTERNAL]
    scaled_s = []
    for i in INTERNAL:
        row = []
        for p, (j, k) in enumerate(EDGES):
            entry = (means[p] - diagonal[i][p]) * factor / (2 * d[i]**2)
            if i == j:
                entry += factor / (d[j] * (d[j] + d[k]))
            elif i == k:
                entry -= factor / (d[k] * (d[j] + d[k]))
            row.append(entry)
        scaled_s.append(row)

    skew = []
    for i, j in EDGES:
        k = 3 - i - j
        weight = (d[j]**2 - d[i]**2) * d[i] * d[j]
        skew.append([weight * (2 * scaled_s[k][p] - sum(row[p] for row in scaled_s))
                     for p in INTERNAL])
    return [[2 * factor * (sum(row[p] * row[q] for row in incidence)
                            + (2 * d[i] * d[j] if p == q else 0))
             - skew[p][q] - skew[q][p]
             for q in INTERNAL] for p, (i, j) in enumerate(EDGES)]


def evaluation(polynomial, u, v):
    return sum(value * u**i * v**j for (i, j), value in polynomial.items())


def read_power_block(data):
    matrix = []
    for row in data["matrix_polynomial_terms_u_v_coefficient"]:
        parsed_row = []
        for terms in row:
            parsed = {(i, j): coefficient for i, j, coefficient in terms}
            assert len(parsed) == len(terms)
            assert all(type(coefficient) is int and coefficient != 0
                       and 0 <= i <= 9 and 0 <= j <= 9
                       for (i, j), coefficient in parsed.items())
            parsed_row.append(parsed)
        matrix.append(parsed_row)
    assert len(matrix) == 3 and all(len(row) == 3 for row in matrix)
    assert matrix == list(map(list, zip(*matrix)))
    return matrix


def verify_degree_nodes(matrix, inverse, quaternion):
    for u, v in product(FIRST_AXIS, SECOND_AXIS):
        assert 1 <= u <= v <= F(3, 2)
        d = (F(1), u, v)
        factor = clear(u, v)
        block = [[evaluation(entry, u, v) for entry in row] for row in matrix]
        assert block == reduced_clear_block(u, v)
        fields = [scaled_fields(d, factor, a, p, inverse, quaternion) for a, p in LABELS]
        for (row, (a, p)), (col, (b, q)) in product(enumerate(LABELS), repeat=2):
            actual = polarized_full(d, fields[row], fields[col])
            assert actual == (2 * factor * block[p][q] if a == b else 0), (u, v, a, p, b, q)


def signed_square_power(matrix, i, j, k, sign_j, sign_k):
    """Substitute by ordinary binomial expansion with exact fractions."""
    out = defaultdict(F)
    for polynomial, sign in ((matrix[i][i], 1), (matrix[i][j], sign_j), (matrix[i][k], sign_k)):
        for (p, q), coefficient in polynomial.items():
            for r, s in product(range(p + 1), range(q + 1)):
                out[r + s, r] += F(sign * coefficient * comb(p, r) * comb(q, s), 2**(r + s))
    return {power: value for power, value in out.items() if value}


def inverse_bernstein(flat, n, m):
    """Recover the ordinary power coefficients from the Bernstein table."""
    result = {}
    for r, s in product(range(n + 1), range(m + 1)):
        value = comb(n, r) * comb(m, s) * sum(
            ((-1)**(r - i + s - j) * comb(r, i) * comb(s, j) * flat[i * (m + 1) + j])
            for i, j in product(range(r + 1), range(s + 1))
        )
        if value:
            result[r, s] = value
    return result


def verify_bernstein(matrix, data):
    cert = data["certificate"]
    records = cert["all_signed_row_polynomials"]
    assert len(records) == 12
    assert cert["degree_elevation"] == cert["rectangular_subdivisions"] == 0
    nodes = product(INTERNAL, (-1, 1), (-1, 1))
    minimums = []
    count = 0
    for (i, sign_j, sign_k), record in zip(nodes, records):
        j, k = [col for col in INTERNAL if col != i]
        assert record["row_0_based"] == i and record["off_columns_0_based"] == [j, k]
        assert record["signs"] == [sign_j, sign_k]
        expected = signed_square_power(matrix, i, j, k, sign_j, sign_k)
        n = max(a for a, _ in expected)
        m = max(b for _, b in expected)
        assert record["degrees_a_b"] == [n, m] == [14, (9, 8, 9)[i]]
        nums = record["numerators_a_major_b_minor"]
        denominator = record["common_denominator"]
        assert denominator == (3099672576, 3444080640, 1549836288)[i]
        assert len(nums) == (n + 1) * (m + 1)
        assert all(type(value) is int and value > 0 for value in nums)
        flat = [F(value, denominator) for value in nums]
        assert lcm(*(value.denominator for value in flat)) == denominator
        assert inverse_bernstein(flat, n, m) == expected
        minimum = min(flat)
        assert F(record["min_coefficient"]) == minimum
        minimums.append(minimum)
        count += len(flat)
    assert count == 1740
    minimum = min(minimums)
    assert minimum == F(cert["minimum_coefficient_over_all_12_row_polynomials"]) == 384
    assert minimums == [768, 384, 1152, 768, 384, 768, 768, 1152, 768, 1152, 384, 768]
    bound = clear(F(3, 2), F(3, 2))
    assert bound == F(cert["max_CLEAR"]) == F(164025, 64)
    coefficient = 4 * F(6, 11) * minimum / (2 * bound * 11)
    recorded = F(cert["uniform_R_lower_bound_coefficient_times_Frobenius_norm_squared"])
    assert coefficient == recorded == F(32768, 2205225)


def verify_supplementary_grid(data):
    records = data["six_grid_checks"]
    expected = list(combinations_with_replacement((F(1), F(5, 4), F(3, 2)), 2))
    assert len(records) == len(expected) == 6
    for record, (u, v) in zip(records, expected):
        assert (F(record["u"]), F(record["v"])) == (u, v)
        block = [[entry / (2 * clear(u, v)) for entry in row] for row in reduced_clear_block(u, v)]
        assert [list(map(F, row)) for row in record["G"]] == block
        gaps = [block[i][i] - sum(abs(value) for j, value in enumerate(row) if j != i)
                for i, row in enumerate(block)]
        assert gaps == list(map(F, record["diagonal_dominance_gaps"])) and min(gaps) > 0


def main():
    data = json.loads((HERE / "e202_general_stationary_pinching_results.json").read_text())
    assert data["edge_order"] == ["12", "13", "23"]
    matrix = read_power_block(data)
    verify_bernstein(matrix, data)
    print("All 1740 Bernstein coefficients invert to the exact signed-row polynomials.", flush=True)
    quaternion = check_coframe()
    verify_degree_nodes(matrix, bianchi_matrices(), quaternion)
    print("The 16×16 exact node test certifies the full 144 entries over the triangle.", flush=True)
    verify_supplementary_grid(data)
    print("All six supplementary grid records agree.")


if __name__ == "__main__":
    main()
