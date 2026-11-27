import SmoothPoincare

/-! # Independent physical replay for the E54 buffered cap

Prepared for Edward B. Baker III, 27 November 2026.
-/

noncomputable section

open DifferentialGeometry DifferentialGeometry.Geometry.Curvature
open DifferentialGeometry.Integral.Measure Filter FirstOrderTwistor MeasureTheory Set SmoothPoincare
open scoped ContDiff Manifold Topology

namespace E54CapChecks

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "I₄" => 𝓘(ℝ, E₄)
local notation "S₄" => StandardFourSphere

private local instance : Fact (Module.finrank ℝ (EuclideanSpace ℝ (Fin 5)) = 4 + 1) := ⟨by simp⟩
private local instance : MeasurableSpace S₄ := borel S₄
private local instance : BorelSpace S₄ := ⟨rfl⟩

private theorem hr : (0 : ℝ) < 2 := by norm_num
private theorem hbuf : (2 : ℝ) < 3 := by norm_num

private abbrev g := bourBufferedSphereMetric 2 hr 3 (hr.trans hbuf)
private abbrev f := bourBufferedCapWarp 2 3
private abbrev s := bourBufferedRadialLength 2 3
private abbrev L := bourBufferedCapLength 2 3

private def transitionPoint : E₄ := EuclideanSpace.single 0 4

private theorem transitionPoint_norm : ‖transitionPoint‖ = (4 : ℝ) := by
  norm_num [transitionPoint, EuclideanSpace.single]

-- The sampled physical radius is in the blend, and both coordinate readings
-- agree on this point of the actual marked carrier.
example :
    let p := bourBufferedSphereChart 2 hr transitionPoint
    let speed₄ := Real.exp (Real.smoothTransition (7 / 9) * Real.log (1 / 5))
    bourBufferedSphereRadius 2 hr p = 4 ∧
      bourBufferedSphereArclength 2 hr 3 p = s 4 ∧
      s 4 ∈ Ioo 0 L ∧ f (s 4) = 4 * speed₄ := by
  intro p speed₄
  have hSpeed : bourBufferedRadialSpeed 2 3 4 = speed₄ := by
    unfold bourBufferedRadialSpeed
    congr 2 <;> norm_num
  refine ⟨?_, ?_, ?_, ?_⟩
  · simp [p, transitionPoint_norm]
  · simp [p, transitionPoint_norm]
  · rw [← bourBufferedRadialLength_image hr hbuf]
    exact ⟨4, by norm_num, rfl⟩
  · exact (bourBufferedCapWarp_at_native hr hbuf (ρ := 4) (by norm_num)).trans
      (congrArg (4 * ·) hSpeed)

example :
    Measure.map (bourBufferedSphereRadius 2 hr)
      ((riemannianVolumeMeasure I₄ S₄ g).restrict standardFourSphereCapᶜ) =
      (volume.restrict (Ioi 2)).withDensity
        (fun ρ => ENNReal.ofReal (2 * Real.pi ^ 2 * ρ ^ 3 * bourBufferedRadialSpeed 2 3 ρ ^ 4)) :=
  bourBufferedSphere_native_volume hr (hr.trans hbuf)

example :
    Measure.map (bourBufferedSphereArclength 2 hr 3)
      ((riemannianVolumeMeasure I₄ S₄ g).restrict standardFourSphereCapᶜ) =
      (volume.restrict (Ioo 0 L)).withDensity (fun t => ENNReal.ofReal (2 * Real.pi ^ 2 * f t ^ 3)) :=
  bourBufferedSphere_arclength_volume hr hbuf (bourBufferedCapWarp_contDiff hr hbuf).continuous.measurable
    (fun _ h => bourBufferedCapWarp_at_native hr hbuf h)

