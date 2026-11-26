import SmoothPoincare.Variational.BourLpAssembly

/-! # Restriction of the squared-cutoff estimates to an inner ball

26 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance.
Actual serving settings were unavailable. Edition 06, E51, Route 13.
-/

set_option autoImplicit false

open DifferentialGeometry.Tensor.Coordinates MeasureTheory Filter Set
open scoped ContDiff ENNReal Topology

namespace SmoothPoincare.Bour

noncomputable section

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [MeasurableSpace E]

omit [NormedAddCommGroup E] [NormedSpace ℝ E] in
private theorem lpNorm_restrict_le_of_memLp {F : Type*} [NormedAddCommGroup F]
    {μ : Measure E} {p : ℝ≥0∞} {f : E → F} (hf : MemLp f p μ) (S : Set E) :
    lpNorm f p (μ.restrict S) ≤ lpNorm f p μ :=
  ENNReal.toReal_mono hf.eLpNorm_ne_top (eLpNorm_restrict_le f p μ S)

omit [MeasurableSpace E] in
/-- The actual Fréchet Hessian equals the localized Hessian on any ball
where the cutoff equals one. -/
theorem bourCutoffInnerBall_hessian_eqOn (η u : E → ℝ) (z : E) (r : ℝ)
    (hOne : ∀ x ∈ Metric.ball z r, η x = 1) :
    EqOn (iteratedFDeriv ℝ 2 u)
      (iteratedFDeriv ℝ 2 (fun x => η x ^ 2 * u x)) (Metric.ball z r) := by
  intro x hx
  have hEq : u =ᶠ[𝓝 x] fun y => η y ^ 2 * u y := by
    filter_upwards [Metric.isOpen_ball.mem_nhds hx] with y hy
    rw [hOne y hy, one_pow, one_mul]
  exact (hEq.iteratedFDeriv ℝ 2).self_of_nhds

variable [BorelSpace E]

/-- The global localization bound on the actual squared-cutoff Hessian
therefore controls the physical Hessian restriction to the inner ball. -/
theorem bourCutoffInnerBall_hessian_lpNorm_le (μ : Measure E) (p : ℝ≥0∞)
    (η u : E → ℝ) (z : E) (r : ℝ) (hOne : ∀ x ∈ Metric.ball z r, η x = 1)
    (hLp : MemLp (iteratedFDeriv ℝ 2 (fun x => η x ^ 2 * u x)) p μ) :
    lpNorm (iteratedFDeriv ℝ 2 u) p (μ.restrict (Metric.ball z r)) ≤
      lpNorm (iteratedFDeriv ℝ 2 (fun x => η x ^ 2 * u x)) p μ := by
  have hEq : iteratedFDeriv ℝ 2 u =ᵐ[μ.restrict (Metric.ball z r)]
      iteratedFDeriv ℝ 2 (fun x => η x ^ 2 * u x) :=
    (ae_restrict_mem Metric.isOpen_ball.measurableSet).mono fun _ hx =>
      bourCutoffInnerBall_hessian_eqOn η u z r hOne hx
  rw [← toReal_eLpNorm, eLpNorm_congr_ae hEq, toReal_eLpNorm]
  exact lpNorm_restrict_le_of_memLp hLp _

/-- The unweighted directional derivative on the inner ball is bounded by
its global one-cutoff norm in the same direction. -/
theorem bourCutoffInnerBall_direction_lpNorm_le (μ : Measure E) (p : ℝ≥0∞)
    (η u : E → ℝ) (e z : E) (r : ℝ) (hOne : ∀ x ∈ Metric.ball z r, η x = 1)
    (hLp : MemLp (fun x => η x * fderiv ℝ u x e) p μ) :
    lpNorm (fun x => fderiv ℝ u x e) p (μ.restrict (Metric.ball z r)) ≤
      lpNorm (fun x => η x * fderiv ℝ u x e) p μ := by
  have hEq : (fun x => fderiv ℝ u x e) =ᵐ[μ.restrict (Metric.ball z r)]
      (fun x => η x * fderiv ℝ u x e) := by
    filter_upwards [ae_restrict_mem Metric.isOpen_ball.measurableSet] with x hx
    rw [hOne x hx, one_mul]
  rw [← toReal_eLpNorm, eLpNorm_congr_ae hEq, toReal_eLpNorm]
  exact lpNorm_restrict_le_of_memLp hLp _

