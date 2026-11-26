import SmoothPoincare.Heights.OutgoingEdgeTransport
import SmoothPoincare.Heights.AmbientFootMotion

/-! # Changing the marking of a stored trace by a relative outgoing isotopy -/

open DifferentialGeometry.Topology DifferentialGeometry.Topology.Morse Set
open scoped ContDiff Manifold

noncomputable section
namespace SmoothPoincare.IsolatedOneHandle

variable {H M : Type} [TopologicalSpace H] [TopologicalSpace M] [ChartedSpace H M]
  {J : ModelWithCorners ℝ (MorseModel 4) H} [J.Boundaryless] [IsManifold J ∞ M]
  {f : M → ℝ} {hf : ContMDiff J 𝓘(ℝ, ℝ) ∞ f} {p : M} {lo hi : ℝ}
  (D : IsolatedOneHandle hf p lo hi)

local notation "c" => f p + D.ε
local notation "Y" => SublevelSpace f c
local notation "K" => 𝓘(ℝ, MorseModel 3)
local notation "J₄" => morseModelWithCornersHalfSpace 3
local notation "L" => LevelSetSpace f c
local notation "upperCharts" => manifoldSublevelChartedSpace J f c hf D.upper_regular
local notation "levelCharts" => manifoldLevelSetChartedSpace J f c hf D.upper_regular

/-- Postcompose the stored trace with an actual upper-body diffeomorphism fixing
the required deep lower sublevel. The native chart, feet, trace atlas and all
handle parameters are retained. -/
abbrev withUpperMarking :
    letI := upperCharts
    (G : Y ≃ₘ^∞⟮J₄,J₄⟯ Y) → (∀ y : Y, f y.val ≤ f p - D.ε - D.η → G y = y) →
    IsolatedOneHandle hf p lo hi := by
  let := upperCharts
  let := D.traceCharts
  intro G hg
  exact { D with
    traceDiffeomorph := D.traceDiffeomorph.trans G
    fixes_deep_lower := by
      intro x hx hlow
      have hid := D.fixes_deep_lower x hx hlow
      change (G _).val = x
      rw [hg _ (hid.symm ▸ hx)]
      exact hid
    deep_lower_preimage := by
      intro x hx hu z hz
      have hgx := hg ⟨x,hu⟩ hx
      apply D.deep_lower_preimage x hx hu z
      exact G.injective (hz.trans hgx.symm) }

/-- The forward and inverse changes of coordinates refer to the same trace
representative and the very same upper sublevel. -/
theorem withUpperMarking_maps :
    letI := upperCharts
    letI := D.traceCharts
    ∀ (G : Y ≃ₘ^∞⟮J₄,J₄⟯ Y) (hg : ∀ y : Y, f y.val ≤ f p - D.ε - D.η → G y = y),
      (∀ z, (D.withUpperMarking G hg).traceDiffeomorph z = G (D.traceDiffeomorph z)) ∧
      (∀ y, (D.withUpperMarking G hg).traceDiffeomorph.symm y = D.traceDiffeomorph.symm (G.symm y)) := by
  intros; exact ⟨fun _ => rfl, fun _ => rfl⟩

/-- A marked point moved by the adjustment detects a different stored comparison
on an explicitly exhibited actual trace representative. -/
theorem withUpperMarking_moves :
    letI := upperCharts
    letI := D.traceCharts
    ∀ (G : Y ≃ₘ^∞⟮J₄,J₄⟯ Y) (hg : ∀ y : Y, f y.val ≤ f p - D.ε - D.η → G y = y)
      (y : Y), G y ≠ y →
      (D.withUpperMarking G hg).traceDiffeomorph (D.traceDiffeomorph.symm y) ≠ y := by
  let := upperCharts
  let := D.traceCharts
  intro G hg y hy
  simpa only [(D.withUpperMarking_maps G hg).1, D.traceDiffeomorph.apply_symm_apply] using hy

