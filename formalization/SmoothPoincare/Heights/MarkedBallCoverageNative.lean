import SmoothPoincare.Heights.MarkedBallCoverage
import SmoothPoincare.Heights.SelectedBirthEdge
import SmoothPoincare.Heights.RetainedRoundedTrace

/-! # The connected rounded body of the selected binary merger -/

open DifferentialGeometry.Topology DifferentialGeometry.Topology.Morse Set
open DifferentialGeometry.Topology.Morse.CellAttachment
open DifferentialGeometry.Topology.Morse.ManifoldCellAttachment
open scoped ContDiff Manifold

namespace SmoothPoincare.IsolatedOneHandle

noncomputable section

local notation "V" => EuclideanSpace ℝ (Fin 4)
local notation "B" => Metric.closedBall (0 : V) 1
local notation "I₄" => morseModelWithCornersHalfSpace 3
local notation "hk₁" => (show (1 : ℕ) ≤ 4 by decide)

variable {H M : Type} [TopologicalSpace H] [TopologicalSpace M] [ChartedSpace H M]
  {J : ModelWithCorners ℝ (MorseModel 4) H} [J.Boundaryless] [IsManifold J ∞ M]
  {f : M → ℝ} {hf : ContMDiff J 𝓘(ℝ, ℝ) ∞ f} {p : M} {lo hi : ℝ}
  (D : IsolatedOneHandle hf p lo hi)

local notation "c" => f p - D.ε
local notation "X" => SublevelSpace f c
local notation "φ" => morseAttachingEmbedding hk₁ (f p) D.ε D.r D.chart D.ε_pos D.attaching_radius
local notation "T" => Handle.AdjunctionSpace 1 3 φ

private theorem connectedSpace_closedCell (n : ℕ) : ConnectedSpace (ClosedCell n) := by
  have hConvex : Convex ℝ ({x : EuclideanSpace ℝ (Fin n) | ‖x‖ ≤ 1} : Set _) := by
    simpa only [Metric.closedBall, dist_zero_right] using
      convex_closedBall (0 : EuclideanSpace ℝ (Fin n)) (1 : ℝ)
  exact isConnected_iff_connectedSpace.mp (hConvex.isConnected ⟨0, by simp⟩)

