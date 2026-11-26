#!/usr/bin/env python3
"""
check_03: the exact-face cutoff cost of sub-investigation 05
(01_collar_deformation_and_adapted_coordinates/notes/EXACT_FACE_AND_BENDING.md,
 boxed formula; parent manuscript marked_collars_and_smooth_recognition.tex,
 eq. (jet)).

Claim.  In the normalised gauge g = dt^2 + h_t with h_0 = gamma (unit round
S^3), h_0' = 0 and A = h_0''/2, the path

    h_{t,s} = gamma + (1 - s chi(|t|/w)) (h_t - gamma),   0 <= s <= 1,

changes either chiral Weyl energy of a half-strip of width w by

    Delta(s) = w s^2 c + O(w^2),
    c = (|A0|^2_{L^2(S^3)} / 16) * int_0^1 r^4 chi''(r)^2 dr,

and to leading order W^pm = -(1/2)(1 - s B(r)) A0 with B = (r^2 chi)''/2.

Test.  Take the explicit collar h_t = gamma + t^2 A with
A = eps((th^1)^2 - (th^2)^2), which is SU(2)-invariant, so the whole path is
of the form dt^2 + sum a_i(t)^2 (th^i)^2 and its Weyl blocks can be computed
exactly with su2_curvature.py.  |A0|^2_{L^2} = 2 eps^2 * 2 pi^2.
The cutoff is a C^4 polynomial step (enough for a second-order formula).
"""
import os
import sys
import numpy as np
from numpy.polynomial.legendre import leggauss
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from su2_curvature import curvature, VOL_S3  # noqa: E402

PASS, FAIL = 0, 0


def report(name, ok, detail=""):
    global PASS, FAIL
    PASS += ok
    FAIL += (not ok)
    print(f"[{'ok' if ok else 'FAIL'}] {name} {detail}")


# C^4 step S: 0 -> 1 on [0,1];  chi(r) = 1 - S((r - r0)/(r1 - r0)), chi = 1 near 0, 0 near 1
def S(x):
    x = np.clip(x, 0.0, 1.0)
    return 126 * x**5 - 420 * x**6 + 540 * x**7 - 315 * x**8 + 70 * x**9


def dS(x):
    x = np.clip(x, 0.0, 1.0)
    return 630 * x**4 - 2520 * x**5 + 3780 * x**6 - 2520 * x**7 + 630 * x**8


def d2S(x):
    inside = (x > 0) & (x < 1)
    x = np.clip(x, 0.0, 1.0)
    return np.where(inside, 2520 * x**3 - 12600 * x**4 + 22680 * x**5 - 17640 * x**6 + 5040 * x**7, 0.0)


R0, R1 = 0.15, 0.85
L = R1 - R0


def chi(r):
    return 1.0 - S((r - R0) / L)


def dchi(r):
    return -dS((r - R0) / L) / L


def d2chi(r):
    return -d2S((r - R0) / L) / L**2


def profile(t, s, w, eps):
    """a_i, a_i', a_i'' for h_{t,s} = gamma + (1 - s chi(t/w)) t^2 A,  t >= 0."""
    r = t / w
    b = 1 - s * chi(r)
    db = -s * dchi(r) / w
    d2b = -s * d2chi(r) / w**2
    u = eps * b * t**2
    du = eps * (db * t**2 + 2 * b * t)
    d2u = eps * (d2b * t**2 + 4 * db * t + 2 * b)
    out = []
    for sgn in (+1, -1):
        a = np.sqrt(1 + sgn * u)
        p = sgn * du / (2 * a)
        q = sgn * d2u / (2 * a) - du**2 / (4 * a**3)
        out.append((a, p, q))
    out.append((1.0, 0.0, 0.0))
    av, pv, qv = zip(*out)
    return list(av), list(pv), list(qv)


def strip_energy(s, w, eps, key, n=48, panels=24):
    x, wt = leggauss(n)
    tot = 0.0
    edges = np.linspace(0, w, panels + 1)
    for A_, B_ in zip(edges[:-1], edges[1:]):
        for xi, wi in zip(x, wt):
            t = 0.5 * (B_ - A_) * xi + 0.5 * (A_ + B_)
            av, pv, qv = profile(t, s, w, eps)
            tot += 0.5 * (B_ - A_) * wi * curvature(av, pv, qv)[key] * np.prod(av)
    return VOL_S3 * tot


# profile integral int_0^1 r^4 chi''^2 dr and the identity int B^2 = (1/4) int r^4 chi''^2
def Bprof(r):
    return 0.5 * (r**2 * d2chi(r) + 4 * r * dchi(r) + 2 * chi(r))


