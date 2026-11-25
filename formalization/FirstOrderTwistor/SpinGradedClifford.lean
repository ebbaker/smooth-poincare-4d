import FirstOrderTwistor.SpinCliffordCompatibility
import FirstOrderTwistor.SpinCoordinateSquare
import Mathlib.Analysis.InnerProductSpace.ProdL2

/-!
# The full real Clifford fibre and its covector twist

The quaternionic positive and negative halves are placed in an orthogonal
Hilbert sum. A real tangent vector interchanges the halves. This is a fibre
calculation in the supplied frame, with four orthogonal copies for the
covector components.
-/

namespace FirstOrderTwistor

open scoped BigOperators InnerProductSpace Quaternion

noncomputable section

/-- The orthogonal real Hilbert sum of the positive and negative halves. -/
abbrev GradedSpinFiber := WithLp 2 (ℍ[ℝ] × ℍ[ℝ])

/-- Orthogonal covector components in an orthonormal four-frame. -/
abbrev GradedCovectorSpinFiber := WithLp 2 (Fin 4 → GradedSpinFiber)

/-- Clifford multiplication on the full graded fibre in real frame components. -/
def gradedSpinClifford (a : Fin 4 → ℝ) : GradedSpinFiber →L[ℝ] GradedSpinFiber :=
  ({ toFun := fun x => WithLp.toLp 2
      (frameCliffordCombination negativeCliffordVector a * x.ofLp.2,
        frameCliffordCombination positiveCliffordVector a * x.ofLp.1)
     map_add' := by
       intro x y
       apply WithLp.ofLp_injective 2
       apply Prod.ext <;> simp [mul_add]
     map_smul' := by
       intro t x
       apply WithLp.ofLp_injective 2
       apply Prod.ext <;> simp } :
    GradedSpinFiber →ₗ[ℝ] GradedSpinFiber).toContinuousLinearMap

@[simp] theorem gradedSpinClifford_apply (a : Fin 4 → ℝ) (x : GradedSpinFiber) :
    (gradedSpinClifford a x).ofLp =
      (frameCliffordCombination negativeCliffordVector a * x.ofLp.2,
        frameCliffordCombination positiveCliffordVector a * x.ofLp.1) := rfl

private theorem gradedClifford_half_adjoint (a : Fin 4 → ℝ) (x y : ℍ[ℝ]) :
    ⟪frameCliffordCombination negativeCliffordVector a * x, y⟫_ℝ =
      -⟪x, frameCliffordCombination positiveCliffordVector a * y⟫_ℝ := by
  norm_num [Quaternion.inner_def, frameCliffordCombination, positiveCliffordVector,
    negativeCliffordVector, spinUnit, Fin.sum_univ_four, Quaternion.re_mul, Quaternion.imI_mul,
    Quaternion.imJ_mul, Quaternion.imK_mul, smul_eq_mul]
  ring

/-- Real Clifford multiplication is skew for the full Hilbert fibre pairing. -/
theorem gradedSpinClifford_skew (a : Fin 4 → ℝ) (x y : GradedSpinFiber) :
    ⟪gradedSpinClifford a x, y⟫_ℝ = -⟪x, gradedSpinClifford a y⟫_ℝ := by
  let hNeg := frameCliffordCombination negativeCliffordVector a * y.ofLp.2
  let hPos := frameCliffordCombination positiveCliffordVector a * x.ofLp.1
  have h : ⟪hNeg, x.ofLp.1⟫_ℝ = -⟪y.ofLp.2, hPos⟫_ℝ :=
    gradedClifford_half_adjoint a y.ofLp.2 x.ofLp.1
  have hOther : ⟪hPos, y.ofLp.2⟫_ℝ = -⟪x.ofLp.1, hNeg⟫_ℝ := by
    linarith only [h, real_inner_comm hNeg x.ofLp.1, real_inner_comm y.ofLp.2 hPos]
  simp only [WithLp.prod_inner_apply, gradedSpinClifford_apply, gradedClifford_half_adjoint]
  change -⟪x.ofLp.2, frameCliffordCombination positiveCliffordVector a * y.ofLp.1⟫_ℝ +
      ⟪hPos, y.ofLp.2⟫_ℝ = -(⟪x.ofLp.1, hNeg⟫_ℝ + _)
  rw [hOther]
  ring

