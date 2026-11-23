"""Round S^4: generic local TT tensors, arbitrary metric variations, arbitrary connection variations:
(5.5), (5.6), (7.5), (8.1), (8.8), (8.9), (8.10), (8.15), (8.16).
Part of the checks supporting reviews/EXTERNAL_MANUSCRIPT_REVIEW_20261123.md (see README.md in this folder).
Requires numpy, scipy, jax (CPU, float64)."""
import numpy as np, jax, jax.numpy as jnp, time
from sphere_lib import *
rng = np.random.default_rng(11)
def ok(name, err, tol=1e-7): print(f"{'PASS' if err<tol else 'FAIL'}  {name:92s} err={err:.2e}", flush=True)
rel = lambda a,b: float(jnp.abs(a-b).max()/(jnp.abs(b).max()+1e-300))
x = jnp.array([0.21,-0.33,0.12,0.27])

geo0 = make_geometry(lambda x: jnp.zeros((4,4))); cur0 = make_curvature(geo0['metric'])
def Gam0(x): return cur0['christoffel'](x,0.0)
def nabla2(hf):                           # (nabla_r h)_{mn}, round metric
    def f(x):
        dh = jax.jacfwd(hf)(x); Gm = Gam0(x); hv = hf(x)
        return jnp.einsum('mnr->rmn',dh) - jnp.einsum('lrm,ln->rmn',Gm,hv) - jnp.einsum('lrn,ml->rmn',Gm,hv)
    return f
def rough_laplacian(hf):
    nhf = nabla2(hf)
    def f(x):
        d = jax.jacfwd(nhf)(x); Gm = Gam0(x); n1 = nhf(x)
        nn = (jnp.einsum('rmns->srmn',d) - jnp.einsum('lsr,lmn->srmn',Gm,n1) - jnp.einsum('lsm,rln->srmn',Gm,n1) - jnp.einsum('lsn,rml->srmn',Gm,n1))
        return -jnp.einsum('sr,srmn->mn', jnp.linalg.inv(g0(x)), nn)
    return f
def Hop(kf):                              # formula (8.1): (H k)_{i mu} = (1/2) eta_i,cd E_c^r E_d^s (nabla_r k)_{mu s}
    nk = nabla2(kf)
    def f(x):
        E0 = jnp.linalg.inv(geo0['coframe'](x,0.0))
        return 0.5*jnp.einsum('icd,rc,sd,rms->im', etaP, E0, E0, nk(x))
    return f

# ================= Test A: generic *local* TT tensors (all rough-Laplacian frequencies at once)
def weyl4(rng):
    A = rng.normal(size=(4,4,4,4))
    R = A - A.transpose(1,0,2,3); R = R - R.transpose(0,1,3,2); R = R + R.transpose(2,3,0,1)
    R = R - (R + R.transpose(0,2,3,1) + R.transpose(0,3,1,2))/3.0
    I=np.eye(4); Ric=np.einsum('abad->bd',R); s=np.trace(Ric)
    return R - (np.einsum('ac,bd->abcd',I,Ric)-np.einsum('ad,bc->abcd',I,Ric)+np.einsum('bd,ac->abcd',I,Ric)-np.einsum('bc,ad->abcd',I,Ric))/2 + s/6*(np.einsum('ac,bd->abcd',I,I)-np.einsum('ad,bc->abcd',I,I))
Ws = [jnp.array(weyl4(rng)) for _ in range(3)]; ks = [jnp.array(rng.normal(size=4)) for _ in range(3)]; ph = rng.normal(size=3)
def Phi(x): return sum(Ws[n]*jnp.sin(1.3*jnp.dot(ks[n],x)+ph[n]) for n in range(3))      # Weyl-type potential
def k_flat(x):                            # k_ab = d_c d_d Phi_{acbd}: symmetric, trace-free, divergence-free on flat R^4
    return jnp.einsum('acbdcd->ab', jax.hessian(Phi)(x))
