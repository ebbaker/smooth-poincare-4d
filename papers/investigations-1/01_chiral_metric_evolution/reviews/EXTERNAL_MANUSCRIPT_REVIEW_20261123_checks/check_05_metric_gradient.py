"""First-principles L^2 gradient of P_met: Prop 6.1 (6.2), Thm 10.1 (10.3)-(10.4), Prop 8.3 (Schur averages),
Prop 11.1 ((11.1)-(11.4)) including the end-to-end eps^2 coefficient at conformally flat metrics.
Part of the checks supporting reviews/EXTERNAL_MANUSCRIPT_REVIEW_20261123.md (see README.md in this folder).
Requires numpy, scipy, jax (CPU, float64)."""
import numpy as np, jax, jax.numpy as jnp, time
from sphere_lib import *
rng = np.random.default_rng(5)
def ok(name, err, tol=1e-7): print(f"{'PASS' if err<tol else 'FAIL'}  {name:94s} err={err:.2e}", flush=True)
rel = lambda a,b: float(jnp.abs(a-b).max()/(jnp.abs(b).max()+1e-300))

def geometry_from_coframe(coframe):
    def metric(x, eps): e = coframe(x, eps); return e.T@e
    def christoffel(x, eps):
        g = metric(x, eps); dg = jax.jacfwd(metric)(x, eps)
        return 0.5*jnp.einsum('lk,kmn->lmn', jnp.linalg.inv(g), jnp.einsum('knm->kmn',dg)+dg-jnp.einsum('mnk->kmn',dg))
    def spin_connection(x, eps):
        e = coframe(x, eps); de = jax.jacfwd(coframe)(x, eps); Gam = christoffel(x, eps)
        nab = jnp.einsum('anm->amn',de) - jnp.einsum('lmn,al->amn',Gam,e)
        return -jnp.einsum('amn,nb->abm', nab, jnp.linalg.inv(e))
    def A(x, eps): return -0.5*jnp.einsum('iab,abm->im', etaP, spin_connection(x, eps))
    return dict(coframe=coframe, metric=metric, christoffel=christoffel, spin_connection=spin_connection, A=A)

def grad_Pmet(geo):
    """L^2(g)-gradient of P_met(g) = P_conn(A_g^+) as a covariant symmetric 2-tensor, computed from first principles:
       dP_conn(a) = int sum_i (d_A a)_i ^ Phi_i  (metric-free),  dA_g(v) = H_g v + gauge,  grad = H_g^*( J/sqrt g )."""
    Afun = geo['A']; Ffun = curvature_of(Afun)
    def Phi(x, eps):
        F = Ffun(x, eps); _, Q = mu_and_Q(F)
        return jnp.einsum('ij,jmn->imn', 4*Q-(2.0/3.0)*jnp.trace(Q@Q)*I3, F)
    def Gconn(x, eps):
        Ph = Phi(x, eps); dPh = jax.jacfwd(Phi)(x, eps); A = Afun(x, eps)       # dPh[i,r,s,m]
        J = -0.5*(jnp.einsum('mnrs,irsm->in', eps4, dPh) + jnp.einsum('mnrs,ijk,jm,krs->in', eps4, eps3, A, Ph))
        g = geo['metric'](x, eps)
        return jnp.einsum('nb,ib->in', g, J)/jnp.sqrt(jnp.linalg.det(g))
    def grad(x, eps):
        a = Gconn(x, eps); da = jax.jacfwd(Gconn)(x, eps); Gm = geo['christoffel'](x, eps); A = Afun(x, eps)
        Da = jnp.einsum('imr->rim',da) - jnp.einsum('lrm,il->rim',Gm,a) + jnp.einsum('ijk,jr,km->rim',eps3,A,a)
        e = geo['coframe'](x, eps); E = jnp.linalg.inv(e)
        t = -0.5*jnp.einsum('icd,rc,dn,rim->mn', etaP, E, e, Da)
        return (t+t.T)/2
    return grad, Gconn

