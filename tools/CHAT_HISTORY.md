# Public research conversation archives

Prepared for Edward Baker with OpenAI assistance, 21 November 2026
(America/New_York). This operational guide does not assert that any native
completion hook or live source is available for the current conversation.

## Destination and provenance

Keep a conversation in one canonical `chat-histories/` directory. Use the
relevant investigation's folder for branch work and repository-root
`chat-histories/` for shared setup or program work. Preserve each registered
conversation's number, filename, original creation time and first-capture
provenance. A later move needs an explicit audited relocation; do not register
the same conversation in multiple destinations.

Record completed public user and assistant text, including visible commentary.
Never include system/developer instructions, internal reasoning, ordinary tool
traffic, subagent messages or binary runtime data. Raw exports and source
transcripts remain outside the repository. Source-specific converters declare
additional coverage limits, including attachment handling; do not present a
text-only conversion as an attachment-preserving export.

## Verify the actual source

Use the actual current conversation ID from trustworthy session metadata:

```sh
python3 tools/refresh_chat_history.py --thread-id ACTUAL_THREAD_ID --diagnose
```

Diagnostics are read-only and do not register a chat. Inspect the JSON fields:
an exit code of zero with `source.status: unavailable` is not successful
capture. `available` establishes discovery, not a completed integrity check.
The tool supports verified legacy JSONL and supported paginated SQLite source
schemas. A source explicitly marked as paginated cannot silently fall back to
a retained JSONL. Source database access is read-only.

`source.local_thread_history_mode` reports the exact local metadata lookup:
`paginated`, `legacy`, or `absent`. An explicit `--rollout` leaves that lookup
`not_inspected`; a failed lookup is `unresolved`. An absent database entry
does not exclude a valid exact-ID JSONL source, so inspect `source.status` too.
When both are absent, diagnostics explain that a completion hook cannot
create the missing source. A Work conversation's session ID alone does not
establish that its messages are persisted in the local Codex stores.

If local discovery fails, use the app's supported history reader or an
authentic export of the exact conversation. Record app-reader errors
separately from repository failures. Do not install or repeatedly adjust a
hook as a substitute for obtaining the underlying history. The
[21 November investigation](../reviews/CHAT_CAPTURE_DIAGNOSIS_20261121.md)
records one such source/API failure and the separate root-registry repair.

Do not guess a thread ID, turn ID, source path, native title, model, effort or
creation timestamp. Do not use another chat's accessible source as evidence
that this chat works. If the exact source is unavailable or unsupported,
report that limitation. Completed public text may be kept in a clearly
labelled unregistered partial record, without fabricated metadata or claims
of completeness; keep the prior verified archive unchanged.

## Register and refresh

For a new chat, use its actual title and selected destination:

```sh
python3 tools/refresh_chat_history.py \
  --thread-id ACTUAL_THREAD_ID \
  --history-dir papers/investigations-1/INVESTIGATION/chat-histories \
  --title 'Actual conversation title'
```

For earlier foundational studies, use the branch destination under
`papers/initial-investigations/`, for example
`papers/initial-investigations/01_generalized_isothermal_coordinates/chat-histories`.
The explicit-import recorder and Cowork adapter additionally support
`--project NAME --series initial-investigations`; without `--series`,
`--project` refers to the current `investigations-1` series.
For repository-wide work use `--history-dir chat-histories`. Supply
`--rollout /actual/path/source.jsonl` only when that exact source is known and
appropriate. The default source search uses `$CODEX_HOME/sessions` or
`~/.codex/sessions`, with the exact identity checks in the source adapter.

Refresh an already registered chat at the beginning of a new turn:

```sh
python3 tools/refresh_chat_history.py --thread-id ACTUAL_THREAD_ID
```

An unregistered chat is skipped; `skipped_unregistered` is not a capture.
Automatic registration lookup covers both repository-root history folders
and the investigation history folders under `papers/`; an explicit
destination must not create a second registration for an existing chat.
Verify the returned success status and the registry's recorded counts,
source/configuration metadata, sizes and hashes. Hashes establish byte
identity, not scientific validity. Never hand-edit a registered JSON archive.

## Capture a completed final reply

An in-turn capture cannot contain the unsent final reply. When the actual
current turn ID and local source are available, the final tool action may
start a bounded deferred worker:

```sh
python3 tools/refresh_chat_history.py \
  --thread-id ACTUAL_THREAD_ID \
  --after-turn ACTUAL_TURN_ID --wait-seconds 60 --defer
```

