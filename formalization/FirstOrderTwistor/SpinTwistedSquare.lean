import FirstOrderTwistor.SpinNormalChart
import FirstOrderTwistor.SpinCurvaturePotential
import DifferentialGeometry.Geometry.Curvature.CurvatureOperator.Identities.ContractedBianchi

/-!
# The covector-twisted Dirac square at a normal center

FOT-E18o for Edward B. Baker III, 25 November 2026. OpenAI Codex assistance.
The serving model and reasoning effort are unavailable. Inputs at checkout
`5ff7014` include MATCH-E11 and the checked aligned normal spin chart.

The normal coordinate index of a covector is covariant. Its curvature
acts by the negative transpose of the vector curvature. The Clifford
symbols reverse chirality, and the second Dirac contraction acts from
the negative half back to the positive half.
-/

namespace FirstOrderTwistor

open scoped Quaternion Matrix.Norms.Elementwise

noncomputable section

private abbrev FrameMatrix := Matrix (Fin 4) (Fin 4) ℝ

/-- A spinor-valued coordinate one-form in a local half-spin frame. -/
abbrev CoordinateSpinCovector := Fin 4 → EuclideanFour → ℍ[ℝ]

private def matrixEntry (a k : Fin 4) : FrameMatrix →L[ℝ] ℝ :=
  (ContinuousLinearMap.proj (R := ℝ) (φ := fun _ : Fin 4 => ℝ) k).comp
    (ContinuousLinearMap.proj (R := ℝ) (φ := fun _ : Fin 4 => Fin 4 → ℝ) a)

private theorem matrixEntry_hasFDerivAt {A : EuclideanFour → FrameMatrix}
    {x : EuclideanFour} (hA : DifferentiableAt ℝ A x) (a k : Fin 4) :
    HasFDerivAt (fun y => A y a k) ((matrixEntry a k).comp (fderiv ℝ A x)) x :=
  (matrixEntry a k).hasFDerivAt.comp x hA.hasFDerivAt

private def covectorConnectionComponent
    (A : Fin 4 → EuclideanFour → FrameMatrix) (j : Fin 4)
    (v : CoordinateSpinCovector) (k : Fin 4) (x : EuclideanFour) : ℍ[ℝ] :=
  ∑ a, A j x a k • v a x

/-- Tensor-product connection in the coordinate covector slot and half-spin slot. -/
def spinCovectorCovariantDerivative
    (Γ : Fin 4 → EuclideanFour → ℍ[ℝ]) (A : Fin 4 → EuclideanFour → FrameMatrix)
    (i : Fin 4) (v : CoordinateSpinCovector) (k : Fin 4) (x : EuclideanFour) : ℍ[ℝ] :=
  spinCovariantDerivative Γ i (v k) x - covectorConnectionComponent A i v k x

/-- The ordered covariant Hessian includes the connection in both covector slots. -/
def spinCovectorHessian
    (Γ : Fin 4 → EuclideanFour → ℍ[ℝ]) (A : Fin 4 → EuclideanFour → FrameMatrix)
    (v : CoordinateSpinCovector) (i j k : Fin 4) (x : EuclideanFour) : ℍ[ℝ] :=
  spinCovectorCovariantDerivative Γ A i (spinCovectorCovariantDerivative Γ A j v) k x -
    ∑ a, A i x a j • spinCovectorCovariantDerivative Γ A a v k x

/-- Dirac contraction on a covector-spinor with the supplied chirality
and upper Clifford coefficients. The covector slots are left unchanged. -/
def coordinateTwistedDirac
    (Γ symbol : Fin 4 → EuclideanFour → ℍ[ℝ]) (A : Fin 4 → EuclideanFour → FrameMatrix)
    (v : CoordinateSpinCovector) (k : Fin 4) (x : EuclideanFour) : ℍ[ℝ] :=
  ∑ i, symbol i x * spinCovectorCovariantDerivative Γ A i v k x

