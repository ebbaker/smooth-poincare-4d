import Mathlib.MeasureTheory.Integral.Bochner.Basic

/-!
# Integral estimate for a supplied transverse field

This proves the measure-theoretic step from SEC `msneck:integrated` to
`msneck:neck` on one measure, such as the volume restricted to the protected
region. The flux identity and tensor contraction bounds are supplied.
-/

open MeasureTheory Filter

namespace FirstOrderTwistor

private theorem integral_mul_le_sqrt_integral_sq {α : Type*} [MeasurableSpace α]
    {μ : Measure α} {f g : α → ℝ} (hf : MemLp f 2 μ) (hg : MemLp g 2 μ)
    (hfNonneg : 0 ≤ᵐ[μ] f) (hgNonneg : 0 ≤ᵐ[μ] g) :
    (∫ x, f x * g x ∂μ) ≤ Real.sqrt (∫ x, f x ^ 2 ∂μ) * Real.sqrt (∫ x, g x ^ 2 ∂μ) := by
  have hConjugate : (2 : ℝ).HolderConjugate 2 := by
    rw [Real.holderConjugate_iff]
    norm_num
  have hf' : MemLp f (ENNReal.ofReal (2 : ℝ)) μ := by simpa only [ENNReal.ofReal_ofNat] using hf
  have hg' : MemLp g (ENNReal.ofReal (2 : ℝ)) μ := by simpa only [ENNReal.ofReal_ofNat] using hg
  simpa only [Real.rpow_two, ← Real.sqrt_eq_rpow] using
    integral_mul_le_Lp_mul_Lq_of_nonneg hConjugate hfNonneg hgNonneg hf' hg'

/-- The integral of `weight * weylNorm ^ 2` is bounded by the restricted Bach
mass and the `L²` Weyl and defect norms. The Hessian and differentiated defect
have weights built into `hessianDefect` and `derivativeDefect`, respectively. -/
theorem weightedEnergy_le_of_intrinsicFlux {α : Type*} [MeasurableSpace α] (μ : Measure α)
    (weight bachContraction weylContraction bachNorm weylNorm hessianDefect derivativeDefect : α → ℝ)
    (Λ : ℝ) (_hEnergy : Integrable (fun x ↦ weight x * weylNorm x ^ 2) μ)
    (hBachNorm : Integrable bachNorm μ) (hWeylNorm : MemLp weylNorm 2 μ)
    (hHessian : MemLp hessianDefect 2 μ) (hDerivative : MemLp derivativeDefect 2 μ)
    (hWeylNonneg : 0 ≤ᵐ[μ] weylNorm) (hHessianNonneg : 0 ≤ᵐ[μ] hessianDefect)
    (hDerivativeNonneg : 0 ≤ᵐ[μ] derivativeDefect)
    (hBachMeas : AEStronglyMeasurable bachContraction μ)
    (hWeylMeas : AEStronglyMeasurable weylContraction μ)
    (hBachBound : ∀ᵐ x ∂μ, |bachContraction x| ≤ Λ * bachNorm x)
    (hWeylBound : ∀ᵐ x ∂μ,
      |weylContraction x| ≤ weylNorm x * (hessianDefect x + 2 * derivativeDefect x))
    (hFlux : (∫ x, weight x * weylNorm x ^ 2 ∂μ) =
      -8 * (∫ x, bachContraction x ∂μ) + 4 * (∫ x, weylContraction x ∂μ)) :
    (∫ x, weight x * weylNorm x ^ 2 ∂μ) ≤
      8 * Λ * (∫ x, bachNorm x ∂μ) + 4 * Real.sqrt (∫ x, weylNorm x ^ 2 ∂μ) *
        (Real.sqrt (∫ x, hessianDefect x ^ 2 ∂μ) +
          2 * Real.sqrt (∫ x, derivativeDefect x ^ 2 ∂μ)) := by
  have hBachMajorant := hBachNorm.const_mul Λ
  have hBachIntegrable : Integrable bachContraction μ :=
    hBachMajorant.mono' hBachMeas (by simpa only [Real.norm_eq_abs] using hBachBound)
  have hBachIntegral : (∫ x, -bachContraction x ∂μ) ≤ ∫ x, Λ * bachNorm x ∂μ :=
    integral_mono_ae hBachIntegrable.neg hBachMajorant <|
      hBachBound.mono fun x hx ↦ (neg_le_abs _).trans hx
  rw [integral_neg, integral_const_mul] at hBachIntegral
  have hWeylHessian : Integrable (fun x ↦ weylNorm x * hessianDefect x) μ :=
    memLp_one_iff_integrable.mp (hWeylNorm.fun_mul hHessian)
  have hWeylDerivative : Integrable (fun x ↦ weylNorm x * derivativeDefect x) μ :=
    memLp_one_iff_integrable.mp (hWeylNorm.fun_mul hDerivative)
  have hWeylSplit : ∀ᵐ x ∂μ, |weylContraction x| ≤
      weylNorm x * hessianDefect x + 2 * (weylNorm x * derivativeDefect x) := by
    filter_upwards [hWeylBound] with x hx
    simpa only [mul_add, mul_left_comm (weylNorm x) (2 : ℝ)] using hx
  have hWeylMajorant := hWeylHessian.add (hWeylDerivative.const_mul 2)
  have hWeylIntegrable : Integrable weylContraction μ :=
    hWeylMajorant.mono' hWeylMeas (by simpa only [Real.norm_eq_abs] using hWeylSplit)
  have hWeylIntegral : (∫ x, weylContraction x ∂μ) ≤
      ∫ x, weylNorm x * hessianDefect x + 2 * (weylNorm x * derivativeDefect x) ∂μ :=
    integral_mono_ae hWeylIntegrable hWeylMajorant <|
      hWeylSplit.mono fun x hx ↦ (le_abs_self _).trans hx
  rw [integral_add hWeylHessian (hWeylDerivative.const_mul 2), integral_const_mul] at hWeylIntegral
  have hCauchyHessian :=
    integral_mul_le_sqrt_integral_sq hWeylNorm hHessian hWeylNonneg hHessianNonneg
  have hCauchyDerivative :=
    integral_mul_le_sqrt_integral_sq hWeylNorm hDerivative hWeylNonneg hDerivativeNonneg
  rw [hFlux]
  linarith only [hBachIntegral, hWeylIntegral, hCauchyHessian, hCauchyDerivative]

end FirstOrderTwistor
