import DifferentialGeometry.Geometry.Metric.Distance.Ball
import DifferentialGeometry.Geometry.Metric.Distance.LocalBall
import DifferentialGeometry.Analysis.Integration.Measure.Riemannian.Naturality
import Mathlib.MeasureTheory.Measure.Real

/-! # Infinite physical volume from a uniform unit-ball floor

26 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance.
Actual serving settings were unavailable. Edition 06, E51, Routes 12 and 13.
-/

set_option autoImplicit false

open DifferentialGeometry DifferentialGeometry.Geometry DifferentialGeometry.Geometry.Riemannian
  DifferentialGeometry.Integral.Measure MeasureTheory Set
open scoped ContDiff ENNReal Manifold

namespace SmoothPoincare.Bour

noncomputable section

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M] [SigmaCompactSpace M]

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

/-- On a noncompact Riemannian manifold with compact closed radius-two
balls, a common positive unit-ball volume forces infinite total physical
volume. Every finite packing is constructed on the original metric space. -/
theorem bourPointedVolume_eq_top_of_unit_ball_lower
    (g : SmoothRiemannianMetric I M) (hNoncompact : ¬ IsCompact (univ : Set M))
    (hClosed : ∀ x : M, IsCompact (riemannianClosedBallOf g x 2))
    {c : ℝ} (hc : 0 < c)
    (hVol : ∀ x : M, c ≤ (riemannianVolumeMeasure I M g).real (riemannianBallOf g x 1)) :
    riemannianVolumeMeasure I M g univ = ⊤ := by
  classical
  let B := fun x : M => riemannianBallOf g x 1
  have hPacks : ∀ n : ℕ, ∃ s : Finset M, s.card = n ∧ (↑s : Set M).PairwiseDisjoint B := by
    intro n
    induction n with
    | zero => exact ⟨∅, by simp, by simp⟩
    | succ n ih =>
      obtain ⟨s, hs, hSep⟩ := ih
      let K := ⋃ y ∈ s, riemannianClosedBallOf g y 2
      have hK : IsCompact K := s.isCompact_biUnion fun y _ => hClosed y
      have hOutside : ∃ x : M, x ∉ K := by
        by_contra! hAll
        exact hNoncompact ((eq_univ_of_forall hAll) ▸ hK)
      obtain ⟨x, hx⟩ := hOutside
      have hFar (y : M) (hy : y ∈ s) : x ∉ riemannianClosedBallOf g y 2 :=
        fun h => hx (mem_iUnion.2 ⟨y, mem_iUnion.2 ⟨hy, h⟩⟩)
      have hxNew : x ∉ s := by
        intro hOld
        apply hFar x hOld
        change riemannianEDistOf g x x ≤ ENNReal.ofReal 2
        rw [riemannianEDistOf_self]
        exact zero_le
      have hNewSep (y : M) (hy : y ∈ s) : Disjoint (B y) (B x) := by
        refine Set.disjoint_left.mpr ?_
        intro z hyz hxz
        change riemannianEDistOf g y z < ENNReal.ofReal 1 at hyz
        change riemannianEDistOf g x z < ENNReal.ofReal 1 at hxz
        have hTri := riemannianEDistOf_triangle g y z x
        rw [riemannianEDistOf_comm g z x] at hTri
        have hLt := hTri.trans_lt (ENNReal.add_lt_add hyz hxz)
        have hyx : x ∈ riemannianClosedBallOf g y 2 := by
          change riemannianEDistOf g y x ≤ ENNReal.ofReal 2
          have hTwo : ENNReal.ofReal (2 : ℝ) = ENNReal.ofReal 1 + ENNReal.ofReal 1 := by
            rw [← ENNReal.ofReal_add (by norm_num) (by norm_num)]
            norm_num
          exact hTwo.symm ▸ hLt.le
        exact hFar y hy hyx
      refine ⟨insert x s, by rw [Finset.card_insert_of_notMem hxNew, hs], ?_⟩
      intro y hy z hz hyz
      rcases Finset.mem_insert.mp hy with rfl | hyS
      · rcases Finset.mem_insert.mp hz with rfl | hzS
        · exact (hyz rfl).elim
        · exact (hNewSep z hzS).symm
      · rcases Finset.mem_insert.mp hz with rfl | hzS
        · exact hNewSep y hyS
        · exact hSep hyS hzS hyz
  let μ := riemannianVolumeMeasure I M g
  change μ univ = ⊤
  by_contra hFinite
  have hBallsFinite (x : M) : μ (B x) ≠ ⊤ :=
    ne_of_lt ((measure_mono (subset_univ _)).trans_lt (lt_top_iff_ne_top.mpr hFinite))
  have hBallsMeas (x : M) : MeasurableSet (B x) := by
    change MeasurableSet {y | riemannianEDistOf g x y < ENNReal.ofReal 1}
    exact (isOpen_lt (continuous_riemannianEDist g x) continuous_const).measurableSet
  obtain ⟨n, hn⟩ := exists_nat_gt (μ.real univ / c)
  obtain ⟨s, hs, hSep⟩ := hPacks n
  have hBound : (n : ℝ) * c ≤ μ.real univ := by
    calc
      _ = ∑ x ∈ s, c := by simp [hs, nsmul_eq_mul]
      _ ≤ ∑ x ∈ s, μ.real (B x) := Finset.sum_le_sum fun x _ => hVol x
      _ = μ.real (⋃ x ∈ s, B x) :=
        (measureReal_biUnion_finset hSep (fun x _ => hBallsMeas x) (fun x _ => hBallsFinite x)).symm
      _ ≤ _ := measureReal_mono (subset_univ _) hFinite
  exact (not_lt_of_ge hBound) ((div_lt_iff₀ hc).mp hn)

end
end SmoothPoincare.Bour
