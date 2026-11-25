import FirstOrderTwistor.EnergyDensity

/-!
# Differentiated twistor defect on a measured strip

The inputs are the squared spinor norms, the squared norms of their projected
covariant curls, and the squared Hilbert–Schmidt norm of the positive Weyl
operator. The pointwise identity from DIR `eq:weyl-defect` is a hypothesis for
each field. Both the volume and these norms belong to the strip's metric.
-/

namespace FirstOrderTwistor

open Filter MeasureTheory Set

variable {X ι : Type*} [MeasurableSpace X]

/-- The points where the sum of the squared spinor norms is nonzero. -/
def spinorJointNonzero (fields : Finset ι) (spinorNormSq : ι → X → ℝ) : Set X :=
  {x | (∑ a ∈ fields, spinorNormSq a x) ≠ 0}

/-- The sum of the squared projected curls divided by the sum of the squared
spinor norms. Its use as a curvature density is restricted to `spinorJointNonzero`. -/
noncomputable def normalizedSpinDefectSq (fields : Finset ι)
    (spinorNormSq projectedNormSq : ι → X → ℝ) (x : X) : ℝ :=
  (∑ a ∈ fields, projectedNormSq a x) / (∑ a ∈ fields, spinorNormSq a x)

variable {volume : Measure X} {fields : Finset ι} {strip : Set X}
  {spinorNormSq projectedNormSq : ι → X → ℝ} {weylNormSq : X → ℝ}

private theorem twice_sum_projected
    (hIdentity : ∀ a ∈ fields, ∀ᵐ x ∂volume.restrict strip,
      2 * projectedNormSq a x = weylNormSq x * spinorNormSq a x) :
    ∀ᵐ x ∂volume.restrict strip,
      2 * (∑ a ∈ fields, projectedNormSq a x) =
        weylNormSq x * (∑ a ∈ fields, spinorNormSq a x) := by
  classical
  have hAll : ∀ᵐ x ∂volume.restrict strip, ∀ a : fields,
      2 * projectedNormSq a x = weylNormSq x * spinorNormSq a x :=
    ae_all_iff.mpr fun a => hIdentity a a.property
  filter_upwards [hAll] with x hx
  rw [Finset.mul_sum, Finset.mul_sum]
  exact Finset.sum_congr rfl fun a ha => hx ⟨a, ha⟩

/-- On a strip where the family is jointly nonzero almost everywhere, the
normalized defect is integrable and twice its integral is Weyl energy. -/
theorem normalizedSpinDefectIntegral
    (hWeyl : IntegrableOn weylNormSq strip volume)
    (hIdentity : ∀ a ∈ fields, ∀ᵐ x ∂volume.restrict strip,
      2 * projectedNormSq a x = weylNormSq x * spinorNormSq a x)
    (hNonzero : ∀ᵐ x ∂volume.restrict strip, x ∈ spinorJointNonzero fields spinorNormSq) :
    IntegrableOn (normalizedSpinDefectSq fields spinorNormSq projectedNormSq) strip volume ∧
      2 * (∫ x in strip, normalizedSpinDefectSq fields spinorNormSq projectedNormSq x ∂volume) =
        ∫ x in strip, weylNormSq x ∂volume := by
  have hRatio : normalizedSpinDefectSq fields spinorNormSq projectedNormSq =ᵐ[volume.restrict strip]
      fun x => (1 / 2 : ℝ) * weylNormSq x := by
    filter_upwards [twice_sum_projected hIdentity, hNonzero] with x hSum hx
    unfold normalizedSpinDefectSq
    apply (div_eq_iff_mul_eq hx).2
    rw [mul_assoc, ← hSum, ← mul_assoc, one_div_mul_cancel (by norm_num : (2 : ℝ) ≠ 0), one_mul]
  refine ⟨(hWeyl.const_mul (1 / 2)).congr hRatio.symm, ?_⟩
  rw [integral_congr_ae hRatio, integral_const_mul, ← mul_assoc]
  norm_num

/-- Full strip energy splits into the normalized contribution on the joint
nonzero locus and the energy on its complement. -/
theorem spinDefectEnergyDecomposition
    (hStrip : MeasurableSet strip)
    (hSpinorMeas : ∀ a ∈ fields, Measurable (spinorNormSq a))
    (hWeyl : IntegrableOn weylNormSq strip volume)
    (hWeylNonneg : 0 ≤ᵐ[volume.restrict strip] weylNormSq)
    (hIdentity : ∀ a ∈ fields, ∀ᵐ x ∂volume.restrict strip,
      2 * projectedNormSq a x = weylNormSq x * spinorNormSq a x) :
    (energyMeasure volume weylNormSq).real strip =
      2 * (∫ x in strip ∩ spinorJointNonzero fields spinorNormSq,
        normalizedSpinDefectSq fields spinorNormSq projectedNormSq x ∂volume) +
      (energyMeasure volume weylNormSq).real (strip \ spinorJointNonzero fields spinorNormSq) := by
  have hJoint : MeasurableSet (spinorJointNonzero fields spinorNormSq) :=
    (measurableSet_eq_fun (fields.measurable_sum hSpinorMeas) measurable_const).compl
  have hOnNonzero := (normalizedSpinDefectIntegral (hWeyl.mono_set inter_subset_left)
    (fun a ha => ae_restrict_of_ae_restrict_of_subset inter_subset_left (hIdentity a ha))
    ((ae_restrict_mem (μ := volume) (hStrip.inter hJoint)).mono fun _ hx => hx.2)).2
  rw [energyMeasure_real_apply hStrip hWeyl hWeylNonneg, hOnNonzero,
    energyMeasure_real_apply (hStrip.diff hJoint) (hWeyl.mono_set sdiff_subset)
      (ae_restrict_of_ae_restrict_of_subset sdiff_subset hWeylNonneg)]
  exact (integral_inter_add_sdiff hJoint hWeyl).symm

