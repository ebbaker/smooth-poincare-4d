import SmoothPoincare.Variational.MarkedAtlasDivision
import SmoothPoincare.Variational.FiniteDiskContraction
import SmoothPoincare.Variational.FinitePointRouting
import SmoothPoincare.PhysicalScales.ProtectedMarkedTrims

/-! # One smooth marked disk separating a finite choice of marked disks -/

open DifferentialGeometry DifferentialGeometry.Integral.Measure MeasureTheory Set
open scoped ContDiff Manifold Topology

namespace SmoothPoincare

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "I₄" => 𝓘(ℝ, E₄)

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]

omit [I.Boundaryless] [IsManifold I ∞ M] [T2Space M] in
private theorem markedDisk_compl_nonempty (Q : PartialDiffeomorph I₄ I E₄ M ∞)
    (hQ : Metric.closedBall (0 : E₄) 1 ⊆ Q.source) : (selectedChartDisk Q)ᶜ.Nonempty := by
  by_contra h
  have hall : selectedChartDisk Q = univ := by
    apply eq_univ_of_forall
    intro x
    by_contra hx
    exact h ⟨x, hx⟩
  obtain ⟨e, he⟩ : ∃ e : E₄, ‖e‖ = 1 := exists_norm_eq E₄ (by norm_num : (0 : ℝ) ≤ 1)
  have hi : Q e ∈ interior (selectedChartDisk Q) := by simp [hall]
  rw [interior_selectedChartDisk Q hQ] at hi
  obtain ⟨v, hv, heq⟩ := hi
  have hev : v = e := Q.injOn (hQ (Metric.ball_subset_closedBall hv))
    (hQ (by simp [Metric.mem_closedBall, dist_zero_right, he])) heq
  simp [hev, Metric.mem_ball, dist_zero_right, he] at hv

