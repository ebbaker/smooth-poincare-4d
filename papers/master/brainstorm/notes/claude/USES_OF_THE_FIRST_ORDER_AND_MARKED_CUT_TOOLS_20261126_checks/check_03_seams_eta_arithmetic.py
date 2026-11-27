#!/usr/bin/env python3
"""check_03: arithmetic behind the seam atlas, the eta ledger and the pointwise statements of the note.

(1) Seam atlas.  M a homotopy 4-sphere, Sigma = #_k S^1 x S^2 separating M = V u V', a = b_1(V).
    Mayer-Vietoris and duality give b_1(V)=a, b_2(V)=k-a, b_3(V)=0, and for the double DV:
    b_1 = a, b_2 = 2(k-a).  With Yamabe-positive doubles (Gursky 1998 applied to the doubled class):
        b_1(DV) > 0  =>  e_V >= T chi(V);      b_2(DV) > 0  =>  e_V >= (2T/3) chi(V).
(2) Eta ledger.  For an umbilic separating hypersurface, E_+(V) - E_-(V) = 12 pi^2 (tau(V) + eta(Sigma)),
    hence e >= 12 pi^2 |eta| = 3T |eta| on a homotopy sphere.  Round quotients S^3/Gamma, Gamma in SU(2)
    acting by left multiplication: |eta| = (1/|Gamma|) sum_{g != 1} cot^2(theta_g/2), cos(theta_g) = Re g.
(3) Pointwise algebra in the entering gauge (R > 0, |Z|^2 < R^2/12).
(4) The height-direction count of investigation 04.
"""
import itertools, math, sys
from fractions import Fraction as Fr
import numpy as np

ok = fail = 0
def check(name, cond, detail=""):
    global ok, fail
    if cond: ok += 1
    else: fail += 1
    print(f"{'ok  ' if cond else 'FAIL'}  {name}" + (f"   [{detail}]" if detail else ""))

T = Fr(1)                                  # energies in units of T = 4 pi^2; the wall is 2T
print("(1) seam atlas for Sigma = #_k S^1 x S^2, a = b_1(V)   (lower bounds in units of T)")
def side_bound(b1D, b2D, chi):
    best = Fr(0)
    if b1D > 0: best = max(best, T * chi)
    if b2D > 0: best = max(best, Fr(2, 3) * T * chi)
    return best
entering = []
for k in range(0, 7):
    row = []
    for a in range(0, k + 1):
        chiV, chiW = 1 + k - 2 * a, 1 - k + 2 * a
        lb = side_bound(a, 2 * (k - a), chiV) + side_bound(k - a, 2 * a, chiW)
        row.append(f"a={a}: chi=({chiV},{chiW}) e>={lb}T")
        if lb < 2: entering.append((k, a, lb))
        assert chiV + chiW == 2
    print(f"   k={k}:  " + ";  ".join(row))
check("only k <= 1 leaves room below 2T", all(k <= 1 for k, a, lb in entering), f"cases below the wall: {[(k, a, str(lb)) for k, a, lb in entering]}")
check("k = 1 costs at least 4T/3", all(lb == Fr(4, 3) for k, a, lb in entering if k == 1))
check("0 < a < k always gives e >= 2T", all(side_bound(a, 2*(k-a), 1+k-2*a) + side_bound(k-a, 2*a, 1-k+2*a) >= 2
                                              for k in range(2, 12) for a in range(1, k)))
# general chi-balance: chi(V) <= 1 if b_1(DV) > 0, and chi(V) <= 2 otherwise (then b_2(DV) = 2 chi(V) - 2)
allowed = set()
for chiV in range(-6, 9):
    chiW = 2 - chiV
    for b1V, b1W in itertools.product([0, 1], repeat=2):           # 1 stands for "positive"
        def lb(chi, b1):
            if b1: return max(Fr(0), T * chi)
            return Fr(2, 3) * T * chi if 2 * chi - 2 > 0 else Fr(0)
        if lb(chiV, b1V) + lb(chiW, b1W) < 2: allowed.add((chiV, chiW))
check("positive doubles below the wall force (chi(V), chi(V')) in {(0,2),(1,1),(2,0)}", allowed == {(0, 2), (1, 1), (2, 0)}, str(sorted(allowed)))

print("\n(2) eta invariants of round quotients (left multiplication) and the bound e >= 12 pi^2 |eta|")
def eta_from_real_parts(parts):            # parts: list of (Re g, multiplicity), g != 1
    n = 1 + sum(m for _, m in parts)
    return sum(m * (1 + c) / (1 - c) for c, m in parts) / n, n
