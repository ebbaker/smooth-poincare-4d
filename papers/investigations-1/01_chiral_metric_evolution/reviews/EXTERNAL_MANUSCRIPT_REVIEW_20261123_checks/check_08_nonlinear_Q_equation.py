"""Part of the checks supporting reviews/EXTERNAL_MANUSCRIPT_REVIEW_20261123.md (see README.md in this folder).
Requires numpy, scipy, jax (CPU, float64).

Section 6 (statements present since commit 2c73984, unchanged in 04ef8d7): exact nonlinear statements at a FINITE distance from the round connection.
  Prop "Nonlinear defect and fixed volume form":  velocity v_ib = 4 (C^c)_ik F_k,cb ;  sum_i v_i ^ F_i = 0 ;  d mu/dt = 0 ;
     Q_t = L_Q(Delta_A Q) - 24 K sqrt(det Q)(Q-I) + 4 sum X_c^2 - (4/3) sum tr(Q X_c) X_c - (4/3)|nabla Q|^2 Q + sum [X_c, Xi_c]
  Prop "Horizontal remainder and reconstruction":  nabla Q = 2 S T S - (2/3) tr(QT) Q,  |nabla Q| <= 6|T|,  |b| <= 2 sqrt3 |T|
  Prop "Curvature controlled by the strain derivative": the two pointwise inequalities (evaluated, not proved)."""
import numpy as np, jax, jax.numpy as jnp
from sphere_lib import *
rng = np.random.default_rng(29)
def ok(name, err, tol=1e-7): print(f"{'PASS' if err<tol else 'FAIL'}  {name:98s} err={err:.2e}", flush=True)
rel = lambda a,b: float(jnp.abs(a-b).max()/(jnp.abs(b).max()+1e-300))
x = jnp.array([0.21,-0.33,0.12,0.27])
geo0 = make_geometry(lambda y: jnp.zeros((4,4))); A0f = lambda y: geo0['A'](y,0.0)
c0=jnp.array(rng.normal(size=(3,4))); c1=jnp.array(rng.normal(size=(3,4,4))); c2=jnp.array(rng.normal(size=(3,4,4,4))); c3=jnp.array(rng.normal(size=(3,4,4,4,4)))
a_gen = lambda y: 0.07*(c0 + jnp.einsum('ima,a->im',c1,y) + jnp.einsum('imab,a,b->im',c2,y,y) + jnp.einsum('imabc,a,b,c->im',c3,y,y,y))
Af = lambda y: A0f(y) + a_gen(y)                      # a definite connection at finite distance from round
fl = make_flow(lambda y,e: Af(y))
Ff = lambda y: fl['F'](y,0.0); Qf = lambda y: fl['Q'](y,0.0); gh = lambda y: fl['ghat'](y,0.0); Gf = lambda y: fl['G'](y,0.0)
print("     eigenvalues of Q at the test point:", np.round(np.asarray(jnp.linalg.eigvalsh(Qf(x))),4))

def chris(y):
    g = gh(y); dg = jax.jacfwd(gh)(y)
    return 0.5*jnp.einsum('lk,kmn->lmn', jnp.linalg.inv(g), jnp.einsum('knm->kmn',dg)+dg-jnp.einsum('mnk->kmn',dg))
def msqrt(Q):
    q = Q - I3; out = I3; term = I3; c = 1.0
    for n in range(1, 40):
        c = c*(0.5-(n-1))/n; term = term@q; out = out + c*term
    return out
Sf = lambda y: msqrt(Qf(y))
def nab_mat(Mf):                                      # joint covariant derivative of an End(E)-valued function: out[c,i,j]
    def f(y):
        dM = jax.jacfwd(Mf)(y); A = Af(y); M = Mf(y)
        return jnp.einsum('ijc->cij',dM) + jnp.einsum('ikl,kc,lj->cij', eps3, A, M) + jnp.einsum('jkl,kc,il->cij', eps3, A, M)
    return f
Xf = nab_mat(Qf)
def lap_Q(y):                                         # Delta_A Q = ghat^{cd} nabla_c nabla_d Q
    dX = jax.jacfwd(Xf)(y); A = Af(y); X = Xf(y); Gm = chris(y)       # dX[d,i,j,c]
    DD = (jnp.einsum('dijc->cdij',dX) - jnp.einsum('ecd,eij->cdij',Gm,X)
          + jnp.einsum('ikl,kc,dlj->cdij', eps3, A, X) + jnp.einsum('jkl,kc,dil->cdij', eps3, A, X))
    return jnp.einsum('cd,cdij->ij', jnp.linalg.inv(gh(y)), DD)
