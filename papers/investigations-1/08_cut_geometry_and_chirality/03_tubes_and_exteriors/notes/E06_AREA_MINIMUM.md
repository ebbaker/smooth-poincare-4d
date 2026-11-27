# E06 · Exact untwisted cap minimum

27 November 2026. Prepared for Edward B. Baker III with OpenAI assistance.
Actual helper model and effort unavailable. This bounded E return uses
[request R1](../research-progress/handoffs/E06_REQUEST_R1.md) and revision
\(\texttt{bc2c1bbccc1d244a9d456ffe2fcaf64e368290b0}\). It works within the
oriented Riemannian circle-symmetric ansatz. The energy is the mean of the
two Hilbert–Schmidt chiral energies, and \(T=4\pi^2\).

The input is the cap functional and boundary conditions in [parent
§6.2, Proposition 6.1](../../manuscript/cuts_of_subcritical_conformal_classes.tex)
(SHA-256 prefix \(\texttt{ccb52d6a2548fb8f}\)). The original
[symbolic check](../../../../master/brainstorm/notes/claude/USES_OF_THE_FIRST_ORDER_AND_MARKED_CUT_TOOLS_20261126_checks/check_01_kk_cap_energy.py)
(\(\texttt{5698a20161157b27}\)),
[floating search](../../../../master/brainstorm/notes/claude/USES_OF_THE_FIRST_ORDER_AND_MARKED_CUT_TOOLS_20261126_checks/check_02_cap_costs.py)
(\(\texttt{9c0e9056143dc9bb}\)) and
[recorded output](../../../../master/brainstorm/notes/claude/USES_OF_THE_FIRST_ORDER_AND_MARKED_CUT_TOOLS_20261126_checks/output.txt)
(\(\texttt{62caf15a5bc45539}\)) were inspected. No exterior classification or
topological recognition theorem enters the derivation.

## Area coordinate and exact minimization

Let \(A=a(S)>0\), \(h=A^2\), \(f=a_s(S)\), \(p=-f\) and
\(U=\int_0^S a\,ds\). Set \(u=\int_0^s a\,ds\) and \(y(u)=a(s)^2\).
Then \(y_u=2a_s\), \(K=-y_{uu}/2\), and \(q=1+K=1-y_{uu}/2\).
The cap endpoint conditions become
\[
y(0)=0,\qquad y_u(0)=2,\qquad y(U)=h,\qquad y_u(U)=2f.
\]
The untwisted condition here is \(F\equiv0\). In this case
\((3/4)e_{\rm cap}/\pi^2=\int_0^U q^2\,du\).

At prescribed \(U>0\) the clamped cubic, with \(t=u/U\), is
\[
y_c=h(3t^2-2t^3)+2Ut(1-t)^2-2fUt^2(1-t).
\]
For a competing profile with the same traces, \(q-q_c\) is orthogonal to
\(1,u\), by integrating \(y_{uu}-(y_c)_{uu}\) against each. Since \(q_c\)
is affine, \(\int q^2=\int q_c^2+\int(q-q_c)^2\). This proves uniqueness at
fixed area whenever \(y_c>0\) on \((0,U]\). In particular, every cubic is
positive there when \(f\le 0\), as each displayed summand is nonnegative.
The broader fixed-area positivity test follows on setting
\(r=(1-t)/t\):
\[
(1+r)^3 y_c=h+(3h-2fU)r+2Ur^2.
\]
Thus strict positivity holds exactly when
\(3h-2fU>-\sqrt{8Uh}\). In cases that fail the test the clamped cubic gives
a lower bound for positive profiles at that area. The free-area result
below covers \(f\le0\), which includes all untwisted rows in the input.

