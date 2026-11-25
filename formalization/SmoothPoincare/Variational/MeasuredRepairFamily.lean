import SmoothPoincare.Variational.Replacement
import SmoothPoincare.Variational.RepairResidual
import SmoothPoincare.PhysicalScales.CurvatureMeasure
import FirstOrderTwistor.MeasureAccounting

/-! # Independent repairs with a measured complement

The physical volume of the original metric is weighted by its own squared
chiral curvature density. Finite additivity charges the entire complement
of the regions used in the repair estimate.
-/

open scoped BigOperators ContDiff Manifold
open DifferentialGeometry DifferentialGeometry.Integral.Measure
open Filter FirstOrderTwistor Function MeasureTheory SectionsAndConnections

namespace SmoothPoincare

variable {E H M : Type*}
  [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M] [CompactSpace M]

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

/-- At a fixed tolerance, actual individual repairs on the original smooth
type give the limiting bound from their combined cost and the full complement.
The regions may overlap on null sets for the physical chiral measure. -/
theorem geometricEnergyBoundOfRepairFamily [I.Boundaryless] [Nonempty M]
    (o : ManifoldOrientation I M 4) (g : ℕ → SmoothRiemannianMetric I M)
    (frame : ∀ i p, OrientedOrthonormalFrameAt (g i) o p)
    (hY : ∀ i, 0 < classYamabeFour o.dimension_eq (g i))
    (hInt : ∀ i, Integrable
      (fun p => hilbertSchmidtSq (geometricChiralBlock (g i) o p (frame i p)))
      (riemannianVolumeMeasure I M (g i)))
    (indices : ℕ → Finset ℕ) (B : ℕ → ℕ → Set M) (γ : ℕ → ℕ → ℝ)
    (K : ℕ) (b remainderBound : ℝ) :
    let e := fun i => chiralFrameEnergy (g i) (fun p => geometricChiralBlock (g i) o p (frame i p))
    let chiral := fun i => geometricChiralMeasure o (g i) (frame i)
    let infimum := sInf (geometricPositiveEnergies o)
    Tendsto e atTop (nhds infimum) →
    (∀ᶠ i in atTop, (indices i).card ≤ K ∧
      (∀ j ∈ indices i, MeasurableSet (B i j)) ∧
      Set.Pairwise (↑(indices i)) (AEDisjoint (chiral i) on B i) ∧
      ∃ (repair : ∀ j ∈ indices i, SmoothRiemannianMetric I M)
        (repairFrame : ∀ j hj p, OrientedOrthonormalFrameAt (repair j hj) o p),
        ∀ j hj, 0 < classYamabeFour o.dimension_eq (repair j hj) ∧
          Integrable (fun p =>
            hilbertSchmidtSq (geometricChiralBlock (repair j hj) o p (repairFrame j hj p)))
            (riemannianVolumeMeasure I M (repair j hj)) ∧
          chiralFrameEnergy (repair j hj)
            (fun p => geometricChiralBlock (repair j hj) o p (repairFrame j hj p)) ≤
            e i - (chiral i).real (B i j) + γ i j) →
    (∀ ε : ℝ, 0 < ε → ∀ᶠ i in atTop,
      (∑ j ∈ indices i, γ i j) ≤ b + ε ∧
      (chiral i).real (⋃ j ∈ indices i, B i j)ᶜ ≤ remainderBound + ε) →
    infimum ≤ b + remainderBound := by
  intro e chiral infimum hLimit hRepairs hBounds
  refine energyBoundOfRepairFamily e (fun i => ∑ j ∈ indices i, γ i j)
    (fun i => (chiral i).real (⋃ j ∈ indices i, B i j)ᶜ) (fun i => (indices i).card)
    K infimum b remainderBound hLimit ?_ hBounds
  filter_upwards [hRepairs] with i hi
  obtain ⟨hCard, hMeas, hDisj, repair, repairFrame, hRepair⟩ := hi
  have hMem : e i ∈ geometricPositiveEnergies o := ⟨g i, frame i, hY i, hInt i, rfl⟩
  refine ⟨hCard, csInf_le (geometricPositiveEnergies_bddBelow o) hMem, ?_⟩
  have hReal {s : Set M} (hs : MeasurableSet s) :=
    geometricChiralMeasure_real_eq_setIntegral o (g i) (frame i) (hInt i) hs
  have hMass := geometricRepairedMass_le_excess_sum o (indices i) (B i) (γ i)
    (g i) (frame i) (hY i) (hInt i) repair repairFrame
    (fun j hj => (hRepair j hj).1) (fun j hj => (hRepair j hj).2.1) (by
      intro j hj
      dsimp only
      rw [← hReal (hMeas j hj)]
      exact (hRepair j hj).2.2)
  have hMassReal : (∑ j ∈ indices i, (chiral i).real (B i j)) ≤
      ((indices i).card : ℝ) * (e i - infimum) + ∑ j ∈ indices i, γ i j := by
    rw [Finset.sum_congr rfl (fun j hj => hReal (hMeas j hj))]
    exact hMass
  let : IsFiniteMeasure (chiral i) := geometricChiralMeasure_finite o (g i) (frame i) (hInt i)
  calc
    _ = (chiral i).real Set.univ :=
      (geometricChiralMeasure_real_univ o (g i) (frame i) (hInt i)).symm
    _ = (∑ j ∈ indices i, (chiral i).real (B i j)) +
        (chiral i).real (⋃ j ∈ indices i, B i j)ᶜ :=
      measureReal_univ_eq_sum_add_compl (chiral i) (indices i) (B i) hMeas hDisj
    _ ≤ _ := add_le_add hMassReal le_rfl

end SmoothPoincare
