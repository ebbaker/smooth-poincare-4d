import SmoothPoincare

/-! E50 independent public applications for Edward B. Baker III, 26 November 2026.
OpenAI Codex assistance. Actual serving model and reasoning effort were unavailable. -/

set_option autoImplicit false

open Bundle DifferentialGeometry DifferentialGeometry.Geometry.Connection
  DifferentialGeometry.Geometry.Curvature DifferentialGeometry.Geometry.Operator
  DifferentialGeometry.Integral.DivergenceTheorem DifferentialGeometry.Integral.Measure
  DifferentialGeometry.PDE.RicciFlow
  DifferentialGeometry.Tensor.Coordinates DifferentialGeometry.Tensor0SBundle
  DifferentialGeometry.CheegerGromovCompactness
  Filter FirstOrderTwistor MeasureTheory Metric Set SmoothPoincare SmoothPoincare.Bour
open scoped BigOperators ContDiff InnerProductSpace Manifold NNReal Topology

namespace E50Readback

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "J" => Fin (Module.finrank ℝ E₄)

section Variation

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]

-- The covariant Palatini expression controls the derivative on a chart centered
-- at the actual evaluation point. No chart-domain or connection symmetry axiom is supplied.
example (g : ℝ → SmoothRiemannianMetric I M) {D : RealTimeInterval}
    (hg : MetricFamilySmoothOn (I := I) D g) {t : ℝ} (ht : t ∈ D.regular) (x : M)
    (i k : J) :
    let y := extChartAt I x x
    let C := fun a b c z => deriv (fun s => chartChristoffel (g s) x a b c z) t
    deriv (fun s => metricRicciAt (g s) x
        (vec2 (chartBasisVecFiber x i x) (chartBasisVecFiber x k x))) t =
      ∑ j : J, (bourChartRaisedCovDeriv (g t) x C j i k j y -
        bourChartRaisedCovDeriv (g t) x C k i j j y) := by
  have hx : x ∈ (extChartAt I x).source := by
    rw [extChartAt_source]
    exact mem_chart_source H x
  simpa only [Finset.sum_sub_distrib] using
    (bourMetricRicciAt_chartPalatini_hasDerivAt g hg ht x hx i k).deriv

-- Substitution of the actual scalar derivative into the scalar-square variation
-- retains the inverse-metric contribution at a regular time.
example (g : ℝ → SmoothRiemannianMetric I M) {D : RealTimeInterval}
    (hg : MetricFamilySmoothOn (I := I) D g) {t : ℝ} (ht : t ∈ D.regular) (x : M) :
    let K := bourMetricVelocity g hg ht x
    let P := deriv (fun s => metricRicciAt (g s) x) t
    HasDerivAt (fun s => metricScalarAt (g s) x ^ 2)
      (2 * metricScalarAt (g t) x *
        (metricTracePair0SAt (g t) P - inner0S (g t) x 2 K (metricRicciAt (g t) x))) t := by
  dsimp only
  convert (bourScalar_hasDerivAt_contractions g hg ht x).pow 2 using 1
  ring

-- The trace of the lowered flux at a chart-center basis uses that basis's
-- actual inverse Gram matrix, despite the basis having no orthonormality hypothesis.
example [BoundarylessManifold I M] (g : ℝ → SmoothRiemannianMetric I M)
    {D : RealTimeInterval} (hg : MetricFamilySmoothOn (I := I) D g)
    {t : ℝ} (ht : t ∈ D.regular) (x : M) (v : TangentSpace I x) :
    let K := bourMetricVelocity g hg ht
    let b := coordinateFrameAtToBasis (I := I) x
    let a := fun i j => inverseMetricFlatModelInChartComponent (I := I) (g t) x i j
      (extChartAt I x x)
    (∑ i : J, ∑ j : J, a i j * bourKoszulFlux (g t) K x (Fin.cons (b i) (vec2 v (b j)))) =
      (1 / 2 : ℝ) * differential1FormFun (I := I)
        (fun y => metricTracePair0SAt (g t) (K y)) x (fun _ => v) :=
  bourKoszulFlux_native_trace g hg ht _ _
    (DifferentialGeometry.Tensor.Coordinates.inverseMetricFlatModelInChart_metricInverseInBasis_center
      (g t) x) v

end Variation

section CurvatureAdjoints

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  [BoundarylessManifold I M]