private theorem differentiableAt_covectorConnectionComponent
    {A : Fin 4 → EuclideanFour → FrameMatrix} {v : CoordinateSpinCovector}
    {x : EuclideanFour} (hA : ∀ j, DifferentiableAt ℝ (A j) x)
    (hv : ∀ a, DifferentiableAt ℝ (v a) x) (j k : Fin 4) :
    DifferentiableAt ℝ (covectorConnectionComponent A j v k) x :=
  DifferentiableAt.fun_sum fun a _ =>
    ((matrixEntry_hasFDerivAt (hA j) a k).differentiableAt).smul (hv a)

private theorem differentiableAt_spinCovariantDerivative
    {Γ : Fin 4 → EuclideanFour → ℍ[ℝ]} {v : EuclideanFour → ℍ[ℝ]}
    {x : EuclideanFour} (hv : ContDiffAt ℝ 2 v x)
    (hΓ : ∀ j, DifferentiableAt ℝ (Γ j) x) (j : Fin 4) :
    DifferentiableAt ℝ (spinCovariantDerivative Γ j v) x := by
  have hpartial : DifferentiableAt ℝ (spinCoordinatePartial v j) x :=
    (((hv.fderiv_right (m := 1) (by norm_num)).clm_apply (contDiffAt_const
      (c := EuclideanSpace.single j 1))).differentiableAt one_ne_zero)
  exact hpartial.add ((hΓ j).mul (hv.differentiableAt (by norm_num)))

private theorem differentiableAt_spinCovectorCovariantDerivative
    {Γ : Fin 4 → EuclideanFour → ℍ[ℝ]} {A : Fin 4 → EuclideanFour → FrameMatrix}
    {v : CoordinateSpinCovector} {x : EuclideanFour} (hv : ∀ a, ContDiffAt ℝ 2 (v a) x)
    (hΓ : ∀ j, DifferentiableAt ℝ (Γ j) x) (hA : ∀ j, DifferentiableAt ℝ (A j) x)
    (j k : Fin 4) : DifferentiableAt ℝ (spinCovectorCovariantDerivative Γ A j v k) x :=
  (differentiableAt_spinCovariantDerivative (hv k) hΓ j).sub
    (differentiableAt_covectorConnectionComponent hA (fun a => (hv a).differentiableAt (by norm_num)) j k)

private theorem covectorConnectionComponent_partial_normal
    {A : Fin 4 → EuclideanFour → FrameMatrix} {v : CoordinateSpinCovector}
    {x : EuclideanFour} (hA : ∀ j, DifferentiableAt ℝ (A j) x)
    (hv : ∀ a, DifferentiableAt ℝ (v a) x) (hA0 : ∀ j, A j x = 0) (i j k : Fin 4) :
    spinCoordinatePartial (covectorConnectionComponent A j v k) i x =
      ∑ a, (fderiv ℝ (A j) x (EuclideanSpace.single i 1)) a k • v a x := by
  unfold spinCoordinatePartial covectorConnectionComponent
  rw [fderiv_fun_sum (u := Finset.univ) (A := fun a y => A j y a k • v a y)
    (fun a _ => ((matrixEntry_hasFDerivAt (hA j) a k).differentiableAt).smul (hv a)),
    sum_apply]
  apply Finset.sum_congr rfl
  intro a _
  rw [fderiv_fun_smul (matrixEntry_hasFDerivAt (hA j) a k).differentiableAt (hv a),
    (matrixEntry_hasFDerivAt (hA j) a k).fderiv]
  simp only [hA0, Matrix.zero_apply, add_apply, smul_apply,
    zero_smul, zero_add, ContinuousLinearMap.smulRight_apply,
    ContinuousLinearMap.comp_apply, matrixEntry]
  rfl

private theorem spinCovectorHessian_normal
    {Γ : Fin 4 → EuclideanFour → ℍ[ℝ]} {A : Fin 4 → EuclideanFour → FrameMatrix}
    {x : EuclideanFour} (hΓ0 : ∀ j, Γ j x = 0) (hA0 : ∀ j, A j x = 0)
    (v : CoordinateSpinCovector) (i j k : Fin 4) :
    spinCovectorHessian Γ A v i j k x =
      spinCoordinatePartial (spinCovectorCovariantDerivative Γ A j v k) i x := by
  simp only [spinCovectorHessian, spinCovectorCovariantDerivative, spinCovariantDerivative,
    covectorConnectionComponent, hΓ0, hA0, Matrix.zero_apply, zero_smul, Finset.sum_const_zero,
    zero_mul, add_zero, sub_zero]

