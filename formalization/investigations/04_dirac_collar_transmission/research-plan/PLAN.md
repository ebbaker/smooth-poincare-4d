# Dirac transmission and chiral curvature · Research plan

25 November 2026 (America/New_York). Prepared for Edward B. Baker III with OpenAI Codex assistance. The serving model variant and reasoning effort are unavailable.

[Route overview and input versions](../research-overview/OVERVIEW.md) · [Route register](../research-progress/REGISTER.md) · [Overall overview 01](../../research-overview/01_OVERVIEW.md) · [Overall plan 01](../../research-plan/01_PLAN.md) · [Program register](../../research-progress/REGISTER.md) · [Verified baseline 01](../../research-progress/01_BASELINE.md)

## Opening proof

**SP4-FORM-SPIN-E01 · Summing differentiated errors on a finite cover.** For a finite set $J$, let $r$ denote the residual energy, $u$ the uncovered energy, $w_j$ a strip energy, $H_j$ its integrated squared differentiated defect and $c_j$ its positive spinor floor. The local geometric estimates will give $c_j^2w_j\le2H_j$. The opening proof composes these real inequalities with the cover bound $r\le u+\sum_{j\in J}w_j$. The proposed public declaration `FirstOrderTwistor.finiteCoverDefectBound` in `formalization/FirstOrderTwistor/SpinCoverBounds.lean` corresponds to proposed blueprint `lem:finite-cover-defect-bound`. For $J=\varnothing$ it must retain $r\le u$. FOT-E18 and the geometric cover argument must still provide the inputs. [MATCH-E05, weighted sum](../../../../papers/investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/01_dirac_collar_matching/notes/E05_NORMALIZATION_AND_RESIDUAL_20261125.md) · [DIR source identity](../../../../papers/investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/manuscript/dirac_twistor_and_yamabe_rigidity.tex#L292)

The following type elaborates with the pinned imports. Proof and public declaration are pending.

~~~lean
import Mathlib.Basic.Real.Basic
import Mathlib.Algebra.BigOperators.Group.Finset.Basic
open scoped BigOperators

variable {ι : Type*} [DecidableEq ι]
#check (∀ (J : Finset ι) (r u : ℝ) (w H c : ι → ℝ),
  (∀ j ∈ J, 0 < c j) →
  (∀ j ∈ J, (c j)^2 * w j ≤ 2 * H j) →
  r ≤ u + (∑ j ∈ J, w j) →
  r ≤ u + (∑ j ∈ J, 2 * H j / (c j)^2))
~~~

## Decisions and proof order

