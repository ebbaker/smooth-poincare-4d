import SmoothPoincare

/-! # Independent applications on a retained native rounded trace -/

open DifferentialGeometry.Topology DifferentialGeometry.Topology.Morse SmoothPoincare Set
open DifferentialGeometry.Topology.Morse.CellAttachment
open DifferentialGeometry.Topology.Morse.ManifoldCellAttachment
open scoped ContDiff Manifold

namespace RetainedRoundedReadback

#check @IsolatedOneHandle.exists_retainedRoundedTrace
#print axioms IsolatedOneHandle.exists_retainedRoundedTrace
#check @IsolatedOneHandle.RetainedRoundedTrace.inverse
#print axioms IsolatedOneHandle.RetainedRoundedTrace.inverse
#check @IsolatedOneHandle.RetainedRoundedTrace.exists_originalTraceComparison
#print axioms IsolatedOneHandle.RetainedRoundedTrace.exists_originalTraceComparison

variable {H M : Type} [TopologicalSpace H] [TopologicalSpace M] [ChartedSpace H M]
  {J : ModelWithCorners ℝ (MorseModel 4) H} [J.Boundaryless] [IsManifold J ∞ M]
  {f : M → ℝ} {hf : ContMDiff J 𝓘(ℝ, ℝ) ∞ f} {p : M} {lo hi : ℝ}
  (D : IsolatedOneHandle hf p lo hi) (C : IsolatedOneHandle.RetainedRoundedTrace D)

local notation "idx" => (show (1 : ℕ) ≤ 4 by decide)
local notation "attach" => morseAttachingEmbedding idx (f p) D.ε D.r D.chart D.ε_pos D.attaching_radius
local notation "g" => morseRoundedFunction idx (f p) D.ε D.r C.δ C.R₀ C.R₁ D.chart

/-- The retained inverse returns both kinds of actual representative, and
their intermediate ambient locations are the exact retained representative
formulas with the original dimensions and parameters. -/
theorem both_representatives_round_trip :
    letI := D.traceCharts
    letI := manifoldSublevelChartedSpace J g (f p) C.smooth C.regular
    letI := manifoldSublevelChartedSpace J f (f p + D.ε) hf D.upper_regular
    ∀ (x : SublevelSpace f (f p - D.ε)) (d : Handle.StandardHandle 1 3),
      let z₀ := Handle.lower attach x
      let z₁ := Handle.cell attach d
      (C.toRounded z₀).val = morseCapRoundedLowerRound idx (f p) D.ε D.r C.δ C.θ D.chart x.val ∧
      (C.toRounded z₁).val = handleRoundEmbedding idx (f p) D.ε D.r C.δ C.θ D.chart d ∧
      C.toRounded.symm (C.toUpper.symm (D.traceDiffeomorph z₀)) = z₀ ∧
      C.toRounded.symm (C.toUpper.symm (D.traceDiffeomorph z₁)) = z₁ := by
  let _ := D.traceCharts
  let _ := manifoldSublevelChartedSpace J g (f p) C.smooth C.regular
  let _ := manifoldSublevelChartedSpace J f (f p + D.ε) hf D.upper_regular
  intro x d
  have h (z : Handle.AdjunctionSpace 1 3 attach) :
      C.toRounded.symm (C.toUpper.symm (D.traceDiffeomorph z)) = z :=
    (C.inverse (D.traceDiffeomorph z)).symm.trans (D.traceDiffeomorph.symm_apply_apply z)
  exact ⟨C.lower_point x, C.cell_point d, h _, h _⟩

#print axioms both_representatives_round_trip

/-- At a particular deep lower point each retained map fixes the ambient
point and the two inverse maps return its literal lower representative. -/
theorem deep_representative_kept_by_both_factors :
    letI := D.traceCharts
    letI := manifoldSublevelChartedSpace J g (f p) C.smooth C.regular
    letI := manifoldSublevelChartedSpace J f (f p + D.ε) hf D.upper_regular
    ∀ (x : M) (_hx : f x ≤ f p - D.ε - D.η) (hlo : f x ≤ f p - D.ε)
      (hhi : f x ≤ f p + D.ε),
      let z := Handle.lower attach ⟨x,hlo⟩
      (C.toRounded z).val = x ∧ (C.toUpper (C.toRounded z)).val = x ∧
        C.toRounded.symm (C.toUpper.symm ⟨x,hhi⟩) = z := by
  let _ := D.traceCharts
  let _ := manifoldSublevelChartedSpace J g (f p) C.smooth C.regular
  let _ := manifoldSublevelChartedSpace J f (f p + D.ε) hf D.upper_regular
  intro x hx hlo hhi
  let z := Handle.lower attach ⟨x,hlo⟩
  have hround : (C.toRounded z).val = x := (C.toRounded_deep x hx hlo).1
  have hupper : (C.toUpper (C.toRounded z)).val = x := by
    rw [← C.factor]
    exact D.fixes_deep_lower x hx hlo
  have he : D.traceDiffeomorph z = ⟨x,hhi⟩ :=
    Subtype.ext (D.fixes_deep_lower x hx hlo)
  exact ⟨hround, hupper, (C.inverse ⟨x,hhi⟩).symm.trans
    ((congrArg D.traceDiffeomorph.symm he.symm).trans (D.traceDiffeomorph.symm_apply_apply z))⟩