x = jnp.array([0.21,-0.33,0.12,0.27])
# ---- consistency of the first-principles connection gradient with the manuscript's flow (6.2)
c0=jnp.array(rng.normal(size=(3,4))); c1=jnp.array(rng.normal(size=(3,4,4))); c2=jnp.array(rng.normal(size=(3,4,4,4)))
geo0 = make_geometry(lambda y: jnp.zeros((4,4)))
a_gen = lambda y: 0.05*(c0 + jnp.einsum('ima,a->im',c1,y) + jnp.einsum('imab,a,b->im',c2,y,y))
Afun = lambda y,e: geo0['A'](y,0.0) + e*a_gen(y)
fl = make_flow(Afun); Ffun = curvature_of(Afun)
def J_over_sqrt_ghat(y, e):
    def Phi(z): F = Ffun(z, e); _, Q = mu_and_Q(F); return jnp.einsum('ij,jmn->imn', 4*Q-(2.0/3.0)*jnp.trace(Q@Q)*I3, F)
    Ph = Phi(y); dPh = jax.jacfwd(Phi)(y); A = Afun(y, e)
    J = -0.5*(jnp.einsum('mnrs,irsm->in', eps4, dPh) + jnp.einsum('mnrs,ijk,jm,krs->in', eps4, eps3, A, Ph))
    gh = fl['ghat'](y, e); return jnp.einsum('nb,ib->in', gh, J)/jnp.sqrt(jnp.linalg.det(gh))
_, Qe = mu_and_Q(Ffun(x,1.0)); print("     finite connection perturbation: eigenvalues of Q =", np.round(np.asarray(jnp.linalg.eigvalsh(Qe)),4))
ok("Prop 6.1 (6.2): -d_A^*[(4Q-(2/3)trQ^2)F] (ghat adjoint) = -(L^2(ghat) gradient of P), finite perturbation", rel(fl['G'](x,1.0), -J_over_sqrt_ghat(x,1.0)))

# ---- Theorem 10.1 as an operator identity on k=2 TT modes: d/deps grad P_met(g0 + eps h) = (L+2K)(L+4K) h = 120 K^2 h
C = weyl5(rng); h = tt_mode(C); geo = make_geometry(h); gradP, _ = grad_Pmet(geo)
t0 = time.time()
ok("grad P_met vanishes at the round metric", float(jnp.abs(gradP(x,0.0)).max()), 1e-9)
ok("Thm 10.1 (10.4): Hess P_met = (L+2K)(L+4K) on k=2 TT mode (= 120 K^2 h), from first principles", rel(d_eps(gradP,x), 120*K**2*h(x)))
print("     time %.1fs"%(time.time()-t0), flush=True)

# ---- Schur-averaged quadratic forms over the 35-dimensional space of k=2 TT modes
basisC = []
M = np.array([weyl5(rng).reshape(-1) for _ in range(60)]); U_, s_, Vt = np.linalg.svd(M, full_matrices=False)
rank = int((s_>1e-9*s_[0]).sum()); print("     dimension of the space of Weyl tensors on R^5:", rank)
num_D = num_H = num_h = 0.0
def Wplus_of(geo, fl):
    def f(y, eps):
        F = fl['F'](y, eps); E = jnp.linalg.inv(geo['coframe'](y, eps))
        Ff = jnp.einsum('ma,nb,imn->iab', E, E, F); Cc = -0.25*jnp.einsum('iab,jab->ij', Ff, etaP)
        return Cc - jnp.trace(Cc)/3*I3
    return f
gi = jnp.linalg.inv(g0(x))
def stats(Cflat):
    hh = tt_mode(Cflat.reshape(5,5,5,5)); ge = make_geometry(hh); f_ = make_flow(ge['A'])
    Dh = d_eps(Wplus_of(ge, f_), x); a = d_eps(ge['A'], x); hx = hh(x)
    return jnp.sum(Dh**2), jnp.einsum('im,in,mn->', a, a, gi), jnp.einsum('mn,rs,mr,ns->', hx, hx, gi, gi)
stats_j = jax.jit(stats)
for n in range(rank):
    d_, h_, n_ = stats_j(jnp.array(Vt[n])); num_D += float(d_); num_H += float(h_); num_h += float(n_)
