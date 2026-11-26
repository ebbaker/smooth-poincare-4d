import SmoothPoincare.PhysicalScales.TerminalMetricJets
import SmoothPoincare.Variational.TerminalChargeTransferNaturality
import DifferentialGeometry.Geometry.Compactness.CheegerGromov.Pointed.Convergence.Volume

/-! # Transfer terminal trace-free Ricci charge on a buffered pointed comparison -/

open DifferentialGeometry DifferentialGeometry.CheegerGromovCompactness
  DifferentialGeometry.Geometry.Curvature DifferentialGeometry.Integral.Measure
  DifferentialGeometry.Tensor0SBundle DifferentialGeometry.PDE.RicciFlow
  DifferentialGeometry.PDE.RicciFlow.Perelman.KappaSolutions Set Filter MeasureTheory TopologicalSpace
open scoped Manifold ContDiff Topology ENNReal

noncomputable section
namespace SmoothPoincare

universe u uE uH
variable {E : Type uE} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
  [NeZero (Module.finrank ℝ E)] {H : Type uH} [TopologicalSpace H]
  {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  {X : PointedRiemannianSeq.{u,uE,uH} I} {P : PointedRiemannianManifold.{u,uE,uH} I}
  {φ : ℕ → ℕ}

attribute [local instance] PointedRiemannianManifold.topology PointedRiemannianManifold.charted
  PointedRiemannianManifold.smooth PointedRiemannianManifold.t2
  PointedRiemannianManifold.sigmaCompact PointedRiemannianManifold.t2TangentBundle
private local instance (Q : PointedRiemannianManifold.{u,uE,uH} I) :
    MeasurableSpace Q.M := borel Q.M
private local instance (Q : PointedRiemannianManifold.{u,uE,uH} I) :
    BorelSpace Q.M := ⟨rfl⟩
private local instance : CompleteSpace E := FiniteDimensional.complete ℝ E

/-- The actual curvature density and volume on images of a fixed compact set
converge in the pointed metric gauge. No convergence of curvature integrals
is required as an additional hypothesis. -/
theorem pointedTerminalBuffer_tendsto_traceFreeRicci
    (F : PointedRiemannianConvergenceMaps X P φ) (C : MetricConvergenceData F)
    (hcanonical : ∀ i, C.domain i = CanonicalMetricCompactness.canonicalSourceData F i)
    {K : Set P.M} (hK : IsCompact K) :
    Tendsto (fun i => ∫⁻ x in F.map i '' K,
      ENNReal.ofReal (intrinsicTraceFreeRicciSq (X.obj (φ i)).metric x)
        ∂(riemannianVolumeMeasure I (X.obj (φ i)).M (X.obj (φ i)).metric)) atTop
      (𝓝 (∫⁻ x in K, ENNReal.ofReal (intrinsicTraceFreeRicciSq P.metric x)
        ∂(riemannianVolumeMeasure I P.M P.metric))) := by
  classical
  let _ : LocallyCompactSpace P.M := Manifold.locallyCompact_of_finiteDimensional I
  let _ : IsManifold I 1 P.M := IsManifold.of_le (n := ∞) (by decide)
  obtain ⟨K',hK',hKK'⟩ := exists_compact_superset hK
  obtain ⟨N,hN⟩ := F.source_subset hK'
  have hsrc (i : ℕ) : K' ⊆ (F.partialDiffeomorph (i+N)).source := hN _ (by omega)
  choose g hg using fun i => exists_smooth_riemannian_metric_eq_pullback_on_compact
    (F.partialDiffeomorph (i+N)) hK' (hsrc i) (X.obj (φ (i+N))).metric P.metric
  let U : Opens P.M := ⟨interior K',isOpen_interior⟩
  have hU (i : ℕ) : (U : Set P.M) ⊆ (F.partialDiffeomorph (i+N)).source :=
    interior_subset.trans (hsrc i)
  have heq (i : ℕ) (x : P.M) (hx : x ∈ K) :
      intrinsicTraceFreeRicciSq (g i) x = intrinsicTraceFreeRicciSq
        (X.obj (φ (i+N))).metric (F.map (i+N) x) :=
    intrinsicTraceFreeRicciSq_eq_of_partialDiffeomorph_inner (g i) _
      (F.partialDiffeomorph (i+N)) U (hU i)
      (fun y hy v w => hg i y (interior_subset hy) v w) (hKK' hx)
  have hjet : ∀ ε > (0:ℝ), ∀ᶠ i in atTop, ∀ x ∈ K, ∀ a ≤ 2,
      metricDerivNorm a (g i) P.metric P.metric x < ε := by
    intro ε he
    obtain ⟨k,hk⟩ := C.converges K hK 2 ε he
    filter_upwards [eventually_ge_atTop k] with i hi
    have h := (hk (i+N) (by omega)).2
    rw [hcanonical (i+N),canonicalSourceData_derivNormSupOn_eq_of_pullback
      F (i+N) (g i) K U 2 U.isOpen hKK' (hU i)
      (fun x hx v w => hg i x (interior_subset hx) v w)] at h
    intro x hx a ha
    exact (derivNorm_le_sup hK ha (g i) P.metric P.metric hx).trans_lt h
  obtain ⟨hpt,B,hB⟩ := terminalTraceFreeRicciSq_of_twoJets P.metric g hK hjet
  apply F.tendsto_setLIntegral_image C hcanonical hK
    (fun i x => ENNReal.ofReal (intrinsicTraceFreeRicciSq (X.obj i).metric x))
    _ (B := ENNReal.ofReal B) ENNReal.ofReal_ne_top
  · obtain ⟨n,hn⟩ := eventually_atTop.mp hB
    filter_upwards [eventually_ge_atTop (n+N)] with j hj
    obtain ⟨i, rfl⟩ : ∃ i, j = i+N := ⟨j-N, by omega⟩
    intro x hx
    rw [← heq i x hx]
    exact ENNReal.ofReal_le_ofReal (hn i (by omega) x hx)
  · intro x hx
    rw [← tendsto_add_atTop_iff_nat N]
    simp_rw [← heq _ x hx]
    simpa only [Function.comp_def] using (ENNReal.continuous_ofReal.tendsto _).comp (hpt x hx)
  · intro i
    exact ENNReal.continuous_ofReal.measurable.comp
      (continuous_intrinsicTraceFreeRicciSq (X.obj i).metric).measurable

/-- An open charged source ball passes to any strictly larger open limit
ball. The proof puts a compact closed comparison ball strictly between the
two radii, allowing the volume and charge comparison on its entire image. -/
theorem pointedTerminalBuffer_traceFreeRicci_charge
    (F : PointedRiemannianConvergenceMaps X P φ) (C : MetricConvergenceData F)
    (hcanonical : ∀ i, C.domain i = CanonicalMetricCompactness.canonicalSourceData F i)
    (hc : MetricComplete P) {a b : ℝ} (ha : 0 < a) (hab : a < b) {q : ℝ≥0∞}
    (hcharge : ∀ᶠ i in atTop, q ≤ ∫⁻ x in riemannianBallOf (X.obj (φ i)).metric
      (X.obj (φ i)).basepoint a, ENNReal.ofReal (intrinsicTraceFreeRicciSq (X.obj (φ i)).metric x)
        ∂(riemannianVolumeMeasure I (X.obj (φ i)).M (X.obj (φ i)).metric)) :
    q ≤ ∫⁻ x in riemannianBallOf P.metric P.basepoint b,
      ENNReal.ofReal (intrinsicTraceFreeRicciSq P.metric x) ∂(riemannianVolumeMeasure I P.M P.metric) := by
  obtain ⟨r,har,hrb⟩ := exists_between hab
  obtain ⟨l,hl,hlr⟩ := exists_between ((one_lt_div ha).mpr har)
  let K := riemannianClosedBallOf P.metric P.basepoint r
  have hcomp : RiemannianMetricComplete P.metric := ⟨MetricComplete.complete P hc⟩
  have hK : IsCompact K := hcomp.closedEBall_isCompact _ _
  have href i : (C.domain i).referenceMetric = (C.domain i).limitMetric := by rw [hcanonical]; rfl
  have hcap := F.eventually_ball_subset_image_closed_ball C href hc P.basepoint hl
    ((lt_div_iff₀ ha).mp hlr)
  have hv := pointedTerminalBuffer_tendsto_traceFreeRicci F C hcanonical hK
  apply (ge_of_tendsto hv ?_).trans
  · apply lintegral_mono_set
    intro x hx
    exact lt_of_le_of_lt hx ((ENNReal.ofReal_lt_ofReal_iff (ha.trans hab)).mpr hrb)
  · filter_upwards [hcharge,hcap] with i hi hcover
    apply hi.trans
    apply lintegral_mono_set
    simpa only [PointedRiemannianConvergenceMaps.map,F.basepoint_map] using hcover.2

end SmoothPoincare