The cubic gives a smooth metric at the pole. With \(z=\sqrt{2u}\), one
has \(y_c=z^2(1+O(z^2))\) with the factor smooth and even. Integrating
\(ds=du/\sqrt{y_c}\) gives a smooth odd coordinate \(s(z)\) with
\(s_z(0)=1\). Its inverse gives \(a(s)=s+O(s^3)\) smooth and odd. The length
is finite. At the outer boundary the match uses the \(C^{1,1}\) convention
of Proposition 6.1.

The fixed-area value is
\[
J(U):=\int_0^U q_c^2\,du
=U+2(1-f)+\frac{4(1+f+f^2)}U-\frac{6(1+f)h}{U^2}
+\frac{3h^2}{U^3}.
\]
For \(h>0\) it diverges at both ends of the positive area range. Equivalently,
Jensen gives \(J(U)\ge U+2(1-f)+(1-f)^2/U\). For \(f\le0\) the exact
untwisted minimum is \((4/3)\pi^2\) times the least value of \(J\) at the
positive roots of
\[
P(U)=U^4-4(1+f+f^2)U^2+12(1+f)hU-9h^2=0.
\tag{1}
\]
The instruction to compare all roots matters. For example \(p=0\) gives
\(P=(U^2+2U-3h)(U^2-2U+3h)\), with three distinct positive roots when
\(0<h<1/3\). For \(p>0\), write
\[
D=\frac{3h}{U}-2(1-p).
\]
At a stationary area \(D^2=U^2-4p\), and the endpoint values of \(q_c\) are
\[
q_c(0)=1+\frac{2-D}U,\qquad
q_c(U)=1+\frac{2p+D}U.
\]
The same formulas and relation hold at \(p=0\). They give
\(q_c(0)>0\) and \(q_c(U)\ge0\), with \(q_c(U)>0\) for \(p>0\). Since
\(R=2q_c\) for these caps, the minimizers have positive scalar curvature
throughout the cap interior. When \(p=0\) and \(q_c(U)=0\), strict
positivity up to the boundary has the same infimum. For
\(q_c(U)=1-2/U+3h/U^2\), one can vary \(U\) toward the exterior of the
interval of its possible zeros. Inferring a smooth global entering class
uses the parent's matching and smoothing results in addition to this
variational calculation.

For the tabulated nonround rows \(p>5-2\sqrt6\). Their positive root is
unique. Indeed, stationary \(h\) lies on
\[
h_\pm(U)=\frac{U}{3}\left(2(1-p)\pm\sqrt{U^2-4p}\right),
\qquad U\ge2\sqrt p.
\]
For \(0<p<1\) the plus branch increases. The derivative of the minus
branch is \((2(1-p)-2w-4p/w)/3\), where \(w=\sqrt{U^2-4p}\).
It is negative for \(p>5-2\sqrt6\) since \(2w+4p/w\ge4\sqrt{2p}\).
The branches meet at their starting value. For \(p\ge1\) only the plus
branch can yield \(h>0\), and it increases where positive.

## Flat and spherical exterior rows

For a flat exterior at a finite radius-to-length ratio \(x>0\),
\(A=(2\pi x)^{-1}\) and \(p=A\). With \(r=A/U>0\),
\[
J(U)-6= U\left[\left(1+r+\tfrac32r^2\right)^2
                     +3r^3+\tfrac34r^4\right]
            +\frac4U-4\left(1+r+\tfrac32r^2\right)>0.
\]
The strict inequality follows from the arithmetic–geometric mean
inequality. Every such untwisted cap has \(e>2T\), and its attained
minimum is strictly above \(2T\) at fixed \(x\).

For the spherical product exterior,
\(A=\ell/(2\pi\sin\theta)\), \(p=A\cos\theta\). The following are
enclosures of the exact minima within \(F\equiv0\), plus the original
floating upper-bound estimates for comparison.

