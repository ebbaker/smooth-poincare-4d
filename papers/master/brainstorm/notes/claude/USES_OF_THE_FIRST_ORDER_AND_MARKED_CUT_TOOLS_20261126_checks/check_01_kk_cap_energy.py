#!/usr/bin/env python3
"""check_01: curvature of the circle-symmetric (Kaluza-Klein) cap metric

    g = ds^2 + a(s)^2 dpsi^2 + dtheta^2 + sin^2(theta) (dphi + b(s) dpsi)^2 ,   K = -a''/a,  F = b'/a.

Symbolic claims (general a, b):
  (i)   R = 2(K+1) - (1/2) F^2 sin^2(theta);
  (ii)  (1/2) int_0^pi |W|^2_{four-index} a sin(theta) dtheta
            = a [ (4/3)(1+K)^2 + (4/9)(5-4K) F^2 + (32/45) F^4 + (2/3) F'^2 ]
            = a [ (4/3)(K+1-(2/3)F^2)^2 + 4 F^2 + (16/135) F^4 + (2/3) F'^2 ] .
        Since |W|^2_HS = |W|^2_{four-index}/4 and int dpsi dphi = 4 pi^2, the left side integrated over s is
        (1/pi^2) (1/2) int |W|^2_HS dV, the cost used in the note (the band wall 2T is 8).
Numerical validation on closed S^2-bundles over S^2 (a = sin s, b = (n/4)(1 - cos s)^2, n = 1, 2), where F' != 0:
  (iii) Gauss-Bonnet:  int ( |W|^2 - 2|Ric|^2 + (2/3) R^2 ) dV = 32 pi^2 chi = 128 pi^2;
  (iv)  the closed formula (ii) against direct quadrature of |W|^2.
"""
import math, sys, time
import numpy as np
import sympy as sp

t0 = time.time()
ok = fail = 0
def check(name, cond, detail=""):
    global ok, fail
    if cond: ok += 1
    else: fail += 1
    print(f"{'ok  ' if cond else 'FAIL'}  {name}" + (f"   [{detail}]" if detail else ""), flush=True)

s, psi, th, ph = sp.symbols('s psi theta phi', real=True)
a = sp.Function('a')(s); b = sp.Function('b')(s)
X = [s, psi, th, ph]; n = 4
g = sp.Matrix([[1, 0, 0, 0],
               [0, a**2 + b**2 * sp.sin(th)**2, 0, b * sp.sin(th)**2],
               [0, 0, 1, 0],
               [0, b * sp.sin(th)**2, 0, sp.sin(th)**2]])
ginv = sp.simplify(g.inv())
Gam = [[[sp.simplify(sum(ginv[i, l] * (sp.diff(g[l, j], X[k]) + sp.diff(g[l, k], X[j]) - sp.diff(g[j, k], X[l])) for l in range(n)) / 2)
         for k in range(n)] for j in range(n)] for i in range(n)]
def riem_up(i, j, k, l):
    val = sp.diff(Gam[i][j][l], X[k]) - sp.diff(Gam[i][j][k], X[l])
    return val + sum(Gam[i][k][m] * Gam[m][j][l] - Gam[i][l][m] * Gam[m][j][k] for m in range(n))
Rup = [[[[sp.simplify(riem_up(i, j, k, l)) for l in range(n)] for k in range(n)] for j in range(n)] for i in range(n)]
Rdn = [[[[sp.simplify(sum(g[i, m] * Rup[m][j][k][l] for m in range(n))) for l in range(n)] for k in range(n)] for j in range(n)] for i in range(n)]
Ric = sp.Matrix(n, n, lambda j, l: sp.simplify(sum(Rup[i][j][i][l] for i in range(n))))
Rs = sp.simplify(sum(ginv[j, l] * Ric[j, l] for j in range(n) for l in range(n)))
K = -sp.diff(a, s, 2) / a; F = sp.diff(b, s) / a; Fp = sp.diff(F, s)
check("(i) scalar curvature R = 2(K+1) - F^2 sin^2(theta)/2", sp.simplify(Rs - (2 * (K + 1) - F**2 * sp.sin(th)**2 / 2)) == 0)

