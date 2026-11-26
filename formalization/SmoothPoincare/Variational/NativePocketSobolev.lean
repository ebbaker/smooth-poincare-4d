import SmoothPoincare.Variational.NativePocketFlattening
import SmoothPoincare.Variational.ScalarCoercivity
import SmoothPoincare.Variational.NativePocketScalarPrice
import DifferentialGeometry.Geometry.Metric.Convergence.Metric.UniformEquivalence

/-! # One Sobolev comparison for every radius and time of a fixed pocket -/

noncomputable section
open DifferentialGeometry DifferentialGeometry.Integral.Measure DifferentialGeometry.CheegerGromovCompactness
open DifferentialGeometry.Geometry.Curvature DifferentialGeometry.Geometry.Operator FirstOrderTwistor SectionsAndConnections MeasureTheory Set Manifold
open scoped ContDiff Manifold Topology

namespace SmoothPoincare
local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "I₄" => 𝓘(ℝ,E₄)
variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M] [CompactSpace M]
variable {o : ManifoldOrientation I M 4}
private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

omit [I.Boundaryless] [CompactSpace M] [T2Space M] in
/-- Order reversal of the metric on differentials, proved directly with
the two actual gradients. -/
theorem normGradSq_le_of_inner_comparison (g h : SmoothRiemannianMetric I M) (x : M)
    {C : ℝ} (hC : 0 < C) (hBound : ∀ v : TangentSpace I x, h.inner x v v ≤ C * g.inner x v v)
    (f : M → ℝ) : normGradSqFun g f x ≤ C * normGradSqFun h f x := by
  let v := gradFun g f x
  let w := gradFun h f x
  have hvw : h.inner x v w = g.inner x v v :=
    (inner_gradFun_right h f x v).trans (inner_gradFun g f x v).symm
  have hwv : h.inner x w v = g.inner x v v := (h.symm x w v).trans hvw
  have hn := metric_inner_self_nonneg h x (v - C • w)
  simp only [map_sub, map_smul, sub_apply, smul_apply,
    smul_eq_mul, hvw, hwv] at hn
  change g.inner x v v ≤ C * h.inner x w w
  apply le_of_mul_le_mul_left (a := C) _ hC
  nlinarith only [hn, hBound v]

omit [I.Boundaryless] in
private theorem integral_le_density_ceiling (g h : SmoothRiemannianMetric I M)
    {L : ℝ} (hL : ∀ x, riemannianVolumeDensity g h x ≤ L)
    (f : M → ℝ) (hf : Continuous f) (hpos : ∀ x, 0 ≤ f x) :
    (∫ x, f x ∂riemannianVolumeMeasure I M h) ≤ L * ∫ x, f x ∂riemannianVolumeMeasure I M g := by
  let μ := riemannianVolumeMeasure I M g
  let : IsFiniteMeasureOnCompacts μ := riemannianVolumeMeasure_isFiniteMeasureOnCompacts g
  rw [integral_riemannianVolumeMeasure_eq_integral_volumeDensity_smul g h, ← integral_const_mul]
  simp only [smul_eq_mul]
  apply integral_mono (μ := μ)
  · exact ((riemannianVolumeDensity_contMDiff g h).continuous.mul hf).integrable_of_hasCompactSupport
      (HasCompactSupport.of_compactSpace _)
  · exact (continuous_const.mul hf).integrable_of_hasCompactSupport (HasCompactSupport.of_compactSpace _)
  · exact fun x => mul_le_mul_of_nonneg_right (hL x) (hpos x)

