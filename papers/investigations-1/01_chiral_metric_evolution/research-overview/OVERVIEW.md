# Research overview — Chiral curvature and metric evolution

Prepared for Edward B. Baker III with OpenAI Codex assistance. Established
21 November 2026; revised 22 November 2026 (America/New_York) to incorporate
the author's nonlinear-flow priority and real twistor coordinate proposal.
Actual selected model identifier and effort are unavailable. The selected
lead is the sole writer. Input versions, source checks and the scope of
this planning revision are in the [integration record](../reviews/RESEARCH_PLAN_INTEGRATION_20261122.md).
The [sole progress register](../research-progress/REGISTER.md) owns live status;
this overview does not activate scientific tasks or upgrade draft claims.

For sustained work, the author's
[broad continuation prompt](../continuation-notes/BROAD_RESEARCH_CONTINUATION_20261122.md)
grants the selected lead discretion to pursue new leads and alternatives,
revise the plan and continue through successive bounded Sol 6.2 assignments.
When invoked, that instruction controls research scope; the priorities
below are a starting map, with evidence requirements preserved.

## Objective and the program's distinctive approach

Study the smooth four-dimensional Poincaré conjecture through the nonlinear
evolution of definite chiral connections. The immediate priorities are the
foundation audit and understanding Fine's actual defect-gradient flow.
The central candidate method for obtaining additional control is a real
analogue of the earlier generalized isothermal coordinate and reconstruction
program, formulated on the complete sphere of chiral directions over each
base point.

The proposed contribution is quantitative comparison of direction-dependent
charts and transport, with nonintegrability retained. Its purpose is to
produce estimates that ordinary energy dissipation has not supplied:
definiteness preservation, compatibility and geometric control, and
eventually continuation and convergence. The real sphere-bundle construction
and Fine's flow are published starting points. Whether the earlier
coordinate method supplies useful new estimates in this setting is an
explicit research question, not an established advantage or novelty claim.

Keep the full conjecture as the motivating objective. Intermediate hypotheses
should emerge from the equations and estimates; previously classified
geometric cases remain useful tests. A new convergence theorem for this flow
can be valuable even when the manifold's diffeomorphism type is already
known. The [flow-priority decision](../brainstorm/notes/FLOW_FIRST_PRIORITY_20261122.md)
and [nonlinear-flow explanation](../brainstorm/explanations/NONLINEAR_FLOW_AND_SINGULARITIES_20261122.md)
give the analytical motivation.

## Fixed objects, conventions and quantifiers

Let M be a smooth closed connected oriented real four-manifold, with the
eventual target an arbitrary smooth homotopy four-sphere. Let E → M be an
oriented Euclidean rank-three bundle with a smooth SO(3) connection A.
Work in the positive curvature-plane region and fix the curvature-map
orientation sign matching the round model. On an unknown manifold, this
does not assume a path to an already known round connection. The signature
of the reconstructed metric is positive definite. Fix K > 0 and use
the manuscript's conventions
\[
 \mu_A=\frac13\sum_iF_i\wedge F_i,\qquad
 F_i\wedge F_j=Q_{ij}\mu_A,\qquad Q>0,\quad\operatorname{tr}Q=3,
\]
\[
 \Lambda^+_{\widehat g_A}=\operatorname{span}\{F_i\},\qquad
 dV_{\widehat g_A}=\frac{\mu_A}{2K^2},\qquad
 S=Q^{1/2},\quad \Sigma_A=-K^{-1}S^{-1}F_A.
\]
The forms Σ_A/√2 give the orthonormal identification of E with the
chosen self-dual bundle. With q = Q − I, the flow to be studied is
\[
 A_t=-4d_A^{*_{\widehat g_A}}
       \left[\left(q-\frac16|q|^2I\right)F_A\right],
 \qquad
 \mathcal P(A)=\int_M|q|^2\mu_A.
\]
This is the independent-connection flow in manuscript §6, with its fixed
time normalization. The fourth-order metric gradient of
g ↦ P(A_g⁺) is a different evolution.

Along a smooth solution on its interval of existence define
\[
 b=A-\Gamma_A^+,\qquad
 \mathcal T_A=d_A\Sigma_A=[b,\Sigma_A],\qquad
 W^+=W^+(\widehat g_A).
\]
These record compatibility with the chiral Levi–Civita connection and the
metric twistor integrability obstruction. Any analytic packet must specify
its gauge, regularity, norms, parameter range and dependence of constants;
no unspecified uniform bound is included in the starting data. Global
spinor trivializations and real analyticity are not assumed.

