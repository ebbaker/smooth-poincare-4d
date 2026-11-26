import SmoothPoincare.Variational.BourOriginalGradient
import DifferentialGeometry.Geometry.Curvature.Metric.Scaling
import DifferentialGeometry.Geometry.Metric.TensorInner.Tensor0S.Scaling
import Mathlib.Tactic.Module

/-! # Homogeneity of the physical Bour gradient

26 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance.
Actual serving model and effort are unavailable.
-/

open Bundle DifferentialGeometry DifferentialGeometry.Geometry.Connection
  DifferentialGeometry.Geometry.Curvature DifferentialGeometry.Geometry.Operator
  DifferentialGeometry.Tensor0SBundle DifferentialGeometry.Tensor.Coordinates DifferentialGeometry.Tensor.RSTensor
  DifferentialGeometry.PDE.RicciFlow
open scoped ContDiff Manifold

namespace SmoothPoincare.Bour

noncomputable section

variable {E H M : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
  [FiniteDimensional ℝ E] [NeZero (Module.finrank ℝ E)] [TopologicalSpace H]
  {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [T2Space M] [CompactSpace M] [BoundarylessManifold I M]

private local instance : CompleteSpace E := FiniteDimensional.complete ℝ E
private local instance : IsManifold I 1 M := IsManifold.of_le (by decide : (1 : WithTop ℕ∞) ≤ ∞)

omit [NeZero (Module.finrank ℝ E)] [I.Boundaryless] [CompactSpace M] [BoundarylessManifold I M] in
private theorem bourNabla_scale (c : ℝ) (hc : 0 < c) (g : SmoothRiemannianMetric I M)
    {s : ℕ} (A : Tensor0SField (I := I) (M := M) ∞ s) :
    metricNabla0S (scaleMetric c hc g) A = metricNabla0S g A := by
  refine DFunLike.ext _ _ fun x => ?_
  rw [metricNabla0S_apply, metricNabla0S_apply]
  have hConn : metricCov (scaleMetric c hc g) = metricCov g := lcConn_scaleMetric c hc g
  rw [hConn]

omit [NeZero (Module.finrank ℝ E)] [I.Boundaryless] [T2Space M] [CompactSpace M]
  [BoundarylessManifold I M] in
private theorem bourTrace_scale (c : ℝ) (hc : 0 < c) (g : SmoothRiemannianMetric I M)
    {s : ℕ} (A : Tensor0SField (I := I) (M := M) ∞ (s + 2)) :
    metricTraceFirstTwoField (scaleMetric c hc g) A = c⁻¹ • metricTraceFirstTwoField g A := by
  classical
  ext x tail
  let b := coordinateFrameAtToBasis (I := I) x
  let a := fun i j => inverseMetricFlatModelInChartComponent (I := I) g x i j (extChartAt I x x)
  have ha : MetricInverseInBasis g x b a :=
    DifferentialGeometry.Tensor.Coordinates.inverseMetricFlatModelInChart_metricInverseInBasis_center g x
  have hscaled := metricInvBasis_scale c hc g b a ha
  simp only [metricTraceFirstTwoField_apply, ContMDiffSection.coe_smul, Pi.smul_apply,
    Tensor0SSpace.smul_apply, smul_eq_mul, metricTraceFirstTwo0STensor_apply]
  rw [metricTraceFirstTwo0SAt_eq_sum_basis _ b _ hscaled,
    metricTraceFirstTwo0SAt_eq_sum_basis g b a ha]
  simp only [metricTrace0S2InBasis, Finset.mul_sum, mul_assoc]

omit [NeZero (Module.finrank ℝ E)] [I.Boundaryless] [CompactSpace M] [BoundarylessManifold I M] in
private theorem bourDiv_scale (c : ℝ) (hc : 0 < c) (g : SmoothRiemannianMetric I M)
    {s : ℕ} (A : Tensor0SField (I := I) (M := M) ∞ (s + 1)) :
    covDiv0SField (scaleMetric c hc g) A = c⁻¹ • covDiv0SField g A := by
  rw [covDiv0SField, bourNabla_scale, bourTrace_scale, covDiv0SField]

omit [NeZero (Module.finrank ℝ E)] [I.Boundaryless] [CompactSpace M] [BoundarylessManifold I M] in
private theorem bourDiv_smul (g : SmoothRiemannianMetric I M)
    {s : ℕ} (d : ℝ) (A : Tensor0SField (I := I) (M := M) ∞ (s + 1)) :
    covDiv0SField g (d • A) = d • covDiv0SField g A := by
  rw [covDiv0SField, metricNabla0S_smul, metricTraceFirstTwoField_smul, covDiv0SField]

omit [NeZero (Module.finrank ℝ E)] [I.Boundaryless] [CompactSpace M] [BoundarylessManifold I M] in
private theorem bourRicci_scale (c : ℝ) (hc : 0 < c) (g : SmoothRiemannianMetric I M) :
    metricRicci (scaleMetric c hc g) = metricRicci g := by
  refine DFunLike.ext _ _ fun x => ?_
  simpa only [metricRicci_apply] using metricRicciAt_scaleMetric c hc g x

omit [NeZero (Module.finrank ℝ E)] [I.Boundaryless] [CompactSpace M] [BoundarylessManifold I M] in
private theorem bourWeight_scale (c : ℝ) (hc : 0 < c) (α : ℝ)
    (g : SmoothRiemannianMetric I M) :
    bourRicciWeight α (scaleMetric c hc g) = bourRicciWeight α g := by
  ext x v
  simp only [bourRicciWeight, bourRicci_scale, ContMDiffSection.coe_smul,
    ContMDiffSection.coe_add, Pi.smul_apply, Pi.add_apply, Tensor0SSpace.smul_apply,
    Tensor0SSpace.add_apply, smul_eq_mul]
  change metricRicci g x v + (α - 4) / 12 *
      (metricScalarAt (scaleMetric c hc g) x * metricTensorField (scaleMetric c hc g) x v) =
    metricRicci g x v + (α - 4) / 12 *
      (metricScalarAt g x * metricTensorField g x v)
  simp only [metricScalarAt_scaleMetric, metricTensorField_apply, scaleMetric_inner]
  field_simp

omit [NeZero (Module.finrank ℝ E)] [I.Boundaryless] [CompactSpace M] [BoundarylessManifold I M] in
private theorem bourFlux_scale (c : ℝ) (hc : 0 < c) (g : SmoothRiemannianMetric I M)
    (A : Tensor0SField (I := I) (M := M) ∞ 2) :
    bourRicciFluxAdjoint (scaleMetric c hc g) A = c⁻¹ • bourRicciFluxAdjoint g A := by
  simp only [bourRicciFluxAdjoint, roughLap0SField, bourNabla_scale, bourDiv_scale]
  module

omit [NeZero (Module.finrank ℝ E)] [I.Boundaryless] [CompactSpace M] [BoundarylessManifold I M] in
private theorem bourTraceAdjoint_scale (c : ℝ) (hc : 0 < c) (g : SmoothRiemannianMetric I M)
    (A : Tensor0SField (I := I) (M := M) ∞ 2) :
    bourRicciTraceAdjoint (scaleMetric c hc g) A = c⁻¹ • bourRicciTraceAdjoint g A := by
  have hD : covDiv0SField (scaleMetric c hc g) (covDiv0SField (scaleMetric c hc g) A) =
      (c⁻¹)^2 • covDiv0SField g (covDiv0SField g A) := by
    simp only [bourDiv_scale, bourDiv_smul, smul_smul, pow_two]
  ext x v
  change (covDiv0SField (scaleMetric c hc g) (covDiv0SField (scaleMetric c hc g) A))
      x Fin.elim0 * metricTensorField (scaleMetric c hc g) x v =
    c⁻¹ * ((covDiv0SField g (covDiv0SField g A)) x Fin.elim0 * metricTensorField g x v)
  rw [hD]
  simp only [ContMDiffSection.coe_smul, Pi.smul_apply, Tensor0SSpace.smul_apply, smul_eq_mul,
    metricTensorField_apply, scaleMetric_inner]
  field_simp

omit [NeZero (Module.finrank ℝ E)] [I.Boundaryless] [T2Space M] [CompactSpace M]
  [BoundarylessManifold I M] in
private theorem bourDensity_scale (c : ℝ) (hc : 0 < c) (α : ℝ)
    (g : SmoothRiemannianMetric I M) (x : M) :
    bourBulkDensity α (scaleMetric c hc g) x = (c⁻¹)^2 * bourBulkDensity α g x := by
  rw [bourBulkDensity, bourBulkDensity, metricRicciAt_scaleMetric, normSq0S_scale,
    metricScalarAt_scaleMetric]
  ring

omit [NeZero (Module.finrank ℝ E)] [I.Boundaryless] [CompactSpace M] [BoundarylessManifold I M] in
private theorem bourSquare_scale (c : ℝ) (hc : 0 < c) (g : SmoothRiemannianMetric I M) :
    bourRicciSquare (scaleMetric c hc g) = c⁻¹ • bourRicciSquare g := by
  simp only [bourRicciSquare, bourRicci_scale, bourTrace_scale]

omit [NeZero (Module.finrank ℝ E)] [I.Boundaryless] [CompactSpace M] [BoundarylessManifold I M] in
private theorem bourBulk_scale (c : ℝ) (hc : 0 < c) (α : ℝ) (g : SmoothRiemannianMetric I M) :
    bourBulkMetricCorrection α (scaleMetric c hc g) = c⁻¹ • bourBulkMetricCorrection α g := by
  ext x v
  change -bourRicciSquare (scaleMetric c hc g) x v -
      ((α - 4) / 12) * (metricScalarAt (scaleMetric c hc g) x * metricRicci (scaleMetric c hc g) x v) +
      (1 / 2 : ℝ) * (bourBulkDensity α (scaleMetric c hc g) x * metricTensorField (scaleMetric c hc g) x v) =
    c⁻¹ * (-bourRicciSquare g x v - ((α - 4) / 12) * (metricScalarAt g x * metricRicci g x v) +
      (1 / 2 : ℝ) * (bourBulkDensity α g x * metricTensorField g x v))
  rw [bourSquare_scale, bourRicci_scale, bourDensity_scale, metricScalarAt_scaleMetric]
  simp only [ContMDiffSection.coe_smul, Pi.smul_apply, Tensor0SSpace.smul_apply, smul_eq_mul,
    metricTensorField_apply, scaleMetric_inner]
  field_simp

omit [NeZero (Module.finrank ℝ E)] [I.Boundaryless] [T2Space M] [CompactSpace M]
  [BoundarylessManifold I M] in
private theorem bourSymmetricPart_smul (d : ℝ) (A : Tensor0SField (I := I) (M := M) ∞ 2) :
    bourSymmetricPart (d • A) = d • bourSymmetricPart A := by
  ext x v
  simp only [bourSymmetricPart, ContMDiffSection.coe_smul, ContMDiffSection.coe_add,
    Pi.smul_apply, Pi.add_apply, Tensor0SSpace.smul_apply, Tensor0SSpace.add_apply, smul_eq_mul,
    Tensor0SField.domDomCongr_apply, Tensor0SSpace.domDomCongr_apply]
  ring

omit [NeZero (Module.finrank ℝ E)] [I.Boundaryless] [CompactSpace M] [BoundarylessManifold I M] in
/-- The computed covariant gradient has weight minus one under positive
constant metric scaling on an arbitrary smooth slice. The uncommuted
formula retains all scalar derivatives and applies to every parameter. -/
theorem bourCovariantGradient_scaleMetric (c : ℝ) (hc : 0 < c) (α : ℝ)
    (g : SmoothRiemannianMetric I M) :
    bourCovariantGradient α (scaleMetric c hc g) = c⁻¹ • bourCovariantGradient α g := by
  simp only [bourCovariantGradient, bourWeight_scale, bourFlux_scale, bourTraceAdjoint_scale,
    bourBulk_scale, ← bourSymmetricPart_smul]
  congr 1
  module

omit [NeZero (Module.finrank ℝ E)] [I.Boundaryless] [CompactSpace M] [BoundarylessManifold I M] in
/-- The speed after the positive constant parabolic change is negative
twice the gradient computed from the actual normalized metric. -/
theorem bourParabolicVelocity_hasDerivAt
    (g : ℝ → SmoothRiemannianMetric I M) (α : ℝ) {c : ℝ} (hc : 0 < c)
    (t₀ s : ℝ) (x : M)
    (hV : HasDerivAt (fun t => metricTensorField (g t) x)
      ((-2 : ℝ) • bourCovariantGradient α (g (s / c^2 + t₀)) x) (s / c^2 + t₀)) :
    HasDerivAt (fun r => metricTensorField (scaleMetric c hc (g (r / c^2 + t₀))) x)
      ((-2 : ℝ) • bourCovariantGradient α (scaleMetric c hc (g (s / c^2 + t₀))) x) s := by
  rw [bourCovariantGradient_scaleMetric c hc]
  exact metricVelocity_scale_time g (fun t x => bourCovariantGradient α (g t) x) hc t₀ s x hV

omit [NeZero (Module.finrank ℝ E)] [I.Boundaryless] [BoundarylessManifold I M] in
/-- The dissipation transfer uses the native gradient of each rescaled
metric, on every corresponding pair of parabolic windows. -/
theorem bourParabolicGradientDissipation_eq (hdim : Module.finrank ℝ E = 4)
    (g : ℝ → SmoothRiemannianMetric I M) (α : ℝ) {c : ℝ} (hc : 0 < c)
    (t₀ a b : ℝ) :
    (∫ s in a..b, gradientSq (scaleMetric c hc (g (s / c^2 + t₀)))
      (bourCovariantGradient α (scaleMetric c hc (g (s / c^2 + t₀))))) =
      ∫ t in (a / c^2 + t₀)..(b / c^2 + t₀), gradientSq (g t) (bourCovariantGradient α (g t)) := by
  simp_rw [bourCovariantGradient_scaleMetric c hc]
  exact parabolic_dissipation_eq hdim g (fun t x => bourCovariantGradient α (g t) x) hc t₀ a b

end
end SmoothPoincare.Bour
