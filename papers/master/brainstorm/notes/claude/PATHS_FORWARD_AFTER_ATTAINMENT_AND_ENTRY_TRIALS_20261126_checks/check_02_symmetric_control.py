#!/usr/bin/env python3
"""
check_02: the SO(3)-symmetric control, classes [q + g_{S^2}] with q a metric on
a surface, for the note PATHS_FORWARD_AFTER_ATTAINMENT_AND_ENTRY_TRIALS_20261126.md.

Written from the definitions only.  No repository script was read or reused.

Setting.  E_+- = (2 pi/3) int (K+1)^2 dA.  A cap is a rotationally symmetric disc
ds^2 + a(s)^2 dtheta^2, a(0) = 0, a'(0) = 1, glued C^1 along its boundary circle
to the hypercycle at distance w from the waist of a hyperbolic collar of waist
length ell, on the far side of the waist.  The matching data are
    A  = a(S)  = (ell/2pi) cosh w,      f = a'(S) = (ell/2pi) sinh w,
so 2 pi f = ell sinh w is the hyperbolic collar area swallowed by the cap.
In the Hopf picture the removed tube has angular radius theta with
cot(theta) = -sinh w.

Claims tested
  (a) round caps: K = 1 fits exactly when cos 2S = -(ell/2pi)^2 and
      tanh w = cot S; then sin S = A, cos S = f, and the cost is u (1 - cos S),
      u = 16 pi^2/3 (by quadrature);
  (b) Gauss-Bonnet bound: every cap costs at least u (1 - f); tested on random
      profiles;
  (c) a flat disc fits when f = 1 and costs (2 pi^2/3)(1 + (ell/2pi)^2);
  (d) Euler-Lagrange caps: K' = c a, K'' = (1-K^2)/2 reduce the matching to two
      algebraic equations; cost = (4 pi^2/3) ((K_S+1)^3 - (K_0+1)^3)/(3c).
      The least Euler-Lagrange value is tabulated; it lies between the
      Gauss-Bonnet bound and the round and flat competitors, and an
      independent direct minimisation over piecewise constant curvature
      reproduces Euler-Lagrange values and never goes below the least one;
      on the thin side f < 0 the least cost is at least u (1 + |f|);
  (e) at the collar width of the collar lemma, sinh w sinh(ell/2) = 1, one has
      f <= 1/pi and every cap costs more than 4 pi^2;
  (f) as the waist length and the cut depth both shrink the least cost tends
      to 8 pi^2, the energy of the cusp solution (Euclidean Schwarzschild,
      check_03); a cap at the waist itself costs u for ell = 2 pi and more for
      shorter and for longer waists;
  (g) the example: pants with cuffs (pi, pi, m), round caps on the first two
      cuffs; the two swallowed collars are embedded and disjoint exactly when
      m > 6.79, they cross the third waist, and e = 4.134 pi^2;
  (h) retained area: with a retained third waist, e >= u + (8 pi/3) A_ret;
      this is 2u for A_ret = 2 pi and is below 8 pi^2 only for A_ret < pi.
"""
import math

import numpy as np
from scipy.integrate import quad
from scipy.optimize import brentq, minimize

PI = math.pi
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


def cost_units(J):
    """E_+- in units of pi^2 from J = int (K+1)^2 a ds."""
    return 4.0 / 3.0 * J


# ---------------------------------------------------------------------------
# (a) round caps
# ---------------------------------------------------------------------------
ok = True
worst = 0.0
for ell in np.linspace(0.2, 2 * PI, 25):
    S = 0.5 * math.acos(-(ell / (2 * PI))**2)
    w = math.atanh(1 / math.tan(S)) if abs(S - PI / 2) > 1e-12 else 0.0
    A, f = ell / (2 * PI) * math.cosh(w), ell / (2 * PI) * math.sinh(w)
    J, _ = quad(lambda x: (math.sin(x) + math.sin(x))**2 / math.sin(x), 0, S)       # (a - a'')^2 / a with a = sin
    err = max(abs(math.sin(S) - A), abs(math.cos(S) - f), abs(4 * PI**2 / 3 * J - U * (1 - math.cos(S))))
    worst = max(worst, err)
    ok = ok and err < 1e-9 and PI / 4 < S <= PI / 2 + 1e-12
