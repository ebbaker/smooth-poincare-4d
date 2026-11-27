# FOT-E53 · Public declaration, axiom and geometric verification

27 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. Selected lead GPT-6.2 Astra/ultra, with bounded proof workers and independent readers configured as GPT-6.2 Sol/ultra. Separate serving telemetry was unavailable. [Assessment](../../reviews/ED07_E53_GEOMETRIC_INSTANCES_AND_FIXED_WIDTH.md) · [Issued proof packets](ED07_E53_PACKETS_20261127.md)

## Working sources and pins

The activation intake captured 343 working paths at 2026-11-27T10:11:04.404857-05:00. The scientific recheck at 2026-11-27T10:30:39.489568-05:00 compared 366 scientific files and recorded 115 additional or revised generations, including the master pause-strip calculation, its independent replay and the second marked double. The Git checkout was `48f36794f9b1aafc519a3bde9abec6df57eba51b`. [Initial generations](ED07_E53_WORKING_INPUTS.json) · [Late scientific generations](ED07_E53_SCIENTIFIC_RECHECK.json)

The final public package built successfully in **12110 Lake jobs**. The compiler reported `Lean (version 4.35.0-rc3, arm64-apple-darwin24.6.0, commit 470d5ce1400764999581fd26d5d72b00d990b0f4, Release)`. The ten installed dependency heads matched the Edition 07 manifest and their tracked worktrees were clean. The project toolchain, Lake configuration and manifest matched the E51 pin hashes. DifferentialGeometry was `788efe97894474c032de6dfb1289d515f613d15a` and Mathlib was `c55e6e786f49471c72fbddbec5415808896aec1e`.

## Exact public types and transitive axioms

All **226 new public names** in 14 modules elaborated through the package import. The full check covered **704 loaded kernel declarations**, including private and generated declarations. The imported module index listed 975 additional compiler-only implementation names without a loaded kernel declaration. No module declared an axiom, and every transitive dependency lay in `propext`, `Classical.choice` and `Quot.sound`. There were zero `sorryAx` dependencies. The public types retain the named marked geometry, physical jet and volume hypotheses. [Public replay](ED07_E53_PUBLIC_TYPES.lean) · [Full module assertion](ED07_E53_KERNEL_CHECK.lean)

| E53 module | Loaded kernel declarations | Public names | Source SHA-256 |
| --- | ---: | ---: | --- |
| [HMPRelativeClosing](../../../SmoothPoincare/Heights/HMPRelativeClosing.lean) | 133 | 41 | `1e7c170a52f86e3018767596d55316092b23bf6007ff1b0a93a5e389fac38dd4` |
| [HMPFramedShrink](../../../SmoothPoincare/Heights/HMPFramedShrink.lean) | 75 | 23 | `2a455462b860e43180d9dc476f8be024a914f5c9627a4d69cdcd6eb4cc311e08` |
| [HarmonicSeamCorridor](../../../SmoothPoincare/IntrinsicEntry/HarmonicSeamCorridor.lean) | 24 | 8 | `fdb38221d278857bbf5fcec6bdd02c9eb460573945699a4c544a402bf1cbfa09` |
| [HarmonicDiskPropagation](../../../SmoothPoincare/IntrinsicEntry/HarmonicDiskPropagation.lean) | 32 | 8 | `3d43325acf92a60d39da856e7e17ab482dd239339ef79051bf40b8e3e2ab9dfd` |
| [HarmonicStretchHarnack](../../../SmoothPoincare/IntrinsicEntry/HarmonicStretchHarnack.lean) | 8 | 7 | `6eb0ddcd09c0f6a3bfa1524e66de725a53ca5ec7a94291f4ff9f627471d9742e` |
| [FixedWidthHarmonicTest](../../../SmoothPoincare/IntrinsicEntry/FixedWidthHarmonicTest.lean) | 27 | 16 | `51de71c756f5691b681cd059e23ef5bffbc9e7c4e10ed0286cfd119f6cdb83f9` |
| [FixedBandCostEnclosure](../../../SmoothPoincare/IntrinsicEntry/FixedBandCostEnclosure.lean) | 12 | 4 | `016d807ff0e1a1b418e2544be22bcef16f829631b7ddff26e5002be8429a82a9` |
| [PauseStripRational](../../../SmoothPoincare/IntrinsicEntry/PauseStripRational.lean) | 96 | 16 | `6bc40a9f31230fa8a2b0c55b65073bbef9aa444310737b78ba22519f8566aed1` |
| [PauseStripCost](../../../SmoothPoincare/IntrinsicEntry/PauseStripCost.lean) | 26 | 15 | `40478849f60ad0843e63f79e276e098ff6b2168ee03d5293750bf13e78fc3b93` |
| [PauseStripCover](../../../SmoothPoincare/IntrinsicEntry/PauseStripCover.lean) | 44 | 13 | `33412a4095b3d96f03eac129ea50f440ee1510f587e90bd7ec25a57601e7d142` |
| [PauseStripTrial](../../../SmoothPoincare/IntrinsicEntry/PauseStripTrial.lean) | 19 | 6 | `bbb1eb5421705d9c36630c5a992f9d948b6b350374ade571be7773e5df2b5317` |
| [BourBufferedTruncation](../../../SmoothPoincare/Variational/BourBufferedTruncation.lean) | 86 | 30 | `1ce6b189c22f09bca26386c30c7590b9286f36bb9944c697877b43ab0152d240` |
| [BourVariablePolarCap](../../../SmoothPoincare/Variational/BourVariablePolarCap.lean) | 45 | 21 | `ee068e59299b9aa335a0dbecc4ac79549d75ffcd604810c5333a4ebbd05b1814` |
| [RoundCutGeometricCap](../../../SmoothPoincare/Variational/RoundCutGeometricCap.lean) | 77 | 18 | `ddfc7ab74d2bf6b3f83b917c88a024cf5ba270d9b275d5249df4b3ce62df3558` |