#print axioms deep_representative_kept_by_both_factors

/-- Comparing a supplied older trace with the retained rounded body transports
every parameter of a marked old-level tube through the same new level map.
The inverse recovers the original point of the older trace. -/
theorem older_trace_outgoing_tube_keeps_every_parameter
    (Dold : IsolatedOneHandle hf p lo hi)
    (Φ : M ≃ₘ^∞⟮J,J⟯ M) (P : RegularEndMarked hf hf D.upper_regular Dold.upper_regular Φ)
    {A : Type*} (u : A → LevelSetSpace f (f p + Dold.ε)) :
    letI := D.traceCharts
    letI := Dold.traceCharts
    letI := manifoldSublevelChartedSpace J g (f p) C.smooth C.regular
    letI := manifoldSublevelChartedSpace J f (f p + D.ε) hf D.upper_regular
    letI := manifoldSublevelChartedSpace J f (f p + Dold.ε) hf Dold.upper_regular
    letI := manifoldLevelSetChartedSpace J f (f p + D.ε) hf D.upper_regular
    letI := manifoldLevelSetChartedSpace J f (f p + Dold.ε) hf Dold.upper_regular
    let K := morseModelWithCornersHalfSpace 3
    let I := 𝓘(ℝ, MorseModel 3)
    ∃ (l : LevelSetSpace f (f p + D.ε) ≃ₘ^∞⟮I,I⟯ LevelSetSpace f (f p + Dold.ε))
      (F : Handle.AdjunctionSpace 1 3 (morseAttachingEmbedding idx (f p) Dold.ε Dold.r
        Dold.chart Dold.ε_pos Dold.attaching_radius) ≃ₘ^∞⟮K,K⟯ SublevelSpace g (f p)),
      ∀ a,
        let oldMark := Dold.traceDiffeomorph.symm (regularEndLevelInclusion f (f p + Dold.ε) (u a))
        let newMark := C.toUpper.symm (regularEndLevelInclusion f (f p + D.ε) (l.symm (u a)))
        F oldMark = newMark ∧ F.symm newMark = oldMark := by
  let _ := D.traceCharts
  let _ := Dold.traceCharts
  let _ := manifoldSublevelChartedSpace J g (f p) C.smooth C.regular
  let _ := manifoldSublevelChartedSpace J f (f p + D.ε) hf D.upper_regular
  let _ := manifoldSublevelChartedSpace J f (f p + Dold.ε) hf Dold.upper_regular
  let _ := manifoldLevelSetChartedSpace J f (f p + D.ε) hf D.upper_regular
  let _ := manifoldLevelSetChartedSpace J f (f p + Dold.ε) hf Dold.upper_regular
  obtain ⟨_, l, F, _, _, _, _, _, _, _, _, _, _, _, hmark, hback, _, _⟩ :=
    IsolatedOneHandle.RetainedRoundedTrace.exists_originalTraceComparison Dold D C Φ P
  refine ⟨l, F, fun a => ⟨hmark (u a), ?_⟩⟩
  exact (hback (l.symm (u a))).trans (congrArg (fun y =>
    Dold.traceDiffeomorph.symm (regularEndLevelInclusion f (f p + Dold.ε) y))
    (l.apply_symm_apply (u a)))

#print axioms older_trace_outgoing_tube_keeps_every_parameter

section SignedCollar

#check @IsolatedOneHandle.RetainedRoundedTrace.outgoingLevel
#check @IsolatedOneHandle.RetainedRoundedTrace.outgoingLevel_inclusions
#check @IsolatedOneHandle.RetainedRoundedTrace.exists_outgoingLevelCollars_toNextCut
#print axioms IsolatedOneHandle.RetainedRoundedTrace.outgoingLevel
#print axioms IsolatedOneHandle.RetainedRoundedTrace.outgoingLevel_inclusions
#print axioms IsolatedOneHandle.RetainedRoundedTrace.exists_outgoingLevelCollars_toNextCut

