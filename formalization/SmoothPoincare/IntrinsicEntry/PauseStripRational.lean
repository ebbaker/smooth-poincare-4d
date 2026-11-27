import Mathlib.Analysis.SpecialFunctions.Exponential
import Mathlib.Analysis.SpecificLimits.Basic
import Mathlib.Data.Rat.BigOperators
import Mathlib.Data.Rat.Cast.Order
import Mathlib.Data.Fintype.Fin
import Mathlib.Data.Nat.Factorial.Basic
import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import Mathlib.Tactic.FinCases
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Positivity
import Mathlib.Tactic.Ring

/-! # Exact rational replay of the forty pause-strip cells -/

open scoped BigOperators

namespace SmoothPoincare.IntrinsicEntry

/-- The left normalized radial endpoint in the physical strip. -/
def pauseStripCellLeft (i : Fin 40) : ℚ := 3 / 20 + (i.val : ℚ) / 800

/-- The right normalized radial endpoint in the physical strip. -/
def pauseStripCellRight (i : Fin 40) : ℚ := pauseStripCellLeft i + 1 / 800

/-- The argument of the exponential whose inverse gives the switching odds. -/
def pauseStripArgument (x : ℚ) : ℚ := 1 / x - 1 / (1 - x)

/-- The positive exponential series through degree twenty. -/
def pauseStripExpPartial (y : ℚ) : ℚ := ∑ j ∈ Finset.range 21, y ^ j / (j.factorial : ℚ)

/-- Geometric upper bound for the tail starting at degree twenty-one. -/
def pauseStripExpTail (y : ℚ) : ℚ := (y ^ 21 / (Nat.factorial 21 : ℚ)) / (1 - y / 22)

/-- The lower rational odds enclosure. -/
def pauseStripOddsLower (x : ℚ) : ℚ :=
  1 / (pauseStripExpPartial (pauseStripArgument x) + pauseStripExpTail (pauseStripArgument x))

/-- The upper rational odds enclosure. -/
def pauseStripOddsUpper (x : ℚ) : ℚ := 1 / pauseStripExpPartial (pauseStripArgument x)

/-- Lower endpoint calculation for the second derivative bracket. -/
def pauseStripBracket (i : Fin 40) : ℚ :=
  let a := pauseStripCellLeft i
  let b := pauseStripCellRight i
  (1 / b ^ 2 + 1 / (1 - a) ^ 2) ^ 2 - 2 / a ^ 3 + 2 / (1 - a) ^ 3

/-- The rational upper enclosure used for the first physical derivative. -/
def pauseStripSlopeUpper (i : Fin 40) : ℚ :=
  let a := pauseStripCellLeft i
  let b := pauseStripCellRight i
  16 * pauseStripOddsUpper b * (1 / a ^ 2 + 1 / (1 - b) ^ 2)

/-- The rational lower enclosure used for the second physical derivative. -/
def pauseStripSecondLower (i : Fin 40) : ℚ :=
  256 * pauseStripOddsLower (pauseStripCellLeft i) * pauseStripBracket i

/-- The rational floor for the four-section curvature contrast. -/
def pauseStripCellFloor (i : Fin 40) : ℚ :=
  (3 / 25) * pauseStripSecondLower i - 9 - 11 * pauseStripSlopeUpper i -
    (53 / 100) * (pauseStripSlopeUpper i) ^ 2

set_option maxHeartbeats 0 in
set_option maxRecDepth 10000 in
/-- The two exponential arguments lie in the nonnegative range for the
positive series and the convergence range for the geometric tail. The
second-derivative bracket is strictly positive in every rational cell. -/
theorem pauseStripCell_admissible (i : Fin 40) :
    0 ≤ pauseStripArgument (pauseStripCellLeft i) ∧
      pauseStripArgument (pauseStripCellLeft i) < 22 ∧
      0 ≤ pauseStripArgument (pauseStripCellRight i) ∧
      pauseStripArgument (pauseStripCellRight i) < 22 ∧
      0 < pauseStripBracket i := by
  fin_cases i <;> decide +kernel

set_option maxHeartbeats 0 in
set_option maxRecDepth 10000 in
/-- For each cell, the exact rational lower bound for the contrast exceeds
133. The finite decisions reduce in Lean's kernel. -/
theorem pauseStripCellFloor_gt_133 (i : Fin 40) : (133 : ℚ) < pauseStripCellFloor i := by
  fin_cases i <;> decide +kernel

