import SmoothPoincare

/-! Exact Edition 03 opening interfaces, checked through the public import. -/
open Filter MeasureTheory
open scoped BigOperators

example : ∀ (A : Set ℝ) (e m₁ m₂ E₁ E₂ γ₁ γ₂ : ℝ),
  BddBelow A → m₁ + m₂ = e →
  E₁ ≤ m₁ + γ₁ → E₂ ≤ m₂ + γ₂ → (E₁ ∈ A ∨ E₂ ∈ A) →
  ((E₁ ∈ A ∧ m₂ ≤ e - sInf A + γ₁) ∨
   (E₂ ∈ A ∧ m₁ ≤ e - sInf A + γ₂)) := @SmoothPoincare.discardedMass_le_excess
#check SmoothPoincare.discardedMass_le_excess
#print axioms SmoothPoincare.discardedMass_le_excess

example : ∀ (J : Finset ℕ) (A : Set ℝ) (e : ℝ) (m γ c : ℕ → ℝ),
  BddBelow A → e ∈ A →
  (∀ j ∈ J, c j ∈ A) → (∀ j ∈ J, c j ≤ e - m j + γ j) →
  (∑ j ∈ J, m j) ≤ (J.card : ℝ) * (e - sInf A) + ∑ j ∈ J, γ j := @SmoothPoincare.repairedMass_le_excess_sum
#check SmoothPoincare.repairedMass_le_excess_sum
#print axioms SmoothPoincare.repairedMass_le_excess_sum

example : ∀ (n : ℕ) (m : Fin n → ℝ) (C : ℝ), 0 < n →
  (∀ j, 0 ≤ m j) → (∑ j, m j) ≤ C →
  ∃ j, m j ≤ C / (n : ℝ) := @SmoothPoincare.exists_annulusMass_le_average
#check SmoothPoincare.exists_annulusMass_le_average
#print axioms SmoothPoincare.exists_annulusMass_le_average

example : ∀ (e cost rem : ℕ → ℝ) (N : ℕ → ℕ) (K : ℕ) (I b ω : ℝ),
  Tendsto e atTop (nhds I) →
  (∀ᶠ i in atTop, N i ≤ K ∧ I ≤ e i ∧
    e i ≤ (N i : ℝ) * (e i - I) + cost i + rem i) →
  (∀ ε : ℝ, 0 < ε →
    ∀ᶠ i in atTop, cost i ≤ b + ε ∧ rem i ≤ ω + ε) →
  I ≤ b + ω := @SmoothPoincare.energyBoundOfRepairFamily
#check SmoothPoincare.energyBoundOfRepairFamily
#print axioms SmoothPoincare.energyBoundOfRepairFamily

example : ∀ a b c d : ℝ, 0 < a → 0 < b → 0 < c → 0 < d →
  let s₁ := a*b + c*d
  let s₂ := -(a*c + b*d)
  let s₃ := -(a*d + b*c)
  let w := ((s₁-s₂)^2 + (s₁-s₃)^2 + (s₂-s₃)^2) / 12
  let t := (8/3 : ℝ) * (a*b*c*d)
  t ≤ w ∧ (w = t ↔ a = b ∧ b = c ∧ c = d) := @SmoothPoincare.middleSignatureWeylBound
#check SmoothPoincare.middleSignatureWeylBound
#print axioms SmoothPoincare.middleSignatureWeylBound

example : ∀ {Ω : Type*} [MeasurableSpace Ω] (μ : Measure Ω)
    [IsProbabilityMeasure μ] (m : Ω → ℕ),
  Measurable m → Integrable (fun u => (m u : ℝ)) μ →
  (∀ᵐ u ∂μ, 2 ≤ m u) →
  (∫ u, (m u : ℝ) ∂μ) < (9/4 : ℝ) →
  (3/4 : ℝ) < μ.real {u | m u = 2} := @SmoothPoincare.prob_twoMiddle_gt_threeQuarters
#check SmoothPoincare.prob_twoMiddle_gt_threeQuarters
#print axioms SmoothPoincare.prob_twoMiddle_gt_threeQuarters
