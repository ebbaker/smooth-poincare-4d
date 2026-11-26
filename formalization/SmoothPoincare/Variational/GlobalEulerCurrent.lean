import SmoothPoincare.Variational.SpatialEulerVariation
import DifferentialGeometry.Geometry.Connection.MetricCompatibility.Tensor.Metric
import DifferentialGeometry.Geometry.Connection.MetricTrace.CovariantDerivative
import DifferentialGeometry.Geometry.Operator.Gradient.CotangentSharpSmoothness
import DifferentialGeometry.Geometry.Connection.LeviCivita.Divergence.FrameInvariance

/-! # The intrinsic Euler current on a smooth four-dimensional slice -/

open Bundle DifferentialGeometry DifferentialGeometry.Geometry.Connection
open DifferentialGeometry.Geometry.Curvature DifferentialGeometry.Geometry.Operator
open DifferentialGeometry.Integral.DivergenceTheorem DifferentialGeometry.Tensor0SBundle
open DifferentialGeometry.PDE.RicciFlow DifferentialGeometry.Tensor.RSTensor FirstOrderTwistor
open scoped ContDiff Manifold

noncomputable section

namespace SmoothPoincare

private def eulerFrameDelta (i j : Fin 4) : ℝ := if i = j then 1 else 0

/-- Double-dual curvature in an orthonormal frame. -/
def frameEulerDoubleDual (R : CurvatureFrameTensor) (i j a b : Fin 4) : ℝ :=
  let Z := frameRicciTensor R
  R i j a b - (eulerFrameDelta i a * Z b j + eulerFrameDelta j b * Z a i -
   eulerFrameDelta i b * Z a j - eulerFrameDelta j a * Z b i) +
    frameScalarCurvature R / 2 * (eulerFrameDelta i a * eulerFrameDelta j b - eulerFrameDelta i b * eulerFrameDelta j a)

/-- Components of the vector whose insertion into positive volume
gives the normalized transgression 3-form. -/
def frameEulerCurrentCoefficient (D : Fin 4 → Fin 4 → Fin 4 → ℝ) (R : CurvatureFrameTensor) (i : Fin 4) : ℝ :=
  let α := fun a b j => D a j b - D b j a
  let T := frameEulerTransgression α R
  ![T 1 2 3, -T 0 2 3, T 0 1 3, -T 0 1 2] i

set_option maxHeartbeats 2000000 in
/-- The orientation-independent contraction equals the insertion coefficients
for a curvature array with the two skews and pair exchange. -/
theorem frameEulerCurrentCoefficient_eq_doubleDual (R : CurvatureFrameTensor) (D : Fin 4 → Fin 4 → Fin 4 → ℝ)
    (hFirst : ∀ a b c d, R b a c d = -R a b c d)
    (hLast : ∀ a b c d, R a b d c = -R a b c d)
    (hPair : ∀ a b c d, R a b c d = R c d a b)
    (i : Fin 4) :
    frameEulerCurrentCoefficient D R i = 2 * (∑ j : Fin 4, ∑ a : Fin 4, ∑ b : Fin 4, frameEulerDoubleDual R i j a b * D a j b) := by
  have firstDiagonal (a c d : Fin 4) : R a a c d = 0 := by
    linarith only [hFirst a a c d]
  have lastDiagonal (a b c : Fin 4) : R a b c c = 0 := by
    linarith only [hLast a b c c]
  have orderFirst (a b c d : Fin 4) (_h : b < a) : R a b c d = -R b a c d :=
    hFirst b a c d
  have orderLast (a b c d : Fin 4) (_h : d < c) : R a b c d = -R a b d c :=
    hLast a b d c
  have orderPairs (a b c d : Fin 4) (_h : 4 * c.val + d.val < 4 * a.val + b.val) :
      R a b c d = -(-R c d a b) := by rw [neg_neg, hPair]
  fin_cases i <;>
    norm_num [frameEulerCurrentCoefficient, frameEulerTransgression, frameEulerDoubleDual, frameRicciTensor,
      frameScalarCurvature, Fin.sum_univ_four, eulerFrameDelta] <;>
    simp (disch := decide) only [firstDiagonal, lastDiagonal, orderFirst, orderLast, orderPairs,
      neg_neg] <;>
    ring

/-- Finite product rule for the volume coefficient of the exterior derivative
of the normalized primitive. The first indices of `dD` and `dR` are spatial
covariant derivative directions. -/
def frameEulerPrimitiveVolumeJet (D : Fin 4 → Fin 4 → Fin 4 → ℝ)
    (R dD : CurvatureFrameTensor) (dR : Fin 4 → CurvatureFrameTensor) : ℝ :=
  let α := fun a b j => D a j b - D b j a
  let dα := fun a b i j => dD i a j b - dD i b j a
  let dF := fun a b i j k => dR i a b j k
  let dT := fun a b c d => exteriorWedge12Volume (α a b) (R c d) (dα a b) (dF c d)
  2 * (dT 0 1 2 3 + dT 2 3 0 1 - dT 0 2 1 3 - dT 1 3 0 2 + dT 0 3 1 2 + dT 1 2 0 3)

set_option maxHeartbeats 700000 in
private theorem frameEulerPrimitiveVolumeJet_eq_trace
    (D : Fin 4 → Fin 4 → Fin 4 → ℝ) (R dD : CurvatureFrameTensor)
    (dR : Fin 4 → CurvatureFrameTensor) :
    (∑ i : Fin 4, (frameEulerCurrentCoefficient (dD i) R i +
      frameEulerCurrentCoefficient D (dR i) i)) = frameEulerPrimitiveVolumeJet D R dD dR := by
  norm_num [frameEulerPrimitiveVolumeJet, frameEulerCurrentCoefficient, frameEulerTransgression,
    exteriorWedge12Volume, Fin.sum_univ_four]
  ring

section Current

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [BoundarylessManifold I M] [T2Space M]

local instance : CompleteSpace E := FiniteDimensional.complete ℝ E
local instance : IsManifold I 1 M := IsManifold.of_le (by decide : (1 : WithTop ℕ∞) ≤ ∞)

private def eulerPerm4 (p q : Fin 4 → Fin 4)
    (h₁ : Function.LeftInverse q p) (h₂ : Function.RightInverse q p) : Fin 4 ≃ Fin 4 :=
  ⟨p, q, h₁, h₂⟩

