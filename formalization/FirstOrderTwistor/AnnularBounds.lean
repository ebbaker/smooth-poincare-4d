import Mathlib.Tactic.Positivity
import Mathlib.Topology.Instances.Real.Lemmas
import Mathlib.Topology.Order.LiminfLimsup

open Filter
open scoped Topology

namespace FirstOrderTwistor

/-- At one fixed trimming scale, a real limsup bound is equivalent to every
strictly larger threshold being an eventual upper bound. -/
theorem annularLimsup_le_iff {energy : ℕ → ℝ} {a : ℝ}
    (hnonneg : ∀ᶠ i in atTop, 0 ≤ energy i)
    (hbounded : atTop.IsBoundedUnder (· ≤ ·) energy) :
    limsup energy atTop ≤ a ↔ ∀ b > a, ∀ᶠ i in atTop, energy i ≤ b :=
  limsup_le_iff' (isCoboundedUnder_le_of_eventually_le atTop hnonneg) hbounded

/-- The inner limsup is taken at fixed `L`. Its upper bound may depend on `L`.
Only the eventual outer tail needs boundedness and nonnegativity. -/
theorem annularSmallness_iff_tendsto_limsup {energy : ℕ → ℕ → ℝ}
    (hnonneg : ∀ᶠ L in atTop, ∀ᶠ i in atTop, 0 ≤ energy L i)
    (hbounded : ∀ᶠ L in atTop, atTop.IsBoundedUnder (· ≤ ·) (energy L)) :
    (∀ ε > 0, ∀ᶠ L in atTop, ∀ᶠ i in atTop, energy L i ≤ ε) ↔
      Tendsto (fun L => limsup (energy L) atTop) atTop (𝓝 0) := by
  constructor
  · intro hsmall
    refine tendsto_order.2 ⟨fun a ha => ?_, fun a ha => ?_⟩
    · filter_upwards [hnonneg, hbounded] with L hL hboundedL
      exact ha.trans_le (le_limsup_of_frequently_le hL.frequently hboundedL)
    · filter_upwards [hnonneg, hsmall (a / 2) (half_pos ha)] with L hL haL
      exact (limsup_le_of_le (isCoboundedUnder_le_of_eventually_le atTop hL) haL).trans_lt
        (half_lt_self ha)
  · intro hlim ε hε
    filter_upwards [(tendsto_order.1 hlim).2 ε hε, hbounded] with L hL hboundedL
    exact (eventually_lt_of_limsup_lt hL hboundedL).mono fun _ hi => hi.le

/-- Scalar consequence of SEC `msneck:annulus-bound` on supplied buffered charts.
`C`, `K₀`, and `B₀` are uniform, while the inner tail can depend on `L`. -/
theorem noNeckOfSuppliedCharts {energy deviation hessian bach : ℕ → ℕ → ℝ}
    {C K₀ B₀ : ℝ} (hC : 0 ≤ C) (hK₀ : 0 ≤ K₀) (hB₀ : 0 ≤ B₀)
    (hcontrol : ∀ᶠ L in atTop, ∀ᶠ i in atTop,
      0 ≤ deviation L i ∧ 0 ≤ hessian L i ∧ hessian L i ≤ K₀ ∧ bach L i ≤ B₀)
    (hbound : ∀ᶠ L in atTop, ∀ᶠ i in atTop,
      energy L i ≤ C * deviation L i *
        (bach L i + (hessian L i + deviation L i) * (1 + deviation L i * hessian L i)))
    (hdeviation : ∀ δ > 0, ∀ᶠ L in atTop, ∀ᶠ i in atTop, deviation L i ≤ δ) :
    ∀ ε > 0, ∀ᶠ L in atTop, ∀ᶠ i in atTop, energy L i ≤ ε := by
  intro ε hε
  let bracket := B₀ + (K₀ + 1) * (1 + K₀)
  let M := C * bracket + 1
  have hbracket : 0 ≤ bracket := by dsimp [bracket]; positivity
  have hM : 0 < M := by dsimp [M]; positivity
  have hCM : C * bracket ≤ M := le_add_of_nonneg_right zero_le_one
  have hδ : 0 < min 1 (ε / M) := lt_min zero_lt_one (div_pos hε hM)
  filter_upwards [hcontrol, hbound, hdeviation _ hδ] with L hcontrolL hboundL hdevL
  filter_upwards [hcontrolL, hboundL, hdevL] with i hcontroli hboundi hdevi
  obtain ⟨hdev, hK, hKupper, hBupper⟩ := hcontroli
  have hdevOne : deviation L i ≤ 1 := hdevi.trans (min_le_left _ _)
  have hdevK : deviation L i * hessian L i ≤ K₀ := by
    calc
      deviation L i * hessian L i ≤ 1 * hessian L i := mul_le_mul_of_nonneg_right hdevOne hK
      _ ≤ K₀ := by simpa only [one_mul] using hKupper
  have hbracketUpper :
      bach L i + (hessian L i + deviation L i) * (1 + deviation L i * hessian L i) ≤
        bracket :=
    add_le_add hBupper (mul_le_mul (add_le_add hKupper hdevOne)
      (add_le_add_right hdevK 1) (by positivity) (by positivity))
  calc
    energy L i ≤ C * deviation L i * bracket :=
      hboundi.trans (mul_le_mul_of_nonneg_left hbracketUpper (mul_nonneg hC hdev))
    _ = deviation L i * (C * bracket) := by rw [mul_comm C, mul_assoc]
    _ ≤ deviation L i * M := mul_le_mul_of_nonneg_left hCM hdev
    _ ≤ ε := (le_div_iff₀ hM).mp (hdevi.trans (min_le_right _ _))

