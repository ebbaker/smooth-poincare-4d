"""SP4-FOT-SEC-E60: homogeneous solutions of the linearized Bach equation on R^4 minus the origin.

Usage:  python3 e60_mode_count.py [quick|full] > E60_MODE_COUNT.txt

For the ansatz spaces  h_ij = P_ij(x) rho^(mu-d) (log rho)^e,  P_ij homogeneous polynomials of degree d,
e in a given set, the script computes the dimensions of the kernels of B' and of W' (evaluation of the exact
operators of sec_linmodel.py at random points, ranks by singular values).  A field with B'(h) = 0 and
W'(h) != 0 is a solution of the linearized Bach equation that is not a linearized conformally flat metric.
The column `ker B' - ker W'` counts such solutions modulo the kernel of W'.

Finite limits: mu in {-2,-1,0,1,2}; d <= 2 (quick) or d <= 4 (full); logarithms up to the second power at
mu = 0.  The ansatz with polynomial degree d contains all fields of homogeneity mu whose restriction to the
sphere has spherical-harmonic degree at most d and the same parity as d, so the table is evidence, in these
ranges, for the statements proved in the note, not a proof.  Ranks use a relative threshold 1e-9; the gap
to the next singular value is printed.
"""
import sys, time
import numpy as np
from sec_linmodel import F, ZERO, PAIRS, lin_ops, monomials

rng = np.random.default_rng(11)
W_KEYS = [(i, j, k, l) for i in range(4) for j in range(i + 1, 4) for k in range(4) for l in range(k + 1, 4) if (i, j) <= (k, l)]


def basis(d, logs):
    return [((i, j), a, e) for (i, j) in PAIRS for a in monomials(d) for e in logs]


def element(b, d, mu):
    (i, j), a, e = b
    h = {p: ZERO for p in PAIRS}
    h[(i, j)] = F.mono(a, mu - d, e)
    return h


def ranks(d, mu, logs):
    bs = basis(d, logs)
    nb = len(bs)
    npts = nb // 10 + 8
    pts = [rng.normal(size=4) for _ in range(npts)]
    MB = np.zeros((10 * npts, nb)); MW = np.zeros((len(W_KEYS) * npts, nb))
    for c, b in enumerate(bs):
        ops = lin_ops(element(b, d, mu))
        for ip, p in enumerate(pts):
            rho = np.linalg.norm(p)
            for r, key in enumerate(PAIRS):
                MB[ip * 10 + r, c] = ops['B'][key](p) * rho ** (4 - mu)
            for r, key in enumerate(W_KEYS):
                MW[ip * len(W_KEYS) + r, c] = ops['W'][key](p) * rho ** (2 - mu)

    def rank(M):
        if np.abs(M).max() == 0:
            return 0, np.inf
        s = np.linalg.svd(M, compute_uv=False)
        s = s / s[0]
        r = int((s > 1e-9).sum())
        gap = (s[r - 1] / s[r]) if 0 < r < len(s) and s[r] > 0 else np.inf
        return r, gap
    rB, gB = rank(MB); rW, gW = rank(MW)
    return nb, rB, gB, rW, gW


if __name__ == '__main__':
    mode = sys.argv[1] if len(sys.argv) > 1 else 'quick'
    only = sys.argv[2] if len(sys.argv) > 2 else None        # optional: a single case "mu,d,logs" such as "0,3,01"
    cases = []
    for d in (0, 1, 2, 3, 4):
        cases.append((d, 0, (0,)))
    for d in (0, 1, 2, 3):
        cases.append((d, 0, (0, 1)))
    cases.append((2, 0, (0, 1, 2)))
    for mu in (-1, 1):
        for d in (1, 2, 3):
            cases.append((d, mu, (0,)))
    for mu in (-2, 2):
        for d in (0, 2, 3, 4):
            cases.append((d, mu, (0,)))
    if mode == 'quick':
        cases = [c for c in cases if c[0] <= 2]
    if only:
        mu_s, d_s, l_s = only.split(',')
        cases = [(int(d_s), int(mu_s), tuple(int(ch) for ch in l_s))]
    else:
        print("ansatz h_ij = P_ij(x) rho^(mu-d) (log rho)^e, deg P = d;  kernel dimensions of B' and W' on the ansatz space")
        print(" mu  d  logs        dim   rank B'  ker B'   rank W'  ker W'   ker B' - ker W'   (singular value gaps)")
    for (d, mu, logs) in cases:
        t0 = time.time()
        nb, rB, gB, rW, gW = ranks(d, mu, logs)
        print(f" {mu:+d}  {d}  {str(logs):10s} {nb:5d}   {rB:5d}   {nb - rB:5d}    {rW:5d}   {nb - rW:5d}      {(nb - rB) - (nb - rW):4d}"
              f"          ({gB:.1e}, {gW:.1e})  [{time.time() - t0:.0f}s]", flush=True)
