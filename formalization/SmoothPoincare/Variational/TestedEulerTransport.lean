import SmoothPoincare.Variational.GlobalEulerCurrent
import SmoothPoincare.Variational.IntrinsicEulerDensity
import SmoothPoincare.Variational.TestedEulerTransgression
import DifferentialGeometry.Analysis.Integration.Measure.Family.CompactSupportContinuity
import DifferentialGeometry.Geometry.Flow.RicciFlow.Solution.ChartGramContinuity
import Mathlib.Analysis.Calculus.FDeriv.Measurable

/-! # Finite localized Euler transport on the supplied modified flow -/

open DifferentialGeometry DifferentialGeometry.Geometry.Curvature
open DifferentialGeometry.Geometry.Operator DifferentialGeometry.Integral.Measure
open DifferentialGeometry.Integral.DivergenceTheorem
open DifferentialGeometry.PDE.RicciFlow DifferentialGeometry.Tensor.Coordinates
open DifferentialGeometry.Tensor0SBundle FirstOrderTwistor MeasureTheory Set
open scoped ContDiff Manifold Topology

noncomputable section
namespace SmoothPoincare

variable {E H M : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  [BoundarylessManifold I M] [CompactSpace M]
  {D : RealTimeInterval}

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩
private local instance : CompleteSpace E := FiniteDimensional.complete ℝ E
private local instance : IsManifold I 1 M := IsManifold.of_le (by decide : (1 : WithTop ℕ∞) ≤ ∞)

/-- The full ordered tensor norm on the actual metric slice. -/
def testedEulerCurvatureNorm (g : SmoothRiemannianMetric I M) (x : M) : ℝ :=
  Real.sqrt (normSq0S g x 4 (metricRm04 g x))

/-- The ordered first-derivative Ricci tensor norm on the same slice. -/
def testedEulerRicciDerivativeNorm (g : SmoothRiemannianMetric I M) (x : M) : ℝ :=
  Real.sqrt (normSq0S g x 3 (metricNablaRic g x))

/-- The stationary-cutoff moment uses both the curvature and volume of
the metric at the integration time. -/
def testedEulerMoment (g : SmoothRiemannianMetric I M) (χ : M → ℝ) : ℝ :=
  ∫ x, χ x * intrinsicEulerDensity g x ∂riemannianVolumeMeasure I M g

omit [I.Boundaryless] [CompactSpace M] in
private theorem testedEulerCurvatureNorm_eq_frame (g : SmoothRiemannianMetric I M)
    (x : M) (o : ManifoldOrientation I M 4) (f : OrientedOrthonormalFrameAt g o x) :
    testedEulerCurvatureNorm g x =
      Real.sqrt (frameTensorNormSq (metricCurvatureFrameTensor g o x f)) := by
  rw [testedEulerCurvatureNorm, metricRm04_apply, normSq0S_rm04_eq_frameTensorNormSq g o x f]

omit [I.Boundaryless] [BoundarylessManifold I M] [CompactSpace M] in
private theorem testedEulerRicciDerivativeNorm_eq_frame (g : SmoothRiemannianMetric I M)
    (x : M) (o : ManifoldOrientation I M 4) (f : OrientedOrthonormalFrameAt g o x) :
    testedEulerRicciDerivativeNorm g x = Real.sqrt
      (∑ a : Fin 4, ∑ j : Fin 4, ∑ b : Fin 4,
        (metricNablaRic g x (vec3 (f.basis a) (f.basis j) (f.basis b))) ^ 2) := by
  unfold testedEulerRicciDerivativeNorm
  congr 1
  rw [normSq0S_identity_eq_sum_sq _ _ _ _
    (metricInverseInBasis_identity_of_orthonormal g f.basis f.orthonormal),
    sum_fin_succ_fun 2]
  simp_rw [sum_fin_two_fun]
  refine Finset.sum_congr rfl fun a _ => Finset.sum_congr rfl fun j _ =>
    Finset.sum_congr rfl fun b _ => ?_
  rw [component0S_apply]
  congr 2
  funext i
  fin_cases i <;> rfl

omit [I.Boundaryless] [CompactSpace M] in
/-- The normalized global current's pointwise bound has dimension-only
constant 144 in the intrinsic ordered norms. -/
theorem globalEulerCurrent_norm_le_testedEulerNorms (g : SmoothRiemannianMetric I M)
    (x : M) (o : ManifoldOrientation I M 4) (f : OrientedOrthonormalFrameAt g o x) :
    Real.sqrt (g.inner x (globalEulerCurrent g x) (globalEulerCurrent g x)) ≤
      144 * (testedEulerCurvatureNorm g x * testedEulerRicciDerivativeNorm g x) := by
  rw [testedEulerCurvatureNorm_eq_frame g x o f, testedEulerRicciDerivativeNorm_eq_frame g x o f]
  exact globalEulerCurrent_norm_le g x o f

omit [I.Boundaryless] [BoundarylessManifold I M] in
/-- The tested Euler moment is continuous on the full time carrier,
including any supplied endpoint slices. -/
theorem ricciFlow_testedEulerMoment_continuousOn_carrier
    (S : SolutionOn (I := I) (M := M) D) (hS : IsSolutionOn S)
    (χ : M → ℝ) (hχ : Continuous χ) :
    ContinuousOn (fun s => testedEulerMoment (S.family.metric s) χ) D.carrier := by
  apply continuousOn_integral_riemannianVolumeMeasure_of_compact_support
    S.family.metric (S.continuousOn_chartGram hS) (K := univ) (hK := isCompact_univ)
  · exact (hχ.comp continuous_snd).continuousOn.mul (intrinsicEulerDensity_continuousOn_carrier S hS)
  · simp

/-- Finite transport of the actual normalized tested Euler density. Only the
regular-time derivative, the scale-dependent gradient control, and the
curvature and Ricci-derivative budgets enter. Endpoint continuity and
measurability of the spatial flux follow in the proof. -/
theorem ricciFlow_testedEuler_transport_of_derivative
    (S : SolutionOn (I := I) (M := M) D) (hS : IsSolutionOn S)
    (o : ManifoldOrientation I M 4)
    (χ : C^∞⟮I, M; ℝ⟯) {τ b δ A L : ℝ}
    (hτ : 0 < τ) (hb : b < 1 / 2) (hδ : 0 ≤ δ) (hA : 0 ≤ A) (hL : 0 ≤ L)
    (hCarrier : Icc 0 τ ⊆ D.carrier) :
    let g := S.family.metric
    let m := fun s => testedEulerMoment (g s) χ
    let μ := fun s => riemannianVolumeMeasure I M (g s)
    let U := fun s => testedEulerCurvatureNorm (g s)
    let N := fun s => testedEulerRicciDerivativeNorm (g s)
    let w := fun s => Real.sqrt (τ ^ (2*b) * s ^ (-(2*b)))
    (∀ s ∈ Ioo 0 τ, HasDerivAt m
      (∫ x, χ x * divergenceG (g s) (ricciFlowEulerCurrent S s) x ∂(μ s)) s) →
    (∀ s ∈ Ioo 0 τ, ∀ x,
      Real.sqrt ((g s).inner x (gradG (g s) χ x) (gradG (g s) χ x)) ≤ δ * w s) →
    (∀ s ∈ Ioo 0 τ, Real.sqrt (∫ x, U s x ^ 2 ∂(μ s)) ≤ A) →
    IntervalIntegrable (fun s => ∫ x, N s x ^ 2 ∂(μ s)) volume 0 τ →
    (∫ s in (0 : ℝ)..τ, ∫ x, N s x ^ 2 ∂(μ s)) ≤ L^2 →
    |m τ - m 0| ≤ (144 * δ * A * L) * Real.sqrt (τ / (1 - 2*b)) := by
  intro g m μ U N w hDeriv hGrad hU hNInt hBudget
  let ν := volume.restrict (Ioc (0 : ℝ) τ)
  let a := fun s => Real.sqrt (∫ x, N s x ^ 2 ∂(μ s))
  let flux := fun s => ∫ x, χ x * divergenceG (g s) (ricciFlowEulerCurrent S s) x ∂(μ s)
  have hInt : Integrable (fun s => ∫ x, N s x ^ 2 ∂(μ s)) ν :=
    (intervalIntegrable_iff_integrableOn_Ioc_of_le hτ.le).1 hNInt
  have hMeasA : AEStronglyMeasurable a ν :=
    Real.continuous_sqrt.comp_aestronglyMeasurable hInt.aestronglyMeasurable
  have sq_a (s : ℝ) : a s ^ 2 = ∫ x, N s x ^ 2 ∂(μ s) :=
    Real.sq_sqrt (integral_nonneg fun _ => sq_nonneg _)
  have ha : MemLp a 2 ν := (memLp_two_iff_integrable_sq hMeasA).2 (by simpa only [sq_a] using hInt)
  have hBudget' : (∫ s in (0 : ℝ)..τ, (a s)^2) ≤ L^2 := by
    simpa only [sq_a] using hBudget
  have hm : ContinuousOn m (Icc 0 τ) :=
    (ricciFlow_testedEulerMoment_continuousOn_carrier S hS χ χ.contMDiff.continuous).mono hCarrier
  have hmem : ∀ᵐ s ∂ν, s ∈ Ioo 0 τ := by
    rw [show ν = volume.restrict (Ioo 0 τ) from restrict_Ioo_eq_restrict_Ioc.symm]
    exact ae_restrict_mem measurableSet_Ioo
  have hMeasFlux : AEStronglyMeasurable flux ν := by
    apply (measurable_deriv m).aestronglyMeasurable.congr
    filter_upwards [hmem] with s hs
    exact (hDeriv s hs).deriv
  have hLp (s : ℝ) : MemLp (U s) 2 (μ s) ∧ MemLp (N s) 2 (μ s) := by
    let : IsFiniteMeasureOnCompacts (μ s) := riemannianVolumeMeasure_isFiniteMeasureOnCompacts (g s)
    have hcU : Continuous (U s) := (normSq0S_cont (g s) (metricRm04 (g s))).sqrt
    have hcN : Continuous (N s) := (normSq0S_cont (g s) (metricNablaRic (g s))).sqrt
    exact ⟨hcU.memLp_of_hasCompactSupport (HasCompactSupport.of_compactSpace _),
      hcN.memLp_of_hasCompactSupport (HasCompactSupport.of_compactSpace _)⟩
  exact modifiedEuler_transport_of_spatialFlux g χ (ricciFlowEulerCurrent S) m U N
    hτ hb (by norm_num : (0 : ℝ) ≤ 144) hδ hA hL hm hMeasFlux hDeriv
    (fun s _ => hLp s) (fun _ _ _ => ⟨Real.sqrt_nonneg _, Real.sqrt_nonneg _⟩)
    (fun s _ x => globalEulerCurrent_norm_le_testedEulerNorms (g s) x o
      (orientedOrthonormalFrameAt (g s) o x))
    hGrad hU ha hBudget'

/-- Finite modified-flow Euler transport with the actual global current.
The time endpoints lie in the solution carrier and only interior times
need its Ricci-flow evolution. The cutoff is one fixed smooth function. -/
theorem ricciFlow_testedEuler_transport
    (S : SolutionOn (I := I) (M := M) D) (hS : IsSolutionOn S)
    (o : ManifoldOrientation I M 4) (χ : C^∞⟮I, M; ℝ⟯) {τ b δ A L : ℝ}
    (hτ : 0 < τ) (hb : b < 1 / 2) (hδ : 0 ≤ δ) (hA : 0 ≤ A) (hL : 0 ≤ L)
    (hCarrier : Icc 0 τ ⊆ D.carrier) (hRegular : Ioo 0 τ ⊆ D.regular) :
    let g := S.family.metric
    let m := fun s => testedEulerMoment (g s) χ
    let μ := fun s => riemannianVolumeMeasure I M (g s)
    let U := fun s => testedEulerCurvatureNorm (g s)
    let N := fun s => testedEulerRicciDerivativeNorm (g s)
    let w := fun s => Real.sqrt (τ ^ (2*b) * s ^ (-(2*b)))
    (∀ s ∈ Ioo 0 τ, ∀ x,
      Real.sqrt ((g s).inner x (gradG (g s) χ x) (gradG (g s) χ x)) ≤ δ * w s) →
    (∀ s ∈ Ioo 0 τ, Real.sqrt (∫ x, U s x ^ 2 ∂(μ s)) ≤ A) →
    IntervalIntegrable (fun s => ∫ x, N s x ^ 2 ∂(μ s)) volume 0 τ →
    (∫ s in (0 : ℝ)..τ, ∫ x, N s x ^ 2 ∂(μ s)) ≤ L^2 →
    |m τ - m 0| ≤ (144 * δ * A * L) * Real.sqrt (τ / (1 - 2*b)) := by
  intro g m μ U N w hGrad hU hNInt hBudget
  exact ricciFlow_testedEuler_transport_of_derivative S hS o χ hτ hb hδ hA hL hCarrier
    (fun s hs => ricciFlow_testedEuler_hasDerivAt S hS o χ χ.contMDiff.continuous ⟨s, hRegular hs⟩)
    hGrad hU hNInt hBudget

omit [I.Boundaryless] in
/-- Identify the integrated intrinsic test with the independently measured
cutoff charges on this same slice. -/
theorem testedEulerMoment_eq_modifiedEulerMoment
    (g : SmoothRiemannianMetric I M) (χ : M → ℝ) (o : ManifoldOrientation I M 4)
    (f : ∀ x, OrientedOrthonormalFrameAt g o x) :
    let μ := riemannianVolumeMeasure I M g
    let w := fun c x => χ x * modifiedChargeDensity o g f c x
    (∀ c, Integrable (w c) μ) →
    testedEulerMoment g χ = modifiedEulerMoment (fun c => ∫ x, w c x ∂μ) := by
  intro μ w hw
  have hpoint (x : M) :
      χ x * intrinsicEulerDensity g x = w .plus x + w .minus x + w .scalar x / 24 - w .ricci x / 2 := by
    rw [intrinsicEulerDensity_eq_modifiedChargeDensity g o f x]
    dsimp only [w]
    ring
  unfold testedEulerMoment modifiedEulerMoment
  change (∫ x, χ x * intrinsicEulerDensity g x ∂μ) = _
  have hSub := integral_sub (((hw .plus).add (hw .minus)).add ((hw .scalar).div_const 24))
    ((hw .ricci).div_const 2)
  have hAdd := integral_add ((hw .plus).add (hw .minus)) ((hw .scalar).div_const 24)
  simp only [Pi.add_apply] at hSub hAdd
  rw [integral_congr_ae (ae_of_all _ hpoint), hSub, hAdd,
    integral_add (hw .plus) (hw .minus), integral_div, integral_div]

omit [I.Boundaryless] in
/-- Apply the intrinsic common-cutoff transport bound to the terminal
trace-free Ricci charge, with each actual endpoint's own physical volume. -/
theorem modifiedTerminalRicci_lower_of_testedEulerMomentTransport
    (o : ManifoldOrientation I M 4) (g₀ gτ : SmoothRiemannianMetric I M)
    (f₀ : ∀ x, OrientedOrthonormalFrameAt g₀ o x) (fτ : ∀ x, OrientedOrthonormalFrameAt gτ o x)
    (χ : M → ℝ) {P B : Set M} (hP : MeasurableSet P) (hB : MeasurableSet B)
    (hχ : ∀ x, χ x ∈ Icc (0 : ℝ) 1) (hOne : ∀ x ∈ P, χ x = 1)
    (hZero : ∀ x ∉ B, χ x = 0) {τ b K ε : ℝ} (hτ : 0 < τ) (hb : b < 1 / 2) :
    let μ := riemannianVolumeMeasure I M g₀
    let ν := riemannianVolumeMeasure I M gτ
    let u := modifiedChargeDensity o g₀ f₀
    let v := modifiedChargeDensity o gτ fτ
    let m := fun c => ∫ x, χ x * u c x ∂μ
    Integrable (u .full) μ → Integrable (v .ricci) ν →
    (∀ c, Integrable (fun x => χ x * u c x) μ) →
    (∀ c, Integrable (fun x => χ x * v c x) ν) →
    ε ^ 2 ≤ (∫ x in P, u .full x ∂μ) →
    |testedEulerMoment gτ χ - testedEulerMoment g₀ χ| ≤ K * Real.sqrt (τ / (1 - 2*b)) →
    ε ^ 2 / 2 - 4 * (m .plus + m .minus) - m .scalar / 6 -
      2 * K * Real.sqrt (τ / (1 - 2*b)) ≤ ∫ x in B, v .ricci x ∂ν := by
  intro μ ν u v m hU hV hW₀ hWτ hCharge hTransport
  refine modifiedTerminalRicci_lower_of_eulerTransport_of_measurableCharges
    o g₀ gτ f₀ fτ χ hP hB hχ hOne hZero hτ hb hU (hW₀ .full) hV (hWτ .ricci)
    (fun c => (hW₀ c).aestronglyMeasurable) hCharge ?_
  rw [← testedEulerMoment_eq_modifiedEulerMoment gτ χ o fτ hWτ,
    ← testedEulerMoment_eq_modifiedEulerMoment g₀ χ o f₀ hW₀, modifiedEuler_timeWeight hτ hb]
  exact hTransport

end SmoothPoincare
