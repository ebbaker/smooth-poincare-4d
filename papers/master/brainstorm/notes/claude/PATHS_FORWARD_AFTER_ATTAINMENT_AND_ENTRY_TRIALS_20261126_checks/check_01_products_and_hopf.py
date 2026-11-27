#!/usr/bin/env python3
"""
check_01: normalisations, the product classes [q + g_{S^2}], and the Hopf
picture used in the note PATHS_FORWARD_AFTER_ATTAINMENT_AND_ENTRY_TRIALS_20261126.md.

Written from the definitions only.  No repository script was read or reused.

Conventions.  |W^+-|^2 is the Hilbert-Schmidt norm of W^+- as an operator on
Lambda^+-, with the curvature operator of the unit round sphere equal to the
identity on Lambda^2.  T = 4 pi^2, u = 16 pi^2 / 3.

Claims tested
  (a) for g = ds^2 + a(s)^2 dtheta^2 + (unit round S^2), with K = -a''/a:
      W^+ and W^- both have eigenvalues (R/6, -R/12, -R/12), R = 2K + 2,
      hence |W^+-|^2 = (K+1)^2 / 6 (computed from the Riemann tensor);
  (b) Gauss-Bonnet and signature normalisations
        8 pi^2 chi = int (|W^+|^2 + |W^-|^2 + R^2/24 - |Z|^2/2),
        12 pi^2 tau = int (|W^+|^2 - |W^-|^2)
      on S^4, S^2 x S^2, S^2(r1) x S^2(r2), CP^2, S^1 x S^3;
  (c) Gursky's bound (4 pi^2/3)(2 chi + 3 tau) is attained by CP^2 and by the
      Einstein S^2 x S^2; there E_+- = 32 pi^2/3 = 2u and Y = 16 pi;
      Y(S^4) = 8 sqrt6 pi; hemisphere(K=1) x S^2 has E_+- = u;
  (d) on S^1 x S^3: R = 6, |Z|^2 = 3, int sigma_2 = 0 and 2 sqrt3 |Z| = R
      (equality case of Gursky's b_1 theorem);
  (e) the funnel identity
        dt^2 + dbeta^2 + cos^2(beta) g_{S^2}
            = cos^2(beta) ( dr^2 + cosh^2(r) dt^2 + g_{S^2} ),  cosh r = sec beta;
  (f) the tube of angular radius theta about the core beta = pi/2 is
      { sinh r > cot theta }, so theta > pi/2 exactly when the cut is at r_0 < 0;
      the tube about a geodesic gamma x {omega_0} is
      { <omega,omega_0> > cos(theta) cosh d };
  (g) the two gauges agree to first order at the waist (cos^2 beta = 1 - beta^2 + ...);
  (h) the tubes of investigation 07 stay in an open hemisphere:
      pi/3 + 5/64 < pi/2.
"""
import math
import random

import numpy as np
import sympy as sp

PI = math.pi
T = 4 * PI**2
U = 16 * PI**2 / 3
NOK = 0
NFAIL = 0


def report(name, ok, detail=""):
    global NOK, NFAIL
    if ok:
        NOK += 1
    else:
        NFAIL += 1
    print(("[ok]   " if ok else "[FAIL] ") + name + ((" | " + detail) if detail else ""))


# ---------------------------------------------------------------------------
# generic curvature of a 4-dimensional metric, symbolic
# ---------------------------------------------------------------------------
def riemann_lower(g, X):
    n = len(X)
    ginv = g.inv()
    Gam = [[[sum(ginv[i, l] * (sp.diff(g[l, j], X[k]) + sp.diff(g[l, k], X[j]) - sp.diff(g[j, k], X[l]))
                 for l in range(n)) / 2 for k in range(n)] for j in range(n)] for i in range(n)]
    def Rup(r, s_, m, v):
        e = sp.diff(Gam[r][v][s_], X[m]) - sp.diff(Gam[r][m][s_], X[v])
        e += sum(Gam[r][m][l] * Gam[l][v][s_] - Gam[r][v][l] * Gam[l][m][s_] for l in range(n))
        return e
    Rl = sp.MutableDenseNDimArray.zeros(n, n, n, n)
    for r in range(n):
        for s_ in range(n):
            for m in range(n):
                for v in range(n):
                    Rl[r, s_, m, v] = sp.simplify(sum(g[r, l] * Rup(l, s_, m, v) for l in range(n)))
    return Rl


