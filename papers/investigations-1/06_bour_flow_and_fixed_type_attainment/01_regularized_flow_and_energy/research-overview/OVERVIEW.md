# Research overview — regularized flow and energy

26 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance. The exact serving model identifier and reasoning effort were unavailable. The [reference guide](../references/README.md) identifies the inputs and their inspected versions. The [plan](../research-plan/PLAN.md) defines the proposed tasks, and the [sole register](../research-progress/REGISTER.md) owns their status.

## Fixed smooth type and normalization

Let $M$ be a connected, smooth, closed, oriented Riemannian homotopy four-sphere, with $\chi(M)=2$ and $\tau(M)=0$. The focus is a hypothesized nonstandard smooth type with a supplied positive Yamabe class below the entry wall. Write
\[
E_\pm(g)=\int_M|W_g^\pm|_{\mathrm{HS}}^2\,dV_g,
\qquad e(g)=E_+(g)=E_-(g),\qquad T=4\pi^2,
\]
where each Weyl operator acts on $\Lambda_g^\pm$. Use the Yamabe constant $Y([g])$ in the convention with quotient numerator $\int_M(6|\nabla u|^2+R_gu^2)\,dV_g$, so Bour's constant is $Y([g])/6$. Set $I=I^+(M)=\inf_{Y([g])>0}e(g)$ over smooth metrics on this fixed type and assume $I<2T$. For the first-flow sequence use volume-one Yamabe minimizers $g_0=g_0(\alpha)$ in positive classes with $e_0=e(g_0)<2T$ and $0\le e_0-I\le\alpha^2$. Take $0<\alpha<1-e_0/(2T)$ at each start. The entry condition is inherited as a hypothesis. [Master setup and wall](../../../../master/research-overview/OVERVIEW.md) · [Bach-flow normalization](../../../02_bach_flow/research-overview/OVERVIEW.md#modified-bach-equation-and-its-round-benchmark)

For the trace-free Ricci and scalar energies write $D(g)=\int_M|\mathrm{Ric}_{0,g}|^2\,dV_g$ and $F_R(g)=\int_M R_g^2\,dV_g$. The two expressions for Bour's functional on the closed source are
\[
\mathcal F^\alpha(g)=(1-\alpha)2e(g)+\tfrac{\alpha}{2}D(g)
=2e(g)+\tfrac{\alpha}{24}F_R(g)-16\alpha\pi^2.
\]
The first uses $F_W=E_++E_-$ in the curvature-operator norm and the second uses Chern–Gauss–Bonnet. We use the negative $L^2$ gradient equation $\partial_tg=-2\nabla\mathcal F^\alpha(g)$ at fixed $\alpha$. It differs from the scalar-corrected modified Bach flow in investigation 02. [Bour, §1.2 and §4](../../../../../references/SOURCE_NOTES_BOUR_ATTAINMENT_20261126.md) · [Claude review, F2](../../../../master/reviews/claude/EXTERNAL_PROGRAM_REVIEW_20261126.md#f2-the-extraction-problem-can-probably-be-replaced-by-a-fourth-order-flow-that-is-already-in-the-literature)

## Statement to audit at fixed parameter

Bour's arXiv preprint states short-time existence for this gradient equation at positive $\alpha$ via Theorem 1.4. Theorem 1.11 assumes a compact Riemannian four-manifold, $0<\alpha<1$, $Y([g_0])>0$ and $\mathcal F^\alpha(g_0)\le (1-\alpha)8\pi^2\chi(M)$. It states two alternatives for the maximal flow. The first gives immortal bounded-curvature, noncollapsing evolution and a subsequence converging smoothly to a compact $\mathcal F^\alpha$-critical metric. The second gives finite- or infinite-time curvature blow-up and curvature-scale pointed smooth convergence to a complete, noncompact, nonflat, scalar-flat Bach-flat metric. The fixed-parameter audit must check the proof of both outcomes and the normalization, convergence maps, and estimates that support their use. The review checked the statement and the fit arithmetic. Its stronger proposed applications require new arguments. [Bour, Theorems 1.4 and 1.11](../../../../../references/SOURCE_NOTES_BOUR_ATTAINMENT_20261126.md) · [Claude review, F2](../../../../master/reviews/claude/EXTERNAL_PROGRAM_REVIEW_20261126.md#f2-the-extraction-problem-can-probably-be-replaced-by-a-fourth-order-flow-that-is-already-in-the-literature)

## Candidate first-flow estimate from the setup discussion

The proposed energy budget uses the Yamabe gauge at the start. It combines the round Yamabe upper bound on $F_R(g_0)$, monotonicity of $\mathcal F^\alpha$ on smooth time intervals, and the fixed-type inequality $e(g_t)\ge I$ once Yamabe positivity is retained. The target ceiling on every smooth slice is
\[
D(g_t)\le 4I+\frac{4(e_0-I)}{\alpha}\le 4I+4\alpha.
\]
The task is to verify the exact constants, the strict admissibility condition, and the Yamabe and chiral-energy bounds that justify using the infimum along the flow. The estimates should state where constants are uniform as $\alpha\downarrow0$ and where Bour's flow estimates have fixed-parameter hypotheses. The near-minimizing input concerns the first flow on $M$. The budget has discussion-level status pending assessment. [Input passages and normalization](../../../../../references/SOURCE_NOTES_BOUR_ATTAINMENT_20261126.md) · [Estimate task](../research-plan/PLAN.md#bfe-e02)

## Output to marked limits and attainment

For the compact branch, report the smooth convergence up to the diffeomorphisms furnished by the audit, the type and orientation, volume, sign of the Yamabe constant, bounds on $e,D,F_R$, and the critical equation in the limiting representative. For the singular branch, report the scale, time sequence, pointed embeddings, positive Yamabe or Sobolev input, and available lower-semicontinuity energy transfers for that model. Any stronger marking data remain a named input for the sibling. A uniform $D$ bound gives a budget to the sibling's proposed exclusion of multi-ended models after ALE and marked-end analysis. Passing the compact outputs through $\alpha\downarrow0$ requires separate uniform critical-metric compactness. [Marked limits and attainment](../../02_marked_limits_and_attainment/README.md)
