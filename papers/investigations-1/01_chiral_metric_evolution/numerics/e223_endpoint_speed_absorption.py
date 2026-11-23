#!/usr/bin/env python3
"""Exact full-form test at the single stationary endpoint Q0."""

import json
import sys
from fractions import Fraction as F
from itertools import product

sys.dont_write_bytecode = True
from e187_stationary_kernel import C, epsilon
from e202_general_stationary_pinching import AXES, EDGES, J
from e219_sharp_stationary_verify import (
    ONE, ZERO, add, e202_tensor, field_sign, multiply, scale, sum_pairs,
)

INTERNAL = range(3)
COORDS = range(20)
TRIPLE = range(12)
T = (0, F(1, 2))  # sqrt(14)/2
D = (ONE, ONE, T)
LAMBDA = F(6, 11)
EIG = (LAMBDA, LAMBDA, F(21, 11))
Q_DEFECT = [x - 1 for x in EIG]


def subtract(x, y):
    return add(x, scale(y, -1))


def inverse(x):
    a, b = map(F, x)
    norm = a*a - 14*b*b
    assert norm != 0
    return a/norm, -b/norm


def trace_weight(x):
    return sum_pairs(scale(x[i][i], EIG[i]) for i in INTERNAL)


def coframe_sum(tensors):
    return [sum_pairs(scale(tensors[a][i][j], J[j][b][a])
                      for a, j in product(AXES, INTERNAL)) for i, b in product(INTERNAL, AXES)]


