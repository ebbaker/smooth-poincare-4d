import DifferentialGeometry.Geometry.Metric.Sphere.Polar.PartialDiffeomorphism
import DifferentialGeometry.Geometry.Metric.Sphere.Round.ProjectedConnection
import FirstOrderTwistor.ExteriorRecognition
import Mathlib.Analysis.SpecialFunctions.Artanh

/-! # The marked round latitude metric and its cylindrical normalization -/

noncomputable section

open DifferentialGeometry DifferentialGeometry.Geometry FirstOrderTwistor
open ContinuousLinearMap Function Manifold Metric Module Set
open scoped ContDiff Manifold RealInnerProductSpace

namespace SmoothPoincare

private abbrev Ambient := EuclideanSpace ℝ (Fin 5)
private abbrev Equator (p : StandardFourSphere) := (ℝ ∙ (p : Ambient))ᗮ
private local instance : Fact (finrank ℝ Ambient = 3 + 2) := ⟨by simp⟩

/-- The sphere of angular directions has the canonical three-dimensional sphere charts. -/
scoped instance roundLatitudeEquatorFact (p : StandardFourSphere) :
    Fact (finrank ℝ (ℝ ∙ (p : Ambient))ᗮ = 3 + 1) :=
  ⟨polarDir_finrank (n := 3) p⟩

local notation "Ipolar" => (ModelWithCorners.prod (𝓘(ℝ, ℝ)) (𝓡 3))

/-- Polar latitude and its angular marking on the actual round four-sphere. -/
abbrev roundLatitudeChart (p : StandardFourSphere) := spherePolarPD (n := 3) p

theorem roundLatitudeChart_source (p : StandardFourSphere) (q : ℝ × PolarDir p) :
    q ∈ (roundLatitudeChart p).source ↔ q.1 ∈ Ioo 0 Real.pi := Iff.rfl

theorem roundLatitudeChart_target (p x : StandardFourSphere) :
    x ∈ (roundLatitudeChart p).target ↔ x ≠ p ∧ x ≠ -p := Iff.rfl

theorem roundLatitudeChart_left_inv (p : StandardFourSphere) (q : ℝ × PolarDir p)
    (hq : q.1 ∈ Ioo 0 Real.pi) :
    (roundLatitudeChart p).symm (roundLatitudeChart p q) = q :=
  (roundLatitudeChart p).left_inv' ((roundLatitudeChart_source p q).mpr hq)

theorem roundLatitudeChart_right_inv (p x : StandardFourSphere) (hp : x ≠ p) (hn : x ≠ -p) :
    roundLatitudeChart p ((roundLatitudeChart p).symm x) = x :=
  (roundLatitudeChart p).right_inv' ((roundLatitudeChart_target p x).mpr ⟨hp, hn⟩)

private abbrev direction (p : StandardFourSphere) (w : PolarDir p) : Ambient :=
  ((w : Equator p) : Ambient)

private theorem direction_inner_pole (p : StandardFourSphere) (w : PolarDir p) :
    ⟪(p : Ambient), direction p w⟫ = 0 :=
  Submodule.mem_orthogonal_singleton_iff_inner_right.mp w.1.2

theorem roundLatitudeChart_height (p : StandardFourSphere) (q : ℝ × PolarDir p) :
    ⟪(p : Ambient), (roundLatitudeChart p q : Ambient)⟫ = Real.cos q.1 := by
  change ⟪(p : Ambient), Real.cos q.1 • (p : Ambient) + Real.sin q.1 • direction p q.2⟫ = _
  rw [inner_add_right, real_inner_smul_right, real_inner_smul_right, direction_inner_pole,
    real_inner_self_eq_norm_sq, norm_eq_of_mem_sphere p]
  ring

/-- The north pole for the last-coordinate height on the standard sphere. -/
def roundLatitudeNorth : StandardFourSphere :=
  ⟨EuclideanSpace.single (Fin.last 4) 1, mem_sphere_zero_iff_norm.mpr (by simp)⟩

theorem roundLatitudeChart_last (q : ℝ × PolarDir roundLatitudeNorth) :
    (roundLatitudeChart roundLatitudeNorth q : Ambient) (Fin.last 4) = Real.cos q.1 := by
  rw [← roundLatitudeChart_height roundLatitudeNorth q]
  simp [roundLatitudeNorth, EuclideanSpace.inner_single_left]

