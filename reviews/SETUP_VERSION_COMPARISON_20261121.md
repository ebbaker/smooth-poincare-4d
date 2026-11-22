# Setup-version integrity comparison

21 November 2026, America/New_York. Prepared for Edward Baker with OpenAI
Codex assistance. Actual backend model and reasoning effort were unavailable
in independently verified session metadata. Scope: file integrity and the
requested reorganization, with no scientific review or research activation.

## Finding

No corruption, missing baseline files or unexplained scientific changes were
found. The newly supplied `smooth_poincare_4d_setup` directly inside
`/Users/ebbaker/Documents/ChatGPT/Generalized Isothermal Coordinates` is the
earlier version, before separating the initial investigations. It was compared
with the reorganized setup under that folder's `output/`, and with the current
repository. Neither setup copy was modified.

All **133 baseline files** have counterparts after applying the intended moves.
Of the **36 imported research/reference files**, **35 are byte-identical**
between the earlier setup and the current repository. The remaining note,
`algebraic_restrictions_and_generalizations.md`, differs by exactly one
relative hyperlink: `../../02_generalized_isothermal_coordinates/` became
`../../01_generalized_isothermal_coordinates/`. A direct replacement reproduces
the entire new file exactly. All manuscript TeX, manuscript PDFs, reference
PDFs, derivation TeX, audit text and research code are otherwise unchanged.

This 35-plus-one comparison is between the two setup versions. The earlier
audit's 32-plus-four count compared the repository with the original research
folder before its first import/link repairs; the baselines differ.

## Intended folder changes

Paths below are relative to `papers/`.

| Earlier location | Current location |
| --- | --- |
| `investigations-1/01_chiral_metric_evolution/` | Unchanged |
| `investigations-1/02_generalized_isothermal_coordinates/` | `initial-investigations/01_generalized_isothermal_coordinates/` |
| `investigations-1/03_chiral_descent_and_double_copy/` | `initial-investigations/02_chiral_descent_and_double_copy/` |

The two corresponding `output/pdf/` folders were renumbered from 02/03 to
01/02. Stable research task IDs and mathematical evidence statuses remain
unchanged.

## Other differences inspected

The reorganization is not literally a directory-only byte diff. Of the 133
baseline files, 100 retain identical contents in the reorganized setup and
33 have related edits. These are navigation/path updates, replacement of
"supporting" with "initial" in organizational text, manifest/history records,
and builder/checker/chat-recorder support for two investigation collections.
The recorder adds explicit `--series initial-investigations` selection and
tests; its substantive source-integrity routines are unchanged.

The reorganized setup adds exactly three files: `ORGANIZATION_UPDATE.md`,
`papers/initial-investigations/README.md`, and
`tools/tests/test_series_routing.py`. No baseline file was deleted.

The current repository also contains the preceding audit's documented
infrastructure/navigation corrections and four audit/public-record files.
Its ten changed files relative to the reorganized setup agree with those
recorded corrections: root navigation/status/citation files, the required-file
checker and three continuation prompts. These are separately attributable
to the [preceding audit](REPOSITORY_AUDIT_20261121.md), not damage during the
interrupted generation.

## Verification and provenance

The [comparison evidence](SETUP_VERSION_COMPARISON_20261121.json) includes
all 133 old-to-new file mappings and SHA-256 hashes, the full changed/new
file lists, and the 36 research-file comparisons.

- The older setup passes its own hygiene/import check: three branches,
  252 relative links, zero errors, all 36 import hashes matching.
- The current repository passes hygiene/import checking: three branches,
  280 relative links before this new comparison record, zero errors,
  all 36 import hashes matching.
- No zero-length content files or missing mapped files were found.
- The previous 111 passing tool tests and three successful manuscript builds
  were not rerun: the relevant tool/test and manuscript contents had not
  changed since those checks. The changed reorganization code and documentation
  were inspected directly against the older setup in this comparison.

At the start of this comparison, the repository was clean at commit
`956403f8ad37fd107b1287fce1c3e5bc294175c0`, with 122 tracked files. This
supersedes the earlier audit's observation that only the license was committed.
This comparison adds only assessment records and updates the explicitly
unregistered partial public history; it changes no research or operational
code. The current conversation's exact source remains unavailable, so no
authentic live capture is claimed.
