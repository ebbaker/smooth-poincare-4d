import SmoothPoincare.Variational.FiniteWidthMismatch
import Mathlib.MeasureTheory.Function.LpSeminorm.LpNorm
import Mathlib.MeasureTheory.Integral.Prod
import Mathlib.MeasureTheory.Integral.IntervalIntegral.Basic

/-! # Exact native-width price of a separated normal mismatch -/

noncomputable section

open MeasureTheory Set
open scoped ENNReal Interval

namespace SmoothPoincare

variable {Y V : Type*} [MeasurableSpace Y] [NormedAddCommGroup V] [NormedSpace ℝ V]

/-- A density-weighted leading curvature field with inward distance t and an
angular shape difference d on the actual marked section. -/
def connectorLeadingField (d : Y → V) (profile : ℝ → ℝ) (w : ℝ) (p : Y × ℝ) : V :=
  (-profile (p.2/w) / (2*w)) • d p.1

/-- Area and arclength use the full section times the genuine interval [0,w].
The normalization 1/(4w) is the squared chiral half-compression price. -/
theorem connectorLeadingField_energy (μ : Measure Y) [SFinite μ] (d : Y → V)
    (profile : ℝ → ℝ) {w : ℝ} (hw : 0 < w) :
    (∫ p in univ ×ˢ Icc 0 w, ‖connectorLeadingField d profile w p‖^2 ∂μ.prod volume) =
      (∫ x, ‖d x‖^2 ∂μ) * (∫ t in Icc (0:ℝ) 1, (profile t)^2) / (4*w) := by
  have hScale : (∫ t in Icc 0 w, profile (t/w)^2) =
      w * ∫ t in Icc (0:ℝ) 1, profile t^2 := by
    rw [integral_Icc_eq_integral_Ioc, ← intervalIntegral.integral_of_le hw.le]
    have h := intervalIntegral.integral_comp_div (fun t => profile t ^ 2) hw.ne' (a := 0) (b := w)
    simp only [zero_div, div_self hw.ne', smul_eq_mul] at h
    rw [h, intervalIntegral.integral_of_le zero_le_one, integral_Icc_eq_integral_Ioc]
  have hf (p : Y × ℝ) :
      ‖connectorLeadingField d profile w p‖^2 =
        ‖d p.1‖^2 * ((2*w)^2)⁻¹ * (profile (p.2/w))^2 := by
    simp only [connectorLeadingField, norm_smul, Real.norm_eq_abs, mul_pow, sq_abs]
    ring
  simp_rw [hf]
  rw [← Measure.prod_restrict, Measure.restrict_univ,
    integral_prod_mul (fun x : Y => ‖d x‖^2 * ((2*w)^2)⁻¹) (fun t : ℝ => profile (t/w)^2),
    integral_mul_const, hScale]
  field_simp
  ring

omit [NormedSpace ℝ V] in
private theorem connector_lpNorm_two (μ : Measure Y) (f : Y → V)
    (hf : AEStronglyMeasurable f μ) :
    lpNorm f 2 μ = Real.sqrt (∫ x, ‖f x‖^2 ∂μ) := by
  rw [lpNorm_eq_integral_norm_rpow_toReal (by norm_num) (by simp) hf, Real.sqrt_eq_rpow]
  norm_num

omit [NormedSpace ℝ V] in
/-- Triangle and reverse triangle on the same measured connector. The cap
energy is the integral of the square of the density-weighted physical field.
A uniform L² remainder bound controls both endpoints of the price interval. -/
theorem measuredConnector_energy_interval (μ : Measure Y) (leading remainder : Y → V)
    (hL : MemLp leading 2 μ) (hR : MemLp remainder 2 μ) {b : ℝ}
    (hB : lpNorm remainder 2 μ ≤ b) :
    let ℓ := Real.sqrt (∫ x, ‖leading x‖^2 ∂μ)
    let c := ∫ x, ‖(leading + remainder) x‖^2 ∂μ
    (max 0 (ℓ-b))^2 ≤ c ∧ c ≤ (ℓ+b)^2 := by
  intro ℓ c
  have h := lpNorm_add_le hL (g := remainder) (by norm_num)
  have hrev := lpNorm_add_le (hL.add hR) (g := -remainder) (by norm_num)
  simp only [add_neg_cancel_right, lpNorm_neg] at hrev
  have hLead : lpNorm leading 2 μ = ℓ := connector_lpNorm_two μ leading hL.aestronglyMeasurable
  have hTotal : lpNorm (leading + remainder) 2 μ = Real.sqrt c :=
    connector_lpNorm_two _ _ (hL.add hR).aestronglyMeasurable
  rw [hLead, hTotal] at h hrev
  have hlow : max 0 (ℓ-b) ≤ Real.sqrt c := max_le (Real.sqrt_nonneg _) (by linarith)
  have hup : Real.sqrt c ≤ ℓ+b := by linarith
  have hc : 0 ≤ c := integral_nonneg fun _ => sq_nonneg _
  have hs := Real.sq_sqrt hc
  exact ⟨(sq_le_sq' (by linarith [le_max_left 0 (ℓ-b), Real.sqrt_nonneg c]) hlow).trans_eq hs,
    hs.symm.le.trans (sq_le_sq' (by linarith [Real.sqrt_nonneg c]) hup)⟩

/-- A pointwise guard for the density-weighted remainder gives an actual
two-sided estimate on the whole strip. d and profile use the cap marking,
section area and native normal coordinate of this same connector. -/
theorem guardedConnector_price (μ : Measure Y) [IsFiniteMeasure μ]
    (d : Y → V) (profile : ℝ → ℝ) (remainder : Y × ℝ → V) {w B : ℝ} (hw : 0 < w) (hB : 0 ≤ B)
    (hL : MemLp (connectorLeadingField d profile w) 2 ((μ.prod volume).restrict (univ ×ˢ Icc 0 w)))
    (hR : MemLp remainder 2 ((μ.prod volume).restrict (univ ×ˢ Icc 0 w)))
    (hBound : ∀ z ∈ univ ×ˢ Icc 0 w, ‖remainder z‖ ≤ B) :
    let ℓ := Real.sqrt ((∫ x, ‖d x‖^2 ∂μ) * (∫ t in Icc (0:ℝ) 1, profile t^2) / (4*w))
    let err := Real.sqrt (μ.real univ * w) * B
    let c := ∫ z in univ ×ˢ Icc 0 w, ‖(connectorLeadingField d profile w + remainder) z‖^2 ∂μ.prod volume
    (max 0 (ℓ-err))^2 ≤ c ∧ c ≤ (ℓ+err)^2 := by
  let U : Set (Y × ℝ) := univ ×ˢ Icc 0 w
  let ν := (μ.prod volume).restrict U
  have hU : MeasurableSet U := MeasurableSet.univ.prod measurableSet_Icc
  have hVol : (μ.prod volume).real U = μ.real univ * w := by
    dsimp only [U]
    rw [measureReal_prod_prod, Real.volume_real_Icc_of_le hw.le, sub_zero]
  have hFin : (μ.prod volume) U ≠ ⊤ := by
    dsimp only [U]
    rw [Measure.prod_prod]
    exact ENNReal.mul_ne_top (measure_ne_top μ _) isCompact_Icc.measure_lt_top.ne
  let : IsFiniteMeasure ν := ⟨by simpa [ν, Measure.restrict_apply_univ] using hFin.lt_top⟩
  have hk : ∫ z, ‖remainder z‖^2 ∂ν ≤ (μ.real univ*w)*B^2 := by
    calc
      _ ≤ ∫ _z, B^2 ∂ν := by
        apply integral_mono_ae (hR.integrable_norm_pow (by norm_num)) (integrable_const _)
        exact (ae_restrict_mem hU).mono (fun z hz => (sq_le_sq₀ (norm_nonneg _) hB).mpr (hBound z hz))
      _ = _ := by simp [ν, hVol]
  have he : lpNorm remainder 2 ν ≤ Real.sqrt (μ.real univ * w)*B := by
    rw [connector_lpNorm_two _ _ hR.aestronglyMeasurable]
    exact (Real.sqrt_le_sqrt hk).trans_eq (by rw [Real.sqrt_mul (by positivity), Real.sqrt_sq hB])
  have hp := measuredConnector_energy_interval ν (connectorLeadingField d profile w) remainder hL hR he
  dsimp only at hp ⊢
  simpa only [ν, U, connectorLeadingField_energy μ d profile hw] using hp

end SmoothPoincare
