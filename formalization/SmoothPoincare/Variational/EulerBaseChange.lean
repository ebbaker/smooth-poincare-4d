import SmoothPoincare.Variational.SpatialEulerVariation
import DifferentialGeometry.Analysis.Integration.Measure.VolumeDensity

/-! # Determinant of the spatial frame in the Euler coefficient -/

open Bundle DifferentialGeometry DifferentialGeometry.Integral.Measure
open DifferentialGeometry.Geometry.Curvature DifferentialGeometry.Geometry.Connection
open DifferentialGeometry.PDE.RicciFlow DifferentialGeometry.Tensor.Coordinates
open FirstOrderTwistor Matrix Module
open scoped ContDiff Manifold Matrix

noncomputable section
namespace SmoothPoincare

section ExteriorAlgebra

variable {V : Type*} [AddCommGroup V] [Module ℝ V]

private theorem finFour_cases (i : Fin 4) : i = 0 ∨ i = 1 ∨ i = 2 ∨ i = 3 :=
  (by decide : ∀ i : Fin 4, i = 0 ∨ i = 1 ∨ i = 2 ∨ i = 3) i

private def wedge22AlternatingMap (A B : LinearMap.BilinForm ℝ V)
    (hA : ∀ u v, A v u = -A u v) (hB : ∀ u v, B v u = -B u v) : V [⋀^Fin 4]→ₗ[ℝ] ℝ where
  toFun v := wedge22Volume (fun i j => A (v i) (v j)) (fun i j => B (v i) (v j))
  map_update_add' := by
    intro _ v i x y
    rcases finFour_cases i with rfl | rfl | rfl | rfl <;>
      simp (disch := omega) only [wedge22Volume, Function.update_self, Function.update_of_ne,
        map_add, LinearMap.add_apply] <;> ring
  map_update_smul' := by
    intro _ v i a x
    rcases finFour_cases i with rfl | rfl | rfl | rfl <;>
      simp (disch := omega) only [wedge22Volume, Function.update_self, Function.update_of_ne,
        map_smul, LinearMap.smul_apply, smul_eq_mul] <;> ring
  map_eq_zero_of_eq' := by
    intro v i j hv hne
    have hA0 (u : V) : A u u = 0 := by linarith only [hA u u]
    have hB0 (u : V) : B u u = 0 := by linarith only [hB u u]
    have hoA (i j : Fin 4) (_ : j < i) : A (v i) (v j) = -A (v j) (v i) := hA _ _
    have hoB (i j : Fin 4) (_ : j < i) : B (v i) (v j) = -B (v j) (v i) := hB _ _
    rcases finFour_cases i with rfl | rfl | rfl | rfl <;>
      rcases finFour_cases j with rfl | rfl | rfl | rfl <;> try exact (hne rfl).elim
    all_goals
      simp (disch := decide) only [wedge22Volume, hv, hA0, hB0, hoA, hoB]
      ring

/-- Holding the bundle indices fixed, the Pfaffian is an alternating
four-linear function of the actual spatial arguments. -/
def eulerPfaffianAlternatingMap (R : Fin 4 → Fin 4 → LinearMap.BilinForm ℝ V)
    (hR : ∀ a b u v, R a b v u = -R a b u v) : V [⋀^Fin 4]→ₗ[ℝ] ℝ :=
  wedge22AlternatingMap (R 0 1) (R 2 3) (hR 0 1) (hR 2 3) -
    wedge22AlternatingMap (R 0 2) (R 1 3) (hR 0 2) (hR 1 3) +
    wedge22AlternatingMap (R 0 3) (R 1 2) (hR 0 3) (hR 1 2)

/-- Changing the four base vectors multiplies the coefficient by the exact
oriented determinant. The endomorphism frame is held fixed in this law. -/
theorem eulerPfaffian_baseChange (R : Fin 4 → Fin 4 → LinearMap.BilinForm ℝ V)
    (hR : ∀ a b u v, R a b v u = -R a b u v) (e : Basis (Fin 4) ℝ V) (v : Fin 4 → V) :
    frameEulerPfaffian (fun a b i j => R a b (v i) (v j)) =
      frameEulerPfaffian (fun a b i j => R a b (e i) (e j)) * e.det v := by
  let P := eulerPfaffianAlternatingMap R hR
  change P v = P e * e.det v
  exact DFunLike.congr_fun (P.eq_smul_basis_det e) v


