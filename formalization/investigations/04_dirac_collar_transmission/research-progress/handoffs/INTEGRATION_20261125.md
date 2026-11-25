# Route 04 integration on 25 November 2026

Prepared for Edward B. Baker III with OpenAI Codex assistance. At intake the checkout was clean at `5ff7014caff55ad9cc49bb910b8e5fbcb546bd11`. The requested lead was GPT-6.2 Astra at ultra. The serving lead variant and effort are unavailable. Bounded proofs and independent reviews used the explicitly selected GPT-6.2 Sol at ultra. [Frozen requests](ACTIVATION_20261125.md) · [Live register](../REGISTER.md) · [Scientific assessment](../../reviews/TRANSMISSION_AND_RESIDUAL_20261125.md) · [Continuation](../../continuation-notes/AFTER_WEIGHTED_COVER_20261125.md)

## Public returns and scope

| Work | Lean declarations and verification boundary |
| --- | --- |
| SPIN-E01 and SPIN-E02 | `finiteCoverDefectBound` and `finiteCoverDefectBoundOfIntegrals` allow individual floors and an empty family. `RemainderEstimates.ofSpinDefectStrips`, `RemainderEstimates.ofNormalizedSpinDefectStrips` and `RemainderEstimates.ofSpinCutoffCover` use the physical remainder and a finite cover varying with both indices. `energyIdentityOfSpinorRatioBounds` gives the component energy identity using independent local norms, the uncovered mass, and the original Route 02 component comparisons and total limit. |
| FOT-E18, pointwise and measured | `weylSpinDefect_normSq` computes the fiber normalization. `metricNormalChartTwistorDefect` differentiates the coordinate twistor operator, transforms the actual Levi–Civita Christoffel matrices, and includes the covector connection term at a marked normal center. A local spin interpretation uses an oriented orthonormal moving frame and a positive lift. `SpinDefectStrip.validOn_ofMetricJets` and `SpinDefectStrip.ratioValidOn_ofMetricJets` integrate compatible jets in the strip measure, including the Hilbert norm of the projected triple. |
| FOT-E18, differentiated equations | `harmonicMetricCoordinateTwistedDiracDerivative_normSq` obtains the signed Ricci forcing and its squared norm from a harmonic germ and metric curvature. `spinStrip_projectedDerivative` uses it through a supplied interior cutoff estimate, a small twisted-operator comparison and a spinor floor. The analytic premises include finiteness of the norms. |
| FOT-E18, relative estimates | `spinRelativeBochner_bound` passes to zero regularization on the joint nonzero locus. `spinMixedRelative_sum_le` controls the sum of mixed costs by the square root of summed curvature and relative-gradient budgets. A geometric integrated twisted Bochner inequality and almost-everywhere positivity on the support are inputs. |
| FOT-E22/E24/E33 | `forcedCylinderMode_equation`, `forcedCylinderModes_graphEnergy_hasSum` and `roundCylinderMidpoint_jointFloor_Lp` give signed forced modes, an integrated graph estimate and the exponential midpoint obstruction. `fixedDomainDiracScattering_sameEnd_norm_le` controls the reflection component from a supplied reference inverse with zero same-end reflection. Closed Sobolev trace and weak forcing realization on the spin cylinder remain open. |
| FOT-E23/E30–E32 | `spinStrip_bufferedCoefficientBound` uses Route 02 buffered interpolation. `matchSuppliedCoreTraceGraphs` solves two compatible affine core graphs. `closedJumpCorrectionOfRightInverse` constructs a regular two-jump correction from the original closed inverse and lift. `criticalJointFloorOfJumpBounds` bounds the mass of a joint floor on actual measured slices or regions under the specified critical inequality. |
| FOT-E19/E20 | `existsUnitKernelOfCompactEmbedding` produces a unit-image-norm kernel element under the fixed Hilbert compactness hypotheses. `weylBlock_eq_zero_of_dense_spinor` extends vanishing through a supplied dense nonzero locus. Realizing the compact gauge, zero control and smooth recognition on the original smooth manifold remains open. |

The original marks and smooth type enter through the supplied geometric comparisons. Applying the noncompact alternative requires selecting the neck and separately controlling energy outside the union of the fields’ protected regions. [Route 02 receipt](../../../02_neck_energy_accounting/research-progress/handoffs/INCOMING_ROUTE04_20261125.md) · [Independent premise review](../../reviews/RESIDUAL_PREMISE_CHECK_20261125.md)

