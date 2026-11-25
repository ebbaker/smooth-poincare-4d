import Mathlib.Analysis.SpecialFunctions.Trigonometric.Basic
import Mathlib.Algebra.BigOperators.Group.Finset.Basic

/-!
# Numerical consequences of the ALE end bounds

The inputs are the real energy and Yamabe bounds in SEC `msale:end-count` and
the chiral energy difference computed from the round quaternionic link.
-/

open scoped BigOperators

namespace FirstOrderTwistor

/-- Each end contributes at least the reciprocal of the common upper order. -/
theorem card_div_le_sum_reciprocal_end_orders {ι : Type*} (J : Finset ι)
    (q : ι → ℕ) (Q : ℕ) (hqPos : ∀ j ∈ J, 0 < q j) (hqMax : ∀ j ∈ J, q j ≤ Q) :
    (J.card : ℝ) / (Q : ℝ) ≤ ∑ j ∈ J, (1 : ℝ) / (q j : ℝ) := by
  calc
    (J.card : ℝ) / (Q : ℝ) = ∑ _j ∈ J, (1 : ℝ) / (Q : ℝ) := by
      simp [div_eq_mul_inv]
    _ ≤ ∑ j ∈ J, (1 : ℝ) / (q j : ℝ) := Finset.sum_le_sum fun j hj ↦
      one_div_le_one_div_of_le (by exact_mod_cast hqPos j hj) (by exact_mod_cast hqMax j hj)

/-- The two bounds in SEC `msale:end-count` force a nonempty family to have one end
in the subcritical band. The argument uses an upper bound for the group orders,
with the Yamabe upper bound supplied for that same order. -/
theorem oneALEEndOfSubcriticalBounds {ι : Type*} (J : Finset ι) (q : ι → ℕ) (Q : ℕ)
    (e ePlus eMinus y δ : ℝ) (hJ : J.Nonempty)
    (hqPos : ∀ j ∈ J, 0 < q j) (hqMax : ∀ j ∈ J, q j ≤ Q)
    (hδ : 0 < δ) (he : e ≤ 8 * Real.pi ^ 2 - δ) (hPlus : 0 ≤ ePlus) (hMinus : 0 ≤ eMinus)
    (hLower : (8 * Real.pi ^ 2 - e) + (ePlus + eMinus) / 2 + 4 * Real.pi ^ 2 *
      ((J.card : ℝ) - 2 + ∑ j ∈ J, (1 : ℝ) / (q j : ℝ)) ≤ y ^ 2 / 48)
    (hUpper : y ^ 2 / 48 ≤ 8 * Real.pi ^ 2 / (Q : ℝ)) :
    J.card = 1 := by
  by_contra hCard
  have hCardPos := Finset.card_pos.mpr hJ
  have hTwo : 2 ≤ J.card := by omega
  have hTwoReal : (2 : ℝ) ≤ J.card := by exact_mod_cast hTwo
  have hRecip : (2 : ℝ) / (Q : ℝ) ≤ ∑ j ∈ J, (1 : ℝ) / (q j : ℝ) :=
    (div_le_div_of_nonneg_right hTwoReal (by positivity)).trans
      (card_div_le_sum_reciprocal_end_orders J q Q hqPos hqMax)
  have hBoundary : 8 * Real.pi ^ 2 / (Q : ℝ) ≤ 4 * Real.pi ^ 2 *
      ((J.card : ℝ) - 2 + ∑ j ∈ J, (1 : ℝ) / (q j : ℝ)) := by
    calc
      8 * Real.pi ^ 2 / (Q : ℝ) = 4 * Real.pi ^ 2 * (2 / (Q : ℝ)) := by
        simp only [div_eq_mul_inv]
        ring
      _ ≤ _ := mul_le_mul_of_nonneg_left (by linarith) (by positivity)
  linarith

/-- Nonnegative chiral energies bounded by the subcritical source energy cannot
have the difference in absolute value supplied by the round `Q₈` link. -/
theorem q8EtaContradictionOfSubcriticalBand (e ePlus eMinus δ : ℝ)
    (hδ : 0 < δ) (he : e ≤ 8 * Real.pi ^ 2 - δ)
    (hPlus₀ : 0 ≤ ePlus) (hMinus₀ : 0 ≤ eMinus) (hPlus : ePlus ≤ e) (hMinus : eMinus ≤ e)
    (heta : |ePlus - eMinus| = 9 * Real.pi ^ 2) : False := by
  have hAbs : |ePlus - eMinus| ≤ e := abs_le.mpr ⟨by linarith, by linarith⟩
  linarith [sq_nonneg Real.pi]

end FirstOrderTwistor
