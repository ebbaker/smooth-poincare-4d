#!/usr/bin/env python3
"""
Check 01.  The dictionary between the chiral energy e of the master manuscript
and the conformal invariant beta of Chang, Gursky and Zhang, and the model values.

Conventions (master manuscript): W^+ and W^- act on real two-forms, norms are
Hilbert-Schmidt, E_pm = int |W^pm|^2, the curvature operator of the unit sphere is
the identity.  A = (Ric - R g/6)/2, sigma_2(A) = R^2/96 - |Z|^2/8, Z = Ric - R g/4.
Chern-Gauss-Bonnet in this normalization:  8 pi^2 chi = (E_+ + E_-) + 4 int sigma_2.
Chang-Gursky-Zhang:  beta = int ||W||^2 / int sigma_2(P), with ||W||^2 the norm of W
as an endomorphism of two-forms (so int ||W||^2 = E_+ + E_-) and P = A.

Also tested: (e) Gursky's inequality E_+ >= (4 pi^2/3)(2 chi + 3 tau) has the same threshold as
E_+ < 4 int sigma_2, and gives beta >= 8 for indefinite intersection forms; (f) the reduction of
the case b_2 = 0, beta < 8 to homotopy spheres through the universal cover; (g) the margin of the
recognition gap in the two parametrizations.

Exact arithmetic with SymPy.  Written for the note
PROGRAM_ASSESSMENT_AND_PATH_FORWARD_20261127.md; uses no repository code.
"""
import sympy as sp

pi = sp.pi
results = []


def check(name, cond):
    ok = bool(cond)
    results.append(ok)
    print(("ok   " if ok else "FAIL ") + name)


def int_sigma2(chi, weyl_total):
    """int sigma_2 from Chern-Gauss-Bonnet, given chi and E_+ + E_-."""
    return (8 * pi**2 * chi - weyl_total) / 4


# (a) Gauss-Bonnet on three Einstein models, computed directly from R and volume.
# Round S^4: R = 12, vol = 8 pi^2/3, W = 0, chi = 2.
s4 = 4 * sp.Rational(12**2, 96) * (8 * pi**2 / 3)
check("(a1) round S^4: 4 int sigma_2 = 16 pi^2 = 8 pi^2 chi", sp.simplify(s4 - 16 * pi**2) == 0)

# Fubini-Study CP^2 with holomorphic sectional curvature 4: R = 24, vol = pi^2/2,
# W^+ = diag(R/6, -R/12, -R/12), W^- = 0, chi = 3, tau = 1.
R = 24
vol = pi**2 / 2
Wp = sp.diag(sp.Rational(R, 6), -sp.Rational(R, 12), -sp.Rational(R, 12))
Ep_cp2 = sum(x**2 for x in Wp.diagonal()) * vol
Em_cp2 = 0
four_sigma = 4 * sp.Rational(R**2, 96) * vol
check("(a2) CP^2: E_+ = 12 pi^2 = 12 pi^2 tau (signature formula)", sp.simplify(Ep_cp2 - 12 * pi**2) == 0)
check("(a3) CP^2: 8 pi^2 chi = E_+ + E_- + 4 int sigma_2",
      sp.simplify(8 * pi**2 * 3 - (Ep_cp2 + Em_cp2 + four_sigma)) == 0)

# Product of two unit two-spheres: R = 4, vol = 16 pi^2, |W^pm|^2 = (K+1)^2/6 = 2/3, chi = 4.
Ep_prod = sp.Rational(2, 3) * 16 * pi**2
four_sigma = 4 * sp.Rational(4**2, 96) * 16 * pi**2
check("(a4) S^2 x S^2: E_+ = E_- = 32 pi^2/3", sp.simplify(Ep_prod - sp.Rational(32, 3) * pi**2) == 0)
check("(a5) S^2 x S^2: 8 pi^2 chi = E_+ + E_- + 4 int sigma_2",
      sp.simplify(8 * pi**2 * 4 - (2 * Ep_prod + four_sigma)) == 0)

# (b) beta on the three models: 0, 4, 8 (Chang-Gursky-Zhang, Zhang).
beta_s4 = 0 / int_sigma2(2, 0)
beta_cp2 = (Ep_cp2 + Em_cp2) / int_sigma2(3, Ep_cp2 + Em_cp2)
beta_prod = (2 * Ep_prod) / int_sigma2(4, 2 * Ep_prod)
check("(b1) beta(S^4, round) = 0", beta_s4 == 0)
check("(b2) beta(CP^2, Fubini-Study) = 4", sp.simplify(beta_cp2 - 4) == 0)
check("(b3) beta(S^2 x S^2, product) = 8", sp.simplify(beta_prod - 8) == 0)

