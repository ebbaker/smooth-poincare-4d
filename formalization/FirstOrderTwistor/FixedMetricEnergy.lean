import FirstOrderTwistor.CurvatureDensityLimit
import FirstOrderTwistor.RiemannianComparison

/-!
# Chiral energy of actual metrics on a fixed truncation

The energy on each member of the sequence uses its own Riemannian volume.
All domination and measurability tests take place on one reference measure.
-/

namespace FirstOrderTwistor

open DifferentialGeometry DifferentialGeometry.Integral.Measure Filter MeasureTheory
open scoped ContDiff Manifold Topology

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M] [SigmaCompactSpace M]

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

/-- A single Jacobian is enough to express the physical chiral energy of a measured
region relative to a fixed smooth metric. -/
theorem chiralIntegral_eq_referenceDensity (q g : SmoothRiemannianMetric I M)
    {K : Set M} (hK : MeasurableSet K) (W : M → Matrix (Fin 3) (Fin 3) ℝ) :
    (∫ x in K, SectionsAndConnections.hilbertSchmidtSq (W x) ∂riemannianVolumeMeasure I M g) =
      ∫ x in K, chiralHSDensity W (riemannianVolumeDensity q g) x ∂riemannianVolumeMeasure I M q := by
  rw [riemannianVolumeMeasure_eq_withDensity q g]
  have hMeas : Measurable (fun x => ENNReal.ofReal (riemannianVolumeDensity q g x)) :=
    ENNReal.measurable_ofReal.comp (riemannianVolumeDensity_contMDiff q g).continuous.measurable
  refine (setIntegral_withDensity_eq_setIntegral_toReal_smul (μ := riemannianVolumeMeasure I M q)
    hMeas (Eventually.of_forall fun _ => ENNReal.ofReal_lt_top)
    (fun x => SectionsAndConnections.hilbertSchmidtSq (W x)) hK).trans ?_
  apply setIntegral_congr_fun hK
  intro x _
  simp only [ENNReal.toReal_ofReal (riemannianVolumeDensity_pos q g x).le, smul_eq_mul, chiralHSDensity]

/-- Dominated convergence of physical chiral energy, with all four curvature slots
evaluated in oriented orthonormal frames on the common domain. -/
theorem tendsto_geometricChiralIntegral_of_framedCurvature
    (o : ManifoldOrientation I M 4) (G : ℕ → SmoothRiemannianMetric I M)
    (g q : SmoothRiemannianMetric I M)
    (frames : ∀ i x, OrientedOrthonormalFrameAt (G i) o x)
    (frame : ∀ x, OrientedOrthonormalFrameAt g o x) {K : Set M} (hK : MeasurableSet K)
    {bound : M → ℝ} :
    let μ := riemannianVolumeMeasure I M q
    let W := fun i x => geometricChiralBlock (G i) o x (frames i x)
    let Wlim := fun x => geometricChiralBlock g o x (frame x)
    (∀ a b c d, ∀ᵐ x ∂μ.restrict K, Tendsto
      (fun i => metricCurvatureFrameTensor (G i) o x (frames i x) a b c d) atTop
      (𝓝 (metricCurvatureFrameTensor g o x (frame x) a b c d))) →
    (∀ᵐ x ∂μ.restrict K, Tendsto (fun i => riemannianVolumeDensity q (G i) x) atTop
      (𝓝 (riemannianVolumeDensity q g x))) →
    (∀ i, AEStronglyMeasurable (chiralHSDensity (W i) (riemannianVolumeDensity q (G i)))
      (μ.restrict K)) →
    IntegrableOn bound K μ →
    (∀ i, ∀ᵐ x ∂μ.restrict K, ‖chiralHSDensity (W i) (riemannianVolumeDensity q (G i)) x‖ ≤ bound x) →
    Tendsto (fun i => ∫ x in K, SectionsAndConnections.hilbertSchmidtSq (W i x)
      ∂riemannianVolumeMeasure I M (G i)) atTop
      (𝓝 (∫ x in K, SectionsAndConnections.hilbertSchmidtSq (Wlim x) ∂riemannianVolumeMeasure I M g)) := by
  intro μ W Wlim hRm hJac hMeas hBound hDom
  simp_rw [chiralIntegral_eq_referenceDensity q _ hK]
  exact (geometricChiralDensity_integrableOn_and_tendsto o G g (fun _ x => x) id
    frames frame hRm hJac hMeas hBound hDom).2.2

end FirstOrderTwistor
