"""SP4-FOT-SEC-E60: exact algebra for the linearized curvature operators at the flat metric of R^4.

Functions are finite sums of terms  c * x^alpha * rho^s * (log rho)^e * G,  rho = |x|, with rational c,
integer or rational s, integer e >= 0 and G either 1 or the Gaussian exp(-rho^2) (one flag per function).
Derivatives are exact.  The linear operators use the conventions of sec_jets.py:

  Rm'[h]_ijkl = (1/2)(d_j d_k h_il + d_i d_l h_jk - d_i d_k h_jl - d_j d_l h_ik),
  Ric'_jl = Rm'_ijil,   R' = Ric'_jj,   A' = (Ric' - R' delta/6)/2,
  W' = Rm' - (A'_ik d_jl + A'_jl d_ik - A'_il d_jk - A'_jk d_il),
  B'_ij = d_k d_l W'_ikjl   (also computed as Laplacian A' - Hess tr A').

Also: closed forms for the logarithmic mode H log(rho), a quadrature rule on S^3, and exact moments.
"""
from fractions import Fraction as Fr
import itertools, math
import numpy as np

N = 4
PAIRS = [(i, j) for i in range(N) for j in range(i, N)]


class F:
    __slots__ = ('t', 'g')

    def __init__(self, t=None, g=0):
        self.t = {k: v for k, v in (t or {}).items() if v != 0}
        self.g = g if self.t else 0

    @staticmethod
    def mono(alpha, s=0, e=0, c=1, g=0):
        return F({(tuple(alpha), Fr(s), int(e)): Fr(c)}, g)

    def _flag(self, o):
        if self.t and o.t and self.g != o.g:
            raise ValueError('mixed Gaussian flags')
        return self.g if self.t else o.g

    def __add__(self, o):
        t = dict(self.t)
        for k, v in o.t.items():
            t[k] = t.get(k, 0) + v
        return F(t, self._flag(o))

    def __sub__(self, o):
        return self + o * (-1)

    def __mul__(self, c):
        c = Fr(c)
        return F({k: v * c for k, v in self.t.items()}, self.g)

    __rmul__ = __mul__

    def iszero(self):
        return not self.t

    def d(self, i):
        t = {}

        def add(k, v):
            if v != 0:
                t[k] = t.get(k, 0) + v
        for (a, s, e), c in self.t.items():
            if a[i] > 0:
                b = list(a); b[i] -= 1
                add((tuple(b), s, e), c * a[i])
            b = list(a); b[i] += 1; b = tuple(b)
            if s != 0:
                add((b, s - 2, e), c * s)
            if e > 0:
                add((b, s - 2, e - 1), c * e)
            if self.g:
                add((b, s, e), -2 * c)
        return F(t, self.g)

    def __call__(self, x):
        rho2 = sum(xi * xi for xi in x); rho = math.sqrt(rho2); L = math.log(rho)
        tot = 0.0
        for (a, s, e), c in self.t.items():
            m = 1.0
            for xi, ai in zip(x, a):
                m *= xi ** ai
            tot += float(c) * m * rho ** float(s) * L ** e
        return tot * (math.exp(-rho2) if self.g else 1.0)


ZERO = F()