def weyl(i, j, k, l):
    return (Rdn[i][j][k][l]
            - (g[i, k] * Ric[j, l] - g[i, l] * Ric[j, k] - g[j, k] * Ric[i, l] + g[j, l] * Ric[i, k]) / 2
            + Rs * (g[i, k] * g[j, l] - g[i, l] * g[j, k]) / 6)
W = [[[[sp.simplify(weyl(i, j, k, l)) for l in range(n)] for k in range(n)] for j in range(n)] for i in range(n)]
def up(Td):
    return [[[[sum(ginv[i, p] * ginv[j, q] * ginv[k, r] * ginv[l, t] * Td[p][q][r][t]
                   for p in range(n) for q in range(n) for r in range(n) for t in range(n) if Td[p][q][r][t] != 0)
               for l in range(n)] for k in range(n)] for j in range(n)] for i in range(n)]
Wu = up(W)
W2 = sp.simplify(sum(W[i][j][k][l] * Wu[i][j][k][l] for i in range(n) for j in range(n) for k in range(n) for l in range(n)))
Ric2 = sp.simplify(sum(Ric[i, j] * ginv[i, p] * ginv[j, q] * Ric[p, q] for i in range(n) for j in range(n) for p in range(n) for q in range(n)))
I = sp.integrate(sp.expand(W2 * a * sp.sin(th)), (th, 0, sp.pi))
form1 = a * (sp.Rational(4, 3) * (1 + K)**2 + sp.Rational(4, 9) * (5 - 4 * K) * F**2 + sp.Rational(32, 45) * F**4 + sp.Rational(2, 3) * Fp**2)
form2 = a * (sp.Rational(4, 3) * (K + 1 - sp.Rational(2, 3) * F**2)**2 + 4 * F**2 + sp.Rational(16, 135) * F**4 + sp.Rational(2, 3) * Fp**2)
check("(ii) theta-integrated Weyl density equals the first closed form", sp.simplify(I / 2 - form1) == 0)
check("(ii) the two closed forms agree", sp.simplify(form1 - form2) == 0)
print(f"      symbolic part done in {time.time() - t0:.0f} s", flush=True)

gx, gw = np.polynomial.legendre.leggauss(80)
def integrate2(fn):                          # over (s, theta) in [0,pi]^2
    xs = 0.5 * math.pi * (gx + 1); ws = 0.5 * math.pi * gw
    S_, T_ = np.meshgrid(xs, xs, indexing='ij')
    return float(np.sum(np.outer(ws, ws) * fn(S_, T_)))
for nb in (1, 2):
    sub = {a: sp.sin(s), b: sp.Rational(nb, 4) * (1 - sp.cos(s))**2}
    def lam(expr):
        return sp.lambdify((s, th), sp.simplify(expr.subs(sub).doit()), 'numpy')
    vol = lam(a * sp.sin(th) + 0 * s)
    w2, r2, rs = lam(W2), lam(Ric2), lam(Rs)
    gb = 4 * math.pi**2 * integrate2(lambda S_, T_: (w2(S_, T_) - 2 * r2(S_, T_) + (2 / 3) * rs(S_, T_)**2) * np.sin(S_) * np.sin(T_))
    check(f"(iii) Gauss-Bonnet on the closed bundle with b(pi) = {nb}: 32 pi^2 chi = 128 pi^2", abs(gb / (128 * math.pi**2) - 1) < 1e-8, f"ratio {gb / (128 * math.pi**2):.10f}")
    direct = 0.5 * integrate2(lambda S_, T_: w2(S_, T_) * np.sin(S_) * np.sin(T_))
    f1 = sp.lambdify(s, sp.simplify(form2.subs(sub).doit()), 'numpy')
    xs = 0.5 * math.pi * (gx + 1); closed = float(np.sum(0.5 * math.pi * gw * f1(xs)))
    check(f"(iv) closed formula against direct quadrature, b(pi) = {nb}", abs(direct - closed) < 1e-8 * max(1, abs(closed)), f"cost/pi^2 = {closed:.8f}")
print(f"\ncheck_01: {ok} ok, {fail} FAIL   ({time.time() - t0:.0f} s)")
sys.exit(1 if fail else 0)