def star3(Xi, g):
    gi = jnp.linalg.inv(g); return jnp.sqrt(jnp.linalg.det(g))/6.0*jnp.einsum('mnrs,ma,nb,rc,iabc->is', eps4, gi, gi, gi, Xi)
def SigmaA(y): return -jnp.einsum('ij,jmn->imn', jnp.linalg.inv(Sf(y)), Ff(y))/K
def Tdefect(y):
    Sg = SigmaA(y); dS = jax.jacfwd(SigmaA)(y); A = Af(y)
    d = jnp.einsum('inrm->imnr',dS) + jnp.einsum('irmn->imnr',dS) + jnp.einsum('imnr->imnr',dS)
    AS = jnp.einsum('jm,knr->jkmnr',A,Sg) + jnp.einsum('jn,krm->jkmnr',A,Sg) + jnp.einsum('jr,kmn->jkmnr',A,Sg)
    return d + jnp.einsum('ijk,jkmnr->imnr', eps3, AS)
def b_of(y):                                          # b = A - Gamma^+ = (1/2)(C+1) * T_A  (Prop 4.4), tensorially
    g = gh(y); Sg = SigmaA(y); sT = star3(Tdefect(y), g)
    bS = jnp.einsum('jm,knr->jkmnr',sT,Sg) + jnp.einsum('jn,krm->jkmnr',sT,Sg) + jnp.einsum('jr,kmn->jkmnr',sT,Sg)
    CsT = star3(jnp.einsum('ijk,jkmnr->imnr', eps3, bS), g)
    return 0.5*(CsT + sT)
ad = lambda u: jnp.einsum('ijk,j->ik', eps3, u)       # ad(u) v = u x v

g = gh(x); gi = jnp.linalg.inv(g); Q = Qf(x); S = Sf(x); X = Xf(x); F = Ff(x); A = Af(x)
C = X - jnp.einsum('cij,ji->c', X, Q)[:,None,None]*I3/3.0
ok("velocity:  v_ib = 4 (C^c)_ik F_k,cb", rel(Gf(x), 4*jnp.einsum('cd,dik,kcb->ib', gi, C, F)))
v = Gf(x)
three = jnp.einsum('im,inr->mnr', v, F) + jnp.einsum('in,irm->mnr', v, F) + jnp.einsum('ir,imn->mnr', v, F)
ok("sum_i v_i ^ F_i = 0 pointwise", float(jnp.abs(three).max()/(jnp.abs(v).max()*jnp.abs(F).max())), 1e-10)
flt = make_flow(lambda y,e: Af(y) + e*Gf(y))          # move the connection along its own flow velocity
mu_t = d_eps(lambda y,e: mu_and_Q(flt['F'](y,e))[0], x); Qt = d_eps(flt['Q'], x); ght = d_eps(flt['ghat'], x)
ok("(pointwise volume) d mu_A/dt = 0 along the flow", float(abs(mu_t)/(mu_and_Q(F)[0]*jnp.abs(v).max())), 1e-10)
ok("tr_ghat (d ghat/dt) = 0 along the flow", float(abs(jnp.einsum('mn,mn->', gi, ght))/jnp.abs(gi@ght).max()), 1e-9)

LQ = lambda T: 2*(Q@T+T@Q) - (4.0/3.0)*jnp.trace(Q@T)*Q
dS_ = nab_mat(Sf)(x); b = b_of(x)
Xi = 2*(jnp.einsum('cik,kj->cij', dS_, S) - jnp.einsum('ik,ckj->cij', S, dS_)) + 4*jnp.einsum('ik,ckl,lj->cij', S, jax.vmap(ad, in_axes=1)(b), S)
XX = jnp.einsum('cd,cik,dkj->ij', gi, X, X)
trQX = jnp.einsum('cij,ji->c', X, Q)
rhs = (LQ(lap_Q(x)) - 24*K*jnp.sqrt(jnp.linalg.det(Q))*(Q-I3) + 4*XX - (4.0/3.0)*jnp.einsum('cd,c,dij->ij', gi, trQX, X)
       - (4.0/3.0)*jnp.einsum('cd,cij,dij->', gi, X, X)*Q + jnp.einsum('cd,cik,dkj->ij', gi, X, Xi) - jnp.einsum('cd,dik,ckj->ij', gi, Xi, X))
