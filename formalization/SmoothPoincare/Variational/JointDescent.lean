import FirstOrderTwistor.GeometricCutDescent

/-! # Descent by a single marked competitor -/

open DifferentialGeometry DifferentialGeometry.Integral.Measure MeasureTheory
open FirstOrderTwistor SectionsAndConnections
open scoped Manifold ContDiff

namespace SmoothPoincare

variable {E F H K M X : Type*}
  [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [NormedAddCommGroup F] [NormedSpace ℝ F] [FiniteDimensional ℝ F]
  [TopologicalSpace H] [TopologicalSpace K]
  {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  {J : ModelWithCorners ℝ F K} [J.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  [CompactSpace M] [Nonempty M]
  [TopologicalSpace X] [ChartedSpace K X] [IsManifold J ∞ X] [T2Space X]
  [CompactSpace X] [Nonempty X]

private local instance : MeasurableSpace X := borel X
private local instance : BorelSpace X := ⟨rfl⟩

/-- One marked competitor bounds the net gain by the source excess. The energy
comparison is global and includes the installation cost and net exterior change. -/
theorem jointCompetitorGain_le_excess
    {oM : ManifoldOrientation I M 4} {oX : ManifoldOrientation J X 4}
    (Φ : M ≃ₘ⟮I, J⟯ X) (hΦ : Φ.preservesOrientation oM oX)
    (g : SmoothRiemannianMetric J X) (frame : ∀ y, OrientedOrthonormalFrameAt g oX y)
    (hY : 0 < classYamabeFour oX.dimension_eq g)
    (hInt : Integrable (fun y => hilbertSchmidtSq (geometricChiralBlock g oX y (frame y)))
      (riemannianVolumeMeasure J X g))
    {e m γ : ℝ}
    (hComparison : chiralFrameEnergy g (fun y => geometricChiralBlock g oX y (frame y)) ≤
      e - m + γ) :
    m - γ ≤ e - sInf (geometricPositiveEnergies oM) := by
  have hMember := geometricEnergy_mem_of_pullback Φ hΦ g frame hY hInt
  have hInf := csInf_le (geometricPositiveEnergies_bddBelow oM) hMember
  linarith only [hInf, hComparison]

/-- A supplied positive same-type competitor with net gain strictly larger than
the current excess would lie below the fixed-type infimum. -/
theorem excludesStrictJointCompetitor
    {oM : ManifoldOrientation I M 4} {oX : ManifoldOrientation J X 4}
    (Φ : M ≃ₘ⟮I, J⟯ X) (hΦ : Φ.preservesOrientation oM oX)
    (g : SmoothRiemannianMetric J X) (frame : ∀ y, OrientedOrthonormalFrameAt g oX y)
    (hY : 0 < classYamabeFour oX.dimension_eq g)
    (hInt : Integrable (fun y => hilbertSchmidtSq (geometricChiralBlock g oX y (frame y)))
      (riemannianVolumeMeasure J X g))
    {e m γ : ℝ}
    (hComparison : chiralFrameEnergy g (fun y => geometricChiralBlock g oX y (frame y)) ≤
      e - m + γ)
    (hStrict : e - sInf (geometricPositiveEnergies oM) < m - γ) : False :=
  (not_lt_of_ge (jointCompetitorGain_le_excess Φ hΦ g frame hY hInt hComparison)) hStrict

end SmoothPoincare
