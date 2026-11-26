#!/usr/bin/env python3
"""
check_03: the Gluck twist as a rotation flux across a wide conformal collar
(note ENTRY_DIRECT_APPROACHES_20261126.md, section on transfer across collars).

Written from the definitions only.  No repository script was read or reused.

The metric.  On D^2 x S^2 with polar coordinates (R, theta) on the hyperbolic
plane and (phi, psi) on the unit sphere,

    g_s = dR^2 + sinh(R)^2 dtheta^2 + dphi^2 + sin(phi)^2 (dpsi - s(R) dtheta)^2 .

For s = 0 this is the product H^2 x S^2, which is conformally flat.  Where s is
constant the substitution psi -> psi - s theta makes g_s the product again, and
for s = 1 that substitution is the Gluck twist of S^1 x S^2.  A profile s that
rises from 0 at R = 0 to 1 at R >= R_1 therefore gives a smooth metric on the
D^2 x S^2 that is glued in by the Gluck twist to an exterior carrying the
product metric in its original framing.

Claims tested
  (a) orthonormal frame, and the product values at s = 0;
  (b) if s' = 0 then both Weyl blocks vanish and R = 0 (locally the product);
  (c) for s = c (cosh R - 1) (constant curvature c of the rotation connection)
      |W^+|^2 and |W^-|^2 are functions of phi and c alone, equal to
      (3/2) c^2 cos(phi)^2 up to O(c^3), and R = -(c^2/2) sin(phi)^2;
  (d) the energy of each sign over the disk of radius R_1, cosh R_1 - 1 = 1/c,
      equals 4 pi^2 c (1 + O(c));
  (e) with a C^2 cut-off profile that reaches s = 1 exactly, E_pm / c stays
      bounded as c -> 0, so the twist costs O(1/(cosh R_1 - 1)).
"""
import numpy as np
import sympy as sp
from numpy.polynomial.legendre import leggauss

PASS, FAIL = 0, 0


def report(name, ok, detail=""):
    global PASS, FAIL
    if ok:
        PASS += 1
    else:
        FAIL += 1
    print(f"[{'ok' if ok else 'FAIL'}] {name} {detail}")


# ---------- symbolic curvature ----------
R, th, ph, ps = sp.symbols('R theta phi psi', real=True)
X = [R, th, ph, ps]
sf = sp.Function('s')(R)
g = sp.Matrix([[1, 0, 0, 0],
               [0, sp.sinh(R) ** 2 + sf ** 2 * sp.sin(ph) ** 2, 0, -sf * sp.sin(ph) ** 2],
               [0, 0, 1, 0],
               [0, -sf * sp.sin(ph) ** 2, 0, sp.sin(ph) ** 2]])
ginv = sp.simplify(g.inv())
n = 4
Gam = [[[sp.simplify(sum(ginv[a, d] * (sp.diff(g[d, b], X[c]) + sp.diff(g[d, c], X[b])
                                        - sp.diff(g[b, c], X[d])) for d in range(n)) / 2)
         for c in range(n)] for b in range(n)] for a in range(n)]


def riem_up(a, b, c, d):
    """R^a_{bcd} = d_c Gam^a_{db} - d_d Gam^a_{cb} + Gam^a_{ce} Gam^e_{db} - Gam^a_{de} Gam^e_{cb}."""
    expr = sp.diff(Gam[a][d][b], X[c]) - sp.diff(Gam[a][c][b], X[d])
    for e in range(n):
        expr += Gam[a][c][e] * Gam[e][d][b] - Gam[a][d][e] * Gam[e][c][b]
    return expr


Rup = [[[[riem_up(a, b, c, d) for d in range(n)] for c in range(n)] for b in range(n)] for a in range(n)]
Rlow = [[[[sum(g[a, e] * Rup[e][b][c][d] for e in range(n)) for d in range(n)] for c in range(n)]
         for b in range(n)] for a in range(n)]

# orthonormal frame E_a = E[a][i] d/dx^i
E = [[1, 0, 0, 0],
     [0, 1 / sp.sinh(R), 0, sf / sp.sinh(R)],
     [0, 0, 1, 0],
     [0, 0, 0, 1 / sp.sin(ph)]]
gram = sp.simplify(sp.Matrix(E) * g * sp.Matrix(E).T)
report("(a) the frame is orthonormal", gram == sp.eye(4))


