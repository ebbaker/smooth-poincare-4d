import FirstOrderTwistor.CapEstimates
import FirstOrderTwistor.CutMargin
import Mathlib.Topology.Instances.Real.Lemmas
import Mathlib.Tactic.Linarith

/-!
# Fixed radius selection for one spherical cut

The compact core and the collar model have limits as the radius decreases. Each
transfer to a source uses a fixed positive radius and a fixed buffer length.
The scalar cap bounds apply to the exterior produced at that same source index.
-/

namespace FirstOrderTwistor

open Filter Set Topology

/-- The global, compactification-tail, core-transfer and Weyl splice errors
each use one allowance `ε`. The four allowances fit strictly within the
budget margin even when the bubble energy equals the recognition threshold.
The buffer loss and the collar perturbation leave
half of `min y₀ (Yround / 2)` as a lower bound for the exterior Yamabe constant.
The source sequence is indexed by natural numbers, so its eventual conclusion
holds for every source beyond a single index at each selected length and radius. -/
theorem selectFixedSphericalCut
    {T δ e eX ε y₀ Yround ηmax CW CY : ℝ}
    {bufferLoss : ℕ → ℝ} {limitCore limitCollar : ℕ → ℝ → ℝ}
    {totalEnergy : ℕ → ℝ}
    {coreEnergy collarError exteriorEnergy exteriorYamabe : ℕ → ℝ → ℕ → ℝ}
    (hbudget : e ≤ 2 * T - δ) (hbubble : T ≤ eX)
    (hε : 0 < ε) (hmargin : 4 * ε < δ)
    (hy₀ : 0 < y₀) (hround : 0 < Yround) (hηmax : 0 < ηmax)
    (hbuffer : Tendsto bufferLoss atTop (𝓝 0))
    (hlimitCore : ∀ ℓ ≥ 1, Tendsto (limitCore ℓ) (𝓝[>] (0 : ℝ)) (𝓝 eX))
    (hlimitCollar : ∀ ℓ ≥ 1, Tendsto (limitCollar ℓ) (𝓝[>] (0 : ℝ)) (𝓝 0))
    (htotal : Tendsto totalEnergy atTop (𝓝 e))
    (hcore : ∀ ℓ ≥ 1, ∀ᶠ s in 𝓝[>] (0 : ℝ),
      Tendsto (coreEnergy ℓ s) atTop (𝓝 (limitCore ℓ s)))
    (hcollar : ∀ ℓ ≥ 1, ∀ᶠ s in 𝓝[>] (0 : ℝ),
      Tendsto (collarError ℓ s) atTop (𝓝 (limitCollar ℓ s)))
    (hcap : ∀ ℓ ≥ 1, ∀ᶠ s in 𝓝[>] (0 : ℝ), ∀ᶠ i in atTop,
      0 ≤ collarError ℓ s i ∧
        (collarError ℓ s i ≤ ηmax →
          exteriorEnergy ℓ s i ≤ totalEnergy i - coreEnergy ℓ s i + CW * collarError ℓ s i ^ 2 ∧
          min y₀ ((1 - CY * collarError ℓ s i) * Yround) - bufferLoss ℓ ≤ exteriorYamabe ℓ s i)) :
    ∃ ℓ : ℕ, 1 ≤ ℓ ∧ ∀ sMax : ℝ, 0 < sMax → ∃ s : ℝ, 0 < s ∧ s < sMax ∧
      ∀ᶠ i in atTop,
        exteriorEnergy ℓ s i < e - eX + 4 * ε ∧ exteriorEnergy ℓ s i < T ∧
        min y₀ (Yround / 2) / 2 < exteriorYamabe ℓ s i := by
  let b := min y₀ (Yround / 2)
  have hb : 0 < b := lt_min hy₀ (half_pos hround)
  obtain ⟨ℓ, hℓ, hloss⟩ := (Eventually.and (eventually_ge_atTop (1 : ℕ))
    ((tendsto_order.1 hbuffer).2 (b / 2) (half_pos hb))).exists
  have hweylAtZero : Tendsto (fun d : ℝ => CW * d ^ 2) (𝓝 0) (𝓝 0) := by
    simpa using ((continuous_pow 2).const_mul CW).tendsto (0 : ℝ)
  have hyamabeAtZero : Tendsto (fun d : ℝ => CY * d) (𝓝 0) (𝓝 0) := by
    simpa using (continuous_id.const_mul CY).tendsto (0 : ℝ)
  have hsmall : ∀ᶠ d : ℝ in 𝓝 0, d ≤ ηmax ∧ CW * d ^ 2 < ε ∧ CY * d < 1 / 2 := by
    filter_upwards [eventually_lt_nhds hηmax, (tendsto_order.1 hweylAtZero).2 ε hε,
      (tendsto_order.1 hyamabeAtZero).2 (1 / 2) (by norm_num)] with d hd hw hy
    exact ⟨hd.le, hw, hy⟩
  obtain ⟨clearance, hclearance, hsmallOfBall⟩ := Metric.nhds_basis_ball.eventually_iff.mp hsmall
  refine ⟨ℓ, hℓ, fun sMax hsMax => ?_⟩
  have htailSmall := (tendsto_order.1 (hlimitCore ℓ hℓ)).1 (eX - ε) (sub_lt_self _ hε)
  have hmodelSmall := (tendsto_order.1 (hlimitCollar ℓ hℓ)).2 clearance hclearance
  obtain ⟨s, hs, htail, hmodel, hcoreS, hcollarS, hcapS⟩ :=
    (Eventually.and (Ioo_mem_nhdsGT hsMax) <| htailSmall.and <| hmodelSmall.and <|
      (hcore ℓ hℓ).and <| (hcollar ℓ hℓ).and (hcap ℓ hℓ)).exists
  refine ⟨s, hs.1, hs.2, ?_⟩
  filter_upwards [(tendsto_order.1 htotal).2 (e + ε) (lt_add_of_pos_right _ hε),
    (tendsto_order.1 hcoreS).1 (limitCore ℓ s - ε) (sub_lt_self _ hε),
    (tendsto_order.1 hcollarS).2 clearance hmodel, hcapS] with i htotalI hcoreI hcollarI hcapI
  obtain ⟨hnonneg, hcapI⟩ := hcapI
  have hball : collarError ℓ s i ∈ Metric.ball 0 clearance := by
    simpa only [Metric.mem_ball, Real.dist_eq, sub_zero, abs_of_nonneg hnonneg] using hcollarI
  obtain ⟨heta, hweyl, hyamabe⟩ := hsmallOfBall hball
  obtain ⟨hexterior, hyexterior⟩ := hcapI heta
  have henergy : exteriorEnergy ℓ s i < e - eX + 4 * ε := by
    linarith only [htotalI, htail, hcoreI, hweyl, hexterior]
  have hthreshold : exteriorEnergy ℓ s i < T :=
    exteriorEnergyLtThresholdOfStrictError T δ e eX (4 * ε) _ hbudget hbubble hmargin henergy.le
  have hYreference : b / 2 ≤ min y₀ ((1 - CY * collarError ℓ s i) * Yround) - b / 2 :=
    halfCapYamabeMargin (le_refl y₀) hround.le hyamabe.le (le_refl (b / 2))
  exact ⟨henergy, hthreshold, by
    change b / 2 < exteriorYamabe ℓ s i
    linarith only [hYreference, hloss, hyexterior]⟩

end FirstOrderTwistor
