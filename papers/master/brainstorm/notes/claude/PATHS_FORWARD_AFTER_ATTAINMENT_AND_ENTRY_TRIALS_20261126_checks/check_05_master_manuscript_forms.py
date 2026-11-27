#!/usr/bin/env python3
"""
check_05: the formulas of the note as they are printed in the additions to the
master manuscript (papers/master/manuscript/claude/*.tex, 26 November 2026).

Written from the definitions only.  No repository script was read or reused.

Notation.  T = 4 pi^2.  E_+- are Hilbert-Schmidt chiral Weyl energies, e_V is
half of E_+ + E_- on a domain V, Z is the trace-free Ricci tensor, Y a Yamabe
constant, Y_rd = 8 sqrt6 pi.

Claims tested
  (a) equation (2.4): with cosh r = sec beta,
        dt^2 + dbeta^2 + cos^2(beta) g_S2 = cos^2(beta) (dr^2 + cosh^2 r dt^2 + g_S2),
      and <y, nu> = cos(beta) <omega, nu> for y = sin(beta) E + cos(beta) omega;
  (b) totally geodesic boundary: e_V = T chi(V) + (1/4) int |Z|^2 - (1/48) int R^2
      on (hemisphere of S^2) x S^2 and on S^1 x (hemisphere of S^3);
  (c) Proposition 2.2: 16 pi^2 chi(V) = 4 e_V + Y^2/24 - D/2 gives
      e_V = T chi(V) - Y^2/96 + D/8; Gursky's bounds with E_+ = 2 e_V, tau = 0,
      chi = 2 chi(V) give e_V >= T chi(V) and e_V >= (2T/3) chi(V);
  (d) Corollary 2.3 with chi(V) = 2: 2T - Y^2/96, 4T/3, 2T, and the threshold
      Y^2 >= 96 (2T - e);
  (e) Kobayashi's value: the product of two unit spheres has E_+ + E_- = 16T/3;
      4T is three quarters of it; (4/3) n T > 2T for n >= 2;
  (f) budgets: Y^2 >= 48 (2T - e) on M and Y_D^2 >= 96 (2T - e) on the double;
  (g) entry: |Z|^2 < R^2/12 forces R - 2 Ric(nu, nu) > 0;
  (h) equation (2.5) and the cap: |W|^2 = (K+1)^2/6 from the eigenvalues,
      C^1 matching of a unit round cap at r_0 iff cosh 2 r_0 = (2 pi/l)^2,
      its cost (4T/3)(1 + (l/2pi) sinh r_0), the value at the negative root,
      the collar area, and the pair-of-pants comparison;
  (i) Einstein: e = 2T - Y^2/48 and e > 4T/3 read Y^2 < Y_rd^2/3;
  (j) first variation of int (K+1)^2 dA: in a conformal direction, pointwise
      up to an explicit divergence; and for a general symmetric direction on a
      torus, by quadrature;
  (k) K -> -1 at the fixed circle for invariant metrics
        A(rho^2) dtheta^2 + C(rho^2) (drho^2 + rho^2 g_S2);
  (l) the Schwarzschild profile: equation (7.2) in rotational form, the change
      of variable r = 1 + cosh s, tau = 4 phi, and E_+- = 8 pi^2.
"""
import math
import random

import numpy as np
import sympy as sp
from scipy.integrate import quad

PI = math.pi
T = 4 * PI**2
NOK = 0
NFAIL = 0


def report(name, ok, detail=""):
    global NOK, NFAIL
    if ok:
        NOK += 1
    else:
        NFAIL += 1
    print(("[ok]   " if ok else "[FAIL] ") + name + ((" | " + detail) if detail else ""))


random.seed(5)
np.random.seed(5)

# ---------------------------------------------------------------- (a)
beta = sp.symbols("beta", real=True)
r_of_beta = sp.acosh(1 / sp.cos(beta))
ok = True
for b in (0.1, 0.4, 0.9, 1.3, 1.5):
    drdb = float(sp.diff(r_of_beta, beta).subs(beta, b))
    rr = float(r_of_beta.subs(beta, b))
    # coefficients of dbeta^2 and dt^2 on the right side
    ok &= abs(math.cos(b)**2 * drdb**2 - 1) < 1e-9
    ok &= abs(math.cos(b)**2 * math.cosh(rr)**2 - 1) < 1e-9
