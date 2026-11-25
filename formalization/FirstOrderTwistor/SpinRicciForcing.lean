import FirstOrderTwistor.SpinCovariantJet
import DifferentialGeometry.Geometry.Curvature.Algebraic.TensorMetric
import DifferentialGeometry.Geometry.Curvature.Bochner.OrthonormalFrameTrace

/-!
# Ricci forcing in the differentiated ordinary Dirac equation

The curvature convention is `R i j c d = ⟨R(eᵢ,eⱼ)e_d,e_c⟩` in a positively
oriented orthonormal frame. `B i j` is the ordered spin Hessian, with `i`
the differentiation direction and `j` the covector slot. The spinor-valued
one-form uses the tensor-product connection, including the covector connection.
-/

namespace FirstOrderTwistor

open Filter Topology
open scoped Quaternion Matrix.Norms.Elementwise
noncomputable section

/-- Ricci coefficients in the curvature operator convention. -/
def frameRicciTensor (R : CurvatureFrameTensor) (a j : Fin 4) : ℝ :=
  ∑ i, R i j i a

/-- The negative half-spinor-valued Ricci forcing of a positive spinor. -/
def frameRicciForcing (R : CurvatureFrameTensor) (ψ : ℍ[ℝ]) (j : Fin 4) : ℍ[ℝ] :=
  (1 / 2 : ℝ) • ((∑ a, frameRicciTensor R a j • positiveCliffordVector a) * ψ)

private theorem frameSpinRicciCoefficient {R : CurvatureFrameTensor}
    (hLast : ∀ a b c d, R a b d c = -R a b c d)
    (hPair : ∀ a b c d, R a b c d = R c d a b)
    (hBianchi : ∀ a b c d, R a b c d + R b c a d + R c a b d = 0) (j : Fin 4) :
    (∑ i, positiveCliffordVector i * frameCurvatureQuaternion R i j) =
      -(∑ a, frameRicciTensor R a j • positiveCliffordVector a) := by
  have hTriples (a b c d : Fin 4) : R a d b c + R b d c a + R c d a b = 0 := by
    rw [hPair a d b c, hPair b d c a, hPair c d a b]
    linear_combination hBianchi a b c d
  have hZero (a : Fin 4) : R a j a a = 0 := by
    linear_combination (1 / 2 : ℝ) * hLast a j a a
  apply Quaternion.ext <;>
    norm_num [frameRicciTensor, frameCurvatureQuaternion, positiveCliffordVector,
      spinUnit, Fin.sum_univ_four, Quaternion.re_mul, Quaternion.imI_mul,
      Quaternion.imJ_mul, Quaternion.imK_mul, smul_eq_mul]
  · linear_combination -hTriples 1 2 3 j - hLast 1 j 0 1 - hLast 2 j 0 2 -
      hLast 3 j 0 3 - hZero 0
  · linear_combination -hTriples 0 2 3 j + hLast 2 j 0 3 + hLast 2 j 1 2 + hZero 1
  · linear_combination -hTriples 0 3 1 j + hLast 3 j 0 1 + hLast 3 j 2 3 + hZero 2
  · linear_combination -hTriples 0 1 2 j + hLast 1 j 0 2 + hLast 1 j 1 3 + hZero 3

/-- Contracting the first curvature direction gives `+c(Ric♯ eⱼ)ψ/2`. -/
theorem frameSpinRicciContraction {R : CurvatureFrameTensor}
    (hLast : ∀ a b c d, R a b d c = -R a b c d)
    (hPair : ∀ a b c d, R a b c d = R c d a b)
    (hBianchi : ∀ a b c d, R a b c d + R b c a d + R c a b d = 0)
    (ψ : ℍ[ℝ]) (j : Fin 4) :
    (∑ i, positiveCliffordVector i * ((-1 / 2 : ℝ) • (frameCurvatureQuaternion R i j * ψ))) =
      frameRicciForcing R ψ j := by
  simp only [frameRicciForcing, mul_smul_comm, ← Finset.smul_sum, ← mul_assoc,
    ← Finset.sum_mul, frameSpinRicciCoefficient hLast hPair hBianchi, neg_mul, smul_neg]
  rw [← neg_smul]
  norm_num

