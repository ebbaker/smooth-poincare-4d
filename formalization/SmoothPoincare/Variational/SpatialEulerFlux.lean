import SmoothPoincare.Variational.ModifiedFrameDecomposition
import DifferentialGeometry.Analysis.Integration.DivergenceTheorem.Global.IntegrationByParts
import DifferentialGeometry.Geometry.Metric.PointwiseInner.Bounds
import DifferentialGeometry.Geometry.Operator.Gradient.Basic
import DifferentialGeometry.Geometry.Flow.RicciFlow.Evolution.Connection.Intrinsic

/-! # Local Euler flux and its spatial integration on the modified slices -/

open Bundle DifferentialGeometry DifferentialGeometry.Geometry.Connection
open DifferentialGeometry.Geometry.Curvature DifferentialGeometry.Geometry.Operator
open DifferentialGeometry.Integral.DivergenceTheorem DifferentialGeometry.Integral.Measure
open DifferentialGeometry.PDE.RicciFlow DifferentialGeometry.Tensor0SBundle
open FirstOrderTwistor MeasureTheory SectionsAndConnections Set
open scoped ContDiff Manifold

namespace SmoothPoincare

/-- The volume coefficient of a wedge of two 2-forms, written using increasing
pairs in one oriented frame. -/
def wedge22Volume (F G : Fin 4 → Fin 4 → ℝ) : ℝ :=
  F 0 1 * G 2 3 - F 0 2 * G 1 3 + F 0 3 * G 1 2 +
    F 1 2 * G 0 3 - F 1 3 * G 0 2 + F 2 3 * G 0 1

/-- The Euler Pfaffian (unit curvature gives 3), with the base form slots
last and frame endomorphism slots first. The manuscript density is twice it. -/
def frameEulerPfaffian (R : CurvatureFrameTensor) : ℝ :=
  wedge22Volume (R 0 1) (R 2 3) - wedge22Volume (R 0 2) (R 1 3) +
    wedge22Volume (R 0 3) (R 1 2)

/-- Match the Pfaffian with the full ordered curvature and its traces,
using the same slot convention as the chiral blocks. -/
theorem frameEulerPfaffian_eq_quadratic (R : CurvatureFrameTensor)
    (hFirst : ∀ a b c d, R b a c d = -R a b c d)
    (hLast : ∀ a b c d, R a b d c = -R a b c d)
    (hPair : ∀ a b c d, R a b c d = R c d a b)
    (hBianchi : R 0 1 2 3 + R 1 2 0 3 + R 2 0 1 3 = 0) :
    2 * frameEulerPfaffian R = frameTensorNormSq R / 4 -
      (∑ a : Fin 4, ∑ b : Fin 4, frameRicciTensor R a b ^ 2) +
      frameScalarCurvature R ^ 2 / 4 := by
  have firstDiagonal (a c d : Fin 4) : R a a c d = 0 := by
    linarith only [hFirst a a c d]
  have lastDiagonal (a b c : Fin 4) : R a b c c = 0 := by
    linarith only [hLast a b c c]
  have orderFirst (a b c d : Fin 4) (_h : b < a) : R a b c d = -R b a c d :=
    hFirst b a c d
  have orderLast (a b c d : Fin 4) (_h : d < c) : R a b c d = -R a b d c :=
    hLast a b d c
  have orderPairs (a b c d : Fin 4) (_h : 4 * c.val + d.val < 4 * a.val + b.val) :
      R a b c d = R c d a b := hPair a b c d
  have bianchi : R 0 1 2 3 = R 0 2 1 3 - R 0 3 1 2 := by
    rw [hPair 1 2 0 3, hFirst 0 2 1 3] at hBianchi
    linarith only [hBianchi]
  simp only [frameEulerPfaffian, wedge22Volume, frameTensorNormSq, frameRicciTensor,
    frameScalarCurvature, Fin.sum_univ_four]
  simp (disch := decide) only [firstDiagonal, lastDiagonal, orderFirst, orderLast, orderPairs,
    neg_neg, bianchi]
  ring

