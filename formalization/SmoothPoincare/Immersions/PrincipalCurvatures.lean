import Mathlib.Analysis.Real.Sqrt
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Positivity
import Mathlib.Tactic.Ring

/-! # Scalar curvature inequalities for hypersurfaces in Euclidean five-space

The formulas use the Hilbert–Schmidt norm of one chiral Weyl endomorphism.
They operate on four real principal curvatures.
-/

namespace SmoothPoincare

noncomputable section

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
    exact sub_eq_zero.mp (sq_eq_zero_iff.mp hdiff.symm)

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
    ((-(1 + 1)) - (-(1 + 1))) ^ 2 : ℝ) / 12 = 8 / 3 := by
  have h := middleSignatureWeylBound 1 1 1 1 (by norm_num) (by norm_num)
    (by norm_num) (by norm_num)
  simpa only [mul_one] using h.2.mpr ⟨rfl, rfl, rfl⟩

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

/-- Squared Hilbert–Schmidt norm of a single Weyl block in the principal-frame formula. -/
def principalWeylNormSq (a b c d : ℝ) : ℝ :=
  let s₁ := a * b + c * d
  let s₂ := a * c + b * d
  let s₃ := a * d + b * c
  ((s₁ - s₂) ^ 2 + (s₁ - s₃) ^ 2 + (s₂ - s₃) ^ 2) / 12

/-- Squared norm of the trace-free principal-curvature vector. -/
def traceFreePrincipalNormSq (a b c d : ℝ) : ℝ :=
  let mean := (a + b + c + d) / 4
  (a - mean) ^ 2 + (b - mean) ^ 2 + (c - mean) ^ 2 + (d - mean) ^ 2

/-- The difference between one sixth of the fourth power of the
trace-free norm and the squared norm of a single Weyl block. -/
def principalShapeDeficit (a b c d : ℝ) : ℝ :=
  traceFreePrincipalNormSq a b c d ^ 2 / 6 - principalWeylNormSq a b c d

private theorem principalShapeDeficit_hadamard (a b c d : ℝ) :
    let x := (a + b - c - d) / 2
    let y := (a + c - b - d) / 2
    let z := (a + d - b - c) / 2
    principalShapeDeficit a b c d = (x ^ 2 * y ^ 2 + x ^ 2 * z ^ 2 + y ^ 2 * z ^ 2) / 2 := by
  unfold principalShapeDeficit traceFreePrincipalNormSq principalWeylNormSq
  dsimp only
  ring

private def shapeDeficitExcess (a b c d : ℝ) : ℝ :=
  principalShapeDeficit a b c d + (8 / 9 : ℝ) * (a * b * c * d)

private theorem shapeDeficitExcess_swap₁₂ (a b c d : ℝ) :
    shapeDeficitExcess b a c d = shapeDeficitExcess a b c d := by
  simp only [shapeDeficitExcess, principalShapeDeficit_hadamard]
  ring

private theorem shapeDeficitExcess_swap₁₃ (a b c d : ℝ) :
    shapeDeficitExcess c b a d = shapeDeficitExcess a b c d := by
  simp only [shapeDeficitExcess, principalShapeDeficit_hadamard]
  ring

private theorem shapeDeficitExcess_swap₁₄ (a b c d : ℝ) :
    shapeDeficitExcess d b c a = shapeDeficitExcess a b c d := by
  simp only [shapeDeficitExcess, principalShapeDeficit_hadamard]
  ring

private theorem shapeDeficitExcess_swap₂₃ (a b c d : ℝ) :
    shapeDeficitExcess a c b d = shapeDeficitExcess a b c d := by
  simp only [shapeDeficitExcess, principalShapeDeficit_hadamard]
  ring

private theorem shapeDeficitExcess_swap₂₄ (a b c d : ℝ) :
    shapeDeficitExcess a d c b = shapeDeficitExcess a b c d := by
  simp only [shapeDeficitExcess, principalShapeDeficit_hadamard]
  ring

private theorem shapeDeficitExcess_neg (a b c d : ℝ) :
    shapeDeficitExcess (-a) (-b) (-c) (-d) = shapeDeficitExcess a b c d := by
  simp only [shapeDeficitExcess, principalShapeDeficit_hadamard]
  ring