| Data | Root bracket for \(U\) | Analytic minimum \(e/\pi^2\), rational enclosure | Original floating estimate |
| --- | --- | --- | --- |
| \(\theta=\pi/2,\ \ell=2\pi\) | \(1\) exactly | \(16/3\) exactly | 5.3333 |
| \(\theta=\pi/3,\ \ell=3.8\) | [1.1836378439, 1.1836378441] | [7.419174700, 7.419174703] | 7.4196 |
| \(\theta=\pi/4,\ \ell=2.3\) | [1.3933978615, 1.3933978617] | [7.846192641, 7.846192643] | 7.8475 |
| \(\theta=\pi/5,\ \ell=1.4\) | [1.5694475265, 1.5694475267] | [7.950528114, 7.950528116] | 7.9526 |
| Flat \(x=0.30\) | [1.5049563117, 1.5049563119] | [8.375403555, 8.375403557] | 8.3759 |
| Flat \(x=1\) | [1.8238144541, 1.8238144543] | [8.004964294, 8.004964295] | 8.0091 |

For reproducibility, the brackets were checked in rational interval
arithmetic. Compute \(\pi=16\arctan(1/5)-4\arctan(1/239)\) using the
20- and 21-term alternating sums as endpoints. Enclose each square root
on a \(10^{-18}\) grid by integer square roots at the lower and upper
arguments, rounding the upper result upward. Use
\(\sin(\pi/3)=\sqrt3/2\), \(\sin(\pi/4)=\cos(\pi/4)=1/\sqrt2\),
\(\sin(\pi/5)=\sqrt{(5-\sqrt5)/8}\) and
\(\cos(\pi/5)=(1+\sqrt5)/4\). Direct rational interval evaluation gives
\(P\) strictly negative at each left root endpoint and strictly positive
at each right endpoint. In column two's interval, evaluate the four terms
\(U+2(1+p)\), \(4(1-p+p^2)/U\), \(-6(1-p)h/U^2\), and
\(3h^2/U^3\) by endpoint interval operations, then multiply by \(4/3\).
This yields the outward-rounded third column. The original floating
profile search and residual checks supply no enclosure of their own.

## Thin regimes

Let \(0\le c=\cos\theta\le1\) and \(p=cA\). The same formulas include
the flat endpoint \(c=1\). As \(A\to0\), any minimizing area tends
uniformly to 2. Jensen and the trial \(U=2\) give compactness of
minimizing areas, and the limit \(J(U)=U+2+4/U\) has its unique minimum
at 2. Equation (1) has a simple root there at \(A=0\). Expansion gives
\(U=2-p+O(A^2)\), uniformly in \(c\). In fact,
\[
J(U)-6=\frac{(U+p-2)^2}U+\frac{3p^2}U
         -\frac{6(1-p)h}{U^2}+\frac{3h^2}{U^3},
\]
so the minimum satisfies
\[
\frac{e_{\rm cap,min}}{\pi^2}
=8-2A^2\sin^2\theta+A^3\cos^3\theta+O(A^4).
\]
At fixed \(0<\theta\le\pi/2\), the \(\ell\to0\) limit approaches the
wall from below with correction \(-2(\ell/2\pi)^2\). In the flat model
\(x\to\infty\), the leading correction is \(+(2\pi x)^{-3}\).
In the joint limit \(\theta\to0,\ A\to0\), if \(A/\theta^2\to\lambda\),
the eventual sign of the correction is negative for \(0\le\lambda<2\)
and positive for \(2<\lambda\le\infty\). This expansion leaves the
\(\lambda=2\) case dependent on finer rates.

If \(\theta\to0\) and \(A\to A_0>0\), compactness of minimizing areas
from Jensen gives convergence to the strictly supercritical flat
minimum for \(A=A_0\). If \(\theta\to0\) with \(\ell>0\) fixed, then
\(A\to\infty,\ p/A\to1\). Jensen and the trial \(U=3A\) bound \(U/A\) in
a compact subinterval of \((0,\infty)\) for minimizing \(U\). On dividing
(1) by \(A^4\), the limiting equation for \(k=U/A\) becomes
\((k^2-2k-3)(k^2+2k+3)=0\), with positive solution \(k=3\).
Consequently \(e_{\rm cap,min}/\pi^2\sim (256/27)A\); the limit at fixed
length diverges.

