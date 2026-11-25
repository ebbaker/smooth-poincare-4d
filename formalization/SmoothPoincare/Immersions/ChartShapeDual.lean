import SmoothPoincare.Immersions.ImmersionChart
import Mathlib.Analysis.Calculus.ContDiff.FiniteDimension
import Mathlib.LinearAlgebra.Dual.Lemmas

/-! # Raising the normal form with the actual chart metric -/

open Bundle DifferentialGeometry DifferentialGeometry.Geometry
open DifferentialGeometry.Geometry.Connection DifferentialGeometry.Geometry.Operator
open DifferentialGeometry.Geometry.Riemannian.Geodesic
open Filter Manifold Set
open scoped ContDiff Manifold Topology

namespace SmoothPoincare

open private chartMetricBilin_eq_sum
  from DifferentialGeometry.Geometry.Submanifold.SecondFundamentalForm.MetricCompatibility

variable {E H M : Type*}
  [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]

theorem chartMetricBilin_contDiffOn_target (g : SmoothRiemannianMetric I M) (p : M) :
    ContDiffOn ℝ ∞ (chartMetricBilin g p) (extChartAt I p).target := by
  apply contDiffOn_clm_apply.mpr
  intro u
  apply contDiffOn_clm_apply.mpr
  intro v
  simp_rw [chartMetricBilin_eq_sum]
  refine ContDiffOn.sum fun i _ => ContDiffOn.sum fun j _ => ?_
  exact ((chartGramOnE_contDiffOn g p i j).mul contDiffOn_const).mul contDiffOn_const

omit [FiniteDimensional ℝ E] in
theorem chartMetricBilin_pos_onTarget (g : SmoothRiemannianMetric I M) (p : M)
    {z : E} (hz : z ∈ (extChartAt I p).target) {u : E} (hu : u ≠ 0) :
    0 < chartMetricBilin g p z u u := by
  have hp : (extChartAt I p).symm z ∈ (trivializationAt E (TangentSpace I) p).baseSet := by
    simpa only [TangentBundle.trivializationAt_baseSet, extChartAt_source] using
      (extChartAt I p).map_target hz
  rw [chartMetricBilin_apply]
  apply g.pos
  intro hzero
  apply hu
  calc
    u = trivToE I p ((extChartAt I p).symm z)
        (trivFromE I p ((extChartAt I p).symm z) u) := (trivToE_trivFromE I p hp u).symm
    _ = 0 := by rw [hzero, map_zero]

private theorem chartMetricBilin_isInvertible (g : SmoothRiemannianMetric I M) (p : M)
    {z : E} (hz : z ∈ (extChartAt I p).target) : (chartMetricBilin g p z).IsInvertible := by
  let K := chartMetricBilin g p z
  have hInjective : Function.Injective K.toLinearMap := by
    intro u v huv
    apply sub_eq_zero.mp
    by_contra hne
    have hz' : K (u - v) = 0 := by
      rw [map_sub]
      exact sub_eq_zero.mpr huv
    exact (chartMetricBilin_pos_onTarget g p hz hne).ne' (by rw [show chartMetricBilin g p z = K from rfl, hz', zero_apply])
  let eDual : Module.Dual ℝ E ≃ₗ[ℝ] (E →L[ℝ] ℝ) := LinearMap.toContinuousLinearMap
  have hDim : Module.finrank ℝ E = Module.finrank ℝ (E →L[ℝ] ℝ) :=
    Subspace.dual_finrank_eq.symm.trans eDual.finrank_eq
  let e := (K.toLinearMap.linearEquivOfInjective hInjective hDim).toContinuousLinearEquiv
  exact ⟨e, rfl⟩

/-- Raising a supplied `C²` bilinear form by the actual chart metric gives a
`C²` shape operator throughout the same chart domain. -/
theorem exists_chartShapeDual (g : SmoothRiemannianMetric I M) (p : M)
    (b : E → E →L[ℝ] E →L[ℝ] ℝ) {U : Set E} (hU : U ⊆ (extChartAt I p).target)
    (hb : ContDiffOn ℝ 2 b U) :
    ∃ S : E → E →L[ℝ] E, ContDiffOn ℝ 2 S U ∧
      ∀ z ∈ U, ∀ u v, b z u v = chartMetricBilin g p z (S z u) v := by
  let : CompleteSpace E := FiniteDimensional.complete ℝ E
  let K := chartMetricBilin g p
  have hK : ContDiffOn ℝ 2 K U :=
    ((chartMetricBilin_contDiffOn_target g p).mono hU).of_le (by norm_num)
  have hInverse : ContDiffOn ℝ 2 (fun z => (K z).inverse) U := by
    intro z hz
    exact (chartMetricBilin_isInvertible g p (hU hz)).contDiffAt_map_inverse.comp_contDiffWithinAt z
      (hK z hz)
  refine ⟨fun z => (K z).inverse.comp (b z), hInverse.clm_comp hb, ?_⟩
  intro z hz u v
  change b z u v = K z ((K z).inverse (b z u)) v
  exact (congrArg (fun L : E →L[ℝ] ℝ => L v)
    ((chartMetricBilin_isInvertible g p (hU hz)).self_apply_inverse (b z u))).symm

