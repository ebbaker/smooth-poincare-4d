#!/usr/bin/env python3
"""
check_04: arithmetic of the doubling tests, of the Kobayashi threshold and of
the balanced recognition criterion in the note
PATHS_FORWARD_AFTER_ATTAINMENT_AND_ENTRY_TRIALS_20261126.md.

Written from the definitions only.  No repository script was read or reused.

Notation.  T = 4 pi^2, u = 16 pi^2/3.  For a compact W with umbilic boundary,
DW is the reflection double, w = (E_+(W) + E_-(W))/2, and Y, D are the Yamabe
constant and int |Ric_0|^2 of the unit-volume Yamabe metric of the doubled
class.

Claims tested
  (a) u = 4T/3 and the entry budget 2T equals 1.5 u; 4u = 64 pi^2/3 is the
      total Weyl energy of the Einstein S^2 x S^2;
  (b) Gauss-Bonnet inside the product class: pointwise
        |W^+|^2 + |W^-|^2 + R^2/24 - |Z|^2/2 = 2K   for q + g_{S^2};
  (c) doubling identity  w = 4 pi^2 chi(W) - Y^2/96 + D/8, exact on
      W = hemisphere x S^2 (double: Einstein S^2 x S^2) and on
      W = S^1(l) x hemisphere of S^3 (double: S^1 x S^3);
  (d) thresholds: with chi(W) = 2, w < u needs Y < -16 pi and w < 4 pi^2
      needs Y < -8 sqrt6 pi; with chi(W) = 1, w < 4 pi^2 needs Y < 0;
      with a representative, w < u needs int_W R^2 > 128 pi^2 (chi(W) = 2);
  (e) Euler characteristics of the pieces used in the three tests;
  (f) the presentation of investigation 07: exponent sums, determinant -1,
      one-relator quotients with first homology Z;
  (g) algebra of positive isotropic curvature: for trace-free symmetric 3x3
      matrices lambda_max <= sqrt(2/3) |.|, equality at (2,-1,-1); with
      A = W^+ + (R/12) Id the sum of the two smallest eigenvalues of A is
      positive iff lambda_max(W^+) < R/6; hence |W^+-|^2 < R^2/24 suffices,
      with equality on S^2 x S^2 and on CP^2;
  (h) Hoelder step  int m u^2 <= |m|_2 |u|_4^2  on random data;
  (i) balanced recognition thresholds: with int max(|W^+|^2,|W^-|^2) = b e,
      the criterion b e < 16 pi^2 - 2e reads e < 16 pi^2/(2+b): T at b = 2,
      u at b = 1;
  (j) Einstein case: e >= Y^2/24 and 16 pi^2 = 2e + Y^2/24 give e >= u and
      Vol <= Vol(S^4)/3 at Ric = 3g;
  (k) the plan's recognition quantity P = 4 E_+ + 3 l^2, l^2 = int L^2 with L the
      largest eigenvalue of W^+ and W^-: on q + g_{S^2} with K >= -1, P = 6e.
"""
import math

import numpy as np
import sympy as sp

PI = math.pi
T = 4 * PI**2
U = 16 * PI**2 / 3
NOK = 0
NFAIL = 0


def report(name, ok, detail=""):
    global NOK, NFAIL
    if ok:
        NOK += 1
    else:
        NFAIL += 1
    print(("[ok]   " if ok else "[FAIL] ") + name + ((" | " + detail) if detail else ""))


# (a)
report("(a) u = 4T/3, 2T = 1.5 u, 4u = 64 pi^2/3",
       abs(U - 4 * T / 3) < 1e-12 and abs(2 * T - 1.5 * U) < 1e-12 and abs(4 * U - 64 * PI**2 / 3) < 1e-12,
       f"T = {T / PI**2:.4f} pi^2, u = {U / PI**2:.4f} pi^2, 2T = {2 * T / PI**2:.4f} pi^2")

# (b)
K = sp.symbols('K', real=True)
Rs = 2 * K + 2
integrand = 2 * (K + 1)**2 / 6 + Rs**2 / 24 - (K - 1)**2 / 2
report("(b) Gauss-Bonnet integrand of q + g_{S^2} equals 2K, so 8 pi^2 chi = 4 pi int 2K dA",
       sp.simplify(integrand - 2 * K) == 0)


# (c)
def w_formula(chiW, Y, D):
    return 4 * PI**2 * chiW - Y**2 / 96 + D / 8

report("(c) W = hemisphere x S^2: w = u and the formula gives u with Y = 16 pi, D = 0",
       abs(w_formula(2, 16 * PI, 0.0) - U) < 1e-10)
