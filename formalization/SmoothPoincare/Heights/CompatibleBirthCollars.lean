import SmoothPoincare.Heights.RoundedEdgeBlock
import Mathlib.Analysis.Normed.Module.Ball.Pointwise

/-! # An open incoming collar pulled back through a whole birth chart -/

open DifferentialGeometry.Topology DifferentialGeometry.Topology.Morse Set Metric
open DifferentialGeometry.PDE.RicciFlow.Surgery.Topology
open scoped ContDiff Manifold Topology

namespace SmoothPoincare

noncomputable section

local notation "K" => ThreeModel.prod 𝓘(ℝ, ℝ)
local notation "S" => ThreeSpace × ℝ

variable {E E' : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [NormedAddCommGroup E'] [NormedSpace ℝ E']
  {H H' : Type*} [TopologicalSpace H] [TopologicalSpace H']
  {I : ModelWithCorners ℝ E H} {J : ModelWithCorners ℝ E' H'}
  {X M : Type*} [TopologicalSpace X] [TopologicalSpace M] [ChartedSpace H X] [ChartedSpace H' M]

/-- Pull back an actual open restriction and use the body chart on its
whole corresponding model domain. -/
private theorem exists_bodyOverlap_on
    {E₀ : Type*} [NormedAddCommGroup E₀] [NormedSpace ℝ E₀]
    {H₀ Z : Type*} [TopologicalSpace H₀] [TopologicalSpace Z] [ChartedSpace H₀ Z]
    {I₀ : ModelWithCorners ℝ E₀ H₀}
    (P : PartialDiffeomorph I J X M ∞) (A : PartialDiffeomorph I₀ J Z M ∞)
    (W : Set Z) (hOpen : IsOpen W) (hW : W ⊆ (A.trans P.symm).source) :
    ∃ (A' : PartialDiffeomorph I₀ J Z M ∞) (B : PartialDiffeomorph I₀ I Z X ∞)
      (T : PartialDiffeomorph I J X M ∞),
      A'.source = W ∧ B.source = A'.source ∧ A'.source ⊆ A.source ∧
      T.source = B.target ∧ T.target = A'.target ∧ A'.target ⊆ P.target ∧
      EqOn T P T.source ∧ EqOn T.symm P.symm T.target ∧
      (∀ q ∈ A'.source, A' q = A q ∧ B q = P.symm (A q) ∧ T (B q) = A q ∧
        T.symm (A q) = B q ∧ B.symm (T.symm (A q)) = q) := by
  let G := A.trans P.symm
  have hWA : W ⊆ A.source := fun _ hq => (hW hq).1
  let A' := DifferentialGeometry.Topology.PartialDiffeomorph.restrict A W hOpen
  let B := DifferentialGeometry.Topology.PartialDiffeomorph.restrict G W hOpen
  have hA' : A'.source = W := inter_eq_right.mpr hWA
  have hB : B.source = W := inter_eq_right.mpr hW
  have hBP : B.target ⊆ P.source := fun _ hy => hy.1.1
  let T := DifferentialGeometry.Topology.PartialDiffeomorph.restrict P B.target B.open_target
  have hTS : T.source = B.target := inter_eq_right.mpr hBP
  have hEq (q : Z) (hq : q ∈ W) : T (B q) = A q := P.right_inv (hW hq).2
  have hTT : T.target = A'.target := by
    have htImage : T '' T.source = T.target := T.toOpenPartialHomeomorph.image_source_eq_target
    have hbImage : B '' B.source = B.target := B.toOpenPartialHomeomorph.image_source_eq_target
    have haImage : A' '' A'.source = A'.target := A'.toOpenPartialHomeomorph.image_source_eq_target
    rw [← htImage, hTS, ← hbImage, hB, ← haImage, hA']
    change P '' (B '' W) = A '' W
    rw [image_image]
    exact image_congr hEq
  have hAP : A'.target ⊆ P.target := by
    intro y hy
    let q := A'.symm y
    have hq : q ∈ W := hA' ▸ A'.map_target hy
    have he : A q = y := A'.right_inv hy
    exact he ▸ (hW hq).2
  refine ⟨A', B, T, hA', hB.trans hA'.symm,
    hA'.symm ▸ hWA, hTS, hTT, hAP, fun _ _ => rfl, fun _ _ => rfl, ?_⟩
  intro q hq
  have hw : q ∈ W := hA' ▸ hq
  have hqB : q ∈ B.source := hB.symm ▸ hw
  have hqT : B q ∈ T.source := hTS.symm ▸ B.map_source hqB
  have he := hEq q hw
  have hi : T.symm (A q) = B q :=
    (congrArg T.symm he.symm).trans (T.left_inv hqT)
  exact ⟨rfl, rfl, he, hi, (congrArg B.symm hi).trans (B.left_inv hqB)⟩

/-- A full closed unit foot at the collar zero section has an open
two-sided neighborhood inside the target of a specified body chart. Choose
the model collar by pullback, so the resulting transition is the very same
body chart on the entire open overlap in both directions. -/
theorem exists_bufferedBirthCollarOverlap
    (P : PartialDiffeomorph I J X M ∞) (A : PartialDiffeomorph K J S M ∞)
    {ρ : ℝ} (hρ : 0 < ρ)
    (hcenter : ∀ z ∈ closedBall (0 : ThreeSpace) 1,
      (z, (0 : ℝ)) ∈ A.source ∧ A (z, 0) ∈ P.target) :
    ∃ (σ r : ℝ) (A' : PartialDiffeomorph K J S M ∞) (B : PartialDiffeomorph K I S X ∞)
      (T : PartialDiffeomorph I J X M ∞),
      1 < σ ∧ σ < 2 ∧ 0 < r ∧ r ≤ ρ ∧
      A'.source = ball 0 σ ×ˢ Ioo (-r) r ∧ B.source = A'.source ∧ A'.source ⊆ A.source ∧
      T.source = B.target ∧ T.target = A'.target ∧
      EqOn T P T.source ∧ EqOn T.symm P.symm T.target ∧
      (∀ q ∈ A'.source, A' q = A q ∧ B q = P.symm (A q) ∧ T (B q) = A q ∧
        T.symm (A q) = B q ∧ B.symm (T.symm (A q)) = q) := by
  let C := closedBall (0 : ThreeSpace) 1
  let G := A.trans P.symm
  have hGzero : C ×ˢ ({0} : Set ℝ) ⊆ G.source := by
    rintro ⟨z,t⟩ ⟨hz, ht⟩
    change t = 0 at ht
    subst t
    exact hcenter z hz
  obtain ⟨U, V, hU, hV, hCU, h0V, hUV⟩ :=
    generalized_tube_lemma (isCompact_closedBall (0 : ThreeSpace) 1)
      isCompact_singleton G.open_source hGzero
  obtain ⟨δ, hδ, hδU⟩ := (isCompact_closedBall (0 : ThreeSpace) 1).exists_thickening_subset_open hU hCU
  rw [thickening_closedBall hδ (by norm_num : (0 : ℝ) ≤ 1)] at hδU
  obtain ⟨η, hη, hηV⟩ := Metric.isOpen_iff.mp hV 0 (h0V (mem_singleton 0))
  let σ := min (δ + 1) (3 / 2)
  let r := min η ρ
  let W := ball (0 : ThreeSpace) σ ×ˢ Ioo (-r) r
  have hσ : 1 < σ := lt_min (by linarith) (by norm_num)
  have hσ' : σ < 2 := (min_le_right _ _).trans_lt (by norm_num)
  have hr : 0 < r := lt_min hη hρ
  have hW : W ⊆ G.source := by
    intro q hq
    apply hUV
    refine ⟨hδU (ball_subset_ball (min_le_left _ _) hq.1), hηV ?_⟩
    rw [mem_ball, Real.dist_eq, sub_zero, abs_lt]
    exact ⟨(neg_le_neg (min_le_left η ρ)).trans_lt hq.2.1,
      hq.2.2.trans_le (min_le_left η ρ)⟩
  obtain ⟨A', B, T, hA', hB, hAS, hTS, hTT, _, hTP, hTiP, he⟩ :=
    exists_bodyOverlap_on P A W (isOpen_ball.prod isOpen_Ioo) hW
  exact ⟨σ, r, A', B, T, hσ, hσ', hr, min_le_right _ _, hA', hB, hAS,
    hTS, hTT, hTP, hTiP, he⟩

namespace IsolatedOneHandle

variable {H₀ M₀ : Type} [TopologicalSpace H₀] [TopologicalSpace M₀] [ChartedSpace H₀ M₀]
  {J₀ : ModelWithCorners ℝ (MorseModel 4) H₀} [J₀.Boundaryless] [IsManifold J₀ ∞ M₀]
  {f : M₀ → ℝ} {hf : ContMDiff J₀ 𝓘(ℝ, ℝ) ∞ f} {p : M₀} {lo hi : ℝ}
  (D : IsolatedOneHandle hf p lo hi)
  {H' : Type*} [TopologicalSpace H'] {X' : Type*} [TopologicalSpace X'] [ChartedSpace H' X']
  {V : Type*} [NormedAddCommGroup V] [NormedSpace ℝ V] {I' : ModelWithCorners ℝ V H'}

local notation "c" => f p - D.ε

/-- The same open comparison for an actual native foot. The buffered
transverse radius goes strictly beyond the closed unit rim, and both charts
use exactly the signed native height on this overlap. -/
theorem exists_bufferedNativeFootBirthOverlap (b : CellBoundary 1) :
    letI := D.footLevelEuclideanCharts
    ∀ (χ : PartialDiffeomorph K J₀ (D.footComponent b × ℝ) M₀ ∞)
      (P : PartialDiffeomorph I' J₀ X' M₀ ∞) {ρ : ℝ}, 0 < ρ →
      χ.source = {q | q.2 ∈ Ioo (-ρ) ρ} →
      (∀ q ∈ χ.source, f (χ q) = c + q.2) →
      (∀ z : D.footComponent b, χ (z, 0) = z.val.val) →
      (∀ z : ClosedCell 3, (D.footComponentPoint b z).val.val ∈ P.target) →
    ∃ (σ r : ℝ) (A : PartialDiffeomorph K J₀ S M₀ ∞) (B : PartialDiffeomorph K I' S X' ∞)
      (T : PartialDiffeomorph I' J₀ X' M₀ ∞),
      1 < σ ∧ σ < 2 ∧ 0 < r ∧ r ≤ ρ ∧
      A.source = ball 0 σ ×ˢ Ioo (-r) r ∧ B.source = A.source ∧
      T.source = B.target ∧ T.target = A.target ∧
      EqOn T P T.source ∧ EqOn T.symm P.symm T.target ∧
      (∀ q ∈ A.source, A q = χ (D.footComponentChart b q.1, q.2) ∧
        f (A q) = c + q.2 ∧ f (P (B q)) = c + q.2 ∧ T (B q) = A q ∧
        T.symm (A q) = B q ∧ B.symm (T.symm (A q)) = q) := by
  let _ := D.footLevelEuclideanCharts
  intro χ P ρ hρ hχ hheight hzero hbody
  let e := D.footComponentChart b
  let eProd := DifferentialGeometry.Topology.PartialDiffeomorph.prod e
    (Diffeomorph.refl 𝓘(ℝ,ℝ) ℝ ∞).toPartialDiffeomorph
  let G := eProd.trans χ
  have hcenter (z : ThreeSpace) (hz : z ∈ closedBall 0 1) :
      (z,(0:ℝ)) ∈ G.source ∧ G (z,0) ∈ P.target := by
    have hs : z ∈ e.source := D.footComponentChart_closedBall_two_subset_source b
      (closedBall_subset_closedBall (by norm_num : (1:ℝ) ≤ 2) hz)
    let z₁ : ClosedCell 3 := ⟨z, mem_closedBall_zero_iff.mp hz⟩
    refine ⟨⟨⟨hs, mem_univ _⟩, ?_⟩, ?_⟩
    · change (e z, (0 : ℝ)) ∈ χ.source
      rw [hχ]
      exact ⟨by linarith, hρ⟩
    · change χ (D.footComponentPoint b z₁,0) ∈ P.target
      rw [hzero]
      exact hbody z₁
  obtain ⟨σ, r, A, B, T, hσ, hσ', hr, hrρ, hAS, hBS, hAG, hTS, hTT, hTP, hTiP, he⟩ :=
    exists_bufferedBirthCollarOverlap P G hρ hcenter
  refine ⟨σ, r, A, B, T, hσ, hσ', hr, hrρ, hAS, hBS, hTS, hTT, hTP, hTiP, ?_⟩
  intro q hq
  obtain ⟨hA, _, hTq, hTiq, hBiq⟩ := he q hq
  have hsrc : (e q.1,q.2) ∈ χ.source := (hAG hq).2
  have hAheight : f (A q) = c + q.2 := (congrArg f hA).trans (hheight _ hsrc)
  have hqT : B q ∈ T.source := hTS.symm ▸ B.map_source (hBS.symm ▸ hq)
  have hBheight : f (P (B q)) = c + q.2 :=
    (congrArg f ((hTP hqT).symm.trans hTq)).trans (hheight _ hsrc)
  exact ⟨hA, hAheight, hBheight, hTq.trans hA.symm, (congrArg T.symm hA).trans hTiq,
    (congrArg (fun x => B.symm (T.symm x)) hA).trans hBiq⟩

local notation "U₁" => EuclideanSpace ℝ (Fin 1)
local notation "V₃" => EuclideanSpace ℝ (Fin 3)
local notation "W₄" => U₁ × V₃

/-- Pull back the actual four-dimensional block itself through the chosen
body chart. The exact model and actual open patches include a full axial
neighborhood of the foot and an open transverse disk beyond its unit rim. -/
theorem exists_bufferedNativeBlockBirthOverlap (b : CellBoundary 1)
    (P : PartialDiffeomorph I' J₀ X' M₀ ∞)
    (hbody : ∀ z : ClosedCell 3, (D.footComponentPoint b z).val.val ∈ P.target) :
    ∃ (σ r : ℝ) (A : PartialDiffeomorph 𝓘(ℝ, W₄) J₀ W₄ M₀ ∞)
      (B : PartialDiffeomorph 𝓘(ℝ, W₄) I' W₄ X' ∞)
      (T : PartialDiffeomorph I' J₀ X' M₀ ∞),
      1 < σ ∧ σ < 2 ∧ 0 < r ∧
      A.source = ball b.val r ×ˢ ball 0 σ ∧ B.source = A.source ∧
      A.source ⊆ D.edgeBlockChart.source ∧ T.source = B.target ∧ T.target = A.target ∧
      T.target ⊆ P.target ∧
      EqOn T P T.source ∧ EqOn T.symm P.symm T.target ∧
      (∀ q ∈ A.source, A q = D.edgeBlockChart q ∧ B q = P.symm (D.edgeBlockChart q) ∧
        T (B q) = A q ∧ T.symm (A q) = B q ∧ B.symm (T.symm (A q)) = q ∧
        f (T (B q)) = c + (1 - ‖q.1‖ ^ 2) * (D.ε + D.r ^ 2 * ‖q.2‖ ^ 2 / 2)) := by
  let G := D.edgeBlockChart.trans P.symm
  have hcenter : ({b.val} : Set U₁) ×ˢ closedBall (0 : V₃) 1 ⊆ G.source := by
    rintro ⟨x,z⟩ ⟨hx,hz⟩
    have hxb : x = b.val := hx
    subst x
    let z₁ : ClosedCell 3 := ⟨z, mem_closedBall_zero_iff.mp hz⟩
    obtain ⟨hs,hz',_⟩ := D.edgeBlockChart_nativeFoot b z₁
    have hpt := congrArg Subtype.val (D.footComponentPoint_val b z₁)
    refine ⟨hs, ?_⟩
    change D.edgeBlockChart (b.val,z) ∈ P.target
    have he : D.edgeBlockChart (b.val,z) = (D.footComponentPoint b z₁).val.val :=
      hz'.trans hpt.symm
    rw [he]
    exact hbody z₁
  obtain ⟨U, V, hU, hV, hbU, hBV, hUV⟩ :=
    generalized_tube_lemma isCompact_singleton (isCompact_closedBall (0 : V₃) 1) G.open_source hcenter
  obtain ⟨r, hr, hrU⟩ := Metric.isOpen_iff.mp hU b.val (hbU (mem_singleton _))
  obtain ⟨δ, hδ, hδV⟩ := (isCompact_closedBall (0 : V₃) 1).exists_thickening_subset_open hV hBV
  rw [thickening_closedBall hδ (by norm_num : (0 : ℝ) ≤ 1)] at hδV
  let σ := min (δ + 1) (3 / 2)
  have hσ : 1 < σ := lt_min (by linarith) (by norm_num)
  have hσ' : σ < 2 := (min_le_right _ _).trans_lt (by norm_num)
  let W := ball b.val r ×ˢ ball (0 : V₃) σ
  have hW : W ⊆ G.source :=
    fun _ h => hUV ⟨hrU h.1, hδV (ball_subset_ball (min_le_left _ _) h.2)⟩
  obtain ⟨A,B,T,hAS,hBS,hAG,hTS,hTT,hAP,hTP,hTiP,he⟩ :=
    exists_bodyOverlap_on P D.edgeBlockChart W (isOpen_ball.prod isOpen_ball) hW
  refine ⟨σ,r,A,B,T,hσ,hσ',hr,hAS,hBS,hAG,hTS,hTT,hTT.symm ▸ hAP,hTP,hTiP,?_⟩
  intro q hq
  obtain ⟨hA,hB,hT,hTi,hBi⟩ := he q hq
  exact ⟨hA,hB,hT.trans hA.symm,(congrArg T.symm hA).trans hTi,
    (congrArg (fun x => B.symm (T.symm x)) hA).trans hBi,
    (congrArg f hT).trans (D.edgeBlockChart_height (hAG hq))⟩

end IsolatedOneHandle
end
end SmoothPoincare
