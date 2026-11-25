import SmoothPoincare.PhysicalScales.DistanceSphere
import SmoothPoincare.Variational.MinimizingSequence

/-! # Physical quantile alternatives for a Yamabe minimizing sequence -/

open DifferentialGeometry DifferentialGeometry.Geometry.Curvature
open DifferentialGeometry.Integral.Measure Filter MeasureTheory Set
open FirstOrderTwistor SectionsAndConnections
open scoped ContDiff Manifold Topology

namespace SmoothPoincare

variable {E H M : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
  [FiniteDimensional ℝ E] [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  [CompactSpace M] [ConnectedSpace M]

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

/-- Choose normalized positive metrics and their frames once. If those same
metrics have an integrable full curvature density and a uniform full curvature
budget, they admit the physical quantile alternatives. -/
theorem existsPhysicalYamabeMinimizingSequenceWithQuantiles (o : ManifoldOrientation I M 4)
    (entry : SmoothRiemannianMetric I M) (frameEntry : ∀ x, OrientedOrthonormalFrameAt entry o x)
    (hPositive : 0 < classYamabeFour o.dimension_eq entry)
    (hInt : Integrable (fun x => hilbertSchmidtSq (geometricChiralBlock entry o x (frameEntry x)))
      (riemannianVolumeMeasure I M entry))
    (hSubcritical : chiralFrameEnergy entry (fun x => geometricChiralBlock entry o x (frameEntry x)) <
      8 * Real.pi ^ 2)
    (hInf : 0 < sInf (geometricPositiveEnergies o))
    (hNormalize : ∀ (g : SmoothRiemannianMetric I M) (frame : ∀ x, OrientedOrthonormalFrameAt g o x),
      let W := fun x => geometricChiralBlock g o x (frame x)
      0 < classYamabeFour o.dimension_eq g →
      Integrable (fun x => hilbertSchmidtSq (W x)) (riemannianVolumeMeasure I M g) →
      chiralFrameEnergy g W < 8 * Real.pi ^ 2 →
      ∃ (u : C^∞⟮I, M; ℝ⟯) (normalizedFrame : ∀ x, OrientedOrthonormalFrameAt (conformalMetric g u) o x),
        let q := conformalMetric g u
        let Wq := fun x => geometricChiralBlock q o x (normalizedFrame x)
        riemannianVolumeMeasure I M q univ = 1 ∧
        (∀ x, metricScalarAt q x = classYamabeFour o.dimension_eq g) ∧
        Integrable (fun x => hilbertSchmidtSq (Wq x)) (riemannianVolumeMeasure I M q) ∧
        chiralFrameEnergy q Wq = chiralFrameEnergy g W) :
    ∃ δ > 0, ∃ (q : ℕ → SmoothRiemannianMetric I M) (frame : ∀ n x, OrientedOrthonormalFrameAt (q n) o x),
      let W := fun n x => geometricChiralBlock (q n) o x (frame n x)
      let energy := fun n => chiralFrameEnergy (q n) (W n)
      let fullDensity := fun n x => frameTensorNormSq (metricCurvatureFrameTensor (q n) o x (frame n x))
      (∀ n, 0 < classYamabeFour o.dimension_eq (q n) ∧
        riemannianVolumeMeasure I M (q n) univ = 1 ∧
        (∀ x, metricScalarAt (q n) x = classYamabeFour o.dimension_eq (q n)) ∧
        Integrable (fun x => hilbertSchmidtSq (W n x)) (riemannianVolumeMeasure I M (q n)) ∧
        energy n ≤ 8 * Real.pi ^ 2 - δ) ∧
      Tendsto energy atTop (𝓝 (sInf (geometricPositiveEnergies o))) ∧
      (∀ n, 0 < energy n) ∧
      ((∀ n, Integrable (fullDensity n) (riemannianVolumeMeasure I M (q n))) →
        ∀ C : ℝ, (∀ n, (∫ x, fullDensity n x ∂riemannianVolumeMeasure I M (q n)) ≤ C) →
        ∃ quantile : ℕ → ℝ → ℝ,
          (∀ i θ, 0 < θ → θ ≤ 1 / 2 →
            letI := physicalMetricSpace (q i)
            IsChiralQuantile (geometricChiralMeasure o (q i) (frame i)) θ (quantile i θ)) ∧
          @ChiralQuantileAlternatives (fun _ => M)
            (fun i => physicalMetricSpace (q i)) (fun _ => borel M)
            (fun i => geometricChiralMeasure o (q i) (frame i))
            (fun i => metricFullCurvatureMeasure (q i) o (frame i)) quantile) := by
  obtain ⟨δ, hδ, q, frame, hData, hLimit⟩ :=
    existsPhysicalYamabeMinimizingSequence o entry frameEntry hPositive hInt hSubcritical hNormalize
  have hChiralPositive (i : ℕ) :
      0 < chiralFrameEnergy (q i) (fun x => geometricChiralBlock (q i) o x (frame i x)) := by
    have hMember : chiralFrameEnergy (q i) (fun x => geometricChiralBlock (q i) o x (frame i x)) ∈
        geometricPositiveEnergies o := ⟨q i, frame i, (hData i).1, (hData i).2.2.2.1, rfl⟩
    exact hInf.trans_le (csInf_le (geometricPositiveEnergies_bddBelow o) hMember)
  refine ⟨δ, hδ, q, frame, hData, hLimit, hChiralPositive, ?_⟩
  intro hFull C hBudget
  let : NeZero (Module.finrank ℝ E) := ⟨o.dimension_eq.trans_ne (by decide)⟩
  exact exists_metricChiralQuantileAlternatives o q frame (fun i => (hData i).2.2.2.1)
    hFull hChiralPositive C hBudget

end SmoothPoincare
