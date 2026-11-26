import SmoothPoincare

/-! Independent public applications for FOT-E46. -/

set_option autoImplicit false

section RetentionChecks

open DifferentialGeometry DifferentialGeometry.Geometry.Curvature DifferentialGeometry.Integral.Measure
open Filter FirstOrderTwistor Set SmoothPoincare
open scoped ContDiff Manifold Topology

local notation "E4" => EuclideanSpace ℝ (Fin 4)
local notation "I4" => 𝓘(ℝ, E4)

variable {H M : Type*} [TopologicalSpace H]
  {I : ModelWithCorners ℝ E4 H} [I.Boundaryless] [TopologicalSpace M] [ChartedSpace H M]
  [IsManifold I ∞ M] [T2Space M] [CompactSpace M] [Nonempty M]
  {o : ManifoldOrientation I M 4}

local instance : MeasurableSpace M := borel M
local instance : BorelSpace M := ⟨rfl⟩

example (g q cap : SignedCollarMetric o) (F : PartialDiffeomorph I4 I E4 M ∞)
    (hF : Metric.closedBall (0 : E4) 1 ⊆ F.source) {Q : Set M}
    (hQ : MeasurableSet Q) (hQD : Q ⊆ selectedChartDisk F) {Hpeak : ℝ}
    (hStart : g.energy .plus ≤ Hpeak) (hEnd : q.energy .plus ≤ Hpeak)
    (hCap : ∀ s, cap.energy .plus = q.charge s (interior (selectedChartDisk F))ᶜ)
    (hPositive : 0 < classYamabeFour o.dimension_eq cap.metric)
    (hRetain : ∀ s, g.charge s Q ≤ q.charge s Q) (hWall : Hpeak < 8 * Real.pi ^ 2) :
    max (g.energy .plus) (sInf (geometricPositiveEnergies o) +
      max (g.charge .plus Q) (g.charge .minus Q)) < 8 * Real.pi ^ 2 := by
  exact (retainedCore_finite_peak_floor g q cap F hF hQ hQD hStart hEnd hCap
    hPositive hRetain).trans_lt hWall

example (g q cap : SignedCollarMetric o) (F : PartialDiffeomorph I4 I E4 M ∞)
    (hF : Metric.closedBall (0 : E4) 1 ⊆ F.source) {Q : Set M}
    (hQ : MeasurableSet Q) (hQD : Q ⊆ selectedChartDisk F)
    (hEnd : q.energy .plus ≤ sInf (geometricPositiveEnergies o) + g.charge .minus Q)
    (hCap : cap.energy .plus = q.charge .minus (interior (selectedChartDisk F))ᶜ)
    (hPositive : 0 < classYamabeFour o.dimension_eq cap.metric)
    (hRetain : g.charge .minus Q ≤ q.charge .minus Q) :
    q.charge .minus (selectedChartDisk F \ Q) = 0 := by
  have h := (retainedCore_peak_decomposition g q cap F hF hQ hQD .minus hEnd hCap
    hPositive hRetain).2.2.2.1
  exact le_antisymm (by simpa using h) MeasureTheory.measureReal_nonneg

example (g q cap : ℕ → SignedCollarMetric o) (F : ℕ → PartialDiffeomorph I4 I E4 M ∞)
    (Q : ℕ → Set M) (Hpeak : ℕ → ℝ)
    (hF : ∀ n, Metric.closedBall (0 : E4) 1 ⊆ (F n).source)
    (hQ : ∀ n, MeasurableSet (Q n)) (hQD : ∀ n, Q n ⊆ selectedChartDisk (F n))
    (hEnd : ∀ n, (q n).energy .plus ≤ Hpeak n)
    (hCap : ∀ n s, (cap n).energy .plus = (q n).charge s (interior (selectedChartDisk (F n)))ᶜ)
    (hPositive : ∀ n, 0 < classYamabeFour o.dimension_eq (cap n).metric)
    (hRetain : ∀ n s, (g n).charge s (Q n) ≤ (q n).charge s (Q n))
    (hSharp : Tendsto (fun n => Hpeak n - (sInf (geometricPositiveEnergies o) +
      max ((g n).charge .plus (Q n)) ((g n).charge .minus (Q n)))) atTop (𝓝 0)) :
    Tendsto (fun n => (q n).charge (protectedChargeSign (g n) (Q n))
      (selectedChartDisk (F n) \ Q n)) atTop (𝓝 0) :=
  (retainedCore_nearSharp_limits g q cap F Q Hpeak hF hQ hQD hEnd hCap
    hPositive hRetain hSharp).2.2.1

