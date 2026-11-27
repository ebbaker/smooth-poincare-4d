#!/usr/bin/env python3
"""
check_03: Bach-flat classes of the form [q + g_{S^2}], q = ds^2 + a(s)^2 dtheta^2
(the SO(3) x SO(2)-invariant classes), for the calibration of the rigidity step
in the note PATHS_FORWARD_AFTER_ATTAINMENT_AND_ENTRY_TRIALS_20261126.md.

Written from the definitions only.  No repository script was read or reused.

Bach tensor:  B_ij = nabla^k C_ijk + P^{kl} W_ikjl,  C_ijk = nabla_k P_ij - nabla_j P_ik,
P = (Ric - R g/6)/2, with R_ijij > 0 on spheres.  The relative sign of the two
terms is fixed in (a) by requiring B = 0 on a conformally Einstein metric.

Claims tested
  (a) the convention: B = 0 on e^{2f(s)} (S^2 x S^2) for a non-constant f, and
      the opposite relative sign does not vanish there; B = 0 on S^2 x S^2 and
      on H^2 x S^2; B != 0 on S^2(1) x S^2(2);
  (b) for a generic profile a(s), with K = -a''/a:
        B_ss           = -(1/3) [ (1-K^2)/2 - (a'/a) K' ],
        B_thth / a^2   = -(1/3) [ (1-K^2)/2 - K'' ],
      B is diagonal and trace-free.  Hence
        B = 0   <=>   K'' = (1-K^2)/2  and  (a'/a) K' = (1-K^2)/2
                <=>   K' = c a,  2 c a' = 1 - K^2  for a constant c;
  (c) at a smooth centre (a(0) = 0, a'(0) = 1): c = (1-K_0^2)/2 and the motion is
      K'' = -V'(K), V = K^3/6 - K/2, started at rest at K_0;
  (d) closing up at a second smooth pole would need K_0^2 + K_1^2 = 2 together with
      V(K_0) = V(K_1), i.e. K_0 K_1 = 1, which forces K_0 = K_1 = 1.  Numerically
      the second pole of every solution with K_0 in (-1,1) or (1,2) has cone angle
      2 pi |1-K_1^2|/|1-K_0^2| different from 2 pi;
  (e) K_0 = 2 is the Euclidean Schwarzschild metric written as r^2 (q + g_{S^2}):
        K = -1 + 3 sech^2(s/2),  a = 2 sech^2(s/2) tanh(s/2),
      with E_+- = (4 pi^2/3) * 6 = 8 pi^2 = 2T; the same number from the Kretschmann
      scalar 48 m^2 / r^6;
  (f) K_0 > 2 and K_0 < -1 give solutions on which K reaches -infinity at finite
      distance; so the only complete or closed smooth solutions are K = 1, K = -1
      and the cusp solution of (e).  An end with a'/a -> 1 and K -> -1 forces c = 0.
"""
import math

import numpy as np
import sympy as sp
from scipy.integrate import solve_ivp, quad

PI = math.pi
NOK = 0
NFAIL = 0


def report(name, ok, detail=""):
    global NOK, NFAIL
    if ok:
        NOK += 1
    else:
        NFAIL += 1
    print(("[ok]   " if ok else "[FAIL] ") + name + ((" | " + detail) if detail else ""))


def geometry(g, X, simp=True):
    S = sp.simplify if simp else (lambda e: e)
    n = len(X)
    ginv = g.inv()
    Gam = [[[S(sum(ginv[i, l] * (sp.diff(g[l, j], X[k]) + sp.diff(g[l, k], X[j]) - sp.diff(g[j, k], X[l]))
                   for l in range(n)) / 2) for k in range(n)] for j in range(n)] for i in range(n)]

    def Rup(r, s_, m, v):
        e = sp.diff(Gam[r][v][s_], X[m]) - sp.diff(Gam[r][m][s_], X[v])
        e += sum(Gam[r][m][l] * Gam[l][v][s_] - Gam[r][v][l] * Gam[l][m][s_] for l in range(n))
        return e
    Rm = [[[[S(sum(g[r, l] * Rup(l, s_, m, v) for l in range(n))) for v in range(n)] for m in range(n)]
           for s_ in range(n)] for r in range(n)]
    Ric = sp.Matrix(n, n, lambda i, k: S(sum(ginv[j, l] * Rm[i][j][k][l] for j in range(n) for l in range(n))))
    R = S(sum(ginv[i, k] * Ric[i, k] for i in range(n) for k in range(n)))
    P = ((Ric - R * g / 6) / 2).applyfunc(S)
    W = [[[[S(Rm[a][b][c][d] - (P[a, c] * g[b, d] + P[b, d] * g[a, c] - P[a, d] * g[b, c] - P[b, c] * g[a, d]))
            for d in range(n)] for c in range(n)] for b in range(n)] for a in range(n)]
    return dict(n=n, g=g, ginv=ginv, Gam=Gam, P=P, W=W, X=X, R=R)


