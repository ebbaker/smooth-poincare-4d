#!/usr/bin/env python3
"""Exact E202 certificate on 1 <= u <= v <= 3/2.

Only standard-library arithmetic is used. The transported quaternionic
basis reduces the quadratic form to four copies of one scalar 3x3 block.
Signed row sums of a polynomial multiple of that block are certified
positive by tensor-product Bernstein coefficients.
"""

import json
import sys
from fractions import Fraction
from itertools import combinations, combinations_with_replacement, product
from math import comb, lcm

sys.dont_write_bytecode = True
from e187_stationary_kernel import C, epsilon, eta, run_case, unpack

INTERNAL = range(3)
AXES = range(4)
EDGES = tuple(combinations(INTERNAL, 2))


class Polynomial:
    """Sparse integer polynomial in two variables."""

    def __init__(self, terms=0):
        if isinstance(terms, int):
            terms = {(0, 0): terms}
        self.terms = {power: coefficient for power, coefficient in terms.items()
                      if coefficient}

    def __add__(self, other):
        if isinstance(other, int):
            other = Polynomial(other)
        terms = self.terms.copy()
        for power, coefficient in other.terms.items():
            terms[power] = terms.get(power, 0) + coefficient
        return Polynomial(terms)

    __radd__ = __add__

    def __neg__(self):
        return Polynomial({power: -coefficient for power, coefficient in self.terms.items()})

    def __sub__(self, other):
        return self + -other

    def __rsub__(self, other):
        return -self + other

    def __mul__(self, other):
        if isinstance(other, int):
            other = Polynomial(other)
        terms = {}
        for (a, b), first in self.terms.items():
            for (c, d), second in other.terms.items():
                power = (a + c, b + d)
                terms[power] = terms.get(power, 0) + first * second
        return Polynomial(terms)

    __rmul__ = __mul__

    def __pow__(self, degree):
        result = ONE
        for _ in range(degree):
            result *= self
        return result

    def __eq__(self, other):
        if isinstance(other, int):
            other = Polynomial(other)
        return self.terms == other.terms

    def exact_divide(self, divisor):
        """Divide by a known polynomial factor using lexicographic long division."""
        if isinstance(divisor, int):
            divisor = Polynomial(divisor)
        remainder = self
        quotient = ZERO
        degree = max(divisor.terms)
        leading = divisor.terms[degree]
        while remainder.terms:
            power = max(remainder.terms)
            exponent = tuple(p - d for p, d in zip(power, degree))
            coefficient, integer_remainder = divmod(remainder.terms[power], leading)
            assert min(exponent) >= 0 and integer_remainder == 0
            term = Polynomial({exponent: coefficient})
            quotient += term
            remainder -= divisor * term
        return quotient

    def evaluate(self, u, v):
        return sum(coefficient * u**i * v**j
                   for (i, j), coefficient in self.terms.items())

    def coefficients(self):
        return [[i, j, n] for (i, j), n in sorted(self.terms.items())]


ZERO = Polynomial()
ONE = Polynomial(1)
U = Polynomial({(1, 0): 1})
V = Polynomial({(0, 1): 1})
D = (ONE, U, V)
T = sum(d**2 for d in D)
CLEAR = 12 * (U * V)**3 * (1 + U) * (1 + V) * (U + V)

# J_i[b,a] = Sigma_i[a,b], so a matrix column is J_i acting on a covector.
J = [[[eta(i, a, b) for a in AXES] for b in AXES] for i in INTERNAL]


def check_quaternions():
    for i, j, a, b in product(INTERNAL, INTERNAL, AXES, AXES):
        value = sum(J[i][b][k] * J[j][k][a] for k in AXES)
        assert value == -int(i == j and a == b) + sum(
            epsilon(i, j, k) * J[k][b][a] for k in INTERNAL)
    for i, j in product(range(12), repeat=2):
        assert C[i][j] == C[j][i]
        assert sum(C[i][k] * C[k][j] for k in range(12)) == 2 * (i == j) - C[i][j]


