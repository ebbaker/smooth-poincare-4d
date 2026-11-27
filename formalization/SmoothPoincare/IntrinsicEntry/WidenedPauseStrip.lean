import SmoothPoincare.IntrinsicEntry.PauseStripTrial

/-! # Signed costs for the right-anchored width-`1/15` switch -/

open DifferentialGeometry DifferentialGeometry.Geometry.Curvature
open DifferentialGeometry.Integral.Measure FirstOrderTwistor MeasureTheory SectionsAndConnections
open Filter Set
open scoped ContDiff Manifold Topology

noncomputable section

namespace SmoothPoincare.IntrinsicEntry

/-- Normalized switch coordinate with the outer face fixed at `s = 1/8`. -/
def widenedPauseStripCoordinate (s : ℝ) : ℝ := 15 * (s - 1 / 8) + 1

/-- The original flat-ended step on the wider radial interval. -/
def widenedPauseStripWeight (s : ℝ) : ℝ :=
  Real.smoothTransition (widenedPauseStripCoordinate s)

theorem widenedPauseStripWeight_smooth : ContDiff ℝ ∞ widenedPauseStripWeight := by
  unfold widenedPauseStripWeight widenedPauseStripCoordinate
  fun_prop (disch := exact Real.smoothTransition.contDiff)

theorem widenedPauseStripWeight_end_germs :
    (∀ s ≤ (7 / 120 : ℝ), widenedPauseStripWeight s = 0) ∧
      ∀ s ≥ (1 / 8 : ℝ), widenedPauseStripWeight s = 1 := by
  refine ⟨fun s hs => ?_, fun s hs => ?_⟩
  · apply Real.smoothTransition.zero_of_nonpos
    unfold widenedPauseStripCoordinate
    linarith
  · apply Real.smoothTransition.one_of_one_le
    unfold widenedPauseStripCoordinate
    linarith

theorem widenedPauseStripCoordinate_jacobian (s : ℝ) :
    HasDerivAt widenedPauseStripCoordinate 15 s := by
  unfold widenedPauseStripCoordinate
  have h : HasDerivAt (fun y : ℝ => 15 * (y - 1 / 8) + 1) (15 * 1) s :=
    (((hasDerivAt_id s).sub_const (1 / 8 : ℝ)).const_mul 15).add_const 1
  simpa only [mul_one] using h

theorem widenedPauseStripCoordinate_mem_iff {s : ℝ} :
    widenedPauseStripCoordinate s ∈ Icc (3 / 20) (1 / 5 : ℝ) ↔
      s ∈ Icc (41 / 600) (43 / 600 : ℝ) := by
  unfold widenedPauseStripCoordinate
  simp only [mem_Icc]
  constructor <;> rintro ⟨hl, hu⟩ <;> exact ⟨by linarith, by linarith⟩

/-- Reuse the normalized odds and rescale their physical derivatives by
one and two factors of the ratio of the inverse widths. -/
def widenedPauseStripOdds (s : ℝ) : ℝ := pauseStripRealOdds (widenedPauseStripCoordinate s)

theorem widenedPauseStripWeight_odds {s : ℝ}
    (h₀ : 0 < widenedPauseStripCoordinate s) (h₁ : widenedPauseStripCoordinate s < 1) :
    widenedPauseStripWeight s / (1 - widenedPauseStripWeight s) = widenedPauseStripOdds s := by
  let x := widenedPauseStripCoordinate s
  change Real.smoothTransition x / (1 - Real.smoothTransition x) = pauseStripRealOdds x
  let a := expNegInvGlue x
  let b := expNegInvGlue (1 - x)
  have hb : 0 < 1 - x := sub_pos.mpr h₁
  have hsum : a + b ≠ 0 := (Real.smoothTransition.pos_denom x).ne'
  have hcomp : 1 - a / (a + b) = b / (a + b) := by
    field_simp
    ring
  change a / (a + b) / (1 - a / (a + b)) = _
  rw [hcomp, div_div_div_cancel_right₀ hsum]
  unfold a b pauseStripRealOdds pauseStripRealArgument expNegInvGlue
  rw [ite_eq_right h₀.not_ge, ite_eq_right hb.not_ge, ← Real.exp_sub]
  congr 1
  simp only [one_div]
  ring

def widenedPauseStripSlope (x : ℝ) : ℝ := (15 / 16) * pauseStripRealSlope x