example (g : SignedCollarMetric o) {V : Set M}
    (hVolume : 0 < (riemannianVolumeMeasure I M g.metric) V)
    (hScalar : ∀ x ∈ V, 0 < metricScalarAt g.metric x)
    (hAttain : classYamabeFour o.dimension_eq g.metric < 0 →
      ∃ u : C^∞⟮I, M; ℝ⟯, classYamabeFour o.dimension_eq g.metric =
        capTestScalar (conformalMetric g.metric u) /
          Real.sqrt (capTestVolume (conformalMetric g.metric u)))
    (hEuler : 48 * (8 * Real.pi ^ 2 - g.energy .plus) ≤
      classYamabeFour o.dimension_eq g.metric ^ 2)
    (hGap : g.energy .plus < 8 * Real.pi ^ 2)
    (hBudget : scalarDeficitSq g.metric = 48 * (8 * Real.pi ^ 2 - g.energy .plus)) :
    0 < classYamabeFour o.dimension_eq g.metric ∧
      Real.sqrt (48 * (8 * Real.pi ^ 2 - g.energy .plus)) ≤
        classYamabeFour o.dimension_eq g.metric :=
  signedMetric_yamabe_pos_of_retainedScalar g hVolume hScalar hAttain hEuler hGap hBudget.le

example {T E₁ E₂ : ℝ} (hSum : E₁ + E₂ = 2 * T) : E₁ ≤ T ∨ E₂ ≤ T :=
  eitherCappedEnergy_le_threshold hSum.le

end RetentionChecks

section NativePocketChecks

open DifferentialGeometry DifferentialGeometry.Geometry.Curvature DifferentialGeometry.Integral.Measure
open FirstOrderTwistor Set SmoothPoincare
open scoped ContDiff Manifold

local notation "E4" => EuclideanSpace ℝ (Fin 4)
local notation "I4" => 𝓘(ℝ, E4)

variable {H M : Type*} [TopologicalSpace H]
  {I : ModelWithCorners ℝ E4 H} [I.Boundaryless] [TopologicalSpace M] [ChartedSpace H M]
  [IsManifold I ∞ M] [T2Space M] [CompactSpace M] [Nonempty M]
  {o : ManifoldOrientation I M 4}

local instance : MeasurableSpace M := borel M
local instance : BorelSpace M := ⟨rfl⟩

example (g h : SignedCollarMetric o) (F : PartialDiffeomorph I4 I E4 M ∞)
    (R : SmoothRiemannianMetric I M) {r : ℝ} (hr : 0 < r)
    (hS : Metric.closedBall (0 : E4) (3 * r) ⊆ F.source) (s : Icc (0 : ℝ) 1)
    (hPath : h.metric = nativePocketPath F g.metric R hr hS s)
    (hFrame : ∀ y ∉ F '' Metric.closedBall (0 : E4) (3 * r), (g.frame y).basis = (h.frame y).basis)
    (hScalar : ∀ y ∉ F '' Metric.closedBall (0 : E4) (3 * r), 0 ≤ metricScalarAt g.metric y)
    (hCurv : ∀ x ∈ F '' Metric.closedBall (0 : E4) (3 * r),
      frameTensorNormSq (metricCurvatureFrameTensor h.metric o x (h.frame x)) ≤ 4)
    (hEuler : 48 * (8 * Real.pi ^ 2 - h.energy .plus) ≤ classYamabeFour o.dimension_eq h.metric ^ 2) :
    let A := F '' Metric.closedBall (0 : E4) (3 * r)
    let v := (riemannianVolumeMeasure I M h.metric).real A
    g.energy .plus - g.charge .plus A + v < 8 * Real.pi ^ 2 →
      h.energy .minus + scalarDeficitSq h.metric / 24 ≤ g.energy .minus - g.charge .minus A + v ∧
      h.energy .minus < 8 * Real.pi ^ 2 ∧ 0 < classYamabeFour o.dimension_eq h.metric := by
  intro A v hGap
  have check := nativePocketPath_positive_of_joint_price F g h R hr hS s hPath hFrame hScalar hCurv hEuler
  have hNormalized : (4 : ℝ) / 4 = 1 := by norm_num
  simp only [hNormalized, one_mul] at check
  obtain ⟨hSign, _, hEnergy⟩ := check.2 hGap
  exact ⟨check.1 .minus, hEnergy .minus, hSign⟩

