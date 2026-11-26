import DifferentialGeometry.Topology.Manifold.ClosedBall
import Mathlib.Analysis.SpecialFunctions.Sqrt

/-! # An independent Euclidean model for a binary merger -/

open DifferentialGeometry.Topology.Handle Set
open scoped ContDiff Manifold

namespace SmoothPoincare

noncomputable section

local notation "V" => EuclideanSpace ℝ (Fin 4)

/-- The axial double-well height, with a positive transverse quadratic term. -/
def markedEdgeModelHeight (x : V) : ℝ :=
  (x 0 ^ 2 - 1) ^ 2 + ‖closedCellTail 3 x‖ ^ 2

private def transverseScale (a t : ℝ) : ℝ :=
  Real.sqrt ((a + 1) * (a - 1 + t ^ 2))

private theorem transverseScale_pos {a : ℝ} (ha : 1 < a) (t : ℝ) :
    0 < transverseScale a t := by
  apply Real.sqrt_pos.mpr
  exact mul_pos (by linarith) (by nlinarith [sq_nonneg t])

private theorem contDiff_transverseScale {a : ℝ} (ha : 1 < a) :
    ContDiff ℝ ∞ (transverseScale a) := by
  apply (show ContDiff ℝ ∞ (fun t : ℝ => (a + 1) * (a - 1 + t ^ 2)) by fun_prop).sqrt
  intro t
  exact (mul_pos (by linarith : 0 < a + 1) (by nlinarith [sq_nonneg t])).ne'