def bach(G, sign=+1, simp=True):
    S = sp.simplify if simp else (lambda e: e)
    n, ginv, Gam, P, W, X = G['n'], G['ginv'], G['Gam'], G['P'], G['W'], G['X']
    dP = [[[sp.diff(P[i, j], X[m]) - sum(Gam[a][m][i] * P[a, j] + Gam[a][m][j] * P[i, a] for a in range(n))
            for m in range(n)] for j in range(n)] for i in range(n)]
    C = [[[S(dP[i][j][k] - dP[i][k][j]) for k in range(n)] for j in range(n)] for i in range(n)]

    def dC(i, j, k, m):
        return sp.diff(C[i][j][k], X[m]) - sum(Gam[a][m][i] * C[a][j][k] + Gam[a][m][j] * C[i][a][k]
                                               + Gam[a][m][k] * C[i][j][a] for a in range(n))
    Pup = ginv * P * ginv
    B = sp.zeros(n, n)
    for i in range(n):
        for j in range(n):
            t1 = sum(ginv[k, m] * dC(i, j, k, m) for k in range(n) for m in range(n))
            t2 = sum(Pup[k, l] * W[i][k][j][l] for k in range(n) for l in range(n))
            B[i, j] = S(t1 + sign * t2)
    return B


s, th, ph, ps = sp.symbols('s theta phi psi', real=True)
X = [s, th, ph, ps]

# ---------------------------------------------------------------------------
# (a) convention and standard examples
# ---------------------------------------------------------------------------
f = s / 3 + sp.Rational(1, 5) * s**2
gce = sp.exp(2 * f) * sp.diag(1, sp.sin(s)**2, 1, sp.sin(ph)**2)
Gce = geometry(gce, X, simp=False)
pt = {s: sp.Float('0.7', 30), ph: sp.Float('1.1', 30)}
Bp = bach(Gce, +1, simp=False)
Bm = bach(Gce, -1, simp=False)
vp = max(abs(sp.N(Bp[i, j].subs(pt), 20)) for i in range(4) for j in range(4))
vm = max(abs(sp.N(Bm[i, j].subs(pt), 20)) for i in range(4) for j in range(4))
report("(a) B = 0 on the conformally Einstein metric e^{2f}(S^2 x S^2), f = s/3 + s^2/5", vp < 1e-12,
       f"max |B| = {float(vp):.1e}")
report("(a) the opposite relative sign of the two terms does not vanish there", vm > 1e-3, f"max = {float(vm):.3f}")

for name, gg, want_zero in [
        ("S^2 x S^2", sp.diag(1, sp.sin(s)**2, 1, sp.sin(ph)**2), True),
        ("H^2 x S^2", sp.diag(1, sp.cosh(s)**2, 1, sp.sin(ph)**2), True),
        ("S^2(1) x S^2(2)", sp.diag(1, sp.sin(s)**2, 4, 4 * sp.sin(ph)**2), False)]:
    Bx = bach(geometry(gg, X), +1)
    num = max(abs(sp.N(Bx[i, j].subs({s: sp.Rational(*x), ph: sp.Rational(*y)}), 40)) for i in range(4)
              for j in range(4) for (x, y) in (((2, 5), (9, 10)), ((13, 10), (2, 1))))
    zero = num < sp.Float('1e-30')
    report(f"(a) Bach tensor of {name} is {'zero' if want_zero else 'not zero'}", zero == want_zero,
           "" if want_zero else f"B_ss = {Bx[0, 0]}")

# ---------------------------------------------------------------------------
# (b) generic profile
# ---------------------------------------------------------------------------
a = sp.Function('a')(s)
B = bach(geometry(sp.diag(1, a**2, 1, sp.sin(ph)**2), X), +1)
K = -sp.diff(a, s, 2) / a
Gss = (1 - K**2) / 2 - (sp.diff(a, s) / a) * sp.diff(K, s)
Gtt = (1 - K**2) / 2 - sp.diff(K, s, 2)
report("(b) B_ss = -(1/3)[(1-K^2)/2 - (a'/a)K'] for a generic profile", sp.simplify(B[0, 0] + Gss / 3) == 0)
report("(b) B_thth/a^2 = -(1/3)[(1-K^2)/2 - K''] for a generic profile", sp.simplify(B[1, 1] / a**2 + Gtt / 3) == 0)
report("(b) B is diagonal, trace-free, and B_psipsi = sin^2(phi) B_phiphi",
       all(sp.simplify(B[i, j]) == 0 for i in range(4) for j in range(4) if i != j)
       and sp.simplify(B[0, 0] + B[1, 1] / a**2 + B[2, 2] + B[3, 3] / sp.sin(ph)**2) == 0
       and sp.simplify(B[3, 3] - sp.sin(ph)**2 * B[2, 2]) == 0)
