"""Part of the checks supporting reviews/EXTERNAL_MANUSCRIPT_REVIEW_20261123.md (see README.md in this folder).
Requires numpy, jax (CPU, float64).

The two propositions added to Section 12.2 in commit df5b7b1 (159-page build), old normalisation with K = 1:
  Proposition 12.5  "A local ratio test at every nonround threshold": for each r > 1 a polynomial connection whose
                    spectral ratio rho(Q) has a strict local maximum r at the centre, with d/dt log rho = 1/2 there
                    along the native flow vector field (that is, 1 in the old clock);
  Proposition 12.6  "Failure of near-round spectral cap preservation": the germ of Prop. 12.5 at r = 1 + eps glued by a
                    radial cutoff of radius R = eps^2 into the round connection on the standard four-sphere.
For 12.5 everything is evaluated end to end with the nonlinear flow of sphere_lib.py.  For 12.6 the static claims
(closeness to round, unique global maximum of rho at the centre) are SAMPLED for two values of eps; the statement is
asymptotic in eps and the dynamical part rests on Corollary 6.29, which is not tested here."""
import numpy as np, jax, jax.numpy as jnp
import sphere_lib as SL
SL.K = 1.0
from sphere_lib import eps3, etaP, I3, I4, mu_and_Q, curvature_of, make_flow, d_eps
def ok(name, err, tol=1e-8, extra=""): print(f"{'PASS' if err<tol else 'FAIL'}  {name:104s} err={err:.2e} {extra}", flush=True)
o = jnp.zeros(4)
LQ = lambda Q, T: 2*(Q@T + T@Q) - (4.0/3.0)*jnp.trace(Q@T)*Q

def data(r):
    a, b = 2/(1+r), 2*r/(1+r); Qr = jnp.diag(jnp.array([a, 1.0, b])); q = Qr - I3; d = 2*np.sqrt(r)/(r+1)
    G = (r+1)/(6*r)*jnp.diag(jnp.array([-2*r-1, r-1, r+2])); T = jnp.diag(jnp.array([a, -2.0, b]))
    mu = (r+1)/(32*(r-1))*(8*(r+1)**2/r + 24*(r-1)/np.sqrt(r) + 1)
    B = -G + mu*T; U = B - d/2*q
    return a, b, Qr, q, d, G, T, mu, B, U
def local_connection(r):
    """A_b = (1/2) x^a F*_ab + (1/6) sum_j (x^j)^3 (V^j)_b,  V_i^j = -sum_k U_ik J_k dx^j / s_k,  F*_i = -s_i Sigma_i"""
    a, b, Qr, q, d, G, T, mu, B, U = data(r); s = jnp.sqrt(jnp.diag(Qr))
    Fs = -jnp.einsum('i,iab->iab', s, etaP); V = -jnp.einsum('ik,kjb,k->jib', U, etaP, 1/s)
    return (lambda x: 0.5*jnp.einsum('a,iab->ib', x, Fs) + jnp.einsum('j,jib->ib', x**3, V)/6.0), Fs
def logrho_of(Qf): return lambda y: (lambda ev: jnp.log(ev[2]/ev[0]))(jnp.linalg.eigvalsh(Qf(y)))

