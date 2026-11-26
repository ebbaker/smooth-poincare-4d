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

private theorem bourClosedTensorPairing_smul (g : SmoothRiemannianMetric I M) {s : ℕ}
    (A K : Tensor0SField (I := I) (M := M) ∞ s) (c : ℝ) :
    bourClosedTensorPairing g (c • A) K = c * bourClosedTensorPairing g A K := by
  unfold bourClosedTensorPairing
  simp only [ContMDiffSection.coe_smul, Pi.smul_apply,
    DifferentialGeometry.Tensor0SBundle.inner0S_smul_left, integral_const_mul]

private theorem bourClosedTensorPairing_permute (g : SmoothRiemannianMetric I M) {s : ℕ}
    (e : Equiv.Perm (Fin s)) (A K : Tensor0SField (I := I) (M := M) ∞ s) :
    bourClosedTensorPairing g (Tensor0SField.domDomCongr ∞ e A) K =
      bourClosedTensorPairing g A (Tensor0SField.domDomCongr ∞ e.symm K) := by
  apply integral_congr_ae
  filter_upwards [] with x
  let basis := (smoothOrtho_isLocal g x).toBasisAt (mem_smoothOrthoFrameNeighborhood_self x)
  have horth : ∀ i j, g.inner x (basis i) (basis j) = if i = j then 1 else 0 := by
    intro i j
    simpa only [basis, IsLocalFrameOn.toBasisAt_coe] using
      smoothOrthoFrame_orthonormal_at_center g x i j
  have h := inner0S_domDomCongr g x basis
    (metricInverseInBasis_identity_of_orthonormal g basis horth)
    e (A x) (Tensor0SField.domDomCongr ∞ e.symm K x)
  rw [← Tensor0SField.domDomCongr_apply, ← Tensor0SField.domDomCongr_apply,
    Tensor0SField.domDomCongr_trans, Equiv.symm_trans_self, Tensor0SField.domDomCongr_refl] at h
  exact h

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

/-- Move both derivatives in a permuted covariant Hessian contraction.
The second transfer applies the inverse permutation before taking divergence. -/
theorem bourRicciCrossed_adjoint (g : SmoothRiemannianMetric I M) {s : ℕ}
    (e : Equiv.Perm (Fin (s + 1))) (A K : Tensor0SField (I := I) (M := M) ∞ s) :
    bourClosedTensorPairing g
        (covDiv0SField g (Tensor0SField.domDomCongr ∞ e (metricNabla0S g K))) A =
      bourClosedTensorPairing g
        (covDiv0SField g (Tensor0SField.domDomCongr ∞ e.symm (metricNabla0S g A))) K := by
  rw [bourRicciDivergence_adjoint, bourRicciDivergence_adjoint,
    bourClosedTensorPairing_symm g (metricNabla0S g A) _,
    bourClosedTensorPairing_permute]

/-- The ordinary covariant weight multiplying the Ricci speed in the bulk density. -/
def bourRicciWeight (α : ℝ) (g : SmoothRiemannianMetric I M) :
    Tensor0SField (I := I) (M := M) ∞ 2 :=
  metricRicci g + ((α - 4) / 12) •
    tensor0SFieldSmulByFun ∞ (metricScalarAt g) (metricScalar_smooth g) (metricTensorField g)

/-- The full coefficient of the rough-Laplacian term in the weighted Ricci variation. -/
theorem bourWeightedRicciRough_adjoint (α : ℝ) (g : SmoothRiemannianMetric I M)
    (K : Tensor0SField (I := I) (M := M) ∞ 2) :
    bourClosedTensorPairing g ((-(1 / 2) : ℝ) • roughLap0SField g K) (bourRicciWeight α g) =
      bourClosedTensorPairing g ((-(1 / 2) : ℝ) • roughLap0SField g (bourRicciWeight α g)) K := by
  rw [bourClosedTensorPairing_smul, bourClosedTensorPairing_smul, bourRicciRough_adjoint]

end
end SmoothPoincare.Bour
