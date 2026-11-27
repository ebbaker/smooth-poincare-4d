import DifferentialGeometry.Analysis.Calculus.LocalExtrema
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Bounds
import Mathlib.Analysis.SpecialFunctions.Trigonometric.DerivHyp
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Deriv
import Mathlib.Analysis.Real.Pi.Bounds

/-! # A transverse barrier from the central pause to the outer cuff

The planar corridor uses the original Euclidean marking of the long-cuff pants.
The height is the hyperboloid coordinate normal to the central target seam. -/

open Set Filter Topology
noncomputable section
namespace SmoothPoincare.IntrinsicEntry

/-- Half-strip ending at the actual outer circle of radius four. -/
def pauseCorridor : Set (ℝ × ℝ) :=
  (Icc (-(1/4 : ℝ)) (1/4) ×ˢ Icc 0 4) ∩ {p | p.1 ^ 2 + p.2 ^ 2 ≤ 16}

/-- The flat Laplacian in the two marked surface coordinates. -/
def pauseLap (f : ℝ × ℝ → ℝ) (p : ℝ × ℝ) : ℝ :=
  deriv (deriv (fun t => f (t,p.2))) p.1 + deriv (deriv (fun t => f (p.1,t))) p.2

def pauseTransverseBarrier (p : ℝ × ℝ) : ℝ :=
  Real.cos (2 * Real.pi * p.1) * Real.sinh (10 * p.2) / Real.sinh 40

private theorem pauseBarrier_smooth : ContDiff ℝ 2 pauseTransverseBarrier := by
  unfold pauseTransverseBarrier
  fun_prop

private theorem second_sub (f g : ℝ → ℝ) (hf : ContDiff ℝ 2 f) (hg : ContDiff ℝ 2 g) (t : ℝ) :
    deriv (deriv (fun s => f s - g s)) t = deriv (deriv f) t - deriv (deriv g) t := by
  have he : deriv (fun s => f s - g s) = fun s => deriv f s - deriv g s := by
    funext s
    exact deriv_sub (hf.differentiable (by norm_num) s) (hg.differentiable (by norm_num) s)
  rw [he]
  exact deriv_sub (hf.differentiable_deriv_two t) (hg.differentiable_deriv_two t)

private theorem trigSecond (a b t : ℝ) :
    deriv (deriv (fun t : ℝ => Real.cos (a*t) * b)) t = -(a^2) * (Real.cos (a*t)*b) := by
  have h₁ (z : ℝ) := (((hasDerivAt_id z).const_mul a).cos.mul_const b)
  have h₂ (z : ℝ) := (((hasDerivAt_id z).const_mul a).sin.neg.mul_const (a*b))
  have he : deriv (fun z : ℝ => Real.cos (a*z) * b) = fun z => -Real.sin (a*z) * (a*b) := by
    funext z
    convert (h₁ z).deriv using 1 <;> first | (simp [id]; done) | (simp [id]; ring)
  rw [he]
  convert (h₂ t).deriv using 1 <;> first | (simp [id]; done) | (simp [id]; ring)

private theorem hypSecond (a b t : ℝ) :
    deriv (deriv (fun t : ℝ => Real.sinh (a*t) * b)) t = a^2 * (Real.sinh (a*t)*b) := by
  have h₁ (z : ℝ) := (((hasDerivAt_id z).const_mul a).sinh.mul_const b)
  have h₂ (z : ℝ) := (((hasDerivAt_id z).const_mul a).cosh.mul_const (a*b))
  have he : deriv (fun z : ℝ => Real.sinh (a*z) * b) = fun z => Real.cosh (a*z) * (a*b) := by
    funext z
    convert (h₁ z).deriv using 1 <;> first | (simp [id]; done) | (simp [id]; ring)
  rw [he]
  convert (h₂ t).deriv using 1 <;> first | (simp [id]; done) | (simp [id]; ring)

