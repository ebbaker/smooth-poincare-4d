import Mathlib.Analysis.InnerProductSpace.ProdL2
import Mathlib.Analysis.Normed.Group.BallSphere
import Mathlib.MeasureTheory.Integral.DominatedConvergence
import Mathlib.MeasureTheory.Measure.Haar.InnerProductSpace

/-!
# Simultaneous bisection of four measures in a Euclidean chart

A point of the unit sphere in the Euclidean product of four-space and the real
line gives an affine form. The four differences of strict halfspace masses
define a continuous odd map on that sphere, including its two poles. The
antipodal zero theorem in dimension four is an explicit topological input.
-/

namespace SmoothPoincare

open Filter MeasureTheory Set
open scoped RealInnerProductSpace Topology

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "V" => WithLp 2 (E₄ × ℝ)

/-- The (S^4) of normalized affine forms, with its Euclidean product norm. -/
abbrev AffineCutSphere := Metric.sphere (0 : V) 1

/-- The Euclidean affine form for normal `n` and offset `c`. -/
noncomputable def affineCutValue (n : E₄) (c : ℝ) (x : E₄) : ℝ := ⟪n, x⟫ + c

/-- The open positive halfspace. -/
def affineCutPositive (n : E₄) (c : ℝ) : Set E₄ := {x | 0 < affineCutValue n c x}

/-- The open negative halfspace. -/
def affineCutNegative (n : E₄) (c : ℝ) : Set E₄ := {x | affineCutValue n c x < 0}

/-- The affine zero set. -/
def affineCutPlane (n : E₄) (c : ℝ) : Set E₄ := {x | affineCutValue n c x = 0}

private theorem continuous_affineCutValue (n : E₄) (c : ℝ) :
    Continuous (affineCutValue n c) := by
  have h : Continuous (fun x : E₄ => ⟪n, x⟫) := continuous_const.inner continuous_id
  exact h.add continuous_const

private theorem measurableSet_affineCutPositive (n : E₄) (c : ℝ) :
    MeasurableSet (affineCutPositive n c) :=
  (isOpen_lt continuous_const (continuous_affineCutValue n c)).measurableSet

private theorem measurableSet_affineCutNegative (n : E₄) (c : ℝ) :
    MeasurableSet (affineCutNegative n c) :=
  (isOpen_lt (continuous_affineCutValue n c) continuous_const).measurableSet

private theorem affineCutValue_neg (n : E₄) (c : ℝ) (x : E₄) :
    affineCutValue (-n) (-c) x = -affineCutValue n c x := by
  simp [affineCutValue, add_comm]

/-- Nonzero affine forms have null zero set for every measure absolutely
continuous with respect to Euclidean volume. -/
theorem affineCutPlane_null (μ : Measure E₄) (hμ : μ ≪ volume)
    (n : E₄) (c : ℝ) (h : n ≠ 0 ∨ c ≠ 0) : μ (affineCutPlane n c) = 0 := by
  by_cases hn : n = 0
  · have hc := h.resolve_left (not_ne_iff.mpr hn)
    simp [affineCutPlane, affineCutValue, hn, hc]
  · let L := (innerSL ℝ n).toLinearMap.toAffineMap
    let A := (affineSpan ℝ ({-c} : Set ℝ)).comap L
    have hA : (A : Set E₄) = affineCutPlane n c := by
      ext x
      simp [A, L, AffineSubspace.coe_comap, affineCutPlane, affineCutValue,
        eq_neg_iff_add_eq_zero]
    have hProper : A ≠ ⊤ := by
      intro hTop
      have hz : (0 : E₄) ∈ affineCutPlane n c := by
        rw [← hA, hTop]
        trivial
      have hSelf : n ∈ affineCutPlane n c := by
        rw [← hA, hTop]
        trivial
      have hc : c = 0 := by simpa [affineCutPlane, affineCutValue] using hz
      exact (real_inner_self_pos.mpr hn).ne' (by
        simpa [affineCutPlane, affineCutValue, hc] using hSelf)
    exact hμ (hA ▸ Measure.addHaar_affineSubspace volume A hProper)

private theorem affineCutSphere_nonzero (p : AffineCutSphere) :
    (p : V).fst ≠ 0 ∨ (p : V).snd ≠ 0 := by
  by_contra! h
  have hp : (p : V) = 0 := by
    apply WithLp.ofLp_injective
    exact Prod.ext h.1 h.2
  have := p.property
  simp [hp] at this

