import SmoothPoincare.Variational.RetainedScalarDeficit

/-! # Perturbative scalar coercivity on a closed four-dimensional metric -/

noncomputable section
open DifferentialGeometry DifferentialGeometry.Geometry.Curvature
open DifferentialGeometry.Geometry.Operator DifferentialGeometry.Integral.Measure
open DifferentialGeometry.Analysis.Sobolev FirstOrderTwistor MeasureTheory Set
open scoped ContDiff Manifold

namespace SmoothPoincare

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M] [CompactSpace M]

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

/-- A fixed closed four-dimensional metric has a finite positive Sobolev
constant in the physical measure and Dirichlet form of that metric. -/
theorem exists_scalarSobolev_bound (hd : Module.finrank ℝ E = 4)
    (g : SmoothRiemannianMetric I M) :
    ∃ D : ℝ, 0 < D ∧ ∀ f : C^∞⟮I, M; ℝ⟯, Real.sqrt (capFactorVolume g f) ≤
      D * ((∫ x, f x ^ 2 ∂riemannianVolumeMeasure I M g) +
        ∫ x, normGradSqFun g f x ∂riemannianVolumeMeasure I M g) := by
  obtain ⟨C, _, hSob⟩ := sobolev_two_integral g (by rw [hd]; norm_num)
  refine ⟨2 * C ^ 2 + 1, by positivity, fun f => ?_⟩
  have h := hSob f.contMDiff
  rw [hd] at h
  norm_num at h
  rw [← lpNorm_four_sq_eq_capFactorVolume]
  exact h.trans (mul_le_mul_of_nonneg_right (le_add_of_nonneg_right zero_le_one)
    (add_nonneg (integral_nonneg fun _ => sq_nonneg _)
      (integral_nonneg fun x => normGradSqFun_nonneg g f x)))

/-- The physical (L^2) norm of the shortfall below a chosen scalar floor. -/
def scalarFloorDeficitNorm (g : SmoothRiemannianMetric I M) (ρ : ℝ) : ℝ :=
  Real.sqrt (∫ x, (max (ρ - metricScalarAt g x) 0) ^ 2 ∂riemannianVolumeMeasure I M g)

omit [I.Boundaryless] in
theorem scalarFloorDeficitNorm_sq (g : SmoothRiemannianMetric I M) (ρ : ℝ) :
    scalarFloorDeficitNorm g ρ ^ 2 =
       ∫ x, (max (ρ - metricScalarAt g x) 0) ^ 2 ∂riemannianVolumeMeasure I M g :=
  Real.sq_sqrt (integral_nonneg fun _ => sq_nonneg _)

omit [CompactSpace M] in
private theorem continuous_scalarFloorDeficit (g : SmoothRiemannianMetric I M) (ρ : ℝ) :
    Continuous (fun x => max (ρ - metricScalarAt g x) 0) :=
  (continuous_const.sub ((scalarCurv_contMDiff g).continuous.congr
    fun x => (metricScalar_eq_scal g x).symm)).max continuous_const

/-- If the scalar floor is met away from a measurable patch, only the
patch's actual volume and pointwise shortfall enter the bound. -/
theorem scalarFloorDeficitNorm_sq_le_of_floor_off (g : SmoothRiemannianMetric I M)
    {A : Set M} (hA : MeasurableSet A) {ρ B : ℝ} (hB : 0 ≤ B)
    (hOff : ∀ x ∉ A, ρ ≤ metricScalarAt g x)
    (hInside : ∀ x ∈ A, ρ - metricScalarAt g x ≤ B) :
    scalarFloorDeficitNorm g ρ ^ 2 ≤
      B ^ 2 * (riemannianVolumeMeasure I M g).real A := by
  let μ := riemannianVolumeMeasure I M g
  let : IsFiniteMeasureOnCompacts μ := riemannianVolumeMeasure_isFiniteMeasureOnCompacts g
  let d := fun x => (max (ρ - metricScalarAt g x) 0) ^ 2
  have hInt : Integrable d μ := ((continuous_scalarFloorDeficit g ρ).pow 2)
    |>.integrable_of_hasCompactSupport (HasCompactSupport.of_compactSpace _)
  rw [scalarFloorDeficitNorm_sq]
  change ∫ x, d x ∂μ ≤ _
  have hZero (x : M) (hx : x ∉ A) : d x = 0 := by
    simp [d, max_eq_right (sub_nonpos.mpr (hOff x hx))]
  rw [← setIntegral_eq_integral_of_forall_compl_eq_zero hZero]
  calc
    _ ≤ ∫ _ in A, B ^ 2 ∂μ := setIntegral_mono_on hInt.integrableOn
        (integrable_const _).integrableOn hA (fun x hx =>
          pow_le_pow_left₀ (le_max_right _ _) (max_le (hInside x hx) hB) 2)
    _ = _ := by simp [μ, mul_comm]