/-- The actual Hessian commutator at a normal center has the spin
curvature in the spin slot and the dual matrix curvature in the covector slot. -/
theorem spinCovectorHessian_commutator_normal
    {Γ : Fin 4 → EuclideanFour → ℍ[ℝ]} {A : Fin 4 → EuclideanFour → FrameMatrix}
    {v : CoordinateSpinCovector} {x : EuclideanFour} (hv : ∀ a, ContDiffAt ℝ 2 (v a) x)
    (hΓ : ∀ j, DifferentiableAt ℝ (Γ j) x) (hA : ∀ j, DifferentiableAt ℝ (A j) x)
    (hΓ0 : ∀ j, Γ j x = 0) (hA0 : ∀ j, A j x = 0)
    (i j k : Fin 4) :
    spinCovectorHessian Γ A v i j k x - spinCovectorHessian Γ A v j i k x =
      spinCoordinateCurvature Γ i j x * v k x -
        ∑ a, spinFrameCoordinateCurvature A i j x a k • v a x := by
  have hvdiff (a : Fin 4) := (hv a).differentiableAt (by norm_num : (2 : WithTop ℕ∞) ≠ 0)
  have hH (l m : Fin 4) :
      spinCovectorHessian Γ A v l m k x =
        spinCovariantDerivative Γ l (spinCovariantDerivative Γ m (v k)) x -
          ∑ a, (fderiv ℝ (A m) x (EuclideanSpace.single l 1)) a k • v a x := by
    rw [spinCovectorHessian_normal hΓ0 hA0]
    change spinCoordinatePartial (fun y => spinCovariantDerivative Γ m (v k) y -
      covectorConnectionComponent A m v k y) l x = _
    unfold spinCoordinatePartial
    rw [fderiv_fun_sub (differentiableAt_spinCovariantDerivative (hv k) hΓ m)
      (differentiableAt_covectorConnectionComponent hA hvdiff m k)]
    simp only [sub_apply]
    change spinCoordinatePartial (spinCovariantDerivative Γ m (v k)) l x -
      spinCoordinatePartial (covectorConnectionComponent A m v k) l x = _
    rw [covectorConnectionComponent_partial_normal hA hvdiff hA0]
    simp [spinCovariantDerivative, hΓ0]
  rw [hH, hH]
  have hSpin := spinCovariantDerivative_commutator (hv k) i j (hΓ i) (hΓ j)
  simp only [spinFrameCoordinateCurvature, hA0, mul_zero, sub_self, add_zero,
    Matrix.sub_apply, sub_smul, Finset.sum_sub_distrib]
  rw [← hSpin]
  abel

/-- The Clifford expansion splits the ordered two-jet into its negative
diagonal trace and the six oriented antisymmetric slots. -/
theorem frameTwistedSquare_split (B : Fin 4 → Fin 4 → ℍ[ℝ]) :
    (∑ i, ∑ j, negativeCliffordVector i * (positiveCliffordVector j * B i j)) =
      -(∑ i, B i i) +
        ∑ i, ∑ j, if i < j then
          negativeCliffordVector i * (positiveCliffordVector j * (B i j - B j i)) else 0 := by
  apply Quaternion.ext <;>
    norm_num [negativeCliffordVector, positiveCliffordVector, spinUnit, Fin.sum_univ_four] <;> ring

