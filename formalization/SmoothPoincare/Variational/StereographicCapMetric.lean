import SmoothPoincare.Variational.TransportedDiskCaps
import Mathlib.Geometry.Euclidean.Inversion.Calculus

/-! # The round metric in the stereographic cap chart -/

open DifferentialGeometry DifferentialGeometry.Geometry FirstOrderTwistor
open Manifold Metric
open scoped ContDiff Manifold RealInnerProductSpace

namespace SmoothPoincare
noncomputable section

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "V₅" => EuclideanSpace ℝ (Fin 5)
local notation "I₄" => 𝓘(ℝ, E₄)

local instance : Fact (Module.finrank ℝ V₅ = 4 + 1) := ⟨by simp⟩

private abbrev north : StandardFourSphere := transportedCapNorthPole
private abbrev pole : V₅ := north

private def northCoordinates : (ℝ ∙ pole)ᗮ ≃ₗᵢ[ℝ] E₄ :=
  (OrthonormalBasis.fromOrthogonalSpanSingleton 4 (ne_zero_of_mem_unit_sphere north)).repr

private def equatorInclusion : E₄ →L[ℝ] V₅ :=
  (ℝ ∙ pole)ᗮ.subtypeL.comp northCoordinates.symm.toContinuousLinearEquiv.toContinuousLinearMap

private theorem equatorInclusion_orth (x : E₄) :
    ⟪equatorInclusion x, pole⟫ = 0 :=
  real_inner_comm pole (equatorInclusion x) ▸
    Submodule.mem_orthogonal_singleton_iff_inner_right.mp (northCoordinates.symm x).property

private theorem equatorInclusion_inner (v w : E₄) :
    ⟪equatorInclusion v, equatorInclusion w⟫ = ⟪v, w⟫ :=
  northCoordinates.symm.inner_map_map v w

private theorem equatorInclusion_norm (x : E₄) :
    ‖equatorInclusion x‖ = ‖x‖ :=
  northCoordinates.symm.norm_map x

private def inversionInput (x : E₄) : V₅ := equatorInclusion x - (2 : ℝ) • pole

private theorem inversionInput_norm_sq (x : E₄) :
    ‖inversionInput x‖ ^ 2 = ‖x‖ ^ 2 + 4 := by
  rw [inversionInput, norm_sub_sq_real, real_inner_smul_right, equatorInclusion_orth,
    equatorInclusion_norm, norm_smul, norm_eq_of_mem_sphere north]
  norm_num

