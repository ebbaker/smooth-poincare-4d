"""Pointwise-algebra checks (numpy/scipy only): Sections 3, 4, 5, 9, 12 of the manuscript.
Part of the checks supporting reviews/EXTERNAL_MANUSCRIPT_REVIEW_20261123.md (see README.md in this folder)."""
"""Independent pointwise-algebra checks for the manuscript
'Chiral curvature and metric evolution near the round four-sphere'.
All checks are numerical (float64) with random inputs; tolerances ~1e-10.
Indices: internal i=0..2, tangent a=0..3 (index 3 is the manuscript's '4')."""
import numpy as np, itertools
from scipy.linalg import expm, sqrtm
rng = np.random.default_rng(20261123)
def levi(n):
    e = np.zeros((n,)*n)
    for p in itertools.permutations(range(n)):
        e[p] = np.linalg.det(np.eye(n)[list(p)])
    return e
eps3, eps4 = levi(3), levi(4)
def make_eta(sign):
    eta = np.zeros((3,4,4))
    for i in range(3):
        eta[i,:3,:3] = eps3[i]
        eta[i,i,3] = sign; eta[i,3,i] = -sign
    return eta
etaP, etaM = make_eta(+1), make_eta(-1)
ok = lambda name, err, tol=1e-10: print(f"{'PASS' if err<tol else 'FAIL'}  {name:70s} err={err:.2e}")

# ---- (3.2)-(3.6): eta symbols, Sigma forms
star = lambda w: 0.5*np.einsum('abcd,cd->ab', eps4, w)       # Hodge star, orthonormal frame
for nm, eta, sg in (('+',etaP,1),('-',etaM,-1)):
    ok(f"*Sigma^{nm} = {nm}Sigma^{nm}", max(np.abs(star(eta[i])-sg*eta[i]).max() for i in range(3)))
    ok(f"<Sigma_i,Sigma_j> = 2 delta ({nm})", np.abs(0.5*np.einsum('iab,jab->ij',eta,eta)-2*np.eye(3)).max())
    comm = np.einsum('iab,jbc->ijac',eta,eta)-np.einsum('jab,ibc->ijac',eta,eta)
    ok(f"[eta_i,eta_j] = -2 eps_ijk eta_k ({nm})", np.abs(comm+2*np.einsum('ijk,kac->ijac',eps3,eta)).max())
ok("eta^+ and eta^- commute", np.abs(np.einsum('iab,jbc->ijac',etaP,etaM)-np.einsum('jab,ibc->ijac',etaM,etaP)).max())
wed = lambda a,b: 0.25*np.einsum('abcd,ab,cd->',eps4,a,b)    # coefficient of e^{1234}
ok("Sigma^+_i ^ Sigma^+_j = +2 delta dV", np.abs(np.array([[wed(etaP[i],etaP[j]) for j in range(3)] for i in range(3)])-2*np.eye(3)).max())
ok("Sigma^-_i ^ Sigma^-_j = -2 delta dV", np.abs(np.array([[wed(etaM[i],etaM[j]) for j in range(3)] for i in range(3)])+2*np.eye(3)).max())
ok("Sigma^+_i ^ Sigma^-_j = 0", np.abs(np.array([[wed(etaP[i],etaM[j]) for j in range(3)] for i in range(3)])).max())
# (7.8) eta_k,ab eta_j,cb = delta_kj delta_ac + eps_kjl eta_l,ac   (self-dual symbols)
lhs = np.einsum('kab,jcb->kjac',etaP,etaP)
rhs = np.einsum('kj,ac->kjac',np.eye(3),np.eye(4))+np.einsum('kjl,lac->kjac',eps3,etaP)
ok("(7.8) eta_k,ab eta_j,cb = d_kj d_ac + eps_kjl eta_l,ac", np.abs(lhs-rhs).max())
lhs = np.einsum('iab,ide->abde',etaP,etaP)
I4 = np.eye(4)
rhs = np.einsum('ad,be->abde',I4,I4)-np.einsum('ae,bd->abde',I4,I4)+eps4
ok("sum_i eta_i,ab eta_i,de = d d - d d + eps_abde  (before (8.18))", np.abs(lhs-rhs).max())

# ---- two different two-form bases: Section 3 (eta symbols) versus (4.2)
def two_form(pairs):
    w = np.zeros((4,4))
    for (a,b,c) in pairs: w[a-1,b-1]+=c; w[b-1,a-1]-=c
    return w
