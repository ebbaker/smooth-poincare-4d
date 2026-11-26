import SmoothPoincare.Heights.NativeAmbientFoot

/-! # Both native feet in one signed height collar -/

open DifferentialGeometry DifferentialGeometry.Manifold DifferentialGeometry.Topology
open DifferentialGeometry.Topology.Morse DifferentialGeometry.Topology.Morse.CellAttachment
open DifferentialGeometry.PDE.RicciFlow.Surgery.Topology Set
open scoped ContDiff Manifold Topology

namespace SmoothPoincare.IsolatedOneHandle

noncomputable section

variable {H M : Type} [TopologicalSpace H] [TopologicalSpace M] [ChartedSpace H M]
  {J : ModelWithCorners ℝ (MorseModel 4) H} [J.Boundaryless] [IsManifold J ∞ M]
  [T2Space M] [CompactSpace M]
  {f : M → ℝ} {hf : ContMDiff J 𝓘(ℝ, ℝ) ∞ f} {p : M} {lo hi : ℝ}
  (D : IsolatedOneHandle hf p lo hi)

local notation "c" => f p - D.ε
local notation "L" => LevelSetSpace f (f p - D.ε)
local notation "K" => 𝓘(ℝ, MorseModel 3)

/-- Two feet on distinct components of the native incoming level use the
same signed ambient height collar. The restricted targets are disjoint and
lie strictly below the handle's outgoing cut. -/
theorem exists_twoFootHeightCollars (b b' : CellBoundary 1)
    (hdisj : Disjoint (D.footComponent b : Set L) (D.footComponent b' : Set L)) :
    letI := manifoldLevelSetChartedSpace J f c hf D.lower_regular
    letI := D.footLevelEuclideanCharts
    ∃ r > (0 : ℝ), r ≤ D.ε / 2 ∧
    ∃ (F : PartialDiffeomorph (ModelWithCorners.prod K 𝓘(ℝ, ℝ)) J (L × ℝ) M ∞)
      (χ : PartialDiffeomorph (ThreeModel.prod 𝓘(ℝ, ℝ)) J (D.footComponent b × ℝ) M ∞)
      (ψ : PartialDiffeomorph (ThreeModel.prod 𝓘(ℝ, ℝ)) J (D.footComponent b' × ℝ) M ∞),
      F.source = {q | q.2 ∈ Ioo (-r) r} ∧ F.target = f ⁻¹' Ioo (c - r) (c + r) ∧
      χ.source = {q | q.2 ∈ Ioo (-r) r} ∧ ψ.source = {q | q.2 ∈ Ioo (-r) r} ∧
      Disjoint χ.target ψ.target ∧
      (∀ q, χ q = F (q.1.val, q.2)) ∧ (∀ q, ψ q = F (q.1.val, q.2)) ∧
      (∀ x : D.footComponent b, χ (x, 0) = x.val.val) ∧
      (∀ x : D.footComponent b', ψ (x, 0) = x.val.val) ∧
      (∀ q ∈ χ.source, f (χ q) = c + q.2) ∧
      (∀ q ∈ ψ.source, f (ψ q) = c + q.2) ∧
      (∀ y ∈ χ.target, ((χ.symm y).1.val, (χ.symm y).2) = F.symm y ∧
        (χ.symm y).2 = f y - c) ∧
      (∀ y ∈ ψ.target, ((ψ.symm y).1.val, (ψ.symm y).2) = F.symm y ∧
        (ψ.symm y).2 = f y - c) := by
  let := manifoldLevelSetChartedSpace J f c hf D.lower_regular
  obtain ⟨R, hR, G, hGS, hGT, hG0, hGh, hGi⟩ :=
    exists_nativeSignedHeightCollar hf D.lower_regular (D.footPartialDiffeomorph b 0)
  let r := min R (D.ε / 2)
  have hr : 0 < r := lt_min hR (half_pos D.ε_pos)
  have hrR : r ≤ R := min_le_left _ _
  let S : Set (L × ℝ) := {q | q.2 ∈ Ioo (-r) r}
  let F := DifferentialGeometry.Topology.PartialDiffeomorph.restrict G S
    (isOpen_Ioo.preimage continuous_snd)
  have hFS : F.source = S := by
    ext q
    change (q ∈ G.source ∧ q ∈ S) ↔ q ∈ S
    refine ⟨And.right, fun hq => ⟨?_, hq⟩⟩
    rw [hGS]
    exact ⟨(neg_le_neg hrR).trans_lt hq.1, hq.2.trans_le hrR⟩
  have hFT : F.target = f ⁻¹' Ioo (c - r) (c + r) := by
    ext y
    change (y ∈ G.target ∧ G.symm y ∈ S) ↔ f y ∈ Ioo (c - r) (c + r)
    constructor
    · rintro ⟨hy, hs⟩
      change (G.symm y).2 ∈ Ioo (-r) r at hs
      rw [hGi y hy] at hs
      exact ⟨by linarith [hs.1], by linarith [hs.2]⟩
    · intro hy
      have hz : y ∈ G.target := by
        rw [hGT]
        exact ⟨by linarith [hy.1], by linarith [hy.2]⟩
      refine ⟨hz, ?_⟩
      change (G.symm y).2 ∈ Ioo (-r) r
      rw [hGi y hz]
      exact ⟨by linarith [hy.1], by linarith [hy.2]⟩
  let E := (PiLp.continuousLinearEquiv 2 ℝ (fun _ : Fin 3 => ℝ)).symm
  let := D.footLevelEuclideanCharts
  let d : L ≃ₘ^∞⟮ThreeModel,K⟯ L :=
    { toEquiv := Equiv.refl L
      contMDiff_toFun := (contMDiff_chartedSpaceTransHomeomorph_source_iff K ThreeModel
        E.toHomeomorph E (fun _ => rfl) K).2 contMDiff_id
      contMDiff_invFun := (contMDiff_chartedSpaceTransHomeomorph_iff K ThreeModel
        E.toHomeomorph E (fun _ => rfl) K).2 contMDiff_id }
  have hB (a : CellBoundary 1) : Nonempty (D.footComponent a) :=
    ⟨⟨D.footEuclideanChart a 0, mem_connectedComponent⟩⟩
  let incl (a : CellBoundary 1) := openSubtypePartialDiffeomorph ThreeModel (D.footComponent a) (hB a)
  let times := (Diffeomorph.refl 𝓘(ℝ, ℝ) ℝ ∞).toPartialDiffeomorph
  let chart (a : CellBoundary 1) :=
    (DifferentialGeometry.Topology.PartialDiffeomorph.prod (incl a |>.trans d.toPartialDiffeomorph)
      times).trans F
  have hsource (a : CellBoundary 1) : (chart a).source = {q | q.2 ∈ Ioo (-r) r} := by
    ext q
    change (((q.1 ∈ Set.univ ∧ _ ∈ Set.univ) ∧ q.2 ∈ Set.univ) ∧
      (q.1.val, q.2) ∈ F.source) ↔ _
    rw [hFS]
    simp [S]
  have htarget (a : CellBoundary 1) (y : M) :
      y ∈ (chart a).target ↔ y ∈ F.target ∧ (F.symm y).1 ∈ D.footComponent a := by
    change (y ∈ F.target ∧ (((F.symm y).1 ∈ Set.univ ∧
      (F.symm y).1 ∈ (incl a).target) ∧ (F.symm y).2 ∈ Set.univ)) ↔ _
    simp [incl]
  have hheight (a : CellBoundary 1) (q : D.footComponent a × ℝ) (hq : q ∈ (chart a).source) :
      f (chart a q) = c + q.2 := by
    have hqF : (q.1.val, q.2) ∈ F.source := hq.2
    exact hGh _ hqF.1
  have hinv (a : CellBoundary 1) (y : M) (hy : y ∈ (chart a).target) :
      (((chart a).symm y).1.val, ((chart a).symm y).2) = F.symm y ∧
      ((chart a).symm y).2 = f y - c := by
    obtain ⟨hF, hA⟩ := (htarget a y).1 hy
    have he := openSubtypePartialDiffeomorph_symm_apply ThreeModel _ (hB a) hA
    constructor
    · apply Prod.ext
      · exact congrArg Subtype.val he
      · rfl
    · exact hGi _ hF.1
  refine ⟨r, hr, min_le_right _ _, F, chart b, chart b', hFS, hFT, hsource b, hsource b', ?_,
    fun _ => rfl, fun _ => rfl, fun x => hG0 x.val, fun x => hG0 x.val,
    hheight b, hheight b', hinv b, hinv b'⟩
  exact disjoint_left.mpr fun y hb hb' =>
    disjoint_left.mp hdisj ((htarget b y).1 hb).2 ((htarget b' y).1 hb').2

end
end SmoothPoincare.IsolatedOneHandle
