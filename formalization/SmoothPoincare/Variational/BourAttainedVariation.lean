import DifferentialGeometry.Geometry.Metric.Family.Stationary
import Mathlib.Analysis.Calculus.DerivativeTest
import SmoothPoincare.Variational.BourFixedTypeReturn
import SmoothPoincare.Variational.ConformalChiralCharges

/-!
# Two-sided variation at the attained fixed-type energy

26 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance.
Actual serving model and effort were unavailable. FOT-B10/E47-R1 revision 3
uses the Route 13 signed round return and the attained comparison in E20.
The statements concern whole physical energies on the given oriented carrier.
The geometric path and local differentiability of its energy are explicit.
-/

noncomputable section

open DifferentialGeometry DifferentialGeometry.Geometry.Curvature DifferentialGeometry.Tensor0SBundle
open FirstOrderTwistor Filter Set
open scoped ContDiff Manifold Topology

namespace SmoothPoincare

private theorem secondDeriv_nonneg_of_localMin {f : ℝ → ℝ}
    (hMin : IsLocalMin f 0) (hSmooth : ContDiffAt ℝ 2 f 0) :
    0 ≤ deriv (deriv f) 0 := by
  by_contra! hNeg
  have hDerivNeg : ∀ᶠ t in 𝓝[>] (0 : ℝ), deriv f t < 0 :=
    deriv_neg_right_of_sign_deriv (nhdsWithin_le_nhds
      (eventually_nhdsWithin_sign_eq_of_deriv_neg hNeg hMin.deriv_eq_zero))
  obtain ⟨r, hr, hDerivNeg⟩ := mem_nhdsGT_iff_exists_Ioo_subset.mp hDerivNeg
  have hSmoothNear := hSmooth.eventually (by norm_num)
  have hMinNear : ∀ᶠ t in 𝓝 0, f 0 ≤ f t := hMin
  obtain ⟨a, b, ⟨ha, hb⟩, hNear⟩ := (hMinNear.and hSmoothNear).exists_Ioo_subset
  obtain ⟨t, ht, htUpper⟩ := exists_between (lt_min hr hb)
  have htR := htUpper.trans_le (min_le_left _ _)
  have htB := htUpper.trans_le (min_le_right _ _)
  have hInterval : Icc 0 t ⊆ Ioo a b := fun x hx => ⟨ha.trans_le hx.1, hx.2.trans_lt htB⟩
  obtain ⟨c, hc, hSlope⟩ := exists_deriv_eq_slope f ht
    (fun x hx => (hNear (hInterval hx)).2.continuousAt.continuousWithinAt)
    (fun x hx => ((hNear (hInterval ⟨hx.1.le, hx.2.le⟩)).2.differentiableAt
      (by norm_num)).differentiableWithinAt)
  have hNonneg : 0 ≤ (f t - f 0) / (t - 0) :=
    div_nonneg (sub_nonneg.mpr (hNear ⟨ha.trans ht, htB⟩).1) (sub_nonneg.mpr ht.le)
  rw [← hSlope] at hNonneg
  exact hNonneg.not_gt (hDerivNeg ⟨hc.1, hc.2.trans htR⟩)

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  [CompactSpace M] [Nonempty M] {o : ManifoldOrientation I M 4}

/-- A jointly smooth family of actual signed metrics, with positive Yamabe
class on an open interval about zero. The regularity of the integrated chiral
energy along this family is an explicit premise. -/
structure BourPositiveMetricVariation (o : ManifoldOrientation I M 4) where
  domain : RealTimeInterval
  path : ℝ → SignedCollarMetric o
  zero_regular : 0 ∈ domain.regular
  smooth_metric : MetricFamilySmoothOn domain (fun t => (path t).metric)
  positive : ∀ t ∈ domain.regular, 0 < classYamabeFour o.dimension_eq (path t).metric
  smooth_energy : ContDiffAt ℝ 2 (fun t => (path t).energy .plus) 0

private theorem signedEnergyAlong_eq_plus (v : BourPositiveMetricVariation o) (sign : CollarChirality) :
    (fun t => (v.path t).energy sign) = (fun t => (v.path t).energy .plus) := by
  funext t
  cases sign with
  | plus => rfl
  | minus => exact (v.path t).signature_zero.symm

