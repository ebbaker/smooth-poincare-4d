#!/usr/bin/env python3
"""Exact rational-function certificates for the E199 axial family."""

import json
import sys
from fractions import Fraction as F
from itertools import permutations
from pathlib import Path

sys.dont_write_bytecode = True
from e187_stationary_kernel import C, act, coframe_sum, epsilon, eta, unpack


def polynomial(values):
    values = list(map(F, values))
    while values and not values[-1]:
        values.pop()
    return tuple(values)


def add(a, b):
    return polynomial((a[i] if i < len(a) else 0) + (b[i] if i < len(b) else 0)
                      for i in range(max(len(a), len(b))))


def scale(a, k):
    return polynomial(x * k for x in a)


def multiply(a, b):
    if not a or not b:
        return ()
    out = [F(0)] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            out[i + j] += x * y
    return polynomial(out)


def division(a, b):
    assert b
    a = list(a)
    quotient = [F(0)] * max(0, len(a) - len(b) + 1)
    while len(a) >= len(b):
        offset = len(a) - len(b)
        term = a[-1] / b[-1]
        quotient[offset] = term
        for j, coeff in enumerate(b):
            a[offset + j] -= term * coeff
        while a and not a[-1]:
            a.pop()
    return polynomial(quotient), tuple(a)


def gcd(a, b):
    while b:
        a, b = b, division(a, b)[1]
    return scale(a, 1 / a[-1]) if a else ()


def evaluate(a, t):
    value = F(0)
    for coeff in reversed(a):
        value = value * t + coeff
    return value


ONE = (F(1),)


class Rational:
    """A reduced rational function over Q with monic denominator."""

    def __init__(self, num=0, den=ONE):
        self.num = polynomial(num if isinstance(num, tuple) else (num,))
        self.den = polynomial(den)
        assert self.den
        if not self.num:
            self.den = ONE
        elif len(self.den) > 1:
            common = gcd(self.num, self.den)
            self.num = division(self.num, common)[0]
            self.den = division(self.den, common)[0]
        k = 1 / self.den[-1]
        self.num, self.den = scale(self.num, k), scale(self.den, k)

    @staticmethod
    def lift(value):
        return value if isinstance(value, Rational) else Rational(value)

    def __bool__(self):
        return bool(self.num)

    def __eq__(self, other):
        other = self.lift(other)
        return self.num == other.num and self.den == other.den

    def __neg__(self):
        return Rational(scale(self.num, -1), self.den)

    def __add__(self, other):
        other = self.lift(other)
        if not self:
            return other
        if not other:
            return self
        if self.den == other.den:
            return Rational(add(self.num, other.num), self.den)
        return Rational(add(multiply(self.num, other.den), multiply(other.num, self.den)),
                        multiply(self.den, other.den))

    __radd__ = __add__

    def __sub__(self, other):
        return self + -self.lift(other)

    def __rsub__(self, other):
        return self.lift(other) + -self

    def __mul__(self, other):
        other = self.lift(other)
        if not self or not other:
            return Rational()
        return Rational(multiply(self.num, other.num), multiply(self.den, other.den))

    __rmul__ = __mul__

    def __truediv__(self, other):
        other = self.lift(other)
        assert other
        return Rational(multiply(self.num, other.den), multiply(self.den, other.num))

    def __rtruediv__(self, other):
        return self.lift(other) / self

    def at(self, t):
        return evaluate(self.num, t) / evaluate(self.den, t)

T = Rational((0, 1))
D = (Rational(1), Rational(1), T)
S = T * T
SCALE = 3 / (2 + S)
EIG = [SCALE * d * d for d in D]
P = 4 * S * S + 13 * S - 2
L = 7 - 2 * S
I3 = range(3)
I4 = range(4)
I20 = range(20)


