import Mathlib.MeasureTheory.Function.LpSeminorm.LpNorm

/-!
# Integration of supplied cap splice bounds

The smooth estimate starts from a pointwise metric-jet bound on a splice
of bounded volume. The first-order estimate starts from the projected,
density-weighted comparison in one common coefficient space. The metric
estimates and energy identifications are supplied by the geometric setup.
-/

open Filter MeasureTheory Set
open scoped ENNReal

namespace FirstOrderTwistor

variable {α E : Type*} [MeasurableSpace α] [NormedAddCommGroup E] {μ : Measure α}

private theorem spliceIntegral_le_volume_mul [IsFiniteMeasure μ] {f : α → ℝ}
    {bound volume : ℝ} (hf : AEStronglyMeasurable f μ) (hBound : 0 ≤ bound)
    (hPoint : ∀ᵐ x ∂μ, 0 ≤ f x ∧ f x ≤ bound) (hVolume : μ.real univ ≤ volume) :
    (∫ x, f x ∂μ) ≤ volume * bound := by
  have hConst : Integrable (fun _ : α => bound) μ := integrable_const _
  have hInt : Integrable f μ := hConst.mono' hf (hPoint.mono fun x hx => by
    simpa only [Real.norm_of_nonneg hx.1] using hx.2)
  calc
    (∫ x, f x ∂μ) ≤ ∫ _ : α, bound ∂μ := integral_mono_ae hInt hConst (hPoint.mono fun _ hx => hx.2)
    _ = μ.real univ * bound := integral_const bound
    _ ≤ volume * bound := mul_le_mul_of_nonneg_right hVolume hBound

/-- Integrate the squared Weyl norm on a bounded-volume splice. `W` is
measured in the supplied norm, e.g. the chiral Hilbert–Schmidt norm. -/
theorem smoothCapSpliceWeylBound [IsFiniteMeasure μ] {W : α → E} {C η volume : ℝ}
    (hW : AEStronglyMeasurable W μ) (hC : 0 ≤ C) (hEta : 0 ≤ η)
    (hPoint : ∀ᵐ x ∂μ, ‖W x‖ ≤ C * η) (hVolume : μ.real univ ≤ volume) :
    (∫ x, ‖W x‖ ^ 2 ∂μ) ≤ (volume * C ^ 2) * η ^ 2 := by
  calc
    (∫ x, ‖W x‖ ^ 2 ∂μ) ≤ volume * (C * η) ^ 2 :=
      spliceIntegral_le_volume_mul (hW.norm.pow 2) (sq_nonneg _)
        (hPoint.mono fun x hx => ⟨sq_nonneg _, (sq_le_sq₀ (norm_nonneg _) (mul_nonneg hC hEta)).2 hx⟩)
        hVolume
    _ = (volume * C ^ 2) * η ^ 2 := by ring

/-- Integrate the Bach norm from its separate pointwise bound on the
splice, with `η₄` the fourth-order error in NECK-E01. -/
theorem smoothCapSpliceBachBound [IsFiniteMeasure μ] {B : α → E} {C η₄ volume : ℝ}
    (hB : AEStronglyMeasurable B μ) (hC : 0 ≤ C) (hEta : 0 ≤ η₄)
    (hPoint : ∀ᵐ x ∂μ, ‖B x‖ ≤ C * η₄) (hVolume : μ.real univ ≤ volume) :
    (∫ x, ‖B x‖ ∂μ) ≤ (volume * C) * η₄ := by
  rw [mul_assoc]
  exact spliceIntegral_le_volume_mul hB.norm (mul_nonneg hC hEta)
    (hPoint.mono fun x hx => ⟨norm_nonneg (B x), hx⟩) hVolume

private theorem lpNorm_two_eq_sqrt_integral_norm_sq {f : α → E} (hf : AEStronglyMeasurable f μ) :
    lpNorm f 2 μ = Real.sqrt (∫ x, ‖f x‖ ^ 2 ∂μ) := by
  rw [lpNorm_eq_integral_norm_rpow_toReal (by norm_num) (by simp) hf, Real.sqrt_eq_rpow]
  norm_num [Real.rpow_two, one_div]

