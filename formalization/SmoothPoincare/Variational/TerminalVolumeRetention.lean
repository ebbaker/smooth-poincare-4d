import SmoothPoincare.Variational.IntrinsicTerminalCharge
import DifferentialGeometry.Geometry.Flow.RicciFlow.Solution.VolumeGrowth
import DifferentialGeometry.Geometry.Flow.RicciFlow.Solution.VolumeContinuity

/-! # Whole-slice volume retention under the terminal curvature budget -/

open DifferentialGeometry DifferentialGeometry.Geometry.Curvature
  DifferentialGeometry.Integral.Measure DifferentialGeometry.PDE.RicciFlow
  DifferentialGeometry.Tensor0SBundle FirstOrderTwistor Set MeasureTheory Filter
open scoped Manifold ContDiff Topology ENNReal

noncomputable section
namespace SmoothPoincare

variable {E H : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
  [FiniteDimensional ℝ E] [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  {D : RealTimeInterval}

private local instance : CompleteSpace E := FiniteDimensional.complete ℝ E
private local instance {X : Type*} [TopologicalSpace X] : MeasurableSpace X := borel X
private local instance {X : Type*} [TopologicalSpace X] : BorelSpace X := ⟨rfl⟩

section Slice

variable {M : Type*} [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [T2Space M] [BoundarylessManifold I M]

private theorem abs_metricScalarAt_le_fullCurvature
    (o : ManifoldOrientation I M 4) (g : SmoothRiemannianMetric I M) (x : M) :
    |metricScalarAt g x| ≤ Real.sqrt 6 * testedEulerCurvatureNorm g x := by
  let f := orientedOrthonormalFrameAt g o
  apply (sq_le_sq₀ (abs_nonneg _) (mul_nonneg (Real.sqrt_nonneg _) (Real.sqrt_nonneg _))).mp
  change |metricScalarAt g x| ^ 2 ≤
    (Real.sqrt 6 * Real.sqrt (normSq0S g x 4 (metricRm04 g x))) ^ 2
  rw [sq_abs, mul_pow, Real.sq_sqrt (by norm_num : (0 : ℝ) ≤ 6),
    Real.sq_sqrt (normSq0S_nonneg _ _ _ _), metricRm04_apply]
  change (metricScalarAt g x)^2 ≤ 6 * intrinsicCurvatureSq g x
  rw [(intrinsicTerminalCharge_eq_modifiedChargeDensity g o f x).1]
  have hsplit : modifiedChargeDensity o g f .full x = 4 *
      (modifiedChargeDensity o g f .plus x + modifiedChargeDensity o g f .minus x) +
      2 * modifiedChargeDensity o g f .ricci x + (metricScalarAt g x)^2 / 6 :=
    metricFrameTensorNormSq_eq_chiral_ricci_scalar g o x (f x)
  linarith only [hsplit, modifiedChargeDensity_nonneg o g f .plus x,
    modifiedChargeDensity_nonneg o g f .minus x, modifiedChargeDensity_nonneg o g f .ricci x]

variable [CompactSpace M]

private theorem abs_integral_scalar_le_curvatureBudget
    (o : ManifoldOrientation I M 4) (g : SmoothRiemannianMetric I M) {A : ℝ}
    (hA : Real.sqrt (∫ x, testedEulerCurvatureNorm g x ^ 2
      ∂riemannianVolumeMeasure I M g) ≤ A) :
    |∫ x, metricScalarAt g x ∂riemannianVolumeMeasure I M g| ≤
      Real.sqrt 6 * A * Real.sqrt ((riemannianVolumeMeasure I M g) univ).toReal := by
  let μ := riemannianVolumeMeasure I M g
  let U := testedEulerCurvatureNorm g
  let : IsFiniteMeasureOnCompacts μ := riemannianVolumeMeasure_isFiniteMeasureOnCompacts g
  have hU : Continuous U := (normSq0S_cont g (metricRm04 g)).sqrt
  have hUp : MemLp U 2 μ := hU.memLp_of_hasCompactSupport (HasCompactSupport.of_compactSpace _)
  have hOne : MemLp (fun _ : M => (1 : ℝ)) 2 μ :=
    continuous_const.memLp_of_hasCompactSupport (HasCompactSupport.of_compactSpace _)
  have hScalar := (metricScalar_smooth g).continuous.integrable_of_hasCompactSupport
    (HasCompactSupport.of_compactSpace (metricScalarAt g)) (μ := μ)
  have hUi := hU.integrable_of_hasCompactSupport (HasCompactSupport.of_compactSpace U) (μ := μ)
  have hH := integral_mul_le_Lp_mul_Lq_of_nonneg (f := U) (g := fun _ : M => (1 : ℝ))
    (by rw [Real.holderConjugate_iff]; norm_num : (2 : ℝ).HolderConjugate 2) (μ := μ)
    (ae_of_all _ fun x => Real.sqrt_nonneg (normSq0S g x 4 (metricRm04 g x)))
    (ae_of_all _ fun _ : M => (zero_le_one : (0 : ℝ) ≤ 1))
    (by simpa using hUp) (by simpa using hOne)
  simp only [Real.rpow_two, ← Real.sqrt_eq_rpow, one_pow, mul_one, integral_const,
    smul_eq_mul, Measure.real_def] at hH
  calc
    _ ≤ ∫ x, |metricScalarAt g x| ∂μ := abs_integral_le_integral_abs
    _ ≤ ∫ x, Real.sqrt 6 * U x ∂μ :=
      integral_mono hScalar.abs (hUi.const_mul _) (abs_metricScalarAt_le_fullCurvature o g)
    _ = Real.sqrt 6 * (∫ x, U x ∂μ) := integral_const_mul _ _
    _ ≤ Real.sqrt 6 * (Real.sqrt (∫ x, U x ^ 2 ∂μ) * Real.sqrt (μ univ).toReal) :=
      mul_le_mul_of_nonneg_left hH (Real.sqrt_nonneg _)
    _ ≤ Real.sqrt 6 * (A * Real.sqrt (μ univ).toReal) :=
      mul_le_mul_of_nonneg_left (mul_le_mul_of_nonneg_right hA (Real.sqrt_nonneg _))
        (Real.sqrt_nonneg _)
    _ = _ := by ring

variable [Nonempty M]

omit [BoundarylessManifold I M] in
private theorem volume_pos_at_metric (g : SmoothRiemannianMetric I M) :
    0 < ((riemannianVolumeMeasure I M g) univ).toReal := by
  let μ := riemannianVolumeMeasure I M g
  let : IsFiniteMeasureOnCompacts μ := riemannianVolumeMeasure_isFiniteMeasureOnCompacts g
  let : μ.IsOpenPosMeasure := riemannianVolumeMeasure_isOpenPosMeasure g
  exact ENNReal.toReal_pos (isOpen_univ.measure_pos μ univ_nonempty).ne'
    isCompact_univ.measure_lt_top.ne

/-- Under the full-curvature `L²` cap, the square root of actual total
volume has a uniform slope bound across the supplied endpoints. -/
theorem ricciFlow_terminal_sqrtVolume_change_le
    (S : SolutionOn (I := I) (M := M) D) (hS : IsSolutionOn S)
    (o : ManifoldOrientation I M 4) {τ A : ℝ}
    (hτ : 0 < τ) (hCarrier : Icc 0 τ ⊆ D.carrier) (hRegular : Ioo 0 τ ⊆ D.regular) :
    let g := S.family.metric
    let μ := fun s => riemannianVolumeMeasure I M (g s)
    (∀ s ∈ Ioo 0 τ, Real.sqrt (∫ x, testedEulerCurvatureNorm (g s) x ^ 2 ∂(μ s)) ≤ A) →
    |Real.sqrt ((μ τ) univ).toReal - Real.sqrt ((μ 0) univ).toReal| ≤
      (Real.sqrt 6 / 2) * A * τ := by
  intro g μ hA
  let V := fun s => ((μ s) univ).toReal
  let V' := fun s => -(∫ x, metricScalarAt (g s) x ∂(μ s)) / (2 * Real.sqrt (V s))
  have hV : ContinuousOn (fun s => Real.sqrt (V s)) (Icc 0 τ) :=
    Real.continuous_sqrt.comp_continuousOn ((S.continuousOn_volume hS).mono hCarrier)
  have hD (s : ℝ) (hs : s ∈ Ioo 0 τ) :
      HasDerivAt (fun t => Real.sqrt (V t)) (V' s) s := by
    exact (S.hasDerivAt_volume hS (hRegular hs)).sqrt (volume_pos_at_metric (g s)).ne'
  have hbound (s : ℝ) (hs : s ∈ Ioo 0 τ) : |V' s| ≤ (Real.sqrt 6 / 2) * A := by
    have hDen : 0 < 2 * Real.sqrt (V s) := mul_pos (by norm_num)
      (Real.sqrt_pos.2 (volume_pos_at_metric (g s)))
    dsimp only [V']
    rw [abs_div, abs_neg, abs_of_pos hDen]
    apply (div_le_iff₀ hDen).2
    calc
      _ ≤ Real.sqrt 6 * A * Real.sqrt (V s) := abs_integral_scalar_le_curvatureBudget o (g s) (hA s hs)
      _ = _ := by ring
  obtain ⟨s, hs, he⟩ := exists_hasDerivAt_eq_slope (fun t => Real.sqrt (V t)) V' hτ hV hD
  have h := hbound s hs
  rw [he, sub_zero, abs_div, abs_of_pos hτ] at h
  exact (div_le_iff₀ hτ).mp h

end Slice

section Sequence

variable {M : ℕ → Type*} [∀ i, TopologicalSpace (M i)] [∀ i, ChartedSpace H (M i)]
  [∀ i, IsManifold I ∞ (M i)] [∀ i, T2Space (M i)] [∀ i, CompactSpace (M i)]
  [∀ i, BoundarylessManifold I (M i)] [∀ i, Nonempty (M i)]

/-- Divergent initial volumes retain their divergence at each fixed positive
time with a common curvature cap. -/
theorem ricciFlow_terminal_volume_tendsto_atTop
    (S : ∀ i, SolutionOn (I := I) (M := M i) D) (hS : ∀ i, IsSolutionOn (S i))
    (o : ∀ i, ManifoldOrientation I (M i) 4) {τ A : ℝ}
    (hτ : 0 < τ) (hA : 0 ≤ A) (hCarrier : Icc 0 τ ⊆ D.carrier) (hRegular : Ioo 0 τ ⊆ D.regular) :
    let g := fun i => (S i).family.metric
    let μ := fun i s => riemannianVolumeMeasure I (M i) (g i s)
    (∀ i, ∀ s ∈ Ioo 0 τ, Real.sqrt (∫ x, testedEulerCurvatureNorm (g i s) x ^ 2 ∂(μ i s)) ≤ A) →
    Tendsto (fun i => ((μ i 0) univ).toReal) atTop atTop →
    Tendsto (fun i => ((μ i τ) univ).toReal) atTop atTop := by
  intro g μ hBudget hInitial
  let C := (Real.sqrt 6 / 2) * A * τ
  have hC : 0 ≤ C := by dsimp [C]; positivity
  refine tendsto_atTop.2 fun m => ?_
  let k := Real.sqrt (max m 0)
  filter_upwards [(tendsto_atTop.1 hInitial) ((k+C)^2)] with i hi
  have hd := (abs_le.mp (ricciFlow_terminal_sqrtVolume_change_le
    (S i) (hS i) (o i) hτ hCarrier hRegular (hBudget i))).1
  have hk : 0 ≤ k := Real.sqrt_nonneg _
  have hsqrt := (Real.sqrt_le_sqrt hi)
  rw [Real.sqrt_sq (add_nonneg hk hC)] at hsqrt
  have h := pow_le_pow_left₀ hk (show k ≤ Real.sqrt ((μ i τ) univ).toReal by
    change -C ≤ Real.sqrt ((μ i τ) univ).toReal - Real.sqrt ((μ i 0) univ).toReal at hd
    linarith only [hd, hsqrt]) 2
  rw [Real.sq_sqrt ENNReal.toReal_nonneg] at h
  change (Real.sqrt (max m 0))^2 ≤ ((μ i τ) univ).toReal at h
  rw [Real.sq_sqrt (le_max_right m 0)] at h
  exact (le_max_left m 0).trans h

end Sequence

end SmoothPoincare