report("(a) (2.4): cos^2(beta) (dr/dbeta)^2 = 1 and cos^2(beta) cosh^2 r = 1 when cosh r = sec beta", ok)

ok = True
for _ in range(200):
    b = random.uniform(-1.5, 1.5)
    om = np.random.normal(size=3)
    om /= np.linalg.norm(om)
    nu = np.random.normal(size=3)
    y = np.concatenate(([math.sin(b)], math.cos(b) * om))
    ok &= abs(y @ np.concatenate(([0.0], nu)) - math.cos(b) * (om @ nu)) < 1e-12
    ok &= abs(np.linalg.norm(y) - 1) < 1e-12
report("(a) y = sin(beta) E + cos(beta) omega is a unit vector and <y, nu> = cos(beta) <omega, nu> for nu in R^3", ok)


# ---------------------------------------------------------------- (b)
def e_formula(chi, intZ2, intR2):
    return T * chi + intZ2 / 4 - intR2 / 48


# hemisphere(S^2) x S^2, unit radii: Einstein with R = 4, vol = 2 pi * 4 pi,
# |W^+-|^2 = (K+1)^2/6 = 2/3, so e_V = (2/3) vol = 16 pi^2/3
vol = 2 * PI * 4 * PI
ok1 = abs(e_formula(2, 0.0, 16 * vol) - (2.0 / 3) * vol) < 1e-10 and abs((2.0 / 3) * vol - 4 * T / 3) < 1e-10
# S^1(l) x hemisphere(S^3): Ric = diag(0,2,2,2), R = 6, |Z|^2 = 9/4 + 3/4 = 3, W = 0
ok2 = True
for ell in (0.3, 1.0, 7.0):
    v = ell * PI**2
    ok2 &= abs(e_formula(0, 3 * v, 36 * v)) < 1e-9
report("(b) e_V = T chi + (1/4) int|Z|^2 - (1/48) int R^2 on hemisphere x S^2 (gives 4T/3) and on S^1 x hemisphere of S^3 (gives 0)",
       ok1 and ok2)

# ---------------------------------------------------------------- (c)
eV, chiV, Ysym, Dsym, pi = sp.symbols("e_V chi_V Y D pi", real=True)
Tsym = 4 * pi**2
sol = sp.solve(sp.Eq(16 * pi**2 * chiV, 4 * eV + Ysym**2 / 24 - Dsym / 2), eV)[0]
report("(c) 16 pi^2 chi(V) = 4 e_V + Y^2/24 - D/2 gives e_V = T chi(V) - Y^2/96 + D/8",
       sp.simplify(sol - (Tsym * chiV - Ysym**2 / 96 + Dsym / 8)) == 0)
# Gursky on the double: E_+ = 2 e_V, tau = 0, chi = 2 chi(V)
b1 = sp.Rational(1, 2) * (2 * pi**2 * (2 * (2 * chiV)))          # e_V >= this
b2 = sp.Rational(1, 2) * (sp.Rational(4, 3) * pi**2 * (2 * (2 * chiV)))
report("(c) Gursky with E_+ = 2 e_V, tau = 0, chi = 2 chi(V): e_V >= T chi(V) if b_1 > 0, e_V >= (2T/3) chi(V) if b_2^+ > 0",
       sp.simplify(b1 - Tsym * chiV) == 0 and sp.simplify(b2 - sp.Rational(2, 3) * Tsym * chiV) == 0)

# ---------------------------------------------------------------- (d)
ok = abs((2.0 / 3) * T * 2 - 4 * T / 3) < 1e-12 and abs(T * 2 - 2 * T) < 1e-12
for e in (0.5 * T, 1.2 * T, 1.9 * T):
    ythr = math.sqrt(96 * (2 * T - e))
    ok &= abs((2 * T - ythr**2 / 96) - e) < 1e-9
report("(d) chi(V) = 2: the three bounds are 2T - Y^2/96, 4T/3 and 2T; e < 2T with two pieces needs Y_D <= -sqrt(96 (2T - e))", ok)

