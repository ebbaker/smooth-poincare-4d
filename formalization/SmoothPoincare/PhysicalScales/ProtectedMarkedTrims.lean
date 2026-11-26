import SmoothPoincare.Variational.BalancedMarkedExterior
import SmoothPoincare.PhysicalScales.FullDiskTrims

/-! # Protected four-measure trims on a nested pair of marked disks -/

open DifferentialGeometry DifferentialGeometry.Integral.Measure FirstOrderTwistor Filter MeasureTheory Set
open scoped ContDiff Manifold Topology

namespace SmoothPoincare

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H}
  [TopologicalSpace M] [ChartedSpace H M]

/-- The selected final seam leaves the whole original closed disk untouched
at every sufficiently thin width on this finite source. -/
theorem NestedBalancedDisks.eventually_trim_disjoint_core (m : NestedBalancedDisks I M) :
    ∀ᶠ n : ℕ in atTop, Disjoint (selectedChartDisk m.core) (selectedDiskTrim m.outer n) := by
  let C := selectedChartDisk m.core
  have ht : C ⊆ m.outer.target := by
    intro y hy
    obtain ⟨x, hx, rfl⟩ := m.core_inside hy
    exact m.outer.map_source (m.outer_source (Metric.ball_subset_closedBall hx))
  have hrad (y) (hy : y ∈ C) : ‖m.outer.symm y‖ < 1 := by
    obtain ⟨x, hx, rfl⟩ := m.core_inside hy
    calc
      _ = ‖x‖ := congrArg norm (m.outer.left_inv (m.outer_source (Metric.ball_subset_closedBall hx)))
      _ < 1 := by simpa [Metric.mem_ball, dist_zero_right] using hx
  have hne : C.Nonempty := ⟨m.core 0, 0, Metric.mem_closedBall_self (by norm_num), rfl⟩
  obtain ⟨y, hy, hmax⟩ := (isCompact_selectedChartDisk m.core m.core_source).exists_isMaxOn
    hne (m.outer.contMDiffOn_invFun.continuousOn.norm.mono ht)
  filter_upwards [tendsto_one_div_add_atTop_nhds_zero_nat.eventually_lt_const (sub_pos.mpr (hrad y hy))] with n hn
  apply Set.disjoint_left.mpr
  intro z hz ht'
  have hnear : |‖m.outer.symm z‖ - 1| < 1 / ((n : ℝ) + 1) := ht'.2
  have hle : ‖m.outer.symm z‖ ≤ ‖m.outer.symm y‖ := hmax hz
  linarith only [hle, (abs_lt.mp hnear).1, hn]

variable [I.Boundaryless] [IsManifold I ∞ M] [T2Space M] [SigmaCompactSpace M]
private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

/-- At one and the same actual width the full annulus is in the outer chart,
misses the original disk and carries little total mass of all four measures. -/
theorem eventually_protectedFourMeasureTrim (g : SmoothRiemannianMetric I M)
    (μ : Fin 4 → Measure M) [∀ j, IsFiniteMeasure (μ j)]
    (hac : ∀ j, μ j ≪ riemannianVolumeMeasure I M g)
    (m : NestedBalancedDisks I M) {ε : ℝ} (hε : 0 < ε) :
    ∀ᶠ n : ℕ in atTop,
      Metric.closedBall (0 : E₄) (1 + 1 / ((n : ℝ) + 1)) ⊆ m.outer.source ∧
      selectedDiskTrim m.outer n = m.outer '' {z : E₄ | |‖z‖ - 1| < 1 / ((n : ℝ) + 1)} ∧
      Disjoint (selectedChartDisk m.core) (selectedDiskTrim m.outer n) ∧
      ∑ j, (μ j).real (selectedDiskTrim m.outer n) < ε := by
  have hs := tendsto_finsetSum (Finset.univ : Finset (Fin 4)) fun j _ =>
    selectedDiskTrim_mass_tendsto_zero g m.outer (μ j) (hac j)
  simp only [Finset.sum_const_zero] at hs
  filter_upwards [eventually_selectedChartDisk_buffer m.outer m.outer_source,
    m.eventually_trim_disjoint_core, hs.eventually_lt_const hε] with n hn hd hmass
  exact ⟨hn, selectedDiskTrim_eq_full_image m.outer n hn, hd, hmass⟩

end SmoothPoincare