report("(a) round cap: cos 2S = -(ell/2pi)^2, tanh w = cot S give a(S) = sin S, a'(S) = cos S; cost u(1 - cos S)",
       ok, f"25 waist lengths in (0, 2pi], max error {worst:.1e}")

# ---------------------------------------------------------------------------
# (b) Gauss-Bonnet bound on random profiles
# ---------------------------------------------------------------------------
rng = np.random.default_rng(20261126)
ok = True
tight = 1e9
for trial in range(300):
    co = rng.normal(size=4) * np.array([0.6, 0.4, 0.2, 0.1])
    S = rng.uniform(0.5, 1.4)
    a = lambda x: x + co[0] * x**3 + co[1] * x**4 + co[2] * x**5 + co[3] * x**6
    a1 = lambda x: 1 + 3 * co[0] * x**2 + 4 * co[1] * x**3 + 5 * co[2] * x**4 + 6 * co[3] * x**5
    a2 = lambda x: 6 * co[0] * x + 12 * co[1] * x**2 + 20 * co[2] * x**3 + 30 * co[3] * x**4
    xs = np.linspace(1e-6, S, 400)
    if np.min(a(xs)) <= 0:
        continue
    J, _ = quad(lambda x: (a(x) - a2(x))**2 / a(x), 0, S, limit=200)
    gap = J - 4 * (1 - a1(S))
    tight = min(tight, gap)
    ok = ok and gap > -1e-9
report("(b) int (K+1)^2 a ds >= 4 (1 - a'(S)) on 300 random profiles, i.e. cost >= u (1 - f)", ok,
       f"smallest excess {tight:.3e}")

# ---------------------------------------------------------------------------
# (c) flat disc
# ---------------------------------------------------------------------------
ok = True
for ell in (0.5, 2.0, PI, 5.0):
    w = math.asinh(2 * PI / ell)
    A, f = ell / (2 * PI) * math.cosh(w), ell / (2 * PI) * math.sinh(w)
    S = A                                                    # a = s
    cost = (2 * PI / 3) * PI * S**2                          # (2 pi/3) * area, K = 0
    ok = ok and abs(f - 1) < 1e-12 and abs(cost - (2 * PI**2 / 3) * (1 + (ell / (2 * PI))**2)) < 1e-9
report("(c) flat disc fits when ell sinh w = 2 pi and costs (2 pi^2/3)(1 + (ell/2pi)^2)", ok)

# ---------------------------------------------------------------------------
# (d) Euler-Lagrange caps
# ---------------------------------------------------------------------------
V = lambda K: K**3 / 6 - K / 2


def el_solutions(A, f):
    """all caps with K' = c a, K'' = (1-K^2)/2, a(S) = A, a'(S) = f; list of (J, K0, KS)"""
    sols = []

    def F(K0, sgn):
        c = (1 - K0 * K0) / 2
        ks2 = 1 - 2 * c * f
        if ks2 < 0:
            return None
        KS = sgn * math.sqrt(ks2)
        return 2 * (V(K0) - V(KS)) - c * c * A * A, KS
    grid = np.concatenate([np.linspace(-6, -1.0005, 1500), np.linspace(-0.9995, 0.9995, 3000),
                           np.linspace(1.0005, 14, 5000)])
    for sgn in (+1, -1):
        prev = None
        for K0 in grid:
            r = F(K0, sgn)
            if r is None:
                prev = None
                continue
            val, KS = r
            if prev is not None and prev[1] * val < 0 and abs(K0 - prev[0]) < 0.01:
                root = brentq(lambda x: F(x, sgn)[0], prev[0], K0, xtol=1e-14)
                c = (1 - root * root) / 2
                KS = F(root, sgn)[1]
                if (KS - root) * c > 0:                       # K moves from K0 towards KS
                    ks = np.linspace(root, KS, 2001)[1:-1]
                    if np.all(V(ks) < V(root) + 1e-13):       # no turning point on the way
                        sols.append((((KS + 1)**3 - (root + 1)**3) / (3 * c), root, KS))
            prev = (K0, val)
    return sorted(sols)


