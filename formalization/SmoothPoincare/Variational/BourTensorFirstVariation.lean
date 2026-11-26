import SmoothPoincare.Variational.BourSlabVariation
import DifferentialGeometry.Analysis.Elliptic.ConnectionLaplacian.IntegrationByParts.WeightedDivergence
import DifferentialGeometry.Geometry.Metric.TensorInner.FiberMetric.Tensor0SMetricCongr
import DifferentialGeometry.Tensor.RSTensor.Coordinates.Field

/-! # Spatial adjoints for Bour's first variation

E49, 26 November 2026. Prepared for Edward B. Baker III with OpenAI Codex
assistance. Actual serving model and effort were unavailable.
-/

open Bundle DifferentialGeometry DifferentialGeometry.Analysis.Elliptic
  DifferentialGeometry.Geometry.Connection DifferentialGeometry.Geometry.Curvature
  DifferentialGeometry.Geometry.Operator DifferentialGeometry.Integral.Measure
  DifferentialGeometry.PDE.RicciFlow DifferentialGeometry.Tensor0SBundle
  DifferentialGeometry.Tensor.RSTensor MeasureTheory
open scoped ContDiff Manifold

namespace SmoothPoincare.Bour

noncomputable section

variable {E H M : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
  [FiniteDimensional ℝ E] [NeZero (Module.finrank ℝ E)] [TopologicalSpace H]
  {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [T2Space M] [CompactSpace M] [BoundarylessManifold I M]

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

/-- The physical $L^2$ pairing of two smooth covariant sections on one slice. -/
def bourClosedTensorPairing (g : SmoothRiemannianMetric I M) {s : ℕ}
    (A K : Tensor0SField (I := I) (M := M) ∞ s) : ℝ :=
  ∫ x, inner0S g x s (A x) (K x) ∂riemannianVolumeMeasure I M g

private theorem bourClosedTensorPairing_symm (g : SmoothRiemannianMetric I M) {s : ℕ}
    (A K : Tensor0SField (I := I) (M := M) ∞ s) :
    bourClosedTensorPairing g A K = bourClosedTensorPairing g K A := by
  apply integral_congr_ae
  exact Filter.Eventually.of_forall fun x => inner0S_symm g x (A x) (K x)

/-- Move the divergence in the lowered connection flux onto its weight.
The contracted slot of the flux is the first covariant slot. -/
theorem bourRicciDivergence_adjoint (g : SmoothRiemannianMetric I M) {s : ℕ}
    (A : Tensor0SField (I := I) (M := M) ∞ s)
    (V : Tensor0SField (I := I) (M := M) ∞ (s + 1)) :
    bourClosedTensorPairing g (covDiv0SField g V) A =
      -bourClosedTensorPairing g (metricNabla0S g A) V := by
  let one : C^∞⟮I, M; ℝ⟯ := ⟨fun _ => 1, contMDiff_const⟩
  have h := integral_weighted_covDiv0SField_eq_neg_metricNabla0S_of_hasCompactSupport
    g s one (HasCompactSupport.of_compactSpace _) A V
  have hOne : ∀ x : M, mvfderiv (I := I) (one : M → ℝ) x = 0 := by
    intro x
    simp [one, mvfderiv, mfderiv_const]
  have hZero (x : M) (Z : Tensor0SSpace (s + 1) I x) :
      inner0S g x (s + 1) 0 Z = 0 := by
    simpa only [zero_smul, zero_mul] using
      (DifferentialGeometry.Tensor0SBundle.inner0S_smul_left g x (s + 1)
        (0 : ℝ) (0 : Tensor0SSpace (s + 1) I x) Z)
  simpa only [bourClosedTensorPairing, hOne, ContinuousLinearMap.zero_smulRight,
    map_zero, TensorRSSpace.zero_apply, hZero, integral_zero, sub_zero,
    show ∀ x : M, one x = 1 from fun _ => rfl, one_mul] using h

/-- Both adjoints for the $
abla^k
abla_k$ term, before its Ricci coefficient. -/
theorem bourRicciRough_adjoint (g : SmoothRiemannianMetric I M) {s : ℕ}
    (A K : Tensor0SField (I := I) (M := M) ∞ s) :
    bourClosedTensorPairing g (roughLap0SField g K) A =
      bourClosedTensorPairing g (roughLap0SField g A) K := by
  rw [roughLap0SField, roughLap0SField, bourRicciDivergence_adjoint,
    bourRicciDivergence_adjoint, bourClosedTensorPairing_symm g
      (metricNabla0S g A) (metricNabla0S g K)]

end
end SmoothPoincare.Bour