private theorem continuous_cutParameterValue (x : E₄) :
    Continuous (fun p : AffineCutSphere => affineCutValue (p : V).fst (p : V).snd x) := by
  let f : AffineCutSphere → E₄ × ℝ := fun p => WithLp.ofLp (p : V)
  have hf : Continuous f :=
    (WithLp.homeomorphProd 2 E₄ ℝ).continuous.comp continuous_subtype_val
  have h : Continuous (fun p => ⟪(f p).1, x⟫) := hf.fst.inner continuous_const
  exact h.add hf.snd

private theorem continuous_affineCutPositiveMeasure (μ : Measure E₄) [IsFiniteMeasure μ]
    (hμ : μ ≪ volume) :
    Continuous fun p : AffineCutSphere => μ.real (affineCutPositive (p : V).fst (p : V).snd) := by
  rw [continuous_iff_continuousAt]
  intro p
  simp only [ContinuousAt, ← integral_indicator_one (measurableSet_affineCutPositive _ _)]
  apply tendsto_integral_filter_of_dominated_convergence (fun _ => (1 : ℝ))
  · exact Eventually.of_forall fun q =>
      (measurable_const.indicator (measurableSet_affineCutPositive _ _)).aestronglyMeasurable
  · exact Eventually.of_forall fun q => ae_of_all _ (fun x => by
      by_cases hx : x ∈ affineCutPositive (q : V).fst (q : V).snd <;> simp [hx])
  · exact integrable_const _
  · have hAE : ∀ᵐ x ∂μ, x ∉ affineCutPlane (p : V).fst (p : V).snd :=
      ae_iff.mpr (by simpa using affineCutPlane_null μ hμ _ _ (affineCutSphere_nonzero p))
    filter_upwards [hAE] with x hx
    apply tendsto_const_nhds.congr'
    have hCont := (continuous_cutParameterValue x).continuousAt (x := p)
    rcases lt_or_gt_of_ne (show affineCutValue (p : V).fst (p : V).snd x ≠ 0 from hx) with
      hneg | hpos
    · filter_upwards [hCont.eventually_lt_const hneg] with q hq
      have hq' : x ∉ affineCutPositive (q : V).fst (q : V).snd := not_lt.mpr hq.le
      have hp' : x ∉ affineCutPositive (p : V).fst (p : V).snd := not_lt.mpr hneg.le
      simp [hq', hp']
    · filter_upwards [hCont.eventually_const_lt hpos] with q hq
      have hq' : x ∈ affineCutPositive (q : V).fst (q : V).snd := hq
      have hp' : x ∈ affineCutPositive (p : V).fst (p : V).snd := hpos
      simp [hq', hp']

private theorem affineCutPositive_neg (n : E₄) (c : ℝ) :
    affineCutPositive (-n) (-c) = affineCutNegative n c := by
  ext x
  simp [affineCutPositive, affineCutNegative, affineCutValue_neg]

private theorem affineCutNegative_neg (n : E₄) (c : ℝ) :
    affineCutNegative (-n) (-c) = affineCutPositive n c := by
  ext x
  simp [affineCutPositive, affineCutNegative, affineCutValue_neg]

/-- The signed differences of the four strict halfspace masses. -/
noncomputable def fourMeasureImbalance (μ : Fin 4 → Measure E₄)
    (p : AffineCutSphere) (j : Fin 4) : ℝ :=
  (μ j).real (affineCutPositive (p : V).fst (p : V).snd) -
    (μ j).real (affineCutNegative (p : V).fst (p : V).snd)

/-- The imbalance is odd even at the poles, where one strict side is empty. -/
theorem fourMeasureImbalance_odd (μ : Fin 4 → Measure E₄) (p : AffineCutSphere) :
    fourMeasureImbalance μ (-p) = -fourMeasureImbalance μ p := by
  funext j
  simp only [fourMeasureImbalance, Pi.neg_apply]
  change (μ j).real (affineCutPositive (-(p : V).fst) (-(p : V).snd)) -
    (μ j).real (affineCutNegative (-(p : V).fst) (-(p : V).snd)) = _
  rw [affineCutPositive_neg, affineCutNegative_neg, neg_sub]