private theorem gradedClifford_halves_anticommute (a b : Fin 4 → ℝ) :
    frameCliffordCombination negativeCliffordVector a * frameCliffordCombination positiveCliffordVector b +
        frameCliffordCombination negativeCliffordVector b * frameCliffordCombination positiveCliffordVector a =
      ((-2 : ℝ) * ∑ i, a i * b i) • (1 : ℍ[ℝ]) ∧
    frameCliffordCombination positiveCliffordVector a * frameCliffordCombination negativeCliffordVector b +
        frameCliffordCombination positiveCliffordVector b * frameCliffordCombination negativeCliffordVector a =
      ((-2 : ℝ) * ∑ i, a i * b i) • (1 : ℍ[ℝ]) := by
  constructor <;> apply Quaternion.ext <;>
    norm_num [frameCliffordCombination, positiveCliffordVector, negativeCliffordVector, spinUnit,
      Fin.sum_univ_four, Quaternion.re_mul, Quaternion.imI_mul, Quaternion.imJ_mul,
      Quaternion.imK_mul, smul_eq_mul] <;> ring

/-- Clifford anticommutation in an orthonormal frame, on the full fibre. -/
theorem gradedSpinClifford_anticommute (a b : Fin 4 → ℝ) (x : GradedSpinFiber) :
    gradedSpinClifford a (gradedSpinClifford b x) + gradedSpinClifford b (gradedSpinClifford a x) =
      ((-2 : ℝ) * ∑ i, a i * b i) • x := by
  obtain ⟨hPositive, hNegative⟩ := gradedClifford_halves_anticommute a b
  apply WithLp.ofLp_injective 2
  apply Prod.ext <;>
    simp only [WithLp.ofLp_add, WithLp.ofLp_smul, Prod.fst_add, Prod.snd_add,
      gradedSpinClifford_apply, ← mul_assoc, ← add_mul, hPositive, hNegative,
      smul_mul_assoc, one_mul] <;> rfl

/-- Clifford multiplication on each of the four covector components. -/
def gradedCovectorClifford (a : Fin 4 → ℝ) : GradedCovectorSpinFiber →L[ℝ] GradedCovectorSpinFiber :=
  ({ toFun := fun x => WithLp.toLp 2 (fun k => gradedSpinClifford a (x.ofLp k))
     map_add' := by
       intro x y
       apply PiLp.ext
       intro k
       simp
     map_smul' := by
       intro t x
       apply PiLp.ext
       intro k
       simp } : GradedCovectorSpinFiber →ₗ[ℝ] GradedCovectorSpinFiber).toContinuousLinearMap

@[simp] theorem gradedCovectorClifford_apply (a : Fin 4 → ℝ) (x : GradedCovectorSpinFiber) (k : Fin 4) :
    (gradedCovectorClifford a x).ofLp k = gradedSpinClifford a (x.ofLp k) := rfl

/-- Clifford multiplication is skew for the orthogonal covector-spinor pairing. -/
theorem gradedCovectorClifford_skew (a : Fin 4 → ℝ) (x y : GradedCovectorSpinFiber) :
    ⟪gradedCovectorClifford a x, y⟫_ℝ = -⟪x, gradedCovectorClifford a y⟫_ℝ := by
  simp only [PiLp.inner_apply, gradedCovectorClifford_apply, gradedSpinClifford_skew,
    Finset.sum_neg_distrib]

/-- The same Clifford anticommutation relation holds after covector twisting. -/
theorem gradedCovectorClifford_anticommute (a b : Fin 4 → ℝ) (x : GradedCovectorSpinFiber) :
    gradedCovectorClifford a (gradedCovectorClifford b x) +
      gradedCovectorClifford b (gradedCovectorClifford a x) = ((-2 : ℝ) * ∑ i, a i * b i) • x := by
  apply PiLp.ext
  intro k
  simp only [WithLp.ofLp_add, Pi.add_apply, gradedCovectorClifford_apply, WithLp.ofLp_smul,
    Pi.smul_apply, gradedSpinClifford_anticommute]

