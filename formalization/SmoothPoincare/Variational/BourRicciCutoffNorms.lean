import SmoothPoincare.Variational.BourCoupledInterior
import SmoothPoincare.Variational.BourLpAssembly

/-!
# Real norms for the squared cutoff of the local Ricci system

26 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance.
The principal system is supplied on one compact support in one chart.
-/

set_option autoImplicit false

open DifferentialGeometry.Tensor.Coordinates MeasureTheory Filter Set
open scoped BigOperators ContDiff ENNReal NNReal Topology

namespace SmoothPoincare

open Bour

noncomputable section

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    [FiniteDimensional ℝ E]
variable {κ : Type*} [Fintype κ]

local notation "J" => Fin (Module.finrank ℝ E)
local notation "H₂" => iteratedFDeriv ℝ 2

/-- Scalar rows of the first derivative of the system with one factor of
the same cutoff as used for the Hessian. -/
def bourCutoffSystemGradient (η : E → ℝ) (u : κ → E → ℝ) (i : κ × J) (x : E) : ℝ :=
  η x * fderiv ℝ (u i.1) x (chartModelBasis E i.2)

/-- Scalar rows of the diagonal Hessian of the system with the squared cutoff. -/
def bourCutoffSystemDiagonal (η : E → ℝ) (u : κ → E → ℝ) (i : κ × J) (x : E) : ℝ :=
  η x ^ 2 * H₂ (u i.1) x ![chartModelBasis E i.2, chartModelBasis E i.2]

private theorem cutoff_system_gradient_le_total (η : E → ℝ) (u : κ → E → ℝ)
    (x : E) (i : κ × J) :
    |bourCutoffSystemGradient η u i x| ≤ ∑ j : κ × J, |bourCutoffSystemGradient η u j x| :=
  Finset.single_le_sum (fun j _ => abs_nonneg (bourCutoffSystemGradient η u j x))
    (Finset.mem_univ i)

private theorem abs_weighted_principal_le
    (a : Matrix J J ℝ) (η : E → ℝ) (u : κ → E → ℝ) (j : κ) (x : E)
    {F₀ F₁ : ℝ} (hη : |η x| ≤ 1) (hF₀ : 0 ≤ F₀) (hF₁ : 0 ≤ F₁)
    (hPu : |bourFlatOperator a (u j) x| ≤
      F₀ + F₁ * ∑ i : κ × J, |fderiv ℝ (u i.1) x (chartModelBasis E i.2)|) :
    |η x ^ 2 * bourFlatOperator a (u j) x| ≤
      F₀ + F₁ * ∑ i : κ × J, |bourCutoffSystemGradient η u i x| := by
  have hη2 : |η x| ^ 2 ≤ 1 := by nlinarith [abs_nonneg (η x)]
  have hη' : |η x| ^ 2 ≤ |η x| := by
    simpa only [pow_two, one_mul] using mul_le_mul_of_nonneg_right hη (abs_nonneg (η x))
  rw [abs_mul, abs_pow]
  calc
    _ ≤ |η x| ^ 2 * (F₀ +
        F₁ * ∑ i : κ × J, |fderiv ℝ (u i.1) x (chartModelBasis E i.2)|) :=
      mul_le_mul_of_nonneg_left hPu (sq_nonneg _)
    _ ≤ F₀ + F₁ * ∑ i : κ × J, |bourCutoffSystemGradient η u i x| := by
      rw [mul_add, mul_left_comm (|η x| ^ 2), Finset.mul_sum]
      refine add_le_add (by simpa only [one_mul] using mul_le_mul_of_nonneg_right hη2 hF₀) ?_
      apply mul_le_mul_of_nonneg_left _ hF₁
      refine Finset.sum_le_sum fun i _ => ?_
      rw [bourCutoffSystemGradient, abs_mul]
      exact mul_le_mul_of_nonneg_right hη' (abs_nonneg _)

