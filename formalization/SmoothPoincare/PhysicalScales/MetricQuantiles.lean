import DifferentialGeometry.Geometry.Metric.Distance.Topology
import SmoothPoincare.PhysicalScales.CurvatureMeasure
import SmoothPoincare.PhysicalScales.Quantiles

/-! # Physical quantile annuli of an actual metric -/

open DifferentialGeometry DifferentialGeometry.Integral.Measure
open FirstOrderTwistor MeasureTheory SectionsAndConnections Set
open scoped ContDiff Manifold

namespace SmoothPoincare

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  [CompactSpace M] [ConnectedSpace M]

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

/-- The finite length distance of `g`, with the original manifold topology. -/
@[reducible]
noncomputable def physicalMetricSpace (g : SmoothRiemannianMetric I M) : MetricSpace M :=
  let : PseudoMetricSpace M := g.toPseudoMetricSpace
  MetricSpace.ofT0PseudoMetricSpace M

theorem physicalMetricSpace_dist (g : SmoothRiemannianMetric I M) (x y : M) :
    @dist M (physicalMetricSpace g).toDist x y = (riemannianEDistOf g x y).toReal :=
  rfl

theorem physicalMetricSpace_topology (g : SmoothRiemannianMetric I M) :
    (physicalMetricSpace g).toPseudoMetricSpace.toUniformSpace.toTopologicalSpace =
      ‹TopologicalSpace M› :=
  rfl

variable [FiniteDimensional ℝ E]

variable (g : SmoothRiemannianMetric I M) (o : ManifoldOrientation I M 4)
  (frame : ∀ x, OrientedOrthonormalFrameAt g o x)

/-- The squared full curvature tensor with all four ordered slots, in the same volume. -/
noncomputable def metricFullCurvatureMeasure : Measure M :=
  energyMeasure (riemannianVolumeMeasure I M g)
    (fun x => frameTensorNormSq (metricCurvatureFrameTensor g o x (frame x)))

omit [ConnectedSpace M] in
theorem metricFullCurvatureMeasure_real_eq_setIntegral {s : Set M} (hs : MeasurableSet s)
    (hFull : IntegrableOn (fun x => frameTensorNormSq (metricCurvatureFrameTensor g o x (frame x)))
      s (riemannianVolumeMeasure I M g)) :
    (metricFullCurvatureMeasure g o frame).real s =
      ∫ x in s, frameTensorNormSq (metricCurvatureFrameTensor g o x (frame x))
        ∂riemannianVolumeMeasure I M g := by
  apply energyMeasure_real_apply hs hFull
  exact Filter.Eventually.of_forall fun x =>
    Finset.sum_nonneg fun a _ => Finset.sum_nonneg fun b _ =>
      Finset.sum_nonneg fun c _ => Finset.sum_nonneg fun d _ => sq_nonneg _

/-- Physical-volume nullity of distance spheres transfers to the chiral measure
and gives attainment on the compact source. -/
theorem exists_isMetricChiralQuantile
    (hChiral : Integrable (fun x => hilbertSchmidtSq (geometricChiralBlock g o x (frame x)))
      (riemannianVolumeMeasure I M g))
    (hEnergy : 0 < chiralFrameEnergy g (fun x => geometricChiralBlock g o x (frame x)))
    {θ : ℝ} (hθ : 0 < θ) (hθ₁ : θ < 1) :
    letI := physicalMetricSpace g
    (∀ (x : M) (r : ℝ), riemannianVolumeMeasure I M g (Metric.sphere x r) = 0) →
    ∃ r, IsChiralQuantile (geometricChiralMeasure o g frame) θ r := by
  let : MetricSpace M := physicalMetricSpace g
  let : BorelSpace M := ⟨rfl⟩
  intro hNull
  let chiral := geometricChiralMeasure o g frame
  let : IsFiniteMeasure chiral := geometricChiralMeasure_finite o g frame hChiral
  have hChiralNull (x : M) (r : ℝ) : chiral (Metric.sphere x r) = 0 :=
    withDensity_absolutelyContinuous _ _ (hNull x r)
  have hTotal : 0 < chiral.real univ := geometricChiralMeasure_real_univ o g frame hChiral ▸ hEnergy
  exact exists_isChiralQuantile chiral hθ hθ₁ hTotal
    (continuous_physicalBallMass chiral hChiralNull)

