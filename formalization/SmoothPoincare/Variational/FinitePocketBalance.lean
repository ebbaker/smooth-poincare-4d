import SmoothPoincare.Variational.FinitePocketCaps
import SmoothPoincare.Variational.NativePocketMeasurableFrame

/-! # Finite marked caps from the relative signature integral -/

noncomputable section
open DifferentialGeometry DifferentialGeometry.Geometry.Curvature FirstOrderTwistor
open SectionsAndConnections Manifold Set Metric Filter MeasureTheory DifferentialGeometry.Integral.Measure
open scoped Manifold ContDiff Topology InnerProductSpace

namespace SmoothPoincare

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "I₄" => 𝓘(ℝ,E₄)
local notation "S₄" => StandardFourSphere
local notation "J" => ModelWithCorners.prod (𝓡 3) (𝓘(ℝ))
local instance : Fact (Module.finrank ℝ (EuclideanSpace ℝ (Fin 5)) = 4 + 1) := ⟨by simp⟩
private local instance : Nonempty S₄ := ⟨transportedCapNorthPole⟩

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M] [CompactSpace M]
  [Nonempty M] [PathConnectedSpace M] {o : ManifoldOrientation I M 4}

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

/-- On the original buffered disk, the chart-oriented construction of
measurable frames leaves a single relative integral balance for each time.
These balances give the positive marked caps and the complete signed costs. -/
theorem originalDisk_finite_positive_caps_of_balance (g : SignedCollarMetric o)
    (F : PartialDiffeomorph I₄ I E₄ M ∞) (p : ExactFaceSphere)
    {R B ℓ ρ η δ : ℝ} (hR : 1 < R) (hRB : R < B) (hBuffer : closedBall (0:E₄) B ⊆ F.source)
    (hℓ : 0 < ℓ) (hρ : 0 < ρ) (hFloor : ∀ y, ρ ≤ metricScalarAt g.metric y)
    (hη : 0 < η) (hδ : 0 < δ) (hGap : g.energy .plus + η < 2*(4*Real.pi^2))
    (oS : ManifoldOrientation I₄ S₄ 4) :
    ∃ (F' : PartialDiffeomorph I₄ I E₄ M ∞) (Rflat : SmoothRiemannianMetric I M)
      (r : ℝ) (hr : 0 < r) (hS : closedBall (0:E₄) (3*r) ⊆ F'.source),
      selectedChartDisk F' = selectedChartDisk F ∧
      (∀ x ∉ ball (0:E₄) (1/2), F' x = F x) ∧ r < δ ∧
      ((∀ s : Icc (0:ℝ) 1,
        let h := nativePocketPath F' g.metric Rflat hr hS s
        let f := nativePocketPath_measurableFrame F' g Rflat hr hS s
        let W := fun sg x => hilbertSchmidtSq (signedCollarWeylBlock o h f sg x)
        let μ := riemannianVolumeMeasure I M h
        let A := F' '' closedBall (0:E₄) (3*r)
        (∫ x in A, W .plus x ∂μ) - (∫ x in A, W .minus x ∂μ) =
          g.charge .plus A - g.charge .minus A) →
        NativePocketCapComparison g F F' p Rflat hr hS hℓ η oS) := by
  obtain ⟨F',Rflat,r,hr,hS,heq,hfix,hδr,hCap⟩ :=
    originalDisk_caps_of_signedRealization g F p hR hRB hBuffer hℓ hρ hFloor hη hδ hGap oS
  refine ⟨F',Rflat,r,hr,hS,heq,hfix,hδr,?_⟩
  intro hBalance
  obtain ⟨slice,hs⟩ := exists_nativePocketSignedSlices_of_balance F' g Rflat hr hS hBalance
  exact hCap ⟨slice,fun t => ⟨(hs t).1,(hs t).2.2.1⟩⟩

end SmoothPoincare