omit [Module ℝ V] in
private theorem updateCurvatureSecond (u v w z : V) :
    Function.update ![u, 0, w, z] (1 : Fin 4) v = ![u, v, w, z] := by
  funext i
  fin_cases i <;> rfl

private def curvatureBaseBilinForm (R : MultilinearMap ℝ (fun _ : Fin 4 => V) ℝ)
    (v w : V) : LinearMap.BilinForm ℝ V where
  toFun x := R.toLinearMap ![x, 0, v, w] 1
  map_add' x y := by
    ext z
    let m : Fin 4 → V := ![0, z, v, w]
    have hm (a : V) : Function.update m (0 : Fin 4) a = ![a, z, v, w] := by
      funext i
      fin_cases i <;> rfl
    simpa only [LinearMap.add_apply, MultilinearMap.toLinearMap_apply, hm, updateCurvatureSecond] using
      (R.map_update_add m (0 : Fin 4) x y)
  map_smul' c x := by
    ext z
    let m : Fin 4 → V := ![0, z, v, w]
    have hm (a : V) : Function.update m (0 : Fin 4) a = ![a, z, v, w] := by
      funext i
      fin_cases i <;> rfl
    simpa only [LinearMap.smul_apply, RingHom.id_apply, MultilinearMap.toLinearMap_apply, hm, updateCurvatureSecond] using
      (R.map_update_smul m (0 : Fin 4) c x)

private theorem curvatureBaseBilinForm_apply (R : MultilinearMap ℝ (fun _ : Fin 4 => V) ℝ)
    (u v w z : V) : curvatureBaseBilinForm R w z u v = R ![u, v, w, z] := by
  change R (Function.update ![u, 0, w, z] (1 : Fin 4) v) = _
  rw [updateCurvatureSecond]

end ExteriorAlgebra

section Geometry

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  [BoundarylessManifold I M]

local instance : CompleteSpace E := FiniteDimensional.complete ℝ E
local instance : IsManifold I 1 M := IsManifold.of_le (by decide : (1 : WithTop ℕ∞) ≤ ∞)

/-- The Pfaffian coefficient on four fixed base vectors using a possibly
moving orthonormal basis for the two bundle slots. -/
def metricEulerBaseCoefficient (g : SmoothRiemannianMetric I M) (o : ManifoldOrientation I M 4)
    (x : M) (f : OrientedOrthonormalFrameAt g o x) (u : Fin 4 → TangentSpace I x) : ℝ :=
  frameEulerPfaffian fun a b i j =>
    metricRm04StandardAt g x (u i) (u j) (f.basis b) (f.basis a)

/-- The base argument volume is the determinant against the supplying
slice frame. This identity also applies when the actual curvature comes
from a time-dependent metric and the base vectors stay fixed. -/
theorem metricEulerBaseCoefficient_eq_pfaffian_mul_det
    (g : SmoothRiemannianMetric I M) (o : ManifoldOrientation I M 4)
    (x : M) (f : OrientedOrthonormalFrameAt g o x) (u : Fin 4 → TangentSpace I x) :
    metricEulerBaseCoefficient g o x f u =
      frameEulerPfaffian (metricCurvatureFrameTensor g o x f) * f.basis.det u := by
  let R : Fin 4 → Fin 4 → LinearMap.BilinForm ℝ (TangentSpace I x) := fun a b =>
    curvatureBaseBilinForm (metricRm04At g x).toMultilinearMap (f.basis b) (f.basis a)
  have hR (a b : Fin 4) (v w : TangentSpace I x) :
      R a b v w = metricRm04StandardAt g x v w (f.basis b) (f.basis a) := by
    rw [metricRm04StandardAt_apply]
    have hVec : (vec4 v w (f.basis b) (f.basis a)) = ![v, w, f.basis b, f.basis a] := by
      funext i
      rcases finFour_cases i with rfl | rfl | rfl | rfl <;> rfl
    rw [hVec]
    exact curvatureBaseBilinForm_apply _ _ _ _ _
  have hSkew (a b : Fin 4) (v w : TangentSpace I x) : R a b w v = -R a b v w := by
    rw [hR, hR, CheegerGromovCompactness.metricRm04StandardAt_eq_inner_riemannOp,
      CheegerGromovCompactness.metricRm04StandardAt_eq_inner_riemannOp,
      riemannOp_swap (LeviCivita (I := I) g) x v w (f.basis b)]
    simp only [map_neg, neg_neg]
  have hFrame : (fun a b i j => R a b (f.basis i) (f.basis j)) =
      metricCurvatureFrameTensor g o x f := by
    funext a b i j
    rw [hR, ← metricCurvatureFrameTensor_pair_symm g o x f i j a b]
    rfl
  have h := eulerPfaffian_baseChange R hSkew f.basis u
  rw [hFrame] at h
  simpa only [hR, metricEulerBaseCoefficient] using h


