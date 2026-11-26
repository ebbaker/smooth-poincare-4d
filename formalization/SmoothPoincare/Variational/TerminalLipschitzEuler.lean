import SmoothPoincare.Variational.TestedEulerTransport
import SmoothPoincare.Variational.TerminalMetricPowerBound
import SmoothPoincare.Variational.LipschitzEulerFlux
import Mathlib.MeasureTheory.Integral.IntervalIntegral.DistLEIntegral

/-! # Quantitative Euler transport with the original terminal Lipschitz test -/

open Bundle DifferentialGeometry DifferentialGeometry.Geometry.Curvature
  DifferentialGeometry.Integral.DivergenceTheorem DifferentialGeometry.Integral.Measure
  DifferentialGeometry.PDE.RicciFlow DifferentialGeometry.Tensor0SBundle FirstOrderTwistor MeasureTheory Set
open scoped ContDiff Manifold Topology

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

open scoped ENNReal NNReal

/-- Use the one terminal Lipschitz cutoff throughout the interval. Its cost at
earlier times is derived from the actual Ricci lower form bound. The endpoints
use their own carrier metrics. The Riemann and differentiated Ricci budgets
use the volume of each regular slice. -/
theorem ricciFlow_terminalLipschitzEuler_transport
    (S : SolutionOn (I := I) (M := M) D) (hS : IsSolutionOn S) (o : ManifoldOrientation I M 4)
    {τ b A L : ℝ} (hτ : 0 < τ) (hb : b < 1/2) (hA : 0 ≤ A) (hL : 0 ≤ L)
    (hCarrier : Icc 0 τ ⊆ D.carrier) (hRegular : Ioo 0 τ ⊆ D.regular)
    (hRic : ∀ s ∈ Ioo 0 τ, ∀ x (v : TangentSpace I x),
      -(b/s) * (S.base.metric s).inner x v v ≤ S.ricciAt s x (vec2 v v))
    (χ : M → ℝ) (δ : ℝ≥0)
    (hχ : ∀ x y, edist (χ x) (χ y) ≤ (δ : ℝ≥0∞) * riemannianEDistOf (S.base.metric τ) x y) :
    let g := S.base.metric
    let m := fun s => testedEulerMoment (g s) χ
    let μ := fun s => riemannianVolumeMeasure I M (g s)
    let U := fun s => testedEulerCurvatureNorm (g s)
    let N := fun s => testedEulerRicciDerivativeNorm (g s)
    (∀ s ∈ Ioo 0 τ, Real.sqrt (∫ x, U s x ^ 2 ∂(μ s)) ≤ A) →
    IntervalIntegrable (fun s => ∫ x, N s x ^ 2 ∂(μ s)) volume 0 τ →
    (∫ s in (0 : ℝ)..τ, ∫ x, N s x ^ 2 ∂(μ s)) ≤ L^2 →
    |m τ - m 0| ≤ (144 * (δ : ℝ) * A * L) * Real.sqrt (τ / (1 - 2*b)) := by
  intro g m μ U N hU hNInt hBudget
  let ν := volume.restrict (Ioc (0 : ℝ) τ)
  let a := fun s => Real.sqrt (∫ x, N s x ^ 2 ∂(μ s))
  let w := fun s : ℝ => Real.sqrt (τ^(2*b) * s^(-(2*b)))
  let K := 144 * (δ : ℝ) * A
  have hInt : Integrable (fun s => ∫ x, N s x ^ 2 ∂(μ s)) ν :=
    (intervalIntegrable_iff_integrableOn_Ioc_of_le hτ.le).1 hNInt
  have sq_a (s : ℝ) : a s ^ 2 = ∫ x, N s x ^ 2 ∂(μ s) := Real.sq_sqrt (integral_nonneg fun _ => sq_nonneg _)
  have hma : AEStronglyMeasurable a ν := Real.continuous_sqrt.comp_aestronglyMeasurable hInt.aestronglyMeasurable
  have ha : MemLp a 2 ν := (memLp_two_iff_integrable_sq hma).2 (by simpa only [sq_a] using hInt)
  have ws : (fun s => (w s)^2) =ᵐ[ν] (fun s : ℝ => τ^(2*b) * s^(-(2*b))) := by
    filter_upwards [ae_restrict_mem (μ := volume) measurableSet_Ioc] with s hs
    exact Real.sq_sqrt (mul_nonneg (Real.rpow_nonneg hτ.le _) (Real.rpow_nonneg hs.1.le _))
  have hi := (intervalIntegrable_iff_integrableOn_Ioc_of_le hτ.le).1
    (intervalIntegral.intervalIntegrable_rpow' (by linarith : -1 < -(2*b)))
  have hw : MemLp w 2 ν := (memLp_two_iff_integrable_sq (by dsimp [w]; fun_prop)).2
    ((hi.const_mul (τ^(2*b))).congr ws.symm)
  have hprod : IntervalIntegrable (fun s => K * (w s * a s)) volume 0 τ :=
    (intervalIntegrable_iff_integrableOn_Ioc_of_le hτ.le).2 ((hw.integrable_mul ha).const_mul _)
  have hχc := metricLipschitzCutoff_continuous (g τ) hχ
  have hm := (ricciFlow_testedEulerMoment_continuousOn_carrier S hS χ hχc).mono hCarrier
  have hd (s : ℝ) (hs : s ∈ Ioo 0 τ) : HasDerivAt m
      (∫ x, χ x * divergenceG (g s) (ricciFlowEulerCurrent S s) x ∂(μ s)) s :=
    ricciFlow_testedEuler_hasDerivAt S hS o χ hχc ⟨s,hRegular hs⟩
  have hpoint (s : ℝ) (hs : s ∈ Ioo 0 τ) : ‖deriv m s‖ ≤ K * (w s * a s) := by
    let weight : ℝ≥0 := ⟨w s, Real.sqrt_nonneg _⟩
    let ell : ℝ≥0 := δ * weight
    have hsχ (x y : M) : edist (χ x) (χ y) ≤ (ell : ℝ≥0∞) * riemannianEDistOf (g s) x y := by
      calc
        _ ≤ (δ : ℝ≥0∞) * riemannianEDistOf (g τ) x y := hχ x y
        _ ≤ (δ : ℝ≥0∞) * (ENNReal.ofReal (w s) * riemannianEDistOf (g s) x y) :=
          mul_le_mul_right (ricciFlow_terminalDistance_power_bound S hS hCarrier hRegular hRic hs x y) _
        _ = _ := by
          rw [← mul_assoc]
          have hwe : ENNReal.ofReal (w s) = (weight : ℝ≥0∞) :=
            @ENNReal.ofReal_coe_nnreal weight
          rw [hwe]
          rfl
    let : IsFiniteMeasureOnCompacts (μ s) := riemannianVolumeMeasure_isFiniteMeasureOnCompacts (g s)
    have hcu : Continuous (U s) := (normSq0S_cont (g s) (metricRm04 (g s))).sqrt
    have hcn : Continuous (N s) := (normSq0S_cont (g s) (metricNablaRic (g s))).sqrt
    rw [(hd s hs).deriv, Real.norm_eq_abs]
    refine (lipschitzEulerSpatialFlux_integral_bound_of_pointwise (g s) (ricciFlowEulerCurrent S s)
      χ hsχ (U s) (N s) (by norm_num : 0 ≤ (144:ℝ))
      (hcu.memLp_of_hasCompactSupport (HasCompactSupport.of_compactSpace _))
      (hcn.memLp_of_hasCompactSupport (HasCompactSupport.of_compactSpace _))
      (fun _ => Real.sqrt_nonneg _) (fun _ => Real.sqrt_nonneg _)
      (fun x => globalEulerCurrent_norm_le_testedEulerNorms (g s) x o
        (orientedOrthonormalFrameAt (g s) o x))).trans ?_
    calc
      _ ≤ (144 * (ell:ℝ)) * (A * a s) := mul_le_mul_of_nonneg_left
        (mul_le_mul_of_nonneg_right (hU s hs) (Real.sqrt_nonneg _)) (by positivity)
      _ = K * (w s * a s) := by change (144 * ((δ : ℝ) * w s)) * _ = _; dsimp only [K]; ring
  have hh := norm_sub_le_integral_of_norm_deriv_le_of_le hτ.le hm
    (fun s hs => (hd s hs).differentiableAt.differentiableWithinAt) (ae_of_all _ hpoint) hprod
  rw [Real.norm_eq_abs, intervalIntegral.integral_const_mul] at hh
  have h := modifiedEuler_transport_of_flux hτ hb (by dsimp [K]; positivity : 0 ≤ K) hL a ha
    (ae_of_all _ (fun _ => Real.sqrt_nonneg _)) (by simpa only [sq_a] using hBudget) hh
  rw [modifiedEuler_timeWeight hτ hb] at h
  exact h

end SmoothPoincare