private theorem frameAlternatingCliffordSum (B : Fin 4 → Fin 4 → ℍ[ℝ])
    (hAlt : ∀ i j, B j i = -B i j) (hDiag : ∀ i, B i i = 0) :
    (∑ i, ∑ j, if i < j then negativeCliffordVector i * (positiveCliffordVector j * B i j) else 0) =
      (-1 / 2 : ℝ) • (∑ j, negativeCliffordVector j * (∑ i, positiveCliffordVector i * B i j)) := by
  have hDiff (i j : Fin 4) : B j i - B i j = (-2 : ℝ) • B i j := by
    rw [hAlt i j, sub_eq_add_neg, ← neg_add, ← two_smul ℝ, neg_smul]
  have h := frameTwistedSquare_split (fun i j => B j i)
  simp only [hDiag, Finset.sum_const_zero, neg_zero, zero_add, hDiff, mul_smul_comm] at h
  rw [show (∑ j, negativeCliffordVector j * (∑ i, positiveCliffordVector i * B i j)) =
    ∑ j, ∑ i, negativeCliffordVector j * (positiveCliffordVector i * B i j) by
      simp only [Finset.mul_sum]]
  rw [h]
  simp only [Finset.smul_sum, smul_ite, smul_zero, smul_smul]
  norm_num

private theorem frameSymmetricCliffordSum (A : Fin 4 → Fin 4 → ℝ)
    (hSymm : ∀ a b, A b a = A a b) (ψ : ℍ[ℝ]) :
    (∑ j, negativeCliffordVector j * ((∑ a, A a j • positiveCliffordVector a) * ψ)) =
      (-(∑ j, A j j) : ℝ) • ψ := by
  apply Quaternion.ext <;>
    norm_num [negativeCliffordVector, positiveCliffordVector, spinUnit, Fin.sum_univ_four,
      smul_eq_mul, hSymm 0 1, hSymm 0 2, hSymm 0 3, hSymm 1 2, hSymm 1 3, hSymm 2 3] <;> ring

/-- Scalar curvature as the trace of the Ricci matrix in a marked frame. -/
def frameScalarCurvature (R : CurvatureFrameTensor) : ℝ :=
  ∑ j, frameRicciTensor R j j

/-- The covector contribution to the twisted curvature potential. -/
def frameTwistedCovectorPotential (R : CurvatureFrameTensor) (v : Fin 4 → ℍ[ℝ])
    (k : Fin 4) : ℍ[ℝ] :=
  ∑ i, ∑ j, if i < j then
    negativeCliffordVector i * (positiveCliffordVector j * (-∑ a, R i j a k • v a)) else 0

private theorem frameSpinCurvaturePotential_scalar {R : CurvatureFrameTensor}
    (hFirst : ∀ a b c d, R b a c d = -R a b c d)
    (hLast : ∀ a b c d, R a b d c = -R a b c d)
    (hPair : ∀ a b c d, R a b c d = R c d a b)
    (hBianchi : ∀ a b c d, R a b c d + R b c a d + R c a b d = 0) (ψ : ℍ[ℝ]) :
    (∑ i, ∑ j, if i < j then negativeCliffordVector i *
      (positiveCliffordVector j * ((-1 / 2 : ℝ) • (frameCurvatureQuaternion R i j * ψ))) else 0) =
      (frameScalarCurvature R / 4) • ψ := by
  let B (i j : Fin 4) := (-1 / 2 : ℝ) • (frameCurvatureQuaternion R i j * ψ)
  have hQAlt (i j : Fin 4) : frameCurvatureQuaternion R j i = -frameCurvatureQuaternion R i j := by
    apply Quaternion.ext <;>
      simp only [frameCurvatureQuaternion, Quaternion.re_neg, Quaternion.imI_neg,
        Quaternion.imJ_neg, Quaternion.imK_neg, hFirst i j, neg_add, neg_zero]
  have hDiagCurv (i a b : Fin 4) : R i i a b = 0 := by linarith [hFirst i i a b]
  have hQdiag (i : Fin 4) : frameCurvatureQuaternion R i i = 0 := by
    apply Quaternion.ext <;> simp [frameCurvatureQuaternion, hDiagCurv]
  have hBAlt (i j : Fin 4) : B j i = -B i j := by simp [B, hQAlt i j, smul_neg]
  have hBdiag (i : Fin 4) : B i i = 0 := by simp [B, hQdiag]
  have hRicSymm (a b : Fin 4) : frameRicciTensor R b a = frameRicciTensor R a b := by
    unfold frameRicciTensor
    exact Finset.sum_congr rfl fun i _ => hPair i a i b
  change (∑ i, ∑ j, if i < j then negativeCliffordVector i * (positiveCliffordVector j * B i j)
    else 0) = _
  rw [frameAlternatingCliffordSum B hBAlt hBdiag]
  have hBContraction (j : Fin 4) :
      (∑ i, positiveCliffordVector i * B i j) = frameRicciForcing R ψ j :=
    frameSpinRicciContraction hLast hPair hBianchi ψ j
  simp only [hBContraction, frameRicciForcing,
    mul_smul_comm, ← Finset.smul_sum]
  rw [frameSymmetricCliffordSum (frameRicciTensor R) hRicSymm, smul_smul, smul_smul]
  congr 1
  unfold frameScalarCurvature
  ring

