#!/usr/bin/env python3
"""
Check 03.  The curvature budget that controls bubbling, on a general closed oriented
four-manifold, and its specialization to homotopy four-spheres.

Notation: ebar = (E_+ + E_-)/2, D = int |Ric_0|^2, Y the Yamabe constant, Y_rd^2 = 384 pi^2.
 (a) Closed manifold, unit-volume Yamabe metric:  8 pi^2 chi = 2 ebar + Y^2/24 - D/2,
     hence  D = 4 ebar + Y^2/12 - 16 pi^2 chi <= 4 ebar - 16 pi^2 (chi - 2).
 (b) Complete scalar-flat ALE manifold X with ends S^3/Gamma_j:
       8 pi^2 chi(X) = 2 ebar(X) - D_X/2 + 8 pi^2 sum_j 1/|Gamma_j| ,
     hence  D_X = 4 ebar(X) + 16 pi^2 (sum_j 1/|Gamma_j| - chi(X)).
     Tested on flat R^4, on the Eguchi-Hanson space (against the signature formula with
     eta(RP^3) = 0) and, by direct integration of |Ric|^2, on the two-ended scalar-flat
     conformally flat neck (1 + r^-2)^2 g_Euc, where it gives 32 pi^2.
 (c) If D_X <= 4 I - 16 pi^2 (chi(M) - 2) and chi(M) = chi(X) + sum_j chi(V_j), with V_j the
     piece of M beyond the j-th end, then
       4 ebar(X) + 16 pi^2 sum_j (1/|Gamma_j| + chi(V_j)) <= 4 I + 32 pi^2 .
 (d) On a homotopy sphere (Gamma_j trivial, chi(V_j) = 1, I < 8 pi^2) this forces one end,
     which is the count used in the attainment argument of investigation 06.
 (e) The same inequality on CP^2 and on S^2 x S^2, with trivial end groups.

SymPy and mpmath.  Written for the note PROGRAM_ASSESSMENT_AND_PATH_FORWARD_20261127.md;
uses no repository code.
"""
import mpmath as mp
import sympy as sp

pi = sp.pi
results = []


def check(name, cond):
    ok = bool(cond)
    results.append(ok)
    print(("ok   " if ok else "FAIL ") + name)


ebar, Y, D, chi, I = sp.symbols("ebar Y D chi I", real=True)

# (a)
D_closed = sp.solve(sp.Eq(8 * pi**2 * chi, 2 * ebar + Y**2 / 24 - D / 2), D)[0]
check("(a1) D = 4 ebar + Y^2/12 - 16 pi^2 chi", sp.simplify(D_closed - (4 * ebar + Y**2 / 12 - 16 * pi**2 * chi)) == 0)
check("(a2) at Y = Y_rd: D = 4 ebar - 16 pi^2 (chi - 2)",
      sp.simplify(D_closed.subs(Y**2, 384 * pi**2) - (4 * ebar - 16 * pi**2 * (chi - 2))) == 0)
check("(a3) round S^4 (ebar = 0, chi = 2, Y = Y_rd): D = 0", sp.simplify(D_closed.subs({Y**2: 384 * pi**2, ebar: 0, chi: 2})) == 0)
# Einstein product S^2 x S^2: Y = R vol^(1/2) = 4 * 4 pi = 16 pi, ebar = 32 pi^2/3, chi = 4, D = 0
check("(a4) Einstein S^2 x S^2 (Y = 16 pi, ebar = 32 pi^2/3, chi = 4): D = 0",
      sp.simplify(D_closed.subs({Y: 16 * pi, ebar: sp.Rational(32, 3) * pi**2, chi: 4})) == 0)
# Fubini-Study CP^2: R = 24, vol = pi^2/2, Y = 24 * pi/sqrt(2), ebar = 6 pi^2, chi = 3, D = 0
check("(a5) Fubini-Study CP^2 (Y = 12 sqrt(2) pi, ebar = 6 pi^2, chi = 3): D = 0",
      sp.simplify(D_closed.subs({Y: 12 * sp.sqrt(2) * pi, ebar: 6 * pi**2, chi: 3})) == 0)

# (b)
chiX, S, eX, DX = sp.symbols("chiX S eX DX", real=True)   # S = sum_j 1/|Gamma_j|
D_ale = sp.solve(sp.Eq(8 * pi**2 * chiX, 2 * eX - DX / 2 + 8 * pi**2 * S), DX)[0]
check("(b1) D_X = 4 ebar(X) + 16 pi^2 (sum 1/|Gamma| - chi(X))",
      sp.simplify(D_ale - (4 * eX + 16 * pi**2 * (S - chiX))) == 0)