/-- The conformal factor expressed in the last-coordinate height is the cylindrical one. -/
theorem roundLatitudeChart_last_exp_eq (q : ℝ × PolarDir roundLatitudeNorth)
    (hq : q.1 ∈ Ioo 0 Real.pi) :
    Real.exp (2 * (-Real.log (1 - ((roundLatitudeChart roundLatitudeNorth q : Ambient)
      (Fin.last 4)) ^ 2) / 2)) = (Real.sin q.1 ^ 2)⁻¹ := by
  rw [roundLatitudeChart_last]
  have hpow : 1 - Real.cos q.1 ^ 2 = Real.sin q.1 ^ 2 := by
    linarith [Real.sin_sq_add_cos_sq q.1]
  rw [hpow, show 2 * (-Real.log (Real.sin q.1 ^ 2) / 2) = -Real.log (Real.sin q.1 ^ 2) by ring,
    Real.exp_neg, Real.exp_log (pow_pos (Real.sin_pos_of_pos_of_lt_pi hq.1 hq.2) _)]

private theorem latitudeScalar_derivative (p : StandardFourSphere) (q : ℝ × PolarDir p)
    (v : TangentSpace Ipolar q) {f : ℝ → ℝ} {f' : ℝ} (hf : HasDerivAt f f' q.1) :
    mvfderiv Ipolar (f ∘ Prod.fst) q v = f' * v.1 := by
  have hd : MDifferentiableAt 𝓘(ℝ, ℝ) 𝓘(ℝ, ℝ) f q.1 :=
    hf.hasFDerivAt.hasMFDerivAt.mdifferentiableAt
  rw [mvfderiv_comp_apply q hd mdifferentiableAt_fst, mfderiv_fst, mvfderiv_eq_fderiv,
    hf.hasFDerivAt.fderiv]
  change v.1 * f' = f' * v.1
  exact mul_comm _ _

private theorem latitudeDirection_smooth (p : StandardFourSphere) :
    ContMDiff (𝓡 3) 𝓘(ℝ, Ambient) ∞ (direction p) :=
  (Equator p).subtypeL.contDiff.contMDiff.comp (contMDiff_coe_sphere (E := Equator p) (n := 3))

private theorem latitudeDirection_derivative (p : StandardFourSphere) (q : ℝ × PolarDir p)
    (v : TangentSpace Ipolar q) :
    mvfderiv Ipolar (direction p ∘ Prod.snd) q v =
      (dIncl (E := Equator p) (n := 3) q.2 v.2 : Ambient) := by
  rw [mvfderiv_comp_apply q ((latitudeDirection_smooth p).mdifferentiable
      (by decide : (∞ : ℕ∞ω) ≠ 0) q.2)
    mdifferentiableAt_snd, mfderiv_snd]
  have hincl : MDifferentiableAt (𝓡 3) 𝓘(ℝ, Equator p) ((↑) : PolarDir p → Equator p) q.2 :=
    (contMDiff_coe_sphere (E := Equator p) (n := 3)).mdifferentiable
      (by decide : (∞ : ℕ∞ω) ≠ 0) q.2
  have hsub : MDifferentiableAt 𝓘(ℝ, Equator p) 𝓘(ℝ, Ambient) (Equator p).subtypeL q.2 :=
    (Equator p).subtypeL.contDiff.contMDiff.mdifferentiable (by decide : (∞ : ℕ∞ω) ≠ 0) q.2
  change mvfderiv (𝓡 3) ((Equator p).subtypeL ∘ ((↑) : PolarDir p → Equator p)) q.2 v.2 = _
  erw [mvfderiv_comp_apply q.2 hsub hincl, mvfderiv_eq_fderiv, ContinuousLinearMap.fderiv]
  rfl

