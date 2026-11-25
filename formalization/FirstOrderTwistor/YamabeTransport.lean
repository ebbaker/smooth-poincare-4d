import DifferentialGeometry.Geometry.Metric.Conformal.Basic
import DifferentialGeometry.Geometry.Curvature.ScalarPullback
import DifferentialGeometry.Analysis.Integration.Measure.PullbackCross
import Mathlib.MeasureTheory.Integral.Bochner.Basic

/-!
# Yamabe constant under pullback on closed four-manifolds

The conformal factors are smooth real logarithms, so the metrics in the
defining infimum are obtained by multiplying the reference metric by `exp (2 * u)`.
-/

open DifferentialGeometry DifferentialGeometry.Geometry.Curvature
open DifferentialGeometry.Integral.Measure MeasureTheory
open scoped Manifold ContDiff

namespace FirstOrderTwistor

noncomputable section

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  {M : Type*} [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [T2Space M] [CompactSpace M]

private local instance : CompleteSpace E := FiniteDimensional.complete ℝ E
private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

private def normalizedTotalScalarFour (g : SmoothRiemannianMetric I M) : ℝ :=
  let μ := riemannianVolumeMeasure I M g
  (∫ x, metricScalarAt g x ∂μ) / Real.sqrt (μ Set.univ).toReal

/-- The Yamabe constant of a conformal class on a closed four-manifold,
using the scalar curvature integral divided by the square root of volume. -/
def classYamabeFour [I.Boundaryless] [Nonempty M]
    (_hDim : Module.finrank ℝ E = 4) (g : SmoothRiemannianMetric I M) : ℝ :=
  sInf (Set.range (fun u : C^∞⟮I, M; ℝ⟯ => normalizedTotalScalarFour (conformalMetric g u)))

variable {F : Type*} [NormedAddCommGroup F] [NormedSpace ℝ F] [FiniteDimensional ℝ F]
  {G : Type*} [TopologicalSpace G] {J : ModelWithCorners ℝ F G}
  {N : Type*} [TopologicalSpace N] [ChartedSpace G N] [IsManifold J ∞ N]
  [T2Space N] [CompactSpace N]

private local instance : CompleteSpace F := FiniteDimensional.complete ℝ F
private local instance : MeasurableSpace N := borel N
private local instance : BorelSpace N := ⟨rfl⟩

private def pullbackConformalFactor (Φ : M ≃ₘ⟮I, J⟯ N) (u : C^∞⟮J, N; ℝ⟯) :
    C^∞⟮I, M; ℝ⟯ :=
  ⟨fun x => u (Φ x), u.contMDiff.comp Φ.contMDiff⟩

omit [CompactSpace M] [FiniteDimensional ℝ F] [T2Space N] [CompactSpace N] in
private theorem pullback_conformalMetric (g : SmoothRiemannianMetric J N)
    (Φ : M ≃ₘ⟮I, J⟯ N) (u : C^∞⟮J, N; ℝ⟯) :
    conformalMetric (Diffeomorph.pullbackMetricCross g Φ) (pullbackConformalFactor Φ u) =
      Diffeomorph.pullbackMetricCross (conformalMetric g u) Φ := by
  apply SmoothRiemannianMetric.ext_inner
  intro x v w
  simp only [conformalMetric_inner, Diffeomorph.pullbackMetricCross_inner]
  rfl

private theorem normalizedTotalScalarFour_pullback [I.Boundaryless] [J.Boundaryless]
    [NeZero (Module.finrank ℝ E)] (g : SmoothRiemannianMetric J N)
    (Φ : M ≃ₘ⟮I, J⟯ N) :
    normalizedTotalScalarFour (Diffeomorph.pullbackMetricCross g Φ) =
      normalizedTotalScalarFour g := by
  have hScale : scaleMetric 1 zero_lt_one g = g := by
    apply SmoothRiemannianMetric.ext_inner
    intro x v w
    rw [scaleMetric_inner, one_mul]
  have hScalar (x : M) : metricScalarAt (Diffeomorph.pullbackMetricCross g Φ) x =
      metricScalarAt g (Φ x) := by
    simpa only [hScale, div_one] using
      metricScalarAt_pullback_scaleMetricCross g Φ 1 zero_lt_one x
  unfold normalizedTotalScalarFour
  dsimp only
  rw [riemannianVolumeMeasure_pullback_cross]
  have hVolume : (Measure.map (Φ.symm : N → M) (riemannianVolumeMeasure J N g)) Set.univ =
      riemannianVolumeMeasure J N g Set.univ := by
    rw [Measure.map_apply Φ.symm.continuous.measurable MeasurableSet.univ, Set.preimage_univ]
  have he : MeasurableEmbedding (Φ.symm : N → M) := Φ.symm.toHomeomorph.measurableEmbedding
  rw [hVolume, he.integral_map]
  congr 1
  apply integral_congr_ae
  exact Filter.Eventually.of_forall fun y => by
    change metricScalarAt (Diffeomorph.pullbackMetricCross g Φ) (Φ.symm y) = metricScalarAt g y
    rw [hScalar, Φ.apply_symm_apply]

/-- Pulling back a smooth Riemannian metric by a diffeomorphism preserves its
four-dimensional conformal Yamabe constant. -/
theorem classYamabeFour_pullback [I.Boundaryless] [J.Boundaryless] [Nonempty M] [Nonempty N]
    (hDimM : Module.finrank ℝ E = 4) (hDimN : Module.finrank ℝ F = 4)
    (g : SmoothRiemannianMetric J N) (Φ : M ≃ₘ⟮I, J⟯ N) :
    classYamabeFour hDimM (Diffeomorph.pullbackMetricCross g Φ) = classYamabeFour hDimN g := by
  let : NeZero (Module.finrank ℝ E) := ⟨by rw [hDimM]; decide⟩
  have hFactor (u : C^∞⟮J, N; ℝ⟯) :
      normalizedTotalScalarFour
          (conformalMetric (Diffeomorph.pullbackMetricCross g Φ) (pullbackConformalFactor Φ u)) =
        normalizedTotalScalarFour (conformalMetric g u) := by
    rw [pullback_conformalMetric, normalizedTotalScalarFour_pullback]
  unfold classYamabeFour
  congr 1
  ext r
  constructor
  · rintro ⟨u, rfl⟩
    have hBack : pullbackConformalFactor Φ (pullbackConformalFactor Φ.symm u) = u := by
      ext x
      change u (Φ.symm (Φ x)) = u x
      rw [Φ.symm_apply_apply]
    refine ⟨pullbackConformalFactor Φ.symm u, ?_⟩
    simpa only [hBack] using (hFactor (pullbackConformalFactor Φ.symm u)).symm
  · rintro ⟨u, rfl⟩
    exact ⟨pullbackConformalFactor Φ u, hFactor u⟩

end

end FirstOrderTwistor
