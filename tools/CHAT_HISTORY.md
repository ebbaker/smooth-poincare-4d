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
