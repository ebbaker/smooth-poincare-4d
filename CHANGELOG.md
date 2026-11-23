# Change log

## 2026-11-23 — Claude Cowork chat capture from the claude.ai event log

- Found that the Cowork runtime keeps no transcript file in the session workspace, so `record_Claude_cowork_chat.py` has nothing to read there. Noted this in the script and corrected its stale `smooth_poincare_4d` folder default.
- Added `tools/record_Claude_browser_chat.py`: a session reads its own claude.ai event log in a signed-in browser, keeps the public records, and registers them through `record_Claude_export_chat.py` and `record_chat.py`, with SHA-256 checks on the transfer, the reader text and the session identity. Added 21 synthetic tests (138 in all).
- `record_Claude_export_chat.py` now keeps progress updates, which the log holds as condensed narration, as labelled commentary, and renders question-card answers in the card's order.
- Opened the Claude registries at `chat-histories/claude-cowork/` (chat 1 is this setup conversation) and under `01_chiral_metric_evolution`. Wrote the procedure into `tools/CHAT_HISTORY.md` and the standing rule into `AGENTS.md`.
- Limits: the two claude.ai endpoints are internal to the web app and were observed answering for one session on this date; a turn's reply enters its record at the next read.

Prepared for Edward B. Baker III with LLM assistance: Claude Fable 5.2 (`claude-fable-5-2`), Claude Cowork, effort max as configured. An operational change, not a research result.

## 2026-11-21 — Verify the local transfer and restore infrastructure

- Verified working-tree write access and all 36 original source mappings/hashes.
- Restored the documented `papers/initial-investigations/` name and seven omitted ignore/CI/template files from the prepared setup.
- Corrected current repository links and continuation locations; strengthened required-file checks while preserving scientific contents and task statuses.
- All 111 existing tool tests and all three manuscript builds passed; repository hygiene and import verification passed.
- Recorded the [audit and remaining operational limits](reviews/REPOSITORY_AUDIT_20261121.md). Project files remain uncommitted; the current conversation's authentic source remains unavailable.

## 2026-11-21 — Separate the initial geometric studies

- Kept `01_chiral_metric_evolution` in `papers/investigations-1/`.
- Moved and renumbered the earlier studies to `papers/initial-investigations/01_generalized_isothermal_coordinates` and `papers/initial-investigations/02_chiral_descent_and_double_copy`.
- Updated navigation, build and recording destinations, and import provenance. Stable task IDs, mathematical contents, and evidence status are preserved; one imported note received a sibling-link correction.

## 2026-11-21 — Investigation series naming

- Renamed the investigation container to `papers/investigations-1/` at the author’s request.
- Updated navigation, continuation prompts, import destinations, build/check tools, recorder defaults, and related tests; retained branch numbers and scientific content.

## 2026-11-21 — Initial investigation setup

- Organized 36 substantive geometry files into one primary and two supporting investigations, plus shared references.
- Preserved scientific source text; repaired imported Markdown file links with changes recorded in IMPORT_MANIFEST.json.
- Added tailored research, reference, evidence, continuation, storage, and public-history workflows.
- Preserved the target repository's license; retained the author's original unfinished papers as references.
- Prepared portable recording/build/validation tools without importing unrelated research or history.

Prepared for Edward Baker with OpenAI assistance. The exact backend model and effort are not independently recorded for this setup. This entry is an organizational milestone, not a research result.
