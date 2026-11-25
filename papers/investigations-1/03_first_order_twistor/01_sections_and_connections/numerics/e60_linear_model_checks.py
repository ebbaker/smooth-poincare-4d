"""SP4-FOT-SEC-E60: checks of the linear model at the flat metric of R^4.

Usage:  python3 e60_linear_model_checks.py > E60_LINEAR_MODEL_CHECKS.txt

Exact rational algebra (sec_linmodel.py) unless a line says "numerical".
 1. Closed formula for B'(H log rho); trace, divergence, the two expressions of B'; Ric' and R'.
 2. H log rho + s_H is a Lie derivative of the flat metric: W' and B' vanish on it.  The divergence-free
    trace-free field in the same class is (5/9) H log rho - (7/18) s_H - (1/18) H(nu,nu) nu nu + (1/9) H(nu,nu) delta.
 3. Pointwise formulas  rho^4 |W'(H log rho)|^2 = 2|H|^2 - 4|H nu|^2 + (4/3) H(nu,nu)^2,
    b_H(nu,nu) = (20/3) H(nu,nu),  b_H(nu, H nu) = (20/3) H(nu,nu)^2,  and the constants
    kappa_1 = (20 pi^2/9)|H|^2 (exact spherical moments and numerical quadrature), kappa_2 (numerical).
 4. Operator identities on random polynomial tensors: tr B' = 0, div B' = 0, B' and W' vanish on
    Lie derivatives and on multiples of delta, and  Laplacian^2 W'(h) = -4 W'(B'(h)).
 5. The modes of homogeneity +2 and -2: q = -(1/3) W_ikjl x_k x_l has Rm'[q] = W; h = W_ikjl x_k x_l/rho^4 is
    divergence free, trace free, has B'(h) = 0 and W'(h) != 0 away from the origin, and
    -pi^-2 int <W_ikjl x_k x_l rho^-4, B'(phi)_ij> dx = W_ikjl d_k d_l phi_ij(0) for Gaussian test tensors phi.
 6. Energy identity  int |W'(h)|^2 dx = -2 int <B'(h), h> dx  for a generic Gaussian tensor h.
 7. Amplitude identity (numerical quadrature)  h(x0) = -(2 pi^2)^-1 int (beta(y) w)(x)w dy, w = (y-x0)/|y-x0|,
    for a divergence-free trace-free Schwartz tensor h and beta = B'(h) = -(1/4) Laplacian^2 h (exact),
    with the two norm inequalities.
 8. Numerical: derivative of the nonlinear Bach tensor (sec_jets.py) at the flat metric against the closed
    formula, and the quadratic term of the Weyl density against |W'|^2.
"""
import itertools, math, random, time
from fractions import Fraction as Fr
import numpy as np
from sec_linmodel import (F, ZERO, PAIRS, N, lin_ops, tensor_from_matrix, monomials, unit, madd, gauss_pair,
                          inv4_gauss_moment, s3_nodes, bH, Wlog, exact_weyl)

T0 = time.time()
ZA = (0, 0, 0, 0)


def canon(f):
    """normal form: eliminate x4^2 = rho^2 - x1^2 - x2^2 - x3^2; two functions are equal iff normal forms agree"""
    t = dict(f.t)
    while True:
        new = {}; again = False
        for (a, s, e), c in t.items():
            if a[3] >= 2:
                again = True
                b = (a[0], a[1], a[2], a[3] - 2)
                k = (b, s + 2, e); new[k] = new.get(k, 0) + c
                for i in range(3):
                    bb = list(b); bb[i] += 2
                    k = (tuple(bb), s, e); new[k] = new.get(k, 0) - c
            else:
                k = (a, s, e); new[k] = new.get(k, 0) + c
        t = {k: v for k, v in new.items() if v != 0}
        if not again:
            return F(t, f.g)


def is0(f):
    return canon(f).iszero()


def fmul(f, g):
    assert not f.g and not g.g
    t = {}
    for (a, s, e), c in f.t.items():
        for (b, s2, e2), c2 in g.t.items():
            k = (madd(a, b), s + s2, e + e2)
            t[k] = t.get(k, 0) + c * c2
    return F(t)


def xpow(i, s=0):
    return F.mono(unit(i), s)


