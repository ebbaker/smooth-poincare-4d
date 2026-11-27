import Mathlib.MeasureTheory.Integral.Bochner.ContinuousLinearMap
import Mathlib.MeasureTheory.Function.LpSpace.Basic
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Basic

/-!
# The inclusive mean-curvature trace bound on a marked ball cap

In four dimensions the conformal Laplacian has Dirichlet coefficient six,
and with outward trace mean curvature the boundary coefficient is two.
The geometric and Sobolev suppliers are the marked boundary jet, the common
trace on the joined Sobolev domain, conformal covariance on the cap, sharp
Euclidean ball trace, zero-trace Poincaré and compact spectral attainment.
-/

noncomputable section

open Filter MeasureTheory Set
open scoped ENNReal

namespace SmoothPoincare.IntrinsicEntry

/-- The sharp trace coefficient before multiplication by six. -/
def roundBallTraceConstant : ℝ := (2 * Real.pi ^ 2) ^ (1 / 3 : ℝ)

/-- The inclusive bound on the outward negative mean-curvature part. -/
def roundBallMeanThreshold : ℝ := 3 * roundBallTraceConstant

/-- The norm of the outward negative part in the physical boundary measure. -/
def negativeMeanL3 {B : Type*} [MeasurableSpace B] (μ : Measure B) (H : B → ℝ) : ℝ :=
  (∫ x, (max (-H x) 0) ^ 3 ∂μ) ^ (1 / 3 : ℝ)

/-- The squared boundary trace norm. -/
def ballTraceL3Sq {B : Type*} [MeasurableSpace B] (μ : Measure B) (f : B → ℝ) : ℝ :=
  (∫ x, |f x| ^ 3 ∂μ) ^ (2 / 3 : ℝ)

private theorem ballTraceL3Sq_nonneg {B : Type*} [MeasurableSpace B]
    (μ : Measure B) (f : B → ℝ) : 0 ≤ ballTraceL3Sq μ f :=
  Real.rpow_nonneg (integral_nonneg fun x ↦ pow_nonneg (abs_nonneg (f x)) _) _

/-- The unit constant trace saturates the sharp ball inequality when its
extension is constant and the sphere has its unit round area. -/
theorem roundBallTraceConstant_unitTrace {B : Type*} [MeasurableSpace B] (μ : Measure B)
    (hArea : μ.real univ = 2 * Real.pi ^ 2) :
    roundBallTraceConstant * ballTraceL3Sq μ (fun _ ↦ 1) =
      ∫ _ : B, (1 : ℝ) ^ 2 ∂μ := by
  simp only [roundBallTraceConstant, ballTraceL3Sq, abs_one, one_pow, integral_const,
    smul_eq_mul, mul_one, hArea]
  rw [← Real.rpow_add (by positivity : 0 < 2 * Real.pi ^ 2)]
  norm_num

/-- The cubic conformal Jacobian of a three-dimensional boundary. -/
def ballBoundaryVolume {B : Type*} [MeasurableSpace B] (μ : Measure B) (w : B → ℝ) :
    Measure B :=
  μ.withDensity fun x ↦ ENNReal.ofReal (w x ^ 3)

/-- Conformal multiplication exactly transports the squared boundary trace norm. -/
theorem ballTraceL3Sq_conformal {B : Type*} [MeasurableSpace B]
    (μ : Measure B) {w : B → ℝ} (hw : Measurable w) (hwp : ∀ x, 0 < w x)
    (f : B → ℝ) :
    ballTraceL3Sq (ballBoundaryVolume μ w) f = ballTraceL3Sq μ (fun x ↦ w x * f x) := by
  unfold ballTraceL3Sq ballBoundaryVolume
  rw [integral_withDensity_eq_integral_toReal_smul (hw.pow_const 3).ennreal_ofReal
    (ae_of_all _ fun _ ↦ ENNReal.ofReal_lt_top)]
  congr 1
  apply integral_congr_ae
  exact ae_of_all _ fun x ↦ by
    change (ENNReal.ofReal (w x ^ 3)).toReal • |f x| ^ 3 = |w x * f x| ^ 3
    rw [ENNReal.toReal_ofReal (pow_nonneg (hwp x).le 3), smul_eq_mul, abs_mul,
      abs_of_pos (hwp x), mul_pow]

