import SmoothPoincare.IntrinsicEntry.FixedWidthHarmonicTest
import SmoothPoincare.IntrinsicEntry.HarmonicSeamCorridor
import SmoothPoincare.IntrinsicEntry.HarmonicDiskPropagation
import SmoothPoincare.IntrinsicEntry.HarmonicStretchHarnack
import SmoothPoincare.IntrinsicEntry.FixedBandCostEnclosure
import SmoothPoincare.Variational.RoundCutGeometricCap
import SmoothPoincare.IntrinsicEntry.PauseStripCost
import SmoothPoincare.IntrinsicEntry.PauseStripRational
import SmoothPoincare.IntrinsicEntry.PauseStripTrial

/-! # Independent E53 checks for harmonic switching and the marked round cap -/

open DifferentialGeometry DifferentialGeometry.Geometry DifferentialGeometry.Integral.Measure
open FirstOrderTwistor SmoothPoincare SmoothPoincare.IntrinsicEntry
open Metric MeasureTheory Set
open scoped BigOperators Manifold ContDiff RealInnerProductSpace

noncomputable section

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "S₄" => StandardFourSphere
local notation "I₄" => 𝓡 4
local instance : Fact (Module.finrank ℝ (EuclideanSpace ℝ (Fin 5)) = 4 + 1) := ⟨by simp⟩

section RoundMeasure

private local instance : MeasurableSpace S₄ := borel S₄
private local instance : BorelSpace S₄ := ⟨rfl⟩

/-- The marked side measures split the whole physical integral for all
integrable functions, including the smooth scalar-form densities. -/
example (f : S₄ → ℝ)
    (hf : Integrable f (riemannianVolumeMeasure I₄ S₄ standardRoundFourMetric)) :
    let μ := riemannianVolumeMeasure I₄ S₄ standardRoundFourMetric
    (∫ p in (roundEquatorMarkedGeometry true).raw, f p ∂μ) +
      (∫ p in (roundEquatorMarkedGeometry false).raw, f p ∂μ) = ∫ p, f p ∂μ := by
  intro μ
  obtain ⟨hcover, hnul⟩ := roundEquator_rawCover_and_nullOverlap
  have hs := setIntegral_union₀ hnul (roundEquatorMarkedGeometry false).rawMeasurable.nullMeasurableSet
    hf.integrableOn hf.integrableOn
  rw [hcover, setIntegral_univ] at hs
  exact hs.symm

/-- Both actual charts give the noncentral stereographic conformal factor
on the same physical round metric. -/
example (north : Bool) (v w : E₄) :
    let z : E₄ := EuclideanSpace.single 0 (1 / 2)
    let F := roundEquatorCapChart north
    standardRoundFourMetric.inner (F z) (mfderiv I₄ I₄ F z v) (mfderiv I₄ I₄ F z w) =
      (64 / 25 : ℝ) * inner ℝ v w := by
  intro z F
  rw [roundEquatorCapChart_round_inner]
  norm_num [z, PiLp.norm_single, Real.norm_eq_abs]

/-- The physical smooth cap sequence has the actual scalar numerator for
each smooth conformal test, with no form-error constant in this control. -/
example (o : ManifoldOrientation I₄ S₄ 4) (north : Bool) (n : ℕ)
    (u : C^∞⟮I₄, S₄; ℝ⟯) :
    capTestScalar (conformalMetric ((roundEquatorCapSmoothing o north).smooth n).metric u) =
      roundEquatorJoinedForm (capExpFactor u) := by
  change capTestScalar (conformalMetric standardRoundFourMetric u) = _
  rw [capTestScalar_eq_capFactorScalar (by simp : Module.finrank ℝ E₄ = 4),
    ← roundEquatorJoinedForm_eq_capFactorScalar]

end RoundMeasure

