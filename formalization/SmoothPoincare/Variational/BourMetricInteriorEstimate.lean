import SmoothPoincare.Variational.BourTransportedInterior
import SmoothPoincare.Variational.BourFlatInterior
import DifferentialGeometry.Analysis.Calculus.PartialDerivative.Iterated
import DifferentialGeometry.Analysis.Calculus.Cutoff.Ball
import DifferentialGeometry.Geometry.Metric.Coordinates.InverseGramPerturbation
import Mathlib.MeasureTheory.Function.LpSeminorm.TriangleInequality
import Mathlib.MeasureTheory.Function.LpSpace.Indicator

/-!
# The first metric interior estimate on the physical Bour harmonic ball

26 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance.
Actual serving configuration unavailable.
-/

set_option autoImplicit false

noncomputable section

open Bundle DifferentialGeometry DifferentialGeometry.Analysis
open DifferentialGeometry.Analysis.Calculus
open DifferentialGeometry.Geometry.Operator
open DifferentialGeometry.Geometry.Curvature
open DifferentialGeometry.Tensor.Coordinates
open Filter Manifold MeasureTheory Set
open scoped BigOperators ContDiff ENNReal InnerProductSpace Laplacian Manifold NNReal Topology

namespace SmoothPoincare

open Bour


variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
  [FiniteDimensional ℝ E]

local notation "J" => Fin (Module.finrank ℝ E)
local notation "ι" => 𝓘(ℝ, E)
local notation "∂" => DifferentialGeometry.Tensor.Coordinates.partialDeriv

private theorem model_gram_entry (G : SmoothRiemannianMetric ι E) (z : E) (i k : J) :
    chartGramOnE G 0 i k z = G.inner z (chartModelBasis E i) (chartModelBasis E k) := by
  simp only [chartGramOnE_def, extChartAt_model_space_eq_id, PartialEquiv.refl_symm,
    PartialEquiv.refl_coe, id_eq, chartGramMatrix_apply, chartBasisVecFiber,
    TangentBundle.symmL_model_space]
  rfl

private theorem model_gram_smooth (G : SmoothRiemannianMetric ι E) (i k : J) :
    ContDiff ℝ ∞ (chartGramOnE G 0 i k) := by
  rw [← contDiffOn_univ]
  simpa using chartGramOnE_contDiffOn G (0 : E) i k

private theorem model_inv_smooth (G : SmoothRiemannianMetric ι E) (i k : J) :
    ContDiff ℝ ∞ (chartInvGramOnE G 0 i k) := by
  rw [← contDiffOn_univ]
  simpa using chartInvGramOnE_contDiffOn G (0 : E) i k

/-- A lower metric form bound and first-jet controls give a common entrywise inverse bound and modulus. -/
theorem bourMetricInverse_entry_controls
    {r L : ℝ} (hL : 0 < L) {A : ℝ} :
    ∃ D : ℝ, 0 ≤ D ∧ ∀ (G : SmoothRiemannianMetric ι E),
      (∀ z ∈ Metric.ball (0 : E) (3 * r), ∀ v : E,
        L⁻¹ ^ 2 * ‖v‖ ^ 2 ≤ G.inner z v v) →
      (∀ i j : J, ∀ z ∈ Metric.ball (0 : E) (3 * r),
        ‖fderiv ℝ (chartGramOnE G 0 i j) z‖ ≤ A) →
      (∀ i j : J, ∀ z ∈ Metric.ball (0 : E) (3 * r),
        |chartInvGramOnE G 0 i j z| ≤ D) ∧
      (∀ i j : J, ∀ z ∈ Metric.ball (0 : E) (3 * r),
        ∀ w ∈ Metric.ball (0 : E) (3 * r),
        |chartInvGramOnE G 0 i j w - chartInvGramOnE G 0 i j z|
          ≤ (Module.finrank ℝ E : ℝ) ^ 2 * D ^ 2 * A * dist w z) := by
  classical
  let V := Metric.closedBall (0 : E) (3 * r)
  have hBase : V ⊆ (trivializationAt E (TangentSpace ι) (0 : E)).baseSet := by
    rw [trivializationAt_baseSet_eq_chartAt_source]
    simp
  obtain ⟨D, hD, hInv⟩ := exists_abs_chartInvGramMatrix_le_of_lower_bound
    (Geometry.standardEuclideanMetric E) 0 (isCompact_closedBall _ _) hBase
    (L⁻¹ ^ 2) (by positivity)
  refine ⟨D, hD, ?_⟩
  intro G hMetric hGrad
  have hEntry (i j : J) (z : E) (hz : z ∈ Metric.ball (0 : E) (3 * r)) :
      |chartInvGramOnE G 0 i j z| ≤ D := by
    rw [chartInvGramOnE_def, extChartAt_model_space_eq_id, PartialEquiv.refl_symm,
      PartialEquiv.refl_coe, id_eq]
    refine hInv z (Metric.ball_subset_closedBall hz) G (fun v => ?_) i j
    change L⁻¹ ^ 2 * inner ℝ (v : E) (v : E) ≤ _
    let w : E := v
    change L⁻¹ ^ 2 * inner ℝ w w ≤ G.inner z w w
    rw [real_inner_self_eq_norm_sq]
    exact hMetric z hz w
  refine ⟨hEntry, ?_⟩
  intro i j z hz w hw
  have hUnit (x : E) : IsUnit (chartGramMatrix G 0 x) := by
    rw [Matrix.isUnit_iff_isUnit_det]
    exact isUnit_iff_ne_zero.mpr (ne_of_gt (chartGramMatrix_det_pos G 0 (by
      rw [trivializationAt_baseSet_eq_chartAt_source]
      simp)))
  have hΔ (p q : J) :
      |(chartGramMatrix G 0 z - chartGramMatrix G 0 w) p q| ≤ A * dist w z := by
    have h := (convex_ball (0 : E) (3 * r)).norm_image_sub_le_of_norm_fderiv_le
      (fun y _ => (model_gram_smooth G p q).differentiable (by simp) y)
      (hGrad p q) hz hw
    rw [Real.norm_eq_abs, ← dist_eq_norm, abs_sub_comm] at h
    simpa only [chartGramOnE_def, extChartAt_model_space_eq_id, PartialEquiv.refl_symm,
      PartialEquiv.refl_coe, id_eq, Matrix.sub_apply] using h
  have hInvE (x : E) (hx : x ∈ Metric.ball (0 : E) (3 * r)) (p q : J) :
      |(chartGramMatrix G 0 x)⁻¹ p q| ≤ D := by
    simpa only [chartInvGramOnE_def, extChartAt_model_space_eq_id, PartialEquiv.refl_symm,
      PartialEquiv.refl_coe, id_eq, chartInvGramMatrix] using hEntry p q x hx
  have he := Matrix.inv_entry_sub_abs_le_of_entry_bound
    (hUnit w) (hUnit z) (hInvE w hw) (hInvE z hz) hΔ i j
  rw [← mul_assoc] at he
  simpa only [chartInvGramOnE_def, extChartAt_model_space_eq_id, PartialEquiv.refl_symm,
    PartialEquiv.refl_coe, id_eq, chartInvGramMatrix] using he


