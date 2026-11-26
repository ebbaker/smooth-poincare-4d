import SmoothPoincare.Variational.BourTerminalStationarity
import DifferentialGeometry.Geometry.Metric.TensorInner.Tensor0S.Coordinates.MetricComparison
import Mathlib.Analysis.Calculus.MeanValue

/-! # Static terminal metrics from native speeds on fixed markings

26 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance.
Actual serving settings were unavailable. Edition 06, E51, Route 12.
-/

set_option autoImplicit false

open DifferentialGeometry DifferentialGeometry.Geometry DifferentialGeometry.Geometry.Curvature
  DifferentialGeometry.PDE.RicciFlow DifferentialGeometry.Tensor0SBundle Filter Set
open scoped ContDiff Manifold Topology

namespace SmoothPoincare.Bour

noncomputable section

variable {E F H H' M N : Type*}
  [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
  [NormedAddCommGroup F] [InnerProductSpace ℝ F]
  [TopologicalSpace H] [TopologicalSpace H']
  {I : ModelWithCorners ℝ E H} {J : ModelWithCorners ℝ F H'}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [TopologicalSpace N] [ChartedSpace H' N] [IsManifold J ∞ N]

/-- On fixed spatial markings, small physical native speeds force the
limiting metric to be constant in time. Only value convergence at the
compared times is required for each metric component. -/
theorem terminalMetric_eq_final_of_nativeSpeed {A : ℝ} (hA : A ≤ 0)
    (g : ℕ → ℝ → SmoothRiemannianMetric I M)
    (G : ℕ → ℝ → (x : M) → Tensor0SSpace (𝕜 := ℝ) 2 I x)
    (h : ℝ → SmoothRiemannianMetric J N)
    (hVel : ∀ᶠ i in atTop, ∀ s ∈ Icc A (0 : ℝ), ∀ y : M,
      HasDerivAt (fun t => metricTensorField (g i t) y) ((-2 : ℝ) • G i s y) s)
    (hLocal : ∀ x : N, ∃ Φ : ℕ → PartialDiffeomorph J I N M ∞,
      (∀ᶠ i in atTop, x ∈ (Φ i).source) ∧
      (∃ B ≥ (0 : ℝ), ∀ᶠ i in atTop, ∀ s ∈ Icc A (0 : ℝ), ∀ v : TangentSpace J x,
        (g i s).inner (Φ i x) (mfderiv J I (Φ i) x v) (mfderiv J I (Φ i) x v) ≤
          B * (h 0).inner x v v) ∧
      (∀ ε > (0 : ℝ), ∀ᶠ i in atTop, ∀ s ∈ Icc A (0 : ℝ),
        Real.sqrt (normSq0S (g i s) (Φ i x) 2 (G i s (Φ i x))) ≤ ε) ∧
      (∀ s ∈ Icc A (0 : ℝ), ∀ v w : TangentSpace J x,
        Tendsto (fun i => (g i s).inner (Φ i x) (mfderiv J I (Φ i) x v) (mfderiv J I (Φ i) x w))
          atTop (𝓝 ((h s).inner x v w)))) :
    ∀ t ∈ Icc A (0 : ℝ), h t = h 0 := by
  intro t ht
  apply SmoothRiemannianMetric.ext_inner
  intro x v w
  obtain ⟨Φ, _, ⟨B, hB, hUpper⟩, hSmall, hValue⟩ := hLocal x
  let X (i : ℕ) := mfderiv J I (Φ i) x v
  let Y (i : ℕ) := mfderiv J I (Φ i) x w
  let f (i : ℕ) (s : ℝ) := (g i s).inner (Φ i x) (X i) (Y i)
  let P := Real.sqrt (B * (h 0).inner x v v) * Real.sqrt (B * (h 0).inner x w w)
  have hP : 0 ≤ P := mul_nonneg (Real.sqrt_nonneg _) (Real.sqrt_nonneg _)
  have hT : Tendsto (fun i => f i 0 - f i t) atTop (𝓝 0) := by
    apply Metric.tendsto_nhds.mpr
    intro ε hε
    let C := (2 * P) * (0 - t)
    have hC : 0 ≤ C := mul_nonneg (mul_nonneg (by norm_num) hP) (sub_nonneg.mpr ht.2)
    let δ := ε / (C + 1)
    have hδ : 0 < δ := div_pos hε (by positivity)
    filter_upwards [hVel, hUpper, hSmall δ hδ] with i hi hU hS
    let V := vec2 (I := I) (X i) (Y i)
    let ev := tensor0SEvalCLM V
    let d : ℝ → ℝ := fun s => (-2 : ℝ) * G i s (Φ i x) V
    have hDer (s : ℝ) (hs : s ∈ Icc t (0 : ℝ)) :
        HasDerivWithinAt (f i) (d s) (Icc t 0) s := by
      have hreg := hi s (Icc_subset_Icc_left ht.1 hs) (Φ i x)
      have hPair := ev.hasFDerivAt.comp_hasDerivAt s hreg
      have hFun : f i = fun r => ev (metricTensorField (g i r) (Φ i x)) := by
        funext r
        change _ = metricTensorField (g i r) (Φ i x) V
        rw [metricTensorField_apply]
        rfl
      rw [hFun]
      apply HasDerivAt.hasDerivWithinAt
      apply hPair.congr_deriv
      change (-2 : ℝ) * G i s (Φ i x) V = (((-2 : ℝ) • G i s (Φ i x)) V)
      simp
    have hDerBound (s : ℝ) (hs : s ∈ Ico t (0 : ℝ)) : ‖d s‖ ≤ 2 * δ * P := by
      have hsA : s ∈ Icc A (0 : ℝ) := Icc_subset_Icc_left ht.1 (Ico_subset_Icc_self hs)
      have hTensor := abs_apply_le_norm0S (g i s) (Φ i x) 2 (G i s (Φ i x)) V
      simp only [Fin.prod_univ_two] at hTensor
      change |G i s (Φ i x) V| ≤ Real.sqrt (normSq0S (g i s) (Φ i x) 2 (G i s (Φ i x))) *
        (Real.sqrt ((g i s).inner (Φ i x) (X i) (X i)) *
          Real.sqrt ((g i s).inner (Φ i x) (Y i) (Y i))) at hTensor
      have hRoots : Real.sqrt ((g i s).inner (Φ i x) (X i) (X i)) *
          Real.sqrt ((g i s).inner (Φ i x) (Y i) (Y i)) ≤ P :=
        mul_le_mul (Real.sqrt_le_sqrt (hU s hsA v)) (Real.sqrt_le_sqrt (hU s hsA w))
          (Real.sqrt_nonneg _) (Real.sqrt_nonneg _)
      have hPair := hTensor.trans (mul_le_mul (hS s hsA) hRoots
        (mul_nonneg (Real.sqrt_nonneg _) (Real.sqrt_nonneg _)) hδ.le)
      rw [Real.norm_eq_abs]
      dsimp only [d]
      rw [abs_mul]
      norm_num
      linarith only [hPair]
    have hDiff := norm_image_sub_le_of_norm_deriv_le_segment' hDer hDerBound
      0 (right_mem_Icc.2 ht.2)
    rw [Real.dist_eq, sub_zero, ← Real.norm_eq_abs]
    have hδC : δ * C < ε := by
      apply (lt_of_le_of_lt ?_ (show ε - δ < ε by linarith only [hδ]))
      have hMul : δ * (C + 1) = ε := div_mul_cancel₀ _ (by positivity)
      linarith only [hMul]
    have hReorder : (2 * δ * P) * (0 - t) = δ * C := by
      dsimp only [C]
      ring
    exact hDiff.trans_lt (hReorder.symm ▸ hδC)
  have hLim := (hValue 0 ⟨hA, le_rfl⟩ v w).sub (hValue t ht v w)
  exact (sub_eq_zero.mp (tendsto_nhds_unique hLim hT)).symm

end
end SmoothPoincare.Bour
