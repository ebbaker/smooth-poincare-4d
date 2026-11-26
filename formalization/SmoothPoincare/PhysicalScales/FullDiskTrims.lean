import SmoothPoincare.PhysicalScales.SelectedDiskCollars
import Mathlib.Analysis.Normed.Module.Ball.Pointwise

/-! # Full radial collars at a common width for both physical chiralities -/

open DifferentialGeometry DifferentialGeometry.Integral.Measure FirstOrderTwistor
open Filter MeasureTheory SectionsAndConnections Set
open scoped ContDiff Manifold Topology

namespace SmoothPoincare

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "I₄" => 𝓘(ℝ, E₄)
variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H}
  [TopologicalSpace M] [ChartedSpace H M]

private theorem eventually_disk_buffer (F : PartialDiffeomorph I₄ I E₄ M ∞)
    (h : Metric.closedBall (0 : E₄) 1 ⊆ F.source) :
    ∀ᶠ n : ℕ in atTop, Metric.closedBall (0 : E₄) (1 + 1 / ((n : ℝ) + 1)) ⊆ F.source := by
  obtain ⟨δ, hδ, hb⟩ := (isCompact_closedBall (0 : E₄) 1).exists_cthickening_subset_open
    F.open_source h
  rw [cthickening_closedBall hδ.le (zero_le_one' ℝ)] at hb
  filter_upwards [tendsto_one_div_add_atTop_nhds_zero_nat.eventually_lt_const hδ] with n hn
  exact (Metric.closedBall_subset_closedBall (by linarith)).trans hb

/-- On a full buffered parametrization, the trim is exactly the image of the
entire model annulus, including all angular directions. -/
theorem selectedDiskTrim_eq_full_image (F : PartialDiffeomorph I₄ I E₄ M ∞) (n : ℕ)
    (hb : Metric.closedBall (0 : E₄) (1 + 1 / ((n : ℝ) + 1)) ⊆ F.source) :
    selectedDiskTrim F n = F '' {z : E₄ | |‖z‖ - 1| < 1 / ((n : ℝ) + 1)} := by
  ext x
  constructor
  · rintro ⟨ht, hx⟩
    exact ⟨F.symm x, hx, F.right_inv ht⟩
  · rintro ⟨z, hz, rfl⟩
    change |‖z‖ - 1| < 1 / ((n : ℝ) + 1) at hz
    have hnorm := (abs_lt.mp hz).2
    have hs : z ∈ F.source := hb (by rw [Metric.mem_closedBall, dist_zero_right]; linarith)
    refine ⟨F.map_source hs, ?_⟩
    change |‖F.symm (F z)‖ - 1| < 1 / ((n : ℝ) + 1)
    exact (congrArg (fun y : E₄ => |‖y‖ - 1|) (F.left_inv hs)).trans_lt hz

variable [I.Boundaryless] [IsManifold I ∞ M] [T2Space M] [SigmaCompactSpace M]
private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

/-- Given the finite marked disks, all sufficiently small common widths are
unclipped and have combined raw charge below the requested tolerance, measured
on both chiral blocks of the same physical metric. -/
theorem eventually_fullDiskTrims_small_both_charges
    (o : ManifoldOrientation I M 4) (g : SmoothRiemannianMetric I M)
    (frame : ∀ x, OrientedOrthonormalFrameAt g o x)
    (hP : Integrable (fun x => hilbertSchmidtSq (geometricChiralBlock g o x (frame x)))
      (riemannianVolumeMeasure I M g))
    (hN : Integrable (fun x => hilbertSchmidtSq (endpointNegativeWeylBlock g o x (frame x)))
      (riemannianVolumeMeasure I M g))
    (idx : Finset ℕ) (F : ℕ → PartialDiffeomorph I₄ I E₄ M ∞)
    (hDisk : ∀ j ∈ idx, Metric.closedBall (0 : E₄) 1 ⊆ (F j).source) {ε : ℝ} (hε : 0 < ε) :
    ∀ᶠ n : ℕ in atTop,
      (∀ j ∈ idx, Metric.closedBall (0 : E₄) (1 + 1 / ((n : ℝ) + 1)) ⊆ (F j).source) ∧
      (∑ j ∈ idx, ((∫ x in selectedDiskTrim (F j) n,
        hilbertSchmidtSq (geometricChiralBlock g o x (frame x)) ∂riemannianVolumeMeasure I M g) +
        ∫ x in selectedDiskTrim (F j) n,
        hilbertSchmidtSq (endpointNegativeWeylBlock g o x (frame x)) ∂riemannianVolumeMeasure I M g)) < ε := by
  let dV := riemannianVolumeMeasure I M g
  have small (D : M → Fin 3 → Fin 3 → ℝ) (hD : Integrable (fun x => hilbertSchmidtSq (D x)) dV)
      (j : ℕ) : Tendsto (fun n => ∫ x in selectedDiskTrim (F j) n, hilbertSchmidtSq (D x) ∂dV)
        atTop (𝓝 0) := by
    let μ := energyMeasure dV (fun x => hilbertSchmidtSq (D x))
    let : IsFiniteMeasure μ := isFiniteEnergyMeasure hD
    have ht := selectedDiskTrim_mass_tendsto_zero g (F j) μ (withDensity_absolutelyContinuous _ _)
    apply ht.congr
    intro n
    apply energyMeasure_real_apply (isOpen_selectedDiskTrim _ _).measurableSet hD.integrableOn
    exact Eventually.of_forall fun x => Finset.sum_nonneg fun _ _ =>
      Finset.sum_nonneg fun _ _ => sq_nonneg _
  have hsum := tendsto_finsetSum idx (fun j _ => (small _ hP j).add (small _ hN j))
  simp only [add_zero, Finset.sum_const_zero] at hsum
  exact ((idx.eventually_all).2 (fun j hj => eventually_disk_buffer _ (hDisk j hj))).and
    (hsum.eventually_lt_const hε)

end SmoothPoincare
