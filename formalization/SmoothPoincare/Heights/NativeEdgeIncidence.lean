import SmoothPoincare.Heights.MarkedTreeEdgeFeet
import DifferentialGeometry.Topology.Handle.SimplyConnected

/-! # The change of actual body components across one rounded Morse edge -/

open DifferentialGeometry DifferentialGeometry.Topology DifferentialGeometry.Topology.Morse
open DifferentialGeometry.Topology.Morse.CellAttachment
open DifferentialGeometry.Topology.Morse.ManifoldCellAttachment Set
open scoped ContDiff Manifold

namespace SmoothPoincare

noncomputable section

private theorem cell_preconnected (n : ℕ) : PreconnectedSpace (ClosedCell n) := by
  have h : Convex ℝ ({x : EuclideanSpace ℝ (Fin n) | ‖x‖ ≤ 1} : Set _) := by
    simpa only [Metric.closedBall, dist_zero_right] using
      (convex_closedBall (0 : EuclideanSpace ℝ (Fin n)) (1 : ℝ))
  exact Subtype.preconnectedSpace h.isPreconnected

private theorem component_constant {X Y : Type*} [TopologicalSpace X] [PreconnectedSpace X]
    [TopologicalSpace Y] {f : X → Y} (hf : Continuous f) (x y : X) :
    ConnectedComponents.mk (f x) = ConnectedComponents.mk (f y) := by
  apply congrArg hf.connectedComponentsMap (a₁ := ConnectedComponents.mk x) (a₂ := ConnectedComponents.mk y)
  apply ConnectedComponents.coe_eq_coe.mpr
  simp only [PreconnectedSpace.connectedComponent_eq_univ]

