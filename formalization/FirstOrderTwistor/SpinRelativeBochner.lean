import Mathlib.Analysis.Real.Sqrt
import Mathlib.Analysis.SpecificLimits.Basic
import Mathlib.MeasureTheory.Function.L2Space
import Mathlib.MeasureTheory.Integral.DominatedConvergence

/-!
# Relative Bochner integrals

FOT-E18j, prepared for Edward B. Baker III on 2026-11-25 with OpenAI Codex
assistance. Serving model and reasoning effort are unavailable. Inputs at
intake HEAD 5ff7014 with concurrent manuscript edits: MATCH-E11 (e249e29f8b64) and the relative Bochner proposition
of *Dirac transmission on marked collars* (ae7a523d348f).

The integrated regularized inequality is an input from the covector-twisted
Dirac square and the projected chiral curl. Here the powers and cutoffs
act on supplied measured scalar densities. Each measure in the finite
sum can come from its own metric.
-/

open Filter MeasureTheory
open scoped BigOperators Topology ENNReal

namespace FirstOrderTwistor

private theorem spinRatio_nonneg_le_one {mass ε : ℝ} (hmass : 0 ≤ mass) (hε : 0 < ε) :
    0 ≤ mass / (mass + ε) ∧ mass / (mass + ε) ≤ 1 := by
  refine ⟨div_nonneg hmass (by linarith), ?_⟩
  exact (div_le_one (by linarith : 0 < mass + ε)).mpr (by linarith)