-- Two distinct sectional slots and one mixed slot on an actual physical
-- orthonormal frame. The lowered curvature tensor swaps its last two slots
-- when read as the curvature operator in the wedge frame.
example :
    let p := bourBufferedSphereChart 2 hr transitionPoint
    ∃ frame : OrientedOrthonormalFrameAt g bourBufferedSphereOrientation p,
      let T := metricCurvatureFrameTensor g bourBufferedSphereOrientation p frame
      T 0 1 0 1 = -deriv (deriv f) (s 4) / f (s 4) ∧
      T 1 2 1 2 = (1 - deriv f (s 4) ^ 2) / f (s 4) ^ 2 ∧ T 0 1 0 2 = 0 := by
  intro p
  have hnorm : 0 < ‖transitionPoint‖ := by rw [transitionPoint_norm]; norm_num
  obtain ⟨e, he, frame, hframe⟩ := bourBufferedSphere_exists_radialFrame hr (hr.trans hbuf)
    transitionPoint (norm_pos_iff.mp hnorm)
  obtain ⟨ε, hε, hcoord⟩ := bourBufferedSphere_radialProjection transitionPoint (norm_pos_iff.mp hnorm) e he
  have hRadius : (f ∘ s) =ᶠ[𝓝 ‖transitionPoint‖] fun t => t * bourBufferedRadialSpeed 2 3 t := by
    filter_upwards [lt_mem_nhds (show (2 : ℝ) < ‖transitionPoint‖ by rw [transitionPoint_norm]; norm_num)]
      with t ht using bourBufferedCapWarp_at_native hr hbuf ht
  have hCurv := bourBufferedCapCurvature_frame hr (hr.trans hbuf) transitionPoint hnorm
    (bourBufferedCapWarp_contDiff hr hbuf) hRadius e hε hcoord bourBufferedSphereOrientation frame hframe
  change metricCurvatureFrameTensor g bourBufferedSphereOrientation p frame = _ at hCurv
  rw [transitionPoint_norm] at hCurv
  refine ⟨frame, ?_⟩
  dsimp only
  rw [hCurv]
  change _ * (1 * 1 - 0 * 0) = _ ∧ _ * (1 * 1 - 0 * 0) = _ ∧ _ * (1 * 0 - 0 * 0) = _
  simp

private theorem roundCutSlope : deriv f (s (Real.sqrt 18)) = -(7 / 11 : ℝ) := by
  let q := Real.sqrt 18
  have hq2 : q ^ 2 = 18 := Real.sq_sqrt (by norm_num)
  have hq0 : 0 ≤ q := Real.sqrt_nonneg _
  have hq : 2 < q := by nlinarith
  have hSpeed (t : ℝ) (ht : q ≤ t) : bourBufferedRadialSpeed 2 3 t = 4 / (4 + t ^ 2) := by
    have hqle := pow_le_pow_left₀ hq0 ht 2
    have hcut : (1 : ℝ) ≤ t ^ 2 / 3 ^ 2 - 1 := by nlinarith
    have hratio : (0 : ℝ) < 2 * 2 / (2 ^ 2 + t ^ 2) := by positivity
    rw [bourBufferedRadialSpeed, Real.smoothTransition.one_of_one_le hcut, one_mul, Real.exp_log hratio]
    norm_num
  have hB : ∀ t ∈ Ici q, t * bourBufferedRadialSpeed 2 3 t = 4 * t / (4 + t ^ 2) := by
    intro t ht
    rw [hSpeed t ht]
    ring
  have hRound : HasDerivAt (fun t : ℝ => 4 * t / (4 + t ^ 2)) (-(14 / 121 : ℝ)) q := by
    convert (((hasDerivAt_id q).const_mul (4 : ℝ)).div
      (((hasDerivAt_id q).pow 2).const_add 4) (by positivity : (4 : ℝ) + q ^ 2 ≠ 0)) using 1
    · rfl
    · change -(14 / 121 : ℝ) = (4 * 1 * (4 + q ^ 2) - 4 * q * (2 * q ^ (2 - 1) * 1)) / (4 + q ^ 2) ^ 2
      simp only [Nat.reduceSub, pow_one, mul_one]
      rw [show 4 * q * (2 * q) = 8 * q ^ 2 by ring, hq2]
      norm_num
  have hNative := bourBufferedAngularRadius_native_deriv hr 3 q
  have hWithin : HasDerivWithinAt (fun t => 4 * t / (4 + t ^ 2))
      (bourBufferedRadialSpeed 2 3 q + q * deriv (bourBufferedRadialSpeed 2 3) q) (Ici q) q :=
    hNative.hasDerivWithinAt.congr (fun t ht => (hB t ht).symm) (hB q (mem_Ici.mpr le_rfl)).symm
  have hNativeVal := (hWithin.derivWithin (uniqueDiffWithinAt_Ici q)).symm.trans
    ((hRound.hasDerivWithinAt (s := Ici q)).derivWithin (uniqueDiffWithinAt_Ici q))
  have hRadius : (f ∘ s) =ᶠ[𝓝 q] fun t => t * bourBufferedRadialSpeed 2 3 t := by
    filter_upwards [lt_mem_nhds hq] with t ht using bourBufferedCapWarp_at_native hr hbuf ht
  have hF := ((bourBufferedCapWarp_contDiff hr hbuf).differentiable (by simp) (s q)).hasDerivAt
  have hSlope := bourBufferedAngularRadius_arclength_deriv hr 3 q hF hRadius
  change deriv f (s q) = _ at hSlope
  change deriv f (s q) = _
  rw [hSlope, hNativeVal, hSpeed q le_rfl, hq2]
  norm_num