PAIRS = [(0, 1), (0, 2), (0, 3), (1, 2), (1, 3), (2, 3)]
# Hodge star on the orthonormal basis e_a ^ e_b, a < b
STAR = np.zeros((6, 6))
for (i, j, sgn) in [(0, 5, 1), (1, 4, -1), (2, 3, 1), (3, 2, 1), (4, 1, -1), (5, 0, 1)]:
    STAR[j, i] = sgn


def weyl_parts_orthonormal(Rm):
    """Rm[a,b,c,d] numeric, orthonormal frame, with Rm[a,b,a,b] the sectional
    curvature.  Returns (W^+ as 3x3, W^- as 3x3, scalar R, |Z|^2)."""
    n = 4
    Ric = np.einsum('abcb->ac', Rm)
    R = np.trace(Ric)
    P = (Ric - R / 6 * np.eye(n)) / 2
    W = Rm.copy()
    I = np.eye(n)
    W -= (np.einsum('ac,bd->abcd', P, I) + np.einsum('bd,ac->abcd', P, I)
          - np.einsum('ad,bc->abcd', P, I) - np.einsum('bc,ad->abcd', P, I))
    M = np.array([[W[a, b, c, d] for (c, d) in PAIRS] for (a, b) in PAIRS])
    Pp = (np.eye(6) + STAR) / 2
    Pm = (np.eye(6) - STAR) / 2
    # orthonormal bases of Lambda^+ and Lambda^-
    Bp = np.array([[1, 0, 0, 0, 0, 1], [0, 1, 0, 0, -1, 0], [0, 0, 1, 1, 0, 0]]) / math.sqrt(2)
    Bm = np.array([[1, 0, 0, 0, 0, -1], [0, 1, 0, 0, 1, 0], [0, 0, 1, -1, 0, 0]]) / math.sqrt(2)
    assert np.allclose(Pp @ Bp.T, Bp.T) and np.allclose(Pm @ Bm.T, Bm.T)
    Wp = Bp @ M @ Bp.T
    Wm = Bm @ M @ Bm.T
    Z = Ric - R / 4 * I
    return Wp, Wm, R, float(np.sum(Z * Z)), float(np.abs(Bp @ M @ Bm.T).max())


# ---------------------------------------------------------------------------
# (a) product classes
# ---------------------------------------------------------------------------
s, th, ph, ps = sp.symbols('s theta phi psi', real=True)
X = [s, th, ph, ps]
ok_all = True
worst = 0.0
profiles = [sp.sin(s), sp.sinh(s), sp.cosh(s), s + s**3 / 5, sp.sin(s) * (1 + s**2 / 3), sp.exp(s / 2) + s]
for a in profiles:
    g = sp.diag(1, a**2, 1, sp.sin(ph)**2)
    Rl = riemann_lower(g, X)
    scale = [1, a, 1, sp.sin(ph)]
    for trial in range(3):
        pt = {s: random.uniform(0.3, 1.2), th: 0.3, ph: random.uniform(0.4, 2.6), ps: 1.0}
        Rm = np.zeros((4, 4, 4, 4))
        for i in range(4):
            for j in range(4):
                for k in range(4):
                    for l in range(4):
                        v = Rl[i, j, k, l]
                        if v != 0:
                            Rm[i, j, k, l] = float((v / (scale[i] * scale[j] * scale[k] * scale[l])).subs(pt))
        Wp, Wm, R, Z2, mixed = weyl_parts_orthonormal(Rm)
        K = float((-sp.diff(a, s, 2) / a).subs(pt))
        want = (K + 1)**2 / 6
        ev_want = sorted([R / 6, -R / 12, -R / 12])
        e1 = abs(np.sum(Wp * Wp) - want) + abs(np.sum(Wm * Wm) - want)
        e2 = np.abs(np.array(sorted(np.linalg.eigvalsh(Wp))) - ev_want).max() + \
             np.abs(np.array(sorted(np.linalg.eigvalsh(Wm))) - ev_want).max()
        e3 = abs(R - (2 * K + 2)) + abs(Z2 - (K - 1)**2) + mixed
        worst = max(worst, e1, e2, e3)
        ok_all = ok_all and max(e1, e2, e3) < 1e-9
report("(a) |W^+|^2 = |W^-|^2 = (K+1)^2/6, eigenvalues (R/6,-R/12,-R/12), R = 2K+2, |Z|^2 = (K-1)^2",
       ok_all, f"6 profiles x 3 points, max error {worst:.1e}")

