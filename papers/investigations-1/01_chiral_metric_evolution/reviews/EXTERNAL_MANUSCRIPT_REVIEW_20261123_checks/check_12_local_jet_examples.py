"""Part of the checks supporting reviews/EXTERNAL_MANUSCRIPT_REVIEW_20261123.md (see README.md in this folder).
Requires numpy, jax (CPU, float64).

The explicit local connections of the manuscript, evaluated end to end with the fully nonlinear flow of sphere_lib.py
(old normalisation, K = 1, Euclidean chart, trivial bundle):
  * Section 12.2, first example      w = |Q-I|^2 has a strict local maximum whose flow derivative is positive
  * Section 12.2, second example     zero pointwise speed with nonzero strain
  * Section 12.2, determinant-one trace specialisation
  * Proposition 12.4                 strict local maximum 9/4 of the spectral ratio with positive flow derivative
  * Proposition 6.10 (commit 04ef8d7), local realisation of a first jet, and its velocity
Each connection is A_b = (1/2) x^a F*_ab + c sum_a (x^a)^p (V^a)_b with F*_i = -s_i Sigma_i; derivatives of Q, of the
reconstructed metric and of scalar functions of Q are taken by automatic differentiation, and time derivatives by moving
the connection along the computed vector field -d_A^*[(4Q - (2/3) tr(Q^2)) F_A]."""
from fractions import Fraction as Fr
import numpy as np, jax, jax.numpy as jnp
import sphere_lib as SL
SL.K = 1.0                                           # this file uses the manuscript's K = 1 examples
from sphere_lib import eps3, etaP, I3, I4, mu_and_Q, make_flow, d_eps
from stationary_lib import matrices, pack, edge_to_X
def ok(name, err, tol=1e-8, extra=""): print(f"{'PASS' if err<tol else 'FAIL'}  {name:104s} err={err:.2e} {extra}", flush=True)
o = jnp.zeros(4)
def connection(svec, coef_axis, power, c):
    """A[i,b](x) = (1/2) x^a F*_{i,ab} + c sum_a (x^a)^power V[a,i,b],  V[a,i,b] = -sum_j M_a[i,j] eta_{j,ab}/s_j"""
    svec = jnp.array(svec); Fs = -jnp.einsum('i,iab->iab', svec, etaP)
    V = -jnp.einsum('aij,jab,j->aib', jnp.array(coef_axis), etaP, 1/svec)
    return lambda x: 0.5*jnp.einsum('a,iab->ib', x, Fs) + c*jnp.einsum('a,aib->ib', x**power, V), Fs
def analyse(Af):
    fl = make_flow(lambda y, e: Af(y)); Qf = lambda y: fl['Q'](y, 0.0); Gf = lambda y: fl['G'](y, 0.0); gh = lambda y: fl['ghat'](y, 0.0)
    flt = make_flow(lambda y, e: Af(y) + e*Gf(y))
    return dict(F=fl['F'](o, 0.0), Q=Qf(o), dQ=jax.jacfwd(Qf)(o), ddQ=jax.jacfwd(jax.jacfwd(Qf))(o), g=gh(o), dg=jax.jacfwd(gh)(o),
                vel=Gf(o), Qt=d_eps(flt['Q'], o), Qf=Qf)
LQ = lambda Q, T: 2*(Q@T + T@Q) - (4.0/3.0)*jnp.trace(Q@T)*Q
same = lambda M: jnp.array([M, M, M, M])

# ---------------------------------------------------------------- Section 12.2, first example
eps_, L = 1/8, 3.0
Qs = jnp.diag(jnp.array([1+eps_, 1.0, 1-eps_])); qs = Qs - I3; H = jnp.diag(jnp.array([1.0, -2.0, 1.0])) - qs/2; d = np.sqrt(1-eps_**2)
ok("12.2: <q*,H> = -eps^2 and <q*, L_Q* H> = 4 eps^2 + (8/3) eps^4", max(abs(float(jnp.sum(qs*H)) + eps_**2), abs(float(jnp.sum(qs*LQ(Qs, H))) - (4*eps_**2 + 8*eps_**4/3))), 1e-12)
Af, Fs = connection(jnp.sqrt(jnp.diag(Qs)), same(H), 3, L/6); r = analyse(Af)
ok("12.2: Q(0) = Q*, first jets of Q and of the reconstructed metric vanish, ghat(0) = Euclidean", float(max(jnp.abs(r['Q']-Qs).max(), jnp.abs(r['dQ']).max(), jnp.abs(r['dg']).max(), jnp.abs(r['g']-I4).max())), 1e-10)
ok("12.2: d_a d_b Q(0) = delta_ab (d q*/2 + L H)", float(jnp.abs(r['ddQ'] - jnp.einsum('ij,ab->ijab', d*qs/2 + L*H, I4)).max()), 1e-9)
wf = lambda y: jnp.sum((r['Qf'](y) - I3)**2)
ok("12.2: Hessian of w = |Q-I|^2 at 0 equals 2 eps^2 (d - L) I  (negative definite for L = 3)", float(jnp.abs(jax.jacfwd(jax.jacfwd(wf))(o) - 2*eps_**2*(d-L)*I4).max()), 1e-9)
wt = 2*float(jnp.sum(qs*r['Qt'])); wt_ms = 32*eps_**2*(L*(1+2*eps_**2/3) - 2*d*(1+eps_**2/3))
ok("12.2: w_t(0) = 32 eps^2 [L(1 + 2eps^2/3) - 2d(1 + eps^2/3)] > 0 along the actual flow", abs(wt - wt_ms)/abs(wt_ms), 1e-9, "(value %.6f)" % wt)

