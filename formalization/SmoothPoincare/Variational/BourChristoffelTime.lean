import DifferentialGeometry.Geometry.Metric.Family.ChartCurvature.MetricFamilySmoothOn
import DifferentialGeometry.Geometry.Connection.ChartBridge.Curvature.BasisIdentityOffCenter
import DifferentialGeometry.Geometry.Curvature.Metric.LeviCivita

/-! # Christoffel time derivatives on the original Bour metric family

E49, 26 November 2026. Prepared for Edward B. Baker III with OpenAI Codex
assistance. Actual serving model and effort were unavailable.
-/

open DifferentialGeometry DifferentialGeometry.Analysis DifferentialGeometry.Geometry.Connection
  DifferentialGeometry.Geometry.Curvature DifferentialGeometry.Geometry.Operator
  DifferentialGeometry.Tensor.Coordinates Set
open scoped ContDiff Manifold

namespace SmoothPoincare.Bour

noncomputable section

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [FiniteDimensional ℝ E] [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]

/-- In one fixed chart of the original smooth metric family, differentiate
a spatial Christoffel derivative by differentiating the coefficient in
time first. The time and space derivatives both concern the actual metric. -/
theorem bourChartChristoffel_spatial_hasDerivAt (g : ℝ → SmoothRiemannianMetric I M)
    {D : RealTimeInterval} (hG : MetricFamilySmoothOn (I := I) D g)
    {t : ℝ} (ht : t ∈ D.regular) (x₀ : M) {y : E}
    (hy : y ∈ interior (extChartAt I x₀).target)
    (dir i j k : Fin (Module.finrank ℝ E)) :
    HasDerivAt
      (fun s => partialDeriv dir (chartChristoffel (g s) x₀ i j k) y)
      (partialDeriv dir (fun z => deriv (fun s => chartChristoffel (g s) x₀ i j k z) t) y) t := by
  have hsmooth := hG.chartChristoffelOnE_contDiffOn (J := D.regular)
    Subset.rfl D.regular_isOpen.uniqueDiffOn x₀ i j k
  have hAt := (hsmooth (t, y) ⟨ht, hy⟩).contDiffAt
    ((D.regular_isOpen.prod isOpen_interior).mem_nhds ⟨ht, hy⟩)
  exact fderiv_deriv_hasDerivAt_comm _ t y (chartModelBasis E dir) hAt

/-- The time derivative of the actual coordinate Ricci component on the
regular metric family. The Christoffel speed uses the same fixed chart for
all times and all points of the chart. -/
theorem bourChartRicci_hasDerivAt (g : ℝ → SmoothRiemannianMetric I M)
    {D : RealTimeInterval} (hG : MetricFamilySmoothOn (I := I) D g)
    {t : ℝ} (ht : t ∈ D.regular) (x₀ : M) {y : E}
    (hy : y ∈ interior (extChartAt I x₀).target)
    (i k : Fin (Module.finrank ℝ E)) :
    let Γ := chartChristoffel (g t) x₀
    let C := fun a b c z => deriv (fun s => chartChristoffel (g s) x₀ a b c z) t
    HasDerivAt (fun s => chartRicciTensor (g s) x₀ i k y)
      (∑ j : Fin (Module.finrank ℝ E),
        ((partialDeriv j (C i k j) y - partialDeriv k (C i j j) y) +
          ∑ m : Fin (Module.finrank ℝ E),
            ((C j m j y * Γ i k m y + Γ j m j y * C i k m y) -
              (C k m j y * Γ i j m y + Γ k m j y * C i j m y)))) t := by
  dsimp only
  have hΓ (a b c : Fin (Module.finrank ℝ E)) :
      HasDerivAt (fun s => chartChristoffel (g s) x₀ a b c y)
        (deriv (fun s => chartChristoffel (g s) x₀ a b c y) t) t := by
    have hsmooth := hG.chartChristoffelOnE_contDiffOn (J := D.regular)
      Subset.rfl D.regular_isOpen.uniqueDiffOn x₀ a b c
    have hAt := (hsmooth (t, y) ⟨ht, hy⟩).contDiffAt
      ((D.regular_isOpen.prod isOpen_interior).mem_nhds ⟨ht, hy⟩)
    have hline : ContDiffAt ℝ ∞ (fun s : ℝ => (s, y)) t := by fun_prop
    exact ((hAt.comp t hline).differentiableAt (by simp)).hasDerivAt
  simp only [chartRicciTensor_def, chartRiemannTensor_def]
  let indices : Finset (Fin (Module.finrank ℝ E)) := Finset.univ
  refine HasDerivAt.fun_sum (𝕜 := ℝ) (F := ℝ) (u := indices) (fun j _ => ?_)
  exact ((bourChartChristoffel_spatial_hasDerivAt g hG ht x₀ hy j i k j).sub
    (bourChartChristoffel_spatial_hasDerivAt g hG ht x₀ hy k i j j)).add
      (HasDerivAt.fun_sum (u := indices) fun m _ =>
        ((hΓ j m j).mul (hΓ i k m)).sub ((hΓ k m j).mul (hΓ i j m)))

/-- The fixed-chart formula computes the derivative of the physical Ricci
tensor on the chart's actual basis vectors in the tangent space at x. -/
theorem bourMetricRicciAt_chartBasis_hasDerivAt [I.Boundaryless] [T2Space M]
    (g : ℝ → SmoothRiemannianMetric I M)
    {D : RealTimeInterval} (hG : MetricFamilySmoothOn (I := I) D g)
    {t : ℝ} (ht : t ∈ D.regular) (x₀ : M) {x : M}
    (hx : x ∈ (extChartAt I x₀).source) (i k : Fin (Module.finrank ℝ E)) :
    HasDerivAt
      (fun s => metricRicciAt (g s) x
        (vec2 (chartBasisVecFiber x₀ i x) (chartBasisVecFiber x₀ k x)))
      (deriv (fun s => chartRicciTensor (g s) x₀ i k (extChartAt I x₀ x)) t) t := by
  have hy : extChartAt I x₀ x ∈ interior (extChartAt I x₀).target := by
    rw [(isOpen_extChartAt_target (I := I) x₀).interior_eq]
    exact (extChartAt I x₀).map_source hx
  have hRic := (bourChartRicci_hasDerivAt g hG ht x₀ hy i k).differentiableAt.hasDerivAt
  refine hRic.congr_of_eventuallyEq ?_
  filter_upwards [] with s
  rw [metricRicciAt_apply_eq_ricciTensor, ricciTensor_chartBasisVec_alpha_eq]
  exact (mem_chartLeviCivitaGoodSet_iff_mem_extChartAt_source (I := I) x₀ x).2 hx

end
end SmoothPoincare.Bour
