"""Nonlinear identities: Lemma 8.1 (8.3) at a non-round metric; pointwise form of (6.5); Prop 4.3 (4.12)-(4.18);
second-order expansions (5.17), (9.8), all against an Urbantke-formula reconstruction.
Part of the checks supporting reviews/EXTERNAL_MANUSCRIPT_REVIEW_20261123.md (see README.md in this folder).
Requires numpy, scipy, jax (CPU, float64)."""
import numpy as np, jax, jax.numpy as jnp
from sphere_lib import *
rng = np.random.default_rng(23)
def ok(name, err, tol=1e-7): print(f"{'PASS' if err<tol else 'FAIL'}  {name:94s} err={err:.2e}", flush=True)
rel = lambda a,b: float(jnp.abs(a-b).max()/(jnp.abs(b).max()+1e-300))
x = jnp.array([0.21,-0.33,0.12,0.27])

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

# ================= Test D: nonlinear Bianchi identity (8.3) at a metric far from round
hg = poly_sym(rng, 0.25)
geo = make_geometry(hg); EPS = 0.9      # g = g0 + EPS*h to O(EPS^5) in the coframe series; any Riemannian metric will do
assert float(jnp.linalg.eigvalsh(geo['metric'](x,EPS)).min())>0.1
cur = make_curvature(geo['metric']); Ffun = curvature_of(geo['A'])
def Psi_dens_up(y, eps):                 # sqrt(g) (W^+ Sigma^+)_i^{mu nu}
    e = geo['coframe'](y, eps); E = jnp.linalg.inv(e); g = e.T@e; gi = jnp.linalg.inv(g)
    Ff = jnp.einsum('ma,nb,imn->iab', E, E, Ffun(y, eps))
    C = -0.25*jnp.einsum('iab,jab->ij', Ff, etaP); W = C - jnp.trace(C)/3*I3
    Psi = jnp.einsum('ij,jab,am,bn->imn', W, etaP, e, e)
    return jnp.sqrt(jnp.linalg.det(g))*jnp.einsum('ma,nb,iab->imn', gi, gi, Psi), W
def lhs(y, eps):
    g = geo['metric'](y, eps); sq = jnp.sqrt(jnp.linalg.det(g))
    pu, W = Psi_dens_up(y, eps); dpu = jax.jacfwd(lambda z: Psi_dens_up(z, eps)[0])(y)
    up = -jnp.einsum('imbm->ib', dpu)/sq - jnp.einsum('ijk,jm,kmb->ib', eps3, geo['A'](y, eps), pu)/sq
    return jnp.einsum('nb,ib->in', g, up), W
def Hg(kf, y, eps):                      # (H_g k)_{i mu} = (1/2) eta_i,cd E_c^r E_d^s (nabla^g_r k)_{mu s}
    dk = jax.jacfwd(kf)(y); Gm = cur['christoffel'](y, eps); kv = kf(y)
    nk = jnp.einsum('mnr->rmn',dk) - jnp.einsum('lrm,ln->rmn',Gm,kv) - jnp.einsum('lrn,ml->rmn',Gm,kv)
    E = jnp.linalg.inv(geo['coframe'](y, eps))
    return 0.5*jnp.einsum('icd,rc,sd,rms->im', etaP, E, E, nk)
L_, W_ = lhs(x, EPS)
R_ = -Hg(lambda z: cur['ricci0'](z, EPS), x, EPS) - Hg(lambda z: cur['scalar'](z, EPS)*geo['metric'](z, EPS), x, EPS)/12
print("     sizes: |d^*(W^+Sigma^+)| = %.4g, |H_g(Ric_0)| = %.4g, |H_g(s g)/12| = %.4g" % (float(jnp.abs(L_).max()), float(jnp.abs(Hg(lambda z: cur['ricci0'](z, EPS), x, EPS)).max()), float(jnp.abs(Hg(lambda z: cur['scalar'](z, EPS)*geo['metric'](z, EPS), x, EPS)).max()/12)))
print("     non-round test metric: |W^+| =", float(jnp.abs(W_).max()), " |Ric_0| =", float(jnp.abs(cur['ricci0'](x,EPS)).max()), " s =", float(cur['scalar'](x,EPS)))
ok("Lemma 8.1 (8.3)  d^*_{A_g}(W^+ Sigma^+) = -H_g(Ric_0) - H_g(s g)/12, fully nonlinear", rel(L_, R_))