def sym(d, i, j):
    return d[(min(i, j), max(i, j))]


def lap(f):
    acc = ZERO
    for a in range(N):
        acc = acc + f.d(a).d(a)
    return acc


def report(ok, text):
    print(('  PASS  ' if ok else '  FAIL  ') + text)
    assert ok, text


# ------------------------------------------------------------------ data
Hm = [[Fr(0)] * 4 for _ in range(4)]
vals = {(0, 0): Fr(3, 2), (1, 1): Fr(-1, 3), (2, 2): Fr(1, 4), (0, 1): Fr(2, 5), (0, 2): Fr(-1, 2), (1, 3): Fr(3, 7),
        (2, 3): Fr(1, 6), (0, 3): Fr(-2, 9), (1, 2): Fr(5, 8)}
for (i, j), v in vals.items():
    Hm[i][j] = v; Hm[j][i] = v
Hm[3][3] = -(Hm[0][0] + Hm[1][1] + Hm[2][2])
H2 = sum(Hm[i][j] ** 2 for i in range(4) for j in range(4))
logrho = F.mono(ZA, 0, 1)


def Hx(i, s=0):          # (Hx)_i rho^s
    acc = ZERO
    for k in range(4):
        acc = acc + F.mono(unit(k), s, 0, Hm[i][k])
    return acc


def Hxx(s=0):            # H(x,x) rho^s
    acc = ZERO
    for k in range(4):
        for l in range(4):
            acc = acc + F.mono(madd(unit(k), unit(l)), s, 0, Hm[k][l])
    return acc


def xF(i, f):            # multiply by x_i
    return fmul(F.mono(unit(i)), f)


print('SP4-FOT-SEC-E60 linear model checks')
print('1. the logarithmic mode h = H log(rho), H symmetric, trace free, rational, generic')
h = tensor_from_matrix(Hm, logrho)
ops = lin_ops(h)
ok = True; ok2 = True; okr = True
for (i, j) in PAIRS:
    f = F.mono(ZA, -4, 0, Fr(-4, 3) * Hm[i][j]) + Fr(4, 3) * (xF(i, Hx(j, -6)) + xF(j, Hx(i, -6))) \
        + Fr(8) * xF(i, xF(j, Hxx(-8)))
    if i == j:
        f = f + Fr(-8, 3) * Hxx(-6)
    ok = ok and is0(ops['B'][(i, j)] - f)
    ok2 = ok2 and is0(ops['B'][(i, j)] - ops['B2'][(i, j)])
    okr = okr and is0(ops['Ric'][(i, j)] + xF(i, Hx(j, -4)) + xF(j, Hx(i, -4)))
report(ok, "B'(H log rho) = -(4/3) H rho^-4 + (4/3)(x Hx + Hx x) rho^-6 - (8/3) H(x,x) delta rho^-6 + 8 H(x,x) x x rho^-8")
report(ok2, "d_k d_l W'_ikjl = Laplacian A' - Hess tr A' on this field")
report(okr, "Ric'(H log rho) = -(x Hx + Hx x) rho^-4")
report(is0(ops['R'] + 2 * Hxx(-4)), "R'(H log rho) = -2 H(x,x) rho^-4")
tr = ZERO
for i in range(4):
    tr = tr + ops['B'][(i, i)]
report(is0(tr), "trace of B'(H log rho) vanishes")
okd = True
for j in range(4):
    acc = ZERO
    for i in range(4):
        acc = acc + sym(ops['B'], i, j).d(i)
    okd = okd and is0(acc)
report(okd, "divergence of B'(H log rho) vanishes")

print('2. gauge form of the logarithmic mode')
kH = {}
for (i, j) in PAIRS:
    kH[(i, j)] = logrho * Hm[i][j] + Fr(1, 2) * (xF(i, Hx(j, -2)) + xF(j, Hx(i, -2)))
