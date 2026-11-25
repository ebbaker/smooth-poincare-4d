import SmoothPoincare.Variational.Basic

/-! # Independent replacements at a fixed-type infimum

Each repair gives one comparison with the same admissible infimum. The cost
bound compares that repair to the original exterior and includes the net
splice and cap cost.
-/

open scoped BigOperators Manifold ContDiff

namespace SmoothPoincare

/-- A finite family of individual admissible repairs bounds the removed mass. -/
theorem repairedMass_le_excess_sum (J : Finset ℕ) (A : Set ℝ) (e : ℝ) (m γ c : ℕ → ℝ)
    (hA : BddBelow A) (_he : e ∈ A) (hc : ∀ j ∈ J, c j ∈ A)
    (hcost : ∀ j ∈ J, c j ≤ e - m j + γ j) :
    (∑ j ∈ J, m j) ≤ (J.card : ℝ) * (e - sInf A) + ∑ j ∈ J, γ j := by
  calc
    (∑ j ∈ J, m j) ≤ ∑ j ∈ J, (e - sInf A + γ j) := by
      apply Finset.sum_le_sum
      intro j hj
      linarith only [csInf_le hA (hc j hj), hcost j hj]
    _ = _ := by rw [Finset.sum_add_distrib, Finset.sum_const, nsmul_eq_mul]

open DifferentialGeometry DifferentialGeometry.Integral.Measure MeasureTheory
open FirstOrderTwistor SectionsAndConnections

section Geometric

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

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩
private local instance : MeasurableSpace X := borel X
private local instance : BorelSpace X := ⟨rfl⟩

/-- The finite inequality for actual smooth metrics, with each repair pulled
back to the original oriented smooth type via its supplied marking. -/
theorem geometricRepairedMass_le_excess_sum_of_pullback
    {oM : ManifoldOrientation I M 4} {oX : ManifoldOrientation J X 4}
    (indices : Finset ℕ) (B : ℕ → Set M) (γ : ℕ → ℝ)
    (g : SmoothRiemannianMetric I M) (frame : ∀ p, OrientedOrthonormalFrameAt g oM p)
    (hY : 0 < classYamabeFour oM.dimension_eq g)
    (hInt : Integrable (fun p => hilbertSchmidtSq (geometricChiralBlock g oM p (frame p)))
      (riemannianVolumeMeasure I M g))
    (repair : ∀ j ∈ indices, SmoothRiemannianMetric J X)
    (repairFrame : ∀ j hj p, OrientedOrthonormalFrameAt (repair j hj) oX p)
    (mark : ∀ j ∈ indices, M ≃ₘ⟮I, J⟯ X)
    (hMark : ∀ j hj, (mark j hj).preservesOrientation oM oX)
    (hRepairY : ∀ j hj, 0 < classYamabeFour oX.dimension_eq (repair j hj))
    (hRepairInt : ∀ j hj, Integrable (fun p =>
      hilbertSchmidtSq (geometricChiralBlock (repair j hj) oX p (repairFrame j hj p)))
      (riemannianVolumeMeasure J X (repair j hj))) :
    let W := fun p => geometricChiralBlock g oM p (frame p)
    let e := chiralFrameEnergy g W
    let m := fun j => ∫ p in B j, hilbertSchmidtSq (W p) ∂riemannianVolumeMeasure I M g
    (∀ j hj, chiralFrameEnergy (repair j hj)
        (fun p => geometricChiralBlock (repair j hj) oX p (repairFrame j hj p)) ≤
      e - m j + γ j) →
    (∑ j ∈ indices, m j) ≤
      (indices.card : ℝ) * (e - sInf (geometricPositiveEnergies oM)) + ∑ j ∈ indices, γ j := by
  classical
  dsimp only
  intro hCost
  let c := fun j => if hj : j ∈ indices then
    chiralFrameEnergy (repair j hj)
      (fun p => geometricChiralBlock (repair j hj) oX p (repairFrame j hj p)) else 0
  refine repairedMass_le_excess_sum indices (geometricPositiveEnergies oM) _ _ γ c
    (geometricPositiveEnergies_bddBelow oM) ⟨g, frame, hY, hInt, rfl⟩ ?_ ?_
  · intro j hj
    simpa only [c, dite_eq_left hj] using
      geometricEnergy_mem_of_pullback (mark j hj) (hMark j hj) (repair j hj)
        (repairFrame j hj) (hRepairY j hj) (hRepairInt j hj)
  · intro j hj
    simpa only [c, dite_eq_left hj] using hCost j hj

/-- The fixed-type inequality when the individual repairs are already smooth
metrics on the original oriented manifold. -/
theorem geometricRepairedMass_le_excess_sum
    (o : ManifoldOrientation I M 4) (indices : Finset ℕ) (B : ℕ → Set M) (γ : ℕ → ℝ)
    (g : SmoothRiemannianMetric I M) (frame : ∀ p, OrientedOrthonormalFrameAt g o p)
    (hY : 0 < classYamabeFour o.dimension_eq g)
    (hInt : Integrable (fun p => hilbertSchmidtSq (geometricChiralBlock g o p (frame p)))
      (riemannianVolumeMeasure I M g))
    (repair : ∀ j ∈ indices, SmoothRiemannianMetric I M)
    (repairFrame : ∀ j hj p, OrientedOrthonormalFrameAt (repair j hj) o p)
    (hRepairY : ∀ j hj, 0 < classYamabeFour o.dimension_eq (repair j hj))
    (hRepairInt : ∀ j hj, Integrable (fun p =>
      hilbertSchmidtSq (geometricChiralBlock (repair j hj) o p (repairFrame j hj p)))
      (riemannianVolumeMeasure I M (repair j hj))) :
    let W := fun p => geometricChiralBlock g o p (frame p)
    let e := chiralFrameEnergy g W
    let m := fun j => ∫ p in B j, hilbertSchmidtSq (W p) ∂riemannianVolumeMeasure I M g
    (∀ j hj, chiralFrameEnergy (repair j hj)
        (fun p => geometricChiralBlock (repair j hj) o p (repairFrame j hj p)) ≤
      e - m j + γ j) →
    (∑ j ∈ indices, m j) ≤
      (indices.card : ℝ) * (e - sInf (geometricPositiveEnergies o)) + ∑ j ∈ indices, γ j := by
  exact geometricRepairedMass_le_excess_sum_of_pullback
    (oM := o) (oX := o) indices B γ g frame hY hInt repair repairFrame
    (fun _ _ => Diffeomorph.refl I M ∞) (fun _ _ => Diffeomorph.preservesOrientation_refl o)
    hRepairY hRepairInt

end Geometric

end SmoothPoincare
