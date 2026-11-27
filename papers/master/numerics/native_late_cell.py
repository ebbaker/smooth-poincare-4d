#!/usr/bin/env python3
"""Outward-rounded scalar and kinetic densities on a late Miller–Schupp cell.

The native length and residual certificate supplies the true parameter box,
|u-v_p| < 0.000193 and |du-dv_p| < 0.0034 on the tube footprints. This replay
starts with those proved inputs rather than the FEM fit. Tested cells are
centered at (s, lambda, w, tan(psi/2)) = (.120, .32, .2, .4).
See notes/NATIVE_MARKED_JET_CERTIFICATE_20261127.md for the source versions.

For G=tA+aB, t=1-a, evaluate curvature in B-normal coordinates at the
point, keeping all contractions in the exterior chart by tensoriality.
The connection difference S=Gamma_A-Gamma_B is a tensor. Set L=A S and
V_ijk=(t_i D_jk+t_j D_ik-t_k D_ij)/2, D=A-B. The connection change is
-Q_W(S,S)+2t Q_Gi(L,V)+Q_Gi(V,V), with W=ta B Gi A and the bilinear
contractions defined below. The B-end curvature factors through t.

The cutoff Hessian part containing t'' is -t'' |ds|_G^2 tr_h D_T.
For the square term let n be the G-unit radial normal, E=h^-1 D_T,
T=tr(E) and U=tr(E^2). Then Q_Gi(V,V) equals
t'^2 |ds|_G^2 (3U-T^2+2D_nn*T)/4. To check it in a G-orthonormal frame,
with p=dt^sharp, 4|V|^2=3|p|^2 tr(D^2)-2|Dp|^2 and
tr(V)=Dp-(tr(D)/2)p. Subtract the squared trace and split the normal
and tangential blocks. All squared normal and mixed entries cancel.

Strict negativity is only for this cell. A uniform step of 2e-5 in
each physical variable, even restricted to a late radial slab, would
need on the order of 10^17 boxes. The signs of the full integral and
the physical eigenvalues are not certified by this local calculation.
"""

import json
import math
from pathlib import Path
from fractions import Fraction as F
from itertools import product
from cuff_length_certificate import Interval as I, add, multiply as mul, powers, reciprocal, complex_scale as sc, absolute_square
from native_harmonic_measures import validated_potential

def rr(x):
    return I.rational(F(x))

def size(i):
    return i.magnitude()

def span(center, width):
    return I((rr(center)-rr(width)).lo, (rr(center)+rr(width)).hi)
def neg(z):
    return sc(z,-1)

def cp(z):
    return z[0],-z[1]


def atan(x,n):
    terms=sum(((-1)**j*x**(2*j+1)/(2*j+1) for j in range(n)), F(0))
    next_=x**(2*n+1)/(2*n+1)
    return I(rr(min(terms,terms+(-1)**n*next_)).lo,rr(max(terms,terms+(-1)**n*next_)).hi)

pi=16*atan(F(1,5),24)-4*atan(F(1,239),24)
def trig(x):
    assert size(x)<2
    even, odd = I(1), x
    c,s=even,odd
    for j in range(1,19):
        even=-even*x.square()/((2*j-1)*(2*j))
        odd=-odd*x.square()/((2*j)*(2*j+1))
        c,s=c+even,s+odd
    err=rr(F(2)**38/math.factorial(38))
    uncertainty=I(-err.hi,err.hi)
    return c+uncertainty,s+uncertainty

def calc_step(x):
    g=(I(1)/(I(1)-x)-I(1)/x).exp()
    a=g/(1+g)
    b=I(1)/(1+g)
    mp=I(1)/x.square()+I(1)/(I(1)-x).square()
    mpp=I(-2)/(x.square()*x)+I(2)/((I(1)-x).square()*(1-x))
    return a,b,a*b*mp,a*b*((1-2*a)*mp.square()+mpp)

def zero(n,m):
    return [[I(0) for _ in range(m)] for _ in range(n)]

def eye(n):
    return [[I(int(i==j)) for j in range(n)] for i in range(n)]

def trans(a):
    return list(map(list,zip(*a)))

def dot(a,b):
    return sum(x*y for x,y in zip(a,b))

def mv(a,b):
    return [dot(row,b) for row in a]

