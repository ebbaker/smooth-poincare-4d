import FirstOrderTwistor.EnergyDensity
import FirstOrderTwistor.MeasureAccounting

open MeasureTheory Set
open scoped BigOperators

namespace FirstOrderTwistor

variable {ι : Type*}

/-- Positive stripwise floors turn integrated defect bounds into a residual
energy bound with an explicit uncovered contribution. -/
theorem finiteCoverDefectBound [DecidableEq ι] (J : Finset ι) (r u : ℝ) (w H c : ι → ℝ)
    (hfloor : ∀ j ∈ J, 0 < c j)
    (hlocal : ∀ j ∈ J, (c j) ^ 2 * w j ≤ 2 * H j)
    (hcover : r ≤ u + (∑ j ∈ J, w j)) :
    r ≤ u + (∑ j ∈ J, 2 * H j / (c j) ^ 2) := by
  refine hcover.trans (add_le_add (le_refl u) (Finset.sum_le_sum ?_))
  intro j hj
  exact (le_div_iff₀ (pow_pos (hfloor j hj) 2)).2 (by
    rw [mul_comm]
    exact hlocal j hj)

variable {X : Type*} [MeasurableSpace X]

/-- The energy of a residual region is bounded by the sum of its strip energies
and the energy on the uncovered region. Strip energies are restricted to the
residual, and overlaps are allowed. -/
theorem setIntegral_le_uncovered_add_sum (μ : Measure X) (S : Set X)
    (J : Finset ι) (U : ι → Set X) (energy : X → ℝ)
    (hS : MeasurableSet S) (hU : ∀ j ∈ J, MeasurableSet (U j))
    (hEnergy : IntegrableOn energy S μ) (hNonneg : 0 ≤ᵐ[μ.restrict S] energy) :
    (∫ x in S, energy x ∂μ) ≤ (∫ x in S \ ⋃ j ∈ J, U j, energy x ∂μ) +
      (∑ j ∈ J, ∫ x in S ∩ U j, energy x ∂μ) := by
  let ν := energyMeasure (μ.restrict S) energy
  let : IsFiniteMeasure ν := isFiniteEnergyMeasure hEnergy
  have hMass (T : Set X) (hT : MeasurableSet T) :
      ν.real T = ∫ x in T ∩ S, energy x ∂μ := by
    rw [energyMeasure_real_apply hT hEnergy.integrableOn (ae_restrict_of_ae hNonneg),
      Measure.restrict_restrict hT]
  have hCover := measureReal_le_sum_add_uncovered ν S J U
    (fun j => ∫ x in S ∩ U j, energy x ∂μ) (fun j hj => by rw [hMass _ (hU j hj), inter_comm])
  rw [hMass S hS, inter_self, hMass _ (hS.diff (J.measurableSet_biUnion hU)),
    inter_eq_left.mpr sdiff_subset, add_comm] at hCover
  exact hCover

/-- The measurable finite-cover estimate with a distinct positive floor on
each strip and integrated defect costs on the intersections with the residual. -/
theorem finiteCoverDefectBoundOfIntegrals (μ : Measure X) (S : Set X)
    (J : Finset ι) (U : ι → Set X) (energy : X → ℝ) (H c : ι → ℝ)
    (hS : MeasurableSet S) (hU : ∀ j ∈ J, MeasurableSet (U j))
    (hEnergy : IntegrableOn energy S μ) (hNonneg : 0 ≤ᵐ[μ.restrict S] energy)
    (hfloor : ∀ j ∈ J, 0 < c j)
    (hlocal : ∀ j ∈ J, (c j) ^ 2 * (∫ x in S ∩ U j, energy x ∂μ) ≤ 2 * H j) :
    (∫ x in S, energy x ∂μ) ≤ (∫ x in S \ ⋃ j ∈ J, U j, energy x ∂μ) +
      (∑ j ∈ J, 2 * H j / (c j) ^ 2) := by
  classical
  exact finiteCoverDefectBound J _ _ _ H c hfloor hlocal
    (setIntegral_le_uncovered_add_sum μ S J U energy hS hU hEnergy hNonneg)

end FirstOrderTwistor
