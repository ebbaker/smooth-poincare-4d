import SmoothPoincare.PhysicalScales.SelectedComparisonDisks
import SmoothPoincare.Variational.BandChargeTolerance

/-! # Both physical residuals on a selected family of marked disks -/

open DifferentialGeometry DifferentialGeometry.Integral.Measure
open Filter FirstOrderTwistor MeasureTheory SectionsAndConnections Set
open scoped ContDiff Manifold Topology

namespace SmoothPoincare

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "I₄" => 𝓘(ℝ, E₄)

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  [CompactSpace M] [ConnectedSpace M]

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

/-- The fixed finite comparison windows and scalar transfers upstream of the
disk construction. The open model ball embeddings are on the actual sources.
The finite labels, three radii and limit data are fixed across the sequence. -/
structure FixedBandComparisonWindows
    (k : ℕ → SmoothRiemannianMetric I M) (μ ν : ℕ → Measure M) (d ζ rMax : ℝ) where
  labels : Finset ℕ
  center : ℕ → ℕ → M
  rIn : ℕ → ℝ
  rMid : ℕ → ℝ
  rOut : ℕ → ℝ
  omittedLimit : ℝ
  curvatureLimit : ℕ → ℝ
  distanceLimit : ℕ → ℕ → ℝ
  radii : ∀ j ∈ labels, 0 < rIn j ∧ rIn j < rMid j ∧ rMid j < rOut j ∧ rOut j < rMax
  separated : (labels : Set ℕ).Pairwise (fun j l => rMid j + rMid l < distanceLimit j l)
  distanceTendsto : ∀ j ∈ labels, ∀ l ∈ labels, j ≠ l → Tendsto (fun i =>
    letI := physicalMetricSpace (k i)
    dist (center i j) (center i l)) atTop (𝓝 (distanceLimit j l))
  charts : ∀ᶠ i in atTop, letI := physicalMetricSpace (k i)
    ∀ j ∈ labels, ∃ (F : PartialDiffeomorph I₄ I E₄ M ∞) (R : ℝ),
      0 < R ∧ F.source = Metric.ball 0 R ∧
      Metric.closedBall (center i j) (rIn j) ⊆ F.target ∧
      F.target ⊆ Metric.ball (center i j) (rMid j)
  omittedTendsto : Tendsto (fun i => letI := physicalMetricSpace (k i)
    (μ i).real (⋃ j ∈ labels, Metric.closedBall (center i j) (rIn j))ᶜ) atTop (𝓝 omittedLimit)
  curvatureTendsto : ∀ j ∈ labels, Tendsto (fun i => letI := physicalMetricSpace (k i)
    (ν i).real (Metric.ball (center i j) (rOut j))) atTop (𝓝 (curvatureLimit j))
  omittedMargin : omittedLimit < d
  curvatureMargin : ∀ j ∈ labels, curvatureLimit j < ζ

/-- A marking includes room on both sides of each unit seam, the physical
ceiling on the entire outer comparison ball, and the total omitted modified
probability of exactly the disks from the marked charts. -/
def FixedBandComparisonWindows.HasMarking
    {k : ℕ → SmoothRiemannianMetric I M} {μ ν : ℕ → Measure M} {d ζ rMax : ℝ}
    (w : FixedBandComparisonWindows k μ ν d ζ rMax) (i : ℕ)
    (F : ℕ → PartialDiffeomorph I₄ I E₄ M ∞) : Prop :=
  letI := physicalMetricSpace (k i)
  (w.labels : Set ℕ).PairwiseDisjoint (fun j => (F j).target) ∧
  (∀ j ∈ w.labels, (∃ b > (1 : ℝ), (F j).source = Metric.ball 0 b) ∧
    Metric.closedBall (0 : E₄) 1 ⊆ (F j).source ∧
    Metric.closedBall (w.center i j) (w.rIn j) ⊆ (F j) '' Metric.ball 0 1 ∧
    selectedChartDisk (F j) ⊆ (F j).target ∧
    (F j).target ⊆ Metric.ball (w.center i j) (w.rOut j) ∧ w.rOut j < rMax ∧
    (ν i).real (selectedChartDisk (F j)) ≤ (ν i).real (F j).target ∧
    (ν i).real (F j).target ≤ (ν i).real (Metric.ball (w.center i j) (w.rOut j)) ∧
    (ν i).real (Metric.ball (w.center i j) (w.rOut j)) < ζ) ∧
  (μ i).real (⋃ j ∈ w.labels, selectedChartDisk (F j))ᶜ < d

variable [I.Boundaryless] [Nonempty M]

