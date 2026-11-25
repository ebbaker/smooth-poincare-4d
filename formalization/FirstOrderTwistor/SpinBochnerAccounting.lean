import FirstOrderTwistor.SpinCutoffCover

/-!
# Physical energy accounting from the summed Bochner budgets

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex
assistance. The serving model and effort are unavailable. Uses the
MATCH-E11 summed relative Bochner bound and Route 02 accounting from
checkout 5ff7014.

At each truncation and source index, the total curvature budget is bounded.
Ricci, the relative fourth-power gradient and cutoff budgets are separately
small in the iterated sense. The cover, comparison of physical measures,
and upper estimate for the summed local costs are supplied.
-/

open Filter MeasureTheory Set Topology
open scoped BigOperators

namespace FirstOrderTwistor

/-- Independent bounds on the summed Ricci, curvature, relative fourth-power
gradient, and cutoff budgets imply smallness of the combined Bochner bound.
The truncation index is outer and the source index is inner. -/
theorem spinBochnerBudget_eventuallySmall
    {R K V cutoff : ℕ → ℕ → ℝ} {C K₀ : ℝ}
    (hC : 0 ≤ C) (hK₀ : 0 ≤ K₀)
    (hK : ∀ᶠ L in atTop, ∀ᶠ i in atTop, 0 ≤ K L i ∧ K L i ≤ K₀)
    (hR : ∀ δ : ℝ, 0 < δ → ∀ᶠ L in atTop, ∀ᶠ i in atTop, 0 ≤ R L i ∧ R L i ≤ δ)
    (hV : ∀ δ : ℝ, 0 < δ → ∀ᶠ L in atTop, ∀ᶠ i in atTop, 0 ≤ V L i ∧ V L i ≤ δ)
    (hCutoff : ∀ δ : ℝ, 0 < δ → ∀ᶠ L in atTop, ∀ᶠ i in atTop,
      0 ≤ cutoff L i ∧ cutoff L i ≤ δ) :
    ∀ ε : ℝ, 0 < ε → ∀ᶠ L in atTop, ∀ᶠ i in atTop,
      0 ≤ C * (R L i + Real.sqrt (K L i * V L i) + V L i + cutoff L i) ∧
      C * (R L i + Real.sqrt (K L i * V L i) + V L i + cutoff L i) ≤ ε := by
  intro ε hε
  let t := ε / (4 * (C + 1))
  let s := min t (t ^ 2 / (K₀ + 1))
  have hKplus : 0 < K₀ + 1 := by positivity
  have hCplus : 0 < C + 1 := by positivity
  have ht : 0 < t := div_pos hε (by positivity)
  have hs : 0 < s := lt_min ht (div_pos (pow_pos ht _) hKplus)
  filter_upwards [hK, hR t ht, hV s hs, hCutoff t ht] with L hKL hRL hVL hCutoffL
  filter_upwards [hKL, hRL, hVL, hCutoffL] with i hKi hRi hVi hCutoffi
  have hVt : V L i ≤ t := hVi.2.trans (min_le_left _ _)
  have hVmix : V L i ≤ t ^ 2 / (K₀ + 1) := hVi.2.trans (min_le_right _ _)
  have hMixSq : K L i * V L i ≤ t ^ 2 := calc
    _ ≤ (K₀ + 1) * V L i :=
      mul_le_mul_of_nonneg_right (hKi.2.trans (le_add_of_nonneg_right zero_le_one)) hVi.1
    _ ≤ (K₀ + 1) * (t ^ 2 / (K₀ + 1)) := mul_le_mul_of_nonneg_left hVmix hKplus.le
    _ = t ^ 2 := mul_div_cancel₀ _ hKplus.ne'
  have hMix : Real.sqrt (K L i * V L i) ≤ t := (Real.sqrt_le_sqrt hMixSq).trans_eq
    (Real.sqrt_sq ht.le)
  have hSum : R L i + Real.sqrt (K L i * V L i) + V L i + cutoff L i ≤ 4 * t := by
    linarith only [hRi.2, hCutoffi.2, hVt, hMix]
  refine ⟨mul_nonneg hC
    (add_nonneg (add_nonneg (add_nonneg hRi.1 (Real.sqrt_nonneg _)) hVi.1) hCutoffi.1), ?_⟩
  calc
    _ ≤ C * (4 * t) := mul_le_mul_of_nonneg_left hSum hC
    _ ≤ (C + 1) * (4 * t) :=
      mul_le_mul_of_nonneg_right (le_add_of_nonneg_right zero_le_one) (by positivity)
    _ = ε := by
      dsimp [t]
      rw [← mul_assoc, mul_comm (C + 1) 4, mul_div_cancel₀ ε (by positivity : 4 * (C + 1) ≠ 0)]