okc = True
for ell in (0.3, 1.0, 2.0):
    vol = 2 * PI**2 * ell
    Y = 6 * math.sqrt(vol)                       # product metric, constant scalar curvature 6
    D = 3 * vol
    okc = okc and abs(w_formula(0, Y, D)) < 1e-10
report("(c) W = S^1(l) x hemisphere of S^3: w = 0 = 4 pi^2 * 0 - Y^2/96 + D/8 for the product metric", okc)

# (d)
report("(d) chi(W) = 2: 8 pi^2 - Y^2/96 equals u at |Y| = 16 pi and 4 pi^2 at |Y| = 8 sqrt6 pi",
       abs(w_formula(2, 16 * PI, 0) - U) < 1e-10 and abs(w_formula(2, 8 * math.sqrt(6) * PI, 0) - 4 * PI**2) < 1e-10,
       f"16 pi = {16 * PI:.3f}, 8 sqrt6 pi = {8 * math.sqrt(6) * PI:.3f}")
report("(d) chi(W) = 1: 4 pi^2 - Y^2/96 equals 4 pi^2 at Y = 0", abs(w_formula(1, 0.0, 0) - 4 * PI**2) < 1e-12)
report("(d) representative form: 8 pi^2 - (1/48) int_W R^2 equals u at int_W R^2 = 128 pi^2",
       abs(8 * PI**2 - 128 * PI**2 / 48 - U) < 1e-10)
report("(d) an entering pair c_1 + c_2 < 8 pi^2 has min c_i < 4 pi^2 < u, so 4 min c_i < 16 pi^2 < 64 pi^2/3",
       4 * PI**2 < U and 16 * PI**2 < 64 * PI**2 / 3)

# (e) Euler characteristics
chi = {"S1xD3": 0, "D2xS2": 2, "S1xS2": 0, "S1xS3": 0}
chi_N = 2 - 2 * 2                                # #_2 S^1 x S^3 = S^4 with two 1-handles and two 3-handles
chi_M = chi_N + 2 * (chi["D2xS2"] - chi["S1xD3"])
chi_WA = chi_M - 3 * chi["S1xD3"]
chi_DWA = 2 * chi_WA - 3 * chi["S1xS2"]
chi_half = -1                                     # pants x D^2
chi_Wi = chi_half + chi["D2xS2"] - chi["S1xD3"]
chi_Di = 2 * chi_Wi - 0                           # boundary #_2 S^1 x S^2 has chi = 0
chi_Wplus = 2 - chi["S1xD3"]
chi_DWplus = 2 * chi_Wplus - chi["S1xS2"]
report("(e) chi(N) = -2, chi(M) = 2; three-cuff core 2, its double 4; equator halves 1, doubles 2; Hopf half 2, double 4",
       (chi_N, chi_M, chi_WA, chi_DWA, chi_Wi, chi_Di, chi_Wplus, chi_DWplus) == (-2, 2, 2, 4, 1, 2, 2, 4))
report("(e) Gursky's bound on a double with chi = 4, tau = 0 is 32 pi^2/3 = 2u for E_+ = 2w, so w >= u",
       abs(4 * PI**2 / 3 * (2 * 4 + 0) - 2 * U) < 1e-10)

# (f) the marked presentation  r1 = x^-1 y^2 x y^-3,  r2 = x^-1 y x^2 y^-1 x^-2
def expsum(word):
    ex = {'x': 0, 'y': 0}
    for g, p in word:
        ex[g] += p
    return ex['x'], ex['y']

r1 = [('x', -1), ('y', 2), ('x', 1), ('y', -3)]
r2 = [('x', -1), ('y', 1), ('x', 2), ('y', -1), ('x', -2)]
M = np.array([expsum(r1), expsum(r2)])
length = sum(abs(p) for _, p in r1) + sum(abs(p) for _, p in r2)
report("(f) exponent sums (0,-1) and (-1,0), determinant -1, total length 14",
       M.tolist() == [[0, -1], [-1, 0]] and round(np.linalg.det(M)) == -1 and length == 14)
report("(f) each one-relator quotient has first homology Z (one exponent-sum row of content 1)",
       all(math.gcd(abs(int(a)), abs(int(b))) == 1 for a, b in M))

# (g) PIC algebra
rng = np.random.default_rng(4)
okg, tight = True, 0.0
for trial in range(4000):
    X = rng.normal(size=(3, 3))
    X = (X + X.T) / 2
    X -= np.trace(X) / 3 * np.eye(3)
    lam = np.linalg.eigvalsh(X)[-1]
    nrm = math.sqrt(np.sum(X * X))
    okg = okg and lam <= math.sqrt(2.0 / 3.0) * nrm + 1e-12
    tight = max(tight, lam / nrm)