/-- In the strict subband, choose the modified-probability tolerance before
selecting comparison windows. Any supplied family of windows at that tolerance
gives actual marked disks and both strict raw residual bounds on their single
full exterior at every sufficiently large index. -/
theorem eventually_exists_markedBandCharge
    (o : ManifoldOrientation I M 4) (g k : ℕ → SmoothRiemannianMetric I M)
    (frame : ∀ i x, OrientedOrthonormalFrameAt (g i) o x)
    (hFull : ∀ i, Integrable
      (fun x => frameTensorNormSq (metricCurvatureFrameTensor (g i) o x (frame i x)))
      (riemannianVolumeMeasure I M (g i)))
    (plus minus : ℕ → M → Fin 3 → ℝ)
    (hSpectra : ∀ i, EndpointPhysicalSpectralData o (g i) (frame i) (plus i) (minus i))
    (μ : ℕ → Measure M) [∀ i, IsProbabilityMeasure (μ i)] (L : ℕ → M → ℝ)
    (ell c : ℕ → ℝ) (hL : ∀ i, MemLp (L i) 2 (μ i)) (hEll : ∀ i, 0 ≤ ell i)
    (hMoment : ∀ i, ∫ x, L i x ^ 2 ∂μ i = ell i ^ 2) (hc : ∀ i, c i ≤ 0)
    (hTest : ∀ i, classYamabeFour o.dimension_eq (g i) ≤ c i + 6 * ∫ x, L i x ∂μ i)
    (hTransport : ∀ i (U : Set M), MeasurableSet U →
      (∫ x in U, endpointTopWeyl (plus i x) (minus i x) ^ 2 ∂riemannianVolumeMeasure I M (g i)) =
        ∫ x in U, L i x ^ 2 ∂μ i)
    {eLim : ℝ} (hLim : eLim < (5 / 4 : ℝ) * (4 * Real.pi ^ 2))
    (he : Tendsto (fun i => chiralFrameEnergy (g i)
      (fun x => geometricChiralBlock (g i) o x (frame i x))) atTop (𝓝 eLim)) :
    ∃ d > (0 : ℝ), ∀ {ζ rMax : ℝ}
      (w : FixedBandComparisonWindows k μ (fun i => metricFullCurvatureMeasure (g i) o (frame i))
        d ζ rMax),
      ∀ᶠ i in atTop, ∃ (F : ℕ → PartialDiffeomorph I₄ I E₄ M ∞),
        w.HasMarking i F ∧
        let S := (⋃ j ∈ w.labels, selectedChartDisk (F j))ᶜ
        (∫ x in S, hilbertSchmidtSq (geometricChiralBlock (g i) o x (frame i x))
          ∂riemannianVolumeMeasure I M (g i)) < 4 * Real.pi ^ 2 ∧
        (∫ x in S, hilbertSchmidtSq (endpointNegativeWeylBlock (g i) o x (frame i x))
          ∂riemannianVolumeMeasure I M (g i)) < 4 * Real.pi ^ 2 := by
  obtain ⟨d, hd, hBound⟩ := bandPhysical_omitted_charges_eventually_lt_threshold o g frame
    plus minus hSpectra μ L ell c hL hEll hMoment hc hTest hTransport hLim he
  refine ⟨d, hd, ?_⟩
  intro ζ rMax w
  have hMarks : ∀ᶠ i in atTop, ∃ F, w.HasMarking i F :=
    eventually_exists_selectedComparisonDisks k g o frame hFull μ w.labels w.center
      w.rIn w.rMid w.rOut w.curvatureLimit w.distanceLimit w.radii w.separated w.distanceTendsto
      w.charts w.omittedTendsto w.curvatureTendsto w.omittedMargin w.curvatureMargin
  have hChoose (i : ℕ) : ∃ disks : ℕ → Set M,
      (∀ j ∈ w.labels, MeasurableSet (disks j)) ∧
      ((∃ F, w.HasMarking i F) →
        ∃ F, w.HasMarking i F ∧ disks = fun j => selectedChartDisk (F j)) := by
    by_cases h : ∃ F, w.HasMarking i F
    · obtain ⟨F, hF⟩ := h
      refine ⟨fun j => selectedChartDisk (F j), ?_, fun _ => ⟨F, hF, rfl⟩⟩
      intro j hj
      exact (isCompact_selectedChartDisk (F j) (hF.2.1 j hj).2.1).isClosed.measurableSet
    · exact ⟨fun _ => ∅, fun _ _ => MeasurableSet.empty, fun h' => (h h').elim⟩
  choose disks hMeas hSelected using hChoose
  have hSmall : ∀ᶠ i in atTop, (μ i).real (⋃ j ∈ w.labels, disks i j)ᶜ ≤ d := by
    filter_upwards [hMarks] with i hi
    obtain ⟨F, hF, hDisk⟩ := hSelected i hi
    rw [hDisk]
    exact hF.2.2.le
  have hBoth := hBound (fun _ => w.labels) disks hMeas hSmall
  filter_upwards [hMarks, hBoth] with i hi hPhysical
  obtain ⟨F, hF, hDisk⟩ := hSelected i hi
  refine ⟨F, hF, ?_⟩
  simpa only [hDisk] using hPhysical

end SmoothPoincare
