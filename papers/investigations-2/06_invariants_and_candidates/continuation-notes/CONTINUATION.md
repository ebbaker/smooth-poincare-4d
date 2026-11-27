# Continuation — Invariants and candidate spheres

27 November 2026, America/New_York. Prepared for Edward B. Baker III by Claude (Anthropic), model `claude-fable-5-2`, reasoning effort at the session's configured maximum, in a Cowork session. Setup baseline `b607bd1`. This is a dated snapshot: the [register](../research-progress/REGISTER.md) is the live status, and saving this note activates nothing. The shared conventions for sessions, including what a definite result is, are in the [series README](../../README.md#how-sessions-work-in-this-series).

## The assignment

The assignment is the question of this investigation, not the list of tasks in its [plan](../research-plan/PLAN.md): which field-theoretic invariants does a theorem exclude from distinguishing a homotopy four-sphere from $S^4$, and can an invariant that is not excluded be computed on a named candidate?

## Status boundary

Set up on 27 November 2026. Nothing has been read in a primary source, no candidate has a handle diagram, and no invariant has been computed on any sphere. No task is activated.

## Where the investigation ends

| Component | Definite when |
| --- | --- |
| I1. What is excluded, and by which theorem | Exact statements delivered for semisimple theories and for Gluck twists |
| I2. The reach of the lasagna invariants | Source note delivered |
| I3. A computation on a candidate | Issued with its bounds, or declined with reasons and a reopening condition |

The investigation rests when every component is definite, and reopens if gate 3 names new candidates. It is not at an end after a packet return, after the listed tasks, after a failed estimate or a B decision, or while a dependency is pending and other work can proceed.

## Routing table, 27 November 2026

| ID | Type | Recommendation and reason | Readiness and dependencies | Output |
| --- | --- | --- | --- | --- |
| SP4-INV-E01 | E | Opus or Sol 6.2; a reading | Ready | Statement note, ledger entry |
| SP4-INV-E02 | E | Opus or Sol 6.2; a reading | Ready | Statement note |
| SP4-INV-E03 | E | Opus or Sol 6.2; a reading | Ready | Source note |
| SP4-INV-B01 | B | Fable or Astra; feasibility and value of a computation | After E01 to E03 and CERT-E06 | Decision note |
| SP4-INV-B02 | B | Lead | Reserved | None until opened |

## Boundaries

A session launched from this note leads this investigation only. It attempts no computation before INV-B01. It reports a standard value as a standard value and never as evidence that a sphere is standard.

## Exact inputs

- The [proposing note](../../../master/brainstorm/notes/claude/ALTERNATIVE_FRAMEWORKS_AND_INVESTIGATIONS_2_20261127.md), SHA-256 prefix `091aa015355ef938`, section 6.
- The [source receipt](../../../../references/claude/SOURCE_NOTES_FRAMEWORKS_AND_PRISM_20261127.md), section 3, and the bibliography records `Reutter2023Semisimple`, `RenWillis2024Khovanov`, `FreedmanGompfMorrisonWalker2010`.
- The first master's [prism section](../../../master/manuscript/claude/even_prism_closing.tex) and the [presentation sources](../../../investigations-1/07_positive_subcritical_entry/notes/PRESENTATION_SOURCES.md) of investigation 07, for the two candidates.

## Prompt

> You are the research lead of the investigation `06_invariants_and_candidates` in the smooth-poincare-4d repository, `papers/investigations-2/06_invariants_and_candidates`. Read `AGENTS.md`, `INVESTIGATION_SETUP_WORKFLOW.md`, `GPT_RESEARCH_MODEL_WORKFLOW.md`, `REFERENCE_WORKFLOW.md` and `papers/investigations-2/README.md` with its working rules and session conventions. Then read `papers/master-2/research-overview/OVERVIEW.md` for the frame and the conventions, and this investigation's README, overview, plan, register and `continuation-notes/CONTINUATION.md` with the exact inputs it lists. The author activates the task family `SP4-INV`. Your assignment is the question in the continuation note, not the task list. Lead the B tasks yourself and issue E tasks as frozen requests to bounded helpers with disjoint outputs. Start INV-E01, E02 and E03 as parallel reading packets; decide INV-B01 only when they and the diagrams of 05 exist. Read every published theorem in its primary source before you use it, and record what you inspected in the reference file and the shared bibliography. Label every statement as import, project theorem, certificate or heuristic, and call nothing established that Lean has not proved. Continue through ready dependencies until an end state of the continuation note or a question that blocks every remaining step. Edit only this investigation, send results for other branches as handoffs, record the model and effort you actually ran with, and do not commit.