/-- The spin part of the contracted commutator is the scalar quarter.
The remaining potential acts on the dual tangent slot. -/
theorem frameTwistedCurvaturePotential_eq_scalar_add {R : CurvatureFrameTensor}
    (hFirst : ∀ a b c d, R b a c d = -R a b c d)
    (hLast : ∀ a b c d, R a b d c = -R a b c d)
    (hPair : ∀ a b c d, R a b c d = R c d a b)
    (hBianchi : ∀ a b c d, R a b c d + R b c a d + R c a b d = 0)
    (v : Fin 4 → ℍ[ℝ]) (k : Fin 4) :
    frameTwistedCurvaturePotential R v k =
      (frameScalarCurvature R / 4) • v k + frameTwistedCovectorPotential R v k := by
  simp only [frameTwistedCurvaturePotential, frameTwistedCurvatureAction,
    frameTwistedCovectorPotential, sub_eq_add_neg, mul_add, ite_add_zero,
    Finset.sum_add_distrib]
  rw [frameSpinCurvaturePotential_scalar hFirst hLast hPair hBianchi]

/-- Expand the composed chiral Dirac operators at a normal center with
stationary upper Clifford symbols. Every term is an actual derivative
of the specified local fields and connections. -/
theorem coordinateTwistedDirac_square_at_center
    {Γplus Γminus upper lower : Fin 4 → EuclideanFour → ℍ[ℝ]}
    {A : Fin 4 → EuclideanFour → FrameMatrix} {v : CoordinateSpinCovector}
    {x : EuclideanFour} (hv : ∀ a, ContDiffAt ℝ 2 (v a) x)
    (hΓplus : ∀ j, DifferentiableAt ℝ (Γplus j) x)
    (hA : ∀ j, DifferentiableAt ℝ (A j) x)
    (hΓplus0 : ∀ j, Γplus j x = 0) (hΓminus0 : ∀ j, Γminus j x = 0)
    (hA0 : ∀ j, A j x = 0)
    (hUpper : ∀ j, HasFDerivAt (𝕜 := ℝ) (upper j) 0 x ∧ upper j x = positiveCliffordVector j)
    (hLower : ∀ j, lower j x = negativeCliffordVector j) (k : Fin 4) :
    coordinateTwistedDirac Γminus lower A (coordinateTwistedDirac Γplus upper A v) k x =
      ∑ i, ∑ j, negativeCliffordVector i *
        (positiveCliffordVector j * spinCovectorHessian Γplus A v i j k x) := by
  have hPartial (i : Fin 4) :
      spinCoordinatePartial (coordinateTwistedDirac Γplus upper A v k) i x =
        ∑ j, positiveCliffordVector j * spinCovectorHessian Γplus A v i j k x := by
    unfold spinCoordinatePartial coordinateTwistedDirac
    have hDiff (j : Fin 4) := differentiableAt_spinCovectorCovariantDerivative hv hΓplus hA j k
    rw [fderiv_fun_sum (u := Finset.univ)
      (A := fun j y => upper j y * spinCovectorCovariantDerivative Γplus A j v k y)
      (fun j _ => (hUpper j).1.differentiableAt.mul (hDiff j)), sum_apply]
    apply Finset.sum_congr rfl
    intro j _
    rw [fderiv_fun_mul' (hUpper j).1.differentiableAt (hDiff j), (hUpper j).1.fderiv,
      (hUpper j).2, spinCovectorHessian_normal hΓplus0 hA0]
    simp [spinCoordinatePartial]
  have hOuter (i : Fin 4) :
      spinCovectorCovariantDerivative Γminus A i (coordinateTwistedDirac Γplus upper A v) k x =
        spinCoordinatePartial (coordinateTwistedDirac Γplus upper A v k) i x := by
    simp only [spinCovectorCovariantDerivative, spinCovariantDerivative, covectorConnectionComponent,
      hA0, hΓminus0, Matrix.zero_apply, zero_smul, Finset.sum_const_zero, zero_mul, add_zero, sub_zero]
  change (∑ i, lower i x *
    spinCovectorCovariantDerivative Γminus A i (coordinateTwistedDirac Γplus upper A v) k x) = _
  simp only [hOuter, hLower, hPartial, Finset.mul_sum]

