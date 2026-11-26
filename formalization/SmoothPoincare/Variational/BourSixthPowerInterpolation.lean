import Mathlib.Analysis.Calculus.LineDeriv.IntegrationByParts
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.MeasureTheory.Measure.Haar.InnerProductSpace
import Mathlib.MeasureTheory.Function.LpSeminorm.Indicator
import Mathlib.MeasureTheory.Function.LpSeminorm.LpNorm
import Mathlib.Tactic

/-! # Compact-cutoff interpolation of a directional derivative at exponent six

26 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance.
Actual serving settings were unavailable. Edition 06, E51, Route 13.
-/

open MeasureTheory Set Topology
open scoped ENNReal

noncomputable section

namespace SmoothPoincare.Bour

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]

variable [MeasurableSpace E] [BorelSpace E] (μ : Measure E) [μ.IsAddHaarMeasure]

omit [FiniteDimensional ℝ E] in
private theorem integrable_supported_on_cutoff {η f : E → ℝ} (hη : HasCompactSupport η)
    (hsupp : tsupport f ⊆ tsupport η) (hcont : ∀ x ∈ tsupport η, ContinuousAt f x) :
    Integrable f μ := by
  have hc : Continuous f := continuous_iff_continuousAt.2 fun x => by
    by_cases hx : x ∈ tsupport η
    · exact hcont x hx
    · exact (HasFDerivAt.of_notMem_tsupport ℝ (fun hf => hx (hsupp hf))).continuousAt
  exact hc.integrable_of_hasCompactSupport (hη.of_isClosed_subset (isClosed_tsupport f) hsupp)

/-- The sixth-power directional flux uses only local (C^2) regularity
of the scalar function on the compact cutoff support. -/
theorem sixthPowerDirectional_cutoff_ibp (η u : E → ℝ) (e : E)
    (hη : ContDiff ℝ 1 η) (hcompact : HasCompactSupport η)
    (hu : ∀ x ∈ tsupport η, ContDiffAt ℝ 2 u x) :
    let v := fun x => fderiv ℝ u x e
    let w := fun x => fderiv ℝ v x e
    (∫ x, (η x * v x) ^ 6 ∂μ) =
      -∫ x, u x * (6 * fderiv ℝ η x e * (η x * v x) ^ 5 +
        5 * (η x * v x) ^ 4 * (η x ^ 2 * w x)) ∂μ := by
  intro v w
  let flux := fun x => η x ^ 6 * v x ^ 5
  have hv (x : E) (hx : x ∈ tsupport η) : ContDiffAt ℝ 1 v x :=
    ((hu x hx).fderiv_right (by norm_num)).clm_apply contDiffAt_const
  have hf (x : E) (hx : x ∈ tsupport η) : ContDiffAt ℝ 1 flux x :=
    (hη.contDiffAt.pow 6).mul ((hv x hx).pow 5)
  have hfsupp : tsupport flux ⊆ tsupport η := by
    apply closure_mono
    intro x hx
    by_contra hz
    exact (Function.mem_support.mp hx) (by simp [flux, Function.notMem_support.mp hz])
  have hdsupp : tsupport (fun x => fderiv ℝ flux x e) ⊆ tsupport η :=
    (tsupport_fderiv_apply_subset ℝ e).trans hfsupp
  have hleft : Integrable (fun x => v x * flux x) μ :=
    integrable_supported_on_cutoff μ hcompact (tsupport_mul_subset_right.trans hfsupp)
      fun x hx => (hv x hx).continuousAt.mul (hf x hx).continuousAt
  have hright : Integrable (fun x => u x * fderiv ℝ flux x e) μ :=
    integrable_supported_on_cutoff μ hcompact (tsupport_mul_subset_right.trans hdsupp)
      fun x hx => (hu x hx).continuousAt.mul (((hf x hx).continuousAt_fderiv one_ne_zero).clm_apply
        continuousAt_const)
  have hproduct : Integrable (fun x => u x * flux x) μ :=
    integrable_supported_on_cutoff μ hcompact (tsupport_mul_subset_right.trans hfsupp)
      fun x hx => (hu x hx).continuousAt.mul (hf x hx).continuousAt
  have hIbp := integral_mul_fderiv_eq_neg_fderiv_mul_of_integrable hleft hright hproduct
    (fun x hx => (hu x (hfsupp hx)).differentiableAt (by norm_num))
    (fun x _ => by
      by_cases hx : x ∈ tsupport η
      · exact (hf x hx).differentiableAt one_ne_zero
      · exact (HasFDerivAt.of_notMem_tsupport ℝ (fun hm => hx (hfsupp hm))).differentiableAt)
  have hId (x : E) : fderiv ℝ flux x e = 6 * fderiv ℝ η x e * (η x * v x) ^ 5 +
      5 * (η x * v x) ^ 4 * (η x ^ 2 * w x) := by
    by_cases hx : x ∈ tsupport η
    · have hη' := (hη.differentiable one_ne_zero x).hasFDerivAt
      have hv' := ((hv x hx).differentiableAt one_ne_zero).hasFDerivAt
      have hDeriv := ((hη'.pow 6).mul (hv'.pow 5)).fderiv
      change fderiv ℝ flux x = _ at hDeriv
      rw [hDeriv]
      simp only [add_apply, smul_apply, smul_eq_mul]
      change _ = 6 * fderiv ℝ η x e * (η x * v x) ^ 5 +
        5 * (η x * v x) ^ 4 * (η x ^ 2 * fderiv ℝ v x e)
      ring
    · have hzero : η x = 0 :=
        Function.notMem_support.mp fun hmem => hx (subset_closure hmem)
      have hfluxZero := (HasFDerivAt.of_notMem_tsupport ℝ (fun hm => hx (hfsupp hm)) :
        HasFDerivAt flux 0 x).fderiv
      simp [hfluxZero, hzero]
  have hProductEq (x : E) : v x * flux x = (η x * v x) ^ 6 := by dsimp [flux]; ring
  change (∫ x, u x * fderiv ℝ flux x e ∂μ) = -(∫ x, v x * flux x ∂μ) at hIbp
  simp_rw [hId, hProductEq] at hIbp
  linarith only [hIbp]