/-- At supplied inner and median quantiles of `g`, select one low full-curvature
annulus and retain the inner ball and the entire median exterior at its center. -/
theorem exists_lowMass_metricQuantileAnnulus
    (hChiral : Integrable (fun x => hilbertSchmidtSq (geometricChiralBlock g o x (frame x)))
      (riemannianVolumeMeasure I M g))
    (hFull : Integrable (fun x => frameTensorNormSq (metricCurvatureFrameTensor g o x (frame x)))
      (riemannianVolumeMeasure I M g))
    {θ a b q C : ℝ} {n : ℕ} (hn : 0 < n) (hq : 1 < q) (hfit : a * q ^ n ≤ b) :
    letI := physicalMetricSpace g
    let chiral := geometricChiralMeasure o g frame
    let full := metricFullCurvatureMeasure g o frame
    let e := chiralFrameEnergy g (fun x => geometricChiralBlock g o x (frame x))
    IsChiralQuantile chiral θ a → IsChiralQuantile chiral (1 / 2) b → full.real univ ≤ C →
    ∃ (x : M) (r : ℝ),
      let inner := Metric.ball x a
      let exterior := (Metric.ball x b)ᶜ
      let shell := physicalAnnulus x r (r * q)
      a ≤ r ∧ r * q ≤ b ∧ chiral.real inner = θ * e ∧ e / 2 ≤ chiral.real exterior ∧
        Disjoint shell inner ∧ Disjoint shell exterior ∧ full.real shell ≤ C / (n : ℝ) := by
  let : MetricSpace M := physicalMetricSpace g
  let : BorelSpace M := ⟨rfl⟩
  intro chiral full e hInner hMedian hC
  let : IsFiniteMeasure chiral := geometricChiralMeasure_finite o g frame hChiral
  let : IsFiniteMeasure full := isFiniteEnergyMeasure hFull
  obtain ⟨x, r, ha, hb, hInnerMass, hExteriorMass, hInnerDisj, hExteriorDisj, hMass⟩ :=
    exists_lowMass_quantileAnnulus chiral full hInner hMedian hC hn hq hfit
  have hTotal := geometricChiralMeasure_real_univ o g frame hChiral
  change chiral.real univ = e at hTotal
  rw [hTotal] at hInnerMass hExteriorMass
  exact ⟨x, r, ha, hb, hInnerMass, hExteriorMass, hInnerDisj, hExteriorDisj, hMass⟩

/-- The diffuse or separated alternatives on an actual sequence. At each index,
the distance, volume and both curvature densities come from that index's metric. -/
theorem metricChiralQuantileAlternatives
    (G : ℕ → SmoothRiemannianMetric I M)
    (frames : ∀ i x, OrientedOrthonormalFrameAt (G i) o x)
    (hChiral : ∀ i, Integrable
      (fun x => hilbertSchmidtSq (geometricChiralBlock (G i) o x (frames i x)))
      (riemannianVolumeMeasure I M (G i)))
    (hFull : ∀ i, Integrable
      (fun x => frameTensorNormSq (metricCurvatureFrameTensor (G i) o x (frames i x)))
      (riemannianVolumeMeasure I M (G i)))
    (quantile : ℕ → ℝ → ℝ)
    (hQuantile : ∀ i θ, 0 < θ → θ ≤ 1 / 2 →
      letI := physicalMetricSpace (G i)
      IsChiralQuantile (geometricChiralMeasure o (G i) (frames i)) θ (quantile i θ))
    (hEnergy : ∀ i, 0 < chiralFrameEnergy (G i)
      (fun x => geometricChiralBlock (G i) o x (frames i x)))
    (C : ℝ) (hBudget : ∀ i,
      (∫ x, frameTensorNormSq (metricCurvatureFrameTensor (G i) o x (frames i x))
        ∂riemannianVolumeMeasure I M (G i)) ≤ C) :
    @ChiralQuantileAlternatives (fun _ => M)
      (fun i => physicalMetricSpace (G i)) (fun _ => borel M)
      (fun i => geometricChiralMeasure o (G i) (frames i))
      (fun i => metricFullCurvatureMeasure (G i) o (frames i)) quantile := by
  let chiral i := geometricChiralMeasure o (G i) (frames i)
  let full i := metricFullCurvatureMeasure (G i) o (frames i)
  have hChiralFinite i : IsFiniteMeasure (chiral i) :=
    geometricChiralMeasure_finite o (G i) (frames i) (hChiral i)
  have hFullFinite i : IsFiniteMeasure (full i) := isFiniteEnergyMeasure (hFull i)
  have hTotal (i : ℕ) : 0 < (chiral i).real univ := by
    change 0 < (geometricChiralMeasure o (G i) (frames i)).real univ
    rw [geometricChiralMeasure_real_univ o (G i) (frames i) (hChiral i)]
    exact hEnergy i
  have hC (i : ℕ) : (full i).real univ ≤ C := by
    change (metricFullCurvatureMeasure (G i) o (frames i)).real univ ≤ C
    rw [metricFullCurvatureMeasure_real_eq_setIntegral (G i) o (frames i) MeasurableSet.univ
      (hFull i).integrableOn, setIntegral_univ]
    exact hBudget i
  exact @chiralQuantileAlternatives (fun _ => M)
    (fun i => physicalMetricSpace (G i)) (fun _ => borel M) (fun _ => ⟨rfl⟩)
    chiral full hChiralFinite hFullFinite quantile hQuantile hTotal C hC

end SmoothPoincare
