"""SP4-FOT-SEC-E59/E61: pointwise identity checks by truncated Taylor arithmetic.

Usage:  python3 e61_identity_checks.py > E61_IDENTITY_CHECKS.txt

1. Conventions on model metrics: round S^4, S^2 x S^2, R^2 x S^2 (Ricci, Weyl norm, Bach tensor),
   and the product identity  B(d_t, d_t) = -|W|^2/8  on R^2 x S^2.
2. The four-dimensional identity  W_ijkl W_a^jkl = |W|^2 g_ia / 4  and conformal invariance of |W|^2 dV.
3. Pointwise first variation of the Weyl density:
       d/ds [ |W|^2 sqrt g ](g + s h) = -4 <B,h> sqrt g + d_m( sqrt g b(W;h)^m ),
   left side by sixth-order central differences in s, right side exactly on jets.
4. Divergence of the Noether vector field  P_X = |W|^2 X + 8 B(X) - b(W; L_X g)  for random metrics and
   random vector fields (exact on jets of degree 5).
5. b(W; f g) = 0 for a random function f.
Random metrics are delta + symmetric polynomial perturbations of full degree with a random constant part.
Pure NumPy, IEEE double precision.  Every check prints the quantities compared.
"""
import time
import numpy as np
from sec_jets import Jets
from sec_noether_lib import rand_sym, rand_vec, weyl_density, boundary_form, lie_g, noether_vector


def weyl_norm2(J, geo):
    Wup = J.raise_all(geo['W'], geo['ginv'])
    return J.ein('ijkl,ijkl->', geo['W'], Wup)


def model_metrics():
    J = Jets(4)
    p = np.array([0.3, -0.2, 0.5, 0.1])
    x = J.var(p)
    one = J.const(1.0)
    sq = [J.mul(x[i], x[i]) for i in range(4)]
    out = []

    def report(name, g, expect):
        geo = J.bach(g)
        g0 = g[..., 0]
        w2 = weyl_norm2(J, geo)[0]
        ric = geo['Ric'][..., 0]
        bach = geo['Bach'][..., 0]
        out.append(f'  {name}: |W|^2 = {w2:.12f}, max|Bach| = {np.abs(bach).max():.3e}, R = {geo["R"][0]:.12f}; {expect(g0, w2, ric, bach, geo)}')

    # round S^4, stereographic
    Om = 2.0 * J.power(one + sq[0] + sq[1] + sq[2] + sq[3], -1.0)
    g = np.zeros((4, 4, J.M))
    for i in range(4):
        g[i, i] = J.mul(Om, Om)
    def e1(g0, w2, ric, bach, geo):
        Rm = geo['Rm'][..., 0]
        ref = np.einsum('ik,jl->ijkl', g0, g0) - np.einsum('il,jk->ijkl', g0, g0)
        return f'max|Ric - 3g| = {np.abs(ric - 3*g0).max():.2e}, max|Rm - (g_ik g_jl - g_il g_jk)| = {np.abs(Rm - ref).max():.2e}'
    report('round S^4          ', g, e1)

    # S^2 x S^2 with unit factors
    O1 = 2.0 * J.power(one + sq[0] + sq[1], -1.0)
    O2 = 2.0 * J.power(one + sq[2] + sq[3], -1.0)
    g = np.zeros((4, 4, J.M))
    g[0, 0] = g[1, 1] = J.mul(O1, O1)
    g[2, 2] = g[3, 3] = J.mul(O2, O2)
    report('S^2 x S^2          ', g, lambda g0, w2, ric, bach, geo:
           f'max|Ric - g| = {np.abs(ric - g0).max():.2e}, |W|^2 - 16/3 = {w2 - 16/3:.2e}')

    # R^2 x S^2
    g = np.zeros((4, 4, J.M))
    g[0, 0] = g[1, 1] = one
    g[2, 2] = g[3, 3] = J.mul(O2, O2)
    report('R^2 x S^2          ', g, lambda g0, w2, ric, bach, geo:
           f'|W|^2 - 4/3 = {w2 - 4/3:.2e}, B_tt = {bach[0, 0]:.12f}, B_tt + |W|^2/8 = {bach[0, 0] + w2/8:.2e}')

    # S^2(a) x S^2(b) with curvatures 1 and 1/4: not Bach-flat
    O3 = 8.0 * J.power(4.0 * one + sq[2] + sq[3], -1.0)   # sphere of radius 2: (8/(4+r^2))^2 (dx^2+dy^2)
    g = np.zeros((4, 4, J.M))
    g[0, 0] = g[1, 1] = J.mul(O1, O1)
    g[2, 2] = g[3, 3] = J.mul(O3, O3)
    report('S^2(1) x S^2(1/4)  ', g, lambda g0, w2, ric, bach, geo:
           f'|W|^2 - (4/3)(1 + 1/4)^2 = {w2 - (4/3)*1.25**2:.2e}; curvatures 1 and 1/4, not Bach-flat')
    return out


def check_identity_4d(seed):
    J = Jets(2); rng = np.random.default_rng(seed)
    A = rng.normal(size=(4, 4)); base = np.eye(4) + 0.15 * (A + A.T)
    g = rand_sym(J, rng, 0.25, base=base)
    geo = J.curvature(g)
    W = geo['W'][..., 0]; gi = geo['ginv'][..., 0]; g0 = g[..., 0]
    Wup = np.einsum('ajkl,jb,kc,ld->abcd', W, gi, gi, gi)       # W_a^{jkl}
    T = np.einsum('ijkl,ajkl->ia', W, Wup)
    w2 = np.einsum('ia,ia->', T, gi)
    return np.abs(T - w2 * g0 / 4).max(), w2


