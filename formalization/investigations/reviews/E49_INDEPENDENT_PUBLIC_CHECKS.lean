import SmoothPoincare

/-! E49 applications for Edward B. Baker III, 26 November 2026.
OpenAI Codex assistance. Actual serving model and reasoning effort were unavailable. -/

set_option autoImplicit false

open Bundle DifferentialGeometry DifferentialGeometry.Geometry.Curvature
open DifferentialGeometry.Integral.Measure Filter FirstOrderTwistor MeasureTheory Metric Set
open scoped BigOperators ContDiff InnerProductSpace Manifold Topology

namespace E49Readback

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "I₄" => 𝓘(ℝ, E₄)

section SpatialAdjoints

open DifferentialGeometry.Analysis.Elliptic DifferentialGeometry.Geometry.Connection
  DifferentialGeometry.Geometry.Operator DifferentialGeometry.Tensor0SBundle
  DifferentialGeometry.PDE.RicciFlow DifferentialGeometry.Tensor.RSTensor SmoothPoincare.Bour

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

-- The flux on a regular slab uses the actual native metric derivative.
example (g : ℝ → SmoothRiemannianMetric I M) {D : RealTimeInterval}
    (hg : MetricFamilySmoothOn (I := I) D g) {t : ℝ} (ht : t ∈ D.regular)
    (x : M) (u w : TangentSpace I x) :
    bourKoszulFlux (g t) (bourMetricVelocity g hg ht) x (Fin.cons u (vec2 u w)) =
      (g t).inner x (leviCivitaVariation g t x w u) u :=
  bourKoszulFlux_native g hg ht x u w u

-- The actual slab velocity pairs with the physical Ricci weight in the same metric measure.
example (g : ℝ → SmoothRiemannianMetric I M) {D : RealTimeInterval}
    (hg : MetricFamilySmoothOn (I := I) D g) {t : ℝ} (ht : t ∈ D.regular) (α : ℝ) :
    bourClosedTensorPairing (g t) (bourRicciWeight α (g t)) (bourMetricVelocity g hg ht) =
      ∫ x, inner0S (g t) x 2 (bourRicciWeight α (g t) x)
        (deriv (fun s => metricTensorField (g s) x) t) ∂riemannianVolumeMeasure I M (g t) :=
  bourClosedTensorPairing_native g hg ht (bourRicciWeight α (g t))

end SpatialAdjoints

#print axioms SmoothPoincare.Bour.bourRicciDivergence_adjoint
#print axioms SmoothPoincare.Bour.bourRicciRough_adjoint
#print axioms SmoothPoincare.Bour.bourRicciCrossed_adjoint
#print axioms SmoothPoincare.Bour.bourWeightedRicciRough_adjoint
#print axioms SmoothPoincare.Bour.bourWeightedRicciKoszul_firstAdjoint
#print axioms SmoothPoincare.Bour.bourWeightedRicciKoszul_secondAdjoint
#print axioms SmoothPoincare.Bour.bourKoszulFlux_eq_original
#print axioms SmoothPoincare.Bour.bourMetricVelocity_eq_deriv
#print axioms SmoothPoincare.Bour.bourKoszulFlux_native
#print axioms SmoothPoincare.Bour.bourClosedTensorPairing_native

section ChristoffelTime

open DifferentialGeometry.Geometry.Connection DifferentialGeometry.Geometry.Operator
  DifferentialGeometry.PDE.RicciFlow DifferentialGeometry.Tensor.Coordinates SmoothPoincare.Bour

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]

local notation "J" => Fin (Module.finrank ℝ E₄)
local notation "∂" => DifferentialGeometry.Tensor.Coordinates.partialDeriv

