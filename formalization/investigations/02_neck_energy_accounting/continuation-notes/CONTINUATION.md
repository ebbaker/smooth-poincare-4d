# Full neck energy accounting · Sustained continuation

**After FOT-E52 · 27 November 2026.** Apply the two-face signed estimate to a measured collar with both marked defect windows. [Current register](../research-progress/REGISTER.md) · [Program handoff](../../continuation-notes/AFTER_E52_MARKED_CUTS_AND_CLOSED_CAPS_20261127.md)

25 November 2026 (America/New_York). Prepared for Edward B. Baker III with OpenAI Codex assistance. The model settings below apply to the requested future session. The drafting model variant and effort are unavailable.

[Route overview](../research-overview/OVERVIEW.md) · [Proof plan and opening Lean type](../research-plan/PLAN.md#opening-proof) · [Live route register](../research-progress/REGISTER.md) · [Program ownership](../../research-progress/REGISTER.md#route-ownership) · [Input and toolchain baseline](../../research-progress/01_BASELINE.md)

## Current continuation

On Edition 07 activation, freeze the APS signature input and choose one original collar with both face markings before assigning FOT-NECK-ED07-E01. Check the two-face orientation, exact deficit and symmetry under exchange of chiralities. If the second end is undercontrolled, record the missing estimate on that face. [Edition 07 packet](../research-plan/PLAN.md#edition-07--signed-energy-on-an-actual-collar) · [Live status](../research-progress/REGISTER.md)

The opening proof and the covered-remainder theorem are verified. Use the [dated handoff and next geometric proof](AFTER_FINITE_ACCOUNTING_20261125.md). The launch prompt below is preserved as issued.

## Original launch prompt

Paste this block into a fresh Astra session with the repository selected.

~~~text
Work in /Users/ebbaker/Documents/smooth-poincare-4d. Use GPT-6.2 Astra
(gpt-6.2-astra) at ultra as lead. I activate sustained Lean formalization in
formalization/investigations/02_neck_energy_accounting/.

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

Begin with SP4-FORM-FOT-E01 if it is still open. Give a helper the exact
finite-family statement from the route plan. Test the empty family, zero-energy
pieces, and the example showing why the strict residual matters. Integrate
SectionsAndConnections.noPositiveBubbleOfFiniteAccounting through the existing
public library. The equality e = e₀ + Σ eⱼ is an input at this step.

Work toward deriving that equality in FOT-E17. A useful next Lean target is to
split a nonnegative energy measure over finitely many disjoint truncations and
their measurable complement, then bound the complement by strip estimates plus
the uncovered energy. Connect this lemma to the chiral Weyl measure as its
geometric prerequisites become available. Under FOT-B03 compare the supplied
annular-chart estimate (E14), the intrinsic transverse-field estimate (E15),
and the weighted spinor bound from Route 04. Take the sequence limsup at fixed
truncation, then exhaust. A slow outer radius chosen on an ALE end (E29) may
leave a gap to the next prescribed scale. Pursue component estimates E09–E13
alongside the remainder estimate. Make the strict residual and any uniform
gap available to Route 03, with their respective hypotheses.

If the three routes run together, act as parent integrator for shared B01/B05
decisions as needed, Lake targets, public imports and blueprint edits unless
an active parent lead already holds that role. Keep parent decisions in the
parent register. Check sibling handoffs, add the FirstOrderTwistor library
once when its first module is ready, and integrate against the current tree
with one writer per shared file.

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
| FOT-E01 · E | Sol 6.2/ultra for the finite arithmetic proof and an independent premise check. | Ready on activation. Return the public finite-accounting theorem, including the empty family. |
| FOT-B03 · B | Astra/ultra to decide how geometry enters the accounting argument. | Use parent B01 as it becomes available. Specify the component, annulus and compact-gauge inputs. |
| FOT-E14–E17 · E | Sol 6.2/ultra for fixed measure or annular lemmas. Astra integrates the geometric conclusion. | Freeze the relevant sublemma when its inputs are known. Derive an estimate for the entire residual. |

[SEC §12.4, component accounting](../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L4700) · [SEC §15, limits and bubble exclusion](../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L6507) · [Neck accounting note](../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/brainstorm/notes/NECK_GEOMETRY_AND_ENERGY_ACCOUNTING_20261125.md)
