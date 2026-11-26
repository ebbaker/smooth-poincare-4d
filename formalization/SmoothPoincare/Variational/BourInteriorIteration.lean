import SmoothPoincare.Variational.BourTransportedInterior

/-! # Absorbing the first derivatives in the stationary interior estimate

Prepared for Edward B. Baker III with OpenAI Codex assistance, 26 November 2026.
The terminal bound of an individual smooth chart may depend on the chart.
-/

open Filter MeasureTheory Set
open scoped Topology ENNReal

namespace SmoothPoincare

/-- Nested-ball estimates with gaps halving and an inverse-square cost.
The last remainder uses only an individual bound, whereas the returned
constant is uniform in the chart. -/
theorem bourInterior_dyadicAbsorption (X : ℕ → ℝ) (C : ℝ)
    (h : ∀ n, X n ≤ X (n+1) / 8 + C * 4^n)
    (hfinite : BddAbove (range X)) : X 0 ≤ 2*C := by
  obtain ⟨B,hB⟩ := hfinite
  have htel (n : ℕ) : X 0 ≤ (1/(8:ℝ))^n * X n + 2*C*(1-(1/(2:ℝ))^n) := by
    induction n with
    | zero => simp
    | succ n ih =>
      have hstep := mul_le_mul_of_nonneg_left (h n) (show 0 ≤ (1/(8:ℝ))^n by positivity)
      have hp : (1/(8:ℝ))^n * 4^n = (1/(2:ℝ))^n := by rw [← mul_pow]; norm_num
      rw [pow_succ, pow_succ]
      nlinarith only [ih, hstep, congrArg (C * ·) hp]
  have hbound (n : ℕ) : X 0 ≤ (1/(8:ℝ))^n * B + 2*C*(1-(1/(2:ℝ))^n) :=
    (htel n).trans (add_le_add (mul_le_mul_of_nonneg_left
      (hB (mem_range_self n)) (show 0 ≤ (1/(8:ℝ))^n by positivity)) le_rfl)
  have hp₁ := tendsto_pow_atTop_nhds_zero_of_lt_one (show (0:ℝ) ≤ 1/8 by norm_num) (by norm_num : (1:ℝ)/8 < 1)
  have hp₂ := tendsto_pow_atTop_nhds_zero_of_lt_one (show (0:ℝ) ≤ 1/2 by norm_num) (by norm_num : (1:ℝ)/2 < 1)
  have hlim : Tendsto (fun n : ℕ => (1/(8:ℝ))^n * B + 2*C*(1-(1/(2:ℝ))^n)) atTop (𝓝 (2*C)) := by
    simpa using (hp₁.mul_const B).add ((hp₂.const_sub 1).const_mul (2*C))
  exact le_of_tendsto_of_tendsto tendsto_const_nhds hlim (Eventually.of_forall hbound)

/-- Choosing the interpolation length as a fixed multiple of the gap
absorbs the first-order system with the coefficient used in the dyadic
estimate. The norm of the undifferentiated field is included in V. -/
theorem bourInterior_absorbFirstDerivative {X Y A B V g δ : ℝ}
    (hB : 0 < B) (hg : 0 < g) (hδ : δ = g / (8*B))
    (hPDE : X ≤ A / g^2 + B / g * Y)
    (hinterp : Y ≤ δ * V + B / δ) :
    X ≤ V / 8 + (A + 8*B^3) / g^2 := by
  subst δ
  have hmul := mul_le_mul_of_nonneg_left hinterp (by positivity : 0 ≤ B/g)
  calc
    X ≤ A/g^2 + B/g * (g/(8*B)*V + B/(g/(8*B))) := hPDE.trans (by linarith only [hmul])
    _ = _ := by field_simp; ring

end SmoothPoincare