variable [Nonempty M]

/-- A positive floor minus its actual scalar shortfall bounds the conformal
class from below. The Sobolev inequality uses that same physical metric. -/
theorem classYamabeFour_lower_of_scalarFloorDeficit (hd : Module.finrank ℝ E = 4)
    (g : SmoothRiemannianMetric I M) {ρ D : ℝ} (hρ : 0 ≤ ρ) (hD : 0 < D)
    (hSob : ∀ f : C^∞⟮I, M; ℝ⟯, Real.sqrt (capFactorVolume g f) ≤
      D * ((∫ x, f x ^ 2 ∂riemannianVolumeMeasure I M g) +
        ∫ x, normGradSqFun g f x ∂riemannianVolumeMeasure I M g)) :
    min ρ 6 / D - scalarFloorDeficitNorm g ρ ≤ classYamabeFour hd g := by
  apply le_classYamabeFour_of_capFactorScalar hd g
  intro u
  let μ := riemannianVolumeMeasure I M g
  let : IsFiniteMeasureOnCompacts μ := riemannianVolumeMeasure_isFiniteMeasureOnCompacts g
  let f := capExpFactor u
  let v := fun x => max (ρ - metricScalarAt g x) 0
  let A := ∫ x, f x ^ 2 ∂μ
  let B := ∫ x, normGradSqFun g f x ∂μ
  let c := min ρ 6
  have hA : 0 ≤ A := integral_nonneg fun _ => sq_nonneg _
  have hB : 0 ≤ B := integral_nonneg fun x => normGradSqFun_nonneg g f x
  have hc : 0 ≤ c := le_min hρ (by norm_num)
  have hNeg : (∫ x, v x * f x ^ 2 ∂μ) ≤
      scalarFloorDeficitNorm g ρ * Real.sqrt (capFactorVolume g f) :=
    integral_mul_capFactorSq_le_l2 g v (continuous_scalarFloorDeficit g ρ)
      (fun _ => le_max_right _ _) f
  have hf : Continuous (fun x => f x ^ 2) := f.contMDiff.continuous.pow 2
  have hR : ρ * A ≤ (∫ x, scalarCurv g x * f x ^ 2 ∂μ) + ∫ x, v x * f x ^ 2 ∂μ := by
    have hIntR : Integrable (fun x => scalarCurv g x * f x ^ 2) μ :=
      ((scalarCurv_contMDiff g).continuous.mul hf).integrable_of_hasCompactSupport
        (HasCompactSupport.of_compactSpace _)
    have hIntV : Integrable (fun x => v x * f x ^ 2) μ :=
      ((continuous_scalarFloorDeficit g ρ).mul hf).integrable_of_hasCompactSupport
        (HasCompactSupport.of_compactSpace _)
    rw [← integral_add hIntR hIntV]
    change ρ * (∫ x, f x ^ 2 ∂μ) ≤ _
    rw [← integral_const_mul]
    refine integral_mono ((continuous_const.mul hf).integrable_of_hasCompactSupport
      (HasCompactSupport.of_compactSpace _)) (hIntR.add hIntV) (fun x => ?_)
    change ρ * f x ^ 2 ≤ scalarCurv g x * f x ^ 2 + v x * f x ^ 2
    rw [← add_mul, ← metricScalar_eq_scal]
    apply mul_le_mul_of_nonneg_right _ (sq_nonneg _)
    have hv : ρ - metricScalarAt g x ≤ v x := le_max_left _ _
    linarith only [hv]
  have hLower : c / D * Real.sqrt (capFactorVolume g f) ≤ ρ * A + 6 * B := by
    calc
      _ ≤ c / D * (D * (A + B)) :=
        mul_le_mul_of_nonneg_left (hSob f) (div_nonneg hc hD.le)
      _ = c * (A + B) := by field_simp
      _ = c * A + c * B := mul_add _ _ _
      _ ≤ _ := add_le_add (mul_le_mul_of_nonneg_right (min_le_left _ _) hA)
        (mul_le_mul_of_nonneg_right (min_le_right _ _) hB)
  change (c / D - scalarFloorDeficitNorm g ρ) * Real.sqrt (capFactorVolume g f) ≤ capFactorScalar g f
  rw [capFactorScalar_eq_dirichletForm hd]
  change _ ≤ (∫ x, scalarCurv g x * f x ^ 2 ∂μ) + 6 * B
  linarith only [hLower, hR, hNeg]

end SmoothPoincare
