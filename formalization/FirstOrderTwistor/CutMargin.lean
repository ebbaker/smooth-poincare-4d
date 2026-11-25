import Mathlib.Basic.Real.Basic

/-!
# Exterior energy margin for one cut

This module isolates the scalar estimate in NECK-E02/E05. The exterior
comparison and its error bound enter as hypotheses.
-/

namespace FirstOrderTwistor

private theorem thresholdBudget_eq (T δ : ℝ) : (2 * T - δ) - T + δ = T := by
  rw [sub_right_comm, sub_add_cancel, two_mul, add_sub_cancel_right]

/-- If the removed energy `x` exceeds `T` and the combined error `η` fits
within the budget margin `δ`, then the capped exterior energy `v` is strictly
below `T`. -/
theorem exteriorEnergyLtThreshold (T δ e x η v : ℝ)
    (_hT : 0 < T) (_hδ : 0 < δ) (he : e ≤ 2 * T - δ) (hx : T < x)
    (_hη : 0 ≤ η) (hηδ : η ≤ δ) (hv : v ≤ e - x + η) : v < T := by
  calc
    v ≤ e - x + η := hv
    _ < e - T + η := add_lt_add_left (sub_lt_sub_left hx e) η
    _ ≤ (2 * T - δ) - T + δ := add_le_add (sub_le_sub_right he T) hηδ
    _ = T := thresholdBudget_eq T δ

-- The error may exhaust the margin when the removed energy exceeds the threshold.
example (T δ e x v : ℝ) (hT : 0 < T) (hδ : 0 < δ) (he : e ≤ 2 * T - δ)
    (hx : T < x) (hv : v ≤ e - x + δ) : v < T :=
  exteriorEnergyLtThreshold T δ e x δ v hT hδ he hx hδ.le le_rfl hv

-- With x = T and η = δ, equality can occur at all energy bounds.
example (T δ : ℝ) (hδ : 0 < δ) :
    ∃ e x η v : ℝ, e = 2 * T - δ ∧ x = T ∧ 0 ≤ η ∧ η = δ ∧
      v = e - x + η ∧ v = T := by
  exact ⟨2 * T - δ, T, δ, T, rfl, rfl, hδ.le, rfl, (thresholdBudget_eq T δ).symm, rfl⟩

/-- A strict error margin yields strictness even when the removed energy
equals the threshold. -/
theorem exteriorEnergyLtThresholdOfStrictError (T δ e x η v : ℝ)
    (he : e ≤ 2 * T - δ) (hx : T ≤ x) (hηδ : η < δ)
    (hv : v ≤ e - x + η) : v < T := by
  calc
    v ≤ e - x + η := hv
    _ ≤ (2 * T - δ) - T + η :=
      add_le_add_left ((sub_le_sub_right he x).trans (sub_le_sub_left hx (2 * T - δ))) η
    _ < (2 * T - δ) - T + δ := add_lt_add_right hηδ ((2 * T - δ) - T)
    _ = T := thresholdBudget_eq T δ

end FirstOrderTwistor