def hTT(x): return k_flat(x)/Omega(x)**2  # conformal weight making it TT for g0 = Omega^2 delta in dimension four
hx = hTT(x); gi = jnp.linalg.inv(g0(x)); nh = nabla2(hTT)(x)
ok("local TT tensor: trace-free and divergence-free for the round metric", max(float(abs(jnp.einsum('mn,mn->',gi,hx))/jnp.abs(hx).max()), float(jnp.abs(jnp.einsum('rm,rmn->n',gi,nh)).max()/jnp.abs(nh).max())), 1e-9)
geo = make_geometry(hTT); fl = make_flow(geo['A']); cur = make_curvature(geo['metric'])
Lh_f = rough_laplacian(hTT); Lh = Lh_f(x)
print("     |Lh|/|h| =", float(jnp.abs(Lh).max()/jnp.abs(hx).max()), "(not an eigentensor: generic frequency content)")
t0=time.time()
ok("(5.6)/(1.3a) hhat = (L+4K)h/(2K), generic local TT h", rel(d_eps(fl['ghat'],x), (Lh+4*K*hx)/(2*K)))
ok("(8.8) Ric_0' = (L+2K)h/2, s' = 0, generic local TT h", max(rel(d_eps(cur['ricci0'],x), (Lh+2*K*hx)/2), float(abs(d_eps(cur['scalar'],x)))/float(jnp.abs(Lh).max())))
target = Hop(lambda y: -4*(Lh_f(y)+2*K*hTT(y)))(x)
ok("(8.10)/(1.3b) a_t = H[-4(L+2K)h] exactly in the symmetric coframe gauge, generic local TT h", rel(d_eps(fl['G'],x), target))
# Proposition 8.3 as a pointwise operator identity: H^* H h = (L+4K) h / 4
def Hstar(af):
    def f(x):
        da = jax.jacfwd(af)(x); Gm = Gam0(x); av = af(x); A0 = geo0['A'](x,0.0)
        Da = jnp.einsum('imr->rim',da) - jnp.einsum('lrm,il->rim',Gm,av) + jnp.einsum('ijk,jr,km->rim',eps3,A0,av)
        e0 = geo0['coframe'](x,0.0); E0 = jnp.linalg.inv(e0)
        t = -0.5*jnp.einsum('icd,rc,dn,rim->mn', etaP, E0, e0, Da)
        return (t+t.T)/2
    return f
ok("(8.16) H^*H h = (L+4K)h/4, generic local TT h", rel(Hstar(Hop(hTT))(x), (Lh+4*K*hx)/4))
print("     time %.1fs"%(time.time()-t0), flush=True)

# ================= Test B: generic (non-TT) metric variation
hg = poly_sym(rng, 0.3)
geo = make_geometry(hg); fl = make_flow(geo['A']); cur = make_curvature(geo['metric'])
hx = hg(x); Ric01_f = lambda y: d_eps(cur['ricci0'], y); s1_f = lambda y: d_eps(cur['scalar'], y)
Ric01 = Ric01_f(x); s1 = s1_f(x); Ric1 = d_eps(cur['ricci'], x)
ok("(5.5) hhat = h + Ric_0'/K + s' g0/(12K) = Ric'/K - 2h - s' g0/(6K), arbitrary h", max(rel(d_eps(fl['ghat'],x), hx+Ric01/K+s1/(12*K)*g0(x)), rel(d_eps(fl['ghat'],x), Ric1/K-2*hx-s1/(6*K)*g0(x))))
kpred = lambda y: -8*Ric01_f(y) - (2.0/3.0)*s1_f(y)*g0(y)
ok("(8.15) a_t = H[-8 Ric_0' - (2/3) s' g0], arbitrary h", rel(d_eps(fl['G'],x), Hop(kpred)(x)))
ok("(8.1) H h (formula) = AD of g -> A_g^+ in symmetric gauge, arbitrary h", rel(d_eps(geo['A'],x), Hop(hg)(x)))
# linearised Christoffel/Ricci formula quoted in the proof of Prop 5.2
def ric_formula(x):
    nhf = nabla2(hg)
    d = jax.jacfwd(nhf)(x); Gm = Gam0(x); n1 = nhf(x)
    nn = (jnp.einsum('rmns->srmn',d) - jnp.einsum('lsr,lmn->srmn',Gm,n1) - jnp.einsum('lsm,rln->srmn',Gm,n1) - jnp.einsum('lsn,rml->srmn',Gm,n1))   # nn[s,r,m,n] = nabla_s nabla_r h_mn
    gi = jnp.linalg.inv(g0(x)); trh = lambda y: jnp.einsum('mn,mn->', jnp.linalg.inv(g0(y)), hg(y))
    Htr = jax.hessian(trh)(x) - jnp.einsum('lmn,l->mn', Gm, jax.grad(trh)(x))
    t = jnp.einsum('as,sija->ij', gi, nn)        # nabla^a nabla_i h_{ja}
    return 0.5*(t + t.T - jnp.einsum('sr,srij->ij', gi, nn) - Htr)
