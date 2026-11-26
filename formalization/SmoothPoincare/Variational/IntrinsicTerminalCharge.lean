import SmoothPoincare.Variational.TerminalBallEulerCharge

/-! # Intrinsic terminal ball curvature charge -/

open DifferentialGeometry DifferentialGeometry.Geometry.Curvature DifferentialGeometry.Geometry.Metric
  DifferentialGeometry.Integral.Measure DifferentialGeometry.PDE.RicciFlow
  DifferentialGeometry.Tensor0SBundle FirstOrderTwistor MeasureTheory Set
open scoped Manifold ContDiff Topology

noncomputable section
namespace SmoothPoincare

variable {E H M : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  [BoundarylessManifold I M] [CompactSpace M] {D : RealTimeInterval}

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩
private local instance : CompleteSpace E := FiniteDimensional.complete ℝ E
private local instance : IsManifold I 1 M := IsManifold.of_le (by decide : (1 : WithTop ℕ∞) ≤ ∞)

open scoped ENNReal

/-- The ordered full Riemann squared norm in the actual slice metric. -/
def intrinsicCurvatureSq (g : SmoothRiemannianMetric I M) (x : M) : ℝ :=
  normSq0S g x 4 (metricRm04At g x)

/-- The trace-free Ricci square in dimension four, in the actual slice metric. -/
def intrinsicTraceFreeRicciSq (g : SmoothRiemannianMetric I M) (x : M) : ℝ :=
  intrinsicCurvatureSq g x / 4 - intrinsicEulerDensity g x

/-- The combined charge of the two signed Weyl blocks and scalar square. -/
def intrinsicWeylScalarCharge (g : SmoothRiemannianMetric I M) (x : M) : ℝ :=
  intrinsicCurvatureSq g x / 2 + 2 * intrinsicEulerDensity g x

omit [I.Boundaryless] [CompactSpace M] in
/-- All three intrinsic densities have the same normalization as the physical
charges evaluated in any pointwise oriented orthonormal frames. -/
theorem intrinsicTerminalCharge_eq_modifiedChargeDensity (g : SmoothRiemannianMetric I M)
    (o : ManifoldOrientation I M 4) (f : ∀ x, OrientedOrthonormalFrameAt g o x) (x : M) :
    intrinsicCurvatureSq g x = modifiedChargeDensity o g f .full x ∧
    intrinsicTraceFreeRicciSq g x = modifiedChargeDensity o g f .ricci x ∧
    intrinsicWeylScalarCharge g x = 4 * (modifiedChargeDensity o g f .plus x +
      modifiedChargeDensity o g f .minus x) + modifiedChargeDensity o g f .scalar x / 6 := by
  have hfull : intrinsicCurvatureSq g x = modifiedChargeDensity o g f .full x :=
    normSq0S_rm04_eq_frameTensorNormSq g o x (f x)
  have hsplit : modifiedChargeDensity o g f .full x =
      4 * (modifiedChargeDensity o g f .plus x + modifiedChargeDensity o g f .minus x) +
      2 * modifiedChargeDensity o g f .ricci x + modifiedChargeDensity o g f .scalar x / 6 :=
    metricFrameTensorNormSq_eq_chiral_ricci_scalar g o x (f x)
  have he := intrinsicEulerDensity_eq_modifiedChargeDensity g o f x
  refine ⟨hfull, ?_, ?_⟩
  · unfold intrinsicTraceFreeRicciSq
    linarith only [hfull, hsplit, he]
  · unfold intrinsicWeylScalarCharge
    linarith only [hfull, hsplit, he]

private theorem terminalCharge_of_integrable {X : Type*} [MeasurableSpace X] (μ ν : Measure X)
    (χ U Z e₀ eτ : X → ℝ) {Q B : Set X} (hQ : MeasurableSet Q) (hB : MeasurableSet B)
    (hχ : ∀ x, χ x ∈ Icc (0 : ℝ) 1) (hOne : ∀ x ∈ Q, χ x = 1) (hZero : ∀ x ∉ B, χ x = 0)
    (hU : ∀ x, 0 ≤ U x) (hZ : ∀ x, 0 ≤ Z x) (hNeg : ∀ x, -2 * eτ x ≤ Z x)
    (hiU : Integrable U μ) (hiZ : Integrable Z ν) (hwU : Integrable (fun x => χ x * U x) μ)
    (hwZ : Integrable (fun x => χ x * Z x) ν) (he₀ : Integrable (fun x => χ x * e₀ x) μ)
    (heτ : Integrable (fun x => χ x * eτ x) ν) {q C : ℝ}
    (hFull : q ≤ (∫ x in Q, U x ∂μ))
    (hTransport : |(∫ x, χ x * eτ x ∂ν) - ∫ x, χ x * e₀ x ∂μ| ≤ C) :
    q / 2 - (∫ x, χ x * (U x / 2 + 2 * e₀ x) ∂μ) - 2 * C ≤ ∫ x in B, Z x ∂ν := by
  have hLow := hFull.trans
    (modifiedCutoff_integral_sandwich μ hQ hB χ U hU hχ hOne hZero hiU hwU).1
  have hHigh := (modifiedCutoff_integral_sandwich ν hQ hB χ Z hZ hχ hOne hZero hiZ hwZ).2
  have hEnd : -2 * (∫ x, χ x * eτ x ∂ν) ≤ ∫ x, χ x * Z x ∂ν := by
    rw [← integral_const_mul]
    apply integral_mono (heτ.const_mul (-2)) hwZ
    intro x
    change -2 * (χ x * eτ x) ≤ χ x * Z x
    rw [mul_left_comm (-2)]
    exact mul_le_mul_of_nonneg_left (hNeg x) (hχ x).1
  have hCharge : (∫ x, χ x * (U x / 2 + 2 * e₀ x) ∂μ) =
      (∫ x, χ x * U x ∂μ) / 2 + 2 * (∫ x, χ x * e₀ x ∂μ) := by
    have hSplit (x : X) : χ x * (U x / 2 + 2 * e₀ x) = (χ x * U x) / 2 + 2 * (χ x * e₀ x) := by ring
    simp_rw [hSplit]
    rw [integral_add (hwU.div_const 2) (he₀.const_mul 2), integral_div, integral_const_mul]
  linarith only [hLow, hHigh, hEnd, hCharge, (abs_le.mp hTransport).2]

omit [I.Boundaryless] [CompactSpace M] in
private theorem intrinsicTerminalCharge_nonneg (g : SmoothRiemannianMetric I M)
    (o : ManifoldOrientation I M 4) (x : M) :
    0 ≤ intrinsicCurvatureSq g x ∧ 0 ≤ intrinsicTraceFreeRicciSq g x ∧
      -2 * intrinsicEulerDensity g x ≤ intrinsicTraceFreeRicciSq g x := by
  let f := orientedOrthonormalFrameAt g o
  obtain ⟨hU, hZ, _⟩ := intrinsicTerminalCharge_eq_modifiedChargeDensity g o f x
  have hd (c : ModifiedChargeComponent) := modifiedChargeDensity_nonneg o g f c x
  refine ⟨hU ▸ hd .full, hZ ▸ hd .ricci, ?_⟩
  rw [hZ, intrinsicEulerDensity_eq_modifiedChargeDensity g o f x]
  linarith only [hd .plus, hd .minus, hd .scalar]

omit [I.Boundaryless] [BoundarylessManifold I M] [CompactSpace M] in
private theorem intrinsicCurvatureSq_continuous (g : SmoothRiemannianMetric I M) :
    Continuous (intrinsicCurvatureSq g) := by
  change Continuous (fun x => normSq0S g x 4 (metricRm04At g x))
  simpa only [metricRm04_apply] using normSq0S_cont g (metricRm04 g)

omit [I.Boundaryless] [BoundarylessManifold I M] [CompactSpace M] in
private theorem intrinsicEulerDensity_continuous (g : SmoothRiemannianMetric I M) :
    Continuous (intrinsicEulerDensity g) := by
  have hRic : Continuous (fun x => normSq0S g x 2 (metricRicciAt g x)) := by
    simpa only [metricRicci_apply] using normSq0S_cont g (metricRicci g)
  exact (((intrinsicCurvatureSq_continuous g).div_const 4).sub hRic).add
    (((metricScalar_smooth g).continuous.pow 2).div_const 4)

omit [I.Boundaryless] in
/-- Extract a terminal trace-free Ricci charge from the tested Euler bound.
Compactness gives integrability from continuity of the slice densities and
the common fixed cutoff. -/
theorem intrinsicTerminalRicci_lower_of_testedEuler
    (o : ManifoldOrientation I M 4) (g₀ gτ : SmoothRiemannianMetric I M) {C ε : ℝ}
    (χ : M → ℝ) (hχc : Continuous χ) (hχ : ∀ x, χ x ∈ Icc (0 : ℝ) 1)
    {P B : Set M} (hP : MeasurableSet P) (hB : MeasurableSet B)
    (hOne : ∀ x ∈ P, χ x = 1) (hZero : ∀ x ∉ B, χ x = 0) :
    let μ := riemannianVolumeMeasure I M g₀
    let ν := riemannianVolumeMeasure I M gτ
    ε^2 ≤ (∫ x in P, intrinsicCurvatureSq g₀ x ∂μ) →
    |testedEulerMoment gτ χ - testedEulerMoment g₀ χ| ≤ C →
    ε^2/2 - (∫ x, χ x * intrinsicWeylScalarCharge g₀ x ∂μ) - 2*C ≤
      ∫ x in B, intrinsicTraceFreeRicciSq gτ x ∂ν := by
  intro μ ν hFull hTransport
  let U := intrinsicCurvatureSq g₀
  let Z := intrinsicTraceFreeRicciSq gτ
  let e₀ := intrinsicEulerDensity g₀
  let eτ := intrinsicEulerDensity gτ
  have hUc : Continuous U := intrinsicCurvatureSq_continuous g₀
  have hEc₀ : Continuous e₀ := intrinsicEulerDensity_continuous g₀
  have hEcτ : Continuous eτ := intrinsicEulerDensity_continuous gτ
  have hZc : Continuous Z := ((intrinsicCurvatureSq_continuous gτ).div_const 4).sub hEcτ
  have hInt (g : SmoothRiemannianMetric I M) (d : M → ℝ) (hd : Continuous d) :
      Integrable d (riemannianVolumeMeasure I M g) := by
    let : IsFiniteMeasureOnCompacts (riemannianVolumeMeasure I M g) := riemannianVolumeMeasure_isFiniteMeasureOnCompacts g
    exact hd.integrable_of_hasCompactSupport (HasCompactSupport.of_compactSpace d)
  exact terminalCharge_of_integrable μ ν χ U Z e₀ eτ hP hB hχ hOne hZero
    (fun x => (intrinsicTerminalCharge_nonneg g₀ o x).1)
    (fun x => (intrinsicTerminalCharge_nonneg gτ o x).2.1)
    (fun x => (intrinsicTerminalCharge_nonneg gτ o x).2.2)
    (hInt g₀ U hUc) (hInt gτ Z hZc) (hInt g₀ _ (hχc.mul hUc)) (hInt gτ _ (hχc.mul hZc))
    (hInt g₀ _ (hχc.mul hEc₀)) (hInt gτ _ (hχc.mul hEcτ)) hFull hTransport

variable [PreconnectedSpace M]

/-- The whole open terminal ball carries the intrinsic trace-free Ricci
lower bound. The initial combined charge is measured with one fixed
terminal-distance cutoff and the initial slice volume. -/
theorem ricciFlow_terminalBall_intrinsicRicciCharge
    (S : SolutionOn (I := I) (M := M) D) (hS : IsSolutionOn S)
    (o : ManifoldOrientation I M 4) {τ b A L ε : ℝ} (hτ : 0 < τ) (hb : b < 1/2)
    (hA : 0 ≤ A) (hL : 0 ≤ L) (hCarrier : Icc 0 τ ⊆ D.carrier) (hRegular : Ioo 0 τ ⊆ D.regular)
    (hRic : ∀ s ∈ Ioo 0 τ, ∀ x (v : TangentSpace I x),
      -(b/s) * (S.base.metric s).inner x v v ≤ S.ricciAt s x (vec2 v v))
    (p : M) (R : ℝ) (P : Set M) (hP : MeasurableSet P)
    (hIn : ∀ x ∈ P, (riemannianEDistOf (S.base.metric τ) p x).toReal ≤ R) :
    let g := S.base.metric
    let χ := terminalBallCutoff (g τ) p R
    let μ := fun s => riemannianVolumeMeasure I M (g s)
    let B := {x | (riemannianEDistOf (g τ) p x).toReal < R+1}
    (∀ s ∈ Ioo 0 τ, Real.sqrt (∫ x, testedEulerCurvatureNorm (g s) x ^ 2 ∂(μ s)) ≤ A) →
    IntervalIntegrable (fun s => ∫ x, testedEulerRicciDerivativeNorm (g s) x ^ 2 ∂(μ s)) volume 0 τ →
    (∫ s in (0 : ℝ)..τ, ∫ x, testedEulerRicciDerivativeNorm (g s) x ^ 2 ∂(μ s)) ≤ L^2 →
    ε^2 ≤ (∫ x in P, intrinsicCurvatureSq (g 0) x ∂(μ 0)) →
    ε^2/2 - (∫ x, χ x * intrinsicWeylScalarCharge (g 0) x ∂(μ 0)) -
      2*(144*A*L)*Real.sqrt (τ/(1-2*b)) ≤ ∫ x in B, intrinsicTraceFreeRicciSq (g τ) x ∂(μ τ) := by
  intro g χ μ B hU hInt hBudget hFull
  obtain ⟨h01,hOne,hZero,hLip⟩ := terminalBallCutoff_properties (g τ) p R
  have hlip : ∀ x y, edist (χ x) (χ y) ≤ (1 : ℝ≥0∞) * riemannianEDistOf (g τ) x y := by
    simpa only [one_mul] using hLip
  have hχc : Continuous χ := metricLipschitzCutoff_continuous (g τ) (L := 1) (by simpa using hlip)
  have hdist : Continuous (fun x => (riemannianEDistOf (g τ) p x).toReal) :=
    metricLipschitzCutoff_continuous (g τ) (L := 1) (by simpa using riemannianDistance_toReal_lipschitz (g τ) p)
  have hB : MeasurableSet B := (isOpen_lt hdist continuous_const).measurableSet
  have hTransport := ricciFlow_terminalLipschitzEuler_transport S hS o hτ hb hA hL hCarrier hRegular hRic χ 1
    (by simpa using hlip) hU hInt hBudget
  have h := intrinsicTerminalRicci_lower_of_testedEuler o (g 0) (g τ) χ hχc h01 hP hB (fun x hx => hOne x (hIn x hx))
    (fun x hx => hZero x (le_of_not_gt hx)) hFull (by simpa only [NNReal.coe_one, mul_one] using hTransport)
  simpa only [mul_assoc] using h

end SmoothPoincare