local instance : NeZero (Module.finrank ℝ E₄) := ⟨by simp⟩

-- Use the geometric commutator to check the curvature action on an actual
-- tangent pair when the crossed derivatives have been interchanged.
example (g : SmoothRiemannianMetric I M) {x : M}
    (b : Module.Basis J ℝ (TangentSpace I x))
    (hb : ∀ p q, g.inner x (b p) (b q) = if p = q then 1 else 0)
    (u : TangentSpace I x) :
    let S := metricNabla0S g (metricNabla0S g (metricRicci g)) x
    (∑ p, (S (vec4 (b p) u (b p) u) - S (vec4 u (b p) (b p) u))) +
        hamiltonCurvatureRicciAt g x (vec2 u u) =
      bourRicciSquare g x (vec2 u u) := by
  dsimp only
  rw [bourCrossedRicci_eq_ricciSquare_sub_curvature g b hb]
  ring

-- The second scalar divergence has the expected sign and nonzero
-- coefficient at the endpoint p = 1 of the algebraic family.
example (g : SmoothRiemannianMetric I M) (x : M) :
    covDiv0SField g (covDiv0SField g (bourRicciWeight 1 g)) x Fin.elim0 =
      (1 / 4 : ℝ) * ΔG g ⟨_, metricScalar_smooth g⟩ x := by
  rw [bourRicciWeight_doubleDivergence 1 g x]
  ring

-- In the physical constant-scalar regime the change from p=0 to p=1/2
-- is exactly -R/24 times trace-free Ricci, with the original curvature
-- and Laplacian terms canceling on the same metric and tangent pair.
example (g : SmoothRiemannianMetric I M) (R : ℝ) (hR : ∀ x, metricScalarAt g x = R)
    (x : M) (u v : TangentSpace I x) :
    bourCovariantGradient (1 / 2) g x (vec2 u v) - bourCovariantGradient 0 g x (vec2 u v) =
      -(R / 24) * (metricRicciAt g x (vec2 u v) - (R / 4) * g.inner x u v) := by
  rw [bourCovariantGradient_apply_csc (1 / 2) g R hR x u v,
    bourCovariantGradient_apply_csc 0 g R hR x u v]
  unfold bourBulkDensity
  rw [hR x]
  ring

end CurvatureAdjoints

section ClosedVariation

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  [CompactSpace M] [BoundarylessManifold I M] {o : ManifoldOrientation I M 4}

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

-- An actual time-one variation is regular, preserves the physical Euler
-- integral along the path, and has the slice metric as its native velocity.
example (q : SignedCollarMetric o) :
    let D := RealTimeInterval.closed 0 2 (by norm_num)
    let g := fun s => (bourScalePath q s).metric
    let hG := bourScalePath_metricFamilySmoothOn q D
    let ht : (1 : ℝ) ∈ D.regular := ⟨by norm_num, by norm_num⟩
    (∀ s, bourEuler (bourScalePath q s) = bourEuler q) ∧
      ∀ x, bourMetricVelocity g hG ht x = metricTensorField q.metric x := by
  dsimp only
  exact ⟨bourScalePath_euler_eq q, fun x =>
    (bourMetricVelocity_eq_deriv _ _ _ x).trans (bourScalePath_hasDerivAt q x).deriv⟩

