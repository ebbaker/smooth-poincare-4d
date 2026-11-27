# FOT-E52 · Verification of the public formalization

27 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. The selected lead configuration was GPT-6.2 Astra/ultra. Bounded proof and independent-reading workers were requested as GPT-6.2 Sol/ultra. Separate serving telemetry was unavailable. [Mathematical assessment](../../reviews/ED07_E52_MARKED_CUTS_AND_CLOSED_CAPS.md) · [Issued packets](ED07_E52_PACKETS_20261127.md)

## Working inputs and pinned build

The activation intake at 2026-11-27T09:44:16.362763-05:00 recorded 267 working paths at `48f36794f9b1aafc519a3bde9abec6df57eba51b`. Scientific generations were rechecked at 2026-11-27T09:56:11.323149-05:00, yielding 28 additional or changed paths. The two receipts preserve the hashes for replay while the scientific authors continue work. [Activation generations](ED07_E52_WORKING_INPUTS.json) · [Late scientific inputs](ED07_E52_SCIENTIFIC_RECHECK.json) · [Edition 07 issue receipt](ED07_SETUP_INPUT_HASHES_20261127.json)

The final public package built successfully in **12088 Lake jobs**. The installed compiler reported `Lean (version 4.35.0-rc3, arm64-apple-darwin24.6.0, commit 470d5ce1400764999581fd26d5d72b00d990b0f4, Release)` and `Lake version 5.0.0-src+470d5ce (Lean version 4.35.0-rc3)`. All ten package heads match the edition manifest and have clean tracked trees. The toolchain, manifest and Lake configuration match their E51 intake SHA-256 values. DifferentialGeometry is pinned at `788efe97894474c032de6dfb1289d515f613d15a` and Mathlib at `c55e6e786f49471c72fbddbec5415808896aec1e`.

## Public declarations and axioms

The public package import exposes **696 E52 names** in 13 modules, including type and structure machinery. Each exact type and axiom report elaborated. A separate Lean check covered **967 loaded kernel constants**, including generated and private entries. The import map also lists 602 compiler-only private implementation names without a loaded kernel declaration. The audit rejects any axiom declaration in those modules and any transitive dependency outside `propext`, `Classical.choice` and `Quot.sound`. The audit found zero new axioms and zero `sorryAx` dependencies. Geometric assumptions appear in the public types. [Exact public types and axiom replay](ED07_E52_PUBLIC_TYPES.lean) · [Full kernel assertion](ED07_E52_KERNEL_CHECK.lean)