private theorem entrySlope : deriv f 0 = 1 :=
  (bourBufferedCapWarp_entrance hr hbuf).deriv_eq.trans ((hasDerivAt_id (0 : ℝ)).const_add 2).deriv

private theorem poleSlope : deriv f L = -1 := by
  have hs : s (2 * 3) ∈ Ioo 0 L := by
    rw [← bourBufferedRadialLength_image hr hbuf]
    exact ⟨6, by norm_num, by norm_num⟩
  have h := (bourBufferedCapWarp_pole hr hbuf hs.2).deriv_eq
  rw [h]
  simpa using (((hasDerivAt_id L).const_sub L).sin).deriv

-- The exact primitive differences use the physical transition and pole jets.
example :
    let P := fun t : ℝ => -(12 * Real.pi ^ 2) * (deriv f t - deriv f t ^ 3 / 3)
    P (s (Real.sqrt 18)) - P 0 = (19440 / 1331 : ℝ) * Real.pi ^ 2 ∧
      P L - P (s (Real.sqrt 18)) = (1856 / 1331 : ℝ) * Real.pi ^ 2 := by
  dsimp only
  rw [roundCutSlope, entrySlope, poleSlope]
  constructor <;> ring

example :
    (∫ t in (0 : ℝ)..L, bourClosedCapRadialEuler f t) = 16 * Real.pi ^ 2 :=
  bourClosedCapRadialEuler_integral (bourBufferedCapWarp_contDiff hr hbuf) entrySlope poleSlope

example :
    (∫ p in standardFourSphereCapᶜ, intrinsicEulerDensity g p ∂riemannianVolumeMeasure I₄ S₄ g) =
      16 * Real.pi ^ 2 :=
  bourBufferedSphere_capEuler hr hbuf

example : (∫ p, intrinsicEulerDensity g p ∂riemannianVolumeMeasure I₄ S₄ g) = 16 * Real.pi ^ 2 :=
  bourBufferedSphere_closedEuler hr hbuf

end E54CapChecks

#print axioms bourBufferedCapWarp_contDiff
#print axioms bourBufferedCapWarp_radialEuler
#print axioms bourBufferedSphere_exists_radialFrame
#print axioms bourBufferedSphere_radialProjection
#print axioms bourBufferedSphere_chart_volume
#print axioms bourBufferedSphere_native_volume
#print axioms bourBufferedSphere_arclength_volume
#print axioms bourBufferedCapCurvature_native
#print axioms bourBufferedCapCurvature_frame
#print axioms bourBufferedSphere_capEuler
#print axioms bourBufferedSphere_closedEuler
