"""SP4-FOT-DIR-E49 supplement: checks for the statements about the Delaunay
metrics on S^1 x S^3 that the manuscript revision of 24 November 2026 adds to
the E49 record (notes/DIR_E49_SUPPLEMENT_20261124.md).

Usage:  python3 e49_manuscript_checks.py > E49_MANUSCRIPT_CHECKS.txt

1. Period.  T(m) = 2 K sqrt(2-m) has T'(m) = F(m) / (m (1-m) sqrt(2-m)) with
   F = (2-m) E - 2 (1-m) K, F(0) = 0 and F'(m) = (3/2)(K - E) > 0.
2. Half-period inversion dn(x + K) = sqrt(1-m) / dn(x).
3. The mode sigma = u'/u: residual of -(u^2 sigma')' = (s/3) u^4 sigma, and the
   Rayleigh quotient of sigma restricted to one nodal arc, which must be s/3.
4. The transverse trial functions u theta_i: closed form R(m) against
   quadrature, R(m) > 1, and nu_1(m) <= R(m), fifth eigenvalue <= R(m), with the
   eigenvalues from the Galerkin solver of e49_necklace_lib.
5. Curvature of g = dr^2 + u^2 g_{S^3}: symbolic check with sympy that
   K_rad = s/12 - c/u^4, K_tan = s/12 + c/u^4, Delta sigma = (s/3) sigma and
   Hess_0 sigma = sigma Ric_0; quadrature of int |Ric_0|^2 = s^2 Vol / 12 and of
   int sigma^2 |Ric_0|^2 = (s^2/12) int sigma^2.
6. Constants quoted in the manuscript.

Only numpy, mpmath and sympy are used.  Elliptic integrals take the parameter m.
"""
import numpy as np
import mpmath as mp
import sympy as sp
from e49_necklace_lib import sector_spectrum, trial_bound

mp.mp.dps = 30
MS = [mp.mpf(x) for x in ("0.05", "0.3", "0.7", "0.95", "0.999", "0.999999")]


def K_(m):
    return mp.ellipk(m)


def E_(m):
    return mp.ellipe(m)


def T_(m):
    return 2 * K_(m) * mp.sqrt(2 - m)


def F_(m):
    return (2 - m) * E_(m) - 2 * (1 - m) * K_(m)


def I_all(m):
    I0, I2 = K_(m), E_(m)
    I4 = (2 * (2 - m) * I2 - (1 - m) * I0) / 3
    I6 = (4 * (2 - m) * I4 - 3 * (1 - m) * I2) / 5
    return I0, I2, I4, I6


def R_closed(m):
    I0, I2, I4, I6 = I_all(m)
    return (4 * (2 - m) * I4 - I6 - (1 - m) * I2) / (4 * I6)


def section(title):
    print()
    print(title)
    print("-" * len(title))


def check_period():
    section("1. Period of the profile")
    worst_T, worst_F = mp.mpf(0), mp.mpf(0)
    for m in MS:
        dT = mp.diff(T_, m)
        formula = F_(m) / (m * (1 - m) * mp.sqrt(2 - m))
        dF = mp.diff(F_, m)
        rel_T = abs(dT - formula) / abs(formula)
        rel_F = abs(dF - mp.mpf(3) / 2 * (K_(m) - E_(m))) / abs(dF)
        worst_T, worst_F = max(worst_T, rel_T), max(worst_F, rel_F)
        print(f"m = {mp.nstr(m, 8):>10}  T = {mp.nstr(T_(m), 12):>14}  T' = {mp.nstr(dT, 12):>16}"
              f"  rel.err T' = {mp.nstr(rel_T, 3)}  rel.err F' = {mp.nstr(rel_F, 3)}")
    print("F(1e-25) =", mp.nstr(F_(mp.mpf(10) ** -25), 5), "  T(1e-25) - sqrt(2) pi =",
          mp.nstr(T_(mp.mpf(10) ** -25) - mp.sqrt(2) * mp.pi, 5), "  (both zero to working precision)")
    grid = [mp.mpf(j) / 400 for j in range(1, 400)] + [1 - mp.mpf(10) ** (-j) for j in range(3, 13)]
    pos = all(F_(m) > 0 and K_(m) > E_(m) for m in grid)
    inc = all(T_(grid[i + 1]) > T_(grid[i]) for i in range(len(grid) - 1))
    print("F > 0 and K > E on", len(grid), "values of m:", pos, "  T increasing on the grid:", inc)
    return worst_T < mp.mpf(10) ** -15 and worst_F < mp.mpf(10) ** -15 and pos and inc