/-- Inclusion of the positive covector components into the full fibre. -/
def gradedCovectorPositive : (Fin 4 → ℍ[ℝ]) →ₗ[ℝ] GradedCovectorSpinFiber where
  toFun U := WithLp.toLp 2 (fun k => WithLp.toLp 2 (U k, 0))
  map_add' U V := by
    apply PiLp.ext
    intro k
    apply WithLp.ofLp_injective 2
    apply Prod.ext <;> simp
  map_smul' r U := by
    apply PiLp.ext
    intro k
    apply WithLp.ofLp_injective 2
    apply Prod.ext <;> simp

@[simp] theorem gradedCovectorPositive_apply (U : Fin 4 → ℍ[ℝ]) (k : Fin 4) :
    (gradedCovectorPositive U).ofLp k = WithLp.toLp 2 (U k, 0) := rfl

/-- The full Hilbert pairing restricts to the sum of positive component pairings. -/
theorem gradedCovectorPositive_inner (U V : Fin 4 → ℍ[ℝ]) :
    ⟪gradedCovectorPositive U, gradedCovectorPositive V⟫_ℝ = ∑ k, ⟪U k, V k⟫_ℝ := by
  simp [PiLp.inner_apply]

/-- The squared norm of the embedded positive spinor is its component sum. -/
theorem gradedCovectorPositive_normSq (U : Fin 4 → ℍ[ℝ]) :
    ‖gradedCovectorPositive U‖ ^ 2 = ∑ k, Quaternion.normSq (U k) := by
  rw [← real_inner_self_eq_norm_sq, gradedCovectorPositive_inner]
  simp only [Quaternion.inner_self]

/-- Two Clifford actions preserve the positive covector fibre. -/
theorem gradedCovectorClifford_double_positive (a b : Fin 4 → ℝ) (U : Fin 4 → ℍ[ℝ]) :
    gradedCovectorClifford a (gradedCovectorClifford b (gradedCovectorPositive U)) =
      gradedCovectorPositive (fun k => frameCliffordCombination negativeCliffordVector a *
        (frameCliffordCombination positiveCliffordVector b * U k)) := by
  apply PiLp.ext
  intro k
  apply WithLp.ofLp_injective 2
  apply Prod.ext <;> simp

/-- The positive-chirality curvature contraction in supplied raised directions. -/
def positiveCliffordCurvatureContraction (a : Fin 4 → Fin 4 → ℝ)
    (R : Fin 4 → Fin 4 → Fin 4 → ℍ[ℝ]) : Fin 4 → ℍ[ℝ] :=
  (1 / 2 : ℝ) • ∑ i, ∑ j, fun k => frameCliffordCombination negativeCliffordVector (a i) *
    (frameCliffordCombination positiveCliffordVector (a j) * R i j k)

/-- When the curvature values are realized in the positive fibre, the actual
coordinate curvature potential is the embedding of the positive contraction. -/
theorem annularTwistedCurvaturePotential_eq_gradedCovectorPositive
    (Γ symbol : Fin 4 → EuclideanFour → GradedCovectorSpinFiber →L[ℝ] GradedCovectorSpinFiber)
    (u : EuclideanFour → GradedCovectorSpinFiber) (x : EuclideanFour)
    (a : Fin 4 → Fin 4 → ℝ) (R : Fin 4 → Fin 4 → Fin 4 → ℍ[ℝ])
    (hSymbols : ∀ i, symbol i x = gradedCovectorClifford (a i))
    (hCurvature : ∀ i j, annularConnectionCurvature Γ i j x (u x) = gradedCovectorPositive (R i j)) :
    annularTwistedCurvaturePotential Γ symbol u x =
      gradedCovectorPositive (positiveCliffordCurvatureContraction a R) := by
  simp only [annularTwistedCurvaturePotential, hSymbols, hCurvature,
    gradedCovectorClifford_double_positive, positiveCliffordCurvatureContraction, map_smul, map_sum]

