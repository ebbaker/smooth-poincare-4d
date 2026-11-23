# E239 Final rendered QA for the 157-page sharp-margin manuscript

23 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Fixed E visual review, configured gpt-6.2-sol/ultra.
Independent runtime and selected-lead settings are unavailable.
I authored the baseline E226 visual audit and the E235 all-ratio
derivation. This packet verifies only the appearance of the current
frozen manuscript, including the citation precision requested in E237.
[E226 baseline](E226_MARGIN_PDF_QA_20261123.md) ·
[E237 audit](E237_ALL_RATIO_MANUSCRIPT_AUDIT_20261123.md).

## Disposition

**Pass.** All 157 final pages received visual coverage. All three
E226 repairs are present in the rendering. The E237 equation
cross-reference and adjacent displays render clearly. I observed
no clipping, text-column overflow, collisions, missing glyphs,
broken filenames, malformed displays or substantive layout defect
at the sizes inspected.

## Exact visual coverage

The frozen source is 579,519 bytes. The frozen scratch PDF is
1,352,720 bytes, with 157 upright US letter pages by Poppler.
Every prepared final page raster from margin-delivery-all-001.png
through margin-delivery-all-157.png exists at 657 by 850 pixels.
Both frozen file identities and the two audit input identities
matched the request before inspection and at release.

I made and visually opened eight new whole-page contact sheets
showing 1–20, 21–40, 41–60, 61–80, 81–100, 101–120, 121–140
and 141–157. The thumbnails show margins, page numbers, text
blocks and display placements. Every final page was visually
inspected at this overview scale, including every page that
differs from the earlier 155-page baseline.

I also opened the 25 pages below individually at their
prepared 657-by-850 size.

| Pages | Detailed visual check |
| --- | --- |
| 1–3 | Entire abstract, Contents opening and second contents page. |
| 26–27 | Printed target equation (6.7) and its proof layout. |
| 31–34 | Certificate, repaired filename, stationary theorem opening and adjacent statement and proof reflow. |
| 35–39 | Effective and strict-margin displays, pointwise absorption statement and proof, and adjacent section breaks. |
| 80–82 | Accumulated-margin statement and proof, both numbered displays, and adjacent critical-budget subsection. |
| 120–123 | Earlier local proof conclusion, new all-ratio statement and proof, cross-reference and adjacent subsection. |
| 154–157 | Bibliography heading, entries [1]–[40], link wraps and last page. |

This includes all 18 requested full-size pages, both pages changed
from the intermediate 157-page rendering, and seven additional
neighbor or reference-target pages. I also opened fresh 120-dpi
Poppler renders of pp. 121 and 122, at 1020 by 1320 pixels,
directly from the frozen PDF. At these sizes I checked display
legibility, signs and glyph shapes, clear numbering, and title,
statement, proof and citation breaks. The remaining pages received
the stated overview coverage. Page 26 was included to verify the
rendered equation number used on p. 122.

All scratch derivatives use e239-contact or e239-target prefixes
under /private/tmp/cme-broad-20261122-build. An auxiliary darkness
cutoff of 85 on all final grayscale rasters bounds visible ink
horizontally in columns 77–580 of 657, consistent with the visual
check. The visual disposition comes from the opened images.

## E226 baseline and exact page mapping

The previous 155-page E226 visual review is the baseline. The
page sets checked by decoded-RGB pixel hash were the E226
margin-all rasters, the intermediate 157-page margin-final-all
rasters and the final margin-delivery-all rasters. The mapping
below uses final page numbers first. A secondary comparison
whited out only the fixed folio rectangle \(x=298,\ldots,359\),
\(y=791,\ldots,819\) in both page images, with zero-based
coordinates. It establishes equality of all pixels outside
that small footer window.

| Comparator | Exact match | Match outside folio window only | No match |
| --- | --- | --- | --- |
| E226 155 pages | Final 4–30 correspond to baseline 4–30, 27 pages. | Final 119–120 correspond to baseline 118–119. Final 133–134 correspond to 131–132. Final 137–139 correspond to 135–137. Final 141–157 correspond to 139–155. Total 24 pages. | Final 1–3, 31–118, 121–132, 135–136, 140. Total 106 pages. |
| Intermediate 157 pages | Final 1–120 and 123–157 match the same page numbers, 155 pages. | None. | Final 121–122. |

