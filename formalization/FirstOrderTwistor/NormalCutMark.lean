import FirstOrderTwistor.BufferedInterpolation
import Mathlib.Analysis.Normed.Module.Ball.RadialEquiv
import Mathlib.Analysis.SpecialFunctions.Log.Basic
import Mathlib.Topology.OpenPartialHomeomorph.Basic

/-!
# Normal-coordinate marking for the spherical cut

A single angular isometry marks both the closed cap and the open collar.
The radius decreases with the signed collar coordinate. Composition with the
specified normal chart gives the marked ball and identifies its cut sphere.
-/

open Set Metric

namespace FirstOrderTwistor

/-- The cap marking in the normal chart centered at zero. -/
def normalCapMark (s : ℝ) (J : EuclideanFour ≃ₗᵢ[ℝ] EuclideanFour)
    (v : EuclideanFour) : EuclideanFour :=
  s • J v

/-- The signed normal collar, with positive `t` pointing into the marked cap. -/
noncomputable def normalCutPolar (s : ℝ) (J : EuclideanFour ≃ₗᵢ[ℝ] EuclideanFour)
    (t : ℝ) (ω : sphere (0 : EuclideanFour) 1) : EuclideanFour :=
  normalCapMark (s * Real.exp (-t)) J ω

theorem normalCapMark_image_closedBall {s : ℝ} (hs : 0 < s)
    (J : EuclideanFour ≃ₗᵢ[ℝ] EuclideanFour) :
    normalCapMark s J '' closedBall 0 1 = closedBall 0 s := by
  change ((s • ·) ∘ J) '' closedBall 0 1 = closedBall 0 s
  rw [image_comp, J.image_closedBall, J.map_zero, smul_image_closedBall hs.ne', smul_zero,
    Real.norm_of_nonneg hs.le, mul_one]

theorem normalCapMark_image_sphere {s : ℝ} (hs : 0 < s)
    (J : EuclideanFour ≃ₗᵢ[ℝ] EuclideanFour) :
    normalCapMark s J '' sphere 0 1 = sphere 0 s := by
  change ((s • ·) ∘ J) '' sphere 0 1 = sphere 0 s
  rw [image_comp, J.image_sphere, J.map_zero, smul_image_sphere hs.ne', smul_zero,
    Real.norm_of_nonneg hs.le, mul_one]

theorem norm_normalCutPolar {s : ℝ} (hs : 0 < s) (J : EuclideanFour ≃ₗᵢ[ℝ] EuclideanFour)
    (t : ℝ) (ω : sphere (0 : EuclideanFour) 1) :
    ‖normalCutPolar s J t ω‖ = s * Real.exp (-t) := by
  have hω : ‖(ω : EuclideanFour)‖ = 1 := mem_sphere_zero_iff_norm.mp ω.property
  rw [normalCutPolar, normalCapMark, norm_smul_of_nonneg (mul_nonneg hs.le (Real.exp_nonneg _)),
    J.norm_map, hω, mul_one]

