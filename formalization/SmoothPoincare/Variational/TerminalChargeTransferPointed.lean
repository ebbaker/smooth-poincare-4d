import SmoothPoincare.PhysicalScales.PointedTerminalBuffer
import SmoothPoincare.Variational.TerminalChargeTransfer

/-! # The positive E42 terminal charge in a complete pointed limit -/

open DifferentialGeometry DifferentialGeometry.CheegerGromovCompactness
  DifferentialGeometry.Geometry.Curvature DifferentialGeometry.Geometry.Metric
  DifferentialGeometry.Integral.Measure DifferentialGeometry.PDE.RicciFlow
  MeasureTheory Set Filter Manifold FirstOrderTwistor
open scoped Manifold ContDiff Topology ENNReal

noncomputable section
namespace SmoothPoincare

universe u uE uH

variable {E : Type uE} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
  [FiniteDimensional ℝ E] {H : Type uH} [TopologicalSpace H]
  {I : ModelWithCorners ℝ E H} [I.Boundaryless] {D : RealTimeInterval}
  {M : ℕ → Type u} [∀ i, TopologicalSpace (M i)] [∀ i, ChartedSpace H (M i)]
  [∀ i, IsManifold I ∞ (M i)] [∀ i, T2Space (M i)] [∀ i, CompactSpace (M i)]
  [∀ i, T2Space (TangentBundle I (M i))]

private local instance : CompleteSpace E := FiniteDimensional.complete ℝ E
private local instance {X : Type*} [TopologicalSpace X] : MeasurableSpace X := borel X
private local instance {X : Type*} [TopologicalSpace X] : BorelSpace X := ⟨rfl⟩

attribute [local instance] PointedRiemannianManifold.topology PointedRiemannianManifold.charted
  PointedRiemannianManifold.smooth PointedRiemannianManifold.t2
  PointedRiemannianManifold.sigmaCompact PointedRiemannianManifold.t2TangentBundle

/-- The pointed sequence formed from the specified terminal slices, with the
same centers used to measure the E42 source charge. -/
def terminalPointedFlowSequence
    (S : ∀ i, SolutionOn (I := I) (M := M i) D) (p : ∀ i, M i) (τ : ℝ) :
    PointedRiemannianSeq.{u,uE,uH} I where
  obj i := {
    M := M i
    topology := inferInstance
    charted := inferInstance
    smooth := inferInstance
    sigmaCompact := inferInstance
    t2 := inferInstance
    t2TangentBundle := inferInstance
    basepoint := p i
    metric := (S i).base.metric τ }

variable [∀ i, BoundarylessManifold I (M i)] [∀ i, PreconnectedSpace (M i)]

