import SmoothPoincare.Variational.BourEulerTransgression
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Deriv

/-! # Signed Euler shell integrals from the round polar data

26 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance.
Actual serving model and effort are unavailable. The inputs are the round
polar curvature, shape, and area coefficients in orthonormal frames.
-/

noncomputable section

open MeasureTheory

namespace SmoothPoincare

private def roundDelta {n : ℕ} (a b : Fin n) : ℝ := if a = b then 1 else 0

/-- Unit sectional curvature with endomorphism slots first, in the
curvature convention of the oriented frame Pfaffian. -/
def bourRoundFrameCurvature {n : ℕ} (a b i j : Fin n) : ℝ :=
  roundDelta a i * roundDelta b j - roundDelta a j * roundDelta b i

/-- The area of a round polar slice, also the radial volume density. -/
def bourRoundPolarArea (r : ℝ) : ℝ :=
  2 * Real.pi ^ 2 * Real.sin r ^ 3

private def roundShape (s : ℝ) : Matrix (Fin 3) (Fin 3) ℝ :=
  fun a i => s * roundDelta a i

private def roundConnectionDifference (s : ℝ) (a b i : Fin 4) : ℝ :=
  s * (roundDelta b 0 * roundDelta a i - roundDelta a 0 * roundDelta b i)

/-- The tangential curvature along the affine connection path, extended
by zero on slots using the normal. Only the tangential component enters
the mixed outward Pfaffian pairing. -/
private def roundTangentialPath (s t : ℝ) (a b i j : Fin 4) : ℝ :=
  if a ≠ 0 ∧ b ≠ 0 ∧ i ≠ 0 ∧ j ≠ 0 then
    (1 + (1 - t ^ 2) * s ^ 2) * bourRoundFrameCurvature a b i j
  else 0

/-- The physical radial bulk integral computed from the oriented frame
Pfaffian with the round polar volume density. -/
def bourRoundEulerBulk (a b : ℝ) : ℝ :=
  ∫ r in a..b, (2 * frameEulerPfaffian bourRoundFrameCurvature) * bourRoundPolarArea r

/-- The outward connection-path integral times the induced slice area.
The sign is +1 for the normal pointing to increasing radius and -1 for
the normal pointing to decreasing radius. -/
def bourRoundEulerBoundary (sign r : ℝ) : ℝ :=
  bourRoundPolarArea r * (∫ t in (0 : ℝ)..1,
    -frameEulerTransgression (roundConnectionDifference (sign * Real.cot r))
      (roundTangentialPath (sign * Real.cot r) t) 1 2 3)

/-- The boundary primitive obtained at the upper link. -/
def bourRoundEulerPrimitive (r : ℝ) : ℝ :=
  12 * Real.pi ^ 2 * Real.cos r - 4 * Real.pi ^ 2 * Real.cos r ^ 3

theorem bourRoundFramePfaffian :
    2 * frameEulerPfaffian bourRoundFrameCurvature = 6 := by
  norm_num [frameEulerPfaffian, wedge22Volume, bourRoundFrameCurvature, roundDelta]

theorem bourRoundComplementaryWedges :
    bourBoundaryComplementaryWedges bourRoundFrameCurvature =
      (1 : Matrix (Fin 3) (Fin 3) ℝ) := by
  ext a i
  fin_cases a <;> fin_cases i <;>
    norm_num [bourBoundaryComplementaryWedges, bourRoundFrameCurvature, roundDelta,
      Matrix.one_apply, Fin.add_def]

private theorem roundTangentialPath_swap_fiber (s t : ℝ) (a b i j : Fin 4) :
    roundTangentialPath s t a b i j = -roundTangentialPath s t b a i j := by
  by_cases h : a ≠ 0 ∧ b ≠ 0 ∧ i ≠ 0 ∧ j ≠ 0
  · simp only [roundTangentialPath, ite_eq_left h, ite_eq_left (show
        b ≠ 0 ∧ a ≠ 0 ∧ i ≠ 0 ∧ j ≠ 0 by tauto), bourRoundFrameCurvature]
    ring
  · simp [roundTangentialPath, h, show ¬(b ≠ 0 ∧ a ≠ 0 ∧ i ≠ 0 ∧ j ≠ 0) by tauto]

private theorem roundTangentialPath_swap_base (s t : ℝ) (a b i j : Fin 4) :
    roundTangentialPath s t a b i j = -roundTangentialPath s t a b j i := by
  by_cases h : a ≠ 0 ∧ b ≠ 0 ∧ i ≠ 0 ∧ j ≠ 0
  · simp only [roundTangentialPath, ite_eq_left h, ite_eq_left (show
        a ≠ 0 ∧ b ≠ 0 ∧ j ≠ 0 ∧ i ≠ 0 by tauto), bourRoundFrameCurvature]
    ring
  · simp [roundTangentialPath, h, show ¬(a ≠ 0 ∧ b ≠ 0 ∧ j ≠ 0 ∧ i ≠ 0) by tauto]

