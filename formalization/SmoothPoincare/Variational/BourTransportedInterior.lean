import SmoothPoincare.Variational.BourHarmonicBalls
import SmoothPoincare.Variational.BourStationaryInterior
import DifferentialGeometry.Geometry.Metric.Comparison.PartialDiffeomorphBallCapture
import DifferentialGeometry.Geometry.Measure.Area.ManifoldEuclidean
import DifferentialGeometry.Geometry.Operator.Scaling

/-!
# Buffered harmonic coordinates in both stationary Bour gauges

26 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance.
Actual serving configuration unavailable.

The harmonic radius theorem is an explicit input. The two-sided ball comparison,
restriction of the actual charts, Yamabe noncollapse and scale bookkeeping are proved.
-/

set_option autoImplicit false

noncomputable section

open Bundle DifferentialGeometry DifferentialGeometry.Geometry
open DifferentialGeometry.Geometry.Connection DifferentialGeometry.Geometry.Curvature
open DifferentialGeometry.Geometry.Operator DifferentialGeometry.Tensor.Coordinates
open FirstOrderTwistor Manifold Set
open scoped ContDiff Manifold NNReal Topology

namespace SmoothPoincare

variable {E H M : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
  [FiniteDimensional ℝ E] [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]

private local instance : CompleteSpace E := FiniteDimensional.complete ℝ E

local notation "J" => Fin (Module.finrank ℝ E)
local notation "ι" => 𝓘(ℝ, E)

private def pullbackEntry (g : SmoothRiemannianMetric I M)
    (F : PartialDiffeomorph ι I E M ∞) (i k : J) (z : E) : ℝ :=
  g.inner (F z) (mfderiv ι I (F : E → M) z (chartModelBasis E i))
    (mfderiv ι I (F : E → M) z (chartModelBasis E k))

/-- Physical inverse harmonic coordinates and first-jet bounds on their
coordinate domain. The domain is fixed separately by the realization theorems. -/
structure BourHarmonicChart (g : SmoothRiemannianMetric I M) (x : M)
    (L : ℝ) (A γ : ℝ≥0) where
  chart : PartialDiffeomorph ι I E M ∞
  center_mem : 0 ∈ chart.source
  center_eq : chart 0 = x
  harmonic : ∀ l : J, ∀ y ∈ chart.target,
    laplacian (LeviCivita g) g
      (fun w => (chartModelBasis E).coord l (chart.symm w)) y = 0
  metric_bounds : ∀ z ∈ chart.source, ∀ v : E,
    let W := mfderiv ι I (chart : E → M) z v
    L⁻¹ ^ 2 * ‖v‖ ^ 2 ≤ g.inner (chart z) W W ∧
      g.inner (chart z) W W ≤ L ^ 2 * ‖v‖ ^ 2
  first_jet_bound : ∀ i k : J, ∀ z ∈ chart.source,
    ‖fderiv ℝ (pullbackEntry g chart i k) z‖ ≤ (A : ℝ)
  first_jet_holder : ∀ i k : J,
    HolderOnWith A γ (fderiv ℝ (pullbackEntry g chart i k)) chart.source

omit [FiniteDimensional ℝ E] in
private theorem euclidean_ball (p : E) {r : ℝ} (hr : 0 < r) :
    riemannianBallOf (standardEuclideanMetric E) p r = Metric.ball p r := by
  ext z
  simp only [riemannianBallOf, Set.mem_ofPred_eq, Metric.mem_ball,
    riemannianEDistOf_standardEuclideanMetric, edist_dist,
    ENNReal.ofReal_lt_ofReal_iff hr, dist_comm]

omit [FiniteDimensional ℝ E] in
private theorem euclidean_closedBall (p : E) {r : ℝ} (hr : 0 ≤ r) :
    riemannianClosedBallOf (standardEuclideanMetric E) p r = Metric.closedBall p r := by
  ext z
  simp only [riemannianClosedBallOf, Set.mem_ofPred_eq, Metric.mem_closedBall,
    riemannianEDistOf_standardEuclideanMetric, edist_dist,
    ENNReal.ofReal_le_ofReal_iff hr, dist_comm]

private def restrictChart (F : PartialDiffeomorph ι I E M ∞) (s : Set E)
    (hs : IsOpen s) : PartialDiffeomorph ι I E M ∞ :=
  let e := F.toOpenPartialHomeomorph.restrOpen s hs
  { toPartialEquiv := e.toPartialEquiv
    open_source := e.open_source
    open_target := e.open_target
    contMDiffOn_toFun := F.contMDiffOn_toFun.mono (fun _ hz => hz.1)
    contMDiffOn_invFun := F.contMDiffOn_invFun.mono (fun _ hz => hz.1) }

private theorem derivative_chart_inverse (F : PartialDiffeomorph ι I E M ∞)
    {y : M} (hy : y ∈ F.target) (v : TangentSpace I y) :
    mfderiv ι I (F : E → M) (F.symm y) (mfderiv I ι (F.symm : M → E) y v) =
      v := by
  have h₁ : MDifferentiableAt ι I (F : E → M) (F.symm y) :=
    (F.contMDiffOn_toFun.contMDiffAt
      (F.open_source.mem_nhds (F.map_target' hy))).mdifferentiableAt (by simp)
  have h₂ : MDifferentiableAt I ι (F.symm : M → E) y := (F.symm.contMDiffOn_toFun.contMDiffAt
    (F.open_target.mem_nhds hy)).mdifferentiableAt (by simp)
  have hEq : (F : E → M) ∘ (F.symm : M → E) =ᶠ[𝓝 y] id :=
    Filter.eventuallyEq_iff_exists_mem.mpr
      ⟨F.target, F.open_target.mem_nhds hy, fun _ hz => F.right_inv' hz⟩
  calc
    _ = mfderiv I I ((F : E → M) ∘ (F.symm : M → E)) y v :=
      (mfderiv_comp_apply y h₁ h₂ v).symm
    _ = v := by rw [hEq.mfderiv_eq, mfderiv_id]; rfl

/-- A chart originally defined on a physical ball gives a common buffered
Euclidean ball and captures a smaller physical ball. The two radius conversions
follow from the metric bounds by the pinned length-distance comparison. -/
theorem BourHarmonicChart.exists_buffered [CompactSpace M]
    {g : SmoothRiemannianMetric I M} {x : M} {R L : ℝ} {A γ : ℝ≥0}
    (h : BourHarmonicChart g x L A γ) (hR : 0 < R) (hL : 0 < L)
    (hTarget : h.chart.target = riemannianBallOf g x R) :
    let r := R / (8 * L)
    ∃ b : BourHarmonicChart g x L A γ, b.chart.source = Metric.ball (0 : E) (4 * r) ∧
      b.chart.target ⊆ riemannianBallOf g x R ∧
      riemannianBallOf g x (r / L) ⊆ b.chart '' Metric.closedBall (0 : E) r := by
  let r := R / (8 * L)
  have hr : 0 < r := div_pos hR (by positivity)
  have hR₂ : 0 < R / 2 := half_pos hR
  have hBuffer : 4 * r = (R / 2) / L := by dsimp [r]; ring
  have hTargetBuffer : riemannianClosedBallOf g x (R / 2) ⊆ h.chart.target := by
    rw [hTarget]
    intro y hy
    change riemannianEDistOf g x y < ENNReal.ofReal R
    exact hy.trans_lt ((ENNReal.ofReal_lt_ofReal_iff hR).2 (half_lt_self hR))
  have hCenter : h.chart.symm x = (0 : E) := by
    rw [← h.center_eq]
    exact h.chart.left_inv' h.center_mem
  have hCompact : IsCompact (riemannianClosedBallOf g x (R / 2)) :=
    (isClosed_le (continuous_riemannianEDist (I := I) g x) continuous_const).isCompact
  have hReverse := DifferentialGeometry.PartialDiffeomorph.ball_subset_image_closedBall_of_metric_lower
    g (standardEuclideanMetric E) h.chart.symm x hR₂ hL hCompact hTargetBuffer
  have hReverseQuad (y : M) (hy : y ∈ riemannianClosedBallOf g x (R / 2))
      (v : TangentSpace I y) :
      g.inner y v v ≤ L ^ 2 * (standardEuclideanMetric E).inner (h.chart.symm y)
        (mfderiv I ι (h.chart.symm : M → E) y v)
        (mfderiv I ι (h.chart.symm : M → E) y v) := by
    have hyTarget := hTargetBuffer hy
    let w := mfderiv I ι (h.chart.symm : M → E) y v
    have hUpper := (h.metric_bounds (h.chart.symm y) (h.chart.map_target' hyTarget) w).2
    dsimp only at hUpper
    rw [h.chart.right_inv' hyTarget, derivative_chart_inverse h.chart hyTarget v] at hUpper
    simpa only [standardEuclideanMetric, riemannianMetricVectorSpace, real_inner_self_eq_norm_sq]
      using hUpper
  have hCoord : Metric.ball (0 : E) (4 * r) ⊆ h.chart.source := by
    have hcap := hReverse hReverseQuad
    rw [hCenter, euclidean_ball _ (div_pos hR₂ hL), ← hBuffer] at hcap
    rintro z hz
    obtain ⟨y, hy, rfl⟩ := hcap hz
    exact h.chart.map_target' (hTargetBuffer hy)
  let F := restrictChart h.chart (Metric.ball (0 : E) (4 * r)) Metric.isOpen_ball
  have hSource : F.source = Metric.ball (0 : E) (4 * r) :=
    inter_eq_right.mpr hCoord
  have hSubset : F.target ⊆ h.chart.target := fun _ hz => hz.1
  let b : BourHarmonicChart g x L A γ :=
    { chart := F
      center_mem := by rw [hSource]; exact Metric.mem_ball_self (by positivity)
      center_eq := h.center_eq
      harmonic := fun l y hy => h.harmonic l y (hSubset hy)
      metric_bounds := fun z hz v => h.metric_bounds z (hCoord (hSource ▸ hz)) v
      first_jet_bound := fun i k z hz => h.first_jet_bound i k z (hCoord (hSource ▸ hz))
      first_jet_holder := fun i k => (h.first_jet_holder i k).mono (hSource.symm ▸ hCoord) }
  refine ⟨b, hSource, hTarget ▸ hSubset, ?_⟩
  have hClosedSubset : riemannianClosedBallOf (standardEuclideanMetric E) 0 r ⊆ F.source := by
    rw [euclidean_closedBall _ hr.le, hSource]
    exact Metric.closedBall_subset_ball (by linarith)
  have hCompactE : IsCompact (riemannianClosedBallOf (standardEuclideanMetric E) 0 r) := by
    rw [euclidean_closedBall _ hr.le]
    exact isCompact_closedBall _ _
  have hForward := DifferentialGeometry.PartialDiffeomorph.ball_subset_image_closedBall_of_metric_lower
    (standardEuclideanMetric E) g F 0 hr hL hCompactE hClosedSubset
  have hForwardQuad (z : E) (hz : z ∈ riemannianClosedBallOf (standardEuclideanMetric E) 0 r)
      (v : E) :
      (standardEuclideanMetric E).inner z v v ≤ L ^ 2 *
        g.inner (F z) (mfderiv ι I (F : E → M) z v) (mfderiv ι I (F : E → M) z v) := by
    have hlower := (b.metric_bounds z (hClosedSubset hz) v).1
    dsimp only at hlower
    have hmul := mul_le_mul_of_nonneg_left hlower (sq_nonneg L)
    rw [← mul_assoc, ← mul_pow, mul_inv_cancel₀ hL.ne', one_pow, one_mul] at hmul
    simpa only [standardEuclideanMetric, riemannianMetricVectorSpace, real_inner_self_eq_norm_sq]
      using hmul
  have hcap := hForward hForwardQuad
  rwa [show F 0 = x from h.center_eq, euclidean_closedBall _ hr.le] at hcap


variable [I.Boundaryless]

/-- The same coordinate functions are harmonic at both constant metric
scales. The Laplacian changes by the inverse metric factor. -/
theorem bourHarmonic_scaleMetric_iff (g : SmoothRiemannianMetric I M)
    {a : ℝ} (ha : 0 < a) {U : Set M} (hU : IsOpen U) {x : M} (hx : x ∈ U)
    {f : M → ℝ} (hf : ContMDiffOn I 𝓘(ℝ, ℝ) ∞ f U) :
    laplacian (LeviCivita (scaleMetric a ha g)) (scaleMetric a ha g) f x = 0 ↔
      laplacian (LeviCivita g) g f x = 0 := by
  rw [show LeviCivita (scaleMetric a ha g) = LeviCivita g from lcConn_scaleMetric a ha g,
    laplacian_scaleMetric a ha (LeviCivita g) g (gradientFun_mdiffOn g hU hf hx)]
  simp [ha.ne']

/-- A buffered coordinate patch constructed in the rescaled physical gauge
contains the original physical ball with the radius divided by `sqrt a`.
It remains harmonic for the original metric on its whole target. -/
theorem BourHarmonicChart.transport_to_original (g : SmoothRiemannianMetric I M)
    {a : ℝ} (ha : 0 < a) {x : M} {L r : ℝ} {A γ : ℝ≥0}
    (b : BourHarmonicChart (scaleMetric a ha g) x L A γ)
    (hCapture : riemannianBallOf (scaleMetric a ha g) x (r / L) ⊆
      b.chart '' Metric.closedBall (0 : E) r) :
    riemannianBallOf g x ((r / L) / Real.sqrt a) ⊆
      b.chart '' Metric.closedBall (0 : E) r ∧
    ∀ l : J, ∀ y ∈ b.chart.target,
      laplacian (LeviCivita g) g
        (fun w => (chartModelBasis E).coord l (b.chart.symm w)) y = 0 := by
  constructor
  · have hRadius : Real.sqrt a * ((r / L) / Real.sqrt a) = r / L := by
      field_simp [(Real.sqrt_pos.2 ha).ne']
    have hScale := riemannianBallOf_scaleMetric a ha g x ((r / L) / Real.sqrt a)
    rwa [hRadius, ← hScale]
  · intro l y hy
    let c := ((chartModelBasis E).coord l).toContinuousLinearMap
    have hc : ContMDiff ι 𝓘(ℝ, ℝ) ∞ c := c.contDiff.contMDiff
    exact (bourHarmonic_scaleMetric_iff g ha b.chart.open_target hy
      (hc.comp_contMDiffOn b.chart.symm.contMDiffOn_toFun)).1 (b.harmonic l y hy)

variable [CompactSpace M] [ConnectedSpace M] [Nonempty M]
  [NeZero (Module.finrank ℝ E)]

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

/-- The Peters/Jost–Karcher input at a fixed dimension, curvature bound
and positive intrinsic injectivity radius. It supplies harmonic charts on
physical balls and first-jet bounds. The Euclidean buffer and inner
physical ball are derived in `BourHarmonicChart.exists_buffered`. -/
def BourHarmonicRadiusSupplier (K : ℝ) (γ : ℝ≥0) : Prop :=
  ∀ i₀ : ℝ, 0 < i₀ →
    ∃ (R L : ℝ) (A : ℝ≥0), 0 < R ∧ 0 < L ∧
      ∀ h : SmoothRiemannianMetric I M,
        (∀ x : M, Real.sqrt (intrinsicCurvatureSq h x) ≤ K) →
        (∀ x : M, ENNReal.ofReal i₀ ≤ bourPhysicalInjRadius h x) →
        ∀ x : M, ∃ c : BourHarmonicChart h x L A γ,
          c.chart.target = riemannianBallOf h x R

/-- A common Yamabe floor, scalar ceiling and normalized ordered
curvature bound allow one application of the harmonic radius supplier
before the choice of scale or point. The result realizes actual coordinate
patches with a buffered Euclidean ball and a common inner physical
ball in the supplying gauge. -/
theorem bourUniformHarmonicBalls_of_yamabe
    (hd : Module.finrank ℝ E = 4) {y C K : ℝ} (hy : 0 < y) (hC : 0 ≤ C) (hK : 0 < K)
    {γ : ℝ≥0} (hPeters : BourHarmonicRadiusSupplier (I := I) (M := M) K γ) :
    ∃ (r R L : ℝ) (A : ℝ≥0), 0 < r ∧ 0 < R ∧ 0 < L ∧
      ∀ (g : SmoothRiemannianMetric I M) (s a : ℝ) (ha : 0 < a),
        y ≤ classYamabeFour hd g → (∀ z : M, metricScalarAt g z = s) →
        0 ≤ s → s ≤ C → 1 ≤ a →
        (∀ z : M, Real.sqrt (intrinsicCurvatureSq (scaleMetric a ha g) z) ≤ K) →
        ∀ x : M, ∃ b : BourHarmonicChart (scaleMetric a ha g) x L A γ,
          b.chart.source = Metric.ball (0 : E) (4 * r) ∧
          b.chart.target ⊆ riemannianBallOf (scaleMetric a ha g) x R ∧
          riemannianBallOf (scaleMetric a ha g) x (r / L) ⊆
            b.chart '' Metric.closedBall (0 : E) r := by
  let κ := (y / (4 * (6 * bourCutoffSlope ^ 2 + C))) ^ 2
  have hSlope : 0 < bourCutoffSlope := by
    unfold bourCutoffSlope
    linarith [Analysis.CutoffProfile.derivBound_nonneg]
  have hκ : 0 < κ := sq_pos_of_pos (div_pos hy (by positivity))
  obtain ⟨i₀, hi₀, hInj⟩ :=
    bourUniformInjectivity_of_ballVolume (I := I) (M := M) hd hκ hK
  obtain ⟨R, L, A, hR, hL, hCharts⟩ := hPeters i₀ hi₀
  refine ⟨R / (8 * L), R, L, A, div_pos hR (by positivity), hR, hL, ?_⟩
  intro g s a ha hY hs hs0 hsC ha1 hRm x
  have hVol (z : M) (t : ℝ) (ht : 0 < t) (ht1 : t ≤ 1) :
      κ * t ^ 4 ≤ bourBallVolume (scaleMetric a ha g) z t :=
    bourBallVolume_lower_of_yamabe_scale hd g hy hY hs hs0 hsC ha ha1 z ht ht1
  obtain ⟨c, hc⟩ := hCharts (scaleMetric a ha g) hRm
    (hInj _ hRm hVol) x
  exact c.exists_buffered hR hL hc

end SmoothPoincare
