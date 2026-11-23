#!/usr/bin/env python3
"""Verify E187's seven stored certificates via exterior algebra and polarization."""

import json
from fractions import Fraction as F
from itertools import combinations
from pathlib import Path


INTERNAL = range(3)
BASE = range(4)
TRIPLES = tuple(combinations(BASE, 3))
CYCLIC = ((1, 2), (2, 0), (0, 1))
SAMPLES = tuple(map(F, ("1/8", "1/4", "1/2", "1", "2", "4", "8")))
CERTIFICATE = Path(__file__).resolve().with_name("e187_stationary_kernel_results.json")


def permutation_sign(indices):
    inversions = sum(a > b for a, b in combinations(indices, 2))
    return (-1) ** inversions


def form_sum(forms):
    result = {}
    for form in forms:
        for key, value in form.items():
            result[key] = result.get(key, F(0)) + value
    return {key: value for key, value in result.items() if value}


def scaled(coefficient, form):
    return {key: coefficient * value for key, value in form.items() if coefficient}


def wedge(first, second):
    terms = []
    for left, x in first.items():
        for right, y in second.items():
            if set(left).isdisjoint(right):
                indices = left + right
                terms.append({tuple(sorted(indices)): permutation_sign(indices) * x * y})
    return form_sum(terms)


def hodge(form):
    result = {}
    for indices, value in form.items():
        complement = tuple(a for a in BASE if a not in indices)
        result[complement] = permutation_sign(indices + complement) * value
    return result


ONE_FORMS = tuple({(a,): F(1)} for a in BASE)
SIGMA = (
    {(0, 3): F(1), (1, 2): F(1)},
    {(1, 3): F(1), (0, 2): F(-1)},
    {(2, 3): F(1), (0, 1): F(1)},
)
WEDGES = tuple(tuple(wedge(one, sigma) for sigma in SIGMA) for one in ONE_FORMS)


def bracket_with_sigma(covectors):
    return [
        form_sum((wedge(covectors[j], SIGMA[k]), scaled(-1, wedge(covectors[k], SIGMA[j]))))
        for j, k in CYCLIC
    ]


def identity(size):
    return [[F(i == j) for j in range(size)] for i in range(size)]


def reduce_rows(matrix, column_count):
    """Eliminate from the bottommost available pivot, with exact arithmetic."""
    rows = [list(row) for row in matrix]
    pivots = []
    for column in range(column_count):
        target = len(pivots)
        available = [k for k in range(target, len(rows)) if rows[k][column]]
        if not available:
            continue
        pivot = available[-1]
        rows[target], rows[pivot] = rows[pivot], rows[target]
        divisor = rows[target][column]
        rows[target] = [v / divisor for v in rows[target]]
        for k, row in enumerate(rows):
            if k != target and row[column]:
                multiple = row[column]
                rows[k] = [v - multiple * w for v, w in zip(row, rows[target])]
        pivots.append(column)
    return rows, pivots


def inverse(matrix):
    size = len(matrix)
    augmented = [list(row) + unit for row, unit in zip(matrix, identity(size))]
    reduced, pivots = reduce_rows(augmented, size)
    assert pivots == list(range(size))
    return [row[size:] for row in reduced]


def action(matrix, values):
    return tuple(sum(x * y for x, y in zip(row, values)) for row in matrix)


def components(forms, indices):
    return tuple(form.get(key, F(0)) for form in forms for key in indices)


def one_form_tuple(values):
    return [{(a,): values[4 * i + a] for a in BASE} for i in INTERNAL]


def bianchi_matrices():
    raw_columns = []
    star_columns = []
    for unit in identity(12):
        triple = bracket_with_sigma(one_form_tuple(unit))
        raw_columns.append(components(triple, TRIPLES))
        star_columns.append(components(map(hodge, triple), tuple((a,) for a in BASE)))
    raw = list(zip(*raw_columns))
    starred = list(zip(*star_columns))
    assert starred == star_columns
    for i, row in enumerate(starred):
        assert tuple(sum(a * b for a, b in zip(row, col)) for col in star_columns) == tuple(
            2 * (i == j) - row[j] for j in range(12)
        )
    return inverse(raw)