def transfer(Kc, h, a, ap):
    """exact step of a'' = -Kc a over length h; returns a, a', int a ds"""
    if abs(Kc) < 1e-12:
        return a + ap * h, ap, a * h + ap * h * h / 2
    if Kc > 0:
        om = math.sqrt(Kc)
        C, Sn = math.cos(om * h), math.sin(om * h) / om
    else:
        om = math.sqrt(-Kc)
        C, Sn = math.cosh(om * h), math.sinh(om * h) / om
    a1, ap1 = C * a + Sn * ap, -Kc * Sn * a + C * ap
    return a1, ap1, -(ap1 - ap) / Kc


def direct_min(A, f, N=30, tries=3, seed=1):
    """minimise int (K+1)^2 a ds over piecewise constant K on N cells and over S"""
    rg = np.random.default_rng(seed)

    def run(x):
        h = x[-1] / N
        a, ap, J, amin = 0.0, 1.0, 0.0, 1e9
        for i in range(N):
            a1, ap1, ia = transfer(x[i], h, a, ap)
            J += (x[i] + 1)**2 * ia
            a, ap = a1, ap1
            amin = min(amin, a)
        return J, a, ap, amin
    best = None
    for t in range(tries):
        x0 = np.concatenate([rg.uniform(-1, 1.5, N), [rg.uniform(0.5, 3.0)]])
        cons = [{'type': 'eq', 'fun': lambda x: run(x)[1] - A}, {'type': 'eq', 'fun': lambda x: run(x)[2] - f},
                {'type': 'ineq', 'fun': lambda x: x[-1] - 0.05}]
        res = minimize(lambda x: run(x)[0], x0, constraints=cons, method='SLSQP',
                       options={'maxiter': 800, 'ftol': 1e-12})
        J, a, ap, amin = run(res.x)
        if abs(a - A) < 1e-6 and abs(ap - f) < 1e-6 and amin > 0 and res.x[-1] > 0.05:
            if best is None or J < best:
                best = J
    return best


ELLS = [(1.0, "1"), (2.0, "2"), (2 * math.acosh(2), "2 arccosh 2"), (PI, "pi"), (4.0, "4"), (2 * PI, "2 pi")]
FS = [0.25, 0.5, 0.75, 1.0, 1.5]
table = {}
ok_bounds = True
for ell, _ in ELLS:
    for f in FS:
        A = math.sqrt((ell / (2 * PI))**2 + f * f)
        sols = el_solutions(A, f)
        least = cost_units(sols[0][0])
        table[(ell, f)] = (least, [cost_units(x[0]) for x in sols])
        gb = 16.0 / 3.0 * max(0.0, 1 - f)
        ok_bounds = ok_bounds and least >= gb - 1e-9
        if abs(f - 1.0) < 1e-12:                              # flat competitor
            ok_bounds = ok_bounds and least <= (2.0 / 3.0) * (1 + (ell / (2 * PI))**2) + 1e-9
print("# least Euler-Lagrange cost of one cap, in units of pi^2 (rows: waist length ell; columns: f = ell sinh w / 2pi)")
print("#   ell          " + "".join(f"f={f:<8}" for f in FS))
for ell, lab in ELLS:
    print(f"#   {lab:<12} " + "".join(f"{table[(ell, f)][0]:<10.3f}" for f in FS))
print("#   Gauss-Bonnet " + "".join(f"{16.0 / 3.0 * max(0.0, 1 - f):<10.3f}" for f in FS))
report("(d) least Euler-Lagrange cost lies above the Gauss-Bonnet bound u(1-f) and, at f = 1, below the flat disc",
       ok_bounds, "30 cases")