omit [T2Space M] [BoundarylessManifold I M] in
private theorem orthonormalFrame_inner_eq_basisDot
    (g : SmoothRiemannianMetric I M) (o : ManifoldOrientation I M 4)
    (x : M) (f : OrientedOrthonormalFrameAt g o x) (u v : TangentSpace I x) :
    g.inner x u v = ∑ j, f.basis.repr u j * f.basis.repr v j := by
  conv_lhs => rw [← f.basis.sum_repr u, ← f.basis.sum_repr v]
  simp only [map_sum, _root_.sum_apply, map_smul, _root_.smul_apply,
    smul_eq_mul, Finset.mul_sum, f.orthonormal, mul_ite, mul_zero, mul_one]
  simp [mul_comm]

private def eulerChartBasis (o : ManifoldOrientation I M 4) (x : M) :
    Basis (Fin 4) ℝ (TangentSpace I x) :=
  ((trivializationAt E (TangentSpace I) x).basisAt
    (chartModelBasis E) (FiberBundle.mem_baseSet_trivializationAt' x)).reindex (finCongr o.dimension_eq)

omit [T2Space M] [BoundarylessManifold I M] in
private theorem chartDensity_eq_abs_eulerBasisDet
    (g : SmoothRiemannianMetric I M) (o : ManifoldOrientation I M 4)
    (x : M) (f : OrientedOrthonormalFrameAt g o x) :
    chartDensity g x x = |f.basis.det (eulerChartBasis o x)| := by
  let e := finCongr o.dimension_eq
  let Q := f.basis.toMatrix (eulerChartBasis o x)
  have hvec (i : Fin 4) : eulerChartBasis o x i = chartBasisVecFiber (I := I) x (e.symm i) x := by
    have hx : x ∈ (trivializationAt E (TangentSpace I) x).baseSet :=
      FiberBundle.mem_baseSet_trivializationAt' x
    have hcoord := localFrame_eq_chartBasisVec (I := I) x hx (e.symm i)
    rw [(trivializationAt E (TangentSpace I) x).localFrame_apply_of_mem_baseSet (chartModelBasis E) hx] at hcoord
    simpa only [eulerChartBasis, Basis.reindex_apply] using hcoord
  have hGram : (chartGramMatrix g x x).reindex e e = Qᵀ * Q := by
    ext i j
    simp only [Matrix.reindex_apply, Matrix.submatrix_apply, chartGramMatrix_apply,
      Matrix.mul_apply, Matrix.transpose_apply, Q, Basis.toMatrix_apply, hvec]
    exact orthonormalFrame_inner_eq_basisDot g o x f _ _
  unfold chartDensity
  rw [← Matrix.det_reindex_self e (chartGramMatrix g x x), hGram, Matrix.det_mul,
    Matrix.det_transpose, ← pow_two, Real.sqrt_sq_eq_abs]
  rw [Basis.det_apply]

omit [BoundarylessManifold I M] in
/-- Relative Riemannian volume of two metrics is the positive determinant
of the reference orthonormal frame expressed in the slice orthonormal frame.
The chart Gram determinants cancel in the ratio. -/
theorem riemannianVolumeDensity_eq_orientedBasisDet [SigmaCompactSpace M]
    (q g : SmoothRiemannianMetric I M) (o : ManifoldOrientation I M 4) (x : M)
    (e : OrientedOrthonormalFrameAt q o x) (f : OrientedOrthonormalFrameAt g o x) :
    riemannianVolumeDensity q g x = f.basis.det e.basis := by
  have hpos : 0 < f.basis.det e.basis :=
    (f.basis.orientation_eq_iff_det_pos e.basis).mp (f.oriented.trans e.oriented.symm)
  have hn : |e.basis.det (eulerChartBasis o x)| ≠ 0 := by
    rw [← chartDensity_eq_abs_eulerBasisDet q o x e]
    exact (chartDensity_pos q x (FiberBundle.mem_baseSet_trivializationAt' x)).ne'
  rw [riemannianVolumeDensity_apply_of_mem_chart_source q g x (mem_chart_source H x),
    chartDensity_eq_abs_eulerBasisDet g o x f, chartDensity_eq_abs_eulerBasisDet q o x e,
    ← f.basis.det_mul_det e.basis (eulerChartBasis o x), abs_mul, abs_of_pos hpos,
    mul_div_cancel_right₀ _ hn]

/-- The actual fixed-base Pfaffian is the supplying slice Pfaffian times
relative volume. Only the pointwise frame value enters this equality. -/
theorem ricciFlowEulerPfaffian_fixedBase_eq_slicePfaffian_mul_volume [SigmaCompactSpace M]
    {D : RealTimeInterval} (S : SolutionOn (I := I) (M := M) D) (s : ℝ)
    (q : SmoothRiemannianMetric I M) (o : ManifoldOrientation I M 4) (x : M)
    (e : OrientedOrthonormalFrameAt q o x) (f : OrientedOrthonormalFrameAt (S.family.metric s) o x)
    (b : ℝ → Fin 4 → TangentSpace I x) (hb : ∀ a, b s a = f.basis a) :
    let g := S.family.metric s
    2 * frameEulerPfaffian (fun a c i j => eulerCurvatureCoefficient S x (e.basis i) (e.basis j)
      (fun t => b t c) (fun t => b t a) s) =
      (2 * frameEulerPfaffian (metricCurvatureFrameTensor g o x f)) * riemannianVolumeDensity q g x := by
  intro g
  have hBase : frameEulerPfaffian (fun a c i j =>
      eulerCurvatureCoefficient S x (e.basis i) (e.basis j)
        (fun t => b t c) (fun t => b t a) s) = metricEulerBaseCoefficient g o x f e.basis := by
    simp only [eulerCurvatureCoefficient, hb, metricEulerBaseCoefficient, g,
      SolutionFamily.rm04, SolutionOn.family_metric, metricRm04StandardAt_apply, metricRm04_apply]
  rw [hBase, metricEulerBaseCoefficient_eq_pfaffian_mul_det, ← mul_assoc,
    riemannianVolumeDensity_eq_orientedBasisDet q g o x e f]

/-- Express the actual fixed-base Pfaffian as the four geometric densities
on the supplying slice, multiplied by the density of its volume. -/
theorem ricciFlowEulerPfaffian_fixedBase_eq_chargeDensity_mul_volume [SigmaCompactSpace M]
    {D : RealTimeInterval} (S : SolutionOn (I := I) (M := M) D) (s : ℝ)
    (q : SmoothRiemannianMetric I M) (o : ManifoldOrientation I M 4) (x : M)
    (e : OrientedOrthonormalFrameAt q o x)
    (f : ∀ y, OrientedOrthonormalFrameAt (S.family.metric s) o y)
    (b : ℝ → Fin 4 → TangentSpace I x) (hb : ∀ a, b s a = (f x).basis a) :
    let g := S.family.metric s
    2 * frameEulerPfaffian (fun a c i j => eulerCurvatureCoefficient S x (e.basis i) (e.basis j)
      (fun t => b t c) (fun t => b t a) s) =
      (modifiedChargeDensity o g f .plus x + modifiedChargeDensity o g f .minus x +
        modifiedChargeDensity o g f .scalar x / 24 - modifiedChargeDensity o g f .ricci x / 2) *
        riemannianVolumeDensity q g x := by
  intro g
  have h := ricciFlowEulerPfaffian_fixedBase_eq_slicePfaffian_mul_volume S s q o x e (f x) b hb
  simpa only [metricFrameEulerPfaffian_eq_chargeDensity] using h

end Geometry
end SmoothPoincare
