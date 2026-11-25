import FirstOrderTwistor.ComparisonFamily
import FirstOrderTwistor.FrameEnergy

/-! # From full-tensor strip estimates to chiral energy accounting -/

open Filter MeasureTheory Set Topology
open SectionsAndConnections (hilbertSchmidtSq)

namespace FirstOrderTwistor

variable {X ι κ : Type*} [MeasurableSpace X]

/-- The frame need only identify the physical positive density on the given strip. -/
theorem positiveChiralMass_le_quarterFrame (source : FiniteEnergyDensity X)
    {s : Set X} (hs : MeasurableSet s)
    (plus minus : X → Matrix (Fin 3) (Fin 3) ℝ)
    (hframe : source.density =ᵐ[source.volume.restrict s] fun x => hilbertSchmidtSq (plus x))
    (hminus : IntegrableOn (fun x => hilbertSchmidtSq (minus x)) s source.volume) :
    source.toMeasure.real s ≤
      (∫ x in s, frameTensorNormSq (chiralFrameTensor (plus x) (minus x)) ∂source.volume) / 4 := by
  have hp : IntegrableOn (fun x => hilbertSchmidtSq (plus x)) s source.volume :=
    (source.integrable.integrableOn (s := s)).congr hframe
  calc
    source.toMeasure.real s = ∫ x in s, source.density x ∂source.volume :=
      energyMeasure_real_apply hs source.integrable.integrableOn
        (ae_mono Measure.restrict_le_self source.nonnegative)
    _ = ∫ x in s, hilbertSchmidtSq (plus x) ∂source.volume := integral_congr_ae hframe
    _ ≤ _ := positiveChiralIntegral_le_quarterFrame hp hminus

/-- Finite, possibly overlapping framed strips. Each supplied cost bounds the
full four-slot integral on the corresponding strip. The frame coefficients
may vary between strips; values outside each strip play no role. -/
theorem energyIdentityOfFullWeylStrips (source : ℕ → FiniteEnergyDensity X)
    {J : Finset ι} {Y : ι → Type*} [∀ j, MeasurableSpace (Y j)]
    (F : TruncationFamily (fun i => (source i).toMeasure) J Y)
    (K : Finset κ) (strip : κ → ℕ → ℕ → Set X) (cost : κ → ℕ → ℕ → ℝ)
    (hframe : ∀ᶠ L in atTop, ∀ᶠ i in atTop, ∀ k ∈ K,
      MeasurableSet (strip k L i) ∧
      ∃ plus minus : X → Matrix (Fin 3) (Fin 3) ℝ,
        ((source i).density =ᵐ[(source i).volume.restrict (strip k L i)]
          fun x => hilbertSchmidtSq (plus x)) ∧
        IntegrableOn (fun x => hilbertSchmidtSq (minus x)) (strip k L i) (source i).volume ∧
        (∫ x in strip k L i, frameTensorNormSq (chiralFrameTensor (plus x) (minus x))
          ∂(source i).volume) ≤ cost k L i)
    (hsmall : ∀ k ∈ K, ∀ ε : ℝ, 0 < ε → ∀ᶠ L in atTop, ∀ᶠ i in atTop, cost k L i ≤ ε)
    (huncovered : ∀ ε : ℝ, 0 < ε → ∀ᶠ L in atTop, ∀ᶠ i in atTop,
      (source i).toMeasure.real (F.remainder L i \ ⋃ k ∈ K, strip k L i) ≤ ε)
    {e : ℝ} (ht : Tendsto (fun i => (source i).toMeasure.real univ) atTop (𝓝 e)) :
    e = ∑ j ∈ J, F.componentEnergy j := by
  refine energyIdentityOfCoveredRemainder (κ := κ) F ?_ ht
  apply RemainderEstimates.ofFixedStrips F K strip (fun k L i => cost k L i / 4)
  · filter_upwards [hframe] with L hL
    filter_upwards [hL] with i hi
    intro k hk
    obtain ⟨hs, plus, minus, hp, hm, hb⟩ := hi k hk
    exact (positiveChiralMass_le_quarterFrame (source i) hs plus minus hp hm).trans
      (div_le_div_of_nonneg_right hb (by norm_num))
  · intro k hk ε hε
    filter_upwards [hsmall k hk (4 * ε) (by positivity)] with L hL
    filter_upwards [hL] with i hi
    linarith
  · exact huncovered

end FirstOrderTwistor
