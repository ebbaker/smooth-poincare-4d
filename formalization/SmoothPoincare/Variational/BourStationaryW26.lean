import SmoothPoincare.Variational.BourStationaryReaction
import SmoothPoincare.Variational.BourHarmonicSystemInterior

/-! # Coupled interior bounds on the original stationary harmonic balls

Prepared for Edward B. Baker III with OpenAI Codex assistance, 26 November 2026.
The metric and covariant trace-free Ricci entries use a single physical
pullback, measure, chart, and curvature normalization.
-/

open FirstOrderTwistor DifferentialGeometry.Geometry.Riemannian
open DifferentialGeometry DifferentialGeometry.Geometry.Operator DifferentialGeometry.Geometry.Curvature
  DifferentialGeometry.PDE.RicciFlow DifferentialGeometry.Tensor.Coordinates
  DifferentialGeometry.Tensor0SBundle Filter Set MeasureTheory Bundle
open scoped ContDiff ENNReal NNReal Laplacian Manifold Topology

namespace SmoothPoincare

open Bour

noncomputable section

variable {E H M : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
    [NeZero (Module.finrank ℝ E)] [MeasurableSpace E] [BorelSpace E]
    [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
    [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
    [CompactSpace M] [BoundarylessManifold I M]

local notation "J" => Fin (Module.finrank ℝ E)
local notation "ι" => 𝓘(ℝ, E)

/-- The three physical chart norms of a smooth scalar entry. -/
def bourW26Norm (μ : Measure E) (u : E → ℝ) : ℝ≥0∞ :=
  eLpNorm u 6 μ + eLpNorm (fderiv ℝ u) 6 μ + eLpNorm (iteratedFDeriv ℝ 2 u) 6 μ

omit [FiniteDimensional ℝ E] [NeZero (Module.finrank ℝ E)] in
private theorem bourW26Norm_congr (μ : Measure E) {U : Set E} (hU : IsOpen U)
    {u v : E → ℝ} (h : EqOn u v U) : bourW26Norm (μ.restrict U) u = bourW26Norm (μ.restrict U) v := by
  have hg {x : E} (hx : x ∈ U) : u =ᶠ[𝓝 x] v := h.eventuallyEq_of_mem (hU.mem_nhds hx)
  have h0 : u =ᵐ[μ.restrict U] v := (ae_restrict_mem hU.measurableSet).mono fun _ hx => h hx
  have h1 : fderiv ℝ u =ᵐ[μ.restrict U] fderiv ℝ v :=
    (ae_restrict_mem hU.measurableSet).mono fun _ hx => (hg hx).fderiv_eq
  have h2 : iteratedFDeriv ℝ 2 u =ᵐ[μ.restrict U] iteratedFDeriv ℝ 2 v :=
    (ae_restrict_mem hU.measurableSet).mono fun _ hx => ((hg hx).iteratedFDeriv ℝ 2).self_of_nhds
  rw [bourW26Norm, bourW26Norm, eLpNorm_congr_ae h0, eLpNorm_congr_ae h1, eLpNorm_congr_ae h2]

omit [NeZero (Module.finrank ℝ E)] [CompactSpace M] in
/-- On the actual stationary metric at either normalization, the same
harmonic realization has common three-term bounds for every metric
and trace-free Ricci entry. Only the scalar Euclidean Laplacian estimate
is used after a harmonic chart has been furnished. -/
theorem bourStationary_harmonic_W26 (hDim : Module.finrank ℝ E = 4)
    (μ : Measure E) [Measure.IsAddHaarMeasure μ]
    {r L K C : ℝ} (hr : 0 < r) (hL : 0 < L) (hK : 0 ≤ K) (hC : 0 ≤ C)
    (A γ CΔ : ℝ≥0)
    (hLap : ∀ u : E → ℝ, ContDiff ℝ ∞ u → HasCompactSupport u →
      eLpNorm (iteratedFDeriv ℝ 2 u) 6 μ ≤ (CΔ : ℝ≥0∞) * eLpNorm (Δ u) 6 μ) :
    ∃ B : ℝ≥0∞, B < ⊤ ∧ ∀ (g : SmoothRiemannianMetric I M) (R : ℝ),
      (∀ x, metricScalarAt g x = R) → |R| ≤ C →
      ∀ (a : ℝ) (ha : 0 < a) (p : ℝ), 0 ≤ p → p ≤ 1 →
      ∀ (x : M) (b : BourHarmonicChart (scaleMetric a ha g) x L A γ),
        b.chart.source = Metric.ball (0 : E) (4 * r) →
        (∀ z ∈ Metric.ball (0 : E) (3 * r), bourCovariantGradient p g (b.chart z) = 0) →
        (∀ z ∈ Metric.ball (0 : E) (3 * r),
          Real.sqrt (intrinsicCurvatureSq (scaleMetric a ha g) (b.chart z)) ≤ K) →
        ∃ G : SmoothRiemannianMetric ι E,
          (∀ z ∈ Metric.ball (0 : E) (3*r), ∀ v w : E, G.inner z v w =
            (scaleMetric a ha g).inner (b.chart z)
              (mfderiv ι I (b.chart : E → M) z v) (mfderiv ι I (b.chart : E → M) z w)) ∧
          ∀ i j : J, let ν := μ.restrict (Metric.ball (0 : E) (5*r/2))
            bourW26Norm ν (chartGramOnE G 0 i j) +
              bourW26Norm ν (bourChartTensorComponent (bourTraceFreeRicciField G) 0 ![i,j]) ≤ B := by
  obtain ⟨U,F₀,F₁,hU,hF₀,hF₁,hPhysical⟩ :=
    bourUniformStationaryHarmonicTraceFreeRicci_bounds (I := I) (M := M) hDim hr hL A γ hK hC
  obtain ⟨CZ,hCZ,hSys⟩ := bourUniformHarmonicPullbackSystemW26_of_flatLaplacian
    (I := I) (M := M) (κ := J × J) μ hr hL A γ hU hF₀ hF₁ CΔ hLap
  obtain ⟨Cg,hCg,hMetric⟩ := bourUniformHarmonicMetricW2_of_flatLaplacian
    (I := I) (M := M) μ (p := 6) (by norm_num) (by norm_num) hr hL hK A γ CΔ hLap
  refine ⟨Cg+CZ, ENNReal.add_lt_top.2 ⟨hCg,hCZ⟩, ?_⟩
  intro g R hR hRC a ha p hp hp₁ x b hs hStat hRm
  obtain ⟨G,hPull,hHarm⟩ := b.exists_model_metric hr hs
  obtain ⟨G',hPull',hGi⟩ := hMetric (scaleMetric a ha g) x b hs hRm
  let Z (j : J × J) := bourChartTensorComponent (bourTraceFreeRicciField G) 0 ![j.1,j.2]
  have hZ (j : J × J) : ContDiff ℝ ∞ (Z j) := by
    rw [contDiff_iff_contDiffAt]
    intro z
    apply bourChartTensorComponent_contDiffAt
    rw [extChartAt_model_space_eq_id]
    simp
  obtain ⟨hZ₀,hP⟩ := hPhysical g R hR hRC a ha p hp hp₁ x b hs G hPull hHarm hStat hRm
  have hZi := hSys (scaleMetric a ha g) x b hs G hPull Z hZ hZ₀ hP
  refine ⟨G,hPull,fun i j => add_le_add ?_ (hZi (i,j))⟩
  have he : EqOn (chartGramOnE G 0 i j) (chartGramOnE G' 0 i j)
      (Metric.ball (0 : E) (5*r/2)) := by
    intro z hz
    have hz' : z ∈ Metric.ball (0 : E) (3*r) := Metric.ball_subset_ball (by linarith) hz
    have hh := (hPull z hz' (chartModelBasis E i) (chartModelBasis E j)).trans
      (hPull' z hz' (chartModelBasis E i) (chartModelBasis E j)).symm
    simpa only [chartGramOnE_def, extChartAt_model_space_eq_id, PartialEquiv.refl_symm,
      PartialEquiv.refl_coe, id_eq, chartGramMatrix_apply, chartBasisVecFiber,
      TangentBundle.symmL_model_space]
  exact (bourW26Norm_congr μ Metric.isOpen_ball he).le.trans (hGi i j)

/-- For the mixed stationary family, choose radius, chart controls and both
interior bounds before the parameter, metric, scale, and center. The actual
normalized physical ball and its original metric radius are retained. -/
theorem bourMixedStationary_uniformHarmonicW26 [ConnectedSpace M] [Nonempty M]
    (hDim : Module.finrank ℝ E = 4) (μ : Measure E) [Measure.IsAddHaarMeasure μ]
    {y C K : ℝ} (hy : 0 < y) (hC : 0 ≤ C) (hK : 0 < K)
    (γ CΔ : ℝ≥0) (hPeters : BourHarmonicRadiusSupplier (I := I) (M := M) K γ)
    (hLap : ∀ u : E → ℝ, ContDiff ℝ ∞ u → HasCompactSupport u →
      eLpNorm (iteratedFDeriv ℝ 2 u) 6 μ ≤ (CΔ : ℝ≥0∞) * eLpNorm (Δ u) 6 μ) :
    ∃ (r R L : ℝ) (A : ℝ≥0) (B : ℝ≥0∞), 0 < r ∧ 0 < R ∧ 0 < L ∧ B < ⊤ ∧
      ∀ (g : SmoothRiemannianMetric I M) (s p a : ℝ) (ha : 0 < a),
        y ≤ classYamabeFour hDim g → (∀ z, metricScalarAt g z = s) → 0 ≤ s → s ≤ C →
        0 ≤ p → p ≤ 1 → 1 ≤ a → (∀ z, bourCovariantGradient p g z = 0) →
        (∀ z, Real.sqrt (intrinsicCurvatureSq (scaleMetric a ha g) z) ≤ K) →
        ∀ x, ∃ (b : BourHarmonicChart (scaleMetric a ha g) x L A γ) (G : SmoothRiemannianMetric ι E),
          b.chart.source = Metric.ball (0 : E) (4*r) ∧
          b.chart.target ⊆ riemannianBallOf (scaleMetric a ha g) x R ∧
          riemannianBallOf g x ((r/L)/Real.sqrt a) ⊆ b.chart '' Metric.closedBall (0:E) r ∧
          (∀ z ∈ Metric.ball (0:E) (3*r), ∀ v w : E, G.inner z v w =
            (scaleMetric a ha g).inner (b.chart z)
              (mfderiv ι I (b.chart : E → M) z v) (mfderiv ι I (b.chart : E → M) z w)) ∧
          ∀ i j : J, let ν := μ.restrict (Metric.ball (0 : E) (5*r/2))
            bourW26Norm ν (chartGramOnE G 0 i j) +
              bourW26Norm ν (bourChartTensorComponent (bourTraceFreeRicciField G) 0 ![i,j]) ≤ B := by
  obtain ⟨r,R,L,A,hr,hR,hL,hCharts⟩ := bourUniformHarmonicBalls_of_yamabe hDim hy hC hK hPeters
  obtain ⟨B,hB,hW⟩ := bourStationary_harmonic_W26 (I := I) (M := M) hDim μ
    hr hL hK.le hC A γ CΔ hLap
  refine ⟨r,R,L,A,B,hr,hR,hL,hB,?_⟩
  intro g s p a ha hY hs hs₀ hsC hp hp₁ ha₁ hStat hRm x
  obtain ⟨b,hsource,htarget,hcover⟩ := hCharts g s a ha hY hs hs₀ hsC ha₁ hRm x
  obtain ⟨G,hPull,hEst⟩ := hW g s hs (by rwa [abs_of_nonneg hs₀]) a ha p hp hp₁ x b
    hsource (fun z _ => hStat (b.chart z)) (fun z _ => hRm (b.chart z))
  refine ⟨b,G,hsource,htarget,?_,hPull,hEst⟩
  exact (b.transport_to_original g ha hcover).1

end
end SmoothPoincare
