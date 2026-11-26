#!/usr/bin/env python3
"""
check_02: normalisations of the master manuscript, Section 2 ("The two energy
thresholds") tested on explicit SU(2)-invariant metrics.

  (a) round S^4:        curvature operator = identity, W = 0, R = 12;
  (b) Fubini-Study CP^2 (a1 = a2 = sin t, a3 = sin t cos t on (0, pi/2)):
        one chiral block vanishes, the other has |W|^2_HS = R^2/24, and its
        integral is 12 pi^2  ( E_+ - E_- = 12 pi^2 tau with tau = 1 );
  (c) a smooth non-conformally-flat SU(2)-invariant metric on S^4,
        a_i^2 = sin^2 t + eps_i sin^4 t on [0, pi]:
        E_+ = E_-  (signature zero), and Chern-Gauss-Bonnet in the manuscript's
        normalisation,  16 pi^2 = E_+ + E_- - (1/2) int |Ric_0|^2 + (1/24) int R^2,
        hence the identities of Lemma "Physical curvature budget":
        int |Rm|^2_tens = 4(E_+ + E_-) + 2 int|Ric_0|^2 + (1/6) int R^2,
        4 int sigma_2 = 16 pi^2 - (E_+ + E_-);
  (d) symbolic identities: sigma_2(A) = R^2/96 - |Ric_0|^2/8 for the Schouten
        tensor A = (Ric - R g/6)/2;  P - 8T = D + (36 l^2 - Y^2)/12;
        round Yamabe constant 8 sqrt6 pi; y_* = 8 sqrt3 pi at e = T.
"""
import os
import sys
import numpy as np
import sympy as sp
from numpy.polynomial.legendre import leggauss
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from su2_curvature import curvature, VOL_S3  # noqa: E402

PASS, FAIL = 0, 0


def report(name, ok, detail=""):
    global PASS, FAIL
    PASS += ok
    FAIL += (not ok)
    print(f"[{'ok' if ok else 'FAIL'}] {name} {detail}")


