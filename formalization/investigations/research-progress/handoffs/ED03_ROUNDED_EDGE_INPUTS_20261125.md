# FOT-E41 · Rounded edge and physical comparison intake

25 November 2026, America/New_York (26 November UTC). Prepared for Edward B. Baker III with OpenAI Codex assistance. Independent bounded execution audit of the FOT-E41 inputs. Serving model and effort are unavailable. The audit recomputed source and reading-copy digests, checked the resolved Git checkouts and compared the premises of the pinned paper and Lean passages. [E40 assessment](../../reviews/NATIVE_FEET_AND_PHYSICAL_JETS_20261125.md) · [Edition 03 program register](../REGISTER.md)

## Frozen generations

The frozen intake is `a7bb158d6af806d2573a7702386622ed4c0bb1f1`. All five groups reproduce the E40 assessed working-source digests. The intake commit records the final E40 formalization changes. The preceding `4b15d52a9301ca6796002774b712fc51a82c09c9` is the last commit changing `papers/` or `references/` at the audited intake. The working scientific and reference files also agreed with the intake tree during this check.

| Group | E40 intake | E40 assessed and E41 intake |
| --- | --- | --- |
| TeX in the six manuscript directories | 42 · `80be9ab59f1ddbfc2c0c4647` | 42 · `80be9ab59f1ddbfc2c0c4647` |
| Scientific plans and registers | 18 · `187d405ee044f01a8b798bb8` | 18 · `187d405ee044f01a8b798bb8` |
| Lean topic sources | 104 · `ac30006fa09f0fe219dabf09` | 120 · `c424a7c3091461f300695a36` |
| Blueprint TeX sources | 12 · `00e377f54f21aa7baa605f39` | 13 · `01981f753d013f7cd2a2bb64` |
| Formalization plans and owning registers | 36 · `08f0ef7f9103e18256c90c6f` | 36 · `159ae3f3568b8d196e571032` |

The first group includes all `.tex` files in the six manuscript directories named below. The second uses `research-overview/OVERVIEW.md`, `research-plan/PLAN.md` and `research-progress/REGISTER.md` in the corresponding six branches. The Lean group includes `.lean` files below `formalization/SmoothPoincare/`. The blueprint group uses the immediate `.tex` files in `formalization/blueprint/src/`. The last group uses the three standard files from each of the nine formalization routes, the program’s two complete `research-overview/` and `research-plan/` Markdown directories and the program `research-progress/REGISTER.md`.

Enumerate the frozen paths with `git ls-tree -r --name-only <revision>` and read their bytes with `git show <revision>:<path>`. For the working generation use `git ls-files -z --cached --others --exclude-standard`, retaining existing files and deduplicating paths. Sort the selected repository-relative POSIX paths, write `path<TAB>file_SHA256<LF>` for each and take SHA-256 of the concatenation. The following commands rerun the same procedure in the current workspace. `SP4_GENERATION_PATHS=1` prints the path inventories for inspection.

```sh
python3 formalization/investigations/research-progress/handoffs/ED03_ROUNDED_EDGE_GENERATIONS.py a7bb158d6af806d2573a7702386622ed4c0bb1f1
python3 formalization/investigations/research-progress/handoffs/ED03_ROUNDED_EDGE_GENERATIONS.py
```

## Scientific crosswalk

Each TeX digest uses the entry point selected by the manuscript build driver and every recursively included literal `\input` or `\include` from its build directory. Apply the [E51 convention](../../../../papers/master/research-progress/handoffs/E51_COMPANION_DRAFTS_20261125.md) with one ASCII space as the separator. This includes the shared master `physical_volume.tex` through the descent entry point. The PDF column hashes the bytes of the corresponding existing local reading copy under `output/pdf/`. All six TeX/PDF pairs reproduced the published E69–E72 crosswalk. The bibliography prefix is `07df2f4c65b53314`. The scientific delivery, ownership crosswalk and primary-source receipt have prefixes `cd96eea0b89ed332`, `1012d3ecc1bbb651` and `46030568e48bc01f`. [Scientific delivery](../../../../papers/master/research-progress/handoffs/E69_E72_CHARGED_FLOW_20261125.md) · [Ownership crosswalk](../../../../papers/master/research-progress/handoffs/PARALLEL_OWNERSHIP_20261125.md) · [Source receipt](../../../../references/SOURCE_NOTES_MASTER_CHARGED_FLOW_20261125.md) · [Build driver](../../../../tools/build_manuscripts.py)