/-- The regularized Weyl integrals converge when the density vanishes
outside the almost-everywhere positivity set of the joint spinor mass. -/
theorem spinCutoff_fraction_integrals_tendsto {X : Type*} [MeasurableSpace X]
    (μ : Measure X) (mass energy : X → ℝ)
    (hmass : Measurable mass) (henergy : Integrable energy μ)
    (hmass_nonneg : ∀ᵐ x ∂μ, 0 ≤ mass x) (henergy_nonneg : ∀ᵐ x ∂μ, 0 ≤ energy x)
    (hpositive : ∀ᵐ x ∂μ, 0 < mass x ∨ energy x = 0) :
    Tendsto (fun n : ℕ => ∫ x, energy x * (mass x / (mass x + 1 / ((n : ℝ) + 1))) ∂μ)
      atTop (𝓝 (∫ x, energy x ∂μ)) := by
  apply tendsto_integral_of_dominated_convergence energy
  · intro n
    exact henergy.aestronglyMeasurable.mul
      (hmass.div (hmass.add measurable_const)).aestronglyMeasurable
  · exact henergy
  · intro n
    filter_upwards [hmass_nonneg, henergy_nonneg] with x hx he
    obtain ⟨hr₀, hr₁⟩ := spinRatio_nonneg_le_one hx (show 0 < 1 / ((n : ℝ) + 1) by positivity)
    rw [Real.norm_of_nonneg (mul_nonneg he hr₀)]
    exact mul_le_of_le_one_right he hr₁
  · filter_upwards [hpositive] with x hx
    rcases hx with hx | hx
    · have hzero : Tendsto (fun n : ℕ => (1 : ℝ) / ((n : ℝ) + 1)) atTop (𝓝 0) :=
        tendsto_one_div_add_atTop_nhds_zero_nat
      have hden : Tendsto (fun n : ℕ => mass x + 1 / ((n : ℝ) + 1)) atTop (𝓝 (mass x)) := by
        simpa only [add_zero] using tendsto_const_nhds.add hzero
      have hconstant : Tendsto (fun _ : ℕ => mass x) atTop (𝓝 (mass x)) := tendsto_const_nhds
      have hratio : Tendsto (fun n : ℕ => mass x / (mass x + 1 / ((n : ℝ) + 1))) atTop (𝓝 1) := by
        have h := hconstant.div hden hx.ne'
        change Tendsto (fun n : ℕ => mass x / (mass x + 1 / ((n : ℝ) + 1)))
          atTop (𝓝 (mass x / mass x)) at h
        simpa only [div_self hx.ne'] using h
      have he : Tendsto (fun _ : ℕ => energy x) atTop (𝓝 (energy x)) := tendsto_const_nhds
      have h := he.mul hratio
      change Tendsto (fun n : ℕ => energy x * (mass x / (mass x + 1 / ((n : ℝ) + 1))))
        atTop (𝓝 (energy x * 1)) at h
      simpa only [mul_one] using h
    · simp [hx]

/-- Remove the joint spinor floor in the finite-integral case. The
cutoff and its differential vanish outside the measured cutoff support.
The positive mass condition is almost everywhere on that support.
`gradientSq / mass` is the relative squared first derivative. -/
theorem spinRelativeBochner_bound {X : Type*} [MeasurableSpace X]
    (μ : Measure X) (region cutoffSupport : Set X)
    (cutoff cutoffGradient mass gradientSq weyl ricci curvature : X → ℝ)
    (hcutoff : Measurable cutoff) (hcutoffGradient : Measurable cutoffGradient)
    (hmass : Measurable mass) (hgradientSq : Measurable gradientSq)
    (hricci : Measurable ricci) (hcurvature : Measurable curvature)
    {C : ℝ} (hC : 0 ≤ C)
    (hsupport : ∀ x ∉ cutoffSupport, cutoff x = 0 ∧ cutoffGradient x = 0) :
    let ν := μ.restrict region
    let relativeSq (x : X) := gradientSq x / mass x
    (∀ᵐ x ∂ν, 0 ≤ mass x ∧ 0 ≤ gradientSq x ∧ 0 ≤ curvature x) →
    (∀ᵐ x ∂ν, x ∈ cutoffSupport → 0 < mass x) →
    Integrable (fun x => cutoff x ^ 2 * weyl x ^ 2) ν →
    Integrable (fun x => cutoff x ^ 2 * ricci x ^ 2) ν →
    Integrable (fun x => cutoff x ^ 2 * curvature x * relativeSq x) ν →
    Integrable (fun x => cutoff x ^ 2 * relativeSq x ^ 2) ν →
    Integrable (fun x => cutoffGradient x ^ 2 * relativeSq x) ν →
    (∀ ε : ℝ, 0 < ε →
      (∫ x, cutoff x ^ 2 * weyl x ^ 2 * (mass x / (mass x + ε)) ∂ν) ≤
        C * ∫ x, cutoff x ^ 2 * ricci x ^ 2 * (mass x / (mass x + ε)) +
          cutoff x ^ 2 * curvature x * (gradientSq x / (mass x + ε)) +
          cutoff x ^ 2 * (gradientSq x / (mass x + ε)) ^ 2 +
          cutoffGradient x ^ 2 * (gradientSq x / (mass x + ε)) ∂ν) →
    (∫ x, cutoff x ^ 2 * weyl x ^ 2 ∂ν) ≤
      C * ((∫ x, cutoff x ^ 2 * ricci x ^ 2 ∂ν) +
        (∫ x, cutoff x ^ 2 * curvature x * relativeSq x ∂ν) +
        (∫ x, cutoff x ^ 2 * relativeSq x ^ 2 ∂ν) +
        (∫ x, cutoffGradient x ^ 2 * relativeSq x ∂ν)) := by
  intro ν relativeSq hnonneg hpositive hW hRic hMixed hRelative hGradient hBochner
  let budget (x : X) := cutoff x ^ 2 * ricci x ^ 2 +
    cutoff x ^ 2 * curvature x * relativeSq x + cutoff x ^ 2 * relativeSq x ^ 2 +
    cutoffGradient x ^ 2 * relativeSq x
  let regularized (ε : ℝ) (x : X) := cutoff x ^ 2 * ricci x ^ 2 * (mass x / (mass x + ε)) +
    cutoff x ^ 2 * curvature x * (gradientSq x / (mass x + ε)) +
    cutoff x ^ 2 * (gradientSq x / (mass x + ε)) ^ 2 +
    cutoffGradient x ^ 2 * (gradientSq x / (mass x + ε))
  have hBudget : Integrable budget ν := ((hRic.add hMixed).add hRelative).add hGradient
  have hIntegralBudget : (∫ x, budget x ∂ν) =
      (∫ x, cutoff x ^ 2 * ricci x ^ 2 ∂ν) +
        (∫ x, cutoff x ^ 2 * curvature x * relativeSq x ∂ν) +
        (∫ x, cutoff x ^ 2 * relativeSq x ^ 2 ∂ν) +
        (∫ x, cutoffGradient x ^ 2 * relativeSq x ∂ν) := by
    have h01 := integral_add hRic hMixed
    have h012 := integral_add (hRic.add hMixed) hRelative
    have h0123 := integral_add ((hRic.add hMixed).add hRelative) hGradient
    simp only [Pi.add_apply] at h01 h012 h0123
    simp only [budget, h0123, h012, h01]
  have hComparison (ε : ℝ) (hε : 0 < ε) :
      ∀ᵐ x ∂ν, 0 ≤ regularized ε x ∧ regularized ε x ≤ budget x := by
    filter_upwards [hnonneg, hpositive] with x hx hs
    obtain ⟨hS, hQ, hRm⟩ := hx
    have hden : 0 < mass x + ε := by linarith
    have hreg : 0 ≤ gradientSq x / (mass x + ε) := div_nonneg hQ hden.le
    obtain ⟨hr₀, hr₁⟩ := spinRatio_nonneg_le_one hS hε
    refine ⟨?_, ?_⟩
    · unfold regularized
      positivity
    · by_cases hmem : x ∈ cutoffSupport
      · have hrelative : gradientSq x / (mass x + ε) ≤ relativeSq x :=
          div_le_div_of_nonneg_left hQ (hs hmem) (by linarith)
        have h0 := mul_le_of_le_one_right
          (mul_nonneg (sq_nonneg (cutoff x)) (sq_nonneg (ricci x))) hr₁
        have h1 := mul_le_mul_of_nonneg_left hrelative
          (mul_nonneg (sq_nonneg (cutoff x)) hRm)
        have h2 := mul_le_mul_of_nonneg_left
          (pow_le_pow_left₀ hreg hrelative 2) (sq_nonneg (cutoff x))
        have h3 := mul_le_mul_of_nonneg_left hrelative (sq_nonneg (cutoffGradient x))
        exact add_le_add (add_le_add (add_le_add h0 h1) h2) h3
      · obtain ⟨hc, hg⟩ := hsupport x hmem
        simp [regularized, budget, hc, hg]
  have hRegIntegral (ε : ℝ) (hε : 0 < ε) :
      (∫ x, regularized ε x ∂ν) ≤ ∫ x, budget x ∂ν := by
    have hMeas : Measurable (regularized ε) := by unfold regularized; fun_prop
    have hi : Integrable (regularized ε) ν := by
      refine hBudget.mono' hMeas.aestronglyMeasurable ?_
      filter_upwards [hComparison ε hε] with x hx
      rw [Real.norm_of_nonneg hx.1]
      exact hx.2
    exact integral_mono_ae hi hBudget ((hComparison ε hε).mono fun _ hx => hx.2)
  have hPositiveW : ∀ᵐ x ∂ν, 0 < mass x ∨ cutoff x ^ 2 * weyl x ^ 2 = 0 := by
    filter_upwards [hpositive] with x hx
    by_cases hmem : x ∈ cutoffSupport
    · exact Or.inl (hx hmem)
    · exact Or.inr (by simp [(hsupport x hmem).1])
  have hLimit := spinCutoff_fraction_integrals_tendsto ν mass
    (fun x => cutoff x ^ 2 * weyl x ^ 2) hmass hW
    (hnonneg.mono fun _ hx => hx.1) (ae_of_all ν fun _ => by positivity) hPositiveW
  rw [← hIntegralBudget]
  apply le_of_tendsto' hLimit
  intro n
  have hε : 0 < (1 : ℝ) / ((n : ℝ) + 1) := by positivity
  exact (hBochner _ hε).trans (mul_le_mul_of_nonneg_left (hRegIntegral _ hε) hC)

/-- Cauchy–Schwarz on a measured region for the mixed curvature cost.
The two `L²` factors are `|χ| |Rm|` and `|χ| v²`. -/
theorem spinMixedRelative_integrable_and_le {X : Type*} [MeasurableSpace X]
    (μ : Measure X) (cutoff curvature relativeSq : X → ℝ)
    (hcutoff : Measurable cutoff) (hcurvature : Measurable curvature)
    (hrelativeSq : Measurable relativeSq)
    (hcurvature_nonneg : ∀ᵐ x ∂μ, 0 ≤ curvature x)
    (hrelativeSq_nonneg : ∀ᵐ x ∂μ, 0 ≤ relativeSq x)
    (hK : Integrable (fun x => cutoff x ^ 2 * curvature x ^ 2) μ)
    (hV : Integrable (fun x => cutoff x ^ 2 * relativeSq x ^ 2) μ) :
    Integrable (fun x => cutoff x ^ 2 * curvature x * relativeSq x) μ ∧
      (∫ x, cutoff x ^ 2 * curvature x * relativeSq x ∂μ) ≤
        Real.sqrt (∫ x, cutoff x ^ 2 * curvature x ^ 2 ∂μ) *
          Real.sqrt (∫ x, cutoff x ^ 2 * relativeSq x ^ 2 ∂μ) := by
  let f (x : X) := |cutoff x| * curvature x
  let g (x : X) := |cutoff x| * relativeSq x
  have hf_sq (x : X) : f x ^ 2 = cutoff x ^ 2 * curvature x ^ 2 := by
    simp [f, mul_pow]
  have hg_sq (x : X) : g x ^ 2 = cutoff x ^ 2 * relativeSq x ^ 2 := by
    simp [g, mul_pow]
  have hcutoff_abs : Measurable (fun x => |cutoff x|) := continuous_abs.measurable.comp hcutoff
  have hf_meas : Measurable f := hcutoff_abs.mul hcurvature
  have hg_meas : Measurable g := hcutoff_abs.mul hrelativeSq
  have hf : MemLp f 2 μ := by
    apply (memLp_two_iff_integrable_sq_norm hf_meas.aestronglyMeasurable).mpr
    simpa only [Real.norm_eq_abs, sq_abs, hf_sq] using hK
  have hg : MemLp g 2 μ := by
    apply (memLp_two_iff_integrable_sq_norm hg_meas.aestronglyMeasurable).mpr
    simpa only [Real.norm_eq_abs, sq_abs, hg_sq] using hV
  have hproduct (x : X) : f x * g x = cutoff x ^ 2 * curvature x * relativeSq x := by
    calc
      _ = |cutoff x| ^ 2 * curvature x * relativeSq x := by dsimp [f, g]; ring
      _ = _ := by rw [sq_abs]
  have hf_nonneg : 0 ≤ᵐ[μ] f := hcurvature_nonneg.mono fun x hx => mul_nonneg (abs_nonneg _) hx
  have hg_nonneg : 0 ≤ᵐ[μ] g := hrelativeSq_nonneg.mono fun x hx => mul_nonneg (abs_nonneg _) hx
  have hexponent : (2 : ℝ).HolderConjugate 2 := by norm_num [Real.holderConjugate_iff]
  have hf' : MemLp f (ENNReal.ofReal (2 : ℝ)) μ := by simpa using hf
  have hg' : MemLp g (ENNReal.ofReal (2 : ℝ)) μ := by simpa using hg
  constructor
  · exact (hf.integrable_mul hg).congr (ae_of_all μ hproduct)
  · simpa only [Real.rpow_two, ← Real.sqrt_eq_rpow, hproduct, hf_sq, hg_sq] using
      integral_mul_le_Lp_mul_Lq_of_nonneg hexponent hf_nonneg hg_nonneg hf' hg'

/-- Finite-cover mixed-cost bound in the individual region measures.
The sums of the curvature-square and relative fourth-power integrals
give the two factors inside the square root. -/
theorem spinMixedRelative_sum_le {ι X : Type*} [MeasurableSpace X]
    (patches : Finset ι) (measure : ι → Measure X) (region : ι → Set X)
    (cutoff curvature relativeSq : ι → X → ℝ)
    (hcutoff : ∀ j ∈ patches, Measurable (cutoff j))
    (hcurvature : ∀ j ∈ patches, Measurable (curvature j))
    (hrelativeSq : ∀ j ∈ patches, Measurable (relativeSq j))
    (hcurvature_nonneg : ∀ j ∈ patches, ∀ᵐ x ∂(measure j).restrict (region j), 0 ≤ curvature j x)
    (hrelativeSq_nonneg : ∀ j ∈ patches, ∀ᵐ x ∂(measure j).restrict (region j), 0 ≤ relativeSq j x)
    (hK : ∀ j ∈ patches, Integrable (fun x => cutoff j x ^ 2 * curvature j x ^ 2)
      ((measure j).restrict (region j)))
    (hV : ∀ j ∈ patches, Integrable (fun x => cutoff j x ^ 2 * relativeSq j x ^ 2)
      ((measure j).restrict (region j))) :
    let K (j : ι) := ∫ x in region j, cutoff j x ^ 2 * curvature j x ^ 2 ∂measure j
    let V (j : ι) := ∫ x in region j, cutoff j x ^ 2 * relativeSq j x ^ 2 ∂measure j
    (∑ j ∈ patches, ∫ x in region j, cutoff j x ^ 2 * curvature j x * relativeSq j x ∂measure j) ≤
      Real.sqrt ((∑ j ∈ patches, K j) * (∑ j ∈ patches, V j)) := by
  intro K V
  have hK_nonneg (j : ι) : 0 ≤ K j := integral_nonneg fun _ => by positivity
  have hV_nonneg (j : ι) : 0 ≤ V j := integral_nonneg fun _ => by positivity
  calc
    _ ≤ ∑ j ∈ patches, Real.sqrt (K j) * Real.sqrt (V j) := by
      apply Finset.sum_le_sum
      intro j hj
      exact (spinMixedRelative_integrable_and_le _ _ _ _ (hcutoff j hj) (hcurvature j hj)
        (hrelativeSq j hj) (hcurvature_nonneg j hj) (hrelativeSq_nonneg j hj)
        (hK j hj) (hV j hj)).2
    _ ≤ Real.sqrt (∑ j ∈ patches, K j) * Real.sqrt (∑ j ∈ patches, V j) :=
      Real.sum_sqrt_mul_sqrt_le patches hK_nonneg hV_nonneg
    _ = _ := (Real.sqrt_mul (Finset.sum_nonneg fun j _ => hK_nonneg j) _).symm

end FirstOrderTwistor
