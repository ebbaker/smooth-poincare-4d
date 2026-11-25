import FirstOrderTwistor.SpinAnnularGreen
import Mathlib.Analysis.Calculus.FDeriv.Symmetric
import Mathlib.Tactic.Module

/-!
# The covector-twisted Dirac square in arbitrary coordinates

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance.
The serving model and effort are unavailable. This calculation uses the actual
Fréchet derivatives of a field in one supplied full Clifford-module trivialization.
The symbols have raised indices. The two Christoffel lower slots are symmetric.
-/

namespace FirstOrderTwistor

open Set
open scoped BigOperators

noncomputable section

variable {F : Type*} [NormedAddCommGroup F] [InnerProductSpace ℝ F]

private def coordinateDirection (i : Fin 4) : EuclideanFour := EuclideanSpace.single i 1

/-- The ordered covariant Hessian, with the coordinate-direction slot
transformed by the Christoffel coefficient with lower slots `i, j`. -/
def annularCovariantHessian (Γ : Fin 4 → EuclideanFour → F →L[ℝ] F)
    (A : Fin 4 → Fin 4 → Fin 4 → ℝ)
    (u : EuclideanFour → F) (i j : Fin 4) (x : EuclideanFour) : F :=
  annularCovariantDerivative Γ (annularCovariantDerivative Γ u j) i x -
    ∑ k, A i j k • annularCovariantDerivative Γ u k x

/-- Curvature of the supplied fibre connection in commuting coordinates. -/
def annularConnectionCurvature (Γ : Fin 4 → EuclideanFour → F →L[ℝ] F)
    (i j : Fin 4) (x : EuclideanFour) : F →L[ℝ] F :=
  fderiv ℝ (Γ j) x (EuclideanSpace.single i 1) -
    fderiv ℝ (Γ i) x (EuclideanSpace.single j 1) +
    ((Γ i x).comp (Γ j x) - (Γ j x).comp (Γ i x))

/-- The Clifford contraction of the curvature in the full fibre connection.
The factor `1/2` accompanies the sum over both ordered curvature slots. -/
def annularTwistedCurvaturePotential (Γ symbol : Fin 4 → EuclideanFour → F →L[ℝ] F)
    (u : EuclideanFour → F) (x : EuclideanFour) : F :=
  (1 / 2 : ℝ) • ∑ i, ∑ j, symbol i x (symbol j x (annularConnectionCurvature Γ i j x (u x)))

/-- Smooth coefficient and field data make the local curvature potential continuous. -/
theorem annularTwistedCurvaturePotential_continuousOn {Ω : Set EuclideanFour}
    {Γ symbol : Fin 4 → EuclideanFour → F →L[ℝ] F} {u : EuclideanFour → F}
    (hΩ : IsOpen Ω) (hΓ : ∀ i, ContDiffOn ℝ 1 (Γ i) Ω)
    (hSymbol : ∀ i, ContinuousOn (symbol i) Ω) (hu : ContinuousOn u Ω) :
    ContinuousOn (annularTwistedCurvaturePotential Γ symbol u) Ω := by
  have hPartial (i j : Fin 4) :
      ContinuousOn (fun x => (fderiv ℝ (Γ j) x (EuclideanSpace.single i 1)) (u x)) Ω :=
    (((hΓ j).continuousOn_fderiv_of_isOpen hΩ le_rfl).clm_apply continuousOn_const).clm_apply hu
  have hProduct (i j : Fin 4) : ContinuousOn (fun x => Γ i x (Γ j x (u x))) Ω :=
    (hΓ i).continuousOn.clm_apply ((hΓ j).continuousOn.clm_apply hu)
  have hCurvature (i j : Fin 4) :
      ContinuousOn (fun x => annularConnectionCurvature Γ i j x (u x)) Ω := by
    refine (((hPartial i j).sub (hPartial j i)).add ((hProduct i j).sub (hProduct j i))).congr ?_
    intro x _
    simp only [annularConnectionCurvature, add_apply, sub_apply, ContinuousLinearMap.comp_apply,
      Pi.add_apply, Pi.sub_apply]
  unfold annularTwistedCurvaturePotential
  refine (continuousOn_finsetSum _ fun i _ => continuousOn_finsetSum _ fun j _ => ?_).const_smul _
  exact (hSymbol i).clm_apply ((hSymbol j).clm_apply (hCurvature i j))

