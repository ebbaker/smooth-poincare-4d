import Mathlib.Analysis.Calculus.FDeriv.Measurable
import Mathlib.Analysis.SpecialFunctions.ImproperIntegrals

/-!
# A single mode on a unit round half-cylinder

This is the one-dimensional step of `prop:round-boundary-form` in the
marked-cut manuscript. The unit round three-sphere contributes scalar
curvature six and the degree `l` mode has angular eigenvalue `l * (l + 2)`.
After division by six the potential is `(l + 1)^2`.
-/

namespace SmoothPoincare.IntrinsicEntry

open Filter MeasureTheory Set
open scoped Topology

/-- The finite-energy classical profiles used for the fixed-mode calculation. -/
structure RoundCylinderModeAdmissible (l : ℕ) (f : ℝ) (w : ℝ → ℝ) : Prop where
  trace : w 0 = f
  continuousAtZero : ContinuousWithinAt w (Ici 0) 0
  differentiable : ∀ t ∈ Ioi 0, DifferentiableAt ℝ w t
  finiteEnergy : IntegrableOn (fun t ↦ (deriv w t) ^ 2 + ((l : ℝ) + 1) ^ 2 * (w t) ^ 2)
    (Ioi 0)
  decays : Tendsto w atTop (𝓝 0)

/-- Scalar-form energy of one real mode, with unit angular `L²` norm. -/
noncomputable def roundCylinderModeEnergy (l : ℕ) (w : ℝ → ℝ) : ℝ :=
  6 * ∫ t in Ioi (0 : ℝ), (deriv w t) ^ 2 + ((l : ℝ) + 1) ^ 2 * (w t) ^ 2

/-- The decaying mode with endpoint coefficient `f`. -/
noncomputable def roundCylinderModeExtension (l : ℕ) (f : ℝ) (t : ℝ) : ℝ :=
  f * Real.exp (-((l : ℝ) + 1) * t)

/-- The integrated square completion, with the boundary term from the half-line FTC. -/
theorem roundCylinderModeEnergy_eq (l : ℕ) (f : ℝ) (w : ℝ → ℝ)
    (hw : RoundCylinderModeAdmissible l f w) :
    roundCylinderModeEnergy l w =
      6 * ((l : ℝ) + 1) * f ^ 2 +
        6 * ∫ t in Ioi (0 : ℝ), (deriv w t + ((l : ℝ) + 1) * w t) ^ 2 := by
  let k : ℝ := (l : ℝ) + 1
  let density : ℝ → ℝ := fun t ↦ (deriv w t) ^ 2 + k ^ 2 * (w t) ^ 2
  let cross : ℝ → ℝ := fun t ↦ 2 * k * w t * deriv w t
  have hwMeas : AEMeasurable w (volume.restrict (Ioi 0)) :=
    (show ContinuousOn w (Ioi 0) from fun t ht ↦
      (hw.differentiable t ht).continuousAt.continuousWithinAt).aemeasurable measurableSet_Ioi
  have hcrossMeas : AEMeasurable cross (volume.restrict (Ioi 0)) :=
    ((measurable_const.aemeasurable.mul hwMeas).mul (measurable_deriv w).aemeasurable)
  have hcross : IntegrableOn cross (Ioi 0) := by
    apply hw.finiteEnergy.mono' hcrossMeas.aestronglyMeasurable
    exact Eventually.of_forall fun t ↦ by
      rw [Real.norm_eq_abs, abs_le]
      change -(density t) ≤ cross t ∧ cross t ≤ density t
      constructor
      · dsimp [density, cross]
        nlinarith [sq_nonneg (deriv w t + k * w t)]
      · dsimp [density, cross]
        nlinarith [sq_nonneg (deriv w t - k * w t)]
  have hboundary : (∫ t in Ioi (0 : ℝ), cross t) = -(k * f ^ 2) := by
    have hderiv (t : ℝ) (ht : t ∈ Ioi (0 : ℝ)) :
        HasDerivAt (fun s ↦ k * (w s) ^ 2) (cross t) t := by
      convert ((hw.differentiable t ht).hasDerivAt.pow 2).const_mul k using 1
      simp [cross]
      ring
    have hdecay : Tendsto (fun t ↦ k * (w t) ^ 2) atTop (𝓝 0) := by
      simpa using (hw.decays.pow 2).const_mul k
    have hcont : ContinuousWithinAt (fun t ↦ k * (w t) ^ 2) (Ici 0) 0 :=
      continuousWithinAt_const.mul (hw.continuousAtZero.pow 2)
    simpa [hw.trace] using integral_Ioi_of_hasDerivAt_of_tendsto hcont hderiv hcross hdecay
  have hsplit : (fun t ↦ (deriv w t + k * w t) ^ 2) = (fun t ↦ density t + cross t) := by
    ext t
    simp [density, cross]
    ring
  change 6 * (∫ t in Ioi (0 : ℝ), density t) =
    6 * k * f ^ 2 + 6 * ∫ t in Ioi (0 : ℝ), (deriv w t + k * w t) ^ 2
  have hdensity : Integrable density (volume.restrict (Ioi 0)) := hw.finiteEnergy
  have hcrossInt : Integrable cross (volume.restrict (Ioi 0)) := hcross
  rw [hsplit, integral_add hdensity hcrossInt, hboundary]
  ring