print("     --- Proposition 12.5")
for r in (1.05, 2.25, 3.5, 6.0):
    a, b, Qr, q, d, G, T, mu, B, U = data(r)
    df = lambda X: -X[0,0]/a + X[2,2]/b
    alg = [abs(float(jnp.linalg.det(Qr))**0.5 - d), float(jnp.abs(LQ(Qr, G) - jnp.diag(jnp.array([-4.0, 0.0, 4.0]))).max()), abs(float(df(T))),
           abs(float(df(LQ(Qr, T))) - 8*(r-1)/(r+1)), abs(float(jnp.sum(G*LQ(Qr, G))) - 2*(r+1)**2/r), abs(float(df(q)) - (r*r-1)/(2*r)),
           abs(float(df(B)) + float(jnp.sum(G*G))), abs(-8*(r+1)**2/r + 32*(r-1)/(r+1)*mu - 24*(r-1)/np.sqrt(r) - 1.0)]
    ok("r = %.2f: d, L_Q G = diag(-4,0,4), df[T] = 0, df[L_Q T], <G,L_Q G>, df[q], df[B] = -|G|^2, the mu_r identity" % r, max(alg), 1e-11)
    Af, Fs = local_connection(r)
    fl = make_flow(lambda y, e: Af(y)); Qf = lambda y: fl['Q'](y, 0.0); Gf = lambda y: fl['G'](y, 0.0); gh = lambda y: fl['ghat'](y, 0.0)
    jets = [jnp.abs(Af(o)).max(), jnp.abs(fl['F'](o, 0.0) - Fs).max(), jnp.abs(Qf(o) - Qr).max(), jnp.abs(jax.jacfwd(Qf)(o)).max(),
            jnp.abs(gh(o) - I4).max(), jnp.abs(jax.jacfwd(gh)(o)).max(),
            jnp.abs(jax.jacfwd(jax.jacfwd(Qf))(o) - jnp.einsum('ij,ab->ijab', B, I4)).max()/jnp.abs(B).max()]
    ok("r = %.2f: A(0)=0, F(0)=F*, Q(0)=Q_r, first jets of Q and ghat vanish, ghat(0)=Euclidean, d_j d_k Q(0) = B delta_jk" % r, float(max(jets)), 1e-9)
    lr = logrho_of(Qf); hess = jax.jacfwd(jax.jacfwd(lr))(o); G2 = float(jnp.sum(G*G))
    ok("r = %.2f: rho(0) = r, d log rho(0) = 0, Hessian of log rho at 0 = -|G|^2 I  (strict local maximum)" % r, float(max(abs(jnp.exp(lr(o)) - r)/r, jnp.abs(jax.jacfwd(lr)(o)).max(), jnp.abs(hess + G2*I4).max()/G2)), 1e-8)
    flt = make_flow(lambda y, e: Af(y) + e*Gf(y)); Qt = d_eps(flt['Q'], o)
    ok("r = %.2f: Q_t(0) = 4 L_Q B - 24 d q along the actual flow" % r, float(jnp.abs(Qt - (4*LQ(Qr, B) - 24*d*q)).max()/jnp.abs(Qt).max()), 1e-9)
    rate = float(df(Qt))
    ok("r = %.2f: d/dt log rho(0) = 1 in the old clock, i.e. 1/2 native; d/dt rho = r/2 native" % r, abs(rate - 1.0), 1e-8, "(value %.10f)" % rate)
    qB = float(jnp.sum(q*B)); wf = lambda y: jnp.sum((Qf(y) - I3)**2)
    ok("r = %.2f: reviewer remark: <q,B> = 3(r-1)^2/(2(r+1)sqrt r) + (r-1)/(16(r+1)) > 0, and Hessian of |Q-I|^2 at 0 = 2<q,B> I" % r,
       max(abs(qB - (3*(r-1)**2/(2*(r+1)*np.sqrt(r)) + (r-1)/(16*(r+1))))/qB, float(jnp.abs(jax.jacfwd(jax.jacfwd(wf))(o) - 2*qB*I4).max())/qB), 1e-9, "(the centre is a strict local MINIMUM of |Q-I|^2)")

print("     --- Proposition 12.6: static part of the glued datum, sampled")
w_, a_, b_ = 0.05, 0.55, 0.95
def K2(t):                                           # second antiderivative of the bump (35/32)(1-t^2)^3 on [-1,1]
    tc = jnp.clip(t, -1.0, 1.0)
    inner = 0.5*(tc+1) + (35.0/32.0)*(tc**2/2 - tc**4/4 + tc**6/10 - tc**8/56 - 93.0/280.0)
    return jnp.where(t > 1.0, t, inner)
