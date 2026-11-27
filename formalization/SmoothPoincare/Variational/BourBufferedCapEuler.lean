import SmoothPoincare.Variational.BourMeasuredBufferedCap
import SmoothPoincare.Variational.BourBufferedCapCurvature
import SmoothPoincare.Variational.BourBufferedCapFrame

/-! # The Euler integral on one physical buffered cap

Prepared for Edward B. Baker III, 27 November 2026. The carrier is the
closed metric obtained from the Euclidean ball and its one spherical end.
-/

noncomputable section

open DifferentialGeometry DifferentialGeometry.Geometry DifferentialGeometry.Geometry.Curvature
open DifferentialGeometry.Tensor0SBundle DifferentialGeometry.Integral.Measure
open Filter FirstOrderTwistor MeasureTheory Set
open scoped Manifold ContDiff Topology RealInnerProductSpace

namespace SmoothPoincare

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "I₄" => 𝓘(ℝ, E₄)
local notation "S₄" => StandardFourSphere

private local instance : MeasurableSpace S₄ := borel S₄
private local instance : BorelSpace S₄ := ⟨rfl⟩

/-- The Euler integral over the whole physical external cap, including
its curved transition and round pole, in the convention 8π²χ. -/
theorem bourBufferedSphere_capEuler {r b : ℝ} (hr : 0 < r) (hbuf : r < b) :
    let g := bourBufferedSphereMetric r hr b (hr.trans hbuf)
    (∫ p in standardFourSphereCapᶜ, intrinsicEulerDensity g p ∂riemannianVolumeMeasure I₄ S₄ g)
      = 16 * Real.pi ^ 2 := by
  classical
  intro g
  let s := bourBufferedSphereArclength r hr b
  let f := bourBufferedCapWarp r b
  let o := bourBufferedSphereOrientation
  let good (p : S₄) (F : OrientedOrthonormalFrameAt g o p) : Prop :=
    metricCurvatureFrameTensor g o p F = bourClosedCapFrameCurvature
      (-deriv (deriv f) (s p) / f (s p)) ((1 - deriv f (s p) ^ 2) / f (s p) ^ 2)
  let frame (p : S₄) : OrientedOrthonormalFrameAt g o p :=
    if h : ∃ F, good p F then h.choose else orientedOrthonormalFrameAt g o p
  have hf := bourBufferedCapWarp_contDiff hr hbuf
  have hc : ∀ᵐ p ∂(riemannianVolumeMeasure I₄ S₄ g).restrict standardFourSphereCapᶜ,
      good p (frame p) := by
    filter_upwards [bourBufferedSphere_cap_ae hr (hr.trans hbuf)] with p hp
    obtain ⟨x, hx, rfl⟩ := hp
    have hpos := hr.trans hx
    obtain ⟨e, he, F, hF⟩ :=
      bourBufferedSphere_exists_radialFrame hr (hr.trans hbuf) x (norm_pos_iff.mp hpos)
    obtain ⟨ε, hε, hcoord⟩ := bourBufferedSphere_radialProjection x (norm_pos_iff.mp hpos) e he
    have hg : ∃ F, good (bourBufferedSphereChart r hr x) F := by
      refine ⟨F, ?_⟩
      dsimp only [good, s]
      rw [bourBufferedSphereArclength_chart]
      apply bourBufferedCapCurvature_frame hr (hr.trans hbuf) x hpos hf _ e hε hcoord o F hF
      filter_upwards [lt_mem_nhds hx] with ρ hρ
      exact bourBufferedCapWarp_at_native hr hbuf hρ
    simpa only [frame, dite_eq_left hg] using hg.choose_spec
  have hcut : bourBufferedRadialLength r b (2*b) ∈ Ioo 0 (bourBufferedCapLength r b) := by
    rw [← bourBufferedRadialLength_image hr hbuf]
    exact ⟨2*b, show r < 2*b by linarith, rfl⟩
  apply bourVariableCapEuler_roundPole g o frame (r := r) (a := 1)
    (hcut.1.trans hcut.2).le zero_lt_one hf (fun _ hs => bourBufferedCapWarp_pos hr hbuf hs)
    (bourBufferedCapWarp_entrance hr hbuf)
  · simpa using bourBufferedCapWarp_pole hr hbuf hcut.2
  · exact ⟨s, bourBufferedSphereArclength_measurable hr b,
      bourBufferedSphere_arclength_volume hr hbuf hf.continuous.measurable
        (fun _ h => bourBufferedCapWarp_at_native hr hbuf h), hc⟩

/-- The physical closed carrier has the same Euler integral. Its entire
marked inner disk is inside the flat buffer, including the seam. -/
theorem bourBufferedSphere_closedEuler {r b : ℝ} (hr : 0 < r) (hbuf : r < b) :
    let g := bourBufferedSphereMetric r hr b (hr.trans hbuf)
    (∫ p, intrinsicEulerDensity g p ∂riemannianVolumeMeasure I₄ S₄ g) = 16 * Real.pi ^ 2 := by
  intro g
  rw [← bourBufferedSphere_capEuler hr hbuf]
  symm
  apply setIntegral_eq_integral_of_forall_compl_eq_zero
  intro p hp
  have hp' : p ∈ standardFourSphereCap := by simpa using hp
  rw [← (bourBufferedSphere_markedDisk r hr).1] at hp'
  obtain ⟨x, hx, rfl⟩ := hp'
  have hnorm : ‖x‖ ≤ r := by simpa [Metric.mem_closedBall, dist_zero_right] using hx
  let p := bourBufferedSphereChart r hr x
  let o := bourBufferedSphereOrientation
  let F := orientedOrthonormalFrameAt g o p
  have hflat := bourBufferedSphere_flat hr (hr.trans hbuf) (hnorm.trans_lt hbuf)
  have hRm : metricRm04At g p = 0 :=
    ((tensor0SMetricData (I := I₄) g p 4).inner_self_eq_zero_iff _).mp hflat
  have hslots : metricCurvatureFrameTensor g o p F = bourClosedCapFrameCurvature 0 0 := by
    funext a b i j
    change metricRm04StandardAt g p _ _ _ _ = _
    simp [metricRm04StandardAt, hRm, tensor04StandardAt, bourClosedCapFrameCurvature]
  change intrinsicEulerDensity g p = _
  rw [intrinsicEulerDensity_eq_frameEulerPfaffian g o p F, hslots, bourClosedCapFramePfaffian]
  norm_num

end SmoothPoincare
