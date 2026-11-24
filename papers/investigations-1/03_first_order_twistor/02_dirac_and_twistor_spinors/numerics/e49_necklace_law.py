"""SP4-FOT-DIR-E49: joint-law, Gram and curvature diagnostics on the necklace.

Usage:  python3 e49_necklace_law.py

For the one-period Delaunay metric with parameter m, take the five lowest
positive eigenfunctions (one k=0 odd mode, four k=1 modes), normalise them in
L^2 of the unit-volume measure and form X = (u_1..u_5)/sqrt(5).  The script
prints the quantities that Theorem "relative pinching and the joint law"
of the manuscript controls, the fourth energy of X, and two exact identities:
  * Gauss-Bonnet-Chern on S^1 x S^3:  int |Ric_0|^2 dV = s^2 Vol / 12,
  * Bochner:  (s^2/12) nu (nu-1) int phi^2 = int |Hess_0 phi|^2 + int Ric_0(grad phi, grad phi).
Floating point (IEEE double) diagnostics only.
"""
import numpy as np
from e49_necklace_lib import KE, I2j, sector_spectrum


def ddx(f, K):
    """Spectral derivative of a 2K-periodic grid function."""
    N = len(f)
    kk = np.fft.fftfreq(N, d=1.0 / N) * (np.pi / K)
    return np.real(np.fft.ifft(1j * kk * np.fft.fft(f)))


def diagnostics(m, nmodes=None):
    K, E = KE(m)
    B2 = 1.0 / (2.0 - m)                # B^2, with x = B t and s = 12 B^2
    s = 12.0 * B2
    nu0, x, dn, f0s = sector_spectrum(m, 0, "odd", nmodes=nmodes, nev=1, vectors=True)
    nu1, x1, dn1, f1s = sector_spectrum(m, 1, "even", nmodes=nmodes, nev=1, vectors=True)
    assert len(x) == len(x1)
    f0, f1 = f0s[:, 0], f1s[:, 0]
    if f1[0] < 0:
        f1 = -f1
    N = len(x)
    w = dn ** 4
    w = w / w.sum()                     # probability weights of d mu_x (uniform grid)
    c0 = 1.0 / np.sqrt(np.sum(w * f0 ** 2))
    c1 = 1.0 / np.sqrt(np.sum(w * f1 ** 2))
    u0, u1 = c0 * f0, c1 * f1           # u_5 = u0(x);  u_j = u1(x) * 2 theta_j
    # fourth moments: E[(2 theta_1)^4] = 2 on the unit S^3
    q0 = np.sum(w * u0 ** 4)
    q1 = 2.0 * np.sum(w * u1 ** 4)
    # mixed direction (u_5 + u_1)/sqrt 2: E[(2 theta)^2] = 1
    qmix = 0.25 * (q0 + q1 + 6.0 * np.sum(w * u0 ** 2 * u1 ** 2))
    S = u0 ** 2 + 4.0 * u1 ** 2         # sum_i u_i^2 = u0^2 + u1^2 * sum_j (2 theta_j)^2
    X2 = S / 5.0
    rad = np.sqrt(np.sum(w * (X2 - 1.0) ** 2))
    # Gram quantities, Gamma(a,b) = (3/s) <da, db>_g
    u0x, u1x = ddx(u0, K), ddx(u1, K)
    G55 = (u0x ** 2 / dn ** 2) / 20.0
    Gtan = (u1x ** 2 + 3.0 * (2.0 - m) * u1 ** 2) / dn ** 2 / 5.0
    trG = G55 + Gtan
    int_trG = np.sum(w * trG)
    res55 = G55 - 0.25 * (1.0 - u0 ** 2 / 5.0)
    out = {
        "m": m, "eps": nu1[0] - 1.0, "nu0": nu0[0], "nu1": nu1[0],
        "q_axis": q0, "q_transverse": q1, "q_mixed": qmix,
        "max_abs_q_dev": max(abs(q0 - 15 / 7), abs(q1 - 15 / 7), abs(qmix - 15 / 7)),
        "radial_L2": rad, "sup_X": np.sqrt(X2.max()), "inf_X": np.sqrt(X2.min()),
        "int_trG": int_trG, "int_trG_expected": (nu0[0] + 4 * nu1[0]) / 5.0,
        "int_trG_sq": np.sum(w * trG ** 2),
        "gram55_res_L1": np.sum(w * np.abs(res55)), "gram55_res_L2": np.sqrt(np.sum(w * res55 ** 2)),
    }
    # law of X_5 = u0/sqrt5 against the round law, density (3/4)(1-t^2) on [-1,1]:
    # Wasserstein-1 distance from the quantile functions (midpoint rule on the grid atoms)
    t = u0 / np.sqrt(5.0)
    order = np.argsort(t)
    pmid = np.cumsum(w[order]) - 0.5 * w[order]
    zz = np.linspace(-1.0, 1.0, 200001)
    Fz = 0.5 + 0.75 * (zz - zz ** 3 / 3.0)
    out["W1_X5"] = float(np.sum(w[order] * np.abs(t[order] - np.interp(pmid, Fz, zz))))
    # curvature identities in the t variable: u = dn(Bt), dV = u^4 dt dOmega
    B = np.sqrt(B2)
    cD = B2 * (1.0 - m)                 # u_t^2 = u^2 - (s/12) u^4 - cD
    dt = lambda f: B * ddx(f, K)
    u = dn
    ut = dt(u)
    Ric0_sq = 12.0 * cD ** 2 / u ** 8
    lhs = np.sum(Ric0_sq * u ** 4)      # common factor 2 pi^2 * dt dropped on both sides
    rhs = s ** 2 * np.sum(u ** 4) / 12.0
    out["GBC_ratio"] = lhs / rhs
    # Bochner identity for phi = f(r) psi(theta), psi a unit first eigenfunction of S^3
    KrKt = -2.0 * cD / u ** 4

    def bochner(f, k, nu):
        ft = dt(f)
        fr = ft / u
        frr = dt(fr) / u
        rp_over_r = ut / u ** 2         # rho'/rho with rho = u, d/dr = u^{-1} d/dt
        if k == 0:
            hess0 = 0.75 * (frr - rp_over_r * fr) ** 2
            ric = 1.5 * KrKt * fr ** 2
        else:
            a = frr
            b = -f / u ** 2 + rp_over_r * fr
            c = fr / u - f * ut / u ** 3
            hess0 = 0.75 * (a - b) ** 2 + 6.0 * c ** 2
            ric = 1.5 * KrKt * (fr ** 2 - f ** 2 / u ** 2)
        left = (s ** 2 / 12.0) * nu * (nu - 1.0) * np.sum(f ** 2 * u ** 4)
        right_h = np.sum(hess0 * u ** 4)
        right_r = np.sum(ric * u ** 4)
        norm = (s ** 2 / 12.0) * np.sum(f ** 2 * u ** 4)
        return left / norm, right_h / norm, right_r / norm

    out["bochner_k0"] = bochner(u0, 0, nu0[0])
    out["bochner_k1"] = bochner(u1, 1, nu1[0])
    return out


