import Mathlib.Analysis.Calculus.LineDeriv.IntegrationByParts
import Mathlib.Analysis.Real.Sqrt
import Mathlib.MeasureTheory.Measure.Haar.InnerProductSpace
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Positivity
import Mathlib.Tactic.Ring

open MeasureTheory Topology
open scoped BigOperators

namespace FirstOrderTwistor

abbrev EuclideanFour := EuclideanSpace ℝ (Fin 4)

/-- Coordinate derivative in the direction of the `a`th Euclidean unit vector. -/
noncomputable def euclideanPartial (u : EuclideanFour → ℝ) (a : Fin 4)
    (x : EuclideanFour) : ℝ :=
  fderiv ℝ u x (EuclideanSpace.single a 1)

/-- Squared Euclidean norm of the derivative of a field with real components. -/
noncomputable def euclideanGradientSq {ι : Type*} [Fintype ι]
    (u : ι → EuclideanFour → ℝ) (x : EuclideanFour) : ℝ :=
  ∑ p : ι × Fin 4, (euclideanPartial (u p.1) p.2 x) ^ 2

/-- The scalar component of the cutoff flux in SEC `msneck:interpolation`. -/
noncomputable def bufferedFlux {ι : Type*} [Fintype ι]
    (η : EuclideanFour → ℝ) (u : ι → EuclideanFour → ℝ) (p : ι × Fin 4)
    (x : EuclideanFour) : ℝ :=
  η x ^ 4 * (euclideanGradientSq u x * euclideanPartial (u p.1) p.2 x)

private theorem integrable_of_tsupport_subset {η f : EuclideanFour → ℝ}
    (hη : HasCompactSupport η) (hsupp : tsupport f ⊆ tsupport η)
    (hcont : ∀ x ∈ tsupport η, ContinuousAt f x) : Integrable f := by
  have hc : Continuous f := by
    refine continuous_iff_continuousAt.2 fun x => ?_
    by_cases hx : x ∈ tsupport η
    · exact hcont x hx
    · exact (HasFDerivAt.of_notMem_tsupport ℝ (fun hf => hx (hsupp hf))).continuousAt
  exact hc.integrable_of_hasCompactSupport (hη.of_isClosed_subset (isClosed_tsupport f) hsupp)

/-- Euclidean integration by parts for the cutoff interpolation flux. The
coordinate field only needs to be `C²` at points of the cutoff's topological
support. The cutoff is compactly supported and `C¹`. -/
theorem bufferedInterpolation_integrationByParts {ι : Type*} [Fintype ι]
    (η : EuclideanFour → ℝ) (u : ι → EuclideanFour → ℝ)
    (hη : ContDiff ℝ 1 η) (hcompact : HasCompactSupport η)
    (hu : ∀ j x, x ∈ tsupport η → ContDiffAt ℝ 2 (u j) x) :
    (∫ x, η x ^ 4 * (euclideanGradientSq u x) ^ 2) =
      - ∫ x, ∑ p : ι × Fin 4, u p.1 x * euclideanPartial (bufferedFlux η u p) p.2 x := by
  have hpartial (p : ι × Fin 4) (x : EuclideanFour) (hx : x ∈ tsupport η) :
      ContDiffAt ℝ 1 (euclideanPartial (u p.1) p.2) x :=
    ((hu p.1 x hx).fderiv_right (by norm_num)).clm_apply contDiffAt_const
  have hflux (p : ι × Fin 4) (x : EuclideanFour) (hx : x ∈ tsupport η) :
      ContDiffAt ℝ 1 (bufferedFlux η u p) x := by
    refine (hη.contDiffAt.pow 4).mul ((ContDiffAt.sum fun q _ => ?_).mul (hpartial p x hx))
    exact (hpartial q x hx).pow 2
  have hfluxSupport (p : ι × Fin 4) : tsupport (bufferedFlux η u p) ⊆ tsupport η := by
    apply closure_mono
    intro x hx
    by_contra h
    have hzero : η x = 0 := Function.notMem_support.mp h
    exact (Function.mem_support.mp hx) (by simp [bufferedFlux, hzero])
  have hfluxPartialSupport (p : ι × Fin 4) :
      tsupport (euclideanPartial (bufferedFlux η u p) p.2) ⊆ tsupport η :=
    (tsupport_fderiv_apply_subset ℝ (EuclideanSpace.single p.2 1)).trans (hfluxSupport p)
  have hleft (p : ι × Fin 4) : Integrable fun x =>
      euclideanPartial (u p.1) p.2 x * bufferedFlux η u p x :=
    integrable_of_tsupport_subset hcompact (tsupport_mul_subset_right.trans (hfluxSupport p))
      fun x hx => (hpartial p x hx).continuousAt.mul (hflux p x hx).continuousAt
  have hright (p : ι × Fin 4) : Integrable fun x =>
      u p.1 x * euclideanPartial (bufferedFlux η u p) p.2 x :=
    integrable_of_tsupport_subset hcompact (tsupport_mul_subset_right.trans (hfluxPartialSupport p))
      fun x hx => (hu p.1 x hx).continuousAt.mul
        (((hflux p x hx).continuousAt_fderiv one_ne_zero).clm_apply continuousAt_const)
  have hproduct (p : ι × Fin 4) : Integrable fun x => u p.1 x * bufferedFlux η u p x :=
    integrable_of_tsupport_subset hcompact (tsupport_mul_subset_right.trans (hfluxSupport p))
      fun x hx => (hu p.1 x hx).continuousAt.mul (hflux p x hx).continuousAt
  have hibp (p : ι × Fin 4) :
      (∫ x, u p.1 x * euclideanPartial (bufferedFlux η u p) p.2 x) =
        - ∫ x, euclideanPartial (u p.1) p.2 x * bufferedFlux η u p x := by
    refine integral_mul_fderiv_eq_neg_fderiv_mul_of_integrable (hleft p) (hright p) (hproduct p)
      (fun x hx => (hu p.1 x (hfluxSupport p hx)).differentiableAt (by norm_num)) ?_
    intro x _
    by_cases hx : x ∈ tsupport η
    · exact (hflux p x hx).differentiableAt one_ne_zero
    · exact (HasFDerivAt.of_notMem_tsupport ℝ (fun hf => hx (hfluxSupport p hf))).differentiableAt
  have hquartic (x : EuclideanFour) : η x ^ 4 * (euclideanGradientSq u x) ^ 2 =
      ∑ p : ι × Fin 4, euclideanPartial (u p.1) p.2 x * bufferedFlux η u p x := by
    calc
      _ = (η x ^ 4 * euclideanGradientSq u x) *
          ∑ p : ι × Fin 4, (euclideanPartial (u p.1) p.2 x) ^ 2 := by
        rw [← euclideanGradientSq, pow_two, mul_assoc]
      _ = _ := by
        rw [Finset.mul_sum]
        refine Finset.sum_congr rfl fun p _ => ?_
        unfold bufferedFlux
        ring
  rw [integral_congr_ae (Filter.Eventually.of_forall hquartic),
    integral_finsetSum _ (fun p _ => hleft p), integral_finsetSum _ (fun p _ => hright p),
    ← Finset.sum_neg_distrib]
  exact Finset.sum_congr rfl fun p _ => by rw [hibp p, neg_neg]

