import SmoothPoincare.Heights.PrefixSurgeryMatrix
import Mathlib.LinearAlgebra.Dimension.Localization
import Mathlib.Algebra.Exact.Basic
import Mathlib.GroupTheory.QuotientGroup.Basic

/-! # Integral homology inputs of the two normalized prefix orders

The full surgery presentation supplies its actual integral cokernel. For the
zero-matrix comparison filling the two adjoining maps of the pair sequence
vanish. These are different inputs on different manifolds.
-/

noncomputable section

open Matrix Function LinearMap Module

namespace SmoothPoincare.PositiveScalarCuts

/-- The upper marking identifies the integral cokernel of the full ordinary
matrix with a free group of the expected rank. Any nonzero residual entry
would give a nonzero three-row minor, including for a nondiagonal entry. -/
theorem windingZeroBlock_eq_zero_of_integralCokernel {k : ℕ} (d : ℤ) (v : Fin k → ℤ)
    (C : Matrix (Fin k) (Fin k) ℤ)
    (upper : ((Fin 2 ⊕ Fin k → ℤ) ⧸ LinearMap.range (normalizedSurgeryMatrix d v C).mulVecLin)
      ≃ₗ[ℤ] (Fin k → ℤ)) : C = 0 := by
  let L := normalizedSurgeryMatrix d v C
  let D := fromBlocks (windingOneBlock d) 0 0 C
  have hc := upper.finrank_eq
  have hDim := (LinearMap.range L.mulVecLin).finrank_quotient_add_finrank
  have hRank : L.rank = 2 := by
    change Module.finrank ℤ ((Fin 2 ⊕ Fin k → ℤ) ⧸ LinearMap.range L.mulVecLin) = _ at hc
    rw [hc] at hDim
    change _ + L.rank = _ at hDim
    simp only [Module.finrank_pi, Fintype.card_fin, Fintype.card_sum] at hDim
    omega
  have hD : D.rank ≤ 2 := by
    change (fromBlocks (windingOneBlock d) 0 0 C).rank ≤ 2
    rw [← normalizedBlockCongr]
    exact ((rank_mul_le_left _ _).trans (rank_mul_le_right _ _)).trans_eq hRank
  ext i j
  change C i j = 0
  by_contra hij
  let select (r : Fin k) := Sum.map (_root_.id : Fin 2 → Fin 2) (fun _ : Fin 1 => r)
  let minor := D.submatrix (select i) (select j)
  have hm : minor = fromBlocks (windingOneBlock d) 0 0
      (Matrix.of fun _ _ : Fin 1 => C i j) := by
    ext p q
    cases p <;> cases q <;> rfl
  have hu : (windingOneBlock d).det = -1 := by simp [windingOneBlock, Matrix.det_fin_two_of]
  have hDet : minor.det = -C i j := by
    rw [hm, Matrix.det_fromBlocks_zero₂₁, hu, Matrix.det_fin_one]
    simp
  have hMinor := Matrix.rank_of_det_ne_zero (hDet ▸ neg_ne_zero.mpr hij)
  have hBound := (D.rank_submatrix_le (select i) (select j)).trans hD
  change minor.rank ≤ 2 at hBound
  rw [hMinor] at hBound
  norm_num at hBound

/-- With one lower generator its winding-one (or reversed) relation kills
the fundamental group in the additive infinite-cyclic presentation.
The same integer multiplication has zero kernel and full image in the
two-term cellular complex. -/
theorem unitWinding_relation (u : ℤˣ) :
    AddSubgroup.zmultiples (u : ℤ) = ⊤ ∧
      Function.Bijective (fun n : ℤ => (u : ℤ) * n) := by
  constructor
  · apply top_unique
    intro n _
    exact ⟨(↑u⁻¹ : ℤ) * n, by simp [mul_comm, mul_left_comm]⟩
  · exact (u.mulLeft.bijective)

variable {P Q : Type*} [AddCommGroup P] [AddCommGroup Q] [Module ℤ P] [Module ℤ Q]

/-- Exactness of the integral pair sequence between the two zero arrows makes
the specified boundary inclusion an isomorphism. -/
def boundaryInclusionEquiv {B V : Type*} [AddCommGroup B] [AddCommGroup V]
    [Module ℤ B] [Module ℤ V] (inclusion : B →ₗ[ℤ] V)
    (left : Function.Exact (0 : P →ₗ[ℤ] B) inclusion)
    (right : Function.Exact inclusion (0 : V →ₗ[ℤ] Q)) : B ≃ₗ[ℤ] V :=
  LinearEquiv.ofBijective inclusion ⟨by
    apply (LinearMap.ker_eq_bot.mp ?_)
    ext x
    constructor
    · intro hx
      obtain ⟨y, hy⟩ := (left x).mp hx
      simpa using hy.symm
    · intro hx
      simpa using congrArg inclusion (show x = 0 from hx), by
    intro y
    exact (right y).mp rfl⟩

/-- Once the actual disjoint factor spheres form the boundary basis and the
relative three-handle map sends its generators to those spheres, the integral
map killing H₂ is bijective. This uses the given generators on both sides. -/
theorem compressionBoundary_bijective {ι A B V : Type*}
    [AddCommGroup A] [AddCommGroup B] [AddCommGroup V] [Module ℤ A] [Module ℤ B] [Module ℤ V]
    (inclusion : B →ₗ[ℤ] V)
    (left : Function.Exact (0 : P →ₗ[ℤ] B) inclusion)
    (right : Function.Exact inclusion (0 : V →ₗ[ℤ] Q))
    (handles : Basis ι ℤ A) (spheres : Basis ι ℤ B) (boundary : A →ₗ[ℤ] V)
    (attaches : ∀ i, boundary (handles i) = inclusion (spheres i)) : Function.Bijective boundary := by
  let e := boundaryInclusionEquiv inclusion left right
  let changeBasis := handles.equiv spheres (Equiv.refl ι)
  have h : boundary = (changeBasis.trans e).toLinearMap := handles.ext (fun i => by
    change boundary (handles i) = e (changeBasis (handles i))
    rw [show changeBasis (handles i) = spheres i from handles.equiv_apply ..]
    exact attaches i)
  rw [h]
  exact (changeBasis.trans e).bijective

end SmoothPoincare.PositiveScalarCuts