/-- The relaxed scalar inverse comparisons admit order-one error even
at weights arbitrarily close to the flat outer endpoint. -/
example {α : ℝ} (hα : 0 < α) (hnear : α < 1 / 2) :
    1 / 2 < fixedWidthRelativeInverseError α (α ^ 2) := by
  unfold fixedWidthRelativeInverseError
  have h1 : 0 < 1 - α := by linarith
  have hDen : 0 < α + (1 - α) * α ^ 2 := by positivity
  rw [lt_div_iff₀ hDen]
  have hαSq : α ^ 2 < 1 / 4 := by nlinarith [mul_pos (sub_pos.2 hnear) (show 0 < 1 / 2 + α by positivity)]
  have hsmall : 0 < 1 - α - α ^ 2 := by linarith
  nlinarith only [mul_pos hα hsmall]

private def pauseCutoffArray (mixed radial : ℝ) (p q i j : Fin 4) : ℝ :=
  if p = 0 ∧ q = 0 ∧ i = 1 ∧ j = 1 then radial
  else if ((p = 0 ∧ q = 1) ∨ (p = 1 ∧ q = 0)) ∧
      ((i = 0 ∧ j = 1) ∨ (i = 1 ∧ j = 0)) then mixed else 0

/-- The sign of the principal cutoff term in the mixed radial/sphere
sectional plane uses the same slot order as the band reconstruction. -/
example (ap app b bp m : ℝ) :
    loweredCurvaturePrincipal (pauseCutoffArray (ap * m) (app * (b - 1) + 2 * ap * bp))
      1 0 1 0 = ap * m - (app * (b - 1) + 2 * ap * bp) / 2 := by
  norm_num [loweredCurvaturePrincipal, pauseCutoffArray]
  ring

private def oneWedge (a b : Fin 4) : ℝ :=
  if a = 0 ∧ b = 1 then 1 else if a = 1 ∧ b = 0 then -1 else 0

private def onePlaneTensor (κ : ℝ) : CurvatureFrameTensor :=
  fun a b c d ↦ κ * oneWedge a b * oneWedge c d

/-- A single mixed sectional curvature of value κ contributes scalar 2κ
and squared Hilbert–Schmidt density κ²/6 to each chirality. -/
example (κ : ℝ) :
    frameScalarCurvature (onePlaneTensor κ) = 2 * κ ∧
      fixedBandChiralDensities (onePlaneTensor κ) = (κ ^ 2 / 6, κ ^ 2 / 6) := by
  constructor
  · norm_num [frameScalarCurvature, frameRicciTensor, onePlaneTensor, oneWedge, Fin.sum_univ_four]
    ring
  · have hp : selfDualCurvatureBlock (onePlaneTensor κ) = Matrix.diagonal ![κ / 2, 0, 0] := by
      ext i j
      fin_cases i <;> fin_cases j <;>
        norm_num [selfDualCurvatureBlock, selfDualFirstWedge, selfDualSecondWedge,
          onePlaneTensor, oneWedge, Matrix.diagonal_apply]
    have hm : antiSelfDualCurvatureBlock (onePlaneTensor κ) = Matrix.diagonal ![κ / 2, 0, 0] := by
      ext i j
      fin_cases i <;> fin_cases j <;>
        norm_num [antiSelfDualCurvatureBlock, selfDualFirstWedge, selfDualSecondWedge,
          onePlaneTensor, oneWedge, Matrix.diagonal_apply]
    rw [fixedBandChiralDensities, hp, hm]
    congr 1 <;> norm_num [SectionsAndConnections.hilbertSchmidtSq, traceFreeChiralBlock,
      Matrix.trace, Matrix.diag_apply, Matrix.smul_apply, Matrix.one_apply, Matrix.diagonal_apply,
      Matrix.sub_apply, Fin.sum_univ_three] <;> ring


/-- The hyperboloid projection to the opposite cuff plane is timelike
with square `-25/2`, using spacelike seam and cuff normals of unit length. -/
example : (1 : ℝ) - (3 * Real.sqrt (3 / 2)) ^ 2 = -(25 / 2 : ℝ) := by
  rw [mul_pow, Real.sq_sqrt (by norm_num : (0 : ℝ) ≤ 3 / 2)]
  norm_num