def recovered(vector):
    x = unpack(vector)
    trace = [sum(EIG[i] * x[a][i][i] for i in I3) for a in I4]
    velocity = coframe_sum([[[-4 * D[k] * (x[a][i][k] - (trace[a] / 3 if i == k else 0))
                             for k in I3] for i in I3] for a in I4])
    y = [[[x[a][i][j] / (D[i] + D[j]) for j in I3] for i in I3] for a in I4]
    assert all((D[i] + D[j]) * y[a][i][j] == x[a][i][j]
               for a in I4 for i in I3 for j in I3)
    p = [[[y[a][i][j] / (SCALE * D[i]) for j in I3] for i in I3] for a in I4]
    torsion = [-value for value in coframe_sum(p)]
    b = [(v + z) / 2 for v, z in zip(act(C, torsion), torsion)]
    cb = act(C, b)
    assert cb == torsion
    assert all(term + SCALE * D[i // 4] * cb[i] == 0
               for i, term in enumerate(coframe_sum(y)))
    xi = [[[2 * y[a][i][j] * (D[j] - D[i]) + 4 * SCALE * D[i] * D[j] *
            sum(b[4 * k + a] * epsilon(k, j, i) for k in I3)
            for j in I3] for i in I3] for a in I4]
    assert all(xi[a][i][j] == -xi[a][j][i] for a in I4 for i in I3 for j in I3)
    lx = [[[2 * (EIG[i] + EIG[j]) * x[a][i][j]
            - (4 * trace[a] * EIG[i] / 3 if i == j else 0)
            for j in I3] for i in I3] for a in I4]
    return velocity, x, lx, xi


def reduce_rows(matrix):
    rows = [v[:] for v in matrix]
    origins = list(range(len(rows)))
    pivots = []
    minor = Rational(1)
    for col in range(len(rows[0])):
        row = len(pivots)
        found = next((j for j in range(row, len(rows)) if rows[j][col]), None)
        if found is None:
            continue
        rows[row], rows[found] = rows[found], rows[row]
        origins[row], origins[found] = origins[found], origins[row]
        pivot = rows[row][col]
        minor *= pivot
        rows[row] = [value / pivot for value in rows[row]]
        for j in range(len(rows)):
            if j != row and rows[j][col]:
                factor = rows[j][col]
                rows[j] = [a - factor * b for a, b in zip(rows[j], rows[row])]
        pivots.append(col)
    return rows, pivots, origins[:len(pivots)], minor


def gram(vectors):
    data = [recovered(v) for v in vectors]
    assert all(not any(speed) for speed, _, _, _ in data)

    def mixed(x, lx, xi):
        return sum(x[a][i][j] * lx[a][i][j] - (EIG[i] - 1) *
                   (x[a][i][j] * xi[a][j][i] - xi[a][i][j] * x[a][j][i])
                   for a in I4 for i in I3 for j in I3)

    h = [[mixed(x, ly, xi) for _, _, ly, xi in data] for _, x, _, _ in data]
    return [[(h[i][j] + h[j][i]) / 2 for j in range(len(h))] for i in range(len(h))]


def determinant(matrix):
    n = len(matrix)
    value = Rational()
    for sigma in permutations(range(n)):
        inversions = sum(sigma[i] > sigma[j] for i in range(n) for j in range(i + 1, n))
        term = Rational((-1) ** inversions)
        for i, j in enumerate(sigma):
            term *= matrix[i][j]
        value += term
    return value


def build():
    units = [[Rational(i == j) for i in I20] for j in I20]
    velocity_columns = [recovered(v)[0] for v in units]
    assert all(sum(D[i] * eta(i, a, b) * column[4 * i + a] for i in I3 for a in I4) == 0
               for column in velocity_columns for b in I4)
    velocity = list(map(list, zip(*velocity_columns)))
    rows, pivots, minor_rows, minor = reduce_rows(velocity)
    assert pivots == [0, 1, 2, 3, 4, 5, 8, 9]
    assert minor_rows == [3, 6, 2, 1, 5, 7, 0, 4]
    fixed_minor = [[velocity[i][j] for j in pivots] for i in minor_rows]
    _, fixed_pivots, fixed_order, fixed_det = reduce_rows(fixed_minor)
    assert fixed_pivots == fixed_order == list(range(8))
    assert minor == fixed_det == 589824 * S * S * S * S / ((S + 2) * (S + 2))
    free = [i for i in I20 if i not in pivots]
    basis = []
    for col in free:
        v = units[col][:]
        for row, i in enumerate(pivots):
            v[i] = -rows[row][col]
        assert not any(act(velocity, v))
        assert [v[i] for i in free] == [int(i == col) for i in free]
        basis.append(v)
    assert_regular_denominators(velocity)
    assert_regular_denominators(basis)
    check_displayed_basis(basis, free)
    g = gram(basis)
    assert g == list(map(list, zip(*g)))
    groups = ((0, 6, 10), (1, 5, 11), (2, 3, 9), (8, 7, 4))
    assert sorted(i for group in groups for i in group) == list(range(12))
    for a, group in enumerate(groups):
        for other in groups[a + 1:]:
            assert all(not g[i][j] for i in group for j in other)
    blocks = [[[g[i][j] for j in group] for i in group] for group in groups]
    return pivots, free, minor_rows, minor, basis, g, groups, blocks


def check_displayed_basis(basis, free):
    p, r = (1 + 2 * S) / (T * (S + 2)), (S - 1) / (T * (S + 2))
    u, v, w = (1 + 2 * S) / (3 * T), (S - 1) / (3 * T), (S + 2) / (3 * T)
    additions = {6: {2: -1, 5: -1}, 7: {0: -1, 1: 1}, 10: {3: p, 9: r},
                 11: {3: r, 9: p}, 12: {4: 1 / T, 8: 1 / T}, 13: {0: -u, 1: v},
                 14: {2: -u, 5: -w}, 15: {4: r, 8: -p}, 16: {4: p, 8: -r},
                 17: {3: 1 / T, 9: -1 / T}, 18: {2: -v, 5: w}, 19: {0: v, 1: -u}}
    assert [[Rational.lift(additions[j].get(i, int(i == j))) for i in I20]
            for j in free] == basis


def assert_regular_denominators(table):
    # All normalized denominators are nonzero, monic, and coefficientwise nonnegative.
    assert all(all(c >= 0 for c in Rational.lift(x).den) for row in table for x in row)


def matmul(a, b):
    return [act(list(zip(*b)), row) for row in a]


def diagonal(values):
    return [[entry if i == j else Rational() for j in range(len(values))]
            for i, entry in enumerate(values)]


def congruences(basis, groups, blocks):
    transform_a = [[1, -(S + 2) / (3 * T), -T / 2], [0, 1, 1], [0, -1, 1]]
    transform_b = [[1, 0, -T / 2], [0, 1, 1], [0, 1, -1]]
    transform_c = [[1, 1, F(1, 2)], [-1, 1, F(-1, 2)], [-1, 0, F(1, 2)]]
    transforms = [transform_a, transform_b, transform_c, transform_c]
    positive = 48 / (S + 2)
    axial = [positive, 8 * P / (S * (S + 2)), 12 * S * L / (S + 2)]
    other = [positive, 72 * P / ((S + 2) * (S + 2) * (S + 2)), 12 * L / (S + 2)]
    diagonals = [axial, axial, other, other]
    vectors = []
    for block, group, change, values in zip(blocks, groups, transforms, diagonals):
        assert determinant(change) in (2, -2)
        assert_regular_denominators(block)
        assert_regular_denominators(change)
        assert_regular_denominators([values])
        change_transpose = list(zip(*change))
        assert matmul(matmul(change_transpose, block), change) == diagonal(values)
        # Rows are original 20-coordinate vectors, one for each new basis direction.
        vectors.append(matmul(change_transpose, [basis[i] for i in group]))
        assert_regular_denominators(vectors[-1])
    assert gram([v for block in vectors for v in block]) == diagonal(
        [p for block in diagonals for p in block])
    return transforms, diagonals, vectors


def inertia(values):
    return [sum(p > 0 for p in values), sum(p == 0 for p in values), sum(p < 0 for p in values)]


def sample_checks(pivots, free, basis, restricted, diagonals):
    file = Path(__file__).with_name("e187_stationary_kernel_results.json")
    cases = json.loads(file.read_text())["cases"]
    assert [c["t"] for c in cases] == ["1/8", "1/4", "1/2", "1", "2", "4", "8"]
    summary = []
    for case in cases:
        t = F(case["t"])
        assert pivots == case["rref_pivot_columns_0_based"]
        assert free == case["rref_free_columns_0_based"]
        assert [v.at(t) for v in EIG] == list(map(F, case["Q_eigenvalues"]))
        assert [[x.at(t) for x in v] for v in basis] == [list(map(F, v)) for v in case["kernel_basis_vectors"]]
        assert [[x.at(t) for x in v] for v in restricted] == [list(map(F, v)) for v in case["restricted_gram"]]
        counts = inertia([p.at(t) for block in diagonals for p in block])
        assert counts == [case["inertia"][key] for key in ("positive", "zero", "negative")]
        summary.append({"t": case["t"], "inertia": counts})
    return summary


def function_data(x):
    x = Rational.lift(x)
    return {"num": list(map(str, x.num)), "den": list(map(str, x.den))}


def sparse_vector(row):
    return {str(i): function_data(x) for i, x in enumerate(row) if x}


def main():
    for i in range(12):
        for j in range(12):
            assert C[i][j] == C[j][i]
            assert sum(C[i][k] * C[k][j] for k in range(12)) == 2 * (i == j) - C[i][j]
    pivots, free, rows, minor, basis, g, groups, blocks = build()
    changes, values, vectors = congruences(basis, groups, blocks)
    sign_p = [P.at(t) for t in (F(1, 3), F(2, 5))]
    sign_l = [L.at(t) for t in (F(9, 5), F(2))]
    assert P.num == polynomial((-2, 0, 13, 0, 4)) and P.den == ONE
    assert L.num == polynomial((7, 0, -2)) and L.den == ONE
    assert sign_p[0] < 0 < sign_p[1] and sign_l[1] < 0 < sign_l[0]
    assert F(2, 5) < F(9, 5)
    det_axial = F(1152) * P * L / ((S + 2) * (S + 2) * (S + 2))
    det_other = F(10368) * P * L / ((S + 2) * (S + 2) * (S + 2) * (S + 2) * (S + 2))
    assert [determinant(b) for b in blocks] == [det_axial, det_axial, det_other, det_other]
    output = {
        "parameter": "t>0; s=t^2",
        "polynomial_coefficients": "ascending degrees in t; empty numerator is zero; monic denominator",
        "coordinates": "zero-based axis-major (X11,X22,X12,X13,X23), X33=-X11-X22",
        "constraint_rank": 8,
        "kernel_dimension": 12,
        "minor": {"rows_in_order": rows, "columns_in_order": pivots,
                  "determinant": "589824*t^8/(t^2+2)^2", "coefficients": function_data(minor)},
        "kernel_basis_by_free_column": {str(j): sparse_vector(v) for j, v in zip(free, basis)},
        "blocks": [{"free_columns_in_order": [free[i] for i in group],
                    "gram": [[function_data(x) for x in row] for row in block],
                    "change_columns_in_block_basis": [list(map(function_data, row)) for row in zip(*change)],
                    "change_determinant": str(determinant(change).at(F(1))),
                    "congruence_diagonal": list(map(function_data, diagonal_values)),
                    "congruence_vectors_original_coordinates": [sparse_vector(v) for v in vv]}
                   for group, block, change, diagonal_values, vv in zip(groups, blocks, changes, values, vectors)],
        "low_transition": {"root": "sqrt((sqrt(201)-13)/8)", "polynomial_in_s": "4*s^2+13*s-2",
                           "isolating_interval_in_t": ["1/3", "2/5"],
                           "endpoint_values": list(map(str, sign_p)), "nullity": 4,
                           "kernel_vectors_evaluate_at_root": [sparse_vector(v[1]) for v in vectors]},
        "high_transition": {"root": "sqrt(7/2)", "polynomial_in_s": "7-2*s",
                            "isolating_interval_in_t": ["9/5", "2"],
                            "endpoint_values": list(map(str, sign_l)), "nullity": 4,
                            "kernel_vectors_evaluate_at_root": [sparse_vector(v[2]) for v in vectors]},
        "inertia_order": ["positive", "zero", "negative"],
        "positive_root_count": {"P": "one by P'(s)=8*s+13>0 and the bracketing signs",
                                "L": "one by L'(s)=-2 and the bracketing signs"},
        "inertia_regimes": [["below low transition", [8, 0, 4]],
                            ["low transition", [8, 4, 0]],
                            ["open middle interval", [12, 0, 0]],
                            ["high transition", [8, 4, 0]],
                            ["above high transition", [8, 0, 4]]],
        "E187_exact_sample_checks": sample_checks(pivots, free, basis, g, values),
        "symbolic_bianchi_rank_congruence_and_denominator_checks": True,
    }
    print(json.dumps(output, separators=(",", ":")))


if __name__ == "__main__":
    main()
