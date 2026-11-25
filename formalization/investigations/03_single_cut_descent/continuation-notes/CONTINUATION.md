# Single spherical cut and descent · Sustained continuation

25 November 2026 (America/New_York). Prepared for Edward B. Baker III with OpenAI Codex assistance. The model settings below apply to the requested future session. The drafting model variant and effort are unavailable.

[Route overview](../research-overview/OVERVIEW.md) · [Proof plan and opening Lean type](../research-plan/PLAN.md#opening-proof) · [Live route register](../research-progress/REGISTER.md) · [Program ownership](../../research-progress/REGISTER.md#route-ownership) · [Input and toolchain baseline](../../research-progress/01_BASELINE.md)

## Current continuation

The opening assignments have been executed. Resume from the [marked descent handoff](AFTER_MARKED_DESCENT_20261125.md) and [live register](../research-progress/REGISTER.md).

## Original launch prompt

Paste this block into a fresh Astra session with the repository selected.

~~~text
Work in /Users/ebbaker/Documents/smooth-poincare-4d. Use GPT-6.2 Astra
(gpt-6.2-astra) at ultra as lead. I activate sustained Lean formalization in
formalization/investigations/03_single_cut_descent/.

Read AGENTS.md, GPT_RESEARCH_MODEL_WORKFLOW.md and
formalization/FORMALIZATION_SETUP_WORKFLOW.md. Read the route and Version 01
overviews, plans, registers and input baseline. Check the cited passages,
blueprint and Lean/Lake pins. Resume from the live register if work has
advanced, and reconcile revised paper statements with their recorded inputs.

You have broad authority to try alternative proofs or Lean encodings, consult
primary sources, add lemmas, and split, reorder or revise tasks without
routine approval. Record consequential choices as B decisions and preserve
issued IDs and evidence. Create gpt-6.2-sol helpers at ultra for bounded
proofs, API checks and independent reviews. Give each a fixed question,
pinned inputs, disjoint files and an acceptance test. Run independent work
in parallel and review each return yourself.

Start SP4-FORM-CUT-B01 and SP4-FORM-CUT-E01 together if they remain open.
Give a helper the exact CutMargin.lean proposition. Check that the exterior
margin stays strict at η = δ and examine what happens if the bubble cost
equals the threshold. As lead, follow the normal-coordinate ball in the
smooth compactification through the oriented full-core embedding. Specify
the boundary parametrization, the ball on each side, and the diffeomorphism
needed to transfer a conformal class to the original smooth manifold M.

Use those maps to drive FOT-E25, and pursue the cap estimates of E26 as their
inputs become available. Distinguish “at least one capped summand is standard”
from recognition of the specified exterior. Check the Yamabe sign and Weyl
energy on that capped exterior. For a smooth cap choose buffer length first,
fixed cut radius second, and sequence index last. Compare the C² Weyl/Yamabe
estimates with a first-order splice under the stated curvature budget. A Bach
cost has its own higher-regularity assumptions. If smooth gluing is the missing
library theorem, isolate the precise boundary-extension lemma and continue
with the cap estimates or a conditional reassembly theorem.

For E28, import the available Route 02 core and residual results. Track the
actual marked diffeomorphism M ≅ X̂ and the resulting bound for I⁺(M) on that
smooth type. The strict residual suffices at an exact minimum. A quantitative
near-minimizer exclusion also needs the uniform gap κ_δ. Keep E28 independent
of whole-neck energy equality. A positive-energy closed critical class can
survive a single decrease.

In parallel runs, send the module, public import and blueprint edits to the
shared integrator through your route handoff. Route 02 fills that role unless
a parent lead already does. Continue independent proofs during integration.
When running alone, you may integrate unclaimed shared changes yourself.

Continue beyond the opening lemma. If a dependency blocks one approach,
record exactly what is missing and pursue another ready step. Keep general
collar existence as a future research input. For acceptance, compare the
public type with its source, run lake build from formalization/, and run
#check and #print axioms through the public import. Require a proof free of
sorryAx and unreviewed project axioms. Rebuild a changed blueprint, marking
statements and proofs separately. Record requests, returns and actual prover
settings in research-progress/handoffs/ for this route. Update its register
and DRAFT_HISTORY.md and follow tools/CHAT_HISTORY.md. At a substantive
milestone or genuine session limit, leave a dated handoff naming the checked
declarations, remaining premises and next executable proof.
~~~

## Starting assignments on 25 November

The live register carries subsequent status. The lead can pursue independent steps while another packet is pending.

| Task and type | Lead or helper and rationale | Starting condition and output |
| --- | --- | --- |
| CUT-E01 · E | Sol 6.2/ultra for the exact scalar inequality and its endpoint test. | Ready on activation. Return the strict exterior-energy margin. |
| CUT-B01 · B | Astra/ultra to choose how the marked cut and attaching maps are represented. | Ready alongside CUT-E01. Specify the maps that identify the capped core and reconstruct the source. |
| FOT-E25/E26 → E28 · E | Sol 6.2/ultra for fixed gluing or cap estimates. Astra checks composition on the original smooth type. | Use parent recognition and Route 02 component results when available. Track the diffeomorphism and the energy it transports. |

[Marked smooth cut](../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/notes/E03_EMBEDDED_CUT_20261125.md) · [Two-cap estimates](../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/notes/E01_TWO_CAP_AUDIT_20261125.md) · [Same-type descent](../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/notes/E02_E05_SAME_TYPE_DESCENT_20261125.md)
