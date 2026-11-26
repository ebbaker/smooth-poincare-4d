# The closed equatorial conformal form

26 November 2026, for Edward B. Baker III with OpenAI Codex assistance. Bounded E02-equator derivation. Intake HEAD `1c81a3048c8c`, with working blobs `cbcd73ce04b1` (issue), `59c3993e018e` (marked assembly), `0cc56c281145` (funnel exterior), and `45f255a8b075` (funnel readback). The issue selected GPT-6.2 Astra/ultra for the lead and requested GPT-6.2 Sol/ultra for E work. Actual serving model and effort were unavailable. Smooth oriented Riemannian four-dimensional assembly, with the Weyl blocks measured as real two-form Hilbert–Schmidt operators. [Issue](../research-progress/handoffs/DIRECT_EQUATOR_ISSUE_20261126.md) · [Marked assembly](MARKED_CONNECTION_ASSEMBLY.md) · [Funnel exterior](FUNNEL_EXTERIOR.md) · [Funnel readback](../reviews/FUNNEL_READBACK.md)

The length-one pants support a retained totally geodesic seam with strictly negative induced Yamabe sign. This excludes simultaneous positive four-dimensional Yamabe sign and common chiral Weyl energy below \(8\pi^2\) for every smooth completion with this same local seam geometry. The exact radial end optimization with a constant test on the pants core gives the same obstruction for three equal cuff lengths through \(2.291728606\ldots\).

## The actual closed hypersurface

Let \(G=\{p\in S^2:p_3=0\}\) be the unit equator. The enlarged framed \(i\)-th tube of radius \(5/4\) lies in \(|\phi-\phi_i|\le 5/64\), where \(\phi_i=\pi/3,2\pi/3\). The latitude separation from \(G\) is at least \(\pi/6-5/64>0\) for both tubes. The transition bands are inside these enlarged tubes. Thus the entire compact pants core times \(G\) survives, with metric \(q+d\theta^2\) for equatorial longitude \(\theta\in\mathbb R/(2\pi\mathbb Z)\).

On each funnel, write the cuff length as \(L_j=2\pi\ell_j\), the cuff angle as \(\eta\in\mathbb R/(2\pi\mathbb Z)\), and the outward distance as \(r\ge0\). On the full product the retained metric is \(u^2(q+g_{S^2})\), where \(u=1\) on the core and near \(r=0\), and \(u=B^{-1}\operatorname{sech}r\) for \(r\ge1\). Reflection across \(G\) is an isometry on a neighborhood of the equatorial product. For \(r\ge1\) use \(v=\arcsin(\operatorname{sech}r)\). In the normal disk coordinates \(z=vp\) about the added core circle, the reflection is \((\eta,z_1,z_2,z_3)\mapsto(\eta,z_1,z_2,-z_3)\). The fixed plane \(z_3=0\) includes the core circle \(z=0\) and is smooth there. Its induced metric on this end is \(B^{-2}(dv^2+\sin^2v\,d\theta^2+\ell_j^2d\eta^2)\), a round disk times the cuff circle locally at \(v=0\). Thus the seam \(\Sigma\) is a smooth closed connected hypersurface, filled by one solid torus on each cuff with the \(\theta\) circle collapsing. The sign of \(p_3\) agrees with that of \(z_3\) on overlaps and gives the coorientation. A geodesic tangent to the fixed set is fixed by uniqueness, so \(\Sigma\) is totally geodesic, including at the three core circles. The reflection argument uses the retained neighborhood of \(\Sigma\). [Marked assembly](MARKED_CONNECTION_ASSEMBLY.md) · [Funnel coordinates](FUNNEL_EXTERIOR.md)

## The necessary seam sign