/-- Numeric normalization for the radius-one-half corridor and its vertical barrier. -/
example : 8 * ((27 : ℝ) / 10) ^ 2 < 59 ∧ 59 < 10 ^ 2 - 4 * ((22 : ℝ) / 7) ^ 2 := by
  norm_num

/-- The leading mixed sectional coefficient at width 1/16 and its squared Weyl normalization. -/
example :
    ((-128 + 64 : ℝ) / ((1 : ℝ) / 16) ^ 2 = -16384) ∧
      ((-16384 : ℝ) ^ 2 / 6 = 134217728 / 3) := by
  norm_num

/-- A positive value on radial vectors leaves a negative transverse direction
even if the very same trial is used on both exchanged copies. -/
example :
    (∀ x : ℝ, x ≠ 0 → 0 < 2 * (x ^ 2 - (0 : ℝ) ^ 2)) ∧
      (∃ u : ℝ × ℝ, 2 * (u.1 ^ 2 - u.2 ^ 2) < 0) := by
  constructor
  · intro x hx
    have h := sq_pos_of_ne_zero hx
    nlinarith
  · exact ⟨(0, 1), by norm_num⟩


section Radial

variable {Closed Core : Type*} {Funnel Trace : Fin 3 → Type*}
variable (a : ThreeCuffForm Closed Core Funnel Trace) (g : ThreeCuffGroundState a)
variable (test : Closed) (hmass : 0 < a.closedNormSq test)

/-- Equality in the rational certificate still gives strict original
negativity at nonzero outer trace. -/
example (b c : ℝ) (hc : c ≠ 0)
    (hForm : a.closedEnergy test = 2 * b + 144 * longCuffLength * c ^ 2)
    (hEq : 2 * b + 661 * c ^ 2 = 0) : a.closedFirstValue < 0 :=
  closedNegative_of_longCuffRadialMargin a g test b c hForm hmass hc hEq.le

/-- A zero numerator at zero outer trace supplies a nonpositive upper
bound for the whole-domain first value. -/
example (hForm : a.closedEnergy test = 0) : a.closedFirstValue ≤ 0 := by
  have hle := g.rayleigh_minimal test hmass
  rw [g.eigenvalue_eq_closedFirstValue, hForm, zero_div] at hle
  exact hle

/-- A strictly negative band numerator certifies negativity at zero trace. -/
example (b : ℝ) (hForm : a.closedEnergy test = 2 * b) (hb : b < 0) :
    a.closedFirstValue < 0 :=
  closedNegative_of_longCuffRadialZeroTrace a g test b hForm hmass hb

end Radial

/-- At a positive maximum the residual estimate controls the position
of the map once the positive least singular value is supplied. -/
example {d m τ η : ℝ} (hm : 0 < m) (hη1 : η < 1)
    (hResidual : τ ≤ η * m ^ 2) (hAtMax : m ^ 2 * Real.tanh d - τ ≤ 0) :
    d ≤ Real.artanh η := by
  have htanh : Real.tanh d ≤ η := by
    by_contra! hn
    have hprod := mul_lt_mul_of_pos_left hn (sq_pos_of_pos hm)
    linarith only [hResidual, hAtMax, hprod]
  rw [← Real.artanh_tanh d]
  exact Real.artanh_le_artanh (Real.neg_one_lt_tanh d) hη1 htanh

/-- The full footprint path fits in 52 steps of length at most `1/16`. -/
example : Real.pi + (9 / 128 : ℝ) < 52 / 16 := by
  nlinarith only [Real.pi_lt_d2]

/-- The annular comparison uses a nonnegative Laplacian residual, and its
squared inverse-radius barrier retains the exact factor `7/144`. -/
example :
    (236 : ℝ) * (1 / 8) ^ 2 < 4 ∧
    ((1 / 4 : ℝ) ^ 2 * (((3 / 4 : ℝ) ^ 2)⁻¹ - 1)) = 7 / 144 := by
  norm_num

