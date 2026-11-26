import SmoothPoincare.Heights.MarkedEdgeGluing
import DifferentialGeometry.Topology.Covering.SimplyConnected
import DifferentialGeometry.Topology.Manifold.ClosedBall
import Mathlib.Analysis.Normed.Module.Connected

/-! # Covering the independently specified round edge ball -/

open DifferentialGeometry.Topology Set
open scoped ContDiff Manifold

namespace SmoothPoincare

noncomputable section

variable {E F : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [NormedAddCommGroup F] [NormedSpace ℝ F]
  {H K : Type*} [TopologicalSpace H] [TopologicalSpace K]
  {I : ModelWithCorners ℝ E H} {J : ModelWithCorners ℝ F K}
  {M N : Type*} [TopologicalSpace M] [ChartedSpace H M]
  [TopologicalSpace N] [ChartedSpace K N]

/-- Forward agreements on all actual source overlaps give a local
diffeomorphism into the specified target, including its relative boundary
charts. Compactness, connectedness and simple connectedness give one sheet.
Consequently the target is covered and all inverse agreements follow. -/
theorem exists_markedPatchDiffeomorph_of_compactCover
    [CompactSpace M] [T2Space M] [ConnectedSpace M] [T2Space N]
    [SimplyConnectedSpace N] [LocallyPathConnectedSpace N]
    {ι : Type*} (P : ι → PartialDiffeomorph I J M N ∞)
    (hCover : ∀ x, ∃ i, x ∈ (P i).source)
    (hForward : ∀ i j, EqOn (P i) (P j) ((P i).source ∩ (P j).source)) :
    ∃ e : M ≃ₘ^∞⟮I,J⟯ N,
      (∀ i, EqOn e (P i) (P i).source ∧ EqOn e.symm (P i).symm (P i).target) ∧
      (⋃ i, (P i).target) = univ := by
  classical
  let f : M → N := fun x => P (hCover x).choose x
  have hEq (i : ι) : EqOn f (P i) (P i).source :=
    fun x hx => hForward (hCover x).choose i ⟨(hCover x).choose_spec, hx⟩
  have hLocal : IsLocalDiffeomorph I J ∞ f := by
    intro x
    obtain ⟨i, hi⟩ := hCover x
    exact ⟨P i, hi, hEq i⟩
  have hMap : IsCoveringMap f := hLocal.isLocalHomeomorph.covering_compact
  let e := hLocal.diffeomorphOfBijective hMap.bijective_sc
  refine ⟨e, fun i => ⟨hEq i, ?_⟩, eq_univ_of_forall ?_⟩
  · intro y hy
    apply e.injective
    change e (e.symm y) = f ((P i).symm y)
    exact (e.apply_symm_apply y).trans
      (((hEq i ((P i).map_target hy)).trans ((P i).right_inv hy)).symm)
  · intro y
    obtain ⟨x, rfl⟩ := e.surjective y
    obtain ⟨i, hi⟩ := hCover x
    apply mem_iUnion.mpr
    refine ⟨i, ?_⟩
    change f x ∈ (P i).target
    rw [hEq i hi]
    exact (P i).map_source hi

section UnitBall

local instance : ChartedSpace (EuclideanHalfSpace 4) (ClosedCell 4) :=
  Handle.closedCellChartedSpaceSucc 3

/-- The target atlas is the pinned smooth atlas on the literal Euclidean
unit four-ball. The local maps land in that ball before coverage is proved. -/
theorem exists_markedPatchDiffeomorph_of_unitBallCover
    [CompactSpace M] [T2Space M] [ConnectedSpace M]
    {ι : Type*} (P : ι → PartialDiffeomorph I (𝓡∂ 4) M (ClosedCell 4) ∞)
    (hCover : ∀ x, ∃ i, x ∈ (P i).source)
    (hForward : ∀ i j, EqOn (P i) (P j) ((P i).source ∩ (P j).source)) :
    ∃ e : M ≃ₘ^∞⟮I,𝓡∂ 4⟯ ClosedCell 4,
      (∀ i, EqOn e (P i) (P i).source ∧ EqOn e.symm (P i).symm (P i).target) ∧
      (⋃ i, (P i).target) = univ := by
  have hConvex : Convex ℝ ({x : EuclideanSpace ℝ (Fin 4) | ‖x‖ ≤ 1} : Set _) := by
    simpa only [Metric.closedBall, dist_zero_right] using
      convex_closedBall (0 : EuclideanSpace ℝ (Fin 4)) (1 : ℝ)
  let : ContractibleSpace (ClosedCell 4) := hConvex.contractibleSpace ⟨0, by simp⟩
  let : LocallyPathConnectedSpace (ClosedCell 4) := hConvex.locallyPathConnectedSpace
  exact exists_markedPatchDiffeomorph_of_compactCover P hCover hForward

end UnitBall

end

end SmoothPoincare
