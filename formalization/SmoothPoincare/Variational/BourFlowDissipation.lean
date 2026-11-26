import SmoothPoincare.Variational.IntrinsicTerminalCharge
import DifferentialGeometry.Geometry.Metric.TensorInner.Tensor0S.Scaling
import DifferentialGeometry.Analysis.Integration.Measure.Riemannian.Scaling
import DifferentialGeometry.Analysis.Integration.Measure.Family.VolumeVariation
import Mathlib.MeasureTheory.Integral.IntervalIntegral.FundThmCalculus

/-! # Dissipation on an original fourth-order flow and its parabolic slabs

The first variation pairs the supplied covariant gradient with the actual
metric derivative. Every norm and volume uses the time-slice metric. -/

open DifferentialGeometry DifferentialGeometry.Geometry DifferentialGeometry.Integral.Measure
open DifferentialGeometry.Tensor0SBundle Filter MeasureTheory Set
open scoped ContDiff Manifold Topology

namespace SmoothPoincare.Bour

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [TopologicalSpace M] [ChartedSpace H M]
  [IsManifold I ∞ M] [T2Space M] [CompactSpace M]

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩
private local instance : IsManifold I 1 M := IsManifold.of_le (by decide : (1 : WithTop ℕ∞) ≤ ∞)


/-- Integrated ordinary covariant two-tensor squared norm. -/
noncomputable def gradientSq (g : SmoothRiemannianMetric I M) (G : ((x : M) → Tensor0SSpace (𝕜 := ℝ) (I := I) 2 x)) : ℝ :=
  ∫ x, normSq0S g x 2 (G x) ∂riemannianVolumeMeasure I M g

/-- From the geometric first variation and the negative twice-gradient
equation on the open slab, obtain the energy drop with its actual factor.
Endpoints require only continuity of the functional. -/
theorem energy_drop_eq_two_dissipation (g : ℝ → SmoothRiemannianMetric I M)
    (G : ℝ → ((x : M) → Tensor0SSpace (𝕜 := ℝ) (I := I) 2 x)) (F : ℝ → ℝ) {a b : ℝ} (hab : a ≤ b)
    (hC : ContinuousOn F (Icc a b))
    (hVelocity : ∀ t ∈ Ioo a b, ∀ x : M, HasDerivAt
      (fun s => metricTensorField (g s) x) ((-2 : ℝ) • G t x) t)
    (hVariation : ∀ t ∈ Ioo a b, HasDerivAt F
      (∫ x, inner0S (g t) x 2 (G t x) (deriv (fun s => metricTensorField (g s) x) t)
        ∂riemannianVolumeMeasure I M (g t)) t)
    (hInt : IntervalIntegrable (fun t => gradientSq (g t) (G t)) volume a b) :
    F a - F b = 2 * ∫ t in a..b, gradientSq (g t) (G t) := by
  have hD (t : ℝ) (ht : t ∈ Ioo a b) : HasDerivAt F ((-2 : ℝ) * gradientSq (g t) (G t)) t := by
    apply (hVariation t ht).congr_deriv
    rw [gradientSq, ← integral_const_mul]
    apply integral_congr_ae
    exact ae_of_all _ fun x => by
      calc
        _ = inner0S (g t) x 2 (G t x) ((-2 : ℝ) • G t x) :=
          congrArg (inner0S (g t) x 2 (G t x)) (hVelocity t ht x).deriv
        _ = _ := by rw [inner0S_smul_right, ← normSq0S_eq_inner]
  have h := intervalIntegral.integral_eq_sub_of_hasDerivAt_of_le hab hC hD (hInt.const_mul (-2))
  rw [intervalIntegral.integral_const_mul] at h
  linarith

omit [T2Space M] [CompactSpace M] in
/-- On the fourth-order time change, the actual covariant metric speed
transforms by the inverse metric scale. This identifies the field appearing
in the rescaled dissipation formula on an original negative gradient flow. -/
theorem metricVelocity_scale_time (g : ℝ → SmoothRiemannianMetric I M)
    (G : ℝ → (x : M) → Tensor0SSpace (𝕜 := ℝ) (I := I) 2 x) {c : ℝ} (hc : 0 < c)
    (t₀ s : ℝ) (x : M)
    (hV : HasDerivAt (fun t => metricTensorField (g t) x)
      ((-2 : ℝ) • G (s / c^2 + t₀) x) (s / c^2 + t₀)) :
    HasDerivAt (fun r => metricTensorField (scaleMetric c hc (g (r / c^2 + t₀))) x)
      ((-2 : ℝ) • (c⁻¹ • G (s / c^2 + t₀) x)) s := by
  have hMetric (r : ℝ) : metricTensorField (scaleMetric c hc (g (r / c^2 + t₀))) x =
      c • metricTensorField (g (r / c^2 + t₀)) x := by
    ext v
    simp [metricTensorField_apply, scaleMetric_inner, smul_eq_mul]
  simp_rw [hMetric]
  have hTime := ((hasDerivAt_id s).div_const (c^2)).add_const t₀
  have h := (hV.scomp s hTime).const_smul c
  apply h.congr_deriv
  simp only [smul_smul]
  congr 1
  field_simp

