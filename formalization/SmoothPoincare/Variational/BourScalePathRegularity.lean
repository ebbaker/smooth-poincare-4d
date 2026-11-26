import SmoothPoincare.Variational.BourScaleCalibration
import DifferentialGeometry.Geometry.Metric.Family.Stationary

/-! # Regularity of the physical Bour scale and conformal paths

Prepared for Edward B. Baker III, 26 November 2026, with OpenAI Codex assistance.
Actual serving model and reasoning effort were unavailable.
-/

open DifferentialGeometry DifferentialGeometry.Geometry.Curvature
  DifferentialGeometry.Tensor0SBundle FirstOrderTwistor
open scoped ContDiff Manifold

noncomputable section

namespace SmoothPoincare.Bour

variable {E H M : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
  [FiniteDimensional ℝ E] [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  [I.Boundaryless] [CompactSpace M] [BoundarylessManifold I M]
  {o : ManifoldOrientation I M 4}

private local instance : CompleteSpace E := FiniteDimensional.complete ℝ E

omit [T2Space M] [I.Boundaryless] [CompactSpace M] [BoundarylessManifold I M] in
private theorem metricFamilySmoothOn_of_factor (g : SmoothRiemannianMetric I M)
    (gFam : ℝ → SmoothRiemannianMetric I M) (D : RealTimeInterval)
    (f : ℝ × M → ℝ) (hFactor : ContMDiff (𝓘(ℝ, ℝ).prod I) 𝓘(ℝ, ℝ) ∞ f)
    (hInner : ∀ (s : ℝ) (x : M) (v w : TangentSpace I x),
      (gFam s).inner x v w = f (s, x) * g.inner x v w) :
    MetricFamilySmoothOn (I := I) D gFam := by
  have hStatic := metricFamilySmoothOn_stationary g D
  have hFixed (x : M) : ContDiff ℝ ∞ (fun s : ℝ => f (s, x)) :=
    (hFactor.comp (contMDiff_id.prodMk contMDiff_const)).contDiff
  refine ⟨?_, ?_, ?_, ?_⟩
  · intro x v w
    simp_rw [hInner]
    exact ((hFixed x).mul contDiff_const).contDiffOn
  · intro x v w
    simp_rw [hInner]
    exact ((hFixed x).continuous.mul continuous_const).continuousOn
  · have hTime : Continuous (fun p : {s : ℝ // s ∈ D.carrier} × M =>
        f (p.1.1, p.2)) :=
      hFactor.continuous.comp ((continuous_subtype_val.comp continuous_fst).prodMk continuous_snd)
    refine tensor0SFamilyContinuousOnSet.congr
      (tensor0SFamilyContinuousOnSet.smul (f := fun s x => f (s, x)) hTime hStatic.metricTensor_cont) ?_
    intro s _ x
    ext v
    simp only [stationaryMetricFamily, Tensor0SSpace.smul_apply, smul_eq_mul,
      metricTensorField_apply, hInner]
  · intro J _ frame u hu i j
    have hFrame := hStatic.frameCompSmooth frame hu i j
    change ContMDiffOn (𝓘(ℝ, ℝ).prod I) 𝓘(ℝ, ℝ) ∞
      (fun p : ℝ × M => g.inner p.2 (frame i p.2) (frame j p.2))
      (D.regular ×ˢ u) at hFrame
    simp_rw [hInner]
    exact hFactor.contMDiffOn.mul hFrame

/-- Scaling by the smooth positive time factor preserves all of the regular
metric-family requirements on every time interval. -/
theorem bourScalePath_metricFamilySmoothOn (q : SignedCollarMetric o)
    (D : RealTimeInterval) :
    MetricFamilySmoothOn (I := I) D (fun s => (bourScalePath q s).metric) := by
  have hFactor : ContDiff ℝ ∞ (fun s : ℝ => Real.exp (s - 1)) := by fun_prop
  apply metricFamilySmoothOn_of_factor q.metric _ D (fun p => Real.exp (p.1 - 1))
    (hFactor.contMDiff.comp contMDiff_fst)
  intro s x v w
  rw [bourScalePath_metric, scaleMetric_inner]

/-- An arbitrary fixed smooth conformal speed gives a regular metric family
on every time interval. Its positive factor varies in both time and space. -/
theorem bourConformalPath_metricFamilySmoothOn (q : SignedCollarMetric o)
    (u : C^∞⟮I, M; ℝ⟯) (D : RealTimeInterval) :
    MetricFamilySmoothOn (I := I) D (fun s => (q.conformal (s • u)).metric) := by
  have hExp : ContDiff ℝ ∞ Real.exp := by fun_prop
  have hTime : ContMDiff (𝓘(ℝ, ℝ).prod I) 𝓘(ℝ, ℝ) ∞ (fun p : ℝ × M => p.1) :=
    contMDiff_fst
  have hSpace : ContMDiff (𝓘(ℝ, ℝ).prod I) 𝓘(ℝ, ℝ) ∞ (fun p : ℝ × M => u p.2) :=
    u.contMDiff.comp contMDiff_snd
  apply metricFamilySmoothOn_of_factor q.metric _ D (fun p => Real.exp (2 * (p.1 * u p.2)))
    (hExp.contMDiff.comp (contMDiff_const.mul (hTime.mul hSpace)))
  intro s x v w
  change (conformalMetric q.metric (s • u)).inner x v w = _
  rw [conformalMetric_inner]
  rfl

/-- At time one the physical homothety path is based at its original metric. -/
theorem bourScalePath_metric_one (q : SignedCollarMetric o) :
    (bourScalePath q 1).metric = q.metric := by
  change conformalMetric q.metric (ContMDiffMap.const ((1 - 1) / 2)) = q.metric
  rw [sub_self, zero_div]
  exact conformalMetric_zero q.metric

/-- The physical Euler integral is constant along this same metric path. -/
theorem bourScalePath_euler_eq (q : SignedCollarMetric o) (s : ℝ) :
    bourEuler (bourScalePath q s) = bourEuler q :=
  bourEuler_homothety q (bourScalePath q s) (Real.exp_pos _) (bourScalePath_metric q s)

end SmoothPoincare.Bour
