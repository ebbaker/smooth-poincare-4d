import FirstOrderTwistor.SpinRatioAccounting

/-! # Energy accounting from measured bounds for the normalized differentiated fields -/

open Filter MeasureTheory Set Topology

namespace FirstOrderTwistor

/-- Each contributing strip has an actual field and projected defect with a measured
L² ratio bound. The analytic budget is the sum of twice the squared local bounds.
All bounds are taken on the original sequence, possibly in matched strip gauges. -/
theorem energyIdentityOfSpinorRatioBounds
    {X ι κ α S P : Type*} [MeasurableSpace X] [NormedAddCommGroup S] [NormedAddCommGroup P]
    {μ : ℕ → Measure X} [∀ i, IsFiniteMeasure (μ i)] {J : Finset ι}
    {Y : ι → Type*} [∀ j, MeasurableSpace (Y j)]
    (F : TruncationFamily μ J Y) (K : ℕ → ℕ → Finset κ)
    (U : κ → ℕ → ℕ → Set X) (D : κ → ℕ → ℕ → SpinDefectStrip X α)
    (bound : κ → ℕ → ℕ → ℝ)
    (hStrip : ∀ᶠ L in atTop, ∀ᶠ i in atTop, ∀ k ∈ K L i,
      let data := D k L i
      let s := F.remainder L i ∩ U k L i
      let ν := data.volume.restrict (data.nonzeroRegion s)
      data.RatioValidOn (μ i) s ∧
      ∃ (a : α) (ψ : X → S) (projected : X → P) (measured : Measure X),
        data.fields = {a} ∧
        (∀ᵐ x ∂ν, data.spinorNormSq a x = ‖ψ x‖ ^ 2) ∧
        (∀ᵐ x ∂ν, data.projectedNormSq a x = ‖projected x‖ ^ 2) ∧
        ν ≤ measured ∧ MemLp (fun x => ‖projected x‖ / ‖ψ x‖) 2 measured ∧
        lpNorm (fun x => ‖projected x‖ / ‖ψ x‖) 2 measured ≤ bound k L i)
    (hSum : ∀ ε > (0 : ℝ), ∀ᶠ L in atTop, ∀ᶠ i in atTop,
      (∑ k ∈ K L i, 2 * bound k L i ^ 2) ≤ ε)
    (hUncovered : ∀ ε > (0 : ℝ), ∀ᶠ L in atTop, ∀ᶠ i in atTop,
      (μ i).real (F.remainder L i \ ⋃ k ∈ K L i,
        (D k L i).nonzeroRegion (F.remainder L i ∩ U k L i)) ≤ ε)
    {e : ℝ} (hTotal : Tendsto (fun i => (μ i).real univ) atTop (𝓝 e)) :
    e = ∑ j ∈ J, F.componentEnergy j := by
  refine energyIdentityOfCoveredRemainder F
    (RemainderEstimates.ofNormalizedSpinDefectStrips F K U D ?_ ?_ hUncovered) hTotal
  · filter_upwards [hStrip] with L hL
    filter_upwards [hL] with i hi
    exact fun k hk => (hi k hk).1
  · intro ε hε
    filter_upwards [hStrip, hSum ε hε] with L hL hSmall
    filter_upwards [hL, hSmall] with i hi hiSmall
    refine (Finset.sum_le_sum ?_).trans hiSmall
    intro k hk
    obtain ⟨a, ψ, projected, measured, hFields, hψ, hP, hμ, hLp, hBound⟩ := (hi k hk).2
    exact (D k L i).normalizedCost_le_of_singleton_lpNorm _ a ψ projected
      hFields hψ hP hμ hLp hBound

end FirstOrderTwistor