theorem pauseBarrier_lap (p : ℝ × ℝ) :
    pauseLap pauseTransverseBarrier p = (100 - (2 * Real.pi)^2) * pauseTransverseBarrier p := by
  have h₁ : (fun t => pauseTransverseBarrier (t,p.2)) =
      fun t => Real.cos ((2*Real.pi)*t) * (Real.sinh (10*p.2)/Real.sinh 40) := by
    funext t; unfold pauseTransverseBarrier; ring
  have h₂ : (fun t => pauseTransverseBarrier (p.1,t)) =
      fun t => Real.sinh (10*t) * (Real.cos (2*Real.pi*p.1)/Real.sinh 40) := by
    funext t; unfold pauseTransverseBarrier; ring
  rw [pauseLap, h₁, h₂, trigSecond, hypSecond, pauseTransverseBarrier]
  ring

private theorem corridor_compact : IsCompact pauseCorridor := by
  exact (isCompact_Icc.prod isCompact_Icc).inter_right (isClosed_le (by fun_prop) continuous_const)

private theorem origin_in_corridor : ((0,0) : ℝ × ℝ) ∈ pauseCorridor := by
  norm_num [pauseCorridor]

private theorem barrier_nonneg {p : ℝ × ℝ} (hp : p ∈ pauseCorridor) :
    0 ≤ pauseTransverseBarrier p := by
  have hcos := Real.cos_nonneg_of_mem_Icc (x := 2 * Real.pi * p.1)
    (show 2 * Real.pi * p.1 ∈ Icc (-(Real.pi/2)) (Real.pi/2) from
      ⟨by nlinarith [mul_nonneg Real.pi_pos.le (sub_nonneg.mpr hp.1.1.1)],
       by nlinarith [mul_nonneg Real.pi_pos.le (sub_nonneg.mpr hp.1.1.2)]⟩)
  exact div_nonneg (mul_nonneg hcos (Real.sinh_nonneg_iff.mpr (by linarith [hp.1.2.1]))) (by positivity)

private theorem barrier_le_one {p : ℝ × ℝ} (hp : p ∈ pauseCorridor) :
    pauseTransverseBarrier p ≤ 1 := by
  apply (div_le_iff₀ (Real.sinh_pos_iff.mpr (by norm_num : (0:ℝ) < 40))).2
  calc
    _ ≤ 1 * Real.sinh (10 * p.2) :=
      mul_le_mul_of_nonneg_right (Real.cos_le_one _) (Real.sinh_nonneg_iff.mpr (by linarith [hp.1.2.1]))
    _ ≤ _ := by rw [one_mul,one_mul]; apply Real.sinh_le_sinh.mpr; linarith [hp.1.2.2]