-- At p = 1/2 the scalar-contraction reaction is +7/24, with both
-- moving inverse slots and the volume term in the original measure.
example (q : ℝ → SignedCollarMetric o) (c : ℝ) {D : RealTimeInterval}
    (hg : MetricFamilySmoothOn (I := I) D (fun s => (q s).metric))
    {t : ℝ} (ht : t ∈ D.regular) (hEuler : ∀ s ∈ D.regular, bourEuler (q s) = c) :
    let g := fun s => (q s).metric
    let K := bourMetricVelocity g hg ht
    HasDerivAt (fun s => bourEnergy (1 / 2) (q s))
      (∫ x,
        inner0S (g t) x 2 (bourRicciWeight (1 / 2) (g t) x)
          (deriv (fun s => metricRicciAt (g s) x) t) +
        -inner0S (g t) x 2 (bourRicciSquare (g t) x) (K x) +
        (7 / 24) * metricScalarAt (g t) x * inner0S (g t) x 2 (K x)
          (metricRicciAt (g t) x) +
        (1 / 2) * inner0S (g t) x 2 (K x) (metricTensorField (g t) x) *
          bourBulkDensity (1 / 2) (g t) x ∂riemannianVolumeMeasure I M (g t)) t := by
  dsimp only
  refine (bourEnergy_hasDerivAt_contractions q (1 / 2) c hg ht hEuler).congr_deriv ?_
  dsimp only
  apply integral_congr_ae
  refine ae_of_all _ fun x => ?_
  let g := (q t).metric
  let K := bourMetricVelocity (fun s => (q s).metric) hg ht x
  have hCorrection :
      inner0S g x 2 (bourBulkMetricCorrection (1 / 2) g x) K =
        -inner0S g x 2 (bourRicciSquare g x) K +
        (7 / 24) * metricScalarAt g x * inner0S g x 2 K (metricRicciAt g x) +
        (1 / 2) * inner0S g x 2 K (metricTensorField g x) * bourBulkDensity (1 / 2) g x := by
    change inner0S g x 2 (-bourRicciSquare g x -
      (((1 / 2 : ℝ) - 4) / 12) • (metricScalarAt g x • metricRicci g x) +
       (1 / 2 : ℝ) • (bourBulkDensity (1 / 2) g x • metricTensorField g x)) K = _
    rw [inner0S_add_left, inner0S_sub_left,
      show -bourRicciSquare g x = (-1 : ℝ) • bourRicciSquare g x by simp]
    simp only [inner0S_smul_left, metricRicci_apply]
    rw [inner0S_comm g x 2 (metricRicciAt g x) K, inner0S_comm g x 2 (metricTensorField g x) K]
    ring
  change _ + inner0S g x 2 (bourBulkMetricCorrection (1 / 2) g x) K = _
  rw [hCorrection]
  dsimp only [g, K]
  ring

local instance : NeZero (Module.finrank ℝ E₄) := ⟨by simp⟩

-- The computed symmetric gradient pairs with the unmodified native derivative
-- in the physical metric measure, without a hypothesis for the spatial adjoint.
example (q : ℝ → SignedCollarMetric o) (p c : ℝ) {D : RealTimeInterval}
    (hg : MetricFamilySmoothOn (I := I) D (fun s => (q s).metric))
    {t : ℝ} (ht : t ∈ D.regular) (hEuler : ∀ s ∈ D.regular, bourEuler (q s) = c) :
    HasDerivAt (fun s => bourEnergy p (q s))
      (∫ x, inner0S (q t).metric x 2 (bourCovariantGradient p (q t).metric x)
        (deriv (fun s => metricTensorField (q s).metric x) t)
        ∂riemannianVolumeMeasure I M (q t).metric) t := by
  simpa only [bourClosedTensorPairing, bourMetricVelocity_eq_deriv] using
    originalGradient_pairing q p c hg ht hEuler

-- The actual negative twice-gradient on a full regular unit slab gives
-- constant volume and a dissipation integral equal to half the energy drop.
example (q : ℝ → SignedCollarMetric o) (p c : ℝ) {D : RealTimeInterval}
    (hg : MetricFamilySmoothOn (I := I) D (fun s => (q s).metric))
    (hTime : Icc (0 : ℝ) 1 ⊆ D.regular)
    (hEuler : ∀ s ∈ D.regular, bourEuler (q s) = c)
    (hFlow : ∀ t ∈ Ioo (0 : ℝ) 1, ∀ x,
      deriv (fun s => metricTensorField (q s).metric x) t =
        (-2 : ℝ) • bourCovariantGradient p (q t).metric x) :
    (riemannianVolumeMeasure I M (q 1).metric).real univ =
      (riemannianVolumeMeasure I M (q 0).metric).real univ ∧
    bourEnergy p (q 1) ≤ bourEnergy p (q 0) ∧
    (∫ t in (0 : ℝ)..1, gradientSq (q t).metric (bourCovariantGradient p (q t).metric)) =
      (bourEnergy p (q 0) - bourEnergy p (q 1)) / 2 :=
  originalGradient_regularSlab q p c hg (by norm_num) hTime hEuler hFlow

