import SmoothPoincare.Variational.BourMetricInteriorEstimate
import SmoothPoincare.Variational.BourInteriorIteration

/-! # Squared cutoff for the trace-free Ricci system

Prepared for Edward B. Baker III with OpenAI Codex assistance, 26 November 2026.
The mixed derivative of the cutoff carries a factor of the same cutoff used
in the first-derivative interpolation. All norms are on the same carrier.
-/

open DifferentialGeometry.Tensor.Coordinates MeasureTheory Filter Set
open scoped ContDiff ENNReal Topology

namespace SmoothPoincare

open Bour

noncomputable section

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
  [FiniteDimensional ℝ E]

local notation "J" => Fin (Module.finrank ℝ E)
local notation "H₂" => iteratedFDeriv ℝ 2

omit [FiniteDimensional ℝ E] in
/-- The exact weighted jet identity, valid also at zeros of the cutoff. -/
theorem bourSquaredCutoff_hessian (η u : E → ℝ)
    (hη : ContDiff ℝ ∞ η) (hu : ContDiff ℝ ∞ u) (x v w : E) :
    H₂ (fun z => η z ^ 2 * u z) x ![v,w] =
      η x ^ 2 * H₂ u x ![v,w] +
      2 * u x * (η x * H₂ η x ![v,w] + fderiv ℝ η x v * fderiv ℝ η x w) +
      2 * fderiv ℝ η x v * (η x * fderiv ℝ u x w) +
      2 * fderiv ℝ η x w * (η x * fderiv ℝ u x v) := by
  simp only [sq]
  rw [bourHessian_product (hη.mul hη) hu, bourHessian_product hη hη]
  have hd := (hη.differentiable (by simp) x).hasFDerivAt
  rw [fderiv_fun_mul hd.differentiableAt hd.differentiableAt]
  simp [smul_eq_mul]
  ring

omit [FiniteDimensional ℝ E] in
/-- The error for each ordered pair of directions uses only bounded cutoff
jets, the undifferentiated tensor entry, and its weighted first jet. -/
theorem bourSquaredCutoff_hessian_error (η u : E → ℝ) (hη : ContDiff ℝ ∞ η)
    (hu : ContDiff ℝ ∞ u) (x v w : E) {U L T V : ℝ}
    (h0 : |η x| ≤ 1) (h1v : |fderiv ℝ η x v| ≤ L) (h1w : |fderiv ℝ η x w| ≤ L)
    (h2 : |H₂ η x ![v,w]| ≤ T) (hu0 : |u x| ≤ U)
    (huv : |η x * fderiv ℝ u x v| ≤ V) (huw : |η x * fderiv ℝ u x w| ≤ V) :
    |H₂ (fun z => η z ^ 2 * u z) x ![v,w] - η x ^ 2 * H₂ u x ![v,w]| ≤
      2 * U * (T + L^2) + 4 * L * V := by
  have hL := (abs_nonneg _).trans h1v
  have hU := (abs_nonneg _).trans hu0
  have hT := (abs_nonneg _).trans h2
  have hV := (abs_nonneg _).trans huv
  rw [bourSquaredCutoff_hessian η u hη hu]
  set H := H₂ η x ![v,w]
  set du := fderiv ℝ u x
  set d := fderiv ℝ η x
  set F := 2 * u x * (η x * H + d v * d w)
  set P := 2 * d v * (η x * du w)
  set Q := 2 * d w * (η x * du v)
  rw [show η x ^ 2 * H₂ u x ![v,w] + F + P + Q - η x ^ 2 * H₂ u x ![v,w] =
    F+P+Q by ring]
  have hInner : |η x * H + d v * d w| ≤ T+L^2 := by
    refine (abs_add_le _ _).trans ?_
    simp only [abs_mul]
    have h₁ := mul_le_mul h0 h2 (abs_nonneg _) zero_le_one
    have h₂ := mul_le_mul h1v h1w (abs_nonneg _) hL
    nlinarith only [h₁,h₂]
  have hF : |F| ≤ 2 * U * (T+L^2) := by
    dsimp only [F]
    simp only [abs_mul, abs_of_nonneg (by norm_num : (0:ℝ) ≤ 2)]
    exact mul_le_mul (by linarith only [hu0]) hInner (abs_nonneg _) (by positivity)
  have hP : |P| ≤ 2 * L * V := by
    dsimp only [P]
    simp only [abs_mul, abs_of_nonneg (by norm_num : (0:ℝ) ≤ 2)] at *
    exact mul_le_mul (by linarith only [h1v]) huw (by positivity) (by positivity)
  have hQ : |Q| ≤ 2 * L * V := by
    dsimp only [Q]
    simp only [abs_mul, abs_of_nonneg (by norm_num : (0:ℝ) ≤ 2)] at *
    exact mul_le_mul (by linarith only [h1w]) huv (by positivity) (by positivity)
  exact ((abs_add_le _ _).trans (add_le_add (abs_add_le _ _) le_rfl)).trans (by linarith)