def recovered_fields(x):
    """Return actual V/c, both terms of Xi in one sum, and the principal linear map."""
    tr_qx = [trace_weight(x[a]) for a in AXES]
    d_h = [[[subtract(x[a][i][j], scale(tr_qx[a], F(1, 3)) if i == j else ZERO)
             for j in INTERNAL] for i in INTERNAL] for a in AXES]
    v_over_c = coframe_sum([[[
        scale(multiply(D[j], d_h[a][i][j]), -4)
        for j in INTERNAL] for i in INTERNAL] for a in AXES])

    sylvester = [[[multiply(x[a][i][j], inverse(add(D[i], D[j])))
                   for j in INTERNAL] for i in INTERNAL] for a in AXES]
    assert all(multiply(add(D[i], D[j]), sylvester[a][i][j]) == x[a][i][j]
               for a, i, j in product(AXES, INTERNAL, INTERNAL))

    p = [[[multiply(inverse(scale(D[i], LAMBDA)), sylvester[a][i][j])
           for j in INTERNAL] for i in INTERNAL] for a in AXES]
    z = [scale(value, -1) for value in coframe_sum(p)]
    cz = [sum_pairs(scale(z[j], C[i][j]) for j in TRIPLE) for i in TRIPLE]
    mismatch = [scale(add(z[i], cz[i]), F(1, 2)) for i in TRIPLE]
    cb = [sum_pairs(scale(mismatch[j], C[i][j]) for j in TRIPLE) for i in TRIPLE]
    assert cb == z
    assert all(add(term, multiply(scale(D[i//4], LAMBDA), cb[i])) == ZERO
               for i, term in enumerate(coframe_sum(sylvester)))

    xi = []
    for a in AXES:
        entries = []
        for i in INTERNAL:
            row = []
            for j in INTERNAL:
                sylvester_term = scale(multiply(sylvester[a][i][j], subtract(D[j], D[i])), 2)
                adjoint_b = sum_pairs(scale(mismatch[4*k+a], epsilon(k, j, i)) for k in INTERNAL)
                mismatch_term = scale(multiply(multiply(D[i], D[j]), adjoint_b), 4*LAMBDA)
                row.append(add(sylvester_term, mismatch_term))
            entries.append(row)
        xi.append(entries)
    assert all(xi[a][i][j] == scale(xi[a][j][i], -1)
               for a, i, j in product(AXES, INTERNAL, INTERNAL))

    ell = [[[subtract(scale(x[a][i][j], 2*(EIG[i]+EIG[j])),
                      scale(tr_qx[a], F(4, 3)*EIG[i]) if i == j else ZERO)
             for j in INTERNAL] for i in INTERNAL] for a in AXES]
    return v_over_c, ell, xi


def mixed(x, ell, xi):
    """Unsymmetrized full pairing, with the E187 quadratic form on the diagonal."""
    principal = sum_pairs(multiply(x[a][i][j], ell[a][i][j])
                          for a, i, j in product(AXES, INTERNAL, INTERNAL))
    correction = sum_pairs(scale(subtract(multiply(x[a][i][j], xi[a][j][i]),
                                          multiply(xi[a][i][j], x[a][j][i])), Q_DEFECT[i])
                           for a, i, j in product(AXES, INTERNAL, INTERNAL))
    return subtract(principal, correction)


def r_value(x):
    _, ell, xi = recovered_fields(x)
    return mixed(x, ell, xi)


def polar_from_fields(left, right, left_data, right_data):
    return scale(add(mixed(left, *right_data[1:]), mixed(right, *left_data[1:])), F(1, 2))


def polar_by_evaluation(left, right):
    joined = [[[add(left[a][i][j], right[a][i][j]) for j in INTERNAL]
               for i in INTERNAL] for a in AXES]
    return scale(subtract(subtract(r_value(joined), r_value(left)), r_value(right)), F(1, 2))


def radical(axis):
    """Implement Z = (-t/2,1,-1)*dx^axis in original derivative coordinates."""
    half_t = scale(T, F(1, 2))
    flat = []
    for a in AXES:
        flat.extend((scale(half_t, int(a == axis)), scale(half_t, -int(a == axis)),
                     scale(half_t, J[2][a][axis]), (J[1][a][axis], 0), (J[0][a][axis], 0)))
    tensor = e202_tensor(flat)
    edge_scalars = (scale(half_t, -1), ONE, (-1, 0))
    for a, edge in product(AXES, INTERNAL):
        i, j = EDGES[edge]
        recovered = sum_pairs(scale(tensor[b][i][j], J[i][a][k]*J[j][k][b])
                              for k, b in product(AXES, repeat=2))
        assert recovered == scale(edge_scalars[edge], int(a == axis))
    return flat, tensor


def sparse(values):
    return [[i, str(a), str(b)] for i, (a, b) in enumerate(values) if (a, b) != ZERO]


def squared_velocity(v_over_c):
    return scale(sum_pairs(multiply(x, x) for x in v_over_c), LAMBDA)


def main():
    assert [scale(multiply(d, d), LAMBDA) for d in D] == [(q, 0) for q in EIG]
    for i, j in product(TRIPLE, repeat=2):
        assert C[i][j] == C[j][i]
        assert sum(C[i][k]*C[k][j] for k in TRIPLE) == 2*(i == j)-C[i][j]

    unit_flats = [[ONE if i == j else ZERO for i in COORDS] for j in COORDS]
    units = [e202_tensor(flat) for flat in unit_flats]
    data = [recovered_fields(x) for x in units]
    matrix = [[polar_from_fields(units[i], units[j], data[i], data[j]) for j in COORDS]
              for i in COORDS]
    for i in COORDS:
        for j in range(i, len(COORDS)):
            assert matrix[i][j] == matrix[j][i] == polar_by_evaluation(units[i], units[j])

    radicals = [radical(a) for a in AXES]
    radical_data = [recovered_fields(n) for _, n in radicals]
    assert all(fields[0] == [ZERO]*12 for fields in radical_data)
    for _, n in radicals:
        assert r_value(n) == ZERO
    full_pairings = []
    for a, (n_flat, n) in enumerate(radicals):
        row = [polar_from_fields(n, y, radical_data[a], fields) for y, fields in zip(units, data)]
        assert row == [polar_by_evaluation(n, y) for y in units]
        assert row == [sum_pairs(multiply(n_flat[i], matrix[i][j]) for i in COORDS) for j in COORDS]
        full_pairings.append(row)

    a, j = next((a, j) for a, j in product(AXES, COORDS) if full_pairings[a][j] != ZERO)
    n_flat, n = radicals[a]
    y = units[j]
    pairing = full_pairings[a][j]
    y_speed_squared = squared_velocity(data[j][0])
    y_value = r_value(y)
    direction = -field_sign(pairing)
    assert field_sign(y_speed_squared) == 1
    assert field_sign(scale(pairing, 2*direction)) == -1
    joined = [[[add(y[b][i][k], scale(n[b][i][k], direction)) for k in INTERNAL]
               for i in INTERNAL] for b in AXES]
    assert recovered_fields(joined)[0] == data[j][0]
    assert r_value(joined) == add(y_value, scale(pairing, 2*direction))

    print(json.dumps({
        "scope": "one pointwise algebraic spectrum, old K=1",
        "sparse_entries_format": "[zero-based column or component, r, s] for r+s*sqrt(14)",
        "coordinate_order": "axis-major (X11,X22,X12,X13,X23), X33=-X11-X22",
        "Q0": [str(q) for q in EIG], "speed_factor": "actual V=sqrt(6/11)*(V/c)",
        "full_V_over_c_sparse_columns": [sparse(value[0]) for value in data],
        "full_B_sparse_rows": [sparse(row) for row in matrix],
        "radical_original_coordinate_sparse_rows": [sparse(flat) for flat, _ in radicals],
        "all_80_B_radical_standard_pairings_sparse_rows": [sparse(row) for row in full_pairings],
        "nonzero_radical_pairing_count": sum(pairing != ZERO for row in full_pairings for pairing in row),
        "witness": {
            "radical_axis_1_based": a+1, "N": sparse(n_flat), "Y_index_0_based": j,
            "V_over_c_Y": sparse(data[j][0]), "V_Y_squared": list(map(str, y_speed_squared)),
            "R_Y": list(map(str, y_value)), "B_N_Y": list(map(str, pairing)),
            "N_coefficient_sign_for_unbounded_below_family": direction,
            "linear_R_family_coefficient": list(map(str, scale(pairing, 2*direction))),
        },
        "checked": ["Sylvester and Bianchi residuals and skewness of Xi",
                    "all standard matrix entries by symmetric and quadratic polarization",
                    "all 80 full radical pairings by polarization and matrix contraction",
                    "four radical extraction identities with V=0 and R=0"],
    }, indent=2))


if __name__ == "__main__":
    main()
