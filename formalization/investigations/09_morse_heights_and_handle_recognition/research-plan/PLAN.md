# Morse heights and handle recognition · Research plan

25 November 2026 (America/New_York). Prepared for Edward B. Baker III with OpenAI Codex assistance. The serving model and effort for preparation were unavailable. [Overall overview](../../research-overview/03_OVERVIEW.md) · [Program plan](../../research-plan/03_PLAN.md) · [Source revisions and pins](../../research-progress/03_BASELINE.md)

## Edition 04 · Native maps and smooth recognition of the marked trace

26 November 2026 (America/New_York). Plans and assignments at setup. [Edition 04 overview](../../research-overview/04_OVERVIEW.md) · [Program plan](../../research-plan/04_PLAN.md) · [Baseline and pins](../../research-progress/04_BASELINE.md)

| Task | Supplying geometry and proposed result | Acceptance on activation |
| --- | --- | --- |
| HT-B03 | Freeze one selected native edge and one supplied closed control. Identify the actual Morse levels, forward or reversed height, independent round ball, foot parities, protected residual tube germs, and the outgoing attachment. [E43 assessment](../../reviews/COLLAR_COMPARISON_AND_TERMINAL_CHARGE_20261126.md) | Distinguish the signed coordinate change on the actual outgoing overlap from equality with the chosen target marking. Check compatibility wherever an unchanged tube meets the open collar. |
| HT-E10a | Proposed `SmoothPoincare/Heights/NativeBallPatches.lean`, `exists_markedNativeBirthBlockPatch`. Construct an actual forward chart into the independently fixed ball on a native birth–block overlap of the retained rounded edge. [Buffered native overlaps](../../../SmoothPoincare/Heights/CompatibleBirthCollars.lean) · [E43 covering step](../../../SmoothPoincare/Heights/MarkedBallCoverageNative.lean) | Verify agreement on the whole open signed overlap and its inverse, with the recorded foot parity and every parameter of the affected framed tubes. Promote to the whole merger only after compatible forward patches cover the original lower and handle representatives. Carry the remaining attachments through this edge before repeating it. |
| HT-E10b | Proposed `SmoothPoincare/Heights/SmoothClosedMarkedControl.lean`, `exists_smoothMarkedControlAssembly`. On the supplied split control construct the rounded smooth lower absorption, then use the supplied framed slide and upper closure of its slid comparison. [Surgery `sec:control`](../../../../papers/investigations-1/05_collar_deformation_and_surgery/02_handle_isolation_and_marked_surgery/manuscript/recognition_from_marked_handle_cuts.tex) · [Existing closed control](../../../SmoothPoincare/Heights/ClosedMarkedControl.lean) | Check smooth forward and inverse maps on open seams. Preserve the full spectator tube, the dual tube and the two closed body representatives, with closing map $\gamma'=\gamma\partial F$ in the slid-to-split comparison. The intermediate spherical cut and the full outgoing $S^1\times S^2$ boundary serve different roles. A general selected height requires its own marked identification with a qualifying diagram. |
| HT-E11a | Proposed `SmoothPoincare/Heights/RelativeMiddleReduction.lean`, `markedThreeMiddle_to_oneSidedTwo`. On an actual reduced $(1,1,3,2,1)$ presentation, use a verified winding-one first prefix or an actual geometric belt intersection to cancel one adjacent pair. [Surgery `prop:peripheral` and `thm:three`](../../../../papers/investigations-1/05_collar_deformation_and_surgery/02_handle_isolation_and_marked_surgery/manuscript/recognition_from_marked_handle_cuts.tex) · [Boundary recognition from Route 10](../../10_positive_scalar_intermediate_cuts/research-plan/PLAN.md) | Return the two surviving framed tubes in the actual one-sided two-component presentation and its transported upper gluing and inverse. Residual tubes may move under the ambient comparison. A fixed protected tube needs support clearance or exact compatibility. Count the net decrease after every temporary stabilization. |
| HT-E11b | Proposed `SmoothPoincare/Heights/TransportedPrefixRecognition.lean`, `standardOf_transportedTwoPrefixTests`. Apply the second boundary certificate from [Route 10](../../10_positive_scalar_intermediate_cuts/research-plan/PLAN.md) to the actual one-component surgery of the transported link, or apply a verified one-sided recognition criterion on that link. | In the two-prefix case use the zero-framed $S^1\times S^2$ output on that prefix and the corresponding Property R and two-component unlink result. Compose every framed slide and outgoing comparison with the actual upper gluing to identify the original smooth type. A successful first prefix alone gives a strict decrease without identifying the resulting link. |

Route 10 owns the recognition of the marked intermediate three-manifold from PSC domination and its boundary topology. Route 09 owns its realization on an actual height, transport of the full framed embeddings and smooth recognition of the closed assembly. Route 08 supplies the induced energy and prescribed-direction input when available. An immersion count bound still needs the diagram of the chosen direction. [Route 08](../../08_hypersurface_immersion_bounds/research-plan/PLAN.md) · [Surgery results and controls](../../../../papers/investigations-1/05_collar_deformation_and_surgery/reviews/TWO_MIXED_CUTS_AND_CHARGED_DISK_20261126.md)

E10a supplies the native maps for `thm:ed03-target-ball-cover` using the signed collar of `thm:ed03-actual-collar-transition`. E10b extends `prop:ed03-closed-slide-control` to the smooth marked control. E11a and E11b provide the two smooth steps in `ed04:successor`. [Native collar and control blueprint](../../../blueprint/src/collar_comparison_and_terminal_charge.tex) · [Edition 04 blueprint](../../../blueprint/src/edition_four_marked_cuts.tex)

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