theorem normalCutPolar_log_radius {s : ℝ} (hs : 0 < s)
    (J : EuclideanFour ≃ₗᵢ[ℝ] EuclideanFour) (t : ℝ) (ω : sphere (0 : EuclideanFour) 1) :
    -Real.log (‖normalCutPolar s J t ω‖ / s) = t := by
  rw [norm_normalCutPolar hs, mul_div_cancel_left₀ _ hs.ne', Real.log_exp, neg_neg]

@[simp] theorem normalCutPolar_zero (s : ℝ) (J : EuclideanFour ≃ₗᵢ[ℝ] EuclideanFour)
    (ω : sphere (0 : EuclideanFour) 1) : normalCutPolar s J 0 ω = normalCapMark s J ω := by
  simp [normalCutPolar]

theorem normalCutPolar_range_at_time {s : ℝ} (hs : 0 < s)
    (J : EuclideanFour ≃ₗᵢ[ℝ] EuclideanFour) (t : ℝ) :
    range (normalCutPolar s J t) = sphere 0 (s * Real.exp (-t)) := by
  rw [← normalCapMark_image_sphere (mul_pos hs (Real.exp_pos _)) J, image_eq_range]
  rfl

theorem normalCutPolar_mem_ball_iff {s : ℝ} (hs : 0 < s)
    (J : EuclideanFour ≃ₗᵢ[ℝ] EuclideanFour) (t : ℝ) (ω : sphere (0 : EuclideanFour) 1) :
    normalCutPolar s J t ω ∈ ball 0 s ↔ 0 < t := by
  calc
    _ ↔ s * Real.exp (-t) < s * 1 := by
      rw [mem_ball_zero_iff, norm_normalCutPolar hs, mul_one]
    _ ↔ 0 < t := by rw [mul_lt_mul_iff_right₀ hs, Real.exp_lt_one_iff, neg_lt_zero]

theorem normalCutPolar_mem_sphere_iff {s : ℝ} (hs : 0 < s)
    (J : EuclideanFour ≃ₗᵢ[ℝ] EuclideanFour) (t : ℝ) (ω : sphere (0 : EuclideanFour) 1) :
    normalCutPolar s J t ω ∈ sphere 0 s ↔ t = 0 := by
  calc
    _ ↔ s * Real.exp (-t) = s * 1 := by
      rw [mem_sphere_zero_iff_norm, norm_normalCutPolar hs, mul_one]
    _ ↔ Real.exp (-t) = 1 := ⟨mul_left_cancel₀ hs.ne', congrArg (s * ·)⟩
    _ ↔ t = 0 := by rw [Real.exp_eq_one_iff, neg_eq_zero]

theorem normalCutPolar_notMem_closedBall_iff {s : ℝ} (hs : 0 < s)
    (J : EuclideanFour ≃ₗᵢ[ℝ] EuclideanFour) (t : ℝ) (ω : sphere (0 : EuclideanFour) 1) :
    normalCutPolar s J t ω ∉ closedBall 0 s ↔ t < 0 := by
  calc
    _ ↔ s * 1 < s * Real.exp (-t) := by
      rw [mem_closedBall_zero_iff, not_le, norm_normalCutPolar hs, mul_one]
    _ ↔ t < 0 := by rw [mul_lt_mul_iff_right₀ hs, Real.one_lt_exp_iff, neg_pos]

private noncomputable def normalMarkHomeomorph {s : ℝ} (hs : 0 < s)
    (J : EuclideanFour ≃ₗᵢ[ℝ] EuclideanFour) : EuclideanFour ≃ₜ EuclideanFour :=
  J.toHomeomorph.trans (Homeomorph.smulOfNeZero s hs.ne')

private noncomputable def normalAngularHomeomorph {s : ℝ} (hs : 0 < s)
    (J : EuclideanFour ≃ₗᵢ[ℝ] EuclideanFour) :
    sphere (0 : EuclideanFour) 1 ≃ₜ sphere (0 : EuclideanFour) s :=
  (normalMarkHomeomorph hs J).toOpenPartialHomeomorph.homeomorphOfImageSubsetSource
    (by simp) (normalCapMark_image_sphere hs J)

/-- Logarithmic polar coordinates on the punctured normal coordinate space. -/
noncomputable def normalCutPolarHomeomorph {s : ℝ} (hs : 0 < s)
    (J : EuclideanFour ≃ₗᵢ[ℝ] EuclideanFour) :
    (ℝ × sphere (0 : EuclideanFour) 1) ≃ₜ ({0}ᶜ : Set EuclideanFour) :=
  ((Homeomorph.prodComm _ _).trans
    ((normalAngularHomeomorph hs J).prodCongr
      ((Homeomorph.neg ℝ).trans Real.expOrderIso.toHomeomorph))).trans
    (homeomorphSphereProd EuclideanFour s hs).symm

theorem normalCutPolarHomeomorph_apply {s : ℝ} (hs : 0 < s)
    (J : EuclideanFour ≃ₗᵢ[ℝ] EuclideanFour) (t : ℝ) (ω : sphere (0 : EuclideanFour) 1) :
    (normalCutPolarHomeomorph hs J (t, ω) : EuclideanFour) = normalCutPolar s J t ω := by
  change Real.exp (-t) • (s • J (ω : EuclideanFour)) = (s * Real.exp (-t)) • J (ω : EuclideanFour)
  rw [smul_smul, mul_comm]

section Chart

variable {Xhat : Type*} [TopologicalSpace Xhat]

/-- A fixed-width buffer and the marked ball fit in the same chart at a
sufficiently small positive radius. -/
theorem exists_normalCutRadius_for_buffer (chart : OpenPartialHomeomorph EuclideanFour Xhat)
    (hcenter : (0 : EuclideanFour) ∈ chart.source) {T sMax : ℝ}
    (hT : 0 ≤ T) (hMax : 0 < sMax) (J : EuclideanFour ≃ₗᵢ[ℝ] EuclideanFour) :
    ∃ s : ℝ, 0 < s ∧ s < sMax ∧ closedBall 0 s ⊆ chart.source ∧
      ∀ t : ℝ, |t| ≤ T → ∀ ω : sphere (0 : EuclideanFour) 1,
        normalCutPolar s J t ω ∈ chart.source := by
  obtain ⟨ε, hε, hball⟩ := Metric.isOpen_iff.mp chart.open_source 0 hcenter
  have hexpT := Real.exp_pos T
  let s := min (sMax / 2) ((ε / 2) / Real.exp T)
  have hs : 0 < s := lt_min (half_pos hMax) (div_pos (half_pos hε) hexpT)
  have hsMax : s < sMax := (min_le_left _ _).trans_lt (half_lt_self hMax)
  have hsT : s * Real.exp T ≤ ε / 2 := (le_div_iff₀ hexpT).mp (min_le_right _ _)
  have hfit : closedBall 0 (s * Real.exp T) ⊆ chart.source := by
    intro v hv
    exact hball (mem_ball_zero_iff.mpr
      (((mem_closedBall_zero_iff.mp hv).trans hsT).trans_lt (half_lt_self hε)))
  refine ⟨s, hs, hsMax, (closedBall_subset_closedBall ?_).trans hfit, ?_⟩
  · simpa only [mul_one] using
      mul_le_mul_of_nonneg_left (Real.one_le_exp_iff.mpr hT) hs.le
  · intro t ht ω
    apply hfit
    rw [mem_closedBall_zero_iff, norm_normalCutPolar hs]
    exact mul_le_mul_of_nonneg_left (Real.exp_le_exp.mpr ((neg_le_abs t).trans ht)) hs.le

/-- The cap homeomorphism uses the given chart in the direction from normal
coordinates to the manifold, and maps onto its actual closed-ball image. -/
noncomputable def chartedNormalCap (chart : OpenPartialHomeomorph EuclideanFour Xhat)
    {s : ℝ} (hs : 0 < s) (hfit : closedBall 0 s ⊆ chart.source)
    (J : EuclideanFour ≃ₗᵢ[ℝ] EuclideanFour) :
    closedBall (0 : EuclideanFour) 1 ≃ₜ (chart '' closedBall 0 s) :=
  ((normalMarkHomeomorph hs J).toOpenPartialHomeomorph.homeomorphOfImageSubsetSource
    (by simp) (normalCapMark_image_closedBall hs J)).trans
    (chart.homeomorphOfImageSubsetSource hfit rfl)

theorem chartedNormalCap_apply (chart : OpenPartialHomeomorph EuclideanFour Xhat)
    {s : ℝ} (hs : 0 < s) (hfit : closedBall 0 s ⊆ chart.source)
    (J : EuclideanFour ≃ₗᵢ[ℝ] EuclideanFour) (v : closedBall (0 : EuclideanFour) 1) :
    (chartedNormalCap chart hs hfit J v : Xhat) = chart (normalCapMark s J v) := rfl

theorem chartedNormalCap_boundary (chart : OpenPartialHomeomorph EuclideanFour Xhat)
    {s : ℝ} (hs : 0 < s) (hfit : closedBall 0 s ⊆ chart.source)
    (J : EuclideanFour ≃ₗᵢ[ℝ] EuclideanFour) (ω : sphere (0 : EuclideanFour) 1) :
    (chartedNormalCap chart hs hfit J ⟨ω, sphere_subset_closedBall ω.property⟩ : Xhat) =
      chart (normalCutPolar s J 0 ω) := by
  rw [chartedNormalCap_apply, normalCutPolar_zero]

theorem chartedNormalCut_middle_range (chart : OpenPartialHomeomorph EuclideanFour Xhat)
    {s : ℝ} (hs : 0 < s) (J : EuclideanFour ≃ₗᵢ[ℝ] EuclideanFour) :
    range (chart ∘ normalCutPolar s J 0) = chart '' sphere 0 s := by
  rw [range_comp, normalCutPolar_range_at_time hs]
  simp

private theorem chart_mem_image_iff (chart : OpenPartialHomeomorph EuclideanFour Xhat)
    {A : Set EuclideanFour} (hA : A ⊆ chart.source) {y : EuclideanFour} (hy : y ∈ chart.source) :
    chart y ∈ chart '' A ↔ y ∈ A := by
  constructor
  · rintro ⟨z, hz, hzy⟩
    exact chart.injOn (hA hz) hy hzy ▸ hz
  · exact fun hyA => mem_image_of_mem chart hyA

/-- On the part of the signed collar lying in the supplied chart, the same
chart image tests the cap interior, the actual seam, and the exterior. -/
theorem chartedNormalCut_sides (chart : OpenPartialHomeomorph EuclideanFour Xhat)
    {s : ℝ} (hs : 0 < s) (hfit : closedBall 0 s ⊆ chart.source)
    (J : EuclideanFour ≃ₗᵢ[ℝ] EuclideanFour) (t : ℝ) (ω : sphere (0 : EuclideanFour) 1)
    (hy : normalCutPolar s J t ω ∈ chart.source) :
    (chart (normalCutPolar s J t ω) ∈ chart '' ball 0 s ↔ 0 < t) ∧
      (chart (normalCutPolar s J t ω) ∈ chart '' sphere 0 s ↔ t = 0) ∧
      (chart (normalCutPolar s J t ω) ∉ chart '' closedBall 0 s ↔ t < 0) :=
  ⟨(chart_mem_image_iff chart (ball_subset_closedBall.trans hfit) hy).trans
      (normalCutPolar_mem_ball_iff hs J t ω),
    (chart_mem_image_iff chart (sphere_subset_closedBall.trans hfit) hy).trans
      (normalCutPolar_mem_sphere_iff hs J t ω),
    (not_congr (chart_mem_image_iff chart hfit hy)).trans
      (normalCutPolar_notMem_closedBall_iff hs J t ω)⟩

end Chart

end FirstOrderTwistor
