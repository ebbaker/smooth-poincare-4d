import SmoothPoincare

/-! # Independent E52 round-latitude and fixed-band checks -/

open DifferentialGeometry DifferentialGeometry.Analysis DifferentialGeometry.Geometry
open Metric MeasureTheory Set
open SmoothPoincare SmoothPoincare.IntrinsicEntry
open scoped BigOperators

noncomputable section

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "S₃" => sphere (0 : E₄) 1

private theorem oneThirdLatitude : Real.pi / 3 ∈ Ioo (0 : ℝ) Real.pi :=
  ⟨by linarith [Real.pi_pos], by linarith [Real.pi_pos]⟩

/-- Both outward choices at the same non-equatorial round latitude. -/
example (v y : S₃) :
    (roundLatitudeMatchedBallJet v (Real.pi / 3) true).outwardLogDerivative y = -(3 / 2 : ℝ) ∧
    (roundLatitudeMatchedBallJet v (Real.pi / 3) false).outwardLogDerivative y = -(1 / 2 : ℝ) := by
  have hn := (roundLatitudeMatchedBallJet_eq v y oneThirdLatitude true).2.1
  have hs := (roundLatitudeMatchedBallJet_eq v y oneThirdLatitude false).2.1
  norm_num [Real.cos_pi_div_three] at hn hs ⊢
  exact ⟨hn, hs⟩

/-- On the north side the adverse part vanishes. The adverse south norm
is exactly half the threshold, in the same physical polar volume. -/
example :
    let ν := ballBoundaryVolume (volume : Measure E₄).toSphere (fun _ ↦ Real.sin (Real.pi / 3))
    let H := roundLatitudeOutwardMean (Real.pi / 3)
    negativeMeanL3 ν (fun _ ↦ H) = 0 ∧
      negativeMeanL3 ν (fun _ ↦ -H) = roundBallMeanThreshold / 2 := by
  intro ν H
  have hfactor : 0 < Real.sin (Real.pi / 3) :=
    Real.sin_pos_of_pos_of_lt_pi oneThirdLatitude.1 oneThirdLatitude.2
  have hH : 0 < H := by
    change 0 < 3 * Real.cos (Real.pi / 3) / Real.sin (Real.pi / 3)
    rw [Real.cos_pi_div_three]
    positivity
  have hn : negativeMeanL3 ν (fun _ ↦ H) = 0 := by
    simp [negativeMeanL3, max_eq_right (neg_nonpos.mpr hH.le)]
  have hm : 0 ≤ negativeMeanL3 ν (fun _ ↦ -H) := by
    unfold negativeMeanL3
    exact Real.rpow_nonneg (integral_nonneg fun _ ↦ pow_nonneg (le_max_right _ _) _) _
  have hs := (roundLatitude_polarTrace_test oneThirdLatitude).1
  change max (negativeMeanL3 ν (fun _ ↦ H)) (negativeMeanL3 ν (fun _ ↦ -H)) = _ at hs
  rw [hn, max_eq_right hm, Real.cos_pi_div_three, abs_of_nonneg (by norm_num : (0 : ℝ) ≤ 1 / 2)] at hs
  exact ⟨hn, hs.trans (by ring)⟩

private def stereoLine (c r : ℝ) : ℝ := 4 / (c + r ^ 2) ^ 2

private theorem stereoLine_hasDerivAt {c r : ℝ} (hc : 0 < c) :
    HasDerivAt (stereoLine c) (-16 * r / (c + r ^ 2) ^ 3) r := by
  have hden : c + r ^ 2 ≠ 0 := (show 0 < c + r ^ 2 from by positivity).ne'
  have hd := ((hasDerivAt_id r).pow 2).const_add c
  convert (hasDerivAt_const r (4 : ℝ)).fun_div (hd.pow 2) (pow_ne_zero _ hden) using 1
  · rfl
  · simp only [Pi.pow_apply, id_eq, Nat.cast_ofNat, Nat.reduceSubDiff, pow_one, mul_one, zero_mul, zero_sub]
    field_simp [hden]
    ring

private theorem stereoLine_deriv2 {c r : ℝ} (hc : 0 < c) :
    deriv (deriv (stereoLine c)) r =
      -16 / (c + r ^ 2) ^ 3 + 96 * r ^ 2 / (c + r ^ 2) ^ 4 := by
  have hden : c + r ^ 2 ≠ 0 := (show 0 < c + r ^ 2 from by positivity).ne'
  have hd := ((hasDerivAt_id r).pow 2).const_add c
  have hpow := hd.pow 3
  have h := (((hasDerivAt_id r).const_mul (-16)).fun_div hpow (pow_ne_zero _ hden)).deriv
  have hfun : deriv (stereoLine c) = fun r ↦ -16 * r / (c + r ^ 2) ^ 3 :=
    funext fun _ ↦ (stereoLine_hasDerivAt hc).deriv
  simp only [Pi.pow_apply, id_eq, Nat.cast_ofNat, Nat.reduceSubDiff, pow_one, mul_one] at h
  rw [hfun, h]
  field_simp [hden]
  ring

