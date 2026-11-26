import DifferentialGeometry.Topology.Morse.RegularLevel.Sublevel
import DifferentialGeometry.Topology.Morse.RegularLevel.NoCriticalValues

/-! # Smooth marked restrictions of regular sublevel transport -/

open DifferentialGeometry.Topology.Morse Set
open scoped ContDiff Manifold

namespace SmoothPoincare

section

variable {m : ℕ} {H M : Type*} [TopologicalSpace H] [TopologicalSpace M] [ChartedSpace H M]
  {I : ModelWithCorners ℝ (MorseModel (m + 1)) H} [I.Boundaryless] [IsManifold I ∞ M]
  {f g : M → ℝ} {a b : ℝ}

local notation "J" => morseModelWithCornersHalfSpace m
local notation "K" => 𝓘(ℝ, MorseModel m)

/-- The literal inclusion of a cut level into its closed sublevel. -/
def regularEndLevelInclusion (f : M → ℝ) (a : ℝ) (x : LevelSetSpace f a) : SublevelSpace f a :=
  ⟨x.val, le_of_eq x.property⟩

/-- The actual level and sublevel restrictions of one ambient diffeomorphism,
    using the native regular atlases for both cuts. -/
def RegularEndMarked (hf : ContMDiff I 𝓘(ℝ, ℝ) ∞ f) (hg : ContMDiff I 𝓘(ℝ, ℝ) ∞ g)
    (ha : ∀ x, f x = a → ¬ IsCriticalPointAt I f x)
    (hb : ∀ x, g x = b → ¬ IsCriticalPointAt I g x)
    (Φ : M ≃ₘ^∞⟮I, I⟯ M) : Prop :=
  letI := manifoldSublevelChartedSpace I f a hf ha
  letI := manifoldSublevelChartedSpace I g b hg hb
  letI := manifoldLevelSetChartedSpace I f a hf ha
  letI := manifoldLevelSetChartedSpace I g b hg hb
  ∃ (s : SublevelSpace f a ≃ₘ^∞⟮J, J⟯ SublevelSpace g b)
    (l : LevelSetSpace f a ≃ₘ^∞⟮K, K⟯ LevelSetSpace g b),
    (∀ x, (s x).val = Φ x.val) ∧
    (∀ y, (s.symm y).val = Φ.symm y.val) ∧
    (∀ x, (l x).val = Φ x.val) ∧
    (∀ y, (l.symm y).val = Φ.symm y.val) ∧
    (∀ x, s (regularEndLevelInclusion f a x) = regularEndLevelInclusion g b (l x)) ∧
    (∀ y, s.symm (regularEndLevelInclusion g b y) = regularEndLevelInclusion f a (l.symm y)) ∧
    ContMDiff K J ∞ (regularEndLevelInclusion f a) ∧
    ContMDiff K J ∞ (regularEndLevelInclusion g b)

private theorem mapsTo_inverse_of_image_eq {X : Type*} (e : X ≃ X) {s t : Set X}
    (h : e '' s = t) : MapsTo e.symm t s := by
  intro y hy
  obtain ⟨x, hx, rfl⟩ := h.symm.subset hy
  rwa [e.symm_apply_apply]

/-- Equality on the actual closed sublevels and actual levels is sufficient.
    Strict interior preservation follows from the inverse level map. The
    smooth maps in both directions are restrictions of the given ambient map. -/
