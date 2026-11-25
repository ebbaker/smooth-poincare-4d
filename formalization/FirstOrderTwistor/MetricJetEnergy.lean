import FirstOrderTwistor.ConvergingFrames
import FirstOrderTwistor.CurvatureCompressionBound
import FirstOrderTwistor.FixedMetricEnergy
import FirstOrderTwistor.MetricJetCurvature
import FirstOrderTwistor.MetricVolumeLimit

/-! # Chiral energy convergence from compact metric two-jet convergence -/

namespace FirstOrderTwistor

open DifferentialGeometry DifferentialGeometry.Integral.Measure Filter MeasureTheory
open scoped ContDiff Manifold Topology

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M] [SigmaCompactSpace M]

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

open DifferentialGeometry.CheegerGromovCompactness

/-- On a compact common domain, metric two-jet convergence supplies the curvature
limits, and the metric itself supplies the Jacobian limit. Gram–Schmidt constructs
the moving frames from the prescribed limiting frames. A single majorant dominates the densities. -/
theorem tendsto_geometricChiralIntegral_of_metricCPConvergence [I.Boundaryless]
    (o : ManifoldOrientation I M 4) (G : ℕ → SmoothRiemannianMetric I M)
    (g R q : SmoothRiemannianMetric I M)
    (frame : ∀ x, OrientedOrthonormalFrameAt g o x) {K : Set M} (hK : IsCompact K)
    (hconv : MetricCPConvergenceOn K 2 G g R) {bound : M → ℝ} :
    let μ := riemannianVolumeMeasure I M q
    let frames := fun i x => orthonormalFrameFromReferenceAt (G i) (frame x)
    let W := fun i x => geometricChiralBlock (G i) o x (frames i x)
    (∀ i, AEStronglyMeasurable (chiralHSDensity (W i) (riemannianVolumeDensity q (G i)))
      (μ.restrict K)) →
    IntegrableOn bound K μ →
    (∀ i, ∀ᵐ x ∂μ.restrict K, riemannianVolumeDensity q (G i) x *
      frameTensorNormSq (metricCurvatureFrameTensor (G i) o x (frames i x)) ≤ bound x) →
    Tendsto (fun i => ∫ x in K, SectionsAndConnections.hilbertSchmidtSq (W i x)
      ∂riemannianVolumeMeasure I M (G i)) atTop
      (𝓝 (∫ x in K, SectionsAndConnections.hilbertSchmidtSq (geometricChiralBlock g o x (frame x))
        ∂riemannianVolumeMeasure I M g)) := by
  intro μ frames W hMeas hBound hDom
  apply tendsto_geometricChiralIntegral_of_framedCurvature o G g q frames frame hK.measurableSet (bound := bound)
  · intro a b c d
    filter_upwards [ae_restrict_mem hK.measurableSet] with x hx
    apply tendsto_metricCurvatureFrameTensor_of_metricCPConvergence hconv hK hx
      (fun i => frames i x) (frame x) _ a b c d
    intro u j
    have hv := tendsto_orthonormalFrameFromReferenceAt G g (frame x)
      (fun u v => hconv.tendsto_inner hK hx _ _) u
    exact ((continuous_apply j).comp (frame x).basis.equivFunL.continuous).continuousAt.tendsto.comp hv
  · filter_upwards [ae_restrict_mem hK.measurableSet] with x hx
    exact tendsto_riemannianVolumeDensity_of_metricCPConvergenceOn q hconv hK hx
  · exact hMeas
  · exact hBound
  · intro i
    filter_upwards [hDom i] with x hx
    have hJ := (riemannianVolumeDensity_pos q (G i) x).le
    rw [Real.norm_eq_abs, abs_of_nonneg (chiralHSDensity_nonneg hJ)]
    exact (mul_le_mul_of_nonneg_left
      (hilbertSchmidtSq_traceFreeSelfDualBlock_le_frameTensorNormSq _) hJ).trans hx

end FirstOrderTwistor