**FOT-B04** follows parent B01. Fix the half-spin bundle, twistor projection, Sobolev and trace norms, conformal transport, common normal, endpoint projectors and adjoint domain. Distinguish the original closed metric, a measured conformal representative and a metric obtained after surgery. Produce a dependency table of actual Lean declarations for the chosen first geometric packet. Return a varying projector, a different chirality or an unmeasured face to B04. Parent B05 owns the chart and collar conventions shared with Routes 02 and 03. [Spin curvature](../../../../papers/investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/manuscript/dirac_twistor_and_yamabe_rigidity.tex#L276) · [Bär, Bär–Gauduchon–Moroianu and Hijazi source records](../../../../references/SOURCE_NOTES_JOINT_COLLAR_20261125.md) · [Extraction register](../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/02_dirac_collar_extraction/research-progress/REGISTER.md) · [Matching register](../../../../papers/investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/01_dirac_collar_matching/research-progress/REGISTER.md)

1. **Curvature and exact recognition.** With parent E02–E03, derive E18–E20. E18 needs the projected derivative of $P_g\psi$. For E20 use the same spin manifold, $C^0$ and strong $W^{1,4}$ metric convergence to a smooth positive metric, and normalized $L^2$ fields. Check the shrinking or oscillatory cases in DIR §§3–4 when a proposed type omits a hypothesis.
2. **Model boundary problem.** E21 supplies the pole, E22 the round inverse, E23 the chart-to-strip estimate and E24 its fixed-projection perturbation. E23 consumes the buffered interpolation lemma from Route 02 E14. Keep constants uniform in strip length and physical scale. Varying slices require separate control of the tangential family and spectral projections. [Route 02 dependencies](../../02_neck_energy_accounting/research-plan/PLAN.md) · [Measured gauge](../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/02_dirac_collar_extraction/notes/E01_BUFFERED_SPIN_STRIP_20261125.md) · [Varying-slice theorem](../../../../papers/investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/01_dirac_collar_matching/notes/E03_VARYING_INVERSE_20261125.md)
3. **Actual traces.** In E30 keep both Cauchy graphs, the signs of their normal coordinates, the pole shifts and the contraction criterion. E31 also provides a closed-source correction using a positive Yamabe lower bound and measured neighborhoods of both seams. E32 bounds the critical mass of a regular correction. E33 obtains remote attenuation from a uniform strip inverse, and controls same-end reflection in the fixed reference perturbation. The estimate for a new glued metric must identify that metric. [Two-core matching](../../../../papers/investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/01_dirac_collar_matching/notes/E06_ACTUAL_CORE_GRAPHS_20261125.md) · [Two-seam correction](../../../../papers/investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/01_dirac_collar_matching/notes/E07_GLOBAL_JUMP_SOLVER_20261125.md) · [Weighted transmission](../../../../papers/investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/01_dirac_collar_matching/notes/E09_WEIGHTED_TRANSMISSION_20261125.md)
4. **Output for the parent.** For each actual residual, identify the region, fields, gauges, floors, differentiated estimates and uncovered energy. Use SPIN-E01 and E18, sum at fixed index and truncation, then take the sequence limsup and exhaustion. Supply Route 02 the resulting bound, or name the remaining term. The alternate E19/E20 route needs a global nontrivial field on $M$. E27 has its own scalar hypotheses. [Accounting consumer](../../02_neck_energy_accounting/research-progress/REGISTER.md) · [Parent premise audit](../../research-plan/01_PLAN.md#completion-and-revision)

## Geometric declarations

FOT abbreviates `SP4-FORM-FOT`. Each proposed module below lives under `formalization/FirstOrderTwistor/` and each short declaration name belongs to the `FirstOrderTwistor` namespace. Blueprint labels are proposed. The parent plan defines each target in full. [Program source-to-Lean map](../../research-plan/01_PLAN.md#geometric-proof-targets)

| Task | Manuscript or working note | Blueprint label | Proposed module and declaration | Test |
| --- | --- | --- | --- | --- |
| FOT-E18 | DIR `prop:weyl-defect`, `eq:weyl-defect` | `prop:projected-twistor-defect` | `SpinCurvature.lean` · `projectedTwistorDefect` | Verify the coefficient on the positive half-spin bundle. |
| FOT-E19 | DIR `prop:exact-recognition`, FOT `eq:twistor-spinor` | `prop:twistor-recognition` | `SpinRecognition.lean` · `sphereOfPositiveTwistorSpinor` | Permit zeros and require a non-identically-zero field. |
| FOT-E20 | DIR `sec:twistor-variation`, §3.3 | `prop:fixed-manifold-twistor-limit` | `SpinCompactness.lean` · `existsTwistorOfCompactGauge` | Preserve normalization in the supplied metric gauge. |
| FOT-E21 | DIR `prop:green`, `eq:green-jet` | `prop:green-pole-data` | `GreenSpinor.lean` · `greenEndAndCompactJet` | Fix the puncture, weights, invertible operator and pole source. |
| FOT-E22 | MATCH-E01, DIR §3.3 | `prop:round-incoming-inverse` | `CylinderDirac.lean` · `roundIncomingInverse` | Invert using both incoming projections on the unit round link. |
| FOT-E23 | SEC `msneck:interpolation`, EXTRACT-E01 | `lem:supplied-chart-spin-strip` | `SpinStrip.lean` · `firstOrderControlOfChart` | Use retained buffers in the conformally rescaled chart. |
| FOT-E24 | MATCH-E02, DIR §3.3 | `prop:perturbed-incoming-inverse` | `CylinderDirac.lean` · `inverseOfSlabSmallness` | Uniform inverse with fixed reference projectors. |
| FOT-E27 | DIR `thm:spectral`, `eq:point-gram` | `thm:five-mode-rigidity` | `YamabeSpectrum.lean` · `roundOfFiveModeEquality` | Count the five positive scalar Laplace eigenvalues with multiplicity. |
| FOT-E30 | MATCH-E04/E06, DIR `prop:green` | `prop:product-core-trace-graphs` | `CoreTraces.lean` · `matchExactProductCoreTraces` | With exact product germs, test the graph product times $e^{-3L}$. |
| FOT-E31 | MATCH-E07, DIR §3.1 | `thm:closed-jump-correction` | `CoreTraces.lean` · `closedJumpInverse` | Control all four measured face traces on the original source. |
| FOT-E32 | MATCH-E08, DIR §3.1 | `prop:critical-jump-mass` | `CoreTraces.lean` · `criticalNormOfRegularJump` | Use the closed $L^{8/5}\to L^{8/3}$ inverse for regular corrections. |
| FOT-E33 | MATCH-E09 §§1–4 | `prop:weighted-spin-transmission` | `CylinderDirac.lean` · `weightedTransmission` | Separate remote transmission, reflection and physical pole normalization. |

## Acceptance and handoff

Use the `FirstOrderTwistor` library in the shared Lake package on integration. The integrator for the first such packet adds the library to the default build and coordinates public imports with the other routes. A single lead can perform both roles. Freeze the theorem type, imports, exact input revisions, assigned files and failure test before issuing each packet. Build from `formalization/` with `lake build`, run `#check` and `#print axioms` through the public import, and compare the elaborated hypotheses with the cited source. Record the return under this route's `research-progress/handoffs/` and update its register. If the statement needs a stronger hypothesis or a missing geometric theorem, name it and reopen the owning B decision. The integrating lead checks for `sorryAx` and unreviewed project axioms and updates the shared blueprint's statement and proof marks separately upon acceptance. [Proof acceptance](../../../FORMALIZATION_SETUP_WORKFLOW.md#accept-proofs-in-the-pinned-lean-project) · [Shared blueprint](../../../blueprint/src/content.tex) · [Program integration](../../research-progress/REGISTER.md)
