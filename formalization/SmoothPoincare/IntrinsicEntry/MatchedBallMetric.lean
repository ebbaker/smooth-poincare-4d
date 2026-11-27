import SmoothPoincare.IntrinsicEntry.MatchedBallRobin
import DifferentialGeometry.Topology.Manifold.SphereDirection
import DifferentialGeometry.Geometry.Metric.Conformal.Basic
import DifferentialGeometry.Geometry.Metric.Euclidean
import Mathlib.Analysis.SpecialFunctions.SmoothTransition

/-! # A conformally Euclidean cap with prescribed boundary value and normal jet

The boundary chart identifies the actual induced metric with exp(2ℓ) times
the unit round metric. The supplied side trace H uses the side's outward normal.
The cap's Euclidean outward normal is increasing radius. -/

noncomputable section

open Metric Set Filter DifferentialGeometry DifferentialGeometry.Topology.Manifold
open scoped Manifold ContDiff Topology

namespace SmoothPoincare.IntrinsicEntry

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "I₄" => 𝓘(ℝ, E₄)
local notation "S₃" => sphere (0 : E₄) 1
local instance : Fact (Module.finrank ℝ E₄ = 3 + 1) := ⟨by simp⟩

/-- The cutoff leaves a flat neighborhood of the center and is identically one
on a neighborhood of the entire unit sphere. -/
def matchedBallLogFactor (v : S₃) (ℓ D : S₃ → ℝ) (x : E₄) : ℝ :=
  Real.smoothTransition (4 * ‖x‖ - 1) *
    (ℓ (sphereDirection v x) + (‖x‖ - 1) * D (sphereDirection v x))

theorem matchedBallLogFactor_smooth (v : S₃) {ℓ D : S₃ → ℝ}
    (hℓ : ContMDiff (𝓡 3) 𝓘(ℝ) ∞ ℓ) (hD : ContMDiff (𝓡 3) 𝓘(ℝ) ∞ D) :
    ContDiff ℝ ∞ (matchedBallLogFactor v ℓ D) := by
  rw [contDiff_iff_contDiffAt]
  intro x
  by_cases hx : x = 0
  · subst x
    apply (contDiffAt_const (c := (0 : ℝ))).congr_of_eventuallyEq
    filter_upwards [Metric.ball_mem_nhds (0 : E₄) (by norm_num : (0 : ℝ) < 1/4)] with y hy
    rw [Metric.mem_ball, dist_zero_right] at hy
    simp [matchedBallLogFactor, Real.smoothTransition.zero_of_nonpos (show 4 * ‖y‖ - 1 ≤ 0 by linarith)]
  · have hdir := ((contMDiffOn_sphereDirection (n := 3) v) x hx).contMDiffAt
        (isOpen_compl_singleton.mem_nhds hx)
    have h₁ := ((hℓ _).comp x hdir).contDiffAt
    have h₂ := ((hD _).comp x hdir).contDiffAt
    have hn := contDiffAt_norm (n := ∞) ℝ hx
    exact (Real.smoothTransition.contDiff.contDiffAt.comp x
      ((contDiffAt_const.mul hn).sub contDiffAt_const)).mul
      (h₁.add ((hn.sub contDiffAt_const).mul h₂))

/-- The precise germ along each radial line. -/
theorem matchedBallLogFactor_ray (v y : S₃) (ℓ D : S₃ → ℝ) {r : ℝ} (hr : 1/2 ≤ r) :
    matchedBallLogFactor v ℓ D (r • (y : E₄)) = ℓ y + (r - 1) * D y := by
  have hpos : 0 < r := by linarith
  have hn : ‖r • (y : E₄)‖ = r := by simp [norm_smul, norm_eq_of_mem_sphere, abs_of_pos hpos]
  unfold matchedBallLogFactor
  rw [hn, sphereDirection_pos_smul v y hpos, Real.smoothTransition.one_of_one_le (by linarith), one_mul]

theorem matchedBallLogFactor_boundary (v y : S₃) (ℓ D : S₃ → ℝ) :
    matchedBallLogFactor v ℓ D (y : E₄) = ℓ y := by
  simpa using matchedBallLogFactor_ray v y ℓ D (r := 1) (by norm_num)

theorem matchedBallLogFactor_outward (v y : S₃) (ℓ D : S₃ → ℝ) :
    HasDerivAt (fun r : ℝ => matchedBallLogFactor v ℓ D (r • (y : E₄))) (D y) 1 := by
  have hd := ((hasDerivAt_id (1 : ℝ)).sub_const 1).mul_const (D y)
  apply (show HasDerivAt (fun r : ℝ => ℓ y + (r - 1) * D y) (D y) 1 by
    simpa using hd.const_add (ℓ y)).congr_of_eventuallyEq
  filter_upwards [lt_mem_nhds (by norm_num : (1/2 : ℝ) < 1)] with r hr
  exact matchedBallLogFactor_ray v y ℓ D hr.le

/-- The outward normal derivative required by the conformal trace law
w H_cap = 3 + 3 ∂ν(log w). -/
def capLogNormal (ℓ H : S₃ → ℝ) (y : S₃) : ℝ := (-Real.exp (ℓ y) * H y - 3) / 3

private theorem capLogNormal_smooth {ℓ H : S₃ → ℝ}
    (hℓ : ContMDiff (𝓡 3) 𝓘(ℝ) ∞ ℓ) (hH : ContMDiff (𝓡 3) 𝓘(ℝ) ∞ H) :
    ContMDiff (𝓡 3) 𝓘(ℝ) ∞ (capLogNormal ℓ H) := by
  unfold capLogNormal
  exact ((((Real.contDiff_exp.contMDiff.comp hℓ).neg.mul hH).sub contMDiff_const).div_const 3)

