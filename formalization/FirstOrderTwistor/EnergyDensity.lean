import Mathlib.MeasureTheory.Integral.Bochner.ContinuousLinearMap

/-!
# Energy measures on fixed comparison domains

The reference measure lives on the fixed truncation, which can be a measurable
subtype of a comparison component. The transported density contains both the
source energy density and the volume Jacobian relative to that reference.
-/

namespace FirstOrderTwistor

open Filter MeasureTheory Set Topology

variable {α β ι : Type*} [MeasurableSpace α] [MeasurableSpace β]

/-- The measure obtained by weighting volume with a real energy density. -/
noncomputable def energyMeasure (volume : Measure α) (density : α → ℝ) : Measure α :=
  volume.withDensity (fun x => ENNReal.ofReal (density x))

theorem isFiniteEnergyMeasure {volume : Measure α} {density : α → ℝ}
    (hDensity : Integrable density volume) : IsFiniteMeasure (energyMeasure volume density) :=
  isFiniteMeasure_withDensity_ofReal hDensity.hasFiniteIntegral

/-- Real mass on a measurable set equals the integral of its nonnegative density. -/
theorem energyMeasure_real_apply {volume : Measure α} {density : α → ℝ} {s : Set α}
    (hs : MeasurableSet s) (hDensity : IntegrableOn density s volume)
    (hNonneg : 0 ≤ᵐ[volume.restrict s] density) :
    (energyMeasure volume density).real s = ∫ x in s, density x ∂volume := by
  rw [measureReal_def, energyMeasure, withDensity_apply _ hs,
    ← ofReal_integral_eq_lintegral_ofReal hDensity hNonneg,
    ENNReal.toReal_ofReal (integral_nonneg_of_ae hNonneg)]

variable {φ : α → β} {sourceVolume : Measure β} {referenceVolume : Measure α}
  {density : β → ℝ} {jacobian : α → ℝ}

/-- An embedding transports image energy to the reference domain with its volume Jacobian. -/
theorem energyMeasure_real_range_of_embedding
    (hφ : MeasurableEmbedding φ)
    (hDensity : IntegrableOn density (range φ) sourceVolume)
    (hNonneg : 0 ≤ᵐ[sourceVolume.restrict (range φ)] density)
    (hJacobian : AEMeasurable jacobian referenceVolume)
    (hJacobianNonneg : 0 ≤ᵐ[referenceVolume] jacobian)
    (hVolume : sourceVolume.comap φ = energyMeasure referenceVolume jacobian) :
    (energyMeasure sourceVolume density).real (range φ) =
      ∫ x, jacobian x * density (φ x) ∂referenceVolume := by
  have hWeight : AEMeasurable (fun x => ENNReal.ofReal (jacobian x)) referenceVolume :=
    ENNReal.measurable_ofReal.comp_aemeasurable hJacobian
  rw [energyMeasure_real_apply hφ.measurableSet_range hDensity hNonneg,
    ← hφ.map_comap, hφ.integral_map, hVolume, energyMeasure,
    integral_withDensity_eq_integral_toReal_smul₀ hWeight
      (Eventually.of_forall fun _ => ENNReal.ofReal_lt_top) (fun x => density (φ x))]
  apply integral_congr_ae
  filter_upwards [hJacobianNonneg] with x hx
  rw [ENNReal.toReal_ofReal hx, smul_eq_mul]

/-- Integrability on the source image transfers to the Jacobian-weighted pullback. -/
theorem integrableDensityOfComparisonEmbedding
    (hφ : MeasurableEmbedding φ)
    (hDensity : IntegrableOn density (range φ) sourceVolume)
    (hJacobian : AEMeasurable jacobian referenceVolume)
    (hJacobianNonneg : 0 ≤ᵐ[referenceVolume] jacobian)
    (hVolume : sourceVolume.comap φ = energyMeasure referenceVolume jacobian) :
    Integrable (fun x => jacobian x * density (φ x)) referenceVolume := by
  have hComposition : Integrable (density ∘ φ) (sourceVolume.comap φ) := by
    rw [← hφ.integrable_map_iff, hφ.map_comap]
    exact hDensity
  rw [hVolume, energyMeasure] at hComposition
  have hWeighted := (integrable_withDensity_iff_integrable_smul₀'
    (ENNReal.measurable_ofReal.comp_aemeasurable hJacobian)
    (Eventually.of_forall fun _ => ENNReal.ofReal_lt_top)).mp hComposition
  apply hWeighted.congr
  filter_upwards [hJacobianNonneg] with x hx
  simp only [Function.comp_apply, ENNReal.toReal_ofReal hx, smul_eq_mul]

