# Hypersurface immersion bounds · Research plan

25 November 2026 (America/New_York). Prepared for Edward B. Baker III with OpenAI Codex assistance. The serving model and effort for preparation were unavailable. [Overall overview](../../research-overview/03_OVERVIEW.md) · [Program plan](../../research-plan/03_PLAN.md) · [Source revisions and pins](../../research-progress/03_BASELINE.md)

## Edition 04 · Energy of a whole immersion and the selected height

26 November 2026 (America/New_York). Plans and assignments at setup. [Edition 04 overview](../../research-overview/04_OVERVIEW.md) · [Program plan](../../research-plan/04_PLAN.md) · [Baseline and pins](../../research-progress/04_BASELINE.md)

| Task | Supplying geometry and proposed result | Acceptance on activation |
| --- | --- | --- |
| IMM-B02, carried | Freeze one actual smooth immersion of the chosen closed oriented homotopy four-sphere into $\mathbb R^5$, or a marked immersed assembly with rank-four maps and compatible jets at both faces. [Immersed handle construction](../../../../papers/investigations-1/04_hypersurface_immersions/01_immersed_handle_constructions/manuscript/marked_immersed_handle_constructions.tex) | Identify the induced metric and the exact core, collars, and retained exterior. Local handle models with conditional faces leave the whole immersion premise open. |
| IMM-E02, carried | Account for the induced chiral energy on the whole supplying immersion. Use the actual global Gauss data and signed norm conventions with [Route 09](../../09_morse_heights_and_handle_recognition/research-plan/PLAN.md). [Master `thm:immersed-entry`](../../../../papers/master/manuscript/immersion_entry.tex) | Report separately the paper's inclusive direct recognition bound $E_+\le64\pi^2/9$ and the strict $E_+<8\pi^2$ count bound. State the status of the smooth zero/one-middle floor used in the direct recognition implication and in the probability estimate on a hypothetical nonstandard type. Those immersion tests require no Yamabe sign. Any use for intrinsic entry requires a positive class on the same type. |
| IMM-E03 | Proposed `SmoothPoincare/Immersions/MarkedHeightEnergy.lean`, `exists_markedHeight_of_inducedEnergy`. Reuse the public selection theorem and specialize its data to a supplied native marked handle band on the selected height. [Public count and selection](../../../SmoothPoincare/Heights/OrientedHeightSelection.lean) | Keep the geometry on that very height, including any comparison to an auxiliary ordering. On a hypothetical nonstandard type the strict bound gives probability above $3/4$ for exactly two middle points under the topological floor. A favorable actual mixed or one-sided diagram is additional evidence. Route 09 owns the smooth marked reassembly. |

The global budget in B02/E02 supplies the immersion input to `prop:master-immersion`. E03 supplies the chart and trace data for the selected direction in `cor:routes-subcritical-heights`. [Direct immersion blueprint](../../../blueprint/src/master_variational.tex) · [Height selection blueprint](../../../blueprint/src/parallel_investigations.tex)

## First bounded proof

FOT-E36 begins with `SmoothPoincare.middleSignatureWeylBound` in `SmoothPoincare/Immersions/PrincipalCurvatures.lean`. The spectrum is $(-a,-b,c,d)$ with all four parameters positive. The factor $1/12$ is for the norm of a single Weyl endomorphism.

~~~lean
import SmoothPoincare

#check (∀ a b c d : ℝ, 0 < a → 0 < b → 0 < c → 0 < d →
  let s₁ := a*b + c*d
  let s₂ := -(a*c + b*d)
  let s₃ := -(a*d + b*c)
  let w := ((s₁-s₂)^2 + (s₁-s₃)^2 + (s₂-s₃)^2) / 12
  let t := (8/3 : ℝ) * (a*b*c*d)
  t ≤ w ∧ (w = t ↔ a = b ∧ b = c ∧ c = d))
~~~

Prove both inequalities between the positive and the two negative pair sums needed for the lower bound, then identify when all losses vanish. Test $a=b=c=d$ and an unequal positive quadruple. Handle conjugation to a principal frame when specializing to the actual shape operator. [Source `eq:middle-weyl`](../../../../papers/master/manuscript/immersion_entry.tex) · [Blueprint `lem:routes-middle-weyl`](../../../blueprint/src/parallel_investigations.tex)

## Decisions and later proofs

| Task | Proposed output and source | Acceptance and reason to revisit |
| --- | --- | --- |
| IMM-B01 | Fix the principal-frame parametrization, orientation, both chiral Hilbert–Schmidt norms and the direction of integration. | Confirm equality conditions and the effect of reversing the unit normal. Share the middle-signature conventions with Route 09. |
| FOT-E36 | Two results in `Immersions/PrincipalCurvatures.lean`, `SmoothPoincare.middleSignatureWeylBound` and `SmoothPoincare.shapeDeficitBound`. Sources `eq:middle-weyl` and `eq:shape-deficit`. Blueprint `lem:routes-middle-weyl` and `lem:routes-shape-deficit`. | For the negative-determinant estimate prove the coefficient $8/9$ for the positive part, including nonnegative determinant and the sharp $(-1,3,3,3)$ example. Preserve the historical ID on this moved task. |
| IMM-E01 | `Immersions/InducedRecognition.lean`, `SmoothPoincare.standardOfInducedWeylBound`. Source `thm:immersed-entry`, blueprint `prop:master-immersion`. | Identify the induced blocks by Gauss, obtain strict integrated excess by excluding open saturation using Codazzi, and import Route 09's indexed mass and lower height count. Test equality at $64\pi^2/9$. Distinguish the induced conformal class from a general positive class. |
| IMM-B02 | Decide which marked index-two immersion and exterior data the construction branch can actually supply. | Specify framed face maps, compatible jets, rank four, disjoint integration regions and the metric through both joins. If the exterior depends on different face data, return the compatibility question to the construction branch. |
| IMM-E02 | `Immersions/MarkedHandleEnergy.lean`, `SmoothPoincare.inducedEnergyOfMarkedAssembly`. Source construction plan HDL-E01/E02, blueprint `problem:routes-coverage`. | For a specified smooth assembly, account for the handle core, each collar and the rest of the same smooth source. Compare its total with the inclusive direct threshold and the strict height threshold. Establish Yamabe sign if the output is used for intrinsic entry. |

Output paths are under `formalization/SmoothPoincare/`. The edition 02 name for the proposed deficit declaration was provisional. The intended public domain for both algebraic results is now recorded above. [Source handles](../../../../papers/investigations-1/04_hypersurface_immersions/01_immersed_handle_constructions/research-plan/PLAN.md) · [Route 09 inputs](../../09_morse_heights_and_handle_recognition/research-plan/PLAN.md)

For acceptance, build the pinned package, check the new declaration and its axioms through `import SmoothPoincare`, compare its exact premises with the blueprint, and record the return in the [sole route register](../research-progress/REGISTER.md). [Formalization workflow](../../../FORMALIZATION_SETUP_WORKFLOW.md)