private theorem roundTangentialPath_eq (s t : ℝ) (a b i j : Fin 3) :
    roundTangentialPath s t a.succ b.succ i.succ j.succ =
      bourBoundaryPathTangentialCurvature (roundShape s) bourRoundFrameCurvature t a b i j := by
  have h : a.succ ≠ 0 ∧ b.succ ≠ 0 ∧ i.succ ≠ 0 ∧ j.succ ≠ 0 :=
    ⟨Fin.succ_ne_zero _, Fin.succ_ne_zero _, Fin.succ_ne_zero _, Fin.succ_ne_zero _⟩
  simp only [roundTangentialPath, ite_eq_left h, bourBoundaryPathTangentialCurvature,
    bourShapeWedge, roundShape, bourRoundFrameCurvature, roundDelta, Fin.succ_inj]
  ring

/-- At a link with principal curvature s in the outward frame, the
integral of the actual alternating path coefficient is 6s + 4s³. -/
private theorem roundEulerBoundaryCoefficient (s : ℝ) :
    (∫ t in (0 : ℝ)..1, -frameEulerTransgression (roundConnectionDifference s)
        (roundTangentialPath s t) 1 2 3) = 6 * s + 4 * s ^ 3 := by
  rw [bourFrameEulerTransgression_boundary_integral (roundShape s)
    (roundConnectionDifference s) (roundTangentialPath s) bourRoundFrameCurvature
    (fun a i => by
      by_cases hi : a = i <;> simp [roundConnectionDifference, roundShape, roundDelta, hi])
    (fun a b i => by simp [roundConnectionDifference, roundDelta])
    (roundTangentialPath_swap_fiber s) (roundTangentialPath_swap_base s) (roundTangentialPath_eq s),
    bourRoundComplementaryWedges]
  norm_num [bourEulerBoundaryDensity, roundShape, roundDelta, Matrix.det_fin_three,
    Matrix.one_apply, Fin.sum_univ_three]
  ring

theorem bourRoundEulerBoundary_increasing {r : ℝ} (hr : 0 < r) (hp : r < Real.pi) :
    bourRoundEulerBoundary 1 r = bourRoundEulerPrimitive r := by
  unfold bourRoundEulerBoundary bourRoundEulerPrimitive
  rw [one_mul, roundEulerBoundaryCoefficient, Real.cot_eq_cos_div_sin]
  have hs := (Real.sin_pos_of_pos_of_lt_pi hr hp).ne'
  calc
    _ = 12 * Real.pi ^ 2 * Real.cos r * Real.sin r ^ 2 +
        8 * Real.pi ^ 2 * Real.cos r ^ 3 := by
      unfold bourRoundPolarArea
      field_simp [hs]
      ring
    _ = _ := by
      linear_combination (12 * Real.pi ^ 2 * Real.cos r) * Real.sin_sq_add_cos_sq r

theorem bourRoundEulerBoundary_decreasing {r : ℝ} (hr : 0 < r) (hp : r < Real.pi) :
    bourRoundEulerBoundary (-1) r = -bourRoundEulerPrimitive r := by
  rw [← bourRoundEulerBoundary_increasing hr hp]
  simp only [bourRoundEulerBoundary, one_mul, neg_mul, roundEulerBoundaryCoefficient]
  ring

theorem bourRoundEulerBulk_eq (a b : ℝ) :
    bourRoundEulerBulk a b = bourRoundEulerPrimitive a - bourRoundEulerPrimitive b := by
  rw [bourRoundEulerBulk, bourRoundFramePfaffian, ← neg_sub_neg]
  apply intervalIntegral.integral_eq_sub_of_hasDerivAt
  · intro r _
    have hcos := Real.hasDerivAt_cos r
    have h := (hcos.const_mul (12 * Real.pi ^ 2)).sub
      ((hcos.pow 3).const_mul (4 * Real.pi ^ 2))
    unfold bourRoundEulerPrimitive bourRoundPolarArea
    convert h.neg using 1
    linear_combination (12 * Real.pi ^ 2 * Real.sin r) * Real.sin_sq_add_cos_sq r
  · exact (continuous_const.mul
      (continuous_const.mul (Real.continuous_sin.pow 3))).intervalIntegrable _ _

/-- The two outward boundaries of the same non-product round shell
cancel its Euler bulk. The shell has 0 < a < b < π. -/
theorem bourRoundEulerShell_total {a b : ℝ} (ha : 0 < a) (hab : a < b) (hb : b < Real.pi) :
    bourRoundEulerBulk a b + bourRoundEulerBoundary 1 b + bourRoundEulerBoundary (-1) a = 0 := by
  rw [bourRoundEulerBulk_eq, bourRoundEulerBoundary_increasing (ha.trans hab) hb,
    bourRoundEulerBoundary_decreasing ha (hab.trans hb)]
  ring

end SmoothPoincare