# ================= pointwise gradient identity behind (6.5):  d[tr(Q^2) mu](dF) = sum_i dF_i ^ Phi_i
F0 = -K*etaP + 0.25*jnp.array(rng.normal(size=(3,4,4))); F0 = (F0 - jnp.einsum('iab->iba',F0))/2 - K*etaP/2
dF = jnp.array(rng.normal(size=(3,4,4))); dF = (dF - jnp.einsum('iab->iba',dF))/2
def p_dens(F): mu, Q = mu_and_Q(F); return jnp.trace(Q@Q)*mu
mu_, Q_ = mu_and_Q(F0); assert float(jnp.linalg.eigvalsh(Q_).min())>0.05 and float(mu_)>0
Phi_ = jnp.einsum('ij,jab->iab', 4*Q_-(2.0/3.0)*jnp.trace(Q_@Q_)*I3, F0)
print("     raw values for (6.5): d[tr(Q^2)mu](dF) = %.15g ; sum_i dF_i^Phi_i = %.15g" % (float(jax.jvp(p_dens,(F0,),(dF,))[1]), float(0.25*jnp.einsum('mnrs,imn,irs->',eps4,dF,Phi_))))
ok("(6.5) pointwise: d[tr(Q^2)mu](dF) = sum_i dF_i ^ [(4Q - (2/3)tr(Q^2))F]_i", abs(float(jax.jvp(p_dens,(F0,),(dF,))[1] - 0.25*jnp.einsum('mnrs,imn,irs->',eps4,dF,Phi_)))/float(jnp.abs(Phi_).max()), 1e-10)
gh = ghat_of_F(F0); sq = jnp.sqrt(jnp.linalg.det(gh)); gi = jnp.linalg.inv(gh)
star = lambda w: 0.5*sq*jnp.einsum('mnab,ar,bs,rs->mn', eps4, gi, gi, w)
ok("Urbantke metric: F_i self-dual for ghat, dV_ghat = mu/(2K^2), ghat > 0", max(rel(jnp.stack([star(F0[i]) for i in range(3)]), F0), abs(float(sq/(mu_/(2*K**2))-1)), float(-min(0.0, float(jnp.linalg.eigvalsh(gh).min())))))

# ================= Test G: Proposition 4.3 (exact metric velocity), pointwise, far from Q = I
def sqrtm_sym(Q):
    w, v = jnp.linalg.eigh(Q); return (v*jnp.sqrt(w))@v.T
S = sqrtm_sym(Q_); Si = jnp.linalg.inv(S)
SigA = -jnp.einsum('ij,jab->iab', Si, F0)/K
wd = lambda a,b: 0.25*jnp.einsum('mnrs,mn,rs->', eps4, a, b)
ok("(4.12) Sigma_A,i ^ Sigma_A,j = 2 delta dV_ghat", float(jnp.abs(jnp.array([[wd(SigA[i],SigA[j]) for j in range(3)] for i in range(3)])/sq-2*I3).max()), 1e-10)
# normalised anti-self-dual frame of ghat: Gram-Schmidt on (1-*)/2 of a basis
basis = [jnp.zeros((4,4)).at[a,b].set(1.0).at[b,a].set(-1.0) for a in range(4) for b in range(a+1,4)]
asd = []
for w in basis:
    v = (w - star(w))/2
    for u in asd: v = v + u*wd(v,u)/(2*sq)
    n = -wd(v,v)/(2*sq)
    if float(n) > 1e-6: asd.append(v/jnp.sqrt(n))
    if len(asd)==3: break
SigM = jnp.stack(asd)
U = jnp.array([[wd(dF[i],SigA[j]) for j in range(3)] for i in range(3)])/(2*sq)
V = -jnp.array([[wd(dF[i],SigM[j]) for j in range(3)] for i in range(3)])/(2*sq)
ok("(4.13) dF = U Sigma_A + V Sigma^-  (decomposition complete)", rel(jnp.einsum('ij,jab->iab',U,SigA)+jnp.einsum('ij,jab->iab',V,SigM), dF), 1e-10)
hdot = jax.jvp(ghat_of_F,(F0,),(dF,))[1]; Qdot = jax.jvp(lambda F: mu_and_Q(F)[1],(F0,),(dF,))[1]; mudot = jax.jvp(lambda F: mu_and_Q(F)[0],(F0,),(dF,))[1]
trh = jnp.einsum('mn,mn->', gi, hdot)
ok("(4.15) tr_ghat(dghat) = -(4/(3K)) tr(S U)", abs(float(trh + 4/(3*K)*jnp.trace(S@U)))/float(jnp.abs(U).max()), 1e-10)
ok("(4.16) dQ = -(U S + S U^T)/K + (2/(3K)) tr(S U) Q", rel(Qdot, -(U@S+S@U.T)/K + 2/(3*K)*jnp.trace(S@U)*Q_), 1e-10)
ok("(4.18) dmu/mu = -(2/(3K)) tr(S U)", abs(float(mudot/mu_ + 2/(3*K)*jnp.trace(S@U))), 1e-10)
H0 = gi@hdot - trh/4*I4                                    # endomorphism ghat^{-1} h_0  (H^r_m)
DH = lambda w: 0.5*(jnp.einsum('rm,rn->mn',H0,w) + jnp.einsum('rn,mr->mn',H0,w))
beta_h0 = -jnp.array([[wd(DH(SigA[i]),SigM[j]) for j in range(3)] for i in range(3)])/(2*sq)
sd_part = jnp.array([[wd(DH(SigA[i]),SigA[j]) for j in range(3)] for i in range(3)])/(2*sq)
ok("(4.14) beta_ghat(h_0) = -K^{-1} S^{-1} V   (and D_{h_0} has no self-dual block)", max(rel(beta_h0, -Si@V/K), float(jnp.abs(sd_part).max())), 1e-10)