## Twisted competitors with vanishing signed flux

In the area coordinate the general functional in Proposition 6.1 has
derivative term \((2/3)y F_u^2\) and the signed flux is \(\int_0^U F\,du\).
Put \(M=\int_0^U F^2\,du\) and \(d=1-f\). Cauchy–Schwarz and completion of
the square give the universal bound
\[
\begin{aligned}
\frac{e_{\rm cap}}{\pi^2}
&\ge \frac{4}{3U}(U+d-\tfrac23 M)^2+4M\\
&=\frac{16}{3}d+\frac49M+
       \frac{4}{3U}(U-d+\tfrac23 M)^2.
\end{aligned}
\]
For \(f\le0\), equality at \(16d/3\) requires \(F=0\), \(U=d\) and
\(y=2u-u^2\). Those data occur exactly when \(h=1-f^2>0\), including the
round row. For those data the exact infimum holds even with all
zero-flux twists allowed. The same inequality excludes \(e<2T\) for
all twists in the flat range \(x\le1/\pi\), including the tabulated
\(x=0.30\).

At prescribed \(U\), the two clamped moments yield a more detailed
identity for any positive competing \(y\) with the same boundary data:
\[
\begin{aligned}
\frac{e_{\rm cap}}{\pi^2}-\frac43 J(U)
={}&\frac43\int_0^U(q-q_c-\tfrac23F^2)^2du\\
&+\int_0^U\left[
     \tfrac{16}{9}(\tfrac94-q_c)F^2+
     \tfrac{16}{135}F^4+\tfrac23 yF_u^2
     \right]du.
\end{aligned}
\]
In particular, the cubic comparison extends to all \(F\) at an area
where \(q_c\le9/4\) throughout. At the minimizing areas of the five
nonround rows, the cubic has \(q_c(0)>9/4\). Zero flux imposes a signed
linear constraint and does not directly control the negative
quadratic term. A sufficient estimate would be a bound for the
weighted Rayleigh quotient \(\int yF_u^2/\int F^2\) on zero-mean
functions with \(F(U)=0\), uniformly on competitors with relevant energy,
or a bound that also uses the first square in the identity. Mere
positivity and clamping of \(y\) give no positive uniform Rayleigh
bound. One can shrink \(y\) on the transition regions of a zero-mean
test function supported in the interior, holding the endpoint data
fixed, and make its derivative contribution arbitrarily small. Such
profiles need not lie in the required energy range. This leaves the
global zero-flux comparison for general data unresolved. In particular,
the exact untwisted obstruction at flat \(x=1\) does not settle the cost
when nonzero \(F\) of zero signed flux is admitted.

On the limiting untwisted profile as \(A\to0\), the fixed-profile quadratic
variation in \(F\) can be computed exactly. In \(t=u/2\) the limiting
values are \(y=4t(1-t)^2\) and \(q_c=3(1-t)\). Up to the positive factor
\(4/3\), the quadratic form is
\[
\int_0^1 \big[t(1-t)^2 F_t^2+(-2+8t)F^2\big]\,dt.
\]
With \(w=t(1-t)^2\), the function \(g=(1-t)^2\) satisfies
\(-(wg_t)_t+(-2+8t)g=0\). Integration by parts writes the form as
\(\int_0^1 wg^2((F/g)_t)^2dt\) for smooth bounded \(F\) with \(F(1)=0\);
the endpoint term \(w(g_t/g)F^2=-2t(1-t)F^2\) vanishes. The only null
direction is proportional to \(g\) and has nonzero signed mean. This
is an infinitesimal statement on the limiting profile, whose boundary
circle collapses. It does not give a bound uniform over competing
positive \(y\).