For an entering class on the closed smooth homotopy sphere, Chern–Gauss–Bonnet and signature zero give \(\int_M\sigma_2(A)=4\pi^2-e/2>0\), with \(A=(\operatorname{Ric}-Rg/6)/2\) and \(e=E_+=E_-\). The Chang–Gursky–Yang positive-Yamabe and positive-integral hypotheses supply a conformal metric with \(R>0\) and \(|\operatorname{Ric}_0|^2<R^2/12\), hence \(R-2\operatorname{Ric}(\nu,\nu)>0\) in each unit direction. Umbilicity persists under conformal change, so the Gauss equation reads \(R_{\hat h}=R-2\operatorname{Ric}(\nu,\nu)+2H^2/3>0\) on \(\Sigma\) in that gauge, with \(H\) the trace mean curvature. The induced class of the original smooth \(h\) on \(\Sigma\) must therefore have positive conformal-Laplacian form
\[
 Q_h(f)=\int_\Sigma (8|df|_h^2+R_h f^2)\,dV_h,\qquad \Delta=\operatorname{div}\nabla .
\]
[Chang–Gursky–Yang, Theorem A and Corollary B](https://arxiv.org/pdf/math/0409583#page=4) · [Entry normalization and seam derivation](../../../master/reviews/DIRECT_ENTRY_AND_REDUCIBLE_CUT_PRIORITIES_20261126.md#a-change-to-the-master-entry-problem)

## Constant core and exact funnel evaluation

Use \(h_0=q+d\theta^2\) on the uncompactified product, where \(R_{h_0}=-2\), and write \(h=U^4h_0\) with \(U=u^{1/2}\). For \(w=Uf\) and a truncated domain \(D\), conformal covariance of \(-8\Delta+R\) and integration by parts give
\[
 Q_h(f;D)=Q_{h_0}(w;D)-8\int_{\partial D}w^2\,\partial_{\nu_0}\log U\,dA_0 .
\]
At a cuff \(r=0\), \(U=1\) in a neighborhood, so this term vanishes. At a cut \(r=R\ge1\) its outward derivative is \(-\tfrac12\tanh R\), and \(dA_0=\ell_j\cosh R\,d\eta\,d\theta\).

Take \(w=1\) on the pants core and \(w=(\operatorname{sech}r)^{1/2}\) on each funnel. On the core \(f=w\). Gauss–Bonnet for geodesic boundary gives \(\operatorname{Area}_q(F)=2\pi\), so the core contribution is \(-2(2\pi)(2\pi)=-8\pi^2\). On a funnel the uncompactified volume has angular integral \(2\pi L_j\cosh r\). Dividing by \(2\pi L_j\), the uncompactified integrand and the endpoint correction give
\[
 \int_0^R(8w'^2-2w^2)\cosh r\,dr=-2\tanh R,
 \qquad -8w(R)^2\cosh R\,\partial_r\log U(R)=4\tanh R.
\]
Their sum tends to \(2\) per unit angular factor. The physical function \(f=w/U=\sqrt B\) near each added core circle. The contribution of the remaining piece \(0\le v<v(R)\) to \(Q_h/(2\pi L_j)\) is exactly \(2(1-\cos v(R))=2(1-\tanh R)\), since \(R_h=2B^2\) there. In particular there is no boundary at the added circle. The closed value is
\[
 Q_h(f)=-8\pi^2+4\pi\sum_{j=1}^3 L_j .
\]
It equals \(-8\pi^2+12\pi<0\) for \(L_j=1\). The endpoint correction is essential to the threshold \(\sum_j L_j\le 2\pi\) furnished by this trial.

## Exact radial optimization

For a funnel use \(v=\arcsin(\operatorname{sech}r)\) on the entire interval and write \(w=(\operatorname{sech}r)^{1/2}a(v)\), with \(a(\pi/2)=1\). For smooth radial tests at the added circle take \(a\) smooth and even in \(v\) near zero. On the compact portion of the funnel, \(f=(\operatorname{sech}r/u)^{1/2}a(v)\), extending as \(\sqrt B\,a(v)\) on the tail. First, as a function of \(r\), the integrand satisfies
\[
 (8w'^2-2w^2)\cosh r
 =8(\partial_r a)^2+2\operatorname{sech}^2r\,a^2-4\partial_r(\tanh r\,a^2).
\]
The last term cancels the outer conformal endpoint contribution, and its cuff term at \(r=0\) is zero. Using \(dv=-\operatorname{sech}r\,dr\), the full funnel form per angular factor \(2\pi L_j\) is
\[
 \mathcal I(a)=\int_0^{\pi/2}(8a_v^2+2a^2)\sin v\,dv .
\]
For example, \(a(v)=1-c\cos v\) gives \(\mathcal I=2-2c+6c^2\). The choice \(c=1/6\) gives \(11/6\), proving an elementary obstruction for \(\sum_j L_j\le24\pi/11\), or equal cuffs \(L_j\le8\pi/11\).

The smooth regular minimizer solves \((\sin v\,a_v)'=\tfrac14\sin v\,a\). It is
\[
 a_*(v)=\frac{\mathsf P_{-1/2}(\cos v)}{\mathsf P_{-1/2}(0)},
 \qquad \mathsf P_{-1/2}(x)={}_2F_1(1/2,1/2;1;(1-x)/2).
\]
The hypergeometric expression is analytic at \(x=1\), so \(a_*(v)\) is smooth in \(v^2\) near the core circle. For any other smooth radial \(a\) with the same cuff trace, the cross term in \(\mathcal I(a_*+(a-a_*))\) vanishes by the equation, the zero variation at \(\pi/2\), and the factor \(\sin v\) at zero. The remaining quadratic term is nonnegative, proving minimality. This also minimizes among smooth funnel data with constant cuff trace, since angular averaging in the product metric \(dv^2+\sin^2v\,d\theta^2+\ell_j^2d\eta^2\) decreases the nonnegative form with potential \(2\). The conformal factor relating this metric to \(h\) has zero normal derivative at the cuff, so the averaging statement has the same boundary value and minimum in \(h\). [NIST DLMF 14.3.1](https://dlmf.nist.gov/14.3.E1)

The integral is its outward conormal at the cuff, as the regular equation gives \(\mathcal I(a_*)=[8a_*\sin v\,a_{*,v}]_0^{\pi/2}\). The Ferrers values at zero are \(\mathsf P_{-1/2}(0)=\sqrt\pi/\Gamma(3/4)^2\) and \(\mathsf P'_{-1/2}(0)=-2\sqrt\pi/\Gamma(1/4)^2\). Thus the radial Dirichlet-to-Neumann coefficient is
\[
 m=\mathcal I(a_*)=8a_{*,v}(\pi/2)
 =16\frac{\Gamma(3/4)^2}{\Gamma(1/4)^2}=1.827786324\ldots .
\]
[NIST DLMF 14.5.1–2](https://dlmf.nist.gov/14.5.i)

## Smooth witnesses and cuff range

The closed form for the optimized test with core value one is \(-8\pi^2+2\pi m\sum_j L_j\). The continuous piecewise-smooth \(f\) belongs to \(H^1(\Sigma)\) and is already smooth across each added circle. To obtain a smooth test, replace it on the funnel side of each cuff by \(1+H(r/\delta)(f-1)\), where \(H\) is the prescribed flat step. This equals \(1\) to infinite order at \(r=0\) and equals the original \(f\) at \(r\ge\delta\). Since \(f-1=O(r)\) and \(\partial_r f\) is bounded near the cuff, the derivative of the modified function is uniformly bounded there as \(\delta\downarrow0\). The collar volume is \(O(\delta)\), so the approximants converge in \(H^1\) and preserve every strict negative margin for small enough \(\delta\).

At equality in the cuff bound, first add \(\varepsilon\psi\) with smooth \(\psi\ge0\), nonzero and compactly supported in \(\operatorname{int} F\times G\). There \(f=1\) and \(R_h=-2\), so the form changes by \(-4\varepsilon\int\psi\,dV_h+\varepsilon^2 Q_h(\psi)<0\) for sufficiently small \(\varepsilon>0\). The same cuff smoothing then gives a smooth strictly negative witness. Hence the induced first eigenvalue is strictly negative whenever
\[
 \sum_{j=1}^3 L_j\le \frac{4\pi}{m},
 \qquad \text{in particular when }L_1=L_2=L_3\le \frac{4\pi}{3m}=2.291728606\ldots .
\]
For every smooth marked completion retaining this seam and its conformal geometry in that cuff range, a positive four-dimensional Yamabe sign forces \(e\ge8\pi^2\). The estimate uses the constant-core test family. The full seam sign at larger cuff lengths and the separate four-dimensional Yamabe sign of a specific interpolation require their own tests.