X0 = np.diag([2.0, -1.0, -1.0])
report("(g) lambda_max <= sqrt(2/3) |W| on 4000 random trace-free matrices, equality at diag(2,-1,-1)",
       okg and abs(2.0 / math.sqrt(6.0) - math.sqrt(2.0 / 3.0)) < 1e-12, f"largest ratio seen {tight:.4f} <= {math.sqrt(2 / 3):.4f}")
okp = True
for trial in range(4000):
    X = rng.normal(size=(3, 3))
    X = (X + X.T) / 2
    X -= np.trace(X) / 3 * np.eye(3)
    R = rng.uniform(0.1, 20)
    ev = np.linalg.eigvalsh(X + R / 12 * np.eye(3))
    okp = okp and ((ev[0] + ev[1] > 0) == (np.linalg.eigvalsh(X)[-1] < R / 6))
report("(g) a_1 + a_2 > 0 for A = W^+ + (R/12) Id  <=>  lambda_max(W^+) < R/6 (4000 random cases)", okp)
report("(g) |W^+-|^2 = R^2/24 exactly on the Einstein S^2 x S^2 (R = 4) and on CP^2 (W^+ = diag(R/6,-R/12,-R/12))",
       abs((1.0 + 1.0)**2 / 6 - 4.0**2 / 24) < 1e-12            # (K+1)^2/6 at K = 1 against R^2/24 at R = 4
       and abs((1 / 36 + 2 / 144) - 1 / 24) < 1e-12)            # (1/6)^2 + 2 (1/12)^2 = 1/24

# (h) Hoelder
okh = True
for trial in range(500):
    n = 50
    wts = rng.uniform(0.1, 1, n)
    m = rng.uniform(0, 3, n)
    uu = rng.normal(size=n)
    lhs = np.sum(wts * m * uu**2)
    rhs = math.sqrt(np.sum(wts * m**2)) * math.sqrt(np.sum(wts * uu**4))
    okh = okh and lhs <= rhs + 1e-12
report("(h) int m u^2 <= |m|_2 |u|_4^2 on 500 random weighted samples", okh)

# (i) thresholds of the balanced criterion
thr = lambda b: 16 * PI**2 / (2 + b)
report("(i) e < 16 pi^2/(2+b): T at b = 2, u at b = 1, monotone in between",
       abs(thr(2) - T) < 1e-12 and abs(thr(1) - U) < 1e-12 and all(thr(b1) > thr(b2) for b1, b2 in [(1, 1.5), (1.5, 2)]))

# (j) Einstein case
e_min = sp.symbols('e_min', positive=True)
sol = sp.solve(sp.Eq(16 * sp.pi**2, 2 * e_min + e_min), e_min)[0]
vol_max = sp.symbols('v', positive=True)
# Ric = 3g: R = 12, Y^2 = 144 Vol; 16 pi^2 = 2e + 6 Vol and e >= 6 Vol give Vol <= 16 pi^2/18
vmax = sp.Rational(16, 18) * sp.pi**2
report("(j) e >= Y^2/24 with 16 pi^2 = 2e + Y^2/24 gives e >= 16 pi^2/3; at Ric = 3g, Vol <= 8 pi^2/9 = Vol(S^4)/3",
       sp.simplify(sol - sp.Rational(16, 3) * sp.pi**2) == 0 and sp.simplify(vmax - sp.Rational(8, 3) * sp.pi**2 / 3) == 0)

# (k) the recognition quantity P = 4 E_+ + 3 l^2 on the product classes q + g_{S^2}
okk = True
for Kv in np.linspace(-0.99, 4.0, 40):
    R = 2 * Kv + 2                                             # R > 0
    ev = np.array([R / 6, -R / 12, -R / 12])
    L = ev.max()
    okk = okk and abs(3 * L**2 - 2 * np.sum(ev**2)) < 1e-12    # 3 L^2 = 2 |W^+|^2, so the integrand of P is 6 |W^+|^2
for Kv in np.linspace(-4.0, -1.01, 20):
    R = 2 * Kv + 2                                             # R < 0: the largest eigenvalue is -R/12
    ev = np.array([R / 6, -R / 12, -R / 12])
    okk = okk and abs(3 * ev.max()**2 - 0.5 * np.sum(ev**2)) < 1e-12
report("(k) on q + g_{S^2}: 3 L^2 = 2 |W^+-|^2 where K > -1 (so P = 6e when K >= -1), and 3 L^2 = |W^+-|^2/2 where K < -1",
       okk, "P < 8T then reads e < 16 pi^2/3 = u; in general 3 L^2 <= 2 max|W^+-|^2 gives P <= 8e")

print(f"# check_04: {NOK} ok, {NFAIL} FAIL")
