# FOT-E44 · Independent public and source verification

26 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. The author selected a GPT-6.2 Astra/ultra lead and GPT-6.2 Sol/ultra workers and readers. Independent serving model and effort telemetry were unavailable for this verification. The verifier did the intake and applications and authored no proof leaf in the delivery. [Frozen inputs and original public replay](ED04_ACTIVATION_INPUTS_20261126.md) · [Proof packet ledger](ED04_FIXED_SOURCE_PACKETS_20261126.md) · [Sole program register](../REGISTER.md)

## Scientific source changes during delivery

The proof intake froze `5ddaabd76595b3679d1ea415e9f6d9643802f9ef`. Independent subsequent paper work revised the three Investigation 05 manuscripts and rebuilt their PDFs during formal delivery. The six established manuscript/PDF pairs retained the values in the intake receipt. The readings below identify the later working copies. The TeX hashes use the same transitive generation procedure as the [input replay](ED04_ACTIVATION_AUDIT.py).

| Investigation 05 manuscript | TeX files | TeX generation SHA-256 | PDF SHA-256 |
| --- | ---: | --- | --- |
| [Marked collars and smooth recognition](../../../../papers/investigations-1/05_collar_deformation_and_surgery/manuscript/marked_collars_and_smooth_recognition.tex) | 1 | `97b22acb89408360b67ef8259e21cb21dcf608091a1e7030cbddd41f15b00060` | `74e20109a26e7dc5ba744ede128863da316441aa33333857ed00a902bfcaf4cf` |
| [Deformation of marked spherical collars](../../../../papers/investigations-1/05_collar_deformation_and_surgery/01_collar_deformation_and_adapted_coordinates/manuscript/deformation_of_marked_spherical_collars.tex) | 1 | `7e04a22a5b149ae4cbc1470d1a458591c04fc37ae68428c60135d9ae089f369c` | `f1eccfb8a748264540d2853c4cc00f8812ece00d9f48363c65951405f8f2fc5a` |
| [Recognition from marked handle cuts](../../../../papers/investigations-1/05_collar_deformation_and_surgery/02_handle_isolation_and_marked_surgery/manuscript/recognition_from_marked_handle_cuts.tex) | 1 | `6d17ce285b247edfd2e2aa9c8487aded8d813f720ffc359b0f5b99fa3cb61f4e` | `a9b87ede2ba8a2cb8187bf9923c1472e463061749f372240ce2562d0f7eb1fbd` |

The union of these three later closure hashes is `2aad5add15341816815d4d0106a0d1912521f4ef468e3ffd0de7f5860f9475b4`. The three raw main hashes reproduced the successful 13-, 16-, and 21-page editorial rebuild checks. The prevailing [bibliography](../../../../references/references.bib) has SHA-256 `8e392d7a227d1a2994ebbd57c9d4a082982825f96467edad252579a21d72e493`, and the [canonical source notes](../../../../references/SOURCE_NOTES_COLLAR_SURGERY_20261126.md) have SHA-256 `04e45143d56402ebd87069ba29b1a3fcf54f5d9ff0ae2760d8fab58c191d52de`. The proof types retain their individually issued input versions.

The later source gives the existing rank-increasing single-knot theorem the Meier–Schirmer–Zupan attribution. The primary text's Theorem 5.1 yields a local unknot with zero slope when one nontrivial surgery sends $Y_r$ to $Y_{r+1}$. Corollary 1.3(1) gives the unstabilized unlink with the stated tunnel number for the rank-increasing multi-component case. The separate stabilized statement in part (2) needs its own net count. The later paper also treats an actual pair of nonrecognizing initial cuts that the inverse slide can reduce, the round band on the returned cut, and the physical first-jet mismatch cost and boundary transgression. Those scientific cases use their own relative diagram and metric hypotheses. [Primary text, Theorem 5.1 and Corollary 1.3](https://arxiv.org/pdf/1507.06561#page=9) · [Later paper packet](../../../../papers/investigations-1/05_collar_deformation_and_surgery/research-progress/handoffs/TWO_ATTACHMENTS_AND_FACE_ERROR_20261126.md)

## Exact Lean replay