private def eulerKulkarniField (A B : Tensor0SField (I := I) (M := M) ∞ 2) :
    Tensor0SField (I := I) (M := M) ∞ 4 :=
  let P := tensor0SFieldProduct ∞ A B
  Tensor0SField.domDomCongr ∞ (eulerPerm4 ![0, 2, 1, 3] ![0, 2, 1, 3] (by decide) (by decide)) P +
  Tensor0SField.domDomCongr ∞ (eulerPerm4 ![1, 3, 0, 2] ![2, 0, 3, 1] (by decide) (by decide)) P -
  Tensor0SField.domDomCongr ∞ (eulerPerm4 ![0, 3, 1, 2] ![0, 2, 3, 1] (by decide) (by decide)) P -
  Tensor0SField.domDomCongr ∞ (eulerPerm4 ![1, 2, 0, 3] ![2, 0, 1, 3] (by decide) (by decide)) P

omit [BoundarylessManifold I M] [T2Space M] in
private theorem eulerKulkarniField_apply (A B : Tensor0SField (I := I) (M := M) ∞ 2)
    (x : M) (u v w z : TangentSpace I x) :
    eulerKulkarniField A B x (vec4 u v w z) =
      A x (vec2 u w) * B x (vec2 v z) + A x (vec2 v z) * B x (vec2 u w) -
      A x (vec2 u z) * B x (vec2 v w) - A x (vec2 v w) * B x (vec2 u z) := by
  simp only [eulerKulkarniField, ContMDiffSection.coe_add, ContMDiffSection.coe_sub,
    Pi.add_apply, Pi.sub_apply, Tensor0SSpace.sub_apply, Tensor0SSpace.add_apply,
    Tensor0SField.domDomCongr_apply, Tensor0SSpace.domDomCongr_apply]
  rw [tensor0SField_product_apply A B x, tensor0SField_product_apply A B x,
    tensor0SField_product_apply A B x, tensor0SField_product_apply A B x]
  have hFirst (p : Fin 4 ≃ Fin 4) : (fun k => vec4 u v w z (p k)) ∘ Fin.castAdd 2 =
      vec2 (vec4 u v w z (p 0)) (vec4 u v w z (p 1)) := by
    funext k; fin_cases k <;> rfl
  have hLast (p : Fin 4 ≃ Fin 4) : (fun k => vec4 u v w z (p k)) ∘ Fin.natAdd 2 =
      vec2 (vec4 u v w z (p 2)) (vec4 u v w z (p 3)) := by
    funext k; fin_cases k <;> rfl
  simp only [hFirst, hLast]
  rfl

/-- The double-dual curvature tensor in dimension four, in the curvature
operator slot convention. The formula itself defines a smooth tensor on
any slice, independently of the frame and orientation. -/
def eulerDoubleDualField (g : SmoothRiemannianMetric I M) : Tensor0SField (I := I) (M := M) ∞ 4 :=
  let A := metricTensorField g
  let Ric := metricRicci g
  Tensor0SField.domDomCongr ∞ (Equiv.swap (2 : Fin 4) 3) (metricRm04 g) -
    eulerKulkarniField A Ric +
    (1 / 4 : ℝ) • metricTraceFirstTwoField (s := 4) g (tensor0SFieldProduct (s := 2) (q := 4) ∞ Ric (eulerKulkarniField A A))

private def eulerCurrentPerm : Fin 7 ≃ Fin 7 :=
  ⟨![6, 4, 2, 0, 3, 5, 1], ![3, 6, 2, 4, 1, 5, 0], by decide, by decide⟩

/-- The covariant Euler current. Three metric traces contract the last three
slots of the double-dual curvature against the derivative, first Ricci and
second Ricci arguments in the specified order. -/
def eulerCurrentOneForm (g : SmoothRiemannianMetric I M) : Tensor0SField (I := I) (M := M) ∞ 1 :=
  (2 : ℝ) • metricTraceFirstTwoField g (metricTraceFirstTwoField g (metricTraceFirstTwoField g
    (Tensor0SField.domDomCongr ∞ eulerCurrentPerm
      (tensor0SFieldProduct ∞ (eulerDoubleDualField g) (metricNablaRic g)))))

/-- The global smooth Euler current obtained by raising the intrinsic
covector on one smooth Riemannian slice. -/
def globalEulerCurrent (g : SmoothRiemannianMetric I M) :
    Cₛ^∞⟮I; E, (TangentSpace I : M → Type _)⟯ :=
  ⟨fun x => cotangentSharp (I := I) g x (eulerCurrentOneForm g x),
    cotangentSharp_gen_contMDiff_total g
      (fun α j => cotangentSection_chartComponent_contMDiffOn (I := I)
        (eulerCurrentOneForm g) α j)⟩

/-- Use the same construction on the actual metric of a supplied flow. -/
def ricciFlowEulerCurrent {D : RealTimeInterval} (S : SolutionOn (I := I) (M := M) D)
    (t : ℝ) : Cₛ^∞⟮I; E, (TangentSpace I : M → Type _)⟯ :=
  globalEulerCurrent (S.family.metric t)

omit [BoundarylessManifold I M] [T2Space M] in
private theorem eulerTrace_apply_orthonormal {s : ℕ} (g : SmoothRiemannianMetric I M)
    (A : Tensor0SField (I := I) (M := M) ∞ (s + 2)) (x : M)
    (o : ManifoldOrientation I M 4) (f : OrientedOrthonormalFrameAt g o x)
    (w : Fin s → TangentSpace I x) :
    metricTraceFirstTwoField g A x w =
      ∑ i : Fin 4, A x (metricTraceInput (I := I) (f.basis i) (f.basis i) w) := by
  rw [metricTraceFirstTwoField_apply, metricTraceFirstTwo0STensor_apply,
    metricTraceFirstTwo0SAt_eq_sum_basis g f.basis _
      (metricInverseInBasis_identity_of_orthonormal g f.basis f.orthonormal)]
  simp [metricTrace0S2InBasis, identityInvMetric, diagonalInvMetric, ite_mul]

