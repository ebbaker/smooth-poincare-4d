import DifferentialGeometry.Topology.Homology.SphereEuler
import DifferentialGeometry.Topology.Morse.ClosedEulerCharacteristic
import DifferentialGeometry.Topology.Morse.CriticalFinite
import DifferentialGeometry.Topology.Morse.Strip.Defs

/-! # Critical point counts on a smooth homotopy four-sphere -/

open DifferentialGeometry.Topology DifferentialGeometry.Topology.Morse Set
open scoped BigOperators ContDiff ContinuousMap Manifold

namespace SmoothPoincare

local notation "V₄" => EuclideanSpace ℝ (Fin 4)
local notation "S₄" => Metric.sphere (0 : EuclideanSpace ℝ (Fin 5)) 1

variable {H M : Type} [TopologicalSpace H] {I : ModelWithCorners ℝ V₄ H}
  [TopologicalSpace M] [ChartedSpace H M]

/-- Cardinality of the actual critical points of index `j` on the source. -/
noncomputable def morseCriticalCount (I : ModelWithCorners ℝ V₄ H) (f : M → ℝ) (j : ℕ) : ℕ :=
  {p | IsCriticalPointAt I f p ∧ morseIndex I f p = j}.ncard

/-- An auxiliary function with the same critical points and indices has the
same counts in every index. -/
theorem morseCriticalCount_congr {f h : M → ℝ}
    (hCritical : ∀ p, IsCriticalPointAt I h p ↔ IsCriticalPointAt I f p)
    (hIndex : ∀ p, IsCriticalPointAt I f p → morseIndex I h p = morseIndex I f p) (j : ℕ) :
    morseCriticalCount I h j = morseCriticalCount I f j := by
  unfold morseCriticalCount
  congr 1
  ext p
  exact ⟨fun hp => ⟨(hCritical p).1 hp.1, (hIndex p ((hCritical p).1 hp.1)).symm.trans hp.2⟩,
    fun hp => ⟨(hCritical p).2 hp.1, (hIndex p hp.1).trans hp.2⟩⟩

variable [IsManifold I ∞ M] [BoundarylessManifold I M] [T2Space M] [CompactSpace M]

