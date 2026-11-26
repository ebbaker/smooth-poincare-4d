import SmoothPoincare.Variational.BourReturnedBudgets

/-! # The physical Ricci margin below a regularized attained comparator

26 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance.
The positive exact comparator is supplied after fixed-type Weyl attainment.
-/

open DifferentialGeometry DifferentialGeometry.Geometry.Curvature DifferentialGeometry.Integral.Measure
  Filter FirstOrderTwistor MeasureTheory Set
open scoped ContDiff Manifold Topology

namespace SmoothPoincare.Bour

variable {E H M : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [T2Space M] [CompactSpace M] [Nonempty M] [BoundarylessManifold I M]
  {o : ManifoldOrientation I M 4}

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

set_option maxHeartbeats 800000 in
/-- A positive near-regularized-minimum start can be compared to one attained
Weyl minimum on the same smooth carrier. At every original time the Ricci
margin loses at most half of the comparator's gap when the starting error
is at most a quarter of the parameter times that gap. -/
theorem bourOriginal_attainedComparator_margin
    {P : Type*} [TopologicalSpace P] [PreconnectedSpace P] {p ε : ℝ} {start : P}
    (f : OriginalTrajectory o p start) (q : SignedCollarMetric o)
    (hp : 0 < p) (hp1 : p < 1)
    (hEuler : ∀ q' : SignedCollarMetric o, bourEuler q' = 16 * Real.pi ^ 2)
    (hAtt : q.energy .plus = sInf (geometricPositiveEnergies o))
    (hLevel : bourEnergy p (f.slice start) ≤ bourEnergy p q + ε)
    (hPin : bourEnergy p q + ε < (1-p) * (16 * Real.pi ^ 2))
    (hSmall : 4 * ε ≤ p * (4 * q.energy .plus - bourRicci q))
    (t : P) :
    0 < f.yamabe t ∧ bourRicci (f.slice t) ≤ (4 * q.energy .plus + bourRicci q) / 2 ∧
      bourScalar (f.slice t) ≤ bourScalar q + 24 * ε / p := by
  have hMargin : 0 < bourInitialMargin f := sub_pos.mpr (hLevel.trans_lt hPin)
  have hy := (bourStrictSublevel_yamabeFloor f hp hp1 hEuler hMargin t).2.1
  have he : q.energy .plus ≤ (f.slice t).energy .plus :=
    calc
      _ = _ := hAtt
      _ ≤ _ := bourInfimum_le_energy (f.slice t) hy
  have hF := (f.sublevel t).trans hLevel
  have hRF := hF
  rw [bourEnergy_eq_chiral_ricci, bourEnergy_eq_chiral_ricci] at hRF
  have hW := mul_le_mul_of_nonneg_left he (show 0 ≤ 1-p from (sub_pos.mpr hp1).le)
  refine ⟨hy, ?_, ?_⟩
  · apply (mul_le_mul_iff_right₀ hp).mp
    linarith only [hRF, hW, hSmall]
  · rw [bourEnergy_eq_chiral_scalar, bourEnergy_eq_chiral_scalar, hEuler, hEuler] at hF
    apply (sub_le_iff_le_add').mp
    apply (le_div_iff₀ hp).2
    linarith only [hF, he]

omit [BoundarylessManifold I M] in
/-- For either a fixed-flow extraction or a subsequent extraction of
stationary endpoints, a marked positive bubble on the original carrier
would require Ricci charge at least four times the same-type infimum. A
single fixed positive margin on the actual source sequence excludes it. -/
theorem bourNoMarkedBubble_of_ricciMargin
    (src : ℕ → SignedCollarMetric o) (bubble : SignedCollarMetric o)
    (hy : 0 < classYamabeFour o.dimension_eq bubble.metric) {d : ℝ}
    (hMargin : d < 4 * sInf (geometricPositiveEnergies o))
    (hSrc : ∀ᶠ n in atTop, bourRicci (src n) ≤ d) :
    ¬ 4 * bubble.energy .plus ≤ liminf (fun n => bourRicci (src n)) atTop := by
  intro hD
  have hUpper := liminf_le_of_frequently_le hSrc.frequently
    (isBoundedUnder_of_eventually_ge (Eventually.of_forall fun n => bourRicci_nonneg (src n)))
  linarith only [hD, hUpper, hMargin, bourInfimum_le_energy bubble hy]

end SmoothPoincare.Bour
