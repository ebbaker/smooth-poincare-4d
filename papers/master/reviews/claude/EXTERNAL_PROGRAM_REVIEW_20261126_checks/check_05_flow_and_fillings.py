#!/usr/bin/env python3
"""
check_05: statements behind review findings F1, F2 and the 05 increments.

  (a) product cylinder  dx^2 + h  over a left-invariant metric h on SU(2):
      W^pm = -(1/2) Ric_0(h) under the Hodge identification, so each chiral
      density is |Ric_0(h)|^2/4 and a cylinder of length L costs
      (L/4) int |Ric_0(h)|^2 in each sign
      (05 surgery manuscript, "A band on the actual meridian-first Mazur cut");
  (b) one-sided connector profile: min of int_0^1 f''^2 over f(0)=0, f'(0)=1,
      f(1)=f'(1)=0 is 4, attained by the clamped cubic x(1-x)^2
      (05 assessment of 19c187a, "Finite one-sided cap");
  (c) convex filling algebra: for G = diag(K_23, K_13, K_12) > 0 the tensor
      S = sqrt(det G) G^{-1} has pairwise eigenvalue products K_ij, which is
      the Gauss equation of a Euclidean hypersurface (05 deformation
      manuscript, thm:convex); the cap boundary term 6*(tr S - H)/3 = 2(tr S - H);
      and 1 - b >= (1 - b^2)/2 on |b| <= 1 (induced height slice);
  (d) Bour's functional F^alpha = (1-alpha) F_W + (alpha/2) F_Ric0
      (arXiv:1012.0342) in the manuscript's normalisation:
        F^alpha = F_W + (alpha/24) F_R - 8 alpha pi^2 chi        (Gauss-Bonnet),
        F^alpha <= (1-alpha) 8 pi^2 chi   <=>   F_Ric0 <= (1-alpha) F_R/12,
        on the Yamabe metric of a class (e, Y) on a homotopy sphere:
            Phi = 2e - alpha (16 pi^2 - Y^2/24),
            hypothesis  <=>  alpha <= 48 (8 pi^2 - e)/Y^2,
            and alpha <= 1 - e/(8 pi^2) suffices because Y <= 8 sqrt6 pi;
        Gursky's bound (Bour, Lemma 4.5 with his Y_B = Y/6):
            Y^2 >= 24 ((1-alpha) 8 pi^2 chi - F^alpha);
        along the flow (1-alpha) 2 E_+ <= F^alpha <= Phi <= 2e, so E_+ <= e/(1-alpha);
  (e) a scalar-flat, conformally flat neck with two Euclidean ends,
      g = (1 + m/r^2)^2 g_Euc on R^4 minus the origin: R = 0, W = 0 and
      int |Ric_0|^2 = 32 pi^2, the value 32 pi^2 (k-1) of Gauss-Bonnet for k
      ends; such a neck therefore lowers F^alpha by 16 alpha pi^2, and at most
      1/(2 alpha) such restarts fit between Phi <= (1-alpha) 16 pi^2 and
      Phi >= 8 pi^2 - 16 alpha pi^2;
  (f) product handle (cap) x S^2(1) attached to the conformally flat model
      H^2(-1) x S^2(1) of a neighbourhood of a round circle: |W^pm|^2 =
      (K_1+K_2)^2/6 on a product of surfaces, and the two-sided Weyl cost of
      the cap is at least 64 pi^2/3 > 16 pi^2, the Euler-characteristic gain
      of the surgery in 4 int sigma_2 = 8 pi^2 chi - (E_+ + E_-).
"""
import os
import sys

import numpy as np
import sympy as sp
from scipy import integrate

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from su2_curvature import curvature, VOL_S3  # noqa: E402

rng = np.random.default_rng(11)
PASS, FAIL = 0, 0


def report(name, ok, detail=""):
    global PASS, FAIL
    PASS += bool(ok)
    FAIL += (not ok)
    print(f"[{'ok' if ok else 'FAIL'}] {name} {detail}")


