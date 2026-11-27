# Continuation — cut geometry and chirality

26 November 2026, America/New_York. Prepared for Edward B. Baker III by Claude (Anthropic), model `claude-fable-5-2`, reasoning effort at the session's configured maximum. Setup baseline `4655e38`; first written 26 November 2026 at `841d606`, revised when the children were set up, and again on 27 November 2026 when the child continuation notes were written. This is a dated snapshot; the [parent register](../research-progress/REGISTER.md) and the five child registers are authoritative.

## Status boundary

Set up: the parent scaffold with its [overview](../research-overview/OVERVIEW.md), [plan](../research-plan/PLAN.md), register and initial [manuscript](../manuscript/cuts_of_subcritical_conformal_classes.tex); for each of the five children an overview, a plan, a register and a continuation note that cross-reference the parent, with the task families of the [crosswalk](../research-progress/CROSSWALK_20261126.md). Not done: no task is activated; no statement of the manuscript has been read independently; the sign of the ledger's boundary term is untested; the cap costs are floating point; the lead of 05 has not answered the [request](../research-progress/handoffs/SLIDE_B01_REQUEST_TO_05_20261126.md) about the slide enumeration. By the author's instruction the children have no manuscripts and, apart from their continuation notes, no other folders; those are created on first use.

Unresolved question: whether an entering gauge on a homotopy four-sphere has a sweepout whose leaves have scalar curvature bounded below, which by Corollary 7.3 of the manuscript is the sphere statement (S).

## Routing table

| ID | Type | Recommendation | Readiness | Output |
| --- | --- | --- | --- | --- |
| SP4-CUT-E02 | E | Opus, independent reader | Ready | Replay of Sections 2 to 5, 7, 8 of the manuscript |
| SP4-CUT-LED-E01 | E | Opus | Ready | Note and script fixing the sign in (3.2) |
| SP4-CUT-LED-E02 | E | Opus | Ready | Table of necks against Corollary 3.4 |
| SP4-CUT-LED-B01 | B | Fable | Ready | Decision note on the variation of eta |
| SP4-CUT-SEAM-E01 | E | Opus | Ready | Hypothesis table and insert-ready statements |
| SP4-CUT-SEAM-B01 | B | Fable | Ready | Definition of the capping cost |
| SP4-CUT-SEAM-B02 | B | Fable | Ready | Criterion for positive doubles |
| SP4-CUT-SEAM-E03 | E | Opus | Ready | Atlas for all positive seams |
| SP4-CUT-TUBE-B01 | B | Fable | Ready | Decision note on the exterior gap |
| SP4-CUT-TUBE-E01 | E | Opus | Ready | One certified one-tube example |
| SP4-CUT-TUBE-E02 | E | Opus | Ready | Euler–Lagrange system for caps |
| SP4-CUT-TUBE-B02 | B | Fable | Ready | First candidate without circle symmetry |
| SP4-CUT-SLIDE-E02 | E | Opus | Ready | Where representations certify cuts |
| SP4-CUT-GEO-B01 | B | Fable | Ready | Canonical cut and flow; first claim |
| SP4-CUT-GEO-E02 | E | Opus | Ready | Model computation on the simplest one-tube class |
| SP4-CUT-GEO-E03 | E | Opus | Ready | Hessian criterion for degenerate leaves |
| SP4-CUT-GEO-B02 | B | Fable | Ready | Approach to the positivity of the minimal cut |
| SP4-CUT-B01 | B | Fable | After LED-E01, E02 and one of GEO-B01, TUBE-B01, SEAM-B01 | Choice of closing lane |

Dependent and reserved tasks are in the child registers. Fable and Opus are the Claude counterparts of Astra and Sol in the model workflow, by the author's statement of 26 November 2026; a GPT lead reads the table with Astra/ultra for B and Sol 6.2/ultra for E.

## Child continuation notes

Written 27 November 2026 for handoff to an Astra/ultra lead with Sol 6.2/ultra helpers. Each note divides the child's question into components, says when a component has a definite result, names the end states of the whole sub-investigation and carries its own prompt. By the author's instruction a session launched from one continues until an end state and does not stop at a breakpoint inside the child.