private theorem latitudeChart_ambient_derivative (p : StandardFourSphere) (q : ℝ × PolarDir p)
    (v : TangentSpace Ipolar q) :
    mvfderiv Ipolar (fun y ↦ (roundLatitudeChart p y : Ambient)) q v =
      (-Real.sin q.1 * v.1) • (p : Ambient) + (Real.cos q.1 * v.1) • direction p q.2 +
        Real.sin q.1 • (dIncl (E := Equator p) (n := 3) q.2 v.2 : Ambient) := by
  let c : ℝ × PolarDir p → ℝ := Real.cos ∘ Prod.fst
  let s : ℝ × PolarDir p → ℝ := Real.sin ∘ Prod.fst
  let pole : ℝ × PolarDir p → Ambient := fun _ ↦ (p : Ambient)
  let angular : ℝ × PolarDir p → Ambient := direction p ∘ Prod.snd
  have hc : MDifferentiableAt Ipolar 𝓘(ℝ, ℝ) c q :=
    (Real.contDiff_cos.contMDiff.comp contMDiff_fst).mdifferentiable (by decide : (∞ : ℕ∞ω) ≠ 0) q
  have hs : MDifferentiableAt Ipolar 𝓘(ℝ, ℝ) s q :=
    (Real.contDiff_sin.contMDiff.comp contMDiff_fst).mdifferentiable (by decide : (∞ : ℕ∞ω) ≠ 0) q
  have hp : MDifferentiableAt Ipolar 𝓘(ℝ, Ambient) pole q := mdifferentiableAt_const
  have ha : MDifferentiableAt Ipolar 𝓘(ℝ, Ambient) angular q :=
    ((latitudeDirection_smooth p).comp contMDiff_snd).mdifferentiable (by decide : (∞ : ℕ∞ω) ≠ 0) q
  change mvfderiv Ipolar (c • pole + s • angular) q v = _
  rw [mvfderiv_add (hc.smul hp) (hs.smul ha), mvfderiv_smul hc hp, mvfderiv_smul hs ha]
  simp only [add_apply, smul_apply, smulRight_apply, pole, mvfderiv_const,
    smul_zero, zero_add, c, s, angular, latitudeScalar_derivative p q v (Real.hasDerivAt_cos _),
    latitudeScalar_derivative p q v (Real.hasDerivAt_sin _), latitudeDirection_derivative,
    comp_apply]
  rw [add_assoc, add_comm (Real.sin q.1 • (dIncl (n := 3) q.2 v.2 : Ambient))]

/-- Tangent vectors in the chart, expressed using the actual ambient inclusion. -/
theorem roundLatitudeChart_tangent (p : StandardFourSphere) (q : ℝ × PolarDir p)
    (hq : q.1 ∈ Ioo 0 Real.pi) (v : TangentSpace Ipolar q) :
    dIncl (n := 4) (roundLatitudeChart p q)
      (mfderiv Ipolar (𝓡 4) (roundLatitudeChart p) q v) =
      (-Real.sin q.1 * v.1) • (p : Ambient) + (Real.cos q.1 * v.1) • ((q.2 : Equator p) : Ambient) +
        Real.sin q.1 • (dIncl (E := Equator p) (n := 3) q.2 v.2 : Ambient) := by
  have hmem := (roundLatitudeChart_source p q).mpr hq
  have hchart := ((roundLatitudeChart p).contMDiffOn_toFun.contMDiffAt
    ((roundLatitudeChart p).open_source.mem_nhds hmem)).mdifferentiableAt (by decide : (∞ : ℕ∞ω) ≠ 0)
  have hcoe := (contMDiff_coe_sphere (E := Ambient) (n := 4)).mdifferentiable
    (by decide : (∞ : ℕ∞ω) ≠ 0) (roundLatitudeChart p q)
  exact (mvfderiv_comp_apply q hcoe hchart v).symm.trans
    (latitudeChart_ambient_derivative p q v)

