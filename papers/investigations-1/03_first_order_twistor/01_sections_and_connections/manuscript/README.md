# Twistor sections and chiral Weyl curvature on homotopy four-spheres

Working draft for Edward B. Baker III, revised 25 November 2026 (America/New_York). [LaTeX source](twistor_sections_and_chiral_weyl_curvature.tex). The [parent manuscript](../../manuscript/first_order_twistor_and_smooth_poincare.tex) gives the earlier first-order program.

The manuscript derives the assessed analytical results through SEC-E61. Sections 2–3 relate the local twistor-section defect to the Weyl energy and develop metric prescription. Sections 4–5 treat exact prescription at a nearby equal-energy exterior reference and the sign criterion at the original reference. Sections 6–9 develop spherical transmission, fixed-boundary obstructions, marked compactness and the sharp Yamabe-zero threshold. Section 10 proves divergence of radial strain along regular marked examples approaching that threshold. Sections 11–13 treat smooth ALE limits, closed Bach-flat critical values, and compact gauges for sequences with small total Bach norm. Section 14 bounds the Weyl energy of long necks by the total Bach norm: the first variation in divergence form and a conserved current, the Euler relation and the one-chart annulus theorem, cones and nearly conical necks, the linearized Bach equation at the flat cone, and a calibration by Einstein metrics on the four-sphere. Section 15 derives the marked-source estimates and limiting alternatives developed in the collar investigations. Section 16 gives the open problems.

## Provenance

The initial analytical draft through SEC-E39 used checkout `e76752648b69969b1234d0295530c87fce9fcdcb` with the assessed 24 November research files. All seven inherited file digests in the shared input record were rechecked at that stage. The revision through SEC-E58 used checkout `3fb565b70247a57e4fcc7e65886c57ce0ca0e1ab`, the two later assessments listed below, and their derivations. The [sole register](../research-progress/REGISTER.md) records the status of each result. The [current research handoff](../continuation-notes/04_AFTER_SUBCRITICAL_BACH_CONCENTRATION_20261124.md) identifies the annular energy estimate as the next test.

The author-selected lead was retained for drafting, assessment and integration. Its exact model identifier and effort were unavailable. Bounded derivation and editorial helpers were configured as `gpt-6.2-sol` at `ultra` effort. Independent confirmation of the serving model and effort was unavailable. Editorial cross-reads checked the scope of the joint statements and the two global recognition arguments. No numerical experiments enter the manuscript.

| Initial draft input through E39 | SHA-256 at drafting |
| --- | --- |
| [SETUP_AND_TASK_CROSSWALK_20261124.md](../../brainstorm/notes/SETUP_AND_TASK_CROSSWALK_20261124.md) | `0445e1698fe6f12fed177f1d1124294c2f1405b3cb4ebeb4f7498165b3bbd322` |
| [SH_B01_CONVENTIONS_20261124.md](../../brainstorm/notes/SH_B01_CONVENTIONS_20261124.md) | `4619a16de34b8138d1c499a60c447697752dc12862c808a506ef4b7d2dac70c3` |
| [SH_E01_20261124.md](../../notes/SH_E01_20261124.md) | `10b7b2b71d8d693d6aab079b04a3fbd8954cbc1db2f44dd47f619e1e9ef1f62f` |
| [SH_E02_20261124.md](../../notes/SH_E02_20261124.md) | `43cb7686acea3f3ffdde0a88cc417a0f27125e5d2086cdea0d7583dfc7918b7a` |
| [SEC_B05_GLOBAL_CONSTRUCTION_20261124.md](../reviews/SEC_B05_GLOBAL_CONSTRUCTION_20261124.md) | `86d432f69047c4eba674f18009a042989eed6d6569d6cb98facf336686524e99` |
| [SEC_CAP_COMPACTNESS_AND_YAMABE_WALL_20261124.md](../reviews/SEC_CAP_COMPACTNESS_AND_YAMABE_WALL_20261124.md) | `3296b21d17f7b1cc8f02cf2e9d9163bab9a75664e2e982b73d61be7b70728240` |
| [SEC_SECTION_ENERGY_20261124.md](../reviews/SEC_SECTION_ENERGY_20261124.md) | `8fb8675f34dc8c8d2026040cb62c696896a943d41af87fe778334bf63f716e5f` |
| [SEC_SPHERICAL_TRANSMISSION_20261124.md](../reviews/SEC_SPHERICAL_TRANSMISSION_20261124.md) | `f6987fdbb04f56f264e8a8d7a012a4b930b47c8f2a8c37f24354c8db95856a99` |
| [SOURCE_NOTES_SEC_20261124.md](../../../../../references/SOURCE_NOTES_SEC_20261124.md) | `9e9cf61a39f8b63d8d7df036a49589681c6a33670a7c4781f13d6e612f3b0cc5` |
| [references.bib](../../../../../references/references.bib) | `125699b640a19df898954d94a511dafc1821621ac4dc6f687e5023709c1051d3` |
| [39 SEC derivation and audit notes](../notes/) | `1e700066787b28e15d33a660a5850262adf910d39d629cc773c772789c37906d` |

