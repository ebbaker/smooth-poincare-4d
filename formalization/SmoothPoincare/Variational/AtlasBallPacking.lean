import SmoothPoincare.Variational.FiniteBallDivision
import DifferentialGeometry.Topology.Manifold.ChartPartialDiffeomorph

/-! # Finite measured packing by actual smooth marked chart disks -/

open DifferentialGeometry MeasureTheory Metric Set
open scoped ContDiff Manifold

namespace SmoothPoincare

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "I₄" => 𝓘(ℝ, E₄)

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H}
  [TopologicalSpace M] [ChartedSpace H M]

/-- A closed disk with a smooth parametrization defined on a neighborhood
of the full closed unit ball. -/
def IsAtlasMarkedDisk (I : ModelWithCorners ℝ E₄ H) (D : Set M) : Prop :=
  ∃ F : PartialDiffeomorph I₄ I E₄ M ∞,
    closedBall (0 : E₄) 1 ⊆ F.source ∧ D = F '' closedBall (0 : E₄) 1

private noncomputable def atlasAffineDiffeomorph (p : E₄) (r : ℝ) (hr : r ≠ 0) :
    Diffeomorph I₄ I₄ E₄ E₄ ∞ where
  toEquiv :=
    { toFun := fun x => p + r • x
      invFun := fun y => r⁻¹ • (y - p)
      left_inv := fun x => by
        change r⁻¹ • (p + r • x - p) = x
        rw [add_sub_cancel_left, smul_smul, inv_mul_cancel₀ hr, one_smul]
      right_inv := fun y => by
        change p + r • (r⁻¹ • (y - p)) = y
        rw [smul_smul, mul_inv_cancel₀ hr, one_smul]
        abel }
  contMDiff_toFun := (contDiff_const.add (contDiff_const_smul r)).contMDiff
  contMDiff_invFun := ((contDiff_const_smul r⁻¹).comp (contDiff_id.sub contDiff_const)).contMDiff