# ---------------------------------------------------------------- (e)
Epm_unit_product = (2 * PI / 3) * (1 + 1)**2 * 4 * PI            # (2 pi/3) int (K+1)^2 dA over the unit sphere
ok = abs(2 * Epm_unit_product - 16 * T / 3) < 1e-9 and abs(4 * T / (16 * T / 3) - 0.75) < 1e-12
ok &= all((4.0 / 3) * n * T > 2 * T for n in range(2, 12))
report("(e) unit S^2 x S^2: E_+ + E_- = 16T/3 = 64 pi^2/3; 4T is 3/4 of it; (4/3) n T > 2T for n >= 2", ok,
       "E_+- = %.6f = (8/3) T" % Epm_unit_product)

# ---------------------------------------------------------------- (f)
ok = True
for e in np.linspace(0.1 * T, 1.99 * T, 25):
    # M: 16 pi^2 = 2e + Y^2/24 - D/2 with D >= 0
    for Dval in (0.0, 1.0, 10.0):
        Y2 = 24 * (16 * PI**2 - 2 * e + Dval / 2)
        ok &= Y2 >= 48 * (2 * T - e) - 1e-9
    # double with chi(V) = 2: e = 2T - Y_D^2/96 + D/8
    for Dval in (0.0, 1.0, 10.0):
        YD2 = 96 * (2 * T - e + Dval / 8)
        ok &= YD2 >= 96 * (2 * T - e) - 1e-9
report("(f) Y^2 >= 48 (2T - e) on M and Y_D^2 >= 96 (2T - e) on the double, from the two Gauss-Bonnet identities", ok)

# ---------------------------------------------------------------- (g)
ok = True
worst = 1e9
for _ in range(4000):
    A = np.random.normal(size=(4, 4))
    Zm = (A + A.T) / 2
    Zm -= np.trace(Zm) / 4 * np.eye(4)
    Rsc = math.sqrt(12 * np.sum(Zm * Zm)) * random.uniform(1.0001, 3.0)   # |Z|^2 < R^2/12
    lam_max = np.linalg.eigvalsh(Zm)[-1]
    margin = Rsc - 2 * (lam_max + Rsc / 4)
    worst = min(worst, margin / Rsc)
    ok &= margin > 0
Zext = np.diag([3.0, -1.0, -1.0, -1.0])
ok_ext = abs(Zext.max() - math.sqrt(0.75) * math.sqrt(np.sum(Zext * Zext))) < 1e-12
report("(g) |Z|^2 < R^2/12 gives R - 2 Ric(nu,nu) > 0 on 4000 random Z; lambda_max = sqrt(3/4)|Z| at diag(3,-1,-1,-1)",
       ok and ok_ext, "least margin/R = %.4f" % worst)

# ---------------------------------------------------------------- (h)
Ksym = sp.symbols("K", real=True)
eigs = [(Ksym + 1) * sp.Rational(1, 3), -(Ksym + 1) * sp.Rational(1, 6), -(Ksym + 1) * sp.Rational(1, 6)]
report("(h) (2.5): eigenvalues (K+1)(1/3,-1/6,-1/6) are trace-free with squared norm (K+1)^2/6; 4 pi/6 = 2 pi/3",
       sp.simplify(sum(eigs)) == 0 and sp.simplify(sum(x**2 for x in eigs) - (Ksym + 1)**2 / 6) == 0)

ok = True
det = []
for ell in (0.5, 1.0, 2.0, PI, 5.0, 6.2):
    rstar = 0.5 * math.acosh((2 * PI / ell)**2)
    for r0 in (rstar, -rstar):
        # unit cap of polar angle theta: boundary length 2 pi sin(theta); the length grows at rate
        # 2 pi cos(theta) per unit distance towards the boundary.  Seam: length l cosh r0, and the
        # length changes at rate -l sinh r0 per unit distance into the kept cylinder (r decreasing).
        cos_t = -(ell / (2 * PI)) * math.sinh(r0)
        sin_t = (ell / (2 * PI)) * math.cosh(r0)
        ok &= abs(sin_t**2 + cos_t**2 - 1) < 1e-10
        cost = (2 * PI / 3) * 4 * 2 * PI * (1 - cos_t)                 # (2 pi/3) (K+1)^2 area, K = 1
        ok &= abs(cost - (4 * T / 3) * (1 + (ell / (2 * PI)) * math.sinh(r0))) < 1e-9
        # Gauss-Bonnet: int_cap K = 2 pi + l sinh r0
        ok &= abs(2 * PI * (1 - cos_t) - (2 * PI + ell * math.sinh(r0))) < 1e-9
    neg = (4 * T / 3) * (1 - math.sqrt((1 - ell**2 / (4 * PI**2)) / 2))
    ok &= abs(neg - (4 * T / 3) * (1 + (ell / (2 * PI)) * math.sinh(-rstar))) < 1e-9
    det.append("l=%.2f: %.3f T" % (ell, neg / T))
