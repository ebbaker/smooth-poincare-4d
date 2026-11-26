import SmoothPoincare.Variational.AtlasBallPacking
import SmoothPoincare.Variational.MarkedDivisionIteration

/-! # Dividing physical measures by selecting actual marked disks -/

open DifferentialGeometry DifferentialGeometry.Integral.Measure Filter FirstOrderTwistor MeasureTheory Set
open scoped ContDiff Manifold Topology

namespace SmoothPoincare

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "I₄" => 𝓘(ℝ, E₄)

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M] [CompactSpace M]
private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

/-- All four simultaneous mass constraints hold on one finite disjoint family
of smooth closed chart disks in the open physical region. The entire discarded
packing mass is small as well, so separation suffices to assemble an outer disk. -/
theorem exists_four_measure_atlas_division (μ : Fin 4 → Measure M)
    [∀ j, IsFiniteMeasure (μ j)] [∀ j, NullSingletonClass (μ j)]
    {U : Set M} (hU : IsOpen U) {ε : ℝ} (hε : 0 < ε) :
    ∃ (D A : Finset (Set M)), A ⊆ D ∧
      (∀ S ∈ D, IsAtlasMarkedDisk I S ∧ S ⊆ U) ∧ (D : Set (Set M)).PairwiseDisjoint id ∧
      ∀ j, (μ j).real (U \ ⋃ S ∈ D, S) < ε ∧
        |(μ j).real (⋃ S ∈ A, S) - (μ j).real (⋃ S ∈ D, S) / 2| < ε / 2 := by
  classical
  let ν := ∑ j, μ j
  have hsum (S : Set M) : ν.real S = ∑ j, (μ j).real S := by
    simp [ν, Measure.real_def, Measure.finsetSum_apply, ENNReal.toReal_sum]
  have hle (j) (S : Set M) : (μ j).real S ≤ ν.real S := by
    rw [hsum]
    exact Finset.single_le_sum (fun _ _ => measureReal_nonneg) (Finset.mem_univ j)
  let : NullSingletonClass ν := ⟨fun x => by simp [ν, Measure.finsetSum_apply]⟩
  let δ := ε ^ 2 / (1 + ν.real univ)
  have hden : 0 < 1 + ν.real univ := by linarith [measureReal_nonneg (μ := ν) (s := univ)]
  have hδ : 0 < δ := div_pos (sq_pos_of_pos hε) hden
  obtain ⟨D, hD, hd, hr⟩ := exists_fine_atlas_disk_packing (I := I) ν hU hδ hε
  have hm (S : Set M) (hS : S ∈ D) : MeasurableSet S := (hD S hS).1.isClosed.measurableSet
  have hBudget : (∑ S ∈ D, ∑ j, ((μ j).real S) ^ 2) < ε ^ 2 := calc
    _ ≤ ∑ S ∈ D, ∑ j, δ * (μ j).real S := by
      apply Finset.sum_le_sum
      intro S hS
      apply Finset.sum_le_sum
      intro j _
      rw [sq]
      exact mul_le_mul_of_nonneg_right ((hle j _).trans (hD S hS).2.2.le) measureReal_nonneg
    _ = δ * ν.real (⋃ S ∈ D, S) := by
      rw [show ν.real (⋃ S ∈ D, S) = ∑ S ∈ D, ν.real S from
        measureReal_biUnion_finset (f := id) hd hm]
      simp_rw [hsum, Finset.mul_sum]
    _ < δ * (1 + ν.real univ) := by
      apply mul_lt_mul_of_pos_left _ hδ
      linarith [measureReal_mono (μ := ν) (subset_univ (⋃ S ∈ D, S))]
    _ = ε ^ 2 := div_mul_cancel₀ _ hden.ne'
  obtain ⟨A, hAD, hA⟩ := exists_bisecting_measured_subfamily μ D id hd hm
  refine ⟨D, A, hAD, fun S hS => ⟨(hD S hS).1, (hD S hS).2.1⟩, hd, fun j =>
    ⟨(hle j _).trans_lt hr, ?_⟩⟩
  have hroot := (Real.sqrt_lt_sqrt (by positivity) hBudget)
  rw [Real.sqrt_sq hε.le] at hroot
  exact (hA j).trans_lt (div_lt_div_of_pos_right hroot (by norm_num))

/-- A single finite disjoint family of smooth marked disks approximately
bisects all four full masses on any open region of the manifold. -/
theorem exists_bisecting_marked_disks (μ : Fin 4 → Measure M)
    [∀ j, IsFiniteMeasure (μ j)] [∀ j, NullSingletonClass (μ j)]
    {U : Set M} (hU : IsOpen U) {ε : ℝ} (hε : 0 < ε) :
    ∃ A : Finset (Set M), (∀ S ∈ A, IsAtlasMarkedDisk I S ∧ S ⊆ U) ∧
      (A : Set (Set M)).PairwiseDisjoint id ∧
      ∀ j, |(μ j).real (⋃ S ∈ A, S) - (μ j).real U / 2| < ε := by
  classical
  obtain ⟨D, A, hAD, hD, hd, hm⟩ := exists_four_measure_atlas_division (I := I) μ hU hε
  refine ⟨A, fun S hS => hD S (hAD hS),
    fun _ hS _ hV hne => hd (hAD hS) (hAD hV) hne, fun j => ?_⟩
  obtain ⟨hmiss, hb⟩ := hm j
  have hsub := iUnion₂_subset (fun S hS => (hD S hS).2)
  rw [measureReal_sdiff hsub (D.measurableSet_biUnion fun S hS => (hD S hS).1.isClosed.measurableSet)] at hmiss
  rw [abs_lt] at hb ⊢
  constructor <;> linarith [hb.1, hb.2, measureReal_mono (μ := μ j) hsub]