def check_half_period():
    section("2. Half-period inversion")
    worst = mp.mpf(0)
    for m in MS:
        K = K_(m)
        for frac in ("0.1", "0.37", "0.8", "1.3"):
            x = mp.mpf(frac) * K
            lhs = mp.ellipfun("dn", x + K, m)
            rhs = mp.sqrt(1 - m) / mp.ellipfun("dn", x, m)
            worst = max(worst, abs(lhs - rhs) / abs(rhs))
    print("max relative error of dn(x+K) = sqrt(1-m)/dn(x):", mp.nstr(worst, 3))
    return worst < mp.mpf(10) ** -20


def profile(m):
    """u, u_t, sigma, sigma_t as functions of t for parameter m."""
    r = mp.sqrt(2 - m)
    sn = lambda x: mp.ellipfun("sn", x, m)
    cn = lambda x: mp.ellipfun("cn", x, m)
    dn = lambda x: mp.ellipfun("dn", x, m)
    u = lambda t: dn(t / r)
    ut = lambda t: -m * sn(t / r) * cn(t / r) / r
    sigma = lambda t: ut(t) / u(t)
    s = 12 / (2 - m)
    c = (1 - m) / (2 - m)
    # sigma' = -(s/12) u^2 + c / u^2, from the first integral
    sigma_t = lambda t: -(s / 12) * u(t) ** 2 + c / u(t) ** 2
    return u, ut, sigma, sigma_t, s, c


def check_sigma():
    section("3. The mode sigma = u'/u")
    worst_res, worst_arc, worst_dsig = mp.mpf(0), mp.mpf(0), mp.mpf(0)
    for m in MS[:5]:
        u, ut, sigma, sigma_t, s, c = profile(m)
        K = K_(m)
        r = mp.sqrt(2 - m)
        for frac in ("0.21", "0.55", "0.83"):
            t = mp.mpf(frac) * K * r
            flux = lambda tt: u(tt) ** 2 * mp.diff(sigma, tt)
            res = -mp.diff(flux, t) - (s / 3) * u(t) ** 4 * sigma(t)
            worst_res = max(worst_res, abs(res) / abs((s / 3) * u(t) ** 4 * sigma(t)))
            worst_dsig = max(worst_dsig, abs(mp.diff(sigma, t) - sigma_t(t)))
        a, b = mp.mpf(0), K * r                      # one nodal arc of sigma
        num = mp.quad(lambda t: u(t) ** 2 * sigma_t(t) ** 2, [a, (a + b) / 2, b])
        den = mp.quad(lambda t: u(t) ** 4 * sigma(t) ** 2, [a, (a + b) / 2, b])
        ratio = num / den / (s / 3)
        worst_arc = max(worst_arc, abs(ratio - 1))
        print(f"m = {mp.nstr(m, 8):>10}  sigma(0) = {mp.nstr(sigma(a), 3)}  sigma(arc end) = {mp.nstr(sigma(b), 3)}"
              f"  arc quotient / (s/3) = {mp.nstr(ratio, 18)}")
    print("max relative residual of the eigen-equation:", mp.nstr(worst_res, 3))
    print("max error of sigma' = -(s/12) u^2 + c/u^2:", mp.nstr(worst_dsig, 3))
    return worst_res < mp.mpf(10) ** -12 and worst_arc < mp.mpf(10) ** -15 and worst_dsig < mp.mpf(10) ** -15


