import SmoothPoincare.Variational.TerminalVolumeRetention
import SmoothPoincare.Variational.TerminalChargeTransferPointed
import SmoothPoincare.PhysicalScales.TerminalVolumeEscape

/-! # Noncompactness of the pointed limit of the actual terminal slices -/

open DifferentialGeometry DifferentialGeometry.CheegerGromovCompactness
  DifferentialGeometry.Geometry.Curvature DifferentialGeometry.Geometry.Metric
  DifferentialGeometry.Integral.Measure DifferentialGeometry.PDE.RicciFlow
  MeasureTheory Set Filter Manifold FirstOrderTwistor
open scoped Manifold ContDiff Topology ENNReal

noncomputable section
namespace SmoothPoincare

universe u uE uH

variable {E : Type uE} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
  [FiniteDimensional ℝ E] {H : Type uH} [TopologicalSpace H]
  {I : ModelWithCorners ℝ E H} [I.Boundaryless] {D : RealTimeInterval}
  {M : ℕ → Type u} [∀ i, TopologicalSpace (M i)] [∀ i, ChartedSpace H (M i)]
  [∀ i, IsManifold I ∞ (M i)] [∀ i, T2Space (M i)] [∀ i, CompactSpace (M i)]
  [∀ i, T2Space (TangentBundle I (M i))]

private local instance : CompleteSpace E := FiniteDimensional.complete ℝ E
private local instance {X : Type*} [TopologicalSpace X] : MeasurableSpace X := borel X
private local instance {X : Type*} [TopologicalSpace X] : BorelSpace X := ⟨rfl⟩

attribute [local instance] PointedRiemannianManifold.topology PointedRiemannianManifold.charted
  PointedRiemannianManifold.smooth PointedRiemannianManifold.t2
  PointedRiemannianManifold.sigmaCompact PointedRiemannianManifold.t2TangentBundle

variable [∀ i, BoundarylessManifold I (M i)] [∀ i, PreconnectedSpace (M i)]

/-- Divergent initial volumes and a common curvature budget on the actual
closed solutions force every such pointed terminal limit to be noncompact. -/
theorem ricciFlow_terminalPointed_noncompact_of_initialVolume
    (S : ∀ i, SolutionOn (I := I) (M := M i) D) (hS : ∀ i, IsSolutionOn (S i))
    (o : ∀ i, ManifoldOrientation I (M i) 4) (p : ∀ i, M i) {τ A : ℝ}
    (hτ : 0 < τ) (hA : 0 ≤ A)
    (hCarrier : Icc 0 τ ⊆ D.carrier) (hRegular : Ioo 0 τ ⊆ D.regular)
    {X : PointedRiemannianManifold.{u,uE,uH} I} {φ : ℕ → ℕ}
    (F : PointedRiemannianConvergenceMaps (terminalPointedFlowSequence S p τ) X φ)
    (C : MetricConvergenceData F)
    (hcanonical : ∀ i, C.domain i = CanonicalMetricCompactness.canonicalSourceData F i)
    (hφ : Tendsto φ atTop atTop) :
    let μ := fun i t => riemannianVolumeMeasure I (M i) ((S i).family.metric t)
    (∀ i, ∀ s ∈ Ioo 0 τ, Real.sqrt (∫ x, testedEulerCurvatureNorm
      ((S i).family.metric s) x ^ 2 ∂(μ i s)) ≤ A) →
    Tendsto (fun i => ((μ i 0) univ).toReal) atTop atTop → ¬ CompactSpace X.M := by
  intro μ hBudget hInitial
  let (i : ℕ) : Nonempty (M i) := ⟨p i⟩
  have hVol := ricciFlow_terminal_volume_tendsto_atTop S hS o hτ hA hCarrier hRegular hBudget hInitial
  exact pointedTerminal_noncompact_of_realVolume_escape F C hcanonical
    (fun i => (ConnectedSpace.mk (toPreconnectedSpace := (inferInstance : PreconnectedSpace (M (φ i))))
      (⟨p (φ i)⟩ : Nonempty (M (φ i))))) (hVol.comp hφ)

end SmoothPoincare