end NativePocketChecks

section ReverseAttachmentChecks

open CategoryTheory CategoryTheory.Limits DifferentialGeometry.Topology SmoothPoincare
open DifferentialGeometry.PDE.RicciFlow.Surgery.Topology
open scoped ContinuousMap

universe u

variable {W O : Type u} [TopologicalSpace W] [TopologicalSpace O]

example (Z U : Set W)
    (hZ : IntegralHomology Z 1 ≃ₗ[ℤ] (Fin 3 → ℤ))
    (hU : IntegralHomology U 1 ≃ₗ[ℤ] (Fin 2 → ℤ))
    (hRelZ : SingularPair.relativeHomology integralCoefficients (TopCat.of W) Z 2 ≃ₗ[ℤ] ℤ)
    (hRelU : IsZero (SingularPair.relativeHomology integralCoefficients (TopCat.of W) U 1))
    (γ : O ≃ₜ U) (o : C(Handle.BeltRegion 2 2, O)) (c : C(Handle.StandardHandle 2 2, W))
    (hFace : ∀ p, (γ (o p)).val = c (Handle.beltInclusion 2 2 p))
    (z : IntegralHomology (ULift.{u} (CellBoundary 2)) 1) :
    integralHomologyMap 1 (reverseMiddleCore γ o) z = 0 :=
  reverseMiddleCore_nullHomologous Z U 2 hZ hU hRelZ hRelU γ o c hFace z

end ReverseAttachmentChecks

section ScalarCoercivityChecks

open DifferentialGeometry DifferentialGeometry.Geometry.Operator DifferentialGeometry.Integral.Measure
open FirstOrderTwistor MeasureTheory SmoothPoincare
open scoped ContDiff Manifold

local notation "E4" => EuclideanSpace ℝ (Fin 4)

variable {H M : Type*} [TopologicalSpace H]
  {I : ModelWithCorners ℝ E4 H} [I.Boundaryless] [TopologicalSpace M] [ChartedSpace H M]
  [IsManifold I ∞ M] [T2Space M] [CompactSpace M] [Nonempty M]

local instance : MeasurableSpace M := borel M
local instance : BorelSpace M := ⟨rfl⟩

example (g : SmoothRiemannianMetric I M)
    (hSob : ∀ f : C^∞⟮I, M; ℝ⟯, Real.sqrt (capFactorVolume g f) ≤
      2 * ((∫ x, f x ^ 2 ∂riemannianVolumeMeasure I M g) +
        ∫ x, normGradSqFun g f x ∂riemannianVolumeMeasure I M g)) :
    3 - scalarFloorDeficitNorm g 9 ≤ classYamabeFour (by simp : Module.finrank ℝ E4 = 4) g := by
  have h := classYamabeFour_lower_of_scalarFloorDeficit (by simp : Module.finrank ℝ E4 = 4)
    g (ρ := 9) (D := 2) (by norm_num) (by norm_num) hSob
  norm_num at h ⊢
  exact h

end ScalarCoercivityChecks

section NativeCylinderChecks

open DifferentialGeometry Set SmoothPoincare
open scoped ContDiff Manifold

local notation "E4" => EuclideanSpace ℝ (Fin 4)
local notation "I4" => 𝓘(ℝ, E4)
local notation "J" => ModelWithCorners.prod (𝓡 3) (𝓘(ℝ))
local instance : Fact (Module.finrank ℝ E4 = 3 + 1) := ⟨by simp⟩

variable {H M : Type*} [TopologicalSpace H]
  {I : ModelWithCorners ℝ E4 H} [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]