# equivalence with K' = c a, 2 c a' = 1 - K^2
c = sp.symbols('c')
Kf = sp.Function('K')(s)
# the difference of the two equations is K'' - (a'/a) K' = a (K'/a)', so K' = c a
expr = sp.diff(sp.diff(Kf, s) / a, s) - (sp.diff(Kf, s, 2) - (sp.diff(a, s) / a) * sp.diff(Kf, s)) / a
report("(b) (K'/a)' = (K'' - (a'/a)K')/a identically, so the difference of the two equations gives K' = c a",
       sp.simplify(expr) == 0)
# with K' = c a (hence K'' = c a') both brackets equal (1-K^2)/2 - c a'
ap_, Ksym = sp.symbols('ap Ksym')
br1 = (1 - Ksym**2) / 2 - (ap_ / a) * (c * a)
br2 = (1 - Ksym**2) / 2 - c * ap_
report("(b) with K' = c a both equations read 2 c a' = 1 - K^2", sp.simplify(br1 - br2) == 0)

# ---------------------------------------------------------------------------
# (c), (d) the mechanical system and the closing condition
# ---------------------------------------------------------------------------
V = lambda k: k**3 / 6 - k / 2
K0s, K1s = sp.symbols('K0 K1', real=True)
# V(K0) = V(K1), K0 != K1  <=>  K0^2 + K0 K1 + K1^2 = 3
lhs = sp.factor((K0s**3 / 6 - K0s / 2) - (K1s**3 / 6 - K1s / 2))
report("(d) V(K0) - V(K1) = (K0 - K1)(K0^2 + K0 K1 + K1^2 - 3)/6",
       sp.simplify(lhs - (K0s - K1s) * (K0s**2 + K0s * K1s + K1s**2 - 3) / 6) == 0)
sol = sp.solve([K0s**2 + K1s**2 - 2, K0s**2 + K0s * K1s + K1s**2 - 3], [K0s, K1s], dict=True)
report("(d) K0^2 + K1^2 = 2 and K0^2 + K0 K1 + K1^2 = 3 have only the solutions K0 = K1 = +-1",
       all(abs(float(d[K0s]) - float(d[K1s])) < 1e-12 and abs(abs(float(d[K0s])) - 1) < 1e-12 for d in sol) and len(sol) == 2,
       f"solutions {[(d[K0s], d[K1s]) for d in sol]}")


def run(K0, smax=60.0):
    cc = (1 - K0 * K0) / 2
    def rhs(t, y):
        return [y[1], (1 - y[0] * y[0]) / 2]
    def turn(t, y):
        return y[1]
    turn.terminal = True
    turn.direction = -np.sign(cc)                 # K' = c a returns to zero from the side of sign(c)
    def blow(t, y):
        return abs(y[0]) - 50.0
    blow.terminal = True
    # leave s = 0 by the series K = K0 + c s^2/2
    s0 = 1e-6
    sol_ = solve_ivp(rhs, [s0, smax], [K0 + cc * s0**2 / 2, cc * s0], events=[turn, blow], rtol=1e-11, atol=1e-13)
    return cc, sol_


okc = True
rows = []
for K0 in (-0.9, -0.5, 0.0, 0.5, 0.9, 1.1, 1.5, 1.9):
    cc, so = run(K0)
    closed = len(so.t_events[0]) > 0
    if not closed:
        okc = False
        continue
    K1 = so.y_events[0][0][0]
    ratio_formula = abs(1 - K1**2) / abs(1 - K0**2)
    ap_end = (1 - K1**2) / (2 * cc)                 # a' at the second pole
    okc = okc and abs(V(K1) - V(K0)) < 1e-8 and abs(abs(ap_end) - ratio_formula) < 1e-8 and abs(ratio_formula - 1) > 1e-3
    rows.append((K0, K1, ratio_formula))
report("(d) every solution with K_0 in (-1,1) or (1,2) closes at a second pole with cone angle ratio != 1", okc,
       "; ".join(f"K0={k0:+.1f}: K1={k1:.4f}, angle/2pi={r:.4f}" for k0, k1, r in rows))
# near K_0 = 1 the ratio tends to 1 only quadratically
cc, so = run(0.99)
K1 = so.y_events[0][0][0]
report("(d) for K_0 = 0.99 the cone angle ratio is close to but not equal to 1",
       0 < abs(abs(1 - K1**2) / abs(1 - 0.99**2) - 1) < 0.02, f"ratio = {abs(1 - K1**2) / abs(1 - 0.99**2):.6f}")

