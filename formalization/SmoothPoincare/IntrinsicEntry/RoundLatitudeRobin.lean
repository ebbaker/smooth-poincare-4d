import SmoothPoincare.IntrinsicEntry.MatchedBallMetric
import SmoothPoincare.Variational.RoundLatitudeProduct
import SmoothPoincare.Variational.AttainedRecognition
import DifferentialGeometry.Analysis.Integration.Measure.Conformal
import DifferentialGeometry.Geometry.Curvature.ScalarSectional
import Mathlib.MeasureTheory.Constructions.HaarToSphere
import Mathlib.MeasureTheory.Measure.Lebesgue.VolumeOfBalls

/-! # Physical Robin input on a round latitude -/

open DifferentialGeometry DifferentialGeometry.Geometry DifferentialGeometry.Geometry.Curvature
open DifferentialGeometry.Integral.Measure FirstOrderTwistor MeasureTheory Metric Set
open scoped ContDiff ENNReal Manifold RealInnerProductSpace

noncomputable section

namespace SmoothPoincare.IntrinsicEntry

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "S₃" => sphere (0 : E₄) 1
local instance : Fact (Module.finrank ℝ E₄ = 3 + 1) := ⟨by simp⟩
local instance : Fact (Module.finrank ℝ (EuclideanSpace ℝ (Fin 5)) = 4 + 1) := ⟨by simp⟩
open scoped SmoothPoincare

/-- Outward trace for the side containing the north pole, with polar distance
increasing from the north pole. The south side takes the opposite sign. -/
def roundLatitudeOutwardMean (a : ℝ) : ℝ := 3 * Real.cos a / Real.sin a

