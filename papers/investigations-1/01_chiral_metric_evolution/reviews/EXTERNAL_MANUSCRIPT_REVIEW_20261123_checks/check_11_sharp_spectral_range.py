"""Part of the checks supporting reviews/EXTERNAL_MANUSCRIPT_REVIEW_20261123.md (see README.md in this folder).
Requires numpy, scipy, jax (CPU, float64).

Material added in commit 04ef8d7 (155-page build), Section 6.3:
  Lemma 6.5   "Sharp ratio for the stationary derivative form"            (ratio 7/2, inertia (8,4,0), radical, sharpness)
  Prop. 6.8   "Gradient control on each strict spectral subregion"        (ingredients of the constants (6.23))
  Prop. 6.9   "Effective dependence on the spectral margin"               (arithmetic of (6.24)-(6.26); consequences of the certificate)
  Prop. 6.10  "Degeneration of pointwise absorption"                      (pairings (6.29), bounds (6.27)-(6.28))
Floating-point evaluation on grids, written from the definitions in stationary_lib.py.  This is NOT a re-run of the
manuscript's exact Bernstein certificates (those scripts were neither read nor run); it tests the statements themselves.
The last block records observations of the reviewer that are not statements of the manuscript."""
from fractions import Fraction
import numpy as np, scipy.linalg as sl
from stationary_lib import *
def ok(name, cond, extra=""): print(f"{'PASS' if cond else 'FAIL'}  {name:104s} {extra}", flush=True)
al = np.sqrt(3.5); h = al - 1.0                     # manuscript: v = 1 + h a, u = 1 + h a b maps the unit square onto the triangle

# ------------------------------------------------------------------ Lemma 6.5 and the ingredients of Props 6.8, 6.9
n = 60
ranks = set(); worst = (1e9, None); corner = None
max_op = 0.0; min_sig = 1e9; max_L = 0.0; max_G = 0.0; max_XZ = 0.0; min_det_ratio = (1e99, None); max_dev = 0.0; min_detQ = 1e9; min_c2 = 1e9
for ia in range(n+1):
    for ib in range(n+1):
        a = ia/n; b = ib/n; v = 1 + h*a; u = 1 + h*a*b
        Vm, Hq = matrices(u, v); rk, sv, N, P = kernel_split(Vm); ranks.add((rk, N.shape[1]))
        ev = np.linalg.eigvalsh(N.T@Hq@N); c2 = 3/(1+u*u+v*v)
        max_op = max(max_op, np.abs(np.linalg.eigvalsh(Hq)).max())
        min_sig = min(min_sig, sv.min()**2*3/(16*c2))                 # |X_perp|^2 <= 3|W|^2  <=>  this >= 1   (V = -4cW)
        G, dev, E = scalar_block(u, v, Hq); max_dev = max(max_dev, dev)
        max_G = max(max_G, np.linalg.eigvalsh(G).max()); max_L = max(max_L, Lpoly(u, v))
        max_XZ = max(max_XZ, np.linalg.eigvalsh(E.T@E).max())
        min_detQ = min(min_detQ, 27*u*u*v*v/(1+u*u+v*v)**3); min_c2 = min(min_c2, c2)
        detM = np.linalg.det(2*Lpoly(u, v)*G); low = 1 - a**37*(1-b)**23
        if (ia, ib) == (n, 0): corner = (ev, detM)
        else:
            if ev.min() < worst[0]: worst = (ev.min(), (u, v))
            if detM/low < min_det_ratio[0]: min_det_ratio = (detM/low, (a, b))
ok("Lemma 6.5: rank 8 / kernel 12 at all 3721 grid points of the triangle 1<=u<=v<=sqrt(7/2)", ranks == {(8, 12)})
ok("Lemma 6.5: R_Q > 0 on ker V away from (u,v) = (1, sqrt(7/2))", worst[0] > 0, "min = %.4f at (%.4f, %.4f)" % (worst[0], *worst[1]))
ev = corner[0]
ok("Lemma 6.5: inertia (8,4,0) on ker V at (1, sqrt(7/2))", (np.abs(ev[:4]).max() < 1e-9) and ev[4] > 1, "eigenvalues %s" % np.round(ev, 6)[[0,3,4,7,8,11]])
t = al; Vm, Hq = matrices(1.0, t); rk, sv, N, P = kernel_split(Vm); errs = []
for a in range(4):
    W = np.zeros(4); W[a] = 1.0; z = pack(edge_to_X(-t/2*W, W, -W, 1.0, t)[0])
    errs.append(max(np.abs(Vm@z).max(), np.abs(N.T@Hq@z).max()))
