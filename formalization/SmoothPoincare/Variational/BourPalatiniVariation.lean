import SmoothPoincare.Variational.BourChristoffelTime
import SmoothPoincare.Variational.BourKoszulTrace
import DifferentialGeometry.Geometry.Connection.TensorNabla.Naturality.SlotPermutation
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
  DifferentialGeometry.Tensor.Coordinates DifferentialGeometry.Tensor0SBundle
  DifferentialGeometry.Tensor.RSTensor Set
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

omit [BoundarylessManifold I M] in
private theorem chartMetric_compatibility (g : SmoothRiemannianMetric I M)
    (x₀ : M) {x : M} (hx : x ∈ (extChartAt I x₀).source)
    (d a b : Fin (Module.finrank ℝ E)) :
    let y := extChartAt I x₀ x
    partialDeriv d (chartGramOnE g x₀ a b) y =
      (∑ m, chartChristoffel g x₀ d a m y * chartGramOnE g x₀ m b y) +
      ∑ m, chartChristoffel g x₀ d b m y * chartGramOnE g x₀ a m y := by
  classical
  dsimp only
  have hxgood := (mem_chartLeviCivitaGoodSet_iff_mem_extChartAt_source (I := I) x₀ x).2 hx
  let n : Fin 2 → Fin (Module.finrank ℝ E) := ![a, b]
  have h := totalNabla0S_chartComponent g (metricTensorField g)
    (metricNabla0S g (metricTensorField g))
    (totalNabla0S_realizes 2 (metricCov g) (metricTensorField g) _) x₀ hxgood
    d n
  rw [metricNabla0S_self] at h
  have hslot₀ (j : Fin (Module.finrank ℝ E)) : Function.update n 0 j = ![j, b] := by
    funext p
    fin_cases p <;> rfl
  have hslot₁ (j : Fin (Module.finrank ℝ E)) : Function.update n 1 j = ![a, j] := by
    funext p
    fin_cases p <;> rfl
  simp only [ContMDiffSection.coe_zero, Pi.zero_apply, Tensor0SSpace.zero_apply,
    metricTensorField_apply, Fin.sum_univ_two, hslot₀, hslot₁,
    Matrix.cons_val_zero, Matrix.cons_val_one, n] at h
  have hgram (j k : Fin (Module.finrank ℝ E)) (z : E) :
      chartGramOnE g x₀ j k z =
        g.inner ((extChartAt I x₀).symm z)
          (chartBasisVecFiber x₀ j ((extChartAt I x₀).symm z))
          (chartBasisVecFiber x₀ k ((extChartAt I x₀).symm z)) := by
    exact chartGramMatrix_apply g x₀ ((extChartAt I x₀).symm z) j k
  simp only [← hgram] at h
  have hbase (j k : Fin (Module.finrank ℝ E)) :
      chartGramOnE g x₀ j k (extChartAt I x₀ x) =
        g.inner x (chartBasisVecFiber x₀ j x) (chartBasisVecFiber x₀ k x) := by
    rw [chartGramOnE_def, (extChartAt I x₀).left_inv hx, chartGramMatrix_apply]
  unfold partialDeriv
  simpa only [hbase] using sub_eq_zero.mp h.symm

private def chartCovariantComponent {s : ℕ}
    (A : Tensor0SField (I := I) (M := M) ∞ s) (x₀ : M)
    (n : Fin s → Fin (Module.finrank ℝ E)) (z : E) : ℝ :=
  A ((extChartAt I x₀).symm z)
    (fun p => chartBasisVecFiber x₀ (n p) ((extChartAt I x₀).symm z))

