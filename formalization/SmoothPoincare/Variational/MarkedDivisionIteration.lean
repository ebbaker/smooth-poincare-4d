import SmoothPoincare.Variational.FiniteBallDivision
import SmoothPoincare.Variational.BalancedMarkedExterior

/-! # Four-measure division on nested physical disk markings -/

open DifferentialGeometry Filter MeasureTheory Set
open scoped ContDiff Manifold Topology

namespace SmoothPoincare

/-- If the final exterior contains the chosen tiles and misses the others,
its only uncontrolled contribution is on the unpacked part of the original
exterior. Half the missed mass is sufficient for the signed error budget. -/
theorem halfDivision_of_packing_trace {X : Type*} [MeasurableSpace X]
    (μ : Measure X) [IsFiniteMeasure μ] {U V A S : Set X}
    (hA : MeasurableSet A) (hAU : A ⊆ U) (hVU : V ⊆ U) (htrace : V ∩ A = S)
    {d : ℝ} (hhalf : |μ.real S - μ.real A / 2| ≤ d) :
    |μ.real V - μ.real U / 2| ≤ d + μ.real (U \ A) / 2 := by
  have h1 := measureReal_inter_add_sdiff (μ := μ) (s := V) hA
  rw [htrace] at h1
  have h2 := measureReal_sdiff (μ := μ) hAU hA
  have h3 := measureReal_mono (μ := μ) (sdiff_subset_sdiff_left hVU : V \ A ⊆ U \ A)
  have h4 : 0 ≤ μ.real (V \ A) := measureReal_nonneg
  rw [abs_le] at hhalf ⊢
  constructor <;> linarith [hhalf.1, hhalf.2]

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "I₄" => 𝓘(ℝ, E₄)

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H}
  [TopologicalSpace M] [ChartedSpace H M]

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

/-- Finite measured pieces suffice if an actual enlargement separates the
chosen pieces from their complement while preserving the marked core. -/
theorem exists_markedHalfDivision_of_separating_packing {ι : Type*}
    (μ : Fin 4 → Measure M) [∀ j, IsFiniteMeasure (μ j)]
    (Q : PartialDiffeomorph I₄ I E₄ M ∞) (hQ : Metric.closedBall (0 : E₄) 1 ⊆ Q.source)
    (s : Finset ι) (D : ι → Set M) (hm : ∀ i ∈ s, MeasurableSet (D i))
    (hd : (s : Set ι).PairwiseDisjoint D)
    (hsub : ∀ i ∈ s, D i ⊆ (interior (selectedChartDisk Q))ᶜ)
    (hSeparate : ∀ t ⊆ s, ∃ B : PartialDiffeomorph I₄ I E₄ M ∞,
      Metric.closedBall (0 : E₄) 1 ⊆ B.source ∧ selectedChartDisk Q ⊆ B '' Metric.ball 0 1 ∧
      (interior (selectedChartDisk B))ᶜ ∩ (⋃ i ∈ s, D i) = ⋃ i ∈ t, D i) :
    ∃ marks : NestedBalancedDisks I M, marks.core = Q ∧
      ∀ j, |(μ j).real (interior (selectedChartDisk marks.outer))ᶜ -
        (μ j).real (interior (selectedChartDisk Q))ᶜ / 2| ≤
        (Real.sqrt (∑ i ∈ s, ∑ l, ((μ l).real (D i)) ^ 2) +
          (μ j).real ((interior (selectedChartDisk Q))ᶜ \ ⋃ i ∈ s, D i)) / 2 := by
  classical
  obtain ⟨t, hts, ht⟩ := exists_bisecting_measured_subfamily μ s D hd hm
  obtain ⟨B, hB, hin, htr⟩ := hSeparate t hts
  refine ⟨⟨Q, B, hQ, hB, hin⟩, rfl, fun j => ?_⟩
  have hNested : interior (selectedChartDisk Q) ⊆ interior (selectedChartDisk B) := by
    rw [interior_selectedChartDisk B hB]
    exact interior_subset.trans hin
  simpa only [add_div] using halfDivision_of_packing_trace (μ j) (s.measurableSet_biUnion hm)
    (iUnion₂_subset hsub) (compl_subset_compl.mpr hNested) htr (ht j)

/-- Iterate the actual one-step choice at a fixed source. The final chart
still contains the original closed core in its open interior at every
positive depth; each of the four errors sums the same geometric series. -/
theorem exists_iteratedMarkedDiskDivision
    (μ : Fin 4 → Measure M) (Q : PartialDiffeomorph I₄ I E₄ M ∞)
    (hQ : Metric.closedBall (0 : E₄) 1 ⊆ Q.source) {τ : ℝ}
    (oneStep : ∀ F : PartialDiffeomorph I₄ I E₄ M ∞, Metric.closedBall (0 : E₄) 1 ⊆ F.source →
      ∃ G : PartialDiffeomorph I₄ I E₄ M ∞, Metric.closedBall (0 : E₄) 1 ⊆ G.source ∧
        selectedChartDisk F ⊆ G '' Metric.ball 0 1 ∧
        ∀ j, |(μ j).real (interior (selectedChartDisk G))ᶜ -
          (μ j).real (interior (selectedChartDisk F))ᶜ / 2| ≤ τ)
    (k : ℕ) (hk : 0 < k) :
    ∃ marks : NestedBalancedDisks I M, marks.core = Q ∧
      ∀ j, |(μ j).real (interior (selectedChartDisk marks.outer))ᶜ -
        (1 / (2 : ℝ) ^ k) * (μ j).real (interior (selectedChartDisk Q))ᶜ| ≤
        2 * τ * (1 - 1 / (2 : ℝ) ^ k) := by
  let E := fun (F : PartialDiffeomorph I₄ I E₄ M ∞) j => (μ j).real (interior (selectedChartDisk F))ᶜ
  have iterate (n : ℕ) : ∃ F : PartialDiffeomorph I₄ I E₄ M ∞,
      Metric.closedBall (0 : E₄) 1 ⊆ F.source ∧ selectedChartDisk Q ⊆ selectedChartDisk F ∧
      (0 < n → selectedChartDisk Q ⊆ F '' Metric.ball 0 1) ∧
      ∀ j, |E F j - (1 / (2 : ℝ) ^ n) * E Q j| ≤ 2 * τ * (1 - 1 / (2 : ℝ) ^ n) := by
    induction n with
    | zero => exact ⟨Q, hQ, Subset.rfl, by simp, by simp⟩
    | succ n ih =>
      obtain ⟨F, hF, hsub, _, hprev⟩ := ih
      obtain ⟨G, hG, hin, hnew⟩ := oneStep F hF
      have hi := hsub.trans hin
      refine ⟨G, hG, hi.trans (image_mono Metric.ball_subset_closedBall), fun _ => hi, fun j => ?_⟩
      have hcur : |E G j - E F j / 2| ≤ τ := hnew j
      have hs := abs_le.mp (hprev j)
      rw [abs_le] at hcur ⊢
      have hpow : 1 / (2 : ℝ) ^ (n + 1) = (1 / (2 : ℝ) ^ n) / 2 := by rw [pow_succ, div_mul_eq_div_div]
      rw [hpow]
      constructor <;> linarith [hs.1, hs.2, hcur.1, hcur.2]
  obtain ⟨G, hG, _, hin, herr⟩ := iterate k
  exact ⟨⟨Q, G, hQ, hG, hin hk⟩, rfl, herr⟩

end SmoothPoincare