private theorem boundary_square_memLp {B : Type*} [MeasurableSpace B] {μ : Measure B}
    {f : B → ℝ} (hf : MemLp f 3 μ) : MemLp (fun x ↦ f x ^ 2) (3 / 2) μ := by
  convert hf.norm_rpow_div 2 using 1
  ext x
  simp [Real.norm_eq_abs, ← abs_pow, abs_of_nonneg (sq_nonneg (f x))]

private theorem boundary_exponents_holder : (3 : ℝ≥0∞).HolderConjugate (3 / 2) := by
  constructor
  rw [ENNReal.inv_div, ← one_div]
  have hOneThird : (1 / 3 : ℝ≥0∞) = ENNReal.ofReal (1 / 3) := by
    rw [ENNReal.ofReal_div_of_pos (by norm_num : (0 : ℝ) < 3)]
    simp
  have hTwoThird : (2 / 3 : ℝ≥0∞) = ENNReal.ofReal (2 / 3) := by
    rw [ENNReal.ofReal_div_of_pos (by norm_num : (0 : ℝ) < 3)]
    simp
  rw [hOneThird, hTwoThird, ← ENNReal.ofReal_add (by norm_num) (by norm_num)]
  norm_num
  all_goals simp

/-- The mean curvature term is integrable against the squared critical trace. -/
theorem boundary_mean_mul_sq_integrable {B : Type*} [MeasurableSpace B] {μ : Measure B}
    {H f : B → ℝ} (hH : MemLp H 3 μ) (hf : MemLp f 3 μ) :
    Integrable (fun x ↦ H x * f x ^ 2) μ := by
  have := boundary_exponents_holder
  exact hH.integrable_mul (boundary_square_memLp hf)

/-- Hölder on the actual boundary volume controls the adverse Robin term. -/
theorem integral_mean_mul_sq_lower {B : Type*} [MeasurableSpace B] {μ : Measure B}
    {H f : B → ℝ} (hH : MemLp H 3 μ) (hf : MemLp f 3 μ) :
    -negativeMeanL3 μ H * ballTraceL3Sq μ f ≤ ∫ x, H x * f x ^ 2 ∂μ := by
  let Hminus : B → ℝ := fun x ↦ max (-H x) 0
  have hminusNonneg (x : B) : 0 ≤ Hminus x := le_max_right _ _
  have hminus : MemLp Hminus 3 μ :=
    hH.norm.mono' ((hH.aestronglyMeasurable.aemeasurable.neg.max
      aemeasurable_const).aestronglyMeasurable)
      (ae_of_all _ fun x ↦ by
        rw [Real.norm_of_nonneg (hminusNonneg x), Real.norm_eq_abs]
        exact max_le (neg_le_abs _) (abs_nonneg _))
  have hsq := boundary_square_memLp hf
  have hconj : (3 : ℝ).HolderConjugate (3 / 2) :=
    Real.holderConjugate_iff.mpr (by norm_num)
  have hExponent : ENNReal.ofReal (3 / 2) = 3 / 2 := by
    rw [ENNReal.ofReal_div_of_pos (by norm_num : (0 : ℝ) < 2)]
    simp
  have hHolder := integral_mul_le_Lp_mul_Lq_of_nonneg hconj
    (ae_of_all μ hminusNonneg) (ae_of_all μ fun x ↦ sq_nonneg (f x))
    (by simpa using hminus : MemLp Hminus (ENNReal.ofReal 3) μ)
    (by rw [hExponent]; exact hsq : MemLp (fun x ↦ f x ^ 2) (ENNReal.ofReal (3 / 2)) μ)
  have hpow (x : B) : (f x ^ 2) ^ (3 / 2 : ℝ) = |f x| ^ (3 : ℕ) := by
    rw [show f x ^ 2 = |f x| ^ (2 : ℕ) by
      rw [← abs_pow, abs_of_nonneg (sq_nonneg _)]]
    rw [← Real.rpow_natCast (|f x|) 2, ← Real.rpow_mul (abs_nonneg _),
      show (↑(2 : ℕ) : ℝ) * (3 / 2) = ↑(3 : ℕ) by norm_num, Real.rpow_natCast]
  have hnorm : (∫ x, Hminus x * f x ^ 2 ∂μ) ≤
      negativeMeanL3 μ H * ballTraceL3Sq μ f := by
    have hcube (x : B) : Hminus x ^ (3 : ℝ) = Hminus x ^ (3 : ℕ) :=
      Real.rpow_natCast _ 3
    simpa only [hpow, hcube, show (1 / (3 / 2) : ℝ) = 2 / 3 by norm_num,
      negativeMeanL3, ballTraceL3Sq, Hminus] using hHolder
  have hnegInt := boundary_mean_mul_sq_integrable hminus hf
  have hmeanInt := boundary_mean_mul_sq_integrable hH hf
  have hmono : -(∫ x, Hminus x * f x ^ 2 ∂μ) ≤ ∫ x, H x * f x ^ 2 ∂μ := by
    rw [← integral_neg]
    apply integral_mono hnegInt.neg hmeanInt
    intro x
    rw [Pi.neg_apply, ← neg_mul]
    exact mul_le_mul_of_nonneg_right (neg_le.mp (le_max_left (-H x) 0)) (sq_nonneg _)
  linarith