/-- One derivative of the coordinate Dirac field follows from two field
derivatives and one derivative of its two coefficient families. -/
theorem annularDirac_contDiffOn {Ω : Set EuclideanFour}
    {Γ symbol : Fin 4 → EuclideanFour → F →L[ℝ] F} {u : EuclideanFour → F}
    (hΩ : IsOpen Ω) (hΓ : ∀ i, ContDiffOn ℝ 1 (Γ i) Ω)
    (hSymbol : ∀ i, ContDiffOn ℝ 1 (symbol i) Ω) (hu : ContDiffOn ℝ 2 u Ω) :
    ContDiffOn ℝ 1 (annularDirac Γ symbol u) Ω := by
  have hD : ContDiffOn ℝ 1 (fderiv ℝ u) Ω := hu.fderiv_of_isOpen hΩ (by norm_num)
  have hu₁ : ContDiffOn ℝ 1 u Ω := hu.of_le (by norm_num)
  unfold annularDirac
  apply ContDiffOn.sum (s := Finset.univ)
  intro i _
  exact (hSymbol i).clm_apply ((hD.clm_apply contDiffOn_const).add ((hΓ i).clm_apply hu₁))

private theorem annularPartial_differentiableAt {u : EuclideanFour → F}
    {x : EuclideanFour} (hu : ContDiffAt ℝ 2 u x) (j : Fin 4) :
    DifferentiableAt ℝ (fun y => fderiv ℝ u y (coordinateDirection j)) x :=
  ((hu.fderiv_right (m := 1) (by norm_num)).clm_apply contDiffAt_const).differentiableAt one_ne_zero

private theorem annularCovariantDerivative_differentiableAt
    {Γ : Fin 4 → EuclideanFour → F →L[ℝ] F} {u : EuclideanFour → F}
    {x : EuclideanFour} (hu : ContDiffAt ℝ 2 u x)
    (hΓ : ∀ j, DifferentiableAt ℝ (Γ j) x) (j : Fin 4) :
    DifferentiableAt ℝ (annularCovariantDerivative Γ u j) x :=
  (annularPartial_differentiableAt hu j).add ((hΓ j).clm_apply (hu.differentiableAt (by norm_num)))

private theorem annularOrderedCovariantDerivative_expand
    {Γ : Fin 4 → EuclideanFour → F →L[ℝ] F} {u : EuclideanFour → F}
    {x : EuclideanFour} (hu : ContDiffAt ℝ 2 u x) (hΓ : ∀ j, DifferentiableAt ℝ (Γ j) x)
    (i j : Fin 4) :
    annularCovariantDerivative Γ (annularCovariantDerivative Γ u j) i x =
      fderiv ℝ (fun y => fderiv ℝ u y (coordinateDirection j)) x (coordinateDirection i) +
      ((fderiv ℝ (Γ j) x (coordinateDirection i)) (u x) + Γ j x (fderiv ℝ u x (coordinateDirection i))) +
      Γ i x (fderiv ℝ u x (coordinateDirection j)) + Γ i x (Γ j x (u x)) := by
  have hd := hu.differentiableAt (by norm_num : (2 : WithTop ℕ∞) ≠ 0)
  change fderiv ℝ (fun y => fderiv ℝ u y (coordinateDirection j) + Γ j y (u y)) x
    (coordinateDirection i) + Γ i x (fderiv ℝ u x (coordinateDirection j) + Γ j x (u x)) = _
  rw [fderiv_fun_add (annularPartial_differentiableAt hu j) ((hΓ j).clm_apply hd),
    fderiv_clm_apply (hΓ j) hd]
  simp only [add_apply, ContinuousLinearMap.comp_apply, ContinuousLinearMap.flip_apply, map_add]
  abel

