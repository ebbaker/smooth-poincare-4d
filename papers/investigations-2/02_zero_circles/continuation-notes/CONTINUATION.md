# Continuation — Zero circles

27 November 2026, America/New_York. Prepared for Edward B. Baker III by Claude (Anthropic), model `claude-fable-5-2`, reasoning effort at the session's configured maximum, in a Cowork session. Setup baseline `b607bd1`. This is a dated snapshot: the [register](../research-progress/REGISTER.md) is the live status, and saving this note activates nothing. The shared conventions for sessions, including what a definite result is, are in the [series README](../../README.md#how-sessions-work-in-this-series).

## The assignment

The assignment is the question of this investigation, not the list of tasks in its [plan](../research-plan/PLAN.md): where do pole forms vanish? In particular, does every positive conformal class on $S^4$ with chiral energy below $8\pi^2$ have a zero-free pole form at some point, and what is the structure of the set on which the pole triple degenerates?

## Status boundary

Set up on 27 November 2026. One explicit family with closed-form pole forms exists as a checked case. No implementation of the transform exists, no experiment has been designed or run, the local theory has not been read in its sources, and no task is activated.

## Where the investigation ends

| Component | Definite when |
| --- | --- |
| Z1. A validated computation of pole forms | Error table against the exact family delivered, or the method replaced |
| Z2. The gate experiment | Scope fixed, run, and its table delivered to the second master |
| Z3. Local normal forms and the kinds of zero circle | Source note delivered |
| Z4. The degeneracy set $H$ and the map $\kappa$ | A first lemma replayed, or reduced with an impasse note |
| Z5. Energy and zeros | Opened and made definite after gate 1, or declined by the lead with a reason |

The investigation rests when every component is definite. It is not at an end after a packet return, after the listed tasks, after a failed estimate or a B decision, or while a dependency is pending and other work can proceed.

## Routing table, 27 November 2026

| ID | Type | Recommendation and reason | Readiness and dependencies | Output |
| --- | --- | --- | --- | --- |
| SP4-ZERO-E01 | E | Opus or Sol 6.2; implementation against a known answer | Ready | Derivation, code, error table |
| SP4-ZERO-B01 | B | Fable or Astra; the standard of evidence is a judgement | Ready | Decision note |
| SP4-ZERO-E02 | E | Opus or Sol 6.2; bounded computation | After E01 and B01 | Table for gate 1 |
| SP4-ZERO-E03 | E | Opus or Sol 6.2; a reading | Ready | Source note |
| SP4-ZERO-B02 | B | Lead; structure theory | After E03 | Statements and first lemma |
| SP4-ZERO-B03 | B | Lead | Reserved | None until opened |
| SP4-ZERO-E04 | E | Opus or Sol 6.2 | Reserved | None until opened |

## Boundaries

A session launched from this note leads this investigation only. It does not decide gate 1, which belongs to the second master, and it does not edit the first master, whose recognition statement the bridge question concerns. Computations stay within the scope that ZERO-B01 fixes, and a numerical table is never described as a proof.

## Exact inputs

- The [proposing note](../../../master/brainstorm/notes/claude/ALTERNATIVE_FRAMEWORKS_AND_INVESTIGATIONS_2_20261127.md), SHA-256 prefix `091aa015355ef938`, sections 3.4 to 3.7.
- [check_06_pole_forms.py](../../../master/brainstorm/notes/claude/ALTERNATIVE_FRAMEWORKS_AND_INVESTIGATIONS_2_20261127_checks/check_06_pole_forms.py), prefix `50523f0bf3006aed`: the exact family and its energies.
- The [source receipt](../../../../references/claude/SOURCE_NOTES_FRAMEWORKS_AND_PRISM_20261127.md), section 3.
- The [first master's manuscript](../../../master/manuscript/chiral_weyl_energy_and_smooth_poincare.tex) for the energy conventions and the entry condition.

## Prompt

> You are the research lead of the investigation `02_zero_circles` in the smooth-poincare-4d repository, `papers/investigations-2/02_zero_circles`. Read `AGENTS.md`, `INVESTIGATION_SETUP_WORKFLOW.md`, `GPT_RESEARCH_MODEL_WORKFLOW.md`, `REFERENCE_WORKFLOW.md` and `papers/investigations-2/README.md` with its working rules and session conventions. Then read `papers/master-2/research-overview/OVERVIEW.md` for the frame and the conventions, and this investigation's README, overview, plan, register and `continuation-notes/CONTINUATION.md` with the exact inputs it lists. The author activates the task family `SP4-ZERO`. Your assignment is the question in the continuation note, not the task list. Lead the B tasks yourself and issue E tasks as frozen requests to bounded helpers with disjoint outputs. Start ZERO-E01 and ZERO-E03 as parallel packets and take ZERO-B01 yourself; issue ZERO-E02 only when both of its inputs exist; send its table to the second master without interpreting it beyond its scope. Read every published theorem in its primary source before you use it, and record what you inspected in the reference file and the shared bibliography. Label every statement as import, project theorem, certificate or heuristic, and call nothing established that Lean has not proved. Continue through ready dependencies until an end state of the continuation note or a question that blocks every remaining step. Edit only this investigation, send results for other branches as handoffs, record the model and effort you actually ran with, and do not commit.
