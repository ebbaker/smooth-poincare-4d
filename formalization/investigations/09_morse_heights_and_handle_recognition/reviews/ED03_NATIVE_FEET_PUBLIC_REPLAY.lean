import SmoothPoincare

open DifferentialGeometry.Topology DifferentialGeometry.Topology.Morse SmoothPoincare Set
open scoped ContDiff Manifold



#check IsolatedEndHandle.traceDiffeomorph
#print axioms IsolatedEndHandle.traceDiffeomorph
#check IsolatedEndHandle.deep_lower_preimage
#print axioms IsolatedEndHandle.deep_lower_preimage
#check IsolatedZeroHandle.handle_smooth
#print axioms IsolatedZeroHandle.handle_smooth
#check IsolatedOneHandle.handle_smooth
#print axioms IsolatedOneHandle.handle_smooth
#check exists_isolatedZeroHandle
#print axioms exists_isolatedZeroHandle
#check exists_isolatedOneHandle
#print axioms exists_isolatedOneHandle
#check IsolatedOneHandle.attachingFeet_smooth
#print axioms IsolatedOneHandle.attachingFeet_smooth
#check IsolatedOneHandle.attachingFeet_isClosedEmbedding
#print axioms IsolatedOneHandle.attachingFeet_isClosedEmbedding
#check zeroHandle_attachingRegion_isEmpty
#print axioms zeroHandle_attachingRegion_isEmpty

#check (leafCylinderHomeomorph 3 : LeafAdjunction 3 ≃ₜ leafCylinder 3)
#print axioms leafCylinderHomeomorph
#check leafCylinderHomeomorph_left
#print axioms leafCylinderHomeomorph_left
#check leafCylinderHomeomorph_cell
#print axioms leafCylinderHomeomorph_cell
#check leafCylinderHomeomorph_right
#print axioms leafCylinderHomeomorph_right

theorem checked_negative_foot_exit (p : Handle.AttachingRegion 1 3) (hneg : p.1.val 0 < 0) :
    let e := leafCylinderHomeomorph 3
    let a := leafAttachment 3
    let q := e (Handle.cell a (Handle.attachingInclusion 1 3 p))
    q.val.2 = -1 ∧
      e.symm q = Handle.lower a (a p) := by
  have hp : |(p.1.val : EuclideanSpace ℝ (Fin 1)) 0| = 1 := by
    have hp := EuclideanSpace.norm_sq_eq p.1.val
    rw [p.1.property, Fin.sum_univ_one, Real.norm_eq_abs] at hp
    exact (sq_eq_sq₀ (abs_nonneg _) zero_le_one).mp hp.symm
  change p.1.val 0 < 0 at hneg
  rw [abs_of_neg hneg] at hp
  dsimp only
  constructor
  · rw [leafCylinderHomeomorph_cell]
    change p.1.val 0 = -1
    linarith
  · rw [Homeomorph.symm_apply_apply]
    exact adjunction_coherence (Handle.attachingInclusion 1 3) (leafAttachment 3) p

#print axioms checked_negative_foot_exit

#check EndHandleFiltration.step
#print axioms EndHandleFiltration.step
#check EndHandleFiltration.cuts_below
#print axioms EndHandleFiltration.cuts_below
#check EndHandleFiltration.critical_points
#print axioms EndHandleFiltration.critical_points
#check EndHandleFiltration.terminal_transport
#print axioms EndHandleFiltration.terminal_transport
#check exists_endHandleFiltration
#print axioms exists_endHandleFiltration
#check exists_orderedEndHandleFiltrations
#print axioms exists_orderedEndHandleFiltrations
#check exists_leafBallHomeomorph 3
#print axioms exists_leafBallHomeomorph
#check exists_leafBallTransport 3
#print axioms exists_leafBallTransport

noncomputable def checkedAxialEndMark (p : Handle.AttachingRegion 1 3) : LeafBoundary 3 := by
  let t : ℝ := if p.1.val 0 < 0 then -3 else 3
  let q : leafCylinder 3 := ⟨(p.2.val, t), mem_closedBall_zero_iff.mpr p.2.property,
    by dsimp [t]; split <;> norm_num⟩
  refine ⟨q.val, (mem_leafCylinder_frontier_iff (n := 2) q).mpr ?_⟩
  change ‖p.2.val‖ = 1 ∨ t = -3 ∨ t = 3
  right
  dsimp [t]
  split <;> simp

theorem checked_native_surviving_handle_round_trip :
    let a := checkedAxialEndMark
    let i := Handle.attachingInclusion 1 3
    ∃ (b : LeafBoundary 3 ≃ₜ CellBoundary 4)
      (s : AdjunctionSpace i (leafBoundaryInclusion 3 ∘ a) ≃ₜ
        AdjunctionSpace i (cellBoundaryInclusion 4 ∘ b ∘ a)),
      (∀ p, s (adjunctionLower (leafBoundaryInclusion 3 ∘ a) (leafBoundaryInclusion 3 (a p))) =
        adjunctionCell i (cellBoundaryInclusion 4 ∘ b ∘ a) (i p)) ∧
      (∀ h, s.symm (adjunctionCell i (cellBoundaryInclusion 4 ∘ b ∘ a) h) =
        adjunctionCell i (leafBoundaryInclusion 3 ∘ a) h) := by
  dsimp only
  obtain ⟨e, b, s, η', hη', hcell, hlower⟩ :=
    exists_leafBallTransport 3 (Handle.attachingInclusion 1 3) checkedAxialEndMark
      (Homeomorph.refl (LeafBoundary 3))
  refine ⟨b, s, ?_, ?_⟩
  · intro p
    have hc := adjunction_coherence (Handle.attachingInclusion 1 3)
      (leafBoundaryInclusion 3 ∘ checkedAxialEndMark) p
    exact (congrArg s hc).symm.trans (hcell _)
  · intro h
    apply s.injective
    rw [Homeomorph.apply_symm_apply]
    exact (hcell h).symm

#print axioms checked_native_surviving_handle_round_trip

#check exists_roundLeafAdjunction 2
#print axioms exists_roundLeafAdjunction