private theorem abs_localized_principal_le
    (a : Matrix J J ℝ) (η : E → ℝ) (u : κ → E → ℝ) (j : κ) (x : E)
    (hηsmooth : ContDiff ℝ ∞ η) (hu : ContDiff ℝ ∞ (u j))
    {U L T D F₀ F₁ : ℝ} (hη : |η x| ≤ 1)
    (hη1 : ∀ i : J, |fderiv ℝ η x (chartModelBasis E i)| ≤ L)
    (hη2 : ∀ i k : J, |H₂ η x ![chartModelBasis E i, chartModelBasis E k]| ≤ T)
    (hu0 : |u j x| ≤ U) (ha : ∀ i k : J, |a i k| ≤ D) (hD : 0 ≤ D)
    (hF₀ : 0 ≤ F₀) (hF₁ : 0 ≤ F₁)
    (hPu : |bourFlatOperator a (u j) x| ≤
      F₀ + F₁ * ∑ i : κ × J, |fderiv ℝ (u i.1) x (chartModelBasis E i.2)|) :
    let S := ∑ i : κ × J, |bourCutoffSystemGradient η u i x|
    let d₀ := 2 * U * (T + L ^ 2)
    let d₁ := 4 * L
    let n := (Module.finrank ℝ E : ℝ)
    |bourFlatOperator a (fun y => η y ^ 2 * u j y) x| ≤
      (F₀ + n ^ 2 * D * d₀) + (F₁ + n ^ 2 * D * d₁) * S := by
  let S := ∑ i : κ × J, |bourCutoffSystemGradient η u i x|
  let W := bourFlatOperator a (fun y => η y ^ 2 * u j y) x
  let P := η x ^ 2 * bourFlatOperator a (u j) x
  have hDelta := bourSquaredCutoff_operator_error a η (u j) hηsmooth hu x (V := S)
    hη hη1 hη2 hu0 (fun i => cutoff_system_gradient_le_total η u x (j, i)) ha hD
  have hP := abs_weighted_principal_le a η u j x hη hF₀ hF₁ hPu
  change |W - P| ≤ _ at hDelta
  change |P| ≤ _ at hP
  change |W| ≤ _
  rw [show W = (W - P) + P by ring]
  exact (abs_add_le _ _).trans ((add_le_add hDelta hP).trans (by ring_nf; exact le_rfl))

variable [MeasurableSpace E] [BorelSpace E]

omit [InnerProductSpace ℝ E] [FiniteDimensional ℝ E] [MeasurableSpace E] [BorelSpace E] in
private theorem cutoff_system_support
    (K : Set E) (η u : E → ℝ) (hηK : tsupport η ⊆ K) :
    tsupport (fun x => η x ^ 2 * u x) ⊆ K := by
  let v := fun x => η x * (η x * u x)
  have hv : (fun x => η x ^ 2 * u x) = v := by
    funext x
    change _ = η x * (η x * u x)
    ring
  rw [hv]
  exact (tsupport_mul_subset_left (f := η) (g := fun x => η x * u x)).trans hηK

omit [Fintype κ] in

private theorem cutoff_system_gradient_memLp
    (μ : Measure E) [IsFiniteMeasureOnCompacts μ] (p : ℝ≥0∞)
    (K : Set E) (hK : IsCompact K) (η : E → ℝ) (u : κ → E → ℝ)
    (hηK : tsupport η ⊆ K) (hη : ContDiff ℝ ∞ η) (hu : ∀ j, ContDiff ℝ ∞ (u j))
    (i : κ × J) :
    MemLp (bourCutoffSystemGradient η u i) p μ := by
  have hCompη : HasCompactSupport η := hK.of_isClosed_subset isClosed_closure hηK
  have hCont : Continuous (bourCutoffSystemGradient η u i) :=
    hη.continuous.mul (((hu i.1).continuous_fderiv (by simp)).clm_apply continuous_const)
  exact hCont.memLp_of_hasCompactSupport hCompη.mul_right

