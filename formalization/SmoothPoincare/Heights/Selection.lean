import Mathlib.Probability.Distributions.Bernoulli
import Mathlib.Tactic.Linarith

/-! # Selection by the mean middle-index count

The measure, count, and regular set are supplied. The indexed Gauss identity and
smooth handle-theoretic count floor enter applications as separate premises.
-/

open MeasureTheory Set

namespace SmoothPoincare

variable {Ω : Type*} [MeasurableSpace Ω]

/-- For an integer-valued count with almost-sure floor two, the mean excess over
    two bounds the probability of failure to have exactly two. -/
theorem prob_twoMiddle_lower_bound (μ : Measure Ω) [IsProbabilityMeasure μ] (m : Ω → ℕ)
    (hm : Measurable m) (hmInt : Integrable (fun u => (m u : ℝ)) μ)
    (hfloor : ∀ᵐ u ∂μ, 2 ≤ m u) :
    3 - (∫ u, (m u : ℝ) ∂μ) ≤ μ.real {u | m u = 2} := by
  classical
  let s : Set Ω := {u | m u = 2}
  have hs : MeasurableSet s := hm (measurableSet_singleton 2)
  let bad : Ω → ℝ := sᶜ.indicator (fun _ => 1)
  have hbadInt : Integrable bad μ := (integrable_const (1 : ℝ)).indicator hs.compl
  have hpoint : ∀ᵐ u ∂μ, (fun _ : Ω => (2 : ℝ)) u + bad u ≤ (m u : ℝ) := by
    filter_upwards [hfloor] with u hu
    by_cases heq : m u = 2
    · simp [bad, s, heq]
    · have hthree : 2 + 1 ≤ m u := by omega
      have hthreeReal : (2 : ℝ) + 1 ≤ (m u : ℝ) := by exact_mod_cast hthree
      simpa [bad, s, heq] using hthreeReal
  have hmean := integral_mono_ae ((integrable_const (2 : ℝ)).add hbadInt) hmInt hpoint
  simp only [Pi.add_apply] at hmean
  rw [integral_add (integrable_const (2 : ℝ)) hbadInt] at hmean
  have hbadIntegral : (∫ u, bad u ∂μ) = μ.real sᶜ := by
    simp [bad, integral_indicator_const, hs.compl]
  rw [hbadIntegral] at hmean
  have hmass := measureReal_add_measureReal_compl (μ := μ) hs
  simp only [integral_const, probReal_univ, one_smul] at hmean
  rw [probReal_univ] at hmass
  change 3 - (∫ u, (m u : ℝ) ∂μ) ≤ μ.real s
  linarith

/-- A mean count strictly below nine quarters gives probability strictly above
    three quarters of having exactly two middle-index points. -/
theorem prob_twoMiddle_gt_threeQuarters (μ : Measure Ω) [IsProbabilityMeasure μ] (m : Ω → ℕ)
    (hm : Measurable m) (hmInt : Integrable (fun u => (m u : ℝ)) μ)
    (hfloor : ∀ᵐ u ∂μ, 2 ≤ m u) (hmean : (∫ u, (m u : ℝ) ∂μ) < (9/4 : ℝ)) :
    (3/4 : ℝ) < μ.real {u | m u = 2} := by
  have hlower := prob_twoMiddle_lower_bound μ m hm hmInt hfloor
  linarith

/-- The event with exactly two middle-index points retains its mass on a
    specified conull regular set. -/
theorem prob_regular_twoMiddle_eq (μ : Measure Ω) (m : Ω → ℕ) (regular : Set Ω)
    (hregular : ∀ᵐ u ∂μ, u ∈ regular) :
    μ.real {u | u ∈ regular ∧ m u = 2} = μ.real {u | m u = 2} := by
  apply measureReal_congr
  filter_upwards [hregular] with u hu
  simp [hu]

/-- Select a direction in the supplied regular set. A family of data indexed by
    direction is taken at that same direction, with its availability supplied
    for the regular two-count directions. -/