def cut(s): return 1.0 - 2.5*w_*(K2((s-a_)/w_) - K2((s-b_)/w_))       # c = 1 on [0,1/2], 0 on [1,inf), 0 <= -c' <= 5/2
ss = jnp.linspace(0.0, 1.2, 2401); cv = jax.vmap(cut)(ss); cp = jax.vmap(jax.grad(cut))(ss)
ok("cutoff: c = 1 on [0,1/2], c = 0 on [1,inf), nonincreasing, 0 <= -c' <= 5/2", float(max(jnp.abs(cv[ss <= 0.5] - 1).max(), jnp.abs(cv[ss >= 1.0]).max(), jnp.maximum(cp, 0).max(), jnp.maximum(-cp - 2.5, 0).max())), 1e-12, "(max -c' = %.4f)" % float(-cp.min()))
def A_round(y): return -0.5*jnp.einsum('a,iab->ib', y, etaP)/(1.0 + jnp.dot(y, y)/4.0)   # round S^4, K = 1, metric dy^2/(1+|y|^2/4)^2, radial gauge
Fr = curvature_of(lambda y, e: A_round(y)); yy = jnp.array([0.3, -0.2, 0.5, 0.1])
ok("the chart connection is the round one: F(0) = -Sigma, Q = I away from the origin, A in radial gauge", float(max(jnp.abs(Fr(o, 0.0) + etaP).max(), jnp.abs(mu_and_Q(Fr(yy, 0.0))[1] - I3).max(), jnp.abs(A_round(yy)@yy).max())), 1e-12)
rng = np.random.default_rng(7)
dirs = rng.normal(size=(600, 4)); dirs /= np.linalg.norm(dirs, axis=1)[:, None]
dirs = np.concatenate([dirs, np.eye(4), -np.eye(4), np.array([[1,1,0,0],[1,0,1,0],[1,0,0,1],[0,1,1,0],[0,1,0,1],[0,0,1,1],[1,1,1,1],[1,-1,1,-1]])/np.sqrt(np.array([2,2,2,2,2,2,4,4]))[:, None]])
radii = np.concatenate([np.linspace(0.02, 0.5, 13), np.linspace(0.52, 1.0, 49)])
res = {}
for epsv in (0.05, 0.025):
    r = 1 + epsv; R = epsv**2; Aloc, Fs = local_connection(r)
    def cutoff_at(y, R=R):                           # c(|y|/R), written so that automatic differentiation is finite at y = 0
        s2 = jnp.dot(y, y)/R**2; far = s2 > 0.2
        return jnp.where(far, cut(jnp.sqrt(jnp.where(far, s2, 1.0))), 1.0)
    Aeps = lambda y, Aloc=Aloc, cutoff_at=cutoff_at: A_round(y) + cutoff_at(y)*(Aloc(y) - A_round(y))
    Fe = curvature_of(lambda y, e: Aeps(y)); Qe = lambda y: mu_and_Q(Fe(y, 0.0))[1]
    f = jax.jit(jax.vmap(logrho_of(Qe)))
    pts = jnp.array((radii[:, None, None]*R*dirs[None, :, :]).reshape(-1, 4))
    vals = np.asarray(f(pts)).reshape(len(radii), len(dirs)); centre = float(logrho_of(Qe)(o))
    dA = jax.jit(jax.vmap(lambda y: jnp.abs(Aeps(y) - A_round(y)).max())); dDA = jax.jit(jax.vmap(lambda y: jnp.abs(jax.jacfwd(lambda z: Aeps(z) - A_round(z))(y)).max()))
    dF = jax.jit(jax.vmap(lambda y: jnp.abs(Fe(y, 0.0) - Fr(y, 0.0)).max()))
    res[epsv] = (float(dA(pts).max()), float(dDA(pts).max()), float(dF(pts).max()))
    ok("eps = %.3f: rho = 1 + eps at the centre and log rho < log(1+eps) at all %d sampled points of the ball |y| <= R = eps^2" % (epsv, vals.size), max(abs(centre - np.log(r)), max(0.0, float(vals.max() - np.log(r)))), 1e-12,
       "(margin log(1+eps) - max = %.2e at |y|/R = %.2f, expected about |y|^2 = %.2e; largest rho - 1 on the cutoff annulus = %.3f eps)" % (np.log(r) - vals.max(), radii[np.unravel_index(vals.argmax(), vals.shape)[0]], (radii[0]*R)**2, (np.exp(vals[13:].max())-1)/epsv))
    if epsv == 0.05:
        fl = make_flow(lambda y, e: Aeps(y)); Gf = lambda y: fl['G'](y, 0.0); flt = make_flow(lambda y, e: Aeps(y) + e*Gf(y)); Qt = d_eps(flt['Q'], o)
        a, b = 2/(1+r), 2*r/(1+r)
        ok("eps = %.3f: d/dt log rho at the centre of the glued datum = 1 in the old clock (1/2 native)" % epsv, abs(float(-Qt[0,0]/a + Qt[2,2]/b) - 1.0), 1e-8)
e1, e2 = res[0.05], res[0.025]
print("     sup|A_eps - A_rd|, sup|D(A_eps - A_rd)|, sup|F_eps - F_rd| over the samples:  eps = 0.05: %.2e, %.2e, %.2e ;  eps = 0.025: %.2e, %.2e, %.2e" % (*e1, *e2))
print("     ratios on halving eps: %.2f, %.2f, %.2f   (manuscript: O(eps^3), O(eps), O(eps), i.e. 8, 2, 2)" % (e1[0]/e2[0], e1[1]/e2[1], e1[2]/e2[2]))
ok("closeness to round scales as stated: C^0 distance ~ eps^3, C^1 distance and curvature distance ~ eps", max(abs(e1[0]/e2[0] - 8)/8, abs(e1[1]/e2[1] - 2)/2, abs(e1[2]/e2[2] - 2)/2), 0.25)
