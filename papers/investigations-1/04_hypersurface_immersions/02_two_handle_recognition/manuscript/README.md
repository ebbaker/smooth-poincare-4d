# Recognition of smooth homotopy four-spheres from marked Morse heights

[Standalone LaTeX manuscript](recognition_from_marked_morse_heights.tex) by Edward B. Baker III, prepared with OpenAI Codex assistance, 25 November 2026 (UTC). Bounded editorial and proof consolidation E51b at base `483ad3cef5a0af4328c5d35cabbc1f5224d26b1e`. GPT-6.2 Sol/ultra requested. Actual serving model and reasoning effort were unavailable.

The manuscript proves the marked two-tree reduction for any Morse function on a smooth homotopy four-sphere, derives the indexed Gauss-map average and the inclusive \(64\pi^2/9\) immersed recognition bound, and specifies sufficient conditions for a marked presentation with two middle handles. The one-sided case uses an unknotted component or tunnel number one. The mixed case uses a geometric belt intersection or an intermediate cut diffeomorphic to \(S^3\) or \(\#_2(S^1\times S^2)\). The tests preserve the original smooth domain and its gluing. A two-birth embedding of the standard sphere illustrates the actual framing. Quantitative subcritical entry on arbitrary smooth types and selection of a recognized diagram remain open.

## Build

[Reading copy (PDF)](../../../../../output/pdf/04_hypersurface_immersions/02_two_handle_recognition/recognition_from_marked_morse_heights.pdf) · Build from the repository root with `python3 tools/build_manuscripts.py 04_hypersurface_immersions/02_two_handle_recognition`.

## Evidence and input revisions

The [branch overview](../research-overview/OVERVIEW.md), [plan](../research-plan/PLAN.md), [live register](../research-progress/REGISTER.md) and [source catalog](../references/README.md) remain the project navigation. The manuscript uses the [shared bibliography](../../../../../references/references.bib). The primary passages used in the handle and birth arguments are identified below.

| Input at the frozen base | SHA-256 |
| --- | --- |
| [Master immersion section](../../../../master/manuscript/immersion_entry.tex) | `cf7a5e72e147772f23a657d070ea78ac7c7fceeda0f51871f40026cc17d2dd62` |
| [E26, exact total height count and low-count topology](../../../../master/reviews/E26_FOUR_CRITICAL_HEIGHTS.md) | `89eaa2b1692c32f5a42af4c7cc49e37fd63341e240997e2bcfceffa6f2440856` |
| [E33, tree reductions and index-two average](../../../../master/reviews/E33_INDEX_TWO_HANDLES.md) | `8e8d0078213eb5367c2ff35ae26d7bda246d101e522ac1283e3520765c6b62e8` |
| [E34, middle Weyl estimate and Codazzi strictness](../../../../master/reviews/E34_MIDDLE_WEYL_EQUALITY.md) | `af154cb515a24a51c9d4fb2aa58a61325fc023cdde5897ec08ea6826f77ec3bc` |
| [E36, actual attaching maps and mixed surgery](../../../../master/notes/E36_MARKED_HEIGHT.md) | `33bcac0c687b219107002d80c6e722ce1bc64d1d7b7fe1efe2a09ec795c711e5` |
| [E42, exterior directional thresholds](../../../../master/reviews/E42_HEIGHT_AND_COST_AUDIT.md) | `7653e2de8eac5fde417d2e186327ef102184c2b790373968cbd1dc63af80045c` |
| [E43, mixed surgery and marked cap audit](../../../../master/reviews/E43_SURGERY_AUDIT.md) | `bbe74e202f5b2ececc5e7e902cd8305a67c57a0318ccd40989b96f2e9a41072a` |
| [E49, actual framed two-birth height](../../../../master/notes/E49_TWO_BIRTH_HEIGHT.md) | `14c4187216c8602fa7e9a24b3e844c4d4a12420b683f19d9fea2e1d50b733294` |
| [E50, independent two-birth check](../../../../master/reviews/E50_TWO_BIRTH_AUDIT.md) | `a0a72b607aee29c745ccbb87a5ce8c34c75513043add1e139cd8d679111d8c8c` |

The source check used the published texts of [Laudenbach–Poénaru, Theorem A and its proof](https://www.numdam.org/item/10.24033/bsmf.1741.pdf), [Gompf–Scharlemann–Thompson, Propositions 3.1–3.2 and the latter proof](https://msp.org/gt/2010/14-4/gt-v14-n4-p13-p.pdf), [Scharlemann, Corollary 2.2](https://ems.press/content/serial-article-files/43163), and [Stipsicz, section 1](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/stipsicz.pdf). Milnor's rearrangement and cancellation statements were available in a [text reproduction](https://www.math.auckland.ac.nz/~hekmati/Books/Milnor2.pdf). Gabai's Corollary 8.3, Remark 8.5 and Corollary 8.6 were available in a [reproduction of the journal article](https://www.scribd.com/document/1026013102/2-Gabai). Hatcher's opening statements were checked in a [search-indexed excerpt of the author's scan](https://pi.math.cornell.edu/~hatcher/Papers/SmaleConjecture.pdf). The birth model was checked in the [author-hosted text of Borodzik–Powell–Teichner, section 3.5](https://www.maths.gla.ac.uk/~mpowell/link-conc-implies-link-homotopy.pdf).