/-- In dimension four the complete physical Sobolev form transfers with
the single factor C⁴ when C bounds both metric comparisons. -/
theorem scalarSobolev_transfer (g h : SmoothRiemannianMetric I M) {C D : ℝ}
    (he : MetricUniformEquivalentOn univ g h C) (hD : 0 ≤ D)
    (hs : ∀ f : C^∞⟮I,M;ℝ⟯, Real.sqrt (capFactorVolume g f) ≤ D *
      ((∫ x, f x ^ 2 ∂riemannianVolumeMeasure I M g) +
       ∫ x, normGradSqFun g f x ∂riemannianVolumeMeasure I M g))
    (f : C^∞⟮I,M;ℝ⟯) : Real.sqrt (capFactorVolume h f) ≤ (C ^ 4 * D) *
      ((∫ x, f x ^ 2 ∂riemannianVolumeMeasure I M h) +
       ∫ x, normGradSqFun h f x ∂riemannianVolumeMeasure I M h) := by
  let μ := riemannianVolumeMeasure I M h
  let : IsFiniteMeasureOnCompacts μ := riemannianVolumeMeasure_isFiniteMeasureOnCompacts h
  have hC1 := he.1
  have hC : 0 < C := zero_lt_one.trans_le hC1
  have hgh (x : M) (v : TangentSpace I x) := (he.2 x (mem_univ _) v).2
  have hhg (x : M) (v : TangentSpace I x) : g.inner x v v ≤ C * h.inner x v v := by
    have t := mul_le_mul_of_nonneg_left (he.2 x (mem_univ _) v).1 hC.le
    rwa [← mul_assoc, mul_inv_cancel₀ hC.ne', one_mul] at t
  have vol (a b : SmoothRiemannianMetric I M) (hc : ∀ x v, b.inner x v v ≤ C * a.inner x v v)
      (x : M) : riemannianVolumeDensity a b x ≤ C ^ 2 := by
    have hh := riemannianVolumeDensity_le_of_inner_le a b hC x (hc x)
    simpa [show C ^ 4 = (C ^ 2) ^ 2 by ring, Real.sqrt_sq (sq_nonneg C)] using hh
  have h4 := integral_le_density_ceiling g h (vol g h hgh) (fun x => f x ^ 4)
    (f.contMDiff.continuous.pow 4) (fun _ => by positivity)
  have hs4 := Real.sqrt_le_sqrt h4
  rw [Real.sqrt_mul (sq_nonneg _), Real.sqrt_sq hC.le] at hs4
  have h2 := integral_le_density_ceiling h g (vol h g hhg) (fun x => f x ^ 2)
    (f.contMDiff.continuous.pow 2) (fun _ => by positivity)
  have hgcont := normGradSqFun_continuous g f.contMDiff
  have hhcont := normGradSqFun_continuous h f.contMDiff
  have hgrad := integral_le_density_ceiling h g (vol h g hhg) _ hgcont (normGradSqFun_nonneg g f)
  have hg : (∫ x, normGradSqFun g f x ∂μ) ≤ C * ∫ x, normGradSqFun h f x ∂μ := by
    rw [← integral_const_mul]
    exact integral_mono (hgcont.integrable_of_hasCompactSupport (HasCompactSupport.of_compactSpace _))
      ((continuous_const.mul hhcont).integrable_of_hasCompactSupport (HasCompactSupport.of_compactSpace _))
      (fun x => normGradSq_le_of_inner_comparison g h x hC (hgh x) f)
  have hpow : C ^ 2 ≤ C ^ 3 := by nlinarith only [mul_le_mul_of_nonneg_right hC1 (sq_nonneg C)]
  have h2' := h2.trans (mul_le_mul_of_nonneg_right hpow (integral_nonneg (fun x => sq_nonneg (f x))))
  have hg' := hgrad.trans (mul_le_mul_of_nonneg_left hg (sq_nonneg C))
  change Real.sqrt (capFactorVolume h f) ≤ C * Real.sqrt (capFactorVolume g f) at hs4
  calc
    _ ≤ C * (D * _) := hs4.trans (mul_le_mul_of_nonneg_left (hs f) hC.le)
    _ ≤ C * (D * (C ^ 3 * (∫ x, f x ^ 2 ∂μ) + C ^ 2 * (C * ∫ x, normGradSqFun h f x ∂μ))) :=
      mul_le_mul_of_nonneg_left (mul_le_mul_of_nonneg_left (add_le_add h2' hg') hD) hC.le
    _ = _ := by dsimp only [μ]; ring

omit [I.Boundaryless] in
/-- A single constant compares every native pocket with the source on the
entire closed manifold, independently of the cutoff derivatives. -/
theorem exists_nativePocket_uniformEquivalence (g R : SmoothRiemannianMetric I M) :
    ∃ C : ℝ, 1 ≤ C ∧ ∀ (F : PartialDiffeomorph I₄ I E₄ M ∞) {r : ℝ} (hr : 0 < r)
      (hS : Metric.closedBall (0:E₄) (3*r) ⊆ F.source) (s : Icc (0:ℝ) 1),
      MetricUniformEquivalentOn univ g (nativePocketPath F g R hr hS s) C := by
  obtain ⟨C, hC, hR⟩ := metricUniformEquivalentOn_of_compact g R
  refine ⟨C, hC, fun F r hr hS s => ⟨hC, ?_⟩⟩
  intro x hx v
  obtain ⟨a, ha, h⟩ := nativePocketPath_convex_at F g R hr hS s x
  obtain ⟨hl, hu⟩ := hR x hx v
  have hg := metric_inner_self_nonneg g x v
  have hinv := inv_le_one_of_one_le₀ hC
  have hl' : C⁻¹ * g.inner x v v ≤ g.inner x v v := mul_le_of_le_one_left hg hinv
  have hu' : g.inner x v v ≤ C * g.inner x v v := le_mul_of_one_le_left hg hC
  rw [h v v]
  constructor
  · linarith only [mul_le_mul_of_nonneg_left hl ha.1, mul_le_mul_of_nonneg_left hl' (sub_nonneg.mpr ha.2)]
  · linarith only [mul_le_mul_of_nonneg_left hu ha.1, mul_le_mul_of_nonneg_left hu' (sub_nonneg.mpr ha.2)]

/-- A single positive constant serves the actual four-dimensional test
quotient for the full fixed-reference family, including shrinking radii. -/
theorem exists_nativePocket_uniformSobolev (g R : SmoothRiemannianMetric I M) :
    ∃ S : ℝ, 0 < S ∧ ∀ (F : PartialDiffeomorph I₄ I E₄ M ∞) {r : ℝ} (hr : 0 < r)
      (hS : Metric.closedBall (0:E₄) (3*r) ⊆ F.source) (s : Icc (0:ℝ) 1)
      (f : C^∞⟮I,M;ℝ⟯), let h := nativePocketPath F g R hr hS s
      Real.sqrt (capFactorVolume h f) ≤ S * ((∫ x, f x ^ 2 ∂riemannianVolumeMeasure I M h) +
        ∫ x, normGradSqFun h f x ∂riemannianVolumeMeasure I M h) := by
  obtain ⟨C,hC,hcmp⟩ := exists_nativePocket_uniformEquivalence g R
  obtain ⟨D,hD,hSob⟩ := exists_scalarSobolev_bound (by simp) g
  have hCp : 0 < C := zero_lt_one.trans_le hC
  exact ⟨C ^ 4 * D, by positivity, fun F _ hr hS s f =>
    scalarSobolev_transfer g _ (hcmp F hr hS s) hD.le hSob f⟩

/-- A source with a positive scalar floor outside the pocket gives genuinely
positive small flattening slices. The same constant works for all times.
Even a native curvature norm growing as 1/r suffices: the scalar shortfall
is O(r) and the increase in each closed signed energy is O(r²).
No scalar-flat wall or minimizing conformal representative is used. -/
theorem exists_nativePocket_positive_slice_bounds [Nonempty M] (g : SignedCollarMetric o)
    (R : SmoothRiemannianMetric I M) {ρ : ℝ} (hρ : 0 < ρ) :
    ∃ S : ℝ, 0 < S ∧ ∀ (F : PartialDiffeomorph I₄ I E₄ M ∞) {r : ℝ} (hr : 0 < r) (_hr1 : r ≤ 1)
      (hS : Metric.closedBall (0:E₄) (3*r) ⊆ F.source) (s : Icc (0:ℝ) 1) (h : SignedCollarMetric o),
      let A := F '' Metric.closedBall (0:E₄) (3*r)
      h.metric = nativePocketPath F g.metric R hr hS s →
      (∀ x ∉ A, (g.frame x).basis = (h.frame x).basis) →
      (∀ x ∉ A, ρ ≤ metricScalarAt g.metric x) →
      ∀ {K V : ℝ}, 0 ≤ K → 0 ≤ V →
      (∀ x ∈ A, frameTensorNormSq (metricCurvatureFrameTensor h.metric o x (h.frame x)) ≤ (K/r)^2) →
      (riemannianVolumeMeasure I M h.metric).real A ≤ V * r ^ 4 →
      let err := (ρ + Real.sqrt 6 * K) * Real.sqrt V * r
      min ρ 6 / S - err ≤ classYamabeFour o.dimension_eq h.metric ∧
      (∀ sg, h.energy sg ≤ g.energy sg - g.charge sg A + K^2 * V * r^2 / 4) ∧
      (err < min ρ 6 / S → 0 < classYamabeFour o.dimension_eq h.metric) := by
  obtain ⟨S,hSpos,hSob⟩ := exists_nativePocket_uniformSobolev g.metric R
  refine ⟨S,hSpos,?_⟩
  intro F r hr hr1 hS s h A hPath hFrame hSrc K V hK hV hCurv hVol err
  have hSC := hSob F hr hS s
  rw [← hPath] at hSC
  have hy := classYamabeFour_lower_of_scalarFloorDeficit o.dimension_eq h.metric hρ.le hSpos hSC
  have hA : MeasurableSet A := ((isCompact_closedBall _ _).image_of_continuousOn
    (F.contMDiffOn_toFun.continuousOn.mono hS)).measurableSet
  have hOut (x : M) (hx : x ∉ A) : ρ ≤ metricScalarAt h.metric x := by
    apply (hSrc x hx).trans_eq
    apply signedMetric_scalar_eq_of_germ g h x _ (hFrame x hx)
    rw [hPath]
    exact (nativePocketPath_outer_germ F g.metric R hr hS s (fun hz =>
      hx (image_mono Metric.ball_subset_closedBall hz))).mono fun y he v w => (he v w).symm
  let B := ρ + Real.sqrt 6 * K
  have hB : 0 ≤ B := add_nonneg hρ.le (mul_nonneg (Real.sqrt_nonneg _) hK)
  have hB' : 0 ≤ B/r := div_nonneg hB hr.le
  have hInside (x : M) (hx : x ∈ A) : ρ - metricScalarAt h.metric x ≤ B/r := by
    have hd := metricFrameTensorNormSq_eq_chiral_ricci_scalar h.metric o x (h.frame x)
    have hp := modifiedChargeDensity_nonneg o h.metric h.frame .plus x
    have hn := modifiedChargeDensity_nonneg o h.metric h.frame .minus x
    have he := modifiedChargeDensity_nonneg o h.metric h.frame .ricci x
    dsimp only [modifiedChargeDensity] at hp hn he
    have hs : metricScalarAt h.metric x ^ 2 ≤ 6 * (K/r)^2 := by linarith only [hd, hp, hn, he, hCurv x hx]
    have hab : |metricScalarAt h.metric x| ≤ Real.sqrt 6 * (K/r) := by
      apply le_of_pow_le_pow_left₀ (n := 2) (by decide) (by positivity)
      rw [sq_abs, mul_pow, Real.sq_sqrt (by norm_num : (0:ℝ) ≤ 6)]
      exact hs
    have h₁ : ρ * r ≤ ρ := mul_le_of_le_one_right hρ.le hr1
    have h₂ := (neg_le_abs (metricScalarAt h.metric x)).trans hab
    apply (le_div_iff₀ hr).2
    have hl := mul_le_mul_of_nonneg_right h₂ hr.le
    rw [mul_assoc, div_mul_cancel₀ _ hr.ne'] at hl
    dsimp [B]
    linarith
  have hd := (scalarFloorDeficitNorm_sq_le_of_floor_off h.metric hA hB' hOut hInside).trans
    (mul_le_mul_of_nonneg_left hVol (sq_nonneg _))
  have hp : scalarFloorDeficitNorm h.metric ρ ≤ err := by
    apply le_of_pow_le_pow_left₀ (n := 2) (by decide) (by dsimp [err]; positivity)
    refine hd.trans_eq ?_
    change (B/r)^2 * (V*r^4) = (B * Real.sqrt V * r)^2
    rw [mul_pow, mul_pow, Real.sq_sqrt hV]
    field_simp
  have hY : min ρ 6 / S - err ≤ classYamabeFour o.dimension_eq h.metric := by linarith only [hp, hy]
  have hPrice := signedCharges_add_scalarDeficit_on h hA hCurv
  have bound (sg : CollarChirality) : h.charge sg A ≤ (K/r)^2 / 4 * (riemannianVolumeMeasure I M h.metric).real A := by
    have hi : 0 ≤ ∫ x in A, (max (-metricScalarAt h.metric x) 0) ^ 2 ∂riemannianVolumeMeasure I M h.metric :=
      integral_nonneg fun _ => sq_nonneg _
    have h₁ : 0 ≤ h.charge .plus A := measureReal_nonneg
    have h₂ : 0 ≤ h.charge .minus A := measureReal_nonneg
    cases sg <;> linarith only [hPrice, hi, h₁, h₂]
  refine ⟨hY, fun sg => ?_, fun ht => (sub_pos.mpr ht).trans_le hY⟩
  have hp := (bound sg).trans (mul_le_mul_of_nonneg_left hVol (by positivity))
  have hs : (K/r)^2 / 4 * (V * r ^ 4) = K^2 * V * r^2 / 4 := by field_simp
  rw [hs] at hp
  have he := nativePocketPath_signed_change F g h R hr hS s hPath hFrame sg
  change h.energy sg - g.energy sg = h.charge sg A - g.charge sg A at he
  linarith

end SmoothPoincare
