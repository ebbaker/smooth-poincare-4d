import FirstOrderTwistor.Accounting
import FirstOrderTwistor.EnergyDensity

open Filter MeasureTheory Set Topology

namespace FirstOrderTwistor

/-- An integrable, nonnegative energy density on a space with a volume measure. -/
structure FiniteEnergyDensity (X : Type*) [MeasurableSpace X] where
  volume : Measure X
  density : X → ℝ
  integrable : Integrable density volume
  nonnegative : 0 ≤ᵐ[volume] density

namespace FiniteEnergyDensity

variable {X : Type*} [MeasurableSpace X]

noncomputable def toMeasure (data : FiniteEnergyDensity X) : Measure X :=
  energyMeasure data.volume data.density

instance (data : FiniteEnergyDensity X) : IsFiniteMeasure data.toMeasure :=
  isFiniteEnergyMeasure data.integrable

noncomputable def toFiniteMeasure (data : FiniteEnergyDensity X) : FiniteMeasure X :=
  ⟨data.toMeasure, inferInstance⟩

end FiniteEnergyDensity

/-- Both embeddings of the fixed domain transport volume through their respective
Jacobians. The source condition holds eventually at this fixed truncation. -/
structure FixedTruncationComparison {X Y : Type*} [MeasurableSpace X] [MeasurableSpace Y]
    (source : ℕ → FiniteEnergyDensity X) (model : FiniteEnergyDensity Y)
    (D : Type*) [MeasurableSpace D] where
  referenceVolume : Measure D
  finiteReferenceVolume : IsFiniteMeasure referenceVolume
  toSource : ℕ → D → X
  toModel : D → Y
  sourceJacobian : ℕ → D → ℝ
  modelJacobian : D → ℝ
  sourceTransport : ∀ᶠ i in atTop,
    MeasurableEmbedding (toSource i) ∧
    AEMeasurable (sourceJacobian i) referenceVolume ∧
    0 ≤ᵐ[referenceVolume] sourceJacobian i ∧
    (source i).volume.comap (toSource i) = energyMeasure referenceVolume (sourceJacobian i)
  modelEmbedding : MeasurableEmbedding toModel
  modelJacobianMeasurable : AEMeasurable modelJacobian referenceVolume
  modelJacobianNonnegative : 0 ≤ᵐ[referenceVolume] modelJacobian
  modelTransport : model.volume.comap toModel = energyMeasure referenceVolume modelJacobian
  uniformDensity : TendstoUniformly
    (fun i x => sourceJacobian i x * (source i).density (toSource i x))
    (fun x => modelJacobian x * model.density (toModel x)) atTop

namespace FixedTruncationComparison

variable {X Y D : Type*} [MeasurableSpace X] [MeasurableSpace Y] [MeasurableSpace D]
  {source : ℕ → FiniteEnergyDensity X} {model : FiniteEnergyDensity Y}

/-- Uniform convergence on the fixed domain gives convergence of physical
image masses, with the model Jacobian included in the limit integral. -/
theorem tendsto_imageMass (C : FixedTruncationComparison source model D) :
    Tendsto (fun i => (source i).toMeasure.real (range (C.toSource i))) atTop
      (𝓝 (model.toMeasure.real (range C.toModel))) := by
  have := C.finiteReferenceVolume
  have hsource : ∀ᶠ i in atTop,
      Integrable (fun x => C.sourceJacobian i x * (source i).density (C.toSource i x))
        C.referenceVolume ∧
      (source i).toMeasure.real (range (C.toSource i)) =
        ∫ x, C.sourceJacobian i x * (source i).density (C.toSource i x) ∂C.referenceVolume := by
    filter_upwards [C.sourceTransport] with i hi
    obtain ⟨hφ, hJ, hJNonneg, hVolume⟩ := hi
    exact ⟨integrableDensityOfComparisonEmbedding hφ (source i).integrable.integrableOn
        hJ hJNonneg hVolume,
      energyMeasure_real_range_of_embedding hφ (source i).integrable.integrableOn
        (ae_mono Measure.restrict_le_self (source i).nonnegative) hJ hJNonneg hVolume⟩
  have hmodel := integrableDensityOfComparisonEmbedding C.modelEmbedding
    model.integrable.integrableOn C.modelJacobianMeasurable C.modelJacobianNonnegative
    C.modelTransport
  have hmodelMass : model.toMeasure.real (range C.toModel) =
      ∫ x, C.modelJacobian x * model.density (C.toModel x) ∂C.referenceVolume :=
    energyMeasure_real_range_of_embedding C.modelEmbedding model.integrable.integrableOn
      (ae_mono Measure.restrict_le_self model.nonnegative) C.modelJacobianMeasurable
      C.modelJacobianNonnegative C.modelTransport
  rw [hmodelMass]
  exact (tendstoIntegralOfUniformDensity (hsource.mono fun _ h => h.1) hmodel
    C.uniformDensity).congr' (hsource.mono fun _ h => h.2.symm)