def integrate(f, lo, hi, n=400, panels=40):
    x, w = leggauss(n // panels if n // panels >= 8 else 8)
    tot = 0.0
    edges = np.linspace(lo, hi, panels + 1)
    for A, B in zip(edges[:-1], edges[1:]):
        t = 0.5 * (B - A) * x + 0.5 * (A + B)
        tot += 0.5 * (B - A) * sum(wi * f(ti) for wi, ti in zip(w, t))
    return tot


# (a) round sphere
t0 = 0.7
c = curvature([np.sin(t0)] * 3, [np.cos(t0)] * 3, [-np.sin(t0)] * 3)
report("(a) round S^4: W = 0, R = 12, |Rm|^2_tens = 24",
       c['Wp2'] < 1e-20 and c['Wm2'] < 1e-20 and abs(c['R'] - 12) < 1e-10 and abs(c['Rm2'] - 24) < 1e-9,
       f"R = {c['R']:.12f}, |Rm|^2 = {c['Rm2']:.10f}")

# (b) Fubini-Study
def fs(t):
    s_, c_ = np.sin(t), np.cos(t)
    av = [s_, s_, s_ * c_]
    pv = [c_, c_, np.cos(2 * t)]
    qv = [-s_, -s_, -2 * np.sin(2 * t)]
    return curvature(av, pv, qv), s_ * s_ * s_ * c_


cc, _ = fs(0.6)
small, big = sorted([cc['Wp2'], cc['Wm2']])
report("(b) FS: one block vanishes, the other is R^2/24 with R = 24",
       small < 1e-18 and abs(cc['R'] - 24) < 1e-9 and abs(big - 24.0) < 1e-9,
       f"R = {cc['R']:.10f}, |W|^2 = ({cc['Wp2']:.3e}, {cc['Wm2']:.3e}), Ric0^2 = {cc['Ric02']:.2e}")
ev = np.sort(np.linalg.eigvalsh(cc['Wp'] if cc['Wp2'] > cc['Wm2'] else cc['Wm']))
report("(b) FS: nonzero block has eigenvalues (R/6, -R/12, -R/12) => R - 6 lambda_max = 0",
       np.allclose(ev, [-2, -2, 4], atol=1e-9), f"eigenvalues {np.round(ev, 9)}")
Ebig = VOL_S3 * integrate(lambda t: max(fs(t)[0]['Wp2'], fs(t)[0]['Wm2']) * fs(t)[1], 0, np.pi / 2)
vol = VOL_S3 * integrate(lambda t: fs(t)[1], 0, np.pi / 2)
report("(b) FS: volume pi^2/2 and int |W|^2_HS = 12 pi^2 (tau = 1)",
       abs(vol - np.pi ** 2 / 2) < 1e-10 and abs(Ebig - 12 * np.pi ** 2) < 1e-8,
       f"vol = {vol:.10f}, E = {Ebig:.8f}, 12 pi^2 = {12*np.pi**2:.8f}")

# (c) non-round SU(2)-invariant S^4
eps = np.array([0.35, -0.25, 0.10])


def prof(t):
    s_, c_ = np.sin(t), np.cos(t)
    u = s_ ** 2 * (1 + eps * s_ ** 2)                 # a_i^2
    du = 2 * s_ * c_ * (1 + 2 * eps * s_ ** 2)
    d2u = 2 * np.cos(2 * t) * (1 + 2 * eps * s_ ** 2) + 8 * eps * s_ ** 2 * c_ ** 2
    av = np.sqrt(u)
    pv = du / (2 * av)
    qv = d2u / (2 * av) - du ** 2 / (4 * av ** 3)
    return av, pv, qv


def dens(t, key):
    av, pv, qv = prof(t)
    cv = curvature(av, pv, qv)
    return cv[key] * np.prod(av) if key != 'one' else np.prod(av)


def tot(key):
    f = (lambda t: dens(t, key)) if key != 'R2' else (lambda t: curvature(*prof(t))['R'] ** 2 * np.prod(prof(t)[0]))
    return VOL_S3 * integrate(f, 1e-9, np.pi - 1e-9, n=1600, panels=80)


Ep, Em, D, R2, Rm2 = tot('Wp2'), tot('Wm2'), tot('Ric02'), tot('R2'), tot('Rm2')
report("(c) E_+ = E_- on the closed sphere (signature zero)", abs(Ep - Em) < 1e-7 and Ep > 1.0,
       f"E_+ = {Ep:.9f}, E_- = {Em:.9f}")
gb = Ep + Em - D / 2 + R2 / 24
report("(c) Chern-Gauss-Bonnet: E_+ + E_- - D/2 + int R^2/24 = 16 pi^2", abs(gb - 16 * np.pi ** 2) < 1e-6,
       f"lhs = {gb:.9f}, 16 pi^2 = {16*np.pi**2:.9f}")
report("(c) int |Rm|^2_tens = 4(E_+ + E_-) + 2D + int R^2/6", abs(Rm2 - (4 * (Ep + Em) + 2 * D + R2 / 6)) < 1e-6,
       f"{Rm2:.8f} vs {4*(Ep+Em)+2*D+R2/6:.8f}")
sig2 = R2 / 96 - D / 8
report("(c) 4 int sigma_2 = 16 pi^2 - (E_+ + E_-)", abs(4 * sig2 - (16 * np.pi ** 2 - Ep - Em)) < 1e-6,
       f"{4*sig2:.8f} vs {16*np.pi**2-Ep-Em:.8f}")
print(f"      (this test metric has E_+ = {Ep:.4f} = {Ep/(4*np.pi**2):.4f} T)")

# (d) symbolic identities
r1, r2, r3, r4 = sp.symbols('r1:5', real=True)
ric = sp.diag(r1, r2, r3, r4)
s = r1 + r2 + r3 + r4
A = (ric - s * sp.eye(4) / 6) / 2
sig2_sym = sp.Rational(1, 2) * (A.trace() ** 2 - (A * A).trace())
ric0 = ric - s * sp.eye(4) / 4
report("(d) sigma_2(A) = R^2/96 - |Ric_0|^2/8",
       sp.simplify(sig2_sym - (s ** 2 / 96 - (ric0 * ric0).trace() / 8)) == 0)
e, Y, l2 = sp.symbols('e Y l2', positive=True)
T = 4 * sp.pi ** 2
Dsym = 4 * e + Y ** 2 / 12 - 32 * sp.pi ** 2
report("(d) P - 8T = D + (36 l^2 - Y^2)/12 with P = 4e + 3 l^2",
       sp.simplify((4 * e + 3 * l2 - 8 * T) - (Dsym + (36 * l2 - Y ** 2) / 12)) == 0)
report("(d) round Yamabe constant 12 * vol(S^4)^(1/2) = 8 sqrt6 pi",
       sp.simplify(12 * sp.sqrt(sp.Rational(8, 3) * sp.pi ** 2) - 8 * sp.sqrt(6) * sp.pi) == 0)
report("(d) D = 0 at e = T gives Y = 8 sqrt3 pi and int|Rm|^2 = 64 pi^2",
       sp.simplify(sp.sqrt(48 * (8 * sp.pi ** 2 - T)) - 8 * sp.sqrt(3) * sp.pi) == 0
       and sp.simplify(16 * T + (192 * sp.pi ** 2) / 3 - 64 * sp.pi ** 2 - 64 * sp.pi ** 2) == 0)
alpha, FW, FRic, FR = sp.symbols('alpha F_W F_Ric F_R', positive=True)
lhs = (1 - alpha) * FW + alpha / 2 * FRic - (1 - alpha) * (FW - FRic / 2 + FR / 24)
report("(d) Bour's hypothesis F^alpha <= (1-alpha) 8 pi^2 chi  <=>  F_Ric0 <= (1-alpha) F_R / 12",
       sp.simplify(lhs - (FRic / 2 - (1 - alpha) * FR / 24)) == 0)

print(f"\ncheck_02: {PASS} passed, {FAIL} failed")
