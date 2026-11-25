import DifferentialGeometry.Geometry.Metric.Distance.Finiteness
import SmoothPoincare.PhysicalScales.CurvatureMeasure
import SmoothPoincare.PhysicalScales.Quantiles

/-! # Physical quantile annuli of an actual metric -/

open Bundle DifferentialGeometry DifferentialGeometry.Integral.Measure
open FirstOrderTwistor Manifold MeasureTheory SectionsAndConnections Set
open scoped ContDiff Manifold

namespace SmoothPoincare

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [FiniteDimensional ℝ E] [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  [CompactSpace M] [ConnectedSpace M]

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

/-- The finite length distance of `g`, with the original manifold topology. -/
noncomputable def physicalMetricSpace (g : SmoothRiemannianMetric I M) : MetricSpace M :=
  letI : RiemannianBundle (TangentSpace I : M → Type _) := ⟨g.toRiemannianMetric⟩
  letI : IsContinuousRiemannianBundle E (TangentSpace I : M → Type _) :=
    ⟨g.inner, g.contMDiff.continuous, fun _ _ _ => rfl⟩
  let m : EMetricSpace M := EMetricSpace.ofRiemannianMetric I M
  @EMetricSpace.toMetricSpace M m (riemannianEDistOf_ne_top g)

theorem physicalMetricSpace_dist (g : SmoothRiemannianMetric I M) (x y : M) :
    @dist M (physicalMetricSpace g).toDist x y = (riemannianEDistOf g x y).toReal :=
  rfl

theorem physicalMetricSpace_topology (g : SmoothRiemannianMetric I M) :
    (physicalMetricSpace g).toPseudoMetricSpace.toUniformSpace.toTopologicalSpace =
      ‹TopologicalSpace M› :=
  rfl

variable (g : SmoothRiemannianMetric I M) (o : ManifoldOrientation I M 4)
  (frame : ∀ x, OrientedOrthonormalFrameAt g o x)

/-- The squared full curvature tensor with all four ordered slots, in the same volume. -/
noncomputable def metricFullCurvatureMeasure : Measure M :=
  energyMeasure (riemannianVolumeMeasure I M g)
    (fun x => frameTensorNormSq (metricCurvatureFrameTensor g o x (frame x)))

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
  letI := physicalMetricSpace g
  dsimp only
  intro hNull
  let chiral := geometricChiralMeasure o g frame
  letI : IsFiniteMeasure chiral := geometricChiralMeasure_finite o g frame hChiral
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
  letI := physicalMetricSpace g
  dsimp only
  intro hInner hMedian hC
  let chiral := geometricChiralMeasure o g frame
  let full := metricFullCurvatureMeasure g o frame
  let e := chiralFrameEnergy g (fun x => geometricChiralBlock g o x (frame x))
  letI : IsFiniteMeasure chiral := geometricChiralMeasure_finite o g frame hChiral
  letI : IsFiniteMeasure full := isFiniteEnergyMeasure hFull
  obtain ⟨x, r, ha, hb, hInnerMass, hExteriorMass, hInnerDisj, hExteriorDisj, hMass⟩ :=
    exists_lowMass_quantileAnnulus chiral full hInner hMedian hC hn hq hfit
  have hTotal := geometricChiralMeasure_real_univ o g frame hChiral
  change chiral.real univ = e at hTotal
  rw [hTotal] at hInnerMass hExteriorMass
  exact ⟨x, r, ha, hb, hInnerMass, hExteriorMass, hInnerDisj, hExteriorDisj, hMass⟩

end SmoothPoincare