S4P = np.array([two_form([(1,2,1),(3,4,1)]), two_form([(1,3,1),(2,4,-1)]), two_form([(1,4,1),(2,3,1)])])
S4M = np.array([two_form([(1,2,1),(3,4,-1)]), two_form([(1,3,1),(2,4,1)]), two_form([(1,4,1),(2,3,-1)])])
P = 0.25*np.einsum('iab,jab->ij',S4P,etaP)   # S4P_i = P_ij etaP_j
N = 0.25*np.einsum('iab,jab->ij',S4M,etaM)
print("     basis (4.2)^+ in terms of Section-3 Sigma^+:\n", P, " det =", round(np.linalg.det(P)))
print("     basis (4.2)^- in terms of Section-3 Sigma^-:\n", N, " det =", round(np.linalg.det(N)))

# ---- Lemma 4.1: beta, norm identity, exact graph formula
def D_H(H, w):   # (4.4) on a two-form with components w_ab ; H symmetric (acts on coframe indices)
    return 0.5*(H@w + w@H.T)
def beta(H, SP=S4P, SM=S4M):
    out = np.zeros((3,3))
    for i in range(3):
        d = D_H(H, SP[i])
        # self-dual component must vanish for trace-free H
        assert max(abs(0.5*np.sum(d*SP[j])) for j in range(3)) < 1e-12
        out[i] = [0.25*np.sum(d*SM[j]) for j in range(3)]
    return out
def rand_sym0(scale=1.0):
    A = rng.normal(size=(4,4)); H = (A+A.T)/2; return scale*(H-np.trace(H)/4*np.eye(4))
H = rand_sym0()
ok("(4.6) |beta(H)|^2 = |H|^2/4", abs(np.sum(beta(H)**2)-np.sum(H*H)/4))
h = rng.normal(size=4); h -= h.mean()
ok("(4.7) diagonal beta", np.abs(beta(np.diag(h))-np.diag([(h[0]+h[1])/2,(h[0]+h[2])/2,(h[0]+h[3])/2])).max())
def graph_of_metric(H):
    """graph matrix T of Lambda^+_{g_H} over Lambda^+_g, computed directly from the coframe e_H = exp(H/2) e"""
    M = expm(H/2)                       # e_H^a = M_ab e^b
    SH = np.array([M.T@S4P[i]@M for i in range(3)])   # components of Sigma^+ built from e_H, in the e-basis
    A = 0.25*np.einsum('iab,jab->ij',SH,S4P); B = 0.25*np.einsum('iab,jab->ij',SH,S4M)
    return np.linalg.solve(A,B)
H = rand_sym0(0.7); b = beta(H)
bbT = b@b.T; r = np.real(sqrtm(bbT))
Tex = np.linalg.solve(r, np.real(__import__('scipy.linalg').linalg.tanhm(r)))@b
ok("Lemma 4.1 exact graph T = tanh(sqrt(bb^T))/sqrt(bb^T) b", np.abs(graph_of_metric(H)-Tex).max())
errs=[]
for s in (1e-1,5e-2,2.5e-2):
    Hs=s*H; bs=beta(Hs); errs.append(np.abs(graph_of_metric(Hs)-(bs-bs@bs.T@bs/3)).max())
print("     (4.8) cubic truncation errors at scale 0.1,0.05,0.025:", ["%.2e"%e for e in errs], "ratios", ["%.1f"%(errs[i]/errs[i+1]) for i in range(2)], "(expect ~32 for O(H^5))")
# Lemma 4.2 inverse formula
T = graph_of_metric(H); TT=T@T.T; rt=np.real(sqrtm(TT))
binv = np.linalg.solve(rt, np.real(__import__('scipy.linalg').linalg.logm((np.eye(3)+rt)@np.linalg.inv(np.eye(3)-rt)))/2)@T
ok("Lemma 4.2 inverse beta = arctanh(sqrt(TT^T))/sqrt(TT^T) T", np.abs(binv-b).max())

# ---- Proposition 4.4: operator C b = *[b,Sigma]
def Cop(bmat):       # b[j,d] -> (C b)[i,c] = eps_ijk eta_k,dc b_jd
    return np.einsum('ijk,kdc,jd->ic',eps3,etaP,bmat)
Cmat = np.zeros((12,12))
for n in range(12):
    e = np.zeros(12); e[n]=1; Cmat[:,n] = Cop(e.reshape(3,4)).reshape(12)