private theorem absorb_first_flux {a t : ℝ} (ha : 0 ≤ a) (ht : 0 ≤ t) :
    6 * a * t ^ 5 ≤ t ^ 6 / 4 + (24 * a) ^ 6 / 2 := by
  by_cases h : t ≤ 24 * a
  · have hw := mul_le_mul_of_nonneg_left (pow_le_pow_left₀ ht h 5)
      (show 0 ≤ 6 * a by positivity)
    calc
      _ ≤ 6 * a * (24 * a) ^ 5 := hw
      _ = (24 * a) ^ 6 / 4 := by ring
      _ ≤ _ := by linarith only [show 0 ≤ (24 * a) ^ 6 by positivity, pow_nonneg ht 6]
  · have hw := mul_le_mul_of_nonneg_right (le_of_not_ge h) (pow_nonneg ht 5)
    calc
      _ = (24 * a) * t ^ 5 / 4 := by ring
      _ ≤ t * t ^ 5 / 4 := by linarith only [hw]
      _ = t ^ 6 / 4 := by ring
      _ ≤ _ := le_add_of_nonneg_right (by positivity)

private theorem absorb_second_flux {U t w ε : ℝ} (hU : 0 ≤ U) (ht : 0 ≤ t) (hw : 0 ≤ w)
    (hε : 0 < ε) :
    5 * U * t ^ 4 * w ≤ t ^ 6 / 4 + (ε ^ 6 * w ^ 6 + (16 / ε * U) ^ 6) / 2 := by
  have hUw := mul_nonneg hU hw
  by_cases h : t ^ 2 ≤ 20 * (U * w)
  · have hP := mul_le_mul_of_nonneg_right (pow_le_pow_left₀ (sq_nonneg t) h 2)
      (show 0 ≤ 5 * (U*w) by positivity)
    have hProd : (ε * w) ^ 3 * (16 / ε * U) ^ 3 = 4096 * (U * w) ^ 3 := by
      field_simp
      ring
    have hYoung : 2000 * (U*w) ^ 3 ≤ (ε ^ 6 * w ^ 6 + (16 / ε * U) ^ 6) / 2 := by
      calc
        _ ≤ 4096 * (U*w) ^ 3 := by linarith only [pow_nonneg hUw 3]
        _ = (ε * w) ^ 3 * (16 / ε * U) ^ 3 := hProd.symm
        _ ≤ _ := by
          have hSq := sq_nonneg ((ε * w)^3 - (16 / ε * U)^3)
          have hA : ((ε * w)^3)^2 = ε^6 * w^6 := by ring
          have hB : ((16 / ε * U)^3)^2 = (16 / ε * U)^6 := by ring
          nlinarith only [hSq, hA, hB]
    calc
      _ = (t ^ 2) ^ 2 * (5 * (U*w)) := by ring
      _ ≤ (20 * (U*w)) ^ 2 * (5 * (U*w)) := hP
      _ = 2000 * (U*w)^3 := by ring
      _ ≤ _ := hYoung.trans (le_add_of_nonneg_left (by positivity))
  · have hP := mul_le_mul_of_nonneg_right (le_of_not_ge h) (pow_nonneg ht 4)
    calc
      _ = (20 * (U*w)) * t ^ 4 / 4 := by ring
      _ ≤ t ^ 2 * t ^ 4 / 4 := by linarith only [hP]
      _ = t ^ 6 / 4 := by ring
      _ ≤ _ := le_add_of_nonneg_right (by positivity)