-- At p = 1/2 the pointwise trace has coefficient -1/8 against the physical
-- signed scalar Laplacian. The only supplied Euler data are local in the
-- chosen conformal paths.
example (q : SignedCollarMetric o)
    (hEuler : ∀ u : C^∞⟮I, M; ℝ⟯, ∀ᶠ t : ℝ in 𝓝 0,
      bourEuler (q.conformal (t • u)) = bourEuler q) (x : M) :
    inner0S q.metric x 2 (bourCovariantGradient (1 / 2) q.metric x) (metricTensorField q.metric x) =
      -(1 / 8 : ℝ) * ΔG q.metric ⟨_, metricScalar_smooth q.metric⟩ x := by
  rw [bourCovariantGradient_trace q (1 / 2) hEuler x]
  ring

-- The fourth-order backward windows of fixed length one have vanishing
-- rescaled dissipation for the explicitly increasing scale n + 1.
example (q : ℝ → SignedCollarMetric o) (c : ℝ) {D : RealTimeInterval}
    (hConnected : D.regular.OrdConnected)
    (hg : MetricFamilySmoothOn (I := I) D (fun s => (q s).metric))
    (hEuler : ∀ s ∈ D.regular, bourEuler (q s) = c)
    (hFlow : ∀ t ∈ D.regular, ∀ x, deriv (fun s => metricTensorField (q s).metric x) t =
      (-2 : ℝ) • bourCovariantGradient (1 / 2) (q t).metric x)
    {a b : ℕ → D.RegularTime} (ha : Tendsto a atTop atTop) (hb : Tendsto b atTop atTop)
    (hWindow : ∀ᶠ n in atTop, (a n : ℝ) = (-1 : ℝ) / ((n : ℝ) + 1)^2 + (b n : ℝ)) :
    Tendsto (fun n : ℕ =>
      ∫ s in (-1 : ℝ)..0,
        let t := s / ((n : ℝ) + 1)^2 + (b n : ℝ)
        gradientSq (scaleMetric ((n : ℝ) + 1) (by positivity) (q t).metric)
          (fun x => ((n : ℝ) + 1)⁻¹ • bourCovariantGradient (1 / 2) (q t).metric x))
      atTop (𝓝 0) :=
  originalGradient_parabolicDissipation_tendsto_terminal q
    (by norm_num : (0 : ℝ) ≤ 1 / 2) (by norm_num)
    hConnected hg hEuler hFlow ha hb (fun n => (n : ℝ) + 1)
    (fun _ => by positivity) (-1) (by norm_num) hWindow

end ClosedVariation

section HarmonicBuffer

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M] [CompactSpace M]

-- Buffer a harmonic coordinate ball at scale four and test its inverse
-- coordinates on the actual smaller ball of the original metric.
example (g : SmoothRiemannianMetric I M) (x : M) {A γ : ℝ≥0} (ha : 0 < (4 : ℝ))
    (h : BourHarmonicChart (scaleMetric 4 ha g) x 2 A γ)
    (hTarget : h.chart.target = riemannianBallOf (scaleMetric 4 ha g) x 1) :
    ∃ b : BourHarmonicChart (scaleMetric 4 ha g) x 2 A γ,
      b.chart.source = ball (0 : E₄) (1 / 4) ∧
      ∀ (l : J) (y : M), y ∈ riemannianBallOf g x (1 / 64) →
        laplacian (LeviCivita g) g
          (fun w => (chartModelBasis E₄).coord l (b.chart.symm w)) y = 0 := by
  obtain ⟨b, hb, -, hc⟩ := h.exists_buffered (by norm_num : (0 : ℝ) < 1)
    (by norm_num : (0 : ℝ) < 2) hTarget
  norm_num at hb hc
  have hc' : riemannianBallOf (scaleMetric 4 ha g) x ((1 / 16 : ℝ) / 2) ⊆
      b.chart '' closedBall (0 : E₄) (1 / 16) := by norm_num; exact hc
  obtain ⟨hCapture, hHarmonic⟩ := b.transport_to_original g ha hc'
  have hsqrt : Real.sqrt (4 : ℝ) = 2 := by norm_num
  rw [hsqrt] at hCapture
  norm_num at hCapture
  refine ⟨b, hb, fun l y hy => hHarmonic l y ?_⟩
  obtain ⟨z, hz, rfl⟩ := hCapture hy
  apply b.chart.map_source'
  rw [hb]
  exact closedBall_subset_ball (by norm_num : (1 : ℝ) / 16 < 1 / 4) hz

