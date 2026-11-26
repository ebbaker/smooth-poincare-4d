import SmoothPoincare.Variational.IntrinsicTerminalCharge
import DifferentialGeometry.Geometry.Metric.Distance.Ball
import DifferentialGeometry.Geometry.Metric.Distance.Finiteness

/-! # Transfer of terminal trace-free Ricci charge -/

open DifferentialGeometry DifferentialGeometry.Geometry.Curvature
  DifferentialGeometry.Geometry.Metric DifferentialGeometry.Integral.Measure
  DifferentialGeometry.PDE.RicciFlow DifferentialGeometry.Tensor0SBundle
  DifferentialGeometry.Geometry.Operator FirstOrderTwistor MeasureTheory Set Filter Manifold
open scoped Manifold ContDiff Topology ENNReal

noncomputable section
namespace SmoothPoincare

variable {E H : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
  [FiniteDimensional ℝ E] [TopologicalSpace H] {I : ModelWithCorners ℝ E H}

private local instance : CompleteSpace E := FiniteDimensional.complete ℝ E
private local instance {X : Type*} [TopologicalSpace X] : MeasurableSpace X := borel X
private local instance {X : Type*} [TopologicalSpace X] : BorelSpace X := ⟨rfl⟩

section Density

variable {M : Type*} [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]

/-- The curvature term cancels in the intrinsic definition of Ricci charge. -/
theorem intrinsicTraceFreeRicciSq_eq_ricciNormSq_sub_scalarSq
    (g : SmoothRiemannianMetric I M) (x : M) :
    intrinsicTraceFreeRicciSq g x =
      normSq0S g x 2 (metricRicciAt g x) - metricScalarAt g x ^ 2 / 4 := by
  unfold intrinsicTraceFreeRicciSq intrinsicCurvatureSq intrinsicEulerDensity
  ring

theorem continuous_intrinsicTraceFreeRicciSq [T2Space M] (g : SmoothRiemannianMetric I M) :
    Continuous (intrinsicTraceFreeRicciSq g) := by
  have hRic : Continuous (fun x => normSq0S g x 2 (metricRicciAt g x)) := by
    simpa only [metricRicci_apply] using normSq0S_cont g (metricRicci g)
  change Continuous (fun x => intrinsicTraceFreeRicciSq g x)
  simp_rw [intrinsicTraceFreeRicciSq_eq_ricciNormSq_sub_scalarSq]
  exact hRic.sub (((metricScalar_smooth g).continuous.pow 2).div_const 4)

/-- In dimension four, metric trace Cauchy–Schwarz gives nonnegativity
without choosing an orientation on the comparison manifold. -/
theorem intrinsicTraceFreeRicciSq_nonneg_of_finrank
    (hdim : Module.finrank ℝ E = 4) (g : SmoothRiemannianMetric I M) (x : M) :
    0 ≤ intrinsicTraceFreeRicciSq g x := by
  classical
  let b := Module.finBasis ℝ (TangentSpace I x)
  have h := metricTracePair0SAt_sq_le_card_mul_normSq0S g b
    (basisInvMetric g x b) (basisInvMetric_isInverse g x b) (metricRicciAt g x)
  simp only [Fintype.card_fin] at h
  change metricTracePair0SAt g (metricRicciAt g x) ^ 2 ≤
    (Module.finrank ℝ E : ℝ) * normSq0S g x 2 (metricRicciAt g x) at h
  rw [hdim] at h
  change metricTracePair0SAt g (metricRicciAt g x) ^ 2 ≤
    (4 : ℝ) * normSq0S g x 2 (metricRicciAt g x) at h
  rw [intrinsicTraceFreeRicciSq_eq_ricciNormSq_sub_scalarSq, metricScalarAt_def]
  linarith only [h]

theorem intrinsicTraceFreeRicciSq_nonneg_of_orientation [T2Space M] [BoundarylessManifold I M]
    (o : ManifoldOrientation I M 4) (g : SmoothRiemannianMetric I M) (x : M) :
    0 ≤ intrinsicTraceFreeRicciSq g x := by
  let f := orientedOrthonormalFrameAt g o
  rw [(intrinsicTerminalCharge_eq_modifiedChargeDensity g o f x).2.1]
  exact modifiedChargeDensity_nonneg o g f .ricci x

theorem ofReal_integral_intrinsicTraceFreeRicciSq_eq_lintegral
    [T2Space M] [SigmaCompactSpace M]
    (hdim : Module.finrank ℝ E = 4) (g : SmoothRiemannianMetric I M)
    {K : Set M} (hK : IsCompact K) :
    ENNReal.ofReal (∫ x in K, intrinsicTraceFreeRicciSq g x
      ∂riemannianVolumeMeasure I M g) =
      ∫⁻ x in K, ENNReal.ofReal (intrinsicTraceFreeRicciSq g x)
        ∂riemannianVolumeMeasure I M g := by
  let : IsFiniteMeasureOnCompacts (riemannianVolumeMeasure I M g) :=
    riemannianVolumeMeasure_isFiniteMeasureOnCompacts g
  exact ofReal_integral_eq_lintegral_ofReal
    ((continuous_intrinsicTraceFreeRicciSq g).continuousOn.integrableOn_compact hK)
    (ae_of_all _ fun x => intrinsicTraceFreeRicciSq_nonneg_of_finrank hdim g x)

theorem ofReal_integral_intrinsicTraceFreeRicciSq_eq_lintegral_of_compactSpace
    [T2Space M] [CompactSpace M]
    (hdim : Module.finrank ℝ E = 4) (g : SmoothRiemannianMetric I M) (K : Set M) :
    ENNReal.ofReal (∫ x in K, intrinsicTraceFreeRicciSq g x
      ∂riemannianVolumeMeasure I M g) =
      ∫⁻ x in K, ENNReal.ofReal (intrinsicTraceFreeRicciSq g x)
        ∂riemannianVolumeMeasure I M g := by
  let : IsFiniteMeasureOnCompacts (riemannianVolumeMeasure I M g) :=
    riemannianVolumeMeasure_isFiniteMeasureOnCompacts g
  have hi := (continuous_intrinsicTraceFreeRicciSq g).integrable_of_hasCompactSupport
    (HasCompactSupport.of_compactSpace (intrinsicTraceFreeRicciSq g))
    (μ := riemannianVolumeMeasure I M g)
  exact ofReal_integral_eq_lintegral_ofReal (hi.restrict (s := K))
    (ae_of_all _ fun x => intrinsicTraceFreeRicciSq_nonneg_of_finrank hdim g x)

/-- A positive charge on a measurable region detects nonzero trace-free Ricci
there. -/
theorem exists_pos_intrinsicTraceFreeRicciSq_of_setIntegral_pos [T2Space M] [SigmaCompactSpace M]
    (g : SmoothRiemannianMetric I M) {K : Set M} (hK : MeasurableSet K)
    (h : 0 < ∫ x in K, intrinsicTraceFreeRicciSq g x ∂riemannianVolumeMeasure I M g) :
    ∃ x ∈ K, 0 < intrinsicTraceFreeRicciSq g x := by
  by_contra! hzero
  exact h.not_ge (setIntegral_nonpos hK hzero)

private theorem intrinsicWeylScalarCharge_nonneg [T2Space M] [BoundarylessManifold I M]
    (o : ManifoldOrientation I M 4) (g : SmoothRiemannianMetric I M) (x : M) :
    0 ≤ intrinsicWeylScalarCharge g x := by
  let f := orientedOrthonormalFrameAt g o
  rw [(intrinsicTerminalCharge_eq_modifiedChargeDensity g o f x).2.2]
  have hp := modifiedChargeDensity_nonneg o g f .plus x
  have hm := modifiedChargeDensity_nonneg o g f .minus x
  have hs := modifiedChargeDensity_nonneg o g f .scalar x
  linarith only [hp, hm, hs]

private theorem continuous_intrinsicWeylScalarCharge [T2Space M] (g : SmoothRiemannianMetric I M) :
    Continuous (intrinsicWeylScalarCharge g) := by
  have hu : Continuous (intrinsicCurvatureSq g) := by
    change Continuous (fun x => normSq0S g x 4 (metricRm04At g x))
    simpa only [metricRm04_apply] using normSq0S_cont g (metricRm04 g)
  have he : intrinsicWeylScalarCharge g =
      fun x => intrinsicCurvatureSq g x - 2 * intrinsicTraceFreeRicciSq g x := by
    funext x
    unfold intrinsicWeylScalarCharge intrinsicTraceFreeRicciSq
    ring
  rw [he]
  exact hu.sub (continuous_const.mul (continuous_intrinsicTraceFreeRicciSq g))

end Density

/-- A strictly positive remainder is available on a common short time range
when the curvature and differentiated Ricci budgets are independent of time. -/
theorem exists_pos_terminalCharge_margin {ε b A L : ℝ} (hε : 0 < ε) :
    ∃ δ > 0, ∀ τ ∈ Ioo 0 δ,
      ε^2/4 < ε^2/2 - 2*(144*A*L)*Real.sqrt (τ/(1-2*b)) := by
  let f : ℝ → ℝ := fun τ => ε^2/2 - 2*(144*A*L)*Real.sqrt (τ/(1-2*b))
  have hf : Continuous f :=
    continuous_const.sub (continuous_const.mul (Real.continuous_sqrt.comp
      (continuous_id.div_const _)))
  have h0 : 0 ∈ {τ | ε^2/4 < f τ} := by
    change ε^2/4 < f 0
    simp only [f, zero_div, Real.sqrt_zero, mul_zero, sub_zero]
    nlinarith only [sq_pos_of_pos hε]
  obtain ⟨δ, hδ, hsub⟩ := Metric.isOpen_iff.mp (isOpen_lt continuous_const hf) 0 h0
  refine ⟨δ, hδ, fun τ hτ => hsub ?_⟩
  simpa only [Metric.mem_ball, Real.dist_eq, sub_zero, abs_of_pos hτ.1] using hτ.2

section Sequence

variable [I.Boundaryless] {D : RealTimeInterval}
  {M : ℕ → Type*} [∀ i, TopologicalSpace (M i)] [∀ i, ChartedSpace H (M i)]
  [∀ i, IsManifold I ∞ (M i)] [∀ i, T2Space (M i)] [∀ i, CompactSpace (M i)]
  [∀ i, BoundarylessManifold I (M i)] [∀ i, PreconnectedSpace (M i)]

/-- A uniform initial comparison region is enough to bound the tested initial
Weyl-scalar charge. Its integral uses the metric at time zero. -/
theorem tendsto_terminalBallCutoff_weylScalarCharge_of_initial_region
    (o : ∀ i, ManifoldOrientation I (M i) 4)
    (g₀ gτ : ∀ i, SmoothRiemannianMetric I (M i)) (p : ∀ i, M i) (R : ℝ)
    (Q : ∀ i, Set (M i)) (hQ : ∀ i, MeasurableSet (Q i))
    (hSupport : ∀ i, {x | (riemannianEDistOf (gτ i) (p i) x).toReal < R+1} ⊆ Q i)
    (hMass : Tendsto (fun i => ∫ x in Q i, intrinsicWeylScalarCharge (g₀ i) x
      ∂riemannianVolumeMeasure I (M i) (g₀ i)) atTop (𝓝 0)) :
    Tendsto (fun i => ∫ x, terminalBallCutoff (gτ i) (p i) R x *
      intrinsicWeylScalarCharge (g₀ i) x ∂riemannianVolumeMeasure I (M i) (g₀ i))
      atTop (𝓝 0) := by
  apply tendsto_of_tendsto_of_tendsto_of_le_of_le tendsto_const_nhds hMass
  · intro i
    apply integral_nonneg
    intro x
    have hχ := (terminalBallCutoff_properties (gτ i) (p i) R).1 x
    exact mul_nonneg hχ.1 (intrinsicWeylScalarCharge_nonneg (o i) (g₀ i) x)
  · intro i
    let μ := riemannianVolumeMeasure I (M i) (g₀ i)
    let d := intrinsicWeylScalarCharge (g₀ i)
    let χ := terminalBallCutoff (gτ i) (p i) R
    let : IsFiniteMeasureOnCompacts μ := riemannianVolumeMeasure_isFiniteMeasureOnCompacts (g₀ i)
    obtain ⟨h01, _, hZero, hLip⟩ := terminalBallCutoff_properties (gτ i) (p i) R
    have hχ : Continuous χ :=
      metricLipschitzCutoff_continuous (gτ i) (L := 1) (by simpa using hLip)
    have hd : Continuous d := continuous_intrinsicWeylScalarCharge (g₀ i)
    have hJ := intrinsicWeylScalarCharge_nonneg (o i) (g₀ i)
    have hi := hd.integrable_of_hasCompactSupport (HasCompactSupport.of_compactSpace d) (μ := μ)
    have hχi := (hχ.mul hd).integrable_of_hasCompactSupport
      (HasCompactSupport.of_compactSpace (fun x => χ x * d x)) (μ := μ)
    exact (modifiedCutoff_integral_sandwich μ
      (A := ∅) MeasurableSet.empty (hQ i) χ d hJ h01 (by simp)
      (fun x hx => hZero x (le_of_not_gt fun h => hx (hSupport i h)))
      hi hχi).2

/-- A terminal ball charge on an actual sequence of modified solutions at a fixed
positive time. The constants in the curvature and differentiated Ricci estimates
are common to the sequence. The initial tested Weyl and scalar charge vanishes,
which leaves a strict uniform Ricci remainder. -/
theorem eventually_ricciFlow_terminalBall_intrinsicRicciCharge
    (S : ∀ i, SolutionOn (I := I) (M := M i) D) (hS : ∀ i, IsSolutionOn (S i))
    (o : ∀ i, ManifoldOrientation I (M i) 4) {τ b A L ε R c : ℝ}
    (hτ : 0 < τ) (hb : b < 1/2) (hA : 0 ≤ A) (hL : 0 ≤ L)
    (hCarrier : Icc 0 τ ⊆ D.carrier) (hRegular : Ioo 0 τ ⊆ D.regular)
    (hRic : ∀ i, ∀ s ∈ Ioo 0 τ, ∀ x (v : TangentSpace I x),
      -(b/s) * ((S i).base.metric s).inner x v v ≤ (S i).ricciAt s x (vec2 v v))
    (p : ∀ i, M i) (P : ∀ i, Set (M i)) (hP : ∀ i, MeasurableSet (P i))
    (hIn : ∀ i, ∀ x ∈ P i, (riemannianEDistOf ((S i).base.metric τ) (p i) x).toReal ≤ R) :
    let g := fun i => (S i).base.metric
    let μ := fun i s => riemannianVolumeMeasure I (M i) (g i s)
    let B := fun i => riemannianBallOf (g i τ) (p i) (R+1)
    (∀ i, ∀ s ∈ Ioo 0 τ, Real.sqrt (∫ x, testedEulerCurvatureNorm (g i s) x ^ 2 ∂(μ i s)) ≤ A) →
    (∀ i, IntervalIntegrable (fun s => ∫ x, testedEulerRicciDerivativeNorm (g i s) x ^ 2
      ∂(μ i s)) volume 0 τ) →
    (∀ i, (∫ s in (0 : ℝ)..τ, ∫ x, testedEulerRicciDerivativeNorm (g i s) x ^ 2
      ∂(μ i s)) ≤ L^2) →
    (∀ i, ε^2 ≤ (∫ x in P i, intrinsicCurvatureSq (g i 0) x ∂(μ i 0))) →
    Tendsto (fun i => ∫ x, terminalBallCutoff (g i τ) (p i) R x *
      intrinsicWeylScalarCharge (g i 0) x ∂(μ i 0)) atTop (𝓝 0) →
    c < ε^2/2 - 2*(144*A*L)*Real.sqrt (τ/(1-2*b)) →
    ∀ᶠ i in atTop, c ≤ ∫ x in B i, intrinsicTraceFreeRicciSq (g i τ) x ∂(μ i τ) := by
  intro g μ B hU hInt hBudget hFull hCharge hMargin
  have hSmall := hCharge.eventually_lt_const (show 0 <
    (ε^2/2 - 2*(144*A*L)*Real.sqrt (τ/(1-2*b))) - c by linarith)
  filter_upwards [hSmall] with i hi
  have hBall : B i = {x | (riemannianEDistOf (g i τ) (p i) x).toReal < R+1} := by
    ext x
    change riemannianEDistOf (g i τ) (p i) x < ENNReal.ofReal (R+1) ↔ _
    constructor
    · exact ENNReal.toReal_lt_of_lt_ofReal
    · intro hx
      rw [← ENNReal.ofReal_toReal (riemannianEDistOf_ne_top (g i τ) (p i) x)]
      exact (ENNReal.ofReal_lt_ofReal_iff_of_nonneg ENNReal.toReal_nonneg).mpr hx
  rw [hBall]
  have h := ricciFlow_terminalBall_intrinsicRicciCharge (S i) (hS i) (o i)
    hτ hb hA hL hCarrier hRegular (hRic i) (p i) R (P i) (hP i) (hIn i)
    (hU i) (hInt i) (hBudget i) (hFull i)
  change ε^2/2 - (∫ x, terminalBallCutoff (g i τ) (p i) R x *
    intrinsicWeylScalarCharge (g i 0) x ∂(μ i 0)) -
    2*(144*A*L)*Real.sqrt (τ/(1-2*b)) ≤ _ at h
  linarith only [h, hi]

end Sequence

end SmoothPoincare
