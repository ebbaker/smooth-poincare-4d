# E216 — Visual QA of the spectral manuscript build

23 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Bounded visual review, configured gpt-6.2-sol / ultra. Independent runtime and lead settings are unavailable. The separate mathematical review is E214.

## Disposition and exact repair

**One required typesetting repair.** PDF page 30, equation (6.17), prints the italic letter sequence “operatornamediag” in the cleared polynomial matrix. The PNG shows this directly. At frozen TeX line 2247 under label eq:stationary-cleared-block, restore the leading backslash before the existing operatorname argument. The resulting term is:

~~~latex
+\operatorname{diag}_{i<j}(2d_id_j)
~~~

This is a source typo in that display. The certificate table below it has clear columns and legible denominators. Equation labels and adjacent text fit. The rest of the checked material is visually clear at the stated inspection levels. [Frozen manuscript source](../manuscript/chiral_curvature_and_metric_evolution.tex#L2247)

An optional polish on p. 73 would bind “standard” to the math symbol in the last line of Corollary 6.31's conclusion, preventing the line containing only \(S^4\) and its period The exact source location is lines 6287–6288. The numbered alternatives of Corollary 6.32 split cleanly at the pp. 74–75 boundary. The remaining second item, its display, and the following proof are legible and in order. That break requires no repair.

## Inspected rendering and method

The frozen letter-size scratch PDF has 148 pages and 1298023 bytes, SHA-256 6e99d6f4c71bfebd60a033e78ff96409c06bd55b5da6d1fdb91cebd7df78da1d. Its path is /private/tmp/cme-broad-20261122-build/chiral_curvature_and_metric_evolution.pdf. The TeX SHA-256 is 334b666e5a0058048154d3a3e60e094ea02764f99c74f9e1e5eb536d787531fd. Both matched the [request](../research-progress/handoffs/SP4-CME-E216_REQUEST_v1.md) before and after inspection.

- **Every page, 1–148.** I viewed thirteen labeled contact sheets made from the supplied 850-pixel-high spectral-all PNGs. Sheets cover 001–012, 013–024, 025–036, 037–048, 049–060, 061–072, 073–084, 085–096, 097–108, 109–120, 121–132, 133–144, and 145–148. I checked page sequence, blank or missing pages, apparent margins, header and footer position, section breaks and gross overflow or collisions. Fresh 850-pixel Poppler renders from the frozen PDF of pp. 1, 30, 74 and 148 are byte-identical to the supplied PNGs.
- **Individual full-page review, 22 pages.** Fresh Poppler PNGs at 1250-pixel height were individually viewed for pp. 1–8 (title, abstract, contents and introduction), pp. 28–33 (new spectral subsection, stationary derivative lemma and certificate table, Theorem 6.5 and Proposition 6.6 with proof), pp. 72–75 (late accumulation context and Corollaries 6.31–6.32 with proofs), and pp. 145–148 (closing material and all references). I checked equation tags, multi-line displays, matrix/table alignment, new statement and proof transitions, citations, glyphs and page-end clearance. The abstract fits on p. 1, and the table of contents is clear on pp. 2–3.
- **Other individual checks.** I also viewed the original full-page 850-pixel PNGs of pp. 10, 19, 45 and 46 for representative math rendering, optical margin and bottom-display clearance. These confirm normal visible glyphs and in-frame displays. Across the full visual pass I found no clipping, overlaps, missing pages or footer collisions.

Supplementary diagnostics agreed with the visual margin checks. Poppler text-word boxes were within approximately x=69.98–544.01 points on the 612-point-wide page, with ordinary optical protrusion and wrapped URLs. PDF named destinations agree with the displayed anchors for §6.3, (6.17), (6.60)–(6.62) and the Fine and Fine–Krasnov–Panov references [10] and [17]. The relevant links and labels print legibly. The build log has no matching overfull, underfull, unresolved-reference or LaTeX warning lines. The missing backslash nonetheless prints incorrectly, as the fresh p. 30 raster shows.

Only scratch inspection outputs and the two assigned handoff artifacts were written. The disposition is for the frozen rendering. The repaired page and any pagination changes need visual confirmation in the next build.