-- A single constant controls the physical metric principal trace at the
-- center for all supplied unit-curvature harmonic patches of this size.
example (A γ : ℝ≥0) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ (g : SmoothRiemannianMetric I M) (x : M)
      (b : BourHarmonicChart g x 2 A γ),
      b.chart.source = ball (0 : E₄) 4 →
      (∀ y : M, Real.sqrt (intrinsicCurvatureSq g y) ≤ 1) →
      ∃ G : SmoothRiemannianMetric (𝓘(ℝ, E₄)) E₄, ∀ i k : J,
        |∑ a : J, ∑ c : J, chartInvGramOnE G (0 : E₄) a c 0 *
          partialDeriv a (partialDeriv c (chartGramOnE G (0 : E₄) i k)) 0| ≤ C := by
  obtain ⟨C, hC, hBound⟩ := bourUniformHarmonicMetricTrace_bound (I := I) (M := M)
    (r := 1) (L := 2) (K := 1) (by norm_num) (by norm_num) (by norm_num) A γ
  refine ⟨C, hC, fun g x b hSource hCurv => ?_⟩
  obtain ⟨G, -, h⟩ := hBound g x b (by simpa only [mul_one] using hSource)
    (fun z _ => hCurv (b.chart z))
  exact ⟨G, h 0 (mem_ball_self (by norm_num))⟩

end HarmonicBuffer

section LinkArea

local notation "E₃" => EuclideanSpace ℝ (Fin 3)
local notation "A₃" => Matrix (Fin 3) (Fin 3) ℝ

-- Recover the normalized Hessian shape entries on the genuine Euclidean
-- unit level by discharging both comparison errors for the Euclidean metric.
example (x : E₄) (hx : ‖x‖ = 1) (o : ManifoldOrientation (𝓘(ℝ, E₄)) E₄ 4)
    (frame : OrientedOrthonormalFrameAt euclideanMetric o x) :
    bourLevelShapeMatrix euclideanMetric
      ((2 : ℝ) • (DifferentialGeometry.Geometry.gaussianPotential : E₄ → ℝ)) x o frame = (1 : A₃) := by
  let : NeZero (Module.finrank ℝ E₄) := ⟨by simp⟩
  ext i j
  have h := bourUnitEuclideanLevel_shape_error euclideanMetric x hx o frame
    (ε := 0) (by norm_num) (by norm_num)
    (fun v w => by simp [euclideanMetric_inner])
    (fun v w => by simp [DifferentialGeometry.PDE.DeTurck.connectionDifference_self]) i j
  simpa [abs_eq_zero, sub_eq_zero] using h

-- Reversing the normal changes the cubic and mixed contributions in the
-- computed connection-path integral, including for nonzero curvature.
example (κ : ℝ) : (∫ t in (0 : ℝ)..1, -6 * κ + (-6) * (1 - t ^ 2)) = -4 - 6 * κ := by
  have h := bourEulerBoundaryDensity_eq_integral_connectionPath (-(1 : A₃)) (κ • (1 : A₃))
  have hDensity : bourEulerBoundaryDensity (-(1 : A₃)) (κ • (1 : A₃)) = -4 - 6 * κ := by
    simp [bourEulerBoundaryDensity, Matrix.one_apply, Matrix.det_neg]
    ring
  rw [← hDensity, ← h]
  apply intervalIntegral.integral_congr
  intro t _
  simp [Matrix.one_apply, Matrix.det_neg]
  ring

-- Compare actual link metrics in dimension three with different upper and
-- lower multiplicative factors. Both physical volume bounds enter the result.
example {H L : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₃ H}
    [TopologicalSpace L] [ChartedSpace H L] [IsManifold I ∞ L] [T2Space L]
    [SigmaCompactSpace L] (g h : SmoothRiemannianMetric I L) (z : L)
    (hLow : ∀ v : TangentSpace I z, (9 / 10 : ℝ) * g.inner z v v ≤ h.inner z v v)
    (hHigh : ∀ v : TangentSpace I z, h.inner z v v ≤ (11 / 10 : ℝ) * g.inner z v v) :
    |riemannianVolumeDensity g h z - 1| ≤ 3 / 10 := by
  have hForm (v : TangentSpace I z) :
      |h.inner z v v - g.inner z v v| ≤ (1 / 10 : ℝ) * g.inner z v v :=
    abs_le.mpr ⟨by linarith only [hLow v], by linarith only [hHigh v]⟩
  have hArea := bourLinkAreaDensity_error_of_quadraticComparison g h z (by simp)
    (by norm_num : (0 : ℝ) ≤ 1 / 10) (by norm_num) hForm
  norm_num at hArea
  exact hArea

