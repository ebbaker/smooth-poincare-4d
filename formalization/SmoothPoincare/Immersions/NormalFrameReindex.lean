import SmoothPoincare.Immersions.CodazziJets
import Mathlib.GroupTheory.Perm.Sign

/-! # Reindexing a principal frame after reversing the unit normal -/

namespace SmoothPoincare

/-- Exchange the two negative slots with the two positive slots. -/
def balancedSignSwap : Equiv.Perm (Fin 4) := Equiv.swap 0 2 * Equiv.swap 1 3

theorem balancedSignSwap_sign : Equiv.Perm.sign balancedSignSwap = 1 := by
  unfold balancedSignSwap
  rw [map_mul, Equiv.Perm.sign_swap (by decide : (0 : Fin 4) ≠ 2),
    Equiv.Perm.sign_swap (by decide : (1 : Fin 4) ≠ 3), neg_mul_neg, one_mul]

private theorem balancedSignSwap_flip (i : Fin 4) :
    saturatedPrincipalSign (balancedSignSwap.symm i) = -saturatedPrincipalSign i := by
  fin_cases i
  · change saturatedPrincipalSign (balancedSignSwap.symm 0) = -saturatedPrincipalSign 0
    rw [show balancedSignSwap.symm (0 : Fin 4) = 2 by decide]
    norm_num [saturatedPrincipalSign]
  · change saturatedPrincipalSign (balancedSignSwap.symm 1) = -saturatedPrincipalSign 1
    rw [show balancedSignSwap.symm (1 : Fin 4) = 3 by decide]
    norm_num [saturatedPrincipalSign]
  · change saturatedPrincipalSign (balancedSignSwap.symm 2) = -saturatedPrincipalSign 2
    rw [show balancedSignSwap.symm (2 : Fin 4) = 0 by decide]
    norm_num [saturatedPrincipalSign]
  · change saturatedPrincipalSign (balancedSignSwap.symm 3) = -saturatedPrincipalSign 3
    rw [show balancedSignSwap.symm (3 : Fin 4) = 1 by decide]
    norm_num [saturatedPrincipalSign]

/-- Reversing the normal multiplies the scalar form by `-1`. The fixed even
permutation then restores the ordered balanced spectrum in an orthonormal basis. -/
theorem exists_reindexedBalancedNormalFrame {E : Type*} [AddCommGroup E] [Module ℝ E]
    (b : Module.Basis (Fin 4) ℝ E) (K B : E → E → ℝ) {a ε : ℝ}
    (hε : ε = 1 ∨ ε = -1)
    (hOrtho : ∀ i j, K (b i) (b j) = if i = j then 1 else 0)
    (hForm : ∀ i j, B (b i) (b j) = if i = j then ε * (saturatedPrincipalSign i * a) else 0) :
    ∃ c : Module.Basis (Fin 4) ℝ E,
      (∀ i j, K (c i) (c j) = if i = j then 1 else 0) ∧
      (∀ i j, B (c i) (c j) = if i = j then saturatedPrincipalSign i * a else 0) := by
  rcases hε with rfl | rfl
  · exact ⟨b, hOrtho, fun i j => by simpa only [one_mul] using hForm i j⟩
  refine ⟨b.reindex balancedSignSwap, ?_, ?_⟩
  · intro i j
    rw [Module.Basis.reindex_apply, Module.Basis.reindex_apply, hOrtho]
    simp only [Equiv.apply_eq_iff_eq]
  · intro i j
    rw [Module.Basis.reindex_apply, Module.Basis.reindex_apply, hForm, balancedSignSwap_flip]
    simp only [Equiv.apply_eq_iff_eq, neg_mul, neg_neg, one_mul]

/-- Two collinear unit vectors in a real inner product space agree up to sign. -/
theorem unitNormal_eq_or_eq_neg_of_collinear {W : Type*}
    [NormedAddCommGroup W] [InnerProductSpace ℝ W] {u v : W}
    (hu : inner ℝ u u = 1) (hv : inner ℝ v v = 1) (hCollinear : ∃ ε : ℝ, v = ε • u) :
    v = u ∨ v = -u := by
  obtain ⟨ε, rfl⟩ := hCollinear
  have hε : ε ^ 2 = 1 := by
    simpa only [real_inner_smul_left, real_inner_smul_right, hu, mul_one, pow_two] using hv
  rcases sq_eq_one_iff.mp hε with rfl | rfl
  · exact Or.inl (one_smul ℝ u)
  · exact Or.inr (neg_one_smul ℝ u)

end SmoothPoincare