/-- The weighted first derivative is interpolated directly against the
weighted second derivative, with a free positive absorption coefficient.
The only unweighted volume on the right is that of the compact cutoff support. -/
theorem sixthPowerDirectional_cutoff_bound (η u : E → ℝ) (e : E)
    (hη : ContDiff ℝ 1 η) (hcompact : HasCompactSupport η)
    (hu : ∀ x ∈ tsupport η, ContDiffAt ℝ 2 u x)
    {U C ε : ℝ} (hU : 0 ≤ U) (hC : 0 ≤ C) (hε : 0 < ε)
    (hSup : ∀ x ∈ tsupport η, |u x| ≤ U)
    (hCut : ∀ x ∈ tsupport η, |fderiv ℝ η x e| ≤ C) :
    let v := fun x => fderiv ℝ u x e
    let w := fun x => fderiv ℝ v x e
    (∫ x, (η x * v x) ^ 6 ∂μ) ≤ ε ^ 6 * (∫ x, (η x ^ 2 * w x) ^ 6 ∂μ) +
      ((24 * U * C) ^ 6 + (16 / ε * U) ^ 6) * μ.real (tsupport η) := by
  classical
  intro v w
  let K := tsupport η
  let V := fun x => η x * v x
  let W := fun x => η x ^ 2 * w x
  let X := fun x => (V x) ^ 6
  let Y := fun x => (W x) ^ 6
  let Q := fun x => -(u x * (6 * fderiv ℝ η x e * (V x) ^ 5 + 5 * (V x) ^ 4 * W x))
  let A := (24 * U * C) ^ 6
  let B := (16 / ε * U) ^ 6
  have hK : MeasurableSet K := (isClosed_tsupport η).measurableSet
  have hKfinite : μ K ≠ ⊤ := (hcompact.measure_lt_top (μ := μ)).ne
  have hη0 (x : E) (hx : x ∉ K) : η x = 0 :=
    Function.notMem_support.mp fun hmem => hx (subset_closure hmem)
  have hXzero (x : E) (hx : x ∉ K) : X x = 0 := by simp [X, V, hη0 x hx]
  have hYzero (x : E) (hx : x ∉ K) : Y x = 0 := by simp [Y, W, hη0 x hx]
  have hQzero (x : E) (hx : x ∉ K) : Q x = 0 := by simp [Q, V, hη0 x hx]
  have hSupp {f : E → ℝ} (hf : ∀ x ∉ K, f x = 0) : tsupport f ⊆ K := by
    apply closure_minimal _ (isClosed_tsupport η)
    intro x hx
    by_contra h
    exact (Function.mem_support.mp hx) (hf x h)
  have hv (x : E) (hx : x ∈ K) : ContDiffAt ℝ 1 v x :=
    ((hu x hx).fderiv_right (by norm_num)).clm_apply contDiffAt_const
  have hV (x : E) (hx : x ∈ K) : ContinuousAt V x :=
    hη.continuous.continuousAt.mul (hv x hx).continuousAt
  have hW (x : E) (hx : x ∈ K) : ContinuousAt W x :=
    (hη.continuous.continuousAt.pow 2).mul
      (((hv x hx).continuousAt_fderiv one_ne_zero).clm_apply continuousAt_const)
  have hX : Integrable X μ := integrable_supported_on_cutoff μ hcompact (hSupp hXzero)
    fun x hx => (hV x hx).pow 6
  have hY : Integrable Y μ := integrable_supported_on_cutoff μ hcompact (hSupp hYzero)
    fun x hx => (hW x hx).pow 6
  have hQ : Integrable Q μ := integrable_supported_on_cutoff μ hcompact (hSupp hQzero) fun x hx =>
    ((hu x hx).continuousAt.mul
      (((continuousAt_const.mul ((hη.contDiffAt.continuousAt_fderiv one_ne_zero).clm_apply
        continuousAt_const)).mul ((hV x hx).pow 5)).add
        ((continuousAt_const.mul ((hV x hx).pow 4)).mul (hW x hx)))).neg
  have hEq : (∫ x, X x ∂μ) = ∫ x, Q x ∂μ := by
    change (∫ x, (η x * v x) ^ 6 ∂μ) = ∫ x, -(u x * _) ∂μ
    rw [integral_neg]
    exact sixthPowerDirectional_cutoff_ibp μ η u e hη hcompact hu
  have hBound (x : E) (hx : x ∈ K) :
      Q x ≤ X x / 2 + ε ^ 6 / 2 * Y x + (A + B) / 2 := by
    have hT₁ : -(u x * (6 * fderiv ℝ η x e * (V x)^5)) ≤ 6 * (U * C) * |V x|^5 := by
      calc
        _ ≤ |-(u x * (6 * fderiv ℝ η x e * (V x)^5))| := le_abs_self _
        _ = 6 * (|u x| * |fderiv ℝ η x e|) * |V x|^5 := by
          simp only [abs_neg, abs_mul, abs_pow, abs_of_nonneg (by norm_num : (0 : ℝ) ≤ 6)]
          ring
        _ ≤ _ := by
          have hUC := mul_le_mul (hSup x hx) (hCut x hx) (abs_nonneg _) hU
          gcongr
    have hT₂ : -(u x * (5 * (V x)^4 * W x)) ≤ 5 * U * |V x|^4 * |W x| := by
      calc
        _ ≤ |-(u x * (5 * (V x)^4 * W x))| := le_abs_self _
        _ = 5 * |u x| * |V x|^4 * |W x| := by
          simp only [abs_neg, abs_mul, abs_pow, abs_of_nonneg (by norm_num : (0 : ℝ) ≤ 5)]
          ring
        _ ≤ _ := by gcongr; exact hSup x hx
    have hF₁ := hT₁.trans (absorb_first_flux (mul_nonneg hU hC) (abs_nonneg (V x)))
    have hF₂ := hT₂.trans (absorb_second_flux hU (abs_nonneg (V x)) (abs_nonneg (W x)) hε)
    rw [(show Even (6 : ℕ) by decide).pow_abs] at hF₁ hF₂
    rw [(show Even (6 : ℕ) by decide).pow_abs] at hF₂
    dsimp only [Q, X, Y, A, B]
    have hCutEq : (24 * (U * C)) ^ 6 = (24 * U * C) ^ 6 := by ring
    rw [hCutEq] at hF₁
    linarith only [hF₁, hF₂]
  have hXhalf := (hX.integrableOn (s := K)).div_const 2
  have hYhalf := (hY.integrableOn (s := K)).const_mul (ε^6 / 2)
  have hXYhalf : Integrable (fun x => X x / 2 + ε ^ 6 / 2 * Y x) (μ.restrict K) :=
    hXhalf.add hYhalf
  have hConst : IntegrableOn (fun _ : E => (A + B) / 2) K μ :=
    integrableOn_const hKfinite
  have hInt := setIntegral_mono_on hQ.integrableOn ((hXhalf.add hYhalf).add hConst) hK hBound
  change (∫ x in K, Q x ∂μ) ≤
    ∫ x in K, X x / 2 + ε^6 / 2 * Y x + (A + B) / 2 ∂μ at hInt
  rw [setIntegral_eq_integral_of_forall_compl_eq_zero hQzero, ← hEq,
    integral_add hXYhalf hConst, integral_add hXhalf hYhalf,
    integral_div, integral_const_mul, setIntegral_const, smul_eq_mul,
    setIntegral_eq_integral_of_forall_compl_eq_zero hXzero,
    setIntegral_eq_integral_of_forall_compl_eq_zero hYzero] at hInt
  change (∫ x, X x ∂μ) ≤ ε^6 * (∫ x, Y x ∂μ) + (A + B) * μ.real K
  linarith only [hInt]


