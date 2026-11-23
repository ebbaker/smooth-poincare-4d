# Bach flow and chiral Weyl energy

23 November 2026 (America/New_York). Prepared for Edward B. Baker III with OpenAI Codex assistance. The selected model identifier and reasoning effort were unavailable. This note records the [founding discussion](../../../01_chiral_metric_evolution/chat-histories/0004_2026-11-23T15-56-24Z_summarize-chiral-evolution-research.json), with setup provenance in the [draft history](../../DRAFT_HISTORY.md) and passage checks in the [canonical source notes](../../../../../references/SOURCE_NOTES_BACH_FLOW_20261123.md).

## Evolve the metric toward the twistor integrability condition

Let $M$ be a closed smooth oriented homotopy four-sphere with any smooth Riemannian metric $g_0$. The natural almost complex structure on $S(\Lambda^+_g)$ is defined for every such metric. In the selected chirality, $W^+_g=0$ is its integrability condition. A metric satisfying that condition has $W^-_g=0$ as well, since the signature is zero. The conformal developing map then identifies $M$ with the standard smooth $S^4$. The geometric existence problem is to produce one such metric or to reach a weaker sphere-recognition condition. [Twistor background and recognition sources](../../../../../references/SOURCE_NOTES_BACH_FLOW_20261123.md#inherited-background-and-recognition)

The initial metric is always available. It defines the twistor sphere bundle and its Levi–Civita horizontal distribution from the start. In the companion investigation, the curvature-ray comparison and strain $T$ use a supplied definite connection and its reconstructed metric. Carrying that comparison over to the Bach flow would require a new estimate. Here the vanishing of $W^+$ itself is the proposed target for the generalized-isothermal direction. [Companion manuscript](../../../01_chiral_metric_evolution/manuscript/chiral_curvature_and_metric_evolution.tex)

## Modified Bach flow and energy

Let $E_\pm(g)=\int_M |W^\pm_g|_{\mathrm{op,HS}}^2\,dV_g$. The signature identity fixes $E_+-E_-=12\pi^2\tau(M)$ under all metric variations. The negative gradients of $E_+$ and $E_++E_-$ therefore differ by a positive constant. In the Bach normalization of Bahuaud, Guenther, Isenberg, and Mazzeo, the four-dimensional modified equation is

\[
\partial_t g=B_g+\frac{1}{12}(\Delta_g s_g)\,g ,
\qquad
\frac{d}{dt}E_+(g(t))=-c_B\int_M|B_g|^2\,dV_g,\quad c_B>0 .
\]

Here $s_g$ is scalar curvature and $\Delta_g=\operatorname{tr}_g\nabla^2$. The trace correction deals with the conformal degeneracy in the local existence argument and has zero pairing with the trace-free energy gradient. Short-time existence for smooth metrics on compact closed four-manifolds is available through Bahuaud–Helliwell's modified ambient obstruction equation. The round transverse-traceless Weyl Hessian in the companion manuscript provides a local benchmark. [Equation, existence, and dissipation sources](../../../../../references/SOURCE_NOTES_BACH_FLOW_20261123.md#r46--short-time-existence)

## A finite-time recognition target

On a homotopy sphere, $\chi(M)=2$ and $E_+=E_-$, so the four-index tensor integral is $\int_M|W|_{\mathrm{tensor}}^2\,dV_g=8E_+$. The Chang–Gursky–Yang theorem then recognizes $S^4$ at any smooth slice with

\[
Y(M,[g])>0,\qquad E_+(g)<4\pi^2 .
\]

Here $Y(M,[g])$ is the Yamabe constant of the conformal class. A larger strict energy bound preserves its sign while the solution is smooth. If $Y(M,[g_0])>0$ and $E_+(g_0)<8\pi^2$, consider a possible zero of the Yamabe constant along the flow. Its class would have a scalar-flat Yamabe representative $\widetilde g$. Gauss–Bonnet and conformal invariance of $E_+$ would give

\[
16\pi^2=2E_+(g)-\frac12\int_M|\operatorname{Ric}_0(\widetilde g)|^2\,dV_{\widetilde g}
\le 2E_+(g).
\]

Energy monotonicity excludes this. The first conformal-Laplacian eigenvalue varies continuously along the smooth metric path and has the same sign as the Yamabe constant, so the positive sign persists. The starting conditions $Y(M,[g_0])>0$ and $4\pi^2<E_+(g_0)<8\pi^2$ give a conditional range in which to ask whether the flow reaches $E_+<4\pi^2$. Obtaining initial data in that range on an arbitrary homotopy sphere is a separate existence question. [Sphere theorem and Gauss–Bonnet normalization](../../../../../references/SOURCE_NOTES_BACH_FLOW_20261123.md#inherited-background-and-recognition)

## Open choices

- A quantitative estimate for the energy drop could turn dissipation into a finite-time recognition argument. At present a critical metric is only known from the Euler–Lagrange equation to be Bach-flat. A general rigidity argument would have to exclude positive-energy limits in the relevant class.
- The extension criterion involves the full Riemann tensor. A blow-up approach needs geometric bounds that give a rescaled limit and a description of which limits are compatible with the energy budget. Lopez's compactness and singularity statements have specific curvature, injectivity, or Sobolev hypotheses.
- The round calculation is a test of the equation near its target. A separate question is whether energy and geometric control can get a trajectory into such a regime from broader initial data.

These are discussion questions for a later research session. [Continuation and compactness source](../../../../../references/SOURCE_NOTES_BACH_FLOW_20261123.md#r48--continuation-and-compactness)