/-- The metric exists on all of Euclidean four-space, so it restricts smoothly
to the closed unit ball. -/
def matchedConformallyFlatBall (v : S₃) {ℓ H : S₃ → ℝ}
    (hℓ : ContMDiff (𝓡 3) 𝓘(ℝ) ∞ ℓ) (hH : ContMDiff (𝓡 3) 𝓘(ℝ) ∞ H) :
    SmoothRiemannianMetric I₄ E₄ :=
  conformalMetric euclideanMetric ⟨matchedBallLogFactor v ℓ (capLogNormal ℓ H),
    (matchedBallLogFactor_smooth v hℓ (capLogNormal_smooth hℓ hH)).contMDiff⟩

theorem matchedConformallyFlatBall_boundaryJet (v y : S₃) {ℓ H : S₃ → ℝ}
    (hℓ : ContMDiff (𝓡 3) 𝓘(ℝ) ∞ ℓ) (hH : ContMDiff (𝓡 3) 𝓘(ℝ) ∞ H) :
    (∀ a b : E₄, (matchedConformallyFlatBall v hℓ hH).inner (y : E₄) a b =
      Real.exp (2 * ℓ y) * euclideanMetric.inner (y : E₄) a b) ∧
    3 * deriv (fun r : ℝ => matchedBallLogFactor v ℓ (capLogNormal ℓ H) (r • (y : E₄))) 1 =
      -Real.exp (ℓ y) * H y - 3 := by
  constructor
  · intro a b
    change Real.exp (2 * matchedBallLogFactor v ℓ (capLogNormal ℓ H) (y : E₄)) * _ = _
    rw [matchedBallLogFactor_boundary]
    rfl
  · rw [(matchedBallLogFactor_outward v y ℓ (capLogNormal ℓ H)).deriv]
    unfold capLogNormal
    ring

/-- In the polar collar of the actual cap, angular vectors transport as
`r • a`. Dividing the radial derivative of the metric by twice the boundary
lapse gives the outward second form. For tangential vectors this formula
cancels the original side's entire umbilic second form, pointwise. -/
theorem matchedConformallyFlatBall_angular_firstJet (v y : S₃) {ℓ H : S₃ → ℝ}
    (hℓ : ContMDiff (𝓡 3) 𝓘(ℝ) ∞ ℓ) (hH : ContMDiff (𝓡 3) 𝓘(ℝ) ∞ H) (a b : E₄) :
    let g := matchedConformallyFlatBall v hℓ hH
    deriv (fun r : ℝ => g.inner (r • (y : E₄)) (r • a) (r • b)) 1 /
        (2 * Real.exp (ℓ y)) + H y / 3 * g.inner (y : E₄) a b = 0 := by
  intro g
  let u := matchedBallLogFactor v ℓ (capLogNormal ℓ H)
  have hu : HasDerivAt (fun r : ℝ => u (r • (y : E₄))) (capLogNormal ℓ H y) 1 :=
    matchedBallLogFactor_outward v y ℓ _
  have he := (hu.const_mul 2).exp
  have hpow := (hasDerivAt_id (1 : ℝ)).pow 2
  have hfun : (fun r : ℝ => g.inner (r • (y : E₄)) (r • a) (r • b)) =
      fun r : ℝ => (Real.exp (2 * u (r • (y : E₄))) * r ^ 2) * inner ℝ a b := by
    funext r
    change Real.exp (2 * u (r • (y : E₄))) * inner ℝ (r • a) (r • b) = _
    rw [real_inner_smul_left, real_inner_smul_right]
    ring
  have hder := ((he.mul hpow).mul_const (inner ℝ a b)).deriv
  change deriv (fun r : ℝ => (Real.exp (2 * u (r • (y : E₄))) * r ^ 2) * inner ℝ a b) 1 = _ at hder
  rw [hfun]
  change deriv _ 1 / (2 * Real.exp (ℓ y)) + H y / 3 * (Real.exp (2 * u (y : E₄)) * inner ℝ a b) = 0
  rw [hder]
  have hv : u (y : E₄) = ℓ y := matchedBallLogFactor_boundary v y ℓ _
  change _ + H y / 3 * (Real.exp (2 * u (y : E₄)) * inner ℝ a b) = 0
  simp [Pi.pow_apply, hv]
  rw [show 2 * ℓ y = ℓ y + ℓ y by ring, Real.exp_add]
  unfold capLogNormal
  field_simp
  ring

/-- Boundary input for the Robin form of the constructed cap. The normal
derivative is evaluated on the smooth extension. The angular first-jet
calculation supplies the opposite umbilic tensor on the marked sphere. -/
def matchedBallRobinJet (v : S₃) (ℓ H : S₃ → ℝ) : MatchedBallBoundaryJet S₃ where
  factor y := Real.exp (ℓ y)
  factorPos y := Real.exp_pos _
  outwardMean := H
  capOutwardMean y := -H y
  outwardLogDerivative y :=
    deriv (fun r : ℝ => matchedBallLogFactor v ℓ (capLogNormal ℓ H) (r • (y : E₄))) 1
  prescribedDerivative y := by
    rw [(matchedBallLogFactor_outward v y ℓ (capLogNormal ℓ H)).deriv]
    unfold capLogNormal
    ring
  conformalMeanChange y := by
    rw [(matchedBallLogFactor_outward v y ℓ (capLogNormal ℓ H)).deriv]
    unfold capLogNormal
    ring

end SmoothPoincare.IntrinsicEntry