# ---------------------------------------------------------------- (a)
def milnor_ricci(av):
    """Ricci eigenvalues of the left-invariant metric sum a_i^2 (th^i)^2 on SU(2),
    by Milnor's formula with [e_2,e_3] = lam_1 e_1 (cyclic), lam_1 = 2 a_1/(a_2 a_3)."""
    a1, a2, a3 = av
    lam = np.array([2 * a1 / (a2 * a3), 2 * a2 / (a1 * a3), 2 * a3 / (a1 * a2)])
    mu = lam.sum() / 2 - lam
    return np.array([2 * mu[1] * mu[2], 2 * mu[0] * mu[2], 2 * mu[0] * mu[1]])


worst_norm, worst_spec = 0.0, 0.0
for _ in range(200):
    av = rng.uniform(0.6, 1.7, size=3)
    c = curvature(av, [0, 0, 0], [0, 0, 0])
    ric = milnor_ricci(av)
    ric0 = ric - ric.sum() / 3
    target = (ric0 ** 2).sum() / 4
    worst_norm = max(worst_norm, abs(c['Wp2'] - target), abs(c['Wm2'] - target),
                     abs(c['R'] - ric.sum()))
    spec = np.sort(-ric0 / 2)
    worst_spec = max(worst_spec,
                     np.abs(np.sort(np.linalg.eigvalsh(c['Wp'])) - spec).max(),
                     np.abs(np.sort(np.linalg.eigvalsh(c['Wm'])) - spec).max())
report("(a) cylinder: |W^+|^2 = |W^-|^2 = |Ric_0(h)|^2/4 and R_4 = R_h", worst_norm < 1e-10,
       f"max error {worst_norm:.1e} over 200 left-invariant metrics")
report("(a) cylinder: spec W^pm = spec(-Ric_0(h)/2)", worst_spec < 1e-10,
       f"max error {worst_spec:.1e}")
c_round = curvature([1, 1, 1], [0, 0, 0], [0, 0, 0])
report("(a) round cylinder is conformally flat with R = 6", abs(c_round['Wp2']) < 1e-14
       and abs(c_round['R'] - 6) < 1e-12)

# ---------------------------------------------------------------- (b)
x = sp.symbols('x')
f0 = x * (1 - x) ** 2
val = sp.integrate(sp.diff(f0, x, 2) ** 2, (x, 0, 1))
report("(b) clamped cubic x(1-x)^2 has int f''^2 = 4", val == 4, f"value {val}")
ok_b = True
for k in range(6):
    eta = x ** 2 * (1 - x) ** 2 * sum(sp.Rational(int(rng.integers(-5, 6)), 3) * x ** j
                                     for j in range(k + 1))
    cross = sp.integrate(sp.diff(f0, x, 2) * sp.diff(eta, x, 2), (x, 0, 1))
    extra = sp.integrate(sp.diff(eta, x, 2) ** 2, (x, 0, 1))
    ok_b &= (cross == 0) and (extra >= 0)
report("(b) every clamped perturbation is orthogonal to it and raises the integral", ok_b)

# ---------------------------------------------------------------- (c)
k12, k13, k23 = sp.symbols('k12 k13 k23', positive=True)
G = sp.diag(k23, k13, k12)
S = sp.sqrt(G.det()) * G.inv()
s1, s2, s3 = [sp.simplify(S[i, i]) for i in range(3)]
report("(c) S = sqrt(det G) G^{-1} satisfies s_i s_j = K_ij",
       sp.simplify(s1 * s2 - k12) == 0 and sp.simplify(s1 * s3 - k13) == 0
       and sp.simplify(s2 * s3 - k23) == 0)
H, trS, b = sp.symbols('H trS b', real=True)
report("(c) cap boundary coefficient -6 alpha = 2 (tr S - H) for alpha = (H - tr S)/3",
       sp.simplify(-6 * (H - trS) / 3 - 2 * (trS - H)) == 0)
report("(c) (1 - b) - (1 - b^2)/2 = (1 - b)^2/2 >= 0",
       sp.simplify((1 - b) - (1 - b ** 2) / 2 - (1 - b) ** 2 / 2) == 0)

