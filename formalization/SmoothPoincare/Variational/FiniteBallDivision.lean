import Mathlib.MeasureTheory.Covering.BesicovitchVectorSpace
import Mathlib.MeasureTheory.Measure.Real
import Mathlib.MeasureTheory.Measure.Haar.InnerProductSpace

/-! # Simultaneous approximate bisection by finite disjoint balls -/

open Filter MeasureTheory Metric Set
open scoped Topology BigOperators

namespace SmoothPoincare

/-- Assign the next piece to the side which increases the squared discrepancy
least. The four measures need not be proportional or have positive total mass. -/
theorem exists_subfamily_sq_discrepancy {ι : Type*} (s : Finset ι)
    (m : ι → Fin 4 → ℝ) :
    ∃ t ⊆ s, (∑ j, (2 * (∑ i ∈ t, m i j) - ∑ i ∈ s, m i j) ^ 2) ≤
      ∑ i ∈ s, ∑ j, m i j ^ 2 := by
  classical
  induction s using Finset.induction_on with
  | empty => exact ⟨∅, by simp, by simp⟩
  | @insert a s ha ih =>
    obtain ⟨t, hts, hbound⟩ := ih
    let d := fun j => 2 * (∑ i ∈ t, m i j) - ∑ i ∈ s, m i j
    have havg : (∑ j, (d j + m a j) ^ 2) + (∑ j, (d j - m a j) ^ 2) =
        2 * (∑ j, (d j) ^ 2) + 2 * ∑ j, m a j ^ 2 := by
      simp only [Finset.mul_sum, ← Finset.sum_add_distrib]
      exact Finset.sum_congr rfl fun j _ => by ring
    change (∑ j, (d j) ^ 2) ≤ _ at hbound
    by_cases h : (∑ j, (d j + m a j) ^ 2) ≤ (∑ j, (d j) ^ 2) + ∑ j, m a j ^ 2
    · refine ⟨insert a t, Finset.insert_subset_insert _ hts, ?_⟩
      simp only [Finset.sum_insert ha, Finset.sum_insert (fun h => ha (hts h) : a ∉ t)]
      have heq (j) : 2 * (m a j + ∑ i ∈ t, m i j) - (m a j + ∑ i ∈ s, m i j) =
          d j + m a j := by dsimp [d]; ring
      simp only [heq]
      linarith
    · refine ⟨t, hts.trans (Finset.subset_insert a s), ?_⟩
      simp only [Finset.sum_insert ha]
      have heq (j) : 2 * (∑ i ∈ t, m i j) - (m a j + ∑ i ∈ s, m i j) = d j - m a j := by
        dsimp [d]; ring
      simp only [heq]
      linarith

/-- On a finite disjoint packing, each charge of the selected union differs
from half the charge of the entire packing by at most one half of the
square root of the total quadratic mass. -/
theorem exists_bisecting_measured_subfamily {ι X : Type*} [MeasurableSpace X]
    (μ : Fin 4 → Measure X) [∀ j, IsFiniteMeasure (μ j)]
    (s : Finset ι) (D : ι → Set X) (hd : (s : Set ι).PairwiseDisjoint D)
    (hm : ∀ i ∈ s, MeasurableSet (D i)) :
    ∃ t ⊆ s, ∀ j, |(μ j).real (⋃ i ∈ t, D i) - (μ j).real (⋃ i ∈ s, D i) / 2| ≤
      Real.sqrt (∑ i ∈ s, ∑ l, ((μ l).real (D i)) ^ 2) / 2 := by
  classical
  obtain ⟨t, hts, hb⟩ := exists_subfamily_sq_discrepancy s (fun i j => (μ j).real (D i))
  refine ⟨t, hts, fun j => ?_⟩
  have hj := Finset.single_le_sum (f := fun j => (2 * (∑ i ∈ t, (μ j).real (D i)) -
    ∑ i ∈ s, (μ j).real (D i)) ^ 2) (fun j _ => sq_nonneg _) (Finset.mem_univ j)
  have ha := Real.sqrt_le_sqrt (hj.trans hb)
  rw [Real.sqrt_sq_eq_abs] at ha
  have hdt : (t : Set ι).PairwiseDisjoint D := fun _ hi _ hk hik => hd (hts hi) (hts hk) hik
  rw [measureReal_biUnion_finset (μ := μ j) (s := t) hdt (fun i hi => hm i (hts hi)),
    measureReal_biUnion_finset (μ := μ j) (s := s) hd hm]
  rw [abs_le] at ha ⊢
  constructor <;> linarith [ha.1, ha.2]