def scalar_block():
    """M = 2*CLEAR*G for R/(4*c^2) = sum_axis Z_axis^t G Z_axis."""
    # h_i = d_i H_ii, with one row per internal diagonal and edge column.
    h = [[D[j] * int(k == i) - D[k] * int(j == i)
          for k, j in EDGES] for i in INTERNAL]
    diag = [[h[i][p] * CLEAR.exact_divide(D[i]) for p in INTERNAL] for i in INTERNAL]
    mean = [sum(diag[i][p] for i in INTERNAL).exact_divide(3) for p in INTERNAL]
    scaled_s = []
    for i in INTERNAL:
        row = []
        for p, (j, k) in enumerate(EDGES):
            value = (mean[p] - diag[i][p]).exact_divide(2 * D[i]**2)
            if i == j or i == k:
                other = k if i == j else j
                weight = CLEAR.exact_divide(D[i] * (D[i] + D[other]))
                value += weight if i == j else -weight
            row.append(value)
        scaled_s.append(row)

    skew = []
    for i, j in EDGES:
        k = 3 - i - j
        weight = (D[j]**2 - D[i]**2) * D[i] * D[j]
        skew.append([weight * (2 * scaled_s[k][p] - sum(row[p] for row in scaled_s))
                     for p in INTERNAL])

    block = []
    for p, (i, j) in enumerate(EDGES):
        row = []
        for q in INTERNAL:
            principal = sum(h[k][p] * h[k][q] for k in INTERNAL)
            if p == q:
                principal += 2 * D[i] * D[j]
            row.append(2 * CLEAR * principal - skew[p][q] - skew[q][p])
        block.append(row)
    assert block == list(map(list, zip(*block)))
    return block


def coframe(tensors):
    """Components of sum_{a,j} J_j dx^a tensors[a][i][j], with internal row first."""
    return [sum(J[j][b][a] * tensors[a][i][j] for a in AXES for j in INTERNAL)
            for i in INTERNAL for b in AXES]