/-- Uniform convergence on a fixed finite-volume domain gives convergence of integrals. -/
theorem tendstoIntegralOfUniformDensity {volume : Measure α} [IsFiniteMeasure volume]
    {sourceFilter : Filter ι} {D : ι → α → ℝ} {d : α → ℝ}
    (hIntegrable : ∀ᶠ i in sourceFilter, Integrable (D i) volume)
    (hLimit : Integrable d volume) (hUniform : TendstoUniformly D d sourceFilter) :
    Tendsto (fun i => ∫ x, D i x ∂volume) sourceFilter (𝓝 (∫ x, d x ∂volume)) := by
  rw [Metric.tendsto_nhds]
  intro ε hε
  let cap := volume.real univ + 1
  have hCap : 0 < cap := add_pos_of_nonneg_of_pos measureReal_nonneg zero_lt_one
  have hTolerance : 0 < ε / cap := div_pos hε hCap
  filter_upwards [hIntegrable, Metric.tendstoUniformly_iff.mp hUniform _ hTolerance] with i hi hu
  rw [dist_eq_norm, ← integral_sub hi hLimit]
  calc
    _ ≤ ε / cap * volume.real univ := by
      apply norm_integral_le_of_norm_le_const
      exact Eventually.of_forall fun x => by
        simpa only [dist_eq_norm, norm_sub_rev] using (hu x).le
    _ < ε / cap * cap := mul_lt_mul_of_pos_left (lt_add_one _) hTolerance
    _ = ε := div_mul_cancel₀ ε hCap.ne'

/-- Image energies converge when their Jacobian-weighted densities converge uniformly. -/
theorem tendstoImageEnergyOfUniformPullback
    {sourceFilter : Filter ι} {comparison : ι → α → β}
    {sourceVolumes : ι → Measure β} {densities : ι → β → ℝ}
    {jacobians : ι → α → ℝ} {limitingDensity : α → ℝ}
    [IsFiniteMeasure referenceVolume]
    (hComparisons : ∀ᶠ i in sourceFilter,
      MeasurableEmbedding (comparison i) ∧
      IntegrableOn (densities i) (range (comparison i)) (sourceVolumes i) ∧
      0 ≤ᵐ[(sourceVolumes i).restrict (range (comparison i))] densities i ∧
      AEMeasurable (jacobians i) referenceVolume ∧
      0 ≤ᵐ[referenceVolume] jacobians i ∧
      (sourceVolumes i).comap (comparison i) = energyMeasure referenceVolume (jacobians i))
    (hLimit : Integrable limitingDensity referenceVolume)
    (hLimitNonneg : 0 ≤ᵐ[referenceVolume] limitingDensity)
    (hUniform : TendstoUniformly (fun i x => jacobians i x * densities i (comparison i x))
      limitingDensity sourceFilter) :
    Tendsto (fun i => (energyMeasure (sourceVolumes i) (densities i)).real (range (comparison i)))
      sourceFilter (𝓝 ((energyMeasure referenceVolume limitingDensity).real univ)) := by
  have hIntegrable : ∀ᶠ i in sourceFilter,
      Integrable (fun x => jacobians i x * densities i (comparison i x)) referenceVolume := by
    filter_upwards [hComparisons] with i hi
    obtain ⟨hφ, hDensity, _, hJ, hJNonneg, hVolume⟩ := hi
    exact integrableDensityOfComparisonEmbedding hφ hDensity hJ hJNonneg hVolume
  have hLimitMass : (energyMeasure referenceVolume limitingDensity).real univ =
      ∫ x, limitingDensity x ∂referenceVolume := by
    simpa only [setIntegral_univ, Measure.restrict_univ] using
      energyMeasure_real_apply MeasurableSet.univ hLimit.integrableOn
        (by simpa only [Measure.restrict_univ] using hLimitNonneg)
  rw [hLimitMass]
  refine (tendstoIntegralOfUniformDensity hIntegrable hLimit hUniform).congr' ?_
  filter_upwards [hComparisons] with i hi
  obtain ⟨hφ, hDensity, hDensityNonneg, hJ, hJNonneg, hVolume⟩ := hi
  exact (energyMeasure_real_range_of_embedding hφ hDensity hDensityNonneg hJ hJNonneg hVolume).symm

end FirstOrderTwistor
