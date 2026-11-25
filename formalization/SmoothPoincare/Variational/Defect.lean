import Mathlib.Analysis.InnerProductSpace.LinearMap
import Mathlib.MeasureTheory.Function.L2Space
import Mathlib.Topology.Algebra.Module.Spaces.WeakDual
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring

/-! # Defect on a fixed measured comparison chart

An admissible endpoint with a vanishing integrated interpolation error forces
the weighted squared defect to vanish. The cross term is tested against the
fixed product of the cutoff and the comparison density in the weak topology.
-/

open Filter MeasureTheory Set
open scoped Topology

namespace SmoothPoincare

variable {D F : Type*} [MeasurableSpace D] {μ : Measure D}
  [NormedAddCommGroup F] [InnerProductSpace ℝ F]

private theorem memLp_cutoff_smul {f : D → F} {χ : D → ℝ}
    (hf : MemLp f 2 μ) (hχ : Measurable χ) (hBounds : ∀ x, 0 ≤ χ x ∧ χ x ≤ 1) :
    MemLp (fun x => χ x • f x) 2 μ := by
  apply hf.of_le (hχ.aestronglyMeasurable.smul hf.aestronglyMeasurable)
  exact Eventually.of_forall fun x => by
    change ‖χ x • f x‖ ≤ ‖f x‖
    rw [norm_smul, Real.norm_eq_abs, abs_of_nonneg (hBounds x).1]
    exact mul_le_of_le_one_left (norm_nonneg _) (hBounds x).2

private theorem integrable_inner_of_memLp {v w : D → F}
    (hv : MemLp v 2 μ) (hw : MemLp w 2 μ) : Integrable (fun x => inner ℝ (v x) (w x)) μ := by
  apply (L2.integrable_inner (𝕜 := ℝ) (hv.toLp v) (hw.toLp w)).congr
  filter_upwards [hv.coeFn_toLp, hw.coeFn_toLp] with x hvx hwx
  rw [hvx, hwx]

/-- Pairing with a fixed square-integrable test is continuous for the weak
topology of the reference `L²` space. -/
theorem fixedCrossTerm_tendsto_zero {v : D → F} {r : ℕ → D → F}
    (hv : MemLp v 2 μ) (hr : ∀ n, MemLp (r n) 2 μ)
    (hWeak : Tendsto (fun n => toWeakSpace ℝ (Lp F 2 μ) ((hr n).toLp (r n))) atTop (𝓝 0)) :
    Tendsto (fun n => ∫ x, inner ℝ (v x) (r n x) ∂μ) atTop (𝓝 0) := by
  let test := innerSL ℝ (hv.toLp v)
  have hContinuous : Continuous (fun u : WeakSpace ℝ (Lp F 2 μ) =>
      test ((toWeakSpace ℝ (Lp F 2 μ)).symm u)) :=
    WeakBilin.eval_continuous (topDualPairing ℝ (Lp F 2 μ)).flip test
  have hTest : Tendsto (fun n => test ((hr n).toLp (r n))) atTop (𝓝 0) := by
    simpa only [Function.comp_def, LinearEquiv.symm_apply_apply, map_zero] using
      hContinuous.continuousAt.tendsto.comp hWeak
  refine hTest.congr fun n => ?_
  rw [show test ((hr n).toLp (r n)) = inner ℝ (hv.toLp v) ((hr n).toLp (r n)) from rfl,
    L2.inner_def]
  apply integral_congr_ae
  filter_upwards [hv.coeFn_toLp, (hr n).coeFn_toLp] with x hvx hrx
  rw [hvx, hrx]