private theorem annularPartial_commute {u : EuclideanFour → F}
    {x : EuclideanFour} (hu : ContDiffAt ℝ 2 u x) (i j : Fin 4) :
    fderiv ℝ (fun y => fderiv ℝ u y (coordinateDirection j)) x (coordinateDirection i) =
      fderiv ℝ (fun y => fderiv ℝ u y (coordinateDirection i)) x (coordinateDirection j) := by
  have hd := (hu.fderiv_right (m := 1) (by norm_num)).differentiableAt one_ne_zero
  have hs := hu.isSymmSndFDerivAt (by simp)
  rw [fderiv_clm_apply hd (differentiableAt_const (coordinateDirection j)),
    fderiv_clm_apply hd (differentiableAt_const (coordinateDirection i))]
  simpa using hs.eq (coordinateDirection i) (coordinateDirection j)

/-- Alternating the actual ordered Hessian gives connection curvature.
The correction in the covector index cancels by torsion-freeness. -/
theorem annularCovariantHessian_commutator
    {Γ : Fin 4 → EuclideanFour → F →L[ℝ] F} {u : EuclideanFour → F}
    {x : EuclideanFour} (A : Fin 4 → Fin 4 → Fin 4 → ℝ)
    (hu : ContDiffAt ℝ 2 u x) (hΓ : ∀ j, DifferentiableAt ℝ (Γ j) x)
    (hTorsion : ∀ i j k, A i j k = A j i k) (i j : Fin 4) :
    annularCovariantHessian Γ A u i j x - annularCovariantHessian Γ A u j i x =
      annularConnectionCurvature Γ i j x (u x) := by
  rw [annularCovariantHessian, annularCovariantHessian, annularOrderedCovariantDerivative_expand hu hΓ,
    annularOrderedCovariantDerivative_expand hu hΓ, annularPartial_commute hu i j]
  have hSym : (∑ k, A i j k • annularCovariantDerivative Γ u k x) =
      ∑ k, A j i k • annularCovariantDerivative Γ u k x :=
    Finset.sum_congr rfl fun k _ => by rw [hTorsion i j k]
  rw [hSym]
  simp only [annularConnectionCurvature, add_apply, sub_apply, ContinuousLinearMap.comp_apply,
    coordinateDirection]
  abel

private theorem annularCovariantDerivative_dirac
    {Γ symbol : Fin 4 → EuclideanFour → F →L[ℝ] F} {u : EuclideanFour → F}
    {x : EuclideanFour} (A : Fin 4 → Fin 4 → Fin 4 → ℝ)
    (hu : ContDiffAt ℝ 2 u x) (hΓ : ∀ j, DifferentiableAt ℝ (Γ j) x)
    (hSymbol : ∀ j, DifferentiableAt ℝ (symbol j) x)
    (hCompatible : ∀ i j a,
      (fderiv ℝ (symbol j) x (EuclideanSpace.single i 1)) a +
        Γ i x (symbol j x a) - symbol j x (Γ i x a) = -∑ k, A i k j • symbol k x a)
    (i : Fin 4) :
    annularCovariantDerivative Γ (annularDirac Γ symbol u) i x =
      ∑ j, symbol j x (annularCovariantHessian Γ A u i j x) := by
  let v := annularCovariantDerivative Γ u
  have hv (j : Fin 4) : DifferentiableAt ℝ (v j) x := annularCovariantDerivative_differentiableAt hu hΓ j
  have hExpand :
      annularCovariantDerivative Γ (annularDirac Γ symbol u) i x =
        (∑ j, symbol j x (annularCovariantDerivative Γ (v j) i x)) -
        ∑ j, ∑ k, A i k j • symbol k x (v j x) := by
    change fderiv ℝ (fun y => ∑ j, symbol j y (v j y)) x (EuclideanSpace.single i 1) +
      Γ i x (∑ j, symbol j x (v j x)) = _
    rw [fderiv_fun_sum (u := Finset.univ) (A := fun j y => symbol j y (v j y))
      (fun j _ => (hSymbol j).clm_apply (hv j)), sum_apply, map_sum,
      ← Finset.sum_add_distrib, ← Finset.sum_sub_distrib]
    apply Finset.sum_congr rfl
    intro j _
    rw [fderiv_clm_apply (hSymbol j) (hv j)]
    simp only [add_apply, ContinuousLinearMap.comp_apply, ContinuousLinearMap.flip_apply,
      annularCovariantDerivative, map_add]
    have h := hCompatible i j (v j x)
    rw [sub_eq_add_neg, ← h]
    abel
  rw [hExpand]
  simp only [annularCovariantHessian, map_sub, map_sum, map_smul, Finset.sum_sub_distrib]
  congr 1
  exact Finset.sum_comm