/-- Comparison for the actual corridor. The PDE, cuff lower value and the
Bochner energy ceiling are explicit inputs on the given marked height. -/
theorem pauseTransverseBarrier_le (u E : ℝ × ℝ → ℝ) (hu : ContDiff ℝ 2 u)
    (hpos : ∀ p ∈ pauseCorridor, 0 ≤ u p)
    (hcuff : ∀ p ∈ pauseCorridor, p.1^2 + p.2^2 = 16 → 1 ≤ u p)
    (hE : ∀ p ∈ interior pauseCorridor, 0 ≤ E p ∧ E p ≤ 59)
    (hpde : ∀ p ∈ interior pauseCorridor, pauseLap u p = E p * u p) :
    ∀ p ∈ pauseCorridor, pauseTransverseBarrier p ≤ u p := by
  let f : ℝ × ℝ → ℝ := fun p => pauseTransverseBarrier p - u p
  obtain ⟨p,hp,hm⟩ := corridor_compact.exists_isMaxOn ⟨(0,0),origin_in_corridor⟩
    (pauseBarrier_smooth.continuous.sub hu.continuous).continuousOn
  intro z hz
  by_contra! hneg
  have hmax : 0 < f p := lt_of_lt_of_le (sub_pos.mpr hneg) (hm hz)
  have hpv : 0 < pauseTransverseBarrier p := lt_of_le_of_lt (hpos p hp) (sub_pos.mp hmax)
  have hx0 : -(1/4:ℝ) < p.1 := by
    apply lt_of_le_of_ne hp.1.1.1; intro h
    unfold pauseTransverseBarrier at hpv
    rw [← h, show 2 * Real.pi * -(1/4:ℝ) = -(Real.pi/2) by ring, Real.cos_neg, Real.cos_pi_div_two] at hpv
    simp at hpv
  have hx1 : p.1 < (1/4:ℝ) := by
    apply lt_of_le_of_ne hp.1.1.2; intro h
    unfold pauseTransverseBarrier at hpv
    rw [h, show 2 * Real.pi * (1/4:ℝ) = Real.pi/2 by ring, Real.cos_pi_div_two] at hpv
    simp at hpv
  have hy0 : 0 < p.2 := by
    apply lt_of_le_of_ne hp.1.2.1; intro h; simp [pauseTransverseBarrier, ← h] at hpv
  have hd : p.1^2+p.2^2 < 16 := by
    apply lt_of_le_of_ne hp.2; intro h
    exact (not_lt_of_ge ((barrier_le_one hp).trans (hcuff p hp h))) (sub_pos.mp hmax)
  have hy1 : p.2 < 4 := by nlinarith [sq_nonneg p.1]
  have hi : p ∈ interior pauseCorridor := by
    apply mem_interior_iff_mem_nhds.mpr
    exact inter_mem (prod_mem_nhds (Icc_mem_nhds hx0 hx1) (Icc_mem_nhds hy0 hy1))
      (mem_of_superset ((isOpen_lt (f := fun z : ℝ × ℝ => z.1^2 + z.2^2) (by fun_prop) continuous_const).mem_nhds hd) (fun (z : ℝ × ℝ) (h : z.1^2 + z.2^2 < 16) => (show z.1^2 + z.2^2 ≤ 16 from h.le)))
  have hl : IsLocalMax f p := hm.isLocalMax (mem_interior_iff_mem_nhds.mp hi)
  have hx : IsLocalMax (fun t => f (t,p.2)) p.1 :=
    hl.comp_continuous (g := fun t => (t,p.2)) (by fun_prop)
  have hy : IsLocalMax (fun t => f (p.1,t)) p.2 :=
    hl.comp_continuous (g := fun t => (p.1,t)) (by fun_prop)
  have hfc : Continuous f := pauseBarrier_smooth.continuous.sub hu.continuous
  have hΔ : pauseLap f p ≤ 0 := add_nonpos
    (hx.deriv_deriv_nonpos (by fun_prop)) (hy.deriv_deriv_nonpos (by fun_prop))
  have hcalc : pauseLap f p = pauseLap pauseTransverseBarrier p - pauseLap u p := by
    unfold pauseLap f
    rw [second_sub (fun t => pauseTransverseBarrier (t,p.2)) (fun t => u (t,p.2))
        (pauseBarrier_smooth.comp (by fun_prop)) (hu.comp (by fun_prop)),
      second_sub (fun t => pauseTransverseBarrier (p.1,t)) (fun t => u (p.1,t))
        (pauseBarrier_smooth.comp (by fun_prop)) (hu.comp (by fun_prop))]
    ring
  rw [hcalc,pauseBarrier_lap,hpde p hi] at hΔ
  have hrate : 59 < 100 - (2 * Real.pi)^2 := by nlinarith [Real.pi_lt_d2, Real.pi_pos]
  have he := hE p hi
  nlinarith [mul_lt_mul_of_pos_right (lt_of_le_of_lt he.2 hrate) hpv,
    mul_nonneg he.1 (show 0 ≤ pauseTransverseBarrier p - u p from hmax.le)]

