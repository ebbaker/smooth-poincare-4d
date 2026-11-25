import Mathlib.MeasureTheory.Measure.Real
import Mathlib.MeasureTheory.Constructions.BorelSpace.Metric
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Positivity

/-!
# Chiral quantiles in a supplied physical distance

The metric instance is the physical distance for both source measures. For a
smooth oriented Riemannian four-manifold the measures to supply are the squared
positive chiral Hilbert–Schmidt norm and the squared full curvature tensor norm,
each integrated against physical volume.
-/

open MeasureTheory Set
open scoped BigOperators

namespace SmoothPoincare

/-- A nonempty finite family of annular masses has a member at most its budget
per member. -/
theorem exists_annulusMass_le_average (n : ℕ) (m : Fin n → ℝ) (C : ℝ)
    (hn : 0 < n) (_hm : ∀ j, 0 ≤ m j) (hC : (∑ j, m j) ≤ C) :
    ∃ j, m j ≤ C / (n : ℝ) := by
  by_contra! h
  have hnonempty : (Finset.univ : Finset (Fin n)).Nonempty :=
    ⟨⟨0, hn⟩, Finset.mem_univ _⟩
  have hsum : (∑ _j : Fin n, C / (n : ℝ)) < ∑ j, m j :=
    Finset.sum_lt_sum_of_nonempty hnonempty (fun j _ => h j)
  have hnReal : (n : ℝ) ≠ 0 := by positivity
  have havgSum : (∑ _j : Fin n, C / (n : ℝ)) = C := by
    calc
      (∑ _j : Fin n, C / (n : ℝ)) = (n : ℝ) * (C / (n : ℝ)) := by simp [nsmul_eq_mul]
      _ = C := by rw [mul_comm, div_mul_cancel₀ _ hnReal]
  exact (havgSum ▸ hsum).not_ge hC

section MetricMeasure

variable {X : Type*} [MetricSpace X] [MeasurableSpace X] [BorelSpace X]

/-- The open physical distance shell with strict inequalities at both faces. -/
def physicalAnnulus (x : X) (a b : ℝ) : Set X := Metric.ball x b \ Metric.closedBall x a

/-- Quantile of the total chiral mass over all centers in the physical distance. -/
structure IsChiralQuantile (chiral : Measure X) (θ r : ℝ) : Prop where
  radius_pos : 0 < r
  attains : ∃ x, chiral.real (Metric.ball x r) = θ * chiral.real univ
  mass_le : ∀ x, chiral.real (Metric.ball x r) ≤ θ * chiral.real univ
  mass_lt_of_lt : ∀ x s, s < r → chiral.real (Metric.ball x s) < θ * chiral.real univ

/-- At a median quantile, the entire complement of the open ball has at least
half the chiral mass, for every center including an inner attaining center. -/
theorem medianExterior_mass_ge_half (chiral : Measure X) [IsFiniteMeasure chiral]
    {b : ℝ} (median : IsChiralQuantile chiral (1 / 2) b) (x : X) :
    chiral.real univ / 2 ≤ chiral.real (Metric.ball x b)ᶜ := by
  rw [measureReal_compl Metric.isOpen_ball.measurableSet]
  linarith [median.mass_le x]

/-- One physical shell of ratio `q` between the quantiles has full mass at most
`C / n`. Both protected chiral sets are specified on its source. -/
theorem exists_lowMass_quantileAnnulus (chiral full : Measure X)
    [IsFiniteMeasure chiral] [IsFiniteMeasure full] {θ a b q C : ℝ}
    (inner : IsChiralQuantile chiral θ a) (median : IsChiralQuantile chiral (1 / 2) b)
    (hC : full.real univ ≤ C) {n : ℕ} (hn : 0 < n) (hq : 1 < q)
    (hfit : a * q ^ n ≤ b) :
    ∃ x : X, ∃ r : ℝ,
      a ≤ r ∧ r * q ≤ b ∧ chiral.real (Metric.ball x a) = θ * chiral.real univ ∧
      chiral.real univ / 2 ≤ chiral.real (Metric.ball x b)ᶜ ∧
      Disjoint (physicalAnnulus x r (r * q)) (Metric.ball x a) ∧
      Disjoint (physicalAnnulus x r (r * q)) (Metric.ball x b)ᶜ ∧
      full.real (physicalAnnulus x r (r * q)) ≤ C / (n : ℝ) := by
  obtain ⟨x, hx⟩ := inner.attains
  let R (j : ℕ) : ℝ := a * q ^ j
  have hR : Monotone R := fun _ _ h =>
    mul_le_mul_of_nonneg_left (pow_le_pow_right₀ hq.le h) inner.radius_pos.le
  let shell (j : Fin n) := physicalAnnulus x (R j) (R (j + 1 : ℕ))
  have hordered {j k : Fin n} (hjk : j < k) : Disjoint (shell j) (shell k) := by
    rw [Set.disjoint_left]
    intro y hj hk
    exact hk.2 (lt_of_lt_of_le hj.1 (hR (Nat.succ_le_of_lt hjk))).le
  have hdisj : Set.PairwiseDisjoint (↑(Finset.univ : Finset (Fin n))) shell := by
    intro j _ k _ hjk
    exact (lt_or_gt_of_ne hjk).elim hordered (fun h => (hordered h).symm)
  have hsum : (∑ j, full.real (shell j)) ≤ full.real univ :=
    sum_measureReal_le_measureReal_univ
      (fun _ _ => Metric.isOpen_ball.measurableSet.diff Metric.isClosed_closedBall.measurableSet)
      hdisj
  obtain ⟨j, hj⟩ := exists_annulusMass_le_average n (fun j => full.real (shell j)) C hn
    (fun _ => measureReal_nonneg) (hsum.trans hC)
  have ha : a ≤ R j := by simpa [R] using hR (Nat.zero_le (j : ℕ))
  have hstep : R (j + 1 : ℕ) = R j * q := by simp [R, pow_succ, mul_assoc]
  have hb : R j * q ≤ b := hstep ▸ (hR (Nat.succ_le_of_lt j.isLt)).trans hfit
  refine ⟨x, R j, ha, hb, hx, medianExterior_mass_ge_half chiral median x, ?_, ?_, ?_⟩
  · rw [Set.disjoint_left]
    intro y hy hyInner
    exact hy.2 (le_trans hyInner.le ha)
  · rw [Set.disjoint_left]
    intro y hy hyExterior
    exact hyExterior (lt_of_lt_of_le hy.1 hb)
  · simpa only [shell, hstep] using hj

end MetricMeasure

end SmoothPoincare
