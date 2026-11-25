import FirstOrderTwistor.Accounting
import FirstOrderTwistor.EnergyDensity

/-!
# Finite cutoff-square covers of a physical residual

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex
assistance. The serving model and effort are unavailable. Inputs at checkout
`5ff7014` include MATCH-E11 (`e249e29f8b64`) and Route 02 accounting.

The weights may be squares of cutoffs which sum to at least one on a
covered region. Every local weighted integral uses the physical chiral
energy measure, compared to the local gauge by equality of restricted
measures. The analytic bound on each such integral is supplied.
-/

open Filter MeasureTheory Set
open scoped BigOperators ENNReal

namespace FirstOrderTwistor

variable {X κ : Type*} [MeasurableSpace X]

/-- A cutoff extended by zero from a measurable strip is integrated in its
own gauge using equality of the restricted chiral energy measures. A local
integrable weighted density supplies integrability in the physical measure. -/
theorem spinCutoffIntegral_in_gauge
    (μ volume : Measure X) {R U : Set X} (hU : MeasurableSet U)
    (hRU : MeasurableSet (R ∩ U)) (weight density : X → ℝ)
    (hMatch : μ.restrict (R ∩ U) = (energyMeasure volume density).restrict (R ∩ U))
    (hDensity : AEMeasurable density (volume.restrict (R ∩ U)))
    (hNonneg : 0 ≤ᵐ[volume.restrict (R ∩ U)] density)
    (hLocal : IntegrableOn (fun x => weight x * density x) (R ∩ U) volume) :
    IntegrableOn (U.indicator weight) R μ ∧
      (∫ x in R, U.indicator weight x ∂μ) =
        ∫ x in R ∩ U, weight x * density x ∂volume := by
  let ν := volume.restrict (R ∩ U)
  let d : X → ℝ≥0∞ := fun x => ENNReal.ofReal (density x)
  have hd : AEMeasurable d ν := ENNReal.measurable_ofReal.comp_aemeasurable hDensity
  have hfinite : ∀ᵐ x ∂ν, d x < ∞ :=
    ae_of_all ν fun _ => ENNReal.ofReal_lt_top
  have hMeasure : μ.restrict (R ∩ U) = ν.withDensity d := by
    rw [hMatch, energyMeasure, restrict_withDensity hRU]
  have hWeighted : (fun x => weight x * density x) =ᵐ[ν] fun x => (d x).toReal • weight x := by
    filter_upwards [hNonneg] with x hx
    simp only [d, ENNReal.toReal_ofReal hx, smul_eq_mul, mul_comm]
  constructor
  · simp only [IntegrableOn, integrable_indicator_iff hU, Measure.restrict_restrict hU,
      inter_comm U R, hMeasure]
    exact (integrable_withDensity_iff_integrable_smul₀' hd hfinite).mpr (hLocal.congr hWeighted)
  · rw [integral_indicator hU, Measure.restrict_restrict hU, inter_comm U R, hMeasure,
      integral_withDensity_eq_integral_toReal_smul₀ hd hfinite]
    exact integral_congr_ae hWeighted.symm

/-- Where the finite sum of nonnegative cutoff weights is at least one,
the covered mass is at most the sum of their integrals on the residual. -/
theorem spinCutoffCoveredMass_le_sum
    (μ : Measure X) [IsFiniteMeasure μ] {R P : Set X} (hSubset : P ⊆ R)
    (K : Finset κ) (weight : κ → X → ℝ)
    (hIntegrable : ∀ j ∈ K, IntegrableOn (weight j) R μ)
    (hNonneg : ∀ j ∈ K, 0 ≤ᵐ[μ.restrict R] weight j)
    (hCover : ∀ᵐ x ∂μ.restrict P, 1 ≤ ∑ j ∈ K, weight j x) :
    μ.real P ≤ ∑ j ∈ K, ∫ x in R, weight j x ∂μ := by
  have hSum : IntegrableOn (fun x => ∑ j ∈ K, weight j x) R μ :=
    integrable_finsetSum K hIntegrable
  have hSumNonneg : 0 ≤ᵐ[μ.restrict R] (fun x => ∑ j ∈ K, weight j x) :=
    ((eventually_all_finset K).2 hNonneg).mono fun x hx => Finset.sum_nonneg hx
  calc
    μ.real P = ∫ _ in P, (1 : ℝ) ∂μ := by simp
    _ ≤ ∫ x in P, ∑ j ∈ K, weight j x ∂μ :=
      integral_mono_ae (integrable_const _) (hSum.mono_set hSubset) hCover
    _ ≤ ∫ x in R, ∑ j ∈ K, weight j x ∂μ :=
      setIntegral_mono_set hSum hSumNonneg (ae_of_all μ hSubset)
    _ = ∑ j ∈ K, ∫ x in R, weight j x ∂μ := integral_finsetSum K hIntegrable

/-- Bound the physical residual by the cutoff costs and the energy outside
their covered region. A local cost bounds its own weighted integral. -/
theorem spinCutoffRemainderMass_le_uncovered_add_cost
    (μ : Measure X) [IsFiniteMeasure μ] {R P : Set X}
    (hP : MeasurableSet P) (hSubset : P ⊆ R)
    (K : Finset κ) (weight : κ → X → ℝ) (cost : κ → ℝ)
    (hIntegrable : ∀ j ∈ K, IntegrableOn (weight j) R μ)
    (hNonneg : ∀ j ∈ K, 0 ≤ᵐ[μ.restrict R] weight j)
    (hCover : ∀ᵐ x ∂μ.restrict P, 1 ≤ ∑ j ∈ K, weight j x)
    (hCost : ∀ j ∈ K, (∫ x in R, weight j x ∂μ) ≤ cost j) :
    μ.real R ≤ μ.real (R \ P) + ∑ j ∈ K, cost j := by
  have hSplit := measureReal_sdiff (μ := μ) hSubset hP
  have hBound := (spinCutoffCoveredMass_le_sum μ hSubset K weight hIntegrable hNonneg hCover).trans
    (Finset.sum_le_sum hCost)
  linarith

/-- In Route 02, use the entire covered region as one strip and its summed
local cutoff costs as its error. The uncovered mass is evaluated once,
outside the covered region. The cutoff family may grow with either index. -/
def RemainderEstimates.ofSpinCutoffCover
    {μ : ℕ → Measure X} [∀ i, IsFiniteMeasure (μ i)] {ι : Type*} {J : Finset ι}
    {Y : ι → Type*} [∀ j, MeasurableSpace (Y j)]
    (F : TruncationFamily μ J Y) (P : ℕ → ℕ → Set X) (K : ℕ → ℕ → Finset κ)
    (weight : κ → ℕ → ℕ → X → ℝ) (cost : κ → ℕ → ℕ → ℝ)
    (hCovers : ∀ᶠ L in atTop, ∀ᶠ i in atTop,
      P L i ⊆ F.remainder L i ∧
      (∀ᵐ x ∂(μ i).restrict (P L i), 1 ≤ ∑ j ∈ K L i, weight j L i x) ∧
      (∀ j ∈ K L i, IntegrableOn (weight j L i) (F.remainder L i) (μ i) ∧
        (0 ≤ᵐ[(μ i).restrict (F.remainder L i)] weight j L i) ∧
        (∫ x in F.remainder L i, weight j L i x ∂(μ i)) ≤ cost j L i))
    (hSum : ∀ ε : ℝ, 0 < ε → ∀ᶠ L in atTop, ∀ᶠ i in atTop,
      (∑ j ∈ K L i, cost j L i) ≤ ε)
    (hUncovered : ∀ ε : ℝ, 0 < ε → ∀ᶠ L in atTop, ∀ᶠ i in atTop,
      (μ i).real (F.remainder L i \ P L i) ≤ ε) :
    RemainderEstimates F Unit where
  strips L i := ⟨{()}, fun _ => P L i, fun _ => ∑ j ∈ K L i, cost j L i⟩
  bounds := by
    filter_upwards [hCovers] with L hL
    filter_upwards [hL] with i hi
    obtain ⟨hSubset, hCover, hLocal⟩ := hi
    intro _ _
    exact (spinCutoffCoveredMass_le_sum (μ i) hSubset (K L i) (fun j => weight j L i)
      (fun j hj => (hLocal j hj).1) (fun j hj => (hLocal j hj).2.1) hCover).trans
      (Finset.sum_le_sum fun j hj => (hLocal j hj).2.2)
  sumSmall := by
    intro ε hε
    simpa using hSum ε hε
  uncoveredSmall := by
    intro ε hε
    filter_upwards [hUncovered ε hε] with L hL
    filter_upwards [hL] with i hi
    change (μ i).real (F.remainder L i \ ⋃ _ ∈ ({()} : Finset Unit), P L i) ≤ ε
    simpa [iUnion_const] using hi

end FirstOrderTwistor