/-- The combined Bochner budgets control the sum of local cutoff costs.
Physical energy on the covered residual is bounded by this sum, and the
uncovered physical mass is a separate small quantity. These inputs give
the Route 02 energy equality. -/
theorem energyIdentityOfSpinBochnerBudgets {X ι κ : Type*} [MeasurableSpace X]
    {μ : ℕ → Measure X} [∀ i, IsFiniteMeasure (μ i)] {J : Finset ι}
    {Y : ι → Type*} [∀ j, MeasurableSpace (Y j)] {e : ℝ}
    (F : TruncationFamily μ J Y) (P : ℕ → ℕ → Set X) (patches : ℕ → ℕ → Finset κ)
    (weight : κ → ℕ → ℕ → X → ℝ) (cost : κ → ℕ → ℕ → ℝ)
    (ht : Tendsto (fun i => (μ i).real univ) atTop (𝓝 e))
    (hCovers : ∀ᶠ L in atTop, ∀ᶠ i in atTop,
      P L i ⊆ F.remainder L i ∧
      (∀ᵐ x ∂(μ i).restrict (P L i), 1 ≤ ∑ j ∈ patches L i, weight j L i x) ∧
      (∀ j ∈ patches L i, IntegrableOn (weight j L i) (F.remainder L i) (μ i) ∧
        (0 ≤ᵐ[(μ i).restrict (F.remainder L i)] weight j L i) ∧
        (∫ x in F.remainder L i, weight j L i x ∂(μ i)) ≤ cost j L i))
    {R K V cutoff : ℕ → ℕ → ℝ} {C K₀ : ℝ}
    (hBudget : ∀ᶠ L in atTop, ∀ᶠ i in atTop, (∑ j ∈ patches L i, cost j L i) ≤
      C * (R L i + Real.sqrt (K L i * V L i) + V L i + cutoff L i))
    (hC : 0 ≤ C) (hK₀ : 0 ≤ K₀)
    (hK : ∀ᶠ L in atTop, ∀ᶠ i in atTop, 0 ≤ K L i ∧ K L i ≤ K₀)
    (hR : ∀ δ : ℝ, 0 < δ → ∀ᶠ L in atTop, ∀ᶠ i in atTop, 0 ≤ R L i ∧ R L i ≤ δ)
    (hV : ∀ δ : ℝ, 0 < δ → ∀ᶠ L in atTop, ∀ᶠ i in atTop, 0 ≤ V L i ∧ V L i ≤ δ)
    (hCutoff : ∀ δ : ℝ, 0 < δ → ∀ᶠ L in atTop, ∀ᶠ i in atTop,
      0 ≤ cutoff L i ∧ cutoff L i ≤ δ)
    (hUncovered : ∀ ε : ℝ, 0 < ε → ∀ᶠ L in atTop, ∀ᶠ i in atTop,
      (μ i).real (F.remainder L i \ P L i) ≤ ε) :
    e = ∑ j ∈ J, F.componentEnergy j := by
  have hSum (ε : ℝ) (hε : 0 < ε) :
      ∀ᶠ L in atTop, ∀ᶠ i in atTop, (∑ j ∈ patches L i, cost j L i) ≤ ε := by
    filter_upwards [hBudget, spinBochnerBudget_eventuallySmall hC hK₀ hK hR hV hCutoff ε hε]
      with L hBudgetL hSmallL
    filter_upwards [hBudgetL, hSmallL] with i hBudgeti hSmalli
    exact hBudgeti.trans hSmalli.2
  exact energyIdentityOfCoveredRemainder F
    (RemainderEstimates.ofSpinCutoffCover F P patches weight cost hCovers hSum hUncovered) ht

end FirstOrderTwistor
