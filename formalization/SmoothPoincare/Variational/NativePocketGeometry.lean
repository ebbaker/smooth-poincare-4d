import SmoothPoincare.Variational.NativePocketFrameBounds
import SmoothPoincare.Variational.NativePocketSobolev

/-! # One native reference with physical volume and curvature bounds -/

open DifferentialGeometry DifferentialGeometry.Geometry DifferentialGeometry.Geometry.Curvature
open DifferentialGeometry.Integral.Measure
open FirstOrderTwistor MeasureTheory Manifold Set
open scoped ContDiff Manifold

namespace SmoothPoincare

noncomputable section

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "I₄" => 𝓘(ℝ, E₄)

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M] [SigmaCompactSpace M]
private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

/-- Choose the Euclidean reference once, and use its metric germ for
both the curvature estimate and the physical volume bound. The half-buffer
keeps the closed change ball strictly inside the Euclidean germ. -/
theorem exists_nativePocket_geometry_bounds
    (F : PartialDiffeomorph I₄ I E₄ M ∞) (g : SmoothRiemannianMetric I M)
    {R₀ : ℝ} (hR₀ : 0 < R₀) (hBuffer : Metric.closedBall (0 : E₄) R₀ ⊆ F.source)
    (hZero : ∀ v w : E₄, nativePocketMetricCoefficient F g v w 0 = inner ℝ v w)
    (o : ManifoldOrientation I M 4) :
    ∃ (R : SmoothRiemannianMetric I M) (U : TopologicalSpace.Opens E₄) (V K : ℝ),
      0 ≤ V ∧ 0 ≤ K ∧ Metric.closedBall (0 : E₄) (R₀ / 2) ⊆ U ∧ (U : Set E₄) ⊆ F.source ∧
      (∀ x ∈ U, ∀ v w : E₄, nativePocketMetricCoefficient F R v w x = inner ℝ v w) ∧
      ∀ {r : ℝ} (hr : 0 < r), r ≤ 1 → ∀ (hBound : 3 * r ≤ R₀ / 2) (s : Icc (0 : ℝ) 1),
        let hS := (Metric.closedBall_subset_closedBall
          (hBound.trans (by linarith : R₀ / 2 ≤ R₀))).trans hBuffer
        let P := nativePocketPath F g R hr hS s
        let A := F '' Metric.closedBall (0 : E₄) (3 * r)
        (riemannianVolumeMeasure I M P).real A ≤ V * r ^ 4 ∧
          ∀ y ∈ A, ∀ frame : OrientedOrthonormalFrameAt P o y,
            frameTensorNormSq (metricCurvatureFrameTensor P o y frame) ≤ (K / r) ^ 2 ∧
            ((∀ v w : E₄, fderiv ℝ (nativePocketMetricCoefficient F g v w) 0 = 0) →
              frameTensorNormSq (metricCurvatureFrameTensor P o y frame) ≤ K ^ 2) := by
  obtain ⟨R, V, hV, hReference, hVolume⟩ := exists_nativePocket_volume_bound g F hBuffer
  let U : TopologicalSpace.Opens E₄ := ⟨Metric.ball 0 R₀, Metric.isOpen_ball⟩
  have hHalf : R₀ / 2 < R₀ := by linarith
  have hBU : Metric.closedBall (0 : E₄) (R₀ / 2) ⊆ U := Metric.closedBall_subset_ball hHalf
  have hUS : (U : Set E₄) ⊆ F.source := Metric.ball_subset_closedBall.trans hBuffer
  have hFlat (x : E₄) (hx : x ∈ U) (v w : E₄) :
      nativePocketMetricCoefficient F R v w x = inner ℝ v w := by
    have h := (hReference x (Metric.ball_subset_closedBall hx) v w).symm
    exact h
  have h0 (v w : E₄) : nativePocketMetricCoefficient F g v w 0 =
      nativePocketMetricCoefficient F R v w 0 :=
    (hZero v w).trans (hFlat 0 (Metric.mem_ball_self hR₀) v w).symm
  have hHalfSource := hBU.trans hUS
  obtain ⟨D, hD, hCurvature⟩ := exists_nativePocketPath_frameTensorNormSq_bounds
    F g R (by positivity : 0 ≤ R₀ / 2) hHalfSource U hBU hFlat h0 o
  refine ⟨R, U, V, Real.sqrt D, hV, Real.sqrt_nonneg D, hBU, hUS, hFlat, ?_⟩
  intro r hr hr₁ hBound s hS P A
  refine ⟨hVolume hr (hBound.trans hHalf.le) s, ?_⟩
  intro y hy frame
  simpa only [div_pow, Real.sq_sqrt hD] using hCurvature s hr hr₁ hBound y hy frame

