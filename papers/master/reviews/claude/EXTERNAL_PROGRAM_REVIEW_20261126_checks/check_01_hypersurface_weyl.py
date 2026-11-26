#!/usr/bin/env python3
"""
check_01: Weyl blocks of a hypersurface in Euclidean R^5 (master manuscript,
Theorem "Immersed recognition and height selection", immersion_entry.tex).

Written from the definitions only (Gauss equation, Weyl decomposition, Hodge
star).  No repository script was read or reused.

Claims tested
  (a) both chiral Weyl blocks of the induced metric have eigenvalues
      (s_j - sbar)/2, where s_1 = k1 k2 + k3 k4, s_2 = k1 k3 + k2 k4,
      s_3 = k1 k4 + k2 k3 are the pair sums of the principal curvatures;
  (b) |W^pm|^2_HS = (1/12) sum_{j<k} (s_j - s_k)^2 and
      |W|^2_tens = 4 (|W^+|^2_HS + |W^-|^2_HS);
  (c) on the signature-(2,2) locus, |W^pm|^2_HS >= (8/3) det A, with equality
      only at principal curvatures (-a,-a,a,a);
  (d) the "E29" inequality  |W^pm|^2_HS + (8/9) (-det A)_+ <= |A0|^4 / 6
      (A0 = trace-free shape operator), sharp at (1,1,-1,-1) and (-1,3,3,3);
  (e) the two pointwise bounds behind the shape threshold 16 sqrt2 pi / 3:
      det A <= |A0|^4/16 on signature (2,2),  -det A <= 3|A0|^4/16 on odd index.
"""
import itertools
import numpy as np
from scipy.optimize import minimize

rng = np.random.default_rng(20261126)
PASS, FAIL = 0, 0


def report(name, ok, detail=""):
    global PASS, FAIL
    if ok:
        PASS += 1
    else:
        FAIL += 1
    print(f"[{'ok' if ok else 'FAIL'}] {name} {detail}")


# ---------- algebra on Lambda^2(R^4) ----------
PAIRS = [(0, 1), (0, 2), (0, 3), (1, 2), (1, 3), (2, 3)]


def levi_civita(n=4):
    eps = np.zeros((n,) * n)
    for perm in itertools.permutations(range(n)):
        sign = np.linalg.det(np.eye(n)[list(perm)])
        eps[perm] = round(sign)
    return eps


EPS = levi_civita()


def hodge_matrix():
    """6x6 matrix of the Hodge star on 2-forms in the basis e_i ^ e_j, i<j."""
    H = np.zeros((6, 6))
    for a, (i, j) in enumerate(PAIRS):
        for b, (k, l) in enumerate(PAIRS):
            H[b, a] = EPS[i, j, k, l]
    return H


HODGE = hodge_matrix()
w, V = np.linalg.eigh(HODGE)
BPLUS = V[:, w > 0.5]    # orthonormal basis of Lambda^+
BMINUS = V[:, w < -0.5]  # orthonormal basis of Lambda^-


def weyl_from_riemann(R):
    """Weyl tensor of an algebraic curvature tensor R_{ijkl} on R^4 (delta metric)."""
    n = 4
    g = np.eye(n)
    Ric = np.einsum('kikj->ij', R)
    s = np.trace(Ric)
    W = R.copy()
    W -= (np.einsum('ik,jl->ijkl', g, Ric) - np.einsum('il,jk->ijkl', g, Ric)
          + np.einsum('jl,ik->ijkl', g, Ric) - np.einsum('jk,il->ijkl', g, Ric)) / (n - 2)
    W += s * (np.einsum('ik,jl->ijkl', g, g) - np.einsum('il,jk->ijkl', g, g)) / ((n - 1) * (n - 2))
    return W, Ric, s


def operator_on_two_forms(T):
    """6x6 matrix T_{(ij),(kl)}, i<j, k<l (unit round sphere -> identity)."""
    M = np.zeros((6, 6))
    for a, (i, j) in enumerate(PAIRS):
        for b, (k, l) in enumerate(PAIRS):
            M[a, b] = T[i, j, k, l]
    return M


def gauss_curvature(A):
    """R_{ijkl} = A_ik A_jl - A_il A_jk (hypersurface in flat space)."""
    return np.einsum('ik,jl->ijkl', A, A) - np.einsum('il,jk->ijkl', A, A)


def pair_sums(k):
    k1, k2, k3, k4 = k
    return np.array([k1 * k2 + k3 * k4, k1 * k3 + k2 * k4, k1 * k4 + k2 * k3])


def weyl_blocks(A):
    R = gauss_curvature(A)
    W, Ric, s = weyl_from_riemann(R)
    Wop = operator_on_two_forms(W)
    Wp = BPLUS.T @ Wop @ BPLUS
    Wm = BMINUS.T @ Wop @ BMINUS
    off = BPLUS.T @ Wop @ BMINUS
    return W, Wp, Wm, off


# (a), (b): random shape operators in random frames
max_err_eig, max_err_norm, max_err_tens, max_off = 0.0, 0.0, 0.0, 0.0
for _ in range(2000):
    k = rng.normal(size=4) * rng.choice([0.3, 1.0, 3.0])
    Q, _ = np.linalg.qr(rng.normal(size=(4, 4)))
    A = Q @ np.diag(k) @ Q.T
    W, Wp, Wm, off = weyl_blocks(A)
    s = pair_sums(k)
    pred = np.sort((s - s.mean()) / 2)
    ep, em = np.sort(np.linalg.eigvalsh(Wp)), np.sort(np.linalg.eigvalsh(Wm))
    max_err_eig = max(max_err_eig, np.abs(ep - pred).max(), np.abs(em - pred).max())
    hs = sum((s[i] - s[j]) ** 2 for i in range(3) for j in range(i + 1, 3)) / 12
    max_err_norm = max(max_err_norm, abs((Wp ** 2).sum() - hs), abs((Wm ** 2).sum() - hs))
    max_err_tens = max(max_err_tens, abs((W ** 2).sum() - 4 * ((Wp ** 2).sum() + (Wm ** 2).sum())))
    max_off = max(max_off, np.abs(off).max())