| E52 module | Kernel constants | Public names | Source SHA-256 |
| --- | ---: | ---: | --- |
| [SignedCollarDefect](../../../FirstOrderTwistor/SignedCollarDefect.lean) | 34 | 26 | `2eac695acb0b74074a3d37805fabfc65efb8ea30e4ad417818b2065cf675beeb` |
| [MarkedSeparatorDegree](../../../SmoothPoincare/Heights/MarkedSeparatorDegree.lean) | 14 | 12 | `dc6e54c5264fd4dc33fea422b3ac8c75a0fc0be3ac432c7d4dc075cc58779dab` |
| [MarkedNativeRecognition](../../../SmoothPoincare/Heights/MarkedNativeRecognition.lean) | 231 | 172 | `c905e182e921c1de6cb9d6f9a9e76af843bb2163f987a60d9ffc6a4bc513871b` |
| [ThreeCuffNeumann](../../../SmoothPoincare/IntrinsicEntry/ThreeCuffNeumann.lean) | 106 | 85 | `682b57e6def7ad4d621961b5ad41e28f17609bb7a8035656953d8ed184b9508e` |
| [FixedBandCurvature](../../../SmoothPoincare/IntrinsicEntry/FixedBandCurvature.lean) | 29 | 20 | `1711ebdc1b6b0ea7ae6a3afcc57ea0bfce0e53efe67c52bfa47f674ae21f1bd6` |
| [MatchedBallMetric](../../../SmoothPoincare/IntrinsicEntry/MatchedBallMetric.lean) | 28 | 11 | `675557f1e919a559140af9c63001416a20081cbd33d4f76a2a5e0a795255a05b` |
| [MatchedBallRobin](../../../SmoothPoincare/IntrinsicEntry/MatchedBallRobin.lean) | 117 | 94 | `5ad418807edefa92129e597246be1b0e0cf4c59eac8fb700dea90333b30a7a0e` |
| [WeightedBallRobin](../../../SmoothPoincare/IntrinsicEntry/WeightedBallRobin.lean) | 77 | 59 | `c60a4b0d16f468b866659911617f4868c3421658bce662aea3b63f5b062c5ec1` |
| [RoundLatitudeRobin](../../../SmoothPoincare/IntrinsicEntry/RoundLatitudeRobin.lean) | 51 | 18 | `0249a2081fd6cc468bdad6ca99915aec6aa456e20ee32b5cba558e1bbebdc073` |
| [MarkedCapSmoothing](../../../SmoothPoincare/Variational/MarkedCapSmoothing.lean) | 85 | 59 | `7186e4b3b6ba6075e333081d33f019278f0b26198fdb0fcbf06c785df6ec6938` |
| [AttainedRoundCut](../../../SmoothPoincare/Variational/AttainedRoundCut.lean) | 33 | 24 | `0f8bb190f1776d2cc9f46d9e72496e1ad0869120854508e285f1de958fb8a7db` |
| [BourClosedCapEuler](../../../SmoothPoincare/Variational/BourClosedCapEuler.lean) | 123 | 89 | `d45c2956c9021616c0e63a88e58560ac147b34b941353f63277fa2d71008894d` |
| [RecognitionFromAttainment](../../../SmoothPoincare/Variational/RecognitionFromAttainment.lean) | 39 | 27 | `4e070c45ce7da2624e788d649b94c972fcd3fb77f51b68bfd7d27a59d8e949ba` |

The exact public stdout hashes to `d1096f723e6f74689296e7a207a54ff5e0300ec9026f1cfb52cb0ed99201c1c8`. The public fixture hashes to `f5898c6aed4f49421bf6337f604b949c4b049a8ac682aa5006b748f486aa25eb`. The canonical sorted kernel records, including type hash, declaration kind and universe parameters, hash to `e7996e5bd6525e7807f20c8fcb17e774230d18fa88a42e2b375f8a6c553a7ee4`.

## Independent applications and inherited replays

Five independent E52 fixtures elaborated **41 explicit examples** and printed **54 axiom reports**. Each completed without diagnostics. The E51 exact public declarations and E51 independent fixture also reproduced their previously recorded stdout byte for byte.

| Lean replay | Explicit examples | `#check` | Axiom reports | Stdout SHA-256 |
| --- | ---: | ---: | ---: | --- |
| [E52_EULER_AND_SIGNATURE_CHECKS](../../../investigations/reviews/E52_EULER_AND_SIGNATURE_CHECKS.lean) | 5 | 0 | 6 | `54e91f5b8e1c510173ff05c63386778411937a4de100f0b58d92346995f64d24` |
| [E52_FORM_CHECKS](../../../investigations/reviews/E52_FORM_CHECKS.lean) | 16 | 0 | 12 | `8c7dca1703d270ca1f60a526e131b78015bffc34e2a1805ad64ead9d9522cdf5` |
| [E52_MARKING_CHECKS](../../../investigations/reviews/E52_MARKING_CHECKS.lean) | 9 | 10 | 19 | `190ae65a1aec5c9435045296e9572006c09435b45e350dad2a9259caa396fa6c` |
| [E52_METRIC_AND_LOGIC_CHECKS](../../../investigations/reviews/E52_METRIC_AND_LOGIC_CHECKS.lean) | 7 | 0 | 5 | `0a2bcc55aa69439837b030f80a0933d49acef216f6131b5bdfd5a6af66be253a` |
| [E52_SPECIMEN_CHECKS](../../../investigations/reviews/E52_SPECIMEN_CHECKS.lean) | 4 | 0 | 12 | `54e446282f274671b92235867fc9ebf5894e65fee072b302ecfd3e6f8a2feb21` |
| [ED06_E51_PUBLIC_TYPES](../../../investigations/research-progress/handoffs/ED06_E51_PUBLIC_TYPES.lean) | 0 | 164 | 164 | `729c013eee3056656a29849724d0cc624c171f15708fad2e180a50691c0f6d2b` |
| [E51_INDEPENDENT_PUBLIC_CHECKS](../../../investigations/reviews/E51_INDEPENDENT_PUBLIC_CHECKS.lean) | 27 | 0 | 65 | `ccb3b2f005626b82ae4fa6b7a66302369d6876da26af6b20b763885a2fb2c427` |