private theorem chartKoszulCovariantComponent (g : ℝ → SmoothRiemannianMetric I M)
    {D : RealTimeInterval} (hG : MetricFamilySmoothOn (I := I) D g)
    {t : ℝ} (ht : t ∈ D.regular) (x₀ : M) {z : E}
    (hz : z ∈ (extChartAt I x₀).target) (a i k : Fin (Module.finrank ℝ E)) :
    chartCovariantComponent (bourKoszulFlux (g t) (bourMetricVelocity g hG ht))
      x₀ (![a, i, k]) z =
      ∑ j, chartGramOnE (g t) x₀ j a z *
        deriv (fun s => chartChristoffel (g s) x₀ i k j z) t := by
  let x := (extChartAt I x₀).symm z
  have hx : x ∈ (extChartAt I x₀).source := (extChartAt I x₀).map_target hz
  have h := bourKoszulFlux_chart_eq_gram_mul g hG ht x₀ hx a i k
  dsimp only at h
  rw [show extChartAt I x₀ x = z from (extChartAt I x₀).right_inv hz] at h
  have hb :
      (fun p => chartBasisVecFiber (I := I) x₀ ((![a, i, k]) p) x) =
        Fin.cons (chartBasisVecFiber x₀ a x)
          (vec2 (chartBasisVecFiber x₀ i x) (chartBasisVecFiber x₀ k x)) := by
    funext p
    fin_cases p <;> rfl
  unfold chartCovariantComponent
  change bourKoszulFlux (g t) (bourMetricVelocity g hG ht) x _ = _
  rw [hb, h]
  rfl

private theorem partialDeriv_chartKoszul (g : ℝ → SmoothRiemannianMetric I M)
    {D : RealTimeInterval} (hG : MetricFamilySmoothOn (I := I) D g)
    {t : ℝ} (ht : t ∈ D.regular) (x₀ : M) {x : M}
    (hx : x ∈ (extChartAt I x₀).source) (d a i k : Fin (Module.finrank ℝ E)) :
    let y := extChartAt I x₀ x
    let G := chartGramOnE (g t) x₀
    let C := fun a b c z => deriv (fun s => chartChristoffel (g s) x₀ a b c z) t
    partialDeriv d (chartCovariantComponent
        (bourKoszulFlux (g t) (bourMetricVelocity g hG ht)) x₀ (![a, i, k])) y =
      ∑ j, (partialDeriv d (G j a) y * C i k j y +
        G j a y * partialDeriv d (C i k j) y) := by
  classical
  dsimp only
  let y := extChartAt I x₀ x
  let G := chartGramOnE (g t) x₀
  let C := fun a b c z => deriv (fun s => chartChristoffel (g s) x₀ a b c z) t
  have hxgood := (mem_chartLeviCivitaGoodSet_iff_mem_extChartAt_source (I := I) x₀ x).2 hx
  have hy := chartLeviCivitaGoodSet_extChartAt_mem_interior (I := I) hxgood
  have hEq : chartCovariantComponent
      (bourKoszulFlux (g t) (bourMetricVelocity g hG ht)) x₀ (![a, i, k])
      =ᶠ[𝓝 y] fun z => ∑ j, G j a z * C i k j z := by
    filter_upwards [isOpen_interior.mem_nhds hy] with z hz
    exact chartKoszulCovariantComponent g hG ht x₀ (interior_subset hz) a i k
  have hG' (j : Fin (Module.finrank ℝ E)) : DifferentiableAt ℝ (G j a) y :=
    ((((chartGramOnE_contDiffOn (g t) x₀ j a).mono interior_subset).contDiffAt
      (isOpen_interior.mem_nhds hy)).differentiableAt (by simp))
  have hC' (j : Fin (Module.finrank ℝ E)) : DifferentiableAt ℝ (C i k j) y := by
    have hsmooth := hG.chartChristoffelOnE_contDiffOn (J := D.regular)
      Subset.rfl D.regular_isOpen.uniqueDiffOn x₀ i k j
    have hAt := (hsmooth (t, y) ⟨ht, hy⟩).contDiffAt
      ((D.regular_isOpen.prod isOpen_interior).mem_nhds ⟨ht, hy⟩)
    have hc := contDiffAt_deriv_fst (m := ∞) hAt (by simp)
    exact (hc.comp y (contDiffAt_const.prodMk contDiffAt_id)).differentiableAt (by simp)
  unfold partialDeriv
  rw [hEq.fderiv_eq, fderiv_fun_sum (A := fun j z => G j a z * C i k j z)
    (fun j _ => (hG' j).mul (hC' j))]
  simp only [sum_apply]
  refine Finset.sum_congr rfl fun j _ => ?_
  rw [fderiv_fun_mul (hG' j) (hC' j)]
  simp only [add_apply, smul_apply, smul_eq_mul]
  change _ = fderiv ℝ (G j a) y (chartModelBasis E d) * C i k j y +
    G j a y * fderiv ℝ (C i k j) y (chartModelBasis E d)
  ring