omit [FiniteDimensional ℝ E] [MeasurableSpace E] [BorelSpace E] in
private theorem continuous_compact_cutoff_product (η f : E → ℝ) {k : ℕ} (hk : k ≠ 0)
    (hη : Continuous η) (hcompact : HasCompactSupport η)
    (hf : ∀ x ∈ tsupport η, ContinuousAt f x) :
    Continuous (fun x => η x ^ k * f x) ∧ HasCompactSupport (fun x => η x ^ k * f x) := by
  have hsupp : tsupport (fun x => η x ^ k * f x) ⊆ tsupport η := by
    apply closure_mono
    intro x hx
    by_contra hz
    exact (Function.mem_support.mp hx) (by simp [Function.notMem_support.mp hz, zero_pow hk])
  refine ⟨continuous_iff_continuousAt.mpr ?_, hcompact.of_isClosed_subset (isClosed_tsupport _) hsupp⟩
  intro x
  by_cases hx : x ∈ tsupport η
  · exact (hη.continuousAt.pow k).mul (hf x hx)
  · exact (HasFDerivAt.of_notMem_tsupport ℝ (fun h => hx (hsupp h))).continuousAt

omit [FiniteDimensional ℝ E] [InnerProductSpace ℝ E] in
private theorem eLpNorm_six_eq_integral_pow (f : E → ℝ)
    (hf : Continuous f) (hcompact : HasCompactSupport f) :
    eLpNorm f (6 : ℝ≥0∞) μ = ENNReal.ofReal ((∫ x, f x ^ 6 ∂μ) ^ (1 / 6 : ℝ)) := by
  have hMem : MemLp f (6 : ℝ≥0∞) μ := hf.memLp_of_hasCompactSupport hcompact
  have h := hMem.eLpNorm_eq_integral_rpow_norm (by norm_num) (by norm_num)
  have hNorm (x : E) : ‖f x‖ ^ (6 : ℝ) = f x ^ (6 : ℕ) := by
    calc
      _ = ‖f x‖ ^ (6 : ℕ) := Real.rpow_natCast _ _
      _ = _ := Real.norm_eq_abs _ ▸ (show Even (6 : ℕ) by decide).pow_abs _
  norm_num only [ENNReal.toReal_ofNat] at h
  simp_rw [hNorm] at h
  simpa only [one_div] using h

