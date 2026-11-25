import Mathlib.CategoryTheory.Limits.Shapes.Pullback.IsPullback.Basic

/-!
# Marked reassembly across a common boundary

Two supplied pushout squares describe the source and target gluings. The
isomorphisms on the core and exterior use one boundary isomorphism in their
commuting squares. The induced map runs from the original glued object to
the reassembled target.
-/

open CategoryTheory

namespace FirstOrderTwistor

universe v u

variable {C : Type u} [Category.{v} C]
  {B K V M B' K' D Xhat : C}
  {coreMark : B ⟶ K} {exteriorMark : B ⟶ V}
  {coreMark' : B' ⟶ K'} {ballMark : B' ⟶ D}
  {coreIn : K ⟶ M} {exteriorIn : V ⟶ M}
  {coreIn' : K' ⟶ Xhat} {ballIn : D ⟶ Xhat}

variable (hM : IsPushout coreMark exteriorMark coreIn exteriorIn)
  (hXhat : IsPushout coreMark' ballMark coreIn' ballIn)
  (boundaryIso : B ≅ B') (coreIso : K ≅ K') (exteriorIso : V ≅ D)
  (hCore : coreMark ≫ coreIso.hom = boundaryIso.hom ≫ coreMark')
  (hExterior : exteriorMark ≫ exteriorIso.hom = boundaryIso.hom ≫ ballMark)

/-- The pushout isomorphism given by the two piece isomorphisms and their
shared boundary marking. -/
noncomputable def markedReassemblyIso : M ≅ Xhat :=
  hM.isoIsPushout K V <|
    hXhat.of_iso' (inl' := coreIso.hom ≫ coreIn') (inr' := exteriorIso.hom ≫ ballIn)
      boundaryIso coreIso exteriorIso (Iso.refl Xhat)
      hCore.symm hExterior.symm (by simp) (by simp)

/-- The induced map restricts to the marked core comparison. -/
@[reassoc (attr := simp)]
theorem inl_markedReassemblyIso_hom :
    coreIn ≫ (markedReassemblyIso hM hXhat boundaryIso coreIso exteriorIso hCore hExterior).hom =
      coreIso.hom ≫ coreIn' := by
  simp [markedReassemblyIso]

/-- The induced map restricts to the marked exterior-to-ball comparison. -/
@[reassoc (attr := simp)]
theorem inr_markedReassemblyIso_hom :
    exteriorIn ≫
        (markedReassemblyIso hM hXhat boundaryIso coreIso exteriorIso hCore hExterior).hom =
      exteriorIso.hom ≫ ballIn := by
  simp [markedReassemblyIso]

end FirstOrderTwistor