report("(a) eigenvalues of W^+ and W^- equal (s_j - sbar)/2", max_err_eig < 1e-9, f"max err {max_err_eig:.2e}")
report("(b) |W^pm|^2_HS = (1/12) sum (s_j-s_k)^2", max_err_norm < 1e-8, f"max err {max_err_norm:.2e}")
report("(b) |W|^2_tens = 4(|W^+|^2+|W^-|^2), W maps Lambda^pm to itself",
       max_err_tens < 1e-7 and max_off < 1e-9, f"max err {max_err_tens:.2e}, off-block {max_off:.2e}")


def w2(k):
    s = pair_sums(k)
    return sum((s[i] - s[j]) ** 2 for i in range(3) for j in range(i + 1, 3)) / 12


def a0_4(k):
    a = np.asarray(k) - np.mean(k)
    return float((a ** 2).sum()) ** 2


# (c) middle-signature bound
worst = np.inf
for _ in range(400000):
    k = np.concatenate([-np.abs(rng.normal(size=2)), np.abs(rng.normal(size=2))]) * np.exp(rng.normal())
    d = np.prod(k)
    worst = min(worst, w2(k) / d)
report("(c) |W^pm|^2 >= (8/3) det A on signature (2,2) [400k samples]", worst >= 8 / 3 - 1e-9,
       f"min ratio {worst:.6f} vs 8/3 = {8/3:.6f}")
res_best = np.inf
for _ in range(60):
    x0 = np.abs(rng.normal(size=4)) + 0.1
    f = lambda x: w2([-abs(x[0]), -abs(x[1]), abs(x[2]), abs(x[3])]) / max(np.prod(np.abs(x)), 1e-300)
    r = minimize(f, x0, method='Nelder-Mead', options={'xatol': 1e-12, 'fatol': 1e-14, 'maxiter': 20000})
    if r.fun < res_best:
        res_best, xbest = r.fun, np.abs(r.x) / np.abs(r.x).max()
report("(c) minimiser is (-a,-a,a,a)", abs(res_best - 8 / 3) < 1e-8 and np.allclose(xbest, 1, atol=1e-4),
       f"min {res_best:.10f} at |k| ~ {np.round(xbest, 5)}")

# (d) E29 inequality
worst = np.inf
for _ in range(600000):
    k = rng.normal(size=4) * np.exp(rng.normal())
    lhs = w2(k) + (8 / 9) * max(-np.prod(k), 0.0)
    rhs = a0_4(k) / 6
    worst = min(worst, (rhs - lhs) / max(rhs, 1e-300))
report("(d) |W^pm|^2 + (8/9)(-det A)_+ <= |A0|^4/6 [600k samples]", worst >= -1e-10,
       f"min relative slack {worst:.3e}")
for k in ([1, 1, -1, -1], [-1, 3, 3, 3]):
    lhs = w2(k) + (8 / 9) * max(-np.prod(k), 0.0)
    report(f"(d) equality at k = {k}", abs(lhs - a0_4(k) / 6) < 1e-12, f"lhs {lhs:.6f} rhs {a0_4(k)/6:.6f}")


def neg_gap(x, coef):
    lhs = w2(x) + coef * max(-np.prod(x), 0.0)
    return -(lhs - a0_4(x) / 6) / max(a0_4(x), 1e-300)


viol = 0.0
for _ in range(200):
    r = minimize(neg_gap, rng.normal(size=4), args=(8 / 9 + 1e-3,), method='Nelder-Mead',
                 options={'xatol': 1e-10, 'fatol': 1e-13, 'maxiter': 20000})
    viol = max(viol, -r.fun)
report("(d) coefficient 8/9 is optimal (8/9 + 1e-3 is violated)", viol > 1e-6, f"max violation {viol:.3e}")

# (e) determinant bounds
w22, wodd = 0.0, 0.0
for _ in range(600000):
    k = rng.normal(size=4)
    d = np.prod(k)
    npos = int((k > 0).sum())
    if npos == 2:
        w22 = max(w22, d / a0_4(k))
    elif npos in (1, 3):
        wodd = max(wodd, -d / a0_4(k))
report("(e) det A <= |A0|^4/16 on signature (2,2)", w22 <= 1 / 16 + 1e-12, f"max ratio {w22:.6f} vs {1/16:.6f}")
report("(e) -det A <= 3|A0|^4/16 on odd signature", wodd <= 3 / 16 + 1e-12, f"max ratio {wodd:.6f} vs {3/16:.6f}")

# thresholds that follow
omega = 8 * np.pi ** 2 / 3
thr = np.sqrt(16 * omega + 16 * omega / 3)
report("shape threshold sqrt(16 w + 16 w/3) = 16 sqrt2 pi/3", abs(thr - 16 * np.sqrt(2) * np.pi / 3) < 1e-12,
       f"{thr:.6f}")
report("energy threshold (8/3) w = 64 pi^2/9", abs(8 * omega / 3 - 64 * np.pi ** 2 / 9) < 1e-12)
report("mean middle count below 8 pi^2: (2/w)(3/8) 8 pi^2 = 9/4", abs((2 / omega) * (3 / 8) * 8 * np.pi ** 2 - 9 / 4) < 1e-12)

print(f"\ncheck_01: {PASS} passed, {FAIL} failed")
