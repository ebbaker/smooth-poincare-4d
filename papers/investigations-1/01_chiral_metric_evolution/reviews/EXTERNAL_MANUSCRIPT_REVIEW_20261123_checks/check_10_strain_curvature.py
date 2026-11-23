"""Part of the checks supporting reviews/EXTERNAL_MANUSCRIPT_REVIEW_20261123.md (see README.md in this folder).
Requires numpy, scipy, jax (CPU, float64).

Present since commit 2c73984, unchanged in 04ef8d7: Proposition "Curvature controlled by the strain derivative" and the algebra behind
"Conditional strain-energy estimates", tested at a connection at FINITE distance from the round one.
  (a) Gamma := A - b really is the chiral Levi-Civita connection of ghat_A:  the quantity
      c_+^2 = (1/2)|F_Gamma + K Sigma_A|^2 equals |W^+|^2_op + |Ric_0|^2/4 + (s-12K)^2/48 computed DIRECTLY from the
      Riemann tensor of ghat_A   (eq. transport:curvature-block);
  (b) sample evaluation of the inequalities (transport:derivative), (transport:curvature) and |Q-I| <= 72 G (native units);
  (c) spectrum of the operator  A = sum_i J_i (x) R_i  on T^* (x) Sym^2_0 E:  {-2: 12, 3: 8},  A^2 = A + 6."""
import numpy as np, jax, jax.numpy as jnp
from sphere_lib import *
rng = np.random.default_rng(29)
def ok(name, err, tol=1e-7): print(f"{'PASS' if err<tol else 'FAIL'}  {name:98s} err={err:.2e}", flush=True)
x = jnp.array([0.21,-0.33,0.12,0.27])
geo0 = make_geometry(lambda y: jnp.zeros((4,4))); A0f = lambda y: geo0['A'](y,0.0)
c0=jnp.array(rng.normal(size=(3,4))); c1=jnp.array(rng.normal(size=(3,4,4))); c2=jnp.array(rng.normal(size=(3,4,4,4))); c3=jnp.array(rng.normal(size=(3,4,4,4,4)))
a_gen = lambda y: 0.07*(c0 + jnp.einsum('ima,a->im',c1,y) + jnp.einsum('imab,a,b->im',c2,y,y) + jnp.einsum('imabc,a,b,c->im',c3,y,y,y))
Af = lambda y: A0f(y) + a_gen(y)
fl = make_flow(lambda y,e: Af(y)); Ff = lambda y: fl['F'](y,0.0); Qf = lambda y: fl['Q'](y,0.0); gh = lambda y: fl['ghat'](y,0.0)
def msqrt(Q):
    q = Q - I3; out = I3; term = I3; c = 1.0
    for n in range(1, 40):
        c = c*(0.5-(n-1))/n; term = term@q; out = out + c*term
    return out
Sf = lambda y: msqrt(Qf(y))
def chris(y):
    g = gh(y); dg = jax.jacfwd(gh)(y)
    return 0.5*jnp.einsum('lk,kmn->lmn', jnp.linalg.inv(g), jnp.einsum('knm->kmn',dg)+dg-jnp.einsum('mnk->kmn',dg))
def star3(Xi, g):
    gi = jnp.linalg.inv(g); return jnp.sqrt(jnp.linalg.det(g))/6.0*jnp.einsum('mnrs,ma,nb,rc,iabc->is', eps4, gi, gi, gi, Xi)
def SigmaA(y): return -jnp.einsum('ij,jmn->imn', jnp.linalg.inv(Sf(y)), Ff(y))/K
def Tdefect(y):
    Sg = SigmaA(y); dS = jax.jacfwd(SigmaA)(y); A = Af(y)
    d = jnp.einsum('inrm->imnr',dS) + jnp.einsum('irmn->imnr',dS) + jnp.einsum('imnr->imnr',dS)
    AS = jnp.einsum('jm,knr->jkmnr',A,Sg) + jnp.einsum('jn,krm->jkmnr',A,Sg) + jnp.einsum('jr,kmn->jkmnr',A,Sg)
    return d + jnp.einsum('ijk,jkmnr->imnr', eps3, AS)
