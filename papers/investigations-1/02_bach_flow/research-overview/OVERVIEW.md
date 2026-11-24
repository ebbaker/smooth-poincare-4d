# Research overview — Bach flow and smooth sphere recognition

23 November 2026 (America/New_York). Prepared for Edward B. Baker III with
OpenAI Codex assistance. The selected lead model identifier and reasoning
effort were unavailable.

The inputs are the [approved outline](../chat-histories/0001_2026-11-23T20-58-56Z_outline-bach-flow-research-overview.json),
the [Bach-flow brainstorm](../brainstorm/notes/BACH_FLOW_IDEA_20261123.md)
and [introduction](../manuscript/bach_flow_and_smooth_poincare.tex) at
`dbf88c6`, and the companion's [23 November review checkpoint](../../01_chiral_metric_evolution/reviews/FINAL_REVIEW_CHECKPOINT_DISPOSITION_20261123.md)
at `5417865`. The [plan](../research-plan/PLAN.md) specifies the proposed
work. The [progress register](../research-progress/REGISTER.md) records
readiness and evidence.

## Shared objective and starting data

Let $M$ be a closed, connected, smooth, oriented homotopy four-sphere and
$g_0$ any smooth positive-definite Riemannian metric. Thus
$\pi_1(M)=0$, $\chi(M)=2$, and $\tau(M)=0$. We use the self-dual two-form
bundle $\Lambda_g^+$ for the positive chirality. The question is whether
evolution from a metric can produce a smooth slice whose conformal geometry
forces $M$ to be diffeomorphic to standard $S^4$.

The companion investigation evolves a supplied smooth $SO(3)$ connection
$A$ in the positive-plane, round-compatible definite component. Its
curvature determines the reconstructed metric $\widehat g$ and the
positive, trace-three curvature matrix $Q$. Fine's defect-gradient
flow seeks $Q=I$, which gives anti-self-dual Einstein geometry of positive
scalar curvature in this component. The companion's local theory,
round-basin stability, and conditional continuation all begin with
definite data. A smooth metric $g_0$ is available on every $M$ considered
here. Finding a conformal class with the bounds needed for recognition
remains a separate existence question. [Fine, definitions and flow theorems](../../../../references/SOURCE_NOTES_CME_SPECIAL_CASES_20261122.md) ·
[Companion overview](../../01_chiral_metric_evolution/research-overview/OVERVIEW.md)

## Generalized isothermal coordinates and real twistor geometry

