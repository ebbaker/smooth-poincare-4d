import DifferentialGeometry.Analysis.Integration.Measure.Riemannian.Properties
import SmoothPoincare.Heights.IntegratedSelection

/-! # Saturation at the lower induced Weyl threshold

Openness and continuity let the vanishing integrated deficit give equality
throughout the middle locus. This supplies the premise for a local Codazzi
obstruction.
-/

open DifferentialGeometry DifferentialGeometry.Integral.Measure
open FirstOrderTwistor MeasureTheory SectionsAndConnections Set
open scoped ContDiff Manifold

namespace SmoothPoincare

variable {E H M Ω : Type*}
  [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M] [SigmaCompactSpace M]
  [MeasurableSpace Ω]

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

variable (g : SmoothRiemannianMetric I M) (o : ManifoldOrientation I M 4)
  (frame : ∀ x, OrientedOrthonormalFrameAt g o x) (U : Set M) (detA : M → ℝ)
  (μ : Measure Ω) [IsProbabilityMeasure μ] (m : Ω → ℕ)

local notation "dV" => riemannianVolumeMeasure I M g
local notation "Wplus" => (fun x : M => geometricChiralBlock g o x (frame x))
local notation "weylSq" => (fun x : M => hilbertSchmidtSq (Wplus x))
local notation "sphereArea" => (8 * Real.pi ^ 2 / 3 : ℝ)
local notation "middleDeficit" => (fun x : M => weylSq x - (8/3 : ℝ) * detA x)

/-- Given the indexed identity and the count floor, energy at or below the
    lower threshold forces equality there and saturation on the entire
    nonempty open middle locus. -/
theorem indexedHeight_endpoint_saturation (hOpen : IsOpen U)
    (hWInt : Integrable weylSq dV) (hdetInt : IntegrableOn detA U dV)
    (hWeyl : ∀ x ∈ U, (8/3 : ℝ) * detA x ≤ weylSq x)
    (hContinuous : ContinuousOn middleDeficit U)
    (harea : (∫ u, (m u : ℝ) ∂μ) = (2 / sphereArea) * ∫ x in U, detA x ∂dV)
    (hmInt : Integrable (fun u => (m u : ℝ)) μ) (hfloor : ∀ᵐ u ∂μ, 2 ≤ m u)
    (hE : chiralFrameEnergy g Wplus ≤ 64 * Real.pi ^ 2 / 9) :
    chiralFrameEnergy g Wplus = 64 * Real.pi ^ 2 / 9 ∧
      (∫ x in Uᶜ, weylSq x ∂dV) = 0 ∧ (∫ x in U, detA x ∂dV) = sphereArea ∧
      U.Nonempty ∧ (∀ x ∈ U, weylSq x = (8/3 : ℝ) * detA x) ∧ (∀ᵐ u ∂μ, m u = 2) := by
  have hU := hOpen.measurableSet
  obtain ⟨hbudget, houtside, hdeficit, hcount⟩ :=
    indexedHeight_energy_split g o frame U detA μ m hU hWInt hdetInt hWeyl harea hmInt hfloor
  have hthreshold : (8/3 : ℝ) * sphereArea = 64 * Real.pi ^ 2 / 9 := by ring
  have hEeq : chiralFrameEnergy g Wplus = 64 * Real.pi ^ 2 / 9 := by
    linarith only [hthreshold, hbudget, hE, houtside, hdeficit, hcount]
  have houtsideZero : (∫ x in Uᶜ, weylSq x ∂dV) = 0 := by
    linarith only [hthreshold, hbudget, hEeq, houtside, hdeficit, hcount]
  have hdeficitZero : (∫ x in U, middleDeficit x ∂dV) = 0 := by
    linarith only [hthreshold, hbudget, hEeq, houtside, hdeficit, hcount]
  have hcountZero : (4/3 : ℝ) * sphereArea * ((∫ u, (m u : ℝ) ∂μ) - 2) = 0 := by
    linarith only [hthreshold, hbudget, hEeq, houtside, hdeficit, hcount]
  have hscale : 0 < (4/3 : ℝ) * sphereArea := by positivity
  have hmean : (∫ u, (m u : ℝ) ∂μ) = 2 :=
    sub_eq_zero.mp ((mul_eq_zero.mp hcountZero).resolve_left hscale.ne')
  have hmass : (∫ x in U, detA x ∂dV) = sphereArea := by
    rw [hmean] at harea
    field_simp [Real.pi_ne_zero] at harea
    linarith only [harea]
  have hnonempty : U.Nonempty := by
    by_contra! hempty
    have hareaPos : 0 < sphereArea := by positivity
    rw [hempty, setIntegral_empty] at hmass
    exact hareaPos.ne' hmass.symm
  have hdeficitInt : Integrable middleDeficit (Measure.restrict dV U) :=
    hWInt.integrableOn.sub (hdetInt.const_mul _)
  have hdeficitNonneg : 0 ≤ᵐ[Measure.restrict dV U] middleDeficit :=
    (ae_restrict_iff' hU).2 (ae_of_all _ fun x hx => sub_nonneg.mpr (hWeyl x hx))
  have hdeficitAE :=
    (integral_eq_zero_iff_of_nonneg_ae hdeficitNonneg hdeficitInt).mp hdeficitZero
  let : Measure.IsOpenPosMeasure dV := riemannianVolumeMeasure_isOpenPosMeasure g
  have hdeficitOn : EqOn middleDeficit (fun _ : M => (0 : ℝ)) U :=
    Measure.eqOn_open_of_ae_eq hdeficitAE hOpen hContinuous continuous_const.continuousOn
  refine ⟨hEeq, houtsideZero, hmass, hnonempty, fun x hx => sub_eq_zero.mp (hdeficitOn hx), ?_⟩
  have hcountInt : Integrable (fun u => (m u : ℝ) - 2) μ := hmInt.sub (integrable_const _)
  have hcountNonneg : ∀ᵐ u ∂μ, 0 ≤ (m u : ℝ) - 2 :=
    hfloor.mono fun u hu => sub_nonneg.mpr (by exact_mod_cast hu)
  have hcountIntegral : (∫ u, ((m u : ℝ) - 2) ∂μ) = 0 := by
    rw [integral_sub hmInt (integrable_const _)]
    simp [hmean]
  have hcountAE := (integral_eq_zero_iff_of_nonneg_ae hcountNonneg hcountInt).mp hcountIntegral
  filter_upwards [hcountAE] with u hu
  have hcast : (m u : ℝ) = 2 := sub_eq_zero.mp hu
  exact_mod_cast hcast

end SmoothPoincare