Exact public stdout SHA-256 `691cc6c0bb3573f40d047b34d85feb80a0b4c5f66c601003174846e3eab8fc5d`. Fixture SHA-256 `081f26a98feaf0252e69917db4757c8bbeabb187de0967a6f93abd0dd6a8f655`. Canonically sorted kernel record SHA-256 `deac28cb448991615ff2afa1d9d0f37c0ccc8c81e5a21211c94c78d41336ce9c`.

## Independent applications and prior public surface

The two independent E53 fixtures elaborated **49 explicit examples** and printed **74 axiom reports** without diagnostics. Their tests include a point that lies in the original full marked tubular neighborhood, the critical radius of its shrink, a shell of the complete capped model, the sign at zero boundary trace, exact exponential endpoints and a physical complete-cost application. The E52 and inherited E51 replay outputs reproduced their recorded SHA-256 hashes. [Marking and core readback](../../reviews/E53_MARKING_AND_CORE_READBACK.md) · [Metric and sign readback](../../reviews/E53_METRIC_AND_SIGN_READBACK.md)

| Replay | Examples | Type checks | Axiom reports | Stdout SHA-256 |
| --- | ---: | ---: | ---: | --- |
| [E53_MARKING_AND_CORE_CHECKS](../../../investigations/reviews/E53_MARKING_AND_CORE_CHECKS.lean) | 22 | 0 | 28 | `ba071d7c0b08e7bb9ef6a9c9925ade58dce6f5987ca36a1c627a088c6e3e173c` |
| [E53_METRIC_AND_SIGN_CHECKS](../../../investigations/reviews/E53_METRIC_AND_SIGN_CHECKS.lean) | 27 | 0 | 46 | `586f51213ac5365515284aed8a9acf7c540debea7b8a1cd83233b5462b159751` |
| [E52_EULER_AND_SIGNATURE_CHECKS](../../../investigations/reviews/E52_EULER_AND_SIGNATURE_CHECKS.lean) | 5 | 0 | 6 | `54e91f5b8e1c510173ff05c63386778411937a4de100f0b58d92346995f64d24` |
| [E52_FORM_CHECKS](../../../investigations/reviews/E52_FORM_CHECKS.lean) | 16 | 0 | 12 | `8c7dca1703d270ca1f60a526e131b78015bffc34e2a1805ad64ead9d9522cdf5` |
| [E52_MARKING_CHECKS](../../../investigations/reviews/E52_MARKING_CHECKS.lean) | 9 | 10 | 19 | `190ae65a1aec5c9435045296e9572006c09435b45e350dad2a9259caa396fa6c` |
| [E52_METRIC_AND_LOGIC_CHECKS](../../../investigations/reviews/E52_METRIC_AND_LOGIC_CHECKS.lean) | 7 | 0 | 5 | `0a2bcc55aa69439837b030f80a0933d49acef216f6131b5bdfd5a6af66be253a` |
| [E52_SPECIMEN_CHECKS](../../../investigations/reviews/E52_SPECIMEN_CHECKS.lean) | 4 | 0 | 12 | `54e446282f274671b92235867fc9ebf5894e65fee072b302ecfd3e6f8a2feb21` |
| [ED06_E51_PUBLIC_TYPES](../../../investigations/research-progress/handoffs/ED06_E51_PUBLIC_TYPES.lean) | 0 | 164 | 164 | `729c013eee3056656a29849724d0cc624c171f15708fad2e180a50691c0f6d2b` |
| [E51_INDEPENDENT_PUBLIC_CHECKS](../../../investigations/reviews/E51_INDEPENDENT_PUBLIC_CHECKS.lean) | 27 | 0 | 65 | `ccb3b2f005626b82ae4fa6b7a66302369d6876da26af6b20b763885a2fb2c427` |
| [ED07_E52_PUBLIC_TYPES](../../../investigations/research-progress/handoffs/ED07_E52_PUBLIC_TYPES.lean) | 0 | 696 | 696 | `d1096f723e6f74689296e7a207a54ff5e0300ec9026f1cfb52cb0ed99201c1c8` |
| [ED07_E52_KERNEL_CHECK](../../../investigations/research-progress/handoffs/ED07_E52_KERNEL_CHECK.lean) | 0 | 0 | 0 | `fc555fb3e982edb7b856c3d3f17e9ba204f4d82183031f69d4f30350d8cd86ed` |

