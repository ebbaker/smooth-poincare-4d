import SmoothPoincare.Heights.RetainedRoundedTrace
import DifferentialGeometry.Topology.Morse.RegularSublevelBoundary

/-! # The full outgoing level of the retained rounded comparison -/

open DifferentialGeometry.Topology DifferentialGeometry.Topology.Morse Set
open DifferentialGeometry.Topology.Morse.ManifoldCellAttachment
open scoped ContDiff Manifold Topology

namespace SmoothPoincare.IsolatedOneHandle

noncomputable section

variable {H M : Type} [TopologicalSpace H] [TopologicalSpace M] [ChartedSpace H M]
  {J : ModelWithCorners ℝ (MorseModel 4) H} [J.Boundaryless] [IsManifold J ∞ M]
  {f : M → ℝ} {hf : ContMDiff J 𝓘(ℝ, ℝ) ∞ f} {p : M} {lo hi : ℝ}
  {D : IsolatedOneHandle hf p lo hi} (C : RetainedRoundedTrace D)

local notation "I₄" => morseModelWithCornersHalfSpace 3
local notation "K" => 𝓘(ℝ, MorseModel 3)
local notation "Kℝ" => ModelWithCorners.prod K 𝓘(ℝ, ℝ)
local notation "hk₁" => (show (1 : ℕ) ≤ 4 by decide)
local notation "g" => morseRoundedFunction hk₁ (f p) D.ε D.r C.δ C.R₀ C.R₁ D.chart
local notation "c" => f p + D.ε
local notation "Lᵣ" => LevelSetSpace g (f p)
local notation "L₀" => LevelSetSpace f c
local notation "L₁" => LevelSetSpace f hi
local notation "ιᵣ" => regularEndLevelInclusion g (f p)
local notation "ι₀" => regularEndLevelInclusion f c
local notation "strip(" r ")" => Ioo (-r) r
local notation "band(" h "," a "," r ")" => h ⁻¹' Ioo (a - r) (a + r)

/-- Restrict the actual retained smooth sublevel comparison to its entire
outgoing boundary. The same retained inverse induces the inverse marking. -/
def RetainedRoundedTrace.outgoingLevel :
    letI := manifoldLevelSetChartedSpace J g (f p) C.smooth C.regular
    letI := manifoldLevelSetChartedSpace J f c hf D.upper_regular
    Lᵣ ≃ₘ^∞⟮K,K⟯ L₀ := by
  letI := manifoldSublevelChartedSpace J g (f p) C.smooth C.regular
  letI := manifoldSublevelChartedSpace J f c hf D.upper_regular
  letI := manifoldSublevelIsManifold J g (f p) C.smooth C.regular
  letI := D.upper_isManifold
  letI := manifoldLevelSetChartedSpace J g (f p) C.smooth C.regular
  letI := manifoldLevelSetChartedSpace J f c hf D.upper_regular
  letI := manifoldLevelSetIsManifold J g (f p) C.smooth C.regular
  letI := manifoldLevelSetIsManifold J f c hf D.upper_regular
  let E := C.toUpper
  have hfwd (x : Lᵣ) : f (E (ιᵣ x)).val = c := by
    apply (manifoldSublevel_isBoundaryPoint_iff J f c hf D.upper_regular _).mp
    apply ((E.isLocalDiffeomorph (ιᵣ x)).isBoundaryPoint_iff (by simp)).mp
    exact (manifoldSublevel_isBoundaryPoint_iff J g (f p) C.smooth C.regular _).mpr x.property
  have hbwd (y : L₀) : g (E.symm (ι₀ y)).val = f p := by
    apply (manifoldSublevel_isBoundaryPoint_iff J g (f p) C.smooth C.regular _).mp
    apply ((E.symm.isLocalDiffeomorph (ι₀ y)).isBoundaryPoint_iff (by simp)).mp
    exact (manifoldSublevel_isBoundaryPoint_iff J f c hf D.upper_regular _).mpr y.property
  let forward : Lᵣ → L₀ := fun x => ⟨(E (ιᵣ x)).val, hfwd x⟩
  let backward : L₀ → Lᵣ := fun y => ⟨(E.symm (ι₀ y)).val, hbwd y⟩
  refine
    { toFun := forward
      invFun := backward
      left_inv := ?_
      right_inv := ?_
      contMDiff_toFun := ?_
      contMDiff_invFun := ?_ }
  · intro x
    exact Subtype.ext (congrArg (fun z : SublevelSpace g (f p) => z.val) (E.symm_apply_apply (ιᵣ x)))
  · intro y
    exact Subtype.ext (congrArg (fun z : SublevelSpace f c => z.val) (E.apply_symm_apply (ι₀ y)))
  · exact contMDiff_levelSet_factor J f c hf D.upper_regular
      (fun x : Lᵣ => (E (ιᵣ x)).val)
      ((contMDiff_manifoldSublevelInclusion J f c hf D.upper_regular).comp
        (E.contMDiff.comp (contMDiff_levelSetSublevelInclusion g (f p) C.smooth C.regular))) hfwd
  · exact contMDiff_levelSet_factor J g (f p) C.smooth C.regular
      (fun y : L₀ => (E.symm (ι₀ y)).val)
      ((contMDiff_manifoldSublevelInclusion J g (f p) C.smooth C.regular).comp
        (E.symm.contMDiff.comp (contMDiff_levelSetSublevelInclusion f c hf D.upper_regular))) hbwd

