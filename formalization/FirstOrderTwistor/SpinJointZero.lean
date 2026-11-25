import FirstOrderTwistor.SpinRelativeBochner
import FirstOrderTwistor.SpinCutoffCover

/-!
# Relative Bochner costs and the joint spinor zero set

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex
assistance. The serving model and effort are unavailable. The base relative
estimate is MATCH-E11 (`e249e29f8b64)).

The analytic regularized inequality is imposed on the full original patch.
When the derivative density vanishes almost everywhere on the joint zero
locus in the cutoff support, the terms of the already-integrated inequality
give the same integrals on the positive-mass locus. The limiting step then
controls the Weyl energy there. The weighted physical energy on the joint
zero set remains a separate cost.
-/

open Filter MeasureTheory Set
open scoped BigOperators

namespace FirstOrderTwistor

private theorem spinIntegral_restrict_eq_of_ae_zero_off {X : Type*} [MeasurableSpace X]
    (μ : Measure X) {P : Set X} (hP : MeasurableSet P) {f : X → ℝ}
    (hZero : ∀ᵐ x ∂μ, x ∉ P → f x = 0) :
    (∫ x, f x ∂μ) = ∫ x in P, f x ∂μ := by
  rw [← integral_indicator hP]
  apply integral_congr_ae
  filter_upwards [hZero] with x hx
  by_cases hmem : x ∈ P
  · simp [hmem]
  · simp [hmem, hx hmem]

/-- Control the Weyl cost on the positive-mass locus from the regularized
inequality on the whole original patch. The separate hypothesis `hJointZero`
states that the derivative density vanishes almost everywhere on the joint
zero locus inside the cutoff support. -/
theorem spinRelativeBochner_bound_of_jointZero {X : Type*} [MeasurableSpace X]
    (μ : Measure X) (region cutoffSupport : Set X)
    (cutoff cutoffGradient mass gradientSq weyl ricci curvature : X → ℝ)
    (hcutoff : Measurable cutoff) (hcutoffGradient : Measurable cutoffGradient)
    (hmass : Measurable mass) (hgradientSq : Measurable gradientSq)
    (hricci : Measurable ricci) (hcurvature : Measurable curvature)
    {C : ℝ} (hC : 0 ≤ C)
    (hsupport : ∀ x ∉ cutoffSupport, cutoff x = 0 ∧ cutoffGradient x = 0) :
    let ν := μ.restrict region
    let relativeSq (x : X) := gradientSq x / mass x
    let P := region ∩ {x | 0 < mass x}
    (∀ᵐ x ∂ν, 0 ≤ mass x ∧ 0 ≤ gradientSq x ∧ 0 ≤ curvature x) →
    (∀ᵐ x ∂ν, x ∈ cutoffSupport → mass x = 0 → gradientSq x = 0) →
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
    (∫ x in P, cutoff x ^ 2 * weyl x ^ 2 ∂μ) ≤
      C * ((∫ x in P, cutoff x ^ 2 * ricci x ^ 2 ∂μ) +
        (∫ x in P, cutoff x ^ 2 * curvature x * relativeSq x ∂μ) +
        (∫ x in P, cutoff x ^ 2 * relativeSq x ^ 2 ∂μ) +
        (∫ x in P, cutoffGradient x ^ 2 * relativeSq x ∂μ)) := by
  intro ν relativeSq P hNonneg hJointZero hW hRic hMixed hRelative hGradient hBochner
  let positiveMass : Set X := {x | 0 < mass x}
  have hMeas : MeasurableSet positiveMass := measurableSet_lt measurable_const hmass
  have hMeasure : ν.restrict positiveMass = μ.restrict P := by
    rw [show ν = μ.restrict region from rfl, Measure.restrict_restrict hMeas, inter_comm]
  have hMono : μ.restrict P ≤ ν := Measure.restrict_mono inter_subset_left le_rfl
  have hPositive : ∀ᵐ x ∂μ.restrict P, x ∈ cutoffSupport → 0 < mass x := by
    rw [← hMeasure]
    exact (ae_restrict_mem hMeas).mono fun _ hx _ => hx
  refine spinRelativeBochner_bound μ P cutoffSupport cutoff cutoffGradient mass gradientSq
    weyl ricci curvature hcutoff hcutoffGradient hmass hgradientSq hricci hcurvature hC hsupport
    (ae_mono hMono hNonneg) hPositive (hW.mono_measure hMono) (hRic.mono_measure hMono)
    (hMixed.mono_measure hMono) (hRelative.mono_measure hMono) (hGradient.mono_measure hMono) ?_
  intro ε hε
  let lhs (x : X) := cutoff x ^ 2 * weyl x ^ 2 * (mass x / (mass x + ε))
  let rhs (x : X) := cutoff x ^ 2 * ricci x ^ 2 * (mass x / (mass x + ε)) +
    cutoff x ^ 2 * curvature x * (gradientSq x / (mass x + ε)) +
    cutoff x ^ 2 * (gradientSq x / (mass x + ε)) ^ 2 +
    cutoffGradient x ^ 2 * (gradientSq x / (mass x + ε))
  have hLhs : (∫ x, lhs x ∂ν) = ∫ x in positiveMass, lhs x ∂ν := by
    apply spinIntegral_restrict_eq_of_ae_zero_off ν hMeas
    filter_upwards [hNonneg] with x hx
    intro hn
    have hm : mass x = 0 := le_antisymm (le_of_not_gt hn) hx.1
    simp [lhs, hm]
  have hRhs : (∫ x, rhs x ∂ν) = ∫ x in positiveMass, rhs x ∂ν := by
    apply spinIntegral_restrict_eq_of_ae_zero_off ν hMeas
    filter_upwards [hNonneg, hJointZero] with x hx hQ
    intro hn
    have hm : mass x = 0 := le_antisymm (le_of_not_gt hn) hx.1
    by_cases hs : x ∈ cutoffSupport
    · simp [rhs, hm, hQ hs hm]
    · obtain ⟨hc, hdc⟩ := hsupport x hs
      simp [rhs, hc, hdc]
  have h := hBochner ε hε
  change (∫ x, lhs x ∂ν) ≤ C * ∫ x, rhs x ∂ν at h
  simpa only [hLhs, hRhs, hMeasure] using h

/-- Transfer the positive-mass estimate and the joint-zero cost to the
physical energy measure. There is no bound on the zero-set cost from
the relative estimate. It is charged separately, in the same physical
measure as the full weighted Weyl integral. -/
theorem spinJointZero_physicalCutoffCost {X : Type*} [MeasurableSpace X]
    (physical volume : Measure X) (region : Set X) (hRegion : MeasurableSet region)
    (cutoff mass weyl : X → ℝ) (hMass : Measurable mass)
    (hMassNonneg : ∀ x ∈ region, 0 ≤ mass x)
    (hMatch : physical.restrict region =
      (energyMeasure volume (fun x => weyl x ^ 2)).restrict region)
    (hWeyl : AEMeasurable (fun x => weyl x ^ 2) (volume.restrict region))
    (hWeighted : IntegrableOn (fun x => cutoff x ^ 2 * weyl x ^ 2) region volume)
    {cost : ℝ}
    (hCost : (∫ x in region ∩ {x | 0 < mass x}, cutoff x ^ 2 * weyl x ^ 2 ∂volume) ≤ cost) :
    let Z := region ∩ {x | mass x = 0}
    (∫ x in Z, cutoff x ^ 2 ∂physical) =
      (∫ x in Z, cutoff x ^ 2 * weyl x ^ 2 ∂volume) ∧
      (∫ x in region, cutoff x ^ 2 ∂physical) ≤ cost + ∫ x in Z, cutoff x ^ 2 ∂physical := by
  let P : Set X := {x | 0 < mass x}
  let Z : Set X := {x | mass x = 0}
  have hP : MeasurableSet P := measurableSet_lt measurable_const hMass
  have hZ : MeasurableSet Z := measurableSet_eq_fun hMass measurable_const
  have hGauge (U : Set X) (hU : MeasurableSet U) :
      IntegrableOn (U.indicator (fun x => cutoff x ^ 2)) region physical ∧
        (∫ x in region ∩ U, cutoff x ^ 2 ∂physical) =
          (∫ x in region ∩ U, cutoff x ^ 2 * weyl x ^ 2 ∂volume) := by
    have hSub : region ∩ U ⊆ region := inter_subset_left
    have hLocal := congrArg (fun μ : Measure X => μ.restrict (region ∩ U)) hMatch
    simp only [Measure.restrict_restrict_of_subset hSub] at hLocal
    simpa only [setIntegral_indicator hU] using
      spinCutoffIntegral_in_gauge physical volume hU (hRegion.inter hU)
        (fun x => cutoff x ^ 2) (fun x => weyl x ^ 2) hLocal
        (hWeyl.mono_measure (Measure.restrict_mono hSub le_rfl))
        (ae_of_all _ fun _ => sq_nonneg _) (hWeighted.mono_set hSub)
  have hPhysical : IntegrableOn (fun x => cutoff x ^ 2) region physical := by
    simpa only [indicator_univ] using (hGauge univ MeasurableSet.univ).1
  have hPartition : region \ P = region ∩ Z := by
    ext x
    constructor
    · rintro ⟨hx, hNotPos⟩
      exact ⟨hx, le_antisymm (le_of_not_gt hNotPos) (hMassNonneg x hx)⟩
    · rintro ⟨hx, h0⟩
      exact ⟨hx, fun hp => hp.ne' h0⟩
  dsimp only
  refine ⟨(hGauge Z hZ).2, ?_⟩
  rw [← integral_inter_add_sdiff hP hPhysical, hPartition, (hGauge P hP).2]
  exact add_le_add hCost le_rfl

end FirstOrderTwistor