def widenedPauseStripSecond (x : ℝ) : ℝ := (225 / 256) * pauseStripRealSecond x

private theorem widenedPauseStripOdds_hasDerivAt {s : ℝ}
    (h₀ : 0 < widenedPauseStripCoordinate s) (h₁ : widenedPauseStripCoordinate s < 1) :
    HasDerivAt widenedPauseStripOdds (widenedPauseStripSlope (widenedPauseStripCoordinate s)) s := by
  let z (y : ℝ) := (widenedPauseStripCoordinate y + 1) / 16
  have hz (y : ℝ) : 16 * z y - 1 = widenedPauseStripCoordinate y := by
    unfold z
    ring
  have hd : HasDerivAt z (15 / 16) s := ((widenedPauseStripCoordinate_jacobian s).add_const 1).div_const 16
  have h := (pauseStripPhysicalOdds_hasDerivAt (by rwa [hz]) (by rwa [hz])).comp s hd
  convert h using 1
  · funext y
    simp only [widenedPauseStripOdds, Function.comp_apply, pauseStripPhysicalOdds, hz]
  · rw [hz, widenedPauseStripSlope, mul_comm]

private theorem widenedPauseStripSlope_hasDerivAt {s : ℝ}
    (h₀ : 0 < widenedPauseStripCoordinate s) (h₁ : widenedPauseStripCoordinate s < 1) :
    HasDerivAt (fun y => widenedPauseStripSlope (widenedPauseStripCoordinate y))
      (widenedPauseStripSecond (widenedPauseStripCoordinate s)) s := by
  let z (y : ℝ) := (widenedPauseStripCoordinate y + 1) / 16
  have hz (y : ℝ) : 16 * z y - 1 = widenedPauseStripCoordinate y := by
    unfold z
    ring
  have hd : HasDerivAt z (15 / 16) s := ((widenedPauseStripCoordinate_jacobian s).add_const 1).div_const 16
  have h := ((pauseStripPhysicalSlope_hasDerivAt (by rwa [hz]) (by rwa [hz])).comp s hd).const_mul (15 / 16)
  convert h using 1
  · funext y
    simp only [widenedPauseStripSlope, Function.comp_apply, hz]
  · rw [hz, widenedPauseStripSecond]
    ring

theorem widenedPauseStripOdds_derivs {s : ℝ}
    (h₀ : 0 < widenedPauseStripCoordinate s) (h₁ : widenedPauseStripCoordinate s < 1) :
    deriv widenedPauseStripOdds s = widenedPauseStripSlope (widenedPauseStripCoordinate s) ∧
      deriv (deriv widenedPauseStripOdds) s = widenedPauseStripSecond (widenedPauseStripCoordinate s) := by
  have hc : Continuous widenedPauseStripCoordinate := by
    unfold widenedPauseStripCoordinate
    fun_prop
  have hs : widenedPauseStripCoordinate ⁻¹' Ioo 0 1 ∈ 𝓝 s :=
    (isOpen_Ioo.preimage hc).mem_nhds (show widenedPauseStripCoordinate s ∈ Ioo 0 1 from ⟨h₀, h₁⟩)
  have he : deriv widenedPauseStripOdds =ᶠ[𝓝 s] fun y => widenedPauseStripSlope (widenedPauseStripCoordinate y) := by
    filter_upwards [hs] with y hy
    exact (widenedPauseStripOdds_hasDerivAt hy.1 hy.2).deriv
  exact ⟨(widenedPauseStripOdds_hasDerivAt h₀ h₁).deriv,
    he.deriv_eq.trans (widenedPauseStripSlope_hasDerivAt h₀ h₁).deriv⟩

/-- Physical contrast expression with the new derivative rates. -/
def widenedPauseStripContrastFloor (x : ℝ) : ℝ :=
  (3 / 25) * widenedPauseStripSecond x - 9 - 11 * widenedPauseStripSlope x -
    (53 / 100) * widenedPauseStripSlope x ^ 2

private def widenedPauseStripCellFloor (i : Fin 40) : ℚ :=
  let slope := (15 / 16) * pauseStripSlopeUpper i
  let second := (225 / 256) * pauseStripSecondLower i
  (3 / 25) * second - 9 - 11 * slope - (53 / 100) * slope ^ 2

