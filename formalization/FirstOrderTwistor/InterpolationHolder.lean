import FirstOrderTwistor.BufferedInterpolation
import Mathlib.MeasureTheory.Integral.Bochner.Basic

/-!
# Hölder estimates for cutoff interpolation

The integration-by-parts identity and its pointwise differentiated-flux bound supply the
integral to estimate. The weighted derivative norms are real functions on one measure space.
-/

open MeasureTheory Filter
open scoped ENNReal

namespace FirstOrderTwistor

/-- The fourth root of the integral of the fourth power. -/
noncomputable def interpolationL4 {α : Type*} [MeasurableSpace α]
    (μ : Measure α) (f : α → ℝ) : ℝ := (∫ x, f x ^ 4 ∂μ) ^ (1 / 4 : ℝ)

/-- The square root of the integral of the square. -/
noncomputable def interpolationL2 {α : Type*} [MeasurableSpace α]
    (μ : Measure α) (f : α → ℝ) : ℝ := Real.sqrt (∫ x, f x ^ 2 ∂μ)

private theorem fourthRoot_pow {z : ℝ} (hz : 0 ≤ z) (n : ℕ) :
    (z ^ (1 / 4 : ℝ)) ^ n = z ^ ((n : ℝ) / 4) := by
  rw [← Real.rpow_mul_natCast hz]
  congr 1
  ring

private theorem memLp_pow_div {α : Type*} [MeasurableSpace α] {μ : Measure α}
    {f : α → ℝ} {p : ℝ≥0∞} (hf : MemLp f p μ) (hNonneg : 0 ≤ᵐ[μ] f) (n : ℕ) :
    MemLp (fun x => f x ^ n) (p / n) μ := by
  apply (memLp_congr_ae ?_).mp (hf.norm_rpow_div (n : ℝ≥0∞))
  filter_upwards [hNonneg] with x hx
  rw [ENNReal.toReal_natCast, Real.rpow_natCast, Real.norm_of_nonneg hx]

/-- The two Hölder estimates in SEC `msneck:interpolation`, expressed as bounds on
ordinary real integrals. `f` is the cutoff-weighted gradient norm, `g` the norm of
the cutoff derivative, and `h` the square-cutoff-weighted Hessian norm. -/
theorem bufferedInterpolation_holder {α : Type*} [MeasurableSpace α] {μ : Measure α}
    {f g h : α → ℝ} (hf : MemLp f 4 μ) (hg : MemLp g 4 μ) (hh : MemLp h 2 μ)
    (hfNonneg : 0 ≤ᵐ[μ] f) (hgNonneg : 0 ≤ᵐ[μ] g) (hhNonneg : 0 ≤ᵐ[μ] h) :
    Integrable (fun x => g x * f x ^ 3) μ ∧ Integrable (fun x => f x ^ 2 * h x) μ ∧
      (∫ x, g x * f x ^ 3 ∂μ) ≤ interpolationL4 μ g * interpolationL4 μ f ^ 3 ∧
      (∫ x, f x ^ 2 * h x ∂μ) ≤ interpolationL4 μ f ^ 2 * interpolationL2 μ h := by
  have hFourThird : (4 : ℝ).HolderConjugate (4 / 3) := by
    rw [Real.holderConjugate_iff]
    norm_num
  have hTwoTwo : (2 : ℝ).HolderConjugate 2 := by
    rw [Real.holderConjugate_iff]
    norm_num
  have hFour : MemLp g (ENNReal.ofReal (4 : ℝ)) μ := by simpa using hg
  have hCubed : MemLp (fun x => f x ^ 3) (ENNReal.ofReal (4 / 3 : ℝ)) μ := by
    rw [ENNReal.ofReal_div_of_pos (by norm_num : (0 : ℝ) < 3)]
    simpa using memLp_pow_div hf hfNonneg 3
  have hSquared : MemLp (fun x => f x ^ 2) (ENNReal.ofReal (2 : ℝ)) μ := by
    simpa [ENNReal.div_eq_inv_mul] using memLp_pow_div hf hfNonneg 2
  have hTwo : MemLp h (ENNReal.ofReal (2 : ℝ)) μ := by simpa using hh
  let _ := hFourThird.ennrealOfReal
  let _ := hTwoTwo.ennrealOfReal
  have hIntegralNonneg : 0 ≤ ∫ x, f x ^ 4 ∂μ := integral_nonneg fun x => by positivity
  refine ⟨memLp_one_iff_integrable.mp (hFour.fun_mul hCubed),
    memLp_one_iff_integrable.mp (hSquared.fun_mul hTwo), ?_, ?_⟩
  · have hCubedNonneg : 0 ≤ᵐ[μ] (fun x => f x ^ (3 : ℕ)) :=
      hfNonneg.mono fun x hx => pow_nonneg hx _
    have hCubicPower : (∫ x, (f x ^ (3 : ℕ)) ^ (4 / 3 : ℝ) ∂μ) = ∫ x, f x ^ 4 ∂μ := by
      refine integral_congr_ae (hfNonneg.mono fun x hx => ?_)
      change (f x ^ (3 : ℕ)) ^ (4 / 3 : ℝ) = f x ^ (4 : ℕ)
      rw [← Real.rpow_natCast_mul hx 3, show (3 : ℝ) * (4 / 3) = 4 by norm_num,
        Real.rpow_ofNat]
    have hHolder := integral_mul_le_Lp_mul_Lq_of_nonneg hFourThird hgNonneg hCubedNonneg hFour hCubed
    rw [hCubicPower] at hHolder
    unfold interpolationL4
    rw [fourthRoot_pow hIntegralNonneg]
    simpa only [Real.rpow_ofNat, Nat.cast_ofNat,
      show (1 : ℝ) / (4 / 3) = 3 / 4 by norm_num] using hHolder
  · have hSquaredNonneg : 0 ≤ᵐ[μ] (fun x => f x ^ (2 : ℕ)) :=
      Eventually.of_forall fun x => sq_nonneg (f x)
    have hSquarePower : (∫ x, (f x ^ (2 : ℕ)) ^ (2 : ℝ) ∂μ) = ∫ x, f x ^ 4 ∂μ := by
      simp only [Real.rpow_two, ← pow_mul]
    have hHolder := integral_mul_le_Lp_mul_Lq_of_nonneg hTwoTwo hSquaredNonneg hhNonneg hSquared hTwo
    rw [hSquarePower] at hHolder
    unfold interpolationL4 interpolationL2
    rw [fourthRoot_pow hIntegralNonneg, Nat.cast_ofNat, Real.sqrt_eq_rpow,
      show (2 : ℝ) / 4 = 1 / 2 by norm_num]
    simpa only [Real.rpow_two] using hHolder

