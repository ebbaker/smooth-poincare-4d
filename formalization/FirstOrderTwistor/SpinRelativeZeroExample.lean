import FirstOrderTwistor.SpinCovariantJet
import Mathlib.Analysis.SpecialFunctions.Integrability.Basic
import Mathlib.Analysis.SpecialFunctions.Integrals.Basic
import Mathlib.MeasureTheory.Constructions.HaarToSphere
import Mathlib.MeasureTheory.Measure.Lebesgue.VolumeOfBalls

/-!
# A flat harmonic spinor with divergent relative fourth-power cost

FOT-E18ad, prepared for Edward B. Baker III on 2026-11-25 with OpenAI Codex
assistance. Serving settings are unavailable. Checkout fc60509. The example
uses the positive Clifford convention of SpinNormalFrame and the relative
cost of MATCH-E11.

The flat metric on the oriented Euclidean chart has vanishing Weyl
curvature. The divergence proved here concerns a relative-gradient
integral at the zero of a genuine harmonic spinor.
-/

open MeasureTheory Set Metric
open scoped Quaternion BigOperators ENNReal

namespace FirstOrderTwistor

noncomputable section

private def flatRelativeZeroCoefficient : Fin 4 → ℍ[ℝ] :=
  ![1, spinUnit 0, -spinUnit 1, -spinUnit 2]

/-- A positive spinor in the parallel spin frame on oriented flat four-space. -/
def flatRelativeZeroSpinor : EuclideanFour →L[ℝ] ℍ[ℝ] :=
  ∑ i, (EuclideanSpace.proj i).smulRight (flatRelativeZeroCoefficient i)

theorem flatRelativeZeroSpinor_apply (x : EuclideanFour) :
    flatRelativeZeroSpinor x = ⟨x 0, x 1, -(x 2), -(x 3)⟩ := by
  apply Quaternion.ext <;>
    simp [flatRelativeZeroSpinor, flatRelativeZeroCoefficient, spinUnit, Fin.sum_univ_four,
      ContinuousLinearMap.smulRight_apply]

private theorem flatRelativeZeroSpinor_partial (i : Fin 4) (x : EuclideanFour) :
    spinCoordinatePartial flatRelativeZeroSpinor i x = flatRelativeZeroCoefficient i := by
  rw [spinCoordinatePartial, ContinuousLinearMap.fderiv]
  simp [flatRelativeZeroSpinor, PiLp.single_apply, ContinuousLinearMap.smulRight_apply]

/-- This spinor is Dirac-harmonic in the flat gauge with the stipulated signs. -/
theorem flatRelativeZeroSpinor_dirac (x : EuclideanFour) :
    (∑ i, positiveCliffordVector i *
      spinCovariantDerivative (fun _ _ => 0) i flatRelativeZeroSpinor x) = 0 := by
  simp only [spinCovariantDerivative, zero_mul, add_zero, flatRelativeZeroSpinor_partial]
  apply Quaternion.ext <;>
    norm_num [Fin.sum_univ_four, positiveCliffordVector, flatRelativeZeroCoefficient,
      spinUnit, Quaternion.re_mul, Quaternion.imI_mul, Quaternion.imJ_mul, Quaternion.imK_mul]

