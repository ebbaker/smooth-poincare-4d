import Mathlib.Analysis.Real.Sqrt
import Mathlib.Tactic

/-! # Scalar curvature inequalities for hypersurfaces in Euclidean five-space

The formulas use the Hilbert–Schmidt norm of one chiral Weyl endomorphism.
They operate on four real principal curvatures.
-/

namespace SmoothPoincare

private theorem two_sqrt_le_sum {x y p : ℝ} (hx : 0 ≤ x) (hy : 0 ≤ y)
    (hxy : x * y = p) :
    2 * √p ≤ x + y ∧ (x + y = 2 * √p → x = y) := by
  have hp : 0 ≤ p := hxy ▸ mul_nonneg hx hy
  have hroot : 0 ≤ 2 * √p := mul_nonneg (by norm_num) (Real.sqrt_nonneg p)
  have hsquare : (2 * √p) ^ 2 = 4 * p := by
    rw [mul_pow, Real.sq_sqrt hp]
    ring
  have hdiff : (x + y) ^ 2 - (2 * √p) ^ 2 = (x - y) ^ 2 := by
    rw [hsquare, ← hxy]
    ring
  constructor
  · apply (sq_le_sq₀ hroot (add_nonneg hx hy)).mp
    linarith only [hdiff, sq_nonneg (x - y)]
  · intro heq
    rw [heq, sub_self] at hdiff
    exact sub_eq_zero.mp (pow_eq_zero hdiff.symm)

