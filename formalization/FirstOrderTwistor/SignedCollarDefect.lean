import FirstOrderTwistor.MeasureAccounting
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Deriv
import Mathlib.MeasureTheory.Integral.Bochner.Basic
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Positivity

/-! # Two oriented faces and the exact deficit on a measured cut

Face quantities use the increasing normal on a collar. The product APS identity,
relative Pontryagin evaluation and chiral Chern--Weil formula are geometric inputs.
Both energies use the Hilbert--Schmidt norm on two-form operators. -/

open MeasureTheory Set Filter
open scoped Topology

namespace FirstOrderTwistor

/-- Eta in the even-form signature convention and the integrated extrinsic term. -/
structure SignatureFace where
  eta : ℝ
  transgression : ℝ

noncomputable def SignatureFace.defect (f : SignatureFace) : ℝ :=
  12 * Real.pi ^ 2 * f.eta + f.transgression

/-- The physical P₁ integral and the product comparison have the same tangential
metric and unit normal. The signed relative term is taken outward first. -/
theorem signedPiece_defect_of_productAPS (f : SignatureFace)
    {plus minus signature physicalPontryagin productPontryagin : ℝ}
    (aps : signature = productPontryagin / 3 - f.eta)
    (relative : 4 * Real.pi ^ 2 * (physicalPontryagin - productPontryagin) =
      f.transgression)
    (chiral : plus - minus = 4 * Real.pi ^ 2 * physicalPontryagin) :
    plus - minus = 12 * Real.pi ^ 2 * signature + f.defect := by
  rw [aps, SignatureFace.defect, ← relative, chiral]
  ring

/-- On a zero-signature cylinder the two increasing-normal faces occur in
opposite orders in each of the APS and transgression terms. -/
theorem signedCollar_defect_of_signature (incoming outgoing : SignatureFace)
    {plus minus physicalPontryagin productPontryagin : ℝ}
    (aps : 0 = productPontryagin / 3 - (outgoing.eta - incoming.eta))
    (relative : 4 * Real.pi ^ 2 * (physicalPontryagin - productPontryagin) =
      outgoing.transgression - incoming.transgression)
    (chiral : plus - minus = 4 * Real.pi ^ 2 * physicalPontryagin) :
    plus - minus = outgoing.defect - incoming.defect := by
  have h := signedPiece_defect_of_productAPS
    ⟨outgoing.eta - incoming.eta, outgoing.transgression - incoming.transgression⟩
    aps relative chiral
  simp only [SignatureFace.defect] at h ⊢
  linarith

theorem signedCollar_reverse {u v : SignatureFace} {p m : ℝ}
    (h : p - m = v.defect - u.defect) :
    m - p = u.defect - v.defect := by linarith

theorem signedCollar_coincident {u v : SignatureFace} {p m : ℝ}
    (h : p - m = v.defect - u.defect) (hsame : u.defect = v.defect) : p = m := by
  linarith

theorem signedCollar_twoFace_bound {u v : SignatureFace} {p m ref b₀ b₁ : ℝ}
    (h : p - m = v.defect - u.defect)
    (h₀ : |u.defect - ref| ≤ b₀) (h₁ : |v.defect - ref| ≤ b₁) :
    |p - m| ≤ b₀ + b₁ ∧ p ≤ m + (b₀ + b₁) ∧ m ≤ p + (b₀ + b₁) := by
  obtain ⟨_, _⟩ := abs_le.mp h₀
  obtain ⟨_, _⟩ := abs_le.mp h₁
  exact ⟨abs_le.mpr ⟨by linarith, by linarith⟩, by linarith, by linarith⟩

/-- Hölder applied to the norm of the trace-free second fundamental form and the
norm of its symmetric covariant curl. The pointwise contraction bound is in
the same orthonormal frame; the integration uses the actual boundary measure. -/
theorem signatureFace_transgression_le_holder {Y : Type*} [MeasurableSpace Y]
    (μ : Measure Y) (pair shear symCurl : Y → ℝ)
    (hs : 0 ≤ᵐ[μ] shear) (hc : 0 ≤ᵐ[μ] symCurl)
    (h₃ : MemLp shear (ENNReal.ofReal 3) μ)
    (h₁₅ : MemLp symCurl (ENNReal.ofReal (3 / 2)) μ)
    (hpair : ∀ᵐ y ∂μ, |pair y| ≤ shear y * symCurl y) :
    |∫ y, pair y ∂μ| ≤ (∫ y, shear y ^ (3 : ℝ) ∂μ) ^ (1 / 3 : ℝ) *
      (∫ y, symCurl y ^ (3 / 2 : ℝ) ∂μ) ^ (1 / (3 / 2) : ℝ) := by
  have hpq : Real.HolderConjugate 3 (3 / 2) := Real.holderConjugate_iff.mpr
    ⟨by norm_num, by norm_num⟩
  have : ENNReal.HolderTriple (ENNReal.ofReal 3) (ENNReal.ofReal (3 / 2)) 1 := by
    constructor
    rw [← ENNReal.ofReal_inv_of_pos (by norm_num), ← ENNReal.ofReal_inv_of_pos (by norm_num),
      ← ENNReal.ofReal_add (by norm_num) (by norm_num)]
    norm_num
  have hInt := h₃.integrable_mul h₁₅
  calc
    _ ≤ ∫ y, shear y * symCurl y ∂μ := by
      simpa [Real.norm_eq_abs] using norm_integral_le_of_norm_le (f := pair) hInt (by
        simpa [Real.norm_eq_abs] using hpair)
    _ ≤ _ := integral_mul_le_Lp_mul_Lq_of_nonneg hpq hs hc h₃ h₁₅

