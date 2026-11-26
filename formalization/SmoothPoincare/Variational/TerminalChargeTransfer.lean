import SmoothPoincare.Variational.IntrinsicTerminalCharge

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

theorem continuous_intrinsicTraceFreeRicciSq (g : SmoothRiemannianMetric I M) :
    Continuous (intrinsicTraceFreeRicciSq g) := by
  have hRic : Continuous (fun x => normSq0S g x 2 (metricRicciAt g x)) := by
    simpa only [metricRicci_apply] using normSq0S_cont g (metricRicci g)
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
  simp only [Fintype.card_fin, hdim, Nat.cast_ofNat] at h
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

end Density

section Sequence

variable [I.Boundaryless] {D : RealTimeInterval}
  {M : ℕ → Type*} [∀ i, TopologicalSpace (M i)] [∀ i, ChartedSpace H (M i)]
  [∀ i, IsManifold I ∞ (M i)] [∀ i, T2Space (M i)] [∀ i, CompactSpace (M i)]
  [∀ i, BoundarylessManifold I (M i)] [∀ i, PreconnectedSpace (M i)]

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
    0 < c → c < ε^2/2 - 2*(144*A*L)*Real.sqrt (τ/(1-2*b)) →
    ∀ᶠ i in atTop, c ≤ ∫ x in B i, intrinsicTraceFreeRicciSq (g i τ) x ∂(μ i τ) := by
  intro g μ B hU hInt hBudget hFull hCharge hc hMargin
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
      exact ENNReal.ofReal_lt_ofReal ENNReal.toReal_nonneg hx
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
