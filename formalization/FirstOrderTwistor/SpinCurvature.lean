import Mathlib.Analysis.Quaternion
import Mathlib.Tactic.FinCases
import SectionsAndConnections.ThreeAxisWeyl

/-!
# The positive half-spin curvature norm in an orthonormal frame

A quaternion models a positive half-spinor. Its complex structure is right
multiplication by the first imaginary unit, so left quaternion multiplication
commutes with it. The oriented self-dual basis is
`(e⁰¹ + e²³, e⁰² + e³¹, e⁰³ + e¹²) / √2`. Its three actions on the
positive half are left multiplication by `√2` times the imaginary units.

This file proves the finite-fiber part of DIR `prop:weyl-defect`. Identifying
the algebraic Weyl term with the exterior covariant derivative of a twistor
defect on a spin manifold requires the differential identity.
-/

namespace FirstOrderTwistor

open scoped BigOperators Quaternion RealInnerProductSpace

/-- The imaginary quaternion units in order. -/
noncomputable def spinUnit : Fin 3 → ℍ[ℝ] :=
  ![⟨0, 1, 0, 0⟩, ⟨0, 0, 1, 0⟩, ⟨0, 0, 0, 1⟩]

/-- The quaternion giving Clifford action by a real self-dual two-form. -/
noncomputable def selfDualCliffordQuaternion (row : Fin 3 → ℝ) : ℍ[ℝ] :=
  ⟨0, Real.sqrt 2 * row 0, Real.sqrt 2 * row 1, Real.sqrt 2 * row 2⟩

/-- Clifford action on the positive half-spin fiber. -/
noncomputable def selfDualClifford (row : Fin 3 → ℝ) (ψ : ℍ[ℝ]) : ℍ[ℝ] :=
  selfDualCliffordQuaternion row * ψ

/-- Clifford action of a unit basis two-form on the positive half-spin fiber. -/
noncomputable def selfDualCliffordGenerator (a : Fin 3) (ψ : ℍ[ℝ]) : ℍ[ℝ] :=
  (Real.sqrt 2 • spinUnit a) * ψ