private theorem inverse_chart_as_inversion (x : E₄) :
    (transportedCapStereographic.symm x : V₅) =
      EuclideanGeometry.inversion (0 : V₅) 2 (inversionInput x) + pole := by
  change ((↑((stereographic' 4 north).symm x)) : V₅) = _
  rw [stereographic'_symm_apply]
  change (‖equatorInclusion x‖ ^ 2 + 4)⁻¹ • (4 : ℝ) • equatorInclusion x +
      (‖equatorInclusion x‖ ^ 2 + 4)⁻¹ • (‖equatorInclusion x‖ ^ 2 - 4) • pole = _
  rw [equatorInclusion_norm]
  simp only [EuclideanGeometry.inversion, dist_zero_right, vsub_eq_sub, sub_zero,
    vadd_eq_add, add_zero, div_pow, inversionInput_norm_sq]
  let s := ‖x‖ ^ 2 + 4
  have hs : s ≠ 0 := by dsimp [s]; positivity
  have hPole : s⁻¹ * (‖x‖ ^ 2 - 4) = 1 - ((2 : ℝ) ^ 2 / s) * 2 := by
    field_simp [hs]
    dsimp [s]
    ring
  change s⁻¹ • (4 : ℝ) • equatorInclusion x + s⁻¹ • (‖x‖ ^ 2 - 4) • pole =
    ((2 : ℝ) ^ 2 / s) • (equatorInclusion x - (2 : ℝ) • pole) + pole
  have hScale : s⁻¹ * 4 = (2 : ℝ) ^ 2 / s := by
    rw [div_eq_mul_inv]
    ring
  rw [smul_smul, smul_smul, hPole, hScale, smul_sub, smul_smul, sub_smul, one_smul]
  abel

/-- The actual inverse stereographic parametrization pulls the unit round
metric back to the Euclidean metric multiplied by the radius-two factor. -/
theorem transportedCapStereographic_metric_inner (x v w : E₄) :
    let Q := transportedCapStereographic.symm
    standardRoundFourMetric.inner (Q x)
      (mfderiv I₄ I₄ Q x v) (mfderiv I₄ I₄ Q x w) =
      (16 / (‖x‖ ^ 2 + 4) ^ 2) * ⟪v, w⟫ := by
  let Q := transportedCapStereographic.symm
  let q := inversionInput x
  have hq : q ≠ 0 := by
    intro hz
    have hn := inversionInput_norm_sq x
    change ‖q‖ ^ 2 = _ at hn
    rw [hz, norm_zero] at hn
    nlinarith [sq_nonneg ‖x‖]
  let R := (ℝ ∙ (q - (0 : V₅)))ᗮ.reflection
  have hInv : HasFDerivAt (EuclideanGeometry.inversion (0 : V₅) 2)
      (((2 : ℝ) / dist q 0) ^ 2 • (R : V₅ →L[ℝ] V₅)) q :=
    EuclideanGeometry.hasFDerivAt_inversion hq
  have hInput : HasFDerivAt inversionInput equatorInclusion x :=
    equatorInclusion.hasFDerivAt.sub_const ((2 : ℝ) • pole)
  have hAmbient : HasFDerivAt (fun y => (Q y : V₅))
      ((((2 : ℝ) / dist q 0) ^ 2 • (R : V₅ →L[ℝ] V₅)).comp equatorInclusion) x := by
    convert (hInv.comp x hInput).add_const pole using 1
    exact funext inverse_chart_as_inversion
  have hQsource : x ∈ Q.source := by
    change x ∈ transportedCapStereographic.target
    rw [transportedCapStereographic_target]
    trivial
  have hQ := (Q.contMDiffOn_toFun.contMDiffAt
    (Q.open_source.mem_nhds hQsource)).mdifferentiableAt (by simp : (∞ : ℕ∞ω) ≠ 0)
  have hIncl := (contMDiff_coe_sphere (E := V₅) (n := 4) (m := ∞)).mdifferentiableAt
    (by simp : (∞ : ℕ∞ω) ≠ 0) (x := Q x)
  have hDeriv (u : TangentSpace I₄ x) :
      dIncl (n := 4) (Q x) (mfderiv I₄ I₄ Q x u) =
        ((2 : ℝ) / dist q 0) ^ 2 • R (equatorInclusion u) := by
    calc
      _ = mvfderiv I₄ (fun y => (Q y : V₅)) x u :=
        (mvfderiv_comp_apply x hIncl hQ u).symm
      _ = _ := by
        rw [mvfderiv_eq_fderiv, hAmbient.fderiv]
        rfl
  change (roundMetric (E := V₅) (n := 4)).inner (Q x)
    (mfderiv I₄ I₄ Q x v) (mfderiv I₄ I₄ Q x w) = _
  rw [roundMetric_inner]
  erw [hDeriv v, hDeriv w]
  rw [real_inner_smul_left, real_inner_smul_right, R.inner_map_map,
    equatorInclusion_inner, dist_zero_right]
  have hNorm : ‖q‖ ^ 2 = ‖x‖ ^ 2 + 4 := inversionInput_norm_sq x
  have hFactor : ((2 : ℝ) / ‖q‖) ^ 2 * ((2 : ℝ) / ‖q‖) ^ 2 =
      16 / (‖x‖ ^ 2 + 4) ^ 2 := by
    rw [← pow_two, div_pow, hNorm, div_pow]
    norm_num
  rw [← mul_assoc, hFactor]

/-- The inverse of the actual scaled pocket marking has the same round
metric, with the additional quadratic factor from the inverse dilation. -/
theorem transportedCapPocketChart_metric_inner (b : ℝ) (hb : 0 < b) (z v w : E₄) :
    let P := (transportedCapPocketChart b hb).symm
    standardRoundFourMetric.inner (P z)
      (mfderiv I₄ I₄ P z v) (mfderiv I₄ I₄ P z w) =
      (16 * (2 / b) ^ 2 / (‖(2 / b) • z‖ ^ 2 + 4) ^ 2) * ⟪v, w⟫ := by
  let P := (transportedCapPocketChart b hb).symm
  let Q := transportedCapStereographic.symm
  let L : E₄ →L[ℝ] E₄ := (2 / b) • ContinuousLinearMap.id ℝ E₄
  have hInvScale : (b / 2)⁻¹ = 2 / b := by
    field_simp [hb.ne']
  have hP : (P : E₄ → StandardFourSphere) = (Q : E₄ → StandardFourSphere) ∘ L := by
    funext y
    change Q ((b / 2)⁻¹ • y) = Q ((2 / b) • y)
    rw [hInvScale]
  have hQsource : L z ∈ Q.source := by
    change L z ∈ transportedCapStereographic.target
    rw [transportedCapStereographic_target]
    trivial
  have hQ := (Q.contMDiffOn_toFun.contMDiffAt
    (Q.open_source.mem_nhds hQsource)).mdifferentiableAt (by simp : (∞ : ℕ∞ω) ≠ 0)
  have hL : MDifferentiableAt I₄ I₄ L z := L.hasFDerivAt.hasMFDerivAt.mdifferentiableAt
  have hD (u : TangentSpace I₄ z) :
      mfderiv I₄ I₄ (P : E₄ → StandardFourSphere) z u =
        mfderiv I₄ I₄ Q (L z) (L u) := by
    rw [hP, mfderiv_comp_apply z hQ hL, mfderiv_eq_fderiv, ContinuousLinearMap.fderiv]
    rfl
  change standardRoundFourMetric.inner (P z)
    (mfderiv I₄ I₄ (P : E₄ → StandardFourSphere) z v)
    (mfderiv I₄ I₄ (P : E₄ → StandardFourSphere) z w) = _
  have hz : P z = Q (L z) := congrFun hP z
  erw [hD v, hD w, hz]
  rw [transportedCapStereographic_metric_inner]
  change (16 / (‖(2 / b) • z‖ ^ 2 + 4) ^ 2) * ⟪(2 / b) • v, (2 / b) • w⟫ = _
  rw [real_inner_smul_left, real_inner_smul_right]
  ring

end
end SmoothPoincare
