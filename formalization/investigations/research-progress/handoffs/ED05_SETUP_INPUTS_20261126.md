# Edition 05 setup · Working sources, installed dependencies and Blueprint

26 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. The selected configuration was GPT-6.2 Astra/ultra leadership with the previously selected bounded proof configuration. This receipt records setup verification. Serving model and reasoning effort were unavailable. [Edition 05 overview](../../research-overview/05_OVERVIEW.md) · [Program register](../REGISTER.md) · [Verified E46 foundation](ED04_E46_VERIFICATION_20261126.md)

## Working source and scope

The Git intake was `4da586548b445ccfe9145c6a5671c0f7ecd433f3`. At 13:34:31 EST the nine scientific TeX and PDF pairs scoped by the E46 receipt matched its working snapshot. A tenth local pair had appeared for the Bour attainment draft. The draft was working-tree evidence at intake. Its primary targets are `prop:budget` on the original fourth-order flow at a fixed positive parameter, `lem:mark` on the actual punctured core and its complete return, and `thm:main` on the selected entered type, including the second critical-metric limit. [Bour draft](../../../../papers/investigations-1/06_bour_flow_and_fixed_type_attainment/manuscript/fixed_type_attainment.tex) · [Bour paper register](../../../../papers/investigations-1/06_bour_flow_and_fixed_type_attainment/research-progress/REGISTER.md)

