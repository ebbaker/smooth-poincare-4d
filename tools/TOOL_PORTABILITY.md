# Tool portability and verification

21 November 2026, America/New_York. Prepared for Edward Baker with OpenAI
assistance. Exact executing backend and reasoning-effort metadata were not
available to this tool-transfer task. This is a software setup record, not a
research result or a live-conversation capture receipt.

## Transfer scope

Reused the author's existing general research support code, preserving source
copyright and license notices. No research computations, historical chat
archives, incident reports, result catalogs or investigation-specific data
were transferred with these tools.

- Moved the common conversation serializer to `tools/record_chat.py` and
  updated its callers and synthetic test fixtures.
- Set its default archive to repository-root `chat-histories/`; `--project`
  selects an existing direct project under `papers/investigations-1/`.
- Updated Claude adapter recorder paths, archive defaults, staging paths,
  repository-name handling and help text.
- Retained strict refresh/source validation and the paginated read-only
  adapter. No integrity, source-identity or unchanged-prefix check was relaxed.
- Adapted citation discovery to the repository's `CITATION.cff` files, skipping
  hidden directories and generated `output`, `tmp` and `build` trees. The
  validator still requires an explicitly supplied official CFF 1.2.0 schema.
- Replaced operational chat documentation with this investigation's guidance.
  No hooks, settings, global notification integrations or external databases
  were changed.

## Checks performed

| Check | Observed result |
| --- | --- |
| Synthetic chat source/integrity suite plus relocated-recorder CLI checks | 102 tests passed in 3.861 seconds |
| `--help` for refresh, shared recorder, project-export selector, both Claude adapters and citation checker | All six exited successfully |
| Parse transferred Python files | Passed |
| Scan tool text for predecessor program names, task labels and stale paths | No matches |

The two added CLI tests exercise actual imports into temporary repositories:
the root default writes under `chat-histories/`, and the named-project default
writes under `papers/investigations-1/<project>/chat-histories/`. They confirm
that moving the recorder did not redirect archives into `tools/`.

Run the suite with:

```sh
python3 -m unittest discover -s tools/tests -p 'test_*.py'
```

## Limits and deferred checks

- No live conversation was registered or captured in this task. Synthetic
  tests do not establish access to the current Work conversation or activation
  of any native completion hook. Follow [CHAT_HISTORY.md](CHAT_HISTORY.md).
- No current remote Claude endpoint or browser extractor was exercised. The
  retained adapters must reject unsupported sources; inspect their documented
  text/attachment coverage before importing.
- Citation-checker CLI loading succeeded; an official-schema validation of
  repository metadata was not performed by this task.
- Repository hygiene and manuscript builds are separate setup checks owned
  by the repository integration task.
- Tests ran with the available Python 3.10 runtime and standard library.
  Citation checker dependencies were available in that runtime; its pinned
  installation requirements remain in `requirements_metadata.txt`.

## Separation of foundational studies

The author subsequently separated the direct smooth Poincaré investigation
under `papers/investigations-1/` from earlier work under
`papers/initial-investigations/`. The builder and hygiene checker now use
explicit series/branch paths. The shared recorder and Cowork adapter accept
`--project NAME --series initial-investigations` for the earlier studies,
while their existing project default remains `investigations-1`. Root archive
behavior is unchanged. No real conversation was captured during this change.

Validation of this layout change: all 111 synthetic tests passed. The
shared-recorder and Cowork registration help commands load successfully;
`build_manuscripts.py --list` reports the three requested source paths.
Repository hygiene and imported-file hashes passed after the directory moves.
The added checks cover explicit initial-series routing despite same-named
projects, rejecting a series selection without a project, Cowork destination
selection, preservation of explicit history folders, and forwarding the series
to the shared recorder. No manuscript rebuild or live source capture was
needed or performed for this path-only change.
