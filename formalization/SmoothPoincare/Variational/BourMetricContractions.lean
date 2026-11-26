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
  DifferentialGeometry.Tensor.Coordinates DifferentialGeometry.Tensor.RSTensor
  DifferentialGeometry.Tensor0SBundle
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

omit [I.Boundaryless] [T2Space M] in
private theorem basisInvMetric_eq_identity {x : M} {J : Type*} [Fintype J] [DecidableEq J]
    (g : SmoothRiemannianMetric I M) (b : Module.Basis J ℝ (TangentSpace I x))
    (hb : ∀ i j, g.inner x (b i) (b j) = if i = j then 1 else 0) :
    basisInvMetric g x b = identityInvMetric :=
  MetricInverseInBasis.unique g x b _ _ (basisInvMetric_isInverse g x b)
    (metricInverseInBasis_identity_of_orthonormal g b hb)

omit [I.Boundaryless] [T2Space M] in
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

omit [I.Boundaryless] in
private theorem ricciMovingPair_eq_square (g : SmoothRiemannianMetric I M) (x : M)
    (Q : Tensor0SSpace 2 I x)
    (hQ : ∀ X Y : TangentSpace I x, Q (vec2 X Y) = Q (vec2 Y X)) :
    metricVariationPairing0S g x 2 Q (metricRicciAt g x) (metricRicciAt g x) =
      4 * inner0S g x 2 Q (hamiltonRicciSquareAt g x) := by
  classical
  let Ric := metricRicciAt g x
  let L := (ricciEndAt g Q).toContinuousLinearMap
  let B := covariantEndomorphismAction0S Ric L
  have hReaction : metricVariationPairing0S g x 2 Q Ric Ric =
      inner0S g x 2 B Ric + inner0S g x 2 Ric B := by
    apply ricciReaction0S_eq_inner_covariantEndomorphismAction0S_add_of_symmetric g Q Ric Ric L
    · simpa only [vec2_eq_ite] using hQ
    · intro X Y
      rw [← vec2_eq_ite]
      exact ricciEnd_inner g Q X Y
  obtain ⟨n, e, b, -, heb, he, -⟩ := TensorMetric.exists_tangent_orthonormalBasis_with_norm_sum g x
  have hb (i j : Fin n) : g.inner x (b i) (b j) = if i = j then 1 else 0 := by
    rw [heb i, heb j, he]
  have hinv := metricInverseInBasis_identity_of_orthonormal g b hb
  let r (i j : Fin n) := Ric (vec2 (b i) (b j))
  let q (i j : Fin n) := Q (vec2 (b i) (b j))
  have hSymm (i j : Fin n) : r i j = r j i := metricRicciAt_symm g x (b i) (b j)
  have hL (i k : Fin n) : b.repr (L (b i)) k = q i k := by
    rw [basis_repr_eq_sum_inv_inner g x b identityInvMetric hinv]
    simp [L, q, ricciEnd_inner, identityInvMetric, diagonalInvMetric]
  have hB (i j : Fin n) :
      B (vec2 (b i) (b j)) = (∑ k, q i k * r k j) + (∑ k, q j k * r i k) := by
    let v : Fin 2 → Fin n := ![i, j]
    have hv : (fun a => b (v a)) = vec2 (b i) (b j) := by
      rw [vec2_eq_ite]
      funext a
      fin_cases a <;> simp [v]
    rw [← hv]
    change tensor0SComponent B b v = _
    rw [tensor0SComponent_covariantEndomorphismAction0S]
    simp only [covariantEndomorphismActionArray, Fin.sum_univ_two, hL]
    congr 1 <;> apply Finset.sum_congr rfl <;> intro k _
    · change q (v 0) k * Ric (fun a => b (Function.update v 0 k a)) =
        q i k * Ric (vec2 (b k) (b j))
      simp only [v, Matrix.cons_val_zero]
      congr 2
      rw [vec2_eq_ite]
      funext a
      fin_cases a <;> simp [Function.update]
    · change q (v 1) k * Ric (fun a => b (Function.update v 1 k a)) =
        q j k * Ric (vec2 (b i) (b k))
      simp only [v, Matrix.cons_val_one, Matrix.cons_val_zero]
      congr 2
      rw [vec2_eq_ite]
      funext a
      fin_cases a <;> simp [Function.update]
  have hSq (i j : Fin n) : hamiltonRicciSquareAt g x (vec2 (b i) (b j)) =
      ∑ k, r i k * r k j := by
    rw [hamiltonRicciSquareAt_apply g b identityInvMetric hinv]
    simp [identityInvMetric, diagonalInvMetric, metricRicci_apply, r, Ric]
  let J : ℝ := ∑ i, ∑ j, q i j * (∑ k, r i k * r k j)
  have hS1 : (∑ i, ∑ j, (∑ k, q i k * r k j) * r i j) = J := by
    unfold J
    simp only [Finset.sum_mul, Finset.mul_sum]
    apply Finset.sum_congr rfl
    intro i _
    rw [Finset.sum_comm]
    apply Finset.sum_congr rfl
    intro j _
    apply Finset.sum_congr rfl
    intro k _
    rw [hSymm j k]
    ring
  have hS2 : (∑ i, ∑ j, (∑ k, q j k * r i k) * r i j) = J := by
    rw [← hS1, Finset.sum_comm]
    apply Finset.sum_congr rfl
    intro i _
    apply Finset.sum_congr rfl
    intro j _
    rw [hSymm j i]
    congr 1
    exact Finset.sum_congr rfl fun k _ => by rw [hSymm j k]
  rw [hReaction, inner0S_comm g x 2 Ric B, inner0S_two_in_orthonormal_basis g b hb B Ric,
    inner0S_two_in_orthonormal_basis g b hb Q (hamiltonRicciSquareAt g x)]
  simp only [hB, hSq]
  change (∑ i, ∑ j, (((∑ k, q i k * r k j) + (∑ k, q j k * r i k)) * r i j)) +
    (∑ i, ∑ j, (((∑ k, q i k * r k j) + (∑ k, q j k * r i k)) * r i j)) = 4 * J
  simp only [add_mul, Finset.sum_add_distrib, hS1, hS2]
  ring

