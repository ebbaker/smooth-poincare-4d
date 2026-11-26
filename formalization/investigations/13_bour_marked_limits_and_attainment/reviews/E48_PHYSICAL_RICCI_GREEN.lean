import SmoothPoincare
import DifferentialGeometry.Analysis.Elliptic.ConnectionLaplacian.IntegrationByParts.CovariantTwoTensor.Basic
import DifferentialGeometry.Geometry.Metric.TensorInner.Tensor0S.Algebra.MetricShift
import DifferentialGeometry.Geometry.Metric.TensorInner.TensorRS.Pairing

/-! # E48 physical trace-free Ricci and the closed Green identity

26 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance.
The bounded Sol/ultra calculation was replayed against the public import and the
pinned closed covariant tensor Green identity. Actual serving telemetry unavailable.
See the E48 source and import receipt and the stationary interior derivation.
-/

namespace SmoothPoincare.E48StationaryReadback

open DifferentialGeometry DifferentialGeometry.Geometry.Curvature
open DifferentialGeometry.Tensor0SBundle DifferentialGeometry.Geometry.Operator
open DifferentialGeometry.Geometry.Connection
open DifferentialGeometry.Analysis.Elliptic DifferentialGeometry.Integral.L2
open DifferentialGeometry.Analysis.Parabolic.TensorSpectral
open DifferentialGeometry.TensorMetric DifferentialGeometry.Integral.Measure
open MeasureTheory
open scoped Manifold ContDiff

noncomputable section

variable {E H M : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
  [FiniteDimensional ℝ E] [NeZero (Module.finrank ℝ E)] [TopologicalSpace H]
  {I : ModelWithCorners ℝ E H} [I.Boundaryless] [TopologicalSpace M] [ChartedSpace H M]
  [IsManifold I ∞ M] [T2Space M] [CompactSpace M] [BoundarylessManifold I M]

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

private def traceFreeRicciCSCField (g : SmoothRiemannianMetric I M) (R : ℝ) :
    Tensor0SField ∞ 2 (I := I) (M := M) :=
  metricRicci g - (R / 4) • metricTensorField g

private def traceFreeRicciCSCCc (g : SmoothRiemannianMetric I M) (R : ℝ) : SmoothCcTensor g 0 2 where
  toSection := (traceFreeRicciCSCField g R).toTensorRSField ∞
  hasCompactSupport := HasCompactSupport.of_compactSpace _

omit [NeZero (Module.finrank ℝ E)] [I.Boundaryless] [BoundarylessManifold I M] in
private theorem traceFreeRicciCSCCc_at_unit (g : SmoothRiemannianMetric I M) (R : ℝ) (x : M) :
    ((traceFreeRicciCSCCc g R).toSection x) (unitZeroSec (I := I) (M := M) x) =
      traceFreeRicciCSCField g R x := by
  change ((traceFreeRicciCSCField g R).toTensorRSField ∞ x) (unitZeroSec (I := I) (M := M) x) = _
  rw [Tensor0SField.toRS0_apply]
  have hOne : tensor0SSpaceEvalScalar (I := I) x (unitZeroSec (I := I) (M := M) x) = 1 := by
    rw [Tensor0SSpace.evalScalar_apply, unitZeroSec_apply]
    rfl
  rw [hOne, one_smul]

omit [NeZero (Module.finrank ℝ E)] [I.Boundaryless] [CompactSpace M] [BoundarylessManifold I M] in
private theorem traceFreeRicciCSCField_norm (g : SmoothRiemannianMetric I M) (R : ℝ)
    (hDim : Module.finrank ℝ E = 4) (hR : ∀ x, metricScalarAt g x = R) (x : M) :
    normSq0S g x 2 (traceFreeRicciCSCField g R x) = SmoothPoincare.intrinsicTraceFreeRicciSq g x := by
  have hMetric : metricTensorField g x = metricTensor0S g x := by
    ext v
    rw [metricTensorField_apply]
    rfl
  have hField : traceFreeRicciCSCField g R x = metricRicciAt g x - (R / 4) • metricTensor0S g x := by
    simp only [traceFreeRicciCSCField, ContMDiffSection.coe_sub, ContMDiffSection.coe_smul, Pi.sub_apply, Pi.smul_apply,
      metricRicci_apply, hMetric]
  rw [hField, normSq0S_sub_smul_metricTensor0S, SmoothPoincare.intrinsicTraceFreeRicciSq_eq_ricciNormSq_sub_scalarSq,
    ← metricScalarAt_def, hR, hDim]
  norm_num
  ring

omit [NeZero (Module.finrank ℝ E)] [I.Boundaryless] [BoundarylessManifold I M] in
private theorem traceFreeRicciCSC_l2_pairing (g : SmoothRiemannianMetric I M) (R : ℝ)
    (hDim : Module.finrank ℝ E = 4) (hR : ∀ x, metricScalarAt g x = R) :
    tensorL2Inner g 0 2 (traceFreeRicciCSCCc g R).toFun (traceFreeRicciCSCCc g R).toFun =
      ∫ x, SmoothPoincare.intrinsicTraceFreeRicciSq g x ∂riemannianVolumeMeasure I M g := by
  unfold tensorL2Inner
  apply integral_congr_ae
  filter_upwards [] with x
  rw [SmoothCcTensor.toFun_apply, tensorInnerPointwise_eq_inner0S,
    traceFreeRicciCSCCc_at_unit, ← normSq0S_eq_inner, traceFreeRicciCSCField_norm g R hDim hR]

set_option maxHeartbeats 600000 in
/-- A check of the exact positive Green sign on the metric's CSC trace-free Ricci section. -/
private theorem traceFreeRicci_green (g : SmoothRiemannianMetric I M) (R : ℝ) :
    let E := traceFreeRicciCSCCc g R
    tensorL2Inner g 0 3 (covGrad g 0 2 E).toFun (covGrad g 0 2 E).toFun =
      - tensorL2Inner g 0 2 (rawTensorConnLapSmooth g 0 2 E).toFun E.toFun := by
  intro E
  exact green_first_covGrad_l2Inner_eq_neg_rawTensorConnLap_of_closed g E E

#print axioms traceFreeRicciCSCField_norm
#print axioms traceFreeRicciCSC_l2_pairing
#print axioms traceFreeRicci_green

end
end SmoothPoincare.E48StationaryReadback
