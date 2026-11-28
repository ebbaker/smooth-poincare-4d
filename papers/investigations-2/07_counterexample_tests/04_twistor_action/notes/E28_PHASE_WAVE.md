# SP4-TWA-E28 · Finite-amplitude phase waves with a perpendicular buffer

28 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. The [frozen request](../research-progress/handoffs/E28_REQUEST_v1.md) records GPT-6.2 Astra/ultra as the selected lead and GPT-6.2 Sol/ultra as the configured helper. Actual backend model and effort are unavailable. HEAD was `7c6bbab9a0a66532d81599b3dd0952f5a371c8d4` and all three frozen SHA-256 digests matched. The calculation uses the [B08 closing](../continuation-notes/CLOSING_B08_SLOPE_20261128.md), [E14](E14_FIRST_NEGATIVE_MODE.md) and [E15](E15_HELICAL_COMPETITOR.md) conventions. It introduces no external geometric theorem.

Use the oriented flat Riemannian \(M=[-1,1]\times(\mathbb R/\mathbb Z)^3\), with unit slice volume, periodic spin lift and positive half-spinors on which self-dual two-forms act. In the parallel quaternion model take \(\sigma=1\) and fix \(b=51\pi/16\), \(\lambda=2\pi\), \(\omega=\pi/2\). Consider the entire class
\[
\psi=e^{bt}h,\qquad
h(t,x)=a(t)+c(t)e^{\mathbf i\lambda x_1}+d(t)\mathbf j,\qquad
a,c,d\in C^\infty([-1,1],\mathbb C_{\mathbf i}),
\]
with \(a(\pm1)=1\), \(c(\pm1)=d(\pm1)=0\). The exact action in this class has minimum \(9b^4/8\), attained only at \(h=1\). The proof uses elementary estimates and a finite outward-rounded interval certificate for one two-parameter inequality. All admissible fields of this form are zero-free: any zero would extend along an entire \(x_2,x_3\) torus, outside the frozen admissible class of isolated transverse zeros. The coefficients can pass through \(|a|=|c|\) wherever the buffer keeps \(h\) nonzero. The result covers this change of winding for the first complex component and variable pointwise norm.

## Exact density and reduction of coefficient phases

With \(D=-\partial_t+\mathbf i\partial_{x_1}\) on this class, put \(Q=|P\psi|^2/|\psi|^2\) and \(C=3/4\). The projection identity \(|P\psi|^2=|d\psi|^2-|D\psi|^2/4\) and a square completion give, for \(y=\lambda x_1\),
\[
Q=C\frac{\left|a'+ba+\big(c'+(b-\lambda/3)c\big)e^{\mathbf i y}\right|^2
       +|d'+bd|^2+\frac89\lambda^2|c|^2}
      {|a+ce^{\mathbf i y}|^2+|d|^2}.
\]
In particular \(S=J_g^4=\int_{-1}^1\langle Q^2\rangle\,dt\), where brackets denote the normalized spatial mean. The sign before \(\lambda/3\) comes from left multiplication by \(\mathbf i\) in the positive-spin convention of E15.

