import SmoothPoincare.Heights.RetainedInwardCollar

/-! # The actual outgoing collar transition on the open overlap -/

open DifferentialGeometry.Topology DifferentialGeometry.Topology.Morse Set
open DifferentialGeometry.Topology.Morse.ManifoldCellAttachment
open scoped ContDiff Manifold Topology

namespace SmoothPoincare.IsolatedOneHandle

noncomputable section

private theorem exists_strip_subset_of_zero {L : Type*} [TopologicalSpace L] [CompactSpace L]
    {U : Set (L × ℝ)} (hU : IsOpen U) (h₀ : ∀ x : L, (x, (0 : ℝ)) ∈ U) :
    ∃ r : ℝ, 0 < r ∧ (univ ×ˢ Ioo (-r) r) ⊆ U := by
  have hZ : (univ : Set L) ×ˢ ({0} : Set ℝ) ⊆ U := by
    intro ⟨x,t⟩ h
    have ht : t = 0 := h.2
    subst t
    exact h₀ x
  obtain ⟨V, W, _, hW, hV, h0, hVW⟩ :=
    generalized_tube_lemma isCompact_univ isCompact_singleton hU hZ
  obtain ⟨r, hr, hball⟩ := Metric.mem_nhds_iff.mp (hW.mem_nhds (h0 (mem_singleton 0)))
  rw [Real.ball_eq_Ioo, zero_sub, zero_add] at hball
  exact ⟨r, hr, (prod_mono hV hball).trans hVW⟩