def lin_ops(h):
    """h: dict (i,j), i <= j -> F.  Returns Rm', Ric', R', A', W' (dict over ijkl) and B' (dict over i <= j)
    by the double divergence of W' ('B') and by the Schouten formula ('B2')."""
    d2 = {}

    def D2(i, j, a, b):       # d_a d_b h_ij
        key = (min(i, j), max(i, j), min(a, b), max(a, b))
        if key not in d2:
            d2[key] = h[(key[0], key[1])].d(key[2]).d(key[3])
        return d2[key]
    Rm = {}
    for i, j, k, l in itertools.product(range(N), repeat=4):
        Rm[(i, j, k, l)] = (D2(i, l, j, k) + D2(j, k, i, l) - D2(j, l, i, k) - D2(i, k, j, l)) * Fr(1, 2)
    Ric = {}
    for j, l in itertools.product(range(N), repeat=2):
        acc = ZERO
        for i in range(N):
            acc = acc + Rm[(i, j, i, l)]
        Ric[(j, l)] = acc
    R = ZERO
    for j in range(N):
        R = R + Ric[(j, j)]
    A = {}
    for j, l in itertools.product(range(N), repeat=2):
        A[(j, l)] = Ric[(j, l)] * Fr(1, 2) - (R * Fr(1, 12) if j == l else ZERO)
    W = {}
    for i, j, k, l in itertools.product(range(N), repeat=4):
        w = Rm[(i, j, k, l)]
        if j == l: w = w - A[(i, k)]
        if i == k: w = w - A[(j, l)]
        if j == k: w = w + A[(i, l)]
        if i == l: w = w + A[(j, k)]
        W[(i, j, k, l)] = w
    B = {}
    for (i, j) in PAIRS:
        acc = ZERO
        for k in range(N):
            for l in range(N):
                acc = acc + W[(i, k, j, l)].d(k).d(l)
        B[(i, j)] = acc
    trA = ZERO
    for j in range(N):
        trA = trA + A[(j, j)]
    B2 = {}
    for (i, j) in PAIRS:
        acc = ZERO
        for k in range(N):
            acc = acc + A[(i, j)].d(k).d(k)
        B2[(i, j)] = acc - trA.d(i).d(j)
    return dict(Rm=Rm, Ric=Ric, R=R, A=A, W=W, B=B, B2=B2)


def tensor_from_matrix(Hm, fun):
    """h_ij = Hm[i][j] * fun  with Hm a matrix of Fractions"""
    return {(i, j): fun * Hm[i][j] for (i, j) in PAIRS}


def monomials(d):
    return [a for a in itertools.product(range(d + 1), repeat=N) if sum(a) == d]


def unit(i):
    a = [0] * N; a[i] = 1
    return tuple(a)


def madd(a, b):
    return tuple(x + y for x, y in zip(a, b))


def dfact(n):
    """(n)!! with (-1)!! = 1"""
    r = 1
    while n > 1:
        r *= n; n -= 2
    return r