/-- Dominated convergence gives continuity on the entire parameter sphere. -/
theorem fourMeasureImbalance_continuous (μ : Fin 4 → Measure E₄)
    [∀ j, IsFiniteMeasure (μ j)] (hμ : ∀ j, μ j ≪ volume) :
    Continuous (fourMeasureImbalance μ) := by
  apply continuous_pi
  intro j
  have hPos := continuous_affineCutPositiveMeasure (μ j) (hμ j)
  have hNeg : Continuous fun p : AffineCutSphere =>
      (μ j).real (affineCutNegative (p : V).fst (p : V).snd) := by
    have hEq : (fun p : AffineCutSphere =>
        (μ j).real (affineCutNegative (p : V).fst (p : V).snd)) =
        (fun p : AffineCutSphere => (μ j).real
          (affineCutPositive ((-p : AffineCutSphere) : V).fst ((-p : AffineCutSphere) : V).snd)) := by
      funext p
      exact congrArg ((μ j).real) (affineCutPositive_neg (p : V).fst (p : V).snd).symm
    rw [hEq]
    exact hPos.comp continuous_neg
  exact hPos.sub hNeg

/-- The exact four-dimensional antipodal zero principle used for bisection. -/
def FourDimensionalAntipodalZero : Prop :=
  ∀ f : AffineCutSphere → (Fin 4 → ℝ), Continuous f →
    (∀ p, f (-p) = -f p) → ∃ p, f p = 0

private theorem affineCutSideMass_sum (μ : Measure E₄) [IsFiniteMeasure μ]
    {n : E₄} {c : ℝ} (hNull : μ (affineCutPlane n c) = 0) :
    μ.real (affineCutPositive n c) + μ.real (affineCutNegative n c) = μ.real univ := by
  have hDisjoint : Disjoint (affineCutPositive n c) (affineCutNegative n c) :=
    disjoint_left.mpr fun x (hPos : 0 < affineCutValue n c x)
      (hNeg : affineCutValue n c x < 0) => (lt_asymm hPos hNeg).elim
  rw [← measureReal_union hDisjoint (measurableSet_affineCutNegative n c)]
  apply measureReal_eq_measureReal_smaller_of_between_null_sdiff
    (subset_univ _) Subset.rfl
  have hDiff : univ \ (affineCutPositive n c ∪ affineCutNegative n c) = affineCutPlane n c := by
    ext x
    simp [affineCutPositive, affineCutNegative, affineCutPlane, le_antisymm_iff, and_comm]
  simp [hDiff, Measure.real_def, hNull]

/-- One genuine affine hyperplane bisects four finite absolutely continuous
measures simultaneously. The distinct all-zero case uses a linear hyperplane. -/
theorem exists_fourMeasure_bisection (hZero : FourDimensionalAntipodalZero)
    (μ : Fin 4 → Measure E₄) [∀ j, IsFiniteMeasure (μ j)]
    (hμ : ∀ j, μ j ≪ volume) :
    ∃ (n : E₄) (c : ℝ), n ≠ 0 ∧ ∀ j,
      (μ j).real (affineCutPositive n c) = (μ j).real univ / 2 ∧
      (μ j).real (affineCutNegative n c) = (μ j).real univ / 2 ∧
      μ j (affineCutPlane n c) = 0 := by
  by_cases hMass : ∃ j, (μ j).real univ ≠ 0
  · obtain ⟨p, hp⟩ := hZero (fourMeasureImbalance μ) (fourMeasureImbalance_continuous μ hμ)
      (fourMeasureImbalance_odd μ)
    let n := (p : V).fst
    let c := (p : V).snd
    have hEqual (j : Fin 4) :
        (μ j).real (affineCutPositive n c) = (μ j).real (affineCutNegative n c) :=
      sub_eq_zero.mp (congrFun hp j)
    have hn : n ≠ 0 := by
      intro hn
      obtain ⟨j, hj⟩ := hMass
      have hc : c ≠ 0 := (affineCutSphere_nonzero p).resolve_left (not_ne_iff.mpr hn)
      rcases lt_or_gt_of_ne hc with hc | hc
      · have hPos : affineCutPositive n c = ∅ := by simp [affineCutPositive, affineCutValue, hn, hc.not_gt]
        have hNeg : affineCutNegative n c = univ := by simp [affineCutNegative, affineCutValue, hn, hc]
        exact hj (by simpa [hPos, hNeg] using (hEqual j).symm)
      · have hPos : affineCutPositive n c = univ := by simp [affineCutPositive, affineCutValue, hn, hc]
        have hNeg : affineCutNegative n c = ∅ := by simp [affineCutNegative, affineCutValue, hn, hc.not_gt]
        exact hj (by simpa [hPos, hNeg] using hEqual j)
    refine ⟨n, c, hn, fun j => ?_⟩
    have hNull := affineCutPlane_null (μ j) (hμ j) n c (Or.inl hn)
    have hSum := affineCutSideMass_sum (μ j) hNull
    exact ⟨by linarith [hEqual j], by linarith [hEqual j], hNull⟩
  · push Not at hMass
    obtain ⟨n, hn⟩ := exists_ne (0 : E₄)
    refine ⟨n, 0, hn, fun j => ?_⟩
    have hEmpty (s : Set E₄) : (μ j).real s = 0 :=
      le_antisymm ((measureReal_mono (subset_univ s)).trans_eq (hMass j)) measureReal_nonneg
    exact ⟨by rw [hEmpty, hMass, zero_div], by rw [hEmpty, hMass, zero_div],
      affineCutPlane_null (μ j) (hμ j) n 0 (Or.inl hn)⟩

