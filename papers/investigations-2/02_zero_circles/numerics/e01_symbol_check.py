#!/usr/bin/env python3
"""Verify the symbol by exact integer polynomial interpolation."""

from itertools import combinations, product

import numpy as np

from e01_fourier import _transfer_numerator, solve


def two_form(j, k, ell, chirality):
    form = [[0] * 4 for _ in range(4)]
    form[0][j], form[j][0] = 1, -1
    form[k][ell], form[ell][k] = chirality, -chirality
    return form


def dot(left, right):
    return sum(x * y for x, y in zip(left, right))


def exact_identities():
    cycles = ((1, 2, 3), (2, 3, 1), (3, 1, 2))
    plus = [two_form(*indices, 1) for indices in cycles]
    minus = [two_form(*indices, -1) for indices in cycles]
    # The identities are polynomials of degree at most six in each variable.
    # Seven distinct nodes on every axis give unisolvent tensor interpolation.
    for x in product(range(7), repeat=4):
        s = dot(x, x)
        numerator = _transfer_numerator(*x)
        columns = tuple(zip(*numerator))
        for i, j in product(range(3), repeat=2):
            expected = s * s if i == j else 0
            assert dot(numerator[i], numerator[j]) == expected
            assert dot(columns[i], columns[j]) == expected
            cplus = [dot(x, column) for column in zip(*plus[i])]
            cminus = [dot(x, column) for column in zip(*minus[j])]
            assert numerator[i][j] == dot(cplus, cminus)
        assert _transfer_numerator(*(-xi for xi in x)) == numerator
        a, b, c = numerator
        assert dot(a, (b[1] * c[2] - b[2] * c[1], b[2] * c[0] - b[0] * c[2],
                       b[0] * c[1] - b[1] * c[0])) == s**3
        for k, column in enumerate(columns):
            form = [[s * minus[k][i][j] + sum(coef * basis[i][j]
                     for coef, basis in zip(column, plus)) for j in range(4)] for i in range(4)]
            for i, j, ell in combinations(range(4), 3):
                assert x[i] * form[j][ell] + x[j] * form[ell][i] + x[ell] * form[i][j] == 0
            reflection = [[s * (i == j) - 2 * x[i] * x[j] for j in range(4)] for i in range(4)]
            for i, j in combinations(range(4), 2):
                pullback = sum(reflection[a][i] * minus[k][a][b] * reflection[b][j]
                               for a, b in product(range(4), repeat=2))
                assert pullback == -s * sum(coef * basis[i][j] for coef, basis in zip(column, plus))
    print("Exact: closed symbol, contraction formula, orthogonality, determinant, parity, reflection")


def zero_mode_smoke():
    leading = np.eye(3)
    graph = np.broadcast_to(0.25 * leading, (5, 5, 5, 5, 3, 3))
    default = solve(graph, 2.0)
    alternate = solve(graph, 2.0, zero_mode=leading)
    np.testing.assert_allclose(default.plus, np.broadcast_to(leading, graph.shape), atol=1e-14)
    np.testing.assert_allclose(default.minus, graph, atol=1e-14)
    np.testing.assert_allclose(alternate.plus, np.broadcast_to(leading / 0.75, graph.shape),
                               rtol=0, atol=1e-11)
    np.testing.assert_allclose(alternate.minus, graph / 0.75, rtol=0, atol=1e-11)
    print(f"Zero-mode constant-graph check: residuals {default.residual:.3e}, {alternate.residual:.3e}")


if __name__ == "__main__":
    exact_identities()
    zero_mode_smoke()
