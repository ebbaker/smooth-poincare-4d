# Edition 06 · FOT-E49 public verification

26 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. The selected configuration was an Astra/ultra lead and bounded Sol/ultra proof and independent reading. Separate serving telemetry was unavailable. [Issued work](ED06_E49_PACKETS_20261126.md) · [Edition 06 input receipt](ED06_SETUP_INPUTS_20261126.md) · [Assessment](../../reviews/ED06_E49_PHYSICAL_ADJOINT_AND_MARKED_EXTERIOR.md)

## Scientific and installed generations

The intake checkout was `9c80575988ad8915ad39515c64400e3d8590cf46`. The final working tree was sampled over `2a132b6d335f695183fecdb4537905cf180b0363` at 2026-11-26T15:17:25-05:00. All ten manuscript TeX closures and ten local PDFs reproduced the Edition 06 intake bytes. The 46-file TeX union again measured `cb2e499a1aa317dbf12b9e1fde1362b715a1b626bc8d365b388d8432b84f0a68`. All seven master aliases resolved to the same files and bytes. The 05, 06 and master planning and register inputs reproduced. The two reference changes are the added odd-Pfaffian citation and its source note. [Manuscript and dependency inventory](ED06_SETUP_INPUTS_20261126.md) · [Boundary reference note](../../../../references/SOURCE_NOTES_BOUR_ATTAINMENT_20261126.md)

All ten installed dependency heads matched their manifests with clean tracked state. All 19 nested revisions matched the root lock. Lean was 4.35.0-rc3, commit `470d5ce1400764999581fd26d5d72b00d990b0f4`, and Lake was 5.0.0-src+470d5ce. DifferentialGeometry was `788efe97894474c032de6dfb1289d515f613d15a` and mathlib `c55e6e786f49471c72fbddbec5415808896aec1e`. The toolchain, Lake definition and manifest bytes reproduced.

## Public Lean verification

The public build from `formalization/` completed 11,425 jobs. The 245 pre-E49 topic files reproduce the intake aggregate. The combined 253 topic files hash to `d739b691c0334d06b3d4add0a6f392db0cd6ff98ece1732bad0f85b9692063f9`. The root contains 203 direct imports and hashes to `1c3c5a6a4de86105aac1e02423dd4ec71334789ac1bb79d9a7ebfb41d928b1fb`. A complete imported-environment scan assigned 238 kernel constants to the eight new modules. All 61 nonprivate, noninternal names printed their exact type and transitive axioms from `import SmoothPoincare` alone. The saved probe reproduced transcript SHA-256 `41fb2c8713e1f13f79688fe1d89e5a600f17c576e9b57c871b4d7eeb441783e1`. The sorted kernel inventory, including generated and private entries, hashes to `b08a55fcf37721f08bdb85d2beb296ad417a2076a17c5291644d41791c0f44d4` using compact sorted-key JSON lines. Every transitive axiom belongs to `propext`, `Classical.choice` or `Quot.sound`. The eight modules introduce zero axioms. [Executable type and axiom replay](ED06_E49_PUBLIC_TYPES.lean)

| Public module | All kernel constants | Public names | Source SHA-256 |
| --- | ---: | ---: | --- |
| [AttainedEinsteinSpectrum](../../../SmoothPoincare/Variational/AttainedEinsteinSpectrum.lean) | 20 | 9 | `efbe02dc422ec38f1a3f0840ccdcd10fdc3f9a441ff0a2c77fc3dfc7183b539b` |
| [AttainedYamabeSelection](../../../SmoothPoincare/Variational/AttainedYamabeSelection.lean) | 44 | 14 | `95bc422196c7395ff309e26c5116326d3fc6401b42b02b7f9b75e5f1913c737d` |
| [BourALEBoundary](../../../SmoothPoincare/Variational/BourALEBoundary.lean) | 29 | 11 | `4abca7abe4ef465e063b7ac2b6abd1d5cdb1a5aa3f67c62f24350a92e76a94be` |
| [BourAttainedSublevel](../../../SmoothPoincare/Variational/BourAttainedSublevel.lean) | 4 | 2 | `d05f084266a335cbc47d575e4b0376626293dc5d7a77d07cbd82378ba0104238` |
| [BourChristoffelTime](../../../SmoothPoincare/Variational/BourChristoffelTime.lean) | 3 | 3 | `73874e76d08e3c46f15b9e135fd4efc1b0003a6a64a7c397999307336ac2680a` |
| [BourRecognizedCapChart](../../../SmoothPoincare/Variational/BourRecognizedCapChart.lean) | 29 | 2 | `4cf3fa42f3fd93e80b4f71127fb82b48fe80605eddf697473f841f5110ba0023` |
| [BourStationaryInterior](../../../SmoothPoincare/Variational/BourStationaryInterior.lean) | 9 | 3 | `04f1d7cb5f4c9b3f6c5e342c220394de64b0f04c28b503235beb82fd83fe8fba` |
| [BourTensorFirstVariation](../../../SmoothPoincare/Variational/BourTensorFirstVariation.lean) | 100 | 17 | `8bbdb9382bfd944aa33ba7007457f827c1b0a0e9988d57cf978ce0b22c81014d` |

