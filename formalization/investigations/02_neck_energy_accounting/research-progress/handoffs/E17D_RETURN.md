# FOT-E17d · Real energy measures and fixed-truncation comparison

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance. GPT-6.2 Sol/ultra was requested. Serving variant and effort are unavailable. This is bounded E work under the [follow-on request](LAUNCH_REQUESTS_20261125.md#follow-on-fixed-packets--revision-1-same-date-and-pins).

[EnergyDensity.lean](../../../../FirstOrderTwistor/EnergyDensity.lean) checked under Lean `4.35.0-rc3` at working HEAD `ad23403e9be521ebbc8395a9d958c0a02aef3c84`. The tested SEC digest is `329513a3cfd8e939373533fad90f36b9108ce0ea41a22f9cc348587a4110fe66`. The installed Mathlib and DifferentialGeometry commits were `c55e6e786f49471c72fbddbec5415808896aec1e` and `788efe97894474c032de6dfb1289d515f613d15a`. The requested baseline `cf03e8f09359cac317499f6928edb09e4f80c280` has the same toolchain and manifest. The module imports `Mathlib.MeasureTheory.Integral.Bochner.ContinuousLinearMap`.

## Callable declarations

Names below are in `FirstOrderTwistor`. The comparison domain `α` represents a fixed truncation, for example the subtype of a measurable compact subset of a component. `volume` and `referenceVolume` are measures on their indicated domains. The source domain is `β`.

| Call | Conclusion |
| --- | --- |
| `energyMeasure volume density` | `volume.withDensity (fun x => ENNReal.ofReal (density x))` |
| `isFiniteEnergyMeasure hDensity` | An `Integrable density volume` proof gives `IsFiniteMeasure (energyMeasure volume density)` |
| `energyMeasure_real_apply hs hDensity hNonneg` | A measurable set `s`, `IntegrableOn density s volume` and `0 ≤ᵐ[volume.restrict s] density` give real mass on `s` equal to the set integral |
| `energyMeasure_real_range_of_embedding hφ hDensity hNonneg hJacobian hJacobianNonneg hVolume` | Real image mass is the integral of `jacobian x * density (φ x)` against `referenceVolume` |
| `integrableDensityOfComparisonEmbedding hφ hDensity hJacobian hJacobianNonneg hVolume` | The Jacobian-weighted pullback is integrable against `referenceVolume` |
| `tendstoIntegralOfUniformDensity hIntegrable hLimit hUniform` | On a finite measure, integrals converge for eventually integrable `D i`, integrable `d`, and `TendstoUniformly D d sourceFilter` |
| `tendstoImageEnergyOfUniformPullback hComparisons hLimit hLimitNonneg hUniform` | The real image masses converge to `(energyMeasure referenceVolume limitingDensity).real Set.univ` |

For a single comparison the transport hypotheses are `MeasurableEmbedding φ`, source-density integrability on `Set.range φ`, source-density nonnegativity almost everywhere there for the mass identity, and an almost-everywhere measurable and nonnegative real Jacobian. The input volume identity is

```lean
sourceVolume.comap φ = energyMeasure referenceVolume jacobian
```

Mathlib's `MeasurableEmbedding.map_comap` identifies the pushforward of this pullback with source volume restricted to the image. The integral change of measure then produces the explicit Jacobian factor. For the limit theorem `hComparisons` bundles these single-comparison premises eventually in the supplied source filter, `referenceVolume` is finite, and the limiting density is integrable and nonnegative almost everywhere. The uniform convergence premise is

```lean
TendstoUniformly (fun i x => jacobians i x * densities i (comparison i x))
  limitingDensity sourceFilter
```

The proof bounds the integral of the difference by the uniform error times the finite reference volume. The result also applies when the reference volume is zero.

## Verification and remaining geometric input

`lake env lean FirstOrderTwistor/EnergyDensity.lean` succeeded. A temporary import probe checked the types and reported `[propext, Classical.choice, Quot.sound]` for all seven declarations. The probe used an embedding from `Unit` into `Bool` with proper image, a unit point mass as the reference, Jacobian `2`, and source density `3`. Lean checked real image mass `6`, convergence of the constant comparison sequence, and zero real mass on the empty set.

For SEC [§11.1, `msale:source`](../../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L3879) and [§12.4, `msgap:accounting`](../../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L4640), the source and limit densities must be identified with the squared Hilbert–Schmidt norm of the positive chiral Weyl block against Riemannian volume. The geometric supplier still needs orientation preservation so the pullback uses the same chiral block, identification of Riemannian volume with the reference measure times the volume Jacobian, and convergence of the resulting density on the whole fixed truncation. If the comparisons use constant rescalings or positive conformal changes of the pullback metrics, they must identify the full four-dimensional chiral density including its volume factor under those changes. This packet supplies the measure-theoretic transport and convergence implication. The orientation and curvature identifications remain with B03 and the geometric E17 supplier.
