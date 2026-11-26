import SmoothPoincare

/-! # Independent applications of the marked end and height interfaces -/

open DifferentialGeometry.Topology DifferentialGeometry.Topology.Morse SmoothPoincare Set
open DifferentialGeometry.Topology.Morse.CellAttachment
open DifferentialGeometry.Topology.Morse.ManifoldCellAttachment
open scoped ContDiff Manifold

namespace RoundedEdgeReadback

#check @EndHandleFiltration.step
#check @exists_selectedEndHandlePresentation_of_inducedEnergy_le
#print axioms exists_selectedEndHandlePresentation_of_inducedEnergy_le
#check @orientedHeight_exists_morse_twoMiddle_with_data_of_subcritical_energy
#print axioms orientedHeight_exists_morse_twoMiddle_with_data_of_subcritical_energy
#check @IsolatedEndHandle.traceDiffeomorph
#check @IsolatedOneHandle.exists_markedTreeEdgeFootNormalization
#print axioms IsolatedOneHandle.exists_markedTreeEdgeFootNormalization

/-- Distinct components of the actual incoming body give the required disjoint
level components. This uses only the continuous inclusion of the level. -/
theorem distinct_body_components_separate_levels {M : Type*} [TopologicalSpace M]
    (f : M → ℝ) (c : ℝ) (u v : LevelSetSpace f c)
    (h : ConnectedComponents.mk (regularEndLevelInclusion f c u) ≠
      ConnectedComponents.mk (regularEndLevelInclusion f c v)) :
    Disjoint (connectedComponent u) (connectedComponent v) := by
  have hc : Continuous (regularEndLevelInclusion f c) :=
    continuous_subtype_val.subtype_mk _
  apply connectedComponent_disjoint
  intro heq
  apply h
  apply ConnectedComponents.coe_eq_coe'.mpr
  exact hc.mapsTo_connectedComponent v (heq ▸ mem_connectedComponent)

#print axioms distinct_body_components_separate_levels