private theorem annularCliffordDoubleSum_split
    (C : Fin 4 → F →L[ℝ] F) (gInv : Fin 4 → Fin 4 → ℝ)
    (hClifford : ∀ i j a, C i (C j a) + C j (C i a) = ((-2 : ℝ) * gInv i j) • a)
    (B : Fin 4 → Fin 4 → F) :
    (∑ i, ∑ j, C i (C j (B i j))) =
      -(∑ i, ∑ j, gInv i j • B i j) +
        (1 / 2 : ℝ) • ∑ i, ∑ j, C i (C j (B i j - B j i)) := by
  let O : F := ∑ i, ∑ j, C i (C j (B i j))
  let S : F := ∑ i, ∑ j, C i (C j (B j i))
  have hFlip : S = ∑ i, ∑ j, C j (C i (B i j)) := Finset.sum_comm
  have hPair : O + S = (-2 : ℝ) • ∑ i, ∑ j, gInv i j • B i j := by
    rw [hFlip]
    simp only [O, ← Finset.sum_add_distrib, hClifford, mul_smul, ← Finset.smul_sum]
  have hAlt : O - S = ∑ i, ∑ j, C i (C j (B i j - B j i)) := by
    simp only [O, S, map_sub, Finset.sum_sub_distrib]
  change O = -(∑ i, ∑ j, gInv i j • B i j) + _
  calc
    O = (1 / 2 : ℝ) • ((O + S) + (O - S)) := by module
    _ = _ := by rw [hPair, hAlt]; module

/-- The square of the actual coordinate Dirac operator equals minus the
inverse-metric trace of the covariant Hessian plus the contracted curvature.
The raising of the Clifford symbol appears in both the compatibility and
anticommutation equations. There is no normal-coordinate hypothesis. -/
theorem annularDiracSquare_eq_traceHessian_add_curvature
    (Γ symbol : Fin 4 → EuclideanFour → F →L[ℝ] F) (u : EuclideanFour → F)
    (A : Fin 4 → Fin 4 → Fin 4 → ℝ) (gInv : Fin 4 → Fin 4 → ℝ) (x : EuclideanFour)
    (hu : ContDiffAt ℝ 2 u x) (hΓ : ∀ j, DifferentiableAt ℝ (Γ j) x)
    (hSymbol : ∀ j, DifferentiableAt ℝ (symbol j) x)
    (hTorsion : ∀ i j k, A i j k = A j i k)
    (hCompatible : ∀ i j a,
      (fderiv ℝ (symbol j) x (EuclideanSpace.single i 1)) a +
        Γ i x (symbol j x a) - symbol j x (Γ i x a) = -∑ k, A i k j • symbol k x a)
    (hClifford : ∀ i j a,
      symbol i x (symbol j x a) + symbol j x (symbol i x a) = ((-2 : ℝ) * gInv i j) • a) :
    annularDirac Γ symbol (annularDirac Γ symbol u) x =
      -(∑ i, ∑ j, gInv i j • annularCovariantHessian Γ A u i j x) +
        annularTwistedCurvaturePotential Γ symbol u x := by
  have hProduct :
      annularDirac Γ symbol (annularDirac Γ symbol u) x =
        ∑ i, ∑ j, symbol i x (symbol j x (annularCovariantHessian Γ A u i j x)) := by
    change (∑ i, symbol i x (annularCovariantDerivative Γ (annularDirac Γ symbol u) i x)) = _
    simp only [annularCovariantDerivative_dirac A hu hΓ hSymbol hCompatible, map_sum]
  rw [hProduct, annularCliffordDoubleSum_split (fun i => symbol i x) gInv hClifford]
  simp only [annularCovariantHessian_commutator A hu hΓ hTorsion, annularTwistedCurvaturePotential]

end
end FirstOrderTwistor
