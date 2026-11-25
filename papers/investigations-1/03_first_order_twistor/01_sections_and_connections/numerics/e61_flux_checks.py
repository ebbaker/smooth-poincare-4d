"""SP4-FOT-SEC-E61: flux of the Noether vector field through the unit three-sphere.

Usage:  python3 e61_flux_checks.py ORDERS [CASES] [NPROC]
        e.g.  python3 e61_flux_checks.py 6,8,10 c1a,c1b,c2,d1,d2 4 >> E61_FLUX_CHECKS.txt

For a metric g near the unit sphere S = {|x| = 1} of R^4 and a vector field X the identity to test is
    e + 8b - k = 0,
    e = int_S |W|^2 g(X,nu) dS,   8b = 8 int_S B(X,nu) dS,   k = int_S b(W; L_X g).nu dS,
written here with the Euclidean unit normal x and the density sqrt(det g):
    int_{S^3} sqrt(det g) P_X^m x_m dsigma = 0,   P_X = |W|^2 X + 8 B(X) - b(W; L_X g).
(c) Exact cones g = delta + eps k(x/|x|) with X = x: the field is homothetic, k vanishes, and e + 8b = 0.
    c1a, c1b use k = s_H = (x Hx + Hx x)/(2|x|^2), c2 a generic quadratic form in x/|x|.
(d) A smooth metric delta + 0.3 exp(-|x-c|^2)(M0 + M1 x) that is not a cone, with X = x (d1) and with a
    generic quadratic vector field (d2): all three terms are present.
Quadrature on S^3: Chebyshev nodes of the second kind in the first angle, Gauss-Legendre in the cosine of
the second, the trapezoid rule in the third; n x n x 2n nodes, exact for spherical polynomials of degree
at most 2n-1.  The integrands are not polynomials, and the residual decreases geometrically in n.
Curvature at each node is exact Taylor arithmetic (sec_jets.py); only the quadrature is approximate.
The column `rel` is |e + 8b - k| divided by the integral of |e| + |8b| + |k| taken pointwise.
"""
import os, sys, time
from multiprocessing import Pool
import numpy as np
from sec_jets import Jets
from sec_noether_lib import noether_vector

J = Jets(4)


def s3_nodes(n):
    k = np.arange(1, n + 1); chi = k * np.pi / (n + 1); wchi = np.pi / (n + 1) * np.sin(chi) ** 2
    ug, wu = np.polynomial.legendre.leggauss(n); th = np.arccos(ug)
    nph = 2 * n; ph = 2 * np.pi * (np.arange(nph) + 0.5) / nph; wph = 2 * np.pi / nph
    pts, wts = [], []
    for a, wa in zip(chi, wchi):
        for b, wb in zip(th, wu):
            for c in ph:
                pts.append([np.cos(a), np.sin(a) * np.cos(b), np.sin(a) * np.sin(b) * np.cos(c), np.sin(a) * np.sin(b) * np.sin(c)])
                wts.append(wa * wb * wph)
    return np.array(pts), np.array(wts)


def cone_metric(p, eps, Mk):
    x = J.var(p)
    r2 = sum(J.mul(x[i], x[i]) for i in range(4))
    ir2 = J.power(r2, -1.0)
    xx = J.ein('k,l->kl', x, x)
    q = np.einsum('ijkl,klC->ijC', Mk, xx)
    return J.const(np.eye(4)) + eps * J.mul(q, ir2[None, None, :]), x


def bump_metric(p, eps, c, Mb):
    x = J.var(p)
    y = x - J.const(c)
    r2 = sum(J.mul(y[i], y[i]) for i in range(4))
    e = J.exp(-r2)
    q = J.const(Mb[0]) + np.einsum('ijk,kC->ijC', Mb[1], x)
    return J.const(np.eye(4)) + eps * J.mul(q, e[None, None, :]), x


rng = np.random.default_rng(7)
H = np.diag([1.0, 0.5, -0.3, -1.2]); H -= np.trace(H) / 4 * np.eye(4)
I4 = np.eye(4)
M_sH = 0.25 * (np.einsum('ik,jl->ijkl', I4, H) + np.einsum('il,jk->ijkl', I4, H)
               + np.einsum('jk,il->ijkl', I4, H) + np.einsum('jl,ik->ijkl', I4, H))
Rg = rng.normal(size=(4, 4, 4, 4)); Rg = Rg + Rg.transpose(1, 0, 2, 3); Rg = Rg + Rg.transpose(0, 1, 3, 2)
Rg /= np.sqrt((Rg ** 2).sum())
cb = np.array([0.4, -0.3, 0.2, 0.5]); A0 = rng.normal(size=(4, 4)); A1 = rng.normal(size=(4, 4, 4))
Mb0 = A0 + A0.T; Mb0 /= np.linalg.norm(Mb0); Mb1 = A1 + A1.transpose(1, 0, 2); Mb1 /= np.sqrt((Mb1 ** 2).sum())
Qv = rng.normal(size=(4, 4)); T3 = rng.normal(size=(4, 4, 4)); v0 = rng.normal(size=4)


def dil(x):
    return x.copy()


def gen(x):
    return J.const(v0) + np.einsum('ik,kC->iC', Qv, x) + 0.3 * np.einsum('ikl,klC->iC', T3, J.ein('k,l->kl', x, x))


CASES = {
    'c1a': ('cone delta + 0.05 s_H, X = x', lambda p: cone_metric(p, 0.05, M_sH), dil),
    'c1b': ('cone delta + 0.30 s_H, X = x', lambda p: cone_metric(p, 0.30, M_sH), dil),
    'c2': ('generic cone, |k| = 0.25, X = x', lambda p: cone_metric(p, 0.25, Rg), dil),
    'd1': ('smooth bump metric, X = x', lambda p: bump_metric(p, 0.3, cb, (Mb0, Mb1)), dil),
    'd2': ('smooth bump metric, generic quadratic X', lambda p: bump_metric(p, 0.3, cb, (Mb0, Mb1)), gen),
}


def one(args):
    case, p, w = args
    _, metric, vf = CASES[case]
    g, x = metric(p)
    X = vf(x)
    N = noether_vector(J, g, X)
    sq = N['sq'][0]
    e = N['W2'][0] * np.dot(X[:, 0], p) * sq
    b = 8.0 * np.dot(N['BX'][:, 0], p) * sq
    k = np.dot(N['b'][:, 0], p) * sq
    return w * np.array([e, b, k, abs(e) + abs(b) + abs(k)])


if __name__ == '__main__':
    ns = [int(a) for a in sys.argv[1].split(',')]
    cases = sys.argv[2].split(',') if len(sys.argv) > 2 else list(CASES)
    nproc = int(sys.argv[3]) if len(sys.argv) > 3 else (os.cpu_count() or 2)
    with Pool(nproc) as pool:
        for case in cases:
            for n in ns:
                pts, wts = s3_nodes(n)
                t0 = time.time()
                res = pool.map(one, [(case, p, w) for p, w in zip(pts, wts)], chunksize=16)
                e, b, k, a = np.sum(res, axis=0)
                print(f'{case} [{CASES[case][0]}] n={n:2d} nodes={len(wts):5d}: e={e:+.9e} 8b={b:+.9e} k={k:+.9e} '
                      f'e+8b-k={e + b - k:+.3e} rel={abs(e + b - k) / a:.1e} [{time.time() - t0:.0f}s]', flush=True)
