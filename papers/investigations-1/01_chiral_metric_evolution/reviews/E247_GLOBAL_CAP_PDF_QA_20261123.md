# E247 — Global-cap manuscript rendered QA

23 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Fixed E visual verification, configured
gpt-6.2-sol/ultra. Selected-lead settings and independent runtime
attestation are unavailable. I authored the E226 and E239 visual
baselines and the E245 conditional cap-crossing implication. This
review checks the rendered pages and typesetting of the new material.

## Disposition

**Pass.** All 159 pages received whole-page visual inspection. I
inspected every changed or added page individually. The new global-cap
statement, its proof and the contiguous pages received 120-dpi
inspection. I found no substantive clipping, overlapping text,
unreadable formula labels or disrupted page structure at the inspected
sizes.

## Exact inputs

| Input | Extent | SHA-256 |
| --- | --- | --- |
| [E247 request](../research-progress/handoffs/SP4-CME-E247_REQUEST_v1.md) | 2,062 bytes | 439e089eab6097c3e29a770f90ac939046e3301142b6e142e006be21b98ff8d5 |
| [Frozen TeX](../manuscript/chiral_curvature_and_metric_evolution.tex) | 588,116 bytes | 9f0352529530329f7776aef985d58cda6aa283996fe23bf2ef3301254b3ffd13 |
| Frozen scratch PDF at /private/tmp/cme-broad-20261122-build/chiral_curvature_and_metric_evolution.pdf | 159 US-letter pages, 1,366,804 bytes | f9b5fb08b7a31908f1479689d67d2ad0b5a0511f47842ee96969b4ac451ba23a |
| [E239 baseline review](E239_FINAL_SHARP_MARGIN_PDF_QA_20261123.md) | 7,981 bytes | d86931e48f2a5575ebe0bf47fe8d463ff5d2801d7a73a05922313870efd9b943 |
| [Normal PDF checkpoint](../../../../output/pdf/01_chiral_metric_evolution/chiral_curvature_and_metric_evolution.pdf) | 157 pages, 1,352,720 bytes | 9fe90901633f5bae5ec927946a25aed7b1be6ad96b6f4821cc2783a129667d01 |

## Pixel comparison and visual coverage

Both baseline and final raster sets were complete at 657 × 850
pixels. I compared SHA-256 hashes of decoded RGB pixels from
margin-delivery-all-001.png through -157.png and global-cap-all-001.png
through -159.png in the scratch build directory. After identifying
full-page matches, I also compared pages with only a fixed folio
rectangle whitened, inclusive coordinates x = 298–359 and y = 791–819
in the original rasters.

| Final pages | E239 baseline mapping | Count |
| --- | --- | --- |
| 1–2, 4–121 | Exact decoded RGB match to the same numbered page | 120 |
| None | Additional match after masking the folio | 0 |
| 3, 122–159 | No match in either comparison | 39 |

The scratch e247-pixel-mapping.json gives the exact paired indices and
the complete list of changed or added final pages. Its SHA-256 is
dc2493cfe58146702ad72110a15bc818872b3781b5d5b147a16921c0636a4f17.

I visually inspected all eight PIL contact sheets, covering pages
1–20, 21–40, 41–60, 61–80, 81–100, 101–120, 121–140 and 141–159.
They retained complete page rectangles, including running heads and
folios. I opened pages 1–3 and 128–159 individually at the original
657 × 850 raster size. I separately rendered and opened pages 121–127
one by one at 120 dpi, 1020 × 1320, using Poppler directly on the frozen
PDF. The combined individual coverage was 42 distinct pages, namely
1–3 and 121–159. This includes all 39 unmatched pages. No additional
suspect page required a separate render.

## Located checks

- Pages 1–3. The title, author, date and full abstract fit on page 1.
  The contents begin on page 2 and close on page 3. The page 3 leaders
  and right-aligned folios fit and reflect the later pagination.
- Pages 121–122. The preceding spectral-motion material and its
  proof continuation fit. Proposition 12.6 begins on page 122 with
  its heading and complete statement together. The first part of
  the proof and its bottom display remain clear of the folio.
- Pages 123–124. The Taylor and gap estimates, the cutoff curvature
  identity and the parameter-pair comparison are readable. The
  displays labeled (12.5)–(12.7) fit, including the multirow (12.7).
  The original-flow crossing and strict-cap consequences, and the
  automorphism paragraph, finish cleanly before the proof square.
  The scope paragraph and Section 12.3 start clearly below.
- Pages 125–127. The adjacent concentration, endpoint, and
  multiscale material reads continuously through the new page breaks.
  The displays and reference labels fit in the column.
- Pages 128–155. I checked the reflowed pages individually for
  formulas, section openings, proof continuations and margins.
  There was no substantive visual defect.
- Pages 156–159. Section 16 finishes and References begins on page
  157. References [1]–[10], [11]–[26] and [27]–[40] fit on pages
  157, 158 and 159 respectively. DOI and URL text remains inside
  the column, including the wrapped author-hosted links on pages
  158–159. The last reference and the folio are clearly separated.

The review uses the rendered images for the visual disposition. The
source and PDF were read-only, the bibliography was inspected for
layout, and this packet makes no new mathematical or bibliographic
assessment. The normal PDF retains the verified 157-page checkpoint.
The frozen source and scratch PDF are released to the lead.