## Generalized isothermal coordinates on the real twistor sphere bundle

The real six-manifold Z = S(E) → M has S² ≅ CP¹ fibers. Fine–Panov
construct a closed two-form from A that is symplectic for definite A,
and a specified compatible almost complex structure J_FP(A). The
underlying smooth sphere bundle also identifies with the metric twistor
bundle of ĝ_A, carrying the Atiyah–Hitchin–Singer structure J_met(ĝ_A).
The connection construction and the metric construction can use different
direction labels and horizontal lifts. Fine–Panov explicitly warn that
their structures are not generally interchangeable. See
[Fine–Panov §2, Proposition 2.1, Definition 2.9 and Remark 2.10](https://arxiv.org/html/0802.3648v2).

Round S⁴ is the benchmark where, with matching chirality and fiber
orientation, the labels and horizontal transport agree. Away from it,
both the nonlinear direction relabelling and b must remain visible.
Changing direction labels also differentiates Q^{1/2} in base and time
directions; these terms cannot be omitted from a transport comparison.

For the metric twistor structure, integrability is equivalent to W⁺ = 0
in the manuscript's convention. This is the chirality-translated form of
[Atiyah–Hitchin–Singer, Theorem 4.1](https://doi.org/10.1098/rspa.1978.0143).
Consequently, exact identification of J_met with a flat integrable
twistor structure would impose a condition that the evolution is meant
to reach. The proposed real coordinate method must allow a nonzero
integrability defect. No identification of the Nijenhuis tensor of
J_FP with W⁺ alone is assumed.

### What the earlier manuscripts contribute

The [chiral descent manuscript](../../../initial-investigations/02_chiral_descent_and_double_copy/manuscript/chiral_connection_descent_and_double_copy.tex),
Proposition `prop:general-chart` near line 575, constructs first-jet charts
\[
 y^{A0'}=w^A-\zeta\partial_\zeta w^A,
 \qquad y^{A1'}=\partial_\zeta w^A.
\]
Its hypotheses include a holomorphic fibration over CP¹ and a complete
local family of holomorphic sections with normal bundle O(1) ⊕ O(1).
The [generalized isothermal manuscript](../../../initial-investigations/01_generalized_isothermal_coordinates/manuscript/generalized_isothermal_wave_metrics.tex),
Section `sec:bundle` near line 351, reconstructs transport from two-patch
data over complete fibers. Its descent lemma obtains degree-one
coefficients from global holomorphic sections of O(1), with the required
bundle triviality and holomorphic partial connection; flatness supplies
the ASD curvature conclusion.

These are a coordinate and reconstruction method under complex or
special real-slice hypotheses. Their direct extension to a smooth
Riemannian almost-twistor space is open. The proposed transfer retains
first-jet comparison and whole-fiber patching while measuring the errors
that exact holomorphic descent would suppress. In particular:

- Use two direction patches covering the complete sphere over each local
  base chart, then specify transitions between base charts. Do not assume
  Z is globally M × S², a global holomorphic map Z → CP¹, or one inverse
  coordinate map over an entire direction fiber.
- Specify the coefficient bundles, local spin lifts or equivalent
  projective formulation, reality conditions and fiberwise norms before
  using a degree-one projection. An individual complex sphere does not
  make its ambient almost-complex manifold integrable.
- Test recovery of the fiberwise holomorphic degree-one part of directional
  coefficients with a controlled remainder and overlap error. The
  decomposition and its gauge covariance must be constructed, not imported
  from the holomorphic descent theorem.
- Keep b, W⁺, scale and horizontal derivatives explicit. Inherited
  first-jet invertibility and holomorphic factorization do not by themselves
  establish a real chart theorem or a PDE estimate.

The [source record](../../../../references/SOURCE_NOTES_CME_REAL_TWISTOR_20261122.md)
states the inspected passages and retained hypotheses. This proposal
develops the current manuscript's §14 open coordinate problem.

### A concrete pointwise connection to quantitative definiteness

After fixing the curvature sign and the orthonormal identification, the
curvature ray changes direction by
\[
 \phi_x(u)=\frac{Q_x^{1/2}u}{|Q_x^{1/2}u|},\qquad u\in S^2.
\]
For the round metrics on the two direction spheres define
\[
 D_x=\sup_u
 \frac{\sigma_{\max}(d\phi_x|_{T_uS^2})}
      {\sigma_{\min}(d\phi_x|_{T_uS^2})}
 =\sqrt{\frac{\lambda_{\max}(Q_x)}{\lambda_{\min}(Q_x)}}.
\]
Thus a uniform D_x ≤ D_* implies
\[
 \lambda_{\min}(Q_x)\geq D_*^{-2},
\]
using tr Q = 3. The [algebraic check](../notes/03_direction_distortion_check_20261122.md)
defines the stretch ratio precisely and verifies this relation. It is
pointwise algebra, with no along-flow estimate. An analytical success
would bound distortion or a useful overlap error from chart equations
coupled to Fine's evolution **without assuming an equivalent eigenvalue
bound in advance**. Metric scale and horizontal regularity need separate
estimates even if this succeeds.

## Evidence and the gaps the method must address

| Input or proposed step | Evidence and missing extension |
| --- | --- |
| Definite reconstruction and Fine's short-time/local-stability theory | Published background; local convergence assumes strong closeness to a given perfect connection. It does not cover arbitrary definite data. See [existing source checks](../../../../references/SOURCE_NOTES_CME_SPECIAL_CASES_20261122.md). |
| Exact velocities, compatibility identities and round decay in the current manuscript | Inherited working derivations; the six-claim audit remains first. The Ricci-flow match is linear and TT, with time rescaling τ = 4t. |
| Earlier first-jet charts and whole-fiber reconstruction | Working-manuscript results with explicit holomorphic and bundle hypotheses; no automatic Riemannian extension. |
| Distortion/eigenvalue identity | Elementary pointwise verification for the specified sphere metrics; no dynamics, scale or derivative estimate. |
| Real two-patch chart and transport comparison | Proposed central candidate. A real chart theorem, controlled degree-one remainder and overlap laws are open. |
| Definiteness preservation | Seek noncircular distortion/overlap estimates coupled to the exact nonlinear flow. Energy finiteness is not a boundary barrier. |
| Geometric continuation and compactness | Also require scale, compatibility derivatives, metric curvature and noncollapse control modulo symmetries. A distortion bound alone is insufficient. |
| Perfect limiting connection | Need compactness, control of infinite-time degeneration and exclusion of unwanted stationary limits; small flow speed alone is insufficient. |
| Initial data on arbitrary homotopy spheres | A separate global existence problem. Coordinate patching might suggest a construction or identify an obstruction; it has not supplied a definite connection. |

The finite-density boundary example is a local curvature family, not a
singular flow trajectory. No new chart, preservation, continuation or
global convergence theorem is asserted by this overview.

## Conditional route to the full conjecture

The intended chain is: construct appropriate definite initial data on an
arbitrary smooth homotopy four-sphere; obtain nonlinear control, possibly
through the real coordinate/transport method; continue the flow with
compactness; and identify a perfect limit of the round-compatible sign.
The resulting metric would satisfy W⁺ = 0 and be Einstein. On a homotopy
sphere, the signature identity then gives W⁻ = 0, and the classical global
conformal argument yields the standard smooth sphere. The manuscript's
§13 supplies the endpoint argument, not its missing existence assumptions.

The coordinate approach is intended to work on the missing arrows in this
chain. Rephrasing eigenvalue control as bounded distortion, or ASD geometry
as exact holomorphic coordinates, is not enough. Each stage must produce
an estimate or construction from independently justified hypotheses.

## Reading and execution order

Begin with the [current manuscript](../manuscript/chiral_curvature_and_metric_evolution.tex)
and its [first](../notes/01_riemannian_s4_exploration_20261121.md) and
[second](../notes/02_riemannian_s4_metric_evolution_20261121.md) derivation notes.
Then read the coordinate passages and primary-source record linked above.
The [plan](../research-plan/PLAN.md) specifies the bounded B/E sequence;
the [register](../research-progress/REGISTER.md) supplies readiness and status.
E01 remains first, followed by B01/E02 for the actual nonlinear flow.
The real coordinate candidate is assessed through that conceptual process
and the subsequent round comparison, with later continuation and
initialization tasks gated by evidence.
