import SmoothPoincare.Heights.RelativeFootCollar
import DifferentialGeometry.Topology.Manifold.PartialDiffeomorph.SupportedExtension

/-! # Ambient extension of a relative foot comparison on a signed collar -/

set_option autoImplicit false

open Set Manifold
open scoped ContDiff Manifold

namespace SmoothPoincare.SupportedLevelIsotopy

variable {E H L EX HX X : Type*}
  [NormedAddCommGroup E] [NormedSpace ℝ E] [TopologicalSpace H]
  [TopologicalSpace L] [ChartedSpace H L]
  [NormedAddCommGroup EX] [NormedSpace ℝ EX] [TopologicalSpace HX]
  [TopologicalSpace X] [ChartedSpace HX X] [T2Space X]
  {I : ModelWithCorners ℝ E H} {IX : ModelWithCorners ℝ EX HX} {C : Set L}

/-- The signed collar comparison extends to an ambient smooth self-diffeomorphism.
Both directions have the prescribed comparison on the full target and fix the
complement of the compact image of the supported strip. Any height calibrated
by the signed collar coordinate is preserved everywhere in both directions. -/
theorem exists_ambientSignedCollarDiffeomorph (A : SupportedLevelIsotopy I C)
    (χ : PartialDiffeomorph (I.prod 𝓘(ℝ, ℝ)) IX (L × ℝ) X ∞)
    {a b r : ℝ} (ha : 0 < a) (hab : a < b) (hbr : b < r)
    (hχ : χ.source = {p | p.2 ∈ Ioo (-r) r}) :
    let K := χ '' (A.support ×ˢ Icc (-b) b)
    ∃ F : X ≃ₘ^∞⟮IX, IX⟯ X,
      (∀ p ∈ χ.source,
        F (χ p) = χ (A.signedCollarDiffeomorph a b p) ∧
        F.symm (χ p) = χ ((A.signedCollarDiffeomorph a b).symm p)) ∧
      (∀ y ∈ χ.target, F y = A.signedCollarComparison a b χ χ y ∧
        F.symm y = (A.signedCollarComparison a b χ χ).symm y) ∧
      IsCompact K ∧ K ⊆ χ.target ∧
      (∀ y ∉ K, F y = y ∧ F.symm y = y) ∧
      ∀ (height : X → ℝ) (c : ℝ), (∀ p ∈ χ.source, height (χ p) = c + p.2) →
        ∀ y, height (F y) = height y ∧ height (F.symm y) = height y := by
  classical
  let D := A.signedCollarDiffeomorph a b
  let S := A.support ×ˢ Icc (-b) b
  have hS : IsCompact S := A.compact_support.prod isCompact_Icc
  have hSχ : S ⊆ χ.source := by
    intro p hp
    rw [hχ]
    exact ⟨(neg_lt_neg hbr).trans_le hp.2.1, hp.2.2.trans_lt hbr⟩
  have hfix (p : L × ℝ) (hp : p ∉ S) : D p = p := by
    by_cases hz : p.1 ∈ A.support
    · have ht : b ≤ |p.2| := le_of_not_gt fun hlt =>
        hp ⟨hz, (abs_lt.mp hlt).1.le, (abs_lt.mp hlt).2.le⟩
      exact (A.signedCollarDiffeomorph_eq_identity ha hab ht).1
    · exact (A.signedCollarDiffeomorph_fixes_off_support a b hz).1
  obtain ⟨F, _, _, hF, hK, hKχ, hFfix⟩ :=
    χ.exists_diffeomorph_family_extension (IP := 𝓘(ℝ, ℝ)) (fun _ : ℝ => D)
      (D.contMDiff.comp contMDiff_snd) (D.symm.contMDiff.comp contMDiff_snd)
      hS hSχ (fun _ => hfix)
  have hmark (p : L × ℝ) (hp : p ∈ χ.source) :
      F 0 (χ p) = χ (D p) ∧ (F 0).symm (χ p) = χ (D.symm p) := by
    constructor
    · rw [(hF 0 (χ p)).1]
      change (if χ p ∈ χ.target then χ (D (χ.symm (χ p))) else χ p) = _
      rw [ite_eq_left (χ.map_source hp)]
      exact congrArg (fun q => χ (D q)) (χ.symm_apply_apply hp)
    · rw [(hF 0 (χ p)).2]
      change (if χ p ∈ χ.target then χ (D.symm (χ.symm (χ p))) else χ p) = _
      rw [ite_eq_left (χ.map_source hp)]
      exact congrArg (fun q => χ (D.symm q)) (χ.symm_apply_apply hp)
  refine ⟨F 0, hmark, ?_, hK, hKχ, hFfix 0, ?_⟩
  · intro y hy
    let p := χ.symm y
    have hp : p ∈ χ.source := χ.map_target hy
    rw [← χ.right_inv hy]
    exact ⟨(hmark p hp).1.trans (A.signedCollarComparison_apply a b χ χ hp).symm,
      (hmark p hp).2.trans (A.signedCollarComparison_symm_apply a b χ χ hp).symm⟩
  · intro height c hheight y
    by_cases hy : y ∈ χ.target
    · let p := χ.symm y
      have hp : p ∈ χ.source := χ.map_target hy
      have hDp : D p ∈ χ.source := by
        rw [hχ] at hp ⊢
        exact hp
      have hDip : D.symm p ∈ χ.source := by
        rw [hχ] at hp ⊢
        exact hp
      have hyEq : χ p = y := χ.right_inv hy
      rw [← hyEq, (hmark p hp).1, (hmark p hp).2,
        hheight p hp, hheight (D p) hDp, hheight (D.symm p) hDip]
      exact ⟨rfl, rfl⟩
    · obtain ⟨hF', hFi⟩ := hFfix 0 y (fun hm => hy (hKχ hm))
      rw [hF', hFi]
      exact ⟨rfl, rfl⟩

end SmoothPoincare.SupportedLevelIsotopy
