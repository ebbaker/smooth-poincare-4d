import SmoothPoincare.Variational.BourStationary
import SmoothPoincare.Variational.BourMarkedCore
import DifferentialGeometry.Geometry.Comparison.CheegerGromovTaylor.InjectivityRadius.LocalVolume
import DifferentialGeometry.Geometry.Curvature.Ricci.PointwiseLowerBound
import DifferentialGeometry.Geometry.Exponential.IntrinsicBallVolume
import DifferentialGeometry.Geometry.Exponential.Intrinsic.Framed.BallImage
import DifferentialGeometry.Geometry.Exponential.Intrinsic.Framed.BallChartMetric

/-! # Uniform geometric balls for the stationary harmonic-coordinate step -/

set_option autoImplicit false

noncomputable section

open Bundle DifferentialGeometry DifferentialGeometry.Geometry.Curvature
open DifferentialGeometry.Geometry.Riemannian DifferentialGeometry.Geometry.Riemannian.BonnetMyers
open DifferentialGeometry.Geometry.Riemannian.Exponential
open DifferentialGeometry.Geometry.Riemannian.NormalCoordinates
open DifferentialGeometry.Geometry.Riemannian.VolumeComparison
open DifferentialGeometry.Integral.Measure DifferentialGeometry.Tensor0SBundle
open Filter FirstOrderTwistor Manifold MeasureTheory Set
open scoped ContDiff ENNReal Manifold Topology

namespace SmoothPoincare

