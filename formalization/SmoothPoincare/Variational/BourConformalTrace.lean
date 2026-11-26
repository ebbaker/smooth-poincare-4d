import SmoothPoincare.Variational.BourTrajectoryBudget
import SmoothPoincare.Variational.ConformalCoreCosts
import SmoothPoincare.Variational.ConformalChiralCharges
import DifferentialGeometry.Analysis.Integration.DivergenceTheorem.Green.Energy
import DifferentialGeometry.Analysis.Elliptic.HarmonicRigidity

/-! # The physical conformal first variation and the closed stationary scalar -/

open DifferentialGeometry DifferentialGeometry.Geometry.Metric DifferentialGeometry.Geometry.Connection DifferentialGeometry.Geometry.Curvature
  DifferentialGeometry.Geometry.Operator DifferentialGeometry.Integral.Measure
  DifferentialGeometry.Integral.DivergenceTheorem Filter FirstOrderTwistor MeasureTheory Set
open DifferentialGeometry.Tensor0SBundle
open scoped ContDiff Manifold Topology

noncomputable section

namespace SmoothPoincare.Bour

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M] [CompactSpace M]
  {o : ManifoldOrientation I M 4}

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

/-- The volume and scalar weights on the actual four-dimensional conformal
metric cancel before differentiation. The physical variation is 2 u g. -/
theorem scalarSq_hasDerivAt_conformal (g : SmoothRiemannianMetric I M) (u : C^∞⟮I, M; ℝ⟯) :
    HasDerivAt (fun t : ℝ => conformalCoreScalarCost g u t univ)
      (-12 * ∫ x, metricScalarAt g x * ΔG g u x ∂riemannianVolumeMeasure I M g) 0 := by
  let μ := riemannianVolumeMeasure I M g
  let R := metricScalarAt g
  let L := ΔG g u
  let Q := conformalCoreGradientSq g u
  have hR : Continuous R := (metricScalar_smooth g).continuous
  have hL : Continuous L := (Δ_g_contMDiff g u).continuous
  have hQ : Continuous Q := by
    have h := gradientFun_smooth g u.contMDiff
    have h' : ContMDiff I 𝓘(ℝ) ∞ Q := fun x =>
      CovariantDerivative.metric_inner_contMDiffAt g h.contMDiffAt h.contMDiffAt le_rfl
    exact h'.continuous
  let A := fun x => R x ^ 2
  let B := fun x => -12 * (R x * L x)
  let D := fun x => 36 * L x ^ 2 - 12 * R x * Q x
  let J := fun x => 72 * (L x * Q x)
  let K := fun x => 36 * Q x ^ 2
  have int {f : M → ℝ} (h : Continuous f) : Integrable f μ := by
    let : IsFiniteMeasureOnCompacts μ := riemannianVolumeMeasure_isFiniteMeasureOnCompacts g
    exact h.integrable_of_hasCompactSupport (HasCompactSupport.of_compactSpace _)
  have hA : Integrable A μ := int (hR.pow 2)
  have hB : Integrable B μ := int (continuous_const.mul (hR.mul hL))
  have hD : Integrable D μ := int ((continuous_const.mul (hL.pow 2)).sub
    ((continuous_const.mul hR).mul hQ))
  have hJ : Integrable J μ := int (continuous_const.mul (hL.mul hQ))
  have hK : Integrable K μ := int (continuous_const.mul (hQ.pow 2))
  let P := fun t : ℝ => (∫ x, B x ∂μ) + t * ((∫ x, D x ∂μ) +
    t * ((∫ x, J x ∂μ) + t * ∫ x, K x ∂μ))
  have he (t : ℝ) : conformalCoreScalarCost g u t univ = (∫ x, A x ∂μ) + t * P t := by
    rw [conformalCore_scalarCost_eq g u t MeasurableSet.univ, setIntegral_univ]
    have horner {a b : M → ℝ} (ha : Integrable a μ) (hb : Integrable b μ) :
        (∫ x, a x + t * b x ∂μ) = (∫ x, a x ∂μ) + t * ∫ x, b x ∂μ := by
      rw [integral_add ha (hb.const_mul t), integral_const_mul]
    let jk := fun x => J x + t * K x
    let dj := fun x => D x + t * jk x
    let bd := fun x => B x + t * dj x
    have hjk : Integrable jk μ := hJ.add (hK.const_mul t)
    have hdj : Integrable dj μ := hD.add (hjk.const_mul t)
    have hbd : Integrable bd μ := hB.add (hdj.const_mul t)
    calc
      _ = ∫ x, A x + t * bd x ∂μ := by
        apply integral_congr_ae
        apply ae_of_all
        intro x
        dsimp only [conformalCoreScalarPolynomial, A, bd, B, dj, D, jk, J, K, L, R, Q]
        have hΔ : laplacian (LeviCivita g) g u x = ΔG g u x := laplacian_levi_eq g u.contMDiff x
        rw [hΔ]
        ring
      _ = _ := by
        rw [horner hA hbd]
        dsimp only [bd]
        rw [horner hB hdj]
        dsimp only [dj]
        rw [horner hD hjk]
        dsimp only [jk, P]
        rw [horner hJ hK]
  have hp : DifferentiableAt ℝ P 0 := by unfold P; fun_prop
  have ht := (hasDerivAt_const 0 (∫ x, A x ∂μ)).add ((hasDerivAt_id 0).mul hp.hasDerivAt)
  have hs : P 0 = -12 * ∫ x, metricScalarAt g x * ΔG g u x ∂riemannianVolumeMeasure I M g := by
    simp only [P, zero_mul, add_zero, B, R, L, μ, integral_const_mul]
  rw [funext he]
  exact ht.congr_deriv (by simpa only [id_eq, zero_mul, one_mul, add_zero, zero_add] using hs)