/-- Each actual signed chiral energy has zero first variation and nonnegative
second variation along every supplied positive two-sided path through the
attained candidate on the same smooth oriented type. -/
theorem bourAttainedVariation (v : BourPositiveMetricVariation o)
    (hAttain : (v.path 0).energy .plus = sInf (geometricPositiveEnergies o)) :
    ∀ sign, let f := fun t => (v.path t).energy sign
      deriv f 0 = 0 ∧ 0 ≤ deriv (deriv f) 0 := by
  intro sign f
  have hMin : IsLocalMin (fun t => (v.path t).energy .plus) 0 := by
    filter_upwards [v.domain.regular_isOpen.mem_nhds v.zero_regular] with t ht
    rw [hAttain]
    exact csInf_le (geometricPositiveEnergies_bddBelow o)
      ((v.path t).energy_mem_of_positive (v.positive t ht))
  change deriv (fun t => (v.path t).energy sign) 0 = 0 ∧
    0 ≤ deriv (deriv (fun t => (v.path t).energy sign)) 0
  rw [signedEnergyAlong_eq_plus v sign]
  exact ⟨hMin.deriv_eq_zero, secondDeriv_nonneg_of_localMin hMin v.smooth_energy⟩

/-- If the actual second variation in a supplied direction is negative, the
central metric cannot attain the infimum. For every step bound, a positive
metric on the same path strictly lowers both signed energies. -/
theorem bourNegativeSecondVariationExcludesAttainment (v : BourPositiveMetricVariation o)
    (sign : CollarChirality) (hNeg : deriv (deriv (fun t => (v.path t).energy sign)) 0 < 0) :
    (v.path 0).energy .plus ≠ sInf (geometricPositiveEnergies o) ∧
      ∀ ε > 0, ∃ t ∈ v.domain.regular, |t| < ε ∧
        0 < classYamabeFour o.dimension_eq (v.path t).metric ∧
          ∀ s, (v.path t).energy s < (v.path 0).energy s := by
  refine ⟨fun hAttain => hNeg.not_ge (bourAttainedVariation v hAttain sign).2, ?_⟩
  intro ε hε
  let f := fun t => (v.path t).energy .plus
  have hNeg' : deriv (deriv f) 0 < 0 := by
    simpa only [signedEnergyAlong_eq_plus v sign] using hNeg
  have hExists : ∃ t ∈ v.domain.regular ∩ Metric.ball 0 ε, f t < f 0 := by
    by_contra! hLower
    have hMin : IsLocalMin f 0 := by
      filter_upwards [v.domain.regular_isOpen.mem_nhds v.zero_regular,
        Metric.ball_mem_nhds (0 : ℝ) hε] with t hReg ht
      exact hLower t ⟨hReg, ht⟩
    exact hNeg'.not_ge (secondDeriv_nonneg_of_localMin hMin v.smooth_energy)
  obtain ⟨t, ⟨htReg, htBall⟩, hDecrease⟩ := hExists
  refine ⟨t, htReg, by simpa only [Metric.mem_ball, Real.dist_eq, sub_zero] using htBall,
    v.positive t htReg, ?_⟩
  intro s
  exact (congrFun (signedEnergyAlong_eq_plus v s) t).trans_lt
    (hDecrease.trans_eq (congrFun (signedEnergyAlong_eq_plus v s) 0).symm)