/-- Linear (L^6) interpolation for one directional derivative, preserving the
square of the cutoff on the second derivative for subsequent absorption. -/
theorem sixthPowerDirectional_cutoff_eLpNorm (η u : E → ℝ) (e : E)
    (hη : ContDiff ℝ 1 η) (hcompact : HasCompactSupport η)
    (hu : ∀ x ∈ tsupport η, ContDiffAt ℝ 2 u x)
    {U C ε : ℝ} (hU : 0 ≤ U) (hC : 0 ≤ C) (hε : 0 < ε)
    (hSup : ∀ x ∈ tsupport η, |u x| ≤ U)
    (hCut : ∀ x ∈ tsupport η, |fderiv ℝ η x e| ≤ C) :
    let v := fun x => fderiv ℝ u x e
    let w := fun x => fderiv ℝ v x e
    eLpNorm (fun x => η x * v x) (6 : ℝ≥0∞) μ ≤
      ENNReal.ofReal ε * eLpNorm (fun x => η x ^ 2 * w x) (6 : ℝ≥0∞) μ +
      ENNReal.ofReal ((24 * U * C + 16 / ε * U) * (μ.real (tsupport η)) ^ (1 / 6 : ℝ)) := by
  intro v w
  let V := fun x => η x * v x
  let W := fun x => η x ^ 2 * w x
  have hv (x : E) (hx : x ∈ tsupport η) : ContDiffAt ℝ 1 v x :=
    ((hu x hx).fderiv_right (by norm_num)).clm_apply contDiffAt_const
  have hV : Continuous V ∧ HasCompactSupport V := by
    simpa only [V, pow_one] using continuous_compact_cutoff_product η v (k := 1) (by decide)
      hη.continuous hcompact (fun x hx => (hv x hx).continuousAt)
  have hW : Continuous W ∧ HasCompactSupport W :=
    continuous_compact_cutoff_product η w (k := 2) (by decide) hη.continuous hcompact
      (fun x hx => ((hv x hx).continuousAt_fderiv one_ne_zero).clm_apply continuousAt_const)
  change eLpNorm V (6 : ℝ≥0∞) μ ≤ _
  rw [eLpNorm_six_eq_integral_pow μ V hV.1 hV.2]
  change ENNReal.ofReal ((∫ x, V x ^ 6 ∂μ) ^ (1/6 : ℝ)) ≤
    ENNReal.ofReal ε * eLpNorm W (6 : ℝ≥0∞) μ + _
  rw [eLpNorm_six_eq_integral_pow μ W hW.1 hW.2]
  let t := ∫ x, V x ^ 6 ∂μ
  let z := ∫ x, W x ^ 6 ∂μ
  let m := μ.real (tsupport η)
  let z₆ := z ^ (1/6 : ℝ)
  let m₆ := m ^ (1/6 : ℝ)
  have ht : 0 ≤ t := integral_nonneg (fun x => (show Even (6 : ℕ) by decide).pow_nonneg _)
  have hz : 0 ≤ z := integral_nonneg (fun x => (show Even (6 : ℕ) by decide).pow_nonneg _)
  have hm : 0 ≤ m := ENNReal.toReal_nonneg
  have hroot (x : ℝ) (hx : 0 ≤ x) : (x ^ (1/6 : ℝ))^6 = x := by
    rw [← Real.rpow_mul_natCast hx]
    norm_num
  let a := ε * z₆
  let b := 24 * U * C * m₆
  let c := 16 / ε * U * m₆
  have ha : 0 ≤ a := by dsimp [a, z₆]; positivity
  have hb : 0 ≤ b := by dsimp [b, m₆]; positivity
  have hc : 0 ≤ c := by dsimp [c, m₆]; positivity
  have hPow : t ≤ ε^6 * z + ((24 * U * C)^6 + (16 / ε * U)^6) * m :=
    sixthPowerDirectional_cutoff_bound μ η u e hη hcompact hu hU hC hε hSup hCut
  have hSum : t ≤ (a + b + c)^6 := by
    calc
      _ ≤ ε^6 * z + ((24 * U * C)^6 + (16 / ε * U)^6) * m := hPow
      _ = a^6 + b^6 + c^6 := by
        unfold a b c
        rw [mul_pow ε z₆, mul_pow (24 * U * C) m₆, mul_pow (16 / ε * U) m₆,
          show z₆^6 = z from hroot z hz,
          show m₆^6 = m from hroot m hm]
        ring
      _ ≤ (a + b)^6 + c^6 := add_le_add_left (pow_add_pow_le (n := 6) ha hb (by decide)) _
      _ ≤ _ := pow_add_pow_le (n := 6) (add_nonneg ha hb) hc (by decide)
  have hReal : t ^ (1/6 : ℝ) ≤ a + b + c := by
    apply (pow_le_pow_iff_left₀ (Real.rpow_nonneg ht _) (add_nonneg (add_nonneg ha hb) hc)
      (by decide : (6 : ℕ) ≠ 0)).mp
    rw [hroot t ht]
    exact hSum
  change ENNReal.ofReal (t ^ (1/6 : ℝ)) ≤ ENNReal.ofReal ε * ENNReal.ofReal z₆ +
    ENNReal.ofReal ((24 * U * C + 16 / ε * U) * m₆)
  rw [← ENNReal.ofReal_mul hε.le, ← ENNReal.ofReal_add ha (by positivity)]
  apply ENNReal.ofReal_le_ofReal
  calc
    _ ≤ a + b + c := hReal
    _ = _ := by dsimp [a, b, c]; ring