/-- If the endpoint replacement is admissible, the near-infimum sequence
forces the weighted defect to vanish. On the full level set `χ = 1`, the
unweighted squared defect also tends to zero. The supplied energy identity is
the integrated endpoint interpolation on the fixed reference measure. -/
theorem weightedDefect_tendsto_zero (A : Set ℝ) (hBelow : BddBelow A)
    {source endpoint error : ℕ → ℝ} {base : D → F} {r : ℕ → D → F} {χ : D → ℝ}
    (hEndpoint : ∀ n, endpoint n ∈ A)
    (hSource : Tendsto source atTop (𝓝 (sInf A)))
    (hError : Tendsto error atTop (𝓝 0))
    (hχ : Measurable χ) (hBounds : ∀ x, 0 ≤ χ x ∧ χ x ≤ 1)
    (hBase : MemLp base 2 μ) (hDefect : ∀ n, MemLp (r n) 2 μ)
    (hWeak : Tendsto (fun n => toWeakSpace ℝ (Lp F 2 μ) ((hDefect n).toLp (r n))) atTop (𝓝 0))
    (hReplace : ∀ n, endpoint n = source n +
      (∫ x, (‖base x + (1 - χ x) • r n x‖ ^ 2 - ‖base x + r n x‖ ^ 2) ∂μ) + error n) :
    Tendsto (fun n => ∫ x, (2 * χ x - χ x ^ 2) * ‖r n x‖ ^ 2 ∂μ) atTop (𝓝 0) ∧
      Tendsto (fun n => ∫ x in {x | χ x = 1}, ‖r n x‖ ^ 2 ∂μ) atTop (𝓝 0) := by
  let w := fun x => 2 * χ x - χ x ^ 2
  have hWeight : ∀ x, 0 ≤ w x ∧ w x ≤ 1 := by
    intro x
    have ⟨hχ₀, hχ₁⟩ := hBounds x
    dsimp [w]
    constructor
    · nlinarith only [mul_nonneg hχ₀ (show 0 ≤ 2 - χ x by linarith)]
    · nlinarith only [sq_nonneg (1 - χ x)]
  have hMeasWeight : Measurable w := (measurable_const.mul hχ).sub (hχ.pow_const 2)
  have hSq (n : ℕ) : Integrable (fun x => ‖r n x‖ ^ 2) μ :=
    (hDefect n).integrable_norm_pow (by decide)
  have hWeighted (n : ℕ) : Integrable (fun x => w x * ‖r n x‖ ^ 2) μ := by
    apply (hSq n).mono' (hMeasWeight.aestronglyMeasurable.mul (hSq n).aestronglyMeasurable)
    exact Eventually.of_forall fun x => by
      change ‖w x * ‖r n x‖ ^ 2‖ ≤ ‖r n x‖ ^ 2
      rw [Real.norm_eq_abs, abs_of_nonneg (mul_nonneg (hWeight x).1 (sq_nonneg _))]
      exact mul_le_of_le_one_left (sq_nonneg _) (hWeight x).2
  have hTest := memLp_cutoff_smul hBase hχ hBounds
  have hCross := fixedCrossTerm_tendsto_zero hTest hDefect hWeak
  have hIdentity (n : ℕ) : endpoint n = source n -
      (∫ x, w x * ‖r n x‖ ^ 2 ∂μ) - 2 * (∫ x, inner ℝ (χ x • base x) (r n x) ∂μ) + error n := by
    have hPoint (x : D) : ‖base x + (1 - χ x) • r n x‖ ^ 2 - ‖base x + r n x‖ ^ 2 =
        -(w x * ‖r n x‖ ^ 2) - 2 * inner ℝ (χ x • base x) (r n x) := by
      rw [norm_add_sq_real, norm_add_sq_real, real_inner_smul_right, real_inner_smul_left,
        norm_smul, Real.norm_eq_abs, abs_of_nonneg (sub_nonneg.mpr (hBounds x).2)]
      dsimp [w]
      ring
    rw [hReplace n]
    simp_rw [hPoint]
    have hNeg : Integrable (fun x => -(w x * ‖r n x‖ ^ 2)) μ := (hWeighted n).neg
    rw [integral_sub hNeg ((integrable_inner_of_memLp hTest (hDefect n)).const_mul 2),
      integral_neg, integral_const_mul]
    ring
  have hWeightedLimit : Tendsto (fun n => ∫ x, w x * ‖r n x‖ ^ 2 ∂μ) atTop (𝓝 0) := by
    have hUpper : Tendsto (fun n => source n - sInf A -
        2 * (∫ x, inner ℝ (χ x • base x) (r n x) ∂μ) + error n) atTop (𝓝 0) := by
      have hInf : Tendsto (fun _ : ℕ => sInf A) atTop (𝓝 (sInf A)) := tendsto_const_nhds
      simpa using (((hSource.sub hInf).sub (hCross.const_mul 2)).add hError)
    refine squeeze_zero (fun n => integral_nonneg fun x => mul_nonneg (hWeight x).1 (sq_nonneg _))
      (fun n => ?_) hUpper
    linarith only [csInf_le hBelow (hEndpoint n), hIdentity n]
  refine ⟨hWeightedLimit, squeeze_zero (fun n => integral_nonneg fun _ => sq_nonneg _) ?_ hWeightedLimit⟩
  intro n
  have hLevel : MeasurableSet {x | χ x = 1} := hχ (measurableSet_singleton 1)
  rw [← integral_indicator hLevel]
  apply integral_mono ((hSq n).indicator hLevel) (hWeighted n)
  intro x
  by_cases hx : χ x = 1
  · norm_num [w, hx]
  · exact (indicator_of_notMem (s := {x | χ x = 1}) hx _).le.trans
      (mul_nonneg (hWeight x).1 (sq_nonneg _))

end SmoothPoincare
