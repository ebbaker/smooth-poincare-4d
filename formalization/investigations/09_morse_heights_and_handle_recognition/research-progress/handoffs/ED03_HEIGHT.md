# SP4-FORM-HT-E01 · Probability and same-direction selection

25 November 2026 (UTC). Prepared for Edward B. Baker III with OpenAI Codex
assistance. Bounded E packet with a fixed probability model and acceptance
test. The actual serving model and reasoning effort were unavailable.
[Route plan](../../research-plan/PLAN.md) · [Lean module](../../../../SmoothPoincare/Heights/Selection.lean)

`SmoothPoincare.prob_twoMiddle_gt_threeQuarters` proves the statement issued
in the plan. For a measurable natural-valued count with almost-sure floor
two, integrating two plus the indicator of the complement of `{m = 2}`
gives the more general bound
\[
  \Pr(m=2)\ge 3-\mathbb E[m].
\]
Integrability and normalization of the probability measure are explicit.
`twoMiddle_probability_boundary` constructs a Bernoulli measure on the
natural numbers with masses \(3/4\) and \(1/4\) at two and three, respectively.
Its mean is \(9/4\), and \(\Pr(m=2)=3/4\). The strict probability assertion
fails at that endpoint.

`prob_regular_twoMiddle_eq` preserves the mass of `{m = 2}` on any supplied
conull regular set. `exists_regular_twoMiddle_with_data` selects a direction
in that intersection. Its data family is indexed by the direction, and
availability of the data for regular two-count directions is a hypothesis.
For a geometric application, take the normalized round probability of the
direction sphere and use the count of critical points of the same height
whose framed attachments are supplied. E36's transport through the two end
reductions describes the role of those attachments. A framed slide or a
geometric single intersection is separate diagram-specific input.
[Marked height source](../../../../../papers/master/notes/E36_MARKED_HEIGHT.md)

The scalar corollary `prob_twoMiddle_lower_of_defect_budget` retains the
full outside-middle mass and the integrated middle Weyl deficit in the
source's excess budget. With \(\omega=8\pi^2/3\), its scale is \(4\omega/3\)
and the total excess is \(E_+-(8/3)\omega\). The quotient uses only the excess
left after both costs. This is an implication from the supplied budget.
[Immersion source](../../../../../papers/master/manuscript/immersion_entry.tex#L114)

The geometric specialization needs the indexed Gauss area identity with
both normal signs and the smooth topological floor for the same height
function. HT-E01 establishes the probability and selection layer, with
those geometric premises supplied separately. Recognizing the smooth type
requires additional geometric information about a selected diagram.
[Route plan](../../research-plan/PLAN.md) · [One-middle-handle source](../../../../../papers/master/reviews/E33_INDEX_TWO_HANDLES.md#the-one-middle-handle-consequence)

## Inputs and verification

- Intake Git base `a1a8b8866fafd24cc11236b426fcd67d7cdfee2b`. The shared
  checkout advanced to `9c579f0126ceb8e9a3b2d9b2fcc935b5743b2ad7` during
  the packet. That commit contains an intermediate draft of this proof.
  Verification applies to the corrected working source.
- Route plan SHA-256 `907c230ca31ce26a4405ad19fe57b737f327cf25c43a84cbbb91ef2d74468d7e`.
  The route plan uses immersion revision `512ef85cfa696497` for the count
  statement. The requested working revision `4f56dfe589d3525e` is identified
  in E48, and the lead approved the available `74a1bbdbbf92e53a` revision as
  the budget input after checking the excess decomposition. E36 SHA-256
  `33bcac0c687b219107002d80c6e722ce1bc64d1d7b7fe1efe2a09ec795c711e5`.
  [E48 source record](../../../../../papers/master/reviews/E48_INTEGRATED_MARKED_TESTS.md#inputs-and-checks)
- Lean `4.35.0-rc3` at `470d5ce1400764999581fd26d5d72b00d990b0f4`, Lake
  `5.0.0-src+470d5ce`. All ten installed dependency revisions matched the
  unchanged manifest SHA-256 `839111aae86b693524cd57db5ce7f2e8edc972dad49296468eb18d6735e52239`.
  Mathlib `c55e6e786f49471c72fbddbec5415808896aec1e` supplies the Bernoulli
  probability law and the real-integral and finite-measure identities used.
- The corrected module passed `lake build +SmoothPoincare.Heights.Selection`
  using the pinned package. A separate importing file checked the exact
  issued signature. All six declarations report only `propext`,
  `Classical.choice` and `Quot.sound`. The shared import and package-wide
  check are the lead's integration step.