-- Differentiate the physical Ricci tensor on fixed chart axes using the same Christoffel field.
example (g : ℝ → SmoothRiemannianMetric I M) {D : RealTimeInterval}
    (hG : MetricFamilySmoothOn (I := I) D g) {t : ℝ} (ht : t ∈ D.regular)
    (p : M) {x : M} (hx : x ∈ (extChartAt I p).source) (i k : J) :
    let y := extChartAt I p x
    let Γ := chartChristoffel (g t) p
    let C := fun a b c z => deriv (fun s => chartChristoffel (g s) p a b c z) t
    deriv (fun s => metricRicciAt (g s) x
      (vec2 (chartBasisVecFiber p i x) (chartBasisVecFiber p k x))) t =
      (∑ j : J, ((∂ j (C i k j) y - ∂ k (C i j j) y) +
        ∑ m : J, ((C j m j y * Γ i k m y + Γ j m j y * C i k m y) -
          (C k m j y * Γ i j m y + Γ k m j y * C i j m y)))) := by
  dsimp only
  rw [(bourMetricRicciAt_chartBasis_hasDerivAt g hG ht p hx i k).deriv]
  have hy : extChartAt I p x ∈ interior (extChartAt I p).target := by
    rw [(isOpen_extChartAt_target (I := I) p).interior_eq]
    exact (extChartAt I p).map_source hx
  exact (bourChartRicci_hasDerivAt g hG ht p hy i k).deriv

end ChristoffelTime

#print axioms SmoothPoincare.Bour.bourChartChristoffel_spatial_hasDerivAt
#print axioms SmoothPoincare.Bour.bourChartRicci_hasDerivAt
#print axioms SmoothPoincare.Bour.bourMetricRicciAt_chartBasis_hasDerivAt

section StationaryInterior

open DifferentialGeometry.Geometry.Connection DifferentialGeometry.Geometry.Operator
  DifferentialGeometry.Tensor.Coordinates SmoothPoincare
open DifferentialGeometry.Analysis.Elliptic DifferentialGeometry.Analysis.Parabolic.TensorSpectral
  DifferentialGeometry.Analysis.Spectral.DeTurckCoefficients DifferentialGeometry.Integral.L2

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

-- Apply the rough chart trace to a physical (0,2) tensor.
example [BoundarylessManifold I M] (g : SmoothRiemannianMetric I M) (p : M)
    (T : SmoothCcTensor g 0 2) (lower : Fin 2 → J)
    {x : M} (hx : x ∈ chartLeviCivitaGoodSet (I := I) p)
    (hHarm : ∀ l : J, laplacian (I := I) (LeviCivita (I := I) g) g
      (bourChartCoordinate (I := I) p l) x = 0) :
    tensorChartComponentRaw (I := I) (M := M) g 0 2
      (rawTensorConnLapSmooth (I := I) g 0 2 T) p Fin.elim0 lower x =
        chartInvGramPrincipalSum (I := I) (M := M) g 0 2 p T Fin.elim0 lower x := by
  let : NeZero (Module.finrank ℝ E₄) := ⟨by simp⟩
  exact bourChartRoughLaplacian_eq_secondCovariantTrace g p 0 2 T Fin.elim0 lower hx hHarm

end StationaryInterior

#print axioms SmoothPoincare.bourChartConnectionDerivative_bound
#print axioms SmoothPoincare.bourChartConnection_trace_eq_zero
#print axioms SmoothPoincare.bourChartRoughLaplacian_eq_secondCovariantTrace

section ALEBoundary

open SmoothPoincare

local notation "A₃" => Matrix (Fin 3) (Fin 3) ℝ
local notation "S₃" => sphere (0 : E₄) 1

-- In a unit-shape frame constant curvature κ contributes 6κ to the density.
example (κ : ℝ) : bourEulerBoundaryDensity (1 : A₃) (κ • (1 : A₃)) = 4 + 6 * κ := by
  simp [bourEulerBoundaryDensity, Matrix.one_apply]
  ring

