import FirstOrderTwistor.SpinRicciForcing
import DifferentialGeometry.Geometry.Metric.TensorInner.Tensor0S.Coordinates.MetricComparison

/-!
# Curvature potential for a covector-valued half-spinor

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex
assistance. Serving model and effort are unavailable.

The curvature convention is the one in SpinRicciForcing. The covector slot
acts by minus precomposition with the tangent curvature. Each pair of
curvature directions is counted once in the Clifford contraction.
-/

open scoped BigOperators Quaternion InnerProductSpace

namespace FirstOrderTwistor

noncomputable section

/-- The full ordered Riemann-component Hilbert–Schmidt norm. -/
def frameRiemannHSNorm (R : CurvatureFrameTensor) : ℝ :=
  Real.sqrt (∑ i, ∑ j, ∑ k, ∑ l, R i j k l ^ 2)

/-- Curvature on the tensor product of the covector and positive half-spin
fibers. The minus sign on the covector action is the dual connection sign. -/
def frameTwistedCurvatureAction (R : CurvatureFrameTensor) (U : Fin 4 → ℍ[ℝ])
    (i j k : Fin 4) : ℍ[ℝ] :=
  (-1 / 2 : ℝ) • (frameCurvatureQuaternion R i j * U k) - ∑ l, R i j l k • U l

/-- The curvature term in the twisted Dirac square on the positive half.
The rightmost Clifford action maps to the negative half and the leftmost
maps back to the positive half. -/
def frameTwistedCurvaturePotential (R : CurvatureFrameTensor) (U : Fin 4 → ℍ[ℝ])
    (k : Fin 4) : ℍ[ℝ] :=
  ∑ i, ∑ j, if i < j then
    negativeCliffordVector i * (positiveCliffordVector j * frameTwistedCurvatureAction R U i j k)
    else 0

private theorem abs_frameRiemannComponent_le (R : CurvatureFrameTensor) (i j k l : Fin 4) :
    |R i j k l| ≤ frameRiemannHSNorm R := by
  have hSq : R i j k l ^ 2 ≤ ∑ a, ∑ b, ∑ c, ∑ d, R a b c d ^ 2 := calc
    _ ≤ ∑ d, R i j k d ^ 2 :=
      Finset.single_le_sum (fun _ _ => sq_nonneg _) (Finset.mem_univ l)
    _ ≤ ∑ c, ∑ d, R i j c d ^ 2 :=
      Finset.single_le_sum (fun _ _ => Finset.sum_nonneg fun _ _ => sq_nonneg _) (Finset.mem_univ k)
    _ ≤ ∑ b, ∑ c, ∑ d, R i b c d ^ 2 :=
      Finset.single_le_sum (fun _ _ => Finset.sum_nonneg fun _ _ =>
        Finset.sum_nonneg fun _ _ => sq_nonneg _) (Finset.mem_univ j)
    _ ≤ ∑ a, ∑ b, ∑ c, ∑ d, R a b c d ^ 2 :=
      Finset.single_le_sum (fun _ _ => Finset.sum_nonneg fun _ _ =>
        Finset.sum_nonneg fun _ _ => Finset.sum_nonneg fun _ _ => sq_nonneg _) (Finset.mem_univ i)
  simpa only [frameRiemannHSNorm, Real.sqrt_sq_eq_abs] using Real.sqrt_le_sqrt hSq

