import Mathlib.LinearAlgebra.Matrix.Rank
import Mathlib.Tactic.FinCases
import Mathlib.Tactic.NormNum

/-! # Integral matrix of a normalized surgery presentation

The ordinary boundary-surgery matrix is ordered by the zero-framed replacement
of the dot, the winding-one component, and then the winding-zero components.
The rank hypothesis for a geometric application comes from the full outgoing
boundary and its surgery homology presentation.
-/

open Matrix

namespace SmoothPoincare.PositiveScalarCuts

/-- The block indexed by the dot and the winding-one component. -/
def windingOneBlock (d : ℤ) : Matrix (Fin 2) (Fin 2) ℤ := !![0, 1; 1, d]

/-- The integral inverse of the leading block. -/
def windingOneBlockInv (d : ℤ) : Matrix (Fin 2) (Fin 2) ℤ := !![-d, 1; 1, 0]

/-- The dot has zero linking with the remaining components. The winding-one
component has linking row `v` with them. -/
def windingLinkBlock {k : ℕ} (v : Fin k → ℤ) : Matrix (Fin 2) (Fin k) ℤ :=
  of fun i j => ![0, v j] i

/-- The full normalized surgery matrix in the fixed index order. -/
def normalizedSurgeryMatrix {k : ℕ} (d : ℤ) (v : Fin k → ℤ)
    (C : Matrix (Fin k) (Fin k) ℤ) : Matrix (Fin 2 ⊕ Fin k) (Fin 2 ⊕ Fin k) ℤ :=
  fromBlocks (windingOneBlock d) (windingLinkBlock v) (windingLinkBlock v)ᵀ C

/-- Upper triangular integral change of basis used for the block congruence. -/
def normalizedBlockChange {k : ℕ} (d : ℤ) (v : Fin k → ℤ) :
    Matrix (Fin 2 ⊕ Fin k) (Fin 2 ⊕ Fin k) ℤ :=
  fromBlocks 1 (-(windingOneBlockInv d * windingLinkBlock v)) 0 1

/-- The change of basis with the sign of the upper-right block reversed. -/
def normalizedBlockChangeInv {k : ℕ} (d : ℤ) (v : Fin k → ℤ) :
    Matrix (Fin 2 ⊕ Fin k) (Fin 2 ⊕ Fin k) ℤ :=
  fromBlocks 1 (windingOneBlockInv d * windingLinkBlock v) 0 1

theorem windingOneBlock_mul_inv (d : ℤ) : windingOneBlock d * windingOneBlockInv d = 1 := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp [windingOneBlock, windingOneBlockInv, Matrix.mul_apply, Fin.sum_univ_two]

theorem windingOneBlock_inv_mul (d : ℤ) : windingOneBlockInv d * windingOneBlock d = 1 := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp [windingOneBlock, windingOneBlockInv, Matrix.mul_apply, Fin.sum_univ_two]

theorem normalizedBlockChange_mul_inv {k : ℕ} (d : ℤ) (v : Fin k → ℤ) :
    normalizedBlockChange d v * normalizedBlockChangeInv d v = 1 := by
  simp [normalizedBlockChange, normalizedBlockChangeInv, fromBlocks_multiply]

theorem normalizedBlockChange_inv_mul {k : ℕ} (d : ℤ) (v : Fin k → ℤ) :
    normalizedBlockChangeInv d v * normalizedBlockChange d v = 1 := by
  simp [normalizedBlockChange, normalizedBlockChangeInv, fromBlocks_multiply]

/-- The Schur correction to the winding-zero block vanishes. -/
theorem windingLinkBlock_schur_eq_zero {k : ℕ} (d : ℤ) (v : Fin k → ℤ) :
    (windingLinkBlock v)ᵀ * windingOneBlockInv d * windingLinkBlock v = 0 := by
  ext i j
  simp [windingLinkBlock, windingOneBlockInv, Matrix.mul_apply, Fin.sum_univ_two]

private theorem windingOneBlockInv_transpose (d : ℤ) :
    (windingOneBlockInv d)ᵀ = windingOneBlockInv d := by
  ext i j
  fin_cases i <;> fin_cases j <;> rfl

/-- Integral congruence of the normalized block matrix with `A ⊕ C`. -/
theorem normalizedBlockCongr {k : ℕ} (d : ℤ) (v : Fin k → ℤ)
    (C : Matrix (Fin k) (Fin k) ℤ) :
    (normalizedBlockChange d v)ᵀ * normalizedSurgeryMatrix d v C * normalizedBlockChange d v =
      fromBlocks (windingOneBlock d) 0 0 C := by
  rw [Matrix.mul_assoc]
  have hRight : normalizedSurgeryMatrix d v C * normalizedBlockChange d v =
      fromBlocks (windingOneBlock d) 0 (windingLinkBlock v)ᵀ C := by
    simp [normalizedSurgeryMatrix, normalizedBlockChange, fromBlocks_multiply, Matrix.mul_neg,
      ← Matrix.mul_assoc, windingOneBlock_mul_inv, windingLinkBlock_schur_eq_zero]
  rw [hRight]
  simp [normalizedBlockChange, fromBlocks_transpose, fromBlocks_multiply, Matrix.transpose_mul,
    windingOneBlockInv_transpose, Matrix.neg_mul, Matrix.mul_assoc, windingOneBlock_inv_mul]

private theorem windingOneBlock_det (d : ℤ) : (windingOneBlock d).det = -1 := by
  simp [windingOneBlock, Matrix.det_fin_two_of]