/-- The volume coefficient of `d(α ∧ F)` computed by the product rule
from the first derivatives in a frame normal at the tested point.
The slots of `dα` and `dF` are derivative-first. -/
def exteriorWedge12Volume (α : Fin 4 → ℝ) (F dα : Fin 4 → Fin 4 → ℝ)
    (dF : Fin 4 → Fin 4 → Fin 4 → ℝ) : ℝ :=
  let term := fun i j k l =>
    dα i j * F k l + α j * dF i k l - (dα i k * F j l + α k * dF i j l) +
      (dα i l * F j k + α l * dF i j k)
  term 0 1 2 3 - term 1 0 2 3 + term 2 0 1 3 - term 3 0 1 2

/-- First-jet exterior product rule on a spatial slice. The four displayed
cyclic sums are exactly the coefficient equations for the covariant Bianchi
identity in the chosen normal frame. -/
theorem exteriorWedge12Volume_of_bianchi (α : Fin 4 → ℝ) (F dα : Fin 4 → Fin 4 → ℝ)
    (dF : Fin 4 → Fin 4 → Fin 4 → ℝ)
    (h012 : dF 0 1 2 - dF 1 0 2 + dF 2 0 1 = 0)
    (h013 : dF 0 1 3 - dF 1 0 3 + dF 3 0 1 = 0)
    (h023 : dF 0 2 3 - dF 2 0 3 + dF 3 0 2 = 0)
    (h123 : dF 1 2 3 - dF 2 1 3 + dF 3 1 2 = 0) :
    exteriorWedge12Volume α F dα dF =
      wedge22Volume (fun i j => dα i j - dα j i) F := by
  have h := congrArg₂ (· + ·) (congrArg₂ (· - ·)
    (congrArg (α 3 * ·) h012) (congrArg (α 2 * ·) h013))
    (congrArg₂ (· - ·) (congrArg (α 1 * ·) h023) (congrArg (α 0 * ·) h123))
  dsimp [exteriorWedge12Volume, wedge22Volume] at ⊢
  linear_combination h

private theorem wedge22Volume_comm (F G : Fin 4 → Fin 4 → ℝ) :
    wedge22Volume F G = wedge22Volume G F := by
  unfold wedge22Volume
  ring