theorem exists_regular_twoMiddle_with_data (μ : Measure Ω) [IsProbabilityMeasure μ] (m : Ω → ℕ)
    (hm : Measurable m) (hmInt : Integrable (fun u => (m u : ℝ)) μ)
    (hfloor : ∀ᵐ u ∂μ, 2 ≤ m u) (hmean : (∫ u, (m u : ℝ) ∂μ) < (9/4 : ℝ))
    (regular : Set Ω) (hregular : ∀ᵐ u ∂μ, u ∈ regular) (Data : Ω → Type*)
    (hdata : ∀ u ∈ regular, m u = 2 → Nonempty (Data u)) :
    ∃ u, u ∈ regular ∧ m u = 2 ∧ Nonempty (Data u) := by
  have hprob : (3/4 : ℝ) < μ.real {u | u ∈ regular ∧ m u = 2} := by
    rw [prob_regular_twoMiddle_eq μ m regular hregular]
    exact prob_twoMiddle_gt_threeQuarters μ m hm hmInt hfloor hmean
  have hne : ({u | u ∈ regular ∧ m u = 2} : Set Ω).Nonempty := by
    by_contra! hempty
    rw [hempty, measureReal_empty] at hprob
    norm_num at hprob
  obtain ⟨u, hu, hcount⟩ := hne
  exact ⟨u, hu, hcount, hdata u hu hcount⟩

/-- Keep both supplied curvature costs in a normalized scalar budget. In the
    immersion formula the scale is `4ω/3` and the energy variable is the total
    excess above `8ω/3`. -/
theorem prob_twoMiddle_lower_of_defect_budget (μ : Measure Ω) [IsProbabilityMeasure μ]
    (m : Ω → ℕ) (hm : Measurable m) (hmInt : Integrable (fun u => (m u : ℝ)) μ)
    (hfloor : ∀ᵐ u ∂μ, 2 ≤ m u) (excess offMiddle weylDefect scale : ℝ) (hscale : 0 < scale)
    (hbudget : offMiddle + weylDefect + scale * ((∫ u, (m u : ℝ) ∂μ) - 2) ≤ excess) :
    1 - (excess - offMiddle - weylDefect) / scale ≤ μ.real {u | m u = 2} := by
  have hmean : (∫ u, (m u : ℝ) ∂μ) - 2 ≤ (excess - offMiddle - weylDefect) / scale := by
    apply (le_div_iff₀ hscale).2
    rw [mul_comm]
    linarith
  have hlower := prob_twoMiddle_lower_bound μ m hm hmInt hfloor
  linarith

/-- The strict implication is sharp. This probability law puts mass three
    quarters at count two and the remaining quarter at count three. -/
theorem twoMiddle_probability_boundary :
    ∃ μ : Measure ℕ, IsProbabilityMeasure μ ∧ Integrable (fun u : ℕ => (u : ℝ)) μ ∧
      (∀ᵐ u ∂μ, 2 ≤ u) ∧ (∫ u : ℕ, (u : ℝ) ∂μ) = (9/4 : ℝ) ∧
      μ.real {u : ℕ | u = 2} = (3/4 : ℝ) ∧ μ.real {u : ℕ | u = 3} = (1/4 : ℝ) := by
  let p : Set.Icc (0 : ℝ) 1 := ⟨3/4, by constructor <;> norm_num⟩
  refine ⟨ProbabilityTheory.bernoulliMeasure 2 3 p, inferInstance,
    ProbabilityTheory.integrable_bernoulliMeasure 2 3 p _, ?_, ?_, ?_, ?_⟩
  · rw [ae_iff]
    exact ProbabilityTheory.bernoulliMeasure_apply_of_notMem_of_notMem p
      (Set.to_countable _).measurableSet (by simp) (by simp)
  · rw [ProbabilityTheory.integral_bernoulliMeasure]
    norm_num [p]
  · exact ProbabilityTheory.bernoulliMeasure_real_apply_of_mem_of_notMem p
      (measurableSet_singleton 2) (by simp) (by simp)
  · calc
      _ = 1 - (p : ℝ) := ProbabilityTheory.bernoulliMeasure_real_apply_of_notMem_of_mem p
        (measurableSet_singleton 3) (by simp) (by simp)
      _ = _ := by norm_num [p]

end SmoothPoincare
