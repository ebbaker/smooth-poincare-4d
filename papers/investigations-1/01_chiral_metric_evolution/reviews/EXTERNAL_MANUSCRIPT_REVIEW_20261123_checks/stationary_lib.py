"""Shared implementation of the pointwise stationary derivative form of Section 6.3 of the manuscript
(used by check_09 and check_11).  Requires numpy, jax (CPU, float64).

For D = diag(1,u,v), c^2 = 3/(1+u^2+v^2), S = cD, Q = S^2 (tr Q = 3) and K = 1, with F = -S Sigma:
  * X = (X_a), a = 1..4: four symmetric trace-free 3x3 matrices (20 unknowns), standing for nabla_a^A Q;
  * zero-speed map   V_ib = 4 sum_c C_c,ik F_k,cb,   C_a = X_a - tr(Q X_a) I/3      (old velocity at K = 1);
  * quadratic form   R_Q(X) = sum_a <X_a, L_Q X_a> - <Q - I, [X_a, Xi_a]>,
        L_Q X = 2(QX + XQ) - (4/3) tr(QX) Q,   Xi_a = 2[nabla_a S, S] + 4 S ad(b_a) S,
    with nabla S from the Sylvester equation and b from the compatibility inverse of Proposition 4.4.
These are written directly from the definitions; the manuscript's edge parametrisation of ker V is implemented
separately in edge_to_X so that the two can be compared."""
import itertools, numpy as np, jax, jax.numpy as jnp
jax.config.update("jax_enable_x64", True)

def levi(n):
    e = np.zeros((n,)*n)
    for p in itertools.permutations(range(n)): e[p] = np.linalg.det(np.eye(n)[list(p)])
    return e
eps3 = jnp.array(levi(3)); eps4 = jnp.array(levi(4))
_eta = np.zeros((3,4,4))
for i in range(3):
    _eta[i,:3,:3] = levi(3)[i]; _eta[i,i,3] = 1; _eta[i,3,i] = -1
etan = _eta; eta = jnp.array(_eta); I3 = jnp.eye(3)
Jop = [etan[i].T for i in range(3)]              # (J_i alpha)_c = eta_{i,dc} alpha_d = (iota_alpha Sigma_i)_c

# orthonormal (Frobenius) basis of symmetric trace-free 3x3 matrices
_B5 = []
for (i,j) in [(0,1),(0,2),(1,2)]:
    M = np.zeros((3,3)); M[i,j]=M[j,i]=1/np.sqrt(2); _B5.append(M)
_B5.append(np.diag([1,-1,0])/np.sqrt(2)); _B5.append(np.diag([1,1,-2])/np.sqrt(6))
B5n = np.array(_B5); B5 = jnp.array(_B5)
def unpack(z): return jnp.einsum('an,nij->aij', z.reshape(4,5), B5)          # X[a,i,j]
def pack(X_aij): return np.einsum('aij,nij->an', np.asarray(X_aij), B5n).reshape(20)

def pieces(z, u, v):
    d = jnp.array([1.0, u, v]); c = jnp.sqrt(3.0/(1+u*u+v*v)); s = c*d
    S = jnp.diag(s); Q = S@S; X = unpack(z)
    C = X - jnp.einsum('aij,ji->a', X, Q)[:,None,None]*I3/3.0
    F = -jnp.einsum('k,kcb->kcb', s, eta)                                    # F_k = -K S Sigma, K = 1
    V = 4*jnp.einsum('cik,kcb->ib', C, F)                                    # zero-speed map
    dS = X/(s[:,None]+s[None,:])[None,:,:]                                   # Sylvester
    P = jnp.einsum('i,aij->aij', 1/s, dS)                                    # S^{-1} nabla_a S
    JP = jnp.einsum('jdc,dij->ic', eta, P)                                   # *(P ^ Sigma)
    Cop = lambda b: jnp.einsum('ijk,kdc,jd->ic', eps3, eta, b)
    b = -0.5*(Cop(JP) + JP)                                                  # b = -C^{-1} J(P)
    adb = jnp.einsum('ijk,ja->aik', eps3, b)
    Xi = 2*(jnp.einsum('aik,kj->aij', dS, S) - jnp.einsum('ik,akj->aij', S, dS)) + 4*jnp.einsum('ik,akl,lj->aij', S, adb, S)
    LQX = 2*(jnp.einsum('ik,akj->aij', Q, X) + jnp.einsum('aik,kj->aij', X, Q)) - (4.0/3.0)*jnp.einsum('aij,ji->a', X, Q)[:,None,None]*Q
    comm = jnp.einsum('aik,akj->aij', X, Xi) - jnp.einsum('aik,akj->aij', Xi, X)
    R = jnp.einsum('aij,aij->', X, LQX) - jnp.einsum('ij,aij->', Q - I3, comm)
    return V.reshape(12), R

