#!/usr/bin/env python3
"""
check_01: the pointwise form of entry, the hypersurface (seam) test, and the
fold-image inequalities of the note ENTRY_DIRECT_APPROACHES_20261126.md.

Written from the definitions only.  No repository script was read or reused.

Claims tested
  (a) sigma_2 of the Schouten tensor A = (Ric - (R/6) g)/2 in dimension four
      equals R^2/96 - |Ric_0|^2/8;
  (b) first Newton tensor: sigma_1(A) g - A = -G/2, G = Ric - (R/2) g;
  (c) R > 0 and |Ric_0|^2 < R^2/12 force 0 < Ric < (R/2) g, and both bounds are
      sharp at the boundary of the cone;
  (d) Gauss equation in the form R_Sigma = -2 G(nu,nu) + 2 sigma_2(kappa),
      checked symbolically on two families of metrics dt^2 + h_t;
  (e) 2 sigma_2(kappa) = (2/3) H^2 - |A0|^2 for a hypersurface of a
      four-manifold, hence = (2/3) H^2 on umbilic points;
  (f) on the locus of a hypersurface of R^4 where the principal curvatures have
      signs (+,-,-):  |k1 k2 k3| <= (sqrt 6 / 9) |A0|^3, sharp at (1,-2,-2);
      also sum_{i<j} (k_i-k_j)^2 = 3 |A0|^2;
  (g) the fold count on an explicit example: for the tube of radius eps about
      a round S^2 in R^3 inside R^4, the integral of |k1 k2 k3| over the
      (+,-,-) locus is exactly 2 pi^2;
  (h) the threshold 3 sqrt6 pi^2 and its numerical value;
  (i) the index rule for heights of a folded map, tested on the folded map
      S^2 x S^2 -> R^4 obtained from the same tube: all critical points lie on
      the fold and have indices 0, 2, 2, 4 as the rule predicts.
"""
import numpy as np
import sympy as sp
from scipy import integrate, optimize

rng = np.random.default_rng(2026112601)
PASS, FAIL = 0, 0


def report(name, ok, detail=""):
    global PASS, FAIL
    if ok:
        PASS += 1
    else:
        FAIL += 1
    print(f"[{'ok' if ok else 'FAIL'}] {name} {detail}")


def rand_sym(n):
    M = rng.normal(size=(n, n))
    return (M + M.T) / 2


# ---------- (a), (b) ----------
worst_a, worst_b = 0.0, 0.0
for _ in range(2000):
    Ric = rand_sym(4)
    R = np.trace(Ric)
    Ric0 = Ric - R / 4 * np.eye(4)
    A = (Ric - R / 6 * np.eye(4)) / 2
    lam = np.linalg.eigvalsh(A)
    s1 = lam.sum()
    s2 = (s1 ** 2 - (lam ** 2).sum()) / 2
    worst_a = max(worst_a, abs(s2 - (R ** 2 / 96 - (Ric0 ** 2).sum() / 8)))
    G = Ric - R / 2 * np.eye(4)
    worst_b = max(worst_b, np.abs(s1 * np.eye(4) - A + G / 2).max())
report("(a) sigma_2(A) = R^2/96 - |Ric_0|^2/8", worst_a < 1e-12, f"max err {worst_a:.1e}")
report("(b) sigma_1(A) g - A = -G/2", worst_b < 1e-12, f"max err {worst_b:.1e}")

# ---------- (c) ----------
ok = True
lo, hi = np.inf, -np.inf
for _ in range(20000):
    Z = rand_sym(4)
    Z -= np.trace(Z) / 4 * np.eye(4)
    Z /= np.sqrt((Z ** 2).sum())
    R = 1.0
    t = rng.uniform(0, 1) * R / np.sqrt(12)          # |Ric_0| < R/sqrt(12)
    ev = np.linalg.eigvalsh(t * Z + R / 4 * np.eye(4)) / R
    lo, hi = min(lo, ev.min()), max(hi, ev.max())
    ok &= (ev.min() > 0) and (ev.max() < 0.5)
report("(c) in the cone, 0 < Ric < R/2", ok, f"sampled Ric/R in ({lo:.4f}, {hi:.4f})")
Zp = np.diag([3.0, -1, -1, -1]) / np.sqrt(12)        # unit trace-free, top eigenvalue sqrt(3)/2
ev_top = np.linalg.eigvalsh(Zp / np.sqrt(12) + np.eye(4) / 4)   # R = 1, |Ric_0| = R/sqrt12
ev_bot = np.linalg.eigvalsh(-Zp / np.sqrt(12) + np.eye(4) / 4)
report("(c) sharp: Ric_0 ~ diag(3,-1,-1,-1) reaches R/2 on the boundary",
       abs(ev_top.max() - 0.5) < 1e-12, f"top eigenvalue {ev_top.max():.12f}")
report("(c) sharp: Ric_0 ~ diag(-3,1,1,1) reaches 0 on the boundary",
       abs(ev_bot.min()) < 1e-12, f"bottom eigenvalue {ev_bot.min():.1e}")


