"""Round S^4: background (Prop 3.1), k=2 TT harmonics, central linear identities (1.3), (5.6), (8.1), (8.8), (8.10).
Part of the checks supporting reviews/EXTERNAL_MANUSCRIPT_REVIEW_20261123.md (see README.md in this folder).
Requires numpy, scipy, jax (CPU, float64)."""
import numpy as np, jax, jax.numpy as jnp, time
from sphere_lib import *
rng = np.random.default_rng(7)
def ok(name, err, tol=1e-8): print(f"{'PASS' if err<tol else 'FAIL'}  {name:86s} err={err:.2e}", flush=True)
rel = lambda a,b: float(jnp.abs(a-b).max()/(jnp.abs(b).max()+1e-300))

x = jnp.array([0.31,-0.42,0.17,0.25])
# ---------------- background sanity (Proposition 3.1 and the reconstruction conventions)
geo0 = make_geometry(lambda x: jnp.zeros((4,4))); fl0 = make_flow(geo0['A'])
D = 1/K + jnp.dot(x,x)
A_formula = 2*jnp.einsum('iab,b->ia', etaP, x)/D                     # (3.13) with l^2 = 1/K
ok("(3.13) A_i = 2 eta_i,ab x_b dx^a / D", rel(geo0['A'](x,0.0), A_formula))
F0 = fl0['F'](x,0.0); Sig = Omega(x)**2*etaP
ok("(3.13) F_i = -K Sigma_i^+", rel(F0, -K*Sig))
mu0, Q0 = mu_and_Q(F0)
ok("(3.20) mu = 2K^2 dV, Q = I", max(rel(mu0, 2*K**2*Omega(x)**4), float(jnp.abs(Q0-I3).max())))
ok("reconstructed metric of the round connection is g0 (Urbantke route)", rel(fl0['ghat'](x,0.0), g0(x)))
ok("flow vector field vanishes at the round connection", float(jnp.abs(fl0['G'](x,0.0)).max()), 1e-9)

# ---------------- k=2 TT mode
C = weyl5(rng); h = tt_mode(C)
geo = make_geometry(h); fl = make_flow(geo['A']); cur = make_curvature(geo['metric'])
hx = h(x); gi = jnp.linalg.inv(g0(x))
ok("TT mode: trace-free", float(abs(jnp.einsum('mn,mn->',gi,hx))/jnp.abs(hx).max()), 1e-10)
Gam0 = cur['christoffel'](x,0.0)
def nabla_h(hf):                     # (nabla_r h)_{mn} for the round metric
    def f(x):
        dh = jax.jacfwd(hf)(x); Gm = cur['christoffel'](x,0.0)
        return jnp.einsum('mnr->rmn',dh) - jnp.einsum('lrm,ln->rmn',Gm,hf(x)) - jnp.einsum('lrn,ml->rmn',Gm,hf(x))
    return f
nh = nabla_h(h)
ok("TT mode: divergence-free", float(jnp.abs(jnp.einsum('rm,rmn->n',gi,nh(x))).max()/jnp.abs(nh(x)).max()), 1e-10)
def rough_laplacian(hf):
    nhf = nabla_h(hf)
    def f(x):
        d = jax.jacfwd(nhf)(x); Gm = cur['christoffel'](x,0.0); n1 = nhf(x)       # d[r,m,n,s]
        nn = (jnp.einsum('rmns->srmn',d) - jnp.einsum('lsr,lmn->srmn',Gm,n1) - jnp.einsum('lsm,rln->srmn',Gm,n1) - jnp.einsum('lsn,rml->srmn',Gm,n1))
        return -jnp.einsum('sr,srmn->mn', jnp.linalg.inv(g0(x)), nn)
    return f
Lh = rough_laplacian(h)(x)
ok("TT mode: L h = 8K h  (lowest TT eigenvalue, Lemma 10.2 is sharp)", rel(Lh, 8*K*hx))

t0=time.time()
hhat = d_eps(fl['ghat'], x)
ok("(1.3a)/(5.6) reconstructed variation  hhat = (L+4K)/(2K) h = 6 h", rel(hhat, 6*hx))
a = d_eps(geo['A'], x)                                                # a = H h in the symmetric coframe gauge
at = d_eps(fl['G'], x)
ok("(1.3b)/(8.10) linearised flow  a_t = H[-4(L+2K)h] = -40K (H h)", rel(at, -40*K*a))
q = d_eps(fl['Q'], x)
print("     |q| =", float(jnp.abs(q).max()), " tr q =", float(jnp.trace(q)), " time %.1fs"%(time.time()-t0), flush=True)

# formula (8.1) for H versus automatic differentiation of the nonlinear Levi-Civita map
e0 = geo['coframe'](x,0.0); E0 = jnp.linalg.inv(e0)                 # E0[nu,b]
H_formula = 0.5*jnp.einsum('icd,rc,sd,rms->im', etaP, E0, E0, nh(x))   # (1/2) eta_i,cd nabla_c h_{mu d}
ok("(8.1) (H h)_ib = (1/2) eta_i,cd nabla_c h_bd  vs AD of g -> A_g^+", rel(a, H_formula))

# Ricci variations and Lemma-level statements
Ric1 = d_eps(cur['ricci'], x); s1 = d_eps(cur['scalar'], x); Ric01 = d_eps(cur['ricci0'], x)
ok("(8.8) TT: Ric' = (1/2)(L+8K)h, s' = 0, Ric_0' = (1/2)(L+2K)h", max(rel(Ric1, 8*K*hx), float(abs(s1))/K, rel(Ric01, 5*K*hx)))
