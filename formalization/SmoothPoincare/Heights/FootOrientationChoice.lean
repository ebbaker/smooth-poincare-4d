import SmoothPoincare.Heights.ProtectedFootComplement
import SmoothPoincare.Heights.NativeFootComponent
import DifferentialGeometry.Topology.Manifold.OrientedBallChart.Orientation
import DifferentialGeometry.Topology.ThreeManifold.ConnectedSum.OppositeSum

/-! # Orientation choice and exact signed matching for buffered feet -/

set_option autoImplicit false

noncomputable section

open Set Manifold DifferentialGeometry DifferentialGeometry.Topology
open DifferentialGeometry.PDE.RicciFlow.Surgery.Topology
open scoped ContDiff Manifold

namespace SmoothPoincare

private theorem footIsometry_mem_closedBall (A : ThreeSpace ≃ₗᵢ[ℝ] ThreeSpace)
    {z : ThreeSpace} (hz : z ∈ Metric.closedBall (0 : ThreeSpace) 1) :
    A z ∈ Metric.closedBall (0 : ThreeSpace) 1 := by
  simpa only [Metric.mem_closedBall, dist_zero_right, A.norm_map] using hz

/-- A buffered chart can be regarded as a positive chart, using either the original
parameters or the central reflection on `ℝ³`. The entire closed unit-foot image agrees. -/
theorem exists_orientedFootChart
    (N : ClosedOrientedManifold 3) (b : BallChart 3 ThreeModel N.Carrier) :
    ∃ (A : ThreeSpace ≃ₗᵢ[ℝ] ThreeSpace) (c : OrientedBallEmbedding N.Carrier N.orientation),
      (A = LinearIsometryEquiv.refl ℝ ThreeSpace ∨ A = LinearIsometryEquiv.neg ℝ) ∧
      (∀ z, c.chart (A z) = b.chart z) ∧
      c.chart '' Metric.closedBall 0 1 = b.chart '' Metric.closedBall 0 1 := by
  have hchoice : ∃ (A : ThreeSpace ≃ₗᵢ[ℝ] ThreeSpace)
      (c : OrientedBallEmbedding N.Carrier N.orientation),
      (A = LinearIsometryEquiv.refl ℝ ThreeSpace ∨ A = LinearIsometryEquiv.neg ℝ) ∧
      ∀ z, c.chart (A z) = b.chart z := by
    rcases b.exists_oriented with ⟨c, hc⟩ | ⟨c, hc⟩
    · exact ⟨LinearIsometryEquiv.refl ℝ ThreeSpace,
        OrientedBallEmbedding.ofOrientedBallChart c, Or.inl rfl, hc⟩
    · let d : OrientedBallEmbedding N.Carrier N.orientation :=
        { chart := c.reflect.chart
          closedBall_subset_source := c.reflect.closedBall_subset_source
          preserves_orientation := fun x hx => by
            exact (c.reflect.preserves_orientation x hx).trans
              (congrArg (fun o : ManifoldOrientation ThreeModel N.Carrier 3 =>
                o.orientation (c.reflect.chart x)) (ManifoldOrientation.opposite_opposite N.orientation)) }
      refine ⟨LinearIsometryEquiv.neg ℝ, d, Or.inr rfl, fun z => ?_⟩
      change c.reflect.toBallChart.chart (-z) = b.chart z
      rw [OrientedBallChart.reflect_apply, neg_neg]
      exact hc z
  obtain ⟨A, c, hA, hc⟩ := hchoice
  refine ⟨A, c, hA, hc, ?_⟩
  ext y
  constructor
  · rintro ⟨z, hz, rfl⟩
    refine ⟨A.symm z, footIsometry_mem_closedBall A.symm hz, ?_⟩
    rw [← hc, A.apply_symm_apply]
  · rintro ⟨z, hz, rfl⟩
    exact ⟨A z, footIsometry_mem_closedBall A hz, hc z⟩

section FiniteFeet

variable {EX HX X EY HY Y ι : Type*}
  [NormedAddCommGroup EX] [NormedSpace ℝ EX] [TopologicalSpace HX]
  [TopologicalSpace X] [ChartedSpace HX X]
  [NormedAddCommGroup EY] [NormedSpace ℝ EY] [TopologicalSpace HY]
  [TopologicalSpace Y] [ChartedSpace HY Y] [Finite ι]
  {IX : ModelWithCorners ℝ EX HX} {IY : ModelWithCorners ℝ EY HY}

