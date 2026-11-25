import FirstOrderTwistor.CylinderDirac
import Mathlib.Analysis.Calculus.ContDiff.RCLike
import Mathlib.MeasureTheory.Integral.IntervalIntegral.AbsolutelyContinuousFun
import Mathlib.MeasureTheory.Function.L2Space

/-!
# The incoming mode with square-integrable forcing

FOT-E22c, prepared for Edward B. Baker III on 2026-11-25 with OpenAI Codex
assistance. The selected helper configuration is gpt-6.2-sol, ultra.
Inputs: MATCH-E01 and the checked integrating factor in CylinderDirac,
at intake HEAD 5ff7014.

On a finite real interval we use the absolutely continuous representative
of a one-dimensional Sobolev function. The representative's value and
derivative are square integrable, and the integral of the derivative
recovers every difference of endpoint values.
-/

open MeasureTheory Set Filter
open scoped Topology ENNReal InnerProductSpace

namespace FirstOrderTwistor

section BanachModes

variable {V : Type*} [NormedAddCommGroup V]

private theorem cylinder_interval_finite (length : ℝ) :
    IsFiniteMeasure (volume.restrict (Icc (0 : ℝ) length)) :=
  isFiniteMeasure_restrict.mpr (isCompact_Icc.measure_lt_top.ne)

private theorem continuousOn_memLp_cylinder {length : ℝ} {f : ℝ → V}
    (hf : ContinuousOn f (Icc 0 length)) (p : ℝ≥0∞) :
    MemLp f p (volume.restrict (Icc 0 length)) := by
  let := cylinder_interval_finite length
  obtain ⟨C, hC⟩ := isCompact_Icc.exists_bound_of_continuousOn hf
  exact (memLp_const C).mono'
    (hf.aestronglyMeasurable_of_isCompact isCompact_Icc measurableSet_Icc)
    (ae_restrict_of_forall_mem measurableSet_Icc hC)

private theorem cylinder_intervalIntegrable_of_memLp {length : ℝ} (hlength : 0 ≤ length)
    {f : ℝ → V} (hf : MemLp f 2 (volume.restrict (Icc 0 length))) :
    IntervalIntegrable f volume 0 length := by
  let := cylinder_interval_finite length
  apply intervalIntegrable_iff.mpr
  rw [uIoc_of_le hlength]
  have hf' : IntegrableOn f (Icc 0 length) volume :=
    hf.integrable (by norm_num : (1 : ℝ≥0∞) ≤ 2)
  exact hf'.mono_set Ioc_subset_Icc_self

private theorem cylinder_exponential_contDiff (rate origin : ℝ) :
    ContDiff ℝ 1 (fun t : ℝ => Real.exp (rate * (t - origin))) := by
  fun_prop

private theorem cylinder_exponential_ac (rate origin length : ℝ) :
    AbsolutelyContinuousOnInterval (fun t : ℝ => Real.exp (rate * (t - origin))) 0 length := by
  obtain ⟨_, h⟩ := (cylinder_exponential_contDiff rate origin).contDiffOn.exists_lipschitzOnWith
    one_ne_zero (convex_uIcc 0 length) isCompact_uIcc
  exact h.absolutelyContinuousOnInterval

