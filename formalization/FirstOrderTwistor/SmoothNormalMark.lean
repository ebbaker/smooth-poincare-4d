import FirstOrderTwistor.NormalCutMark
import Mathlib.Analysis.SpecialFunctions.Log.Deriv
import Mathlib.Geometry.Manifold.Diffeomorph
import Mathlib.Geometry.Manifold.Instances.Sphere

/-!
# Smooth logarithmic coordinates for the normal cut

The topological marking uses the standard smooth unit sphere in Euclidean
four-space. Its inverse recovers the signed logarithmic radius and the
normalized vector in the original angular coordinates.
-/

open Set Metric
open scoped ContDiff Manifold

namespace FirstOrderTwistor

local instance : Fact (Module.finrank ℝ EuclideanFour = 3 + 1) :=
  ⟨finrank_euclideanSpace_fin⟩

/-- The punctured normal coordinate domain with its open-subset manifold structure. -/
def puncturedNormalFour : TopologicalSpace.Opens EuclideanFour :=
  ⟨{0}ᶜ, isOpen_compl_singleton⟩

local notation "S3" => sphere (0 : EuclideanFour) 1
local notation "CylinderModel" => ModelWithCorners.prod 𝓘(ℝ, ℝ) (𝓡 3)
local notation "PuncturedFour" => puncturedNormalFour

theorem normalCutPolarHomeomorph_symm_fst {s : ℝ} (hs : 0 < s)
    (J : EuclideanFour ≃ₗᵢ[ℝ] EuclideanFour) (x : PuncturedFour) :
    ((normalCutPolarHomeomorph hs J).symm x).1 = -Real.log (‖(x : EuclideanFour)‖ / s) := by
  obtain ⟨⟨t, w⟩, rfl⟩ := (normalCutPolarHomeomorph hs J).surjective x
  rw [Homeomorph.symm_apply_apply, normalCutPolarHomeomorph_apply, normalCutPolar_log_radius hs]

