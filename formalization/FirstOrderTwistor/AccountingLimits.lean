import Mathlib.Topology.Instances.Real.Lemmas

/-!
# Iterated limits of real energies

At each fixed truncation, the total and captured energies determine the
limit of the remainder. Eventual bounds first pass to this source limit
and then pass to the limit of the truncations.
-/

namespace FirstOrderTwistor

open Filter Topology

variable {ι : Type*} {sourceFilter : Filter ι}
  {t : ι → ℝ} {c : ℕ → ι → ℝ} {a : ℕ → ℝ} {e s : ℝ}

/-- At a fixed truncation, the remainder converges to the difference of limits. -/
theorem tendstoAccountingRemainder
    (ht : Tendsto t sourceFilter (𝓝 e))
    (hc : ∀ L, Tendsto (c L) sourceFilter (𝓝 (a L))) (L : ℕ) :
    Tendsto (fun i => t i - c L i) sourceFilter (𝓝 (e - a L)) :=
  ht.sub (hc L)

variable [sourceFilter.NeBot]

/-- The exhaustion limit of captured energy is at most the total limit. -/
theorem accountedEnergy_le_totalEnergy
    (ht : Tendsto t sourceFilter (𝓝 e))
    (hc : ∀ L, Tendsto (c L) sourceFilter (𝓝 (a L)))
    (ha : Tendsto a atTop (𝓝 s))
    (hle : ∀ L, ∀ᶠ i in sourceFilter, c L i ≤ t i) : s ≤ e :=
  le_of_tendsto' ha (fun L => le_of_tendsto_of_tendsto (hc L) ht (hle L))

/-- An eventually small remainder in the iterated sense gives energy equality. -/
theorem totalEnergy_eq_accountedEnergy
    (ht : Tendsto t sourceFilter (𝓝 e))
    (hc : ∀ L, Tendsto (c L) sourceFilter (𝓝 (a L)))
    (ha : Tendsto a atTop (𝓝 s))
    (hle : ∀ L, ∀ᶠ i in sourceFilter, c L i ≤ t i)
    (hsmall : ∀ ε : ℝ, 0 < ε → ∀ᶠ L in atTop, ∀ᶠ i in sourceFilter, t i - c L i ≤ ε) :
    e = s := by
  have hOuter : Tendsto (fun L => e - a L) atTop (𝓝 (e - s)) :=
    tendsto_const_nhds.sub ha
  have hGapBound (ε : ℝ) (hε : 0 < ε) : e - s ≤ ε := by
    apply le_of_tendsto hOuter
    filter_upwards [hsmall ε hε] with L hL
    exact le_of_tendsto (tendstoAccountingRemainder ht hc L) hL
  have hGapNonpos : e - s ≤ 0 := by
    by_contra! hGap
    exact (not_le_of_gt (half_lt_self hGap)) (hGapBound _ (half_pos hGap))
  exact le_antisymm (sub_nonpos.mp hGapNonpos) (accountedEnergy_le_totalEnergy ht hc ha hle)

end FirstOrderTwistor
