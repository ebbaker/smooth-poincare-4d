import SmoothPoincare.PhysicalScales.MetricQuantiles
import SmoothPoincare.Variational.ConformalCoreReference
import SmoothPoincare.Variational.IntrinsicEulerDensity
import DifferentialGeometry.Analysis.Integration.Measure.Conformal

/-! # Curvature costs on the native conformal core family -/

open DifferentialGeometry DifferentialGeometry.Geometry.Connection
open DifferentialGeometry.Geometry.Curvature DifferentialGeometry.Geometry.Metric
open DifferentialGeometry.Geometry.Operator DifferentialGeometry.Integral.Measure
open DifferentialGeometry.Tensor.RSTensor DifferentialGeometry.Tensor0SBundle
open DifferentialGeometry.Geometry.Curvature.CovariantDerivative
open Filter FirstOrderTwistor Function Manifold MeasureTheory SectionsAndConnections Set
open scoped ContDiff Manifold Topology

namespace SmoothPoincare

noncomputable section

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "I₄" => 𝓘(ℝ, E₄)

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]

/-- The squared gradient of the logarithmic factor in the source metric. -/
def conformalCoreGradientSq (g : SmoothRiemannianMetric I M)
    (u : C^∞⟮I, M; ℝ⟯) (x : M) : ℝ :=
  g.inner x (gradientFun g u x) (gradientFun g u x)

/-- The scalar-curvature polynomial with its conformal factor removed. -/
def conformalCoreScalarPolynomial (g : SmoothRiemannianMetric I M)
    (u : C^∞⟮I, M; ℝ⟯) (t : ℝ) (x : M) : ℝ :=
  metricScalarAt g x - 6 * t * laplacian (LeviCivita g) g u x -
    6 * t ^ 2 * conformalCoreGradientSq g u x

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

/-- The squared scalar integrated on the test set in the changed metric. -/
def conformalCoreScalarCost [SigmaCompactSpace M] (g : SmoothRiemannianMetric I M)
    (u : C^∞⟮I, M; ℝ⟯) (t : ℝ) (A : Set M) : ℝ :=
  let h := conformalMetric g (t • u)
  ∫ x in A, metricScalarAt h x ^ 2 ∂riemannianVolumeMeasure I M h

/-- The intrinsic full-curvature norm squared on the same test set. -/
def conformalCoreFullCost [SigmaCompactSpace M] (g : SmoothRiemannianMetric I M)
    (u : C^∞⟮I, M; ℝ⟯) (t : ℝ) (A : Set M) : ℝ :=
  let h := conformalMetric g (t • u)
  ∫ x in A, normSq0S h x 4 (metricRm04At h x) ∂riemannianVolumeMeasure I M h

/-- In dimension four the changed volume cancels the scalar weight exactly on
any measurable test set. -/
theorem conformalCore_scalarCost_eq [SigmaCompactSpace M]
    (g : SmoothRiemannianMetric I M) (u : C^∞⟮I, M; ℝ⟯) (t : ℝ)
    {A : Set M} (hA : MeasurableSet A) :
    conformalCoreScalarCost g u t A =
      ∫ x in A, conformalCoreScalarPolynomial g u t x ^ 2 ∂riemannianVolumeMeasure I M g := by
  have hdim : Module.finrank ℝ E₄ = 4 := by simp
  dsimp [conformalCoreScalarCost]
  rw [riemannianVolumeMeasure_conformalMetric, hdim, Nat.cast_ofNat]
  let d := fun x : M => ENNReal.ofReal (Real.exp (4 * (t * u x)))
  have hMeas : Measurable d :=
    (Real.continuous_exp.comp (continuous_const.mul
      (continuous_const.mul u.contMDiff.continuous))).measurable.ennreal_ofReal
  change (∫ x in A, metricScalarAt (conformalMetric g (t • u)) x ^ 2
    ∂(riemannianVolumeMeasure I M g).withDensity d) = _
  rw [setIntegral_withDensity_eq_setIntegral_toReal_smul (μ := riemannianVolumeMeasure I M g)
    (f := d) hMeas
    (Eventually.of_forall fun _ => ENNReal.ofReal_lt_top)
    (fun x => metricScalarAt (conformalMetric g (t • u)) x ^ 2) hA]
  apply setIntegral_congr_fun hA
  intro x _
  dsimp [d]
  rw [conformalCore_scalar_quadratic, ENNReal.toReal_ofReal (Real.exp_pos _).le]
  change Real.exp (4 * (t * u x)) *
    (Real.exp (-(2 * (t * u x))) * conformalCoreScalarPolynomial g u t x) ^ 2 = _
  rw [mul_pow, ← mul_assoc, ← Real.exp_nat_mul, ← Real.exp_add]
  rw [show 4 * (t * u x) + ↑(2 : ℕ) * -(2 * (t * u x)) = 0 by push_cast; ring]
  rw [Real.exp_zero, one_mul]

