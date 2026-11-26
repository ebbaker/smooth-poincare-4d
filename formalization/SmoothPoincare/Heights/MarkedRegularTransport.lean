import SmoothPoincare.Heights.RegularEndMarkings
import SmoothPoincare.Heights.SelectedHandleReduction
import DifferentialGeometry.Topology.Morse.Rearrangement.NegDual

/-! # The same regular comparison in the model used by the native handles -/

open DifferentialGeometry.Topology DifferentialGeometry.Topology.Morse Set
open scoped ContDiff Manifold

namespace SmoothPoincare

section ModelChange

local notation "V₄" => EuclideanSpace ℝ (Fin 4)
local notation "coords" => PiLp.continuousLinearEquiv 2 ℝ (fun _ : Fin 4 => ℝ)

variable {H M : Type} [TopologicalSpace H] [TopologicalSpace M] [ChartedSpace H M]
  {I : ModelWithCorners ℝ V₄ H}
local notation "J" => I.transContinuousLinearEquiv coords

/-- The original ambient comparison, expressed in the model used by the
    native handles. The intervening model changes are identity maps. -/
noncomputable def nativeRegularComparison (Φ : M ≃ₘ^∞⟮I, I⟯ M) : M ≃ₘ^∞⟮J, J⟯ M :=
  let κ := ContinuousLinearEquiv.toTransContinuousLinearEquiv (n := ∞) I M coords
  (κ.symm.trans Φ).trans κ

@[simp] theorem nativeRegularComparison_apply (Φ : M ≃ₘ^∞⟮I, I⟯ M) (x : M) :
    nativeRegularComparison Φ x = Φ x := rfl

@[simp] theorem nativeRegularComparison_symm_apply (Φ : M ≃ₘ^∞⟮I, I⟯ M) (x : M) :
    (nativeRegularComparison Φ).symm x = Φ.symm x := rfl

variable [I.Boundaryless] [IsManifold I ∞ M]

/-- Restrict the exact ambient witness of a regular comparison to both actual
    sublevels and levels in the native smooth handle atlases. The quantified
    original witness still carries the two image equalities. -/
theorem HasRegularLevelTransport.exists_nativeMarked {h : M → ℝ} {a b : ℝ}
    (T : HasRegularLevelTransport I h a b)
    (hs : ContMDiff J 𝓘(ℝ, ℝ) ∞ h)
    (ha : ∀ x, h x = a → ¬ IsCriticalPointAt I h x)
    (hb : ∀ x, h x = b → ¬ IsCriticalPointAt I h x) :
    ∃ Φ : M ≃ₘ^∞⟮I, I⟯ M,
      Φ '' (h ⁻¹' Iic a) = h ⁻¹' Iic b ∧
      Φ '' (h ⁻¹' {a}) = h ⁻¹' {b} ∧
      RegularEndMarked hs hs
        (fun x hx hc => ha x hx ((isCriticalPointAt_transContinuousLinearEquiv_iff I coords h x).1 hc))
        (fun x hx hc => hb x hx ((isCriticalPointAt_transContinuousLinearEquiv_iff I coords h x).1 hc))
        (nativeRegularComparison Φ) := by
  obtain ⟨Φ, hsub, hlevel⟩ := T
  exact ⟨Φ, hsub, hlevel, regularEndMarked_of_image_eq hs hs _ _
    (nativeRegularComparison Φ) hsub hlevel⟩

end ModelChange

section OppositeLevel

variable {m : ℕ} {H M : Type*} [TopologicalSpace H] [TopologicalSpace M] [ChartedSpace H M]
  {I : ModelWithCorners ℝ (MorseModel (m + 1)) H} [I.Boundaryless] [IsManifold I ∞ M]
  {h : M → ℝ} {b : ℝ}

/-- The unsigned level comparison between the upper cut of the original
    height and the same cut read in the reversed height. Both maps are the
    identity on the ambient points. -/
theorem nativeOppositeLevelDiffeomorph
    (hf : ContMDiff I 𝓘(ℝ, ℝ) ∞ h)
    (hr : ∀ x, h x = b → ¬ IsCriticalPointAt I h x)
    (hrn : ∀ x, -h x = -b → ¬ IsCriticalPointAt I (fun y => -h y) x :=
      fun x hx hc => hr x (neg_injective hx) ((NegDual.isCriticalPointAt_neg_iff I h x).1 hc)) :
    letI := manifoldLevelSetChartedSpace I h b hf hr
    letI := manifoldLevelSetChartedSpace I (fun x => -h x) (-b) hf.neg hrn
    ∃ d : LevelSetSpace h b ≃ₘ^∞⟮𝓘(ℝ, MorseModel m), 𝓘(ℝ, MorseModel m)⟯
        LevelSetSpace (fun x => -h x) (-b),
      (∀ x, (d x).val = x.val) ∧ (∀ y, (d.symm y).val = y.val) := by
  let _ := manifoldLevelSetChartedSpace I h b hf hr
  let _ := manifoldLevelSetChartedSpace I (fun x => -h x) (-b) hf.neg hrn
  let _ := manifoldLevelSetIsManifold I h b hf hr
  let _ := manifoldLevelSetIsManifold I (fun x => -h x) (-b) hf.neg hrn
  let d : LevelSetSpace h b ≃ₘ^∞⟮𝓘(ℝ, MorseModel m), 𝓘(ℝ, MorseModel m)⟯
      LevelSetSpace (fun x => -h x) (-b) :=
    { toEquiv :=
        { toFun := fun x => ⟨x.val, congrArg Neg.neg x.property⟩
          invFun := fun y => ⟨y.val, neg_injective y.property⟩
          left_inv := fun _ => rfl
          right_inv := fun _ => rfl }
      contMDiff_toFun := contMDiff_levelSet_factor I (fun x => -h x) (-b) hf.neg hrn
        (Subtype.val : LevelSetSpace h b → M) (contMDiff_levelSetInclusion I h b hf hr)
        (fun x => congrArg Neg.neg x.property)
      contMDiff_invFun := contMDiff_levelSet_factor I h b hf hr
        (Subtype.val : LevelSetSpace (fun x => -h x) (-b) → M)
        (contMDiff_levelSetInclusion I (fun x => -h x) (-b) hf.neg hrn)
        (fun y => neg_injective y.property) }
  exact ⟨d, fun _ => rfl, fun _ => rfl⟩

end OppositeLevel

end SmoothPoincare
