#!/usr/bin/env python3
"""
Check 02.  The first band T < e < 4T/3 (4 < beta < 8) and the half-PIC condition;
the four-section Weyl contrast used in the master's fixed-width estimate.

PIC_+ (Richard-Seshadri):  R/6 - nu_+ > 0, with nu_+ the largest eigenvalue of W^+.
Gursky's modified scalar curvature:  R - 2 sqrt(6) |W^+|, |W^+| the Hilbert-Schmidt norm.

Claims tested:
 (a) nu_max <= sqrt(2/3) |W| for a trace-free symmetric 3x3 matrix, with equality at
     diag(1, -1/2, -1/2); hence R > 2 sqrt(6)|W^+| implies PIC_+.
 (b) In a unit-volume Yamabe metric  int sigma_2 = Y^2/96 - D/8,  so  Y^2 >= 96 int sigma_2.
 (c) The modified Yamabe quotient with potential R - 2 sqrt(6)|W^+| is bounded below by
     Y - 2 sqrt(6) sqrt(E_+)  (Cauchy-Schwarz), which is positive when E_+ < 4 int sigma_2.
 (d) beta < 8 forces min(E_+, E_-) < 4 int sigma_2; on a homotopy sphere this is e < 16 pi^2/3.
 (e) The same computation with both chiralities in one gauge needs beta <= 4 (the
     Chang-Gursky-Yang range).
 (f) For a curvature operator with chiral Weyl blocks W^+, W^- and Schouten part A,
     D = K_12 - K_13 - K_24 + K_34 equals (W^+_11 - W^+_22) + (W^-_11 - W^-_22), the Schouten
     part cancels, and D^2 <= 4(|W^+|^2 + |W^-|^2).
 (g) The arithmetic 130^2 -> 169 pi^2/25 and 133^2 -> 17689 pi^2/2500 of the fixed-width bound.
 (h) The identity P - 8T = D + Delta/12 behind the recognition gap, and P <= 8e.
 (i) PIC_+ as positivity of the Weitzenboeck operator R/3 - 2W^+ on self-dual two-forms.
 (j) The immersed criterion as an inequality of Chern-Lashof type: |W^+|^2 >= (8/3) det A on the
     signature (2,2) locus of a hypersurface of R^5, and the resulting bound 9 E_+/(32 pi^2) on
     the mean number of index-two critical points of the height functions.

SymPy for the exact identities, NumPy with a fixed seed for the sampled inequalities.
Written for the note PROGRAM_ASSESSMENT_AND_PATH_FORWARD_20261127.md; uses no repository code.
"""
import itertools

import numpy as np
import sympy as sp

pi = sp.pi
rng = np.random.default_rng(20261127)
results = []


def check(name, cond):
    ok = bool(cond)
    results.append(ok)
    print(("ok   " if ok else "FAIL ") + name)


def random_tracefree_sym3():
    m = rng.normal(size=(3, 3))
    m = (m + m.T) / 2
    return m - np.trace(m) / 3 * np.eye(3)


# (a) eigenvalue bound
worst = 0.0
for _ in range(20000):
    w = random_tracefree_sym3()
    worst = max(worst, np.linalg.eigvalsh(w)[-1] / np.linalg.norm(w))
check(f"(a1) nu_max/|W| <= sqrt(2/3) on 20000 samples (max ratio {worst:.6f}, bound {np.sqrt(2/3):.6f})",
      worst <= np.sqrt(2 / 3) + 1e-12)
w = np.diag([1.0, -0.5, -0.5])
check("(a2) equality at diag(1, -1/2, -1/2)", abs(np.linalg.eigvalsh(w)[-1] / np.linalg.norm(w) - np.sqrt(2 / 3)) < 1e-14)
check("(a3) 6 sqrt(2/3) = 2 sqrt(6)", sp.simplify(6 * sp.sqrt(sp.Rational(2, 3)) - 2 * sp.sqrt(6)) == 0)

