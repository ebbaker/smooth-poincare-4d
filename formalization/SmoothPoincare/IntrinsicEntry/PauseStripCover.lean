import SmoothPoincare.IntrinsicEntry.PauseStripRational
import Mathlib.Analysis.SpecialFunctions.ExpDeriv
import Mathlib.Analysis.Calculus.Deriv.Inv
import Mathlib.Analysis.Calculus.Deriv.Pow
import Mathlib.Tactic.Linarith

/-! # The rational contrast enclosure on the whole pause strip -/

open Set
open scoped Topology

namespace SmoothPoincare.IntrinsicEntry

noncomputable section

private theorem exists_pauseMeshCell (n : ℕ) {x : ℝ}
    (h₀ : (3 / 20 : ℝ) ≤ x) (hₙ : x ≤ (3 / 20 : ℝ) + ((n + 1 : ℕ) : ℝ) / 800) :
    ∃ j : ℕ, j ≤ n ∧ (3 / 20 : ℝ) + (j : ℝ) / 800 ≤ x ∧
      x ≤ (3 / 20 : ℝ) + (j : ℝ) / 800 + 1 / 800 := by
  induction n with
  | zero =>
    refine ⟨0, le_rfl, ?_, ?_⟩ <;> norm_num at * <;> linarith
  | succ n ih =>
    by_cases ht : x ≤ (3 / 20 : ℝ) + ((n + 1 : ℕ) : ℝ) / 800
    · obtain ⟨j, hj, ha, hb⟩ := ih ht
      exact ⟨j, hj.trans n.le_succ, ha, hb⟩
    · refine ⟨n + 1, le_rfl, le_of_lt (lt_of_not_ge ht), ?_⟩
      push_cast at *
      linarith

/-- The forty closed rational cells cover the entire real strip, including
both endpoints and every joint between two cells. -/
theorem pauseStripCell_cover {x : ℝ} (hx : x ∈ Icc (3 / 20) (1 / 5)) :
    ∃ i : Fin 40, x ∈ Icc (pauseStripCellLeft i : ℝ) (pauseStripCellRight i : ℝ) := by
  have htop : x ≤ (3 / 20 : ℝ) + ((39 + 1 : ℕ) : ℝ) / 800 := by
    norm_num
    exact hx.2
  obtain ⟨j, hj, ha, hb⟩ := exists_pauseMeshCell 39 hx.1 htop
  refine ⟨⟨j, Nat.lt_succ_of_le hj⟩, ?_, ?_⟩
  · simpa [pauseStripCellLeft] using ha
  · simpa [pauseStripCellRight, pauseStripCellLeft] using hb

theorem pauseStripCell_iUnion :
    (⋃ i : Fin 40, Icc (pauseStripCellLeft i : ℝ) (pauseStripCellRight i : ℝ)) =
      Icc (3 / 20) (1 / 5) := by
  ext x
  constructor
  · intro h
    obtain ⟨i, hi⟩ := mem_iUnion.mp h
    have h₀ : (0 : ℝ) ≤ i.val := by positivity
    have h₁ : (i.val : ℝ) ≤ 39 :=
      by exact_mod_cast (show i.val ≤ 39 by omega)
    have hL : (3 / 20 : ℝ) ≤ (pauseStripCellLeft i : ℝ) := by
      unfold pauseStripCellLeft
      push_cast
      linarith
    have hR : (pauseStripCellRight i : ℝ) ≤ (1 / 5 : ℝ) := by
      unfold pauseStripCellRight pauseStripCellLeft
      push_cast
      linarith
    exact ⟨hL.trans hi.1, hi.2.trans hR⟩
  · exact fun h => mem_iUnion.mpr (pauseStripCell_cover h)

private theorem pauseStripCell_realBounds (i : Fin 40) :
    0 < (pauseStripCellLeft i : ℝ) ∧ (pauseStripCellRight i : ℝ) < 1 := by
  have hi : (i.val : ℝ) < 40 := by exact_mod_cast i.isLt
  have hn : (0 : ℝ) ≤ i.val := by positivity
  simp only [pauseStripCellLeft, pauseStripCellRight, Rat.cast_add, Rat.cast_div,
    Rat.cast_natCast, Rat.cast_ofNat, Rat.cast_one]
  constructor <;> linarith

/-- The argument whose negative exponent gives the smooth switch odds. -/
def pauseStripRealArgument (x : ℝ) : ℝ := 1 / x - 1 / (1 - x)

/-- Exact logistic odds on the strip. -/
def pauseStripRealOdds (x : ℝ) : ℝ := Real.exp (-pauseStripRealArgument x)