-- An actual map from the round sphere with degree three gives the correct scale.
example {L : Type*} [MeasurableSpace L] (μ : Measure L) [IsFiniteMeasure μ]
    (q : S₃ → L) (hq : Measurable q)
    (hCover : Measure.map q ((volume : Measure E₄).toSphere) = (3 : ENNReal) • μ) :
    4 * μ.real univ = 8 * Real.pi ^ 2 / 3 := by
  have hArea := bourRoundLinkArea_of_cover μ q hq (degree := 3) (by decide) (by simpa using hCover)
  rw [hArea]
  push_cast
  ring

-- Both the mixed term and area error enter the actual normalized link integral.
example {L : Type*} [MeasurableSpace L] (μ : Measure L) [IsFiniteMeasure μ]
    (q : S₃ → L) (hq : Measurable q)
    (hCover : Measure.map q ((volume : Measure E₄).toSphere) = (2 : ENNReal) • μ)
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
  convert h using 2
  norm_num
  ring

-- Insert the actual metric Hessian and Riemann coefficients in the one-sheet link formula.
example {H M L : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H}
    [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [MeasurableSpace L]
    (μ : Measure L) [IsFiniteMeasure μ] (q : S₃ → L) (hq : Measurable q)
    (hCover : Measure.map q ((volume : Measure E₄).toSphere) = μ)
    (g : ℝ → SmoothRiemannianMetric I M) (radius : M → ℝ) (o : ManifoldOrientation I M 4)
    (link : ℝ → L → M) (frame : ∀ r x, OrientedOrthonormalFrameAt (g r) o (link r x))
    (J : ℝ → L → ℝ) (e : ℝ → ℝ) (he : Tendsto e atTop (𝓝 0))
    [NeZero (Module.finrank ℝ E₄)] :
    let S := fun r x => bourLevelShapeMatrix (g r) radius (link r x) o (frame r x)
    let C := fun r x => bourTangentialCurvatureMatrix (g r) (link r x) o (frame r x)
    (∀ᶠ r in atTop, 0 ≤ e r ∧ e r ≤ 1 ∧
      (∀ᵐ x ∂μ, ∀ i j, |S r x i j - (1 : A₃) i j| ≤ e r) ∧
      (∀ᵐ x ∂μ, ∀ i j, |C r x i j| ≤ e r) ∧
      (∀ᵐ x ∂μ, |J r x - 1| ≤ e r) ∧
      Integrable (fun x => J r x * bourEulerBoundaryDensity (S r x) (C r x)) μ) →
    Tendsto (fun r => ∫ x, J r x * bourEulerBoundaryDensity (S r x) (C r x) ∂μ)
      atTop (𝓝 (8 * Real.pi ^ 2)) := by
  intro S C hBounds
  have h := bourALELevelBoundary_tendsto μ q hq (degree := 1) (by decide)
    (by simpa using hCover) g radius o link frame J e he hBounds
  simpa using h

-- The equal signed limiting masses then give the physical one-end Ricci identity.
example {k : ℕ} (hk : 0 < k)
    (plusMass minusMass ricciMass : ℝ → ℝ) (boundary : Fin k → ℝ → ℝ)
    {e d dMax : ℝ} (hPlus : Tendsto plusMass atTop (𝓝 e)) (hMinus : Tendsto minusMass atTop (𝓝 e))
    (hRicci : Tendsto ricciMass atTop (𝓝 d))
    (hBoundary : ∀ b, Tendsto (boundary b) atTop (𝓝 (8 * Real.pi ^ 2)))
    (hEuler : ∀ᶠ r in atTop,
      plusMass r + minusMass r - ricciMass r / 2 + ∑ b, boundary b r =
        8 * Real.pi ^ 2 * (2 - (k : ℝ)))
    (he : 0 ≤ e) (hD : d ≤ dMax) (hMax : dMax < 32 * Real.pi ^ 2) :
    k = 1 ∧ d = 4 * e := by
  obtain ⟨hOne, hBalance⟩ := bourOneEuclideanEnd_of_boundaryLimits hk plusMass minusMass ricciMass
    boundary hPlus hMinus hRicci hBoundary hEuler he he hD hMax
  exact ⟨hOne, by linarith only [hBalance]⟩

end ALEBoundary

#print axioms SmoothPoincare.bourEulerBoundaryDensity_error
#print axioms SmoothPoincare.bourEulerBoundaryDensity_withArea_error
#print axioms SmoothPoincare.bourEulerBoundaryIntegral_error
#print axioms SmoothPoincare.bourRoundLinkArea_of_cover
#print axioms SmoothPoincare.bourALEBoundaryIntegral_tendsto
#print axioms SmoothPoincare.bourALELevelBoundary_tendsto
#print axioms SmoothPoincare.bourExhaustedEulerIdentity
#print axioms SmoothPoincare.bourOneEuclideanEnd_of_boundaryLimits

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

-- After generic target recognition, the same diffeomorphism preserves both seam germs.
example {P D : Type*} [TopologicalSpace P] [ChartedSpace E₄ P] [IsManifold I₄ ∞ P] [CompactSpace P]
    [TopologicalSpace D] [ChartedSpace E₄ D] [IsManifold I₄ ∞ D] [T2Space D] [PreconnectedSpace D]
    (A : P ≃ₘ⟮I₄, I₄⟯ D) (K : D ≃ₘ⟮I₄, I₄⟯ S₄)
    (oP : ManifoldOrientation I₄ P 4) (o : ManifoldOrientation I₄ D 4) (oS : ManifoldOrientation I₄ S₄ 4)
    (hA : A.preservesOrientation oP o) (hK : K.preservesOrientation o oS)
    (s : PartialDiffeomorph I₄ I₄ E₄ P ∞) (t : PartialDiffeomorph I₄ I₄ E₄ D ∞)
    (prescribed : PartialDiffeomorph I₄ I₄ P D ∞)
    {r R : ℝ} (hr : 0 < r) (hBuffer : r < R)
    (hs : closedBall (0 : E₄) R ⊆ s.source) (ht : closedBall (0 : E₄) R ⊆ t.source)
    (hPr : s '' closedBall (0 : E₄) R ⊆ prescribed.source)
    (hAgree : ∀ x ∈ closedBall (0 : E₄) R, prescribed (s x) = t x)
    (u : Orientation ℝ E₄ (Fin 4))
    (hos : Orientation.map (Fin 4) ((s.isLocalDiffeomorphAt I₄ I₄ ∞
      (hs (mem_closedBall_self (hr.trans hBuffer).le))).mfderivToContinuousLinearEquiv
        (by simp)).toLinearEquiv u = oP.orientation (s 0))
    (hot : Orientation.map (Fin 4) ((t.isLocalDiffeomorphAt I₄ I₄ ∞
      (ht (mem_closedBall_self (hr.trans hBuffer).le))).mfderivToContinuousLinearEquiv
        (by simp)).toLinearEquiv u = o.orientation (t 0)) :
    ∃ F : P ≃ₘ⟮I₄, I₄⟯ D, F.preservesOrientation oP o ∧
      EqOn F prescribed (s '' ball (0 : E₄) R) ∧
      EqOn F.symm prescribed.symm (t '' ball (0 : E₄) R) ∧
      F '' (s '' ball (0 : E₄) r)ᶜ = (t '' ball (0 : E₄) r)ᶜ := by
  obtain ⟨F, hF, _, hForw, hBack, hExterior⟩ := bourMarkedExterior_of_recognizedSphere
    A K oP o oS hA hK s t prescribed hr hBuffer hs ht hPr hAgree u hos hot
  exact ⟨F, hF, hForw, hBack, hExterior⟩

end RecognizedCap

#print axioms SmoothPoincare.bourRecognizedCap_commonChart
#print axioms SmoothPoincare.bourMarkedExterior_of_recognizedSphere

section YamabeSelection

open DifferentialGeometry.CheegerGromovCompactness SmoothPoincare

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  [CompactSpace M] [Nonempty M]

local instance : MeasurableSpace M := borel M
local instance : BorelSpace M := ⟨rfl⟩
private theorem d₄ : Module.finrank ℝ E₄ = 4 := by simp

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

-- Compactness at the first exact value selects two representatives for different objectives.
example [BoundarylessManifold I M] [ConnectedSpace M]
    (o : ManifoldOrientation I M 4) (BachFlat : SmoothRiemannianMetric I M → Prop)
    (hX : ∃ q : SignedCollarMetric o, 0 < classYamabeFour o.dimension_eq q.metric ∧
      BachFlat q.metric ∧ q.energy .plus = sInf (geometricPositiveEnergies o))
    (hPositive : 0 < sInf (geometricPositiveEnergies o))
    {δ : ℝ} (hδ : 0 < δ)
    (hGap : sInf (geometricPositiveEnergies o) ≤ 8 * Real.pi ^ 2 - δ)
    (hNormalize : BourYamabeNormalization o)
    (hBachConformal : ∀ (g : SmoothRiemannianMetric I M) (u : C^∞⟮I, M; ℝ⟯),
      BachFlat g → BachFlat (DifferentialGeometry.conformalMetric g u))
    (hCompact : AttainedFirstValueCompactness o BachFlat (sInf (attainedBachValues o BachFlat)))
    (hEuler : ∀ q : SignedCollarMetric o, Bour.bourEuler q = 16 * Real.pi ^ 2)
    (hRound : ∀ q : SignedCollarMetric o, classYamabeFour o.dimension_eq q.metric ≤ roundYamabeConstant)
    (hRoundEquality : ∀ q : SignedCollarMetric o,
      classYamabeFour o.dimension_eq q.metric = roundYamabeConstant → q.energy .plus = 0) :
    let a := sInf (attainedBachValues o BachFlat)
    ∃ q w : SignedCollarMetric o,
      AttainedYamabeAt BachFlat a q ∧ AttainedYamabeAt BachFlat a w ∧
      q.energy .plus = sInf (geometricPositiveEnergies o) ∧
      (∀ z : SignedCollarMetric o, AttainedYamabeAt BachFlat a z → Bour.bourRicci q ≤ Bour.bourRicci z) ∧
      0 < roundYamabeConstant ^ 2 - (classYamabeFour o.dimension_eq w.metric) ^ 2 ∧
      ∀ z : SignedCollarMetric o, AttainedYamabeAt BachFlat a z →
        roundYamabeConstant ^ 2 - (classYamabeFour o.dimension_eq w.metric) ^ 2 ≤
          roundYamabeConstant ^ 2 - (classYamabeFour o.dimension_eq z.metric) ^ 2 := by
  intro a
  obtain ⟨hEq, ⟨q, hq, _, hRic⟩, ⟨w, hw, _, hStrict, hDeficit⟩⟩ :=
    exists_attainedYamabe_leastRicci o BachFlat hX hPositive hδ hGap hNormalize
      hBachConformal hCompact hEuler hRound hRoundEquality
  exact ⟨q, w, hq, hw, hq.plus_eq.trans hEq.symm,
    fun z hz => hRic.2 ⟨z, hz, rfl⟩, hStrict, hDeficit⟩

end YamabeSelection

#print axioms SmoothPoincare.attainedYamabe_limit_of_metricConvergence
#print axioms SmoothPoincare.exists_attainedYamabe_leastRicci

section EinsteinMode

open DifferentialGeometry.Analysis.Parabolic.TensorSpectral DifferentialGeometry.Integral.L2 SmoothPoincare

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
example (v : BourPositiveMetricVariation o) (h : SmoothCcTensor (v.path 0).metric 0 2)
    (hn : h ≠ 0)
    (hHessian : deriv (deriv (fun t => (v.path t).energy .minus)) 0 = -(1 / 8 : ℝ) * ⟪h, h⟫_ℝ) :
    ∀ ε > 0, ∃ t ∈ v.domain.regular, |t| < ε ∧
      0 < classYamabeFour o.dimension_eq (v.path t).metric ∧
      ∀ chirality, (v.path t).energy chirality < (v.path 0).energy chirality :=
  (bourStrictTTWindowExcludesAttainment v .minus h hn (s := 12) (eigenvalue := 5)
    (by norm_num) (by norm_num) (by
      have hf : einsteinWeylTTFactor 12 5 = -(1 / 8 : ℝ) := by norm_num [einsteinWeylTTFactor]
      simpa only [hf] using hHessian)).2

end EinsteinMode

#print axioms SmoothPoincare.einsteinWeylTTFactor_neg_iff
#print axioms SmoothPoincare.einsteinWeylTTFactor_endpoints
#print axioms SmoothPoincare.bourStrictTTWindowExcludesAttainment
#print axioms SmoothPoincare.standardRoundFour_curvatureAction_traceFree
#print axioms SmoothPoincare.standardRoundFour_scalar_eq_twelve
#print axioms SmoothPoincare.standardRoundFour_negLichnerowicz_eigenvalue_ge_eight
#print axioms SmoothPoincare.standardRoundFour_TTMode_weylFactor_ge_one

section AttainedSublevel

open SmoothPoincare SmoothPoincare.Bour

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M] [CompactSpace M]
  [Nonempty M] [BoundarylessManifold I M] {o : ManifoldOrientation I M 4}