| Manuscript | Transitive files | TeX generation | PDF generation |
| --- | ---: | --- | --- |
| [Master](../../../../papers/master/manuscript/README.md) | 11 | `5f12947240860902` | `383907ab614a5e74` |
| [Fixed-type descent](../../../../papers/master/01_fixed_type_variational_descent/manuscript/README.md) | 18 | `83078c791c7e3864` | `65e84af3b58c9214` |
| [Physical neck](../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/manuscript/README.md) | 6 | `0e1e29769f39a372` | `5c273dd27b0e779c` |
| [Immersed construction](../../../../papers/investigations-1/04_hypersurface_immersions/01_immersed_handle_constructions/manuscript/README.md) | 5 | `9f1bf9a87a1daafe` | `be162dcd5094fb92` |
| [Immersion parent](../../../../papers/investigations-1/04_hypersurface_immersions/manuscript/README.md) | 1 | `e5a72e29072c66e1` | `5b333c1399f51169` |
| [Height recognition](../../../../papers/investigations-1/04_hypersurface_immersions/02_two_handle_recognition/manuscript/README.md) | 1 | `f8995353a388aab0` | `749114d5e2756716` |

## Supplying objects

| Comparison | Evidence available at intake and remaining premise |
| --- | --- |
| Rounded edge of the selected height | The paper’s marked end reduction absorbs a leaf in a spanning tree of an ordered presentation and transports complete framed tubes and the induced boundary gluing. Its ordering can use an auxiliary Morse presentation. The Lean `exists_roundLeafAdjunction` and `exists_leafBallTransport` certify a topological model and its marked transport. The native `exists_markedTreeEdgeFootNormalization` works on the selected one-handle with disjoint incoming foot components, furnished oriented model charts and protected residual charts. It compares each unit foot up to the recorded parity, fixes the marked tubes and fixes all points at or above the critical height in both directions. A relative smooth rounded-body theorem for the actual incoming bodies still needs incidence, a comparison through the rounded rim and the induced outgoing map with its signed collar. The separate two-handle diagram requires its actual framed attaching and outgoing surgery maps. [Paper end reduction](../../../../papers/investigations-1/04_hypersurface_immersions/02_two_handle_recognition/manuscript/recognition_from_marked_morse_heights.tex) · [Topological adjunction](../../../SmoothPoincare/Heights/MarkedEndTree.lean) · [Native normalization](../../../SmoothPoincare/Heights/MarkedTreeEdgeFeet.lean) |
| Physical disk and cap | E69–E70 use the same smooth marked disk or its balanced enlargement in the volume-one physical Yamabe source. The support-confined variation realizes at most the finite excess over the fixed smooth type’s positive-energy infimum. A signed joined endpoint with a positive capped exterior still must meet the complete exterior budget, including all cutoff and connector costs and the protected core term. A strictly positive local saving may exist for nonzero Bach tensor but can remain below the required saving. The product-germ example tests the raw local hypotheses on a standard source. The current Lean estimates use the supplied reference data on the selected width and the actual pulled-back physical measure. [Core variation](../../../../papers/master/01_fixed_type_variational_descent/manuscript/core_variation.tex) · [Master disk comparison](../../../../papers/master/manuscript/balanced_disk.tex) · [Physical jets](../../../SmoothPoincare/Variational/SelectedPhysicalJetControl.lean) |
| Modified Ricci flow | E71 uses the smooth modified approximations, uniform initial small-ball upper volume ratios and the first full-curvature radius. The paper derives the spatial transgression from the Euler Pfaffian on the moving common orthonormal bundle and tests it with one terminal cutoff held fixed on the source. Its pointwise primitive involves the product of the physical tensor norms of the rescaled **modified** flow, (\lvert\nabla\mathrm{Ric}\rvert\,\lvert\mathrm{Rm}\rvert\). The E40 Lean terminal charge assumes the tested spatial transgression or its flux bound, then proves the time-weight factor and the energy comparison. E72’s time-zero obstruction is in fixed positive-time flow markings and excludes the stated complete, locally uniform, strong first-order initial limit. A comparison of the original physical sequence needs a separately supplied physical chart. [Charged-flow and initial-end proof](../../../../papers/master/01_fixed_type_variational_descent/manuscript/modified_ball_charge.tex) · [Lean Euler comparison](../../../SmoothPoincare/Variational/ModifiedEulerCharge.lean) |
| Adjacent alternatives | The physical neck compactness theorem takes both complete marks and buffered physical volume, pointwise full-curvature and vanishing integral hypotheses on the same rescaling. Its final spherical comparison also needs the radial defect or shifted-volume inputs. Exact-class overlap uses grounds supplied by the exact closed or compactified ALE comparison. The whole marked round alternative follows the original and modified charges in each supplied gauge. The Mazur-half result supplies an exact boundary metric extension with positive scalar curvature, and asks for the indicated Robin positivity to reach a totally geodesic filling in that prescribed boundary class. These alternatives provide separate comparison data and metrics. [Physical window](../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/manuscript/physical_window.tex) · [Exact alternatives](../../../../papers/master/01_fixed_type_variational_descent/manuscript/exact_alternatives.tex) · [Marked boundary class](../../../../papers/investigations-1/04_hypersurface_immersions/01_immersed_handle_constructions/manuscript/boundary_class.tex) |