def check_trial():
    section("4. Transverse trial functions and the bound R(m)")
    ok = True
    worst = mp.mpf(0)
    for m in MS[:5]:
        u, ut, sigma, sigma_t, s, c = profile(m)
        Tm = T_(m)
        pts = [0, Tm / 4, Tm / 2, 3 * Tm / 4, Tm]
        num = mp.quad(lambda t: u(t) ** 2 * ut(t) ** 2 + 3 * u(t) ** 4, pts)
        den = mp.quad(lambda t: u(t) ** 6, pts)
        quad_R = num / den / (s / 3)
        rel = abs(quad_R - R_closed(m)) / R_closed(m)
        worst = max(worst, rel)
        print(f"m = {mp.nstr(m, 8):>10}  R closed = {mp.nstr(R_closed(m), 16):>20}  quadrature = {mp.nstr(quad_R, 16):>20}"
              f"  lib trial_bound = {trial_bound(float(m)):.13f}")
    ok = ok and worst < mp.mpf(10) ** -15
    print("max relative difference closed form / quadrature:", mp.nstr(worst, 3))
    grid = [mp.mpf(j) / 200 for j in range(1, 200)] + [1 - mp.mpf(10) ** (-j) for j in range(3, 11)]
    rmin = min(R_closed(m) - 1 for m in grid)
    print("min of R(m) - 1 on", len(grid), "values of m:", mp.nstr(rmin, 6))
    ok = ok and rmin > 0
    print()
    print("     1-m        nu_e        nu_1        R(m)    R-nu_1   fifth lowest  fifth <= R")
    for m in (0.1, 0.3, 0.5, 0.7, 0.9, 0.99, 0.999, 0.9999):
        nu0e = sector_spectrum(m, 0, "even", nev=3)       # 0, nu_e, ...
        nu0o = sector_spectrum(m, 0, "odd", nev=2)        # 1, ...
        nu1e = sector_spectrum(m, 1, "even", nev=2)       # nu_1, ...
        nu1o = sector_spectrum(m, 1, "odd", nev=1)        # 5/2
        nu2e = sector_spectrum(m, 2, "even", nev=1)
        low = [nu0e[1], nu0e[2], nu0o[0], nu0o[1]]
        low += [nu1e[0]] * 4 + [nu1e[1]] * 4 + [nu1o[0]] * 4 + [nu2e[0]] * 9
        low.sort()
        R = float(R_closed(mp.mpf(m)))
        good = low[4] <= R + 1e-9 and nu1e[0] <= R + 1e-9 and abs(nu0o[0] - 1) < 1e-8
        ok = ok and good
        print(f"{1 - m:9.2e}  {nu0e[1]:10.7f}  {nu1e[0]:10.7f}  {R:10.7f}  {R - nu1e[0]:8.1e}  {low[4]:12.7f}  {good}")
    return ok


def check_curvature():
    section("5. Curvature of the Delaunay metric")
    U, p, s, c = sp.symbols("U p s c", positive=True)
    P2 = U ** 2 - s / 12 * U ** 4 - c                    # p^2, first integral
    D = lambda ex: sp.diff(ex, U) * p + sp.diff(ex, p) * (U - s / 6 * U ** 3)

    def red(ex):
        ex = sp.together(sp.expand(ex))
        numr, den = sp.fraction(ex)
        numr = sp.rem(sp.Poly(sp.expand(numr), p), sp.Poly(p ** 2 - P2, p)).as_expr()
        return sp.simplify(numr / den)

    sigma = p / U
    scal = (-6 * (U - s / 6 * U ** 3) + 6 * U) / U ** 3   # u^{-3}(-6u''+6u)
    u_r = p / U
    u_rr = D(u_r) / U
    K_rad = -u_rr / U
    K_tan = (1 - u_r ** 2) / U ** 2
    phi_r = D(sigma) / U
    phi_rr = D(phi_r) / U
    lap = -(phi_rr + 3 * (u_r / U) * phi_r)
    G = phi_rr - (u_r / U) * phi_r                       # Hess_0 = diag(3,-1,-1,-1) G / 4
    checks = {
        "scalar curvature u^-3(-6u''+6u) - s": sp.simplify(scal - s),
        "K_rad - (s/12 - c/u^4)": red(K_rad - (s / 12 - c / U ** 4)),
        "K_tan - (s/12 + c/u^4)": red(K_tan - (s / 12 + c / U ** 4)),
        "sigma' - (-(s/12)u^2 + c/u^2)": red(D(sigma) - (-s / 12 * U ** 2 + c / U ** 2)),
        "Delta sigma - (s/3) sigma": red(lap - s / 3 * sigma),
        "Hess_0 sigma - sigma Ric_0 (radial component)": red(sp.Rational(3, 4) * G - sigma * (-3 * c / U ** 4)),
        "Hess_0 sigma - sigma Ric_0 (tangential component)": red(-sp.Rational(1, 4) * G - sigma * (c / U ** 4)),
    }
    ok = True
    for name, val in checks.items():
        print(f"{name}: {val}")
        ok = ok and val == 0
    worst = mp.mpf(0)
    for m in MS[:5]:
        u, ut, sigma_f, sigma_t, sv, cv = profile(m)
        Tm = T_(m)
        pts = [0, Tm / 4, Tm / 2, 3 * Tm / 4, Tm]
        ric = mp.quad(lambda t: 12 * cv ** 2 * u(t) ** -4, pts)            # int |Ric_0|^2 u^4 dt
        vol = mp.quad(lambda t: u(t) ** 4, pts)
        a = ric / (sv ** 2 * vol / 12)
        hs = mp.quad(lambda t: 12 * cv ** 2 * sigma_f(t) ** 2 * u(t) ** -4, pts)
        l2 = mp.quad(lambda t: sigma_f(t) ** 2 * u(t) ** 4, pts)
        b = hs / (sv ** 2 * l2 / 12)
        ricneck = sv / 4 - 3 / ((2 - m) * (1 - m))
        worst = max(worst, abs(a - 1), abs(b - 1))
        print(f"m = {mp.nstr(m, 8):>10}  int|Ric_0|^2 / (s^2 Vol/12) = {mp.nstr(a, 18)}"
              f"  int sigma^2|Ric_0|^2 / ((s^2/12) int sigma^2) = {mp.nstr(b, 18)}"
              f"  least Ricci eigenvalue at the neck / (s/4) = {mp.nstr(ricneck / (sv / 4), 6)}")
    return ok and worst < mp.mpf(10) ** -15