print("     raw Schur sums: sum|Dh|^2 = %.12g, sum|Hh|^2 = %.12g, sum|h|^2 = %.12g" % (num_D, num_H, num_h))
ok("Thm 10.1 (10.3): int |D h|^2 / int |h|^2 = (L+2K)(L+4K)/16 = 7.5 K^2 on k=2 modes (Schur average)", abs(num_D/num_h/(7.5*K**2)-1))
ok("Prop 8.3: int |H h|^2 / int |h|^2 = (L+4K)/4 = 3K on k=2 modes (Schur average)", abs(num_H/num_h/(3*K)-1))

# ---- Proposition 11.1: flat principal symbol values of D and the end-to-end quadratic gradient at conformally flat metrics
def tf(pairs):
    w = np.zeros((4,4))
    for (a,b,c) in pairs: w[a-1,b-1]+=c; w[b-1,a-1]-=c
    return w
S4P = jnp.array([tf([(1,2,1),(3,4,1)]), tf([(1,3,1),(2,4,-1)]), tf([(1,4,1),(2,3,1)])])
def Dflat(kf, y):
    met = lambda z,e: I4 + e*kf(z); cur = make_curvature(met)
    def Wp(z, e):
        Rl = jnp.einsum('lp,pkmn->lkmn', met(z,e), cur['riemann'](z,e))          # R_{lkmn}; orthonormal coords at e=0
        Cc = jnp.einsum('abcd,iab,jcd->ij', Rl, S4P, S4P)/8.0
        return Cc - jnp.trace(Cc)/3*I3
    return d_eps(Wp, y)
o = jnp.zeros(4); phi = lambda z: z[0]**2/2
exp_ = {0:[0,0,0], 1:[-1/6,1/12,1/12], 2:[1/12,-1/6,1/12], 3:[1/12,1/12,-1/6]}
err = 0.0
for a in range(4):
    Eaa = jnp.zeros((4,4)).at[a,a].set(1.0)
    err = max(err, float(jnp.abs(Dflat(lambda z: phi(z)*Eaa, o) - jnp.diag(jnp.array(exp_[a]))).max()))
ok("Prop 11.1: D_flat(E^aa phi) = 0, diag(-1/6,1/12,1/12), diag(1/12,-1/6,1/12), diag(1/12,1/12,-1/6)", err, 1e-12)
err = 0.0
for a in range(4):
    for b in range(a+1,4):
        Eab = jnp.zeros((4,4)).at[a,b].set(1.0).at[b,a].set(1.0)
        err = max(err, float(jnp.abs(jnp.diag(Dflat(lambda z: phi(z)*Eab, o))).max()))
ok("Prop 11.1: off-diagonal E^(ab) phi give matrices with vanishing diagonal", err, 1e-12)

# end-to-end: g_eps = exp(2 eps f) g0, f = (1/2)(X^1)^2 X^2 ; V(eps) = -grad(P_met/8)(g_eps) at p
def f_conf(y): X = embed(y); return 0.5*X[0]**2*X[1]
geoC = geometry_from_coframe(lambda y,e: jnp.exp(e*f_conf(y))*Omega(y)*I4)
gradC, _ = grad_Pmet(geoC)
p = jnp.zeros(4)
t0=time.time()
V0 = gradC(p, 0.0); V1 = d_eps(gradC, p)
V2 = jax.jvp(lambda e: jax.jvp(lambda e2: gradC(p, e2), (e,), (1.0,))[1], (0.0,), (1.0,))[1]/2
Vframe = -(V2/8)/Omega(p)**2                                   # orthonormal-frame components at p of the eps^2 coefficient of -grad(P_met/8)
print("     eps^2 coefficient of -grad(P_met/8) at p, orthonormal frame, times K:\n", np.round(np.asarray(Vframe*K),10))
ok("Prop 11.1: grad P_met(g_eps) = O(eps^2) along the conformal family", max(float(jnp.abs(V0).max()), float(jnp.abs(V1).max())), 1e-9)
ok("(11.3)-(11.4): -grad(P_met/8)(g_eps)(p) = (eps^2/K) diag(0,1/3,-1/6,-1/6) + O(eps^3), first principles", float(jnp.abs(Vframe*K - jnp.diag(jnp.array([0,1/3,-1/6,-1/6]))).max()), 1e-8)
print("     time %.1fs"%(time.time()-t0), flush=True)
