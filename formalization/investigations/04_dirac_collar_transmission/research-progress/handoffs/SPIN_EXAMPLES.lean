import FirstOrderTwistor.SpinCoverAccounting
import FirstOrderTwistor.SpinCoverBounds
import Mathlib.Analysis.SpecificLimits.Basic
import Mathlib.MeasureTheory.Measure.Count

/-!
# Finite-cover checks for SPIN-E01 and SPIN-E02

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex
assistance. The serving model and effort are unavailable. Input checkout
`5ff7014` with the SPIN-E01 and SPIN-E02 proofs and pinned Lean dependencies.
The examples concern finite measures and scalar costs.
-/

open Filter MeasureTheory Set FirstOrderTwistor
open scoped BigOperators ENNReal Topology

namespace SpinExamples

private abbrev X := Fin 4
private noncomputable abbrev μ : Measure X := Measure.count

private def residual : Set X := ↑({0, 1, 2} : Finset X)

private def strip (j : Bool) : Set X :=
  if j then ↑({0, 1, 3} : Finset X) else ↑({0, 3} : Finset X)

private def weight (j : Bool) : ℕ := if j then 3 else 2
private noncomputable def floor (j : Bool) : ℝ := if j then 2 else 1

private noncomputable def gauge (j : Bool) : SpinDefectStrip X Unit where
  volume := (weight j : ℝ≥0∞) • μ
  weylNormSq := fun _ => 1 / (weight j : ℝ)
  fields := {()}
  spinorNormSq := fun _ _ => (floor j) ^ 2
  projectedNormSq := fun _ _ => (floor j) ^ 2 / (2 * (weight j : ℝ))
  floor := floor j

