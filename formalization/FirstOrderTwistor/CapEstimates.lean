import Mathlib.MeasureTheory.Function.LpSeminorm.LpNorm

/-!
# Yamabe localization for supplied cap data

The NECK-E01 and NECK-E07 estimates reduce the global lower bound on one side
to two localized form bounds and an IMS loss. The results here use real
functions on a measure space. The geometric form estimates and the IMS
identity for a smooth capped metric are supplied separately.
-/

open Filter MeasureTheory Set
open scoped ENNReal

namespace FirstOrderTwistor

/-- The scalar lower bound from local form estimates, the partition mass
inequality and an upper bound on the IMS error. -/
theorem capFormLowerBoundOfIMS {source cap loss total left right error mass massLeft massRight : ℝ}
    (hSource : 0 ≤ source) (hCap : 0 ≤ cap)
    (hMassLeft : 0 ≤ massLeft) (hMassRight : 0 ≤ massRight)
    (hLeft : source * massLeft ≤ left) (hRight : cap * massRight ≤ right)
    (hMass : mass ≤ massLeft + massRight)
    (hIMS : total = left + right - error) (hError : error ≤ loss * mass) :
    (min source cap - loss) * mass ≤ total := by
  have hLocal : min source cap * massLeft + min source cap * massRight ≤ left + right :=
    add_le_add ((mul_le_mul_of_nonneg_right (min_le_left _ _) hMassLeft).trans hLeft)
      ((mul_le_mul_of_nonneg_right (min_le_right _ _) hMassRight).trans hRight)
  calc
    (min source cap - loss) * mass = min source cap * mass - loss * mass := sub_mul ..
    _ ≤ min source cap * (massLeft + massRight) - loss * mass :=
      sub_le_sub_right (mul_le_mul_of_nonneg_left hMass (le_min hSource hCap)) _
    _ ≤ left + right - error := by
      rw [mul_add]
      exact sub_le_sub hLocal hError
    _ = total := hIMS.symm

/-- The positive lower margin used in NECK-E01. The argument also applies
with a cap model coefficient already normalized for a finite quotient. -/
theorem halfCapYamabeMargin {source sourceFloor round decay loss : ℝ}
    (hSource : sourceFloor ≤ source) (hRound : 0 ≤ round)
    (hDecay : decay ≤ 1 / 2) (hLoss : loss ≤ min sourceFloor (round / 2) / 2) :
    min sourceFloor (round / 2) / 2 ≤ min source ((1 - decay) * round) - loss := by
  have hRoundHalf : round / 2 ≤ (1 - decay) * round := by
    calc
      round / 2 = (1 / 2 : ℝ) * round := by ring
      _ ≤ (1 - decay) * round := mul_le_mul_of_nonneg_right (by linarith) hRound
  have hMin : min sourceFloor (round / 2) ≤ min source ((1 - decay) * round) :=
    min_le_min hSource hRoundHalf
  linarith only [hMin, hLoss]

/-- Positivity from the strict source and round model floors and the paper's
half-margin choices. `yamabe` may be the test infimum bounded below by the
localization theorem. -/
theorem capYamabePositiveOfMargin {yamabe source sourceFloor round decay loss : ℝ}
    (hFloor : 0 < sourceFloor) (hSource : sourceFloor ≤ source) (hRound : 0 < round)
    (hDecay : decay ≤ 1 / 2) (hLoss : loss ≤ min sourceFloor (round / 2) / 2)
    (hYamabe : min source ((1 - decay) * round) - loss ≤ yamabe) :
    0 < yamabe := by
  have hHalf : 0 < min sourceFloor (round / 2) / 2 :=
    half_pos (lt_min hFloor (half_pos hRound))
  exact hHalf.trans_le ((halfCapYamabeMargin hSource hRound.le hDecay hLoss).trans hYamabe)