def unpack(coordinates):
    matrices = []
    for a in BASE:
        u, v, w, y, z = coordinates[5 * a : 5 * (a + 1)]
        matrices.append(((u, w, y), (w, v, z), (y, z, -u - v)))
    return matrices


def exterior_contraction(arrays, row):
    return form_sum(
        scaled(arrays[a][row][j], WEDGES[a][j]) for a in BASE for j in INTERNAL
    )


def cross_matrix(x, y, z):
    return ((0, -z, y), (z, 0, -x), (-y, x, 0))


def geometric_evaluation(t, matrices, bianchi_inverse):
    d = (F(1), F(1), t)
    scale = 3 / sum(di * di for di in d)
    eig = tuple(scale * di * di for di in d)
    mean = [sum(eig[i] * x[i][i] for i in INTERNAL) / 3 for x in matrices]
    centered = [
        [[x[i][j] - average * (i == j) for j in INTERNAL] for i in INTERNAL]
        for x, average in zip(matrices, mean)
    ]
    speed_weights = [
        [[-4 * u[i][j] * d[j] for j in INTERNAL] for i in INTERNAL]
        for u in centered
    ]
    speed = components(
        (hodge(exterior_contraction(speed_weights, i)) for i in INTERNAL),
        tuple((a,) for a in BASE),
    )
    y = [
        [[x[i][j] / (d[i] + d[j]) for j in INTERNAL] for i in INTERNAL]
        for x in matrices
    ]
    assert all((d[i] + d[j]) * y[a][i][j] == matrices[a][i][j]
               for a in BASE for i in INTERNAL for j in INTERNAL)
    bianchi_rhs = [
        scaled(-1 / (scale * d[i]), exterior_contraction(y, i)) for i in INTERNAL
    ]
    b = action(bianchi_inverse, components(bianchi_rhs, TRIPLES))
    assert bracket_with_sigma(one_form_tuple(b)) == bianchi_rhs
    skew = []
    for a in BASE:
        adjoint = cross_matrix(*(b[4 * i + a] for i in INTERNAL))
        xi = [[2 * (y[a][i][j] * d[j] - d[i] * y[a][i][j])
               + 4 * scale * d[i] * adjoint[i][j] * d[j]
               for j in INTERNAL] for i in INTERNAL]
        assert all(xi[i][j] == -xi[j][i] for i in INTERNAL for j in INTERNAL)
        skew.append(xi)
    principal = 4 * sum(eig[i] * u[i][j] ** 2 for u in centered
                        for i in INTERNAL for j in INTERNAL)
    correction = 2 * sum(
        (eig[i] - eig[j]) * matrices[a][i][j] * skew[a][i][j]
        for a in BASE for i, j in combinations(INTERNAL, 2)
    )
    return speed, principal + correction


