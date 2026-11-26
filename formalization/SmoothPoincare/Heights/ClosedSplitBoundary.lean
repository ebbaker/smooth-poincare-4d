import SmoothPoincare.Heights.ClosedMarkedControl
import DifferentialGeometry.Topology.HighDimensional.TwistedSphere

/-! # The actual split control outgoing boundary -/

open Set Metric DifferentialGeometry.Topology
open SmoothPoincare.StandardSurgeryModel
open SmoothPoincare.ClosedMarkedControl

namespace SmoothPoincare.ClosedMarkedControl

noncomputable section

section SplitClosing

local notation "DiskPair" => DifferentialGeometry.Topology.Disk 2 × Circle
local notation "TwoSphere" => BoundarySphere 2

/-- The common product torus in the two disk pieces at the split outgoing cut. -/
def splitClosingRim (p : Circle × Circle) : DiskPair :=
  (⟨p.1.val, sphere_subset_closedBall p.1.property⟩, p.2)

/-- The split outgoing level in the marked exterior and inserted-face coordinates. -/
abbrev SplitOutgoing := AdjunctionSpace splitClosingRim splitClosingRim

/-- The actual two-disk rule gives the split control's closing identification
with the upper product boundary. Both inverse rules are on whole pieces. -/
theorem exists_splitClosingHomeomorph :
    ∃ γ : SplitOutgoing ≃ₜ Circle × TwoSphere,
      (∀ p : DiskPair, γ (adjunctionLower splitClosingRim p) = (p.2,lowerHemisphere 1 p.1)) ∧
      (∀ p : DiskPair, γ (adjunctionCell splitClosingRim splitClosingRim p) =
        (p.2,upperHemisphere 1 p.1)) ∧
      (∀ p : DiskPair, γ.symm (p.2,lowerHemisphere 1 p.1) = adjunctionLower splitClosingRim p) ∧
      (∀ p : DiskPair, γ.symm (p.2,upperHemisphere 1 p.1) =
        adjunctionCell splitClosingRim splitClosingRim p) := by
  let f₀ : DiskPair → Circle × TwoSphere := fun p => (p.2, lowerHemisphere 1 p.1)
  let f₁ : DiskPair → Circle × TwoSphere := fun p => (p.2, upperHemisphere 1 p.1)
  have hstep (p : Circle × Circle) : f₁ (splitClosingRim p) = f₀ (splitClosingRim p) := by
    apply Prod.ext
    · rfl
    · apply Eq.symm
      apply (lowerHemisphere_eq_upperHemisphere_iff 1 _ _).mpr
      exact ⟨rfl, p.1.property⟩
  let f := Sum.elim f₁ f₀
  have hrel : ∀ a b, adjunctionRel splitClosingRim splitClosingRim a b → f a = f b := by
    rintro a b ⟨p, ⟨rfl,rfl⟩ | ⟨rfl,rfl⟩⟩
    · exact hstep p
    · exact (hstep p).symm
  let F : SplitOutgoing → Circle × TwoSphere := Quot.lift f hrel
  have hf₀ : Continuous f₀ :=
    continuous_snd.prodMk ((continuous_lowerHemisphere 1).comp continuous_fst)
  have hf₁ : Continuous f₁ :=
    continuous_snd.prodMk ((continuous_upperHemisphere 1).comp continuous_fst)
  have hF : Continuous F := continuous_quot_lift hrel (hf₁.sumElim hf₀)
  have hmix (p q : DiskPair) (h : f₁ p = f₀ q) :
      adjunctionCell splitClosingRim splitClosingRim p = adjunctionLower splitClosingRim q := by
    have hs : lowerHemisphere 1 q.1 = upperHemisphere 1 p.1 :=
      (congrArg Prod.snd h).symm
    obtain ⟨hp,hrim⟩ := (lowerHemisphere_eq_upperHemisphere_iff 1 q.1 p.1).mp hs
    let a : Circle × Circle := (⟨q.1.val, hrim⟩,q.2)
    have hq : splitClosingRim a = q := rfl
    have hp' : splitClosingRim a = p := Prod.ext hp (congrArg Prod.fst h).symm
    rw [← hp', ← hq]
    exact adjunction_coherence splitClosingRim splitClosingRim a
  have hinj : Function.Injective F := by
    intro a b
    refine Quot.inductionOn a (fun u => ?_)
    refine Quot.inductionOn b (fun v => ?_)
    intro h
    rcases u with p | p <;> rcases v with q | q
    · have he : f₁ p = f₁ q := h
      have hpq : p = q := Prod.ext (upperHemisphere_injective 1 (congrArg Prod.snd he))
        (congrArg Prod.fst he)
      subst q
      rfl
    · exact hmix p q h
    · exact (hmix q p h.symm).symm
    · have he : f₀ p = f₀ q := h
      have hpq : p = q := Prod.ext (lowerHemisphere_injective 1 (congrArg Prod.snd he))
        (congrArg Prod.fst he)
      subst q
      rfl
  have hsurj : Function.Surjective F := by
    rintro ⟨q,s⟩
    have hs : s ∈ range (lowerHemisphere 1) ∪ range (upperHemisphere 1) := by
      rw [range_lowerHemisphere_union_range_upperHemisphere]
      exact mem_univ s
    rcases hs with ⟨u,rfl⟩ | ⟨u,rfl⟩
    · exact ⟨adjunctionLower splitClosingRim (u,q),rfl⟩
    · exact ⟨adjunctionCell splitClosingRim splitClosingRim (u,q),rfl⟩
  let γ := IsHomeomorph.homeomorph F
    ((isHomeomorph_iff_continuous_bijective).mpr ⟨hF,hinj,hsurj⟩)
  have h₀ (p : DiskPair) : γ (adjunctionLower splitClosingRim p) = f₀ p := rfl
  have h₁ (p : DiskPair) : γ (adjunctionCell splitClosingRim splitClosingRim p) = f₁ p := rfl
  exact ⟨γ,h₀,h₁,fun p => γ.symm_apply_eq.mpr (h₀ p).symm,
    fun p => γ.symm_apply_eq.mpr (h₁ p).symm⟩

end SplitClosing

end

end SmoothPoincare.ClosedMarkedControl