example (p : ExactFaceSphere) :
    2 * Real.log (‖nativePocketLogPolar (1 / 3) 2 (p, -(1 / 4))‖ / (1 / 3)) = -(1 / 4) :=
  nativePocketLogPolar_time (by norm_num) (by norm_num) (p, -(1 / 4))

example (F : PartialDiffeomorph I4 I E4 M ∞) (p : ExactFaceSphere)
    (g : SmoothRiemannianMetric I M)
    (hBand : univ ×ˢ Icc (-(1 / 4 : ℝ)) (1 / 2) ⊆ (nativePocketMarking F p).source)
    (hMetric : ∀ q ∈ univ ×ˢ Icc (-(1 / 4 : ℝ)) (1 / 2), ∀ v : TangentSpace J q,
      g.inner (nativePocketMarking F p q) (mfderiv J I (nativePocketMarking F p) q v)
        (mfderiv J I (nativePocketMarking F p) q v) =
        (nativePocketCylinderMetric (by norm_num : (0 : ℝ) < 2)).inner q v v) :
    let A := nativePocketMarking F p
    PositiveScalarCuts.markedBandEWidth g (A '' (univ ×ˢ Icc (-(1 / 4 : ℝ)) 0))
      (A '' (univ ×ˢ {-(1 / 4 : ℝ)})) (A '' (univ ×ˢ {0})) = ENNReal.ofReal (1 / 4) ∧
    PositiveScalarCuts.markedBandEWidth g (A '' (univ ×ˢ Icc (0 : ℝ) (1 / 2)))
      (A '' (univ ×ˢ {0})) (A '' (univ ×ˢ {(1 / 2 : ℝ)})) = ENNReal.ofReal (1 / 2) := by
  intro A
  have hL : univ ×ˢ Icc (-(1 / 4 : ℝ)) 0 ⊆ univ ×ˢ Icc (-(1 / 4 : ℝ)) (1 / 2) :=
    Set.prod_mono Subset.rfl (Icc_subset_Icc le_rfl (by norm_num))
  have hR : univ ×ˢ Icc (0 : ℝ) (1 / 2) ⊆ univ ×ˢ Icc (-(1 / 4 : ℝ)) (1 / 2) :=
    Set.prod_mono Subset.rfl (Icc_subset_Icc (by norm_num) le_rfl)
  constructor
  · have h := nativePocketCylinder_substrip_width F p g
      (by norm_num : (0 : ℝ) < 2) (by norm_num : -(1 / 4 : ℝ) ≤ 0)
      (hL.trans hBand) (fun q hq => hMetric q (hL hq))
    simpa using h
  · have h := nativePocketCylinder_substrip_width F p g
      (by norm_num : (0 : ℝ) < 2) (by norm_num : (0 : ℝ) ≤ 1 / 2)
      (hR.trans hBand) (fun q hq => hMetric q (hR hq))
    simpa using h

end NativeCylinderChecks

section NativeFrameChecks

open DifferentialGeometry DifferentialGeometry.Geometry.Curvature FirstOrderTwistor Set SmoothPoincare
open scoped ContDiff Manifold

local notation "E4" => EuclideanSpace ℝ (Fin 4)
local notation "I4" => 𝓘(ℝ, E4)

variable {H M : Type*} [TopologicalSpace H]
  {I : ModelWithCorners ℝ E4 H} [I.Boundaryless] [TopologicalSpace M] [ChartedSpace H M]
  [IsManifold I ∞ M] [T2Space M] [BoundarylessManifold I M]

