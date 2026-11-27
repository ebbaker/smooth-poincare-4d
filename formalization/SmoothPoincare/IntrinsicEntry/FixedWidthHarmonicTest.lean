import SmoothPoincare.IntrinsicEntry.ThreeCuffNeumann
import SmoothPoincare.IntrinsicEntry.FixedBandCurvature
import Mathlib.Analysis.SpecialFunctions.Arcosh
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Series

/-! # Quantitative tests on the fixed long-cuff convex bands

The radial inequality uses the identical matched restriction and the physical
three-funnel Rayleigh form. The inverse test concerns the two genuine sphere
tangent eigenvectors at a timed letter pause and a framed pole. The last
calculation records the scaled pole term in the relaxed local enclosure.
-/

open Filter FirstOrderTwistor
open scoped BigOperators Topology

namespace SmoothPoincare.IntrinsicEntry

/-- The cuff length of the specified long equicuff trial. -/
noncomputable def longCuffLength : ℝ := 2 * Real.arcosh 5

/-- A rational upper enclosure for the exact three-funnel response per
squared outer trace on the symmetric two-band radial test. -/
theorem longCuffRadialResponse_lt_661 : 144 * longCuffLength < 661 := by
  let x : ℝ := 661 / 288
  have hseries : HasSum (fun n : ℕ => x ^ n / (n.factorial : ℝ)) (Real.exp x) := by
    rw [Real.exp_eq_exp_ℝ]
    exact NormedSpace.expSeries_div_hasSum_exp x
  have hpol : (99 / 10 : ℝ) < ∑ n ∈ Finset.range 8, x ^ n / (n.factorial : ℝ) := by
    norm_num [x, Finset.sum_range_succ, Nat.factorial]
  have hsum : (∑ n ∈ Finset.range 8, x ^ n / (n.factorial : ℝ)) ≤ Real.exp x := by
    rw [← hseries.tsum_eq]
    exact hseries.summable.sum_le_tsum _ (fun n _ => by positivity)
  have hsqrt : Real.sqrt 24 < 49 / 10 := by
    nlinarith [Real.sq_sqrt (by norm_num : (0 : ℝ) ≤ 24), Real.sqrt_nonneg 24]
  have hcmp : Real.exp (Real.arcosh 5) < Real.exp x := by
    rw [Real.exp_arcosh (by norm_num : (1 : ℝ) ≤ 5)]
    norm_num only [show (5 : ℝ) ^ 2 - 1 = 24 by norm_num]
    exact (by linarith only [hsqrt] : (5 : ℝ) + Real.sqrt 24 < 99 / 10).trans_le
      (hpol.trans_le hsum).le
  have hx := Real.exp_lt_exp.mp hcmp
  dsimp only [longCuffLength, x] at *
  linarith only [hx]

variable {Closed Core : Type*} {Funnel Trace : Fin 3 → Type*}

/-- An inclusive rational band budget gives strict original negativity when
the matched outer trace is nonzero. The exact radial Rayleigh identity in
this hypothesis is the physical two-band extension, including all funnels. -/
theorem closedNegative_of_longCuffRadialMargin
    (form : ThreeCuffForm Closed Core Funnel Trace) (ground : ThreeCuffGroundState form)
    (test : Closed) (bandEnergy outerValue : ℝ)
    (hradial : form.closedEnergy test = 2 * bandEnergy + 144 * longCuffLength * outerValue ^ 2)
    (hmass : 0 < form.closedNormSq test) (hout : outerValue ≠ 0)
    (hband : 2 * bandEnergy + 661 * outerValue ^ 2 ≤ 0) : form.closedFirstValue < 0 := by
  have hfunnel := mul_lt_mul_of_pos_right longCuffRadialResponse_lt_661 (sq_pos_of_ne_zero hout)
  apply closedNegative_of_symmetricRadialTest form ground test bandEnergy longCuffLength outerValue
    hradial hmass
  linarith only [hfunnel, hband]

/-- The case of zero outer trace has no funnel charge and requires a strictly
negative band numerator. -/
theorem closedNegative_of_longCuffRadialZeroTrace
    (form : ThreeCuffForm Closed Core Funnel Trace) (ground : ThreeCuffGroundState form)
    (test : Closed) (bandEnergy : ℝ)
    (hradial : form.closedEnergy test = 2 * bandEnergy)
    (hmass : 0 < form.closedNormSq test) (hband : bandEnergy < 0) : form.closedFirstValue < 0 := by
  apply closedNegative_of_symmetricRadialTest form ground test bandEnergy longCuffLength 0
    (by simpa using hradial) hmass
  simpa using hband