# ---------------------------------------------------------------------------
# (b), (c), (d) normalisations on standard spaces
# ---------------------------------------------------------------------------
def gb(Ep, Em, intR2, D):
    return (Ep + Em + intR2 / 24 - D / 2) / (8 * PI**2)

vol_S4 = 8 * PI**2 / 3
report("(b) Gauss-Bonnet on round S^4 gives chi = 2", abs(gb(0, 0, 144 * vol_S4, 0) - 2) < 1e-12)

# S^2(r1) x S^2(r2)
okp = True
for (r1, r2) in [(1, 1), (1, 2), (0.7, 1.9), (3, 0.4)]:
    K1, K2 = 1 / r1**2, 1 / r2**2
    vol = 16 * PI**2 * r1**2 * r2**2
    R = 2 * K1 + 2 * K2
    Epm = R**2 / 24 * vol
    D = (K1 - K2)**2 * vol
    okp = okp and abs(gb(Epm, Epm, R**2 * vol, D) - 4) < 1e-10
report("(b) Gauss-Bonnet on S^2(r1) x S^2(r2) gives chi = 4 for four radius pairs", okp)

E_prod = (4.0**2 / 24) * 16 * PI**2
report("(c) Einstein S^2 x S^2: E_+ = E_- = 32 pi^2/3 = 2u", abs(E_prod - 32 * PI**2 / 3) < 1e-10 and abs(E_prod - 2 * U) < 1e-10)
report("(c) Einstein S^2 x S^2: Y = R Vol^(1/2) = 16 pi", abs(4 * math.sqrt(16 * PI**2) - 16 * PI) < 1e-12)
report("(c) round S^4: Y = 12 Vol^(1/2) = 8 sqrt6 pi", abs(12 * math.sqrt(vol_S4) - 8 * math.sqrt(6) * PI) < 1e-10,
       f"Y(S^4) = {12 * math.sqrt(vol_S4):.4f}")
report("(c) hemisphere(K=1) x S^2: E_+- = (2 pi/3) * 4 * 2 pi = u", abs((2 * PI / 3) * 4 * 2 * PI - U) < 1e-12)

# CP^2, Fubini-Study with holomorphic sectional curvature 4: R = 24, Vol = pi^2/2
R_cp, vol_cp = 24.0, PI**2 / 2
Ep_cp = R_cp**2 / 24 * vol_cp
report("(b) signature on CP^2: int |W^+|^2 = 12 pi^2 tau", abs(Ep_cp - 12 * PI**2) < 1e-10)
report("(b) Gauss-Bonnet on CP^2 gives chi = 3", abs(gb(Ep_cp, 0, R_cp**2 * vol_cp, 0) - 3) < 1e-10)
gursky = lambda chi, tau: 4 * PI**2 / 3 * (2 * chi + 3 * tau)
report("(c) Gursky bound attained on CP^2 and on Einstein S^2 x S^2",
       abs(gursky(3, 1) - Ep_cp) < 1e-10 and abs(gursky(4, 0) - E_prod) < 1e-10)
report("(c) Kaehler-Einstein equality E_+ = Y^2/24 on both",
       abs((R_cp * math.sqrt(vol_cp))**2 / 24 - Ep_cp) < 1e-9 and abs((16 * PI)**2 / 24 - E_prod) < 1e-9)

# S^1 x S^3: Ric = diag(0,2,2,2)
Ric = np.diag([0.0, 2, 2, 2])
R13 = np.trace(Ric)
Z13 = Ric - R13 / 4 * np.eye(4)
Z2 = float(np.sum(Z13 * Z13))
report("(d) S^1 x S^3: R = 6, |Z|^2 = 3, 4 sigma_2 = R^2/24 - |Z|^2/2 = 0, 2 sqrt3 |Z| = R",
       abs(R13 - 6) < 1e-12 and abs(Z2 - 3) < 1e-12 and abs(R13**2 / 24 - Z2 / 2) < 1e-12
       and abs(2 * math.sqrt(3) * math.sqrt(Z2) - R13) < 1e-12)