omit [BoundarylessManifold I M] in
/-- In an actual orthonormal frame the invariant smooth current has the
contracted double-dual and Ricci derivative components. -/
theorem globalEulerCurrent_inner_orthonormal (g : SmoothRiemannianMetric I M)
    (x : M) (o : ManifoldOrientation I M 4) (f : OrientedOrthonormalFrameAt g o x)
    (u : TangentSpace I x) :
    g.inner x (globalEulerCurrent g x) u =
      2 * (∑ j : Fin 4, ∑ a : Fin 4, ∑ b : Fin 4,
        eulerDoubleDualField g x (vec4 u (f.basis j) (f.basis a) (f.basis b)) *
          metricNablaRic g x (vec3 (f.basis a) (f.basis j) (f.basis b))) := by
  change g.inner x (cotangentSharp g x (eulerCurrentOneForm g x)) u = _
  rw [cotangentSharp_inner, cotangentToDual_apply]
  simp only [eulerCurrentOneForm, ContMDiffSection.coe_smul, Pi.smul_apply,
    Tensor0SSpace.smul_apply, smul_eq_mul]
  congr 1
  rw [eulerTrace_apply_orthonormal g _ x o f]
  refine Finset.sum_congr rfl fun j _ => ?_
  rw [eulerTrace_apply_orthonormal g _ x o f]
  refine Finset.sum_congr rfl fun a _ => ?_
  rw [eulerTrace_apply_orthonormal g _ x o f]
  refine Finset.sum_congr rfl fun b _ => ?_
  rw [Tensor0SField.domDomCongr_apply, Tensor0SSpace.domDomCongr_apply,
    tensor0SField_product_apply]
  congr 1 <;> congr 1 <;> (funext k; fin_cases k <;> rfl)

private theorem eulerScalarWeighted_apply (g : SmoothRiemannianMetric I M)
    (A : Tensor0SField (I := I) (M := M) ∞ 4) (x : M)
    (o : ManifoldOrientation I M 4) (f : OrientedOrthonormalFrameAt g o x)
    (w : Fin 4 → TangentSpace I x) :
    metricTraceFirstTwoField (s := 4) g (tensor0SFieldProduct (s := 2) (q := 4) ∞ (metricRicci g) A) x w =
      metricScalarAt g x * A x w := by
  rw [eulerTrace_apply_orthonormal g _ x o f, ← frameScalarCurvature_metric g o x f]
  unfold frameScalarCurvature
  rw [Finset.sum_mul]
  refine Finset.sum_congr rfl fun i _ => ?_
  rw [tensor0SField_product_apply, frameRicciTensor_metric, ← metricRicciAt_apply_eq_ricciTensor]
  have hFirst : metricTraceInput (I := I) (f.basis i) (f.basis i) w ∘ Fin.castAdd 4 =
      vec2 (f.basis i) (f.basis i) := by funext k; fin_cases k <;> rfl
  have hLast : metricTraceInput (I := I) (f.basis i) (f.basis i) w ∘ Fin.natAdd 2 = w := by
    funext k; fin_cases k <;> rfl
  rw [hFirst, hLast]
  rfl

/-- The component form of the same double-dual tensor is valid in every
oriented orthonormal slice frame. -/
theorem eulerDoubleDualField_apply_frame (g : SmoothRiemannianMetric I M)
    (x : M) (o : ManifoldOrientation I M 4) (f : OrientedOrthonormalFrameAt g o x)
    (i j a b : Fin 4) :
    let R := metricCurvatureFrameTensor g o x f
    eulerDoubleDualField g x (vec4 (f.basis i) (f.basis j) (f.basis a) (f.basis b)) =
      frameEulerDoubleDual R i j a b := by
  intro R
  let G := fun p q : Fin 4 => if p = q then (1 : ℝ) else 0
  let Ric := frameRicciTensor R
  have hreindex : (fun k => vec4 (f.basis i) (f.basis j) (f.basis a) (f.basis b)
      ((Equiv.swap (2 : Fin 4) 3) k)) = vec4 (f.basis i) (f.basis j) (f.basis b) (f.basis a) := by
    funext k
    fin_cases k <;> rfl
  have hcurv : metricRm04 g x (vec4 (f.basis i) (f.basis j) (f.basis b) (f.basis a)) = R i j a b := by
    simp only [R, metricCurvatureFrameTensor, metricRm04StandardAt_apply, metricRm04_apply]
  have hRic (p q : Fin 4) : metricRicci g x (vec2 (f.basis p) (f.basis q)) = Ric q p := by
    rw [show Ric q p = _ from frameRicciTensor_metric g o x f q p,
      ← metricRicciAt_apply_eq_ricciTensor]
    rfl
  simp only [eulerDoubleDualField, ContMDiffSection.coe_add, ContMDiffSection.coe_sub,
    ContMDiffSection.coe_smul, Pi.add_apply, Pi.sub_apply, Pi.smul_apply,
    Tensor0SSpace.add_apply, Tensor0SSpace.sub_apply, Tensor0SSpace.smul_apply, smul_eq_mul,
    Tensor0SField.domDomCongr_apply, Tensor0SSpace.domDomCongr_apply, hreindex, hcurv]
  rw [eulerScalarWeighted_apply g _ x o f, ← frameScalarCurvature_metric g o x f]
  have hG (p q : Fin 4) : metricTensorField g x (vec2 (f.basis p) (f.basis q)) = G p q := by
    rw [metricTensorField_apply]
    exact f.orthonormal p q
  simp only [eulerKulkarniField_apply, hG, hRic, frameEulerDoubleDual]
  change R i j a b - (G i a * Ric b j + G j b * Ric a i - G i b * Ric a j - G j a * Ric b i) +
      (1 / 4) * (frameScalarCurvature R * (G i a * G j b + G j b * G i a - G i b * G j a - G j a * G i b)) = _
  dsimp only [G, Ric, eulerFrameDelta]
  ring

