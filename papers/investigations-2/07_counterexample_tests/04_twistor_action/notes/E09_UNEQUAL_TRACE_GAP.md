# SP4-TWA-E09 · Positive action gap for unequal constant end traces

28 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. [Frozen request v1](../research-progress/handoffs/E09_REQUEST_v1.md) records the selected lead GPT-6.2 Astra/ultra and the configured helper GPT-6.2 Sol/ultra. Actual backend model and reasoning effort were unavailable. HEAD was `280376dd7a1820fa2878d0ab0ee2e639facb2eeb` and all eight frozen SHA-256 digests matched. The result is a global analytical bound over the admissible fields on this fixed cylinder.

## Domain and bounds

Let \(M=[0,L]\times T^3\) with \(L>0\), its oriented flat Riemannian product metric, and the periodic spin structure on the flat torus of volume \(V>0\). Use the positive half-spin bundle \(S^+\) on which real self-dual two-forms act and the Levi–Civita spin connection. Fix a unit parallel spinor \(\psi_0\) and real numbers \(u_0,u_1\). The two ends have prescribed traces \(a_0\psi_0,a_1\psi_0\), with \(a_i=e^{u_i}\). The admissible fields \(\psi\) are smooth up to the boundary and may have finitely many transverse interior zeros with \(P\psi=0\) at each zero. This jet condition is equivalent to \(\nabla_X\psi=X\cdot\eta\) there with some nonzero \(\eta\in S^-\). Use the [branch action](../research-overview/OVERVIEW.md) \(S[\psi]=J(\psi)^4\), with

\[
J(\psi)=\left(\int_{M\setminus Z(\psi)}\frac{|P\psi|^4}{|\psi|^4}\,dV_g\right)^{1/4},
\qquad P_X\psi=\nabla_X\psi+\tfrac14 X\cdot D\psi,
\qquad D=\sum_{i=0}^3 e_i\cdot\nabla_{e_i}.
\]

Here \(e_0=\partial_t\), the frame is parallel, \(X\cdot X=-|X|^2\), and pairings are real parts of Hermitian pairings. All norms below use the product metric and volume. In accordance with [B05](../brainstorm/notes/B05_UNEQUAL_TRACE_GAP.md), define the ordinary affine extension \(h=((1-t/L)a_0+(t/L)a_1)\psi_0\) and set \(A=\|Ph\|_2\), \(H=\|h\|_4\). Their values are

\[
A^2=\frac{3V}{4L}(a_1-a_0)^2,
\qquad H^4=\frac{VL}{5}\sum_{k=0}^4 a_0^{4-k}a_1^k.
\]

The only derivative of \(h\) is in the \(t\)-direction, so \(|Dh|^2=|\nabla h|^2\) by Clifford multiplication by \(e_0\). The projection identity below gives \(|Ph|^2=\tfrac34(a_1-a_0)^2/L^2\). Integrating the fourth power of the positive affine amplitude gives the displayed expression for \(H^4\), also valid when \(a_0=a_1\).

For \(u_0\ne u_1\), the full infimum on this prescribed-trace class satisfies

\[
0<\frac{A}{\sqrt{H^2+C^2A^2}}
\ \le\ \inf_{\psi}J(\psi)
\ \le\ \frac{\sqrt3}{2}\,\frac{V^{1/4}}{L^{3/4}}\,|u_1-u_0|,
\qquad
C=\frac{2}{\sqrt3}\,S_{\mathrm{Sob}}\sqrt{1+(L/\pi)^2},
\]

where \(S_{\mathrm{Sob}}\) is any constant for \(\|z\|_4\le S_{\mathrm{Sob}}(\|z\|_2^2+\|\nabla z\|_2^2)^{1/2}\) on the product with zero end traces. The upper bound is the value of the zero-free affine-logarithm trial \(e^{u_0+(u_1-u_0)t/L}\psi_0\) from [E02](E02_FLAT_TORUS.md), whose action is \(9V(u_1-u_0)^4/(16L^3)\). Taking fourth powers gives the corresponding bracket for \(\inf_\psi S[\psi]\). Its exact value, attainment and the global minimality of the radial trial remain open in this packet.

## Flat zero-trace estimate and orthogonality

In the parallel frame let \(c(T)=\sum_i e_i\cdot T(e_i)\) be Clifford contraction. Skew-adjointness gives \(c^*v=-\sum_i e^i\otimes(e_i\cdot v)\) and hence \(cc^*=4I\). Thus \(Q=I-\tfrac14c^*c\) is the orthogonal projection onto \(\ker c\), \(P=Q\nabla\), and

\[
|Pz|^2=|\nabla z|^2-\tfrac14|Dz|^2.
\]

For \(z=\psi-h\), the trace is zero at both ends. The flat spin frame and the Clifford anticommutator give \(D^2=-\sum_i\partial_i^2\) on the two chiralities together. The flat Dirac Green identity is