def gauss2_moment(beta):
    """int_{R^4} x^beta exp(-2|x|^2) dx / (pi^2/4), a rational number (0 unless all exponents are even)"""
    if any(b % 2 for b in beta):
        return Fr(0)
    r = Fr(1)
    for b in beta:
        r *= Fr(dfact(b - 1), 4 ** (b // 2))
    return r


def gauss_pair(f, g):
    """int f g dx / (pi^2/4) for two Gaussian-flag functions with polynomial coefficients (s = e = 0)"""
    tot = Fr(0)
    for (a, s, e), c in f.t.items():
        assert s == 0 and e == 0 and f.g
        for (b, s2, e2), c2 in g.t.items():
            assert s2 == 0 and e2 == 0 and g.g
            tot += c * c2 * gauss2_moment(madd(a, b))
    return tot


def inv4_gauss_moment(beta):
    """int_{R^4} x^beta rho^(-4) exp(-rho^2) dx / pi^2 for |beta| >= 2: prod (beta_i - 1)!! / (2^m m (m+1)), m = |beta|/2"""
    if any(b % 2 for b in beta):
        return Fr(0)
    m = sum(beta) // 2
    assert m >= 1
    r = Fr(1, 2 ** m * m * (m + 1))
    for b in beta:
        r *= dfact(b - 1)
    return r


# ---------------------------------------------------------------- numerical helpers

def s3_nodes(n):
    """n x n x 2n product rule on the unit three-sphere, exact for spherical polynomials of degree <= 2n-1"""
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


def bH(H, x):
    """rho^4 B'(H log rho) at unit vectors x (array (P,4)), closed formula
       -(4/3) H + (4/3)(x Hx + Hx x) - (8/3) H(x,x) delta + 8 H(x,x) x x"""
    Hx = x @ H; q = np.einsum('pi,pi->p', Hx, x)
    return (-(4 / 3) * H[None] + (4 / 3) * (x[:, :, None] * Hx[:, None, :] + Hx[:, :, None] * x[:, None, :])
            - (8 / 3) * q[:, None, None] * np.eye(4)[None] + 8 * q[:, None, None] * x[:, :, None] * x[:, None, :])


def Wlog(H, x):
    """rho^2 W'(H log rho) at unit vectors x, from d_a d_b log rho = (delta_ab - 2 x_a x_b)/rho^2"""
    f = np.eye(4)[None] - 2 * x[:, :, None] * x[:, None, :]
    Rm = 0.5 * (np.einsum('pjk,il->pijkl', f, H) + np.einsum('pil,jk->pijkl', f, H)
                - np.einsum('pik,jl->pijkl', f, H) - np.einsum('pjl,ik->pijkl', f, H))
    Ric = np.einsum('pijil->pjl', Rm); R = np.einsum('pjj->p', Ric)
    A = 0.5 * (Ric - R[:, None, None] * np.eye(4)[None] / 6)
    d = np.eye(4)
    KN = (np.einsum('pik,jl->pijkl', A, d) + np.einsum('pjl,ik->pijkl', A, d)
          - np.einsum('pil,jk->pijkl', A, d) - np.einsum('pjk,il->pijkl', A, d))
    return Rm - KN


def random_weyl(rng):
    """a random constant tensor with the symmetries of a Weyl tensor (NumPy array), and its trace/Bianchi defects"""
    A = rng.normal(size=(4, 4, 4, 4))
    R = A - A.transpose(1, 0, 2, 3); R = R - R.transpose(0, 1, 3, 2); R = R + R.transpose(2, 3, 0, 1)
    R = R - (R + R.transpose(0, 2, 3, 1) + R.transpose(0, 3, 1, 2)) / 3.0
    d = np.eye(4)
    Ric = np.einsum('ijil->jl', R); Sc = np.trace(Ric); Sch = 0.5 * (Ric - Sc * d / 6)
    T = R - (np.einsum('ik,jl->ijkl', Sch, d) + np.einsum('jl,ik->ijkl', Sch, d)
             - np.einsum('il,jk->ijkl', Sch, d) - np.einsum('jk,il->ijkl', Sch, d))
    return T


def exact_weyl(seed):
    """an exact rational tensor with the symmetries of a Weyl tensor, as a dict (i,j,k,l) -> Fraction.
    Built from the self-dual/anti-self-dual description: W = sum over a basis of Lambda^2 of a trace-free
    symmetric 3x3 matrix on Lambda^+ and one on Lambda^-."""
    import random
    rnd = random.Random(seed)
    # bases of self-dual and anti-self-dual two-forms as antisymmetric 4x4 integer matrices
    def two_form(pairs):
        m = [[0] * 4 for _ in range(4)]
        for (i, j, s) in pairs:
            m[i][j] += s; m[j][i] -= s
        return m
    sd = [two_form([(0, 1, 1), (2, 3, 1)]), two_form([(0, 2, 1), (3, 1, 1)]), two_form([(0, 3, 1), (1, 2, 1)])]
    asd = [two_form([(0, 1, 1), (2, 3, -1)]), two_form([(0, 2, 1), (3, 1, -1)]), two_form([(0, 3, 1), (1, 2, -1)])]

    def tf_sym():
        a = [[Fr(0)] * 3 for _ in range(3)]
        for i in range(3):
            for j in range(i, 3):
                v = Fr(rnd.randint(-5, 5), rnd.randint(1, 4))
                a[i][j] = v; a[j][i] = v
        tr = (a[0][0] + a[1][1] + a[2][2]) / 3
        for i in range(3):
            a[i][i] -= tr
        return a
    W = {}
    ap, am = tf_sym(), tf_sym()
    for i, j, k, l in itertools.product(range(4), repeat=4):
        v = Fr(0)
        for a in range(3):
            for b in range(3):
                v += ap[a][b] * sd[a][i][j] * sd[b][k][l] + am[a][b] * asd[a][i][j] * asd[b][k][l]
        W[(i, j, k, l)] = v
    return W