# ---------------------------------------------------------------- Section 12.2, second example
tpar = 0.7
X = np.zeros((4,3,3)); X[0] = np.diag([1.0, -1.0, 0.0]); X[1][0,1] = X[1][1,0] = -1.0
Af, Fs = connection(jnp.ones(3), tpar*X, 2, 0.5); r = analyse(Af)
ok("12.2: Q(0) = I, nabla_a Q(0) = t X_a", float(max(jnp.abs(r['Q']-I3).max(), jnp.abs(jnp.einsum('ija->aij', r['dQ']) - tpar*X).max())), 1e-10)
ok("12.2: the flow velocity vanishes at 0 although |nabla Q|(0) = 2t", float(jnp.abs(r['vel']).max()), 1e-10, "(|nabla Q| = %.4f, 2t = %.4f; first metric jet %.3f is nonzero)" % (float(jnp.sqrt(jnp.sum(r['dQ']**2))), 2*tpar, float(jnp.abs(r['dg']).max())))

# ---------------------------------------------------------------- Section 12.2, determinant-one trace specialisation
eps_, L = 1/8, 5.0
D = jnp.diag(jnp.array([1.0, 0.0, -1.0])); Nm = jnp.diag(jnp.array([1/3, -2/3, 1/3])); Qs = I3 + eps_*D; qs = Qs - I3; d = np.sqrt(1-eps_**2)
p = float(jnp.linalg.det(Qs))**(-1/3); G = p*eps_/(1-eps_**2)*(D - eps_*Nm); Y = 4*p*eps_**2/(3+eps_**2)*(eps_*D + 3*Nm)
ff = lambda Q: 3*jnp.linalg.det(Q)**(-1.0/3.0) - 3
gradf = jax.grad(ff)(Qs); gradf0 = gradf - jnp.trace(gradf)*I3/3
LG = LQ(Qs, G); Yc = LG - jnp.sum(LG*G)/jnp.sum(G*G)*G
ok("det-one: G = grad f, L_Q G = 4p(Q-I), Y = perpendicular part, |Y|^2 = 32 p^2 eps^4/(3+eps^2)", float(max(jnp.abs(gradf0-G).max(), jnp.abs(LG-4*p*qs).max(), jnp.abs(Yc-Y).max(), abs(jnp.sum(Y*Y) - 32*p*p*eps_**4/(3+eps_**2)))), 1e-12)
Af, Fs = connection(jnp.sqrt(jnp.diag(Qs)), same(-d*qs/2 - G + L*Y), 3, 1/6); r = analyse(Af)
wf = lambda y: ff(r['Qf'](y))
ok("det-one: dw(0) = 0 and Hessian of w = f(Q) at 0 equals -|G|^2 I", float(max(jnp.abs(jax.jacfwd(wf)(o)).max(), jnp.abs(jax.jacfwd(jax.jacfwd(wf))(o) + jnp.sum(G*G)*I4).max())), 1e-9)
ft = float(jnp.sum(gradf*r['Qt'])); ft_ms = -32*p*p*eps_**2/(1-eps_**2) - 48*d*p*eps_**2/(1-eps_**2) + 128*L*p*p*eps_**4/(3+eps_**2)
ok("det-one: d/dt f(Q)(0) = -32p^2e^2/(1-e^2) - 48 d p e^2/(1-e^2) + 128 L p^2 e^4/(3+e^2) along the actual flow", abs(ft - ft_ms)/abs(ft_ms), 1e-9, "(value %.6f at L = 5)" % ft)

# ---------------------------------------------------------------- Proposition 12.4
lam = [Fr(48,77), Fr(75,77), Fr(108,77)]; Gd = [Fr(77,1296)*c for c in (-22, 5, 17)]; Yd = [Fr(10,133)*c for c in (4, -13, 9)]
LQd = lambda T: [4*lam[i]*T[i] - Fr(4,3)*sum(lam[j]*T[j] for j in range(3))*lam[i] for i in range(3)]
dot = lambda a, b: sum(x*y for x, y in zip(a, b)); qd = [l-1 for l in lam]
raw = [-1/lam[0], Fr(0), 1/lam[2]]; tf = [x - sum(raw)/3 for x in raw]
exact = (tf == Gd and LQd(Gd) == [Fr(-4), Fr(0), Fr(4)] and dot(Gd, Yd) == 0 and dot(Gd, LQd(Yd)) == dot(Yd, Yd) == Fr(200,133)
         and dot(Gd, Gd) == Fr(788557,279936) and dot(Gd, LQd(Gd)) == Fr(1001,108) and dot(Gd, qd) == Fr(385,432)
         and lam[0]*lam[1]*lam[2] == Fr(388800,456533) and [a - dot(LQd(Gd), Gd)/dot(Gd, Gd)*g for a, g in zip(LQd(Gd), Gd)] == Yd
         and Fr(8000,133) - Fr(1001,27) - Fr(385,18) == Fr(12119,7182))