/-- On the genuine polar chart the round metric is `dr² + sin²(r) g_S³`. -/
theorem roundLatitudeChart_metric_inner (p : StandardFourSphere) (q : ℝ × PolarDir p)
    (hq : q.1 ∈ Ioo 0 Real.pi) (v w : TangentSpace Ipolar q) :
    (roundMetric (E := Ambient) (n := 4)).inner (roundLatitudeChart p q)
      (mfderiv Ipolar (𝓡 4) (roundLatitudeChart p) q v)
      (mfderiv Ipolar (𝓡 4) (roundLatitudeChart p) q w) =
      v.1 * w.1 + Real.sin q.1 ^ 2 *
        (roundMetric (E := Equator p) (n := 3)).inner q.2 v.2 w.2 := by
  let a (u : TangentSpace Ipolar q) : Equator p := dIncl (n := 3) q.2 u.2
  have hpp : ⟪(p : Ambient), (p : Ambient)⟫ = 1 := by
    rw [real_inner_self_eq_norm_sq, norm_eq_of_mem_sphere p, one_pow]
  have hww : ⟪direction p q.2, direction p q.2⟫ = 1 := by
    rw [real_inner_self_eq_norm_sq]
    change ‖(q.2 : Equator p)‖ ^ 2 = 1
    rw [norm_eq_of_mem_sphere q.2, one_pow]
  have hpw := direction_inner_pole p q.2
  have hwp : ⟪direction p q.2, (p : Ambient)⟫ = 0 := (real_inner_comm _ _).trans hpw
  have hpa (u : TangentSpace Ipolar q) : ⟪(p : Ambient), (a u : Ambient)⟫ = 0 :=
    Submodule.mem_orthogonal_singleton_iff_inner_right.mp (a u).2
  have hap (u : TangentSpace Ipolar q) : ⟪(a u : Ambient), (p : Ambient)⟫ = 0 :=
    (real_inner_comm _ _).trans (hpa u)
  have hwa (u : TangentSpace Ipolar q) : ⟪direction p q.2, (a u : Ambient)⟫ = 0 := by
    change ⟪(q.2 : Equator p), dIncl (n := 3) q.2 u.2⟫ = 0
    rw [← dInclEquiv_coe (n := 3) q.2 u.2]
    exact Submodule.mem_orthogonal_singleton_iff_inner_right.mp (dInclEquiv (n := 3) q.2 u.2).2
  have haw (u : TangentSpace Ipolar q) : ⟪(a u : Ambient), direction p q.2⟫ = 0 :=
    (real_inner_comm _ _).trans (hwa u)
  rw [roundMetric_inner, roundLatitudeChart_tangent p q hq v, roundLatitudeChart_tangent p q hq w]
  erw [roundMetric_inner (E := Equator p) (n := 3)]
  change ⟪(-Real.sin q.1 * v.1) • (p : Ambient) + (Real.cos q.1 * v.1) • direction p q.2 +
      Real.sin q.1 • (a v : Ambient),
    (-Real.sin q.1 * w.1) • (p : Ambient) + (Real.cos q.1 * w.1) • direction p q.2 +
      Real.sin q.1 • (a w : Ambient)⟫ =
    v.1 * w.1 + Real.sin q.1 ^ 2 * ⟪(a v : Ambient), (a w : Ambient)⟫
  simp only [inner_add_left, inner_add_right, real_inner_smul_left, real_inner_smul_right,
    hpp, hww, hpw, hwp, hpa, hap, hwa, haw, mul_zero, mul_one, zero_add, add_zero]
  calc
    _ = (Real.sin q.1 ^ 2 + Real.cos q.1 ^ 2) * (v.1 * w.1) +
          Real.sin q.1 ^ 2 * ⟪(a v : Ambient), (a w : Ambient)⟫ := by ring
    _ = _ := by rw [Real.sin_sq_add_cos_sq, one_mul]

/-- Increasing cylinder coordinate, zero on the equator. -/
def roundLatitudeCylinderTime (r : ℝ) : ℝ := -Real.artanh (Real.cos r)

private theorem neg_tanh_mem_Ioo (t : ℝ) : -Real.tanh t ∈ Ioo (-1) 1 :=
  ⟨by linarith [Real.tanh_lt_one t], by linarith [Real.neg_one_lt_tanh t]⟩

/-- The inverse cylinder coordinate takes values strictly between the poles. -/
theorem roundLatitudeCylinderTime_inverse_mem (t : ℝ) :
    Real.arccos (-Real.tanh t) ∈ Ioo 0 Real.pi :=
  ⟨Real.arccos_pos.mpr (neg_tanh_mem_Ioo t).2, Real.arccos_lt_pi.mpr (neg_tanh_mem_Ioo t).1⟩

