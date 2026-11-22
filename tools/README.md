# Research tools

These tools support source provenance, research conversation archives, citation
metadata, and repository checks. They do not validate mathematical claims.
Use Python 3.10 or later on macOS or Linux for the chat refresh suite.

| Tool | Purpose |
| --- | --- |
| `refresh_chat_history.py` | Strict live public-chat refresh, source diagnostics, serialized writes and bounded final-turn capture |
| `paginated_chat_source.py` | Read-only adapter for supported local paginated history schemas |
| `record_chat.py` | Shared archive serializer and explicit single-conversation import |
| `extract_project_chats.py` | Select exact conversations from an author-provided account export |
| `record_Claude_cowork_chat.py` | Convert or capture supported Cowork transcripts with declared coverage |
| `record_Claude_export_chat.py` | Convert supported Claude export/event records with declared coverage |
| `check_citations.py` | Validate every repository `CITATION.cff` against a supplied official CFF schema |
| `build_manuscripts.py` | Build working manuscripts from both investigation series into output/pdf/<branch>/ |
| `check_repository_hygiene.py` | Check the repository's navigation, file and provenance conventions |

Read [CHAT_HISTORY.md](CHAT_HISTORY.md) before capturing or importing a chat.
Defaults are relative to this checkout: the shared recorder is
`tools/record_chat.py`, the base archive is `chat-histories/`, and the
`--project` option selects a direct folder under `papers/investigations-1/` by default.
For earlier foundational studies, combine `--project NAME` with
`--series initial-investigations`; the shared recorder and Cowork adapter both
support this explicit selection. Identically named branches in different series
are never selected by a cross-series search. Use an explicit investigation `--history-dir` or `--folder` when the
investigation is nested or its destination needs to be unambiguous.

Run focused tests from the repository root:

```sh
python3 -m unittest discover -s tools/tests -p 'test_*.py'
```

For citation checks, install `requirements_metadata.txt` in a chosen environment
and supply the official CFF 1.2.0 schema as a local file. The checker itself
performs no network access:

```sh
python3 tools/check_citations.py --schema /path/to/cff-1.2.0-schema.json
```

[TOOL_PORTABILITY.md](TOOL_PORTABILITY.md) records the setup checks and limits.
[The model workflow](../GPT_RESEARCH_MODEL_WORKFLOW.md) governs research task
routing; tools do not change the selected model or start research sessions.
