# SP4-CME-E226 return v1 — Rendered spectral-margin manuscript QA

23 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Fixed E visual audit, configured gpt-6.2-sol/ultra.
Independent runtime and selected-lead settings are unavailable.

## Disposition

**Visual coverage complete with localized layout findings.**
I visually inspected all 155 prepared height-850 pages in eight
whole-page contact sheets and individually inspected the full-size
657-by-850 renders for 1–8, 29–39, 77–82, 118–121 and 152–155.
I additionally inspected 103–104 individually and viewed fresh
120-dpi direct Poppler renders of 31 and 37.

- **Page 31.** The corrected generator name prints intact.
  The canonical certificate filename remains within the
  column, but breaks after the dot before its extension.
  The suffix json. starts the next line before “The independent
  verifier”. The direct 120-dpi render confirms the split.
- **Pages 1–2.** Two abstract lines continue at the top of
  p. 2 immediately above Contents.
- **Pages 31–32.** The opening two lines of Theorem 6.6
  end p. 31 after “Assume positive” and its hypothesis
  continues at the top of p. 32.

The revised aligned Eq. (6.29) on p. 37 fits in two distinct
rows with a clear number, including in the direct 120-dpi
render. I observed no clipping, overflow past the text
column, collisions or visible glyph defects. The inspected
tables, late and weighted formulas, local scalar material
and bibliography are legible. The review records exact
locations and method. This is visual QA only.

## Verified identities

| Artifact | SHA-256 |
| --- | --- |
| [E226 request](SP4-CME-E226_REQUEST_v1.md) | 54435884c1cc7e3ba84515431d354365576db98beb07fb46359f610c6f73fd01 |
| [Frozen TeX](../../manuscript/chiral_curvature_and_metric_evolution.tex) | c323258c99562d4594810b527a4787628164bd67a26eb990bfac061518747573 |
| Frozen scratch PDF at /private/tmp/cme-broad-20261122-build/chiral_curvature_and_metric_evolution.pdf | 8757a855a8685ca87eed007d01a5a8d97cacfa698b69f29385494c1ee43b36ed |
| [Normal 148-page checkpoint](../../../../../output/pdf/01_chiral_metric_evolution/chiral_curvature_and_metric_evolution.pdf) | c75b9df6e3b1ca68d5633e5bf1e4d2b97cde39b53d7373a7449060475ce2a29e |
| [E226 review](../../reviews/E226_MARGIN_PDF_QA_20261123.md) | cce0a06b39a41271cd2849974945ec8d6a1717fc1a43db280e9df606b76b2039 |

Only the assigned review and return and scratch render derivatives
were written. The normal output remains the verified 148-page
checkpoint. The frozen scratch PDF is released to the lead.