for p in range(2, 8):
    val, n = eta_from_real_parts([(math.cos(2 * math.pi * j / p), 1) for j in range(1, p)])
    check(f"Z_{p}: |eta| = (p-1)(p-2)/(3p) = {Fr((p-1)*(p-2), 3*p)}", abs(val - (p-1)*(p-2)/(3*p)) < 1e-12, f"12|eta| = {12*val:.4f} pi^2")
phi = (1 + math.sqrt(5)) / 2
groups = {
    "Q_8": [(-1, 1), (0, 6)],
    "T* (order 24)": [(-1, 1), (0, 6), (0.5, 8), (-0.5, 8)],
    "O* (order 48)": [(-1, 1), (0, 6 + 12), (0.5, 8), (-0.5, 8), (math.sqrt(0.5), 6), (-math.sqrt(0.5), 6)],
    "I* (order 120)": [(-1, 1), (0, 30), (0.5, 20), (-0.5, 20), (phi / 2, 12), (-phi / 2, 12), (1 / (2 * phi), 12), (-1 / (2 * phi), 12)],
}
vals = {}
for name, parts in groups.items():
    val, n = eta_from_real_parts(parts); vals[name] = val
    print(f"      {name}: order {n}, |eta| = {val:.6f}, e >= {12*val:.4f} pi^2 = {3*val:.4f} T")
check("Q_8: |eta| = 3/4, so e >= 9 pi^2 (the value used in investigation 03)", abs(vals["Q_8"] - 0.75) < 1e-12)
check("T*: |eta| = 49/36", abs(vals["T* (order 24)"] - 49/36) < 1e-12)
check("orders 8, 24, 48, 120", [1 + sum(m for _, m in p) for p in groups.values()] == [8, 24, 48, 120])
check("an umbilic round S^3/Q_8 is excluded from the band (3/4 > 2/3)", vals["Q_8"] > 2/3)
check("thresholds: e < 2T needs |eta| < 2/3, and e < T needs |eta| < 1/3", abs(3 * (2/3) - 2) < 1e-15 and abs(3 * (1/3) - 1) < 1e-15)

print("\n(3) pointwise algebra in the entering gauge")
rg = np.random.default_rng(1)
worst = 0.0; gauss_ok = True; pmin = 1e9
for _ in range(20000):
    Z = rg.normal(size=(4, 4)); Z = (Z + Z.T) / 2; Z -= np.trace(Z) / 4 * np.eye(4)
    nz = math.sqrt((Z * Z).sum())
    worst = max(worst, np.linalg.eigvalsh(Z).max() / nz)
    B = rg.normal(size=(3, 3)); B = (B + B.T) / 2; H = np.trace(B); B0 = B - H / 3 * np.eye(3)
    gauss_ok &= abs((H**2 - (B * B).sum()) - ((2/3) * H**2 - (B0 * B0).sum())) < 1e-10
    R = 1.0; Zs = Z / nz * rg.uniform(0, 1) * R / math.sqrt(12)       # |Z| < R/sqrt(12)
    nu = rg.normal(size=4); nu /= np.linalg.norm(nu)
    ric_nn = nu @ Zs @ nu + R / 4
    pmin = min(pmin, R - 2 * ric_nn, ric_nn)
check("largest eigenvalue of a trace-free symmetric 4x4 matrix is at most (sqrt(3)/2)|Z|", worst <= math.sqrt(3) / 2 + 1e-12, f"largest ratio sampled {worst:.4f}, bound {math.sqrt(3)/2:.4f}")
check("H^2 - |B|^2 = (2/3)H^2 - |B0|^2 on hypersurfaces of a 4-manifold", bool(gauss_ok))
check("R > 0 and |Z|^2 < R^2/12 give Ric(nu,nu) > 0 and R - 2 Ric(nu,nu) > 0", pmin > 0, f"least value sampled {pmin:.2e}")
Zx = np.diag([3, -1, -1, -1]) / math.sqrt(12)
check("the eigenvalue bound is attained (so the constant 1/12 is the sharp one for this argument)", abs(np.linalg.eigvalsh(Zx).max() - math.sqrt(3) / 2) < 1e-12)

print("\n(4) height directions (investigation 04): E_+ - (8/3)w >= (4/3) w (avg m_2 - 2), w = |S^4| = 8 pi^2/3")
w = 8 * math.pi**2 / 3
check("E_+ < 8 pi^2 gives avg m_2 - 2 < 1/4", abs((8 * math.pi**2 - (8/3) * w) / ((4/3) * w) - 0.25) < 1e-12)
check("reduced types with two 2-handles: (n_1, n_3) in {(0,2),(1,1),(2,0)}", {(n1, 2 - n1) for n1 in range(3)} == {(0, 2), (1, 1), (2, 0)})

print(f"\ncheck_03: {ok} ok, {fail} FAIL")
sys.exit(1 if fail else 0)