omit [I.Boundaryless] [T2Space M] in
/-- The actual time derivative of a Riemannian metric is symmetric. -/
theorem bourMetricVelocity_symm (g : ℝ → SmoothRiemannianMetric I M)
    {D : RealTimeInterval} (hG : MetricFamilySmoothOn (I := I) D g)
    {t : ℝ} (ht : t ∈ D.regular) (x : M) (X Y : TangentSpace I x) :
    bourMetricVelocity g hG ht x (vec2 X Y) = bourMetricVelocity g hG ht x (vec2 Y X) := by
  rw [bourMetricVelocity_eq_deriv]
  have h (U V : TangentSpace I x) : HasDerivAt (fun s => (g s).inner x U V)
      (deriv (fun s => metricTensorField (g s) x) t (vec2 U V)) t := by
    have hd := (tensor0SEvalCLM (vec2 U V)).hasFDerivAt.comp_hasDerivAt t
      (bourMetric_hasDerivAt_regular g hG ht x)
    change HasDerivAt (fun s => metricTensorField (g s) x (vec2 U V))
      (deriv (fun s => metricTensorField (g s) x) t (vec2 U V)) t at hd
    simpa [metricTensorField_apply, vec2] using hd
  exact (h X Y).unique ((h Y X).congr_of_eventuallyEq
    (Filter.Eventually.of_forall fun s => (g s).toRiemannianMetric.symm x X Y))

/-- The full Ricci norm derivative, with the two equal inverse-slot terms
combined into the covariant Ricci square. -/
theorem bourRicciNormSq_hasDerivAt_contractions (g : ℝ → SmoothRiemannianMetric I M)
    {D : RealTimeInterval} (hG : MetricFamilySmoothOn (I := I) D g)
    {t : ℝ} (ht : t ∈ D.regular) (x : M) :
    let K := bourMetricVelocity g hG ht x
    let P := deriv (fun s => metricRicciAt (g s) x) t
    HasDerivAt (fun s => normSq0S (g s) x 2 (metricRicciAt (g s) x))
      (2 * inner0S (g t) x 2 P (metricRicciAt (g t) x) -
        2 * inner0S (g t) x 2 K (hamiltonRicciSquareAt (g t) x)) t := by
  dsimp only
  refine (bourRicciNormSq_hasDerivAt_slots g hG ht x).congr_deriv ?_
  rw [ricciMovingPair_eq_square, inner0S_smul_left]
  · ring
  · intro X Y
    simp only [Tensor0SSpace.smul_apply]
    rw [bourMetricVelocity_symm g hG ht x X Y]

