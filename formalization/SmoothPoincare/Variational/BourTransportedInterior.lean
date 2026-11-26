import SmoothPoincare.Variational.BourHarmonicBalls
import SmoothPoincare.Variational.BourStationaryInterior
import DifferentialGeometry.Geometry.Metric.Comparison.PartialDiffeomorphBallCapture
import DifferentialGeometry.Geometry.Measure.Area.ManifoldEuclidean
import DifferentialGeometry.Geometry.Operator.Scaling
import DifferentialGeometry.Geometry.Metric.Pullback.PartialDiffeomorph.CompactExtension
import DifferentialGeometry.Geometry.Operator.Laplacian.Pullback
import DifferentialGeometry.Geometry.Metric.Convergence.Coordinates.InverseGram
import DifferentialGeometry.Geometry.Curvature.Bounds.RiemannTensorOperator
import DifferentialGeometry.Geometry.Curvature.RicciRestriction

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
open DifferentialGeometry.Geometry.Riemannian
open DifferentialGeometry.Geometry.Operator DifferentialGeometry.Tensor.Coordinates
open FirstOrderTwistor Manifold Set
open scoped BigOperators
open scoped ContDiff Manifold NNReal Topology

namespace SmoothPoincare

variable {E H M : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
  [FiniteDimensional ℝ E] [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]

private local instance : CompleteSpace E := FiniteDimensional.complete ℝ E

local notation "J" => Fin (Module.finrank ℝ E)
local notation "ι" => 𝓘(ℝ, E)

/-- Coefficients of the actual physical metric in the inverse coordinate patch. -/
def bourHarmonicPullbackEntry (g : SmoothRiemannianMetric I M)
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
    ‖fderiv ℝ (bourHarmonicPullbackEntry g chart i k) z‖ ≤ (A : ℝ)
  first_jet_holder : ∀ i k : J,
    HolderOnWith A γ (fderiv ℝ (bourHarmonicPullbackEntry g chart i k)) chart.source

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

omit [FiniteDimensional ℝ E] [IsManifold I ∞ M] [T2Space M] in
private theorem derivative_chart_inverse
    {E' H' N : Type*} [NormedAddCommGroup E'] [NormedSpace ℝ E']
    [TopologicalSpace H'] {I' : ModelWithCorners ℝ E' H'}
    [TopologicalSpace N] [ChartedSpace H' N]
    (F : PartialDiffeomorph I' I N M ∞)
    {y : M} (hy : y ∈ F.target) (v : TangentSpace I y) :
    mfderiv I' I (F : N → M) (F.symm y) (mfderiv I I' (F.symm : M → N) y v) =
      v := by
  have h₁ : MDifferentiableAt I' I (F : N → M) (F.symm y) :=
    (F.contMDiffOn_toFun.contMDiffAt
      (F.open_source.mem_nhds (F.map_target' hy))).mdifferentiableAt (by simp)
  have h₂ : MDifferentiableAt I I' (F.symm : M → N) y := (F.symm.contMDiffOn_toFun.contMDiffAt
    (F.open_target.mem_nhds hy)).mdifferentiableAt (by simp)
  have hEq : (F : N → M) ∘ (F.symm : M → N) =ᶠ[𝓝 y] id :=
    Filter.eventuallyEq_iff_exists_mem.mpr
      ⟨F.target, F.open_target.mem_nhds hy, fun _ hz => F.right_inv' hz⟩
  have hComp := mfderiv_comp_apply y h₁ h₂ v
  rw [hEq.mfderiv_eq, mfderiv_id] at hComp
  exact hComp.symm

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
    exact (congrArg (h.chart.symm : M → E) h.center_eq.symm).trans
      (h.chart.left_inv' h.center_mem)
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
    have hPoint : h.chart (h.chart.symm y) = y := h.chart.right_inv' hyTarget
    have hDiff : (mfderiv ι I (h.chart : E → M) (h.chart.symm y) w : E) = (v : E) :=
      derivative_chart_inverse h.chart hyTarget v
    have hInner : g.inner (h.chart (h.chart.symm y))
        (mfderiv ι I (h.chart : E → M) (h.chart.symm y) w)
        (mfderiv ι I (h.chart : E → M) (h.chart.symm y) w) = g.inner y v v :=
      congrArg₂ (fun (p : M) (u : E) => g.inner p u u) hPoint hDiff
    let u : E := w
    change g.inner y v v ≤ L ^ 2 * inner ℝ u u
    rw [real_inner_self_eq_norm_sq, ← hInner]
    exact hUpper
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
    have hmul := mul_le_mul_of_nonneg_left hlower (sq_nonneg L)
    rw [← mul_assoc, ← mul_pow, mul_inv_cancel₀ hL.ne', one_pow, one_mul] at hmul
    change inner ℝ v v ≤ L ^ 2 *
      g.inner (F z) (mfderiv ι I (F : E → M) z v) (mfderiv ι I (F : E → M) z v)
    rw [real_inner_self_eq_norm_sq]
    exact hmul
  have hcap := hForward hForwardQuad
  rwa [show F 0 = x from h.center_eq, euclidean_closedBall _ hr.le] at hcap


variable [I.Boundaryless]

omit [T2Space M] [I.Boundaryless] in
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

omit [T2Space M] [I.Boundaryless] in
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
    rw [hRadius] at hScale
    exact hScale ▸ hCapture
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


omit [CompactSpace M] [ConnectedSpace M] [Nonempty M]
    [NeZero (Module.finrank ℝ E)] in
/-- On the same interior coordinate ball, extend the physical metric to the
model space to use its fixed coordinate chart. The extension agrees with
the given pullback metric there, and every model coordinate is harmonic there. -/
theorem BourHarmonicChart.exists_model_metric
    {g : SmoothRiemannianMetric I M} {x : M} {L r : ℝ} {A γ : ℝ≥0}
    (b : BourHarmonicChart g x L A γ) (hr : 0 < r)
    (hSource : b.chart.source = Metric.ball (0 : E) (4 * r)) :
    ∃ G : SmoothRiemannianMetric ι E,
      (∀ z ∈ Metric.ball (0 : E) (3 * r), ∀ v w : E,
        G.inner z v w = g.inner (b.chart z)
          (mfderiv ι I (b.chart : E → M) z v) (mfderiv ι I (b.chart : E → M) z w)) ∧
      ∀ z ∈ Metric.ball (0 : E) (3 * r), ∀ l : J,
        laplacian (LeviCivita G) G (bourChartCoordinate (I := ι) (0 : E) l) z = 0 := by
  let K := Metric.closedBall (0 : E) (3 * r)
  have hKs : K ⊆ b.chart.source := by
    rw [hSource]
    exact Metric.closedBall_subset_ball (by linarith)
  have hCompact : IsCompact (b.chart '' K) :=
    (isCompact_closedBall _ _).image_of_continuousOn
      (b.chart.contMDiffOn_toFun.continuousOn.mono hKs)
  have hTarget : b.chart '' K ⊆ b.chart.symm.source := by
    rintro y ⟨z, hz, rfl⟩
    exact b.chart.map_source' (hKs hz)
  obtain ⟨G, U, hKU, hUS, hMetric, _⟩ :=
    b.chart.symm.exists_metric_preserving_on_neighborhood_of_is_compact
      g (standardEuclideanMetric E) hCompact hTarget
  refine ⟨G, ?_, ?_⟩
  · intro z hz v w
    have hzs := hKs (Metric.ball_subset_closedBall hz)
    have hzU := hKU (mem_image_of_mem _ (Metric.ball_subset_closedBall hz))
    have hLeft : b.chart.symm (b.chart z) = z := b.chart.left_inv' hzs
    let d := mfderiv ι I (b.chart : E → M) z
    have hV (u : E) : (mfderiv I ι (b.chart.symm : M → E) (b.chart z) (d u) : E) = u :=
      derivative_chart_inverse b.chart.symm hzs u
    have hh := hMetric (b.chart z) hzU (d v) (d w)
    let e : E →L[ℝ] E := mfderiv I ι (b.chart.symm : M → E) (b.chart z)
    have hPair : (e (d v), e (d w)) = (v, w) := Prod.ext (hV v) (hV w)
    have htr := congrArg₂ (fun (p : E) (q : E × E) => G.inner p q.1 q.2) hLeft hPair
    exact htr.symm.trans hh.symm
  · intro z hz l
    have hzs := hKs (Metric.ball_subset_closedBall hz)
    have hzU := hKU (mem_image_of_mem _ (Metric.ball_subset_closedBall hz))
    have hLeft : b.chart.symm (b.chart z) = z := b.chart.left_inv' hzs
    let c := ((chartModelBasis E).coord l).toContinuousLinearMap
    have hCoord : bourChartCoordinate (I := ι) (0 : E) l = (c : E → ℝ) := by
      funext p
      unfold bourChartCoordinate
      rw [extChartAt_model_space_eq_id]
      rfl
    have hLocal : ∀ᶠ y in 𝓝 (b.chart z), ∀ v w : TangentSpace I y,
        g.inner y v w = G.inner (b.chart.symm y)
          (mfderiv I ι (b.chart.symm : M → E) y v)
          (mfderiv I ι (b.chart.symm : M → E) y w) := by
      filter_upwards [U.isOpen.mem_nhds hzU] with y hy
      exact hMetric y hy
    have hc : ContMDiff ι 𝓘(ℝ, ℝ) 2 c := c.contDiff.contMDiff
    have hEq := laplacian_eq_of_partialDiffeomorph_inner g G b.chart.symm
      (hUS hzU) hLocal (f := c) hc.contMDiffAt
    rw [hCoord, ← hLeft, ← hEq]
    exact b.harmonic l (b.chart z) (b.chart.map_source' hzs)


omit [I.Boundaryless] [CompactSpace M] [ConnectedSpace M] [Nonempty M]
    [NeZero (Module.finrank ℝ E)] in
private theorem model_chartGram_eq (G : SmoothRiemannianMetric ι E) (p z : E) (i k : J) :
    chartGramOnE G p i k z = G.inner z (chartModelBasis E i) (chartModelBasis E k) := by
  simp only [chartGramOnE_def, extChartAt_model_space_eq_id, PartialEquiv.refl_symm,
    PartialEquiv.refl_coe, id_eq, chartGramMatrix_apply, chartBasisVecFiber,
    TangentBundle.symmL_model_space]
  rfl

omit [I.Boundaryless] [CompactSpace M] [ConnectedSpace M] [Nonempty M]
    [NeZero (Module.finrank ℝ E)] in
private theorem model_chartInvGram_anchor (G : SmoothRiemannianMetric ι E) (p q z : E) (i k : J) :
    chartInvGramOnE G p i k z = chartInvGramOnE G q i k z := by
  have hg : chartGramMatrix G p z = chartGramMatrix G q z := by
    ext j l
    simpa only [chartGramOnE_def, extChartAt_model_space_eq_id, PartialEquiv.refl_symm,
      PartialEquiv.refl_coe, id_eq] using
      (model_chartGram_eq G p z j l).trans (model_chartGram_eq G q z j l).symm
  simp only [chartInvGramOnE_def, extChartAt_model_space_eq_id, PartialEquiv.refl_symm,
    PartialEquiv.refl_coe, id_eq, chartInvGramMatrix, hg]

omit [CompactSpace M] [ConnectedSpace M] [Nonempty M]
    [NeZero (Module.finrank ℝ E)] in
private theorem model_ricci_pullback
    (G : SmoothRiemannianMetric ι E) (g : SmoothRiemannianMetric I M)
    (F : PartialDiffeomorph ι I E M ∞) (U : TopologicalSpace.Opens E)
    (hU : (U : Set E) ⊆ F.source)
    (hmet : ∀ z ∈ U, ∀ v w : E, G.inner z v w = g.inner (F z)
      (mfderiv ι I (F : E → M) z v) (mfderiv ι I (F : E → M) z w))
    (z : U) (v w : E) :
    ricciTensor G z.val v w = ricciTensor g (F z.val)
      (mfderiv ι I (F : E → M) z.val v) (mfderiv ι I (F : E → M) z.val w) := by
  let : IsManifold I 1 M := IsManifold.of_le (n := ∞) (by decide)
  let V : TopologicalSpace.Opens M := ⟨F '' (U : Set E), image_opens_isOpen F hU⟩
  let Φ : U ≃ₘ⟮ι, I⟯ V := DifferentialGeometry.PartialDiffeomorph.toOpensDiffeo F hU
  have hMetric : G.restrictOpen U = Diffeomorph.pullbackMetricCross (g.restrictOpen V) Φ := by
    apply SmoothRiemannianMetric.ext_inner
    intro y a b
    rw [Diffeomorph.pullbackMetricCross_inner, SmoothRiemannianMetric.restrictOpen_inner]
    rw [DifferentialGeometry.PartialDiffeomorph.mfderiv_toOpensDiffeo F hU y a,
      DifferentialGeometry.PartialDiffeomorph.mfderiv_toOpensDiffeo F hU y b]
    exact hmet y.val y.property a b
  let vU : TangentSpace ι z := v
  let wU : TangentSpace ι z := w
  have hric := DifferentialGeometry.Geometry.Curvature.ricciTensor_restrictOpen G U z vU wU
  rw [mfderiv_subtype_val (I := ι) U z, hMetric,
    Diffeomorph.pullbackMetricCross_eq_localPullMetric] at hric
  have hLocal := ricciTensor_localPull (g.restrictOpen V)
    (Φ : U → V) Φ.isLocalDiffeomorph z vU wU
  let dv := mfderiv ι I Φ z vU
  let dw := mfderiv ι I Φ z wU
  have hRest := DifferentialGeometry.Geometry.Curvature.ricciTensor_restrictOpen
    (I := I) g V (Φ z) dv dw
  rw [mfderiv_subtype_val (I := I) V (Φ z)] at hRest
  have hEnd : ricciTensor g (F z.val) dv dw = ricciTensor g (F z.val)
      (mfderiv ι I (F : E → M) z.val v) (mfderiv ι I (F : E → M) z.val w) := by
    dsimp only [dv, dw]
    rw [DifferentialGeometry.PartialDiffeomorph.mfderiv_toOpensDiffeo F hU z vU,
      DifferentialGeometry.PartialDiffeomorph.mfderiv_toOpensDiffeo F hU z wU]
  exact hric.symm.trans (hLocal.trans (hRest.trans hEnd))

omit [CompactSpace M] [ConnectedSpace M] [Nonempty M]
    [NeZero (Module.finrank ℝ E)] in
private theorem ricci_abs_le_orderedCurvature
    (g : SmoothRiemannianMetric I M) (x : M) {K : ℝ}
    (hK : Real.sqrt (intrinsicCurvatureSq g x) ≤ K) (v w : TangentSpace I x) :
    |ricciTensor g x v w| ≤ (Module.finrank ℝ E : ℝ) * K *
      Real.sqrt (g.inner x v v) * Real.sqrt (g.inner x w w) := by
  classical
  obtain ⟨basis, hON⟩ := Tensor0SBundle.exists_orthonormal_basis (I := I) g x
  let B : J → TangentSpace I x := basis
  have hB (i j : J) : g.inner x (B i) (B j) = if i = j then (1 : ℝ) else 0 :=
    hON i j
  have hTerm (i : J) :
      |g.inner x (riemannOp (LeviCivita g) x (B i) v w) (B i)| ≤
        K * Real.sqrt (g.inner x v v) * Real.sqrt (g.inner x w w) := by
    have hUnit : g.inner x (B i) (B i) = 1 := by simp [hB]
    have hNorm := sqrt_inner_riemannOp_le g x (B i) v w
    rw [hUnit, Real.sqrt_one, mul_one] at hNorm
    calc
      _ ≤ Real.sqrt (g.inner x (riemannOp (LeviCivita g) x (B i) v w)
              (riemannOp (LeviCivita g) x (B i) v w)) := by
        simpa only [hUnit, Real.sqrt_one, mul_one] using
          (SmoothRiemannianMetric.abs_metric_inner_le_sqrt_metric_quadratic g x
            (riemannOp (LeviCivita g) x (B i) v w) (B i))
      _ ≤ _ := hNorm.trans <|
        mul_le_mul_of_nonneg_right
          (mul_le_mul_of_nonneg_right hK (Real.sqrt_nonneg _)) (Real.sqrt_nonneg _)
  rw [ricciTensor_eq_orthonormal_trace (I := I) g x v w B hB]
  calc
    _ ≤ ∑ i : J, |g.inner x (riemannOp (LeviCivita g) x (B i) v w) (B i)| :=
      Finset.abs_sum_le_sum_abs _ _
    _ ≤ ∑ _ : J, K * Real.sqrt (g.inner x v v) * Real.sqrt (g.inner x w w) :=
      Finset.sum_le_sum (fun i _ => hTerm i)
    _ = _ := by rw [Finset.sum_const, Finset.card_univ, Fintype.card_fin, nsmul_eq_mul]; ring


omit [CompactSpace M] [ConnectedSpace M] [Nonempty M] [NeZero (Module.finrank ℝ E)] in
/-- The physical ordered curvature ceiling and the uniform first jet of the
harmonic chart bound the principal forcing of the metric on the common
model ball. The constant precedes the choice of physical metric and patch. -/
theorem bourUniformHarmonicMetricTrace_bound
    {r L K : ℝ} (hr : 0 < r) (hL : 0 < L) (hK : 0 ≤ K) (A γ : ℝ≥0) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ (g : SmoothRiemannianMetric I M) (x : M)
      (b : BourHarmonicChart g x L A γ),
      b.chart.source = Metric.ball (0 : E) (4 * r) →
      (∀ z ∈ Metric.ball (0 : E) (3 * r), Real.sqrt (intrinsicCurvatureSq g (b.chart z)) ≤ K) →
      ∃ G : SmoothRiemannianMetric ι E,
        (∀ z ∈ Metric.ball (0 : E) (3 * r), ∀ v w : E,
          G.inner z v w = g.inner (b.chart z)
            (mfderiv ι I (b.chart : E → M) z v) (mfderiv ι I (b.chart : E → M) z w)) ∧
        ∀ z ∈ Metric.ball (0 : E) (3 * r), ∀ i k : J,
          |∑ a : J, ∑ c : J, chartInvGramOnE G (0 : E) a c z *
            partialDeriv a (partialDeriv c (chartGramOnE G (0 : E) i k)) z| ≤ C := by
  let n : ℝ := Module.finrank ℝ E
  have hn : 0 ≤ n := Nat.cast_nonneg _
  let B : ℝ := ∑ i : J, ‖chartModelBasis E i‖
  have hB : 0 ≤ B := Finset.sum_nonneg fun _ _ => norm_nonneg _
  have hBasis (i : J) : ‖chartModelBasis E i‖ ≤ B :=
    Finset.single_le_sum (fun j _ => norm_nonneg (chartModelBasis E j)) (Finset.mem_univ i)
  let V := Metric.closedBall (0 : E) (3 * r)
  have hBase : V ⊆ (trivializationAt E (TangentSpace ι) (0 : E)).baseSet := by
    rw [trivializationAt_baseSet_eq_chartAt_source]
    simp
  obtain ⟨D, hD, hInv⟩ := exists_abs_chartInvGramMatrix_le_of_lower_bound
    (standardEuclideanMetric E) 0 (isCompact_closedBall _ _) hBase (L⁻¹ ^ 2) (by positivity)
  let C := 2 * (n * K * (L * B) * (L * B)) + 18 * n ^ 4 * D ^ 2 * ((A : ℝ) * B) ^ 2
  refine ⟨C, by dsimp [C, n]; positivity, ?_⟩
  intro g x b hSource hRm
  obtain ⟨G, hPull, hHarm⟩ := b.exists_model_metric hr hSource
  refine ⟨G, hPull, ?_⟩
  let U : TopologicalSpace.Opens E := ⟨Metric.ball (0 : E) (3 * r), Metric.isOpen_ball⟩
  have hU : (U : Set E) ⊆ b.chart.source := by
    rw [hSource]
    exact Metric.ball_subset_ball (by linarith)
  intro z hz i k
  have hzSource := hU hz
  have hy : z ∈ interior (extChartAt ι z).target := by simp
  have hNeighborhood (l : J) : ∀ᶠ w in 𝓝 z,
      laplacian (LeviCivita G) G (bourChartCoordinate (I := ι) z l)
        ((extChartAt ι z).symm w) = 0 := by
    filter_upwards [Metric.isOpen_ball.mem_nhds hz] with w hw
    have hCoordinate : bourChartCoordinate (I := ι) z l =
        bourChartCoordinate (I := ι) (0 : E) l := by
      funext p
      unfold bourChartCoordinate
      rw [extChartAt_model_space_eq_id, extChartAt_model_space_eq_id]
    rw [hCoordinate]
    exact hHarm w hw l
  have hGlo (v : E) : L⁻¹ ^ 2 * (standardEuclideanMetric E).inner z v v ≤ G.inner z v v := by
    rw [hPull z hz v v]
    change L⁻¹ ^ 2 * inner ℝ v v ≤ _
    rw [real_inner_self_eq_norm_sq]
    exact (b.metric_bounds z hzSource v).1
  have hInv' (a c : J) : |chartInvGramOnE G z a c z| ≤ D := by
    rw [model_chartInvGram_anchor G z 0 z a c, chartInvGramOnE_def,
      extChartAt_model_space_eq_id, PartialEquiv.refl_symm, PartialEquiv.refl_coe, id_eq]
    exact hInv z (Metric.ball_subset_closedBall hz) G hGlo a c
  have hGrad (m a c : J) : |partialDeriv m (chartGramOnE G z a c) z| ≤ (A : ℝ) * B := by
    have heq : chartGramOnE G z a c =ᶠ[𝓝 z] bourHarmonicPullbackEntry g b.chart a c := by
      filter_upwards [Metric.isOpen_ball.mem_nhds hz] with w hw
      rw [model_chartGram_eq]
      exact hPull w hw _ _
    unfold partialDeriv
    rw [heq.fderiv_eq, ← Real.norm_eq_abs]
    exact ((fderiv ℝ (bourHarmonicPullbackEntry g b.chart a c) z).le_opNorm _).trans
      (mul_le_mul (b.first_jet_bound a c z hzSource) (hBasis m) (norm_nonneg _) A.2)
  let W (l : J) := mfderiv ι I (b.chart : E → M) z (chartModelBasis E l)
  have hW (l : J) : Real.sqrt (g.inner (b.chart z) (W l) (W l)) ≤ L * B := by
    have hUpper := (b.metric_bounds z hzSource (chartModelBasis E l)).2
    change g.inner (b.chart z) (W l) (W l) ≤
      L ^ 2 * ‖chartModelBasis E l‖ ^ 2 at hUpper
    calc
      _ ≤ Real.sqrt (L ^ 2 * ‖chartModelBasis E l‖ ^ 2) := Real.sqrt_le_sqrt hUpper
      _ = L * ‖chartModelBasis E l‖ := by
        rw [Real.sqrt_mul (sq_nonneg L), Real.sqrt_sq hL.le, Real.sqrt_sq (norm_nonneg _)]
      _ ≤ _ := mul_le_mul_of_nonneg_left (hBasis l) hL.le
  have hRic : chartRicciTensor G z i k z = ricciTensor g (b.chart z) (W i) (W k) := by
    have hChart := ricciFun_basis_apply G z i k
    rw [ricciFun_eq_ricciTensor_of_basis_identity G z (chartRiemannBasisIdentity_holds G z),
      extChartAt_model_space_eq_id, PartialEquiv.refl_coe, id_eq,
      ← chartBasisVecFiber_self (I := ι) z i, ← chartBasisVecFiber_self (I := ι) z k] at hChart
    simp only [chartBasisVecFiber, TangentBundle.symmL_model_space] at hChart
    exact hChart.symm.trans (model_ricci_pullback G g b.chart U hU hPull ⟨z, hz⟩
      (chartModelBasis E i) (chartModelBasis E k))
  have hRicBound : |chartRicciTensor G z i k z| ≤ n * K * (L * B) * (L * B) := by
    rw [hRic]
    exact (ricci_abs_le_orderedCurvature g (b.chart z) (hRm z hz) (W i) (W k)).trans
      (mul_le_mul (mul_le_mul_of_nonneg_left (hW i) (mul_nonneg hn hK))
        (hW k) (Real.sqrt_nonneg _)
        (mul_nonneg (mul_nonneg hn hK) (mul_nonneg hL.le hB)))
  have hEstimate := bourChartHarmonicRicci_trace_bound G z hy
    (bourChartLoweredHarmonicGauge_eventually_zero_of_laplacian G z hy hNeighborhood)
    hD (mul_nonneg A.2 hB) hInv' hGrad i k hRicBound
  have hGramAnchor (a c : J) : chartGramOnE G z a c = chartGramOnE G (0 : E) a c :=
    funext fun w => (model_chartGram_eq G z w a c).trans (model_chartGram_eq G 0 w a c).symm
  simp only [hGramAnchor, model_chartInvGram_anchor G z 0] at hEstimate
  exact hEstimate

end SmoothPoincare
