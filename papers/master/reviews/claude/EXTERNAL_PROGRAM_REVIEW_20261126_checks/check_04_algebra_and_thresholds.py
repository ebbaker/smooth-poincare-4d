#!/usr/bin/env python3
"""
check_04: small algebraic statements used at load-bearing points.

  (a) trace-free symmetric 3x3 blocks: (3/2) lmax^2 <= |W|^2_HS <= 6 lmax^2,
      hence e/6 <= int L^2 <= 4e/3 and (9/2) e <= P <= 8e   (recognition_gap.tex);
  (b) Hamilton's block ODE  dA/dt = A^2 + 2 adj(A) + B B^T: the derivative of
      the sum of the two smallest eigenvalues of A is at least
      a1^2 + a2^2 + 2 a3 (a1 + a2)   (isotropic_gap.tex, "lower heat bound"),
      so (a1+a2)_- satisfies a linear differential inequality with coefficient |Rm|;
  (c) signature eta invariant of S^3/Q_8 has absolute value 3/4, so a Q_8 neck
      forces |E_+ - E_-| = 12 pi^2 * 3/4 = 9 pi^2 > 8 pi^2 on one side
      (complete_limits.tex); the Z_2 quotient RP^3 has eta = 0;
  (d) round boundary form: min of 6 int_0^inf (w'^2 + (l+1)^2 w^2) dt with
      w(0) = 1 is 6(l+1), and sqrt(1 + l(l+2)) = l+1   (marked_cut.tex);
  (e) band width: Raede's bound width < 2 pi/n at scal >= n(n-1), n = 4,
      rescales to rho d^2 < 3 pi^2, and the two-end form
      arctan(2a/sqrt(3 rho)) + arctan(2b/sqrt(3 rho)) + sqrt(rho/3) d <= 0
      (05, POSITIVE_SCALAR_INTERMEDIATE_CUTS.md);
  (f) balanced-disk arithmetic: (2 - 2^-k) I - 2T >= eps* once 2^-k (T + eps*) <= eps*
      and I > T + eps*   (balanced_disk.tex);
  (g) Gursky's bound for Einstein metrics in this normalisation: e >= Y^2/24
      with Y^2 = 48 (8 pi^2 - e) gives e >= 16 pi^2/3 = (4/3) T.
"""
import numpy as np
import sympy as sp

rng = np.random.default_rng(7)
PASS, FAIL = 0, 0


def report(name, ok, detail=""):
    global PASS, FAIL
    PASS += bool(ok)
    FAIL += (not ok)
    print(f"[{'ok' if ok else 'FAIL'}] {name} {detail}")


# (a)
lo, hi = np.inf, 0.0
for _ in range(300000):
    lam = rng.normal(size=2)
    ev = np.array([lam[0], lam[1], -lam.sum()])
    m = ev.max()
    ratio = (ev ** 2).sum() / m ** 2
    lo, hi = min(lo, ratio), max(hi, ratio)
report("(a) 3/2 <= |W|^2/lmax^2 <= 6 on trace-free 3x3", lo >= 1.5 - 1e-12 and hi <= 6 + 1e-12,
       f"observed range [{lo:.5f}, {hi:.5f}]")
report("(a) extremal spectra (2,-1,-1) and (1,1,-2)",
       abs((4 + 1 + 1) / 4 - 1.5) < 1e-15 and abs((1 + 1 + 4) / 1 - 6) < 1e-15)

# (b)
def adj3(A):
    return np.linalg.det(A) * np.linalg.inv(A)


worst = np.inf
for _ in range(20000):
    A = rng.normal(size=(3, 3))
    A = (A + A.T) / 2
    B = rng.normal(size=(3, 3)) * rng.choice([0.0, 0.5, 2.0])
    w, V = np.linalg.eigh(A)
    if min(w[1] - w[0], w[2] - w[1]) < 1e-2 or abs(np.linalg.det(A)) < 1e-6:
        continue
    F = A @ A + 2 * adj3(A) + B @ B.T
    # first-order perturbation of simple eigenvalues: d(a_i) = v_i^T F v_i
    d = V[:, 0] @ F @ V[:, 0] + V[:, 1] @ F @ V[:, 1]
    bound = w[0] ** 2 + w[1] ** 2 + 2 * w[2] * (w[0] + w[1])
    worst = min(worst, d - bound)
report("(b) d/dt (a1 + a2) >= a1^2 + a2^2 + 2 a3 (a1 + a2) under Hamilton's block ODE", worst >= -1e-9,
       f"min slack {worst:.3e}")

