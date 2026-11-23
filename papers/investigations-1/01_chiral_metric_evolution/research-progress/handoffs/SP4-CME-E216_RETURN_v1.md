# SP4-CME-E216 return v1 — Rendered spectral manuscript audit

23 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Bounded visual check, configured gpt-6.2-sol / ultra. Independent runtime and lead settings are unavailable.

## Disposition

All 148 pages were visually checked using labeled contact sheets. Individual 1250-pixel Poppler renders were checked for pp. 1–8, 28–33, 72–75 and 145–148, covering front matter, new spectral statements and proofs, and all references. I also individually examined the 850-pixel renders of pp. 10, 19, 45 and 46. The pages are present and ordered. I found no visible clipping, overflow, collisions, footer overlap or missing glyphs in the focused review.

**Required fix.** Equation (6.17) on p. 30 prints “operatornamediag” as italic literal letters. At frozen TeX line 2247, under eq:stationary-cleared-block, restore the leading backslash to produce \(+\operatorname{diag}_{i<j}(2d_id_j)\). In the next build inspect the repaired page and any changed pagination. The certificate table fits. An optional p. 73 polish would bind “standard” to \(S^4\) to avoid a line containing only the symbol and period. The split of the Corollary 6.32 list across pp. 74–75 reads clearly. [Detailed review](../../reviews/E216_SPECTRAL_PDF_QA_20261123.md) · [Frozen source locator](../../manuscript/chiral_curvature_and_metric_evolution.tex#L2247)

## Verified identities and release

| Artifact | SHA-256 |
| --- | --- |
| [E216 request](SP4-CME-E216_REQUEST_v1.md) | b21318df352fdeee6483dd3fd1e0724ab555acb30d2000d9366254cd0e4f93f5 |
| [Frozen TeX](../../manuscript/chiral_curvature_and_metric_evolution.tex) | 334b666e5a0058048154d3a3e60e094ea02764f99c74f9e1e5eb536d787531fd |
| Scratch PDF, 1298023 bytes | 6e99d6f4c71bfebd60a033e78ff96409c06bd55b5da6d1fdb91cebd7df78da1d |
| [E216 visual review](../../reviews/E216_SPECTRAL_PDF_QA_20261123.md) | a5bafef6ecc8fcc70fdac94118e17681d06b88e7a517d81b8c0817a4da890c00 |

The frozen PDF and source were unchanged during this review. The visual freeze is released for the lead's repair and rebuild. This return's digest accompanies the handoff. Mathematical integration remains the separate E214 review.