example (F : PartialDiffeomorph I4 I E4 M ∞) (g R : SmoothRiemannianMetric I M)
    {R₀ : ℝ} (hR₀ : 0 ≤ R₀) (hBuffer : Metric.closedBall (0 : E4) R₀ ⊆ F.source)
    (U : TopologicalSpace.Opens E4) (hBU : Metric.closedBall (0 : E4) R₀ ⊆ U)
    (hFlat : ∀ x ∈ U, ∀ v w : E4, nativePocketMetricCoefficient F R v w x = inner ℝ v w)
    (hZero : ∀ v w : E4, nativePocketMetricCoefficient F g v w 0 =
      nativePocketMetricCoefficient F R v w 0)
    (hNormal : ∀ v w : E4, fderiv ℝ (nativePocketMetricCoefficient F g v w) 0 = 0)
    (o : ManifoldOrientation I M 4) :
    ∃ D : ℝ, 0 ≤ D ∧ ∀ (s : Icc (0 : ℝ) 1) {r : ℝ} (hr : 0 < r), r ≤ 1 →
      ∀ (hBound : 3 * r ≤ R₀) (y : M), y ∈ F '' Metric.closedBall (0 : E4) (3 * r) →
      let hS := (Metric.closedBall_subset_closedBall hBound).trans hBuffer
      let P := nativePocketPath F g R hr hS s
      ∀ frame : OrientedOrthonormalFrameAt P o y,
        frameTensorNormSq (metricCurvatureFrameTensor P o y frame) ≤ D := by
  obtain ⟨D, hD, applyBound⟩ := exists_nativePocketPath_frameTensorNormSq_bounds
    F g R hR₀ hBuffer U hBU hFlat hZero o
  refine ⟨D, hD, ?_⟩
  intro s r hr hrOne hBound y hy hS P frame
  exact (applyBound s hr hrOne hBound y hy frame).2 hNormal

end NativeFrameChecks

section CompleteCapChecks

open DifferentialGeometry DifferentialGeometry.Geometry.Curvature DifferentialGeometry.Integral.Measure
open Filter FirstOrderTwistor MeasureTheory Set SmoothPoincare
open scoped ContDiff Manifold Topology

local notation "E4" => EuclideanSpace ℝ (Fin 4)
local notation "I4" => 𝓘(ℝ, E4)

variable {H M : Type*} [TopologicalSpace H]
  {I : ModelWithCorners ℝ E4 H} [I.Boundaryless] [TopologicalSpace M] [ChartedSpace H M]
  [IsManifold I ∞ M] [T2Space M] [CompactSpace M] [Nonempty M]
  {o : ManifoldOrientation I M 4}

local instance : MeasurableSpace M := borel M
local instance : BorelSpace M := ⟨rfl⟩

example (source cap : SignedCollarMetric o) (F : PartialDiffeomorph I4 I E4 M ∞)
    (hDisk : Metric.closedBall (0 : E4) 1 ⊆ F.source)
    {A : Set M} (hA : MeasurableSet A) (hADisk : A ⊆ selectedChartDisk F)
    (hGerm : ∀ x ∉ interior (selectedChartDisk F), ∀ᶠ y in 𝓝 x,
      ∀ v w : TangentSpace I y, source.metric.inner y v w = cap.metric.inner y v w)
    (hFrame : ∀ x ∉ interior (selectedChartDisk F), (source.frame x).basis = (cap.frame x).basis)
    (hExterior : ∀ x ∉ interior (selectedChartDisk F), 0 ≤ metricScalarAt source.metric x)
    (hPositive : ∃ x ∉ interior (selectedChartDisk F), 0 < metricScalarAt source.metric x)
    (hAttain : classYamabeFour o.dimension_eq cap.metric < 0 →
      ∃ u : C^∞⟮I, M; ℝ⟯, classYamabeFour o.dimension_eq cap.metric =
        capTestScalar (conformalMetric cap.metric u) /
          Real.sqrt (capTestVolume (conformalMetric cap.metric u)))
    (hEuler : 48 * (8 * Real.pi ^ 2 - cap.energy .plus) ≤
      classYamabeFour o.dimension_eq cap.metric ^ 2) :
    let B := selectedChartDisk F
    let e := source.energy .plus - source.charge .minus B + cap.charge .minus A + cap.charge .minus (B \ A)
    let μ := riemannianVolumeMeasure I M cap.metric
    let nSq := (∫ x in A, (max (-metricScalarAt cap.metric x) 0) ^ 2 ∂μ) +
      (∫ x in B \ A, (max (-metricScalarAt cap.metric x) 0) ^ 2 ∂μ)
    e < 8 * Real.pi ^ 2 → e < sInf (geometricPositiveEnergies o) →
      48 * (8 * Real.pi ^ 2 - e) < nSq :=
  (selectedMatchedCap_scalarTest source cap F hDisk .minus hA hADisk hGerm hFrame
    hExterior hPositive hAttain hEuler).2.2.2