def check_case(t, evidence, bianchi_inverse):
    d = (F(1), F(1), t)
    expected_eig = [3 * di * di / (2 + t * t) for di in d]
    assert list(map(F, evidence["Q_eigenvalues"])) == expected_eig

    def evaluate(coords):
        return geometric_evaluation(t, unpack(coords), bianchi_inverse)

    def polarization(basis):
        diagonal = [evaluate(vector)[1] for vector in basis]
        matrix = [[F(0)] * len(basis) for _ in basis]
        for i, entry in enumerate(diagonal):
            matrix[i][i] = entry
        for i, j in combinations(range(len(basis)), 2):
            added = tuple(a + b for a, b in zip(basis[i], basis[j]))
            cross = (evaluate(added)[1] - diagonal[i] - diagonal[j]) / 2
            matrix[i][j] = matrix[j][i] = cross
        return matrix

    units = identity(20)
    constraints = list(zip(*(evaluate(v)[0] for v in units)))
    _, pivots = reduce_rows(constraints, 20)
    free = [i for i in range(20) if i not in pivots]
    assert len(pivots) == evidence["constraint_rank"] == 8
    assert len(free) == evidence["kernel_dimension"] == 12
    assert pivots == evidence["rref_pivot_columns_0_based"]
    assert free == evidence["rref_free_columns_0_based"]

    kernel = [list(map(F, row)) for row in evidence["kernel_basis_vectors"]]
    diagonal_basis = [list(map(F, row)) for row in evidence["congruence_basis_vectors"]]
    for basis in (kernel, diagonal_basis):
        assert len(basis) == 12 and all(len(vector) == 20 for vector in basis)
        assert len(reduce_rows(basis, 20)[1]) == 12
        for vector in basis:
            assert not any(v for v in evaluate(vector)[0])
    assert [[v[i] for i in free] for v in kernel] == identity(12)
    assert polarization(kernel) == [list(map(F, row)) for row in evidence["restricted_gram"]]
    diagonal = list(map(F, evidence["congruence_diagonal"]))
    assert polarization(diagonal_basis) == [
        [x if i == j else F(0) for j in range(12)] for i, x in enumerate(diagonal)
    ]
    inertia = dict(positive=sum(x > 0 for x in diagonal), zero=sum(x == 0 for x in diagonal),
                   negative=sum(x < 0 for x in diagonal))
    assert inertia == evidence["inertia"]
    expected = (12, 0, 0) if t in (F(1, 2), F(1)) else (8, 0, 4)
    assert tuple(inertia.values()) == expected
    witness = evidence["negative_witness"]
    if witness is not None:
        matrices = [[list(map(F, row)) for row in matrix] for matrix in witness["X"]]
        velocity, value = geometric_evaluation(t, matrices, bianchi_inverse)
        assert velocity == tuple(map(F, witness["V_over_sqrt_scale"])) == (0,) * 12
        assert value == F(witness["R"]) < 0
    else:
        assert inertia["negative"] == 0
    if t == 1:
        arrays = [sum((sum(x, ()) for x in unpack(v)), ()) for v in units]
        assert polarization(units) == [[4 * sum(x * y for x, y in zip(a, b)) for b in arrays]
                                        for a in arrays]
        sanity = tuple(map(F, (1, -1, 0, 0, 0, 0, 0, -1, 0, 0) + (0,) * 10))
        assert evaluate(sanity) == ((0,) * 12, 16)
        assert evidence["round_checks"] == dict(full_form_equals_4_Frobenius=True,
                                               E07_R=16, E07_speed_zero=True)
    print(f"t={t}: rank 8, kernel 12, inertia {expected}"
          + (f", R(witness)={witness['R']}" if witness is not None else ""))


def main():
    evidence = json.loads(CERTIFICATE.read_text(encoding="utf-8"))
    assert tuple(F(case["t"]) for case in evidence["cases"]) == SAMPLES
    assert evidence["coordinates"] == "axis-major (X11,X22,X12,X13,X23), X33=-X11-X22"
    assert evidence["constraint"] == "V/sqrt(3/(2+t^2)), internal first then covector component"
    for i, sigma in enumerate(SIGMA):
        assert hodge(sigma) == sigma
        for j, other in enumerate(SIGMA):
            assert wedge(sigma, other) == ({(0, 1, 2, 3): 2} if i == j else {})
    bianchi_inverse = bianchi_matrices()
    assert evidence["C_self_adjoint_and_C_squared_equals_2I_minus_C"]
    for t, case in zip(SAMPLES, evidence["cases"]):
        check_case(t, case, bianchi_inverse)
        assert case["exact_reconstruction_and_residual_checks"]
    print("All seven exact certificates, including original-coordinate bases, verified.")


if __name__ == "__main__":
    main()