theorem flatRelativeZeroSpinor_mass (x : EuclideanFour) :
    ‖flatRelativeZeroSpinor x‖ ^ 2 = ‖x‖ ^ 2 := by
  calc
    ‖flatRelativeZeroSpinor x‖ ^ 2 = Quaternion.normSq (flatRelativeZeroSpinor x) := by
      rw [Quaternion.normSq_eq_norm_mul_self, pow_two]
    _ = ‖x‖ ^ 2 := by
      rw [flatRelativeZeroSpinor_apply, EuclideanSpace.norm_sq_eq]
      simp [Fin.sum_univ_four, Quaternion.normSq_def', Real.norm_eq_abs, sq_abs]

theorem flatRelativeZeroSpinor_gradientSq (x : EuclideanFour) :
    (∑ i, ‖spinCovariantDerivative (fun _ _ => 0) i flatRelativeZeroSpinor x‖ ^ 2) = 4 := by
  simp only [spinCovariantDerivative, zero_mul, add_zero, flatRelativeZeroSpinor_partial,
    pow_two, ← Quaternion.normSq_eq_norm_mul_self]
  norm_num [Fin.sum_univ_four, flatRelativeZeroCoefficient, spinUnit, Quaternion.normSq_def']

theorem flatRelativeZeroSpinor_hessian (i j : Fin 4) (x : EuclideanFour) :
    spinCoordinatePartial (spinCoordinatePartial flatRelativeZeroSpinor j) i x = 0 := by
  have h : spinCoordinatePartial flatRelativeZeroSpinor j =
      fun _ => flatRelativeZeroCoefficient j := funext (flatRelativeZeroSpinor_partial j)
  simp [h, spinCoordinatePartial]

/-- The common zero has volume zero in every measured subregion. -/
theorem flatRelativeZeroSpinor_mass_pos_ae (region : Set EuclideanFour) :
    ∀ᵐ x ∂volume.restrict region, 0 < ‖flatRelativeZeroSpinor x‖ ^ 2 := by
  have h : ∀ᵐ x : EuclideanFour, x ≠ 0 := by simp [ae_iff]
  filter_upwards [ae_restrict_of_ae (s := region) h] with x hx
  rw [flatRelativeZeroSpinor_mass]
  positivity

/-- The relative fourth-power density, with real division totalized at the zero. -/
def flatRelativeZeroCost (x : EuclideanFour) : ℝ :=
  ((∑ i, ‖spinCovariantDerivative (fun _ _ => 0) i flatRelativeZeroSpinor x‖ ^ 2) /
    ‖flatRelativeZeroSpinor x‖ ^ 2) ^ 2

theorem flatRelativeZeroCost_eq (x : EuclideanFour) :
    flatRelativeZeroCost x = 16 / ‖x‖ ^ 4 := by
  rw [flatRelativeZeroCost, flatRelativeZeroSpinor_gradientSq, flatRelativeZeroSpinor_mass,
    div_pow, ← pow_mul]
  norm_num

private theorem flatRelativeZero_dimension : Module.finrank ℝ EuclideanFour = 4 := by
  simp

private theorem flatRelativeZero_radial (y : ℝ) (hy : 0 < y) :
    y ^ 3 * (16 / y ^ 4) = 16 * y⁻¹ := by
  field_simp

/-- The finite relative fourth-power hypothesis fails on every positive-radius
ball centered at the zero, although the spinor is harmonic and nonzero a.e. -/
theorem flatRelativeZeroCost_not_integrable_ball {radius : ℝ} (hradius : 0 < radius) :
    ¬ IntegrableOn flatRelativeZeroCost (ball (0 : EuclideanFour) radius) := by
  intro h
  rw [show flatRelativeZeroCost = fun x => 16 / ‖x‖ ^ 4 from
    funext flatRelativeZeroCost_eq] at h
  have hPolar := (integrableOn_fun_norm_addHaar
    (volume : Measure EuclideanFour) (f := fun y : ℝ => 16 / y ^ 4)).mp h
  rw [flatRelativeZero_dimension, show (4 - 1 : ℕ) = 3 by norm_num] at hPolar
  have hRadial : IntegrableOn (fun y : ℝ => 16 * y⁻¹) (Ioo 0 radius) := by
    refine hPolar.congr_fun ?_ measurableSet_Ioo
    exact fun y hy => flatRelativeZero_radial y hy.1
  have hInv : IntegrableOn (fun y : ℝ => y ^ (-1 : ℝ)) (Ioo 0 radius) := by
    change Integrable (fun y : ℝ => y ^ (-1 : ℝ)) (volume.restrict (Ioo 0 radius))
    simpa only [Real.rpow_neg_one, ← mul_assoc, show (1 / 16 : ℝ) * 16 = 1 by norm_num,
      one_mul] using hRadial.const_mul (1 / 16)
  rw [intervalIntegral.integrableOn_Ioo_rpow_iff hradius] at hInv
  exact (lt_irrefl _ hInv)

theorem flatRelativeZeroCost_not_integrable_ball_containing_zero
    {center : EuclideanFour} {radius : ℝ} (hzero : (0 : EuclideanFour) ∈ ball center radius) :
    ¬ IntegrableOn flatRelativeZeroCost (ball center radius) := by
  intro h
  obtain ⟨r, hr, hsub⟩ := Metric.mem_nhds_iff.mp (isOpen_ball.mem_nhds hzero)
  exact flatRelativeZeroCost_not_integrable_ball hr (h.mono_set hsub)

private theorem flatRelativeZero_unitBall :
    (volume : Measure EuclideanFour).real (ball 0 1) = Real.pi ^ 2 / 2 := by
  have hvol := InnerProductSpace.volume_ball_of_dim_even
    (show Module.finrank ℝ EuclideanFour = 2 * 2 by norm_num [flatRelativeZero_dimension])
    (0 : EuclideanFour) (1 : ℝ)
  rw [measureReal_def, hvol, ENNReal.ofReal_one, one_pow, one_mul,
    show (↑(Nat.factorial 2) : ℝ) = 2 by norm_num, ENNReal.toReal_ofReal (by positivity)]

/-- Exact logarithmic growth of the relative cost on a concentric annulus.
The coefficient uses Euclidean volume in dimension four. -/
theorem flatRelativeZeroCost_annulus_integral {inner outer : ℝ}
    (hinner : 0 < inner) (houter : inner ≤ outer) :
    (∫ x in {x : EuclideanFour | ‖x‖ ∈ Ioc inner outer}, flatRelativeZeroCost x) =
      32 * Real.pi ^ 2 * Real.log (outer / inner) := by
  let A : Set EuclideanFour := {x | ‖x‖ ∈ Ioc inner outer}
  let radial (y : ℝ) := 16 / y ^ 4
  let radialCut := (Ioc inner outer).indicator radial
  have hA : MeasurableSet A := measurable_norm measurableSet_Ioc
  have hOne : (∫ x in A, flatRelativeZeroCost x) = ∫ x : EuclideanFour, radialCut ‖x‖ := by
    rw [← integral_indicator hA]
    apply integral_congr_ae
    filter_upwards with x
    by_cases hx : ‖x‖ ∈ Ioc inner outer
    · have hxA : x ∈ A := hx
      rw [Set.indicator_of_mem hxA, flatRelativeZeroCost_eq]
      exact (Set.indicator_of_mem hx radial).symm
    · have hxA : x ∉ A := hx
      rw [Set.indicator_of_notMem hxA]
      exact (Set.indicator_of_notMem hx radial).symm
  have hWeighted :
      (∫ y in Ioi (0 : ℝ), y ^ 3 * radialCut y) =
        16 * Real.log (outer / inner) := by
    have hCut : (fun y => y ^ 3 * radialCut y) =
        (Ioc inner outer).indicator (fun y => y ^ 3 * radial y) := by
      funext y
      by_cases hy : y ∈ Ioc inner outer <;> simp [radialCut, hy]
    have hsub : Ioc inner outer ⊆ Ioi (0 : ℝ) := fun _ hy => hinner.trans hy.1
    rw [hCut, setIntegral_indicator measurableSet_Ioc, inter_eq_right.mpr hsub]
    have hRadial :
        (∫ y in Ioc inner outer, y ^ 3 * radial y) = ∫ y in Ioc inner outer, 16 * y⁻¹ :=
      setIntegral_congr_fun measurableSet_Ioc (fun y hy => flatRelativeZero_radial y (hsub hy))
    rw [hRadial, integral_const_mul, ← intervalIntegral.integral_of_le houter,
      integral_inv_of_pos hinner (hinner.trans_le houter)]
  change (∫ x in A, flatRelativeZeroCost x) = _
  rw [hOne, integral_fun_norm_addHaar (volume : Measure EuclideanFour) radialCut,
    flatRelativeZero_dimension, show (4 - 1 : ℕ) = 3 by norm_num,
    flatRelativeZero_unitBall]
  simp only [smul_eq_mul, nsmul_eq_mul]
  rw [hWeighted]
  ring

end

end FirstOrderTwistor
