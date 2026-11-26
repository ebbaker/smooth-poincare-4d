# FOT-E48 · Working science and public import receipt

26 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded E48 input verification, selected GPT-6.2 Sol/ultra. Actual serving model and reasoning effort were unavailable. The comparison HEAD for the 14:04:07–14:06:50 EST observations was `226b8f404b6e5c99f8e71f85280e5c9988bbf652`. [E47 input receipt](../research-progress/handoffs/ED05_E47_INPUTS_20261126.md) · [E47 public verification](../research-progress/handoffs/ED05_E47_VERIFICATION_20261126.md) · [E48 starting dependencies](../continuation-notes/AFTER_BOUR_BUDGET_AND_MARKED_RETURN_20261126.md)

## Current split master and supporting manuscripts

The ten working TeX closures use the registered mains and literal uncommented transitive includes. Their 46-file union is `50a393750744059ab85b4729930b17b2e47a7dbbad7907bed0bb134ce5cb98fc`. The digest is over sorted `path<SPACE>file-SHA256<LF>` records. The table compares with the E47 input observation at 13:48 EST. Each local PDF passed Ghostscript with `-dPDFSTOPONERROR`. An independent project-builder compilation to scratch succeeded for all ten, followed by byte comparisons of Ghostscript `txtwrite` page text. [Master manuscript guide](../../../papers/master/manuscript/README.md) · [Build registry](../../../tools/build_manuscripts.py) · [Generation procedure](../research-progress/handoffs/ED04_ACTIVATION_AUDIT.py)

| Manuscript | TeX files | Working TeX generation SHA-256 | Local PDF SHA-256 | Change since E47 input | Rebuilt text |
| --- | ---: | --- | --- | --- | --- |
| Master | 6 | `92e9160d987cd487974dd0974a5473e4b791d731718b1a87d7ec90b49d5fab8f` | `c5328d20f34cfb24d57d56c0fd2af2a8e1ddfe22aa4d10d35b1fd6ff6bcae8f4` | TeX, PDF | Match |
| Fixed-type descent | 21 | `a256e946df656c6e7a4841f443cec378c411fe20384dc5d070d8b72994b6ed9b` | `7eafcb782b9b197a8818e6afc63fb3a858dacb63b7037398ee47a4922e497576` | PDF | Match |
| Physical neck | 7 | `13412bc4e9032e67ff663c26e467d01256f69626a2aa7a05142fac3396b59b18` | `e676aef2fdc7dbf3bebb0fd6df9226f34cfc2ae193613b2e01cc86bf098becf3` | PDF | Match |
| Immersed construction | 5 | `9f1bf9a87a1daafea00723e14d1149f739caae4c1887e6195016145250a81756` | `be162dcd5094fb92fdb632939e80c7e97021ab498fa0a42137fec8c2aeb713b0` | Same bytes | Two bibliography dates |
| Immersion parent | 1 | `736128678652251ff4b7f826c76d66ebb072b51578253f5791af1a0cf51765d1` | `dd7cead158a239c6aef0f8fb53470b71f7b209b509f2e24bf588db0926bfe6ed` | PDF | Match |
| Height recognition | 1 | `f8995353a388aab08e9487f15ad04dc20539a3f9d2e412131a0cae640eb0f8de` | `749114d5e275671622664374e7822d4218ad20351c91a5fb10b07638d3889901` | Same bytes | Match |
| Marked collars and smooth recognition | 1 | `d9cea99fbdd266604ef8fe88c9150cb8929801215dee1cdd569078742081c62d` | `1f88d66a32819202635f1c2d9947219186fa346055cf3117accc0bbf3514f23f` | TeX, PDF | Match |
| Deformation of marked spherical collars | 2 | `1a90b945c6df399e140071228cf81853d8eeab7059bbb628f3c27978d3531e30` | `68db9ac5dcbe351bb32924c91fef5291f68ef100bc6cf79e0a520531e4d3615a` | PDF | Match |
| Recognition from marked handle cuts | 1 | `40ff115b984ff1a82b58eb217ddc23cbace7412f13ddf602ae26082933dddf82` | `70d87d6d3115f8d835285562005f0f1a5f28519224ea614bb63177179c64fe05` | TeX, PDF | Match |
| Fixed-type attainment | 1 | `23aceaccee4faa97fde5eb8a7a4f1d1d6aca18363a8a80da456a6d13af415aa6` | `22c196c0d407dccd628c68e129fdc6e7794c3d5572c7d644f27c210f445b69a6` | PDF | Match |