end FixedTruncationComparison

/-- Construct a finite accounting family from physical source and model
embeddings. Comparison data need only be supplied at indices in `J`. -/
noncomputable def TruncationFamily.ofEnergyComparisons {X ι : Type*} [MeasurableSpace X]
    (source : ℕ → FiniteEnergyDensity X) (J : Finset ι)
    {Y : ι → Type*} [∀ j, MeasurableSpace (Y j)]
    {D : ι → ℕ → Type*} [∀ j L, MeasurableSpace (D j L)]
    (model : (j : ι) → j ∈ J → FiniteEnergyDensity (Y j))
    (comparison : (j : ι) → (hj : j ∈ J) → (L : ℕ) →
      FixedTruncationComparison source (model j hj) (D j L))
    (hincreasing : ∀ j (hj : j ∈ J), Monotone (fun L => range (comparison j hj L).toModel))
    (hexhausts : ∀ j (hj : j ∈ J),
      (⋃ L, range (comparison j hj L).toModel) =ᵐ[(model j hj).toMeasure] univ)
    (hdisjoint : ∀ L, ∀ᶠ i in atTop, ∀ ⦃j⦄ (hj : j ∈ J) ⦃k⦄ (hk : k ∈ J), j ≠ k →
      AEDisjoint (source i).toMeasure (range ((comparison j hj L).toSource i))
        (range ((comparison k hk L).toSource i))) :
    TruncationFamily (fun i => (source i).toMeasure) J Y := by
  classical
  let energy (j : ι) : FiniteMeasure (Y j) :=
    if hj : j ∈ J then (model j hj).toFiniteMeasure else 0
  have energyToMeasure (j : ι) (hj : j ∈ J) :
      (energy j).toMeasure = (model j hj).toMeasure := by
    unfold energy
    rw [dite_eq_left hj]
    rfl
  refine
    { energy := energy
      domain := fun j L => if hj : j ∈ J then range (comparison j hj L).toModel else ∅
      image := fun j L i => if hj : j ∈ J then range ((comparison j hj L).toSource i) else ∅
      increasing := ?_
      exhausts := ?_
      imageMeasurable := ?_
      imageDisjoint := ?_
      compareMass := ?_ }
  · intro j hj
    simpa only [dite_eq_left hj] using hincreasing j hj
  · intro j hj
    simpa only [dite_eq_left hj, energyToMeasure j hj] using hexhausts j hj
  · intro L
    refine (eventually_all_finset J).2 fun j hj => ?_
    filter_upwards [(comparison j hj L).sourceTransport] with i hi
    simpa only [dite_eq_left hj] using hi.1.measurableSet_range
  · intro L
    filter_upwards [hdisjoint L] with i hi
    intro j hj k hk hne
    have hj' : j ∈ J := hj
    have hk' : k ∈ J := hk
    simpa only [dite_eq_left hj', dite_eq_left hk'] using hi hj' hk' hne
  · intro j hj L
    simpa only [dite_eq_left hj, energyToMeasure j hj]
      using (comparison j hj L).tendsto_imageMass

end FirstOrderTwistor
