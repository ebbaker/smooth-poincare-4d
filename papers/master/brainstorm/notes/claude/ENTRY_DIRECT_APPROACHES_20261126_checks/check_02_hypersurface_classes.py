#!/usr/bin/env python3
"""
check_02: Euclidean hypersurfaces M^4 in R^5 as carriers of entry metrics
(note ENTRY_DIRECT_APPROACHES_20261126.md, sections on the immersed branch,
on tubes and on the branch-surface core).

Written from the definitions only.  No repository script was read or reused.

Claims tested
  (a) |W^+|^2_HS = |W^-|^2_HS = (1/12) [ (k1-k4)^2 (k2-k3)^2 + (k1-k3)^2 (k2-k4)^2
      + (k1-k2)^2 (k3-k4)^2 ] for principal curvatures k_i, against a direct
      decomposition of the curvature operator Lambda^2 A;
  (b) tubes about a k-dimensional flat core, principal curvatures
      (1/eps repeated 4-k times, 0 repeated k times): Weyl-flat for k = 0, 1, 3, 4
      and |W^pm|^2 = 1/(6 eps^4) for k = 2;
  (c) induced scalar curvature R = 2 sigma_2(kappa); if sigma_1 > 0 and sigma_2 > 0
      then the sum of any three principal curvatures is positive (3-convexity);
      the cone contains points of signature (2,2), e.g. (-1,-1,4,4);
  (d) the tube of radius eps about a round S^2(rho) in R^3 inside R^5:
      E_pm = (8 pi^2 / 3) / (t^2 (1 - t^2)), t = eps/rho, by quadrature;
      minimum 32 pi^2/3 at t^2 = 1/2 (Gursky's lower bound on S^2 x S^2), where
      the induced metric is conformal to a product of two round unit spheres;
      thin limit (2 pi/3) Area / eps^2;
  (e) rim of a thin pancake: with one principal curvature 1/delta -> infinity,
      delta^2 |W^pm|^2 -> |A0_S|^2 / 4, A0_S the trace-free part of the other three;
  (f) product core of a ramification surface (notation of E15): for the profile
      f = sinh(sqrt(K) r)/sqrt(K) one has V = delta/K and the product cost
      A [ int (f'')^2/f - 2 K delta + K^2 V ] vanishes for every core radius.
"""
import itertools
import numpy as np
import sympy as sp
from scipy import integrate, optimize

rng = np.random.default_rng(2026112602)
PASS, FAIL = 0, 0


def report(name, ok, detail=""):
    global PASS, FAIL
    if ok:
        PASS += 1
    else:
        FAIL += 1
    print(f"[{'ok' if ok else 'FAIL'}] {name} {detail}")


PAIRS = [(0, 1), (0, 2), (0, 3), (1, 2), (1, 3), (2, 3)]


def hodge():
    H = np.zeros((6, 6))
    for a_, (i, j) in enumerate(PAIRS):
        for b_, (k, l) in enumerate(PAIRS):
            perm = (i, j, k, l)
            if len(set(perm)) == 4:
                H[b_, a_] = round(np.linalg.det(np.eye(4)[list(perm)]))
    return H


HODGE = hodge()
assert np.allclose(HODGE @ HODGE, np.eye(6))
PP, PM = (np.eye(6) + HODGE) / 2, (np.eye(6) - HODGE) / 2


def weyl_norms(kappa, rot=None):
    """|W^+|^2, |W^-|^2 (Hilbert-Schmidt on Lambda^pm) of a hypersurface with shape operator A."""
    A = np.diag(kappa)
    if rot is not None:
        A = rot @ A @ rot.T
    Q = np.zeros((6, 6))                       # curvature operator Lambda^2 A (Gauss equation)
    for a_, (i, j) in enumerate(PAIRS):
        for b_, (k, l) in enumerate(PAIRS):
            Q[a_, b_] = A[i, k] * A[j, l] - A[i, l] * A[j, k]
    out = []
    for P in (PP, PM):
        blk = P @ Q @ P
        blk = blk - np.trace(blk) / 3 * P      # remove R/12 on the three-dimensional block
        out.append((blk ** 2).sum())
    return out


def quartic(k):
    k1, k2, k3, k4 = k
    return ((k1 - k4) ** 2 * (k2 - k3) ** 2 + (k1 - k3) ** 2 * (k2 - k4) ** 2
            + (k1 - k2) ** 2 * (k3 - k4) ** 2) / 12


# ---------- (a) ----------
worst = 0.0
for _ in range(500):
    kap = rng.normal(size=4)
    rot, _ = np.linalg.qr(rng.normal(size=(4, 4)))
    wp, wm = weyl_norms(kap, rot)
    worst = max(worst, abs(wp - quartic(kap)), abs(wm - quartic(kap)))
report("(a) |W^+|^2 = |W^-|^2 = quartic in the principal curvatures", worst < 1e-10,
       f"max err {worst:.1e}")

# ---------- (b) ----------
eps = 0.37
vals = [quartic([1 / eps] * (4 - k) + [0.0] * k) for k in range(5)]
report("(b) flat cores of dimension 0, 1, 3, 4 give Weyl-flat tubes",
       all(abs(vals[k]) < 1e-14 for k in (0, 1, 3, 4)), f"values {np.round(vals, 6)}")
report("(b) a two-dimensional core gives |W^pm|^2 = 1/(6 eps^4)",
       abs(vals[2] - 1 / (6 * eps ** 4)) < 1e-10 * vals[2])