/-- A common bound on equal-radius balls gives a bound on the smaller
Euclidean ball. The cover is chosen before the continuous function. -/
theorem bourFiniteCover_eLpNorm [MeasurableSpace E] [BorelSpace E]
    (μ : Measure E) {p : ℝ≥0∞} (hp : 1 ≤ p) {r ρ : ℝ} (hρ : 0 < ρ) :
    ∃ N : ℕ, ∀ {F : Type*} [NormedAddCommGroup F], ∀ (f : E → F), Continuous f → ∀ C : ℝ≥0∞,
      (∀ z ∈ Metric.closedBall (0 : E) (5 * r / 2),
        eLpNorm f p (μ.restrict (Metric.ball z ρ)) ≤ C) →
      eLpNorm f p (μ.restrict (Metric.ball (0 : E) (5 * r / 2))) ≤ (N : ℝ≥0∞) * C := by
  classical
  let K := Metric.closedBall (0 : E) (5 * r / 2)
  let U (z : K) := Metric.ball (z : E) ρ
  have hCover : K ⊆ ⋃ z : K, U z := fun y hy =>
    mem_iUnion.mpr ⟨⟨y, hy⟩, Metric.mem_ball_self hρ⟩
  obtain ⟨T, hT⟩ := (isCompact_closedBall (0 : E) (5 * r / 2)).elim_finite_subcover
    U (fun _ => Metric.isOpen_ball) hCover
  refine ⟨T.card, ?_⟩
  intro F _ f hF C hBound
  let S := Metric.ball (0 : E) (5 * r / 2)
  have hInd : AEStronglyMeasurable (S.indicator f) μ :=
    hF.aestronglyMeasurable.indicator Metric.isOpen_ball.measurableSet
  have hS (x : E) :
      ‖S.indicator f x‖ ≤ ∑ z ∈ T, (U z).indicator (fun y => ‖f y‖) x := by
    have hnon (z : K) : 0 ≤ (U z).indicator (fun y => ‖f y‖) x := by
      by_cases h : x ∈ U z <;> simp [h]
    by_cases hx : x ∈ S
    · obtain ⟨z, hz, hzx⟩ := mem_iUnion₂.mp (hT (Metric.ball_subset_closedBall hx))
      rw [Set.indicator_of_mem hx]
      exact (show ‖f x‖ = (U z).indicator (fun y => ‖f y‖) x by simp [hzx]).le.trans
        (Finset.single_le_sum (fun z _ => hnon z) hz)
    · rw [Set.indicator_of_notMem hx, norm_zero]
      exact Finset.sum_nonneg fun z _ => hnon z
  calc
    eLpNorm f p (μ.restrict S) = eLpNorm (S.indicator f) p μ :=
      (eLpNorm_indicator_eq_eLpNorm_restrict Metric.isOpen_ball.measurableSet).symm
    _ ≤ eLpNorm (fun x => ∑ z ∈ T, (U z).indicator (fun y => ‖f y‖) x) p μ :=
      eLpNorm_mono_real hInd hS
    _ ≤ ∑ z ∈ T, eLpNorm ((U z).indicator fun y => ‖f y‖) p μ := by
      have hsum : (fun x => ∑ z ∈ T, (U z).indicator (fun y => ‖f y‖) x) =
          ∑ z ∈ T, (U z).indicator (fun y => ‖f y‖) := by
        funext x
        exact (Finset.sum_apply x T _).symm
      rw [hsum]
      exact eLpNorm_sum_le hp
    _ ≤ ∑ _ ∈ T, C := by
      refine Finset.sum_le_sum fun z _ => ?_
      rw [eLpNorm_indicator_eq_eLpNorm_restrict Metric.isOpen_ball.measurableSet,
        eLpNorm_norm f hF.aestronglyMeasurable]
      exact hBound z z.property
    _ = _ := by simp [nsmul_eq_mul]

/-- A common bound on all equal-radius balls covering the smaller
Euclidean ball gives the bound times the cardinality of a finite cover.
The cover is chosen before the function. -/
theorem bourFiniteCover_hessianLp [MeasurableSpace E] [BorelSpace E]
    (μ : Measure E) {p : ℝ≥0∞} (hp : 1 ≤ p) {r ρ : ℝ} (hρ : 0 < ρ) :
    ∃ N : ℕ, ∀ (u : E → ℝ), ContDiff ℝ ∞ u → ∀ C : ℝ≥0∞,
      (∀ z ∈ Metric.closedBall (0 : E) (5 * r / 2),
        eLpNorm (iteratedFDeriv ℝ 2 u) p (μ.restrict (Metric.ball z ρ)) ≤ C) →
      eLpNorm (iteratedFDeriv ℝ 2 u) p
        (μ.restrict (Metric.ball (0 : E) (5 * r / 2))) ≤ (N : ℝ≥0∞) * C := by
  obtain ⟨N, hN⟩ := bourFiniteCover_eLpNorm (E := E) μ hp (r := r) hρ
  refine ⟨N, fun u hu => hN (iteratedFDeriv ℝ 2 u) (hu.continuous_iteratedFDeriv (by simp))⟩