/-- The chart data for the ball cap, using the side and cap outward normals. -/
structure MatchedBallBoundaryJet (B : Type*) where
  factor : B → ℝ
  factorPos : ∀ x, 0 < factor x
  outwardMean : B → ℝ
  capOutwardMean : B → ℝ
  outwardLogDerivative : B → ℝ
  prescribedDerivative : ∀ x, 3 * outwardLogDerivative x = -factor x * outwardMean x - 3
  conformalMeanChange : ∀ x, factor x * capOutwardMean x = 3 + 3 * outwardLogDerivative x

/-- The derivative prescription cancels the outward mean curvatures. -/
theorem MatchedBallBoundaryJet.capOutwardMean_eq_neg {B : Type*}
    (J : MatchedBallBoundaryJet B) (x : B) : J.capOutwardMean x = -J.outwardMean x := by
  apply mul_left_cancel₀ (J.factorPos x).ne'
  rw [J.conformalMeanChange, J.prescribedDerivative]
  ring

/-- In any tangential frame, matching the metric and opposite means matches the
full first jet of the two umbilic sides. The common metric entry is (h_{ij}). -/
theorem MatchedBallBoundaryJet.umbilicSecondForm_add_eq_zero {B : Type*}
    (J : MatchedBallBoundaryJet B) (x : B) (hij : ℝ) :
    J.outwardMean x / 3 * hij + J.capOutwardMean x / 3 * hij = 0 := by
  rw [J.capOutwardMean_eq_neg]
  ring

