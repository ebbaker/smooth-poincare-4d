# Twistor sections and chiral Weyl curvature on homotopy four-spheres

Working draft for Edward B. Baker III, 24 November 2026 (America/New_York). [LaTeX source](twistor_sections_and_chiral_weyl_curvature.tex). The [parent manuscript](../../manuscript/first_order_twistor_and_smooth_poincare.tex) gives the earlier first-order program.

The manuscript derives the assessed analytical results through SEC-E58. Sections 2–3 relate the local twistor-section defect to the Weyl energy and develop metric prescription. Sections 4–5 treat exact prescription at a nearby equal-energy exterior reference and the sign criterion at the original reference. Sections 6–9 develop spherical transmission, fixed-boundary obstructions, marked compactness and the sharp Yamabe-zero threshold. Section 10 proves divergence of radial strain along regular marked examples approaching that threshold. Sections 11–13 treat smooth ALE limits, closed Bach-flat critical values, and compact gauges for sequences with small total Bach norm. Section 14 gives the open problems.

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

## Build

From the repository root run

```sh
python3 tools/build_manuscripts.py 03_first_order_twistor/01_sections_and_connections
```

The build uses LaTeX and Biber. It writes the PDF to `output/pdf/03_first_order_twistor/01_sections_and_connections/twistor_sections_and_chiral_weyl_curvature.pdf`.
