import FirstOrderTwistor.BufferedInterpolation
import FirstOrderTwistor.SpinConnectionLift
import FirstOrderTwistor.SpinNormalFrame
import Mathlib.Analysis.Calculus.FDeriv.Symmetric
import Mathlib.Analysis.Matrix.Normed
import Mathlib.Analysis.Quaternion
import Mathlib.Tactic.NoncommRing

/-!
# The quaternionic spin commutator in coordinates

In a supplied trivialization over a four-dimensional real coordinate domain,
the coordinate connection is specified by left multiplication by quaternionic
coefficients. The commutator is calculated using actual Fréchet derivatives.
-/

open scoped Quaternion Matrix.Norms.Elementwise

namespace FirstOrderTwistor

/-- Derivative of a quaternionic field in a constant coordinate direction. -/
noncomputable def spinCoordinatePartial (ψ : EuclideanFour → ℍ[ℝ])
    (i : Fin 4) (x : EuclideanFour) : ℍ[ℝ] :=
  fderiv ℝ ψ x (EuclideanSpace.single i 1)

/-- The covariant derivative in the supplied coordinate trivialization. -/
noncomputable def spinCovariantDerivative (Γ : Fin 4 → EuclideanFour → ℍ[ℝ])
    (i : Fin 4) (ψ : EuclideanFour → ℍ[ℝ]) (x : EuclideanFour) : ℍ[ℝ] :=
  spinCoordinatePartial ψ i x + Γ i x * ψ x

/-- Curvature coefficient with the outer differentiation slot first. -/
noncomputable def spinCoordinateCurvature (Γ : Fin 4 → EuclideanFour → ℍ[ℝ])
    (i j : Fin 4) (x : EuclideanFour) : ℍ[ℝ] :=
  spinCoordinatePartial (Γ j) i x - spinCoordinatePartial (Γ i) j x +
    (Γ i x * Γ j x - Γ j x * Γ i x)

private theorem spinCoordinatePartial_commute {ψ : EuclideanFour → ℍ[ℝ]}
    {x : EuclideanFour} (hψ : ContDiffAt ℝ 2 ψ x) (i j : Fin 4) :
    spinCoordinatePartial (spinCoordinatePartial ψ j) i x =
      spinCoordinatePartial (spinCoordinatePartial ψ i) j x := by
  have hderiv := (hψ.fderiv_right (m := 1) (by norm_num)).differentiableAt one_ne_zero
  have hsymm := hψ.isSymmSndFDerivAt (by simp)
  unfold spinCoordinatePartial
  rw [fderiv_clm_apply hderiv (differentiableAt_const (EuclideanSpace.single j 1)),
      fderiv_clm_apply hderiv (differentiableAt_const (EuclideanSpace.single i 1))]
  simpa using hsymm.eq (EuclideanSpace.single i 1) (EuclideanSpace.single j 1)

