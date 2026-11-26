import SmoothPoincare

/-! # Independent readback of marked edge gluing and surviving births -/

open DifferentialGeometry.Topology DifferentialGeometry.Topology.Morse SmoothPoincare Set
open DifferentialGeometry.Topology.Morse.CellAttachment
open DifferentialGeometry.Topology.Morse.ManifoldCellAttachment
open scoped ContDiff Manifold

namespace MarkedGlueReadback

/-- A two-patch example: disjoint open source intervals have an entire common
target interval. Literal forward agreement on overlaps does not make these
local translations one injective map on the source cover. -/
theorem forward_overlap_does_not_control_inverse :
    let s₀ := Ioo (-2 : ℝ) (-1)
    let s₁ := Ioo (1 : ℝ) 2
    let t := Ioo (0 : ℝ) 1
    let F := fun x : ℝ => x + 2
    let G := fun x : ℝ => x - 1
    EqOn F G (s₀ ∩ s₁) ∧ F '' s₀ = t ∧ G '' s₁ = t ∧
      (∀ h : ℝ → ℝ, EqOn h F s₀ → EqOn h G s₁ → ¬ InjOn h (s₀ ∪ s₁)) := by
  dsimp only
  refine ⟨?_, ?_, ?_, ?_⟩
  · rintro x ⟨hx₀, hx₁⟩
    exact False.elim (by linarith [hx₀.2, hx₁.1])
  · ext y
    constructor
    · rintro ⟨x, hx, rfl⟩
      exact ⟨by linarith [hx.1], by linarith [hx.2]⟩
    · intro hy
      exact ⟨y - 2, ⟨by linarith [hy.1], by linarith [hy.2]⟩, by ring⟩
  · ext y
    constructor
    · rintro ⟨x, hx, rfl⟩
      exact ⟨by linarith [hx.1], by linarith [hx.2]⟩
    · intro hy
      exact ⟨y + 1, ⟨by linarith [hy.1], by linarith [hy.2]⟩, by ring⟩
  · intro h hF hG hi
    have h₀ : (-3 / 2 : ℝ) ∈ Ioo (-2 : ℝ) (-1) := by norm_num
    have h₁ : (3 / 2 : ℝ) ∈ Ioo (1 : ℝ) 2 := by norm_num
    have hf := hF h₀
    have hg := hG h₁
    have hval : h (-3 / 2) = h (3 / 2) := by
      change h (-3 / 2) = -3 / 2 + 2 at hf
      change h (3 / 2) = 3 / 2 - 1 at hg
      rw [hf, hg]
      ring
    have hneq := hi (Or.inl h₀) (Or.inr h₁) hval
    norm_num at hneq

#print axioms forward_overlap_does_not_control_inverse

/-- Exact agreement on the cut and equality of signed normal coordinates
still allow a tangential shear on every positive-width overlap. -/
theorem zero_cut_agreement_does_not_control_strip {r : ℝ} (hr : 0 < r) :
    let S := fun q : ℝ × ℝ => (q.1 + q.2, q.2)
    EqOn (id : ℝ × ℝ → ℝ × ℝ) S {q | q.2 = 0} ∧
      (∀ q, (S q).2 = q.2) ∧
      ¬ EqOn (id : ℝ × ℝ → ℝ × ℝ) S {q | q.2 ∈ Ioo (-r) r} := by
  dsimp only
  refine ⟨?_, fun _ => rfl, ?_⟩
  · intro q hq
    change q.2 = 0 at hq
    exact Prod.ext (by change q.1 = q.1 + q.2; rw [hq, add_zero]) rfl
  · intro h
    have hx : (0, r / 2) ∈ {q : ℝ × ℝ | q.2 ∈ Ioo (-r) r} :=
      ⟨by linarith, by linarith⟩
    have he := congrArg Prod.fst (h hx)
    change 0 = 0 + r / 2 at he
    linarith

#print axioms zero_cut_agreement_does_not_control_strip

