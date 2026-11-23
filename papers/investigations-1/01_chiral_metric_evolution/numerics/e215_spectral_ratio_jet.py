#!/usr/bin/env python3
"""Exact fixed-spectrum E215 checks, including the direct affine flow baseline."""

import json
from fractions import Fraction as F
from itertools import product

I3 = range(3)
I4 = range(4)
PAIRS = (((0, 3), (1, 2)), ((1, 3), (2, 0)), ((2, 3), (0, 1)))
ROOT_WEIGHTS = (4, 5, 6)
C_SQUARED = F(3, 77)
Q = [C_SQUARED * weight**2 for weight in ROOT_WEIGHTS]
Q_DEFECT = [value - 1 for value in Q]
# The true F* has these components times c, where c = sqrt(3/77).
F_BAR = [[[-weight * (int((a, b) in pairs) - int((b, a) in pairs))
           for b in I4] for a in I4] for weight, pairs in zip(ROOT_WEIGHTS, PAIRS)]


def epsilon(i, j, k):
    if len({i, j, k}) < 3:
        return 0
    return 1 if (i, j, k) in ((0, 1, 2), (1, 2, 0), (2, 0, 1)) else -1


def dot(x, y):
    return sum(a * b for a, b in zip(x, y))


def scalar_gradient():
    raw = [-1 / Q[0], F(0), 1 / Q[2]]
    return [x - sum(raw) / 3 for x in raw]


def principal(x):
    trace_weight = dot(Q, x) / 3
    return [4 * q * (t - trace_weight) for q, t in zip(Q, x)]


def trace_corrected_derivative(x):
    correction = sum(Q[i] * x[i][i] for i in I3) / 3
    return [[x[i][j] - correction * (i == j) for j in I3] for i in I3]


def curvature_quotient_delta(variation):
    """Compute the differential with F* replaced by F_BAR in the numerator.

    The true differential has the additional factor c since F* = c*F_BAR.
    The normalization term still uses the actual Q*, with trace three.
    """
    delta_m = [[
        F(1, 2) * sum(variation[i][a][b] * F_BAR[j][a][b] +
                      F_BAR[i][a][b] * variation[j][a][b]
                      for a in I4 for b in I4 if a < b)
        for j in I3] for i in I3]
    trace = sum(delta_m[i][i] for i in I3)
    return [[delta_m[i][j] - Q[i] * F(trace, 3) * (i == j)
             for j in I3] for i in I3]


def affine_curvature_hessian(a, b):
    """The affine connection curvature Hessian divided by c^2."""
    alpha_a = [[F(value, 2) for value in form[a]] for form in F_BAR]
    alpha_b = [[F(value, 2) for value in form[b]] for form in F_BAR]
    return [[[
        sum(epsilon(i, r, t) * (alpha_a[r][m] * alpha_b[t][n] -
                                alpha_a[r][n] * alpha_b[t][m])
            for r, t in product(I3, repeat=2))
        for n in I4] for m in I4] for i in I3]


def diagonal_matrix(x, scale=1):
    return [[scale * x[i] * (i == j) for j in I3] for i in I3]


def velocity_quotient(derivative_of_weight):
    """Direct 4*(D^A H wedge F) Hodge contraction and quotient.

    F_BAR is used in the velocity and the quotient. Thus the two suppressed
    factors c from F* are restored separately by the callers.
    """
    derivative_of_velocity = [[[
        4 * sum(derivative_of_weight[a][p][i][j] * F_BAR[j][p][b]
                for p, j in product(I4, I3))
        for b in I4] for i in I3] for a in I4]
    variation = [[[
        derivative_of_velocity[a][i][b] - derivative_of_velocity[b][i][a]
        for b in I4] for a in I4] for i in I3]
    return curvature_quotient_delta(variation)


def check_affine():
    # The actual affine quotient Hessians are c^3 times these matrices.
    hess = [[curvature_quotient_delta(affine_curvature_hessian(a, b))
             for b in I4] for a in I4]
    for a, b in product(I4, repeat=2):
        assert hess[a][b] == diagonal_matrix(Q_DEFECT, 60 * (a == b))

    h_flow = [q - dot(Q_DEFECT, Q_DEFECT) / 6 for q in Q_DEFECT]
    weight_hessian_over_c = []
    for a in I4:
        row = []
        for b in I4:
            spatial = trace_corrected_derivative(hess[a][b])
            # C = D^A H. At the origin partial_a C_b includes [ad(alpha_a,b), H].
            commutator = [[
                (h_flow[j] - h_flow[i]) *
                sum(F(F_BAR[k][a][b], 2) * epsilon(k, j, i) for k in I3)
                for j in I3] for i in I3]
            row.append([[C_SQUARED * spatial[i][j] + commutator[i][j]
                         for j in I3] for i in I3])
        weight_hessian_over_c.append(row)

    # The derivative-of-weight factor c and both F* factors give c^3 overall.
    actual = velocity_quotient(weight_hessian_over_c)
    expected = diagonal_matrix([240 * lt - 2880 * q for lt, q in zip(
        principal(Q_DEFECT), Q_DEFECT)])
    assert actual == expected
    return [actual[i][i] for i in I3]