/-- Both entire level inclusions commute with the retained sublevel map. -/
theorem RetainedRoundedTrace.outgoingLevel_inclusions :
    letI := manifoldLevelSetChartedSpace J g (f p) C.smooth C.regular
    letI := manifoldLevelSetChartedSpace J f c hf D.upper_regular
    letI := manifoldSublevelChartedSpace J g (f p) C.smooth C.regular
    letI := manifoldSublevelChartedSpace J f c hf D.upper_regular
    (∀ x : Lᵣ, ι₀ (C.outgoingLevel x) = C.toUpper (ιᵣ x)) ∧
      (∀ y : L₀, ιᵣ (C.outgoingLevel.symm y) = C.toUpper.symm (ι₀ y)) := ⟨fun _ => rfl, fun _ => rfl⟩

private def narrowCollar {L : Type*} [TopologicalSpace L] [ChartedSpace (MorseModel 3) L]
    (A : PartialDiffeomorph Kℝ J (L × ℝ) M ∞) (w : ℝ) :
    PartialDiffeomorph Kℝ J (L × ℝ) M ∞ :=
  DifferentialGeometry.Topology.PartialDiffeomorph.restrict A (univ ×ˢ strip(w))
    (isOpen_univ.prod isOpen_Ioo)

omit [J.Boundaryless] [IsManifold J ∞ M] in
private theorem narrowCollar_domains {L : Type*} [TopologicalSpace L] [ChartedSpace (MorseModel 3) L]
    (A : PartialDiffeomorph Kℝ J (L × ℝ) M ∞)
    {h : M → ℝ} {b ρ w : ℝ} (hw : w ≤ ρ)
    (hS : A.source = {q | q.2 ∈ strip(ρ)}) (hT : A.target = band(h,b,ρ))
    (hi : ∀ y ∈ A.target, (A.symm y).2 = h y - b) :
    (narrowCollar A w).source = univ ×ˢ strip(w) ∧ (narrowCollar A w).target = band(h,b,w) := by
  have hm := Ioo_subset_Ioo (neg_le_neg hw) hw
  refine ⟨inter_eq_right.mpr (fun q hq => hS.symm ▸ hm hq.2), ?_⟩
  ext x
  change (x ∈ A.target ∧ A.symm x ∈ univ ×ˢ strip(w)) ↔ _
  constructor
  · rintro ⟨hx, _, hstrip⟩
    rw [hi x hx] at hstrip
    exact ⟨by linarith [hstrip.1], by linarith [hstrip.2]⟩
  · intro hx
    have hxρ : x ∈ A.target := hT.symm ▸
      (Ioo_subset_Ioo (by linarith) (by linarith) hx)
    refine ⟨hxρ, mem_univ _, ?_⟩
    rw [hi x hxρ]
    exact ⟨by linarith [hx.1], by linarith [hx.2]⟩