/-- Half the radial derivative of the actual angular metric in the round
polar chart gives the full outward umbilic form. The metric is pulled back by
the latitude chart and the radial lapse equals one. -/
theorem roundLatitude_angular_firstJet (p : StandardFourSphere) (u : PolarDir p) {a : ℝ}
    (ha : a ∈ Ioo 0 Real.pi) (v w : TangentSpace (𝓡 3) u) :
    let angular := (roundMetric (n := 3)).inner u v w
    deriv (fun r : ℝ => Real.sin r ^ 2 * angular) a / 2 =
      roundLatitudeOutwardMean a / 3 * (Real.sin a ^ 2 * angular) := by
  intro angular
  have hDeriv := (((Real.hasDerivAt_sin a).pow 2).mul_const angular).deriv
  norm_num only [Pi.pow_apply, Nat.cast_ofNat, Nat.reduceSubDiff, pow_one] at hDeriv
  rw [hDeriv]
  unfold roundLatitudeOutwardMean
  field_simp [(Real.sin_pos_of_pos_of_lt_pi ha.1 ha.2).ne']

/-- In the fixed polar chart the actual four-metric induces the stated
angular restriction at this same latitude. -/
theorem roundLatitude_induced_inner (p : StandardFourSphere) (u : PolarDir p) {a : ℝ}
    (ha : a ∈ Ioo 0 Real.pi) (v w : TangentSpace (𝓡 3) u) :
    let Ipolar := (𝓘(ℝ, ℝ)).prod (𝓡 3)
    let q := (a, u)
    standardRoundFourMetric.inner (roundLatitudeChart p q)
      (mfderiv Ipolar (𝓡 4) (roundLatitudeChart p) q (0, v))
      (mfderiv Ipolar (𝓡 4) (roundLatitudeChart p) q (0, w)) =
      Real.sin a ^ 2 * (roundMetric (n := 3)).inner u v w := by
  simpa [standardRoundFourMetric] using roundLatitudeChart_metric_inner p (a, u) ha (0, v) (0, w)

/-- The actual round source has scalar curvature twelve, also on either
of the two raw sides of a polar latitude. -/
theorem standardRoundFour_scalar_eq_twelve (x : StandardFourSphere) :
    metricScalarAt standardRoundFourMetric x = 12 := by
  have hdim : Module.finrank ℝ E₄ = 4 := by simp
  let : NeZero (Module.finrank ℝ E₄) := ⟨by rw [hdim]; decide⟩
  have h := Riemannian.metricScalarAt_of_constant_sectional standardRoundFourMetric x 1
    (fun u v => by simpa only [one_mul, pow_two] using roundMetric_sec_value x u v)
  norm_num [hdim] at h
  exact h

section RoundBulk

private local instance : MeasurableSpace StandardFourSphere := borel StandardFourSphere
private local instance : BorelSpace StandardFourSphere := ⟨rfl⟩

/-- The scalar part of the actual bulk form on either raw side is twelve
times the squared physical L² mass on that same side. -/
theorem roundLatitude_scalarBulk_eq (U : Set StandardFourSphere) (f : StandardFourSphere → ℝ) :
    let μ := riemannianVolumeMeasure (𝓡 4) StandardFourSphere standardRoundFourMetric
    (∫ x in U, metricScalarAt standardRoundFourMetric x * f x ^ 2 ∂μ) =
      12 * ∫ x in U, f x ^ 2 ∂μ := by
  intro μ
  simp only [standardRoundFour_scalar_eq_twelve, integral_const_mul]

end RoundBulk

/-- The signed test datum for the smooth conformally flat cap. -/
def roundLatitudeMatchedBallJet (v : S₃) (a : ℝ) (north : Bool) : MatchedBallBoundaryJet S₃ :=
  matchedBallRobinJet v (fun _ => Real.log (Real.sin a))
    (fun _ => if north then roundLatitudeOutwardMean a else -roundLatitudeOutwardMean a)

/-- The ball has the induced tangential scale, and its normal logarithmic
factor derivative is `-1 ∓ cos(a)` for the two possible retained sides. -/
theorem roundLatitudeMatchedBallJet_eq (v y : S₃) {a : ℝ} (ha : a ∈ Ioo 0 Real.pi) (north : Bool) :
    let J := roundLatitudeMatchedBallJet v a north
    J.factor y = Real.sin a ∧ J.outwardLogDerivative y = -1 - (if north then Real.cos a else -Real.cos a) ∧
      J.capOutwardMean y = -J.outwardMean y := by
  intro J
  have hs := Real.sin_pos_of_pos_of_lt_pi ha.1 ha.2
  have hFactor : J.factor y = Real.sin a := Real.exp_log hs
  refine ⟨hFactor, ?_, J.capOutwardMean_eq_neg y⟩
  change deriv (fun r : ℝ => matchedBallLogFactor v (fun _ => Real.log (Real.sin a))
    (capLogNormal (fun _ => Real.log (Real.sin a))
      (fun _ => if north then roundLatitudeOutwardMean a else -roundLatitudeOutwardMean a))
    (r • (y : E₄))) 1 = _
  rw [(matchedBallLogFactor_outward v y _ _).deriv]
  simp only [capLogNormal, Real.exp_log hs, roundLatitudeOutwardMean]
  cases north <;> simp <;> field_simp [hs.ne'] <;> ring

/-- The metric of either latitude cap on its marked Euclidean ball. -/
def roundLatitudeMatchedCap (v : S₃) (a : ℝ) (north : Bool) :
    SmoothRiemannianMetric (𝓘(ℝ, E₄)) E₄ :=
  matchedConformallyFlatBall v (ℓ := fun _ => Real.log (Real.sin a))
    (H := fun _ => if north then roundLatitudeOutwardMean a else -roundLatitudeOutwardMean a)
    contMDiff_const contMDiff_const

/-- The smooth cap in the given angular marking has the required tangential
metric and cancels the full outward umbilic angular form of the retained side. -/
theorem roundLatitudeMatchedCap_angular_firstJet (v y : S₃) {a : ℝ}
    (ha : a ∈ Ioo 0 Real.pi) (north : Bool) (u w : E₄) :
    let g := roundLatitudeMatchedCap v a north
    let H := if north then roundLatitudeOutwardMean a else -roundLatitudeOutwardMean a
    g.inner (y : E₄) u w = Real.sin a ^ 2 * inner ℝ u w ∧
      deriv (fun r : ℝ => g.inner (r • (y : E₄)) (r • u) (r • w)) 1 / (2 * Real.sin a) +
        H / 3 * g.inner (y : E₄) u w = 0 := by
  intro g H
  let ℓ : S₃ → ℝ := fun _ => Real.log (Real.sin a)
  let trace : S₃ → ℝ := fun _ => H
  have hs := Real.sin_pos_of_pos_of_lt_pi ha.1 ha.2
  have hℓ : ContMDiff (𝓡 3) 𝓘(ℝ) ∞ ℓ := contMDiff_const
  have hH : ContMDiff (𝓡 3) 𝓘(ℝ) ∞ trace := contMDiff_const
  have hp := (matchedConformallyFlatBall_boundaryJet v y hℓ hH).1 u w
  have hd := matchedConformallyFlatBall_angular_firstJet v y hℓ hH u w
  constructor
  · rw [show g.inner (y : E₄) u w = _ from hp]
    change Real.exp (2 * Real.log (Real.sin a)) * inner ℝ u w = _
    rw [show 2 * Real.log (Real.sin a) = Real.log (Real.sin a) + Real.log (Real.sin a) by ring,
      Real.exp_add, Real.exp_log hs, pow_two]
  · have hd' : deriv (fun r : ℝ => g.inner (r • (y : E₄)) (r • u) (r • w)) 1 /
          (2 * Real.exp (ℓ y)) + H / 3 * g.inner (y : E₄) u w = 0 := hd
    simpa only [ℓ, Real.exp_log hs] using hd'

section Riemannian

private local instance : MeasurableSpace S₃ := borel S₃
private local instance : BorelSpace S₃ := ⟨rfl⟩

/-- In unit-sphere angular coordinates the induced volume is the cubic
rescaling of the unit round Riemannian volume. -/
theorem roundLatitude_induced_volume_eq {a : ℝ} (ha : a ∈ Ioo 0 Real.pi) :
    let g : SmoothRiemannianMetric (𝓡 3) S₃ := roundMetric
    let f : C^∞⟮𝓡 3, S₃; ℝ⟯ := ⟨fun _ => Real.log (Real.sin a), contMDiff_const⟩
    riemannianVolumeMeasure (𝓡 3) S₃ (conformalMetric g f) =
      ballBoundaryVolume (riemannianVolumeMeasure (𝓡 3) S₃ g) (fun _ => Real.sin a) := by
  intro g f
  rw [riemannianVolumeMeasure_conformalMetric, ballBoundaryVolume]
  congr 1
  funext x
  have hs := Real.sin_pos_of_pos_of_lt_pi ha.1 ha.2
  have hdim : Module.finrank ℝ (EuclideanSpace ℝ (Fin 3)) = 3 := by simp
  change ENNReal.ofReal (Real.exp ((Module.finrank ℝ (EuclideanSpace ℝ (Fin 3)) : ℝ) *
    Real.log (Real.sin a))) = ENNReal.ofReal (Real.sin a ^ 3)
  rw [hdim, ← Real.rpow_natCast, Real.rpow_def_of_pos hs, mul_comm]

end Riemannian

private theorem negativeMeanL3_const {B : Type*} [MeasurableSpace B] (μ : Measure B) (H : ℝ) :
    negativeMeanL3 μ (fun _ => H) = max (-H) 0 * μ.real univ ^ (1 / 3 : ℝ) := by
  have hmax : 0 ≤ max (-H) 0 := le_max_right _ _
  rw [negativeMeanL3, integral_const, smul_eq_mul, Real.mul_rpow measureReal_nonneg (pow_nonneg hmax _),
    ← Real.rpow_natCast_mul hmax]
  norm_num
  ring

/-- The larger of the two outward negative-part norms in the induced volume.
The unit angular area is kept explicit so the formula applies also to the
transported Riemannian boundary measure on a specified marking. -/
theorem roundLatitude_signedMeanL3_eq {B : Type*} [MeasurableSpace B] (μ : Measure B)
    (hArea : μ.real univ = 2 * Real.pi ^ 2) {a : ℝ} (ha : a ∈ Ioo 0 Real.pi) :
    let ν := ballBoundaryVolume μ (fun _ => Real.sin a)
    let H := roundLatitudeOutwardMean a
    max (negativeMeanL3 ν (fun _ => H)) (negativeMeanL3 ν (fun _ => -H)) =
      roundBallMeanThreshold * |Real.cos a| := by
  intro ν H
  have hs := Real.sin_pos_of_pos_of_lt_pi ha.1 ha.2
  have hν : ν.real univ = Real.sin a ^ 3 * (2 * Real.pi ^ 2) := by
    change ((μ.withDensity (fun _ => ENNReal.ofReal (Real.sin a ^ 3))) univ).toReal = _
    rw [withDensity_const, Measure.smul_apply, smul_eq_mul, ENNReal.toReal_mul,
      ENNReal.toReal_ofReal (pow_nonneg hs.le _), ← Measure.real_def, hArea]
  rw [negativeMeanL3_const, negativeMeanL3_const, neg_neg,
    ← max_mul_of_nonneg _ _ (Real.rpow_nonneg measureReal_nonneg _), hν,
    Real.mul_rpow (pow_nonneg hs.le _) (by positivity), ← Real.rpow_natCast_mul hs.le]
  have habs : max (max (-H) 0) (max H 0) = |H| := by
    by_cases hp : 0 ≤ H
    · rw [max_eq_right (neg_nonpos.mpr hp), max_eq_left hp, max_eq_right hp, abs_of_nonneg hp]
    · have hn : H ≤ 0 := le_of_not_ge hp
      rw [max_eq_left (neg_nonneg.mpr hn), max_eq_right hn, max_eq_left (neg_nonneg.mpr hn),
        abs_of_nonpos hn]
  rw [habs]
  norm_num only [Nat.cast_ofNat, show (3 : ℝ) * (1 / 3) = 1 by norm_num, Real.rpow_one]
  unfold H roundLatitudeOutwardMean roundBallMeanThreshold roundBallTraceConstant
  rw [abs_div, abs_mul, abs_of_pos hs, abs_of_nonneg (show (0 : ℝ) ≤ 3 by norm_num)]
  field_simp

/-- The exact signed trace maximum lies strictly below the inclusive bound
at every nondegenerate round latitude. -/
theorem roundLatitude_signedMeanL3_lt {B : Type*} [MeasurableSpace B] (μ : Measure B)
    (hArea : μ.real univ = 2 * Real.pi ^ 2) {a : ℝ} (ha : a ∈ Ioo 0 Real.pi) :
    let ν := ballBoundaryVolume μ (fun _ => Real.sin a)
    let H := roundLatitudeOutwardMean a
    max (negativeMeanL3 ν (fun _ => H)) (negativeMeanL3 ν (fun _ => -H)) < roundBallMeanThreshold := by
  intro ν H
  rw [roundLatitude_signedMeanL3_eq μ hArea ha]
  have hcos : |Real.cos a| < 1 := abs_lt.mpr (Real.mapsTo_cos_Ioo ha)
  have hThreshold : 0 < roundBallMeanThreshold := by
    unfold roundBallMeanThreshold roundBallTraceConstant
    positivity
  simpa only [mul_one] using mul_lt_mul_of_pos_left hcos hThreshold

section Riemannian

private local instance : MeasurableSpace S₃ := borel S₃
private local instance : BorelSpace S₃ := ⟨rfl⟩

/-- The trace norm in the Riemannian volume of the induced angular metric.
The unit sphere's Riemannian total area is the remaining volume input. -/
theorem roundLatitude_riemannianTrace_test {a : ℝ} (ha : a ∈ Ioo 0 Real.pi)
    (hArea : (riemannianVolumeMeasure (𝓡 3) S₃ (roundMetric (n := 3))).real univ =
      2 * Real.pi ^ 2) :
    let g : SmoothRiemannianMetric (𝓡 3) S₃ := roundMetric
    let f : C^∞⟮𝓡 3, S₃; ℝ⟯ := ⟨fun _ => Real.log (Real.sin a), contMDiff_const⟩
    let ν := riemannianVolumeMeasure (𝓡 3) S₃ (conformalMetric g f)
    let H := roundLatitudeOutwardMean a
    max (negativeMeanL3 ν (fun _ => H)) (negativeMeanL3 ν (fun _ => -H)) =
      roundBallMeanThreshold * |Real.cos a| ∧
    max (negativeMeanL3 ν (fun _ => H)) (negativeMeanL3 ν (fun _ => -H)) ≤ roundBallMeanThreshold := by
  intro g f ν H
  have hν := roundLatitude_induced_volume_eq ha
  change ν = ballBoundaryVolume (riemannianVolumeMeasure (𝓡 3) S₃ g) (fun _ => Real.sin a) at hν
  rw [hν]
  exact ⟨roundLatitude_signedMeanL3_eq _ hArea ha, (roundLatitude_signedMeanL3_lt _ hArea ha).le⟩

end Riemannian

/-- The Euclidean polar area measure on the standard angular sphere has the
unit value needed by the exact trace test. -/
theorem roundLatitude_unitPolarArea : (volume : Measure E₄).toSphere.real univ = 2 * Real.pi ^ 2 := by
  rw [Measure.toSphere_real_apply_univ, Measure.real_def,
    InnerProductSpace.volume_ball_of_dim_even (k := 2) (by simp : Module.finrank ℝ E₄ = 2 * 2)]
  norm_num [show 0 ≤ Real.pi ^ 2 / 2 by positivity]
  ring

/-- The trace comparison for the concrete Euclidean polar angular measure. -/
theorem roundLatitude_polarTrace_test {a : ℝ} (ha : a ∈ Ioo 0 Real.pi) :
    let ν := ballBoundaryVolume (volume : Measure E₄).toSphere (fun _ => Real.sin a)
    let H := roundLatitudeOutwardMean a
    max (negativeMeanL3 ν (fun _ => H)) (negativeMeanL3 ν (fun _ => -H)) =
      roundBallMeanThreshold * |Real.cos a| ∧
    max (negativeMeanL3 ν (fun _ => H)) (negativeMeanL3 ν (fun _ => -H)) ≤ roundBallMeanThreshold :=
  ⟨roundLatitude_signedMeanL3_eq _ roundLatitude_unitPolarArea ha,
    (roundLatitude_signedMeanL3_lt _ roundLatitude_unitPolarArea ha).le⟩

/-- Whenever the supplied closed test form realizes this marked latitude
and its polar boundary measure, either side gives strict cap positivity. -/
theorem roundLatitude_robinPositive_of_polarData {Core Cap Test : Type*}
    [MeasurableSpace Core] [MeasurableSpace Cap] {a : ℝ} (ha : a ∈ Ioo 0 Real.pi)
    (v : S₃) (north : Bool) (D : MatchedBallRobinData Core Cap S₃ Test)
    (hMeasure : D.euclideanBoundaryVolume = (volume : Measure E₄).toSphere)
    (hJet : D.jet = roundLatitudeMatchedBallJet v a north) (hGround : D.HasGroundState) :
    0 < D.firstEigenvalue := by
  have hBound := (roundLatitude_polarTrace_test ha).2
  have hFactor : (roundLatitudeMatchedBallJet v a north).factor = fun _ => Real.sin a :=
    funext fun y => (roundLatitudeMatchedBallJet_eq v y ha north).1
  apply matchedBall_robinPositive_of_traceBound D hGround
  change negativeMeanL3 (ballBoundaryVolume D.euclideanBoundaryVolume D.jet.factor)
    D.jet.outwardMean ≤ roundBallMeanThreshold
  rw [hMeasure, hJet, hFactor]
  cases north
  · exact (max_le_iff.mp hBound).2
  · exact (max_le_iff.mp hBound).1

end SmoothPoincare.IntrinsicEntry
