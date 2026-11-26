import SmoothPoincare.Variational.SignedCollarRepair
import Mathlib.Analysis.SpecialFunctions.Integrals.Basic

/-! # A terminal trace-free Ricci charge tested in the modified metric -/

open DifferentialGeometry DifferentialGeometry.Integral.Measure FirstOrderTwistor
open DifferentialGeometry.Geometry.Curvature MeasureTheory SectionsAndConnections Set
open scoped Manifold ContDiff

namespace SmoothPoincare

/-- The squared cutoff-gradient weight integrated from zero up to the actual
terminal time. The exponent condition is strict at the improper endpoint. -/
theorem modifiedEuler_timeWeight {τ b : ℝ} (hτ : 0 < τ) (hb : b < 1 / 2) :
    (∫ s in (0 : ℝ)..τ, τ ^ (2*b) * s ^ (-(2*b))) = τ / (1 - 2*b) := by
  rw [intervalIntegral.integral_const_mul, integral_rpow (Or.inl (by linarith)),
    Real.zero_rpow (by linarith : -(2*b) + 1 ≠ 0), sub_zero, ← mul_div_assoc,
    ← Real.rpow_add hτ]
  ring_nf
  simp [mul_comm]

/-- Time Cauchy--Schwarz after the spatial transgression estimate. Only a
finite square integral of the remaining time factor is required. -/
theorem modifiedEuler_weightedTimeBound {τ b : ℝ} (hτ : 0 < τ) (hb : b < 1/2)
    (a : ℝ → ℝ) (ha : MemLp a 2 (volume.restrict (Ioc 0 τ)))
    (hn : 0 ≤ᵐ[volume.restrict (Ioc 0 τ)] a) :
    (∫ s in (0 : ℝ)..τ, Real.sqrt (τ^(2*b) * s^(-(2*b))) * a s) ≤
      Real.sqrt (τ / (1-2*b)) * Real.sqrt (∫ s in (0 : ℝ)..τ, (a s)^2) := by
  let μ := volume.restrict (Ioc 0 τ)
  let w := fun s : ℝ => Real.sqrt (τ^(2*b) * s^(-(2*b)))
  have ws : (fun s => (w s)^2) =ᵐ[μ] (fun s : ℝ => τ^(2*b) * s^(-(2*b))) := by
    filter_upwards [ae_restrict_mem (μ := volume) measurableSet_Ioc] with s hs
    exact Real.sq_sqrt (mul_nonneg (Real.rpow_nonneg hτ.le _) (Real.rpow_nonneg hs.1.le _))
  have hi := (intervalIntegrable_iff_integrableOn_Ioc_of_le hτ.le).1
    (intervalIntegral.intervalIntegrable_rpow' (by linarith : -1 < -(2*b)))
  have hw : MemLp w 2 μ := (memLp_two_iff_integrable_sq (by dsimp [w]; fun_prop)).2
    ((hi.const_mul (τ^(2*b))).congr ws.symm)
  have h := integral_mul_le_Lp_mul_Lq_of_nonneg
    (by rw [Real.holderConjugate_iff]; norm_num : (2 : ℝ).HolderConjugate 2)
    (μ := μ) (Filter.Eventually.of_forall (fun s => Real.sqrt_nonneg _ ) : 0 ≤ᵐ[μ] w) hn
    (by simpa using hw) (by simpa [μ] using ha)
  have hs : (∫ s, (w s)^2 ∂μ) = τ / (1-2*b) := by
    rw [integral_congr_ae ws, ← modifiedEuler_timeWeight hτ hb, intervalIntegral.integral_of_le hτ.le]
  simp only [Real.rpow_two] at h
  rw [hs] at h
  simpa only [Real.sqrt_eq_rpow, one_div, intervalIntegral.integral_of_le hτ.le, μ, w] using h

/-- A spatial transgression controlled by a square-integrable flux yields
the explicit finite transport error for the common cutoff. -/
theorem modifiedEuler_transport_of_flux {τ b K L e₀ eτ : ℝ} (hτ : 0 < τ) (hb : b < 1/2)
    (hK : 0 ≤ K) (hL : 0 ≤ L) (a : ℝ → ℝ)
    (ha : MemLp a 2 (volume.restrict (Ioc 0 τ))) (hn : 0 ≤ᵐ[volume.restrict (Ioc 0 τ)] a)
    (hbudget : (∫ s in (0 : ℝ)..τ, (a s)^2) ≤ L^2)
    (hflux : |eτ - e₀| ≤ K * ∫ s in (0 : ℝ)..τ, Real.sqrt (τ^(2*b) * s^(-(2*b))) * a s) :
    |eτ - e₀| ≤ (K*L) * Real.sqrt (∫ s in (0 : ℝ)..τ, τ^(2*b) * s^(-(2*b))) := by
  rw [modifiedEuler_timeWeight hτ hb]
  have hx := modifiedEuler_weightedTimeBound hτ hb a ha hn
  have hsq := (Real.sqrt_le_sqrt hbudget).trans_eq (Real.sqrt_sq hL)
  calc
    _ ≤ K * _ := hflux
    _ ≤ K * (Real.sqrt (τ / (1-2*b)) * L) := mul_le_mul_of_nonneg_left
      (hx.trans (mul_le_mul_of_nonneg_left hsq (Real.sqrt_nonneg _))) hK
    _ = _ := by ring

/-- The same fixed test function equals one on the initial attaining set
and vanishes off the terminal comparison set. This estimate may be applied
with different slice volumes and different nonnegative curvature densities. -/
theorem modifiedCutoff_integral_sandwich {X : Type*} [MeasurableSpace X] (μ : Measure X)
    {A B : Set X} (hA : MeasurableSet A) (hB : MeasurableSet B)
    (χ d : X → ℝ) (hd : ∀ x, 0 ≤ d x) (hχ : ∀ x, χ x ∈ Icc (0 : ℝ) 1)
    (hone : ∀ x ∈ A, χ x = 1) (hzero : ∀ x ∉ B, χ x = 0)
    (hi : Integrable d μ) (hw : Integrable (fun x => χ x * d x) μ) :
    (∫ x in A, d x ∂μ) ≤ (∫ x, χ x * d x ∂μ) ∧
      (∫ x, χ x * d x ∂μ) ≤ ∫ x in B, d x ∂μ := by
  rw [← integral_indicator hA, ← integral_indicator hB]
  constructor
  · apply integral_mono (hi.indicator hA) hw
    intro x
    by_cases hx : x ∈ A
    · simp [hx, hone x hx]
    · simp [hx, mul_nonneg (hχ x).1 (hd x)]
  · apply integral_mono hw (hi.indicator hB)
    intro x
    by_cases hx : x ∈ B
    · simpa [hx] using mul_le_mul_of_nonneg_right (hχ x).2 (hd x)
    · simp [hx, hzero x hx]

section Slices

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  [CompactSpace M]

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

/-- Cutoff moments on a single slice of the modified flow. The full tensor,
both Weyl blocks, scalar curvature and trace-free Ricci tensor all use this
slice's metric, oriented frame and volume. -/
inductive ModifiedChargeComponent
  | full | plus | minus | scalar | ricci

noncomputable def modifiedChargeDensity (o : ManifoldOrientation I M 4)
    (g : SmoothRiemannianMetric I M) (frame : ∀ x, OrientedOrthonormalFrameAt g o x)
    (c : ModifiedChargeComponent) (x : M) : ℝ :=
  match c with
  | .full => frameTensorNormSq (metricCurvatureFrameTensor g o x (frame x))
  | .plus => hilbertSchmidtSq (geometricChiralBlock g o x (frame x))
  | .minus => hilbertSchmidtSq (endpointNegativeWeylBlock g o x (frame x))
  | .scalar => metricScalarAt g x ^ 2
  | .ricci => endpointRicciDefectDensity g o x (frame x)

omit [T2Space M] [CompactSpace M] in
theorem modifiedChargeDensity_nonneg (o : ManifoldOrientation I M 4)
    (g : SmoothRiemannianMetric I M) (frame : ∀ x, OrientedOrthonormalFrameAt g o x)
    (c : ModifiedChargeComponent) (x : M) : 0 ≤ modifiedChargeDensity o g frame c x := by
  cases c <;> simp only [modifiedChargeDensity, frameTensorNormSq, hilbertSchmidtSq,
    endpointRicciDefectDensity] <;> repeat' apply Finset.sum_nonneg; intro _ _
  all_goals positivity

/-- Euler form normalized with the Hilbert-Schmidt norm of each chiral block. -/
noncomputable def modifiedEulerMoment (m : ModifiedChargeComponent → ℝ) : ℝ :=
  m .plus + m .minus + m .scalar / 24 - m .ricci / 2

/-- A finite-time localized estimate. The input decomposition concerns the
initial tested tensor. The integrated transgression concerns these two tested
Euler forms. The conclusion measures trace-free Ricci on the whole terminal
supporting set, in the terminal volume. -/
theorem modifiedTerminalRicci_lower_of_eulerTransport
    (o : ManifoldOrientation I M 4) (g₀ gτ : SmoothRiemannianMetric I M)
    (f₀ : ∀ x, OrientedOrthonormalFrameAt g₀ o x) (fτ : ∀ x, OrientedOrthonormalFrameAt gτ o x)
    (χ : M → ℝ) {A B : Set M} (hA : MeasurableSet A) (hB : MeasurableSet B)
    (hχ : ∀ x, χ x ∈ Icc (0 : ℝ) 1) (hOne : ∀ x ∈ A, χ x = 1)
    (hZero : ∀ x ∉ B, χ x = 0) {τ b C ε : ℝ} (hτ : 0 < τ) (hb : b < 1/2) :
    let u := modifiedChargeDensity o g₀ f₀
    let v := modifiedChargeDensity o gτ fτ
    let μ := riemannianVolumeMeasure I M g₀
    let ν := riemannianVolumeMeasure I M gτ
    let m := fun c => ∫ x, χ x * u c x ∂μ
    let n := fun c => ∫ x, χ x * v c x ∂ν
    Integrable (u .full) μ → Integrable (fun x => χ x * u .full x) μ →
    Integrable (v .ricci) ν → Integrable (fun x => χ x * v .ricci x) ν →
    ε ^ 2 ≤ (∫ x in A, u .full x ∂μ) →
    m .full = 4 * (m .plus + m .minus) + 2 * m .ricci + m .scalar / 6 →
    |modifiedEulerMoment n - modifiedEulerMoment m| ≤
      C * Real.sqrt (∫ s in (0 : ℝ)..τ, τ ^ (2*b) * s ^ (-(2*b))) →
    ε ^ 2 / 2 - 4 * (m .plus + m .minus) - m .scalar / 6 -
      2 * C * Real.sqrt (τ / (1 - 2*b)) ≤ ∫ x in B, v .ricci x ∂ν := by
  intro u v μ ν m n hu hwu hv hwv hcharge hdecomp htrans
  have hfull := hcharge.trans (modifiedCutoff_integral_sandwich μ hA hB χ (u .full)
    (modifiedChargeDensity_nonneg o g₀ f₀ _) hχ hOne hZero hu hwu).1
  have hend := (modifiedCutoff_integral_sandwich ν hA hB χ (v .ricci)
    (modifiedChargeDensity_nonneg o gτ fτ _) hχ hOne hZero hv hwv).2
  have hpos (c) : 0 ≤ n c := integral_nonneg fun x =>
    mul_nonneg (hχ x).1 (modifiedChargeDensity_nonneg o gτ fτ c x)
  change ε ^ 2 ≤ m .full at hfull
  change n .ricci ≤ _ at hend
  rw [modifiedEuler_timeWeight hτ hb, abs_le] at htrans
  unfold modifiedEulerMoment at htrans
  linarith only [hfull, hdecomp, htrans.2, hpos .plus, hpos .minus, hpos .scalar, hend]

end Slices
end SmoothPoincare
