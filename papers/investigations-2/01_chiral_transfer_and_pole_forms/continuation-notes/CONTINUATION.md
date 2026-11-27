# Continuation — Chiral transfer and pole forms

27 November 2026, America/New_York. Prepared for Edward B. Baker III by Claude (Anthropic), model `claude-fable-5-2`, reasoning effort at the session's configured maximum, in a Cowork session. Setup baseline `b607bd1`. This is a dated snapshot: the [register](../research-progress/REGISTER.md) is the live status, and saving this note activates nothing. The shared conventions for sessions, including what a definite result is, are in the [series README](../../README.md#how-sessions-work-in-this-series).

## The assignment

The assignment is the question of this investigation, not the list of tasks in its [plan](../research-plan/PLAN.md): do the pole forms exist on every conformal class of a homotopy four-sphere, with the stated leading term, and does a zero-free one identify the sphere with $S^4$?

## Status boundary

Set up on 27 November 2026. A1 and A2 exist as proof sketches in the [proposing note](../../../master/brainstorm/notes/claude/ALTERNATIVE_FRAMEWORKS_AND_INVESTIGATIONS_2_20261127.md); the pointwise identities and one explicit family are verified by script. No proof is written in full, no primary source of the analysis or of the symplectic import has been read, and no task is activated.

## Where the investigation ends

| Component | Definite when |
| --- | --- |
| P1. A1: existence, dimension and leading term | Replayed, or refuted with the failing step |
| P2. A2: recognition from a zero-free form | Replayed with the import read in its source, or refuted |
| P3. The kernel and its normalization | Fixed and recorded in the second master's conventions |
| P4. Pointwise algebra and the family $c_\varepsilon$ | Statements file handed to 05 |
| P5. Identification with near-symplectic forms | Replayed, or reduced to the weaker statement that holds |
| P6. Openness and dependence on the data | Replayed, or reduced with an impasse note |
| P7. Comparison with the drafts M2 and M3 | Table delivered |

The investigation rests when every component is definite. It closes early, with a closing note to the second master, if A1 or A2 is refuted. It is not at an end after a packet return, after the listed tasks, after a failed estimate or a B decision, or while a dependency is pending and other work can proceed.

## Routing table, 27 November 2026

| ID | Type | Recommendation and reason | Readiness and dependencies | Output |
| --- | --- | --- | --- | --- |
| SP4-POLE-E01 | E | Opus or Sol 6.2; fixed method, weighted Fredholm theory | Ready | Proof note and list of imports |
| SP4-POLE-E02 | E | Opus or Sol 6.2; fixed method, one import | Ready | Proof note |
| SP4-POLE-E03 | E | Opus or Sol 6.2; exact algebra | Ready | Statements file, handoff to 05 |
| SP4-POLE-B01 | B | Fable or Astra; a normalization the whole series will use | Ready | Decision note, handoff to the second master |
| SP4-POLE-E04 | E | Opus or Sol 6.2 | After E01 | Proof note |
| SP4-POLE-B02 | B | Lead; choice of topology | After E01 | Statement with proof or impasse note |
| SP4-POLE-E05 | E | Opus or Sol 6.2; a reading | Ready | Comparison table |
| SP4-POLE-B03 | B | Lead | Reserved | None until opened |

## Boundaries

A session launched from this note leads this investigation only. It does not edit the manuscript of the second master, the initial investigations or the author's drafts, and it writes no Lean. The reader who replays a proof is not the helper that wrote it.

## Exact inputs

- The [proposing note](../../../master/brainstorm/notes/claude/ALTERNATIVE_FRAMEWORKS_AND_INVESTIGATIONS_2_20261127.md), SHA-256 prefix `091aa015355ef938`, sections 3.1 to 3.5 and 8.
- [check_06_pole_forms.py](../../../master/brainstorm/notes/claude/ALTERNATIVE_FRAMEWORKS_AND_INVESTIGATIONS_2_20261127_checks/check_06_pole_forms.py), prefix `50523f0bf3006aed`, and its recorded [output](../../../master/brainstorm/notes/claude/ALTERNATIVE_FRAMEWORKS_AND_INVESTIGATIONS_2_20261127_checks/output.txt).
- The [source receipt](../../../../references/claude/SOURCE_NOTES_FRAMEWORKS_AND_PRISM_20261127.md), section 3, for what was and was not read.
- The [obstruction note](../../../initial-investigations/01_generalized_isothermal_coordinates/notes/RESEARCH_OBSTRUCTIONS_2026-11-20.md) and the [20 November summary](../../../research-overview/PROJECT_SUMMARY_2026-11-20.md).
- The author's drafts [M2](../../../../references/unfinished_notes/Curved_morphisms.pdf) and [M3](../../../../references/unfinished_notes/Generalized_Isothermal.pdf), for POLE-E05 only.

## Prompt

> You are the research lead of the investigation `01_chiral_transfer_and_pole_forms` in the smooth-poincare-4d repository, `papers/investigations-2/01_chiral_transfer_and_pole_forms`. Read `AGENTS.md`, `INVESTIGATION_SETUP_WORKFLOW.md`, `GPT_RESEARCH_MODEL_WORKFLOW.md`, `REFERENCE_WORKFLOW.md` and `papers/investigations-2/README.md` with its working rules and session conventions. Then read `papers/master-2/research-overview/OVERVIEW.md` for the frame and the conventions, and this investigation's README, overview, plan, register and `continuation-notes/CONTINUATION.md` with the exact inputs it lists. The author activates the task family `SP4-POLE`. Your assignment is the question in the continuation note, not the task list. Lead the B tasks yourself and issue E tasks as frozen requests to bounded helpers with disjoint outputs. Start POLE-E01, POLE-E02, POLE-E03 and POLE-E05 as parallel packets and take POLE-B01 yourself; have each proof replayed by a reader that did not write it; report a failure of A1 or A2 to the second master at once. Read every published theorem in its primary source before you use it, and record what you inspected in the reference file and the shared bibliography. Label every statement as import, project theorem, certificate or heuristic, and call nothing established that Lean has not proved. Continue through ready dependencies until an end state of the continuation note or a question that blocks every remaining step. Edit only this investigation, send results for other branches as handoffs, record the model and effort you actually ran with, and do not commit.
