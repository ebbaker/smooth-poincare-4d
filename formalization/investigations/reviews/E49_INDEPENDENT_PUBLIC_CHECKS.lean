import SmoothPoincare

/-! E49 applications for Edward B. Baker III, 26 November 2026.
OpenAI Codex assistance. Actual serving model and reasoning effort were unavailable. -/

set_option autoImplicit false

open Bundle DifferentialGeometry DifferentialGeometry.Geometry.Curvature
open DifferentialGeometry.Integral.Measure Filter FirstOrderTwistor MeasureTheory Metric Set
open scoped BigOperators ContDiff ENNReal Manifold Topology

namespace E49Readback

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "I₄" => 𝓘(ℝ, E₄)

section SpatialAdjoints

open DifferentialGeometry.Analysis.Elliptic DifferentialGeometry.Geometry.Connection
  DifferentialGeometry.Geometry.Operator DifferentialGeometry.Tensor0SBundle
  DifferentialGeometry.Tensor.RSTensor SmoothPoincare.Bour

variable {H M : Type*} [TopologicalSpace H]
  {I : ModelWithCorners ℝ E₄ H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  [CompactSpace M] [BoundarylessManifold I M]

local instance : NeZero (Module.finrank ℝ E₄) := ⟨by simp⟩

-- The first adjoint on the 3-slot flux takes its sign in the physical metric pairing.
example (g : SmoothRiemannianMetric I M)
    (A : Tensor0SField (I := I) (M := M) ∞ 2)
    (V : Tensor0SField (I := I) (M := M) ∞ 3) :
    bourClosedTensorPairing g (covDiv0SField g V) A =
      -bourClosedTensorPairing g (metricNabla0S g A) V :=
  bourRicciDivergence_adjoint g A V

-- Moving the two rough derivatives preserves the coefficient of the Ricci term.
example (g : SmoothRiemannianMetric I M)
    (A K : Tensor0SField (I := I) (M := M) ∞ 2) :
    -(1 / 2 : ℝ) * bourClosedTensorPairing g (roughLap0SField g K) A =
      -(1 / 2 : ℝ) * bourClosedTensorPairing g (roughLap0SField g A) K := by
  rw [bourRicciRough_adjoint g A K]

-- Swapping derivative and tensor slots uses the same transposition in the second adjoint.
example (g : SmoothRiemannianMetric I M)
    (K : Tensor0SField (I := I) (M := M) ∞ 2) (α : ℝ) :
    let e := Equiv.swap (0 : Fin 3) 1
    bourClosedTensorPairing g
        (covDiv0SField g (Tensor0SField.domDomCongr ∞ e (metricNabla0S g K))) (bourRicciWeight α g) =
      bourClosedTensorPairing g
        (covDiv0SField g
          (Tensor0SField.domDomCongr ∞ e (metricNabla0S g (bourRicciWeight α g)))) K := by
  simpa using bourRicciCrossed_adjoint g (Equiv.swap (0 : Fin 3) 1) (bourRicciWeight α g) K

-- The integrated pairing includes the −1/2 Ricci coefficient and physical density weight.
example (g : SmoothRiemannianMetric I M)
    (K : Tensor0SField (I := I) (M := M) ∞ 2) :
    bourClosedTensorPairing g ((-(1 / 2) : ℝ) • roughLap0SField g K) (bourRicciWeight 0 g) =
      bourClosedTensorPairing g ((-(1 / 2) : ℝ) • roughLap0SField g (bourRicciWeight 0 g)) K :=
  bourWeightedRicciRough_adjoint 0 g K

end SpatialAdjoints

#print axioms SmoothPoincare.Bour.bourRicciDivergence_adjoint
#print axioms SmoothPoincare.Bour.bourRicciRough_adjoint
#print axioms SmoothPoincare.Bour.bourRicciCrossed_adjoint
#print axioms SmoothPoincare.Bour.bourWeightedRicciRough_adjoint

section StationaryInterior

open DifferentialGeometry.Geometry.Connection DifferentialGeometry.Geometry.Operator
  DifferentialGeometry.Tensor.Coordinates SmoothPoincare

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]

local notation "J" => Fin (Module.finrank ℝ E₄)
local notation "∂" => DifferentialGeometry.Tensor.Coordinates.partialDeriv

-- In dimension four the actual Levi–Civita first derivative is bounded by 96 A²L² + 6 AD.
example (g : SmoothRiemannianMetric I M) (p : M)
    {y : E₄} (hy : y ∈ interior (extChartAt I p).target)
    {A L D : ℝ} (hA : 0 ≤ A) (hL : 0 ≤ L)
    (hInv : ∀ a b : J, |chartInvGramOnE g p a b y| ≤ A)
    (hGrad : ∀ m a b : J, |∂ m (chartGramOnE g p a b) y| ≤ L)
    (hHess : ∀ m l a b : J, |∂ m (∂ l (chartGramOnE g p a b)) y| ≤ D)
    (m i j k : J) :
    |∂ m (chartChristoffel g p i j k) y| ≤ 96 * A ^ 2 * L ^ 2 + 6 * A * D := by
  have hh := bourChartConnectionDerivative_bound g p hy hA hL hInv hGrad hHess m i j k
  have hd : Module.finrank ℝ E₄ = 4 := by simp
  convert hh using 1
  rw [hd]
  push_cast
  ring