private theorem spinCovariantDerivative_expand {Γ : Fin 4 → EuclideanFour → ℍ[ℝ]}
    {ψ : EuclideanFour → ℍ[ℝ]} {x : EuclideanFour} (hψ : ContDiffAt ℝ 2 ψ x)
    (i j : Fin 4) (hΓ : DifferentiableAt ℝ (Γ j) x) :
    spinCovariantDerivative Γ i (spinCovariantDerivative Γ j ψ) x =
      (spinCoordinatePartial (spinCoordinatePartial ψ j) i x +
        (Γ j x * spinCoordinatePartial ψ i x + spinCoordinatePartial (Γ j) i x * ψ x)) +
      Γ i x * (spinCoordinatePartial ψ j x + Γ j x * ψ x) := by
  have hψdiff := hψ.differentiableAt (by norm_num)
  have hpartial : DifferentiableAt ℝ (spinCoordinatePartial ψ j) x :=
    (((hψ.fderiv_right (m := 1) (by norm_num)).clm_apply contDiffAt_const).differentiableAt one_ne_zero)
  unfold spinCovariantDerivative
  congr 1
  have hproduct : DifferentiableAt ℝ (fun y => Γ j y * ψ y) x := hΓ.mul hψdiff
  change (fderiv ℝ (fun y => spinCoordinatePartial ψ j y + Γ j y * ψ y) x)
      (EuclideanSpace.single i 1) = _
  rw [fderiv_fun_add hpartial hproduct, fderiv_fun_mul' hΓ hψdiff]
  rfl

/-- For a C² spinor and differentiable connection coefficients at the point,
the alternating ordered covariant derivative is left multiplication by the
coordinate curvature. The coordinates commute and the same trivialization is
used for both summands. -/
theorem spinCovariantDerivative_commutator {Γ : Fin 4 → EuclideanFour → ℍ[ℝ]}
    {ψ : EuclideanFour → ℍ[ℝ]} {x : EuclideanFour} (hψ : ContDiffAt ℝ 2 ψ x)
    (i j : Fin 4) (hi : DifferentiableAt ℝ (Γ i) x) (hj : DifferentiableAt ℝ (Γ j) x) :
    spinCovariantDerivative Γ i (spinCovariantDerivative Γ j ψ) x -
      spinCovariantDerivative Γ j (spinCovariantDerivative Γ i ψ) x =
      spinCoordinateCurvature Γ i j x * ψ x := by
  rw [spinCovariantDerivative_expand hψ i j hj, spinCovariantDerivative_expand hψ j i hi,
    spinCoordinatePartial_commute hψ i j, spinCoordinateCurvature]
  noncomm_ring

/-- The matrix curvature of a supplied coordinate connection, using the same
order of differentiation and matrix slots as the positive spin lift. -/
noncomputable def spinFrameCoordinateCurvature
    (A : Fin 4 → EuclideanFour → Matrix (Fin 4) (Fin 4) ℝ)
    (i j : Fin 4) (x : EuclideanFour) : Matrix (Fin 4) (Fin 4) ℝ :=
  fderiv ℝ (A j) x (EuclideanSpace.single i 1) -
    fderiv ℝ (A i) x (EuclideanSpace.single j 1) + (A i x * A j x - A j x * A i x)

/-- Actual coordinate differentiation commutes with the positive spin lift.
Skewness is needed for the matrix commutator at the point. -/
theorem spinCoordinateCurvature_connectionLift
    {A : Fin 4 → EuclideanFour → Matrix (Fin 4) (Fin 4) ℝ} {x : EuclideanFour}
    (i j : Fin 4) (hA : ∀ k, DifferentiableAt ℝ (A k) x)
    (hskew : ∀ k a b, A k x b a = -A k x a b) :
    spinCoordinateCurvature (fun k y => spinConnectionLift (A k y)) i j x =
      spinConnectionLift (spinFrameCoordinateCurvature A i j x) := by
  let lift := spinConnectionLift.toContinuousLinearMap
  have hpartial (k m : Fin 4) :
      spinCoordinatePartial (fun y => spinConnectionLift (A k y)) m x =
        spinConnectionLift (fderiv ℝ (A k) x (EuclideanSpace.single m 1)) := by
    have hcomp := (lift.hasFDerivAt.comp x (hA k).hasFDerivAt).fderiv
    change fderiv ℝ (lift ∘ A k) x (EuclideanSpace.single m 1) =
      (lift ∘L fderiv ℝ (A k) x) (EuclideanSpace.single m 1)
    rw [hcomp]
    rfl
  rw [spinCoordinateCurvature, spinFrameCoordinateCurvature, hpartial, hpartial]
  symm
  exact spinConnectionLift_frameCurvature (fun k => A k x)
    (fun k m => fderiv ℝ (A m) x (EuclideanSpace.single k 1)) i j hskew

/-- Actual ordered coordinate derivatives provide the commutator hypothesis
of the normal-frame calculation when the supplied curvature components agree
with the matrix curvature of the lifted frame connection at the point. -/
theorem spinFrameCommutator_of_coordinateConnection
    {A : Fin 4 → EuclideanFour → Matrix (Fin 4) (Fin 4) ℝ} {x : EuclideanFour}
    {ψ : EuclideanFour → ℍ[ℝ]} (hψ : ContDiffAt ℝ 2 ψ x)
    (hA : ∀ k, DifferentiableAt ℝ (A k) x)
    (hskew : ∀ k a b, A k x b a = -A k x a b)
    {R : CurvatureFrameTensor}
    (hR : ∀ i j, spinFrameCoordinateCurvature A i j x = Matrix.of (R i j)) :
    let Γ := fun k y => spinConnectionLift (A k y)
    SpinFrameCommutator R (ψ x)
      (fun i j => spinCovariantDerivative Γ i (spinCovariantDerivative Γ j ψ) x) := by
  let Γ := fun k y => spinConnectionLift (A k y)
  let lift := spinConnectionLift.toContinuousLinearMap
  have hΓ (k : Fin 4) : DifferentiableAt ℝ (Γ k) x :=
    (lift.hasFDerivAt.comp x (hA k).hasFDerivAt).differentiableAt
  change SpinFrameCommutator R (ψ x)
    (fun i j => spinCovariantDerivative Γ i (spinCovariantDerivative Γ j ψ) x)
  intro i j
  change spinCovariantDerivative Γ i (spinCovariantDerivative Γ j ψ) x -
    spinCovariantDerivative Γ j (spinCovariantDerivative Γ i ψ) x = _
  rw [spinCovariantDerivative_commutator hψ i j (hΓ i) (hΓ j),
    spinCoordinateCurvature_connectionLift i j hA hskew, hR]
  simp only [spinConnectionLift, LinearMap.coe_mk, AddHom.coe_mk, Matrix.of_apply,
    frameCurvatureQuaternion, smul_mul_assoc]

end FirstOrderTwistor
