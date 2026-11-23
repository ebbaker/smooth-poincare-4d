#!/usr/bin/env python3
"""Certify E199 identities using degree bounds and E189's exterior scalar solve."""

import json
import sys
from fractions import Fraction as F
from itertools import combinations
from pathlib import Path

sys.dont_write_bytecode = True
from e189_stationary_kernel_verify import (
    BASE, INTERNAL, SIGMA, WEDGES, action, bianchi_matrices, geometric_evaluation,
    hodge, identity, permutation_sign, unpack, wedge,
)


HERE = Path(__file__).resolve().parent
MINOR_ROWS = (3, 6, 2, 1, 5, 7, 0, 4)
PIVOTS = (0, 1, 2, 3, 4, 5, 8, 9)
FREE = tuple(i for i in range(20) if i not in PIVOTS)
GROUPS = ((6, 14, 18), (7, 13, 19), (10, 11, 17), (16, 15, 12))
CHANGE_DETERMINANTS = (2, -2, 2, 2)
UNITS = identity(20)

# With a=t²+2, the cleared minor a⁸ det has degree ≤24 and the
# cleared restricted Gram 9t⁴(t+1)a⁵ G has degree ≤19. The other
# identities have smaller degree bounds. See the E201 audit.
GRID = tuple(map(F, range(1, 26)))


def poly(coefficients, t):
    value = F(0)
    for coefficient in reversed(coefficients):
        value = value * t + F(coefficient)
    return value


def serialized_at(entry, t):
    numerator, denominator = entry["num"], entry["den"]
    assert len(numerator) <= 9 and 1 <= len(denominator) <= 7
    assert all(F(value) >= 0 for value in denominator) and F(denominator[-1]) == 1
    assert not numerator or F(numerator[-1]) != 0
    return poly(numerator, t) / poly(denominator, t)


def vector_at(sparse_entries, t):
    assert all(str(int(key)) == key and 0 <= int(key) < 20 for key in sparse_entries)
    vector = [F(0)] * 20
    for key, coefficient in sparse_entries.items():
        vector[int(key)] = serialized_at(coefficient, t)
    return vector


def det(matrix):
    rows = [list(map(F, row)) for row in matrix]
    value = F(1)
    for col in range(len(rows)):
        choices = [i for i in range(col, len(rows)) if rows[i][col]]
        if not choices:
            return F(0)
        pivot = choices[-1]
        if pivot != col:
            rows[pivot], rows[col] = rows[col], rows[pivot]
            value = -value
        pivot_value = rows[col][col]
        value *= pivot_value
        for i in range(col + 1, len(rows)):
            multiplier = rows[i][col] / pivot_value
            rows[i] = [x - multiplier * y for x, y in zip(rows[i], rows[col])]
    return value


def quaternion_matrices():
    for i, sigma in enumerate(SIGMA):
        assert hodge(sigma) == sigma
        for j, other in enumerate(SIGMA):
            assert wedge(sigma, other) == ({tuple(BASE): 2} if i == j else {})
    columns = []
    for i in INTERNAL:
        wedges = [hodge(WEDGES[a][i]) for a in BASE]
        columns.append([tuple(form.get((b,), F(0)) for b in BASE) for form in wedges])
    matrices = [list(zip(*matrix)) for matrix in columns]
    for i in INTERNAL:
        for j in INTERNAL:
            for a in BASE:
                product = action(matrices[i], columns[j][a])
                if i == j:
                    expected = tuple(-int(a == b) for b in BASE)
                else:
                    k = 3 - i - j
                    expected = tuple(permutation_sign((i, j, k)) * x for x in columns[k][a])
                assert product == expected
    return matrices


def kernel_coordinates(t):
    s, a = t * t, t * t + 2
    p, r = (1 + 2 * s) / (t * a), (s - 1) / (t * a)
    u, v, w = (1 + 2 * s) / (3 * t), (s - 1) / (3 * t), a / (3 * t)
    inv_t = 1 / t
    extra = {
        6: {2: -1, 5: -1}, 7: {0: -1, 1: 1},
        10: {3: p, 9: r}, 11: {3: r, 9: p},
        12: {4: inv_t, 8: inv_t}, 13: {0: -u, 1: v},
        14: {2: -u, 5: -w}, 15: {4: r, 8: -p},
        16: {4: p, 8: -r}, 17: {3: inv_t, 9: -inv_t},
        18: {2: -v, 5: w}, 19: {0: v, 1: -u},
    }
    return {j: [F(extra[j].get(i, int(i == j))) for i in range(20)] for j in FREE}