def check_conformal(seed):
    J = Jets(2); rng = np.random.default_rng(seed)
    A = rng.normal(size=(4, 4)); base = np.eye(4) + 0.15 * (A + A.T)
    g = rand_sym(J, rng, 0.25, base=base)
    f = np.zeros(J.M)
    for a, mi in enumerate(J.mis):
        f[a] = rng.normal() * 0.5 / (1.0 + sum(mi)) ** 2
    u2 = J.exp(2.0 * f)
    d0 = weyl_density(J, g)[0]
    d1 = weyl_density(J, J.mul(u2[None, None, :], g))[0]
    return d0, d1


def check_first_variation(seed, s0, eps=0.25):
    J = Jets(4); rng = np.random.default_rng(seed)
    A = rng.normal(size=(4, 4)); base = np.eye(4) + 0.15 * (A + A.T)
    g = rand_sym(J, rng, eps, base=base)
    h = rand_sym(J, rng, 1.0)
    co = {1: 3 / 4, 2: -3 / 20, 3: 1 / 60}
    lhs = sum(c * (weyl_density(J, g + k * s0 * h)[0] - weyl_density(J, g - k * s0 * h)[0]) for k, c in co.items()) / s0
    geo = J.bach(g); geo['g'] = g
    ginv = geo['ginv']; sq = J.sqrtdet(g)
    hup = J.ein('ia,ab->ib', ginv, J.ein('ab,bj->aj', h, ginv))
    Bh = J.ein('ij,ij->', geo['Bach'], hup)
    b = boundary_form(J, geo, h)
    dens = J.mul(sq[None, :], b)
    div = sum(J.d(dens[m], m) for m in range(4))
    return lhs, -4.0 * Bh[0] * sq[0], div[0]


def check_divergence(seed, eps=0.25):
    J = Jets(5); rng = np.random.default_rng(seed)
    A = rng.normal(size=(4, 4)); base = np.eye(4) + 0.15 * (A + A.T)
    g = rand_sym(J, rng, eps, base=base)
    X = rand_vec(J, rng, 1.0)
    N = noether_vector(J, g, X)
    sq = N['sq']; terms = []
    for vec in (J.mul(N['W2'][None, :], X), 8.0 * N['BX'], -N['b']):
        dens = J.mul(sq[None, :], vec)
        terms.append(sum(J.d(dens[m], m) for m in range(4))[0])
    return terms


def check_trace_part(seed, eps=0.25):
    J = Jets(4); rng = np.random.default_rng(seed)
    A = rng.normal(size=(4, 4)); base = np.eye(4) + 0.15 * (A + A.T)
    g = rand_sym(J, rng, eps, base=base)
    f = np.zeros(J.M)
    for a, mi in enumerate(J.mis):
        f[a] = rng.normal() / (1.0 + sum(mi)) ** 2
    geo = J.bach(g); geo['g'] = g
    b = boundary_form(J, geo, J.mul(f[None, None, :], g))
    h = rand_sym(J, rng, 1.0)
    return np.abs(b[..., 0]).max(), np.abs(boundary_form(J, geo, h)[..., 0]).max()


if __name__ == '__main__':
    t0 = time.time()
    print('SP4-FOT-SEC-E61 identity checks (truncated Taylor arithmetic, double precision)')
    print('1. conventions on model metrics')
    for line in model_metrics():
        print(line)
    print('2. algebra in dimension four')
    for seed in range(3):
        dev, w2 = check_identity_4d(seed)
        print(f'  seed {seed}: max|W_ijkl W_a^jkl - |W|^2 g_ia/4| = {dev:.2e}   (|W|^2 = {w2:.4f})')
    for seed in range(3):
        d0, d1 = check_conformal(seed)
        print(f'  seed {seed}: |W|^2 sqrt(g) for g and for e^(2f) g: {d0:.12f}  {d1:.12f}   difference {d1 - d0:+.1e}')
    print('3. pointwise first variation: lhs = d/ds |W|^2 sqrt(g) by 6th-order differences, rhs = -4<B,h> sqrt(g) + div(sqrt(g) b)')
    for seed in range(4):
        for s0 in (2e-2, 1e-2, 5e-3):
            lhs, bach, div = check_first_variation(seed, s0)
            print(f'  seed {seed} step {s0:.0e}: lhs {lhs:+.11e}  rhs {bach + div:+.11e}  diff {lhs - bach - div:+.1e}'
                  f'   [-4<B,h> sqrt(g) = {bach:+.5e}, div = {div:+.5e}]')
    print('4. divergence of sqrt(g) P_X at the base point, by term: |W|^2 X, 8 B(X), -b(W; L_X g)')
    for seed in range(4):
        t = check_divergence(seed)
        print(f'  seed {seed}: {t[0]:+.9e}  {t[1]:+.9e}  {t[2]:+.9e}   sum {sum(t):+.1e}')
    print('5. boundary form on a pure trace: max|b(W; f g)| against max|b(W; h)| for a random h')
    for seed in range(3):
        b0, b1 = check_trace_part(seed)
        print(f'  seed {seed}: {b0:.2e}   ({b1:.3e})')
    print(f'time {time.time() - t0:.1f} s')