theorem normalCutPolarHomeomorph_symm_snd {s : ℝ} (hs : 0 < s)
    (J : EuclideanFour ≃ₗᵢ[ℝ] EuclideanFour) (x : PuncturedFour) :
    (((normalCutPolarHomeomorph hs J).symm x).2 : EuclideanFour) =
      J.symm (‖(x : EuclideanFour)‖⁻¹ • (x : EuclideanFour)) := by
  obtain ⟨⟨t, w⟩, rfl⟩ := (normalCutPolarHomeomorph hs J).surjective x
  rw [Homeomorph.symm_apply_apply, normalCutPolarHomeomorph_apply, norm_normalCutPolar hs]
  change (w : EuclideanFour) = J.symm ((s * Real.exp (-t))⁻¹ • ((s * Real.exp (-t)) • J w))
  rw [smul_smul, inv_mul_cancel₀ (mul_pos hs (Real.exp_pos _)).ne', one_smul, J.symm_apply_apply]

theorem contMDiff_normalCutPolarHomeomorph {s : ℝ} (hs : 0 < s)
    (J : EuclideanFour ≃ₗᵢ[ℝ] EuclideanFour) :
    ContMDiff (M' := PuncturedFour) CylinderModel 𝓘(ℝ, EuclideanFour) ∞
      (normalCutPolarHomeomorph hs J) := by
  apply (ContMDiff.subtypeVal_comp_iff PuncturedFour (normalCutPolarHomeomorph hs J)).mp
  have htime : ContDiff ℝ ∞ (fun t : ℝ => s * Real.exp (-t)) :=
    contDiff_const.mul (Real.contDiff_exp.comp contDiff_neg)
  have hrad : ContMDiff CylinderModel 𝓘(ℝ, ℝ) ∞
      (fun q : ℝ × S3 => s * Real.exp (-q.1)) :=
    htime.contMDiff.comp contMDiff_fst
  have hang : ContMDiff CylinderModel 𝓘(ℝ, EuclideanFour) ∞
      (fun q : ℝ × S3 => J q.2) :=
    J.toContinuousLinearEquiv.toContinuousLinearMap.contMDiff.comp
      (contMDiff_coe_sphere.comp contMDiff_snd)
  change ContMDiff CylinderModel 𝓘(ℝ, EuclideanFour) ∞
    (fun q : ℝ × S3 => (normalCutPolarHomeomorph hs J (q.1, q.2) : EuclideanFour))
  simp only [normalCutPolarHomeomorph_apply, normalCutPolar, normalCapMark]
  exact hrad.smul hang

theorem contMDiff_normalCutPolarHomeomorph_symm {s : ℝ} (hs : 0 < s)
    (J : EuclideanFour ≃ₗᵢ[ℝ] EuclideanFour) :
    ContMDiff (M := PuncturedFour) 𝓘(ℝ, EuclideanFour) CylinderModel ∞
      (normalCutPolarHomeomorph hs J).symm := by
  have hval : ContMDiff 𝓘(ℝ, EuclideanFour) 𝓘(ℝ, EuclideanFour) ∞
      (Subtype.val : PuncturedFour → EuclideanFour) := contMDiff_subtype_val
  have hnorm : ContMDiff 𝓘(ℝ, EuclideanFour) 𝓘(ℝ, ℝ) ∞
      (fun x : PuncturedFour => ‖(x : EuclideanFour)‖) :=
    fun x => (contDiffAt_norm ℝ x.property).contMDiffAt.comp x (hval x)
  have hrad : ContMDiff 𝓘(ℝ, EuclideanFour) 𝓘(ℝ, ℝ) ∞
      (fun x : PuncturedFour => ((normalCutPolarHomeomorph hs J).symm x).1) := by
    simp_rw [normalCutPolarHomeomorph_symm_fst hs J]
    intro x
    have hne : ‖(x : EuclideanFour)‖ / s ≠ 0 :=
      div_ne_zero (norm_ne_zero_iff.mpr x.property) hs.ne'
    have hdiv : ContDiffAt ℝ ∞ (fun ρ : ℝ => ρ / s) ‖(x : EuclideanFour)‖ :=
      contDiffAt_id.div_const s
    have hlog : ContDiffAt ℝ ∞ (fun ρ : ℝ => -Real.log (ρ / s)) ‖(x : EuclideanFour)‖ :=
      (hdiv.log hne).neg
    exact ContMDiffAt.comp (f := fun y : PuncturedFour => ‖(y : EuclideanFour)‖)
      (g := fun ρ : ℝ => -Real.log (ρ / s)) x hlog.contMDiffAt (hnorm x)
  have hangAmbient : ContMDiff 𝓘(ℝ, EuclideanFour) 𝓘(ℝ, EuclideanFour) ∞
      (fun x : PuncturedFour => (((normalCutPolarHomeomorph hs J).symm x).2 : EuclideanFour)) := by
    simp_rw [normalCutPolarHomeomorph_symm_snd hs J]
    exact J.symm.toContinuousLinearEquiv.toContinuousLinearMap.contMDiff.comp
      ((hnorm.inv₀ fun x => norm_ne_zero_iff.mpr x.property).smul hval)
  have hang : ContMDiff 𝓘(ℝ, EuclideanFour) (𝓡 3) ∞
      (fun x : PuncturedFour => ((normalCutPolarHomeomorph hs J).symm x).2) :=
    hangAmbient.codRestrict_sphere (fun x => ((normalCutPolarHomeomorph hs J).symm x).2.property)
  exact hrad.prodMk hang

/-- The marked logarithmic polar homeomorphism is smooth in both directions. -/
noncomputable def normalCutPolarDiffeomorph {s : ℝ} (hs : 0 < s)
    (J : EuclideanFour ≃ₗᵢ[ℝ] EuclideanFour) :
    Diffeomorph CylinderModel 𝓘(ℝ, EuclideanFour) (ℝ × S3) PuncturedFour ∞ where
  toEquiv := (normalCutPolarHomeomorph hs J).toEquiv
  contMDiff_toFun := contMDiff_normalCutPolarHomeomorph hs J
  contMDiff_invFun := contMDiff_normalCutPolarHomeomorph_symm hs J

theorem normalCutPolarDiffeomorph_toHomeomorph {s : ℝ} (hs : 0 < s)
    (J : EuclideanFour ≃ₗᵢ[ℝ] EuclideanFour) :
    (normalCutPolarDiffeomorph hs J).toHomeomorph = normalCutPolarHomeomorph hs J :=
  Homeomorph.ext fun _ => rfl

theorem normalCutPolarDiffeomorph_apply {s : ℝ} (hs : 0 < s)
    (J : EuclideanFour ≃ₗᵢ[ℝ] EuclideanFour) (t : ℝ) (w : S3) :
    (normalCutPolarDiffeomorph hs J (t, w) : EuclideanFour) = normalCutPolar s J t w :=
  normalCutPolarHomeomorph_apply hs J t w

end FirstOrderTwistor
