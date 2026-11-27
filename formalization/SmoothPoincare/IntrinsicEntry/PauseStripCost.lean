import SmoothPoincare.IntrinsicEntry.ThreeCuffNeumann
import SmoothPoincare.Variational.PairedStripCurvature
import SmoothPoincare.Variational.ConformalChiralCharges
import DifferentialGeometry.Analysis.Integration.Measure.Riemannian.MetricComparison
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Series

/-! # A lower chiral budget on the actual long-cuff pause strip -/

open DifferentialGeometry DifferentialGeometry.Geometry.Curvature
open DifferentialGeometry.Integral.Measure FirstOrderTwistor MeasureTheory SectionsAndConnections
open Filter Set
open scoped BigOperators ContDiff Manifold ENNReal

noncomputable section

namespace SmoothPoincare.IntrinsicEntry

/-- The four wedge diagonals of the sectional contrast in the ordered frame
`(n,m,k,l)`. The wedge convention is `R(i,j,i,j) = Rm(i,j,j,i)`. -/
def pauseStripSectionalContrast (R : CurvatureFrameTensor) : ℝ :=
  R 0 1 0 1 - R 0 3 0 3 - R 2 1 2 1 + R 2 3 2 3

/-- The two sums of matching Weyl diagonals give the physical contrast.
The mixed parts cancel on adding the two chiral compressions, and the
trace subtractions cancel when the diagonal positions are differenced. -/
theorem pauseStripSectionalContrast_eq_chiral_diagonals (R : CurvatureFrameTensor)
    (hswap : R 2 1 2 1 = R 1 2 1 2) :
    let P := traceFreeChiralBlock (selfDualCurvatureBlock R)
    let N := traceFreeChiralBlock (antiSelfDualCurvatureBlock R)
    pauseStripSectionalContrast R = P 0 0 + N 0 0 - (P 2 2 + N 2 2) := by
  have htrace (W : Matrix (Fin 3) (Fin 3) ℝ) (i : Fin 3) :
      traceFreeChiralBlock W i i = W i i - W.trace / 3 := by
    change W i i - (W.trace / 3) * (1 : Matrix (Fin 3) (Fin 3) ℝ) i i = _
    simp
  have h0 : selfDualCurvatureBlock R 0 0 + antiSelfDualCurvatureBlock R 0 0 =
      R 0 1 0 1 + R 2 3 2 3 := by
    change (R 0 1 0 1 + R 0 1 2 3 + R 2 3 0 1 + R 2 3 2 3) / 2 +
      (R 0 1 0 1 - R 0 1 2 3 - R 2 3 0 1 + R 2 3 2 3) / 2 = _
    ring
  have h2 : selfDualCurvatureBlock R 2 2 + antiSelfDualCurvatureBlock R 2 2 =
      R 0 3 0 3 + R 1 2 1 2 := by
    change (R 0 3 0 3 + R 0 3 1 2 + R 1 2 0 3 + R 1 2 1 2) / 2 +
      (R 0 3 0 3 - R 0 3 1 2 - R 1 2 0 3 + R 1 2 1 2) / 2 = _
    ring
  dsimp only
  rw [pauseStripSectionalContrast, hswap]
  simp only [htrace]
  linarith only [h0, h2]

private theorem pauseStrip_selected_diagonals_le (W : Matrix (Fin 3) (Fin 3) ℝ) :
    W 0 0 ^ 2 + W 2 2 ^ 2 ≤ hilbertSchmidtSq W := by
  have h (i : Fin 3) : W i i ^ 2 ≤ ∑ j, W i j ^ 2 :=
    Finset.single_le_sum (fun j _ => sq_nonneg (W i j)) (Finset.mem_univ i)
  have hrow : 0 ≤ ∑ j, W 1 j ^ 2 := Finset.sum_nonneg fun j _ => sq_nonneg (W 1 j)
  rw [hilbertSchmidtSq, Fin.sum_univ_three]
  linarith only [h 0, h 2, hrow]

