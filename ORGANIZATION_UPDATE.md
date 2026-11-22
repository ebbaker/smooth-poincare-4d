# Organization correction — initial investigations

Prepared 21 November 2026, America/New_York, for Edward Baker with OpenAI assistance. Actual execution model and effort are not independently recorded. This is an organizational correction, not new research.

**Later application verification, 21 November 2026:** this layout is now
present in `/Users/ebbaker/Documents/smooth-poincare-4d`, and write access
is verified. The [repository audit](reviews/REPOSITORY_AUDIT_20261121.md)
records the repaired transfer omissions and successful checks. The application
status below is the earlier historical receipt. Nothing has been committed
or pushed by the audit.

| Role | Repository-relative destination |
| --- | --- |
| Direct smooth Poincaré investigation | `papers/investigations-1/01_chiral_metric_evolution/` |
| Earlier generalized-isothermal study | `papers/initial-investigations/01_generalized_isothermal_coordinates/` |
| Earlier descent and double-copy study | `papers/initial-investigations/02_chiral_descent_and_double_copy/` |

The author clarified that the two initial studies were not directly studying the smooth Poincaré conjecture. Their separation reflects that scope. Folder numbers are local to each collection. Scientific contents and stable task IDs remain intact; hyperlinks and generated-PDF destinations follow the new locations.

## Application status at preparation

At the beginning of this turn the standalone repository at `/Users/ebbaker/Documents/smooth_poincare_4d` was populated, with a clean working tree and one local commit ahead of its recorded origin/main. This session still reports `/Users/ebbaker/Documents/ChatGPT/Generalized Isothermal Coordinates` as its working directory; a fresh temporary-file write in the standalone repository returned `PermissionError: [Errno 1] Operation not permitted` despite the author's primary-folder change.

The correction is prepared in the existing writable setup tree. A patch against the observed standalone repository state and instructions accompany the updated package. Nothing has been applied, committed, or pushed to that repository by this correction. The older [SETUP_STATUS.md](SETUP_STATUS.md) remains a historical receipt for the original preparation.

The complete replacement tree includes local published reading copies and manuscript PDFs. The Git patch preserves the observed tracking choices while moving the existing tracked manuscript reading copies to their renumbered destinations. The package also includes all local reading copies. Do not overlay the new tree with the original install_setup.py: it intentionally refuses differing existing files.

Read [the paper index](papers/README.md) or [the continuation guide](CONTINUATION.md) for current navigation. [IMPORT_MANIFEST.json](IMPORT_MANIFEST.json) retains original source hashes and records the path revisions and the one further link-only edit.

During final validation the original standalone path became unavailable (`FileNotFoundError`). The correction package is based on the verified earlier local commit `d0cde0317aa3f4474ba4840292f91addff7ca3b9`, preserved in an isolated checkout. Its application was checked in a fresh checkout of that snapshot; current-path applicability must be checked again once the actual repository location is known.
