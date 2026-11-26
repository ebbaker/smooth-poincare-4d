# Sources for the collar and surgery investigation

26 November 2026, America/New_York. Research design for Edward B. Baker III with OpenAI Codex assistance. The exact serving model and reasoning effort for setup were unavailable. The continuation notes recommend settings for future work. [Shared catalog](../../../../references/README.md) · [Bibliography](../../../../references/references.bib)

## Working inputs

The baseline commit is `95a4f50eb9ec6e0e98454170279f45a66b000211`. The two 26 November brainstorm documents were working files outside that commit. The SHA-256 values below identify the individual files read for scope and conventions. Each scientific implication retains the hypotheses and review status of its owning manuscript. On activation check any changed inputs and their included sections before comparing a new calculation.

| Source and use | Passage or section | File SHA-256 |
| --- | --- | --- |
| [Recognition, disk replacement and the charged disk](../../../master/manuscript/chiral_weyl_energy_and_smooth_poincare.tex) | `prop:recognition`, `prop:exterior-replacement`, `thm:band-disk-residual` | `c9320f8f8b8c111dec77420d4cc3da2b21314d4b6d1b03ee58262b5d97dce789` |
| [Chiral energies on the two capped pieces](../../../master/manuscript/marked_cut.tex) | `prop:cut-energy`, `thm:cut`, `prop:round-boundary-form` | `9462b4c6824ed5bacfb2f4472c869e76418d6eab22db6e95411eadb1f1151e11` |
| [Strict positivity wall and short marked cut](../../../master/manuscript/variational_comparison.tex) | `eq:zero-wall`, `prop:short-cut` | `d52c8d2ad83e21d047231e412d1aa933ca544c9c5ed1beffd5d0a2c381894953` |
| [Cost of the first-order interpolation](../../../master/manuscript/first_order_splice.tex) | `weak:splice` | `e31283f6c8429f7f4b1c9837c5de7044bcbc6aa8ad74c3ccd2b4abb32d2c3b82` |
| [Necessary saving in the enlarged disk](../../../master/manuscript/balanced_disk.tex) | `prop:balanced-disk-saving` | `044c5e0c1ea3f5e4e411d98211d72ea082c699bf2185b7aa1029660751a4f697` |
| [Shell between separated quantiles](../../../master/manuscript/critical_annulus.tex) | `prop:critical-annulus` | `8adec36d069266ab2f5423ca8eca2f48b34f7d981529a59141f96b6d97f6a61e` |
| [Uniform infimum recognition test](../../../master/manuscript/recognition_gap.tex) | `thm:recognition-gap` | `f4c5ce2687a2ba874b26307d65f4e213ceccaa6623e99143369fe3ec985e0441` |
| [Coordinate costs in the physical marking](../../../master/01_fixed_type_variational_descent/manuscript/disk_collar_comparison.tex) | `prop:disk-collar-comparison` | `c1de1c225230b140f89d4cd0efee095a8f3ea433ba20067b9370cf0eda753b4c` |
| [Immersed energy and topological recognition](../../../master/manuscript/immersion_entry.tex) | `thm:immersed-entry`, `prop:two-middle-tests` | `f7a9522959429fdb45a88955f089834ec926fcdf03eb9ded749986870d49f4ae` |
| [Marked handle moves and the mixed case](../../04_hypersurface_immersions/02_two_handle_recognition/manuscript/recognition_from_marked_morse_heights.tex) | The two intermediate boundaries in a mixed presentation, `thm:mixed`, `thm:mixed-meridian` | `9681e2deb71434b7e6036ce8d3db9b6a10e4f6d530406948e30bc8b74b1a15d9` |
| [Both faces of an immersed attachment](../../04_hypersurface_immersions/01_immersed_handle_constructions/manuscript/marked_immersed_handle_constructions.tex) | the incoming solid torus, outgoing solid torus and their markings | `8ae1363dbc59111b444e0148618fe1038a01964247b269f1f0aa41f09444d130` |
| [Prescribed nonspherical dividing face](../../04_hypersurface_immersions/01_immersed_handle_constructions/manuscript/short_seam.tex) | Short marked product seams and the cost of the halves | `f719a9bff8f7b463b2bb292a5f87de6c520575d85020250b402f97bb1f033220` |
| [Three-axis Weyl samples](../../03_first_order_twistor/01_sections_and_connections/manuscript/twistor_sections_and_chiral_weyl_curvature.tex) | `secjet:orthogonal`, `secjet:separation` | `24d5302b92cbb904526b61150684d1fe956933ac6236249a7e7f94d36fd3923f` |
| [Spinorial Weyl identity](../../03_first_order_twistor/02_dirac_and_twistor_spinors/manuscript/dirac_twistor_and_yamabe_rigidity.tex) | `prop:weyl-defect` | `e23d49cd3bd8d71aa6167188766d59167231ee840b346018f97c71fa1f8296ca` |
| [Dirac transmission and measured fields](../../03_first_order_twistor/02_dirac_and_twistor_spinors/01_dirac_collar_matching/manuscript/dirac_transmission_on_marked_collars.tex) | The chiral curl and its normalization | `a31cae0c3cb804c6b7f4d44a9e53e8b6bc96d88cc6314ff4279445329fcb0374` |
| [Preceding immersion and bulk discussion](../../../master/brainstorm/notes/WEYL_PRESCRIPTION_IMMERSION_SPINORS_AND_BULK_FLOW_20261126.md) | Use the master’s immersion to supply the spinor fields | `ea8e68ecf8fd8264069be2b4228779e44fd8002ed059c91992c392c4d8e170a6` |
| [Starting handoff for this investigation](../../../master/continuation-notes/CONTINUE_TWISTOR_AND_BULK_FLOW_BRAINSTORM_20261126.md) | Where the discussion stands and open questions | `0e137af07f5e2768761416b6675c920c09133616492a9296696b68a7f75014c7` |

