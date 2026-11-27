#!/usr/bin/env python3
"""
check_06_pole_forms.py

Checks for the note ALTERNATIVE_FRAMEWORKS_AND_INVESTIGATIONS_2_20261127.md, section 3
(closed self-dual forms with a quartic pole).

(a) Inversion.  x = y/|y|^2 pulls a constant-coefficient two-form back to |y|^-4 times
    its image under the reflection in the hyperplane orthogonal to y, exchanges the two
    dualities, and the result is closed.
(b) Diagonal Bianchi IX metrics dr^2 + a^2 s1^2 + b^2 s2^2 + c^2 s3^2 with
    d s1 = 2 s2 ^ s3 (cyclic).  d(f s1) is closed and self-dual exactly when
    f' = 2 a f/(b c).  The Gram matrix of the three forms is diagonal.
(c) A curvature engine for these metrics, validated on flat space, the round sphere and
    the Fubini-Study metric.
(d) The explicit family a = r(1 + eps r^2/(1+r^2)^2), b = c = r on S^4: the three pole
    forms are zero-free for every eps > -4, while the chiral Weyl energy
    e = E_+ = E_- crosses the wall 8 pi^2.
No repository code is used.
"""
import itertools, sys
import sympy as sp
import mpmath as mp
from sympy.combinatorics import Permutation

results = []
def check(name, cond):
    results.append(bool(cond))
    print(("ok   " if cond else "FAIL ") + name)

# ------------------------------------------------------------------ (a) inversion
y = sp.symbols('y1:5', real=True)
rho2 = sum(v**2 for v in y)
x = [v / rho2 for v in y]
Jac = sp.Matrix(4, 4, lambda i, j: sp.diff(x[i], y[j]))          # dx^i = Jac[i,j] dy^j
def pull(w):                                                      # w: antisymmetric 4x4 of constants
    return sp.simplify(Jac.T * w * Jac)
def two_form(pairs):
    w = sp.zeros(4, 4)
    for (i, j), cval in pairs.items():
        w[i, j] += cval; w[j, i] -= cval
    return w
def star(w):                                                      # Euclidean Hodge star, orientation dy1..dy4
    out = sp.zeros(4, 4)
    for i, j in itertools.combinations(range(4), 2):
        k, l = [m for m in range(4) if m not in (i, j)]
        sgn = Permutation([i, j, k, l]).signature()
        out[k, l] += sgn * w[i, j]; out[l, k] -= sgn * w[i, j]
    return out
SD = two_form({(0, 1): 1, (2, 3): 1})
ASD = two_form({(0, 1): 1, (2, 3): -1})
Rfl = sp.eye(4) - 2 * sp.Matrix(y) * sp.Matrix(y).T / rho2          # reflection in y-perp
pSD = pull(SD)
check("(a1) inversion pull-back equals |y|^-4 times the reflected form",
      sp.simplify(pSD - (Rfl.T * SD * Rfl) / rho2**2) == sp.zeros(4, 4))
check("(a2) a self-dual constant form pulls back to an anti-self-dual form",
      sp.simplify(star(pSD) + pSD) == sp.zeros(4, 4))
check("(a3) and an anti-self-dual one to a self-dual one",
      sp.simplify(star(pull(ASD)) - pull(ASD)) == sp.zeros(4, 4))
def dform(w):                                                     # exterior derivative of a 2-form, component (i,j,k)
    return [sp.simplify(sp.diff(w[i, j], y[k]) + sp.diff(w[j, k], y[i]) + sp.diff(w[k, i], y[j]))
            for i, j, k in itertools.combinations(range(4), 3)]
check("(a4) the pulled-back form is closed", all(v == 0 for v in dform(pSD)))
norm2 = sp.simplify(sum(pSD[i, j]**2 for i in range(4) for j in range(4)) / 2)
check("(a5) its pointwise norm squared is 2 |y|^-8 (a pole of order four)", sp.simplify(norm2 - 2 / rho2**4) == 0)

# ------------------------------------------------------------------ exterior calculus on (dr, s1, s2, s3)
r = sp.symbols('r', positive=True)
KAPPA = 2
def wedge(A, B):
    out = {}
    for I, u in A.items():
        for Jx, v in B.items():
            if set(I) & set(Jx):
                continue
            idx = list(I) + list(Jx)
            perm = sorted(range(len(idx)), key=lambda t: idx[t])
            sgn = Permutation(perm).signature()
            key = tuple(sorted(idx))
            out[key] = out.get(key, 0) + sgn * u * v
    return {k: sp.simplify(v) for k, v in out.items() if sp.simplify(v) != 0}
def add(A, B, s=1):
    out = dict(A)
    for k, v in B.items():
        out[k] = out.get(k, 0) + s * v
    return {k: sp.simplify(v) for k, v in out.items() if sp.simplify(v) != 0}
