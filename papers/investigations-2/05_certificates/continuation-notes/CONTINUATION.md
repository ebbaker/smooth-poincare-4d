# Continuation — Certificates

27 November 2026, America/New_York. Prepared for Edward B. Baker III by Claude (Anthropic), model `claude-fable-5-2`, reasoning effort at the session's configured maximum, in a Cowork session. Setup baseline `b607bd1`. This is a dated snapshot: the [register](../research-progress/REGISTER.md) is the live status, and saving this note activates nothing. The shared conventions for sessions, including what a definite result is, are in the [series README](../../README.md#how-sessions-work-in-this-series).

## The assignment

The assignment is the question of this investigation, not the list of tasks in its [plan](../research-plan/PLAN.md): which statements about named homotopy four-spheres can be settled by finite certificates that Lean can check, and what must the ledger of imports contain for those certificates, and for the frame of the second master, to count as proofs?

## Status boundary

Set up on 27 November 2026. One closing of the prism family is recognized by a working proof whose group computation has been replayed and whose diagram has not. The presentation $P$ is known to present the trivial group and nothing more. No certificate format, no sweep, no search and no ledger exists, and no task is activated.

## Where the investigation ends

| Component | Definite when |
| --- | --- |
| C1. Order seven | Comparison table with the preprint delivered |
| C2. The presentation at seventeen | Derived independently of the tangle diagram and compared, with the result returned to the tube investigation |
| C3. The family | Statement chosen and its sweep delivered, with certificates for the finite cases |
| C4. The even closing for the formal side | Statement package delivered |
| C5. The presentation $P$ | A verified trivialization, or the bounded space recorded as exhausted |
| C6. Formats | Fixed and tried on one example each |
| C7. The ledger | Draft delivered to the second master |
| C8. Handle diagrams | Delivered for $\Sigma_P$; decided for the prism knot |

The investigation rests when every component is definite. It is not at an end after a packet return, after the listed tasks, after a failed estimate or a B decision, or while a dependency is pending and other work can proceed.

## Routing table, 27 November 2026

| ID | Type | Recommendation and reason | Readiness and dependencies | Output |
| --- | --- | --- | --- | --- |
| SP4-CERT-E01 | E | Opus or Sol 6.2; reading and reproduction | Ready | Comparison table |
| SP4-CERT-E02 | E | Opus or Sol 6.2; fixed target | Ready | Independent presentation, handoff to the tube investigation |
| SP4-CERT-B01 | B | Fable or Astra; the statement for general order is a choice | Ready | Decision note |
| SP4-CERT-E03 | E | Opus or Sol 6.2; bounded sweep | After B01 and E02 | Table and certificates for gate 3 |
| SP4-CERT-E04 | E | Opus or Sol 6.2 | Ready | Statement package |
| SP4-CERT-E05 | E | Opus or Sol 6.2; bounded search | Ready | Certificate or exhausted record |
| SP4-CERT-B02 | B | Lead; formats | Ready | Decision note |
| SP4-CERT-B03 | B | Lead; the ledger | After B02, POLE-E02, ENT-E01 | Ledger draft |
| SP4-CERT-E06 | E | Opus or Sol 6.2 | Ready in part | Handle diagrams |

## Boundaries

A session launched from this note leads this investigation only. It does not edit the tube investigation, investigation 07 or `formalization/`. It reports a failed search as a failed search. It does not call a sphere recognized on the strength of a group computation alone: the imports that turn the computation into a diffeomorphism are named each time.

## Exact inputs

- The first master's [prism section](../../../master/manuscript/claude/even_prism_closing.tex), SHA-256 prefix `d2c1322e2ed91100`.
- The tube investigation's notes [E39](../../../investigations-1/08_cut_geometry_and_chirality/03_tubes_and_exteriors/notes/E39_PRISM_FILLINGS.md), [E70](../../../investigations-1/08_cut_geometry_and_chirality/03_tubes_and_exteriors/notes/E70_EQUIVARIANT_SURGERY.md) (prefix `ade2987d8bf24aa9`), [E76](../../../investigations-1/08_cut_geometry_and_chirality/03_tubes_and_exteriors/reviews/E76_RECOGNITION_TRANSFER.md) and the replays [E73](../../../investigations-1/08_cut_geometry_and_chirality/03_tubes_and_exteriors/reviews/E73_FIRST_GROUP_REPLAY.md) and [E79](../../../investigations-1/08_cut_geometry_and_chirality/03_tubes_and_exteriors/reviews/E79_EVEN_TRANSFER_REPLAY.md).
- [check_05_prism_groups.py](../../../master/brainstorm/notes/claude/ALTERNATIVE_FRAMEWORKS_AND_INVESTIGATIONS_2_20261127_checks/check_05_prism_groups.py), prefix `30861b3f4c89323c`, and [check_07](../../../master/brainstorm/notes/claude/ALTERNATIVE_FRAMEWORKS_AND_INVESTIGATIONS_2_20261127_checks/check_07_entropy_and_presentation.py).
- The [proposing note](../../../master/brainstorm/notes/claude/ALTERNATIVE_FRAMEWORKS_AND_INVESTIGATIONS_2_20261127.md), section 5, and the [program assessment](../../../master/brainstorm/notes/claude/PROGRAM_ASSESSMENT_AND_PATH_FORWARD_20261127.md), section 6, for the formal side.
- The [presentation sources](../../../investigations-1/07_positive_subcritical_entry/notes/PRESENTATION_SOURCES.md) of investigation 07.
- The [source receipt](../../../../references/claude/SOURCE_NOTES_FRAMEWORKS_AND_PRISM_20261127.md), section 1.

## Prompt

> You are the research lead of the investigation `05_certificates` in the smooth-poincare-4d repository, `papers/investigations-2/05_certificates`. Read `AGENTS.md`, `INVESTIGATION_SETUP_WORKFLOW.md`, `GPT_RESEARCH_MODEL_WORKFLOW.md`, `REFERENCE_WORKFLOW.md` and `papers/investigations-2/README.md` with its working rules and session conventions. Then read `papers/master-2/research-overview/OVERVIEW.md` for the frame and the conventions, and this investigation's README, overview, plan, register and `continuation-notes/CONTINUATION.md` with the exact inputs it lists. The author activates the task family `SP4-CERT`. Your assignment is the question in the continuation note, not the task list. Lead the B tasks yourself and issue E tasks as frozen requests to bounded helpers with disjoint outputs. Start CERT-E01, E02, E04 and E05 as parallel packets on disjoint files and take CERT-B01 and CERT-B02 yourself; state the bounds of every search in its request; draft the ledger as soon as the readings of the other branches exist. Read every published theorem in its primary source before you use it, and record what you inspected in the reference file and the shared bibliography. Label every statement as import, project theorem, certificate or heuristic, and call nothing established that Lean has not proved. Continue through ready dependencies until an end state of the continuation note or a question that blocks every remaining step. Edit only this investigation, send results for other branches as handoffs, record the model and effort you actually ran with, and do not commit.