# ---------------------------------------------------------------------------
# (e) the cusp solution is Euclidean Schwarzschild
# ---------------------------------------------------------------------------
Kc = -1 + 3 / sp.cosh(s / 2)**2
ac = 2 * sp.tanh(s / 2) / sp.cosh(s / 2)**2
e1 = sp.simplify(sp.diff(Kc, s, 2) - (1 - Kc**2) / 2)
e2 = sp.simplify(sp.diff(Kc, s) - sp.Rational(-3, 2) * ac)
e3 = sp.simplify((-sp.diff(ac, s, 2) / ac - Kc).rewrite(sp.exp))
report("(e) K = -1 + 3 sech^2(s/2), a = 2 sech^2(s/2) tanh(s/2): K'' = (1-K^2)/2, K' = c a with c = -3/2, K = -a''/a",
       e1 == 0 and e2 == 0 and e3 == 0 and Kc.subs(s, 0) == 2 and sp.limit(sp.diff(ac, s), s, 0) == 1)
# Schwarzschild, m = 1:  (1-2/r) dtau^2 + dr^2/(1-2/r) + r^2 g_{S^2} = r^2 ( q + g_{S^2} ),  tau = 4 theta
r = 1 + sp.cosh(s)
ds_dr = 1 / sp.sqrt(r**2 - 2 * r)                      # ds = dr / sqrt(r^2 - 2r)
chk1 = sp.simplify((sp.diff(r, s) * ds_dr).rewrite(sp.exp))
a_schw = 4 * sp.sqrt((r - 2) / r**3)
vals = [abs(float((a_schw - ac).subs(s, x))) for x in (0.3, 1.0, 2.5, 6.0)]
vals2 = [abs(float((sp.diff(r, s) * ds_dr - 1).subs(s, x))) for x in (0.3, 1.0, 2.5, 6.0)]
report("(e) Schwarzschild in the gauge r^2(q + g_{S^2}) has r = 1 + cosh s and a = 4 sqrt((r-2)/r^3) = the cusp profile",
       max(vals + vals2) < 1e-12, f"max error {max(vals + vals2):.1e}")
J, _ = quad(lambda x: (float(Kc.subs(s, x)) + 1)**2 * float(ac.subs(s, x)), 0, 80, limit=400)
report("(e) energy of the cusp solution: int (K+1)^2 a ds = 6, so E_+- = 8 pi^2 = 2T",
       abs(J - 6) < 1e-8 and abs(4 * PI**2 / 3 * J - 8 * PI**2) < 1e-6, f"J = {J:.10f}")
kret, _ = quad(lambda rr: 4 * PI * rr**2 * 48 / rr**6, 2, np.inf)
tot = 8 * PI * kret                                   # tensor norm, tau-period 8 pi m
report("(e) Kretschmann integral of Schwarzschild is 64 pi^2, i.e. E_+ + E_- = 16 pi^2 in the operator norm",
       abs(tot - 64 * PI**2) < 1e-6 and abs(tot / 4 - 16 * PI**2) < 1e-6)

# ---------------------------------------------------------------------------
# (f) the remaining solutions are incomplete
# ---------------------------------------------------------------------------
okb = True
det = []
for K0 in (2.05, 3.0, 6.0, -1.05, -2.0):
    cc, so = run(K0)
    blew = len(so.t_events[1]) > 0 and so.y_events[1][0][0] < 0
    okb = okb and blew and len(so.t_events[0]) == 0
    det.append(f"K0={K0}: K=-50 at s={so.t_events[1][0]:.3f}" if blew else f"K0={K0}: no blow-up")
report("(f) K_0 > 2 and K_0 < -1: K reaches -50 at finite distance without a second pole", okb, "; ".join(det))
# the two first integrals along an independently integrated surface: a'' = -K a, K'' = (1-K^2)/2
okfi = True
for K0 in (-0.5, 0.5, 1.5, 3.0):
    cc = (1 - K0 * K0) / 2
    s0 = 1e-6
    so = solve_ivp(lambda t, y: [y[1], (1 - y[0]**2) / 2, y[3], -y[0] * y[2]], [s0, 1.6],
                   [K0 + cc * s0**2 / 2, cc * s0, s0, 1.0], rtol=1e-11, atol=1e-13)
    Kv, Kp, av, apv = so.y
    okfi = okfi and np.abs(Kp - cc * av).max() < 1e-7 and np.abs(2 * cc * apv - (1 - Kv**2)).max() < 1e-7
report("(f) along solutions with a(0) = 0, a'(0) = 1: K' = c a and 2 c a' = 1 - K^2 with c = (1-K_0^2)/2", okfi,
       "so an end with a' -> infinity and K -> -1 forces c = 0, K = -1 everywhere")

print(f"# check_03: {NOK} ok, {NFAIL} FAIL")