private theorem wedge22Volume_hasDerivAt (F G : ℝ → Fin 4 → Fin 4 → ℝ)
    (F' G' : Fin 4 → Fin 4 → ℝ) (t : ℝ)
    (hF : ∀ i j, HasDerivAt (fun s => F s i j) (F' i j) t)
    (hG : ∀ i j, HasDerivAt (fun s => G s i j) (G' i j) t) :
    HasDerivAt (fun s => wedge22Volume (F s) (G s))
      (wedge22Volume F' (G t) + wedge22Volume (F t) G') t := by
  have h := (((((hF 0 1).mul (hG 2 3)).sub ((hF 0 2).mul (hG 1 3))).add
    ((hF 0 3).mul (hG 1 2))).add ((hF 1 2).mul (hG 0 3))).sub
    ((hF 1 3).mul (hG 0 2)) |>.add ((hF 2 3).mul (hG 0 1))
  convert h using 1
  · rfl
  · unfold wedge22Volume
    ring

/-- Normal-frame coefficient of the local Chern–Weil identity
`∂ₜ(2 Pf(F)) = d T`. The base vectors are held fixed while the curvature
endomorphisms are represented in an isometrically identified bundle.
The curvature time derivative is the skew spatial derivative of the
connection velocity `α` at the normal-frame point. The other four first
jets are precisely the covariant Bianchi equations for each form `F a b`. -/
theorem frameEulerPfaffian_hasDerivAt_of_bianchi
    (F : ℝ → CurvatureFrameTensor) (t : ℝ) (α : Fin 4 → Fin 4 → Fin 4 → ℝ)
    (dα : CurvatureFrameTensor) (dF : Fin 4 → Fin 4 → Fin 4 → Fin 4 → Fin 4 → ℝ)
    (hF : ∀ a b i j, HasDerivAt (fun s => F s a b i j) (dα a b i j - dα a b j i) t)
    (hB : ∀ a b, let D := dF a b
      D 0 1 2 - D 1 0 2 + D 2 0 1 = 0 ∧ D 0 1 3 - D 1 0 3 + D 3 0 1 = 0 ∧
      D 0 2 3 - D 2 0 3 + D 3 0 2 = 0 ∧ D 1 2 3 - D 2 1 3 + D 3 1 2 = 0) :
    let dT := fun a b c d => exteriorWedge12Volume (α a b) (F t c d) (dα a b) (dF c d)
    HasDerivAt (fun s => 2 * frameEulerPfaffian (F s))
      (2 * (dT 0 1 2 3 + dT 2 3 0 1 - dT 0 2 1 3 - dT 1 3 0 2 +
        dT 0 3 1 2 + dT 1 2 0 3)) t := by
  intro dT
  have hdT (a b c d : Fin 4) : dT a b c d =
      wedge22Volume (fun i j => dα a b i j - dα a b j i) (F t c d) := by
    obtain ⟨h012, h013, h023, h123⟩ := hB c d
    exact exteriorWedge12Volume_of_bianchi _ _ _ _ h012 h013 h023 h123
  have derivPair (a b c d : Fin 4) :
      HasDerivAt (fun s => wedge22Volume (F s a b) (F s c d))
        (dT a b c d + dT c d a b) t := by
    rw [hdT a b c d, hdT c d a b,
      wedge22Volume_comm (fun i j => dα c d i j - dα c d j i) (F t a b)]
    exact wedge22Volume_hasDerivAt _ _ _ _ _ (hF a b) (hF c d)
  have h := (((derivPair 0 1 2 3).sub (derivPair 0 2 1 3)).add
    (derivPair 0 3 1 2)).const_mul 2
  convert h using 1
  · rfl
  · ring

/-- The coefficient of the normalized Euler transgression 3-form on the
ordered base triple `i,j,k`. The connection velocity has endomorphism
slots first, as does curvature. -/
def frameEulerTransgression
    (α : Fin 4 → Fin 4 → Fin 4 → ℝ) (F : CurvatureFrameTensor) (i j k : Fin 4) : ℝ :=
  let term := fun a b c d => α a b i * F c d j k - α a b j * F c d i k + α a b k * F c d i j
  2 * (term 0 1 2 3 + term 2 3 0 1 - term 0 2 1 3 - term 1 3 0 2 +
    term 0 3 1 2 + term 1 2 0 3)

private theorem abs_le_sqrt_sum_sq (f : Fin 4 → ℝ) (i : Fin 4) :
    |f i| ≤ Real.sqrt (∑ j, f j ^ 2) := by
  rw [← Real.sqrt_sq_eq_abs]
  exact Real.sqrt_le_sqrt (Finset.single_le_sum (f := fun j => f j ^ 2)
    (fun j _ => sq_nonneg _) (Finset.mem_univ i))

/-- A dimension-only bound in the ordered tensor norm. The explicit constant
allows a sum over the four increasing triples, without using an estimate for
the operator norm of wedge multiplication. The slots of `D` are derivative,
then the two Ricci arguments. -/
theorem frameEulerTransgression_norm_of_ricciDerivative
    (D : Fin 4 → Fin 4 → Fin 4 → ℝ) (F : CurvatureFrameTensor) :
    let α := fun a b i => D a i b - D b i a
    let T := frameEulerTransgression α F
    let N := Real.sqrt (∑ i : Fin 4, ∑ j : Fin 4, ∑ k : Fin 4, D i j k ^ 2)
    let U := Real.sqrt (frameTensorNormSq F)
    Real.sqrt (T 0 1 2 ^ 2 + T 0 1 3 ^ 2 + T 0 2 3 ^ 2 + T 1 2 3 ^ 2) ≤ 144 * (U * N) := by
  intro α T N U
  have hD (a i b : Fin 4) : |D a i b| ≤ N :=
    (abs_le_sqrt_sum_sq (D a i) b).trans (Real.sqrt_le_sqrt
      ((Finset.single_le_sum (f := fun j => ∑ k, D a j k ^ 2)
        (fun j _ => Finset.sum_nonneg fun k _ => sq_nonneg _) (Finset.mem_univ i)).trans
        (Finset.single_le_sum (f := fun j => ∑ k, ∑ l, D j k l ^ 2)
          (fun j _ => Finset.sum_nonneg fun k _ => Finset.sum_nonneg fun l _ => sq_nonneg _)
          (Finset.mem_univ a))))
  have hF (a b i j : Fin 4) : |F a b i j| ≤ U :=
    (abs_le_sqrt_sum_sq (F a b i) j).trans (Real.sqrt_le_sqrt
      ((Finset.single_le_sum (f := fun k => ∑ l, F a b k l ^ 2)
        (fun k _ => Finset.sum_nonneg fun l _ => sq_nonneg _) (Finset.mem_univ i)).trans
        ((Finset.single_le_sum (f := fun k => ∑ l, ∑ m, F a k l m ^ 2)
          (fun k _ => Finset.sum_nonneg fun l _ => Finset.sum_nonneg fun m _ => sq_nonneg _)
          (Finset.mem_univ b)).trans (Finset.single_le_sum
          (f := fun k => ∑ l, ∑ m, ∑ n, F k l m n ^ 2)
          (fun k _ => Finset.sum_nonneg fun l _ => Finset.sum_nonneg fun m _ =>
            Finset.sum_nonneg fun n _ => sq_nonneg _) (Finset.mem_univ a)))))
  have hN : 0 ≤ N := Real.sqrt_nonneg _
  have hU : 0 ≤ U := Real.sqrt_nonneg _
  have hUN : 0 ≤ U * N := mul_nonneg hU hN
  have hα (a b i : Fin 4) : |α a b i| ≤ 2 * N := by
    dsimp only [α]
    rw [two_mul]
    exact (abs_sub _ _).trans (add_le_add (hD a i b) (hD b i a))
  have hterm (a b c d i j k : Fin 4) :
      |α a b i * F c d j k - α a b j * F c d i k + α a b k * F c d i j| ≤ 6 * (U * N) := by
    have hmul (p q r : Fin 4) : |α a b p * F c d q r| ≤ (2 * N) * U := by
      rw [abs_mul]
      exact mul_le_mul (hα a b p) (hF c d q r) (abs_nonneg _) (by positivity)
    calc
      _ ≤ (|α a b i * F c d j k| + |α a b j * F c d i k|) + |α a b k * F c d i j| :=
        (abs_add_le _ _).trans (add_le_add (abs_sub _ _) le_rfl)
      _ ≤ ((2 * N) * U + (2 * N) * U) + (2 * N) * U :=
        add_le_add (add_le_add (hmul i j k) (hmul j i k)) (hmul k i j)
      _ = _ := by ring
  have hAdd {x y A B : ℝ} (hx : |x| ≤ A) (hy : |y| ≤ B) : |x + y| ≤ A + B :=
    (abs_add_le _ _).trans (add_le_add hx hy)
  have hSub {x y A B : ℝ} (hx : |x| ≤ A) (hy : |y| ≤ B) : |x - y| ≤ A + B :=
    (abs_sub _ _).trans (add_le_add hx hy)
  have hT (i j k : Fin 4) : |T i j k| ≤ 72 * (U * N) := by
    dsimp only [T, frameEulerTransgression]
    rw [abs_mul, abs_of_nonneg (by norm_num : (0 : ℝ) ≤ 2)]
    have h := hAdd (hAdd (hSub (hSub (hAdd (hterm 0 1 2 3 i j k) (hterm 2 3 0 1 i j k))
      (hterm 0 2 1 3 i j k)) (hterm 1 3 0 2 i j k)) (hterm 0 3 1 2 i j k)) (hterm 1 2 0 3 i j k)
    linarith only [h]
  have hs (i j k : Fin 4) : T i j k ^ 2 ≤ (72 * (U * N)) ^ 2 := by
    rw [← sq_abs (T i j k)]
    exact (sq_le_sq₀ (abs_nonneg _) (by positivity)).2 (hT i j k)
  rw [← Real.sqrt_sq (by positivity : 0 ≤ 144 * (U * N))]
  apply Real.sqrt_le_sqrt
  nlinarith only [hs 0 1 2, hs 0 1 3, hs 0 2 3, hs 1 2 3]

section SliceNormalization

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  [BoundarylessManifold I M]

/-- The normalized Euler coefficient of the actual Levi–Civita curvature
is the combination of the four modified charge densities. -/
theorem metricFrameEulerPfaffian_eq_chargeDensity
    (g : SmoothRiemannianMetric I M) (o : ManifoldOrientation I M 4)
    (f : ∀ x, OrientedOrthonormalFrameAt g o x) (x : M) :
    2 * frameEulerPfaffian (metricCurvatureFrameTensor g o x (f x)) =
      modifiedChargeDensity o g f .plus x + modifiedChargeDensity o g f .minus x +
      modifiedChargeDensity o g f .scalar x / 24 - modifiedChargeDensity o g f .ricci x / 2 := by
  rw [frameEulerPfaffian_eq_quadratic _ (metricCurvatureFrameTensor_swap_first g o x (f x))
    (metricCurvatureFrameTensor_swap_last g o x (f x))
    (metricCurvatureFrameTensor_pair_symm g o x (f x))
    (metricCurvatureFrameTensor_bianchi g o x (f x) 0 1 2 3),
    metricFrameTensorNormSq_eq_chiral_ricci_scalar g o x (f x), frameScalarCurvature_metric]
  simp only [modifiedChargeDensity, endpointRicciDefectDensity]
  rw [← frameScalarCurvature_metric g o x (f x)]
  simp only [frameScalarCurvature, Fin.sum_univ_four]
  norm_num
  ring

/-- The lowered covariant curvature derivative with its endomorphism pair
first and its derivative in the first base slot. -/
noncomputable def metricFrameEulerCovariantDerivative
    (g : SmoothRiemannianMetric I M) (o : ManifoldOrientation I M 4)
    (x : M) (f : OrientedOrthonormalFrameAt g o x) (a b i j k : Fin 4) : ℝ := by
  letI : CompleteSpace E := FiniteDimensional.complete ℝ E
  exact totalNabla0SFun 4 (metricCov g) (metricRm04 g) x
    (vec5 (f.basis i) (f.basis j) (f.basis k) (f.basis b) (f.basis a))

omit [BoundarylessManifold I M] in
/-- The actual spatial covariant derivative supplies the four Bianchi
coefficients in `frameEulerPfaffian_hasDerivAt_of_bianchi`. -/
theorem metricFrameEulerCovariantDerivative_bianchi
    (g : SmoothRiemannianMetric I M) (o : ManifoldOrientation I M 4)
    (x : M) (f : OrientedOrthonormalFrameAt g o x) (a b i j k : Fin 4) :
    let D := metricFrameEulerCovariantDerivative g o x f a b
    D i j k - D j i k + D k i j = 0 := by
  let : CompleteSpace E := FiniteDimensional.complete ℝ E
  let F := totalNabla0SFun 4 (metricCov g) (metricRm04 g) x
  have hB : SecondBianchiAt (I := I) F := levi_civita_second_bianchi g
  have hS : NablaRmSymmAt (I := I) F := levi_civita_covariant_riemann_symmetries g
  have hC := hB (f.basis i) (f.basis j) (f.basis k) (f.basis b) (f.basis a)
  have hSkew := hS.2.1 (f.basis j) (f.basis i) (f.basis k) (f.basis b) (f.basis a)
  dsimp only [metricFrameEulerCovariantDerivative]
  change F _ - F _ + F _ = 0
  rw [hSkew] at hC
  linarith only [hC]

end SliceNormalization

section RicciFlow

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  [BoundarylessManifold I M]

/-- For the actual Ricci-flow Levi–Civita derivative the metric-frame
correction is `∇_v Ric(w,z)`. The two remaining terms are skew in the
endomorphism slots `w,z`. This is a pointwise connection-variation identity. -/
theorem ricciFlow_orthogonalConnectionVariation {D : RealTimeInterval}
    (S : SolutionOn (I := I) (M := M) D) (hS : IsSolutionOn S) (t : D.RegularTime)
    (x : M) (v w z : TangentSpace I x) :
    let nablaRic := fun a b c =>
      totalNabla0SFun 2 (LeviCivita (S.family.metric t)) (S.ricci t) x (Fin.cons a (vec2 b c))
    (S.family.metric t).inner x (leviCivitaVariation S.family.metric t x w v) z +
        nablaRic v w z = nablaRic z v w - nablaRic w v z := by
  dsimp only
  rw [leviCivita_variation_pair_eq_neg_ricci_cov_deriv S hS t x]
  ring

/-- The normalized local primitive of the actual Ricci-flow variation, in
an oriented orthonormal slice frame, obeys the ordered tensor-norm bound. -/
theorem ricciFlow_frameEulerTransgression_norm {D : RealTimeInterval}
    (S : SolutionOn (I := I) (M := M) D) (hS : IsSolutionOn S) (t : D.RegularTime)
    (o : ManifoldOrientation I M 4) (x : M)
    (f : OrientedOrthonormalFrameAt (S.family.metric t) o x) :
    let g := S.family.metric t
    let nablaRic := fun i j k => totalNabla0SFun 2 (LeviCivita g) (S.ricci t) x
      (Fin.cons (f.basis i) (vec2 (f.basis j) (f.basis k)))
    let α := fun a b i =>
      g.inner x (leviCivitaVariation S.family.metric t x (f.basis b) (f.basis i)) (f.basis a) +
        nablaRic i b a
    let F := metricCurvatureFrameTensor g o x f
    let T := frameEulerTransgression α F
    let N := Real.sqrt (∑ i : Fin 4, ∑ j : Fin 4, ∑ k : Fin 4, nablaRic i j k ^ 2)
    let U := Real.sqrt (frameTensorNormSq F)
    Real.sqrt (T 0 1 2 ^ 2 + T 0 1 3 ^ 2 + T 0 2 3 ^ 2 + T 1 2 3 ^ 2) ≤ 144 * (U * N) := by
  intro g nablaRic α F T N U
  have hα : α = fun a b i => nablaRic a i b - nablaRic b i a := by
    funext a b i
    exact ricciFlow_orthogonalConnectionVariation S hS t x (f.basis i) (f.basis b) (f.basis a)
  dsimp only [T]
  rw [hα]
  exact frameEulerTransgression_norm_of_ricciDerivative nablaRic F

end RicciFlow

section Integration

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  [I.Boundaryless] [CompactSpace M]

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

/-- Slice estimate using actual Riemannian integration by parts. If the
current vector is dual to the transgression 3-form via insertion into volume,
this controls its weighted divergence with two spatial `L²` norms. -/
theorem eulerSpatialFlux_integral_bound (g : SmoothRiemannianMetric I M)
    (χ : C^∞⟮I, M; ℝ⟯) (X : Cₛ^∞⟮I; E, (TangentSpace I : M → Type _)⟯)
    (U N : M → ℝ) {c δ : ℝ} (hc : 0 ≤ c) (hδ : 0 ≤ δ) :
    let μ := riemannianVolumeMeasure I M g
    MemLp U 2 μ → MemLp N 2 μ →
    (∀ x, 0 ≤ U x) → (∀ x, 0 ≤ N x) →
    (∀ x, Real.sqrt (g.inner x (X x) (X x)) ≤ c * (U x * N x)) →
    (∀ x, Real.sqrt (g.inner x (gradG g χ x) (gradG g χ x)) ≤ δ) →
    |∫ x, χ x * divergenceG g X x ∂μ| ≤
      (c * δ) * (Real.sqrt (∫ x, U x ^ 2 ∂μ) * Real.sqrt (∫ x, N x ^ 2 ∂μ)) := by
  intro μ hU hN hUn hNn hX hχ
  have hStokes := integral_tangentSectionAction_eq_neg_integral_smul_divergence
    g χ.contMDiff X (HasCompactSupport.of_compactSpace _)
  have hpoint (x : M) : |tangentSectionAction X χ x| ≤ (c * δ) * (U x * N x) := by
    rw [tangentSectionAction_eq_inner_grad_g]
    calc
      _ ≤ Real.sqrt (g.inner x (X x) (X x)) *
          Real.sqrt (g.inner x (gradG g χ x) (gradG g χ x)) :=
        g.abs_metric_inner_le_sqrt_metric_quadratic x _ _
      _ ≤ (c * (U x * N x)) * δ :=
        mul_le_mul (hX x) (hχ x) (Real.sqrt_nonneg _) (mul_nonneg hc (mul_nonneg (hUn x) (hNn x)))
      _ = _ := by ring
  have hact : Integrable (fun x => |tangentSectionAction X χ x|) μ :=
    (Continuous.integrable_of_hasCompactSupport_riemannianVolumeMeasure g
      (tangentSectionAction_contMDiff X χ.contMDiff).continuous
      (HasCompactSupport.of_compactSpace _)).abs
  have hprod : Integrable (fun x => U x * N x) μ := hU.integrable_mul hN
  have hHölder := integral_mul_le_Lp_mul_Lq_of_nonneg
    (by rw [Real.holderConjugate_iff]; norm_num : (2 : ℝ).HolderConjugate 2)
    (μ := μ) (ae_of_all _ hUn) (ae_of_all _ hNn) (by simpa using hU) (by simpa using hN)
  simp only [Real.rpow_two, ← Real.sqrt_eq_rpow] at hHölder
  calc
    _ = |∫ x, tangentSectionAction X χ x ∂μ| := by rw [hStokes, abs_neg]
    _ ≤ ∫ x, |tangentSectionAction X χ x| ∂μ := abs_integral_le_integral_abs
    _ ≤ ∫ x, (c * δ) * (U x * N x) ∂μ := integral_mono hact (hprod.const_mul _) hpoint
    _ ≤ _ := by rw [integral_const_mul]; exact mul_le_mul_of_nonneg_left hHölder (mul_nonneg hc hδ)

/-- A smooth fixed cutoff and an instantaneous Euler-divergence identity
suffice for finite transport. The derivative budgets refer to each slice's
own volume. Only continuity of the tested moment is required at time zero. -/
theorem modifiedEuler_transport_of_spatialFlux
    (g : ℝ → SmoothRiemannianMetric I M) (χ : C^∞⟮I, M; ℝ⟯)
    (X : ℝ → Cₛ^∞⟮I; E, (TangentSpace I : M → Type _)⟯)
    (m : ℝ → ℝ) (U N : ℝ → M → ℝ) {τ b c δ A L : ℝ}
    (hτ : 0 < τ) (hb : b < 1/2) (hc : 0 ≤ c) (hδ : 0 ≤ δ)
    (hA : 0 ≤ A) (hL : 0 ≤ L) :
    let μ := fun s => riemannianVolumeMeasure I M (g s)
    let a := fun s => Real.sqrt (∫ x, N s x ^ 2 ∂(μ s))
    let w := fun s => Real.sqrt (τ ^ (2*b) * s ^ (-(2*b)))
    let flux := fun s => ∫ x, χ x * divergenceG (g s) (X s) x ∂(μ s)
    ContinuousOn m (Icc 0 τ) → AEStronglyMeasurable flux (volume.restrict (Ioc 0 τ)) →
    (∀ s ∈ Ioo 0 τ, HasDerivAt m (flux s) s) →
    (∀ s ∈ Ioo 0 τ, MemLp (U s) 2 (μ s) ∧ MemLp (N s) 2 (μ s)) →
    (∀ s ∈ Ioo 0 τ, ∀ x, 0 ≤ U s x ∧ 0 ≤ N s x) →
    (∀ s ∈ Ioo 0 τ, ∀ x,
      Real.sqrt ((g s).inner x (X s x) (X s x)) ≤ c * (U s x * N s x)) →
    (∀ s ∈ Ioo 0 τ, ∀ x,
      Real.sqrt ((g s).inner x (gradG (g s) χ x) (gradG (g s) χ x)) ≤ δ * w s) →
    (∀ s ∈ Ioo 0 τ, Real.sqrt (∫ x, U s x ^ 2 ∂(μ s)) ≤ A) →
    MemLp a 2 (volume.restrict (Ioc 0 τ)) →
    (∫ s in (0 : ℝ)..τ, (a s)^2) ≤ L^2 →
    |m τ - m 0| ≤ (c * δ * A * L) * Real.sqrt (τ / (1 - 2*b)) := by
  intro μ a w flux hm hmeas hderiv hLp hn hX hχ hU ha hbudget
  have hpoint (s : ℝ) (hs : s ∈ Ioo 0 τ) : |flux s| ≤ c * δ * A * (w s * a s) := by
    refine (eulerSpatialFlux_integral_bound (g s) χ (X s) (U s) (N s) hc
      (mul_nonneg hδ (Real.sqrt_nonneg _)) (hLp s hs).1 (hLp s hs).2
      (fun x => (hn s hs x).1) (fun x => (hn s hs x).2) (hX s hs) (hχ s hs)).trans ?_
    calc
      _ ≤ (c * (δ * w s)) * (A * a s) :=
        mul_le_mul_of_nonneg_left (mul_le_mul_of_nonneg_right (hU s hs) (Real.sqrt_nonneg _))
          (mul_nonneg hc (mul_nonneg hδ (Real.sqrt_nonneg _)))
      _ = _ := by ring
  let ν := volume.restrict (Ioc (0 : ℝ) τ)
  have ws : (fun s => (w s)^2) =ᵐ[ν] (fun s : ℝ => τ^(2*b) * s^(-(2*b))) := by
    filter_upwards [ae_restrict_mem (μ := volume) measurableSet_Ioc] with s hs
    exact Real.sq_sqrt (mul_nonneg (Real.rpow_nonneg hτ.le _) (Real.rpow_nonneg hs.1.le _))
  have hi := (intervalIntegrable_iff_integrableOn_Ioc_of_le hτ.le).1
    (intervalIntegral.intervalIntegrable_rpow' (by linarith : -1 < -(2*b)))
  have hw : MemLp w 2 ν := (memLp_two_iff_integrable_sq (by dsimp [w]; fun_prop)).2
    ((hi.const_mul (τ^(2*b))).congr ws.symm)
  have hprodOn : Integrable (fun s => c * δ * A * (w s * a s)) ν :=
    (hw.integrable_mul ha).const_mul _
  have hprod : IntervalIntegrable (fun s => c * δ * A * (w s * a s)) volume 0 τ :=
    (intervalIntegrable_iff_integrableOn_Ioc_of_le hτ.le).2 hprodOn
  have hint : IntervalIntegrable flux volume 0 τ := by
    apply (intervalIntegrable_iff_integrableOn_Ioc_of_le hτ.le).2
    refine hprodOn.mono' hmeas ?_
    change (∀ᵐ s ∂ν, ‖flux s‖ ≤ c * δ * A * (w s * a s))
    have hmem : ∀ᵐ s ∂ν, s ∈ Ioo 0 τ := by
      rw [show ν = volume.restrict (Ioo 0 τ) from restrict_Ioo_eq_restrict_Ioc.symm]
      exact ae_restrict_mem measurableSet_Ioo
    filter_upwards [hmem] with s hs
    simpa only [Real.norm_eq_abs] using hpoint s hs
  have hchange : |m τ - m 0| ≤ c * δ * A * ∫ s in (0 : ℝ)..τ, w s * a s := by
    rw [← intervalIntegral.integral_eq_sub_of_hasDerivAt_of_le hτ.le hm hderiv hint,
      ← intervalIntegral.integral_const_mul]
    have habs : |∫ s in (0 : ℝ)..τ, flux s| ≤ ∫ s in (0 : ℝ)..τ, |flux s| := by
      simpa only [Real.norm_eq_abs] using
        intervalIntegral.norm_integral_le_integral_norm (f := flux) hτ.le
    exact habs.trans (intervalIntegral.integral_mono_on_of_le_Ioo hτ.le hint.abs hprod hpoint)
  have htrans := modifiedEuler_transport_of_flux hτ hb (mul_nonneg (mul_nonneg hc hδ) hA) hL
    a ha (ae_of_all _ fun _ => Real.sqrt_nonneg _) hbudget hchange
  simpa only [modifiedEuler_timeWeight hτ hb] using htrans

end Integration

end SmoothPoincare