/-- The matched ball data on the joined test domain. The core volume and scalar
curvature refer to one restricted positive representative. The cap chart
represents the unit ball, and its boundary measure represents the unit sphere.
The cap bulk is physical, and its Robin term is identified with the transformed
Euclidean numerator by `capRobinCovariance`. -/
structure MatchedBallRobinData (V C B Test : Type*) [MeasurableSpace V] [MeasurableSpace C]
    [MeasurableSpace B] where
  coreVolume : Measure V
  coreScalar : V → ℝ
  coreScalarPositive : ∀ᵐ x ∂coreVolume, 0 < coreScalar x
  coreRestriction : Test → V → ℝ
  coreGradientSq : Test → V → ℝ
  coreGradientNonneg : ∀ t, 0 ≤ᵐ[coreVolume] coreGradientSq t
  corePotentialIntegrable : ∀ t, Integrable (fun x ↦ coreScalar x * coreRestriction t x ^ 2)
    coreVolume
  capRestriction : Test → C → ℝ
  capFactor : C → ℝ
  capFactorPositive : ∀ x, 0 < capFactor x
  capFactorMeasurable : Measurable capFactor
  euclideanVolume : Measure C
  euclideanBoundaryVolume : Measure B
  jet : MatchedBallBoundaryJet B
  boundaryFactorMeasurable : Measurable jet.factor
  outwardMeanMemLp : MemLp jet.outwardMean 3 (ballBoundaryVolume euclideanBoundaryVolume jet.factor)
  coreTrace : Test → B → ℝ
  capTrace : Test → B → ℝ
  traceMatch : ∀ t, capTrace t =ᵐ[ballBoundaryVolume euclideanBoundaryVolume jet.factor] coreTrace t
  traceMemLp : ∀ t, MemLp (coreTrace t) 3 (ballBoundaryVolume euclideanBoundaryVolume jet.factor)
  coreTraceZero : ∀ t, coreRestriction t =ᵐ[coreVolume] 0 →
    coreTrace t =ᵐ[ballBoundaryVolume euclideanBoundaryVolume jet.factor] 0
  euclideanGradientSq : (C → ℝ) → C → ℝ
  transformedCapL2 : ∀ t, Integrable (fun x ↦ (capFactor x * capRestriction t x) ^ 2) euclideanVolume
  capBulk : Test → ℝ
  capRobinCovariance : ∀ t,
    capBulk t + 2 * (∫ x, jet.capOutwardMean x * capTrace t x ^ 2
      ∂ballBoundaryVolume euclideanBoundaryVolume jet.factor) =
    6 * ((∫ x, euclideanGradientSq (fun y ↦ capFactor y * capRestriction t y) x ∂euclideanVolume) +
      ∫ x, (jet.factor x * coreTrace t x) ^ 2 ∂euclideanBoundaryVolume)
  sharpBallTrace : ∀ t,
    roundBallTraceConstant *
      ballTraceL3Sq euclideanBoundaryVolume (fun x ↦ jet.factor x * coreTrace t x) ≤
    (∫ x, euclideanGradientSq (fun y ↦ capFactor y * capRestriction t y) x ∂euclideanVolume) +
      ∫ x, (jet.factor x * coreTrace t x) ^ 2 ∂euclideanBoundaryVolume
  zeroTracePoincare : ∃ K : ℝ, 0 < K ∧ ∀ t,
    (fun x ↦ jet.factor x * coreTrace t x) =ᵐ[euclideanBoundaryVolume] 0 →
      (∫ x, (capFactor x * capRestriction t x) ^ 2 ∂euclideanVolume) ≤
        K * (∫ x, euclideanGradientSq (fun y ↦ capFactor y * capRestriction t y) x
          ∂euclideanVolume)

namespace MatchedBallRobinData

variable {V C B Test : Type*} [MeasurableSpace V] [MeasurableSpace C] [MeasurableSpace B]
variable (D : MatchedBallRobinData V C B Test)

/-- The trace mean curvature of the core, using its outward unit normal. -/
abbrev outwardMean : B → ℝ := D.jet.outwardMean

/-- The volume of the common boundary in the physical representative. -/
abbrev boundaryVolume : Measure B := ballBoundaryVolume D.euclideanBoundaryVolume D.jet.factor

/-- The physical four-dimensional cap measure. -/
def capVolume : Measure C := D.euclideanVolume.withDensity fun x ↦ ENNReal.ofReal (D.capFactor x ^ 4)

