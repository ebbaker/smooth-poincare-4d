# Sources, reading copies and large files

Git holds editable sources, small records and the three first-party unfinished
draft PDFs. Generated outputs and third-party reading copies remain locally
available but are ignored. The setup imports existing materials; it does not
publish or redistribute them.

## Storage policy

| Material | Location and Git policy |
| --- | --- |
| TeX, Markdown, code, bibliography, small provenance records | Tracked in the relevant investigation or root collection |
| Current generated manuscript PDFs | Ignored root `output/pdf/<branch>/` |
| Original Baker draft PDFs | Tracked explicit exceptions in `references/unfinished_notes/` |
| Published third-party PDFs | Ignored local `references/` reading copies or an external archive; citations and metadata tracked |
| Large derived data, caches, build products | Ignored or external; generation scripts and small records tracked |
| Raw chat source exports | Outside the repository; only verified public-text archives may be tracked |

Keep tracked files below 1 MiB. An exceptional larger first-party source needs
a documented reason and explicit maintainer decision; do not add files above
5 MiB to Git. The existing three original draft PDFs are below the normal
limit. Never weaken ignore rules merely to make all local files appear in Git.

## Reproducible large data

When a calculation first produces large data, retain its generating script,
exact parameters, environment/dependencies, small result record and an
`ARCHIVES.md` guide in its investigation. Record stored-byte SHA-256 and, for
structured data, a documented canonical content hash where useful. Consumers
verify expected hashes before using external files and fail clearly if missing
or mismatched. Hashes identify inputs; arithmetic and analysis establish claims.

Use one documented lookup rule: repository-relative location first, then the
same relative path beneath an explicitly configured `SP4D_ARCHIVES` root.
Do not bake a maintainer's absolute path or download URL into code. No external
archive is assumed to exist at setup. Non-regenerable large inputs need a durable
identified deposit and provenance before a release can depend on them.

## Manuscripts and checks

Run `python3 tools/build_manuscripts.py` from the repository root to build
available working manuscripts into `output/pdf/`. The build tool documents its
TeX dependency. Sources remain in `manuscript/`; a compiled PDF is a reading
copy, not an independent check of the claims. Do not create timestamped source
snapshot folders; use Git and concise branch `DRAFT_HISTORY.md` entries.

Before committing, run `python3 tools/check_repository_hygiene.py`, inspect
`git status --short`, and verify suspect outputs with `git check-ignore -v`.
Before release, inspect tracked-file sizes and repository history as well.
Removing a file from the working tree does not remove an already committed blob
from history. History rewrites or force pushes require a separate deliberate
maintainer decision; they are not routine cleanup.