def raw_blocks(t):
    s, a = t * t, t * t + 2
    g = 48 / a
    a01, a02 = (16 + 20 * s) / (t * a), (-16 + 4 * s) / (t * a)
    a11 = (4 + 118 * s + 112 * s**2 - 18 * s**3) / (3 * s * a)
    a22 = (4 + 70 * s + 88 * s**2 - 18 * s**3) / (3 * s * a)
    a12 = (-4 - 94 * s + 44 * s**2 - 18 * s**3) / (3 * s * a)
    b01 = 12 * t / a
    b11 = (-4 + 26 * s + 32 * s**2 - 6 * s**3) / (s * a)
    b12 = (-4 + 26 * s - 16 * s**2 + 6 * s**3) / (s * a)
    c00 = (60 + 306 * s + 72 * s**2 - 6 * s**3) / a**3
    c01 = (-132 + 162 * s + 72 * s**2 + 6 * s**3) / a**3
    c02, c22 = 12 * (3 - s) / a, 24 * (4 - s) / a
    common = [[c00, c01, c02], [c01, c00, -c02], [c02, -c02, c22]]
    return (
        [[g, a01, a02], [a01, a11, a12], [a02, a12, a22]],
        [[g, b01, -b01], [b01, b11, b12], [-b01, b12, b11]],
        common,
        common,
    )


def changes_and_diagonals(t):
    s, a = t * t, t * t + 2
    p, ell = 4 * s**2 + 13 * s - 2, 7 - 2 * s
    change_a = ([1, 0, 0], [-a / (3 * t), 1, -1], [-t / 2, 1, 1])
    change_b = ([1, 0, 0], [0, 1, 1], [-t / 2, 1, -1])
    change_c = ([1, -1, -1], [1, 1, 0], [F(1, 2), F(-1, 2), F(1, 2)])
    diagonal_ab = [48 / a, 8 * p / (s * a), 12 * s * ell / a]
    diagonal_cd = [48 / a, 72 * p / a**3, 12 * ell / a]
    return (change_a, change_b, change_c, change_c), (
        diagonal_ab, diagonal_ab, diagonal_cd, diagonal_cd,
    )


def polarized(evaluate, vectors):
    diagonal = [evaluate(v)[1] for v in vectors]
    result = [[x if i == j else F(0) for j in range(len(vectors))]
              for i, x in enumerate(diagonal)]
    for i, j in combinations(range(len(vectors)), 2):
        pair = [a + b for a, b in zip(vectors[i], vectors[j])]
        cross = (evaluate(pair)[1] - diagonal[i] - diagonal[j]) / 2
        result[i][j] = result[j][i] = cross
    return result


def node_checks(t, data, inverse, quaternion):
    def evaluate(coordinates):
        return geometric_evaluation(t, unpack(coordinates), inverse)

    columns = [evaluate(vector)[0] for vector in UNITS]
    weights = (F(1), F(1), t)
    for column in columns:
        transformed = [
            action(quaternion[i], column[4 * i : 4 * i + 4]) for i in INTERNAL
        ]
        assert not any(sum(d * x for d, x in zip(weights, row)) for row in zip(*transformed))
    minor = det([[columns[j][i] for j in PIVOTS] for i in MINOR_ROWS])
    expected_minor = 589824 * t**8 / (t * t + 2) ** 2
    assert minor == expected_minor == serialized_at(data["minor"]["coefficients"], t)

    basis = kernel_coordinates(t)
    assert [[basis[i][j] for j in FREE] for i in FREE] == identity(12)
    assert basis == {int(i): vector_at(v, t) for i, v in data["kernel_basis_by_free_column"].items()}
    for vector in basis.values():
        assert not any(evaluate(vector)[0])

    gram = polarized(evaluate, list(basis.values()))
    positions = {j: (index, pos) for index, group in enumerate(GROUPS) for pos, j in enumerate(group)}
    blocks = raw_blocks(t)
    for i, first in enumerate(FREE):
        block_i, u = positions[first]
        for j, second in enumerate(FREE):
            block_j, v = positions[second]
            assert gram[i][j] == (blocks[block_i][u][v] if block_i == block_j else 0)

    changes, diagonals = changes_and_diagonals(t)
    endpoint_vectors = [[], []]
    for index, group in enumerate(GROUPS):
        record = data["blocks"][index]
        block, change, diagonal = blocks[index], changes[index], diagonals[index]
        assert record["free_columns_in_order"] == list(group)
        assert [[serialized_at(entry, t) for entry in row] for row in record["gram"]] == block
        assert [[serialized_at(entry, t) for entry in col]
                for col in record["change_columns_in_block_basis"]] == list(change)
        assert det(change) == int(record["change_determinant"]) == CHANGE_DETERMINANTS[index]
        for i, v in enumerate(change):
            for j, w in enumerate(change):
                assert sum(x * y for x, y in zip(v, action(block, w))) == (diagonal[i] if i == j else 0)
        assert [serialized_at(entry, t) for entry in record["congruence_diagonal"]] == diagonal
        vectors = [[sum(c * basis[j][k] for c, j in zip(col, group)) for k in range(20)]
                   for col in change]
        assert [vector_at(v, t) for v in record["congruence_vectors_original_coordinates"]] == vectors
        for j in range(2):
            endpoint_vectors[j].append(vectors[j + 1])
    for key, expected in zip(("low_transition", "high_transition"), endpoint_vectors):
        assert data[key]["nullity"] == 4
        assert [vector_at(v, t) for v in data[key]["kernel_vectors_evaluate_at_root"]] == expected
    flattened_diagonal = [value for diagonal in diagonals for value in diagonal]
    return basis, gram, flattened_diagonal