\[
\int_M\big((Df,k)_{\mathbb R}-(f,Dk)_{\mathbb R}\big)\,dV_g
=\int_{\partial M}(\nu\cdot f,k)_{\mathbb R}\,dA_g.
\]

It follows by integrating the derivatives in \(D\) by parts and moving Clifford multiplication by skew-adjointness. Set \(f=z\), \(k=Dz\). The right side vanishes because \(z|_{\partial M}=0\), so \(\|Dz\|_2^2=\int_M(z,D^2z)_{\mathbb R}\,dV_g=\|\nabla z\|_2^2\). The second equality integrates the component Laplacian by parts, again with zero boundary term. Therefore

\[
\|Pz\|_2^2=\tfrac34\|\nabla z\|_2^2.
\]

The four-dimensional Sobolev inequality gives \(S_{\mathrm{Sob}}<\infty\) by zero extension to the doubled flat product in the \(t\)-variable and application in finitely many local charts. One-dimensional Dirichlet Poincaré in the \(t\)-variable, on each interval at fixed torus point and for each spinor component, gives \(\|z\|_2\le (L/\pi)\|\nabla_{\partial_t}z\|_2\). Combining these yields \(\|z\|_4\le C\|Pz\|_2\). The homogeneous estimate is thus proved directly on the cylinder, adapting the Sobolev and Hölder steps of [DIR-E07](../../../../investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/notes/DIR_E07_20261124.md). The zero-trace condition excludes the nonzero parallel fields of the periodic product.

The one-form spinor \(Ph=Q\nabla h\) is parallel because \(\nabla h\) and the Clifford action are parallel, and \(QPh=Ph\). Consequently

\[
\int_M(Ph,Pz)_{\mathbb R}\,dV_g
=\int_M(Ph,\nabla z)_{\mathbb R}\,dV_g
=\int_{\partial M}\big((Ph)(\nu),z\big)_{\mathbb R}\,dA_g=0.
\]

Here the first equality uses orthogonal projection, the second uses the vanishing divergence of \(Ph\), and the last uses both zero traces. With \(B=\|P\psi\|_2\) this gives \(B^2=A^2+\|Pz\|_2^2\).

## Hölder, unequal traces and the diagonal

At a transverse zero the spinor norm is comparable to the distance to the zero. Its compatible first jet gives \(P\psi=0\) there and smoothness gives \(|P\psi|=O(r)\), so the quotient is bounded locally. Define \(q=|P\psi|/|\psi|\) off the finite zero set and \(q=0\) on it. Because the zero set has volume zero, \(|P\psi|=q|\psi|\) almost everywhere. Hölder applied to \(q^2\) and \(|\psi|^2\), both in \(L^2\), gives \(B^2\le \|q\|_4^2\|\psi\|_4^2\), or \(B\le J(\psi)\|\psi\|_4\). The lower bound also holds in the extended-real convention that includes incompatible transverse zeros with infinite cost. The integrated identities above are on the entire smooth cylinder, including the interior zeros.

When \(A>0\), put \(w=\|Pz\|_2=\sqrt{B^2-A^2}\). The triangle inequality and Cauchy–Schwarz give

\[
\|\psi\|_4\le H+Cw
= (H/A,C)\cdot(A,w)
\le \sqrt{(H/A)^2+C^2}\,B.
\]

Since \(B\ge A>0\), combining with Hölder proves the lower bound. Equality in the two-dimensional Cauchy–Schwarz bound occurs at \(w=CA^2/H\), the optimum of this scalar estimate.

When \(u_0=u_1\), \(h\) is the constant parallel spinor \(a_0\psi_0\) and attains \(J=0\). Every admissible field with \(J=0\) has \(B=0\) by Hölder. The zero-trace identity gives \(\nabla z=0\), and the trace then gives \(z=0\). This proves uniqueness of the zero-action field on the diagonal.

## Source inspection

The eight frozen inputs were checked. The branch overview and [canonical action note](../../02_invariants/notes/RELATIVE_TWISTOR_ACTION.md#a-boundary-relation-on-a-flat-product) fix the action normalization and radial control. E02 gives the trial. B05 fixes the ordinary affine extension. [DIR-E06](../../../../investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/notes/DIR_E06_20261124.md) and DIR-E07 give the zero-jet comparison, and [DIR-E10](../../../../investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/notes/DIR_E10_20261124.md) confirms the Clifford projection. Friedrich's digitized published text (1990, Supplemento 22, pp. 59–75), §1 equation (1.1) and §2 Example 2 on pp. 62–63, was checked for the Riemannian operator convention and flat-model comparison. The Dirichlet identity, orthogonality and quantitative gap above follow directly on the fixed periodic cylinder. [Friedrich, published scan](https://dml.cz/bitstream/handle/10338.dmlcz/701462/WSGP_09-1989-1_7.pdf#page=2)