# (b) Yamabe gauge, unit volume: R = Y constant, sigma_2 = R^2/96 - |Z|^2/8.
Y, D, Ep, Em, sig = sp.symbols("Y D E_p E_m sigma", positive=True)
check("(b1) Y^2 = 96 int sigma_2 + 12 D", sp.simplify(sp.solve(sp.Eq(sig, Y**2 / 96 - D / 8), Y**2)[0] - (96 * sig + 12 * D)) == 0)

# (c) Cauchy-Schwarz lower bound for the modified quotient; sampled on finite measure spaces.
bad = 0
for _ in range(2000):
    n = 50
    mu = rng.uniform(0.1, 1.0, size=n)          # weights of a finite measure space
    wnorm = np.abs(rng.normal(size=n))           # |W^+|
    u = np.abs(rng.normal(size=n)) + 0.01
    lhs = np.sum(mu * wnorm * u**2)
    rhs = np.sqrt(np.sum(mu * wnorm**2)) * np.sqrt(np.sum(mu * u**4))
    bad += lhs > rhs * (1 + 1e-12)
check("(c1) int |W| u^2 <= ||W||_2 ||u||_4^2 on 2000 samples", bad == 0)
# positivity criterion Y^2 > 24 E_+  <=  96 sigma >= 24 E_+ and (D > 0 or strict)
check("(c2) Y^2 - 24 E_+ = 24 (4 int sigma_2 - E_+) + 12 D",
      sp.simplify((96 * sig + 12 * D) - 24 * Ep - (24 * (4 * sig - Ep) + 12 * D)) == 0)

# (d) beta < 8  =>  min(E_+, E_-) < 4 int sigma_2 ; homotopy sphere: e < 16 pi^2/3.
bad = 0
for _ in range(20000):
    s = rng.uniform(0.01, 10)
    a, b = rng.uniform(0, 10, size=2)
    if (a + b) / s < 8 and not (min(a, b) < 4 * s):
        bad += 1
check("(d1) beta < 8 implies min(E_+, E_-) < 4 int sigma_2 (20000 samples)", bad == 0)
e = sp.symbols("e", positive=True)
sol = sp.solve(sp.Eq(e, 4 * (4 * pi**2 - e / 2)), e)
check("(d2) homotopy sphere: e = 4 int sigma_2 exactly at e = 16 pi^2/3 = 4T/3", sol == [sp.Rational(16, 3) * pi**2])
check("(d3) and e < 4 int sigma_2 below it (test at e = 5 pi^2)", (5 * pi**2 < 4 * (4 * pi**2 - 5 * pi**2 / 2)) == True)

# (e) one gauge for both chiralities: 36 int L^2 <= 24 (E_+ + E_-), need <= Y^2 >= 96 sigma.
check("(e1) 36 * (2/3) = 24", sp.Rational(36 * 2, 3) == 24)
check("(e2) 96 sigma >= 24 (E_+ + E_-)  <=>  beta <= 4", sp.simplify(sp.Rational(96, 24) - 4) == 0)
check("(e3) homotopy sphere: 48 (2T - e) >= 48 e  <=>  e <= T",
      sp.solve(sp.Eq(48 * (8 * pi**2 - e), 48 * e), e) == [4 * pi**2])

# (f) four-section contrast.  Basis of two-forms e12,e13,e14,e23,e24,e34 on R^4.
pairs = list(itertools.combinations(range(4), 2))
idx = {p: i for i, p in enumerate(pairs)}


def two_form(i, j):
    v = np.zeros(6)
    v[idx[(i, j)]] = 1.0
    return v