variable [FiniteDimensional ℝ E]

local notation "J" => Fin (Module.finrank ℝ E)

/-- Recover the norm of the actual Fréchet derivative by summing the
directional bounds in the fixed chart basis. The displayed factor is the
operator-norm comparison for that basis. -/
theorem bourCutoffInnerBall_fderiv_lpNorm_le_sum (μ : Measure E) (p : ℝ≥0∞)
    (hp : 1 ≤ p) (hpTop : p ≠ ⊤)
    (η u : E → ℝ) (z : E) (r : ℝ) (hOne : ∀ x ∈ Metric.ball z r, η x = 1)
    (hη : Continuous η) (hu : ContDiff ℝ 1 u)
    (hLp : ∀ i : J, MemLp (fun x => η x * fderiv ℝ u x (chartModelBasis E i)) p μ) :
    lpNorm (fderiv ℝ u) p (μ.restrict (Metric.ball z r)) ≤
      (Fintype.card J : ℝ) * ‖(chartModelBasis E).equivFunL.toContinuousLinearMap‖ *
        ∑ i : J, lpNorm (fun x => η x * fderiv ℝ u x (chartModelBasis E i)) p μ := by
  let b := chartModelBasis E
  let W := fun x => η x • fderiv ℝ u x
  let v := fun (i : J) x => η x * fderiv ℝ u x (b i)
  let C := (Fintype.card J : ℝ) * ‖b.equivFunL.toContinuousLinearMap‖
  have hC : 0 ≤ C := by dsimp [C]; positivity
  have hPoint (x : E) : ‖W x‖ ≤ C * ∑ i : J, ‖v i x‖ := by
    have hSum : 0 ≤ ∑ i : J, ‖v i x‖ := Finset.sum_nonneg fun _ _ => norm_nonneg _
    have hBasis := b.opNorm_le (u := W x) hSum (fun i => by
      change ‖v i x‖ ≤ ∑ j : J, ‖v j x‖
      exact Finset.single_le_sum (fun j _ => norm_nonneg (v j x)) (Finset.mem_univ i))
    simpa only [C, nsmul_eq_mul, Nat.cast_ofNat] using hBasis
  have hPoint' (x : E) : ‖W x‖ ≤ (∅ : Set E).indicator (fun _ => (0 : ℝ)) x +
      ∑ j : J, C * ‖v j x‖ := by
    simpa only [indicator_empty, Pi.zero_apply, zero_add, Finset.mul_sum] using hPoint x
  have hWcont : Continuous W := hη.smul (hu.continuous_fderiv one_ne_zero)
  have hW : MemLp W p μ :=
    bourMemLp_of_indicator_add_sum μ p ∅ MeasurableSet.empty (by simp) W v 0 (fun _ => C)
      hWcont.aestronglyMeasurable hLp (Eventually.of_forall hPoint')
  have hEq : fderiv ℝ u =ᵐ[μ.restrict (Metric.ball z r)] W := by
    filter_upwards [ae_restrict_mem Metric.isOpen_ball.measurableSet] with x hx
    change fderiv ℝ u x = η x • fderiv ℝ u x
    rw [hOne x hx, one_smul]
  have hGlobal := bourLpNorm_le_indicator_add_sum μ p hp hpTop (∅ : Set E)
    MeasurableSet.empty (by simp) W v 0 (fun _ => C) le_rfl (fun _ => hC) hLp hPoint'
  rw [← toReal_eLpNorm, eLpNorm_congr_ae hEq, toReal_eLpNorm]
  exact (lpNorm_restrict_le_of_memLp hW _).trans
    (by simpa only [zero_mul, zero_add, ← Finset.mul_sum] using hGlobal)

end
end SmoothPoincare.Bour
