import SmoothPoincare.Variational.CurvedCapPrice
import Mathlib.Analysis.SpecialFunctions.Pow.Real

/-! # Shape mismatch forced by a complete positive cap on a fixed physical disk -/

noncomputable section
open DifferentialGeometry FirstOrderTwistor Set
open scoped ContDiff Manifold

namespace SmoothPoincare

/-- Lower bound on the weighted boundary mismatch at width w. The two
constants in the connector norm estimate are its leading mismatch and
uniform regular curvature remainder. -/
def connectorMismatchFloor (m b w : ℝ) : ℝ := Real.sqrt m * Real.sqrt w - b*w

/-- Square root of the maximizing native width. Zero remainder puts the
maximum at the available outer width. -/
def optimalConnectorRadius (W m b : ℝ) : ℝ :=
  if b = 0 then Real.sqrt W else min (Real.sqrt W) (Real.sqrt m / (2*b))

theorem optimalConnectorWidth_spec {W m b : ℝ} (hW : 0 < W) (hm : 0 < m) (hb : 0 ≤ b) :
    let r := optimalConnectorRadius W m b
    0 < r^2 ∧ r^2 ≤ W ∧ 0 < connectorMismatchFloor m b (r^2) ∧
      ∀ {w : ℝ}, 0 ≤ w → w ≤ W →
        connectorMismatchFloor m b w ≤ connectorMismatchFloor m b (r^2) := by
  intro r
  have hX := Real.sqrt_pos_of_pos hW
  have hY := Real.sqrt_pos_of_pos hm
  have hX2 := Real.sq_sqrt hW.le
  by_cases hz : b = 0
  · subst b
    have hr : r = Real.sqrt W := by simp [r, optimalConnectorRadius]
    rw [hr, hX2]
    refine ⟨hW, le_rfl, by simpa [connectorMismatchFloor] using mul_pos hY hX, ?_⟩
    intro w _ hw
    simpa [connectorMismatchFloor] using mul_le_mul_of_nonneg_left (Real.sqrt_le_sqrt hw) hY.le
  · have hb' : 0 < b := lt_of_le_of_ne hb (Ne.symm hz)
    have hb2 : 0 < 2*b := by positivity
    have hr : r = min (Real.sqrt W) (Real.sqrt m / (2*b)) := by simp [r, optimalConnectorRadius, hz]
    have hr0 : 0 < r := hr ▸ lt_min hX (div_pos hY hb2)
    have hrt : r ≤ Real.sqrt W := hr ▸ min_le_left _ _
    have hrm : 2*b*r ≤ Real.sqrt m := by
      rw [mul_comm (2*b)]
      exact (le_div_iff₀ hb2).mp (hr ▸ min_le_right _ _)
    refine ⟨sq_pos_of_pos hr0, by nlinarith [mul_self_le_mul_self hr0.le hrt], ?_, ?_⟩
    · rw [connectorMismatchFloor, Real.sqrt_sq hr0.le]
      nlinarith [mul_le_mul_of_nonneg_right hrm hr0.le, mul_pos hb' (sq_pos_of_pos hr0)]
    · intro w hw hwW
      let x := Real.sqrt w
      have hx : 0 ≤ x := Real.sqrt_nonneg _
      have hx2 : x^2 = w := Real.sq_sqrt hw
      have hxW : x ≤ Real.sqrt W := Real.sqrt_le_sqrt hwW
      rw [connectorMismatchFloor, connectorMismatchFloor, Real.sqrt_sq hr0.le]
      change Real.sqrt m*x-b*w ≤ _
      rcases le_total (Real.sqrt W) (Real.sqrt m/(2*b)) with hcut | hcut
      · have hxr : x ≤ r := by simpa [hr, min_eq_left hcut] using hxW
        have hSlope : 0 ≤ Real.sqrt m-b*(r+x) := by nlinarith [mul_le_mul_of_nonneg_left hxr hb]
        nlinarith [mul_nonneg (sub_nonneg.mpr hxr) hSlope]
      · have he : 2*b*r = Real.sqrt m := by
          rw [hr, min_eq_right hcut]
          field_simp
        nlinarith [mul_nonneg hb (sq_nonneg (r-x)), congrArg (fun y : ℝ => y*(r-x)) he]

theorem optimalConnectorFloor_of_interior {W m b : ℝ} (hm : 0 ≤ m) (hb : 0 < b)
    (hW : Real.sqrt m/(2*b) ≤ Real.sqrt W) :
    connectorMismatchFloor m b ((optimalConnectorRadius W m b)^2) = m/(4*b) := by
  have h : 0 ≤ Real.sqrt m / (2*b) := by positivity
  simp only [optimalConnectorRadius, hb.ne', ↓reduceIte, min_eq_right hW, connectorMismatchFloor, Real.sqrt_sq h]
  field_simp
  nlinarith [Real.sq_sqrt hm]

section Disk

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "I₄" => 𝓘(ℝ,E₄)
variable {H N : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H} [I.Boundaryless]
  [TopologicalSpace N] [ChartedSpace H N] [IsManifold I ∞ N] [T2Space N] [CompactSpace N] [Nonempty N]
  {o : ManifoldOrientation I N 4}

/-- At one finite index a positive metric on this very type, with a full
exterior and all nonstrip charge j in its ledger, bounds the shape mismatch
from below in the selected sign. No limiting argument occurs. -/
theorem originalDisk_mismatch_at_width (source cap : SignedCollarMetric o)
    (F : PartialDiffeomorph I₄ I E₄ N ∞) (hF : Metric.closedBall (0:E₄) 1 ⊆ F.source)
    (sg : CollarChirality) {A b j w : ℝ} (hA : 0 ≤ A) (hb : 0 ≤ b) (hw : 0 < w)
    (hp : 0 < classYamabeFour o.dimension_eq cap.metric)
    (hCost : cap.energy sg ≤ source.charge sg (interior (selectedChartDisk F))ᶜ + j +
      (A / Real.sqrt w + b * Real.sqrt w)^2) :
    connectorMismatchFloor (source.charge sg (selectedChartDisk F) -
      (source.energy .plus - sInf (geometricPositiveEnergies o)) - j) b w ≤ A := by
  let m := source.charge sg (selectedChartDisk F) -
    (source.energy .plus - sInf (geometricPositiveEnergies o)) - j
  have hI := csInf_le (geometricPositiveEnergies_bddBelow o) (cap.energy_mem_of_positive hp)
  have hCap : sInf (geometricPositiveEnergies o) ≤ cap.energy sg := by
    cases sg with
    | plus => exact hI
    | minus => exact hI.trans_eq cap.signature_zero
  rw [signedCharge_fullMarkedExterior source sg F hF] at hCost
  have hm : m ≤ (A / Real.sqrt w + b*Real.sqrt w)^2 := by dsimp [m]; linarith
  have h0 : 0 ≤ A / Real.sqrt w + b*Real.sqrt w := by positivity
  have h := Real.sqrt_le_sqrt hm
  rw [Real.sqrt_sq h0] at h
  have he := mul_le_mul_of_nonneg_right h (Real.sqrt_nonneg w)
  rw [add_mul, div_mul_cancel₀ _ (Real.sqrt_pos_of_pos hw).ne'] at he
  change Real.sqrt m * Real.sqrt w - b*w ≤ A
  rw [mul_assoc b, ← sq, Real.sq_sqrt hw.le] at he
  linarith only [he]

/-- Optimize only over widths for which actual same-type positive caps and the
specified complete signed estimate are supplied. j may include the protected
core and any additional fixed upper costs, uniformly over the interval. -/
theorem originalDisk_positiveMismatch_of_interval (source : SignedCollarMetric o)
    (F : PartialDiffeomorph I₄ I E₄ N ∞) (hF : Metric.closedBall (0:E₄) 1 ⊆ F.source)
    (sg : CollarChirality) {A b j W : ℝ} (hA : 0 ≤ A) (hb : 0 ≤ b) (hW : 0 < W)
    (hm : 0 < source.charge sg (selectedChartDisk F) -
      (source.energy .plus - sInf (geometricPositiveEnergies o)) - j)
    (caps : ∀ w ∈ Ioc (0:ℝ) W, ∃ cap : SignedCollarMetric o,
      0 < classYamabeFour o.dimension_eq cap.metric ∧
      cap.energy sg ≤ source.charge sg (interior (selectedChartDisk F))ᶜ + j +
        (A/Real.sqrt w + b*Real.sqrt w)^2) :
    let m := source.charge sg (selectedChartDisk F) -
      (source.energy .plus - sInf (geometricPositiveEnergies o)) - j
    let w := (optimalConnectorRadius W m b)^2
    w ∈ Ioc (0:ℝ) W ∧ 0 < connectorMismatchFloor m b w ∧
      connectorMismatchFloor m b w ≤ A ∧
      ∀ v ∈ Icc (0:ℝ) W, connectorMismatchFloor m b v ≤ connectorMismatchFloor m b w := by
  intro m w
  obtain ⟨hw, hwW, hpos, hmax⟩ := optimalConnectorWidth_spec hW hm hb
  obtain ⟨cap,hp,hc⟩ := caps w ⟨hw,hwW⟩
  exact ⟨⟨hw,hwW⟩,hpos, originalDisk_mismatch_at_width source cap F hF sg hA hb hw hp hc,
    fun _ hv => hmax hv.1 hv.2⟩

end Disk
end SmoothPoincare