def sign_checks(data):
    def p(t):
        return 4 * t**4 + 13 * t**2 - 2

    def ell(t):
        return 7 - 2 * t**2

    low, high = data["low_transition"], data["high_transition"]
    assert low["root"] == "sqrt((sqrt(201)-13)/8)"
    assert high["root"] == "sqrt(7/2)"
    assert low["polynomial_in_s"] == "4*s^2+13*s-2"
    assert high["polynomial_in_s"] == "7-2*s"
    assert low["isolating_interval_in_t"] == ["1/3", "2/5"]
    assert high["isolating_interval_in_t"] == ["9/5", "2"]
    assert tuple(map(F, low["endpoint_values"])) == (p(F(1, 3)), p(F(2, 5))) == (F(-41, 81), F(114, 625))
    assert tuple(map(F, high["endpoint_values"])) == (ell(F(9, 5)), ell(F(2))) == (F(13, 25), F(-1))
    assert data["inertia_order"] == ["positive", "zero", "negative"]
    assert [row[1] for row in data["inertia_regimes"]] == [
        [8, 0, 4], [8, 4, 0], [12, 0, 0], [8, 4, 0], [8, 0, 4],
    ]


def main():
    data = json.loads((HERE / "e199_axial_stationary_sign_results.json").read_text())
    older = json.loads((HERE / "e187_stationary_kernel_results.json").read_text())["cases"]
    assert data["minor"]["rows_in_order"] == list(MINOR_ROWS)
    assert data["minor"]["columns_in_order"] == list(PIVOTS)
    assert data["constraint_rank"] == 8 and data["kernel_dimension"] == 12
    assert len(data["blocks"]) == 4
    assert [case["t"] for case in older] == ["1/8", "1/4", "1/2", "1", "2", "4", "8"]

    inverse = bianchi_matrices()
    quaternion = quaternion_matrices()
    sample_values = tuple(F(case["t"]) for case in older)
    samples = {}
    for t in dict.fromkeys((*GRID, *sample_values)):
        result = node_checks(t, data, inverse, quaternion)
        if t in sample_values:
            samples[t] = result
    for case, summary in zip(older, data["E187_exact_sample_checks"]):
        t = F(case["t"])
        basis, gram, diagonal = samples[t]
        inertia = [sum(x > 0 for x in diagonal), sum(x == 0 for x in diagonal), sum(x < 0 for x in diagonal)]
        assert case["constraint_rank"] == 8 and case["kernel_dimension"] == 12
        assert list(map(F, case["Q_eigenvalues"])) == [3 * d * d / (t * t + 2) for d in (1, 1, t)]
        assert list(PIVOTS) == case["rref_pivot_columns_0_based"]
        assert list(FREE) == case["rref_free_columns_0_based"]
        assert [basis[j] for j in FREE] == [list(map(F, row)) for row in case["kernel_basis_vectors"]]
        assert gram == [list(map(F, row)) for row in case["restricted_gram"]]
        assert inertia == [case["inertia"][key] for key in ("positive", "zero", "negative")]
        assert summary == {"t": case["t"], "inertia": inertia}
        print(f"t={t}: matched E187 basis, Gram and inertia {inertia}")
    assert len(data["E187_exact_sample_checks"]) == len(older)
    sign_checks(data)
    print("25 exact rational nodes certify all cleared axial identities globally.")


if __name__ == "__main__":
    main()