private theorem hs_trace_projection_identity (A : Matrix (Fin 3) (Fin 3) ℝ) :
    SectionsAndConnections.hilbertSchmidtSq (traceFreeChiralBlock A) =
      SectionsAndConnections.hilbertSchmidtSq A - A.trace ^ 2 / 3 := by
  simp [SectionsAndConnections.hilbertSchmidtSq, traceFreeChiralBlock, Matrix.trace,
    Matrix.smul_apply, Matrix.one_apply, Fin.sum_univ_three]
  ring

/-- With raw compressed entries bounded by `2M`, trace removal contracts
the squared Hilbert–Schmidt norm and preserves the sharp counting factor 36. -/
example (A : Matrix (Fin 3) (Fin 3) ℝ) (M : ℝ) (hM : 0 ≤ M)
    (hA : ∀ i j, |A i j| ≤ 2 * M) :
    SectionsAndConnections.hilbertSchmidtSq (traceFreeChiralBlock A) ≤ 36 * M ^ 2 := by
  have hEntry (i j : Fin 3) : A i j ^ 2 ≤ (2 * M) ^ 2 := by
    rw [← sq_abs (A i j)]
    exact (sq_le_sq₀ (abs_nonneg _) (by positivity)).mpr (hA i j)
  have hSum : SectionsAndConnections.hilbertSchmidtSq A ≤ ∑ _ : Fin 3, ∑ _ : Fin 3, (2 * M) ^ 2 :=
    Finset.sum_le_sum fun i _ => Finset.sum_le_sum fun j _ => hEntry i j
  simp at hSum
  rw [hs_trace_projection_identity]
  linarith only [hSum, sq_nonneg A.trace]