## Toolchain resolution

`lake env lean --version` reported Lean `4.35.0-rc3` at `470d5ce1400764999581fd26d5d72b00d990b0f4`. `lake --version` reported `5.0.0-src+470d5ce`. The selector, Lake definition and public root have SHA-256 prefixes `bc84812c94489d1e3e191baa`, `35562fc83d2a568ae4ae08f3` and `5ca87509879d25e999bb3db3`. The pinned root manifest SHA-256 is `839111aae86b693524cd57db5ce7f2e8edc972dad49296468eb18d6735e52239`. All ten tracked package checkouts were clean. Each `git rev-parse HEAD` matched its root manifest revision. Each package manifest is tracked in its checkout, and every nested entry’s name and revision matched the root resolution.

| Package | Actual HEAD | Matching nested entries |
| --- | --- | ---: |
| DifferentialGeometry | `788efe97894474c032de6dfb1289d515f613d15a` | 9 |
| mathlib | `c55e6e786f49471c72fbddbec5415808896aec1e` | 8 |
| plausible | `fb13df72ecefd8ddbf9291021d7f33a8673eb57b` | 0 |
| LeanSearchClient | `29ff470276c725ae01505d55b17148c18fc7dfd3` | 0 |
| importGraph | `7e81a29bda33a6b257bd37557a6aa6aebe175d96` | 1 |
| proofwidgets | `c643bbb3c24f8a25f9c14e3a6b1ceb13d01f3de1` | 0 |
| aesop | `a90fbf7b02ff06a0deebf74088dff9e5fe02c9ea` | 1 |
| Qq | `37b0ba0b26109cf9f9c541f0f9557e50cfa1a3b9` | 0 |
| batteries | `3b7c8101932390d60e92a3f3d917901d5b5a773b` | 0 |
| Cli | `843844fa601dd56767b1eb22b7ada5b64d5e567a` | 0 |

DifferentialGeometry repeats the other nine entries. Mathlib repeats its eight dependencies. The two remaining nested entries are `importGraph → Cli` and `aesop → batteries`. The 19 checks reproduce the E40 count.
