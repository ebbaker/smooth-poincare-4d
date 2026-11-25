import FirstOrderTwistor
import Mathlib.Analysis.SpecificLimits.Basic
import Mathlib.MeasureTheory.Measure.Dirac.Basic

/-! A two-point test of the public measured Weyl accounting composition. -/

open Filter MeasureTheory Set Topology FirstOrderTwistor
open SectionsAndConnections (hilbertSchmidtSq)
open scoped BigOperators

namespace E17MeasureExample

noncomputable section

private def tailMass (i : ℕ) : ℝ := 1 / ((i : ℝ) + 1)

private theorem tailMass_pos (i : ℕ) : 0 < tailMass i := by
  unfold tailMass
  positivity

private theorem tailMass_tendsto :
    Tendsto tailMass atTop (𝓝 0) :=
  tendsto_one_div_add_atTop_nhds_zero_nat

private def sourceVolume : Measure Bool := Measure.dirac false + Measure.dirac true

private def referenceVolume : Measure Unit := Measure.dirac ()

private def sourceDensity (i : ℕ) (x : Bool) : ℝ :=
  if x then tailMass i else 1

private def source (i : ℕ) : FiniteEnergyDensity Bool where
  volume := sourceVolume
  density := sourceDensity i
  integrable := (integrable_dirac (by simp)).add_measure (integrable_dirac (by simp))
  nonnegative := Eventually.of_forall fun x => by
    cases x <;> simp [sourceDensity, (tailMass_pos i).le]

private def base : FiniteEnergyDensity Unit where
  volume := referenceVolume
  density := fun _ => 1
  integrable := integrable_dirac (by simp)
  nonnegative := Eventually.of_forall fun _ => zero_le_one

private def includeBase (_ : Unit) : Bool := false

private theorem includeBase_embedding : MeasurableEmbedding includeBase where
  injective := fun _ _ _ => Subsingleton.elim _ _
  measurable := measurable_const
  measurableSet_image' := fun s _ => (s.image includeBase).to_countable.measurableSet

private theorem includeBase_range : range includeBase = {false} := by
  ext x
  simp [includeBase, eq_comm]

private theorem unitJacobian :
    energyMeasure referenceVolume (fun _ => 1) = referenceVolume := by
  simp [energyMeasure]

private theorem includeBase_volume :
    sourceVolume.comap includeBase = referenceVolume := by
  classical
  ext s hs
  rw [includeBase_embedding.comap_apply]
  have hfalse : false ∈ includeBase '' s ↔ () ∈ s := by
    constructor
    · rintro ⟨⟨⟩, hx, _⟩
      exact hx
    · exact fun hx => ⟨(), hx, rfl⟩
  have htrue : true ∉ includeBase '' s := by simp [includeBase]
  simp [sourceVolume, referenceVolume, Measure.add_apply, Measure.dirac_apply',
    htrue]
  by_cases hx : () ∈ s
  · simp [hx, hfalse.mpr hx]
  · simp [hx, show false ∉ includeBase '' s from fun h => hx (hfalse.mp h)]

private def comparison : FixedTruncationComparison source base Unit where
  referenceVolume := referenceVolume
  finiteReferenceVolume := inferInstanceAs (IsFiniteMeasure (Measure.dirac ()))
  toSource := fun _ => includeBase
  toModel := id
  sourceJacobian := fun _ _ => 1
  modelJacobian := fun _ => 1
  sourceTransport := Eventually.of_forall fun _ => by
    refine ⟨includeBase_embedding, aemeasurable_const, ?_, ?_⟩
    · exact Eventually.of_forall fun _ => zero_le_one
    · exact includeBase_volume.trans unitJacobian.symm
  modelEmbedding := MeasurableEmbedding.id
  modelJacobianMeasurable := aemeasurable_const
  modelJacobianNonnegative := Eventually.of_forall fun _ => zero_le_one
  modelTransport := by
    rw [unitJacobian]
    ext s _
    rw [MeasurableEmbedding.id.comap_apply]
    simp [base]
  uniformDensity := by
    simpa [source, sourceDensity, includeBase, base] using
      (tendsto_const_nhds : Tendsto (fun _ : ℕ => (1 : ℝ)) atTop (𝓝 1)).tendstoUniformly_const
        (α := Unit)

private def family : TruncationFamily (fun i => (source i).toMeasure)
    ({()} : Finset Unit) (fun _ => Unit) :=
  TruncationFamily.ofEnergyComparisons (D := fun _ _ => Unit) source {()}
    (fun _ _ => base) (fun _ _ _ => comparison)
    (by intro _ _; exact monotone_const)
    (by
      intro _ _
      exact Filter.EventuallyEq.of_eq (by simp [comparison]))
    (by
      intro _
      exact Eventually.of_forall fun _ _ _ _ _ hne => (hne (Subsingleton.elim _ _)).elim)

