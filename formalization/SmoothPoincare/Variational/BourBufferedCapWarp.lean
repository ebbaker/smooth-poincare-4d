import SmoothPoincare.Variational.BourBufferedTruncation

/-! # A smooth arclength profile on the measured buffered cap

Prepared for Edward B. Baker III, 27 November 2026. The inverse native radius
is needed only between the Euclidean entrance and the round terminal germ.
-/

noncomputable section

open Filter MeasureTheory Set
open scoped ContDiff Topology

namespace SmoothPoincare

/-- Angular radius extended to the whole real arclength line by the
Euclidean and round endpoint germs of the physical metric. -/
def bourBufferedCapWarp (r b s : ℝ) : ℝ :=
  if s ≤ 0 then r + s
  else if s < bourBufferedRadialLength r b (2 * b) then
    let ρ := Function.invFun (bourBufferedRadialLength r b) s
    ρ * bourBufferedRadialSpeed r b ρ
  else Real.sin (bourBufferedCapLength r b - s)

theorem bourBufferedCapWarp_at_native {r b ρ : ℝ} (hr : 0 < r) (hbuf : r < b)
    (hρ : r < ρ) :
    bourBufferedCapWarp r b (bourBufferedRadialLength r b ρ) =
      ρ * bourBufferedRadialSpeed r b ρ := by
  have hm := bourBufferedRadialLength_strictMono hr b
  have hz : bourBufferedRadialLength r b r = 0 := intervalIntegral.integral_same
  have hp := hm hρ
  rw [hz] at hp
  unfold bourBufferedCapWarp
  simp only [hp.not_ge, ↓reduceIte]
  split_ifs with h
  · rw [Function.leftInverse_invFun hm.injective ρ]
  · exact (bourBufferedAngularRadius_roundTail hr (hr.trans hbuf)
      (hm.le_iff_le.mp (le_of_not_gt h))).symm

private theorem radialSpeed_buffer {r b t : ℝ} (hb : 0 < b) (ht : t ∈ Icc 0 b) :
    bourBufferedRadialSpeed r b t = 1 := by
  have hsq : t ^ 2 ≤ b ^ 2 := by exact pow_le_pow_left₀ ht.1 ht.2 2
  have hx : t ^ 2 / b ^ 2 - 1 ≤ 0 := by
    have := (div_le_one (sq_pos_of_pos hb)).2 hsq
    linarith
  simp [bourBufferedRadialSpeed, Real.smoothTransition.zero_of_nonpos hx]

private theorem radialLength_buffer {r b ρ : ℝ} (hr : 0 < r) (hbuf : r < b)
    (hρ : ρ ∈ Icc r b) : bourBufferedRadialLength r b ρ = ρ - r := by
  unfold bourBufferedRadialLength
  calc
    _ = ∫ _t in r..ρ, (1 : ℝ) := by
      apply intervalIntegral.integral_congr
      intro t ht
      rw [uIcc_of_le hρ.1] at ht
      exact radialSpeed_buffer (hr.trans hbuf) ⟨hr.le.trans ht.1, ht.2.trans hρ.2⟩
    _ = _ := by simp

theorem bourBufferedCapWarp_entrance {r b : ℝ} (hr : 0 < r) (hbuf : r < b) :
    bourBufferedCapWarp r b =ᶠ[𝓝 0] fun s => r + s := by
  filter_upwards [gt_mem_nhds (sub_pos.mpr hbuf)] with s hs
  by_cases h : s ≤ 0
  · simp [bourBufferedCapWarp, h]
  · have ht : r < r + s := by linarith
    have hle : r + s ≤ b := by linarith
    have hlen := radialLength_buffer hr hbuf ⟨ht.le, hle⟩
    rw [add_sub_cancel_left] at hlen
    have hwarp := bourBufferedCapWarp_at_native hr hbuf ht
    rwa [hlen, radialSpeed_buffer (hr.trans hbuf) ⟨hr.le.trans ht.le, hle⟩, mul_one] at hwarp

private theorem cutLength_mem {r b : ℝ} (hr : 0 < r) (hbuf : r < b) :
    bourBufferedRadialLength r b (2*b) ∈ Ioo 0 (bourBufferedCapLength r b) := by
  rw [← bourBufferedRadialLength_image hr hbuf]
  exact ⟨2*b, show r < 2*b by linarith, rfl⟩

theorem bourBufferedCapWarp_pole {r b : ℝ} (hr : 0 < r) (hbuf : r < b)
    {t : ℝ} (ht : bourBufferedRadialLength r b (2*b) < t) :
    bourBufferedCapWarp r b =ᶠ[𝓝 t] fun s => Real.sin (bourBufferedCapLength r b - s) := by
  filter_upwards [lt_mem_nhds ht] with s hs
  simp [bourBufferedCapWarp, ((cutLength_mem hr hbuf).1.trans hs).not_ge, hs.not_gt]

