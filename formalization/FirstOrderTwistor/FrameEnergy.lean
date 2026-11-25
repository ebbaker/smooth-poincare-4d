import SectionsAndConnections.ThreeAxisWeyl
import Mathlib.MeasureTheory.Integral.Bochner.Set

/-!
# Four-slot and chiral energy in an orthonormal frame

With the oriented complementary wedge pairs `u = (01, 02, 03)` and
`v = (23, 31, 12)`, the self-dual and anti-self-dual bases are
`(u + v) / √2` and `(u - v) / √2`, respectively. Changing from their
block coordinates to `u, v` gives the half-sum on the diagonal and
the half-difference off the diagonal. Each ordered skew pair then
contributes its squared entries twice.
-/

namespace FirstOrderTwistor

open MeasureTheory SectionsAndConnections

/-- Extend the six coefficients on `u, v` to all ordered coordinate pairs. -/
def skewPairArray (u v : Fin 3 → ℝ) : Matrix (Fin 4) (Fin 4) ℝ :=
  !![0,      u 0,   u 1,   u 2;
    -u 0,    0,     v 2,  -v 1;
    -u 1,   -v 2,   0,     v 0;
    -u 2,    v 1,  -v 0,   0]

private theorem skewPairArray_sq_sum (u v : Fin 3 → ℝ) :
    ∑ a, ∑ b, skewPairArray u v a b ^ 2 =
      2 * ((∑ i, u i ^ 2) + (∑ i, v i ^ 2)) := by
  simp [skewPairArray, Fin.sum_univ_four, Fin.sum_univ_three]
  ring

variable (WPlus WMinus : Matrix (Fin 3) (Fin 3) ℝ)

private noncomputable def halfSum (i j : Fin 3) : ℝ := (WPlus i j + WMinus i j) / 2

private noncomputable def halfDifference (i j : Fin 3) : ℝ := (WPlus i j - WMinus i j) / 2

/-- Reconstruct the four ordered Weyl slots from the normalized chiral blocks. -/
noncomputable def chiralFrameTensor (a b c d : Fin 4) : ℝ :=
  skewPairArray
    (fun j => skewPairArray (halfSum WPlus WMinus · j) (halfDifference WPlus WMinus · j) a b)
    (fun j => skewPairArray (halfDifference WPlus WMinus · j) (halfSum WPlus WMinus · j) a b) c d

/-- The squared tensor norm sums over all four ordered orthonormal slots. -/
noncomputable def frameTensorNormSq (W : Fin 4 → Fin 4 → Fin 4 → Fin 4 → ℝ) : ℝ :=
  ∑ a, ∑ b, ∑ c, ∑ d, W a b c d ^ 2

private theorem skewPairArray_columns_sq_sum (A B : Matrix (Fin 3) (Fin 3) ℝ) :
    (∑ a, ∑ b, ∑ j, skewPairArray (A · j) (B · j) a b ^ 2) =
      2 * (hilbertSchmidtSq A + hilbertSchmidtSq B) := by
  simp_rw [Finset.sum_comm (t := (Finset.univ : Finset (Fin 3))), skewPairArray_sq_sum]
  simp_rw [← Finset.mul_sum, Finset.sum_add_distrib]
  congr 2 <;> exact Finset.sum_comm

/-- The four-slot squared norm is four times the sum of the two block squared norms. -/
theorem frameTensorNormSq_eq_four_chiral :
    frameTensorNormSq (chiralFrameTensor WPlus WMinus) =
      4 * (hilbertSchmidtSq WPlus + hilbertSchmidtSq WMinus) := by
  let A : Matrix (Fin 3) (Fin 3) ℝ := halfSum WPlus WMinus
  let B : Matrix (Fin 3) (Fin 3) ℝ := halfDifference WPlus WMinus
  have hChiral : 2 * (hilbertSchmidtSq A + hilbertSchmidtSq B) =
      hilbertSchmidtSq WPlus + hilbertSchmidtSq WMinus := by
    simp only [A, B, halfSum, halfDifference, hilbertSchmidtSq, Fin.sum_univ_three]
    ring
  calc
    _ = 2 * ((∑ a, ∑ b, ∑ j, skewPairArray (A · j) (B · j) a b ^ 2) +
        (∑ a, ∑ b, ∑ j, skewPairArray (B · j) (A · j) a b ^ 2)) := by
      change (∑ a, ∑ b, ∑ c, ∑ d, skewPairArray
        (fun j => skewPairArray (A · j) (B · j) a b)
        (fun j => skewPairArray (B · j) (A · j) a b) c d ^ 2) = _
      simp_rw [skewPairArray_sq_sum, ← Finset.mul_sum, Finset.sum_add_distrib]
    _ = _ := by
      rw [skewPairArray_columns_sq_sum A B, skewPairArray_columns_sq_sum B A, ← hChiral]
      ring

variable {X : Type*} [MeasurableSpace X] {μ : Measure X} {s : Set X}
  {plus minus : X → Matrix (Fin 3) (Fin 3) ℝ}

/-- Integrating the pointwise frame formula preserves the two separate chiral energies. -/
theorem frameTensorIntegral_eq_four_chiral
    (hPlus : IntegrableOn (fun x => hilbertSchmidtSq (plus x)) s μ)
    (hMinus : IntegrableOn (fun x => hilbertSchmidtSq (minus x)) s μ) :
    (∫ x in s, frameTensorNormSq (chiralFrameTensor (plus x) (minus x)) ∂μ) =
      4 * ((∫ x in s, hilbertSchmidtSq (plus x) ∂μ) +
        (∫ x in s, hilbertSchmidtSq (minus x) ∂μ)) := by
  simp_rw [frameTensorNormSq_eq_four_chiral]
  rw [integral_const_mul, integral_add hPlus hMinus]

/-- Positive chiral energy on a region is at most one quarter of its four-slot energy. -/
theorem positiveChiralIntegral_le_quarterFrame
    (hPlus : IntegrableOn (fun x => hilbertSchmidtSq (plus x)) s μ)
    (hMinus : IntegrableOn (fun x => hilbertSchmidtSq (minus x)) s μ) :
    (∫ x in s, hilbertSchmidtSq (plus x) ∂μ) ≤
      (∫ x in s, frameTensorNormSq (chiralFrameTensor (plus x) (minus x)) ∂μ) / 4 := by
  rw [frameTensorIntegral_eq_four_chiral hPlus hMinus, mul_comm (4 : ℝ),
    mul_div_cancel_right₀ _ (by norm_num : (4 : ℝ) ≠ 0)]
  exact le_add_of_nonneg_right (integral_nonneg fun _ =>
    Finset.sum_nonneg fun _ _ => Finset.sum_nonneg fun _ _ => sq_nonneg _)

end FirstOrderTwistor