private theorem orderedDeficitEstimate {p q r h : ℝ}
    (hp : 0 < p) (hpq : 0 ≤ p ^ 2 - q ^ 2) (hr : p ≤ r) :
    (8 / 9 : ℝ) * ((p ^ 2 - q ^ 2) * ((r + q) ^ 2 - 4 * h ^ 2) / 16) ≤
      r ^ 2 * p ^ 2 / 16 + p ^ 4 / 32 + h ^ 2 * (r ^ 2 - p ^ 2) / 4 + h ^ 4 / 2 := by
  -- Cauchy–Schwarz in the two variables r and q, with the scale p restored.
  have hcs : (r + q) ^ 2 * p ^ 2 ≤ (2 * r ^ 2 + p ^ 2) * (p ^ 2 / 2 + q ^ 2) := by
    nlinarith only [sq_nonneg (2 * r * q - p ^ 2)]
  have hquartic : (p ^ 2 - q ^ 2) * (p ^ 2 / 2 + q ^ 2) ≤ 9 / 16 * p ^ 4 := by
    nlinarith only [sq_nonneg (q ^ 2 - p ^ 2 / 4)]
  have hscaled : (p ^ 2 - q ^ 2) * (r + q) ^ 2 ≤ (9 / 16) * (2 * r ^ 2 + p ^ 2) * p ^ 2 := by
    apply le_of_mul_le_mul_right ?_ (pow_pos hp 2)
    have hcs' := mul_le_mul_of_nonneg_left hcs hpq
    have hquartic' := mul_le_mul_of_nonneg_left hquartic (show 0 ≤ 2 * r ^ 2 + p ^ 2 by positivity)
    nlinarith only [hcs', hquartic']
  have hdrop := mul_nonneg hpq (sq_nonneg h)
  have hr_sq := (sq_le_sq₀ hp.le (hp.le.trans hr)).mpr hr
  have hkeep := mul_nonneg (sq_nonneg h) (sub_nonneg.mpr hr_sq)
  nlinarith only [hscaled, hdrop, hkeep, sq_nonneg (h ^ 2)]

private theorem shapeDeficitExcess_oneNegative_ordered {a b c d : ℝ}
    (ha : a < 0) (hb : 0 < b) (hbc : b ≤ c) (hbd : b ≤ d) :
    0 ≤ shapeDeficitExcess a b c d := by
  let p := b - a
  let q := b + a
  let r := c + d - b - a
  let h := (d - c) / 2
  have hp : 0 < p := sub_pos.mpr (ha.trans hb)
  have hpq : 0 ≤ p ^ 2 - q ^ 2 := by
    dsimp only [p, q]
    nlinarith only [mul_nonneg (neg_nonneg.mpr ha.le) hb.le]
  have hr : p ≤ r := by
    dsimp only [p, r]
    linarith only [hbc, hbd]
  have hdet : -(a * b * c * d) = (p ^ 2 - q ^ 2) * ((r + q) ^ 2 - 4 * h ^ 2) / 16 := by
    dsimp only [p, q, r, h]
    ring
  have hdeficit : principalShapeDeficit a b c d =
      r ^ 2 * p ^ 2 / 16 + p ^ 4 / 32 + h ^ 2 * (r ^ 2 - p ^ 2) / 4 + h ^ 4 / 2 := by
    rw [principalShapeDeficit_hadamard]
    dsimp only [p, r, h]
    ring
  unfold shapeDeficitExcess
  rw [hdeficit]
  linarith only [orderedDeficitEstimate (h := h) hp hpq hr, hdet]

private theorem shapeDeficitExcess_oneNegative {a b c d : ℝ}
    (ha : a < 0) (hb : 0 < b) (hc : 0 < c) (hd : 0 < d) :
    0 ≤ shapeDeficitExcess a b c d := by
  rcases le_total b c with hbc | hcb
  · rcases le_total b d with hbd | hdb
    · exact shapeDeficitExcess_oneNegative_ordered ha hb hbc hbd
    · rw [← shapeDeficitExcess_swap₂₄]
      exact shapeDeficitExcess_oneNegative_ordered ha hd (hdb.trans hbc) hdb
  · rcases le_total c d with hcd | hdc
    · rw [← shapeDeficitExcess_swap₂₃]
      exact shapeDeficitExcess_oneNegative_ordered ha hc hcb hcd
    · rw [← shapeDeficitExcess_swap₂₄]
      exact shapeDeficitExcess_oneNegative_ordered ha hd hdc (hdc.trans hcb)