/-- The transformed cap Dirichlet integral in the unit ball coordinates. -/
def capDirichlet (t : Test) : ℝ :=
  ∫ x, D.euclideanGradientSq (fun y ↦ D.capFactor y * D.capRestriction t y) x ∂D.euclideanVolume

/-- The transformed boundary square in the unit sphere coordinates. -/
def ballBoundarySquare (t : Test) : ℝ :=
  ∫ x, (D.jet.factor x * D.coreTrace t x) ^ 2 ∂D.euclideanBoundaryVolume

/-- The core bulk part of the conformal-Laplacian numerator. -/
def coreBulk (t : Test) : ℝ :=
  6 * (∫ x, D.coreGradientSq t x ∂D.coreVolume) +
    ∫ x, D.coreScalar x * D.coreRestriction t x ^ 2 ∂D.coreVolume

/-- The core Robin boundary contribution with outward trace coefficient two. -/
def coreRobinBoundary (t : Test) : ℝ :=
  2 * ∫ x, D.outwardMean x * D.coreTrace t x ^ 2 ∂D.boundaryVolume

/-- The physical cap Robin form. -/
def capRobinForm (t : Test) : ℝ :=
  D.capBulk t + 2 * ∫ x, D.jet.capOutwardMean x * D.capTrace t x ^ 2 ∂D.boundaryVolume

/-- The weak scalar numerator of the first-jet-matched join. -/
def joinedForm (t : Test) : ℝ := D.coreBulk t + D.capBulk t

/-- The squared physical joined (L²) norm. -/
def joinedMassSq (t : Test) : ℝ :=
  (∫ x, D.coreRestriction t x ^ 2 ∂D.coreVolume) +
    ∫ x, D.capRestriction t x ^ 2 ∂D.capVolume

/-- The image of the Rayleigh quotient over tests of positive physical mass. -/
def rayleighValues : Set ℝ :=
  (fun t ↦ D.joinedForm t / D.joinedMassSq t) '' {t | 0 < D.joinedMassSq t}

/-- The first closed eigenvalue, expressed as a Rayleigh infimum. -/
def firstEigenvalue : ℝ := sInf D.rayleighValues

/-- The compact elliptic form supplies a unit-mass minimizing test in the
same joined Sobolev domain. -/
def HasGroundState : Prop :=
  ∃ t, D.joinedMassSq t = 1 ∧
    ∀ s, 0 < D.joinedMassSq s → D.joinedForm t ≤ D.joinedForm s / D.joinedMassSq s

theorem groundState_isLeast (hground : D.HasGroundState) :
    IsLeast D.rayleighValues D.firstEigenvalue := by
  obtain ⟨t, hmass, hmin⟩ := hground
  have hleast : IsLeast D.rayleighValues (D.joinedForm t) := by
    refine ⟨⟨t, by simp [hmass], by simp [hmass]⟩, ?_⟩
    rintro _ ⟨s, hsmass, rfl⟩
    exact hmin s hsmass
  simpa only [firstEigenvalue, hleast.csInf_eq] using hleast

/-- The bound on the exact joined form that follows from the first Rayleigh value. -/
theorem firstEigenvalue_mul_mass_le_form (hground : D.HasGroundState) (t : Test)
    (hmass : 0 < D.joinedMassSq t) :
    D.firstEigenvalue * D.joinedMassSq t ≤ D.joinedForm t :=
  (le_div_iff₀ hmass).mp ((D.groundState_isLeast hground).2 ⟨t, hmass, rfl⟩)

theorem joinedForm_eq_robinSum (t : Test) :
    D.joinedForm t = D.coreBulk t + D.coreRobinBoundary t + D.capRobinForm t := by
  have hcancel :
      (∫ x, D.jet.capOutwardMean x * D.capTrace t x ^ 2 ∂D.boundaryVolume) =
        -(∫ x, D.outwardMean x * D.coreTrace t x ^ 2 ∂D.boundaryVolume) := by
    rw [← integral_neg]
    apply integral_congr_ae
    filter_upwards [D.traceMatch t] with x hx
    rw [D.jet.capOutwardMean_eq_neg, hx, neg_mul]
  unfold joinedForm coreRobinBoundary capRobinForm
  rw [hcancel]
  ring

