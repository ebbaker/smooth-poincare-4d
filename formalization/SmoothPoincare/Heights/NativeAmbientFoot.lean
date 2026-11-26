import DifferentialGeometry.Topology.Manifold.OpenSubtypeDiffeomorph
import SmoothPoincare.Heights.AmbientFootMotion
import SmoothPoincare.Heights.NativeHeightCollar
import SmoothPoincare.Heights.FootOrientationChoice

/-! # Ambient normalization of a selected native Morse foot -/

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

/-- Restrict the signed height collar to the open component carrying this
native foot and express its tangential coordinates in the ball-isotopy model. -/
theorem exists_footComponentHeightCollar (b : CellBoundary 1) :
    letI := D.footLevelEuclideanCharts
    ∃ r > (0 : ℝ), ∃ χ : PartialDiffeomorph (ThreeModel.prod 𝓘(ℝ, ℝ)) J
        (D.footComponent b × ℝ) M ∞,
      χ.source = {q | q.2 ∈ Ioo (-r) r} ∧
      (∀ x : D.footComponent b, χ (x,0) = x.val.val) ∧
      (∀ q ∈ χ.source, f (χ q) = c + q.2) := by
  let := manifoldLevelSetChartedSpace J f c hf D.lower_regular
  obtain ⟨r,hr,F,hS,-,h0,hh,-⟩ := exists_nativeSignedHeightCollar hf D.lower_regular
    (D.footPartialDiffeomorph b 0)
  let E := (PiLp.continuousLinearEquiv 2 ℝ (fun _ : Fin 3 => ℝ)).symm
  let := D.footLevelEuclideanCharts
  let d : L ≃ₘ^∞⟮ThreeModel,K⟯ L :=
    { toEquiv := Equiv.refl L
      contMDiff_toFun := (contMDiff_chartedSpaceTransHomeomorph_source_iff K ThreeModel
        E.toHomeomorph E (fun _ => rfl) K).2 contMDiff_id
      contMDiff_invFun := (contMDiff_chartedSpaceTransHomeomorph_iff K ThreeModel
        E.toHomeomorph E (fun _ => rfl) K).2 contMDiff_id }
  let B := D.footComponent b
  have hB : Nonempty B := ⟨⟨D.footEuclideanChart b 0,mem_connectedComponent⟩⟩
  let incl := (openSubtypePartialDiffeomorph ThreeModel B hB).trans d.toPartialDiffeomorph
  let times := (Diffeomorph.refl 𝓘(ℝ, ℝ) ℝ ∞).toPartialDiffeomorph
  let χ := (DifferentialGeometry.Topology.PartialDiffeomorph.prod incl times).trans F
  refine ⟨r,hr,χ,?_,fun x => h0 x.val,fun q hq => hh (q.1.val,q.2) hq.2⟩
  ext q
  change (((q.1 ∈ Set.univ ∧ _ ∈ Set.univ) ∧ q.2 ∈ Set.univ) ∧ (q.1.val,q.2) ∈ F.source) ↔ _
  rw [hS]
  simp

