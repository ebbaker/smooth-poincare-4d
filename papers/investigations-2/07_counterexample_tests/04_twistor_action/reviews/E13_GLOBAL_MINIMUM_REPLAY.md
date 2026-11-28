# SP4-TWA-E13 · Independent replay of the fixed-trace global minimum

28 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. The [frozen request](../research-progress/handoffs/E13_REQUEST_v1.md) records GPT-6.2 Astra/ultra as the selected lead and GPT-6.2 Sol/ultra as the configured helper. Actual backend serving model and reasoning effort were unavailable. HEAD was `280376dd7a1820fa2878d0ab0ee2e639facb2eeb`. All thirteen frozen SHA-256 digests matched. This reviewer authored none of E11, E12 or the minimizing-sequence corollary.

**Disposition.** The [global comparison](../notes/E11_GLOBAL_COMPARISON.md), [Sobolev estimate](../notes/E12_CYLINDER_CONSTANT.md), [sequence corollary](../notes/B07_MINIMIZING_SEQUENCES.md) and [formalization handoff](../research-progress/handoffs/TO_FORMALIZATION_TWA_GLOBAL_MINIMUM_20261128.md) pass at the frozen scope. For the stated traces the radial field uniquely attains \(9/(8\cdot200^4)\) over the full admissible smooth class. Every minimizing sequence converges strongly in \(H^1\), and some minimizing sequences have \(H^5\) norm tending to infinity.

## Domain, change of variables and boundary terms

Use the oriented Riemannian product \(M=[-1,1]\times(\mathbb R/\mathbb Z)^3\) of total volume \(D=2\), its periodic spin structure, the Levi–Civita spin connection and a unit parallel positive half-spinor \(\sigma\). The chirality is the one carrying real self-dual two-forms. Clifford multiplication satisfies \(X\cdot X=-|X|^2\), and spinor pairings are the real parts of the Hermitian pairings. Let \(c\) be Clifford contraction, \(\Pi=I-c^*c/4\) the orthogonal projection onto \(\ker c\), and \(P=\Pi\nabla\). Here \(cc^*=4I\) follows from \(c^*z=-\sum_j e^j\otimes e_j\cdot z\). Define \(A=\Pi(dt\otimes\cdot)\), \(b=1/200\), \(B=P+bA\), and \(k^2=3b^2/4\). The projection formula and the unit norm of Clifford multiplication by \(\partial_t\) give \(A^*A=3I/4\) and \(Az(\partial_t)=3z/4\).

For a smooth competitor \(\psi\) with exact traces \(e^{\pm b}\sigma\), put \(f=e^{-bt}\psi=\sigma+v\) so \(v\) has zero trace on both faces. The product rule gives \(Bf=e^{-bt}P\psi\). Thus the quartic quotient of \(Bf\) by \(f\) is exactly the original density for \(S_g=J_g^4\) on the common nonzero locus. A transverse zero has \(|f|\asymp r\), and the Clifford-compatible first jet gives \(Bf=O(r)\). The ratio \(q=|Bf|/|f|\) extended by zero on the finite zero set is consequently in \(L^4\), and \(|Bf|=q|f|\) almost everywhere. Cauchy–Schwarz on \(q^2\) and \(|f|^2\) gives \(\|Bf\|_2^2\le J_g(\psi)^2\|f\|_4^2\). Equality requires \(q^2=\lambda |f|^2\) almost everywhere for some \(\lambda\ge0\), since the prescribed trace gives \(\|f\|_4>0\). At \(f=\sigma\) it holds with \(\lambda=k^2\). If instead a transverse zero is incompatible, a lower bound on \(|P\psi|\) and the upper bound \(|\psi|=O(r)\) give the logarithmically divergent \(\int_0^\epsilon dr/r\), so including it at extended cost \(+\infty\) preserves the finite infimum.

In the numerator expansion \(B\sigma=bA\sigma\). Projection orthogonality changes the cross pairing \(\langle A\sigma,Pv\rangle\) to \(\langle A\sigma,\nabla v\rangle\). The tensor \(A\sigma\) is parallel, so the integrated pairing is its outward boundary pairing with \(v\). Its endpoint factors are \(-(3/4)\sigma\) at \(t=-1\) and \(+(3/4)\sigma\) at \(t=1\), because \(\nu_\pm=\pm\partial_t\). Both contributions vanish by the zero trace. The remaining cross term is \(2b^2\int_M\langle A\sigma,Av\rangle=2k^2\int_M\langle\sigma,v\rangle\), and hence
\[
\|Bf\|_2^2=Dk^2+2k^2\int_M\langle\sigma,v\rangle+\|Bv\|_2^2 .
\]
For \(G(u)=\|u\|_4^2\), \(G(\sigma)=\sqrt D\) and \(DG(\sigma)[v]=(2/\sqrt D)\int_M\langle\sigma,v\rangle\). The constant and linear terms of \(k^2\sqrt D\,G(\sigma+v)\) therefore cancel those of the numerator exactly.

