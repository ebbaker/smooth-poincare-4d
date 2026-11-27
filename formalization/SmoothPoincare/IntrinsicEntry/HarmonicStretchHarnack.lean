import DifferentialGeometry.Analysis.Elliptic.Euclidean.MaximumPrinciple
import Mathlib.Analysis.Complex.Harmonic.Poisson
import Mathlib.Analysis.SpecialFunctions.Log.Basic

/-! # A local disk step for the logarithmic harmonic stretch -/

open DifferentialGeometry.Analysis Filter InnerProductSpace Metric Set
open scoped Topology

namespace SmoothPoincare.IntrinsicEntry

/-- The planar Poisson kernel is at most three on the half-radius disk. -/
theorem harmonicStretch_poissonKernel_le_three {c w z : ℂ} {R : ℝ}
    (hR : 0 < R) (hw : ‖w - c‖ ≤ R / 2) (hz : z ∈ sphere c R) :
    poissonKernel c w z ≤ 3 := by
  have hzR : ‖z - c‖ = R := mem_sphere_iff_norm.mp hz
  let r := ‖w - c‖
  have hr : 0 ≤ r := norm_nonneg _
  have hdiff : 0 < R - r := by linarith [show r ≤ R / 2 from hw]
  have htri : R - r ≤ ‖(z - c) - (w - c)‖ := by
    have h := norm_sub_norm_le (z - c) (w - c)
    simpa only [hzR, r] using h
  have hd : 0 < ‖(z - c) - (w - c)‖ := hdiff.trans_le htri
  have hsq := (sq_le_sq₀ hdiff.le hd.le).mpr htri
  have hmul := mul_nonneg hdiff.le (show 0 ≤ R - 2 * r by linarith [show r ≤ R / 2 from hw])
  rw [poissonKernel_def, hzR, div_le_iff₀ (sq_pos_of_pos hd)]
  change R ^ 2 - r ^ 2 ≤ 3 * ‖(z - c) - (w - c)‖ ^ 2
  nlinarith only [hmul, hsq]