print("     sizes: |Q_t| = %.4g, |L_Q(Delta Q)| = %.4g, reaction = %.4g, |[X,Xi]| = %.4g" % (float(jnp.abs(Qt).max()), float(jnp.abs(LQ(lap_Q(x))).max()), float(jnp.abs(24*K*jnp.sqrt(jnp.linalg.det(Q))*(Q-I3)).max()), float(jnp.abs(jnp.einsum('cd,cik,dkj->ij', gi, X, Xi) - jnp.einsum('cd,dik,ckj->ij', gi, Xi, X)).max())))
ok("exact nonlinear Q equation (flow:nonlinear-Q), all terms, finite perturbation", rel(Qt, rhs))

# strain T and the eigenvalue-floor-free bounds
Si = jnp.linalg.inv(S)
T = 0.5*jnp.einsum('ik,ckl,lj->cij', Si, X, Si); T = T - jnp.einsum('cii->c', T)[:,None,None]*I3/3.0
ok("(transport:inverse-bounds) nabla Q = 2 S T S - (2/3) tr(Q T) Q", rel(2*jnp.einsum('ik,ckl,lj->cij', S, T, S) - (2.0/3.0)*jnp.einsum('cij,ji->c', T, Q)[:,None,None]*Q, X))
nrm = lambda Z: float(jnp.sqrt(jnp.einsum('cd,cij,dij->', gi, Z, Z)))
nb = float(jnp.sqrt(jnp.einsum('mn,im,in->', gi, b, b)))
print("     |nabla Q| / (6|T|) = %.4f (<=1),   |b| / (2 sqrt3 |T|) = %.4f (<=1)" % (nrm(X)/(6*nrm(T)), nb/(2*np.sqrt(3)*nrm(T))))
ok("inequalities |nabla Q| <= 6|T| and |b| <= 2 sqrt3 |T| hold at the sample point", max(0.0, nrm(X)/(6*nrm(T))-1, nb/(2*np.sqrt(3)*nrm(T))-1))

# pointwise form of the energy identity (flow:exact-energy-Q):   <q, Q_t> = div( <q, L_Q nabla Q> ) - R_Q(nabla Q) - 24 K sqrt(det Q) |q|^2,
# with R_Q(X) = sum_c <X_c, L_Q X_c> - <q, [X_c, Xi_c]>  (eq:stationary-derivative-form), contractions in the reconstructed metric
def w_dens(y):                                           # sqrt(ghat) ghat^{cd} <q, L_Q X_d>
    gy = gh(y); Qy = Qf(y); Xy = Xf(y); qy = Qy - I3
    LQX = 2*(jnp.einsum('ik,dkj->dij', Qy, Xy) + jnp.einsum('dik,kj->dij', Xy, Qy)) - (4.0/3.0)*jnp.einsum('dij,ji->d', Xy, Qy)[:,None,None]*Qy
    return jnp.sqrt(jnp.linalg.det(gy))*jnp.einsum('cd,d->c', jnp.linalg.inv(gy), jnp.einsum('ij,dij->d', qy, LQX))
div_w = float(jnp.trace(jax.jacfwd(w_dens)(x))/jnp.sqrt(jnp.linalg.det(g)))
q = Q - I3
LQXc = 2*(jnp.einsum('ik,dkj->dij', Q, X) + jnp.einsum('dik,kj->dij', X, Q)) - (4.0/3.0)*trQX[:,None,None]*Q
comm = jnp.einsum('cik,ckj->cij', X, Xi) - jnp.einsum('cik,ckj->cij', Xi, X)
RQ = float(jnp.einsum('cd,cij,dij->', gi, X, LQXc) - jnp.einsum('cd,ij,cdij->', gi, q, jnp.einsum('cik,dkj->cdij', X, Xi) - jnp.einsum('dik,ckj->cdij', Xi, X)))
lhs_e = float(jnp.sum(q*Qt)); rhs_e = div_w - RQ - 24*K*float(jnp.sqrt(jnp.linalg.det(Q)))*float(jnp.sum(q*q))
print("     <q,Q_t> = %.10f ;  div - R_Q - reaction = %.10f   [div = %.4f, R_Q = %.4f, |nabla Q|^2 = %.4f]" % (lhs_e, rhs_e, div_w, RQ, float(jnp.einsum('cd,cij,dij->', gi, X, X))))
ok("pointwise energy identity behind (flow:exact-energy-Q), with the tensorial Xi", abs(lhs_e-rhs_e)/abs(lhs_e))