def quad01(f, n=60):
    """Gauss-Legendre on [0, R0], [R0, R1], [R1, 1] (the profile is polynomial on each piece)."""
    x, wt = leggauss(n)
    tot = 0.0
    for A_, B_ in ((0.0, R0), (R0, R1), (R1, 1.0)):
        r = 0.5 * (B_ - A_) * x + 0.5 * (A_ + B_)
        tot += 0.5 * (B_ - A_) * np.sum(wt * f(r))
    return tot


I4 = quad01(lambda r: r**4 * d2chi(r)**2)
IB2 = quad01(lambda r: Bprof(r)**2)
IB1 = quad01(Bprof)
report("profile identity  int_0^1 B^2 dr = (1/4) int_0^1 r^4 chi''^2 dr", abs(IB2 - I4 / 4) < 1e-11 * I4,
       f"{IB2:.12f} vs {I4/4:.12f}")
report("int_0^1 B dr = 0", abs(IB1) < 1e-12, f"{IB1:.2e}")

eps = 0.3
A0_L2 = 2 * eps**2 * VOL_S3          # |A0|^2 integrated over the unit S^3
c = A0_L2 / 16 * I4

# pointwise leading term: |W^pm|^2 = (1/4)(1 - s B)^2 |A0|^2 + O(w) = (eps^2/2)(1 - sB)^2 + O(w)
s = 0.7


def pointwise_error(w):
    errs = []
    for r in (0.05, 0.3, 0.5, 0.7, 0.95):
        cv = curvature(*profile(r * w, s, w, eps))
        pred = 0.5 * eps**2 * (1 - s * Bprof(r))**2
        errs.append(max(abs(cv['Wp2'] - pred), abs(cv['Wm2'] - pred)) / (eps**2 / 2))
    return max(errs)


e2, e3, e4 = pointwise_error(1e-2), pointwise_error(1e-3), pointwise_error(1e-4)
report("pointwise: |W^pm|^2 = (1/4)(1 - sB)^2 |A0|^2 + O(w)", 9 < e2 / e3 < 11 and 9 < e3 / e4 < 11 and e4 < 5e-3,
       f"error/(eps^2/2) = {e2:.3e}, {e3:.3e}, {e4:.3e} at w = 1e-2, 1e-3, 1e-4")
cv = curvature(*profile(1e-9, 0.0, 1e-3, eps))
ev = np.sort(np.linalg.eigvalsh(cv['Wp']))
report("pointwise: W^+ has eigenvalues -(1/2) A0 = (eps/2)(-1, 0, 1) at the face",
       np.allclose(ev, [-eps / 2, 0, eps / 2], atol=1e-7), f"{np.round(ev, 8)}")

# full-side increment against w s^2 c
print(f"      c = {c:.8f}  (eps = {eps}, int r^4 chi''^2 = {I4:.6f})")
rows = []
for w in (0.2, 0.1, 0.05, 0.025):
    for s in (0.5, 1.0):
        for key in ('Wp2', 'Wm2'):
            d = strip_energy(s, w, eps, key) - strip_energy(0.0, w, eps, key)
            rows.append((w, s, key, d, d / (w * s**2 * c)))
for w, s, key, d, ratio in rows:
    print(f"      w = {w:<6} s = {s:<4} {key}: Delta = {d:.8e}   Delta/(w s^2 c) = {ratio:.6f}")
ratios = {w: [r[4] for r in rows if r[0] == w] for w in (0.2, 0.1, 0.05, 0.025)}
dev = {w: max(abs(np.array(v) - 1)) for w, v in ratios.items()}
report("Delta(s)/(w s^2 c) -> 1 as w -> 0, both chiralities", dev[0.025] < 0.02 and dev[0.025] < dev[0.1] < dev[0.2],
       f"max |ratio - 1|: " + ", ".join(f"w={w}: {dev[w]:.4f}" for w in dev))
lin = dev[0.05] / dev[0.025]
report("remainder is at least O(w^2): halving w at least halves the relative deviation", lin > 1.8,
       f"ratio of deviations {lin:.3f} (4 would mean an O(w^3) remainder in this example)")
chir = max(abs(a_[3] - b_[3]) / abs(a_[3]) for a_, b_ in zip(rows[0::2], rows[1::2]))
report("the two chiral increments of a half-strip coincide (signature defect depends only on the faces)",
       chir < 1e-9, f"max relative difference {chir:.2e}")

# convexity in s and endpoint maximum at small width
w = 0.05
ss = np.linspace(0, 1, 11)
vals = np.array([strip_energy(s_, w, eps, 'Wp2') for s_ in ss])
second = vals[2:] - 2 * vals[1:-1] + vals[:-2]
report("Delta is convex in s and maximal at s = 1 (w = 0.05)", (second > 0).all() and vals.argmax() == len(ss) - 1,
       f"min second difference {second.min():.3e}")

print(f"\ncheck_03: {PASS} passed, {FAIL} failed")
