"""SP4-FOT-SEC-E61: Weyl density, boundary form of the first variation and Noether vector field on jets
(uses sec_jets.py).

  first variation:   d/ds [ |W|^2 sqrt g ](g + s h) = -4 <B,h> sqrt g + d_m( sqrt g b(W;h)^m ),
  boundary form:     b(W;h)^m = 4 W^{imkl} nabla_k h_il - 4 (nabla_j W^{ijml}) h_il,
  Noether field:     P_X^m = |W|^2 X^m + 8 B^m_j X^j - b(W; L_X g)^m,   div P_X = 0.
"""
import numpy as np
from sec_jets import Jets


def rand_sym(J, rng, scale, base=None):
    """random symmetric 2-tensor jet: base (constant matrix) + polynomial of full degree with decaying coefficients"""
    q = np.zeros((4, 4, J.M))
    for a, mi in enumerate(J.mis):
        c = rng.normal(size=(4, 4)) * scale / (1.0 + sum(mi)) ** 2
        q[:, :, a] = 0.5 * (c + c.T)
    if base is not None:
        q[:, :, 0] = base
    return q


def rand_vec(J, rng, scale):
    X = np.zeros((4, J.M))
    for a, mi in enumerate(J.mis):
        X[:, a] = rng.normal(size=4) * scale / (1.0 + sum(mi)) ** 2
    return X


def weyl_density(J, g):
    """|W|^2_g sqrt(det g) as a scalar jet, with |W|^2 the full four-index norm"""
    geo = J.curvature(g)
    Wup = J.raise_all(geo['W'], geo['ginv'])
    W2 = J.ein('ijkl,ijkl->', geo['W'], Wup)
    return J.mul(W2, J.sqrtdet(g))


def boundary_form(J, geo, h):
    """b(W;h)^m = 4 W^{imkl} nabla_k h_il - 4 (nabla_j W^{ijml}) h_il  (index m up)"""
    ginv, Gam, W, nW = geo['ginv'], geo['Gam'], geo['W'], geo['nW']
    Wup = J.raise_all(W, ginv)
    nh = J.cov(h, Gam)                                  # nh[i,l,k] = nabla_k h_il
    t1 = 4.0 * J.ein('imkl,ilk->m', Wup, nh)
    nWup = J.raise_all(np.einsum('abcdeC->abcdeC', nW), ginv)   # all five indices raised
    # nabla_j W^{ijml} = g_{je} nabla^e W^{ijml}  -> contract second slot with derivative slot
    low = J.ein('ijmle,je->iml', nWup, geo['g'])
    t2 = -4.0 * J.ein('iml,il->m', low, h)
    return t1 + t2


def lie_g(J, g, X):
    """(L_X g)_ij = X^k d_k g_ij + g_kj d_i X^k + g_ik d_j X^k"""
    dg = J.grad(g)                                      # dg[i,j,k] = d_k g_ij
    dX = J.grad(X)                                      # dX[k,i] = d_i X^k
    t = J.ein('ijk,k->ij', dg, X)
    u = J.ein('kj,ki->ij', g, dX)
    return t + u + np.einsum('ijC->jiC', u)


def noether_vector(J, g, X):
    """P_X^m = |W|^2 X^m + 8 B^m_j X^j - b(W; L_X g)^m, and its density sqrt(g) P^m"""
    geo = J.bach(g); geo['g'] = g
    ginv = geo['ginv']
    Wup = J.raise_all(geo['W'], ginv)
    W2 = J.ein('ijkl,ijkl->', geo['W'], Wup)
    BX = J.ein('mj,j->m', J.ein('mi,ij->mj', ginv, geo['Bach']), X)
    b = boundary_form(J, geo, lie_g(J, g, X))
    P = J.mul(W2[None, :], X) + 8.0 * BX - b
    sq = J.sqrtdet(g)
    return dict(P=P, dens=J.mul(sq[None, :], P), W2=W2, geo=geo, b=b, BX=BX, sq=sq)
