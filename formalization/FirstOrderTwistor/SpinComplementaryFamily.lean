import FirstOrderTwistor.SpinRelativeZeroExample

/-!
# A complementary constant spinor in the flat relative-cost example

FOT-E18ae, prepared for Edward B. Baker III on 2026-11-25 with OpenAI
Codex assistance. Serving settings are unavailable. Checkout 64a0bfa.
This uses the flat gauge and coefficient conventions of FOT-E18ad.

A nonzero constant spinor makes the squared mass strictly positive.
The relative fourth-power integral is finite for each such pair, with
a logarithmic lower bound as the constant tends to zero.
-/

open Filter MeasureTheory Set Metric
open scoped Quaternion BigOperators Topology

namespace FirstOrderTwistor

noncomputable section

/-- The linear harmonic spinor and a constant spinor in the same flat frame. -/
def flatComplementaryFamily (b : ℍ[ℝ]) : Fin 2 → EuclideanFour → ℍ[ℝ] :=
  ![flatRelativeZeroSpinor, fun _ => b]

private theorem flatConstantSpinor_covariantDerivative (b : ℍ[ℝ]) (i : Fin 4)
    (x : EuclideanFour) :
    spinCovariantDerivative (fun _ _ => 0) i (fun _ => b) x = 0 := by
  simp [spinCovariantDerivative, spinCoordinatePartial]

/-- Both positive spinors are harmonic in the fixed flat gauge. -/
theorem flatComplementaryFamily_dirac (b : ℍ[ℝ]) (a : Fin 2) (x : EuclideanFour) :
    (∑ i, positiveCliffordVector i *
      spinCovariantDerivative (fun _ _ => 0) i (flatComplementaryFamily b a) x) = 0 := by
  fin_cases a
  · exact flatRelativeZeroSpinor_dirac x
  · change (∑ i, positiveCliffordVector i *
        spinCovariantDerivative (fun _ _ => 0) i (fun _ : EuclideanFour => b) x) = 0
    simp only [flatConstantSpinor_covariantDerivative, mul_zero, Finset.sum_const_zero]

theorem flatComplementaryFamily_mass (b : ℍ[ℝ]) (x : EuclideanFour) :
    (∑ a, ‖flatComplementaryFamily b a x‖ ^ 2) = ‖x‖ ^ 2 + ‖b‖ ^ 2 := by
  simp [Fin.sum_univ_two, flatComplementaryFamily, flatRelativeZeroSpinor_mass]

theorem flatComplementaryFamily_gradientSq (b : ℍ[ℝ]) (x : EuclideanFour) :
    (∑ a, ∑ i, ‖spinCovariantDerivative (fun _ _ => 0) i (flatComplementaryFamily b a) x‖ ^ 2) =
      4 := by
  simp [Fin.sum_univ_two, flatComplementaryFamily, flatRelativeZeroSpinor_gradientSq,
    flatConstantSpinor_covariantDerivative]

/-- Fourth power of the relative gradient, using the joint squared mass. -/
def flatComplementaryCost (b : ℍ[ℝ]) (x : EuclideanFour) : ℝ :=
  ((∑ a, ∑ i, ‖spinCovariantDerivative (fun _ _ => 0) i (flatComplementaryFamily b a) x‖ ^ 2) /
    (∑ a, ‖flatComplementaryFamily b a x‖ ^ 2)) ^ 2

theorem flatComplementaryCost_eq (b : ℍ[ℝ]) (x : EuclideanFour) :
    flatComplementaryCost b x = 16 / (‖x‖ ^ 2 + ‖b‖ ^ 2) ^ 2 := by
  rw [flatComplementaryCost, flatComplementaryFamily_gradientSq, flatComplementaryFamily_mass,
    div_pow]
  norm_num

private theorem flatComplementaryCost_continuous {b : ℍ[ℝ]} (hb : b ≠ 0) :
    Continuous (flatComplementaryCost b) := by
  rw [show flatComplementaryCost b = fun x : EuclideanFour => 16 / (‖x‖ ^ 2 + ‖b‖ ^ 2) ^ 2 from
    funext (flatComplementaryCost_eq b)]
  have hbPos := norm_pos_iff.mpr hb
  apply continuous_const.div (((continuous_norm.pow 2).add continuous_const).pow 2)
  intro x
  change (‖x‖ ^ 2 + ‖b‖ ^ 2) ^ 2 ≠ 0
  exact (pow_pos (add_pos_of_nonneg_of_pos (sq_nonneg _) (pow_pos hbPos 2)) 2).ne'