/-- The actual two chart images exhaust the incoming body. The image of
the native handle meets each image at its specified attaching foot, so
the entire trace is connected. No model-side data enter this argument. -/
theorem connectedTrace_of_twoBirthCharts
    (L R : PartialDiffeomorph 𝓘(ℝ,V) J V M ∞)
    (hL : B ⊆ L.source) (hR : B ⊆ R.source)
    (hBody : (L '' B) ∪ (R '' B) = f ⁻¹' Iic c)
    (aL aR : CellBoundary 1)
    (hLeftFoot : (φ (aL, closedCellCenter 3)).val ∈ L '' B)
    (hRightFoot : (φ (aR, closedCellCenter 3)).val ∈ R '' B) :
    ConnectedSpace T := by
  let lowerL : ClosedCell 4 → X := fun x =>
    ⟨L x.val, hBody ▸ mem_union_left _ ⟨x.val, Metric.mem_closedBall_zero_iff.mpr x.property, rfl⟩⟩
  let lowerR : ClosedCell 4 → X := fun x =>
    ⟨R x.val, hBody ▸ mem_union_right _ ⟨x.val, Metric.mem_closedBall_zero_iff.mpr x.property, rfl⟩⟩
  have hLowerL : Continuous lowerL :=
    (L.contMDiffOn.continuousOn.comp_continuous continuous_subtype_val
      (fun x => hL (Metric.mem_closedBall_zero_iff.mpr x.property))).subtype_mk _
  have hLowerR : Continuous lowerR :=
    (R.contMDiffOn.continuousOn.comp_continuous continuous_subtype_val
      (fun x => hR (Metric.mem_closedBall_zero_iff.mpr x.property))).subtype_mk _
  let : ConnectedSpace (ClosedCell 1) := connectedSpace_closedCell 1
  let : ConnectedSpace (ClosedCell 3) := connectedSpace_closedCell 3
  let : ConnectedSpace (ClosedCell 4) := connectedSpace_closedCell 4
  let L' := Handle.lower φ ∘ lowerL
  let R' := Handle.lower φ ∘ lowerR
  let A := Handle.cell φ
  have hAL : (range A ∩ range L').Nonempty := by
    obtain ⟨x, hx, hEq⟩ := hLeftFoot
    let x' : ClosedCell 4 := ⟨x, Metric.mem_closedBall_zero_iff.mp hx⟩
    refine ⟨L' x', ?_, mem_range_self _⟩
    refine ⟨Handle.attachingInclusion 1 3 (aL, closedCellCenter 3), ?_⟩
    exact (Handle.adjunction_coherence φ _).trans (congrArg (Handle.lower φ) (Subtype.ext hEq.symm))
  have hAR : (range A ∩ range R').Nonempty := by
    obtain ⟨x, hx, hEq⟩ := hRightFoot
    let x' : ClosedCell 4 := ⟨x, Metric.mem_closedBall_zero_iff.mp hx⟩
    refine ⟨R' x', ?_, mem_range_self _⟩
    refine ⟨Handle.attachingInclusion 1 3 (aR, closedCellCenter 3), ?_⟩
    exact (Handle.adjunction_coherence φ _).trans (congrArg (Handle.lower φ) (Subtype.ext hEq.symm))
  have hALR : ((range A ∪ range L') ∩ range R').Nonempty := by
    obtain ⟨z, hzA, hzR⟩ := hAR
    exact ⟨z, mem_union_left _ hzA, hzR⟩
  have hConnected := ((isConnected_range (Handle.continuous_cell φ)).union hAL
    (isConnected_range ((Handle.continuous_lower φ).comp hLowerL))).union hALR
      (isConnected_range ((Handle.continuous_lower φ).comp hLowerR))
  have hCover : (range A ∪ range L') ∪ range R' = univ := by
    apply eq_univ_of_forall
    intro z
    rcases Handle.cell_lower_cover φ z with ⟨d, rfl⟩ | ⟨x, rfl⟩
    · exact mem_union_left _ (mem_union_left _ (mem_range_self d))
    · have hx : x.val ∈ (L '' B) ∪ (R '' B) := hBody.symm ▸ x.property
      rcases hx with ⟨y, hy, he⟩ | ⟨y, hy, he⟩
      · exact mem_union_left _ (mem_union_right _ ⟨⟨y, Metric.mem_closedBall_zero_iff.mp hy⟩,
          congrArg (Handle.lower φ) (Subtype.ext he)⟩)
      · exact mem_union_right _ ⟨⟨y, Metric.mem_closedBall_zero_iff.mp hy⟩,
          congrArg (Handle.lower φ) (Subtype.ext he)⟩
  exact connectedSpace_iff_univ.mpr (hCover ▸ hConnected)

local instance : ChartedSpace (EuclideanHalfSpace 4) (ClosedCell 4) :=
  Handle.closedCellChartedSpaceSucc 3

variable (C : RetainedRoundedTrace D)
local notation "g" => morseRoundedFunction hk₁ (f p) D.ε D.r C.δ C.R₀ C.R₁ D.chart
local notation "Z" => SublevelSpace g (f p)

/-- To check coverage of the actual rounded body it suffices to check
the two types of native representatives of its retained adjunction.
Compact covering supplies a global map to the fixed unit ball, with
both coordinate equations on every open patch. -/
theorem RetainedRoundedTrace.exists_markedBall_of_nativeRepCover
    [T2Space M] [CompactSpace M] (hConnected : ConnectedSpace T) :
    letI := D.traceCharts
    letI := manifoldSublevelChartedSpace J g (f p) C.smooth C.regular
    ∀ (P : Fin 4 → PartialDiffeomorph I₄ (𝓡∂ 4) Z (ClosedCell 4) ∞),
      (∀ i j, EqOn (P i) (P j) ((P i).source ∩ (P j).source)) →
      (∀ x : X, ∃ i, C.toRounded (Handle.lower φ x) ∈ (P i).source) →
      (∀ d : Handle.StandardHandle 1 3, ∃ i, C.toRounded (Handle.cell φ d) ∈ (P i).source) →
      ∃ e : Z ≃ₘ^∞⟮I₄,𝓡∂ 4⟯ ClosedCell 4,
        (∀ i, EqOn e (P i) (P i).source ∧ EqOn e.symm (P i).symm (P i).target) ∧
        (⋃ i, (P i).target) = univ := by
  let _ := D.traceCharts
  let _ := manifoldSublevelChartedSpace J g (f p) C.smooth C.regular
  intro P hForward hLower hCell
  let : ConnectedSpace T := hConnected
  let : ConnectedSpace Z := C.toRounded.toHomeomorph.connectedSpace_iff.mp hConnected
  let : CompactSpace Z := isCompact_iff_compactSpace.mp
    ((isClosed_Iic.preimage C.smooth.continuous).isCompact : IsCompact (g ⁻¹' Iic (f p)))
  apply exists_markedPatchDiffeomorph_of_unitBallCover P ?_ hForward
  intro z
  obtain ⟨w, rfl⟩ := C.toRounded.surjective z
  rcases Handle.cell_lower_cover φ w with ⟨d, rfl⟩ | ⟨x, rfl⟩
  · exact hCell d
  · exact hLower x

end

end SmoothPoincare.IsolatedOneHandle