/-- The tested trace of the original functional. Only local constancy of
the closed Euler integral along this conformal variation is required. -/
theorem bourEnergy_conformal_firstVariation (q : SignedCollarMetric o) (p : ℝ)
    (u : C^∞⟮I, M; ℝ⟯)
    (hEuler : ∀ᶠ t : ℝ in 𝓝 0, bourEuler (q.conformal (t • u)) = bourEuler q) :
    HasDerivAt (fun t : ℝ => bourEnergy p (q.conformal (t • u)))
      (-(p / 2) * ∫ x, u x * ΔG q.metric ⟨_, metricScalar_smooth q.metric⟩ x
        ∂riemannianVolumeMeasure I M q.metric) 0 := by
  let R : C^∞⟮I, M; ℝ⟯ := ⟨metricScalarAt q.metric, metricScalar_smooth q.metric⟩
  let μ := riemannianVolumeMeasure I M q.metric
  let : IsFiniteMeasureOnCompacts μ := riemannianVolumeMeasure_isFiniteMeasureOnCompacts _
  have hi (a b : C^∞⟮I, M; ℝ⟯) :
      Integrable (fun x => a x * ΔG q.metric b x) μ :=
    (a.contMDiff.continuous.mul (Δ_g_contMDiff _ _).continuous).integrable_of_hasCompactSupport
      (HasCompactSupport.of_compactSpace _)
  have hgreen := green_second_integral_smul_laplacian_sub_eq_zero q.metric R.contMDiff u.contMDiff
  change (∫ x, R x * ΔG q.metric u x - u x * ΔG q.metric R x ∂μ) = 0 at hgreen
  rw [integral_sub (hi R u) (hi u R), sub_eq_zero] at hgreen
  have h := ((hasDerivAt_const (0 : ℝ) (2 * q.energy .plus)).add
    (((scalarSq_hasDerivAt_conformal q.metric u).const_mul p).div_const 24)).sub_const
    (p * bourEuler q)
  apply (h.congr_of_eventuallyEq ?_).congr_deriv
  · change 0 + p * (-12 * ∫ x, R x * ΔG q.metric u x ∂μ) / 24 =
      -(p / 2) * ∫ x, u x * ΔG q.metric R x ∂μ
    rw [hgreen]; ring
  · filter_upwards [hEuler] with t ht
    rw [bourEnergy_eq_chiral_scalar, SignedCollarMetric.energy_conformal, ht,
      bourScalar_eq_integral]
    simp [conformalCoreScalarCost, SignedCollarMetric.conformal]