The paper works with a smooth closed connected oriented Riemannian homotopy four-sphere, volume-one positive Yamabe starts within `α²` of the fixed-type infimum, and the two Hilbert–Schmidt Weyl block norms. It takes positive subcritical entry on that type as a premise and limits the attainment claim to it. Rigidity of an attained minimizer and universal coverage are separate forward targets. Bour v1 Theorem 1.11 supplies a fixed-parameter dichotomy under its initial pinching. The working paper uses the strictly pinched case and records Bahuaud–Helliwell Theorem A for the short-time gauge. Its pointed return and parameter-uniform estimates have independent paper readings. The original review motivates the route, and the scientific notes state the exact premise levels of each input. [Bour, Theorem 1.11](https://arxiv.org/html/1012.0342v1) · [Bahuaud–Helliwell, Theorem A](https://arxiv.org/pdf/1407.4406v1#page=2) · [Source receipt](../../../../references/SOURCE_NOTES_BOUR_ATTAINMENT_20261126.md) · [F2 proposal](../../../../papers/master/reviews/claude/EXTERNAL_PROGRAM_REVIEW_20261126.md#f2-the-extraction-problem-can-probably-be-replaced-by-a-fourth-order-flow-that-is-already-in-the-literature)

The concurrent collar and surgery packets cover the actual paired ports, integral two-port outlet, peripheral slopes, bridge disk, and closing on supplied marked presentations. Those are paper inputs in this setup. The established Lean relative-pair theorem needs the supplied maps and cancellation certificates. The relative Pontryagin identity on the finite pocket remains a separate formalization dependency of E46, whose tested Euler current is a Ricci-flow result. [Two-port handoff](../../../../papers/investigations-1/05_collar_deformation_and_surgery/research-progress/handoffs/TWO_PORT_INDEPENDENT_READINGS_20261126.md) · [Native transgression](../../../../papers/investigations-1/05_collar_deformation_and_surgery/01_collar_deformation_and_adapted_coordinates/notes/BOUNDARY_TRANSGRESSION.md) · [E46 continuation](../../continuation-notes/AFTER_FINITE_POSITIVE_POCKETS_20261126.md)

The 227 working topic files reproduce the E46 aggregate `0cc570ffcd7f73cefffeee5ee6f8e3ccc08720e74026b0fdbd6a3345ebaf9497`. The public root, Edition 04 chapter and E46 verification receipt respectively reproduce `70cae52e8fcf038c124101a50499c95a2b39764dd84ba1fc2aea695b5c8bb3a4`, `83c155ddd132a79b9d6d5805e3c46cabe8b86390be3e817edc06f958a169f7a2`, and `a74bdab6da56c8e2c3c7b043451e60a86b078611526db97095a2a9e54821752b`. The 22 E46 applications replayed successfully under the public root. [E46 public applications](../../reviews/ED04_E46_PUBLIC_CHECKS.lean)

## Installed toolchain and package pins

Lean reports `4.35.0-rc3` at commit `470d5ce1400764999581fd26d5d72b00d990b0f4` on `arm64-apple-darwin24.6.0`, and Lake reports `5.0.0-src+470d5ce`. The actual selector, Lake definition and root manifest respectively hash to `bc84812c94489d1e3e191baa1dc10d5eb684382d7fe9d2a5ab085e72c1c67e47`, `35562fc83d2a568ae4ae08f3e6878481f5cf1c505775acec414dc924f7bfa9db`, and `839111aae86b693524cd57db5ce7f2e8edc972dad49296468eb18d6735e52239`. Their bytes match E46. The ten installed package HEADs match their root pins, tracked package status is clean, and all 19 nested entries match the root dependency graph. [Root Lake manifest](../../../lake-manifest.json)

| Package | Working checkout HEAD | Nested entries |
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

## Existing Lean interfaces and prerequisites to formalize

A fresh `lake env lean -j1` process on a temporary source with `import SmoothPoincare` replayed sorted `#check @name` and `#print axioms name` for 14 declarations. Combined output SHA-256 is `e3b297e3becca9693afd6567fa379580ba1e1bb7e15817074581bafaccfee560`. Thirteen records match E46's captured bytes. The accounting bound `FirstOrderTwistor.accountedEnergy_le_totalEnergy` was separately elaborated in this replay. The transitive axiom union is `Classical.choice`, `Quot.sound` and `propext`.

| Public interface checked | Scope |
| --- | --- |
| `FirstOrderTwistor.geometricPositiveEnergies`, `geometricPullbackCompetitor`, `geometricDescentOnOriginalType` | Admissible positive-energy set, transport across a supplied oriented diffeomorphism, and a same-type competitor under the stipulated comparison. |
| `FirstOrderTwistor.accountedEnergy_le_totalEnergy` | A lower bound from a supplied fixed-domain accounting limit. |
| `SmoothPoincare.geometricRecognitionEndpoint`, `bandPhysical_yamabeEuler_sandwich` | Recognition under its supplied geometric classification and an energy bound under the physical Yamabe/Euler hypotheses. |
| `SmoothPoincare.exists_nativePocket_positive_metric_slices`, `originalDisk_finite_positive_caps_of_balance`, `selectedMatchedCap_scalarTest`, `retainedCore_nearSharp_limits` | Native metric positivity, actual finite cap prices given signed relative balance, inclusive complete cap test, and conditional near-sharp control of the measured core. |
| `SmoothPoincare.ricciFlow_terminalPointed_noncompact_of_initialVolume`, `ricciFlow_testedEuler_hasDerivAt_gradient` | Rescaling and tested Euler transport under the stated second-order Ricci-flow hypotheses. |
| `SmoothPoincare.RelativePairReplacement.exists_terminalPairReduction`, `reverseMiddleCore_nullHomologous` | Terminal count with actual geometric certificates and the reversing-core obstruction on the supplied rank-changing trace. |

The dependency search covered the public Lean source tree and the pinned DifferentialGeometry and Mathlib source trees. The searched ecosystem contains geometric compactness and Ricci-flow solution APIs. The bounded-geometry compactness source starts from `SeqBoundedGeometry`; the compact-limit globalization statement uses supplied compactness data. Their use in the Bour program needs the needed estimates and comparison maps in each chosen gauge. The Hamilton compactness source encodes a Ricci-flow solution. [Pinned dependency lock](../../../lake-manifest.json)

| Next formalization dependency | What must be supplied |
| --- | --- |
| Fourth-order equation and first variation | Represent the actual time-dependent oriented metric, chiral and full norms, trace-free Ricci and scalar charges, smooth energy derivatives and Bour's `−2 grad F^α`. Check the Gauss–Bonnet identity in the chosen normalization. |
| Fixed positive parameter | Short-time gauge, continuation, derivative estimates, noncollapse and dissipation on the original trajectory, including the change of time by the squared metric scale. Derive the closed and noncompact alternatives for that equation. |
| Both critical-metric branches | The constant-scalar Ricci equation in both physical gauges, parameter-uniform harmonic-coordinate estimates and the elliptic bootstrap, then the appropriate closed or rescaled pointed extraction. |
| Pointed return | Carry one complete truncated core in its actual oriented markings, derive ALE structure and the end count, construct the smooth compactification and positive class, and return it to the original carrier with two-sided comparison maps and the complete energy inequality. |
| Attainment versus coverage | Identify a positive same-type class with energy exactly the infimum before addressing classification or an admissible negative direction. Universal entry still needs its own witness on types outside existing direct recognition. |

The installed imports for `DifferentialGeometry.CheegerGromovCompactness.HasInjRadiusAt.le_intr` and `compactLimit_global_pullback_metric_convergence` were separately elaborated and axiom-checked. Their transcript SHA-256 is `64ad487f9595e615eed1b47db6dc90c77bdce88d790f983f9a754e28289359f9` and the axiom union is the same. The latter result turns supplied canonical compact-limit data into eventual whole smooth comparison diffeomorphisms on connected source carriers and preserves smooth metric convergence. A use on the original oriented type still requires the orientation check. The bounded-geometry and Hamilton compactness interfaces were located and read at source level. The immediate installed build lacked their precompiled modules.

## Later scientific observation

The 13:38:56 EST observation captured concurrent scientific edits over the same intake Git tree. The ten rows give the transitive working TeX generation and the local PDF present at that time. The generation hashes sorted `path<SPACE>file-SHA256<LF>` records, following literal uncommented TeX includes. The PDF column records the local bytes at the observation. Several manuscripts were being edited and their PDF generation could lag. The 06 draft and reading copy were checked together as described below. [Manuscript registry](../../../../tools/build_manuscripts.py) · [Generation procedure](ED04_ACTIVATION_AUDIT.py)

| Manuscript | TeX files | Working TeX generation SHA-256 | Local PDF SHA-256 |
| --- | ---: | --- | --- |
| Master | 11 | `297b938c12c5f2c25027075c6eb7ac8516a844e59da46713d3e43cec4fa79692` | `b4fe88efe122f1524ac452a27bc2ed35b8c926872dafcccbab1bb7c971defe5e` |
| Fixed-type descent | 21 | `bff4a9c25d4b915ea8d85245606a4a7629d83acb0f3bc21dd01c79fd0ed891ae` | `65e84af3b58c92141312e73fdf995a36c69c7efafc762677e3091f1762213a26` |
| Physical neck | 7 | `ff3c7010100cf731bc3f007ae82ac1861ed39ec10d36b7117294e3910da9ff43` | `5c273dd27b0e779c11be21c76e58bc20dcebfae020ee62cb67bc3605939160f1` |
| Immersed construction | 5 | `9f1bf9a87a1daafea00723e14d1149f739caae4c1887e6195016145250a81756` | `be162dcd5094fb92fdb632939e80c7e97021ab498fa0a42137fec8c2aeb713b0` |
| Immersion parent | 1 | `25ab843f0439c7b64b88fea3f782ec4ae52e3ab65c51897a6933d944ec377225` | `5b333c1399f51169067b9b95040daa188ea033e9e0ad4bfca14606bd3139027d` |
| Height recognition | 1 | `f8995353a388aab08e9487f15ad04dc20539a3f9d2e412131a0cae640eb0f8de` | `749114d5e275671622664374e7822d4218ad20351c91a5fb10b07638d3889901` |
| Marked collars and smooth recognition | 1 | `04335315549d454860674001faf387898e5931e2da6213b252f45ac3d7dba73f` | `708e2229c6c05f2545d76925b95e0eb6f9ea8bc75a620b11440fd92ab3f1bf2a` |
| Deformation of marked spherical collars | 2 | `3b6e4e5d634cae61ea8af9de744e97e83979a20f9c6f8a139f387c12e209d594` | `4da1743ebe12588b9ea045f9bdb64765ae3425216f3bbafd042ac52ea9cbaed2` |
| Recognition from marked handle cuts | 1 | `e2ad22fbb1c0da596ec12159baf58d65a4a0134bb8527ed60b5bba4ca50e79f8` | `0a128cbbb6042f52ed286b27b9f7031c3e60d0f9368fabe1398ad4cf02ab464e` |
| Fixed-type attainment | 1 | `23aceaccee4faa97fde5eb8a7a4f1d1d6aca18363a8a80da456a6d13af415aa6` | `e44dd506d09c7d37c01aefef75d68f9bba813f87fbb17beee9f3c177f06f821c` |

The 06 raw source and bibliography for the final checked rebuild have hashes `719bbea527c6db649eaeee93e58e1f6b50f101772d79b406ee3ec378dca357f1` and `3036e2f4c2755a12484d8917fb1ea7d98f95cdd6efe2a59de843750c01c3a45b`. A clean project-builder PDF and the updated canonical reading copy have byte-identical extracted page text with SHA-256 `598c3b7f483c8a62367bac7fd5b13a8c01d30ae1e8184ffcf70d9ccc38a857f5`. This comparison initially detected the earlier reading copy lagging the current text. The updated copy passes Ghostscript interpretation. The subsequent HEAD `4d73fdde6804ce93fc2a3e4cef403e16eb941dab` records coordinated scientific and planning changes. The observation above identifies the working inputs actually checked.

| Selected source or reading | Working file SHA-256 |
| --- | --- |
| [Bour source passages](../../../../references/SOURCE_NOTES_BOUR_ATTAINMENT_20261126.md) | `f803dadc58ee27baddb7d216974147a181752264a0890bd0b85c24b5dd202a30` |
| [Bour fixed-parameter source audit](../../../../papers/investigations-1/06_bour_flow_and_fixed_type_attainment/01_regularized_flow_and_energy/notes/BOUR_AUDIT_20261126.md) | `34138752da571bad8741601b03d5967300d806bc2658105a5291c8e8bc8b29e2` |
| [Original flow estimates](../../../../papers/investigations-1/06_bour_flow_and_fixed_type_attainment/01_regularized_flow_and_energy/notes/ORIGINAL_FLOW_20261126.md) | `51f5a14278dcd7cac67953726375a43f8aec6189b4b60c2145fa3ae3b7e587c7` |
| [Marked-core return](../../../../papers/investigations-1/06_bour_flow_and_fixed_type_attainment/02_marked_limits_and_attainment/notes/MARKED_CORE_20261126.md) | `f3899cded68baa98a33b5dc5bf340dc7b0c9c50ed7222c64f923063cc91cf76f` |
| [Constant-scalar critical estimates](../../../../papers/investigations-1/06_bour_flow_and_fixed_type_attainment/02_marked_limits_and_attainment/notes/CSC_ESTIMATES_20261126.md) | `db5e120ef9dbbb0b387f492e8d2e1d9a3fff2c6210ff4875bd1d0a44b3451247` |
| [Analytic independent reading](../../../../papers/investigations-1/06_bour_flow_and_fixed_type_attainment/reviews/READING_FLOW_AND_LIMIT_20261126.md) | `eb039705e5fcee75caa4e71cec593b58c62e45dc8f71e7234920fb73d2333bf6` |
| [Marked independent reading](../../../../papers/investigations-1/06_bour_flow_and_fixed_type_attainment/reviews/READING_MARKED_ATTAINMENT_20261126.md) | `509837e171935f2df2ea95811da93d4560415f30bdd882eff57cfb5090eeda35` |
| [Working 06 assessment](../../../../papers/investigations-1/06_bour_flow_and_fixed_type_attainment/reviews/FIXED_TYPE_ATTAINMENT_20261126.md) | `f2127673f925ba77cc02e7d7ece9b3bac11fdf37270d6ee3d0354b171a71a2e2` |
| [Updated master plan](../../../../papers/master/research-plan/PLAN.md) | `dfaa10caf2997157ddd5d7a2cea4e17aa5cd4f1941ef6f80440e97b5de8c88ac` |
| [Claude program review](../../../../papers/master/reviews/claude/EXTERNAL_PROGRAM_REVIEW_20261126.md) | `27ad468cb494e051ca45b019295d10ea6a8d351ad54a1fea9dbcbc62cff850dd` |
| [Surgery source record](../../../../references/SOURCE_NOTES_COLLAR_SURGERY_20261126.md) | `2300299434d8f71f671f325605591a2cf83d36ed9260dd716664d44e17279bec` |
| [Compressed port slope](../../../../papers/investigations-1/05_collar_deformation_and_surgery/02_handle_isolation_and_marked_surgery/notes/COMPRESSED_PORT_SLOPE.md) | `27b35bdba6dbf8816d07ed8a45061b279448d7662ddb26c20a9df8bfbee9da84` |
| [Knotted port closing](../../../../papers/investigations-1/05_collar_deformation_and_surgery/02_handle_isolation_and_marked_surgery/notes/KNOTTED_PORT_CLOSING.md) | `007316c55f8b133b2ac02b54517a022340509349248e6d0dcb69352608ccc5bd` |

## Final setup Blueprint

`make -C formalization/blueprint all` passed the default 11,191-job Lake build and rendered both formats. Ghostscript interpreted the PDF with `-dPDFSTOPONERROR`. The independent audit found all 207 source labels in HTML and as actual PDF named destinations. The chapter and all ten planning titles appear on their expected printed pages. The dependency graph represents all 15 stated Edition 05 dependency paths, with 12 direct edges after transitive reduction. Its ten open nodes and their HTML headings carry open status. The chapter introduces no Lean declaration link. All 701 inherited label/declaration occurrences were identical, all 700 distinct compiled anchors resolved, and the 309 referenced source pages matched a total of 60,601 exact lines. [Edition 05 chapter](../../../blueprint/src/edition_five_bour_attainment.tex)

| Final rendered source or artifact | SHA-256 |
| --- | --- |
| Edition 05 TeX | `6e544693aa514d527741215c17a8fb4917537fa0c08eafad07e8a7888fd87262` |
| 53-page Blueprint PDF | `7597f51a3f626fe7230a11ddc750c1fafc151b7478cc9d5dd9049df3fbb1b763` |
| Edition 05 HTML | `bc6bd9511686639ef0e3c979b22d8cfe10502609032ba66b152e22cbfbe20347` |
| Dependency graph HTML | `1ccc3ad7bd8fefc2ae06f75723b7331009376e09f385ebd4af6f9fb5ff79f453` |