/-- The covariant derivative of the actual lowered Koszul flux is the
lowering by the slice metric of the covariant derivative of the raised
Christoffel speed, using the same chart throughout. -/
theorem bourNablaKoszulFlux_chart_eq_gram_mul (g : ℝ → SmoothRiemannianMetric I M)
    {D : RealTimeInterval} (hG : MetricFamilySmoothOn (I := I) D g)
    {t : ℝ} (ht : t ∈ D.regular) (x₀ : M) {x : M}
    (hx : x ∈ (extChartAt I x₀).source) (d a i k : Fin (Module.finrank ℝ E)) :
    let y := extChartAt I x₀ x
    let b := fun j => chartBasisVecFiber (I := I) x₀ j x
    let C := fun a b c z => deriv (fun s => chartChristoffel (g s) x₀ a b c z) t
    metricNabla0S (g t) (bourKoszulFlux (g t) (bourMetricVelocity g hG ht)) x
      (Fin.cons (b d) (Fin.cons (b a) (vec2 (b i) (b k)))) =
      ∑ j, chartGramOnE (g t) x₀ j a y * bourChartRaisedCovDeriv (g t) x₀ C d i k j y := by
  classical
  dsimp only
  let y := extChartAt I x₀ x
  let G := chartGramOnE (g t) x₀
  let Γ := fun d a j => chartChristoffel (g t) x₀ d a j y
  let C := fun a b c z => deriv (fun s => chartChristoffel (g s) x₀ a b c z) t
  let b := fun j => chartBasisVecFiber (I := I) x₀ j x
  let A := bourKoszulFlux (g t) (bourMetricVelocity g hG ht)
  let n : Fin 3 → Fin (Module.finrank ℝ E) := ![a, i, k]
  have hxgood := (mem_chartLeviCivitaGoodSet_iff_mem_extChartAt_source (I := I) x₀ x).2 hx
  have hy : y ∈ (extChartAt I x₀).target := (extChartAt I x₀).map_source hx
  have h := totalNabla0S_chartComponent (g t) A (metricNabla0S (g t) A)
    (totalNabla0S_realizes 3 (metricCov (g t)) A _) x₀ hxgood d n
  have hcomp (a' i' k' : Fin (Module.finrank ℝ E)) :
      A x (fun p => b ((![a', i', k'] : Fin 3 → Fin (Module.finrank ℝ E)) p)) =
        ∑ j, G j a' y * C i' k' j y := by
    have hflux := chartKoszulCovariantComponent g hG ht x₀ hy a' i' k'
    unfold chartCovariantComponent at hflux
    rw [(extChartAt I x₀).left_inv hx] at hflux
    exact hflux
  have hb : (fun p => b (n p)) = Fin.cons (b a) (vec2 (b i) (b k)) := by
    funext p
    fin_cases p <;> rfl
  have hslot₀ (j : Fin (Module.finrank ℝ E)) :
      Function.update n 0 j = ![j, i, k] := by
    funext p
    fin_cases p <;> rfl
  have hslot₁ (j : Fin (Module.finrank ℝ E)) :
      Function.update n 1 j = ![a, j, k] := by
    funext p
    fin_cases p <;> rfl
  have hslot₂ (j : Fin (Module.finrank ℝ E)) :
      Function.update n 2 j = ![a, i, j] := by
    funext p
    fin_cases p <;> rfl
  change metricNabla0S (g t) A x (Fin.cons (b d) (fun p => b (n p))) =
    partialDeriv d (chartCovariantComponent A x₀ n) y -
      ∑ p : Fin 3, ∑ j, Γ d (n p) j * A x (fun r => b (Function.update n p j r)) at h
  simp only [hb, Fin.sum_univ_three, hslot₀, hslot₁, hslot₂, hcomp] at h
  change metricNabla0S (g t) A x (Fin.cons (b d) (Fin.cons (b a) (vec2 (b i) (b k)))) = _
  rw [h, partialDeriv_chartKoszul g hG ht x₀ hx d a i k]
  change (∑ j, (partialDeriv d (G j a) y * C i k j y +
      G j a y * partialDeriv d (C i k j) y)) - _ = _
  have hMetric (j : Fin (Module.finrank ℝ E)) :
      partialDeriv d (G j a) y =
        (∑ m, Γ d j m * G m a y) + ∑ m, Γ d a m * G j m y :=
    chartMetric_compatibility (g t) x₀ hx d j a
  simp_rw [hMetric]
  exact lowerCovDeriv_algebra (fun j a => G j a y) Γ (fun a b j => C a b j y)
    (fun j => partialDeriv d (C i k j) y) d a i k

private theorem contractLowered {ι : Type*} [Fintype ι] [DecidableEq ι]
    (B G F : ι → ι → ℝ)
    (hB : ∀ i j, ∑ a, B i a * G j a = if i = j then 1 else 0) :
    (∑ i, ∑ a, B i a * ∑ j, G j a * F i j) = ∑ i, F i i := by
  refine Finset.sum_congr rfl fun i _ => ?_
  calc
    (∑ a, B i a * ∑ j, G j a * F i j) =
      ∑ a, ∑ j, (B i a * G j a) * F i j := by simp only [Finset.mul_sum, mul_assoc]
    _ = ∑ j, (∑ a, B i a * G j a) * F i j := by rw [Finset.sum_comm]; simp [Finset.sum_mul]
    _ = F i i := by simp [hB]

omit [I.Boundaryless] [BoundarylessManifold I M] in
private theorem koszulTraceNabla_inBasis (g : SmoothRiemannianMetric I M)
    (K : Tensor0SField (I := I) (M := M) ∞ 2) {x : M}
    {ι : Type*} [Fintype ι] [DecidableEq ι]
    (b : Module.Basis ι ℝ (TangentSpace I x)) (a : ι → ι → ℝ)
    (ha : MetricInverseInBasis g x b a) (v w : TangentSpace I x) :
    metricNabla0S g (bourKoszulTraceForm g K) x (vec2 v w) =
      ∑ i, ∑ j, a i j * metricNabla0S g (bourKoszulFlux g K) x
        (Fin.cons v (Fin.cons (b i) (vec2 w (b j)))) := by
  let e : Equiv.Perm (Fin 3) := Equiv.swap 1 2
  let A := bourKoszulFlux g K
  let tail : Fin 1 → TangentSpace I x := fun _ => w
  have hv : vec2 v w = Fin.cons v tail := by
    funext r
    fin_cases r <;> rfl
  rw [hv, bourKoszulTraceForm, metricNabla0S_apply]
  rw [nabla_metricTraceFirstTwo0S (metricCov g) g
    (leviCivitaConnectionOfMetric_isMetricCompatible (I := I) g)
    (Tensor0SField.domDomCongr ∞ e A) b a ha]
  refine Finset.sum_congr rfl fun i _ => Finset.sum_congr rfl fun j _ => ?_
  congr 1
  rw [totalNabla0SFun_domDomCongr (metricCov g) e A,
    Tensor0SSpace.domDomCongr_apply, metricNabla0S_apply]
  congr 1
  have htail :
      (metricTraceInput (I := I) (b i) (b j) tail : Fin 3 → TangentSpace I x) ∘ e =
        Fin.cons (b i) (vec2 w (b j)) := by
    funext r
    fin_cases r <;> rfl
  funext r
  rw [cons_apply_frontExtendEquiv, htail]

/-- Physical Ricci variation on the fixed chart in terms of the divergence
of the lowered Koszul flux and the covariant derivative of its trace. The
second derivative is in the second Ricci slot in this curvature convention. -/
theorem bourMetricRicciAt_chartKoszul_hasDerivAt (g : ℝ → SmoothRiemannianMetric I M)
    {D : RealTimeInterval} (hG : MetricFamilySmoothOn (I := I) D g)
    {t : ℝ} (ht : t ∈ D.regular) (x₀ : M) {x : M}
    (hx : x ∈ (extChartAt I x₀).source) (i k : Fin (Module.finrank ℝ E)) :
    let b := fun j => chartBasisVecFiber (I := I) x₀ j x
    let K := bourMetricVelocity g hG ht
    HasDerivAt (fun s => metricRicciAt (g s) x (vec2 (b i) (b k)))
      (covDiv0SField (g t) (bourKoszulFlux (g t) K) x (vec2 (b i) (b k)) -
        metricNabla0S (g t) (bourKoszulTraceForm (g t) K) x (vec2 (b k) (b i))) t := by
  classical
  dsimp only
  let y := extChartAt I x₀ x
  let K := bourMetricVelocity g hG ht
  let A := bourKoszulFlux (g t) K
  let b := fun j => chartBasisVecFiber (I := I) x₀ j x
  let G := fun j a => chartGramOnE (g t) x₀ j a y
  let C := fun a b c z => deriv (fun s => chartChristoffel (g s) x₀ a b c z) t
  let DC := fun d i k j => bourChartRaisedCovDeriv (g t) x₀ C d i k j y
  have hxgood := (mem_chartLeviCivitaGoodSet_iff_mem_extChartAt_source (I := I) x₀ x).2 hx
  let basis := chartBasisFamily (I := I) x₀ (chartLeviCivitaGoodSet_mem_baseSet hxgood)
  have hb (j) : basis j = b j := chartBasisFamily_apply _ _ _
  let B := basisInvMetric (g t) x basis
  have hB := basisInvMetric_isInverse (g t) x basis
  have hGij (j a) : G j a = (g t).inner x (basis a) (basis j) := by
    dsimp only [G, y]
    rw [chartGramOnE_def, (extChartAt I x₀).left_inv hx,
      chartGramMatrix_apply, hb, hb, (g t).symm x (b j) (b a)]
  have hBG (d j) : ∑ a, B d a * G j a = if d = j then 1 else 0 := by
    simp only [hGij]
    exact (hB d j).1
  have hL (d a i' k') :
      metricNabla0S (g t) A x (Fin.cons (b d) (Fin.cons (b a) (vec2 (b i') (b k')))) =
        ∑ j, G j a * DC d i' k' j :=
    bourNablaKoszulFlux_chart_eq_gram_mul g hG ht x₀ hx d a i' k'
  have hDiv :
      covDiv0SField (g t) A x (vec2 (b i) (b k)) = ∑ d, DC d i k d := by
    rw [covDiv0SField, metricTraceFirstTwoField_apply, metricTraceFirstTwo0STensor_apply,
      metricTraceFirstTwo0SAt_eq_sum_basis (g t) basis B hB]
    unfold metricTrace0S2InBasis
    simp only [hb]
    have hinput (d a) : metricTraceInput (I := I) (b d) (b a) (vec2 (b i) (b k)) =
        Fin.cons (b d) (Fin.cons (b a) (vec2 (b i) (b k))) := by
      funext r
      fin_cases r <;> rfl
    simp only [hinput, hL]
    exact contractLowered B G (fun d j => DC d i k j) hBG
  have hTrace :
      metricNabla0S (g t) (bourKoszulTraceForm (g t) K) x (vec2 (b k) (b i)) =
        ∑ j, DC k i j j := by
    rw [koszulTraceNabla_inBasis (g t) K basis B hB]
    simp only [hb]
    change (∑ a, ∑ d, B a d * metricNabla0S (g t) A x
      (Fin.cons (b k) (Fin.cons (b a) (vec2 (b i) (b d))))) = _
    simp only [hL]
    rw [Finset.sum_comm]
    calc
      _ = ∑ d, ∑ a, B d a * ∑ j, G j a * DC k i d j := by
        exact Finset.sum_congr rfl fun d _ => Finset.sum_congr rfl fun a _ => by
          have hsymm : B a d = B d a := basisInvMetric_symm (g t) x basis a d
          rw [hsymm]
      _ = _ := contractLowered B G (fun d j => DC k i d j) hBG
  change HasDerivAt (fun s => metricRicciAt (g s) x (vec2 (b i) (b k)))
    (covDiv0SField (g t) A x (vec2 (b i) (b k)) -
      metricNabla0S (g t) (bourKoszulTraceForm (g t) K) x (vec2 (b k) (b i))) t
  rw [hDiv, hTrace]
  exact bourMetricRicciAt_chartPalatini_hasDerivAt g hG ht x₀ hx i k

/-- Palatini variation as a smooth covariant two-tensor on a metric slice.
The slot swap aligns the traced flux derivative with the Ricci convention. -/
def bourRicciVelocity (g : SmoothRiemannianMetric I M)
    (K : Tensor0SField (I := I) (M := M) ∞ 2) : Tensor0SField (I := I) (M := M) ∞ 2 :=
  covDiv0SField g (bourKoszulFlux g K) -
    Tensor0SField.domDomCongr ∞ (Equiv.swap (0 : Fin 2) 1)
      (metricNabla0S g (bourKoszulTraceForm g K))

/-- The physical Ricci tensor at any point has the Palatini variation
for the actual velocity of the original smooth metric family. -/
theorem bourMetricRicciAt_hasDerivAt (g : ℝ → SmoothRiemannianMetric I M)
    {D : RealTimeInterval} (hG : MetricFamilySmoothOn (I := I) D g)
    {t : ℝ} (ht : t ∈ D.regular) (x : M) :
    HasDerivAt (fun s => metricRicciAt (g s) x)
      (bourRicciVelocity (g t) (bourMetricVelocity g hG ht) x) t := by
  classical
  have hx := mem_extChartAt_source (I := I) x
  have hxgood := (mem_chartLeviCivitaGoodSet_iff_mem_extChartAt_source (I := I) x x).2 hx
  let basis := chartBasisFamily (I := I) x (chartLeviCivitaGoodSet_mem_baseSet hxgood)
  let e := (coordEquiv0S (I := I) basis 2).toContinuousLinearEquiv
  have he (A : Tensor0SSpace 2 I x) (v : Fin 2 → Fin (Module.finrank ℝ E)) :
      e A v = A (vec2 (chartBasisVecFiber x (v 0) x) (chartBasisVecFiber x (v 1) x)) := by
    change coordEquiv0S (I := I) basis 2 A v = _
    rw [coordEquiv0S_apply, component0S_apply]
    congr 1
    funext k
    fin_cases k <;> exact chartBasisFamily_apply _ _ _
  have hd : HasDerivAt (fun s => e (metricRicciAt (g s) x))
      (e (bourRicciVelocity (g t) (bourMetricVelocity g hG ht) x)) t := by
    refine hasDerivAt_pi.mpr fun v => ?_
    simp only [he, bourRicciVelocity, ContMDiffSection.coe_sub, Pi.sub_apply,
      Tensor0SSpace.sub_apply, Tensor0SField.domDomCongr_apply,
      Tensor0SSpace.domDomCongr_apply]
    have hswap :
        (fun i => vec2 (chartBasisVecFiber (I := I) x (v 0) x) (chartBasisVecFiber x (v 1) x)
          ((Equiv.swap (0 : Fin 2) 1) i)) =
          vec2 (chartBasisVecFiber x (v 1) x) (chartBasisVecFiber x (v 0) x) := by
      funext k
      fin_cases k <;> rfl
    rw [hswap]
    exact bourMetricRicciAt_chartKoszul_hasDerivAt g hG ht x hx (v 0) (v 1)
  have h := e.symm.toContinuousLinearMap.hasFDerivAt.comp_hasDerivAt t hd
  change HasDerivAt (fun s => e.symm (e (metricRicciAt (g s) x)))
    (e.symm (e (bourRicciVelocity (g t) (bourMetricVelocity g hG ht) x))) t at h
  simpa only [ContinuousLinearEquiv.symm_apply_apply] using h

end
end SmoothPoincare.Bour