/-- Truncate the actual countable Besicovitch packing inside an open
four-dimensional chart. Every ball stays inside the prescribed open set and
has arbitrarily small mass for the dominating finite nonatomic measure. -/
theorem exists_fine_finite_ball_packing
    (ν : Measure (EuclideanSpace ℝ (Fin 4))) [IsFiniteMeasure ν] [NullSingletonClass ν]
    {U : Set (EuclideanSpace ℝ (Fin 4))} (hU : IsOpen U) {δ ε : ℝ} (hδ : 0 < δ) (hε : 0 < ε) :
    ∃ (s : Finset (EuclideanSpace ℝ (Fin 4))) (r : EuclideanSpace ℝ (Fin 4) → ℝ),
      (∀ x ∈ s, 0 < r x ∧ closedBall x (r x) ⊆ U ∧ ν.real (closedBall x (r x)) < δ) ∧
      (s : Set _).PairwiseDisjoint (fun x => closedBall x (r x)) ∧
      ν.real (U \ ⋃ x ∈ s, closedBall x (r x)) < ε := by
  classical
  let admissible := fun x : EuclideanSpace ℝ (Fin 4) =>
    {r : ℝ | closedBall x r ⊆ U ∧ ν (closedBall x r) < ENNReal.ofReal δ}
  have fine (x) (hx : x ∈ U) (R : ℝ) (hR : 0 < R) :
      (admissible x ∩ Ioo 0 R).Nonempty := by
    obtain ⟨V, hxV, hV, hν⟩ := ({x} : Set _).exists_isOpen_lt_of_lt (μ := ν) (ENNReal.ofReal δ)
      (by simpa using (ENNReal.ofReal_pos.mpr hδ))
    obtain ⟨a, ha, hB⟩ := Metric.nhds_basis_closedBall.mem_iff.mp
      ((hU.inter hV).mem_nhds (show x ∈ U ∩ V from ⟨hx, hxV (mem_singleton _)⟩))
    let r := min a (R / 2)
    have sub := (closedBall_subset_closedBall (min_le_left a (R / 2)) : closedBall x r ⊆ _).trans hB
    exact ⟨r, ⟨sub.trans inter_subset_left, (measure_mono (sub.trans inter_subset_right)).trans_lt hν⟩,
      lt_min ha (half_pos hR), (min_le_right a _).trans_lt (half_lt_self hR)⟩
  obtain ⟨t, r, ht, _, hball, hnull, hdis⟩ :=
    Besicovitch.exists_disjoint_closedBall_covering_ae ν admissible U fine (fun _ => 1)
      (fun _ _ => zero_lt_one)
  let : Countable t := ht.to_subtype
  let rem := fun F : Finset t => U \ ⋃ p ∈ F, closedBall (p : EuclideanSpace ℝ (Fin 4)) (r p)
  have hm (F : Finset t) : MeasurableSet (rem F) :=
    hU.measurableSet.diff (F.measurableSet_biUnion (fun _ _ => isClosed_closedBall.measurableSet))
  have hanti : Antitone rem := by
    intro F G hFG y hy
    refine ⟨hy.1, fun hyn => hy.2 ?_⟩
    obtain ⟨p, hp, hy'⟩ := mem_iUnion₂.mp hyn
    exact mem_iUnion₂.mpr ⟨p, hFG hp, hy'⟩
  have hinter : (⋂ F : Finset t, rem F) ⊆ U \ ⋃ x ∈ t, closedBall x (r x) := by
    intro y hy
    refine ⟨(mem_iInter.mp hy ∅).1, ?_⟩
    rintro hyn
    obtain ⟨x, hx, hxy⟩ := mem_iUnion₂.mp hyn
    let p : t := ⟨x, hx⟩
    exact (mem_iInter.mp hy {p}).2 (mem_iUnion₂.mpr ⟨p, by simp, hxy⟩)
  have hlim := tendsto_measure_iInter_atTop (μ := ν) (fun F => (hm F).nullMeasurableSet)
    hanti ⟨∅, measure_ne_top _ _⟩
  rw [measure_mono_null hinter hnull] at hlim
  obtain ⟨F, hF⟩ := (hlim.eventually_lt_const (ENNReal.ofReal_pos.mpr hε)).exists
  refine ⟨F.image Subtype.val, r, ?_, ?_, ?_⟩
  · rintro x hx
    obtain ⟨p, _, rfl⟩ := Finset.mem_image.mp hx
    obtain ⟨hp, hp'⟩ := hball p p.property
    exact ⟨hp'.1, hp.1, (ENNReal.toReal_lt_toReal (measure_ne_top _ _) ENNReal.ofReal_ne_top).mpr
      hp.2 |> fun h => by simpa [Measure.real_def, ENNReal.toReal_ofReal hδ.le] using h⟩
  · intro x hx y hy hxy
    obtain ⟨p, _, rfl⟩ := Finset.mem_image.mp hx
    obtain ⟨q, _, rfl⟩ := Finset.mem_image.mp hy
    exact hdis p.property q.property hxy
  · have heq : (U \ ⋃ x ∈ F.image Subtype.val, closedBall x (r x)) = rem F := by
      simp [rem]
    rw [heq, Measure.real_def]
    simpa [ENNReal.toReal_ofReal hε.le] using
      (ENNReal.toReal_lt_toReal (measure_ne_top _ _) ENNReal.ofReal_ne_top).mpr hF