DS = {1: {(2, 3): KAPPA}, 2: {(1, 3): -KAPPA}, 3: {(1, 2): KAPPA}}      # d s2 = 2 s3^s1 = -2 s1^s3
def d_basis(I):
    out = {}
    for pos, i in enumerate(I):
        if i == 0:
            continue
        left = {tuple(I[:pos]): 1} if pos else {(): 1}
        right = {tuple(I[pos + 1:]): 1} if pos + 1 < len(I) else {(): 1}
        term = wedge(wedge(left, DS[i]), right)
        out = add(out, term, (-1) ** pos)
    return out
def d(A):
    out = {}
    for I, u in A.items():
        du = sp.diff(u, r)
        if du != 0:
            out = add(out, wedge({(0,): du}, {I: 1}))
        out = add(out, {k: u * v for k, v in d_basis(I).items()})
    return out
check("(b0) d(d s_i) = 0 for the structure equations", all(d(DS[i]) == {} for i in (1, 2, 3)))

def geometry(a):
    """a = [1, a1, a2, a3]; orthonormal coframe e^m = a[m] * basis_m.  Returns curvature R[a][b][c][d]."""
    e = [{(m,): a[m]} for m in range(4)]
    de = [d(f) for f in e]
    G = {}
    unknowns = []
    for p, q in itertools.combinations(range(4), 2):
        for c in range(4):
            s = sp.Symbol(f"G_{p}{q}{c}")
            G[(p, q, c)] = s; G[(q, p, c)] = -s
            unknowns.append(s)
    def om(p, q):
        if p == q:
            return {}
        return {(c,): G[(p, q, c)] * a[c] for c in range(4)}
    eqs = []
    for p in range(4):
        tot = dict(de[p])
        for q in range(4):
            tot = add(tot, wedge(om(p, q), e[q]))
        eqs.extend(tot.values())
    sol = sp.solve(eqs, unknowns, dict=True)[0]
    def omv(p, q):
        return {k: sp.simplify(v.subs(sol)) for k, v in om(p, q).items() if sp.simplify(v.subs(sol)) != 0}
    R = [[[[0] * 4 for _ in range(4)] for _ in range(4)] for _ in range(4)]
    for p, q in itertools.combinations(range(4), 2):
        Om = d(omv(p, q))
        for c in range(4):
            Om = add(Om, wedge(omv(p, c), omv(c, q)))
        for (c, dd), v in Om.items():
            val = sp.simplify(v / (a[c] * a[dd]))
            R[p][q][c][dd] = val; R[p][q][dd][c] = -val
            R[q][p][c][dd] = -val; R[q][p][dd][c] = val
    return R
PAIRS = [(0, 1), (0, 2), (0, 3), (2, 3), (3, 1), (1, 2)]
def weyl_blocks(R):
    Op = sp.Matrix(6, 6, lambda I, Jx: R[PAIRS[I][0]][PAIRS[I][1]][PAIRS[Jx][0]][PAIRS[Jx][1]])
    scal = sp.simplify(2 * Op.trace())
    P = sp.Matrix(6, 3, lambda I, k: sp.Rational(1) if I in (k, k + 3) else 0) / sp.sqrt(2)
    M = sp.Matrix(6, 3, lambda I, k: (1 if I == k else (-1 if I == k + 3 else 0))) / sp.sqrt(2)
    A = sp.simplify(P.T * Op * P); C = sp.simplify(M.T * Op * M)
    Wp = sp.simplify(A - scal / 12 * sp.eye(3)); Wm = sp.simplify(C - scal / 12 * sp.eye(3))
    return scal, Wp, Wm
def hs(W):
    return sp.simplify(sum(W[i, j]**2 for i in range(3) for j in range(3)))

# ------------------------------------------------------------------ (b) self-dual forms d(f s_i)
af, bf, cf, f = [sp.Function(n)(r) for n in ('a', 'b', 'c', 'f')]
omega1 = d({(1,): f})                                              # f' dr^s1 + 2 f s2^s3
comp01 = sp.simplify(omega1[(0, 1)] / af)                          # coefficient of e0^e1
comp23 = sp.simplify(omega1[(2, 3)] / (bf * cf))                   # coefficient of e2^e3
check("(b1) d(f s1) = (f'/a) e0^e1 + (2 f/(b c)) e2^e3",
      sp.simplify(comp01 - sp.diff(f, r) / af) == 0 and sp.simplify(comp23 - 2 * f / (bf * cf)) == 0)
check("(b2) hence self-dual exactly when f' = 2 a f/(b c); for a = b = c = r this gives f = r^2",
      sp.simplify((sp.diff(r**2, r) - 2 * r * r**2 / (r * r))) == 0)
check("(b3) d(f s1) is closed", d(omega1) == {})
check("(b4) forms d(f_i s_i) for different i have no common components, so the Gram matrix is diagonal",
      set(d({(1,): f})) & set(d({(2,): f})) == set() and set(d({(2,): f})) & set(d({(3,): f})) == set())