# Lie derivative of delta along Z = (log rho) H x / 2
Z = [fmul(logrho, Hx(i)) * Fr(1, 2) for i in range(4)]
report(all(is0(kH[(i, j)] - Z[j].d(i) - Z[i].d(j)) for (i, j) in PAIRS), 'H log rho + s_H = L_Z delta with Z = (log rho) H x/2, s_H = (x Hx + Hx x)/(2 rho^2)')
opk = lin_ops(kH)
report(all(is0(v) for v in opk['W'].values()), "W'(H log rho + s_H) = 0")
report(all(is0(v) for v in opk['B'].values()), "B'(H log rho + s_H) = 0")

# divergence-free trace-free representative of the same class
hTT = {}
for (i, j) in PAIRS:
    f = logrho * (Fr(5, 9) * Hm[i][j]) + Fr(-7, 36) * (xF(i, Hx(j, -2)) + xF(j, Hx(i, -2))) + Fr(-1, 18) * xF(i, xF(j, Hxx(-4)))
    if i == j:
        f = f + Fr(1, 9) * Hxx(-2)
    hTT[(i, j)] = f
trT = ZERO
for i in range(4):
    trT = trT + hTT[(i, i)]
okT = is0(trT)
for j in range(4):
    acc = ZERO
    for i in range(4):
        acc = acc + sym(hTT, i, j).d(i)
    okT = okT and is0(acc)
report(okT, 'h_TT = (5/9) H log rho - (7/18) s_H - (1/18) H(nu,nu) nu nu + (1/9) H(nu,nu) delta is divergence free and trace free')
opT = lin_ops(hTT)
report(all(is0(opT['W'][key] - ops['W'][key]) for key in ops['W']) and all(is0(opT['B'][p] - ops['B'][p]) for p in PAIRS),
       "W'(h_TT) = W'(H log rho) and B'(h_TT) = B'(H log rho): the same class, with 5/9 of the logarithm")
okv = True
for i in range(4):
    acc = ZERO
    for k in range(4):
        acc = acc + xF(k, sym(ops['B'], i, k))
    okv = okv and is0(acc - Fr(20, 3) * xF(i, Hxx(-6)))
report(okv, "B'(H log rho) x = (20/3) H(x,x) x rho^-6, so the mean over S^3 of b_H(nu) nu (x) nu is (20/3) H/12 = (5/9) H:")
print('        the potential formula of item 7 then gives the growth (5/9) H per unit of log rho, the coefficient found above')
print('3. densities of the logarithmic mode')
w2 = ZERO
for key, v in ops['W'].items():
    w2 = w2 + fmul(v, v)
Hx2 = ZERO
for i in range(4):
    Hx2 = Hx2 + fmul(Hx(i), Hx(i))
form = F.mono(ZA, -4, 0, 2 * H2) - 4 * fmul(Hx2, F.mono(ZA, -6)) + Fr(4, 3) * fmul(fmul(Hxx(), Hxx()), F.mono(ZA, -8))
report(is0(w2 - form), "|W'(H log rho)|^2 = (2|H|^2 - 4|H nu|^2 + (4/3) H(nu,nu)^2) rho^-4")
bnn = ZERO; bnH = ZERO
for i in range(4):
    for j in range(4):
        bnn = bnn + xF(i, xF(j, sym(ops['B'], i, j)))
        bnH = bnH + xF(i, fmul(Hx(j), sym(ops['B'], i, j)))
report(is0(bnn - Fr(20, 3) * Hxx(-4)), "B'(H log rho)(x,x) = (20/3) H(x,x) rho^-4")
report(is0(bnH - Fr(20, 3) * fmul(Hxx(), Hxx(-6))), "B'(H log rho)(x,Hx) = (20/3) H(x,x)^2 rho^-6")


def s3_mean(f):
    """exact mean over the unit sphere of a polynomial (s = e = 0): moments prod (b_i-1)!!/(4*6*...*(|b|+2))"""
    tot = Fr(0)
    for (a, s, e), c in f.t.items():
        assert e == 0
        if any(b % 2 for b in a):
            continue
        m = sum(a) // 2
        num = 1
        for b in a:
            k = b - 1
            while k > 1:
                num *= k; k -= 2
        den = 1
        for r in range(m):
            den *= (4 + 2 * r)
        tot += c * Fr(num, den)
    return tot


