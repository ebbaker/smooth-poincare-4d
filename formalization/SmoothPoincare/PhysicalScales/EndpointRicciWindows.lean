import FirstOrderTwistor.CurvatureCompressionBound
import SmoothPoincare.PhysicalScales.MetricQuantiles

/-! # Chiral quantiles escape full-curvature vanishing windows -/

open DifferentialGeometry DifferentialGeometry.Integral.Measure
open Filter FirstOrderTwistor MeasureTheory SectionsAndConnections Set
open scoped ContDiff Manifold Topology

namespace SmoothPoincare

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  [CompactSpace M] [ConnectedSpace M]

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

variable (G : ℕ → SmoothRiemannianMetric I M) (o : ManifoldOrientation I M 4)
  (frames : ∀ i x, OrientedOrthonormalFrameAt (G i) o x)

local notation "dV" => fun i => riemannianVolumeMeasure I M (G i)
local notation "chiral" => fun i => geometricChiralMeasure o (G i) (frames i)
local notation "W" => fun i x => geometricChiralBlock (G i) o x (frames i x)
local notation "energy" => fun i => chiralFrameEnergy (G i) (W i)
local notation "full" => fun i x => frameTensorNormSq
  (metricCurvatureFrameTensor (G i) o x (frames i x))

/-- Uniform vanishing of the raw full curvature on each fixed multiple of
a positive physical scale forces every fixed positive chiral quantile to
escape that scale when the total chiral energy has a positive limit. -/
theorem metricChiralQuantile_div_tendsto_atTop_of_fullCurvature_vanishes
    (a r : ℕ → ℝ) (ha : ∀ᶠ i in atTop, 0 < a i)
    {θ eLim : ℝ} (hθ : 0 < θ) (heLim : 0 < eLim)
    (hEnergy : Tendsto energy atTop (𝓝 eLim))
    (hChiral : ∀ i, Integrable (fun x => hilbertSchmidtSq (W i x)) (dV i))
    (hFull : ∀ i, Integrable (full i) (dV i))
    (hr : ∀ i, letI := physicalMetricSpace (G i)
      IsChiralQuantile (chiral i) θ (r i))
    (hVanish : ∀ A > (0 : ℝ), ∀ ε > (0 : ℝ), ∀ᶠ i in atTop,
      letI := physicalMetricSpace (G i)
      ∀ x : M, (∫ y in Metric.ball x (A * a i), full i y ∂dV i) < ε) :
    Tendsto (fun i => r i / a i) atTop atTop := by
  let ε := θ * eLim / 2
  have hε : 0 < ε := half_pos (mul_pos hθ heLim)
  have hMass : ∀ᶠ i in atTop, ε < θ * energy i :=
    (tendsto_order.1 (tendsto_const_nhds.mul hEnergy)).1 ε (half_lt_self (mul_pos hθ heLim))
  refine tendsto_atTop.2 fun L => ?_
  let A := max L 1
  have hA : 0 < A := lt_of_lt_of_le zero_lt_one (le_max_right L 1)
  filter_upwards [ha, hMass, hVanish A hA ε hε] with i hai hmi hvi
  apply (le_div_iff₀ hai).2
  by_contra! hsmall
  let : MetricSpace M := physicalMetricSpace (G i)
  let : BorelSpace M := ⟨rfl⟩
  let : IsFiniteMeasure (chiral i) := geometricChiralMeasure_finite o (G i) (frames i) (hChiral i)
  obtain ⟨x, hx⟩ := (hr i).attains
  let inner := Metric.ball x (r i)
  let window := Metric.ball x (A * a i)
  have hsub : inner ⊆ window :=
    Metric.ball_subset_ball (hsmall.le.trans (mul_le_mul_of_nonneg_right (le_max_left L 1) hai.le))
  have hw : MeasurableSet window := Metric.isOpen_ball.measurableSet
  have hwindow : (chiral i).real window ≤ ∫ y in window, full i y ∂dV i := by
    rw [geometricChiralMeasure_real_eq_setIntegral o (G i) (frames i) (hChiral i) hw]
    exact setIntegral_mono_on (hChiral i).integrableOn (hFull i).integrableOn hw
      (fun y _ => hilbertSchmidtSq_traceFreeSelfDualBlock_le_frameTensorNormSq _)
  have hbig : ε < (chiral i).real inner := by
    change ε < (chiral i).real (Metric.ball x (r i))
    rw [hx, geometricChiralMeasure_real_univ o (G i) (frames i) (hChiral i)]
    exact hmi
  exact (hbig.trans_le ((measureReal_mono hsub).trans hwindow)).not_gt (hvi x)

end SmoothPoincare