# ------------------------------------------------------------------ (c) validation of the curvature engine
s_flat, Wp, Wm = weyl_blocks(geometry([1, r, r, r]))
check("(c1) flat space: zero curvature", s_flat == 0 and Wp == sp.zeros(3, 3) and Wm == sp.zeros(3, 3))
s_rd, Wp, Wm = weyl_blocks(geometry([1, sp.sin(r), sp.sin(r), sp.sin(r)]))
check("(c2) round sphere: R = 12 and W = 0", sp.simplify(s_rd - 12) == 0 and Wp == sp.zeros(3, 3) and Wm == sp.zeros(3, 3))
s_fs, Wp, Wm = weyl_blocks(geometry([1, sp.sin(r) * sp.cos(r), sp.sin(r), sp.sin(r)]))
ev = sorted([sp.simplify(Wp[i, i]) for i in range(3)] + [sp.simplify(Wm[i, i]) for i in range(3)])
check(f"(c3) Fubini-Study: R = 24, one block diag(4,-2,-2), the other zero (found R = {s_fs}, entries {ev})",
      sp.simplify(s_fs - 24) == 0 and ev == [-2, -2, 0, 0, 0, 4])
hs_fs = max(hs(Wp), hs(Wm))
vol_fs = 2 * sp.pi**2 * sp.integrate(sp.sin(r)**3 * sp.cos(r), (r, 0, sp.pi / 2))
check("(c4) Fubini-Study: integral of |W|^2 over the nonzero block is 12 pi^2 (signature one)",
      sp.simplify(hs_fs * vol_fs - 12 * sp.pi**2) == 0)

# ------------------------------------------------------------------ (d) the family on S^4
eps = sp.symbols('eps', real=True)
h = r**2 / (1 + r**2)**2
a1 = r * (1 + eps * h)
check("(d0) h is invariant under r -> 1/r, so the class extends smoothly over the point at infinity",
      sp.simplify(h.subs(r, 1 / r) - h) == 0)
f1 = r**2 * sp.exp(-eps / (1 + r**2))
check("(d1) f_1 = r^2 exp(-eps/(1+r^2)) solves f' = 2 a f/(b c)",
      sp.simplify(sp.diff(f1, r) - 2 * a1 * f1 / r**2) == 0)
integrand2 = sp.simplify(2 / a1 - 2 / r)                           # (log f_2)' - 2/r
check("(d2) (log f_2)' - 2/r = -2 eps h/(r (1 + eps h)) is O(r) at 0 and O(r^-3) at infinity",
      sp.simplify(integrand2 + 2 * eps * h / (r * (1 + eps * h))) == 0
      and sp.limit(integrand2 / r, r, 0) == -2 * eps and sp.limit(integrand2 * r**3, r, sp.oo) == -2 * eps)
check("(d3) a > 0 for every r exactly when eps > -4 (max of h is 1/4 at r = 1)",
      sp.simplify(h.subs(r, 1) - sp.Rational(1, 4)) == 0 and sp.simplify(sp.diff(h, r).subs(r, 1)) == 0)
print("     so for eps > -4 the forms d(f_i s_i), f_i > 0, are closed, self-dual, asymptotic to constant")
print("     forms and nowhere zero: the pole triple at the point at infinity is definite.")

scal, Wp, Wm = weyl_blocks(geometry([1, a1, r, r]))
hp = sp.lambdify((r, eps), hs(Wp) * a1 * r * r, 'mpmath')
hm = sp.lambdify((r, eps), hs(Wm) * a1 * r * r, 'mpmath')
mp.mp.dps = 20
def energies(e):
    Ep = 2 * mp.pi**2 * mp.quad(lambda t: hp(t, e), [0, 0.5, 1, 2, 5, 20, mp.inf])
    Em = 2 * mp.pi**2 * mp.quad(lambda t: hm(t, e), [0, 0.5, 1, 2, 5, 20, mp.inf])
    return Ep, Em
T = 4 * mp.pi**2
table = []
for e in (0.5, 1, 2, 3, 4, 6, 8, 12, -1, -2, -3, -3.5):
    Ep, Em = energies(e)
    table.append((e, Ep, Em))
    print(f"     eps = {e:>5}:  E_+ = {mp.nstr(Ep, 10)}  E_- = {mp.nstr(Em, 10)}  e/T = {mp.nstr(Ep / T, 6)}")
check("(d4) E_+ = E_- for every sampled eps (signature zero), to 1e-9 relative",
      all(abs(Ep - Em) <= 1e-9 * max(1, abs(Ep)) for _, Ep, Em in table))
above = [e for e, Ep, _ in table if Ep > 2 * T]
below = [e for e, Ep, _ in table if Ep < T]
print("     sampled eps with e > 2T = 8 pi^2:", above)
print("     sampled eps with e < T  = 4 pi^2:", below)
check("(d5) some sampled classes lie above the wall 2T, and their pole triple is still definite", len(above) > 0)
Ep_small, _ = energies(mp.mpf('0.01'))
check("(d6) e = O(eps^2) near the round class", Ep_small < 1e-2 and Ep_small > 0)

n_ok = sum(results)
print(f"check_06_pole_forms: {n_ok} ok, {len(results) - n_ok} FAIL")
sys.exit(0 if n_ok == len(results) else 1)