end LinkArea

section Extraction

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  [CompactSpace M] [Nonempty M]
  {o : ManifoldOrientation I M 4}

-- Compose the physical first closed endpoints with a proper cofinal extraction.
-- The contradiction uses the uniform comparator margin obtained at those endpoints.
example [BoundarylessManifold I M] {P : Type*} [TopologicalSpace P] [PreconnectedSpace P]
    {p m : ℝ} {start : P}
    (f : ℕ → OriginalTrajectory o p start) (q : ℕ → SignedCollarMetric o)
    (comparator returned : SignedCollarMetric o) (ε : ℕ → ℝ)
    (hClosed : ∀ n, BourClosedPhysicalExtraction (f n) (q n))
    (hp : 0 < p) (hp1 : p < 1) (hm : 0 < m)
    (hEuler : ∀ g : SignedCollarMetric o, bourEuler g = 16 * Real.pi ^ 2)
    (hAtt : comparator.energy .plus = sInf (geometricPositiveEnergies o))
    (hGap : bourRicci comparator < 4 * comparator.energy .plus)
    (hNear : ∀ n, bourEnergy p ((f n).slice start) ≤
      sInf (bourRegularizedPositiveValues o p) + ε n)
    (hYComp : 0 < classYamabeFour o.dimension_eq comparator.metric)
    (hPin : ∀ n, bourEnergy p comparator + ε n ≤ (1-p) * (16 * Real.pi ^ 2) - m)
    (hSmall : ∀ n, 4 * ε n ≤ p * (4 * comparator.energy .plus - bourRicci comparator))
    (hY : 0 < classYamabeFour o.dimension_eq returned.metric) :
    ¬ 4 * returned.energy .plus ≤ liminf (fun n : ℕ => bourRicci (q (2 * n + 7))) atTop := by
  let d := (4 * comparator.energy .plus + bourRicci comparator) / 2
  have hd : d < 4 * sInf (geometricPositiveEnergies o) := by
    rw [← hAtt]
    dsimp [d]
    linarith only [hGap]
  have hQ : ∀ᶠ n in atTop, bourRicci (q n) ≤ d :=
    Eventually.of_forall fun n => (bourFirstClosedExtraction_bounds (f n) comparator (q n)
      (hClosed n) hp hp1 hm hEuler hAtt (hNear n) hYComp (hPin n) (hSmall n)).2.1
  exact bourSecondMarkedExtraction_impossible q returned (fun n => 2 * n + 7)
    (by intro a b hab; dsimp; omega) hQ hd hY

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