s2 = np.sqrt(2.0)
plus = [(two_form(0, 1) + two_form(2, 3)) / s2, (two_form(0, 2) - two_form(1, 3)) / s2, (two_form(0, 3) + two_form(1, 2)) / s2]
minus = [(two_form(0, 1) - two_form(2, 3)) / s2, (two_form(0, 2) + two_form(1, 3)) / s2, (two_form(0, 3) - two_form(1, 2)) / s2]
P = np.array(plus).T   # 6x3
Q = np.array(minus).T
# sanity: plus forms are self-dual for the Hodge star e12<->e34, e13<->-e24, e14<->e23
star = np.zeros((6, 6))
for (a, b_, sgn) in [((0, 1), (2, 3), 1), ((0, 2), (1, 3), -1), ((0, 3), (1, 2), 1)]:
    star[idx[b_], idx[a]] = sgn
    star[idx[a], idx[b_]] = sgn
check("(f0) the chosen bases are self-dual and anti-self-dual",
      np.allclose(star @ P, P) and np.allclose(star @ Q, -Q))
worst_identity = 0.0
worst_ratio = 0.0
worst_schouten = 0.0
for _ in range(5000):
    wp, wm = random_tracefree_sym3(), random_tracefree_sym3()
    weyl = P @ wp @ P.T + Q @ wm @ Q.T
    K = lambda i, j: two_form(*sorted((i, j))) @ weyl @ two_form(*sorted((i, j)))
    Dval = K(0, 1) - K(0, 2) - K(3, 1) + K(3, 2)
    pred = (wp[0, 0] - wp[1, 1]) + (wm[0, 0] - wm[1, 1])
    worst_identity = max(worst_identity, abs(Dval - pred))
    worst_ratio = max(worst_ratio, Dval**2 / (4 * (np.sum(wp**2) + np.sum(wm**2))))
    A = rng.normal(size=(4, 4)); A = (A + A.T) / 2
    Ks = lambda i, j: A[i, i] + A[j, j]            # sectional curvature of the Schouten part A (KN) g
    worst_schouten = max(worst_schouten, abs(Ks(0, 1) - Ks(0, 2) - Ks(3, 1) + Ks(3, 2)))
check(f"(f1) D = (W+_11 - W+_22) + (W-_11 - W-_22) (max error {worst_identity:.2e})", worst_identity < 1e-12)
check(f"(f2) D^2 <= 4(|W+|^2 + |W-|^2) on 5000 samples (max ratio {worst_ratio:.4f})", worst_ratio <= 1 + 1e-12)
check(f"(f3) the Schouten part cancels in D (max {worst_schouten:.2e})", worst_schouten < 1e-12)

# (g) arithmetic of the fixed-width bound: combined density >= D^2/4 on a strip of volume
# > 8 pi^2 (1.28)/3200, and each chirality on the complete band gets at least half.
vol = 8 * pi**2 * sp.Rational(128, 100) / 3200
check("(g1) floor 130 gives c > 169 pi^2/25", sp.simplify(sp.Rational(130**2, 4) * vol / 2 - sp.Rational(169, 25) * pi**2) == 0)
check("(g2) floor 133 gives c > 17689 pi^2/2500", sp.simplify(sp.Rational(133**2, 4) * vol / 2 - sp.Rational(17689, 2500) * pi**2) == 0)
check("(g3) 169/25 > 4, so one band alone exceeds T = 4 pi^2", sp.Rational(169, 25) > 4)


# (h) The identity behind the recognition gap of the master manuscript, on a homotopy sphere:
#     P = 4 e + 3 l^2,  Delta = 36 l^2 - Y^2,  and in the unit-volume Yamabe gauge
#     16 pi^2 = 2 e + Y^2/24 - D/2.
ee, l2, DD = sp.symbols("e l2 D", positive=True)
Ysq = sp.solve(sp.Eq(16 * pi**2, 2 * ee + sp.Symbol("Y2") / 24 - DD / 2), sp.Symbol("Y2"))[0]
P_spec = 4 * ee + 3 * l2
Delta = 36 * l2 - Ysq
T = 4 * pi**2
check("(h1) P - 8T = D + Delta/12", sp.simplify(P_spec - 8 * T - (DD + Delta / 12)) == 0)
check("(h2) l^2 <= 4e/3 gives P <= 8e, hence e - T >= D/8 + Delta/96 when both are nonnegative",
      sp.simplify(P_spec.subs(l2, sp.Rational(4, 3) * ee) - 8 * ee) == 0)
