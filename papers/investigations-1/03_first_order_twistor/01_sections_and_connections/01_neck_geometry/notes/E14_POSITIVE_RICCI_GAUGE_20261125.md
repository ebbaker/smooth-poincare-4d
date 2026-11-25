# The positive Ricci gauge and physical ball bounds · SP4-FOT-NECK-E14

25 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. Helper configured as gpt-6.2-sol/ultra
per the issuing lead. The runtime does not independently expose its
serving model or reasoning effort. This is a conformal gauge audit
and a conditional metric comparison. [Frozen request](../research-progress/handoffs/E14_REQUEST_20261125.md)
· [Joint proof map](../../../brainstorm/notes/COLLAR_PROGRAM_AND_SPC4_20261125.md)

## Existence and normalization

Let \((M,[g])\) be a smooth closed oriented Riemannian homotopy
four-sphere with \(Y=Y([g])>0\) and \(E=E_+([g])\le8\pi^2-\delta\)
for \(\delta>0\). The chiral norms are Hilbert–Schmidt on the
real \(\Lambda^\pm\) curvature endomorphisms. Use
\[
 A_h=\tfrac12(\operatorname{Ric}_h-\tfrac16R_h h),\qquad
 T_h=\operatorname{Ric}_h-\tfrac14 R_h h,\qquad
 \sigma_2(A_h)=\sigma_2(h^{-1}A_h).
\]
The closed signature formula gives \(E_-=E\). The tensor Weyl
integral is \(8E\). The Chern–Gauss–Bonnet formula and the
pointwise \(\sigma_2\) identity give
\[
 q:=\int_M\sigma_2(A_h)\,dV_h
     =\frac{8\pi^2-E}{2}\in[\delta/2,4\pi^2],\qquad
 \sigma_2(A_h)=\frac{R_h^2}{96}-\frac{|T_h|^2}{8}.
\]
With a volume-one positive Yamabe minimizer \(g_Y\) one has
\[
 R_{g_Y}=Y,\qquad
 Y^2=96q+12\|T_{g_Y}\|_2^2\ge48\delta,\qquad
 Y\le Y_{\rm rd}=8\sqrt6\,\pi .
\]
In the following put \(y_0=\sqrt{48\delta}\); any supplied lower
bound \(0<y_0\le Y\) suffices for the metric comparison.
[SEC §§1.1 and 11.1](../../manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L3868)