The marking tests exercise incompatible PSC and degree components, both residual markings and the HMP closing. The form tests distinguish free traces on the retained funnels from the original closed ground state. The Euler tests exercise the Ricci ceiling at equality and reversed collar signs. The metric tests use nonconstant boundary data and the separate universal quantifiers. The specimen tests check the two latitude jets and the curvature-slot convention in a round stereographic chart. [Marking](../../reviews/E52_MARKING_READBACK.md) · [Spectral forms and smoothing](../../reviews/E52_FORM_READBACK.md) · [Euler and signature](../../reviews/E52_EULER_AND_SIGNATURE_READBACK.md) · [Metric and logical scope](../../reviews/E52_METRIC_AND_LOGIC_READBACK.md) · [Concrete specimens](../../reviews/E52_SPECIMEN_READBACK.md)

## Blueprint

The print and web editions rebuilt. Ghostscript interpreted all 68 PDF pages with stop-on-error. All 270 source labels resolved in both outputs. The 14 Edition 07 destinations matched their printed captions. The web audit checked 918 distinct Lean declarations against compiled positions and 81,992 source-line anchors on 380 referenced pages. The graph marks the eleven conditional propositions as checked and both universal problems as open. Each of the eight explicit Edition 07 dependencies is reachable. [Edition 07 blueprint source](../../../blueprint/src/edition_seven_entry_and_marked_recognition.tex)

| Artifact | SHA-256 |
| --- | --- |
| `blueprint/src/edition_seven_entry_and_marked_recognition.tex` | `d9a3d8586b725706dc0f69fe4c5c503c748743a22aec53dfe0fb91d7e143a305` |
| `blueprint/web/sec-ed07.html` | `e65761ac6ab0088835aff59e521f35a62f756c1bf86b44d1d520eb298be2ac79` |
| `blueprint/web/dep_graph_document.html` | `e406f86a667c61159e18b93f58e58f8a22e844db9190f53f85f3e4b942466cae` |
| `blueprint/print/print.pdf` | `1277cf2d061832cddce978db1ad7c70c6b6b668ea064e6d7972002bd6069aa18` |

Staged and unstaged whitespace checks passed. The repository-wide hygiene scan found no formalization link errors. Its four outstanding references in scientific 08/03 all point to the missing `RETURNS_SECOND_20261127.md` in that branch.

## Replay from `formalization/`

```sh
lake build
lake env lean -j1 investigations/research-progress/handoffs/ED07_E52_KERNEL_CHECK.lean
lake env lean -j1 investigations/research-progress/handoffs/ED07_E52_PUBLIC_TYPES.lean
lake env lean -j1 investigations/reviews/E52_EULER_AND_SIGNATURE_CHECKS.lean
lake env lean -j1 investigations/reviews/E52_FORM_CHECKS.lean
lake env lean -j1 investigations/reviews/E52_MARKING_CHECKS.lean
lake env lean -j1 investigations/reviews/E52_METRIC_AND_LOGIC_CHECKS.lean
lake env lean -j1 investigations/reviews/E52_SPECIMEN_CHECKS.lean
lake env lean -j1 investigations/research-progress/handoffs/ED06_E51_PUBLIC_TYPES.lean
lake env lean -j1 investigations/reviews/E51_INDEPENDENT_PUBLIC_CHECKS.lean
make -C blueprint
```