variable {E H M : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [T2Space M] [CompactSpace M] [ConnectedSpace M]

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩
private local instance : MeasurableSpace E := borel E
private local instance : BorelSpace E := ⟨rfl⟩
private local instance : CompleteSpace E := FiniteDimensional.complete ℝ E

attribute [-instance] Tensor0SBundle.tangentSpaceNormedAddCommGroup
  Tensor0SBundle.tangentSpaceNormedSpace in
/-- The intrinsic injectivity radius realized using the actual metric's
tangent norms and length distance. -/
def bourPhysicalInjRadius [NeZero (Module.finrank ℝ E)]
    (g : SmoothRiemannianMetric I M) (x : M) : ℝ≥0∞ := by
  let : TopologicalSpace.MetrizableSpace M := Manifold.metrizableSpace I M
  let : T3Space M := inferInstance
  let : RiemannianBundle (TangentSpace I : M → Type _) := ⟨g.toRiemannianMetric⟩
  let : IsContinuousRiemannianBundle E (TangentSpace I : M → Type _) :=
    ⟨g.inner, g.contMDiff.continuous, fun _ _ _ => rfl⟩
  let : PseudoEMetricSpace M := PseudoEMetricSpace.ofRiemannianMetric I M
  let : CompleteSpace M := inferInstance
  let hRiemannian : IsRiemannianManifold I M := ⟨fun _ _ => rfl⟩
  exact @intrinsicInjRadius E inferInstance inferInstance inferInstance inferInstance
    H inferInstance I inferInstance M inferInstance inferInstance inferInstance inferInstance
    inferInstance inferInstance inferInstance hRiemannian inferInstance inferInstance g
    (fun z v => tensor0SBundle_enorm_eq_riemannianBundle_enorm (I := I) g z v) x

omit [I.Boundaryless] [CompactSpace M] [ConnectedSpace M] in
/-- The physical four-index curvature square has weight minus two. -/
theorem bourFullCurvatureSq_scale (g : SmoothRiemannianMetric I M)
    {a : ℝ} (ha : 0 < a) (x : M) :
    intrinsicCurvatureSq (scaleMetric a ha g) x = a⁻¹ ^ 2 * intrinsicCurvatureSq g x := by
  let : IsManifold I 1 M := IsManifold.of_le (n := ∞) (by decide)
  change normSq0S (scaleMetric a ha g) x 4 (metricRm04 (scaleMetric a ha g) x) = _
  rw [metricRm_scale a ha g x, normSq0S_scale, normSq0S_smul, ← mul_assoc]
  change a⁻¹ ^ 4 * a ^ 2 * intrinsicCurvatureSq g x = _
  field_simp

omit [I.Boundaryless] [CompactSpace M] [ConnectedSpace M] in
theorem bourFullCurvatureNorm_scale (g : SmoothRiemannianMetric I M)
    {a : ℝ} (ha : 0 < a) (x : M) :
    Real.sqrt (intrinsicCurvatureSq (scaleMetric a ha g) x) =
      Real.sqrt (intrinsicCurvatureSq g x) / a := by
  rw [bourFullCurvatureSq_scale g ha x, Real.sqrt_mul (sq_nonneg _),
    Real.sqrt_sq (inv_nonneg.mpr ha.le), div_eq_mul_inv, mul_comm]

omit [I.Boundaryless] [T2Space M] [CompactSpace M] [ConnectedSpace M] in
/-- Taking the square root of the Bour quarter-square budget requires a
factor of two to bound the ordered full curvature norm. -/
theorem bourFullCurvatureNorm_le_of_quarterSq
    (g : SmoothRiemannianMetric I M) (x : M) {K : ℝ} (hK : 0 ≤ K)
    (h : intrinsicCurvatureSq g x / 4 ≤ K ^ 2) :
    Real.sqrt (intrinsicCurvatureSq g x) ≤ 2 * K := by
  refine Real.sqrt_le_iff.2 ⟨by positivity, ?_⟩
  nlinarith only [h]

omit [I.Boundaryless] [ConnectedSpace M] in
theorem bourFullCurvatureNorm_attains_max [Nonempty M] (g : SmoothRiemannianMetric I M) :
    ∃ x : M, ∀ z : M, Real.sqrt (intrinsicCurvatureSq g z) ≤
      Real.sqrt (intrinsicCurvatureSq g x) := by
  have hSq : Continuous (intrinsicCurvatureSq g) := by
    change Continuous (fun z => normSq0S g z 4 (metricRm04At g z))
    simpa only [metricRm04_apply] using normSq0S_cont g (metricRm04 g)
  obtain ⟨x, _, hx⟩ := isCompact_univ.exists_isMaxOn univ_nonempty
    (Real.continuous_sqrt.comp hSq).continuousOn
  exact ⟨x, fun z => hx (Set.mem_univ z)⟩

omit [I.Boundaryless] [CompactSpace M] [ConnectedSpace M] in
/-- Normalizing by a positive full-curvature maximum bounds all normalized
points by one and retains curvature one at the chosen base point. -/
theorem bourCurvatureMaximum_scale (g : SmoothRiemannianMetric I M) (x : M) {Q : ℝ}
    (hQ : 0 < Q) (hQx : Real.sqrt (intrinsicCurvatureSq g x) = Q)
    (hmax : ∀ z : M, Real.sqrt (intrinsicCurvatureSq g z) ≤ Q) :
    (∀ z : M, Real.sqrt (intrinsicCurvatureSq (scaleMetric Q hQ g) z) ≤ 1) ∧
      Real.sqrt (intrinsicCurvatureSq (scaleMetric Q hQ g) x) = 1 := by
  constructor
  · intro z
    rw [bourFullCurvatureNorm_scale g hQ z]
    exact (div_le_one hQ).2 (hmax z)
  · rw [bourFullCurvatureNorm_scale g hQ x, hQx, div_self hQ.ne']

attribute [-instance] Tensor0SBundle.tangentSpaceNormedAddCommGroup
  Tensor0SBundle.tangentSpaceNormedSpace in
/-- A physical volume lower bound and a zeroth-order full curvature bound
give one injectivity bound for every eligible metric on the closed carrier.
In particular the positive constant can be chosen before the metric index. -/
theorem bourUniformInjectivity_of_ballVolume [NeZero (Module.finrank ℝ E)]
    (hd : Module.finrank ℝ E = 4) {κ K : ℝ} (hκ : 0 < κ) (hK : 0 < K) :
    ∃ i₀ : ℝ, 0 < i₀ ∧ ∀ g : SmoothRiemannianMetric I M,
      (∀ x : M, Real.sqrt (intrinsicCurvatureSq g x) ≤ K) →
      (∀ (x : M) (r : ℝ), 0 < r → r ≤ 1 → κ * r ^ 4 ≤ bourBallVolume g x r) →
      ∀ x : M, ENNReal.ofReal i₀ ≤ bourPhysicalInjRadius g x := by
  obtain ⟨d, hd0, hd1, herror⟩ :=
    exists_uniform_local_jacobi_scale (Module.finrank ℝ E) (R := 1) (K := K) one_pos hK.le
  let ρ := min d (Real.pi / Real.sqrt K)
  have hρ : 0 < ρ := lt_min hd0 (div_pos Real.pi_pos (Real.sqrt_pos.mpr hK))
  have hρ1 : ρ ≤ 1 := (min_le_left _ _).trans hd1
  have hρpi : ρ ≤ Real.pi / Real.sqrt K := min_le_right _ _
  let s := ρ / 8
  have hs : 0 < s := by dsimp [s]; positivity
  have hs1 : s ≤ 1 := by dsimp [s]; linarith
  let q := Real.sqrt (16 * K / 3)
  have hq : 0 ≤ q := Real.sqrt_nonneg _
  let D : ℝ≥0∞ :=
    (volume : Measure (EuclideanSpace ℝ (Fin (Module.finrank ℝ E)))).toSphere Set.univ *
        ENNReal.ofReal (hyperbolicRadialVolume q (Module.finrank ℝ E - 1) s) +
      (volume : Measure E).toSphere Set.univ *
        ENNReal.ofReal (hyperbolicRadialVolume q (Module.finrank ℝ E - 1) (s + s))
  have hD : D ≠ ⊤ :=
    ENNReal.add_ne_top.mpr ⟨ENNReal.mul_ne_top (measure_ne_top _ _) ENNReal.ofReal_ne_top,
      ENNReal.mul_ne_top (measure_ne_top _ _) ENNReal.ofReal_ne_top⟩
  let C := D.toReal + 1
  have hC : 0 < C := by dsimp [C]; positivity
  have hDC : D ≤ ENNReal.ofReal C := by
    rw [← ENNReal.ofReal_toReal hD]
    exact ENNReal.ofReal_le_ofReal (le_add_of_nonneg_right zero_le_one)
  let i₀ := (s / 2) * (κ * s ^ 4) / C
  have hi₀ : 0 < i₀ := div_pos (mul_pos (half_pos hs) (mul_pos hκ (pow_pos hs _))) hC
  refine ⟨i₀, hi₀, ?_⟩
  intro g hRm hVolume x
  let : TopologicalSpace.MetrizableSpace M := Manifold.metrizableSpace I M
  let : T3Space M := inferInstance
  let : RiemannianBundle (TangentSpace I : M → Type _) := ⟨g.toRiemannianMetric⟩
  let : IsContinuousRiemannianBundle E (TangentSpace I : M → Type _) :=
    ⟨g.inner, g.contMDiff.continuous, fun _ _ _ => rfl⟩
  let : PseudoEMetricSpace M := PseudoEMetricSpace.ofRiemannianMetric I M
  let : CompleteSpace M := inferInstance
  let hEnorm : IsMetricNorm g := fun z v => tensor0SBundle_enorm_eq_riemannianBundle_enorm g z v
  have hRic : RicciBoundedBelow g (-(((Module.finrank ℝ E - 1 : ℕ) : ℝ) * q ^ 2)) := by
    intro z v
    have hq2 : q ^ 2 = 16 * K / 3 := Real.sq_sqrt (by positivity)
    have he : -(((Module.finrank ℝ E - 1 : ℕ) : ℝ) * q ^ 2) =
        -((Module.finrank ℝ E : ℝ) ^ 2 * K) := by
      rw [hd, hq2]
      norm_num
      ring
    rw [he]
    exact ricciLowerAt_of_rm g (hRm z) v
  have hVolume' : ENNReal.ofReal (κ * s ^ 4) ≤
      riemannianVolumeMeasure I M g {z : M | riemannianEDist I x z < ENNReal.ofReal s} := by
    let μ := riemannianVolumeMeasure I M g
    let : IsFiniteMeasureOnCompacts μ := riemannianVolumeMeasure_isFiniteMeasureOnCompacts g
    change ENNReal.ofReal (κ * s ^ 4) ≤ μ (riemannianBallOf g x s)
    rw [← ENNReal.ofReal_toReal (measure_ne_top μ (riemannianBallOf g x s))]
    exact ENNReal.ofReal_le_ofReal (hVolume x s hs hs1)
  have hcgt := intrInj_ge_vol_of_ball g hEnorm x (ρ := 1) (R := ρ) (r₀ := s) (s := s)
    hK hρ hρ1 hρpi (fun z _ => hRm z)
    (fun t ht htρ => herror t ht (htρ.trans (min_le_left _ _)))
    hs hs (by dsimp [s]; linarith) (by dsimp [s]; linarith) hq hRic hVolume'
  change ENNReal.ofReal i₀ ≤ intrinsicInjRadius g hEnorm x
  calc
    ENNReal.ofReal i₀ =
        ENNReal.ofReal (s / 2) * ENNReal.ofReal (κ * s ^ 4) / ENNReal.ofReal C := by
      change ENNReal.ofReal ((s / 2) * (κ * s ^ 4) / C) = _
      rw [ENNReal.ofReal_div_of_pos hC, ENNReal.ofReal_mul (by positivity)]
    _ ≤ ENNReal.ofReal (s / 2) * ENNReal.ofReal (κ * s ^ 4) / D :=
      ENNReal.div_le_div le_rfl hDC
    _ ≤ intrinsicInjRadius g hEnorm x := hcgt

/-- A smooth coordinate diffeomorphism from a Euclidean ball onto the
supplying metric's open distance ball, with controlled pullback quadratic form. -/
structure BourPhysicalNormalBall (g : SmoothRiemannianMetric I M) (x : M) (r : ℝ) where
  chart : PartialDiffeomorph 𝓘(ℝ, E) I E M ∞
  source_eq : chart.source = Metric.ball (0 : E) r
  target_eq : chart.target = riemannianBallOf g x r
  center_eq : chart 0 = x
  metric_bounds : ∀ z ∈ Metric.ball (0 : E) r, ∀ v : E,
    let W := mfderiv 𝓘(ℝ, E) I chart z v
    (1 / 2 : ℝ) * ‖v‖ ^ 2 ≤ g.inner (chart z) W W ∧
      g.inner (chart z) W W ≤ 2 * ‖v‖ ^ 2

attribute [-instance] Tensor0SBundle.tangentSpaceNormedAddCommGroup
  Tensor0SBundle.tangentSpaceNormedSpace in
/-- Curvature and noncollapse give actual normal-coordinate charts with
one common radius, including the true physical ball as their target. -/
theorem bourUniformNormalBalls_of_ballVolume [NeZero (Module.finrank ℝ E)]
    (hd : Module.finrank ℝ E = 4) {κ K : ℝ} (hκ : 0 < κ) (hK : 0 < K) :
    ∃ r : ℝ, 0 < r ∧ ∀ g : SmoothRiemannianMetric I M,
      (∀ x : M, Real.sqrt (intrinsicCurvatureSq g x) ≤ K) →
      (∀ (x : M) (s : ℝ), 0 < s → s ≤ 1 → κ * s ^ 4 ≤ bourBallVolume g x s) →
      ∀ x : M, Nonempty (BourPhysicalNormalBall g x r) := by
  obtain ⟨i₀, hi₀, hInj⟩ := bourUniformInjectivity_of_ballVolume (M := M) (I := I) hd hκ hK
  let r := min (i₀ / 2) (intrinsicNormalMetricRadius (Module.finrank ℝ E) K)
  have hr : 0 < r := lt_min (half_pos hi₀) (intrinsicNormalMetricRadius_pos _ _ hK.le)
  refine ⟨r, hr, ?_⟩
  intro g hRm hVol x
  let : TopologicalSpace.MetrizableSpace M := Manifold.metrizableSpace I M
  let : T3Space M := inferInstance
  let : RiemannianBundle (TangentSpace I : M → Type _) := ⟨g.toRiemannianMetric⟩
  let : IsContinuousRiemannianBundle E (TangentSpace I : M → Type _) :=
    ⟨g.inner, g.contMDiff.continuous, fun _ _ _ => rfl⟩
  let : PseudoEMetricSpace M := PseudoEMetricSpace.ofRiemannianMetric I M
  let : CompleteSpace M := inferInstance
  let hEnorm : IsMetricNorm g := fun z v => tensor0SBundle_enorm_eq_riemannianBundle_enorm g z v
  have hInjectivity : ∀ z : M, ENNReal.ofReal i₀ ≤ intrinsicInjRadius g hEnorm z := hInj g hRm hVol
  obtain ⟨A⟩ := intrinsicBallChart_of_rm04_inj K hK.le i₀ hi₀ g hEnorm hRm hInjectivity x hr le_rfl
  refine ⟨⟨A.hom, A.source_eq, ?_, ?_, ?_⟩⟩
  · rw [A.target_eq, intrinsicFramedExp_image_ball g hEnorm x]
    ext z
    change edist z x < ENNReal.ofReal r ↔ riemannianEDistOf g x z < ENNReal.ofReal r
    rw [edist_comm]
    rfl
  · rw [A.hom_eq (Metric.mem_ball_self hr)]
    exact intrinsicFrame_zero g hEnorm x
  · intro z hz v
    have hbound := A.metricEquivOn_of_intrinsicFrameMetric g hEnorm x hr
      (fun w hw u =>
        intrFrameMetric_bound_of_rm04 K hK.le g hEnorm hRm x
          (Metric.ball_subset_ball (min_le_right _ _) hw) u)
    have hb := hbound z hz v
    simp only [NormalBallChart.metric_apply] at hb
    exact hb

/-- A common Yamabe floor and scalar ceiling give the same normal radius
on all physical gauges whose ordered curvature norms have a common bound. -/
theorem bourUniformNormalBalls_of_yamabe [Nonempty M] [NeZero (Module.finrank ℝ E)]
    (hd : Module.finrank ℝ E = 4) {y C K : ℝ} (hy : 0 < y) (hC : 0 ≤ C) (hK : 0 < K) :
    ∃ r : ℝ, 0 < r ∧ ∀ (g : SmoothRiemannianMetric I M) (R a : ℝ) (ha : 0 < a),
      y ≤ classYamabeFour hd g → (∀ x : M, metricScalarAt g x = R) →
      0 ≤ R → R ≤ C → 1 ≤ a →
      (∀ x : M, intrinsicCurvatureSq g x / 4 ≤ (a * (K / 2)) ^ 2) →
      ∀ x : M, Nonempty (BourPhysicalNormalBall (scaleMetric a ha g) x r) := by
  let κ := (y / (4 * (6 * bourCutoffSlope ^ 2 + C))) ^ 2
  have hA : 0 < bourCutoffSlope := by
    unfold bourCutoffSlope
    linarith [Analysis.CutoffProfile.derivBound_nonneg]
  have hκ : 0 < κ :=
    sq_pos_of_pos (div_pos hy (by positivity))
  obtain ⟨r, hr, hCharts⟩ := bourUniformNormalBalls_of_ballVolume (I := I) (M := M) hd hκ hK
  refine ⟨r, hr, ?_⟩
  intro g R a ha hY hR hR0 hRC ha1 hQuarter x
  apply hCharts (scaleMetric a ha g) ?_ ?_ x
  · intro z
    rw [bourFullCurvatureNorm_scale g ha z]
    apply (div_le_iff₀ ha).2
    have hnorm := bourFullCurvatureNorm_le_of_quarterSq g z (by positivity) (hQuarter z)
    linarith only [hnorm]
  · intro z s hs hs1
    exact bourBallVolume_lower_of_yamabe_scale hd g hy hY hR hR0 hRC ha ha1 z hs hs1

/-- The CSC zeroth-order coefficient has one bound in all physical gauges.
The same calculation includes the exact parameter zero. -/
theorem bourStationary_scalarCoefficient_bound {p R C a : ℝ}
    (hp0 : 0 ≤ p) (hp1 : p < 1) (hR0 : 0 ≤ R) (hRC : R ≤ C) (ha : 1 ≤ a) :
    0 ≤ (2 - p) / 12 * (R / a) ∧ (2 - p) / 12 * (R / a) ≤ C / 6 := by
  have ha0 : 0 < a := zero_lt_one.trans_le ha
  have hcoef : 0 ≤ (2 - p) / 12 := by linarith
  have hR' : 0 ≤ R / a := div_nonneg hR0 ha0.le
  refine ⟨mul_nonneg hcoef hR', ?_⟩
  have hcoef' : (2 - p) / 12 ≤ 1 / 6 := by linarith
  calc
    _ ≤ (1 / 6) * C := mul_le_mul hcoef' ((div_le_self hR0 ha).trans hRC) hR' (by norm_num)
    _ = C / 6 := by ring

omit [I.Boundaryless] [ConnectedSpace M] in
/-- The squared physical size of the supplied CSC residual
\((p/12)(R/a)\operatorname{Ric}_0\) vanishes in either gauge. -/
theorem bourStationary_residualSq_tendsto_zero
    (hd : Module.finrank ℝ E = 4) (g : ℕ → SmoothRiemannianMetric I M)
    (p R a : ℕ → ℝ) {C d : ℝ}
    (hp : Tendsto p atTop (𝓝 0)) (hp0 : ∀ j, 0 ≤ p j)
    (hR0 : ∀ j, 0 ≤ R j) (hRC : ∀ j, R j ≤ C) (ha : ∀ j, 1 ≤ a j)
    (hD : ∀ᶠ j in atTop,
      (∫ x, intrinsicTraceFreeRicciSq (g j) x ∂riemannianVolumeMeasure I M (g j)) ≤ d) :
    Tendsto (fun j =>
      let h := scaleMetric (a j) (zero_lt_one.trans_le (ha j)) (g j)
      ∫ x, ((p j / 12) * (R j / a j)) ^ 2 * intrinsicTraceFreeRicciSq h x
        ∂riemannianVolumeMeasure I M h) atTop (𝓝 0) := by
  have hEq (j : ℕ) :
      let h := scaleMetric (a j) (zero_lt_one.trans_le (ha j)) (g j)
      (∫ x, ((p j / 12) * (R j / a j)) ^ 2 * intrinsicTraceFreeRicciSq h x
        ∂riemannianVolumeMeasure I M h) =
        ((p j / 12) * (R j / a j)) ^ 2 *
          ∫ x, intrinsicTraceFreeRicciSq (g j) x ∂riemannianVolumeMeasure I M (g j) := by
    dsimp only
    rw [integral_const_mul, bourTraceFreeRicciIntegral_scale hd]
  simp_rw [hEq]
  have hUpper (j : ℕ) :
      ((p j / 12) * (R j / a j)) ^ 2 ≤ ((p j / 12) * C) ^ 2 := by
    have hR' : R j / a j ≤ C := (div_le_self (hR0 j) (ha j)).trans (hRC j)
    have hP : 0 ≤ p j / 12 := div_nonneg (hp0 j) (by norm_num)
    have hz : 0 ≤ (p j / 12) * (R j / a j) :=
      mul_nonneg hP (div_nonneg (hR0 j) (zero_lt_one.trans_le (ha j)).le)
    exact pow_le_pow_left₀ hz (mul_le_mul_of_nonneg_left hR' hP) 2
  apply squeeze_zero' (Eventually.of_forall fun j =>
    mul_nonneg (sq_nonneg _) (integral_nonneg (intrinsicTraceFreeRicciSq_nonneg_of_finrank hd _)))
      (g := fun j => ((p j / 12) * C) ^ 2 * d)
  · filter_upwards [hD] with j hj
    exact mul_le_mul (hUpper j) hj
      (integral_nonneg (intrinsicTraceFreeRicciSq_nonneg_of_finrank hd _)) (sq_nonneg _)
  · simpa only [zero_div, zero_mul, zero_pow (by decide : (2 : ℕ) ≠ 0)] using
      (((hp.div_const 12).mul_const C).pow 2).mul_const d

end SmoothPoincare
