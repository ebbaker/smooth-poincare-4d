"""Fully nonlinear implementation, in stereographic coordinates on round S^4 (sectional curvature K),
of the objects used in the manuscript.  Nothing is linearised by hand: all first-order statements are
tested by automatic differentiation (JAX, float64) of the nonlinear definitions.

Conventions copied from the manuscript:
  de^a + w^a_b ^ e^b = 0,  A_i = -(1/2) eta_i,ab w_ab,  F_i = dA_i + (1/2) eps_ijk A_j ^ A_k,
  mu_A = (1/3) sum F_i^F_i,  F_i^F_j = Q_ij mu_A,  dV_ghat = mu_A/(2K^2),  Lambda^+_ghat = span F_i,
  flow: A_t = -d_A^*[(4Q - (2/3) tr(Q^2) I) F_A],  adjoint w.r.t. ghat_A and delta_ij."""
import itertools, numpy as np, jax, jax.numpy as jnp
jax.config.update("jax_enable_x64", True)

def levi(n):
    e = np.zeros((n,)*n)
    for p in itertools.permutations(range(n)):
        e[p] = np.linalg.det(np.eye(n)[list(p)])
    return e
eps3, eps4 = jnp.array(levi(3)), jnp.array(levi(4))
def make_eta(sign):
    eta = np.zeros((3,4,4))
    for i in range(3):
        eta[i,:3,:3] = levi(3)[i]; eta[i,i,3] = sign; eta[i,3,i] = -sign
    return jnp.array(eta)
etaP, etaM = make_eta(+1), make_eta(-1)
I4, I3 = jnp.eye(4), jnp.eye(3)

K = 0.8          # deliberately not 1, to expose K-normalisation slips
def Omega(x): return 2.0/(1.0+K*jnp.dot(x,x))
def g0(x): return Omega(x)**2*I4

def sqrt_series(X):                      # (I+X)^{1/2} through X^5; exact for <=5 eps-derivatives at eps=0
    X2=X@X; X3=X2@X; X4=X3@X; X5=X4@X
    return I4 + X/2 - X2/8 + X3/16 - 5*X4/128 + 7*X5/256

def make_geometry(hfun):
    """geometry of g_eps = g0 + eps*h (to O(eps^5)) in the positive symmetric coframe gauge"""
    def coframe(x, eps):                 # e[a,mu]
        return Omega(x)*sqrt_series(eps*hfun(x)/Omega(x)**2)
    def metric(x, eps):
        e = coframe(x, eps); return e.T@e
    def christoffel(x, eps):             # Gam[lam,mu,nu]
        g = metric(x, eps); dg = jax.jacfwd(metric)(x, eps)      # dg[k,n,m] = d_m g_kn
        return 0.5*jnp.einsum('lk,kmn->lmn', jnp.linalg.inv(g),
                              jnp.einsum('knm->kmn',dg)+jnp.einsum('kmn->kmn',dg)-jnp.einsum('mnk->kmn',dg))
    def spin_connection(x, eps):         # w[a,b,mu] with  nabla_mu e^a_nu = - w^a_{b mu} e^b_nu
        e = coframe(x, eps); de = jax.jacfwd(coframe)(x, eps)    # de[a,nu,mu]
        Gam = christoffel(x, eps)
        nab = jnp.einsum('anm->amn',de) - jnp.einsum('lmn,al->amn',Gam,e)   # nab[a,mu,nu]
        E = jnp.linalg.inv(e)            # E[nu,b]
        return -jnp.einsum('amn,nb->abm', nab, E)
    def A(x, eps):                       # A[i,mu]
        return -0.5*jnp.einsum('iab,abm->im', etaP, spin_connection(x, eps))
    return dict(coframe=coframe, metric=metric, christoffel=christoffel, spin_connection=spin_connection, A=A)

def curvature_of(Afun):
    """F[i,mu,nu] for a connection given as a function Afun(x, eps) -> A[i,mu]"""
    def F(x, eps):
        Av = Afun(x, eps); dA = jax.jacfwd(Afun)(x, eps)         # dA[i,nu,mu]
        return jnp.einsum('inm->imn',dA) - dA + jnp.einsum('ijk,jm,kn->imn', eps3, Av, Av)
    return F

def wedge_matrix(F):                     # density of F_i ^ F_j w.r.t. dx^{1234}
    return 0.25*jnp.einsum('mnrs,imn,jrs->ij', eps4, F, F)
def mu_and_Q(F):
    w = wedge_matrix(F); mu = jnp.trace(w)/3.0
    return mu, w/mu
def ghat_of_F(F):
    """curvature-reconstructed metric via Urbantke's formula (independent of the manuscript's graph map),
    normalised by dV = mu/(2K^2).  Overall sign fixed for the component of the round connection."""
    gt = jnp.einsum('ijk,abcd,ima,jbc,kdn->mn', eps3, eps4, F, F, F)
    mu, _ = mu_and_Q(F)
    gt = -gt                              # sign making it positive for F = -K Sigma^+ (checked in the tests)
    scale = jnp.sqrt(mu/(2*K**2))/jnp.linalg.det(gt)**0.25
    return scale*gt

