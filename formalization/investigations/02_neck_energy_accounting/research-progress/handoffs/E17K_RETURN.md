# FOT-E17k · Conformal change of the positive chiral energy measure

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance. GPT-6.2 Sol/ultra was requested. Serving variant and effort are unavailable. This is bounded E work from the [follow-on request](LAUNCH_REQUESTS_20261125.md#follow-on-fixed-packets--revision-1-same-date-and-pins).

[ConformalEnergy.lean](../../../../FirstOrderTwistor/ConformalEnergy.lean) uses Lean `4.35.0-rc3`, Mathlib `c55e6e786f49471c72fbddbec5415808896aec1e` and DifferentialGeometry `788efe97894474c032de6dfb1289d515f613d15a`. The working HEAD inspected was `0c3399d831d71a1a17c29ffcba14ee0593315cbe`, with manifest and toolchain identical to request baseline `cf03e8f09359cac317499f6928edb09e4f80c280`. The SEC SHA-256 is `329513a3cfd8e939373533fad90f36b9108ce0ea41a22f9cc348587a4110fe66`.

## Callable declarations

The declarations are in `FirstOrderTwistor`. They use the existing `SectionsAndConnections.hilbertSchmidtSq` and the E17d `energyMeasure` constructor.

| Call | Conclusion |
| --- | --- |
| `hilbertSchmidtSq_conformal_cancel u W` | `exp (4 * u) * hilbertSchmidtSq (exp (-2 * u) • W) = hilbertSchmidtSq W` |
| `energyMeasure_conformalFour volume u hu hScale` | For measurable `u` and the given almost-everywhere coefficient transformation relative to `volume`, the energy measure after weighting `volume` by `exp (4 * u)` equals the original one |
| `riemannianChiralEnergyMeasure_restrict_conformalMetric hDim g u hs hScale` | For a measurable region `s`, a coefficient transformation almost everywhere on `s` gives equality of the energy measures restricted to `s` |
| `riemannianChiralEnergyMeasure_conformalMetric hDim g u hScale` | A coefficient transformation almost everywhere for the original Riemannian volume gives equality of the energy measures on the whole manifold |

The Riemannian declarations use a real finite-dimensional model of dimension four, a smooth Hausdorff and sigma-compact manifold with its Borel measurable structure, a smooth positive-definite metric `g`, and a smooth real function `u`. The new metric is `conformalMetric g u`, which scales `g` by `exp (2 * u)`. Their nontrivial coefficient input is `WScaled x = Real.exp (-2 * u x) • W x` almost everywhere for the original Riemannian volume or its restriction to `s`. The theorem `DifferentialGeometry.Integral.Measure.riemannianVolumeMeasure_conformalMetric` at pinned `DifferentialGeometry/Analysis/Integration/Measure/Conformal.lean:113` supplies the actual volume density with exponent `finrank ℝ E * u`. Squaring the nine coefficients and multiplying by the volume factor cancels the weights in dimension four.

## Verification

`lake env lean -o <scratch>/FirstOrderTwistor/ConformalEnergy.olean FirstOrderTwistor/ConformalEnergy.lean` succeeded against the compiled pinned volume theorem. A temporary import probe checked all four public declarations and the upstream volume theorem. Each `#print axioms` reported `[propext, Classical.choice, Quot.sound]`.

The probe specialized the Riemannian result to the unit ball in `EuclideanSpace ℝ (Fin 4)` with a supplied smooth base metric and `u = log 2`. Lean checked that the actual Riemannian volume changed by the factor `16` and that the supplied coefficient rescaling by `1/4` preserved the restricted energy measure for the nonzero test block `diag(1, -1, 0)`. The example uses the canonical `borel` instance in the probe, as required by the upstream volume measure. The test block is a prescribed matrix field.

## Geometric scope

In [SEC §1.1, `eq:energies`](../../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L144), the operator is the positive chiral Weyl block in an oriented orthonormal self-dual frame. Applying this result to that block requires identifying the supplied coefficient fields with the metric's actual Weyl operators in matched oriented frames and proving the supplied coefficient law. The restriction theorem allows this input on fixed comparison domains. Integrability required for finite real energy accounting remains an input to E17d. The conformal equality applies to energy measures of arbitrary total mass.