# ---------------------------------------------------------------------------
# (e) funnel identity, symbolic
# ---------------------------------------------------------------------------
b = sp.symbols('beta', positive=True)
r_of_b = sp.acosh(1 / sp.cos(b))
drdb = sp.diff(r_of_b, b)
val = [abs(float((sp.cos(b)**2 * drdb**2 - 1).subs(b, x))) for x in (0.2, 0.7, 1.3)]
val2 = [abs(float((sp.cos(b)**2 * sp.cosh(r_of_b)**2 - 1).subs(b, x))) for x in (0.2, 0.7, 1.3)]
report("(e) cos^2(beta) dr^2 = dbeta^2 and cos^2(beta) cosh^2(r) = 1 when cosh r = sec beta",
       max(val + val2) < 1e-12, f"max error {max(val + val2):.1e}")
# full metric comparison through the embedding: y = sin(beta) E + cos(beta) omega in S^3
okm = True
for trial in range(200):
    r = random.uniform(-3, 3)
    beta = math.copysign(math.acos(1 / math.cosh(r)), r)
    okm = okm and abs(math.tan(beta) - math.sinh(r)) < 1e-9 and abs(math.cos(beta) * math.cosh(r) - 1) < 1e-12
report("(e) signed version: tan(beta) = sinh(r), cos(beta) cosh(r) = 1 on 200 random r", okm)

# ---------------------------------------------------------------------------
# (f) tube formulas
# ---------------------------------------------------------------------------
okt = True
for trial in range(2000):
    r = random.uniform(-4, 4)
    beta = math.atan(math.sinh(r))
    theta = random.uniform(0.05, PI - 0.05)
    inside_angle = (math.sin(beta) > math.cos(theta))          # <y,E> > cos(theta)
    inside_r = (math.sinh(r) > 1 / math.tan(theta))
    okt = okt and (inside_angle == inside_r)
report("(f) tube about the core: <y,E> > cos(theta)  <=>  sinh r > cot(theta) (2000 random samples)", okt)
report("(f) the cut is at r_0 < 0 exactly when theta > pi/2",
       all((1 / math.tan(t) < 0) == (t > PI / 2) for t in np.linspace(0.1, 3.0, 59)))
okg = True
for trial in range(2000):
    d = random.uniform(-3, 3)
    beta = math.atan(math.sinh(d))
    c = random.uniform(-1, 1)                                  # <omega, omega_0>
    theta = random.uniform(0.05, PI - 0.05)
    lhs = (math.cos(beta) * c > math.cos(theta))               # <y, omega_0> > cos(theta)
    rhs = (c > math.cos(theta) * math.cosh(d))
    okg = okg and (lhs == rhs)
report("(f) tube about gamma x {omega_0}: <omega,omega_0> > cos(theta) cosh(d) (2000 random samples)", okg)
# a tube of radius theta < pi/2 about any circle {y = y_0} lies in the open hemisphere <y, y_0> > 0,
# and the great sphere <y, y_0> = 0 contains the two fixed lines y = +-E whenever y_0 is orthogonal to E
okh = True
for trial in range(2000):
    y0 = np.array([0.0] + list(np.random.randn(3))); y0 /= np.linalg.norm(y0)      # y_0 orthogonal to E = e_0
    y = np.random.randn(4); y /= np.linalg.norm(y)
    theta = random.uniform(0.05, PI / 2 - 1e-3)
    if y @ y0 > math.cos(theta):
        okh = okh and (y @ y0 > 0)
E0 = np.array([1.0, 0, 0, 0])
report("(f) a tube with theta < pi/2 about {y = y_0}, y_0 orthogonal to E, lies in the open hemisphere <y,y_0> > 0, "
       "whose boundary great sphere contains +-E", okh and abs(E0 @ np.array([0.0, 1, 0, 0])) < 1e-15)

# ---------------------------------------------------------------------------
# (g) first-order agreement of the two gauges at the waist
# ---------------------------------------------------------------------------
ser = sp.series(sp.cos(b)**2, b, 0, 4).removeO()
report("(g) conformal factor cos^2(beta) = 1 - beta^2 + O(beta^4): value 1 and zero slope at the waist",
       sp.simplify(ser - (1 - b**2)) == 0)

# ---------------------------------------------------------------------------
# (h) the tubes of investigation 07
# ---------------------------------------------------------------------------
report("(h) pi/3 + 5/64 < pi/2 and 2 pi/3 - 5/64 > pi/2", PI / 3 + 5 / 64 < PI / 2 and 2 * PI / 3 - 5 / 64 > PI / 2,
       f"margin {PI / 2 - PI / 3 - 5 / 64:.4f} rad")

print(f"# check_01: {NOK} ok, {NFAIL} FAIL")