def make_flow(Afun):
    """returns F, Q, ghat and the negative-gradient vector field G = -d_A^*[(4Q-(2/3)tr(Q^2))F]"""
    Ffun = curvature_of(Afun)
    def Qfun(x, eps): return mu_and_Q(Ffun(x, eps))[1]
    def ghat(x, eps): return ghat_of_F(Ffun(x, eps))
    def phi_dens_up(x, eps):             # sqrt(ghat) * phi_i^{mu beta}
        F = Ffun(x, eps); _, Q = mu_and_Q(F); gh = ghat_of_F(F); gi = jnp.linalg.inv(gh)
        phi = jnp.einsum('ij,jmn->imn', 4*Q - (2.0/3.0)*jnp.trace(Q@Q)*I3, F)
        return jnp.sqrt(jnp.linalg.det(gh))*jnp.einsum('ma,nb,iab->imn', gi, gi, phi)
    def G(x, eps):
        gh = ghat(x, eps); sq = jnp.sqrt(jnp.linalg.det(gh))
        pu = phi_dens_up(x, eps); dpu = jax.jacfwd(phi_dens_up)(x, eps)       # dpu[i,mu,beta,rho]
        div = jnp.einsum('imbm->ib', dpu)/sq
        gauge = jnp.einsum('ijk,jm,kmb->ib', eps3, Afun(x, eps), pu)/sq
        dstar_up = -div - gauge                                               # (d_A^* phi)_i^beta
        return -jnp.einsum('nb,ib->in', gh, dstar_up)                         # G[i,nu]
    return dict(F=Ffun, Q=Qfun, ghat=ghat, G=G)

def d_eps(f, x):                         # derivative in eps at eps = 0
    return jax.jvp(lambda e: f(x, e), (0.0,), (1.0,))[1]

# ---------- metric curvature (coordinate components), from Christoffels
def make_curvature(metric):
    def christoffel(x, eps):
        g = metric(x, eps); dg = jax.jacfwd(metric)(x, eps)
        return 0.5*jnp.einsum('lk,kmn->lmn', jnp.linalg.inv(g), jnp.einsum('knm->kmn',dg)+dg-jnp.einsum('mnk->kmn',dg))
    def riemann(x, eps):                 # R^l_{k m n} = d_m Gam^l_{n k} - d_n Gam^l_{m k} + Gam^l_{m p}Gam^p_{n k} - Gam^l_{n p}Gam^p_{m k}
        Gam = christoffel(x, eps); dG = jax.jacfwd(christoffel)(x, eps)       # dG[l,m,n,r] = d_r Gam^l_{mn}
        return (jnp.einsum('lnkm->lkmn', dG) - jnp.einsum('lmkn->lkmn', dG)
                + jnp.einsum('lmp,pnk->lkmn', Gam, Gam) - jnp.einsum('lnp,pmk->lkmn', Gam, Gam))
    def ricci(x, eps): return jnp.einsum('lkln->kn', riemann(x, eps))
    def scalar(x, eps): return jnp.einsum('kn,kn->', jnp.linalg.inv(metric(x, eps)), ricci(x, eps))
    def ricci0(x, eps): return ricci(x, eps) - scalar(x, eps)/4*metric(x, eps)
    return dict(christoffel=christoffel, riemann=riemann, ricci=ricci, scalar=scalar, ricci0=ricci0)

# ---------- test fields
def embed(x):                            # stereographic chart -> sphere of radius K^{-1/2} in R^5
    u = jnp.sqrt(K)*x; r2 = jnp.dot(u,u)
    return jnp.concatenate([2*u/(1+r2), jnp.array([(r2-1)/(1+r2)])])/jnp.sqrt(K)
def weyl5(rng):
    """random totally trace-free algebraic curvature tensor on R^5"""
    A = rng.normal(size=(5,5,5,5))
    R = A - A.transpose(1,0,2,3); R = R - R.transpose(0,1,3,2); R = R + R.transpose(2,3,0,1)
    R = R - (R + R.transpose(0,2,3,1) + R.transpose(0,3,1,2))/3.0
    n=5; I=np.eye(n); Ric=np.einsum('abad->bd',R); s=np.trace(Ric)
    W = (R - (np.einsum('ac,bd->abcd',I,Ric)-np.einsum('ad,bc->abcd',I,Ric)+np.einsum('bd,ac->abcd',I,Ric)-np.einsum('bc,ad->abcd',I,Ric))/(n-2)
           + s/((n-1)*(n-2))*(np.einsum('ac,bd->abcd',I,I)-np.einsum('ad,bc->abcd',I,I)))
    assert np.abs(np.einsum('abad->bd',W)).max()<1e-12
    return W
def tt_mode(C):
    """h(X,Y) = C(x,X,x,Y): the k=2 TT tensor harmonics of S^4 (rough-Laplacian eigenvalue 8K)"""
    C = jnp.array(C)
    def h(x):
        X = embed(x); dX = jax.jacfwd(embed)(x)        # dX[B,mu]
        return jnp.einsum('abcd,a,bm,c,dn->mn', C, X, dX, X, dX)
    return h
def poly_sym(rng, scale=1.0):
    """generic smooth symmetric two-tensor with polynomial coefficients (not TT, not anything)"""
    c0=rng.normal(size=(4,4)); c1=rng.normal(size=(4,4,4)); c2=rng.normal(size=(4,4,4,4)); c3=rng.normal(size=(4,4,4,4,4)); c4=rng.normal(size=(4,4,4,4,4,4))
    c0,c1,c2,c3,c4=[jnp.array(c) for c in (c0,c1,c2,c3,c4)]
    def h(x):
        t = c0 + jnp.einsum('mna,a->mn',c1,x) + jnp.einsum('mnab,a,b->mn',c2,x,x) + jnp.einsum('mnabc,a,b,c->mn',c3,x,x,x) + jnp.einsum('mnabcd,a,b,c,d->mn',c4,x,x,x,x)
        return scale*(t+t.T)/2
    return h