/-- The same weighted interpolation in finite real (L^6) norms,
for use in the squared-cutoff absorption. -/
theorem sixthPowerDirectional_cutoff_lpNorm (η u : E → ℝ) (e : E)
    (hη : ContDiff ℝ 1 η) (hcompact : HasCompactSupport η)
    (hu : ∀ x ∈ tsupport η, ContDiffAt ℝ 2 u x)
    {U C ε : ℝ} (hU : 0 ≤ U) (hC : 0 ≤ C) (hε : 0 < ε)
    (hSup : ∀ x ∈ tsupport η, |u x| ≤ U)
    (hCut : ∀ x ∈ tsupport η, |fderiv ℝ η x e| ≤ C) :
    let v := fun x => fderiv ℝ u x e
    let w := fun x => fderiv ℝ v x e
    lpNorm (fun x => η x * v x) (6 : ℝ≥0∞) μ ≤
      ε * lpNorm (fun x => η x ^ 2 * w x) (6 : ℝ≥0∞) μ +
      (24 * U * C + 16 / ε * U) * (μ.real (tsupport η)) ^ (1 / 6 : ℝ) := by
  intro v w
  let V := fun x => η x * v x
  let W := fun x => η x ^ 2 * w x
  let K := (24 * U * C + 16 / ε * U) * (μ.real (tsupport η)) ^ (1 / 6 : ℝ)
  have hv (x : E) (hx : x ∈ tsupport η) : ContDiffAt ℝ 1 v x :=
    ((hu x hx).fderiv_right (by norm_num)).clm_apply contDiffAt_const
  have hW : Continuous W ∧ HasCompactSupport W :=
    continuous_compact_cutoff_product η w (k := 2) (by decide) hη.continuous hcompact
      (fun x hx => ((hv x hx).continuousAt_fderiv one_ne_zero).clm_apply continuousAt_const)
  have hLp : MemLp W (6 : ℝ≥0∞) μ := hW.1.memLp_of_hasCompactSupport hW.2
  have hFin : ENNReal.ofReal ε * eLpNorm W (6 : ℝ≥0∞) μ ≠ ⊤ :=
    ENNReal.mul_ne_top ENNReal.ofReal_ne_top hLp.eLpNorm_ne_top
  have hBound : eLpNorm V (6 : ℝ≥0∞) μ ≤
      ENNReal.ofReal ε * eLpNorm W (6 : ℝ≥0∞) μ + ENNReal.ofReal K :=
    sixthPowerDirectional_cutoff_eLpNorm μ η u e hη hcompact hu hU hC hε hSup hCut
  have hReal := ENNReal.toReal_mono (ENNReal.add_ne_top.mpr ⟨hFin, ENNReal.ofReal_ne_top⟩) hBound
  have hK : 0 ≤ K := by dsimp [K]; positivity
  rw [ENNReal.toReal_add hFin ENNReal.ofReal_ne_top, ENNReal.toReal_mul,
    ENNReal.toReal_ofReal hε.le, ENNReal.toReal_ofReal hK, toReal_eLpNorm, toReal_eLpNorm] at hReal
  exact hReal