def mm(a,b):
    return [[dot(r,c) for c in zip(*b)] for r in a]

def outer(a,b):
    return [[x*y for y in b] for x in a]

def scale(a,x):
    return [[x*y for y in r] for r in a]

def lin(a,b,p=1,q=1):
    return [[p*x+q*y for x,y in zip(ar,br)] for ar,br in zip(a,b)]

def tr(a):
    return sum(a[i][i] for i in range(len(a)))

def determinant(a):
    if len(a)==2: return a[0][0]*a[1][1]-a[0][1]*a[1][0]
    return sum((-1)**j*a[0][j]*determinant([r[:j]+r[j+1:] for r in a[1:]]) for j in range(len(a)))
def ldlinv(a):
    n=len(a)
    L=eye(n); d=[]
    for j in range(n):
        d.append(a[j][j]-sum(L[j][k].square()*d[k] for k in range(j)))
        assert d[-1].lo>0
        for i in range(j+1,n):
            L[i][j]=(a[i][j]-sum(L[i][k]*L[j][k]*d[k] for k in range(j)))/d[-1]
    V=eye(n)
    for i in range(n):
        for j in range(i):
            V[i][j]=-sum(L[i][k]*V[k][j] for k in range(j,i))
    return [[sum(V[k][i]*V[k][j]/d[k] for k in range(n)) for j in range(n)] for i in range(n)], d

def cheb_first(x,n):
    m=I((x.lo+x.hi)/2)
    delta=x-m
    d=I(0,size(delta))
    v=[I(1),m]; p=[I(0),I(1)]
    for j in range(2,n+1):
        v.append(2*m*v[-1]-v[-2])
        p.append(2*v[-2]+2*m*p[-1]-p[-2])
    assert x.lo > -1 and x.hi < 1
    # T_j' is j times U_{j-1}, a nonnegative combination of T_k
    # with coefficients summing to j. Apply |T_k'|<=k^2 to that
    # same combination to obtain |T_j''|<=j^2*(j^2-1)/3.
    for j in range(1,n+1):
        e=d*j*j
        ep=d*j*j*(j*j-1)/3
        v[j]+=I(-e.hi,e.hi)
        p[j]+=I(-ep.hi,ep.hi)
    return v,p

def chart(z,degree,cycles,center):
    if center==0:
        t=sc(z,.25); tp=(I(.25),I(0))
    else:
        d=reciprocal((z[0]-center,z[1]))
        t=sc(d,.25); tp=sc(mul(d,d),-.25)
    r2=absolute_square(t)
    v,p=cheb_first(2*r2-1,degree)
    pt=powers(t,max(cycles))
    fields=[]
    for k in cycles:
        ang=pt[k][0]
        angd=sc(mul(pt[k-1],tp),k) if k else (I(0),I(0))
        rad=mul(cp(t),tp)
        for j in range(degree+1):
            fields.append((ang*v[j],angd[0]*v[j]+4*ang*p[j]*rad[0],
                           -angd[1]*v[j]-4*ang*p[j]*rad[1]))
    return fields

