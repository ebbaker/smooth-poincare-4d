import FirstOrderTwistor.CylinderSpectral

/-! # Both endpoint traces from the bulk spectral graph norm
Prepared for Edward B. Baker III, 25 November 2026, with OpenAI Codex assistance.
This estimate concerns all differentiable modes, including inhomogeneous solutions.
-/

namespace FirstOrderTwistor

open MeasureTheory
open scoped RealInnerProductSpace

variable {V : Type*} [NormedAddCommGroup V] [InnerProductSpace ℝ V]

/-- A linear cutoff controls both half-order endpoint energies using only bulk data.
The contribution proportional to inverse length is explicit. -/
theorem cylinderMode_twoTrace_le {L : ℝ} (hL : 0 < L) (eigenvalue : ℝ) {u v : ℝ → V}
    (hu : ∀ t, HasDerivAt u (v t) t) (hv : Continuous v) :
    |eigenvalue| * (‖u 0‖ ^ 2 + ‖u L‖ ^ 2) ≤
      ∫ t in 0..L, ‖v t‖ ^ 2 + (eigenvalue ^ 2 + 2 * |eigenvalue| / L) * ‖u t‖ ^ 2 := by
  let w (t : ℝ) := 2 / L * t - 1
  let flux (t : ℝ) := |eigenvalue| * (w t * ‖u t‖ ^ 2)
  let slope (t : ℝ) := |eigenvalue| * (2 / L * ‖u t‖ ^ 2 + w t * (2 * ⟪u t, v t⟫))
  have hdw (t : ℝ) : HasDerivAt w (2 / L) t := by
    simpa [w] using (((hasDerivAt_id t).const_mul (2 / L)).sub_const 1)
  have hflux (t : ℝ) : HasDerivAt flux (slope t) t := by
    simpa [flux, slope, mul_comm (w t)] using (((hdw t).mul (hu t).norm_sq).const_mul |eigenvalue|)
  have huc : Continuous u := continuous_iff_continuousAt.mpr fun t => (hu t).continuousAt
  have hwc : Continuous w := continuous_iff_continuousAt.mpr fun t => (hdw t).continuousAt
  have hsc : Continuous slope := continuous_const.mul
    ((continuous_const.mul (huc.norm.pow 2)).add (hwc.mul (continuous_const.mul (huc.inner hv))))
  have hbc : Continuous (fun t => ‖v t‖ ^ 2 + (eigenvalue ^ 2 + 2 * |eigenvalue| / L) * ‖u t‖ ^ 2) :=
    (hv.norm.pow 2).add (continuous_const.mul (huc.norm.pow 2))
  have hFTC := intervalIntegral.integral_eq_sub_of_hasDerivAt (a := 0) (b := L)
    (fun t _ => hflux t) (hsc.intervalIntegrable _ _)
  have hends : flux L - flux 0 = |eigenvalue| * (‖u 0‖ ^ 2 + ‖u L‖ ^ 2) := by
    simp [flux, w, hL.ne']; ring
  rw [← hends, ← hFTC]
  apply intervalIntegral.integral_mono_on hL.le (hsc.intervalIntegrable _ _) (hbc.intervalIntegrable _ _)
  intro t ht
  have hw : |w t| ≤ 1 := by
    rw [abs_le]
    dsimp only [w]
    constructor
    · linarith only [mul_nonneg (by positivity : 0 ≤ 2/L) ht.1]
    · have h := mul_le_mul_of_nonneg_left ht.2 (by positivity : 0 ≤ 2/L)
      rw [div_mul_cancel₀ _ hL.ne'] at h
      linarith
  have hcross : w t * ⟪u t, v t⟫ ≤ ‖u t‖ * ‖v t‖ := calc
    _ ≤ |w t * ⟪u t, v t⟫| := le_abs_self _
    _ = |w t| * |⟪u t, v t⟫| := abs_mul _ _
    _ ≤ 1 * (‖u t‖ * ‖v t‖) := mul_le_mul hw (abs_real_inner_le_norm _ _) (abs_nonneg _) zero_le_one
    _ = _ := one_mul _
  have hyoung : 2 * |eigenvalue| * (‖u t‖ * ‖v t‖) ≤
      ‖v t‖ ^ 2 + eigenvalue ^ 2 * ‖u t‖ ^ 2 := by
    have hy := sq_nonneg (‖v t‖ - |eigenvalue| * ‖u t‖)
    rw [sub_sq, mul_pow, sq_abs] at hy
    linarith
  calc
    slope t = 2 * |eigenvalue| / L * ‖u t‖ ^ 2 +
      2 * |eigenvalue| * (w t * ⟪u t, v t⟫) := by dsimp [slope]; ring
    _ ≤ 2 * |eigenvalue| / L * ‖u t‖ ^ 2 + (‖v t‖ ^ 2 + eigenvalue ^ 2 * ‖u t‖ ^ 2) :=
      add_le_add_right ((mul_le_mul_of_nonneg_left hcross (by positivity)).trans hyoung) _
    _ = _ := by ring

/-- For lengths at least one and the unit round gap, both endpoint traces have
a length-independent bound in the ordinary first-order spectral graph norm. -/
theorem roundCylinderMode_traceGraphBound {L eigenvalue : ℝ} (hL : 1 ≤ L) (hgap : 3/2 ≤ |eigenvalue|)
    {u v : ℝ → V} (hu : ∀ t, HasDerivAt u (v t) t) (hv : Continuous v) :
    |eigenvalue| * (‖u 0‖ ^ 2 + ‖u L‖ ^ 2) ≤
      (7/3 : ℝ) * ∫ t in 0..L, ‖v t‖ ^ 2 + (1 + eigenvalue ^ 2) * ‖u t‖ ^ 2 := by
  have hLpos : 0 < L := by linarith
  apply (cylinderMode_twoTrace_le hLpos eigenvalue hu hv).trans
  rw [← intervalIntegral.integral_const_mul]
  have huc : Continuous u := continuous_iff_continuousAt.mpr fun t => (hu t).continuousAt
  apply intervalIntegral.integral_mono_on hLpos.le
    (((hv.norm.pow 2).add (continuous_const.mul (huc.norm.pow 2))).intervalIntegrable _ _)
    ((continuous_const.mul ((hv.norm.pow 2).add (continuous_const.mul (huc.norm.pow 2)))).intervalIntegrable _ _)
  intro t _
  have hfrac : 2 * |eigenvalue| / L ≤ 2 * |eigenvalue| := div_le_self (by positivity) hL
  have hcoef : eigenvalue ^ 2 + 2 * |eigenvalue| / L ≤ (7/3 : ℝ) * (1 + eigenvalue ^ 2) := by
    nlinarith only [hfrac, mul_nonneg (sub_nonneg.mpr hgap) (abs_nonneg eigenvalue), sq_abs eigenvalue]
  change ‖v t‖ ^ 2 + (eigenvalue ^ 2 + 2 * |eigenvalue| / L) * ‖u t‖ ^ 2 ≤
    (7/3 : ℝ) * (‖v t‖ ^ 2 + (1 + eigenvalue ^ 2) * ‖u t‖ ^ 2)
  nlinarith only [mul_le_mul_of_nonneg_right hcoef (sq_nonneg ‖u t‖), sq_nonneg ‖v t‖]

end FirstOrderTwistor