ok("Lemma 6.5: (Z12,Z13,Z23) = (-tW/2, W, -W) lies in ker V and in the radical of R_Q|ker V at t^2 = 7/2", max(errs) < 1e-10, "err=%.1e" % max(errs))
err = 0.0; Wv = np.array([0.3, -1.1, 0.7, 0.2])
for v in (1.2, 1.6, al, 2.0, 2.5):
    z = pack(edge_to_X(-v/2*Wv, Wv, -Wv, 1.0, v)[0]); Hq = matrices(1.0, v)[1]
    err = max(err, abs(z@Hq@z - 4*(3/(2+v*v))*v*v*(7-2*v*v)*(Wv@Wv)))
ok("Lemma 6.5 (sharpness): R_Q on the edge array k(v) = (-v/2,1,-1) equals 4 c^2 v^2 (7-2v^2)|W|^2, also for v^2 > 7/2", err < 1e-10, "err=%.1e" % err)
Vm, Hq = matrices(1.0, np.sqrt(3.6)); N = kernel_split(Vm)[2]; ev = np.linalg.eigvalsh(N.T@Hq@N)
ok("Lemma 6.5 (sharpness): four negative directions on ker V at the axial spectrum with ratio 3.6", (ev < -1e-6).sum() == 4, "eigenvalues %s" % np.round(ev[[0,3,4]], 4))

print("     --- ingredients of Proposition 6.8 on the closed triangle (3721 grid points)")
ok("|R_Q(X)| <= (96 + 4 sqrt21)|X|^2 <= L_0|X|^2, L_0 = 120", max_op <= 96+4*np.sqrt(21), "largest |eigenvalue| found = %.4f  (bound 114.33)" % max_op)
ok("least-norm speed preimage |X_perp|^2 <= 3|W|^2", min_sig >= 1.0, "grid minimum of sigma_min(X->W)^2 * 3 = %.4f" % min_sig)
ok("c^2 >= 3/8 and det Q >= 27/512", (min_c2 >= 3/8 - 1e-12) and (min_detQ >= 27/512), "min c^2 = %.4f, min det Q = %.4f" % (min_c2, min_detQ))
ok("kappa(1) = 4", abs(analyse(1.0, 1.0)[2] - 4.0) < 1e-10)

print("     --- consequences of the certificate used in Proposition 6.9 (grid evaluation)")
ok("the 12x12 form in edge coordinates is G (x) I_4 (four copies of one 3x3 block)", max_dev < 1e-10, "max deviation %.1e" % max_dev)
ok("L <= 27648,  lambda_max(G) <= 880,  |X|^2 <= 11|Z|^2", (max_L <= 27648) and (max_G <= 880) and (max_XZ <= 11), "found max L = %.1f, max lambda(G) = %.3f, max |X|^2/|Z|^2 = %.4f" % (max_L, max_G, max_XZ))
ok("det M >= 1 - a^37 (1-b)^23 away from the corner; det M = 0 at the corner", (min_det_ratio[0] >= 1.0) and abs(corner[1]) < 1e-3, "min ratio = %.3e at (a,b) = %s ; det M(corner) = %.1e (entries of M ~ 1e5)" % (min_det_ratio[0], min_det_ratio[1], corner[1]))
rat = []
for dl in (1e-2, 1e-3, 1e-4):                        # approach the corner (a,b) = (1,0) along both edges
    for (a, b) in ((1-dl, 0.0), (1.0, dl)):
        v = 1 + h*a; u = 1 + h*a*b; G = scalar_block(u, v)[0]
        rat.append(np.linalg.det(2*Lpoly(u, v)*G)/(1 - a**37*(1-b)**23))
ok("the same inequality on approach to the corner along a -> 1 and b -> 0", min(rat) >= 1.0, "ratios %s" % np.array2string(np.array(rat), precision=3))
kstar = Fraction(3, 704*27648**3*880**2)
ok("k_* = 3/(704 * 27648^3 * 880^2) = 1/3840678118509930086400  (6.24)", kstar == Fraction(1, 3840678118509930086400))
ok("k_* = (3/2) * (1/11) / (32 * 27648^3 * 880^2)  [4c^2 >= 3/2, |X|^2 <= 11|Z|^2, P_3 >= eps/4, det M = 8L^3 det G]", kstar == Fraction(3,2)*Fraction(1,11)/(32*27648**3*880**2))
Hstar = Fraction(1205, 2) + 57600/kstar + 25*kstar/4; good = True
for e in (Fraction(1,1000), Fraction(1,2), Fraction(5,2)):
    C = Fraction(1,2)*(28800/(kstar*e) + 120 + kstar*e/2)
    good &= (e*(1+4*C) == 241*e + 57600/kstar + kstar*e*e) and (e*(1+4*C) <= Hstar)