private theorem gaugeValid (j : Bool) : (gauge j).ValidOn μ (residual ∩ strip j) := by
  have hw : 0 < (weight j : ℝ) := by cases j <;> norm_num [weight]
  have hVolume : IsFiniteMeasure (gauge j).volume := μ.smul_finite (by simp)
  refine ⟨MeasurableSet.of_discrete, ?_, (integrable_const _).integrableOn, ?_,
    fun _ _ => (integrable_const _).integrableOn, ?_, ?_, ?_⟩
  · change μ.restrict _ = (energyMeasure ((weight j : ℝ≥0∞) • μ)
      (fun _ => 1 / (weight j : ℝ))).restrict _
    have hWeight : ENNReal.ofReal (1 / (weight j : ℝ)) * (weight j : ℝ≥0∞) = 1 := by
      rw [show (weight j : ℝ≥0∞) = ENNReal.ofReal (weight j : ℝ) by simp,
        ← ENNReal.ofReal_mul (by positivity), one_div_mul_cancel hw.ne', ENNReal.ofReal_one]
    rw [energyMeasure, withDensity_const, smul_smul, hWeight, one_smul]
  · exact ae_of_all _ fun _ => (one_div_pos.mpr hw).le
  · intro a ha
    exact ae_of_all _ fun _ => by cases j <;> norm_num [gauge, floor, weight]
  · cases j <;> norm_num [gauge, floor]
  · exact ae_of_all _ fun _ => by simp [gauge]

private theorem false_clipped : residual ∩ strip false = ↑({0} : Finset X) := by
  ext x
  fin_cases x <;> simp [residual, strip]

private theorem true_clipped : residual ∩ strip true = ↑({0, 1} : Finset X) := by
  ext x
  fin_cases x <;> simp [residual, strip]

private theorem uncovered : residual \ (⋃ j ∈ (Finset.univ : Finset Bool), strip j) =
    ↑({2} : Finset X) := by
  ext x
  fin_cases x <;> simp [residual, strip, Set.mem_iUnion, Bool.exists_bool]

private theorem cost_false : (gauge false).weightedCost (residual ∩ strip false) = 1 := by
  rw [false_clipped]
  norm_num [SpinDefectStrip.weightedCost, gauge, weight, floor, setIntegral_const,
    measureReal_def, Measure.smul_apply, Measure.count_apply_finset]

private theorem cost_true : (gauge true).weightedCost (residual ∩ strip true) = 2 := by
  rw [true_clipped]
  simp only [SpinDefectStrip.weightedCost, gauge, weight, floor, ite_true, Finset.sum_singleton,
    setIntegral_const, smul_eq_mul, measureReal_def, Measure.smul_apply, Measure.count_apply_finset]
  norm_num

/-- The two strips share point 0 and each includes point 3 outside the residual.
The weighted costs are 1 and 2. Point 2 contributes one uncovered unit. -/
example : μ.real residual ≤
    μ.real (residual \ ⋃ j ∈ (Finset.univ : Finset Bool), strip j) +
      ∑ j : Bool, (gauge j).weightedCost (residual ∩ strip j) := by
  have hCover := setIntegral_le_uncovered_add_sum μ residual Finset.univ strip (fun _ => 1)
    MeasurableSet.of_discrete (fun _ _ => MeasurableSet.of_discrete)
    (integrable_const _).integrableOn (ae_of_all _ fun _ => zero_le_one)
  simp only [setIntegral_const, smul_eq_mul, mul_one] at hCover
  exact hCover.trans (add_le_add le_rfl (Finset.sum_le_sum fun j _ =>
    SpinDefectStrip.mass_le_weightedCost (gaugeValid j)))

example : μ.real residual = 3 ∧
    μ.real (residual \ ⋃ j ∈ (Finset.univ : Finset Bool), strip j) +
      (∑ j : Bool, (gauge j).weightedCost (residual ∩ strip j)) = 4 := by
  rw [uncovered, Fintype.sum_bool, cost_false, cost_true]
  simp only [residual, measureReal_def, Measure.count_apply_finset]
  norm_num

private noncomputable def share (n : ℕ) : ℝ := 1 / ((n : ℝ) + 1)

private theorem share_tendsto_zero : Tendsto share atTop (𝓝 0) :=
  tendsto_one_div_add_atTop_nhds_zero_nat

private noncomputable def growingCost (n _ : ℕ) : ℝ := share n

private theorem growing_sum (n : ℕ) : ∑ j ∈ Finset.range (n + 1), growingCost n j = 1 := by
  unfold growingCost
  rw [Finset.sum_const, Finset.card_range, nsmul_eq_mul]
  simp only [share, Nat.cast_add, Nat.cast_one]
  field_simp

/-- With `n + 1` strips and unit floors, all individual weighted costs are
uniformly small, yet the weighted sum stays one. -/
example : (∀ ε : ℝ, 0 < ε → ∀ᶠ n in atTop, ∀ j ∈ Finset.range (n + 1), growingCost n j ≤ ε) ∧
    (∀ n : ℕ, ∑ j ∈ Finset.range (n + 1), growingCost n j = 1) ∧
    ¬ (∀ ε : ℝ, 0 < ε → ∀ᶠ n in atTop, (∑ j ∈ Finset.range (n + 1), growingCost n j) ≤ ε) := by
  refine ⟨?_, growing_sum, ?_⟩
  · intro ε hε
    filter_upwards [(tendsto_order.1 share_tendsto_zero).2 ε hε] with n hn
    exact fun _ _ => hn.le
  · intro h
    obtain ⟨n, hn⟩ := (h (1 / 2) (by norm_num)).exists
    rw [growing_sum] at hn
    norm_num at hn

private noncomputable def defect (n : ℕ) : ℝ := share n ^ 2 / 2

/-- With one strip, the unweighted defect tends to zero as its floor shrinks.
The local estimate permits unit energy, and the weighted cost is always one. -/
example : Tendsto defect atTop (𝓝 0) ∧
    (∀ n : ℕ, 0 < share n ∧ share n ^ 2 * 1 = 2 * defect n ∧
      2 * defect n / share n ^ 2 = 1) ∧
    ¬ (∀ ε : ℝ, 0 < ε → ∀ᶠ n in atTop, 2 * defect n / share n ^ 2 ≤ ε) := by
  have hPos (n : ℕ) : 0 < share n := by dsimp [share]; positivity
  have hCost (n : ℕ) : 2 * defect n / share n ^ 2 = 1 := by
    unfold defect
    field_simp [(hPos n).ne']
  refine ⟨?_, fun n => ⟨hPos n, by unfold defect; ring, hCost n⟩, ?_⟩
  · change Tendsto (fun n => share n ^ 2 / 2) atTop (𝓝 0)
    simpa using (share_tendsto_zero.pow 2).div_const 2
  · intro h
    obtain ⟨n, hn⟩ := (h (1 / 2) (by norm_num)).exists
    rw [hCost] at hn
    norm_num at hn

end SpinExamples