/-- The normal square with the signed covector and spin curvature terms.
The coefficient identities on a supplied coordinate connection suffice. -/
theorem coordinateTwistedDirac_square_of_curvature
    {Γplus Γminus upper lower : Fin 4 → EuclideanFour → ℍ[ℝ]}
    {A : Fin 4 → EuclideanFour → FrameMatrix} {v : CoordinateSpinCovector}
    {x : EuclideanFour} (hv : ∀ a, ContDiffAt ℝ 2 (v a) x)
    (hΓplus : ∀ j, DifferentiableAt ℝ (Γplus j) x)
    (hA : ∀ j, DifferentiableAt ℝ (A j) x)
    (hΓplus0 : ∀ j, Γplus j x = 0) (hΓminus0 : ∀ j, Γminus j x = 0)
    (hA0 : ∀ j, A j x = 0)
    (hUpper : ∀ j, HasFDerivAt (𝕜 := ℝ) (upper j) 0 x ∧ upper j x = positiveCliffordVector j)
    (hLower : ∀ j, lower j x = negativeCliffordVector j)
    {R : CurvatureFrameTensor}
    (hSpin : ∀ i j, spinCoordinateCurvature Γplus i j x =
      (-1 / 2 : ℝ) • frameCurvatureQuaternion R i j)
    (hCovector : ∀ i j, spinFrameCoordinateCurvature A i j x = Matrix.of (R i j))
    (k : Fin 4) :
    coordinateTwistedDirac Γminus lower A (coordinateTwistedDirac Γplus upper A v) k x =
      -(∑ i, spinCovectorHessian Γplus A v i i k x) +
        frameTwistedCurvaturePotential R (fun a => v a x) k := by
  rw [coordinateTwistedDirac_square_at_center hv hΓplus hA hΓplus0 hΓminus0 hA0 hUpper hLower,
    frameTwistedSquare_split]
  simp only [frameTwistedCurvaturePotential, frameTwistedCurvatureAction,
    spinCovectorHessian_commutator_normal hv hΓplus hA hΓplus0 hA0, hSpin, hCovector,
    Matrix.of_apply, smul_mul_assoc]

/-- The negative half-spin lift in the same ordered basis. The complementary
bivectors have the opposite chirality. -/
def negativeSpinConnectionLift (A : FrameMatrix) : ℍ[ℝ] :=
  (1 / 2 : ℝ) • (⟨0, A 0 1 - A 2 3, A 0 2 - A 3 1, A 0 3 - A 1 2⟩ : ℍ[ℝ])

