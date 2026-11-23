# E258 — Final review PDF layout verification

23 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Fixed E visual audit, configured
gpt-6.2-sol/ultra. Selected-lead settings and independent runtime
attestation are unavailable. I authored the earlier E247 visual
review and the E255 static-recognition audit. This is a render
check of the closing manuscript.

## Disposition

**Pass on the v3 freeze.** All 164 pages have verified visual
coverage. I inspected the v2 render of every page, then checked
all 164 v3 pages by exact decoded-pixel comparison. Pages 4–164
are identical at the all-page raster resolution. I individually
inspected each differing v3 page, 1–3, at 120 dpi and also opened
page 4 at the same resolution. The complete abstract now fits
on page 1. Contents begins cleanly on page 2, ends on page 3, and
the Introduction begins on page 4. I found no remaining substantive
fit, legibility or composition defect at the inspected resolutions.

## Frozen versions and files

| Input | Extent | SHA-256 |
| --- | --- | --- |
| [E258 request v1](../research-progress/handoffs/SP4-CME-E258_REQUEST_v1.md) | Original request, retained as provenance | 9def0f88e0623e62753ec03d21aa2468d44031e023354a50cd297f5f70ab5aa2 |
| [E258 request v2](../research-progress/handoffs/SP4-CME-E258_REQUEST_v2.md) | Full visual baseline for this audit | 45f556c22fb3371c0abf9e77444c3635b7441cc18b5d777556568dacae98ec69 |
| [E258 request v3](../research-progress/handoffs/SP4-CME-E258_REQUEST_v3.md) | Final checked request | c2c950a7e0b938251ef4a321ce447fc1d240198043b16a7fc5053b673f909ef3 |
| v2 TeX | 607,705 bytes | 8129fc53f5e4e0af38d8598caff867c5d8997f7246ec7a30fcafbee74d0a6b06 |
| v2 scratch PDF | 164 pages, 1,398,426 bytes | 57fb44a07a8f369b7d18e86895d889d7dc8e4a60456b872f77da3449f518f556 |
| [Frozen v3 TeX](../manuscript/chiral_curvature_and_metric_evolution.tex) | 607,395 bytes | 8f7c71f36835f62acdd587960d8b61108908dd3fc1b50ab8b74a2549752796f6 |
| Frozen v3 scratch PDF | 164 US-letter pages, 1,398,094 bytes | 980a26131a12036cd9002ce0018e71815f42d2c51cdb4014e3772cdcae6b73e9 |

The scratch PDF is
/private/tmp/cme-broad-20261122-build/chiral_curvature_and_metric_evolution.pdf.
The v1 source and PDF hashes were verified when v1 arrived. The
lead directed a hold for the two wording corrections incorporated
in v2. I did the full visual baseline on v2. The lead's v3
abstract edit addresses the only composition issue identified in
that baseline, the last three lines of the abstract carrying
over to page 2 immediately before Contents.

## Coverage and exact transfer

All raster files and comparison records are in
/private/tmp/cme-broad-20261122-build. Poppler produced both
all-page sets at 657 × 850 pixels. I visually opened each of
the nine PIL contact sheets for v2. Each sheet retained the
whole page rectangle with running heads and folios.

| Check | Pages and paths |
| --- | --- |
| Full v2 Poppler raster set | 1–164, e258-final-all-001.png through e258-final-all-164.png |
| v2 contact sheets actually viewed | e258-contact-001-020.png, 021-040, 041-060, 061-080, 081-100, 101-120, 121-140, 141-160, 161-164 |
| v2 120-dpi images individually viewed | 1–8, 14–19, 120–129, 148–152 and 160–164, 34 distinct images using the e258-detail prefix |
| Full v3 Poppler raster set | 1–164, e258-v3-all-001.png through e258-v3-all-164.png |
| v3 120-dpi transfer comparison | The same 34 pages regenerated at 1020 × 1320 using the e258-v3-detail prefix |
| v3 images individually reopened | 1–4, e258-v3-detail-001.png through e258-v3-detail-004.png |

Relative to the supplied 159-page global-cap-final-all baseline,
the v2 all-page decoded RGB comparison matched exactly 15
same-number pages, namely 4–5, 110–121 and 123. The remaining 149
differed. Whitening the centered folio box, and then instead
whitening both the running-head and folio bands, yielded no
additional exact matches. The full mapping is
e258-pixel-mapping.json, SHA-256
bd68584e67c9e0da24609382487ab476ab48b3d68d630d760526a9cc9853c4d5.
This comparison identifies repagination and changed raster output.
The all-page visual disposition was made from the new v2 images.

For v2 to v3, same-number SHA-256 comparisons of decoded RGB pixels
gave exactly pages 4–164 matching at 657 × 850, 161 in total.
The 120-dpi comparison independently gave exactly 31 matches
among 34 details. At both resolutions the differing pages were
exactly 1–3. I re-inspected all three in the v3 120-dpi images.
The comparison record is e258-v2-v3-pixel-mapping.json, SHA-256
c135eb2b9fd953964d4e2d4f2f706fbb976a48eec6757673aac8cb7a819b9273.
This transfers coverage of the unchanged layouts without using
PDF byte identity or text extraction as a substitute for visual
inspection.

## Located visual checks

- Pages 1–8. The title, author, date and complete amended abstract
  fit on v3 page 1 with clear space before the folio. The contents
  dot leaders and folios fit across pages 2–3. The introduction
  and its amended conjecture paragraph and references fit on
  pages 4–8, including the wording correction on page 6.
- Pages 14–19. The characteristic form displays and reconstruction
  headings fit. The two aligned chiral graph triples, the convention
  bridge and the neighboring formula numbers are readable on
  page 16. The curvature-map sign paragraph and numbered displays
  on page 18 stay within the text measure.
- Pages 120–129. The local and near-round proof transitions and
  numbered cutoff displays (12.5)–(12.7) remain legible. The closed
  cap statement is grouped on page 124. Its fixed-r proof and
  Gram comparison are readable on pages 125–126. The prescribed
  strict cap statement and its continuity proof flow across
  pages 126–127, and the hypersymplectic comparison on page 128
  has clear separation from the next section.
- Pages 148–152. The effective static criterion and its two
  displayed thresholds are on page 150. The endpoint comparison,
  exact minimum, ordered thresholds and curvature comparison on
  page 151 fit cleanly before the next subsection.
- Pages 160–164. The final scope section closes before References
  starts on page 161. References [1]–[4], [5]–[22], [23]–[37]
  and [38]–[41] appear on pages 161–164 respectively. Wrapped DOI
  and URL text stays in the column, including the new comparison
  reference [36]. The last entry is legible on the final page.

I wrote only the assigned QA and return plus scratch raster
derivatives and records. The checked PDF and source are released
to the lead at the requested pause checkpoint. The result concerns
visual layout.
