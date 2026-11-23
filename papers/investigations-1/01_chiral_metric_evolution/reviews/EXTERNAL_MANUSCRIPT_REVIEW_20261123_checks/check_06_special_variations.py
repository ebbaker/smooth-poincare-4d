"""Conformal and Lie-derivative source variations ((5.9), remarks after (8.15)); linearised compatibility defect (5.11).
Part of the checks supporting reviews/EXTERNAL_MANUSCRIPT_REVIEW_20261123.md (see README.md in this folder).
Requires numpy, scipy, jax (CPU, float64)."""
import numpy as np, jax, jax.numpy as jnp, time
from sphere_lib import *
rng = np.random.default_rng(3)
def ok(name, err, tol=1e-7): print(f"{'PASS' if err<tol else 'FAIL'}  {name:94s} err={err:.2e}", flush=True)
rel = lambda a,b: float(jnp.abs(a-b).max()/(jnp.abs(b).max()+1e-300))
x = jnp.array([0.21,-0.33,0.12,0.27])
geo0 = make_geometry(lambda y: jnp.zeros((4,4))); cur0 = make_curvature(geo0['metric']); Gam0 = lambda y: cur0['christoffel'](y,0.0)
def nabla2(hf):
    def f(y):
        dh = jax.jacfwd(hf)(y); Gm = Gam0(y); hv = hf(y)
        return jnp.einsum('mnr->rmn',dh) - jnp.einsum('lrm,ln->rmn',Gm,hv) - jnp.einsum('lrn,ml->rmn',Gm,hv)
    return f
def Hop(kf):
    nk = nabla2(kf)
    def f(y):
        E0 = jnp.linalg.inv(geo0['coframe'](y,0.0)); return 0.5*jnp.einsum('icd,rc,sd,rms->im', etaP, E0, E0, nk(y))
    return f

# ---- conformal and Lie-derivative source variations (checks after Prop 5.2, and (8.15) remarks)
cf = jnp.array(rng.normal(size=4)); cff = jnp.array(rng.normal(size=(4,4))); cfff = jnp.array(rng.normal(size=(4,4,4)))
f = lambda y: jnp.dot(cf,y) + jnp.einsum('ab,a,b->',cff,y,y) + jnp.einsum('abc,a,b,c->',cfff,y,y,y)
hc = lambda y: 2*f(y)*g0(y)
geo = make_geometry(hc); fl = make_flow(geo['A'])
hess_f = jax.hessian(f)(x) - jnp.einsum('lmn,l->mn', Gam0(x), jax.grad(f)(x))
ok("(5.9) R'(2 f g0) = -(2/K) Hess f", rel(d_eps(fl['ghat'],x), -2/K*hess_f))
ok("conformal source variation: q = 0 and a_t = 0", max(float(jnp.abs(d_eps(fl['Q'],x)).max()), float(jnp.abs(d_eps(fl['G'],x)).max())), 1e-9)
gradf_up = jnp.linalg.inv(g0(x))@jax.grad(f)(x); F0 = fl['F'](x,0.0)
ok("reviewer remark: H(2 f g0) = -(1/K) i_{grad f} F_0  (a diffeomorphism direction, no gauge term)", rel(d_eps(geo['A'],x), -jnp.einsum('r,irm->im', gradf_up, F0)/K))
cX = jnp.array(rng.normal(size=4)); cXX = jnp.array(rng.normal(size=(4,4))); cXXX = jnp.array(rng.normal(size=(4,4,4)))
Xf = lambda y: cX + cXX@y + jnp.einsum('mab,a,b->m',cXXX,y,y)        # vector field X^mu
def hL(y):                                                       # (L_X g0)_{mn} = X^r d_r g_mn + g_rn d_m X^r + g_mr d_n X^r
    dg = jax.jacfwd(g0)(y); dX = jax.jacfwd(Xf)(y); g = g0(y)
    return jnp.einsum('r,mnr->mn',Xf(y),dg) + jnp.einsum('rn,rm->mn',g,dX) + jnp.einsum('mr,rn->mn',g,dX)
geo = make_geometry(hL); fl = make_flow(geo['A'])
ok("naturality: R'(L_X g0) = L_X g0, q = 0, a_t = 0", max(rel(d_eps(fl['ghat'],x), hL(x)), float(jnp.abs(d_eps(fl['Q'],x)).max()), float(jnp.abs(d_eps(fl['G'],x)).max())), 1e-9)

# ---- (5.11) linearised Levi-Civita compatibility defect, TT data
C = weyl5(rng); h = tt_mode(C); geo = make_geometry(h); fl = make_flow(geo['A'])
def SigmaA(y, eps):
    F = fl['F'](y, eps); _, Q = mu_and_Q(F); q = Q - I3
    Sinv = I3 - q/2 + 3*(q@q)/8 - 5*(q@q@q)/16
    return -jnp.einsum('ij,jmn->imn', Sinv, F)/K
def Tdefect(y, eps):                                             # (d_A Sigma_A)_{i, mu nu rho}
    S = SigmaA(y, eps); dS = jax.jacfwd(SigmaA)(y, eps); A = geo['A'](y, eps)      # dS[i,n,r,m]
    d = jnp.einsum('inrm->imnr',dS) + jnp.einsum('irmn->imnr',dS) + jnp.einsum('imnr->imnr',dS)
    AS = jnp.einsum('jm,knr->jkmnr',A,S) + jnp.einsum('jn,krm->jkmnr',A,S) + jnp.einsum('jr,kmn->jkmnr',A,S)
    return d + jnp.einsum('ijk,jkmnr->imnr', eps3, AS)
ok("d_A Sigma_A = 0 at the round connection", float(jnp.abs(Tdefect(x,0.0)).max()), 1e-9)
T1 = d_eps(Tdefect, x)
hhat_f = lambda y: d_eps(fl['ghat'], y)
b1 = Hop(lambda y: h(y) - hhat_f(y))(x)
S0 = SigmaA(x, 0.0)
bS = jnp.einsum('jm,knr->jkmnr',b1,S0) + jnp.einsum('jn,krm->jkmnr',b1,S0) + jnp.einsum('jr,kmn->jkmnr',b1,S0)
ok("(5.11) T' = [H(h - hhat), Sigma_0]  (TT h; here hhat = 6h so b' = -5 H h)", rel(T1, jnp.einsum('ijk,jkmnr->imnr', eps3, bS)))
print("     (5.11): max|T'| = %.6g, max|h| = %.6g  -> the linearised defect of metric-induced TT data is nonzero" % (float(jnp.abs(T1).max()), float(jnp.abs(h(x)).max())))
