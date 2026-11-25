import FirstOrderTwistor.SpinLevelSet
import FirstOrderTwistor.SpinAnnularGreen
import DifferentialGeometry.Analysis.Integration.Measure.Chart.Null

/-! # Joint-zero derivative locality in physical metric volume

Prepared for Edward B. Baker III with OpenAI Codex assistance, 25 November 2026.
The derivatives are computed in one supplied spin gauge on an open chart.
The compact physical set may contain the supports of a cutoff and its gradient.
-/

namespace FirstOrderTwistor

open DifferentialGeometry DifferentialGeometry.Integral.Measure Set MeasureTheory
open scoped ContDiff Manifold

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ EuclideanFour H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M] [SigmaCompactSpace M]

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

private theorem spinModelHaar_null {m n : MeasurableSpace EuclideanFour}
    (hm : m = n) [@BorelSpace EuclideanFour _ n]
    (μ : @Measure EuclideanFour m) (ν : @Measure EuclideanFour n)
    [@Measure.IsAddHaarMeasure EuclideanFour _ _ m μ]
    [@Measure.IsAddHaarMeasure EuclideanFour _ _ n ν] {N : Set EuclideanFour}
    (hN : ν N = 0) : μ N = 0 := by
  subst m
  exact Measure.absolutelyContinuous_isAddHaarMeasure μ ν hN

/-- Transfer a coordinate almost-everywhere statement onto a compact physical
subset of the chart. The chart and the Euclidean Haar measures may have
different normalizations. -/
theorem spinMetric_ae_of_chartVolume_ae
    (g : SmoothRiemannianMetric I M) (p : M) {K : Set M} (hK : IsCompact K)
    (hKs : K ⊆ (chartAt H p).source) {Ω : Set EuclideanFour} (hΩ : MeasurableSet Ω)
    (hKΩ : ∀ x ∈ K, extChartAt I p x ∈ Ω) {P : EuclideanFour → Prop}
    (hP : ∀ᵐ y ∂volume.restrict Ω, P y) :
    ∀ᵐ x ∂(riemannianVolumeMeasure I M g).restrict K, P (extChartAt I p x) := by
  rw [ae_iff, Measure.restrict_apply' hΩ] at hP
  rw [riemannianVolumeMeasure_restrict_eq_chartLocalMeasure_restrict g p hK hKs,
    ae_iff, Measure.restrict_apply' hK.measurableSet]
  apply DifferentialGeometry.Geometry.Measure.chartLocalMeasure_null_of_chart_image_null
  apply spinModelHaar_null (BorelSpace.measurable_eq (α := EuclideanFour)).symm
    (modelHaar (E := EuclideanFour)) (volume : Measure EuclideanFour)
  apply measure_mono_null _ hP
  rintro _ ⟨x, ⟨⟨hx, hxK⟩, _⟩, rfl⟩
  exact ⟨hx, hKΩ x hxK⟩

/-- For C¹ spin fields represented on an open annulus, the physical derivative
density vanishes almost everywhere on the simultaneous zero set in the marked
compact patch. The frame directions and connection may vary across the patch. -/
theorem spinMetric_jointZero_gradientSq_ae
    {A B V : Type*} [NormedAddCommGroup V] [NormedSpace ℝ V]
    (g : SmoothRiemannianMetric I M) (p : M) {K : Set M} (hK : IsCompact K)
    (hKs : K ⊆ (chartAt H p).source) {Ω : Set EuclideanFour} (hΩ : IsOpen Ω)
    (hKΩ : ∀ x ∈ K, extChartAt I p x ∈ Ω)
    (fields : Finset A) (directions : Finset B) (ψ : A → EuclideanFour → V)
    (frame : B → EuclideanFour → EuclideanFour)
    (connection : B → EuclideanFour → V →L[ℝ] V)
    (hψ : ∀ a ∈ fields, ContDiffOn ℝ 1 (ψ a) Ω)
    (S Q : M → ℝ)
    (hS : ∀ x ∈ K, S x = ∑ a ∈ fields, ‖ψ a (extChartAt I p x)‖ ^ 2)
    (hQ : ∀ x ∈ K, Q x = ∑ a ∈ fields, ∑ j ∈ directions,
      ‖fderiv ℝ (ψ a) (extChartAt I p x) (frame j (extChartAt I p x)) +
        connection j (extChartAt I p x) (ψ a (extChartAt I p x))‖ ^ 2) :
    ∀ᵐ x ∂(riemannianVolumeMeasure I M g).restrict K, S x = 0 → Q x = 0 := by
  have hLocal := euclidean_spinJointZero_gradientSq_ae_on_open hΩ volume
    Measure.AbsolutelyContinuous.rfl fields directions ψ frame connection hψ
  have hPhysical := spinMetric_ae_of_chartVolume_ae g p hK hKs hΩ.measurableSet hKΩ hLocal
  filter_upwards [hPhysical, ae_restrict_mem hK.measurableSet] with x hx hxK
  rw [hS x hxK, hQ x hxK]
  exact hx

end FirstOrderTwistor