/-- The integrated quartic inequality and its scalar consequences. `flux` is the
signed contraction from integration by parts. Its a.e. upper bound is supplied. -/
theorem bufferedInterpolation_of_fluxBound {α : Type*} [MeasurableSpace α] (μ : Measure α)
    (η dη du d2u flux : α → ℝ) (U c : ℝ)
    (hU : 0 ≤ U) (hNonneg : ∀ᵐ x ∂μ, 0 ≤ η x ∧ 0 ≤ dη x ∧ 0 ≤ du x ∧ 0 ≤ d2u x)
    (hGradient : MemLp (fun x => η x * du x) 4 μ) (hCutoff : MemLp dη 4 μ)
    (hHessian : MemLp (fun x => η x ^ 2 * d2u x) 2 μ) (hc : interpolationL4 μ dη ≤ c)
    (hFluxIntegrable : Integrable flux μ)
    (hIBP : (∫ x, (η x * du x) ^ 4 ∂μ) = ∫ x, flux x ∂μ)
    (hFluxBound : ∀ᵐ x ∂μ,
      flux x ≤ U * (4 * (dη x * (η x * du x) ^ 3) +
        4 * ((η x * du x) ^ 2 * (η x ^ 2 * d2u x)))) :
    let Y := interpolationL4 μ (fun x => η x * du x)
    let X := interpolationL2 μ (fun x => η x ^ 2 * d2u x)
    Y ^ 4 ≤ U * (4 * c * Y ^ 3 + 4 * Y ^ 2 * X) ∧
      Y ≤ 4 * c * U + 2 * Real.sqrt (U * X) ∧ Y ^ 2 ≤ 32 * c ^ 2 * U ^ 2 + 8 * U * X := by
  let f : α → ℝ := fun x => η x * du x
  let h : α → ℝ := fun x => η x ^ 2 * d2u x
  let Y := interpolationL4 μ f
  let X := interpolationL2 μ h
  have hGradNonneg : 0 ≤ᵐ[μ] f := hNonneg.mono fun _ hx => mul_nonneg hx.1 hx.2.2.1
  have hHessNonneg : 0 ≤ᵐ[μ] h := hNonneg.mono fun _ hx => mul_nonneg (sq_nonneg _) hx.2.2.2
  obtain ⟨hCubicInt, hQuadraticInt, hCubic, hQuadratic⟩ :=
    bufferedInterpolation_holder hGradient hCutoff hHessian hGradNonneg
      (hNonneg.mono fun _ hx => hx.2.1) hHessNonneg
  have hI : 0 ≤ ∫ x, f x ^ 4 ∂μ := integral_nonneg fun x => by positivity
  have hY : 0 ≤ Y := Real.rpow_nonneg hI _
  have hX : 0 ≤ X := Real.sqrt_nonneg _
  have hcNonneg : 0 ≤ c := (Real.rpow_nonneg (integral_nonneg fun x => by positivity) _).trans hc
  have hY4 : Y ^ 4 = ∫ x, f x ^ 4 ∂μ := by
    dsimp only [Y, interpolationL4]
    rw [fourthRoot_pow hI]
    norm_num
  have hCubic' : (∫ x, dη x * f x ^ 3 ∂μ) ≤ c * Y ^ 3 :=
    hCubic.trans (mul_le_mul_of_nonneg_right hc (pow_nonneg hY _))
  have hBoundIntegrable : Integrable (fun x => U * (4 * (dη x * f x ^ 3) +
      4 * (f x ^ 2 * h x))) μ :=
    ((hCubicInt.const_mul 4).add (hQuadraticInt.const_mul 4)).const_mul U
  have hFluxIntegral := integral_mono_ae hFluxIntegrable hBoundIntegrable hFluxBound
  rw [integral_const_mul, integral_add (hCubicInt.const_mul 4) (hQuadraticInt.const_mul 4),
    integral_const_mul, integral_const_mul] at hFluxIntegral
  have hQuartic : Y ^ 4 ≤ U * (4 * c * Y ^ 3 + 4 * Y ^ 2 * X) := by
    rw [hY4, show (∫ x, f x ^ 4 ∂μ) = ∫ x, flux x ∂μ from hIBP]
    apply hFluxIntegral.trans (mul_le_mul_of_nonneg_left _ hU)
    linarith only [hCubic', show (∫ x, f x ^ 2 * h x ∂μ) ≤ Y ^ 2 * X from hQuadratic]
  exact ⟨hQuartic, bufferedInterpolation_of_quartic hU hcNonneg hX hY hQuartic⟩

end FirstOrderTwistor