set_option maxHeartbeats 900000 in
/-- Extend the exact retained boundary marking on three native signed
collars of a common width. The same regular map then carries the original
local outgoing cut to the next filtration cut. -/
theorem RetainedRoundedTrace.exists_outgoingLevelCollars_toNextCut [T2Space M] [CompactSpace M]
    (hunique : ∀ x, f x ∈ Icc lo hi → IsCriticalPointAt J f x → x = p) :
    letI := manifoldLevelSetChartedSpace J g (f p) C.smooth C.regular
    letI := manifoldLevelSetChartedSpace J f c hf D.upper_regular
    letI := manifoldLevelSetChartedSpace J f hi hf (D.outgoingNextCut_regular hunique)
    letI := manifoldSublevelChartedSpace J g (f p) C.smooth C.regular
    letI := manifoldSublevelChartedSpace J f c hf D.upper_regular
    ∃ (w : ℝ) (A : PartialDiffeomorph Kℝ J (Lᵣ × ℝ) M ∞)
      (B : PartialDiffeomorph Kℝ J (L₀ × ℝ) M ∞)
      (E : PartialDiffeomorph Kℝ J (L₁ × ℝ) M ∞)
      (Φ : M ≃ₘ^∞⟮J,J⟯ M) (l : L₀ ≃ₘ^∞⟮K,K⟯ L₁)
      (P Q : PartialDiffeomorph J J M M ∞),
      0 < w ∧ w ≤ D.ε / 2 ∧
      RegularEndMarked hf hf D.upper_regular (D.outgoingNextCut_regular hunique) Φ ∧
      (∀ x, (l x).val = Φ x.val) ∧ (∀ y, (l.symm y).val = Φ.symm y.val) ∧
      A.source = univ ×ˢ strip(w) ∧ B.source = univ ×ˢ strip(w) ∧ E.source = univ ×ˢ strip(w) ∧
      A.target = band(g,f p,w) ∧ B.target = band(f,c,w) ∧ E.target = band(f,hi,w) ∧
      P.source = A.target ∧ P.target = B.target ∧ Q.source = B.target ∧ Q.target = E.target ∧
      (∀ x : Lᵣ, A (x,0) = x.val ∧ P x.val = (C.toUpper (ιᵣ x)).val) ∧
      (∀ y : L₀, B (y,0) = y.val ∧ P.symm y.val = (C.toUpper.symm (ι₀ y)).val ∧
        Q y.val = Φ y.val) ∧
      (∀ z : L₁, E (z,0) = z.val ∧ Q.symm z.val = Φ.symm z.val) ∧
      (∀ x : Lᵣ, ∀ t ∈ strip(w),
        g (A (x,t)) = f p + t ∧
        P (A (x,t)) = B (C.outgoingLevel x,t) ∧
        P.symm (B (C.outgoingLevel x,t)) = A (x,t)) ∧
      (∀ y : L₀, ∀ t ∈ strip(w),
        f (B (y,t)) = c + t ∧ Q (B (y,t)) = E (l y,t) ∧ Q.symm (E (l y,t)) = B (y,t)) ∧
      (∀ x : Lᵣ, ∀ t ∈ strip(w),
        Q (P (A (x,t))) = E (l (C.outgoingLevel x),t) ∧
        P.symm (Q.symm (E (l (C.outgoingLevel x),t))) = A (x,t) ∧
        f (E (l (C.outgoingLevel x),t)) = hi + t) := by
  let _ := manifoldLevelSetChartedSpace J g (f p) C.smooth C.regular
  let _ := manifoldLevelSetChartedSpace J f c hf D.upper_regular
  let _ := manifoldLevelSetChartedSpace J f hi hf (D.outgoingNextCut_regular hunique)
  let _ := manifoldSublevelChartedSpace J g (f p) C.smooth C.regular
  let _ := manifoldSublevelChartedSpace J f c hf D.upper_regular
  let d := C.outgoingLevel
  obtain ⟨Φ, hmark⟩ := D.exists_outgoingMarkedComparison hunique
  have hm := hmark
  obtain ⟨_, l, _, _, hlf, hli, -, -, -, -⟩ := hmark
  obtain ⟨rA, hrA, A₀, hAS, hAT, hA0, hAh, hAi⟩ :=
    exists_nativeSignedHeightCollar C.smooth C.regular (d.symm D.outgoingAxisPoint)
  obtain ⟨rB, hrB, B₀, hBS, hBT, hB0, hBh, hBi⟩ := D.exists_outgoingSignedHeightCollar
  obtain ⟨rE, hrE, E₀, hES, hET, hE0, hEh, hEi⟩ :=
    exists_nativeSignedHeightCollar hf (D.outgoingNextCut_regular hunique) (l D.outgoingAxisPoint)
  let w := min (min rA rB) (min rE (D.ε / 2))
  have hw := lt_min (lt_min hrA hrB) (lt_min hrE (half_pos D.ε_pos))
  have hwA : w ≤ rA := (min_le_left ..).trans (min_le_left ..)
  have hwB : w ≤ rB := (min_le_left ..).trans (min_le_right ..)
  have hwE : w ≤ rE := (min_le_right ..).trans (min_le_left ..)
  have hwε : w ≤ D.ε / 2 := (min_le_right ..).trans (min_le_right ..)
  let A := narrowCollar A₀ w
  let B := narrowCollar B₀ w
  let E := narrowCollar E₀ w
  obtain ⟨hAs, hAt⟩ := narrowCollar_domains A₀ hwA hAS hAT hAi
  obtain ⟨hBs, hBt⟩ := narrowCollar_domains B₀ hwB hBS hBT hBi
  obtain ⟨hEs, hEt⟩ := narrowCollar_domains E₀ hwE hES hET hEi
  let P := markedEdgeSignedCollar A B d
  let Q := markedEdgeSignedCollar B E l
  obtain ⟨hPs, hPt, hPf, hPi⟩ := markedEdgeSignedCollar_eqOn A B d hAs hBs (fun _ => Iff.rfl)
  obtain ⟨hQs, hQt, hQf, hQi⟩ := markedEdgeSignedCollar_eqOn B E l hBs hEs (fun _ => Iff.rfl)
  have hP (x : Lᵣ) (t : ℝ) (ht : t ∈ strip(w)) :
      g (A (x,t)) = f p + t ∧ P (A (x,t)) = B (d x,t) ∧ P.symm (B (d x,t)) = A (x,t) := by
    have ha : (x,t) ∈ A.source := hAs.symm ▸ ⟨mem_univ _,ht⟩
    have hb : (d x,t) ∈ B.source := hBs.symm ▸ ⟨mem_univ _,ht⟩
    exact ⟨hAh _ ha.1, hPf _ ha,
      (hPi _ hb).trans (congrArg (fun z => A (z,t)) (d.symm_apply_apply x))⟩
  have hQ (y : L₀) (t : ℝ) (ht : t ∈ strip(w)) :
      f (B (y,t)) = c + t ∧ Q (B (y,t)) = E (l y,t) ∧ Q.symm (E (l y,t)) = B (y,t) := by
    have hb : (y,t) ∈ B.source := hBs.symm ▸ ⟨mem_univ _,ht⟩
    have he : (l y,t) ∈ E.source := hEs.symm ▸ ⟨mem_univ _,ht⟩
    exact ⟨hBh _ hb.1, hQf _ hb,
      (hQi _ he).trans (congrArg (fun z => B (z,t)) (l.symm_apply_apply y))⟩
  have hz : (0 : ℝ) ∈ strip(w) := ⟨neg_lt_zero.mpr hw,hw⟩
  refine ⟨w,A,B,E,Φ,l,P,Q,hw,hwε,hm,hlf,hli,hAs,hBs,hEs,hAt,hBt,hEt,hPs,hPt,hQs,hQt,?_,?_,?_,hP,hQ,?_⟩
  · intro x
    refine ⟨hA0 x, ?_⟩
    have hc := congrArg Subtype.val (C.outgoingLevel_inclusions.1 x)
    exact (congrArg P (hA0 x).symm).trans (((hP x 0 hz).2.1.trans (hB0 (d x))).trans hc)
  · intro y
    have hbs : (y, (0 : ℝ)) ∈ B.source := hBs.symm ▸ ⟨mem_univ _,hz⟩
    have hc := congrArg Subtype.val (C.outgoingLevel_inclusions.2 y)
    exact ⟨hB0 y, (congrArg P.symm (hB0 y).symm).trans
        ((hPi _ hbs).trans ((hA0 (d.symm y)).trans hc)),
      (congrArg Q (hB0 y).symm).trans (((hQ y 0 hz).2.1.trans (hE0 (l y))).trans (hlf y))⟩
  · intro z
    have hes : (z, (0 : ℝ)) ∈ E.source := hEs.symm ▸ ⟨mem_univ _,hz⟩
    exact ⟨hE0 z, (congrArg Q.symm (hE0 z).symm).trans ((hQi _ hes).trans ((hB0 (l.symm z)).trans (hli z)))⟩
  · intro x t ht
    have hqs := hQ (d x) t ht
    have hps := hP x t ht
    have he : (l (d x),t) ∈ E.source := hEs.symm ▸ ⟨mem_univ _,ht⟩
    exact ⟨(congrArg Q hps.2.1).trans hqs.2.1, (congrArg P.symm hqs.2.2).trans hps.2.2, hEh _ he.1⟩

end

end SmoothPoincare.IsolatedOneHandle