/-- On signature `(2,2)`, the principal Weyl formula bounds the determinant,
with equality exactly when the four absolute principal curvatures agree. -/
theorem middleSignatureWeylBound (a b c d : ℝ)
    (ha : 0 < a) (hb : 0 < b) (hc : 0 < c) (hd : 0 < d) :
    let s₁ := a * b + c * d
    let s₂ := -(a * c + b * d)
    let s₃ := -(a * d + b * c)
    let w := ((s₁ - s₂) ^ 2 + (s₁ - s₃) ^ 2 + (s₂ - s₃) ^ 2) / 12
    let t := (8 / 3 : ℝ) * (a * b * c * d)
    t ≤ w ∧ (w = t ↔ a = b ∧ b = c ∧ c = d) := by
  let p := a * b * c * d
  let s₁ := a * b + c * d
  let s₂ := -(a * c + b * d)
  let s₃ := -(a * d + b * c)
  let w := ((s₁ - s₂) ^ 2 + (s₁ - s₃) ^ 2 + (s₂ - s₃) ^ 2) / 12
  change (8 / 3 : ℝ) * p ≤ w ∧ (w = (8 / 3 : ℝ) * p ↔ _)
  have hp : 0 ≤ p := (mul_pos (mul_pos (mul_pos ha hb) hc) hd).le
  have hroot : 0 ≤ 4 * √p := mul_nonneg (by norm_num) (Real.sqrt_nonneg p)
  have hroot_sq : (4 * √p) ^ 2 = 16 * p := by
    rw [mul_pow, Real.sq_sqrt hp]
    ring
  have h₁ : 2 * √p ≤ s₁ ∧ (s₁ = 2 * √p → a * b = c * d) :=
    two_sqrt_le_sum (mul_pos ha hb).le (mul_pos hc hd).le (by dsimp [p]; ring)
  have h₂ : 2 * √p ≤ -s₂ ∧ (-s₂ = 2 * √p → a * c = b * d) := by
    simpa only [s₂, neg_neg] using
      two_sqrt_le_sum (mul_pos ha hc).le (mul_pos hb hd).le
        (show (a * c) * (b * d) = p by dsimp [p]; ring)
  have h₃ : 2 * √p ≤ -s₃ ∧ (-s₃ = 2 * √p → a * d = b * c) := by
    simpa only [s₃, neg_neg] using
      two_sqrt_le_sum (mul_pos ha hd).le (mul_pos hb hc).le
        (show (a * d) * (b * c) = p by dsimp [p]; ring)
  have h₁₂ : 4 * √p ≤ s₁ - s₂ := by linarith only [h₁.1, h₂.1]
  have h₁₃ : 4 * √p ≤ s₁ - s₃ := by linarith only [h₁.1, h₃.1]
  have h₁₂_sq : (4 * √p) ^ 2 ≤ (s₁ - s₂) ^ 2 :=
    (sq_le_sq₀ hroot (hroot.trans h₁₂)).mpr h₁₂
  have h₁₃_sq : (4 * √p) ^ 2 ≤ (s₁ - s₃) ^ 2 :=
    (sq_le_sq₀ hroot (hroot.trans h₁₃)).mpr h₁₃
  have h₂₃_sq := sq_nonneg (s₂ - s₃)
  constructor
  · dsimp only [w]
    linarith only [h₁₂_sq, h₁₃_sq, h₂₃_sq, hroot_sq]
  · constructor
    · intro heq
      dsimp only [w] at heq
      have eq₁₂_sq : (s₁ - s₂) ^ 2 = (4 * √p) ^ 2 := by
        linarith only [heq, h₁₂_sq, h₁₃_sq, h₂₃_sq, hroot_sq]
      have eq₁₃_sq : (s₁ - s₃) ^ 2 = (4 * √p) ^ 2 := by
        linarith only [heq, h₁₂_sq, h₁₃_sq, h₂₃_sq, hroot_sq]
      have eq₁₂ := (sq_eq_sq₀ (hroot.trans h₁₂) hroot).mp eq₁₂_sq
      have eq₁₃ := (sq_eq_sq₀ (hroot.trans h₁₃) hroot).mp eq₁₃_sq
      have hab_cd := h₁.2 (by linarith only [eq₁₂, h₁.1, h₂.1])
      have hac_bd := h₂.2 (by linarith only [eq₁₂, h₁.1, h₂.1])
      have had_bc := h₃.2 (by linarith only [eq₁₃, h₁.1, h₃.1])
      have hab : a = b := by
        apply (sq_eq_sq₀ ha.le hb.le).mp
        apply mul_right_cancel₀ (mul_pos hc hd).ne'
        calc
          a ^ 2 * (c * d) = (a * c) * (a * d) := by ring
          _ = (b * d) * (b * c) := by rw [hac_bd, had_bc]
          _ = b ^ 2 * (c * d) := by ring
      have hcd : c = d := mul_left_cancel₀ hb.ne' (hab ▸ hac_bd)
      have hbc : b = c := by
        apply (sq_eq_sq₀ hb.le hc.le).mp
        simpa only [hab, ← hcd, pow_two] using hab_cd
      exact ⟨hab, hbc, hcd⟩
    · rintro ⟨rfl, rfl, rfl⟩
      dsimp only [w, s₁, s₂, s₃, p]
      ring

-- Equal and unequal positive data exercise both directions of the equality test.
example : ((1 + 1 - (-(1 + 1))) ^ 2 + (1 + 1 - (-(1 + 1))) ^ 2 +
    ((-(1 + 1)) - (-(1 + 1))) ^ 2 : ℝ) / 12 = 8 / 3 := by norm_num

example :
    let s₁ : ℝ := 1 * 2 + 3 * 4
    let s₂ : ℝ := -(1 * 3 + 2 * 4)
    let s₃ : ℝ := -(1 * 4 + 2 * 3)
    (8 / 3 : ℝ) * (1 * 2 * 3 * 4) < ((s₁ - s₂) ^ 2 + (s₁ - s₃) ^ 2 + (s₂ - s₃) ^ 2) / 12 := by
  have h := middleSignatureWeylBound 1 2 3 4 (by norm_num) (by norm_num)
    (by norm_num) (by norm_num)
  exact lt_of_le_of_ne h.1 (fun heq => by
    have hnot : (1 : ℝ) ≠ 2 := by norm_num
    exact hnot ((h.2.mp heq.symm).1))

end SmoothPoincare
