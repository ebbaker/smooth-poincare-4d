import FirstOrderTwistor.ChiralTransport
import FirstOrderTwistor.EnergyDensity
import FirstOrderTwistor.GeometricChiralBlock

/-! # Chiral curvature measure in the physical metric -/

open scoped ContDiff Manifold
open DifferentialGeometry DifferentialGeometry.Integral.Measure
open FirstOrderTwistor MeasureTheory SectionsAndConnections

namespace SmoothPoincare

variable {E H M : Type*}
  [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M] [SigmaCompactSpace M]

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

variable (o : ManifoldOrientation I M 4) (g : SmoothRiemannianMetric I M)
  (frame : ∀ p, OrientedOrthonormalFrameAt g o p)

/-- Weight the physical volume by the squared positive Weyl operator norm. -/
noncomputable def geometricChiralMeasure : Measure M :=
  energyMeasure (riemannianVolumeMeasure I M g)
    (fun p => hilbertSchmidtSq (geometricChiralBlock g o p (frame p)))

variable (hInt : Integrable (fun p => hilbertSchmidtSq (geometricChiralBlock g o p (frame p)))
  (riemannianVolumeMeasure I M g))

include hInt

theorem geometricChiralMeasure_finite : IsFiniteMeasure (geometricChiralMeasure o g frame) :=
  isFiniteEnergyMeasure hInt

/-- On a measurable region, the physical chiral mass equals its regional energy. -/
theorem geometricChiralMeasure_real_eq_setIntegral {s : Set M} (hs : MeasurableSet s) :
    (geometricChiralMeasure o g frame).real s =
      ∫ p in s, hilbertSchmidtSq (geometricChiralBlock g o p (frame p))
        ∂riemannianVolumeMeasure I M g :=
  energyMeasure_real_apply hs hInt.integrableOn (Filter.Eventually.of_forall fun p =>
    Finset.sum_nonneg fun a _ => Finset.sum_nonneg fun b _ =>
      sq_nonneg (geometricChiralBlock g o p (frame p) a b))

theorem geometricChiralMeasure_real_univ :
    (geometricChiralMeasure o g frame).real Set.univ =
      chiralFrameEnergy g (fun p => geometricChiralBlock g o p (frame p)) := by
  rw [geometricChiralMeasure_real_eq_setIntegral o g frame hInt MeasurableSet.univ,
    setIntegral_univ, chiralFrameEnergy]

end SmoothPoincare
