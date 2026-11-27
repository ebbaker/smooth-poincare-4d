#!/usr/bin/env python3
"""check_02: least cost of a cap closing ONE tube, within the Kaluza-Klein (circle-symmetric) ansatz.

Cap  S^2 x D^2 with metric  ds^2 + a(s)^2 dpsi^2 + dtheta^2 + sin^2(theta) (dphi + b(s) dpsi)^2,
K = -a''/a, F = b'/a.  By check_01,
    cost/pi^2 = (1/pi^2) * (1/2) int_cap |W|^2_HS dV
              = int_0^S a [ (4/3)(K+1-(2/3)F^2)^2 + 4F^2 + (16/135)F^4 + (2/3)F'^2 ] ds ,
and the band wall 2T = 8 pi^2 is the value 8.  Boundary data: a(0)=0, a'(0)=1; a(S)=A, a'(S)=f, F(S)=0,
int_0^S F a ds = beta.  For the tube of angular radius theta about a circle of length l fixed by the
monodromy in  S^1_l x_phi (S^3/Gamma):  A = (l/2pi)/sin(theta), f = -(l/2pi) cot(theta), and
beta = alpha/2pi + n, alpha the rotation angle of the monodromy about the circle, n the framing.
For the flat model S^1_l x (R^3 minus a ball of radius x*l):  A = 1/(2 pi x), f = -A, beta = 0.

Profiles: K piecewise constant, F piecewise linear on N cells, so each profile is an admissible C^{1,1} cap
and its cost is an UPPER bound for the least cost.  The value printed is recomputed with 24-point Gauss
quadrature per cell.  These are floating-point results, not certified enclosures.
"""
import math, sys, time
import numpy as np
from scipy.optimize import minimize

PI = math.pi

def gauss(m):
    return np.polynomial.legendre.leggauss(m)

def profile(x, N, G):
    GX, GW = G
    Ks, Fs, S = x[:N], np.append(x[N:2 * N], 0.0), x[-1]
    h = S / N
    a, ap = 0.0, 1.0
    cost = flux = 0.0
    amin, Rmin = 1e9, 1e9
    for i in range(N):
        Kc = Ks[i]
        t = 0.5 * h * (GX + 1.0)
        if abs(Kc) < 1e-10:
            av = a + ap * t
        elif Kc > 0:
            om = math.sqrt(Kc); av = a * np.cos(om * t) + ap * np.sin(om * t) / om
        else:
            om = math.sqrt(-Kc); av = a * np.cosh(om * t) + ap * np.sinh(om * t) / om
        Fv = Fs[i] + (Fs[i + 1] - Fs[i]) * t / h
        Fp = (Fs[i + 1] - Fs[i]) / h
        dens = (4/3) * (Kc + 1 - (2/3) * Fv**2)**2 + 4 * Fv**2 + (16/135) * Fv**4 + (2/3) * Fp**2
        w = 0.5 * h * GW
        cost += float(np.sum(w * av * dens)); flux += float(np.sum(w * av * Fv))
        amin = min(amin, float(av.min()))
        Rmin = min(Rmin, 2 * (Kc + 1) - 0.5 * max(Fs[i]**2, Fs[i + 1]**2))   # R = 2(K+1) - F^2 sin^2(theta)/2
        if abs(Kc) < 1e-10:
            a, ap = a + ap * h, ap
        elif Kc > 0:
            om = math.sqrt(Kc); C, Sn = math.cos(om * h), math.sin(om * h) / om
            a, ap = C * a + Sn * ap, -Kc * Sn * a + C * ap
        else:
            om = math.sqrt(-Kc); C, Sn = math.cosh(om * h), math.sinh(om * h) / om
            a, ap = C * a + Sn * ap, -Kc * Sn * a + C * ap
    return cost, a, ap, flux, amin, Rmin

def least_cost(A0, f0, beta, N=24, tries=5, seed=0):
    G6 = gauss(6)
    free_F = (beta != 0.0)
    rg = np.random.default_rng(seed)
    def safe(x):
        try:
            return profile(x, N, G6)
        except (OverflowError, FloatingPointError):
            return (1e6, 1e3, 1e3, 1e3, -1.0, -1e3)
    cons = [{'type': 'eq', 'fun': lambda x: safe(x)[1] - A0},
            {'type': 'eq', 'fun': lambda x: safe(x)[2] - f0},
            {'type': 'ineq', 'fun': lambda x: x[-1] - 0.05}]
    if free_F:                                  # with F = 0 the flux constraint is void and is left out
        cons.append({'type': 'eq', 'fun': lambda x: safe(x)[3] - beta})
    bounds = [(-3.0, 6.0)] * N + ([(-4.0, 4.0)] * N if free_F else [(0.0, 0.0)] * N) + [(0.05, 14.0)]
    best = None
    for _ in range(tries):
        x0 = np.concatenate([rg.uniform(-0.5, 2.0, N),
                             (rg.uniform(-0.3, 0.6, N) + beta) if free_F else np.zeros(N),
                             [rg.uniform(1.0, 4.0)]])
        try:
            res = minimize(lambda x: safe(x)[0], x0, constraints=cons, bounds=bounds, method='SLSQP',
                           options={'maxiter': 2000, 'ftol': 1e-11})
        except Exception:
            continue
        c, a, ap, fl, amin, _ = safe(res.x)
        if abs(a - A0) < 1e-6 and abs(ap - f0) < 1e-6 and abs(fl - beta) < 1e-6 and amin > -1e-9:
            if best is None or c < best[0]:
                best = (c, res.x)
    if best is None:
        return None
    c24, a, ap, fl, amin, Rmin = profile(best[1], N, gauss(24))
    x = best[1]
    return dict(cost=c24, cost6=best[0], resid=max(abs(a - A0), abs(ap - f0), abs(fl - beta)), Rmin=Rmin,
                Kmin=float(x[:N].min()), Kmax=float(x[:N].max()), Fmax=float(np.abs(x[N:2 * N]).max()), S=float(x[-1]))