def comparator(z,data):
    modes,degree=data['modes'],data['degree']
    outer=chart(z,degree,range(0,modes+1,2),0)
    right=chart(z,degree,range(modes+1),1)
    left=chart(z,degree,range(modes+1),-1)
    basis=outer+[tuple(x+(-1)**(i//(degree+1))*y for x,y in zip(a,b)) for i,(a,b) in enumerate(zip(right,left))]
    params=[span(F.from_float(float.fromhex(x)),w) for x,w in zip(data['parameters'],[F(2,100000),F(5,100000)])]
    deltas=[span(0,w) for w in [F(2,100000),F(5,100000)]]
    co=[float.fromhex(x) for x in data['coefficients']]
    rs=[[float.fromhex(x) for x in v] for v in data['response']]
    vals=[]
    for t in range(3):
        vals.append(sum(row[t]*c for row,c in zip(basis,co))
                   +sum(delta*sum(row[t]*a[i] for row,a in zip(basis,rs)) for i,delta in enumerate(deltas)))
    zz=mul(z,z)
    d=(zz[0]-1,zz[1])
    vals[0]+=absolute_square(z)/64-.75*absolute_square(d).log()+span(0,'.000193')
    f=add(sc(cp(z),1/32),sc(mul(z,reciprocal(d)),-3))
    vals[1]+=f[0]+span(0,'.0034')
    vals[2]+=-f[1]+span(0,'.0034')
    return vals,params

def pole(z, coeff):
    d=reciprocal((z[0]-1,z[1])); b=reciprocal((16-z[0],-z[1]))
    dd=mul(d,d); bb=mul(b,b)
    v=neg(add(d,b)); dv=add(dd,neg(bb))
    x=sc(d,.25); y=sc(mul(z,b),.25)
    xp=sc(dd,-.25); yp=sc(bb,4)
    xpp=sc(mul(dd,d),.5); ypp=sc(mul(bb,b),8)
    xp2=mul(xp,xp); yp2=mul(yp,yp)
    xpowers=powers(x,len(coeff)-1); ypowers=powers(y,len(coeff)-1)
    for k,c in enumerate(coeff,1):
        v=add(v,sc(add(mul(xpowers[k-1],xp),neg(mul(ypowers[k-1],yp))),k*c))
        change=add(mul(xpowers[k-1],xpp),neg(mul(ypowers[k-1],ypp)))
        if k>1:
            change=add(change,sc(add(mul(xpowers[k-2],xp2),neg(mul(ypowers[k-2],yp2))),k-1))
        dv=add(dv,sc(change,k*c))
    return v,dv

def metric(z,data,multipoles):
    (u,ux,uy),par=comparator(z,data)
    phi=(I(0),I(0)); dp=phi
    for parity,coeff,param in zip((1,-1),multipoles,par):
        v,dv=pole(z,coeff); w,dw=pole(neg(z),coeff)
        f=add(v,sc(w,-parity)); df=add(dv,sc(dw,parity))
        f=tuple(t+span(0,'8e-15') for t in f)
        df=tuple(t+span(0,'32e-15') for t in df)
        phi=add(phi,sc(mul(f,f),param))
        dp=add(dp,sc(mul(f,df),2*param))
    hi=u.exp(); lo=absolute_square(phi)/hi; D=hi+lo; jac=hi-lo
    assert jac.lo>0
    q=[[D+2*phi[0],-2*phi[1]],[-2*phi[1],D-2*phi[0]]]
    dq=[]
    for du,phi_k in zip((ux,uy),(dp,(-dp[1],dp[0]))):
        dD=jac*du+2*mul(cp(phi),phi_k)[0]/hi
        a,b=phi_k
        dq.append([[dD+2*a,-2*b],[-2*b,dD-2*a]])
    return q,dq

def geom(s,ell,w,h):
    r=1+s; delta=I(1/16)
    a,b,k,l=calc_step(ell)
    c0,s0=trig(2*pi*a)
    c=[c0-1,-s0,I(0)]
    v=[-7*k*s0,-7*k*c0,I(0)]
    ad=[-49*l*s0/(2*pi)-49*k.square()*c0,-49*l*c0/(2*pi)+49*k.square()*s0,I(0)]
    unit=(1-w.square()).elementary("sqrt")
    p=[unit*(1-h.square())/(1+h.square()),unit*2*h/(1+h.square()),w]
    z=(c[0]+delta*r*p[0],c[1]+delta*r*p[1])
    phi=pi/3+delta*r*p[2]; cos,sin=trig(phi)
    Dy=[[I(16*int(i==j)) for j in range(3)]+[-16*v[i]] for i in range(3)]+[[I(0),I(0),I(0),I(1)]]
    Yinv=[[delta*I(int(i==j)) for j in range(3)]+[v[i]] for i in range(3)]+[[I(0),I(0),I(0),I(1)]]
    p4=[*p,I(0)]; de4=[I(0),I(0),I(0),I(1)]
    dr=mv(trans(Dy),p4)
    dy3=Dy[:3]
    hr=scale(mm(trans(dy3),mm(lin(eye(3),outer(p,p),1,-1),dy3)),I(1)/r)
    hr[3][3] += -16*dot(p,ad)
    ep=r.exp(); sinh=(ep-I(1)/ep)/2; cosh=(ep+I(1)/ep)/2
    hyp=lin(outer(dr,dr),outer(de4,de4),1,sinh.square())
    raw=mm(trans(dy3),dy3)
    tang=scale(lin(raw,outer(dr,dr),1,-1),I(1)/r.square())
    A=lin(hyp,tang)
    inver=zero(4,4)
    for i,j in product(range(3),repeat=2):
        inver[i][j]=r.square()*I(int(i==j))+(1-r.square())*p[i]*p[j]
    inver[3][3]=I(1)/sinh.square()
    dA_y=[zero(4,4) for _ in range(4)]
    for k,i,j in product(range(3),repeat=3):
        dA_y[k][i][j]=I(-2)/(r*r.square())*p[k]*(I(int(i==j))-p[i]*p[j])+(1-I(1)/r.square())*((I(int(i==k))-p[i]*p[k])*p[j]+p[i]*(I(int(j==k))-p[j]*p[k]))/r
    for k in range(3):
        dA_y[k][3][3]=2*sinh*cosh*p[k]
    gl_y=connections(dA_y,inver)
    ga=[[[I(0) for k in range(4)] for j in range(4)] for i in range(4)]
    for i,j in product(range(4),repeat=2):
        out=[sum(gl_y[iy][jy][ky]*Dy[iy][i]*Dy[jy][j] for iy,jy in product(range(4),repeat=2)) for ky in range(4)]
        if i==j==3:
            out=[out[k]-16*ad[k] if k<3 else out[k] for k in range(4)]
        ga[i][j]=mv(Yinv,out)
    cos_az=(1-h.square())/(1+h.square())
    sin_az=2*h/(1+h.square())
    sphere_latitude=[-w*cos_az,-w*sin_az,unit]
    sphere_azimuth=[-sin_az,cos_az,I(0)]
    slice_tangents=trans([[delta*r*t for t in sphere_latitude]+[I(0)],
                          [delta*r*t for t in sphere_azimuth]+[I(0)],v+[I(1)]])
    return z,r,sin,cos,dr,hr,hyp,tang,A,ga,sinh,slice_tangents

def connections(dg, inv):
    return [[mv(inv, [(dg[i][j][p]+dg[j][i][p]-dg[p][i][j])/2 for p in range(4)]) for j in range(4)] for i in range(4)]

def pair_contraction(G, vec1, vec2, C):
    """Use two input-slot inverse-metric contractions and output pairing C."""
    U=[[[sum(G[l][i]*G[j][k]*vec1[i][k][p] for i,k in product(range(4),repeat=2))
          for p in range(4)] for j in range(4)] for l in range(4)]
    t1=[sum(G[i][j]*vec1[i][j][p] for i,j in product(range(4),repeat=2)) for p in range(4)]
    t2=[sum(G[i][j]*vec2[i][j][p] for i,j in product(range(4),repeat=2)) for p in range(4)]
    return sum(dot(mv(C,U[i][j]),vec2[i][j]) for i,j in product(range(4),repeat=2))-dot(t1,mv(C,t2))

def sec(op, G):
    K=mm(G,op)
    return tr(K).square()-tr(mm(K,K))

def eval_cell(width, data, multipoles, regroup=True):
    s=span('.120',width)
    phase=span('.32',width)
    w=span('.2',width); ppsi=span('.4',width)
    z,r,sin,cos,dr,hr,A_h,A_s,A,ga,sinh,T=geom(s,phase,w,ppsi)
    q,dq=metric(z,data,multipoles)
    B=zero(4,4)
    dB=[zero(4,4) for _ in range(4)]
    for i,j in product(range(2),repeat=2):
        B[i][j]=q[i][j]
        for k in range(2): dB[k][i][j]=dq[k][i][j]
    B[2][2]=I(1); B[3][3]=sin.square()
    dB[2][3][3]=2*sin*cos
    Bi,_=ldlinv(B)
    gb=connections(dB,Bi)
    S=[[[ga[i][j][k]-gb[i][j][k] for k in range(4)] for j in range(4)] for i in range(4)]
    L=[[mv(A,S[i][j]) for j in range(4)] for i in range(4)]
    nablaA=[lin(L[k],trans(L[k])) for k in range(4)]
    a,t,ap,app=calc_step(16*s-1)
    tp=-16*ap; tpp=-256*app
    G=lin(A,B,t,a); Gi,dg=ldlinv(G)
    D=lin(A,B,1,-1)
    dt=[x*tp for x in dr]
    bhs=lin(hr,[[dot(gb[i][j],dr) for j in range(4)] for i in range(4)],1,-1)
    # Covariant B-Hessian of s, separated from the t-prime-prime part.
    ddt=scale(bhs,tp)
    dir_t=mv(Gi,dt)
    # These three columns lie in the actual s-level tangent plane.
    slice_A=eye(3)
    slice_A[2][2]=sinh.square()
    slice_B=mm(trans(T),mm(B,T))
    slice_inverse,_=ldlinv(lin(slice_A,slice_B,t,a))
    slice_D=mm(slice_inverse,lin(slice_A,slice_B,1,-1))
    slice_trace=tr(slice_D)
    normal_inverse_square=dot(dr,mv(Gi,dr))
    cutoff_rank_one=-tpp*normal_inverse_square*slice_trace
    if regroup:
        cutoff = cutoff_rank_one
    else:
        ddt = lin(ddt, outer(dr, dr), 1, tpp)
        cutoff = I(0)
    cutoff += tr(mm(mm(mm(Gi, ddt), Gi), D)) - tr(mm(Gi, ddt))*tr(mm(Gi, D))
    cutoff+=2*sum(Gi[i][l]*dir_t[k]*(nablaA[l][i][k]-nablaA[k][i][l]) for i,k,l in product(range(4),repeat=3))
    V=[[[ (dt[i]*D[j][k]+dt[j]*D[i][k]-dt[k]*D[i][j])/2 for k in range(4)] for j in range(4)] for i in range(4)]
    W=scale(mm(mm(B,Gi),A),t*a)
    normal_D=dot(mv(Gi,dr),mv(D,mv(Gi,dr)))/normal_inverse_square
    only_cutoff_square=tp.square()*normal_inverse_square*(
        3*tr(mm(slice_D,slice_D))-slice_trace.square()+2*normal_D*slice_trace)/4
    cutoff_square = only_cutoff_square if regroup else pair_contraction(Gi, V, V, Gi)
    diff = -pair_contraction(Gi, S, S, W) + 2*t*pair_contraction(Gi, L, V, Gi) + cutoff_square
    # Gi B = Id + t C. The pure B-end factor determinants both start at 1.
    C=mm(Gi,lin(B,A,1,-1))
    cp0=[row[:2] for row in C[:2]]; cp1=[row[2:] for row in C[2:]]
    b_curv=2*t*(tr(cp1)-tr(cp0))+2*t.square()*(determinant(cp1)-determinant(cp0))
    a_curv=sec(A_s,Gi)-sec(A_h,Gi)
    R=t*a_curv+a*b_curv+cutoff+diff
    vol=(dg[0]*dg[1]*dg[2]*dg[3]).elementary("sqrt")*r.square()/4096
    # s=.120 lies in the affine segment [61,62]/512.
    chi=rr('0.974')+(s-rr(F(61,512)))*rr(F(26,1000)*512)
    physical=I(2)/(I(1)+ppsi.square())*(2*pi/7)
    out=R*vol*chi.square()*physical
    k=6*dot(dr,mv(Gi,dr))*vol*rr(F(26,1000)*512).square()*physical
    return z,q,R,vol,out,k,cutoff,diff

def main():
    data = json.loads(Path(__file__).with_name("whole_pants_residual_d18.json").read_text())
    multipoles = [[rr(a) for a in validated_potential(sign)[0]] for sign in (1, -1)]
    # Bounds in ds d(lambda) dw d(tan(psi/2)) on one physical half-letter.
    for radius, potential_hi in [("1e-7", -282741), ("1e-6", -262513), ("1e-5", -94268),
                                 ("2e-5", 137112)]:
        _, _, curvature, _, potential, kinetic, _, _ = eval_cell(radius, data, multipoles)
        print(f"Regrouped, radius {radius}: R {curvature}, P density {potential}, K density {kinetic}")
        assert potential.hi < potential_hi
        assert kinetic.lo > 0
        if radius == "1e-5":
            assert (potential + kinetic).hi < -88000
    _, _, _, _, ungrouped, _, _, _ = eval_cell("1e-6", data, multipoles, regroup=False)
    print(f"Ungrouped, radius 1e-6: P density {ungrouped}")
    assert ungrouped.lo < 0 < ungrouped.hi


if __name__ == "__main__":
    main()
