"""SP4-FOT-SEC-E59/E60/E61: truncated Taylor ("jet") arithmetic in four variables and Riemannian
tensor calculus on jets.  Pure NumPy.

A jet is an array whose last axis holds the Taylor coefficients, at one base point, of a function of
(x1,..,x4) up to total degree `deg`; leading axes are tensor indices.  Products, derivatives, inverse
matrices, exp, log and powers are exact up to the truncation order, so curvature quantities at the
base point are obtained without difference quotients: a jet of degree 4 of the metric gives the Bach
tensor at the base point, a jet of degree 5 gives its first derivatives.

Conventions (those of the manuscript and of E24):
  R^i_{jkl} = d_k Gamma^i_{lj} - d_l Gamma^i_{kj} + Gamma^i_{km} Gamma^m_{lj} - Gamma^i_{lm} Gamma^m_{kj},
  R_{ijkl} = g_{im} R^m_{jkl}   (unit round sphere: R_{ijkl} = g_ik g_jl - g_il g_jk),
  Ric_{jl} = R^k_{jkl},  Schouten A = (Ric - R g/6)/2,
  W = Rm - (A_ik g_jl + A_jl g_ik - A_il g_jk - A_jk g_il),
  Bach B_ij = nabla^k nabla^l W_{ikjl} + (1/2) R^{kl} W_{ikjl},
so that the gradient of the full Weyl functional int |W|^2 dV is -4 B.
"""
import itertools, math
import numpy as np

LET = 'abcdefghijklmnopqrstuvwxyz'


