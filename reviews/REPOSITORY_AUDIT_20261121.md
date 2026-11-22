# Repository access, completeness and workflow audit

21 November 2026, America/New_York. Prepared for Edward Baker with OpenAI
Codex assistance. Actual backend model and reasoning effort were unavailable
in independently verified session metadata. This is repository housekeeping,
not an execution of any scientific B/E task.

## Outcome

Write access to `/Users/ebbaker/Documents/smooth-poincare-4d` is verified.
All 36 substantive original geometry files are represented and match the
recorded import hashes. The repository follows the general organization and
research workflows of `shifted-zeta-positivity`. The transfer defects found
below were repaired locally. No mathematical claim or research status was
changed.

The [machine-readable evidence](REPOSITORY_AUDIT_20261121.json) records all
36 mappings, current source and destination hashes, input versions, exclusions,
write-probe results and validation outcomes. The original
[import manifest](../IMPORT_MANIFEST.json) remains unchanged as provenance.

## Inputs and method

The destination was inspected at `main`, commit
`97d4bf0cba3cd1380dac22c6d3ef8ffc0fa92e01`, with origin
`https://github.com/ebbaker/smooth-poincare-4d.git`. Only `LICENSE.txt` was
tracked; the project materials were already present as untracked files.

The source was
`/Users/ebbaker/Documents/ChatGPT/Generalized Isothermal Coordinates`.
The prepared setup tree beneath its `output/smooth_poincare_4d_setup/`
was also compared, including its Git configuration and workflow files.

The workflow comparison used the current local files in
`/Users/ebbaker/Documents/shifted-zeta-positivity`, whose HEAD was
`f994d2df30a371cefd9be26e992452a91ad01a26`. The input hashes are recorded
separately from that commit because a working file need not equal HEAD.
The comparison covered the root instructions and setup, B/E, reference,
storage and public-history policies, the root skeleton, and the existing
localized-zero-correlations investigation's folder structure.

A uniquely named temporary directory inside the destination was used to
create a file, write and flush its bytes, read them back, rename it, read
it again, and delete it. All operations succeeded and the probe was removed.
This verifies working-tree writes, not permission to alter `.git` or push.

## Original-file coverage

| Original material | Files | Current home |
| --- | ---: | --- |
| Sphere manuscript, reading PDF and two notes | 4 | [Chiral metric evolution](../papers/investigations-1/01_chiral_metric_evolution/README.md); PDF under `output/pdf/01_chiral_metric_evolution/` |
| Wave manuscript, PDF, three audits, script and obstruction note | 7 | [Generalized isothermal coordinates](../papers/initial-investigations/01_generalized_isothermal_coordinates/README.md); PDF under `output/pdf/01_generalized_isothermal_coordinates/` |
| Double-copy manuscript, PDF and four derivation notes | 6 | [Chiral descent and double copy](../papers/initial-investigations/02_chiral_descent_and_double_copy/README.md); PDF under `output/pdf/02_chiral_descent_and_double_copy/` |
| Published reading copies | 15 | Ignored local files in [references](../references/README.md) |
| Author's unfinished draft PDFs | 3 | [references/unfinished_notes](../references/unfinished_notes/README.md); eligible for Git |
| Historical project overview | 1 | [Historical overview](../papers/research-overview/PROJECT_SUMMARY_2026-11-20.md) |
| **Total** | **36** | **No missing substantive source files** |

All 36 original files still match their recorded source hashes. All 36
destination files match their recorded destination hashes. Of those, 32
are byte-identical to their originals. The other four are Markdown files
with previously documented link-only repairs; their diffs were inspected.
No scientific text was changed by this audit.

The source inventory also contains 69 temporary render/build files,
136 prepared setup files, eight Python cache files and three OS metadata
files. These were classified separately rather than counted as additional
research. There were no other unmapped source files. The original
`chat-histories/` directory contained no conversation files to migrate.
The prepared setup's explicitly partial history was already present.

## Transfer defects and corrections

1. The earlier investigations had been placed under `papers/initial/`, while
   the documented layout, manifest, builder and recorder expected
   `papers/initial-investigations/`. Renamed that container to the expected
   location. Branch numbers, task IDs and contents were preserved. This
   resolved the 41 initial hygiene/import errors.