local notation "K" => 𝓘(ℝ, MorseModel 3)
local notation "Kℝ" => ModelWithCorners.prod K 𝓘(ℝ, ℝ)
local notation "c" => f p + D.ε
local notation "Lᵣ" => LevelSetSpace g (f p)
local notation "L₀" => LevelSetSpace f c
local notation "L₁" => LevelSetSpace f hi
local notation "ιᵣ" => regularEndLevelInclusion g (f p)
local notation "ι₀" => regularEndLevelInclusion f c

/-- A whole supplied marked family keeps every signed parameter to the next
cut and back. The zero sections use the retained sublevel map and its inverse. -/
theorem exact_retained_signed_tube [T2Space M] [CompactSpace M]
    (hunique : ∀ x, f x ∈ Icc lo hi → IsCriticalPointAt J f x → x = p)
    {U : Type*} (u : U → Lᵣ) (v : U → L₀) :
    letI := manifoldLevelSetChartedSpace J g (f p) C.smooth C.regular
    letI := manifoldLevelSetChartedSpace J f c hf D.upper_regular
    letI := manifoldLevelSetChartedSpace J f hi hf (D.outgoingNextCut_regular hunique)
    letI := manifoldSublevelChartedSpace J g (f p) C.smooth C.regular
    letI := manifoldSublevelChartedSpace J f c hf D.upper_regular
    ∃ (w : ℝ) (A : PartialDiffeomorph Kℝ J (Lᵣ × ℝ) M ∞)
      (E : PartialDiffeomorph Kℝ J (L₁ × ℝ) M ∞)
      (l : L₀ ≃ₘ^∞⟮K,K⟯ L₁) (P Q : PartialDiffeomorph J J M M ∞),
      0 < w ∧ w ≤ D.ε / 2 ∧
      (∀ a, P (A (u a, 0)) = (C.toUpper (ιᵣ (u a))).val ∧
        P.symm (v a).val = (C.toUpper.symm (ι₀ (v a))).val) ∧
      ∀ a t, t ∈ Ioo (-w) w →
        A (u a,t) ∈ P.source ∧ E (l (C.outgoingLevel (u a)),t) ∈ Q.target ∧
        g (A (u a,t)) - f p = t ∧ f (E (l (C.outgoingLevel (u a)),t)) - hi = t ∧
        Q (P (A (u a,t))) = E (l (C.outgoingLevel (u a)),t) ∧
        P.symm (Q.symm (E (l (C.outgoingLevel (u a)),t))) = A (u a,t) := by
  let _ := manifoldLevelSetChartedSpace J g (f p) C.smooth C.regular
  let _ := manifoldLevelSetChartedSpace J f c hf D.upper_regular
  let _ := manifoldLevelSetChartedSpace J f hi hf (D.outgoingNextCut_regular hunique)
  let _ := manifoldSublevelChartedSpace J g (f p) C.smooth C.regular
  let _ := manifoldSublevelChartedSpace J f c hf D.upper_regular
  obtain ⟨w,A,B,E,Φ,l,P,Q,hw,hwε,_,_,_,hAs,_,hEs,_,_,_,hPs,_,_,hQt,hAz,hBz,_,hP,_,hroute⟩ :=
    C.exists_outgoingLevelCollars_toNextCut hunique
  refine ⟨w,A,E,l,P,Q,hw,hwε,?_,?_⟩
  · intro a
    exact ⟨(congrArg P (hAz (u a)).1).trans (hAz (u a)).2, (hBz (v a)).2.1⟩
  · intro a t ht
    have hsrc : (u a,t) ∈ A.source := hAs.symm ▸ ⟨mem_univ _,ht⟩
    have htgt : (l (C.outgoingLevel (u a)),t) ∈ E.source := hEs.symm ▸ ⟨mem_univ _,ht⟩
    obtain ⟨hforward,hback,hheight⟩ := hroute (u a) t ht
    exact ⟨hPs.symm ▸ A.map_source hsrc, hQt.symm ▸ E.map_source htgt,
      sub_eq_of_eq_add ((hP (u a) t ht).1.trans (add_comm _ _)),
      sub_eq_of_eq_add (hheight.trans (add_comm _ _)), hforward, hback⟩

#print axioms exact_retained_signed_tube