Fix \(t\), shift \(y\) to remove the relative phase of \(a,c\) in the denominator, and remove the overall phase of each complex component from the numerator norm. The resulting denominator is an even function \(R=|a|^2+|c|^2+|d|^2+2|a||c|\cos y\). The numerator is \(N_0+N_1+N_2\), where \(N_0\) is the numerator for the three moduli, \(N_1\) is the sum of squared norms of the phase-velocity contributions, and \(N_2\) consists of their cross terms with the real modulus velocities. More explicitly, in the first numerator square write
\[
(u+v e^{\mathbf i y})+\mathbf i(A+B e^{\mathbf i y}),
\]
where \(u=|a|'+b|a|\), \(v=|c|'+(b-\lambda/3)|c|\), \(A=|a|(\arg a)'\) and \(B=|c|(\arg c)'\) are real. The squared phase piece is \(|A+B e^{\mathbf i y}|^2\). The mixed term is proportional to \(\sin y\), and the buffer has no mixed real and imaginary term. Thus \(N_0,N_1\) are even and nonnegative and \(N_2\) is odd. Integrating over \(y\) cancels the odd cross terms in the square and gives
\[
\left\langle (N_0+N_1+N_2)^2/R^2\right\rangle\ge \langle N_0^2/R^2\rangle .
\]
This holds for almost every \(t\), including almost every coefficient-zero time because the derivative of an absolutely continuous coefficient vanishes almost everywhere on its zero set. The three moduli are Lipschitz with the same traces and have the same strictly positive minimum denominator over \(x_1\) at each \(t\). It suffices to prove the action comparison for the real nonnegative Lipschitz coefficients. Below, \(a,c,d\) denote these coefficients.

## Reduction to a fixed-time angular inequality

Write \(\psi=e^{bt+u}g\) with \(u=\log|h|\), \(g=h/|h|\), and set
\[
K_0=(g,\mathbf i g_{x_1})_{\mathbb R},\qquad K_1=-(g,\mathbf i g_t)_{\mathbb R}.
\]
The two relevant components of the polar current satisfy \(|K|^2\le |dg|^2\) by Cauchy–Schwarz. The integrated projection identity here is
\[
\int_M Q=2Cb^2+C\int_M\big(|du|^2+|dg|^2\big)+\frac12\int_M du\cdot K+\frac b2\int_M K_0 .
\]
Indeed the mixed angular term \((g_t,\mathbf i g_{x_1})_{\mathbb R}\) integrates to zero by integration by parts, using periodicity and the constant full end traces. The identity extends to the Lipschitz polar fields by smooth approximation of \(g-1\) in the zero-end \(H^1\) space. Completing the square in \(du\) gives
\[
\int_M Q\ge2Cb^2+\frac23\int_M |dg|^2+\frac b2\int_M K_0 .
\tag{1}
\]

At each \(t\) factor \(R=|h|^2=\rho^2|1+p e^{\mathbf i y}|^2\) with \(0\le p<1\) and \(\rho>0\). Explicitly, for \(L=a^2+c^2+d^2\) and \(\Delta=\sqrt{L^2-4a^2c^2}>0\), take \(\rho^2=(L+\Delta)/2\) and \(p=ac/\rho^2\). Write
\[
s=c^2/\rho^2,\qquad F=\frac{s-p^2}{1-p^2}=\frac12\left(1-\frac{a^2+d^2-c^2}{\Delta}\right)\in[0,1].
\]
For the range, use \(\Delta^2=(a^2+d^2-c^2)^2+4d^2c^2\). Since \(\langle R^{-1}\rangle=\Delta^{-1}\) by the geometric series for \((1+p e^{\mathbf i y})^{-1}\), the exact helicity and spatial energy are
\[
-\langle K_0\rangle=\lambda F,\qquad
\langle |g_{x_1}|^2\rangle=\lambda^2\left(F+\frac{p^2}{2(1-p^2)}\right).
\tag{2}
\]
For the first formula, \(2\operatorname{Re}(\overline{a+ce^{\mathbf i y}}\,ce^{\mathbf i y})=R+c^2-a^2-d^2\). For the second, subtract \(\langle|u_{x_1}|^2\rangle\) from \(\langle|h_{x_1}|^2/R\rangle\). The logarithm of \(1+p e^{\mathbf i y}\) gives the squared mean \(p^2/[2(1-p^2)]\) for \(\partial_y u\) by Parseval.

