import SmoothPoincare.Variational.BourFlatInterior
import Mathlib.MeasureTheory.Function.LpSeminorm.LpNorm

/-! # Integrating the localized nondivergence system

E51, 26 November 2026. Prepared for Edward B. Baker III with OpenAI
Codex assistance. Actual serving model and effort were unavailable.
-/

open MeasureTheory Set DifferentialGeometry.Tensor.Coordinates
open scoped ContDiff ENNReal NNReal

namespace SmoothPoincare.Bour

noncomputable section

variable {X F V : Type*} [MeasurableSpace X]
  [NormedAddCommGroup F] [NormedAddCommGroup V]

/-- Take real norms in an extended-norm estimate with a finite right-hand
side. This retains the quantitative constant exactly. -/
theorem bourLpNorm_le_of_eLpNorm_le (μ : Measure X) (p : ℝ≥0∞)
    (f : X → F) (g : X → V) (C : ℝ≥0) (hg : MemLp g p μ)
    (h : eLpNorm f p μ ≤ (C : ℝ≥0∞) * eLpNorm g p μ) :
    lpNorm f p μ ≤ (C : ℝ) * lpNorm g p μ := by
  have ht : (C : ℝ≥0∞) * eLpNorm g p μ ≠ ⊤ :=
    ENNReal.mul_ne_top ENNReal.coe_ne_top hg.eLpNorm_ne_top
  have hr := ENNReal.toReal_mono ht h
  simpa only [ENNReal.toReal_mul, ENNReal.coe_toReal, toReal_eLpNorm] using hr

/-- A measurable row dominated by the localized forcing and a finite
sum of (L^p) jets is itself in (L^p). -/
theorem bourMemLp_of_indicator_add_sum {κ : Type*} [Fintype κ]
    (μ : Measure X) (p : ℝ≥0∞) (K : Set X) (hK : MeasurableSet K) (hKfinite : μ K ≠ ⊤)
    (f : X → F) (v : κ → X → V) (a : ℝ) (b : κ → ℝ)
    (hf : AEStronglyMeasurable f μ) (hv : ∀ j, MemLp (v j) p μ)
    (hpoint : ∀ᵐ x ∂μ, ‖f x‖ ≤ K.indicator (fun _ => a) x + ∑ j, b j * ‖v j x‖) :
    MemLp f p μ :=
  ((memLp_indicator_const p hK a (Or.inr hKfinite)).add
    (memLp_finsetSum Finset.univ fun j _ => (hv j).norm.const_mul (b j))).mono' hf hpoint

/-- Integrate one row of a pointwise linear jet estimate. The indicator
localizes a constant term to the same set used for the cutoff. -/
theorem bourLpNorm_le_indicator_add_sum {κ : Type*} [Fintype κ]
    (μ : Measure X) (p : ℝ≥0∞) (hp : 1 ≤ p) (hpTop : p ≠ ⊤)
    (K : Set X) (hK : MeasurableSet K) (hKfinite : μ K ≠ ⊤)
    (f : X → F) (v : κ → X → V) (a : ℝ) (b : κ → ℝ)
    (ha : 0 ≤ a) (hb : ∀ j, 0 ≤ b j) (hv : ∀ j, MemLp (v j) p μ)
    (hpoint : ∀ x, ‖f x‖ ≤ K.indicator (fun _ => a) x + ∑ j, b j * ‖v j x‖) :
    lpNorm f p μ ≤ a * (μ.real K) ^ (p.toReal)⁻¹ + ∑ j, b j * lpNorm (v j) p μ := by
  let A := K.indicator (fun _ => a)
  let B (j : κ) := fun x => b j * ‖v j x‖
  let S : X → ℝ := ∑ j, B j
  have hA : MemLp A p μ := memLp_indicator_const p hK a (Or.inr hKfinite)
  have hB (j : κ) : MemLp (B j) p μ := (hv j).norm.const_mul (b j)
  have hS : MemLp S p μ := memLp_finsetSum' Finset.univ fun j _ => hB j
  have hM : lpNorm f p μ ≤ lpNorm (A + S) p μ := by
    apply lpNorm_mono_real (hA.add hS)
    intro x
    simpa only [A, S, B, Pi.add_apply, Finset.sum_apply] using hpoint x
  have hSNorm : lpNorm S p μ ≤ ∑ j, lpNorm (B j) p μ :=
    lpNorm_sum_le (fun j _ => hB j) hp
  have hp₀ : p ≠ 0 := ne_of_gt (lt_of_lt_of_le zero_lt_one hp)
  have hANorm : lpNorm A p μ = a * (μ.real K) ^ (p.toReal)⁻¹ := by
    rw [← toReal_eLpNorm, eLpNorm_indicator_const hK.nullMeasurableSet hp₀ hpTop,
      ENNReal.toReal_mul, ← ENNReal.toReal_rpow]
    simp only [Measure.real, one_div, toReal_enorm, Real.norm_of_nonneg ha]
  have hBNorm (j : κ) : lpNorm (B j) p μ = b j * lpNorm (v j) p μ := by
    change lpNorm (b j • (fun x => ‖v j x‖)) p μ = _
    rw [lpNorm_const_smul, lpNorm_norm (hv j).aestronglyMeasurable]
    simp only [coe_nnnorm, Real.norm_of_nonneg (hb j)]
  calc
    lpNorm f p μ ≤ lpNorm (A + S) p μ := hM
    _ ≤ lpNorm A p μ + lpNorm S p μ := lpNorm_add_le hA hp
    _ ≤ lpNorm A p μ + ∑ j, lpNorm (B j) p μ := by gcongr
    _ = _ := by simp only [hANorm, hBNorm]

