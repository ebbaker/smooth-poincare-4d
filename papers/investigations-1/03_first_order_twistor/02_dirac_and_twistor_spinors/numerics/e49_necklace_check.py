"""SP4-FOT-DIR-E49: independent checks of e49_necklace_lib / e49_necklace_spectrum.

Usage:  python3 e49_necklace_check.py

1. Residuals of the exact Lame solutions (mpmath, 30 digits).
2. Eigenvalues recomputed by a conservative finite-difference scheme in the
   variable f (not h), with dn from mpmath.ellipfun (not the Fourier series),
   on the half period with parity boundary conditions, Richardson-extrapolated.
3. The closed form of the Yamabe energy against direct quadrature.
4. A 30-digit Galerkin value of nu_1 at 1 - m = 1e-10 for the coefficient 15/16.
5. The ordering of the low spectrum on a grid of 93 values of m.
"""
import numpy as np
import mpmath as mp
from e49_necklace_lib import Y0, KE, yamabe_energy, sector_spectrum, trial_bound


def lame_residuals():
    mp.mp.dps = 30
    worst = mp.mpf(0)
    for m in (mp.mpf("0.3"), mp.mpf("0.9"), mp.mpf("0.999")):
        K = mp.ellipk(m)
        sn = lambda x: mp.ellipfun("sn", x, m)
        cn = lambda x: mp.ellipfun("cn", x, m)
        dn = lambda x: mp.ellipfun("dn", x, m)
        cases = [  # (h, k, nu)
            (lambda x: dn(x), 0, mp.mpf(0)),
            (lambda x: sn(x) * cn(x), 0, mp.mpf(1)),
            (lambda x: sn(x) * cn(x) * dn(x), 1, mp.mpf(5) / 2),
        ]
        for h, k, nu in cases:
            for x in (K / 7, K / 3, 0.9 * K):
                res = -mp.diff(h, x, 2) + (2 - m) * (k + 1) ** 2 * h(x) - (4 * nu + 2) * dn(x) ** 2 * h(x)
                worst = max(worst, abs(res))
    mp.mp.dps = 15
    return float(worst)


def fd_nu(m, k, bc, N):
    """Lowest eigenvalue of -(dn^2 f')' + (2-m) k(k+2) dn^2 f = 4 nu dn^4 f on [0,K].
    bc = 'NN' (even about 0 and K) or 'DD' (odd about 0 and K).  Cell-centred
    conservative scheme with N cells."""
    K = float(mp.ellipk(m))
    hstep = K / N
    xc = (np.arange(N) + 0.5) * hstep                 # cell centres
    xf = np.arange(N + 1) * hstep                     # faces
    dnc = np.array([float(mp.ellipfun("dn", x, m)) for x in xc])
    dnf = np.array([float(mp.ellipfun("dn", x, m)) for x in xf])
    p = dnf ** 2
    A = np.zeros((N, N))
    for i in range(N):
        if i > 0:
            A[i, i] += p[i] / hstep ** 2
            A[i, i - 1] -= p[i] / hstep ** 2
        elif bc == "DD":
            A[i, i] += 2 * p[0] / hstep ** 2           # ghost value -f_0
        if i < N - 1:
            A[i, i] += p[i + 1] / hstep ** 2
            A[i, i + 1] -= p[i + 1] / hstep ** 2
        elif bc == "DD":
            A[i, i] += 2 * p[N] / hstep ** 2
        A[i, i] += (2 - m) * k * (k + 2) * dnc[i] ** 2
    W = 4 * dnc ** 4
    Ms = A / np.sqrt(np.outer(W, W))
    ev = np.linalg.eigvalsh(Ms)
    return ev


def fd_extrapolated(m, k, bc, N=400, index=0):
    a = fd_nu(m, k, bc, N)[index]
    b = fd_nu(m, k, bc, 2 * N)[index]
    return (4 * b - a) / 3.0


def energy_quadrature(m):
    mp.mp.dps = 25
    m_ = mp.mpf(m)
    K = mp.ellipk(m_)
    B = 1 / mp.sqrt(2 - m_)
    dn = lambda x: mp.ellipfun("dn", x, m_)
    ddn = lambda x: mp.diff(dn, x)
    num = mp.quad(lambda x: 6 * B ** 2 * ddn(x) ** 2 + 6 * dn(x) ** 2, [0, K / 2, K]) * 2 / B
    den = mp.quad(lambda x: dn(x) ** 4, [0, K / 2, K]) * 2 / B
    val = float(mp.sqrt(2 * mp.pi ** 2) * num / mp.sqrt(den))
    mp.mp.dps = 15
    return val


