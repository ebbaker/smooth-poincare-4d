import DifferentialGeometry.Topology.Manifold.EmbeddedBallContraction
import SmoothPoincare.PhysicalScales.SelectedComparisonDisks

/-! # One diffeomorphism contracts a finite collection of marked disks -/

open DifferentialGeometry DifferentialGeometry.Topology.Manifold
open Filter Set
open scoped ContDiff Manifold Topology

namespace SmoothPoincare

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "I₄" => 𝓘(ℝ, E₄)
local notation "D₄" => Metric.closedBall (0 : E₄) 1

variable {ι H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H}
  [TopologicalSpace M] [ChartedSpace H M] [T2Space M]

private theorem exists_markedDisk_contraction_in_open
    (F : PartialDiffeomorph I₄ I E₄ M ∞) (hDisk : D₄ ⊆ F.source)
    {U V : Set M} (hU : IsOpen U) (hCenter : F 0 ∈ U)
    (hV : IsOpen V) (hContain : selectedChartDisk F ⊆ V) :
    ∃ ψ : Diffeomorph I I M M ∞, ψ '' selectedChartDisk F ⊆ selectedChartDisk F ∩ U ∧
      ∀ x, x ∉ V → ψ x = x := by
  obtain ⟨J, _, _, _, hRad, K, _, hKV, _, hFix⟩ :=
    exists_diffeomorphs_contracting_embedded_closedBall F zero_lt_one hDisk hV hContain
  have hZero : (0 : E₄) ∈ F.source := hDisk (Metric.mem_closedBall_self zero_le_one)
  have hCont : ContinuousAt F (0 : E₄) :=
    F.contMDiffOn.continuousOn.continuousAt (F.open_source.mem_nhds hZero)
  obtain ⟨δ, hδ, hδU⟩ := Metric.mem_nhds_iff.mp
    (hCont.preimage_mem_nhds (hU.mem_nhds hCenter))
  have hExp : Tendsto (fun t : ℝ => Real.exp (-t)) atTop (𝓝 0) :=
    Real.tendsto_exp_atBot.comp tendsto_neg_atTop_atBot
  obtain ⟨t, ht, htδ⟩ := ((eventually_ge_atTop (0 : ℝ)).and
    (hExp.eventually_lt_const hδ)).exists
  refine ⟨J t, ?_, fun x hx => (hFix t x (fun hxK => hx (hKV hxK))).1⟩
  rintro _ ⟨_, ⟨x, hx, rfl⟩, rfl⟩
  rw [hRad t x ht hx]
  have hScaled : ‖Real.exp (-t) • x‖ ≤ Real.exp (-t) := by
    rw [norm_smul, Real.norm_eq_abs, abs_of_pos (Real.exp_pos _)]
    exact mul_le_of_le_one_right (Real.exp_pos _).le
      (by simpa only [Metric.mem_closedBall, dist_zero_right] using hx)
  have hExpLe : Real.exp (-t) ≤ 1 := Real.exp_le_one_iff.mpr (neg_nonpos.mpr ht)
  refine ⟨⟨_, ?_, rfl⟩, ?_⟩
  · rw [Metric.mem_closedBall, dist_zero_right]
    exact hScaled.trans hExpLe
  · apply hδU
    rw [Metric.mem_ball, dist_zero_right]
    exact hScaled.trans_lt htδ