end CompleteCapChecks

section NativeSobolevChecks

open DifferentialGeometry.CheegerGromovCompactness
open DifferentialGeometry DifferentialGeometry.Geometry.Operator DifferentialGeometry.Integral.Measure
open FirstOrderTwistor MeasureTheory Set SmoothPoincare
open scoped ContDiff Manifold

local notation "E4" => EuclideanSpace ℝ (Fin 4)

variable {H M : Type*} [TopologicalSpace H]
  {I : ModelWithCorners ℝ E4 H} [I.Boundaryless] [TopologicalSpace M] [ChartedSpace H M]
  [IsManifold I ∞ M] [T2Space M] [CompactSpace M]

local instance : MeasurableSpace M := borel M
local instance : BorelSpace M := ⟨rfl⟩

example (g h : SmoothRiemannianMetric I M) {D : ℝ}
    (hD : 0 ≤ D) (hEquiv : MetricUniformEquivalentOn univ g h 2)
    (hSob : ∀ f : C^∞⟮I, M; ℝ⟯, Real.sqrt (capFactorVolume g f) ≤
      D * ((∫ x, f x ^ 2 ∂riemannianVolumeMeasure I M g) +
        ∫ x, normGradSqFun g f x ∂riemannianVolumeMeasure I M g))
    (f : C^∞⟮I, M; ℝ⟯) : Real.sqrt (capFactorVolume h f) ≤
      (16 * D) * ((∫ x, f x ^ 2 ∂riemannianVolumeMeasure I M h) +
        ∫ x, normGradSqFun h f x ∂riemannianVolumeMeasure I M h) := by
  have hTransfer := scalarSobolev_transfer g h hEquiv hD hSob f
  norm_num at hTransfer ⊢
  exact hTransfer

end NativeSobolevChecks

section PositiveFlatteningChecks

open DifferentialGeometry DifferentialGeometry.Geometry.Curvature DifferentialGeometry.Integral.Measure
open FirstOrderTwistor MeasureTheory Set SmoothPoincare
open scoped ContDiff Manifold

local notation "E4" => EuclideanSpace ℝ (Fin 4)
local notation "I4" => 𝓘(ℝ, E4)

variable {H M : Type*} [TopologicalSpace H]
  {I : ModelWithCorners ℝ E4 H} [I.Boundaryless] [TopologicalSpace M] [ChartedSpace H M]
  [IsManifold I ∞ M] [T2Space M] [CompactSpace M] [Nonempty M]
  {o : ManifoldOrientation I M 4}

local instance : MeasurableSpace M := borel M
local instance : BorelSpace M := ⟨rfl⟩

example (g : SignedCollarMetric o) (R : SmoothRiemannianMetric I M) :
    ∃ S : ℝ, 0 < S ∧ ∀ (F : PartialDiffeomorph I4 I E4 M ∞) {r : ℝ}
      (hr : 0 < r) (_hr₁ : r ≤ 1) (hS : Metric.closedBall (0 : E4) (3 * r) ⊆ F.source)
      (s : Icc (0 : ℝ) 1) (h : SignedCollarMetric o),
      let A := F '' Metric.closedBall (0 : E4) (3 * r)
      h.metric = nativePocketPath F g.metric R hr hS s →
      (∀ x ∉ A, (g.frame x).basis = (h.frame x).basis) →
      (∀ x ∉ A, 6 ≤ metricScalarAt g.metric x) →
      (∀ x ∈ A, frameTensorNormSq (metricCurvatureFrameTensor h.metric o x (h.frame x)) ≤ (2 / r) ^ 2) →
      (riemannianVolumeMeasure I M h.metric).real A ≤ r ^ 4 →
      h.energy .minus ≤ g.energy .minus - g.charge .minus A + r ^ 2 ∧
      ((6 + Real.sqrt 6 * 2) * r < 6 / S → 0 < classYamabeFour o.dimension_eq h.metric) := by
  obtain ⟨S, hS, applyBound⟩ := exists_nativePocket_positive_slice_bounds g R
    (show 0 < (6 : ℝ) by norm_num)
  refine ⟨S, hS, ?_⟩
  intro F r hr hr₁ hBuffer s h A hPath hFrame hScalar hCurv hVol
  have check := applyBound F hr hr₁ hBuffer s h hPath hFrame hScalar
    (K := 2) (V := 1) (by norm_num) (by norm_num) hCurv (by simpa using hVol)
  have hPrice := check.2.1 .minus
  have hY := check.2.2
  norm_num at hPrice hY
  exact ⟨by linarith only [hPrice], hY⟩