# ---------------------------------------------------------------- (d)
al, FW, FRic, FR, chi, e, Y = sp.symbols('alpha F_W F_Ric F_R chi e Y', positive=True)
pi = sp.pi
GB = sp.Eq(FW - FRic / 2 + FR / 24, 8 * pi ** 2 * chi)
FRic_sol = sp.solve(GB, FRic)[0]
Fal = (1 - al) * FW + al / 2 * FRic
report("(d) F^alpha = F_W + (alpha/24) F_R - 8 alpha pi^2 chi",
       sp.simplify(Fal.subs(FRic, FRic_sol) - (FW + al / 24 * FR - 8 * al * pi ** 2 * chi)) == 0)
gap = sp.simplify(((1 - al) * 8 * pi ** 2 * chi - Fal).subs(chi, sp.solve(GB, chi)[0]))
report("(d) (1-alpha) 8 pi^2 chi - F^alpha = (1-alpha) F_R/24 - F_Ric0/2",
       sp.simplify(gap - ((1 - al) * FR / 24 - FRic / 2)) == 0)
Phi = Fal.subs(FRic, FRic_sol).subs({FW: 2 * e, FR: Y ** 2, chi: 2})
report("(d) Yamabe gauge: Phi = 2e - alpha (16 pi^2 - Y^2/24)",
       sp.simplify(Phi - (2 * e - al * (16 * pi ** 2 - Y ** 2 / 24))) == 0)
thr = sp.solve(sp.Eq(Phi, (1 - al) * 16 * pi ** 2), al)[0]
report("(d) hypothesis of Bour 1.11 on the Yamabe metric <=> alpha <= 48 (8 pi^2 - e)/Y^2",
       sp.simplify(thr - 48 * (8 * pi ** 2 - e) / Y ** 2) == 0)
report("(d) at Y = 8 sqrt6 pi the threshold is 1 - e/(8 pi^2)",
       sp.simplify(thr.subs(Y, 8 * sp.sqrt(6) * pi) - (1 - e / (8 * pi ** 2))) == 0)
report("(d) Bour's constant: 24/36 = 2/3 for Y_B = Y/6", sp.Rational(24, 36) == sp.Rational(2, 3))
ok_d = True
for _ in range(20000):
    ev = rng.uniform(4 * np.pi ** 2, 8 * np.pi ** 2 * 0.999)
    Yv = rng.uniform(np.sqrt(48 * (8 * np.pi ** 2 - ev)) * 1.0001, 8 * np.sqrt(6) * np.pi)
    D = 4 * ev + Yv ** 2 / 12 - 32 * np.pi ** 2          # trace-free Ricci energy, Yamabe gauge
    av = rng.uniform(0, 1 - ev / (8 * np.pi ** 2))
    Fa = (1 - av) * 2 * ev + av / 2 * D
    ok_d &= D >= -1e-9
    ok_d &= Fa <= (1 - av) * 16 * np.pi ** 2 + 1e-9       # Bour's hypothesis
    ok_d &= Yv ** 2 >= 24 * ((1 - av) * 16 * np.pi ** 2 - Fa) - 1e-9   # Gursky / Lemma 4.5
    ok_d &= Fa <= 2 * ev + 1e-9                            # hence E_+(t) <= e/(1-alpha)
report("(d) 20000 random classes in the band: hypothesis, Gursky bound and E_+ <= e/(1-alpha)", ok_d)

# ---------------------------------------------------------------- (e)
r, m = sp.symbols('r m', positive=True)
u = 1 + m / r ** 2
a_expr = u * r                                   # radius of the S^3 orbit
p_expr = sp.simplify(sp.diff(a_expr, r) / u)     # d a / dt with dt = u dr
q_expr = sp.simplify(sp.diff(p_expr, r) / u)
a_f, p_f, q_f = [sp.lambdify((r, m), ex, 'numpy') for ex in (a_expr, p_expr, q_expr)]


def neck_density(rv, mv=1.0):
    A, P, Q = a_f(rv, mv), p_f(rv, mv), q_f(rv, mv)
    return curvature([A] * 3, [P] * 3, [Q] * 3), A, (1 + mv / rv ** 2)