set_option maxHeartbeats 900000 in
/-- The contraction defining the global current agrees in every oriented
orthonormal frame with the signed coefficients of the same spatial primitive. -/
theorem globalEulerCurrent_eq_frameTransgression (g : SmoothRiemannianMetric I M)
    (x : M) (o : ManifoldOrientation I M 4) (f : OrientedOrthonormalFrameAt g o x)
    (i : Fin 4) :
    let R := metricCurvatureFrameTensor g o x f
    let D := fun a j b => metricNablaRic g x (vec3 (f.basis a) (f.basis j) (f.basis b))
    g.inner x (globalEulerCurrent g x) (f.basis i) = frameEulerCurrentCoefficient D R i := by
  intro R D
  have hContract := globalEulerCurrent_inner_orthonormal g x o f (f.basis i)
  have hFrame := frameEulerCurrentCoefficient_eq_doubleDual R D
    (metricCurvatureFrameTensor_swap_first g o x f)
    (metricCurvatureFrameTensor_swap_last g o x f) (metricCurvatureFrameTensor_pair_symm g o x f) i
  refine hContract.trans ((congrArg (fun z : ℝ => 2 * z) ?_).trans hFrame.symm)
  refine Finset.sum_congr rfl fun j _ => Finset.sum_congr rfl fun a _ => Finset.sum_congr rfl fun b _ => ?_
  exact congrArg (fun y : ℝ => y * D a j b) (eulerDoubleDualField_apply_frame g x o f i j a b)

/-- Explicit pointwise norm bound for the actual global current, in the
ordered curvature and Ricci derivative norms used for the spatial estimate. -/
theorem globalEulerCurrent_norm_le (g : SmoothRiemannianMetric I M)
    (x : M) (o : ManifoldOrientation I M 4) (f : OrientedOrthonormalFrameAt g o x) :
    let R := metricCurvatureFrameTensor g o x f
    let D := fun a j b => metricNablaRic g x (vec3 (f.basis a) (f.basis j) (f.basis b))
    let X := globalEulerCurrent g x
    Real.sqrt (g.inner x X X) ≤ 144 * (Real.sqrt (frameTensorNormSq R) *
      Real.sqrt (∑ a : Fin 4, ∑ j : Fin 4, ∑ b : Fin 4, D a j b ^ 2)) := by
  intro R D X
  have hrepr (i : Fin 4) : f.basis.repr X i = g.inner x X (f.basis i) := by
    rw [basis_repr_eq_sum_inv_inner g x f.basis _
      (metricInverseInBasis_identity_of_orthonormal g f.basis f.orthonormal)]
    simp [identityInvMetric, diagonalInvMetric, ite_mul]
  have hsq : g.inner x X X = ∑ i : Fin 4, (g.inner x X (f.basis i)) ^ 2 := by
    calc
      _ = g.inner x X (∑ i : Fin 4, f.basis.repr X i • f.basis i) := by rw [f.basis.sum_repr]
      _ = _ := by
        simp only [map_sum, map_smul, hrepr, smul_eq_mul, pow_two]
  rw [hsq]
  simp_rw [show ∀ i, g.inner x X (f.basis i) = frameEulerCurrentCoefficient D R i from
    globalEulerCurrent_eq_frameTransgression g x o f]
  have h := frameEulerTransgression_norm_of_ricciDerivative D R
  convert h using 1
  norm_num [Fin.sum_univ_four, frameEulerCurrentCoefficient]
  congr 1
  ring

omit [BoundarylessManifold I M] in
private theorem globalEulerCurrent_pairing (g : SmoothRiemannianMetric I M)
    (x : M) (u : TangentSpace I x) :
    g.inner x (globalEulerCurrent g x) u = eulerCurrentOneForm g x (fun _ : Fin 1 => u) := by
  change g.inner x (cotangentSharp g x (eulerCurrentOneForm g x)) u = _
  rw [cotangentSharp_inner, cotangentToDual_apply]

omit [BoundarylessManifold I M] in
private theorem nablaEulerOneForm_eq_lowered_current (g : SmoothRiemannianMetric I M)
    (x : M) (v w : TangentSpace I x) :
    totalNabla0SFun 1 (metricCov g) (eulerCurrentOneForm g) x (vec2 v w) =
      g.inner x ((LeviCivita g) (globalEulerCurrent g) x v) w := by
  let Z := globalEulerCurrent g
  let α := eulerCurrentOneForm g
  obtain ⟨X, hX⟩ := ContMDiffSection.exists_eq_at (I := I) (F := E) (V := TangentSpace I)
    (n := (⊤ : ℕ∞)) x v
  obtain ⟨Y, hY⟩ := ContMDiffSection.exists_eq_at (I := I) (F := E) (V := TangentSpace I)
    (n := (⊤ : ℕ∞)) x w
  rw [← hX, ← hY]
  have hslots : vec2 (X x) (Y x) = Fin.cons (X x) (fun _ : Fin 1 => Y x) := by
    funext i; fin_cases i <;> rfl
  rw [hslots, totalNabla0SFun_apply_section]
  rw [show (fun _ : Fin 1 => Y x) = (fun k : Fin 1 => (fun _ : Fin 1 => Y) k x) from rfl,
    nabla0SFun_eval_smooth_slots]
  have hpair (y : M) (s : TangentSpace I y) : α y (fun _ : Fin 1 => s) = g.inner y (Z y) s :=
    (globalEulerCurrent_pairing g y s).symm
  simp only [Fin.sum_univ_one]
  rw [show Function.update (fun _ : Fin 1 => Y x) 0 ((metricCov g) Y x (X x)) =
      (fun _ => (metricCov g) Y x (X x)) by funext j; fin_cases j; simp,
    hpair]
  have hfun : (fun y : M => α y (fun _ : Fin 1 => Y y)) = fun y => g.inner y (Z y) (Y y) :=
    funext fun y => hpair y (Y y)
  rw [hfun]
  have hprod := IsMetricCompatible.mvfderiv_inner
    (leviCivitaConnectionOfMetric_isMetricCompatible g) (X x)
    (Z.contMDiff.mdifferentiable (by decide) x) (Y.contMDiff.mdifferentiable (by decide) x)
  change mvfderiv (I := I) (fun y : M => g.inner y (Z y) (Y y)) x (X x) =
    g.inner x ((LeviCivita g) Z x (X x)) (Y x) + g.inner x (Z x) ((metricCov g) Y x (X x)) at hprod
  rw [hprod, add_sub_cancel_right]

