import SmoothPoincare.Variational.TerminalChargeTransfer
import DifferentialGeometry.Geometry.Curvature.Naturality.Pullback.LocalIterCov
import DifferentialGeometry.Geometry.Measure.LocalIsometry

/-! # Naturality of the intrinsic terminal trace-free Ricci charge -/

open DifferentialGeometry DifferentialGeometry.Geometry.Curvature
  DifferentialGeometry.Geometry.Metric DifferentialGeometry.Integral.Measure
  DifferentialGeometry.PDE.RicciFlow DifferentialGeometry.Tensor0SBundle
  MeasureTheory Set Manifold TopologicalSpace
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

omit [SigmaCompactSpace M] in
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
  change normSq0S (localPullMetric g f hf) x 2 (metricRicci (localPullMetric g f hf) x) =
    normSq0S g (f x) 2 (metricRicci g (f x)) at h
  rw [metricRicci_apply, metricRicci_apply] at h
  rw [h]

/-- On an open comparison neighborhood, a genuine metric germ suffices
for naturality at every point of that neighborhood. -/
theorem intrinsicTraceFreeRicciSq_eq_of_partialDiffeomorph_inner
    (g : SmoothRiemannianMetric I M) (h : SmoothRiemannianMetric I N)
    (Phi : PartialDiffeomorph I I M N ∞) (U : Opens M) (hU : (U : Set M) ⊆ Phi.source)
    (hinner : ∀ y ∈ U, ∀ v w : TangentSpace I y,
      g.inner y v w = h.inner (Phi y) (mfderiv I I Phi y v) (mfderiv I I Phi y w))
    {x : M} (hx : x ∈ U) :
    intrinsicTraceFreeRicciSq g x = intrinsicTraceFreeRicciSq h (Phi x) := by
  let xu : U := ⟨x, hx⟩
  let : SigmaCompactSpace U := isSigmaCompact_iff_sigmaCompactSpace.mp
    (DifferentialGeometry.Geometry.isSigmaCompact_of_isOpen I U.isOpen)
  have hPhi : IsLocalDiffeomorph I I ∞ (fun y : U => Phi y) :=
    isLocalDiffeomorph_restrict_open U (fun y => ⟨Phi, hU y.property, fun _ _ => rfl⟩)
  have hd (y : U) (v : TangentSpace I y) :
      mfderiv I I (fun z : U => Phi z) y v = mfderiv I I Phi (y : M) v := by
    have hmd := (Phi.contMDiffOn_toFun.contMDiffAt
      (Phi.open_source.mem_nhds (hU y.property))).mdifferentiableAt (by simp)
    change mfderiv I I ((Phi : M → N) ∘ (Subtype.val : U → M)) y v = _
    rw [mfderiv_comp y hmd
      ((contMDiff_subtype_val (I := I) (U := U) (n := ∞)).mdifferentiableAt (by simp)),
      ContinuousLinearMap.comp_apply, mfderiv_subtype_val_apply]
  have hh : g.restrictOpen U = localPullMetric h (fun y : U => Phi y) hPhi := by
    apply SmoothRiemannianMetric.ext_inner
    intro y v w
    rw [localPullMetric_inner, SmoothRiemannianMetric.restrictOpen_inner, hd, hd]
    exact hinner y y.property v w
  have hr : intrinsicTraceFreeRicciSq (g.restrictOpen U) xu = intrinsicTraceFreeRicciSq g x := by
    rw [← localPullMetric_subtype_val, intrinsicTraceFreeRicciSq_localPullMetric]
  rw [← hr, hh, intrinsicTraceFreeRicciSq_localPullMetric]

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