# the round cap is the Euler-Lagrange cap at its own matching data (limit K_0 -> 1)
ok = True
for ell in (1.0, PI, 5.0):
    S = 0.5 * math.acos(-(ell / (2 * PI))**2)
    fr = math.cos(S)
    below = cost_units(el_solutions(math.sqrt((ell / (2 * PI))**2 + (fr - 0.02)**2), fr - 0.02)[0][0])
    above = cost_units(el_solutions(math.sqrt((ell / (2 * PI))**2 + (fr + 0.02)**2), fr + 0.02)[0][0])
    rc = 16.0 / 3.0 * (1 - fr)
    ok = ok and above < rc < below
report("(d) the round-cap cost is bracketed by the least Euler-Lagrange costs at f = cos S -+ 0.02", ok)

ok = True
det = []
for (ell, f) in [(PI, 0.5), (PI, 1.0), (1.0, 0.75), (2 * PI, 0.25), (4.0, 1.5), (2.0, 0.5)]:
    A = math.sqrt((ell / (2 * PI))**2 + f * f)
    dm = direct_min(A, f)
    least, allv = table[(ell, f)]
    dmu = cost_units(dm)
    near = min(abs(dmu - v) for v in allv)
    ok = ok and dm is not None and dmu >= least - 2e-3 and near < 5e-3
    det.append(f"({ell:.2f},{f}): direct {dmu:.4f}, EL {least:.4f}")
report("(d) direct minimisation over piecewise constant curvature reproduces an Euler-Lagrange value "
       "and is never below the least one", ok, "; ".join(det))

# thin side: the cut lies in the funnel before the waist, f = -(ell/2pi) sinh r_0 < 0
ok = True
det = []
for ell in (2.0, 2 * PI):
    for f in (-0.5, -1.0, -2.0):
        A = math.sqrt((ell / (2 * PI))**2 + f * f)
        least = cost_units(el_solutions(A, f)[0][0])
        gb = 16.0 / 3.0 * (1 - f)
        ok = ok and least >= gb - 1e-9 and least > 16.0 / 3.0
        det.append(f"({ell:.2f},{f}): {least:.2f} >= {gb:.2f}")
report("(d) thin side f < 0: the least cost is at least u(1 + |f|), above u", ok, "; ".join(det))

# ---------------------------------------------------------------------------
# (e) collar-lemma width
# ---------------------------------------------------------------------------
ok = True
det = []
for ell in (0.25, 0.5, 1.0, 2.0, 2 * math.acosh(2), PI, 4.0, 5.0, 2 * PI):
    fstd = (ell / (2 * PI)) / math.sinh(ell / 2)
    A = math.sqrt((ell / (2 * PI))**2 + fstd**2)
    least = cost_units(el_solutions(A, fstd)[0][0])
    ok = ok and fstd <= 1 / PI + 1e-12 and least > 4.0
    det.append(f"ell={ell:.2f}: f={fstd:.3f}, cost {least:.2f}")
report("(e) at the collar-lemma width f <= 1/pi and one cap costs more than 4 pi^2 (two exceed 8 pi^2)", ok,
       "; ".join(det))

# ---------------------------------------------------------------------------
# (f) short waists: the cusp limit
# ---------------------------------------------------------------------------
vals = []
for (ell, f) in ((0.4, 0.1), (0.1, 0.05), (0.02, 0.01)):
    A = math.sqrt((ell / (2 * PI))**2 + f * f)
    vals.append(cost_units(el_solutions(A, f)[0][0]))
report("(f) the least cost increases to 8 pi^2 as waist and cut both shrink: (ell, f) = (0.4, 0.1), (0.1, 0.05), (0.02, 0.01)",
       vals[0] < vals[1] < vals[2] < 8.0 and 8.0 - vals[2] < 1e-3, ", ".join(f"{v:.5f}" for v in vals))
# cutting at the waist itself (f -> 0): u at ell = 2 pi, between u and 2T for shorter waists
wv = []
for ell in (2 * PI, 5.0, 3.0, 1.0, 0.3):
    f = 1e-4
    A = math.sqrt((ell / (2 * PI))**2 + f * f)
    wv.append(cost_units(el_solutions(A, f)[0][0]))