/-- Bounds for the localized Hessians and the weighted diagonal Hessians.
A pointwise drift bound enters only through the weighted first derivatives.
All norms are real \(L^p\) norms for the given measure on the same chart. -/
theorem bourCutoffSystem_real_norm_bounds
    (μ : Measure E) [IsFiniteMeasureOnCompacts μ] {p : ℝ≥0∞}
    (hp : 1 ≤ p) (hpTop : p ≠ ⊤) (K : Set E) (hK : IsCompact K)
    (a : E → Matrix J J ℝ) (haSmooth : ∀ i k : J, Continuous fun x => a x i k)
    (a₀ : Matrix J J ℝ) (C₀ : ℝ≥0) (hFlat : BourFlatHessianEstimate μ p a₀ C₀)
    {δ : ℝ} (hSmall :
      (C₀ : ℝ≥0∞) * ENNReal.ofReal (δ * (∑ i : J, ‖chartModelBasis E i‖) ^ 2) ≤ 1 / 2)
    (hOsc : ∀ x ∈ K, ∀ i k : J, ‖a x i k - a₀ i k‖ ≤ δ)
    (η : E → ℝ) (hη : ContDiff ℝ ∞ η) (hηK : tsupport η ⊆ K)
    (u : κ → E → ℝ) (hu : ∀ j, ContDiff ℝ ∞ (u j))
    {U L T D F₀ F₁ : ℝ}
    (hU : 0 ≤ U) (hL : 0 ≤ L) (hT : 0 ≤ T) (hD : 0 ≤ D) (hF₀ : 0 ≤ F₀) (hF₁ : 0 ≤ F₁)
    (hη0 : ∀ x ∈ K, |η x| ≤ 1)
    (hη1 : ∀ x ∈ K, ∀ i : J, |fderiv ℝ η x (chartModelBasis E i)| ≤ L)
    (hη2 : ∀ x ∈ K, ∀ i k : J, |H₂ η x ![chartModelBasis E i, chartModelBasis E k]| ≤ T)
    (hu0 : ∀ j x, x ∈ K → |u j x| ≤ U)
    (ha : ∀ x ∈ K, ∀ i k : J, |a x i k| ≤ D)
    (hP : ∀ j x, x ∈ K → |bourFlatOperator (a x) (u j) x| ≤
      F₀ + F₁ * ∑ i : κ × J, |fderiv ℝ (u i.1) x (chartModelBasis E i.2)|) :
    let m := (μ.real K) ^ (p.toReal)⁻¹
    let n := (Module.finrank ℝ E : ℝ)
    let d₀ := 2 * U * (T + L ^ 2)
    let d₁ := 4 * L
    let e₂ := (∑ i : J, ‖chartModelBasis E i‖) ^ 2
    let X (j : κ) := lpNorm (H₂ (fun x => η x ^ 2 * u j x)) p μ
    let Y (i : κ × J) := lpNorm (bourCutoffSystemGradient η u i) p μ
    let Z (i : κ × J) := lpNorm (bourCutoffSystemDiagonal η u i) p μ
    (∀ j, X j ≤ 2 * (C₀ : ℝ) * (F₀ + n ^ 2 * D * d₀) * m +
      (2 * (C₀ : ℝ) * (F₁ + n ^ 2 * D * d₁)) * ∑ i, Y i) ∧
    (∀ i, Z i ≤ d₀ * m + e₂ * X i.1 + d₁ * ∑ k, Y k) := by
  classical
  let n := (Module.finrank ℝ E : ℝ)
  let d₀ := 2 * U * (T + L ^ 2)
  let d₁ := 4 * L
  let e := ∑ i : J, ‖chartModelBasis E i‖
  let w (j : κ) := fun x => η x ^ 2 * u j x
  let v (i : κ × J) := bourCutoffSystemGradient η u i
  let f (j : κ) := fun x => bourFlatOperator (a x) (w j) x
  have hm (i : κ × J) : MemLp (v i) p μ :=
    cutoff_system_gradient_memLp μ p K hK η u hηK hη hu i
  have hw (j : κ) : ContDiff ℝ ∞ (w j) := (hη.pow 2).mul (hu j)
  have hws (j : κ) : tsupport (w j) ⊆ K := cutoff_system_support K η (u j) hηK
  have hwc (j : κ) : HasCompactSupport (w j) := hK.of_isClosed_subset isClosed_closure (hws j)
  have hdw0 (j : κ) {x : E} (hx : x ∉ K) : H₂ (w j) x = 0 := by
    by_contra h
    exact hx (hws j (support_iteratedFDeriv_subset 2 h))
  have hKfin : μ K ≠ ⊤ := hK.measure_ne_top
  have hKmeas : MeasurableSet K := hK.isClosed.measurableSet
  have hd₀ : 0 ≤ d₀ := by dsimp [d₀]; positivity
  have hd₁ : 0 ≤ d₁ := by dsimp [d₁]; positivity
  have hx₀ : 0 ≤ F₀ + n ^ 2 * D * d₀ := by positivity
  have hx₁ : 0 ≤ F₁ + n ^ 2 * D * d₁ := by positivity
  constructor
  · intro j
    have hcont : Continuous (f j) := by
      have hHessW : Continuous (H₂ (w j)) := (hw j).continuous_iteratedFDeriv (by simp)
      unfold f bourFlatOperator
      fun_prop
    have hfs : HasCompactSupport (f j) := HasCompactSupport.intro hK fun x hx =>
      by simp [f, bourFlatOperator, hdw0 j hx]
    have hfp : MemLp (f j) p μ := hcont.memLp_of_hasCompactSupport hfs
    have hCut (x : E) : ‖f j x‖ ≤
        K.indicator (fun _ => F₀ + n ^ 2 * D * d₀) x +
          ∑ i : κ × J, (F₁ + n ^ 2 * D * d₁) * ‖v i x‖ := by
      by_cases hx : x ∈ K
      · simp only [Set.indicator_of_mem hx, ← Finset.mul_sum, Real.norm_eq_abs]
        exact abs_localized_principal_le (a x) η u j x hη (hu j)
          (hη0 x hx) (hη1 x hx) (hη2 x hx) (hu0 j x hx) (ha x hx) hD hF₀ hF₁ (hP j x hx)
      · rw [Set.indicator_of_notMem hx]
        have hf0 : f j x = 0 := by simp [f, bourFlatOperator, hdw0 j hx]
        rw [hf0, norm_zero, zero_add]
        exact Finset.sum_nonneg fun i _ => mul_nonneg hx₁ (norm_nonneg _)
    have hSource := bourLpNorm_le_indicator_add_sum μ p hp hpTop K hKmeas hKfin
      (f j) v (F₀ + n ^ 2 * D * d₀) (fun _ => F₁ + n ^ 2 * D * d₁)
      hx₀ (fun _ => hx₁) hm hCut
    rw [← Finset.mul_sum] at hSource
    have hPert := bourLpNorm_hessianPerturb_entries μ p hp a a₀ C₀ hFlat (w j) (hw j) (hwc j)
      hSmall (Eventually.of_forall fun x hx => hOsc x (hws j (support_iteratedFDeriv_subset 2 hx))) hfp
    have hPay := hPert.trans (mul_le_mul_of_nonneg_left hSource (by positivity))
    change lpNorm (H₂ (w j)) p μ ≤ _
    convert hPay using 1
    ring
  · intro i
    let k := chartModelBasis E i.2
    let H := H₂ (w i.1)
    let v' : Option (κ × J) → E → ℝ
      | none => fun x => ‖H x‖
      | some j => v j
    let c : Option (κ × J) → ℝ
      | none => e ^ 2
      | some _ => d₁
    have hH : MemLp H p μ :=
      ((hw i.1).continuous_iteratedFDeriv (by simp)).memLp_of_hasCompactSupport ((hwc i.1).iteratedFDeriv 2)
    have hv' (j : Option (κ × J)) : MemLp (v' j) p μ := by
      cases j with
      | none => exact hH.norm
      | some j => exact hm j
    have hc (j : Option (κ × J)) : 0 ≤ c j := by
      cases j with
      | none => exact sq_nonneg _
      | some _ => exact hd₁
    have hZ (x : E) : ‖bourCutoffSystemDiagonal η u i x‖ ≤
        K.indicator (fun _ => d₀) x + ∑ j, c j * ‖v' j x‖ := by
      by_cases hx : x ∈ K
      · have hAxis : ‖k‖ ≤ e :=
          Finset.single_le_sum (fun j _ => norm_nonneg (chartModelBasis E j)) (Finset.mem_univ i.2)
        have he : 0 ≤ e := Finset.sum_nonneg fun j _ => norm_nonneg (chartModelBasis E j)
        have hEval : |H x ![k, k]| ≤ e ^ 2 * ‖H x‖ := by
          rw [← Real.norm_eq_abs, mul_comm]
          refine ((H x).le_opNorm ![k, k]).trans ?_
          simp only [Fin.prod_univ_two, Matrix.cons_val_zero, Matrix.cons_val_one]
          exact mul_le_mul_of_nonneg_left
            (by rw [← pow_two]; exact (sq_le_sq₀ (norm_nonneg _) he).mpr hAxis) (norm_nonneg _)
        let S := ∑ j : κ × J, |v j x|
        have hErr := bourSquaredCutoff_hessian_error η (u i.1) hη (hu i.1) x k k (V := S)
          (hη0 x hx) (hη1 x hx i.2) (hη1 x hx i.2) (hη2 x hx i.2 i.2) (hu0 i.1 x hx)
          (cutoff_system_gradient_le_total η u x i) (cutoff_system_gradient_le_total η u x i)
        let Z := bourCutoffSystemDiagonal η u i x
        change |H x ![k, k] - Z| ≤ _ at hErr
        have hZ' : |Z| ≤ e ^ 2 * ‖H x‖ + (d₀ + d₁ * S) := by
          rw [show Z = H x ![k, k] - (H x ![k, k] - Z) by ring]
          exact (abs_sub _ _).trans (add_le_add hEval hErr)
        change ‖Z‖ ≤ _
        rw [Real.norm_eq_abs, Set.indicator_of_mem hx, Fintype.sum_option]
        simp only [c, v', ← Finset.mul_sum, Real.norm_eq_abs, abs_norm]
        exact hZ'.trans (by dsimp [S]; linarith)
      · have hηx : η x = 0 := image_eq_zero_of_notMem_tsupport (fun h => hx (hηK h))
        simp only [bourCutoffSystemDiagonal, hηx, zero_pow (by norm_num : 2 ≠ 0), zero_mul,
          norm_zero, Set.indicator_of_notMem hx, zero_add]
        exact Finset.sum_nonneg fun j _ => mul_nonneg (hc j) (norm_nonneg _)
    have hBound := bourLpNorm_le_indicator_add_sum μ p hp hpTop K hKmeas hKfin
      (bourCutoffSystemDiagonal η u i) v' d₀ c hd₀ hc hv' hZ
    rw [Fintype.sum_option] at hBound
    simp only [v', c, lpNorm_norm hH.aestronglyMeasurable, ← Finset.mul_sum] at hBound
    simpa only [add_assoc] using hBound

end
end SmoothPoincare
