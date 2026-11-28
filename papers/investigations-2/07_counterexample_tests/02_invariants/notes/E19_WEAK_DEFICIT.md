# WIN-E19 · Weak lower semicontinuity of the conformality deficit

27 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI Codex assistance. Configured GPT-6.2 Sol at ultra effort in the
[frozen request](../research-progress/handoffs/REQUEST_FIXED_METRIC_GAP_R1.md),
SHA-256 c67b3966581000603237f8e369df5bfbe3d376862fb994090582c7ed5877e1df.
Actual serving variant and effort are unavailable. Baseline
86b24d9f9c2d6d634236f723eae0de4dd99fc5a7. The
[balance estimate](BALANCED_SPECTRAL_BOUND.md) has SHA-256
8dff6f0d96d781987d247243c6cd67704b1ea21c61ef810fc0f1409cb1a0250b and
[the centering argument](CENTERED_EXTREMA.md) has SHA-256
5ca81169c76e3edec6f097b3eb497db4e6d13da84791ed15e1e84ce45e840b83.
Working analytical deduction using a checked primary import.

## Import and Euclidean density

Emilio Acerbi and Nicola Fusco, *Semicontinuity Problems in the Calculus
of Variations*, Arch. Ration. Mech. Anal. **86** (1984), 125–145,
Theorem [II.4], p. 137, with proof on pp. 137–140. In their notation let
\(1\le p<\infty\) and let \(F:\mathbb R^n\times\mathbb R^m\times
\mathbb R^{m\times n}\to\mathbb R\) be Carathéodory, (II.2), and
quasiconvex in the last variable, (II.3). The latter condition is required
for every value variable outside one exceptional null set of source
points. Assume (II.6), \(0\le F(x,z,A)\le a(x)+C(|z|^p+|A|^p)\),
with \(a\ge0\) locally integrable and \(C\ge0\) constant. Then for every
open \(\Omega\subset\mathbb R^n\),
\(\int_\Omega F(x,u,Du)\,dx\) is sequentially weakly lower
semicontinuous on \(W^{1,p}(\Omega;\mathbb R^m)\). Definition [I.2] and
(I.1), p. 127, give the quasiconvex inequality for compactly supported
variations of an affine map. Definition [I.4], p. 128, specifies
measurability in \(x\) and continuity in \((z,A)\).