omit [MeasurableSpace E] [BorelSpace E] [FiniteDimensional ℝ E] in
/-- The second directional derivative is a diagonal evaluation of the
actual Fréchet Hessian. Direction length is retained in the norm comparison. -/
theorem sixthPowerDirectional_second_abs_le (u : E → ℝ) (x e : E)
    (hu : ContDiffAt ℝ 2 u x) :
    |fderiv ℝ (fun y => fderiv ℝ u y e) x e| ≤ ‖iteratedFDeriv ℝ 2 u x‖ * ‖e‖ ^ 2 := by
  have hD : DifferentiableAt ℝ (fderiv ℝ u) x :=
    ((hu.fderiv_right (by norm_num : (1 : WithTop ℕ∞) + 1 ≤ 2))).differentiableAt one_ne_zero
  have hValue : fderiv ℝ (fun y => fderiv ℝ u y e) x e =
      iteratedFDeriv ℝ 2 u x (fun _ => e) := by
    rw [fderiv_clm_apply hD (differentiableAt_const e), iteratedFDeriv_two_apply]
    simp
  rw [hValue, ← Real.norm_eq_abs]
  have hNorm := (iteratedFDeriv ℝ 2 u x).le_opNorm (fun _ => e)
  simpa only [Finset.prod_const, Finset.card_univ, Fintype.card_fin] using hNorm