The last digest hashes the concatenation, in filename order, of each basename, one space, its lowercase SHA-256, and a newline.

## Revision inputs through E58

| Input | SHA-256 |
| --- | --- |
| [SEC_EXTERIOR_REGULARITY_AND_RADIAL_COST_20261124.md](../reviews/SEC_EXTERIOR_REGULARITY_AND_RADIAL_COST_20261124.md) | `4a22ff0259d68364b3a7491601e8de14893f8e82b80e851156db781d619ebe24` |
| [SEC_SUBCRITICAL_BACH_CONCENTRATION_20261124.md](../reviews/SEC_SUBCRITICAL_BACH_CONCENTRATION_20261124.md) | `35d5f719e9fa7849de44ddf5e56cdb10c674dd4428fb90f118a3c6e3043ce0da` |
| [SOURCE_NOTES_SEC_20261124.md](../../../../../references/SOURCE_NOTES_SEC_20261124.md) | `92448bf319ac1f6bf7747f88a1aa259db95918468f80e8258fdfda1434c97084` |
| [references.bib](../../../../../references/references.bib) | `04c0df45ed8ef36b445e1aab8f97824a75262ea2ef4d130f39ac0d3014e6a28f` |
| [58 SEC derivation and audit notes](../notes/) | `3c7e2cf4047dd4005559a916ae7e65bd4b05b897e97cb0b0d53e44c748b8192a` |
| [Integrated LaTeX source](twistor_sections_and_chiral_weyl_curvature.tex) | `7854160925920435a9b3a90a21f6c1f5c15265d30fe4ba778aa8abae86bc7ed0` |

## Revision through E61 · 25 November 2026

