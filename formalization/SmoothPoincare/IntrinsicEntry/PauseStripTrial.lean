import SmoothPoincare.IntrinsicEntry.PauseStripCost
import SmoothPoincare.IntrinsicEntry.PauseStripCover

/-! # Both original chiral charges from the physical pause-strip contrast -/

open DifferentialGeometry DifferentialGeometry.Geometry.Curvature
open DifferentialGeometry.Integral.Measure FirstOrderTwistor MeasureTheory SectionsAndConnections Set
open scoped ContDiff Manifold

namespace SmoothPoincare.IntrinsicEntry

noncomputable section

/-- Extend the strip's positive denominator to every switching weight. It
equals one near the outer end of the actual transition. -/
def pauseStripGaugeDenom (a : ℝ) : ℝ := 1 - a * (1 - Real.smoothTransition (4 * a - 1))

theorem pauseStripGaugeDenom_pos (a : ℝ) : 0 < pauseStripGaugeDenom a := by
  by_cases h : 1 / 2 ≤ a
  · simp [pauseStripGaugeDenom, Real.smoothTransition.one_of_one_le (show 1 ≤ 4*a-1 by linarith)]
  · have hχ := Real.smoothTransition.nonneg (4*a-1)
    have hχ' := Real.smoothTransition.le_one (4*a-1)
    unfold pauseStripGaugeDenom
    by_cases h₀ : 0 ≤ a
    · nlinarith only [h, mul_nonneg h₀ hχ]
    · have := mul_nonpos_of_nonpos_of_nonneg (le_of_not_ge h₀) (sub_nonneg.mpr hχ')
      linarith

/-- Smooth log scale on the entire weight line, including both flat ends. -/
def pauseStripLogGauge (a : ℝ) : ℝ := -Real.log (pauseStripGaugeDenom a) / 2

theorem pauseStripLogGauge_smooth : ContDiff ℝ ∞ pauseStripLogGauge := by
  have h : ContDiff ℝ ∞ pauseStripGaugeDenom := by
    unfold pauseStripGaugeDenom
    fun_prop (disch := exact Real.smoothTransition.contDiff)
  exact (h.log fun a => (pauseStripGaugeDenom_pos a).ne').neg.div_const _

/-- Multiplication by the same global conformal gauge recovers the two
tensor coefficients of the normalized representative on the pause strip. -/
theorem pauseStripLogGauge_inner {a : ℝ} (ha : a ≤ 1 / 4) (A B : ℝ) :
    Real.exp (2 * pauseStripLogGauge a) * ((1-a)*A + a*B) = A + a/(1-a)*B := by
  have h : 0 < 1-a := by linarith
  have hd : pauseStripGaugeDenom a = 1-a := by
    simp [pauseStripGaugeDenom, Real.smoothTransition.zero_of_nonpos (show 4*a-1 ≤ 0 by linarith)]
  rw [pauseStripLogGauge, hd, show 2 * (-Real.log (1-a)/2) = -Real.log (1-a) by ring,
    Real.exp_neg, Real.exp_log h]
  field_simp

variable {E H M : Type*}
  [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  [CompactSpace M] [BoundarylessManifold I M]
  {o : ManifoldOrientation I M 4}

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

/-- Retain the full rational floor 133 on the same physical strip. The geometric
first-jet error estimate is supplied pointwise in the indicated frame, at the
actual normalized radial coordinate. The zero-signature closings and the band
exchange apply to the original band charges, after conformal transfer. -/
theorem pauseStrip_original_signed_costs_gt (q : SignedCollarMetric o) (u : C^∞⟮I, M; ℝ⟯)
    (A : SmoothRiemannianMetric I M) {band strip : Set M}
    (hb : MeasurableSet band) (hs : MeasurableSet strip) (hsub : strip ⊆ band)
    (hvol : (32 / 25) * pauseStripReferenceVolume < (riemannianVolumeMeasure I M A).real strip)
    (hmetric : ∀ p ∈ strip, ∀ v : TangentSpace I p,
      A.inner p v v ≤ (q.conformal u).metric.inner p v v)
    (x : M → ℝ) (hx : ∀ p ∈ strip, x p ∈ Icc (3 / 20 : ℝ) (1 / 5))
    (hjet : ∀ p ∈ strip, pauseStripContrastFloor (x p) ≤
      |pauseStripSectionalContrast
        (metricCurvatureFrameTensor (q.conformal u).metric o p ((q.conformal u).frame p))|)
    (cost : ThreeCuffBandCosts) (hcost : cost.plus 0 = q.charge .plus band)
    (hbalance : q.charge .plus band = q.charge .minus band)
    (hexchange : cost.plus 0 = cost.minus 1) :
    (∀ i, (17689 / 2500) * Real.pi ^ 2 < cost.plus i ∧
      (17689 / 2500) * Real.pi ^ 2 < cost.minus i) ∧
    (17689 / 1250) * Real.pi ^ 2 < cost.closedPlus ∧
    (17689 / 1250) * Real.pi ^ 2 < cost.closedMinus ∧
    ¬ (cost.closedPlus < threeCuffEntryWall ∧ cost.closedMinus < threeCuffEntryWall) := by
  have hv := pauseStripPhysicalVolume_gt A (q.conformal u).metric hs hvol hmetric
  have hc : (q.conformal u).charge .plus band = (q.conformal u).charge .minus band := by
    simpa only [SignedCollarMetric.charge_conformal] using hbalance
  have hfirst := (pauseStripCompleteBand_cost_gt (q.conformal u) hb hs hsub (d := 133)
    (by norm_num) hv (fun p hp => (pauseStripContrastFloor_gt_133 (hx p hp)).le.trans (hjet p hp)) hc).1
  rw [SignedCollarMetric.charge_conformal, ← hcost] at hfirst
  have hband : (17689 / 2500) * Real.pi ^ 2 < cost.plus 0 := by
    convert hfirst using 1
    ring
  obtain ⟨hp, hm⟩ := cost.closedTotals_of_exchange hexchange
  have hclosed : (17689 / 1250) * Real.pi ^ 2 < cost.closedPlus := by
    rw [hp]
    linarith only [hband]
  refine ⟨?_, hclosed, by rwa [hm, ← hp], ?_⟩
  · intro i
    have h : (17689 / 2500) * Real.pi ^ 2 < cost.plus i := by
      fin_cases i
      · exact hband
      · change (17689 / 2500 : ℝ) * Real.pi ^ 2 < cost.plus 1
        rw [cost.band_balance 1, ← hexchange]
        exact hband
    exact ⟨h, cost.band_balance i ▸ h⟩
  · intro h
    have hwall : threeCuffEntryWall < (17689 / 1250) * Real.pi ^ 2 := by
      unfold threeCuffEntryWall
      nlinarith only [sq_pos_of_pos Real.pi_pos]
    exact (not_lt_of_ge (hwall.trans hclosed).le) h.1

end

end SmoothPoincare.IntrinsicEntry
