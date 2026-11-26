import SmoothPoincare.Variational.SpatialEulerFlux
import DifferentialGeometry.Analysis.Calculus.Manifold.LipschitzApproximation

/-! # Sharp spatial cutoff estimate for metric Lipschitz tests -/

open Bundle DifferentialGeometry DifferentialGeometry.Geometry DifferentialGeometry.Geometry.Operator
open DifferentialGeometry.Integral.DivergenceTheorem DifferentialGeometry.Integral.Measure
open Filter MeasureTheory Set
open scoped ContDiff Manifold ENNReal NNReal Topology

noncomputable section

namespace SmoothPoincare

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M] [CompactSpace M]

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

omit [FiniteDimensional ℝ E] [I.Boundaryless] [T2Space M] [CompactSpace M] in
private theorem tangentSectionSliceNorm_continuous (g : SmoothRiemannianMetric I M)
    (X : Cₛ^∞⟮I; E, (TangentSpace I : M → Type _)⟯) :
    Continuous (fun x => Real.sqrt (g.inner x (X x) (X x))) := by
  have h : ContMDiff I (I.prod 𝓘(ℝ, ℝ)) ∞
      (fun x : M => (⟨x, g.inner x (X x) (X x)⟩ : TotalSpace ℝ (Bundle.Trivial M ℝ))) :=
    ContMDiff.clm_bundle_apply₂ (F₁ := E) (F₂ := E) (F₃ := ℝ)
      (b := id) g.contMDiff X.contMDiff X.contMDiff
  have hn : ContMDiff I 𝓘(ℝ, ℝ) ∞ (fun x => g.inner x (X x) (X x)) := by
    intro x
    have hx := h x
    rw [Bundle.contMDiffAt_totalSpace] at hx
    exact hx.2
  exact Real.continuous_sqrt.comp hn.continuous

