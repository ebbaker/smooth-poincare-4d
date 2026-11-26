import SmoothPoincare.Heights.MorseHandleCounts
import DifferentialGeometry.Topology.Homology.BettiNumber
import DifferentialGeometry.Topology.Morse.Rearrangement.NegDual
import Mathlib.Analysis.Normed.Module.Connected

/-! # Dual Morse indices and the degree-zero rank bound -/

open AlgebraicTopology DifferentialGeometry.Topology DifferentialGeometry.Topology.Morse Set
open scoped ContDiff ContinuousMap Manifold

namespace SmoothPoincare

local notation "V₄" => EuclideanSpace ℝ (Fin 4)
local notation "V₅" => EuclideanSpace ℝ (Fin 5)
local notation "S₄" => Metric.sphere (0 : V₅) 1

variable {H M : Type} [TopologicalSpace H] {I : ModelWithCorners ℝ V₄ H}
  [TopologicalSpace M] [ChartedSpace H M]

/-- Reversing a nondegenerate critical point complements its index in the
actual Euclidean model. -/
theorem morseIndex_neg_add_four {f : M → ℝ} {p : M}
    (hp : IsNondegenerateCriticalPointAt I f p) :
    morseIndex I (fun x => -f x) p + morseIndex I f p = 4 := by
  let Q := hessianAt I f p
  have hRadical : Q.radical = ⊥ := by
    rw [QuadraticMap.radical_eq_ker_associated, ← LinearMap.separatingLeft_iff_ker_eq_bot]
    exact hp.2
  have hRank : Module.finrank ℝ V₄ = 4 := by simp
  have h := QuadraticForm.sigPos_add_sigNeg_add_radical (Q := Q)
  rw [hRadical, finrank_bot, add_zero, hRank] at h
  unfold morseIndex
  rw [NegDual.hessianAt_neg, sigNeg_neg]
  exact h

/-- Reversing a Morse function identifies its actual critical-point sets at
complementary indices. -/
theorem morseCriticalCount_neg {f : M → ℝ}
    (hnd : ∀ p, IsCriticalPointAt I f p → IsNondegenerateCriticalPointAt I f p)
    {j : ℕ} (hj : j ≤ 4) :
    morseCriticalCount I (fun x => -f x) j = morseCriticalCount I f (4 - j) := by
  unfold morseCriticalCount
  congr 1
  ext p
  constructor
  · intro hp
    have hc := (NegDual.isCriticalPointAt_neg_iff I f p).1 hp.1
    have hIndex := morseIndex_neg_add_four (hnd p hc)
    exact ⟨hc, by have := hp.2; omega⟩
  · intro hp
    have hIndex := morseIndex_neg_add_four (hnd p hp.1)
    exact ⟨(NegDual.isCriticalPointAt_neg_iff I f p).2 hp.1, by have := hp.2; omega⟩

/-- The actual generators at a fixed index in the degree-zero proof. -/
abbrev morseCriticalIndexSet (I : ModelWithCorners ℝ V₄ H) (f : M → ℝ) (j : ℕ) : Set M :=
  {p | IsCriticalPointAt I f p ∧ morseIndex I f p = j}

variable [IsManifold I ∞ M] [BoundarylessManifold I M] [CompactSpace M]

local notation "Crit[" f "," j "]" => morseCriticalIndexSet I f j