end PositiveFlatteningChecks

section SignedSliceChecks

open DifferentialGeometry DifferentialGeometry.Integral.Measure
open FirstOrderTwistor MeasureTheory Set SmoothPoincare
open scoped ContDiff Manifold

local notation "E4" => EuclideanSpace ℝ (Fin 4)
local notation "I4" => 𝓘(ℝ, E4)

variable {H M : Type*} [TopologicalSpace H]
  {I : ModelWithCorners ℝ E4 H} [I.Boundaryless] [TopologicalSpace M] [ChartedSpace H M]
  [IsManifold I ∞ M] [T2Space M] [CompactSpace M] [Nonempty M]
  {o : ManifoldOrientation I M 4}

local instance : MeasurableSpace M := borel M
local instance : BorelSpace M := ⟨rfl⟩

example (F : PartialDiffeomorph I4 I E4 M ∞) (g : SignedCollarMetric o)
    (R : SmoothRiemannianMetric I M) {r : ℝ} (hr : 0 < r)
    (hS : Metric.closedBall (0 : E4) (3 * r) ⊆ F.source) (s : Icc (0 : ℝ) 1) :
    let A := F '' Metric.closedBall (0 : E4) (3 * r)
    let h := nativePocketPath F g.metric R hr hS s
    let f := nativePocketPath_frame F g R hr hS s
    let W := fun sign x => hilbertSchmidtSq (signedCollarWeylBlock o h f sign x)
    let μ := riemannianVolumeMeasure I M h
    (∀ sign, AEStronglyMeasurable (W sign) (μ.restrict A)) →
    ((∫ x in A, W .plus x ∂μ) - (∫ x in A, W .minus x ∂μ) =
      g.charge .plus A - g.charge .minus A) →
    ∃ q : SignedCollarMetric o, q.metric = h ∧
      q.charge .plus Aᶜ = g.charge .plus Aᶜ ∧ q.charge .minus Aᶜ = g.charge .minus Aᶜ := by
  intro A h f W μ hMeas hBalance
  obtain ⟨q, hq, _, _, hExterior⟩ := exists_nativePocketSignedSlice_of_localData F g R hr hS s
    hMeas hBalance
  exact ⟨q, hq, (hExterior .plus).symm, (hExterior .minus).symm⟩

end SignedSliceChecks

section NativeGeometryChecks

open DifferentialGeometry DifferentialGeometry.Geometry.Curvature DifferentialGeometry.Integral.Measure
open FirstOrderTwistor MeasureTheory Set SmoothPoincare
open scoped ContDiff Manifold

local notation "E4" => EuclideanSpace ℝ (Fin 4)
local notation "I4" => 𝓘(ℝ, E4)

variable {H M : Type*} [TopologicalSpace H]
  {I : ModelWithCorners ℝ E4 H} [I.Boundaryless] [TopologicalSpace M] [ChartedSpace H M]
  [IsManifold I ∞ M] [T2Space M] [SigmaCompactSpace M]

local instance : MeasurableSpace M := borel M
local instance : BorelSpace M := ⟨rfl⟩