def galerkin_mp(mprime, nmodes=None, dps=30):
    """nu_1 (k=1, even) by the same Galerkin scheme in mpmath arithmetic, using
    the closed-form Fourier coefficients of dn^2."""
    mp.mp.dps = dps
    m = 1 - mp.mpf(mprime)
    K, E, Kp = mp.ellipk(m), mp.ellipe(m), mp.ellipk(1 - m)
    q = mp.exp(-mp.pi * Kp / K)
    if nmodes is None:
        nmodes = int(mp.ceil(-(dps + 3) * mp.log(10) / mp.log(q)))
    d = [E / K] + [2 * mp.pi ** 2 / K ** 2 * n * q ** n / (1 - q ** (2 * n)) for n in range(1, 2 * nmodes + 2)]
    a = [(n * mp.pi / K) ** 2 + 4 * (2 - m) for n in range(nmodes)]
    T = mp.zeros(nmodes)
    for i in range(nmodes):
        for j in range(i, nmodes):
            if i == 0 and j == 0:
                b = d[0]
            elif i == 0:
                b = d[j] / mp.sqrt(2)
            else:
                b = (d[abs(i - j)] + d[i + j]) / 2
            if i == j and i > 0:
                b = d[0] + d[2 * i] / 2
            T[i, j] = T[j, i] = b / mp.sqrt(a[i] * a[j])
    # power iteration with Rayleigh quotient for the largest eigenvalue
    v = mp.matrix([mp.mpf(1) / (1 + i) ** 2 for i in range(nmodes)])
    lam_old = mp.mpf(0)
    for _ in range(4000):
        wv = T * v
        lam = (v.T * wv)[0] / (v.T * v)[0]
        v = wv / mp.norm(wv)
        if abs(lam - lam_old) < mp.mpf(10) ** (-(dps - 2)):
            break
        lam_old = lam
    nu = (1 / lam - 2) / 4
    res = (nu, nmodes)
    mp.mp.dps = 15
    return res


def ordering():
    """Smallest eigenvalue other than 0, the translation mode, nu_e and nu_1."""
    ms = np.concatenate([np.linspace(0.002, 0.998, 84), 1 - np.logspace(-3, -7, 9)])
    worst, where, nue_min, lo, hi, decreasing, prev = 1e9, None, 1e9, 1e9, -1e9, True, None
    for m in ms:
        e0 = sector_spectrum(m, 0, "even", nev=4)
        o0 = sector_spectrum(m, 0, "odd", nev=3)
        e1 = sector_spectrum(m, 1, "even", nev=3)
        o1 = sector_spectrum(m, 1, "odd", nev=2)
        others = list(e0[2:]) + list(o0[1:]) + list(e1[1:]) + list(o1)
        for k in (2, 3):
            for par in ("even", "odd"):
                others += list(sector_spectrum(m, k, par, nev=1))
        assert abs(o0[0] - 1) < 1e-9 and abs(e0[0]) < 1e-9
        if min(others) < worst:
            worst, where = min(others), m
        nue_min = min(nue_min, e0[1])
        lo, hi = min(lo, e1[0]), max(hi, e1[0])
        if prev is not None and e1[0] > prev + 1e-12:
            decreasing = False
        prev = e1[0]
    return len(ms), worst, where, nue_min, lo, hi, decreasing


def main():
    print("1. max residual of the exact Lame solutions dn, sn cn, sn cn dn: %.2e" % lame_residuals())
    print("2. finite differences (variable f, half period) against Galerkin (variable h, full period)")
    for m in (0.5, 0.9, 0.99, 0.999):
        g1 = sector_spectrum(m, 1, "even")[0]
        f1 = fd_extrapolated(m, 1, "NN")
        g0 = sector_spectrum(m, 0, "odd")[0]
        f0 = fd_extrapolated(m, 0, "DD")
        ge = sector_spectrum(m, 0, "even")[1]
        fe = fd_extrapolated(m, 0, "NN", index=1)
        print("   m=%-6g nu(1,even): %.10f vs %.10f   nu(0,odd): %.10f vs %.10f   nu(0,even): %.10f vs %.10f"
              % (m, g1, f1, g0, f0, ge, fe))
    print("3. Yamabe energy: closed form against quadrature of the quotient")
    for m in (0.2, 0.7, 0.99):
        print("   m=%-5g  %.12f  %.12f" % (m, yamabe_energy(m) / Y0, energy_quadrature(m) / Y0))
    print("4. 30-digit Galerkin at small 1-m: (nu_1 - 1)/(1-m) and (trial bound - 1)/(1-m)")
    for mpr in ("1e-6", "1e-10"):
        nu, nm = galerkin_mp(mpr)
        mp.mp.dps = 30
        ratio = (nu - 1) / mp.mpf(mpr)
        mp.mp.dps = 15
        print("   1-m=%s  modes=%d  (nu_1-1)/(1-m) = %s   15/16 = 0.9375" % (mpr, nm, mp.nstr(ratio, 15)))
    n, worst, where, nue_min, lo, hi, dec = ordering()
    print("5. ordering on %d values of m in [0.002, 1-1e-7]: smallest eigenvalue other than 0, 1, nu_e, nu_1"
          " (sectors k<=3) = %.12f at m=%.6g" % (n, worst, where))
    print("   min nu_e = %.10f   nu_1 in [%.10f, %.10f]   nu_1 decreasing in m: %s" % (nue_min, lo, hi, dec))


if __name__ == "__main__":
    main()
