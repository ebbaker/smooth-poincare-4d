# FOT-E29a · Slow diagonal on a supplied end

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded E work. The serving model and reasoning effort are unavailable.

[Issued request](LAUNCH_REQUESTS_20261125.md#follow-on-fixed-packets--revision-1-same-date-and-pins) · [Lean module](../../../../FirstOrderTwistor/DiagonalEnd.lean) · [EXTRACT-E04](../../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/02_dirac_collar_extraction/notes/E04_DIAGONAL_END_20261125.md)

Input checkout `ad23403e9be521ebbc8395a9d958c0a02aef3c84`, EXTRACT-E04 SHA-256 `c7051991c2d8ee2a21dee7dad2a97155e99575ab53c56152c1a5cc9a80c163d4`, and SEC SHA-256 `329513a3cfd8e939373533fad90f36b9108ce0ea41a22f9cc348587a4110fe66`. Lean `4.35.0-rc3`, Mathlib `c55e6e786f49` and DifferentialGeometry `788efe978944` are pinned by the unchanged Lake manifest.

## Callable types

```lean
open Filter MeasureTheory Set
open scoped Topology

#check (FirstOrderTwistor.exists_slow_diagonal :
  ∀ (good : ℕ → ℕ → Prop), (∀ m, ∀ᶠ i in atTop, good m i) →
    ∃ outer : ℕ → ℕ, Tendsto outer atTop atTop ∧
      ∀ᶠ i in atTop, ∀ m ≤ outer i, good m i)

#check (FirstOrderTwistor.exists_slow_diagonal_with_vanishing_annularMass :
  ∀ (good : ℕ → ℕ → Prop) (annularMass : ℕ → ℕ → ℕ → ℝ) (tail error : ℕ → ℝ),
    (∀ m, ∀ᶠ i in atTop, good m i) →
    Tendsto tail atTop (𝓝 0) → Tendsto error atTop (𝓝 0) →
    (∀ A m i, A ≤ m → good m i → annularMass A m i ≤ tail A + error m) →
    ∃ outer : ℕ → ℕ, Tendsto outer atTop atTop ∧
      (∀ᶠ i in atTop, ∀ m ≤ outer i, good m i) ∧
      ∀ ε > 0, ∀ᶠ A in atTop, ∀ᶠ i in atTop, annularMass A (outer i) i ≤ ε)

variable {X : Type*} [MeasurableSpace X]

#check (FirstOrderTwistor.exists_slow_diagonal_with_vanishing_annularMeasure :
  ∀ (μ : Measure X) [IsFiniteMeasure μ] (good : ℕ → ℕ → Prop)
    (annularMass : ℕ → ℕ → ℕ → ℝ) (modelAnnulus : ℕ → ℕ → Set X)
    (modelTail : ℕ → Set X) (error : ℕ → ℝ),
    (∀ m, ∀ᶠ i in atTop, good m i) →
    Tendsto (fun A => μ.real (modelTail A)) atTop (𝓝 0) → Tendsto error atTop (𝓝 0) →
    (∀ A m, A ≤ m → modelAnnulus A m ⊆ modelTail A) →
    (∀ A m i, A ≤ m → good m i →
      annularMass A m i ≤ μ.real (modelAnnulus A m) + error m) →
    ∃ outer : ℕ → ℕ, Tendsto outer atTop atTop ∧
      (∀ᶠ i in atTop, ∀ m ≤ outer i, good m i) ∧
      ∀ ε > 0, ∀ᶠ A in atTop, ∀ᶠ i in atTop, annularMass A (outer i) i ≤ ε)
```

## Verification and geometric inputs

`lake env lean FirstOrderTwistor/DiagonalEnd.lean` succeeded. Each declaration depends on `[propext, Classical.choice, Quot.sound]` according to `#print axioms`. Probes exercised arbitrary finite-test thresholds `threshold m ≤ i` and the finite-measure statement for empty reference annuli. The example `good m i := m + 1 ≤ i` also verifies that a prescribed increasing outer choice `outer i := i` can fail even with eventual success for every fixed `m`.

For the supplied smooth oriented Riemannian ALE end, fix radius labels as in EXTRACT-E04. The geometric comparison must supply a single embedding through each fixed full truncation and its buffers. Package the finitely many tests at that truncation, including any core and buffer tests, into `good m i`. For the measure version the same test must certify the comparison for each inner label `A ≤ m` under the embedding at `m`. Apply the result to positive-chirality Hilbert–Schmidt Weyl energy, or separately to the full tensor energy. The application needs finite energy measures and a conformal pullback identity for the selected normalization. It also needs the vanishing reference tail, or the scalar decay majorant of EXTRACT-E04 obtained from the differentiated curvature estimate. The scalar version applies directly to the latter bound with zero additive error.

The nested eventual bound applies to the annuli ending at the selected outer truncation. For actual nonnegative masses these sequences are eventually bounded above at each fixed inner label by the supplied tail and the vanishing error, so the real limsup formulation follows from E16a. EXTRACT-E04 leaves the position of the diagonal endpoint relative to an adjacent chart or prescribed scale undetermined. Any region from that endpoint to the prescribed scale remains an accounting input. [Extent of EXTRACT-E04](../../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/02_dirac_collar_extraction/notes/E04_DIAGONAL_END_20261125.md#extent-of-the-geometric-result)