/-- The two scalar endpoints of SEC `msneck:interpolation`, assuming the
integrated quartic inequality. Includes `Y = 0`. -/
theorem bufferedInterpolation_of_quartic {U c X Y : ℝ}
    (hU : 0 ≤ U) (hc : 0 ≤ c) (hX : 0 ≤ X) (hY : 0 ≤ Y)
    (hquartic : Y ^ 4 ≤ U * (4 * c * Y ^ 3 + 4 * Y ^ 2 * X)) :
    Y ≤ 4 * c * U + 2 * Real.sqrt (U * X) ∧ Y ^ 2 ≤ 32 * c ^ 2 * U ^ 2 + 8 * U * X := by
  let a := 4 * c * U
  let s := 2 * Real.sqrt (U * X)
  have ha : 0 ≤ a := by dsimp [a]; positivity
  have hs : 0 ≤ s := by dsimp [s]; positivity
  have hsq : s ^ 2 = 4 * U * X := by
    calc
      s ^ 2 = 4 * Real.sqrt (U * X) ^ 2 := by dsimp [s]; ring
      _ = 4 * U * X := by rw [Real.sq_sqrt (mul_nonneg hU hX), mul_assoc]
  have hquad : Y ^ 2 ≤ a * Y + s ^ 2 := by
    rcases hY.eq_or_lt with hzero | hpos
    · rw [← hzero, zero_pow (by decide), mul_zero, zero_add]
      exact sq_nonneg s
    · apply (mul_le_mul_iff_right₀ (by positivity : 0 < Y ^ 2)).mp
      calc
        Y ^ 2 * Y ^ 2 = Y ^ 4 := by ring
        _ ≤ U * (4 * c * Y ^ 3 + 4 * Y ^ 2 * X) := hquartic
        _ = Y ^ 2 * (a * Y + s ^ 2) := by rw [hsq]; dsimp [a]; ring
  have hfirst : Y ≤ a + s := by
    by_contra! hbad
    have hsY : s < Y := (le_add_of_nonneg_left ha).trans_lt hbad
    have hpositive := mul_pos (hs.trans_lt hsY) (sub_pos.mpr hbad)
    have hnonneg := mul_nonneg hs (sub_nonneg.mpr hsY.le)
    nlinarith only [hquad, hpositive, hnonneg]
  refine ⟨hfirst, ?_⟩
  calc
    Y ^ 2 ≤ (a + s) ^ 2 := pow_le_pow_left₀ hY hfirst 2
    _ ≤ 2 * a ^ 2 + 2 * s ^ 2 := by nlinarith only [sq_nonneg (a - s)]
    _ = 32 * c ^ 2 * U ^ 2 + 8 * U * X := by rw [hsq]; dsimp [a]; ring

end FirstOrderTwistor
