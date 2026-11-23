# Shared-program Claude chat histories

23 November 2026 (America/New_York). Prepared for Edward B. Baker III with LLM
assistance. Model: Claude Fable 5.2 (`claude-fable-5-2`), Claude Cowork,
reasoning effort max as the session's configuration records it.

This registry holds Claude conversations about the repository as a whole:
setup, tools and work that spans investigations. They are numbered in
[index.json](index.json), which gives current capture times, counts, models
and hashes. Codex and Work conversations of that kind are in the
[parent folder](../README.md); a Claude conversation about one investigation
belongs in that investigation's `chat-histories/claude-cowork/`. Numbering is
local to each registry.

A Cowork session records itself here from its claude.ai event log with
[record_Claude_browser_chat.py](../../tools/record_Claude_browser_chat.py)
(`ingest --registry chat-histories/claude-cowork`), first once its
destination is clear and then at the end of every turn. The steps and their
limits are in the
[Claude section of the workflow](../../tools/CHAT_HISTORY.md#claude-cowork-sessions).
The records hold completed public user and assistant text. Progress updates
between tool calls are kept as the log holds them, a condensed rewrite and
not the assistant's verbatim text. Private instructions, reasoning, tool
traffic and subagent correspondence are excluded, and neither the event log
nor the reduced store is kept in the repository.

A record made during a turn does not hold that turn's reply; the reply
enters at the next read. A record whose last turn reads `in_progress` is
therefore one read short, and
`python3 tools/record_Claude_browser_chat.py pending` lists it.

## Recorded conversations

1. **Chat history capture setup** — [0001_2026-11-23T16-12-53Z_chat-history-capture-setup.json](0001_2026-11-23T16-12-53Z_chat-history-capture-setup.json)
   - *Work.* Set up chat history capture for Claude Cowork sessions at
     Edward's request, with `shifted-zeta-positivity` as the reference. It
     found that the Cowork runtime no longer keeps the transcript file the
     earlier per-turn capture read, wrote
     [record_Claude_browser_chat.py](../../tools/record_Claude_browser_chat.py)
     with its [tests](../../tools/tests/test_browser_capture.py) to record a
     session from its claude.ai event log instead, taught the
     [export converter](../../tools/record_Claude_export_chat.py) about
     progress updates, opened this registry and
     [the investigation's](../../papers/investigations-1/01_chiral_metric_evolution/chat-histories/claude-cowork/README.md),
     and wrote the procedure into
     [tools/CHAT_HISTORY.md](../../tools/CHAT_HISTORY.md#claude-cowork-sessions)
     and the standing rule into [AGENTS.md](../../AGENTS.md).
   - *Session.* A Claude Cowork cloud session in project Smooth Poincare
     Conjecture 4d with Claude Fable 5.2 (`claude-fable-5-2`, reasoning effort
     max per the session's configuration), started 23 November 2026 at 11:12
     America/New_York.
   - *Capture.* Captured from the session's claude.ai event log with
     `record_Claude_browser_chat.py ingest`, first at 12:03 the same day (7
     messages over 1 turn), and refreshed at the end of every later turn,
     before that turn's reply; [index.json](index.json) gives the current
     count.

## Awaiting capture

None.