/-- Chart curvature, the frame change, and the physical band volume all
fit inside the stated coarse complete-band upper bound. -/
example (Λ : ℝ) (hΛ : 1 ≤ Λ) :
    16 * Λ ^ 2 * (4 * (10 ^ 9 : ℝ) ^ 2 + 3 * 10 ^ 19 +
      4 * Λ * (3 * (3 * 10 ^ 14) / 2) ^ 2) ≤ 10 ^ 33 * Λ ^ 3 ∧
    36 * (10 ^ 33 * Λ ^ 3) ^ 2 * (10 ^ 9 : ℝ) ^ 2 * Real.pi ^ 2 ≤ 10 ^ 88 * Λ ^ 6 := by
  constructor
  · have h : 4 * (10 ^ 9 : ℝ) ^ 2 + 3 * 10 ^ 19 + 4 * Λ * (3 * (3 * 10 ^ 14) / 2) ^ 2
        ≤ (10 ^ 33 / 16 : ℝ) * Λ := by linarith only [hΛ]
    have h' := mul_le_mul_of_nonneg_left h (show 0 ≤ 16 * Λ ^ 2 by positivity)
    convert h' using 1
    ring
  · have hpi : Real.pi ^ 2 ≤ 10 := by nlinarith [Real.pi_lt_d2, Real.pi_pos]
    have h' := mul_le_mul_of_nonneg_left hpi
      (show 0 ≤ 36 * (10 ^ 33 * Λ ^ 3) ^ 2 * (10 ^ 9 : ℝ) ^ 2 by positivity)
    have hp : 0 ≤ Λ ^ 6 := by positivity
    nlinarith only [h', hp]

/-- The logarithmic disk recurrence applied to the actual path length count. -/
example (F : ℕ → ℝ) (hstep : ∀ n, F (n + 1) ≤ 3 * F n + 1) :
    F 52 ≤ (3 : ℝ) ^ 52 * F 0 + ((3 : ℝ) ^ 52 - 1) / 2 :=
  harmonicStretch_chain_bound F hstep 52

/-- Arithmetic of the later physical strip estimate, applied to equal
complete chiral band integrals and then summed over both bands. -/
example :
    (130 : ℝ) ^ 2 / 8 * (8 * Real.pi ^ 2 * (128 / 100) / 3200) =
      (169 / 25 : ℝ) * Real.pi ^ 2 ∧ 8 * Real.pi ^ 2 < (338 / 25 : ℝ) * Real.pi ^ 2 := by
  constructor
  · ring
  · nlinarith only [sq_pos_of_pos Real.pi_pos]

/-- The full certified floor 133 gives the stronger per-band and original
closed constants in the same normalization. -/
example :
    (133 : ℝ) ^ 2 / 8 * ((32 / 25) * pauseStripReferenceVolume) =
      (17689 / 2500 : ℝ) * Real.pi ^ 2 ∧
      2 * ((17689 / 2500 : ℝ) * Real.pi ^ 2) = (17689 / 1250 : ℝ) * Real.pi ^ 2 := by
  rw [pauseStripReferenceVolume_eq]
  constructor <;> ring

/-- The supported scalar test and the improved exterior trial have the
strict rational slack claimed in their separate source estimates. -/
example :
    (4 : ℝ) < 6 * (98 / 100) * (126 / 100) -
      (30000 * (105 / 100) * (131 / 100)) / (2 * 80 ^ 2) ∧
    (61402232029847 / 95703125000 : ℝ) < 3208 / 5 := by
  norm_num

/-- Both extreme cells of the kernel-checked forty-cell partition use
the intended closed radial endpoints and clear the same strict floor. -/
example :
    pauseStripCellLeft 0 = 3 / 20 ∧ pauseStripCellRight 39 = 1 / 5 ∧
    (133 : ℚ) < pauseStripCellFloor 0 ∧ (133 : ℚ) < pauseStripCellFloor 39 :=
  ⟨by norm_num [pauseStripCellLeft], by norm_num [pauseStripCellRight, pauseStripCellLeft],
    pauseStripCellFloor_gt_133 0, pauseStripCellFloor_gt_133 39⟩

/-- The rational upper odds endpoint also bounds the real exponential
at the outer edge of the covered interval. -/
example :
    Real.exp (-(pauseStripArgument (pauseStripCellRight 39) : ℝ)) ≤
      (pauseStripOddsUpper (pauseStripCellRight 39) : ℝ) := by
  obtain ⟨_, _, hlo, hhi, _⟩ := pauseStripCell_admissible 39
  exact (pauseStripOdds_enclose _ hlo hhi).2

/-- The real comparison includes the strip's terminal endpoint and a shared
endpoint of two adjacent rational cells. -/
example :
    133 < pauseStripContrastFloor (1 / 5) ∧ 133 < pauseStripContrastFloor (121 / 800) :=
  ⟨pauseStripContrastFloor_gt_133 (by norm_num), pauseStripContrastFloor_gt_133 (by norm_num)⟩

/-- The first and second polynomial estimates use the physical derivative
at the same terminal strip endpoint, where \(16s-1=1/5\). -/
example :
    deriv pauseStripPhysicalOdds (3 / 40) = pauseStripRealSlope (1 / 5) ∧
    deriv (deriv pauseStripPhysicalOdds) (3 / 40) = pauseStripRealSecond (1 / 5) := by
  have h := pauseStripPhysicalOdds_derivs (s := 3 / 40) (by norm_num) (by norm_num)
  have hx : 16 * (3 / 40 : ℝ) - 1 = 1 / 5 := by norm_num
  simpa only [hx] using h

section PauseStripPhysical

variable {E H M : Type*}
  [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  [CompactSpace M] [Nonempty M] [BoundarylessManifold I M]
  {o : ManifoldOrientation I M 4}

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

/-- Integrating on a strip in the conformal representative transfers the
strict lower bound to both complete closed chiral charges on the original
metric. The complete-band balance is supplied on that original metric. -/
example (q : SignedCollarMetric o) (u : C^∞⟮I, M; ℝ⟯)
    (A : SmoothRiemannianMetric I M) {band strip : Set M}
    (hb : MeasurableSet band) (hs : MeasurableSet strip) (hsub : strip ⊆ band)
    (hvolume : (32 / 25) * pauseStripReferenceVolume < (riemannianVolumeMeasure I M A).real strip)
    (hmetric : ∀ x ∈ strip, ∀ v : TangentSpace I x,
      A.inner x v v ≤ (q.conformal u).metric.inner x v v)
    (x : M → ℝ) (hx : ∀ p ∈ strip, x p ∈ Icc (3 / 20 : ℝ) (1 / 5))
    (hjet : ∀ p ∈ strip, pauseStripContrastFloor (x p) ≤ |pauseStripSectionalContrast
      (metricCurvatureFrameTensor (q.conformal u).metric o p ((q.conformal u).frame p))|)
    (hbalance : q.charge .plus band = q.charge .minus band)
    (cost : ThreeCuffBandCosts) (hcost : cost.plus 0 = q.charge .plus band)
    (hexchange : cost.plus 0 = cost.minus 1) :
    (32 / 25) * pauseStripReferenceVolume <
      (riemannianVolumeMeasure I M (q.conformal u).metric).real strip ∧
    (17689 / 1250) * Real.pi ^ 2 < cost.closedPlus ∧
    (17689 / 1250) * Real.pi ^ 2 < cost.closedMinus ∧
    (17689 / 625) * Real.pi ^ 2 < cost.commonDoubleEach ∧
    ¬ (cost.closedPlus < threeCuffEntryWall ∧ cost.closedMinus < threeCuffEntryWall) := by
  have hphysical := pauseStripPhysicalVolume_gt A (q.conformal u).metric hs hvolume hmetric
  obtain ⟨_, hplus, hminus, hwall⟩ := pauseStrip_original_signed_costs_gt q u A hb hs hsub
    hvolume hmetric x hx hjet cost hcost hbalance hexchange
  refine ⟨hphysical, hplus, hminus, ?_, hwall⟩
  unfold ThreeCuffBandCosts.commonDoubleEach
  linarith only [hplus, hminus]

end PauseStripPhysical

#print axioms roundEquatorCapChart_inverse
#print axioms roundEquatorCapChart_round_inner
#print axioms roundEquatorCapChart_same_boundary
#print axioms roundEquatorCapChart_tracks_marking
#print axioms roundEquator_orientedReassembly
#print axioms roundEquator_rawCover_and_nullOverlap
#print axioms roundEquatorJoinedForm_eq_sideSum
#print axioms roundEquatorCapSmoothing
#print axioms roundEquator_exact_cap
#print axioms longCuffRadialResponse_lt_661
#print axioms closedNegative_of_longCuffRadialMargin
#print axioms closedNegative_of_longCuffRadialZeroTrace
#print axioms fixedWidthRelativeInverseError_le_iff
#print axioms outerPoleSectional_scaled_limit
#print axioms pauseBarrier_lap
#print axioms pauseTransverseBarrier_le
#print axioms pauseTransverseDerivative_ge
#print axioms pauseMetric_lower
#print axioms pauseMetric_near_lower
#print axioms outerPoleLeading_chiralDensities

#print axioms harmonicStretch_poissonKernel_le_three
#print axioms harmonicStretch_diskBarrier
#print axioms harmonicStretch_harnackStep
#print axioms harmonicStretch_chain_bound

#print axioms harmonicDiskBarrier_le
#print axioms harmonicDisk_propagate
#print axioms harmonicDisk_chain
#print axioms planarSmallStretch_floor
#print axioms fixedBand_frameSq_le
#print axioms fullBand_signedCost_le

#print axioms pauseStripCell_admissible
#print axioms pauseStripCellFloor_gt_133
#print axioms pauseStripExp_bounds
#print axioms pauseStripOdds_enclose
#print axioms pauseStripCell_cover
#print axioms pauseStripPolynomial_cell_enclosure
#print axioms pauseStripContrastFloor_gt_133
#print axioms pauseStripPhysicalOdds_hasDerivAt
#print axioms pauseStripPhysicalSlope_hasDerivAt
#print axioms pauseStripPhysicalOdds_derivs
#print axioms pauseStripSectionalContrast_sq_le_chiral
#print axioms pauseStripPhysicalVolume_gt
#print axioms pauseStripCompleteBand_cost_gt
#print axioms pauseStripClosed_cost_gt_and_excludesEntry
#print axioms pauseStrip_longCuffTrial_excluded
#print axioms pauseStrip_original_signed_costs_gt
