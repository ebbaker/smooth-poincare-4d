# Morse heights and handle recognition · Research plan

25 November 2026 (America/New_York). Prepared for Edward B. Baker III with OpenAI Codex assistance. The serving model and effort for preparation were unavailable. [Overall overview](../../research-overview/03_OVERVIEW.md) · [Program plan](../../research-plan/03_PLAN.md) · [Source revisions and pins](../../research-progress/03_BASELINE.md)

## First bounded proof

HT-E01 starts in `SmoothPoincare/Heights/Selection.lean` with `SmoothPoincare.prob_twoMiddle_gt_threeQuarters`. The opening result uses a genuine probability measure and a measurable integer count. Its geometric application will use normalized spherical measure.

~~~lean
import SmoothPoincare
open MeasureTheory

#check (∀ {Ω : Type*} [MeasurableSpace Ω] (μ : Measure Ω)
    [IsProbabilityMeasure μ] (m : Ω → ℕ),
  Measurable m → Integrable (fun u => (m u : ℝ)) μ →
  (∀ᵐ u ∂μ, 2 ≤ m u) →
  (∫ u, (m u : ℝ) ∂μ) < (9/4 : ℝ) →
  (3/4 : ℝ) < μ.real {u | m u = 2})
~~~

Integrate $m\ge2+\mathbf1_{\{m\ge3\}}$ almost everywhere. Identify the complement of $\{m=2\}$ up to the exceptional null set. Test the sharp boundary with mass $3/4$ at two and $1/4$ at three, where the mean is exactly $9/4$. [Source `thm:immersed-entry` following `eq:middle-weyl`](../../../../papers/master/manuscript/immersion_entry.tex) · [Blueprint `lem:routes-height-selection`](../../../blueprint/src/parallel_investigations.tex)

## Decisions and later proofs

Paths are relative to `formalization/SmoothPoincare/Heights/`.

| Task | Proposed output and source | Acceptance and reason to revisit |
| --- | --- | --- |
| HT-B01 | Fix the normalized direction measure, the regular-direction set and a measurable a.e. representative of the Morse count. | State the null exceptional set and integrability. A probability statement about a count needs a further construction to select a marked diagram. |
| HT-E01 | `Selection.lean`, `SmoothPoincare.prob_twoMiddle_gt_threeQuarters`. | Prove the general probability implication and instantiate it after HT-E02 and HT-E04 supply its geometric premises. |
| HT-E02 | `IndexedGauss.lean`, `SmoothPoincare.meanIndexTwo_eq_gaussMass`. Source `eq:middle-mass`, blueprint `lem:routes-indexed-mass`. | Use both preimages $n^{-1}(u)$ and $n^{-1}(-u)$ on the smooth domain, the Morse Hessian sign, multiplicity and area formula. Then combine the identity with Route 08's pointwise bound to obtain the mean estimate in the strict subcritical band. |
| HT-B02 | Specify Morse and handle data for the extremal reductions and the actual marked boundaries. | Preserve index-two counts, orientations and framed middle attachments. Record the precise one-handle-pair theorem needed from Gabai and the boundary extension theorem of Laudenbach–Poénaru. |
| HT-E04 | `MiddleCount.lean`, `SmoothPoincare.twoMiddle_le_of_nonstandard`. Source `thm:immersed-entry`, blueprint `prop:routes-middle-count`. | From an actual handle presentation with at most one middle handle, apply the reduction, the single-pair recognition and final disk gluing. The contrapositive gives the topological floor before using HT-E01 or the unresolved two-handle analysis. |
| HT-E03 | `MarkedCancellation.lean`, `SmoothPoincare.standardOfMixedGeometricCancellation`. Source SP4-IMM-HT-E01/E02 in the paper branch, blueprint `prop:routes-mixed-cancellation`. | Use the actual framed isotopy or justified slides, geometric single transverse intersection, and preservation of the remaining attachments. Then invoke the one-middle-handle result. If only an incidence matrix or two-component link is supplied, return the missing diagram-specific theorem to HT-B02. |

[Marked height diagrams](../../../../papers/investigations-1/04_hypersurface_immersions/02_two_handle_recognition/research-plan/PLAN.md) · [Energy input](../../08_hypersurface_immersion_bounds/research-plan/PLAN.md)

For acceptance, build the pinned package, check the new declaration and its axioms through `import SmoothPoincare`, compare its exact premises with the blueprint, and record the return in the [sole route register](../research-progress/REGISTER.md). [Formalization workflow](../../../FORMALIZATION_SETUP_WORKFLOW.md)