/-- The supplied comparison acts in both directions on the entire two-handle
family, allowing either label and arbitrary transverse coordinates. -/
theorem two_handle_coordinates_round_trip {P P' BP BP' L : Type*}
    [TopologicalSpace P] [TopologicalSpace P'] [TopologicalSpace BP] [TopologicalSpace BP']
    [TopologicalSpace L] (α : P' ≃ₜ P) (αb : BP' ≃ₜ BP) (p : BP ≃ₜ L)
    (j : BP → P) (j' : BP' → P') (ha : ∀ z, α (j' z) = j (αb z))
    (a : MiddleAttachingRegions (Fin 2) → L)
    (z : MiddleHandles (Fin 2)) :
    let e := transportedMiddleTraceHomeomorph α αb p j j' ha a
    let i := middleAttachingInclusion (Fin 2)
    let a' := j' ∘ transportedAttachingTube αb p a
    let a₀ := j ∘ p.symm ∘ a
    e (adjunctionCell i a' z) = adjunctionCell i a₀ z ∧
      e.symm (adjunctionCell i a₀ z) = adjunctionCell i a' z := by
  dsimp only
  exact ⟨rfl, rfl⟩

#print axioms two_handle_coordinates_round_trip

/-- The outgoing gluing is conjugated by the full trace and upper-end marks. -/
theorem outgoing_gluing_round_trip {X X' Q Q' L : Type*}
    [TopologicalSpace X] [TopologicalSpace X'] [TopologicalSpace Q] [TopologicalSpace Q']
    [TopologicalSpace L] (s : X' ≃ₜ X) (β : Q' ≃ₜ Q) (q : Q ≃ₜ L) (η : X ≃ₜ L)
    (x : X') (y : Q') :
    let g := transportedOutgoingGluing β q (s.trans η)
    g x = β.symm (q.symm (η (s x))) ∧ g.symm y = s.symm (η.symm (q (β y))) := by
  exact ⟨rfl, rfl⟩

#print axioms outgoing_gluing_round_trip

#check @oneHandle_component_fibers
#print axioms oneHandle_component_fibers
#check @IsolatedOneHandle.traceComponentMap_fibers
#print axioms IsolatedOneHandle.traceComponentMap_fibers
#check @IsolatedOneHandle.levelFeet_disjoint_of_bodyFoot_ne
#print axioms IsolatedOneHandle.levelFeet_disjoint_of_bodyFoot_ne
#check @IsolatedOneHandle.not_simplyConnected_of_same_bodyFoot
#print axioms IsolatedOneHandle.not_simplyConnected_of_same_bodyFoot
#check @IsolatedMiddleAttachment.traceComponentMap_bijective
#print axioms IsolatedMiddleAttachment.traceComponentMap_bijective
#check @IsolatedOneHandle.edgeBlockChart
#print axioms IsolatedOneHandle.edgeBlockChart
#check @IsolatedOneHandle.edgeBlockChart_height
#print axioms IsolatedOneHandle.edgeBlockChart_height
#check @IsolatedOneHandle.edgeBlockChart_nativeFoot
#print axioms IsolatedOneHandle.edgeBlockChart_nativeFoot
#check @IsolatedOneHandle.edgeBlockChart_afterFootNormalization
#print axioms IsolatedOneHandle.edgeBlockChart_afterFootNormalization
#check @IsolatedOneHandle.roundedRimToOutgoing
#print axioms IsolatedOneHandle.roundedRimToOutgoing
#check @IsolatedOneHandle.roundedRimToOutgoing_apply
#print axioms IsolatedOneHandle.roundedRimToOutgoing_apply
#check @IsolatedOneHandle.roundedRimToOutgoing_symm_apply
#print axioms IsolatedOneHandle.roundedRimToOutgoing_symm_apply
#check @IsolatedOneHandle.roundedRimToOutgoing_mem_source
#print axioms IsolatedOneHandle.roundedRimToOutgoing_mem_source
#check @IsolatedOneHandle.edgeBlockChart_signedOutgoing
#print axioms IsolatedOneHandle.edgeBlockChart_signedOutgoing
#check @IsolatedOneHandle.roundedRimToOutgoing_signed_inverse
#print axioms IsolatedOneHandle.roundedRimToOutgoing_signed_inverse
#check @IsolatedOneHandle.roundedRimToOutgoing_nativeRim
#print axioms IsolatedOneHandle.roundedRimToOutgoing_nativeRim
#check @IsolatedOneHandle.exists_roundedOutgoingCollar_nearNativeRims
#print axioms IsolatedOneHandle.exists_roundedOutgoingCollar_nearNativeRims
#check @IsolatedZeroHandle.birthBodyChart_closedBall_two
#print axioms IsolatedZeroHandle.birthBodyChart_closedBall_two
#check @IsolatedZeroHandle.birthBodyChart_component
#print axioms IsolatedZeroHandle.birthBodyChart_component
#check @IsolatedZeroHandle.exists_transportedBirthBody
#print axioms IsolatedZeroHandle.exists_transportedBirthBody
#check @IsolatedEndHandle.doubleBallChart_source
#print axioms IsolatedEndHandle.doubleBallChart_source
#check @IsolatedOneHandle.exists_outgoingSignedBandTransport
#print axioms IsolatedOneHandle.exists_outgoingSignedBandTransport

private theorem end_coordinate (b : CellBoundary 1) : b.val 0 = -1 ∨ b.val 0 = 1 := by
  have h := EuclideanSpace.norm_sq_eq b.val
  rw [b.property, Fin.sum_univ_one, Real.norm_eq_abs, sq_abs] at h
  have hz : (b.val 0 + 1) * (b.val 0 - 1) = 0 := by nlinarith only [h]
  exact (mul_eq_zero.mp hz).imp (fun hn => by linarith) (fun hp => by linarith)

private theorem eq_of_end_coordinate {b b' : CellBoundary 1} (h : b.val 0 = b'.val 0) :
    b = b' := by
  apply Subtype.ext
  ext i
  have hi : i = 0 := Subsingleton.elim _ _
  simpa only [hi] using h

private theorem endpoint_exhaustive {b b' : CellBoundary 1} (hne : b ≠ b')
    (v : CellBoundary 1) : v = b ∨ v = b' := by
  have hcoord : b.val 0 ≠ b'.val 0 := fun h => hne (eq_of_end_coordinate h)
  rcases end_coordinate b with hbn | hbp <;>
    rcases end_coordinate b' with hbn' | hbp' <;>
    rcases end_coordinate v with hvn | hvp
  · exact (hcoord (hbn.trans hbn'.symm)).elim
  · exact (hcoord (hbn.trans hbn'.symm)).elim
  · exact Or.inl (eq_of_end_coordinate (hvn.trans hbn.symm))
  · exact Or.inr (eq_of_end_coordinate (hvp.trans hbp'.symm))
  · exact Or.inr (eq_of_end_coordinate (hvn.trans hbn'.symm))
  · exact Or.inl (eq_of_end_coordinate (hvp.trans hbp.symm))
  · exact (hcoord (hbp.trans hbp'.symm)).elim
  · exact (hcoord (hbp.trans hbp'.symm)).elim

section NativeBand

variable {H M : Type} [TopologicalSpace H] [TopologicalSpace M] [ChartedSpace H M]
  {J : ModelWithCorners ℝ (MorseModel 4) H} [J.Boundaryless] [IsManifold J ∞ M]
  {f : M → ℝ} {hf : ContMDiff J 𝓘(ℝ, ℝ) ∞ f} {p : M} {lo hi : ℝ}
  (D : IsolatedOneHandle hf p lo hi)

local notation "X" => SublevelSpace f (f p - D.ε)
local notation "U" => EuclideanSpace ℝ (Fin 1)
local notation "V" => EuclideanSpace ℝ (Fin 3)
local notation "hk₁" => (show (1 : ℕ) ≤ 4 by decide)

/-- Two distinct foot parameters enumerate the entire attaching zero-sphere.
This test makes the single pair of component labels explicit, covering a loop
as well as a merger. -/
theorem trace_fibers_exact_pair {b b' : CellBoundary 1} (hne : b ≠ b')
    (u v : ConnectedComponents X) :
    D.traceComponentMap u = D.traceComponentMap v ↔
      u = v ∨ (u = D.incomingBodyFoot b ∨ u = D.incomingBodyFoot b') ∧
        (v = D.incomingBodyFoot b ∨ v = D.incomingBodyFoot b') := by
  have hend (x : ConnectedComponents X) :
      x ∈ Set.range D.incomingBodyFoot ↔ x = D.incomingBodyFoot b ∨ x = D.incomingBodyFoot b' := by
    constructor
    · rintro ⟨a, rfl⟩
      rcases endpoint_exhaustive hne a with rfl | rfl
      · exact Or.inl rfl
      · exact Or.inr rfl
    · rintro (rfl | rfl)
      · exact ⟨b, rfl⟩
      · exact ⟨b', rfl⟩
  simpa only [hend] using (D.traceComponentMap_fibers b).2 u v

theorem native_trace_loop_bijective {b b' : CellBoundary 1} (hne : b ≠ b')
    (hloop : D.incomingBodyFoot b = D.incomingBodyFoot b') :
    Function.Bijective D.traceComponentMap := by
  refine ⟨fun u v huv => ?_, (D.traceComponentMap_fibers b).1⟩
  obtain h | ⟨hu,hv⟩ := (trace_fibers_exact_pair D hne u v).mp huv
  · exact h
  · rw [hloop, or_self] at hu hv
    exact hu.trans hv.symm

theorem native_trace_merger_and_unrelated_component {b b' : CellBoundary 1} (hne : b ≠ b')
    (hmerge : D.incomingBodyFoot b ≠ D.incomingBodyFoot b')
    (u : ConnectedComponents X) (hu : u ≠ D.incomingBodyFoot b) (hu' : u ≠ D.incomingBodyFoot b') :
    Disjoint (D.footComponent b : Set (LevelSetSpace f (f p - D.ε)))
        (D.footComponent b' : Set (LevelSetSpace f (f p - D.ε))) ∧
      D.traceComponentMap (D.incomingBodyFoot b) = D.traceComponentMap (D.incomingBodyFoot b') ∧
      D.traceComponentMap u ≠ D.traceComponentMap (D.incomingBodyFoot b) := by
  refine ⟨D.levelFeet_disjoint_of_bodyFoot_ne _ _ hmerge, ?_, ?_⟩
  · exact (trace_fibers_exact_pair D hne _ _).mpr (Or.inr ⟨Or.inl rfl, Or.inr rfl⟩)
  · intro h
    rcases (trace_fibers_exact_pair D hne _ _).mp h with h | ⟨h | h, _⟩
    · exact hu h
    · exact hu h
    · exact hu' h

theorem simply_connected_outgoing_requires_distinct_body_foot_components
    (hs : SimplyConnectedSpace (SublevelSpace f (f p + D.ε)))
    {b b' : CellBoundary 1} (hne : b ≠ b') :
    D.incomingBodyFoot b ≠ D.incomingBodyFoot b' ∧
      Disjoint (D.footComponent b : Set (LevelSetSpace f (f p - D.ε)))
        (D.footComponent b' : Set (LevelSetSpace f (f p - D.ε))) := by
  have hd : D.incomingBodyFoot b ≠ D.incomingBodyFoot b' :=
    fun heq => D.not_simplyConnected_of_same_bodyFoot b b' hne heq hs
  exact ⟨hd, D.levelFeet_disjoint_of_bodyFoot_ne b b' hd⟩

#print axioms trace_fibers_exact_pair
#print axioms native_trace_loop_bijective
#print axioms native_trace_merger_and_unrelated_component
#print axioms simply_connected_outgoing_requires_distinct_body_foot_components

/-- The ambient block crosses the whole lower seam. This tests every transverse
parameter in its open source, including parameters on and beyond the unit rim. -/
theorem edge_block_incoming_sides {q : U × V} (hq : q ∈ D.edgeBlockChart.source) :
    (f (D.edgeBlockChart q) < f p - D.ε ↔ 1 < ‖q.1‖) ∧
      (f p - D.ε < f (D.edgeBlockChart q) ↔ ‖q.1‖ < 1) := by
  rw [D.edgeBlockChart_height hq]
  have hε := D.ε_pos
  let A := D.ε + D.r ^ 2 * ‖q.2‖ ^ 2 / 2
  have hA : 0 < A := by dsimp only [A]; positivity
  have hn := norm_nonneg q.1
  have hbelow : f p - D.ε + (1 - ‖q.1‖ ^ 2) * A < f p - D.ε ↔ 1 < ‖q.1‖ := by
    constructor
    · intro h
      by_contra h'
      have hsq := (sq_le_sq₀ hn (by norm_num : (0 : ℝ) ≤ 1)).mpr (le_of_not_gt h')
      have hp := mul_nonneg (show 0 ≤ 1 - ‖q.1‖ ^ 2 by linarith) hA.le
      linarith
    · intro h
      have hsq := (sq_lt_sq₀ (by norm_num : (0 : ℝ) ≤ 1) hn).mpr h
      have hp := mul_neg_of_neg_of_pos (show 1 - ‖q.1‖ ^ 2 < 0 by linarith) hA
      linarith
  have habove : f p - D.ε < f p - D.ε + (1 - ‖q.1‖ ^ 2) * A ↔ ‖q.1‖ < 1 := by
    have hsign : 0 < 1 - ‖q.1‖ ^ 2 ↔ ‖q.1‖ < 1 := by
      rw [sub_pos]
      simpa only [one_pow] using (sq_lt_sq₀ hn (by norm_num : (0 : ℝ) ≤ 1))
    rw [lt_add_iff_pos_right, mul_pos_iff_of_pos_right hA, hsign]
  exact ⟨hbelow, habove⟩

theorem actual_lower_rim_height_and_inverse (b : CellBoundary 1) (z : CellBoundary 3) :
    let y := (cocoreAttachingEmbedding hk₁ (f p) D.ε D.r D.chart D.ε_pos D.attaching_radius
      (b, cellBoundaryInclusion 3 z)).val
    f y = f p - D.ε ∧ D.edgeBlockChart.symm y = (b.val, z.val) := by
  obtain ⟨hs, he, hi'⟩ := D.edgeBlockChart_nativeFoot b (cellBoundaryInclusion 3 z)
  constructor
  · rw [← he, D.edgeBlockChart_height hs, b.property]
    ring
  · exact hi'

theorem signed_outgoing_cut_iff (δ R₀ R₁ : ℝ) (h₀ : 0 ≤ R₀) (h₀₁ : R₀ < R₁)
    {x : M} (hx : x ∈ (D.roundedRimToOutgoing δ).source)
    (hcore : morseNorm 4 (D.chart.χ.symm x) ≤ R₀) :
    let T := D.roundedRimToOutgoing δ
    let g := morseRoundedFunction hk₁ (f p) D.ε D.r δ R₀ R₁ D.chart
    (g x = f p ↔ f (T x) = f p + D.ε) ∧
      (f (T x) < f p + D.ε ↔ g x < f p) ∧
      (f p + D.ε < f (T x) ↔ f p < g x) := by
  obtain ⟨hs, _, _⟩ := D.edgeBlockChart_signedOutgoing δ R₀ R₁ h₀ h₀₁ hx hcore
  dsimp only at hs ⊢
  exact ⟨⟨fun h => by linarith, fun h => by linarith⟩,
    ⟨fun h => by linarith, fun h => by linarith⟩, ⟨fun h => by linarith, fun h => by linarith⟩⟩

theorem signed_inverse_outgoing_level (δ R₀ R₁ : ℝ) (h₀ : 0 ≤ R₀) (h₀₁ : R₀ < R₁)
    {y : M} (hy : y ∈ (D.roundedRimToOutgoing δ).target)
    (hcore : morseNorm 4 (D.chart.χ.symm ((D.roundedRimToOutgoing δ).symm y)) ≤ R₀)
    (hlevel : f y = f p + D.ε) :
    let T := D.roundedRimToOutgoing δ
    let g := morseRoundedFunction hk₁ (f p) D.ε D.r δ R₀ R₁ D.chart
    g (T.symm y) = f p ∧ T (T.symm y) = y := by
  obtain ⟨hs, hi'⟩ := D.roundedRimToOutgoing_signed_inverse δ R₀ R₁ h₀ h₀₁ hy hcore
  exact ⟨by linarith, hi'⟩

/-- The outgoing comparison comes back to the entire signed incoming rim with
the original axial label and unit transverse parameter. -/
theorem full_native_rim_outgoing_round_trip (δ R₀ R₁ : ℝ)
    (hR₀ : Real.sqrt (2 * D.ε + 2 * D.r ^ 2) ≤ R₀) (h₀₁ : R₀ < R₁)
    (b : CellBoundary 1) (z : CellBoundary 3) :
    let x := D.edgeBlockChart (b.val, z.val)
    let T := D.roundedRimToOutgoing δ
    f (T x) = f p + D.ε ∧ D.edgeBlockChart.symm (T.symm (T x)) = (b.val, z.val) := by
  obtain ⟨_, hlevel, hinv⟩ := D.roundedRimToOutgoing_nativeRim δ R₀ R₁ hR₀ h₀₁ b z
  obtain ⟨_, hfoot, hfootInv⟩ := D.edgeBlockChart_nativeFoot b (cellBoundaryInclusion 3 z)
  exact ⟨hlevel, (congrArg (fun y => D.edgeBlockChart.symm y) (hinv.trans hfoot)).trans hfootInv⟩

theorem radial_comparison_excludes_zero_positive_radius (δ : ℝ) {y : MorseModel 4}
    (hy : morseNorm 4 y < 2 * D.chart.R) (haxis : posPart hk₁ y = 0) :
    D.chart.χ y ∉ (D.roundedRimToOutgoing δ).source := by
  intro h
  have hpos := ((D.roundedRimToOutgoing_mem_source δ hy).mp h).1
  rw [haxis, norm_zero] at hpos
  norm_num at hpos

#print axioms edge_block_incoming_sides
#print axioms actual_lower_rim_height_and_inverse
#print axioms signed_outgoing_cut_iff
#print axioms signed_inverse_outgoing_level
#print axioms full_native_rim_outgoing_round_trip
#print axioms radial_comparison_excludes_zero_positive_radius

/-- On one common signed strip, both entire marked rims remain in the collar
and each point has its complete pair of coordinates after the inverse. -/
theorem full_native_rims_collared_round_trip [T2Space M] [CompactSpace M]
    (δ R₀ R₁ : ℝ) (hR₀ : Real.sqrt (2 * D.ε + 2 * D.r ^ 2) < R₀) (h₀₁ : R₀ < R₁) :
    let c := f p + D.ε
    letI := manifoldLevelSetChartedSpace J f c hf D.upper_regular
    let L := LevelSetSpace f c
    let K := ModelWithCorners.prod 𝓘(ℝ, MorseModel 3) 𝓘(ℝ, ℝ)
    let β := D.roundedRimOutgoingPoint δ R₀ R₁ hR₀.le h₀₁
    let rounded := morseRoundedFunction hk₁ (f p) D.ε D.r δ R₀ R₁ D.chart
    ∃ (w : ℝ) (Ψ : PartialDiffeomorph K J (L × ℝ) M ∞),
      0 < w ∧ w ≤ D.ε / 2 ∧
      ∀ (a : CellBoundary 1 × CellBoundary 3) t, t ∈ Ioo (-w) w →
        (β a,t) ∈ Ψ.source ∧ rounded (Ψ (β a,t)) = f p + t ∧
        Ψ.symm (Ψ (β a,t)) = (β a,t) := by
  dsimp only
  obtain ⟨_, _, Ψ, _, w, hw, _, hwε, _, hrange, _, _, _, _, _, hS, hforward, _, _⟩ :=
    D.exists_roundedOutgoingCollar_nearNativeRims δ R₀ R₁ hR₀ h₀₁
  refine ⟨w, Ψ, hw, hwε, fun a t ht => ?_⟩
  have hs : (D.roundedRimOutgoingPoint δ R₀ R₁ hR₀.le h₀₁ a,t) ∈ Ψ.source := by
    rw [hS]
    exact ⟨hrange (mem_range_self a), ht⟩
  exact ⟨hs, (hforward _ hs).2.2, Ψ.left_inv hs⟩

#print axioms full_native_rims_collared_round_trip

/-- Test every parameter of a marked level tube over the whole open strip,
with the same signed parameter in the outgoing and inverse formulas. -/
theorem full_tube_outgoing_signed_transport [T2Space M] [CompactSpace M] {Z : Type*}
    (u : Z → LevelSetSpace f (f p + D.ε))
    (hunique : ∀ x, f x ∈ Icc lo hi → IsCriticalPointAt J f x → x = p) :
    ∃ (r : ℝ) (T : PartialDiffeomorph J J M M ∞)
      (A : LevelSetSpace f (f p + D.ε) × ℝ → M) (B : LevelSetSpace f hi × ℝ → M)
      (d : LevelSetSpace f (f p + D.ε) ≃ LevelSetSpace f hi),
      0 < r ∧ r ≤ D.ε / 2 ∧
      (∀ z t, t ∈ Ioo (-r) r →
        T (A (u z,t)) = B (d (u z),t) ∧ T.symm (B (d (u z),t)) = A (u z,t) ∧
        f (T (A (u z,t))) - hi = t ∧ -f (T (A (u z,t))) - (-hi) = -t) := by
  let := manifoldLevelSetChartedSpace J f (f p + D.ε) hf D.upper_regular
  let := manifoldLevelSetChartedSpace J f hi hf (D.outgoingNextCut_regular hunique)
  obtain ⟨r, _, d, A, B, T, hr, hrε, _, _, _, _, _, _, _, _, _, _, hB, hT, hTi, _, _⟩ :=
    D.exists_outgoingSignedBandTransport hunique
  refine ⟨r, T, A, B, d.toEquiv, hr, hrε, fun z t ht => ?_⟩
  have hb := hB (d (u z), t) ht
  refine ⟨hT _ _ ht, ?_, ?_, ?_⟩
  · simpa only [Diffeomorph.coe_toEquiv, Diffeomorph.symm_apply_apply] using hTi (d (u z)) t ht
  · rw [hT _ _ ht, hb]
    ring
  · rw [hT _ _ ht, hb]
    ring

theorem actual_birth_boundary_round_trip [T2Space M] (D₀ : IsolatedZeroHandle hf p lo hi)
    (y : M) (hy : y ∈ connectedComponentIn {x | f x ≤ f p + D₀.ε} p)
    (hlevel : f y = f p + D₀.ε) :
    D₀.birthBodyChart.symm y ∈ Metric.sphere 0 1 ∧ D₀.birthBodyChart (D₀.birthBodyChart.symm y) = y := by
  obtain ⟨z, hz, rfl⟩ := D₀.birthBodyChart_component.2.symm ▸
    (show y ∈ connectedComponentIn {x | f x ≤ f p + D₀.ε} p ∩
      {x | f x = f p + D₀.ε} from ⟨hy, hlevel⟩)
  have hs := D₀.birthBodyChart_closedBall_two ((Metric.closedBall_subset_closedBall
    (show (1 : ℝ) ≤ 2 by norm_num)) (Metric.sphere_subset_closedBall hz))
  have hi' := D₀.birthBodyChart.left_inv hs
  exact ⟨hi'.symm ▸ hz, congrArg (fun w => D₀.birthBodyChart w) hi'⟩

theorem transported_birth_ball_round_trip [T2Space M] [CompactSpace M] (D₀ : IsolatedZeroHandle hf p lo hi)
    {u : ℝ} (hcu : f p + D₀.ε ≤ u)
    (hregular : ∀ x, f x ∈ Icc (f p + D₀.ε) u → ¬ IsCriticalPointAt J f x) :
    let W := EuclideanSpace ℝ (Fin 4)
    ∃ (Φ : M ≃ₘ^∞⟮J,J⟯ M) (G : PartialDiffeomorph 𝓘(ℝ, W) J W M ∞),
      (∀ z ∈ Metric.closedBall (0 : W) 1, G.symm (Φ (D₀.birthBodyChart z)) = z) ∧
      G '' Metric.sphere (0 : W) 1 = connectedComponentIn {y | f y ≤ u} (Φ p) ∩ {y | f y = u} := by
  obtain ⟨Φ, G, hS, hG, _, _, hboundary⟩ := D₀.exists_transportedBirthBody hcu hregular
  refine ⟨Φ, G, ?_, hboundary⟩
  intro z hz
  have hs := hS (Metric.closedBall_subset_closedBall (by norm_num : (1 : ℝ) ≤ 2) hz)
  exact (congrArg (fun y => G.symm y) (hG z).symm).trans (G.left_inv hs)

#print axioms full_tube_outgoing_signed_transport
#print axioms actual_birth_boundary_round_trip
#print axioms transported_birth_ball_round_trip

end NativeBand

end RoundedEdgeReadback