omit [I.Boundaryless] [IsManifold I ∞ M] in
/-- Once the finitely many centers can be moved into chosen open targets,
local contractions send the entire original disks there. Pulling back the
original chart then realizes the prescribed trace, with a full buffer at every
enclosed disk. No charge is measured in a transported metric. -/
theorem exists_markedDisk_separator_of_point_routing
    (route : ∀ (K : Finset (Set M)) (x : K → M), Function.Injective x →
      ∀ V : K → Set M, (∀ i, IsOpen (V i)) → (∀ i, (V i).Nonempty) →
        ∃ T : Diffeomorph I I M M ∞, ∀ i, T (x i) ∈ V i)
    (Q : PartialDiffeomorph I₄ I E₄ M ∞) (hQ : Metric.closedBall (0 : E₄) 1 ⊆ Q.source)
    (D A : Finset (Set M)) (hAD : A ⊆ D)
    (hD : ∀ S ∈ D, IsAtlasMarkedDisk I S ∧ S ⊆ (selectedChartDisk Q)ᶜ)
    (hd : (D : Set (Set M)).PairwiseDisjoint id) :
    ∃ B : PartialDiffeomorph I₄ I E₄ M ∞, Metric.closedBall (0 : E₄) 1 ⊆ B.source ∧
      selectedChartDisk Q ⊆ B '' Metric.ball 0 1 ∧
      (interior (selectedChartDisk B))ᶜ ∩ (⋃ S ∈ D, S) = ⋃ S ∈ A, S := by
  classical
  let C := selectedChartDisk Q
  let K := insert C D
  have zmem (F : PartialDiffeomorph I₄ I E₄ M ∞) : F 0 ∈ selectedChartDisk F :=
    ⟨0, Metric.mem_closedBall_self (by norm_num), rfl⟩
  have hCD : C ∉ D := fun hc => (hD C hc).2 (zmem Q) (zmem Q)
  have marks (i : K) : IsAtlasMarkedDisk I i.val := by
    rcases Finset.mem_insert.mp i.property with hi | hi
    · rw [hi]
      exact ⟨Q, hQ, rfl⟩
    · exact (hD _ hi).1
  choose F hs hF using marks
  have hcdis (S : Set M) (hS : S ∈ D) : Disjoint C S :=
    disjoint_left.mpr fun _ hx hy => (hD S hS).2 hy hx
  have dis : (K : Set (Set M)).PairwiseDisjoint id := by
    intro X hX Y hY hne
    rcases Finset.mem_insert.mp hX with rfl | hX <;> rcases Finset.mem_insert.mp hY with rfl | hY
    · exact (hne rfl).elim
    · exact hcdis _ hY
    · exact (hcdis _ hX).symm
    · exact hd hX hY hne
  have diskEq (i : K) : selectedChartDisk (F i) = i.val := (hF i).symm
  have centerMem (i : K) : F i 0 ∈ i.val := diskEq i ▸ zmem (F i)
  have inj : Function.Injective (fun i : K => F i 0) := by
    intro i j he
    change F i 0 = F j 0 at he
    by_contra hn
    exact disjoint_left.mp (dis i.property j.property (fun e => hn (Subtype.ext e)))
      (centerMem i) (show F i 0 ∈ j.val by rw [he]; exact centerMem j)
  let V : K → Set M := fun i => if i.val ∈ A then Cᶜ else interior C
  have ho (i : K) : IsOpen (V i) := by
    dsimp [V]; split
    · exact (isCompact_selectedChartDisk Q hQ).isClosed.isOpen_compl
    · exact isOpen_interior
  have hn (i : K) : (V i).Nonempty := by
    dsimp [V]; split
    · exact markedDisk_compl_nonempty Q hQ
    · rw [show interior C = Q '' Metric.ball (0 : E₄) 1 from interior_selectedChartDisk Q hQ]
      exact ⟨Q 0, 0, Metric.mem_ball_self (by norm_num), rfl⟩
  obtain ⟨T, ht⟩ := route K _ inj V ho hn
  have hdis : (↑(Finset.univ : Finset K) : Set K).PairwiseDisjoint (fun i => selectedChartDisk (F i)) := by
    intro i _ j _ hne
    change Disjoint (selectedChartDisk (F i)) (selectedChartDisk (F j))
    rw [diskEq, diskEq]
    exact dis i.property j.property (fun he => hne (Subtype.ext he))
  obtain ⟨L, hl⟩ := exists_diffeomorph_contracting_finiteMarkedDisks (ι := ↥K) Finset.univ F
    (fun i _ => hs i) hdis (fun i => T ⁻¹' V i) (fun i _ => (ho i).preimage T.continuous)
    (fun i _ => ht i)
  let G := L.trans T
  have hmap (i : K) (x : M) (hx : x ∈ i.val) : G x ∈ V i :=
    (hl i (Finset.mem_univ _) (mem_image_of_mem L ((diskEq i).symm ▸ hx))).2
  let B := Q.trans G.symm.toPartialDiffeomorph
  have hB : Metric.closedBall (0 : E₄) 1 ⊆ B.source := fun x hx => ⟨hQ hx, mem_univ _⟩
  have hiff (x : M) : x ∈ B '' Metric.ball 0 1 ↔ G x ∈ interior C := by
    rw [show interior C = Q '' Metric.ball (0 : E₄) 1 from interior_selectedChartDisk Q hQ]
    constructor
    · rintro ⟨v, hv, rfl⟩
      exact ⟨v, hv, (G.apply_symm_apply (Q v)).symm⟩
    · rintro ⟨v, hv, he⟩
      exact ⟨v, hv, (congrArg G.symm he).trans (G.symm_apply_apply x)⟩
  refine ⟨B, hB, ?_, ?_⟩
  · intro x hx
    apply (hiff x).2
    have hh := hmap ⟨C, Finset.mem_insert_self _ _⟩ x hx
    simpa [V, show C ∉ A from fun h => hCD (hAD h)] using hh
  · ext x
    rw [interior_selectedChartDisk B hB]
    constructor
    · intro hx
      obtain ⟨S, hS, hxS⟩ := mem_iUnion₂.mp hx.2
      refine mem_iUnion₂.mpr ⟨S, ?_, hxS⟩
      by_contra ha
      have hh := hmap ⟨S, Finset.mem_insert_of_mem hS⟩ x hxS
      exact hx.1 ((hiff x).2 (by simpa [V, ha] using hh))
    · intro hx
      obtain ⟨S, hS, hxS⟩ := mem_iUnion₂.mp hx
      refine ⟨?_, mem_iUnion₂.mpr ⟨S, hAD hS, hxS⟩⟩
      have hh := hmap ⟨S, Finset.mem_insert_of_mem (hAD hS)⟩ x hxS
      have ho' : G x ∉ C := by simpa [V, hS] using hh
      exact fun h => ho' (interior_subset ((hiff x).1 h))

/-- A finite choice of complete disjoint marked disks in the complement of
the core can always be separated by a single smooth outer disk. -/
theorem exists_finite_markedDisk_separator [PreconnectedSpace M]
    (Q : PartialDiffeomorph I₄ I E₄ M ∞) (hQ : Metric.closedBall (0 : E₄) 1 ⊆ Q.source)
    (D A : Finset (Set M)) (hAD : A ⊆ D)
    (hD : ∀ S ∈ D, IsAtlasMarkedDisk I S ∧ S ⊆ (selectedChartDisk Q)ᶜ)
    (hd : (D : Set (Set M)).PairwiseDisjoint id) :
    ∃ B : PartialDiffeomorph I₄ I E₄ M ∞, Metric.closedBall (0 : E₄) 1 ⊆ B.source ∧
      selectedChartDisk Q ⊆ B '' Metric.ball 0 1 ∧
      (interior (selectedChartDisk B))ᶜ ∩ (⋃ S ∈ D, S) = ⋃ S ∈ A, S :=
  exists_markedDisk_separator_of_point_routing
    (fun _ x hx V ho hn => exists_finitePointRouting_into_opens (I := I) x hx V ho hn)
    Q hQ D A hAD hD hd

variable [CompactSpace M]

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

private local instance : MeasurableSpace E₄ := borel E₄
private local instance : BorelSpace E₄ := ⟨rfl⟩

/-- Volume-absolute continuity on a smooth physical source already gives
the singleton-null condition needed by the finite packing. -/
theorem nullSingletonClass_of_physicalVolume_ac (g : SmoothRiemannianMetric I M)
    (μ : Measure M) (hac : μ ≪ riemannianVolumeMeasure I M g) : NullSingletonClass μ := by
  refine ⟨fun x => hac ?_⟩
  have h := riemannianVolumeMeasure_image_eq_zero_of_mdifferentiableOn g
    (f := fun _ : E₄ => x) (s := {0}) mdifferentiable_const.mdifferentiableOn (by simp)
  simpa only [image_singleton] using h

variable [PreconnectedSpace M]

/-- On the connected physical source one smooth outer disk with the given
core realizes the four half-mass conditions to arbitrary positive tolerance. -/
theorem exists_nestedMarkedDisk_fourMeasureHalf (g : SmoothRiemannianMetric I M)
    (μ : Fin 4 → Measure M) [∀ j, IsFiniteMeasure (μ j)]
    (hac : ∀ j, μ j ≪ riemannianVolumeMeasure I M g)
    (Q : PartialDiffeomorph I₄ I E₄ M ∞) (hQ : Metric.closedBall (0 : E₄) 1 ⊆ Q.source)
    {ε : ℝ} (hε : 0 < ε) :
    ∃ m : NestedBalancedDisks I M, m.core = Q ∧ ∀ j,
      |(μ j).real (interior (selectedChartDisk m.outer))ᶜ -
        (μ j).real (interior (selectedChartDisk Q))ᶜ / 2| < ε := by
  let : ∀ j, NullSingletonClass (μ j) := fun j => nullSingletonClass_of_physicalVolume_ac g _ (hac j)
  exact exists_marked_four_measure_half_of_separation g μ hac Q hQ
    (exists_finite_markedDisk_separator Q hQ) hε

/-- At every positive depth the final single marking contains the original
closed core in its open interior and divides all four original exterior
masses to any requested absolute error. -/
theorem exists_nestedMarkedDisk_fourMeasure_dyadic (g : SmoothRiemannianMetric I M)
    (μ : Fin 4 → Measure M) [∀ j, IsFiniteMeasure (μ j)]
    (hac : ∀ j, μ j ≪ riemannianVolumeMeasure I M g)
    (Q : PartialDiffeomorph I₄ I E₄ M ∞) (hQ : Metric.closedBall (0 : E₄) 1 ⊆ Q.source)
    (k : ℕ) (hk : 0 < k) {ε : ℝ} (hε : 0 < ε) :
    ∃ m : NestedBalancedDisks I M, m.core = Q ∧ ∀ j,
      |(μ j).real (interior (selectedChartDisk m.outer))ᶜ -
        (1 / (2 : ℝ)^k) * (μ j).real (interior (selectedChartDisk Q))ᶜ| < ε := by
  obtain ⟨m, hm, hb⟩ := exists_iteratedMarkedDiskDivision μ Q hQ (τ := ε / 3) (fun F hF => by
    obtain ⟨d, hd, hh⟩ := exists_nestedMarkedDisk_fourMeasureHalf g μ hac F hF
      (show 0 < ε / 3 by positivity)
    exact ⟨d.outer, d.outer_source, hd ▸ d.core_inside, fun j => (hh j).le⟩) k hk
  refine ⟨m, hm, fun j => (hb j).trans_lt ?_⟩
  have hp : 0 ≤ 1 / (2 : ℝ)^k := by positivity
  nlinarith [mul_nonneg hε.le hp]

/-- The dyadic division and the physical collar estimate refer to the very
same final marking, and the original closed disk remains protected throughout. -/
theorem exists_bufferedNestedMarkedDisk_fourMeasure (g : SmoothRiemannianMetric I M)
    (μ : Fin 4 → Measure M) [∀ j, IsFiniteMeasure (μ j)]
    (hac : ∀ j, μ j ≪ riemannianVolumeMeasure I M g)
    (Q : PartialDiffeomorph I₄ I E₄ M ∞) (hQ : Metric.closedBall (0 : E₄) 1 ⊆ Q.source)
    (k : ℕ) (hk : 0 < k) {ε η : ℝ} (hε : 0 < ε) (hη : 0 < η) :
    ∃ m : NestedBalancedDisks I M, m.core = Q ∧
      (∀ j, |(μ j).real (interior (selectedChartDisk m.outer))ᶜ -
        (1 / (2 : ℝ)^k) * (μ j).real (interior (selectedChartDisk Q))ᶜ| < ε) ∧
      ∀ᶠ n : ℕ in Filter.atTop,
        Metric.closedBall (0 : E₄) (1 + 1 / ((n : ℝ) + 1)) ⊆ m.outer.source ∧
        selectedDiskTrim m.outer n = m.outer '' {z : E₄ | |‖z‖ - 1| < 1 / ((n : ℝ) + 1)} ∧
        Disjoint (selectedChartDisk Q) (selectedDiskTrim m.outer n) ∧
        ∑ j, (μ j).real (selectedDiskTrim m.outer n) < η := by
  obtain ⟨m, hm, hd⟩ := exists_nestedMarkedDisk_fourMeasure_dyadic g μ hac Q hQ k hk hε
  refine ⟨m, hm, hd, ?_⟩
  simpa only [← hm] using eventually_protectedFourMeasureTrim g μ hac m hη

end SmoothPoincare
