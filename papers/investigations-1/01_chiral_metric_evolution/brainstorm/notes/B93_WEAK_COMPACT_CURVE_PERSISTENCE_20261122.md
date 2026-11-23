# B93 — A compact fixed-point test for curve persistence

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Selected-lead conceptual decision; actual model/effort unavailable. Inputs: assessed E186, Fine arXiv:1602.03829v2 Remark 5 and Proposition 7 (3)–(5), and the newly checked Schauder theorem in Laugesen's 22 December 2020 lecture notes, §1.7 Theorem 1.17, printed pp.23–24. The following is a proposed proof route, not an established extension of Fine's theorem.

Fine's C1 implicit-function argument uses a derivative of J'−J. His zeroth-order equation estimate only uses C0. The equation is affine in the first derivative of the curve, suggesting compactness in a weaker topology as an alternative to differentiating the perturbation.

Fix an embedded regular J0-holomorphic sphere u0 in a smooth six-manifold and p=8. Let D0:W1,8(u0*TZ)→L8(Omega0,1⊗u0*TZ) be its fixed linearization, with bounded right inverse Q0. Use a smooth background exponential and parallel transport, then project to the fixed J0 anti-linear output bundle. On a small W1,8 ball this projection is injective on the nearby anti-linear bundles. Thus zeros of the fixed-target F_J' are exactly J'-holomorphic maps. The candidate estimates are

||F_J0(xi)−D0 xi||8 ≤ C ||xi||C0 ||xi||W1,8,
||F_J'(xi)−F_J0(xi)||8 ≤ C ||J'−J0||C0 (1+||xi||W1,8).

Set T(xi)=−Q0(F_J'(xi)−D0 xi) on the radius-r ball of range Q0. For fixed small r and sufficiently small C0 perturbation, these estimates would map the ball into itself. The ball is compact and convex in the C0 topology by reflexivity and compact Sobolev embedding. If xi_n converge in C0 within this ball, their derivatives converge weakly in L8; all equation coefficients converge uniformly for each fixed smooth J'. Because F is affine in Dxi, F(xi_n) converges weakly in L8. Bounded Q0 and compact embedding would then make T continuous in C0. Schauder would supply a fixed point, hence a W1,8 solution, without a uniform derivative bound on J'. This is the exact continuity and compactness claim to test, not an assumption.

The fixed-point argument must also keep the correct output bundle and the closed complement to ker D0, and produce actual nonconstant smooth curves homotopic to u0. Individual smoothness for each smooth J' may use its derivatives, though the existence threshold must not. One possible regularity proof is local difference quotients: W1,8 gives differentiated forcing in L4, a small local continuous coefficient perturbation of a constant Cauchy–Riemann operator gives W2,4, and bootstrapping then uses individual smooth J'. Audit every step or identify its first precise failure.

Issue E190 for this one bounded proposed lemma. Do not claim bubble exclusion, taming, novelty, uniqueness, smooth dependence on J', or uniform higher bounds. Even a successful persistence lemma leaves the independent metric taming premise in B91 unresolved under the present bounded-strain assumptions. E189 is reserved for independent review of E187's finite algebra and is not part of this route.

[E186 assessment](../../reviews/E186_TWISTOR_COMPARISON_ASSESSMENT_20261122.md) · [R38/R39 records](../../../../../references/SOURCE_NOTES_CME_CONTINUATION_COMPARISON_20261122.md).