def frame_comp(a, b, c, d):
    expr = 0
    for i in range(n):
        if E[a][i] == 0:
            continue
        for j in range(n):
            if E[b][j] == 0:
                continue
            for k in range(n):
                if E[c][k] == 0:
                    continue
                for l in range(n):
                    if E[d][l] == 0:
                        continue
                    expr += E[a][i] * E[b][j] * E[c][k] * E[d][l] * Rlow[i][j][k][l]
    return sp.simplify(expr)


PAIRS = [(0, 1), (0, 2), (0, 3), (2, 3), (3, 1), (1, 2)]      # e01, e02, e03 and their Hodge duals
Q = sp.zeros(6, 6)
for a_, (i, j) in enumerate(PAIRS):
    for b_, (k, l) in enumerate(PAIRS):
        if b_ >= a_:
            Q[a_, b_] = frame_comp(i, j, k, l)
            Q[b_, a_] = Q[a_, b_]
A_, C_, B_ = Q[:3, :3], Q[3:, 3:], Q[:3, 3:]
blocks = {+1: (A_ + C_ + B_ + B_.T) / 2, -1: (A_ + C_ - B_ - B_.T) / 2}
scal = sp.simplify(2 * Q.trace())
W2 = {}
for sgn, blk in blocks.items():
    Wm = blk - blk.trace() / 3 * sp.eye(3)
    W2[sgn] = sp.simplify(sum(Wm[i, j] ** 2 for i in range(3) for j in range(3)))

# ---------- (a) product values ----------
Q0 = sp.simplify(Q.subs(sf, 0).doit())
report("(a) at s = 0: K(e0,e1) = -1, K(e2,e3) = +1, all other entries 0",
       Q0 == sp.diag(-1, 0, 0, 1, 0, 0), f"diag = {list(Q0.diagonal())}")

# ---------- (b) constant s ----------
s0 = sp.symbols('s0', real=True)
ok_b = all(sp.simplify(W2[sgn].subs(sf, s0).doit()) == 0 for sgn in (+1, -1))
ok_b &= sp.simplify(scal.subs(sf, s0).doit()) == 0
report("(b) s constant: W^+ = W^- = 0 and R = 0", ok_b)

# ---------- (c) constant flux ----------
c = sp.symbols('c', positive=True)
prof = c * (sp.cosh(R) - 1)
W2c = {sgn: sp.simplify(W2[sgn].subs(sf, prof).doit()) for sgn in (+1, -1)}
scal_c = sp.simplify(scal.subs(sf, prof).doit())
indep = all(sp.simplify(sp.diff(W2c[sgn], R)) == 0 for sgn in (+1, -1))
report("(c) constant flux: |W^pm|^2 do not depend on R", indep,
       f"|W^+|^2 = {sp.factor(W2c[+1])};  |W^-|^2 = {sp.factor(W2c[-1])}")
lead = all(sp.simplify(sp.series(W2c[sgn], c, 0, 3).removeO()
                       - sp.Rational(3, 2) * c ** 2 * sp.cos(ph) ** 2) == 0 for sgn in (+1, -1))
report("(c) |W^pm|^2 = (3/2) c^2 cos(phi)^2 + O(c^3)", lead)
report("(c) R = -(c^2/2) sin(phi)^2", sp.simplify(scal_c + c ** 2 * sp.sin(ph) ** 2 / 2) == 0,
       f"R = {scal_c}")

# ---------- (d) energy of the constant-flux disk ----------
xs, ws = leggauss(200)


def sphere_integral(expr, cval):
    fn = sp.lambdify(ph, expr.subs(c, cval) * sp.sin(ph), 'numpy')
    pts = (xs + 1) * np.pi / 2
    return 2 * np.pi * (np.pi / 2) * np.sum(ws * fn(pts))     # includes the psi circle


detail, ok_d = [], True
ratios = []
for cval in (0.3, 0.1, 0.03, 0.01, 0.003):
    area = 2 * np.pi / cval                                    # 2 pi (cosh R_1 - 1)
    Ep = sphere_integral(W2c[+1], cval) * area
    Em = sphere_integral(W2c[-1], cval) * area
    ratios.append((Ep / (4 * np.pi ** 2 * cval), Em / (4 * np.pi ** 2 * cval)))
    detail.append(f"c={cval}: {ratios[-1][0]:.5f}/{ratios[-1][1]:.5f}")
