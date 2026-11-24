# Bach-flow planning handoff

23 November 2026 (America/New_York). Prepared for Edward B. Baker III with OpenAI Codex assistance. The selected model identifier and reasoning effort were unavailable.

## Current continuation — 23 November 2026

The author approved the outline and requested the planning writeup. Read
the [overview](../research-overview/OVERVIEW.md), [plan](../research-plan/PLAN.md),
and [sole register](../research-progress/REGISTER.md). The first proposed
research decision is SP4-BACH-B01, choosing the geometric class for a
finite-window dissipation estimate before recognition. Research is
unactivated. The next discussion will consider the author's new idea and
how it bears on this plan.

```text
Read AGENTS.md and the Bach-flow overview, plan, and progress register
under papers/investigations-1/02_bach_flow. Discuss the new idea I describe
and compare it with the proposed finite-time recognition question, the
initial-data problem, and the relevant chiral metric evolution results.
Brainstorm the implications for the plan before activating research.
```

## Original planning handoff

The [23 November brainstorm note](../brainstorm/notes/BACH_FLOW_IDEA_20261123.md), the [initial introduction](../manuscript/bach_flow_and_smooth_poincare.tex), and the [primary-source notes](../../../../references/SOURCE_NOTES_BACH_FLOW_20261123.md) are the inputs. The [draft history](../DRAFT_HISTORY.md) identifies the inherited manuscript version. The [overview](../research-overview/OVERVIEW.md), [plan](../research-plan/PLAN.md), and [sole register](../research-progress/REGISTER.md) are blank at this handoff.

### Scope and routing

The next session compares research directions and writes the three planning files. The session ends when their scope, task IDs, dependencies, and statuses agree. Proof execution, numerics, and manuscript development belong to a later session authorized by the author.

| Work | Routing |
| --- | --- |
| Compare objectives and settle the scope of a first question | Conceptual B work for the selected lead. The repository recommends Astra/ultra. |
| Specify follow-up proof, source, or computation checks | Plan bounded E work only where the method, inputs, and completion test can be fixed. The repository recommends Sol 6.2/ultra helpers for authorized execution. |

### Pasteable continuation prompt

```text
Start a brainstorming and planning session for papers/investigations-1/02_bach_flow
in the smooth-poincare-4d repository. Read AGENTS.md, the root and branch
READMEs, INVESTIGATION_SETUP_WORKFLOW.md, GPT_RESEARCH_MODEL_WORKFLOW.md,
REFERENCE_WORKFLOW.md, and LARGE_FILES.md. Use the branch's
brainstorm/notes/BACH_FLOW_IDEA_20261123.md, manuscript introduction, draft
history, and references/SOURCE_NOTES_BACH_FLOW_20261123.md at repository root
as the scientific inputs. Retain the stated versions and theorem hypotheses.
Refresh and preserve authentic public chat history using tools/CHAT_HISTORY.md.

Compare three directions and their dependencies:

1. Finite-time recognition. Formulate a bounded first question about crossing
   E_+ < 4 pi^2 while the modified Bach flow remains smooth. Consider the
   conditional starting range Y(M,[g_0]) > 0 and 4 pi^2 < E_+(g_0) < 8 pi^2.
   Separate preservation of the Yamabe sign from a quantitative energy drop.
2. Degeneration and limits. Identify what would control full curvature,
   prevent collapse, or give a usable rescaled limit. Keep Lopez's geometric
   premises explicit and identify what would exclude positive-energy Bach-flat
   limits. Treat the round calculation as a local benchmark.
3. Initial data. Distinguish short-time flow from an arbitrary smooth metric
   from the existence of data in the conditional recognition range. Identify
   any independently obtainable input and record the remaining gap.

Choose a first bounded research question if the comparison supports one.
If a consequential premise or choice remains unresolved, specify it as the
first B task and reserve dependent E work. Preserve my selected model and
reasoning effort and record unavailable settings accurately.

Populate these files in the Bach-flow branch:

- research-overview/OVERVIEW.md. State the closed smooth oriented Riemannian
  homotopy-four-sphere setting, the modified Bach equation, the operator
  Hilbert–Schmidt convention for E_+, and both recognition targets. Distinguish
  sourced theorems, the conditional Yamabe-sign argument, local benchmarks,
  and open a priori estimates. Link the exact source passages.
- research-plan/PLAN.md. Give a bounded sequence of B and E tasks using
  stable SP4-BACH IDs. For each task state the role, routing recommendation,
  dependencies, deliverable, evidence standard, finite scope, completion
  test, and B escalation trigger. Include a fallback if the first proposed
  estimate fails.
- research-progress/REGISTER.md. Use the same IDs and initialize the sole
  status register. Mark ready tasks as unactivated, and give the missing
  premise or decision for reserved or blocked tasks. Preserve the status of
  inherited results.

Cross-check the three files and run the repository hygiene check. Finish
with a short explanation of the chosen first question or remaining decision.
This session is for brainstorming and the three planning deliverables.
Research execution and changes to the manuscript require a later instruction.
```