print("%s  Prop 12.4: the displayed rational identities for G, Y, L_Q* G and the pairings (exact arithmetic)" % ("PASS" if exact else "FAIL"))
Qs = jnp.diag(jnp.array([48.0, 75.0, 108.0])/77); qs = Qs - I3; svec = jnp.sqrt(jnp.diag(Qs)); d = float(jnp.prod(svec))
G = jnp.diag(jnp.array([-22.0, 5.0, 17.0]))*77/1296; Y = jnp.diag(jnp.array([4.0, -13.0, 9.0]))*10/133
Af, Fs = connection(svec, same(-d*qs/2 - G + 10*Y), 3, 1/6); r = analyse(Af)
ok("Prop 12.4: A(0)=0, F(0)=F*, Q(0)=Q*, dQ(0)=0, d ghat(0)=0, ghat(0)=Euclidean", float(max(jnp.abs(Af(o)).max(), jnp.abs(r['F']-Fs).max(), jnp.abs(r['Q']-Qs).max(), jnp.abs(r['dQ']).max(), jnp.abs(r['dg']).max(), jnp.abs(r['g']-I4).max())), 1e-10)
ok("Prop 12.4: d_a d_b Q(0) = delta_ab (-G + 10 Y)", float(jnp.abs(r['ddQ'] - jnp.einsum('ij,ab->ijab', -G + 10*Y, I4)).max()), 1e-9)
def logrho(y):
    ev = jnp.linalg.eigvalsh(r['Qf'](y)); return jnp.log(ev[2]/ev[0])
hess = jax.jacfwd(jax.jacfwd(logrho))(o)
ok("Prop 12.4: rho(Q)(0) = 9/4, d log rho(0) = 0, Hessian of log rho at 0 = -|G|^2 I (strict local maximum)", float(max(abs(jnp.exp(logrho(o)) - 2.25), jnp.abs(jax.jacfwd(logrho)(o)).max(), jnp.abs(hess + (788557/279936)*I4).max())), 1e-8)
rate = float(r['Qt'][2,2]/Qs[2,2] - r['Qt'][0,0]/Qs[0,0]); rate_ms = 8000/133 - 1001/27 - 385/18*d
ok("Prop 12.4: Q_t(0) = 4 L_Q*(-G + 10Y) - 24 d q*  along the actual flow", float(jnp.abs(r['Qt'] - (4*LQ(Qs, -G + 10*Y) - 24*d*qs)).max()), 1e-9)
ok("Prop 12.4: d/dt log rho(0) = 8000/133 - 1001/27 - (385/18) d  (old clock)", abs(rate - rate_ms)/rate_ms, 1e-9, "(value %.6f > 12119/7182 = %.6f; native value %.6f > 12119/14364 = %.6f)" % (rate, 12119/7182, rate/2, 12119/14364))

# ---------------------------------------------------------------- Proposition 6.10, local realisation
s_ = 3.46; t_ = np.sqrt(s_); lam_ = 3/(s_+2); w = np.array([1.0, 0, 0, 0])
Nn = edge_to_X(-t_/2*w, w, -w, 1.0, t_)[0]; Yy = np.zeros((4,3,3)); Yy[0] = np.diag([1.0, 0.0, -1.0])
sig = (s_-2)/(2*t_*(7-2*s_)); X = Yy + sig*Nn
Qs = jnp.diag(lam_*jnp.array([1.0, 1.0, s_])); svec = jnp.sqrt(jnp.diag(Qs))
Af, Fs = connection(svec, X, 2, 0.5); r = analyse(Af)
ok("Prop 6.10: A(0)=0, F(0)=F*, Q(0)=Q_s, nabla_a Q(0) = X_a = (Y + sigma_* N)_a, ghat(0)=Euclidean", float(max(jnp.abs(Af(o)).max(), jnp.abs(r['F']-Fs).max(), jnp.abs(r['Q']-Qs).max(), jnp.abs(jnp.einsum('ija->aij', r['dQ']) - X).max(), jnp.abs(r['g']-I4).max())), 1e-10)
Vm, Hq = matrices(1.0, t_); z = pack(X)
ok("Prop 6.10: flow velocity of this connection at 0 equals the algebraic speed map applied to X", float(jnp.abs(r['vel'].reshape(12) - Vm@z).max()), 1e-9)
Rv = z@Hq@z; Rms = 12*(5*s_+1)/(s_+2)**2 - lam_*(s_-2)**2/(7-2*s_)
ok("Prop 6.10: R_Q(Y + sigma_* N) = R(Y) - lam (s-2)^2/(7-2s)  (negative at s = 3.46, while |V|^2 = 4R(Y) stays fixed)", abs(Rv - Rms), 1e-10, "(value %.5f, |V|^2 = %.5f)" % (Rv, float(jnp.sum(r['vel']**2))))
