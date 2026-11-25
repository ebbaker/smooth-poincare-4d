# Dirac transmission and chiral curvature · Sustained continuation

25 November 2026 (America/New_York). Prepared for Edward B. Baker III with OpenAI Codex assistance. The model settings below apply to the requested future session. The drafting model variant and effort are unavailable.

[Route overview](../research-overview/OVERVIEW.md) · [Proof plan and opening Lean type](../research-plan/PLAN.md#opening-proof) · [Live route register](../research-progress/REGISTER.md) · [Program ownership](../../research-progress/REGISTER.md#route-ownership) · [Input and toolchain baseline](../../research-progress/01_BASELINE.md)

## Current continuation

The current handoff follows the [annular Bochner estimate and weak incoming inverse](AFTER_ANNULAR_BOCHNER_AND_WEAK_INVERSE_20261125.md). The [first integration](AFTER_WEIGHTED_COVER_20261125.md) records the weighted cover and local curvature identity. The original launch prompt follows.

## Launch prompt

Paste this block into a fresh Astra session with the repository selected.

~~~text
Work in /Users/ebbaker/Documents/smooth-poincare-4d. Use GPT-6.2 Astra
(gpt-6.2-astra) at ultra as lead. I activate sustained Lean formalization in
formalization/investigations/04_dirac_collar_transmission/.

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

Start SP4-FORM-SPIN-E01 if it is still open. Give a helper the exact
SpinCoverBounds.lean proposition. Allow a different positive floor cⱼ on
each strip and an empty cover. Then pursue the measurable-cover corollary
with overlaps, carrying the uncovered energy once. For E18 show how the
projected derivative of the twistor defect yields each strip bound on
positive half-spinors. Preserve the coefficient 2/cⱼ² and compare conformal
gauges on the physical regions before summing. Give Route 02 the strongest
checked estimate with its independent hypotheses.

Use FOT-B04 to fix the half-spin representation, the common normal,
incoming projections and conformal weights. While shared geometric types
are being settled, a bounded helper can check the round-cylinder spectral
estimate or the available Hilbert-space lemmas. Follow E22–E24 from the
unit round link to supplied first-order control. Route 02's buffered
interpolation lemma is an input to E23. Compare matching actual core graphs
with compatible product germs (E30) and solving two measured jumps on the
original positive-Yamabe closed source (E31). Track the metric, pole data,
interior spinor floor and differentiated defect in each theorem.

Use the critical mass or attenuation estimates (E32/E33) to test a proposed
uniform floor on long strips. If boundary inversion gives only first-order
control, identify the independent derivative estimate still required and
continue with local weighted bounds or E20/E19, attainment and recognition
in a compact gauge on the same manifold. The geometric conclusion should
say exactly which regions and fields its hypotheses cover.

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
| SPIN-E01 · E | Sol 6.2/ultra for the finite-cover inequality and an independent normalization check. | Ready on activation. Return a weighted bound that retains uncovered energy. |
| FOT-B04 · B | Astra/ultra to choose the spin, conformal and boundary conventions. | Use parent B01 for the shared geometry. Specify the projected curvature identity and a usable trace problem. |
| FOT-E18, E22–E24, E30–E33 · E | Sol 6.2/ultra for fixed spin or operator lemmas. Astra compares conclusions on the physical metric. | Freeze each target as its inputs become available. Return a checked residual bound or the exact missing field estimate. |

[DIR projected defect identity](../../../../papers/investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/manuscript/dirac_twistor_and_yamabe_rigidity.tex#L292) · [Weighted residual and uncovered energy](../../../../papers/investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/01_dirac_collar_matching/notes/E05_NORMALIZATION_AND_RESIDUAL_20261125.md) · [Jump correction on the original metric](../../../../papers/investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/01_dirac_collar_matching/notes/E07_GLOBAL_JUMP_SOLVER_20261125.md)