theorem capRobinForm_lower (t : Test) :
    6 * roundBallTraceConstant * ballTraceL3Sq D.boundaryVolume (D.coreTrace t) ≤
      D.capRobinForm t := by
  rw [ballTraceL3Sq_conformal _ D.boundaryFactorMeasurable D.jet.factorPos]
  change _ ≤ D.capBulk t + 2 * _
  rw [D.capRobinCovariance]
  linarith [D.sharpBallTrace t]

/-- The sharp cap bound absorbs the adverse part of the core trace.
The coefficient of the residual trace term may be zero. -/
theorem coreBulk_traceMargin_le_joinedForm (t : Test) :
    D.coreBulk t + 2 * (roundBallMeanThreshold -
      negativeMeanL3 D.boundaryVolume D.outwardMean) *
        ballTraceL3Sq D.boundaryVolume (D.coreTrace t) ≤ D.joinedForm t := by
  rw [D.joinedForm_eq_robinSum]
  have hbound := D.capRobinForm_lower t
  have hmean := integral_mean_mul_sq_lower D.outwardMeanMemLp (D.traceMemLp t)
  unfold roundBallMeanThreshold coreRobinBoundary
  linarith only [hbound, hmean]

/-- The positive-scalar core has a positive bulk term on each nonzero restriction. -/
theorem coreBulk_pos_of_coreNonzero (t : Test)
    (hcore : ¬ D.coreRestriction t =ᵐ[D.coreVolume] 0) :
    0 < D.coreBulk t := by
  have hgrad := integral_nonneg_of_ae (D.coreGradientNonneg t)
  have hpotNonneg : 0 ≤ᵐ[D.coreVolume] fun x ↦ D.coreScalar x * D.coreRestriction t x ^ 2 := by
    filter_upwards [D.coreScalarPositive] with x hx
    exact mul_nonneg hx.le (sq_nonneg _)
  have hpot : 0 < ∫ x, D.coreScalar x * D.coreRestriction t x ^ 2 ∂D.coreVolume := by
    apply lt_of_le_of_ne (integral_nonneg_of_ae hpotNonneg)
    intro hz
    have hzero := (integral_eq_zero_iff_of_nonneg_ae hpotNonneg
      (D.corePotentialIntegrable t)).mp hz.symm
    apply hcore
    filter_upwards [hzero, D.coreScalarPositive] with x hx hR
    have hpow : D.coreRestriction t x ^ 2 = 0 := (mul_eq_zero.mp hx).resolve_left hR.ne'
    simpa using hpow
  unfold coreBulk
  linarith

/-- A nonzero restriction to the positive-scalar core gives strict positivity
even when the trace margin vanishes. -/
theorem joinedForm_pos_of_coreNonzero (t : Test)
    (hbound : negativeMeanL3 D.boundaryVolume D.outwardMean ≤ roundBallMeanThreshold)
    (hcore : ¬ D.coreRestriction t =ᵐ[D.coreVolume] 0) :
    0 < D.joinedForm t := by
  have hbulk := D.coreBulk_pos_of_coreNonzero t hcore
  have hmargin := mul_nonneg (mul_nonneg (by norm_num : (0 : ℝ) ≤ 2) (sub_nonneg.mpr hbound))
    (ballTraceL3Sq_nonneg D.boundaryVolume (D.coreTrace t))
  linarith [D.coreBulk_traceMargin_le_joinedForm t]

