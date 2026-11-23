# E226 Rendered QA of the 155-page spectral-margin manuscript

23 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Fixed E visual audit, configured gpt-6.2-sol/ultra.
Independent runtime and selected-lead settings are unavailable.
This audit concerns the frozen rendered manuscript. The parallel E234
packet owns the mathematical integration review.

## Disposition

**Visual coverage complete with three localized layout findings.**
The repaired two-row absorption display fits and has a clear equation
number. The certificate filename fits horizontally, but the suffix
wraps to the next line. The abstract and stationary theorem each
have a short continuation across a page boundary. I observed no
clipping, overflow beyond the text column, collisions, visibly missing
glyphs, or unreadable tables or references at the inspected sizes.

## Freeze and visual method

The scratch PDF was US letter, upright, 155 pages and 1,344,905
bytes by Poppler and the file check. The source was 575,651 bytes.
Both frozen SHA-256 identities matched the request. The ready
Poppler page rasters from margin-all-001.png through margin-all-155.png
were all present and measured 657 by 850 pixels.

I made eight contact sheets in the scratch build directory, with
five columns and up to four rows of whole-page thumbnails per
sheet, including all margins and page numbers. I opened and visually
inspected each sheet, covering 1–20, 21–40, 41–60, 61–80, 81–100,
101–120, 121–140 and 141–155. At that scale I checked page sequence
and baseline appearance, text-block fit, header/footer separation,
display and table placement, and prominent section and proof breaks.

I also opened each of the following original 657-by-850 raster pages
individually at its prepared render size.

| Pages | Detailed visual check |
| --- | --- |
| 1–8 | Title, author and date, abstract transition, both contents pages, introduction, displayed formulas, citation markers and first notation section. |
| 29–39 | Stationary tables and certificate filenames, statements, the spectral-margin and absorption formulas, proof transitions and running heads. |
| 77–82 | Late-sequence statement and proof, intermittent occupation and accumulated margin, equation labels and adjacent section transition. |
| 118–121 | Local scalar calculation, long inline and display formulas, scope paragraph and adjacent subsection entries. |
| 152–155 | References heading, numbered entries [1]–[40], long bibliography URLs and DOI wraps, legibility and terminal page. |
| 103–104 | Additional full-size spot check of the round-defect section, boxed display and adjacent section transition. |

These are 33 requested pages and two additional pages at the
prepared size. I freshly rendered pp. 31 and 37 directly from the
frozen PDF with Poppler at 120 dpi, producing 1020-by-1320 images,
and inspected both individually. This confirmed the two targeted
render outcomes. Scratch paths use e226-contact and e226-target
prefixes under /private/tmp/cme-broad-20261122-build.

As an auxiliary check on all 155 rasters, the grayscale ink
bounding boxes for a darkness cutoff of 85 stayed within horizontal
pixel columns 77–580 inclusive of page width 657. This is consistent
with the visual fit. The visual findings use the images.

## Located findings

1. **Page 31, corrected certificate filename, TeX 2382–2386.**
   The PDF prints the corrected generator name intact. The
   canonical record prints as `e218_stationary_spectral_range.`
   at the end of one line. The next line starts `json.` before
   “The independent verifier”. Thus all glyphs fit inside the
   column, while the filename itself still splits at its extension.
   The 120-dpi render confirms this. To display the full filename
   intact, give it a short sentence of its own with enough line width.
2. **Pages 1–2, abstract-to-contents transition, TeX 121–128.**
   The abstract ends p. 1 mid-sentence after “the stated”.
   Two abstract lines start p. 2 above the Contents heading.
   The lines are legible and entirely within the column. Keeping
   the abstract on p. 1 would remove this isolated carry-over.
3. **Pages 31–32, Theorem 6.6 opening, TeX 2422–2429.**
   Two lines at the foot of p. 31 introduce the theorem and stop
   after “Assume positive”. Page 32 starts with the rest of the
   hypothesis. The statement is intact. Keeping its opening and
   hypothesis together would improve the break.

## Targeted passes and remaining layout

- **Page 37, Eq. (6.29), TeX 2870–2877.** The revised aligned
  environment displays two distinct equation rows with clear
  column separation. The number sits to the right of their
  vertical center, with no collision or clipping. This holds in
  the prepared image and the direct 120-dpi render.
- **Pages 30–31 and 35–37.** The coefficient tables, exact
  integer denominators, spectral-margin constants, and neighboring
  absorption formulas fit. Table entries and headings are legible.
  The filename issue on p. 31 is recorded above.
- **Pages 77–82 and 118–121.** The inspected long formulas,
  labels, theorem and proof continuations, and subsection breaks
  remain legible. The weighted criterion's statement continues
  normally from p. 80 onto p. 81, with its two condition displays
  kept intact.
- **Pages 152–155.** The numbered bibliography is legible.
  Long URLs and DOI strings wrap inside the text column, and
  the visible continuation tokens remain in order. The last
  three entries on p. 155 finish above the normal footer.
- **Pages 103–104.** The round-defect title, box, proof and
  subsequent section heading show no crossing or collision.

## Identity and release

| Artifact | SHA-256 |
| --- | --- |
| [E226 request](../research-progress/handoffs/SP4-CME-E226_REQUEST_v1.md) | 54435884c1cc7e3ba84515431d354365576db98beb07fb46359f610c6f73fd01 |
| [Frozen TeX](../manuscript/chiral_curvature_and_metric_evolution.tex) | c323258c99562d4594810b527a4787628164bd67a26eb990bfac061518747573 |
| Frozen scratch PDF at /private/tmp/cme-broad-20261122-build/chiral_curvature_and_metric_evolution.pdf | 8757a855a8685ca87eed007d01a5a8d97cacfa698b69f29385494c1ee43b36ed |
| [Normal output checkpoint](../../../../output/pdf/01_chiral_metric_evolution/chiral_curvature_and_metric_evolution.pdf) | c75b9df6e3b1ca68d5633e5bf1e4d2b97cde39b53d7373a7449060475ce2a29e |

The normal output remains the separately verified 148-page,
1,297,999-byte checkpoint. Only the two assigned Markdown records
and scratch visual derivatives were written. The frozen scratch PDF
is released to the lead after the final identity check. The recorded
coverage does not establish mathematical or source verification.
[Prior output disposition](E208_E216_SPECTRAL_MANUSCRIPT_DISPOSITION_20261123.md).