The worker waits for the real public final message and completed status of
that exact turn, refreshes the same archive, then exits. It does not schedule
future research. Its launch is not proof of capture: inspect its result or
refresh the archive next turn. Report timeout or source failure honestly.

No active hook is installed by this scaffold. A locally supported, trusted
completion hook can call the tool's `--hook` mode, but activation must be
verified through an observed actual capture. Keep existing notification
integrations intact and follow the platform's normal trust process. A hook
cannot create an absent or unsupported conversation source.

## Integrity and concurrency

Use `refresh_chat_history.py` for live Codex/Work archives. It holds a shared
`.chat-history-refresh.lock`, validates the unchanged public-message prefix,
checks source identity and timestamps, and stages paired archive/index writes
in `.chat-history-transaction/`. Never delete guards or transaction state to
bypass an inconsistency. Preserve prior verified files when a refresh fails.

The standalone import and Claude converters are not substitutes for this
serialized refresh wrapper. Serialize their writes with all other writers;
do not run them concurrently on the same registry. An explicit repair option
is for an independently established discrepancy and is never a routine way to
force acceptance of a rejected source.

Archives and registries have a 1 MiB limit. Oversized sources require the
external-archive procedure in [LARGE_FILES.md](../LARGE_FILES.md); do not
truncate them to pass. Unsupported content or schemas must be reported and
reviewed before adding an adapter.

## Explicit imports and tests

`extract_project_chats.py` selects exact titles or an observed project ID from
an author-provided export. Inspect its diagnostic report before importing.
`record_chat.py --import-json ... --folder ...` imports a selected conversation;
account-wide imports require deliberate selection. Claude adapters describe
their coverage in `--help` and module documentation. Retained browser extractor
text is a manual, source-dependent utility; this setup does not execute it or
verify any current remote service endpoint.

Run the synthetic integrity/source suite:

```sh
python3 -m unittest discover -s tools/tests -p 'test_*.py'
```

Passing fixtures establishes tested behavior for their source forms. It does
not establish live capture, native hook activation, or support for a changed
application database schema.

## Claude Cowork sessions

Added 23 November 2026 (America/New_York) for Edward B. Baker III at his
request, with LLM assistance: Claude Fable 5.2 (`claude-fable-5-2`), Claude
Cowork, reasoning effort max as the session's configuration records it. The
sections above describe Codex and Work conversations and are unchanged. The
standing rule for Claude sessions is in [AGENTS.md](../AGENTS.md).

### Source

[record_Claude_cowork_chat.py](record_Claude_cowork_chat.py) captured a
Cowork session from a transcript file in the session's cloud workspace. On 23
November 2026 a Cowork session had no such file: `~/.claude/projects` did not
exist, no `*.jsonl` file was on the workspace's disk, and the runtime process
held no transcript open. That script cannot capture a Cowork session on this
runtime; it still serves wherever a transcript file exists.

The session's event log on claude.ai was complete.
[record_Claude_browser_chat.py](record_Claude_browser_chat.py) reads it in a
browser signed in to claude.ai, keeps only the public records in the page,
and passes them through the chat with a SHA-256 check;
[record_Claude_export_chat.py](record_Claude_export_chat.py) converts them
and `record_chat.py` registers the result. The reader calls two endpoints
that are internal to the web app, `GET /v1/code/sessions/{id}` and
`GET /v1/code/sessions/{id}/events`. They answered for one session on 23
November 2026. That is an observation about that day, not a supported
interface: if they fail or their fields change, report it and leave the
registry as it is.

### What a record holds

Messages typed by the person, the options selected in question cards, the
text ending each completed turn, notes and file-card captions sent through
tools, and question cards rendered as text. Progress updates between tool
calls are kept in the form the log holds, which on this runtime is a
condensed rewrite of what the assistant wrote and not its verbatim text;
each such message says so in its metadata (`kind: update`). The log holds no
reasoning text. System and harness text, the session's system prompt, other
tool calls and outputs, permission prompts, usage figures and subagent
messages never leave the page. Neither the event log nor the reduced store
(`~/.cache/cowork-chat-events/` on the machine that runs `ingest`) is kept
in the repository; each record stores their hashes.

### Destinations

Repository-wide Claude conversations go to
[chat-histories/claude-cowork](../chat-histories/claude-cowork/README.md);
a conversation about one investigation goes to that investigation's
`chat-histories/claude-cowork/`. These registries are separate from the
Codex registries beside them: `refresh_chat_history.py` looks only in folders
named `chat-histories`, so it neither sees nor rewrites a `claude-cowork`
index. Keep one registration for a session; `ingest` refuses a second.

