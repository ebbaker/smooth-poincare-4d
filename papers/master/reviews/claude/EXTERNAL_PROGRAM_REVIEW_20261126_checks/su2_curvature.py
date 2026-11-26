#!/usr/bin/env python3
"""
Curvature of cohomogeneity-one SU(2)-invariant metrics

    g = dt^2 + a_1(t)^2 (th^1)^2 + a_2(t)^2 (th^2)^2 + a_3(t)^2 (th^3)^2,

where th^i is a left-invariant coframe on S^3 = SU(2) with
d th^1 = -2 th^2 ^ th^3 (cyclic), so that sum (th^i)^2 is the unit round
metric and th^1 ^ th^2 ^ th^3 integrates to 2 pi^2.

Everything is derived here from the Koszul formula in the orthonormal frame
E_0 = d/dt, E_i = X_i / a_i, with [X_i, X_j] = 2 eps_ijk X_k.  The output is
the curvature operator on 2-forms in the convention in which the unit round
sphere has identity curvature operator, its two chiral blocks, and the
Ricci data.  The symbolic expressions are generated once with sympy, with
a_i, a_i', a_i'' treated as independent symbols, and then compiled.

This module is shared by check_02, check_03 and check_05.  It was written
for this review and uses no repository code.
"""
import itertools
import numpy as np
import sympy as sp

a = sp.symbols('a1:4', positive=True)       # a_i
p = sp.symbols('p1:4')                      # a_i'
q = sp.symbols('q1:4')                      # a_i''


def ddt(expr):
    """t-derivative by the chain rule on (a_i, a_i')."""
    return sum(sp.diff(expr, a[i]) * p[i] + sp.diff(expr, p[i]) * q[i] for i in range(3))


def eps3(i, j, k):
    return sp.LeviCivita(i, j, k)


# structure functions c[x][y][z] = <[E_x, E_y], E_z>, indices 0..3
c = [[[sp.Integer(0)] * 4 for _ in range(4)] for _ in range(4)]
for i in range(1, 4):
    c[0][i][i] = -p[i - 1] / a[i - 1]
    c[i][0][i] = p[i - 1] / a[i - 1]
for i, j, k in itertools.product(range(1, 4), repeat=3):
    e = eps3(i, j, k)
    if e != 0:
        c[i][j][k] = 2 * e * a[k - 1] / (a[i - 1] * a[j - 1])

# Gamma[x][y][z] = <nabla_{E_x} E_y, E_z>
G = [[[sp.simplify((c[x][y][z] - c[y][z][x] + c[z][x][y]) / 2) for z in range(4)]
      for y in range(4)] for x in range(4)]


def Ederiv(x, f):
    return ddt(f) if x == 0 else sp.Integer(0)


# Riem[x][y][z][w] = < R(E_x,E_y) E_z , E_w >
def riem(x, y, z, w):
    val = Ederiv(x, G[y][z][w]) - Ederiv(y, G[x][z][w])
    for d in range(4):
        val += G[y][z][d] * G[x][d][w] - G[x][z][d] * G[y][d][w]
        val -= c[x][y][d] * G[d][z][w]
    return sp.simplify(val)


PAIRS = [(0, 1), (0, 2), (0, 3), (1, 2), (1, 3), (2, 3)]
# curvature operator: Rop[(xy),(zw)] = <R(E_x,E_y) E_w, E_z>  (round sphere -> identity)
Rop = sp.zeros(6, 6)
for A_, (x, y) in enumerate(PAIRS):
    for B_, (z, w) in enumerate(PAIRS):
        Rop[A_, B_] = riem(x, y, w, z)
Ric = sp.zeros(4, 4)
for x in range(4):
    for y in range(4):
        Ric[x, y] = sp.simplify(sum(riem(z, x, y, z) for z in range(4)))

_args = list(a) + list(p) + list(q)
_Rop = sp.lambdify(_args, Rop, 'numpy')
_Ric = sp.lambdify(_args, Ric, 'numpy')

# Hodge star for the orientation e^0 e^1 e^2 e^3 and chiral bases
_H = np.zeros((6, 6))
for A_, (i, j) in enumerate(PAIRS):
    for B_, (k, l) in enumerate(PAIRS):
        perm = (i, j, k, l)
        if len(set(perm)) == 4:
            _H[B_, A_] = round(np.linalg.det(np.eye(4)[list(perm)]))
_w, _V = np.linalg.eigh(_H)
BPLUS, BMINUS = _V[:, _w > 0.5], _V[:, _w < -0.5]


def curvature(av, pv, qv):
    """Return dict with W^+ and W^- (3x3), |W^pm|^2_HS, scalar R, |Ric_0|^2, |Rm|^2_tens."""
    args = list(av) + list(pv) + list(qv)
    R6 = np.array(_Rop(*args), dtype=float)
    Rc = np.array(_Ric(*args), dtype=float)
    s = np.trace(Rc)
    Ap = BPLUS.T @ R6 @ BPLUS
    Am = BMINUS.T @ R6 @ BMINUS
    Wp = Ap - np.eye(3) * np.trace(Ap) / 3
    Wm = Am - np.eye(3) * np.trace(Am) / 3
    ric0 = Rc - np.eye(4) * s / 4
    return {
        'Wp': Wp, 'Wm': Wm,
        'Wp2': float((Wp ** 2).sum()), 'Wm2': float((Wm ** 2).sum()),
        'R': float(s), 'Ric02': float((ric0 ** 2).sum()),
        'Rm2': float(4 * (R6 ** 2).sum()),
        'trAp': float(np.trace(Ap)), 'trAm': float(np.trace(Am)),
        'sym_err': float(np.abs(R6 - R6.T).max()),
    }


VOL_S3 = 2 * np.pi ** 2