omit [FiniteDimensional ℝ E] in
/-- The Hessian of a scalar product in the two fixed derivative slots. -/
theorem bourHessian_product
    {u v : E → ℝ} (hu : ContDiff ℝ ∞ u) (hv : ContDiff ℝ ∞ v)
    (x d e : E) :
    iteratedFDeriv ℝ 2 (fun y => u y * v y) x ![d, e] =
      u x * iteratedFDeriv ℝ 2 v x ![d, e] +
        v x * iteratedFDeriv ℝ 2 u x ![d, e] +
        fderiv ℝ u x d * fderiv ℝ v x e +
        fderiv ℝ u x e * fderiv ℝ v x d := by
  have hU := hu.differentiable (by simp)
  have hV := hv.differentiable (by simp)
  have hdu := (hu.fderiv_right (m := ∞) (by simp)).differentiable (by simp)
  have hdv := (hv.fderiv_right (m := ∞) (by simp)).differentiable (by simp)
  have hderiv : fderiv ℝ (fun y => u y * v y) =
      (fun y => u y • fderiv ℝ v y + v y • fderiv ℝ u y) :=
    funext fun y => fderiv_fun_mul (hU y) (hV y)
  simp only [iteratedFDeriv_two_apply,
    Matrix.cons_val_zero, Matrix.cons_val_one, hderiv]
  erw [fderiv_fun_add ((hU x).smul (hdv x)) ((hV x).smul (hdu x)),
    fderiv_fun_smul (hU x) (hdv x), fderiv_fun_smul (hV x) (hdu x)]
  simp only [_root_.add_apply, _root_.smul_apply, ContinuousLinearMap.smulRight_apply, smul_eq_mul]
  ring


omit [FiniteDimensional ℝ E] in
/-- The second derivative bound for the smooth ball cutoff in two fixed slots. -/
theorem bourBallCutoff_hessian_eval_bound
    {s R : ℝ} (hs : 0 ≤ s) (hsR : s < R) (z x d e : E) :
    |iteratedFDeriv ℝ 2 (ballCutoff z s R) x ![d, e]| ≤
      ballCutoffFDeriv2Bound s R * ‖d‖ * ‖e‖ := by
  rw [iteratedFDeriv_two_apply,
    Matrix.cons_val_zero, Matrix.cons_val_one, fderiv_ballCutoff, fderiv_ballCutoffFDeriv,
    ← Real.norm_eq_abs]
  exact ((ballCutoffFDeriv2 z s R x d).le_opNorm e).trans
    (mul_le_mul_of_nonneg_right
      (((ballCutoffFDeriv2 z s R x).le_opNorm d).trans
        (mul_le_mul_of_nonneg_right (norm_ballCutoffFDeriv2_le hs hsR x) (norm_nonneg _)))
      (norm_nonneg _))

omit [FiniteDimensional ℝ E] in
/-- A first derivative operator norm bound gives a bound in one fixed direction. -/
theorem bourNorm_directional_bound {u : E → ℝ} {x d : E} {A B : ℝ}
    (hA : ‖fderiv ℝ u x‖ ≤ A) (hd : ‖d‖ ≤ B) (hA₀ : 0 ≤ A) :
    |fderiv ℝ u x d| ≤ A * B := by
  rw [← Real.norm_eq_abs]
  exact ((fderiv ℝ u x).le_opNorm d).trans
    (mul_le_mul hA hd (norm_nonneg _) hA₀)

private theorem abs_double_sum_le_card {Q : Type*} [Fintype Q] (f : Q → Q → ℝ)
    {c : ℝ} (hc : ∀ a b, |f a b| ≤ c) :
    |∑ a, ∑ b, f a b| ≤ (Fintype.card Q : ℝ) ^ 2 * c := by
  calc
    _ ≤ ∑ a, ∑ b, |f a b| :=
      (Finset.abs_sum_le_sum_abs _ _).trans
        (Finset.sum_le_sum fun _ _ => Finset.abs_sum_le_sum_abs _ _)
    _ ≤ ∑ _a : Q, ∑ _b : Q, c :=
      Finset.sum_le_sum fun a _ => Finset.sum_le_sum fun b _ => hc a b
    _ = _ := by simp only [Finset.sum_const, Finset.card_univ, nsmul_eq_mul]; ring

