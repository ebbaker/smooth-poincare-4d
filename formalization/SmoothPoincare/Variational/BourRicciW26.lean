import SmoothPoincare.Variational.BourRicciCutoffNorms
import SmoothPoincare.Variational.BourSixthPowerInterpolation

/-! # A quantitative coupled interior estimate at exponent six

26 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance.
All rows live in one chart and use one Haar measure. The constants are
fixed by the chart bounds and the frozen scalar inequality.
-/

open DifferentialGeometry.Tensor.Coordinates MeasureTheory Filter Set
open scoped BigOperators ContDiff ENNReal NNReal Topology

namespace SmoothPoincare

open Bour

noncomputable section

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    [FiniteDimensional ℝ E]
variable {κ : Type*} [Fintype κ]

local notation "J" => Fin (Module.finrank ℝ E)
local notation "H₂" => iteratedFDeriv ℝ 2

variable [MeasurableSpace E] [BorelSpace E]

/-- The localized Hessian and gradient estimates from a principal elliptic system
with bounded first-order coupling. The resulting constants involve no jets of
the unknown of positive order. On an open set where the cutoff is one, these
are the actual Hessian and the directional derivatives. -/
theorem bourCutoffSystem_sixthInterior
    (μ : Measure E) [Measure.IsAddHaarMeasure μ] (K : Set E) (hK : IsCompact K)
    (a : E → Matrix J J ℝ) (haSmooth : ∀ i k : J, Continuous fun x => a x i k)
    (a₀ : Matrix J J ℝ) (C₀ : ℝ≥0) (hFlat : BourFlatHessianEstimate μ 6 a₀ C₀)
    {δ : ℝ} (hSmall :
      (C₀ : ℝ≥0∞) * ENNReal.ofReal (δ * (∑ i : J, ‖chartModelBasis E i‖) ^ 2) ≤ 1 / 2)
    (hOsc : ∀ x ∈ K, ∀ i k : J, ‖a x i k - a₀ i k‖ ≤ δ)
    (η : E → ℝ) (hη : ContDiff ℝ ∞ η) (hηK : tsupport η ⊆ K)
    (u : κ → E → ℝ) (hu : ∀ j, ContDiff ℝ ∞ (u j))
    {U L T D F₀ F₁ : ℝ}
    (hU : 0 ≤ U) (hL : 0 ≤ L) (hT : 0 ≤ T) (hD : 0 ≤ D) (hF₀ : 0 ≤ F₀) (hF₁ : 0 ≤ F₁)
    (hη0 : ∀ x ∈ K, |η x| ≤ 1)
    (hη1 : ∀ x ∈ K, ∀ i : J, |fderiv ℝ η x (chartModelBasis E i)| ≤ L)
    (hη2 : ∀ x ∈ K, ∀ i k : J, |H₂ η x ![chartModelBasis E i, chartModelBasis E k]| ≤ T)
    (hu0 : ∀ j x, x ∈ K → |u j x| ≤ U)
    (ha : ∀ x ∈ K, ∀ i k : J, |a x i k| ≤ D)
    (hP : ∀ j x, x ∈ K → |bourFlatOperator (a x) (u j) x| ≤
      F₀ + F₁ * ∑ i : κ × J, |fderiv ℝ (u i.1) x (chartModelBasis E i.2)|) :

    let m := (μ.real K) ^ (1/6 : ℝ)
    let n := (Module.finrank ℝ E : ℝ)
    let d₀ := 2 * U * (T + L^2)
    let d₁ := 4 * L
    let e₂ := (∑ i : J, ‖chartModelBasis E i‖)^2
    let α := 2 * (C₀ : ℝ) * (F₀ + n^2*D*d₀)*m
    let β := 2 * (C₀ : ℝ) * (F₁ + n^2*D*d₁)
    let N := (Fintype.card (κ × J) : ℝ)
    let ε := 1 / (2*(1+N*(e₂*β+d₁)))
    let Ymax := 2*N*((24*U*L+16/ε*U)*m+ε*(d₀*m+e₂*α))
    (∑ i : κ × J, lpNorm (bourCutoffSystemGradient η u i) 6 μ) ≤ Ymax ∧
      ∀ j, lpNorm (H₂ (fun x => η x ^ 2 * u j x)) 6 μ ≤ α + β*Ymax := by
  classical
  intro m n d₀ d₁ e₂ α β N ε Ymax
  let X (j : κ) := lpNorm (H₂ (fun x => η x ^ 2 * u j x)) 6 μ
  let Y (i : κ × J) := lpNorm (bourCutoffSystemGradient η u i) 6 μ
  let Z (i : κ × J) := lpNorm (bourCutoffSystemDiagonal η u i) 6 μ
  have hz := bourCutoffSystem_real_norm_bounds μ (p := 6) (by norm_num) (by norm_num)
    K hK a haSmooth a₀ C₀ hFlat hSmall hOsc η hη hηK u hu
    hU hL hT hD hF₀ hF₁ hη0 hη1 hη2 hu0 ha hP
  have hmeasure : ((6 : ℝ≥0∞).toReal)⁻¹ = (1/6:ℝ) := by norm_num
  simp only [hmeasure] at hz
  have hβ : 0 ≤ β := by dsimp [β,n,d₁]; positivity
  have he : 0 ≤ e₂ := sq_nonneg _
  have hlen := bourCoupledInterior_absorptionLength N β e₂ d₁
    (by dsimp [N]; positivity) hβ he (by dsimp [d₁]; positivity)
  have hε : 0 < ε := hlen.1
  have hc : HasCompactSupport η := hK.of_isClosed_subset isClosed_closure hηK
  have hm : (μ.real (tsupport η)) ^ (1/6:ℝ) ≤ m :=
    Real.rpow_le_rpow (by positivity) (measureReal_mono hηK hK.measure_ne_top) (by norm_num)
  have hy (i : κ × J) : Y i ≤ (24*U*L+16/ε*U)*m + ε*Z i := by
    let e := chartModelBasis E i.2
    have hI := sixthPowerDirectional_cutoff_lpNorm μ η (u i.1) e
      (hη.of_le (by simp)) hc (fun _ _ => ((hu i.1).of_le (by simp)).contDiffAt)
      hU hL hε (fun x hx => hu0 i.1 x (hηK hx)) (fun x hx => hη1 x (hηK hx) i.2)
    have hDiag : (fun x => η x ^ 2 * fderiv ℝ (fun y => fderiv ℝ (u i.1) y e) x e) =
        bourCutoffSystemDiagonal η u i := by
      funext x
      unfold bourCutoffSystemDiagonal
      congr 1
      exact DifferentialGeometry.Analysis.Calculus.partialDeriv_partialDeriv_eq_iteratedFDeriv_two
        (u i.1) (hu i.1).contDiffAt i.2 i.2
    dsimp only at hI
    rw [hDiag] at hI
    change Y i ≤ ε * Z i + _ at hI
    have hmul := mul_le_mul_of_nonneg_left hm
      (show 0 ≤ 24*U*L+16/ε*U by positivity)
    linarith only [hI, hmul]
  exact bourCoupledInterior_absorb Prod.fst X Y Z hβ he hε.le hz.1 hz.2 hy
    (fun i => lpNorm_nonneg) hlen.2

end
end SmoothPoincare