ok("C^2 + C - 2 = 0", np.abs(Cmat@Cmat+Cmat-2*np.eye(12)).max())
ok("C self-adjoint", np.abs(Cmat-Cmat.T).max())
ev = np.round(np.linalg.eigvalsh(Cmat),8); print("     spectrum of C:", {float(v):int((ev==v).sum()) for v in sorted(set(ev))})
# check that C b really is *[b ^ Sigma]: three-form (b_j ^ Sigma_k)_{abc}, then Hodge dual to a one-form
bm = rng.normal(size=(3,4))
three = np.zeros((3,4,4,4))
for i in range(3):
    for j in range(3):
        for k in range(3):
            if eps3[i,j,k]!=0:
                t = np.einsum('a,bc->abc',bm[j],etaP[k])
                three[i] += eps3[i,j,k]*(t + np.einsum('abc->bca',t) + np.einsum('abc->cab',t))   # (b^Sigma)_{abc}
dual = np.einsum('iabc,abcd->id',three,eps4)/6.0     # (*w)_d = (1/3!) w_abc eps_abcd
ok("C b equals the Hodge dual of [b ^ Sigma] (sign as in the manuscript)", np.abs(dual-Cop(bm)).max())

# ---- Lemma 5.1: random algebraic curvature tensor
def rand_curv():
    A = rng.normal(size=(4,4,4,4))
    R = A - A.transpose(1,0,2,3); R = R - R.transpose(0,1,3,2); R = R + R.transpose(2,3,0,1)
    R = R - (R + R.transpose(0,2,3,1) + R.transpose(0,3,1,2))/3.0     # first Bianchi
    return R
R = rand_curv()
assert np.abs(R + R.transpose(0,2,3,1) + R.transpose(0,3,1,2)).max()<1e-12 and np.abs(R-R.transpose(2,3,0,1)).max()<1e-12
Ric = np.einsum('abad->bd',R); s = np.trace(Ric); Ric0 = Ric - s/4*np.eye(4)
# F_i = -(1/2) eta_i,ab R_ab , R_ab = (1/2) R_abcd e^c e^d  (manuscript (3.7)); internal index tied to Section-3 basis
F3 = np.array([-0.5*np.einsum('ab,abcd->cd',etaP[i],R) for i in range(3)])
C3 = -0.25*np.einsum('icd,jcd->ij',F3,etaP); B3 = -0.25*np.einsum('icd,jcd->ij',F3,etaM)
W3 = C3 - np.trace(C3)/3*np.eye(3)
ok("C_+ symmetric, tr C_+ = s/4", max(np.abs(C3-C3.T).max(), abs(np.trace(C3)-s/4)))
ok("(5.2) B = beta(Ric_0) in Section-3 paired bases", np.abs(B3-beta(Ric0,etaP,etaM)).max())
# same statement in the (4.2) paired bases, internal index rotated accordingly
F4 = np.einsum('ij,jcd->icd',P,F3)
C4 = -0.25*np.einsum('icd,jcd->ij',F4,S4P); B4 = -0.25*np.einsum('icd,jcd->ij',F4,S4M)
ok("(5.2) B = beta(Ric_0) in the (4.2) paired bases", np.abs(B4-beta(Ric0)).max())
ok("(5.2) |B|^2 = |Ric_0|^2/4", abs(np.sum(B4**2)-np.sum(Ric0**2)/4))
M4 = C4@C4-B4@B4.T
ok("(5.3) F_i^F_j = 2 (C^2 - B B^T)_ij dV", np.abs(np.array([[wed(F4[i],F4[j]) for j in range(3)] for i in range(3)])-2*M4).max())
# Weyl tensor norm: tensor norm^2 = 4 * operator norm^2  (W^+ block + W^- block)
I=np.eye(4)
Wt = R - 0.5*(np.einsum('ac,bd->abcd',I,Ric0)+np.einsum('bd,ac->abcd',I,Ric0)-np.einsum('ad,bc->abcd',I,Ric0)-np.einsum('bc,ad->abcd',I,Ric0)) - s/12*(np.einsum('ac,bd->abcd',I,I)-np.einsum('ad,bc->abcd',I,I))
ok("Weyl part is totally trace-free", np.abs(np.einsum('abad->bd',Wt)).max())
Fm = np.array([-0.5*np.einsum('ab,abcd->cd',etaM[i],R) for i in range(3)])
Cm = -0.25*np.einsum('icd,jcd->ij',Fm,etaM); Wm = Cm-np.trace(Cm)/3*np.eye(3)
ok("|W|^2_tensor = 4(|W^+|^2+|W^-|^2)_operator", abs(np.sum(Wt**2)-4*(np.sum(W3**2)+np.sum(Wm**2))))