/-- The coordinate Dirac square acts in the positive fibre when the Hessian
and the fibre curvature of the supplied field are realized there. The raised
frame components give the inverse metric by their Euclidean pairings. -/
theorem annularDiracSquare_eq_gradedCovectorPositive
    (Γ symbol : Fin 4 → EuclideanFour → GradedCovectorSpinFiber →L[ℝ] GradedCovectorSpinFiber)
    (u : EuclideanFour → GradedCovectorSpinFiber) (x : EuclideanFour)
    (A : Fin 4 → Fin 4 → Fin 4 → ℝ) (gInv : Fin 4 → Fin 4 → ℝ) (a : Fin 4 → Fin 4 → ℝ)
    (B R : Fin 4 → Fin 4 → Fin 4 → ℍ[ℝ])
    (hu : ContDiffAt ℝ 2 u x) (hΓ : ∀ j, DifferentiableAt ℝ (Γ j) x)
    (hSymbol : ∀ j, DifferentiableAt ℝ (symbol j) x)
    (hTorsion : ∀ i j k, A i j k = A j i k)
    (hCompatible : ∀ i j v,
      (fderiv ℝ (symbol j) x (EuclideanSpace.single i 1)) v + Γ i x (symbol j x v) -
        symbol j x (Γ i x v) = -∑ k, A i k j • symbol k x v)
    (hSymbols : ∀ i, symbol i x = gradedCovectorClifford (a i))
    (hMetric : ∀ i j, (∑ k, a i k * a j k) = gInv i j)
    (hHessian : ∀ i j, annularCovariantHessian Γ A u i j x = gradedCovectorPositive (B i j))
    (hCurvature : ∀ i j, annularConnectionCurvature Γ i j x (u x) = gradedCovectorPositive (R i j)) :
    annularDirac Γ symbol (annularDirac Γ symbol u) x =
      gradedCovectorPositive (-(∑ i, ∑ j, gInv i j • B i j) + positiveCliffordCurvatureContraction a R) := by
  have hClifford (i j : Fin 4) (v : GradedCovectorSpinFiber) :
      symbol i x (symbol j x v) + symbol j x (symbol i x v) = ((-2 : ℝ) * gInv i j) • v := by
    rw [hSymbols i, hSymbols j, ← hMetric i j]
    exact gradedCovectorClifford_anticommute (a i) (a j) v
  rw [annularDiracSquare_eq_traceHessian_add_curvature Γ symbol u A gInv x hu hΓ hSymbol
    hTorsion hCompatible hClifford,
    annularTwistedCurvaturePotential_eq_gradedCovectorPositive Γ symbol u x a R hSymbols hCurvature]
  simp only [hHessian, map_add, map_neg, map_sum, map_smul]

/-- The bound on the realized positive curvature potential is equivalent to
the bound in the full Hilbert pairing used by the chart Green identity. -/
theorem annularTwistedCurvaturePotential_gradedCovectorPositive_bound_iff
    (Γ symbol : Fin 4 → EuclideanFour → GradedCovectorSpinFiber →L[ℝ] GradedCovectorSpinFiber)
    (u : EuclideanFour → GradedCovectorSpinFiber) (x : EuclideanFour)
    (U : Fin 4 → ℍ[ℝ]) (a : Fin 4 → Fin 4 → ℝ) (R : Fin 4 → Fin 4 → Fin 4 → ℍ[ℝ])
    (curvatureNorm C : ℝ)
    (hu : u x = gradedCovectorPositive U)
    (hSymbols : ∀ i, symbol i x = gradedCovectorClifford (a i))
    (hCurvature : ∀ i j, annularConnectionCurvature Γ i j x (u x) = gradedCovectorPositive (R i j)) :
    (|⟪u x, annularTwistedCurvaturePotential Γ symbol u x⟫_ℝ| ≤ C * (curvatureNorm * ‖u x‖ ^ 2)) ↔
      |∑ k, ⟪U k, positiveCliffordCurvatureContraction a R k⟫_ℝ| ≤
        C * (curvatureNorm * ∑ k, Quaternion.normSq (U k)) := by
  rw [annularTwistedCurvaturePotential_eq_gradedCovectorPositive Γ symbol u x a R hSymbols hCurvature,
    hu, gradedCovectorPositive_inner, gradedCovectorPositive_normSq]

end

end FirstOrderTwistor