mean_w2 = 2 * H2 - 4 * s3_mean(Hx2) + Fr(4, 3) * s3_mean(fmul(Hxx(), Hxx()))
report(mean_w2 == Fr(10, 9) * H2, f"mean of rho^4 |W'(H log rho)|^2 over S^3 = (10/9)|H|^2, so kappa_1 = (20 pi^2/9)|H|^2   [exact value {mean_w2} with |H|^2 = {H2}]")
report(s3_mean(fmul(Hxx(), Hxx())) == H2 / 12 and s3_mean(Hx2) == H2 / 4, 'means of H(nu,nu)^2 and |H nu|^2 are |H|^2/12 and |H|^2/4')
report(2 * Fr(20, 3) * s3_mean(fmul(Hxx(), Hxx())) == Fr(10, 9) * H2, 'Bach pairing: 2 mean <b_H, s_H> = (10/9)|H|^2, the same density as the energy')

print('   numerical quadrature on S^3 (rule exact to degree 2n-1); kappa_2 = int_{S^3} |b_H| dsigma in the Frobenius norm')
rng = np.random.default_rng(5)
names = [('diag(1,1,-1,-1)', np.diag([1., 1., -1., -1.])), ('diag(3,-1,-1,-1)', np.diag([3., -1., -1., -1.])),
         ('diag(1,-1,0,0)', np.diag([1., -1., 0., 0.])), ('diag(1,.5,-.3,-1.2)', np.diag([1., .5, -.3, -1.2]))]
for _ in range(2):
    A = rng.normal(size=(4, 4)); Hr = A + A.T; Hr -= np.trace(Hr) / 4 * np.eye(4)
    names.append(('random', Hr))
print('   last column: e_2/(sup|s_H| b_1) with e_2 = kappa_1, b_1 = kappa_2 and sup|s_H| = |H|_op, the leading-order ratio of the energy')
print('   of the cone delta + c s_H to (sup norm of the deviation) x (total Bach norm); Theorem 1 of E59 bounds it by 2 to leading order')
print('   H                     kappa_1/|H|^2 (n=10)   20 pi^2/9        kappa_2/|H| n=10  n=14       n=18       |H|/|H|_op   e_2/(sup|s_H| b_1)')
for name, Hn in names:
    hn2 = (Hn ** 2).sum(); hop = np.linalg.norm(Hn, 2)
    row = []
    for n in (10, 14, 18):
        pts, wts = s3_nodes(n)
        Wn = Wlog(Hn, pts)
        k1 = (wts * np.einsum('pijkl,pijkl->p', Wn, Wn)).sum() / hn2
        b = bH(Hn, pts)
        k2 = (wts * np.sqrt(np.einsum('pij,pij->p', b, b))).sum() / np.sqrt(hn2)
        row.append((k1, k2))
    ratio = row[2][0] * hn2 / (hop * row[2][1] * np.sqrt(hn2))
    print(f'   {name:20s}  {row[0][0]:.12f}        {20 * np.pi ** 2 / 9:.12f}  {row[0][1]:.6f}        {row[1][1]:.6f}  {row[2][1]:.6f}  {np.sqrt(hn2) / hop:.4f}       {ratio:.4f}')
Hc = np.diag([1., .5, -.3, -1.2]); hc2 = (Hc ** 2).sum()
print(f'   leading-order energy per unit log length of the cone delta + eps s_H, H = diag(1,.5,-.3,-1.2): (20 pi^2/9)|H|^2 eps^2 = '
      f'{20 * np.pi ** 2 / 9 * hc2 * 0.05 ** 2:.9f} (eps = 0.05), {20 * np.pi ** 2 / 9 * hc2 * 0.3 ** 2:.6f} (eps = 0.30)')

print('4. operator identities on random polynomial tensors (exact)')
rnd = random.Random(12)


def rand_poly(deg, nterms):
    acc = ZERO
    for _ in range(nterms):
        a = rnd.choice(monomials(rnd.randint(0, deg)))
        acc = acc + F.mono(a, 0, 0, Fr(rnd.randint(-6, 6), rnd.randint(1, 5)))
    return acc


hp = {p: rand_poly(7, 5) for p in PAIRS}
op = lin_ops(hp)
tr = ZERO
for i in range(4):
    tr = tr + op['B'][(i, i)]