/-- The Euler characteristic of a smooth compact source homotopy equivalent
to the unit four-sphere gives the signed count of its actual Morse points. -/
theorem alternating_morseCriticalCounts_eq_two (e : M ≃ₕ S₄) {f : M → ℝ}
    (hf : ContMDiff I 𝓘(ℝ, ℝ) ∞ f)
    (hnd : ∀ p, IsCriticalPointAt I f p → IsNondegenerateCriticalPointAt I f p)
    (hinj : InjOn f {p | IsCriticalPointAt I f p}) :
    let n := morseCriticalCount I f
    (n 0 : ℤ) - n 1 + n 2 - n 3 + n 4 = 2 := by
  classical
  let n := morseCriticalCount I f
  have hFinite := DifferentialGeometry.Morse.finite_criticalPoints_of_isCompact hf
    isCompact_univ (fun _ _ => BoundarylessManifold.isInteriorPoint) (fun _ _ => mem_univ _) hnd
  let C := hFinite.toFinset
  have hEuler := (DifferentialGeometry.Morse.finiteHomologyType_and_eulerChar_of_finite_morse
    I ℚ hf hFinite hnd hinj).2
  change DifferentialGeometry.Homology.eulerChar ℚ (TopCat.of M) =
    ∑ p ∈ C, (-1 : ℤ) ^ morseIndex I f p at hEuler
  have hSphere : DifferentialGeometry.Homology.eulerChar ℚ (TopCat.of M) = 2 := by
    rw [DifferentialGeometry.Homology.eulerChar_eq_of_homotopyEquiv ℚ
      (X := TopCat.of M) (Y := TopCat.of S₄) e]
    norm_num [DifferentialGeometry.Homology.eulerChar_euclideanSphere ℚ 4]
  have hRange : (C : Set M).MapsTo (morseIndex I f) (Finset.range 5) := by
    intro p _
    have h := QuadraticForm.sigPos_add_sigNeg_add_radical (Q := hessianAt I f p)
    have hDim : Module.finrank ℝ V₄ = 4 := by simp
    rw [hDim] at h
    apply Finset.mem_range.mpr
    unfold morseIndex
    omega
  have hCard (j : ℕ) : (C.filter fun p => morseIndex I f p = j).card = n j := by
    have hSet : {p | IsCriticalPointAt I f p ∧ morseIndex I f p = j} =
        (C.filter (fun p => morseIndex I f p = j) : Set M) := by
      ext p
      simp [C]
    change _ = {p | IsCriticalPointAt I f p ∧ morseIndex I f p = j}.ncard
    rw [hSet, Set.ncard_coe_finset]
  change (n 0 : ℤ) - n 1 + n 2 - n 3 + n 4 = 2
  calc
    (n 0 : ℤ) - n 1 + n 2 - n 3 + n 4 =
        ∑ j ∈ Finset.range 5, (n j : ℤ) * (-1 : ℤ) ^ j := by
      norm_num [Finset.sum_range_succ] <;> ring
    _ = ∑ j ∈ Finset.range 5,
        ∑ p ∈ C.filter (fun p => morseIndex I f p = j), (-1 : ℤ) ^ morseIndex I f p := by
      apply Finset.sum_congr rfl
      intro j _
      calc
        (n j : ℤ) * (-1 : ℤ) ^ j =
            ∑ _p ∈ C.filter (fun p => morseIndex I f p = j), (-1 : ℤ) ^ j := by
          simp [hCard]
        _ = _ := by
          apply Finset.sum_congr rfl
          intro p hp
          rw [(Finset.mem_filter.mp hp).2]
    _ = ∑ p ∈ C, (-1 : ℤ) ^ morseIndex I f p := Finset.sum_fiberwise_of_maps_to hRange _
    _ = 2 := hEuler.symm.trans hSphere

/-- The integer odd-handle balance before establishing end-tree reductions. -/
theorem morseCriticalCount_oddBalance (e : M ≃ₕ S₄) {f : M → ℝ}
    (hf : ContMDiff I 𝓘(ℝ, ℝ) ∞ f)
    (hnd : ∀ p, IsCriticalPointAt I f p → IsNondegenerateCriticalPointAt I f p)
    (hinj : InjOn f {p | IsCriticalPointAt I f p}) :
    let n := morseCriticalCount I f
    ((n 1 : ℤ) - n 0 + 1) + ((n 3 : ℤ) - n 4 + 1) = n 2 := by
  have h := alternating_morseCriticalCounts_eq_two e hf hnd hinj
  dsimp only at h ⊢
  omega

/-- Once the two end-tree count inequalities are supplied, the available
reduced odd counts are nonnegative. The zero and one middle cases follow. -/
theorem morseCriticalCount_reducedOddCases (e : M ≃ₕ S₄) {f : M → ℝ}
    (hf : ContMDiff I 𝓘(ℝ, ℝ) ∞ f)
    (hnd : ∀ p, IsCriticalPointAt I f p → IsNondegenerateCriticalPointAt I f p)
    (hinj : InjOn f {p | IsCriticalPointAt I f p})
    (hLower : morseCriticalCount I f 0 ≤ morseCriticalCount I f 1 + 1)
    (hUpper : morseCriticalCount I f 4 ≤ morseCriticalCount I f 3 + 1) :
    let n := morseCriticalCount I f
    let l : ℤ := n 1 - (n 0 : ℤ) + 1
    let r : ℤ := n 3 - (n 4 : ℤ) + 1
    0 ≤ l ∧ 0 ≤ r ∧ l + r = n 2 ∧
      (n 2 = 0 → l = 0 ∧ r = 0) ∧
      (n 2 = 1 → (l = 0 ∧ r = 1) ∨ (l = 1 ∧ r = 0)) := by
  have h := morseCriticalCount_oddBalance e hf hnd hinj
  dsimp only at h ⊢
  omega

end SmoothPoincare
