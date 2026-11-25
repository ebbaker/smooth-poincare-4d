# Continuation

25 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI Codex assistance. The serving model identifier and reasoning
effort for this setup are unavailable.

The first ready execution task at setup is
[SP4-FORM-SEC-E01](../research-plan/PLAN.md#sp4-form-sec-e01), the
three-axis Weyl estimate. Start from the
[pinned inputs](../research-overview/OVERVIEW.md#inputs-at-setup) and
check the [live register](../research-progress/REGISTER.md) before
taking it up. The [platform guidance](../../../FORMALIZATION_SETUP_WORKFLOW.md#platform-guidance)
applies to either a direct execution or a handoff.

The following is the original E01 launch prompt. Its completed proof and
verification commands are in the [register](../research-progress/REGISTER.md#e01-verification).

## Original launch prompt for Astra on ultra

```text
Work in /Users/ebbaker/Documents/smooth-poincare-4d with Astra on ultra as the
lead. Read AGENTS.md, formalization/FORMALIZATION_SETUP_WORKFLOW.md, and the
overview, plan, and live register in
formalization/investigations/01_sections_and_connections/. Verify the
manuscript and blueprint revisions, the Lean toolchain, and the Lake pins.

Activate SP4-FORM-SEC-E01. Formalize the exact three-axis Weyl estimate
from manuscript secjet:orthogonal and blueprint def:null-evaluations
and lem:three-axis-weyl. For a real symmetric trace-free 3 × 3 matrix W,
set ζᵢ = (nⱼ + i nₖ)/√2 for cyclic (i,j,k), where nᵢ are the orthonormal
coordinate vectors and i multiplying nₖ is the imaginary unit. Set
qᵢ = |⟨Wζᵢ, ζᵢ⟩| using the complex bilinear pairing. Prove both

  ∑ᵢ qᵢ² = (3/4) ∑ᵢ Wᵢᵢ² + ∑ᵢ<ⱼ Wᵢⱼ²  ≥  (1/2) ‖W‖HS²,

where ‖W‖HS² is the sum of the squares of all matrix entries. If you
use a component formula for the evaluation, prove its equivalence to
the normalized bilinear pairing.

I authorize sustained work on this theorem and its prerequisites. Try
different Lean representations, proof decompositions, and Mathlib
routes as needed. If one route stalls, diagnose it and try another.
Create or revise bounded B and E tasks within this scope without asking
for approval at each step. Record consequential choices as B decisions
and preserve task IDs, checked results, and useful failed attempts.

You may create gpt-6.2-sol helpers at ultra for bounded, independent
work such as checking pinned APIs, proving a component lemma, or
auditing the statement. Give each helper fixed inputs, a completion
test, and disjoint files or scratch space. As lead, review and integrate
returns and update the shared register and blueprint. Continue directly
if helpers are unavailable.

Integrate SectionsAndConnections.threeAxisWeylEstimate in
formalization/SectionsAndConnections/ThreeAxisWeyl.lean and import the
module from the library entry point. From formalization/, run lake build,
check the elaborated theorem type, and run #print axioms on the
declaration. Verify both conclusions and require a proof free of
sorryAx and unreviewed project axioms.

Record the declaration, source path, verification commands, and task
status in the live register. Link the verified declaration and mark
the supported statement and proof statuses in the blueprint, then
rebuild it.
Continue through useful in-scope routes until the integrated proof is
verified or a concrete blocker remains. If blocked, record the exact
remaining goal, the routes tested, and the next viable approach.
```