omit [I.Boundaryless] [T2Space M] in
private theorem continuous_conformalCoreGradientSq (g : SmoothRiemannianMetric I M)
    (u : C^∞⟮I, M; ℝ⟯) : Continuous (conformalCoreGradientSq g u) := by
  have hg := gradientFun_smooth g u.contMDiff
  have h : ContMDiff I 𝓘(ℝ, ℝ) ∞ (conformalCoreGradientSq g u) := by
    intro x
    exact metric_inner_contMDiffAt g hg.contMDiffAt hg.contMDiffAt le_rfl
  exact h.continuous

private theorem continuous_conformalCoreScalarPolynomial (g : SmoothRiemannianMetric I M)
    (u : C^∞⟮I, M; ℝ⟯) (t : ℝ) : Continuous (conformalCoreScalarPolynomial g u t) := by
  have h (x : M) : conformalCoreScalarPolynomial g u t x =
      Real.exp (2 * (t * u x)) * metricScalarAt (conformalMetric g (t • u)) x := by
    rw [conformalCore_scalar_quadratic]
    change _ = Real.exp (2 * (t * u x)) *
      (Real.exp (-(2 * (t * u x))) * conformalCoreScalarPolynomial g u t x)
    rw [← mul_assoc, ← Real.exp_add, add_neg_cancel, Real.exp_zero, one_mul]
  rw [funext h]
  exact (Real.continuous_exp.comp (continuous_const.mul (continuous_const.mul u.contMDiff.continuous))).mul
    (metricScalar_smooth _).continuous

variable [CompactSpace M]

omit [I.Boundaryless] in
private theorem integrableOn_riemannian_of_continuous (g : SmoothRiemannianMetric I M)
    {f : M → ℝ} (hf : Continuous f) (A : Set M) :
    IntegrableOn f A (riemannianVolumeMeasure I M g) := by
  let : IsLocallyFiniteMeasure (riemannianVolumeMeasure I M g) :=
    riemannianVolumeMeasure_isLocallyFiniteMeasure g
  exact (hf.integrable_of_hasCompactSupport (μ := riemannianVolumeMeasure I M g)
    (HasCompactSupport.of_compactSpace f)).integrableOn