-- The uniform selector provides an actual least-Ricci comparator and a
-- physical near-minimal start at half its positive parameter cutoff.
example [BoundarylessManifold I M] [ConnectedSpace M]
    (o : ManifoldOrientation I M 4) (BachFlat : SmoothRiemannianMetric I M → Prop)
    (hX : ∃ q : SignedCollarMetric o, 0 < classYamabeFour o.dimension_eq q.metric ∧
      BachFlat q.metric ∧ q.energy .plus = sInf (geometricPositiveEnergies o))
    (hPositive : 0 < sInf (geometricPositiveEnergies o)) {δ : ℝ} (hδ : 0 < δ)
    (hGap : sInf (geometricPositiveEnergies o) ≤ 8 * Real.pi ^ 2 - δ)
    (hNormalize : BourYamabeNormalization o)
    (hBachConformal : ∀ (g : SmoothRiemannianMetric I M) (u : C^∞⟮I, M; ℝ⟯),
      BachFlat g → BachFlat (conformalMetric g u))
    (hCompact : AttainedFirstValueCompactness o BachFlat (sInf (attainedBachValues o BachFlat)))
    (hEuler : ∀ q : SignedCollarMetric o, bourEuler q = 16 * Real.pi ^ 2)
    (hRound : ∀ q : SignedCollarMetric o, classYamabeFour o.dimension_eq q.metric ≤ roundYamabeConstant)
    (hRoundEquality : ∀ q : SignedCollarMetric o,
      classYamabeFour o.dimension_eq q.metric = roundYamabeConstant → q.energy .plus = 0) :
    let Istar := sInf (geometricPositiveEnergies o)
    ∃ q : SignedCollarMetric o, AttainedYamabeAt BachFlat Istar q ∧
      IsLeast (bourRicci '' {g : SignedCollarMetric o | AttainedYamabeAt BachFlat Istar g}) (bourRicci q) ∧
      ∃ p ∈ Ioo (0 : ℝ) 1, ∃ g : SignedCollarMetric o,
        riemannianVolumeMeasure I M g.metric univ = 1 ∧
        ∀ (f : OriginalTrajectory o p (0 : ℝ)), (f.slice 0).metric = g.metric →
          ∀ t, bourRicci (f.slice t) ≤ (4 * Istar + bourRicci q) / 2 := by
  dsimp only
  obtain ⟨q, hq, hLeast, -, p₀, hp₀, m, hm, hStarts⟩ :=
    exists_bourLeastRicci_uniformRegularizedStarts o BachFlat hX hPositive hδ hGap hNormalize
      hBachConformal hCompact hEuler hRound hRoundEquality
  have hp : p₀ / 2 ∈ Ioo (0 : ℝ) p₀ := ⟨half_pos hp₀.1, half_lt_self hp₀.1⟩
  obtain ⟨ε, g, hε, hStart⟩ := hStarts (p₀ / 2) hp
  obtain ⟨-, -, -, -, hVol, -, -, -, hFlow⟩ := hStart 4
  exact ⟨q, hq, hLeast, p₀ / 2, ⟨hp.1, hp.2.trans hp₀.2⟩, g 4, hVol, hFlow⟩

-- A genuine fixed-p limit of the closed near-minimal endpoints attains J_p.
-- Test the additional Yamabe equality on the same returned physical metric.
example [BoundarylessManifold I M] [ConnectedSpace M] {p y r : ℝ}
    (hp : 0 < p) (hp1 : p < 1) (hy : 0 < y)
    (q : ℕ → SignedCollarMetric o) (limit : SignedCollarMetric o)
    (ε : ℕ → ℝ) (hε : Tendsto ε atTop (𝓝 0))
    (hFloor : ∀ n, y ≤ classYamabeFour o.dimension_eq (q n).metric)
    (hNear : ∀ᶠ n in atTop, bourEnergy p (q n) ≤ sInf (bourRegularizedPositiveValues o p) + ε n)
    (hTests : HasJoinedCapTests (fun n => (q (2 * n + 7)).metric) limit.metric)
    (hPlus : Tendsto (fun n => (q (2 * n + 7)).energy .plus) atTop (𝓝 (limit.energy .plus)))
    (hRicci : Tendsto (fun n => bourRicci (q (2 * n + 7))) atTop (𝓝 (bourRicci limit)))
    (rep : UnitYamabeRepresentative limit)
    (hVol : riemannianVolumeMeasure I M limit.metric univ = 1)
    (hScalar : ∀ x, metricScalarAt limit.metric x = r)
    (hEuler : ∀ g : SignedCollarMetric o, bourEuler g = 16 * Real.pi ^ 2) :
    bourEnergy p limit = sInf (bourRegularizedPositiveValues o p) ∧
      r = classYamabeFour o.dimension_eq limit.metric := by
  have hk : StrictMono (fun n : ℕ => 2 * n + 7) := by intro a b hab; dsimp; omega
  obtain ⟨hY, hMin⟩ := bourRegularizedMinimum_of_secondClosed hp.le hp1.le hy
    q limit _ hk ε hε hFloor hNear hTests hPlus hRicci
  exact ⟨hMin, bourRegularizedMinimum_yamabeGauge hp hp1.le limit (hy.trans_le hY)
    rep hMin hVol hScalar hEuler⟩

section PhysicalRescaling

attribute [local instance] PointedRiemannianManifold.topology PointedRiemannianManifold.charted
  PointedRiemannianManifold.smooth PointedRiemannianManifold.t2
  PointedRiemannianManifold.sigmaCompact PointedRiemannianManifold.t2TangentBundle

private local instance (P : PointedRiemannianManifold I) : MeasurableSpace P.M := borel P.M
private local instance (P : PointedRiemannianManifold I) : BorelSpace P.M := ⟨rfl⟩