theorem roundLatitudeCylinderTime_left_inv {r : ℝ} (hr : r ∈ Ioo 0 Real.pi) :
    Real.arccos (-Real.tanh (roundLatitudeCylinderTime r)) = r := by
  rw [roundLatitudeCylinderTime, Real.tanh_neg, neg_neg,
    Real.tanh_artanh (Real.mapsTo_cos_Ioo hr), Real.arccos_cos hr.1.le hr.2.le]

theorem roundLatitudeCylinderTime_right_inv (t : ℝ) :
    roundLatitudeCylinderTime (Real.arccos (-Real.tanh t)) = t := by
  rw [roundLatitudeCylinderTime,
    Real.cos_arccos (neg_tanh_mem_Ioo t).1.le (neg_tanh_mem_Ioo t).2.le,
    ← Real.tanh_neg, Real.artanh_tanh, neg_neg]

/-- The radial reparametrization satisfies `dt/dr = 1/sin(r)` off the poles. -/
theorem roundLatitudeCylinderTime_hasDerivAt {r : ℝ} (hr : r ∈ Ioo 0 Real.pi) :
    HasDerivAt roundLatitudeCylinderTime (Real.sin r)⁻¹ r := by
  have hcos := Real.mapsTo_cos_Ioo hr
  have hs : 0 < Real.sin r := Real.sin_pos_of_pos_of_lt_pi hr.1 hr.2
  have hplus : 0 < 1 + Real.cos r := by linarith [hcos.1]
  have hminus : 0 < 1 - Real.cos r := by linarith [hcos.2]
  have hdminus := ((hasDerivAt_const r (1 : ℝ)).sub (Real.hasDerivAt_cos r)).log hminus.ne'
  have hdplus := ((hasDerivAt_const r (1 : ℝ)).add (Real.hasDerivAt_cos r)).log hplus.ne'
  refine ((hdminus.sub hdplus).div_const 2).congr_deriv ?_ |>.congr_of_eventuallyEq ?_
  · change ((0 - -Real.sin r) / (1 - Real.cos r) - (0 + -Real.sin r) / (1 + Real.cos r)) / 2 = _
    field_simp [hs.ne', hplus.ne', hminus.ne']
    nlinarith [Real.sin_sq_add_cos_sq r]
  · filter_upwards [isOpen_Ioo.mem_nhds hr] with y hy
    have hycos := Real.mapsTo_cos_Ioo hy
    have hyplus : 0 < 1 + Real.cos y := by linarith [hycos.1]
    have hyminus : 0 < 1 - Real.cos y := by linarith [hycos.2]
    rw [roundLatitudeCylinderTime, Real.artanh_eq_half_log ⟨hycos.1.le, hycos.2.le⟩,
      Real.log_div hyplus.ne' hyminus.ne']
    change -(1 / 2 * (Real.log (1 + Real.cos y) - Real.log (1 - Real.cos y))) =
      (Real.log (1 - Real.cos y) - Real.log (1 + Real.cos y)) / 2
    ring

/-- The cylindrical metric identity in the marked chart, including the differential of `t`. -/
theorem roundLatitudeChart_cylindrical_inner (p : StandardFourSphere) (q : ℝ × PolarDir p)
    (hq : q.1 ∈ Ioo 0 Real.pi) (v w : TangentSpace Ipolar q) :
    (Real.sin q.1 ^ 2)⁻¹ * (roundMetric (E := Ambient) (n := 4)).inner (roundLatitudeChart p q)
      (mfderiv Ipolar (𝓡 4) (roundLatitudeChart p) q v)
      (mfderiv Ipolar (𝓡 4) (roundLatitudeChart p) q w) =
    mvfderiv Ipolar (roundLatitudeCylinderTime ∘ Prod.fst) q v *
      mvfderiv Ipolar (roundLatitudeCylinderTime ∘ Prod.fst) q w +
        (roundMetric (E := Equator p) (n := 3)).inner q.2 v.2 w.2 := by
  rw [roundLatitudeChart_metric_inner p q hq,
    latitudeScalar_derivative p q v (roundLatitudeCylinderTime_hasDerivAt hq),
    latitudeScalar_derivative p q w (roundLatitudeCylinderTime_hasDerivAt hq)]
  field_simp [(Real.sin_pos_of_pos_of_lt_pi hq.1 hq.2).ne']

end SmoothPoincare