example (F : PartialDiffeomorph I4 I E4 M ∞) (g : SmoothRiemannianMetric I M)
    (hBuffer : Metric.closedBall (0 : E4) 1 ⊆ F.source)
    (hZero : ∀ v w : E4, nativePocketMetricCoefficient F g v w 0 = inner ℝ v w)
    (o : ManifoldOrientation I M 4) :
    let r : ℝ := 1 / 8
    let hS := (Metric.closedBall_subset_closedBall
      (by norm_num : 3 * (1 / 8 : ℝ) ≤ 1)).trans hBuffer
    ∃ (R : SmoothRiemannianMetric I M) (V K : ℝ), 0 ≤ V ∧ 0 ≤ K ∧
      ∀ s : Icc (0 : ℝ) 1,
      let P := nativePocketPath F g R (by positivity : 0 < r) hS s
      let A := F '' Metric.closedBall (0 : E4) (3 * r)
      (riemannianVolumeMeasure I M P).real A ≤ V * r ^ 4 ∧
        ∀ y ∈ A, ∀ frame : OrientedOrthonormalFrameAt P o y,
          frameTensorNormSq (metricCurvatureFrameTensor P o y frame) ≤ (K / r) ^ 2 := by
  intro r hS
  obtain ⟨R, U, V, K, hV, hK, _, _, _, hBounds⟩ := exists_nativePocket_geometry_bounds F g
    (by norm_num : (0 : ℝ) < 1) hBuffer hZero o
  refine ⟨R, V, K, hV, hK, ?_⟩
  intro s P A
  have h := hBounds (r := r) (by unfold r; norm_num) (by unfold r; norm_num)
    (by unfold r; norm_num) s
  exact ⟨h.1, fun y hy frame => (h.2 y hy frame).1⟩

end NativeGeometryChecks

section CalibrationChecks

open Set SmoothPoincare

example {f d e : ℝ → ℝ} (hFirst : ∀ a ∈ Icc (-1 : ℝ) 1, HasDerivAt f (d a) a)
    (hSecond : ∀ a ∈ Icc (-1 : ℝ) 1, HasDerivAt d (e a) a)
    (hFloor : ∀ a ∈ Icc (-1 : ℝ) 1, 4 ≤ e a) (hSlope : d 0 < 0) :
    2 ≤ f (-1) - f 0 ∧ StrictMonoOn (fun a => f (-a)) (Icc (0 : ℝ) 1) := by
  obtain ⟨ε, hε, hStart, hDerivs⟩ := exists_chargeCalibrationDirection hFirst hSecond hFloor
  have hNeg : ε = -1 := hε.resolve_left (fun h => hSlope.not_ge (by simpa [h] using hStart))
  have h := charge_increment_of_secondVariation (by norm_num : (0 : ℝ) < 1)
    (by norm_num : (0 : ℝ) < 4) (fun a ha => (hDerivs a ha).1)
    (fun a ha => (hDerivs a ha).2.1) hStart (fun a ha => (hDerivs a ha).2.2)
  have hEnd := h.1 1 (by norm_num)
  refine ⟨?_, ?_⟩
  · norm_num [hNeg] at hEnd
    exact hEnd
  · simpa [hNeg] using h.2

end CalibrationChecks

section CenterChecks

open DifferentialGeometry FirstOrderTwistor Set SmoothPoincare
open scoped ContDiff Manifold

local notation "E4" => EuclideanSpace ℝ (Fin 4)
local notation "I4" => 𝓘(ℝ, E4)

variable {H M : Type*} [TopologicalSpace H]
  {I : ModelWithCorners ℝ E4 H} [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]

example (g : SmoothRiemannianMetric I M) (F : PartialDiffeomorph I4 I E4 M ∞)
    (hDisk : Metric.closedBall (0 : E4) 1 ⊆ F.source) :
    ∃ (J : E4 ≃ₘ^∞⟮I4, I4⟯ E4) (G : PartialDiffeomorph I4 I E4 M ∞),
      G.source = F.source ∧ G '' Metric.closedBall (0 : E4) 1 = F '' Metric.closedBall (0 : E4) 1 ∧
      (∀ x ∉ Metric.ball (0 : E4) (1 / 2), J x = x ∧ J.symm x = x) ∧
      ∀ v w : E4, nativePocketMetricCoefficient G g v w 0 = inner ℝ v w := by
  obtain ⟨J, G, _, hSource, hImage, _, hFixed, _, hGram⟩ :=
    exists_nativePocketCenter_normalizedChart g F hDisk (r := 1 / 2) (by norm_num) (by norm_num)
  exact ⟨J, G, hSource, hImage, hFixed, hGram⟩

end CenterChecks
