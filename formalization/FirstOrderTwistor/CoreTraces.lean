import Mathlib.Analysis.Normed.Operator.NormedSpace
import Mathlib.Analysis.SpecialFunctions.Exp
import Mathlib.MeasureTheory.Function.LpSeminorm.TriangleInequality
import Mathlib.Topology.MetricSpace.Contracting
import Mathlib.Tactic

open MeasureTheory
open scoped ENNReal NNReal

namespace FirstOrderTwistor

/-- The affine matching equations for supplied core graphs and supplied product
propagation maps have a unique solution under the round exponential return bound.
The variables are the positive trace at the left end and the negative trace at
the right end, respectively. The geometric graph and propagation constructions
are inputs. -/
theorem matchSuppliedCoreTraceGraphs {𝕜 Hplus Hminus : Type*}
    [NontriviallyNormedField 𝕜]
    [NormedAddCommGroup Hplus] [NormedSpace 𝕜 Hplus] [CompleteSpace Hplus]
    [NormedAddCommGroup Hminus] [NormedSpace 𝕜 Hminus]
    (leftGraph : Hminus →L[𝕜] Hplus) (rightGraph : Hplus →L[𝕜] Hminus)
    (positivePropagation : Hplus →L[𝕜] Hplus) (negativePropagation : Hminus →L[𝕜] Hminus)
    (leftShift : Hplus) (rightShift : Hminus) (length : ℝ)
    (hpositive : ‖positivePropagation‖ ≤ Real.exp (-3 * length / 2))
    (hnegative : ‖negativePropagation‖ ≤ Real.exp (-3 * length / 2))
    (hreturn : ‖leftGraph‖ * ‖rightGraph‖ * Real.exp (-3 * length) < 1) :
    ∃ x : Hplus, ∃ y : Hminus,
      x = leftGraph (negativePropagation y) + leftShift ∧
      y = rightGraph (positivePropagation x) + rightShift ∧
      ‖x‖ ≤ (‖leftShift‖ + ‖leftGraph‖ * Real.exp (-3 * length / 2) * ‖rightShift‖) /
        (1 - ‖leftGraph‖ * ‖rightGraph‖ * Real.exp (-3 * length)) ∧
      ‖y‖ ≤ ‖rightGraph‖ * Real.exp (-3 * length / 2) * ‖x‖ + ‖rightShift‖ ∧
      ∀ x' y', x' = leftGraph (negativePropagation y') + leftShift →
        y' = rightGraph (positivePropagation x') + rightShift → x' = x ∧ y' = y := by
  let decay := Real.exp (-3 * length / 2)
  let returnBound : ℝ≥0 :=
    ⟨‖leftGraph‖ * ‖rightGraph‖ * Real.exp (-3 * length), by positivity⟩
  let fromRight := leftGraph.comp negativePropagation
  let fromLeft := rightGraph.comp positivePropagation
  let returnMap := fromRight.comp fromLeft
  let shift := fromRight rightShift + leftShift
  have hdecay : decay * decay = Real.exp (-3 * length) := by
    dsimp only [decay]
    rw [← Real.exp_add]
    congr 1
    ring
  have hfromRight (y : Hminus) : ‖fromRight y‖ ≤ ‖leftGraph‖ * decay * ‖y‖ := calc
    ‖fromRight y‖ ≤ ‖leftGraph‖ * ‖negativePropagation y‖ :=
      leftGraph.le_opNorm _
    _ ≤ ‖leftGraph‖ * (decay * ‖y‖) := by
      gcongr
      exact (negativePropagation.le_opNorm y).trans
        (mul_le_mul_of_nonneg_right hnegative (norm_nonneg y))
    _ = ‖leftGraph‖ * decay * ‖y‖ := by ring
  have hfromLeft (x : Hplus) : ‖fromLeft x‖ ≤ ‖rightGraph‖ * decay * ‖x‖ := calc
    ‖fromLeft x‖ ≤ ‖rightGraph‖ * ‖positivePropagation x‖ :=
      rightGraph.le_opNorm _
    _ ≤ ‖rightGraph‖ * (decay * ‖x‖) := by
      gcongr
      exact (positivePropagation.le_opNorm x).trans
        (mul_le_mul_of_nonneg_right hpositive (norm_nonneg x))
    _ = ‖rightGraph‖ * decay * ‖x‖ := by ring
  have hreturnMap (x : Hplus) : ‖returnMap x‖ ≤ (returnBound : ℝ) * ‖x‖ := calc
    ‖returnMap x‖ ≤ ‖leftGraph‖ * decay * ‖fromLeft x‖ := hfromRight _
    _ ≤ ‖leftGraph‖ * decay * (‖rightGraph‖ * decay * ‖x‖) := by
      apply mul_le_mul_of_nonneg_left (hfromLeft x)
      exact mul_nonneg (norm_nonneg _) (Real.exp_nonneg _)
    _ = ‖leftGraph‖ * ‖rightGraph‖ * (decay * decay) * ‖x‖ := by ring
    _ = (returnBound : ℝ) * ‖x‖ := by rw [hdecay]; rfl
  let affine (x : Hplus) := returnMap x + shift
  have hcontract : ContractingWith returnBound affine := by
    refine ⟨hreturn, LipschitzWith.of_dist_le_mul fun u v => ?_⟩
    simpa only [affine, dist_eq_norm, add_sub_add_right_eq_sub, map_sub] using
      hreturnMap (u - v)
  let x := hcontract.fixedPoint affine
  let y := fromLeft x + rightShift
  have hfixed : affine x = x := hcontract.fixedPoint_isFixedPt
  have hfirst (u : Hplus) :
      affine u = leftGraph (negativePropagation (fromLeft u + rightShift)) + leftShift := by
    simp [affine, shift, returnMap, fromRight, add_assoc]
  refine ⟨x, y, hfixed.symm.trans (hfirst x), rfl, ?_, ?_, ?_⟩
  · have hshift : ‖shift‖ ≤ ‖leftShift‖ + ‖leftGraph‖ * decay * ‖rightShift‖ := calc
      ‖shift‖ ≤ ‖fromRight rightShift‖ + ‖leftShift‖ := norm_add_le _ _
      _ ≤ ‖leftGraph‖ * decay * ‖rightShift‖ + ‖leftShift‖ :=
        add_le_add (hfromRight _) le_rfl
      _ = _ := add_comm _ _
    have hestimate := hcontract.dist_fixedPoint_le (0 : Hplus)
    simp only [← show x = hcontract.fixedPoint affine from rfl, affine, map_zero, zero_add,
      dist_zero_left] at hestimate
    exact hestimate.trans (div_le_div_of_nonneg_right hshift hcontract.one_sub_K_pos.le)
  · exact (norm_add_le _ _).trans (add_le_add (hfromLeft _) le_rfl)
  · intro u v hu hv
    have huFixed : Function.IsFixedPt affine u := by
      rw [Function.IsFixedPt, hfirst, ← show v = fromLeft u + rightShift from hv]
      exact hu.symm
    have hux := hcontract.fixedPoint_unique huFixed
    exact ⟨hux, hv.trans (congrArg (fun a => fromLeft a + rightShift) hux)⟩