/-- Bounds on the principal forcing, first jet, metric entry and
coefficient entries bound the localized principal forcing. -/
theorem bourCutoffOperator_abs_bound
    (a : Matrix J J ℝ) {u : E → ℝ} (hu : ContDiff ℝ ∞ u)
    (z x : E) {s R : ℝ} (hs : 0 ≤ s) (hsR : s < R)
    {D A B U F : ℝ} (hD : 0 ≤ D) (hA : 0 ≤ A) (hB : 0 ≤ B) (hU : 0 ≤ U)
    (hEntry : ∀ i j, |a i j| ≤ D) (hAxis : ∀ i : J, ‖chartModelBasis E i‖ ≤ B)
    (hu0 : |u x| ≤ U) (hu1 : ‖fderiv ℝ u x‖ ≤ A)
    (hPu : |∑ i : J, ∑ j : J, a i j * iteratedFDeriv ℝ 2 u x
      ![chartModelBasis E i, chartModelBasis E j]| ≤ F) :
    |∑ i : J, ∑ j : J, a i j * iteratedFDeriv ℝ 2 (fun y => ballCutoff z s R y * u y) x
      ![chartModelBasis E i, chartModelBasis E j]| ≤
      F + (Module.finrank ℝ E : ℝ) ^ 2 * D *
        (U * (ballCutoffFDeriv2Bound s R * B * B) +
          2 * (ballCutoffFDerivBound s R * B) * (A * B)) := by
  let χ := ballCutoff z s R
  let e := chartModelBasis E
  let d₁ := ballCutoffFDerivBound s R
  let d₂ := ballCutoffFDeriv2Bound s R
  have h₁ : 0 ≤ d₁ := ballCutoffFDerivBound_nonneg hs hsR
  have h₂ : 0 ≤ d₂ := ballCutoffFDeriv2Bound_nonneg hs hsR
  have hχ : |χ x| ≤ 1 := by
    have h := ballCutoff_mem_Icc z s R x
    exact (abs_of_nonneg h.1).trans_le h.2
  have hdχ (i : J) : |fderiv ℝ χ x (e i)| ≤ d₁ * B :=
    bourNorm_directional_bound (by
      dsimp only [χ, d₁]
      rw [fderiv_ballCutoff]
      exact norm_ballCutoffFDeriv_le hs hsR x) (hAxis i) h₁
  have hddχ (i j : J) : |iteratedFDeriv ℝ 2 χ x ![e i, e j]| ≤ d₂ * B * B :=
    (bourBallCutoff_hessian_eval_bound hs hsR z x (e i) (e j)).trans
      (mul_le_mul (mul_le_mul_of_nonneg_left (hAxis i) h₂) (hAxis j)
        (norm_nonneg _) (mul_nonneg h₂ hB))
  have hdu (i : J) : |fderiv ℝ u x (e i)| ≤ A * B :=
    bourNorm_directional_bound hu1 (hAxis i) hA
  let q (i j : J) := u x * iteratedFDeriv ℝ 2 χ x ![e i, e j] +
    fderiv ℝ χ x (e i) * fderiv ℝ u x (e j) +
    fderiv ℝ χ x (e j) * fderiv ℝ u x (e i)
  have hq (i j : J) : |q i j| ≤ U * (d₂ * B * B) + 2 * (d₁ * B) * (A * B) := by
    dsimp only [q]
    calc
      _ ≤ |u x * iteratedFDeriv ℝ 2 χ x ![e i, e j]| +
          |fderiv ℝ χ x (e i) * fderiv ℝ u x (e j)| +
          |fderiv ℝ χ x (e j) * fderiv ℝ u x (e i)| :=
        (abs_add_le _ _).trans (add_le_add_left (abs_add_le _ _) _)
      _ ≤ U * (d₂ * B * B) + (d₁ * B) * (A * B) + (d₁ * B) * (A * B) := by
        simp only [abs_mul]
        exact add_le_add
          (add_le_add (mul_le_mul hu0 (hddχ i j) (abs_nonneg _) hU)
            (mul_le_mul (hdχ i) (hdu j) (abs_nonneg _) (mul_nonneg h₁ hB)))
          (mul_le_mul (hdχ j) (hdu i) (abs_nonneg _) (mul_nonneg h₁ hB))
      _ = _ := by ring
  have hSplit : (∑ i : J, ∑ j : J, a i j *
        iteratedFDeriv ℝ 2 (fun y => χ y * u y) x ![e i, e j]) =
      χ x * (∑ i : J, ∑ j : J, a i j * iteratedFDeriv ℝ 2 u x ![e i, e j]) +
      ∑ i : J, ∑ j : J, a i j * q i j := by
    simp only [Finset.mul_sum, ← Finset.sum_add_distrib]
    refine Finset.sum_congr rfl fun i _ => Finset.sum_congr rfl fun j _ => ?_
    rw [bourHessian_product (ballCutoff_contDiff z s R) hu]
    dsimp only [e, q, χ]
    ring
  change |∑ i : J, ∑ j : J, a i j * iteratedFDeriv ℝ 2 (fun y => χ y * u y) x
    ![e i, e j]| ≤ _
  rw [hSplit]
  calc
    _ ≤ |χ x * (∑ i : J, ∑ j : J, a i j * iteratedFDeriv ℝ 2 u x ![e i, e j])| +
        |∑ i : J, ∑ j : J, a i j * q i j| := abs_add_le _ _
    _ ≤ 1 * F + (Module.finrank ℝ E : ℝ) ^ 2 *
        (D * (U * (d₂ * B * B) + 2 * (d₁ * B) * (A * B))) := by
      apply add_le_add
      · rw [abs_mul]
        exact mul_le_mul hχ hPu (abs_nonneg _) zero_le_one
      · simpa only [Fintype.card_fin] using
          (abs_double_sum_le_card (fun i j : J => a i j * q i j)
            (fun i j => by rw [abs_mul]; exact mul_le_mul (hEntry i j) (hq i j) (abs_nonneg _) hD))
    _ = _ := by simp only [one_mul, mul_assoc, d₁, d₂]


omit [FiniteDimensional ℝ E] in
/-- The localized Hessian vanishes off the closed outer cutoff ball. -/
theorem bourCutoffProduct_hessian_support
    (z : E) {s R : ℝ} (hs : 0 ≤ s) (hsR : s < R) (u : E → ℝ) :
    tsupport (iteratedFDeriv ℝ 2 (fun x => ballCutoff z s R x * u x)) ⊆
      Metric.closedBall z R :=
  (tsupport_iteratedFDeriv_subset 2).trans <|
    (tsupport_mul_subset_left (f := ballCutoff z s R) (g := u)).trans
      (ballCutoff_tsupport_subset_closedBall hs hsR)

variable [MeasurableSpace E] [BorelSpace E]

