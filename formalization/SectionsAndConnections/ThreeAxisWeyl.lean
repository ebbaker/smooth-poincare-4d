import Mathlib.Algebra.BigOperators.Fin
import Mathlib.Analysis.Complex.Norm
import Mathlib.LinearAlgebra.Matrix.Symmetric
import Mathlib.LinearAlgebra.Matrix.Trace
import Mathlib.Tactic.LinearCombination
import Mathlib.Tactic.Ring

/-!
# The three-axis Weyl estimate

In orthonormal coordinates a chiral Weyl block is a real symmetric trace-free
matrix of size three. We evaluate it on one complex null vector for each axis.
All pairings below extend the real dot product bilinearly.
-/

namespace SectionsAndConnections

open scoped BigOperators

/-- The vector `(nⱼ + I nₖ) / √2` for the cyclic triple `(i, j, k)` in `Fin 3`. -/
noncomputable def axisNullVector (i : Fin 3) : Fin 3 → ℂ :=
  (↑(Real.sqrt 2) : ℂ)⁻¹ • (Pi.single (i + 1) 1 + Complex.I • Pi.single (i + 2) 1)

/-- The complex bilinear pairing of `W ζᵢ` with `ζᵢ`. -/
noncomputable def axisNullEvaluation (W : Matrix (Fin 3) (Fin 3) ℝ) (i : Fin 3) : ℂ :=
  dotProduct ((W.map ((↑) : ℝ → ℂ)).mulVec (axisNullVector i)) (axisNullVector i)

/-- The measured magnitude `qᵢ`. -/
noncomputable def axisMagnitude (W : Matrix (Fin 3) (Fin 3) ℝ) (i : Fin 3) : ℝ :=
  ‖axisNullEvaluation W i‖

/-- The squared Hilbert–Schmidt norm counts all nine ordered entries. -/
noncomputable def hilbertSchmidtSq (W : Matrix (Fin 3) (Fin 3) ℝ) : ℝ :=
  ∑ i, ∑ j, W i j ^ 2

/-- Symmetry combines the mixed terms in the normalized bilinear pairing. -/
theorem axisNullEvaluation_eq (W : Matrix (Fin 3) (Fin 3) ℝ) (hW : W.IsSymm) (i : Fin 3) :
    axisNullEvaluation W i = (↑((W (i + 1) (i + 1) - W (i + 2) (i + 2)) / 2) : ℂ) +
      ↑(W (i + 1) (i + 2)) * Complex.I := by
  have hSq : (↑(Real.sqrt 2) : ℂ) ^ 2 = 2 := by
    rw [← Complex.ofReal_pow, Real.sq_sqrt (by norm_num : (0 : ℝ) ≤ 2), Complex.ofReal_ofNat]
  -- Each bilinear slot contributes one factor of the inverse square root.
  simp only [axisNullEvaluation, axisNullVector, Matrix.mulVec_smul, smul_dotProduct,
    dotProduct_smul, smul_eq_mul]
  rw [← mul_assoc, ← pow_two, inv_pow, hSq]
  simp only [Matrix.mulVec_add, Matrix.mulVec_smul, Matrix.mulVec_single_one,
    dotProduct_add, dotProduct_smul, dotProduct_single_one, Pi.add_apply, Pi.smul_apply,
    Matrix.col_apply, Matrix.map_apply, hW.apply (i + 1) (i + 2), smul_eq_mul,
    Complex.ofReal_div, Complex.ofReal_sub, Complex.ofReal_ofNat]
  rw [mul_add Complex.I, ← mul_assoc Complex.I Complex.I, Complex.I_mul_I]
  ring

/-- The cyclic squared magnitudes recover the stated diagonal and off-diagonal sums
and bound half the squared Hilbert–Schmidt norm (manuscript `secjet:orthogonal`). -/
theorem threeAxisWeylEstimate (W : Matrix (Fin 3) (Fin 3) ℝ) (hW : W.IsSymm)
    (htr : W.trace = 0) :
    (∑ i, axisMagnitude W i ^ 2) =
        3 / 4 * (∑ i, W i i ^ 2) + (∑ i, ∑ j with i < j, W i j ^ 2) ∧
      1 / 2 * hilbertSchmidtSq W ≤ ∑ i, axisMagnitude W i ^ 2 := by
  have hMagnitude (i : Fin 3) : axisMagnitude W i ^ 2 =
      ((W (i + 1) (i + 1) - W (i + 2) (i + 2)) / 2) ^ 2 + W (i + 1) (i + 2) ^ 2 := by
    rw [axisMagnitude, Complex.sq_norm, axisNullEvaluation_eq W hW, Complex.normSq_add_mul_I]
  have hTrace : W 0 0 + W 1 1 + W 2 2 = 0 := by
    simpa only [Matrix.trace, Matrix.diag_apply, Fin.sum_univ_three] using htr
  have hUpper : (∑ i, ∑ j with i < j, W i j ^ 2) =
      W 0 1 ^ 2 + W 0 2 ^ 2 + W 1 2 ^ 2 := by
    simp (config := { decide := true }) only [Finset.sum_filter, Fin.sum_univ_three,
      ite_true, ite_false, zero_add, add_zero]
  have hSum : (∑ i, axisMagnitude W i ^ 2) =
      3 / 4 * (∑ i, W i i ^ 2) + (∑ i, ∑ j with i < j, W i j ^ 2) := by
    rw [hUpper]
    simp only [Fin.sum_univ_three, hMagnitude, Fin.reduceAdd]
    rw [hW.apply 0 2]
    -- The difference between the two sides is minus one quarter of the trace squared.
    linear_combination -(W 0 0 + W 1 1 + W 2 2) / 4 * hTrace
  have hSplit : hilbertSchmidtSq W =
      (∑ i, W i i ^ 2) + 2 * (∑ i, ∑ j with i < j, W i j ^ 2) := by
    rw [hUpper]
    simp only [hilbertSchmidtSq, Fin.sum_univ_three, hW.apply 0 1, hW.apply 0 2, hW.apply 1 2]
    ring
  refine ⟨hSum, ?_⟩
  rw [hSum, hSplit]
  have hDiag : 0 ≤ ∑ i, W i i ^ 2 := Finset.sum_nonneg fun i _ => sq_nonneg (W i i)
  linear_combination (1 / 4 : ℝ) * hDiag

end SectionsAndConnections