Inspected on 27 November 2026 in the OCR of the original typeset
article, including the theorem and stated conditions. The publisher
page confirms the journal metadata and lists subscription or purchase
for the PDF. The
ResearchGate record identifies Emilio Acerbi as the uploader of a
full-text copy. The checked passages came from the accessible journal
text in the Academia mirror.
[DOI](https://doi.org/10.1007/BF00275731) ·
[Original article text](https://www.academia.edu/95555857/Semicontinuity_problems_in_the_calculus_of_variations) ·
[Acerbi's upload record](https://www.researchgate.net/publication/226145308_Semicontinuity_problems_in_the_calculus_of_variations)

Let \(M\) be a compact oriented smooth four-manifold with fixed smooth
Riemannian metric \(g\), closed in the application. Use the unit round
target sphere \(S^4\subset\mathbb R^5\) with volume form \(\mathrm{vol}_0\)
and boundary orientation. The sign \(\sigma\in\{-1,1\}\) specifies the
desired orientation for the nonzero differential. Changing the target
orientation also changes the sign used for the same test. For an
extrinsic \(W^{1,4}\) sphere-valued map define its signed Jacobian by
\(f^*\mathrm{vol}_0=J_g(f)\,dV_g\) a.e. This pullback uses the ambient
values and the weak tangent differential. Write
\[
 \mathcal D_{g,\sigma}(f)=
 \int_M (|df|_g^4-16\sigma J_g(f))\,dV_g ,
\]
where the differential norm is Hilbert–Schmidt.

In an oriented chart let \(G=(g_{ij})\), \(\mu=\sqrt{\det G}\),
\(A=[A_1,\ldots,A_4]\in\mathbb R^{5\times4}\) and
\(\widehat z=z/\max(1,|z|)\). On the chart use the ambient density
\[
 L(x,z,A)=\mu(x)|A G(x)^{-1/2}|_{\mathrm{HS}}^4
          -16\sigma\det[\widehat z,A_1,A_2,A_3,A_4].
\]
The first term includes the source volume factor. For sphere-valued
\(f\), the second term before multiplication by \(16\sigma\) is
\(J_g(f)\mu\) at \(z=f,A=Df\). The expression \(L(x,f,Df)\,dx\)
therefore gives precisely the desired intrinsic integrand times
\(dV_g\).

**Nonnegativity and growth.** Put \(B=A G^{-1/2}\) and let
\(s_1,\dots,s_4\) be its singular values. Right multiplication of the
last four columns by \(G^{-1/2}\) gives
\[
 |\det[\widehat z,A]|
 =\mu|\det[\widehat z,B]|
 \le\mu\prod_{i=1}^4 s_i
 \le\tfrac{\mu}{16}\Bigl(\sum_{i=1}^4 s_i^2\Bigr)^2.
\]
The first bound uses \(|\widehat z|\le1\). The second is AM–GM on the
squared singular values. Thus \(0\le L\le2\mu |B|_{\rm HS}^4\) for
every ambient \((z,A)\). On relatively compact chart subsets this
gives \(0\le L\le C|A|^4\), so (II.6) holds with \(p=4\) and \(a=0\).

**Quasiconvexity.** At fixed \(x,z\) the first term is convex in \(A\).
The second is a fixed linear combination of \(4\times4\) minors of
\(A\). On a cube the integral of each minor of \(A+D\varphi\) equals
the integral of the constant minor of \(A\) for smooth compactly
supported \(\varphi\). Indeed expand the wedge of the four component
differentials of \(x\mapsto Ax+\varphi(x)\). Every nonconstant term
has some \(d\varphi^\alpha\) and is the exterior derivative of a
compactly supported three-form by replacing that factor by
\(\varphi^\alpha\). Stokes gives zero for the integral of each such
term. Approximation gives the same for \(C_c^1\) tests. Jensen for
the first term and this identity prove (I.1), for both signs of
\(\sigma\). Continuity in \((z,A)\) includes at \(|z|=1\) by the
continuous bounded projection \(z\mapsto \widehat z\).

## Localization and the weak limit

Take finitely many oriented coordinate balls whose closures stay in
larger coordinate domains, with a smooth nonnegative partition of
unity \(\chi_i\) compactly supported in the balls. In each oriented
chart multiply \(L\) by the coordinate function \(\chi_i\) and extend
the product by zero to all source points of \(\mathbb R^4\).
This is measurable in \(x\), continuous in \((z,A)\), quasiconvex in
\(A\) at fixed \(x,z\), and satisfies the global nonnegative fourth
power growth bound. Relative compactness and smooth positive \(G\)
give the uniform constants. The coordinate restriction
\(W^{1,4}(M;\mathbb R^5)\to W^{1,4}(\Omega_i;\mathbb R^5)\) is
bounded linear and therefore weakly continuous. Apply [II.4] with
\(n=4,m=5,p=4\) to each weighted density on its coordinate ball
\(\Omega_i\). Sum the finitely many liminf inequalities, using
nonnegativity and the partition of unity. If the term compact includes
boundary, the same argument with nonnegative compactly supported
cutoffs in the interior followed by exhaustion gives the inequality,
since the boundary has four-dimensional measure zero.

For the convergence in the packet, \(f_j\rightharpoonup f\) extrinsically
in \(W^{1,4}\) and \(f_j\to f\) strongly in \(L^2(dV_g)\).
The latter gives \(\||f|-1\|_{L^2}\le\|f-f_j\|_{L^2}\to0\). It also
gives \(\int f\,dV_g=\lim_j\int f_j\,dV_g=0\). The Sobolev chain rule
for the squared norm now gives \(f\cdot df=0\) a.e., so \(df\) is
tangent to the sphere. These properties justify evaluating the
intrinsic density at the limit. The localized result is
\[
 \mathcal D_{g,\sigma}(f)\le
 \liminf_j\mathcal D_{g,\sigma}(f_j).
\]
This inequality concerns the combined deficit. For example, on the
round sphere, the positive conformal automorphisms \(x\mapsto jx\) in
stereographic coordinates have fixed degree \(+1\) and uniformly
bounded \(W^{1,4}\) norm. They converge a.e. and strongly in \(L^2\)
to the omitted pole, hence converge weakly in \(W^{1,4}\) to that
constant. The Jacobian integrals remain \(\mathrm{Vol}(S^4)\) for the
maps and equal zero for the limit. This example is uncentered. The
proof above uses no continuity of the degree integral.

## Application to a vanishing-residue sequence at fixed metric

For volume-centered smooth generating pencils with \(R_g(E_j)\to0\),
use the pointwise estimate of the frozen balance proof. With
\(H_j=\|df_j\|_{L^4(g)}^2\) it gives
\[
 0\le\mathcal D_{g,\sigma}(f_j)
 \le 408 H_j R_g(E_j)^{1/2},
 \qquad H_j^2\le16\mathrm{Vol}(S^4)+408 H_j R_g(E_j)^{1/2}.
\]
The first bound integrates \(102|df_j|^2d_j^2\) using
\(\|d_j\|_{L^4}^2=4R_g(E_j)^{1/2}\). The energy inequality uses
the absolute degree one of the smooth kernel maps. The quadratic
bound makes \(H_j\) bounded and the deficit tends to zero. Reflexivity
and compact Sobolev embedding on fixed compact \(M\) give a subsequence
with the stated weak \(W^{1,4}\) and strong \(L^2\) convergences.

The limiting deficit is zero. On the tangent space of the sphere,
equality in the nonnegative density forces all four singular values
of \(df\) to be equal. Where this common value is positive, the
signed Jacobian condition is \(\sigma J_g(f)>0\). Where it is zero,
the differential vanishes. Thus \(df\) is a similarity of orientation
sign \(\sigma\) or zero a.e. The limit is nonconstant because it has
unit norm a.e. and zero vector mean for the fixed positive-volume
measure. This conclusion is at extrinsic \(W^{1,4}\) regularity, which
is the end of the packet.
