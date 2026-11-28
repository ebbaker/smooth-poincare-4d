# Continuation — Entropy of embeddings

27 November 2026, America/New_York. Prepared for Edward B. Baker III by Claude (Anthropic), model `claude-fable-5-2`, reasoning effort at the session's configured maximum, in a Cowork session. Setup baseline `b607bd1`. This is a dated snapshot: the [register](../research-progress/REGISTER.md) is the live status, and saving this note activates nothing. The shared conventions for sessions, including what a definite result is, are in the [series README](../../README.md#how-sessions-work-in-this-series).

## The assignment

The assignment is the question of this investigation, not the list of tasks in its [plan](../research-plan/PLAN.md): can a given homotopy four-sphere be embedded in $\mathbb R^5$ with Colding–Minicozzi entropy in the band where recognition of the standard sphere is a published theorem, and what does the entropy of the natural embeddings measure?

## Status boundary

Set up on 27 November 2026. The recognition theorem is known here only through a summarizing reader, the embedding lemma is not written, and no entropy of any embedding of a named sphere has been estimated. No task is activated.

## Where the investigation ends

| Component | Definite when |
| --- | --- |
| N1. The imported flow theorems | Exact statements for dimension four delivered and sent to 05 |
| N2. The embedding lemma | Replayed, or its gap recorded |
| N3. An upper bound for a named sphere | Decided by ENT-B01 and, if computed, delivered by ENT-E03; or declined with reasons |
| N4. The state of the literature beyond necks | Dated source note delivered |
| N5. Entropy and total curvature | Opened and made definite, or declined by the lead with a reason |

The investigation rests when every component is definite. It is not at an end after a packet return, after the listed tasks, after a failed estimate or a B decision, or while a dependency is pending and other work can proceed.

## Routing table, 27 November 2026

| ID | Type | Recommendation and reason | Readiness and dependencies | Output |
| --- | --- | --- | --- | --- |
| SP4-ENT-E01 | E | Opus or Sol 6.2; a reading | Ready | Import statements, handoff to 05 |
| SP4-ENT-E02 | E | Opus or Sol 6.2; a classical proof with sources | Ready | Proof note |
| SP4-ENT-B01 | B | Fable or Astra; feasibility is a judgement | Ready | Decision note |
| SP4-ENT-E03 | E | Opus or Sol 6.2; bounded computation | After B01 | Density table |
| SP4-ENT-E04 | E | Opus or Sol 6.2; a reading | Ready | Source note |
| SP4-ENT-B02 | B | Lead | Reserved | None until opened |

## Boundaries

A session launched from this note leads this investigation only. It does not attempt new results on singularities of mean curvature flow, it does not edit the first series, and it describes no heuristic count as a bound.

## Exact inputs

- The [proposing note](../../../master/brainstorm/notes/claude/ALTERNATIVE_FRAMEWORKS_AND_INVESTIGATIONS_2_20261127.md), SHA-256 prefix `091aa015355ef938`, section 4.
- [check_07_entropy_and_presentation.py](../../../master/brainstorm/notes/claude/ALTERNATIVE_FRAMEWORKS_AND_INVESTIGATIONS_2_20261127_checks/check_07_entropy_and_presentation.py), prefix `dfaea0b03165a870`.
- The [source receipt](../../../../references/claude/SOURCE_NOTES_FRAMEWORKS_AND_PRISM_20261127.md), section 3, and the bibliography records `ChodoshMantoulidisSchulze2024LowEntropy`, `HuiskenSinestrari2009`, `ColdingMinicozzi2012Generic`, `BernsteinWang2020Isotopy`, `KervaireMilnor1963Groups`.
- The [immersion manuscript](../../../investigations-1/04_hypersurface_immersions/manuscript/chiral_energy_of_hypersurface_immersions.tex) of the first series, for ENT-B02 only.

## Prompt

> You are the research lead of the investigation `04_entropy_of_embeddings` in the smooth-poincare-4d repository, `papers/investigations-2/04_entropy_of_embeddings`. Read `AGENTS.md`, `INVESTIGATION_SETUP_WORKFLOW.md`, `GPT_RESEARCH_MODEL_WORKFLOW.md`, `REFERENCE_WORKFLOW.md` and `papers/investigations-2/README.md` with its working rules and session conventions. Then read `papers/master-2/research-overview/OVERVIEW.md` for the frame and the conventions, and this investigation's README, overview, plan, register and `continuation-notes/CONTINUATION.md` with the exact inputs it lists. The author activates the task family `SP4-ENT`. Your assignment is the question in the continuation note, not the task list. Lead the B tasks yourself and issue E tasks as frozen requests to bounded helpers with disjoint outputs. Start ENT-E01, ENT-E02 and ENT-E04 as parallel reading packets and take ENT-B01 yourself; issue ENT-E03 only if B01 fixes a finite list. Read every published theorem in its primary source before you use it, and record what you inspected in the reference file and the shared bibliography. Label every statement as import, project theorem, certificate or heuristic, and call nothing established that Lean has not proved. Continue through ready dependencies until an end state of the continuation note or a question that blocks every remaining step. Edit only this investigation, send results for other branches as handoffs, record the model and effort you actually ran with, and do not commit.

The activation corresponding to this historical launch has ended. See the [closing note of 27 November](CLOSING_20261127.md) for the corrected least-entropy statement, the named open problem and the geometric input that would reopen it.
