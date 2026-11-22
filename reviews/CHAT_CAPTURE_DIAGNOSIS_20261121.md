# Chat-capture diagnosis and bounded recorder repair

21 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI assistance. Actual model and effort were not independently exposed.
Scope: author-requested operational troubleshooting and a bounded E code
repair; no scientific task or research audit was activated. No subagents
were used. The working tree was clean at the start of this troubleshooting
turn, at commit `2cff5e35bdbb489a64dcd70398fd5838612e46c6`.

## Outcome

The recorder's omission of repository-root registrations was repaired and
regression-tested. **Live capture of the current conversation remains
unavailable.** The local-source absence and the app history-tool failure are
separate from that repaired lookup bug. No authentic registration, automatic
completion capture, or recovery of missing messages is claimed.

## Observed evidence

The actual session ID is `6b0266d2-f9b8-83ea-9958-13f41a4ea0fb`, supplied by
`CODEX_THREAD_ID`. The current turn ID and native conversation title were
not available. `CODEX_HOME` was unset, so the recorder correctly searched
the default `/Users/ebbaker/.codex` location.

| Check | Observed result |
| --- | --- |
| `state_5.sqlite`, exact `threads.id` query | Zero matching rows; no recorded local history mode |
| `thread_history_1.sqlite`, exact `thread_id` queries | Zero matching turn rows and zero matching item rows |
| Active and archived JSONL session directories | Zero exact-ID candidates in either directory |
| Local session index | Zero exact-ID entries |
| App `read_thread`, exact ID, metadata only | MCP error `-32000`: `Codex app tool request failed` |
| App `list_threads`, ChatGPT history source | Same MCP error; no conversation data returned |
| Desktop log at 23:24:05 EST | Both failed calls report: `The app tool call ended before producing a result` |
| App UI fallback | Computer Use refused access to `com.openai.codex` for safety reasons; no UI capture obtained |

Database queries were read-only and limited to schema and exact-thread
metadata/counts. No raw message store or private runtime text was copied into
this repository. App metadata identified version `26.1117.41037`, build
`29803`. The corresponding installed app code confirms that the logged error
is emitted when the native app-tool dispatcher returns no result. This
locates the failure at that boundary; it does not establish why the dispatcher
returned no result or which app release first caused the problem.

The log also contained a successful `thread/read` response-routing event for
the exact ID at 23:23:26 EST. That event did not expose a message payload or
a verified capture source. It does not establish that messages are lost, nor
does it make the failing public app-tool calls successful.

The [diagnostic JSON](CHAT_CAPTURE_DIAGNOSIS_20261121.json) records the
recorder's final source result. Existing notification integration was left
intact. No new hook was installed: a hook would still have no supported local
source for this thread.

## Recorder change

`find_registered()` searched only `papers/**/index.json`. Consequently an
archive already registered in root `chat-histories/` could be reported as
`skipped_unregistered`, and a later explicit branch registration could create
a duplicate. Lookup now also checks the root `chat-histories/` and legacy
`chat_histories/` registries through the existing validation routines.

Diagnostics now expose `local_thread_history_mode`, distinguishing absent
thread metadata from an unavailable marked-paginated source and from an
explicit source override. When no local metadata or exact JSONL exists, the
response identifies the need for a supported app reader or authentic export.
An absent metadata row still permits discovery of a genuine legacy JSONL.

Source identity, prefix preservation, timestamps, public-content filtering,
locks, transactional writes, size limits, and completion gates were retained.
No database adapter or archive format was changed.

## Validation and limits

- The original 111-test suite passed before changes.
- New root-registration tests reproduced skipped refresh, incorrect
  diagnostics, and the possibility of duplicate registration before the fix.
- Six added regression tests cover root lookup and refresh, duplicate
  prevention, read-only root diagnostics, absent metadata, and explicit source
  overrides; the existing paginated diagnostic test was strengthened.
- All **117 tests passed** after the repair, including existing source,
  privacy, transaction, integrity, and completion tests.
- The actual thread was checked again; it still reports `source_unavailable`
  with `local_thread_history_mode: absent` and `capture_performed: false`.

These tests validate the recorder changes, not live app capture. The remaining
dependency is an app history reader that returns this thread's authentic
public messages and metadata, or an authentic export containing them. Before
building an adapter, verify exact identity, original timestamps, complete
pagination and public-content coverage. A new local Codex thread would be a
different conversation and would not recover this Work conversation.

## Input versions

Hashes identify the pre-edit files at the commit above.

| File | SHA-256 |
| --- | --- |
| `tools/refresh_chat_history.py` | `f1b10131f166d0e7410fd6441f6207502243213f67b59f5765aae71fa16074d8` |
| `tools/tests/test_refresh_chat_history.py` | `f5ba6c23027fd75711ec5bba6ad17950e504a8ef221b42c10176dc9301c79e60` |
| `tools/CHAT_HISTORY.md` | `e9b8feabc94979e47f3e8af468519373ff046df7beff2eb8c30873a0204b865c` |