private theorem euclideanTraceZero (t : Test) (hcore : D.coreRestriction t =ᵐ[D.coreVolume] 0) :
    (fun x ↦ D.jet.factor x * D.coreTrace t x) =ᵐ[D.euclideanBoundaryVolume] 0 := by
  have h := (ae_withDensity_iff (D.boundaryFactorMeasurable.pow_const 3).ennreal_ofReal).mp
    (D.coreTraceZero t hcore)
  filter_upwards [h] with x hx
  have hx0 := hx (ne_of_gt (ENNReal.ofReal_pos.mpr (pow_pos (D.jet.factorPos x) 3)))
  change D.jet.factor x * D.coreTrace t x = 0
  rw [hx0]
  simp

private theorem capRestriction_nonzero (t : Test)
    (hmass : 0 < D.joinedMassSq t) (hcore : D.coreRestriction t =ᵐ[D.coreVolume] 0) :
    ¬ D.capRestriction t =ᵐ[D.euclideanVolume] 0 := by
  intro hcap
  have hcap' : D.capRestriction t =ᵐ[D.capVolume] 0 :=
    (ae_withDensity_iff (D.capFactorMeasurable.pow_const 4).ennreal_ofReal).mpr
      (hcap.mono fun _ hx _ ↦ hx)
  have hcoreSq : (fun x ↦ D.coreRestriction t x ^ 2) =ᵐ[D.coreVolume] 0 :=
    hcore.mono fun x hx ↦ by simp [hx]
  have hcapSq : (fun x ↦ D.capRestriction t x ^ 2) =ᵐ[D.capVolume] 0 :=
    hcap'.mono fun x hx ↦ by simp [hx]
  simp [joinedMassSq, integral_congr_ae hcoreSq, integral_congr_ae hcapSq] at hmass

/-- A cap-supported test has zero common trace. Its positive Dirichlet
contribution follows from Poincaré and the strictly positive cap factor. -/
theorem joinedForm_pos_of_coreZero (t : Test) (hmass : 0 < D.joinedMassSq t)
    (hcore : D.coreRestriction t =ᵐ[D.coreVolume] 0) : 0 < D.joinedForm t := by
  have hcap := D.capRestriction_nonzero t hmass hcore
  have hf := D.euclideanTraceZero t hcore
  have hnormPos : 0 < ∫ x, (D.capFactor x * D.capRestriction t x) ^ 2 ∂D.euclideanVolume := by
    have hn := ae_of_all D.euclideanVolume fun x ↦ sq_nonneg (D.capFactor x * D.capRestriction t x)
    apply lt_of_le_of_ne (integral_nonneg_of_ae hn)
    intro hz
    have hzero :=
      (integral_eq_zero_iff_of_nonneg_ae hn (D.transformedCapL2 t)).mp hz.symm
    apply hcap
    filter_upwards [hzero] with x hx
    have hprod : D.capFactor x * D.capRestriction t x = 0 := by simpa using hx
    exact (mul_eq_zero.mp hprod).resolve_left (D.capFactorPositive x).ne'
  obtain ⟨K, hK, hp⟩ := D.zeroTracePoincare
  have hDir : 0 < D.capDirichlet t :=
    pos_of_mul_pos_right (hnormPos.trans_le (hp t hf)) hK.le
  have hbd : D.ballBoundarySquare t = 0 := by
    have hz : (fun x ↦ (D.jet.factor x * D.coreTrace t x) ^ 2) =ᵐ[D.euclideanBoundaryVolume]
        (fun _ ↦ (0 : ℝ)) := hf.mono fun x hx ↦ by
      change D.jet.factor x * D.coreTrace t x = 0 at hx
      simp [hx]
    rw [ballBoundarySquare, integral_congr_ae hz, integral_zero]
  have hcoreBoundary : D.coreRobinBoundary t = 0 := by
    have hz : (fun x ↦ D.outwardMean x * D.coreTrace t x ^ 2) =ᵐ[D.boundaryVolume] 0 :=
      (D.coreTraceZero t hcore).mono fun x hx ↦ by simp [hx]
    simp [coreRobinBoundary, integral_congr_ae hz]
  have hcoreBulk : 0 ≤ D.coreBulk t := by
    have hz : (fun x ↦ D.coreScalar x * D.coreRestriction t x ^ 2) =ᵐ[D.coreVolume]
        (fun _ ↦ (0 : ℝ)) :=
      hcore.mono fun x hx ↦ by simp [hx]
    rw [coreBulk, integral_congr_ae hz, integral_zero, add_zero]
    exact mul_nonneg (by norm_num) (integral_nonneg_of_ae (D.coreGradientNonneg t))
  rw [D.joinedForm_eq_robinSum, hcoreBoundary, add_zero]
  have hcapForm : D.capRobinForm t = 6 * (D.capDirichlet t + D.ballBoundarySquare t) :=
    D.capRobinCovariance t
  linarith