-- One comparator margin applies to all original times and their sampled marked return.
example {P : Type*} [TopologicalSpace P] [PreconnectedSpace P] {p ε : ℝ} {start : P}
    (f : OriginalTrajectory o p start) (q bubble : SignedCollarMetric o)
    (hp : 0 < p) (hp1 : p < 1)
    (hEuler : ∀ q' : SignedCollarMetric o, bourEuler q' = 16 * Real.pi ^ 2)
    (hAtt : q.energy .plus = sInf (geometricPositiveEnergies o))
    (hLevel : bourEnergy p (f.slice start) ≤ bourEnergy p q + ε)
    (hPin : bourEnergy p q + ε < (1 - p) * (16 * Real.pi ^ 2))
    (hSmall : 4 * ε ≤ p * (4 * q.energy .plus - bourRicci q))
    (hGap : bourRicci q < 4 * q.energy .plus)
    (hB : 0 < classYamabeFour o.dimension_eq bubble.metric) (time : ℕ → P) :
    (∀ t, 0 < f.yamabe t ∧ bourScalar (f.slice t) ≤ bourScalar q + 24 * ε / p) ∧
      ¬ 4 * bubble.energy .plus ≤ liminf (fun j => bourRicci (f.slice (time j))) atTop := by
  let b := (4 * q.energy .plus + bourRicci q) / 2
  have hBounds := bourOriginal_attainedComparator_margin f q hp hp1 hEuler hAtt hLevel hPin hSmall
  have hb : b < 4 * sInf (geometricPositiveEnergies o) := by
    dsimp [b]
    rw [← hAtt]
    linarith only [hGap]
  exact ⟨fun t => ⟨(hBounds t).1, (hBounds t).2.2⟩,
    bourNoMarkedBubble_of_ricciMargin (fun j => f.slice (time j)) bubble hB hb
      (Eventually.of_forall fun j => (hBounds (time j)).2.1)⟩

end AttainedSublevel

#print axioms SmoothPoincare.Bour.bourOriginal_attainedComparator_margin
#print axioms SmoothPoincare.Bour.bourNoMarkedBubble_of_ricciMargin

end E49Readback