_jacV = jax.jit(jax.jacfwd(lambda z, u, v: pieces(z, u, v)[0]))
_hesR = jax.jit(jax.hessian(lambda z, u, v: pieces(z, u, v)[1]))
_z0 = jnp.zeros(20)
def matrices(u, v):
    """(12x20 matrix of X -> V,  20x20 symmetric matrix of R_Q)  at D = diag(1,u,v)"""
    return np.asarray(_jacV(_z0, float(u), float(v))), 0.5*np.asarray(_hesR(_z0, float(u), float(v)))
def kernel_split(Vmat):
    U, sv, Vt = np.linalg.svd(Vmat); rank = int((sv > 1e-10*sv[0]).sum())
    return rank, sv[:rank], Vt[rank:].T, Vt[:rank].T                         # rank, singular values, ker basis, complement basis
def analyse(u, v):
    """rank, kernel dimension, min of R_Q/|X|^2 on ker V, min of R_Q/|X|^2 on all X"""
    Vmat, Hq = matrices(u, v); rank, sv, N, P = kernel_split(Vmat)
    return rank, N.shape[1], np.linalg.eigvalsh(N.T@Hq@N).min(), np.linalg.eigvalsh(Hq).min()

def edge_to_X(Z12, Z13, Z23, u, v):
    """manuscript's parametrisation (eq:stationary-edge-kernel) of ker V by three edge covectors; returns X[a,i,j]"""
    d = np.array([1.0, u, v])
    Z = {(0,1): np.asarray(Z12, float), (0,2): np.asarray(Z13, float), (1,2): np.asarray(Z23, float)}
    for (i,j) in list(Z): Z[(j,i)] = -Z[(i,j)]
    H = np.zeros((3,3,4))
    for i in range(3):
        for j in range(3):
            if i != j: H[i,j] = -Jop[i]@Jop[j]@Z[(i,j)]
        H[i,i] = sum(d[j]*Z[(i,j)] for j in range(3) if j != i)/d[i]
    assert np.abs(H - H.transpose(1,0,2)).max() < 1e-12
    Xk = H - np.einsum('iia->a', H)[None,None,:]*np.eye(3)[:,:,None]/3.0        # X[i,j,a]
    return Xk.transpose(2,0,1), H, Z
def scalar_block(u, v, Hq=None):
    """the 3x3 block G of (eq:stationary-scalar-block): R_Q(X(Z))/(4 c^2) = sum_a Z_a^T G Z_a, edge order (12,13,23);
    also returns the largest deviation of the 12x12 edge form from G (x) I_4"""
    if Hq is None: Hq = matrices(u, v)[1]
    c2 = 3.0/(1+u*u+v*v); cols = []
    for p in range(3):
        for a in range(4):
            Zs = [np.zeros(4), np.zeros(4), np.zeros(4)]; Zs[p][a] = 1.0
            cols.append(pack(edge_to_X(Zs[0], Zs[1], Zs[2], u, v)[0]))
    E = np.array(cols).T                                                        # 20 x 12, columns ordered (p,a)
    G12 = (E.T@Hq@E)/(4*c2); G = G12.reshape(3,4,3,4)
    Gs = np.einsum('paqa->pq', G)/4.0
    dev = np.abs(G12 - np.kron(Gs, np.eye(4))).max()
    return Gs, dev, E
def Lpoly(u, v): return 12*(u*v)**3*(1+u)*(1+v)*(u+v)
