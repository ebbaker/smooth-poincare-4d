import SmoothPoincare.Variational.BourMarkedEnd
import SmoothPoincare.Variational.BourMarkedCore

/-!
# Euler boundary stability for a nonflat ALE link

26 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance.
Actual serving model and effort are unavailable. The boundary convention is
outward-normal-first, with the round Euclidean sphere having positive shape.
The bounds below use the shape and curvature of the metric at unit scale.
-/

open Filter MeasureTheory Set
open scoped BigOperators ENNReal Topology

noncomputable section

namespace SmoothPoincare

/-- In an outward-adapted orthonormal frame, the Euler boundary scalar in
the (8\pi^2\chi) convention. The curvature matrix is the ambient tangential
curvature operator in the cyclic wedge basis ((e_1∧e_2,e_2∧e_0,e_0∧e_1)).
Its sectional entries are positive on a round four-sphere. -/
def bourEulerBoundaryDensity (shape curvature : Matrix (Fin 3) (Fin 3) ℝ) : ℝ :=
  4 * shape.det + 2 * ∑ i : Fin 3, ∑ j : Fin 3, shape i j * curvature i j

private theorem abs_sub_triple_product_le {a b c A B C ε : ℝ}
    (ha : |a - A| ≤ ε) (hb : |b - B| ≤ ε) (hc : |c - C| ≤ ε)
    (hA : |A| ≤ 1) (hB : |B| ≤ 1) (hb' : |b| ≤ 2) (hc' : |c| ≤ 2)
    (hε : 0 ≤ ε) :
    |a * b * c - A * B * C| ≤ 7 * ε := by
  have h₁ : |(a - A) * b * c| ≤ ε * 2 * 2 := by
    simp only [abs_mul]
    gcongr
  have h₂ : |A * (b - B) * c| ≤ 1 * ε * 2 := by
    simp only [abs_mul]
    gcongr
  have h₃ : |A * B * (c - C)| ≤ 1 * 1 * ε := by
    simp only [abs_mul]
    gcongr
  rw [show a * b * c - A * B * C =
    ((a - A) * b * c + A * (b - B) * c) + A * B * (c - C) by ring]
  have h₄ := abs_add_le ((a - A) * b * c + A * (b - B) * c) (A * B * (c - C))
  have h₅ := abs_add_le ((a - A) * b * c) (A * (b - B) * c)
  linarith only [h₁, h₂, h₃, h₄, h₅]

private theorem abs_one_matrix_apply_le (i j : Fin 3) :
    |(1 : Matrix (Fin 3) (Fin 3) ℝ) i j| ≤ 1 := by
  by_cases h : i = j <;> simp [Matrix.one_apply, h]

private theorem abs_matrix_apply_le_two {shape : Matrix (Fin 3) (Fin 3) ℝ}
    {ε : ℝ} (hε : ε ≤ 1)
    (hShape : ∀ i j, |shape i j - (1 : Matrix (Fin 3) (Fin 3) ℝ) i j| ≤ ε)
    (i j : Fin 3) : |shape i j| ≤ 2 := by
  have h := abs_add_le (shape i j - (1 : Matrix (Fin 3) (Fin 3) ℝ) i j)
    ((1 : Matrix (Fin 3) (Fin 3) ℝ) i j)
  rw [sub_add_cancel] at h
  linarith only [h, hShape i j, abs_one_matrix_apply_le i j, hε]

