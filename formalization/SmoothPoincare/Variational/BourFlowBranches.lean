import SmoothPoincare.Variational.TerminalChargeTransfer
import SmoothPoincare.Variational.SignedCollarRepair
import Mathlib.Topology.Algebra.Order.LiminfLimsup

/-! # The initial Yamabe deficit in both pointed alternatives

The metric on the fixed type comes from the supplied smooth marked return.
All lsc comparisons below use the ordinary physical trace-free Ricci integral.
The second theorem is scoped to the actual extracted second sequence. -/

open DifferentialGeometry DifferentialGeometry.Geometry.Curvature DifferentialGeometry.Integral.Measure
open FirstOrderTwistor Filter MeasureTheory Set
open scoped ContDiff Manifold Topology

namespace SmoothPoincare

variable {E H M : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [T2Space M] [CompactSpace M] [Nonempty M] {o : ManifoldOrientation I M 4}

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

/-- On the first pointed arm use the marked positive pullback to put a
lower bound on the bubble's energy. Retain the exact excess and Yamabe deficit. -/
theorem bourFirstPointed_excess_and_deficit (start returned : SignedCollarMetric o)
    {α Dlimit : ℝ} (hα : 0 < α)
    (hPos : 0 < classYamabeFour o.dimension_eq returned.metric)
    (hEnd : Dlimit = 4 * returned.energy .plus)
    (hTransfer : Dlimit ≤ 4 * sInf (geometricPositiveEnergies o) +
      4 * (start.energy .plus - sInf (geometricPositiveEnergies o)) / α +
      ((classYamabeFour o.dimension_eq start.metric)^2 - 384 * Real.pi^2) / 12)
    (hStart : start.energy .plus - sInf (geometricPositiveEnergies o) ≤ α^2) :
    4 * (returned.energy .plus - sInf (geometricPositiveEnergies o)) +
      (384 * Real.pi^2 - (classYamabeFour o.dimension_eq start.metric)^2) / 12 ≤
        4 * (start.energy .plus - sInf (geometricPositiveEnergies o)) / α ∧
    384 * Real.pi^2 - (classYamabeFour o.dimension_eq start.metric)^2 ≤ 48 * α := by
  have hI := csInf_le (geometricPositiveEnergies_bddBelow o) (returned.energy_mem_of_positive hPos)
  have hu : 4 * (start.energy .plus - sInf (geometricPositiveEnergies o)) / α ≤ 4 * α :=
    (div_le_iff₀ hα).2 (by nlinarith only [hStart])
  constructor <;> linarith only [hTransfer, hEnd, hu, hI]

/-- A second marked pointed return forces saturation of the round Yamabe
bound by the *initial* representatives on this subsequence, even if the
regularized closed and exact pointed returns alternate. The limit's strict
energy comparison and the full Ricci lower semicontinuity come from different
geometric inputs. -/
theorem bourMixedPointed_startYamabeSq_tendsto (start q : ℕ → SignedCollarMetric o)
    (returned : SignedCollarMetric o) (α : ℕ → ℝ) (hα : Tendsto α atTop (𝓝 0))
    (hPos : 0 < classYamabeFour o.dimension_eq returned.metric)
    (hEnergy : returned.energy .plus ≤ sInf (geometricPositiveEnergies o))
    (hRound : ∀ᶠ j in atTop, (classYamabeFour o.dimension_eq (start j).metric)^2 ≤ 384 * Real.pi^2)
    (hBranch : ∀ᶠ j in atTop,
      (384 * Real.pi^2 - (classYamabeFour o.dimension_eq (start j).metric)^2 ≤ 48 * α j) ∨
      (∫ x, intrinsicTraceFreeRicciSq (q j).metric x ∂riemannianVolumeMeasure I M (q j).metric) ≤
        4 * sInf (geometricPositiveEnergies o) + 4 * α j +
          ((classYamabeFour o.dimension_eq (start j).metric)^2 - 384 * Real.pi^2) / 12)
    (hRicci : 4 * returned.energy .plus ≤ liminf (fun j =>
      ∫ x, intrinsicTraceFreeRicciSq (q j).metric x ∂riemannianVolumeMeasure I M (q j).metric) atTop) :
    returned.energy .plus = sInf (geometricPositiveEnergies o) ∧
      Tendsto (fun j => (classYamabeFour o.dimension_eq (start j).metric)^2) atTop
        (𝓝 (384 * Real.pi^2)) := by
  let d := fun j => ∫ x, intrinsicTraceFreeRicciSq (q j).metric x ∂riemannianVolumeMeasure I M (q j).metric
  have heq := le_antisymm hEnergy
    (csInf_le (geometricPositiveEnergies_bddBelow o) (returned.energy_mem_of_positive hPos))
  have hd (j : ℕ) : 0 ≤ d j := integral_nonneg (fun x =>
    intrinsicTraceFreeRicciSq_nonneg_of_finrank o.dimension_eq (q j).metric x)
  have hb : IsBoundedUnder (· ≥ ·) atTop d :=
    isBoundedUnder_of_eventually_ge (Eventually.of_forall hd)
  refine ⟨heq, Metric.tendsto_nhds.mpr ?_⟩
  intro ε hε
  have hLow : 4 * returned.energy .plus - ε/24 < liminf d atTop :=
    lt_of_lt_of_le (by linarith only [hε]) hRicci
  filter_upwards [hRound, hBranch, eventually_lt_of_lt_liminf hLow hb,
    hα.eventually (gt_mem_nhds (show 0 < ε/96 by positivity))] with j hR hB hD hSmall
  rw [Real.dist_eq, abs_of_nonpos (sub_nonpos.mpr hR)]
  change 4 * returned.energy .plus - ε/24 < d j at hD
  rcases hB with hbub | hclosed
  · linarith
  · change d j ≤ _ at hclosed
    linarith only [hD, hclosed, hSmall, heq]

end SmoothPoincare