/-- The four-section contrast costs at least one quarter of its square in
the two pointwise signed Hilbert–Schmidt densities taken together. -/
theorem pauseStripSectionalContrast_sq_le_chiral (R : CurvatureFrameTensor)
    (hswap : R 2 1 2 1 = R 1 2 1 2) :
    pauseStripSectionalContrast R ^ 2 ≤
      4 * (hilbertSchmidtSq (traceFreeChiralBlock (selfDualCurvatureBlock R)) +
        hilbertSchmidtSq (traceFreeChiralBlock (antiSelfDualCurvatureBlock R))) := by
  let P := traceFreeChiralBlock (selfDualCurvatureBlock R)
  let N := traceFreeChiralBlock (antiSelfDualCurvatureBlock R)
  change pauseStripSectionalContrast R ^ 2 ≤ 4 * (hilbertSchmidtSq P + hilbertSchmidtSq N)
  rw [pauseStripSectionalContrast_eq_chiral_diagonals R hswap]
  change (P 0 0 + N 0 0 - (P 2 2 + N 2 2)) ^ 2 ≤ 4 * (hilbertSchmidtSq P + hilbertSchmidtSq N)
  have hh : (P 0 0 + N 0 0 - (P 2 2 + N 2 2)) ^ 2 ≤
      4 * (P 0 0 ^ 2 + P 2 2 ^ 2 + (N 0 0 ^ 2 + N 2 2 ^ 2)) := by
    nlinarith only [sq_nonneg (P 0 0 - N 0 0), sq_nonneg (P 2 2 - N 2 2),
      sq_nonneg (P 0 0 + N 0 0 + (P 2 2 + N 2 2))]
  exact hh.trans (mul_le_mul_of_nonneg_left
    (add_le_add (pauseStrip_selected_diagonals_le P) (pauseStrip_selected_diagonals_le N)) (by norm_num))

/-- The normalized acceleration coefficient obtained from the actual two
endpoint tangential Rayleigh ratios and the lapse bound. -/
theorem pauseStrip_accelerationMargin :
    (3 / 25 : ℝ) < (39 / 100 - 13 / 100) / (2 * (1 + (1 / 40) * (17 / 20) ^ 2) ^ 3) := by
  norm_num

/-- The constant cost of the four frozen sections in the source comparison. -/
theorem pauseStrip_frozenSectionBudget :
    (4 : ℝ) * (1 + (1 / 40) * (17 / 20) ^ 4 + 2 * (1 / 40) * (9 / 2) ^ 2) < 811 / 100 := by
  norm_num

/-- Signed combination of the geometric term bounds on the pause strip.
The physical curvature calculation supplies the acceleration coefficient,
frozen sections, differentiated lapse terms, and connection products. -/
theorem pauseStripContrast_abs_ge
    (contrast leading slope acceleration frozen linear connection : ℝ)
    (hContrast : contrast = -leading * acceleration + frozen + linear + connection)
    (hLead : 3 / 25 ≤ leading) (hSlope : 0 ≤ slope) (hAcceleration : 0 ≤ acceleration)
    (hFrozen : |frozen| ≤ 811 / 100)
    (hLinear : |linear| ≤
      (4 * (13 / 10) * (17 / 20) ^ 2 / 2 + (9 / 2) * (2 * (7 / 20) + 17 / 20 + 9 / 25)) * slope)
    (hConnection : |connection| ≤ 8 * (12 / 125) ^ 2 + (7 / 20) * slope + (53 / 100) * slope ^ 2) :
    (3 / 25) * acceleration - 9 - 11 * slope - (53 / 100) * slope ^ 2 ≤ |contrast| := by
  have hF := (le_abs_self frozen).trans hFrozen
  have hL := (le_abs_self linear).trans hLinear
  have hC := (le_abs_self connection).trans hConnection
  have hA := mul_nonneg (sub_nonneg.mpr hLead) hAcceleration
  have hD := neg_le_abs contrast
  nlinarith only [hContrast, hF, hL, hC, hA, hD, hSlope]

/-- Product of the exact radial width, the retained tenth of the physical
longitude, and the whole unit round sphere area. -/
def pauseStripReferenceVolume : ℝ := (1 / 320) * (2 * Real.pi / 10) * (4 * Real.pi)

theorem pauseStripReferenceVolume_eq : pauseStripReferenceVolume = 8 * Real.pi ^ 2 / 3200 := by
  unfold pauseStripReferenceVolume
  ring

