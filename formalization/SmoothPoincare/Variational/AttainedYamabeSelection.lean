import SmoothPoincare.Variational.BourYamabeStarts
import SmoothPoincare.Variational.BourAttainedVariation
import SmoothPoincare.Variational.RetainedScalarDeficit
import DifferentialGeometry.Analysis.Integration.Measure.Riemannian.MetricConvergence
import DifferentialGeometry.Geometry.Compactness.CheegerGromov.Limit.Metric.ScalarConvergence
import DifferentialGeometry.Geometry.Operator.MetricComparison
import Mathlib.Topology.Order.IsLUB

/-! # Selection at the exact attained Weyl value

E49, 26 November 2026. Prepared for Edward B. Baker III with OpenAI Codex
assistance. Actual serving model and reasoning effort were unavailable.
Inputs are the Edition 06 setup at HEAD 9c805759, scientific 06
Theorem X and the marked-neck first fixed-type critical value theorem.
-/

open DifferentialGeometry DifferentialGeometry.CheegerGromovCompactness
  DifferentialGeometry.Geometry.Curvature DifferentialGeometry.Geometry.Operator
  DifferentialGeometry.Integral.Measure Filter FirstOrderTwistor MeasureTheory
  SectionsAndConnections Set
open scoped ContDiff ENNReal Manifold Topology

noncomputable section