/-- Testing the two directions together gives an explicit finite quartic
lower bound in the source volume. -/
theorem conformalCore_scalarCost_two_direction
    (g : SmoothRiemannianMetric I M) (u : C^∞⟮I, M; ℝ⟯) (t : ℝ)
    {A : Set M} (hA : MeasurableSet A) :
    18 * t ^ 4 * (∫ x in A, conformalCoreGradientSq g u x ^ 2 ∂riemannianVolumeMeasure I M g) -
      (∫ x in A, metricScalarAt g x ^ 2 ∂riemannianVolumeMeasure I M g) ≤
      (conformalCoreScalarCost g u t A + conformalCoreScalarCost g u (-t) A) / 2 := by
  let μ := riemannianVolumeMeasure I M g
  let Q := conformalCoreGradientSq g u
  let R := metricScalarAt g
  let P := conformalCoreScalarPolynomial g u
  have hQ : IntegrableOn (fun x => Q x ^ 2) A μ :=
    integrableOn_riemannian_of_continuous g ((continuous_conformalCoreGradientSq g u).pow 2) A
  have hR : IntegrableOn (fun x => R x ^ 2) A μ :=
    integrableOn_riemannian_of_continuous g ((metricScalar_smooth g).continuous.pow 2) A
  have hP (s : ℝ) : IntegrableOn (fun x => P s x ^ 2) A μ :=
    integrableOn_riemannian_of_continuous g ((continuous_conformalCoreScalarPolynomial g u s).pow 2) A
  rw [conformalCore_scalarCost_eq g u t hA, conformalCore_scalarCost_eq g u (-t) hA]
  calc
    _ = ∫ x in A, (18 * t ^ 4 * Q x ^ 2 - R x ^ 2) ∂μ := by
      rw [integral_sub (hQ.const_mul _) hR, integral_const_mul]
    _ ≤ ∫ x in A, ((P t x ^ 2 + P (-t) x ^ 2) / 2) ∂μ := by
      apply integral_mono ((hQ.const_mul _).sub hR) (((hP t).add (hP (-t))).div_const _)
      intro x
      have h₁ := sq_nonneg (R x - 3 * t ^ 2 * Q x)
      have h₂ := sq_nonneg (6 * t * laplacian (LeviCivita g) g u x)
      change 18 * t ^ 4 * Q x ^ 2 - R x ^ 2 ≤
        ((R x - 6 * t * laplacian (LeviCivita g) g u x - 6 * t ^ 2 * Q x) ^ 2 +
          (R x - 6 * (-t) * laplacian (LeviCivita g) g u x - 6 * (-t) ^ 2 * Q x) ^ 2) / 2
      nlinarith only [h₁, h₂]
    _ = _ := by rw [integral_div, integral_add (hP t) (hP (-t))]


omit [CompactSpace M] in
/-- The scalar term is a pointwise lower bound for the full intrinsic curvature
norm in the source normalization. -/
theorem scalarSq_div_six_le_intrinsicCurvatureSq (g : SmoothRiemannianMetric I M)
    (o : ManifoldOrientation I M 4) (x : M) :
    metricScalarAt g x ^ 2 / 6 ≤ normSq0S g x 4 (metricRm04At g x) := by
  let f := orientedOrthonormalFrameAt g o x
  rw [normSq0S_rm04_eq_frameTensorNormSq g o x f,
    metricFrameTensorNormSq_eq_chiral_ricci_scalar g o x f]
  have hW (W : Matrix (Fin 3) (Fin 3) ℝ) : 0 ≤ hilbertSchmidtSq W := by
    unfold hilbertSchmidtSq
    exact Finset.sum_nonneg fun _ _ => Finset.sum_nonneg fun _ _ => sq_nonneg _
  have hRic : 0 ≤ endpointRicciDefectDensity g o x f := by
    unfold endpointRicciDefectDensity
    exact Finset.sum_nonneg fun _ _ => Finset.sum_nonneg fun _ _ => sq_nonneg _
  linarith only [hW (geometricChiralBlock g o x f), hW (endpointNegativeWeylBlock g o x f), hRic]

omit [I.Boundaryless] [CompactSpace M] in
private theorem continuous_intrinsicCurvatureSq [SigmaCompactSpace M]
    (g : SmoothRiemannianMetric I M) :
    Continuous (fun x => normSq0S g x 4 (metricRm04At g x)) := by
  simpa only [metricRm04_apply] using (normSq0S_smooth g (metricRm04 g)).continuous

/-- The intrinsic test evaluates exactly the existing raw full-curvature
measure of the changed metric for any supplied pointwise oriented frames. -/
theorem conformalCore_fullCost_eq_metricMeasure_real (g : SmoothRiemannianMetric I M)
    (o : ManifoldOrientation I M 4) (u : C^∞⟮I, M; ℝ⟯) (t : ℝ)
    (frame : ∀ x, OrientedOrthonormalFrameAt (conformalMetric g (t • u)) o x)
    {A : Set M} (hA : MeasurableSet A) :
    conformalCoreFullCost g u t A =
      (metricFullCurvatureMeasure (conformalMetric g (t • u)) o frame).real A := by
  let h := conformalMetric g (t • u)
  have hDensity :
      (fun x => frameTensorNormSq (metricCurvatureFrameTensor h o x (frame x))) =
        (fun x => normSq0S h x 4 (metricRm04At h x)) :=
    funext fun x => (normSq0S_rm04_eq_frameTensorNormSq h o x (frame x)).symm
  have hIntegrable := integrableOn_riemannian_of_continuous h (continuous_intrinsicCurvatureSq h) A
  rw [← hDensity] at hIntegrable
  rw [metricFullCurvatureMeasure_real_eq_setIntegral _ _ _ hA hIntegrable, hDensity]
  rfl

