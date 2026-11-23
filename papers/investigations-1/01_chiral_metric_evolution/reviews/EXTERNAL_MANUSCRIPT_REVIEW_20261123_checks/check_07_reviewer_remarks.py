"""Part of the checks supporting reviews/EXTERNAL_MANUSCRIPT_REVIEW_20261123.md (see README.md in this folder).
Requires numpy, scipy, jax (CPU, float64).

Checks of the reviewer's structural remarks (not statements of the manuscript):
   (R1) exact velocity  A_t = -K *_ghat { [ d_A G(S) - G(S) S^{-1} d_A S ] ^ Sigma_A },  G(S) = 4 S^3 - (2/3) tr(S^4) S
   (R2) exact defect    T_A = d_A Sigma_A = - S^{-1} (d_A S) ^ Sigma_A
   (R3) linearisation   a_t = 8K * T'(a) = 8K b'(a),  b = A - Gamma^+_{ghat_A},  for an ARBITRARY connection variation
   (R4) Schouten form   hhat = (2/K) P'(h),   a_t = H[ -16 (P - (K/2) g)' ]  for arbitrary metric variations"""
import numpy as np, jax, jax.numpy as jnp
from sphere_lib import *
rng = np.random.default_rng(17)
def ok(name, err, tol=1e-7): print(f"{'PASS' if err<tol else 'FAIL'}  {name:94s} err={err:.2e}", flush=True)
rel = lambda a,b: float(jnp.abs(a-b).max()/(jnp.abs(b).max()+1e-300))
x = jnp.array([0.21,-0.33,0.12,0.27])
geo0 = make_geometry(lambda y: jnp.zeros((4,4))); A0f = lambda y: geo0['A'](y,0.0)
c0=jnp.array(rng.normal(size=(3,4))); c1=jnp.array(rng.normal(size=(3,4,4))); c2=jnp.array(rng.normal(size=(3,4,4,4))); c3=jnp.array(rng.normal(size=(3,4,4,4,4)))
a_gen = lambda y: 0.06*(c0 + jnp.einsum('ima,a->im',c1,y) + jnp.einsum('imab,a,b->im',c2,y,y) + jnp.einsum('imabc,a,b,c->im',c3,y,y,y))
Afun = lambda y,e: A0f(y) + e*a_gen(y); fl = make_flow(Afun)

def msqrt(Q):                                    # Q^{1/2} by the binomial series about I (|Q-I| < 1), AD-friendly
    q = Q - I3; out = I3; term = I3; c = 1.0
    for n in range(1, 30):
        c = c*(0.5-(n-1))/n; term = term@q; out = out + c*term
    return out
def S_of(y, e): return msqrt(fl['Q'](y, e))
def G_of(y, e): S = S_of(y, e); S2 = S@S; return 4*S2@S - (2.0/3.0)*jnp.trace(S2@S2)*S
def dA_mat(Mf, y, e):                            # covariant derivative of an End(E)-valued function: out[i,j,mu]
    dM = jax.jacfwd(lambda z: Mf(z, e))(y); A = Afun(y, e); M = Mf(y, e)
    return dM + jnp.einsum('ikl,km,lj->ijm', eps3, A, M) + jnp.einsum('jkl,km,il->ijm', eps3, A, M)
def SigmaA(y, e): return -jnp.einsum('ij,jmn->imn', jnp.linalg.inv(S_of(y, e)), fl['F'](y, e))/K
def wedge13(M, Sg):                              # (M ^ Sigma)_{i, mu nu rho} for M[i,j,mu], Sigma[j,nu,rho]
    return jnp.einsum('ijm,jnr->imnr', M, Sg) + jnp.einsum('ijn,jrm->imnr', M, Sg) + jnp.einsum('ijr,jmn->imnr', M, Sg)
def star3(Xi, gh):                               # (*Xi)_s = (1/6) sqrt(g) eps_{mnrs} Xi^{mnr}
    gi = jnp.linalg.inv(gh)
    return jnp.sqrt(jnp.linalg.det(gh))/6.0*jnp.einsum('mnrs,ma,nb,rc,iabc->is', eps4, gi, gi, gi, Xi)
def velocity_formula(y, e):
    S = S_of(y, e); M = dA_mat(G_of, y, e) - jnp.einsum('ik,klm->ilm', G_of(y, e)@jnp.linalg.inv(S), dA_mat(S_of, y, e))
    return -K*star3(wedge13(M, SigmaA(y, e)), fl['ghat'](y, e))