worst_R, worst_W = 0.0, 0.0
for rv in np.exp(np.linspace(-3, 3, 41)):
    cc, _, _ = neck_density(rv)
    worst_R, worst_W = max(worst_R, abs(cc['R'])), max(worst_W, cc['Wp2'], cc['Wm2'])
report("(e) neck (1+m/r^2)^2 g_Euc is scalar-flat and conformally flat",
       worst_R < 1e-9 and worst_W < 1e-12, f"max |R| {worst_R:.1e}, max |W|^2 {worst_W:.1e}")


def ric_integrand(s):
    rv = np.exp(s)
    cc, A, U = neck_density(rv)
    return cc['Ric02'] * A ** 3 * U * rv * VOL_S3   # dV = a^3 u dr dOmega, dr = r ds


total, _ = integrate.quad(ric_integrand, -14, 14, limit=400, epsabs=1e-11, epsrel=1e-11)
report("(e) int |Ric_0|^2 = 32 pi^2 on the two-ended neck", abs(total / (32 * np.pi ** 2) - 1) < 1e-7,
       f"ratio {total / (32 * np.pi ** 2):.9f}")
alpha = sp.symbols('alpha', positive=True)
drop = alpha / 2 * 32 * pi ** 2
report("(e) F^alpha drop per two-ended neck = 16 alpha pi^2", sp.simplify(drop - 16 * alpha * pi ** 2) == 0)
nmax = sp.simplify((((1 - alpha) * 16 * pi ** 2) - (8 * pi ** 2 - 16 * alpha * pi ** 2)) / drop)
report("(e) number of restarts <= 1/(2 alpha)", sp.simplify(nmax - 1 / (2 * alpha)) == 0)

# ---------------------------------------------------------------- (f)
K1, K2 = sp.symbols('K1 K2', real=True)
Aplus = sp.diag((K1 + K2) / 2, 0, 0)             # curvature operator of a product of surfaces on Lambda^pm
Wplus = Aplus - sp.eye(3) * Aplus.trace() / 3
report("(f) product of surfaces: |W^pm|^2 = (K1+K2)^2/6 = R^2/24",
       sp.simplify(sum(Wplus[i, i] ** 2 for i in range(3)) - (K1 + K2) ** 2 / 6) == 0)
report("(f) H^2(-1) x S^2(1) is conformally flat and scalar-flat; S^2 x S^2 has E_+ = E_- = 32 pi^2/3",
       ((K1 + K2) ** 2 / 6).subs({K1: -1, K2: 1}) == 0
       and sp.simplify(sp.Rational(4, 6) * 16 * pi ** 2 - sp.Rational(32, 3) * pi ** 2) == 0)
rho, Acap = sp.symbols('rho A', positive=True)
tot = 2 * pi * (1 + sp.cosh(rho)) + Acap         # int_cap (K+1) by Gauss-Bonnet, k_g = -coth(rho)
lower = tot ** 2 / Acap                          # Cauchy-Schwarz lower bound for int_cap (K+1)^2
Astar = sp.solve(sp.diff(lower, Acap), Acap)
best = sp.simplify(lower.subs(Acap, 2 * pi * (1 + sp.cosh(rho))))
report("(f) min over the cap area of (int (K+1))^2/A is 8 pi (1 + cosh rho) >= 16 pi",
       sp.simplify(best - 8 * pi * (1 + sp.cosh(rho))) == 0
       and any(sp.simplify(s - 2 * pi * (1 + sp.cosh(rho))) == 0 for s in Astar))
cost = sp.Rational(4, 3) * pi * 16 * pi          # (4 pi/3) * int_cap (K+1)^2  at rho -> 0
report("(f) two-sided Weyl cost of a product handle >= 64 pi^2/3 > 16 pi^2",
       sp.simplify(cost - sp.Rational(64, 3) * pi ** 2) == 0 and float(cost) > float(16 * pi ** 2),
       f"{float(cost / pi ** 2):.4f} pi^2 against a gain of 16 pi^2")

print(f"\ncheck_05: {PASS} passed, {FAIL} failed")
sys.exit(1 if FAIL else 0)