# a mismatched pair (l, r0) admits no unit cap
ok &= abs(((1.0 / (2 * PI)) * math.cosh(0.3))**2 + ((1.0 / (2 * PI)) * math.sinh(0.3))**2 - 1) > 0.5
report("(h) a unit round cap matches in C^1 at r_0 iff cosh 2r_0 = (2 pi/l)^2, at both roots; its cost is (4T/3)(1 + (l/2pi) sinh r_0); "
       "at the negative root (4T/3)(1 - sqrt((1 - l^2/4pi^2)/2))", ok, "; ".join(det))

ok = True
for ell in (0.5, 2.0, 5.0):
    for r0 in (-0.2, -1.0, -2.5):
        num = ell * quad(math.cosh, 0.0, abs(r0))[0]
        ok &= abs(num - ell * math.sinh(abs(r0))) < 1e-6
        f = -(ell / (2 * PI)) * math.sinh(r0)            # bound is (4T/3)(1 - f)
        ok &= abs(2 * PI * f - ell * math.sinh(abs(r0))) < 1e-12
report("(h) collar between r_0 < 0 and the waist has area l sinh|r_0| = 2 pi f, where the bound is (4T/3)(1 - f); a pair of pants has area 2 pi",
       ok and abs(-2 * PI * (2 - 3) - 2 * PI) < 1e-12)          # area -2 pi chi, chi = 2 - 3 for three boundary circles

# ---------------------------------------------------------------- (i)
Yrd = 8 * math.sqrt(6) * PI
ok = abs(Yrd**2 - 384 * PI**2) < 1e-9
for Y in np.linspace(0.01, Yrd, 400):
    e = 2 * T - Y**2 / 48
    ok &= (e > 4 * T / 3) == (Y**2 < Yrd**2 / 3)
ok &= abs((2 * T - (Yrd**2 / 3) / 48) - 4 * T / 3) < 1e-9 and abs(2 * T - Yrd**2 / 48) < 1e-9
report("(i) e = 2T - Y^2/48: e > 4T/3 iff Y^2 < Y_rd^2/3; e = 0 at Y = Y_rd = 8 sqrt6 pi", ok)

# ---------------------------------------------------------------- (j)
x, y, t = sp.symbols("x y t", real=True)
u = sp.Function("u")(x, y)
phi = sp.Function("phi")(x, y)


def lap0(f):
    return sp.diff(f, x, 2) + sp.diff(f, y, 2)


ut = u + t * phi                                   # q_t = e^{2 u_t}(dx^2 + dy^2), k = 2 phi q
Kt = -sp.exp(-2 * ut) * lap0(ut)
dens = sp.diff((Kt + 1)**2 * sp.exp(2 * ut), t).subs(t, 0)
K0 = -sp.exp(-2 * u) * lap0(u)
lapqK = sp.exp(-2 * u) * lap0(K0)
# <Hess K - (Lap K) q + (1/2)(1 - K^2) q, 2 phi q> dA_q = 2 phi (1 - K^2 - Lap_q K) e^{2u} dx dy
claimed = 2 * phi * (1 - K0**2 - lapqK) * sp.exp(2 * u)
vx = (K0 + 1) * sp.diff(phi, x) - phi * sp.diff(K0, x)
vy = (K0 + 1) * sp.diff(phi, y) - phi * sp.diff(K0, y)
resid = sp.simplify(sp.expand(dens - claimed + 2 * (sp.diff(vx, x) + sp.diff(vy, y))))
report("(j) d/dt (K+1)^2 dA along q_t = e^{2 t phi} q equals <Hess K - Lap K q + (1/2)(1-K^2) q, 2 phi q> dA minus the divergence of 2((K+1) grad phi - phi grad K)",
       resid == 0)