/-- Extend a supplied isotopy of the chosen outgoing level to the actual trace.
It is supported above the critical height. On the entire chosen signed collar
both ambient equations hold, including its reversed normal direction. -/
theorem exists_outgoingTraceAdjustment [T2Space M] [CompactSpace M] :
    letI := levelCharts
    letI := upperCharts
    ∀ {C : Set L} (A : SupportedLevelIsotopy K C)
      (Φ : PartialDiffeomorph (ModelWithCorners.prod K 𝓘(ℝ, ℝ)) J (L × ℝ) M ∞)
      {r a b : ℝ} (_ha : 0 < a) (_hab : a < b) (_hbr : b < r) (_hbε : b ≤ D.ε)
      (_hsrc : Φ.source = {z | z.2 ∈ Ioo (-r) r}) (_hheight : ∀ z ∈ Φ.source, f (Φ z) = c + z.2),
      ∃ (F : M ≃ₘ^∞⟮J,J⟯ M) (G : Y ≃ₘ^∞⟮J₄,J₄⟯ Y)
        (hg : ∀ y : Y, f y.val ≤ f p - D.ε - D.η → G y = y),
        (∀ z, ((D.withUpperMarking G hg).traceDiffeomorph z).val = F (D.traceDiffeomorph z).val) ∧
        (∀ y : Y, (G.symm y).val = F.symm y.val) ∧
        (∀ x, f (F x) = f x ∧ f (F.symm x) = f x) ∧
        (∀ x, f x < f p → F x = x ∧ F.symm x = x) ∧
        (∀ z ∈ Φ.source, F (Φ z) = Φ (A.signedCollarDiffeomorph a b z) ∧
          F.symm (Φ z) = Φ ((A.signedCollarDiffeomorph a b).symm z)) ∧
        (∀ x ∈ C, ∀ t ∈ Ioo (-r) r, F (Φ (x,t)) = Φ (x,t) ∧ F.symm (Φ (x,t)) = Φ (x,t)) := by
  let := levelCharts
  let := upperCharts
  intro C A Φ r a b ha hab hbr hbε hsrc hheight
  obtain ⟨F, hm, _, _, _, hfix, hH⟩ := A.exists_ambientSignedCollarDiffeomorph Φ ha hab hbr hsrc
  have hF := hH f c hheight
  have him (s : Set ℝ) : F '' (f ⁻¹' s) = f ⁻¹' s := by
    ext x
    constructor
    · rintro ⟨y,hy,rfl⟩
      simpa only [mem_preimage, (hF y).1] using hy
    · intro hx
      refine ⟨F.symm x, ?_, F.apply_symm_apply x⟩
      simpa only [mem_preimage, (hF x).2] using hx
  obtain ⟨G, _, hG, hGi, _⟩ := regularEndMarked_of_image_eq hf hf D.upper_regular D.upper_regular F
    (him (Iic c)) (him {c})
  have hbelow (x : M) (hx : f x < f p) : F x = x ∧ F.symm x = x := by
    apply hfix x
    rintro ⟨z,hz,rfl⟩
    have hs : z ∈ Φ.source := by
      rw [hsrc]
      exact ⟨by linarith [hz.2.1], by linarith [hz.2.2]⟩
    linarith [hheight z hs,hz.2.1]
  have hg (y : Y) (hy : f y.val ≤ f p - D.ε - D.η) : G y = y :=
    Subtype.ext ((hG y).trans (hbelow _ (by linarith [D.ε_pos,D.η_pos])).1)
  refine ⟨F,G,hg,fun z => hG (D.traceDiffeomorph z),hGi,hF,hbelow,hm,?_⟩
  intro x hx t ht
  have hn : x ∉ A.support := fun h => Set.disjoint_left.mp A.disjoint_support h hx
  have he := A.signedCollarDiffeomorph_fixes_off_support a b (p := (x,t)) hn
  have h := hm (x,t) (hsrc.symm ▸ ht)
  rw [he.1, he.2] at h
  exact h

end SmoothPoincare.IsolatedOneHandle