#check @markedEdgeInverseOverlap
#print axioms markedEdgeInverseOverlap
#check @markedEdgePatchUnion_domains
#print axioms markedEdgePatchUnion_domains
#check @markedEdgePatchUnion_eqOn
#print axioms markedEdgePatchUnion_eqOn
#check @markedEdgePatchDiffeomorph_eqOn
#print axioms markedEdgePatchDiffeomorph_eqOn
#check @exists_disjointIncomingEdgePatches
#print axioms exists_disjointIncomingEdgePatches
#check @markedEdgeSignedCollar_eqOn
#print axioms markedEdgeSignedCollar_eqOn
#check @markedEdgeSignedCollar_height
#print axioms markedEdgeSignedCollar_height

section PositiveCover

variable {E E' : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [NormedAddCommGroup E'] [NormedSpace ℝ E']
  {H H' : Type*} [TopologicalSpace H] [TopologicalSpace H']
  {I : ModelWithCorners ℝ E H} {J : ModelWithCorners ℝ E' H'}
  {M N : Type*} [TopologicalSpace M] [TopologicalSpace N] [ChartedSpace H M] [ChartedSpace H' N]

/-- An actual comparison broken into any four open domains is recovered as
the identical forward and inverse comparison by the gluing. -/
theorem reassemble_restrictions_of_chosen_map
    (F : M ≃ₘ^∞⟮I,J⟯ N) (S : Fin 4 → Set M) (hS : ∀ i, IsOpen (S i))
    (hcover : (⋃ i, S i) = univ) :
    ∃ (P : Fin 4 → PartialDiffeomorph I J M N ∞) (G : M ≃ₘ^∞⟮I,J⟯ N),
      (∀ i, (P i).source = S i ∧ (P i).target = F.symm ⁻¹' S i) ∧
      (∀ x, G x = F x) ∧ (∀ y, G.symm y = F.symm y) := by
  let P := fun i => DifferentialGeometry.Topology.PartialDiffeomorph.restrict F.toPartialDiffeomorph (S i) (hS i)
  have hp (i : Fin 4) : (P i).source = S i ∧ (P i).target = F.symm ⁻¹' S i :=
    ⟨univ_inter _, univ_inter _⟩
  have hs : (⋃ i, (P i).source) = univ := by simpa only [fun i => (hp i).1] using hcover
  have ht : (⋃ i, (P i).target) = univ := by
    ext y
    constructor
    · exact fun _ => mem_univ _
    · intro _
      obtain ⟨i, hi⟩ := mem_iUnion.mp (hcover.symm ▸ mem_univ (F.symm y))
      exact mem_iUnion.mpr ⟨i, (hp i).2.symm ▸ hi⟩
  have hforward : ∀ i j, EqOn (P i) (P j) ((P i).source ∩ (P j).source) := by
    intro i j x hx
    rfl
  have hbackward : ∀ i j, EqOn (P i).symm (P j).symm ((P i).target ∩ (P j).target) := by
    intro i j y hy
    rfl
  let G := markedEdgePatchDiffeomorph P hforward hbackward hs ht
  refine ⟨P, G, hp, ?_, ?_⟩
  · intro x
    obtain ⟨i, hi⟩ := mem_iUnion.mp (hs.symm ▸ mem_univ x)
    exact (markedEdgePatchDiffeomorph_eqOn P hforward hbackward hs ht i).1 hi
  · intro y
    obtain ⟨i, hi⟩ := mem_iUnion.mp (ht.symm ▸ mem_univ y)
    exact (markedEdgePatchDiffeomorph_eqOn P hforward hbackward hs ht i).2 hi

#print axioms reassemble_restrictions_of_chosen_map

end PositiveCover

section TraceFreedom

variable {H M : Type} [TopologicalSpace H] [TopologicalSpace M] [ChartedSpace H M]
  {J : ModelWithCorners ℝ (MorseModel 4) H}
  [J.Boundaryless] [IsManifold J ∞ M]
  {f : M → ℝ} {hf : ContMDiff J 𝓘(ℝ, ℝ) ∞ f} {p : M} {lo hi : ℝ}
  (D : IsolatedOneHandle hf p lo hi)

local notation "K" => morseModelWithCornersHalfSpace 3
local notation "c₋" => f p - D.ε
local notation "c₊" => f p + D.ε
local notation "L" => SublevelSpace f c₊
local notation "attach" => morseAttachingEmbedding (show (1 : ℕ) ≤ 4 by decide)
  (f p) D.ε D.r D.chart D.ε_pos D.attaching_radius

/-- Postcomposition by a diffeomorphism fixed on the deep lower set preserves
both stored deep lower equations. Any moved outgoing point changes the value
of the trace at its original antecedent. -/
theorem postcompose_trace_keeps_deep_equations :
    letI := D.traceCharts
    letI := manifoldSublevelChartedSpace J f c₊ hf D.upper_regular
    ∀ F : L ≃ₘ^∞⟮K,K⟯ L,
      (∀ x : L, f x.val ≤ c₋ - D.η → F x = x) →
      let E := D.traceDiffeomorph.trans F
      (∀ (x : M) (_hx : f x ≤ c₋ - D.η) (hxb : f x ≤ c₋),
        (E (Handle.lower attach ⟨x, hxb⟩)).val = x) ∧
      (∀ (x : M) (hx : f x ≤ c₋ - D.η) (hxb : f x ≤ c₊) z,
        E z = ⟨x, hxb⟩ →
        z = Handle.lower attach ⟨x, hx.trans (sub_le_self _ D.η_pos.le)⟩) ∧
      (∀ y : L, F y ≠ y →
        E (D.traceDiffeomorph.symm y) ≠ D.traceDiffeomorph (D.traceDiffeomorph.symm y)) := by
  let _ := D.traceCharts
  let _ := manifoldSublevelChartedSpace J f c₊ hf D.upper_regular
  intro F hF
  refine ⟨?_, ?_, ?_⟩
  · intro x hx hxb
    let y : L := ⟨x, hxb.trans (by linarith [D.ε_pos])⟩
    have he : D.traceDiffeomorph (Handle.lower attach ⟨x, hxb⟩) = y :=
      Subtype.ext (D.fixes_deep_lower x hx hxb)
    exact congrArg Subtype.val ((congrArg F he).trans (hF y hx))
  · intro x hx hxb z he
    exact D.deep_lower_preimage x hx hxb z (F.injective (he.trans (hF ⟨x,hxb⟩ hx).symm))
  · intro y hy he
    have h : D.traceDiffeomorph (D.traceDiffeomorph.symm y) = y :=
      D.traceDiffeomorph.apply_symm_apply y
    exact hy ((congrArg F h).symm.trans (he.trans h))

#print axioms postcompose_trace_keeps_deep_equations

#check @IsolatedOneHandle.nativeDeepTraceDiffeomorph
#print axioms IsolatedOneHandle.nativeDeepTraceDiffeomorph
#check @IsolatedOneHandle.markedEdgeTraceMap_deepLower
#print axioms IsolatedOneHandle.markedEdgeTraceMap_deepLower
#check @IsolatedOneHandle.markedEdgeTraceMap_transportOutgoingTube
#print axioms IsolatedOneHandle.markedEdgeTraceMap_transportOutgoingTube
#check @IsolatedOneHandle.exists_markedEdgeTraceDiffeomorph_of_cover
#print axioms IsolatedOneHandle.exists_markedEdgeTraceDiffeomorph_of_cover

#check @IsolatedOneHandle.withUpperMarking_maps
#print axioms IsolatedOneHandle.withUpperMarking_maps
#check @IsolatedOneHandle.exists_outgoingTraceAdjustment
#print axioms IsolatedOneHandle.exists_outgoingTraceAdjustment

/-- An actual outgoing motion moves the trace point over a marked level point
and its inverse recovers the same antecedent. The selected birth-to-edge proof
therefore cannot infer this outgoing marking from the deep lower agreement. -/
theorem moving_outgoing_level_point_changes_actual_trace [T2Space M] [CompactSpace M] :
    letI := D.traceCharts
    letI := manifoldSublevelChartedSpace J f c₊ hf D.upper_regular
    letI := manifoldLevelSetChartedSpace J f c₊ hf D.upper_regular
    let L₀ := LevelSetSpace f c₊
    let I₀ := 𝓘(ℝ, MorseModel 3)
    ∀ {C : Set L₀} (A : SupportedLevelIsotopy I₀ C)
      (Φ : PartialDiffeomorph (I₀.prod 𝓘(ℝ, ℝ)) J (L₀ × ℝ) M ∞)
      {r a b : ℝ}, 0 < a → a < b → b < r → b ≤ D.ε →
      Φ.source = {z | z.2 ∈ Ioo (-r) r} →
      (∀ z ∈ Φ.source, f (Φ z) = c₊ + z.2) →
      (∀ x : L₀, Φ (x, 0) = x.val) →
      ∀ x : L₀, A.isotopy 1 x ≠ x →
      ∃ (G : L ≃ₘ^∞⟮K,K⟯ L) (hg : ∀ y : L, f y.val ≤ c₋ - D.η → G y = y),
        let y := regularEndLevelInclusion f c₊ x
        let z := D.traceDiffeomorph.symm y
        let E := (D.withUpperMarking G hg).traceDiffeomorph
        (E z).val = (A.isotopy 1 x).val ∧ E z ≠ y ∧ E.symm (G y) = z := by
  let _ := D.traceCharts
  let _ := manifoldSublevelChartedSpace J f c₊ hf D.upper_regular
  let _ := manifoldLevelSetChartedSpace J f c₊ hf D.upper_regular
  intro _ _ C A Φ r a b ha hab hbr hbε hsrc hheight hzero x hmove
  obtain ⟨F, G, hg, hmark, _, _, _, hcollar, _⟩ :=
    D.exists_outgoingTraceAdjustment A Φ ha hab hbr hbε hsrc hheight
  let y := regularEndLevelInclusion f c₊ x
  let z := D.traceDiffeomorph.symm y
  have hq : (x, 0) ∈ Φ.source := by
    rw [hsrc]
    exact ⟨by linarith, by linarith⟩
  have he := (A.signedCollarDiffeomorph_eq_endpoint ha hab
    (p := (x, (0 : ℝ))) (by simp [ha.le])).1
  have hv : ((D.withUpperMarking G hg).traceDiffeomorph z).val = (A.isotopy 1 x).val := by
    rw [hmark, show D.traceDiffeomorph z = y from D.traceDiffeomorph.apply_symm_apply y]
    change F x.val = _
    have hh := (hcollar (x, 0) hq).1
    rw [hzero x, he, hzero (A.isotopy 1 x)] at hh
    exact hh
  refine ⟨G, hg, hv, ?_, ?_⟩
  · intro h
    apply hmove
    exact Subtype.ext (hv.symm.trans (congrArg Subtype.val h))
  · rw [(D.withUpperMarking_maps G hg).2, G.symm_apply_apply]

#print axioms moving_outgoing_level_point_changes_actual_trace

/-- A compact injective outgoing tube may use different members of the
cover at different parameters. The same glued map transports the entire
tube and each inverse recovers that parameter's actual trace representative. -/
theorem native_outgoing_tube_readback_on_cover
    {H' N : Type*} [TopologicalSpace H'] [TopologicalSpace N] [ChartedSpace H' N]
    [T2Space N] {I' : ModelWithCorners ℝ (MorseModel 4) H'}
    {E₀ : Type*} [NormedAddCommGroup E₀] [NormedSpace ℝ E₀]
    {H₀ Z : Type*} [TopologicalSpace H₀] [TopologicalSpace Z] [ChartedSpace H₀ Z]
    [CompactSpace Z] {I₀ : ModelWithCorners ℝ E₀ H₀} :
    letI := D.traceCharts
    letI := manifoldSublevelChartedSpace J f c₊ hf D.upper_regular
    letI := manifoldLevelSetChartedSpace J f c₊ hf D.upper_regular
    ∀ (P : Fin 4 → PartialDiffeomorph K I' L N ∞)
      (hS : ∀ i j, EqOn (P i) (P j) ((P i).source ∩ (P j).source))
      (hT : ∀ i j, EqOn (P i).symm (P j).symm ((P i).target ∩ (P j).target))
      (hs : (⋃ i, (P i).source) = univ) (ht : (⋃ i, (P i).target) = univ)
      (u : Z → LevelSetSpace f c₊) (iu : Z → Fin 4),
      ContMDiff I₀ 𝓘(ℝ, MorseModel 3) ∞ u → Function.Injective u →
      (∀ z, regularEndLevelInclusion f c₊ (u z) ∈ (P (iu z)).source) →
    ∃ v : Z → N, ContMDiff I₀ I' ∞ v ∧ Topology.IsClosedEmbedding v ∧
      ∀ z, let x := regularEndLevelInclusion f c₊ (u z)
        let F := (markedEdgePatchDiffeomorph P hS hT hs ht).toPartialDiffeomorph
        v z = P (iu z) x ∧
        D.markedEdgeTraceMap F (D.traceDiffeomorph.symm x) = v z ∧
        (D.markedEdgeTraceMap F).symm (v z) = D.traceDiffeomorph.symm x := by
  let _ := D.traceCharts
  let _ := manifoldSublevelChartedSpace J f c₊ hf D.upper_regular
  let _ := manifoldLevelSetChartedSpace J f c₊ hf D.upper_regular
  intro P hS hT hs ht u iu hu hinj hdom
  let F := (markedEdgePatchDiffeomorph P hS hT hs ht).toPartialDiffeomorph
  obtain ⟨v, hv, he, hcl⟩ :=
    D.markedEdgeTraceMap_transportOutgoingTube F u hu (fun _ => mem_univ _)
  refine ⟨v, hv, hcl hinj, fun z => ?_⟩
  obtain ⟨h₁,h₂,h₃⟩ := he z
  exact ⟨h₁.trans ((markedEdgePatchDiffeomorph_eqOn P hS hT hs ht (iu z)).1 (hdom z)), h₂, h₃⟩

#print axioms native_outgoing_tube_readback_on_cover

end TraceFreedom

#check @IsolatedZeroHandle.birthBodyChart_inter_sublevel
#print axioms IsolatedZeroHandle.birthBodyChart_inter_sublevel
#check @IsolatedZeroHandle.exists_birthExcisionHeight
#print axioms IsolatedZeroHandle.exists_birthExcisionHeight
#check @IsolatedZeroHandle.exists_survivingBirthTransport
#print axioms IsolatedZeroHandle.exists_survivingBirthTransport
#check @IsolatedZeroHandle.exists_firstBirthChart_at_regularCut
#print axioms IsolatedZeroHandle.exists_firstBirthChart_at_regularCut
#check @IsolatedZeroHandle.exists_twoBirthCharts_at_regularCut
#print axioms IsolatedZeroHandle.exists_twoBirthCharts_at_regularCut
#check @IsolatedZeroHandle.exists_twoBirthCharts_after_emptyCut
#print axioms IsolatedZeroHandle.exists_twoBirthCharts_after_emptyCut

#check @exists_bufferedBirthCollarOverlap
#print axioms exists_bufferedBirthCollarOverlap
#check @IsolatedOneHandle.exists_bufferedNativeFootBirthOverlap
#print axioms IsolatedOneHandle.exists_bufferedNativeFootBirthOverlap
#check @IsolatedOneHandle.exists_bufferedNativeBlockBirthOverlap
#print axioms IsolatedOneHandle.exists_bufferedNativeBlockBirthOverlap
#check @IsolatedOneHandle.exists_twoBirthCharts_withNativeEdgeFeet
#print axioms IsolatedOneHandle.exists_twoBirthCharts_withNativeEdgeFeet

section BothNativeFeet

variable {H M : Type} [TopologicalSpace H] [TopologicalSpace M] [ChartedSpace H M]
  [T2Space M] [CompactSpace M]
  {J : ModelWithCorners ℝ (MorseModel 4) H} [J.Boundaryless] [IsManifold J ∞ M]
  {f : M → ℝ} {hf : ContMDiff J 𝓘(ℝ, ℝ) ∞ f} {p p₀ p₁ : M}
  {lo hi lo₀ hi₀ lo₁ hi₁ : ℝ} (D : IsolatedOneHandle hf p lo hi)

local notation "V₄" => EuclideanSpace ℝ (Fin 4)
local notation "V₁" => EuclideanSpace ℝ (Fin 1)
local notation "V₃" => EuclideanSpace ℝ (Fin 3)
local notation "Q₄" => V₁ × V₃
local notation "attach" => morseAttachingEmbedding (show (1 : ℕ) ≤ 4 by decide)
  (f p) D.ε D.r D.chart D.ε_pos D.attaching_radius

private def HasBlockReadback (P : PartialDiffeomorph 𝓘(ℝ, V₄) J V₄ M ∞)
    (b : CellBoundary 1) : Prop :=
  ∃ (σ r : ℝ) (A : PartialDiffeomorph 𝓘(ℝ, Q₄) J Q₄ M ∞)
    (B : PartialDiffeomorph 𝓘(ℝ, Q₄) 𝓘(ℝ, V₄) Q₄ V₄ ∞)
    (T : PartialDiffeomorph 𝓘(ℝ, V₄) J V₄ M ∞),
    1 < σ ∧ 0 < r ∧ A.source = Metric.ball b.val r ×ˢ Metric.ball 0 σ ∧
    T.target ⊆ P.target ∧
    (∀ z : ClosedCell 3, (attach (b,z)).val ∈ T.target) ∧
    (∀ q ∈ A.source, T (B q) = D.edgeBlockChart q ∧
      T.symm (D.edgeBlockChart q) = B q ∧ B.symm (T.symm (D.edgeBlockChart q)) = q ∧
      A.symm (T (B q)) = q)

omit [T2Space M] [CompactSpace M] in
private theorem hasBlockReadback (P : PartialDiffeomorph 𝓘(ℝ, V₄) J V₄ M ∞)
    (b : CellBoundary 1) (hbody : ∀ z : ClosedCell 3, (attach (b,z)).val ∈ P.target) :
    HasBlockReadback D P b := by
  have hh (z : ClosedCell 3) : (D.footComponentPoint b z).val.val ∈ P.target := by
    rw [congrArg Subtype.val (D.footComponentPoint_val b z)]
    exact hbody z
  obtain ⟨σ,r,A,B,T,hσ,_,hr,hAs,_,_,_,hTt,hTar,_,_,h⟩ :=
    D.exists_bufferedNativeBlockBirthOverlap b P hh
  refine ⟨σ,r,A,B,T,hσ,hr,hAs,hTar,?_,?_⟩
  · intro z
    let q : Q₄ := (b.val,z.val)
    have hq : q ∈ A.source := by
      rw [hAs]
      refine ⟨Metric.mem_ball_self hr, ?_⟩
      rw [Metric.mem_ball, dist_zero_right]
      exact z.property.trans_lt hσ
    have hA := (h q hq).1
    have hFoot := (D.edgeBlockChart_nativeFoot b z).2.1
    have hy : A q ∈ T.target := hTt.symm ▸ A.map_source hq
    rw [hA, hFoot] at hy
    exact hy
  · intro q hq
    obtain ⟨hA,_,hTB,hTi,hBi,_⟩ := h q hq
    exact ⟨hTB.trans hA, (congrArg T.symm hA.symm).trans hTi,
      (congrArg (fun x => B.symm (T.symm x)) hA.symm).trans hBi,
      (congrArg A.symm hTB).trans (A.left_inv hq)⟩

/-- Actual two-birth input supplies the two opposite native feet. The two
resulting block overlaps use disjoint body neighborhoods and recover all
parameters on each full open four-dimensional patch. -/
theorem actual_two_births_have_both_native_block_overlaps
    (D₀ : IsolatedZeroHandle hf p₀ lo₀ hi₀) (D₁ : IsolatedZeroHandle hf p₁ lo₁ hi₁)
    (hunique₀ : ∀ x, f x ∈ Icc lo₀ hi₀ → IsCriticalPointAt J f x → x = p₀)
    (hunique₁ : ∀ x, f x ∈ Icc lo₁ hi₁ → IsCriticalPointAt J f x → x = p₁)
    (hempty : f ⁻¹' Iic (f p₀ - D₀.ε) = ∅)
    (hbetween : f p₀ + D₀.ε ≤ f p₁ - D₁.ε)
    (hregular₀ : ∀ x, f x ∈ Icc (f p₀ + D₀.ε) (f p₁ - D₁.ε) → ¬ IsCriticalPointAt J f x)
    (hbelow : f p₁ + D₁.ε ≤ f p - D.ε)
    (hregular₁ : ∀ x, f x ∈ Icc (f p₁ + D₁.ε) (f p - D.ε) → ¬ IsCriticalPointAt J f x)
    (b b' : CellBoundary 1) (hd : D.incomingBodyFoot b ≠ D.incomingBodyFoot b') :
    ∃ P Q : PartialDiffeomorph 𝓘(ℝ, V₄) J V₄ M ∞,
      Disjoint P.target Q.target ∧ HasBlockReadback D P b ∧ HasBlockReadback D Q b' := by
  obtain ⟨P,Q,hP,hQ,hPQ,_,_,hpq | hqp⟩ :=
    D.exists_twoBirthCharts_withNativeEdgeFeet D₀ D₁ hunique₀ hunique₁ hempty hbetween
      hregular₀ hbelow hregular₁ b b' hd
  · refine ⟨P,Q,hPQ, hasBlockReadback D P b ?_, hasBlockReadback D Q b' ?_⟩
    · intro z
      obtain ⟨x,hx,he⟩ := hpq.1 z
      exact he ▸ P.map_source (hP (Metric.sphere_subset_closedBall hx))
    · intro z
      obtain ⟨x,hx,he⟩ := hpq.2 z
      exact he ▸ Q.map_source (hQ (Metric.sphere_subset_closedBall hx))
  · refine ⟨Q,P,hPQ.symm,hasBlockReadback D Q b ?_,hasBlockReadback D P b' ?_⟩
    · intro z
      obtain ⟨x,hx,he⟩ := hqp.1 z
      exact he ▸ Q.map_source (hQ (Metric.sphere_subset_closedBall hx))
    · intro z
      obtain ⟨x,hx,he⟩ := hqp.2 z
      exact he ▸ P.map_source (hP (Metric.sphere_subset_closedBall hx))

#print axioms actual_two_births_have_both_native_block_overlaps

end BothNativeFeet

/-- A supplied two-handle family is transported with the two distinct labels
and the complete framed attaching coordinates in both directions. -/
theorem supplied_two_middle_framed_tubes_round_trip {BP BP' L : Type*}
    [TopologicalSpace BP] [TopologicalSpace BP'] [TopologicalSpace L]
    (α : BP' ≃ₜ BP) (p : BP ≃ₜ L) (u : MiddleAttachingRegions (Fin 2) → L)
    (h : Function.Injective u) :
    let v := transportedAttachingTube α p u
    Function.Injective v ∧ ∀ (j : Fin 2) (z : Handle.AttachingRegion 2 2),
      p (α (v ⟨j,z⟩)) = u ⟨j,z⟩ := by
  refine ⟨α.symm.injective.comp (p.symm.injective.comp h), ?_⟩
  intro j z
  change p (α (α.symm (p.symm (u ⟨j,z⟩)))) = u ⟨j,z⟩
  rw [α.apply_symm_apply, p.apply_symm_apply]

#print axioms supplied_two_middle_framed_tubes_round_trip

end MarkedGlueReadback
