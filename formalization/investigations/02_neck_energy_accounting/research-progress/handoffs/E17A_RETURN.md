# FOT-E17a · Finite measure accounting

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded E work. The serving model and reasoning effort are unavailable.

[Issued request](LAUNCH_REQUESTS_20261125.md) · [Lean module](../../../../FirstOrderTwistor/MeasureAccounting.lean) · [Route plan](../../research-plan/PLAN.md)

The proof ran at checkout `ad23403e9be521ebbc8395a9d958c0a02aef3c84`. The Lake manifest and the SEC manuscript match the issued checkout `cf03e8f09359cac317499f6928edb09e4f80c280`. The manuscript SHA-256 is `329513a3cfd8e939373533fad90f36b9108ce0ea41a22f9cc348587a4110fe66`. Lean `4.35.0-rc3`, Mathlib `c55e6e786f49` and DifferentialGeometry `788efe978944` are pinned by the project.

## Callable types

```lean
open MeasureTheory Set
open scoped BigOperators

variable {X ι κ : Type*} [MeasurableSpace X]

#check (FirstOrderTwistor.measureReal_univ_eq_sum_add_compl :
  ∀ (μ : Measure X) [IsFiniteMeasure μ] (J : Finset ι) (component : ι → Set X),
    (∀ j ∈ J, MeasurableSet (component j)) →
    Set.Pairwise (↑J) (fun j k => AEDisjoint μ (component j) (component k)) →
    μ.real univ = (∑ j ∈ J, μ.real (component j)) + μ.real (⋃ j ∈ J, component j)ᶜ)

#check (FirstOrderTwistor.measureReal_le_sum_add_uncovered :
  ∀ (μ : Measure X) [IsFiniteMeasure μ] (remainder : Set X) (K : Finset κ)
    (strip : κ → Set X) (err : κ → ℝ),
    (∀ k ∈ K, μ.real (strip k) ≤ err k) →
    μ.real remainder ≤ (∑ k ∈ K, err k) + μ.real (remainder \ ⋃ k ∈ K, strip k))
```

The first theorem uses finite additivity on a.e. disjoint sets and on the measurable union and its complement. The second uses subadditivity and the strip bounds. It applies to an arbitrary remainder, so take `remainder := (⋃ j ∈ J, component j)ᶜ` for E17. Neither the strips nor the remainder need to be measurable for the bound. It retains the full mass of the uncovered difference, including possible transition pieces. An empty strip family leaves the full remainder as uncovered mass.

## Evidence and inputs for composition

The standalone module elaborated with `lake env lean FirstOrderTwistor/MeasureAccounting.lean`. The two `#check` and `#print axioms` probes reported the types above and dependencies `[propext, Classical.choice, Quot.sound]` for each theorem. Explicit empty-`J`, empty-`K`, and two identical strips also elaborated.

For `msgap:accounting` in SEC §12.4, instantiate the finite measure at each source index by the positive-chirality Hilbert–Schmidt Weyl energy measure. The source argument must supply finiteness, measurable fixed-truncation images and pairwise null intersections. SEC uses disjoint interiors and asserts that embedded comparison boundaries have zero Weyl measure. To pass from the fixed-measure split to the iterated accounting claim, the source argument must also supply fixed-truncation convergence, component exhaustion, and estimates for the sum of strip errors and the remaining uncovered mass. [SEC §12.4](../../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L4695)