/-- The physical integral of the rescaled covariant speed has weight
minus two under constant metric scaling in dimension four. -/
theorem gradientSq_scale (hdim : Module.finrank ℝ E = 4)
    (g : SmoothRiemannianMetric I M) (G : ((x : M) → Tensor0SSpace (𝕜 := ℝ) (I := I) 2 x)) {c : ℝ} (hc : 0 < c) :
    gradientSq (scaleMetric c hc g) (fun x => c⁻¹ • G x) = (c^2)⁻¹ * gradientSq g G := by
  have hV : (Real.sqrt c)^4 = c^2 := by
    rw [show (4 : ℕ) = 2 * 2 by decide, pow_mul, Real.sq_sqrt hc.le]
  simp only [gradientSq, normSq0S_smul, normSq0S_scale, volume_scaleMetric, hdim,
    integral_smul_measure, ENNReal.toReal_pow, ENNReal.toReal_ofReal (Real.sqrt_nonneg _),
    smul_eq_mul, integral_const_mul, hV]
  field_simp

/-- The scale factor of the physical gradient integral cancels the
Jacobian of the squared time change on any corresponding parabolic slab. -/
theorem parabolic_dissipation_eq (hdim : Module.finrank ℝ E = 4)
    (g : ℝ → SmoothRiemannianMetric I M) (G : ℝ → ((x : M) → Tensor0SSpace (𝕜 := ℝ) (I := I) 2 x)) {c : ℝ} (hc : 0 < c)
    (t₀ a b : ℝ) :
    (∫ s in a..b, gradientSq (scaleMetric c hc (g (s / c^2 + t₀)))
      (fun x => c⁻¹ • G (s / c^2 + t₀) x)) =
      ∫ t in (a / c^2 + t₀)..(b / c^2 + t₀), gradientSq (g t) (G t) := by
  simp_rw [gradientSq_scale hdim _ _ hc]
  rw [intervalIntegral.integral_const_mul]
  exact intervalIntegral.inv_smul_integral_comp_div_add (fun t => gradientSq (g t) (G t)) _ _

/-- For a regular compact metric path, the first variation in the scaling
direction and the trace of the actual velocity give conservation of volume.
The trace-to-gradient equation is written at each point of the open slab. -/
theorem volume_constant_of_scale_variation (g : ℝ → SmoothRiemannianMetric I M) (G : ℝ → ((x : M) → Tensor0SSpace (𝕜 := ℝ) (I := I) 2 x))
    {a b : ℝ} (hab : a ≤ b)
    (hV : ContinuousOn (fun t => (riemannianVolumeMeasure I M (g t)).real univ) (Icc a b))
    (hRegular : ∀ t ∈ Ioo a b, MetricFamilyRegularAt (I := I) g t)
    (hTrace : ∀ t ∈ Ioo a b, ∀ x, traceTimeDerivMetric (I := I) g t x =
      -2 * inner0S (g t) x 2 (G t x) (metricTensorField (g t) x))
    (scaleEnergy : ℝ → ℝ → ℝ)
    (hScale : ∀ t ∈ Ioo a b, scaleEnergy t =ᶠ[𝓝 1] fun _ => scaleEnergy t 1)
    (hVariation : ∀ t ∈ Ioo a b, HasDerivAt (scaleEnergy t)
      (∫ x, inner0S (g t) x 2 (G t x) (metricTensorField (g t) x) ∂riemannianVolumeMeasure I M (g t)) 1) :
    (riemannianVolumeMeasure I M (g b)).real univ = (riemannianVolumeMeasure I M (g a)).real univ := by
  have hDer (t : ℝ) (ht : t ∈ Ioo a b) : HasDerivAt
      (fun s => (riemannianVolumeMeasure I M (g s)).real univ) (0 : ℝ) t := by
    have hZero := ((hVariation t ht).congr_of_eventuallyEq (hScale t ht).symm).unique
      (hasDerivAt_const (1 : ℝ) (scaleEnergy t 1))
    have hr : FunctionRegularAt (fun (_ : ℝ) (_ : M) => (1 : ℝ)) t :=
      FunctionRegularAt.of_contMDiff (I := I) _ contMDiff_const t
    have h := volume_variation_formula (hRegular t ht) hr
    simp only [riemannianMeasureFamily_def, integral_const, smul_eq_mul, mul_one,
      deriv_const, zero_add, hTrace t ht] at h
    convert h using 1
    simp_rw [show ∀ z : ℝ, 1 / 2 * (-2 * z) = -1 * z by intro z; ring, integral_const_mul, hZero]
    ring
  have h := intervalIntegral.integral_eq_sub_of_hasDerivAt_of_le hab hV hDer
    (intervalIntegrable_const (c := (0 : ℝ)))
  simpa using (sub_eq_zero.mp (by simpa using h.symm :
    (riemannianVolumeMeasure I M (g b)).real univ - (riemannianVolumeMeasure I M (g a)).real univ = 0))

end SmoothPoincare.Bour
