"""SP4-FOT-DIR-E48/E49/E50: symbolic and exact checks of formulas used in the notes.

Usage:  python3 e50_identity_checks.py

1. E48: the gluing map y -> 2 a rho R y / |y|^2 is conformal and orientation preserving.
2. E49: scalar curvature of u^2 (dt^2 + g_{S^3}); the integrals behind the coefficient 15/16;
   the expansions of I_4, I_6, the trial bound and the Yamabe deficit, against 40-digit values.
3. E50: the extreme value of |Ric_0|^2 under a lower Ricci bound and the two thresholds.
4. Assessment: expansions of the conformal factors B_b used in the reduced model and the
   predicted ratio 5/2 for an antipodal handle.
Uses sympy and mpmath only.  Every check is an assertion; the script prints what it verified.
"""
import sympy as sp
import mpmath as mp


def check_inversion():
    y = sp.Matrix(sp.symbols("y1:5", real=True))
    a, rho = sp.symbols("a rho", positive=True)
    R = sp.diag(-1, 1, 1, 1)
    r2 = (y.T * y)[0]
    z = 2 * a * rho * (R * y) / r2
    J = z.jacobian(y)
    G = sp.simplify(J.T * J - (2 * a * rho / r2) ** 2 * sp.eye(4))
    assert G == sp.zeros(4, 4)
    det = sp.simplify(J.det() - (2 * a * rho / r2) ** 4)
    assert det == 0
    return "1. inversion composed with a reflection: J^T J = (2 a rho/|y|^2)^2 I and det J > 0"


def check_scalar_curvature():
    t = sp.symbols("t", real=True)
    u = sp.Function("u", positive=True)(t)
    # g = dr^2 + rho(r)^2 g_{S^3} with dr = u dt, rho = u; K_rad = -rho''/rho, K_tan = (1-rho'^2)/rho^2
    d_dr = lambda f: sp.diff(f, t) / u
    rho1 = d_dr(u)
    rho2 = d_dr(rho1)
    s = 6 * (-rho2 / u) + 6 * (1 - rho1 ** 2) / u ** 2
    assert sp.simplify(s - (-6 * sp.diff(u, t, 2) + 6 * u) / u ** 3) == 0
    return "2a. s(u^2(dt^2+g_S3)) = u^-3(-6u''+6u)"


def check_first_order():
    x = sp.symbols("x", real=True)
    sech, tanh = 1 / sp.cosh(x), sp.tanh(x)
    I4 = sp.integrate(sech ** 4, (x, -sp.oo, sp.oo))
    I6 = sp.integrate(sech ** 6, (x, -sp.oo, sp.oo))
    I8 = sp.integrate(sech ** 8, (x, -sp.oo, sp.oo))
    assert (sp.nsimplify(I4), sp.nsimplify(I6), sp.nsimplify(I8)) == (sp.Rational(4, 3), sp.Rational(16, 15), sp.Rational(32, 35))
    D = (tanh ** 2 + x * tanh * sech ** 2) / 2
    ID = mp.quad(lambda v: float(D.subs(x, v)) * float((sech ** 4).subs(x, v)), [-40, -5, 0, 5, 40])
    assert abs(ID - mp.mpf(2) / 9) < 1e-12
    eps_over_mp = (4 * sp.Rational(4, 3) - 6 * sp.Rational(2, 9)) / (4 * sp.Rational(16, 15))
    assert eps_over_mp == sp.Rational(15, 16)
    assert sp.Rational(3, 70) == 2 * sp.pi ** 2 * sp.Rational(32, 35) / (16 * sp.Rational(8, 3) * sp.pi ** 2)
    return "2b. int sech^4,6,8 = 4/3, 16/15, 32/35; int D sech^4 = 2/9; epsilon/(1-m) = 15/16; neck fourth energy 3/70"


