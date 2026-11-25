import FirstOrderTwistor.SpinCoverAccounting
import Mathlib.MeasureTheory.Function.LpSeminorm.LpNorm

/-!
# Accounting by the normalized spinor defect

Each strip contributes on its joint nonzero locus. The part of the physical
remainder with no such coverage is recorded as uncovered energy.
-/

open Filter MeasureTheory Set
open scoped BigOperators

namespace FirstOrderTwistor

variable {X ι κ α : Type*} [MeasurableSpace X]

namespace SpinDefectStrip

/-- The part of a region on which the strip fields have nonzero combined norm. -/
def nonzeroRegion (D : SpinDefectStrip X α) (s : Set X) : Set X :=
  s ∩ spinorJointNonzero D.fields D.spinorNormSq

/-- Twice the normalized projected-defect integral over the joint nonzero locus. -/
noncomputable def normalizedCost (D : SpinDefectStrip X α) (s : Set X) : ℝ :=
  2 * ∫ x in D.nonzeroRegion s,
    normalizedSpinDefectSq D.fields D.spinorNormSq D.projectedNormSq x ∂D.volume

/-- Local inputs for interpreting the normalized defect as physical energy. -/
structure RatioValidOn (D : SpinDefectStrip X α) (μ : Measure X) (s : Set X) : Prop where
  measurableRegion : MeasurableSet (D.nonzeroRegion s)
  energyMatch : μ.restrict s = (energyMeasure D.volume D.weylNormSq).restrict s
  weylIntegrable : IntegrableOn D.weylNormSq (D.nonzeroRegion s) D.volume
  weylNonneg : 0 ≤ᵐ[D.volume.restrict (D.nonzeroRegion s)] D.weylNormSq
  projectedIdentity : ∀ a ∈ D.fields, ∀ᵐ x ∂D.volume.restrict (D.nonzeroRegion s),
    2 * D.projectedNormSq a x = D.weylNormSq x * D.spinorNormSq a x

/-- Restricted energy agrees with the normalized cost on the joint nonzero locus. -/
theorem mass_nonzeroRegion_eq_normalizedCost
    {D : SpinDefectStrip X α} {μ : Measure X} {s : Set X} (h : D.RatioValidOn μ s) :
    μ.real (D.nonzeroRegion s) = D.normalizedCost s := by
  have hSubset : D.nonzeroRegion s ⊆ s := inter_subset_left
  have hMatch := congrArg (fun ν : Measure X => ν.restrict (D.nonzeroRegion s)) h.energyMatch
  simp only [Measure.restrict_restrict_of_subset hSubset] at hMatch
  have hMass := congrArg (fun ν : Measure X => ν.real univ) hMatch
  simp only [measureReal_restrict_apply_univ] at hMass
  have hNonzero : ∀ᵐ x ∂D.volume.restrict (D.nonzeroRegion s),
      x ∈ spinorJointNonzero D.fields D.spinorNormSq :=
    (ae_restrict_mem (μ := D.volume) h.measurableRegion).mono fun _ hx => hx.2
  rw [hMass, energyMeasure_real_apply h.measurableRegion h.weylIntegrable h.weylNonneg]
  exact (normalizedSpinDefectIntegral h.weylIntegrable h.projectedIdentity hNonzero).2.symm

end SpinDefectStrip

/-- Assemble the Route 02 remainder estimate from normalized defects, with
uncovered energy measured on the complement of all contributing nonzero loci. -/
noncomputable def RemainderEstimates.ofNormalizedSpinDefectStrips
    {μ : ℕ → Measure X} {J : Finset ι} {Y : ι → Type*} [∀ j, MeasurableSpace (Y j)]
    (F : TruncationFamily μ J Y) (K : ℕ → ℕ → Finset κ)
    (U : κ → ℕ → ℕ → Set X) (D : κ → ℕ → ℕ → SpinDefectStrip X α)
    (hStrips : ∀ᶠ L in atTop, ∀ᶠ i in atTop, ∀ k ∈ K L i,
      (D k L i).RatioValidOn (μ i) (F.remainder L i ∩ U k L i))
    (hSum : ∀ ε : ℝ, 0 < ε → ∀ᶠ L in atTop, ∀ᶠ i in atTop,
      (∑ k ∈ K L i, (D k L i).normalizedCost (F.remainder L i ∩ U k L i)) ≤ ε)
    (hUncovered : ∀ ε : ℝ, 0 < ε → ∀ᶠ L in atTop, ∀ᶠ i in atTop,
      (μ i).real (F.remainder L i \ ⋃ k ∈ K L i,
        (D k L i).nonzeroRegion (F.remainder L i ∩ U k L i)) ≤ ε) : RemainderEstimates F κ where
  strips L i := ⟨K L i, fun k => (D k L i).nonzeroRegion (F.remainder L i ∩ U k L i),
    fun k => (D k L i).normalizedCost (F.remainder L i ∩ U k L i)⟩
  bounds := by
    filter_upwards [hStrips] with L hL
    filter_upwards [hL] with i hi
    exact fun k hk => (SpinDefectStrip.mass_nonzeroRegion_eq_normalizedCost (hi k hk)).le
  sumSmall := hSum
  uncoveredSmall := hUncovered

