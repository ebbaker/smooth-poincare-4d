import SmoothPoincare.PhysicalScales.CurvatureMeasure
import SmoothPoincare.Variational.Replacement
import FirstOrderTwistor.MeasureAccounting
import Mathlib.Topology.Instances.EReal.Lemmas

/-! # Repair surplus and a finite threshold witness

The actual total energy splits exactly into the marked regions and the
whole complement. For a nonempty family an upper bound on the sum of
the certified repair energies selects one member below the threshold.
-/

open scoped BigOperators ContDiff Manifold
open DifferentialGeometry DifferentialGeometry.Integral.Measure
open Filter FirstOrderTwistor Function MeasureTheory SectionsAndConnections

namespace SmoothPoincare

variable {E H M : Type*}
  [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  [CompactSpace M] [Nonempty M]

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

/-- The shifted excess bound and the inclusive finite threshold test for a
nonempty family of actual positive repairs on the original smooth type. -/
theorem geometricRepairThreshold
    (o : ManifoldOrientation I M 4) (g : SmoothRiemannianMetric I M)
    (frame : ∀ p, OrientedOrthonormalFrameAt g o p)
    (hY : 0 < classYamabeFour o.dimension_eq g)
    (hInt : Integrable (fun p => hilbertSchmidtSq (geometricChiralBlock g o p (frame p)))
      (riemannianVolumeMeasure I M g))
    (indices : Finset ℕ) (hNonempty : indices.Nonempty) (B : ℕ → Set M) (γ : ℕ → ℝ)
    (hMeas : ∀ j ∈ indices, MeasurableSet (B j))
    (hDisjoint : Set.Pairwise (↑indices) (AEDisjoint (geometricChiralMeasure o g frame) on B))
    (repair : ∀ j ∈ indices, SmoothRiemannianMetric I M)
    (repairFrame : ∀ j hj p, OrientedOrthonormalFrameAt (repair j hj) o p)
    (hRepairY : ∀ j hj, 0 < classYamabeFour o.dimension_eq (repair j hj))
    (hRepairInt : ∀ j hj, Integrable
      (fun p => hilbertSchmidtSq (geometricChiralBlock (repair j hj) o p (repairFrame j hj p)))
      (riemannianVolumeMeasure I M (repair j hj))) :
    let e := chiralFrameEnergy g (fun p => geometricChiralBlock g o p (frame p))
    let chiral := geometricChiralMeasure o g frame
    let r := chiral.real (⋃ j ∈ indices, B j)ᶜ
    let Γ := ∑ j ∈ indices, γ j
    let infimum := sInf (geometricPositiveEnergies o)
    (∀ j hj, chiralFrameEnergy (repair j hj)
        (fun p => geometricChiralBlock (repair j hj) o p (repairFrame j hj p)) ≤
      e - chiral.real (B j) + γ j) →
    infimum ≤ r + Γ + ((indices.card : ℝ) - 1) * (e - infimum) ∧
    (∀ T : ℝ, r + Γ + ((indices.card : ℝ) - 1) * (e - T) ≤ T →
      ∃ (j : ℕ) (hj : j ∈ indices),
        0 < classYamabeFour o.dimension_eq (repair j hj) ∧
        Integrable
          (fun p => hilbertSchmidtSq (geometricChiralBlock (repair j hj) o p (repairFrame j hj p)))
          (riemannianVolumeMeasure I M (repair j hj)) ∧
        chiralFrameEnergy (repair j hj)
          (fun p => geometricChiralBlock (repair j hj) o p (repairFrame j hj p)) ≤ T) := by
  intro e chiral r Γ infimum hCost
  have hReal {s : Set M} (hs : MeasurableSet s) :=
    geometricChiralMeasure_real_eq_setIntegral o g frame hInt hs
  let : IsFiniteMeasure chiral := geometricChiralMeasure_finite o g frame hInt
  have hSplit : e = (∑ j ∈ indices, chiral.real (B j)) + r :=
    (geometricChiralMeasure_real_univ o g frame hInt).symm.trans
      (measureReal_univ_eq_sum_add_compl chiral indices B hMeas hDisjoint)
  have hMass := geometricRepairedMass_le_excess_sum o indices B γ g frame hY hInt
    repair repairFrame hRepairY hRepairInt (by
      intro j hj
      dsimp only
      rw [← hReal (hMeas j hj)]
      exact hCost j hj)
  have hMassReal : (∑ j ∈ indices, chiral.real (B j)) ≤
      (indices.card : ℝ) * (e - infimum) + Γ := by
    rw [Finset.sum_congr rfl (fun j hj => hReal (hMeas j hj))]
    exact hMass
  constructor
  · linarith only [hSplit, hMassReal]
  · intro T hThreshold
    have hSum : (∑ j ∈ indices, (e - chiral.real (B j) + γ j)) =
        ((indices.card : ℝ) - 1) * e + r + Γ := by
      simp only [Finset.sum_add_distrib, Finset.sum_sub_distrib, Finset.sum_const, nsmul_eq_mul]
      linarith only [hSplit]
    have hMaxSum : (∑ j ∈ indices, (e - chiral.real (B j) + γ j)) ≤
        (indices.card : ℝ) * T := by
      rw [hSum]
      linarith only [hThreshold]
    have hPick : ∃ j ∈ indices, e - chiral.real (B j) + γ j ≤ T := by
      by_contra! hAbove
      have hAboveSum := Finset.sum_lt_sum_of_nonempty hNonempty hAbove
      rw [Finset.sum_const, nsmul_eq_mul] at hAboveSum
      exact (not_lt_of_ge hMaxSum) hAboveSum
    obtain ⟨j, hj, hjT⟩ := hPick
    exact ⟨j, hj, hRepairY j hj, hRepairInt j hj, (hCost j hj).trans hjT⟩

/-- The lower limit of the full repair surplus bounds the fixed-type infimum
even when the cardinality varies without a uniform bound. The scores are
real, and their lower limit is taken in the extended reals. -/
theorem geometricRepairLiminf
    (o : ManifoldOrientation I M 4) (g : ℕ → SmoothRiemannianMetric I M)
    (frame : ∀ i p, OrientedOrthonormalFrameAt (g i) o p)
    (hY : ∀ i, 0 < classYamabeFour o.dimension_eq (g i))
    (hInt : ∀ i, Integrable
      (fun p => hilbertSchmidtSq (geometricChiralBlock (g i) o p (frame i p)))
      (riemannianVolumeMeasure I M (g i)))
    (indices : ℕ → Finset ℕ) (B : ℕ → ℕ → Set M) (γ : ℕ → ℕ → ℝ) :
    let e := fun i => chiralFrameEnergy (g i) (fun p => geometricChiralBlock (g i) o p (frame i p))
    let chiral := fun i => geometricChiralMeasure o (g i) (frame i)
    let r := fun i => (chiral i).real (⋃ j ∈ indices i, B i j)ᶜ
    let Γ := fun i => ∑ j ∈ indices i, γ i j
    let infimum := sInf (geometricPositiveEnergies o)
    (∀ᶠ i in atTop, (indices i).Nonempty ∧
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
    (infimum : EReal) ≤ liminf (fun i =>
      ((r i + Γ i + (((indices i).card : ℝ) - 1) * (e i - infimum) : ℝ) : EReal)) atTop := by
  intro e chiral r Γ infimum hRepairs
  apply le_liminf_of_le (by isBoundedDefault)
  filter_upwards [hRepairs] with i hi
  obtain ⟨hNonempty, hMeas, hDisjoint, repair, repairFrame, hRepair⟩ := hi
  apply EReal.coe_le_coe_iff.mpr
  exact (geometricRepairThreshold o (g i) (frame i) (hY i) (hInt i) (indices i) hNonempty
    (B i) (γ i) hMeas hDisjoint repair repairFrame (fun j hj => (hRepair j hj).1)
    (fun j hj => (hRepair j hj).2.1) (fun j hj => (hRepair j hj).2.2)).1

end SmoothPoincare