/-- Integrate the pointwise projected error against curvature and cutoff
envelopes on the same cover measure. `coverCurvature` can be supplied as
`√N * K` after uniform metric comparison, and `coverCutoff` as
`d ^ 2 + d + a` after absorbing fixed annulus constants. -/
theorem capSpliceProjectionErrorBound {error : α → E} {curvature cutoff : α → ℝ}
    {a C coverCurvature coverCutoff : ℝ} (ha : 0 ≤ a) (hC : 0 ≤ C)
    (hError : AEStronglyMeasurable error μ) (hCurvature : MemLp curvature 2 μ)
    (hCutoff : MemLp cutoff 2 μ) (hCurvatureNorm : lpNorm curvature 2 μ ≤ coverCurvature)
    (hCutoffNorm : lpNorm cutoff 2 μ ≤ coverCutoff)
    (hPoint : ∀ᵐ x ∂μ, ‖error x‖ ≤ C * (a * curvature x + cutoff x)) :
    lpNorm error 2 μ ≤ C * (a * coverCurvature + coverCutoff) := by
  have hWeighted := hCurvature.const_smul a
  have hEnvelope := (hWeighted.add hCutoff).const_smul C
  have hNorm : lpNorm error 2 μ ≤ lpNorm (C • (a • curvature + cutoff)) 2 μ := by
    apply ENNReal.toReal_mono hEnvelope.eLpNorm_ne_top (eLpNorm_mono_ae hError ?_)
    filter_upwards [hPoint] with x hx
    change ‖error x‖ ≤ ‖C * (a * curvature x + cutoff x)‖
    exact hx.trans (le_abs_self _)
  calc
    lpNorm error 2 μ ≤ lpNorm (C • (a • curvature + cutoff)) 2 μ := hNorm
    _ = C * lpNorm (a • curvature + cutoff) 2 μ := by
      rw [lpNorm_const_smul, Real.nnnorm_of_nonneg hC]
      rfl
    _ ≤ C * (lpNorm (a • curvature) 2 μ + lpNorm cutoff 2 μ) :=
      mul_le_mul_of_nonneg_left (lpNorm_add_le hWeighted (by norm_num)) hC
    _ = C * (a * lpNorm curvature 2 μ + lpNorm cutoff 2 μ) := by
      rw [lpNorm_const_smul, Real.nnnorm_of_nonneg ha]
      rfl
    _ ≤ C * (a * coverCurvature + coverCutoff) := mul_le_mul_of_nonneg_left
      (add_le_add (mul_le_mul_of_nonneg_left hCurvatureNorm ha) hCutoffNorm) hC