/-- A degree-zero rational cellular boundary on the actual critical-point
generators gives the lower end inequality once its cokernel is identified
with singular homology of the source. -/
theorem morseCriticalCount_zero_le_one_add_one_of_homologyZero (e : M ≃ₕ S₄)
    {f : M → ℝ} (hf : ContMDiff I 𝓘(ℝ, ℝ) ∞ f)
    (hnd : ∀ p, IsCriticalPointAt I f p → IsNondegenerateCriticalPointAt I f p)
    (boundary : (Crit[f, 1] →₀ ℚ) →ₗ[ℚ] (Crit[f, 0] →₀ ℚ))
    (hH₀ : ((Crit[f, 0] →₀ ℚ) ⧸ LinearMap.range boundary) ≃ₗ[ℚ]
      (((singularHomologyFunctor (ModuleCat ℚ) 0).obj (ModuleCat.of ℚ ℚ)).obj (TopCat.of M))) :
    morseCriticalCount I f 0 ≤ morseCriticalCount I f 1 + 1 := by
  classical
  have hFinite := DifferentialGeometry.Morse.finite_criticalPoints_of_isCompact hf
    isCompact_univ (fun _ _ => BoundarylessManifold.isInteriorPoint) (fun _ _ => mem_univ _) hnd
  let : Fintype (Crit[f, 0]) := (hFinite.subset (fun _ h => h.1)).fintype
  let : Fintype (Crit[f, 1]) := (hFinite.subset (fun _ h => h.1)).fintype
  have hSphereRank : 1 < Module.rank ℝ V₅ := by
    rw [← Module.finrank_eq_rank]
    simp
  let : PathConnectedSpace S₄ := isPathConnected_iff_pathConnectedSpace.1
    (isPathConnected_sphere hSphereRank (0 : V₅) (by norm_num))
  have hBetti : DifferentialGeometry.Homology.bettiNumber ℚ (TopCat.of M) 0 = 1 :=
    (DifferentialGeometry.Homology.bettiNumber_eq_of_homotopyEquiv ℚ
      (X := TopCat.of M) (Y := TopCat.of S₄) e 0).trans
      (DifferentialGeometry.Homology.bettiNumber_zero_of_pathConnectedSpace ℚ (TopCat.of S₄))
  have hQuotient : Module.finrank ℚ ((Crit[f, 0] →₀ ℚ) ⧸ LinearMap.range boundary) = 1 :=
    hH₀.finrank_eq.trans hBetti
  have hRank := (LinearMap.range boundary).finrank_quotient_add_finrank
  rw [hQuotient, Module.finrank_finsupp_self, Fintype.card_eq_nat_card, Nat.card_coe_set_eq] at hRank
  have hRange := boundary.finrank_range_le
  rw [Module.finrank_finsupp_self, Fintype.card_eq_nat_card, Nat.card_coe_set_eq] at hRange
  change 1 + Module.finrank ℚ (LinearMap.range boundary) = morseCriticalCount I f 0 at hRank
  change Module.finrank ℚ (LinearMap.range boundary) ≤ morseCriticalCount I f 1 at hRange
  omega

/-- The same degree-zero argument for the reversed function gives the upper
end inequality for the original function. -/
theorem morseCriticalCount_four_le_three_add_one_of_dual_homologyZero (e : M ≃ₕ S₄)
    {f : M → ℝ} (hf : ContMDiff I 𝓘(ℝ, ℝ) ∞ f)
    (hnd : ∀ p, IsCriticalPointAt I f p → IsNondegenerateCriticalPointAt I f p)
    (boundary : (Crit[(fun x => -f x), 1] →₀ ℚ) →ₗ[ℚ] (Crit[(fun x => -f x), 0] →₀ ℚ))
    (hH₀ : ((Crit[(fun x => -f x), 0] →₀ ℚ) ⧸ LinearMap.range boundary) ≃ₗ[ℚ]
      (((singularHomologyFunctor (ModuleCat ℚ) 0).obj (ModuleCat.of ℚ ℚ)).obj (TopCat.of M))) :
    morseCriticalCount I f 4 ≤ morseCriticalCount I f 3 + 1 := by
  have h := morseCriticalCount_zero_le_one_add_one_of_homologyZero e hf.neg
    (fun p hp => (NegDual.isNondegenerateCriticalPointAt_neg_iff I f p).2
      (hnd p ((NegDual.isCriticalPointAt_neg_iff I f p).1 hp))) boundary hH₀
  rw [morseCriticalCount_neg hnd (show 0 ≤ 4 by decide),
    morseCriticalCount_neg hnd (show 1 ≤ 4 by decide)] at h
  exact h

end SmoothPoincare