/-- The actual attaching centers are the only incoming component labels identified
by the trace. Every outgoing component contains a point from the lower body. -/
private theorem handle_component_fibers {k l : ℕ} {X Y : Type*} [TopologicalSpace X] [LocallyConnectedSpace X]
    [TopologicalSpace Y] (φ : Handle.AttachingRegion k l → X) (hφ : Continuous φ)
    (e : Handle.AdjunctionSpace k l φ ≃ₜ Y) (base : CellBoundary k) :
    let q := (e.continuous.comp (Handle.continuous_lower φ)).connectedComponentsMap
    let ends := Set.range (fun b : CellBoundary k => ConnectedComponents.mk (φ (b, closedCellCenter l)))
    Function.Surjective q ∧ ∀ u v, q u = q v ↔ u = v ∨ u ∈ ends ∧ v ∈ ends := by
  classical
  let q := (e.continuous.comp (Handle.continuous_lower φ)).connectedComponentsMap
  let foot (b : CellBoundary k) := ConnectedComponents.mk (φ (b, closedCellCenter l))
  let ends := Set.range foot
  let label (u : ConnectedComponents X) := if u ∈ ends then foot base else u
  let read (x : X) := label (ConnectedComponents.mk x)
  have hread : Continuous read := (continuous_of_discreteTopology : Continuous label).comp ConnectedComponents.continuous_coe
  let := cell_preconnected k
  let := cell_preconnected l
  have hfoot (a : Handle.AttachingRegion k l) : read (φ a) = foot base := by
    have h := component_constant (hφ.comp (continuous_const.prodMk continuous_id)) a.2
      (closedCellCenter l) (f := fun z => φ (a.1, z))
    exact ite_eq_left (show ConnectedComponents.mk (φ a) ∈ ends from ⟨a.1, h.symm⟩)
  let rep := Sum.elim (fun _ : Handle.StandardHandle k l => foot base) read
  have hrel : ∀ a b, adjunctionRel (Handle.attachingInclusion k l) φ a b → rep a = rep b := by
    rintro _ _ ⟨a, ⟨rfl,rfl⟩ | ⟨rfl,rfl⟩⟩
    · exact (hfoot a).symm
    · exact hfoot a
  let decoder := (Quot.lift rep hrel) ∘ e.symm
  have hdec : Continuous decoder := (continuous_adjunction_lift _ _ hrel
    (continuous_const.sumElim hread)).comp e.symm.continuous
  have hdecode (u : ConnectedComponents X) : hdec.connectedComponentsLift (q u) = label u := by
    obtain ⟨x,rfl⟩ := ConnectedComponents.surjective_coe u
    change Quot.lift rep hrel (e.symm (e (Handle.lower φ x))) = read x
    rw [e.symm_apply_apply]
    rfl
  have hcell (d : Handle.StandardHandle k l) (b : CellBoundary k) :
      ConnectedComponents.mk (e (Handle.cell φ d)) = q (foot b) := by
    let a : Handle.AttachingRegion k l := (b, closedCellCenter l)
    calc
      _ = ConnectedComponents.mk (e (Handle.cell φ (Handle.attachingInclusion k l a))) :=
        component_constant (e.continuous.comp (Handle.continuous_cell φ)) _ _
      _ = _ := congrArg (fun z => ConnectedComponents.mk (e z)) (Handle.adjunction_coherence φ a)
  constructor
  · intro u
    obtain ⟨y,rfl⟩ := ConnectedComponents.surjective_coe u
    rcases Handle.cell_lower_cover φ (e.symm y) with ⟨d,hd⟩ | ⟨x,hx⟩
    · refine ⟨foot base, ?_⟩
      rw [← e.apply_symm_apply y, ← hd]
      exact (hcell d base).symm
    · refine ⟨ConnectedComponents.mk x, ?_⟩
      exact congrArg ConnectedComponents.mk ((congrArg e hx).trans (e.apply_symm_apply y))
  · intro u v
    constructor
    · intro h
      have he : label u = label v := (hdecode u).symm.trans
        ((congrArg hdec.connectedComponentsLift h).trans (hdecode v))
      by_cases hu : u ∈ ends <;> by_cases hv : v ∈ ends
      · exact Or.inr ⟨hu,hv⟩
      · simp only [label,ite_eq_left hu,ite_eq_right hv] at he
        exact (hv (he ▸ (show foot base ∈ ends from ⟨base,rfl⟩))).elim
      · simp only [label,ite_eq_right hu,ite_eq_left hv] at he
        exact (hu (he.symm ▸ (show foot base ∈ ends from ⟨base,rfl⟩))).elim
      · exact Or.inl (by simpa only [label,ite_eq_right hu,ite_eq_right hv] using he)
    · rintro (rfl | ⟨⟨b,rfl⟩,⟨b',rfl⟩⟩)
      · rfl
      · let d := Handle.attachingInclusion k l (base, closedCellCenter l)
        exact (hcell d b).symm.trans (hcell d b')

/-- The actual attaching centers are the only incoming component labels identified
by the trace. Every outgoing component contains a point from the lower body. -/
theorem oneHandle_component_fibers {X Y : Type*} [TopologicalSpace X] [LocallyConnectedSpace X]
    [TopologicalSpace Y] (φ : Handle.AttachingRegion 1 3 → X) (hφ : Continuous φ)
    (e : Handle.AdjunctionSpace 1 3 φ ≃ₜ Y) (base : CellBoundary 1) :
    let q := (e.continuous.comp (Handle.continuous_lower φ)).connectedComponentsMap
    let ends := Set.range (fun b : CellBoundary 1 => ConnectedComponents.mk (φ (b, closedCellCenter 3)))
    Function.Surjective q ∧ ∀ u v, q u = q v ↔ u = v ∨ u ∈ ends ∧ v ∈ ends :=
  handle_component_fibers φ hφ e base

namespace IsolatedOneHandle

variable {H M : Type} [TopologicalSpace H] [TopologicalSpace M] [ChartedSpace H M]
  {J : ModelWithCorners ℝ (MorseModel 4) H} [J.Boundaryless] [IsManifold J ∞ M]
  {f : M → ℝ} {hf : ContMDiff J 𝓘(ℝ, ℝ) ∞ f} {p : M} {lo hi : ℝ}
  (D : IsolatedOneHandle hf p lo hi)

local notation "hk₁" => (show (1 : ℕ) ≤ 4 by decide)
local notation "X" => SublevelSpace f (f p - D.ε)
local notation "Y" => SublevelSpace f (f p + D.ε)
local notation "φ" => morseAttachingEmbedding hk₁ (f p) D.ε D.r D.chart D.ε_pos D.attaching_radius

/-- The incidence label lies in the components of the actual incoming *body*. -/
def incomingBodyFoot (b : CellBoundary 1) : ConnectedComponents X :=
  ConnectedComponents.mk (φ (b, closedCellCenter 3))

/-- This is the component map of the specified rounded-trace lower insertion. -/
def traceComponentMap : ConnectedComponents X → ConnectedComponents Y :=
  letI := D.traceCharts
  letI := manifoldSublevelChartedSpace J f (f p + D.ε) hf D.upper_regular
  (D.traceDiffeomorph.continuous.comp (Handle.continuous_lower φ)).connectedComponentsMap

/-- Exact incidence at an actual one-handle step in either end filtration. -/
theorem traceComponentMap_fibers (base : CellBoundary 1) :
    Function.Surjective D.traceComponentMap ∧
      ∀ u v, D.traceComponentMap u = D.traceComponentMap v ↔
        u = v ∨ u ∈ Set.range D.incomingBodyFoot ∧ v ∈ Set.range D.incomingBodyFoot := by
  let := D.traceCharts
  let := manifoldSublevelChartedSpace J f (f p + D.ε) hf D.upper_regular
  let := manifoldSublevelChartedSpace J f (f p - D.ε) hf D.lower_regular
  let : LocallyPathConnectedSpace (MorseHalfSpace 3) := (convex_morseHalfSpace 3).locallyPathConnectedSpace
  let : LocallyConnectedSpace X := ChartedSpace.locallyConnectedSpace (MorseHalfSpace 3) X
  let := Handle.attachingRegionChartedSpace 1 3
  let := manifoldLevelSetChartedSpace J f (f p - D.ε) hf D.lower_regular
  have hφ : Continuous φ := (continuous_subtype_val.comp D.attachingFeet_smooth.continuous).subtype_mk _
  exact oneHandle_component_fibers φ hφ D.traceDiffeomorph.toHomeomorph base

/-- Distinct incoming body labels imply that the complete level components used
by the two native foot normalizations are disjoint. -/
theorem levelFeet_disjoint_of_bodyFoot_ne (b b' : CellBoundary 1)
    (hd : D.incomingBodyFoot b ≠ D.incomingBodyFoot b') :
    Disjoint (D.footComponent b : Set (LevelSetSpace f (f p - D.ε)))
      (D.footComponent b' : Set (LevelSetSpace f (f p - D.ε))) := by
  let inc := regularEndLevelInclusion f (f p - D.ε)
  have hc : Continuous inc := continuous_subtype_val.subtype_mk _
  have he (a : CellBoundary 1) :
      hc.connectedComponentsMap (ConnectedComponents.mk (D.footEuclideanChart a 0)) =
        D.incomingBodyFoot a := by
    change ConnectedComponents.mk (inc (D.footPartialDiffeomorph a (closedCellCenter 3).val)) = _
    rw [D.footPartialDiffeomorph_apply_closedCell]
    rfl
  apply connectedComponent_disjoint
  intro h
  apply hd
  exact (he b).symm.trans ((congrArg hc.connectedComponentsMap
    (ConnectedComponents.coe_eq_coe.mpr h)).trans (he b'))

/-- The two different ends of an actual one-handle on a single incoming
component preclude a simply connected outgoing body. -/
theorem not_simplyConnected_of_same_bodyFoot (b b' : CellBoundary 1) (hbb : b ≠ b')
    (hsame : D.incomingBodyFoot b = D.incomingBodyFoot b') : ¬ SimplyConnectedSpace Y := by
  let := D.traceCharts
  let := manifoldSublevelChartedSpace J f (f p + D.ε) hf D.upper_regular
  let := manifoldSublevelChartedSpace J f (f p - D.ε) hf D.lower_regular
  let : LocallyPathConnectedSpace (MorseHalfSpace 3) := (convex_morseHalfSpace 3).locallyPathConnectedSpace
  let : LocallyPathConnectedSpace X := ChartedSpace.locallyPathConnectedSpace (MorseHalfSpace 3) X
  have hMem := ConnectedComponents.coe_eq_coe'.mp hsame
  rw [← pathComponent_eq_connectedComponent] at hMem
  have hj := (mem_pathComponent_iff.mp hMem).symm
  intro h
  exact Handle.not_simplyConnectedSpace_adjunction_of_joined_feet φ hbb hj
    (D.traceDiffeomorph.toHomeomorph.toHomotopyEquiv.simplyConnectedSpace_iff.mpr h)

end IsolatedOneHandle

namespace IsolatedMiddleAttachment
variable {H M : Type} [TopologicalSpace H] [TopologicalSpace M] [ChartedSpace H M]
  {J : ModelWithCorners ℝ (MorseModel 4) H} [J.Boundaryless] [IsManifold J ∞ M]
  {f : M → ℝ} {hf : ContMDiff J 𝓘(ℝ, ℝ) ∞ f} {p : M} {lo hi : ℝ}
  (D : IsolatedMiddleAttachment hf p lo hi)

local notation "X" => SublevelSpace f (f p - D.ε)
local notation "φ" => morseAttachingEmbedding (show (2:ℕ) ≤ 4 by decide)
  (f p) D.ε D.r D.chart D.ε_pos D.attaching_radius

/-- The native selected index-two trace induces a bijection on body components.
The whole attaching circle has the same incoming label. -/
theorem traceComponentMap_bijective :
    letI := D.traceCharts
    letI := manifoldSublevelChartedSpace J f (f p + D.ε) hf D.upper_regular
    Function.Bijective (D.traceDiffeomorph.continuous.comp (Handle.continuous_lower φ)).connectedComponentsMap := by
  let := D.traceCharts
  let := manifoldSublevelChartedSpace J f (f p + D.ε) hf D.upper_regular
  let := manifoldSublevelChartedSpace J f (f p - D.ε) hf D.lower_regular
  let : LocallyPathConnectedSpace (MorseHalfSpace 3) := (convex_morseHalfSpace 3).locallyPathConnectedSpace
  let : LocallyConnectedSpace X := ChartedSpace.locallyConnectedSpace (MorseHalfSpace 3) X
  let := Handle.attachingRegionChartedSpace 2 2
  let := manifoldLevelSetChartedSpace J f (f p - D.ε) hf D.lower_regular
  have hφ : Continuous φ := (continuous_subtype_val.comp D.attachingTube_smooth.continuous).subtype_mk _
  let V := EuclideanSpace ℝ (Fin 2)
  have hrank : 1 < Module.rank ℝ V := by
    rw [← Module.finrank_eq_rank]
    simp [V]
  have hcon : IsPreconnected {z : V | ‖z‖ = 1} := by
    simpa only [Metric.sphere, dist_zero_right] using (isPreconnected_sphere hrank (0 : V) 1)
  let : PreconnectedSpace (CellBoundary 2) := Subtype.preconnectedSpace hcon
  let b : CellBoundary 2 := ⟨PiLp.single 2 0 1, by simp⟩
  obtain ⟨hs,hq⟩ := handle_component_fibers φ hφ D.traceDiffeomorph.toHomeomorph b
  refine ⟨fun u v huv => ?_, hs⟩
  rcases (hq u v).mp huv with he | ⟨⟨a,rfl⟩,⟨a',rfl⟩⟩
  · exact he
  · exact component_constant (hφ.comp (continuous_id.prodMk continuous_const)) a a'

end IsolatedMiddleAttachment

end
end SmoothPoincare