## Primary sources and division of responsibility

- The [recognition source record](../../../../references/SOURCE_NOTES_MASTER_RECOGNITION_GAP_20261125.md) and [endpoint source record](../../../../references/SOURCE_NOTES_MASTER_ENDPOINT_20261125.md) give the scope of the inherited smooth recognition results. The master derives the joined positivity wall, the finite cut and the exact thresholds in its own Hilbert–Schmidt normalization. Use its statements on the closed source and each cap.
- The [marked height source record](../../04_hypersurface_immersions/02_two_handle_recognition/references/README.md) identifies Milnor's adjacent-handle cancellation theorem, Gabai's one-component surgery theorem, and the Laudenbach–Poénaru extension and gluing result. The [spherical gluing record](../../../../references/SOURCE_NOTES_JOINT_COLLAR_20261125.md) documents Hatcher and Palais. The surgery branch specifies when one can use each source.
- The [sections source record R86](../../../../references/SOURCE_NOTES_SEC_20261124.md) holds the Curry–Gover reference. The [deformation source notes](../01_collar_deformation_and_adapted_coordinates/references/README.md) identify the passages for three-dimensional Cotton curvature and normalization of the mean curvature. The existing [conformal development record](../../../../references/README.md#activated-foundation-audit-22-november-2026) supplies the global argument for a smooth, compact, simply connected sphere.
- The earlier [brainstorm handoff](../../../master/continuation-notes/CONTINUE_TWISTOR_AND_BULK_FLOW_BRAINSTORM_20261126.md) and [immersion and bulk note](../../../master/brainstorm/notes/WEYL_PRESCRIPTION_IMMERSION_SPINORS_AND_BULK_FLOW_20261126.md) explain the distinction between an induced metric and an intrinsic deformation. The proposed two-sided cutoff, face functional, three-crossing test and universal selection problem are research design in this branch. Their independent checks belong to the respective child registers.

## Activation revision check, 26 November 2026

All 17 individual SHA-256 values above match the working bytes at `c8fb08dcf2e39ae68d4c9d9ebd6a69893ce9cce4`. The two brainstorm sources are now tracked. Hashing the sorted repository-relative paths, followed by one space, each SHA-256 and a newline, gives `57a581ad6e3a248398201185eb4631e3c699b4510b41c316092583f737470dba`. Recursing over the literal TeX inputs of the 15 listed TeX sources gives 21 unique TeX files and union digest `f829963cc96397f36b63c2c4a3a84db07956d933187ce1754ed26a29b4c5944d`. All 21 matched the original setup commit `95a4f50eb9ec6e0e98454170279f45a66b000211`. These are manuscript inputs. The [additional primary passages](../../../../references/SOURCE_NOTES_COLLAR_SURGERY_20261126.md) were checked for the new mixed-cut criteria. Figure 37 on p. 35 of Isoshima's paper was inspected for the punctured-ball calculation in the meridian-first order.

The [manuscript receipt](../research-progress/handoffs/INITIAL_MANUSCRIPTS_20261126.md) rechecks these inputs at the first research commit and records the three editorial assignments. The [primary passage record](../../../../references/SOURCE_NOTES_COLLAR_SURGERY_20261126.md#initial-manuscripts-26-november-2026) adds the connected-sum theorem used in the working manuscripts.

## Continuation after the two mixed cuts

At input commit `e2968b2898b5aab00b307f6b6580454d0f325bb4` the 17 working pins, the 21-file transitive TeX union and the three manuscript hashes in the [initial receipt](../research-progress/handoffs/INITIAL_MANUSCRIPTS_20261126.md) matched. The [primary passage record](../../../../references/SOURCE_NOTES_COLLAR_SURGERY_20261126.md#penultimate-cuts-the-mazur-metric-and-a-curved-fill) adds the free-group and null-homotopic-knot inputs, PSC metric extension and concordance, and the Euclidean hypersurface theorem. The [physical source audit](../notes/SOURCE_WITNESSES.md) reads the later E61 and E68 companion and Edition 03 examples in their own marked metrics. The new conclusions are in the [assessed return](../reviews/PENULTIMATE_CUTS_AND_CURVED_FILLINGS_20261126.md).

## Continuation after the penultimate cuts

The 17 named baseline hashes and the transitive 21-file TeX union matched again at 5ddaabd76595. The new [primary passages](../../../../references/SOURCE_NOTES_COLLAR_SURGERY_20261126.md#two-attachments-and-a-finite-curved-comparison) give the single-knot attribution, actual Figure 5–6 slides, two-ended saddle complement, tunnel stabilizations, local filling and chiral normalization. [Full source and reading-copy receipt](../reviews/TWO_ATTACHMENTS_AND_PHYSICAL_FACE_COST_20261126.md)

## Continuation after two attachments and physical face costs

For the nonlocal family and the charged-disk transport the 17-file and transitive 21-file digests above were reproduced again. The preceding working manuscripts at intake HEAD 5ddaabd76595 matched the bytes subsequently recorded in 19c187ad8dbe. The [independent reading assignments](../research-progress/handoffs/NATIVE_STRIP_AND_LIFT_READBACKS_20261126.md) pin each new derivation and the integrated readings by exact revision. The [source passage record](../../../../references/SOURCE_NOTES_COLLAR_SURGERY_20261126.md#nonlocal-bands-and-a-physical-boundary-response) identifies the Figure 5 and single-knot inputs, the nonseparating-sphere theorem, the PSC bands and the conformal boundary operator. [Source and reading-copy receipt](../reviews/NONLOCAL_BANDS_AND_PHYSICAL_TRANSPORT_20261126.md)

## Exterior recovery and protected charge, 26 November

The [assessment](../reviews/EXTERIOR_RECOVERY_AND_CORE_RETENTION_20261126.md) reproduces the prior three reading-copy receipts, the 17-file baseline and 21-file transitive union. The fixed primary passages on the framed Figure 5 pair, the single-knot theorem, PSC extension and Yamabe minimizers are linked in the [canonical source record](../../../../references/SOURCE_NOTES_COLLAR_SURGERY_20261126.md#exterior-recovery-and-protected-charge).

## Two-point localization

The [source record](../../../../references/SOURCE_NOTES_COLLAR_SURGERY_20261126.md#a-forced-bridge-disk-at-a-two-point-cut) identifies the groups, disks and marked local recognition results used on the knotted opposite completion. The [assessment](../reviews/TWO_POINT_LOCALIZATION_20261126.md) records the frozen scientific inputs and the two rebuilt reading copies.

## The four-point cut and face-slope decision

The [canonical passage notes](../../../../references/SOURCE_NOTES_COLLAR_SURGERY_20261126.md#four-point-faces-and-the-marked-slope-search) identify the HNN normal form, essential disk algorithm, geometric twist count and local trace inputs. The [assessment](../reviews/FOUR_POINT_RETURNS_20261126.md) and [frozen readings](../research-progress/handoffs/FOUR_POINT_READINGS_20261126.md) record the working sources and their generations.

The [one-mouth and Whitehead passage record](../../../../references/SOURCE_NOTES_COLLAR_SURGERY_20261126.md#a-lower-word-surviving-every-chord-and-two-whitehead-patterns) identifies the stationary-filled fiber class, the pattern index and its twice-punctured disk. The [assessment](../reviews/WHITEHEAD_MIXED_RETURNS_20261126.md) records the separate diagrams and exact verification scope.

[Reducible native surgery and the chamber test](../../../../references/SOURCE_NOTES_COLLAR_SURGERY_20261126.md#reducible-native-surgery-and-the-chamber-test) records the Scharlemann exceptions and correction, sphere isotopy, free-product and relation-module passages used for the 26 November localization result.