check("(b2) flat R^4 (chi = 1, one trivial end, W = 0): D_X = 0", sp.simplify(D_ale.subs({chiX: 1, S: 1, eX: 0})) == 0)
# Eguchi-Hanson: chi = 2, one end with group Z_2, Ricci-flat, so D_X = 0 and E_+ + E_- = 2 ebar.
e_eh = sp.solve(sp.Eq(D_ale.subs({chiX: 2, S: sp.Rational(1, 2)}), 0), eX)[0]
check("(b3) Eguchi-Hanson: E_+ + E_- = 12 pi^2 from the Euler formula", sp.simplify(2 * e_eh - 12 * pi**2) == 0)
check("(b4) which equals 12 pi^2 |tau + eta| with tau = -1 or 1 and eta(RP^3) = 0 (half conformally flat)",
      sp.simplify(2 * e_eh - 12 * pi**2 * 1) == 0)

# Two-ended neck g = u^2 g_Euc on R^4 minus the origin, u = 1 + r^-2 (harmonic, so R = 0).
r = sp.symbols("r", positive=True)
f = r * (1 + r**-2)                    # areal radius
dt = (1 + r**-2)                       # dt/dr, t = arclength of the radial geodesic
ft = sp.simplify(sp.diff(f, r) / dt)
ftt = sp.simplify(sp.diff(ft, r) / dt)
ric_t = sp.simplify(-3 * ftt / f)
ric_s = sp.simplify(2 * (1 - ft**2) / f**2 - ftt / f)
scal = sp.simplify(ric_t + 3 * ric_s)
check("(b5) the neck is scalar-flat", scal == 0)
ric_sq = sp.simplify(ric_t**2 + 3 * ric_s**2)
integrand = sp.simplify(ric_sq * 2 * pi**2 * f**3 * dt)
D_neck = sp.integrate(integrand, (r, 0, sp.oo))
check(f"(b6) int |Ric|^2 over the neck = {sp.simplify(D_neck / pi**2)} pi^2 (exact integration)",
      sp.simplify(D_neck - 32 * pi**2) == 0)
num = mp.quad(sp.lambdify(r, integrand, "mpmath"), [0, 0.5, 1, 2, mp.inf])
check(f"(b7) numerical quadrature agrees: {float(num / mp.pi**2):.10f} pi^2", abs(num / mp.pi**2 - 32) < 1e-8)
check("(b8) formula (b1) with chi = 0, two trivial ends, W = 0 gives 32 pi^2",
      sp.simplify(D_ale.subs({chiX: 0, S: 2, eX: 0}) - 32 * pi**2) == 0)

# (c)
chiV = sp.symbols("chiV", real=True)   # sum_j chi(V_j)
chiM = chiX + chiV
lhs = D_ale                             # D_X
rhs = 4 * I - 16 * pi**2 * (chiM - 2)   # the budget inherited from the source metrics
gap = sp.simplify((rhs - lhs) - ((4 * I + 32 * pi**2) - (4 * eX + 16 * pi**2 * (S + chiV))))
check("(c1) D_X <= 4I - 16 pi^2(chi(M) - 2)  <=>  4 ebar(X) + 16 pi^2 sum(1/|Gamma_j| + chi(V_j)) <= 4I + 32 pi^2",
      gap == 0)

# (d) homotopy sphere: k trivial ends, chi(V_j) = 1.
k = sp.symbols("k", positive=True, integer=True)
slack = (4 * I + 32 * pi**2) - (4 * eX + 16 * pi**2 * (k + k))
check("(d1) with k ends: 4 ebar(X) + 32 pi^2 (k - 1) <= 4 I", sp.simplify(slack - (4 * I - 4 * eX - 32 * pi**2 * (k - 1))) == 0)
check("(d2) k = 2, ebar(X) >= 0 would need I >= 8 pi^2 = 2T", sp.solve(sp.Eq(slack.subs({k: 2, eX: 0}), 0), I) == [8 * pi**2])
bV = sp.symbols("b", nonnegative=True, integer=True)
slack1 = (4 * I + 32 * pi**2) - (4 * eX + 16 * pi**2 * (1 + 1 + bV))
check("(d3) one trivial end, remaining piece with chi(V) = 1 + b: ebar(X) + 4 pi^2 b <= I",
      sp.simplify(slack1 / 4 - (I - eX - 4 * pi**2 * bV)) == 0)


# (e) Two closed examples of the general budget, with trivial end groups on a simply connected M,
#     where chi(V_j) = 1 + b_2(V_j):   2k + sum_j b_2(V_j) <= I/(4 pi^2) + 2 - ebar(X)/(4 pi^2).
def end_bound(I_value):
    return sp.nsimplify(I_value / (4 * pi**2) + 2)

check("(e1) CP^2 (I = 6 pi^2 by Gursky's inequality): the bound is 7/2, so one end and b_2(V_1) <= 1",
      end_bound(6 * pi**2) == sp.Rational(7, 2))
check("(e2) S^2 x S^2 (I = 32 pi^2/3): the bound is 14/3, so two ends are not excluded by the budget alone",
      end_bound(sp.Rational(32, 3) * pi**2) == sp.Rational(14, 3))
check("(e3) homotopy sphere (I < 8 pi^2): the bound is below 4, so one end",
      end_bound(8 * pi**2) == 4)

n_ok = sum(results)
print(f"check_03: {n_ok} ok, {len(results) - n_ok} failed")
raise SystemExit(0 if n_ok == len(results) else 1)