theorem joinedForm_pos_of_traceBound (t : Test)
    (hbound : negativeMeanL3 D.boundaryVolume D.outwardMean ≤ roundBallMeanThreshold)
    (hmass : 0 < D.joinedMassSq t) : 0 < D.joinedForm t := by
  by_cases hcore : D.coreRestriction t =ᵐ[D.coreVolume] 0
  · exact D.joinedForm_pos_of_coreZero t hmass hcore
  · exact D.joinedForm_pos_of_coreNonzero t hbound hcore

theorem firstEigenvalue_pos_of_joinedForm_pos (hground : D.HasGroundState)
    (hform : ∀ t, 0 < D.joinedMassSq t → 0 < D.joinedForm t) : 0 < D.firstEigenvalue := by
  obtain ⟨t, hmass, hrayleigh⟩ := (D.groundState_isLeast hground).1
  rw [← hrayleigh]
  exact div_pos (hform t hmass) hmass

end MatchedBallRobinData

/-- The inclusive trace bound gives strict spectral positivity of the
actual matched test form, using its compactly attained ground state. -/
theorem matchedBall_robinPositive_of_traceBound
    {V C B Test : Type*} [MeasurableSpace V] [MeasurableSpace C] [MeasurableSpace B]
    (D : MatchedBallRobinData V C B Test) (hground : D.HasGroundState)
    (hbound : negativeMeanL3 D.boundaryVolume D.outwardMean ≤ roundBallMeanThreshold) :
    0 < D.firstEigenvalue :=
  D.firstEigenvalue_pos_of_joinedForm_pos hground fun t ↦ D.joinedForm_pos_of_traceBound t hbound

/-- For two outward normals on the same boundary, the two cap tests use the
negative and positive parts of one physical mean curvature. -/
theorem matchedBall_twoSidedPositive_of_traceBound
    {V₁ C₁ V₂ C₂ B Test₁ Test₂ : Type*} [MeasurableSpace V₁] [MeasurableSpace C₁]
    [MeasurableSpace V₂] [MeasurableSpace C₂] [MeasurableSpace B]
    (D₁ : MatchedBallRobinData V₁ C₁ B Test₁) (D₂ : MatchedBallRobinData V₂ C₂ B Test₂)
    (hground₁ : D₁.HasGroundState) (hground₂ : D₂.HasGroundState)
    (hmeasure : D₂.boundaryVolume = D₁.boundaryVolume)
    (homean : D₂.outwardMean = -D₁.outwardMean)
    (hbound : max (negativeMeanL3 D₁.boundaryVolume D₁.outwardMean)
      (negativeMeanL3 D₁.boundaryVolume (-D₁.outwardMean)) ≤ roundBallMeanThreshold) :
    0 < D₁.firstEigenvalue ∧ 0 < D₂.firstEigenvalue := by
  refine ⟨matchedBall_robinPositive_of_traceBound D₁ hground₁ (le_max_left _ _ |>.trans hbound),
    matchedBall_robinPositive_of_traceBound D₂ hground₂ ?_⟩
  rw [hmeasure, homean]
  exact (le_max_right _ _).trans hbound

end SmoothPoincare.IntrinsicEntry