#check regularEndLevelInclusion
#print axioms regularEndLevelInclusion
#check RegularEndMarked
#print axioms RegularEndMarked
#check regularEndMarked_of_image_eq
#print axioms regularEndMarked_of_image_eq
#check exists_regularBandEndMarked
#print axioms exists_regularBandEndMarked
#check RegularEndMarked.exists_tubeTransport
#print axioms RegularEndMarked.exists_tubeTransport

theorem checked_reverse_actual_regular_mark {H M : Type}
    [TopologicalSpace H] [TopologicalSpace M] [ChartedSpace H M]
    {I : ModelWithCorners ℝ (MorseModel 4) H} [I.Boundaryless] [IsManifold I ∞ M]
    {f g : M → ℝ} {a b : ℝ}
    {hf : ContMDiff I 𝓘(ℝ, ℝ) ∞ f} {hg : ContMDiff I 𝓘(ℝ, ℝ) ∞ g}
    {ha : ∀ x, f x = a → ¬ IsCriticalPointAt I f x}
    {hb : ∀ x, g x = b → ¬ IsCriticalPointAt I g x}
    {Φ : M ≃ₘ^∞⟮I, I⟯ M} (P : RegularEndMarked hf hg ha hb Φ) :
    RegularEndMarked hg hf hb ha Φ.symm := by
  let := manifoldSublevelChartedSpace I f a hf ha
  let := manifoldSublevelChartedSpace I g b hg hb
  let := manifoldLevelSetChartedSpace I f a hf ha
  let := manifoldLevelSetChartedSpace I g b hg hb
  obtain ⟨s, l, hs, hsi, hl, hli, hc, hci, hfa, hgb⟩ := P
  exact ⟨s.symm, l.symm, hsi, hs, hli, hl, hci, hc, hgb, hfa⟩

#print axioms checked_reverse_actual_regular_mark

#check zeroHandle_adjunctionHomeomorph
#print axioms zeroHandle_adjunctionHomeomorph
#check IsolatedZeroHandle.birthHomeomorph
#print axioms IsolatedZeroHandle.birthHomeomorph
#check orderedCriticalPartition
#print axioms orderedCriticalPartition
#check exists_selectedEndHandlePresentation_of_inducedEnergy_le
#print axioms exists_selectedEndHandlePresentation_of_inducedEnergy_le

theorem checked_disjoint_birth_coordinates {X : Type} [TopologicalSpace X]
    (φ : Handle.AttachingRegion 0 4 → X) (d : ClosedCell 4) (x : X) :
    let e := zeroHandle_adjunctionHomeomorph φ
    e (Handle.cell φ (closedCellCenter 0, d)) = Sum.inl d ∧
    e.symm (Sum.inl d) = Handle.cell φ (closedCellCenter 0, d) ∧
    e (Handle.lower φ x) = Sum.inr x ∧
    e.symm (Sum.inr x) = Handle.lower φ x := by
  exact ⟨rfl, rfl, rfl, rfl⟩
#print axioms checked_disjoint_birth_coordinates

#check @HasRegularLevelTransport.exists_nativeMarked
#print axioms HasRegularLevelTransport.exists_nativeMarked
#check @nativeRegularComparison_apply
#print axioms nativeRegularComparison_apply
#check @nativeRegularComparison_symm_apply
#print axioms nativeRegularComparison_symm_apply
#check @nativeOppositeLevelDiffeomorph
#print axioms nativeOppositeLevelDiffeomorph
#check @IsolatedOneHandle.radiusTwo_modelPoint_mem_and_value
#print axioms IsolatedOneHandle.radiusTwo_modelPoint_mem_and_value