The original scientific checker also replayed its fifty-cell rational proof and reported the conservative $169\pi^2/25$ band floor. The E53 kernel certificate uses forty cells, positive Taylor coefficients through degree twenty and the geometric upper tail starting at degree twenty-one. The real-interval proof and the marked geometric comparison retain the floor 133 and give $17689\pi^2/1250$ on each of the two original closed charges. [Original scientific replay](../../../../papers/master/numerics/pause_strip_cost.py) · [Real-cell cover](../../../SmoothPoincare/IntrinsicEntry/PauseStripCover.lean) · [Closed-cost composition](../../../SmoothPoincare/IntrinsicEntry/PauseStripTrial.lean)

## Rendered blueprint

Ghostscript interpreted all 70 PDF pages with stop-on-error. All 277 blueprint labels resolved in both published formats and 21 Edition 07 destinations matched their printed captions. The HTML check validated 960 distinct Lean declarations and 86,156 source-line anchors on 394 referenced pages. The dependency graph marks 18 Edition 07 propositions checked and the two universal problems open. All 18 declared Edition 07 dependencies are reachable. [Chapter source](../../../blueprint/src/edition_seven_entry_and_marked_recognition.tex)

| Artifact | SHA-256 |
| --- | --- |
| `blueprint/src/edition_seven_entry_and_marked_recognition.tex` | `3081acf7a8e6581ae3a6db918fc62603a7a23bcba92c75b96a3d710acc8b52ff` |
| `blueprint/web/sec-ed07.html` | `99893c00e11943960a5532b2f5e49f256d04a86f198594250551d98557840737` |
| `blueprint/web/dep_graph_document.html` | `b7e2da4abcd810688afdeaaa2ff9060264a876e4e174beb3e33466feedd241bd` |
| `blueprint/print/print.pdf` | `c296574541b79130373e3437416c1a97f8c78f3edf7b8bbc33625a197e42c31e` |

## Repository checks and public record

The E53 umbrella imports follow the inherited public imports. This preserves E52's kernel ownership of generated declarations in addition to its exact public type and axiom outputs. Staged and unstaged whitespace checks passed. The repository-wide link audit found four earlier references in scientific 08/03 to its missing `RETURNS_SECOND_20261127.md` handoff. All E53 formalization links resolved.

The exact thread source could not be retrieved. The public excerpts have explicit partial provenance, and the canonical registry has no new export from this turn. [Unregistered public excerpts](../../chat-histories/UNREGISTERED_PARTIAL_E53_20261127.md)

## Replay from the formalization directory

```sh
lake build
lake env lean -j1 investigations/research-progress/handoffs/ED07_E53_KERNEL_CHECK.lean
lake env lean -j1 investigations/research-progress/handoffs/ED07_E53_PUBLIC_TYPES.lean
lake env lean -j1 investigations/reviews/E53_MARKING_AND_CORE_CHECKS.lean
lake env lean -j1 investigations/reviews/E53_METRIC_AND_SIGN_CHECKS.lean
lake env lean -j1 investigations/reviews/E52_EULER_AND_SIGNATURE_CHECKS.lean
lake env lean -j1 investigations/reviews/E52_FORM_CHECKS.lean
lake env lean -j1 investigations/reviews/E52_MARKING_CHECKS.lean
lake env lean -j1 investigations/reviews/E52_METRIC_AND_LOGIC_CHECKS.lean
lake env lean -j1 investigations/reviews/E52_SPECIMEN_CHECKS.lean
lake env lean -j1 investigations/research-progress/handoffs/ED06_E51_PUBLIC_TYPES.lean
lake env lean -j1 investigations/reviews/E51_INDEPENDENT_PUBLIC_CHECKS.lean
lake env lean -j1 investigations/research-progress/handoffs/ED07_E52_PUBLIC_TYPES.lean
lake env lean -j1 investigations/research-progress/handoffs/ED07_E52_KERNEL_CHECK.lean
make -C blueprint
python3 ../papers/master/numerics/pause_strip_cost.py
```