/-- The coefficient and all first derivatives are evaluated at the same point.
A bounded drift coupling gives a bounded zeroth term plus the weighted drift. -/
theorem bourSquaredCutoff_operator_error (a : Matrix J J ℝ) (η u : E → ℝ)
    (hη : ContDiff ℝ ∞ η) (hu : ContDiff ℝ ∞ u) (x : E)
    {U L T V D : ℝ} (h0 : |η x| ≤ 1)
    (h1 : ∀ i : J, |fderiv ℝ η x (chartModelBasis E i)| ≤ L)
    (h2 : ∀ i j : J, |H₂ η x ![chartModelBasis E i,chartModelBasis E j]| ≤ T)
    (hu0 : |u x| ≤ U) (hdu : ∀ i : J, |η x * fderiv ℝ u x (chartModelBasis E i)| ≤ V)
    (ha : ∀ i j, |a i j| ≤ D) (hD : 0 ≤ D) :
    |bourFlatOperator a (fun z => η z^2 * u z) x - η x^2 * bourFlatOperator a u x| ≤
      (Module.finrank ℝ E : ℝ)^2 * D * (2*U*(T+L^2)+4*L*V) := by
  let b := chartModelBasis E
  let d (i j : J) := H₂ (fun z => η z^2*u z) x ![b i,b j] - η x^2 * H₂ u x ![b i,b j]
  have heq : bourFlatOperator a (fun z => η z^2 * u z) x - η x^2 * bourFlatOperator a u x =
      ∑ i, ∑ j, a i j * d i j := by
    simp [bourFlatOperator, d, b, mul_sub, Finset.sum_sub_distrib, Finset.mul_sum, mul_left_comm]
  rw [heq]
  calc
    _ ≤ ∑ i : J, ∑ j : J, |a i j * d i j| :=
      (Finset.abs_sum_le_sum_abs _ _).trans (Finset.sum_le_sum fun _ _ => Finset.abs_sum_le_sum_abs _ _)
    _ ≤ ∑ _i : J, ∑ _j : J, D * (2*U*(T+L^2)+4*L*V) := by
      refine Finset.sum_le_sum (fun i _ => Finset.sum_le_sum (fun j _ => ?_))
      rw [abs_mul]
      exact mul_le_mul (ha i j) (bourSquaredCutoff_hessian_error η u hη hu x _ _ h0
        (h1 i) (h1 j) (h2 i j) hu0 (hdu i) (hdu j)) (abs_nonneg _) hD
    _ = _ := by simp; ring


/-- Eliminate all first-derivative norms at once. X contains the localized
Hessians, Y the weighted directional first derivatives, and Z the weighted
diagonal second derivatives entering the one-direction interpolation.
The constants are uniform and the system has finitely many entries. -/
theorem bourCoupledInterior_absorb {κ ι : Type*} [Fintype κ] [Fintype ι]
    (row : ι → κ) (X : κ → ℝ) (Y Z : ι → ℝ)
    {A B C D F G ε : ℝ} (hB : 0 ≤ B) (hD : 0 ≤ D) (hε : 0 ≤ ε)
    (hX : ∀ j, X j ≤ A+B*∑ i, Y i)
    (hZ : ∀ i, Z i ≤ C+D*X (row i)+F*∑ j, Y j)
    (hY : ∀ i, Y i ≤ G+ε*Z i) (hYpos : ∀ i, 0 ≤ Y i)
    (hSmall : (Fintype.card ι : ℝ)*ε*(D*B+F) ≤ 1/2) :
    (∑ i, Y i) ≤ 2*(Fintype.card ι : ℝ)*(G+ε*(C+D*A)) ∧
      ∀ j, X j ≤ A + B*(2*(Fintype.card ι : ℝ)*(G+ε*(C+D*A))) := by
  let T := ∑ i, Y i
  have hpos : 0 ≤ T := Finset.sum_nonneg (fun i _ => hYpos i)
  have hy (i : ι) : Y i ≤ G+ε*(C+D*A) + ε*(D*B+F)*T := by
    have h := mul_le_mul_of_nonneg_left (hX (row i)) hD
    have hz : Z i ≤ C + D*(A+B*T) + F*T := by linarith only [h, hZ i]
    have hz' := mul_le_mul_of_nonneg_left hz hε
    linarith only [hz', hY i]
  have hsum := Finset.sum_le_sum (s := Finset.univ) (fun i _ => hy i)
  simp only [Finset.sum_const, Finset.card_univ, nsmul_eq_mul] at hsum
  change T ≤ _ at hsum
  have hcap := mul_le_mul_of_nonneg_right hSmall hpos
  have hbound : T ≤ 2*(Fintype.card ι : ℝ)*(G+ε*(C+D*A)) := by linarith only [hsum,hcap]
  exact ⟨hbound,fun j => (hX j).trans (add_le_add le_rfl (mul_le_mul_of_nonneg_left hbound hB))⟩

/-- An explicit positive interpolation length pays the full drift of the
coupled system, independently of the particular smooth chart. -/
theorem bourCoupledInterior_absorptionLength (m B D F : ℝ)
    (hm : 0 ≤ m) (hB : 0 ≤ B) (hD : 0 ≤ D) (hF : 0 ≤ F) :
    let ε := 1 / (2*(1+m*(D*B+F)))
    0 < ε ∧ m*ε*(D*B+F) ≤ 1/2 := by
  dsimp only
  have hden : 0 < 2*(1+m*(D*B+F)) := by positivity
  refine ⟨by positivity, ?_⟩
  field_simp
  linarith

end
end SmoothPoincare
