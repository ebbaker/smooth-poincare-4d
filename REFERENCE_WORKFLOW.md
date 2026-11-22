# Reference workflow

21 November 2026, America/New_York. Prepared for Edward Baker with OpenAI
assistance; actual setup model/effort not independently recorded.

Record relevant literature when it is found, not only at manuscript preparation.
The [root reference index](references/README.md) owns shared references and the
author's unfinished drafts. Branch reference indexes link the canonical record
and explain the specific use. Keep one canonical record per source/version;
link rather than duplicate annotations and bibliography entries.

Each record should contain:

- Exact author/title/publication or preprint identifier, version/date and stable
  primary link when known; distinguish the inspected version from newer work.
- Relevance and the consuming note, claim or manuscript section.
- Exact theorem/equation/section/page used, including hypotheses, category,
  signature, normalization, regularity, quantifiers and limiting regime.
- Inspection level: inherited pointer, discovered, abstract only, checked
  passage, or full reading. A stored PDF is not evidence of a checked theorem.
- Actual retrieval/inspection date, corrections or unresolved metadata; for a
  reading copy, its source URL, local path, size and SHA-256 when available.

Maintain a short index and reusable BibTeX bibliography. Record unknown data
as unknown; do not infer retrieval dates or claim new source inspection merely
because material was imported. Preserve earlier version records when a new
version is checked. A file hash establishes identity, not mathematical truth.

Cite at the point of dependence. Before importing a new theorem, read its
primary source and retain its full relevant hypotheses. For this investigation,
check especially smooth versus analytic/holomorphic settings, Riemannian versus
neutral signature, local versus complete/global conclusions, and assumptions
on definite connections or curvature. Attribute known arguments even when a
similar local derivation preceded discovery of the source. Verify novelty
claims against primary literature before using them.

Use short original annotations, not copied abstracts or substantial article
text. Keep third-party PDFs out of Git, as described in
[LARGE_FILES.md](LARGE_FILES.md). Existing authorized reading copies may remain
in ignored `references/` locations; future external archives use a documented
location without machine-specific paths in code. Download only from authorized
sources, verify the response is a PDF, and do not silently overwrite a different
version. Missing access is recorded, not bypassed.

The original Edward Baker draft PDFs in `references/unfinished_notes/` are
first-party historical sources and explicit tracked exceptions. Their inclusion
preserves the motivation of this program, not a claim of completed proofs.
Backfill citations as investigations resume; describe the actual extent of
that work rather than claiming a complete literature audit.