Let \(\Theta(t,y)=\operatorname{dist}_{S^3}(g(t,y),1)\), so \(\Theta=\arccos(g,1)_{\mathbb R}\), with end values zero. The distance function is Lipschitz with \(|\Theta_t|\le |g_t|\) almost everywhere. Dirichlet Poincaré in time gives \(\int_M |g_t|^2\ge \omega^2\int_M\Theta^2\). Using \(\lambda=4\omega\), (1), (2) and \(b\lambda=\frac32(\lambda^2+\omega^2)\), we obtain \(\int_M Q\ge 2Cb^2\) once
\[
\langle\Theta^2\rangle+\frac{8p^2}{1-p^2}\ge\frac{25}{8}F
\tag{3}
\]
is proved at every fixed \(t\). For \(c>0\), the cosine of the angle is
\[
X(p,F,\cos y)=\frac{p+s\cos y}{\sqrt{s}\sqrt{1+p^2+2p\cos y}},\qquad
s=p^2+(1-p^2)F .
\tag{4}
\]
For \(c=0\) we have \(p=F=0\), so (3) holds directly.

## Proof of the two-parameter bound

For \(p\ge17/32\), the spatial term alone exceeds \(25/8\). For \(0<F\le1/8\), the spatial term suffices if \(p^2\ge25F/64\). Otherwise \(s\le89F/64\), and from the squared perpendicular component of \(g\),
\[
\langle\Theta^2\rangle\ge \langle d^2/R\rangle
=\frac{(1-s)F}{s}\ge \frac{64}{89}-F > \frac{25}{8}F .
\]
Here \(\Theta^2\ge\sin^2\Theta\ge d^2/R\) and \(d^2/\rho^2=(1-s)(s-p^2)/s\). For \(F=0\), the right side of (3) is zero, and the spatial term is positive if \(c>0\) since then \(p^2=s>0\).

It remains to verify (3) on \(0\le p\le17/32,\ 1/8\le F\le1\). If the spatial term is smaller than \(25F/8\), then \(s>89p^2/25\). In this active region \(X\) is increasing as a function of \(v=\cos y\): the sign of its derivative is that of \(s(1+p^2+pv)-p^2>0\), since \(1+p^2-p\ge3/4\). Consequently \(\arccos(X)^2\) increases on \(0\le y\le\pi\), and its spatial mean, which equals its mean over that interval, is bounded below by every left-endpoint Riemann sum on a uniform mesh. The appendix certifies a strict lower bound for the sum plus the spatial term minus \(25F/8\) wherever the spatial term is insufficient. It uses interval enclosures on a dyadic partition of the rectangle. On any box accepted from the spatial term alone, (3) is strict for \(c>0\), since the normalized imaginary component \(c\sin y/\sqrt R\) implies \(\langle\Theta^2\rangle>0\).

Thus (3) is strict whenever \(c>0\). Cauchy–Schwarz on the volume-two product gives \(S\ge(\int Q)^2/2\ge 9b^4/8\). A nonzero \(c\) on any time interval makes the first-moment bound strict. If \(c=0\), the field depends only on \(t\), and the exact \(Q=C((b+u_t)^2+|g_t|^2)\) gives strict inequality unless \(u_t=g_t=0\) almost everywhere. The end traces force \(h=1\). The phase reduction implies the same exclusion for the original complex coefficients, and when their wave modulus is zero the last direct time-only argument also applies to their phases.

For the unbuffered complex phase plane, an independent exclusion holds at every real slope \(b\) and for arbitrary smooth \(x_1\) dependence. A zero-free scalar \(h\) with full constant end traces has zero spatial phase winding on every slice. In \(g=e^{\mathbf i\phi}\), the current is \((-\phi_{x_1},\phi_t)\). Its divergence vanishes, \(\int K_0=0\), and its pairing with \(du\) has zero integral by the traces and periodicity. This gives \(\int Q=2Cb^2+C\int (|du|^2+|dg|^2)\) and the same unique minimum. The buffered result uses (3) at the positive crossing only. A wave with a nonconstant perpendicular component, further spatial Fourier modes or dependence on another axis is outside this test.

## Exploratory search