#check @IsolatedOneHandle.RetainedRoundedTrace.exists_twoSidedCollar_extending_toUpper
#print axioms IsolatedOneHandle.RetainedRoundedTrace.exists_twoSidedCollar_extending_toUpper

/-- The same retained body map extends the entire inward marked family for
a native source collar. Strictly inward source and target points are interior. -/
theorem exact_retained_inward_tube [T2Space M] [CompactSpace M]
    {U : Type*} (u : U → Lᵣ) :
    letI := manifoldLevelSetChartedSpace J g (f p) C.smooth C.regular
    letI := manifoldSublevelChartedSpace J g (f p) C.smooth C.regular
    letI := manifoldSublevelChartedSpace J f c hf D.upper_regular
    ∃ (w : ℝ) (A : PartialDiffeomorph Kℝ J (Lᵣ × ℝ) M ∞)
      (B : SmoothTwoSidedCollar K J (fun x : Lᵣ => (C.toUpper (ιᵣ x)).val)),
      0 < B.radius ∧ B.radius ≤ w ∧
      (∀ a, B.toFun (u a, ⟨0,neg_lt_zero.mpr B.radius_pos,B.radius_pos⟩) =
        (C.toUpper (ιᵣ (u a))).val) ∧
      ∀ a (s : symmetricOpenInterval B.radius), 0 ≤ s.val →
        ∃ (hx : g (A (u a,-s.val)) ≤ f p) (hy : f (B.toFun (u a,s)) ≤ c),
          g (A (u a,-s.val)) = f p - s.val ∧
          B.toFun (u a,s) = (C.toUpper ⟨A (u a,-s.val),hx⟩).val ∧
          (C.toUpper.symm ⟨B.toFun (u a,s),hy⟩).val = A (u a,-s.val) ∧
          (0 < s.val → f (B.toFun (u a,s)) < c) := by
  let _ := manifoldLevelSetChartedSpace J g (f p) C.smooth C.regular
  let _ := manifoldLevelSetChartedSpace J f c hf D.upper_regular
  let _ := manifoldSublevelChartedSpace J g (f p) C.smooth C.regular
  let _ := manifoldSublevelChartedSpace J f c hf D.upper_regular
  let _ := manifoldSublevelIsManifold J g (f p) C.smooth C.regular
  let _ := D.upper_isManifold
  obtain ⟨w,hw,A,hAs,_,hA0,hAh,_⟩ :=
    exists_nativeSignedHeightCollar C.smooth C.regular (C.outgoingLevel.symm D.outgoingAxisPoint)
  obtain ⟨B,hBw,hbody⟩ := C.exists_twoSidedCollar_extending_toUpper w hw A hAs hA0 hAh
  refine ⟨w,A,B,B.radius_pos,hBw,fun a => B.toFun_zero (u a),?_⟩
  intro a s hs
  have ha : (u a,-s.val) ∈ A.source := hAs.symm ▸
    ⟨neg_lt_neg (s.property.2.trans_le hBw), (neg_nonpos.mpr hs).trans_lt hw⟩
  have hheight := (hAh _ ha).trans (sub_eq_add_neg ..).symm
  obtain ⟨hx,hy,hfwd,hback⟩ := hbody (u a) s hs
  refine ⟨hx,hy,hheight,hfwd,hback,?_⟩
  intro hspos
  apply lt_of_le_of_ne hy
  intro heq
  let x : SublevelSpace g (f p) := ⟨A (u a,-s.val),hx⟩
  have hout : f (C.toUpper x).val = c := (congrArg f hfwd).symm.trans heq
  have hi := manifoldSublevel_isBoundaryPoint_iff J f c hf D.upper_regular (C.toUpper x)
  have hj := manifoldSublevel_isBoundaryPoint_iff J g (f p) C.smooth C.regular x
  have hzero : g x.val = f p := hj.mp
    (((C.toUpper.isLocalDiffeomorph x).isBoundaryPoint_iff (by simp)).mpr (hi.mpr hout))
  change g (A (u a,-s.val)) = f p at hzero
  linarith

#print axioms exact_retained_inward_tube

end SignedCollar

