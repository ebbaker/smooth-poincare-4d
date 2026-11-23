"""Part of the checks supporting reviews/EXTERNAL_MANUSCRIPT_REVIEW_20261123.md (see README.md in this folder).
Requires numpy, jax (CPU, float64).

Lemma 6.4 "The full stationary derivative form" (the certified triangle 1 <= u <= v <= 3/2, i.e. eigenvalue ratio <= 9/4;
present since commit 2c73984 and unchanged in 04ef8d7).  Independent floating-point test, NOT a substitute for the
manuscript's exact Bernstein certificate: with the definitions of stationary_lib.py, build the zero-speed map X -> V on four
symmetric trace-free matrices X_a (20 unknowns) and the quadratic form R_Q, then minimise R_Q/|X|^2 on ker V.
The extension to ratio 7/2 added in 04ef8d7 is treated in check_11."""
import numpy as np, jax, jax.numpy as jnp
from stationary_lib import *
bound = 32768/2205225
worst = (1e9, None); ranks = set()
for i in range(0, 26):
    for j in range(i, 26):
        u, v = 1 + 0.5*i/25, 1 + 0.5*j/25
        rk, kd, mn, mn_all = analyse(u, v); ranks.add((rk, kd))
        if mn < worst[0]: worst = (mn, (u, v))
print("ranks/kernel dimensions found on the closed triangle 1<=u<=v<=3/2:", ranks, "(manuscript: rank 8, kernel 12)")
print("minimum over a 351-point grid of  min_{ker V} R_Q/|X|^2 = %.6f at (u,v) = %s ; manuscript's certified lower bound = %.6f" % (worst[0], worst[1], bound))
print("PASS" if (ranks == {(8,12)} and worst[0] >= bound) else "FAIL", " Lemma (stationary derivative form): rank 8, kernel 12, R_Q >= (32768/2205225)|X|^2 on the kernel (grid test)")
rk, kd, mn, mn_all = analyse(1.0, 1.0)
print("     at Q = I: min on kernel = %.6f, min on all X = %.6f (principal term 4|X|^2 only)" % (mn, mn_all))
rk, kd, mn, mn_all = analyse(1.2, 1.45)
print("     at (u,v)=(1.2,1.45): min on kernel = %.6f ; min WITHOUT the zero-speed constraint = %.6f" % (mn, mn_all))
# how far beyond the certified triangle does positivity persist?  scan v at u=1, u=v, and the family u = sqrt(v)
for label, uf in (("u = 1", lambda v: 1.0), ("u = v", lambda v: v), ("u = sqrt(v)", lambda v: np.sqrt(v))):
    last = None
    for v in np.arange(1.5, 12.0001, 0.05):
        mn = analyse(float(uf(v)), float(v))[2]
        if mn <= 0: last = v; break
    print("     %-12s first v (step 0.05) with min_{ker V} R_Q <= 0: %s   -> eigenvalue ratio of Q = v^2 = %s" % (label, "none up to 12" if last is None else "%.2f" % last, "-" if last is None else "%.2f" % last**2))

# ---- cross-check against the manuscript's explicit kernel parametrisation (eq:stationary-edge-kernel) and
#      its scalar-block identity (eq:stationary-scalar-block), for random edge covectors Z_12, Z_13, Z_23
rng = np.random.default_rng(101)
errV = errR = 0.0
for trial in range(20):
    u = 1 + 0.5*rng.random(); v = u + (1.5-u)*rng.random()
    d = np.array([1.0, u, v]); c2 = 3.0/(1+u*u+v*v)
    Z = {(0,1): rng.normal(size=4), (0,2): rng.normal(size=4), (1,2): rng.normal(size=4)}
    for (i,j) in list(Z): Z[(j,i)] = -Z[(i,j)]
    H = np.zeros((3,3,4))
    for i in range(3):
        for j in range(3):
            if i != j: H[i,j] = -Jop[i]@Jop[j]@Z[(i,j)]
        H[i,i] = sum(d[j]*Z[(i,j)] for j in range(3) if j != i)/d[i]
    assert np.abs(H - H.transpose(1,0,2)).max() < 1e-12
    Xk = H - np.einsum('iia->a', H)[None,None,:]*np.eye(3)[:,:,None]/3.0        # X[i,j,a]
    z = np.einsum('ija,nij->an', Xk, np.asarray(B5)).reshape(20)
    Vv, Rv = pieces(jnp.array(z), u, v)
    hcov = [d[i]*H[i,i] for i in range(3)]
    s = [-Xk[i,i]/(2*d[i]**2) + sum(Z[(i,j)]/(d[i]*(d[i]+d[j])) for j in range(3) if j != i) for i in range(3)]
    ssum = s[0]+s[1]+s[2]
    form = sum(h@h for h in hcov)
    for (i,j,k) in [(0,1,2),(0,2,1),(1,2,0)]:
        form += 2*d[i]*d[j]*(Z[(i,j)]@Z[(i,j)]) - (d[j]**2-d[i]**2)*d[i]*d[j]*(Z[(i,j)]@(2*s[k]-ssum))
    errV = max(errV, float(jnp.abs(Vv).max())/np.abs(z).max()); errR = max(errR, abs(float(Rv) - 4*c2*form)/abs(float(Rv)))
print("%s  manuscript's edge parametrisation lies in ker V (20 random samples)                     err=%.2e" % ("PASS" if errV < 1e-10 else "FAIL", errV))
print("%s  scalar-block identity (eq:stationary-scalar-block) equals the directly computed R_Q      err=%.2e" % ("PASS" if errR < 1e-10 else "FAIL", errR))

# ---- reviewer's observation: the form is coercive on ALL of the 20-dimensional space on the certified triangle
worst_all = (1e9, None)
for i in range(0, 41):
    for j in range(i, 41):
        u, v = 1 + 0.5*i/40, 1 + 0.5*j/40
        mn_all = analyse(u, v)[3]
        if mn_all < worst_all[0]: worst_all = (mn_all, (u, v))
print("reviewer: min over an 861-point grid of the UNCONSTRAINED  min_X R_Q/|X|^2 = %.6f at (u,v) = %s" % worst_all)
def first_fail(uf, idx, lo=1.0, hi=12.0):
    f = lambda v: analyse(float(uf(v)), float(v))[idx]
    a, b = lo, hi
    for _ in range(45):
        m = 0.5*(a+b)
        if f(m) > 0: a = m
        else: b = m
    return 0.5*(a+b)
for label, uf in (("u = 1 (two equal small eigenvalues)", lambda v: 1.0), ("u = sqrt(v)", lambda v: np.sqrt(v)), ("u = v (two equal large eigenvalues)", lambda v: v)):
    vk, va = first_fail(uf, 2), first_fail(uf, 3)
    print("reviewer: %-38s positivity is lost at eigenvalue ratio v^2 = %.4f (on ker V) and %.4f (unconstrained)" % (label, vk**2, va**2))