2. Seven prepared infrastructure files were missing: `.gitignore`, two
   GitHub workflow files, three issue templates and the pull-request
   template. Restored all seven byte-for-byte from the prepared setup tree.
   Before repairs, its other 129 files matched after accounting for the
   container name; there were no additional changed or missing setup files.
3. Corrected the current repository URL in `CITATION.cff` and the repository
   name/location in the three branch continuation prompts. Historical
   underscore-path receipts and the original import metadata were retained.
4. Updated current navigation to distinguish the completed local installation
   from earlier preparation receipts. Extended the hygiene check to require
   the restored infrastructure and all standard branch-purpose READMEs, so
   another incomplete transfer is detected.

## Comparison with the established workflow

| Pattern in shifted-zeta-positivity | Smooth Poincaré implementation | Assessment |
| --- | --- | --- |
| Root instructions, setup, B/E, reference and storage policies | Corresponding tailored root documents | Present and consistent |
| Numbered investigation families | One direct investigation in `investigations-1`; two earlier studies in `initial-investigations` | Matches the author's requested separation |
| Overview, plan, progress, notes, numerics and reviews | Present in all three branches | Complete |
| Brainstorm notes/explanations, handoffs, continuations and manuscript home | Present in all three branches | Complete |
| One live register per task family | One `research-progress/REGISTER.md` each for SP4-CME, SP4-GIC and SP4-DC | No competing live task ledgers found |
| B/E classification before execution and sustained bounded research | Fixed E01 audits, dependent B01 decisions and reserved E02 packets; selected model preserved | Consistent; research remains unactivated |
| Canonical references and point-of-use provenance | Shared catalog/BibTeX, branch reference pointers and explicit inspection limits | Structurally aligned; no new literature review claimed |
| Public chat identity, locks, prefix integrity and bounded completion capture | Adapted recorder/source utilities and explicit guidance | Infrastructure present; this conversation's source unavailable |
| Source-first Git storage and generated PDFs in root output | Ignore rules restored; source/draft exceptions verified | Correct locally |
| CI, contributions, issues, citations and release guidance | Two workflow definitions, contribution/issue templates, CFF and release policy | Present; remote execution not verified |
| Milestones rather than manuscript snapshots | Branch `DRAFT_HISTORY.md` files and root changelog | Present; scientific history preserved |

This is a tailored skeleton, not a copy of the Riemann project's scientific
portfolio. Its RH-specific `avoid/`, `result-summaries/`, collision controls,
older investigations and historical chats were not imported. The transferable
evidence rules are incorporated in the Poincaré instructions. Those catalogs
can be developed from this project's own assessed results when warranted.
The source project's empty folders do not require duplicate empty collections.

The local policy permits ignored published reading PDFs under `references/`;
the template generally stores these outside the checkout. Both exclude them
from Git. No DOI, Zenodo integration, release or existing research result was
invented to imitate a more mature repository.

## Validation and remaining operational status

| Check | Observed result |
| --- | --- |
| Repository hygiene after repairs and audit integration | Three branches, 280 relative links, zero errors |
| Import verification | All 36 destination hashes match; all 36 original hashes match |
| Existing tool test suite | 111 tests passed in 4.140 seconds |
| Manuscript build | All three compiled successfully into temporary audit output |
| Import Git policy | 18 source/draft candidates remain eligible; 15 published PDFs and three generated PDFs ignored |
| Source-candidate size check | No file over 1 MiB; largest was 247,203 bytes |

The builds preserved the imported manuscript PDFs. Compilation and synthetic
tests establish only their stated software/build outcomes. They do not
verify mathematical claims, visual PDF layout, official CFF schema validity,
or live remote CI execution.

The project files and these repairs are **not committed**. The existing
tracked tree contains only the license. A future checkout of that commit
therefore will not contain the research tree. No commit, push or Git-history
change was made by this audit.

The exact current thread ID was obtained from session environment metadata.
The recorder returned `source_unavailable`, with zero exact-ID source
candidates and no registration. The native title and current turn ID were
unavailable. No authentic live capture or deferred final capture is claimed.
An [unregistered partial public record](../chat-histories/UNREGISTERED_PARTIAL_ACCESS_AUDIT_20261121.md)
preserves the visible request and completed commentary only; it excludes the
unsent final response and does not replace a verified transcript.

For scientific continuation, the existing [continuation guide](../CONTINUATION.md)
remains authoritative. This infrastructure audit did not execute SP4-CME-E01
or either initial investigation's research tasks.