private theorem frameCurvatureQuaternion_norm_le (R : CurvatureFrameTensor) (i j : Fin 4) :
    ‖frameCurvatureQuaternion R i j‖ ≤ 4 * frameRiemannHSNorm R := by
  have hPair (a b c d : Fin 4) : (R i j a b + R i j c d) ^ 2 ≤ (2 * frameRiemannHSNorm R) ^ 2 := by
    have hAbs := (abs_add_le (R i j a b) (R i j c d)).trans
      (add_le_add (abs_frameRiemannComponent_le R i j a b) (abs_frameRiemannComponent_le R i j c d))
    rw [← two_mul] at hAbs
    simpa only [sq_abs] using pow_le_pow_left₀ (abs_nonneg _) hAbs 2
  apply le_of_pow_le_pow_left₀ (by norm_num : (2 : ℕ) ≠ 0)
    (mul_nonneg (by norm_num) (Real.sqrt_nonneg _))
  rw [pow_two, ← Quaternion.normSq_eq_norm_mul_self, Quaternion.normSq_def']
  simp only [frameCurvatureQuaternion, zero_pow (by decide : (2 : ℕ) ≠ 0), zero_add]
  calc
    _ ≤ (2 * frameRiemannHSNorm R) ^ 2 + (2 * frameRiemannHSNorm R) ^ 2 +
          (2 * frameRiemannHSNorm R) ^ 2 :=
      add_le_add (add_le_add (hPair 0 1 2 3) (hPair 0 2 3 1)) (hPair 0 3 1 2)
    _ ≤ (4 * frameRiemannHSNorm R) ^ 2 := by
      nlinarith only [sq_nonneg (frameRiemannHSNorm R)]

private theorem negativeCliffordVector_norm (i : Fin 4) : ‖negativeCliffordVector i‖ = 1 := by
  rw [norm_eq_sqrt_real_inner, Quaternion.inner_self]
  fin_cases i <;> norm_num [negativeCliffordVector, spinUnit, Quaternion.normSq_def']

private theorem positiveCliffordVector_norm (i : Fin 4) : ‖positiveCliffordVector i‖ = 1 := by
  rw [norm_eq_sqrt_real_inner, Quaternion.inner_self]
  fin_cases i <;> norm_num [positiveCliffordVector, spinUnit, Quaternion.normSq_def']

/-- A single two-plane action is controlled by the full curvature and the
covector-spinor component lengths. -/
theorem frameTwistedCurvatureAction_norm_le (R : CurvatureFrameTensor) (U : Fin 4 → ℍ[ℝ])
    (i j k : Fin 4) :
    ‖frameTwistedCurvatureAction R U i j k‖ ≤
      frameRiemannHSNorm R * (2 * ‖U k‖ + ∑ l, ‖U l‖) := by
  unfold frameTwistedCurvatureAction
  have hSpin :
      ‖(-1 / 2 : ℝ) • (frameCurvatureQuaternion R i j * U k)‖ ≤
        2 * frameRiemannHSNorm R * ‖U k‖ := by
    rw [norm_smul, norm_mul, Real.norm_eq_abs, show |(-1 / 2 : ℝ)| = 1 / 2 by norm_num]
    calc
      _ ≤ (1 / 2 : ℝ) * ((4 * frameRiemannHSNorm R) * ‖U k‖) :=
        mul_le_mul_of_nonneg_left
          (mul_le_mul_of_nonneg_right (frameCurvatureQuaternion_norm_le R i j) (norm_nonneg _))
          (by norm_num)
      _ = _ := by ring
  have hCovector : ‖∑ l, R i j l k • U l‖ ≤ frameRiemannHSNorm R * ∑ l, ‖U l‖ := by
    rw [Finset.mul_sum]
    refine (norm_sum_le _ _).trans (Finset.sum_le_sum fun l _ => ?_)
    rw [norm_smul, Real.norm_eq_abs]
    exact mul_le_mul_of_nonneg_right (abs_frameRiemannComponent_le R i j l k) (norm_nonneg _)
  exact (norm_sub_le _ _).trans ((add_le_add hSpin hCovector).trans_eq (by ring))

/-- The Clifford contraction preserves the component norm up to the explicit
sum bound on ordered pairs. -/
theorem frameTwistedCurvaturePotential_norm_le (R : CurvatureFrameTensor) (U : Fin 4 → ℍ[ℝ])
    (k : Fin 4) :
    ‖frameTwistedCurvaturePotential R U k‖ ≤
      16 * frameRiemannHSNorm R * (2 * ‖U k‖ + ∑ l, ‖U l‖) := by
  let bound := frameRiemannHSNorm R * (2 * ‖U k‖ + ∑ l, ‖U l‖)
  have hBound : 0 ≤ bound := mul_nonneg (Real.sqrt_nonneg _) (by positivity)
  unfold frameTwistedCurvaturePotential
  calc
    _ ≤ ∑ _i : Fin 4, ∑ _j : Fin 4, bound := by
      refine (norm_sum_le _ _).trans (Finset.sum_le_sum fun i _ => ?_)
      refine (norm_sum_le _ _).trans (Finset.sum_le_sum fun j _ => ?_)
      split
      · simpa only [norm_mul, negativeCliffordVector_norm, positiveCliffordVector_norm, one_mul]
          using frameTwistedCurvatureAction_norm_le R U i j k
      · simpa only [norm_zero] using hBound
    _ = _ := by simp [bound]; ring

/-- The full covector-twisted curvature potential is quadratically bounded by
the full Riemann norm and the squared tensor-product norm. The constant 96
uses the elementary bound by all sixteen ordered direction pairs. -/
theorem frameTwistedCurvaturePotential_pairing_le (R : CurvatureFrameTensor) (U : Fin 4 → ℍ[ℝ]) :
    |∑ k, ⟪frameTwistedCurvaturePotential R U k, U k⟫_ℝ| ≤
      96 * frameRiemannHSNorm R * ∑ k, Quaternion.normSq (U k) := by
  let S := ∑ k, ‖U k‖
  let Q := ∑ k, ‖U k‖ ^ 2
  have hCS : S ^ 2 ≤ 4 * Q := by
    simpa [S, Q] using Finset.sum_mul_sq_le_sq_mul_sq Finset.univ (fun _ : Fin 4 => (1 : ℝ))
      (fun k => ‖U k‖)
  have hQ : Q = ∑ k, Quaternion.normSq (U k) := by
    simp only [Q, Quaternion.normSq_eq_norm_mul_self, pow_two]
  have hNorm (k : Fin 4) : |⟪frameTwistedCurvaturePotential R U k, U k⟫_ℝ| ≤
      16 * frameRiemannHSNorm R * (2 * ‖U k‖ ^ 2 + S * ‖U k‖) := calc
    _ ≤ ‖frameTwistedCurvaturePotential R U k‖ * ‖U k‖ := abs_real_inner_le_norm _ _
    _ ≤ (16 * frameRiemannHSNorm R * (2 * ‖U k‖ + S)) * ‖U k‖ :=
      mul_le_mul_of_nonneg_right (frameTwistedCurvaturePotential_norm_le R U k) (norm_nonneg _)
    _ = _ := by ring
  rw [← hQ]
  calc
    _ ≤ ∑ k, |⟪frameTwistedCurvaturePotential R U k, U k⟫_ℝ| := Finset.abs_sum_le_sum_abs _ _
    _ ≤ ∑ k, 16 * frameRiemannHSNorm R * (2 * ‖U k‖ ^ 2 + S * ‖U k‖) :=
      Finset.sum_le_sum fun k _ => hNorm k
    _ = 16 * frameRiemannHSNorm R * (2 * Q + S ^ 2) := by
      rw [← Finset.mul_sum, Finset.sum_add_distrib, ← Finset.mul_sum, ← Finset.mul_sum]
      change 16 * frameRiemannHSNorm R * (2 * Q + S * S) = _
      rw [pow_two]
    _ ≤ 16 * frameRiemannHSNorm R * (2 * Q + 4 * Q) :=
      mul_le_mul_of_nonneg_left (add_le_add_right hCS _) (mul_nonneg (by norm_num) (Real.sqrt_nonneg _))
    _ = _ := by ring

open DifferentialGeometry
open scoped Manifold ContDiff

/-- The full covector-twisted curvature potential of the actual metric in a
marked positively oriented orthonormal frame. -/
theorem metricFrameTwistedCurvaturePotential_pairing_le
    {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
    [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
    [T2Space M] [BoundarylessManifold I M]
    (g : SmoothRiemannianMetric I M) (o : ManifoldOrientation I M 4)
    (p : M) (frame : OrientedOrthonormalFrameAt g o p) (U : Fin 4 → ℍ[ℝ]) :
    |∑ k, ⟪frameTwistedCurvaturePotential (metricCurvatureFrameTensor g o p frame) U k, U k⟫_ℝ| ≤
      96 * frameRiemannHSNorm (metricCurvatureFrameTensor g o p frame) *
        ∑ k, Quaternion.normSq (U k) :=
  frameTwistedCurvaturePotential_pairing_le (metricCurvatureFrameTensor g o p frame) U

open DifferentialGeometry.Geometry.Curvature DifferentialGeometry.Tensor0SBundle

section

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
    [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]

local instance : CompleteSpace E := FiniteDimensional.complete ℝ E

local instance : IsManifold I 1 M := IsManifold.of_le (by decide : (1 : WithTop ℕ∞) ≤ ∞)

/-- The ordered component norm of the metric curvature is its intrinsic
covariant tensor norm. The finite reindexing interchanges the last two
slots used by the curvature operator convention. -/
theorem frameRiemannHSNorm_metric_eq
    (g : SmoothRiemannianMetric I M) (o : ManifoldOrientation I M 4)
    (p : M) (frame : OrientedOrthonormalFrameAt g o p) :
    frameRiemannHSNorm (metricCurvatureFrameTensor g o p frame) =
      Real.sqrt (normSq0S g p 4 (metricRm04At g p)) := by
  let τ : (Fin 4 → Fin 4) ≃ Fin 4 × Fin 4 × Fin 4 × Fin 4 :=
    { toFun := fun v => (v 0, v 1, v 3, v 2)
      invFun := fun q => ![q.1, q.2.1, q.2.2.2, q.2.2.1]
      left_inv := by intro v; funext i; fin_cases i <;> rfl
      right_inv := by intro q; rfl }
  have hinv : MetricInverseInBasis g p frame.basis identityInvMetric := by
    intro i j
    constructor <;> simp [identityInvMetric, diagonalInvMetric, frame.orthonormal]
  unfold frameRiemannHSNorm
  apply congrArg Real.sqrt
  rw [normSq0S_identity_eq_sum_sq g p 4 frame.basis hinv]
  let coefficient := metricCurvatureFrameTensor g o p frame
  calc
    _ = ∑ q : Fin 4 × Fin 4 × Fin 4 × Fin 4, coefficient q.1 q.2.1 q.2.2.1 q.2.2.2 ^ 2 := by
      simp only [Fintype.sum_prod_type, coefficient]
    _ = _ := by
      apply Fintype.sum_equiv τ.symm
      intro q
      apply congrArg (fun z : ℝ => z ^ 2)
      dsimp only [τ, coefficient, Equiv.coe_fn_symm_mk]
      rw [metricCurvatureFrameTensor, metricRm04StandardAt_apply]
      change (metricRm04At g p) (vec4 (frame.basis q.1) (frame.basis q.2.1)
        (frame.basis q.2.2.2) (frame.basis q.2.2.1)) =
          (metricRm04At g p) (fun i => frame.basis (![q.1, q.2.1, q.2.2.2, q.2.2.1] i))
      congr 1
      funext i
      fin_cases i <;> rfl

/-- The curvature-potential bound in the intrinsic full Riemann norm. -/
theorem metricFrameTwistedCurvaturePotential_pairing_le_intrinsic
    [T2Space M] [BoundarylessManifold I M]
    (g : SmoothRiemannianMetric I M) (o : ManifoldOrientation I M 4)
    (p : M) (frame : OrientedOrthonormalFrameAt g o p) (U : Fin 4 → ℍ[ℝ]) :
    |∑ k, ⟪frameTwistedCurvaturePotential (metricCurvatureFrameTensor g o p frame) U k, U k⟫_ℝ| ≤
      96 * Real.sqrt (normSq0S g p 4 (metricRm04At g p)) * ∑ k, Quaternion.normSq (U k) := by
  rw [← frameRiemannHSNorm_metric_eq g o p frame]
  exact metricFrameTwistedCurvaturePotential_pairing_le g o p frame U

end

end

end FirstOrderTwistor