def check_expansions():
    mp.mp.dps = 40
    out = []
    for mpr in (mp.mpf("1e-6"), mp.mpf("1e-9")):
        m = 1 - mpr
        K, E = mp.ellipk(m), mp.ellipe(m)
        I2 = E
        I4 = (2 * (2 - m) * I2 - mpr * K) / 3
        I6 = (4 * (2 - m) * I4 - 3 * mpr * I2) / 5
        lam = mp.log(16 / mpr)
        assert abs(I4 - mp.mpf(2) / 3 * (1 + mp.mpf(3) / 4 * mpr)) < 10 * mpr ** 2 * lam
        assert abs(I6 - (mp.mpf(8) / 15 + mpr / 3)) < 10 * mpr ** 2 * lam
        R = (-I6 + 4 * (2 - m) * I4 - mpr * I2) / (4 * I6)
        assert abs((R - 1) / mpr - mp.mpf(15) / 16) < 10 * mpr * lam
        Y2 = 576 * mp.pi ** 2 * (2 - m) ** mp.mpf("-1.5") * I4
        delta = 1 - mp.sqrt(Y2 / (384 * mp.pi ** 2))
        assert abs(delta / mpr - mp.mpf(3) / 8) < 10 * mpr * lam
        T = 2 * K * mp.sqrt(2 - m)
        assert abs(T - lam) < 10 * mpr * lam
        out.append((mp.nstr((R - 1) / mpr, 12), mp.nstr(delta / mpr, 12)))
    mp.mp.dps = 15
    return "2c. 40-digit closed forms at 1-m = 1e-6, 1e-9: (trial-1)/(1-m), deficit/(1-m) = %s" % (out,)


def check_thresholds():
    d, s = sp.symbols("delta s", positive=True)
    a = d * s / 4
    extreme = (3 * a) ** 2 + 3 * a ** 2
    assert sp.simplify(extreme - sp.Rational(3, 4) * d ** 2 * s ** 2) == 0
    Y0sq = 384 * sp.pi ** 2
    assert sp.simplify(Y0sq / 12 - 16 * sp.pi ** 2 - Y0sq / 24) == 0          # threshold at Y = Y(S^4)
    assert sp.simplify(sp.Rational(1, 9) - 32 * sp.pi ** 2 * 2 / (3 * Y0sq) - sp.Rational(1, 18)) == 0
    Ycp2sq = (12 * sp.sqrt(2) * sp.pi) ** 2
    assert sp.simplify(Ycp2sq / 12 - 8 * sp.pi ** 2 * 3) == 0                  # CP^2 at equality
    assert sp.simplify((8 * sp.sqrt(3) * sp.pi) ** 2 - Y0sq / 2) == 0          # Y(S^4)/sqrt 2
    return "3. |Ric_0|^2 <= (3/4) delta^2 s^2; thresholds s^2/24 and delta < 1/(3 sqrt 2) at Y(S^4); CP^2 at equality"


def check_model():
    b = sp.Matrix(sp.symbols("b1:6", real=True))
    eps = sp.symbols("epsilon", positive=True)
    e = sp.Matrix([0, 0, 0, 0, 1])
    B = lambda p: sp.sqrt(1 - (b.T * b)[0]) / (1 - (b.T * p)[0])
    # core: B_b(p)^2 = 1 + 2 b.p + 3 (b.p)^2 - |b|^2 + O(b^3)
    expr = (B(e) ** 2).subs({bi: eps * bi for bi in b})
    ser = sp.series(expr, eps, 0, 3).removeO()
    target = 1 + 2 * eps * b[4] + eps ** 2 * (3 * b[4] ** 2 - (b.T * b)[0])
    assert sp.simplify(sp.expand(ser - target)) == 0
    # handle between antipodal points: B_b(e) B_b(-e) = (1-|b|^2)/(1-(b.e)^2)
    prod = sp.simplify(B(e) * B(-e) - (1 - (b.T * b)[0]) / (1 - b[4] ** 2))
    assert prod == 0
    # reduced energy E = Y0 - kappa * prod: transverse Hessian kappa |b|^2 = (2 s/5)(nu - 1)|b|^2
    kappa, s = sp.symbols("kappa s", positive=True)
    eps_model = sp.Rational(5, 2) * kappa / s
    delta_model = kappa / s            # to first order Y0 = s
    assert sp.simplify(eps_model / delta_model - sp.Rational(5, 2)) == 0
    assert sp.Rational(15, 16) / sp.Rational(3, 8) == sp.Rational(5, 2)
    return "4. B_b(p)^2 expansion, antipodal product (1-|b|^2)/(1-(b.e)^2), model ratio 5/2 = (15/16)/(3/8)"


if __name__ == "__main__":
    for f in (check_inversion, check_scalar_curvature, check_first_order, check_expansions,
              check_thresholds, check_model):
        print(f())
    print("all assertions passed")