| Child | Note | Ends when |
| --- | --- | --- |
| Chirality ledger | [`01_chirality_ledger`](../01_chirality_ledger/continuation-notes/CONTINUATION.md) | The ledger is an instrument: its sign is fixed, the collar statement is decided for the necks of 03 and 06, the variation of \(\eta\) is settled, and the thresholds and model families are returned. |
| Seams and marked cuts | [`02_seams_and_marked_cuts`](../02_seams_and_marked_cuts/continuation-notes/CONTINUATION.md) | The selection rules are delivered, the atlas is complete, positive doubles have a criterion, and the quantitative lane is proved or closed. |
| Tubes and exteriors | [`03_tubes_and_exteriors`](../03_tubes_and_exteriors/continuation-notes/CONTINUATION.md) | The exterior gap is decided or reduced, the cap functional is settled with one certified example, and each remaining class of tubes has a result. |
| Slide filters | [`04_slide_filters`](../04_slide_filters/continuation-notes/CONTINUATION.md) | The certificates are delivered and the child rests on the request to 05; or, after an answer, the agreed items are complete or the child is closed. |
| Cuts from geometry | [`05_cuts_from_geometry`](../05_cuts_from_geometry/continuation-notes/CONTINUATION.md) | Statement (S) is proved and read independently; or each step of the primary route is proved, refuted on an explicit class, or reduced. |

The notes contain statements marked † that were derived while they were written and have not been read independently.

## Prompt 1 — sustained research on the parent and its children

Use this prompt only for one session that leads the parent and all five children together. A child that runs under its own continuation note is written only by that session, and the parent then uses Prompt 2.

> Read AGENTS.md, INVESTIGATION_SETUP_WORKFLOW.md, GPT_RESEARCH_MODEL_WORKFLOW.md and REFERENCE_WORKFLOW.md, then the README, overview, plan and register of papers/investigations-1/08_cut_geometry_and_chirality, its manuscript, and the overview, plan and register of each of its five children. Work as lead with the model I have selected; in a Claude session Fable leads and bounded Opus helpers are authorized for E packets, in the roles the workflow gives Astra and Sol. Begin with SP4-CUT-LED-E01, SP4-CUT-E02 and SP4-CUT-SEAM-E01 as frozen requests on disjoint files, with requests and returns in the handoffs folder of the branch that owns each task, created on first use. Integrate each return into the register that owns the task, correct the manuscript where a replay finds a gap, and send the handoffs owed to the registers of 03, 05, 06 and 07 without editing their files. Then run SP4-CUT-GEO-E02 and GEO-E03 and take SP4-CUT-GEO-B01, SP4-CUT-TUBE-B01 and SP4-CUT-SEAM-B01, each as a dated note in the brainstorm folder of its child, and finish with the parent decision SP4-CUT-B01. Leave the slide-filters child untouched except for SP4-CUT-SLIDE-E02 unless the lead of 05 has answered the request in the parent's handoffs folder. Preserve failed attempts with their evidence, keep numerics within the stated scopes, maintain authentic public chat history, and stop at the SP4-CUT-B01 milestone with an assessed result and a concrete continuation. Do not commit.

## Prompt 2 — the parent while the children run under their own notes

> Read AGENTS.md, INVESTIGATION_SETUP_WORKFLOW.md, GPT_RESEARCH_MODEL_WORKFLOW.md and REFERENCE_WORKFLOW.md, then the README, overview, plan, register and manuscript of papers/investigations-1/08_cut_geometry_and_chirality, and the README, register and continuation note of each of its five children. Work as lead of the parent only, with the model I have selected; Astra/ultra is the default, and in a Claude session Fable leads with bounded Opus helpers. The children run under their own continuation notes: do not take their tasks or edit their files. Run SP4-CUT-E02 as a frozen request to an independent reader and correct the manuscript where the replay finds a gap. Read the handoffs that the children have addressed to the parent lead, the files named TO_PARENT_ in each child's research-progress/handoffs folder, and integrate what they establish into the manuscript, the overview and the shared bibliography, recording each integration in the parent register. Take SP4-CUT-B01 when its inputs have returned. Send what concerns 03, 05, 06, 07 or the master by handoff. Stop at the SP4-CUT-B01 milestone, or earlier when SP4-CUT-E02 is integrated and no child handoff is waiting. Do not commit.

The single-child prompt of 26 November 2026 is superseded by the child continuation notes.

## Exact inputs

The manuscript; the [proposing note](../../../master/brainstorm/notes/claude/USES_OF_THE_FIRST_ORDER_AND_MARKED_CUT_TOOLS_20261126.md) and its [checks](../../../master/brainstorm/notes/claude/USES_OF_THE_FIRST_ORDER_AND_MARKED_CUT_TOOLS_20261126_checks/README.md); the master manuscript and its section on [reflective seams](../../../master/manuscript/claude/umbilic_doubling.tex); the manuscripts of 03, 05 and 06 named in the registers. The earlier prompt that created the child scaffolds was executed on 26 November 2026 and is superseded by this note. Saving these prompts activates nothing.
