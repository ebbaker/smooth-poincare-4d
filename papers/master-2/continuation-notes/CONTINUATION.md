# Continuation — second master

27 November 2026, America/New_York. Prepared for Edward B. Baker III by Claude (Anthropic), model `claude-fable-5-2`, reasoning effort at the session's configured maximum, in a Cowork session. Setup baseline `b607bd1`. This is a dated snapshot: the [register](../research-progress/REGISTER.md) is the live status, and saving this note activates nothing. The shared conventions for sessions are in the [series README](../../investigations-2/README.md#how-sessions-work-in-this-series).

## The assignment

Keep the frame of the second series true to what its investigations return: the manuscript, the statements A1, A2 and Z of the [overview](../research-overview/OVERVIEW.md), and the three gate decisions. The assignment is that question, not the six rows of the [plan](../research-plan/PLAN.md).

## Status boundary

Set up on 27 November 2026. The manuscript draft holds an abstract, an introduction and a provenance paragraph. A1 and A2 are proof sketches of one session and have not been read by anyone else. Z is open and is equivalent to the conjecture. No task is activated in this branch or in any child. No Lean edition exists for the second master.

## Where this branch ends

| Component | Definite when |
| --- | --- |
| M1. The manuscript states only what its sources support | SP4-M2-E01 has returned and every mismatch is resolved |
| M2. A1 and A2 in the manuscript | Replayed in investigation 01 and integrated (SP4-M2-B01), or removed with the frame corrected |
| M3. The bridge to the first master | Gate 1 decided |
| M4. The last circle | Gate 2 decided |
| M5. The named spheres | Gate 3 decided |
| M6. The formal request | Issued, or declined by the author |

The branch rests when every component is definite. It is not at an end after a packet return, after the listed tasks, after a failed estimate, or while a dependency is pending and other work can proceed.

## Routing table, 27 November 2026

| ID | Type | Recommendation and reason | Readiness and dependencies | Output |
| --- | --- | --- | --- | --- |
| SP4-M2-E01 | E | Opus or Sol 6.2; a reading with fixed inputs | Ready | Statement table in `reviews/` |
| SP4-M2-B01 | B | Fable or Astra; decides what the manuscript asserts | After POLE-E01, POLE-E02 | Revised manuscript |
| SP4-M2-B02 | B | Lead; weighs evidence against the bridge question | After ZERO-E02 | Gate 1 decision and handoff |
| SP4-M2-B03 | B | Lead | Reserved; author's number of sessions | Gate 2 decision |
| SP4-M2-B04 | B | Lead | After CERT-E03 or CERT-E05 | Gate 3 decision |
| SP4-M2-B05 | B | Lead | After CERT-B03 and the author's decision | Request to the formal side |

## Boundaries

A session launched from this note leads this branch. It does not edit the first master or the first series, and it edits a child only when the second prompt below makes it the lead of the whole series. It opens no Lean edition. It does not commit.

## Exact inputs

- The [proposing note](../../master/brainstorm/notes/claude/ALTERNATIVE_FRAMEWORKS_AND_INVESTIGATIONS_2_20261127.md), SHA-256 prefix `091aa015355ef938`, and its [checks](../../master/brainstorm/notes/claude/ALTERNATIVE_FRAMEWORKS_AND_INVESTIGATIONS_2_20261127_checks/README.md) (`output.txt` prefix `2ba41ad2c9e8e839`).
- The [source receipt](../../../references/claude/SOURCE_NOTES_FRAMEWORKS_AND_PRISM_20261127.md), prefix `536bb672a70af507`.
- The [manuscript draft](../manuscript/self_dual_pole_forms_and_smooth_poincare.tex) as it stands when the session starts; record its hash in the first return.
- The [program assessment](../../master/brainstorm/notes/claude/PROGRAM_ASSESSMENT_AND_PATH_FORWARD_20261127.md) for the state of the first master and of the formal side.

## Prompts

**Second master alone.**

> You are the research lead of the second master in the smooth-poincare-4d repository, `papers/master-2`. Read `AGENTS.md`, `INVESTIGATION_SETUP_WORKFLOW.md`, `GPT_RESEARCH_MODEL_WORKFLOW.md`, `REFERENCE_WORKFLOW.md` and `papers/investigations-2/README.md` with its working rules and session conventions. Then read this branch's README, overview, plan, register and `continuation-notes/CONTINUATION.md`, and the exact inputs that note lists. The author activates the task family `SP4-M2`. Your assignment is the question in the continuation note, not the task list. Lead the B tasks yourself and issue E tasks as frozen requests to bounded helpers with disjoint outputs. Start with SP4-M2-E01, then integrate whatever the child registers have returned, and decide a gate only when its dependency exists. Label every statement as import, project theorem, certificate or heuristic, and call nothing established that Lean has not proved. Continue until an end state of the continuation note or a question that blocks every remaining step. Edit only `papers/master-2`, send results for other branches as handoffs, record the model and effort you actually ran with, and do not commit.

**The whole second series under one lead.**

> You are the research lead of the second series in the smooth-poincare-4d repository: `papers/master-2` and the six investigations of `papers/investigations-2`. Read `AGENTS.md`, the three workflows named there and `papers/investigations-2/README.md`. Then read the second master's overview and continuation note, and each investigation's README, plan, register and continuation note. The author activates the task families `SP4-M2`, `SP4-POLE`, `SP4-ZERO`, `SP4-LINE`, `SP4-ENT`, `SP4-CERT` and `SP4-INV`. Work in the order the series README gives: investigation 01 first, then the gate experiment of 02 and the readings of 03, with the ready reading tasks of 04, 05 and 06 issued as parallel E packets on disjoint files. You are the only writer of the seven registers. Apply the working rules: aim at the conjecture, no outside readers, Lean as the standard for the project's own claims, and every statement labelled. Continue through ready dependencies until the end states of the continuation notes or a question that blocks every remaining step. Do not edit the first master or the first series, open no Lean edition without the author's decision, record the model and effort you actually ran with, and do not commit.
