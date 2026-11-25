import DifferentialGeometry.Analysis.Integration.Measure.PullbackCross
import FirstOrderTwistor.FrameEnergy

/-! # Chiral energy of a metric pulled back along the marked diffeomorphism

The fields contain the nine coefficients of the positive block in pointwise orthonormal
frames. The application supplies their identification with geometric Weyl curvature.
A change of positive-block frame may depend on the point.
-/

open DifferentialGeometry DifferentialGeometry.Integral.Measure SectionsAndConnections
open MeasureTheory Manifold
open scoped Manifold ContDiff Matrix

namespace FirstOrderTwistor

private theorem hilbertSchmidtSq_eq_trace (A : Matrix (Fin 3) (Fin 3) ℝ) :
    hilbertSchmidtSq A = (A * A.transpose).trace := by
  simp [hilbertSchmidtSq, Matrix.trace, Matrix.mul_apply, pow_two]

/-- Orthogonal conjugacy of chiral endomorphism coefficients preserves the squared norm. -/
theorem hilbertSchmidtSq_orthogonal_conjugate (A Q : Matrix (Fin 3) (Fin 3) ℝ)
    (hQ : Q.transpose * Q = 1) :
    hilbertSchmidtSq (Q * A * Q.transpose) = hilbertSchmidtSq A := by
  rw [hilbertSchmidtSq_eq_trace, hilbertSchmidtSq_eq_trace, Matrix.transpose_mul,
    Matrix.transpose_mul, Matrix.transpose_transpose]
  calc
    _ = (Q * ((A * A.transpose) * Q.transpose)).trace := by
      congr 1
      calc
        _ = Q * (A * ((Q.transpose * Q) * (A.transpose * Q.transpose))) := by
          simp only [Matrix.mul_assoc]
        _ = _ := by simp only [hQ, one_mul, Matrix.mul_assoc]
    _ = (((A * A.transpose) * Q.transpose) * Q).trace := Matrix.trace_mul_comm _ _
    _ = _ := by rw [Matrix.mul_assoc (A * A.transpose), hQ, mul_one]

variable {E F H H' M X : Type*}
  [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [NormedAddCommGroup F] [NormedSpace ℝ F] [FiniteDimensional ℝ F]
  [TopologicalSpace H] [TopologicalSpace H']
  {I : ModelWithCorners ℝ E H} {J : ModelWithCorners ℝ F H'}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M] [SigmaCompactSpace M]
  [TopologicalSpace X] [ChartedSpace H' X] [IsManifold J ∞ X] [T2Space X] [SigmaCompactSpace X]

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩
private local instance : MeasurableSpace X := borel X
private local instance : BorelSpace X := ⟨rfl⟩

/-- Integral of the squared block coefficients in the Riemannian volume of this metric. -/
noncomputable def chiralFrameEnergy (g : SmoothRiemannianMetric I M)
    (W : M → Matrix (Fin 3) (Fin 3) ℝ) : ℝ :=
  ∫ x, hilbertSchmidtSq (W x) ∂riemannianVolumeMeasure (I := I) (M := M) g

theorem chiralFrameEnergy_nonneg (g : SmoothRiemannianMetric I M)
    (W : M → Matrix (Fin 3) (Fin 3) ℝ) : 0 ≤ chiralFrameEnergy g W := by
  unfold chiralFrameEnergy
  apply integral_nonneg
  intro x
  exact Finset.sum_nonneg fun i _ => Finset.sum_nonneg fun j _ => sq_nonneg _

/-- The actual pullback volume supplies the change of variables. Only an a.e.
orthogonal conjugacy of the specified positive blocks is needed. The application has
smooth squared norms on closed manifolds. -/
theorem chiralFrameEnergy_pullback [I.Boundaryless] (g : SmoothRiemannianMetric J X)
    (Φ : M ≃ₘ⟮I, J⟯ X) (WM : M → Matrix (Fin 3) (Fin 3) ℝ)
    (WX : X → Matrix (Fin 3) (Fin 3) ℝ)
    (hFrame : ∀ᵐ x ∂riemannianVolumeMeasure (I := I) (M := M) (Diffeomorph.pullbackMetricCross g Φ),
      ∃ Q : Matrix (Fin 3) (Fin 3) ℝ, Q.transpose * Q = 1 ∧
        WM x = Q * WX (Φ x) * Q.transpose) :
    chiralFrameEnergy (Diffeomorph.pullbackMetricCross g Φ) WM = chiralFrameEnergy g WX := by
  unfold chiralFrameEnergy
  calc
    _ = ∫ x, hilbertSchmidtSq (WX (Φ x))
        ∂riemannianVolumeMeasure (I := I) (M := M) (Diffeomorph.pullbackMetricCross g Φ) := by
      apply integral_congr_ae
      filter_upwards [hFrame] with x hx
      obtain ⟨Q, hQ, h⟩ := hx
      rw [h, hilbertSchmidtSq_orthogonal_conjugate _ _ hQ]
    _ = _ := by
      have hEmb : MeasurableEmbedding (Φ.symm : X → M) := Φ.symm.toHomeomorph.measurableEmbedding
      rw [riemannianVolumeMeasure_pullback_cross, hEmb.integral_map]
      simp only [Φ.apply_symm_apply]

end FirstOrderTwistor