/-- A fixed nonzero constant spinor gives finite relative cost on any
bounded ball, including its boundary. -/
theorem flatComplementaryCost_integrable_closedBall {b : ℍ[ℝ]} (hb : b ≠ 0)
    (center : EuclideanFour) (radius : ℝ) :
    IntegrableOn (flatComplementaryCost b) (closedBall center radius) :=
  (flatComplementaryCost_continuous hb).continuousOn.integrableOn_compact
    (isCompact_closedBall center radius)

theorem flatComplementaryCost_integrable_ball {b : ℍ[ℝ]} (hb : b ≠ 0)
    (center : EuclideanFour) (radius : ℝ) :
    IntegrableOn (flatComplementaryCost b) (ball center radius) :=
  (flatComplementaryCost_integrable_closedBall hb center radius).mono_set ball_subset_closedBall

/-- Beyond the scale of the constant spinor, the cost dominates one quarter
of the original singular density, namely (4/r^4). -/
theorem flatComplementaryCost_lower {b : ℍ[ℝ]} (hb : b ≠ 0) {x : EuclideanFour}
    (hscale : ‖b‖ ≤ ‖x‖) :
    (1 / 4 : ℝ) * flatRelativeZeroCost x ≤ flatComplementaryCost b x := by
  have hr : 0 < ‖x‖ := (norm_pos_iff.mpr hb).trans_le hscale
  have hsum : ‖x‖ ^ 2 + ‖b‖ ^ 2 ≤ 2 * ‖x‖ ^ 2 := by
    linarith only [pow_le_pow_left₀ (norm_nonneg b) hscale 2]
  have hpow : (‖x‖ ^ 2 + ‖b‖ ^ 2) ^ 2 ≤ 4 * ‖x‖ ^ 4 := by
    calc
      _ ≤ (2 * ‖x‖ ^ 2) ^ 2 := pow_le_pow_left₀ (by positivity) hsum 2
      _ = _ := by ring
  rw [flatRelativeZeroCost_eq, flatComplementaryCost_eq]
  calc
    (1 / 4 : ℝ) * (16 / ‖x‖ ^ 4) = 16 / (4 * ‖x‖ ^ 4) := by ring
    _ ≤ _ := div_le_div_of_nonneg_left (by norm_num) (by positivity) hpow

/-- The integrated lower bound on the annulus outside the constant spinor scale. -/
theorem flatComplementaryCost_annulus_logLower {b : ℍ[ℝ]} (hb : b ≠ 0) {outer : ℝ}
    (hOuter : ‖b‖ ≤ outer) :
    8 * Real.pi ^ 2 * Real.log (outer / ‖b‖) ≤
      ∫ x in {x : EuclideanFour | ‖x‖ ∈ Ioc ‖b‖ outer}, flatComplementaryCost b x := by
  let A : Set EuclideanFour := {x | ‖x‖ ∈ Ioc ‖b‖ outer}
  have hA : MeasurableSet A := measurable_norm measurableSet_Ioc
  have hABall : A ⊆ closedBall (0 : EuclideanFour) outer :=
    fun x hx => mem_closedBall_zero_iff.mpr hx.2
  have hbPos := norm_pos_iff.mpr hb
  let clip (x : EuclideanFour) := 16 / (max ‖x‖ ‖b‖) ^ 4
  have hClip : Continuous clip := by
    apply continuous_const.div ((continuous_norm.max continuous_const).pow 4)
    intro x
    exact pow_ne_zero 4 (hbPos.trans_le (le_max_right _ _)).ne'
  have hClipInt : IntegrableOn clip (closedBall (0 : EuclideanFour) outer) :=
    hClip.continuousOn.integrableOn_compact (isCompact_closedBall _ _)
  have hOld : IntegrableOn flatRelativeZeroCost A := by
    refine (hClipInt.mono_set hABall).congr_fun ?_ hA
    intro x hx
    rw [flatRelativeZeroCost_eq]
    exact congrArg (fun r : ℝ => 16 / r ^ 4) (max_eq_left hx.1.le)
  have hNew : IntegrableOn (flatComplementaryCost b) A :=
    (flatComplementaryCost_integrable_closedBall hb 0 outer).mono_set hABall
  calc
    _ = (1 / 4 : ℝ) * (∫ x in A, flatRelativeZeroCost x) := by
      rw [flatRelativeZeroCost_annulus_integral hbPos hOuter]
      ring
    _ = ∫ x in A, (1 / 4 : ℝ) * flatRelativeZeroCost x := (integral_const_mul _ _).symm
    _ ≤ _ := integral_mono_ae (hOld.const_mul _) hNew
      ((ae_restrict_mem hA).mono fun _ hx => flatComplementaryCost_lower hb hx.1.le)