set_option maxHeartbeats 0 in
set_option maxRecDepth 10000 in
private theorem widenedPauseStripCellFloor_gt_114 (i : Fin 40) :
    (114 : ℚ) < widenedPauseStripCellFloor i := by
  fin_cases i <;> decide +kernel

/-- The forty closed cells include both endpoints of the widened strip. -/
theorem widenedPauseStripContrastFloor_gt_114 {x : ℝ} (hx : x ∈ Icc (3 / 20) (1 / 5)) :
    114 < widenedPauseStripContrastFloor x := by
  obtain ⟨i, hi⟩ := pauseStripCell_cover hx
  obtain ⟨hs₀, hs₁, h₂⟩ := pauseStripPolynomial_cell_enclosure i hi
  have hs₀' : 0 ≤ widenedPauseStripSlope x := by
    unfold widenedPauseStripSlope
    positivity
  have hs₁' : widenedPauseStripSlope x ≤ (15 / 16) * (pauseStripSlopeUpper i : ℝ) :=
    mul_le_mul_of_nonneg_left hs₁ (by norm_num)
  have h₂' : (225 / 256) * (pauseStripSecondLower i : ℝ) ≤ widenedPauseStripSecond x :=
    mul_le_mul_of_nonneg_left h₂ (by norm_num)
  have hsq := pow_le_pow_left₀ hs₀' hs₁' 2
  have hf : (114 : ℝ) < (widenedPauseStripCellFloor i : ℝ) := by
    exact_mod_cast widenedPauseStripCellFloor_gt_114 i
  refine hf.trans_le ?_
  unfold widenedPauseStripCellFloor widenedPauseStripContrastFloor
  push_cast
  linarith only [hs₁', h₂', hsq]

/-- Width `1/300`, the physical tenth of the longitude, and the whole
unit framed sphere. The polar factor `sinh r` is accounted for separately. -/
def widenedPauseStripReferenceVolume : ℝ :=
  (43 / 600 - 41 / 600) * (2 * Real.pi / 10) * (4 * Real.pi)

theorem widenedPauseStripReferenceVolume_eq :
    widenedPauseStripReferenceVolume = 8 * Real.pi ^ 2 / 3000 := by
  unfold widenedPauseStripReferenceVolume
  ring

theorem widenedPauseStrip_sinh_lower : (32 / 25 : ℝ) < Real.sinh (641 / 600) := by
  let r : ℝ := 641 / 600
  have hseries := Real.hasSum_sinh r
  have hpoly : (32 / 25 : ℝ) <
      ∑ n ∈ Finset.range 3, r ^ (2 * n + 1) / ((2 * n + 1).factorial : ℝ) := by
    norm_num [r, Finset.sum_range_succ, Nat.factorial]
  have hsum : (∑ n ∈ Finset.range 3, r ^ (2 * n + 1) / ((2 * n + 1).factorial : ℝ)) ≤ Real.sinh r := by
    rw [← hseries.tsum_eq]
    exact hseries.summable.sum_le_tsum _ (fun n _ => by positivity)
  exact hpoly.trans_le hsum

theorem widenedPauseStrip_innerGermVolume_gt {X : Type*} [MeasurableSpace X]
    (ν : Measure X) [IsFiniteMeasure ν] (s : X → ℝ)
    (hν : ν.real univ = widenedPauseStripReferenceVolume) (hs : ∀ x, 41 / 600 ≤ s x)
    (hInt : Integrable (fun x => Real.sinh (1 + s x)) ν) :
    (32 / 25) * widenedPauseStripReferenceVolume < ∫ x, Real.sinh (1 + s x) ∂ν := by
  have hlow : (∫ _ : X, Real.sinh (641 / 600) ∂ν) ≤ ∫ x, Real.sinh (1 + s x) ∂ν :=
    integral_mono (integrable_const _) hInt (fun x => Real.sinh_le_sinh.mpr (by linarith [hs x]))
  rw [integral_const, hν, smul_eq_mul] at hlow
  exact (mul_lt_mul_of_pos_right widenedPauseStrip_sinh_lower
    (by rw [widenedPauseStripReferenceVolume_eq]; positivity)).trans_le (by simpa only [mul_comm] using hlow)

section Physical

