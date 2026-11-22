# Smooth Poincaré four-dimensional research instructions

Prepared for Edward Baker with OpenAI assistance, 21 November 2026
(America/New_York). Actual setup model and effort are not independently recorded.

## Scope and evidence

Study the smooth four-dimensional Poincaré conjecture through Riemannian
geometry, chiral connections and geometric evolution. Read the root
[README](README.md), the selected investigation's overview, plan and sole
progress register, and the scientific sources named there before continuing.
The earlier twistor and double-copy studies are kept in
`papers/initial-investigations/`, separate from direct smooth Poincaré work
in `papers/investigations-1/`. They have their own hypotheses;
their complex or neutral-signature constructions do not automatically supply
Riemannian structures on arbitrary smooth homotopy four-spheres.

Preserve the difference between a proposed mechanism, a conditional theorem,
a local or linearized calculation, a checked special case and a global result.
State manifold category, signature, orientation, chirality, normalization,
regularity and quantifiers where they matter. A reformulation equivalent to
the target is a reformulation; it does not establish its missing existence
hypothesis. Record a failed route only for the class actually examined.
Importing an existing manuscript confers no new verification status.

## Organization and research execution

Follow [INVESTIGATION_SETUP_WORKFLOW.md](INVESTIGATION_SETUP_WORKFLOW.md),
[GPT_RESEARCH_MODEL_WORKFLOW.md](GPT_RESEARCH_MODEL_WORKFLOW.md),
[REFERENCE_WORKFLOW.md](REFERENCE_WORKFLOW.md) and
[LARGE_FILES.md](LARGE_FILES.md). The author's current instructions override
these defaults.

Save derivations in the investigation's `notes/`, conceptual decisions in
`brainstorm/notes/`, explanations in `brainstorm/explanations/`, computations
and small execution records in `numerics/`, and assessments in `reviews/`.
Use `continuation-notes/` for dated handoffs and pasteable continuation prompts.
Maintain one live `research-progress/REGISTER.md` for each task family and
concise milestones in `DRAFT_HISTORY.md`. Assign one writer to each shared
artifact; re-read it before integration. Do not create manuscript snapshots.

Classify B/E work before execution. The inherited recommendation is Astra/ultra
for the research lead and conceptual B work, with authorized bounded
`gpt-6.2-sol`/ultra helpers for fixed E work once research is activated.
Preserve the selected lead model and effort. Recommendations are not recorded
execution metadata. Mark unavailable actual settings as unavailable.

An activated research session continues through useful ready dependencies,
checks, comparisons and integration without renewed permission at each packet.
Respect narrower user requests and finite packet bounds. Setup does not
activate research, numerics, scheduling, publication or external messages.

Notes, reviews and manuscripts identify date, intended author, assistance,
actual available model/effort, input versions and evidence scope. Manuscripts
name Edward Baker or say they were drafted for him. Use primary references at
the point of dependence, with the exact hypothesis or theorem being imported.

## Public chat history

Retain the requested research chat-capture workflow using
[tools/CHAT_HISTORY.md](tools/CHAT_HISTORY.md) and
`tools/refresh_chat_history.py`. Archive shared setup conversations at root
`chat-histories/`; archive branch research at that branch's `chat-histories/`.
Keep one canonical registration for a conversation.

Verify the actual thread id, source and title before registration. Refresh
existing captures at the start of a new turn. Before the reply ends, refresh
completed public text and, when the actual current turn id is available,
arrange the bounded `--after-turn` / `--defer` follow-up as the last tool action.
A verified trusted completion hook may provide that capture instead. Never
save an unsent planned final response as authentic chat history.

Preserve identities, original timestamps, filenames, earlier public messages
and first-capture provenance. Use shared locks and transactional safeguards;
do not bypass prefix, unsupported-content, size or recovery checks. Do not
hand-edit registered history JSON or run concurrent legacy writers.

Capture completed public user/assistant text and visible commentary only.
Exclude private instructions, internal reasoning, tool traffic, subagent
correspondence and binary runtime payloads. Keep raw source exports out of Git.
If the exact source is unavailable, report that limitation and use an explicitly
unregistered partial public record only when useful. Passing tests or having a
hook template does not establish live capture. Hook installation must follow
the platform's actual trust process and preserve existing integrations.