The default public Lake build passed all 11,122 jobs. The Lean selector, Lake definition, and lock file reproduce the [activation hashes](ED04_ACTIVATION_INPUTS_20261126.md#package-resolution-and-exact-public-replay). Lean is `4.35.0-rc3` at `470d5ce1400764999581fd26d5d72b00d990b0f4`, with Lake `5.0.0-src+470d5ce`. The working sources listed here supplied the elaborated declarations and rendered blueprint.

| Source group | Files | SHA-256 |
| --- | ---: | --- |
| All Lean topics under `formalization/SmoothPoincare/` | 192 | `63ffbd675ffdd53f047efe22ac17de5655e3cedd7c29b8c74512e375f872685b` |
| Top-level blueprint TeX | 17 | `a72664977f6bc91091a638fa256b834234c3616d92ee7362bfb635a7cfab2566` |
| [Public import](../../../SmoothPoincare.lean) | 1 | `acfa7213b5b304003bdd02f0df97f59a9c90cb061e629f6fc6ef064b9e5ce7ff` |
| [Independent applications](../../reviews/ED04_INDEPENDENT_PUBLIC_CHECKS.lean) | 1 | `a9bb31faa30a512b399fc02d316a3ef26f6183d24c5ea9f2e36340e553547468` |

Source group digests use sorted tab-separated path/hash records. The compiled index locates explicitly authored public declarations at their Lean source positions. Every topic declaration elaborated through a sole `import SmoothPoincare`. Every blueprint declaration elaborated through the three owning imports `SmoothPoincare`, `FirstOrderTwistor`, and `SectionsAndConnections`. In each process the sorted names were queried with `#check @name` and `#print axioms name`, with `pp.universes false`. Comparing the prior output grouped by name preserves the full formatted type and axiom report bytes for every earlier record.

| Declaration set | FOT-E43 matched | FOT-E44 added | FOT-E44 total | FOT-E44 output SHA-256 |
| --- | ---: | ---: | ---: | --- |
| Authored topic declarations across 190 contributing modules | 1,066 | 189 | 1,255 | `aa27581cba8f58951184dcba3943daca77a74a259c7ff0f9a1702cf0646d95e1` |
| Distinct blueprint declarations | 561 | 43 | 604 | `6d427f7c3eda24859cbcdfe205d3d643a9ee19d019112638d1fd3460588a3b76` |

The retained FOT-E43 raw outputs have respective SHA-256 values `18610dc02b0ca4671bbd28adef92b64b00b19f061c37b9b3ff1bdeaf7350edfe` and `31264cdc429c5ab3eaca37df1b8070099ef0a33f714319f7b5518b4c101e4ab6`. The sorted new records in the corresponding FOT-E44 outputs have hashes `99f7cf29ef222040fafd68c1c01097c6776453f738211e6c1df058b92a9d8bf4` and `5983be0ea69b3a576a38153158437bd87cfa621783c9c1dedd341929ae71d243`. A second comparison used kernel expression hashes, ordered universe parameters and transitive axiom sets. All 1,237 old constants matched among 1,426 current distinct constants. The total axiom union is `propext`, `Classical.choice` and `Quot.sound`.

| Selected declaration under `SmoothPoincare` | Exact type and axiom record SHA-256 |
| --- | --- |
| `PositiveScalarCuts.windingZeroBlock_eq_zero_of_integralCokernel` | `a67310b187c9e0909197ee56aec6c445b00b8c56f84130c16ea0b3e4b2fce857` |
| `RoundEquatorialCaps.marked_product_endpoint` | `d4b9c568b6717d84fb3e080bcc3d30045ec97c0098cbc241d6068287d7a8011c` |
| `RoundEquatorialCaps.fixedSource_at_physical_widths` | `feb62073549004389a0e841c73e3c508f1599ca41a3482d7be5aae4dd9fb36a7` |

All 30 independent applications passed with `lake env lean -j1 investigations/reviews/ED04_INDEPENDENT_PUBLIC_CHECKS.lean` from `formalization/`. The checks include the integral cokernel hypothesis, a nonsymmetric off-diagonal rank obstruction, both actual marked residual tube images, the forward and inverse closing maps, normalized energies for negative and zero end traces, asymmetric face cutoffs, the inclusive admitting band width with a strict two-sign cost test, the metric identity in the polar marking, and the fixed round source with both positive capped metrics. The round fixture supplies a local `Nonempty StandardFourSphere` instance from the unit sphere. The positive Yamabe bound and the cap witnesses are conclusions from the public declarations.

## Rendered verification

`make -C formalization/blueprint all` rendered the print and web blueprints with the verified public package. The current chapter has eight Lean-marked propositions with Lean-marked proofs and seven open targets. The open targets retain their geometry and coverage quantifiers. [Chapter source](../../../blueprint/src/edition_four_marked_cuts.tex) · [Build instructions](../../../blueprint/README.md)

| Render check | Verified result |
| --- | ---: |
| PDF pages | 46 |
| Source labels with both HTML and actual PDF named destinations | 178 |
| Chapter graph nodes | 15 |
| Explicit Chapter 17 dependencies preserved as graph paths | 15 |
| Lean link occurrences at exact compiled source positions, in each of text and graph | 605 |
| Distinct Lean source anchors | 604 |
| Referenced Lean source pages and exact full-text line anchors | 274 pages, 51,335 lines |
| Internal HTML blueprint label links | 606 |

Of the dependencies declared in Chapter 17, 12 are direct edges in the rendered transitive reduction and the remaining three are reachable through intermediate nodes. The rendered proposition and problem titles match their own pages and named destinations. The graph and text each link the 43 new blueprint declaration occurrences alongside the 562 inherited occurrences.

| Rendered input or result | SHA-256 |
| --- | --- |
| Blueprint PDF | `8658017a45598f03e33ed74fa7a9349fd044a648ece7bb6c26e056c6663e13f3` |
| Edition 04 chapter TeX | `e442fde0d0555ba33d6de22f8da8cb5d92fdf02212920a327e49c3ae7fb1f063` |
| Edition 04 chapter HTML | `8bf51197200a98d8dc11c880ad8bc7b5d89662ee2392d6e5f4b74c2b4cb39c05` |
| Dependency graph HTML | `953cfad69ced82fe3c67eda2e55a60d7fa40e5d53f21c82c16f06eb440b9f84b` |