/-- The harmonic boundary extension satisfies the factor-three estimate
with no unspecified kernel or averaging constants. -/
theorem harmonicStretch_harmonicHalfDisk_le {c w : ℂ} {R : ℝ} {h : ℂ → ℝ}
    (hR : 0 < R) (hw : ‖w - c‖ ≤ R / 2) (hh : HarmonicContOnCl h (ball c R))
    (hpos : ∀ z ∈ sphere c R, 0 ≤ h z) : h w ≤ 3 * h c := by
  have hw' : w ∈ ball c R := mem_ball_iff_norm.mpr (hw.trans_lt (by linarith))
  have hc : c ∈ ball c R := mem_ball_self hR
  have hcenter : Real.circleAverage h c R = h c := by
    rw [← hh.circleAverage_poissonKernel_smul hc]
    apply Real.circleAverage_congr_sphere
    intro z hz
    have hzR : ‖z - c‖ = R := mem_sphere_iff_norm.mp (by simpa [abs_of_pos hR] using hz)
    have hkernel : poissonKernel c c z = 1 := by
      rw [poissonKernel_def]
      simp [hzR, hR.ne']
    change h z = poissonKernel c c z • h z
    rw [hkernel, one_smul]
  have hcont : ContinuousOn h (sphere c R) := by
    apply hh.continuousOn.mono
    rw [closure_ball c hR.ne']
    exact sphere_subset_closedBall
  have hkcont : ContinuousOn (poissonKernel c w) (sphere c R) := by
    simp only [show poissonKernel c w = (fun z =>
      (‖z - c‖ ^ 2 - ‖w - c‖ ^ 2) / ‖(z - c) - (w - c)‖ ^ 2) by
      funext z; exact poissonKernel_def c w z]
    apply ContinuousOn.div (by fun_prop) (by fun_prop)
    intro z hz
    have hnorm := norm_sub_norm_le (z - c) (w - c)
    rw [mem_sphere_iff_norm.mp hz] at hnorm
    exact (sq_pos_of_pos (lt_of_lt_of_le (by linarith : 0 < R - ‖w - c‖) hnorm)).ne'
  rw [← hh.circleAverage_poissonKernel_smul hw', ← hcenter, ← smul_eq_mul,
    ← Real.circleAverage_smul]
  apply Real.circleAverage_mono ((hkcont.smul hcont).circleIntegrable hR.le)
    ((continuousOn_const.smul hcont : ContinuousOn ((3 : ℝ) • h) (sphere c R)).circleIntegrable hR.le)
  intro z hz
  have hzR : z ∈ sphere c R := by simpa [abs_of_pos hR] using hz
  change poissonKernel c w z * h z ≤ 3 * h z
  exact mul_le_mul_of_nonneg_right (harmonicStretch_poissonKernel_le_three hR hw hzR) (hpos z hzR)

private theorem harmonicStretch_diskBarrier_laplacian (c z : ℂ) (R : ℝ) :
    Laplacian.laplacian (fun y : ℂ => (59 : ℝ) * (R ^ 2 - ‖c - y‖ ^ 2)) z = -236 := by
  let N : ℂ → ℝ := fun y => ‖c - y‖ ^ 2
  let C : ℂ → ℝ := fun _ => R ^ 2
  have hn : ContDiffAt ℝ 2 N z := (contDiffAt_const.sub contDiffAt_id).norm_sq ℝ
  have hC : ContDiffAt ℝ 2 C z := contDiffAt_const
  have hd : ContDiffAt ℝ 2 (C - N) z := hC.sub hn
  have hΔ : Laplacian.laplacian N z = 4 := by
    calc
      _ = Laplacian.laplacian (fun y : ℂ => ‖y‖ ^ 2) (c - z) :=
        laplacian_comp_const_sub (fun y : ℂ => ‖y‖ ^ 2) c z
      _ = _ := by
        rw [InnerProductSpace.laplacian_norm_sq]
        norm_num [Complex.finrank_real_complex]
  change Laplacian.laplacian ((59 : ℝ) • (C - N)) z = -236
  calc
    _ = (59 : ℝ) • Laplacian.laplacian (C - N) z := laplacian_smul (59 : ℝ) hd
    _ = _ := by
      rw [hC.laplacian_sub hn, hΔ]
      norm_num [C]

/-- The two pinned scalar maximum-principle applications supply the lower
and upper barrier for the difference from a harmonic Dirichlet extension. -/
theorem harmonicStretch_diskBarrier {c : ℂ} {R : ℝ} {F h : ℂ → ℝ}
    (hR : 0 < R) (hcont : ContinuousOn F (closedBall c R))
    (hsmooth : ∀ z ∈ ball c R, ContDiffAt ℝ 2 F z)
    (hΔ : ∀ z ∈ ball c R, -236 ≤ Laplacian.laplacian F z ∧ Laplacian.laplacian F z ≤ 0)
    (hh : HarmonicContOnCl h (ball c R)) (hboundary : EqOn F h (sphere c R))
    {x : ℂ} (hx : x ∈ closedBall c R) : 0 ≤ F x - h x ∧ F x - h x ≤ 59 * (R ^ 2 - ‖x - c‖ ^ 2) := by
  let s := ball c R
  let B : ℂ → ℝ := fun z => 59 * (R ^ 2 - ‖c - z‖ ^ 2)
  have hclose : closure s = closedBall c R := closure_ball c hR.ne'
  have hcompact : IsCompact (closure s) := by rw [hclose]; exact isCompact_closedBall _ _
  have hFc : ContinuousOn F (closure s) := hclose ▸ hcont
  have hBc : Continuous B := by dsimp [B]; fun_prop
  have hBd (z : ℂ) : ContDiffAt ℝ 2 B z := by
    dsimp [B]
    exact contDiffAt_const.mul (contDiffAt_const.sub ((contDiffAt_const.sub contDiffAt_id).norm_sq ℝ))
  have hBbd : ∀ z ∈ frontier s, B z = 0 := by
    intro z hz
    have hzs : z ∈ sphere c R := by simpa only [s, frontier_ball c hR.ne'] using hz
    have hn : ‖c - z‖ = R := (norm_sub_rev c z).trans (mem_sphere_iff_norm.mp hzs)
    simp [B, hn]
  have hhΔ (z : ℂ) (hz : z ∈ s) : Laplacian.laplacian h z = 0 :=
    (hh.harmonicOnNhd z hz).2.self_of_nhds
  have hbd (z : ℂ) (hz : z ∈ frontier s) : F z = h z :=
    hboundary (by simpa only [s, frontier_ball c hR.ne'] using hz)
  have hinner : interior s = s := isOpen_ball.interior_eq
  have hsi {z : ℂ} (hz : z ∈ interior s) : z ∈ ball c R := by
    rwa [hinner] at hz
  have hxc : x ∈ closure s := hclose ▸ hx
  have hlo := le_of_laplacian_nonneg_of_le_frontier (f := h - F) (C := 0) hcompact
    (hh.continuousOn.sub hFc).upperSemicontinuousOn
    (fun z hz => (hh.contDiffAt (hsi hz)).sub (hsmooth z (hsi hz))) ?_ ?_ x hxc
  · change h x - F x ≤ 0 at hlo
    refine ⟨by linarith only [hlo], ?_⟩
    have hup := le_of_laplacian_nonneg_of_le_frontier (f := F - h - B) (C := 0) hcompact
      ((hFc.sub hh.continuousOn).sub hBc.continuousOn).upperSemicontinuousOn
      (fun z hz => ((hsmooth z (hsi hz)).sub (hh.contDiffAt (hsi hz))).sub (hBd z)) ?_ ?_ x hxc
    · change F x - h x - B x ≤ 0 at hup
      simpa only [B, norm_sub_rev c x] using sub_nonpos.mp hup
    · intro z hz
      have hzs := hsi hz
      have hdiff : ContDiffAt ℝ 2 (F - h) z := (hsmooth z hzs).sub (hh.contDiffAt hzs)
      rw [hdiff.laplacian_sub (hBd z),
        (hsmooth z hzs).laplacian_sub (hh.contDiffAt hzs), hhΔ z hzs]
      have hBlap : Laplacian.laplacian B z = -236 := harmonicStretch_diskBarrier_laplacian c z R
      rw [hBlap]
      linarith [(hΔ z hzs).1]
    · intro z hz
      change F z - h z - B z ≤ 0
      rw [hbd z hz, hBbd z hz, sub_self, sub_zero]
  · intro z hz
    have hzs := hsi hz
    change 0 ≤ Laplacian.laplacian (h - F) z
    rw [(hh.contDiffAt hzs).laplacian_sub (hsmooth z hzs), hhΔ z hzs]
    exact sub_nonneg.mpr (hΔ z hzs).2
  · intro z hz
    change h z - F z ≤ 0
    rw [hbd z hz, sub_self]

/-- Radius-`1/8` half-disk propagation for `F = log(59 / H)`, with the
boundary harmonic extension supplied and the pinned Poisson formula used. -/
theorem harmonicStretch_harnackStep {c x : ℂ} {F h : ℂ → ℝ}
    (hx : ‖x - c‖ ≤ 1 / 16) (hcont : ContinuousOn F (closedBall c (1 / 8)))
    (hsmooth : ∀ z ∈ ball c (1 / 8), ContDiffAt ℝ 2 F z)
    (hΔ : ∀ z ∈ ball c (1 / 8), -236 ≤ Laplacian.laplacian F z ∧ Laplacian.laplacian F z ≤ 0)
    (hh : HarmonicContOnCl h (ball c (1 / 8))) (hboundary : EqOn F h (sphere c (1 / 8)))
    (hpos : ∀ z ∈ sphere c (1 / 8), 0 ≤ F z) : F x ≤ 3 * F c + 1 := by
  have hR : 0 < (1 / 8 : ℝ) := by norm_num
  have hc := harmonicStretch_diskBarrier hR hcont hsmooth hΔ hh hboundary (mem_closedBall_self hR.le)
  have hxc : x ∈ closedBall c (1 / 8) := mem_closedBall_iff_norm.mpr (hx.trans (by norm_num))
  have hb := harmonicStretch_diskBarrier hR hcont hsmooth hΔ hh hboundary hxc
  have hhalf : ‖x - c‖ ≤ (1 / 8 : ℝ) / 2 := by norm_num at *; exact hx
  have hhx := harmonicStretch_harmonicHalfDisk_le hR hhalf hh fun z hz => (hboundary hz) ▸ hpos z hz
  nlinarith only [hc.1, hb.2, hhx, sq_nonneg ‖x - c‖]

/-- The logarithmic stretch is nonnegative for a positive stretch bounded by 59. -/
theorem harmonicStretch_log_nonneg {H : ℝ} (hH : 0 < H) (hmax : H ≤ 59) :
    0 ≤ Real.log (59 / H) := by
  apply Real.log_nonneg
  simpa only [one_mul] using (le_div_iff₀ hH).mpr (by simpa only [one_mul] using hmax)

/-- Turn a bound on the logarithmic stretch into a lower floor for the stretch. -/
theorem harmonicStretch_lower_of_log_bound {H A : ℝ} (hH : 0 < H)
    (hbound : Real.log (59 / H) ≤ A) : 59 * Real.exp (-A) ≤ H := by
  have h := Real.exp_le_exp.mpr hbound
  rw [Real.exp_log (div_pos (by norm_num) hH)] at h
  rw [Real.exp_neg, ← div_eq_mul_inv, div_le_iff₀ (Real.exp_pos A), mul_comm]
  exact (div_le_iff₀ hH).mp h

/-- The closed form of the exact affine recurrence for a chain of disks. -/
theorem harmonicStretch_chain_bound (F : ℕ → ℝ) (hstep : ∀ n, F (n + 1) ≤ 3 * F n + 1)
    (n : ℕ) : F n ≤ (3 : ℝ) ^ n * F 0 + ((3 : ℝ) ^ n - 1) / 2 := by
  induction n with
  | zero => simp
  | succ n ihn =>
    rw [pow_succ]
    linarith only [hstep n, ihn]

end SmoothPoincare.IntrinsicEntry