private theorem shapeDeficitExcess_negDet {a b c d : ℝ} (hdet : a * b * c * d < 0) :
    0 ≤ shapeDeficitExcess a b c d := by
  rcases mul_neg_iff.mp hdet with ⟨habc, hd⟩ | ⟨habc, hd⟩
  · rcases mul_pos_iff.mp habc with ⟨hab, hc⟩ | ⟨hab, hc⟩
    · rcases mul_pos_iff.mp hab with ⟨ha, hb⟩ | ⟨ha, hb⟩
      · rw [← shapeDeficitExcess_swap₁₄]
        exact shapeDeficitExcess_oneNegative hd hb hc ha
      · rw [← shapeDeficitExcess_neg, ← shapeDeficitExcess_swap₁₃]
        exact shapeDeficitExcess_oneNegative (neg_neg_of_pos hc)
          (neg_pos.mpr hb) (neg_pos.mpr ha) (neg_pos.mpr hd)
    · rcases mul_neg_iff.mp hab with ⟨ha, hb⟩ | ⟨ha, hb⟩
      · rw [← shapeDeficitExcess_neg]
        exact shapeDeficitExcess_oneNegative (neg_neg_of_pos ha)
          (neg_pos.mpr hb) (neg_pos.mpr hc) (neg_pos.mpr hd)
      · rw [← shapeDeficitExcess_neg, ← shapeDeficitExcess_swap₁₂]
        exact shapeDeficitExcess_oneNegative (neg_neg_of_pos hb)
          (neg_pos.mpr ha) (neg_pos.mpr hc) (neg_pos.mpr hd)
  · rcases mul_neg_iff.mp habc with ⟨hab, hc⟩ | ⟨hab, hc⟩
    · rcases mul_pos_iff.mp hab with ⟨ha, hb⟩ | ⟨ha, hb⟩
      · rw [← shapeDeficitExcess_swap₁₃]
        exact shapeDeficitExcess_oneNegative hc hb ha hd
      · rw [← shapeDeficitExcess_neg, ← shapeDeficitExcess_swap₁₄]
        exact shapeDeficitExcess_oneNegative (neg_neg_of_pos hd)
          (neg_pos.mpr hb) (neg_pos.mpr hc) (neg_pos.mpr ha)
    · rcases mul_neg_iff.mp hab with ⟨ha, hb⟩ | ⟨ha, hb⟩
      · rw [← shapeDeficitExcess_swap₁₂]
        exact shapeDeficitExcess_oneNegative hb ha hc hd
      · exact shapeDeficitExcess_oneNegative ha hb hc hd

/-- The principal shape deficit bounds the positive part of the negative determinant,
with the coefficient `8/9` for one chiral Weyl block. -/
theorem shapeDeficitBound (a b c d : ℝ) :
    (8 / 9 : ℝ) * max (-(a * b * c * d)) 0 ≤ principalShapeDeficit a b c d := by
  rcases le_or_gt 0 (a * b * c * d) with hdet | hdet
  · rw [max_eq_right (neg_nonpos.mpr hdet), mul_zero, principalShapeDeficit_hadamard]
    positivity
  · rw [max_eq_left (neg_pos.mpr hdet).le]
    have h := shapeDeficitExcess_negDet hdet
    unfold shapeDeficitExcess at h
    linarith only [h]

/-- The principal data `(-1,3,3,3)` realize the coefficient `8/9`
with strictly negative determinant. -/
theorem shapeDeficitBound_sharp :
    principalShapeDeficit (-1) 3 3 3 =
      (8 / 9 : ℝ) * max (-((-1 : ℝ) * 3 * 3 * 3)) 0 ∧
    0 < -((-1 : ℝ) * 3 * 3 * 3) := by
  rw [principalShapeDeficit_hadamard]
  norm_num

end

end SmoothPoincare
