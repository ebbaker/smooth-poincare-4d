import SmoothPoincare.Variational.BourChristoffelTime
import SmoothPoincare.Variational.BourTensorFirstVariation
import DifferentialGeometry.Analysis.Calculus.TimeJet.PartialDerivatives
import DifferentialGeometry.Geometry.Connection.ChartBridge.TensorDerivative
import DifferentialGeometry.Geometry.Connection.TensorNabla.Tensor0S.MetricConnectionDifference

/-! # Palatini variation on the original Bour metric family

E50, 26 November 2026. Prepared for Edward B. Baker III with OpenAI Codex
assistance. Actual serving model and effort were unavailable.
-/

open Bundle DifferentialGeometry DifferentialGeometry.Analysis DifferentialGeometry.Geometry.Connection
  DifferentialGeometry.Geometry.Curvature DifferentialGeometry.Geometry.Operator
  DifferentialGeometry.Integral.DivergenceTheorem DifferentialGeometry.PDE.RicciFlow
  DifferentialGeometry.Tensor.Coordinates DifferentialGeometry.Tensor0SBundle Set
open scoped ContDiff Manifold Topology

namespace SmoothPoincare.Bour

noncomputable section

variable {E H M : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
  [FiniteDimensional ℝ E] [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]

/-- Chart components of the covariant derivative of a tensor with one upper
and two lower indices. The tensor's output index is the last index of C. -/
def bourChartRaisedCovDeriv (g : SmoothRiemannianMetric I M) (x₀ : M)
    (C : Fin (Module.finrank ℝ E) → Fin (Module.finrank ℝ E) →
      Fin (Module.finrank ℝ E) → E → ℝ)
    (d i k j : Fin (Module.finrank ℝ E)) (y : E) : ℝ :=
  partialDeriv d (C i k j) y +
    ∑ m : Fin (Module.finrank ℝ E),
      (chartChristoffel g x₀ d m j y * C i k m y -
        chartChristoffel g x₀ d i m y * C m k j y -
        chartChristoffel g x₀ d k m y * C i m j y)

private theorem bourChartPalatini_algebra
    (g : SmoothRiemannianMetric I M) (x₀ : M)
    (C : Fin (Module.finrank ℝ E) → Fin (Module.finrank ℝ E) →
      Fin (Module.finrank ℝ E) → E → ℝ)
    (i k j : Fin (Module.finrank ℝ E)) (y : E)
    (hC : ∀ a b c, C a b c y = C b a c y) :
    let Γ := chartChristoffel g x₀
    (partialDeriv j (C i k j) y - partialDeriv k (C i j j) y) +
        ∑ m : Fin (Module.finrank ℝ E),
          ((C j m j y * Γ i k m y + Γ j m j y * C i k m y) -
            (C k m j y * Γ i j m y + Γ k m j y * C i j m y)) =
      bourChartRaisedCovDeriv g x₀ C j i k j y -
        bourChartRaisedCovDeriv g x₀ C k i j j y := by
  dsimp only [bourChartRaisedCovDeriv]
  have hsum :
      (∑ m : Fin (Module.finrank ℝ E),
        ((C j m j y * chartChristoffel g x₀ i k m y +
            chartChristoffel g x₀ j m j y * C i k m y) -
          (C k m j y * chartChristoffel g x₀ i j m y +
            chartChristoffel g x₀ k m j y * C i j m y))) =
      ∑ m : Fin (Module.finrank ℝ E),
        ((chartChristoffel g x₀ j m j y * C i k m y -
            chartChristoffel g x₀ j i m y * C m k j y -
            chartChristoffel g x₀ j k m y * C i m j y) -
          (chartChristoffel g x₀ k m j y * C i j m y -
            chartChristoffel g x₀ k i m y * C m j j y -
            chartChristoffel g x₀ k j m y * C i m j y)) := by
    refine Finset.sum_congr rfl fun m _ => ?_
    rw [← chartChristoffel_symm g x₀ i j m y, ← chartChristoffel_symm g x₀ i k m y,
      ← chartChristoffel_symm g x₀ j k m y, ← hC k m j, ← hC j m j]
    ring
  rw [hsum, Finset.sum_sub_distrib]
  ring

/-- The actual regular-slice Ricci derivative in the fixed chart is the
divergence of the connection speed minus the covariant derivative of its trace. -/
theorem bourMetricRicciAt_chartPalatini_hasDerivAt [I.Boundaryless] [T2Space M]
    (g : ℝ → SmoothRiemannianMetric I M)
    {D : RealTimeInterval} (hG : MetricFamilySmoothOn (I := I) D g)
    {t : ℝ} (ht : t ∈ D.regular) (x₀ : M) {x : M}
    (hx : x ∈ (extChartAt I x₀).source) (i k : Fin (Module.finrank ℝ E)) :
    let C := fun a b c z => deriv (fun s => chartChristoffel (g s) x₀ a b c z) t
    let y := extChartAt I x₀ x
    HasDerivAt
      (fun s => metricRicciAt (g s) x
        (vec2 (chartBasisVecFiber x₀ i x) (chartBasisVecFiber x₀ k x)))
      ((∑ j : Fin (Module.finrank ℝ E), bourChartRaisedCovDeriv (g t) x₀ C j i k j y) -
        ∑ j : Fin (Module.finrank ℝ E), bourChartRaisedCovDeriv (g t) x₀ C k i j j y)
      t := by
  dsimp only
  have hy : extChartAt I x₀ x ∈ interior (extChartAt I x₀).target := by
    rw [(isOpen_extChartAt_target (I := I) x₀).interior_eq]
    exact (extChartAt I x₀).map_source hx
  have hC (a b c : Fin (Module.finrank ℝ E)) (y : E) :
      deriv (fun s => chartChristoffel (g s) x₀ a b c y) t =
        deriv (fun s => chartChristoffel (g s) x₀ b a c y) t := by
    congr 1
    funext s
    exact chartChristoffel_symm (g s) x₀ a b c y
  refine (bourMetricRicciAt_chartBasis_hasDerivAt g hG ht x₀ hx i k).congr_deriv ?_
  rw [(bourChartRicci_hasDerivAt g hG ht x₀ hy i k).deriv, ← Finset.sum_sub_distrib]
  exact Finset.sum_congr rfl fun j _ => bourChartPalatini_algebra (g t) x₀
    (fun a b c z => deriv (fun s => chartChristoffel (g s) x₀ a b c z) t)
    i k j _ (fun a b c => hC a b c _)

variable [I.Boundaryless] [T2Space M] [BoundarylessManifold I M]

/-- The lowered Christoffel speed in the entire chart source is the
Koszul flux of the original metric velocity. -/
theorem bourKoszulFlux_chart_eq_gram_mul (g : ℝ → SmoothRiemannianMetric I M)
    {D : RealTimeInterval} (hG : MetricFamilySmoothOn (I := I) D g)
    {t : ℝ} (ht : t ∈ D.regular) (x₀ : M) {x : M}
    (hx : x ∈ (extChartAt I x₀).source) (a i k : Fin (Module.finrank ℝ E)) :
    let b := fun j => chartBasisVecFiber (I := I) x₀ j x
    bourKoszulFlux (g t) (bourMetricVelocity g hG ht) x (Fin.cons (b a) (vec2 (b i) (b k))) =
      ∑ j : Fin (Module.finrank ℝ E),
        (g t).inner x (b j) (b a) *
          deriv (fun s => chartChristoffel (g s) x₀ i k j (extChartAt I x₀ x)) t := by
  classical
  dsimp only
  let b := fun j => chartBasisVecFiber (I := I) x₀ j x
  have hxgood := (mem_chartLeviCivitaGoodSet_iff_mem_extChartAt_source (I := I) x₀ x).2 hx
  have hy := chartLeviCivitaGoodSet_extChartAt_mem_interior (I := I) hxgood
  have hΓ (j : Fin (Module.finrank ℝ E)) :
      HasDerivAt (fun s => chartChristoffel (g s) x₀ i k j (extChartAt I x₀ x))
        (deriv (fun s => chartChristoffel (g s) x₀ i k j (extChartAt I x₀ x)) t) t := by
    have hsmooth := hG.chartChristoffelOnE_contDiffOn (J := D.regular)
      Subset.rfl D.regular_isOpen.uniqueDiffOn x₀ i k j
    have hAt := (hsmooth (t, extChartAt I x₀ x) ⟨ht, hy⟩).contDiffAt
      ((D.regular_isOpen.prod isOpen_interior).mem_nhds ⟨ht, hy⟩)
    have hline : ContDiffAt ℝ ∞ (fun s : ℝ => (s, extChartAt I x₀ x)) t := by fun_prop
    exact ((hAt.comp t hline).differentiableAt (by simp)).hasDerivAt
  have hsum := HasDerivAt.fun_sum (u := Finset.univ) fun j _ =>
    (hΓ j).smul (hasDerivAt_const t (b j))
  simp only [smul_zero, zero_add] at hsum
  have hderiv := leviCivita_difference_hasDerivAt_of_metricFamilySmoothOn hG
    (D.regular_isOpen.mem_nhds ht) (bourMetricVelocity g hG ht)
    (fun y v w => by
      have h := hG.hasDerivAt_inner ht y v w
      exact h) x
  have hd := (hderiv.clm_apply (hasDerivAt_const t (b k))).clm_apply
    (hasDerivAt_const t (b i))
  simp only [ContinuousLinearMap.map_zero, add_zero] at hd
  have hdiff (s : ℝ) :
      CovariantDerivative.difference (LeviCivita (g s)) (LeviCivita (g t)) x (b k) (b i) =
        (∑ j, chartChristoffel (g s) x₀ i k j (extChartAt I x₀ x) • b j) -
          ∑ j, chartChristoffel (g t) x₀ i k j (extChartAt I x₀ x) • b j := by
    change IsCovariantDerivativeOn.difference _ _ x _ _ = _
    rw [IsCovariantDerivativeOn.difference_apply _ _ (Set.mem_univ x)
      (chartBasisVec_alpha_mdifferentiableAt (I := I) x₀ k hxgood)]
    simp only [sub_apply]
    dsimp only [b]
    rw [LeviCivita_chartBasisVec_alpha_basis_apply (g s) x₀ i k hxgood,
      LeviCivita_chartBasisVec_alpha_basis_apply (g t) x₀ i k hxgood]
  simp_rw [hdiff] at hd
  rw [bourKoszulFlux_native g hG ht x (b i) (b k) (b a),
    hd.unique (hsum.sub_const _)]
  simp only [map_sum, sum_apply, map_smul, smul_apply, smul_eq_mul]
  exact Finset.sum_congr rfl fun _ _ => mul_comm _ _

private theorem lowerCovDeriv_algebra {ι : Type*} [Fintype ι]
    (G : ι → ι → ℝ) (Γ C : ι → ι → ι → ℝ) (DC : ι → ℝ) (d a i k : ι) :
    (∑ j, (((∑ m, Γ d j m * G m a) + ∑ m, Γ d a m * G j m) * C i k j +
      G j a * DC j)) -
      ((∑ m, Γ d a m * ∑ j, G j m * C i k j) +
        (∑ m, Γ d i m * ∑ j, G j a * C m k j) +
        ∑ m, Γ d k m * ∑ j, G j a * C i m j) =
      ∑ j, G j a * (DC j + ∑ m,
        (Γ d m j * C i k m - Γ d i m * C m k j - Γ d k m * C i m j)) := by
  have hUpper :
      (∑ j, ∑ m, Γ d j m * G m a * C i k j) =
      ∑ j, ∑ m, G j a * (Γ d m j * C i k m) := by
    rw [Finset.sum_comm]
    exact Finset.sum_congr rfl fun j _ => Finset.sum_congr rfl fun m _ => by ring
  have hCancel :
      (∑ j, ∑ m, Γ d a m * G j m * C i k j) =
      ∑ m, ∑ j, Γ d a m * (G j m * C i k j) := by
    rw [Finset.sum_comm]
    exact Finset.sum_congr rfl fun m _ => Finset.sum_congr rfl fun j _ => by ring
  have hSlotI :
      (∑ m, ∑ j, Γ d i m * (G j a * C m k j)) =
      ∑ j, ∑ m, G j a * (Γ d i m * C m k j) := by
    rw [Finset.sum_comm]
    exact Finset.sum_congr rfl fun j _ => Finset.sum_congr rfl fun m _ => by ring
  have hSlotK :
      (∑ m, ∑ j, Γ d k m * (G j a * C i m j)) =
      ∑ j, ∑ m, G j a * (Γ d k m * C i m j) := by
    rw [Finset.sum_comm]
    exact Finset.sum_congr rfl fun j _ => Finset.sum_congr rfl fun m _ => by ring
  simp only [add_mul, mul_add, mul_sub, Finset.sum_add_distrib, Finset.sum_sub_distrib,
    Finset.sum_mul, Finset.mul_sum, hUpper, hCancel, hSlotI, hSlotK]
  ring

end
end SmoothPoincare.Bour