/-- The minimum inner polar radius of the closed strip is `343/320`, where
already the first three odd terms of sinh exceed `32/25`. -/
theorem pauseStrip_sinh_lower : (32 / 25 : ℝ) < Real.sinh (343 / 320) := by
  let r : ℝ := 343 / 320
  have hseries := Real.hasSum_sinh r
  have hpoly : (32 / 25 : ℝ) <
      ∑ n ∈ Finset.range 3, r ^ (2 * n + 1) / ((2 * n + 1).factorial : ℝ) := by
    norm_num [r, Finset.sum_range_succ, Nat.factorial]
  have hsum : (∑ n ∈ Finset.range 3, r ^ (2 * n + 1) / ((2 * n + 1).factorial : ℝ)) ≤ Real.sinh r := by
    rw [← hseries.tsum_eq]
    exact hseries.summable.sum_le_tsum _ (fun n _ => by positivity)
  exact hpoly.trans_le hsum

/-- The measured product-coordinate reference strip has the exact rectangular
mass. The density `sinh r` gives a strict lower bound for the physical `A`
volume before passing to the larger conformal metric. -/
theorem pauseStrip_innerGermVolume_gt {X : Type*} [MeasurableSpace X]
    (ν : Measure X) [IsFiniteMeasure ν] (r : X → ℝ)
    (hν : ν.real univ = pauseStripReferenceVolume) (hr : ∀ x, 343 / 320 ≤ r x)
    (hInt : Integrable (fun x => Real.sinh (r x)) ν) :
    (32 / 25) * pauseStripReferenceVolume < ∫ x, Real.sinh (r x) ∂ν := by
  have hlow : (∫ _ : X, Real.sinh (343 / 320) ∂ν) ≤ ∫ x, Real.sinh (r x) ∂ν :=
    integral_mono (integrable_const _) hInt (fun x => Real.sinh_le_sinh.mpr (hr x))
  rw [integral_const, hν, smul_eq_mul] at hlow
  exact (mul_lt_mul_of_pos_right pauseStrip_sinh_lower
    (by rw [pauseStripReferenceVolume_eq]; positivity)).trans_le (by simpa only [mul_comm] using hlow)

section Physical

