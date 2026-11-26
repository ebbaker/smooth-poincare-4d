import SmoothPoincare.Variational.TerminalChargeTransfer
import DifferentialGeometry.Geometry.Curvature.Naturality.Pullback.LocalIterCov
import DifferentialGeometry.Geometry.Measure.LocalIsometry

/-! # Naturality of the intrinsic terminal trace-free Ricci charge -/

open DifferentialGeometry DifferentialGeometry.Geometry.Curvature
  DifferentialGeometry.Geometry.Metric DifferentialGeometry.Integral.Measure
  DifferentialGeometry.PDE.RicciFlow DifferentialGeometry.Tensor0SBundle
  FirstOrderTwistor MeasureTheory Set Filter Manifold
open scoped Manifold ContDiff Topology ENNReal

noncomputable section
namespace SmoothPoincare

variable {E H : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
  [FiniteDimensional ℝ E] [TopologicalSpace H] {I : ModelWithCorners ℝ E H}

private local instance : CompleteSpace E := FiniteDimensional.complete ℝ E
private local instance {X : Type*} [TopologicalSpace X] : MeasurableSpace X := borel X
private local instance {X : Type*} [TopologicalSpace X] : BorelSpace X := ⟨rfl⟩

section Pullback

variable [I.Boundaryless]
variable {M N : Type*}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [T2Space M] [SigmaCompactSpace M] [BoundarylessManifold I M]
  [TopologicalSpace N] [ChartedSpace H N] [IsManifold I ∞ N]
  [T2Space N] [BoundarylessManifold I N]

/-- The intrinsic charge is natural under the actual locally pulled-back metric. -/
theorem intrinsicTraceFreeRicciSq_localPullMetric
    (g : SmoothRiemannianMetric I N) (f : M → N) (hf : IsLocalDiffeomorph I I ∞ f)
    (x : M) :
    intrinsicTraceFreeRicciSq (localPullMetric g f hf) x =
      intrinsicTraceFreeRicciSq g (f x) := by
  rw [intrinsicTraceFreeRicciSq_eq_ricciNormSq_sub_scalarSq,
    intrinsicTraceFreeRicciSq_eq_ricciNormSq_sub_scalarSq, metricScalarAt_localPull]
  have h := DifferentialGeometry.Geometry.Tensor.normSq0S_iterCov_localPullMetric g f hf
    (metricRicci (localPullMetric g f hf)) (metricRicci g)
    (fun y v => by
      simpa only [metricRicci_apply] using
        DifferentialGeometry.Geometry.Tensor.metricRicciAt_localPullMetric g f hf y v)
    0 x
  have h' : normSq0S (localPullMetric g f hf) x 2 (metricRicciAt (localPullMetric g f hf) x)
      = normSq0S g (f x) 2 (metricRicciAt g (f x)) := by
    simpa only [add_zero, DifferentialGeometry.CheegerGromovCompactness.iterCov_zero,
      metricRicci_apply] using h
  rw [h']

/-- Real-valued change of variables on a measured part of an actual comparison
embedding. -/
theorem integral_intrinsicTraceFreeRicciSq_image [SigmaCompactSpace N]
    (g : SmoothRiemannianMetric I N) (f : M → N) (hf : IsLocalDiffeomorph I I ∞ f)
    (hinj : Function.Injective f) (K : Set M) :
    (∫ y in f '' K, intrinsicTraceFreeRicciSq g y ∂riemannianVolumeMeasure I N g) =
      ∫ x in K, intrinsicTraceFreeRicciSq (localPullMetric g f hf) x
        ∂riemannianVolumeMeasure I M (localPullMetric g f hf) := by
  have hopen : Topology.IsOpenEmbedding f :=
    .of_continuous_injective_isOpenMap hf.contMDiff.continuous hinj hf.isOpenMap
  rw [← DifferentialGeometry.Geometry.Measure.riemannianVolumeMeasure_map_restrict_of_injective_local_isometry
    (localPullMetric g f hf) g f hf hinj (localPullMetric_inner g f hf) K]
  rw [hopen.measurableEmbedding.integral_map]
  simp_rw [intrinsicTraceFreeRicciSq_localPullMetric]

end Pullback

end SmoothPoincare