/-- The first derivative polynomial in the physical radial variable. -/
def pauseStripRealSlope (x : ℝ) : ℝ :=
  16 * pauseStripRealOdds x * (1 / x ^ 2 + 1 / (1 - x) ^ 2)

/-- The second derivative polynomial in the same physical variable. -/
def pauseStripRealSecond (x : ℝ) : ℝ :=
  256 * pauseStripRealOdds x *
    ((1 / x ^ 2 + 1 / (1 - x) ^ 2) ^ 2 - 2 / x ^ 3 + 2 / (1 - x) ^ 3)

/-- The physical scalar lower expression for the four-section contrast. -/
def pauseStripContrastFloor (x : ℝ) : ℝ :=
  (3 / 25) * pauseStripRealSecond x - 9 - 11 * pauseStripRealSlope x -
    (53 / 100) * pauseStripRealSlope x ^ 2

private theorem reciprocalPow_anti {a b : ℝ} (ha : 0 < a) (hab : a ≤ b) (n : ℕ) :
    1 / b ^ n ≤ 1 / a ^ n :=
  one_div_le_one_div_of_le (pow_pos ha _) (pow_le_pow_left₀ ha.le hab _)

private theorem pauseStripRealArgument_anti {a b : ℝ} (ha : 0 < a) (hb : b < 1)
    (hab : a ≤ b) : pauseStripRealArgument b ≤ pauseStripRealArgument a := by
  unfold pauseStripRealArgument
  exact sub_le_sub (one_div_le_one_div_of_le ha hab)
    (one_div_le_one_div_of_le (sub_pos.mpr hb) (by linarith))

private theorem pauseStripRealOdds_mono {a b : ℝ} (ha : 0 < a) (hb : b < 1)
    (hab : a ≤ b) : pauseStripRealOdds a ≤ pauseStripRealOdds b :=
  Real.exp_le_exp.mpr (neg_le_neg (pauseStripRealArgument_anti ha hb hab))

private theorem pauseStripArgument_cast (x : ℚ) :
    (pauseStripArgument x : ℝ) = pauseStripRealArgument (x : ℝ) := by
  unfold pauseStripArgument pauseStripRealArgument
  push_cast
  rfl