/-- Bisection of the four measures restricted to the closed Euclidean chart
ball. Both strict caps meet the open ball, even when all four masses vanish. -/
theorem exists_fourMeasureBall_bisection (hZero : FourDimensionalAntipodalZero)
    (μ : Fin 4 → Measure E₄) [∀ j, IsFiniteMeasure (μ j)]
    (hμ : ∀ j, μ j ≪ volume) :
    let ν := fun j => (μ j).restrict (Metric.closedBall (0 : E₄) 1)
    ∃ (n : E₄) (c : ℝ), n ≠ 0 ∧
      (Metric.ball 0 1 ∩ affineCutPositive n c).Nonempty ∧
      (Metric.ball 0 1 ∩ affineCutNegative n c).Nonempty ∧
      ∀ j, (ν j).real (affineCutPositive n c) = (ν j).real univ / 2 ∧
        (ν j).real (affineCutNegative n c) = (ν j).real univ / 2 ∧
        ν j (affineCutPlane n c) = 0 := by
  intro ν
  have hν (j : Fin 4) : ν j ≪ volume :=
    Measure.absolutelyContinuous_restrict.trans (hμ j)
  by_cases hMass : ∃ j, (ν j).real univ ≠ 0
  · obtain ⟨n, c, hn, hSplit⟩ := exists_fourMeasure_bisection hZero ν hν
    obtain ⟨j, hj⟩ := hMass
    have hOutside : ν j (Metric.ball 0 1)ᶜ = 0 := by
      change (μ j).restrict (Metric.closedBall 0 1) (Metric.ball 0 1)ᶜ = 0
      rw [Measure.restrict_apply Metric.isOpen_ball.measurableSet.compl,
        inter_comm, ← sdiff_eq, Metric.closedBall_sdiff_ball]
      exact hμ j (Measure.addHaar_sphere volume _ _)
    have hCap (s : Set E₄) (hs : (ν j).real s = (ν j).real univ / 2) :
        (Metric.ball 0 1 ∩ s).Nonempty := by
      by_contra hEmpty
      have hSub : s ⊆ (Metric.ball 0 1)ᶜ :=
        fun x hx hxBall => hEmpty ⟨x, hxBall, hx⟩
      have hNull := measure_mono_null hSub hOutside
      rw [Measure.real_def, hNull, ENNReal.toReal_zero] at hs
      exact hj (by linarith)
    exact ⟨n, c, hn, hCap _ (hSplit j).1, hCap _ (hSplit j).2.1, hSplit⟩
  · push Not at hMass
    let n : E₄ := PiLp.single 2 (0 : Fin 4) (1 / 2)
    have hNorm : ‖n‖ = 1 / 2 := by
      change ‖(PiLp.single 2 (0 : Fin 4) (1 / 2) : E₄)‖ = _
      rw [PiLp.norm_single]
      norm_num
    have hn : n ≠ 0 := by
      apply norm_ne_zero_iff.mp
      rw [hNorm]
      norm_num
    have hSelf := real_inner_self_pos.mpr hn
    have hBall : n ∈ Metric.ball 0 1 := by
      rw [Metric.mem_ball, dist_zero_right, hNorm]
      norm_num
    refine ⟨n, 0, hn, ⟨n, hBall, ?_⟩, ⟨-n, ?_, ?_⟩, fun j => ?_⟩
    · simpa [affineCutPositive, affineCutValue] using hSelf
    · simpa only [Metric.mem_ball, dist_zero_right, norm_neg] using hBall
    · simpa [affineCutNegative, affineCutValue] using hSelf
    · have hEmpty (s : Set E₄) : (ν j).real s = 0 :=
        le_antisymm ((measureReal_mono (subset_univ s)).trans_eq (hMass j)) measureReal_nonneg
      exact ⟨by rw [hEmpty, hMass, zero_div], by rw [hEmpty, hMass, zero_div],
        affineCutPlane_null (ν j) (hν j) n 0 (Or.inl hn)⟩

end SmoothPoincare