omit [I.Boundaryless] in
private theorem bourRicciWeight_pair (α : ℝ) (g : SmoothRiemannianMetric I M)
    (x : M) (P : Tensor0SSpace 2 I x) :
    inner0S g x 2 (bourRicciWeight α g x) P =
      inner0S g x 2 P (metricRicciAt g x) +
        (α - 4) / 12 * metricScalarAt g x * metricTracePair0SAt g P := by
  have hm : metricTensor0S g x = metricTensorField g x := by
    ext v
    simp only [metricTensor0S_apply, metricTensorField_apply]
  change inner0S g x 2
      (metricRicci g x + ((α - 4) / 12) • (metricScalarAt g x • metricTensorField g x)) P = _
  rw [inner0S_add_left, inner0S_smul_left, inner0S_smul_left, metricRicci_apply,
    inner0S_comm g x 2 (metricRicciAt g x) P]
  rw [metricTracePair0SAt, hm, mul_assoc]

private def bourRicciSquareSlots : Equiv.Perm (Fin 4) where
  toFun j := if j = 0 then 2 else if j = 1 then 0 else if j = 2 then 1 else 3
  invFun j := if j = 0 then 1 else if j = 1 then 2 else if j = 2 then 0 else 3
  left_inv j := by fin_cases j <;> simp
  right_inv j := by fin_cases j <;> simp

/-- The smooth covariant square of Ricci, with one index raised in the
product. -/
def bourRicciSquare (g : SmoothRiemannianMetric I M) : Tensor0SField (I := I) (M := M) ∞ 2 :=
  metricTraceFirstTwoField g (Tensor0SField.domDomCongr ∞ bourRicciSquareSlots
    (tensor0SFieldProduct ∞ (metricRicci g) (metricRicci g)))

omit [I.Boundaryless] in
theorem bourRicciSquare_apply (g : SmoothRiemannianMetric I M) (x : M) :
    bourRicciSquare g x = hamiltonRicciSquareAt g x := by
  have hProduct : tensor0SFieldProduct ∞ (metricRicci g) (metricRicci g) x =
      (metricRicci g x).product (metricRicci g x) := by
    ext v
    rw [tensor0SField_product_apply, Tensor0SSpace.product_apply]
  rw [bourRicciSquare, metricTraceFirstTwoField_apply, Tensor0SField.domDomCongr_apply, hProduct]
  rfl

omit [I.Boundaryless] in
private theorem bourBulkDensity_smooth (α : ℝ) (g : SmoothRiemannianMetric I M) :
    ContMDiff I 𝓘(ℝ, ℝ) ∞ (bourBulkDensity α g) := by
  have hR : ContMDiff I 𝓘(ℝ, ℝ) ∞
      (fun x => normSq0S g x 2 (metricRicciAt g x)) := by
    simpa only [metricRicci_apply] using normSq0S_smooth g (metricRicci g)
  exact (hR.div_const 2).add ((contMDiff_const.mul ((metricScalar_smooth g).pow 2)).div_const 24)

/-- The smooth zeroth-order part of the bulk gradient, including the
variation of the Riemannian volume. -/
def bourBulkMetricCorrection (α : ℝ) (g : SmoothRiemannianMetric I M) :
    Tensor0SField (I := I) (M := M) ∞ 2 :=
  -bourRicciSquare g -
      ((α - 4) / 12) • tensor0SFieldSmulByFun ∞ (metricScalarAt g) (metricScalar_smooth g) (metricRicci g) +
    (1 / 2 : ℝ) • tensor0SFieldSmulByFun ∞ (bourBulkDensity α g)
      (bourBulkDensity_smooth α g) (metricTensorField g)

/-- Derivative of Bour's intrinsic density along a regular physical path. -/
theorem bourBulkDensity_hasDerivAt_contractions (α : ℝ) (g : ℝ → SmoothRiemannianMetric I M)
    {D : RealTimeInterval} (hG : MetricFamilySmoothOn (I := I) D g)
    {t : ℝ} (ht : t ∈ D.regular) (x : M) :
    let K := bourMetricVelocity g hG ht x
    let P := deriv (fun s => metricRicciAt (g s) x) t
    let Ric := metricRicciAt (g t) x
    HasDerivAt (fun s => bourBulkDensity α (g s) x)
      (inner0S (g t) x 2 (bourRicciWeight α (g t) x) P -
        inner0S (g t) x 2 K (hamiltonRicciSquareAt (g t) x) -
        (α - 4) / 12 * metricScalarAt (g t) x * inner0S (g t) x 2 K Ric) t := by
  dsimp only
  have hr := (bourRicciNormSq_hasDerivAt_contractions g hG ht x).div_const 2
  have hs := (((bourScalar_hasDerivAt_contractions g hG ht x).pow 2).const_mul
    (α - 4)).div_const 24
  refine (hr.add hs).congr_deriv ?_
  rw [bourRicciWeight_pair]
  ring