theorem bourBufferedCapWarp_contDiff {r b : ℝ} (hr : 0 < r) (hbuf : r < b) :
    ContDiff ℝ ∞ (bourBufferedCapWarp r b) := by
  rw [contDiff_iff_contDiffAt]
  intro s
  rcases lt_trichotomy s 0 with hs | rfl | hs
  · have he : bourBufferedCapWarp r b =ᶠ[𝓝 s] fun t => r + t := by
      filter_upwards [gt_mem_nhds hs] with t ht
      simp [bourBufferedCapWarp, ht.le]
    exact (contDiff_const.add contDiff_id).contDiffAt.congr_of_eventuallyEq he
  · exact (contDiff_const.add contDiff_id).contDiffAt.congr_of_eventuallyEq
      (bourBufferedCapWarp_entrance hr hbuf)
  by_cases hc : bourBufferedRadialLength r b (2*b) < s
  · exact (Real.contDiff_sin.comp (contDiff_const.sub contDiff_id)).contDiffAt.congr_of_eventuallyEq
      (bourBufferedCapWarp_pole hr hbuf hc)
  have hmem : s ∈ Ioo 0 (bourBufferedCapLength r b) :=
    ⟨hs, (le_of_not_gt hc).trans_lt (cutLength_mem hr hbuf).2⟩
  rw [← bourBufferedRadialLength_image hr hbuf] at hmem
  obtain ⟨ρ, hρ, rfl⟩ := hmem
  obtain ⟨e, he, heρ, hdiff, hback⟩ := bourBufferedRadialLength_localInverse hr b ρ
  have htarget := e.map_source heρ
  rw [show e ρ = bourBufferedRadialLength r b ρ from congrFun he ρ] at htarget
  have hnear : ∀ᶠ t in 𝓝 (bourBufferedRadialLength r b ρ), e.symm t ∈ Ioi r := by
    apply hdiff.continuousAt (Ioi_mem_nhds _)
    rwa [hback]
  have hEq : bourBufferedCapWarp r b =ᶠ[𝓝 (bourBufferedRadialLength r b ρ)]
      fun t => e.symm t * bourBufferedRadialSpeed r b (e.symm t) := by
    filter_upwards [e.open_target.mem_nhds htarget, hnear] with t ht hr'
    have hright := e.right_inv ht
    change (e : ℝ → ℝ) (e.symm t) = t at hright
    rw [he] at hright
    simpa only [hright] using bourBufferedCapWarp_at_native hr hbuf hr'
  have hspeed : ContDiff ℝ ∞ (bourBufferedRadialSpeed r b) := by
    have hsq : ContDiff ℝ ∞ (fun x : ℝ => x ^ 2) := contDiff_id.pow 2
    have hrat : ContDiff ℝ ∞ (fun x : ℝ => 2*r / (r^2+x^2)) :=
      contDiff_const.div (contDiff_const.add hsq) (fun _ => ne_of_gt (by positivity))
    exact ((Real.smoothTransition.contDiff.comp ((hsq.div_const _).sub contDiff_const)).mul
      (hrat.log (fun _ => ne_of_gt (by positivity)))).exp
  exact (hdiff.mul (hspeed.contDiffAt.comp _ hdiff)).congr_of_eventuallyEq hEq

theorem bourBufferedCapWarp_pos {r b s : ℝ} (hr : 0 < r) (hbuf : r < b)
    (hs : s ∈ Ioo 0 (bourBufferedCapLength r b)) : 0 < bourBufferedCapWarp r b s := by
  rw [← bourBufferedRadialLength_image hr hbuf] at hs
  obtain ⟨ρ, hρ, rfl⟩ := hs
  rw [bourBufferedCapWarp_at_native hr hbuf hρ]
  exact mul_pos (hr.trans hρ) (bourBufferedRadialSpeed_pos _ _ _)

/-- The actual global warping function has both signed endpoint slopes.
This supplies the one-dimensional Euler integral for this very profile. -/
theorem bourBufferedCapWarp_radialEuler {r b : ℝ} (hr : 0 < r) (hbuf : r < b) :
    (∫ s in (0 : ℝ)..bourBufferedCapLength r b,
      bourClosedCapRadialEuler (bourBufferedCapWarp r b) s) = 16 * Real.pi ^ 2 := by
  apply bourClosedCapRadialEuler_integral (bourBufferedCapWarp_contDiff hr hbuf)
  · exact ((hasDerivAt_id (0 : ℝ)).const_add r |>.congr_of_eventuallyEq
      (bourBufferedCapWarp_entrance hr hbuf)).deriv
  · have hf := bourBufferedCapWarp_pole hr hbuf (cutLength_mem hr hbuf).2
    have hd := (((hasDerivAt_id (bourBufferedCapLength r b)).const_sub (bourBufferedCapLength r b)).sin)
    simpa using (hd.congr_of_eventuallyEq hf).deriv

end SmoothPoincare