ok("2Ric'_ij = nabla^a nabla_i h_ja + nabla^a nabla_j h_ia - nabla^a nabla_a h_ij - nabla_i nabla_j tr h", rel(Ric1, ric_formula(x)))
# (8.9): Q' = (2/K) W^+'
def Wplus(x, eps):
    F = fl['F'](x, eps); E = jnp.linalg.inv(geo['coframe'](x, eps))
    Ff = jnp.einsum('ma,nb,imn->iab', E, E, F)
    C = -0.25*jnp.einsum('iab,jab->ij', Ff, etaP)
    return C - jnp.trace(C)/3*I3
ok("(8.9) dQ = (2/K) dW^+ for metric-induced variations, arbitrary h", rel(d_eps(fl['Q'],x), 2/K*d_eps(Wplus,x)))

# ================= Test C: Proposition 7.1 for an arbitrary connection variation
c0=jnp.array(rng.normal(size=(3,4))); c1=jnp.array(rng.normal(size=(3,4,4))); c2=jnp.array(rng.normal(size=(3,4,4,4))); c3=jnp.array(rng.normal(size=(3,4,4,4,4)))
def a_gen(x): return c0 + jnp.einsum('ima,a->im',c1,x) + jnp.einsum('imab,a,b->im',c2,x,x) + jnp.einsum('imabc,a,b,c->im',c3,x,x,x)
A0f = lambda y: geo0['A'](y,0.0)
fl1 = make_flow(lambda y,e: A0f(y)+e*a_gen(y))
q_f = lambda y: d_eps(fl1['Q'], y); at_f = lambda y: d_eps(fl1['G'], y)
fl2 = make_flow(lambda y,e: A0f(y)+e*at_f(y))
qt = d_eps(fl2['Q'], x)
def LE(qf):                               # rough Laplacian on Sym^2_0 E with the round chiral connection
    def Dq(y):
        dq = jax.jacfwd(qf)(y); A0 = A0f(y); qv = qf(y)
        return jnp.einsum('ijr->rij',dq) + jnp.einsum('ikl,kr,lj->rij',eps3,A0,qv) + jnp.einsum('jkl,kr,il->rij',eps3,A0,qv)
    def f(y):
        d = jax.jacfwd(Dq)(y); A0 = A0f(y); D1 = Dq(y); Gm = Gam0(y)
        DD = (jnp.einsum('rijs->srij',d) - jnp.einsum('lsr,lij->srij',Gm,D1) + jnp.einsum('ikl,ks,rlj->srij',eps3,A0,D1) + jnp.einsum('jkl,ks,ril->srij',eps3,A0,D1))
        return -jnp.einsum('sr,srij->ij', jnp.linalg.inv(g0(y)), DD)
    return f
t0=time.time(); qx = q_f(x)
ok("(7.4) q symmetric and trace-free", max(float(jnp.abs(qx-qx.T).max()), float(abs(jnp.trace(qx))))/float(jnp.abs(qx).max()), 1e-9)
ok("(7.5) q_t = -4 (L_E + 6K) q for an ARBITRARY connection variation a", rel(qt, -4*(LE(q_f)(x)+6*K*qx)))
# volume velocity: d mu (a_t) = 0 to first order
mu_f2 = lambda y,e: mu_and_Q(fl2['F'](y,e))[0]
ok("Prop 7.1: linearised local volume velocity vanishes", float(abs(d_eps(mu_f2,x)))/float(jnp.abs(at_f(x)).max()), 1e-9)
print("     time %.1fs"%(time.time()-t0), flush=True)
