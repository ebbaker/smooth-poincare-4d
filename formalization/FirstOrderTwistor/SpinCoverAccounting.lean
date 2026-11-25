import FirstOrderTwistor.Accounting
import FirstOrderTwistor.SpinDefectDensity

/-!
# Spinor strip estimates on the physical residual

Each strip supplies its own volume and squared densities. The comparison
with the original chiral energy is a measure equality on the part of the
strip inside the residual. The finite cover may vary with both indices.
-/

open Filter MeasureTheory Set
open scoped BigOperators

namespace FirstOrderTwistor

variable {X ι κ α : Type*} [MeasurableSpace X]

/-- Local inputs for the squared projected defect in one strip gauge. -/
structure SpinDefectStrip (X α : Type*) [MeasurableSpace X] where
  volume : Measure X
  weylNormSq : X → ℝ
  fields : Finset α
  spinorNormSq : α → X → ℝ
  projectedNormSq : α → X → ℝ
  floor : ℝ

namespace SpinDefectStrip

/-- The weighted defect cost uses the strip's volume and spinor floor. -/
noncomputable def weightedCost (D : SpinDefectStrip X α) (s : Set X) : ℝ :=
  2 * (∫ x in s, ∑ a ∈ D.fields, D.projectedNormSq a x ∂D.volume) / D.floor ^ 2

/-- Local data on the measurable region where a strip is used. The equality
of restricted measures identifies the strip's chiral energy with the source's. -/
structure ValidOn (D : SpinDefectStrip X α) (μ : Measure X) (s : Set X) : Prop where
  measurableSet : MeasurableSet s
  energyMatch : μ.restrict s = (energyMeasure D.volume D.weylNormSq).restrict s
  weylIntegrable : IntegrableOn D.weylNormSq s D.volume
  weylNonneg : 0 ≤ᵐ[D.volume.restrict s] D.weylNormSq
  projectedIntegrable : ∀ a ∈ D.fields, IntegrableOn (D.projectedNormSq a) s D.volume
  projectedIdentity : ∀ a ∈ D.fields, ∀ᵐ x ∂D.volume.restrict s,
    2 * D.projectedNormSq a x = D.weylNormSq x * D.spinorNormSq a x
  floorPos : 0 < D.floor
  floorBound : ∀ᵐ x ∂D.volume.restrict s, D.floor ^ 2 ≤ ∑ a ∈ D.fields, D.spinorNormSq a x

/-- Charge the physical mass of this region to the strip defect. -/
theorem mass_le_weightedCost {D : SpinDefectStrip X α} {μ : Measure X} {s : Set X}
    (h : D.ValidOn μ s) : μ.real s ≤ D.weightedCost s := by
  have hMass := congrArg (fun ν : Measure X => ν.real univ) h.energyMatch
  simp only [measureReal_restrict_apply_univ] at hMass
  unfold weightedCost
  apply (le_div_iff₀ (pow_pos h.floorPos 2)).2
  rw [mul_comm, hMass]
  exact spinDefectFloorBound h.measurableSet h.weylIntegrable h.weylNonneg
    h.projectedIntegrable h.projectedIdentity h.floorBound

end SpinDefectStrip

/-- Supply Route 02 with strip estimates from local spinor identities and
vanishing weighted and uncovered costs. The index set may vary with the
truncation and source, and strips may overlap. -/
noncomputable def RemainderEstimates.ofSpinDefectStrips
    {μ : ℕ → Measure X} {J : Finset ι} {Y : ι → Type*} [∀ j, MeasurableSpace (Y j)]
    (F : TruncationFamily μ J Y) (K : ℕ → ℕ → Finset κ)
    (U : κ → ℕ → ℕ → Set X) (D : κ → ℕ → ℕ → SpinDefectStrip X α)
    (hStrips : ∀ᶠ L in atTop, ∀ᶠ i in atTop, ∀ k ∈ K L i,
      (D k L i).ValidOn (μ i) (F.remainder L i ∩ U k L i))
    (hSum : ∀ ε : ℝ, 0 < ε → ∀ᶠ L in atTop, ∀ᶠ i in atTop,
      (∑ k ∈ K L i, (D k L i).weightedCost (F.remainder L i ∩ U k L i)) ≤ ε)
    (hUncovered : ∀ ε : ℝ, 0 < ε → ∀ᶠ L in atTop, ∀ᶠ i in atTop,
      (μ i).real (F.remainder L i \ ⋃ k ∈ K L i, U k L i) ≤ ε) : RemainderEstimates F κ where
  strips L i := ⟨K L i, fun k => F.remainder L i ∩ U k L i,
    fun k => (D k L i).weightedCost (F.remainder L i ∩ U k L i)⟩
  bounds := by
    filter_upwards [hStrips] with L hL
    filter_upwards [hL] with i hi
    exact fun k hk => SpinDefectStrip.mass_le_weightedCost (hi k hk)
  sumSmall := hSum
  uncoveredSmall := by
    intro ε hε
    filter_upwards [hUncovered ε hε] with L hL
    filter_upwards [hL] with i hi
    change (μ i).real (F.remainder L i \ ⋃ k ∈ K L i, F.remainder L i ∩ U k L i) ≤ ε
    rwa [← inter_iUnion₂, inter_comm, sdiff_inter_self_eq_sdiff]

end FirstOrderTwistor
