import DifferentialGeometry.Analysis.Integration.Measure.VolumeDensity
import DifferentialGeometry.Geometry.Metric.Convergence.Metric.Evaluation
import Mathlib.Topology.Instances.Matrix

open DifferentialGeometry DifferentialGeometry.CheegerGromovCompactness
open DifferentialGeometry.Integral.Measure DifferentialGeometry.Tensor.Coordinates
open Bundle Filter Manifold Set
open scoped ContDiff Manifold Topology

namespace FirstOrderTwistor

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [FiniteDimensional ℝ E] [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M] [SigmaCompactSpace M]

/-- The volume Jacobian relative to a fixed smooth metric converges at each
point of the compact comparison set. Any order of metric convergence suffices. -/
theorem tendsto_riemannianVolumeDensity_of_metricCPConvergenceOn
    (q : SmoothRiemannianMetric I M)
    {G : ℕ → SmoothRiemannianMetric I M} {g R : SmoothRiemannianMetric I M}
    {K : Set M} {p : ℕ} (hconv : MetricCPConvergenceOn K p G g R)
    (hK : IsCompact K) {x : M} (hx : x ∈ K) :
    Tendsto (fun i => riemannianVolumeDensity q (G i) x) atTop
      (𝓝 (riemannianVolumeDensity q g x)) := by
  have hGram : Tendsto (fun i => chartGramMatrix (G i) x x) atTop
      (𝓝 (chartGramMatrix g x x)) := by
    refine tendsto_pi_nhds.2 fun a => tendsto_pi_nhds.2 fun b => ?_
    simpa only [chartGramMatrix_apply] using hconv.tendsto_inner hK hx
      (chartBasisVecFiber (I := I) x a x) (chartBasisVecFiber (I := I) x b x)
  have hdet := (continuous_id.matrix_det.tendsto _).comp hGram
  have hDensity : Tendsto (fun i => chartDensity (G i) x x) atTop
      (𝓝 (chartDensity g x x)) := hdet.sqrt
  have hRatio (h : SmoothRiemannianMetric I M) :
      riemannianVolumeDensity q h x = chartDensity h x x / chartDensity q x x :=
    riemannianVolumeDensity_apply_of_mem_chart_source q h x (mem_chart_source H x)
  simp_rw [hRatio]
  exact hDensity.div_const _

end FirstOrderTwistor