/-- The native covariant two-tensor speed of the physical conformal path. -/
theorem metricVelocity_conformal (q : SignedCollarMetric o) (u : C^∞⟮I, M; ℝ⟯) (x : M) :
    HasDerivAt (fun t : ℝ => metricTensorField (q.conformal (t • u)).metric x)
      ((2 * u x) • metricTensorField q.metric x) 0 := by
  let T := metricTensorField q.metric x
  let A : ℝ →L[ℝ] Tensor0SSpace (𝕜 := ℝ) 2 I x := (ContinuousLinearMap.id ℝ ℝ).smulRight T
  have hp : HasDerivAt (fun t : ℝ => Real.exp (t * (2 * u x))) (2 * u x) 0 := by
    simpa only [id_eq, zero_mul, Real.exp_zero, one_mul] using
      (((hasDerivAt_id (0 : ℝ)).mul_const (2 * u x)).exp)
  have he (t : ℝ) : metricTensorField (q.conformal (t • u)).metric x =
      A (Real.exp (t * (2 * u x))) := by
    ext v
    change metricTensorField (conformalMetric q.metric (t • u)) x v =
      (Real.exp (t * (2 * u x)) • T) v
    simp only [metricTensorField_apply, conformalMetric_inner, smul_apply,
      smul_eq_mul, T]
    change Real.exp (2 * (t * u x)) * _ = Real.exp (t * (2 * u x)) * _
    rw [show 2 * (t * u x) = t * (2 * u x) by ring]
  simp_rw [he]
  exact A.hasFDerivAt.comp_hasDerivAt 0 hp

/-- Every smooth trace of an actual physical gradient with the conformal
pairing equals minus p times the analyst's scalar Laplacian divided by four. -/
theorem gradientTrace_eq_scalarLaplacian (q : SignedCollarMetric o) (p : ℝ)
    (G : (x : M) → Tensor0SSpace (𝕜 := ℝ) 2 I x)
    (hSmooth : ContMDiff I 𝓘(ℝ) ∞ (fun x => inner0S q.metric x 2 (G x) (metricTensorField q.metric x)))
    (hEuler : ∀ u : C^∞⟮I, M; ℝ⟯, ∀ᶠ t : ℝ in 𝓝 0,
      bourEuler (q.conformal (t • u)) = bourEuler q)
    (hPairing : ∀ u : C^∞⟮I, M; ℝ⟯, HasDerivAt (fun t : ℝ => bourEnergy p (q.conformal (t • u)))
      (∫ x, inner0S q.metric x 2 (G x)
        (deriv (fun t : ℝ => metricTensorField (q.conformal (t • u)).metric x) 0)
        ∂riemannianVolumeMeasure I M q.metric) 0) (x : M) :
    inner0S q.metric x 2 (G x) (metricTensorField q.metric x) =
      -(p / 4) * ΔG q.metric ⟨_, metricScalar_smooth q.metric⟩ x := by
  let T : C^∞⟮I, M; ℝ⟯ := ⟨_, hSmooth⟩
  let L : C^∞⟮I, M; ℝ⟯ := ⟨_, Δ_g_contMDiff q.metric ⟨_, metricScalar_smooth q.metric⟩⟩
  let u : C^∞⟮I, M; ℝ⟯ := T + (p/4) • L
  let μ := riemannianVolumeMeasure I M q.metric
  let : IsFiniteMeasureOnCompacts μ := riemannianVolumeMeasure_isFiniteMeasureOnCompacts _
  let : μ.IsOpenPosMeasure := riemannianVolumeMeasure_isOpenPosMeasure _
  have hi (v w : C^∞⟮I, M; ℝ⟯) : Integrable (fun y => v y * w y) μ :=
    (v.contMDiff.continuous.mul w.contMDiff.continuous).integrable_of_hasCompactSupport
      (HasCompactSupport.of_compactSpace _)
  have ht : 2 * (∫ y, u y * T y ∂μ) = -(p / 2) * ∫ y, u y * L y ∂μ := by
    calc
      _ = ∫ y, inner0S q.metric y 2 (G y)
          (deriv (fun t : ℝ => metricTensorField (q.conformal (t • u)).metric y) 0) ∂μ := by
        rw [← integral_const_mul]
        apply integral_congr_ae
        exact ae_of_all _ fun y => by
          calc
            2 * (u y * T y) = inner0S q.metric y 2 (G y)
                ((2 * u y) • metricTensorField q.metric y) := by
              rw [inner0S_smul_right, mul_assoc]; rfl
            _ = _ := congrArg (inner0S q.metric y 2 (G y))
              (metricVelocity_conformal q u y).deriv.symm
      _ = _ := (hPairing u).unique (bourEnergy_conformal_firstVariation q p u (hEuler u))
  have h0 : (∫ y, u y * u y ∂μ) = 0 := by
    calc
      _ = ∫ y, u y * T y + (p/4) * (u y * L y) ∂μ :=
        integral_congr_ae (ae_of_all _ fun y => by change u y * (T y + (p/4) * L y) = _; ring)
      _ = 0 := by rw [integral_add (hi u T) ((hi u L).const_mul _), integral_const_mul]; linarith
  have hae := (integral_eq_zero_iff_of_nonneg_ae (ae_of_all μ fun y => mul_self_nonneg (u y)) (hi u u)).mp h0
  have he := Measure.eqOn_open_of_ae_eq (μ := μ) (U := univ)
    (f := fun y => u y * u y) (g := fun _ => (0 : ℝ))
    (by rw [Measure.restrict_univ]; exact hae) isOpen_univ
    (u.contMDiff.continuous.mul u.contMDiff.continuous).continuousOn continuous_const.continuousOn
  have hx : T x + p/4 * L x = 0 := mul_self_eq_zero.mp (he (mem_univ x))
  change T x = -(p / 4) * L x
  linarith

