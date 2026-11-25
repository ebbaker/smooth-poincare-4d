import Mathlib.MeasureTheory.Measure.Real

open MeasureTheory Set
open scoped BigOperators

namespace FirstOrderTwistor

variable {X ι κ : Type*} [MeasurableSpace X]

/-- A finite family of measurable components with null pairwise intersections
splits the total mass into the component masses and the mass of their complement. -/
theorem measureReal_univ_eq_sum_add_compl (μ : Measure X) [IsFiniteMeasure μ]
    (J : Finset ι) (component : ι → Set X)
    (hmeas : ∀ j ∈ J, MeasurableSet (component j))
    (hdisj : Set.Pairwise (↑J) (fun j k => AEDisjoint μ (component j) (component k))) :
    μ.real univ = (∑ j ∈ J, μ.real (component j)) + μ.real (⋃ j ∈ J, component j)ᶜ := by
  have hunion : MeasurableSet (⋃ j ∈ J, component j) :=
    MeasurableSet.biUnion (Finset.countable_toSet J) hmeas
  rw [← measureReal_biUnion_finset₀ hdisj (fun j hj => (hmeas j hj).nullMeasurableSet)]
  exact (measureReal_add_measureReal_compl hunion).symm

/-- Bounds on the masses of finitely many strips bound the mass of a remainder
up to the mass of its part outside all strips. The strips may overlap. -/
theorem measureReal_le_sum_add_uncovered (μ : Measure X) [IsFiniteMeasure μ]
    (remainder : Set X) (K : Finset κ) (strip : κ → Set X) (err : κ → ℝ)
    (hstrip : ∀ k ∈ K, μ.real (strip k) ≤ err k) :
    μ.real remainder ≤ (∑ k ∈ K, err k) + μ.real (remainder \ ⋃ k ∈ K, strip k) := by
  calc
    μ.real remainder ≤ μ.real (⋃ k ∈ K, strip k) + μ.real (remainder \ ⋃ k ∈ K, strip k) := by
      rw [add_comm, ← sub_le_iff_le_add]
      exact le_measureReal_sdiff (measure_ne_top μ _)
    _ ≤ (∑ k ∈ K, err k) + μ.real (remainder \ ⋃ k ∈ K, strip k) :=
      add_le_add ((measureReal_biUnion_finset_le K strip).trans (Finset.sum_le_sum hstrip)) le_rfl

end FirstOrderTwistor