/-- Simultaneously divide four finite nonatomic measures on an open Euclidean
four-dimensional region to arbitrary accuracy by the same finite family of
disjoint closed balls. This approximation uses no antipodal theorem. -/
theorem exists_four_measure_ball_division
    (μ : Fin 4 → Measure (EuclideanSpace ℝ (Fin 4))) [∀ j, IsFiniteMeasure (μ j)]
    [∀ j, NullSingletonClass (μ j)] {U : Set (EuclideanSpace ℝ (Fin 4))}
    (hU : IsOpen U) {ε : ℝ} (hε : 0 < ε) :
    ∃ (t : Finset (EuclideanSpace ℝ (Fin 4))) (r : EuclideanSpace ℝ (Fin 4) → ℝ),
      (∀ x ∈ t, 0 < r x ∧ closedBall x (r x) ⊆ U) ∧
      (t : Set _).PairwiseDisjoint (fun x => closedBall x (r x)) ∧
      ∀ j, |(μ j).real (⋃ x ∈ t, closedBall x (r x)) - (μ j).real U / 2| < ε := by
  classical
  let ν := ∑ j, μ j
  have hν (A : Set _) : ν.real A = ∑ j, (μ j).real A := by
    simp [ν, Measure.real_def, Measure.finsetSum_apply, ENNReal.toReal_sum]
  have hle (j) (A : Set _) : (μ j).real A ≤ ν.real A := by
    rw [hν]
    exact Finset.single_le_sum (fun _ _ => measureReal_nonneg) (Finset.mem_univ j)
  let : NullSingletonClass ν := ⟨fun x => by simp [ν, Measure.finsetSum_apply]⟩
  let δ := ε ^ 2 / (1 + ν.real univ)
  have hden : 0 < 1 + ν.real univ := by linarith [measureReal_nonneg (μ := ν) (s := univ)]
  have hδ : 0 < δ := div_pos (sq_pos_of_pos hε) hden
  obtain ⟨s, r, hs, hd, hrem⟩ := exists_fine_finite_ball_packing ν hU hδ hε
  let D := fun x => closedBall x (r x)
  let A := ⋃ x ∈ s, D x
  have hm (x) (_ : x ∈ s) : MeasurableSet (D x) := isClosed_closedBall.measurableSet
  have hA : MeasurableSet A := s.measurableSet_biUnion hm
  have hAU : A ⊆ U := iUnion₂_subset fun x hx => (hs x hx).2.1
  have hBudget : (∑ x ∈ s, ∑ j, ((μ j).real (D x)) ^ 2) ≤ ε ^ 2 := calc
    _ ≤ ∑ x ∈ s, ∑ j, δ * (μ j).real (D x) := by
      apply Finset.sum_le_sum
      intro x hx
      apply Finset.sum_le_sum
      intro j _
      rw [sq]
      exact mul_le_mul_of_nonneg_right ((hle j _).trans (hs x hx).2.2.le) measureReal_nonneg
    _ = δ * ν.real A := by
      rw [show ν.real A = ∑ x ∈ s, ν.real (D x) from measureReal_biUnion_finset hd hm]
      simp_rw [hν, Finset.mul_sum]
    _ ≤ δ * (1 + ν.real univ) := by
      apply mul_le_mul_of_nonneg_left _ hδ.le
      linarith [measureReal_mono (μ := ν) (subset_univ A)]
    _ = ε ^ 2 := div_mul_cancel₀ _ hden.ne'
  obtain ⟨t, ht, hb⟩ := exists_bisecting_measured_subfamily μ s D hd hm
  refine ⟨t, r, fun x hx => ⟨(hs x (ht hx)).1, (hs x (ht hx)).2.1⟩,
    fun x hx y hy hxy => hd (ht hx) (ht hy) hxy, fun j => ?_⟩
  have hroot := Real.sqrt_le_sqrt hBudget
  rw [Real.sqrt_sq hε.le] at hroot
  have hres := (hle j (U \ A)).trans_lt hrem
  rw [measureReal_sdiff hAU hA] at hres
  have hside := (abs_le.mp (hb j))
  change |(μ j).real (⋃ x ∈ t, D x) - (μ j).real U / 2| < ε
  change -_ ≤ _ - (μ j).real A / 2 ∧ _ - (μ j).real A / 2 ≤ _ at hside
  rw [abs_lt]
  constructor <;> linarith [hside.1, hside.2, measureReal_mono (μ := μ j) hAU]

end SmoothPoincare
