#!/usr/bin/env python3
"""Exact E187 certificates for the seven prescribed spectral values."""

import json
from fractions import Fraction as F

VALUES = ("1/8", "1/4", "1/2", "1", "2", "4", "8")
I3 = range(3)
I4 = range(4)
I12 = range(12)
I20 = range(20)
TWO_FORM_PAIRS = (((0, 3), (1, 2)), ((1, 3), (2, 0)), ((2, 3), (0, 1)))


def epsilon(i, j, k):
    if len({i, j, k}) < 3:
        return 0
    return 1 if (i, j, k) in ((0, 1, 2), (1, 2, 0), (2, 0, 1)) else -1


def eta(k, a, b):
    return int((a, b) in TWO_FORM_PAIRS[k]) - int((b, a) in TWO_FORM_PAIRS[k])


# J_k[b,a]=Sigma_k[a,b]. Flatten an internal triple of covectors as (i,b).
C = [[sum(epsilon(i, j, k) * eta(k, a, b) for k in I3)
      for j in I3 for a in I4] for i in I3 for b in I4]


def dot(x, y):
    return sum((a * b for a, b in zip(x, y)), F(0))


def act(matrix, x):
    return [dot(row, x) for row in matrix]


def unpack(x):
    """Axis-major coordinates (X11,X22,X12,X13,X23) for each X_a."""
    out = []
    for a in I4:
        u, v, w, y, z = x[5 * a:5 * (a + 1)]
        out.append([[u, w, y], [w, v, z], [y, z, -u - v]])
    return out


def coframe_sum(arrays):
    return [sum(arrays[a][i][k] * eta(k, a, b) for a in I4 for k in I3)
            for i in I3 for b in I4]


def row_reduce(matrix):
    rows = [list(map(F, row)) for row in matrix]
    pivots = []
    for col in range(len(rows[0])):
        row = len(pivots)
        found = next((j for j in range(row, len(rows)) if rows[j][col]), None)
        if found is None:
            continue
        rows[row], rows[found] = rows[found], rows[row]
        rows[row] = [entry / rows[row][col] for entry in rows[row]]
        for j in range(len(rows)):
            if j != row:
                factor = rows[j][col]
                rows[j] = [a - factor * b for a, b in zip(rows[j], rows[row])]
        pivots.append(col)
    return rows, pivots


def rref_kernel(matrix):
    rows, pivots = row_reduce(matrix)
    free = [col for col in I20 if col not in pivots]
    basis = []
    for col in free:
        x = [F(0)] * 20
        x[col] = F(1)
        for j, pivot in enumerate(pivots):
            x[pivot] = -rows[j][col]
        assert not any(act(matrix, x))
        basis.append(x)
    return pivots, free, basis


def bilinear(x, ly, xiy, eig):
    """A bilinear form with the requested quadratic diagonal R(X)."""
    principal = sum(x[a][i][j] * ly[a][i][j] for a in I4 for i in I3 for j in I3)
    commutator = sum((eig[i] - 1) * (x[a][i][j] * xiy[a][j][i]
                     - xiy[a][i][j] * x[a][j][i])
                     for a in I4 for i in I3 for j in I3)
    return principal - commutator


def congruence(gram, basis):
    """Rational diagonalization, tracking directions in the original coordinates."""
    g = [row[:] for row in gram]
    vectors = [x[:] for x in basis]
    pivots, directions = [], []
    while g:
        n = len(g)
        pivot_index = next((i for i in range(n) if g[i][i]), None)
        if pivot_index is None:
            pair = next(((i, j) for i in range(n) for j in range(i + 1, n)
                         if g[i][j]), None)
            if pair is None:
                pivots.extend([F(0)] * n)
                directions.extend(vectors)
                break
            i, j = pair
            diagonal = g[i][i] + 2 * g[i][j] + g[j][j]
            vectors[i] = [a + b for a, b in zip(vectors[i], vectors[j])]
            for k in range(n):
                if k != i:
                    g[i][k] = g[k][i] = g[i][k] + g[j][k]
            g[i][i] = diagonal
            pivot_index = i
        order = [pivot_index] + [i for i in range(n) if i != pivot_index]
        g = [[g[i][j] for j in order] for i in order]
        vectors = [vectors[i] for i in order]
        pivot = g[0][0]
        pivots.append(pivot)
        directions.append(vectors[0])
        vectors = [[a - (g[0][i] / pivot) * b for a, b in zip(vectors[i], vectors[0])]
                   for i in range(1, n)]
        g = [[g[i][j] - g[i][0] * g[0][j] / pivot for j in range(1, n)]
             for i in range(1, n)]
    return pivots, directions


