"""SP4-FOT-SEC-E59: the energy identity of the proof of Theorem 1 on exact cones, per unit of log|x|.

Usage:  python3 e59_cone_identity_check.py ORDERS [NPROC]      e.g.  python3 e59_cone_identity_check.py 6,8,10 4

For a metric g = delta + v whose Cartesian components are homogeneous of degree zero, testing the first
variation of the Weyl functional with phi(log|x|) v and dividing by the length of the plateau of phi gives
the exact identity on the unit sphere

    2 e = T_B + T_N + T_R,
    e   = int_{S^3} |W|^2 sqrt(g) dsigma                       (Weyl energy per unit of log|x|),
    T_B = -4 int <B, v>_g sqrt(g) dsigma                        (Bach pairing),
    T_N = (1/2) int tr_g(v) |W|^2 sqrt(g) dsigma                (variation of the inverse metrics and volume),
    T_R = -2 int <W, W'_g[v] - W>_g sqrt(g) dsigma              (the remainder R_2 of the proof).

This is identity (11) of the note without the two end terms, which do not grow with the length.  The script
evaluates the four integrals for the cones delta + c s_H, s_H = (x Hx + Hx x)/(2|x|^2), H = diag(1,.5,-.3,-1.2),
c = 0.05 and 0.30, and prints also  b = int |B|_g sqrt(g) dsigma,  the supremum of |v| (Euclidean norm, equal to
c |H|_op; and the maximum of the g-norm over the nodes), and the quotient  e/(sup|v| b),  which Theorem 1
bounds by 2 to leading order.
W and B are exact Taylor arithmetic at each node (sec_jets.py); W'_g[v] is a sixth-order central difference
in the amplitude of v with step 1e-2; the quadrature rule on S^3 is the n x n x 2n product rule.
"""
import os, sys, time
from multiprocessing import Pool
import numpy as np
from sec_jets import Jets

J4 = Jets(4)
J2 = Jets(2)
H = np.diag([1.0, 0.5, -0.3, -1.2])
I4 = np.eye(4)
M_sH = 0.25 * (np.einsum('ik,jl->ijkl', I4, H) + np.einsum('il,jk->ijkl', I4, H)
               + np.einsum('jk,il->ijkl', I4, H) + np.einsum('jl,ik->ijkl', I4, H))


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


def s_field(J, p):
    """jet of s_H at p"""
    x = J.var(p)
    r2 = sum(J.mul(x[i], x[i]) for i in range(4))
    ir2 = J.power(r2, -1.0)
    xx = J.ein('k,l->kl', x, x)
    q = np.einsum('ijkl,klC->ijC', M_sH, xx)
    return J.mul(q, ir2[None, None, :])


def one(args):
    c, p, w = args
    s4 = s_field(J4, p)
    g = J4.const(I4) + c * s4
    geo = J4.bach(g)
    gi = geo['ginv'][..., 0]; sq = J4.sqrtdet(g)[0]
    W = geo['W'][..., 0]; B = geo['Bach'][..., 0]
    v = c * s4[..., 0]
    # derivative of the Weyl tensor in the direction v, at the base point
    s2 = s_field(J2, p)
    def weyl(t):
        return J2.curvature(J2.const(I4) + (1.0 + t) * c * s2)['W'][..., 0]
    h0 = 1e-2
    dW = (0.75 * (weyl(h0) - weyl(-h0)) - 0.15 * (weyl(2 * h0) - weyl(-2 * h0)) + (1.0 / 60) * (weyl(3 * h0) - weyl(-3 * h0))) / h0
    up = lambda T: np.einsum('abcd,ia,jb,kc,ld->ijkl', T, gi, gi, gi, gi)
    Wup = up(W)
    w2 = np.einsum('ijkl,ijkl->', W, Wup)
    wdw = np.einsum('ijkl,ijkl->', dW, Wup)
    Bv = np.einsum('ij,ab,ia,jb->', B, v, gi, gi)
    trv = np.einsum('ij,ij->', gi, v)
    nB = np.sqrt(max(np.einsum('ij,ab,ia,jb->', B, B, gi, gi), 0.0))
    vg = np.sqrt(np.einsum('ij,ab,ia,jb->', v, v, gi, gi))
    vals = np.array([w2, -4.0 * Bv, 0.5 * trv * w2, -2.0 * (wdw - w2), nB]) * sq * w
    return np.concatenate([vals, [np.linalg.norm(v), vg]])


if __name__ == '__main__':
    ns = [int(a) for a in sys.argv[1].split(',')] if len(sys.argv) > 1 else [6, 8]
    nproc = int(sys.argv[2]) if len(sys.argv) > 2 else (os.cpu_count() or 2)
    print('SP4-FOT-SEC-E59 cone identity: 2e = T_B + T_N + T_R per unit of log|x|, cones delta + c s_H, H = diag(1,.5,-.3,-1.2)')
    with Pool(nproc) as pool:
        for c in (0.05, 0.30):
            for n in ns:
                pts, wts = s3_nodes(n)
                t0 = time.time()
                res = np.array(pool.map(one, [(c, p, w) for p, w in zip(pts, wts)], chunksize=16))
                e, TB, TN, TR, b = res[:, :5].sum(axis=0)
                sup_e, sup_g = c * np.linalg.norm(H, 2), res[:, 6].max()     # sup|s_H| = |H|_op exactly; g-norm: maximum over the nodes
                print(f'c={c:.2f} n={n:2d}: e={e:.10f}  T_B={TB:+.10f}  T_N={TN:+.10f}  T_R={TR:+.10f}  2e-(T_B+T_N+T_R)={2 * e - TB - TN - TR:+.2e}'
                      f'  |  b={b:.8f}  sup|v|={sup_e:.6f} (g-norm {sup_g:.6f})  e/(sup|v| b)={e / (sup_e * b):.5f}  T_B/(2e)={TB / (2 * e):.5f}  [{time.time() - t0:.0f}s]', flush=True)