omit [I.Boundaryless] in
private theorem bourBulkMetricCorrection_pair (α : ℝ) (g : SmoothRiemannianMetric I M)
    (x : M) (K : Tensor0SSpace 2 I x) :
    inner0S g x 2 (bourBulkMetricCorrection α g x) K =
      -inner0S g x 2 K (hamiltonRicciSquareAt g x) -
        (α - 4) / 12 * metricScalarAt g x * inner0S g x 2 K (metricRicciAt g x) +
        (1 / 2) * inner0S g x 2 K (metricTensorField g x) * bourBulkDensity α g x := by
  change inner0S g x 2 (-bourRicciSquare g x -
    ((α - 4) / 12) • (metricScalarAt g x • metricRicci g x) +
    (1 / 2 : ℝ) • (bourBulkDensity α g x • metricTensorField g x)) K = _
  rw [inner0S_add_left, inner0S_sub_left,
    show -bourRicciSquare g x = (-1 : ℝ) • bourRicciSquare g x by simp]
  simp only [inner0S_smul_left, bourRicciSquare_apply, metricRicci_apply]
  rw [inner0S_comm g x 2 (hamiltonRicciSquareAt g x) K,
    inner0S_comm g x 2 (metricRicciAt g x) K,
    inner0S_comm g x 2 (metricTensorField g x) K]
  ring

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

variable [CompactSpace M] [BoundarylessManifold I M] {o : ManifoldOrientation I M 4}

/-- The closed energy derivative with both inverse contractions and the
volume correction, on the original family and against its own volume. -/
theorem bourEnergy_hasDerivAt_contractions (q : ℝ → SignedCollarMetric o) (α C : ℝ)
    {D : RealTimeInterval} (hG : MetricFamilySmoothOn (I := I) D (fun s => (q s).metric))
    {t : ℝ} (ht : t ∈ D.regular) (hEuler : ∀ s ∈ D.regular, bourEuler (q s) = C) :
    let g := fun s => (q s).metric
    let K := bourMetricVelocity g hG ht
    HasDerivAt (fun s => bourEnergy α (q s))
      (∫ x,
        inner0S (g t) x 2 (bourRicciWeight α (g t) x)
          (deriv (fun s => metricRicciAt (g s) x) t) +
        inner0S (g t) x 2 (bourBulkMetricCorrection α (g t) x) (K x)
        ∂riemannianVolumeMeasure I M (g t)) t := by
  dsimp only
  let g := fun s => (q s).metric
  let K := bourMetricVelocity g hG ht
  have hK (x : M) : HasDerivAt (fun s => metricTensorField (g s) x) (K x) t :=
    (bourMetricVelocity_eq_deriv g hG ht x).symm ▸ bourMetric_hasDerivAt_regular g hG ht x
  refine (bourEnergy_hasDerivAt_intrinsic q α C hG ht hEuler K hK).congr_deriv ?_
  apply integral_congr_ae
  exact ae_of_all _ fun x => by
    dsimp only
    rw [(bourBulkDensity_hasDerivAt_contractions α (fun s => (q s).metric) hG ht x).deriv,
      bourBulkMetricCorrection_pair]
    ring

/-- A smooth realization of the actual Ricci derivative allows the full
first variation to be split into two integrable physical pairings. -/
theorem bourEnergy_hasDerivAt_contractions_of_ricciVelocity
    (q : ℝ → SignedCollarMetric o) (α C : ℝ)
    {D : RealTimeInterval} (hG : MetricFamilySmoothOn (I := I) D (fun s => (q s).metric))
    {t : ℝ} (ht : t ∈ D.regular) (hEuler : ∀ s ∈ D.regular, bourEuler (q s) = C)
    (P : Tensor0SField (I := I) (M := M) ∞ 2)
    (hP : ∀ x, deriv (fun s => metricRicciAt (q s).metric x) t = P x) :
    let g := fun s => (q s).metric
    let K := bourMetricVelocity g hG ht
    HasDerivAt (fun s => bourEnergy α (q s))
      (bourClosedTensorPairing (g t) (bourRicciWeight α (g t)) P +
        bourClosedTensorPairing (g t) (bourBulkMetricCorrection α (g t)) K) t := by
  dsimp only
  have h := bourEnergy_hasDerivAt_contractions q α C hG ht hEuler
  dsimp only at h
  simp_rw [hP] at h
  rw [bourClosedTensorPairing, bourClosedTensorPairing,
    ← integral_add (bourTensorInner_integrable _ _ _) (bourTensorInner_integrable _ _ _)]
  exact h

end
end SmoothPoincare.Bour