/-- The normalized outgoing marking and its inverse on the genuine flattened leaf frontier. -/
theorem checked_axial_outgoing_marking_round_trip {Z : Type} [TopologicalSpace Z]
    (η : Z ≃ₜ LeafBoundary 3) :
    ∃ (b : LeafBoundary 3 ≃ₜ CellBoundary 4) (η' : Z ≃ₜ CellBoundary 4),
      (∀ z, η' z = b (η z)) ∧ (∀ y, η'.symm y = η.symm (b.symm y)) := by
  obtain ⟨_, b, _, η', hη', _, _⟩ := exists_leafBallTransport 3
    (Handle.attachingInclusion 1 3) checkedAxialEndMark η
  refine ⟨b, η', hη', fun y => η'.injective ?_⟩
  rw [η'.apply_symm_apply, hη', η.apply_symm_apply, b.apply_symm_apply]

#print axioms checked_axial_outgoing_marking_round_trip

section NativeFootCheck

open DifferentialGeometry.Topology.Morse.CellAttachment
open DifferentialGeometry.Topology.Morse.ManifoldCellAttachment

#check @IsolatedOneHandle.footPartialDiffeomorph
#print axioms IsolatedOneHandle.footPartialDiffeomorph
#check @IsolatedOneHandle.footPartialDiffeomorph_closedBall_two_subset_source
#print axioms IsolatedOneHandle.footPartialDiffeomorph_closedBall_two_subset_source
#check @IsolatedOneHandle.footPartialDiffeomorph_apply_closedCell
#print axioms IsolatedOneHandle.footPartialDiffeomorph_apply_closedCell
#check @IsolatedOneHandle.footPartialDiffeomorph_apply_nativeAttaching
#print axioms IsolatedOneHandle.footPartialDiffeomorph_apply_nativeAttaching
#check @IsolatedOneHandle.footPartialDiffeomorph_symm_apply
#print axioms IsolatedOneHandle.footPartialDiffeomorph_symm_apply
#check @IsolatedOneHandle.footPartialDiffeomorph_disjoint
#print axioms IsolatedOneHandle.footPartialDiffeomorph_disjoint
#check @IsolatedOneHandle.footEuclideanChart
#print axioms IsolatedOneHandle.footEuclideanChart
#check @IsolatedOneHandle.footLevelEuclidean_isManifold
#print axioms IsolatedOneHandle.footLevelEuclidean_isManifold
#check @IsolatedOneHandle.footEuclideanChart_apply
#print axioms IsolatedOneHandle.footEuclideanChart_apply
#check @IsolatedOneHandle.exists_relativeFootIsotopy
#print axioms IsolatedOneHandle.exists_relativeFootIsotopy
#check @exists_relativeFootSignedCollarComparison
#print axioms exists_relativeFootSignedCollarComparison
#check @IsolatedOneHandle.footComponentChart
#print axioms IsolatedOneHandle.footComponentChart
#check @IsolatedOneHandle.footComponent_connectedSpace
#print axioms IsolatedOneHandle.footComponent_connectedSpace
#check @IsolatedOneHandle.footComponentPoint_val
#print axioms IsolatedOneHandle.footComponentPoint_val
#check @IsolatedOneHandle.exists_relativeFootComponentIsotopy
#print axioms IsolatedOneHandle.exists_relativeFootComponentIsotopy
#check @IsolatedOneHandle.footComponentOrientedChart
#print axioms IsolatedOneHandle.footComponentOrientedChart
#check @exists_orientedFootChart
#print axioms exists_orientedFootChart
#check @exists_bufferedFootSignedCollarComparison
#print axioms exists_bufferedFootSignedCollarComparison
#check @IsolatedOneHandle.exists_orientedNativeFootComponentChart
#print axioms IsolatedOneHandle.exists_orientedNativeFootComponentChart
#check @exists_nativeSignedHeightCollar
#print axioms exists_nativeSignedHeightCollar
#check @IsolatedOneHandle.outgoingAxisPoint
#print axioms IsolatedOneHandle.outgoingAxisPoint
#check @IsolatedOneHandle.exists_outgoingSignedHeightCollar
#print axioms IsolatedOneHandle.exists_outgoingSignedHeightCollar
#check @IsolatedOneHandle.exists_outgoingMarkedComparison
#print axioms IsolatedOneHandle.exists_outgoingMarkedComparison
#check @SupportedLevelIsotopy.exists_ambientSignedCollarDiffeomorph
#print axioms SupportedLevelIsotopy.exists_ambientSignedCollarDiffeomorph
#check @IsolatedOneHandle.exists_footComponentHeightCollar
#print axioms IsolatedOneHandle.exists_footComponentHeightCollar
#check @IsolatedOneHandle.exists_ambientNativeFootNormalization
#print axioms IsolatedOneHandle.exists_ambientNativeFootNormalization
#check @protectedFootBalls_compact_and_compl_preconnected
#print axioms protectedFootBalls_compact_and_compl_preconnected
#check @exists_relativeFootLevelIsotopy_awayFromFiniteFeet
#print axioms exists_relativeFootLevelIsotopy_awayFromFiniteFeet

variable {H M : Type} [TopologicalSpace H] [TopologicalSpace M] [ChartedSpace H M]
  {J : ModelWithCorners ℝ (MorseModel 4) H} [J.Boundaryless] [IsManifold J ∞ M]
  {f : M → ℝ} {hf : ContMDiff J 𝓘(ℝ, ℝ) ∞ f} {p : M} {lo hi : ℝ}

theorem checked_included_native_foot_round_trip (D : IsolatedOneHandle hf p lo hi)
    (b : CellBoundary 1) (z : ClosedCell 3) :
    let k : (1 : ℕ) ≤ 4 := by decide
    letI := manifoldLevelSetChartedSpace J f (f p - D.ε) hf D.lower_regular
    let e := D.footPartialDiffeomorph b
    let incl := regularEndLevelInclusion f (f p - D.ε)
    incl (e z.val) = morseAttachingEmbedding k (f p) D.ε D.r D.chart D.ε_pos
      D.attaching_radius (b, z) ∧
    e.symm (cocoreAttachingEmbedding k (f p) D.ε D.r D.chart D.ε_pos
      D.attaching_radius (b, z)) = z.val ∧
    D.footTransverse (e z.val) = z.val := by
  dsimp only
  let := manifoldLevelSetChartedSpace J f (f p - D.ε) hf D.lower_regular
  have hz : z.val ∈ Metric.closedBall (0 : EuclideanSpace ℝ (Fin 3)) 2 := by
    rw [Metric.mem_closedBall, dist_zero_right]
    exact z.property.trans (by norm_num)
  have h := PartialDiffeomorph.symm_apply_apply (D.footPartialDiffeomorph b)
    (D.footPartialDiffeomorph_closedBall_two_subset_source b hz)
  refine ⟨Subtype.ext (D.footPartialDiffeomorph_apply_nativeAttaching b z), ?_, ?_⟩
  · rw [← D.footPartialDiffeomorph_apply_closedCell]
    exact h
  · rw [← D.footPartialDiffeomorph_symm_apply b]
    exact h

#print axioms checked_included_native_foot_round_trip

open DifferentialGeometry DifferentialGeometry.PDE.RicciFlow.Surgery.Topology

local notation "V₃f" => EuclideanSpace ℝ (Fin 3)
local notation "I₃f" => 𝓘(ℝ, V₃f)

theorem checked_actual_and_normalized_foot_collar [T2Space M]
    (D : IsolatedOneHandle hf p lo hi) (s : CellBoundary 1) (U : V₃f ≃ₗᵢ[ℝ] V₃f)
    [PreconnectedSpace (LevelSetSpace f (f p - D.ε))] :
    let k : (1 : ℕ) ≤ 4 := by decide
    let L := LevelSetSpace f (f p - D.ε)
    letI := D.footLevelEuclideanCharts
    letI := D.footLevelEuclidean_isManifold
    ∀ (o : ManifoldOrientation I₃f L 3) (e e' : OrientedBallEmbedding L o) (C : Set L),
      (∀ z ∈ Metric.closedBall (0 : V₃f) 1, e.chart (U z) = D.footEuclideanChart s z) →
      IsCompact C → IsPreconnected Cᶜ →
      Disjoint (e.chart '' Metric.closedBall (0 : V₃f) 1) C →
      Disjoint (e'.chart '' Metric.closedBall (0 : V₃f) 1) C →
      ∀ (χ ψ : PartialDiffeomorph (ModelWithCorners.prod I₃f 𝓘(ℝ, ℝ)) J (L × ℝ) M ∞)
        (a b r : ℝ), 0 < a → a < b → b < r →
        χ.source = {q | q.2 ∈ Ioo (-r) r} → ψ.source = {q | q.2 ∈ Ioo (-r) r} →
        ∃ Φ : PartialDiffeomorph J J M M ∞,
          Φ.source = χ.target ∧ Φ.target = ψ.target ∧
          (∀ (z : ClosedCell 3) (t : ℝ), |t| ≤ a →
            let x := cocoreAttachingEmbedding k (f p) D.ε D.r D.chart D.ε_pos
              D.attaching_radius (s, z)
            let y := e'.chart (U z.val)
            Φ (χ (x, t)) = ψ (y, t) ∧ Φ.symm (ψ (y, t)) = χ (x, t)) ∧
          (∀ τ : Handle.AttachingRegion 2 2 → L × ℝ, (∀ z, (τ z).2 ∈ Ioo (-r) r ∧ (τ z).1 ∈ C) →
            ∀ z, Φ (χ (τ z)) = ψ (τ z) ∧ Φ.symm (ψ (τ z)) = χ (τ z)) := by
  dsimp only
  let := D.footLevelEuclideanCharts
  let := D.footLevelEuclidean_isManifold
  intro o e e' C hfit hC hcont he he' χ ψ a b r ha hab hbr hχ hψ
  obtain ⟨Φ, hsource, htarget, hmarked, hprotected⟩ :=
    exists_relativeFootSignedCollarComparison o e e' C hC hcont he he' χ ψ ha hab hbr hχ hψ
  refine ⟨Φ, hsource, htarget, ?_, fun τ hτ z =>
    hprotected (τ z) (hτ z).1 (Or.inl (hτ z).2)⟩
  intro z t ht
  have hz : z.val ∈ Metric.closedBall (0 : V₃f) 1 := by
    rw [Metric.mem_closedBall, dist_zero_right]
    exact z.property
  have hUz : U z.val ∈ Metric.closedBall (0 : V₃f) 1 := by
    rw [Metric.mem_closedBall, dist_zero_right, U.norm_map]
    exact z.property
  have hNative := (hfit z.val hz).trans
    ((D.footEuclideanChart_apply s z.val).trans (D.footPartialDiffeomorph_apply_closedCell s z))
  simpa only [hNative] using hmarked (U z.val) hUz t ht

#print axioms checked_actual_and_normalized_foot_collar

theorem checked_component_native_mark_and_inverse (D : IsolatedOneHandle hf p lo hi)
    (s : CellBoundary 1) (z : ClosedCell 3) :
    let k : (1 : ℕ) ≤ 4 := by decide
    letI := D.footLevelEuclideanCharts
    let e := D.footComponentChart s
    let x := D.footComponentPoint s z
    regularEndLevelInclusion f (f p - D.ε) x.val =
      morseAttachingEmbedding k (f p) D.ε D.r D.chart D.ε_pos D.attaching_radius (s, z) ∧
      e.symm x = z.val := by
  dsimp only
  refine ⟨?_, D.footComponentChart_symm_point s z⟩
  rw [D.footComponentPoint_val]
  rfl

#print axioms checked_component_native_mark_and_inverse

theorem checked_component_relative_signed_foot [T2Space M]
    (D : IsolatedOneHandle hf p lo hi) (s : CellBoundary 1) (U : V₃f ≃ₗᵢ[ℝ] V₃f)
    {a b : ℝ} (ha : 0 < a) (hab : a < b) :
    let L := D.footComponent s
    letI := D.footLevelEuclideanCharts
    letI := D.footComponent_isManifold s
    ∀ (o : ManifoldOrientation I₃f L 3) (e e' : OrientedBallEmbedding L o)
      (C : Set L),
      (∀ z ∈ Metric.closedBall (0 : V₃f) 1, e.chart (U z) = D.footComponentChart s z) →
      IsCompact C → IsPreconnected Cᶜ →
      Disjoint (e.chart '' Metric.closedBall (0 : V₃f) 1) C →
      Disjoint (e'.chart '' Metric.closedBall (0 : V₃f) 1) C →
      ∃ A : SupportedLevelIsotopy I₃f C,
        (∀ (z : ClosedCell 3) (t : ℝ), |t| ≤ a →
          let P := A.signedCollarDiffeomorph a b
          P (D.footComponentPoint s z, t) = (e'.chart (U z.val), t) ∧
          P.symm (e'.chart (U z.val), t) = (D.footComponentPoint s z, t)) ∧
        (∀ (x : L) (t : ℝ), x ∈ C →
          let P := A.signedCollarDiffeomorph a b
          P (x, t) = (x, t) ∧ P.symm (x, t) = (x, t)) := by
  dsimp only
  let := D.footLevelEuclideanCharts
  let := D.footComponent_isManifold s
  intro o e e' C hfit hC hconn he he'
  obtain ⟨A, hmark⟩ := D.exists_relativeFootComponentIsotopy s U o e e' C
    hfit hC hconn he he'
  refine ⟨A, ?_, fun x t hx => A.signedCollarDiffeomorph_fixes_protected a b (p := (x, t)) hx⟩
  intro z t ht
  constructor
  · rw [(A.signedCollarDiffeomorph_eq_endpoint ha hab
      (p := (D.footComponentPoint s z, t)) ht).1, (hmark z).1]
  · rw [(A.signedCollarDiffeomorph_eq_endpoint ha hab
      (p := (e'.chart (U z.val), t)) ht).2, (hmark z).2]

#print axioms checked_component_relative_signed_foot

theorem checked_finite_protected_feet_in_every_signed_slice
    {L ι : Type*} [TopologicalSpace L] [ChartedSpace V₃f L] [IsManifold I₃f ∞ L]
    [T2Space L] [PreconnectedSpace L] [Finite ι]
    (o : ManifoldOrientation I₃f L 3) (e e' : OrientedBallEmbedding L o)
    (feet : ι → OrientedBallEmbedding L o)
    (hdisj : ∀ i j, i ≠ j → Disjoint ((feet i).chart '' Metric.closedBall 0 1)
      ((feet j).chart '' Metric.closedBall 0 1))
    (he : ∀ i, Disjoint (e.chart '' Metric.closedBall 0 1)
      ((feet i).chart '' Metric.closedBall 0 1))
    (he' : ∀ i, Disjoint (e'.chart '' Metric.closedBall 0 1)
      ((feet i).chart '' Metric.closedBall 0 1))
    (a b : ℝ) :
    ∃ A : SupportedLevelIsotopy I₃f (⋃ i, (feet i).chart '' Metric.closedBall 0 1),
      ∀ i z, z ∈ Metric.closedBall 0 1 → ∀ t : ℝ,
        let P := A.signedCollarDiffeomorph a b
        P ((feet i).chart z, t) = ((feet i).chart z, t) ∧
        P.symm ((feet i).chart z, t) = ((feet i).chart z, t) := by
  obtain ⟨A, _⟩ := exists_relativeFootLevelIsotopy_awayFromFiniteFeet o e e' feet hdisj he he'
  refine ⟨A, fun i z hz t => A.signedCollarDiffeomorph_fixes_protected a b
    (p := ((feet i).chart z, t)) ?_⟩
  exact Set.mem_iUnion.mpr ⟨i, ⟨z, hz, rfl⟩⟩

#print axioms checked_finite_protected_feet_in_every_signed_slice

theorem checked_oriented_native_foot_choice_round_trip [T2Space M] [CompactSpace M]
    (D : IsolatedOneHandle hf p lo hi) (s : CellBoundary 1) :
    letI := D.footLevelEuclideanCharts
    letI := D.footComponent_isManifold s
    ∀ o : ManifoldOrientation I₃f (D.footComponent s) 3,
      ∃ (A : V₃f ≃ₗᵢ[ℝ] V₃f) (e : OrientedBallEmbedding (D.footComponent s) o),
        (A = LinearIsometryEquiv.refl ℝ V₃f ∨ A = LinearIsometryEquiv.neg ℝ) ∧
        ∀ z : ClosedCell 3, e.chart (A z.val) = D.footComponentPoint s z ∧
          e.chart.symm (D.footComponentPoint s z) = A z.val := by
  let := D.footLevelEuclideanCharts
  let := D.footComponent_isManifold s
  intro o
  obtain ⟨A, e, hA, hmark, _⟩ := D.exists_orientedNativeFootComponentChart s o
  refine ⟨A, e, hA, fun z => ⟨hmark z, ?_⟩⟩
  rw [← hmark z]
  apply e.chart.symm_apply_apply
  apply e.closedBall_subset_source
  rw [Metric.mem_closedBall, dist_zero_right, A.norm_map]
  exact z.property.trans (by norm_num)

#print axioms checked_oriented_native_foot_choice_round_trip

theorem checked_native_height_collar_and_reversal [T2Space M] [CompactSpace M]
    {c : ℝ} (hc : ∀ x, f x = c → ¬ IsCriticalPointAt J f x) (x₀ : LevelSetSpace f c) :
    letI := manifoldLevelSetChartedSpace J f c hf hc
    ∃ r > (0 : ℝ), ∃ B : PartialDiffeomorph ((𝓘(ℝ, MorseModel 3)).prod 𝓘(ℝ, ℝ)) J
        (LevelSetSpace f c × ℝ) M ∞,
      B.source = {p | p.2 ∈ Ioo (-r) r} ∧ B.target = f ⁻¹' Ioo (c-r) (c+r) ∧
      (∀ x : LevelSetSpace f c, B (x, 0) = x.val ∧ B.symm x.val = (x, 0)) ∧
      (∀ p ∈ B.source, f (B p) - c = p.2 ∧ -f (B p) - (-c) = -p.2 ∧ B.symm (B p) = p) ∧
      (∀ y ∈ B.target, (B.symm y).2 = f y - c ∧ -(B.symm y).2 = -f y - (-c) ∧ B (B.symm y) = y) := by
  let := manifoldLevelSetChartedSpace J f c hf hc
  obtain ⟨r, hr, B, hs, ht, hzero, hsign, hsignInv⟩ := exists_nativeSignedHeightCollar hf hc x₀
  refine ⟨r, hr, B, hs, ht, ?_, ?_, ?_⟩
  · intro x
    refine ⟨hzero x, ?_⟩
    have hx : (x, 0) ∈ B.source := by rw [hs]; exact ⟨by linarith, hr⟩
    rw [← hzero x]
    exact B.symm_apply_apply hx
  · intro p hp
    have h := hsign p hp
    exact ⟨by linarith, by linarith, B.symm_apply_apply hp⟩
  · intro y hy
    have h := hsignInv y hy
    exact ⟨h, by linarith, B.apply_symm_apply hy⟩

#print axioms checked_native_height_collar_and_reversal

theorem checked_actual_step_outgoing_mark_round_trip [T2Space M] [CompactSpace M]
    (D : IsolatedOneHandle hf p lo hi)
    (hunique : ∀ x, f x ∈ Icc lo hi → IsCriticalPointAt J f x → x = p) :
    let c := f p + D.ε
    let hreg : ∀ x, f x = hi → ¬ IsCriticalPointAt J f x :=
      fun x hx => D.outgoingBand_regular hunique x (hx.symm ▸ ⟨D.upper_inside.le, le_rfl⟩)
    letI := manifoldLevelSetChartedSpace J f c hf D.upper_regular
    letI := manifoldLevelSetChartedSpace J f hi hf hreg
    letI := manifoldSublevelChartedSpace J f c hf D.upper_regular
    letI := manifoldSublevelChartedSpace J f hi hf hreg
    ∃ (s : SublevelSpace f c ≃ₘ^∞⟮morseModelWithCornersHalfSpace 3,
        morseModelWithCornersHalfSpace 3⟯ SublevelSpace f hi)
      (l : LevelSetSpace f c ≃ₘ^∞⟮𝓘(ℝ, MorseModel 3), 𝓘(ℝ, MorseModel 3)⟯ LevelSetSpace f hi),
      (∀ x, s (regularEndLevelInclusion f c x) = regularEndLevelInclusion f hi (l x)) ∧
      (∀ y, s.symm (regularEndLevelInclusion f hi y) = regularEndLevelInclusion f c (l.symm y)) := by
  dsimp only
  obtain ⟨_, s, l, _, _, _, _, h, hi', _, _⟩ := D.exists_outgoingMarkedComparison hunique
  exact ⟨s, l, h, hi'⟩

#print axioms checked_actual_step_outgoing_mark_round_trip

theorem checked_ambient_motion_preserves_native_height_and_tube [T2Space M] [CompactSpace M]
    {c : ℝ} (hc : ∀ x, f x = c → ¬ IsCriticalPointAt J f x) (x₀ : LevelSetSpace f c) :
    let L := LevelSetSpace f c
    letI := manifoldLevelSetChartedSpace J f c hf hc
    let I₃ := 𝓘(ℝ, MorseModel 3)
    ∀ (C : Set L) (_A : SupportedLevelIsotopy I₃ C),
      ∃ r > (0 : ℝ), ∃ (χ : PartialDiffeomorph (I₃.prod 𝓘(ℝ, ℝ)) J (L × ℝ) M ∞)
        (F : M ≃ₘ^∞⟮J, J⟯ M),
        χ.source = {p | p.2 ∈ Ioo (-r) r} ∧ χ.target = f ⁻¹' Ioo (c-r) (c+r) ∧
        (∀ y, f (F y) = f y ∧ f (F.symm y) = f y) ∧
        (∀ u : Handle.AttachingRegion 2 2 → L × ℝ,
          (∀ z, u z ∈ χ.source ∧ (u z).1 ∈ C) →
          ∀ z, F (χ (u z)) = χ (u z) ∧ F.symm (χ (u z)) = χ (u z)) := by
  dsimp only
  let := manifoldLevelSetChartedSpace J f c hf hc
  intro C A
  obtain ⟨r, hr, χ, hχ, ht, _, hh, _⟩ := exists_nativeSignedHeightCollar hf hc x₀
  let a := r / 4
  let b := r / 2
  have ha : 0 < a := by dsimp [a]; linarith
  have hab : a < b := by dsimp [a, b]; linarith
  have hbr : b < r := by dsimp [b]; linarith
  obtain ⟨F, hF, _, _, _, _, hheight⟩ := A.exists_ambientSignedCollarDiffeomorph χ ha hab hbr hχ
  refine ⟨r, hr, χ, F, hχ, ht, hheight f c hh, ?_⟩
  intro u hu z
  obtain ⟨hforward, hinverse⟩ := hF (u z) (hu z).1
  obtain ⟨hfix, hfixInv⟩ := A.signedCollarDiffeomorph_fixes_protected a b (hu z).2
  exact ⟨hforward.trans (congrArg (fun q => χ q) hfix),
    hinverse.trans (congrArg (fun q => χ q) hfixInv)⟩

#print axioms checked_ambient_motion_preserves_native_height_and_tube

theorem checked_ambient_native_foot_round_trip [T2Space M] [CompactSpace M]
    {ι : Type*} [Finite ι] (D : IsolatedOneHandle hf p lo hi) (s : CellBoundary 1) :
    let k : (1 : ℕ) ≤ 4 := by decide
    letI := D.footLevelEuclideanCharts
    letI := D.footComponent_isManifold s
    let L := D.footComponent s
    ∀ (o : ManifoldOrientation I₃f L 3) (model : OrientedBallEmbedding L o)
      (feet : ι → OrientedBallEmbedding L o),
      (∀ i j, i ≠ j → Disjoint ((feet i).chart '' Metric.closedBall 0 1)
        ((feet j).chart '' Metric.closedBall 0 1)) →
      (∀ i, Disjoint (D.footComponentChart s '' Metric.closedBall 0 1)
        ((feet i).chart '' Metric.closedBall 0 1)) →
      (∀ i, Disjoint (model.chart '' Metric.closedBall 0 1)
        ((feet i).chart '' Metric.closedBall 0 1)) →
      ∃ (A : V₃f ≃ₗᵢ[ℝ] V₃f) (F : M ≃ₘ^∞⟮J, J⟯ M),
        (A = LinearIsometryEquiv.refl ℝ V₃f ∨ A = LinearIsometryEquiv.neg ℝ) ∧
        (∀ y, f (F y) = f y ∧ f (F.symm y) = f y) ∧
        (∀ z : ClosedCell 3,
          let x := (cocoreAttachingEmbedding k (f p) D.ε D.r D.chart D.ε_pos
            D.attaching_radius (s, z)).val
          let y := (model.chart (A z.val)).val.val
          F x = y ∧ F.symm y = x) ∧
        ∀ i (z : ClosedCell 3),
          let x := ((feet i).chart z.val).val.val
          F x = x ∧ F.symm x = x := by
  dsimp only
  let := D.footLevelEuclideanCharts
  let := D.footComponent_isManifold s
  intro o model feet hd ha hm
  obtain ⟨A, r, χ, F, _, hA, hr, _, h0, _, _, _, _, hFh, hF, hfixed⟩ :=
    D.exists_ambientNativeFootNormalization s o model feet hd ha hm
  refine ⟨A, F, hA, hFh, ?_, ?_⟩
  · intro z
    have ht : |(0 : ℝ)| ≤ r / 3 := by rw [abs_zero]; linarith
    simpa only [h0, D.footComponentPoint_val] using hF z 0 ht
  · intro i z
    have ht : (0 : ℝ) ∈ Ioo (-r) r := ⟨by linarith, hr⟩
    simpa only [h0] using hfixed i z 0 ht

#print axioms checked_ambient_native_foot_round_trip

#check @IsolatedOneHandle.exists_twoFootHeightCollars
#print axioms IsolatedOneHandle.exists_twoFootHeightCollars

theorem checked_two_component_collars_below_actual_outgoing [T2Space M] [CompactSpace M]
    (D : IsolatedOneHandle hf p lo hi) (s s' : CellBoundary 1)
    (hd : Disjoint (D.footComponent s : Set (LevelSetSpace f (f p - D.ε)))
      (D.footComponent s' : Set (LevelSetSpace f (f p - D.ε)))) :
    letI := D.footLevelEuclideanCharts
    let I₃ := 𝓘(ℝ, EuclideanSpace ℝ (Fin 3))
    ∃ r > (0 : ℝ), ∃ (χ : PartialDiffeomorph (I₃.prod 𝓘(ℝ, ℝ)) J (D.footComponent s × ℝ) M ∞)
      (ψ : PartialDiffeomorph (I₃.prod 𝓘(ℝ, ℝ)) J (D.footComponent s' × ℝ) M ∞),
      Disjoint χ.target ψ.target ∧
      (∀ y ∈ χ.target, (χ.symm y).2 = f y - (f p - D.ε) ∧ f y < f p + D.ε) ∧
      (∀ y ∈ ψ.target, (ψ.symm y).2 = f y - (f p - D.ε) ∧ f y < f p + D.ε) := by
  dsimp only
  let := D.footLevelEuclideanCharts
  obtain ⟨r, hr, hεr, _, χ, ψ, _, _, hχ, hψ, hsep, _, _, _, _, _, _, hχinv, hψinv⟩ :=
    D.exists_twoFootHeightCollars s s' hd
  refine ⟨r, hr, χ, ψ, hsep, ?_, ?_⟩
  · intro y hy
    have h := χ.map_target hy
    rw [hχ] at h
    have hval := (hχinv y hy).2
    have hheight : f y - (f p - D.ε) < r := by rw [← hval]; exact h.2
    exact ⟨hval, by linarith only [hheight, hεr, D.ε_pos]⟩
  · intro y hy
    have h := ψ.map_target hy
    rw [hψ] at h
    have hval := (hψinv y hy).2
    have hheight : f y - (f p - D.ε) < r := by rw [← hval]; exact h.2
    exact ⟨hval, by linarith only [hheight, hεr, D.ε_pos]⟩

#print axioms checked_two_component_collars_below_actual_outgoing

#check @IsolatedOneHandle.exists_markedTreeEdgeFootNormalization
#print axioms IsolatedOneHandle.exists_markedTreeEdgeFootNormalization
#check @IsolatedOneHandle.exists_fixedOutgoingSignedHeightCollar
#print axioms IsolatedOneHandle.exists_fixedOutgoingSignedHeightCollar

theorem checked_marked_edge_feet_and_outgoing_collar [T2Space M] [CompactSpace M]
    {ι₀ ι₁ : Type*} [Finite ι₀] [Finite ι₁]
    (D : IsolatedOneHandle hf p lo hi) (s s' : CellBoundary 1)
    (hd : Disjoint (D.footComponent s : Set (LevelSetSpace f (f p - D.ε)))
      (D.footComponent s' : Set (LevelSetSpace f (f p - D.ε)))) :
    let Upper := LevelSetSpace f (f p + D.ε)
    letI := manifoldLevelSetChartedSpace J f (f p + D.ε) hf D.upper_regular
    letI := D.footLevelEuclideanCharts
    letI := D.footComponent_isManifold s
    letI := D.footComponent_isManifold s'
    ∀ (m : FootCollarMarks (D.footComponentChart s) ι₀)
      (m' : FootCollarMarks (D.footComponentChart s') ι₁),
      ∃ (A A' : V₃f ≃ₗᵢ[ℝ] V₃f) (F : M ≃ₘ^∞⟮J, J⟯ M)
        (out : PartialDiffeomorph ((𝓘(ℝ, MorseModel 3)).prod 𝓘(ℝ, ℝ)) J (Upper × ℝ) M ∞) (δ : ℝ),
        0 < δ ∧ (∀ x : Upper, out (x, 0) = x.val) ∧
        (∀ z : ClosedCell 3,
          let x := (D.footComponentPoint s z).val.val
          let y := (m.model.chart (A z.val)).val.val
          F x = y ∧ F.symm y = x) ∧
        (∀ z : ClosedCell 3,
          let x := (D.footComponentPoint s' z).val.val
          let y := (m'.model.chart (A' z.val)).val.val
          F x = y ∧ F.symm y = x) ∧
        (∀ (x : Upper) (t : ℝ), |t| < δ →
          (x, t) ∈ out.source ∧ F (out (x, t)) = out (x, t) ∧ F.symm (out (x, t)) = out (x, t)) := by
  dsimp only
  let := manifoldLevelSetChartedSpace J f (f p + D.ε) hf D.upper_regular
  let := D.footLevelEuclideanCharts
  let := D.footComponent_isManifold s
  let := D.footComponent_isManifold s'
  intro m m'
  obtain ⟨r, _, _, _, A, A', F, _, _, hr, _, _, _, _, _, _, _, _, hχ0, hψ0, _, _, _, _,
    _, _, _, _, _, _, _, hhigh, hmark, hmark'⟩ := D.exists_markedTreeEdgeFootNormalization s s' hd m m'
  obtain ⟨R, hR, out, hOutSource, _, hOutZero, hOutHeight, _⟩ := D.exists_outgoingSignedHeightCollar
  have h0 : |(0 : ℝ)| ≤ r / 3 := by rw [abs_zero]; linarith
  refine ⟨A, A', F, out, min R (D.ε / 2), lt_min hR (half_pos D.ε_pos), hOutZero, ?_, ?_, ?_⟩
  · intro z
    simpa only [hχ0] using hmark.1 z 0 h0
  · intro z
    simpa only [hψ0] using hmark'.1 z 0 h0
  · intro x t ht
    have htR : |t| < R := ht.trans_le (min_le_left ..)
    have htε : |t| < D.ε / 2 := ht.trans_le (min_le_right ..)
    have hs : (x,t) ∈ out.source := hOutSource ▸ abs_lt.mp htR
    refine ⟨hs, hhigh _ ?_⟩
    have h := hOutHeight (x,t) hs
    linarith [(abs_lt.mp htε).1, D.ε_pos]

#print axioms checked_marked_edge_feet_and_outgoing_collar

end NativeFootCheck

section SignedCollarCheck

#check @SupportedLevelIsotopy.signedCollarDiffeomorph
#print axioms SupportedLevelIsotopy.signedCollarDiffeomorph
#check @SupportedLevelIsotopy.signedCollarDiffeomorph_apply
#print axioms SupportedLevelIsotopy.signedCollarDiffeomorph_apply
#check @SupportedLevelIsotopy.signedCollarDiffeomorph_symm_apply
#print axioms SupportedLevelIsotopy.signedCollarDiffeomorph_symm_apply
#check @SupportedLevelIsotopy.signedCollarDiffeomorph_eq_endpoint
#print axioms SupportedLevelIsotopy.signedCollarDiffeomorph_eq_endpoint
#check @SupportedLevelIsotopy.signedCollarDiffeomorph_eq_identity
#print axioms SupportedLevelIsotopy.signedCollarDiffeomorph_eq_identity
#check @SupportedLevelIsotopy.signedCollarDiffeomorph_fixes_protected
#print axioms SupportedLevelIsotopy.signedCollarDiffeomorph_fixes_protected
#check @SupportedLevelIsotopy.signedCollarComparison
#print axioms SupportedLevelIsotopy.signedCollarComparison
#check @SupportedLevelIsotopy.signedCollarComparison_source_target
#print axioms SupportedLevelIsotopy.signedCollarComparison_source_target
#check @SupportedLevelIsotopy.signedCollarComparison_protected
#print axioms SupportedLevelIsotopy.signedCollarComparison_protected

variable {E H L T : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [TopologicalSpace H] [TopologicalSpace L] [ChartedSpace H L]
  {I : ModelWithCorners ℝ E H} {C : Set L}

/-- Both marked parametrizations use the same signed coordinate at every central point.
At every signed parameter the protected parametrization is unchanged in each direction. -/
theorem checked_signed_marked_foot_and_protected_tube (A : SupportedLevelIsotopy I C)
    (incoming normalized tube : T → L) (hmark : ∀ z, A.isotopy 1 (incoming z) = normalized z)
    (htube : ∀ z, tube z ∈ C) {a b : ℝ} (ha : 0 < a) (hab : a < b) :
    let P := A.signedCollarDiffeomorph a b
    (∀ (z : T) (t : ℝ), |t| ≤ a →
      P (incoming z, t) = (normalized z, t) ∧ P.symm (normalized z, t) = (incoming z, t)) ∧
    (∀ (z : T) (t : ℝ), P (tube z, t) = (tube z, t) ∧ P.symm (tube z, t) = (tube z, t)) := by
  dsimp only
  refine ⟨?_, fun z t => A.signedCollarDiffeomorph_fixes_protected a b
    (p := (tube z, t)) (htube z)⟩
  intro z t ht
  constructor
  · simpa only [hmark] using (A.signedCollarDiffeomorph_eq_endpoint ha hab
      (p := (incoming z, t)) ht).1
  · rw [(A.signedCollarDiffeomorph_eq_endpoint ha hab (p := (normalized z, t)) ht).2]
    rw [← hmark, Diffeomorph.symm_apply_apply]

#print axioms checked_signed_marked_foot_and_protected_tube

variable {EX HX X EY HY Y : Type*}
  [NormedAddCommGroup EX] [NormedSpace ℝ EX] [TopologicalSpace HX]
  [TopologicalSpace X] [ChartedSpace HX X]
  [NormedAddCommGroup EY] [NormedSpace ℝ EY] [TopologicalSpace HY]
  [TopologicalSpace Y] [ChartedSpace HY Y]
  {IX : ModelWithCorners ℝ EX HX} {IY : ModelWithCorners ℝ EY HY}

/-- In supplied ambient collar charts the forward and inverse plots still use the same
signed parameter and the same complete parametrization on a protected tube. -/
theorem checked_signed_ambient_foot_and_residual (A : SupportedLevelIsotopy I C)
    (χ : PartialDiffeomorph (I.prod 𝓘(ℝ, ℝ)) IX (L × ℝ) X ∞)
    (ψ : PartialDiffeomorph (I.prod 𝓘(ℝ, ℝ)) IY (L × ℝ) Y ∞)
    (incoming normalized : T → L) (hmark : ∀ z, A.isotopy 1 (incoming z) = normalized z)
    (tube : T → L × ℝ) (htube : ∀ z, tube z ∈ χ.source ∩ ψ.source ∩ {p | p.1 ∈ C})
    {a b r : ℝ} (ha : 0 < a) (hab : a < b) (har : a < r)
    (hχ : χ.source = {p | p.2 ∈ Ioo (-r) r}) (hψ : ψ.source = {p | p.2 ∈ Ioo (-r) r}) :
    let B := A.signedCollarComparison a b χ ψ
    (∀ (z : T) (t : ℝ), |t| ≤ a →
      B (χ (incoming z, t)) = ψ (normalized z, t) ∧
      B.symm (ψ (normalized z, t)) = χ (incoming z, t)) ∧
    (∀ z, B (χ (tube z)) = ψ (tube z) ∧ B.symm (ψ (tube z)) = χ (tube z)) := by
  dsimp only
  refine ⟨?_, ?_⟩
  · intro z t ht
    have htr : t ∈ Ioo (-r) r :=
      ⟨(neg_lt_neg har).trans_le (abs_le.mp ht).1, (abs_le.mp ht).2.trans_lt har⟩
    have hx : (incoming z, t) ∈ χ.source := by rw [hχ]; exact htr
    have hy : (normalized z, t) ∈ ψ.source := by rw [hψ]; exact htr
    constructor
    · rw [A.signedCollarComparison_apply a b χ ψ hx,
        (A.signedCollarDiffeomorph_eq_endpoint ha hab (p := (incoming z, t)) ht).1, hmark]
    · rw [A.signedCollarComparison_symm_apply a b χ ψ hy,
        (A.signedCollarDiffeomorph_eq_endpoint ha hab (p := (normalized z, t)) ht).2,
        ← hmark, Diffeomorph.symm_apply_apply]
  · intro z
    obtain ⟨hforward, hbackward⟩ := A.signedCollarComparison_protected a b χ ψ (T := Set.range tube)
      (by rintro _ ⟨u, rfl⟩; exact htube u)
    exact ⟨hforward ⟨z, rfl⟩, hbackward ⟨z, rfl⟩⟩

#print axioms checked_signed_ambient_foot_and_residual

end SignedCollarCheck

#check @SmoothPoincare.exists_nativeOppositeSignedCollars
#print axioms SmoothPoincare.exists_nativeOppositeSignedCollars