/-- A native foot is normalized in the original ambient four-manifold by
a single diffeomorphism. It preserves height everywhere, fixes all protected
tubes in both directions, and maps every native foot point to the chosen
model point with the same recorded parity. -/
theorem exists_ambientNativeFootNormalization {ι : Type*} [Finite ι] (b : CellBoundary 1) :
    letI := D.footLevelEuclideanCharts
    letI := D.footComponent_isManifold b
    ∀ (o : ManifoldOrientation ThreeModel (D.footComponent b) 3)
      (model : OrientedBallEmbedding (D.footComponent b) o)
      (feet : ι → OrientedBallEmbedding (D.footComponent b) o),
      (∀ i j, i ≠ j → Disjoint ((feet i).chart '' Metric.closedBall 0 1)
        ((feet j).chart '' Metric.closedBall 0 1)) →
      (∀ i, Disjoint (D.footComponentChart b '' Metric.closedBall 0 1)
        ((feet i).chart '' Metric.closedBall 0 1)) →
      (∀ i, Disjoint (model.chart '' Metric.closedBall 0 1)
        ((feet i).chart '' Metric.closedBall 0 1)) →
      ∃ (A : ThreeSpace ≃ₗᵢ[ℝ] ThreeSpace) (r : ℝ)
        (χ : PartialDiffeomorph (ThreeModel.prod 𝓘(ℝ, ℝ)) J (D.footComponent b × ℝ) M ∞)
        (F : M ≃ₘ^∞⟮J,J⟯ M) (S : Set M),
        (A = LinearIsometryEquiv.refl ℝ ThreeSpace ∨ A = LinearIsometryEquiv.neg ℝ) ∧
        0 < r ∧ χ.source = {q | q.2 ∈ Ioo (-r) r} ∧
        (∀ x : D.footComponent b, χ (x,0) = x.val.val) ∧
        (∀ q ∈ χ.source, f (χ q) = c + q.2) ∧
        IsCompact S ∧ S ⊆ χ.target ∧ (∀ y ∉ S, F y = y ∧ F.symm y = y) ∧
        (∀ y, f (F y) = f y ∧ f (F.symm y) = f y) ∧
        (∀ (z : ClosedCell 3) (t : ℝ), |t| ≤ r/3 →
          F (χ (D.footComponentPoint b z,t)) = χ (model.chart (A z.val),t) ∧
          F.symm (χ (model.chart (A z.val),t)) = χ (D.footComponentPoint b z,t)) ∧
        ∀ i (z : ClosedCell 3) t, t ∈ Ioo (-r) r →
          F (χ ((feet i).chart z.val,t)) = χ ((feet i).chart z.val,t) ∧
          F.symm (χ ((feet i).chart z.val,t)) = χ ((feet i).chart z.val,t) := by
  let := D.footLevelEuclideanCharts
  let := D.footComponent_isManifold b
  let := D.footComponent_connectedSpace b
  intro o model feet hd ha hm
  obtain ⟨A,e,hA,he,hImg⟩ := D.exists_orientedNativeFootComponentChart b o
  obtain ⟨T,hT⟩ := exists_relativeFootLevelIsotopy_awayFromFiniteFeet o e model feet hd
    (fun i => hImg.symm ▸ ha i) hm
  obtain ⟨r,hr,χ,hχ,hχ0,hχh⟩ := D.exists_footComponentHeightCollar b
  have ha' : 0 < r/3 := by linarith
  have hab : r/3 < 2*r/3 := by linarith
  have hbr : 2*r/3 < r := by linarith
  obtain ⟨F,hcoord,-,hSc,hSs,hfix,hheight⟩ := T.exists_ambientSignedCollarDiffeomorph χ ha' hab hbr hχ
  refine ⟨A,r,χ,F,_,hA,hr,hχ,hχ0,hχh,hSc,hSs,hfix,hheight f c hχh,?_,?_⟩
  · intro z t ht
    have hz : A z.val ∈ Metric.closedBall 0 1 := by
      simpa [Metric.mem_closedBall,dist_zero_right] using z.property
    have hmz := hT _ hz
    rw [he z] at hmz
    have hback := congrArg (fun y => (T.isotopy 1).symm y) hmz
    rw [Diffeomorph.symm_apply_apply] at hback
    have htr := abs_lt.mp (ht.trans_lt (hab.trans hbr))
    have hs (v : D.footComponent b) : (v,t) ∈ χ.source := hχ ▸ htr
    rw [(hcoord _ (hs _)).1,(hcoord _ (hs _)).2,
      (T.signedCollarDiffeomorph_eq_endpoint ha' hab (p := (D.footComponentPoint b z,t)) ht).1,
      (T.signedCollarDiffeomorph_eq_endpoint ha' hab (p := (model.chart (A z.val),t)) ht).2]
    simp only [hmz,← hback,and_self]
  · intro i z t ht
    let v := (feet i).chart z.val
    have hz : z.val ∈ Metric.closedBall 0 1 := by
      simpa [Metric.mem_closedBall,dist_zero_right] using z.property
    have hv : v ∈ ⋃ j, (feet j).chart '' Metric.closedBall 0 1 := mem_iUnion.mpr ⟨i,z.val,hz,rfl⟩
    have hh := T.signedCollarDiffeomorph_fixes_protected (r/3) (2*r/3) (p := (v,t)) hv
    have hs : (v,t) ∈ χ.source := hχ ▸ ht
    exact ⟨(hcoord _ hs).1.trans (congrArg χ hh.1), (hcoord _ hs).2.trans (congrArg χ hh.2)⟩

end
end SmoothPoincare.IsolatedOneHandle