private theorem cylinder_exponential_hasDerivAt (rate origin t : ℝ) :
    HasDerivAt (fun s : ℝ => Real.exp (rate * (s - origin)))
      (rate * Real.exp (rate * (t - origin))) t := by
  simpa only [mul_one, mul_comm] using
    (((hasDerivAt_id' t).sub_const origin).const_mul rate).exp

variable [NormedSpace ℝ V]

private theorem cylinder_smul_exponential_memLp {length : ℝ} (rate origin : ℝ)
    {f : ℝ → V} (hf : MemLp f 2 (volume.restrict (Icc 0 length))) :
    MemLp (fun t => Real.exp (rate * (t - origin)) • f t) 2
      (volume.restrict (Icc 0 length)) := by
  have hweight := continuousOn_memLp_cylinder (V := ℝ) (length := length)
    (cylinder_exponential_contDiff rate origin).continuous.continuousOn ∞
  exact hweight.smul hf

private theorem cylinder_incomingEnd_mem {length eigenvalue : ℝ} (hlength : 0 ≤ length) :
    cylinderIncomingEnd length eigenvalue ∈ Icc 0 length := by
  unfold cylinderIncomingEnd
  split <;> simp [hlength]

-- The Banach-valued primitive inherits absolute continuity from the
-- scalar primitive of the integrand norm.
private theorem cylinder_intervalIntegral_ac {f : ℝ → V} {a b c : ℝ}
    (hf : IntervalIntegrable f volume a b) (hc : c ∈ uIcc a b) :
    AbsolutelyContinuousOnInterval (fun x => ∫ t in c..x, f t) a b := by
  let F (x : ℝ) := ∫ t in c..x, f t
  let G (x : ℝ) := ∫ t in c..x, ‖f t‖
  have hG : AbsolutelyContinuousOnInterval G a b :=
    hf.norm.absolutelyContinuousOnInterval_intervalIntegral hc
  have hpair {x y : ℝ} (hx : x ∈ uIcc a b) (hy : y ∈ uIcc a b) :
      dist (F x) (F y) ≤ dist (G x) (G y) := by
    have hi (s : ℝ) (hs : s ∈ uIcc a b) : IntervalIntegrable f volume c s :=
      hf.mono_set (uIcc_subset_uIcc hc hs)
    simp only [F, G, dist_eq_norm, intervalIntegral.integral_interval_sub_left (hi x hx) (hi y hy),
      intervalIntegral.integral_interval_sub_left (hi x hx).norm (hi y hy).norm]
    by_cases hyx : y ≤ x
    · exact (intervalIntegral.norm_integral_le_integral_norm hyx).trans (Real.le_norm_self _)
    · rw [intervalIntegral.integral_symm x y, intervalIntegral.integral_symm (f := fun t => ‖f t‖) x y,
        norm_neg, norm_neg]
      exact (intervalIntegral.norm_integral_le_integral_norm (le_of_not_ge hyx)).trans
        (Real.le_norm_self _)
  change AbsolutelyContinuousOnInterval F a b
  rw [absolutelyContinuousOnInterval_iff] at hG ⊢
  intro ε hε
  obtain ⟨δ, hδ, hGδ⟩ := hG ε hε
  refine ⟨δ, hδ, fun E hE hdist => ?_⟩
  apply lt_of_le_of_lt _ (hGδ E hE hdist)
  apply Finset.sum_le_sum
  intro i hi
  exact hpair (hE.1 i hi).1 (hE.1 i hi).2

variable [CompleteSpace V]

-- The integral form of the fundamental theorem also holds in a Banach
-- space when the integrable derivative is supplied.
private theorem cylinder_ac_integral_eq_sub {u velocity : ℝ → V} {a b : ℝ}
    (hu : AbsolutelyContinuousOnInterval u a b)
    (hvelocity : IntervalIntegrable velocity volume a b)
    (hderiv : ∀ᵐ t, t ∈ uIcc a b → HasDerivAt u (velocity t) t) :
    (∫ t in a..b, velocity t) = u b - u a := by
  let F (t : ℝ) := ∫ s in a..t, velocity s
  have hF : AbsolutelyContinuousOnInterval F a b := cylinder_intervalIntegral_ac hvelocity (by simp)
  have hdiff : AbsolutelyContinuousOnInterval (u - F) a b := hu.sub hF
  have hzero : ∀ᵐ t, t ∈ uIcc a b → HasDerivAt (u - F) 0 t := by
    filter_upwards [hderiv, hvelocity.ae_hasDerivAt_integral] with t hut hFt ht
    simpa only [sub_self] using (hut ht).sub (hFt ht a (by simp))
  obtain ⟨C, hC⟩ := hdiff.const_of_ae_hasDerivAt_zero hzero
  have ha : u a = C := by simpa [F, Pi.sub_apply] using hC a (by simp)
  have hb : u b - (∫ t in a..b, velocity t) = C := by
    simpa [F, Pi.sub_apply] using hC b (by simp)
  rw [← ha] at hb
  rw [sub_eq_iff_eq_add.mp hb]
  abel

/-- An absolutely continuous representative with actual square-integrable
value and velocity on the finite interval. -/
structure CylinderModeH1 (length : ℝ) (u velocity : ℝ → V) : Prop where
  absolutelyContinuous : AbsolutelyContinuousOnInterval u 0 length
  value_memLp : MemLp u 2 (volume.restrict (Icc 0 length))
  velocity_memLp : MemLp velocity 2 (volume.restrict (Icc 0 length))
  hasDerivAt_ae : ∀ᵐ t ∂volume.restrict (Icc 0 length), HasDerivAt u (velocity t) t

theorem CylinderModeH1.integral_velocity_eq_sub {length : ℝ} (hlength : 0 ≤ length)
    {u velocity : ℝ → V} (h : CylinderModeH1 length u velocity)
    {a b : ℝ} (ha : a ∈ Icc 0 length) (hb : b ∈ Icc 0 length) :
    (∫ t in a..b, velocity t) = u b - u a := by
  have hsubset : uIcc a b ⊆ uIcc 0 length := by
    rw [uIcc_of_le hlength]
    exact uIcc_subset_Icc ha hb
  apply cylinder_ac_integral_eq_sub (h.absolutelyContinuous.mono hsubset)
    ((cylinder_intervalIntegrable_of_memLp hlength h.velocity_memLp).mono_set hsubset)
  filter_upwards [(ae_restrict_iff' measurableSet_Icc).mp h.hasDerivAt_ae] with t ht hmem
  apply ht
  simpa only [uIcc_of_le hlength] using hsubset hmem

/-- Integration by parts against real (C^1) test functions vanishing
at the two ends identifies the velocity with the weak derivative. -/
theorem CylinderModeH1.weak_derivative {length : ℝ} (hlength : 0 ≤ length)
    {u velocity : ℝ → V} (h : CylinderModeH1 length u velocity)
    {test : ℝ → ℝ} (htest : ContDiff ℝ 1 test) (hleft : test 0 = 0)
    (hright : test length = 0) :
    (∫ t in 0..length, deriv test t • u t) = -(∫ t in 0..length, test t • velocity t) := by
  obtain ⟨_, hlipschitz⟩ := htest.contDiffOn.exists_lipschitzOnWith one_ne_zero
    (convex_uIcc 0 length) isCompact_uIcc
  have hprod := hlipschitz.absolutelyContinuousOnInterval.fun_smul h.absolutelyContinuous
  have htest_lp := continuousOn_memLp_cylinder (length := length)
    htest.continuous.continuousOn ∞
  have htest'_lp := continuousOn_memLp_cylinder (length := length)
    htest.continuous_deriv_one.continuousOn ∞
  have hv := cylinder_intervalIntegrable_of_memLp hlength (htest_lp.smul h.velocity_memLp)
  have hu := cylinder_intervalIntegrable_of_memLp hlength (htest'_lp.smul h.value_memLp)
  have hderiv : ∀ᵐ t, t ∈ uIcc 0 length →
      HasDerivAt (fun s => test s • u s) (test t • velocity t + deriv test t • u t) t := by
    filter_upwards [(ae_restrict_iff' measurableSet_Icc).mp h.hasDerivAt_ae] with t ht ht_mem
    exact ((htest.differentiable one_ne_zero t).hasDerivAt).fun_smul
      (ht (by simpa only [uIcc_of_le hlength] using ht_mem))
  have hFTC := cylinder_ac_integral_eq_sub hprod (hv.add hu) hderiv
  have hsplit := intervalIntegral.integral_add hv hu
  rw [hsplit, hleft, hright, zero_smul, zero_smul, sub_zero] at hFTC
  change (∫ t in 0..length, test t • velocity t) + (∫ t in 0..length, deriv test t • u t) = 0 at hFTC
  exact eq_neg_of_add_eq_zero_left ((add_comm _ _).trans hFTC)

/-- The Bochner formula in `forcedCylinderMode` realizes the incoming
one-mode problem for arbitrary square-integrable forcing. -/
theorem forcedCylinderMode_memH1 {length : ℝ} (hlength : 0 ≤ length)
    (eigenvalue : ℝ) (left right : V) {forcing : ℝ → V}
    (hforcing : MemLp forcing 2 (volume.restrict (Icc 0 length))) :
    CylinderModeH1 length (forcedCylinderMode length eigenvalue left right forcing)
      (fun t => forcing t - eigenvalue • forcedCylinderMode length eigenvalue left right forcing t) := by
  let a := cylinderIncomingEnd length eigenvalue
  let g := if eigenvalue < 0 then right else left
  let weighted (t : ℝ) := Real.exp (eigenvalue * (t - a)) • forcing t
  let u := forcedCylinderMode length eigenvalue left right forcing
  have hint : IntervalIntegrable weighted volume 0 length :=
    cylinder_intervalIntegrable_of_memLp hlength (cylinder_smul_exponential_memLp eigenvalue a hforcing)
  have ha : a ∈ uIcc 0 length := by
    rw [uIcc_of_le hlength]
    exact cylinder_incomingEnd_mem hlength
  have hprimitive := cylinder_intervalIntegral_ac hint ha
  have hconst : LipschitzWith 0 (fun _ : ℝ => g) := fun _ _ => by simp
  have hg : AbsolutelyContinuousOnInterval (fun _ : ℝ => g) 0 length :=
    hconst.lipschitzOnWith.absolutelyContinuousOnInterval
  have hu : AbsolutelyContinuousOnInterval u 0 length :=
    (cylinder_exponential_ac (-eigenvalue) a length).fun_smul (hg.fun_add hprimitive)
  have hu_lp : MemLp u 2 (volume.restrict (Icc 0 length)) :=
    continuousOn_memLp_cylinder (by simpa only [uIcc_of_le hlength] using hu.continuousOn) 2
  refine ⟨hu, hu_lp, hforcing.sub (hu_lp.const_smul eigenvalue), ?_⟩
  apply (ae_restrict_iff' measurableSet_Icc).mpr
  filter_upwards [hint.ae_hasDerivAt_integral] with t ht ht_mem
  have ht' : t ∈ uIcc 0 length := by simpa only [uIcc_of_le hlength] using ht_mem
  have hi := ht ht' a ha
  have hexp := cylinder_exponential_hasDerivAt (-eigenvalue) a t
  refine (hexp.fun_smul (hi.const_add g)).congr_deriv ?_
  have hcancel : Real.exp (-eigenvalue * (t - a)) * Real.exp (eigenvalue * (t - a)) = 1 := by
    rw [← Real.exp_add, show -eigenvalue * (t - a) + eigenvalue * (t - a) = 0 by ring,
      Real.exp_zero]
  change Real.exp (-eigenvalue * (t - a)) • (Real.exp (eigenvalue * (t - a)) • forcing t) +
      (-eigenvalue * Real.exp (-eigenvalue * (t - a))) • (g + ∫ s in a..t, weighted s) =
        forcing t - eigenvalue • u t
  rw [← mul_smul, hcancel, one_smul, mul_smul, neg_smul]
  exact (sub_eq_add_neg _ _).symm

theorem forcedCylinderMode_hasDerivAt_ae {length : ℝ} (hlength : 0 ≤ length)
    (eigenvalue : ℝ) (left right : V) {forcing : ℝ → V}
    (hforcing : MemLp forcing 2 (volume.restrict (Icc 0 length))) :
    ∀ᵐ t ∂volume.restrict (Icc 0 length),
      HasDerivAt (forcedCylinderMode length eigenvalue left right forcing)
        (forcing t - eigenvalue • forcedCylinderMode length eigenvalue left right forcing t) t :=
  (forcedCylinderMode_memH1 hlength eigenvalue left right hforcing).hasDerivAt_ae

/-- The prescribed incoming endpoint characterizes the absolutely
continuous solution of the almost-everywhere mode equation. -/
theorem forcedCylinderMode_eqOn_of_equation {length : ℝ} (hlength : 0 ≤ length)
    (eigenvalue : ℝ) (left right : V) {forcing u : ℝ → V}
    (hforcing : MemLp forcing 2 (volume.restrict (Icc 0 length)))
    (hu : AbsolutelyContinuousOnInterval u 0 length)
    (hderiv : ∀ᵐ t ∂volume.restrict (Icc 0 length),
      HasDerivAt u (forcing t - eigenvalue • u t) t)
    (htrace : u (cylinderIncomingEnd length eigenvalue) = if eigenvalue < 0 then right else left) :
    EqOn u (forcedCylinderMode length eigenvalue left right forcing) (Icc 0 length) := by
  let a := cylinderIncomingEnd length eigenvalue
  let v := forcedCylinderMode length eigenvalue left right forcing
  have hv := forcedCylinderMode_memH1 hlength eigenvalue left right hforcing
  let weighted (t : ℝ) := Real.exp (eigenvalue * (t - a)) • (u t - v t)
  have hweighted : AbsolutelyContinuousOnInterval weighted 0 length :=
    (cylinder_exponential_ac eigenvalue a length).fun_smul (hu.fun_sub hv.absolutelyContinuous)
  have hzero : ∀ᵐ t, t ∈ uIcc 0 length → HasDerivAt weighted 0 t := by
    filter_upwards [(ae_restrict_iff' measurableSet_Icc).mp hderiv,
      (ae_restrict_iff' measurableSet_Icc).mp hv.hasDerivAt_ae] with t hut hvt ht
    rw [uIcc_of_le hlength] at ht
    have hd := (hut ht).sub (hvt ht)
    have hd' : HasDerivAt (fun t => u t - v t) (-(eigenvalue • (u t - v t))) t := by
      refine hd.congr_deriv ?_
      rw [smul_sub]
      abel
    refine ((cylinder_exponential_hasDerivAt eigenvalue a t).fun_smul hd').congr_deriv ?_
    rw [smul_neg, ← mul_smul, mul_comm (Real.exp (eigenvalue * (t - a))) eigenvalue,
      neg_add_cancel]
  obtain ⟨C, hC⟩ := hweighted.const_of_ae_hasDerivAt_zero hzero
  have ha : a ∈ uIcc 0 length := by
    rw [uIcc_of_le hlength]
    exact cylinder_incomingEnd_mem hlength
  have hCa : C = 0 := by
    rw [← hC a ha]
    simp [weighted, v, a, htrace]
  intro t ht
  have heq := hC t (by simpa only [uIcc_of_le hlength] using ht)
  rw [hCa] at heq
  exact sub_eq_zero.mp ((smul_eq_zero.mp heq).resolve_left (Real.exp_pos _).ne')

omit [CompleteSpace V] in
/-- The incoming solution on the closed interval depends only on the
almost-everywhere class of the forcing. -/
theorem forcedCylinderMode_forcing_congr {length : ℝ} (hlength : 0 ≤ length)
    (eigenvalue : ℝ) (left right : V) {forcing other : ℝ → V}
    (hforcing : forcing =ᵐ[volume.restrict (Icc 0 length)] other) :
    EqOn (forcedCylinderMode length eigenvalue left right forcing)
      (forcedCylinderMode length eigenvalue left right other) (Icc 0 length) := by
  intro t ht
  let a := cylinderIncomingEnd length eigenvalue
  have ha : a ∈ Icc 0 length := cylinder_incomingEnd_mem hlength
  have hs : uIoc a t ⊆ Icc 0 length := uIoc_subset_uIcc.trans (uIcc_subset_Icc ha ht)
  have hsub : forcing =ᵐ[volume.restrict (uIoc a t)] other :=
    ae_mono (Measure.restrict_mono hs (le_refl volume)) hforcing
  have hi := intervalIntegral.integral_congr_ae_restrict
    (hsub.mono fun x hx => congrArg (fun y => Real.exp (eigenvalue * (x - a)) • y) hx)
  simp only [forcedCylinderMode, ← hi, a]

end BanachModes

section HilbertModes

variable {V : Type*} [NormedAddCommGroup V] [InnerProductSpace ℝ V]

/-- The exact signed energy identity for a square-integrable one-mode
velocity and its absolutely continuous representative. -/
theorem CylinderModeH1.energy_balance {length : ℝ} (hlength : 0 ≤ length)
    (eigenvalue : ℝ) {u velocity : ℝ → V} (h : CylinderModeH1 length u velocity) :
    (∫ t in 0..length, ‖velocity t‖ ^ 2 + eigenvalue ^ 2 * ‖u t‖ ^ 2) +
        |eigenvalue| * ‖u (cylinderOutgoingEnd length eigenvalue)‖ ^ 2 =
      (∫ t in 0..length, ‖velocity t + eigenvalue • u t‖ ^ 2) +
        |eigenvalue| * ‖u (cylinderIncomingEnd length eigenvalue)‖ ^ 2 := by
  let ν := volume.restrict (Icc (0 : ℝ) length)
  have interval_of_integrable {f : ℝ → ℝ} (hf : Integrable f ν) :
      IntervalIntegrable f volume 0 length := by
    apply intervalIntegrable_iff.mpr
    rw [uIoc_of_le hlength]
    exact IntegrableOn.mono_set hf Ioc_subset_Icc_self
  have hv_sq := interval_of_integrable
    ((memLp_two_iff_integrable_sq_norm h.velocity_memLp.aestronglyMeasurable).mp h.velocity_memLp)
  have hu_sq := interval_of_integrable
    ((memLp_two_iff_integrable_sq_norm h.value_memLp.aestronglyMeasurable).mp h.value_memLp)
  have hpoint : Integrable (fun t => ⟪u t, velocity t⟫_ℝ) ν := by
    apply (h.value_memLp.norm.integrable_mul h.velocity_memLp.norm).mono'
      (h.value_memLp.aestronglyMeasurable.inner h.velocity_memLp.aestronglyMeasurable)
    exact ae_of_all _ fun t => norm_inner_le_norm _ _
  have hcross : IntervalIntegrable (fun t => 2 * ⟪u t, velocity t⟫_ℝ) volume 0 length :=
    (interval_of_integrable hpoint).const_mul 2
  have hlip_norm : LipschitzWith 1 (norm : V → ℝ) := LipschitzWith.of_dist_le_mul fun x y => by
    rw [NNReal.coe_one, one_mul, Real.dist_eq]
    exact (abs_norm_sub_norm_le x y).trans_eq (dist_eq_norm x y).symm
  have hnorm := hlip_norm.comp_absolutelyContinuousOnInterval h.absolutelyContinuous
  have hsquare : AbsolutelyContinuousOnInterval (fun t => ‖u t‖ ^ 2) 0 length := by
    simpa [pow_two] using hnorm.fun_mul hnorm
  have hderiv : ∀ᵐ t, t ∈ uIcc 0 length →
      HasDerivAt (fun s => ‖u s‖ ^ 2) (2 * ⟪u t, velocity t⟫_ℝ) t := by
    filter_upwards [(ae_restrict_iff' measurableSet_Icc).mp h.hasDerivAt_ae] with t ht ht_mem
    exact (ht (by simpa only [uIcc_of_le hlength] using ht_mem)).norm_sq
  have hftc := cylinder_ac_integral_eq_sub hsquare hcross hderiv
  have hsplit :
      (∫ t in 0..length, ‖velocity t + eigenvalue • u t‖ ^ 2) =
        (∫ t in 0..length, ‖velocity t‖ ^ 2 + eigenvalue ^ 2 * ‖u t‖ ^ 2) +
        eigenvalue * (‖u length‖ ^ 2 - ‖u 0‖ ^ 2) := by
    have hsum (t : ℝ) :
        ‖velocity t + eigenvalue • u t‖ ^ 2 =
          ‖velocity t‖ ^ 2 + eigenvalue ^ 2 * ‖u t‖ ^ 2 +
            eigenvalue * (2 * ⟪u t, velocity t⟫_ℝ) := by
      rw [norm_add_sq_real, norm_smul, mul_pow, Real.norm_eq_abs, sq_abs,
        real_inner_smul_right, real_inner_comm (velocity t) (u t)]
      ring
    rw [intervalIntegral.integral_congr (fun t _ => hsum t),
      intervalIntegral.integral_add (hv_sq.add (hu_sq.const_mul (eigenvalue ^ 2)))
        (hcross.const_mul eigenvalue),
      intervalIntegral.integral_const_mul, hftc]
  rw [hsplit]
  by_cases hneg : eigenvalue < 0
  · rw [cylinderOutgoingEnd, cylinderIncomingEnd, ite_eq_left hneg, ite_eq_left hneg,
      abs_of_neg hneg]
    ring
  · rw [cylinderOutgoingEnd, cylinderIncomingEnd, ite_eq_right hneg, ite_eq_right hneg,
      abs_of_nonneg (le_of_not_gt hneg)]
    ring

/-- For the incoming solution, the bulk graph energy and the outgoing
trace energy sum exactly to the forcing and incoming trace energies. -/
theorem forcedCylinderMode_weak_energy_balance [CompleteSpace V] {length : ℝ}
    (hlength : 0 ≤ length) (eigenvalue : ℝ) (left right : V) {forcing : ℝ → V}
    (hforcing : MemLp forcing 2 (volume.restrict (Icc 0 length))) :
    let u := forcedCylinderMode length eigenvalue left right forcing
    let velocity (t : ℝ) := forcing t - eigenvalue • u t
    (∫ t in 0..length, ‖velocity t‖ ^ 2 + eigenvalue ^ 2 * ‖u t‖ ^ 2) +
        |eigenvalue| * ‖u (cylinderOutgoingEnd length eigenvalue)‖ ^ 2 =
      (∫ t in 0..length, ‖forcing t‖ ^ 2) +
        |eigenvalue| * ‖if eigenvalue < 0 then right else left‖ ^ 2 := by
  simpa only [sub_add_cancel, forcedCylinderMode_at_incoming] using
    (forcedCylinderMode_memH1 hlength eigenvalue left right hforcing).energy_balance hlength eigenvalue

/-- The full modal graph norm, including the bulk (L^2) term, has a
length-independent bound under the unit-round spectral gap. -/
theorem forcedCylinderMode_weak_graphEnergy_le [CompleteSpace V] {length eigenvalue : ℝ}
    (hlength : 0 ≤ length) (hgap : (3 : ℝ) / 2 ≤ |eigenvalue|)
    (left right : V) {forcing : ℝ → V}
    (hforcing : MemLp forcing 2 (volume.restrict (Icc 0 length))) :
    let u := forcedCylinderMode length eigenvalue left right forcing
    let velocity (t : ℝ) := forcing t - eigenvalue • u t
    (∫ t in 0..length, ‖velocity t‖ ^ 2 + (1 + eigenvalue ^ 2) * ‖u t‖ ^ 2) ≤
      (13 / 9 : ℝ) * ((∫ t in 0..length, ‖forcing t‖ ^ 2) +
        |eigenvalue| * ‖if eigenvalue < 0 then right else left‖ ^ 2) := by
  intro u velocity
  let ν := volume.restrict (Icc (0 : ℝ) length)
  have hu := forcedCylinderMode_memH1 hlength eigenvalue left right hforcing
  have interval_of_memLp {f : ℝ → V} (hf : MemLp f 2 ν) :
      IntervalIntegrable (fun t => ‖f t‖ ^ 2) volume 0 length := by
    apply intervalIntegrable_iff.mpr
    rw [uIoc_of_le hlength]
    exact IntegrableOn.mono_set
      ((memLp_two_iff_integrable_sq_norm hf.aestronglyMeasurable).mp hf) Ioc_subset_Icc_self
  have hu_sq : IntervalIntegrable (fun t => ‖u t‖ ^ 2) volume 0 length :=
    interval_of_memLp hu.value_memLp
  have hv_sq : IntervalIntegrable (fun t => ‖velocity t‖ ^ 2) volume 0 length :=
    interval_of_memLp hu.velocity_memLp
  have hcoef : 1 + eigenvalue ^ 2 ≤ (13 / 9 : ℝ) * eigenvalue ^ 2 := by
    have hgap_sq := (sq_le_sq₀ (by norm_num : (0 : ℝ) ≤ 3 / 2) (abs_nonneg eigenvalue)).mpr hgap
    rw [sq_abs] at hgap_sq
    linarith only [hgap_sq]
  have hbulk :=
    hv_sq.add (hu_sq.const_mul (eigenvalue ^ 2))
  have hcomparison :
      (∫ t in 0..length, ‖velocity t‖ ^ 2 + (1 + eigenvalue ^ 2) * ‖u t‖ ^ 2) ≤
        (13 / 9 : ℝ) * (∫ t in 0..length, ‖velocity t‖ ^ 2 + eigenvalue ^ 2 * ‖u t‖ ^ 2) := by
    rw [← intervalIntegral.integral_const_mul]
    apply intervalIntegral.integral_mono_on hlength
      (hv_sq.add (hu_sq.const_mul (1 + eigenvalue ^ 2))) (hbulk.const_mul (13 / 9))
    intro t _
    nlinarith only [mul_le_mul_of_nonneg_right hcoef (sq_nonneg ‖u t‖),
      sq_nonneg ‖velocity t‖]
  refine hcomparison.trans (mul_le_mul_of_nonneg_left ?_ (by norm_num))
  have he := forcedCylinderMode_weak_energy_balance hlength eigenvalue left right hforcing
  change (∫ t in 0..length, ‖velocity t‖ ^ 2 + eigenvalue ^ 2 * ‖u t‖ ^ 2) +
    |eigenvalue| * ‖u (cylinderOutgoingEnd length eigenvalue)‖ ^ 2 =
      (∫ t in 0..length, ‖forcing t‖ ^ 2) +
        |eigenvalue| * ‖if eigenvalue < 0 then right else left‖ ^ 2 at he
  linarith only [he,
    mul_nonneg (abs_nonneg eigenvalue) (sq_nonneg ‖u (cylinderOutgoingEnd length eigenvalue)‖)]

end HilbertModes

end FirstOrderTwistor