/-- The actual exponential odds and both inverse-power terms obey the
cell bounds throughout each closed cell. -/
theorem pauseStripPolynomial_cell_enclosure (i : Fin 40) {x : ℝ}
    (hx : x ∈ Icc (pauseStripCellLeft i : ℝ) (pauseStripCellRight i : ℝ)) :
    0 ≤ pauseStripRealSlope x ∧
      pauseStripRealSlope x ≤ (pauseStripSlopeUpper i : ℝ) ∧
      (pauseStripSecondLower i : ℝ) ≤ pauseStripRealSecond x := by
  let a : ℝ := pauseStripCellLeft i
  let b : ℝ := pauseStripCellRight i
  have ha : 0 < a := (pauseStripCell_realBounds i).1
  have hb : b < 1 := (pauseStripCell_realBounds i).2
  have hx₀ : 0 < x := ha.trans_le hx.1
  have hx₁ : x < 1 := hx.2.trans_lt hb
  have hba : a ≤ b := hx.1.trans hx.2
  obtain ⟨hoL, hoU⟩ := pauseStripCellOdds_enclose i
  rw [pauseStripArgument_cast] at hoL hoU
  have hOddsLow : (pauseStripOddsLower (pauseStripCellLeft i) : ℝ) ≤ pauseStripRealOdds x :=
    hoL.trans (pauseStripRealOdds_mono ha hx₁ hx.1)
  have hOddsHigh : pauseStripRealOdds x ≤ (pauseStripOddsUpper (pauseStripCellRight i) : ℝ) :=
    (pauseStripRealOdds_mono hx₀ hb hx.2).trans hoU
  have hOddsPos : 0 < pauseStripRealOdds x := Real.exp_pos _
  have hInvLow (n : ℕ) : 1 / b ^ n ≤ 1 / x ^ n := reciprocalPow_anti hx₀ hx.2 n
  have hInvHigh (n : ℕ) : 1 / x ^ n ≤ 1 / a ^ n := reciprocalPow_anti ha hx.1 n
  have hCompLow (n : ℕ) : 1 / (1 - a) ^ n ≤ 1 / (1 - x) ^ n :=
    reciprocalPow_anti (sub_pos.mpr hx₁) (by linarith [hx.1]) n
  have hCompHigh (n : ℕ) : 1 / (1 - x) ^ n ≤ 1 / (1 - b) ^ n :=
    reciprocalPow_anti (sub_pos.mpr hb) (by linarith [hx.2]) n
  have hSlopePos : 0 ≤ pauseStripRealSlope x := by
    unfold pauseStripRealSlope
    positivity
  refine ⟨hSlopePos, ?_, ?_⟩
  · have hSum : 1 / x ^ 2 + 1 / (1 - x) ^ 2 ≤ 1 / a ^ 2 + 1 / (1 - b) ^ 2 :=
      add_le_add (hInvHigh 2) (hCompHigh 2)
    have hU : 0 ≤ (pauseStripOddsUpper (pauseStripCellRight i) : ℝ) :=
      hOddsPos.le.trans hOddsHigh
    unfold pauseStripRealSlope pauseStripSlopeUpper
    push_cast
    simpa only [mul_assoc] using
      (mul_le_mul_of_nonneg_left (mul_le_mul hOddsHigh hSum (by positivity) hU)
        (show (0 : ℝ) ≤ 16 by norm_num))
  · have hBpos : 0 < (pauseStripBracket i : ℝ) := by
      exact_mod_cast (pauseStripCell_admissible i).2.2.2.2
    have hB : (pauseStripBracket i : ℝ) ≤
        (1 / x ^ 2 + 1 / (1 - x) ^ 2) ^ 2 - 2 / x ^ 3 + 2 / (1 - x) ^ 3 := by
      have hSum := add_le_add (hInvLow 2) (hCompLow 2)
      have hSq := pow_le_pow_left₀ (by positivity) hSum 2
      have hInv₃ := hInvHigh 3
      have hComp₃ := hCompLow 3
      unfold pauseStripBracket
      push_cast
      change (1 / b ^ 2 + 1 / (1 - a) ^ 2) ^ 2 - 2 / a ^ 3 + 2 / (1 - a) ^ 3 ≤ _
      simp only [div_eq_mul_inv, one_mul] at hSq hInv₃ hComp₃ ⊢
      linarith only [hSq, hInv₃, hComp₃]
    unfold pauseStripSecondLower pauseStripRealSecond
    push_cast
    simpa only [mul_assoc] using
      (mul_le_mul_of_nonneg_left (mul_le_mul hOddsLow hB hBpos.le hOddsPos.le)
        (show (0 : ℝ) ≤ 256 by norm_num))

/-- The rational contrast floors give a strict lower bound at every real
point of the strip. -/
theorem pauseStripContrastFloor_gt_133 {x : ℝ} (hx : x ∈ Icc (3 / 20) (1 / 5)) :
    133 < pauseStripContrastFloor x := by
  obtain ⟨i, hi⟩ := pauseStripCell_cover hx
  obtain ⟨h₀, h₁, h₂⟩ := pauseStripPolynomial_cell_enclosure i hi
  have hSq := pow_le_pow_left₀ h₀ h₁ 2
  have hFloor : (133 : ℝ) < (pauseStripCellFloor i : ℝ) := by
    exact_mod_cast pauseStripCellFloor_gt_133 i
  refine hFloor.trans_le ?_
  unfold pauseStripCellFloor pauseStripContrastFloor
  push_cast
  linarith only [h₁, h₂, hSq]