/-- Sign check against products of the two chiral Clifford symbols in the
same oriented wedge pairs as the positive lift. -/
theorem negativeSpinConnectionLift_eq_clifford (A : FrameMatrix) :
    negativeSpinConnectionLift A =
      (-1 / 2 : ℝ) •
        (A 0 1 • (positiveCliffordVector 0 * negativeCliffordVector 1) +
          A 2 3 • (positiveCliffordVector 2 * negativeCliffordVector 3) +
          A 0 2 • (positiveCliffordVector 0 * negativeCliffordVector 2) +
          A 3 1 • (positiveCliffordVector 3 * negativeCliffordVector 1) +
          A 0 3 • (positiveCliffordVector 0 * negativeCliffordVector 3) +
          A 1 2 • (positiveCliffordVector 1 * negativeCliffordVector 2)) := by
  apply Quaternion.ext <;>
    norm_num [negativeSpinConnectionLift, negativeCliffordVector, positiveCliffordVector,
      spinUnit, smul_eq_mul] <;> ring

/-- The return Dirac contraction uses the same frame-vector columns and
the symbols acting from the negative half. -/
def normalChartTwistedBackSymbol (U : EuclideanFour → FrameMatrix)
    (i : Fin 4) (y : EuclideanFour) : ℍ[ℝ] :=
  normalChartTwistorSymbol (fun z => (U z).transpose) i y

open DifferentialGeometry DifferentialGeometry.Geometry.Riemannian.Geodesic
open DifferentialGeometry.Geometry.Curvature
open DifferentialGeometry.Tensor.Coordinates
open scoped Manifold ContDiff Topology