omit [BoundarylessManifold I M] in
/-- The genuine slice divergence is the metric trace of the covariant
derivative of the globally constructed one-form. -/
theorem globalEulerCurrent_divergence_trace [I.Boundaryless]
    (g : SmoothRiemannianMetric I M) (x : M)
    (o : ManifoldOrientation I M 4) (f : OrientedOrthonormalFrameAt g o x) :
    divergenceG g (globalEulerCurrent g) x =
      ∑ i : Fin 4, totalNabla0SFun 1 (metricCov g) (eulerCurrentOneForm g) x
        (vec2 (f.basis i) (f.basis i)) := by
  rw [← metricTracePair0SAt_nablaCov_eq_divergence g (globalEulerCurrent g) x,
    metricTracePair0SAt_eq_sum_basis g f.basis (identityInvMetric (Idx := Fin 4))
      (metricInverseInBasis_identity_of_orthonormal g f.basis f.orthonormal)]
  simp only [identityInvMetric, diagonalInvMetric, ite_mul, one_mul, zero_mul,
    Finset.sum_ite_eq, Finset.mem_univ, ite_true]
  refine Finset.sum_congr rfl fun i _ => ?_
  rw [nablaEulerOneForm_eq_lowered_current, nablaCovTensor_apply]
  rfl

omit [BoundarylessManifold I M] in
private theorem eulerTrace_nabla_orthonormal {s : ℕ}
    (g : SmoothRiemannianMetric I M) (A : Tensor0SField (I := I) (M := M) ∞ (s + 2))
    (x : M) (o : ManifoldOrientation I M 4) (f : OrientedOrthonormalFrameAt g o x)
    (v : TangentSpace I x) (tail : Fin s → TangentSpace I x) :
    totalNabla0SFun s (metricCov g) (metricTraceFirstTwoField g A) x (Fin.cons v tail) =
      ∑ i : Fin 4, totalNabla0SFun (s + 2) (metricCov g) A x
        (Fin.cons v (metricTraceInput (I := I) (f.basis i) (f.basis i) tail)) := by
  rw [nabla_metricTraceFirstTwo0S (metricCov g) g
    (leviCivitaConnectionOfMetric_isMetricCompatible g) A f.basis
    (identityInvMetric (Idx := Fin 4))
    (metricInverseInBasis_identity_of_orthonormal g f.basis f.orthonormal)]
  simp [identityInvMetric, diagonalInvMetric, ite_mul]

omit [BoundarylessManifold I M] in
private theorem eulerNablaProduct {s q : ℕ}
    (g : SmoothRiemannianMetric I M) (A : Tensor0SField (I := I) (M := M) ∞ s)
    (B : Tensor0SField (I := I) (M := M) ∞ q) (x : M)
    (v : TangentSpace I x) (tail : Fin (s + q) → TangentSpace I x) :
    totalNabla0SFun (s + q) (metricCov g) (tensor0SFieldProduct ∞ A B) x (Fin.cons v tail) =
      totalNabla0SFun s (metricCov g) A x (Fin.cons v (tail ∘ Fin.castAdd q)) *
        B x (tail ∘ Fin.natAdd s) +
      A x (tail ∘ Fin.castAdd q) *
        totalNabla0SFun q (metricCov g) B x (Fin.cons v (tail ∘ Fin.natAdd s)) := by
  let cov := metricCov g
  let hA := totalNabla0S_regularity s cov (metricCov_smooth g) A
  let hB := totalNabla0S_regularity q cov (metricCov_smooth g) B
  obtain ⟨X, hX⟩ := ContMDiffSection.exists_eq_at (I := I) (F := E) (V := TangentSpace I)
    (n := (⊤ : ℕ∞)) x v
  choose U hU using fun i : Fin (s + q) =>
    ContMDiffSection.exists_eq_at (I := I) (F := E) (V := TangentSpace I)
      (n := (⊤ : ℕ∞)) x (tail i)
  have htail : tail = fun i => U i x := funext fun i => (hU i).symm
  rw [← hX, htail, totalNabla0SFun_apply_section]
  exact nabla0SFun_product_eval cov A B _ _ (totalNabla0S_realizes s cov A hA)
    (totalNabla0S_realizes q cov B hB) X U x

omit [BoundarylessManifold I M] in
private theorem eulerNablaMetric_zero (g : SmoothRiemannianMetric I M) (x : M)
    (v : TangentSpace I x) (tail : Fin 2 → TangentSpace I x) :
    totalNabla0SFun 2 (metricCov g) (metricTensorField g) x (Fin.cons v tail) = 0 := by
  obtain ⟨X, hX⟩ := ContMDiffSection.exists_eq_at (I := I) (F := E) (V := TangentSpace I)
    (n := (⊤ : ℕ∞)) x v
  rw [← hX, totalNabla0SFun_apply_section,
    nabla_metric_zero (metricCov g) g (leviCivitaConnectionOfMetric_isMetricCompatible g) X x,
    Tensor0SSpace.zero_apply]

omit [BoundarylessManifold I M] in
private theorem eulerNablaPerm {s : ℕ}
    (g : SmoothRiemannianMetric I M) (A : Tensor0SField (I := I) (M := M) ∞ s)
    (p : Fin s ≃ Fin s) (x : M) (v : TangentSpace I x) (tail : Fin s → TangentSpace I x) :
    totalNabla0SFun s (metricCov g) (Tensor0SField.domDomCongr ∞ p A) x (Fin.cons v tail) =
      totalNabla0SFun s (metricCov g) A x (Fin.cons v (tail ∘ p)) := by
  rw [totalNabla0SFun_domDomCongr, Tensor0SSpace.domDomCongr_apply]
  congr 1
  funext j
  cases j using Fin.cases <;> simp [Tensor0SBundle.frontExtendEquiv_zero,
    Tensor0SBundle.frontExtendEquiv_succ]

omit [BoundarylessManifold I M] [T2Space M] in
private theorem eulerNegField {s : ℕ} (A : Tensor0SField (I := I) (M := M) ∞ s) :
    -A = (-1 : ℝ) • A := (neg_one_smul ℝ A).symm