# full first variation, general symmetric direction, on a torus with q = e^{2u}(dx^2 + dy^2)
uT = sp.Rational(3, 10) * sp.cos(x) + sp.Rational(1, 5) * sp.sin(x + y) + sp.Rational(1, 10) * sp.cos(2 * y)
k11 = sp.Rational(1, 2) * sp.sin(y) + sp.Rational(3, 10) * sp.cos(x + 2 * y)
k12 = sp.Rational(2, 5) * sp.cos(x - y) + sp.Rational(1, 5) * sp.sin(2 * x)
k22 = -sp.Rational(3, 10) * sp.cos(x) + sp.Rational(1, 4) * sp.sin(x + y)
Ef = sp.exp(2 * uT) + t * k11
Ff = t * k12
Gf = sp.exp(2 * uT) + t * k22


def dd(f, *v):
    return sp.diff(f, *v)


# Brioschi formula for the Gauss curvature of E dx^2 + 2F dx dy + G dy^2
M1 = sp.Matrix([[-dd(Ef, y, 2) / 2 + dd(Ff, x, y) - dd(Gf, x, 2) / 2, dd(Ef, x) / 2, dd(Ff, x) - dd(Ef, y) / 2],
                [dd(Ff, y) - dd(Gf, x) / 2, Ef, Ff],
                [dd(Gf, y) / 2, Ff, Gf]])
M2 = sp.Matrix([[0, dd(Ef, y) / 2, dd(Gf, x) / 2],
                [dd(Ef, y) / 2, Ef, Ff],
                [dd(Gf, x) / 2, Ff, Gf]])
detg = Ef * Gf - Ff**2
Kgen = (M1.det() - M2.det()) / detg**2
Lagr = (Kgen + 1)**2 * sp.sqrt(detg)
lhs_fun = sp.lambdify((x, y), sp.diff(Lagr, t).subs(t, 0), "numpy")
KT = -sp.exp(-2 * uT) * lap0(uT)
ux, uy = dd(uT, x), dd(uT, y)
Kx, Ky = dd(KT, x), dd(KT, y)
h11 = dd(KT, x, 2) - ux * Kx + uy * Ky
h22 = dd(KT, y, 2) - uy * Ky + ux * Kx
h12 = dd(KT, x, y) - uy * Kx - ux * Ky
lapK = sp.exp(-2 * uT) * lap0(KT)
qc = sp.exp(2 * uT)
b11 = h11 - lapK * qc + (1 - KT**2) / 2 * qc
b22 = h22 - lapK * qc + (1 - KT**2) / 2 * qc
b12 = h12
rhs_fun = sp.lambdify((x, y), sp.exp(-2 * uT) * (b11 * k11 + 2 * b12 * k12 + b22 * k22), "numpy")
ng = 96
grid = np.linspace(0, 2 * PI, ng, endpoint=False)
XX, YY = np.meshgrid(grid, grid, indexing="ij")
cell = (2 * PI / ng)**2
lhs_val = float(np.sum(lhs_fun(XX, YY)) * cell)
rhs_val = float(np.sum(rhs_fun(XX, YY)) * cell)
kflat = float(np.sum(sp.lambdify((x, y), KT * sp.exp(2 * uT), "numpy")(XX, YY)) * cell)      # Gauss-Bonnet on the torus
report("(j) d/dt int (K+1)^2 dA = int <Hess K - Lap K q + (1/2)(1-K^2) q, k> dA for a general symmetric k on a torus (Brioschi curvature, periodic quadrature)",
       abs(lhs_val - rhs_val) < 1e-9 * max(1.0, abs(rhs_val)) and abs(kflat) < 1e-10 and abs(rhs_val) > 1e-2,
       "both sides %.12f, %.12f" % (lhs_val, rhs_val))

# ---------------------------------------------------------------- (k)
rho = sp.symbols("rho", positive=True)


def K_of(alpha, gamma):
    """Gauss curvature of alpha(rho)^2 dtheta^2 + gamma(rho)^2 drho^2."""
    return sp.simplify(-(1 / (alpha * gamma)) * sp.diff(sp.diff(alpha, rho) / gamma, rho))


