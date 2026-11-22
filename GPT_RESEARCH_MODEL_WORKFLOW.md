# Research model and task workflow

21 November 2026, America/New_York. Prepared for Edward Baker with OpenAI
assistance; actual setup model/effort not independently recorded.

This is the canonical model-routing and task policy. Defaults retain the
author's existing research workflow; a current explicit choice takes precedence.

| Type | Definition | Default recommendation |
| --- | --- | --- |
| B — brainstorm | A consequential choice of mechanism, invariant, geometric object, proof strategy or target remains unresolved. | Astra/ultra; state the conceptual difficulty. |
| E — execution | Inputs, method, target and completion test are fixed, including analytical derivations, proof checks, bounded numerical work and implementation. | Sol 6.2/ultra; state why the task has a fixed route. |

A proof is not automatically B. A computation with an unresolved mathematical
objective is not yet E. Split a mixed task into a B decision followed by a
specified E request. The selected lead model/effort remains unchanged unless
the author changes it; record actual available execution metadata separately
from these recommendations.

## Before execution

Every task receives a stable branch-specific ID, type, recommendation and
reason, readiness/dependencies, concrete deliverable, evidence standard,
finite scope, completion condition and conceptual escalation trigger. The
branch's `research-progress/REGISTER.md` is its sole live status owner. A plan
or continuation note links that register instead of becoming a second ledger.
Ready means executable after activation, not proved or already started.

A helper request freezes:

- Task ID, request revision, date, author, actual available model/effort.
- Exact input files/versions, prerequisite status and register link.
- Mathematical question, equations, normalization, category/signature,
  domain and observation or estimate to be produced.
- Permitted routine choices, finite cases/refinement/work limits, completion
  test, failure disposition and named B escalation trigger.
- Assigned output files and shared files the helper must not edit.

Put issued requests and returns in `research-progress/handoffs/`. Preserve
issued versions and failed evidence. A return records what was done, which
premises were used, actual errors or limitations, evidence files and the
resulting next task. A routine implementation adjustment stays within E; a
change of mechanism, target, evidence standard or unresolved premise requires
a visible B decision before dependent execution continues.

## Sustained sessions and bounded helpers

When the author activates research, use Astra/ultra as the default lead and
expressly authorized bounded `gpt-6.2-sol`/ultra helpers where appropriate.
Independent packets may proceed in parallel with disjoint file ownership.
Dependent work waits for prerequisites. Helpers finish at their packet
boundary; the lead integrates their returns and continues useful ready work.
Only the designated lead edits shared status/index files.

One packet completion, an unfavorable estimate or a helper return does not end
the whole research session. Record the result, compare the next dependencies
and continue within the activated investigation. A changed attempt must identify
the new premise or information; do not silently enlarge a numerical campaign.
A frozen E request can end in a precise scoped failure.

End at a substantial assessed and integrated milestone with a concrete
continuation, a real external dependency or necessary author decision blocking
useful work, an author stop, or a genuine execution limit. Respect an explicit
single-task request. Do not invent further work once the requested objective
is complete. These defaults do not create chats, send messages, schedule
unattended work or activate unrelated investigations.

## Evidence and handoff

A new model is not independent specialist review. State shared premises and
what was independently recomputed. Distinguish floating diagnostics, symbolic
identities, interval bounds and universal proofs. For this program, explicitly
separate local/perturbative results from global existence, regularity,
compactness and convergence claims on arbitrary homotopy four-spheres.

A continuation note contains a dated routing table (ID, B/E, recommendation
and reason, readiness/dependencies, output), source links and one self-contained
pasteable prompt. Choose a default next task only when priority is settled.
The live register remains authoritative over the handoff snapshot.

Suggested sustained prompt:

> Read AGENTS.md, the workflow files and the selected investigation's overview,
> plan and sole register. Begin its next ready task with Astra/ultra leadership
> unless I have selected otherwise. Bounded gpt-6.2-sol/ultra execution helpers
> are authorized. Freeze each packet before execution and continue through
> useful ready dependencies and in-scope revisions. Integrate evidence, preserve
> failed attempts, maintain authentic public chat history, and finish with an
> assessed milestone and a concrete continuation.