variable {E H M : Type*}
  [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  [CompactSpace M] [BoundarylessManifold I M]
  {o : ManifoldOrientation I M 4}

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

omit [I.Boundaryless] [BoundarylessManifold I M] in
private theorem widenedPauseStripPhysicalVolume_gt (A g : SmoothRiemannianMetric I M) {strip : Set M}
    (hs : MeasurableSet strip)
    (hA : (32 / 25) * widenedPauseStripReferenceVolume < (riemannianVolumeMeasure I M A).real strip)
    (hmetric : ∀ x ∈ strip, ∀ v : TangentSpace I x, A.inner x v v ≤ g.inner x v v) :
    (32 / 25) * widenedPauseStripReferenceVolume < (riemannianVolumeMeasure I M g).real strip := by
  let μ := riemannianVolumeMeasure I M g
  let ν := riemannianVolumeMeasure I M A
  let : IsFiniteMeasureOnCompacts μ := riemannianVolumeMeasure_isFiniteMeasureOnCompacts g
  have hcomp : ν.restrict strip ≤ μ.restrict strip := by
    simpa using volumeMeasure_restrict_le g A (Q := 1) (by norm_num) hs
      (fun x hx v => by simpa only [one_mul] using hmetric x hx v)
  have hm : ν strip ≤ μ strip := by
    simpa using Measure.le_iff.mp hcomp univ MeasurableSet.univ
  exact hA.trans_le (ENNReal.toReal_mono (measure_ne_top μ strip) hm)

omit [I.Boundaryless] in
private theorem widenedPauseStripCompleteBand_cost_gt (q : SignedCollarMetric o) {band strip : Set M}
    (hb : MeasurableSet band) (hs : MeasurableSet strip) (hsub : strip ⊆ band)
    (hVol : (32 / 25) * widenedPauseStripReferenceVolume < (riemannianVolumeMeasure I M q.metric).real strip)
    (hContrast : ∀ x ∈ strip,
      114 ≤ |pauseStripSectionalContrast (metricCurvatureFrameTensor q.metric o x (q.frame x))|)
    (hbalance : q.charge .plus band = q.charge .minus band) :
    (17328 / 3125) * Real.pi ^ 2 < q.charge .plus band := by
  let μ := riemannianVolumeMeasure I M q.metric
  let : IsFiniteMeasureOnCompacts μ := riemannianVolumeMeasure_isFiniteMeasureOnCompacts q.metric
  let f (s : CollarChirality) (x : M) := hilbertSchmidtSq (signedCollarWeylBlock o q.metric q.frame s x)
  have hnonneg (s : CollarChirality) (x : M) : 0 ≤ f s x :=
    Finset.sum_nonneg fun _ _ => Finset.sum_nonneg fun _ _ => sq_nonneg _
  have hprice (s : CollarChirality) : q.charge s band = ∫ x in band, f s x ∂μ :=
    energyMeasure_real_apply hb (q.integrable s).integrableOn (Filter.Eventually.of_forall (hnonneg s))
  have hInt := (q.integrable .plus).add (q.integrable .minus)
  have hstrip : ((114 : ℝ) ^ 2 / 4) * μ.real strip ≤ ∫ x in strip, (f .plus x + f .minus x) ∂μ := by
    calc
      _ = ∫ _ : M in strip, (114 : ℝ) ^ 2 / 4 ∂μ := by
        rw [setIntegral_const, smul_eq_mul, mul_comm]
      _ ≤ _ := by
        apply setIntegral_mono_on (integrable_const _).integrableOn hInt.integrableOn hs
        intro x hx
        have hsq := (sq_le_sq₀ (by norm_num : (0 : ℝ) ≤ 114) (abs_nonneg _)).mpr (hContrast x hx)
        rw [sq_abs] at hsq
        have hW := pauseStripPhysicalContrast_sq_le q x
        change _ ≤ f .plus x + f .minus x
        linarith only [hsq, hW]
  have hfull : (∫ x in strip, (f .plus x + f .minus x) ∂μ) ≤ q.charge .plus band + q.charge .minus band := by
    rw [hprice, hprice, ← integral_add (q.integrable .plus).integrableOn (q.integrable .minus).integrableOn]
    exact setIntegral_mono_set hInt.integrableOn
      (Eventually.of_forall fun x => add_nonneg (hnonneg .plus x) (hnonneg .minus x))
      (Eventually.of_forall hsub)
  have hstrict := (mul_lt_mul_of_pos_left hVol (by positivity : 0 < (114 : ℝ) ^ 2 / 4)).trans_le
    (hstrip.trans hfull)
  have hn : (114 : ℝ) ^ 2 / 4 * ((32 / 25) * widenedPauseStripReferenceVolume) =
      2 * ((17328 / 3125) * Real.pi ^ 2) := by
    rw [widenedPauseStripReferenceVolume_eq]
    ring
  rw [hn] at hstrict
  linarith only [hstrict, hbalance]

/-- The physical strip, metric domination, sectional contrast and closed
ledger enter as geometric hypotheses. Complete-band balance and exchange
are applied after conformal transfer, with independent signed conclusions. -/
theorem widenedPauseStrip_signed_costs_gt (q : SignedCollarMetric o) (logScale : C^∞⟮I, M; ℝ⟯)
    (A : SmoothRiemannianMetric I M) {band strip : Set M}
    (hb : MeasurableSet band) (hs : MeasurableSet strip) (hsub : strip ⊆ band)
    (hvol : (32 / 25) * widenedPauseStripReferenceVolume < (riemannianVolumeMeasure I M A).real strip)
    (hmetric : ∀ p ∈ strip, ∀ v : TangentSpace I p,
      A.inner p v v ≤ (q.conformal logScale).metric.inner p v v)
    (s : M → ℝ)
    (hsrad : ∀ p ∈ strip, s p ∈ Icc (41 / 600 : ℝ) (43 / 600))
    (hjet : ∀ p ∈ strip, widenedPauseStripContrastFloor (widenedPauseStripCoordinate (s p)) ≤
      |pauseStripSectionalContrast
        (metricCurvatureFrameTensor (q.conformal logScale).metric o p ((q.conformal logScale).frame p))|)
    (cost : ThreeCuffBandCosts) (hcost : cost.plus 0 = q.charge .plus band)
    (hbalance : q.charge .plus band = q.charge .minus band)
    (hexchange : cost.plus 0 = cost.minus 1)
    (hledger : cost.closedPlus = q.energy .plus ∧ cost.closedMinus = q.energy .minus) :
    (∀ i, (17328 / 3125) * Real.pi ^ 2 < cost.plus i ∧ (17328 / 3125) * Real.pi ^ 2 < cost.minus i) ∧
    (34656 / 3125) * Real.pi ^ 2 < q.energy .plus ∧
    (34656 / 3125) * Real.pi ^ 2 < q.energy .minus ∧
    (threeCuffEntryWall < q.energy .plus ∧ threeCuffEntryWall < q.energy .minus) := by
  have hv := widenedPauseStripPhysicalVolume_gt A (q.conformal logScale).metric hs hvol hmetric
  have hc : (q.conformal logScale).charge .plus band = (q.conformal logScale).charge .minus band := by
    simpa only [SignedCollarMetric.charge_conformal] using hbalance
  have hfirst := widenedPauseStripCompleteBand_cost_gt (q.conformal logScale) hb hs hsub hv
    (fun p hp => (widenedPauseStripContrastFloor_gt_114
      (widenedPauseStripCoordinate_mem_iff.mpr (hsrad p hp))).le.trans (hjet p hp)) hc
  rw [SignedCollarMetric.charge_conformal, ← hcost] at hfirst
  obtain ⟨hp, hm⟩ := cost.closedTotals_of_exchange hexchange
  have hclosed : (34656 / 3125) * Real.pi ^ 2 < cost.closedPlus := by
    rw [hp]
    linarith only [hfirst]
  have hclosed' : (34656 / 3125) * Real.pi ^ 2 < cost.closedMinus := by rwa [hm, ← hp]
  have hwall : threeCuffEntryWall < (34656 / 3125) * Real.pi ^ 2 := by
    unfold threeCuffEntryWall
    nlinarith only [sq_pos_of_pos Real.pi_pos]
  rw [← hledger.1, ← hledger.2]
  refine ⟨?_, hclosed, hclosed', hwall.trans hclosed, hwall.trans hclosed'⟩
  intro i
  have hi : (17328 / 3125) * Real.pi ^ 2 < cost.plus i := by
    fin_cases i
    · exact hfirst
    · change (17328 / 3125 : ℝ) * Real.pi ^ 2 < cost.plus 1
      rwa [cost.band_balance 1, ← hexchange]
  exact ⟨hi, cost.band_balance i ▸ hi⟩

end Physical

end SmoothPoincare.IntrinsicEntry