# q = (A dtheta^2 + (c_1 + c_2 rho^2) drho^2)/(c_1 rho^2) with A, c_1, c_2 functions of rho^2;
# each sample lists alpha = sqrt(A/c_1)/rho and gamma = sqrt((c_1 + c_2 rho^2)/c_1)/rho
samples = [
    ("A = c_1 = 1, c_2 = 0", 1 / rho, 1 / rho),
    ("A = (1+rho^2)^2, c_1 = (1+3rho^2)^2, c_2 = 0", (1 + rho**2) / ((1 + 3 * rho**2) * rho), 1 / rho),
    ("A = (2-rho^2+rho^4)^2, c_1 = (1/2+rho^2)^2, c_2 = 0",
     (2 - rho**2 + rho**4) / ((sp.Rational(1, 2) + rho**2) * rho), 1 / rho),
    ("A = (1+rho^2)^2, c_1 = 1, c_2 = 2+rho^2", (1 + rho**2) / rho, (1 + rho**2) / rho),
]
ok = True
det = []
for name, al, ga in samples:
    lim = sp.limit(K_of(al, ga), rho, 0, "+")
    det.append(str(lim))
    ok &= sp.simplify(lim + 1) == 0
# the round S^4 in R^3 + R^2: cos^2(psi) dtheta^2 + dpsi^2 + sin^2(psi) g_S2, so q = (cos^2 dtheta^2 + dpsi^2)/sin^2
Kround = K_of(sp.cos(rho) / sp.sin(rho), 1 / sp.sin(rho))
report("(k) K -> -1 at rho = 0 for q = (A dtheta^2 + (c_1 + c_2 rho^2) drho^2)/(c_1 rho^2) on four samples; K = -1 identically for the round sphere",
       ok and sp.simplify(Kround + 1) == 0, "limits " + ", ".join(det))

# ---------------------------------------------------------------- (l)
s = sp.symbols("s", positive=True)
a = 2 * sp.sech(s / 2)**2 * sp.tanh(s / 2)
Kp = -1 + 3 * sp.sech(s / 2)**2


def is_zero(expr):
    return all(abs(sp.N(expr.subs(s, sp.Rational(p, 7)), 40)) < sp.Float(10)**(-30) for p in (1, 3, 8, 20, 45))


ok_curv = is_zero(sp.diff(a, s, 2) + Kp * a)
ok_ss = is_zero(sp.diff(Kp, s, 2) - (1 - Kp**2) / 2)
ok_pp = is_zero(sp.diff(a, s) * sp.diff(Kp, s) - (1 - Kp**2) / 2 * a)
report("(l) a = 2 sech^2(s/2) tanh(s/2), K = -1 + 3 sech^2(s/2): K = -a''/a, K'' = (1-K^2)/2 and (a'/a) K' = (1-K^2)/2, the two components of (7.2)",
       ok_curv and ok_ss and ok_pp)

rS = 1 + sp.cosh(s)
# r^2 (ds^2 + a^2 dphi^2 + g_S2) against (1-2/r) dtau^2 + dr^2/(1-2/r) + r^2 g_S2 with tau = 4 phi
ok_r = is_zero(rS**2 - sp.diff(rS, s)**2 / (1 - 2 / rS))
ok_t = is_zero(rS**2 * a**2 - 16 * (1 - 2 / rS))
report("(l) with r = 1 + cosh s and tau = 4 phi: r^2 ds^2 = dr^2/(1 - 2/r) and r^2 a^2 dphi^2 = (1 - 2/r) dtau^2", ok_r and ok_t)

integral = sp.integrate(9 * sp.sech(s / 2)**4 * a, (s, 0, sp.oo))
val = float(sp.N(integral))
num = float(sp.Integral((Kp + 1)**2 * a, (s, 0, 60)).evalf(20))
report("(l) int_0^infty (K+1)^2 a ds = 6, so E_+- = (4 pi^2/3) * 6 = 8 pi^2 = 2T",
       abs(val - 6) < 1e-9 and abs(num - 6) < 1e-9 and abs((4 * PI**2 / 3) * 6 - 2 * T) < 1e-9, "closed form %s" % sp.nsimplify(integral))

a_inf = float(sp.N(a.subs(s, 40) * sp.exp(40)))
report("(l) the end is a cusp: a ~ 8 e^{-s} and K -> -1", abs(a_inf - 8) < 1e-9 and abs(float(sp.N(Kp.subs(s, 60))) + 1) < 1e-12)

print("# check_05: %d ok, %d FAIL" % (NOK, NFAIL))
raise SystemExit(1 if NFAIL else 0)