# ================= Test H: second-order reconstruction (5.14)-(5.17) against the Urbantke route
def tf(pairs):
    w = np.zeros((4,4))
    for (a,b,c) in pairs: w[a-1,b-1]+=c; w[b-1,a-1]-=c
    return w
S4P = np.array([tf([(1,2,1),(3,4,1)]), tf([(1,3,1),(2,4,-1)]), tf([(1,4,1),(2,3,1)])]); S4M = np.array([tf([(1,2,1),(3,4,-1)]), tf([(1,3,1),(2,4,1)]), tf([(1,4,1),(2,3,-1)])])
def beta_np(H): return np.array([[0.25*np.sum(0.5*(H@S4P[i]+S4P[i]@H.T)*S4M[j]) for j in range(3)] for i in range(3)])
symb = []
for a in range(4):
    for b in range(a,4):
        E_ = np.zeros((4,4)); E_[a,b]=E_[b,a]=1.0; symb.append(E_)
symb0 = [E_-np.trace(E_)/4*np.eye(4) for E_ in symb]
Bmat = np.array([beta_np(E_).reshape(9) for E_ in symb0]).T        # 9 x 10 (rank 9)
def beta_inv(T):
    c = np.linalg.lstsq(Bmat, np.asarray(T).reshape(9), rcond=None)[0]
    H = sum(ci*E_ for ci,E_ in zip(c,symb0)); return H
sym0 = lambda X: (X+X.T)/2 - np.trace(X)/3*np.eye(3)
W1, W2 = sym0(rng.normal(size=(3,3))), sym0(rng.normal(size=(3,3))); B1, B2 = rng.normal(size=(3,3)), rng.normal(size=(3,3)); a1, a2 = rng.normal(), rng.normal()
rho1, rho2 = beta_inv(B1), beta_inv(B2); s1, s2 = 12*a1, 12*a2
assert np.abs(beta_np(rho1)-B1).max()<1e-12
def ghat_eps(eps):
    C = K*I3 + eps*(jnp.array(W1)+a1*I3) + eps**2*(jnp.array(W2)+a2*I3); B = eps*jnp.array(B1) + eps**2*jnp.array(B2)
    F = -jnp.einsum('ij,jab->iab', C, jnp.array(S4P)) - jnp.einsum('ij,jab->iab', B, jnp.array(S4M))
    return ghat_of_F(F)
d1 = jax.jvp(ghat_eps,(0.0,),(1.0,))[1]
d2 = jax.jvp(lambda e: jax.jvp(ghat_eps,(e,),(1.0,))[1],(0.0,),(1.0,))[1]/2
pred1 = rho1/K + s1/(12*K)*np.eye(4)
pred2 = rho2/K + s2/(12*K)*np.eye(4) - beta_inv(W1@B1)/K**2 + rho1@rho1/(2*K**2) + (np.sum(W1**2)-np.sum(B1**2))/(6*K**2)*np.eye(4)
ok("(5.17) first-order coefficient of c e^H", rel(d1, jnp.array(pred1)), 1e-10)
ok("(5.17) second-order coefficient of c e^H (incl. beta^{-1}(W1 B1), rho1^2/2, (|W1|^2-|B1|^2)/6)", rel(d2, jnp.array(pred2)), 1e-9)
def Q_eps(eps):
    C = K*I3 + eps*(jnp.array(W1)+a1*I3) + eps**2*(jnp.array(W2)+a2*I3); B = eps*jnp.array(B1) + eps**2*jnp.array(B2)
    F = -jnp.einsum('ij,jab->iab', C, jnp.array(S4P)) - jnp.einsum('ij,jab->iab', B, jnp.array(S4M)); return mu_and_Q(F)[1]
q2 = jax.jvp(lambda e: jax.jvp(Q_eps,(e,),(1.0,))[1],(0.0,),(1.0,))[1]/2
ok("(9.8) second-order coefficient of Q", rel(q2, jnp.array(2/K*W2 - 2*a1/K**2*W1 + sym0(W1@W1-B1@B1.T)/K**2)), 1e-10)