private theorem roundCylinderModeExtension_hasDerivAt (l : ℕ) (f t : ℝ) :
    HasDerivAt (roundCylinderModeExtension l f)
      (-((l : ℝ) + 1) * roundCylinderModeExtension l f t) t := by
  unfold roundCylinderModeExtension
  have hlinear : HasDerivAt (fun s : ℝ ↦ -((l : ℝ) + 1) * s) (-((l : ℝ) + 1)) t := by
    simpa only [mul_one, id_eq] using (hasDerivAt_id t).const_mul (-((l : ℝ) + 1))
  convert hlinear.exp.const_mul f using 1
  ring

/-- The explicit exponential profile belongs to the same class as every competitor. -/
theorem roundCylinderModeExtension_admissible (l : ℕ) (f : ℝ) :
    RoundCylinderModeAdmissible l f (roundCylinderModeExtension l f) := by
  let k : ℝ := (l : ℝ) + 1
  have hk : 0 < k := by dsimp [k]; positivity
  refine ⟨by simp [roundCylinderModeExtension],
    (roundCylinderModeExtension_hasDerivAt l f 0).continuousAt.continuousWithinAt,
    fun t _ ↦ (roundCylinderModeExtension_hasDerivAt l f t).differentiableAt, ?_, ?_⟩
  · have hexp := integrableOn_exp_mul_Ioi (a := -2 * k) (by linarith) 0
    have hdensity :
        (fun t ↦ (deriv (roundCylinderModeExtension l f) t) ^ 2 +
          k ^ 2 * (roundCylinderModeExtension l f t) ^ 2) =
        (fun t ↦ (2 * k ^ 2 * f ^ 2) * Real.exp (-2 * k * t)) := by
      ext t
      rw [(roundCylinderModeExtension_hasDerivAt l f t).deriv]
      change (-k * (f * Real.exp (-k * t))) ^ 2 + k ^ 2 * (f * Real.exp (-k * t)) ^ 2 =
        (2 * k ^ 2 * f ^ 2) * Real.exp (-2 * k * t)
      rw [show -2 * k * t = -k * t + -k * t by ring, Real.exp_add]
      ring
    change IntegrableOn (fun t ↦ (deriv (roundCylinderModeExtension l f) t) ^ 2 +
      k ^ 2 * (roundCylinderModeExtension l f t) ^ 2) (Ioi 0)
    rw [hdensity]
    exact hexp.const_mul (2 * k ^ 2 * f ^ 2)
  · have hlinear : Tendsto (fun t : ℝ ↦ -k * t) atTop atBot :=
      tendsto_const_nhds.neg_mul_atTop (neg_neg_of_pos hk) tendsto_id
    change Tendsto (fun t ↦ f * Real.exp (-k * t)) atTop (𝓝 0)
    simpa only [Function.comp_apply, mul_zero] using (Real.tendsto_exp_atBot.comp hlinear).const_mul f

/-- The exponential makes the remainder in the square completion vanish. -/
theorem roundCylinderModeExtension_energy (l : ℕ) (f : ℝ) :
    roundCylinderModeEnergy l (roundCylinderModeExtension l f) =
      6 * ((l : ℝ) + 1) * f ^ 2 := by
  rw [roundCylinderModeEnergy_eq l f _ (roundCylinderModeExtension_admissible l f)]
  simp_rw [(roundCylinderModeExtension_hasDerivAt l f _).deriv, neg_mul, neg_add_cancel,
    zero_pow (by decide : 2 ≠ 0), integral_zero, mul_zero, add_zero]

/-- The value is a least element of the actual energy range at the prescribed trace. -/
theorem roundCylinderMode_isLeast (l : ℕ) (f : ℝ) :
    IsLeast (roundCylinderModeEnergy l '' {w | RoundCylinderModeAdmissible l f w})
      (6 * ((l : ℝ) + 1) * f ^ 2) := by
  refine ⟨⟨roundCylinderModeExtension l f, roundCylinderModeExtension_admissible l f,
    roundCylinderModeExtension_energy l f⟩, ?_⟩
  rintro _ ⟨w, hw, rfl⟩
  rw [roundCylinderModeEnergy_eq l f w hw]
  have hsquare : 0 ≤ ∫ t in Ioi (0 : ℝ), (deriv w t + ((l : ℝ) + 1) * w t) ^ 2 :=
    integral_nonneg fun t ↦ sq_nonneg _
  linarith

/-- The infimum over actual admissible profiles, including its normalization. -/
theorem roundCylinderMode_inf_eq (l : ℕ) (f : ℝ) :
    sInf (roundCylinderModeEnergy l '' {w | RoundCylinderModeAdmissible l f w}) =
      6 * ((l : ℝ) + 1) * f ^ 2 :=
  (roundCylinderMode_isLeast l f).csInf_eq

/-- The boundary energy coefficient in the constant mode is six. -/
theorem roundCylinderMode_zero_inf_eq (f : ℝ) :
    sInf (roundCylinderModeEnergy 0 '' {w | RoundCylinderModeAdmissible 0 f w}) = 6 * f ^ 2 := by
  simpa using roundCylinderMode_inf_eq 0 f

/-- The boundary energy coefficient in the first nonconstant mode is twelve. -/
theorem roundCylinderMode_one_inf_eq (f : ℝ) :
    sInf (roundCylinderModeEnergy 1 '' {w | RoundCylinderModeAdmissible 1 f w}) = 12 * f ^ 2 := by
  simpa only [Nat.cast_one, show (6 : ℝ) * (1 + 1) = 12 by norm_num] using
    roundCylinderMode_inf_eq 1 f

end SmoothPoincare.IntrinsicEntry