# (c) On a homotopy four-sphere chi = 2, tau = 0, E_+ = E_- = e.
e, b = sp.symbols("e beta", positive=True)
T = 4 * pi**2
beta_of_e = sp.simplify(2 * e / int_sigma2(2, 2 * e))
check("(c1) beta = 4 e/(8 pi^2 - e) on a homotopy sphere", sp.simplify(beta_of_e - 4 * e / (8 * pi**2 - e)) == 0)
check("(c2) beta = 4  <=>  e = T = 4 pi^2", sp.solve(sp.Eq(beta_of_e, 4), e) == [T])
check("(c3) beta = 8  <=>  e = 4T/3 = 16 pi^2/3", sp.solve(sp.Eq(beta_of_e, 8), e) == [sp.Rational(16, 3) * pi**2])
check("(c4) beta is increasing in e on (0, 2T)", sp.simplify(sp.diff(beta_of_e, e) - 32 * pi**2 / (8 * pi**2 - e) ** 2) == 0)
check("(c5) beta -> infinity as e -> 2T = 8 pi^2 from below", sp.limit(beta_of_e, e, 8 * pi**2, "-") == sp.oo)
e_of_beta = sp.solve(sp.Eq(4 * e / (8 * pi**2 - e), b), e)[0]
check("(c6) inverse: e = 8 pi^2 beta/(4 + beta)", sp.simplify(e_of_beta - 8 * pi**2 * b / (4 + b)) == 0)
check("(c7) entry e < 2T  <=>  int sigma_2 > 0", sp.simplify(int_sigma2(2, 2 * e) - (4 * pi**2 - e / 2)) == 0)

# (d) Connected sums with additive Weyl energy: int sigma_2 drops by 4 pi^2 per sum.
c1, c2, w1, w2 = sp.symbols("chi1 chi2 w1 w2")
drop = int_sigma2(c1 + c2 - 2, w1 + w2) - (int_sigma2(c1, w1) + int_sigma2(c2, w2))
check("(d1) int sigma_2(M1 # M2) = int sigma_2(M1) + int sigma_2(M2) - 4 pi^2", sp.simplify(drop + 4 * pi**2) == 0)
k = sp.symbols("k", positive=True, integer=True)
sig_kcp2 = k * 3 * pi**2 - (k - 1) * 4 * pi**2
check("(d2) k CP^2 with additive energy: int sigma_2 = (4 - k) pi^2, positive only for k <= 3",
      sp.simplify(sig_kcp2 - (4 - k) * pi**2) == 0)


# (e) Gursky's inequality and the threshold of the first band.
#     Gursky: Y > 0 and b_2^+ > 0 give E_+ >= (4 pi^2/3)(2 chi + 3 tau).
chi_, tau_, Ep_ = sp.symbols("chi tau E_p", real=True)
Em_ = Ep_ - 12 * pi**2 * tau_                      # signature formula
four_sig = 8 * pi**2 * chi_ - Ep_ - Em_            # 4 int sigma_2
gursky_plus = sp.Rational(4, 3) * pi**2 * (2 * chi_ + 3 * tau_)
check("(e1) 4 int sigma_2 - E_+ = 3 [(4 pi^2/3)(2 chi + 3 tau) - E_+]: the two thresholds coincide",
      sp.simplify(four_sig - Ep_ - 3 * (gursky_plus - Ep_)) == 0)
check("(e2) on a homotopy sphere Gursky's threshold is 16 pi^2/3 = 4T/3",
      sp.simplify(gursky_plus.subs({chi_: 2, tau_: 0}) - sp.Rational(16, 3) * pi**2) == 0)
# indefinite form: both orientations satisfy Gursky's inequality
gursky_minus = sp.Rational(4, 3) * pi**2 * (2 * chi_ - 3 * tau_)
w_min = sp.simplify(gursky_plus + gursky_minus)
beta_at_min = sp.simplify(w_min / ((8 * pi**2 * chi_ - w_min) / 4))
check("(e3) indefinite form: E_+ + E_- >= 16 pi^2 chi/3, and beta = 8 exactly at that value",
      sp.simplify(w_min - sp.Rational(16, 3) * pi**2 * chi_) == 0 and beta_at_min == 8)
w_ = sp.symbols("w", positive=True)
check("(e4) for chi > 0, beta is increasing in the total Weyl energy, so beta >= 8 for indefinite forms",
      sp.simplify(sp.diff(w_ / ((8 * pi**2 * chi_ - w_) / 4), w_) - 32 * pi**2 * chi_ / (8 * pi**2 * chi_ - w_) ** 2) == 0)

# (f) Reduction to homotopy spheres.  M closed oriented, b_1 = b_2 = 0, universal cover of degree d.
d = sp.symbols("d", positive=True, integer=True)
chi_M = 2                                   # 2 - 2 b_1 + b_2
chi_cover = d * chi_M
b2_cover = chi_cover - 2                    # the cover is simply connected
check("(f1) the d-fold universal cover has b_2 = 2d - 2 and signature 0, so b_2^+ = b_2^- = d - 1",
      sp.simplify(b2_cover - (2 * d - 2)) == 0 and sp.simplify(b2_cover / 2 - (d - 1)) == 0)
num, den = sp.symbols("num den", positive=True)
check("(f2) beta is unchanged on a finite cover (both integrals are multiplied by d)",
      sp.simplify((d * num) / (d * den) - num / den) == 0)
check("(f3) hence d >= 2 forces an indefinite form and beta >= 8; beta < 8 leaves d = 1",
      all((2 * dd - 2) // 2 >= 1 for dd in range(2, 50)) and (2 * 1 - 2) == 0)

# (g) The margin of the recognition gap in the two parametrizations.
eps = sp.symbols("epsilon", positive=True)
check("(g1) e = T + eps  <=>  beta = 4 + 8 eps/(4 pi^2 - eps)",
      sp.simplify(beta_of_e.subs(e, T + eps) - (4 + 8 * eps / (4 * pi**2 - eps))) == 0)

n_ok = sum(results)
print(f"check_01: {n_ok} ok, {len(results) - n_ok} failed")
raise SystemExit(0 if n_ok == len(results) else 1)
