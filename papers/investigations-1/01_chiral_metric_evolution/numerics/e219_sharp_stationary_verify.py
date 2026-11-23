#!/usr/bin/env python3
"""Independent E219 verification of the E218 stationary certificate.

Reuse only the assessed E202 block and quaternion matrices. Substitute
in the block entries before taking minors by permutations. Invert the
Bernstein-to-power triangular expansion to obtain the Bernstein
coefficients, then check every power coefficient by expanding back.
"""

import json
import sys
from fractions import Fraction
from hashlib import sha256
from itertools import permutations, product
from math import comb, lcm
from pathlib import Path

sys.dont_write_bytecode = True
from e202_general_stationary_pinching import AXES, CLEAR, EDGES, J, scalar_block

ZERO = (0, 0)
ONE = (1, 0)
INTERNAL = range(3)


def add(x, y):
    return x[0] + y[0], x[1] + y[1]


def scale(x, s):
    return s * x[0], s * x[1]


def multiply(x, y):
    return x[0] * y[0] + 14 * x[1] * y[1], x[0] * y[1] + x[1] * y[0]


def sum_pairs(values):
    total = ZERO
    for value in values:
        total = add(total, value)
    return total


def field_sign(x):
    """Exact sign at the positive embedding sqrt(14)."""
    rational, radical = x
    if radical == 0:
        return (rational > 0) - (rational < 0)
    if rational == 0 or (rational > 0) == (radical > 0):
        return 1 if radical > 0 else -1
    dominant = rational**2 - 14 * radical**2
    # Opposite nonzero signs cannot cancel, since sqrt(14) is irrational.
    assert dominant != 0
    return 1 if (rational > 0) == (dominant > 0) else -1


def poly_add(*terms):
    result = {}
    for term in terms:
        for power, coefficient in term.items():
            result[power] = add(result.get(power, ZERO), coefficient)
    return {power: c for power, c in result.items() if c != ZERO}


def poly_scale(poly, s):
    return {power: scale(coefficient, s) for power, coefficient in poly.items() if s}


def poly_multiply(left, right):
    result = {}
    for (a, b), first in left.items():
        for (c, d), second in right.items():
            power = (a + c, b + d)
            result[power] = add(result.get(power, ZERO), multiply(first, second))
    return {power: c for power, c in result.items() if c != ZERO}


def poly_powers(poly, degree):
    powers = [{(0, 0): ONE}]
    for _ in range(degree):
        powers.append(poly_multiply(powers[-1], poly))
    return powers


def square_block(block):
    """Return a polynomial matrix after substitution, scaled by one 2^degree."""
    powers = {power for row in block for entry in row for power in entry.terms}
    degree = max(i + j for i, j in powers)
    u_numer = {(0, 0): (2, 0), (1, 1): (-2, 1)}
    v_numer = {(0, 0): (2, 0), (1, 0): (-2, 1)}
    u_powers = poly_powers(u_numer, max(i for i, _ in powers))
    v_powers = poly_powers(v_numer, max(j for _, j in powers))
    substitution = {
        (i, j): poly_scale(poly_multiply(u_powers[i], v_powers[j]), 2**(degree - i - j))
        for i, j in powers
    }
    rows = [[poly_add(*(poly_scale(substitution[power], c)
                        for power, c in entry.terms.items()))
             for entry in row] for row in block]
    assert rows == transpose(rows)
    return rows, degree


def leading_determinant(matrix, size):
    terms = []
    for perm in permutations(range(size)):
        inversions = sum(perm[i] > perm[j] for i in range(size) for j in range(i + 1, size))
        term = {(0, 0): ((-1)**inversions, 0)}
        for i, j in enumerate(perm):
            term = poly_multiply(term, matrix[i][j])
        terms.append(term)
    return poly_add(*terms)


def transpose(matrix):
    return [list(row) for row in zip(*matrix)]