private local instance : MeasurableSpace E₄ := borel E₄
private local instance : BorelSpace E₄ := ⟨rfl⟩

/-- The boundary of an actual marked closed disk has zero mass for any
finite measure absolutely continuous with respect to physical volume. -/
theorem markedDisk_seam_null (g : SmoothRiemannianMetric I M) (μ : Measure M)
    (hac : μ ≪ riemannianVolumeMeasure I M g) (Q : PartialDiffeomorph I₄ I E₄ M ∞)
    (hQ : Metric.closedBall (0 : E₄) 1 ⊆ Q.source) :
    μ (selectedChartDisk Q \ interior (selectedChartDisk Q)) = 0 := by
  apply hac
  rw [interior_selectedChartDisk Q hQ]
  apply measure_mono_null (subset_image_sdiff _ _ _)
  rw [Metric.closedBall_sdiff_ball]
  exact riemannianVolumeMeasure_image_eq_zero_of_mdifferentiableOn g
    ((Q.mdifferentiableOn (by simp)).mono (Metric.sphere_subset_closedBall.trans hQ))
    (Measure.addHaar_sphere _ _ _)

/-- Only a geometric separation of finite disjoint marked disks is required
to turn the measured atlas packing into one balanced marked outer disk.
The choice of which disks to retain is already made by the theorem. -/
theorem exists_marked_four_measure_half_of_separation
    (g : SmoothRiemannianMetric I M) (μ : Fin 4 → Measure M)
    [∀ j, IsFiniteMeasure (μ j)] [∀ j, NullSingletonClass (μ j)]
    (hac : ∀ j, μ j ≪ riemannianVolumeMeasure I M g)
    (Q : PartialDiffeomorph I₄ I E₄ M ∞) (hQ : Metric.closedBall (0 : E₄) 1 ⊆ Q.source)
    (separate : ∀ (D A : Finset (Set M)), A ⊆ D →
      (∀ S ∈ D, IsAtlasMarkedDisk I S ∧ S ⊆ (selectedChartDisk Q)ᶜ) →
      (D : Set (Set M)).PairwiseDisjoint id →
      ∃ B : PartialDiffeomorph I₄ I E₄ M ∞, Metric.closedBall (0 : E₄) 1 ⊆ B.source ∧
        selectedChartDisk Q ⊆ B '' Metric.ball 0 1 ∧
        (interior (selectedChartDisk B))ᶜ ∩ (⋃ S ∈ D, S) = ⋃ S ∈ A, S)
    {ε : ℝ} (hε : 0 < ε) :
    ∃ m : NestedBalancedDisks I M, m.core = Q ∧ ∀ j,
      |(μ j).real (interior (selectedChartDisk m.outer))ᶜ -
        (μ j).real (interior (selectedChartDisk Q))ᶜ / 2| < ε := by
  classical
  let C := selectedChartDisk Q
  have hC : IsClosed C := (isCompact_selectedChartDisk Q hQ).isClosed
  obtain ⟨D, A, hAD, hD, hd, hmass⟩ :=
    exists_four_measure_atlas_division (I := I) μ hC.isOpen_compl hε
  obtain ⟨B, hB, hi, hTrace⟩ := separate D A hAD hD hd
  refine ⟨⟨Q, B, hQ, hB, hi⟩, rfl, fun j => ?_⟩
  let K := ⋃ S ∈ D, S
  have hK : MeasurableSet K := D.measurableSet_biUnion fun S hS => (hD S hS).1.isClosed.measurableSet
  have hKU : K ⊆ Cᶜ := iUnion₂_subset fun S hS => (hD S hS).2
  have hNest : interior C ⊆ interior (selectedChartDisk B) := by
    rw [interior_selectedChartDisk B hB]
    exact interior_subset.trans hi
  have hnull := markedDisk_seam_null g (μ j) (hac j) Q hQ
  have hmiss : (μ j).real ((interior C)ᶜ \ K) ≤ (μ j).real (Cᶜ \ K) := by
    have hsub : (interior C)ᶜ \ K ⊆ (Cᶜ \ K) ∪ (C \ interior C) := by
      intro x hx
      by_cases hc : x ∈ C
      · exact Or.inr ⟨hc, hx.1⟩
      · exact Or.inl ⟨hc, hx.2⟩
    have hh := (measureReal_mono (μ := μ j) hsub).trans (measureReal_union_le _ _)
    simpa [Measure.real_def, C, hnull] using hh
  obtain ⟨hr, hb⟩ := hmass j
  have hEstimate := halfDivision_of_packing_trace (μ j) hK (hKU.trans (compl_subset_compl.mpr interior_subset))
    (compl_subset_compl.mpr hNest) hTrace hb.le
  apply hEstimate.trans_lt
  linarith [hmiss.trans_lt hr]

end SmoothPoincare