The cutoff derivative in an orthonormal frame is `normalizedSpinCutoff_fderiv_bound_frame`. Under the summed majorant, `energyIdentityOfSpinBochnerBudgets` proves the component identity from bounded curvature-square and vanishing Ricci-square, relative fourth-power, cutoff and uncovered costs. [Finite cutoff test](SPIN_CUTOFF_EXAMPLE.lean) · [Combined budgets](../../../../FirstOrderTwistor/SpinBochnerAccounting.lean)

## Package and checks

The scientific sources changed concurrently. The relevant DIR statements, SEC interpolation, the parent twistor formula, and the MATCH E01–E11/E15 and EXTRACT E01/E03/E04 notes agree with the intake evidence. DIR added explicit jump, actual-defect and volume-witness results. Its updated text extends the smooth quotient by the existing Weyl identity at the zero set. The measured Lean ratio theorem charges an uncontrolled simultaneous zero set. The revised manuscripts and their companion files were read for this comparison.

| Source | Intake SHA-256 | Working source at audit |
| --- | --- | --- |
| DIR | `71dfada5256b2e33425c12d835bed57e66dc85cb87db6f89e4edabf18c0b198d` | `e23d49cd3bd8d71aa6167188766d59167231ee840b346018f97c71fa1f8296ca` |
| SEC | `329513a3cfd8e939373533fad90f36b9108ce0ea41a22f9cc348587a4110fe66` | `24d5302b92cbb904526b61150684d1fe956933ac6236249a7e7f94d36fd3923f` |
| Parent first-order twistor | `2e11413d0e3a25a059ae6e8375c0bdd361fb25fcb8dfad6c5c7e4d34d7f6bfa0` | `82952a7cfce8ece3e1bce4c33063038ff198f20b031213b2ee707399dbc94df5` |
| [Dirac transmission on marked collars](../../../../../papers/investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/01_dirac_collar_matching/manuscript/dirac_transmission_on_marked_collars.tex) | New companion | `a31cae0c3cb804c6b7f4d44a9e53e8b6bc96d88cc6314ff4279445329fcb0374` |

The marked companion's `eq:roundinverse`, `eq:reflection`, `eq:critical`, `eq:curlnorm`, `eq:floorcov`, `eq:ricciforcing`, `eq:localRicci` and `eq:bochner` agree with the recorded mathematical hypotheses. Its round estimate uses $Q$ for the squared graph seminorm, written $Q^2$ in MATCH-E01.

Lean `4.35.0-rc3` at `470d5ce1400764999581fd26d5d72b00d990b0f4`, Lake `5.0.0-src+470d5ce`. All ten installed dependencies matched their manifest revisions at intake, including mathlib `c55e6e786f49471c72fbddbec5415808896aec1e` and differential geometry `788efe97894474c032de6dfb1289d515f613d15a`. The manifest SHA-256 was `839111aae86b693524cd57db5ce7f2e8edc972dad49296468eb18d6735e52239`.

The [finite examples](SPIN_EXAMPLES.lean) include overlapping regions in different gauges, degeneration of a floor, and a growing family with small individual costs and fixed total cost. The [Ricci-flat jet](SPIN_JET_EXAMPLE.lean) has zero first derivative, zero differentiated Dirac contraction and projected defect square equal to any prescribed square. This example concerns a marked algebraic jet. MATCH-E10 gives a separate oscillatory family on the standard smooth sphere with growing Bach norm.

| Final replay in the pinned checkout | Observed result |
| --- | --- |
| Default `lake build` from `formalization/` | Both public libraries built, 4,386 jobs. All ten dependency revisions and tracked trees were checked again after the build. |
| [Public type and axiom audit](PUBLIC_CHECKS.lean) with `lake env lean` | 192 checks through `import FirstOrderTwistor` across all 26 new modules, covering 173 top-level declarations and 19 named structure fields. Every axiom report was present. Their union was `propext`, `Classical.choice`, and `Quot.sound`. |
| Three Route 04 example files and existing Route 02 public audit | All four Lean invocations passed. The cutoff example uses two half-weight contributions on the same measurable set. |
| `make -C blueprint` in `formalization/` | PDF (13 pages) and HTML built. All 40 Route 04 declaration links resolve to their correct source lines in the generated HTML. Blueprint source SHA-256: `content.tex` at `984fabd488cea75eef47ee10e9cbc5203bd7b01815b61b850a91c72651f06874`, `spin_transmission.tex` at `5e595920b14d034280022d14997675158d3f47399f4b4d510f7e8751db8e7491`. |
| Repository hygiene and formalization diff | Relative-link checker passed for all ten branches. `git diff --check -- formalization` passed. |

The exact thread ID was available. The repository capture diagnostic found no local source for that ID and the app history reader did not return an authentic transcript. No chat was registered.