/-- Sum the integrated inequalities for a finite nondivergence system.
Both the cutoff size and each individual coupling coefficient are retained. -/
theorem bourLpNorm_sum_le_indicator_add_sum {ι κ : Type*} [Fintype ι] [Fintype κ]
    (μ : Measure X) (p : ℝ≥0∞) (hp : 1 ≤ p) (hpTop : p ≠ ⊤)
    (K : Set X) (hK : MeasurableSet K) (hKfinite : μ K ≠ ⊤)
    (f : ι → X → F) (v : κ → X → V) (a : ι → ℝ) (b : ι → κ → ℝ)
    (ha : ∀ i, 0 ≤ a i) (hb : ∀ i j, 0 ≤ b i j) (hv : ∀ j, MemLp (v j) p μ)
    (hpoint : ∀ i x, ‖f i x‖ ≤ K.indicator (fun _ => a i) x + ∑ j, b i j * ‖v j x‖) :
    (∑ i, lpNorm (f i) p μ) ≤
      (∑ i, a i) * (μ.real K) ^ (p.toReal)⁻¹ + ∑ i, ∑ j, b i j * lpNorm (v j) p μ := by
  rw [Finset.sum_mul, ← Finset.sum_add_distrib]
  exact Finset.sum_le_sum fun i _ =>
    bourLpNorm_le_indicator_add_sum μ p hp hpTop K hK hKfinite (f i) v (a i) (b i)
      (ha i) (hb i) hv (hpoint i)

section Hessian

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [MeasurableSpace E] [BorelSpace E]

/-- The compact-cutoff Hessian estimate in real (L^p) norms, for use with
the finite integrated nondivergence inequalities. -/
theorem bourLpNorm_hessianPerturb_entries
    (μ : Measure E) [IsFiniteMeasureOnCompacts μ] (p : ℝ≥0∞) (hp : 1 ≤ p)
    (a : E → Matrix (Fin (Module.finrank ℝ E)) (Fin (Module.finrank ℝ E)) ℝ)
    (a₀ : Matrix (Fin (Module.finrank ℝ E)) (Fin (Module.finrank ℝ E)) ℝ)
    (C : ℝ≥0) (hflat : BourFlatHessianEstimate μ p a₀ C)
    (u : E → ℝ) (hu : ContDiff ℝ ∞ u) (hc : HasCompactSupport u) {δ : ℝ}
    (hsmall : (C : ℝ≥0∞) * ENNReal.ofReal (δ * (∑ i, ‖chartModelBasis E i‖) ^ 2) ≤ 1 / 2)
    (hosc : ∀ᵐ z ∂μ, iteratedFDeriv ℝ 2 u z ≠ 0 →
      ∀ i j, ‖a z i j - a₀ i j‖ ≤ δ)
    (hM : MemLp (fun z => bourFlatOperator (a z) u z) p μ) :
    lpNorm (iteratedFDeriv ℝ 2 u) p μ ≤
      (2 * (C : ℝ)) * lpNorm (fun z => bourFlatOperator (a z) u z) p μ := by
  have h := bourFlatHessianEstimate_perturb_entries μ p hp a a₀ C hflat u hu hc
    hsmall hosc hM.aestronglyMeasurable
  have h' := bourLpNorm_le_of_eLpNorm_le μ p _ _ (2 * C) hM (by simpa using h)
  simpa using h'

end Hessian
end
end SmoothPoincare.Bour