/-- A real self-dual two-form scales the spinor norm squared by twice its squared norm. -/
theorem selfDualClifford_normSq (row : Fin 3 → ℝ) (ψ : ℍ[ℝ]) :
    Quaternion.normSq (selfDualClifford row ψ) =
      2 * (∑ a, row a ^ 2) * Quaternion.normSq ψ := by
  rw [selfDualClifford, map_mul, Quaternion.normSq_def' (selfDualCliffordQuaternion row)]
  simp only [selfDualCliffordQuaternion, Fin.sum_univ_three, zero_pow (by decide : 2 ≠ 0),
    zero_add, mul_pow, Real.sq_sqrt (by norm_num : (0 : ℝ) ≤ 2)]
  ring

/-- Coefficients of the Weyl action on a spinor, indexed by the input form basis. -/
noncomputable def weylSpinRows (W : Matrix (Fin 3) (Fin 3) ℝ) (ψ : ℍ[ℝ]) :
    Fin 3 → ℍ[ℝ] :=
  fun a => selfDualClifford (fun b => W b a) ψ

/-- The algebraic Weyl term with the sign and coefficient of the spin curvature convention. -/
noncomputable def weylSpinDefect (W : Matrix (Fin 3) (Fin 3) ℝ) (ψ : ℍ[ℝ]) :
    Fin 3 → ℍ[ℝ] :=
  fun a => (-1 / 2 : ℝ) • weylSpinRows W ψ a

/-- The squared norm of the algebraic Weyl term in the product metric. -/
theorem weylSpinDefect_normSq (W : Matrix (Fin 3) (Fin 3) ℝ) (ψ : ℍ[ℝ]) :
    (∑ a, Quaternion.normSq (weylSpinDefect W ψ a)) =
      (1 / 2 : ℝ) * SectionsAndConnections.hilbertSchmidtSq W * Quaternion.normSq ψ := by
  simp only [weylSpinDefect, Quaternion.normSq_smul, weylSpinRows, selfDualClifford_normSq]
  rw [SectionsAndConnections.hilbertSchmidtSq, Finset.sum_comm]
  simp only [Finset.mul_sum, Finset.sum_mul]
  apply Finset.sum_congr rfl
  intro a _
  apply Finset.sum_congr rfl
  intro b _
  ring

/-- Clifford contraction of a positive spinor-valued self-dual form. -/
noncomputable def selfDualCliffordTrace (T : Fin 3 → ℍ[ℝ]) : ℍ[ℝ] :=
  ∑ a, selfDualCliffordGenerator a (T a)

/-- The adjoint of Clifford contraction has coefficients `-c(ωₐ) ψ`. -/
noncomputable def selfDualCliffordTraceAdjoint (ψ : ℍ[ℝ]) : Fin 3 → ℍ[ℝ] :=
  fun a => -selfDualCliffordGenerator a ψ

/-- Clifford contraction and its adjoint for the real inner products of the fibers. -/
theorem selfDualCliffordTrace_inner (T : Fin 3 → ℍ[ℝ]) (ψ : ℍ[ℝ]) :
    ⟪selfDualCliffordTrace T, ψ⟫ =
      ∑ a, ⟪T a, selfDualCliffordTraceAdjoint ψ a⟫ := by
  rw [selfDualCliffordTrace, sum_inner]
  apply Finset.sum_congr rfl
  intro a _
  fin_cases a <;>
    simp [Quaternion.inner_def, selfDualCliffordTraceAdjoint, selfDualCliffordGenerator,
      spinUnit] <;> ring

/-- In the unit self-dual basis, contraction followed on the right by its adjoint is `6 I`. -/
theorem selfDualCliffordTrace_traceAdjoint (ψ : ℍ[ℝ]) :
    selfDualCliffordTrace (selfDualCliffordTraceAdjoint ψ) = (6 : ℝ) • ψ := by
  have hSq := Real.sq_sqrt (by norm_num : (0 : ℝ) ≤ 2)
  apply Quaternion.ext <;>
    simp [selfDualCliffordTrace, selfDualCliffordTraceAdjoint, selfDualCliffordGenerator,
      spinUnit, Fin.sum_univ_three, smul_eq_mul] <;>
    first
    | linear_combination 3 * ψ.re * hSq
    | linear_combination 3 * ψ.imI * hSq
    | linear_combination 3 * ψ.imJ * hSq
    | linear_combination 3 * ψ.imK * hSq

private theorem selfDualCliffordTrace_smul (r : ℝ) (T : Fin 3 → ℍ[ℝ]) :
    selfDualCliffordTrace (r • T) = r • selfDualCliffordTrace T := by
  simp only [selfDualCliffordTrace, selfDualCliffordGenerator, Pi.smul_apply,
    mul_smul_comm, Finset.smul_sum]

private theorem selfDualCliffordTrace_add (T U : Fin 3 → ℍ[ℝ]) :
    selfDualCliffordTrace (T + U) = selfDualCliffordTrace T + selfDualCliffordTrace U := by
  simp [selfDualCliffordTrace, selfDualCliffordGenerator, mul_add, Finset.sum_add_distrib]

private theorem selfDualCliffordTrace_sub (T U : Fin 3 → ℍ[ℝ]) :
    selfDualCliffordTrace (T - U) = selfDualCliffordTrace T - selfDualCliffordTrace U := by
  simp [selfDualCliffordTrace, selfDualCliffordGenerator, mul_sub, Finset.sum_sub_distrib]

private theorem selfDualCliffordTraceAdjoint_smul (r : ℝ) (ψ : ℍ[ℝ]) :
    selfDualCliffordTraceAdjoint (r • ψ) = r • selfDualCliffordTraceAdjoint ψ := by
  funext a
  simp [selfDualCliffordTraceAdjoint, selfDualCliffordGenerator]

private theorem selfDualCliffordTraceAdjoint_add (ψ χ : ℍ[ℝ]) :
    selfDualCliffordTraceAdjoint (ψ + χ) =
      selfDualCliffordTraceAdjoint ψ + selfDualCliffordTraceAdjoint χ := by
  funext a
  simp [selfDualCliffordTraceAdjoint, selfDualCliffordGenerator, mul_add, add_comm]

/-- The projection `I - m* m / 6` for Clifford contraction `m`. -/
noncomputable def selfDualCliffordProjection (T : Fin 3 → ℍ[ℝ]) : Fin 3 → ℍ[ℝ] :=
  T - (1 / 6 : ℝ) • selfDualCliffordTraceAdjoint (selfDualCliffordTrace T)

/-- Projected spinor-valued forms have zero Clifford contraction. -/
theorem selfDualCliffordTrace_projection (T : Fin 3 → ℍ[ℝ]) :
    selfDualCliffordTrace (selfDualCliffordProjection T) = 0 := by
  rw [selfDualCliffordProjection, selfDualCliffordTrace_sub, selfDualCliffordTrace_smul,
    selfDualCliffordTrace_traceAdjoint, smul_smul]
  norm_num

/-- The projection fixes the kernel of Clifford contraction. -/
theorem selfDualCliffordProjection_eq_self (T : Fin 3 → ℍ[ℝ])
    (hT : selfDualCliffordTrace T = 0) :
    selfDualCliffordProjection T = T := by
  funext a
  simp [selfDualCliffordProjection, hT, selfDualCliffordTraceAdjoint, selfDualCliffordGenerator]

/-- The part removed by the projection is orthogonal to the Clifford kernel. -/
theorem selfDualCliffordProjection_orthogonal (T U : Fin 3 → ℍ[ℝ])
    (hU : selfDualCliffordTrace U = 0) :
    (∑ a, ⟪U a, T a - selfDualCliffordProjection T a⟫) = 0 := by
  simp only [selfDualCliffordProjection, Pi.sub_apply, sub_sub_cancel, Pi.smul_apply,
    real_inner_smul_right, ← Finset.mul_sum, ← selfDualCliffordTrace_inner, hU,
    inner_zero_left, mul_zero]

/-- The projection kills the image of the adjoint. -/
theorem selfDualCliffordProjection_traceAdjoint (ψ : ℍ[ℝ]) :
    selfDualCliffordProjection (selfDualCliffordTraceAdjoint ψ) = 0 := by
  rw [selfDualCliffordProjection, selfDualCliffordTrace_traceAdjoint,
    selfDualCliffordTraceAdjoint_smul, smul_smul]
  norm_num

/-- The Clifford projection is additive. -/
theorem selfDualCliffordProjection_add (T U : Fin 3 → ℍ[ℝ]) :
    selfDualCliffordProjection (T + U) =
      selfDualCliffordProjection T + selfDualCliffordProjection U := by
  simp only [selfDualCliffordProjection, selfDualCliffordTrace_add,
    selfDualCliffordTraceAdjoint_add, smul_add]
  abel

/-- Symmetry and vanishing trace put the Weyl action in the Clifford kernel. -/
theorem selfDualCliffordTrace_weylSpinRows (W : Matrix (Fin 3) (Fin 3) ℝ) (ψ : ℍ[ℝ])
    (hW : W.IsSymm) (htr : W.trace = 0) :
    selfDualCliffordTrace (weylSpinRows W ψ) = 0 := by
  have hDiag : W 0 0 + W 1 1 + W 2 2 = 0 := by
    simpa only [Matrix.trace, Matrix.diag_apply, Fin.sum_univ_three] using htr
  have hClifford :
      (∑ a, (Real.sqrt 2 • spinUnit a) * selfDualCliffordQuaternion (fun b => W b a)) = 0 := by
    apply Quaternion.ext <;>
      simp [spinUnit, selfDualCliffordQuaternion, Fin.sum_univ_three, smul_eq_mul,
        hW.apply 0 1, hW.apply 0 2, hW.apply 1 2]
    linear_combination -(Real.sqrt 2)^2 * hDiag
  simp only [selfDualCliffordTrace, selfDualCliffordGenerator, weylSpinRows, selfDualClifford,
    ← mul_assoc, ← Finset.sum_mul, hClifford, zero_mul]

/-- Projecting the signed Weyl term plus any Clifford trace term returns the Weyl term. -/
theorem selfDualCliffordProjection_weylSpinDefect_add_adjoint
    (W : Matrix (Fin 3) (Fin 3) ℝ) (ψ η : ℍ[ℝ]) (hW : W.IsSymm) (htr : W.trace = 0) :
    selfDualCliffordProjection (weylSpinDefect W ψ + selfDualCliffordTraceAdjoint η) =
      weylSpinDefect W ψ := by
  have hDefect : weylSpinDefect W ψ = (-1 / 2 : ℝ) • weylSpinRows W ψ := rfl
  rw [selfDualCliffordProjection_add, selfDualCliffordProjection_traceAdjoint, add_zero]
  apply selfDualCliffordProjection_eq_self
  rw [hDefect, selfDualCliffordTrace_smul, selfDualCliffordTrace_weylSpinRows W ψ hW htr,
    smul_zero]

end FirstOrderTwistor
