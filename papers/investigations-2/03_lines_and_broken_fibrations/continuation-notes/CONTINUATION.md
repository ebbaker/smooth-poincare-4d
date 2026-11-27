# Continuation — Lines and broken fibrations

27 November 2026, America/New_York. Prepared for Edward B. Baker III by Claude (Anthropic), model `claude-fable-5-2`, reasoning effort at the session's configured maximum, in a Cowork session. Setup baseline `b607bd1`. This is a dated snapshot: the [register](../research-progress/REGISTER.md) is the live status, and saving this note activates nothing. The shared conventions for sessions, including what a definite result is, are in the [series README](../../README.md#how-sessions-work-in-this-series).

## The assignment

The assignment is the question of this investigation, not the list of tasks in its [plan](../research-plan/PLAN.md): for a pole form with zeros, what do the pseudoholomorphic curves of the closed manifold $M\#\mathbb{CP}^2$ and the broken Lefschetz fibrations attached to the form say about removing its last zero circle?

## Status boundary

Set up on 27 November 2026. Nothing has been read in a primary source: the published theorems are known from abstracts, quotations and memory, and the statements about the invariants of $M\#\mathbb{CP}^2$ are expectations. No task is activated.

## Where the investigation ends

| Component | Definite when |
| --- | --- |
| L1. Which theorems on curves apply | Hypotheses table delivered |
| L2. The invariants of $M\#\mathbb{CP}^2$ | Stated from sources in each chamber, or the exact gap recorded |
| L3. The compactification | Construction replayed on the flat model |
| L4. The last circle | Perutz's statements recorded and the twisted conclusion checked |
| L5. The dictionary with fibrations and trisections | Table delivered |
| L6. The last-circle problem and a first attack | Decision sent to the second master |

The investigation rests when every component is definite. It is not at an end after a packet return, after the listed tasks, after a failed estimate or a B decision, or while a dependency is pending and other work can proceed.

## Routing table, 27 November 2026

| ID | Type | Recommendation and reason | Readiness and dependencies | Output |
| --- | --- | --- | --- | --- |
| SP4-LINE-E01 | E | Opus or Sol 6.2; a reading | Ready | Hypotheses table |
| SP4-LINE-E02 | E | Opus or Sol 6.2; a reading with sources to find | Ready | Note on the invariants |
| SP4-LINE-B01 | B | Fable or Astra; a construction with conventions to fix | Ready | Construction note |
| SP4-LINE-E03 | E | Opus or Sol 6.2; a reading | Ready | Statements note |
| SP4-LINE-E04 | E | Opus or Sol 6.2; a reading | Ready | Dictionary table |
| SP4-LINE-B02 | B | Lead; choice of attack | After E01 to E04 and B01 | Decision for gate 2 |
| SP4-LINE-B03 | B | Lead | Reserved | None until opened |

## Boundaries

A session launched from this note leads this investigation only. It does not decide gate 2. It uses no statement about curves or invariants in an argument until the corresponding reading has returned, and it does not edit the first series.

## Exact inputs

- The [proposing note](../../../master/brainstorm/notes/claude/ALTERNATIVE_FRAMEWORKS_AND_INVESTIGATIONS_2_20261127.md), SHA-256 prefix `091aa015355ef938`, section 3.6.
- The [source receipt](../../../../references/claude/SOURCE_NOTES_FRAMEWORKS_AND_PRISM_20261127.md), section 3, which lists what was read of each source and the pointers that have no bibliography record.
- The shared [bibliography](../../../../references/references.bib): `Taubes1999SelfDualHarmonic`, `Gerig2020Taming`, `Gerig2018SWGr`, `Perutz2006ZeroSets`, `Hayano2011GenusOne`, `BaykurSaeki2017Simplifying`, `GayKirby2007LefschetzType`, `Gromov1985PseudoHolomorphic`, `McDuffSalamon2012JHolomorphic`.

## Prompt

> You are the research lead of the investigation `03_lines_and_broken_fibrations` in the smooth-poincare-4d repository, `papers/investigations-2/03_lines_and_broken_fibrations`. Read `AGENTS.md`, `INVESTIGATION_SETUP_WORKFLOW.md`, `GPT_RESEARCH_MODEL_WORKFLOW.md`, `REFERENCE_WORKFLOW.md` and `papers/investigations-2/README.md` with its working rules and session conventions. Then read `papers/master-2/research-overview/OVERVIEW.md` for the frame and the conventions, and this investigation's README, overview, plan, register and `continuation-notes/CONTINUATION.md` with the exact inputs it lists. The author activates the task family `SP4-LINE`. Your assignment is the question in the continuation note, not the task list. Lead the B tasks yourself and issue E tasks as frozen requests to bounded helpers with disjoint outputs. Start LINE-E01, E02, E03 and E04 as parallel reading packets and take LINE-B01 yourself; decide LINE-B02 only when all five have returned. Read every published theorem in its primary source before you use it, and record what you inspected in the reference file and the shared bibliography. Label every statement as import, project theorem, certificate or heuristic, and call nothing established that Lean has not proved. Continue through ready dependencies until an end state of the continuation note or a question that blocks every remaining step. Edit only this investigation, send results for other branches as handoffs, record the model and effort you actually ran with, and do not commit.