def main():
    print("# Joint-law diagnostics; the round values are q = 15/7 = %.9f, |X| = 1" % (15 / 7))
    print("%-9s %-11s %-10s %-10s %-10s %-10s %-10s %-9s %-9s %-9s" % (
        "1-m", "eps", "q_axis", "q_transv", "q_mixed", "|q-15/7|", "rad_L2", "sup|X|", "inf|X|", "W1(X5)"))
    rows = []
    for mp_ in [0.5, 0.2, 0.1, 0.05, 0.02, 0.01, 1e-3, 1e-4, 1e-5, 1e-6]:
        r = diagnostics(1 - mp_)
        rows.append(r)
        print("%-9.1e %-11.4e %-10.6f %-10.6f %-10.6f %-10.3e %-10.3e %-9.5f %-9.5f %-9.2e" % (
            mp_, r["eps"], r["q_axis"], r["q_transverse"], r["q_mixed"], r["max_abs_q_dev"],
            r["radial_L2"], r["sup_X"], r["inf_X"], r["W1_X5"]))
    print()
    print("# Scaling against eps: |q-15/7|/eps, rad_L2/eps, rad_L2/sqrt(eps)")
    for r in rows:
        print("%-9.1e %-12.5f %-12.5f %-12.5f" % (1 - r["m"], r["max_abs_q_dev"] / r["eps"],
              r["radial_L2"] / r["eps"], r["radial_L2"] / np.sqrt(r["eps"])))
    print()
    print("# Gram: int tr G (computed, expected), int (tr G)^2, residual of Gamma(X5,X5) - (1-X5^2)/4 in L1 and L2")
    for r in rows:
        print("%-9.1e %-12.8f %-12.8f %-12.6f %-12.4e %-12.4e" % (
            1 - r["m"], r["int_trG"], r["int_trG_expected"], r["int_trG_sq"],
            r["gram55_res_L1"], r["gram55_res_L2"]))
    print()
    print("# Exact identities: GBC ratio int|Ric_0|^2 / (s^2 Vol/12);  Bochner (nu(nu-1), Hess_0 part, Ric_0 part) in units s^2/12 int phi^2")
    for r in rows:
        b0, b1 = r["bochner_k0"], r["bochner_k1"]
        print("%-9.1e GBC=%.12f  k0: %.3e = %.6f + (%.6f) [sum %.3e]   k1: %.6e = %.6f + (%.6f) [sum %.6e]" % (
            1 - r["m"], r["GBC_ratio"], b0[0], b0[1], b0[2], b0[1] + b0[2],
            b1[0], b1[1], b1[2], b1[1] + b1[2]))


if __name__ == "__main__":
    main()
