"""Exact polynomial checks for the formulas in the accompanying manuscript.

No third-party dependencies. The proof applies to arbitrary holomorphic profiles;
these checks independently exercise polynomial profiles with mixed u,z dependence.
"""
from fractions import Fraction as F
from math import comb, factorial

# Sparse Laurent polynomials in (u,v,z,w,zeta); only zeta has negative powers.
ZERO = (0, 0, 0, 0, 0)
def clean(p):
    return {e: F(c) for e, c in p.items() if c}
def const(c):
    return clean({ZERO: c})
def mon(e, c=1):
    return clean({e: c})
def add(*ps):
    out = {}
    for p in ps:
        for e, c in p.items():
            out[e] = out.get(e, 0) + c
    return clean(out)
def scale(p, c):
    return clean({e: c * q for e, q in p.items()})
def sub(p, q):
    return add(p, scale(q, -1))
def mul(p, q):
    out = {}
    for e, c in p.items():
        for f, d in q.items():
            k = tuple(a+b for a, b in zip(e, f))
            out[k] = out.get(k, 0) + c*d
    return clean(out)
def deriv(p, j):
    out = {}
    for e, c in p.items():
        if e[j]:
            f = list(e); f[j] -= 1
            out[tuple(f)] = c*e[j]
    return clean(out)
def power(p, n):
    out = const(1)
    for _ in range(n):
        out = mul(out, p)
    return out

def var(j, n=1):
    e = [0]*5; e[j] = n
    return mon(tuple(e))
u, v, z, w, zeta = [var(j) for j in range(5)]
mu = var(4, -1)
p = sub(z, mul(zeta, u))

def primitives(m, n):
    J, I = {}, {}
    for k in range(n+1):
        c = F((-1)**k * comb(n,k) * factorial(m) * factorial(k),
              2*factorial(m+k+1))
        J = add(J, mon((m+k+1,0,n-k,0,k), c))
    for k in range(m+1):
        c = F((-1)**k * comb(m,k) * factorial(n) * factorial(k),
              2*factorial(n+k+1))
        I = add(I, mon((m-k,0,n+k+1,0,-k-2), c))
    tc = F((-1)**m * factorial(m)*factorial(n), 2*factorial(m+n+1))
    T = scale(mul(var(4,-m-2), power(p,m+n+1)),tc)
    bc = F((-1)**m * factorial(m)*factorial(n),2*factorial(m+n))
    beta = scale(mul(var(4,-m-1),power(p,m+n)),bc)
    return J,I,T,beta

checks = 0
for m in range(6):
    for n in range(6):
        H = mon((m,0,n,0,0))
        J,I,T,beta = primitives(m,n)
        assert add(deriv(J,0),mul(zeta,deriv(J,2))) == scale(H,F(1,2))
        assert add(deriv(I,2),mul(mu,deriv(I,0))) == scale(mul(power(mu,2),H),F(1,2))
        assert sub(I,mul(mu,J)) == T
        h0 = scale(deriv(J,2),-1)
        hinf = sub(deriv(I,0),scale(mul(mu,H),F(1,2)))
        assert sub(h0,hinf) == beta
        def L0(f):
            return add(deriv(f,0),scale(mul(H,deriv(f,1)),F(-1,2)),mul(zeta,deriv(f,2)))
        def L1(f):
            return add(scale(deriv(f,3),-1),mul(zeta,deriv(f,1)))
        q = add(v,mul(zeta,w),J)
        assert not L0(p) and not L1(p) and not L0(q) and not L1(q)
        coords = [z,scale(u,-1),add(v,J,scale(mul(zeta,deriv(J,4)),-1)),add(w,deriv(J,4))]
        assert list(map(L0,coords)) == [zeta,const(-1),scale(mul(zeta,h0),-1),h0]
        assert list(map(L1,coords)) == [{},{},zeta,const(-1)]
        assert L0(h0) == scale(deriv(H,2),F(-1,2))
        assert L0(hinf) == scale(deriv(H,2),F(-1,2))
        assert not L1(h0) and not L1(hinf)
        tangent = list(map(lambda x: deriv(x,4),coords))
        Jzz = deriv(deriv(J,4),4)
        assert tangent == [{},{},scale(mul(zeta,Jzz),-1),Jzz]
        checks += 1
print(f'All exact checks passed for {checks} monomial profiles u^m z^n, 0 <= m,n <= 5.')
print('Verified characteristic primitives, twistor transition, splitting, first integrals, Shaw pushforwards, null trajectories, and reconstructed connection coefficients.')
