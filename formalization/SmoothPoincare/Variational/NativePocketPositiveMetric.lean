import SmoothPoincare.Variational.NativePocketGeometry
import SmoothPoincare.Variational.NativePocketSignedSlices

/-! # Yamabe positivity of the actual native pocket metrics -/

open DifferentialGeometry DifferentialGeometry.Geometry DifferentialGeometry.Geometry.Curvature
open DifferentialGeometry.Integral.Measure FirstOrderTwistor Filter Manifold MeasureTheory Set
open scoped ContDiff Manifold Topology

namespace SmoothPoincare

noncomputable section

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "I₄" => 𝓘(ℝ, E₄)

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H}
  [I.Boundaryless] [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [T2Space M] [CompactSpace M] {o : ManifoldOrientation I M 4}

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

/-- Scalar curvature is unchanged on the complement of the actual native
change ball. The pointwise frames on the two metrics agree there. -/
theorem nativePocketPath_scalar_eq_outside
    (F : PartialDiffeomorph I₄ I E₄ M ∞) (g : SignedCollarMetric o)
    (R : SmoothRiemannianMetric I M) {r : ℝ} (hr : 0 < r)
    (hS : Metric.closedBall (0 : E₄) (3*r) ⊆ F.source) (s : Icc (0 : ℝ) 1)
    {x : M} (hx : x ∉ F '' Metric.closedBall (0 : E₄) (3*r)) :
    metricScalarAt (nativePocketPath F g.metric R hr hS s) x = metricScalarAt g.metric x := by
  let P := nativePocketPath F g.metric R hr hS s
  let f := nativePocketPath_frame F g R hr hS s x
  have hOff : x ∉ F '' Metric.ball (0 : E₄) (3*r) :=
    fun h => hx (image_mono Metric.ball_subset_closedBall h)
  have hGerm := nativePocketPath_outer_germ F g.metric R hr hS s hOff
  have hRm := metricRm04At_eq_of_metric_eventuallyEq P g.metric x hGerm
  have hFrame : f.basis = (g.frame x).basis := nativePocketPath_frame_outer F g R hr hS s hx
  have hTensor : metricCurvatureFrameTensor P o x f = metricCurvatureFrameTensor g.metric o x (g.frame x) := by
    funext i j k l
    change metricRm04StandardAt P x (f.basis i) (f.basis j) (f.basis l) (f.basis k) =
      metricRm04StandardAt g.metric x ((g.frame x).basis i) ((g.frame x).basis j)
        ((g.frame x).basis l) ((g.frame x).basis k)
    simp only [metricRm04StandardAt_apply, hFrame, hRm]
  simpa only [frameScalarCurvature_metric] using congrArg frameScalarCurvature hTensor

variable [Nonempty M]

/-- One Sobolev constant controls the Yamabe lower bound on the native
metrics themselves. The scalar shortfall is estimated on the changed closed
ball using that slice's physical volume and pointwise curvature. -/
theorem exists_nativePocket_rawYamabe_slice_bounds (g : SignedCollarMetric o)
    (R : SmoothRiemannianMetric I M) {ρ : ℝ} (hρ : 0 < ρ) :
    ∃ S : ℝ, 0 < S ∧ ∀ (F : PartialDiffeomorph I₄ I E₄ M ∞)
      {r : ℝ} (hr : 0 < r) (_hr₁ : r ≤ 1)
      (hS : Metric.closedBall (0 : E₄) (3*r) ⊆ F.source) (s : Icc (0 : ℝ) 1),
      let A := F '' Metric.closedBall (0 : E₄) (3*r)
      let P := nativePocketPath F g.metric R hr hS s
      let f := nativePocketPath_frame F g R hr hS s
      (∀ x ∉ A, ρ ≤ metricScalarAt g.metric x) →
      ∀ {K V : ℝ}, 0 ≤ K → 0 ≤ V →
        (∀ x ∈ A, frameTensorNormSq (metricCurvatureFrameTensor P o x (f x)) ≤ (K/r)^2) →
        (riemannianVolumeMeasure I M P).real A ≤ V * r^4 →
        min ρ 6 / S - (ρ + Real.sqrt 6 * K) * Real.sqrt V * r ≤ classYamabeFour o.dimension_eq P := by
  obtain ⟨S, hSpos, hSob⟩ := exists_nativePocket_uniformSobolev g.metric R
  refine ⟨S, hSpos, ?_⟩
  intro F r hr hr₁ hS s A P f hFloor K V hK hV hCurv hVol
  have hCoercive := classYamabeFour_lower_of_scalarFloorDeficit o.dimension_eq P hρ.le hSpos (hSob F hr hS s)
  have hA : MeasurableSet A := ((isCompact_closedBall _ _).image_of_continuousOn
    (F.contMDiffOn_toFun.continuousOn.mono hS)).measurableSet
  have hExterior (x : M) (hx : x ∉ A) : ρ ≤ metricScalarAt P x :=
    (hFloor x hx).trans_eq (nativePocketPath_scalar_eq_outside F g R hr hS s hx).symm
  let B := ρ + Real.sqrt 6 * K
  have hB : 0 ≤ B := add_nonneg hρ.le (mul_nonneg (Real.sqrt_nonneg _) hK)
  have hInside (x : M) (hx : x ∈ A) : ρ - metricScalarAt P x ≤ B / r := by
    have hSplit := metricFrameTensorNormSq_eq_chiral_ricci_scalar P o x (f x)
    have hPlus := modifiedChargeDensity_nonneg o P f .plus x
    have hMinus := modifiedChargeDensity_nonneg o P f .minus x
    have hRic := modifiedChargeDensity_nonneg o P f .ricci x
    dsimp only [modifiedChargeDensity] at hPlus hMinus hRic
    have hScalar : metricScalarAt P x ^ 2 ≤ 6 * (K/r)^2 :=
      by linarith only [hSplit, hPlus, hMinus, hRic, hCurv x hx]
    have hAbs : |metricScalarAt P x| ≤ Real.sqrt 6 * (K/r) := by
      apply le_of_pow_le_pow_left₀ (n := 2) (by decide) (by positivity)
      rwa [sq_abs, mul_pow, Real.sq_sqrt (by norm_num : (0 : ℝ) ≤ 6)]
    have hScaled := mul_le_mul_of_nonneg_right ((neg_le_abs (metricScalarAt P x)).trans hAbs) hr.le
    rw [mul_assoc, div_mul_cancel₀ _ hr.ne'] at hScaled
    apply (le_div_iff₀ hr).2
    dsimp [B]
    linarith only [hScaled, mul_le_of_le_one_right hρ.le hr₁]
  have hDeficit : scalarFloorDeficitNorm P ρ ≤ B * Real.sqrt V * r := by
    apply le_of_pow_le_pow_left₀ (n := 2) (by decide) (by positivity)
    refine ((scalarFloorDeficitNorm_sq_le_of_floor_off P hA (div_nonneg hB hr.le)
      hExterior hInside).trans (mul_le_mul_of_nonneg_left hVol (sq_nonneg _))).trans_eq ?_
    rw [mul_pow, mul_pow, Real.sq_sqrt hV]
    field_simp
  exact (sub_le_sub_left hDeficit _).trans hCoercive

/-- One Euclidean reference and a positive radius threshold give a uniform
positive Yamabe lower bound for every actual native metric slice. -/
theorem exists_nativePocket_positive_metric_slices
    (F : PartialDiffeomorph I₄ I E₄ M ∞) (g : SignedCollarMetric o)
    {R₀ : ℝ} (hR₀ : 0 < R₀) (hBuffer : Metric.closedBall (0 : E₄) R₀ ⊆ F.source)
    (hZero : ∀ v w : E₄, nativePocketMetricCoefficient F g.metric v w 0 = inner ℝ v w)
    {ρ : ℝ} (hρ : 0 < ρ) (hFloor : ∀ x : M, ρ ≤ metricScalarAt g.metric x) :
    ∃ (R : SmoothRiemannianMetric I M) (U : TopologicalSpace.Opens E₄) (r₀ ε : ℝ),
      0 < r₀ ∧ r₀ ≤ 1 ∧ 3 * r₀ ≤ R₀ / 2 ∧ 0 < ε ∧
      Metric.closedBall (0 : E₄) (R₀ / 2) ⊆ U ∧ (U : Set E₄) ⊆ F.source ∧
      (∀ x ∈ U, ∀ v w : E₄, nativePocketMetricCoefficient F R v w x = inner ℝ v w) ∧
      ∀ {r : ℝ} (hr : 0 < r), r ≤ r₀ →
        ∀ (hS : Metric.closedBall (0 : E₄) (3*r) ⊆ F.source) (s : Icc (0 : ℝ) 1),
          ε ≤ classYamabeFour o.dimension_eq (nativePocketPath F g.metric R hr hS s) := by
  obtain ⟨R, U, V, K, hV, hK, hBU, hUS, hFlat, hGeom⟩ :=
    exists_nativePocket_geometry_bounds F g.metric hR₀ hBuffer hZero o
  obtain ⟨S, hSpos, hSlice⟩ := exists_nativePocket_rawYamabe_slice_bounds g R hρ
  let Y := min ρ 6 / S
  let B := (ρ + Real.sqrt 6 * K) * Real.sqrt V
  have hY : 0 < Y := div_pos (lt_min hρ (by norm_num)) hSpos
  have hB : 0 ≤ B := by unfold B; positivity
  let r₀ := min (min 1 (R₀ / 6)) (Y / (2 * (B + 1)))
  have hr₀ : 0 < r₀ := by
    unfold r₀
    exact lt_min (lt_min (by norm_num) (by positivity)) (by positivity)
  have hr₁ : r₀ ≤ 1 := (min_le_left _ _).trans (min_le_left _ _)
  have hrB : 3 * r₀ ≤ R₀ / 2 := by
    have h : r₀ ≤ R₀ / 6 := (min_le_left _ _).trans (min_le_right _ _)
    linarith only [h]
  refine ⟨R, U, r₀, Y/2, hr₀, hr₁, hrB, by positivity, hBU, hUS, hFlat, ?_⟩
  intro r hr hrSmall hS s
  have hr1 := hrSmall.trans hr₁
  have hrBound : 3 * r ≤ R₀ / 2 := (mul_le_mul_of_nonneg_left hrSmall (by norm_num)).trans hrB
  obtain ⟨hVol, hCurv⟩ := hGeom hr hr1 hrBound s
  have hLow := hSlice F hr hr1 hS s (fun x _ => hFloor x) hK hV
    (fun x hx => (hCurv x hx (nativePocketPath_frame F g R hr hS s x)).1) hVol
  have hrPrice : r ≤ Y / (2 * (B + 1)) := hrSmall.trans (min_le_right _ _)
  have hMargin : Y / 2 ≤ Y - B * r := by
    have h := (le_div_iff₀ (by positivity : 0 < 2 * (B + 1))).1 hrPrice
    nlinarith only [h, hr.le]
  exact hMargin.trans hLow

end

end SmoothPoincare
