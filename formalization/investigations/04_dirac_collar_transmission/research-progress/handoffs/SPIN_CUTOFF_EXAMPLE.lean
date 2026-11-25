import FirstOrderTwistor.SpinCutoffCover

/-!
# A cover by two fractional weights

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex
assistance. The serving model and effort are unavailable. Input checkout
`5ff7014` with the E18j cutoff-cover proof and pinned Lean dependencies.

Both weights equal one half on the covered region and vanish elsewhere.
Their integrals together charge the covered mass, and the remainder
outside that region appears once.
-/

open FirstOrderTwistor Filter MeasureTheory Set
open scoped BigOperators

namespace SpinCutoffExample

private theorem twoHalfWeightCover {X : Type*} [MeasurableSpace X]
    (μ : Measure X) [IsFiniteMeasure μ] {R P : Set X}
    (hP : MeasurableSet P) (hSubset : P ⊆ R) :
    (μ.real R ≤ μ.real (R \ P) + ∑ _ ∈ (Finset.univ : Finset Bool), μ.real P / 2) ∧
      (∑ _ ∈ (Finset.univ : Finset Bool), μ.real P / 2) = μ.real P := by
  let weight : X → ℝ := P.indicator (fun _ => 1 / 2)
  have hIntegrable : IntegrableOn weight R μ := by
    dsimp only [weight]
    rw [IntegrableOn, integrable_indicator_iff hP, IntegrableOn,
      Measure.restrict_restrict hP, inter_eq_left.mpr hSubset]
    exact integrable_const _
  have hNonneg : 0 ≤ᵐ[μ.restrict R] weight := by
    apply ae_of_all
    intro x
    by_cases hx : x ∈ P <;> norm_num [weight, hx]
  have hCover : ∀ᵐ x ∂μ.restrict P, 1 ≤ ∑ _ ∈ (Finset.univ : Finset Bool), weight x := by
    filter_upwards [ae_restrict_mem hP] with x hx
    norm_num [weight, hx, Fintype.sum_bool]
  have hCost : (∫ x in R, weight x ∂μ) = μ.real P / 2 := by
    dsimp only [weight]
    rw [integral_indicator hP, Measure.restrict_restrict hP,
      inter_eq_left.mpr hSubset]
    change (∫ _ in P, (1 : ℝ) / 2 ∂μ) = μ.real P / 2
    simp [smul_eq_mul, div_eq_mul_inv]
  refine ⟨spinCutoffRemainderMass_le_uncovered_add_cost μ hP hSubset
    (Finset.univ : Finset Bool) (fun _ => weight) (fun _ => μ.real P / 2)
    (fun _ _ => hIntegrable) (fun _ _ => hNonneg) hCover (fun _ _ => hCost.le), ?_⟩
  simp
  ring

#print axioms twoHalfWeightCover

end SpinCutoffExample