-- Canceled connection trace on a supplied harmonic chart with the actual pointwise Laplacian.
example (g : SmoothRiemannianMetric I M) (p : M)
    {x : M} (hx : x ∈ chartLeviCivitaGoodSet (I := I) p)
    (hHarm : ∀ l : J, laplacian (I := I) (LeviCivita (I := I) g) g
      (bourChartCoordinate (I := I) p l) x = 0) :
    (∑ a : J, ∑ b : J, chartInvGramMatrix (I := I) g p x a b •
      (LeviCivita (I := I) g).toFun (chartBasisVecFiber (I := I) p b) x
        (chartBasisVecFiber (I := I) p a x)) = 0 :=
  bourChartConnection_trace_eq_zero g p hx hHarm

end StationaryInterior

#print axioms SmoothPoincare.bourChartConnectionDerivative_bound
#print axioms SmoothPoincare.bourChartConnection_trace_eq_zero

section ALEBoundary

open SmoothPoincare

local notation "A₃" => Matrix (Fin 3) (Fin 3) ℝ
local notation "S₃" => sphere (0 : E₄) 1

-- In a unit-shape frame constant curvature κ contributes 6κ to the density.
example (κ : ℝ) : bourEulerBoundaryDensity (1 : A₃) (κ • (1 : A₃)) = 4 + 6 * κ := by
  simp [bourEulerBoundaryDensity, Fin.sum_univ_three, Matrix.one_apply]
  ring

-- An actual map from the round sphere with degree three gives the correct scale.
example {L : Type*} [MeasurableSpace L] (μ : Measure L) [IsFiniteMeasure μ]
    (q : S₃ → L) (hq : Measurable q)
    (hCover : Measure.map q ((volume : Measure E₄).toSphere) = (3 : ℝ≥0∞) • μ) :
    4 * μ.real univ = 8 * Real.pi ^ 2 / 3 := by
  have hArea := bourRoundLinkArea_of_cover μ q hq (degree := 3) (by decide) (by simpa using hCover)
  rw [hArea]
  push_cast
  ring

-- Both the mixed term and area error enter the actual normalized link integral.
example {L : Type*} [MeasurableSpace L] (μ : Measure L) [IsFiniteMeasure μ]
    (q : S₃ → L) (hq : Measurable q)
    (hCover : Measure.map q ((volume : Measure E₄).toSphere) = (2 : ℝ≥0∞) • μ)
    (S C : ℝ → L → A₃) (J : ℝ → L → ℝ) (e : ℝ → ℝ) (he : Tendsto e atTop (𝓝 0))
    (hBounds : ∀ᶠ r in atTop, 0 ≤ e r ∧ e r ≤ 1 ∧
      (∀ᵐ x ∂μ, ∀ i j, |S r x i j - (1 : A₃) i j| ≤ e r) ∧
      (∀ᵐ x ∂μ, ∀ i j, |C r x i j| ≤ e r) ∧
      (∀ᵐ x ∂μ, |J r x - 1| ≤ e r) ∧
      Integrable (fun x => J r x * bourEulerBoundaryDensity (S r x) (C r x)) μ) :
    Tendsto (fun r => ∫ x, J r x * bourEulerBoundaryDensity (S r x) (C r x) ∂μ)
      atTop (𝓝 (4 * Real.pi ^ 2)) := by
  have h := bourALEBoundaryIntegral_tendsto μ q hq (degree := 2) (by decide)
    (by simpa using hCover) S C J e he hBounds
  convert h using 2 <;> norm_num <;> ring

end ALEBoundary

#print axioms SmoothPoincare.bourEulerBoundaryDensity_error
#print axioms SmoothPoincare.bourEulerBoundaryDensity_withArea_error
#print axioms SmoothPoincare.bourEulerBoundaryIntegral_error
#print axioms SmoothPoincare.bourRoundLinkArea_of_cover
#print axioms SmoothPoincare.bourALEBoundaryIntegral_tendsto

section RecognizedCap

open SmoothPoincare

local notation "S₄" => StandardFourSphere
local instance : Fact (Module.finrank ℝ (EuclideanSpace ℝ (Fin 5)) = 4 + 1) := ⟨by simp⟩