def run_case(t):
    d = (F(1), F(1), t)
    scale = 3 / (2 + t * t)
    eig = [scale * di * di for di in d]

    def recover(x):
        tr = [sum(eig[i] * x[a][i][i] for i in I3) for a in I4]
        velocity = coframe_sum([[[
            -4 * d[k] * (x[a][i][k] - (tr[a] / 3 if i == k else 0))
            for k in I3] for i in I3] for a in I4])
        y = [[[x[a][i][j] / (d[i] + d[j]) for j in I3] for i in I3] for a in I4]
        assert all((d[i] + d[j]) * y[a][i][j] == x[a][i][j]
                   for a in I4 for i in I3 for j in I3)
        p = [[[y[a][i][j] / (scale * d[i]) for j in I3]
              for i in I3] for a in I4]
        torsion = [-entry for entry in coframe_sum(p)]
        b = [(a + z) / 2 for a, z in zip(act(C, torsion), torsion)]
        cb = act(C, b)
        assert cb == torsion
        assert all(term + scale * d[i // 4] * cb[i] == 0
                   for i, term in enumerate(coframe_sum(y)))
        xi = [[[2 * y[a][i][j] * (d[j] - d[i]) + 4 * scale * d[i] * d[j]
                * sum(b[4 * k + a] * epsilon(k, j, i) for k in I3)
                for j in I3] for i in I3] for a in I4]
        assert all(xi[a][i][j] == -xi[a][j][i] for a in I4 for i in I3 for j in I3)
        lx = [[[2 * (eig[i] + eig[j]) * x[a][i][j]
                - (4 * tr[a] * eig[i] / 3 if i == j else 0)
                for j in I3] for i in I3] for a in I4]
        return velocity, lx, xi

    def form(vectors):
        arrays = [unpack(vec) for vec in vectors]
        recovered = [recover(x) for x in arrays]
        mixed = [[bilinear(x, ly, xi, eig) for _, ly, xi in recovered]
                 for x in arrays]
        return [[(mixed[i][j] + mixed[j][i]) / 2 for j in range(len(arrays))]
                for i in range(len(arrays))]

    units = [[F(i == j) for i in I20] for j in I20]
    constraints = list(map(list, zip(*(recover(unpack(v))[0] for v in units))))
    pivot_cols, free_cols, kernel = rref_kernel(constraints)
    gram = form(kernel)
    assert gram == list(map(list, zip(*gram)))
    diag, cert = congruence(gram, kernel)
    assert len(diag) == len(kernel) and all(not any(act(constraints, v)) for v in cert)
    # The free-coordinate matrix is invertible iff these kernel directions span.
    assert len(row_reduce([[v[j] for j in free_cols] for v in cert])[1]) == len(kernel)
    assert form(cert) == [[pivot if i == j else F(0) for j in range(len(diag))]
                           for i, pivot in enumerate(diag)]
    first_negative = next((i for i, pivot in enumerate(diag) if pivot < 0), None)
    witness = None
    if first_negative is not None:
        direct = next((i for i, row in enumerate(gram) if row[i] < 0), None)
        vector, expected = (cert[first_negative], diag[first_negative])
        if direct is not None:
            vector, expected = kernel[direct], gram[direct][direct]
        x = unpack(vector)
        speed, lx, xi = recover(x)
        value = bilinear(x, lx, xi, eig)
        assert not any(speed) and value == expected < 0
        witness = {"X": x, "R": value, "V_over_sqrt_scale": speed}
    round_checks = None
    if t == 1:
        arrays = [unpack(v) for v in units]
        assert form(units) == [[4 * sum(x[a][i][j] * y[a][i][j]
                                        for a in I4 for i in I3 for j in I3)
                               for y in arrays] for x in arrays]
        e07 = unpack([F(z) for z in (1, -1, 0, 0, 0, 0, 0, -1, 0, 0) + (0,) * 10])
        speed, lx, xi = recover(e07)
        assert not any(speed) and bilinear(e07, lx, xi, eig) == 16
        round_checks = {"full_form_equals_4_Frobenius": True, "E07_R": 16, "E07_speed_zero": True}
    return {"t": t, "Q_eigenvalues": eig, "constraint_rank": len(pivot_cols),
            "kernel_dimension": len(free_cols), "rref_pivot_columns_0_based": pivot_cols,
            "rref_free_columns_0_based": free_cols, "kernel_basis_vectors": kernel,
            "restricted_gram": gram, "congruence_diagonal": diag,
            "congruence_basis_vectors": cert,
            "inertia": {"positive": sum(p > 0 for p in diag),
                        "zero": sum(p == 0 for p in diag), "negative": sum(p < 0 for p in diag)},
            "negative_witness": witness, "round_checks": round_checks,
            "exact_reconstruction_and_residual_checks": True}


def main():
    for i in I12:
        for j in I12:
            assert C[i][j] == C[j][i]
            assert sum(C[i][k] * C[k][j] for k in I12) == 2 * (i == j) - C[i][j]
    print(json.dumps({"coordinates": "axis-major (X11,X22,X12,X13,X23), X33=-X11-X22",
                      "constraint": "V/sqrt(3/(2+t^2)), internal first then covector component",
                      "C_self_adjoint_and_C_squared_equals_2I_minus_C": True,
                      "cases": [run_case(F(t)) for t in VALUES]}, default=str, indent=2))


if __name__ == "__main__":
    main()
