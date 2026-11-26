import SmoothPoincare.Variational.BourChristoffelTime
import SmoothPoincare.Variational.BourTensorFirstVariation
import DifferentialGeometry.Geometry.Operator.Laplacian.TensorInner
import DifferentialGeometry.Geometry.Flow.RicciFlow.HamiltonHarnack.MIdentities

/-! # Moving contractions for Bour's physical bulk energy

E50, 26 November 2026. Prepared for Edward B. Baker III with OpenAI Codex
assistance. Actual serving model and reasoning effort were unavailable.
-/

open Bundle DifferentialGeometry DifferentialGeometry.Geometry.Connection
  DifferentialGeometry.Geometry.Curvature DifferentialGeometry.Geometry.Operator
  DifferentialGeometry.Integral.Measure DifferentialGeometry.PDE.RicciFlow
  DifferentialGeometry.Tensor.Coordinates DifferentialGeometry.Tensor0SBundle
  Filter FirstOrderTwistor MeasureTheory Set
open scoped ContDiff Manifold

namespace SmoothPoincare.Bour

noncomputable section

variable {E H M : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
  [FiniteDimensional ℝ E] [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]

private local instance : IsManifold I 1 M := IsManifold.of_le (by decide : (1 : WithTop ℕ∞) ≤ ∞)

omit [FiniteDimensional ℝ E] [IsManifold I ∞ M] in
private theorem vec2_eq_ite {x : M} (X Y : TangentSpace I x) :
    vec2 X Y = fun j => if j = (0 : Fin 2) then X else Y := by
  funext j
  fin_cases j <;> simp [vec2]

/-- Variation of the actual inverse metric in any basis held fixed in time. -/
theorem bourInverseMetric_hasDerivAt (g : ℝ → SmoothRiemannianMetric I M)
    {D : RealTimeInterval} (hG : MetricFamilySmoothOn (I := I) D g)
    {t : ℝ} (ht : t ∈ D.regular) (x : M) {J : Type*} [Fintype J]
    (b : Module.Basis J ℝ (TangentSpace I x)) (i j : J) :
    HasDerivAt (fun s => basisInvMetric (g s) x b i j)
      (-(∑ a, ∑ c, basisInvMetric (g t) x b i a *
        bourMetricVelocity g hG ht x (vec2 (b a) (b c)) *
        basisInvMetric (g t) x b c j)) t := by
  refine hasDerivAt_basisInvMetric g _ b (fun a c => ?_) i j
  exact (tensor0SEvalCLM (vec2 (b a) (b c))).hasFDerivAt.comp_hasDerivAt t
    ((bourMetricVelocity_eq_deriv g hG ht x).symm ▸ bourMetric_hasDerivAt_regular g hG ht x)

variable [I.Boundaryless] [T2Space M]

/-- The E49 chart derivative supplies the derivative on every fixed pair of
tangent vectors, with coefficient the actual Ricci derivative in its fiber. -/
theorem bourMetricRicci_hasDerivAt_apply (g : ℝ → SmoothRiemannianMetric I M)
    {D : RealTimeInterval} (hG : MetricFamilySmoothOn (I := I) D g)
    {t : ℝ} (ht : t ∈ D.regular) (x : M) (v : Fin 2 → TangentSpace I x) :
    HasDerivAt (fun s => metricRicciAt (g s) x v)
      (deriv (fun s => metricRicciAt (g s) x) t v) t := by
  let b := chartBasisFamily (I := I) x (FiberBundle.mem_baseSet_trivializationAt' x)
  let U (s : ℝ) := (coordEquiv0S (I := I) b 2) (metricRicciAt (g s) x)
  have hU : DifferentiableAt ℝ U t := by
    apply differentiableAt_pi.mpr
    intro k
    have hB : (fun i : Fin 2 => b (k i)) =
        vec2 (chartBasisVecFiber (I := I) x (k 0) x)
          (chartBasisVecFiber (I := I) x (k 1) x) := by
      rw [vec2_eq_ite]
      funext i
      fin_cases i <;> simp [b, chartBasisFamily_apply]
    simpa only [U, coordEquiv0S_apply, component0S_apply, hB] using
      (bourMetricRicciAt_chartBasis_hasDerivAt g hG ht x
        (by rw [extChartAt_source]; exact mem_chart_source H x) (k 0) (k 1)).differentiableAt
  have hd : DifferentiableAt ℝ (fun s => metricRicciAt (g s) x) t := by
    let L := (coordEquiv0S (I := I) b 2).symm.toLinearMap.toContinuousLinearMap
    have hL : (fun s => L (U s)) = fun s => metricRicciAt (g s) x := by
      funext s
      exact (coordEquiv0S (I := I) b 2).symm_apply_apply _
    rw [← hL]
    exact L.differentiableAt.comp t hU
  exact (tensor0SEvalCLM v).hasFDerivAt.comp_hasDerivAt t hd.hasDerivAt

private theorem basisInvMetric_eq_identity {x : M} {J : Type*} [Fintype J] [DecidableEq J]
    (g : SmoothRiemannianMetric I M) (b : Module.Basis J ℝ (TangentSpace I x))
    (hb : ∀ i j, g.inner x (b i) (b j) = if i = j then 1 else 0) :
    basisInvMetric g x b = identityInvMetric :=
  MetricInverseInBasis.unique g x b _ _ (basisInvMetric_isInverse g x b)
    (metricInverseInBasis_identity_of_orthonormal g b hb)

private theorem inner0S_two_in_orthonormal_basis {x : M} {J : Type*} [Fintype J]
    [DecidableEq J] (g : SmoothRiemannianMetric I M)
    (b : Module.Basis J ℝ (TangentSpace I x))
    (hb : ∀ i j, g.inner x (b i) (b j) = if i = j then 1 else 0)
    (A B : Tensor0SSpace 2 I x) :
    inner0S g x 2 A B = ∑ i, ∑ j, A (vec2 (b i) (b j)) * B (vec2 (b i) (b j)) := by
  rw [inner0S_two_eq_coord g x b identityInvMetric
    (metricInverseInBasis_identity_of_orthonormal g b hb)]
  simp [identityInvMetric, diagonalInvMetric, vec2_eq_ite]

/-- Variation of the scalar curvature, including its moving inverse trace. -/
theorem bourScalar_hasDerivAt_contractions (g : ℝ → SmoothRiemannianMetric I M)
    {D : RealTimeInterval} (hG : MetricFamilySmoothOn (I := I) D g)
    {t : ℝ} (ht : t ∈ D.regular) (x : M) :
    let K := bourMetricVelocity g hG ht x
    let P := deriv (fun s => metricRicciAt (g s) x) t
    HasDerivAt (fun s => metricScalarAt (g s) x)
      (metricTracePair0SAt (g t) P - inner0S (g t) x 2 K (metricRicciAt (g t) x)) t := by
  classical
  dsimp only
  obtain ⟨n, e, b, -, heb, he, -⟩ := TensorMetric.exists_tangent_orthonormalBasis_with_norm_sum (g t) x
  have hb (i j : Fin n) : (g t).inner x (b i) (b j) = if i = j then 1 else 0 := by
    rw [heb i, heb j, he]
  let K := bourMetricVelocity g hG ht x
  let P := deriv (fun s => metricRicciAt (g s) x) t
  let V (s : ℝ) := basisInvMetric (g s) x b
  let r (s : ℝ) (i j : Fin n) := metricRicciAt (g s) x (vec2 (b i) (b j))
  have hV : V t = identityInvMetric := basisInvMetric_eq_identity (g t) b hb
  have hInv (i j : Fin n) : HasDerivAt (fun s => V s i j) (-K (vec2 (b i) (b j))) t := by
    have hd := bourInverseMetric_hasDerivAt g hG ht x b i j
    change HasDerivAt (fun s => V s i j)
      (-(∑ a, ∑ c, V t i a * K (vec2 (b a) (b c)) * V t c j)) t at hd
    rw [hV] at hd
    simpa [identityInvMetric, diagonalInvMetric] using hd
  have hd := HasDerivAt.fun_sum (u := Finset.univ) fun i _ =>
    HasDerivAt.fun_sum (u := Finset.univ) fun j _ =>
      (hInv i j).mul (bourMetricRicci_hasDerivAt_apply g hG ht x (vec2 (b i) (b j)))
  change HasDerivAt (fun s => ∑ i, ∑ j, V s i j * r s i j)
    (∑ i, ∑ j, ((-K (vec2 (b i) (b j))) * r t i j + V t i j * P (vec2 (b i) (b j)))) t at hd
  have hSc (s : ℝ) : metricScalarAt (g s) x = ∑ i, ∑ j, V s i j * r s i j := by
    rw [metricScalarAt_def, metricTracePair0SAt_eq_sum_basis (g s) b (V s)
      (basisInvMetric_isInverse (g s) x b)]
  simp_rw [hSc]
  refine hd.congr_deriv ?_
  rw [metricTracePair0SAt_eq_sum_basis (g t) b (V t) (basisInvMetric_isInverse (g t) x b),
    inner0S_two_in_orthonormal_basis (g t) b hb]
  simp only [neg_mul, Finset.sum_add_distrib, Finset.sum_neg_distrib, r]
  ring

/-- Both moving inverse contractions of the ordinary Ricci square. The
reaction pairs the actual velocity, scaled by minus one half, with both
Ricci slots in the intrinsic metric variation operator. -/
theorem bourRicciNormSq_hasDerivAt_slots (g : ℝ → SmoothRiemannianMetric I M)
    {D : RealTimeInterval} (hG : MetricFamilySmoothOn (I := I) D g)
    {t : ℝ} (ht : t ∈ D.regular) (x : M) :
    let K := bourMetricVelocity g hG ht x
    let P := deriv (fun s => metricRicciAt (g s) x) t
    let R := metricRicciAt (g t) x
    HasDerivAt (fun s => normSq0S (g s) x 2 (metricRicciAt (g s) x))
      (metricVariationPairing0S (g t) x 2 ((-1 / 2 : ℝ) • K) R R +
        2 * inner0S (g t) x 2 P R) t := by
  dsimp only
  let K := bourMetricVelocity g hG ht x
  let P := deriv (fun s => metricRicciAt (g s) x) t
  have hg (X Y : TangentSpace I x) :
      HasDerivAt (fun s => (g s).inner x X Y)
        ((-2 : ℝ) * ((-1 / 2 : ℝ) • K) (fun j => if j = (0 : Fin 2) then X else Y)) t := by
    have h := (tensor0SEvalCLM (vec2 X Y)).hasFDerivAt.comp_hasDerivAt t
      ((bourMetricVelocity_eq_deriv g hG ht x).symm ▸ bourMetric_hasDerivAt_regular g hG ht x)
    change HasDerivAt (fun s => metricTensorField (g s) x (vec2 X Y))
      (K (vec2 X Y)) t at h
    rw [← vec2_eq_ite, Tensor0SSpace.smul_apply, smul_eq_mul]
    convert h using 1
    · funext s
      simp [metricTensorField_apply, vec2]
    · ring
  simp_rw [normSq0S_eq_inner]
  refine (hasDerivAt_inner0S_of_metric_variation g ((-1 / 2 : ℝ) • K)
    (fun s => metricRicciAt (g s) x) (fun s => metricRicciAt (g s) x) P P hg
    (bourMetricRicci_hasDerivAt_apply g hG ht x)
    (bourMetricRicci_hasDerivAt_apply g hG ht x)).congr_deriv ?_
  rw [inner0S_comm (g t) x 2 (metricRicciAt (g t) x) P]
  ring

end
end SmoothPoincare.Bour