/-- The analytical counterpart of the rational series replay. The first
omitted coefficient is multiplied by exactly the geometric sum for ratio
`y / 22`. The bound is valid throughout `0 ≤ y < 22`. -/
theorem pauseStripExp_bounds {y : ℝ} (hy : 0 ≤ y) (hy' : y < 22) :
    (∑ j ∈ Finset.range 21, y ^ j / (j.factorial : ℝ)) ≤ Real.exp y ∧
      Real.exp y ≤ (∑ j ∈ Finset.range 21, y ^ j / (j.factorial : ℝ)) +
        (y ^ 21 / (Nat.factorial 21 : ℝ)) / (1 - y / 22) := by
  let term (j : ℕ) := y ^ j / (j.factorial : ℝ)
  have hexp : HasSum term (Real.exp y) := by
    rw [Real.exp_eq_exp_ℝ]
    exact NormedSpace.expSeries_div_hasSum_exp y
  have hratio : 0 ≤ y / 22 := by positivity
  have hratio' : y / 22 < 1 := (div_lt_one (by norm_num)).2 hy'
  have ht (j : ℕ) : term (j + 21) ≤ term 21 * (y / 22) ^ j := by
    have hfac : (Nat.factorial 21 : ℝ) * (22 : ℝ) ^ j ≤ ((j + 21).factorial : ℝ) := by
      exact_mod_cast (show Nat.factorial 21 * 22 ^ j ≤ (j + 21).factorial by
        simpa only [Nat.add_comm j 21] using (@Nat.factorial_mul_pow_le_factorial 21 j))
    calc
      _ ≤ y ^ (j + 21) / ((Nat.factorial 21 : ℝ) * (22 : ℝ) ^ j) :=
        div_le_div_of_nonneg_left (pow_nonneg hy _) (by positivity) hfac
      _ = _ := by
        unfold term
        rw [pow_add, div_pow]
        ring
  refine ⟨?_, ?_⟩
  · unfold term at hexp
    rw [← hexp.tsum_eq]
    exact hexp.summable.sum_le_tsum _ (fun j _ => div_nonneg (pow_nonneg hy _) (by positivity))
  · change Real.exp y ≤ (∑ j ∈ Finset.range 21, term j) + term 21 / (1 - y / 22)
    rw [← hexp.tsum_eq, ← hexp.summable.sum_add_tsum_nat_add 21]
    apply add_le_add (le_refl _)
    have hShift : Summable (fun j => term (j + 21)) := (summable_nat_add_iff 21).2 hexp.summable
    have hGeom := (summable_geometric_of_lt_one hratio hratio').mul_left (term 21)
    have hSum := hShift.tsum_le_tsum ht hGeom
    rwa [tsum_mul_left, tsum_geometric_of_lt_one hratio hratio', ← div_eq_mul_inv] at hSum

/-- The rational odds endpoints enclose the exact inverse exponential at a
rational argument in the admissible range. -/
theorem pauseStripOdds_enclose (x : ℚ) (h₀ : 0 ≤ pauseStripArgument x)
    (h₂₂ : pauseStripArgument x < 22) :
    (pauseStripOddsLower x : ℝ) ≤ Real.exp (-(pauseStripArgument x : ℝ)) ∧
      Real.exp (-(pauseStripArgument x : ℝ)) ≤ (pauseStripOddsUpper x : ℝ) := by
  let y : ℝ := pauseStripArgument x
  have hy : 0 ≤ y := by
    change (0 : ℝ) ≤ (pauseStripArgument x : ℝ)
    exact_mod_cast h₀
  have hy' : y < 22 := by
    change (pauseStripArgument x : ℝ) < 22
    exact_mod_cast h₂₂
  obtain ⟨hLower, hUpper⟩ := pauseStripExp_bounds hy hy'
  have hPartialPos : 0 < ∑ j ∈ Finset.range 21, y ^ j / (j.factorial : ℝ) := by
    have h₁ : y ^ 0 / (Nat.factorial 0 : ℝ) ≤ ∑ j ∈ Finset.range 21, y ^ j / (j.factorial : ℝ) :=
      Finset.single_le_sum (f := fun j : ℕ => y ^ j / (j.factorial : ℝ))
        (fun j _ => div_nonneg (pow_nonneg hy _) (by positivity))
        (show 0 ∈ Finset.range 21 by decide)
    exact (show 0 < y ^ 0 / (Nat.factorial 0 : ℝ) by simp).trans_le h₁
  have hUpperCast : (pauseStripOddsUpper x : ℝ) = (∑ j ∈ Finset.range 21, y ^ j / (j.factorial : ℝ))⁻¹ := by
    unfold pauseStripOddsUpper pauseStripExpPartial
    push_cast
    rw [one_div]
  have hLowerCast : (pauseStripOddsLower x : ℝ) =
      ((∑ j ∈ Finset.range 21, y ^ j / (j.factorial : ℝ)) +
        (y ^ 21 / (Nat.factorial 21 : ℝ)) / (1 - y / 22))⁻¹ := by
    unfold pauseStripOddsLower pauseStripExpPartial pauseStripExpTail
    push_cast
    rw [one_div]
  change (pauseStripOddsLower x : ℝ) ≤ Real.exp (-y) ∧ Real.exp (-y) ≤ (pauseStripOddsUpper x : ℝ)
  rw [Real.exp_neg, hLowerCast, hUpperCast]
  exact ⟨inv_anti₀ (Real.exp_pos _) hUpper, inv_anti₀ hPartialPos hLower⟩

/-- The odds bounds needed by the monotonic interval comparison, using the
left endpoint for the lower bound and the right endpoint for the upper bound. -/
theorem pauseStripCellOdds_enclose (i : Fin 40) :
    (pauseStripOddsLower (pauseStripCellLeft i) : ℝ) ≤
      Real.exp (-(pauseStripArgument (pauseStripCellLeft i) : ℝ)) ∧
    Real.exp (-(pauseStripArgument (pauseStripCellRight i) : ℝ)) ≤
      (pauseStripOddsUpper (pauseStripCellRight i) : ℝ) := by
  obtain ⟨hLeft, hLeft', hRight, hRight', _⟩ := pauseStripCell_admissible i
  exact ⟨(pauseStripOdds_enclose _ hLeft hLeft').1, (pauseStripOdds_enclose _ hRight hRight').2⟩

end SmoothPoincare.IntrinsicEntry