private theorem normalizedBlockChange_det {k : ℕ} (d : ℤ) (v : Fin k → ℤ) :
    (normalizedBlockChange d v).det = 1 := by
  simp [normalizedBlockChange, det_fromBlocks_zero₂₁]

private theorem normalizedSurgeryMatrix_det {k : ℕ} (d : ℤ) (v : Fin k → ℤ)
    (C : Matrix (Fin k) (Fin k) ℤ) : (normalizedSurgeryMatrix d v C).det = -C.det := by
  have hDet := congrArg Matrix.det (normalizedBlockCongr d v C)
  simpa [Matrix.det_mul, Matrix.det_transpose, normalizedBlockChange_det,
    det_fromBlocks_zero₂₁, windingOneBlock_det] using hDet

/-- In the mixed three-component surgery matrix, the determinant is minus
the framing of the winding-zero component. -/
theorem mixedSurgeryMatrix_det (d : ℤ) (v : Fin 1 → ℤ) (C : Matrix (Fin 1) (Fin 1) ℤ) :
    (normalizedSurgeryMatrix d v C).det = -C 0 0 := by
  rw [normalizedSurgeryMatrix_det, Matrix.det_fin_one]

/-- Rank two of the rational image of the full normalized surgery matrix
forces the entire integral winding-zero block to vanish. -/
theorem windingZeroBlock_eq_zero_of_rank {k : ℕ} (d : ℤ) (v : Fin k → ℤ)
    (C : Matrix (Fin k) (Fin k) ℤ)
    (hRank : ((normalizedSurgeryMatrix d v C).map (Int.castRingHom ℚ)).rank = 2) :
    C = 0 := by
  let D := fromBlocks (windingOneBlock d) 0 0 C
  let castInt := Int.castRingHom ℚ
  have hCongr := congrArg (fun M => M.map castInt) (normalizedBlockCongr d v C)
  rw [Matrix.map_mul, Matrix.map_mul] at hCongr
  change _ = D.map castInt at hCongr
  have hBlockRank : (D.map castInt).rank ≤ 2 := by
    rw [← hCongr]
    exact ((Matrix.rank_mul_le_left _ _).trans (Matrix.rank_mul_le_right _ _)).trans_eq hRank
  ext i j
  change C i j = 0
  by_contra hEntry
  -- Keep the two leading rows and columns, plus row `i` and column `j`.
  let select (x : Fin k) : Fin 2 ⊕ Fin 1 → Fin 2 ⊕ Fin k := Sum.map id (fun _ => x)
  let entry : Matrix (Fin 1) (Fin 1) ℤ := of fun _ _ => C i j
  have hMinor : D.submatrix (select i) (select j) =
      fromBlocks (windingOneBlock d) 0 0 entry := by
    ext a b
    cases a <;> cases b <;> rfl
  have hMinorDet : (D.submatrix (select i) (select j)).det = -C i j := by
    rw [hMinor, det_fromBlocks_zero₂₁, windingOneBlock_det, Matrix.det_fin_one]
    simp [entry]
  have hMinorDetRat : ((D.map castInt).submatrix (select i) (select j)).det ≠ 0 := by
    change (castInt.mapMatrix (D.submatrix (select i) (select j))).det ≠ 0
    rw [← castInt.map_det, hMinorDet]
    simpa [castInt] using hEntry
  have hMinorRank := Matrix.rank_of_det_ne_zero hMinorDetRat
  have hLe := (Matrix.rank_submatrix_le (D.map castInt) (select i) (select j)).trans hBlockRank
  rw [hMinorRank] at hLe
  norm_num at hLe

section Checks

-- With no winding-zero components, the leading block already has rational rank two.
example (d : ℤ) (v : Fin 0 → ℤ) (C : Matrix (Fin 0) (Fin 0) ℤ) : C = 0 := by
  apply windingZeroBlock_eq_zero_of_rank d v C
  have hDet : ((Int.castRingHom ℚ).mapMatrix (normalizedSurgeryMatrix d v C)).det ≠ 0 := by
    rw [← RingHom.map_det, normalizedSurgeryMatrix_det, Matrix.det_isEmpty]
    norm_num
  simpa using Matrix.rank_of_det_ne_zero hDet

-- The mixed fixture retains the nonzero integer linking through the reindexing.
example : (normalizedSurgeryMatrix 4 ![-3] !![(5 : ℤ)]).reindex
    finSumFinEquiv finSumFinEquiv = !![0, 1, 0; 1, 4, -3; 0, -3, 5] := by
  decide

example : (normalizedSurgeryMatrix 4 ![-3] !![(5 : ℤ)]).det = -5 := by
  simpa using mixedSurgeryMatrix_det 4 ![-3] !![(5 : ℤ)]

-- A nonzero off-diagonal winding-zero block is compatible with congruence,
-- but the full rational matrix then has rank four in this fixture.
example : ((normalizedSurgeryMatrix 2 ![3, -7] !![0, 5; 5, 0]).map
      (Int.castRingHom ℚ)).rank = 4 := by
  have hDet : ((Int.castRingHom ℚ).mapMatrix
      (normalizedSurgeryMatrix 2 ![3, -7] !![0, 5; 5, 0])).det ≠ 0 := by
    rw [← RingHom.map_det, normalizedSurgeryMatrix_det, Matrix.det_fin_two_of]
    norm_num
  simpa using Matrix.rank_of_det_ne_zero hDet

end Checks

end SmoothPoincare.PositiveScalarCuts