/-- The Ricci trace of the actual oriented frame tensor is the scalar
curvature of the metric. -/
theorem frameScalarCurvature_metric
    {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
    [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
    [BoundarylessManifold I M] [T2Space M]
    (g : SmoothRiemannianMetric I M) (o : ManifoldOrientation I M 4)
    (p : M) (frame : OrientedOrthonormalFrameAt g o p) :
    frameScalarCurvature (metricCurvatureFrameTensor g o p frame) = metricScalarAt g p := by
  let index : Fin (Module.finrank ℝ E) ≃ Fin 4 := finCongr o.dimension_eq
  have hOrtho (i k : Fin (Module.finrank ℝ E)) :
      g.inner p (frame.basis (index i)) (frame.basis (index k)) =
        if i = k then (1 : ℝ) else 0 := by
    rw [frame.orthonormal]
    simp only [Equiv.apply_eq_iff_eq]
  rw [metricScalar_eq_scal, scalarCurv_eq_orthonormal_trace g p _ hOrtho]
  unfold frameScalarCurvature
  simp_rw [frameRicciTensor_metric]
  exact (index.sum_comp fun i => ricciTensor g p (frame.basis i) (frame.basis i)).symm

/-- At a marked metric point the spin term is the actual scalar quarter. -/
theorem metricFrameTwistedCurvaturePotential_eq_scalar_add
    {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
    [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
    [BoundarylessManifold I M] [T2Space M]
    (g : SmoothRiemannianMetric I M) (o : ManifoldOrientation I M 4)
    (p : M) (frame : OrientedOrthonormalFrameAt g o p) (v : Fin 4 → ℍ[ℝ]) (k : Fin 4) :
    frameTwistedCurvaturePotential (metricCurvatureFrameTensor g o p frame) v k =
      (metricScalarAt g p / 4) • v k +
        frameTwistedCovectorPotential (metricCurvatureFrameTensor g o p frame) v k := by
  rw [frameTwistedCurvaturePotential_eq_scalar_add
      (metricCurvatureFrameTensor_swap_first g o p frame)
      (metricCurvatureFrameTensor_swap_last g o p frame)
      (metricCurvatureFrameTensor_pair_symm g o p frame)
      (metricCurvatureFrameTensor_bianchi g o p frame),
    frameScalarCurvature_metric]

/-- The composed covector-twisted chiral Dirac operators in a supplied
aligned normal chart of the actual metric. As in
`metricNormalChartTwistorDefect`, `U` represents the oriented orthonormal
frame, `V` its inverse, and the two quaternionic fields use the corresponding
spin trivializations. The Levi–Civita covector-slot curvature and the
spin-slot curvature are both calculated from actual derivatives. -/
theorem metricNormalChartTwistedDiracSquare
    {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ EuclideanFour H}
    [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [I.Boundaryless] [T2Space M]
    (g : SmoothRiemannianMetric I M) (o : ManifoldOrientation I M 4)
    (p : M) (frame : OrientedOrthonormalFrameAt g o p)
    {U V : EuclideanFour → FrameMatrix} {v : CoordinateSpinCovector}
    (hAligned : ∀ i, centeredChartTangentEquiv (I := I) p (frame.basis i) =
      EuclideanSpace.single i 1)
    (hNormal : ∀ u w, chartChristoffelContraction g p u w (extChartAt I p p) = 0)
    (hv : ∀ a, ContDiffAt ℝ 2 (v a) (extChartAt I p p))
    (hU : ContDiffAt ℝ 2 U (extChartAt I p p)) (hV : DifferentiableAt ℝ V (extChartAt I p p))
    (hUone : U (extChartAt I p p) = 1) (hUzero : HasFDerivAt (𝕜 := ℝ) U 0 (extChartAt I p p))
    (hInv : (fun y => V y * U y) =ᶠ[𝓝 (extChartAt I p p)] fun _ => 1)
    (k : Fin 4) :
    let x := extChartAt I p p
    let A := leviCivitaCoordinateMatrices g p
    let B := spinNormalGaugeConnection A U V
    let Γplus := fun i y => spinConnectionLift (B i y)
    let Γminus := fun i y => negativeSpinConnectionLift (B i y)
    coordinateTwistedDirac Γminus (normalChartTwistedBackSymbol U) A
      (coordinateTwistedDirac Γplus (normalChartDiracSymbol U) A v) k x =
      -(∑ i, spinCovectorHessian Γplus A v i i k x) +
        frameTwistedCurvaturePotential (metricCurvatureFrameTensor g o p frame) (fun a => v a x) k := by
  let x := extChartAt I p p
  let A := leviCivitaCoordinateMatrices g p
  let B := spinNormalGaugeConnection A U V
  let Γplus := fun i y => spinConnectionLift (B i y)
  let Γminus := fun i y => negativeSpinConnectionLift (B i y)
  obtain ⟨hBzero, hBdiff, hBcurv⟩ := spinNormalGauge_leviCivita_at_center g o p frame
    hAligned hNormal hU hV hUone hUzero.fderiv hInv
  change (∀ i, B i x = 0) at hBzero
  change (∀ i, DifferentiableAt ℝ (B i) x) at hBdiff
  have hΓplusdiff (i : Fin 4) : DifferentiableAt ℝ (Γplus i) x :=
    (spinConnectionLift.toContinuousLinearMap.hasFDerivAt.comp x (hBdiff i).hasFDerivAt).differentiableAt
  have hΓplus0 (i : Fin 4) : Γplus i x = 0 := by simp [Γplus, hBzero]
  have hΓminus0 (i : Fin 4) : Γminus i x = 0 := by
    simp [Γminus, hBzero, negativeSpinConnectionLift]
    rfl
  have hBack (i : Fin 4) : normalChartTwistedBackSymbol U i x = negativeCliffordVector i := by
    change (∑ a, U x i a • negativeCliffordVector a) = _
    rw [show U x = 1 from hUone]
    simp [Matrix.one_apply]
  have hSpin (i j : Fin 4) : spinCoordinateCurvature Γplus i j x =
      (-1 / 2 : ℝ) • frameCurvatureQuaternion (metricCurvatureFrameTensor g o p frame) i j := by
    have hSkew (k a b : Fin 4) : B k x b a = -B k x a b := by simp [hBzero]
    rw [spinCoordinateCurvature_connectionLift i j hBdiff hSkew, hBcurv i j]
    rfl
  exact coordinateTwistedDirac_square_of_curvature hv hΓplusdiff
    (differentiableAt_leviCivitaCoordinateMatrices g p) hΓplus0 hΓminus0
    (leviCivitaCoordinateMatrices_eq_zero_at_normalCenter g p hNormal)
    (normalChartDiracSymbol_at_center hUone hUzero) hBack hSpin
    (spinFrameCoordinateCurvature_leviCivita_normalCenter g o p frame hAligned hNormal) k

end
end FirstOrderTwistor