/-- The full physical charge dominates one sixth of the actual scalar cost
in each changed metric. -/
theorem conformalCore_scalarCost_div_six_le_fullCost (g : SmoothRiemannianMetric I M)
    (o : ManifoldOrientation I M 4) (u : C^∞⟮I, M; ℝ⟯) (t : ℝ) (A : Set M) :
    conformalCoreScalarCost g u t A / 6 ≤ conformalCoreFullCost g u t A := by
  let h := conformalMetric g (t • u)
  change (∫ x in A, metricScalarAt h x ^ 2 ∂riemannianVolumeMeasure I M h) / 6 ≤
    ∫ x in A, normSq0S h x 4 (metricRm04At h x) ∂riemannianVolumeMeasure I M h
  rw [← integral_div]
  have hScalar : Continuous (fun x => metricScalarAt h x ^ 2 / 6) :=
    ((metricScalar_smooth h).continuous.pow 2).div_const _
  exact integral_mono (integrableOn_riemannian_of_continuous h hScalar A)
    (integrableOn_riemannian_of_continuous h (continuous_intrinsicCurvatureSq h) A)
    (scalarSq_div_six_le_intrinsicCurvatureSq h o)

/-- The same test set has a quartic full-curvature price in the two directions. -/
theorem conformalCore_fullCost_two_direction (g : SmoothRiemannianMetric I M)
    (o : ManifoldOrientation I M 4) (u : C^∞⟮I, M; ℝ⟯) (t : ℝ)
    {A : Set M} (hA : MeasurableSet A) :
    3 * t ^ 4 * (∫ x in A, conformalCoreGradientSq g u x ^ 2 ∂riemannianVolumeMeasure I M g) -
      (∫ x in A, metricScalarAt g x ^ 2 ∂riemannianVolumeMeasure I M g) / 6 ≤
      (conformalCoreFullCost g u t A + conformalCoreFullCost g u (-t) A) / 2 := by
  have hScalar := conformalCore_scalarCost_two_direction g u t hA
  have hPos := conformalCore_scalarCost_div_six_le_fullCost g o u t A
  have hNeg := conformalCore_scalarCost_div_six_le_fullCost g o u (-t) A
  linarith only [hScalar, hPos, hNeg]

omit [I.Boundaryless] in
/-- Nonzero differential at a point of an open test set gives positive source
volume to the quartic gradient charge on that set. -/
theorem conformalCore_integral_gradientSq_sq_pos (g : SmoothRiemannianMetric I M)
    (u : C^∞⟮I, M; ℝ⟯) {A : Set M} (hA : IsOpen A) {x : M} (hx : x ∈ A)
    (hdu : mfderiv I 𝓘(ℝ) (u : M → ℝ) x ≠ 0) :
    0 < ∫ y in A, conformalCoreGradientSq g u y ^ 2 ∂riemannianVolumeMeasure I M g := by
  let μ := riemannianVolumeMeasure I M g
  let f := fun y => conformalCoreGradientSq g u y ^ 2
  let : μ.IsOpenPosMeasure := riemannianVolumeMeasure_isOpenPosMeasure g
  have hGrad : gradientFun g u x ≠ 0 := by
    intro hZero
    apply hdu
    ext v
    have hp := inner_gradientFun g (u : M → ℝ) x v
    rw [hZero, map_zero, zero_apply, mvfderiv_real_eq_mfderiv] at hp
    exact hp.symm
  have hq : 0 < conformalCoreGradientSq g u x := g.pos x _ hGrad
  have hf : Continuous f := (continuous_conformalCoreGradientSq g u).pow 2
  have hfx : x ∈ support f := (pow_pos hq 2).ne'
  have hOpen : IsOpen (support f ∩ A) := hf.isOpen_support.inter hA
  have hVolume := hOpen.measure_pos μ ⟨x, hfx, hx⟩
  exact (setIntegral_pos_iff_support_of_nonneg_ae (Eventually.of_forall fun y => sq_nonneg
    (conformalCoreGradientSq g u y)) (integrableOn_riemannian_of_continuous g hf A)).2 hVolume