/-- At every point of the open middle gap in the corridor, the one-sided
comparison gives a lower bound on the actual transverse speed. -/
theorem pauseTransverseDerivative_ge {u : ℝ × ℝ → ℝ} {x d : ℝ}
    (hx : x ∈ Icc (-(1/4:ℝ)) (1/4)) (hzero : u (x,0) = 0)
    (hderiv : HasDerivAt (fun y => u (x,y)) d 0)
    (hcmp : ∀ p ∈ pauseCorridor, pauseTransverseBarrier p ≤ u p) :
    Real.cos (2 * Real.pi * x) * 10 / Real.sinh 40 ≤ d := by
  have hb : HasDerivAt (fun y => pauseTransverseBarrier (x,y))
      (Real.cos (2*Real.pi*x) * 10 / Real.sinh 40) 0 := by
    simpa [pauseTransverseBarrier] using
      (((((hasDerivAt_id (0:ℝ)).const_mul 10).sinh).const_mul
        (Real.cos (2*Real.pi*x))).div_const (Real.sinh 40))
  apply le_of_tendsto_of_tendsto (hasDerivAt_iff_tendsto_slope_left_right.mp hb).2
    (hasDerivAt_iff_tendsto_slope_left_right.mp hderiv).2
  filter_upwards [Ioo_mem_nhdsGT (show (0:ℝ)<1 by norm_num)] with y hy
  have hxy : (x,y) ∈ pauseCorridor := by
    refine ⟨⟨hx,⟨hy.1.le,by linarith [hy.2]⟩⟩,?_⟩
    change x^2+y^2 ≤ 16
    nlinarith [mul_nonneg (sub_nonneg.mpr hx.2) (sub_nonneg.mpr hx.1),
      mul_nonneg hy.1.le (sub_nonneg.mpr hy.2.le)]
  simp only [slope_def_field, sub_zero, hzero, show pauseTransverseBarrier (x,0) = 0 by
    simp [pauseTransverseBarrier]]
  exact div_le_div_of_nonneg_right (hcmp (x,y) hxy) hy.1.le

/-- The reflected axes diagonalize the physical pullback. The two distinct
directional lower estimates then give a lower quadratic form on the plane. -/
theorem pauseMetric_lower {qxx qyy d horizontal : ℝ}
    (hh : horizontal^2 ≤ qxx) (hd : 10 / Real.sinh 40 ≤ d)
    (hv : d^2 ≤ qyy) (v w : ℝ) :
    min (horizontal^2) ((10 / Real.sinh 40)^2) * (v^2+w^2) ≤ qxx*v^2+qyy*w^2 := by
  have hb : 0 ≤ 10 / Real.sinh 40 := by positivity
  have h₁ := (min_le_left (horizontal^2) ((10/Real.sinh 40)^2)).trans hh
  have h₂ := (min_le_right (horizontal^2) ((10/Real.sinh 40)^2)).trans
    ((sq_le_sq₀ hb (hb.trans hd)).mpr hd |>.trans hv)
  nlinarith [mul_nonneg (sub_nonneg.mpr h₁) (sq_nonneg v),
    mul_nonneg (sub_nonneg.mpr h₂) (sq_nonneg w)]

/-- Perturbing each coefficient by at most one quarter of a positive
diagonal floor retains one half of it in every planar direction. -/
theorem pauseMetric_near_lower {m A B a b c : ℝ} (hA : m ≤ A) (hB : m ≤ B)
    (ha : |a-A| ≤ m/4) (hb : |b| ≤ m/4) (hc : |c-B| ≤ m/4) (v w : ℝ) :
    (m/2)*(v^2+w^2) ≤ a*v^2+2*b*v*w+c*w^2 := by
  have h₁ := (abs_le.mp ha).1
  have h₂ := (abs_le.mp hc).1
  have hm := abs_nonneg b |>.trans hb
  have hx : -(m/4)*(v^2+w^2) ≤ 2*b*v*w := by
    have ht := neg_abs_le (2*b*v*w)
    simp only [abs_mul,abs_of_nonneg (by norm_num : (0:ℝ) ≤ 2)] at ht
    have hs : 2 * |v| * |w| ≤ v^2 + w^2 := by nlinarith [sq_nonneg (|v|-|w|), sq_abs v, sq_abs w]
    nlinarith [mul_le_mul_of_nonneg_left hs hm,
      mul_nonneg (sub_nonneg.mpr hb) (mul_nonneg (abs_nonneg v) (abs_nonneg w))]
  nlinarith [mul_nonneg (show 0 ≤ a-3*m/4 by linarith) (sq_nonneg v),
    mul_nonneg (show 0 ≤ c-3*m/4 by linarith) (sq_nonneg w)]

end SmoothPoincare.IntrinsicEntry