/-- On a closed connected four-manifold, testing conformal stationarity of
the physical positive-parameter functional against its scalar Laplacian
gives a constant scalar curvature. The trace-free Euler equation is separate. -/
theorem scalar_constant_of_conformal_critical [ConnectedSpace M]
    (q : SignedCollarMetric o) {p : ℝ} (hp : 0 < p)
    (hEuler : ∀ u : C^∞⟮I, M; ℝ⟯, ∀ᶠ t : ℝ in 𝓝 0,
      bourEuler (q.conformal (t • u)) = bourEuler q)
    (hcrit : ∀ u : C^∞⟮I, M; ℝ⟯,
      HasDerivAt (fun t : ℝ => bourEnergy p (q.conformal (t • u))) 0 0) :
    ∃ c : ℝ, ∀ x, metricScalarAt q.metric x = c := by
  let R : C^∞⟮I, M; ℝ⟯ := ⟨_, metricScalar_smooth q.metric⟩
  let L : C^∞⟮I, M; ℝ⟯ := ⟨ΔG q.metric R, Δ_g_contMDiff _ _⟩
  let μ := riemannianVolumeMeasure I M q.metric
  let : IsFiniteMeasureOnCompacts μ := riemannianVolumeMeasure_isFiniteMeasureOnCompacts _
  let : μ.IsOpenPosMeasure := riemannianVolumeMeasure_isOpenPosMeasure _
  have ht := (bourEnergy_conformal_firstVariation q p L (hEuler L)).unique (hcrit L)
  change -(p / 2) * (∫ x, L x * L x ∂μ) = 0 at ht
  have hz := (mul_eq_zero.mp ht).resolve_left (neg_ne_zero.mpr ((half_pos hp).ne'))
  have hi : Integrable (fun x => L x * L x) μ :=
    (L.contMDiff.continuous.mul L.contMDiff.continuous).integrable_of_hasCompactSupport
      (HasCompactSupport.of_compactSpace _)
  have hae := (integral_eq_zero_iff_of_nonneg_ae (ae_of_all μ fun x => mul_self_nonneg (L x)) hi).mp hz
  have he := Measure.eqOn_open_of_ae_eq (μ := μ) (U := univ)
    (f := fun x => L x * L x) (g := fun _ => (0 : ℝ))
    (by rw [Measure.restrict_univ]; exact hae) isOpen_univ
    (L.contMDiff.continuous.mul L.contMDiff.continuous).continuousOn continuous_const.continuousOn
  exact Analysis.Laplacian.exists_eq_const_of_laplacian_eq_zero q.metric R fun x =>
    mul_self_eq_zero.mp (he (mem_univ x))

end SmoothPoincare.Bour