# (c) eta invariant of S^3/Gamma for Gamma in SU(2) acting by left multiplication on H = R^4
def left_mult(q):
    a, b, c, d = q
    return np.array([[a, -b, -c, -d], [b, a, -d, c], [c, d, a, -b], [d, -c, b, a]], dtype=float)


def eta_abs(group):
    tot = 0.0
    for q in group:
        M = left_mult(q)
        if np.allclose(M, np.eye(4)):
            continue
        ang = np.angle(np.linalg.eigvals(M))
        th = np.sort(np.abs(ang))[::2]          # the two rotation angles (isoclinic: equal)
        tot += np.prod(1.0 / np.tan(th / 2)) if not np.isclose(th[0], np.pi) else 0.0
    return abs(tot) / len(group)


Q8 = [np.array(v, dtype=float) * sgn for v in ([1, 0, 0, 0], [0, 1, 0, 0], [0, 0, 1, 0], [0, 0, 0, 1]) for sgn in (1, -1)]
Z2 = [np.array([1.0, 0, 0, 0]), np.array([-1.0, 0, 0, 0])]
Z4 = [np.array(v, dtype=float) for v in ([1, 0, 0, 0], [0, 1, 0, 0], [-1, 0, 0, 0], [0, -1, 0, 0])]
e8, e2, e4 = eta_abs(Q8), eta_abs(Z2), eta_abs(Z4)
report("(c) |eta(S^3/Q_8)| = 3/4, |eta| = 1/2 for each cyclic Z_4, eta(RP^3) = 0",
       abs(e8 - 0.75) < 1e-12 and abs(e4 - 0.5) < 1e-12 and abs(e2) < 1e-12, f"{e8:.6f}, {e4:.6f}, {e2:.6f}")
report("(c) 12 pi^2 * 3/4 = 9 pi^2 exceeds the band ceiling 8 pi^2", 12 * np.pi ** 2 * e8 > 8 * np.pi ** 2,
       f"{12*np.pi**2*e8:.4f} > {8*np.pi**2:.4f}")

# (d)
t, l = sp.symbols('t l', positive=True)
wfun = sp.exp(-(l + 1) * t)
energy = 6 * sp.integrate(sp.diff(wfun, t) ** 2 + (l + 1) ** 2 * wfun ** 2, (t, 0, sp.oo))
report("(d) cylinder extension energy 6(l+1) and sqrt(1 + l(l+2)) = l+1",
       sp.simplify(energy - 6 * (l + 1)) == 0 and sp.sqrt(sp.factor(1 + l * (l + 2))) - (l + 1) == 0)

# (e)
rho, d, a, b = sp.symbols('rho d a b', positive=True)
scaled_width = sp.sqrt(rho / 12) * d             # width in the metric (rho/12) g, where scal >= 12
report("(e) sqrt(rho/12) d < pi/2  <=>  rho d^2 < 3 pi^2",
       sp.simplify((sp.pi / 2) ** 2 * 12 / rho - 3 * sp.pi ** 2 / rho) == 0)
# Theorem 2.7 with n = 4: H(d_pm X) >= -/+ 3 tan(2 l_pm), width <= l_+ - l_-; outward means a, b rescale by sqrt(12/rho)
at = sp.atan(a * sp.sqrt(12 / rho) / 3)
report("(e) arctan(H sqrt(12/rho)/3) = arctan(2H/sqrt(3 rho)) and 2 sqrt(rho/12) d = sqrt(rho/3) d",
       sp.simplify(a * sp.sqrt(12 / rho) / 3 - 2 * a / sp.sqrt(3 * rho)) == 0
       and sp.simplify(2 * scaled_width - sp.sqrt(rho / 3) * d) == 0)

# (f)
T = 4 * sp.pi ** 2
k, I, es = sp.symbols('k I epsilon_star', positive=True)
expr = (2 - 2 ** (-k)) * (T + es) - 2 * T      # value at I = T + eps*, increasing in I
report("(f) (2 - 2^-k)(T + eps*) - 2T = 2 eps* - 2^-k (T + eps*)  (>= eps* under the stated choice of k)",
       sp.simplify(expr - (2 * es - 2 ** (-k) * (T + es))) == 0)

# (g)
e = sp.symbols('e', positive=True)
sol = sp.solve(sp.Eq(e, 48 * (8 * sp.pi ** 2 - e) / 24), e)
report("(g) e = Y^2/24 with Y^2 = 48(8 pi^2 - e)  =>  e = 16 pi^2/3 = (4/3) T",
       len(sol) == 1 and sp.simplify(sol[0] - sp.Rational(4, 3) * T) == 0, f"e = {sol[0]}")

print(f"\ncheck_04: {PASS} passed, {FAIL} failed")