def Tdefect(y, e):                               # d_A Sigma_A as a three-form, computed directly
    Sg = SigmaA(y, e); dS = jax.jacfwd(lambda z: SigmaA(z, e))(y); A = Afun(y, e)
    d = jnp.einsum('inrm->imnr',dS) + jnp.einsum('irmn->imnr',dS) + jnp.einsum('imnr->imnr',dS)
    AS = jnp.einsum('jm,knr->jkmnr',A,Sg) + jnp.einsum('jn,krm->jkmnr',A,Sg) + jnp.einsum('jr,kmn->jkmnr',A,Sg)
    return d + jnp.einsum('ijk,jkmnr->imnr', eps3, AS)
E1 = 1.0
print("     finite perturbation: eigenvalues of Q =", np.round(np.asarray(jnp.linalg.eigvalsh(fl['Q'](x,E1))),4))
ok("(R1) exact nonlinear velocity formula in terms of d_A S", rel(velocity_formula(x,E1), fl['G'](x,E1)))
Sx = S_of(x,E1)
ok("(R2) T_A = -S^{-1}(d_A S) ^ Sigma_A  [equivalent to (4.20)]", rel(Tdefect(x,E1), -wedge13(jnp.einsum('ik,klm->ilm', jnp.linalg.inv(Sx), dA_mat(S_of, x, E1)), SigmaA(x,E1))))
# (R3) linearisation
at = d_eps(fl['G'], x)
starT1 = jax.jvp(lambda e: star3(Tdefect(x, e), fl['ghat'](x, e)), (0.0,), (1.0,))[1]
ok("(R3) a_t = 8K * T'(a) for an arbitrary connection variation a", rel(at, 8*K*starT1))
Cop = lambda b: jnp.einsum('ijk,kdc,jd->ic', eps3, etaP, b)
E0 = jnp.linalg.inv(geo0['coframe'](x,0.0))
to_frame = lambda w: jnp.einsum('im,ma->ia', w, E0)
sT = to_frame(starT1); b1 = 0.5*(Cop(sT)+sT)
ok("(R3) *T' lies in the +1 eigenspace of the operator C of Prop 4.4, hence b' = a_t/(8K)", max(rel(Cop(sT), sT), rel(8*K*b1, to_frame(at))))

# (R4) Schouten-tensor form of (5.5) and (8.15), arbitrary metric variation
hg = poly_sym(rng, 0.3); geo = make_geometry(hg); flm = make_flow(geo['A']); cur = make_curvature(geo['metric'])
def schouten(y, e): return 0.5*(cur['ricci'](y, e) - cur['scalar'](y, e)/6*geo['metric'](y, e))
ok("(R4) Schouten tensor of the round metric is (K/2) g0", rel(schouten(x,0.0), K/2*g0(x)))
P1 = d_eps(schouten, x)
ok("(R4) hhat = (2/K) P'(h)  for arbitrary h   [equivalent to (5.5)]", rel(d_eps(flm['ghat'],x), 2/K*P1))
cur0 = make_curvature(geo0['metric'])
def Hop(kf):
    def f(y):
        dk = jax.jacfwd(kf)(y); Gm = cur0['christoffel'](y,0.0); kv = kf(y)
        nk = jnp.einsum('mnr->rmn',dk) - jnp.einsum('lrm,ln->rmn',Gm,kv) - jnp.einsum('lrn,ml->rmn',Gm,kv)
        Ef = jnp.linalg.inv(geo0['coframe'](y,0.0)); return 0.5*jnp.einsum('icd,rc,sd,rms->im', etaP, Ef, Ef, nk)
    return f
kS = lambda y: -16*(d_eps(schouten, y) - K/2*hg(y))
ok("(R4) a_t = H[-16 (P - (K/2) g)'] = H[-8K (hhat - h)]  for arbitrary h   [equivalent to (8.15)]", rel(d_eps(flm['G'],x), Hop(kS)(x)))

# simplified form of (R1): [d_A G - G S^{-1} d_A S] = 4[(d_A S) S^2 + S (d_A S) S] - (8/3) tr(S^3 d_A S) S, and tr(S d_A S) = 0
dS = dA_mat(S_of, x, E1); S2 = Sx@Sx
lhsM = dA_mat(G_of, x, E1) - jnp.einsum('ik,klm->ilm', G_of(x,E1)@jnp.linalg.inv(Sx), dS)
rhsM = 4*(jnp.einsum('ikm,kl->ilm', dS, S2) + jnp.einsum('ik,klm,lj->ijm', Sx, dS, Sx)) - (8.0/3.0)*jnp.einsum('kl,lkm->m', S2@Sx, dS)[None,None,:]*Sx[:,:,None]
ok("(R1') d_A G - G S^{-1} d_A S = 4[(d_A S)S^2 + S(d_A S)S] - (8/3) tr(S^3 d_A S) S", rel(lhsM, rhsM))
ok("(R1') tr(S d_A S) = 0  (from tr Q = 3)", float(jnp.abs(jnp.einsum('kl,lkm->m', Sx, dS)).max()/jnp.abs(dS).max()), 1e-10)
