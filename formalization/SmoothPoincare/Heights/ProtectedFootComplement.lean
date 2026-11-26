import SmoothPoincare.Heights.RelativeFootCollar
import DifferentialGeometry.Topology.ClosedBallComplement

/-! # Compact protected foot balls with preconnected complement -/

set_option autoImplicit false

open Set Manifold
open scoped ContDiff Manifold
open DifferentialGeometry DifferentialGeometry.PDE.RicciFlow.Surgery.Topology

namespace SmoothPoincare

variable {L ι : Type*} [TopologicalSpace L] [ChartedSpace ThreeSpace L]
  [T2Space L] [PreconnectedSpace L] [Finite ι]

/-- The finite union of pairwise disjoint marked closed balls in a three-dimensional
level is compact and has preconnected complement. Each ball has room in its open chart.
The larger chart neighborhoods may meet each other. -/
theorem protectedFootBalls_compact_and_compl_preconnected
    (e : ι → PartialDiffeomorph ThreeModel ThreeModel ThreeSpace L ∞) (r : ι → ℝ)
    (hr : ∀ i, 0 ≤ r i) (hsource : ∀ i, Metric.closedBall 0 (r i) ⊆ (e i).source)
    (hdisj : ∀ i j, i ≠ j →
      Disjoint (e i '' Metric.closedBall 0 (r i)) (e j '' Metric.closedBall 0 (r j))) :
    IsCompact (⋃ i, e i '' Metric.closedBall 0 (r i)) ∧
    IsPreconnected ((⋃ i, e i '' Metric.closedBall 0 (r i))ᶜ : Set L) := by
  have hrank : 1 < Module.rank ℝ ThreeSpace := by
    rw [← Module.finrank_eq_rank, finrank_euclideanSpace, Fintype.card_fin]
    norm_num
  refine ⟨isCompact_iUnion ?_, ?_⟩
  · intro i
    exact (isCompact_closedBall (0 : ThreeSpace) (r i)).image_of_continuousOn
      ((e i).contMDiffOn.continuousOn.mono (hsource i))
  · exact DifferentialGeometry.Topology.isPreconnected_compl_iUnion_image_closedBall
      (fun i => (e i).toOpenPartialHomeomorph) r hrank hr hsource hdisj

variable [IsManifold ThreeModel ∞ L]

/-- The protected set of distinct unit feet satisfies both relative-isotopy set hypotheses. -/
theorem protectedUnitFeet_compact_and_compl_preconnected
    (o : ManifoldOrientation ThreeModel L 3) (feet : ι → OrientedBallEmbedding L o)
    (hdisj : ∀ i j, i ≠ j →
      Disjoint ((feet i).chart '' Metric.closedBall 0 1)
        ((feet j).chart '' Metric.closedBall 0 1)) :
    IsCompact (⋃ i, (feet i).chart '' Metric.closedBall 0 1) ∧
    IsPreconnected ((⋃ i, (feet i).chart '' Metric.closedBall 0 1)ᶜ : Set L) :=
  protectedFootBalls_compact_and_compl_preconnected (fun i => (feet i).chart) (fun _ => 1)
    (fun _ => zero_le_one)
    (fun i => (Metric.closedBall_subset_closedBall (by norm_num : (1 : ℝ) ≤ 2)).trans
      (feet i).closedBall_subset_source) hdisj

/-- Relative normalization outside any finite pairwise disjoint family of protected unit
feet on the same level, provided both of the moving foot images avoid every protected foot. -/
theorem exists_relativeFootLevelIsotopy_awayFromFiniteFeet
    (o : ManifoldOrientation ThreeModel L 3) (e e' : OrientedBallEmbedding L o)
    (feet : ι → OrientedBallEmbedding L o)
    (hdisj : ∀ i j, i ≠ j →
      Disjoint ((feet i).chart '' Metric.closedBall 0 1)
        ((feet j).chart '' Metric.closedBall 0 1))
    (he : ∀ i, Disjoint (e.chart '' Metric.closedBall 0 1)
      ((feet i).chart '' Metric.closedBall 0 1))
    (he' : ∀ i, Disjoint (e'.chart '' Metric.closedBall 0 1)
      ((feet i).chart '' Metric.closedBall 0 1)) :
    ∃ A : SupportedLevelIsotopy ThreeModel (⋃ i, (feet i).chart '' Metric.closedBall 0 1),
      ∀ z ∈ Metric.closedBall 0 1, A.isotopy 1 (e.chart z) = e'.chart z := by
  obtain ⟨hcompact, hpre⟩ := protectedUnitFeet_compact_and_compl_preconnected o feet hdisj
  exact exists_relativeFootLevelIsotopy o e e' _ hcompact hpre
    (disjoint_iUnion_right.mpr he) (disjoint_iUnion_right.mpr he')

end SmoothPoincare