/-- On a fixed set with positive quartic coefficient no uniform ceiling
bounds the full curvature of all conformal amplitudes. -/
theorem conformalCore_exists_fullCost_gt (g : SmoothRiemannianMetric I M)
    (o : ManifoldOrientation I M 4) (u : C^∞⟮I, M; ℝ⟯) {A : Set M}
    (hA : MeasurableSet A)
    (hQ : 0 < ∫ x in A, conformalCoreGradientSq g u x ^ 2 ∂riemannianVolumeMeasure I M g)
    (K : ℝ) : ∃ t : ℝ, K < conformalCoreFullCost g u t A := by
  let q := ∫ x in A, conformalCoreGradientSq g u x ^ 2 ∂riemannianVolumeMeasure I M g
  let r := (∫ x in A, metricScalarAt g x ^ 2 ∂riemannianVolumeMeasure I M g) / 6
  have hc : 0 < 3 * q := mul_pos (by norm_num) hQ
  let t := max 1 ((K + r + 1) / (3 * q))
  have ht : 1 ≤ t := le_max_left _ _
  have hlarge : K + r + 1 ≤ t * (3 * q) :=
    (div_le_iff₀ hc).mp (le_max_right _ _)
  have hPow : t * (3 * q) ≤ t ^ 4 * (3 * q) :=
    mul_le_mul_of_nonneg_right (le_self_pow₀ ht (by norm_num)) hc.le
  have hPrice := conformalCore_fullCost_two_direction g o u t hA
  change 3 * t ^ 4 * q - r ≤
    (conformalCoreFullCost g u t A + conformalCoreFullCost g u (-t) A) / 2 at hPrice
  by_contra! hAll
  linarith only [hlarge, hPow, hPrice, hAll t, hAll (-t)]

/-- The original selected chart supplies a fixed core-supported family whose
actual curvature cost on its marked inner disk exceeds any given ceiling. -/
theorem exists_selectedConformalCoreCosts_unbounded [ConnectedSpace M]
    (g : SmoothRiemannianMetric I M) (o : ManifoldOrientation I M 4)
    (F : PartialDiffeomorph I₄ I E₄ M ∞) (n : ℕ) (hn : 0 < n)
    (hBuffer : Metric.closedBall (0 : E₄) (1 + 1 / ((n : ℝ) + 1)) ⊆ F.source) :
    ∃ u : C^∞⟮I, M; ℝ⟯,
      let A := F '' Metric.ball (0 : E₄) (1 - 1 / ((n : ℝ) + 1))
      u (F 0) = 1 ∧ tsupport (u : M → ℝ) ⊆ A ∧
      (0 < ∫ x in A, conformalCoreGradientSq g u x ^ 2 ∂riemannianVolumeMeasure I M g) ∧
      ∀ K : ℝ, ∃ t : ℝ, K < conformalCoreFullCost g u t A := by
  obtain ⟨u, x, hOne, hSupport, hx, hdu⟩ := exists_selectedConformalCoreBump F n hn hBuffer
  let w : ℝ := 1 / ((n : ℝ) + 1)
  let A := F '' Metric.ball (0 : E₄) (1 - w)
  have hw : 0 ≤ w := by dsimp [w]; positivity
  have hInner : Metric.closedBall (0 : E₄) (1 - w) ⊆ F.source :=
    (Metric.closedBall_subset_closedBall (by change 1 - w ≤ 1 + w; linarith)).trans hBuffer
  have hA : IsOpen A := image_opens_isOpen F (U := ⟨_, Metric.isOpen_ball⟩)
    (Metric.ball_subset_closedBall.trans hInner)
  have hQ := conformalCore_integral_gradientSq_sq_pos g u hA hx hdu
  exact ⟨u, hOne, hSupport, hQ, conformalCore_exists_fullCost_gt g o u hA.measurableSet hQ⟩

end

end SmoothPoincare