def hopf(theta, ell):
    A0 = (ell / (2 * PI)) / math.sin(theta)
    f0 = 0.0 if abs(theta - PI / 2) < 1e-12 else -(ell / (2 * PI)) / math.tan(theta)
    return A0, f0

CASES = [
    # label, kind, theta/pi (or x), l, beta, expectation ('<8', '>8', or None for a marginal case)
    ("round half of S^2 x S^2 (theta=pi/2, l=2pi, product cap)", 'hopf', 0.5, 2 * PI, 0.0, '<8'),
    ("Hopf, product cap", 'hopf', 1/3, 3.8, 0.0, '<8'),
    ("Hopf, product cap", 'hopf', 0.25, 2.3, 0.0, '<8'),
    ("Hopf, product cap", 'hopf', 0.2, 1.4, 0.0, '<8'),
    ("flat exterior, product cap (x = radius/length)", 'flat', 0.3, None, 0.0, '>8'),
    ("flat exterior, product cap (x = radius/length)", 'flat', 1.0, None, 0.0, '>8'),
    ("Gamma=1, twisted by a half turn", 'hopf', 0.5, 2 * PI, 0.5, '<8'),
    ("2-twist-spun trefoil, Z_3, theta_max=pi/3, alpha=pi", 'hopf', 0.32, 3.2, 0.5, '<8'),
    ("2-twist-spun figure-eight, Z_5, theta_max=0.290pi, alpha=pi", 'hopf', 0.28, 2.5, 0.5, '<8'),
    ("3-twist-spun trefoil, Q_8, theta_max=pi/4, alpha=2pi/3, weights (3,1)", 'hopf', 0.24, 1.8, 1/3, '<8'),
    ("3-twist-spun trefoil, other framing (Gluck twist), weights (3,-2)", 'hopf', 0.249, 1.8, -2/3, None),
    ("4-twist-spun trefoil, T*, theta_max=pi/6, alpha=pi/2, weights (4,1)", 'hopf', 0.165, 0.8, 0.25, None),
    ("4-twist-spun trefoil, other framing, weights (4,-3)", 'hopf', 0.165, 0.8, -0.75, '>8'),
    ("5-twist-spun trefoil, I*, theta_max=pi/10, alpha=2pi/5, weights (5,1)", 'hopf', 0.099, 0.3, 0.2, None),
    ("5-twist-spun trefoil, I*, weights (5,1)", 'hopf', 0.099, 0.5, 0.2, None),
]

if __name__ == '__main__':
    ok = fail = 0
    t0 = time.time()
    print("check_02: least cap costs in units of pi^2 (band wall 2T = 8); upper bounds within the ansatz\n")
    for label, kind, p, ell, beta, expect in CASES:
        if kind == 'hopf':
            A0, f0 = hopf(p * PI, ell); head = f"theta={p:.3f}pi l={ell:.3f}"
        else:
            A0 = 1 / (2 * PI * p); f0 = -A0; head = f"x={p:.2f}"
        r = least_cost(A0, f0, beta)
        if r is None:
            print(f"FAIL  {label}: {head} beta={beta:+.3f}: no feasible profile found"); fail += 1; continue
        verdict = '<8' if r['cost'] < 8 else '>8'
        if expect is None:
            tag = 'info'
        elif expect == verdict:
            tag = 'ok  '; ok += 1
        else:
            tag = 'FAIL'; fail += 1
        print(f"{tag}  {label}\n      {head} beta={beta:+.4f}: cost = {r['cost']:.4f}  (6-pt {r['cost6']:.4f}, residual {r['resid']:.1e}); "
              f"K in [{r['Kmin']:.2f},{r['Kmax']:.2f}], max|F| = {r['Fmax']:.2f}, S = {r['S']:.2f}, min R >= {r['Rmin']:.2f}", flush=True)
    print(f"\ncheck_02: {ok} ok, {fail} FAIL   ({time.time() - t0:.0f} s)")
    sys.exit(1 if fail else 0)