/-- Preserving height and both fixed sets in both directions does not
identify a strictly inward germ. The shear has support above the deep cut. -/
theorem smooth_shear_fixes_zero_and_deep_but_moves_inward :
    ∃ S : (ℝ × ℝ) ≃ₘ^∞⟮𝓘(ℝ,ℝ × ℝ),𝓘(ℝ,ℝ × ℝ)⟯ (ℝ × ℝ),
      (∀ q, (S q).2 = q.2 ∧ (S.symm q).2 = q.2) ∧
      (∀ q : ℝ × ℝ, q.2 = 0 ∨ q.2 ≤ -1 → S q = q ∧ S.symm q = q) ∧
      ∀ w > 0, ∃ t ∈ Ioo (-w) 0, S (0,t) ≠ (0,t) ∧ S.symm (0,t) ≠ (0,t) := by
  let h : ℝ → ℝ := fun t => t * Real.smoothTransition (2 * (t + 1))
  have hh : ContDiff ℝ ∞ h := contDiff_id.mul (Real.smoothTransition.contDiff.comp
    ((contDiff_const (c := (2 : ℝ))).mul (contDiff_id.add (contDiff_const (c := (1 : ℝ))))))
  let S : (ℝ × ℝ) ≃ₘ^∞⟮𝓘(ℝ,ℝ × ℝ),𝓘(ℝ,ℝ × ℝ)⟯ (ℝ × ℝ) :=
    { toFun := fun q => (q.1 + h q.2, q.2)
      invFun := fun q => (q.1 - h q.2, q.2)
      left_inv := fun q => Prod.ext (add_sub_cancel_right ..) rfl
      right_inv := fun q => Prod.ext (sub_add_cancel ..) rfl
      contMDiff_toFun := ((contDiff_fst.add (hh.comp contDiff_snd)).prodMk contDiff_snd).contMDiff
      contMDiff_invFun := ((contDiff_fst.sub (hh.comp contDiff_snd)).prodMk contDiff_snd).contMDiff }
  refine ⟨S,fun _ => ⟨rfl,rfl⟩,?_,?_⟩
  · intro q hq
    have hhq : h q.2 = 0 := by
      rcases hq with hq | hq
      · simp [h, hq]
      · exact mul_eq_zero_of_right _ (Real.smoothTransition.zero_of_nonpos (by linarith))
    constructor
    · exact Prod.ext (by change q.1 + h q.2 = q.1; rw [hhq,add_zero]) rfl
    · exact Prod.ext (by change q.1 - h q.2 = q.1; rw [hhq,sub_zero]) rfl
  · intro w hw
    let t := - min (w / 2) (1 / 4)
    have htw : -w < t := by have hle := min_le_left (w / 2) (1 / 4); unfold t; linarith
    have ht0 : t < 0 := neg_lt_zero.mpr (lt_min (half_pos hw) (by norm_num))
    have hq : 1 ≤ 2 * (t + 1) := by
      have hle : min (w / 2) (1 / 4) ≤ 1 / 4 := min_le_right ..
      unfold t
      linarith
    have hht : h t = t := by simp [h, Real.smoothTransition.one_of_one_le hq]
    refine ⟨t,⟨htw,ht0⟩,?_,?_⟩
    · intro e
      have he := congrArg Prod.fst e
      change 0 + h t = 0 at he
      linarith
    · intro e
      have he := congrArg Prod.fst e
      change 0 - h t = 0 at he
      linarith

#print axioms smooth_shear_fixes_zero_and_deep_but_moves_inward

/-- Fixing a full marked vertical tube can obstruct correction when its
strictly inward values disagree with the desired collar. -/
theorem protected_tube_can_obstruct_inward_correction :
    ∃ S : (ℝ × ℝ) ≃ₘ^∞⟮𝓘(ℝ,ℝ × ℝ),𝓘(ℝ,ℝ × ℝ)⟯ (ℝ × ℝ),
      ∀ (F : ℝ × ℝ → ℝ × ℝ), EqOn F id ({0} ×ˢ Icc (-1 : ℝ) 0) →
        ∀ w > 0, ¬ ∀ q : ℝ × ℝ, q.2 ∈ Ioo (-w) 0 → F q = S q := by
  obtain ⟨S,_,_,hmove⟩ := smooth_shear_fixes_zero_and_deep_but_moves_inward
  refine ⟨S,?_⟩
  intro F hfix w hw heq
  obtain ⟨t,ht,hne,_⟩ := hmove (min w 1) (lt_min hw zero_lt_one)
  have htin : t ∈ Ioo (-w) 0 :=
    ⟨lt_of_le_of_lt (neg_le_neg (min_le_left w 1)) ht.1, ht.2⟩
  have htdeep : -1 ≤ t := (neg_le_neg (min_le_right w 1)).trans ht.1.le
  have hfixed : F (0,t) = (0,t) := hfix ⟨rfl,htdeep,ht.2.le⟩
  exact hne ((heq (0,t) htin).symm.trans hfixed)

#print axioms protected_tube_can_obstruct_inward_correction

end RetainedRoundedReadback
