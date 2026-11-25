import Mathlib.Analysis.InnerProductSpace.Calculus
import Mathlib.Analysis.Normed.Operator.Banach
import Mathlib.Analysis.Normed.Ring.Units
import Mathlib.Analysis.SpecialFunctions.ExpDeriv
import Mathlib.MeasureTheory.Integral.IntervalIntegral.FundThmCalculus

/-!
# Signed cylinder modes and fixed-domain perturbation

Analytic portions of FOT-E22a, E24a and E33a for Edward B. Baker III, prepared
2026-11-25 with OpenAI Codex assistance at checkout 5ff7014. The actual model
variant and reasoning effort are unavailable. Inputs are MATCH-E01, E02
and E09 in the Dirac collar matching notes.

The positive and negative modal eigenvalues use the common increasing
normal of those notes. The cylinder results here concern coefficient
functions, with spherical eigenvalues supplied as real numbers. The
perturbation uses a continuous linear equivalence supplied on one fixed
domain and target.
-/

open scoped BigOperators InnerProductSpace
open MeasureTheory

namespace FirstOrderTwistor

section Modes

variable {V : Type*} [NormedAddCommGroup V] [NormedSpace ℝ V]

/-- Positive modes enter at the left and negative modes enter at the right. -/
noncomputable def cylinderIncomingEnd (length eigenvalue : ℝ) : ℝ :=
  if eigenvalue < 0 then length else 0

/-- The endpoint complementary to the chosen incoming end. -/
noncomputable def cylinderOutgoingEnd (length eigenvalue : ℝ) : ℝ :=
  if eigenvalue < 0 then 0 else length

/-- Homogeneous propagation for one mode of the reference operator
`∂ₜ + A`. Each sign uses its own supplied incoming coefficient. -/
noncomputable def roundCylinderMode (length eigenvalue : ℝ) (left right : V) (t : ℝ) : V :=
  Real.exp (-eigenvalue * (t - cylinderIncomingEnd length eigenvalue)) •
    (if eigenvalue < 0 then right else left)

@[simp]
theorem roundCylinderMode_at_incoming (length eigenvalue : ℝ) (left right : V) :
    roundCylinderMode length eigenvalue left right (cylinderIncomingEnd length eigenvalue) =
      if eigenvalue < 0 then right else left := by
  simp [roundCylinderMode]

