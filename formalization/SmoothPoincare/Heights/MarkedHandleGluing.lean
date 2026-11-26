import DifferentialGeometry.Topology.Attachment.Homeomorph
import DifferentialGeometry.Topology.Handle.Defs
import Mathlib.Geometry.Manifold.Diffeomorph

/-! # Transport of the end markings of a handle presentation -/

open DifferentialGeometry.Topology
open scoped ContDiff Manifold

namespace SmoothPoincare

/-- Pull back an entire parametrized tube along the boundary maps of the lower body. -/
def transportedAttachingTube {A BP BP' Cminus : Type*}
    [TopologicalSpace BP] [TopologicalSpace BP'] [TopologicalSpace Cminus]
    (αb : BP' ≃ₜ BP) (p : BP ≃ₜ Cminus) (a : A → Cminus) : A → BP' :=
  αb.symm ∘ p.symm ∘ a

section MiddleHandles

variable {J P P' BP BP' Cminus : Type*}
  [TopologicalSpace P] [TopologicalSpace P']
  [TopologicalSpace BP] [TopologicalSpace BP'] [TopologicalSpace Cminus]

/-- A disjoint family of the full four-dimensional index-two attaching regions. -/
abbrev MiddleAttachingRegions (J : Type*) := Σ _ : J, Handle.AttachingRegion 2 2

/-- The corresponding disjoint family of four-dimensional handles. -/
abbrev MiddleHandles (J : Type*) := Σ _ : J, Handle.StandardHandle 2 2

def middleAttachingInclusion (J : Type*) : MiddleAttachingRegions J → MiddleHandles J :=
  fun t => ⟨t.1, Handle.attachingInclusion 2 2 t.2⟩

/-- The marked lower-body comparison fixes each handle point, including its framing
    coordinates. The full attaching tube is pulled back before taking the quotient. -/
def transportedMiddleTraceHomeomorph
    (α : P' ≃ₜ P) (αb : BP' ≃ₜ BP) (p : BP ≃ₜ Cminus)
    (jP : BP → P) (jP' : BP' → P') (hα : ∀ z, α (jP' z) = jP (αb z))
    (a : MiddleAttachingRegions J → Cminus) :
    AdjunctionSpace (middleAttachingInclusion J) (jP' ∘ transportedAttachingTube αb p a) ≃ₜ
      AdjunctionSpace (middleAttachingInclusion J) (jP ∘ p.symm ∘ a) :=
  adjunctionHomeomorph _ _ _ _ (Equiv.refl _) (Homeomorph.refl _) α (fun _ => rfl) fun t => by
    change α (jP' (αb.symm (p.symm (a t)))) = jP (p.symm (a t))
    rw [hα, αb.apply_symm_apply]

end MiddleHandles

/-- Pull back the outgoing boundary identification along the upper-body marking.
    A change of trace coordinates is included by precomposing `η`. -/
def transportedOutgoingGluing {BX BQ BQ' Cplus : Type*}
    [TopologicalSpace BX] [TopologicalSpace BQ] [TopologicalSpace BQ'] [TopologicalSpace Cplus]
    (βb : BQ' ≃ₜ BQ) (q : BQ ≃ₜ Cplus) (η : BX ≃ₜ Cplus) : BX ≃ₜ BQ' :=
  η.trans (q.symm.trans βb.symm)

section ClosedAssembly

variable {X X' Q Q' BX BX' BQ BQ' Cplus : Type*}
  [TopologicalSpace X] [TopologicalSpace X'] [TopologicalSpace Q] [TopologicalSpace Q']
  [TopologicalSpace BX] [TopologicalSpace BX'] [TopologicalSpace BQ] [TopologicalSpace BQ']
  [TopologicalSpace Cplus]

/-- Reassemble the traces along the actual outgoing identification. The trace map
    may be the one induced by `transportedMiddleTraceHomeomorph`. -/
def transportedClosedAssemblyHomeomorph
    (s : X' ≃ₜ X) (sb : BX' ≃ₜ BX) (β : Q' ≃ₜ Q) (βb : BQ' ≃ₜ BQ)
    (q : BQ ≃ₜ Cplus) (η : BX ≃ₜ Cplus)
    (jX : BX → X) (jX' : BX' → X') (jQ : BQ → Q) (jQ' : BQ' → Q')
    (hs : ∀ z, s (jX' z) = jX (sb z)) (hβ : ∀ z, β (jQ' z) = jQ (βb z)) :
    AdjunctionSpace jX' (jQ' ∘ transportedOutgoingGluing βb q (sb.trans η)) ≃ₜ
      AdjunctionSpace jX (jQ ∘ q.symm ∘ η) :=
  adjunctionHomeomorph _ _ _ _ sb.toEquiv s β hs fun z => by
    change β (jQ' (βb.symm (q.symm (η (sb z))))) = jQ (q.symm (η (sb z)))
    rw [hβ, βb.apply_symm_apply]

end ClosedAssembly

section Presentation

variable {J P P' BP BP' Cminus Q Q' BQ BQ' BX Cplus : Type*}
  [TopologicalSpace P] [TopologicalSpace P']
  [TopologicalSpace BP] [TopologicalSpace BP'] [TopologicalSpace Cminus]
  [TopologicalSpace Q] [TopologicalSpace Q']
  [TopologicalSpace BQ] [TopologicalSpace BQ'] [TopologicalSpace BX] [TopologicalSpace Cplus]

/-- Change both end-body markings of the same presentation. Parametrize the outgoing
    boundary of the new trace by pulling back the given outgoing boundary inclusion. -/
def transportedMorsePresentationHomeomorph
    (α : P' ≃ₜ P) (αb : BP' ≃ₜ BP) (p : BP ≃ₜ Cminus)
    (jP : BP → P) (jP' : BP' → P') (hα : ∀ z, α (jP' z) = jP (αb z))
    (a : MiddleAttachingRegions J → Cminus)
    (β : Q' ≃ₜ Q) (βb : BQ' ≃ₜ BQ) (q : BQ ≃ₜ Cplus) (η : BX ≃ₜ Cplus)
    (jQ : BQ → Q) (jQ' : BQ' → Q') (hβ : ∀ z, β (jQ' z) = jQ (βb z))
    (jX : BX → AdjunctionSpace (middleAttachingInclusion J) (jP ∘ p.symm ∘ a)) :
    let s := transportedMiddleTraceHomeomorph α αb p jP jP' hα a
    AdjunctionSpace (s.symm ∘ jX) (jQ' ∘ transportedOutgoingGluing βb q η) ≃ₜ
      AdjunctionSpace jX (jQ ∘ q.symm ∘ η) := by
  let s := transportedMiddleTraceHomeomorph α αb p jP jP' hα a
  exact transportedClosedAssemblyHomeomorph s (Homeomorph.refl BX) β βb q η
    jX (s.symm ∘ jX) jQ jQ' (fun z => s.apply_symm_apply (jX z)) hβ

end Presentation

section SmoothMarkings

variable {E H EB HB : Type*}
  [NormedAddCommGroup E] [NormedSpace ℝ E] [TopologicalSpace H]
  [NormedAddCommGroup EB] [NormedSpace ℝ EB] [TopologicalSpace HB]
  {IA : ModelWithCorners ℝ E H} {IB : ModelWithCorners ℝ EB HB}
  {A B B' C D : Type*} [TopologicalSpace A] [ChartedSpace H A]
  [TopologicalSpace B] [ChartedSpace HB B] [TopologicalSpace B'] [ChartedSpace HB B']
  [TopologicalSpace C] [ChartedSpace HB C] [TopologicalSpace D] [ChartedSpace HB D]

/-- With smooth boundary markings the full transported attaching tube is smooth. -/
theorem contMDiff_transportedAttachingTube
    (αb : B' ≃ₘ^∞⟮IB, IB⟯ B) (p : B ≃ₘ^∞⟮IB, IB⟯ C)
    {a : A → C} (ha : ContMDiff IA IB ∞ a) :
    ContMDiff IA IB ∞ (transportedAttachingTube αb.toHomeomorph p.toHomeomorph a) :=
  αb.symm.contMDiff.comp (p.symm.contMDiff.comp ha)

/-- The transported boundary gluing is a diffeomorphism when its marks are smooth. -/
noncomputable def transportedOutgoingDiffeomorph
    (βb : B' ≃ₘ^∞⟮IB, IB⟯ B) (q : B ≃ₘ^∞⟮IB, IB⟯ C)
    (η : D ≃ₘ^∞⟮IB, IB⟯ C) : D ≃ₘ^∞⟮IB, IB⟯ B' :=
  η.trans (q.symm.trans βb.symm)

@[simp] theorem transportedOutgoingDiffeomorph_toHomeomorph
    (βb : B' ≃ₘ^∞⟮IB, IB⟯ B) (q : B ≃ₘ^∞⟮IB, IB⟯ C)
    (η : D ≃ₘ^∞⟮IB, IB⟯ C) :
    (transportedOutgoingDiffeomorph βb q η).toHomeomorph =
      transportedOutgoingGluing βb.toHomeomorph q.toHomeomorph η.toHomeomorph := rfl

end SmoothMarkings

end SmoothPoincare
