import Mathlib.Analysis.SpecialFunctions.Trigonometric.Basic
import Mathlib.Algebra.BigOperators.Group.Finset.Basic

/-!
# Finite energy accounting with a strict residual

This is the finite arithmetic implication of SEC §15. The accounting equality,
component gaps and strict residual are hypotheses.
-/

open scoped BigOperators

namespace SectionsAndConnections

/-- Full accounting leaves all energy on the base in the stated band if every
positive bubble leaves a strictly positive residual. -/
theorem noPositiveBubbleOfFiniteAccounting {ι : Type*} [DecidableEq ι]
    (J : Finset ι) (e b δ : ℝ) (x : ι → ℝ)
    (hδ : 0 < δ) (hb : 0 ≤ b) (hx : ∀ j ∈ J, 0 ≤ x j)
    (_heLower : 4 * Real.pi ^ 2 ≤ e) (heUpper : e ≤ 8 * Real.pi ^ 2 - δ)
    (haccount : e = b + (∑ j ∈ J, x j))
    (hbaseGap : b = 0 ∨ 4 * Real.pi ^ 2 < b)
    (hbubbleGap : ∀ j ∈ J, x j = 0 ∨ 4 * Real.pi ^ 2 < x j)
    (hresidual : ∀ j ∈ J, 0 < x j → 0 < e - x j) :
    (∀ j ∈ J, x j = 0) ∧ e = b := by
  have hxZero : ∀ j ∈ J, x j = 0 := by
    intro j hj
    rcases hbubbleGap j hj with hzero | hjGap
    · exact hzero
    have hjPositive : 0 < x j := lt_of_le_of_lt (by positivity) hjGap
    have hremainingUpper : e - x j < 4 * Real.pi ^ 2 := by linarith
    have hsumSplit := Finset.sum_erase_add J x hj
    have hremaining : e - x j = b + (∑ k ∈ J.erase j, x k) := by linarith
    have hrestNonneg : ∀ k ∈ J.erase j, 0 ≤ x k :=
      fun k hk ↦ hx k (Finset.mem_of_mem_erase hk)
    have hbZero : b = 0 := by
      rcases hbaseGap with hzero | hgap
      · exact hzero
      have hsumNonneg := Finset.sum_nonneg hrestNonneg
      linarith
    have hrestZero : ∀ k ∈ J.erase j, x k = 0 := by
      intro k hk
      rcases hbubbleGap k (Finset.mem_of_mem_erase hk) with hzero | hgap
      · exact hzero
      have hpieceLe := Finset.single_le_sum hrestNonneg hk
      linarith
    have hsumZero := Finset.sum_eq_zero hrestZero
    have hpositive := hresidual j hj hjPositive
    linarith
  exact ⟨hxZero, by simpa [Finset.sum_eq_zero hxZero] using haccount⟩

end SectionsAndConnections