def axis_to_bernstein(power):
    """Solve the triangular equations of the Bernstein power expansion."""
    degree = len(power) - 1
    common = lcm(*(comb(degree, r) for r in range(degree + 1)))
    rows = []
    for r, line in enumerate(power):
        weights = [(-1)**(r-i) * comb(r, i) for i in range(r)]
        row = []
        for s, entry in enumerate(line):
            previous = sum_pairs(scale(rows[i][s], -weight) for i, weight in enumerate(weights))
            row.append(add(scale(entry, common // comb(degree, r)), previous))
        rows.append(row)
    return rows, common


def axis_back_to_power(bernstein):
    degree = len(bernstein) - 1
    return [[scale(sum_pairs(scale(bernstein[i][s], (-1)**(r-i) * comb(r, i))
                             for i in range(r + 1)), comb(degree, r))
             for s in range(len(bernstein[0]))] for r in range(degree + 1)]


def exact_divide_pair(x, d):
    assert d > 0 and all(c % d == 0 for c in x)
    return x[0] // d, x[1] // d


def verify_minor(square, degree, size, recorded):
    scaled = leading_determinant(square, size)
    n = max(i for i, _ in scaled)
    m = max(j for _, j in scaled)
    assert [n, m] == recorded["natural_degrees_a_b"]
    # The independently substituted matrix used a single common scale.
    # Reduce each minor to the generator's natural 2^n scale for comparison.
    excess = 2**(degree * size - n)
    power = [[exact_divide_pair(scaled.get((i, j), ZERO), excess)
              for j in range(m + 1)] for i in range(n + 1)]
    first, factor_a = axis_to_bernstein(power)
    columns, factor_b = axis_to_bernstein(transpose(first))
    bernstein = transpose(columns)
    back = axis_back_to_power(transpose(axis_back_to_power(transpose(bernstein))))
    assert back == [[scale(entry, factor_a * factor_b) for entry in line] for line in power]
    denominator = 2**n * factor_a * factor_b
    assert recorded["scale_denominator"] == denominator

    signs = [[field_sign(entry) for entry in row] for row in bernstein]
    counts = [sum(row.count(sign) for row in signs) for sign in (1, 0, -1)]
    zeros = [[i, j] for i, j in product(range(n + 1), range(m + 1)) if signs[i][j] == 0]
    assert counts == recorded["coefficient_sign_counts_positive_zero_negative"]
    assert zeros == recorded["zero_coefficient_indices"]
    assert counts == ([140, 0, 0], [459, 0, 0], [911, 1, 0])[size - 1]
    assert zeros == ([[37, 0]] if size == 3 else [])
    assert recorded["zero_strata_a_b"] == ([[["1", "1"], ["0", "0"]]] if zeros else [])
    assert recorded["intervals_a_b"] == [["0", "1"], ["0", "1"]]
    return {
        "bidegree": [n, m], "denominator": denominator,
        "positive_zero_negative": counts, "zero_indices": zeros,
        "exact_numerator_array_sha256": sha256(
            json.dumps(bernstein, separators=(",", ":")).encode()).hexdigest(),
    }


def entry_at_a1_b0(poly, shift):
    return scale(sum_pairs(c for (_, j), c in poly.items() if j == 0), Fraction(1, 2**shift))


def endpoint_check(square, degree, recorded):
    axial_matrix = [[entry_at_a1_b0(p, degree) for p in row] for row in square]
    assert axial_matrix == [[tuple(map(Fraction, item)) for item in row] for row in recorded["M"]]
    kernel = [(0, Fraction(-1, 4)), ONE, (-1, 0)]
    assert all(sum_pairs(multiply(a, b) for a, b in zip(row, kernel)) == ZERO
               for row in axial_matrix)
    for size, sign in ((1, 1), (2, 1), (3, 0)):
        assert field_sign(entry_at_a1_b0(leading_determinant(square, size), degree * size)) == sign
    assert kernel == [tuple(map(Fraction, item)) for item in recorded["edge_radical_generator"]]
    return kernel


def e202_tensor(flat):
    """Unpack E199/E202 axis-major trace-free coordinates."""
    matrices = []
    for a in AXES:
        u, v, z12, z13, z23 = flat[5*a:5*a+5]
        matrices.append([[u, z12, z13], [z12, v, z23], [z13, z23, scale(add(u, v), -1)]])
    return matrices


def has_zero_velocity(x, t):
    d = (ONE, ONE, t)
    eig = (Fraction(6, 11), Fraction(6, 11), Fraction(21, 11))
    weighted_mean = [scale(sum_pairs(scale(x[a][i][i], eig[i]) for i in INTERNAL), Fraction(1, 3))
                     for a in AXES]
    h = [[[add(x[a][i][j], scale(weighted_mean[a], -int(i == j)))
           for j in INTERNAL] for i in INTERNAL] for a in AXES]
    return all(sum_pairs(scale(multiply(d[j], h[a][i][j]), J[j][b][a])
                         for a, j in product(AXES, INTERNAL)) == ZERO
               for i, b in product(INTERNAL, AXES))


def e199_radicals(kernel, recorded):
    t = (0, Fraction(1, 2))
    inv_t = (0, Fraction(1, 7))
    s = Fraction(7, 2)
    p = scale(inv_t, (1 + 2*s)/(s + 2))
    r = scale(inv_t, (s - 1)/(s + 2))
    u = scale(inv_t, (1 + 2*s)/3)
    v = scale(inv_t, (s - 1)/3)
    w = scale(inv_t, (s + 2)/3)
    assert p == scale(inv_t, Fraction(16, 11))
    assert r == scale(inv_t, Fraction(5, 11))
    assert add(p, scale(r, -1)) == inv_t
    # The two E218 intermediate p,r values differ by a common amount.
    shift = scale(inv_t, Fraction(71, 132))
    assert add(p, scale(inv_t, Fraction(-11, 12))) == shift
    assert add(r, scale(inv_t, Fraction(1, 12))) == shift

    sparse = {
        6: {2: (-1, 0), 5: (-1, 0)}, 7: {0: (-1, 0), 1: ONE},
        10: {3: p, 9: r}, 11: {3: r, 9: p}, 12: {4: inv_t, 8: inv_t},
        13: {0: scale(u, -1), 1: v}, 14: {2: scale(u, -1), 5: scale(w, -1)},
        15: {4: r, 8: scale(p, -1)}, 16: {4: p, 8: scale(r, -1)},
        17: {3: inv_t, 9: scale(inv_t, -1)},
        18: {2: scale(v, -1), 5: w}, 19: {0: v, 1: scale(u, -1)},
    }
    basis = {j: [ONE if i == j else entries.get(i, ZERO) for i in range(20)]
             for j, entries in sparse.items()}
    assert all(has_zero_velocity(e202_tensor(vector), t) for vector in basis.values())
    historical = {j: vector[:] for j, vector in basis.items()}
    for j in (10, 11):
        for slot in (3, 9):
            historical[j][slot] = add(historical[j][slot], scale(shift, -1))
    for j in (15, 16):
        historical[j][4] = add(historical[j][4], scale(shift, -1))
        historical[j][8] = add(historical[j][8], shift)
    assert all(not has_zero_velocity(e202_tensor(historical[j]), t) for j in (10, 11, 15, 16))
    half = (Fraction(1, 2), 0)
    minus_half = (Fraction(-1, 2), 0)
    minus_t_half = scale(t, Fraction(-1, 2))
    combinations = [
        ({14: ONE, 18: ONE, 6: minus_t_half}, 1, ONE),
        ({13: ONE, 19: (-1, 0), 7: minus_t_half}, 0, (-1, 0)),
        ({10: half, 11: minus_half, 17: half}, 2, inv_t),
        ({16: half, 15: minus_half, 12: half}, 3, scale(inv_t, -1)),
    ]
    for combination, axis, scalar in combinations:
        actual = [sum_pairs(multiply(c, basis[j][i]) for j, c in combination.items())
                  for i in range(20)]
        previous = [sum_pairs(multiply(c, historical[j][i]) for j, c in combination.items())
                    for i in range(20)]
        assert actual == previous
        x = e202_tensor(actual)
        assert has_zero_velocity(x, t)
        for a, edge in product(AXES, range(3)):
            i, j = EDGES[edge]
            extracted = sum_pairs(scale(x[c][i][j], J[i][a][b] * J[j][b][c])
                                  for b, c in product(AXES, repeat=2))
            expected = multiply(scalar, kernel[edge]) if a == axis else ZERO
            assert extracted == expected
    assert recorded["E199_vectors_8_axes_1_based"] == [axis + 1 for _, axis, _ in combinations]
    assert [tuple(map(Fraction, s)) for s in recorded["E199_vectors_8_scales_of_generator"]] == [
        s for _, _, s in combinations]


def specialize_u1(poly):
    return poly_add(*({(0, j): (c, 0)} for (_, j), c in poly.terms.items()))


def axial_identity(block):
    twice_k = [{(0, 1): (-1, 0)}, {(0, 0): (2, 0)}, {(0, 0): (-2, 0)}]
    lhs = poly_add(*(poly_multiply(poly_multiply(twice_k[i], specialize_u1(block[i][j])), twice_k[j])
                     for i, j in product(INTERNAL, repeat=2)))
    rhs = poly_multiply(specialize_u1(CLEAR), {(0, 2): (56, 0), (0, 4): (-16, 0)})
    assert lhs == rhs
    assert lhs == {(0, j): (c, 0)
                   for j, c in enumerate((1344, 2688, 960, -768, -384), start=5)}
    return [[j, c] for (_, j), (c, _) in sorted(lhs.items())]


def main():
    record_path = Path(__file__).with_name("e218_stationary_spectral_range.json")
    data = json.loads(record_path.read_text())
    assert data["status"] == "full region certified"
    block = scalar_block()
    square, degree = square_block(block)
    for i, j in product(INTERNAL, repeat=2):
        at_round = scale(square[i][j].get((0, 0), ZERO), Fraction(1, 2**degree))
        expected_g = ((4, 1, -1), (1, 4, 1), (-1, 1, 4))[i][j]
        assert at_round == (192 * expected_g, 0)
    stored = data["certificate"]["leading_minors"]
    assert data["certificate"]["leaves_per_minor"] == 1
    assert data["certificate"]["subdivision_depth_a_b"] == data["certificate"]["elevation_a_b"] == [0, 0]
    results = {name: verify_minor(square, degree, size, stored[name])
               for size, name in enumerate(("0", "01", "012"), start=1)}
    for a, b in product((0, 1), repeat=2):
        for size, name in enumerate(("0", "01", "012"), start=1):
            value = sum_pairs(scale(c, a**i * b**j) for (i, j), c in leading_determinant(square, size).items())
            assert field_sign(value) == (0 if size == 3 and (a, b) == (1, 0) else 1)

    kernel = endpoint_check(square, degree, data["endpoint"])
    e199_radicals(kernel, data["endpoint"])
    print(json.dumps({
        "state": "Independent polynomial, Bernstein and radical verification passed",
        "substituted_entry_scale": 2**degree,
        "minors": results, "all_12_correct_E199_basis_velocity_residuals": "zero",
        "four_misspecialized_E218_intermediate_vectors_have_nonzero_velocity": True,
        "their_common_shift_cancels_in_the_four_E199_radical_vectors": True,
        "all_four_actual_E199_radical_conversions": "verified",
        "axial_identity_nonzero_v_power_coefficients": axial_identity(block),
    }, indent=2))


if __name__ == "__main__":
    main()