/-- An almost-everywhere joint squared floor bounds the strip energy by the
integrated raw differentiated defect in that strip's own volume. -/
theorem spinDefectFloorBound {c : ℝ}
    (hStrip : MeasurableSet strip)
    (hWeyl : IntegrableOn weylNormSq strip volume)
    (hWeylNonneg : 0 ≤ᵐ[volume.restrict strip] weylNormSq)
    (hProjectedIntegrable : ∀ a ∈ fields, IntegrableOn (projectedNormSq a) strip volume)
    (hIdentity : ∀ a ∈ fields, ∀ᵐ x ∂volume.restrict strip,
      2 * projectedNormSq a x = weylNormSq x * spinorNormSq a x)
    (hFloor : ∀ᵐ x ∂volume.restrict strip, c ^ 2 ≤ ∑ a ∈ fields, spinorNormSq a x) :
    c ^ 2 * (energyMeasure volume weylNormSq).real strip ≤
      2 * ∫ x in strip, ∑ a ∈ fields, projectedNormSq a x ∂volume := by
  rw [energyMeasure_real_apply hStrip hWeyl hWeylNonneg,
    ← integral_const_mul, ← integral_const_mul]
  apply integral_mono_ae (hWeyl.const_mul _) ((integrable_finsetSum fields hProjectedIntegrable).const_mul _)
  filter_upwards [hFloor, hWeylNonneg, twice_sum_projected hIdentity] with x hFloorAt hWeylAt hSum
  change c ^ 2 * weylNormSq x ≤ 2 * (∑ a ∈ fields, projectedNormSq a x)
  rw [hSum, mul_comm (c ^ 2)]
  exact mul_le_mul_of_nonneg_left hFloorAt hWeylAt

/-- On a common strip covered almost everywhere by both families, equality of
the Weyl energy measures implies equality of the normalized defect integrals.
For conformal gauges, `energyMeasure_conformalFour` supplies the energy
comparison from the Weyl coefficient and volume factors. -/
theorem normalizedSpinDefectIntegral_eq_of_energyMeasure {κ : Type*}
    {otherVolume : Measure X} {otherFields : Finset κ} {otherWeylNormSq : X → ℝ}
    {otherSpinorNormSq otherProjectedNormSq : κ → X → ℝ}
    (hStrip : MeasurableSet strip)
    (hWeyl : IntegrableOn weylNormSq strip volume)
    (hOtherWeyl : IntegrableOn otherWeylNormSq strip otherVolume)
    (hWeylNonneg : 0 ≤ᵐ[volume.restrict strip] weylNormSq)
    (hOtherWeylNonneg : 0 ≤ᵐ[otherVolume.restrict strip] otherWeylNormSq)
    (hIdentity : ∀ a ∈ fields, ∀ᵐ x ∂volume.restrict strip,
      2 * projectedNormSq a x = weylNormSq x * spinorNormSq a x)
    (hOtherIdentity : ∀ a ∈ otherFields, ∀ᵐ x ∂otherVolume.restrict strip,
      2 * otherProjectedNormSq a x = otherWeylNormSq x * otherSpinorNormSq a x)
    (hNonzero : ∀ᵐ x ∂volume.restrict strip, x ∈ spinorJointNonzero fields spinorNormSq)
    (hOtherNonzero : ∀ᵐ x ∂otherVolume.restrict strip,
      x ∈ spinorJointNonzero otherFields otherSpinorNormSq)
    (hEnergy : (energyMeasure volume weylNormSq).restrict strip =
      (energyMeasure otherVolume otherWeylNormSq).restrict strip) :
    (∫ x in strip, normalizedSpinDefectSq fields spinorNormSq projectedNormSq x ∂volume) =
      ∫ x in strip, normalizedSpinDefectSq otherFields otherSpinorNormSq otherProjectedNormSq x
        ∂otherVolume := by
  have hMass := congrArg (fun μ : Measure X => μ.real univ) hEnergy
  simp only [measureReal_def, Measure.restrict_apply_univ] at hMass
  change (energyMeasure volume weylNormSq).real strip =
    (energyMeasure otherVolume otherWeylNormSq).real strip at hMass
  rw [energyMeasure_real_apply hStrip hWeyl hWeylNonneg,
    energyMeasure_real_apply hStrip hOtherWeyl hOtherWeylNonneg,
    ← (normalizedSpinDefectIntegral hWeyl hIdentity hNonzero).2,
    ← (normalizedSpinDefectIntegral hOtherWeyl hOtherIdentity hOtherNonzero).2] at hMass
  exact mul_left_cancel₀ (by norm_num : (2 : ℝ) ≠ 0) hMass

end FirstOrderTwistor
