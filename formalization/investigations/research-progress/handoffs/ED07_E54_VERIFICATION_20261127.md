# FOT-E54 · Public verification and axiom receipt

27 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. Requested routing was Astra/ultra leadership with bounded GPT-6.2 Sol/ultra proofs and independent readings. Separate lead telemetry was unavailable. The exact installed pins and scientific intake are in the [working-input receipt](ED07_E54_WORKING_INPUTS.json). The [assessment](../../reviews/ED07_E54_RELATIVE_TRACE_WIDENED_SWITCH_AND_CAP.md) records the geometric hypotheses and the two open universal obligations.

## Pinned build and exact types

From the formalization directory, `lake build` completed successfully (12,118 jobs in the dependency graph, including cached work). The [public fixture](ED07_E54_PUBLIC_TYPES.lean) elaborated 69 public names through `import SmoothPoincare`. The [kernel check](ED07_E54_KERNEL_CHECK.lean) used the imported module identities to inspect all 287 available kernel declarations from the seven E54 files, including generated and private declarations. No project axiom declarations were found. All transitive axioms belong to `propext`, `Classical.choice` and `Quot.sound`. The kernel outputs list separately any compiler-only internal names without a loaded kernel declaration.

| Module | Kernel declarations | Source SHA-256 |
| --- | ---: | --- |
| [HMPRelativeTrace](../../../SmoothPoincare/Heights/HMPRelativeTrace.lean) | 56 | `5bf074dfe5487ca52cd6b463c9991f9be0eaa326f132ab176efbe5758cfeb8e5` |
| [WidenedPauseStrip](../../../SmoothPoincare/IntrinsicEntry/WidenedPauseStrip.lean) | 88 | `f129c84e416d569f2c9082fc1c822377d7f63516ca04cd8384a72db6a43dce0e` |
| [BourBufferedCapWarp](../../../SmoothPoincare/Variational/BourBufferedCapWarp.lean) | 13 | `6a758d9a9c0dd486d346c6577ecd6d2f1b20c7110968448df577898fa125cb7b` |
| [BourBufferedCapFrame](../../../SmoothPoincare/Variational/BourBufferedCapFrame.lean) | 19 | `962f624e52ab2e53ca0f903091a9c4eb460e9b21b6a5f8f6ec2902fa7ea7ec95` |
| [BourMeasuredBufferedCap](../../../SmoothPoincare/Variational/BourMeasuredBufferedCap.lean) | 49 | `f3f7c9b89760f832aedd5e3388db756da24f5fffb9eb8df443eaa2310f68c74d` |
| [BourBufferedCapCurvature](../../../SmoothPoincare/Variational/BourBufferedCapCurvature.lean) | 48 | `1b1ede2046ba891363bf15d5dec64f9a3b19adbd1564f288072a9bdfa3e7d3f7` |
| [BourBufferedCapEuler](../../../SmoothPoincare/Variational/BourBufferedCapEuler.lean) | 14 | `8482df637bbc5158ccb98c2446a3642044d3360edc508b0e42a52e1e8926264f` |

Exact public stdout SHA-256 `803b910f609674d6f98268e8898ff665a6aa0bf130817cf8ddb7ced122a43cdc`. Canonical kernel inventory SHA-256 `8b341a6f2c0277a0bd969db141733f3c3eee3effd0084b3464d25377ff40efa0`.

## Applied checks and inherited public surface

The independent HMP applications use the lower product control and test full-tube transport, the inverse, the disk crossing and the adjunction. The independent cap calculation uses the physical case $r=2,b=3$, the curved transition, both positive and negative endpoint slopes, radial normalization and the integrated Euler theorem. The independent widened-switch calculation replays its own 64-cell exact rational partition and physically supplied jet constants. [HMP check](../../reviews/E54_HMP_READBACK.md) · [Cap check](../../reviews/E54_CAP_READBACK.md) · [Switch check and executable rational replay](../../reviews/E54_SWITCH_READBACK.md)