namespace SmoothPoincare

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H}
  [I.Boundaryless] [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [T2Space M] [CompactSpace M] [Nonempty M] {o : ManifoldOrientation I M 4}

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩
private local instance : IsManifold I 1 M := IsManifold.of_le (by decide : (1 : WithTop ℕ∞) ≤ ∞)

omit [I.Boundaryless] [CompactSpace M] [Nonempty M] in
private theorem tendsto_nonnegativeIntegral_of_metricConvergence [SigmaCompactSpace M]
    {g : ℕ → SmoothRiemannianMetric I M} {limit : SmoothRiemannianMetric I M}
    (hMetric : TendstoUniformlyOn (fun j x => metricDerivNorm 0 (g j) limit limit x)
      (fun _ => 0) atTop univ)
    {f : ℕ → M → ℝ} {fLimit b : M → ℝ}
    (hIntegral : ∀ j, Integrable (f j) (riemannianVolumeMeasure I M (g j)))
    (hLimitIntegral : Integrable fLimit (riemannianVolumeMeasure I M limit))
    (hMeas : ∀ j, Measurable (f j))
    (hNonnegative : ∀ j x, 0 ≤ f j x) (hLimitNonnegative : ∀ x, 0 ≤ fLimit x)
    (hBound : Integrable b (riemannianVolumeMeasure I M limit))
    (hDom : ∀ᶠ j in atTop, ∀ x, f j x ≤ b x)
    (hPoint : ∀ x, Tendsto (fun j => f j x) atTop (𝓝 (fLimit x))) :
    Tendsto (fun j => ∫ x, f j x ∂riemannianVolumeMeasure I M (g j)) atTop
      (𝓝 (∫ x, fLimit x ∂riemannianVolumeMeasure I M limit)) := by
  have h : Tendsto
      (fun j => ∫⁻ x, ENNReal.ofReal (f j x) ∂riemannianVolumeMeasure I M (g j)) atTop
      (𝓝 (∫⁻ x, ENNReal.ofReal (fLimit x) ∂riemannianVolumeMeasure I M limit)) := by
    simpa only [Measure.restrict_univ] using
      (tendsto_setLIntegral_of_dominated_convergence_of_metricDerivNorm g limit
        MeasurableSet.univ hMetric (fs := fun j x => ENNReal.ofReal (f j x))
        (f := fun x => ENNReal.ofReal (fLimit x)) (fun x => ENNReal.ofReal (b x))
        (Eventually.of_forall fun j => (ENNReal.measurable_ofReal.comp (hMeas j)).aemeasurable)
        (hDom.mono fun j hj => ae_of_all _ fun x => ENNReal.ofReal_le_ofReal (hj x))
        (by simpa only [Measure.restrict_univ] using hBound.lintegral_ofReal_ne_top)
        (ae_of_all _ fun x => ENNReal.continuous_ofReal.continuousAt.tendsto.comp (hPoint x)))
  rw [← ofReal_integral_eq_lintegral_ofReal hLimitIntegral (ae_of_all _ hLimitNonnegative)] at h
  have h' := (ENNReal.continuousAt_toReal ENNReal.ofReal_ne_top).tendsto.comp h
  have hEq (j : ℕ) : (∫⁻ x, ENNReal.ofReal (f j x)
      ∂riemannianVolumeMeasure I M (g j)).toReal =
      ∫ x, f j x ∂riemannianVolumeMeasure I M (g j) := by
    rw [← ofReal_integral_eq_lintegral_ofReal (hIntegral j) (ae_of_all _ (hNonnegative j)),
      ENNReal.toReal_ofReal (integral_nonneg (hNonnegative j))]
  change Tendsto (fun j => (∫⁻ x, ENNReal.ofReal (f j x)
    ∂riemannianVolumeMeasure I M (g j)).toReal) atTop _ at h'
  simpa only [hEq, Function.comp_def, ENNReal.toReal_ofReal (integral_nonneg hLimitNonnegative)]
    using h'

omit [I.Boundaryless] [Nonempty M] in
private theorem tendsto_normGradSqFun_of_metricConvergence
    {g : ℕ → SmoothRiemannianMetric I M} {limit : SmoothRiemannianMetric I M}
    (hMetric : MetricCPConvergenceOn univ 0 g limit limit) (f : M → ℝ) (x : M) :
    Tendsto (fun j => normGradSqFun (g j) f x) atTop (𝓝 (normGradSqFun limit f x)) := by
  let A := normGradSqFun limit f x
  have hA : 0 ≤ A := normGradSqFun_nonneg _ _ _
  apply Metric.tendsto_nhds.mpr
  intro ε hε
  let η := min (1 / 2) (ε / (4 * (A + 1)))
  have hη : 0 < η := lt_min (by norm_num) (by positivity)
  have hηhalf : η ≤ 1 / 2 := min_le_left _ _
  have hηone : 0 < 1 - η := by linarith
  have hηsmall : η * (4 * (A + 1)) ≤ ε :=
    (le_div_iff₀ (by positivity)).mp (min_le_right _ _)
  filter_upwards [hMetric.eventually_quadratic_bounds isCompact_univ hη] with j hj
  have hup : normGradSqFun (g j) f x ≤ (1 - η)⁻¹ * A :=
    inner_gradFun_le_of_metric_lower_bound limit (g j) f x _ fun v => by
      rw [inv_mul_eq_div, le_div_iff₀ hηone, mul_comm]
      exact (hj x (mem_univ x) v).1
  have hlo : A ≤ (1 + η) * normGradSqFun (g j) f x :=
    inner_gradFun_le_of_metric_lower_bound (g j) limit f x _ fun v =>
      (hj x (mem_univ x) v).2
  have hBound : normGradSqFun (g j) f x ≤ 2 * A := by
    refine hup.trans (mul_le_mul_of_nonneg_right ?_ hA)
    rw [inv_eq_one_div, div_le_iff₀ hηone]
    linarith
  have hDiffUpper : normGradSqFun (g j) f x - A ≤ η * normGradSqFun (g j) f x := by
    rw [inv_mul_eq_div, le_div_iff₀ hηone] at hup
    nlinarith only [hup]
  have hDiffLower : -(normGradSqFun (g j) f x - A) ≤ η * normGradSqFun (g j) f x := by
    nlinarith only [hlo]
  rw [Real.dist_eq]
  refine (abs_le.mpr ⟨by linarith only [hDiffLower], hDiffUpper⟩).trans_lt
    ((mul_le_mul_of_nonneg_left hBound hη.le).trans_lt ?_)
  nlinarith only [hηsmall, mul_nonneg hη.le hA, hη]

/-- A smooth limit of unit-volume positive Yamabe metrics with a common
positive Yamabe floor remains a unit-volume Yamabe metric. The convergence
uses the physical volume, scalar curvature and gradient of each fixed
smooth conformal test. -/
theorem attainedYamabe_limit_of_metricConvergence
    {g : ℕ → SmoothRiemannianMetric I M} {limit : SmoothRiemannianMetric I M}
    (hDim : Module.finrank ℝ E₄ = 4)
    (hMetric : MetricCInfConvergenceOnCompacts g limit limit)
    {y : ℝ} (hy : 0 < y) (hFloor : ∀ j, y ≤ classYamabeFour hDim (g j))
    (hVolume : ∀ j, riemannianVolumeMeasure I M (g j) univ = 1)
    (hScalar : ∀ j x, metricScalarAt (g j) x = classYamabeFour hDim (g j)) :
    riemannianVolumeMeasure I M limit univ = 1 ∧
      (∀ x, metricScalarAt limit x = classYamabeFour hDim limit) ∧
      y ≤ classYamabeFour hDim limit ∧
      Tendsto (fun j => classYamabeFour hDim (g j)) atTop (𝓝 (classYamabeFour hDim limit)) := by
  let gVolume (q : SmoothRiemannianMetric I M) := riemannianVolumeMeasure I M q
  let s := metricScalarAt limit (Classical.choice (inferInstance : Nonempty M))
  let Y := fun q : SmoothRiemannianMetric I M => classYamabeFour hDim q
  have hScalarConv := (hMetric univ isCompact_univ 2).tendstoUniformlyOn_metricScalarAt isCompact_univ
  have hY : Tendsto (fun j => Y (g j)) atTop (𝓝 s) := by
    simpa only [hScalar] using hScalarConv.tendsto_at (mem_univ (Classical.choice (inferInstance : Nonempty M)))
  have hCSC (x : M) : metricScalarAt limit x = s :=
    tendsto_nhds_unique (by simpa only [hScalar] using hScalarConv.tendsto_at (mem_univ x)) hY
  have hs : y ≤ s := le_of_tendsto hY (Eventually.of_forall hFloor)
  have hZero : MetricCPConvergenceOn univ 0 g limit limit := hMetric univ isCompact_univ 0
  have hDen : TendstoUniformlyOn (fun j x => metricDerivNorm 0 (g j) limit limit x)
      (fun _ => 0) atTop univ := by
    apply Metric.tendstoUniformlyOn_iff.mpr
    intro ε hε
    obtain ⟨n, hn⟩ := hZero ε hε
    filter_upwards [eventually_ge_atTop n] with j hj
    intro x hx
    rw [Real.dist_eq, zero_sub, abs_neg, abs_of_nonneg (Real.sqrt_nonneg _)]
    exact (derivNorm_le_sup isCompact_univ le_rfl (g j) limit limit hx).trans_lt (hn j hj)
  have hInt (q : SmoothRiemannianMetric I M) {f : M → ℝ} (hf : Continuous f) :
      Integrable f (gVolume q) := by
    let : IsFiniteMeasureOnCompacts (gVolume q) := riemannianVolumeMeasure_isFiniteMeasureOnCompacts q
    exact hf.integrable_of_hasCompactSupport (HasCompactSupport.of_compactSpace _)
  have hIntConst {f : M → ℝ} (hf : Continuous f) (hn : ∀ x, 0 ≤ f x) :
      Tendsto (fun j => ∫ x, f x ∂gVolume (g j)) atTop (𝓝 (∫ x, f x ∂gVolume limit)) :=
    tendsto_nonnegativeIntegral_of_metricConvergence hDen (fun j => hInt (g j) hf)
      (hInt limit hf) (fun _ => hf.measurable) (fun _ => hn) hn
      (hInt limit hf) (Eventually.of_forall fun _ _ => le_rfl) (fun _ => tendsto_const_nhds)
  have hMass := hIntConst (f := fun _ => (1 : ℝ)) continuous_const (fun _ => zero_le_one)
  have hMassReal : (gVolume limit).real univ = 1 := by
    apply tendsto_nhds_unique _ (tendsto_const_nhds (x := (1 : ℝ)))
    simpa only [integral_const, smul_eq_mul, mul_one, Measure.real, gVolume, hVolume,
      ENNReal.toReal_one] using hMass
  have hVol : gVolume limit univ = 1 := by
    let : IsFiniteMeasureOnCompacts (gVolume limit) :=
      riemannianVolumeMeasure_isFiniteMeasureOnCompacts limit
    apply (ENNReal.toReal_eq_toReal_iff' (measure_ne_top (gVolume limit) univ)
      ENNReal.one_ne_top).mp
    simpa only [Measure.real, ENNReal.toReal_one] using hMassReal
  have hGrad (f : C^∞⟮I, M; ℝ⟯) :
      Tendsto (fun j => ∫ x, normGradSqFun (g j) f x ∂gVolume (g j)) atTop
        (𝓝 (∫ x, normGradSqFun limit f x ∂gVolume limit)) := by
    have hCont (q : SmoothRiemannianMetric I M) : Continuous (normGradSqFun q f) :=
      normGradSqFun_continuous q f.contMDiff
    apply tendsto_nonnegativeIntegral_of_metricConvergence hDen
      (fun j => hInt (g j) (hCont (g j))) (hInt limit (hCont limit))
      (fun j => (hCont (g j)).measurable) (fun j => normGradSqFun_nonneg (g j) f)
      (normGradSqFun_nonneg limit f) (hInt limit (continuous_const.mul (hCont limit)))
    · filter_upwards [hZero.eventually_quadratic_bounds isCompact_univ
        (show 0 < (1 / 2 : ℝ) by norm_num)] with j hj
      intro x
      apply inner_gradFun_le_of_metric_lower_bound limit (g j) f x 2
      intro v
      linarith only [(hj x (mem_univ x) v).1]
    · exact tendsto_normGradSqFun_of_metricConvergence hZero f
  have hScalarIntegral (f : C^∞⟮I, M; ℝ⟯) :
      Tendsto (fun j => ∫ x, scalarCurv (g j) x * f x ^ 2 ∂gVolume (g j)) atTop
        (𝓝 (∫ x, scalarCurv limit x * f x ^ 2 ∂gVolume limit)) := by
    simp_rw [← metricScalar_eq_scal, hScalar, hCSC, integral_const_mul]
    exact hY.mul (hIntConst (f.contMDiff.continuous.pow 2) (fun _ => sq_nonneg _))
  have hTest (u : C^∞⟮I, M; ℝ⟯) :
      s * Real.sqrt (capFactorVolume limit (capExpFactor u)) ≤
        capFactorScalar limit (capExpFactor u) := by
    let f := capExpFactor u
    have hNum : Tendsto (fun j => capFactorScalar (g j) f) atTop
        (𝓝 (capFactorScalar limit f)) := by
      simp_rw [capFactorScalar_eq_dirichletForm hDim]
      exact (hScalarIntegral f).add ((hGrad f).const_mul 6)
    have hVolTest : Tendsto (fun j => capFactorVolume (g j) f) atTop
        (𝓝 (capFactorVolume limit f)) :=
      hIntConst (f.contMDiff.continuous.pow 4) (fun _ => by positivity)
    apply le_of_tendsto_of_tendsto (hY.mul hVolTest.sqrt) hNum
    refine Eventually.of_forall fun j => ?_
    let q := g j
    let tests := range (fun v : C^∞⟮I, M; ℝ⟯ =>
      capTestScalar (conformalMetric q v) / Real.sqrt (capTestVolume (conformalMetric q v)))
    have hb : BddBelow tests := by
      by_contra h
      have hz : Y q = 0 := Real.sInf_of_not_bddBelow h
      exact (hy.trans_le (hFloor j)).ne' hz
    have hLe : Y q ≤ capTestScalar (conformalMetric q u) /
        Real.sqrt (capTestVolume (conformalMetric q u)) := csInf_le hb (mem_range_self u)
    have hPos : 0 < capTestVolume (conformalMetric q u) := by
      let μ := gVolume (conformalMetric q u)
      let : IsFiniteMeasureOnCompacts μ := riemannianVolumeMeasure_isFiniteMeasureOnCompacts _
      let : μ.IsOpenPosMeasure := riemannianVolumeMeasure_isOpenPosMeasure _
      exact ENNReal.toReal_pos (isOpen_univ.measure_pos μ univ_nonempty).ne' (measure_ne_top μ univ)
    rw [le_div_iff₀ (Real.sqrt_pos_of_pos hPos), capTestVolume_eq_capFactorVolume hDim,
      capTestScalar_eq_capFactorScalar hDim] at hLe
    exact hLe
  have hLower : s ≤ Y limit := le_classYamabeFour_of_capFactorScalar hDim limit hTest
  have hUpper : Y limit ≤ s := by
    let tests := range (fun u : C^∞⟮I, M; ℝ⟯ =>
      capTestScalar (conformalMetric limit u) / Real.sqrt (capTestVolume (conformalMetric limit u)))
    have hb : BddBelow tests := by
      by_contra h
      have hz : Y limit = 0 := Real.sInf_of_not_bddBelow h
      exact (hy.trans_le (hs.trans hLower)).ne' hz
    have ht : Y limit ≤ capTestScalar (conformalMetric limit 0) /
        Real.sqrt (capTestVolume (conformalMetric limit 0)) := csInf_le hb (mem_range_self 0)
    simpa only [conformalMetric_zero, capTestScalar, capTestVolume, hCSC, integral_const,
      hMassReal, gVolume, one_smul, Real.sqrt_one, div_one] using ht
  have heq := le_antisymm hUpper hLower
  exact ⟨hVol, fun x => (hCSC x).trans heq.symm, hs.trans hLower, heq.symm ▸ hY⟩


/-- The positive subcritical Bach-flat values on the original oriented
carrier. The subcritical threshold is for each chiral Hilbert–Schmidt energy. -/
def attainedBachValues (o : ManifoldOrientation I M 4)
    (BachFlat : SmoothRiemannianMetric I M → Prop) : Set ℝ :=
  {e | 0 < e ∧ e < 8 * Real.pi ^ 2 ∧ ∃ q : SignedCollarMetric o,
    0 < classYamabeFour o.dimension_eq q.metric ∧ BachFlat q.metric ∧ q.energy .plus = e}

/-- The exact critical stratum at energy `a`, in physical volume-one Yamabe gauge. -/
structure AttainedYamabeAt (BachFlat : SmoothRiemannianMetric I M → Prop) (a : ℝ)
    (q : SignedCollarMetric o) : Prop where
  positive : 0 < classYamabeFour o.dimension_eq q.metric
  bach : BachFlat q.metric
  plus_eq : q.energy .plus = a
  volume_one : riemannianVolumeMeasure I M q.metric univ = 1
  scalar_eq : ∀ x, metricScalarAt q.metric x = classYamabeFour o.dimension_eq q.metric

/-- The geometric compactness input from the first critical value theorem.
The limit carries the exact critical energy and Bach equation. The
unit-volume Yamabe gauge is recovered below from the metric convergence. -/
def AttainedFirstValueCompactness (o : ManifoldOrientation I M 4)
    (BachFlat : SmoothRiemannianMetric I M → Prop) (a : ℝ) : Prop :=
  ∀ q : ℕ → SignedCollarMetric o, (∀ j, AttainedYamabeAt BachFlat a (q j)) →
    ∃ (k : ℕ → ℕ), StrictMono k ∧
      ∃ (Φ : ℕ → M ≃ₘ⟮I, I⟯ M) (hΦ : ∀ j, (Φ j).preservesOrientation o o)
        (limit : SignedCollarMetric o),
        BachFlat limit.metric ∧ limit.energy .plus = a ∧
        MetricCInfConvergenceOnCompacts
          (fun j => ((q (k j)).pullbackCross (Φ j) (hΦ j)).metric) limit.metric limit.metric

open Bour

section Selection

variable [BoundarylessManifold I M]

private theorem attainedYamabe_ricci_eq
    {BachFlat : SmoothRiemannianMetric I M → Prop} {a : ℝ} {q : SignedCollarMetric o}
    (hq : AttainedYamabeAt BachFlat a q) (hEuler : bourEuler q = 16 * Real.pi ^ 2) :
    bourRicci q = 4 * a - (roundYamabeConstant ^ 2 -
      (classYamabeFour o.dimension_eq q.metric) ^ 2) / 12 := by
  have hG := bourEuler_eq_charges q
  rw [hEuler, hq.plus_eq, bourScalar_eq_sq_of_volume_one q _ hq.volume_one hq.scalar_eq] at hG
  rw [roundYamabeConstant_sq]
  linarith only [hG]

private theorem attainedYamabe_floor
    {BachFlat : SmoothRiemannianMetric I M → Prop} {a : ℝ} {q : SignedCollarMetric o}
    (hq : AttainedYamabeAt BachFlat a q) (hEuler : bourEuler q = 16 * Real.pi ^ 2)
    {δ : ℝ} (hδ : 0 < δ) (hGap : a ≤ 8 * Real.pi ^ 2 - δ) :
    Real.sqrt (48 * δ) ≤ classYamabeFour o.dimension_eq q.metric := by
  have hRic := attainedYamabe_ricci_eq hq hEuler
  rw [roundYamabeConstant_sq] at hRic
  have hsq : 48 * δ ≤ (classYamabeFour o.dimension_eq q.metric) ^ 2 := by
    linarith only [hRic, hGap, bourRicci_nonneg q]
  simpa only [Real.sqrt_sq hq.positive.le] using Real.sqrt_le_sqrt hsq

private theorem attainedYamabe_subsequence
    {BachFlat : SmoothRiemannianMetric I M → Prop} {a δ : ℝ}
    (hCompact : AttainedFirstValueCompactness o BachFlat a)
    (hδ : 0 < δ) (hGap : a ≤ 8 * Real.pi ^ 2 - δ)
    (hEuler : ∀ q : SignedCollarMetric o, bourEuler q = 16 * Real.pi ^ 2)
    (q : ℕ → SignedCollarMetric o) (hq : ∀ j, AttainedYamabeAt BachFlat a (q j)) :
    ∃ (k : ℕ → ℕ), StrictMono k ∧ ∃ limit : SignedCollarMetric o,
      AttainedYamabeAt BachFlat a limit ∧
      Tendsto (fun j => classYamabeFour o.dimension_eq (q (k j)).metric) atTop
        (𝓝 (classYamabeFour o.dimension_eq limit.metric)) := by
  obtain ⟨k, hk, Φ, hΦ, limit, hb, he, hConv⟩ := hCompact q hq
  let p := fun j => (q (k j)).pullbackCross (Φ j) (hΦ j)
  have hY (j) : classYamabeFour o.dimension_eq (p j).metric =
      classYamabeFour o.dimension_eq (q (k j)).metric := (q (k j)).yamabe_pullbackCross (Φ j) (hΦ j)
  have hVol (j) : riemannianVolumeMeasure I M (p j).metric univ = 1 := by
    change riemannianVolumeMeasure I M (Diffeomorph.pullbackMetricCross (q (k j)).metric (Φ j)) univ = 1
    rw [riemannianVolumeMeasure_pullback_cross,
      Measure.map_apply (Φ j).symm.continuous.measurable MeasurableSet.univ, preimage_univ]
    exact (hq (k j)).volume_one
  have hScalar (j x) : metricScalarAt (p j).metric x = classYamabeFour o.dimension_eq (p j).metric := by
    rw [hY, ← (hq (k j)).scalar_eq (Φ j x)]
    change metricScalarAt (Diffeomorph.pullbackMetricCross (q (k j)).metric (Φ j)) x = _
    have hs : scaleMetric 1 zero_lt_one (q (k j)).metric = (q (k j)).metric := by
      apply SmoothRiemannianMetric.ext_inner
      intro x v w
      rw [scaleMetric_inner, one_mul]
    simpa only [hs, div_one] using
      metricScalarAt_pullback_scaleMetricCross (q (k j)).metric (Φ j) 1 zero_lt_one x
  have hFloor (j) : Real.sqrt (48 * δ) ≤ classYamabeFour o.dimension_eq (p j).metric := by
    rw [hY]
    exact attainedYamabe_floor (hq (k j)) (hEuler _) hδ hGap
  have hPos : 0 < Real.sqrt (48 * δ) := Real.sqrt_pos_of_pos (by positivity)
  obtain ⟨hv, hs, hf, ht⟩ := attainedYamabe_limit_of_metricConvergence
    o.dimension_eq hConv hPos hFloor hVol hScalar
  exact ⟨k, hk, limit, ⟨hPos.trans_le hf, hb, he, hv, hs⟩, ht.congr fun j => hY j⟩

variable [ConnectedSpace M]

omit [BoundarylessManifold I M] in
private theorem attainedYamabe_firstValue_nonempty
    {BachFlat : SmoothRiemannianMetric I M → Prop}
    (hX : ∃ q : SignedCollarMetric o, 0 < classYamabeFour o.dimension_eq q.metric ∧
      BachFlat q.metric ∧ q.energy .plus = sInf (geometricPositiveEnergies o))
    (hPositive : 0 < sInf (geometricPositiveEnergies o))
    (hBelow : sInf (geometricPositiveEnergies o) < 8 * Real.pi ^ 2)
    (hNormalize : BourYamabeNormalization o)
    (hBachConformal : ∀ (g : SmoothRiemannianMetric I M) (u : C^∞⟮I, M; ℝ⟯),
      BachFlat g → BachFlat (conformalMetric g u)) :
    sInf (geometricPositiveEnergies o) = sInf (attainedBachValues o BachFlat) ∧
      ∃ q : SignedCollarMetric o, AttainedYamabeAt BachFlat (sInf (attainedBachValues o BachFlat)) q := by
  let Istar := sInf (geometricPositiveEnergies o)
  let A := attainedBachValues o BachFlat
  obtain ⟨q, hY, hB, he⟩ := hX
  have hMember : Istar ∈ A := ⟨hPositive, hBelow, q, hY, hB, he⟩
  have hBound : BddBelow A := ⟨0, fun _ he => he.1.le⟩
  have hLower (e : ℝ) (he : e ∈ A) : Istar ≤ e := by
    obtain ⟨_, _, w, hYw, _, hew⟩ := he
    exact hew ▸ csInf_le (geometricPositiveEnergies_bddBelow o) (w.energy_mem_of_positive hYw)
  have hEq : Istar = sInf A :=
    le_antisymm (le_csInf ⟨Istar, hMember⟩ hLower) (csInf_le hBound hMember)
  obtain ⟨u, w, hw, hv, hs, hEw⟩ := hNormalize q.metric q.frame hY (q.integrable .plus)
    (show q.energy .plus < 8 * Real.pi ^ 2 by rw [he]; exact hBelow)
  have hYw : classYamabeFour o.dimension_eq w.metric = classYamabeFour o.dimension_eq q.metric := by
    rw [hw, classYamabeFour_conformalCore]
  refine ⟨hEq, w, ⟨hYw.symm ▸ hY, hw.symm ▸ hBachConformal q.metric u hB, ?_, hv, ?_⟩⟩
  · exact hEw.trans (he.trans hEq)
  · intro x
    exact (hs x).trans hYw.symm

/-- Conditional on working same-type attainment (X) and smooth first-value
compactness, there is a least ordinary trace-free Ricci integral on the
exact unit-volume positive Yamabe stratum. An independently selected
maximum Yamabe square gives the sharp uniform positive squared deficit
on the same stratum. -/
theorem exists_attainedYamabe_leastRicci
    (o : ManifoldOrientation I M 4) (BachFlat : SmoothRiemannianMetric I M → Prop)
    (hX : ∃ q : SignedCollarMetric o, 0 < classYamabeFour o.dimension_eq q.metric ∧
      BachFlat q.metric ∧ q.energy .plus = sInf (geometricPositiveEnergies o))
    (hPositive : 0 < sInf (geometricPositiveEnergies o))
    {δ : ℝ} (hδ : 0 < δ)
    (hGap : sInf (geometricPositiveEnergies o) ≤ 8 * Real.pi ^ 2 - δ)
    (hNormalize : BourYamabeNormalization o)
    (hBachConformal : ∀ (g : SmoothRiemannianMetric I M) (u : C^∞⟮I, M; ℝ⟯),
      BachFlat g → BachFlat (conformalMetric g u))
    (hCompact : AttainedFirstValueCompactness o BachFlat (sInf (attainedBachValues o BachFlat)))
    (hEuler : ∀ q : SignedCollarMetric o, bourEuler q = 16 * Real.pi ^ 2)
    (hRound : ∀ q : SignedCollarMetric o, classYamabeFour o.dimension_eq q.metric ≤ roundYamabeConstant)
    (hRoundEquality : ∀ q : SignedCollarMetric o,
      classYamabeFour o.dimension_eq q.metric = roundYamabeConstant → q.energy .plus = 0) :
    let Istar := sInf (geometricPositiveEnergies o)
    let a := sInf (attainedBachValues o BachFlat)
    let S := {q : SignedCollarMetric o | AttainedYamabeAt BachFlat a q}
    let Y₂ := fun q : SignedCollarMetric o => (classYamabeFour o.dimension_eq q.metric) ^ 2
    Istar = a ∧
    (∃ q ∈ S, IsLeast (Y₂ '' S) (Y₂ q) ∧ IsLeast (bourRicci '' S) (bourRicci q)) ∧
    (∃ q ∈ S, IsGreatest (Y₂ '' S) (Y₂ q) ∧
      0 < roundYamabeConstant ^ 2 - Y₂ q ∧
      ∀ w ∈ S, roundYamabeConstant ^ 2 - Y₂ q ≤ roundYamabeConstant ^ 2 - Y₂ w) := by
  intro Istar a S Y₂
  obtain ⟨hEq, q₀, hq₀⟩ := attainedYamabe_firstValue_nonempty hX hPositive
    (hGap.trans_lt (sub_lt_self _ hδ)) hNormalize hBachConformal
  have hBelow : a ≤ 8 * Real.pi ^ 2 - δ := hEq ▸ hGap
  have hNonempty : (Y₂ '' S).Nonempty := ⟨Y₂ q₀, q₀, hq₀, rfl⟩
  have hBoundBelow : BddBelow (Y₂ '' S) := ⟨0, by
    rintro _ ⟨q, _, rfl⟩
    exact sq_nonneg _⟩
  have hBoundAbove : BddAbove (Y₂ '' S) := ⟨roundYamabeConstant ^ 2, by
    rintro _ ⟨q, hq, rfl⟩
    exact (sq_le_sq₀ hq.positive.le roundYamabeConstant_pos.le).mpr (hRound q)⟩
  have hRealize {r : ℕ → ℝ} {b : ℝ} (hr : Tendsto r atTop (𝓝 b))
      (hrMem : ∀ j, r j ∈ Y₂ '' S) : ∃ q ∈ S, Y₂ q = b := by
    choose q hq he using hrMem
    obtain ⟨k, hk, limit, hLim, hY⟩ := attainedYamabe_subsequence
      hCompact hδ hBelow hEuler q hq
    have hSeq : Tendsto (fun j => Y₂ (q (k j))) atTop (𝓝 b) :=
      (hr.comp hk.tendsto_atTop).congr (fun j => he (k j)).symm
    exact ⟨limit, hLim, tendsto_nhds_unique (hY.pow 2) hSeq⟩
  refine ⟨hEq, ?_, ?_⟩
  · obtain ⟨r, _, hr, hrMem⟩ := exists_seq_tendsto_sInf hNonempty hBoundBelow
    obtain ⟨q, hq, hqVal⟩ := hRealize hr hrMem
    have hLeast : IsLeast (Y₂ '' S) (Y₂ q) := hqVal.symm ▸ isLeast_csInf ⟨q, hq, hqVal⟩ hBoundBelow
    refine ⟨q, hq, hLeast, ⟨⟨q, hq, rfl⟩, ?_⟩⟩
    rintro _ ⟨w, hw, rfl⟩
    have hOrder : Y₂ q ≤ Y₂ w := hLeast.2 ⟨w, hw, rfl⟩
    have hqRic := attainedYamabe_ricci_eq hq (hEuler q)
    have hwRic := attainedYamabe_ricci_eq hw (hEuler w)
    change (classYamabeFour o.dimension_eq q.metric) ^ 2 ≤
      (classYamabeFour o.dimension_eq w.metric) ^ 2 at hOrder
    linarith only [hqRic, hwRic, hOrder]
  · obtain ⟨r, _, hr, hrMem⟩ := exists_seq_tendsto_sSup hNonempty hBoundAbove
    obtain ⟨q, hq, hqVal⟩ := hRealize hr hrMem
    have hGreatest : IsGreatest (Y₂ '' S) (Y₂ q) :=
      hqVal.symm ▸ isGreatest_csSup ⟨q, hq, hqVal⟩ hBoundAbove
    have hSubround : classYamabeFour o.dimension_eq q.metric < roundYamabeConstant := by
      refine lt_of_le_of_ne (hRound q) fun h => ?_
      exact hPositive.ne' (hEq.trans (hq.plus_eq.symm.trans (hRoundEquality q h)))
    refine ⟨q, hq, hGreatest, ?_, ?_⟩
    · exact sub_pos.mpr ((sq_lt_sq₀ hq.positive.le roundYamabeConstant_pos.le).mpr hSubround)
    · exact fun w hw => sub_le_sub_left (hGreatest.2 ⟨w, hw, rfl⟩) _

end Selection

end SmoothPoincare