ok("eps(1+4C) = 241 eps + 57600/k_* + k_* eps^2 <= H_* for 0 < eps <= 5/2  (6.26)", good, "gamma_* = %.3e, beta_* = %.3e" % (float(Fraction(24,5)/Hstar), float(kstar/Hstar)))
ok("2 alpha (alpha - 1) = 7 - sqrt14 < 4", abs(2*al*(al-1) - (7-np.sqrt(14))) < 1e-12 and 7-np.sqrt(14) < 4)

# ------------------------------------------------------------------ Proposition 6.10
print("     --- Proposition 6.10: the axial witnesses N, Y  (w = dx^1, old K = 1)")
w = np.array([1.0, 0, 0, 0])
def NY(s):
    t = np.sqrt(s); Nn = edge_to_X(-t/2*w, w, -w, 1.0, t)[0]
    Y = np.zeros((4,3,3)); Y[0] = np.diag([1.0, 0.0, -1.0])
    return pack(Nn), pack(Y), Nn
def C_opt(u, v):
    """smallest C with R_Q(X) + C|V(X)|^2 >= 0 for all X (may be negative)"""
    Vm, Hq = matrices(u, v); rk, sv, N, P = kernel_split(Vm)
    RNN = N.T@Hq@N; RNP = N.T@Hq@P; RPP = P.T@Hq@P; GP = P.T@Vm.T@Vm@P
    return -sl.eigh(RPP - RNP.T@np.linalg.solve(RNN, RNP), GP, eigvals_only=True).min()
err = 0.0
for s in (3.05, 3.2, 3.4, 3.49, 3.5):
    t = np.sqrt(s); lam = 3/(s+2); Vm, Hq = matrices(1.0, t); zn, zy, Nn = NY(s)
    # the edge array (-t/2, 1, -1) w is the manuscript's N: diagonal (t/2, -t/2, 0) w, N_12 = (t/2) J_3 w, N_13 = J_2 w, N_23 = J_1 w
    assert np.allclose(Nn[:,[0,1,2],[0,1,2]], np.outer(w, [t/2, -t/2, 0])) and np.allclose(Nn[:,0,1], t/2*Jop[2]@w) and np.allclose(Nn[:,0,2], Jop[1]@w) and np.allclose(Nn[:,1,2], Jop[0]@w)
    vals = [np.abs(Vm@zn).max(), zn@zn-(s+4), zn@Hq@zn-4*lam*s*(7-2*s), zn@Hq@zy-2*lam*t*(2-s), zy@Hq@zy-12*(5*s+1)/(s+2)**2, (Vm@zy)@(Vm@zy)-4*(zy@Hq@zy)]
    err = max(err, np.abs(vals).max())
ok("V(N)=0, |N|^2=s+4, R(N)=4 lam s(7-2s), B(N,Y)=2 lam t(2-s), R(Y)=12(5s+1)/(s+2)^2, |V(Y)|^2=4R(Y)   (6.29)", err < 1e-10, "err=%.1e" % err)
Vm, Hq = matrices(1.0, al); zn, zy, _ = NY(3.5); err = 0.0
for sig in (-2.0, 0.37, 5.0):
    z = zy + sig*zn; err = max(err, abs(z@Hq@z - (888/121 - 18*np.sqrt(14)/11*sig)), abs((Vm@z)@(Vm@z) - 3552/121))
ok("endpoint s = 7/2: R(Y + sigma N) = 888/121 - (18 sqrt14/11) sigma,  |V(Y + sigma N)|^2 = 3552/121", err < 1e-10, "err=%.1e" % err)
good = True; rows = []
for s in (3.2, 3.4, 3.49, 3.499):
    lb = (s+2)*(s-2)**2/(16*(5*s+1)*(7-2*s)) - 0.25; co = C_opt(1.0, np.sqrt(s)); good &= (co >= lb - 1e-9); rows.append((s, lb, co, (3.5-s)*co))
