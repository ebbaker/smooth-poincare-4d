import Mathlib.Analysis.Real.Pi.Bounds
import Mathlib.Algebra.BigOperators.Fin
import Mathlib.MeasureTheory.Integral.IntervalIntegral.FundThmCalculus
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Positivity

/-!
# The three physical cuff forms on the two-band marked filling

The analytic input records restrictions of one closed test to the core and the
three compactified funnels. The trace maps refer to the actual markings at the
geodesic waists. The scalar forms include the factor six, and the squared trace
norm uses the physical waist measure. The funnel estimate is the product-gauge
conformal transfer and the sharp lower bound `2 / π` for the unscaled conormal.
-/

open scoped BigOperators

namespace SmoothPoincare.IntrinsicEntry

/-- The radial Dirichlet inequality from a fixed trace to the collapsed end.
For a physical funnel, use `b = π / 2` and apply this inequality along each ray
after changing from the hyperbolic radius to `τ = arctan (sinh r)`. -/
theorem funnelRadial_trace_bound {b : ℝ} (hb : 0 < b) (v d : ℝ → ℝ)
    (hd : Continuous d) (hderiv : ∀ t ∈ Set.uIcc 0 b, HasDerivAt v (d t) t)
    (hver : v b = 0) : v 0 ^ 2 / b ≤ ∫ t in 0..b, d t ^ 2 := by
  let μ := v 0 / b
  have hFTC : (∫ t in 0..b, d t) = -v 0 := by
    rw [intervalIntegral.integral_eq_sub_of_hasDerivAt hderiv (hd.intervalIntegrable 0 b), hver,
      zero_sub]
  have hsquare : 0 ≤ ∫ t in 0..b, (d t + μ) ^ 2 :=
    intervalIntegral.integral_nonneg_of_forall hb.le fun t ↦ sq_nonneg (d t + μ)
  have hsplit : (fun t ↦ (d t + μ) ^ 2) = fun t ↦ (d t ^ 2 + (2 * μ) * d t) + μ ^ 2 := by
    funext t
    ring
  have hdensity : Continuous (fun t ↦ d t ^ 2 + (2 * μ) * d t) :=
    (hd.pow 2).add (continuous_const.mul hd)
  have hsqInt : IntervalIntegrable (fun t ↦ d t ^ 2) MeasureTheory.volume 0 b :=
    (hd.pow 2).intervalIntegrable 0 b
  have hlinInt : IntervalIntegrable (fun t ↦ (2 * μ) * d t) MeasureTheory.volume 0 b :=
    ((continuous_const : Continuous (fun _ : ℝ ↦ 2 * μ)).mul hd).intervalIntegrable 0 b
  rw [hsplit, intervalIntegral.integral_add (hdensity.intervalIntegrable 0 b)
      ((continuous_const : Continuous (fun _ : ℝ ↦ μ ^ 2)).intervalIntegrable 0 b),
    intervalIntegral.integral_add hsqInt hlinInt, intervalIntegral.integral_const_mul,
    intervalIntegral.integral_const, hFTC, sub_zero, smul_eq_mul] at hsquare
  have hcancel : (2 * μ) * -v 0 + b * μ ^ 2 = -(v 0 ^ 2 / b) := by
    dsimp [μ]
    field_simp [hb.ne']
    ring
  rwa [add_assoc, hcancel, ← sub_eq_add_neg, sub_nonneg] at hsquare

/-- The sharp physical radial coefficient is `2 / π` at a waist. -/
theorem funnelWaist_trace_bound (v d : ℝ → ℝ) (hd : Continuous d)
    (hderiv : ∀ t ∈ Set.uIcc 0 (Real.pi / 2), HasDerivAt v (d t) t)
    (hver : v (Real.pi / 2) = 0) :
    (2 / Real.pi) * v 0 ^ 2 ≤ ∫ t in 0..Real.pi / 2, d t ^ 2 := by
  have h := funnelRadial_trace_bound (by positivity : 0 < Real.pi / 2) v d hd hderiv hver
  rwa [show v 0 ^ 2 / (Real.pi / 2) = (2 / Real.pi) * v 0 ^ 2 by ring] at h

/-- Scalar forms and restriction maps of one assembly, on their physical form domains. -/
structure ThreeCuffForm (Closed Core : Type*) (Funnel Trace : Fin 3 → Type*) where
  closedEnergy : Closed → ℝ
  closedNormSq : Closed → ℝ
  coreEnergy : Core → ℝ
  funnelEnergy : (j : Fin 3) → Funnel j → ℝ
  restrictCore : Closed → Core
  restrictFunnel : (j : Fin 3) → Closed → Funnel j
  coreTrace : (j : Fin 3) → Core → Trace j
  funnelTrace : (j : Fin 3) → Funnel j → Trace j
  traceNormSq : (j : Fin 3) → Trace j → ℝ
  traceNormSq_nonneg : ∀ j f, 0 ≤ traceNormSq j f
  trace_match : ∀ j u, funnelTrace j (restrictFunnel j u) = coreTrace j (restrictCore u)
  energy_split : ∀ u, closedEnergy u = coreEnergy (restrictCore u) +
    ∑ j, funnelEnergy j (restrictFunnel j u)
  funnel_trace_bound : ∀ j v,
    6 * (2 / Real.pi) * traceNormSq j (funnelTrace j v) ≤ funnelEnergy j v

variable {Closed Core : Type*} {Funnel Trace : Fin 3 → Type*}

/-- The first value of the original closed scalar form, with the physical
`L²` norm in the Rayleigh quotient. -/
noncomputable def ThreeCuffForm.closedFirstValue (a : ThreeCuffForm Closed Core Funnel Trace) : ℝ :=
  sInf ((fun v ↦ a.closedEnergy v / a.closedNormSq v) '' {v | 0 < a.closedNormSq v})

/-- Rayleigh values of the free-trace core form with its physical `L²` norm. -/
def ThreeCuffForm.neumannRayleighValues (a : ThreeCuffForm Closed Core Funnel Trace)
    (coreNormSq : Core → ℝ) : Set ℝ :=
  (fun v ↦ a.coreEnergy v / coreNormSq v) '' {v | 0 < coreNormSq v}

/-- The first Neumann value on the same core used in the closed restrictions. -/
noncomputable def ThreeCuffForm.neumannFirstValue (a : ThreeCuffForm Closed Core Funnel Trace)
    (coreNormSq : Core → ℝ) : ℝ := sInf (a.neumannRayleighValues coreNormSq)

/-- The first closed mode, normalized in the physical metric. Positivity of
that mode supplies its positive squared trace norm at each waist. -/
structure ThreeCuffGroundState (a : ThreeCuffForm Closed Core Funnel Trace) where
  mode : Closed
  eigenvalue : ℝ
  normalized : a.closedNormSq mode = 1
  energy_eq : a.closedEnergy mode = eigenvalue * a.closedNormSq mode
  rayleigh_minimal : ∀ v, 0 < a.closedNormSq v → eigenvalue ≤ a.closedEnergy v / a.closedNormSq v
  traceNormSq_pos : ∀ j, 0 < a.traceNormSq j (a.coreTrace j (a.restrictCore mode))

/-- The positive normalized mode's value is the infimum of the original form. -/
theorem ThreeCuffGroundState.eigenvalue_eq_closedFirstValue
    {a : ThreeCuffForm Closed Core Funnel Trace} (u : ThreeCuffGroundState a) :
    u.eigenvalue = a.closedFirstValue := by
  have hnorm : 0 < a.closedNormSq u.mode := by rw [u.normalized]; exact zero_lt_one
  have heq : a.closedEnergy u.mode / a.closedNormSq u.mode = u.eigenvalue := by
    rw [u.energy_eq, u.normalized, mul_one, div_one]
  have hleast : IsLeast ((fun v ↦ a.closedEnergy v / a.closedNormSq v) ''
      {v | 0 < a.closedNormSq v}) u.eigenvalue := by
    refine ⟨⟨u.mode, hnorm, heq⟩, ?_⟩
    rintro _ ⟨v, hv, rfl⟩
    exact u.rayleigh_minimal v hv
  exact hleast.csInf_eq.symm

/-- The cost of adding all three funnels is bounded in the physical core traces. -/
theorem ThreeCuffForm.closedEnergy_lower (a : ThreeCuffForm Closed Core Funnel Trace)
    (u : Closed) :
    a.coreEnergy (a.restrictCore u) +
        ∑ j, 6 * (2 / Real.pi) * a.traceNormSq j (a.coreTrace j (a.restrictCore u)) ≤
      a.closedEnergy u := by
  rw [a.energy_split u]
  apply add_le_add_right
  apply Finset.sum_le_sum
  intro j _
  rw [← a.trace_match j u]
  exact a.funnel_trace_bound j (a.restrictFunnel j u)

/-- For any closed test the retained funnel contribution is nonnegative. -/
theorem ThreeCuffForm.coreEnergy_le (a : ThreeCuffForm Closed Core Funnel Trace)
    (u : Closed) : a.coreEnergy (a.restrictCore u) ≤ a.closedEnergy u := by
  have hconst : (0 : ℝ) ≤ 6 * (2 / Real.pi) := by positivity
  have hsum : 0 ≤ ∑ j, 6 * (2 / Real.pi) * a.traceNormSq j
      (a.coreTrace j (a.restrictCore u)) :=
    Finset.sum_nonneg fun j _ ↦ mul_nonneg hconst (a.traceNormSq_nonneg j _)
  exact (le_add_of_nonneg_right hsum).trans (a.closedEnergy_lower u)

/-- Keeping the three matched, nonzero traces of the closed ground state gives
strict improvement over its restricted core energy. -/
theorem ThreeCuffGroundState.coreEnergy_lt (a : ThreeCuffForm Closed Core Funnel Trace)
    (u : ThreeCuffGroundState a) : a.coreEnergy (a.restrictCore u.mode) < u.eigenvalue := by
  have hconst : (0 : ℝ) < 6 * (2 / Real.pi) := by positivity
  have hsum : 0 < ∑ j, 6 * (2 / Real.pi) * a.traceNormSq j
      (a.coreTrace j (a.restrictCore u.mode)) := by
    rw [Fin.sum_univ_three]
    exact add_pos (add_pos (mul_pos hconst (u.traceNormSq_pos 0))
      (mul_pos hconst (u.traceNormSq_pos 1))) (mul_pos hconst (u.traceNormSq_pos 2))
  have hlower := a.closedEnergy_lower u.mode
  rw [u.energy_eq, u.normalized, mul_one] at hlower
  linarith only [hsum, hlower]

/-- The same filling is strictly closed-positive even at zero Neumann sign.
`hRayleigh` is the supplied Neumann variational characterization. -/
theorem closedPositive_of_threeCuff_neumann_nonneg
    (a : ThreeCuffForm Closed Core Funnel Trace) (u : ThreeCuffGroundState a)
    {neumann : ℝ} (hRayleigh : 0 ≤ neumann → ∀ v, 0 ≤ a.coreEnergy v)
    (hneumann : 0 ≤ neumann) : 0 < a.closedFirstValue := by
  rw [← u.eigenvalue_eq_closedFirstValue]
  exact lt_of_le_of_lt (hRayleigh hneumann _) (u.coreEnergy_lt a)

/-- The same comparison with both first values expressed directly by their
Rayleigh domains. The supplied restricted ground state has positive core norm. -/
theorem closedPositive_of_threeCuff_neumannFirst_nonneg
    (a : ThreeCuffForm Closed Core Funnel Trace) (u : ThreeCuffGroundState a)
    (coreNormSq : Core → ℝ) (hbounded : BddBelow (a.neumannRayleighValues coreNormSq))
    (hmodeNorm : 0 < coreNormSq (a.restrictCore u.mode))
    (hneumann : 0 ≤ a.neumannFirstValue coreNormSq) : 0 < a.closedFirstValue := by
  have hle : a.neumannFirstValue coreNormSq ≤
      a.coreEnergy (a.restrictCore u.mode) / coreNormSq (a.restrictCore u.mode) :=
    csInf_le hbounded ⟨a.restrictCore u.mode, hmodeNorm, rfl⟩
  have hcore : 0 ≤ a.coreEnergy (a.restrictCore u.mode) := by
    simpa only [zero_mul] using (le_div_iff₀ hmodeNorm).mp (hneumann.trans hle)
  rw [← u.eigenvalue_eq_closedFirstValue]
  exact hcore.trans_lt (u.coreEnergy_lt a)

/-- A nonpositive first closed mode gives an actual negative core test. -/
theorem ThreeCuffGroundState.negativeCoreTest_of_closed_nonpos
    (a : ThreeCuffForm Closed Core Funnel Trace) (u : ThreeCuffGroundState a)
    (hclosed : a.closedFirstValue ≤ 0) : a.coreEnergy (a.restrictCore u.mode) < 0 := by
  rw [← u.eigenvalue_eq_closedFirstValue] at hclosed
  exact (u.coreEnergy_lt a).trans_le hclosed

section ExteriorResponse

variable {Exterior OuterTrace : Type*} [Zero OuterTrace]

/-- Unscaled compact exterior Dirichlet energy with the three cuff responses.
At `a = 0` the waist trace is free, while `a = 1` includes the full physical funnel. -/
noncomputable def threeCuffExteriorEnergy (bulk : Exterior → ℝ)
    (response : Fin 3 → Exterior → ℝ) (a : ℝ) (v : Exterior) : ℝ :=
  bulk v + a * ∑ j, response j v

@[simp] theorem threeCuffExteriorEnergy_zero (bulk : Exterior → ℝ)
    (response : Fin 3 → Exterior → ℝ) (v : Exterior) :
    threeCuffExteriorEnergy bulk response 0 v = bulk v := by
  simp [threeCuffExteriorEnergy]

@[simp] theorem threeCuffExteriorEnergy_one (bulk : Exterior → ℝ)
    (response : Fin 3 → Exterior → ℝ) (v : Exterior) :
    threeCuffExteriorEnergy bulk response 1 v = bulk v + ∑ j, response j v := by
  simp [threeCuffExteriorEnergy]

/-- Pointwise strict improvement at a nonzero common outer trace. Both least
values concern the same admissible set. `hCauchy` is the uniqueness consequence
for a harmonic Neumann minimizer with vanishing cuff Cauchy data. -/
theorem threeCuffExteriorResponse_lt_at_nonzero_trace
    (bulk : Exterior → ℝ) (response cuffNormSq : Fin 3 → Exterior → ℝ)
    (trace : Exterior → OuterTrace) {β : OuterTrace} (hβ : β ≠ 0)
    {e₀ e₁ : ℝ}
    (h₀ : IsLeast (threeCuffExteriorEnergy bulk response 0 '' {v | trace v = β}) e₀)
    (h₁ : IsLeast (threeCuffExteriorEnergy bulk response 1 '' {v | trace v = β}) e₁)
    (hnorm : ∀ j v, 0 ≤ cuffNormSq j v)
    (hresponse : ∀ j v, (2 / Real.pi) * cuffNormSq j v ≤ response j v)
    (hCauchy : ∀ v, trace v = β →
      IsLeast (bulk '' {w | trace w = β}) (bulk v) →
      (∀ j, cuffNormSq j v = 0) → β = 0) : e₀ < e₁ := by
  obtain ⟨v, hv, hvalue⟩ := h₁.1
  have hmin : e₀ ≤ bulk v := by
    simpa only [threeCuffExteriorEnergy_zero] using
      h₀.2 (show threeCuffExteriorEnergy bulk response 0 v ∈
        threeCuffExteriorEnergy bulk response 0 '' {w | trace w = β} from ⟨v, hv, rfl⟩)
  have hconst : (0 : ℝ) < 2 / Real.pi := by positivity
  have hnonneg (j : Fin 3) : 0 ≤ response j v :=
    (mul_nonneg hconst.le (hnorm j v)).trans (hresponse j v)
  have hsum : 0 ≤ ∑ j, response j v := Finset.sum_nonneg fun j _ ↦ hnonneg j
  rw [threeCuffExteriorEnergy_one] at hvalue
  by_contra! hle
  have hbulk : bulk v = e₀ := by linarith only [hmin, hsum, hvalue, hle]
  have hsumZero : ∑ j, response j v = 0 := by linarith only [hmin, hsum, hvalue, hle]
  have hvanish (j : Fin 3) : cuffNormSq j v = 0 := by
    have hleSum : response j v ≤ ∑ k, response k v :=
      Finset.single_le_sum (fun k _ ↦ hnonneg k) (Finset.mem_univ j)
    rw [hsumZero] at hleSum
    exact le_antisymm
      (nonpos_of_mul_nonpos_right ((hresponse j v).trans hleSum) hconst) (hnorm j v)
  apply hβ (hCauchy v hv ?_ hvanish)
  simpa only [threeCuffExteriorEnergy_zero, hbulk] using h₀

end ExteriorResponse

/-- Complete two-band signed integrals in the real two-form Hilbert–Schmidt
normalization. The single-relator closings give equality band by band. -/
structure ThreeCuffBandCosts where
  plus : Fin 2 → ℝ
  minus : Fin 2 → ℝ
  band_balance : ∀ i, plus i = minus i

noncomputable def ThreeCuffBandCosts.closedPlus (c : ThreeCuffBandCosts) : ℝ := ∑ i, c.plus i

noncomputable def ThreeCuffBandCosts.closedMinus (c : ThreeCuffBandCosts) : ℝ := ∑ i, c.minus i

/-- On the reflected common double, each sign is the sum of both core signs. -/
noncomputable def ThreeCuffBandCosts.commonDoubleEach (c : ThreeCuffBandCosts) : ℝ :=
  c.closedPlus + c.closedMinus

theorem ThreeCuffBandCosts.closed_balance (c : ThreeCuffBandCosts) :
    c.closedPlus = c.closedMinus := Finset.sum_congr rfl (fun i _ ↦ c.band_balance i)

theorem ThreeCuffBandCosts.commonDoubleEach_eq (c : ThreeCuffBandCosts) :
    c.commonDoubleEach = 2 * c.closedPlus := by
  rw [commonDoubleEach, ← c.closed_balance, two_mul]

/-- For the symmetric fixed switches the exchange reverses orientation, hence
identifies the plus integral of the first band with the minus integral of the second. -/
theorem ThreeCuffBandCosts.closedTotals_of_exchange (c : ThreeCuffBandCosts)
    (hexchange : c.plus 0 = c.minus 1) :
    c.closedPlus = 2 * c.plus 0 ∧ c.closedMinus = 2 * c.plus 0 := by
  have hplus : c.plus 1 = c.plus 0 := (c.band_balance 1).trans hexchange.symm
  have hsum : c.closedPlus = 2 * c.plus 0 := by
    simp [closedPlus, Fin.sum_univ_two, hplus, two_mul]
  exact ⟨hsum, c.closed_balance.symm.trans hsum⟩

/-- The symmetric radial trial has the same band profile on both bands. The
`144 * L` term is the sum of the three constant harmonic funnel responses.
A supplied upper test at this threshold certifies strict closed negativity. -/
theorem closedNegative_of_symmetricRadialTest
    (a : ThreeCuffForm Closed Core Funnel Trace) (u : ThreeCuffGroundState a)
    (test : Closed) (bandEnergy length outerValue : ℝ)
    (hradial : a.closedEnergy test = 2 * bandEnergy + 144 * length * outerValue ^ 2)
    (htestNorm : 0 < a.closedNormSq test)
    (hneg : bandEnergy < -(72 * length * outerValue ^ 2)) : a.closedFirstValue < 0 := by
  have htest : a.closedEnergy test < 0 := by linarith only [hradial, hneg]
  rw [← u.eigenvalue_eq_closedFirstValue]
  exact (u.rayleigh_minimal test htestNorm).trans_lt (div_neg_of_neg_of_pos htest htestNorm)

/-- The original closed strict-entry wall is `2T` for `T = 4π²`. -/
noncomputable def threeCuffEntryWall : ℝ := 8 * Real.pi ^ 2

/-- For the prescribed symmetric pair, the strict two-sign wall is precisely
one signed band integral below `T = 4π²`. -/
theorem ThreeCuffBandCosts.strictCost_iff_of_exchange (c : ThreeCuffBandCosts)
    (hexchange : c.plus 0 = c.minus 1) :
    (c.closedPlus < threeCuffEntryWall ∧ c.closedMinus < threeCuffEntryWall) ↔
      c.plus 0 < 4 * Real.pi ^ 2 := by
  obtain ⟨hplus, hminus⟩ := c.closedTotals_of_exchange hexchange
  rw [hplus, hminus, and_self, threeCuffEntryWall]
  constructor <;> intro h <;> linarith only [h]

/-- Each index is one full metric in one fixed-germ family. The reflected
positive estimate and the zero estimate use the doubled common core. The
localized decrease at positive equality gives another metric of the family. -/
theorem threeCuff_cost_gt_wall_of_neumann_nonneg {Trial : Type*}
    (cost : Trial → ThreeCuffBandCosts) (neumann : Trial → ℝ)
    (positive_lower : ∀ x, 0 < neumann x → threeCuffEntryWall ≤ (cost x).closedPlus)
    (zero_margin : ∀ x, neumann x = 0 → threeCuffEntryWall < (cost x).closedPlus)
    (decrease : ∀ x, 0 < neumann x → (cost x).closedPlus = threeCuffEntryWall →
      ∃ y, 0 < neumann y ∧ (cost y).closedPlus < (cost x).closedPlus)
    (x : Trial) (hn : 0 ≤ neumann x) :
    threeCuffEntryWall < (cost x).closedPlus ∧ threeCuffEntryWall < (cost x).closedMinus := by
  rw [← (cost x).closed_balance]
  suffices h : threeCuffEntryWall < (cost x).closedPlus from ⟨h, h⟩
  rcases lt_or_eq_of_le hn with hp | hz
  · refine lt_of_le_of_ne (positive_lower x hp) ?_
    intro heq
    obtain ⟨y, hyPos, hyLower⟩ := decrease x hp heq.symm
    exact (not_lt_of_ge (positive_lower y hyPos)) (heq ▸ hyLower)
  · exact zero_margin x hz.symm

/-- A positive original equality trial enters only if a new positive strict
competitor is supplied by the localized decrease. The inequality covers both signs. -/
theorem threeCuff_exists_strict_competitor_of_closedEquality {Trial : Type*}
    (cost : Trial → ThreeCuffBandCosts) (closedSign : Trial → ℝ) (x : Trial)
    (hx : 0 < closedSign x) (heq : (cost x).closedPlus = threeCuffEntryWall)
    (decrease : 0 < closedSign x → (cost x).closedPlus = threeCuffEntryWall →
      ∃ y, 0 < closedSign y ∧ (cost y).closedPlus < (cost x).closedPlus) :
    ∃ y, 0 < closedSign y ∧ (cost y).closedPlus < threeCuffEntryWall ∧
      (cost y).closedMinus < threeCuffEntryWall := by
  obtain ⟨y, hyPos, hyCost⟩ := decrease hx heq
  rw [heq] at hyCost
  exact ⟨y, hyPos, hyCost, (cost y).closed_balance ▸ hyCost⟩

end SmoothPoincare.IntrinsicEntry