/-- The radial and transverse jets independently reproduce the numbers in
the scientific stereographic calibration. -/
example : stereoLine 1 1 = 1 ∧ deriv (stereoLine 1) 1 = -2 ∧
    deriv (deriv (stereoLine 1)) 1 = 4 ∧ deriv (stereoLine 2) 0 = 0 ∧
    deriv (deriv (stereoLine 2)) 0 = -2 := by
  rw [(stereoLine_hasDerivAt (c := 1) (r := 1) (by norm_num)).deriv,
    stereoLine_deriv2 (c := 1) (r := 1) (by norm_num),
    (stereoLine_hasDerivAt (c := 2) (r := 0) (by norm_num)).deriv,
    stereoLine_deriv2 (c := 2) (r := 0) (by norm_num)]
  norm_num [stereoLine]

private def stereoHessian (p q u v : Fin 4) : ℝ :=
  if p = q ∧ u = v then if p = 0 then 4 else -2 else 0

/-- Library index order is acted-on vector, first derivative direction,
second derivative direction, and final lowering vector. This is paper 1221. -/
private theorem stereoPrincipal : loweredCurvaturePrincipal stereoHessian 1 0 1 0 = -1 := by
  norm_num [loweredCurvaturePrincipal, stereoHessian]

private def radialComponent (i : Fin 4) : ℝ := if i = 0 then 1 else 0

private def roundStereoFirstJet : MatJet ℝ 4 :=
  ((fun i j ↦ if i = j then 1 else 0), (ContinuousLinearMap.id ℝ ℝ).smulRight
    (fun i j ↦ if i = j then (-2 : ℝ) else 0), 0)

private theorem roundStereoGram : Matrix.of roundStereoFirstJet.1 = 1 := by
  ext i j
  simp [roundStereoFirstJet, Matrix.one_apply]

private theorem roundStereoVal (i j : Fin 4) :
    roundStereoFirstJet.1 i j = if i = j then 1 else 0 := rfl

private theorem roundStereoDerivative (i j k : Fin 4) :
    (roundStereoFirstJet.2.1 (radialComponent i)) j k =
      if i = 0 ∧ j = k then -2 else 0 := by
  by_cases hi : i = 0 <;> by_cases hjk : j = k <;>
    simp [roundStereoFirstJet, radialComponent, hi, hjk]

private theorem roundStereoZeroSecond (i j k l : Fin 4) :
    (roundStereoFirstJet.2.2 (radialComponent i) (radialComponent j)) k l = 0 := rfl

private theorem stereoQuadratic :
    (∑ m, roundStereoFirstJet.1 0 m * jetRiemann radialComponent roundStereoFirstJet 1 0 1 m) = 2 := by
  simp [jetRiemann, jetChristoffel, jetChristoffelDeriv, roundStereoGram, roundStereoVal,
    roundStereoDerivative, roundStereoZeroSecond, Matrix.one_apply, Fin.sum_univ_four]

/-- With the stereographic first and second jets in the same frame,
the signed principal and quadratic terms sum to round sectional curvature one. -/
example :
    loweredCurvaturePrincipal stereoHessian 1 0 1 0 +
      (∑ m, roundStereoFirstJet.1 0 m * jetRiemann radialComponent roundStereoFirstJet 1 0 1 m) = 1 := by
  rw [stereoPrincipal, stereoQuadratic]
  norm_num

#print axioms roundLatitudeMatchedBallJet_eq
#print axioms roundLatitude_signedMeanL3_eq
#print axioms roundLatitude_robinPositive_of_polarData

#print axioms fixedBandChartGram_fderiv
#print axioms fixedBandCurvature_eq_firstJets
#print axioms fixedBandCurvature_eq_left_of_flat
#print axioms fixedBandCurvature_eq_right_of_flat
#print axioms fixedBandChartLowered_eq_metricRm
#print axioms fixedBandSurfaceProductRm_eq_gram
#print axioms fixedBandFrameTensor_eq_firstJets
#print axioms fixedBandPullbackProductChartLowered
#print axioms fixedBandSignedDensities_eq_firstJets
