import FirstOrderTwistor.SpinCurvature
import Mathlib.Tactic.Linarith

/-!
# The positive spin connection lift in an orthonormal frame

Write a frame connection matrix as `A a b = ⟨∇e_b, e_a⟩`. Its spin lift on
the positive quaternionic half is left multiplication by minus one half of
the quaternion with imaginary coordinates `A₀₁ + A₂₃`, `A₀₂ + A₃₁`,
and `A₀₃ + A₁₂`. The Lie bracket check below uses that matrix slot order.
The curvature statement takes the connection matrices and their first
derivatives in a coordinate frame as supplied coefficients.
-/

namespace FirstOrderTwistor

open scoped Quaternion

/-- Coefficient map for the positive spin lift of a real skew connection matrix.
The formula extends linearly to all real matrices. -/
noncomputable def spinConnectionLift : Matrix (Fin 4) (Fin 4) ℝ →ₗ[ℝ] ℍ[ℝ] where
  toFun A := (-1 / 2 : ℝ) • (⟨0, A 0 1 + A 2 3, A 0 2 + A 3 1, A 0 3 + A 1 2⟩ : ℍ[ℝ])
  map_add' A B := by
    apply Quaternion.ext <;> simp [smul_eq_mul] <;> ring
  map_smul' r A := by
    apply Quaternion.ext <;> simp [smul_eq_mul] <;> ring

/-- On skew matrices the positive spin lift preserves the commutator. -/
theorem spinConnectionLift_commutator (A B : Matrix (Fin 4) (Fin 4) ℝ)
    (hA : ∀ a b, A b a = -A a b) (hB : ∀ a b, B b a = -B a b) :
    spinConnectionLift (A * B - B * A) =
      spinConnectionLift A * spinConnectionLift B - spinConnectionLift B * spinConnectionLift A := by
  have hDiagA (a : Fin 4) : A a a = 0 := by linarith [hA a a]
  have hDiagB (a : Fin 4) : B a a = 0 := by linarith [hB a a]
  apply Quaternion.ext <;>
    simp [spinConnectionLift, smul_eq_mul, Matrix.mul_apply, Fin.sum_univ_four, hDiagA, hDiagB,
      hA 0 1, hA 0 2, hA 0 3, hA 1 2, hA 3 1, hA 2 3,
      hB 0 1, hB 0 2, hB 0 3, hB 1 2, hB 3 1, hB 2 3] <;> ring

/-- The lift carries the frame curvature of a connection to its spin curvature
in a commuting coordinate frame. Here `dΓ i j` is the supplied derivative
of the coefficient `Γ j` in direction `i`. -/
theorem spinConnectionLift_frameCurvature
    (Γ : Fin 4 → Matrix (Fin 4) (Fin 4) ℝ)
    (dΓ : Fin 4 → Fin 4 → Matrix (Fin 4) (Fin 4) ℝ)
    (i j : Fin 4) (hΓ : ∀ k a b, Γ k b a = -Γ k a b) :
    spinConnectionLift (dΓ i j - dΓ j i + (Γ i * Γ j - Γ j * Γ i)) =
      spinConnectionLift (dΓ i j) - spinConnectionLift (dΓ j i) +
        (spinConnectionLift (Γ i) * spinConnectionLift (Γ j) -
          spinConnectionLift (Γ j) * spinConnectionLift (Γ i)) := by
  rw [map_add, map_sub, spinConnectionLift_commutator _ _ (hΓ i) (hΓ j)]

end FirstOrderTwistor