report(tr.iszero(), "tr B'(h) = 0 for a random polynomial h of degree 7")
okd = True
for j in range(4):
    acc = ZERO
    for i in range(4):
        acc = acc + sym(op['B'], i, j).d(i)
    okd = okd and acc.iszero()
report(okd, "div B'(h) = 0")
report(all((op['B'][p] - op['B2'][p]).iszero() for p in PAIRS), "d_k d_l W'_ikjl = Laplacian A' - Hess tr A'")
Zp = [rand_poly(7, 6) for _ in range(4)]; fp = rand_poly(6, 6)
gauge = {(i, j): Zp[j].d(i) + Zp[i].d(j) + (fp if i == j else ZERO) for (i, j) in PAIRS}
og = lin_ops(gauge)
report(all(v.iszero() for v in og['W'].values()) and all(v.iszero() for v in og['B'].values()),
       "W' and B' vanish on L_Z delta + f delta for random polynomial Z and f")
opB = lin_ops(op['B'])
WK = [(i, j, k, l) for i in range(4) for j in range(i + 1, 4) for k in range(4) for l in range(k + 1, 4) if (i, j) <= (k, l)]
report(all((lap(lap(op['W'][key])) + 4 * opB['W'][key]).iszero() for key in WK),
       "Laplacian^2 W'(h) = -4 W'(B'(h)) on the 21 independent components")
nz = sum(1 for key in WK if not lap(lap(op['W'][key])).iszero())
print(f'        (non-trivially: {nz} of the 21 components of Laplacian^2 W\'(h) are nonzero)')

print('5. modes of homogeneity +2 and -2')
Wt = exact_weyl(4)
oksym = all(Wt[(i, j, k, l)] == -Wt[(j, i, k, l)] == -Wt[(i, j, l, k)] == Wt[(k, l, i, j)] for i, j, k, l in itertools.product(range(4), repeat=4))
okb = all(Wt[(i, j, k, l)] + Wt[(i, k, l, j)] + Wt[(i, l, j, k)] == 0 for i, j, k, l in itertools.product(range(4), repeat=4))
okt = all(sum(Wt[(i, j, i, l)] for i in range(4)) == 0 for j in range(4) for l in range(4))
wn2 = sum(v * v for v in Wt.values())
report(oksym and okb and okt and wn2 > 0, f'a rational tensor with the symmetries of a Weyl tensor (pair symmetries, Bianchi, trace free), |W|^2 = {wn2}')


def quad_form(s, coef):
    """W_ikjl x_k x_l rho^s * coef as a tensor dict"""
    out = {}
    for (i, j) in PAIRS:
        acc = ZERO
        for k in range(4):
            for l in range(4):
                acc = acc + F.mono(madd(unit(k), unit(l)), s, 0, coef * Wt[(i, k, j, l)])
        out[(i, j)] = acc
    return out


def is_tt(hh):
    tr = ZERO
    for i in range(4):
        tr = tr + hh[(i, i)]
    ok = is0(tr)
    for j in range(4):
        acc = ZERO
        for i in range(4):
            acc = acc + sym(hh, i, j).d(i)
        ok = ok and is0(acc)
    return ok


q = quad_form(0, Fr(-1, 3))
oq = lin_ops(q)
report(is_tt(q), 'q = -(1/3) W_ikjl x_k x_l is divergence free and trace free')
report(all(is0(oq['Rm'][key] - F.mono(ZA, 0, 0, Wt[key])) for key in oq['Rm']), "Rm'[q] = W exactly (so W'[q] = W and B'[q] = 0)")
hq = quad_form(-4, Fr(1))
oh = lin_ops(hq)
report(is_tt(hq), 'h = W_ikjl x_k x_l rho^-4 is divergence free and trace free')
report(all(is0(v) for v in oh['B'].values()), "B'(h) = 0 away from the origin")
pt = (0.3, -0.7, 0.5, 0.4)
wmax = max(abs(v(pt)) for v in oh['W'].values())
report(wmax > 1e-3, f"W'(h) != 0 away from the origin (max component at a test point {wmax:.4f})")
# weak form of  B'(-pi^-2 W_ikjl x_k x_l rho^-4) = W_ikjl d_k d_l delta_0  against Gaussian test tensors
phi = {}
for p in PAIRS:
    acc = ZERO
    for _ in range(6):
        a = rnd.choice(monomials(rnd.randint(0, 4)))
        acc = acc + F.mono(a, 0, 0, Fr(rnd.randint(-6, 6), rnd.randint(1, 5)), 1)
    phi[p] = acc