omit [I.Boundaryless] [T2Space M] [CompactSpace M] [Nonempty M] in
private theorem metricFamilySmoothOn_constLogScaling
    (g : SmoothRiemannianMetric I M) (D : RealTimeInterval) :
    MetricFamilySmoothOn D (fun t => conformalMetric g (.const t)) := by
  let : CompleteSpace E := FiniteDimensional.complete ℝ E
  have hStatic := metricFamilySmoothOn_stationary g D
  have hFactor : ContDiff ℝ ∞ (fun t : ℝ => Real.exp (2 * t)) :=
    Real.contDiff_exp.comp (contDiff_const.mul contDiff_id)
  have hMult (t : ℝ) (x : M) (X Y : TangentSpace I x) :
      (conformalMetric g (.const t)).inner x X Y = Real.exp (2 * t) * g.inner x X Y := rfl
  refine ⟨?_, ?_, ?_, ?_⟩
  · intro x X Y
    simp only [hMult]
    exact (hFactor.mul contDiff_const).contDiffOn
  · intro x X Y
    simp only [hMult]
    exact (hFactor.continuous.mul continuous_const).continuousOn
  · refine tensor0SFamilyContinuousOnSet.congr
      (hStatic.metricTensor_cont.smul (f := fun t _ => Real.exp (2 * t)) ?_) ?_
    · exact hFactor.continuous.comp (continuous_subtype_val.comp continuous_fst)
    · intro t _ x
      apply ContinuousMultilinearMap.ext
      intro v
      simp only [metricTensorField_apply, smul_apply, smul_eq_mul]
      exact (hMult t x (v 0) (v 1)).symm
  · intro Idx _ frame u hFrame i j
    simp only [hMult]
    have hTime : ContMDiff (𝓘(ℝ, ℝ).prod I) 𝓘(ℝ, ℝ) ∞
        (fun p : ℝ × M => Real.exp (2 * p.1)) := hFactor.contMDiff.comp contMDiff_fst
    exact hTime.contMDiffOn.mul (hStatic.frameCompSmooth frame hFrame i j)

private theorem classYamabeFour_constLogScaling
    (q : SmoothRiemannianMetric I M) (hd : Module.finrank ℝ E = 4) (t : ℝ) :
    classYamabeFour hd (conformalMetric q (.const t)) = classYamabeFour hd q := by
  let u : C^∞⟮I, M; ℝ⟯ := .const t
  have hShift : Function.Surjective (fun v : C^∞⟮I, M; ℝ⟯ => u + v) := by
    intro v
    refine ⟨v - u, ?_⟩
    change u + (v - u) = v
    rw [add_comm u, sub_add_cancel]
  change classYamabeFour hd (conformalMetric q u) = classYamabeFour hd q
  unfold classYamabeFour
  simp only [← conformalMetric_add]
  conv_rhs => rw [← hShift.range_comp]
  rfl

section Round

local instance : Fact (Module.finrank ℝ (EuclideanSpace ℝ (Fin 5)) = 4 + 1) := ⟨by simp⟩
private local instance : Nonempty StandardFourSphere :=
  (NormedSpace.sphere_nonempty (x := (0 : EuclideanSpace ℝ (Fin 5))) (r := 1)).mpr zero_le_one
    |>.to_subtype

private theorem standardRoundFourSignedEnergy_plus_eq_zero
    (oS : ManifoldOrientation (𝓡 4) StandardFourSphere 4) :
    (standardRoundFourSignedMetric oS).energy .plus = 0 := by
  simp [SignedCollarMetric.energy, standardRoundFourSignedMetric, signedCollarWeylBlock,
    chiralFrameEnergy, standardRoundFour_chiralBlock_eq_zero, SectionsAndConnections.hilbertSchmidtSq]

/-- The named oriented round pullback is a positive zero-energy minimizer.
Apply the variation test to any actual admissible path through this package. -/
theorem bourRoundAttainedVariation
    {oS : ManifoldOrientation (𝓡 4) StandardFourSphere 4}
    (Φ : M ≃ₘ⟮I, 𝓡 4⟯ StandardFourSphere) (hΦ : Φ.preservesOrientation o oS)
    (v : BourPositiveMetricVariation o)
    (hBase : v.path 0 = (standardRoundFourSignedMetric oS).pullbackCross Φ hΦ) :
    0 < classYamabeFour o.dimension_eq (v.path 0).metric ∧
      ∀ sign, let f := fun t => (v.path t).energy sign
        f 0 = 0 ∧ deriv f 0 = 0 ∧ 0 ≤ deriv (deriv f) 0 := by
  have hZero : (v.path 0).energy .plus = 0 := by
    rw [hBase, SignedCollarMetric.energy_pullbackCross, standardRoundFourSignedEnergy_plus_eq_zero]
  have hInf := (geometricInfimum_eq_zero_of_roundIdentification Φ hΦ standardRoundFour_yamabe_pos).2
  refine ⟨?_, fun sign => ⟨(congrFun (signedEnergyAlong_eq_plus v sign) 0).trans hZero,
    bourAttainedVariation v (hZero.trans hInf.symm) sign⟩⟩
  rw [hBase, SignedCollarMetric.yamabe_pullbackCross]
  exact standardRoundFour_yamabe_pos

