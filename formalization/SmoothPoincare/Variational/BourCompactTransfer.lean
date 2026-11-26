import SmoothPoincare.Variational.BourMarkedCore
import SmoothPoincare.Variational.BourTrajectoryBudget
import DifferentialGeometry.Geometry.Curvature.Bounds.ScalarNorm
import DifferentialGeometry.Geometry.Compactness.CheegerGromov.Pointed.Convergence.CompactGlobalization

/-! # Physical scalar and signed energy on the compact Bour return -/

open DifferentialGeometry DifferentialGeometry.Geometry.Curvature
  DifferentialGeometry.CheegerGromovCompactness DifferentialGeometry.Integral.Measure
  DifferentialGeometry.PDE.RicciFlow.Perelman.KappaSolutions DifferentialGeometry.Tensor0SBundle
  Filter MeasureTheory Set TopologicalSpace
open scoped Manifold ContDiff Topology ENNReal

noncomputable section

namespace SmoothPoincare.Bour

universe u uE uH
variable {E : Type uE} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
  [FiniteDimensional ℝ E] [NeZero (Module.finrank ℝ E)]
  {H : Type uH} [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  {X : PointedRiemannianSeq.{u,uE,uH} I} {P : PointedRiemannianManifold.{u,uE,uH} I}
  {φ : ℕ → ℕ}

attribute [local instance] PointedRiemannianManifold.topology PointedRiemannianManifold.charted
  PointedRiemannianManifold.smooth PointedRiemannianManifold.t2
  PointedRiemannianManifold.sigmaCompact PointedRiemannianManifold.t2TangentBundle

private local instance : CompleteSpace E := FiniteDimensional.complete ℝ E
private local instance (Q : PointedRiemannianManifold.{u,uE,uH} I) :
    MeasurableSpace Q.M := borel Q.M
private local instance (Q : PointedRiemannianManifold.{u,uE,uH} I) :
    BorelSpace Q.M := ⟨rfl⟩

/-- Pointwise scalar convergence and one compact scalar bound from the relative
metric two-jets on the genuine comparison. -/
private theorem pointedScalar_control_of_canonical_domains
    (F : PointedRiemannianConvergenceMaps X P φ) (C : MetricConvergenceData F)
    (hc : ∀ i, C.domain i = CanonicalMetricCompactness.canonicalSourceData F i)
    {K : Set P.M} (hK : IsCompact K) :
    (∀ x ∈ K, Tendsto (fun i => metricScalarAt (X.obj (φ i)).metric (F.map i x)) atTop
      (𝓝 (metricScalarAt P.metric x))) ∧
    ∃ B : ℝ, ∀ᶠ i in atTop, ∀ x ∈ K, |metricScalarAt (X.obj (φ i)).metric (F.map i x)| ≤ B := by
  let : LocallyCompactSpace P.M := Manifold.locallyCompact_of_finiteDimensional I
  let : IsManifold I 1 P.M := IsManifold.of_le (n := ∞) (by decide)
  obtain ⟨K', hK', hKK'⟩ := exists_compact_superset hK
  obtain ⟨N, hN⟩ := F.source_subset hK'
  have hSrc (i : ℕ) : K' ⊆ (F.partialDiffeomorph (i + N)).source := hN _ (by omega)
  choose g hg using fun i => exists_smooth_riemannian_metric_eq_pullback_on_compact
    (F.partialDiffeomorph (i + N)) hK' (hSrc i) (X.obj (φ (i + N))).metric P.metric
  let U : Opens P.M := ⟨interior K', isOpen_interior⟩
  have hU (i : ℕ) : (U : Set P.M) ⊆ (F.partialDiffeomorph (i + N)).source :=
    interior_subset.trans (hSrc i)
  have hPull i y (hy : y ∈ U) v w := hg i y (interior_subset hy) v w
  have hScalar (i) (x : P.M) (hx : x ∈ K) : metricScalarAt (g i) x =
      metricScalarAt (X.obj (φ (i + N))).metric (F.map (i + N) x) :=
    metricScalarAt_eq_of_partialDiffeomorph_inner (g i) _ (F.partialDiffeomorph (i + N))
      U (hU i) (hPull i) (hKK' hx)
  have hJet : ∀ ε > (0 : ℝ), ∀ᶠ i in atTop, ∀ x ∈ K, ∀ j ≤ 2,
      metricDerivNorm j (g i) P.metric P.metric x < ε := by
    intro ε hε
    obtain ⟨k, hk⟩ := C.converges K hK 2 ε hε
    filter_upwards [eventually_ge_atTop k] with i hi
    have h := (hk (i + N) (by omega)).2
    rw [hc, canonicalSourceData_derivNormSupOn_eq_of_pullback
      F (i + N) (g i) K U 2 U.isOpen hKK' (hU i) (hPull i)] at h
    exact fun x hx j hj => (derivNorm_le_sup hK hj (g i) P.metric P.metric hx).trans_lt h
  let n : ℝ := Module.finrank ℝ E
  let δ := 1 / (2 * (n + 1))
  have hn : 0 ≤ n := Nat.cast_nonneg _
  have hδ : 0 < δ := by dsimp [δ]; positivity
  have hδ₁ : δ ≤ 1 := (div_le_iff₀ (by positivity : 0 < 2 * (n + 1))).mpr (by linarith)
  have hδ₂ : n * δ ≤ 1 / 2 := by
    dsimp [δ]
    rw [← mul_div_assoc, mul_one, div_le_iff₀ (by positivity : 0 < 2 * (n + 1))]
    linarith
  obtain ⟨B₀, h₀⟩ := metricCovDerivNorm_le_of_isCompact 0 P.metric P.metric hK
  obtain ⟨B₁, h₁⟩ := metricCovDerivNorm_le_of_isCompact 1 P.metric P.metric hK
  obtain ⟨B₂, h₂⟩ := metricCovDerivNorm_le_of_isCompact 2 P.metric P.metric hK
  let B := max 0 (max B₀ (max B₁ B₂)) + 1
  have hB : 0 ≤ B := by dsimp [B]; linarith only [le_max_left (0 : ℝ) (max B₀ (max B₁ B₂))]
  have hBase (x) (hx : x ∈ K) (j : ℕ) (hj : j ≤ 2) : metricCovDerivNorm j P.metric P.metric x ≤ B - 1 := by
    have hb : max B₀ (max B₁ B₂) ≤ B - 1 := by dsimp [B]; linarith [le_max_right 0 (max B₀ (max B₁ B₂))]
    interval_cases j
    · exact (h₀ x hx).trans ((le_max_left ..).trans hb)
    · exact (h₁ x hx).trans ((le_max_left ..).trans ((le_max_right ..).trans hb))
    · exact (h₂ x hx).trans ((le_max_right ..).trans ((le_max_right ..).trans hb))
  have hGood : ∀ᶠ i in atTop, ∀ x ∈ K,
      (∀ v : TangentSpace I x, (2 : ℝ)⁻¹ * P.metric.inner x v v ≤ (g i).inner x v v ∧
        (g i).inner x v v ≤ 2 * P.metric.inner x v v) ∧
      (∀ j ≤ 2, metricCovDerivNorm j (g i) P.metric x ≤ B) := by
    filter_upwards [hJet δ hδ] with i hi
    intro x hx
    refine ⟨fun v => ?_, fun j hj => ?_⟩
    · have h := metricQuadFormDiff_le_metricDerivNorm (g i) P.metric P.metric x v
      change |(g i).inner x v v - P.metric.inner x v v| ≤
        n * metricDerivNorm 0 (g i) P.metric P.metric x * P.metric.inner x v v at h
      have hBound := abs_le.mp (h.trans (mul_le_mul_of_nonneg_right
        ((mul_le_mul_of_nonneg_left (hi x hx 0 (by decide)).le hn).trans hδ₂)
        (metric_inner_self_nonneg P.metric x v)))
      constructor <;> linarith only [hBound.1, hBound.2]
    · linarith only [covNorm_le_add j (g i) P.metric P.metric x, hBase x hx j hj,
        (hi x hx j hj).le.trans hδ₁]
  constructor
  · intro x hx
    rw [← tendsto_add_atTop_iff_nat N]
    change Tendsto (fun i => metricScalarAt (X.obj (φ (i + N))).metric (F.map (i + N) x))
      atTop (𝓝 (metricScalarAt P.metric x))
    simp_rw [← hScalar _ x hx]
    obtain ⟨A, hA, hLip⟩ := scalarSub_le_dNorm P.metric x _ B (by norm_num : 0 < (2 : ℝ)⁻¹) hB
    apply Metric.tendsto_nhds.mpr
    intro ε hε
    have htol : 0 < ε / (3 * A) := div_pos hε (by positivity)
    filter_upwards [hGood, hJet _ htol] with i hi hj
    have h := hLip (g i) P.metric (fun v => ((hi x hx).1 v).1)
      (fun v => by linarith only [metric_inner_self_nonneg P.metric x v]) (hi x hx).2
      (fun j hj => (hBase x hx j hj).trans (by linarith))
    rw [Finset.sum_range_succ, Finset.sum_range_succ, Finset.sum_range_one] at h
    rw [Real.dist_eq]
    exact h.trans_lt ((mul_lt_mul_of_pos_left
      (by linarith only [hj x hx 0 (by decide), hj x hx 1 (by decide), hj x hx 2 (by decide)] :
        _ < 3 * (ε / (3 * A))) hA).trans_eq (by field_simp))
  · obtain ⟨A, hA, hCurv⟩ := exists_pos_bound_intrinsic_curvature_derivative_on_compact_of_metric_jets
      P.metric hK 0 2 B (by norm_num) hB
    refine ⟨n ^ 2 * A, ?_⟩
    obtain ⟨k, hk⟩ := eventually_atTop.mp hGood
    filter_upwards [eventually_ge_atTop (k + N)] with j hj
    obtain ⟨i, rfl⟩ : ∃ i, j = i + N := ⟨j - N, by omega⟩
    intro x hx
    rw [← hScalar i x hx]
    have hs := scalar_abs_le_rm (g i) x
    have hu := hCurv (g i) x hx (hk i (by omega) x hx).1 (hk i (by omega) x hx).2
    change Real.sqrt (normSq0S (g i) x 4 (metricRm04 (g i) x)) ≤ A at hu
    rw [metricRm04_apply] at hu
    exact hs.trans (mul_le_mul_of_nonneg_left hu (sq_nonneg n))

/-- On the image of any compact subset the canonical metric convergence itself
transfers the scalar-square mass, also when the limit is noncompact. -/
theorem pointedScalarSq_integral_image
    (F : PointedRiemannianConvergenceMaps X P φ) (C : MetricConvergenceData F)
    (hc : ∀ i, C.domain i = CanonicalMetricCompactness.canonicalSourceData F i)
    {K : Set P.M} (hK : IsCompact K) :
    Tendsto (fun i => ∫⁻ x in F.map i '' K,
      ENNReal.ofReal (metricScalarAt (X.obj (φ i)).metric x ^ 2)
        ∂riemannianVolumeMeasure I (X.obj (φ i)).M (X.obj (φ i)).metric) atTop
      (𝓝 (∫⁻ x in K, ENNReal.ofReal (metricScalarAt P.metric x ^ 2)
        ∂riemannianVolumeMeasure I P.M P.metric)) := by
  obtain ⟨hPoint, B, hBound⟩ := pointedScalar_control_of_canonical_domains F C hc hK
  apply F.tendsto_setLIntegral_image C hc hK
    (fun j x => ENNReal.ofReal (metricScalarAt (X.obj j).metric x ^ 2))
    (fun j => ENNReal.continuous_ofReal.measurable.comp
      ((metricScalar_smooth (X.obj j).metric).continuous.pow 2).measurable)
    (B := ENNReal.ofReal (B ^ 2)) ENNReal.ofReal_ne_top
  · filter_upwards [hBound] with i hi
    intro x hx
    apply ENNReal.ofReal_le_ofReal
    rw [← sq_abs (metricScalarAt _ _)]
    exact pow_le_pow_left₀ (abs_nonneg _) (hi x hx) 2
  · exact fun x hx => ENNReal.continuous_ofReal.continuousAt.tendsto.comp ((hPoint x hx).pow 2)

/-- The scalar-square integral has its own pointed lower semicontinuity on
the original exhaustion, independent of the Ricci and chiral densities. -/
theorem pointedScalarSq_le_liminf
    (F : PointedRiemannianConvergenceMaps X P φ) (C : MetricConvergenceData F)
    (hc : ∀ i, C.domain i = CanonicalMetricCompactness.canonicalSourceData F i) :
    (∫⁻ x, ENNReal.ofReal (metricScalarAt P.metric x ^ 2)
        ∂riemannianVolumeMeasure I P.M P.metric) ≤
      liminf (fun i => ∫⁻ x, ENNReal.ofReal (metricScalarAt (X.obj (φ i)).metric x ^ 2)
        ∂riemannianVolumeMeasure I (X.obj (φ i)).M (X.obj (φ i)).metric) atTop :=
  bourPointedIntegral_le_liminf F
    (fun i x => ENNReal.ofReal (metricScalarAt (X.obj i).metric x ^ 2))
    (fun x => ENNReal.ofReal (metricScalarAt P.metric x ^ 2))
    (fun _ hK => pointedScalarSq_integral_image F C hc hK)

omit [NeZero (Module.finrank ℝ E)] [I.Boundaryless] in
private theorem realIntegral_of_compact {Q : PointedRiemannianManifold.{u,uE,uH} I}
    [CompactSpace Q.M] {f : Q.M → ℝ} (hf : Continuous f) (hp : ∀ x, 0 ≤ f x) :
    ENNReal.ofReal (∫ x, f x ∂riemannianVolumeMeasure I Q.M Q.metric) =
      ∫⁻ x, ENNReal.ofReal (f x) ∂riemannianVolumeMeasure I Q.M Q.metric := by
  let μ := riemannianVolumeMeasure I Q.M Q.metric
  let : IsFiniteMeasureOnCompacts μ := riemannianVolumeMeasure_isFiniteMeasureOnCompacts _
  exact ofReal_integral_eq_lintegral_ofReal
    (hf.integrable_of_hasCompactSupport (μ := μ) (HasCompactSupport.of_compactSpace _))
    (ae_of_all _ hp)

/-- A canonical comparison to a compact limit transfers both physical
integrals globally. Late surjectivity follows from connectedness of the
sources and the actual compact comparison maps. -/
theorem compactReturn_ricci_scalar
    (F : PointedRiemannianConvergenceMaps X P φ) (C : MetricConvergenceData F)
    (hc : ∀ i, C.domain i = CanonicalMetricCompactness.canonicalSourceData F i)
    [CompactSpace P.M] (hconn : ∀ i, ConnectedSpace (X.obj (φ i)).M)
    (hd : Module.finrank ℝ E = 4) :
    Tendsto (fun i => ∫ x, intrinsicTraceFreeRicciSq (X.obj (φ i)).metric x
      ∂riemannianVolumeMeasure I (X.obj (φ i)).M (X.obj (φ i)).metric) atTop
      (𝓝 (∫ x, intrinsicTraceFreeRicciSq P.metric x ∂riemannianVolumeMeasure I P.M P.metric)) ∧
    Tendsto (fun i => ∫ x, metricScalarAt (X.obj (φ i)).metric x ^ 2
      ∂riemannianVolumeMeasure I (X.obj (φ i)).M (X.obj (φ i)).metric) atTop
      (𝓝 (∫ x, metricScalarAt P.metric x ^ 2 ∂riemannianVolumeMeasure I P.M P.metric)) := by
  obtain ⟨n, hn⟩ := compactLimit_eventually_globalizes F inferInstance hconn
  have transfer (f : ∀ Q : PointedRiemannianManifold.{u,uE,uH} I, Q.M → ℝ)
      (hf : ∀ Q, Continuous (f Q)) (hp : ∀ Q x, 0 ≤ f Q x)
      (hlim : Tendsto (fun i => ∫⁻ x in F.map i '' univ, ENNReal.ofReal (f (X.obj (φ i)) x)
        ∂riemannianVolumeMeasure I (X.obj (φ i)).M (X.obj (φ i)).metric) atTop
        (𝓝 (∫⁻ x, ENNReal.ofReal (f P x) ∂riemannianVolumeMeasure I P.M P.metric))) :
      Tendsto (fun i => ∫ x, f (X.obj (φ i)) x
        ∂riemannianVolumeMeasure I (X.obj (φ i)).M (X.obj (φ i)).metric) atTop
        (𝓝 (∫ x, f P x ∂riemannianVolumeMeasure I P.M P.metric)) := by
    rw [← realIntegral_of_compact (hf P) (hp P)] at hlim
    have ht := (ENNReal.continuousAt_toReal ENNReal.ofReal_ne_top).tendsto.comp hlim
    rw [ENNReal.toReal_ofReal (integral_nonneg (hp P))] at ht
    apply ht.congr'
    filter_upwards [eventually_ge_atTop n] with i hi
    obtain ⟨_, _, e, he, _, _, hcompact⟩ := hn i hi
    let : CompactSpace (X.obj (φ i)).M := hcompact
    have hsurj : Function.Surjective (F.map i) := (funext he : (e : _ → _) = _ ) ▸ e.surjective
    simp only [Function.comp_apply, image_univ, hsurj.range_eq, setLIntegral_univ,
      ← realIntegral_of_compact (hf _) (hp _), ENNReal.toReal_ofReal (integral_nonneg (hp _))]
  constructor
  · apply transfer (fun Q => intrinsicTraceFreeRicciSq Q.metric)
      (fun Q => continuous_intrinsicTraceFreeRicciSq Q.metric)
      (fun Q => intrinsicTraceFreeRicciSq_nonneg_of_finrank hd Q.metric)
    simpa only [setLIntegral_univ] using pointedTerminalBuffer_tendsto_traceFreeRicci F C hc isCompact_univ
  · apply transfer (fun Q x => metricScalarAt Q.metric x ^ 2)
      (fun Q => (metricScalar_smooth Q.metric).continuous.pow 2) (fun _ _ => sq_nonneg _)
    simpa only [setLIntegral_univ] using pointedScalarSq_integral_image F C hc isCompact_univ

/-- On the whole compact zero-signature return, both chiral totals are
determined by the ordinary Ricci and scalar masses and the common Euler
evaluation. No choice of convergent frames is needed in this statement. -/
theorem compactReturn_signed_energy
    (F : PointedRiemannianConvergenceMaps X P φ) (C : MetricConvergenceData F)
    (hc : ∀ i, C.domain i = CanonicalMetricCompactness.canonicalSourceData F i)
    [CompactSpace P.M] [∀ i, CompactSpace (X.obj i).M]
    (hconn : ∀ i, ConnectedSpace (X.obj (φ i)).M)
    (oP : ManifoldOrientation I P.M 4) (oX : ∀ i, ManifoldOrientation I (X.obj i).M 4)
    (q : ∀ i, SignedCollarMetric (oX i)) (limit : SignedCollarMetric oP)
    (hMetric : ∀ i, (q i).metric = (X.obj i).metric) (hLimit : limit.metric = P.metric)
    (hEuler : ∀ᶠ i in atTop, bourEuler (q (φ i)) = bourEuler limit)
    (sign : CollarChirality) :
    Tendsto (fun i => (q (φ i)).energy sign) atTop (𝓝 (limit.energy sign)) := by
  have h := compactReturn_ricci_scalar F C hc hconn oP.dimension_eq
  have hD : Tendsto (fun i => bourRicci (q (φ i))) atTop (𝓝 (bourRicci limit)) := by
    simpa only [bourRicci_eq_integral, hMetric, hLimit] using h.1
  have hS : Tendsto (fun i => bourScalar (q (φ i))) atTop (𝓝 (bourScalar limit)) := by
    simpa only [bourScalar_eq_integral, hMetric, hLimit] using h.2
  have hplus : Tendsto (fun i => (q (φ i)).energy .plus) atTop (𝓝 (limit.energy .plus)) := by
    have hEq (z : ℝ) (d s e : ℝ) (hz : z = 2 * e + s / 24 - d / 2) :
        e = z / 2 + d / 4 - s / 48 := by linarith
    rw [hEq _ _ _ _ (bourEuler_eq_charges limit)]
    apply ((tendsto_const_nhds.add (hD.div_const 4)).sub (hS.div_const 48)).congr'
    filter_upwards [hEuler] with i hi
    exact hi ▸ (hEq _ _ _ _ (bourEuler_eq_charges (q (φ i)))).symm
  cases sign with
  | plus => exact hplus
  | minus =>
    have hSig : limit.energy .plus = limit.energy .minus := limit.signature_zero
    rw [← hSig]
    exact hplus.congr fun i => (q (φ i)).signature_zero

end SmoothPoincare.Bour
