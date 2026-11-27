import SmoothPoincare.Variational.BourBufferedCapWarp
import Mathlib.Analysis.InnerProductSpace.Projection.Reflection

/-! # Radial-first orthonormal frames on the actual capped metric

Prepared for Edward B. Baker III, 27 November 2026. The basis is chosen
pointwise, as required for the Euler density. Orientation adjustment allows
either sign of the radial axis.
-/

noncomputable section

open DifferentialGeometry FirstOrderTwistor SectionsAndConnections Set
open scoped Manifold ContDiff RealInnerProductSpace

namespace SmoothPoincare

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "I₄" => 𝓘(ℝ, E₄)
local notation "S₄" => StandardFourSphere

private local instance : Fact (Module.finrank ℝ (EuclideanSpace ℝ (Fin 5)) = 4 + 1) :=
  ⟨by simp⟩

/-- At each nonzero point of the native chart, the smooth capped metric
has a physical oriented orthonormal frame whose first axis is radial.
All four native vectors and their physical scale are identified. -/
theorem bourBufferedSphere_exists_radialFrame {r b : ℝ} (hr : 0 < r) (hb : 0 < b)
    (x : E₄) (hx : x ≠ 0) :
    let Q := bourBufferedSphereChart r hr
    let g := bourBufferedSphereMetric r hr b hb
    let speed := bourBufferedRadialSpeed r b ‖x‖
    ∃ e : OrthonormalBasis (Fin 4) ℝ E₄,
      (e 0 = ‖x‖⁻¹ • x ∨ e 0 = -(‖x‖⁻¹ • x)) ∧
      ∃ frame : OrientedOrthonormalFrameAt g bourBufferedSphereOrientation (Q x),
        ∀ i, frame.basis i = mfderiv I₄ I₄ Q x (speed⁻¹ • e i) := by
  intro Q g speed
  have hQ : IsLocalDiffeomorph I₄ I₄ ∞ (Q : E₄ → S₄) :=
    fun z => Q.isLocalDiffeomorphAt I₄ I₄ ∞ (by
      change z ∈ (transportedCapPocketChart r hr).target
      rw [transportedCapPocketChart_target]
      trivial)
  let D := hQ.mfderivToContinuousLinearEquiv (by simp) x
  let L := (LinearEquiv.smulOfNeZero ℝ E₄ speed⁻¹ (inv_ne_zero (bourBufferedRadialSpeed_pos _ _ _).ne')).trans D.toLinearEquiv
  have hL (v : E₄) : L v = mfderiv I₄ I₄ Q x (speed⁻¹ • v) := by
    change D (speed⁻¹ • v) = _
    exact DFunLike.congr_fun (hQ.mfderivToContinuousLinearEquiv_coe (by simp) x) _
  let o := bourBufferedSphereOrientation.orientation (Q x)
  let oE := Orientation.map (Fin 4) L.symm o
  let z : E₄ := ‖x‖⁻¹ • x
  have hz : ‖z‖ = 1 := by simp [z, norm_smul, norm_ne_zero_iff.mpr hx]
  let std := EuclideanSpace.basisFun (Fin 4) ℝ
  let bRad := std.map (Submodule.reflection (ℝ ∙ (std 0 - z))ᗮ)
  have hrad : bRad 0 = z := by
    exact Submodule.reflection_sub ((std.orthonormal.norm_eq_one 0).trans hz.symm)
  let e := bRad.adjustToOrientation oE
  have he : e.toBasis.orientation = oE := by
    exact bRad.orientation_adjustToOrientation oE
  have hOr : e 0 = z ∨ e 0 = -z := by
    simpa only [← hrad] using bRad.adjustToOrientation_apply_eq_or_eq_neg oE 0
  refine ⟨e, hOr, ⟨e.toBasis.map L, ?_, ?_⟩, fun i => hL (e i)⟩
  · intro i j
    simp only [Module.Basis.map_apply, OrthonormalBasis.coe_toBasis, hL]
    rw [bourBufferedSphereMetric_radial_inner hr hb, real_inner_smul_left, real_inner_smul_right,
      e.inner_eq_ite]
    change speed ^ 2 * (speed⁻¹ * (speed⁻¹ * _)) = _
    have hs : speed ≠ 0 := (bourBufferedRadialSpeed_pos _ _ _).ne'
    field_simp [hs]
  · rw [Module.Basis.orientation_map, he]
    change Orientation.map (Fin 4) L (Orientation.map (Fin 4) L.symm o) = o
    rw [← orientation_map_trans, LinearEquiv.symm_trans_self, Orientation.map_refl]
    rfl

/-- Coordinates of the radius in the very same Euclidean basis that maps
to the physical frame. The sign change maintains the prescribed orientation. -/
theorem bourBufferedSphere_radialProjection (x : E₄) (hx : x ≠ 0)
    (e : OrthonormalBasis (Fin 4) ℝ E₄)
    (he : e 0 = ‖x‖⁻¹ • x ∨ e 0 = -(‖x‖⁻¹ • x)) :
    ∃ ε : ℝ, ε ^ 2 = 1 ∧ ∀ i : Fin 4, ⟪x, e i⟫ = if i = 0 then ε * ‖x‖ else 0 := by
  have hnx : ‖x‖ ≠ 0 := norm_ne_zero_iff.mpr hx
  rcases he with hp | hn
  · refine ⟨1, by norm_num, ?_⟩
    have h : x = ‖x‖ • e 0 := by rw [hp, smul_smul, mul_inv_cancel₀ hnx, one_smul]
    intro i
    calc
      ⟪x, e i⟫ = ⟪‖x‖ • e 0, e i⟫ := congrArg (fun v => ⟪v, e i⟫) h
      _ = _ := by rw [real_inner_smul_left, e.inner_eq_ite]; by_cases hi : i = 0 <;> simp [hi, eq_comm]
  · refine ⟨-1, by norm_num, ?_⟩
    have h : x = (-‖x‖) • e 0 := by rw [hn, neg_smul, smul_neg, neg_neg, smul_smul,
                                             mul_inv_cancel₀ hnx, one_smul]
    intro i
    calc
      ⟪x, e i⟫ = ⟪(-‖x‖) • e 0, e i⟫ := congrArg (fun v => ⟪v, e i⟫) h
      _ = _ := by rw [real_inner_smul_left, e.inner_eq_ite]; by_cases hi : i = 0 <;> simp [hi, eq_comm]

end SmoothPoincare