## Global estimate for the squared \(L^4\) norm

Take real finite-dimensional Hilbert-valued \(u,v\in L^4\) and write \(u_s=u+sv\), \(I(s)=\int |u_s|^4\). The polynomial coefficients are finite by Hölder. Direct differentiation with real pairings yields
\[
I'=4\int |u_s|^2\langle u_s,v\rangle,\qquad
I''=4\int |u_s|^2|v|^2+8\int\langle u_s,v\rangle^2
\le 12 I^{1/2}\|v\|_4^2 .
\]
Where \(I>0\), \((I^{1/2})''=I''/(2I^{1/2})-(I')^2/(4I^{3/2})\le6\|v\|_4^2\). If \(I(s_0)=0\), then \(u=-s_0v\) as \(L^4\) elements and \(G(u_s)=(s-s_0)^2\|v\|_4^2\) along the whole line. This includes the constant zero line. Taylor's integral formula on \([0,1]\) thus gives
\[
G(u+v)\le G(u)+DG(u)[v]+3\|v\|_4^2,\qquad
DG(u)[v]=\frac{2}{\|u\|_4^2}\int |u|^2\langle u,v\rangle\quad(u\ne0).
\]
At \(u=0\) the derivative is zero. The sharpness check for the abstract norm estimate also works. For unit constant \(u\) and \(v=\pm\epsilon u\) on equal-volume halves, the derivative term vanishes, while \(G(u+v)=\sqrt D\sqrt{1+6\epsilon^2+\epsilon^4}\) and \(\|v\|_4^2=\sqrt D\,\epsilon^2\). The normalized remainder tends to \(3\).

## Explicit homogeneous cylinder bound and coercivity

I inspected the printed theorem (1)–(2) on Talenti's p. 353. In dimension \(m=4\) with \(p=2\) its exponent is \(q=4\). In (2) the prefactors are \(\pi^{-1/2}/(2\sqrt2)\) and the gamma quotient is \(\Gamma(3)\Gamma(4)/(\Gamma(2)\Gamma(3))=6\), to the \(1/4\) power. The scalar Euclidean inequality thus has \(C_{4,2}^4=3/(32\pi^2)<1\). For a compactly supported \(H^1(\mathbb R^4)\) function the inequality follows by compactly supported smooth mollification, a subsequence converging almost everywhere, and Fatou's lemma. [Talenti, published scan, p. 353](https://math.jhu.edu/~js/Math646/talenti.sobolev.pdf#page=1)

In a periodic parallel spin frame extend \(v\) in the tangential directions periodically and extend by zero in time. The lift \(\widetilde v\) belongs to \(H^1_{\mathrm{loc}}(\mathbb R^4)\), since the torus identifications match values on tangential cell faces and the zero end traces eliminate distributional jumps at \(t=\pm1\). For the second statement one may integrate by parts on almost every absolutely continuous time slice. Let \(\chi(x)\) be the product of the three copies of the piecewise linear cutoff that is one on \([0,1]\), zero outside \([-1,2]\), and has slopes of absolute value at most one. Then \(|\nabla\chi|\le\sqrt3\) almost everywhere. For \(w=\chi|\widetilde v|\), the norm chain rule gives \(|\nabla|\widetilde v||\le|\nabla\widetilde v|\). For example, apply the chain rule to \(\sqrt{|\widetilde v|^2+\epsilon^2}-\epsilon\), whose differential has norm at most one, and take the weak derivative limit. This avoids a component-dependent factor in the scalar reduction. The cutoff yields compact support and \(w=|v|\) on the fundamental cylinder. The support cube \([-1,2]^3\) has exactly \(27\) cells, so the \(L^2\) norms on the extended slab are \(\sqrt{27}\) times the norms on the fundamental product. The zero trace at \(t=-1\) gives \(\|v\|_2\le2\|\partial_t v\|_2\) by integrating \(\partial_t v\) and using Cauchy–Schwarz over an interval of length two. The Euclidean bound and the \(L^2\) triangle inequality now give
\[
\|v\|_4\le C_{4,2}\sqrt{27}\big(\|\nabla v\|_2+\sqrt3\|v\|_2\big)
\le (18+3\sqrt3)\|\nabla v\|_2\le24\|\nabla v\|_2 .
\]
This works for the real \(H^1\) zero-trace space.

By the flat Dirac square \(D_g^2=-\Delta\), formal self-adjointness in the real pairing, and integration by parts, \(\|D_gv\|_2^2=\|\nabla v\|_2^2\) for smooth zero-trace fields. Each outer face term contains \(v|_{\partial M}\), and periodicity eliminates tangential face terms. Therefore \(\|Pv\|_2^2=\|\nabla v\|_2^2-\|D_gv\|_2^2/4=(3/4)\|\nabla v\|_2^2\). The reverse triangle inequality for \(B=P+bA\), \(A^*A=3I/4\), and \(\|v\|_2\le2\|\nabla v\|_2\) give \(\|Bv\|_2\ge(\sqrt3/2)(1-2b)\|\nabla v\|_2\), with \(1-2b>0\).

Using affine cancellation and the global norm estimate, the difference \(\|Bf\|_2^2-k^2\sqrt D\,\|f\|_4^2\) is at least \(\|Bv\|_2^2-3k^2\sqrt D\,\|v\|_4^2\), and hence at least \(c\|\nabla v\|_2^2\) where
\[
c=\tfrac34(1-2b)^2-3 k^2\sqrt2\,24^2
=\frac{29403-1296\sqrt2}{40000}
>\frac{27459}{40000}>\frac23 .
\]
Here \(k^2=3/(4\cdot200^2)\), \(\sqrt2<3/2\), and \(3\cdot27459>80000\). This proves the global quadratic estimate with the stated numerical margin on the actual fixed product.

## Equality, strong convergence and the high-frequency test

Combining the comparison with Hölder yields
\[
\big[J_g(\psi)^2-k^2\sqrt D\big]\|f\|_4^2
\ge \tfrac23\|\nabla v\|_2^2 .
\]
Since \(\|f\|_4>0\) and \(J_g(\psi)\ge0\), the action is at least \(Dk^4=9/(8\cdot200^4)\). At \(\psi_*=e^{bt}\sigma\) the quotient is constant \(k\), so its action is exactly \(Dk^4\) and it is an admissible minimizer. Any competitor attaining equality satisfies \(\nabla v=0\), and the interval bound forces \(v=0\). Smoothness then gives the field equality everywhere.

For a minimizing sequence write \(\psi_n=e^{bt}(\sigma+v_n)\), \(x_n=\|\nabla v_n\|_2\), and \(\delta_n=J_g(\psi_n)^2-k^2\sqrt D\). Then \(0\le\delta_n\to0\) and
\[
\sqrt{2/3}\,x_n
\le \sqrt{\delta_n}\big(D^{1/4}+24x_n\big).
\]
For large \(n\), \(24\sqrt{\delta_n}\le\sqrt{2/3}/2\), so \(x_n\le 2D^{1/4}\sqrt{\delta_n/(2/3)}\to0\). Poincaré gives \(\|v_n\|_{H^1}\le\sqrt5\,x_n\). Multiplication by the fixed \(e^{bt}\) is bounded on \(H^1\), giving strong convergence of the whole sequence to \(\psi_*\).

Independently, for \(n\ge2\) take \(\psi_n=e^{bt}(1+n^{-2}\sin(n\pi(t+1)/2))\sigma\). At both ends the sine vanishes, and the conjugated scalar factor is at least \(3/4\). Its difference from one goes to zero in \(C^1\) at rate \(O(n^{-1})\), so the quotients and the action densities converge uniformly to the radial ones. This is a smooth zero-free minimizing sequence. In conjugated variables the fifth time derivative alternates between sine and cosine with amplitude \((\pi/2)^5 n^3\). The square-integral of each trigonometric factor on \([-1,1]\) is one, and the torus has unit volume. Hence the \(L^2\) norm of that derivative is \((\pi/2)^5 n^3\). Since multiplication by \(e^{-bt}\) is bounded on \(H^5\), the original \(H^5\) norms tend to infinity.

This sequence consists of competitors at fixed \(b\). [E08](../notes/E08_LOCAL_DIRICHLET.md) quantifies over critical fields in its \(H^5\) neighborhood for nearby full traces. The [earlier small-jump estimate](../notes/SMALL_TRACE_ASYMPTOTIC.md) quantifies over competitors at or below the radial trial as the jump varies after centering the average log amplitude. The present theorem supplies exact attainment, equality and a whole-sequence \(H^1\) limit at the one frozen trace pair.

## Formalization statement and evidence scope

The [formalization handoff](../research-progress/handoffs/TO_FORMALIZATION_TWA_GLOBAL_MINIMUM_20261128.md) has the required product, metric, periodic spin structure, chirality, real pairing, slope, two traces and compatible-zero class. Its exact minimum, equality iff the pointwise radial field, unchanged infimum under the extended-value convention, and strong \(H^1\) sequence conclusion all follow above. The intermediate inequality for any smooth zero-trace \(v\), the real finite-dimensional squared-\(L^4\) bound, the scalar Euclidean Sobolev input, the product lift and the stated arithmetic inequality have matching scopes. The Lean and mathlib pins listed there match the checkout. This review is an analytic replay of the statements and records no formal verification.

The thirteen frozen inputs include the [overview](../research-overview/OVERVIEW.md) and [prior independent analytic replay](E07_ANALYTIC_REPLAY.md), which fix the action normalization, flat operator, zero-jet criterion and earlier quantifiers. The [B07 decision](../brainstorm/notes/B07_GLOBAL_COMPARISON.md) fixes the comparison and its domain. I independently checked the coefficients and boundary signs, the signed trace pair, the equality test, both sequence assertions, and the printed source for the Euclidean constant. These conclusions concern the prescribed smooth finite-cost class on this one fixed cylinder.
