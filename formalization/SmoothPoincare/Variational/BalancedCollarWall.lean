import SmoothPoincare.Variational.BalancedMarkedExterior

/-! # Endpoint energy forced by a repair confined to a selected disk collar -/

open DifferentialGeometry DifferentialGeometry.Integral.Measure Filter FirstOrderTwistor MeasureTheory Set
open scoped ContDiff Manifold Topology

namespace SmoothPoincare

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "T" => (4 * Real.pi ^ 2)

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M] [CompactSpace M] [Nonempty M]
  {o : ManifoldOrientation I M 4}

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

/-- The exact half-division error, the capped exterior energy excess, and
the physical charge accessible on the changed disk side give a lower bound
on the actual endpoint energy. Equality of charges is needed only on the
unchanged part of this disk in the indicated sign. -/
theorem balancedEndpointEnergy_lower_of_localChange (g h cap : SignedCollarMetric o)
    (m : NestedBalancedDisks I M) (k : ℕ) (s : CollarChirality)
    (W : Set M) (hW : MeasurableSet W) {τ δ : ℝ}
    (hDiv : g.charge s (interior (selectedChartDisk m.outer))ᶜ ≤
      (1 / (2 : ℝ) ^ k) * g.charge s (interior (selectedChartDisk m.core))ᶜ + τ)
    (hPos : 0 < classYamabeFour o.dimension_eq cap.metric)
    (hCap : cap.energy s ≤ h.charge s (interior (selectedChartDisk m.outer))ᶜ + δ)
    (hFix : g.charge s (selectedChartDisk m.outer \ W) = h.charge s (selectedChartDisk m.outer \ W)) :
    let B := selectedChartDisk m.outer
    let q := 1 / (2 : ℝ) ^ k
    sInf (geometricPositiveEnergies o) + (1 - q) * g.energy .plus +
      q * g.charge s (selectedChartDisk m.core) - τ - δ - g.charge s (B ∩ W) ≤ h.energy .plus := by
  intro B q
  have hInf := csInf_le (geometricPositiveEnergies_bddBelow o) (cap.energy_mem_of_positive hPos)
  have hInf' : sInf (geometricPositiveEnergies o) ≤ cap.energy s := by
    cases s with
    | plus => exact hInf
    | minus => exact hInf.trans_eq cap.signature_zero
  have hLower := hInf'.trans hCap
  rw [signedCharge_fullMarkedExterior h s _ m.outer_source] at hLower
  rw [signedCharge_fullMarkedExterior g s _ m.outer_source,
    signedCharge_fullMarkedExterior g s _ m.core_source] at hDiv
  have split (v : SignedCollarMetric o) :
      v.charge s (B ∩ W) + v.charge s (B \ W) = v.charge s B :=
    measureReal_inter_add_sdiff (μ := v.chiralMeasure s) (s := B) hW
  have hnonneg : 0 ≤ h.charge s (B ∩ W) := measureReal_nonneg
  change g.charge s (B \ W) = h.charge s (B \ W) at hFix
  change _ ≤ h.energy .plus - h.charge s B + δ at hLower
  change g.energy .plus - g.charge s B ≤ q * (g.energy .plus - _) + τ at hDiv
  linarith only [split g, split h, hnonneg, hFix, hLower, hDiv]

/-- With an independently positive same-type cap, a raw-small change on
even one sign forces a uniform overshoot of the joined wall. The tested
changes and endpoints may be chosen afresh at each sufficiently late index. -/
theorem eventually_balancedEndpointEnergy_gt_wall_on_selectedTrim
    (g : ℕ → SignedCollarMetric o) (m : ℕ → NestedBalancedDisks I M)
    (w : ℕ → ℕ) (k : ℕ) {ε : ℝ}
    (hWeight : (1 / (2 : ℝ) ^ k) * (T + ε) ≤ ε)
    (hGap : T + ε < sInf (geometricPositiveEnergies o)) (s : CollarChirality)
    (τ δ : ℕ → ℝ)
    (he : Tendsto (fun i => (g i).energy .plus) atTop (𝓝 (sInf (geometricPositiveEnergies o))))
    (hLoss : Tendsto (fun i => τ i + δ i + (g i).charge s
      (selectedChartDisk (m i).outer ∩ selectedDiskTrim (m i).outer (w i))) atTop (𝓝 0))
    (hDiv : ∀ᶠ i in atTop, (g i).charge s (interior (selectedChartDisk (m i).outer))ᶜ ≤
      (1 / (2 : ℝ) ^ k) * (g i).charge s (interior (selectedChartDisk (m i).core))ᶜ + τ i) :
    ∀ᶠ i in atTop, ∀ h cap : SignedCollarMetric o,
      0 < classYamabeFour o.dimension_eq cap.metric →
      cap.energy s ≤ h.charge s (interior (selectedChartDisk (m i).outer))ᶜ + δ i →
      (g i).charge s (selectedChartDisk (m i).outer \ selectedDiskTrim (m i).outer (w i)) =
        h.charge s (selectedChartDisk (m i).outer \ selectedDiskTrim (m i).outer (w i)) →
      2 * T + ε < h.energy .plus := by
  let A := sInf (geometricPositiveEnergies o)
  let q := 1 / (2 : ℝ) ^ k
  have hq : 0 ≤ q := by dsimp [q]; positivity
  have hq' : q ≤ 1 := by
    simpa only [pow_zero, div_one, q] using one_div_pow_le_one_div_pow_of_le
      (by norm_num : (1 : ℝ) ≤ 2) (Nat.zero_le k)
  have hmargin : 2 * T + ε < A + (1 - q) * A := by
    change T + ε < A at hGap
    change q * (T + ε) ≤ ε at hWeight
    have hpos := mul_pos (show 0 < 2 - q by linarith) (sub_pos.mpr hGap)
    nlinarith only [hpos, hWeight]
  have hlim := (((he.const_mul (1-q)).const_add A).sub hLoss)
  rw [sub_zero] at hlim
  filter_upwards [hDiv, hlim.eventually_const_lt hmargin] with i hi hgt
  intro h cap hp hc hf
  have hLower := balancedEndpointEnergy_lower_of_localChange (g i) h cap (m i) k s
    (selectedDiskTrim (m i).outer (w i)) (isOpen_selectedDiskTrim _ _).measurableSet hi hp hc hf
  have hn : 0 ≤ q * (g i).charge s (selectedChartDisk (m i).core) :=
    mul_nonneg hq measureReal_nonneg
  change A + (1 - q) * _ + q * _ - _ - _ - _ ≤ _ at hLower
  linarith only [hLower, hn, hgt]

end SmoothPoincare