def reconstruct_basis(direction, edge):
    """Reconstruct CLEAR-scaled fields using the unsimplified E187 formulas."""
    i, j = EDGES[edge]
    # H_ij = -J_i J_j Z_ij and H_kk = sum_l d_l Z_kl / d_k.
    h = [[[ZERO for _ in INTERNAL] for _ in INTERNAL] for _ in AXES]
    h[direction][i][i] = D[j] * CLEAR.exact_divide(D[i])
    h[direction][j][j] = -D[i] * CLEAR.exact_divide(D[j])
    for a in AXES:
        off = -sum(J[i][a][b] * J[j][b][direction] for b in AXES)
        h[a][i][j] = h[a][j][i] = off * CLEAR
    mean = [sum(h[a][k][k] for k in INTERNAL).exact_divide(3) for a in AXES]
    x = [[[h[a][k][l] - (mean[a] if k == l else ZERO) for l in INTERNAL]
          for k in INTERNAL] for a in AXES]
    for a in AXES:
        assert sum(x[a][k][k] for k in INTERNAL) == 0
        assert sum(D[k]**2 * x[a][k][k] for k in INTERNAL) == -T * mean[a]
    # The off-diagonal inverse recovers every Z basis coordinate.
    for p, (k, l) in enumerate(EDGES):
        recovered = [
            sum(J[k][a][b] * J[l][b][c] * x[c][k][l]
                for b, c in product(AXES, repeat=2))
            for a in AXES
        ]
        assert recovered == [CLEAR * int(a == direction and p == edge) for a in AXES]
    weighted_h = [[[D[l] * h[a][k][l] for l in INTERNAL] for k in INTERNAL] for a in AXES]
    assert coframe(weighted_h) == [0] * 12  # All components of the actual V/c vanish.

    y = [[[x[a][k][l].exact_divide(D[k] + D[l]) for l in INTERNAL]
          for k in INTERNAL] for a in AXES]
    assert all((D[k] + D[l]) * y[a][k][l] == x[a][k][l]
               for a, k, l in product(AXES, INTERNAL, INTERNAL))
    shifted_y = [[[y[a][k][l].exact_divide(D[k]) for l in INTERNAL]
                  for k in INTERNAL] for a in AXES]
    # z and b are scaled by CLEAR*c^2. Xi is scaled only by CLEAR.
    z = [-entry for entry in coframe(shifted_y)]
    b = [(z[i] + sum(c * p for c, p in zip(C[i], z))).exact_divide(2)
         for i in range(12)]
    cb = [sum(c * p for c, p in zip(row, b)) for row in C]
    assert cb == z
    assert all(y_i + D[i // 4] * cb[i] == 0 for i, y_i in enumerate(coframe(y)))

    xi = [[[2 * (D[l] - D[k]) * y[a][k][l] + 4 * D[k] * D[l] *
            sum(epsilon(m, l, k) * b[m * 4 + a] for m in INTERNAL)
            for l in INTERNAL] for k in INTERNAL] for a in AXES]
    assert all(xi[a][k][l] == -xi[a][l][k]
               for a, k, l in product(AXES, INTERNAL, INTERNAL))
    return h, x, xi


def mixed_first_form(left, right):
    """The unpolarized mixed form in original components, scaled by CLEAR^2/c^2."""
    _, x, _ = left
    h, _, xi = right
    return sum(D[i]**2 * (4 * x[a][i][j] * h[a][i][j]
                          - x[a][i][j] * xi[a][j][i]
                          + xi[a][i][j] * x[a][j][i])
               for a, i, j in product(AXES, INTERNAL, INTERNAL))


def check_full_block(block):
    labels = list(product(AXES, INTERNAL))
    reconstructed = {label: reconstruct_basis(*label) for label in labels}
    for left in labels:
        for right in labels:
            a, p = left
            b, q = right
            first = reconstructed[left]
            second = reconstructed[right]
            target = 4 * CLEAR * block[p][q] if a == b else ZERO
            assert mixed_first_form(first, second) + mixed_first_form(second, first) == target


def square_coordinates(poly):
    """Return integer power coefficients of 2^degree_a * P(1+ab/2, 1+a/2)."""
    total_degree = max(i + j for i, j in poly.terms)
    a = U
    b = V
    out = sum(coefficient * 2**(total_degree - i - j) * (2 + a * b)**i * (2 + a)**j
              for (i, j), coefficient in poly.terms.items())
    return out, total_degree


def bernstein(poly, degree_a, degree_b):
    terms = [(p, q, Fraction(c, comb(degree_a, p) * comb(degree_b, q)))
             for (p, q), c in poly.terms.items()]
    return [[sum(c * comb(i, p) * comb(j, q) for p, q, c in terms if p <= i and q <= j)
             for j in range(degree_b + 1)] for i in range(degree_a + 1)]


def signed_row_certificate(block):
    records = []
    for i in INTERNAL:
        j, k = (other for other in INTERNAL if other != i)
        for sign_j, sign_k in product((-1, 1), repeat=2):
            row = block[i][i] + sign_j * block[i][j] + sign_k * block[i][k]
            square_poly, power = square_coordinates(row)
            degree_a = max(p for p, _ in square_poly.terms)
            degree_b = max(q for _, q in square_poly.terms)
            assert max(degree_a, degree_b) <= 24
            coefficients = bernstein(square_poly, degree_a, degree_b)
            values = [Fraction(c, 2**power) for line in coefficients for c in line]
            minimum = min(values)
            # This certificate succeeds without degree elevation or subdivision.
            assert minimum > 0, (i, sign_j, sign_k, minimum)
            denominator = lcm(*(c.denominator for c in values))
            numerators = [int(c * denominator) for c in values]
            assert all(Fraction(n, denominator) == c > 0 for n, c in zip(numerators, values))
            records.append({"row_0_based": i, "off_columns_0_based": [j, k],
                            "signs": [sign_j, sign_k], "degrees_a_b": [degree_a, degree_b],
                            "min_coefficient": str(minimum), "common_denominator": denominator,
                            "numerators_a_major_b_minor": numerators})
    return records


def grid_checks(block):
    grid = (Fraction(1), Fraction(5, 4), Fraction(3, 2))
    checks = []
    for u, v in combinations_with_replacement(grid, 2):
        clear = CLEAR.evaluate(u, v)
        gram = [[entry.evaluate(u, v) / (2 * clear) for entry in row] for row in block]
        row_gaps = [gram[i][i] - sum(abs(gram[i][j]) for j in INTERNAL if j != i)
                    for i in INTERNAL]
        assert min(row_gaps) > 0
        checks.append({"u": u, "v": v, "G": gram, "diagonal_dominance_gaps": row_gaps})
    return checks


def check_round(block):
    result = run_case(Fraction(1))
    assert result["round_checks"]["full_form_equals_4_Frobenius"]
    gram = [[Fraction(entry.evaluate(1, 1), 2 * CLEAR.evaluate(1, 1))
             for entry in row] for row in block]
    axes_by_vector = []
    for kernel_vector in result["kernel_basis_vectors"]:
        x = unpack(kernel_vector)
        axes_by_vector.append([
            [sum(J[i][a][b] * J[j][b][c] * x[c][i][j] for b, c in product(AXES, repeat=2))
             for i, j in EDGES] for a in AXES])
    expected = result["restricted_gram"]
    for i, left in enumerate(axes_by_vector):
        for j, right in enumerate(axes_by_vector):
            assert 4 * sum(left[a][p] * gram[p][q] * right[a][q]
                           for a, p, q in product(AXES, INTERNAL, INTERNAL)) == expected[i][j]
    return result["round_checks"]


def main():
    check_quaternions()
    block = scalar_block()
    check_full_block(block)
    certificate = signed_row_certificate(block)
    minimum = min(Fraction(row["min_coefficient"]) for row in certificate)
    clear_max = CLEAR.evaluate(Fraction(3, 2), Fraction(3, 2))
    # c^2 >= 6/11 and the Frobenius norm squared of X is at most 11*||Z||^2.
    coercivity = 12 * minimum / (121 * clear_max)
    report = {
        "region": "1 <= u <= v <= 3/2; d=(1,u,v); c^2=3/(1+u^2+v^2)",
        "edge_order": ["12", "13", "23"],
        "identity": "R/(4*c^2)=sum_axis Z_axis^T G Z_axis; M=2*CLEAR*G",
        "clear": "12*(u*v)^3*(1+u)*(1+v)*(u+v)",
        "matrix_polynomial_terms_u_v_coefficient": [[p.coefficients() for p in row] for row in block],
        "polynomial_checks": {
            "quaternion_and_C_identities": True,
            "all_12_basis_sylvester_bianchi_velocity_and_Xi_checks": True,
            "off_diagonal_left_inverse_recovers_each_of_the_12_basis_vectors": True,
            "all_144_full_polarizations_equal_block_formula": True},
        "certificate": {
            "function": "M_ii + s_j*M_ij + s_k*M_ik at u=1+a*b/2, v=1+a/2",
            "degree_elevation": 0,
            "rectangular_subdivisions": 0,
            "minimum_coefficient_over_all_12_row_polynomials": minimum,
            "max_CLEAR": clear_max,
            "uniform_R_lower_bound_coefficient_times_Frobenius_norm_squared": coercivity,
            "all_signed_row_polynomials": certificate},
        "six_grid_checks": grid_checks(block),
        "round_checks": {**check_round(block), "all_E187_round_restricted_entries_agree": True},
    }
    print(json.dumps(report, default=str, indent=2))


if __name__ == "__main__":
    main()