/-- A cutoff equal to one on the inner ball gives the unweighted norm
on that ball. The Hessian on the right keeps the square weight. -/
theorem sixthPowerDirectional_eLpNorm_on_ball (η u : E → ℝ) (e z : E) {r R : ℝ}
    (hη : ContDiff ℝ 1 η) (hcompact : HasCompactSupport η)
    (hOne : ∀ x ∈ Metric.ball z r, η x = 1) (hSupport : tsupport η ⊆ Metric.closedBall z R)
    (hu : ∀ x ∈ tsupport η, ContDiffAt ℝ 2 u x)
    {U C ε : ℝ} (hU : 0 ≤ U) (hC : 0 ≤ C) (hε : 0 < ε)
    (hSup : ∀ x ∈ tsupport η, |u x| ≤ U)
    (hCut : ∀ x ∈ tsupport η, |fderiv ℝ η x e| ≤ C) :
    let v := fun x => fderiv ℝ u x e
    let w := fun x => fderiv ℝ v x e
    eLpNorm v (6 : ℝ≥0∞) (μ.restrict (Metric.ball z r)) ≤
      ENNReal.ofReal ε * eLpNorm (fun x => η x ^ 2 * w x) (6 : ℝ≥0∞) μ +
      ENNReal.ofReal ((24 * U * C + 16 / ε * U) * (μ.real (Metric.closedBall z R)) ^ (1 / 6 : ℝ)) := by
  intro v w
  have hSame : v =ᵐ[μ.restrict (Metric.ball z r)] fun x => η x * v x := by
    filter_upwards [ae_restrict_mem Metric.isOpen_ball.measurableSet] with x hx
    rw [hOne x hx, one_mul]
  have hVol : μ.real (tsupport η) ≤ μ.real (Metric.closedBall z R) :=
    ENNReal.toReal_mono (isCompact_closedBall z R).measure_lt_top.ne (measure_mono hSupport)
  rw [eLpNorm_congr_ae hSame]
  apply (eLpNorm_restrict_le _ _ _ _).trans
  apply (sixthPowerDirectional_cutoff_eLpNorm μ η u e hη hcompact hu hU hC hε hSup hCut).trans
  apply add_le_add_right
  apply ENNReal.ofReal_le_ofReal
  exact mul_le_mul_of_nonneg_left (Real.rpow_le_rpow ENNReal.toReal_nonneg hVol (by norm_num)) (by positivity)

end SmoothPoincare.Bour