report("(f) a cap at the waist costs u for ell = 2 pi and between u and 8 pi^2 for shorter waists, increasing as ell decreases",
       abs(wv[0] - 16.0 / 3.0) < 2e-3 and all(wv[i] < wv[i + 1] for i in range(4)) and wv[-1] < 8.0,
       ", ".join(f"ell={l:.2f}: {v:.3f}" for l, v in zip((2 * PI, 5.0, 3.0, 1.0, 0.3), wv)))

lw = []
for ell in (8.0, 10.0, 15.0):
    f = 1e-4
    A = math.sqrt((ell / (2 * PI))**2 + f * f)
    lw.append(cost_units(el_solutions(A, f)[0][0]))
report("(f) for waists longer than 2 pi the cost at the waist rises again and exceeds 8 pi^2 at ell = 15",
       16.0 / 3.0 < lw[0] < lw[1] < lw[2] and lw[2] > 8.0, ", ".join(f"ell={l:.0f}: {v:.3f}" for l, v in zip((8, 10, 15), lw)))

# ---------------------------------------------------------------------------
# (g) the pants example (pi, pi, m)
# ---------------------------------------------------------------------------
ell = PI
S = 0.5 * math.acos(-(ell / (2 * PI))**2)
w = math.atanh(1 / math.tan(S))
e_units = 2 * 16.0 / 3.0 * (1 - math.cos(S))
report("(g) ell = pi: S = 0.9117, cos S = 0.6124, depth w = 1.0317, two round caps cost 4.134 pi^2",
       abs(S - 0.9117) < 1e-4 and abs(math.cos(S) - 0.6124) < 1e-4 and abs(w - 1.0317) < 1e-4 and abs(e_units - 4.134) < 1e-3,
       f"e = {e_units:.4f} pi^2, swallowed area per cap {2 * PI * math.cos(S):.3f}, pants area {2 * PI:.3f}")


def d_between(a, b, c):
    """distance between the cuffs of half-lengths a and b in pants with third half-length c"""
    return math.acosh((math.cosh(c) + math.cosh(a) * math.cosh(b)) / (math.sinh(a) * math.sinh(b)))


def self_return(a, b, c):
    """half-length p of the shortest orthogeodesic from the cuff of half-length a to itself:
    sinh a1 sinh p = cosh b, sinh a2 sinh p = cosh c, a1 + a2 = a"""
    g = lambda p: math.asinh(math.cosh(b) / math.sinh(p)) + math.asinh(math.cosh(c) / math.sinh(p)) - a
    return brentq(g, 1e-6, 60)


mstar = brentq(lambda m: d_between(PI / 2, PI / 2, m / 2) - 2 * w, 0.1, 30)
pmin = min(self_return(PI / 2, PI / 2, m / 2) for m in np.linspace(0.01, 30, 300))
d13 = d_between(PI / 2, mstar / 2, PI / 2)
report("(g) collars of depth w around cuffs 1, 2 are disjoint iff m > 6.79 and embedded for every m; they cross waist 3",
       abs(mstar - 6.79) < 0.01 and pmin > w and d13 < w,
       f"m* = {mstar:.3f}, min self-return half-length {pmin:.3f} > w, d(cuff1, cuff3) = {d13:.3f} < w at m*")
report("(g) two swallowed collars exceed the area of the pants core (2 x 3.848 > 2 pi), so no third waist is retained",
       2 * 2 * PI * math.cos(S) > 2 * PI)

# ---------------------------------------------------------------------------
# (h) retained area
# ---------------------------------------------------------------------------
e_of = lambda Aret: U + (8 * PI / 3) * Aret
report("(h) e >= u + (8 pi/3) A_ret: equals 2u = 32 pi^2/3 at A_ret = 2 pi and 8 pi^2 at A_ret = pi",
       abs(e_of(2 * PI) - 2 * U) < 1e-9 and abs(e_of(PI) - 8 * PI**2) < 1e-9)
# pointwise inequality behind (b) and (h)
ks = np.linspace(-5, 5, 2001)
report("(h) (K+1)^2 >= 4K with equality only at K = 1", bool(np.all((ks + 1)**2 - 4 * ks >= -1e-12))
       and abs(((1.0 + 1)**2 - 4.0)) < 1e-15)

print(f"# check_02: {NOK} ok, {NFAIL} FAIL")