class Jets:
    def __init__(self, deg, nvar=4):
        self.n, self.D = nvar, deg
        mis = [a for a in itertools.product(range(deg + 1), repeat=nvar) if sum(a) <= deg]
        mis.sort(key=lambda a: (sum(a), a))
        self.mis, self.M = mis, len(mis)
        self.idx = {a: i for i, a in enumerate(mis)}
        M = self.M
        tab = np.full((M, M), M, dtype=np.int64)
        for ia, a in enumerate(mis):
            for ic, c in enumerate(mis):
                d = tuple(ci - ai for ci, ai in zip(c, a))
                if min(d) >= 0:
                    tab[ia, ic] = self.idx[d]
        self.tab = tab
        self.dsrc, self.dfac = [], []
        for i in range(nvar):
            src = np.full(M, M, dtype=np.int64)
            fac = np.zeros(M)
            for ia, a in enumerate(mis):
                b = list(a); b[i] += 1; b = tuple(b)
                if b in self.idx:
                    src[ia] = self.idx[b]; fac[ia] = b[i]
            self.dsrc.append(src); self.dfac.append(fac)

    # ---- basic algebra
    def _pad(self, Y):
        return np.concatenate([Y, np.zeros(Y.shape[:-1] + (1,))], axis=-1)

    def mat(self, Y):
        return self._pad(Y)[..., self.tab]

    def mul(self, X, Y):
        return np.einsum('...a,...ac->...c', X, self.mat(Y))

    def ein(self, spec, X, Y):
        ins, out = spec.split('->'); a, b = ins.split(',')
        return np.einsum(f'{a}Y,{b}YZ->{out}Z', X, self.mat(Y), optimize=True)

    def d(self, X, i):
        return self._pad(X)[..., self.dsrc[i]] * self.dfac[i]

    def grad(self, X):
        """derivative index appended as the last tensor index"""
        return np.stack([self.d(X, i) for i in range(self.n)], axis=-2)

    def const(self, c):
        c = np.asarray(c, dtype=float)
        z = np.zeros(c.shape + (self.M,)); z[..., 0] = c
        return z

    def var(self, p):
        z = np.zeros((self.n, self.M))
        for i in range(self.n):
            z[i, 0] = p[i]
            z[i, self.idx[tuple(1 if j == i else 0 for j in range(self.n))]] = 1.0
        return z

    def val(self, X):
        return X[..., 0]

    def fun(self, X, derivs):
        """compose with a scalar function; derivs(x0) returns [f(x0), f'(x0), ..., f^(D)(x0)]"""
        x0 = X[..., 0]
        N = X.copy(); N[..., 0] = 0.0
        ders = derivs(x0)
        res = self.const(ders[0]); P = self.const(np.ones_like(x0))
        for k in range(1, self.D + 1):
            P = self.mul(P, N)
            res = res + P * (np.asarray(ders[k]) / math.factorial(k))[..., None]
        return res

    def power(self, X, p):
        def ders(x0):
            out = []; c = 1.0
            for k in range(self.D + 1):
                out.append(c * x0 ** (p - k)); c *= (p - k)
            return out
        return self.fun(X, ders)

    def exp(self, X):
        return self.fun(X, lambda x0: [np.exp(x0)] * (self.D + 1))

    def log(self, X):
        def ders(x0):
            out = [np.log(x0)]
            for k in range(1, self.D + 1):
                out.append((-1) ** (k - 1) * math.factorial(k - 1) / x0 ** k)
            return out
        return self.fun(X, ders)

    # ---- matrices of jets
    def minv(self, G):
        n = G.shape[0]
        Y = self.const(np.linalg.inv(G[..., 0]))
        two = 2.0 * self.const(np.eye(n))
        for _ in range(int(math.ceil(math.log2(self.D + 1))) + 1):
            Y = self.ein('ij,jk->ik', Y, two - self.ein('ij,jk->ik', G, Y))
        return Y

    def sqrtdet(self, G):
        n = G.shape[0]
        G0 = G[..., 0]
        Nn = G.copy(); Nn[..., 0] = 0.0
        A = self.ein('ij,jk->ik', self.const(np.linalg.inv(G0)), Nn)
        tr = np.zeros(self.M); P = self.const(np.eye(n))
        for k in range(1, self.D + 1):
            P = self.ein('ij,jk->ik', P, A)
            tr = tr + ((-1) ** (k + 1) / k) * np.einsum('iiC->C', P)
        return math.sqrt(np.linalg.det(G0)) * self.exp(0.5 * tr)

    # ---- tensor calculus
    def christoffel(self, g, ginv=None):
        if ginv is None:
            ginv = self.minv(g)
        dg = self.grad(g)                                  # dg[l,k,j] = d_j g_lk
        T = dg + np.einsum('ljkC->lkjC', dg) - np.einsum('jklC->lkjC', dg)   # T[l,k,j] = d_j g_lk + d_k g_lj - d_l g_jk
        return 0.5 * self.ein('il,lkj->ijk', ginv, T)      # Gamma^i_{jk}

    def cov(self, T, Gam):
        """covariant derivative of a (0,r) tensor; derivative index appended last"""
        r = T.ndim - 1
        out = self.grad(T)
        idx = LET[:r]
        for s in range(r):
            lhs = idx[:s] + 'p' + idx[s + 1:]
            # Gam[p, m, a_s]  T[.. p ..]  ->  (a_1..a_r, m)
            out = out - self.ein(f'{lhs},pz{idx[s]}->{idx}z', T, Gam)
        return out

    def raise_all(self, T, ginv):
        r = T.ndim - 1
        idx = LET[:r]
        for s in range(r):
            lhs = idx[:s] + 'p' + idx[s + 1:]
            T = self.ein(f'{lhs},{idx[s]}p->{idx}', T, ginv)
        return T

    def curvature(self, g):
        ginv = self.minv(g)
        Gam = self.christoffel(g, ginv)
        dGam = self.grad(Gam)                              # dGam[i,j,k,l] = d_l Gamma^i_{jk}
        A = np.einsum('iljkC->ijklC', dGam)                # d_k Gamma^i_{lj}
        B = np.einsum('ikjlC->ijklC', dGam)                # d_l Gamma^i_{kj}
        GG = self.ein('ikm,mlj->ijkl', Gam, Gam)           # Gamma^i_{km} Gamma^m_{lj}
        Rup = A - B + GG - np.einsum('ijlkC->ijklC', GG)
        Rm = self.ein('im,mjkl->ijkl', g, Rup)
        Ric = np.einsum('kjklC->jlC', Rup)
        R = self.ein('jl,jl->', ginv, Ric)
        Sch = 0.5 * (Ric - self.mul(R[None, None, :], g) / 6.0)
        Ag = self.ein('ik,jl->ikjl', Sch, g)               # Ag[i,k,j,l] = A_ik g_jl
        KN = (np.einsum('ikjlC->ijklC', Ag) + np.einsum('jlikC->ijklC', Ag)
              - np.einsum('iljkC->ijklC', Ag) - np.einsum('jkilC->ijklC', Ag))
        W = Rm - KN
        return dict(ginv=ginv, Gam=Gam, Rm=Rm, Ric=Ric, R=R, Sch=Sch, W=W)

    def bach(self, g, geo=None):
        geo = geo or self.curvature(g)
        ginv, Gam, W, Ric = geo['ginv'], geo['Gam'], geo['W'], geo['Ric']
        nW = self.cov(W, Gam)                              # nW[i,k,j,l,b] = nabla_b W_ikjl
        nnW = self.cov(nW, Gam)                            # nnW[i,k,j,l,b,a] = nabla_a nabla_b W_ikjl
        t = self.ein('ikjlba,ka->ijlb', nnW, ginv)
        t = np.einsum('ijlbC->ijblC', t)
        B1 = self.ein('ijbl,lb->ij', np.einsum('ijblC->ijblC', t), ginv)
        Ricup = self.ein('ab,bl->al', self.ein('ka,ab->kb', ginv, Ric), ginv)   # R^{kl}
        B2 = 0.5 * self.ein('ikjl,kl->ij', W, Ricup)
        geo.update(nW=nW, Bach=B1 + B2)
        return geo
