import Mathlib.Basic.Real.Basic
import Mathlib.Data.Fintype.Fin
import Mathlib.LinearAlgebra.QuadraticForm.Signature
import Mathlib.Tactic.FinCases
import Mathlib.Tactic.NormNum

/-! # Morse index of a principal Hessian -/

open LinearMap Module

namespace SmoothPoincare

noncomputable section

local instance : Invertible (2 : ℝ) := invertibleOfNonzero (by norm_num)

variable {V : Type*} [AddCommGroup V] [Module ℝ V]

/-- A quadratic form with diagonal `B(v,v)) for symmetric `B` has
that very bilinear form as its associated form. -/
theorem principalQuadratic_associated_eq (Q : QuadraticForm ℝ V)
    (B : LinearMap.BilinForm ℝ V) (hQuadratic : ∀ v, Q v = B v v) (hSymmetric : B.IsSymm) :
    QuadraticMap.associated (R := ℝ) Q = B := by
  have hEq : B.toQuadraticMap = Q := QuadraticMap.ext fun v => (hQuadratic v).symm
  rw [← hEq]
  exact QuadraticMap.associated_left_inverse ℝ hSymmetric.eq

private theorem principalQuadratic_equivalent (Q : QuadraticForm ℝ V)
    (B : LinearMap.BilinForm ℝ V) (b : Basis (Fin 4) ℝ V) (k : Fin 4 → ℝ)
    (hQuadratic : ∀ v, Q v = B v v) (hSymmetric : B.IsSymm)
    (hDiagonal : ∀ i j, B (b i) (b j) = if i = j then k i else 0) :
    Q.Equivalent (QuadraticMap.weightedSumSquares ℝ k) := by
  classical
  have hAssociated := principalQuadratic_associated_eq Q B hQuadratic hSymmetric
  have hOrthogonal : (QuadraticMap.associated (R := ℝ) Q).IsOrthoᵢ b := by
    intro i j hij
    change QuadraticMap.associated (R := ℝ) Q (b i) (b j) = 0
    simp [hAssociated, hDiagonal i j, hij]
  have hWeights : (fun i => Q (b i)) = k := by
    funext i
    rw [hQuadratic (b i), hDiagonal i i]
    simp
  rw [← hWeights, ← QuadraticMap.basisRepr_eq_of_iIsOrtho Q b hOrthogonal]
  exact ⟨Q.isometryEquivBasisRepr b⟩

/-- The two possible signs of the principal Hessian have negative
indices given by the negative and positive principal counts. -/
theorem principalQuadratic_signature (Q : QuadraticForm ℝ V)
    (B : LinearMap.BilinForm ℝ V) (b : Basis (Fin 4) ℝ V) (k : Fin 4 → ℝ)
    (hQuadratic : ∀ v, Q v = B v v) (hSymmetric : B.IsSymm)
    (hDiagonal : ∀ i j, B (b i) (b j) = if i = j then k i else 0) :
    sigNeg Q = {i | k i < 0}.ncard ∧
      sigNeg (-Q) = {i | 0 < k i}.ncard := by
  have hEquivalent := principalQuadratic_equivalent Q B b k hQuadratic hSymmetric hDiagonal
  refine ⟨QuadraticForm.sigNeg_of_equiv_weightedSumSquares hEquivalent, ?_⟩
  rw [sigNeg_neg]
  exact QuadraticForm.sigPos_of_equiv_weightedSumSquares hEquivalent

/-- With no zero principal weights, both Hessian signs and the
associated Hessian bilinear form are nondegenerate. -/
theorem principalQuadratic_nondegenerate [FiniteDimensional ℝ V] (Q : QuadraticForm ℝ V)
    (B : LinearMap.BilinForm ℝ V) (b : Basis (Fin 4) ℝ V) (k : Fin 4 → ℝ)
    (hQuadratic : ∀ v, Q v = B v v) (hSymmetric : B.IsSymm)
    (hDiagonal : ∀ i j, B (b i) (b j) = if i = j then k i else 0)
    (hk : ∀ i, k i ≠ 0) : Q.Nondegenerate ∧ (-Q).Nondegenerate ∧ B.Nondegenerate := by
  have hEquivalent := principalQuadratic_equivalent Q B b k hQuadratic hSymmetric hDiagonal
  have hRank := QuadraticForm.finrank_radical_of_equiv_weightedSumSquares hEquivalent
  have hEmpty : {i | k i = 0} = (∅ : Set (Fin 4)) := by
    ext i
    simp [hk i]
  rw [hEmpty, Set.ncard_empty] at hRank
  have hRadical : Q.radical = ⊥ := Submodule.finrank_eq_zero.mp hRank
  have hNegRadical : (-Q).radical = Q.radical := by
    rw [QuadraticMap.radical_eq_ker_associated, QuadraticMap.radical_eq_ker_associated,
      map_neg, LinearMap.ker_neg]
  have hNondegenerate : Q.Nondegenerate := QuadraticMap.nondegenerate_iff_radical_eq_bot.mpr hRadical
  have hAssociated := principalQuadratic_associated_eq Q B hQuadratic hSymmetric
  refine ⟨hNondegenerate, ?_, ?_⟩
  · exact QuadraticMap.nondegenerate_iff_radical_eq_bot.mpr (hNegRadical.trans hRadical)
  · rw [← hAssociated]
    exact QuadraticMap.nondegenerate_associated_iff.mpr hNondegenerate

/-- On the ordered middle-signature locus, either normal sign gives a
nondegenerate Hessian of index two. -/
theorem principalQuadratic_twoMiddle_of_orderedSigns [FiniteDimensional ℝ V]
    (Q : QuadraticForm ℝ V) (B : LinearMap.BilinForm ℝ V) (b : Basis (Fin 4) ℝ V)
    (k : Fin 4 → ℝ) (hQuadratic : ∀ v, Q v = B v v) (hSymmetric : B.IsSymm)
    (hDiagonal : ∀ i j, B (b i) (b j) = if i = j then k i else 0)
    (h₀ : k 0 < 0) (h₁ : k 1 < 0) (h₂ : 0 < k 2) (h₃ : 0 < k 3) :
    sigNeg Q = 2 ∧ sigNeg (-Q) = 2 ∧
      Q.Nondegenerate ∧ (-Q).Nondegenerate := by
  have hNegative : {i | k i < 0} = ({0, 1} : Set (Fin 4)) := by
    ext i
    fin_cases i <;> simp [h₀, h₁, not_lt_of_ge h₂.le, not_lt_of_ge h₃.le]
  have hPositive : {i | 0 < k i} = ({2, 3} : Set (Fin 4)) := by
    ext i
    fin_cases i <;> simp [not_lt_of_ge h₀.le, not_lt_of_ge h₁.le, h₂, h₃]
  have hk (i : Fin 4) : k i ≠ 0 := by
    fin_cases i
    · exact h₀.ne
    · exact h₁.ne
    · exact h₂.ne'
    · exact h₃.ne'
  obtain ⟨hMinus, hPlus⟩ := principalQuadratic_signature Q B b k hQuadratic hSymmetric hDiagonal
  rw [hNegative, Set.ncard_pair (by decide : (0 : Fin 4) ≠ 1)] at hMinus
  rw [hPositive, Set.ncard_pair (by decide : (2 : Fin 4) ≠ 3)] at hPlus
  obtain ⟨hRegular, hRegularNeg, _⟩ :=
    principalQuadratic_nondegenerate Q B b k hQuadratic hSymmetric hDiagonal hk
  exact ⟨hMinus, hPlus, hRegular, hRegularNeg⟩

end
end SmoothPoincare