A separate floating-point search preceded the angular proof. Real coefficients were expanded as \(a=1+\sum_{j=1}^m a_j\sin(j\omega(t+1))\), \(c=\sum c_j\sin(j\omega(t+1))\), \(d=\sum d_j\sin(j\omega(t+1))\), with \(m=2,4,8,12\). Each dimension used 29 starts with a line-searched BFGS iteration and the exact density sampled at 96 temporal Gauss–Legendre nodes and 48 equally spaced spatial nodes. The starts included the radial field, and first-mode coefficients \((a_1,c_1,d_1)=(-.7,.75,.4),(-1,1,.5)\), both with \(|c|>|a|\) on interior slices. The other 26 starts added independent standard normals, scaled by \((0.5+i/16)/j^{3/2}\) in realization \(i=0,\ldots,25\), to first-mode coefficients \((-.5,.6,.4)\), using NumPy PCG64 seed 20261128 across basis sizes. No optimized action ratio was below unity by more than \(2\times10^{-16}\). The two explicit winding starts returned to the radial value at each basis size on reevaluation with 288 time and 192 spatial nodes. These exploratory observations do not enter the exclusion.

## Replayable interval certificate

The C17 kernel below assumes IEEE-754 binary64, round-to-nearest for elementary arithmetic and square root, and disabled contraction and fast-math. Each arithmetic bound is moved outward by one representable value, and all bisections are exact dyadic midpoints. To enclose cosines on \([0,\pi]\), the signed Taylor polynomials through terms 15 and 14 bound the cosine below and above respectively. The term magnitudes decrease after term 1 throughout the interval. For the two dyadic bounds on \(\pi\), apply Machin's identity \(\pi=16\arctan(1/5)-4\arctan(1/239)\) and bound each alternating series by its sums through indices 23 and 24. The strict rational comparisons to the two bounds in the code hold.

The function `value(xu)` uses the monotone table of certified lower cosines of trial angles between zero and the lower bound on \(\pi\). If a table entry is at least the upper endpoint `xu` of an enclosure of \(X\), its corresponding squared trial angle is a lower bound on \(\arccos(X)^2\). Summing those bounds downward and dividing by the exact number of cells lower-bounds the left-endpoint Riemann sum. A negative bound causes refinement or bisection. The early-break heuristic affects only which refinements are tried. It never accepts a rectangle.

Extract the fenced C block to `e28_cert.c` and run `clang -O3 -std=c17 -ffp-contract=off e28_cert.c -o e28_cert` followed by `./e28_cert`. Apple clang 15.0.0 on arm64 reported `ok 1, blocks 3811, leaves 1 22 440 1143 300, depth 17, margin 2.80357093616e-05`. The five leaf counts give one spatial-only acceptance and 1905 Riemann-bound acceptances at meshes 16, 64, 256 and 1024. The displayed minimum is taken over the latter accepted leaves.