private theorem remainder_eq (L i : ℕ) :
    family.remainder L i = {true} := by
  ext x
  cases x <;>
    simp [TruncationFamily.remainder, family, TruncationFamily.ofEnergyComparisons,
      comparison, includeBase_range]

private theorem totalMass (i : ℕ) :
    (source i).toMeasure.real univ = 1 + tailMass i := by
  rw [FiniteEnergyDensity.toMeasure, energyMeasure_real_apply MeasurableSet.univ
    (source i).integrable.integrableOn
    (ae_mono Measure.restrict_le_self (source i).nonnegative), setIntegral_univ]
  change (∫ x, sourceDensity i x ∂(Measure.dirac false + Measure.dirac true)) =
    1 + tailMass i
  rw [integral_add_measure (integrable_dirac (by simp)) (integrable_dirac (by simp))]
  simp [sourceDensity]

private theorem trueVolume : sourceVolume.real {true} = 1 := by
  simp [sourceVolume, Measure.real, Measure.add_apply, Measure.dirac_apply']

private theorem stripMass (i : ℕ) :
    (source i).toMeasure.real {true} = tailMass i := by
  rw [FiniteEnergyDensity.toMeasure, energyMeasure_real_apply (measurableSet_singleton _)
    (source i).integrable.integrableOn
    (ae_mono Measure.restrict_le_self (source i).nonnegative)]
  change (∫ x in ({true} : Set Bool), sourceDensity i x ∂sourceVolume) = tailMass i
  rw [integral_singleton, trueVolume]
  simp [sourceDensity]

private def strip (_ : Unit) (_ _ : ℕ) : Set Bool := {true}

private def cost (_ : Unit) (_ : ℕ) (i : ℕ) : ℝ := 4 * tailMass i

private def plusFrame (i : ℕ) (_ : Bool) : Matrix (Fin 3) (Fin 3) ℝ :=
  Matrix.single 0 0 (Real.sqrt (tailMass i))

private theorem plusFrame_sq (i : ℕ) (x : Bool) :
    hilbertSchmidtSq (plusFrame i x) = tailMass i := by
  simp [hilbertSchmidtSq, plusFrame, Matrix.single_apply, Fin.sum_univ_three,
    Real.sq_sqrt (tailMass_pos i).le]

private theorem frameCost (i : ℕ) :
    (∫ x in ({true} : Set Bool), frameTensorNormSq
      (chiralFrameTensor (plusFrame i x) 0) ∂sourceVolume) = 4 * tailMass i := by
  rw [integral_singleton, trueVolume,
    frameTensorNormSq_eq_four_chiral, plusFrame_sq]
  simp [hilbertSchmidtSq]

/-- The complete public composition accepts a nonzero, vanishing strip cost
and returns equality with the exhausted base mass. -/
theorem twoPointAccounting :
    (∀ i, 0 < (source i).toMeasure.real {true}) ∧
    (∀ i, 0 < cost () 0 i) ∧
    1 = ∑ j ∈ ({()} : Finset Unit), family.componentEnergy j := by
  refine ⟨fun i => stripMass i ▸ tailMass_pos i, fun i => ?_, ?_⟩
  · exact mul_pos (by norm_num) (tailMass_pos i)
  · apply energyIdentityOfFullWeylStrips source family ({()} : Finset Unit) strip cost
    · exact Eventually.of_forall fun _ => Eventually.of_forall fun i k _ => by
        refine ⟨measurableSet_singleton _, plusFrame i, fun _ => 0, ?_, ?_, ?_⟩
        · filter_upwards [ae_restrict_mem (measurableSet_singleton true)] with x hx
          subst x
          simp [source, sourceDensity, plusFrame_sq]
        · simp [hilbertSchmidtSq]
        · exact (frameCost i).le
    · intro k _ ε hε
      refine Eventually.of_forall fun L => ?_
      have hcost : Tendsto (cost k L) atTop (𝓝 0) := by
        change Tendsto (fun i => 4 * tailMass i) atTop (𝓝 0)
        simpa only [mul_zero] using tailMass_tendsto.const_mul (4 : ℝ)
      exact (hcost.eventually (gt_mem_nhds hε)).mono fun _ hi => hi.le
    · intro ε hε
      exact Eventually.of_forall fun L => Eventually.of_forall fun i => by
        simpa [remainder_eq, strip] using hε.le
    · simpa only [totalMass, add_zero] using tendsto_const_nhds.add tailMass_tendsto

#check @FirstOrderTwistor.energyIdentityOfFullWeylStrips
#print axioms FirstOrderTwistor.energyIdentityOfFullWeylStrips
#print axioms twoPointAccounting

end

end E17MeasureExample