/-- The same logarithmic lower bound holds for the whole concentric closed ball. -/
theorem flatComplementaryCost_closedBall_logLower {b : ℍ[ℝ]} (hb : b ≠ 0) {radius : ℝ}
    (hradius : ‖b‖ ≤ radius) :
    8 * Real.pi ^ 2 * Real.log (radius / ‖b‖) ≤
      ∫ x in closedBall (0 : EuclideanFour) radius, flatComplementaryCost b x := by
  have hSub : {x : EuclideanFour | ‖x‖ ∈ Ioc ‖b‖ radius} ⊆ closedBall 0 radius :=
    fun _ hx => mem_closedBall_zero_iff.mpr hx.2
  refine (flatComplementaryCost_annulus_logLower hb hradius).trans
    (setIntegral_mono_set (flatComplementaryCost_integrable_closedBall hb 0 radius)
      (ae_of_all _ fun x => sq_nonneg _) (ae_of_all _ hSub))

/-- Any strictly interior annulus also gives a lower bound for an open ball. -/
theorem flatComplementaryCost_ball_logLower {b : ℍ[ℝ]} (hb : b ≠ 0) {outer radius : ℝ}
    (hScale : ‖b‖ ≤ outer) (hOuter : outer < radius) :
    8 * Real.pi ^ 2 * Real.log (outer / ‖b‖) ≤
      ∫ x in ball (0 : EuclideanFour) radius, flatComplementaryCost b x := by
  exact (flatComplementaryCost_closedBall_logLower hb hScale).trans
    (setIntegral_mono_set (flatComplementaryCost_integrable_ball hb 0 radius)
      (ae_of_all _ fun x => sq_nonneg _) (ae_of_all _ (closedBall_subset_ball hOuter)))

/-- For every fixed positive radius, the closed-ball costs diverge as the
complementary constant tends to zero through nonzero values. -/
theorem flatComplementaryCost_closedBall_tendsto_atTop {radius : ℝ} (hradius : 0 < radius) :
    Tendsto (fun b : ℍ[ℝ] => ∫ x in closedBall (0 : EuclideanFour) radius, flatComplementaryCost b x)
      (𝓝[≠] (0 : ℍ[ℝ])) atTop := by
  have hNorm : Tendsto (norm : ℍ[ℝ] → ℝ) (𝓝[≠] 0) (𝓝[>] 0) :=
    tendsto_norm_nhdsNE_zero
  have hRatio : Tendsto (fun b : ℍ[ℝ] => radius / ‖b‖) (𝓝[≠] 0) atTop := by
    simpa only [div_eq_mul_inv, Pi.inv_apply, mul_comm radius] using
      hNorm.inv_tendsto_nhdsGT_zero.const_mul_atTop hradius
  have hLog : Tendsto (fun b : ℍ[ℝ] => 8 * Real.pi ^ 2 * Real.log (radius / ‖b‖))
      (𝓝[≠] 0) atTop :=
    (Real.tendsto_log_atTop.comp hRatio).const_mul_atTop
      (mul_pos (by norm_num) (pow_pos Real.pi_pos 2))
  have hSmall : ∀ᶠ b : ℍ[ℝ] in 𝓝[≠] 0, ‖b‖ < radius :=
    (hNorm.mono_right nhdsWithin_le_nhds).eventually_lt_const hradius
  have hNonzero : ∀ᶠ b : ℍ[ℝ] in 𝓝[≠] 0, b ≠ 0 := self_mem_nhdsWithin
  refine tendsto_atTop_mono' _ ?_ hLog
  filter_upwards [hSmall, hNonzero] with b hbScale hb
  exact flatComplementaryCost_closedBall_logLower hb hbScale.le

/-- The divergence also holds on the open ball of every fixed positive radius. -/
theorem flatComplementaryCost_ball_tendsto_atTop {radius : ℝ} (hradius : 0 < radius) :
    Tendsto (fun b : ℍ[ℝ] => ∫ x in ball (0 : EuclideanFour) radius, flatComplementaryCost b x)
      (𝓝[≠] (0 : ℍ[ℝ])) atTop := by
  have hNonzero : ∀ᶠ b : ℍ[ℝ] in 𝓝[≠] 0, b ≠ 0 := self_mem_nhdsWithin
  refine tendsto_atTop_mono' _ (hNonzero.mono fun b hb => ?_)
    (flatComplementaryCost_closedBall_tendsto_atTop (half_pos hradius))
  exact setIntegral_mono_set (flatComplementaryCost_integrable_ball hb 0 radius)
    (ae_of_all _ fun x => sq_nonneg _) (ae_of_all _ (closedBall_subset_ball (half_lt_self hradius)))

end

end FirstOrderTwistor