```c
#include <math.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

typedef struct {double lo, hi;} I;
static I from(double x) {return (I){x,x};}
static double dn(double z) {return nextafter(z,-INFINITY);}
static double up(double z) {return nextafter(z,INFINITY);}
static I plus(I a,I b) {return (I){dn(a.lo+b.lo),up(a.hi+b.hi)};}
static I neg(I a) {return (I){-a.hi,-a.lo};}
static I minus(I a,I b) {return plus(a,neg(b));}
static I mul(I a,I b) {
    double p=a.lo*b.lo,q=a.lo*b.hi,r=a.hi*b.lo,s=a.hi*b.hi;
    return (I){dn(fmin(fmin(p,q),fmin(r,s))),up(fmax(fmax(p,q),fmax(r,s)))};
}
static I divi(I a,I b) {
    if(!(b.lo>0)) abort();
    return mul(a,(I){dn(1/b.hi),up(1/b.lo)});
}
static I root(I a) {
    if(!(a.lo>=0)) abort();
    return (I){dn(sqrt(a.lo)),up(sqrt(a.hi))};
}
static I cosine(I x) {
    I x2=mul(x,x),term=from(1),sum=term, before;
    for(int j=1;j<=15;++j) {
        if(j==15) before=sum;
        term=divi(neg(mul(term,x2)), from((2*j-1)*(2*j)));
        sum=plus(sum,term);
    }
    return (I){sum.lo,before.hi};
}

enum {N=1024,G=8192};
static I ys[N];
static double candidate[G+1],angle2[G+1];
static uint64_t pass[5],blocks;
static int depthmax;
static double min_margin=10.0;
static double value(double xu) {
    int a=0,b=G+1;
    while (a+1<b) {
        int c=(a+b)/2;
        if(candidate[c]>=xu) a=c;
        else b=c;
    }
    return angle2[a];
}

static double spatial_lower(I p) {
    I pl=from(p.lo),pl2=mul(pl,pl);
    return divi(mul(from(8),pl2),minus(from(1),pl2)).lo;
}

static int cert(I p,I f,int depth) {
    ++blocks;
    if(depth>depthmax) depthmax=depth;
    double target=mul(from(25./8),f).hi;
    double spatial=spatial_lower(p);
    if(spatial>=target){++pass[0];return 1;}
    I s=plus(f,mul(mul(p,p),minus(from(1),f)));
    I sqrt_s=root(s);
    I v=minus(from(1),p);
    I r0=mul(v,v),r1=mul(from(2),p);
    int meshes[4]={16,64,256,N};
    for(int k=0;k<4;++k) {
        int ny=meshes[k];
        double sum=0;
        for(int j=0;j<ny;++j) {
            I u=ys[(N/ny)*j];
            I r=plus(r0,mul(r1,plus(from(1),u)));
            I x=divi(plus(p,mul(s,u)),mul(sqrt_s,root(r)));
            sum=dn(sum+value(x.hi));
        }
        double margin=dn(dn(dn(sum/ny)+spatial)-target);
        if(margin>0) {
            if(margin<min_margin) min_margin=margin;
            ++pass[k+1];
            return 1;
        }
        // The smaller meshes already distinguish cells that need splitting.
        if(depth<16 && k<3 && margin<-0.2*16/ny) break;
    }
    if(depth==42) {
        fprintf(stderr,"Failed at p=[%a,%a], F=[%a,%a]\n",p.lo,p.hi,f.lo,f.hi);
        return 0;
    }
    if(p.hi-p.lo>0.6*(f.hi-f.lo)) {
        double pm=(p.hi+p.lo)/2;
        return cert((I){p.lo,pm},f,depth+1)&&cert((I){pm,p.hi},f,depth+1);
    }
    double fm=(f.lo+f.hi)/2;
    return cert(p,(I){f.lo,fm},depth+1)&&cert(p,(I){fm,f.hi},depth+1);
}

int main(void) {
    const I pi={0x1.921fb54442d0fp+1,0x1.921fb54442d2ap+1};
    for(int j=0;j<N;++j) ys[j]=cosine(mul(pi,from(j/(double)N)));
    angle2[0]=0;
    for(int j=1;j<=G;++j) {
        I angle=mul(from(pi.lo),from(j/(double)G));
        candidate[j]=cosine(angle).lo;
        angle2[j]=mul(angle,angle).lo;
        if (j>1&&!(candidate[j]<candidate[j-1])) abort();
    }
    int ok=cert((I){0,17./32},(I){1./8,1},0);
    printf("ok %d, blocks %llu, leaves %llu %llu %llu %llu %llu, depth %d, margin %.12g\n",ok,
        (unsigned long long)blocks,(unsigned long long)pass[0],(unsigned long long)pass[1],(unsigned long long)pass[2],
        (unsigned long long)pass[3],(unsigned long long)pass[4],depthmax,min_margin);
    return !ok;
}
```