ophi = lin_ops(phi)
lhs = Fr(0)
for i in range(4):
    for j in range(4):
        for k in range(4):
            for l in range(4):
                c0 = Wt[(i, k, j, l)]
                if c0 == 0:
                    continue
                for (a, s, e), c in sym(ophi['B'], i, j).t.items():
                    assert s == 0 and e == 0
                    lhs += -c0 * c * inv4_gauss_moment(madd(a, madd(unit(k), unit(l))))
rhs = Fr(0)
for i in range(4):
    for j in range(4):
        for k in range(4):
            for l in range(4):
                d2 = sym(phi, i, j).d(k).d(l)
                rhs += Wt[(i, k, j, l)] * d2.t.get((ZA, Fr(0), 0), 0)
report(lhs == rhs and rhs != 0, f"-pi^-2 int <W_ikjl x_k x_l rho^-4, B'(phi)_ij> dx = W_ikjl d_k d_l phi_ij(0) = {rhs} for a random Gaussian test tensor")

print('6. energy identity for a generic Gaussian tensor (exact, in units of pi^2/4)')
hg = {}
for p in PAIRS:
    acc = ZERO
    for _ in range(4):
        a = rnd.choice(monomials(rnd.randint(0, 2)))
        acc = acc + F.mono(a, 0, 0, Fr(rnd.randint(-4, 4), rnd.randint(1, 3)), 1)
    hg[p] = acc
ogs = lin_ops(hg)
EW = sum(gauss_pair(v, v) for v in ogs['W'].values() if not v.iszero())
EB = sum(gauss_pair(sym(ogs['B'], i, j), sym(hg, i, j)) for i in range(4) for j in range(4)
         if not sym(ogs['B'], i, j).iszero() and not sym(hg, i, j).iszero())
tr = ZERO
for i in range(4):
    tr = tr + hg[(i, i)]
report(EW == -2 * EB and EW > 0, f"int |W'(h)|^2 = -2 int <B'(h),h> = {EW} * pi^2/4 for a Gaussian tensor that is neither trace free nor divergence free")

print('7. amplitude identity for a divergence-free trace-free Schwartz tensor')
ht = {}
for (j, qq) in PAIRS:
    acc = ZERO
    for i in range(4):
        for p in range(4):
            acc = acc + F.mono(madd(unit(i), unit(p)), 0, 0, 4 * Wt[(i, j, p, qq)], 1)
    ht[(j, qq)] = acc
ot = lin_ops(ht)
report(is_tt(ht), 'h_jq = 4 W_ijpq x_i x_p exp(-rho^2) is divergence free and trace free')
okb = True
for p in PAIRS:
    l2 = lap(lap(ht[p]))
    okb = okb and (ot['B'][p] + Fr(1, 4) * l2).iszero()
report(okb, "B'(h) = -(1/4) Laplacian^2 h on this tensor")
# closed form of beta: -16 Q(y)(s^2 - 10 s + 20) exp(-s), s = |y|^2, Q(y)_jq = W_ijpq y_i y_p
Tn = np.zeros((4, 4, 4, 4))
for key, v in Wt.items():
    Tn[key] = float(v)
Qf = lambda y: np.einsum('ijpq,...i,...p->...jq', Tn, y, y)
hfun = lambda x: 4 * Qf(x) * np.exp(-(x ** 2).sum(-1))[..., None, None]


def beta(y):
    s = (y ** 2).sum(-1)
    return -16 * Qf(y) * ((s ** 2 - 10 * s + 20) * np.exp(-s))[..., None, None]