private theorem isAtlasMarkedDisk_image_closedBall
    (F : PartialDiffeomorph I₄ I E₄ M ∞) {p : E₄} {r : ℝ}
    (hr : 0 < r) (hB : closedBall p r ⊆ F.source) :
    IsAtlasMarkedDisk I (F '' closedBall p r) := by
  let A := atlasAffineDiffeomorph p r hr.ne'
  have hDist (x : E₄) : dist (A x) p = r * ‖x‖ := by
    change dist (p + r • x) p = r * ‖x‖
    rw [dist_eq_norm, add_sub_cancel_left, norm_smul, Real.norm_eq_abs, abs_of_pos hr]
  have hImage : A '' closedBall (0 : E₄) 1 = closedBall p r := by
    ext y
    constructor
    · rintro ⟨x, hx, rfl⟩
      rw [mem_closedBall, dist_zero_right] at hx
      rw [mem_closedBall, hDist]
      simpa using mul_le_mul_of_nonneg_left hx hr.le
    · intro hy
      refine ⟨A.symm y, ?_, A.apply_symm_apply y⟩
      have hDist' := hDist (A.symm y)
      rw [A.apply_symm_apply] at hDist'
      rw [mem_closedBall, hDist'] at hy
      rw [mem_closedBall, dist_zero_right]
      exact le_of_mul_le_mul_left (by simpa using hy : r * ‖A.symm y‖ ≤ r * 1) hr
  let G := A.toPartialDiffeomorph.trans F
  refine ⟨G, ?_, ?_⟩
  · intro x hx
    change x ∈ A.toPartialDiffeomorph.source ∩ A ⁻¹' F.source
    exact ⟨mem_univ _, hB (hImage ▸ mem_image_of_mem A hx)⟩
  · change F '' closedBall p r = (F ∘ A) '' closedBall (0 : E₄) 1
    rw [← hImage, image_image]
    rfl

theorem IsAtlasMarkedDisk.isClosed [T2Space M] {D : Set M} (hD : IsAtlasMarkedDisk I D) :
    IsClosed D := by
  obtain ⟨F, hF, rfl⟩ := hD
  exact ((isCompact_closedBall (0 : E₄) 1).image_of_continuousOn
    (F.contMDiffOn_toFun.continuousOn.mono hF)).isClosed

section Measures

variable [MeasurableSpace M] [BorelSpace M] [T2Space M]
  (μ : Measure M) [IsFiniteMeasure μ] [NullSingletonClass μ]

omit [T2Space M] in
/-- Push the measure of an open remainder into its chart, pack disjoint
closed balls there, and recover the disks and their measures on `M`. -/
theorem exists_fine_chart_disk_packing
    (F : PartialDiffeomorph I₄ I E₄ M ∞) {U : Set M} (hU : IsOpen U)
    {δ ε : ℝ} (hδ : 0 < δ) (hε : 0 < ε) :
    ∃ D : Finset (Set M),
      (∀ S ∈ D, IsAtlasMarkedDisk I S ∧ S ⊆ U ∩ F.target ∧ μ.real S < δ) ∧
      (D : Set (Set M)).PairwiseDisjoint id ∧ μ.real ((U ∩ F.target) \ ⋃ S ∈ D, S) < ε := by
  classical
  let ν := Measure.map F.symm (μ.restrict F.target)
  have hMeas : AEMeasurable F.symm (μ.restrict F.target) :=
    F.contMDiffOn_invFun.continuousOn.aemeasurable F.open_target.measurableSet
  have hMap (B : Set E₄) (hm : MeasurableSet B) (hB : B ⊆ F.source) : ν B = μ (F '' B) := by
    rw [Measure.map_apply_of_aemeasurable hMeas hm,
      Measure.restrict_apply' F.open_target.measurableSet]
    congr 1
    ext y
    constructor
    · rintro ⟨hy, hT⟩
      exact ⟨F.symm y, hy, F.right_inv hT⟩
    · rintro ⟨x, hx, rfl⟩
      refine ⟨?_, F.map_source (hB hx)⟩
      have hInv : F.symm.toPartialEquiv (F.toPartialEquiv x) = x := F.left_inv (hB hx)
      change F.symm.toPartialEquiv (F.toPartialEquiv x) ∈ B
      rwa [hInv]
  have hMapReal (B : Set E₄) (hm : MeasurableSet B) (hB : B ⊆ F.source) :
      ν.real B = μ.real (F '' B) := by simp only [Measure.real_def, hMap B hm hB]
  let : IsFiniteMeasure ν := Measure.isFiniteMeasure_map _ _
  let : NullSingletonClass ν := ⟨fun x => by
    by_cases hx : x ∈ F.source
    · rw [hMap {x} (measurableSet_singleton x) (singleton_subset_iff.mpr hx),
        image_singleton, measure_singleton]
    · rw [Measure.map_apply_of_aemeasurable hMeas (measurableSet_singleton x),
        Measure.restrict_apply' F.open_target.measurableSet]
      apply measure_mono_null (t := ∅) _ (measure_empty (μ := μ))
      rintro y ⟨hy, hT⟩
      exact hx ((mem_singleton_iff.mp hy) ▸ F.map_target hT)⟩
  let V := F.source ∩ F ⁻¹' U
  have hV : IsOpen V := F.contMDiffOn_toFun.continuousOn.isOpen_inter_preimage F.open_source hU
  have hVU : F '' V = U ∩ F.target := by
    ext y
    constructor
    · rintro ⟨x, ⟨hx, hU'⟩, rfl⟩
      exact ⟨hU', F.map_source hx⟩
    · intro hy
      have hInv : F.toPartialEquiv (F.symm.toPartialEquiv y) = y := F.right_inv hy.2
      refine ⟨F.symm y, ⟨F.map_target hy.2, ?_⟩, hInv⟩
      change F.toPartialEquiv (F.symm.toPartialEquiv y) ∈ U
      rw [hInv]
      exact hy.1
  obtain ⟨s, r, hBall, hDis, hRem⟩ := exists_fine_finite_ball_packing ν hV hδ hε
  let B := fun x : E₄ => closedBall x (r x)
  let D := s.image (fun x => F '' B x)
  have hSub (x : E₄) (hx : x ∈ s) : B x ⊆ F.source :=
    (hBall x hx).2.1.trans inter_subset_left
  have hUnion : (⋃ S ∈ D, S) = F '' (⋃ x ∈ s, B x) := by
    ext y
    simp [D, image_iUnion]
  refine ⟨D, ?_, ?_, ?_⟩
  · intro S hS
    obtain ⟨x, hx, rfl⟩ := Finset.mem_image.mp hS
    refine ⟨isAtlasMarkedDisk_image_closedBall F (hBall x hx).1 (hSub x hx), ?_, ?_⟩
    · rw [← hVU]
      exact image_mono (hBall x hx).2.1
    · rw [← hMapReal (B x) isClosed_closedBall.measurableSet (hSub x hx)]
      exact (hBall x hx).2.2
  · intro C hC S hS hCS
    obtain ⟨x, hx, rfl⟩ := Finset.mem_image.mp hC
    obtain ⟨y, hy, rfl⟩ := Finset.mem_image.mp hS
    have hxy : x ≠ y := fun heq => hCS (congrArg (fun p => F '' B p) heq)
    change Disjoint (F '' B x) (F '' B y)
    rw [disjoint_left]
    rintro _ ⟨a, ha, rfl⟩ ⟨b, hb, heq⟩
    have hab := F.toPartialEquiv.injOn (hSub y hy hb) (hSub x hx ha) heq
    exact (disjoint_left.mp (hDis hx hy hxy)) ha (hab ▸ hb)
  · have hEq : F '' (V \ ⋃ x ∈ s, B x) = (U ∩ F.target) \ ⋃ S ∈ D, S := by
      rw [← hVU, hUnion]
      ext y
      constructor
      · rintro ⟨x, hx, rfl⟩
        refine ⟨mem_image_of_mem F hx.1, ?_⟩
        rintro ⟨z, hz, heq⟩
        obtain ⟨a, ha, hz'⟩ := mem_iUnion₂.mp hz
        have hzx := F.toPartialEquiv.injOn (hSub a ha hz') hx.1.1 heq
        exact hx.2 (hzx ▸ hz)
      · rintro ⟨⟨x, hx, rfl⟩, hx'⟩
        exact ⟨x, ⟨hx, fun h => hx' (mem_image_of_mem F h)⟩, rfl⟩
    rw [← hEq, ← hMapReal _
      (hV.measurableSet.diff (s.measurableSet_biUnion fun _ _ => isClosed_closedBall.measurableSet))
      (sdiff_subset.trans inter_subset_left)]
    exact hRem

/-- Process a finite atlas in order, subtracting every already selected
closed disk before invoking the packing theorem on the next chart. -/
theorem exists_fine_finite_atlas_disk_packing {ι : Type*}
    (charts : ι → PartialDiffeomorph I₄ I E₄ M ∞) (t : Finset ι)
    {U : Set M} (hU : IsOpen U) {δ ε : ℝ} (hδ : 0 < δ) (hε : 0 < ε) :
    ∃ D : Finset (Set M),
      (∀ S ∈ D, IsAtlasMarkedDisk I S ∧ S ⊆ U ∧ μ.real S < δ) ∧
      (D : Set (Set M)).PairwiseDisjoint id ∧
      μ.real ((U ∩ ⋃ j ∈ t, (charts j).target) \ ⋃ S ∈ D, S) < ε := by
  classical
  induction t using Finset.induction_on generalizing ε with
  | empty => exact ⟨∅, by simp, by simp, by simpa using hε⟩
  | @insert i t hit ih =>
    obtain ⟨D, hD, hDis, hRem⟩ := ih (half_pos hε)
    let R := U \ ⋃ S ∈ D, S
    have hR : IsOpen R := hU.sdiff (isClosed_biUnion_finset fun S hS => (hD S hS).1.isClosed)
    obtain ⟨E, hE, hDis', hRem'⟩ := exists_fine_chart_disk_packing μ (charts i) hR hδ (half_pos hε)
    refine ⟨D ∪ E, ?_, ?_, ?_⟩
    · intro S hS
      rcases Finset.mem_union.mp hS with hS | hS
      · exact hD S hS
      · exact ⟨(hE S hS).1, (hE S hS).2.1.trans (inter_subset_left.trans sdiff_subset),
          (hE S hS).2.2⟩
    · have hCross : ∀ S ∈ D, ∀ T ∈ E, Disjoint S T := by
        intro S hS T hT
        rw [disjoint_left]
        intro x hxS hxT
        exact ((hE T hT).2.1 hxT).1.2 (mem_iUnion₂.mpr ⟨S, hS, hxS⟩)
      intro S hS T hT hST
      rcases Finset.mem_union.mp hS with hS | hS <;> rcases Finset.mem_union.mp hT with hT | hT
      · exact hDis hS hT hST
      · exact hCross S hS T hT
      · exact (hCross T hT S hS).symm
      · exact hDis' hS hT hST
    · let X := (U ∩ ⋃ j ∈ t, (charts j).target) \ ⋃ S ∈ D, S
      let Y := (R ∩ (charts i).target) \ ⋃ S ∈ E, S
      have hSub : ((U ∩ ⋃ j ∈ insert i t, (charts j).target) \ ⋃ S ∈ D ∪ E, S) ⊆ X ∪ Y := by
        intro x hx
        have hxD : x ∉ ⋃ S ∈ D, S := by
          rintro hx'
          obtain ⟨S, hS, hxS⟩ := mem_iUnion₂.mp hx'
          exact hx.2 (mem_iUnion₂.mpr ⟨S, Finset.mem_union_left E hS, hxS⟩)
        obtain ⟨j, hj, hxj⟩ := mem_iUnion₂.mp hx.1.2
        rcases Finset.mem_insert.mp hj with rfl | hj
        · refine Or.inr ⟨⟨⟨hx.1.1, hxD⟩, hxj⟩, ?_⟩
          rintro hx'
          obtain ⟨S, hS, hxS⟩ := mem_iUnion₂.mp hx'
          exact hx.2 (mem_iUnion₂.mpr ⟨S, Finset.mem_union_right D hS, hxS⟩)
        · exact Or.inl ⟨⟨hx.1.1, mem_iUnion₂.mpr ⟨j, hj, hxj⟩⟩, hxD⟩
      apply (measureReal_mono (μ := μ) hSub).trans_lt
      apply (measureReal_union_le (μ := μ) X Y).trans_lt
      exact (add_lt_add hRem hRem').trans_eq (by ring)

/-- A compact smooth boundaryless four-manifold supplies the finite atlas.
Every disk lies in the prescribed open set, has arbitrarily small mass,
and the finite disjoint union exhausts that open set up to a tolerance. -/
theorem exists_fine_atlas_disk_packing [I.Boundaryless] [IsManifold I ∞ M] [CompactSpace M]
    {U : Set M} (hU : IsOpen U) {δ ε : ℝ} (hδ : 0 < δ) (hε : 0 < ε) :
    ∃ D : Finset (Set M),
      (∀ S ∈ D, IsAtlasMarkedDisk I S ∧ S ⊆ U ∧ μ.real S < δ) ∧
      (D : Set (Set M)).PairwiseDisjoint id ∧ μ.real (U \ ⋃ S ∈ D, S) < ε := by
  let charts (x : M) := (extChartAtPartialDiffeomorph I ∞ x).symm
  have hCover : (univ : Set M) ⊆ ⋃ x, (charts x).target :=
    fun x _ => mem_iUnion.mpr ⟨x, mem_extChartAt_source (I := I) x⟩
  obtain ⟨t, ht⟩ := isCompact_univ.elim_finite_subcover _ (fun x => (charts x).open_target) hCover
  obtain ⟨D, hD, hDis, hRem⟩ := exists_fine_finite_atlas_disk_packing μ charts t hU hδ hε
  have hEq : (⋃ j ∈ t, (charts j).target) = univ := subset_antisymm (subset_univ _) ht
  rw [hEq, inter_univ] at hRem
  exact ⟨D, hD, hDis, hRem⟩

end Measures

end SmoothPoincare