/-- Scalar consequence of SEC `msneck:neck` with a weight covering the trimmed
region. `weyl` is the buffered Weyl `L²` norm and `defect` is the weighted
derivative defect. -/
theorem noNeckOfSuppliedField {energy transverse weyl bach defect : ℕ → ℕ → ℝ}
    {Λ₀ W₀ : ℝ} (hΛ₀ : 0 ≤ Λ₀) (hW₀ : 0 ≤ W₀)
    (hcontrol : ∀ᶠ L in atTop, ∀ᶠ i in atTop,
      transverse L i ≤ Λ₀ ∧ weyl L i ≤ W₀ ∧ 0 ≤ bach L i ∧ 0 ≤ defect L i)
    (hbound : ∀ᶠ L in atTop, ∀ᶠ i in atTop,
      energy L i ≤ 8 * transverse L i * bach L i + 4 * weyl L i * defect L i)
    (hbach : ∀ δ > 0, ∀ᶠ L in atTop, ∀ᶠ i in atTop, bach L i ≤ δ)
    (hdefect : ∀ δ > 0, ∀ᶠ L in atTop, ∀ᶠ i in atTop, defect L i ≤ δ) :
    ∀ ε > 0, ∀ᶠ L in atTop, ∀ᶠ i in atTop, energy L i ≤ ε := by
  intro ε hε
  let M := 8 * Λ₀ + 4 * W₀ + 1
  have hM : 0 < M := by dsimp [M]; positivity
  have hδ : 0 < ε / M := div_pos hε hM
  filter_upwards [hcontrol, hbound, hbach _ hδ, hdefect _ hδ] with L hcontrolL hboundL hbachL hdefectL
  filter_upwards [hcontrolL, hboundL, hbachL, hdefectL] with i hcontroli hboundi hbachd hdefectd
  obtain ⟨hΛ, hW, hB, hD⟩ := hcontroli
  have hBterm : 8 * transverse L i * bach L i ≤ 8 * Λ₀ * (ε / M) :=
    mul_le_mul (mul_le_mul_of_nonneg_left hΛ (by positivity)) hbachd hB (by positivity)
  have hDterm : 4 * weyl L i * defect L i ≤ 4 * W₀ * (ε / M) :=
    mul_le_mul (mul_le_mul_of_nonneg_left hW (by positivity)) hdefectd hD (by positivity)
  calc
    energy L i ≤ 8 * Λ₀ * (ε / M) + 4 * W₀ * (ε / M) :=
      hboundi.trans (add_le_add hBterm hDterm)
    _ = (8 * Λ₀ + 4 * W₀) * (ε / M) := (add_mul ..).symm
    _ ≤ M * (ε / M) := mul_le_mul_of_nonneg_right (le_add_of_nonneg_right zero_le_one) hδ.le
    _ = ε := mul_div_cancel₀ ε hM.ne'

end FirstOrderTwistor