| Public fixture | Applications | Type checks | Axiom reports | Stdout SHA-256 |
| --- | ---: | ---: | ---: | --- |
| [ED06_E51_PUBLIC_TYPES.lean](ED06_E51_PUBLIC_TYPES.lean) | 0 | 164 | 164 | `729c013eee3056656a29849724d0cc624c171f15708fad2e180a50691c0f6d2b` |
| [ED07_E52_KERNEL_CHECK.lean](ED07_E52_KERNEL_CHECK.lean) | 0 | 0 | 0 | `fc555fb3e982edb7b856c3d3f17e9ba204f4d82183031f69d4f30350d8cd86ed` |
| [ED07_E52_PUBLIC_TYPES.lean](ED07_E52_PUBLIC_TYPES.lean) | 0 | 696 | 696 | `d1096f723e6f74689296e7a207a54ff5e0300ec9026f1cfb52cb0ed99201c1c8` |
| [ED07_E53_KERNEL_CHECK.lean](ED07_E53_KERNEL_CHECK.lean) | 0 | 0 | 0 | `1e34e22aa0559176b1e86cd9f8feb8bd8dc2a89d04316819a9421a28f76fe83f` |
| [ED07_E53_PUBLIC_TYPES.lean](ED07_E53_PUBLIC_TYPES.lean) | 0 | 226 | 226 | `691cc6c0bb3573f40d047b34d85feb80a0b4c5f66c601003174846e3eab8fc5d` |
| [ED07_E54_KERNEL_CHECK.lean](ED07_E54_KERNEL_CHECK.lean) | 0 | 0 | 0 | `6698b140b45eee9de5c05ddbbaf3bd6c15541d6b953f99eeb90039b687f5f6e8` |
| [ED07_E54_PUBLIC_TYPES.lean](ED07_E54_PUBLIC_TYPES.lean) | 0 | 69 | 69 | `803b910f609674d6f98268e8898ff665a6aa0bf130817cf8ddb7ced122a43cdc` |
| [E53_MARKING_AND_CORE_CHECKS.lean](../../reviews/E53_MARKING_AND_CORE_CHECKS.lean) | 22 | 0 | 28 | `ba071d7c0b08e7bb9ef6a9c9925ade58dce6f5987ca36a1c627a088c6e3e173c` |
| [E53_METRIC_AND_SIGN_CHECKS.lean](../../reviews/E53_METRIC_AND_SIGN_CHECKS.lean) | 27 | 0 | 46 | `586f51213ac5365515284aed8a9acf7c540debea7b8a1cd83233b5462b159751` |
| [E54_CAP_CHECKS.lean](../../reviews/E54_CAP_CHECKS.lean) | 8 | 0 | 11 | `2b81af43ad9ef665068c37529fc6b7c2a04d7571ccb50ab05f23f0219fcf3393` |
| [E54_HMP_CHECKS.lean](../../reviews/E54_HMP_CHECKS.lean) | 6 | 0 | 9 | `e82b2aff36ce9f5a678f351e1c3053a62ab6b9eea9d47a0f1a1525251de3fc60` |

The E53 exact public output and both independent check outputs reproduced the previous receipt hashes. E53’s full kernel count remained 704. The E52 public and kernel checks and the E51 exact public replay reproduced their recorded outputs. Run `lake env lean -j1` on each listed fixture relative to the formalization directory.

## Blueprint and repository

The PDF and web blueprint rebuilt from the [shared chapter](../../../blueprint/src/edition_seven_entry_and_marked_recognition.tex). Ghostscript processed all 71 pages with stop-on-error. The HTML and PDF resolved all 280 blueprint labels. The HTML resolved 975 distinct Lean declarations on 401 referenced source pages. All 21 graph dependencies in Edition 07 are reachable. Its graph shows 21 checked propositions and the two open universal problems.

| Blueprint artifact | SHA-256 |
| --- | --- |
| `blueprint/src/edition_seven_entry_and_marked_recognition.tex` | `8b384e7a65329a6dfd04869007d1ce9eecf1c6271f242ca1d4d5285065e34f74` |
| `blueprint/web/sec-ed07.html` | `a3df92c7842938e38a8f7e498b6bfe704963948a50d14b2768d4d0423b8a6672` |
| `blueprint/web/dep_graph_document.html` | `7a79a985b672934f5972e09e1e1726825f5897ce55c46868a7b0a98858e2ab40` |
| `blueprint/print/print.pdf` | `52e64f21699fe69673768f8034689046fb1d92c4d2f9134a46f22c62dc4672eb` |

The scientific recheck found no change to the working source digests recorded at intake. A direct exact-ID local chat diagnosis found no available source. The authenticated app reader also returned an error. The [partial public excerpts](../../chat-histories/UNREGISTERED_PARTIAL_E54_20261127.md) have no canonical registration.

Every relative file link in the 39 changed formalization files resolved, and whitespace and source-size checks passed. Repository hygiene checked 24,132 relative links and found four previously recorded references in scientific 08/03 to its missing handoff `RETURNS_SECOND_20261127.md`.