# ---- Proposition 9.1 exact energy algebra
a = 1.3; W = W3; Bm = B3
Cc = a*np.eye(3)+W; Mm = Cc@Cc-Bm@Bm.T; t = np.trace(Mm); Q = 3*Mm/t
dens = np.sum((Q-np.eye(3))**2)*(2*t/3)
tf = lambda X: X-np.trace(X)/3*np.eye(3)
ok("(9.4) integrand 6|[2aW+W^2-BB^T]_0|^2/t", abs(dens-6*np.sum(tf(2*a*W+W@W-Bm@Bm.T)**2)/t))
w2=np.trace(W@W); b2=np.trace(Bm@Bm.T); N2=tf(W@W-Bm@Bm.T); C3s=np.trace(W@W@W)-np.trace(W@Bm@Bm.T)
ok("(9.5) exact discrepancy integrand", abs(dens/8-w2-(3*a*C3s+0.75*np.sum(N2**2)-w2**2+b2*w2)/t))

# ---- Proposition 12.1 / 12.2
lam = rng.dirichlet(np.ones(3))*3
ok("(12.1) m >= 1 - sqrt(2/3)|Q-I| (random spectra)", max(0.0, (1-np.sqrt(2/3)*np.sqrt(np.sum((lam-1)**2)))-lam.min()))
K=0.7
for z in (0.3,0.9,0.999):
    e_=z*K; Bz=e_*np.diag([0.,-1,-1]); Cz=K*np.eye(3); Mz=Cz@Cz-Bz@Bz.T; tz=np.trace(Mz); Qz=3*Mz/tz
    dens = np.sum((Qz-np.eye(3))**2)*(2*tz/3)
    al = np.log((1-z)/(1+z)); Hh=np.diag([al,-al,0,0])
    okT = np.abs(graph_of_metric(Hh)-np.linalg.solve(Cz,Bz)).max()
    ok(f"Prop 12.2 z={z}: density 4K^2 z^4/(3-2z^2), graph diag(0,-z,-z)", max(abs(dens-4*K**2*z**4/(3-2*z**2)), okT))
    ok(f"Prop 12.2 z={z}: B = beta(Ric_0) with Ric_0=diag(-2e,2e,0,0)", np.abs(beta(np.diag([-2*e_,2*e_,0,0]))-Bz).max())

# ---- Section 3.3: quaternionic form (3.15) and the patching of Proposition 3.2
def qmul(p, q):       # quaternions as (x1,x2,x3,x4) = x4 + x1 i + x2 j + x3 k
    pv, pw, qv, qw = p[:3], p[3], q[:3], q[3]
    return np.concatenate([pw*qv + qw*pv + np.cross(pv, qv), [pw*qw - pv@qv]])
conj = lambda q: np.concatenate([-q[:3], [q[3]]])
qinv = lambda q: conj(q)/(q@q)
ell = 1.3; xq = rng.normal(size=4); r = np.linalg.norm(xq); qu = xq/r
def Aplus(x, dx):  return qmul(conj(x), dx)[:3]/(ell**2 + x@x)          # Im(xbar dx)/(l^2+|x|^2)
def Aminus(x, dx): return qmul(x, conj(dx))[:3]/(ell**2 + x@x)          # Im(x dxbar)/(l^2+|x|^2)
D = ell**2 + xq@xq
errP = max(np.abs(Aplus(xq, np.eye(4)[m]) - np.array([etaP[k,m,:]@xq for k in range(3)])/D).max() for m in range(4))
errM = max(np.abs(Aminus(xq, np.eye(4)[m]) - np.array([etaM[k,m,:]@xq for k in range(3)])/D).max() for m in range(4))
ok("(3.15) quaternionic A^+, A^- agree with (3.13) (units = 2T_i)", max(errP, errM))
yq = ell**2*qinv(xq)
def pull(Afun, m):                                   # pull back the y-chart expression along y = l^2 x^{-1}
    dx = np.eye(4)[m]; dy = -ell**2*qmul(qmul(qinv(xq), dx), qinv(xq)); return Afun(yq, dy)
def gauge(Avec, h, dh):                              # h^{-1} A h + h^{-1} dh  (imaginary part)
    Aq = np.concatenate([Avec, [0.0]]); return (qmul(qmul(qinv(h), Aq), h) + qmul(qinv(h), dh))[:3]
errs = []
for m in range(4):
    dx = np.eye(4)[m]; dq = dx/r - xq*(xq@dx)/r**3              # d(x/|x|)
    hP, dhP = qinv(qu), -qmul(qmul(qinv(qu), dq), qinv(qu))      # h^+ = q^{-1}
    hM, dhM = qu, dq                                             # h^- = q
    errs += [np.abs(gauge(Aplus(xq, dx), hP, dhP) - pull(Aplus, m)).max(), np.abs(gauge(Aminus(xq, dx), hM, dhM) - pull(Aminus, m)).max()]
ok("Prop 3.2: gauge changes h^+ = q^{-1}, h^- = q give the same formulas in y = l^2 x^{-1}", max(errs))
