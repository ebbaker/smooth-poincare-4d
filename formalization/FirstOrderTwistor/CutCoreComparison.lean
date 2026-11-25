import FirstOrderTwistor.ComparisonFamily
import Mathlib.Tactic.Linarith

/-!
# Exterior energy from one embedded core

At fixed truncation, the complement of the physical source image has mass
equal to the total mass minus the captured mass. Exhausting the model after
the fixed-core comparison bounds the capped exterior with its splice error.
-/

open Filter MeasureTheory Set Topology

namespace FirstOrderTwistor

variable {X Y : Type*} [MeasurableSpace X] [MeasurableSpace Y]
  {source : ℕ → FiniteEnergyDensity X} {model : FiniteEnergyDensity Y}

namespace FixedTruncationComparison

variable {D : Type*} [MeasurableSpace D]

/-- At a fixed truncation, the eventual measurable embedding identifies the
physical complementary mass with the source total minus the image mass. -/
theorem eventually_complMass_eq_total_sub_imageMass
    (comparison : FixedTruncationComparison source model D) :
    ∀ᶠ i in atTop, (source i).toMeasure.real (range (comparison.toSource i))ᶜ =
      (source i).toMeasure.real univ - (source i).toMeasure.real (range (comparison.toSource i)) :=
  comparison.sourceTransport.mono fun _ hi ↦ measureReal_compl hi.1.measurableSet_range

/-- Along the source sequence at fixed truncation, the complementary mass
converges to the limiting total less the fixed model core mass. -/
theorem tendsto_complMass (comparison : FixedTruncationComparison source model D) {e : ℝ}
    (htotal : Tendsto (fun i ↦ (source i).toMeasure.real univ) atTop (𝓝 e)) :
    Tendsto (fun i ↦ (source i).toMeasure.real (range (comparison.toSource i))ᶜ) atTop
      (𝓝 (e - model.toMeasure.real (range comparison.toModel))) :=
  (htotal.sub comparison.tendsto_imageMass).congr'
    (comparison.eventually_complMass_eq_total_sub_imageMass.mono fun _ hi ↦ hi.symm)

end FixedTruncationComparison

/-- For every positive allowance, choose a sufficiently large fixed truncation,
then take the source index sufficiently large. The capped exterior costs at
most the limiting total less the model energy plus the allowance. -/
theorem eventually_cappedExteriorEnergy_le_of_coreComparisons
    {D : ℕ → Type*} [∀ L, MeasurableSpace (D L)]
    (comparison : (L : ℕ) → FixedTruncationComparison source model (D L))
    (hincreasing : Monotone (fun L ↦ range (comparison L).toModel))
    (hexhausts : (⋃ L, range (comparison L).toModel) =ᵐ[model.toMeasure] univ)
    {e : ℝ} (htotal : Tendsto (fun i ↦ (source i).toMeasure.real univ) atTop (𝓝 e))
    {exteriorEnergy spliceError : ℕ → ℕ → ℝ}
    (hcap : ∀ᶠ L in atTop, ∀ᶠ i in atTop,
      exteriorEnergy L i ≤ (source i).toMeasure.real (range ((comparison L).toSource i))ᶜ +
        spliceError L i)
    (hsplice : ∀ ε : ℝ, 0 < ε →
      ∀ᶠ L in atTop, ∀ᶠ i in atTop, spliceError L i ≤ ε) :
    ∀ ε : ℝ, 0 < ε → ∀ᶠ L in atTop, ∀ᶠ i in atTop,
      exteriorEnergy L i ≤ e - model.toMeasure.real univ + ε := by
  intro ε hε
  have hmodel : Tendsto (fun L ↦ model.toMeasure.real (range (comparison L).toModel)) atTop
      (𝓝 (model.toMeasure.real univ)) := by
    rw [← measureReal_congr hexhausts]
    exact (ENNReal.tendsto_toReal (measure_ne_top _ _)).comp
      (tendsto_measure_iUnion_atTop hincreasing)
  have hmodelLower := hmodel.eventually_const_lt (sub_lt_self _ (half_pos hε))
  filter_upwards [hmodelLower, hcap, hsplice _ (half_pos hε)] with L hcore hcapL hspliceL
  have hclearance : e - model.toMeasure.real (range (comparison L).toModel) <
      e - model.toMeasure.real univ + ε / 2 := by linarith only [hcore]
  have hcomplUpper := ((comparison L).tendsto_complMass htotal).eventually_lt_const hclearance
  filter_upwards [hcomplUpper, hcapL, hspliceL] with i hcompl hcapLi hspliceLi
  linarith only [hcompl, hcapLi, hspliceLi]

end FirstOrderTwistor