/-- The relative difference of the inverse metric coefficient of the
interpolation from that of the exterior endpoint. The cap coefficient is
one in the same tangential direction. -/
noncomputable def fixedWidthRelativeInverseError (α b : ℝ) : ℝ := α * (1 - b) / (α + (1 - α) * b)

/-- The precise comparison tolerance for an exterior inverse coefficient. -/
theorem fixedWidthRelativeInverseError_le_iff {α b ε : ℝ}
    (hα : 0 ≤ α) (hα₁ : α ≤ 1) (hb : 0 < b) :
    fixedWidthRelativeInverseError α b ≤ ε ↔ α * (1 - ε) * (1 - b) ≤ ε * b := by
  have hden : 0 < α + (1 - α) * b := by
    rcases eq_or_lt_of_le hα with hzero | hpos
    · simpa [← hzero] using hb
    · exact add_pos_of_pos_of_nonneg hpos (mul_nonneg (sub_nonneg.mpr hα₁) hb.le)
  rw [fixedWidthRelativeInverseError, div_le_iff₀ hden]
  constructor <;> intro h <;> nlinarith only [h]

/-- Identification with the relative error in the actual scalar inverse entry
on a common diagonal direction of the two endpoint metrics. -/
theorem fixedWidthRelativeInverseError_eq_abs {α b : ℝ}
    (hα : 0 ≤ α) (hα₁ : α ≤ 1) (hb : 0 < b) (hb₁ : b ≤ 1) :
    |b / (α + (1 - α) * b) - 1| = fixedWidthRelativeInverseError α b := by
  have hden : 0 < α + (1 - α) * b := by
    rcases eq_or_lt_of_le hα with hzero | hpos
    · simpa [← hzero] using hb
    · exact add_pos_of_pos_of_nonneg hpos (mul_nonneg (sub_nonneg.mpr hα₁) hb.le)
  have hprod := mul_nonneg hα (sub_nonneg.mpr hb₁)
  have hq : b / (α + (1 - α) * b) ≤ 1 := by
    rw [div_le_iff₀ hden]
    nlinarith only [hprod]
  rw [abs_of_nonpos (sub_nonpos.mpr hq), neg_sub, fixedWidthRelativeInverseError]
  calc
    1 - b / (α + (1 - α) * b) =
        (α + (1 - α) * b) / (α + (1 - α) * b) - b / (α + (1 - α) * b) := by
      rw [div_self hden.ne']
    _ = _ := by
      rw [← sub_div]
      congr 1
      ring

/-- At the precise `a = 15/16` switch level, each pole tangential mode with
the certified endpoint ratio `b < 1/7` has at least this relative separation. -/
theorem fixedWidthPoleInverseError_gt_three_elevenths {b : ℝ}
    (hb : 0 < b) (hb₁ : b < 1 / 7) :
    3 / 11 < fixedWidthRelativeInverseError (1 / 16) b := by
  apply lt_of_not_ge
  intro h
  have hbound := (fixedWidthRelativeInverseError_le_iff
    (α := 1 / 16) (ε := 3 / 11) (by norm_num) (by norm_num) hb).mp h
  linarith only [hbound, hb₁]

/-- A ten-percent exterior inverse comparison is impossible before `a`
passes `53/54` for any of the indicated sphere tangent coefficients. -/
theorem fixedWidthPoleInverseError_gt_tenth {α b : ℝ}
    (hα : 1 / 54 ≤ α) (hα₁ : α ≤ 1) (hb : 0 < b) (hb₁ : b < 1 / 7) :
    1 / 10 < fixedWidthRelativeInverseError α b := by
  apply lt_of_not_ge
  intro h
  have hbound := (fixedWidthRelativeInverseError_le_iff
    (ε := 1 / 10) (by linarith only [hα]) hα₁ hb).mp h
  have hmul := mul_nonneg (show 0 ≤ α - 1 / 54 by linarith only [hα])
    (show 0 ≤ 1 - b by linarith only [hb₁])
  nlinarith only [hbound, hmul, hb₁]

/-- With the exact endpoint upper ratio `28 * (9/128)^2`, the inverse
separation at `a = 15/16` has this slightly stronger rational lower bound. -/
theorem fixedWidthPoleInverseError_gt_exact_margin {b : ℝ}
    (hb : 0 < b) (hb₁ : b < 567 / 4096) :
    3529 / 12601 < fixedWidthRelativeInverseError (1 / 16) b := by
  apply lt_of_not_ge
  intro h
  have hbound := (fixedWidthRelativeInverseError_le_iff
    (α := 1 / 16) (ε := 3529 / 12601) (by norm_num) (by norm_num) hb).mp h
  linarith only [hbound, hb₁]

/-- The exact upper ratio also gives the obstruction to ten-percent
relative inverse closeness through `a = 3466/3529`. -/
theorem fixedWidthPoleInverseError_gt_tenth_exact {α b : ℝ}
    (hα : 63 / 3529 ≤ α) (hα₁ : α ≤ 1) (hb : 0 < b) (hb₁ : b < 567 / 4096) :
    1 / 10 < fixedWidthRelativeInverseError α b := by
  apply lt_of_not_ge
  intro h
  have hbound := (fixedWidthRelativeInverseError_le_iff
    (ε := 1 / 10) (by linarith only [hα]) hα₁ hb).mp h
  have hmul := mul_nonneg (show 0 ≤ α - 63 / 3529 by linarith only [hα])
    (show 0 ≤ 1 - b by linarith only [hb₁])
  nlinarith only [hbound, hmul, hb₁]

/-- The finite enclosure test with the actual pole coefficients also gives
an explicit witness within the relaxed box at `a = 15/16`. -/
theorem fixedWidthPoleInverseError_example :
    fixedWidthRelativeInverseError (1 / 16) (1 / 256) = 255 / 271 := by
  norm_num [fixedWidthRelativeInverseError]

/-- The leading sectional expression in the normal and thinnest sphere
plane. `second` is `τ⁴ a''(b-1)/gᵥᵥ`, `first` is `τ² gᵥᵥ'/gᵥᵥ`, and
`rest` is the remaining scaled lowered curvature divided by `gᵥᵥ`. -/
noncomputable def outerPoleScaledSectional (d second first rest : ℝ) : ℝ :=
  (-second / 2 + first ^ 2 / 4 + rest) / d

/-- Normalize the actual lowered pole slot first by the physical plane
area squared and then by the fourth power of the switch distance. The
`remainder` is the lowered slot after the cutoff Hessian and squared normal
Christoffel term have been removed. -/
theorem outerPoleSectional_normalize (τ d c second velocity remainder : ℝ)
    (hd : d ≠ 0) (hc : c ≠ 0) :
    τ ^ 4 * ((-second / 2 + velocity ^ 2 / (4 * c) + remainder) / (d * c)) =
      outerPoleScaledSectional d (τ ^ 4 * second / c)
        (τ ^ 2 * velocity / c) (τ ^ 4 * remainder / c) := by
  unfold outerPoleScaledSectional
  field_simp

/-- Transfer of the scaled switch limits after the physical E52 curvature
formula. The numerical constants here are for width `1/16` and transverse
radius coefficient `δ = 1/16`. -/
theorem outerPoleSectional_scaled_limit {X : Type*} {l : Filter X}
    (d second first rest : X → ℝ)
    (hd : Tendsto d l (𝓝 (1 / 256))) (hsecond : Tendsto second l (𝓝 256))
    (hfirst : Tendsto first l (𝓝 (-16))) (hrest : Tendsto rest l (𝓝 0)) :
    Tendsto (fun x => outerPoleScaledSectional (d x) (second x) (first x) (rest x)) l
      (𝓝 (-16384)) := by
  have h := (((hsecond.neg.div_const 2).add ((hfirst.pow 2).div_const 4)).add hrest).div hd
    (by norm_num : (1 / 256 : ℝ) ≠ 0)
  have hn : ((-256 / 2 + (-16) ^ 2 / 4 + 0) / (1 / 256) : ℝ) = -16384 := by
    norm_num
  rw [hn] at h
  exact h

/-- In the physical frame, a single leading `03` sectional plane gives the
same `K²/6` coefficient in both real two-form Hilbert–Schmidt densities. -/
theorem outerPoleLeading_chiralDensities (K : ℝ) :
    fixedBandChiralDensities (principalGaussTensor ![1, 0, 0, K]) = (K ^ 2 / 6, K ^ 2 / 6) := by
  unfold fixedBandChiralDensities
  rw [principalGauss_chiralBlocks_eq]
  have h := principalGauss_weylNormSq ![1, 0, 0, K]
  simp at h
  have h' : _ = K ^ 2 / 6 := h.trans (by ring)
  rw [h']

end SmoothPoincare.IntrinsicEntry