def b_of(y):
    g = gh(y); Sg = SigmaA(y); sT = star3(Tdefect(y), g)
    bS = jnp.einsum('jm,knr->jkmnr',sT,Sg) + jnp.einsum('jn,krm->jkmnr',sT,Sg) + jnp.einsum('jr,kmn->jkmnr',sT,Sg)
    return 0.5*(star3(jnp.einsum('ijk,jkmnr->imnr', eps3, bS), g) + sT)
Gam = lambda y, e: Af(y) - b_of(y)                       # candidate chiral Levi-Civita connection of ghat_A, transported to E
FG = curvature_of(Gam)(x, 0.0)
g = gh(x); gi = jnp.linalg.inv(g)
two = lambda w: 0.5*jnp.einsum('ma,nb,imn,iab->', gi, gi, w, w)          # |.|^2 of an E-valued two-form (unordered pairs once)
cplus2 = 0.5*float(two(FG + K*SigmaA(x)))
# direct Riemannian curvature of ghat
cur = make_curvature(lambda y, e: gh(y))
Rl = jnp.einsum('lp,pkmn->lkmn', g, cur['riemann'](x, 0.0)); Ric = cur['ricci'](x, 0.0); s = float(cur['scalar'](x, 0.0)); Ric0 = Ric - s/4*g
Wt = (Rl - 0.5*(jnp.einsum('lm,kn->lkmn', g, Ric0) + jnp.einsum('kn,lm->lkmn', g, Ric0) - jnp.einsum('ln,km->lkmn', g, Ric0) - jnp.einsum('km,ln->lkmn', g, Ric0))
         - s/12*(jnp.einsum('lm,kn->lkmn', g, g) - jnp.einsum('ln,km->lkmn', g, g)))
up = lambda Tn: jnp.einsum('la,kb,mc,nd,lkmn->abcd', gi, gi, gi, gi, Tn)
sq = jnp.sqrt(jnp.linalg.det(g))
assert float(jnp.abs(jnp.einsum('lm,lkmn->kn', gi, Wt)).max()) < 1e-10, 'Weyl tensor must be trace-free'
Wstar = 0.5*sq*jnp.einsum('lkab,mnab->lkmn', jnp.einsum('lkmn,ma,nb->lkab', Wt, gi, gi), eps4)     # (W*)_{lkmn} = (1/2) W_{lk}^{ab} eps_{abmn} sqrt g
Wnorm2 = float(jnp.einsum('lkmn,lkmn->', Wt, up(Wt))); WWs = float(jnp.einsum('lkmn,lkmn->', Wstar, up(Wt)))
Wplus_op2 = 0.25*0.5*(Wnorm2 + WWs)                                       # |W^+|^2_op = (1/4)|W^+|^2_tensor,  |W^+|^2_tensor = (|W|^2 + <W,*W>)/2
Ric0n2 = float(jnp.einsum('ab,cd,ac,bd->', Ric0, Ric0, gi, gi))
direct = Wplus_op2 + Ric0n2/4 + (s-12*K)**2/48
print("     c_+^2 from the connection Gamma = %.10f ;  from the Riemann tensor of ghat = %.10f   [ |W+|^2=%.4f, |Ric0|^2/4=%.4f, (s-12K)^2/48=%.4f ]" % (cplus2, direct, Wplus_op2, Ric0n2/4, (s-12*K)**2/48))
ok("(transport:curvature-block) (1/2)|F_Gamma + K Sigma|^2 = |W+|^2 + |Ric0|^2/4 + (s-12K)^2/48 with Gamma = A - b", abs(cplus2-direct)/direct)