/-- A metric Lipschitz cutoff is continuous in the manifold topology. -/
theorem metricLipschitzCutoff_continuous (g : SmoothRiemannianMetric I M)
    {χ : M → ℝ} {L : ℝ≥0}
    (hχ : ∀ x y, edist (χ x) (χ y) ≤ (L : ℝ≥0∞) * riemannianEDistOf g x y) : Continuous χ := by
  refine continuous_iff_continuousAt.2 fun x => ?_
  refine Metric.continuousAt_iff'.2 fun ε hε => ?_
  have hthird : 0 < ε / 3 := by linarith
  obtain ⟨f, hf, _, _, hclose, _⟩ :=
    exists_contMDiff_approximation_of_lipschitz_hasCompactSupport g hχ
      (HasCompactSupport.of_compactSpace χ) isOpen_univ (subset_univ _) hthird
  have hnear := (Metric.continuousAt_iff' (b := x)).1 hf.continuous.continuousAt (ε / 3) hthird
  filter_upwards [hnear] with y hy
  rw [Real.dist_eq] at hy ⊢
  have hx := abs_lt.mp (hclose x)
  have hh := abs_lt.mp (hclose y)
  have hh' := abs_lt.mp hy
  exact abs_lt.mpr ⟨by linarith, by linarith⟩

/-- A metric Lipschitz cutoff tests the genuine smooth divergence with
exactly its Lipschitz constant. All metric quantities belong to one slice. -/
theorem lipschitzEulerSpatialFlux_integral_bound (g : SmoothRiemannianMetric I M)
    (X : Cₛ^∞⟮I; E, (TangentSpace I : M → Type _)⟯) (χ : M → ℝ) {L : ℝ≥0}
    (hχ : ∀ x y, edist (χ x) (χ y) ≤ (L : ℝ≥0∞) * riemannianEDistOf g x y) :
    let μ := riemannianVolumeMeasure I M g
    |∫ x, χ x * divergenceG g X x ∂μ| ≤
      (L : ℝ) * ∫ x, Real.sqrt (g.inner x (X x) (X x)) ∂μ := by
  intro μ
  let r := fun x => Real.sqrt (g.inner x (X x) (X x))
  let d := divergenceG g X
  have hχc := metricLipschitzCutoff_continuous g hχ
  have hdc : Continuous d := (divergence_g_contMDiff g X).continuous
  have hrc : Continuous r := tangentSectionSliceNorm_continuous g X
  have hi_r : Integrable r μ := Continuous.integrable_of_hasCompactSupport_riemannianVolumeMeasure
    g hrc (HasCompactSupport.of_compactSpace _)
  have hi_d : Integrable (fun x => |d x|) μ :=
    (Continuous.integrable_of_hasCompactSupport_riemannianVolumeMeasure
      g hdc (HasCompactSupport.of_compactSpace _)).abs
  have hε_bound (ε : ℝ) (hε : 0 < ε) : |∫ x, χ x * d x ∂μ| ≤
      ((L : ℝ) + ε) * (∫ x, r x ∂μ) + ε * (∫ x, |d x| ∂μ) := by
    obtain ⟨f, hf, _, _, hclose, hder⟩ :=
      exists_contMDiff_approximation_of_lipschitz_hasCompactSupport g hχ
        (HasCompactSupport.of_compactSpace χ) isOpen_univ (subset_univ _) hε
    have hStokes := integral_tangentSectionAction_eq_neg_integral_smul_divergence
      g hf X (HasCompactSupport.of_compactSpace _)
    have hSmooth : |∫ x, f x * d x ∂μ| ≤ ((L : ℝ) + ε) * ∫ x, r x ∂μ := by
      rw [← abs_neg (∫ x, f x * d x ∂μ), ← hStokes]
      have hi : Integrable (fun x => |tangentSectionAction X f x|) μ :=
        (Continuous.integrable_of_hasCompactSupport_riemannianVolumeMeasure g
          (tangentSectionAction_contMDiff X hf).continuous
          (HasCompactSupport.of_compactSpace _)).abs
      calc
        _ ≤ ∫ x, |tangentSectionAction X f x| ∂μ := abs_integral_le_integral_abs
        _ ≤ ∫ x, ((L : ℝ) + ε) * r x ∂μ :=
          integral_mono hi (hi_r.const_mul _) (fun x => hder x (X x))
        _ = _ := integral_const_mul _ _
    have hDifference : |∫ x, (χ x - f x) * d x ∂μ| ≤ ε * ∫ x, |d x| ∂μ := by
      have hi : Integrable (fun x => |(χ x - f x) * d x|) μ :=
        (Continuous.integrable_of_hasCompactSupport_riemannianVolumeMeasure g
          ((hχc.sub hf.continuous).mul hdc) (HasCompactSupport.of_compactSpace _)).abs
      calc
        _ ≤ ∫ x, |(χ x - f x) * d x| ∂μ := abs_integral_le_integral_abs
        _ ≤ ∫ x, ε * |d x| ∂μ := integral_mono hi (hi_d.const_mul ε) fun x => by
          rw [abs_mul, abs_sub_comm]
          exact mul_le_mul_of_nonneg_right (hclose x).le (abs_nonneg _)
        _ = _ := integral_const_mul _ _
    have hi1 : Integrable (fun x => f x * d x) μ :=
      Continuous.integrable_of_hasCompactSupport_riemannianVolumeMeasure g
        (hf.continuous.mul hdc) (HasCompactSupport.of_compactSpace _)
    have hi2 : Integrable (fun x => (χ x - f x) * d x) μ :=
      Continuous.integrable_of_hasCompactSupport_riemannianVolumeMeasure g
        ((hχc.sub hf.continuous).mul hdc) (HasCompactSupport.of_compactSpace _)
    have hsplit : (∫ x, χ x * d x ∂μ) = (∫ x, f x * d x ∂μ) + ∫ x, (χ x - f x) * d x ∂μ := by
      rw [← integral_add hi1 hi2]
      congr 1
      funext x
      ring
    rw [hsplit]
    exact (abs_add_le _ _).trans (add_le_add hSmooth hDifference)
  apply le_of_forall_pos_le_add
  intro η hη
  let A := ∫ x, r x ∂μ
  let B := ∫ x, |d x| ∂μ
  have hA : 0 ≤ A := integral_nonneg fun x => Real.sqrt_nonneg _
  have hB : 0 ≤ B := integral_nonneg fun x => abs_nonneg _
  let ε := η / (A + B + 1)
  have hε : 0 < ε := div_pos hη (by linarith)
  have heq : ε * (A + B + 1) = η := div_mul_cancel₀ _ (ne_of_gt (by linarith))
  have h := hε_bound ε hε
  change |∫ x, χ x * d x ∂μ| ≤ ((L : ℝ) + ε) * A + ε * B at h
  change |∫ x, χ x * d x ∂μ| ≤ (L : ℝ) * A + η
  nlinarith only [h, heq, hε.le]

/-- Spatial Hölder turns the sharp Lipschitz test estimate into the product
of the two supplied physical slice norms. -/
theorem lipschitzEulerSpatialFlux_integral_bound_of_pointwise
    (g : SmoothRiemannianMetric I M) (X : Cₛ^∞⟮I; E, (TangentSpace I : M → Type _)⟯)
    (χ : M → ℝ) {L : ℝ≥0}
    (hχ : ∀ x y, edist (χ x) (χ y) ≤ (L : ℝ≥0∞) * riemannianEDistOf g x y)
    (U N : M → ℝ) {c : ℝ} (hc : 0 ≤ c) :
    let μ := riemannianVolumeMeasure I M g
    MemLp U 2 μ → MemLp N 2 μ → (∀ x, 0 ≤ U x) → (∀ x, 0 ≤ N x) →
    (∀ x, Real.sqrt (g.inner x (X x) (X x)) ≤ c * (U x * N x)) →
    |∫ x, χ x * divergenceG g X x ∂μ| ≤
      (c * (L : ℝ)) * (Real.sqrt (∫ x, U x ^ 2 ∂μ) * Real.sqrt (∫ x, N x ^ 2 ∂μ)) := by
  intro μ hU hN hUn hNn hX
  have hprod : Integrable (fun x => U x * N x) μ := hU.integrable_mul hN
  have hri : Integrable (fun x => Real.sqrt (g.inner x (X x) (X x))) μ :=
    Continuous.integrable_of_hasCompactSupport_riemannianVolumeMeasure g
      (tangentSectionSliceNorm_continuous g X) (HasCompactSupport.of_compactSpace _)
  have hH := integral_mul_le_Lp_mul_Lq_of_nonneg
    (by rw [Real.holderConjugate_iff]; norm_num : (2 : ℝ).HolderConjugate 2) (μ := μ)
      (ae_of_all _ hUn) (ae_of_all _ hNn) (by simpa using hU) (by simpa using hN)
  simp only [Real.rpow_two, ← Real.sqrt_eq_rpow] at hH
  calc
    _ ≤ (L : ℝ) * ∫ x, Real.sqrt (g.inner x (X x) (X x)) ∂μ :=
      lipschitzEulerSpatialFlux_integral_bound g X χ hχ
    _ ≤ (L : ℝ) * ∫ x, c * (U x * N x) ∂μ :=
      mul_le_mul_of_nonneg_left (integral_mono hri (hprod.const_mul c) hX) L.coe_nonneg
    _ = (L : ℝ) * (c * ∫ x, U x * N x ∂μ) := by rw [integral_const_mul]
    _ ≤ (L : ℝ) * (c * (Real.sqrt (∫ x, U x ^ 2 ∂μ) * Real.sqrt (∫ x, N x ^ 2 ∂μ))) :=
      mul_le_mul_of_nonneg_left (mul_le_mul_of_nonneg_left hH hc) L.coe_nonneg
    _ = _ := by ring

end SmoothPoincare