ok("(6.27): every admissible C(s) is at least the displayed lower bound (compared with the numerically optimal C)", good)
for r_ in rows: print("        s = %.3f : lower bound (6.27) = %9.5f ; numerically optimal C(s) = %10.5f ; (7/2 - s) C_opt = %.5f   [99/4736 = %.5f]" % (*r_, 99/4736))
def kappa(r, m=40):
    best = (1e9, None); vmax = np.sqrt(r)
    for i in range(m+1):
        for j in range(i, m+1):
            u = 1 + (vmax-1)*i/m; v = 1 + (vmax-1)*j/m; k_ = analyse(u, v)[2]
            if k_ < best[0]: best = (k_, (u, v))
    return best
fq = lambda r: 12*r*(7-2*r)/((r+2)*(r+4)); good = True; rows = []
for r in (1.5, 2.0, 2.25, 2.5, 3.0, 3.2, 3.4, 3.49):
    k_, loc = kappa(r); rows.append((r, k_, loc[0], loc[1], fq(r)))
    if r > 3: good &= (0 < k_ <= fq(r) + 1e-9)
ok("(6.28): 0 < kappa(r) <= 12 r (7-2r)/((r+2)(r+4)) for 3 < r < 7/2  (kappa minimised over an 861-point grid)", good)

# ------------------------------------------------------------------ reviewer's observations (not statements of the manuscript)
print("     --- reviewer's observations")
for r_ in rows: print("reviewer: r = %.2f : kappa(r) = %.6f, attained at (u,v) = (%.4f, %.4f) ; 12r(7-2r)/((r+2)(r+4)) = %.6f  %s" % (*r_, "EQUAL" if abs(r_[1]-r_[4]) < 1e-9 else "(smaller; other minimiser)"))
lo, hi = 1.5, 2.5                                    # ratio at which the minimiser moves from the edge u = v to the corner (1, sqrt r)
for _ in range(40):
    mid = 0.5*(lo+hi); t_ = np.sqrt(mid)
    if analyse(t_, t_)[2] < analyse(1.0, t_)[2]: lo = mid
    else: hi = mid
print("reviewer: -> for r >= %.3f (in particular on 9/4 <= r < 7/2) kappa(r) EQUALS the upper bound (6.28) on these grids, attained at the axial" % hi)
print("reviewer:    corner (1, sqrt r) in the direction N; kappa(9/4) = 216/85 = %.6f against the certified 32768/2205225 = %.6f;" % (216/85, 32768/2205225))
print("reviewer:    slope at the endpoint 112/55 = %.4f per unit of margin, against the certified k_* = %.2e" % (112/55, float(kstar)))
rows = []
for s in (2.9, 3.0, 3.1, 3.3, 3.49):
    co = C_opt(1.0, np.sqrt(s)); rows.append(abs(co - (s-3)*(s+1)/(8*(7-2*s))));
    print("reviewer: axial spectrum diag(1,1,s), s = %.2f : optimal absorption C_opt = %+.6f ; (s-3)(s+1)/(8(7-2s)) = %+.6f ; unconstrained min of R_Q/|X|^2 = %+.5f" % (s, co, (s-3)*(s+1)/(8*(7-2*s)), analyse(1.0, np.sqrt(s))[3]))
print("reviewer: -> C_opt(s) = (s-3)(s+1)/(8(7-2s)) on 2.9 <= s < 7/2 to %.0e ; it vanishes at s = 3 and (7/2-s) C_opt -> 9/64 = %.5f" % (max(rows), 9/64))
m = 80; vmax = np.sqrt(3.0); best = (1e9, None)
for i in range(m+1):
    for j in range(i, m+1):
        u = 1 + (vmax-1)*i/m; v = 1 + (vmax-1)*j/m; k_ = analyse(u, v)[3]
        if k_ < best[0]: best = (k_, (u, v))
print("reviewer: UNCONSTRAINED form on the triangle 1<=u<=v<=sqrt3 (3321 grid points): min of R_Q/|X|^2 = %.2e at (u,v) = (%.4f, %.4f)" % (best[0], *best[1]))
print("reviewer: -> for ratio < 3 the form is positive on ALL derivative arrays (no zero-speed constraint, no absorption); it is lost exactly at ratio 3 on the axial edge")
mx = -1e9
for i in range(m+1):
    for j in range(i, m+1):
        u = 1 + (al-1)*i/m; v = 1 + (al-1)*j/m; s_ = v*v
        if 3.0 <= s_ <= 3.49: mx = max(mx, C_opt(u, v) - (s_-3)*(s_+1)/(8*(7-2*s_)))
print("reviewer: on the part 3 <= v^2 <= 3.49 of the triangle, max over the grid of [C_opt(u,v) - C_opt(1,v)] = %.2e  (the axial edge is the worst shape at a given ratio)" % mx)