# (i) PIC_+ is positivity of the Weitzenboeck operator R/3 - 2 W^+ on self-dual two-forms.
bad = 0
for _ in range(5000):
    w = random_tracefree_sym3()
    Rs = rng.uniform(0, 12)
    nu = np.linalg.eigvalsh(w)[-1]
    weitz_min = np.linalg.eigvalsh(Rs / 3 * np.eye(3) - 2 * w)[0]
    curv = np.linalg.eigvalsh(w + Rs / 12 * np.eye(3))      # curvature operator on Lambda^+
    bad += (weitz_min > 0) != (Rs / 6 - nu > 0)
    bad += (curv[0] + curv[1] > 0) != (Rs / 6 - nu > 0)
check("(i1) R/3 - 2W^+ > 0  <=>  R/6 > nu_+  <=>  the two smallest eigenvalues of W^+ + R/12 have positive sum (5000 samples)",
      bad == 0)


# (j) The immersed criterion as an inequality of Chern-Lashof type.  For a hypersurface of R^5
#     with principal curvatures k_1..k_4 the curvature operator is diagonal on e_i ^ e_j with
#     entries k_i k_j, so the self-dual block is diag(a_1, a_2, a_3) with
#     a_1 = (k1 k2 + k3 k4)/2, a_2 = (k1 k3 + k2 k4)/2, a_3 = (k1 k4 + k2 k3)/2.
def wplus_sq_hypersurface(k):
    R_op = np.diag([k[i] * k[j] for (i, j) in pairs])
    block = P.T @ R_op @ P
    block = block - np.trace(block) / 3 * np.eye(3)
    return float(np.sum(block**2))

worst_ratio = np.inf
for _ in range(20000):
    k = np.concatenate([-np.abs(rng.normal(size=2)) - 1e-3, np.abs(rng.normal(size=2)) + 1e-3])
    worst_ratio = min(worst_ratio, wplus_sq_hypersurface(k) / np.prod(k))
check(f"(j1) |W^+|^2 >= (8/3) det A on the signature (2,2) locus, 20000 samples (min ratio {worst_ratio:.5f})",
      worst_ratio >= 8 / 3 - 1e-9)
check("(j2) equality at principal curvatures (-1, -1, 1, 1)",
      abs(wplus_sq_hypersurface(np.array([-1.0, -1.0, 1.0, 1.0])) - 8 / 3) < 1e-12)
area_S4 = sp.Rational(8, 3) * pi**2
Eplus = sp.symbols("E_plus", positive=True)
mean_m2 = 2 * sp.Rational(3, 8) * Eplus / area_S4      # (1/|S^4|) * 2 int_U det A <= this
check("(j3) mean number of index-two points <= 9 E_+/(32 pi^2)",
      sp.simplify(mean_m2 - 9 * Eplus / (32 * pi**2)) == 0)
check("(j4) mean < 1 iff E_+ < 32 pi^2/9;  mean >= 2 iff E_+ >= 64 pi^2/9;  E_+ < 8 pi^2 gives mean < 9/4",
      sp.solve(sp.Eq(mean_m2, 1), Eplus) == [sp.Rational(32, 9) * pi**2]
      and sp.solve(sp.Eq(mean_m2, 2), Eplus) == [sp.Rational(64, 9) * pi**2]
      and sp.simplify(mean_m2.subs(Eplus, 8 * pi**2) - sp.Rational(9, 4)) == 0)

n_ok = sum(results)
print(f"check_02: {n_ok} ok, {len(results) - n_ok} failed")
raise SystemExit(0 if n_ok == len(results) else 1)