private theorem localized_hessian_bound
    (μ : Measure E) [IsFiniteMeasureOnCompacts μ] {p : ℝ≥0∞} (hp : 1 ≤ p)
    {r ρ : ℝ} (_hr : 0 < r) (hρ : 0 < ρ) (hρr : ρ ≤ r / 4)
    (z : E) (hz : z ∈ Metric.closedBall (0 : E) (5 * r / 2))
    (a : E → Matrix J J ℝ) (ha : ∀ i j : J, Continuous fun x => a x i j)
    (C : ℝ≥0) (hFlat : BourFlatHessianEstimate μ p (a z) C)
    {δ D A B U F : ℝ} (hD : 0 ≤ D) (hA : 0 ≤ A) (hB : 0 ≤ B)
    (hU : 0 ≤ U)
    (hAxis : ∀ i : J, ‖chartModelBasis E i‖ ≤ B)
    (hEntry : ∀ x ∈ Metric.ball (0 : E) (3 * r), ∀ i j : J, |a x i j| ≤ D)
    (hSmall : (C : ℝ≥0∞) * ENNReal.ofReal (δ * (∑ i : J, ‖chartModelBasis E i‖) ^ 2) ≤ 1 / 2)
    (hOsc : ∀ x ∈ Metric.closedBall z ρ, ∀ i j : J, ‖a x i j - a z i j‖ ≤ δ)
    (u : E → ℝ) (hu : ContDiff ℝ ∞ u)
    (hu0 : ∀ x ∈ Metric.ball (0 : E) (3 * r), |u x| ≤ U)
    (hu1 : ∀ x ∈ Metric.ball (0 : E) (3 * r), ‖fderiv ℝ u x‖ ≤ A)
    (hPu : ∀ x ∈ Metric.ball (0 : E) (3 * r), |bourFlatOperator (a x) u x| ≤ F) :
    let S := F + (Module.finrank ℝ E : ℝ) ^ 2 * D *
      (U * (ballCutoffFDeriv2Bound (ρ / 2) ρ * B * B) +
        2 * (ballCutoffFDerivBound (ρ / 2) ρ * B) * (A * B))
    eLpNorm (iteratedFDeriv ℝ 2 u) p (μ.restrict (Metric.ball z (ρ / 2))) ≤
      (2 * (C : ℝ≥0∞)) * (μ (Metric.ball (0 : E) (3 * r)) ^ p.toReal⁻¹ * ENNReal.ofReal S) := by
  let s := ρ / 2
  have hs : 0 ≤ s := by dsimp [s]; positivity
  have hsR : s < ρ := half_lt_self hρ
  let χ := ballCutoff z s ρ
  let w := fun x => χ x * u x
  have hw : ContDiff ℝ ∞ w := (ballCutoff_contDiff z s ρ).mul hu
  have hcw : HasCompactSupport w := (ballCutoff_hasCompactSupport (center := z) hs hsR).mul_right
  have hSupport : Function.support (iteratedFDeriv ℝ 2 w) ⊆ Metric.closedBall z ρ :=
    subset_closure.trans (bourCutoffProduct_hessian_support z hs hsR u)
  let V := Metric.ball (0 : E) (3 * r)
  have hClosed : Metric.closedBall z ρ ⊆ V := by
    intro x hx
    change dist x 0 < 3 * r
    have hx' := Metric.mem_closedBall.mp hx
    have hz' := Metric.mem_closedBall.mp hz
    linarith [dist_triangle x z 0]
  have haes : ∀ᵐ x ∂μ, iteratedFDeriv ℝ 2 w x ≠ 0 →
      ∀ i j : J, ‖a x i j - a z i j‖ ≤ δ :=
    Eventually.of_forall fun x h => hOsc x (hSupport h)
  let P := fun x => bourFlatOperator (a x) w x
  have hP : Continuous P := by
    have hDw := hw.continuous_iteratedFDeriv (m := 2) (by simp)
    unfold P bourFlatOperator
    fun_prop
  have hPert := bourFlatHessianEstimate_perturb_entries μ p hp a (a z) C hFlat w hw hcw
    hSmall haes hP.aestronglyMeasurable
  have hSupportP : Function.support P ⊆ V := by
    intro x hx
    by_contra h
    have hzero : iteratedFDeriv ℝ 2 w x = 0 := by
      by_contra h'
      exact h (hClosed (hSupport h'))
    exact hx (by simp [P, bourFlatOperator, hzero])
  have hPbound : eLpNorm P p μ ≤ μ V ^ p.toReal⁻¹ *
      ENNReal.ofReal (F + (Module.finrank ℝ E : ℝ) ^ 2 * D *
        (U * (ballCutoffFDeriv2Bound s ρ * B * B) +
          2 * (ballCutoffFDerivBound s ρ * B) * (A * B))) := by
    rw [← eLpNorm_restrict_eq_of_support_subset hP.aestronglyMeasurable hSupportP]
    rw [← Measure.restrict_apply_univ]
    apply eLpNorm_le_of_ae_bound hP.aestronglyMeasurable
    filter_upwards [ae_restrict_mem (μ := μ) Metric.isOpen_ball.measurableSet] with x hx
    simpa only [P, bourFlatOperator, Real.norm_eq_abs] using
      bourCutoffOperator_abs_bound (a x) hu z x hs hsR hD hA hB hU
        (hEntry x hx) hAxis (hu0 x hx) (hu1 x hx) (hPu x hx)
  have hInside : iteratedFDeriv ℝ 2 u =ᵐ[μ.restrict (Metric.ball z s)] iteratedFDeriv ℝ 2 w := by
    filter_upwards [ae_restrict_mem (μ := μ) Metric.isOpen_ball.measurableSet] with x hx
    have heq : u =ᶠ[𝓝 x] w := by
      filter_upwards [Metric.isOpen_ball.mem_nhds hx] with y hy
      simp [w, χ, ballCutoff_eq_one_of_mem_closedBall hs hsR (Metric.ball_subset_closedBall hy)]
    exact (heq.iteratedFDeriv ℝ 2).eq_of_nhds
  dsimp only
  rw [eLpNorm_congr_ae hInside]
  exact (eLpNorm_restrict_le _ _ _ _).trans
    (hPert.trans (mul_le_mul_of_nonneg_left hPbound (by simp)))


variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [I.Boundaryless] [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]

omit [MeasurableSpace E] [BorelSpace E] in
private theorem model_gram_abs_bound_of_form
    (G : SmoothRiemannianMetric ι E) (z : E) {L B : ℝ} (hL : 0 < L) (hB : 0 ≤ B)
    (hAxis : ∀ i : J, ‖chartModelBasis E i‖ ≤ B)
    (hForm : ∀ w : E, G.inner z w w ≤ L ^ 2 * ‖w‖ ^ 2) (i k : J) :
    |chartGramOnE G 0 i k z| ≤ (L * B) ^ 2 := by
  rw [model_gram_entry]
  have hV (l : J) :
      Real.sqrt (G.inner z (chartModelBasis E l) (chartModelBasis E l)) ≤ L * B := by
    calc
      _ ≤ Real.sqrt (L ^ 2 * ‖chartModelBasis E l‖ ^ 2) :=
        Real.sqrt_le_sqrt (hForm (chartModelBasis E l))
      _ = L * ‖chartModelBasis E l‖ := by
        rw [Real.sqrt_mul (sq_nonneg L), Real.sqrt_sq hL.le, Real.sqrt_sq (norm_nonneg _)]
      _ ≤ _ := mul_le_mul_of_nonneg_left (hAxis l) hL.le
  exact (G.abs_metric_inner_le_sqrt_metric_quadratic z
    (chartModelBasis E i) (chartModelBasis E k)).trans
    (by rw [pow_two]; exact mul_le_mul (hV i) (hV k) (Real.sqrt_nonneg _) (by positivity))

omit [MeasurableSpace E] [BorelSpace E] [I.Boundaryless] [T2Space M] in
/-- A model metric agreeing with the physical pullback inherits its chart entry derivative bound. -/
theorem bourModelGram_fderiv_bound_of_pullback
    {g : SmoothRiemannianMetric I M} {x : M} {r L : ℝ} {A γ : ℝ≥0}
    (b : BourHarmonicChart g x L A γ) (G : SmoothRiemannianMetric ι E)
    (hPull : ∀ z ∈ Metric.ball (0 : E) (3 * r), ∀ v w : E,
      G.inner z v w = g.inner (b.chart z)
        (mfderiv ι I (b.chart : E → M) z v) (mfderiv ι I (b.chart : E → M) z w))
    (i k : J) {z : E} (hz : z ∈ Metric.ball (0 : E) (3 * r)) (hs : z ∈ b.chart.source) :
    ‖fderiv ℝ (chartGramOnE G 0 i k) z‖ ≤ (A : ℝ) := by
  have heq : chartGramOnE G 0 i k =ᶠ[𝓝 z] bourHarmonicPullbackEntry g b.chart i k := by
    filter_upwards [Metric.isOpen_ball.mem_nhds hz] with w hw
    rw [model_gram_entry]
    exact hPull w hw _ _
  rw [heq.fderiv_eq]
  exact b.first_jet_bound i k z hs

/-- A common flat estimate for frozen inverse Gram matrices gives one
coordinate Hessian bound on the actual smaller metric balls of E50.
The flat supplier takes only an upper bound on the frozen primal
quadratic form. The metric and chart are chosen after the bound. -/
theorem bourUniformHarmonicMetricHessian_bound
    (μ : Measure E) [IsFiniteMeasureOnCompacts μ] {p : ℝ≥0∞} (hp : 1 ≤ p)
    {r L K : ℝ} (hr : 0 < r) (hL : 0 < L) (hK : 0 ≤ K) (A γ C₀ : ℝ≥0)
    (hFlat : ∀ (G : SmoothRiemannianMetric ι E) (z : E),
      (∀ v : E, G.inner z v v ≤ L ^ 2 * ‖v‖ ^ 2) →
      BourFlatHessianEstimate μ p (fun i j => chartInvGramOnE G 0 i j z) C₀) :
    ∃ C : ℝ≥0∞, C < ⊤ ∧
      ∀ (g : SmoothRiemannianMetric I M) (x : M) (b : BourHarmonicChart g x L A γ),
        b.chart.source = Metric.ball (0 : E) (4 * r) →
        (∀ z ∈ Metric.ball (0 : E) (3 * r), Real.sqrt (intrinsicCurvatureSq g (b.chart z)) ≤ K) →
        ∃ G : SmoothRiemannianMetric ι E,
          (∀ z ∈ Metric.ball (0 : E) (3 * r), ∀ v w : E,
            G.inner z v w = g.inner (b.chart z)
              (mfderiv ι I (b.chart : E → M) z v) (mfderiv ι I (b.chart : E → M) z w)) ∧
          ∀ i k : J, eLpNorm (iteratedFDeriv ℝ 2 (chartGramOnE G 0 i k)) p
            (μ.restrict (Metric.ball (0 : E) (5 * r / 2))) ≤ C := by
  obtain ⟨F, -, hModels⟩ :=
    bourUniformHarmonicMetricTrace_bound (I := I) (M := M) hr hL hK A γ
  obtain ⟨D, hD, hControl⟩ := bourMetricInverse_entry_controls (E := E) (r := r) (A := A) hL
  let B := ∑ i : J, ‖chartModelBasis E i‖
  have hB : 0 ≤ B := Finset.sum_nonneg fun _ _ => norm_nonneg _
  have hAxis (i : J) : ‖chartModelBasis E i‖ ≤ B :=
    Finset.single_le_sum (fun j _ => norm_nonneg (chartModelBasis E j)) (Finset.mem_univ i)
  let U := (L * B) ^ 2
  let m := (Module.finrank ℝ E : ℝ) ^ 2 * D ^ 2 * (A : ℝ)
  let v := (C₀ : ℝ) * m * B ^ 2
  have hv : 0 ≤ v := by dsimp [v, m]; positivity
  let ρ := min (r / 4) (1 / (2 * (1 + v)))
  have hρ : 0 < ρ := lt_min (by positivity) (by positivity)
  have hρr : ρ ≤ r / 4 := min_le_left _ _
  have hSmallReal : (C₀ : ℝ) * ((m * ρ) * B ^ 2) ≤ 1 / 2 := by
    calc
      _ = v * ρ := by dsimp [v]; ring
      _ ≤ (1 + v) * ρ := by gcongr; linarith
      _ ≤ 1 / 2 := by
        have h := (le_div_iff₀ (show 0 < 2 * (1 + v) by positivity)).mp
          (show ρ ≤ 1 / (2 * (1 + v)) from min_le_right _ _)
        nlinarith only [h]
  have hSmall : (C₀ : ℝ≥0∞) * ENNReal.ofReal ((m * ρ) * B ^ 2) ≤ 1 / 2 := by
    have hh := ENNReal.ofReal_le_ofReal hSmallReal
    rw [ENNReal.ofReal_mul (p := (C₀ : ℝ)) (q := (m * ρ) * B ^ 2) C₀.2,
      ENNReal.ofReal_coe_nnreal,
      ENNReal.ofReal_div_of_pos (show 0 < (2 : ℝ) by norm_num)] at hh
    simpa only [ENNReal.ofReal_one, ENNReal.ofReal_ofNat] using hh
  obtain ⟨N, hCover⟩ := bourFiniteCover_hessianLp μ hp (r := r) (half_pos hρ)
  let S := F + (Module.finrank ℝ E : ℝ) ^ 2 * D *
    (U * (ballCutoffFDeriv2Bound (ρ / 2) ρ * B * B) +
     2 * (ballCutoffFDerivBound (ρ / 2) ρ * B) * ((A : ℝ) * B))
  let C := (2 * (C₀ : ℝ≥0∞)) *
    (μ (Metric.ball (0 : E) (3 * r)) ^ p.toReal⁻¹ * ENNReal.ofReal S)
  have hμ : μ (Metric.ball (0 : E) (3 * r)) < ⊤ :=
    (measure_mono Metric.ball_subset_closedBall).trans_lt
      (isCompact_closedBall (0 : E) (3 * r)).measure_lt_top
  have hC : C < ⊤ := by
    unfold C
    have hVol : μ (Metric.ball (0 : E) (3 * r)) ^ p.toReal⁻¹ < ⊤ :=
      ENNReal.rpow_lt_top_of_nonneg (inv_nonneg.mpr ENNReal.toReal_nonneg) hμ.ne
    exact ENNReal.mul_lt_top (ENNReal.mul_lt_top (by norm_num) ENNReal.coe_lt_top)
      (ENNReal.mul_lt_top hVol ENNReal.ofReal_lt_top)
  refine ⟨(N : ℝ≥0∞) * C, ENNReal.mul_lt_top (by simp) hC, ?_⟩
  intro g x b hSource hRm
  obtain ⟨G, hPull, hTrace⟩ := hModels g x b hSource hRm
  refine ⟨G, hPull, ?_⟩
  let a (z : E) : Matrix J J ℝ := fun i j => chartInvGramOnE G 0 i j z
  have hSub (z : E) (hz : z ∈ Metric.ball (0 : E) (3 * r)) : z ∈ b.chart.source := by
    rw [hSource]
    exact Metric.ball_subset_ball (by linarith) hz
  have hForm (z : E) (hz : z ∈ Metric.ball (0 : E) (3 * r)) (w : E) :
      L⁻¹ ^ 2 * ‖w‖ ^ 2 ≤ G.inner z w w ∧ G.inner z w w ≤ L ^ 2 * ‖w‖ ^ 2 := by
    rw [hPull z hz w w]
    exact b.metric_bounds z (hSub z hz) w
  have hGrad (i j : J) (z : E) (hz : z ∈ Metric.ball (0 : E) (3 * r)) :
      ‖fderiv ℝ (chartGramOnE G 0 i j) z‖ ≤ (A : ℝ) := by
    exact bourModelGram_fderiv_bound_of_pullback b G hPull i j hz (hSub z hz)
  obtain ⟨hEntry, hOsc⟩ := hControl G (fun z hz w => (hForm z hz w).1) hGrad
  intro i k
  let u := chartGramOnE G 0 i k
  have hu : ContDiff ℝ ∞ u := model_gram_smooth G i k
  apply hCover u hu C
  intro z hz
  have hz₀ : z ∈ Metric.ball (0 : E) (3 * r) :=
    Metric.closedBall_subset_ball (by linarith) hz
  refine localized_hessian_bound μ hp hr hρ hρr z hz a
    (fun i j => (model_inv_smooth G i j).continuous) C₀
    (hFlat G z (fun w => (hForm z hz₀ w).2)) (δ := m * ρ)
    hD A.2 hB (sq_nonneg _) hAxis (fun x hx i j => hEntry i j x hx) hSmall
    ?_ u hu ?_ (hGrad i k) ?_
  · intro w hw i j
    have hw₀ : w ∈ Metric.ball (0 : E) (3 * r) := by
      change dist w 0 < 3 * r
      linarith [dist_triangle w z 0, Metric.mem_closedBall.mp hw, Metric.mem_closedBall.mp hz]
    rw [Real.norm_eq_abs]
    exact (hOsc i j z hz₀ w hw₀).trans
      (mul_le_mul_of_nonneg_left (Metric.mem_closedBall.mp hw) (by positivity))
  · intro z hz
    exact model_gram_abs_bound_of_form G z hL hB hAxis (fun w => (hForm z hz w).2) i k
  · intro z hz
    rw [bourFlatOperator_eq_partialDeriv _ _ _ hu.contDiffAt]
    exact hTrace z hz i k


/-- Uniform three-term \(W^{2,p}\) bound with the classical derivatives of
the smooth metric entries. The first two terms use the same physical
patch as the Hessian term. -/
theorem bourUniformHarmonicMetricW2_bound
    (μ : Measure E) [IsFiniteMeasureOnCompacts μ] {p : ℝ≥0∞} (hp : 1 ≤ p)
    {r L K : ℝ} (hr : 0 < r) (hL : 0 < L) (hK : 0 ≤ K) (A γ C₀ : ℝ≥0)
    (hFlat : ∀ (G : SmoothRiemannianMetric ι E) (z : E),
      (∀ v : E, G.inner z v v ≤ L ^ 2 * ‖v‖ ^ 2) →
      BourFlatHessianEstimate μ p (fun i j => chartInvGramOnE G 0 i j z) C₀) :
    let V := Metric.ball (0 : E) (5 * r / 2)
    ∃ C : ℝ≥0∞, C < ⊤ ∧
      ∀ (g : SmoothRiemannianMetric I M) (x : M) (b : BourHarmonicChart g x L A γ),
        b.chart.source = Metric.ball (0 : E) (4 * r) →
        (∀ z ∈ Metric.ball (0 : E) (3 * r), Real.sqrt (intrinsicCurvatureSq g (b.chart z)) ≤ K) →
        ∃ G : SmoothRiemannianMetric ι E,
          (∀ z ∈ Metric.ball (0 : E) (3 * r), ∀ v w : E,
            G.inner z v w = g.inner (b.chart z)
              (mfderiv ι I (b.chart : E → M) z v) (mfderiv ι I (b.chart : E → M) z w)) ∧
          ∀ i k : J,
            let u := chartGramOnE G 0 i k
            eLpNorm u p (μ.restrict V) +
              eLpNorm (fderiv ℝ u) p (μ.restrict V) +
              eLpNorm (iteratedFDeriv ℝ 2 u) p (μ.restrict V) ≤ C := by
  obtain ⟨C₂, hC₂, hMetric⟩ :=
    bourUniformHarmonicMetricHessian_bound (I := I) (M := M) μ hp hr hL hK A γ C₀ hFlat
  let V := Metric.ball (0 : E) (5 * r / 2)
  let B := ∑ i : J, ‖chartModelBasis E i‖
  have hB : 0 ≤ B := Finset.sum_nonneg fun _ _ => norm_nonneg _
  have hAxis (i : J) : ‖chartModelBasis E i‖ ≤ B :=
    Finset.single_le_sum (fun j _ => norm_nonneg (chartModelBasis E j)) (Finset.mem_univ i)
  let d := μ V ^ p.toReal⁻¹
  have hμ : μ V < ⊤ :=
    (measure_mono Metric.ball_subset_closedBall).trans_lt
      (isCompact_closedBall (0 : E) (5 * r / 2)).measure_lt_top
  have hd : d < ⊤ :=
    ENNReal.rpow_lt_top_of_nonneg (inv_nonneg.mpr ENNReal.toReal_nonneg) hμ.ne
  let C₀' := d * ENNReal.ofReal ((L * B) ^ 2)
  let C₁ := d * ENNReal.ofReal (A : ℝ)
  have hC₀' : C₀' < ⊤ := ENNReal.mul_lt_top hd ENNReal.ofReal_lt_top
  have hC₁ : C₁ < ⊤ := ENNReal.mul_lt_top hd ENNReal.ofReal_lt_top
  refine ⟨C₀' + C₁ + C₂, ENNReal.add_lt_top.2 ⟨ENNReal.add_lt_top.2 ⟨hC₀', hC₁⟩, hC₂⟩, ?_⟩
  intro g x b hSource hRm
  obtain ⟨G, hPull, hHess⟩ := hMetric g x b hSource hRm
  refine ⟨G, hPull, ?_⟩
  intro i k
  let u := chartGramOnE G 0 i k
  have hu : ContDiff ℝ ∞ u := model_gram_smooth G i k
  have hMeas : MeasurableSet V := Metric.isOpen_ball.measurableSet
  have hz₀ : V ⊆ Metric.ball (0 : E) (3 * r) := Metric.ball_subset_ball (by linarith)
  have hSrc (z : E) (hz : z ∈ V) : z ∈ b.chart.source := by
    rw [hSource]
    exact Metric.ball_subset_ball (by linarith) hz
  have h0 : eLpNorm u p (μ.restrict V) ≤ C₀' := by
    unfold C₀' d
    rw [← Measure.restrict_apply_univ]
    apply eLpNorm_le_of_ae_bound hu.continuous.aestronglyMeasurable
    filter_upwards [ae_restrict_mem (μ := μ) hMeas] with z hz
    rw [Real.norm_eq_abs]
    apply model_gram_abs_bound_of_form G z hL hB hAxis (fun w => ?_) i k
    rw [hPull z (hz₀ hz) w w]
    exact (b.metric_bounds z (hSrc z hz) w).2
  have h1 : eLpNorm (fderiv ℝ u) p (μ.restrict V) ≤ C₁ := by
    unfold C₁ d
    rw [← Measure.restrict_apply_univ]
    apply eLpNorm_le_of_ae_bound (hu.continuous_fderiv (by simp)).aestronglyMeasurable
    filter_upwards [ae_restrict_mem (μ := μ) hMeas] with z hz
    exact bourModelGram_fderiv_bound_of_pullback b G hPull i k (hz₀ hz) (hSrc z hz)
  exact add_le_add (add_le_add h0 h1) (hHess i k)


/-- The actual metric interior estimate with a single flat analytic input.
The Euclidean Laplacian estimate is for smooth compactly supported tests
and for the same Haar measure and finite exponent throughout. -/
theorem bourUniformHarmonicMetricW2_of_flatLaplacian
    (μ : Measure E) [Measure.IsAddHaarMeasure μ] {p : ℝ≥0∞}
    (hp : 1 ≤ p) (hpTop : p ≠ ⊤)
    {r L K : ℝ} (hr : 0 < r) (hL : 0 < L) (hK : 0 ≤ K) (A γ CΔ : ℝ≥0)
    (hLap : ∀ u : E → ℝ, ContDiff ℝ ∞ u → HasCompactSupport u →
      eLpNorm (iteratedFDeriv ℝ 2 u) p μ ≤ (CΔ : ℝ≥0∞) * eLpNorm (Δ u) p μ) :
    let V := Metric.ball (0 : E) (5 * r / 2)
    ∃ C : ℝ≥0∞, C < ⊤ ∧
      ∀ (g : SmoothRiemannianMetric I M) (x : M) (b : BourHarmonicChart g x L A γ),
        b.chart.source = Metric.ball (0 : E) (4 * r) →
        (∀ z ∈ Metric.ball (0 : E) (3 * r), Real.sqrt (intrinsicCurvatureSq g (b.chart z)) ≤ K) →
        ∃ G : SmoothRiemannianMetric ι E,
          (∀ z ∈ Metric.ball (0 : E) (3 * r), ∀ v w : E,
            G.inner z v w = g.inner (b.chart z)
              (mfderiv ι I (b.chart : E → M) z v) (mfderiv ι I (b.chart : E → M) z w)) ∧
          ∀ i k : J,
            let u := chartGramOnE G 0 i k
            eLpNorm u p (μ.restrict V) +
              eLpNorm (fderiv ℝ u) p (μ.restrict V) +
              eLpNorm (iteratedFDeriv ℝ 2 u) p (μ.restrict V) ≤ C := by
  let Cscale : ℝ≥0 := ⟨L ^ 2, sq_nonneg L⟩
  let C₀ : ℝ≥0 := Cscale * CΔ
  refine bourUniformHarmonicMetricW2_bound μ hp hr hL hK A γ C₀ ?_
  intro G z hform
  have h := bourFlatHessianEstimate_metricFrozen μ p (zero_lt_one.trans_le hp).ne' hpTop
    G z hL.le hform (CΔ : ℝ≥0∞) hLap
  have hScale : ENNReal.ofReal (L ^ 2) = (Cscale : ℝ≥0∞) := by
    change ENNReal.ofReal (Cscale : ℝ) = (Cscale : ℝ≥0∞)
    exact ENNReal.ofReal_coe_nnreal
  simpa only [C₀, ENNReal.coe_mul, hScale] using h

end SmoothPoincare