# ---------- (c) ----------
ok, n_in, n22 = True, 0, 0
for _ in range(400000):
    kap = rng.normal(size=4) * rng.choice([1, 3])
    s1 = kap.sum()
    s2 = (s1 ** 2 - (kap ** 2).sum()) / 2
    if s1 > 0 and s2 > 0:
        n_in += 1
        ok &= (s1 - kap).min() > 0              # every triple sum is positive
        n22 += int((kap < 0).sum() == 2)
report("(c) sigma_1 > 0, sigma_2 > 0 imply every sum of three principal curvatures > 0", ok,
       f"{n_in} samples in the cone, {n22} of signature (2,2)")
kap = np.array([-1.0, -1, 4, 4])
report("(c) (-1,-1,4,4) lies in the cone with signature (2,2)",
       kap.sum() > 0 and (kap.sum() ** 2 - (kap ** 2).sum()) / 2 > 0,
       f"sigma_1 = {kap.sum():.0f}, sigma_2 = {(kap.sum()**2 - (kap**2).sum())/2:.0f}")


# ---------- (d) ----------
def tube_energy(rho, eps_):
    # {(|x| - rho)^2 + |y|^2 = eps^2}, x in R^3, y in R^2; al in [0, pi] is the polar angle of
    # the normal 2-sphere; curvatures (1/eps, 1/eps, c, c), c = cos(al)/(rho + eps cos al).
    def integrand(al):
        c = np.cos(al) / (rho + eps_ * np.cos(al))
        w = quartic([1 / eps_, 1 / eps_, c, c])
        return w * (rho + eps_ * np.cos(al)) ** 2 * eps_ ** 2 * np.sin(al)
    val, _ = integrate.quad(integrand, 0, np.pi, epsabs=1e-13, epsrel=1e-13)
    return 8 * np.pi ** 2 * val                 # area of S^2 (4 pi) times the angle beta (2 pi)


ok, detail = True, []
for tval in (0.1, 0.3, 0.5, 1 / np.sqrt(2), 0.9):
    num = tube_energy(1.0, tval)
    exact = 8 * np.pi ** 2 / 3 / (tval ** 2 * (1 - tval ** 2))
    ok &= abs(num - exact) < 1e-9 * exact
    detail.append(f"t={tval:.3f}: {num:.6f}")
report("(d) E_pm of the S^2-tube equals (8 pi^2/3)/(t^2(1-t^2))", ok, "; ".join(detail))
res = optimize.minimize_scalar(lambda tv: tube_energy(1.0, tv), bounds=(0.05, 0.95), method='bounded',
                               options={'xatol': 1e-12})
report("(d) the minimum over t is 32 pi^2/3 at t^2 = 1/2",
       abs(res.x ** 2 - 0.5) < 1e-6 and abs(res.fun - 32 * np.pi ** 2 / 3) < 1e-8,
       f"t^2 = {res.x**2:.8f}, E = {res.fun:.8f}, 32 pi^2/3 = {32*np.pi**2/3:.8f}")
report("(d) two-sided minimum 64 pi^2/3 exceeds the entry budget 16 pi^2",
       2 * res.fun > 16 * np.pi ** 2, f"{2*res.fun:.4f} > {16*np.pi**2:.4f}")
al = sp.symbols('alpha', positive=True)
rho_s, eps_s = sp.symbols('rho epsilon', positive=True)
u = eps_s / (rho_s + eps_s * sp.cos(al))        # metric u^2 (d al^2 + sin^2 al d beta^2)
# Gauss curvature of e^{2w} g_0 on the unit sphere: e^{-2w} (1 - Laplace_0 w), w = log u
w = sp.log(u)
lap = sp.diff(sp.sin(al) * sp.diff(w, al), al) / sp.sin(al)
Kc = sp.simplify((1 - lap) / u ** 2)
report("(d) the normal factor rescaled by 1/(rho + eps cos al)^2 has curvature (rho^2 - eps^2)/eps^2",
       sp.simplify(Kc - (rho_s ** 2 - eps_s ** 2) / eps_s ** 2) == 0, f"K = {Kc}")
thin = tube_energy(1.0, 0.01) / ((2 * np.pi / 3) * 4 * np.pi / 0.01 ** 2)
report("(d) thin limit (2 pi/3) Area/eps^2", abs(thin - 1) < 2e-4, f"ratio at t = 0.01: {thin:.6f}")

# ---------- (e) ----------
ok, detail = True, []
for _ in range(5):
    kS = rng.normal(size=3)
    A0sq = ((kS - kS.mean()) ** 2).sum()
    ratios = [d ** 2 * quartic([1 / d, *kS]) / (A0sq / 4) for d in (1e-2, 1e-3, 1e-4)]
    ok &= abs(ratios[-1] - 1) < 2e-3 and abs(ratios[-1] - 1) < abs(ratios[0] - 1)
    detail.append(f"{ratios[-1]:.5f}")
report("(e) pancake rim: delta^2 |W^pm|^2 -> |A0_S|^2/4", ok, "ratios at delta=1e-4: " + ", ".join(detail))

# ---------- (f) ----------
r, K = sp.symbols('r K', positive=True)
e = sp.symbols('e', positive=True)              # core radius
f = sp.sinh(sp.sqrt(K) * r) / sp.sqrt(K)
V = sp.integrate(f, (r, 0, e))
delta = sp.diff(f, r).subs(r, e) - 1
I2 = sp.integrate(sp.simplify(sp.diff(f, r, 2) ** 2 / f), (r, 0, e))
report("(f) hyperbolic core: V = delta/K", sp.simplify(V - delta / K) == 0)
report("(f) hyperbolic core: int (f'')^2/f - 2 K delta + K^2 V = 0",
       sp.simplify(I2 - 2 * K * delta + K ** 2 * V) == 0)

print(f"\ncheck_02: {PASS} ok, {FAIL} failed")
raise SystemExit(1 if FAIL else 0)