private theorem pauseStripRealOdds_hasDerivAt {x : ℝ} (hx₀ : 0 < x) (hx₁ : x < 1) :
    HasDerivAt pauseStripRealOdds
      (pauseStripRealOdds x * (1 / x ^ 2 + 1 / (1 - x) ^ 2)) x := by
  have hc : HasDerivAt (fun t : ℝ => 1 - t) (-1) x := (hasDerivAt_id x).const_sub 1
  have ht := hasDerivAt_inv hx₀.ne'
  have hu := (hasDerivAt_inv (sub_pos.mpr hx₁).ne').comp x hc
  have hd := (ht.sub hu).neg.exp
  convert hd using 1
  · funext z
    simp [pauseStripRealOdds, pauseStripRealArgument, one_div, Function.comp_def]
  · simp [pauseStripRealOdds, pauseStripRealArgument, one_div, Function.comp_def]
    ring

private theorem pauseStripReciprocalSum_hasDerivAt {x : ℝ} (hx₀ : 0 < x) (hx₁ : x < 1) :
    HasDerivAt (fun t : ℝ => 1 / t ^ 2 + 1 / (1 - t) ^ 2)
      (-(2 / x ^ 3) + 2 / (1 - x) ^ 3) x := by
  have hc : HasDerivAt (fun t : ℝ => 1 - t) (-1) x := (hasDerivAt_id x).const_sub 1
  have hPow : HasDerivAt (fun t : ℝ => t ^ 2) (2 * x) x := by
    have h := (hasDerivAt_id x).pow 2
    change HasDerivAt (fun t : ℝ => t ^ 2) (2 * x ^ 1 * 1) x at h
    simpa only [pow_one, mul_one] using h
  have hCompPow : HasDerivAt (fun t : ℝ => (1 - t) ^ 2) (-(2 * (1 - x))) x := by
    have h := hc.pow 2
    change HasDerivAt (fun t : ℝ => (1 - t) ^ 2) (2 * (1 - x) ^ 1 * (-1)) x at h
    simpa only [pow_one, mul_neg, mul_one] using h
  have hq := hPow.inv (pow_ne_zero 2 hx₀.ne')
  have hq' := hCompPow.inv (pow_ne_zero 2 (sub_pos.mpr hx₁).ne')
  convert hq.add hq' using 1
  · funext t
    simp [one_div]
  · field_simp [hx₀.ne', (sub_pos.mpr hx₁).ne']

/-- The odds as a function of the physical radial coordinate. -/
def pauseStripPhysicalOdds (s : ℝ) : ℝ := pauseStripRealOdds (16 * s - 1)

private theorem pauseStripPhysicalArgument_hasDerivAt (s : ℝ) :
    HasDerivAt (fun t : ℝ => 16 * t - 1) 16 s := by
  simpa using (((hasDerivAt_id s).const_mul 16).sub_const 1)

/-- The first derivative in the physical variable is the exact polynomial
that enters the cell comparison. -/
theorem pauseStripPhysicalOdds_hasDerivAt {s : ℝ} (h₀ : 0 < 16 * s - 1) (h₁ : 16 * s - 1 < 1) :
    HasDerivAt pauseStripPhysicalOdds (pauseStripRealSlope (16 * s - 1)) s := by
  convert (pauseStripRealOdds_hasDerivAt h₀ h₁).comp s
    (pauseStripPhysicalArgument_hasDerivAt s) using 1
  · rfl
  · unfold pauseStripRealSlope
    ring

/-- Differentiating the first physical derivative gives the exact second
polynomial, including the factor (16^2=256). -/
theorem pauseStripPhysicalSlope_hasDerivAt {s : ℝ} (h₀ : 0 < 16 * s - 1) (h₁ : 16 * s - 1 < 1) :
    HasDerivAt (fun t : ℝ => pauseStripRealSlope (16 * t - 1))
      (pauseStripRealSecond (16 * s - 1)) s := by
  have ht := ((pauseStripRealOdds_hasDerivAt h₀ h₁).mul
    (pauseStripReciprocalSum_hasDerivAt h₀ h₁)).const_mul (16 : ℝ)
  convert ht.comp s (pauseStripPhysicalArgument_hasDerivAt s) using 1
  · funext t
    simp [pauseStripRealSlope, mul_assoc]
  · unfold pauseStripRealSecond
    ring


/-- Identify both iterated derivatives of the same odds function on the
whole open switch interval. This includes the endpoints of the certified
strip, which lie strictly inside that switch interval. -/
theorem pauseStripPhysicalOdds_derivs {s : ℝ}
    (h₀ : 0 < 16 * s - 1) (h₁ : 16 * s - 1 < 1) :
    deriv pauseStripPhysicalOdds s = pauseStripRealSlope (16 * s - 1) ∧
      deriv (deriv pauseStripPhysicalOdds) s = pauseStripRealSecond (16 * s - 1) := by
  have hCont : Continuous (fun t : ℝ => 16 * t - 1) :=
    (continuous_const.mul continuous_id).sub continuous_const
  have hs : (fun t : ℝ => 16 * t - 1) ⁻¹' Ioo 0 1 ∈ 𝓝 s :=
    (isOpen_Ioo.preimage hCont).mem_nhds (show 16 * s - 1 ∈ Ioo 0 1 from ⟨h₀, h₁⟩)
  have he : deriv pauseStripPhysicalOdds =ᶠ[𝓝 s] fun t => pauseStripRealSlope (16 * t - 1) := by
    filter_upwards [hs] with t ht
    exact (pauseStripPhysicalOdds_hasDerivAt ht.1 ht.2).deriv
  exact ⟨(pauseStripPhysicalOdds_hasDerivAt h₀ h₁).deriv,
    he.deriv_eq.trans (pauseStripPhysicalSlope_hasDerivAt h₀ h₁).deriv⟩

end

end SmoothPoincare.IntrinsicEntry