/-- The weighted `L²` triangle inequality. The multiplier is the splice
cutoff, and both coefficient fields use the same measure and norm. -/
theorem capSpliceNormTriangle [NormedSpace ℝ E] {incoming spliced : α → E} {θ : α → ℝ}
    (hIncoming : MemLp incoming 2 μ) (hθ : AEStronglyMeasurable θ μ)
    (hCutoff : ∀ᵐ x ∂μ, |θ x| ≤ 1) :
    lpNorm spliced 2 μ ≤ lpNorm incoming 2 μ +
      lpNorm (fun x => spliced x - θ x • incoming x) 2 μ := by
  have hWeightedMeas : AEStronglyMeasurable (θ • incoming) μ :=
    hθ.smul hIncoming.aestronglyMeasurable
  have hBound : ∀ᵐ x ∂μ, ‖(θ • incoming) x‖ ≤ ‖incoming x‖ := by
    filter_upwards [hCutoff] with x hx
    change ‖θ x • incoming x‖ ≤ ‖incoming x‖
    rw [norm_smul, Real.norm_eq_abs]
    simpa only [one_mul] using
      mul_le_mul_of_nonneg_right hx (norm_nonneg (incoming x))
  have hWeighted : MemLp (θ • incoming) 2 μ := hIncoming.of_le hWeightedMeas hBound
  have hNorm : lpNorm (θ • incoming) 2 μ ≤ lpNorm incoming 2 μ :=
    ENNReal.toReal_mono hIncoming.eLpNorm_ne_top (eLpNorm_mono_ae hWeightedMeas hBound)
  exact (lpNorm_le_lpNorm_add_lpNorm_sub' hWeighted (by norm_num)).trans
    (add_le_add hNorm le_rfl)

/-- Normalize the cover comparison by `scale = √N`, square the splice
norm bound and subtract the discarded incoming energy. `a` and `d` are
the cover-normalized metric controls and `K` is the physical curvature
norm downstairs. `retained` is the unchanged-region energy. -/
theorem firstOrderCapSpliceWeylBound [NormedSpace ℝ E] {incoming spliced : α → E} {θ : α → ℝ}
    {a d K C scale retained : ℝ} (hScale : 0 < scale)
    (hIncoming : MemLp incoming 2 μ) (hSpliced : MemLp spliced 2 μ)
    (hθ : AEStronglyMeasurable θ μ) (hCutoff : ∀ᵐ x ∂μ, |θ x| ≤ 1)
    (hProjectionError : lpNorm (fun x => spliced x - θ x • incoming x) 2 μ ≤
      C * (a * (scale * K) + (d ^ 2 + d + a))) :
    let q := (∫ x, ‖incoming x‖ ^ 2 ∂μ) / scale ^ 2
    let A := (∫ x, ‖spliced x‖ ^ 2 ∂μ) / scale ^ 2
    let Δ := C * (a * K + (d ^ 2 + d + a) / scale)
    Real.sqrt A ≤ Real.sqrt q + Δ ∧ A ≤ (Real.sqrt q + Δ) ^ 2 ∧
      retained + A ≤ (retained + q) + 2 * Real.sqrt q * Δ + Δ ^ 2 := by
  let q := (∫ x, ‖incoming x‖ ^ 2 ∂μ) / scale ^ 2
  let A := (∫ x, ‖spliced x‖ ^ 2 ∂μ) / scale ^ 2
  let Δ := C * (a * K + (d ^ 2 + d + a) / scale)
  change Real.sqrt A ≤ Real.sqrt q + Δ ∧ A ≤ (Real.sqrt q + Δ) ^ 2 ∧
    retained + A ≤ (retained + q) + 2 * Real.sqrt q * Δ + Δ ^ 2
  have hSqrtFormula {f : α → E} (hf : MemLp f 2 μ) :
      Real.sqrt ((∫ x, ‖f x‖ ^ 2 ∂μ) / scale ^ 2) = lpNorm f 2 μ / scale := by
    rw [Real.sqrt_div (integral_nonneg fun _ => sq_nonneg _) _, Real.sqrt_sq hScale.le,
      lpNorm_two_eq_sqrt_integral_norm_sq hf.aestronglyMeasurable]
  have hScaled : lpNorm (fun x => spliced x - θ x • incoming x) 2 μ / scale ≤ Δ := by
    calc
      _ ≤ C * (a * (scale * K) + (d ^ 2 + d + a)) / scale :=
        div_le_div_of_nonneg_right hProjectionError hScale.le
      _ = Δ := by
        dsimp [Δ]
        field_simp
  have hSqrtBound : Real.sqrt A ≤ Real.sqrt q + Δ := by
    rw [show Real.sqrt A = _ from hSqrtFormula hSpliced, show Real.sqrt q = _ from hSqrtFormula hIncoming]
    calc
      _ ≤ (lpNorm incoming 2 μ + lpNorm (fun x => spliced x - θ x • incoming x) 2 μ) / scale :=
        div_le_div_of_nonneg_right (capSpliceNormTriangle hIncoming hθ hCutoff) hScale.le
      _ ≤ lpNorm incoming 2 μ / scale + Δ := by
        rw [add_div]
        exact add_le_add le_rfl hScaled
  have hQ : 0 ≤ q := by
    dsimp [q]
    positivity
  have hA : 0 ≤ A := by
    dsimp [A]
    positivity
  have hAbsolute : A ≤ (Real.sqrt q + Δ) ^ 2 := by
    rw [← Real.sq_sqrt hA]
    exact (sq_le_sq₀ (Real.sqrt_nonneg A) ((Real.sqrt_nonneg A).trans hSqrtBound)).2 hSqrtBound
  refine ⟨hSqrtBound, hAbsolute, ?_⟩
  rw [add_sq, Real.sq_sqrt hQ] at hAbsolute
  linarith only [hAbsolute]

end FirstOrderTwistor