/-- Normalize the actual Euclidean double-well body by a positive axial
scale and a positive transverse scale depending on the axial point. -/
def markedEdgeModelFlatten {a : ℝ} (ha : 1 < a) : V ≃ₘ^∞⟮𝓘(ℝ,V),𝓘(ℝ,V)⟯ V := by
  let r := Real.sqrt (a + 1)
  have hr : 0 < r := Real.sqrt_pos.mpr (by linarith)
  let e (x : V) := closedCellCons 3 (x 0 / r) ((transverseScale a (x 0))⁻¹ • closedCellTail 3 x)
  let d (y : V) := closedCellCons 3 (r * y 0) (transverseScale a (r * y 0) • closedCellTail 3 y)
  have h0 : ContDiff ℝ ∞ (fun x : V => x 0) := by fun_prop
  refine
    { toFun := e
      invFun := d
      left_inv := ?_
      right_inv := ?_
      contMDiff_toFun := ?_
      contMDiff_invFun := ?_ }
  · intro x
    have ht : r * (x 0 / r) = x 0 := by field_simp [hr.ne']
    dsimp only [e,d]
    rw [closedCellCons_apply_zero, closedCellCons_tail, ht, smul_smul,
      mul_inv_cancel₀ (transverseScale_pos ha _).ne', one_smul, closedCellCons_split]
  · intro y
    have ht : (r * y 0) / r = y 0 := by field_simp [hr.ne']
    dsimp only [e,d]
    rw [closedCellCons_apply_zero, closedCellCons_tail, ht, smul_smul,
      inv_mul_cancel₀ (transverseScale_pos ha _).ne', one_smul, closedCellCons_split]
  · have hScale := (contDiff_transverseScale ha).comp h0
    exact (closedCellCons_contDiff.comp <| (h0.div_const r).prodMk
      ((hScale.inv (fun x => (transverseScale_pos ha (x 0)).ne')).smul closedCellTail_contDiff)).contMDiff
  · have hAxis : ContDiff ℝ ∞ (fun y : V => r * y 0) := contDiff_const.mul h0
    exact (closedCellCons_contDiff.comp <| hAxis.prodMk
      (((contDiff_transverseScale ha).comp hAxis).smul closedCellTail_contDiff)).contMDiff

/-- The height defect is the unit-ball radial defect times a strictly
positive factor. This single equality keeps the interior, boundary, and
exterior signs, and verifies the model independently of a source cover. -/
theorem markedEdgeModelFlatten_heightDefect {a : ℝ} (ha : 1 < a) (x : V) :
    markedEdgeModelHeight x - a ^ 2 =
      (a + 1) * (a - 1 + x 0 ^ 2) * (‖markedEdgeModelFlatten ha x‖ ^ 2 - 1) := by
  let r := Real.sqrt (a + 1)
  let s := transverseScale a (x 0)
  have hr : 0 < r := Real.sqrt_pos.mpr (by linarith)
  have hs : 0 < s := transverseScale_pos ha _
  have hr_sq : r ^ 2 = a + 1 := Real.sq_sqrt (by linarith)
  have hWeight : 0 < (a + 1) * (a - 1 + x 0 ^ 2) :=
    mul_pos (by linarith) (by nlinarith [sq_nonneg (x 0)])
  have hs_sq : s ^ 2 = (a + 1) * (a - 1 + x 0 ^ 2) := Real.sq_sqrt hWeight.le
  change (x 0 ^ 2 - 1) ^ 2 + ‖closedCellTail 3 x‖ ^ 2 - a ^ 2 =
    (a + 1) * (a - 1 + x 0 ^ 2) *
      (‖closedCellCons 3 (x 0 / r) (s⁻¹ • closedCellTail 3 x)‖ ^ 2 - 1)
  rw [closedCellCons_norm_sq, norm_smul, Real.norm_eq_abs, abs_of_pos (inv_pos.mpr hs),
    div_pow, mul_pow, inv_pow, hr_sq, hs_sq]
  field_simp [ne_of_gt hWeight, show a + 1 ≠ 0 by linarith,
    show a - 1 + x 0 ^ 2 ≠ 0 by nlinarith [sq_nonneg (x 0)]]
  ring

/-- Every outgoing model height above the saddle encloses a literal smooth
standard ball, with its outgoing level mapped to the literal unit sphere. -/
theorem markedEdgeModelFlatten_images {a : ℝ} (ha : 1 < a) :
    markedEdgeModelFlatten ha '' (markedEdgeModelHeight ⁻¹' Iic (a ^ 2)) =
      Metric.closedBall (0 : V) 1 ∧
    markedEdgeModelFlatten ha '' (markedEdgeModelHeight ⁻¹' {a ^ 2}) = Metric.sphere (0 : V) 1 := by
  let d := markedEdgeModelFlatten ha
  have hWeight (x : V) : 0 < (a + 1) * (a - 1 + x 0 ^ 2) :=
    mul_pos (by linarith) (by nlinarith [sq_nonneg (x 0)])
  have hBody (x : V) : markedEdgeModelHeight x ≤ a ^ 2 ↔ ‖d x‖ ≤ 1 := by
    have hEq := markedEdgeModelFlatten_heightDefect ha x
    change markedEdgeModelHeight x - a ^ 2 = _ * (‖d x‖ ^ 2 - 1) at hEq
    have hSquare : ‖d x‖ ^ 2 ≤ 1 ↔ ‖d x‖ ≤ 1 := by
      simpa only [one_pow] using sq_le_sq₀ (norm_nonneg (d x)) zero_le_one
    rw [← sub_nonpos, hEq]
    constructor
    · intro h
      exact hSquare.mp (sub_nonpos.mp (nonpos_of_mul_nonpos_right h (hWeight x)))
    · intro h
      exact mul_nonpos_of_nonneg_of_nonpos (hWeight x).le
        (sub_nonpos.mpr (hSquare.mpr h))
  have hLevel (x : V) : markedEdgeModelHeight x = a ^ 2 ↔ ‖d x‖ = 1 := by
    have hEq := markedEdgeModelFlatten_heightDefect ha x
    change markedEdgeModelHeight x - a ^ 2 = _ * (‖d x‖ ^ 2 - 1) at hEq
    rw [← sub_eq_zero, hEq, mul_eq_zero, or_iff_right (hWeight x).ne', sub_eq_zero]
    constructor <;> intro h <;> nlinarith [norm_nonneg (d x)]
  constructor
  · ext y
    obtain ⟨x, rfl⟩ := d.surjective y
    rw [Metric.mem_closedBall, dist_zero_right]
    change d x ∈ d '' (markedEdgeModelHeight ⁻¹' Iic (a ^ 2)) ↔ ‖d x‖ ≤ 1
    rw [← hBody x]
    constructor
    · rintro ⟨z, hz, he⟩
      exact d.injective he ▸ hz
    · intro hx
      exact ⟨x, hx, rfl⟩
  · ext y
    obtain ⟨x, rfl⟩ := d.surjective y
    rw [Metric.mem_sphere, dist_zero_right]
    change d x ∈ d '' (markedEdgeModelHeight ⁻¹' {a ^ 2}) ↔ ‖d x‖ = 1
    rw [← hLevel x]
    constructor
    · rintro ⟨z, hz, he⟩
      exact d.injective he ▸ hz
    · intro hx
      exact ⟨x, hx, rfl⟩

end

end SmoothPoincare