private theorem abs_det_sub_one_le {shape : Matrix (Fin 3) (Fin 3) ℝ} {ε : ℝ}
    (hε : 0 ≤ ε) (hε' : ε ≤ 1)
    (hShape : ∀ i j, |shape i j - (1 : Matrix (Fin 3) (Fin 3) ℝ) i j| ≤ ε) :
    |shape.det - 1| ≤ 42 * ε := by
  classical
  let unit : Matrix (Fin 3) (Fin 3) ℝ := 1
  have hTerm (σ : Equiv.Perm (Fin 3)) :
      |(∏ i, shape (σ i) i) - ∏ i, unit (σ i) i| ≤ 7 * ε := by
    simp only [Fin.prod_univ_three]
    exact abs_sub_triple_product_le (hShape _ _) (hShape _ _) (hShape _ _)
      (abs_one_matrix_apply_le _ _) (abs_one_matrix_apply_le _ _)
      (abs_matrix_apply_le_two hε' hShape _ _) (abs_matrix_apply_le_two hε' hShape _ _) hε
  rw [← Matrix.det_one (n := Fin 3) (R := ℝ)]
  change |shape.det - unit.det| ≤ _
  simp only [Matrix.det_apply, ← Finset.sum_sub_distrib, ← mul_sub]
  apply (Finset.abs_sum_le_sum_abs _ _).trans
  calc
    (∑ σ : Equiv.Perm (Fin 3), |(↑↑(Equiv.Perm.sign σ) : ℝ) *
        ((∏ i, shape (σ i) i) - ∏ i, unit (σ i) i)|) ≤ ∑ _ : Equiv.Perm (Fin 3), 7 * ε := by
      apply Finset.sum_le_sum
      intro σ _
      rw [abs_mul]
      have hSign : |(↑↑(Equiv.Perm.sign σ) : ℝ)| = 1 := by
        rcases Int.units_eq_one_or (Equiv.Perm.sign σ) with h | h <;> simp [h]
      rw [hSign, one_mul]
      exact hTerm σ
    _ = 42 * ε := by norm_num [Fintype.card_perm]; ring

/-- The nonflat curvature term vanishes to first order with the ambient
curvature. The cubic term is stable under perturbation of the shape. -/
theorem bourEulerBoundaryDensity_error {shape curvature : Matrix (Fin 3) (Fin 3) ℝ}
    {ε : ℝ} (hε : 0 ≤ ε) (hε' : ε ≤ 1)
    (hShape : ∀ i j, |shape i j - (1 : Matrix (Fin 3) (Fin 3) ℝ) i j| ≤ ε)
    (hCurvature : ∀ i j, |curvature i j| ≤ ε) :
    |bourEulerBoundaryDensity shape curvature - 4| ≤ 204 * ε := by
  have hProd (i j) : |shape i j * curvature i j| ≤ 2 * ε := by
    rw [abs_mul]
    gcongr
    exact abs_matrix_apply_le_two hε' hShape i j
  have hRow (i) : |∑ j : Fin 3, shape i j * curvature i j| ≤ 3 * (2 * ε) := by
    apply (Finset.abs_sum_le_sum_abs _ _).trans
    simpa using (Finset.sum_le_sum fun j (_ : j ∈ (Finset.univ : Finset (Fin 3))) =>
      hProd i j)
  have hSum : |∑ i : Fin 3, ∑ j : Fin 3, shape i j * curvature i j| ≤ 18 * ε := by
    apply (Finset.abs_sum_le_sum_abs _ _).trans
    calc
      _ ≤ ∑ _i : Fin 3, 3 * (2 * ε) := Finset.sum_le_sum fun i _ => hRow i
      _ = 18 * ε := by simp; ring
  unfold bourEulerBoundaryDensity
  rw [show 4 * shape.det + 2 * (∑ i, ∑ j, shape i j * curvature i j) - 4 =
    4 * (shape.det - 1) + 2 * (∑ i, ∑ j, shape i j * curvature i j) by ring]
  apply (abs_add_le _ _).trans
  rw [abs_mul, abs_mul]
  norm_num only [abs_of_nonneg (by norm_num : (0 : ℝ) ≤ 4),
    abs_of_nonneg (by norm_num : (0 : ℝ) ≤ 2)]
  linarith only [abs_det_sub_one_le hε hε' hShape, hSum]

/-- The link's induced area relative to round area supplies a third error.
The estimate includes the cubic, mixed curvature and area terms. -/
theorem bourEulerBoundaryDensity_withArea_error
    {shape curvature : Matrix (Fin 3) (Fin 3) ℝ} {J ε : ℝ}
    (hε : 0 ≤ ε) (hε' : ε ≤ 1)
    (hShape : ∀ i j, |shape i j - (1 : Matrix (Fin 3) (Fin 3) ℝ) i j| ≤ ε)
    (hCurvature : ∀ i j, |curvature i j| ≤ ε) (hArea : |J - 1| ≤ ε) :
    |J * bourEulerBoundaryDensity shape curvature - 4| ≤ 412 * ε := by
  have hJ : |J| ≤ 2 := by
    have h := abs_add_le (J - 1) (1 : ℝ)
    rw [sub_add_cancel, abs_one] at h
    linarith only [h, hArea, hε']
  rw [show J * bourEulerBoundaryDensity shape curvature - 4 =
    J * (bourEulerBoundaryDensity shape curvature - 4) + 4 * (J - 1) by ring]
  apply (abs_add_le _ _).trans
  rw [abs_mul, abs_mul, abs_of_nonneg (by norm_num : (0 : ℝ) ≤ 4)]
  calc
    _ ≤ 2 * (204 * ε) + 4 * ε := by
      gcongr
      exact bourEulerBoundaryDensity_error hε hε' hShape hCurvature
    _ = 412 * ε := by ring

end SmoothPoincare