section ChartNormal

variable {W : Type*} [NormedAddCommGroup W] [InnerProductSpace ℝ W]

/-- The continuous bilinear normal component of the chart Hessian. -/
noncomputable def chartNormalHessianBilin (f n : E → W) (z : E) :
    E →L[ℝ] E →L[ℝ] ℝ :=
  (ContinuousLinearMap.compL ℝ E W ℝ (innerSL ℝ (n z))).comp (fderiv ℝ (fderiv ℝ f) z)

omit [FiniteDimensional ℝ E] in
theorem chartNormalHessianBilin_eq_chartNormalForm (Γ : E → E →L[ℝ] E →L[ℝ] E)
    (f n : E → W) (z : E) (hPerp : ∀ v, inner ℝ (fderiv ℝ f z v) (n z) = 0) (u v : E) :
    chartNormalHessianBilin f n z u v = chartNormalForm Γ f n z u v := by
  change inner ℝ (n z) (fderiv ℝ (fderiv ℝ f) z u v) =
    inner ℝ (bundleMapCovDeriv Γ 0 (fderiv ℝ f) z u v) (n z)
  calc
    _ = inner ℝ (fderiv ℝ (fderiv ℝ f) z u v) (n z) := real_inner_comm _ _
    _ = _ := by simp [bundleMapCovDeriv, inner_sub_left, hPerp]

theorem chartNormalHessianBilin_contDiffOn {f n : E → W} {U : Set E}
    (hOpen : IsOpen U) (hf : ContDiffOn ℝ 4 f U) (hn : ContDiffOn ℝ 2 n U) :
    ContDiffOn ℝ 2 (chartNormalHessianBilin f n) U := by
  have hDf : ContDiffOn ℝ 3 (fderiv ℝ f) U := hf.fderiv_of_isOpen hOpen (by norm_num)
  have hHess : ContDiffOn ℝ 2 (fderiv ℝ (fderiv ℝ f)) U := hDf.fderiv_of_isOpen hOpen (by norm_num)
  apply contDiffOn_clm_apply.mpr
  intro u
  apply contDiffOn_clm_apply.mpr
  intro v
  change ContDiffOn ℝ 2 (fun z => inner ℝ (n z) (fderiv ℝ (fderiv ℝ f) z u v)) U
  exact hn.inner ℝ ((hHess.clm_apply contDiffOn_const).clm_apply contDiffOn_const)

end ChartNormal

/-- On an open set of the fixed immersion chart, the actual scalar normal form
has a `C²` metric dual. The supplied field is perpendicular to the chart
differential there. -/
theorem exists_immersionChartShapeDual [I.Boundaryless] [T2Space M]
    {g : SmoothRiemannianMetric I M} (F : IsometricHypersurface g) (p : M)
    (n : E → EuclideanSpace ℝ (Fin 5)) {U : Set E}
    (hOpen : IsOpen U) (hU : U ⊆ (extChartAt I p).target) (hn : ContDiffOn ℝ 2 n U)
    (hPerp : ∀ z ∈ U, ∀ v, inner ℝ (fderiv ℝ (F.localMap p) z v) (n z) = 0) :
    ∃ S : E → E →L[ℝ] E, ContDiffOn ℝ 2 S U ∧
      ∀ z ∈ U, ∀ u v, chartNormalForm (metricChartConnectionForm g p) (F.localMap p) n z u v =
        chartMetricBilin g p z (S z u) v := by
  have hWritten : ContDiffOn ℝ ∞ (F.localMap p) (extChartAt I p).target := by
    have h := F.smooth.comp_contMDiffOn (contMDiffOn_extChartAt_symm (n := ∞) p)
    simpa [IsometricHypersurface.localMap, writtenInExtChartAt] using
      (contMDiffOn_iff_contDiffOn.mp h)
  let b := chartNormalHessianBilin (F.localMap p) n
  have hb : ContDiffOn ℝ 2 b U :=
    chartNormalHessianBilin_contDiffOn hOpen ((hWritten.mono hU).of_le (by norm_num)) hn
  obtain ⟨S, hS, hDual⟩ := exists_chartShapeDual g p b hU hb
  refine ⟨S, hS, fun z hz u v => ?_⟩
  rw [← chartNormalHessianBilin_eq_chartNormalForm _ _ _ z (hPerp z hz) u v]
  exact hDual z hz u v

end SmoothPoincare
