import SmoothPoincare.IntrinsicEntry.RoundBoundaryForm

/-! # Decay follows from finite classical energy on the round half-line -/

namespace SmoothPoincare.IntrinsicEntry

open Filter MeasureTheory Set
open scoped Topology

/-- The trace at the finite endpoint is irrelevant to decay at infinity. -/
theorem roundCylinderMode_tendsto_zero_of_finiteEnergy (l : ℕ) (w : ℝ → ℝ)
    (hdiff : ∀ t ∈ Ioi 0, DifferentiableAt ℝ w t)
    (hE : IntegrableOn (fun t ↦ (deriv w t) ^ 2 + ((l : ℝ) + 1) ^ 2 * (w t) ^ 2) (Ioi 0)) :
    Tendsto w atTop (𝓝 0) := by
  let k : ℝ := (l : ℝ) + 1
  have hk : 1 ≤ k := le_add_of_nonneg_left (Nat.cast_nonneg l)
  have hkSq : 1 ≤ k ^ 2 := by nlinarith [sq_nonneg (k - 1)]
  have hpot (t : ℝ) : (w t) ^ 2 ≤ k ^ 2 * (w t) ^ 2 := by
    simpa only [one_mul] using mul_le_mul_of_nonneg_right hkSq (sq_nonneg (w t))
  have hwMeas : AEMeasurable w (volume.restrict (Ioi 0)) :=
    (show ContinuousOn w (Ioi 0) from fun t ht ↦
      (hdiff t ht).continuousAt.continuousWithinAt).aemeasurable measurableSet_Ioi
  have hSq : IntegrableOn (fun t ↦ (w t) ^ 2) (Ioi 0) := by
    apply hE.mono' (hwMeas.pow_const 2).aestronglyMeasurable
    exact Eventually.of_forall fun t ↦ by
      rw [Real.norm_eq_abs, abs_of_nonneg (sq_nonneg (w t))]
      linarith [hpot t, sq_nonneg (deriv w t)]
  have hcrossMeas : AEMeasurable (fun t ↦ 2 * w t * deriv w t) (volume.restrict (Ioi 0)) :=
    (measurable_const.aemeasurable.mul hwMeas).mul (measurable_deriv w).aemeasurable
  have hcross : IntegrableOn (fun t ↦ 2 * w t * deriv w t) (Ioi 0) := by
    apply hE.mono' hcrossMeas.aestronglyMeasurable
    exact Eventually.of_forall fun t ↦ by
      rw [Real.norm_eq_abs, abs_le]
      constructor
      · nlinarith [hpot t, sq_nonneg (w t + deriv w t)]
      · nlinarith [hpot t, sq_nonneg (w t - deriv w t)]
  have hderiv (t : ℝ) (ht : t ∈ Ioi (0 : ℝ)) :
      HasDerivAt (fun s ↦ (w s) ^ 2) (2 * w t * deriv w t) t := by
    change HasDerivAt (w ^ 2) (2 * w t * deriv w t) t
    simpa using (hdiff t ht).hasDerivAt.pow 2
  have hdecay := tendsto_zero_of_hasDerivAt_of_integrableOn_Ioi hderiv hcross hSq
  apply tendsto_zero_iff_norm_tendsto_zero.mpr
  have hSqrt : Tendsto (fun t ↦ Real.sqrt ((w t) ^ 2)) atTop (𝓝 (Real.sqrt 0)) :=
    (Real.continuous_sqrt.continuousAt (x := 0)).tendsto.comp hdecay
  simpa only [Real.sqrt_zero, Real.sqrt_sq_eq_abs, Real.norm_eq_abs] using hSqrt

/-- The classical modal domain can equivalently be given without an explicit decay assumption. -/
theorem roundCylinderModeAdmissible_iff_finiteEnergy (l : ℕ) (f : ℝ) (w : ℝ → ℝ) :
    RoundCylinderModeAdmissible l f w ↔
      w 0 = f ∧ ContinuousWithinAt w (Ici 0) 0 ∧ (∀ t ∈ Ioi 0, DifferentiableAt ℝ w t) ∧
        IntegrableOn (fun t ↦ (deriv w t) ^ 2 + ((l : ℝ) + 1) ^ 2 * (w t) ^ 2) (Ioi 0) := by
  constructor
  · intro hw
    exact ⟨hw.trace, hw.continuousAtZero, hw.differentiable, hw.finiteEnergy⟩
  · rintro ⟨ht, hc, hd, he⟩
    exact ⟨ht, hc, hd, he, roundCylinderMode_tendsto_zero_of_finiteEnergy l w hd he⟩

/-- The attained least energy on the classical finite-energy domain with prescribed trace. -/
theorem roundCylinderMode_finiteEnergy_isLeast (l : ℕ) (f : ℝ) :
    IsLeast (roundCylinderModeEnergy l '' {w | w 0 = f ∧ ContinuousWithinAt w (Ici 0) 0 ∧
      (∀ t ∈ Ioi 0, DifferentiableAt ℝ w t) ∧
        IntegrableOn (fun t ↦ (deriv w t) ^ 2 + ((l : ℝ) + 1) ^ 2 * (w t) ^ 2) (Ioi 0)})
      (6 * ((l : ℝ) + 1) * f ^ 2) := by
  simpa only [roundCylinderModeAdmissible_iff_finiteEnergy] using roundCylinderMode_isLeast l f

/-- Exact modal infimum with trace and finite energy as the endpoint conditions. -/
theorem roundCylinderMode_finiteEnergy_inf_eq (l : ℕ) (f : ℝ) :
    sInf (roundCylinderModeEnergy l '' {w | w 0 = f ∧ ContinuousWithinAt w (Ici 0) 0 ∧
      (∀ t ∈ Ioi 0, DifferentiableAt ℝ w t) ∧
        IntegrableOn (fun t ↦ (deriv w t) ^ 2 + ((l : ℝ) + 1) ^ 2 * (w t) ^ 2) (Ioi 0)}) =
      6 * ((l : ℝ) + 1) * f ^ 2 :=
  (roundCylinderMode_finiteEnergy_isLeast l f).csInf_eq

end SmoothPoincare.IntrinsicEntry