def check_cubic_direction(direction):
    # V_i^a = -(H_ii/s_i) J_i dx^a for these diagonal H. The following
    # perturbation strips c^(-1), which cancels c in the Gram differential.
    for a in I4:
        v_bar = [[direction[i] * F_BAR[i][a][b] / ROOT_WEIGHTS[i]**2
                  for b in I4] for i in I3]
        variation = [[[
            (a == b) * v_bar[i][k] - (a == k) * v_bar[i][b]
            for k in I4] for b in I4] for i in I3]
        assert curvature_quotient_delta(variation) == diagonal_matrix(direction)

    derivative_of_weight = [[trace_corrected_derivative(
        diagonal_matrix(direction, a == b)) for b in I4] for a in I4]
    quotient_over_c_squared = velocity_quotient(derivative_of_weight)
    actual = [[C_SQUARED * entry for entry in row] for row in quotient_over_c_squared]
    assert actual == diagonal_matrix(principal(direction), 4)
    return [actual[i][i] for i in I3]


def main():
    assert sum(Q) == 3 and 0 < Q[0] < Q[1] < Q[2] and Q[2] / Q[0] == F(9, 4)
    g = scalar_gradient()
    tangent = [Q[0], -Q[0] - Q[2], Q[2]]
    lg = principal(g)
    assert lg == [-4, 0, 4]
    y = [a - dot(g, lg) / dot(g, g) * b for a, b in zip(lg, g)]
    assert dot(g, tangent) == dot(g, y) == 0
    assert dot(g, principal(tangent)) == dot(lg, tangent) == F(240, 77)
    assert dot(g, principal(y)) == dot(y, y) == F(200, 133)

    l_value = 10
    h_rational = [-a + l_value * b for a, b in zip(g, y)]
    # sqrt(det Q) = 120*c^3. H = H_rational + c^3 * H_radical_coefficient.
    h_radical_coefficient = [-60 * q for q in Q_DEFECT]
    baseline = check_affine()
    rational_shift = check_cubic_direction(h_rational)
    radical_shift = check_cubic_direction(h_radical_coefficient)
    rational_part = dot(g, rational_shift)
    determinant_root_coefficient = dot(g, [a + b for a, b in zip(baseline, radical_shift)]) / 120
    assert rational_part == -4 * dot(g, lg) + 4 * l_value * dot(y, y)
    assert determinant_root_coefficient == -24 * dot(g, Q_DEFECT) < 0
    margin = rational_part + determinant_root_coefficient
    det = Q[0] * Q[1] * Q[2]
    assert 0 < det < 1 and margin == F(12119, 7182) > 0

    print(json.dumps({
        "Q_diagonal": Q, "q_diagonal": Q_DEFECT, "T_diagonal": tangent,
        "affine_gradient_G": g, "L_Q_G": lg, "transverse_Y": y,
        "pair_G_T": dot(g, tangent), "pair_G_L_Q_T": dot(g, principal(tangent)),
        "squared_G": dot(g, g), "pair_G_L_Q_G": dot(g, lg),
        "pair_G_q": dot(g, Q_DEFECT), "squared_Y": dot(y, y),
        "det_Q": det, "L": l_value,
        "H_rational_part": h_rational, "H_coefficient_of_c_cubed": h_radical_coefficient,
        "scalar_hessian_multiple_of_euclidean_metric": -dot(g, g),
        "direct_affine_Q_t_diagonal_divided_by_c_cubed": baseline,
        "old_scalar_rate": {"rational_part": rational_part,
                            "coefficient_of_sqrt_det_Q": determinant_root_coefficient,
                            "strict_lower_bound_using_sqrt_det_Q_less_than_one": margin},
        "native_scalar_rate_strict_lower_bound": margin / 2,
        "exact_checks": ["all 16 affine curvature quotient Hessian slots",
                         "direct affine flow with differentiated connection commutator",
                         "both cubic directions in every axis and direct flow increment"]
    }, default=str, indent=2))


if __name__ == "__main__":
    main()