/-- Squared norm of the Ricci forcing in the tensor-product metric. -/
theorem frameRicciForcing_normSq (R : CurvatureFrameTensor) (ψ : ℍ[ℝ]) :
    (∑ j, Quaternion.normSq (frameRicciForcing R ψ j)) =
      (1 / 4 : ℝ) * (∑ j, ∑ a, frameRicciTensor R a j ^ 2) * Quaternion.normSq ψ := by
  have hVector (j : Fin 4) :
      Quaternion.normSq (∑ a, frameRicciTensor R a j • positiveCliffordVector a) =
        ∑ a, frameRicciTensor R a j ^ 2 := by
    rw [Quaternion.normSq_def']
    norm_num [positiveCliffordVector, spinUnit, Fin.sum_univ_four, smul_eq_mul]
  rw [Finset.mul_sum, Finset.sum_mul]
  apply Finset.sum_congr rfl
  intro j _
  rw [frameRicciForcing, Quaternion.normSq_smul, map_mul, hVector]
  ring

/-- The ordinary Dirac derivative of a spinor-valued one-form, whose covariant
derivative in this frame has coefficients `B i j`. -/
def frameTwistedDiracDerivative (B : Fin 4 → Fin 4 → ℍ[ℝ]) (j : Fin 4) : ℍ[ℝ] :=
  ∑ i, positiveCliffordVector i * B i j

/-- The derivative of the ordinary spin Dirac operator in the `j` slot. -/
def frameDiracDerivative (B : Fin 4 → Fin 4 → ℍ[ℝ]) (j : Fin 4) : ℍ[ℝ] :=
  ∑ i, positiveCliffordVector i * B j i

/-- The twisted Dirac derivative of the gradient minus the gradient of the
ordinary Dirac derivative equals the contracted spin curvature. -/
theorem frameTwistedDiracDerivative_sub_diracDerivative {R : CurvatureFrameTensor}
    (hLast : ∀ a b c d, R a b d c = -R a b c d)
    (hPair : ∀ a b c d, R a b c d = R c d a b)
    (hBianchi : ∀ a b c d, R a b c d + R b c a d + R c a b d = 0)
    {ψ : ℍ[ℝ]} {B : Fin 4 → Fin 4 → ℍ[ℝ]} (hJet : SpinFrameCommutator R ψ B) (j : Fin 4) :
    frameTwistedDiracDerivative B j - frameDiracDerivative B j = frameRicciForcing R ψ j := by
  unfold SpinFrameCommutator at hJet
  rw [frameTwistedDiracDerivative, frameDiracDerivative, ← Finset.sum_sub_distrib]
  simp only [← mul_sub, hJet]
  exact frameSpinRicciContraction hLast hPair hBianchi ψ j

/-- For a harmonic two-jet the differentiated Dirac error is exactly the
Ricci forcing, with the squared norm factor `1/4`. -/
theorem harmonicFrameTwistedDiracDerivative_normSq {R : CurvatureFrameTensor}
    (hLast : ∀ a b c d, R a b d c = -R a b c d)
    (hPair : ∀ a b c d, R a b c d = R c d a b)
    (hBianchi : ∀ a b c d, R a b c d + R b c a d + R c a b d = 0)
    {ψ : ℍ[ℝ]} {B : Fin 4 → Fin 4 → ℍ[ℝ]} (hJet : SpinFrameCommutator R ψ B)
    (hHarmonic : ∀ j, frameDiracDerivative B j = 0) :
    (∑ j, Quaternion.normSq (frameTwistedDiracDerivative B j)) =
      (1 / 4 : ℝ) * (∑ j, ∑ a, frameRicciTensor R a j ^ 2) * Quaternion.normSq ψ := by
  have hForcing (j : Fin 4) : frameTwistedDiracDerivative B j = frameRicciForcing R ψ j := by
    simpa only [hHarmonic j, sub_zero] using
      frameTwistedDiracDerivative_sub_diracDerivative hLast hPair hBianchi hJet j
  simp only [hForcing, frameRicciForcing_normSq]

/-- A direct sign check at the positive constant-curvature operator `k I`. -/
theorem frameSpinRicciContraction_constantSectional (k : ℝ) (ψ : ℍ[ℝ]) (j : Fin 4) :
    (∑ i, positiveCliffordVector i *
      ((-1 / 2 : ℝ) • (frameCurvatureQuaternion (constantSectionalFrameTensor k) i j * ψ))) =
      (3 * k / 2 : ℝ) • (positiveCliffordVector j * ψ) := by
  have hConst (a b c d : Fin 4) : constantSectionalFrameTensor k a b c d =
      k * ((if a = c then 1 else 0) * (if b = d then 1 else 0) -
        (if a = d then 1 else 0) * (if b = c then 1 else 0)) := rfl
  fin_cases j <;> apply Quaternion.ext <;>
    norm_num [hConst, frameCurvatureQuaternion, positiveCliffordVector,
      spinUnit, Fin.sum_univ_four, Quaternion.re_mul, Quaternion.imI_mul,
      Quaternion.imJ_mul, Quaternion.imK_mul, smul_eq_mul] <;> ring

section Metric

open DifferentialGeometry DifferentialGeometry.CheegerGromovCompactness
open DifferentialGeometry.Geometry.Connection DifferentialGeometry.Geometry.Curvature
open scoped Manifold ContDiff

variable {E H M : Type*}
    [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
    [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
    [T2Space M] [BoundarylessManifold I M]

local instance : CompleteSpace E := FiniteDimensional.complete ℝ E

local instance : IsManifold I 1 M := IsManifold.of_le (by decide : (1 : WithTop ℕ∞) ≤ ∞)

variable (g : SmoothRiemannianMetric I M) (o : ManifoldOrientation I M 4)
    (x : M) (frame : OrientedOrthonormalFrameAt g o x)

/-- Swapping the final two slots in the usual lowered metric tensor preserves
the first Bianchi sum. -/
theorem metricCurvatureFrameTensor_bianchi (a b c d : Fin 4) :
    metricCurvatureFrameTensor g o x frame a b c d +
      metricCurvatureFrameTensor g o x frame b c a d +
      metricCurvatureFrameTensor g o x frame c a b d = 0 := by
  have hAlg : IsAlgCurvForm (metricRm04StandardAt g x) :=
    mem_algebraicCurvatureTensorSubmodule.mp
      (metricRm04At_mem_algebraicCurvatureTensorSubmodule g x)
  have h := hAlg.bianchi (frame.basis a) (frame.basis b) (frame.basis c) (frame.basis d)
  change metricCurvatureFrameTensor g o x frame a b d c +
    metricCurvatureFrameTensor g o x frame b c d a +
    metricCurvatureFrameTensor g o x frame c a d b = 0 at h
  rw [metricCurvatureFrameTensor_swap_last g o x frame a b c d,
    metricCurvatureFrameTensor_swap_last g o x frame b c a d,
    metricCurvatureFrameTensor_swap_last g o x frame c a b d] at h
  linear_combination -h

/-- The matrix trace in `frameRicciTensor` is the actual Levi–Civita Ricci tensor. -/
theorem frameRicciTensor_metric (a j : Fin 4) :
    frameRicciTensor (metricCurvatureFrameTensor g o x frame) a j =
      ricciTensor g x (frame.basis j) (frame.basis a) := by
  let index : Fin (Module.finrank ℝ E) ≃ Fin 4 := finCongr o.dimension_eq
  have hOrtho (i k : Fin (Module.finrank ℝ E)) :
      g.inner x (frame.basis (index i)) (frame.basis (index k)) =
        if i = k then (1 : ℝ) else 0 := by
    rw [frame.orthonormal]
    simp only [Equiv.apply_eq_iff_eq]
  rw [ricciTensor_eq_orthonormal_trace g x _ _ (fun i => frame.basis (index i)) hOrtho]
  unfold frameRicciTensor
  rw [index.sum_comp (fun i => g.inner x
    (riemannOp (LeviCivita (I := I) g) x (frame.basis i) (frame.basis j) (frame.basis a))
    (frame.basis i))]
  apply Finset.sum_congr rfl
  intro i _
  rw [metricCurvatureFrameTensor, metricRm04StandardAt_eq_inner_riemannOp, g.symm]

/-- In an oriented frame of the actual metric, the harmonic two-jet has
squared twisted Dirac forcing `|Ric|² |ψ|²/4`. The field must supply the
compatible covariant two-jet and the vanishing derivative of its Dirac equation. -/
theorem harmonicMetricFrameTwistedDiracDerivative_normSq
    {ψ : ℍ[ℝ]} {B : Fin 4 → Fin 4 → ℍ[ℝ]}
    (hJet : SpinFrameCommutator (metricCurvatureFrameTensor g o x frame) ψ B)
    (hHarmonic : ∀ j, frameDiracDerivative B j = 0) :
    (∑ j, Quaternion.normSq (frameTwistedDiracDerivative B j)) =
      (1 / 4 : ℝ) * (∑ j, ∑ a, ricciTensor g x (frame.basis j) (frame.basis a) ^ 2) *
        Quaternion.normSq ψ := by
  rw [harmonicFrameTwistedDiracDerivative_normSq
    (metricCurvatureFrameTensor_swap_last g o x frame)
    (metricCurvatureFrameTensor_pair_symm g o x frame)
    (metricCurvatureFrameTensor_bianchi g o x frame) hJet hHarmonic]
  simp only [frameRicciTensor_metric]

/-- A local ordinary harmonic equation in a supplied normal spin chart
implies the Ricci forcing identity for the actual coordinate derivatives.
The covector-slot correction is included in the Hessian. The normal chart
and the identification of its tangent connection curvature are supplied. -/
theorem harmonicMetricCoordinateTwistedDiracDerivative_normSq
    {A : Fin 4 → EuclideanFour → Matrix (Fin 4) (Fin 4) ℝ}
    {upper : Fin 4 → EuclideanFour → ℍ[ℝ]} {ψ : EuclideanFour → ℍ[ℝ]}
    {y : EuclideanFour} (hψ : ContDiffAt ℝ 2 ψ y)
    (hA : ∀ j, DifferentiableAt ℝ (A j) y) (hNormalSpin : ∀ j, A j y = 0)
    (cotangentConnection : Fin 4 → Fin 4 → Fin 4 → ℝ)
    (hNormalCotangent : ∀ i j k, cotangentConnection i j k = 0)
    (hUpper : ∀ j, HasFDerivAt (𝕜 := ℝ) (upper j) 0 y ∧ upper j y = positiveCliffordVector j)
    (hR : ∀ i j, spinFrameCoordinateCurvature A i j y =
      Matrix.of (metricCurvatureFrameTensor g o x frame i j))
    (hHarmonic : (fun z => ∑ k, upper k z *
      spinCovariantDerivative (fun i w => spinConnectionLift (A i w)) k ψ z) =ᶠ[𝓝 y] fun _ => 0) :
    let Γ := fun i w => spinConnectionLift (A i w)
    let U := fun j => spinCovariantDerivative Γ j ψ
    let B := fun i j => spinCovariantDerivative Γ i (U j) y -
      ∑ k, cotangentConnection i j k • U k y
    (∑ j, Quaternion.normSq (frameTwistedDiracDerivative B j)) =
      (1 / 4 : ℝ) * (∑ j, ∑ a, ricciTensor g x (frame.basis j) (frame.basis a) ^ 2) *
        Quaternion.normSq (ψ y) := by
  let Γ := fun i w => spinConnectionLift (A i w)
  let U := fun j => spinCovariantDerivative Γ j ψ
  let B := fun i j => spinCovariantDerivative Γ i (U j) y -
    ∑ k, cotangentConnection i j k • U k y
  have hNormalΓ (i : Fin 4) : Γ i y = 0 := by simp [Γ, hNormalSpin]
  have hB (i j : Fin 4) : B i j = spinCovariantDerivative Γ i (U j) y := by
    simp [B, hNormalCotangent]
  have hSkew (i a b : Fin 4) : A i y b a = -A i y a b := by simp [hNormalSpin]
  have hCoordinateJet := spinFrameCommutator_of_coordinateConnection hψ hA hSkew hR
  have hJet : SpinFrameCommutator (metricCurvatureFrameTensor g o x frame) (ψ y) B := by
    intro i j
    rw [hB, hB]
    exact hCoordinateJet i j
  have hU (j : Fin 4) : DifferentiableAt ℝ (U j) y := by
    let lift := spinConnectionLift.toContinuousLinearMap
    have hΓ : DifferentiableAt ℝ (Γ j) y :=
      (lift.hasFDerivAt.comp y (hA j).hasFDerivAt).differentiableAt
    have hPartial : DifferentiableAt ℝ (spinCoordinatePartial ψ j) y :=
      ((hψ.fderiv_right (m := 1) (by norm_num)).clm_apply
        (contDiffAt_const (c := EuclideanSpace.single j 1))).differentiableAt one_ne_zero
    exact hPartial.add (hΓ.mul (hψ.differentiableAt (by norm_num)))
  have hDiracDerivative (j : Fin 4) :
      spinCoordinatePartial (fun z => ∑ k, upper k z * U k z) j y = frameDiracDerivative B j := by
    unfold spinCoordinatePartial frameDiracDerivative
    rw [fderiv_fun_sum (u := Finset.univ) (A := fun k z => upper k z * U k z)
      (fun k _ => (hUpper k).1.differentiableAt.mul (hU k)), sum_apply]
    apply Finset.sum_congr rfl
    intro i _
    rw [fderiv_fun_mul' (hUpper i).1.differentiableAt (hU i), (hUpper i).1.fderiv,
      (hUpper i).2, hB]
    simp [spinCovariantDerivative, spinCoordinatePartial, hNormalΓ]
  have hHarmonicDerivative (j : Fin 4) : frameDiracDerivative B j = 0 := by
    rw [← hDiracDerivative j, spinCoordinatePartial, hHarmonic.fderiv_eq]
    simp
  exact harmonicMetricFrameTwistedDiracDerivative_normSq g o x frame hJet hHarmonicDerivative

end Metric

end
end FirstOrderTwistor