# ---------- (d) symbolic Gauss test ----------
def ricci_diag(metric, coords):
    """Ricci tensor and scalar of a diagonal metric, straight from the definitions."""
    n = len(coords)
    g = sp.diag(*metric)
    ginv = g.inv()
    Gam = [[[sum(ginv[a, d] * (sp.diff(g[d, b], coords[c]) + sp.diff(g[d, c], coords[b])
                               - sp.diff(g[b, c], coords[d])) for d in range(n)) / 2
             for c in range(n)] for b in range(n)] for a in range(n)]
    Ric = sp.zeros(n, n)
    for b in range(n):
        for d in range(n):
            expr = 0
            for a in range(n):
                expr += sp.diff(Gam[a][b][d], coords[a]) - sp.diff(Gam[a][b][a], coords[d])
                for e in range(n):
                    expr += Gam[a][a][e] * Gam[e][b][d] - Gam[a][d][e] * Gam[e][b][a]
            Ric[b, d] = sp.simplify(expr)
    Rs = sp.simplify(sum(ginv[i, i] * Ric[i, i] for i in range(n)))
    return Ric, Rs


t, x, y, z = sp.symbols('t x y z', real=True)
a, b, c = [sp.Function(n)(t) for n in 'abc']
Ric, Rs = ricci_diag([1, a ** 2, b ** 2, c ** 2], [t, x, y, z])
Gtt = Ric[0, 0] - Rs / 2
kap = [sp.diff(f, t) / f for f in (a, b, c)]
sig2 = kap[0] * kap[1] + kap[0] * kap[2] + kap[1] * kap[2]
res1 = sp.simplify(0 - (-2 * Gtt + 2 * sig2))      # slices are flat tori: R_Sigma = 0
report("(d) dt^2 + a^2 dx^2 + b^2 dy^2 + c^2 dz^2: 0 = -2G_tt + 2 sigma_2(kappa)", res1 == 0,
       f"residual {res1}")

chi, th, ph = sp.symbols('chi theta phi', positive=True)
f = sp.Function('f')(t)
Ric, Rs = ricci_diag([1, f ** 2, f ** 2 * sp.sin(chi) ** 2, f ** 2 * sp.sin(chi) ** 2 * sp.sin(th) ** 2],
                     [t, chi, th, ph])
Gtt = Ric[0, 0] - Rs / 2
k = sp.diff(f, t) / f
res2 = sp.simplify(6 / f ** 2 - (-2 * Gtt + 2 * 3 * k ** 2))   # round S^3(f): R_Sigma = 6/f^2
report("(d) dt^2 + f^2 g_S3: 6/f^2 = -2G_tt + 2 sigma_2(kappa)", res2 == 0, f"residual {res2}")

# ---------- (e) ----------
worst = 0.0
for _ in range(2000):
    kk = rng.normal(size=3)
    H = kk.sum()
    A0sq = ((kk - H / 3) ** 2).sum()
    s2 = kk[0] * kk[1] + kk[0] * kk[2] + kk[1] * kk[2]
    worst = max(worst, abs(2 * s2 - (2 / 3 * H ** 2 - A0sq)))
report("(e) 2 sigma_2(kappa) = (2/3) H^2 - |A0|^2 on a three-dimensional hypersurface",
       worst < 1e-12, f"max err {worst:.1e}")

# ---------- (f) ----------
worst = 0.0
for _ in range(2000):
    kk = rng.normal(size=3)
    H = kk.sum()
    A0sq = ((kk - H / 3) ** 2).sum()
    pair = (kk[0] - kk[1]) ** 2 + (kk[0] - kk[2]) ** 2 + (kk[1] - kk[2]) ** 2
    worst = max(worst, abs(pair - 3 * A0sq))
report("(f) sum_{i<j} (k_i-k_j)^2 = 3 |A0|^2", worst < 1e-12, f"max err {worst:.1e}")


def ratio(v):
    p, q, r = abs(v[0]), -abs(v[1]), -abs(v[2])      # signs (+,-,-)
    kk = np.array([p, q, r])
    A0 = np.sqrt(((kk - kk.mean()) ** 2).sum())
    return abs(p * q * r) / A0 ** 3


best = 0.0
for _ in range(200000):
    best = max(best, ratio(rng.exponential(size=3)))
opt = max((optimize.minimize(lambda v: -ratio(v), rng.exponential(size=3), method='Nelder-Mead',
                             options={'xatol': 1e-12, 'fatol': 1e-14}) for _ in range(40)),
          key=lambda r_: -r_.fun)
C = np.sqrt(6) / 9
report("(f) sup of |k1 k2 k3| / |A0|^3 on signs (+,-,-) is sqrt6/9",
       best <= C + 1e-12 and abs(-opt.fun - C) < 1e-9,
       f"sampled max {best:.6f}, optimiser {-opt.fun:.9f}, sqrt6/9 = {C:.9f}")
v = np.abs(opt.x) / np.abs(opt.x)[0]
report("(f) the maximiser is proportional to (1,-2,-2)", np.allclose(v, [1, 2, 2], atol=1e-4),
       f"|k| ratios {v.round(5)}")
report("(f) value at (1,-2,-2)", abs(ratio([1, 2, 2]) - C) < 1e-14)

