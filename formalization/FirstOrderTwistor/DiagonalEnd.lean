import Mathlib.MeasureTheory.Measure.Real
import Mathlib.Topology.Instances.Real.Lemmas
import Mathlib.Topology.Order.OrderClosed

open Filter MeasureTheory Set
open scoped Topology

namespace FirstOrderTwistor

/-- Eventual success of each fixed test permits an outer index tending to
infinity on which every test through the chosen outer index succeeds. -/
theorem exists_slow_diagonal (good : ℕ → ℕ → Prop)
    (hgood : ∀ m, ∀ᶠ i in atTop, good m i) :
    ∃ outer : ℕ → ℕ, Tendsto outer atTop atTop ∧
      ∀ᶠ i in atTop, ∀ m ≤ outer i, good m i := by
  classical
  have hprefix (m : ℕ) : ∀ᶠ i in atTop, ∀ n ≤ m, good n i := by
    simpa only [Finset.mem_range, Nat.lt_succ_iff] using
      (eventually_all_finset (Finset.range (m + 1))).2 (fun n _ => hgood n)
  let outer (i : ℕ) := Nat.findGreatest (fun m => ∀ n ≤ m, good n i) i
  refine ⟨outer, tendsto_atTop.2 (fun m => ?_), ?_⟩
  · filter_upwards [eventually_ge_atTop m, hprefix m] with i hi hg
    exact Nat.le_findGreatest hi hg
  · filter_upwards [hprefix 0] with i hi
    exact Nat.findGreatest_spec (P := fun m => ∀ n ≤ m, good n i) (Nat.zero_le i) hi

/-- On the selected annuli, a vanishing inner tail and a vanishing outer
comparison error give smallness first in the source index and then in the
inner truncation. -/
theorem exists_slow_diagonal_with_vanishing_annularMass (good : ℕ → ℕ → Prop)
    (annularMass : ℕ → ℕ → ℕ → ℝ) (tail error : ℕ → ℝ)
    (hgood : ∀ m, ∀ᶠ i in atTop, good m i)
    (htail : Tendsto tail atTop (𝓝 0)) (herror : Tendsto error atTop (𝓝 0))
    (hbound : ∀ A m i, A ≤ m → good m i → annularMass A m i ≤ tail A + error m) :
    ∃ outer : ℕ → ℕ, Tendsto outer atTop atTop ∧
      (∀ᶠ i in atTop, ∀ m ≤ outer i, good m i) ∧
      ∀ ε > 0, ∀ᶠ A in atTop, ∀ᶠ i in atTop, annularMass A (outer i) i ≤ ε := by
  obtain ⟨outer, houter, htests⟩ := exists_slow_diagonal good hgood
  refine ⟨outer, houter, htests, fun ε hε => ?_⟩
  have hhalf : 0 < ε / 2 := half_pos hε
  filter_upwards [htail.eventually_lt_const hhalf] with A hA
  filter_upwards [houter.eventually (eventually_ge_atTop A), htests,
    (herror.comp houter).eventually_lt_const hhalf] with i hi htest herr
  calc
    annularMass A (outer i) i ≤ tail A + error (outer i) :=
      hbound A (outer i) i hi (htest (outer i) le_rfl)
    _ ≤ ε / 2 + ε / 2 := add_le_add hA.le herr.le
    _ = ε := add_halves ε

/-- A comparison with an annulus in the model tail supplies the real mass
bound on the same selected source annuli. -/
theorem exists_slow_diagonal_with_vanishing_annularMeasure {X : Type*}
    [MeasurableSpace X] (μ : Measure X) [IsFiniteMeasure μ]
    (good : ℕ → ℕ → Prop) (annularMass : ℕ → ℕ → ℕ → ℝ)
    (modelAnnulus : ℕ → ℕ → Set X) (modelTail : ℕ → Set X) (error : ℕ → ℝ)
    (hgood : ∀ m, ∀ᶠ i in atTop, good m i)
    (htail : Tendsto (fun A => μ.real (modelTail A)) atTop (𝓝 0))
    (herror : Tendsto error atTop (𝓝 0))
    (hsubset : ∀ A m, A ≤ m → modelAnnulus A m ⊆ modelTail A)
    (hcompare : ∀ A m i, A ≤ m → good m i →
      annularMass A m i ≤ μ.real (modelAnnulus A m) + error m) :
    ∃ outer : ℕ → ℕ, Tendsto outer atTop atTop ∧
      (∀ᶠ i in atTop, ∀ m ≤ outer i, good m i) ∧
      ∀ ε > 0, ∀ᶠ A in atTop, ∀ᶠ i in atTop, annularMass A (outer i) i ≤ ε := by
  apply exists_slow_diagonal_with_vanishing_annularMass good annularMass
    (fun A => μ.real (modelTail A)) error hgood htail herror
  intro A m i hAm htest
  exact (hcompare A m i hAm htest).trans (add_le_add
    (measureReal_mono (hsubset A m hAm) (measure_ne_top μ _)) le_rfl)

end FirstOrderTwistor