The local master and 06 text hashes respectively are `e53667e02cabf994c527c5babce99eea1f412f1c42177a0a381905cf647daf07` and `ad97a45e4e5e5a2b41235e2c3942ced3f605bc9712062039c50955e4590526d1`. Both match the fresh builds, resolving the earlier master content lag and the 06 bibliography-date lag. The immersed-construction comparison differs only in two bibliography dates for the immersion and fixed-descent manuscripts, printed as 25 November in the local copy and 26 November in the fresh one. The other nine pairs match. The master abbreviates the recognition-gap proof by referring to the fixed-descent smoothing and isotropic estimates. The 06 statements `prop:budget`, `lem:mark` and `thm:main` retain raw TeX hash `719bbea527c6db649eaeee93e58e1f6b50f101772d79b406ee3ec378dca357f1`. [Master recognition gap](../../../papers/master/manuscript/recognition_gap.tex) · [06 argument](../../../papers/investigations-1/06_bour_flow_and_fixed_type_attainment/manuscript/fixed_type_attainment.tex)

The master closure includes every one of its six regular working TeX files, listed below. The separate fixed-descent digest includes every one of its 21 working TeX files. Each of the seven compatibility symlinks in the master manuscript directory resolves to a source already hashed in these ten closures. The sorted alias-name, link-text and target-byte records hash to `e38b2aa80925c5064d7e6addcb01da4f9cab3fd1eed84efbbf5adabe64522d7d` using tabs between fields. This checks the moved supporting files as well as the shortened master. [Supporting proof crosswalk](../../../papers/master/manuscript/README.md#where-the-supporting-proofs-now-appear)

| Current master TeX file | Raw SHA-256 |
| --- | --- |
| [attainment_on_the_original_sphere.tex](../../../papers/master/manuscript/attainment_on_the_original_sphere.tex) | `26b828212663ea8930c6d0f85e201018f7b300193b1da5843923685a65b1e046` |
| [chiral_weyl_energy_and_smooth_poincare.tex](../../../papers/master/manuscript/chiral_weyl_energy_and_smooth_poincare.tex) | `a866a87ca66152711d2714be10dedf181d53a8b10b406ed50358253070f30789` |
| [exact_closed_types.tex](../../../papers/master/manuscript/exact_closed_types.tex) | `e936abff8c6603615dc7e191bfc0cc3d79b8a47708820c01e6664827c93b19cb` |
| [immersion_entry.tex](../../../papers/master/manuscript/immersion_entry.tex) | `91701b3ef8f63d1bdbded0a7118cc34e715a6eff0b1d0335f28f7999a9d0387e` |
| [marked_cut.tex](../../../papers/master/manuscript/marked_cut.tex) | `dac42a05369a1c9e756e6011469ac825df96b3010b6ece95c4d7b9d0e4621b67` |
| [recognition_gap.tex](../../../papers/master/manuscript/recognition_gap.tex) | `f70bbdc1a2ad8dfd27ec66eacc8c364466b3c4eb5cc50bfb834d7338f738db03` |

| Working planning and proof input | SHA-256 |
| --- | --- |
| [Master manuscript guide](../../../papers/master/manuscript/README.md) | `07351706cfa3b213b489c864d50d4563606ddccb99dbed8d3edd9ecfd65e06f8` |
| [Master overview](../../../papers/master/research-overview/OVERVIEW.md) | `2df7e91bfddb3ce6fb81446250c868d786c74c29811362a557396d83fb1ebe73` |
| [Master plan](../../../papers/master/research-plan/PLAN.md) | `7173abf6cffaf0c6ceb18fd82c7146ccb2739dbd6051f82b47d2d914a99b30ca` |
| [Master register](../../../papers/master/research-progress/REGISTER.md) | `66ab8555f05a1ac7aae3844aa51688dc70d30f165cee049d9eb52e0636126601` |
| [SOURCE_NOTES_BOUR_ATTAINMENT_20261126.md](../../../references/SOURCE_NOTES_BOUR_ATTAINMENT_20261126.md) | `f803dadc58ee27baddb7d216974147a181752264a0890bd0b85c24b5dd202a30` |
| [references.bib](../../../references/references.bib) | `f5a3dd9bb9ac74dc9aee61bc399d8ec84f41aac046fb1ed841480926a1e5c249` |
| [SOURCE_NOTES_COLLAR_SURGERY_20261126.md](../../../references/SOURCE_NOTES_COLLAR_SURGERY_20261126.md) | `3a87a544c7dc3687aac5b44083566ffefe5012b460e2f0765462ba8634418f32` |
| [06 overview](../../../papers/investigations-1/06_bour_flow_and_fixed_type_attainment/research-overview/OVERVIEW.md) | `b8ce563623cc2e1647f6b73931dcc58373fcba7a3428a133f92b0399e7dfc585` |
| [06 plan](../../../papers/investigations-1/06_bour_flow_and_fixed_type_attainment/research-plan/PLAN.md) | `7267ed2abfa84a6cb4a8807f14386a9689654944a5fda6f72a97028e53432fd8` |
| [06 register](../../../papers/investigations-1/06_bour_flow_and_fixed_type_attainment/research-progress/REGISTER.md) | `c4ed1c33c72582fd2e973004a27c02662c6a1af8d71bd1dea3207da9850e7b22` |
| [BOUR_AUDIT_20261126.md](../../../papers/investigations-1/06_bour_flow_and_fixed_type_attainment/01_regularized_flow_and_energy/notes/BOUR_AUDIT_20261126.md) | `34138752da571bad8741601b03d5967300d806bc2658105a5291c8e8bc8b29e2` |
| [ORIGINAL_FLOW_20261126.md](../../../papers/investigations-1/06_bour_flow_and_fixed_type_attainment/01_regularized_flow_and_energy/notes/ORIGINAL_FLOW_20261126.md) | `51f5a14278dcd7cac67953726375a43f8aec6189b4b60c2145fa3ae3b7e587c7` |
| [MARKED_CORE_20261126.md](../../../papers/investigations-1/06_bour_flow_and_fixed_type_attainment/02_marked_limits_and_attainment/notes/MARKED_CORE_20261126.md) | `f3899cded68baa98a33b5dc5bf340dc7b0c9c50ed7222c64f923063cc91cf76f` |
| [CSC_ESTIMATES_20261126.md](../../../papers/investigations-1/06_bour_flow_and_fixed_type_attainment/02_marked_limits_and_attainment/notes/CSC_ESTIMATES_20261126.md) | `db5e120ef9dbbb0b387f492e8d2e1d9a3fff2c6210ff4875bd1d0a44b3451247` |
| [PHYSICAL_AND_STATIONARY_GAUGES_20261126.md](../../../papers/investigations-1/06_bour_flow_and_fixed_type_attainment/02_marked_limits_and_attainment/brainstorm/notes/PHYSICAL_AND_STATIONARY_GAUGES_20261126.md) | `19c48729f7de7355189f9c65324b76ccea326e3dd6b46177e58833ce00be163e` |
| [READING_FLOW_AND_LIMIT_20261126.md](../../../papers/investigations-1/06_bour_flow_and_fixed_type_attainment/reviews/READING_FLOW_AND_LIMIT_20261126.md) | `eb039705e5fcee75caa4e71cec593b58c62e45dc8f71e7234920fb73d2333bf6` |
| [READING_MARKED_ATTAINMENT_20261126.md](../../../papers/investigations-1/06_bour_flow_and_fixed_type_attainment/reviews/READING_MARKED_ATTAINMENT_20261126.md) | `509837e171935f2df2ea95811da93d4560415f30bdd882eff57cfb5090eeda35` |
| [FIXED_TYPE_ATTAINMENT_20261126.md](../../../papers/investigations-1/06_bour_flow_and_fixed_type_attainment/reviews/FIXED_TYPE_ATTAINMENT_20261126.md) | `cacb2e70d9cfd3ef738c8f68a6250bcef0f0bef97a2262dd2e812d3e3628ce93` |

## Lean pins and the inherited public root

Lean `4.35.0-rc3`, commit `470d5ce1400764999581fd26d5d72b00d990b0f4`, and Lake `5.0.0-src+470d5ce` ran on `arm64-apple-darwin24.6.0`. The toolchain selector, Lake definition and root manifest retained the E47 digests `bc84812c94489d1e3e191baa1dc10d5eb684382d7fe9d2a5ab085e72c1c67e47`, `35562fc83d2a568ae4ae08f3e6878481f5cf1c505775acec414dc924f7bfa9db` and `839111aae86b693524cd57db5ce7f2e8edc972dad49296468eb18d6735e52239`. All ten installed HEADs match the root manifest, all tracked package statuses were clean, and all 19 nested entries match the root revisions. [Lake manifest](../../lake-manifest.json)

| Installed package | Actual HEAD | Nested entries |
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
| COUNTS | `10` | 19 |

The 236 inherited topic files retain the E47 generation `0c0b9fddfceebae082a5a29e823f28f5a3e32f42cf190c5cc4bd2c0cd5947461`. The public root is `a864fd839a9cc898ef2e1a6e31041a22c882090af03d8242b0e9073d5e4b0c60`. The latter observation saw five new E48 leaves under separate development, outside that inherited public root. The exact replay of the E47 list through `import SmoothPoincare` reproduced all 173 type-and-axiom records byte for byte, including 95 authored and 78 generated names. The retained E47 fixture replay passed 29 examples and 35 axiom queries. The transitive axiom union remains `Classical.choice`, `Quot.sound` and `propext`. [Public root](../../SmoothPoincare.lean) · [E47 fixture](ED05_E47_PUBLIC_CHECKS.lean)

| Replay | SHA-256 |
| --- | --- |
| E47 exact public types and axioms, transcript | `c2100ee70ef2003b3e245bfe06cd481df2ebc5fa58fc1a018664075a75607395` |
| E47 330 kernel fingerprints and axiom lists, byte-identical | `b8066f96aad55bb44caf1393d8c3d55407f3c0e7dcd9283336d17c9864351536` |
| E47 fixture source | `96d19c04dcc02301fe747a4a4f3a7e39378b9e26c06d4ded202d819a36f8fc9c` |
| E47 fixture transcript | `9139a39db1de1be19d65604d35050127bc137ed2ffa4e2d63388dbde739c62d7` |
| E48 imports and 13 principal public pairs, source | `2b630907d72b72a738e46e30ca21b83dc8c33177acc2347882799523a5760ba4` |
| E48 imports and public pairs, transcript | `b992b0844a7b53d1d879bea42c5ebbd19eb70816b30d215baa8d54fed3824f44` |
| Four pinned dependency types and axioms, transcript | `5a05047e3d0fe5644f129cbea356ea9a58085d9437ead5371d9fedce7f7c5ef5` |

## Actual import inventory and next analytical premises

The Lean environment loaded 12,973 transitive modules under the inherited public root, including 237 `SmoothPoincare`, 47 `FirstOrderTwistor`, 2 `SectionsAndConnections`, 1,895 `DifferentialGeometry` and 8,564 `Mathlib` modules. The root has 186 direct imports. All nine E47 Bour modules loaded. The root includes the pinned injectivity interface and `CompactGlobalization`. The separate `BoundedGeometryCanonical` and `Geometry.Flow.RicciFlow.Compactness.Limits.Hamilton` modules were absent from the root and from the installed compiled modules at intake. [Public input replay](E48InputReplay.lean)

The four checked dependency types are `HasInjRadiusAt.le_intr`, `compactLimit_global_pullback_metric_convergence`, `intrInj_ge_vol_of_ball` and `exists_uniform_local_volume_inj_radius`. The last two elaborated with the pinned `CheegerGromovTaylor.InjectivityRadius.LocalVolume` import. The package's curvature hypothesis uses the square root of the ordinary four-slot squared norm, so a bound on the Bour curvature-operator norm must be converted with the factor two. The local-volume theorem also assumes the metric norm bridge, a Ricci lower bound and the measured small-ball volume. Its proof selects the scale from dimension and shared radius and curvature constants, even though its statement fixes the metric before giving a radius. The globalization theorem starts from canonical metric convergence and compactness of the limit on connected approximants. The signed whole comparison still uses an orientation check. The harmonic-coordinate construction and stationary estimates remain separate inputs. [E47 stationary note](../13_bour_marked_limits_and_attainment/notes/E47_STATIONARY.md)

The public E47 types continue to distinguish a prescribed-excess positive start, the measured functional sublevel and first variation, the actual pointed comparison before the end identity, and the second extracted sequence. The start result still takes Yamabe normalization as input. The stationary ball bound applies in both scales under the class and scalar hypotheses. Compactness, ALE end geometry, positive smooth filling and realized rigidity retain their explicit gates. [E47 assessment](ED05_E47_BOUR_BUDGET_AND_MARKED_RETURN.md)