/-- A cover-normalized loss threshold suffices uniformly for the E07
finite-quotient margins. `scale` represents the square root of the group order. -/
theorem halfQuotientCapYamabeMargin {source sourceFloor round decay loss scale : ℝ}
    (hScale : 1 ≤ scale) (hFloor : 0 ≤ sourceFloor) (hSource : sourceFloor ≤ source)
    (hRound : 0 ≤ round) (hDecay : decay ≤ 1 / 2)
    (hLoss : loss ≤ min sourceFloor (round / 2) / 2) :
    min sourceFloor (round / scale / 2) / 2 ≤
      min source ((1 - decay) * (round / scale)) - loss / scale := by
  have hScalePos : 0 < scale := zero_lt_one.trans_le hScale
  have hScaledSource : sourceFloor / scale ≤ sourceFloor := by
    apply (div_le_iff₀ hScalePos).mpr
    simpa using mul_le_mul_of_nonneg_left hScale hFloor
  have hScaledMin : min sourceFloor (round / 2) / scale ≤ min sourceFloor (round / scale / 2) := by
    apply le_min
    · exact (div_le_div_of_nonneg_right (min_le_left _ _) hScalePos.le).trans hScaledSource
    · rw [div_right_comm round scale 2]
      exact div_le_div_of_nonneg_right (min_le_right _ _) hScalePos.le
  apply halfCapYamabeMargin hSource (div_nonneg hRound hScalePos.le) hDecay
  calc
    loss / scale ≤ (min sourceFloor (round / 2) / 2) / scale :=
      div_le_div_of_nonneg_right hLoss hScalePos.le
    _ = (min sourceFloor (round / 2) / scale) / 2 := div_right_comm ..
    _ ≤ min sourceFloor (round / scale / 2) / 2 := by linarith only [hScaledMin]

section Measure

variable {α : Type*} [MeasurableSpace α] {μ : Measure α}

private theorem square_memLp_two {f : α → ℝ} (hf : MemLp f 4 μ) :
    MemLp (fun x => f x ^ 2) 2 μ := by
  have hExp : (4 : ℝ≥0∞) / 2 = 2 := by
    symm
    rw [ENNReal.eq_div_iff (by norm_num) (by simp)]
    norm_num
  simpa only [hExp, ENNReal.toReal_ofNat, Real.rpow_two, Real.norm_eq_abs, sq_abs]
    using hf.norm_rpow_div 2

private theorem lpNorm_square {f : α → ℝ} (hf : AEStronglyMeasurable f μ) :
    lpNorm (fun x => f x ^ 2) 2 μ = lpNorm f 4 μ ^ 2 := by
  have h := eLpNorm_norm_rpow (p := (2 : ℝ≥0∞)) f hf (by norm_num : (0 : ℝ) < 2)
  norm_num [Real.rpow_two, Real.norm_eq_abs, sq_abs, ENNReal.rpow_ofNat] at h
  simpa only [ENNReal.toReal_pow, toReal_eLpNorm] using congrArg ENNReal.toReal h

private theorem cutoff_memLp {χ u : α → ℝ} (hχ : AEStronglyMeasurable χ μ)
    (hu : MemLp u 4 μ) (hBound : ∀ᵐ x ∂μ, χ x ^ 2 ≤ 1) :
    MemLp (fun x => χ x * u x) 4 μ := by
  refine hu.of_le (hχ.mul hu.aestronglyMeasurable) ?_
  filter_upwards [hBound] with x hx
  have hAbs : |χ x| ≤ 1 := by
    have hSquare : |χ x| ^ 2 ≤ 1 := by simpa only [sq_abs] using hx
    nlinarith only [hSquare, abs_nonneg (χ x)]
  rw [norm_mul, Real.norm_eq_abs (χ x)]
  simpa only [one_mul] using mul_le_mul_of_nonneg_right hAbs (norm_nonneg (u x))

/-- For a squared partition of unity, the squared `L⁴` mass of a real test
is bounded by the sum of the two localized masses. -/
theorem capPartitionMass {χ ξ u : α → ℝ} (hχ : AEStronglyMeasurable χ μ)
    (hξ : AEStronglyMeasurable ξ μ) (hu : MemLp u 4 μ)
    (hPartition : ∀ᵐ x ∂μ, χ x ^ 2 + ξ x ^ 2 = 1) :
    lpNorm u 4 μ ^ 2 ≤
      lpNorm (fun x => χ x * u x) 4 μ ^ 2 + lpNorm (fun x => ξ x * u x) 4 μ ^ 2 := by
  have hLeft := cutoff_memLp hχ hu (hPartition.mono fun x hx => by nlinarith [sq_nonneg (ξ x)])
  have hRight := cutoff_memLp hξ hu (hPartition.mono fun x hx => by nlinarith [sq_nonneg (χ x)])
  have hSplit : (fun x => u x ^ 2) =ᵐ[μ]
      (fun x => (χ x * u x) ^ 2) + (fun x => (ξ x * u x) ^ 2) := by
    filter_upwards [hPartition] with x hx
    simp only [Pi.add_apply, mul_pow, ← add_mul, hx, one_mul]
  rw [← lpNorm_square hu.aestronglyMeasurable, ← lpNorm_square hLeft.aestronglyMeasurable,
    ← lpNorm_square hRight.aestronglyMeasurable, ← toReal_eLpNorm (f := fun x => u x ^ 2),
    eLpNorm_congr_ae hSplit, toReal_eLpNorm]
  exact lpNorm_add_le (square_memLp_two hLeft) (by norm_num)

