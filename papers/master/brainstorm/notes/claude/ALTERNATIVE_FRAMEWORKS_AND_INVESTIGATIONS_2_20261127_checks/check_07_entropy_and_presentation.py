#!/usr/bin/env python3
"""
check_07_entropy_and_presentation.py

(a) Entropy of the round shrinking spheres, lambda(S^k) = Area(S^k) (k/(2 pi e))^(k/2),
    which is also the entropy of the cylinder S^k x R^(n-k).  Values and ordering used in
    section 4 of the note (extrinsic flow).
(b) The length-fourteen Miller-Schupp presentation named in investigation 07,
    <x, y | x^-1 y^2 x = y^3, x = y x^2 y^-1 x^-2>, is balanced and presents the trivial
    group (coset enumeration over the trivial subgroup).  This is the group-theoretic
    hypothesis only; it says nothing about Andrews-Curtis triviality.
"""
import sys, os
import mpmath as mp
here = os.path.dirname(os.path.abspath(__file__))
exec(open(os.path.join(here, 'check_05_prism_groups.py')).read().split('# ---------- words')[0])

results = []
def check(name, cond):
    results.append(bool(cond))
    print(("ok   " if cond else "FAIL ") + name)

mp.mp.dps = 30
def area(k):
    return 2 * mp.pi ** ((k + 1) / mp.mpf(2)) / mp.gamma((k + 1) / mp.mpf(2))
def lam(k):
    return area(k) * (k / (2 * mp.pi * mp.e)) ** (k / mp.mpf(2))
vals = {k: lam(k) for k in range(1, 8)}
for k in range(1, 6):
    print(f"     lambda(S^{k}) = {mp.nstr(vals[k], 10)}")
check("(a1) lambda(S^1) = sqrt(2 pi/e) and lambda(S^2) = 4/e", abs(vals[1] - mp.sqrt(2 * mp.pi / mp.e)) < 1e-25 and abs(vals[2] - 4 / mp.e) < 1e-25)
check("(a2) lambda(S^4) = 32/(3 e^2)", abs(vals[4] - mp.mpf(32) / (3 * mp.e**2)) < 1e-25)
check("(a3) 2 > lambda(S^1) > lambda(S^2) > lambda(S^3) > lambda(S^4) > sqrt(2)",
      2 > vals[1] > vals[2] > vals[3] > vals[4] > mp.sqrt(2))
check("(a4) the values decrease to sqrt(2) (checked to k = 7, and the limit by Stirling at k = 10^6)",
      all(vals[k] > vals[k + 1] for k in range(1, 7)) and abs(lam(10**6) - mp.sqrt(2)) < 1e-6)
# direct evaluation of the Gaussian area of the sphere of radius sqrt(2k) in R^(k+1)
def gaussian_area(k):
    R = mp.sqrt(2 * k)
    return (4 * mp.pi) ** (-k / mp.mpf(2)) * area(k) * R**k * mp.e ** (-R**2 / 4)
check("(a5) the closed formula agrees with the Gaussian area of the sphere of radius sqrt(2k)",
      all(abs(gaussian_area(k) - vals[k]) < 1e-25 for k in range(1, 6)))

x, y = [1], [2]
def inv(w): return [-g for g in reversed(w)]
r1 = inv(x) + y * 2 + x + inv(y) * 3
r2 = inv(x) + y + x * 2 + inv(y) + inv(x) * 2
check(f"(b1) total relator length {len(r1) + len(r2)} = 14, two generators and two relators", len(r1) + len(r2) == 14)
n = coset_enumeration(2, [r1, r2], max_cosets=200000)
check(f"(b2) the presented group has order {n} = 1", n == 1)
ex = [sum(1 if g == 1 else -1 if g == -1 else 0 for g in w) for w in (r1, r2)]
ey = [sum(1 if g == 2 else -1 if g == -2 else 0 for g in w) for w in (r1, r2)]
check(f"(b3) exponent-sum matrix [[{ex[0]},{ey[0]}],[{ex[1]},{ey[1]}]] has determinant +-1", abs(ex[0] * ey[1] - ex[1] * ey[0]) == 1)

n_ok = sum(results)
print(f"check_07_entropy_and_presentation: {n_ok} ok, {len(results) - n_ok} FAIL")
sys.exit(0 if n_ok == len(results) else 1)