-- The comparison can use arbitrarily rescaled actual closed endpoints. Its
-- candidate Ricci charge is tested on the pointed metric and the original type.
example (q : ℕ → SignedCollarMetric o) (returned : SignedCollarMetric o)
    (a : ℕ → ℝ) (ha : ∀ n, 0 < a n) (base : ℕ → M)
    {P : PointedRiemannianManifold I}
    (F : PointedRiemannianConvergenceMaps (bourPointedScaledEndpoints q a ha base) P
      (fun n => 2 * n + 7)) (C : MetricConvergenceData F)
    (hCanonical : ∀ n, C.domain n = CanonicalMetricCompactness.canonicalSourceData F n)
    {d : ℝ} (hD : ∀ᶠ n in atTop, bourRicci (q n) ≤ d)
    (hd : d < 4 * sInf (geometricPositiveEnergies o))
    (hY : 0 < classYamabeFour o.dimension_eq returned.metric)
    (hEnd : (∫ x, intrinsicTraceFreeRicciSq P.metric x
      ∂riemannianVolumeMeasure I P.M P.metric) = 4 * returned.energy .plus) : False := by
  have hk : StrictMono (fun n : ℕ => 2 * n + 7) := by intro i j hij; dsimp; omega
  exact bourSecondMarkedExtraction_of_canonicalRescaling_impossible q a ha base hk F C
    hCanonical hD hd returned hY hEnd

end PhysicalRescaling

end Extraction

#print axioms bourMetricRicciAt_chartPalatini_hasDerivAt
#print axioms bourKoszulFlux_chart_eq_gram_mul
#print axioms bourNablaKoszulFlux_chart_eq_gram_mul
#print axioms bourMetricRicciAt_chartKoszul_hasDerivAt
#print axioms bourMetricRicciAt_hasDerivAt
#print axioms bourKoszulFlux_native_trace
#print axioms bourKoszulTraceForm_native
#print axioms bourInverseMetric_hasDerivAt
#print axioms bourScalar_hasDerivAt_contractions
#print axioms bourRicciNormSq_hasDerivAt_slots
#print axioms bourEnergy_hasDerivAt_contractions
#print axioms bourScalePath_metricFamilySmoothOn
#print axioms bourConformalPath_metricFamilySmoothOn
#print axioms bourScalePath_metric_one
#print axioms bourScalePath_euler_eq
#print axioms originalGradient_pairing
#print axioms bourCovariantGradient_integral_trace
#print axioms originalGradient_regularSlab
#print axioms bourCovariantGradient_trace
#print axioms originalGradient_parabolicDissipation_tendsto_terminal
#print axioms bourCrossedRicci_eq_ricciSquare_sub_curvature
#print axioms bourRicciWeight_doubleDivergence
#print axioms bourCovariantGradient_apply_csc
#print axioms BourHarmonicChart.exists_buffered
#print axioms BourHarmonicChart.transport_to_original
#print axioms BourHarmonicChart.exists_model_metric
#print axioms bourUniformHarmonicBalls_of_yamabe
#print axioms bourUniformHarmonicMetricTrace_bound
#print axioms bourLevelShapeMatrix_error_of_metricComparison
#print axioms bourLinkAreaDensity_error_of_quadraticComparison
#print axioms bourUnitEuclideanLevel_shape_error
#print axioms bourTangentialCurvatureMatrix_le_of_intrinsicCurvatureSq
#print axioms bourImmersedLinkAreaDensity_error
#print axioms bourImmersedLinkEulerIntegral_error
#print axioms bourEulerBoundaryDensity_eq_integral_connectionPath
#print axioms bourExactComparator_ricciGap
#print axioms exists_bourRegularizedYamabeStart
#print axioms exists_bourLeastRicci_uniformRegularizedStarts
#print axioms bourFirstMarkedExtraction_impossible
#print axioms bourFirstClosedExtraction_bounds
#print axioms bourSecondMarkedExtraction_impossible
#print axioms bourSecondMarkedExtraction_of_canonicalRescaling_impossible
#print axioms bourRegularizedMinimum_of_secondClosed
#print axioms bourRegularizedMinimum_yamabeGauge
#print axioms bourRegularizedMinimum_ricci_and_weyl_excess
#print axioms bourRegularizedMinima_limit_leastRicci

end E50Readback