# ---------- (g) fold image of the S^2 x S^2 tube ----------
# Tube of radius eps about the round S^2(rho) in R^3 x {0} inside R^4 = R^3 x R:
# principal curvatures for the normal pointing out of the solid tube:
#   1/eps (normal circle),  cos(al)/(rho + eps cos al) twice (the S^2 directions),
# volume element (rho + eps cos al)^2 dA_{S^2} eps d(al), al in [0, 2 pi).
tot = []
for rho, eps in [(1.0, 0.3), (1.0, 0.7), (2.0, 0.1)]:
    def integrand(al):
        kS = np.cos(al) / (rho + eps * np.cos(al))
        K = (1 / eps) * kS ** 2
        return abs(K) * (rho + eps * np.cos(al)) ** 2 * eps
    val, _ = integrate.quad(integrand, np.pi / 2, 3 * np.pi / 2, epsabs=1e-13, epsrel=1e-13)
    tot.append(4 * np.pi * val)
report("(g) S^2 x S^2 tube: integral of |K| over the (+,-,-) part of the fold image = 2 pi^2",
       np.allclose(tot, 2 * np.pi ** 2, rtol=1e-11), f"values {np.round(tot, 10)}, 2 pi^2 = {2*np.pi**2:.10f}")

# ---------- (h) ----------
thr = 2 * np.pi ** 2 / C
report("(h) 2 pi^2 / (sqrt6/9) = 3 sqrt6 pi^2", abs(thr - 3 * np.sqrt(6) * np.pi ** 2) < 1e-12,
       f"= {thr:.6f}")

# ---------- (i) index rule for heights of a folded map, on the same example ----------
# M = S^2 x S^2 = {(|x| - rho)^2 + |y|^2 = eps^2} in R^3 x R^2, folded map f = (x, y_1).
# Normal sphere coordinates: nu = cos(b) (cos(a) n + sin(a) e_4) + sin(b) e_5, fold = {b = 0}.
# Rule under test: the height <f,u> is critical only on the fold, at points whose fold image
# has outward normal nu = sigma u, with index 1 + #{kappa_i > 0} if sigma = +1 and
# #{kappa_i < 0} if sigma = -1 (kappa = principal curvatures of the fold image, convex positive).
p_, q_, a_, b_ = sp.symbols('p q a b', real=True)
rho_v, eps_v = 1.0, 0.45
nvec = sp.Matrix([sp.sin(p_) * sp.cos(q_), sp.sin(p_) * sp.sin(q_), sp.cos(p_)])
uvec = rng.normal(size=4)
uvec /= np.linalg.norm(uvec)
ux, u4 = uvec[:3], uvec[3]
height = ((rho_v + eps_v * sp.cos(b_) * sp.cos(a_)) * (nvec.T * sp.Matrix(ux))[0]
          + eps_v * sp.cos(b_) * sp.sin(a_) * u4)
var = [p_, q_, a_, b_]
grad = sp.lambdify(var, [sp.diff(height, v_) for v_ in var], 'numpy')
hess = sp.lambdify(var, sp.hessian(height, var), 'numpy')
nx = np.linalg.norm(ux)
ok_i, found = True, []
for s_sign in (+1, -1):
    d = s_sign * ux / nx                               # n = +- u_x/|u_x|
    p0, q0 = np.arccos(d[2]), np.arctan2(d[1], d[0])
    for sigma in (+1, -1):
        a0 = np.arctan2(sigma * u4, sigma * s_sign * nx)   # (cos a, sin a) = sigma (s|u_x|, u_4)
        gnorm = np.linalg.norm(grad(p0, q0, a0, 0.0))
        ev = np.linalg.eigvalsh(np.array(hess(p0, q0, a0, 0.0), dtype=float))
        index = int((ev < 0).sum())
        kS = np.cos(a0) / (rho_v + eps_v * np.cos(a0))
        kap = np.array([1 / eps_v, kS, kS])
        predicted = 1 + int((kap > 0).sum()) if sigma == +1 else int((kap < 0).sum())
        ok_i &= gnorm < 1e-12 and np.abs(ev).min() > 1e-6 and index == predicted
        found.append(index)
report("(i) heights of the folded map: critical points on the fold with the predicted indices",
       ok_i and sorted(found) == [0, 2, 2, 4], f"indices {sorted(found)} for a random direction u")
# no critical point off the fold: d/db of the height vanishes only at b = 0 (or where the
# a-circle degenerates), checked on a grid of random points with b != 0
off = 0
for _ in range(20000):
    pt = [rng.uniform(0.1, np.pi - 0.1), rng.uniform(0, 2 * np.pi), rng.uniform(0, 2 * np.pi),
          rng.choice([-1, 1]) * rng.uniform(0.05, np.pi / 2 - 0.05)]
    off += int(np.linalg.norm(grad(*pt)) < 1e-3)
report("(i) no critical points away from the fold (sampled)", off == 0, f"{off} near-critical samples")

print(f"\ncheck_01: {PASS} ok, {FAIL} failed")
raise SystemExit(1 if FAIL else 0)
