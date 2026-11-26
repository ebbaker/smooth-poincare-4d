import SmoothPoincare.Variational.NativePocketFlattening
import SmoothPoincare.Variational.IntrinsicTerminalCharge
import FirstOrderTwistor.ConvergingFrames

/-! # Signed packages from the measured data on a native pocket -/

noncomputable section

open DifferentialGeometry DifferentialGeometry.Geometry.Curvature
  DifferentialGeometry.Integral.Measure DifferentialGeometry.Tensor0SBundle
  DifferentialGeometry.Tensor.Coordinates
  Filter FirstOrderTwistor Manifold MeasureTheory Metric SectionsAndConnections Set
open scoped ContDiff Manifold ENNReal Topology

namespace SmoothPoincare

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "I₄" => 𝓘(ℝ, E₄)

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H}
  [I.Boundaryless] [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [T2Space M] [CompactSpace M] [Nonempty M] {o : ManifoldOrientation I M 4}

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

/-- Orthonormalize the incoming oriented frame in the actual native slice metric. -/
def nativePocketPath_frame (F : PartialDiffeomorph I₄ I E₄ M ∞)
    (g : SignedCollarMetric o) (R : SmoothRiemannianMetric I M) {r : ℝ} (hr : 0 < r)
    (hS : closedBall (0 : E₄) (3*r) ⊆ F.source) (s : Icc (0 : ℝ) 1) (x : M) :
    OrientedOrthonormalFrameAt (nativePocketPath F g.metric R hr hS s) o x :=
  orthonormalFrameFromReferenceAt _ (g.frame x)

omit [I.Boundaryless] [Nonempty M] in
/-- The actual slice frames coincide with the original frames throughout the
complement of the closed changed ball. -/
theorem nativePocketPath_frame_outer (F : PartialDiffeomorph I₄ I E₄ M ∞)
    (g : SignedCollarMetric o) (R : SmoothRiemannianMetric I M) {r : ℝ} (hr : 0 < r)
    (hS : closedBall (0 : E₄) (3*r) ⊆ F.source) (s : Icc (0 : ℝ) 1)
    {x : M} (hx : x ∉ F '' closedBall (0 : E₄) (3*r)) :
    (nativePocketPath_frame F g R hr hS s x).basis = (g.frame x).basis := by
  have hOff : x ∉ F '' ball (0 : E₄) (3*r) := fun h => hx (image_mono ball_subset_closedBall h)
  have hMetric := (nativePocketPath_outer_germ F g.metric R hr hS s hOff).self_of_nhds
  unfold nativePocketPath_frame
  change metricGramSchmidtBasis (tangentMetricData (nativePocketPath F g.metric R hr hS s) x).metric
    (g.frame x).basis = _
  apply metricGramSchmidtBasis_eq_of_orthonormal
  intro i j
  rw [TangentMetricData.inner_eq (tangentMetricData (nativePocketPath F g.metric R hr hS s) x)]
  exact (hMetric _ _).trans ((g.frame x).orthonormal i j)

omit [I.Boundaryless] [Nonempty M] in
private theorem localVolumeDensity_one (g h : SmoothRiemannianMetric I M) (x : M)
    (hEq : ∀ v w : TangentSpace I x, h.inner x v w = g.inner x v w) :
    riemannianVolumeDensity g h x = 1 := by
  have hGram : chartGramMatrix h x x = chartGramMatrix g x x := by
    ext i j
    simp only [chartGramMatrix_apply, hEq]
  have hChart : chartDensity h x x = chartDensity g x x := by
    simp only [chartDensity, hGram]
  have hx : x ∈ (chartAt H x).source := mem_chart_source H x
  rw [riemannianVolumeDensity_apply_of_mem_chart_source _ _ x hx, hChart,
    div_self (chartDensity_pos _ _ hx).ne']

omit [I.Boundaryless] [Nonempty M] in
private theorem localVolume_restrict_eq (g h : SmoothRiemannianMetric I M) {A : Set M}
    (hA : MeasurableSet A)
    (hEq : ∀ x ∈ A, ∀ v w : TangentSpace I x, h.inner x v w = g.inner x v w) :
    (riemannianVolumeMeasure I M h).restrict A = (riemannianVolumeMeasure I M g).restrict A := by
  rw [riemannianVolumeMeasure_eq_withDensity g h, restrict_withDensity hA]
  have he : (fun x => ENNReal.ofReal (riemannianVolumeDensity g h x)) =ᵐ[
      (riemannianVolumeMeasure I M g).restrict A] 1 := by
    filter_upwards [ae_restrict_mem hA] with x hx
    rw [localVolumeDensity_one g h x (hEq x hx)]
    exact ENNReal.ofReal_one
  rw [withDensity_congr_ae he, withDensity_one]

omit [Nonempty M] in
private theorem nativeDensity_integrableOn_of_aestronglyMeasurable
    (h : SmoothRiemannianMetric I M) (f : ∀ x, OrientedOrthonormalFrameAt h o x)
    (sg : CollarChirality) {A : Set M}
    (hm : AEStronglyMeasurable (fun x => hilbertSchmidtSq (signedCollarWeylBlock o h f sg x))
      ((riemannianVolumeMeasure I M h).restrict A)) :
    IntegrableOn (fun x => hilbertSchmidtSq (signedCollarWeylBlock o h f sg x)) A
      (riemannianVolumeMeasure I M h) := by
  have hCont : Continuous (intrinsicCurvatureSq h) := by
    change Continuous (fun x => normSq0S h x 4 (metricRm04At h x))
    simpa only [metricRm04_apply] using normSq0S_cont h (metricRm04 h)
  obtain ⟨D, hD⟩ := (isCompact_univ.image hCont).bddAbove
  let : IsFiniteMeasureOnCompacts (riemannianVolumeMeasure I M h) :=
    riemannianVolumeMeasure_isFiniteMeasureOnCompacts h
  let : IsFiniteMeasure (riemannianVolumeMeasure I M h) :=
    ⟨isCompact_univ.measure_lt_top⟩
  refine IntegrableOn.of_bound (measure_lt_top _ _) hm D (Eventually.of_forall fun x => ?_)
  have hAll : intrinsicCurvatureSq h x ≤ D := hD ⟨x, mem_univ _, rfl⟩
  rw [intrinsicCurvatureSq, normSq0S_rm04_eq_frameTensorNormSq h o x (f x)] at hAll
  have hSplit := metricFrameTensorNormSq_eq_chiral_ricci_scalar h o x (f x)
  change _ = 4 * (modifiedChargeDensity o h f .plus x + modifiedChargeDensity o h f .minus x) +
      2 * modifiedChargeDensity o h f .ricci x + modifiedChargeDensity o h f .scalar x / 6 at hSplit
  have hPlus := modifiedChargeDensity_nonneg o h f .plus x
  have hMinus := modifiedChargeDensity_nonneg o h f .minus x
  have hSc := modifiedChargeDensity_nonneg o h f .scalar x
  have hRic := modifiedChargeDensity_nonneg o h f .ricci x
  cases sg
  · change ‖modifiedChargeDensity o h f .plus x‖ ≤ D
    rw [Real.norm_of_nonneg hPlus]
    linarith only [hAll, hSplit, hPlus, hMinus, hSc, hRic]
  · change ‖modifiedChargeDensity o h f .minus x‖ ≤ D
    rw [Real.norm_of_nonneg hMinus]
    linarith only [hAll, hSplit, hPlus, hMinus, hSc, hRic]

omit [Nonempty M] in
/-- The native slice inherits the complete exterior from the original signed
metric. Only measurability and the signed integral balance on the changed
closed ball enter the signed package. Smoothness of the native metric and
the intrinsic curvature square provide local domination. -/
theorem exists_nativePocketSignedSlice_of_localData
    (F : PartialDiffeomorph I₄ I E₄ M ∞)
    (g : SignedCollarMetric o) (R : SmoothRiemannianMetric I M) {r : ℝ} (hr : 0 < r)
    (hS : closedBall (0 : E₄) (3*r) ⊆ F.source) (s : Icc (0 : ℝ) 1) :
    let A := F '' closedBall (0 : E₄) (3*r)
    let h := nativePocketPath F g.metric R hr hS s
    let f := nativePocketPath_frame F g R hr hS s
    let W := fun sg x => hilbertSchmidtSq (signedCollarWeylBlock o h f sg x)
    let μ := riemannianVolumeMeasure I M h
    (∀ sg, AEStronglyMeasurable (W sg) (μ.restrict A)) →
    ((∫ x in A, W .plus x ∂μ) - (∫ x in A, W .minus x ∂μ) =
      g.charge .plus A - g.charge .minus A) →
    ∃ q : SignedCollarMetric o, q.metric = h ∧ HEq q.frame f ∧
      (∀ x ∉ A, (g.frame x).basis = (q.frame x).basis) ∧
      ∀ sg, g.charge sg Aᶜ = q.charge sg Aᶜ := by
  intro A h f W μ hMeas hBalance
  let μ₀ := riemannianVolumeMeasure I M g.metric
  let W₀ : CollarChirality → M → ℝ :=
    fun sg x => hilbertSchmidtSq (signedCollarWeylBlock o g.metric g.frame sg x)
  have hA : MeasurableSet A := ((isCompact_closedBall _ _).image_of_continuousOn
    (F.contMDiffOn_toFun.continuousOn.mono hS)).measurableSet
  have hGerm (x : M) (hx : x ∈ Aᶜ) :
      ∀ᶠ y in 𝓝 x, ∀ v w : TangentSpace I y, h.inner y v w = g.metric.inner y v w := by
    have hOff : x ∉ F '' ball (0 : E₄) (3*r) := fun hh => hx (image_mono ball_subset_closedBall hh)
    exact nativePocketPath_outer_germ F g.metric R hr hS s hOff
  have hFrame (x : M) (hx : x ∈ Aᶜ) : (f x).basis = (g.frame x).basis :=
    nativePocketPath_frame_outer F g R hr hS s hx
  have hW (sg : CollarChirality) : EqOn (W₀ sg) (W sg) Aᶜ := by
    intro x hx
    have hRm := metricRm04At_eq_of_metric_eventuallyEq h g.metric x (hGerm x hx)
    have hTensor : metricCurvatureFrameTensor h o x (f x) =
        metricCurvatureFrameTensor g.metric o x (g.frame x) := by
      funext i j k l
      change metricRm04StandardAt h x ((f x).basis i) ((f x).basis j)
        ((f x).basis l) ((f x).basis k) =
        metricRm04StandardAt g.metric x ((g.frame x).basis i) ((g.frame x).basis j)
          ((g.frame x).basis l) ((g.frame x).basis k)
      simp only [metricRm04StandardAt_apply, hFrame x hx, hRm]
    cases sg <;> simp [W₀, W, signedCollarWeylBlock, geometricChiralBlock,
      endpointNegativeWeylBlock, hTensor]
  have hVolume : μ.restrict Aᶜ = μ₀.restrict Aᶜ :=
    localVolume_restrict_eq g.metric h hA.compl (fun x hx => (hGerm x hx).self_of_nhds)
  have hInt (sg : CollarChirality) : Integrable (W sg) μ := by
    have hInside : IntegrableOn (W sg) A μ :=
      nativeDensity_integrableOn_of_aestronglyMeasurable h f sg (hMeas sg)
    have hOutside : IntegrableOn (W sg) Aᶜ μ := by
      rw [IntegrableOn, hVolume, ← IntegrableOn]
      exact (g.integrable sg).integrableOn.congr_fun (hW sg) hA.compl
    simpa only [union_compl_self, integrableOn_univ] using hInside.union hOutside
  have hOutside (sg : CollarChirality) :
      (∫ x in Aᶜ, W sg x ∂μ) = ∫ x in Aᶜ, W₀ sg x ∂μ₀ := by
    rw [hVolume]
    exact setIntegral_congr_fun hA.compl (hW sg).symm
  have hOld (sg : CollarChirality) :
      g.charge sg A = ∫ x in A, W₀ sg x ∂μ₀ :=
    energyMeasure_real_apply hA ((g.integrable sg).integrableOn)
      (Eventually.of_forall fun x => Finset.sum_nonneg fun i _ =>
        Finset.sum_nonneg fun j _ => sq_nonneg (signedCollarWeylBlock o g.metric g.frame sg x i j))
  have hOldSplit (sg : CollarChirality) :
      (∫ x in A, W₀ sg x ∂μ₀) + (∫ x in Aᶜ, W₀ sg x ∂μ₀) = g.energy sg :=
    integral_add_compl hA (g.integrable sg)
  have hSig : (∫ x, W .plus x ∂μ) = ∫ x, W .minus x ∂μ := by
    rw [← integral_add_compl hA (hInt .plus), ← integral_add_compl hA (hInt .minus),
      hOutside .plus, hOutside .minus]
    rw [hOld .plus, hOld .minus] at hBalance
    have hSourceSignature : g.energy .plus = g.energy .minus := g.signature_zero
    linarith only [hBalance, hOldSplit .plus, hOldSplit .minus, hSourceSignature]
  let q : SignedCollarMetric o :=
    { metric := h
      frame := f
      integrable := hInt
      signature_zero := hSig }
  refine ⟨q, rfl, HEq.rfl, fun x hx => (hFrame x hx).symm, ?_⟩
  intro sg
  exact selectedReference_charge_eq_of_germ g q hA.compl
    (fun x hx => (hGerm x hx).mono fun y hy v w => (hy v w).symm)
    (fun x hx => (hFrame x hx).symm) sg


omit [Nonempty M] in
/-- A single signed family realizes the native metric at every original
path parameter and retains the source frames and charges on the full
complement of the changed closed ball. -/
theorem exists_nativePocketSignedSlices_of_localData
    (F : PartialDiffeomorph I₄ I E₄ M ∞)
    (g : SignedCollarMetric o) (R : SmoothRiemannianMetric I M) {r : ℝ} (hr : 0 < r)
    (hS : closedBall (0 : E₄) (3*r) ⊆ F.source) :
    let A := F '' closedBall (0 : E₄) (3*r)
    (∀ s : Icc (0 : ℝ) 1,
      let h := nativePocketPath F g.metric R hr hS s
      let f := nativePocketPath_frame F g R hr hS s
      let W := fun sg x => hilbertSchmidtSq (signedCollarWeylBlock o h f sg x)
      let μ := riemannianVolumeMeasure I M h
      (∀ sg, AEStronglyMeasurable (W sg) (μ.restrict A)) ∧
      (∫ x in A, W .plus x ∂μ) - (∫ x in A, W .minus x ∂μ) =
        g.charge .plus A - g.charge .minus A) →
    ∃ q : Icc (0 : ℝ) 1 → SignedCollarMetric o, ∀ s,
      (q s).metric = nativePocketPath F g.metric R hr hS s ∧
      HEq (q s).frame (nativePocketPath_frame F g R hr hS s) ∧
      (∀ x ∉ A, (g.frame x).basis = ((q s).frame x).basis) ∧
      ∀ sg, g.charge sg Aᶜ = (q s).charge sg Aᶜ := by
  intro A hLocal
  choose q hq using
    (fun s => exists_nativePocketSignedSlice_of_localData F g R hr hS s (hLocal s).1 (hLocal s).2)
  exact ⟨q, hq⟩

end SmoothPoincare