theorem roundCylinderMode_hasDerivAt (length eigenvalue : ℝ) (left right : V) (t : ℝ) :
    HasDerivAt (roundCylinderMode length eigenvalue left right)
      ((-eigenvalue) • roundCylinderMode length eigenvalue left right t) t := by
  have hx := (((hasDerivAt_id' t).sub_const
    (cylinderIncomingEnd length eigenvalue)).const_mul (-eigenvalue)).exp
  change HasDerivAt
    (fun y => Real.exp (-eigenvalue * (y - cylinderIncomingEnd length eigenvalue)) •
      (if eigenvalue < 0 then right else left))
    ((-eigenvalue) • roundCylinderMode length eigenvalue left right t) t
  simpa only [roundCylinderMode, mul_one, mul_comm _ (-eigenvalue), mul_smul] using
    hx.smul_const (if eigenvalue < 0 then right else left)

theorem roundCylinderMode_equation (length eigenvalue : ℝ) (left right : V) (t : ℝ) :
    deriv (roundCylinderMode length eigenvalue left right) t +
      eigenvalue • roundCylinderMode length eigenvalue left right t = 0 := by
  rw [(roundCylinderMode_hasDerivAt length eigenvalue left right t).deriv]
  simp

/-- Bär's unit three-sphere spectral values `±(3/2+k)` give the gap in the
modal estimates. The spectral assertion itself is an input. -/
theorem roundCylinderGap_of_signedSpectrum {eigenvalue : ℝ}
    (h : ∃ k : ℕ, eigenvalue = 3 / 2 + k ∨ eigenvalue = -(3 / 2 + k)) :
    (3 : ℝ) / 2 ≤ |eigenvalue| := by
  obtain ⟨k, h | h⟩ := h
  · rw [h, abs_of_nonneg (by positivity)]
    linarith [Nat.cast_nonneg (α := ℝ) k]
  · rw [h, abs_neg, abs_of_nonneg (by positivity)]
    linarith [Nat.cast_nonneg (α := ℝ) k]

/-- Decay from both incoming ends when the tested point is at least
distance `d` from each, with the unit round spectral gap. -/
theorem norm_roundCylinderMode_le {length eigenvalue d t : ℝ} (left right : V)
    (hgap : (3 : ℝ) / 2 ≤ |eigenvalue|) (hd : 0 ≤ d) (hleft : d ≤ t)
    (hright : d ≤ length - t) :
    ‖roundCylinderMode length eigenvalue left right t‖ ≤
      Real.exp (-(3 / 2) * d) * ‖if eigenvalue < 0 then right else left‖ := by
  simp only [roundCylinderMode, norm_smul, Real.norm_eq_abs,
    abs_of_pos (Real.exp_pos _)]
  apply mul_le_mul_of_nonneg_right _ (norm_nonneg _)
  apply Real.exp_le_exp.mpr
  by_cases hneg : eigenvalue < 0
  · rw [cylinderIncomingEnd, ite_eq_left hneg]
    rw [abs_of_neg hneg] at hgap
    calc
      -eigenvalue * (t - length) = -((-eigenvalue) * (length - t)) := by ring
      _ ≤ -((3 / 2) * d) :=
        neg_le_neg (mul_le_mul hgap hright hd (by positivity))
      _ = -(3 / 2) * d := by ring
  · rw [cylinderIncomingEnd, ite_eq_right hneg, sub_zero]
    rw [abs_of_nonneg (le_of_not_gt hneg)] at hgap
    calc
      -eigenvalue * t = -(eigenvalue * t) := by ring
      _ ≤ -((3 / 2) * d) :=
        neg_le_neg (mul_le_mul hgap hleft hd (le_of_not_gt hneg))
      _ = -(3 / 2) * d := by ring

/-- The trace transferred across the entire cylinder in a single mode. -/
theorem roundCylinderMode_at_outgoing (length eigenvalue : ℝ) (left right : V) :
    roundCylinderMode length eigenvalue left right (cylinderOutgoingEnd length eigenvalue) =
      Real.exp (-|eigenvalue| * length) • (if eigenvalue < 0 then right else left) := by
  unfold roundCylinderMode cylinderIncomingEnd cylinderOutgoingEnd
  by_cases hneg : eigenvalue < 0
  · rw [ite_eq_left hneg, ite_eq_left hneg, abs_of_neg hneg]
    congr 2
    ring
  · rw [ite_eq_right hneg, ite_eq_right hneg, abs_of_nonneg (le_of_not_gt hneg), sub_zero]

/-- Squared round spectral trace norm on every finite family, with both
incoming traces supplied and outgoing traces at the corresponding opposite
ends. Weights are `|λ|`, as in the reference `H^(1/2)` norm. -/
theorem roundCylinder_outgoingTrace_sq_le {ι : Type*} (modes : Finset ι)
    {length : ℝ} (hlength : 0 ≤ length) (eigenvalue : ι → ℝ) (left right : ι → V)
    (hgap : ∀ i ∈ modes, (3 : ℝ) / 2 ≤ |eigenvalue i|) :
    (∑ i ∈ modes, |eigenvalue i| *
      ‖roundCylinderMode length (eigenvalue i) (left i) (right i)
        (cylinderOutgoingEnd length (eigenvalue i))‖ ^ 2) ≤
      Real.exp (-3 * length) *
        ∑ i ∈ modes, |eigenvalue i| * ‖if eigenvalue i < 0 then right i else left i‖ ^ 2 := by
  rw [Finset.mul_sum]
  apply Finset.sum_le_sum
  intro i hi
  rw [roundCylinderMode_at_outgoing, norm_smul, Real.norm_eq_abs,
    abs_of_pos (Real.exp_pos _), mul_pow]
  have hexp : Real.exp (-|eigenvalue i| * length) ^ 2 ≤ Real.exp (-3 * length) := by
    rw [pow_two, ← Real.exp_add]
    exact Real.exp_le_exp.mpr (by nlinarith [mul_le_mul_of_nonneg_right (hgap i hi) hlength])
  calc
    |eigenvalue i| * (Real.exp (-|eigenvalue i| * length) ^ 2 *
        ‖if eigenvalue i < 0 then right i else left i‖ ^ 2) =
      Real.exp (-|eigenvalue i| * length) ^ 2 *
        (|eigenvalue i| * ‖if eigenvalue i < 0 then right i else left i‖ ^ 2) := by ring
    _ ≤ _ := mul_le_mul_of_nonneg_right hexp (by positivity)

/-- Integrating-factor solution with continuous coefficient forcing.
The oriented interval of integration implements backward evolution for
negative modes. -/
noncomputable def forcedCylinderMode (length eigenvalue : ℝ) (left right : V)
    (forcing : ℝ → V) (t : ℝ) : V :=
  let a := cylinderIncomingEnd length eigenvalue
  Real.exp (-eigenvalue * (t - a)) •
    ((if eigenvalue < 0 then right else left) +
      ∫ s in a..t, Real.exp (eigenvalue * (s - a)) • forcing s)

@[simp]
theorem forcedCylinderMode_at_incoming (length eigenvalue : ℝ) (left right : V)
    (forcing : ℝ → V) :
    forcedCylinderMode length eigenvalue left right forcing
      (cylinderIncomingEnd length eigenvalue) =
      if eigenvalue < 0 then right else left := by
  simp [forcedCylinderMode]

theorem forcedCylinderMode_hasDerivAt [CompleteSpace V]
    (length eigenvalue : ℝ) (left right : V)
    {forcing : ℝ → V} (hforcing : Continuous forcing) (t : ℝ) :
    HasDerivAt (forcedCylinderMode length eigenvalue left right forcing)
      (forcing t - eigenvalue • forcedCylinderMode length eigenvalue left right forcing t) t := by
  let a := cylinderIncomingEnd length eigenvalue
  have hcontinuous : Continuous (fun s : ℝ => Real.exp (eigenvalue * (s - a)) • forcing s) :=
    (Real.continuous_exp.comp (continuous_const.mul (continuous_id.sub continuous_const))).smul
      hforcing
  have hintegral := intervalIntegral.integral_hasDerivAt_right (hcontinuous.intervalIntegrable a t)
    hcontinuous.aestronglyMeasurable.stronglyMeasurableAtFilter hcontinuous.continuousAt
  have hexp := (((hasDerivAt_id' t).sub_const a).const_mul (-eigenvalue)).exp
  have hprod := hexp.fun_smul (hintegral.const_add (if eigenvalue < 0 then right else left))
  refine hprod.congr_deriv ?_
  have hcancel : Real.exp (-eigenvalue * (t - a)) *
      Real.exp (eigenvalue * (t - a)) = 1 := by
    rw [← Real.exp_add, show -eigenvalue * (t - a) + eigenvalue * (t - a) = 0 by ring,
      Real.exp_zero]
  rw [← mul_smul, hcancel, one_smul, mul_one,
    mul_comm _ (-eigenvalue), mul_smul, neg_smul]
  simp only [forcedCylinderMode, a, sub_eq_add_neg]

theorem forcedCylinderMode_equation [CompleteSpace V]
    (length eigenvalue : ℝ) (left right : V)
    {forcing : ℝ → V} (hforcing : Continuous forcing) (t : ℝ) :
    deriv (forcedCylinderMode length eigenvalue left right forcing) t +
      eigenvalue • forcedCylinderMode length eigenvalue left right forcing t = forcing t := by
  rw [(forcedCylinderMode_hasDerivAt length eigenvalue left right hforcing t).deriv]
  exact sub_add_cancel _ _

end Modes

section ModeEnergy

variable {V : Type*} [NormedAddCommGroup V] [InnerProductSpace ℝ V]

/-- For one differentiable mode with continuous velocity, integration of
the cross term puts the outgoing trace on the side of the bulk energy.
The sign of the eigenvalue determines which end contributes that term. -/
theorem cylinderMode_energy_balance (length eigenvalue : ℝ) {u velocity : ℝ → V}
    (hvelocity : ∀ t, HasDerivAt u (velocity t) t) (hcontinuous : Continuous velocity) :
    (∫ t in 0..length, ‖velocity t‖ ^ 2 + eigenvalue ^ 2 * ‖u t‖ ^ 2) +
        |eigenvalue| * ‖u (cylinderOutgoingEnd length eigenvalue)‖ ^ 2 =
      (∫ t in 0..length, ‖velocity t + eigenvalue • u t‖ ^ 2) +
        |eigenvalue| * ‖u (cylinderIncomingEnd length eigenvalue)‖ ^ 2 := by
  have hu : Continuous u := continuous_iff_continuousAt.mpr fun t =>
    (hvelocity t).continuousAt
  have hbulk : Continuous (fun t => ‖velocity t‖ ^ 2 + eigenvalue ^ 2 * ‖u t‖ ^ 2) :=
    (hcontinuous.norm.pow 2).add (continuous_const.mul (hu.norm.pow 2))
  have hcross : Continuous (fun t => 2 * ⟪u t, velocity t⟫_ℝ) :=
    continuous_const.mul (hu.inner hcontinuous)
  have hftc : (∫ t in 0..length, 2 * ⟪u t, velocity t⟫_ℝ) =
      ‖u length‖ ^ 2 - ‖u 0‖ ^ 2 :=
    intervalIntegral.integral_eq_sub_of_hasDerivAt
      (fun t _ => (hvelocity t).norm_sq) (hcross.intervalIntegrable _ _)
  have hsplit :
      (∫ t in 0..length, ‖velocity t + eigenvalue • u t‖ ^ 2) =
        (∫ t in 0..length, ‖velocity t‖ ^ 2 + eigenvalue ^ 2 * ‖u t‖ ^ 2) +
        eigenvalue * (‖u length‖ ^ 2 - ‖u 0‖ ^ 2) := by
    have hpoint (t : ℝ) :
        ‖velocity t + eigenvalue • u t‖ ^ 2 =
          ‖velocity t‖ ^ 2 + eigenvalue ^ 2 * ‖u t‖ ^ 2 +
            eigenvalue * (2 * ⟪u t, velocity t⟫_ℝ) := by
      rw [norm_add_sq_real, norm_smul, mul_pow, Real.norm_eq_abs, sq_abs,
        real_inner_smul_right, real_inner_comm (velocity t) (u t)]
      ring
    have hweightedCross : Continuous (fun t => eigenvalue * (2 * ⟪u t, velocity t⟫_ℝ)) :=
      continuous_const.mul hcross
    rw [intervalIntegral.integral_congr (fun t _ => hpoint t),
      intervalIntegral.integral_add (hbulk.intervalIntegrable _ _)
        (hweightedCross.intervalIntegrable _ _),
      intervalIntegral.integral_const_mul, hftc]
  rw [hsplit]
  by_cases hneg : eigenvalue < 0
  · rw [cylinderOutgoingEnd, cylinderIncomingEnd, ite_eq_left hneg, ite_eq_left hneg,
      abs_of_neg hneg]
    ring
  · rw [cylinderOutgoingEnd, cylinderIncomingEnd, ite_eq_right hneg, ite_eq_right hneg,
      abs_of_nonneg (le_of_not_gt hneg)]
    ring

end ModeEnergy

section Weighted

variable {V : Type*} [NormedAddCommGroup V] [NormedSpace ℝ V]

/-- Classical product rule for exponential conjugation in the product
normal form. A varying tangential operator is evaluated at the tested
point. -/
theorem cylinder_weighted_equation {weight : ℝ → ℝ} {field : ℝ → V}
    {t weightVelocity : ℝ} {velocity : V} (tangential : V →L[ℝ] V)
    (hweight : HasDerivAt weight weightVelocity t) (hfield : HasDerivAt field velocity t) :
    deriv (fun s => Real.exp (weight s) • field s) t +
      tangential (Real.exp (weight t) • field t) =
        Real.exp (weight t) • (velocity + tangential (field t)) +
          weightVelocity • (Real.exp (weight t) • field t) := by
  rw [(hweight.exp.fun_smul hfield).deriv, map_smul, smul_add,
    mul_comm (Real.exp (weight t)) weightVelocity, mul_smul]
  abel

variable {X Y T : Type*} [NormedAddCommGroup X] [NormedSpace ℝ X]
  [NormedAddCommGroup Y] [NormedSpace ℝ Y] [NormedAddCommGroup T] [NormedSpace ℝ T]

/-- The weighted coercive estimate of MATCH-E09, after supplying the base
incoming estimate and the conjugated equation. The commutator bound may
use any uniform bound `b` for the normal coefficient. This statement
also applies when the conjugated equation was proved weakly. -/
theorem diracWeighted_norm_le (operator commutator : X →L[ℝ] Y)
    (incoming : X →L[ℝ] T) {C b τ : ℝ} (hC : 0 ≤ C)
    (hsmall : C * b * τ < 1) (hcommutator : ‖commutator‖ ≤ b * τ)
    (hbase : ∀ x, ‖x‖ ≤ C * (‖operator x‖ + ‖incoming x‖))
    (weighted : X) (weightedForcing : Y)
    (hequation : operator weighted = weightedForcing + commutator weighted) :
    ‖weighted‖ ≤ C / (1 - C * b * τ) * (‖weightedForcing‖ + ‖incoming weighted‖) := by
  have hnorm : ‖operator weighted‖ ≤ ‖weightedForcing‖ + b * τ * ‖weighted‖ := by
    rw [hequation]
    exact (norm_add_le _ _).trans (add_le_add le_rfl
      (commutator.le_of_opNorm_le hcommutator weighted))
  have hbound : ‖weighted‖ ≤
      C * (‖weightedForcing‖ + b * τ * ‖weighted‖ + ‖incoming weighted‖) :=
    (hbase weighted).trans (mul_le_mul_of_nonneg_left (add_le_add hnorm le_rfl) hC)
  rw [div_mul_eq_mul_div, le_div_iff₀ (by linarith : 0 < 1 - C * b * τ)]
  linarith only [hbound]

/-- One-sided attenuation after conjugation. The weighted incoming trace
lies at the unweighted end, and the remote outgoing trace is multiplied
by `exp(τ * length)`. -/
theorem diracWeighted_remoteTrace_norm_le
    {O : Type*} [NormedAddCommGroup O] [NormedSpace ℝ O]
    (operator commutator : X →L[ℝ] Y) (incoming : X →L[ℝ] T) (outgoing : X →L[ℝ] O)
    {C b τ length traceConstant : ℝ} (hC : 0 ≤ C)
    (hsmall : C * b * τ < 1) (hcommutator : ‖commutator‖ ≤ b * τ)
    (hbase : ∀ x, ‖x‖ ≤ C * (‖operator x‖ + ‖incoming x‖))
    (htraceBound : ‖outgoing‖ ≤ traceConstant)
    (weighted : X) (remote : O)
    (hequation : operator weighted = commutator weighted)
    (htrace : outgoing weighted = Real.exp (τ * length) • remote) :
    ‖remote‖ ≤ traceConstant * (C / (1 - C * b * τ)) *
      Real.exp (-(τ * length)) * ‖incoming weighted‖ := by
  have hweighted : ‖weighted‖ ≤ C / (1 - C * b * τ) * ‖incoming weighted‖ := by
    simpa using diracWeighted_norm_le operator commutator incoming hC hsmall hcommutator
      hbase weighted 0 (by simpa using hequation)
  have hbound : Real.exp (τ * length) * ‖remote‖ ≤
      traceConstant * (C / (1 - C * b * τ) * ‖incoming weighted‖) := by
    have h := (outgoing.le_of_opNorm_le htraceBound weighted).trans
      (mul_le_mul_of_nonneg_left hweighted ((norm_nonneg _).trans htraceBound))
    simpa only [htrace, norm_smul, Real.norm_eq_abs, abs_of_pos (Real.exp_pos _)] using h
  apply le_of_mul_le_mul_left _ (Real.exp_pos (τ * length))
  have hexp : Real.exp (τ * length) * Real.exp (-(τ * length)) = 1 := by
    rw [← Real.exp_add, add_neg_cancel, Real.exp_zero]
  calc
    _ ≤ traceConstant * (C / (1 - C * b * τ) * ‖incoming weighted‖) := hbound
    _ = (Real.exp (τ * length) * Real.exp (-(τ * length))) *
        (traceConstant * (C / (1 - C * b * τ) * ‖incoming weighted‖)) := by
      rw [hexp, one_mul]
    _ = _ := by ring

end Weighted

section FixedDomain

variable {X Y : Type*} [NormedAddCommGroup X] [NormedSpace ℝ X]
  [NormedAddCommGroup Y] [NormedSpace ℝ Y] [CompleteSpace Y]

/-- Neumann inversion on the fixed target of a reference equivalence.
The domain and target can be the zero-incoming problem or the full
problem with the prescribed traces included in the target. -/
noncomputable def fixedDomainDiracPerturbation (reference : X ≃L[ℝ] Y)
    (difference : X →L[ℝ] Y)
    (hsmall : ‖difference‖ * ‖(reference.symm : Y →L[ℝ] X)‖ < 1) :
    X ≃L[ℝ] Y :=
  reference.trans (ContinuousLinearEquiv.ofUnit
    (Units.oneSub (-(difference.comp (reference.symm : Y →L[ℝ] X))) (by
      rw [norm_neg]
      exact (difference.opNorm_comp_le (reference.symm : Y →L[ℝ] X)).trans_lt hsmall)))

@[simp]
theorem fixedDomainDiracPerturbation_apply (reference : X ≃L[ℝ] Y)
    (difference : X →L[ℝ] Y)
    (hsmall : ‖difference‖ * ‖(reference.symm : Y →L[ℝ] X)‖ < 1) (x : X) :
    fixedDomainDiracPerturbation reference difference hsmall x = reference x + difference x := by
  change ((1 - -(difference.comp (reference.symm : Y →L[ℝ] X))) : Y →L[ℝ] Y) (reference x) = _
  simp

/-- A quantitative inverse bound using a supplied upper bound `C` for the
reference inverse and a perturbation bound `δ`. In particular, `C = 1`
gives the constant `1/(1-δ)` from MATCH-E02. -/
theorem fixedDomainDiracPerturbation_inverse_norm_le
    (reference : X ≃L[ℝ] Y) (difference : X →L[ℝ] Y)
    {C δ : ℝ} (hC : ‖(reference.symm : Y →L[ℝ] X)‖ ≤ C)
    (hδ : ‖difference‖ ≤ δ) (hsmall : δ * C < 1) :
    ∃ solution : X ≃L[ℝ] Y,
      (∀ x, solution x = reference x + difference x) ∧
      ‖(solution.symm : Y →L[ℝ] X)‖ ≤ C / (1 - δ * C) := by
  have hC₀ := (norm_nonneg _).trans hC
  have hδ₀ := (norm_nonneg _).trans hδ
  have hproduct := (mul_le_mul hδ hC (norm_nonneg _) hδ₀).trans_lt hsmall
  let solution := fixedDomainDiracPerturbation reference difference hproduct
  refine ⟨solution, fixedDomainDiracPerturbation_apply reference difference hproduct, ?_⟩
  apply ContinuousLinearMap.opNorm_le_bound _ (div_nonneg hC₀ (by linarith))
  intro y
  let x := solution.symm y
  change ‖x‖ ≤ C / (1 - δ * C) * ‖y‖
  have hy : reference x + difference x = y := by
    rw [← fixedDomainDiracPerturbation_apply reference difference hproduct]
    exact solution.apply_symm_apply y
  have hx : reference x = y - difference x := eq_sub_of_add_eq hy
  have hestimate : ‖x‖ ≤ C * (‖y‖ + δ * ‖x‖) := calc
    ‖x‖ = ‖reference.symm (reference x)‖ := by rw [reference.symm_apply_apply]
    _ ≤ C * ‖reference x‖ := reference.symm.toContinuousLinearMap.le_of_opNorm_le hC _
    _ ≤ C * (‖y‖ + δ * ‖x‖) := by
      rw [hx]
      apply mul_le_mul_of_nonneg_left _ hC₀
      exact (norm_sub_le _ _).trans
        (add_le_add le_rfl (difference.le_of_opNorm_le hδ x))
  rw [div_mul_eq_mul_div, le_div_iff₀ (by linarith : 0 < 1 - δ * C)]
  linarith only [hestimate]

end FixedDomain

end FirstOrderTwistor