/-- Both chiral measures are on the same carrier and `Vᶜ` is the same discarded
region for both. A hypersurface of zero chiral mass may be assigned to either side. -/
theorem signedCut_exactDeficit {X : Type*} [MeasurableSpace X]
    (plus minus : Measure X) [IsFiniteMeasure plus] [IsFiniteMeasure minus]
    {V : Set X} (hV : MeasurableSet V) (f : SignatureFace)
    (hTotal : plus.real univ = minus.real univ)
    (hLedger : plus.real V - minus.real V = f.defect) :
    (0 ≤ f.defect → plus.real univ - |f.defect| = minus.real V + plus.real Vᶜ) ∧
    (f.defect ≤ 0 → plus.real univ - |f.defect| = plus.real V + minus.real Vᶜ) ∧
    |f.defect| ≤ plus.real univ := by
  have hp := measureReal_add_measureReal_compl (μ := plus) hV
  have hm := measureReal_add_measureReal_compl (μ := minus) hV
  constructor
  · intro h
    rw [abs_of_nonneg h]
    linarith
  constructor
  · intro h
    rw [abs_of_nonpos h]
    linarith
  · apply abs_le.mpr
    constructor <;> linarith [measureReal_nonneg (μ := plus) (s := V),
      measureReal_nonneg (μ := minus) (s := V), measureReal_nonneg (μ := plus) (s := Vᶜ),
      measureReal_nonneg (μ := minus) (s := Vᶜ)]

/-- Equality in the triangle bound kills precisely the opposite raw chiral
masses identified by the sign of the outward defect. -/
theorem signedCut_equality {X : Type*} [MeasurableSpace X]
    (plus minus : Measure X) [IsFiniteMeasure plus] [IsFiniteMeasure minus]
    {V : Set X} (hV : MeasurableSet V) (f : SignatureFace)
    (hTotal : plus.real univ = minus.real univ)
    (hLedger : plus.real V - minus.real V = f.defect)
    (he : plus.real univ = |f.defect|) :
    (0 ≤ f.defect → minus.real V = 0 ∧ plus.real Vᶜ = 0) ∧
    (f.defect ≤ 0 → plus.real V = 0 ∧ minus.real Vᶜ = 0) := by
  obtain ⟨hpos, hneg, _⟩ := signedCut_exactDeficit plus minus hV f hTotal hLedger
  constructor <;> intro h
  · have hzero := hpos h
    constructor <;> linarith [measureReal_nonneg (μ := minus) (s := V),
      measureReal_nonneg (μ := plus) (s := Vᶜ)]
  · have hzero := hneg h
    constructor <;> linarith [measureReal_nonneg (μ := plus) (s := V),
      measureReal_nonneg (μ := minus) (s := Vᶜ)]

/-- Analytic calibration with the measured complex-oriented Fubini--Study face
data (holomorphic sectional curvature four). -/
noncomputable def fubiniStudySignatureFace (r : ℝ) : SignatureFace :=
  ⟨2 / 3 * Real.sin r ^ 4, 4 * Real.pi ^ 2 * Real.sin r ^ 4⟩

theorem fubiniStudySignatureFace_defect (r : ℝ) :
    (fubiniStudySignatureFace r).defect = 12 * Real.pi ^ 2 * Real.sin r ^ 4 := by
  unfold fubiniStudySignatureFace SignatureFace.defect
  ring

/-- Reversed shells with an asymptotically round inner face and a fixed outer
face. Even the limiting signed imbalance is nonzero. -/
theorem reversedFubiniStudy_shell_limit :
    Tendsto (fun r => (fubiniStudySignatureFace r).defect -
      (fubiniStudySignatureFace (Real.pi / 4)).defect) (𝓝 0) (𝓝 (-(3 * Real.pi ^ 2))) := by
  simp only [fubiniStudySignatureFace_defect, Real.sin_pi_div_four]
  have h : (Real.sqrt 2 / 2) ^ 4 = (1 / 4 : ℝ) := by
    rw [show (Real.sqrt 2 / 2) ^ 4 = ((Real.sqrt 2) ^ 2) ^ 2 / 16 by ring, Real.sq_sqrt (by norm_num)]
    norm_num
  rw [h]
  convert ((continuous_const.mul (Real.continuous_sin.pow 4)).sub continuous_const).tendsto (0 : ℝ) using 1
  simp
  ring

end FirstOrderTwistor