/-- At sufficiently small radii, every signed realization of the actual
native slice with the incoming exterior frames is positive and subcritical.
The original scalar floor controls the fixed-source Sobolev comparison. -/
theorem exists_nativePocket_positive_geometry_bounds [CompactSpace M] [Nonempty M]
    {o : ManifoldOrientation I M 4}
    (F : PartialDiffeomorph I₄ I E₄ M ∞) (g : SignedCollarMetric o)
    {R₀ : ℝ} (hR₀ : 0 < R₀) (hBuffer : Metric.closedBall (0 : E₄) R₀ ⊆ F.source)
    (hZero : ∀ v w : E₄, nativePocketMetricCoefficient F g.metric v w 0 = inner ℝ v w)
    {ρ η T : ℝ} (hρ : 0 < ρ) (hFloor : ∀ y, ρ ≤ metricScalarAt g.metric y)
    (hη : 0 < η) (hGap : g.energy .plus + η < 2 * T) :
    ∃ (R : SmoothRiemannianMetric I M) (U : TopologicalSpace.Opens E₄) (r₀ V K : ℝ),
      0 < r₀ ∧ r₀ ≤ 1 ∧ 3 * r₀ ≤ R₀ / 2 ∧ 0 ≤ V ∧ 0 ≤ K ∧
      Metric.closedBall (0 : E₄) (R₀ / 2) ⊆ U ∧ (U : Set E₄) ⊆ F.source ∧
      (∀ x ∈ U, ∀ v w : E₄, nativePocketMetricCoefficient F R v w x = inner ℝ v w) ∧
      ∀ {r : ℝ} (hr : 0 < r), r ≤ r₀ →
        ∀ (hS : Metric.closedBall (0 : E₄) (3 * r) ⊆ F.source)
          (s : Icc (0 : ℝ) 1) (h : SignedCollarMetric o),
        let A := F '' Metric.closedBall (0 : E₄) (3 * r)
        h.metric = nativePocketPath F g.metric R hr hS s →
        (∀ x ∉ A, (g.frame x).basis = (h.frame x).basis) →
        0 < classYamabeFour o.dimension_eq h.metric ∧
          (∀ sg, h.energy sg ≤ g.energy sg - g.charge sg A + K ^ 2 * V * r ^ 2 / 4) ∧
          ∀ sg, h.energy sg < g.energy sg + η ∧ h.energy sg < 2 * T := by
  obtain ⟨R, U, V, K, hV, hK, hBU, hUS, hFlat, hGeom⟩ :=
    exists_nativePocket_geometry_bounds F g.metric hR₀ hBuffer hZero o
  obtain ⟨S, hSpos, hSlice⟩ := exists_nativePocket_positive_slice_bounds g R hρ
  let Y := min ρ 6 / S
  let B := (ρ + Real.sqrt 6 * K) * Real.sqrt V
  let E := K ^ 2 * V / 4
  have hY : 0 < Y := by unfold Y; exact div_pos (lt_min hρ (by norm_num)) hSpos
  have hB : 0 ≤ B := by unfold B; positivity
  have hE : 0 ≤ E := by unfold E; positivity
  let r₀ := min (min 1 (R₀ / 6)) (min (Y / (2 * (B + 1))) (η / (2 * (E + 1))))
  have hr₀ : 0 < r₀ := by
    unfold r₀
    exact lt_min (lt_min (by norm_num) (by positivity))
      (lt_min (by positivity) (by positivity))
  have hr₁ : r₀ ≤ 1 := (min_le_left _ _).trans (min_le_left _ _)
  have hrB : 3 * r₀ ≤ R₀ / 2 := by
    have h : r₀ ≤ R₀ / 6 := (min_le_left _ _).trans (min_le_right _ _)
    linarith only [h]
  refine ⟨R, U, r₀, V, K, hr₀, hr₁, hrB, hV, hK, hBU, hUS, hFlat, ?_⟩
  intro r hr hrSmall hS s h A hPath hFrame
  have hr1 := hrSmall.trans hr₁
  have hrBound : 3 * r ≤ R₀ / 2 := le_trans (mul_le_mul_of_nonneg_left hrSmall (by norm_num)) hrB
  obtain ⟨hVol, hCurv⟩ := hGeom hr hr1 hrBound s
  have hVol' : (riemannianVolumeMeasure I M h.metric).real A ≤ V * r ^ 4 := by
    rw [hPath]
    exact hVol
  have hCurv' : ∀ x ∈ A,
      frameTensorNormSq (metricCurvatureFrameTensor h.metric o x (h.frame x)) ≤ (K/r)^2 := by
    intro x hx
    have hTransfer (q : SmoothRiemannianMetric I M)
        (hq : q = nativePocketPath F g.metric R hr hS s) (fr : OrientedOrthonormalFrameAt q o x) :
        frameTensorNormSq (metricCurvatureFrameTensor q o x fr) ≤ (K/r)^2 := by
      subst q
      exact (hCurv x hx fr).1
    exact hTransfer h.metric hPath (h.frame x)
  obtain ⟨_, hEnergy, hPos⟩ := hSlice F hr hr1 hS s h hPath hFrame (fun x _ => hFloor x)
    hK hV hCurv' hVol'
  have hrPriceY : r ≤ Y / (2 * (B + 1)) :=
    hrSmall.trans ((min_le_right _ _).trans (min_le_left _ _))
  have hDeficit : B * r < Y := by
    have h := (le_div_iff₀ (by positivity : 0 < 2 * (B + 1))).1 hrPriceY
    nlinarith only [h, hr.le, hY]
  have hrPriceE : r ≤ η / (2 * (E + 1)) :=
    hrSmall.trans ((min_le_right _ _).trans (min_le_right _ _))
  have hPrice : K ^ 2 * V * r ^ 2 / 4 < η := by
    have h := (le_div_iff₀ (by positivity : 0 < 2 * (E + 1))).1 hrPriceE
    have ht : E * r ^ 2 ≤ E * r := by
      simpa only [pow_two, ← mul_assoc] using mul_le_of_le_one_right (mul_nonneg hE hr.le) hr1
    rw [show K ^ 2 * V * r ^ 2 / 4 = E * r ^ 2 by unfold E; ring]
    nlinarith only [ht, h, hr.le, hη]
  have hSig (sg : CollarChirality) : g.energy sg = g.energy .plus := by
    cases sg
    · exact rfl
    · exact g.signature_zero.symm
  refine ⟨hPos hDeficit, hEnergy, fun sg => ?_⟩
  have hCharge : 0 ≤ g.charge sg A := measureReal_nonneg
  have hNear : h.energy sg < g.energy sg + η := by
    linarith only [hEnergy sg, hCharge, hPrice]
  exact ⟨hNear, (hNear.trans_eq (congrArg (· + η) (hSig sg))).trans hGap⟩

end

end SmoothPoincare