-- The whole buffers lie in the common chart and its target contains every center segment.
example {P : Type*} [TopologicalSpace P] [ChartedSpace E₄ P] [IsManifold I₄ ∞ P]
    [CompactSpace P] (A : P ≃ₘ⟮I₄, I₄⟯ S₄)
    (oP : ManifoldOrientation I₄ P 4) (o : ManifoldOrientation I₄ S₄ 4)
    (hA : A.preservesOrientation oP o)
    (s : PartialDiffeomorph I₄ I₄ E₄ P ∞) (t : PartialDiffeomorph I₄ I₄ E₄ S₄ ∞)
    (hs : closedBall (0 : E₄) 2 ⊆ s.source) (ht : closedBall (0 : E₄) 2 ⊆ t.source) :
    ∃ (B : P ≃ₘ⟮I₄, I₄⟯ S₄) (chart : PartialDiffeomorph I₄ I₄ S₄ E₄ ∞),
      B.preservesOrientation oP o ∧ B (s 0) = t 0 ∧
      B '' (s '' closedBall (0 : E₄) 2) ⊆ chart.source ∧
      t '' closedBall (0 : E₄) 2 ⊆ chart.source ∧
      segment ℝ (chart (B (s 0))) (chart (t 0)) ⊆ chart.target := by
  obtain ⟨B, c, _, hBo, hCenter, _, hTarget, hSource, hCap⟩ :=
    bourRecognizedCap_commonChart A oP o hA s t (by norm_num) hs ht
  exact ⟨B, c, hBo, hCenter, hSource, hCap, hTarget ▸ subset_univ _⟩

end RecognizedCap

#print axioms SmoothPoincare.bourRecognizedCap_commonChart

section YamabeSelection

open DifferentialGeometry.CheegerGromovCompactness SmoothPoincare

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  [CompactSpace M] [Nonempty M]

local instance : MeasurableSpace M := borel M
local instance : BorelSpace M := ⟨rfl⟩
local notation "d₄" => (show Module.finrank ℝ E₄ = 4 by simp)

-- The two-jet limit transfers the actual Yamabe square and retains strict positivity.
example {g : ℕ → SmoothRiemannianMetric I M} {q : SmoothRiemannianMetric I M}
    (hMetric : MetricCInfConvergenceOnCompacts g q q)
    {y : ℝ} (hy : 0 < y) (hFloor : ∀ j, y ≤ classYamabeFour d₄ (g j))
    (hVolume : ∀ j, riemannianVolumeMeasure I M (g j) univ = 1)
    (hScalar : ∀ j x, metricScalarAt (g j) x = classYamabeFour d₄ (g j)) :
    0 < classYamabeFour d₄ q ∧
      Tendsto (fun j => classYamabeFour d₄ (g j) ^ 2) atTop (𝓝 (classYamabeFour d₄ q ^ 2)) := by
  obtain ⟨_, _, hq, hY⟩ := attainedYamabe_limit_of_metricConvergence (g := g)
    d₄ hMetric hy hFloor hVolume hScalar
  exact ⟨hy.trans_le hq, hY.pow 2⟩

end YamabeSelection

#print axioms SmoothPoincare.attainedYamabe_limit_of_metricConvergence

section EinsteinMode

open DifferentialGeometry.Analysis.Parabolic.TensorSpectral SmoothPoincare

-- For s=12, the center of the proposed window has coefficient −1/8.
example : einsteinWeylTTFactor 12 5 = -(1 / 8 : ℝ) := by
  norm_num [einsteinWeylTTFactor]

-- The actual unit round operator has no mode at that spectral value.
example (h : SmoothCcTensor standardRoundFourMetric 0 2) (hh : h ≠ 0) :
    standardRoundFour_negLichnerowiczOnTraceFree h ≠ (5 : ℝ) • h := by
  intro hMode
  linarith only [standardRoundFour_negLichnerowicz_eigenvalue_ge_eight h hh hMode]

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  [CompactSpace M] [Nonempty M] {o : ManifoldOrientation I M 4}

-- A strict Hessian at λ=5 for a candidate with s=12 produces nearby positive competitors.
example (v : BourPositiveMetricVariation o) {n : ℝ} (hn : 0 < n)
    (hHessian : deriv (deriv (fun t => (v.path t).energy .minus)) 0 = -(1 / 8 : ℝ) * n) :
    ∀ ε > 0, ∃ t ∈ v.domain.regular, |t| < ε ∧
      0 < classYamabeFour o.dimension_eq (v.path t).metric ∧
      ∀ chirality, (v.path t).energy chirality < (v.path 0).energy chirality :=
  (bourStrictTTWindowExcludesAttainment v .minus (s := 12) (eigenvalue := 5)
    (by norm_num) hn (by norm_num) (by simpa [einsteinWeylTTFactor] using hHessian)).2

end EinsteinMode

#print axioms SmoothPoincare.einsteinWeylTTFactor_neg_iff
#print axioms SmoothPoincare.einsteinWeylTTFactor_endpoints
#print axioms SmoothPoincare.bourStrictTTWindowExcludesAttainment
#print axioms SmoothPoincare.standardRoundFour_curvatureAction_traceFree
#print axioms SmoothPoincare.standardRoundFour_scalar_eq_twelve
#print axioms SmoothPoincare.standardRoundFour_negLichnerowicz_eigenvalue_ge_eight
#print axioms SmoothPoincare.standardRoundFour_TTMode_weylFactor_ge_one

end E49Readback