/-- The four-dimensional IMS loss bound from Hölder. The coefficient
`F` is the sum of the cutoff gradient squares in the geometric application. -/
theorem capCutoffLoss {F u : α → ℝ} (hF : MemLp F 2 μ) (hu : MemLp u 4 μ)
    (hNonneg : 0 ≤ᵐ[μ] F) :
    6 * (∫ x, F x * u x ^ 2 ∂μ) ≤ (6 * lpNorm F 2 μ) * lpNorm u 4 μ ^ 2 := by
  have hConj : (2 : ℝ).HolderConjugate 2 := by
    rw [Real.holderConjugate_iff]
    norm_num
  have hSquared := square_memLp_two hu
  have hHolder := integral_mul_norm_le_Lp_mul_Lq hConj
    (by simpa using hF : MemLp F (ENNReal.ofReal (2 : ℝ)) μ)
    (by simpa using hSquared : MemLp (fun x => u x ^ 2) (ENNReal.ofReal (2 : ℝ)) μ)
  have hIntegral : (∫ x, F x * u x ^ 2 ∂μ) = ∫ x, ‖F x‖ * ‖u x ^ 2‖ ∂μ := by
    apply integral_congr_ae
    filter_upwards [hNonneg] with x hx
    rw [Real.norm_of_nonneg hx, Real.norm_of_nonneg (sq_nonneg (u x))]
  have hLp (f : α → ℝ) (hf : AEStronglyMeasurable f μ) :
      lpNorm f 2 μ = (∫ x, ‖f x‖ ^ (2 : ℝ) ∂μ) ^ (1 / 2 : ℝ) := by
    rw [lpNorm_eq_integral_norm_rpow_toReal (by norm_num) (by simp) hf]
    norm_num [one_div]
  rw [hIntegral, mul_assoc, ← lpNorm_square hu.aestronglyMeasurable,
    hLp F hF.aestronglyMeasurable, hLp _ hSquared.aestronglyMeasurable]
  exact mul_le_mul_of_nonneg_left hHolder (by norm_num)

/-- Lower bound for the infimum of the Rayleigh quotients of a nonempty test
class. A uniform bound on the cutoffs' `L²` loss and the two localized form
bounds are the geometric inputs, along with the IMS identity. -/
theorem capYamabeInfimumLowerBound
    {χ ξ F : α → ℝ} (Q : (α → ℝ) → ℝ) (tests : Set (α → ℝ)) (source cap loss : ℝ)
    (hχ : AEStronglyMeasurable χ μ) (hξ : AEStronglyMeasurable ξ μ)
    (hPartition : ∀ᵐ x ∂μ, χ x ^ 2 + ξ x ^ 2 = 1)
    (hF : MemLp F 2 μ) (hFNonneg : 0 ≤ᵐ[μ] F) (hLoss : 6 * lpNorm F 2 μ ≤ loss)
    (hSource : 0 ≤ source) (hCap : 0 ≤ cap) (hTests : tests.Nonempty)
    (hTest : ∀ u ∈ tests, MemLp u 4 μ ∧ ¬ (u =ᵐ[μ] 0))
    (hLeft : ∀ u ∈ tests, source * lpNorm (fun x => χ x * u x) 4 μ ^ 2 ≤ Q (fun x => χ x * u x))
    (hRight : ∀ u ∈ tests, cap * lpNorm (fun x => ξ x * u x) 4 μ ^ 2 ≤ Q (fun x => ξ x * u x))
    (hIMS : ∀ u ∈ tests, Q u = Q (fun x => χ x * u x) + Q (fun x => ξ x * u x) -
      6 * (∫ x, F x * u x ^ 2 ∂μ)) :
    min source cap - loss ≤ sInf ((fun u => Q u / lpNorm u 4 μ ^ 2) '' tests) := by
  apply le_csInf (hTests.image _)
  rintro _ ⟨u, hu, rfl⟩
  obtain ⟨hMem, hNonzero⟩ := hTest u hu
  have hMassPos : 0 < lpNorm u 4 μ ^ 2 := by
    have hNormNonzero : lpNorm u 4 μ ≠ 0 :=
      fun h => hNonzero ((lpNorm_eq_zero hMem (by norm_num)).mp h)
    positivity
  apply (le_div_iff₀ hMassPos).mpr
  exact capFormLowerBoundOfIMS hSource hCap (sq_nonneg _) (sq_nonneg _)
    (hLeft u hu) (hRight u hu) (capPartitionMass hχ hξ hMem hPartition) (hIMS u hu)
    ((capCutoffLoss hF hMem hFNonneg).trans
      (mul_le_mul_of_nonneg_right hLoss (sq_nonneg _)))

end Measure

end FirstOrderTwistor