omit [BoundarylessManifold I M] in
private theorem eulerNablaKulkarni (g : SmoothRiemannianMetric I M)
    (B : Tensor0SField (I := I) (M := M) ∞ 2)
    (x : M) (v u y a b : TangentSpace I x) :
    let N := fun p q => totalNabla0SFun 2 (metricCov g) B x (Fin.cons v (vec2 p q))
    totalNabla0SFun 4 (metricCov g) (eulerKulkarniField (metricTensorField g) B) x
      (Fin.cons v (vec4 u y a b)) =
      g.inner x u a * N y b + g.inner x y b * N u a -
        g.inner x u b * N y a - g.inner x y a * N u b := by
  intro N
  let A := metricTensorField g
  have hComp (p : Fin 4 ≃ Fin 4) :
      totalNabla0SFun 4 (metricCov g)
        (Tensor0SField.domDomCongr ∞ p (tensor0SFieldProduct ∞ A B)) x
        (Fin.cons v (vec4 u y a b)) =
      A x (vec2 ((vec4 u y a b) (p 0)) ((vec4 u y a b) (p 1))) *
        N ((vec4 u y a b) (p 2)) ((vec4 u y a b) (p 3)) := by
    have h0 : (vec4 u y a b ∘ p) ∘ Fin.castAdd 2 =
        vec2 ((vec4 u y a b) (p 0)) ((vec4 u y a b) (p 1)) := by
      funext k; fin_cases k <;> rfl
    have h1 : (vec4 u y a b ∘ p) ∘ Fin.natAdd 2 =
        vec2 ((vec4 u y a b) (p 2)) ((vec4 u y a b) (p 3)) := by
      funext k; fin_cases k <;> rfl
    rw [eulerNablaPerm, eulerNablaProduct g A B x v _, h0, h1, eulerNablaMetric_zero, zero_mul, zero_add]
  simp only [eulerKulkarniField, sub_eq_add_neg, eulerNegField, totalNabla0SFun_smul,
    totalNabla0SFun_add, Tensor0SSpace.add_apply, Tensor0SSpace.smul_apply, smul_eq_mul]
  rw [hComp, hComp, hComp, hComp]
  change g.inner x u a * N y b + g.inner x y b * N u a +
    -1 * (g.inner x u b * N y a) + -1 * (g.inner x y a * N u b) = _
  ring

omit [BoundarylessManifold I M] in
private theorem eulerNablaScalarWeighted (g : SmoothRiemannianMetric I M)
    (x : M) (o : ManifoldOrientation I M 4) (f : OrientedOrthonormalFrameAt g o x)
    (v u y a b : TangentSpace I x) :
    let G := metricTensorField g
    let W := eulerKulkarniField G G
    let P := tensor0SFieldProduct (s := 2) (q := 4) ∞ (metricRicci g) W
    totalNabla0SFun 4 (metricCov g) (metricTraceFirstTwoField (s := 4) g P) x
      (Fin.cons v (vec4 u y a b)) =
      (∑ i : Fin 4, metricNablaRic g x (vec3 v (f.basis i) (f.basis i))) *
        W x (vec4 u y a b) := by
  intro G W P
  rw [eulerTrace_nabla_orthonormal g _ x o f]
  rw [Finset.sum_mul]
  refine Finset.sum_congr rfl fun i _ => ?_
  have hLeft : metricTraceInput (I := I) (f.basis i) (f.basis i) (vec4 u y a b) ∘ Fin.castAdd 4 =
      vec2 (f.basis i) (f.basis i) := by funext j; fin_cases j <;> rfl
  have hRight : metricTraceInput (I := I) (f.basis i) (f.basis i) (vec4 u y a b) ∘ Fin.natAdd 2 =
      vec4 u y a b := by funext j; fin_cases j <;> rfl
  rw [show P = tensor0SFieldProduct (s := 2) (q := 4) ∞ (metricRicci g) W from rfl,
    eulerNablaProduct g (metricRicci g) W x v _, hLeft, hRight]
  rw [show W = eulerKulkarniField (metricTensorField g) (metricTensorField g) from rfl, eulerNablaKulkarni]
  simp only [eulerNablaMetric_zero, mul_zero, add_zero, sub_zero]
  have hs : Fin.cons v (vec2 (f.basis i) (f.basis i)) = vec3 v (f.basis i) (f.basis i) := by
    funext k; fin_cases k <;> rfl
  rw [hs]
  rfl

omit [BoundarylessManifold I M] in
private theorem eulerNablaRic_eq_frameTrace (g : SmoothRiemannianMetric I M)
    (x : M) (o : ManifoldOrientation I M 4) (f : OrientedOrthonormalFrameAt g o x)
    (r p q : Fin 4) :
    let A := fun i j a b => metricFrameEulerCovariantDerivative g o x f a b r i j
    metricNablaRic g x (vec3 (f.basis r) (f.basis p) (f.basis q)) = frameRicciTensor A q p := by
  intro A
  have h := (levi_civita_bianchi_trace_identities g f.basis (identityInvMetric (Idx := Fin 4))
    (metricInverseInBasis_identity_of_orthonormal g f.basis f.orthonormal)).2.2
    (f.basis r) (f.basis p) (f.basis q)
  simpa only [metricNablaRic, totalNabla0S_apply, metricFrameEulerCovariantDerivative, A,
    metricCov, metricRicci, metricRm04,
    frameRicciTensor, identityInvMetric, diagonalInvMetric, ite_mul, one_mul, zero_mul,
    Finset.sum_ite_eq, Finset.mem_univ, ite_true] using h