The companion implemented a real horizontal comparison over the complete
direction sphere. With $S=Q^{1/2}$, the curvature ray sends $u$ to
$Su/|Su|$ and identifies $S(E)$ with the metric twistor sphere bundle of
$\widehat g$. The comparison of the $A$-horizontal and Levi–Civita lifts
has a rotational term and a symmetric trace-free strain $T$. Fiber
moments recover the strain. The comparison controls the connection
mismatch, and its differentiated form bounds a chiral curvature block
containing $W^+$, trace-free Ricci curvature, and a scalar curvature
error. For the smooth original connection flow, finiteness of
$\int_0^T\sup_M(|\nabla^A T|+|T|^2)\,dt$ at a finite endpoint suffices for
smooth continuation in the chosen component. Obtaining that bound from
general definite data remains open. [Real comparison](../../01_chiral_metric_evolution/research-overview/OVERVIEW.md#real-whole-fiber-comparison) ·
[Finite-budget continuation](../../01_chiral_metric_evolution/reviews/E138_E143_GENERAL_CONTINUATION_ASSESSMENT_20261122.md)

For every $g(t)$ there is a real sphere bundle $S(\Lambda^+_{g(t)})$ with
the Levi–Civita horizontal distribution and its natural almost complex
structure. In the chosen chirality Atiyah–Hitchin–Singer's Theorem 4.1
identifies $W^+=0$ as the integrability condition. This gives
generalized isothermal coordinates a role in choosing the target and
suggests a quantitative question about the metric twistor geometry
before integrability. Could a tensor or a real horizontal comparison
built from $g(t)$ help control distortion or curvature concentration?
The companion's $T$ depends on the curvature rays of its supplied
definite connection and on $\widehat g$. Its comparison uses the
degree-two vertical tangent line $\mathcal O(2)$ on each sphere.
The holomorphic $\mathcal O(1)$ first-jet construction serves as a round
calibration. [Chirality and source passages](../../../../references/SOURCE_NOTES_CME_REAL_TWISTOR_20261122.md) ·
[Companion coordinate assessment](../../01_chiral_metric_evolution/reviews/E03_COORDINATE_ASSESSMENT_20261122.md)

## Modified Bach equation and its round benchmark

Regard $W^\pm_g$ as endomorphisms of the Euclidean bundles
$\Lambda_g^\pm$. Define
\[
 E_\pm(g)=\int_M |W^\pm_g|_{\mathrm{op,HS}}^2\,dV_g,\qquad
 E_+(g)-E_-(g)=12\pi^2\tau(M).
\]
The norm is the Hilbert–Schmidt norm of the endomorphism. The full
four-index Weyl energy is
$\mathcal W=4(E_++E_-)=8E_+$ on $M$. Both chiral energies are conformally
invariant in dimension four. The signature formula fixes their difference
under every metric variation on the fixed oriented manifold.
[Signature and norm audit](../../../../references/README.md#activated-foundation-audit-22-november-2026) ·
[Chang–Gursky–Yang, Remarks 1–2](https://www.numdam.org/item/10.1007/s10240-003-0017-z.pdf#page=3)

Use the Bach normalization of Bahuaud–Guenther–Isenberg–Mazzeo,
equations (1.1)–(1.2). With scalar curvature $s_g$ and
$\Delta_g=\operatorname{tr}_g\nabla^2$, the fourth-order equation is
\[
 \partial_tg=B_g+\tfrac1{12}(\Delta_gs_g)g,\qquad g(0)=g_0.
\]
Bahuaud–Helliwell's Theorem C gives a smooth short-time solution from
every smooth Riemannian $g_0$ on the closed four-manifold. The scalar
correction handles conformal degeneracy in the modified equation. The
existence proof also uses a diffeomorphism adjustment. The Bach tensor
is trace-free, so the scalar term is orthogonal to the Weyl-energy gradient.
Along a smooth solution,
\[
 \frac{d}{dt}E_+(g(t))=-c_B\int_M |B_g|_g^2\,dV_g,\qquad c_B>0,
\]
where $c_B$ is fixed by the norm and clock conventions. The equation
preserves total volume on a closed manifold. The volume form evolves by
$\partial_t dV_g=(\Delta_gs_g/6)dV_g$. [Bahuaud–Helliwell, Theorem C](https://arxiv.org/html/1010.4287v1#S1) ·
[Bahuaud–Guenther–Isenberg–Mazzeo, Section 2.3](https://arxiv.org/html/2508.06633v1#S2.SS3)

At the round metric of sectional curvature $K>0$, the companion factors
the metric $E_+$ Hessian on transverse-traceless symmetric tensors as
$\tfrac18(L+2K)(L+4K)$, with $L=\nabla^*\nabla$. This is a local sign
and normalization benchmark for the metric flow. The published
quadratic-curvature identity gives an independent comparison after norm
conversion. The companion's nonlinear round-basin stability uses the
second-order connection equation and smallness relative to a supplied
round reference. [Companion manuscript, round metric Hessian](../../01_chiral_metric_evolution/manuscript/chiral_curvature_and_metric_evolution.tex) ·
[Gursky–Viaclovsky, Theorem 3.10](https://arxiv.org/html/1105.4648v2) ·
[Connection round stability assessment](../../01_chiral_metric_evolution/reviews/E49_E52_ROUND_STABILITY_ASSESSMENT_20261122.md)

## Two recognition targets

- **Twistor integrability.** If $W^+=0$, then $W^-=0$ by the signature
  identity and smoothness. The locally conformally flat structure of the
  simply connected $M$ develops into $S^4$. The developing map is a local
  diffeomorphism and compactness makes it a covering onto $S^4$, so it is
  a diffeomorphism. Existence of such a metric on an arbitrary smooth
  homotopy four-sphere is equivalent to the smooth classification
  question. A smooth nondegenerate limit on the same closed base would
  also suffice. [Signature and developing-map sources](../../../../references/SOURCE_NOTES_BACH_FLOW_20261123.md#inherited-background-and-recognition)
- **A finite-time sphere-theorem slice.** If $Y(M,[g])>0$ and
  $E_+(g)<4\pi^2$, then $\mathcal W(g)<16\pi^2\chi(M)$ in the four-index
  convention. Chang–Gursky–Yang's Theorem A recognizes $S^4$ or
  $\mathbb{RP}^4$, and simple connectivity selects $S^4$. Theorem B
  separately handles equality. Its exceptional alternatives
  $\mathbb{CP}^2$ and metrics covered by the product $S^3\times S^1$
  are incompatible with homotopy-sphere topology. The strict threshold
  is the proposed working target. [Theorem A and conventions, p. 107](https://www.numdam.org/item/10.1007/s10240-003-0017-z.pdf#page=3) ·
  [Theorem B, p. 108](https://www.numdam.org/item/10.1007/s10240-003-0017-z.pdf#page=4)

The companion selected one recognizable smooth slice using its connection
energy and strain estimates under a sufficient smooth interval, persistent
small pointwise $Q-I$, a common Sobolev constant, and small initial
$L^4$ strain. Its later explicit static strain criterion also implies the
same sphere theorem for supplied definite data. These results make one
recognizing time slice a natural objective for the new metric flow.
[Finite-time recognition assessment](../../01_chiral_metric_evolution/reviews/E30_E32_RECOGNITION_ASSESSMENT_20261122.md) ·
[Effective static recognition assessment](../../01_chiral_metric_evolution/reviews/E254_E255_EFFECTIVE_STATIC_ASSESSMENT_20261123.md)

## Conditional starting range and the first estimate

Suppose $Y(M,[g_0])>0$ and $4\pi^2<E_+(g_0)<8\pi^2$. For any smooth
time $t$ take a smooth Yamabe minimizer $\widetilde g$ in $[g(t)]$.
With $Y_t=Y(M,[g(t)])$ its constant scalar curvature satisfies
$\int_M s_{\widetilde g}^2\,dV_{\widetilde g}=Y_t^2$.
Chern–Gauss–Bonnet in that representative and conformal invariance give
\[
 16\pi^2=2E_+(g(t))
 -\tfrac12\int_M|\operatorname{Ric}_0(\widetilde g)|^2\,dV_{\widetilde g}
 +\tfrac1{24}Y_t^2.
\]
Consequently $Y_t^2\ge48(8\pi^2-E_+(g_0))>0$. The first eigenvalue of
$-6\Delta_{g(t)}+s_{g(t)}$ has the sign of $Y_t$, by pairing the
volume-one Yamabe equation with a positive first eigenfunction. This
eigenvalue varies continuously along the smooth metric path, so the
initially positive sign persists with the displayed uniform lower bound
for $Y_t^2$.
[Yamabe minimizers](../../../../references/SOURCE_NOTES_BACH_FLOW_20261123.md#r49--yamabe-minimizers) ·
[Gauss–Bonnet, eq. (0.4)](https://www.numdam.org/item/10.1007/s10240-003-0017-z.pdf#page=3)

The Yamabe lower bound controls the conformal Sobolev quotient, which
includes the scalar curvature term $\int_M s_{g(t)}u^2\,dV_{g(t)}$.
An estimate for that term in the evolving representatives would be a
separate step toward a uniform ordinary Sobolev bound. For recognition
we need enough accumulated Bach dissipation to spend the energy above
$4\pi^2$ while the solution stays smooth. The first proposed question
is whether a fixed time window in a specified volume-normalized
geometric class gives a uniform positive energy drop while its
energy stays in the band. The plan begins by choosing and testing the
geometric premises for this estimate. [First conceptual task](../research-plan/PLAN.md#sp4-bach-b01--specify-the-dissipation-question)

The companion's stationary perfection theorem at ratio at most $7/2$
and its quantitative estimates at strict margins illustrate two useful
steps. First identify a regime in which critical points can be controlled.
Then use the cumulative time spent with usable estimates to bound energy,
with the required late geometry stated explicitly. The Bach analogues
would concern Bach-flat conformal classes and the time integral of
$\|B_g\|_{L^2(g)}^2$. [Companion spectral and occupation results](../../01_chiral_metric_evolution/reviews/E220_E222_SHARP_APPLICATIONS_ASSESSMENT_20261123.md)

## Degeneration, compactness, and critical limits

- **Continuation and rescaling.** Lopez's Theorem 1.2 forces unbounded
  full curvature at a finite maximal smooth time on the compact base.
  Theorem 1.3 gives pointed compactness for complete solutions with
  uniform full curvature on the interval and a basepoint injectivity
  lower bound at one time. Theorem 1.4 uses a uniform Sobolev constant
  along the maximal flow and a sequence at running curvature maxima.
  With $\lambda_i=|\mathrm{Rm}(x_i,t_i)|\to\infty$, the four-dimensional
  rescaling is $\lambda_i g(t_i+\lambda_i^{-2}t)$. The resulting limit
  is complete, ancient, noncompact, nonflat, and Bach-flat in dimension
  four. Each geometric bound used to invoke these results needs its
  own justification. [Lopez, Theorems 1.2–1.4](https://arxiv.org/html/1506.01979v1#S1)
- **Limits and their topology.** Theorem 1.5 starts with a global
  compact flow and uniformly bounded full curvature. Its alternatives
  are collapse, a noncompact finite-volume pointed limit, or a compact
  limit diffeomorphic to $M$. In dimension four the smooth limit
  solutions in the latter two alternatives are Bach-flat. With $B=0$
  the solution can still evolve conformally by its scalar term. To
  use such a limit for recognition, determine what preserves the
  Yamabe and energy information and what rules out a compact limit
  at or above the working recognition threshold. Energy accounting
  for a rescaled limit involves its own geometry. [Lopez, Theorem 1.5](https://arxiv.org/html/1506.01979v1#S1)
- **What the prior compactness argument supplies.** The companion's
  fixed-base metric theorem gives strong $C^{1,1/4}$ and weak $W^{2,8}$
  compactness modulo smooth orientation-preserving diffeomorphisms for a sequence
  with uniform pointwise absolute Ricci and $W^+$ bounds, a positive
  total volume lower bound, and an upper diameter bound. Those
  hypotheses can be tested on Bach slices. Passage to a smooth
  Bach-flat limit would require a regularity or weak-limit argument
  for the fourth-order equation. The companion used a common positive
  time shift to obtain smooth critical accumulation in its own
  connection system. [Metric compactness assessment](../../01_chiral_metric_evolution/reviews/E168_E169_METRIC_COMPACTNESS_ASSESSMENT_20261122.md) ·
  [Critical accumulation assessment](../../01_chiral_metric_evolution/reviews/E179_E181_STATIONARY_ACCUMULATION_ASSESSMENT_20261122.md)
- **Tests for candidate estimates.** In the companion's static
  connection examples, small defect and squared speed, and even
  vanishing $L^4$ strain in the logarithmic family, coexist with
  definite pointwise distortion. Actual smooth original connection
  flows on standard $S^4$ cross every prescribed finite closed or
  strict ratio cap above one in short time. The separate near-round
  crossing family still converges to round. These examples motivate
  checking concentration and persistence for the actual metric equation
  before relying on a proposed Bach-flow estimate. [Concentration assessment](../../01_chiral_metric_evolution/reviews/E08_E13_CONTROL_ASSESSMENT_20261122.md) ·
  [Final cap-crossing checkpoint](../../01_chiral_metric_evolution/continuation-notes/CONTINUATION.md#scientific-checkpoint)

## Initial data on an arbitrary smooth homotopy sphere

The availability of a smooth $g_0$ gives short-time evolution and the
real metric twistor bundle on any $M$ in scope. For the finite-time
route we still need an independently justified class with $Y>0$ and
$E_+<8\pi^2$, or a way to reach one from broader data. Establishing
positive Yamabe type and imposing the Weyl-energy bound on that class
are separate obligations. Both quantities belong to the conformal
class, so a construction must address the choice or evolution of the
class itself. Data already below the recognition threshold would give a
static solution of the classification problem for that $M$. The
earlier investigation's open definite-data construction motivates
keeping this question visible alongside the conditional flow problem.
[Bach starting-data proposal](../brainstorm/notes/BACH_FLOW_IDEA_20261123.md) ·
[Companion initialization discussion](../../01_chiral_metric_evolution/brainstorm/notes/PAUSE_AND_BRAINSTORM_AGENDA_20261123.md)