All 292 inherited type and axiom records reproduced the E48 transcript byte for byte, SHA-256 `04faeeeea2894bf16a1f793bb5d170e50a92770bd9431b24feaa5e03ab585875`. The 38 focused Edition 06 declarations also reproduced, SHA-256 `08d52ed7b94bdc28680f9d6c210bffd154300476c401ad027f1709bfaa42708c` for declarations alone. The focused inventory now reports 254 SmoothPoincare modules including the root. [E48 verification](ED05_E48_VERIFICATION_20261126.md)

| Independent application replay | Result |
| --- | --- |
| [E46](../../reviews/ED04_E46_PUBLIC_CHECKS.lean) | 22 applications. The empty diagnostic stream reproduced. |
| [E47](../../reviews/ED05_E47_PUBLIC_CHECKS.lean) | 29 applications and 35 axiom reports reproduced. |
| [E48](../../reviews/E48_INDEPENDENT_PUBLIC_CHECKS.lean) | 29 applications and 59 axiom reports reproduced. |
| [E49](../../reviews/E49_INDEPENDENT_PUBLIC_CHECKS.lean) | 23 applications and 37 axiom reports passed with the ordinary smooth atlas, both fixed-chart products, an actual link metric and the attained comparison. |
| [Additional E49 geometric applications](../../13_bour_marked_limits_and_attainment/reviews/E49_RECOGNIZED_CAP_APPLICATION.lean) | A radius-two stereographic dilation gives both collar germs and the exact complementary side. The second application gives the explicit post-attainment Ricci margin from the attained spherical deficit. Both axiom reports passed. |

The public selection originally required a stronger atlas regularity through an overloaded notation. Independent application exposed this assumption. The corrected public types and all checks above use smooth regularity. [Independent readback and fixture digest](../../reviews/E49_INDEPENDENT_READBACK_20261126.md)

## Printed and web blueprints

`make -C formalization/blueprint` rebuilt the PDF and HTML. Ghostscript interpreted all 60 print pages with stop-on-error. All 240 source labels resolved in both artifacts, including the 17 Edition 06 destinations with matching printed captions. Source, chapter and dependency graph agreed on eight open Edition 06 problems and eight new checked propositions. All 39 declared dependencies of those nodes are reachable in the graph. The 808 distinct Lean declaration anchors agreed with compiled positions. The verifier matched 68,123 local Lean source lines on 335 referenced pages. [Blueprint chapter](../../../blueprint/src/edition_six_rigidity_and_suppliers.tex)

| Artifact | SHA-256 |
| --- | --- |
| `print.pdf` | `af1df19e1be359945200a75810f4b218dad757edb57135409c0bdf05fcba1f2a` |
| `edition_six_rigidity_and_suppliers.tex` | `cbaed70ef0241f46ab2ca83a5dcd12914ab955a46d2c09e94b8a24b74517eccf` |
| `sec-ed06.html` | `1704189366cb3b0bf3bff6832fbb146e26ac02d6adaaee466c2990453a1752cd` |
| `dep_graph_document.html` | `b36c846e9a84fb4050fbf246fa8b05f64969b31fd2c688912b510611d93f91b9` |

Run the proof and render checks from the repository with the pinned toolchain.

```sh
cd formalization
lake build
lake env lean -j1 investigations/research-progress/handoffs/ED06_E49_PUBLIC_TYPES.lean
lake env lean -j1 investigations/reviews/E49_INDEPENDENT_PUBLIC_CHECKS.lean
lake env lean -j1 investigations/13_bour_marked_limits_and_attainment/reviews/E49_RECOGNIZED_CAP_APPLICATION.lean
make -C blueprint
```

Repository hygiene passed across 21 branches and 18,380 relative links. Both working and staged whitespace checks passed.

The public chat refresh could not locate the exact thread source in this environment. A verified current-turn identifier was unavailable for a deferred capture. The proof and assessment use the checked repository inputs and the independent readback.