Section 14 and the revised Section 15 were written for Edward B. Baker III with LLM assistance: Claude Opus 5.5 (`claude-opus-5-5`), Claude Cowork, reasoning effort max as the session's configuration records it. The research they integrate, SEC-B34, B35 and E59–E61, was done earlier in the same Claude Cowork session with Claude Fable 5.2 (`claude-fable-5-2`), which acted as lead and executed its own frozen requests; no second reader checked those derivations. The integration started from checkout `15940b9fae9557b26f9abcf84021b159f8c5f2fa`. At the author's request the section develops the results as one argument rather than in the order of the notes, and keeps to the analytical statements. Three statements are new relative to the notes: the closed form \(W'(p)=-3\rho^{-4}P^*\mathsf W\) for the decaying quadrupole fields, obtained by inversion; the bound \(\mathcal W\le4\sqrt3\,\mathfrak B\) on segments of metric cones; and the exact mean \(\tfrac{160}{27}|H|^2\) of \(|b_H|^2\) with the analytic bounds it gives for the Bach density of the logarithmic cones. The first and third were checked numerically with the linear-model code of the [numerics folder](../numerics/README.md), to \(10^{-13}\) or better; those checks are not part of its records. The second is a two-line consequence of the cone identity. The corollary on necks with a nearly conformal Killing field now requires \(0\le\varphi\le1\), which the note E61 used without stating. No numerical result enters the manuscript.

| Input | SHA-256 |
| --- | --- |
| [SEC_ANNULAR_ENERGY_AND_CONSERVATION_20261124.md](../reviews/SEC_ANNULAR_ENERGY_AND_CONSERVATION_20261124.md) | `ab23a183e1b0b49987a7d24816ef06b124971c73627dbdf4d19a45a49a1e8ffb` |
| [SOURCE_NOTES_SEC_ANNULAR_20261124.md](../../../../../references/SOURCE_NOTES_SEC_ANNULAR_20261124.md) | `dc1bb845dc127eaffca47b9f013eca472a3ba8bf447cc103881d54652c46d88f` |
| [references.bib](../../../../../references/references.bib) | `f98887563d3b5451721c4fe6deada907df21cd717f3525ea879e97564286d711` |
| [61 SEC derivation and audit notes](../notes/) | `05c0ba8400d5904dabb305eaa87f0d5994026de716eb1177589d1ce2350fbc81` |
| [Integrated LaTeX source](twistor_sections_and_chiral_weyl_curvature.tex) | `85190fa0b78fd082fe03981b1fd38236198e4967b8ac5f80aae5ce9f07398d74` |

The digest of the notes uses the convention stated above; it reproduces the earlier digest for the first 58 notes.

## Review revision · 25 November 2026

Revised for Edward B. Baker III with OpenAI Codex assistance. The exact serving model and reasoning effort are unavailable. This revision applies the [manuscript review](../reviews/SEC_MANUSCRIPT_REVIEW_20261125.md), SHA-256 `c4665208b1721cf0bdb036588c8223f7de9610ae9802cc13c7d67a87cbf02eae`, to the integration at `3a4666d14922ea3bda3099ad3e4c64bedd32ef91`. It states the annular error terms, gives the mixed-density Bach divergence, and distinguishes the Lorentz endpoint from the spatial annulus sum. Using the zero mean of the flat Bach source sharpens the linear amplitude constant to \(1/(4\pi^2)\) and the round-ray ratio to \(16\pi^2\). The Einstein comparison uses the statement of Akutagawa, Endo and Seshadri, [arXiv:1801.10305v2, Theorem 1.2](https://arxiv.org/pdf/1801.10305), for the uniform positive improvement to the lower energy endpoint on the standard sphere.

The revised source SHA-256 is `8e034b514153b2502879f973e2d19cf93c45b95008d46de833c01668d10bee44`. The local build produced 82 pages. The changed mathematical displays and the abstract were inspected in the rendered PDF.

## No-neck application · 25 November 2026

Prepared for Edward B. Baker III with OpenAI Codex assistance. The exact serving model and reasoning effort are unavailable. Section 15 now states the iterated no-neck limit and explains how complete energy accounting, under the smooth comparison hypotheses of Section 12, would exclude a nonflat ALE bubble and constrain the remaining closed critical value. The [neck sub-investigation](../01_neck_geometry/README.md) records the setup and compares the chiral evolution and Dirac manuscripts with a controlled surgery route. The expanded source SHA-256 is `329513a3cfd8e939373533fad90f36b9108ce0ea41a22f9cc348587a4110fe66`. The local rebuild produced 82 pages. Pages 78–79 were inspected in the rendered PDF.

## Build

From the repository root run

```sh
python3 tools/build_manuscripts.py 03_first_order_twistor/01_sections_and_connections
```

The build uses LaTeX and Biber and writes the PDF to `output/pdf/03_first_order_twistor/01_sections_and_connections/twistor_sections_and_chiral_weyl_curvature.pdf`. The original E61 integration built in the Claude session's cloud workspace with TeX Live 2023 and Biber 2.19. The review revision built with the local TeX installation using the same repository command.
