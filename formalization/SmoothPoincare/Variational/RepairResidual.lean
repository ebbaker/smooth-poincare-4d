import Mathlib.Tactic.Linarith
import Mathlib.Topology.Instances.Real.Lemmas

/-! # Fixed-tolerance bounds for independent repairs -/

namespace SmoothPoincare

open Filter

/-- At one fixed tolerance, the summed repair surcharge and the entire uncovered
chiral energy bound the limiting energy. The natural-number index runs along the
subsequence chosen at that tolerance. -/
theorem energyBoundOfRepairFamily
    (e cost rem : ℕ → ℝ) (N : ℕ → ℕ) (K : ℕ) (I b ω : ℝ)
    (he : Tendsto e atTop (nhds I))
    (hRepair : ∀ᶠ i in atTop, N i ≤ K ∧ I ≤ e i ∧
      e i ≤ (N i : ℝ) * (e i - I) + cost i + rem i)
    (hBounds : ∀ ε : ℝ, 0 < ε →
      ∀ᶠ i in atTop, cost i ≤ b + ε ∧ rem i ≤ ω + ε) :
    I ≤ b + ω := by
  have hExcess : Tendsto (fun i => e i - I) atTop (nhds 0) := by
    simpa only [sub_self] using he.sub (tendsto_const_nhds (x := I))
  have hUpper : Tendsto (fun i => (K : ℝ) * (e i - I)) atTop (nhds 0) := by
    simpa only [mul_zero] using hExcess.const_mul (K : ℝ)
  have hCardinality : Tendsto (fun i => (N i : ℝ) * (e i - I)) atTop (nhds 0) := by
    refine tendsto_const_nhds.squeeze' hUpper ?_ ?_
    · filter_upwards [hRepair] with i hi
      exact mul_nonneg (Nat.cast_nonneg _) (sub_nonneg.mpr hi.2.1)
    · filter_upwards [hRepair] with i hi
      exact mul_le_mul_of_nonneg_right (Nat.cast_le.mpr hi.1) (sub_nonneg.mpr hi.2.1)
  refine le_of_forall_pos_le_add fun ε hε => ?_
  have hLimit : Tendsto (fun i => (N i : ℝ) * (e i - I) + (b + ω + ε))
      atTop (nhds (b + ω + ε)) := by
    simpa only [zero_add] using hCardinality.add tendsto_const_nhds
  apply le_of_tendsto_of_tendsto he hLimit
  filter_upwards [hRepair, hBounds (ε / 2) (half_pos hε)] with i hi hb
  linarith only [hi.2.2, hb.1, hb.2]

end SmoothPoincare
