# FOT-E17g · Build the accounting family from comparison embeddings

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded E work. The serving model and reasoning effort are unavailable.

[Issued request](LAUNCH_REQUESTS_20261125.md#follow-on-fixed-packets--revision-1-same-date-and-pins) · [Lean module](../../../../FirstOrderTwistor/ComparisonFamily.lean) · [Accounting](../../../../FirstOrderTwistor/Accounting.lean) · [Energy density](../../../../FirstOrderTwistor/EnergyDensity.lean)

Verification ran at checkout `7db310a2a9219c537b440d7c2fb39e602a32b729` with SEC SHA-256 `329513a3cfd8e939373533fad90f36b9108ce0ea41a22f9cc348587a4110fe66`. Input SHA-256 values were `d011134593b9e423a48afac9c0db1dfd4d2afa95b66cbda4f103be43637bc820` for `Accounting.lean` and `21f94c69e2aa65e81501105569108459f464ecce79723572a6402c52dab9f024` for `EnergyDensity.lean`. Lean `4.35.0-rc3`, Mathlib `c55e6e786f49` and DifferentialGeometry `788efe978944` are pinned by the Lake manifest.

## Callable declarations

```lean
open FirstOrderTwistor Filter MeasureTheory Set Topology

section
variable {X Y D : Type*} [MeasurableSpace X] [MeasurableSpace Y] [MeasurableSpace D]
  {source : ℕ → FiniteEnergyDensity X} {model : FiniteEnergyDensity Y}

#check (FixedTruncationComparison.tendsto_imageMass :
  ∀ (C : FixedTruncationComparison source model D),
    Tendsto (fun i => (source i).toMeasure.real (range (C.toSource i))) atTop
      (𝓝 (model.toMeasure.real (range C.toModel))))
end

section
variable {X ι : Type*} [MeasurableSpace X]
  {Y : ι → Type*} [∀ j, MeasurableSpace (Y j)]
  {D : ι → ℕ → Type*} [∀ j L, MeasurableSpace (D j L)]

#check (TruncationFamily.ofEnergyComparisons (D := D) :
  ∀ (source : ℕ → FiniteEnergyDensity X) (J : Finset ι)
    (model : (j : ι) → j ∈ J → FiniteEnergyDensity (Y j))
    (comparison : (j : ι) → (hj : j ∈ J) → (L : ℕ) →
      FixedTruncationComparison source (model j hj) (D j L)),
    (∀ j (hj : j ∈ J), Monotone (fun L => range (comparison j hj L).toModel)) →
    (∀ j (hj : j ∈ J),
      (⋃ L, range (comparison j hj L).toModel) =ᵐ[(model j hj).toMeasure] univ) →
    (∀ L, ∀ᶠ i in atTop, ∀ ⦃j⦄ (hj : j ∈ J) ⦃k⦄ (hk : k ∈ J), j ≠ k →
      AEDisjoint (source i).toMeasure (range ((comparison j hj L).toSource i))
        (range ((comparison k hk L).toSource i))) →
    TruncationFamily (fun i => (source i).toMeasure) J Y)
end
```

`FiniteEnergyDensity.toMeasure` supplies a finite measure instance from integrability. `FixedTruncationComparison` requires a finite reference volume, an embedding into the model, eventually a measurable embedding into the source, and volume transport identities on the common reference domain using a.e. measurable and nonnegative Jacobians. It takes uniform convergence of the two Jacobian-weighted densities. Integrability on each image transfers to the reference domain, and convergence of the integrals gives the `compareMass` field. Measurable source ranges follow from the embeddings, with the finite family allowing a common eventual statement. Each model range is measurable by its model embedding. The construction uses zero energy and empty sets at indices outside `J`.

## Evidence and remaining geometric inputs

`lake env lean FirstOrderTwistor/ComparisonFamily.lean` succeeded. `#print axioms` reported `[propext, Classical.choice, Quot.sound]` for `FiniteEnergyDensity.toMeasure`, `FixedTruncationComparison.tendsto_imageMass` and `TruncationFamily.ofEnergyComparisons`. The empty-family probe used no model or comparison data. A singleton with identity embeddings, unit Jacobians and a constant density on an arbitrary finite measure space also elaborated. Its image is the full source and the resulting family invokes `sum_componentEnergy_le` directly with the induced source finite measure instances.

SEC `msgap:accounting` uses smooth oriented comparison embeddings and the same Hilbert–Schmidt chiral Weyl convention on every source and model. The application must identify the actual metric volumes and Jacobians, prove uniform convergence of the weighted chiral densities on each fixed compact domain, and supply increasing model ranges that exhaust up to energy-null sets and source images with pairwise null intersections. The model and source can have different Jacobians relative to the same reference volume. The strip and uncovered-mass estimates from E17c and the gap and residual inputs for E01 remain independent hypotheses. [SEC §12.4](../../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L4695)