def check_constants():
    section("6. Constants")
    Y4 = 8 * mp.sqrt(6) * mp.pi
    thr = 8 * mp.sqrt(3) * mp.pi
    print("Y(S^4) = 8 sqrt(6) pi =", mp.nstr(Y4, 10), "  Y(S^4)^2 / (384 pi^2) =", mp.nstr(Y4 ** 2 / (384 * mp.pi ** 2), 12))
    print("8 sqrt(3) pi =", mp.nstr(thr, 10), "  ratio to Y(S^4) =", mp.nstr(thr / Y4, 10), " (1/sqrt 2)")
    print("threshold s^2/12 - 16 pi^2 at s = 8 sqrt(3) pi:", mp.nstr(thr ** 2 / 12 - 16 * mp.pi ** 2, 3),
          "  at s = Y(S^4), divided by s^2/24:", mp.nstr((Y4 ** 2 / 12 - 16 * mp.pi ** 2) / (Y4 ** 2 / 24), 12))
    d2 = mp.mpf(1) / 9 - 64 * mp.pi ** 2 / (3 * Y4 ** 2)
    print("delta bound at s = Y(S^4): sqrt(1/9 - 64 pi^2/(3 s^2)) =", mp.nstr(mp.sqrt(d2), 10), "  1/(3 sqrt 2) =", mp.nstr(1 / (3 * mp.sqrt(2)), 10))
    print("(15/16)/(3/8) =", mp.nstr(mp.mpf(15) / 16 / (mp.mpf(3) / 8), 5), "  (4/5)(15/16)/(3/8) =", mp.nstr(mp.mpf(4) / 5 * mp.mpf(15) / 16 / (mp.mpf(3) / 8), 5))
    for m1 in ("1e-3", "1e-5", "1e-8"):
        m = 1 - mp.mpf(m1)
        I0, I2, I4, I6 = I_all(m)
        Y = 24 * mp.pi * (2 - m) ** (-mp.mpf(3) / 4) * mp.sqrt(I4)
        lam = mp.log(16 / mp.mpf(m1))
        print(f"1-m = {m1}:  (R-1)/(1-m) = {mp.nstr((R_closed(m) - 1) / mp.mpf(m1), 12)}"
              f"  (1-Y/Y(S^4))/(1-m) = {mp.nstr((1 - Y / Y4) / mp.mpf(m1), 12)}"
              f"  T - log(16/(1-m)) = {mp.nstr(T_(m) - lam, 5)}")
    return abs(thr / Y4 - 1 / mp.sqrt(2)) < mp.mpf(10) ** -25


if __name__ == "__main__":
    print("SP4-FOT-DIR-E49 supplement: checks for the manuscript statements on the Delaunay metrics")
    print("mpmath", mp.__version__, " sympy", sp.__version__, " numpy", np.__version__, " working precision", mp.mp.dps, "digits")
    results = [
        ("period formula and monotonicity", check_period()),
        ("half-period inversion", check_half_period()),
        ("sigma eigen-equation and arc quotient", check_sigma()),
        ("trial bound R(m)", check_trial()),
        ("curvature identities", check_curvature()),
        ("constants", check_constants()),
    ]
    print()
    for name, ok in results:
        print(("PASS  " if ok else "FAIL  ") + name)
    print("ALL PASS" if all(ok for _, ok in results) else "SOME CHECKS FAILED")