ok_d = abs(ratios[-1][0] - 1) < 5e-3 and abs(ratios[-1][1] - 1) < 5e-3
ok_d &= all(abs(r_[0] - 1) < 3 * cv + 1e-3 and abs(r_[1] - 1) < 3 * cv + 1e-3
            for r_, cv in zip(ratios, (0.3, 0.1, 0.03, 0.01, 0.003)))
report("(d) E_pm over the disk with cosh R_1 - 1 = 1/c is 4 pi^2 c (1 + O(c))", ok_d,
       "E_+/E_- over 4 pi^2 c: " + "; ".join(detail))

# ---------- (e) profile with a C^2 cut-off reaching s = 1 ----------
s_, s1_, s2_ = sp.symbols('s_ s1_ s2_', real=True)
gen = {}
for sgn in (+1, -1):
    expr = W2[sgn].subs(sp.Derivative(sf, (R, 2)), s2_).subs(sp.Derivative(sf, R), s1_).subs(sf, s_)
    gen[sgn] = sp.lambdify((R, ph, s_, s1_, s2_), expr, 'numpy')


def smoothstep(u_):
    """C^2 step: 1 for u >= 1, 0 for u <= 0."""
    u_ = np.clip(u_, 0.0, 1.0)
    return u_ ** 3 * (10 - 15 * u_ + 6 * u_ ** 2)


def dsmoothstep(u_):
    inside = (u_ > 0) & (u_ < 1)
    u_ = np.clip(u_, 0.0, 1.0)
    return np.where(inside, 30 * u_ ** 2 * (1 - u_) ** 2, 0.0)


def cutoff_energy(R1, width=1.0, nR=4000, nphi=120):
    # flux density F(R) = s'(R)/sinh R = c * chi(R), chi = 1 up to R1 - width, 0 beyond R1
    Rg = np.linspace(1e-6, R1, nR)
    chi = smoothstep((R1 - Rg) / width)
    dchi = -dsmoothstep((R1 - Rg) / width) / width
    raw = np.concatenate([[0.0], np.cumsum((chi[1:] * np.sinh(Rg[1:]) + chi[:-1] * np.sinh(Rg[:-1])) / 2
                                           * np.diff(Rg))])
    cval = 1.0 / raw[-1]                                     # so that s(R1) = 1
    sv, s1v = cval * raw, cval * chi * np.sinh(Rg)
    s2v = cval * (dchi * np.sinh(Rg) + chi * np.cosh(Rg))
    xg, wg = leggauss(nphi)
    phis = (xg + 1) * np.pi / 2
    out = []
    for sgn in (+1, -1):
        vals = gen[sgn](Rg[:, None], phis[None, :], sv[:, None], s1v[:, None], s2v[:, None])
        inner = (vals * np.sin(phis)[None, :] * wg[None, :]).sum(axis=1) * np.pi / 2
        radial = inner * np.sinh(Rg)
        out.append(4 * np.pi ** 2 * np.sum((radial[1:] + radial[:-1]) / 2 * np.diff(Rg)))
    return cval, out


detail, vals = [], []
for R1 in (3.0, 5.0, 7.0, 9.0):
    cval, (Ep, Em) = cutoff_energy(R1)
    vals.append((cval, Ep, Em))
    detail.append(f"R1={R1:.0f}: c={cval:.2e}, E_+={Ep:.3e}, E_-={Em:.3e}, E/c={Ep/cval:.2f}/{Em/cval:.2f}")
ok_e = all(v[1] / v[0] < 60 and v[2] / v[0] < 60 for v in vals)
ok_e &= vals[-1][1] < vals[0][1] / 100 and vals[-1][2] < vals[0][2] / 100
report("(e) with the cut-off profile E_pm / c stays bounded and E_pm -> 0", ok_e, "\n     " + "\n     ".join(detail))
cosh_ratio = [v[1] * (np.cosh(R1) - 1) for v, R1 in zip(vals, (3.0, 5.0, 7.0, 9.0))]
report("(e) E_+ (cosh R_1 - 1) settles to a constant", abs(cosh_ratio[-1] / cosh_ratio[-2] - 1) < 0.05,
       f"values {np.round(cosh_ratio, 2)};  4 pi^2 = {4*np.pi**2:.2f}")

print(f"\ncheck_03: {PASS} ok, {FAIL} failed")
raise SystemExit(1 if FAIL else 0)