/-- For one field, the normalized squared density integrates to the squared
L² norm of the ratio of the projected defect norm to the field norm. This
converts local analytic norm bounds into normalized defect costs. -/
theorem normalizedSpinDefectIntegral_singleton_eq_lpNorm_sq {S P : Type*}
    [NormedAddCommGroup S] [NormedAddCommGroup P]
    (volume : Measure X) (s : Set X) (a : α) (ψ : X → S) (projected : X → P)
    (hLp : MemLp (fun x => ‖projected x‖ / ‖ψ x‖) 2 (volume.restrict s)) :
    (∫ x in s, normalizedSpinDefectSq {a} (fun _ y => ‖ψ y‖ ^ 2)
        (fun _ y => ‖projected y‖ ^ 2) x ∂volume) =
      (lpNorm (fun x => ‖projected x‖ / ‖ψ x‖) 2 (volume.restrict s)) ^ 2 := by
  let ratio := fun x => ‖projected x‖ / ‖ψ x‖
  have hDensity : (fun x => normalizedSpinDefectSq {a} (fun _ y => ‖ψ y‖ ^ 2)
      (fun _ y => ‖projected y‖ ^ 2) x) = (fun x => ‖ratio x‖ ^ 2) := by
    funext x
    have hRatioNonneg : 0 ≤ ratio x := div_nonneg (norm_nonneg _) (norm_nonneg _)
    simp [normalizedSpinDefectSq, Real.norm_of_nonneg hRatioNonneg, ratio, div_pow]
  rw [hDensity]
  change (∫ x in s, ‖ratio x‖ ^ (2 : ℕ) ∂volume) =
    (lpNorm ratio 2 (volume.restrict s)) ^ (2 : ℕ)
  have hNorm :=
    lpNorm_eq_integral_norm_rpow_toReal (p := 2) (by norm_num) (by simp) hLp.aestronglyMeasurable
  have hPower :
      lpNorm ratio 2 (volume.restrict s) =
        (∫ x in s, ‖ratio x‖ ^ (2 : ℕ) ∂volume) ^ (1 / 2 : ℝ) := by
    simpa only [ratio, ENNReal.toReal_ofNat, Real.rpow_two, one_div] using hNorm
  rw [hPower, ← Real.rpow_natCast,
    ← Real.rpow_mul (integral_nonneg fun x => sq_nonneg ‖ratio x‖)]
  norm_num


/-- A norm bound for one measured field contributes at most twice its square
to the normalized strip cost. The equalities identify the densities with
the same field and projected defect in the measured norm estimate. A bound
on a larger region in the same strip gauge can be restricted here. -/
theorem SpinDefectStrip.normalizedCost_le_of_singleton_lpNorm {S P : Type*}
    [NormedAddCommGroup S] [NormedAddCommGroup P]
    (D : SpinDefectStrip X α) (s : Set X) (a : α) (ψ : X → S) (projected : X → P)
    (hFields : D.fields = {a})
    (hSpinor : ∀ᵐ x ∂D.volume.restrict (D.nonzeroRegion s), D.spinorNormSq a x = ‖ψ x‖ ^ 2)
    (hProjected : ∀ᵐ x ∂D.volume.restrict (D.nonzeroRegion s),
      D.projectedNormSq a x = ‖projected x‖ ^ 2)
    {measured : Measure X} (hMeasure : D.volume.restrict (D.nonzeroRegion s) ≤ measured)
    (hLp : MemLp (fun x => ‖projected x‖ / ‖ψ x‖) 2 measured) {bound : ℝ}
    (hBound : lpNorm (fun x => ‖projected x‖ / ‖ψ x‖) 2 measured ≤ bound) :
    D.normalizedCost s ≤ 2 * bound ^ 2 := by
  have hDensity : normalizedSpinDefectSq D.fields D.spinorNormSq D.projectedNormSq =ᵐ[
      D.volume.restrict (D.nonzeroRegion s)]
      normalizedSpinDefectSq {a} (fun _ x => ‖ψ x‖ ^ 2) (fun _ x => ‖projected x‖ ^ 2) := by
    filter_upwards [hSpinor, hProjected] with x hψ hprojected
    simp [normalizedSpinDefectSq, hFields, hψ, hprojected]
  unfold normalizedCost
  rw [integral_congr_ae hDensity,
    normalizedSpinDefectIntegral_singleton_eq_lpNorm_sq _ _ _ _ _ (hLp.mono_measure hMeasure)]
  have hTrimmedBound :
      lpNorm (fun x => ‖projected x‖ / ‖ψ x‖) 2 (D.volume.restrict (D.nonzeroRegion s)) ≤ bound :=
    (ENNReal.toReal_mono hLp.eLpNorm_ne_top (eLpNorm_mono_measure _ hMeasure)).trans hBound
  exact mul_le_mul_of_nonneg_left (pow_le_pow_left₀ lpNorm_nonneg hTrimmedBound _) (by norm_num)

end FirstOrderTwistor