# strain, its covariant derivative, and the stated inequalities at this sample point
def nab_mat(Mf):
    def f(y):
        dM = jax.jacfwd(Mf)(y); A = Af(y); M = Mf(y)
        return jnp.einsum('ijc->cij',dM) + jnp.einsum('ikl,kc,lj->cij', eps3, A, M) + jnp.einsum('jkl,kc,il->cij', eps3, A, M)
    return f
Xf = nab_mat(Qf)
def Tf(y):
    Si = jnp.linalg.inv(Sf(y)); T = 0.5*jnp.einsum('ik,ckl,lj->cij', Si, Xf(y), Si)
    return T - jnp.einsum('cii->c', T)[:,None,None]*I3/3.0
def nabT(y):                                             # (nabla^A T)[d,c,i,j]
    dT = jax.jacfwd(Tf)(y); A = Af(y); T = Tf(y); Gm = chris(y)
    return (jnp.einsum('cijd->dcij', dT) - jnp.einsum('edc,eij->dcij', Gm, T)
            + jnp.einsum('ikl,kd,clj->dcij', eps3, A, T) + jnp.einsum('jkl,kd,cil->dcij', eps3, A, T))
T = Tf(x); nT = nabT(x); Q = Qf(x)
nT_ = float(jnp.sqrt(jnp.einsum('da,cb,dcij,abij->', gi, gi, nT, nT))); T_ = float(jnp.sqrt(jnp.einsum('cd,cij,dij->', gi, T, T)))
qn = float(jnp.sqrt(jnp.sum((Q-I3)**2))); cp = np.sqrt(cplus2)
rhs = K*qn + 6*nT_ + (42+8*np.sqrt(3))*T_**2
print("     c_+ = %.4f  <=  K|q| + 6|nabla T| + (42+8 sqrt3)|T|^2 = %.4f   (ratio %.3f)" % (cp, rhs, cp/rhs))
ok("(transport:curvature) holds at the sample point", max(0.0, cp/rhs-1))
Gnat = (nT_ + T_**2)/(2*K)                               # native units: g^F = 2K ghat
print("     |Q-I| = %.4f ,  native G = |nabla T| + |T|^2 = %.4f ,  ratio |Q-I|/G = %.3f  (manuscript: <= 72 once sup G <= eps_0 on H^2=0 bases)" % (qn, Gnat, qn/Gnat))

# (c) operator A = sum_i J_i (x) R_i
B5 = []
for (i,j) in [(0,1),(0,2),(1,2)]:
    M = np.zeros((3,3)); M[i,j]=M[j,i]=1/np.sqrt(2); B5.append(M)
B5.append(np.diag([1,-1,0])/np.sqrt(2)); B5.append(np.diag([1,1,-2])/np.sqrt(6)); B5 = np.array(B5)
e3 = np.asarray(eps3); et = np.asarray(etaP)
adm = [np.einsum('ijk,j->ik', e3, np.eye(3)[m]) for m in range(3)]
Rm = [np.array([[np.sum(B5[p]*(adm[m]@B5[q]-B5[q]@adm[m])) for q in range(5)] for p in range(5)]) for m in range(3)]   # R_i(H) = [ad e_i, H]
Jm = [et[m] for m in range(3)]                           # (J_i alpha)_b = alpha_a Sigma_i,ab  (iota_{alpha^#} Sigma_i)
Aop = sum(np.kron(Jm[m].T, Rm[m]) for m in range(3))
ev = np.round(np.linalg.eigvalsh((Aop+Aop.T)/2), 8)
ok("A = sum J_i (x) R_i is self-adjoint with A^2 = A + 6", max(np.abs(Aop-Aop.T).max(), np.abs(Aop@Aop-Aop-6*np.eye(20)).max()), 1e-10)
print("     spectrum of A:", {float(v): int((ev==v).sum()) for v in sorted(set(ev))}, " (manuscript: -2 with multiplicity 12, 3 with multiplicity 8)")
print("     sum_i R_i^2 = %.1f I  (manuscript: -6 I)" % float(np.trace(sum(R@R for R in Rm))/5))