/-- For the actual modified flows, transport of the Euler test supplies a
strict terminal charge. The charge persists on the larger ball in a complete
pointed limit of these same terminal slices. -/
theorem ricciFlow_terminalBall_intrinsicRicciCharge_pointedLimit
    (S : ∀ i, SolutionOn (I := I) (M := M i) D) (hS : ∀ i, IsSolutionOn (S i))
    (o : ∀ i, ManifoldOrientation I (M i) 4) {τ b A L ε R c r : ℝ}
    (hτ : 0 < τ) (hb : b < 1/2) (hA : 0 ≤ A) (hL : 0 ≤ L)
    (hCarrier : Icc 0 τ ⊆ D.carrier) (hRegular : Ioo 0 τ ⊆ D.regular)
    (hRic : ∀ i, ∀ s ∈ Ioo 0 τ, ∀ x (v : TangentSpace I x),
      -(b/s) * ((S i).base.metric s).inner x v v ≤ (S i).ricciAt s x (vec2 v v))
    (p : ∀ i, M i) (P Q : ∀ i, Set (M i))
    (hP : ∀ i, MeasurableSet (P i)) (hQ : ∀ i, MeasurableSet (Q i))
    (hIn : ∀ i, ∀ x ∈ P i, (riemannianEDistOf ((S i).base.metric τ) (p i) x).toReal ≤ R)
    (hSupport : ∀ i, {x | (riemannianEDistOf ((S i).base.metric τ) (p i) x).toReal < R+1} ⊆ Q i)
    {X : PointedRiemannianManifold.{u,uE,uH} I} {φ : ℕ → ℕ}
    (F : PointedRiemannianConvergenceMaps (terminalPointedFlowSequence S p τ) X φ)
    (C : MetricConvergenceData F)
    (hcanonical : ∀ i, C.domain i = CanonicalMetricCompactness.canonicalSourceData F i)
    (hφ : Tendsto φ atTop atTop) (hComplete : MetricComplete X)
    (hR : 0 < R+1) (hr : R+1 < r) (hc : 0 < c)
    (hMargin : c < ε^2/2 - 2*(144*A*L)*Real.sqrt (τ/(1-2*b))) :
    let g := fun i => (S i).base.metric
    let μ := fun i s => riemannianVolumeMeasure I (M i) (g i s)
    (∀ i, ∀ s ∈ Ioo 0 τ, Real.sqrt (∫ x, testedEulerCurvatureNorm (g i s) x ^ 2 ∂(μ i s)) ≤ A) →
    (∀ i, IntervalIntegrable (fun s => ∫ x, testedEulerRicciDerivativeNorm (g i s) x ^ 2
      ∂(μ i s)) volume 0 τ) →
    (∀ i, (∫ s in (0 : ℝ)..τ, ∫ x, testedEulerRicciDerivativeNorm (g i s) x ^ 2
      ∂(μ i s)) ≤ L^2) →
    (∀ i, ε^2 ≤ (∫ x in P i, intrinsicCurvatureSq (g i 0) x ∂(μ i 0))) →
    Tendsto (fun i => ∫ x in Q i, intrinsicWeylScalarCharge (g i 0) x ∂(μ i 0))
      atTop (𝓝 0) →
    c ≤ ∫ x in riemannianBallOf X.metric X.basepoint r, intrinsicTraceFreeRicciSq X.metric x
      ∂riemannianVolumeMeasure I X.M X.metric := by
  intro g μ hU hInt hBudget hFull hMass
  have hdim := (o 0).dimension_eq
  let : NeZero (Module.finrank ℝ E) := ⟨by rw [hdim]; decide⟩
  have hTest := tendsto_terminalBallCutoff_weylScalarCharge_of_initial_region o
    (fun i => g i 0) (fun i => g i τ) p R Q hQ hSupport hMass
  have hSource := eventually_ricciFlow_terminalBall_intrinsicRicciCharge S hS o hτ hb hA hL
    hCarrier hRegular hRic p P hP hIn hU hInt hBudget hFull hTest hMargin
  have hCharge : ∀ᶠ i in atTop,
      ENNReal.ofReal c ≤ ∫⁻ x in riemannianBallOf (g (φ i) τ) (p (φ i)) (R+1),
        ENNReal.ofReal (intrinsicTraceFreeRicciSq (g (φ i) τ) x) ∂(μ (φ i) τ) := by
    filter_upwards [hφ.eventually hSource] with i hi
    rw [← ofReal_integral_intrinsicTraceFreeRicciSq_eq_lintegral_of_compactSpace hdim]
    exact ENNReal.ofReal_le_ofReal hi
  have hLimit := pointedTerminalBuffer_traceFreeRicci_charge F C hcanonical hComplete hR hr hCharge
  let B := riemannianBallOf X.metric X.basepoint r
  let K := riemannianClosedBallOf X.metric X.basepoint r
  let ν := riemannianVolumeMeasure I X.M X.metric
  let : IsFiniteMeasureOnCompacts ν := riemannianVolumeMeasure_isFiniteMeasureOnCompacts X.metric
  have hComp : RiemannianMetricComplete X.metric := ⟨MetricComplete.complete X hComplete⟩
  have hK : IsCompact K := hComp.closedEBall_isCompact _ _
  have hBK : B ⊆ K := by
    intro x hx
    change riemannianEDistOf X.metric X.basepoint x < ENNReal.ofReal r at hx
    change riemannianEDistOf X.metric X.basepoint x ≤ ENNReal.ofReal r
    exact hx.le
  have hi : IntegrableOn (intrinsicTraceFreeRicciSq X.metric) B ν :=
    ((continuous_intrinsicTraceFreeRicciSq X.metric).continuousOn.integrableOn_compact hK).mono_set hBK
  have hnn := ae_of_all (ν.restrict B) (intrinsicTraceFreeRicciSq_nonneg_of_finrank hdim X.metric)
  have heq := ofReal_integral_eq_lintegral_ofReal hi hnn
  change ENNReal.ofReal c ≤
    ∫⁻ x in B, ENNReal.ofReal (intrinsicTraceFreeRicciSq X.metric x) ∂ν at hLimit
  rw [← heq] at hLimit
  have hle := ENNReal.toReal_mono ENNReal.ofReal_ne_top hLimit
  simpa only [ENNReal.toReal_ofReal hc.le, ENNReal.toReal_ofReal (integral_nonneg_of_ae hnn)]
    using hle

end SmoothPoincare