/-- The strict inward half determines the strict outward half.  The zero
section exhausts the level, and points above the level approach each zero
point.  The proof uses openness and the intermediate value theorem. -/
private theorem collar_strictSides {L M : Type*} [TopologicalSpace L] [TopologicalSpace M]
    (A : OpenPartialHomeomorph (L × ℝ) M) {f : M → ℝ} (hf : Continuous f)
    {a r : ℝ} (hr : 0 < r) (hAs : A.source = univ ×ˢ Ioo (-r) r)
    (hzero : ∀ x : L, f (A (x,0)) = a)
    (hlevel : ∀ y : M, f y = a → ∃ x : L, A (x,0) = y)
    (hneg : ∀ q ∈ A.source, q.2 < 0 → f (A q) < a)
    (habove : ∀ x : L, ∀ U : Set M, IsOpen U → A (x,0) ∈ U →
      ∃ y ∈ U, a < f y) :
    ∀ q ∈ A.source, (f (A q) < a ↔ q.2 < 0) ∧ (a < f (A q) ↔ 0 < q.2) := by
  have hq (x : L) {t : ℝ} (ht : t ∈ Ioo (-r) r) : (x,t) ∈ A.source :=
    hAs.symm ▸ ⟨mem_univ _, ht⟩
  have h0 (x : L) : (x,(0 : ℝ)) ∈ A.source := hq x ⟨neg_lt_zero.mpr hr, hr⟩
  have hzero' (q : L × ℝ) (hq' : q ∈ A.source) (ha : f (A q) = a) : q.2 = 0 := by
    obtain ⟨x, hx⟩ := hlevel _ ha
    exact congrArg Prod.snd (A.injOn hq' (h0 x) hx.symm)
  have hc : ContinuousOn (f ∘ A) A.source := hf.comp_continuousOn A.continuousOn
  have hpos (x : L) (t : ℝ) (ht : t ∈ Ioo (-r) r) (ht0 : 0 < t) : a < f (A (x,t)) := by
    by_contra! hle
    have hlt : f (A (x,t)) < a :=
      lt_of_le_of_ne hle (fun h => ht0.ne' (hzero' (x,t) (hq x ht) h))
    let V := {y : L | f (A (y,t)) < a}
    have hV : IsOpen V := by
      apply isOpen_lt _ continuous_const
      apply continuous_iff_continuousAt.mpr
      intro y
      exact (hc.continuousAt (A.open_source.mem_nhds (hq y ht))).comp
        (continuous_id.prodMk continuous_const).continuousAt
    have hW : V ×ˢ Ioo (-r) t ⊆ A.source := by
      intro q h
      exact hq q.1 ⟨h.2.1, h.2.2.trans ht.2⟩
    obtain ⟨z, ⟨⟨y,u⟩, hyu, heq⟩, hz⟩ := habove x (A '' (V ×ˢ Ioo (-r) t))
      (A.isOpen_image_of_subset_source (hV.prod isOpen_Ioo) hW)
      ⟨(x,0), ⟨hlt, neg_lt_zero.mpr hr, ht0⟩, rfl⟩
    have hyt : f (A (y,t)) < a := hyu.1
    have hyu' : a < f (A (y,u)) := heq ▸ hz
    have hu : 0 < u := by
      by_contra! hn
      rcases eq_or_lt_of_le hn with he | hn
      · simp only [he, hzero y, lt_self_iff_false] at hyu'
      · exact (hneg (y,u) (hW hyu) hn).not_gt hyu'
    have hcont : ContinuousOn (fun v : ℝ => f (A (y,v))) (Icc u t) :=
      hc.comp (continuous_const.prodMk continuous_id).continuousOn
        (fun v hv => hq y ⟨hyu.2.1.trans_le hv.1, hv.2.trans_lt ht.2⟩)
    obtain ⟨v, hv, he⟩ := intermediate_value_Icc' hyu.2.2.le hcont ⟨hyt.le, hyu'.le⟩
    exact (hu.trans_le hv.1).ne' (hzero' (y,v)
      (hq y ⟨hyu.2.1.trans_le hv.1, hv.2.trans_lt ht.2⟩) he)
  intro q hq'
  have ht : q.2 ∈ Ioo (-r) r := (hAs ▸ hq').2
  refine ⟨⟨?_, hneg q hq'⟩, ⟨?_, hpos q.1 q.2 ht⟩⟩
  · intro h
    rcases lt_trichotomy q.2 0 with hn | he | hp
    · exact hn
    · exact ((show f (A q) = a by simpa only [he] using hzero q.1).not_lt h).elim
    · exact ((hpos q.1 q.2 ht hp).not_gt h).elim
  · intro h
    rcases lt_trichotomy q.2 0 with hn | he | hp
    · exact ((hneg q hq' hn).not_gt h).elim
    · exact ((show f (A q) = a by simpa only [he] using hzero q.1).not_gt h).elim
    · exact hp

variable {H M : Type} [TopologicalSpace H] [TopologicalSpace M] [ChartedSpace H M]
  {J : ModelWithCorners ℝ (MorseModel 4) H} [J.Boundaryless] [IsManifold J ∞ M]
  [T2Space M] [CompactSpace M]
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
local notation "ιᵣ" => regularEndLevelInclusion g (f p)
local notation "strip(" r ")" => ((univ : Set Lᵣ) ×ˢ Ioo (-r) r)

/-- Compare the actual two-sided extension of the retained map and the
calibrated outgoing product, both based on the retained rounded level.
The transition is the coordinate change on their exact open overlap.
A whole signed strip lies in both coordinate domains. The inverse
reparametrizes the retained collar by calibrated target height, while
the original collar agrees with the retained body map on its inward half. -/
set_option maxHeartbeats 1200000 in
theorem RetainedRoundedTrace.exists_outgoingCollarComparison
    (w : ℝ) (hw : 0 < w) :
    letI := manifoldLevelSetChartedSpace J g (f p) C.smooth C.regular
    letI := manifoldLevelSetChartedSpace J f c hf D.upper_regular
    letI := manifoldSublevelChartedSpace J g (f p) C.smooth C.regular
    letI := manifoldSublevelChartedSpace J f c hf D.upper_regular
    ∀ (A : PartialDiffeomorph Kℝ J (Lᵣ × ℝ) M ∞)
      (B : PartialDiffeomorph Kℝ J (L₀ × ℝ) M ∞),
      A.source = strip(w) →
      B.source = univ ×ˢ Ioo (-w) w →
      (∀ x : Lᵣ, A (x,0) = x.val) →
      (∀ y : L₀, B (y,0) = y.val) →
      (∀ q ∈ A.source, g (A q) = f p + q.2) →
      (∀ q ∈ B.source, f (B q) = c + q.2) →
      ∃ (r : ℝ) (F P : PartialDiffeomorph Kℝ J (Lᵣ × ℝ) M ∞)
        (T : PartialDiffeomorph Kℝ Kℝ (Lᵣ × ℝ) (Lᵣ × ℝ) ∞),
        0 < r ∧ r ≤ w ∧ F.source ⊆ A.source ∧ P.source = strip(w) ∧
        (∀ q ∈ P.source, P q = B (C.outgoingLevel q.1,q.2) ∧ f (P q) = c + q.2) ∧
        T = F.trans P.symm ∧ strip(r) ⊆ T.source ∩ T.target ∧
        (∀ x : Lᵣ, T (x,0) = (x,0) ∧ T.symm (x,0) = (x,0) ∧
          F (x,0) = (C.toUpper (ιᵣ x)).val) ∧
        (∀ q ∈ T.source, P (T q) = F q ∧ (T q).2 = f (F q) - c ∧
          ((T q).2 < 0 ↔ q.2 < 0) ∧ (0 < (T q).2 ↔ 0 < q.2)) ∧
        (∀ q ∈ T.target, F (T.symm q) = P q ∧ f (F (T.symm q)) = c + q.2 ∧
          ((T.symm q).2 < 0 ↔ q.2 < 0) ∧ (0 < (T.symm q).2 ↔ 0 < q.2)) ∧
        (∀ q ∈ F.source, q.2 ≤ 0 →
          ∃ (hx : g (A q) ≤ f p) (hy : f (F q) ≤ c),
            F q = (C.toUpper ⟨A q,hx⟩).val ∧
            (C.toUpper.symm ⟨F q,hy⟩).val = A q) := by
  letI := manifoldLevelSetChartedSpace J g (f p) C.smooth C.regular
  letI := manifoldLevelSetChartedSpace J f c hf D.upper_regular
  letI := manifoldSublevelChartedSpace J g (f p) C.smooth C.regular
  letI := manifoldSublevelChartedSpace J f c hf D.upper_regular
  letI := manifoldSublevelIsManifold J g (f p) C.smooth C.regular
  letI := D.upper_isManifold
  letI : CompactSpace Lᵣ := isCompact_iff_compactSpace.mp
    (isClosed_eq C.smooth.continuous continuous_const).isCompact
  letI : Nonempty Lᵣ := ⟨C.outgoingLevel.symm D.outgoingAxisPoint⟩
  intro A B hAs hBs hA0 hB0 hAh hBh
  obtain ⟨E, hEw, hE⟩ := C.exists_twoSidedCollar_extending_toUpper w hw A (by
    rw [hAs]
    ext q
    simp) hA0 hAh
  let F := E.reverse.toPartialDiffeomorph
  have hFs : F.source = strip(E.radius) := E.reverse.toPartialDiffeomorph_source
  have hFA : F.source ⊆ A.source := by
    rw [hFs, hAs]
    exact prod_mono_right (Ioo_subset_Ioo (neg_le_neg hEw) hEw)
  have hFneg (q : Lᵣ × ℝ) (hq : q ∈ F.source) (hqn : q.2 ≤ 0) :
      ∃ (hx : g (A q) ≤ f p) (hy : f (F q) ≤ c),
        F q = (C.toUpper ⟨A q,hx⟩).val ∧
        (C.toUpper.symm ⟨F q,hy⟩).val = A q := by
    have hqr : q.2 ∈ Ioo (-E.radius) E.radius := (hFs ▸ hq).2
    let t : symmetricOpenInterval E.radius :=
      ⟨-q.2, neg_lt_neg hqr.2, neg_lt.mp hqr.1⟩
    have ht : 0 ≤ t.val := neg_nonneg.mpr hqn
    have hEq : F q = E.toFun (q.1,t) := by
      calc
        F q = E.reverse.toFun (q.1,⟨q.2,hqr⟩) :=
          E.reverse.toPartialDiffeomorph_apply (q.1,⟨q.2,hqr⟩)
        _ = E.toFun (q.1,t) := rfl
    obtain ⟨hx,hy,hfwd,hbwd⟩ := hE q.1 t ht
    rw [hEq]
    simpa only [t, neg_neg] using Exists.intro hx (Exists.intro hy ⟨hfwd, hbwd⟩)
  have hF0s (x : Lᵣ) : (x,(0 : ℝ)) ∈ F.source := by
    rw [hFs]
    exact ⟨mem_univ _, neg_lt_zero.mpr E.radius_pos, E.radius_pos⟩
  have hF0 (x : Lᵣ) : F (x,0) = (C.toUpper (ιᵣ x)).val := by
    rw [show F (x,0) = E.reverse.toFun (x,⟨0, neg_lt_zero.mpr E.radius_pos,E.radius_pos⟩)
      from E.reverse.toPartialDiffeomorph_apply _]
    exact E.reverse.toFun_zero x
  have hF0d (x : Lᵣ) : F (x,0) = (C.outgoingLevel x).val :=
    (hF0 x).trans (congrArg Subtype.val (C.outgoingLevel_inclusions.1 x)).symm
  have hFstrict (q : Lᵣ × ℝ) (hq : q ∈ F.source) (ht : q.2 < 0) : f (F q) < c := by
    obtain ⟨hx, hy, hF, _⟩ := hFneg q hq ht.le
    have hS : g (A q) < f p := by rw [hAh q (hFA hq)]; linarith
    have hs := (manifoldSublevel_isInteriorPoint_iff J g (f p) C.smooth C.regular ⟨A q,hx⟩).mpr hS
    have hs' := ((C.toUpper.isLocalDiffeomorph ⟨A q,hx⟩).isInteriorPoint_iff (by simp)).mp hs
    rw [hF]
    exact (manifoldSublevel_isInteriorPoint_iff J f c hf D.upper_regular _).mp hs'
  let d := C.outgoingLevel.prodCongr (Diffeomorph.refl 𝓘(ℝ,ℝ) ℝ ∞)
  let P := d.toPartialDiffeomorph.trans B
  have hPs : P.source = strip(w) := by
    ext q
    change (q ∈ (univ : Set (Lᵣ × ℝ)) ∧ d q ∈ B.source) ↔ _
    rw [hBs]
    simp only [mem_univ, true_and, mem_prod]
    rfl
  have hP (q : Lᵣ × ℝ) (hq : q ∈ P.source) :
      P q = B (C.outgoingLevel q.1,q.2) ∧ f (P q) = c + q.2 :=
    ⟨rfl, hBh (d q) hq.2⟩
  have hP0s (x : Lᵣ) : (x,(0 : ℝ)) ∈ P.source := by
    rw [hPs]
    exact ⟨mem_univ _, neg_lt_zero.mpr hw, hw⟩
  have hP0 (x : Lᵣ) : P (x,0) = F (x,0) :=
    ((hP (x,0) (hP0s x)).1.trans (hB0 (C.outgoingLevel x))).trans (hF0d x).symm
  have hFabove (x : Lᵣ) (U : Set M) (hU : IsOpen U) (hx : F (x,0) ∈ U) :
      ∃ y ∈ U, c < f y := by
    have hcont : ContinuousAt (fun t : ℝ => P (x,t)) 0 :=
      (P.contMDiffOn_toFun.continuousOn.continuousAt (P.open_source.mem_nhds (hP0s x))).comp
        (continuous_const.prodMk continuous_id).continuousAt
    obtain ⟨b, hb, hball⟩ := Metric.mem_nhds_iff.mp
      (hcont.preimage_mem_nhds (hU.mem_nhds ((hP0 x).symm ▸ hx)))
    rw [Real.ball_eq_Ioo, zero_sub, zero_add] at hball
    let t := min b w / 2
    have ht : 0 < t := half_pos (lt_min hb hw)
    have htb : t < b := (half_lt_self (lt_min hb hw)).trans_le (min_le_left ..)
    have htw : t < w := (half_lt_self (lt_min hb hw)).trans_le (min_le_right ..)
    have hpt : (x,t) ∈ P.source := hPs.symm ▸ ⟨mem_univ _, by linarith, htw⟩
    refine ⟨P (x,t), hball ⟨by linarith,htb⟩, ?_⟩
    rw [(hP (x,t) hpt).2]
    exact lt_add_of_pos_right _ ht
  have hFsign := collar_strictSides F.toOpenPartialHomeomorph hf.continuous E.radius_pos hFs
    (fun x => (hF0d x).symm ▸ (C.outgoingLevel x).property)
    (fun y hy => ⟨C.outgoingLevel.symm ⟨y,hy⟩, (hF0d _).trans
      (congrArg Subtype.val (C.outgoingLevel.apply_symm_apply ⟨y,hy⟩))⟩)
    hFstrict hFabove
  let T := F.trans P.symm
  have hTs (q : Lᵣ × ℝ) : q ∈ T.source ↔ q ∈ F.source ∧ F q ∈ P.target := Iff.rfl
  have hTt (q : Lᵣ × ℝ) : q ∈ T.target ↔ q ∈ P.source ∧ P q ∈ F.target := Iff.rfl
  have hz (x : Lᵣ) : (x,(0 : ℝ)) ∈ T.source ∩ T.target :=
    ⟨(hTs _).mpr ⟨hF0s x, hP0 x ▸ P.map_source (hP0s x)⟩,
      (hTt _).mpr ⟨hP0s x, (hP0 x).symm ▸ F.map_source (hF0s x)⟩⟩
  obtain ⟨b, hb, hwide⟩ := exists_strip_subset_of_zero (T.open_source.inter T.open_target) hz
  let r := min b w
  have hr : 0 < r := lt_min hb hw
  have hsub : strip(r) ⊆ T.source ∩ T.target :=
    (prod_mono_right (Ioo_subset_Ioo (neg_le_neg (min_le_left ..)) (min_le_left ..))).trans hwide
  have hTf (q : Lᵣ × ℝ) (hq : q ∈ T.source) :
      P (T q) = F q ∧ (T q).2 = f (F q) - c ∧
      ((T q).2 < 0 ↔ q.2 < 0) ∧ (0 < (T q).2 ↔ 0 < q.2) := by
    obtain ⟨hqF, hqP⟩ := (hTs q).mp hq
    have he : P (T q) = F q := P.right_inv hqP
    have hTP : T q ∈ P.source := ((hTt _).mp (T.map_source hq)).1
    have hheight : f (F q) = c + (T q).2 := he ▸ (hP (T q) hTP).2
    have hsign := hFsign q hqF
    rw [hheight] at hsign
    exact ⟨he, by linarith, (add_lt_iff_neg_right c).symm.trans hsign.1,
      (lt_add_iff_pos_right c).symm.trans hsign.2⟩
  refine ⟨r,F,P,T,hr,min_le_right ..,hFA,hPs,hP,rfl,hsub,?_,hTf,?_,hFneg⟩
  · intro x
    have ht : T (x,0) = (x,0) := by
      change P.symm (F (x,0)) = (x,0)
      rw [← hP0 x]
      exact P.left_inv (hP0s x)
    exact ⟨ht, ht ▸ T.left_inv (hz x).1, hF0 x⟩
  · intro q hq
    have hq' : T.symm q ∈ T.source := T.map_target hq
    obtain ⟨he, _, hneg, hpos⟩ := hTf (T.symm q) hq'
    rw [T.right_inv hq] at he hneg hpos
    exact ⟨he.symm, he ▸ (hP q ((hTt q).mp hq).1).2, hneg.symm, hpos.symm⟩

local notation "L₁" => LevelSetSpace f hi

set_option maxHeartbeats 1300000 in
/-- Reparametrize the actual rounded model by the inverse coordinate change.
The actual regular transport to the next cut carries every point of the
resulting tubes with exactly the calibrated parameter and has the stated
inverse. The native rounded height is read in its original coordinate. -/
theorem RetainedRoundedTrace.exists_outgoingCollarComparison_toNextCut
    (hunique : ∀ x, f x ∈ Icc lo hi → IsCriticalPointAt J f x → x = p) :
    letI := manifoldLevelSetChartedSpace J g (f p) C.smooth C.regular
    letI := manifoldLevelSetChartedSpace J f c hf D.upper_regular
    letI := manifoldLevelSetChartedSpace J f hi hf (D.outgoingNextCut_regular hunique)
    letI := manifoldSublevelChartedSpace J g (f p) C.smooth C.regular
    letI := manifoldSublevelChartedSpace J f c hf D.upper_regular
    ∃ (r : ℝ) (A F R : PartialDiffeomorph Kℝ J (Lᵣ × ℝ) M ∞)
      (T : PartialDiffeomorph Kℝ Kℝ (Lᵣ × ℝ) (Lᵣ × ℝ) ∞)
      (E : PartialDiffeomorph Kℝ J (L₁ × ℝ) M ∞)
      (l : L₀ ≃ₘ^∞⟮K,K⟯ L₁) (Q : PartialDiffeomorph J J M M ∞),
      0 < r ∧ r ≤ D.ε / 2 ∧
      R = T.symm.trans A ∧ R.source = T.target ∧ strip(r) ⊆ T.source ∩ T.target ∧
      (∀ x : Lᵣ, T (x,0) = (x,0) ∧ T.symm (x,0) = (x,0) ∧ R (x,0) = x.val) ∧
      (∀ q ∈ T.source, F q ∈ Q.source ∧
        (T q).2 = f (F q) - c ∧
        ((T q).2 < 0 ↔ q.2 < 0) ∧ (0 < (T q).2 ↔ 0 < q.2) ∧
        Q (F q) = E (l (C.outgoingLevel (T q).1),(T q).2) ∧
        Q.symm (E (l (C.outgoingLevel (T q).1),(T q).2)) = F q) ∧
      (∀ q ∈ T.target,
        ((T.symm q).2 < 0 ↔ q.2 < 0) ∧ (0 < (T.symm q).2 ↔ 0 < q.2) ∧
        E (l (C.outgoingLevel q.1),q.2) ∈ Q.target ∧
        f (F (T.symm q)) = c + q.2 ∧
        f (E (l (C.outgoingLevel q.1),q.2)) = hi + q.2 ∧
        Q (F (T.symm q)) = E (l (C.outgoingLevel q.1),q.2) ∧
        Q.symm (E (l (C.outgoingLevel q.1),q.2)) = F (T.symm q) ∧
        g (R q) = f p + (T.symm q).2) ∧
      (∀ q ∈ T.target, q.2 ≤ 0 →
        ∃ (hx : g (R q) ≤ f p) (hy : f (F (T.symm q)) ≤ c),
          F (T.symm q) = (C.toUpper ⟨R q,hx⟩).val ∧
          (C.toUpper.symm ⟨F (T.symm q),hy⟩).val = R q) := by
  letI := manifoldLevelSetChartedSpace J g (f p) C.smooth C.regular
  letI := manifoldLevelSetChartedSpace J f c hf D.upper_regular
  letI := manifoldLevelSetChartedSpace J f hi hf (D.outgoingNextCut_regular hunique)
  letI := manifoldSublevelChartedSpace J g (f p) C.smooth C.regular
  letI := manifoldSublevelChartedSpace J f c hf D.upper_regular
  obtain ⟨w,A,B,E,_,l,_,Q,hw,hwε,_,_,_,hAs,hBs,hEs,_,_,_,_,_,hQs,_,hA0,hB0,_,hA,hQ,hnext⟩ :=
    C.exists_outgoingLevelCollars_toNextCut hunique
  have hAheight (q : Lᵣ × ℝ) (hq : q ∈ A.source) : g (A q) = f p + q.2 :=
    (hA q.1 q.2 (hAs ▸ hq).2).1
  obtain ⟨r,F,P,T,hr,hrw,hFA,hPs,hP,hT,hstrip,h0,hTf,hTi,hFneg⟩ :=
    C.exists_outgoingCollarComparison w hw A B hAs hBs
      (fun x => (hA0 x).1) (fun y => (hB0 y).1) hAheight
      (fun q hq => (hQ q.1 q.2 (hBs ▸ hq).2).1)
  let R := T.symm.trans A
  have hFs {q : Lᵣ × ℝ} (hq : q ∈ T.source) : q ∈ F.source := by
    rw [hT] at hq
    exact hq.1
  have hPts {q : Lᵣ × ℝ} (hq : q ∈ T.target) : q ∈ P.source := by
    rw [hT] at hq
    exact hq.1
  have hRs : R.source = T.target := by
    ext q
    change (q ∈ T.target ∧ T.symm q ∈ A.source) ↔ q ∈ T.target
    exact ⟨And.left, fun hq => ⟨hq, hFA (hFs (T.map_target hq))⟩⟩
  have htransport (q : Lᵣ × ℝ) (hq : q ∈ T.target) :
      F (T.symm q) ∈ Q.source ∧
      E (l (C.outgoingLevel q.1),q.2) ∈ Q.target ∧
      Q (F (T.symm q)) = E (l (C.outgoingLevel q.1),q.2) ∧
      Q.symm (E (l (C.outgoingLevel q.1),q.2)) = F (T.symm q) := by
    have hq' : q.2 ∈ Ioo (-w) w := (hPs ▸ hPts hq).2
    have heq := (hTi q hq).1.trans (hP q (hPts hq)).1
    have hb : (C.outgoingLevel q.1,q.2) ∈ B.source := hBs.symm ▸ ⟨mem_univ _,hq'⟩
    have hb' : F (T.symm q) ∈ Q.source := hQs.symm ▸ heq.symm ▸ B.map_source hb
    obtain ⟨_, hfwd, hbwd⟩ := hQ (C.outgoingLevel q.1) q.2 hq'
    have hfwd' := (congrArg Q heq).trans hfwd
    exact ⟨hb', hfwd' ▸ Q.map_source hb', hfwd', hbwd.trans heq.symm⟩
  refine ⟨r,A,F,R,T,E,l,Q,hr,hrw.trans hwε,rfl,hRs,hstrip,?_,?_,?_,?_⟩
  · intro x
    obtain ⟨ht, hti, _⟩ := h0 x
    exact ⟨ht, hti, (congrArg A hti).trans (hA0 x).1⟩
  · intro q hq
    obtain ⟨_, hheight, hneg, hpos⟩ := hTf q hq
    have h := htransport (T q) (T.map_source hq)
    rw [T.left_inv hq] at h
    exact ⟨h.1, hheight, hneg, hpos, h.2.2⟩
  · intro q hq
    have hq' : q.2 ∈ Ioo (-w) w := (hPs ▸ hPts hq).2
    obtain ⟨_, hh, hneg, hpos⟩ := hTi q hq
    obtain ⟨_, hEt, hfwd, hbwd⟩ := htransport q hq
    exact ⟨hneg, hpos, hEt, hh, (hnext q.1 q.2 hq').2.2, hfwd, hbwd,
      hAheight (T.symm q) (hFA (hFs (T.map_target hq)))⟩
  · intro q hq ht
    have hn : (T.symm q).2 ≤ 0 := le_of_not_gt (fun hp => ht.not_gt ((hTi q hq).2.2.2.mp hp))
    exact hFneg (T.symm q) (hFs (T.map_target hq)) hn

end

end SmoothPoincare.IsolatedOneHandle