omit [BoundarylessManifold I M] in
/-- The spatial covariant derivative of the intrinsic double dual is the
same linear double-dual polynomial of the covariant curvature derivative. -/
theorem eulerDoubleDualField_nabla_apply_frame (g : SmoothRiemannianMetric I M)
    (x : M) (o : ManifoldOrientation I M 4) (f : OrientedOrthonormalFrameAt g o x)
    (r i j a b : Fin 4) :
    let A := fun i' j' a' b' => metricFrameEulerCovariantDerivative g o x f a' b' r i' j'
    totalNabla0SFun 4 (metricCov g) (eulerDoubleDualField g) x
      (Fin.cons (f.basis r) (vec4 (f.basis i) (f.basis j) (f.basis a) (f.basis b))) =
      frameEulerDoubleDual A i j a b := by
  intro A
  have hTr := eulerNablaRic_eq_frameTrace g x o f r
  have hTr' (p q : Fin 4) :
      totalNabla0SFun 2 (metricCov g) (metricRicci g) x
        (Fin.cons (f.basis r) (vec2 (f.basis p) (f.basis q))) = frameRicciTensor A q p := by
    have hs : Fin.cons (f.basis r) (vec2 (f.basis p) (f.basis q)) =
        vec3 (f.basis r) (f.basis p) (f.basis q) := by funext k; fin_cases k <;> rfl
    rw [hs]
    exact hTr p q
  have hCurv : totalNabla0SFun 4 (metricCov g) (metricRm04 g) x
      (Fin.cons (f.basis r) (vec4 (f.basis i) (f.basis j) (f.basis a) (f.basis b) ∘ Equiv.swap 2 3)) =
      A i j a b := by
    have h : vec4 (f.basis i) (f.basis j) (f.basis a) (f.basis b) ∘ Equiv.swap 2 3 =
      vec4 (f.basis i) (f.basis j) (f.basis b) (f.basis a) := by
      funext k; fin_cases k <;> rfl
    have hv : Fin.cons (f.basis r) (vec4 (f.basis i) (f.basis j) (f.basis b) (f.basis a)) =
        vec5 (f.basis r) (f.basis i) (f.basis j) (f.basis b) (f.basis a) := by
      funext k; fin_cases k <;> rfl
    rw [h, hv]
    rfl
  simp only [eulerDoubleDualField, sub_eq_add_neg, eulerNegField, totalNabla0SFun_add,
    totalNabla0SFun_smul, Tensor0SSpace.add_apply, Tensor0SSpace.smul_apply, smul_eq_mul,
    eulerNablaPerm, hCurv, frameScalarCurvature, frameEulerDoubleDual, eulerFrameDelta]
  rw [eulerNablaKulkarni, eulerNablaScalarWeighted g x o f]
  simp only [eulerKulkarniField_apply, hTr', hTr, f.orthonormal]
  have hg (p q : Fin 4) : metricTensorField g x (vec2 (f.basis p) (f.basis q)) =
      if p = q then 1 else 0 := by rw [metricTensorField_apply]; exact f.orthonormal p q
  simp only [hg]
  ring

omit [BoundarylessManifold I M] in
private theorem eulerNablaCurrentOneFormFrame
    (g : SmoothRiemannianMetric I M) (x : M)
    (o : ManifoldOrientation I M 4) (f : OrientedOrthonormalFrameAt g o x) (r i : Fin 4) :
    let P := eulerDoubleDualField g
    let D := metricNablaRic g
    let u := f.basis i
    let v := f.basis r
    totalNabla0SFun 1 (metricCov g) (eulerCurrentOneForm g) x (vec2 v u) =
      2 * (∑ j : Fin 4, ∑ a : Fin 4, ∑ b : Fin 4,
        (totalNabla0SFun 4 (metricCov g) P x (Fin.cons v (vec4 u (f.basis j) (f.basis a) (f.basis b))) *
          D x (vec3 (f.basis a) (f.basis j) (f.basis b)) +
        P x (vec4 u (f.basis j) (f.basis a) (f.basis b)) *
          metricNabla2Ric g x (vec4 v (f.basis a) (f.basis j) (f.basis b)))) := by
  intro P D u v
  have h2 : vec2 v u = Fin.cons v (fun _ : Fin 1 => u) := by
    funext k; fin_cases k <;> rfl
  rw [h2, eulerCurrentOneForm, totalNabla0SFun_smul, Tensor0SSpace.smul_apply, smul_eq_mul]
  congr 1
  rw [eulerTrace_nabla_orthonormal g _ x o f]
  refine Finset.sum_congr rfl fun j _ => ?_
  rw [eulerTrace_nabla_orthonormal g _ x o f]
  refine Finset.sum_congr rfl fun a _ => ?_
  rw [eulerTrace_nabla_orthonormal g _ x o f]
  refine Finset.sum_congr rfl fun b _ => ?_
  rw [eulerNablaPerm, eulerNablaProduct g P D x v _]
  have hslots : ((metricTraceInput (I := I) (f.basis b) (f.basis b)
      (metricTraceInput (I := I) (f.basis a) (f.basis a)
        (metricTraceInput (I := I) (f.basis j) (f.basis j) (fun _ : Fin 1 => u)))) ∘
        eulerCurrentPerm) = ![u, f.basis j, f.basis a, f.basis b, f.basis a, f.basis j, f.basis b] := by
    funext k; fin_cases k <;> rfl
  rw [hslots]
  have hfirst : (![u, f.basis j, f.basis a, f.basis b, f.basis a, f.basis j, f.basis b] :
      Fin 7 → TangentSpace I x) ∘ Fin.castAdd 3 = vec4 u (f.basis j) (f.basis a) (f.basis b) := by
    funext k; fin_cases k <;> rfl
  have hlast : (![u, f.basis j, f.basis a, f.basis b, f.basis a, f.basis j, f.basis b] :
      Fin 7 → TangentSpace I x) ∘ Fin.natAdd 4 = vec3 (f.basis a) (f.basis j) (f.basis b) := by
    funext k; fin_cases k <;> rfl
  have hs : Fin.cons v (vec3 (f.basis a) (f.basis j) (f.basis b)) =
      vec4 v (f.basis a) (f.basis j) (f.basis b) := by
    funext k; fin_cases k <;> rfl
  rw [hfirst, hlast, hs]
  rfl

omit [BoundarylessManifold I M] in
private theorem frameEulerCovariantDerivative_skews
    (g : SmoothRiemannianMetric I M) (x : M) (o : ManifoldOrientation I M 4)
    (f : OrientedOrthonormalFrameAt g o x) (r : Fin 4) :
    let A := fun i j a b => metricFrameEulerCovariantDerivative g o x f a b r i j
    (∀ i j a b, A j i a b = -A i j a b) ∧
      (∀ i j a b, A i j b a = -A i j a b) ∧
      (∀ i j a b, A i j a b = A a b i j) := by
  intro A
  have h := levi_civita_covariant_riemann_symmetries g (x := x)
  refine ⟨?_, ?_, ?_⟩
  · intro i j a b
    exact h.2.1 (f.basis r) (f.basis i) (f.basis j) (f.basis b) (f.basis a)
  · intro i j a b
    exact h.1 (f.basis r) (f.basis i) (f.basis j) (f.basis a) (f.basis b)
  · intro i j a b
    have h1 := h.2.2 (f.basis r) (f.basis i) (f.basis j) (f.basis b) (f.basis a)
    have h2 := h.2.1 (f.basis r) (f.basis a) (f.basis b) (f.basis j) (f.basis i)
    have h3 := h.1 (f.basis r) (f.basis b) (f.basis a) (f.basis j) (f.basis i)
    dsimp only [A, metricFrameEulerCovariantDerivative, metricCov, metricRm04]
    linarith only [h1, h2, h3]

set_option maxHeartbeats 900000 in
/-- The global current has actual slice divergence equal to the spatial
coefficient of the exterior derivative of the normalized primitive. -/
theorem globalEulerCurrent_divergence_eq_primitiveJet [I.Boundaryless]
    (g : SmoothRiemannianMetric I M) (x : M)
    (o : ManifoldOrientation I M 4) (f : OrientedOrthonormalFrameAt g o x) :
    let R := metricCurvatureFrameTensor g o x f
    let D := fun a j b => metricNablaRic g x (vec3 (f.basis a) (f.basis j) (f.basis b))
    let dD := fun r a j b => metricNabla2Ric g x (vec4 (f.basis r) (f.basis a) (f.basis j) (f.basis b))
    let dR := fun r i j a b => metricFrameEulerCovariantDerivative g o x f a b r i j
    divergenceG g (globalEulerCurrent g) x = frameEulerPrimitiveVolumeJet D R dD dR := by
  intro R D dD dR
  rw [globalEulerCurrent_divergence_trace g x o f, ← frameEulerPrimitiveVolumeJet_eq_trace]
  refine Finset.sum_congr rfl fun i _ => ?_
  obtain ⟨hFirst, hLast, hPair⟩ := frameEulerCovariantDerivative_skews g x o f i
  rw [eulerNablaCurrentOneFormFrame g x o f i i,
    frameEulerCurrentCoefficient_eq_doubleDual (dR i) D hFirst hLast hPair,
    frameEulerCurrentCoefficient_eq_doubleDual R (dD i) (metricCurvatureFrameTensor_swap_first g o x f)
      (metricCurvatureFrameTensor_swap_last g o x f) (metricCurvatureFrameTensor_pair_symm g o x f)]
  simp only [eulerDoubleDualField_nabla_apply_frame, eulerDoubleDualField_apply_frame]
  change (2 * (∑ j : Fin 4, ∑ a : Fin 4, ∑ b : Fin 4,
    (frameEulerDoubleDual (dR i) i j a b * D a j b + frameEulerDoubleDual R i j a b * dD i a j b))) = _
  simp only [Finset.sum_add_distrib]
  ring

set_option maxHeartbeats 1000000 in
/-- The actual flow's local normalized Euler coefficient differentiates to
the divergence of its globally constructed slice current. The base vectors
are fixed in the original oriented slice frame. -/
theorem ricciFlowEulerPfaffian_fixedBase_hasDerivAt_divergence [I.Boundaryless]
    {D : RealTimeInterval} (S : SolutionOn (I := I) (M := M) D) (hS : IsSolutionOn S)
    (t : D.RegularTime) (o : ManifoldOrientation I M 4) (x : M)
    (f : OrientedOrthonormalFrameAt (S.family.metric t) o x)
    (b : ℝ → Fin 4 → TangentSpace I x) (hb : ∀ a, b t a = f.basis a)
    (hd : ∀ a, HasDerivAt (fun s => b s a)
      (ricciSharp (S.family.metric t) x (b t a)) (t : ℝ)) :
    let F := fun s a c i j => eulerCurvatureCoefficient S x (f.basis i) (f.basis j)
      (fun u => b u c) (fun u => b u a) s
    HasDerivAt (fun s => 2 * frameEulerPfaffian (F s))
      (divergenceG (S.family.metric t) (ricciFlowEulerCurrent S t) x) (t : ℝ) := by
  intro F
  let g := S.family.metric t
  let R := metricCurvatureFrameTensor g o x f
  let J := fun a j c => metricNablaRic g x (vec3 (f.basis a) (f.basis j) (f.basis c))
  let dJ := fun r a j c => metricNabla2Ric g x (vec4 (f.basis r) (f.basis a) (f.basis j) (f.basis c))
  let dR := fun r i j a c => metricFrameEulerCovariantDerivative g o x f a c r i j
  have hF : F t = R := by
    funext a c i j
    exact eulerCurvatureCoefficient_eq_metricFrame S t o x f b hb a c i j
  have hdα (a c i j : Fin 4) : ricciFlowEulerCovariantJet g x (f.basis i) (f.basis j)
      (f.basis c) (f.basis a) = dJ i a j c - dJ i c j a := by
    rfl
  have hdF (a c i j k : Fin 4) : metricFrameEulerCovariantDerivative g o x f a c i j k =
      dR i a c j k := by
    exact (frameEulerCovariantDerivative_skews g x o f i).2.2 j k a c
  change HasDerivAt (fun s => 2 * frameEulerPfaffian (F s))
    (divergenceG g (globalEulerCurrent g) x) (t : ℝ)
  rw [globalEulerCurrent_divergence_eq_primitiveJet g x o f]
  change HasDerivAt (fun s => 2 * frameEulerPfaffian (F s))
    (frameEulerPrimitiveVolumeJet J R dJ dR) (t : ℝ)
  rw [← hF, frameEulerPrimitiveVolumeJet]
  refine frameEulerPfaffian_hasDerivAt_of_bianchi F t
    (fun a c j => J a j c - J c j a) (fun a c i j => dJ i a j c - dJ i c j a)
    (fun a c i j k => dR i a c j k) ?_ ?_
  · intro a c i j
    have h := eulerCurvatureCoefficient_hasDerivAt_skewJet S hS t x (f.basis i) (f.basis j)
      (fun u => b u c) (fun u => b u a) (hd c) (hd a)
    simp only [hb] at h
    change HasDerivAt (fun s => F s a c i j)
      (ricciFlowEulerCovariantJet g x (f.basis i) (f.basis j) (f.basis c) (f.basis a) -
        ricciFlowEulerCovariantJet g x (f.basis j) (f.basis i) (f.basis c) (f.basis a)) (t : ℝ) at h
    simpa only [hdα] using h
  · intro a c
    have h (i j k : Fin 4) : dR i a c j k - dR j a c i k + dR k a c i j = 0 := by
      simpa only [hdF] using metricFrameEulerCovariantDerivative_bianchi g o x f a c i j k
    exact ⟨h 0 1 2, h 0 1 3, h 0 2 3, h 1 2 3⟩

end Current

end SmoothPoincare