/-- A supplied pair of one-sided lifts and a supplied closed right inverse
produce a piecewise-harmonic right inverse of the two jumps. Both jumps
are the trace from the increasing-coordinate side minus the other trace.
If equality of traces also gives a global section and the closed operator
is injective, each correction is unique. -/
theorem closedJumpCorrectionOfRightInverse {𝕜 Closed Piecewise Source Trace : Type*}
    [NontriviallyNormedField 𝕜]
    [NormedAddCommGroup Closed] [NormedSpace 𝕜 Closed]
    [NormedAddCommGroup Piecewise] [NormedSpace 𝕜 Piecewise]
    [NormedAddCommGroup Source] [NormedSpace 𝕜 Source]
    [NormedAddCommGroup Trace] [NormedSpace 𝕜 Trace]
    (closedDirac : Closed →L[𝕜] Source) (piecewiseDirac : Piecewise →L[𝕜] Source)
    (cut : Closed →L[𝕜] Piecewise) (closedInverse : Source →L[𝕜] Closed)
    (leftPlus leftMinus rightPlus rightMinus : Piecewise →L[𝕜] Trace)
    (lift : Trace × Trace →L[𝕜] Piecewise)
    (hcommute : piecewiseDirac.comp cut = closedDirac)
    (hinverse : closedDirac.comp closedInverse = ContinuousLinearMap.id 𝕜 Source)
    (hclosedInjective : Function.Injective closedDirac) :
    let jump := (leftPlus - leftMinus).prod (rightPlus - rightMinus)
    jump.comp cut = 0 →
    jump.comp lift = ContinuousLinearMap.id 𝕜 (Trace × Trace) →
    (∀ v, jump v = 0 → ∃ w, cut w = v) →
    let correct := lift - cut.comp (closedInverse.comp (piecewiseDirac.comp lift))
    piecewiseDirac.comp correct = 0 ∧ jump.comp correct = ContinuousLinearMap.id 𝕜 (Trace × Trace) ∧
    ∀ j v, piecewiseDirac v = 0 → jump v = j → v = correct j := by
  intro jump hcut hlift hglue correct
  have hcommute' (w : Closed) : piecewiseDirac (cut w) = closedDirac w :=
    DFunLike.congr_fun hcommute w
  have hinverse' (f : Source) : closedDirac (closedInverse f) = f :=
    DFunLike.congr_fun hinverse f
  have hcut' (w : Closed) : jump (cut w) = 0 := DFunLike.congr_fun hcut w
  have hlift' (j : Trace × Trace) : jump (lift j) = j := DFunLike.congr_fun hlift j
  have hcorrect (j : Trace × Trace) :
      correct j = lift j - cut (closedInverse (piecewiseDirac (lift j))) := rfl
  have hker (j : Trace × Trace) : piecewiseDirac (correct j) = 0 := by
    rw [hcorrect, map_sub, hcommute', hinverse', sub_self]
  have htrace (j : Trace × Trace) : jump (correct j) = j := by
    rw [hcorrect, map_sub, hcut', hlift', sub_zero]
  refine ⟨ContinuousLinearMap.ext hker, ContinuousLinearMap.ext htrace, ?_⟩
  intro j v hv hJv
  obtain ⟨w, hw⟩ := hglue (v - correct j) (by rw [map_sub, hJv, htrace, sub_self])
  have hwzero : closedDirac w = 0 := by
    rw [← hcommute', hw, map_sub, hv, hker, sub_self]
  have : w = 0 := hclosedInjective (hwzero.trans (map_zero closedDirac).symm)
  rw [this, map_zero] at hw
  exact sub_eq_zero.mp hw.symm

/-- Integration of an almost-everywhere joint amplitude floor on a measured strip.
The joint mass uses the square sum of amplitudes raised to the power (4/3),
so the floor (c^2) costs (c^{8/3}) times strip volume. -/
theorem criticalJointMassFloor {X ι : Type*} [MeasurableSpace X]
    (μ : Measure X) (U : Set X) (fields : Finset ι) (amplitude : ι → X → ℝ≥0∞)
    (floor : ℝ≥0) (hfloor : ∀ᵐ x ∂(μ.restrict U),
      (floor : ℝ≥0∞) ^ (2 : ℕ) ≤ ∑ a ∈ fields, amplitude a x ^ (2 : ℕ)) :
    (floor : ℝ≥0∞) ^ (8 / 3 : ℝ) * μ U ≤
      ∫⁻ x in U, (∑ a ∈ fields, amplitude a x ^ (2 : ℕ)) ^ (4 / 3 : ℝ) ∂μ := by
  rw [← setLIntegral_const]
  refine lintegral_mono_ae (hfloor.mono fun x hx => ?_)
  convert ENNReal.rpow_le_rpow hx (by norm_num : 0 ≤ (4 / 3 : ℝ)) using 1
  rw [← ENNReal.rpow_natCast, ← ENNReal.rpow_mul]
  norm_num


/-- For a finite family of regular fields with individual critical norms bounded
by a constant times the supplied jump norms, the joint floor is bounded by
the total squared jump budget. The proof uses Minkowski at exponent \(4/3\). -/
theorem criticalJointFloorOfJumpBounds {X ι : Type*} [MeasurableSpace X]
    (μ : Measure X) (U : Set X) (fields : Finset ι) (amplitude : ι → X → ℝ≥0∞)
    (floor constant : ℝ≥0) (jumpNorm : ι → ℝ≥0)
    (hmeas : ∀ a ∈ fields, AEMeasurable (amplitude a) (μ.restrict U))
    (hbound : ∀ a ∈ fields,
      (∫⁻ x in U, amplitude a x ^ (8 / 3 : ℝ) ∂μ) ^ (3 / 8 : ℝ) ≤
        (constant : ℝ≥0∞) * (jumpNorm a : ℝ≥0∞))
    (hfloor : ∀ᵐ x ∂(μ.restrict U),
      (floor : ℝ≥0∞) ^ (2 : ℕ) ≤ ∑ a ∈ fields, amplitude a x ^ (2 : ℕ)) :
    (floor : ℝ≥0∞) ^ (2 : ℕ) * (μ U) ^ (3 / 4 : ℝ) ≤
      (constant : ℝ≥0∞) ^ (2 : ℕ) * ∑ a ∈ fields, (jumpNorm a : ℝ≥0∞) ^ (2 : ℕ) := by
  have hvolume :
      ((floor : ℝ≥0∞) ^ (8 / 3 : ℝ) * μ U) ^ (3 / 4 : ℝ) =
        (floor : ℝ≥0∞) ^ (2 : ℕ) * (μ U) ^ (3 / 4 : ℝ) := by
    rw [ENNReal.mul_rpow_of_nonneg _ _ (by norm_num), ← ENNReal.rpow_mul,
      ← ENNReal.rpow_natCast]
    norm_num
  have hp : 1 / (4 / 3 : ℝ) = 3 / 4 := by norm_num
  have hsquare (b : ℝ≥0∞) : (b ^ (2 : ℕ)) ^ (4 / 3 : ℝ) = b ^ (8 / 3 : ℝ) := by
    rw [← ENNReal.rpow_natCast, ← ENNReal.rpow_mul]
    norm_num
  have hnormSquare (b : ℝ≥0∞) : (b ^ (3 / 8 : ℝ)) ^ (2 : ℕ) = b ^ (3 / 4 : ℝ) := by
    rw [← ENNReal.rpow_natCast, ← ENNReal.rpow_mul]
    norm_num
  have hminkowski := eLpNorm'_sum_le
    (f := fun a x => amplitude a x ^ (2 : ℕ)) (μ := μ.restrict U)
    (s := fields) (fun a ha => ((hmeas a ha).pow_const (2 : ℕ)).aestronglyMeasurable)
    (by norm_num : 1 ≤ (4 / 3 : ℝ))
  simp only [eLpNorm'_eq_lintegral_enorm, Finset.sum_apply, enorm_eq_self, hp, hsquare] at hminkowski
  calc
    (floor : ℝ≥0∞) ^ (2 : ℕ) * (μ U) ^ (3 / 4 : ℝ) ≤
        (∫⁻ x in U, (∑ a ∈ fields, amplitude a x ^ (2 : ℕ)) ^ (4 / 3 : ℝ) ∂μ) ^
          (3 / 4 : ℝ) := by
      rw [← hvolume]
      exact ENNReal.rpow_le_rpow (criticalJointMassFloor μ U fields amplitude floor hfloor)
        (by norm_num)
    _ ≤ ∑ a ∈ fields, (∫⁻ x in U, amplitude a x ^ (8 / 3 : ℝ) ∂μ) ^ (3 / 4 : ℝ) :=
      hminkowski
    _ ≤ ∑ a ∈ fields, ((constant : ℝ≥0∞) * (jumpNorm a : ℝ≥0∞)) ^ (2 : ℕ) := by
      apply Finset.sum_le_sum
      intro a ha
      rw [← hnormSquare]
      exact pow_le_pow_left' (hbound a ha) _
    _ = _ := by simp_rw [mul_pow, Finset.mul_sum]

end FirstOrderTwistor