x0 = np.array([0.3, -0.5, 0.2, 0.6])
bex = np.array([[sym(ot['B'], i, j)(x0) for j in range(4)] for i in range(4)])
report(np.abs(bex - beta(x0)).max() < 1e-12, f'closed form beta = -16 Q(y)(|y|^4 - 10|y|^2 + 20) exp(-|y|^2) agrees with the exact B\'(h) at x0 (deviation {np.abs(bex - beta(x0)).max():.1e})')
rg, wg = np.polynomial.legendre.leggauss(120); rmax = 9.0
r = 0.5 * rmax * (rg + 1); wr = 0.5 * rmax * wg
sp, sw = s3_nodes(14)
acc = np.zeros((4, 4))
for ri, wri in zip(r, wr):
    y = x0[None, :] + ri * sp
    acc += wri * ri ** 3 * np.einsum('p,pjk,pk,pq->jq', sw, beta(y), sp, sp)
rhsn = -acc / (2 * np.pi ** 2)
dev = np.abs(hfun(x0) - rhsn).max()
report(dev < 1e-10, f'numerical: h(x0) = -(2 pi^2)^-1 int (beta(y) w)(x)w dy at x0 = (0.3,-0.5,0.2,0.6): max deviation {dev:.1e} (max |h(x0)| = {np.abs(hfun(x0)).max():.4f})')
xs = np.random.default_rng(8).normal(size=(200000, 4)) * 0.9
sup_h = np.linalg.norm(hfun(xs), axis=(1, 2)).max()
ang = (sw * np.linalg.norm(Qf(sp), axis=(1, 2))).sum()
rad = (wr * r ** 5 * np.abs(r ** 4 - 10 * r ** 2 + 20) * np.exp(-r ** 2)).sum()
L1 = 16 * ang * rad
ang2 = (sw * np.einsum('pjq,pjq->p', Qf(sp), Qf(sp))).sum()
rad2 = (wr * r ** 7 * (4 * (4 * r ** 2 - 16)) ** 2 * np.exp(-2 * r ** 2)).sum()
En = 0.5 * ang2 * rad2
EWt = float(sum(gauss_pair(v, v) for v in ot['W'].values() if not v.iszero())) * np.pi ** 2 / 4
report(abs(En - EWt) < 1e-9 * EWt, f"numerical (1/2) int |Laplacian h|^2 = {En:.9f} against exact int |W'(h)|^2 = {EWt:.9f}")
report(sup_h <= L1 / (2 * np.pi ** 2) and EWt <= L1 ** 2 / np.pi ** 2,
       f"sup|h| = {sup_h:.5f} <= (2 pi^2)^-1 ||B'(h)||_1 = {L1 / (2 * np.pi ** 2):.5f};  int |W'(h)|^2 = {EWt:.5f} <= pi^-2 ||B'(h)||_1^2 = {L1 ** 2 / np.pi ** 2:.5f}")

print('8. numerical: nonlinear Bach tensor and Weyl density near the flat metric (truncated Taylor arithmetic)')
from sec_jets import Jets
from sec_noether_lib import weyl_density
J = Jets(4)
A = np.random.default_rng(2).normal(size=(4, 4)); Hr = A + A.T; Hr -= np.trace(Hr) / 4 * np.eye(4)
p = np.array([0.7, -0.4, 0.5, 0.3]); rho = np.linalg.norm(p)
x = J.var(p)
r2 = sum(J.mul(x[i], x[i]) for i in range(4))
Lj = 0.5 * J.log(r2)
hjet = np.einsum('ij,C->ijC', Hr, Lj)
ref = bH(Hr, (p / rho)[None])[0] / rho ** 4
Wref = Wlog(Hr, (p / rho)[None])[0] / rho ** 2
for s in (1e-2, 1e-3, 1e-4):
    bp = J.bach(J.const(np.eye(4)) + s * hjet)['Bach'][..., 0]
    bm = J.bach(J.const(np.eye(4)) - s * hjet)['Bach'][..., 0]
    dens = weyl_density(J, J.const(np.eye(4)) + s * hjet)[0] / s ** 2
    print(f"   s = {s:.0e}: max|(B(delta + s h) - B(delta - s h))/(2s) - B'(h)| = {np.abs((bp - bm) / (2 * s) - ref).max():.2e} (max|B'(h)| = {np.abs(ref).max():.3f});"
          f"  |W|^2 sqrt(g)/s^2 = {dens:.8f}, |W'(h)|^2 = {(Wref ** 2).sum():.8f}")
print(f'all assertions passed; time {time.time() - T0:.1f} s')
