"""Shared routines for the Yamabe necklace on S^1(L) x S^3 (unit S^3).

Conventions (see notes/DIR_E49_20261124.md):
  background  g0 = dt^2 + g_{S^3},  s_{g0} = 6,  |S^3| = 2 pi^2
  conformal   g  = u(t)^2 g0,  u(t) = dn(x | m),  x = t / sqrt(2 - m)
  scalar curv s_g = 12 / (2 - m)   (for this normalisation of u)
  period      L = T(m) = 2 K(m) sqrt(2 - m)
  nu          = 3 lambda / s   (dimensionless eigenvalue, nu >= 1 at a minimiser)

Only numpy and mpmath are used.  K, E come from mpmath; dn from its Fourier series.
"""
import numpy as np
import mpmath as mp

Y0 = 8.0 * np.sqrt(6.0) * np.pi          # Yamabe constant of the round S^4
V4 = 8.0 * np.pi ** 2 / 3.0              # volume of the unit S^4


def KE(m):
    """Complete elliptic integrals K(m), E(m) (parameter m, not modulus)."""
    return float(mp.ellipk(m)), float(mp.ellipe(m))


def nome(m):
    K = mp.ellipk(m)
    Kp = mp.ellipk(1 - m)
    return float(mp.exp(-mp.pi * Kp / K))


def period(m):
    K, _ = KE(m)
    return 2.0 * K * np.sqrt(2.0 - m)


def I2j(m):
    """I_0, I_2, I_4, I_6, I_8 with I_{2j} = int_0^K dn^{2j}."""
    K, E = KE(m)
    I0, I2 = K, E
    I4 = (2 * (2 - m) * I2 - (1 - m) * I0) / 3
    I6 = (4 * (2 - m) * I4 - 3 * (1 - m) * I2) / 5
    I8 = (6 * (2 - m) * I6 - 5 * (1 - m) * I4) / 7
    return I0, I2, I4, I6, I8


def yamabe_energy(m):
    """Y = s Vol^{1/2} of the one-period Delaunay metric with parameter m."""
    _, _, I4, _, _ = I2j(m)
    return 24.0 * np.pi * (2.0 - m) ** (-0.75) * np.sqrt(I4)


def m_from_period(L, tol=1e-15):
    """Solve 2 K(m) sqrt(2-m) = L for m in (0,1); requires L > sqrt(2) pi."""
    if L <= np.sqrt(2) * np.pi:
        raise ValueError("no Delaunay solution: L <= sqrt(2) pi")
    f = lambda mm: 2 * mp.ellipk(mm) * mp.sqrt(2 - mm) - L
    lo, hi = mp.mpf(0), mp.mpf(1) - mp.mpf(10) ** (-40)
    mp.mp.dps = 50
    for _ in range(200):
        mid = (lo + hi) / 2
        if f(mid) > 0:
            hi = mid
        else:
            lo = mid
    mp.mp.dps = 15
    return float((lo + hi) / 2)


def dn_grid(m, N):
    """dn(x|m) on x_j = 2 K j / N, j = 0..N-1, from the Fourier series
    dn = pi/(2K) + (2 pi / K) sum_{n>=1} q^n/(1+q^{2n}) cos(n pi x / K)."""
    K, _ = KE(m)
    q = nome(m)
    theta = 2 * np.pi * np.arange(N) / N
    nmax = 1
    while q ** nmax > 1e-18 and nmax < 20000:
        nmax += 1
    n = np.arange(1, nmax + 1)
    coef = q ** n / (1 + q ** (2 * n))
    dn = np.pi / (2 * K) + (2 * np.pi / K) * (np.cos(np.outer(theta, n)) @ coef)
    x = 2 * K * np.arange(N) / N
    return x, dn


def sector_spectrum(m, k, parity, nmodes=None, ngrid=None, nev=4, vectors=False):
    """Lowest nu in the sector (k, parity) of the necklace.

    Solves  -h'' + (2-m)(k+1)^2 h = (4 nu + 2) dn^2 h  on R / 2K  by Galerkin
    in the Fourier basis of the given parity ('even' or 'odd' about x = 0),
    where h = dn * f and f(x) Y_k(theta) is the eigenfunction of Delta_g.
    Returns nu (ascending) and optionally f on the grid.
    """
    K, _ = KE(m)
    q = nome(m)
    if nmodes is None:
        nmodes = int(min(1200, max(48, 40.0 / max(1e-12, -np.log(q)))))
    if ngrid is None:
        ngrid = 8 * nmodes
    x, dn = dn_grid(m, ngrid)
    theta = np.pi * x / K
    w = 2 * K / ngrid                                  # trapezoid weight
    if parity == "even":
        ns = np.arange(0, nmodes)
        Bas = np.cos(np.outer(theta, ns)) / np.sqrt(K)
        Bas[:, 0] = 1.0 / np.sqrt(2 * K)
    else:
        ns = np.arange(1, nmodes + 1)
        Bas = np.sin(np.outer(theta, ns)) / np.sqrt(K)
    a = (ns * np.pi / K) ** 2 + (2 - m) * (k + 1) ** 2  # A' is diagonal
    Bm = (Bas * (dn ** 2 * w)[:, None]).T @ Bas         # B' = <e_n, dn^2 e_m>
    T = Bm / np.sqrt(np.outer(a, a))
    ev, V = np.linalg.eigh(T)
    order = np.argsort(-ev)[:nev]
    lam = 1.0 / ev[order]                               # Lambda = 4 nu + 2
    nu = (lam - 2.0) / 4.0
    if not vectors:
        return nu
    hs = Bas @ (V[:, order] / np.sqrt(a)[:, None])
    fs = hs / dn[:, None]
    return nu, x, dn, fs


def trial_bound(m):
    """Closed-form Rayleigh quotient of the trial function f = dn in the
    k = 1 sector: an upper bound for nu_1(m)."""
    mp_ = 1 - m
    I0, I2, I4, I6, I8 = I2j(m)
    return (-I6 + 4 * (1 + mp_) * I4 - mp_ * I2) / (4 * I6)