The complete ordered pairs and nonmatch lists are in scratch
e239-pixel-mapping.json, SHA-256
54468f744ab2e8f4be8cbb2dfee979993f4611604375d7cf13379cabc4f8253e.
The image comparison supplements the new final visual coverage.

## Repairs and focused checks

- **Pages 1–3.** The abstract finishes on p. 1 above its
  folio. Page 2 opens with Contents, and p. 3 continues it
  normally. The prior two-line abstract carry-over is gone.
- **Page 31.** The canonical filename e218_stationary_spectral_range.json
  is fully visible on one centered typewriter line.
  The generator and independent verifier names remain legible,
  and the coefficient table and denominator displays fit.
- **Pages 31–32.** Page 31 ends with the preceding lemma proof.
  Theorem 6.6 starts at the head of p. 32 with its opening,
  hypotheses and conclusion together. The earlier two-line
  opening at the foot of p. 31 is gone.
- **Pages 35–39.** The spectral-margin constants in (6.24)–(6.26)
  and absorption displays in (6.27)–(6.29) fit. The two-row
  alignment in (6.29) on p. 37 keeps its label clear. The
  absorption statement ends on p. 36 and its proof starts
  cleanly on p. 37.
- **Pages 80–82.** The accumulated-margin corollary continues
  normally to p. 81, with the formulas (6.71) and (6.72) intact.
  The nearby proof and subsequent subsection have clear spacing.
- **Pages 121–122.** The new all-ratio proof continues from its
  scalar Hessian to the original-velocity paragraph. At the top
  of p. 122, the blue cross-reference reads (6.7). It is the
  number printed beside the nonlinear quotient identity on
  p. 26. In the frozen source, line 10629 calls the exact
  flow:nonlinear-Q label at line 1976. The adjacent tangent,
  scalar and native-clock lines and equations fit, and the
  proof end precedes the scope paragraph and next subsection.
  The 120-dpi check confirms the formulas and spacing.
- **Pages 154–157.** The bibliography is legible and the visible
  URL and DOI wraps stay within the column. Each entry is
  visually complete, with normal final-page whitespace below
  the last entries and a clear footer.

## Verified versions and release

| Artifact | SHA-256 |
| --- | --- |
| [E239 request](../research-progress/handoffs/SP4-CME-E239_REQUEST_v1.md) | 372c547df50460b2c37000043a64259f4c292d5e2be9592b0156c4b99b9d9aec |
| [Frozen TeX](../manuscript/chiral_curvature_and_metric_evolution.tex) | fdce3e4ce268a410ab97cc2650a6e1110b74c8237b895c522f04aabd288319e3 |
| Frozen scratch PDF at /private/tmp/cme-broad-20261122-build/chiral_curvature_and_metric_evolution.pdf | 9fe90901633f5bae5ec927946a25aed7b1be6ad96b6f4821cc2783a129667d01 |
| [E226 baseline review](E226_MARGIN_PDF_QA_20261123.md) | cce0a06b39a41271cd2849974945ec8d6a1717fc1a43db280e9df606b76b2039 |
| [E237 audit](E237_ALL_RATIO_MANUSCRIPT_AUDIT_20261123.md) | 1990c0e27675802d6cd698790c6317f5944cc0867abb1fa93faa62033cd175ef |
| [Normal 148-page checkpoint](../../../../output/pdf/01_chiral_metric_evolution/chiral_curvature_and_metric_evolution.pdf) | c75b9df6e3b1ca68d5633e5bf1e4d2b97cde39b53d7373a7449060475ce2a29e |

Only the two assigned records and scratch image derivatives and
mapping were written. The normal output remains the separately
verified 148-page checkpoint. The frozen source and scratch PDF
are released to the lead. The disposition establishes the stated
visual checks, with no separate mathematical or source audit.