/-- Match a buffered actual foot to an oriented model on both sides of a signed collar,
using the model parameter `A z` selected by orientation. The support avoids all protected
unit feet. Taking the same collar chart fixes their actual tubes pointwise. -/
theorem exists_bufferedFootSignedCollarComparison
    (N : ClosedOrientedManifold 3) [PreconnectedSpace N.Carrier]
    (actual : BallChart 3 ThreeModel N.Carrier)
    (model : OrientedBallEmbedding N.Carrier N.orientation)
    (feet : ι → OrientedBallEmbedding N.Carrier N.orientation)
    (hdisj : ∀ i j, i ≠ j →
      Disjoint ((feet i).chart '' Metric.closedBall 0 1) ((feet j).chart '' Metric.closedBall 0 1))
    (hactual : ∀ i, Disjoint (actual.chart '' Metric.closedBall 0 1)
      ((feet i).chart '' Metric.closedBall 0 1))
    (hmodel : ∀ i, Disjoint (model.chart '' Metric.closedBall 0 1)
      ((feet i).chart '' Metric.closedBall 0 1))
    (χ : PartialDiffeomorph (ThreeModel.prod 𝓘(ℝ, ℝ)) IX (N.Carrier × ℝ) X ∞)
    (ψ : PartialDiffeomorph (ThreeModel.prod 𝓘(ℝ, ℝ)) IY (N.Carrier × ℝ) Y ∞)
    {a b r : ℝ} (ha : 0 < a) (hab : a < b) (hbr : b < r)
    (hχ : χ.source = {p | p.2 ∈ Ioo (-r) r}) (hψ : ψ.source = {p | p.2 ∈ Ioo (-r) r}) :
    ∃ (A : ThreeSpace ≃ₗᵢ[ℝ] ThreeSpace) (Φ : PartialDiffeomorph IX IY X Y ∞),
      (A = LinearIsometryEquiv.refl ℝ ThreeSpace ∨ A = LinearIsometryEquiv.neg ℝ) ∧
      Φ.source = χ.target ∧ Φ.target = ψ.target ∧
      (∀ z ∈ Metric.closedBall (0 : ThreeSpace) 1, ∀ t : ℝ, |t| ≤ a →
        Φ (χ (actual.chart z, t)) = ψ (model.chart (A z), t) ∧
        Φ.symm (ψ (model.chart (A z), t)) = χ (actual.chart z, t)) ∧
      (∀ p : N.Carrier × ℝ, p.2 ∈ Ioo (-r) r →
        p.1 ∈ (⋃ i, (feet i).chart '' Metric.closedBall 0 1) ∨ b ≤ |p.2| →
        Φ (χ p) = ψ p ∧ Φ.symm (ψ p) = χ p) := by
  obtain ⟨A, c, hA, hc, himage⟩ := exists_orientedFootChart N actual
  let C : Set N.Carrier := ⋃ i, (feet i).chart '' Metric.closedBall 0 1
  obtain ⟨hcompact, hpre⟩ := protectedUnitFeet_compact_and_compl_preconnected N.orientation feet hdisj
  have hCactual : Disjoint (c.chart '' Metric.closedBall 0 1) C := by
    rw [himage]
    exact disjoint_iUnion_right.mpr hactual
  obtain ⟨Φ, hs, ht, hfoot, hfix⟩ := exists_relativeFootSignedCollarComparison N.orientation
    c model C hcompact hpre hCactual (disjoint_iUnion_right.mpr hmodel) χ ψ ha hab hbr hχ hψ
  refine ⟨A, Φ, hA, hs, ht, ?_, hfix⟩
  intro z hz t htz
  simpa only [hc z] using hfoot (A z) (footIsometry_mem_closedBall A hz) t htz

end FiniteFeet

namespace IsolatedOneHandle

open DifferentialGeometry.Topology.Morse DifferentialGeometry.Topology.Morse.CellAttachment
open DifferentialGeometry.Topology.Morse.ManifoldCellAttachment

variable {H M : Type} [TopologicalSpace H] [TopologicalSpace M] [ChartedSpace H M]
  {J : ModelWithCorners ℝ (MorseModel 4) H} [J.Boundaryless] [IsManifold J ∞ M]
  {f : M → ℝ} {hf : ContMDiff J 𝓘(ℝ, ℝ) ∞ f} {p : M} {lo hi : ℝ}
  (D : IsolatedOneHandle hf p lo hi)

/-- The actual buffered open chart in the Euclidean model of the incoming component. -/
def footComponentBallChart (b : CellBoundary 1) :
    letI := D.footLevelEuclideanCharts
    BallChart 3 ThreeModel (D.footComponent b) := by
  letI := D.footLevelEuclideanCharts
  exact ⟨D.footComponentChart b, D.footComponentChart_closedBall_two_subset_source b⟩

/-- The closed connected native level component with its supplied orientation. -/
def footComponentClosedOriented [T2Space M] [CompactSpace M] (b : CellBoundary 1) :
    letI := D.footLevelEuclideanCharts
    letI := D.footComponent_isManifold b
    ManifoldOrientation ThreeModel (D.footComponent b) 3 → ClosedOrientedManifold 3 := by
  letI := D.footLevelEuclideanCharts
  letI := D.footComponent_isManifold b
  letI : CompactSpace (LevelSetSpace f (f p - D.ε)) :=
    isCompact_iff_compactSpace.mp (isClosed_eq hf.continuous continuous_const).isCompact
  letI : CompactSpace (D.footComponent b) :=
    connectedComponentOpen_compactSpace (I := ThreeModel) (D.footEuclideanChart b 0)
  exact fun o => { Carrier := D.footComponent b, orientation := o }

/-- Choose the oriented chart on the actual incoming component, with exact native
unit-foot parameters after at most the central reflection. -/
theorem exists_orientedNativeFootComponentChart [T2Space M] [CompactSpace M] (b : CellBoundary 1) :
    letI := D.footLevelEuclideanCharts
    letI := D.footComponent_isManifold b
    ∀ o : ManifoldOrientation ThreeModel (D.footComponent b) 3,
      ∃ (A : ThreeSpace ≃ₗᵢ[ℝ] ThreeSpace) (e : OrientedBallEmbedding (D.footComponent b) o),
        (A = LinearIsometryEquiv.refl ℝ ThreeSpace ∨ A = LinearIsometryEquiv.neg ℝ) ∧
        (∀ z : ClosedCell 3, e.chart (A z.val) = D.footComponentPoint b z) ∧
        e.chart '' Metric.closedBall 0 1 = D.footComponentChart b '' Metric.closedBall 0 1 := by
  let := D.footLevelEuclideanCharts
  let := D.footComponent_isManifold b
  intro o
  obtain ⟨A, e, hA, he, himage⟩ := exists_orientedFootChart
    (D.footComponentClosedOriented b o) (D.footComponentBallChart b)
  exact ⟨A, e, hA, fun z => he z.val, himage⟩

end IsolatedOneHandle

end SmoothPoincare