/-- An explicit nonconstant variation of the round pullback is given by
multiplying the metric by `exp (2 * t)`. Its two signed energies are constant,
so both second variations vanish. -/
theorem bourRoundScalingVariation
    {oS : ManifoldOrientation (𝓡 4) StandardFourSphere 4}
    (Φ : M ≃ₘ⟮I, 𝓡 4⟯ StandardFourSphere) (hΦ : Φ.preservesOrientation o oS) :
    let q := (standardRoundFourSignedMetric oS).pullbackCross Φ hΦ
    ∃ v : BourPositiveMetricVariation o,
      (v.path 0).metric = q.metric ∧
      (∀ t x (X Y : TangentSpace I x), (v.path t).metric.inner x X Y =
        Real.exp (2 * t) * q.metric.inner x X Y) ∧
      (∀ t sign, (v.path t).energy sign = 0) ∧
      ∀ sign, let f := fun t => (v.path t).energy sign
        deriv f 0 = 0 ∧ deriv (deriv f) 0 = 0 := by
  intro q
  let D := RealTimeInterval.ofEndpoints .negInf .posInf false false 0 (by
    simp [TimeEndpoint.lowerMem, TimeEndpoint.upperMem])
  let P := fun t : ℝ => q.conformal (.const t)
  have hEnergy (sign : CollarChirality) :
      (fun t => (P t).energy sign) = fun _ => q.energy sign :=
    funext fun t => q.energy_conformal (.const t) sign
  have hY : 0 < classYamabeFour o.dimension_eq q.metric := by
    change 0 < classYamabeFour o.dimension_eq ((standardRoundFourSignedMetric oS).pullbackCross Φ hΦ).metric
    rw [SignedCollarMetric.yamabe_pullbackCross]
    exact standardRoundFour_yamabe_pos
  let v : BourPositiveMetricVariation o := {
    domain := D
    path := P
    zero_regular := by simp [D, RealTimeInterval.ofEndpoints, TimeEndpoint.lowerLt, TimeEndpoint.upperLt]
    smooth_metric := metricFamilySmoothOn_constLogScaling q.metric D
    positive := fun t _ => (classYamabeFour_constLogScaling q.metric o.dimension_eq t).symm ▸ hY
    smooth_energy := by rw [hEnergy .plus]; exact contDiffAt_const }
  have hZero : q.energy .plus = 0 := by
    change ((standardRoundFourSignedMetric oS).pullbackCross Φ hΦ).energy .plus = 0
    rw [SignedCollarMetric.energy_pullbackCross, standardRoundFourSignedEnergy_plus_eq_zero]
  refine ⟨v, ?_, fun _ _ _ _ => rfl, ?_, ?_⟩
  · change conformalMetric q.metric (.const (0 : ℝ)) = q.metric
    rw [show (.const (0 : ℝ) : C^∞⟮I, M; ℝ⟯) = 0 by ext; rfl, conformalMetric_zero]
  · intro t sign
    rw [show (v.path t).energy sign = (P t).energy sign from rfl, congrFun (hEnergy sign) t]
    cases sign with
    | plus => exact hZero
    | minus => exact q.signature_zero.symm.trans hZero
  · intro sign f
    change deriv (fun t => (P t).energy sign) 0 = 0 ∧
      deriv (deriv (fun t => (P t).energy sign)) 0 = 0
    rw [hEnergy sign, deriv_const, show deriv (fun _ : ℝ => q.energy sign) = fun _ => 0 by
      funext x; exact deriv_const x _, deriv_const]
    exact ⟨rfl, rfl⟩

end Round

end SmoothPoincare