theorem regularEndMarked_of_image_eq
    (hf : ContMDiff I 𝓘(ℝ, ℝ) ∞ f) (hg : ContMDiff I 𝓘(ℝ, ℝ) ∞ g)
    (ha : ∀ x, f x = a → ¬ IsCriticalPointAt I f x)
    (hb : ∀ x, g x = b → ¬ IsCriticalPointAt I g x)
    (Φ : M ≃ₘ^∞⟮I, I⟯ M)
    (hsub : Φ '' (f ⁻¹' Iic a) = g ⁻¹' Iic b)
    (hlevel : Φ '' (f ⁻¹' {a}) = g ⁻¹' {b}) :
    RegularEndMarked hf hg ha hb Φ := by
  let _ := manifoldSublevelChartedSpace I f a hf ha
  let _ := manifoldSublevelChartedSpace I g b hg hb
  let _ := manifoldLevelSetChartedSpace I f a hf ha
  let _ := manifoldLevelSetChartedSpace I g b hg hb
  let _ := manifoldLevelSetIsManifold I f a hf ha
  let _ := manifoldLevelSetIsManifold I g b hg hb
  have hs (x : M) (hx : f x ≤ a) : g (Φ x) ≤ b := hsub.subset ⟨x, hx, rfl⟩
  have hsi (y : M) (hy : g y ≤ b) : f (Φ.symm y) ≤ a :=
    mapsTo_inverse_of_image_eq Φ.toEquiv hsub hy
  have hl (x : M) (hx : f x = a) : g (Φ x) = b := hlevel.subset ⟨x, hx, rfl⟩
  have hli (y : M) (hy : g y = b) : f (Φ.symm y) = a :=
    mapsTo_inverse_of_image_eq Φ.toEquiv hlevel hy
  have ht (x : M) (hx : f x < a) : g (Φ x) < b := by
    refine lt_of_le_of_ne (hs x hx.le) fun h => hx.ne ?_
    simpa only [Φ.symm_apply_apply] using hli (Φ x) h
  have hti (y : M) (hy : g y < b) : f (Φ.symm y) < a := by
    refine lt_of_le_of_ne (hsi y hy.le) fun h => hy.ne ?_
    simpa only [Φ.apply_symm_apply] using hl (Φ.symm y) h
  let s : SublevelSpace f a ≃ₘ^∞⟮J, J⟯ SublevelSpace g b :=
    { toEquiv :=
        { toFun := fun x => ⟨Φ x.val, hs x.val x.property⟩
          invFun := fun y => ⟨Φ.symm y.val, hsi y.val y.property⟩
          left_inv := fun x => Subtype.ext (Φ.symm_apply_apply x.val)
          right_inv := fun y => Subtype.ext (Φ.apply_symm_apply y.val) }
      contMDiff_toFun := contMDiff_manifoldSublevelMap I f g a b hf hg ha hb
        Φ Φ.contMDiff hs hl ht
      contMDiff_invFun := contMDiff_manifoldSublevelMap I g f b a hg hf hb ha
        Φ.symm Φ.symm.contMDiff hsi hli hti }
  let l : LevelSetSpace f a ≃ₘ^∞⟮K, K⟯ LevelSetSpace g b :=
    { toEquiv :=
        { toFun := fun x => ⟨Φ x.val, hl x.val x.property⟩
          invFun := fun y => ⟨Φ.symm y.val, hli y.val y.property⟩
          left_inv := fun x => Subtype.ext (Φ.symm_apply_apply x.val)
          right_inv := fun y => Subtype.ext (Φ.apply_symm_apply y.val) }
      contMDiff_toFun := contMDiff_levelSet_factor I g b hg hb
        (fun x : LevelSetSpace f a => Φ x.val)
        (Φ.contMDiff.comp (contMDiff_levelSetInclusion I f a hf ha)) (fun x => hl x.val x.property)
      contMDiff_invFun := contMDiff_levelSet_factor I f a hf ha
        (fun y : LevelSetSpace g b => Φ.symm y.val)
        (Φ.symm.contMDiff.comp (contMDiff_levelSetInclusion I g b hg hb)) (fun y => hli y.val y.property) }
  exact ⟨s, l, fun _ => rfl, fun _ => rfl, fun _ => rfl, fun _ => rfl,
    fun _ => rfl, fun _ => rfl, contMDiff_levelSetSublevelInclusion f a hf ha,
    contMDiff_levelSetSublevelInclusion g b hg hb⟩

/-- Apply the checked boundary restriction to the full tube. At each original
    parameter the new point is the value of the same ambient transport, and
    its inclusion in the sublevel commutes with the body restriction. -/
theorem RegularEndMarked.exists_tubeTransport
    {hf : ContMDiff I 𝓘(ℝ, ℝ) ∞ f} {hg : ContMDiff I 𝓘(ℝ, ℝ) ∞ g}
    {ha : ∀ x, f x = a → ¬ IsCriticalPointAt I f x}
    {hb : ∀ x, g x = b → ¬ IsCriticalPointAt I g x}
    {Φ : M ≃ₘ^∞⟮I, I⟯ M} (P : RegularEndMarked hf hg ha hb Φ)
    {E L A : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [TopologicalSpace L]
    [TopologicalSpace A] [ChartedSpace L A] {IA : ModelWithCorners ℝ E L}
    (u : A → LevelSetSpace f a)
    (hu : letI := manifoldLevelSetChartedSpace I f a hf ha; ContMDiff IA K ∞ u) :
    letI := manifoldSublevelChartedSpace I f a hf ha
    letI := manifoldSublevelChartedSpace I g b hg hb
    letI := manifoldLevelSetChartedSpace I g b hg hb
    ∃ (s : SublevelSpace f a ≃ₘ^∞⟮J, J⟯ SublevelSpace g b) (v : A → LevelSetSpace g b),
      ContMDiff IA K ∞ v ∧
      (∀ z, (v z).val = Φ (u z).val) ∧
      (∀ z, s (regularEndLevelInclusion f a (u z)) = regularEndLevelInclusion g b (v z)) ∧
      (Topology.IsClosedEmbedding u → Topology.IsClosedEmbedding v) := by
  let _ := manifoldSublevelChartedSpace I f a hf ha
  let _ := manifoldSublevelChartedSpace I g b hg hb
  let _ := manifoldLevelSetChartedSpace I f a hf ha
  let _ := manifoldLevelSetChartedSpace I g b hg hb
  obtain ⟨s, l, _, _, hl, _, hc, _, _, _⟩ := P
  exact ⟨s, l ∘ u, l.contMDiff.comp hu, fun z => hl (u z), fun z => hc (u z),
    fun h => l.toHomeomorph.isClosedEmbedding.comp h⟩

/-- A compact regular band supplies the ambient flow and both of its marked
    restrictions on the same source. -/
theorem exists_regularBandEndMarked [T2Space M] [SigmaCompactSpace M]
    (hf : ContMDiff I 𝓘(ℝ, ℝ) ∞ f) (hab : a ≤ b)
    (hc : IsCompact (f ⁻¹' Icc a b))
    (hr : ∀ x ∈ f ⁻¹' Icc a b, ¬ IsCriticalPointAt I f x) :
    ∃ Φ : M ≃ₘ^∞⟮I, I⟯ M, RegularEndMarked hf hf
      (fun x hx => hr x (show f x ∈ Icc a b from hx.symm ▸ ⟨le_rfl, hab⟩))
      (fun x hx => hr x (show f x ∈ Icc a b from hx.symm ▸ ⟨hab, le_rfl⟩)) Φ := by
  obtain ⟨_, Φ, _, _, _, _, ⟨_, hsub, _⟩, hl, _, hli, _⟩ :=
    no_critical_value_transport f hf hab hc hr
  refine ⟨Φ, regularEndMarked_of_image_eq hf hf _ _ Φ hsub ?_⟩
  apply Subset.antisymm
  · rintro _ ⟨x, hx, rfl⟩
    exact hl x hx
  · intro y hy
    exact ⟨Φ.symm y, hli y hy, Φ.apply_symm_apply y⟩

end

end SmoothPoincare