### Procedure at the end of every turn

SESSION is the session id: `cse_` followed by the suffix of the session link
`https://claude.ai/code/session_…`. In the cloud workspace,
`mount | grep -o 'cse_[0-9A-Za-z]*' | sort -u` prints it,
`$CLAUDE_CODE_SESSION_ID` is the SDK session id and `$CLAUDE_PROJECT_UUID`
the attached project. Run the repository commands on the computer, from the
repository root.

1. `python3 tools/record_Claude_browser_chat.py status --session-id SESSION`
   prints the registry that holds the session, `since_seq`, and the read to
   run.
2. In a claude.ai page of the signed-in browser, run that read, for example
   `await window.rhCoworkRead('SESSION', 399)`. If the page answers that
   `rhCoworkRead` is not a function, first run the text that
   `python3 tools/record_Claude_browser_chat.py script` prints. The page
   answers with the SHA-256 of the installed reader, which must equal the
   `reader_sha256` that `status` prints.
3. Pass the object the read returned to `ingest` on standard input, exactly
   as shown:

   ```sh
   python3 tools/record_Claude_browser_chat.py ingest \
     --registry chat-histories/claude-cowork \
     --sdk-session-id ACTUAL_SDK_SESSION_ID \
     --project-name 'Actual project name' --project-uuid ACTUAL_PROJECT_UUID <<'EOF'
   {"body": {...}, "body_bytes": 12283, "format": "rh-cowork-session-read/1", "sha256": "..."}
   EOF
   ```

   Add `--new-registry` when the registry has no `index.json` yet, and
   `--delivered PATH` for each file the session wrote with shell commands.
   The registry and the project need stating only at the first capture. If
   `ingest` prints `"more": true`, repeat steps 2 and 3 with the
   `next_read` it gives; it registers after the last part.
4. First capture only: add the README entry that `ingest` prints, with its
   Work sentence written, to the registry's README.

Make this the last repository action of the turn. A capture made during a
turn cannot hold that turn's reply; the reply enters at the next read.

### Completing an earlier record

`python3 tools/record_Claude_browser_chat.py pending` lists registered
Cowork sessions whose last turn was still running at their last capture,
which is how every session's record ends until its log is read once more.
A later session completes one with the same three steps, leaving out
`--sdk-session-id`, since the log is then another session's. The standing
authorization in [AGENTS.md](../AGENTS.md) covers a session's own log only:
ask the author before reading another session's log, whether to complete a
registered record or to record a session listed as awaiting capture.

### When the browser route is not available

The route needs a browser the session can drive that is signed in to
claude.ai. Signing in is the author's step; a session never enters
credentials. If no such browser is connected, the sign-in has lapsed, or an
endpoint fails, do not look for another route to the log. Say so in the
reply and add the session, with its id, title and date, under "Awaiting
capture" in the registry's README, so that a later session can record it
from its log. A clearly labelled `UNREGISTERED_PARTIAL_…` record of public
text remains an option when it is useful; it is never a registration.

### Integrity

`ingest` uses a read only after three checks. The body must hash to the
SHA-256 the page computed, so a slip in copying it through the chat is
caught and nothing is stored. The read must name the SHA-256 of the reader
text in this repository, so a mistyped or older reader is refused. With
`--sdk-session-id`, the log must name that SDK session, which ties the log
to the running session rather than to a guessed id. Text travels in ASCII
(`~uXXXX` for a UTF-16 code unit outside printable ASCII, `~~` for a tilde)
and is decoded after the hash check.

A refresh adds the records after `since_seq` to the store, converts the
whole store and refreshes the same chat number and file. `record_chat.py`
refuses a shorter or older refresh, and `ingest` takes the refresh tool's
registry lock while it writes. A session whose store is missing on the
machine, for example a later session completing an earlier record, reads
again from sequence 0 and rebuilds it. Do not hand-edit a registered record
or its index. Records and indexes stay below 1 MiB; an oversized
conversation needs the external-archive procedure in
[LARGE_FILES.md](../LARGE_FILES.md).

The synthetic tests in `tools/tests/test_browser_capture.py` cover the
transfer, store, conversion and registration, and run the reader itself
under Node when Node is installed. They do not contact claude.ai and do not
show that the live endpoints still answer.