Chang–Gursky–Yang, *An equation of Monge–Ampère type in conformal
geometry, and four-manifolds of positive Ricci curvature*, Annals of
Mathematics 155 (2002), 709–787, Theorem A and Corollary B, supply a
smooth conformal representative with positive \(\sigma_2\), positive
scalar curvature and positive Ricci curvature on a compact four-manifold
assuming both \(\int\sigma_2>0\) and positive class Yamabe constant.
Their Schouten tensor is \(2A_h\) in the conventions above, so
their \(\sigma_2\) is \(4\sigma_2(A_h)\). This also matches their
Lemma 1.1 and equation (1.7). [Annals primary text,
Theorem A, Corollary B and §1](https://arxiv.org/pdf/math/0409583v1#page=4)
· [Journal record](https://annals.math.princeton.edu/2002/155-3/p02)

A refinement by the same authors supplies a smooth representative
with \(\sigma_2(A_h)\) a positive constant under the same hypotheses.
Theorem 1.2 of their published sphere theorem restates the original
2002 result, whose journal entry was available for metadata in this
audit. [2002 prescribed-curvature article record](https://doi.org/10.1007/BF02868472)
After setting \(\operatorname{Vol}_h(M)=1\) the constant equals \(q\).
Gursky–Streets, Theorem 1.5, gives uniqueness after normalization
for a fixed nonround positive class and roundness of the solutions
in the round class. The fixed-class compactness in Gursky–Viaclovsky,
Theorems 1.1 and 1.4, concerns solutions in one conformal class
away from the spherical equality case. CGY's Proposition 1.7 uses
constants depending on the background metric and prescribed data.
These statements do not furnish a scalar upper estimate uniform
over varying backgrounds from \(Y\) and \(q\) alone. [Chang–Gursky–Yang,
*A conformally invariant sphere theorem in four dimensions*,
Publ. Math. IHÉS 98 (2003), Theorem 1.2 and Proposition 1.7](https://www.numdam.org/item/10.1007/s10240-003-0017-z.pdf#page=8)
· [Gursky–Streets, Theorem 1.5](https://msp.org/gt/2018/22-6/gt-v22-n6-p08-p.pdf#page=6)
· [Gursky–Viaclovsky, Theorems 1.1 and 1.4](https://arxiv.org/pdf/math/0210302v2#page=4)

For any point with \(p=\sigma_2(A_h)>0\), the identity above makes
\(R_h\) nonzero. On the connected closed \(M\), the sign is positive
because \(Y>0\) rules out a representative with \(R_h<0\) by the
constant test. Set \(S=R_h/6>0\) and take \(a\) to be the least
Schouten eigenvalue. The Ricci eigenvalues are \(S+2a_i\).
Since \(a\le S/4\), the sum \(S-a\) of the other three is positive.
Cauchy–Schwarz for those three gives
\[
 p\le a(S-a)+(S-a)^2/3
      =(S-a)(S+2a)/3.
\]
Thus \(m=S+2a>0\), and \(p\le m(3S-m)/6\le mS/2\). In particular
\[
 \lambda_{\min}(\operatorname{Ric}_h)\ge12p/R_h,\qquad
 0<\operatorname{Ric}_h< (R_h/2)h,\qquad
 R_h\ge\sqrt{96p}.
\]
For the upper Ricci comparison, \(S^2-|A_h|^2=2p>0\) bounds the
largest Schouten eigenvalue by \(S\). This proves the
\(\Gamma_2^+\) assertion and quantifies the aspect of the cone
that degenerates at large \(R_h\). At fixed \(p=q>0\), take
Ricci eigenvalues \(m,(R-m)/3,(R-m)/3,(R-m)/3\) with
\(R\ge\sqrt{96q}\) and \(m=(R-\sqrt{R^2-96q})/4\).
Then \(p=m(R-2m)/12=q\) and \(m\sim12q/R\) as \(R\to\infty\).
This is a pointwise model for the bound and supplies no family
of metrics solving the constant-\(\sigma_2\) equation.

CGY's Theorem 1.1 also allows the modified equation
\(\sigma_2(A_h)-\frac{\alpha}{16}|W_h|_{\rm tens}^2=\lambda>0\).
In volume one \(\lambda=q-\alpha E/2\), so for example
\(\alpha=\delta/(16\pi^2)\) gives \(\lambda\ge\delta/4\) in the
band. This supplies a pointwise Weyl-to-\(\sigma_2\) comparison.
The relation still permits the large-scalar pointwise model
above when the Weyl block vanishes. [CGY, published Theorem 1.1
and equation (1.4)](https://www.numdam.org/item/10.1007/s10240-003-0017-z.pdf#page=7)

## What the conformal data control

For a positive smooth conformal factor in dimension four, each
chiral Weyl density and the Bach \(L^1\) density are invariant on
each fixed subset. The Yamabe constant and the total \(q\) are
also invariant. With the \(Q_4\) convention
\(Q_4=4\sigma_2(A)-\Delta R/6\), one has \(\int_M Q_4\,dV=4q\).
CGY's \(Q\) in the IHÉS paper is half this \(Q_4\).
Physical distance balls and their chiral quantile radii depend on
the representative. [E01, Weyl and Bach scale](E01_TWO_CAP_AUDIT_20261125.md#bach-cost-and-its-gauge)
· [CGY, \(Q\) convention, equation (1.11)](https://www.numdam.org/item/10.1007/s10240-003-0017-z.pdf#page=9)

The scalar \(L^2\) energy supplies exactly the missing
nonconformal part in the curvature budget. For every \(h\)
in this class, using the full four-index norm,
\[
 \begin{split}
 \int|T_h|^2\,dV_h&=\tfrac1{12}\int R_h^2\,dV_h-8q,\\
 \int|\operatorname{Ric}_h|^2\,dV_h&=\tfrac13\int R_h^2\,dV_h-8q,\\
 \int|\mathrm{Rm}_h|_{\rm tens}^2\,dV_h
  &=8E-16q+\tfrac13\int R_h^2\,dV_h
    =16E-64\pi^2+\tfrac13\int R_h^2\,dV_h .
 \end{split}                                                     \tag{1}
\]
In particular, the existence of a uniform scalar \(L^2\) bound
in any chosen family is equivalent to uniform full curvature
energy there under the band. This bound, if supplied, is invariant
under homotheties. In the unit-volume Yamabe gauge one already has
\(\int|\mathrm{Rm}_{g_Y}|^2\le16E+64\pi^2\) and the E11 lower
bound on physical volumes and upper bound on diameter. The
Yamabe gauge supplies these three estimates without a Ricci lower
bound or Euclidean ball-volume upper comparison. [E11,
Yamabe-gauge bounds](E11_BALANCED_BLOCK_AND_NONCOLLAPSE_20261125.md#an-intrinsic-volume-bound-before-extracting-a-chart)

For a compact \(h\) with \(\operatorname{Ric}_h\ge0\), denote
its volume by \(V\) and diameter by \(D\). Bishop–Gromov gives
\[
 \frac{V}{D^4}r^4\le \operatorname{Vol}_h B_h(x,r)
       \le\omega_4r^4\quad(0<r\le D),\qquad \omega_4=\pi^2/2 .
\]
Comparison at a radius greater than \(D\) followed by a limit
gives the left inequality. Volumes normalized to one leave \(D\)
to be bounded. Diameters normalized to one leave the metric
volume \(V/D^4\) to be bounded below. For the constant-\(\sigma_2\)
gauge, rescaling the unit-volume metric to have \(\sigma_2=1\)
gives volume \(q\) and diameter \(q^{1/4}D\), so the same issue
remains. If \(R_h\le R_*\) pointwise in the unit-volume
constant-\(\sigma_2\) gauge, the Ricci bound and Bonnet–Myers give
\[
 D\le \pi\sqrt{R_*/(4q)}\le\pi\sqrt{R_*/(2\delta)}.
\]
The equation gives a lower bound on \(R_h\); the scalar upper
bound here is an additional estimate. [Bishop–Gromov and
Bonnet–Myers, Wei §§4 and 6](https://web.math.ucsb.edu/~wei/paper/06survey.pdf)

## A scoped example in the same round conformal class

For \(L\ge2\), take the induced metric \(h_L\) on the ellipsoid
in \(\mathbb R^5\) given by \(z^2/L^2+|y|^2=1\), \(y\in\mathbb R^4\).
It is smooth and strictly convex, so all sectional curvatures are
positive. Away from the poles it has form
\(ds^2+a(s)^2g_{S^3(1)}\), with \(a=\sqrt{1-z^2/L^2}\) and
\(ds=\sqrt{1+a_z^2}\,dz\). It is conformally round by the
radial reparametrization \(d\log\rho=ds/a(s)\), followed by
stereographic compactification. The smooth rotational pole germs
give \(a(s)=s+O(s^3)\) with smooth odd expansion in pole distance
at either end, so the conformal identification extends smoothly
across both poles. If \(k_r\) and \(k_t\) are the radial and
tangential sectional curvatures, the Schouten eigenvalues are
\(k_r-k_t/2,k_t/2,k_t/2,k_t/2\), and
\(\sigma_2(A)=\tfrac32 k_r k_t>0\).
Every member therefore has \(Y=Y_{\rm rd}\), \(q=4\pi^2\),
and \(W=B=0\).

On \(|z|\le L/2\), \(a\) is bounded below and
\(k_t=(1-a_s^2)/a^2\) is bounded below independently of \(L\).
The volume \(V_L\) is comparable to \(L\), since
\(a^3\sqrt{1+a_z^2}\le a^3+a^2|z|/L^2\le2\) on the
whole interval. Thus \(\int R_{h_L}^2\,dV_{h_L}\ge cL\)
from the middle half. At unit volume
\(\widetilde h_L=V_L^{-1/2}h_L\), the scalar and Riemann
\(L^2\) energies retain this divergence. A pole-to-pole
distance bound gives
\(\operatorname{diam}(\widetilde h_L)\ge2LV_L^{-1/4}\to\infty\).
The coordinate \(z\) is 1-Lipschitz in \(h_L\).
A unit ball in \(\widetilde h_L\) therefore lies in an
original \(z\)-slab of width \(2V_L^{1/4}\); its normalized
volume is at most \(C V_L^{-3/4}\to0\).
The example tests general \(\Gamma_2^+\) representatives with
fixed conformal invariants. Its \(\sigma_2\) is nonconstant.
The prescribed constant-\(\sigma_2\) choice in the round class
is round.

At an equatorial center the unnormalized metrics \(h_L\) have
the smooth pointed limit \(\mathbb R\times S^3(1)\). On fixed
bounded \(z\)-intervals, \(a\to1\) with all differentiated errors
tending to zero. The product has \(\operatorname{Ric}\ge0\),
\(\sigma_2=0\), \(W=B=0\), and the sharp round Yamabe value
for compactly supported tests by conformal identification with
\(\mathbb R^4\setminus\{0\}\). Its normalized volume ratio is zero
and \(\int R^2\) is infinite. This model tests whether the
limiting equation and conformal data alone yield the volume
ratio conclusion below.

## A sufficient integral bound for the positive Ricci gauge

Assume a smooth compact unit-volume representative \(h\)
with \(\operatorname{Ric}_h\ge0\) and \(\int R_h^2\,dV_h\le L_*^2\).
The following estimate does not require a pointwise scalar
upper bound. Let \(V_x(r)=\operatorname{Vol}_h B_h(x,r)\).
A Lipschitz cutoff equal to one on \(B(x,r/2)\), supported
in \(B(x,r)\), and with \(|du|\le2/r\), gives by Yamabe,
Hölder and Bishop doubling
\[
 \frac{y_0}{4}
 \le \frac{24}{r^2}V_x(r)^{1/2}
       +\left(\int_{B(x,r)}R_h^2\,dV_h\right)^{1/2}.
                                                                    \tag{2}
\]
Indeed the denominator is at least \(\sqrt{V_x(r/2)}\),
where \(V_x(r/2)\ge V_x(r)/16\).
Consequently, each \(r\)-ball either has scalar \(L^2\) norm
greater than \(y_0/8\), or has volume at least
\(\kappa r^4\) with \(\kappa=(y_0/192)^2\).
Pack disjoint open unit balls centered 2 apart on a minimizing
diameter segment. The number with volume at least \(\kappa\)
is at most \(\kappa^{-1}\). The other number is at most
\(64L_*^2/y_0^2\). Hence
\[
 D< D_*:=2\bigl(\kappa^{-1}+64 L_*^2/y_0^2\bigr),\qquad
 D_*^{-4}r^4\le V_x(r)\le\omega_4r^4\quad(0<r\le D_*).
\]
The ball estimates apply to the physical distances of \(h\).
The same argument would use any conformally admissible gauge
with the stated Ricci and scalar energy bounds. For a
sequence, equations (1) and (2) then permit choosing
low-full-curvature blocks as in E11 whenever its physical chiral
quantiles separate. [E11, quantiles and block choice](E11_BALANCED_BLOCK_AND_NONCOLLAPSE_20261125.md#a-region-with-two-positive-chiral-masses)

## A conditional lower bound on blow-up volume growth

Let \(X^4\) be a smooth complete connected noncompact
Riemannian manifold with \(\operatorname{Ric}_X\ge0\),
\(\int_X R_X^2<\infty\), and Yamabe form at least
\(y_0\|u\|_4^2\) for compactly supported tests. Write
\[
 \alpha_\infty=\lim_{r\to\infty}
   \frac{\operatorname{Vol}_X B(o,r)}{\omega_4r^4}.
\]
First, (2) applies to finite-radius cutoffs on \(X\).
Take \(x_r\) at distance \(2r\) from \(o\) along a ray.
Its \(r\)-ball lies outside \(B(o,r)\) and inside \(B(o,3r)\).
The scalar energy on that ball tends to zero, so (2)
gives \(\alpha_\infty\ge\kappa/(81\omega_4)>0\).

For \(f\in C_c^\infty((0,\infty))\), use
\(u_r=f(d(o,\cdot)/r)\). The pushforward of \(r^{-4}dV\)
by \(d(o,\cdot)/r\) converges on compact radius ranges to
\(\alpha_\infty\,d(\omega_4 s^4)\), by Bishop–Gromov and
convergence of the distribution functions. The distance
gradient has norm one almost everywhere. Thus
\[
 r^{-4}\int_X|u_r|^4\to \alpha_\infty\int_{\mathbb R^4}|f(|x|)|^4\,dx,
 \qquad
 r^{-2}\int_X|du_r|^2\to \alpha_\infty\int_{\mathbb R^4}|D(f(|x|))|^2\,dx.
\]
The rescaled scalar term tends to zero by Hölder, since
the support escapes to infinity and the scalar energy there
vanishes. Dividing the Yamabe inequality by \(r^2\) and taking
the limit gives \(y_0\le\sqrt{\alpha_\infty}\) times the
Euclidean Yamabe quotient of the radial function. The infimum
of these radial quotients is \(Y_{\rm rd}\), by cutting off the
radial stereographic factor near zero and infinity. Therefore
\[
 \alpha_\infty\ge (y_0/Y_{\rm rd})^2 .
\]
[Lee–Parker, sharp round value and Euclidean quotient,
§3 Theorems 3.2–3.3](https://users.math.msu.edu/users/parker/YamabeProblem.pdf)

In particular, a supplied smooth pointed limit of
\(\lambda_i^{-2}h_i\), \(\lambda_i\to0\), from the constant
\(\sigma_2\) gauge with \(\int R_{h_i}^2\le L_*^2\), if complete
and noncompact, has \(\operatorname{Ric}\ge0\), \(\sigma_2=0\),
the compact-support Yamabe inequality, and finite scalar
energy. The \(\sigma_2\) value rescales by \(\lambda_i^4\);
the compact-support Yamabe inequality passes with the smooth
embeddings, and the scalar energy bound passes on exhaustion.
Its normalized volume ratio is at least \(\delta/(8\pi^2)\).
If such a limit has a single smooth ALE end with link \(S^3\),
its volume ratio is one, and Bishop–Gromov equality makes the
whole smooth limit Euclidean. These conclusions presuppose the
smooth limit. A total \(Q_4\) identity for the compact sources
does not replace the scalar energy and convergence assumptions.

For B04 the missing estimate for the alternative gauge is a
uniform \(\int R_{h_i}^2\) in the selected positive Ricci
representatives, or a direct substitute yielding the required
physical curvature budget and ball comparisons. The choice
of this gauge may move the two physical chiral quantiles.
To reuse their separation from the Yamabe gauge, one needs
a uniform comparison of distances on the relevant scales, or
a new selection inside the positive Ricci gauge. Even with the
bounds above, an embedded separating first-order cone chart is
a further geometric step before E07. [E07, physical curvature
input](E07_FIRST_ORDER_CAP_20261125.md#comparison-before-chiral-projection)