/-- One ambient smooth diffeomorphism contracts every disk of a finite
pairwise disjoint family into the prescribed neighborhood of its chart
center, inside the same disk. It fixes a disjoint closed set pointwise. -/
theorem exists_diffeomorph_contracting_finiteMarkedDisks_fixing
    (s : Finset ι) (F : ι → PartialDiffeomorph I₄ I E₄ M ∞)
    (hDisk : ∀ i ∈ s, D₄ ⊆ (F i).source)
    (hDisj : (s : Set ι).PairwiseDisjoint (fun i => selectedChartDisk (F i)))
    (U : ι → Set M) (hOpen : ∀ i ∈ s, IsOpen (U i))
    (hCenter : ∀ i ∈ s, F i 0 ∈ U i)
    {C : Set M} (hClosed : IsClosed C)
    (hDisjC : ∀ i ∈ s, Disjoint (selectedChartDisk (F i)) C) :
    ∃ ψ : Diffeomorph I I M M ∞,
      (∀ i ∈ s, ψ '' selectedChartDisk (F i) ⊆ selectedChartDisk (F i) ∩ U i) ∧
      ∀ x ∈ C, ψ x = x := by
  classical
  let D := fun i => selectedChartDisk (F i)
  have hLocal (i : ι) (hi : i ∈ s) : ∃ g : Diffeomorph I I M M ∞,
      g '' D i ⊆ D i ∩ U i ∧
      (∀ j ∈ s, j ≠ i → ∀ x ∈ D j, g x = x) ∧ ∀ x ∈ C, g x = x := by
    let others := ⋃ j ∈ s.erase i, D j
    have hOthers : IsClosed others := isClosed_biUnion_finset fun j hj =>
      (isCompact_selectedChartDisk (F j) (hDisk j (Finset.mem_of_mem_erase hj))).isClosed
    have hV : IsOpen (Cᶜ ∩ othersᶜ) := hClosed.isOpen_compl.inter hOthers.isOpen_compl
    have hContain : D i ⊆ Cᶜ ∩ othersᶜ := by
      intro x hx
      refine ⟨disjoint_left.mp (hDisjC i hi) hx, fun hOther => ?_⟩
      obtain ⟨j, hj, hxj⟩ := mem_iUnion₂.mp hOther
      exact disjoint_left.mp
        (hDisj hi (Finset.mem_of_mem_erase hj) (Finset.ne_of_mem_erase hj).symm) hx hxj
    obtain ⟨g, hg, hgFix⟩ := exists_markedDisk_contraction_in_open (F i) (hDisk i hi)
      (hOpen i hi) (hCenter i hi) hV hContain
    refine ⟨g, hg, ?_, fun x hx => hgFix x (fun hxV => hxV.1 hx)⟩
    intro j hj hji x hx
    apply hgFix x
    intro hxV
    exact hxV.2 (mem_iUnion₂.mpr ⟨j, Finset.mem_erase.mpr ⟨hji, hj⟩, hx⟩)
  have hBuild (t : Finset ι) :
      t ⊆ s → ∃ ψ : Diffeomorph I I M M ∞,
        (∀ i ∈ t, ψ '' D i ⊆ D i ∩ U i) ∧
        (∀ j ∈ s, j ∉ t → ∀ x ∈ D j, ψ x = x) ∧ ∀ x ∈ C, ψ x = x := by
    induction t using Finset.induction_on with
    | empty =>
      intro _
      exact ⟨Diffeomorph.refl I M ∞, by simp, fun _ _ _ _ _ => rfl, fun _ _ => rfl⟩
    | @insert i t hi ih =>
      intro hSub
      have his : i ∈ s := hSub (Finset.mem_insert_self i t)
      have hts : t ⊆ s := fun j hj => hSub (Finset.mem_insert_of_mem hj)
      obtain ⟨ψ, hPast, hOther, hFix⟩ := ih hts
      obtain ⟨g, hg, hgOther, hgFix⟩ := hLocal i his
      refine ⟨ψ.trans g, ?_, ?_, ?_⟩
      · intro j hj
        rintro _ ⟨x, hx, rfl⟩
        change g (ψ x) ∈ D j ∩ U j
        rcases Finset.mem_insert.mp hj with hji | hj
        · subst j
          rw [hOther i his hi x hx]
          exact hg ⟨x, hx, rfl⟩
        · have hRes : ψ x ∈ D j ∩ U j := hPast j hj ⟨x, hx, rfl⟩
          have hji : j ≠ i := fun hji => hi (hji ▸ hj)
          rwa [hgOther j (hts hj) hji _ hRes.1]
      · intro j hjs hj x hx
        change g (ψ x) = x
        have hjt : j ∉ t := fun hjt => hj (Finset.mem_insert_of_mem hjt)
        have hji : j ≠ i := fun hji => hj (Finset.mem_insert.mpr (Or.inl hji))
        rw [hOther j hjs hjt x hx, hgOther j hjs hji x hx]
      · intro x hx
        change g (ψ x) = x
        rw [hFix x hx, hgFix x hx]
  obtain ⟨ψ, hψ, _, hFix⟩ := hBuild s Subset.rfl
  exact ⟨ψ, hψ, hFix⟩

/-- Simultaneous contraction on a finite family of disjoint marked disks. -/
theorem exists_diffeomorph_contracting_finiteMarkedDisks
    (s : Finset ι) (F : ι → PartialDiffeomorph I₄ I E₄ M ∞)
    (hDisk : ∀ i ∈ s, D₄ ⊆ (F i).source)
    (hDisj : (s : Set ι).PairwiseDisjoint (fun i => selectedChartDisk (F i)))
    (U : ι → Set M) (hOpen : ∀ i ∈ s, IsOpen (U i))
    (hCenter : ∀ i ∈ s, F i 0 ∈ U i) :
    ∃ ψ : Diffeomorph I I M M ∞,
      ∀ i ∈ s, ψ '' selectedChartDisk (F i) ⊆ selectedChartDisk (F i) ∩ U i := by
  obtain ⟨ψ, hψ, _⟩ := exists_diffeomorph_contracting_finiteMarkedDisks_fixing
    s F hDisk hDisj U hOpen hCenter isClosed_empty (fun _ _ => disjoint_empty _)
  exact ⟨ψ, hψ⟩

end SmoothPoincare