variable {E H M : Type*}
  [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  [CompactSpace M] [Nonempty M] [BoundarylessManifold I M]
  {o : ManifoldOrientation I M 4}

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

omit [I.Boundaryless] [Nonempty M] [BoundarylessManifold I M] in
/-- If the conformal representative adds a nonnegative tensor on the strip,
its genuine Riemannian measure has at least the inner-germ volume there. -/
theorem pauseStripPhysicalVolume_gt (A g : SmoothRiemannianMetric I M) {strip : Set M}
    (hs : MeasurableSet strip)
    (hA : (32 / 25) * pauseStripReferenceVolume < (riemannianVolumeMeasure I M A).real strip)
    (hmetric : ∀ x ∈ strip, ∀ v : TangentSpace I x, A.inner x v v ≤ g.inner x v v) :
    (32 / 25) * pauseStripReferenceVolume < (riemannianVolumeMeasure I M g).real strip := by
  let μ := riemannianVolumeMeasure I M g
  let ν := riemannianVolumeMeasure I M A
  let : IsFiniteMeasureOnCompacts μ := riemannianVolumeMeasure_isFiniteMeasureOnCompacts g
  have hcomp : ν.restrict strip ≤ μ.restrict strip := by
    simpa using volumeMeasure_restrict_le g A (Q := 1) (by norm_num) hs
      (fun x hx v => by simpa only [one_mul] using hmetric x hx v)
  have hm : ν strip ≤ μ strip := by
    simpa using Measure.le_iff.mp hcomp univ MeasurableSet.univ
  exact hA.trans_le (ENNReal.toReal_mono (measure_ne_top μ strip) hm)

omit [I.Boundaryless] [Nonempty M] in
/-- For the actual oriented Levi–Civita frame, reversing each wedge pair
identifies the two orientations of the same sectional diagonal. -/
theorem pauseStripPhysicalContrast_sq_le (q : SignedCollarMetric o) (x : M) :
    pauseStripSectionalContrast (metricCurvatureFrameTensor q.metric o x (q.frame x)) ^ 2 ≤
      4 * (hilbertSchmidtSq (signedCollarWeylBlock o q.metric q.frame .plus x) +
        hilbertSchmidtSq (signedCollarWeylBlock o q.metric q.frame .minus x)) := by
  let R := metricCurvatureFrameTensor q.metric o x (q.frame x)
  have hswap : R 2 1 2 1 = R 1 2 1 2 := by
    dsimp only [R]
    rw [metricCurvatureFrameTensor_swap_first q.metric o x (q.frame x) 1 2 2 1,
      metricCurvatureFrameTensor_swap_last q.metric o x (q.frame x) 1 2 1 2, neg_neg]
  exact pauseStripSectionalContrast_sq_le_chiral R hswap

omit [I.Boundaryless] [Nonempty M] in
/-- Integrate the pointwise contrast over the physical strip of one specified
metric. Band-wise signature balance is needed only for the complete band,
not for the restricted pause strip. The conformal representative can be
extended to the whole band before supplying this equality. -/
theorem pauseStripCompleteBand_cost_gt (q : SignedCollarMetric o) {band strip : Set M}
    (hb : MeasurableSet band) (hs : MeasurableSet strip) (hsub : strip ⊆ band)
    {d : ℝ} (hd : 0 < d)
    (hVol : (32 / 25) * pauseStripReferenceVolume < (riemannianVolumeMeasure I M q.metric).real strip)
    (hContrast : ∀ x ∈ strip,
      d ≤ |pauseStripSectionalContrast (metricCurvatureFrameTensor q.metric o x (q.frame x))|)
    (hbalance : q.charge .plus band = q.charge .minus band) :
    d ^ 2 * Real.pi ^ 2 / 2500 < q.charge .plus band ∧
      d ^ 2 * Real.pi ^ 2 / 2500 < q.charge .minus band := by
  let μ := riemannianVolumeMeasure I M q.metric
  let : IsFiniteMeasureOnCompacts μ := riemannianVolumeMeasure_isFiniteMeasureOnCompacts q.metric
  let f (s : CollarChirality) (x : M) := hilbertSchmidtSq (signedCollarWeylBlock o q.metric q.frame s x)
  have hnonneg (s : CollarChirality) (x : M) : 0 ≤ f s x :=
    Finset.sum_nonneg fun _ _ => Finset.sum_nonneg fun _ _ => sq_nonneg _
  have hprice (s : CollarChirality) : q.charge s band = ∫ x in band, f s x ∂μ :=
    energyMeasure_real_apply hb (q.integrable s).integrableOn (Filter.Eventually.of_forall (hnonneg s))
  have hInt := (q.integrable .plus).add (q.integrable .minus)
  have hstrip : (d ^ 2 / 4) * μ.real strip ≤ ∫ x in strip, (f .plus x + f .minus x) ∂μ := by
    calc
      _ = ∫ _ : M in strip, d ^ 2 / 4 ∂μ := by
        rw [setIntegral_const, smul_eq_mul, mul_comm]
      _ ≤ _ := by
        apply setIntegral_mono_on (integrable_const (d ^ 2 / 4)).integrableOn hInt.integrableOn hs
        intro x hx
        have hsq := (sq_le_sq₀ hd.le (abs_nonneg _)).mpr (hContrast x hx)
        rw [sq_abs] at hsq
        have hW := pauseStripPhysicalContrast_sq_le q x
        change _ ≤ f .plus x + f .minus x
        linarith only [hsq, hW]
  have hfull : (∫ x in strip, (f .plus x + f .minus x) ∂μ) ≤ q.charge .plus band + q.charge .minus band := by
    rw [hprice, hprice, ← integral_add (q.integrable .plus).integrableOn (q.integrable .minus).integrableOn]
    exact setIntegral_mono_set hInt.integrableOn
      (Eventually.of_forall fun x => add_nonneg (hnonneg .plus x) (hnonneg .minus x))
      (Eventually.of_forall hsub)
  have hstrict := (mul_lt_mul_of_pos_left hVol (by positivity : 0 < d ^ 2 / 4)).trans_le
    (hstrip.trans hfull)
  have hn : d ^ 2 / 4 * ((32 / 25) * pauseStripReferenceVolume) =
      2 * (d ^ 2 * Real.pi ^ 2 / 2500) := by
    rw [pauseStripReferenceVolume_eq]
    ring
  rw [hn] at hstrict
  exact ⟨by linarith only [hstrict, hbalance], by linarith only [hstrict, hbalance]⟩

end Physical

/-- A supplied lower bound on the first whole band, transferred from its
conformal representative, excludes strict entry on the original symmetric
filling with its two counted bands and Weyl-flat caps and funnels. -/
theorem pauseStripClosed_cost_gt_and_excludesEntry (cost : ThreeCuffBandCosts)
    (hexchange : cost.plus 0 = cost.minus 1)
    (hone : (169 / 25) * Real.pi ^ 2 < cost.plus 0) :
    (338 / 25) * Real.pi ^ 2 < cost.closedPlus ∧
    (338 / 25) * Real.pi ^ 2 < cost.closedMinus ∧
    ¬ (cost.closedPlus < threeCuffEntryWall ∧ cost.closedMinus < threeCuffEntryWall) := by
  obtain ⟨hPlus, hMinus⟩ := cost.closedTotals_of_exchange hexchange
  have hwall : threeCuffEntryWall < (338 / 25) * Real.pi ^ 2 := by
    unfold threeCuffEntryWall
    nlinarith only [sq_pos_of_pos Real.pi_pos]
  have hp : (338 / 25) * Real.pi ^ 2 < cost.closedPlus := by rw [hPlus]; linarith only [hone]
  have hm : (338 / 25) * Real.pi ^ 2 < cost.closedMinus := by rw [hMinus]; linarith only [hone]
  exact ⟨hp, hm, fun h => (not_lt_of_ge (hwall.trans hp).le) h.1⟩

section OriginalFilling

variable {E H M : Type*}
  [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  [CompactSpace M] [Nonempty M] [BoundarylessManifold I M]
  {o : ManifoldOrientation I M 4}

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

omit [Nonempty M] in
/-- The physical pause-strip certificate on the same trial gives the two
strict closed costs and removes the symmetric fixed-width entry candidate.
The marked conformal transfer identifies the first whole-band cost, and the
exchange and single-relator closings identify the other three signed costs. -/
theorem pauseStrip_longCuffTrial_excluded (q : SignedCollarMetric o) (u : C^∞⟮I, M; ℝ⟯)
    (A : SmoothRiemannianMetric I M)
    (cost : ThreeCuffBandCosts) {band strip : Set M}
    (hb : MeasurableSet band) (hs : MeasurableSet strip) (hsub : strip ⊆ band)
    (hA : (32 / 25) * pauseStripReferenceVolume < (riemannianVolumeMeasure I M A).real strip)
    (hmetric : ∀ x ∈ strip, ∀ v : TangentSpace I x, A.inner x v v ≤ (q.conformal u).metric.inner x v v)
    (hContrast : ∀ x ∈ strip, 130 ≤ |pauseStripSectionalContrast
      (metricCurvatureFrameTensor (q.conformal u).metric o x ((q.conformal u).frame x))|)
    (hbalance : q.charge .plus band = q.charge .minus band)
    (htransfer : cost.plus 0 = q.charge .plus band) (hexchange : cost.plus 0 = cost.minus 1) :
    (∀ i, (169 / 25) * Real.pi ^ 2 < cost.plus i ∧ (169 / 25) * Real.pi ^ 2 < cost.minus i) ∧
    (338 / 25) * Real.pi ^ 2 < cost.closedPlus ∧ (338 / 25) * Real.pi ^ 2 < cost.closedMinus ∧
    ¬ (cost.closedPlus < threeCuffEntryWall ∧ cost.closedMinus < threeCuffEntryWall) := by
  have hvol := pauseStripPhysicalVolume_gt A (q.conformal u).metric hs hA hmetric
  have hbal : (q.conformal u).charge .plus band = (q.conformal u).charge .minus band := by
    rw [q.charge_conformal, q.charge_conformal, hbalance]
  obtain ⟨hc, _⟩ := pauseStripCompleteBand_cost_gt (q.conformal u) hb hs hsub (by norm_num) hvol hContrast hbal
  rw [q.charge_conformal] at hc
  have hone : (169 / 25) * Real.pi ^ 2 < cost.plus 0 := by
    rw [htransfer]
    convert hc using 1
    ring
  refine ⟨?_, pauseStripClosed_cost_gt_and_excludesEntry cost hexchange hone⟩
  intro i
  have hplus : (169 / 25) * Real.pi ^ 2 < cost.plus i := by
    fin_cases i
    · exact hone
    · change (169 / 25) * Real.pi ^ 2 < cost.plus 1
      rwa [cost.band_balance 1, ← hexchange]
  exact ⟨hplus, (cost.band_balance i) ▸ hplus⟩

end OriginalFilling

end SmoothPoincare.IntrinsicEntry
