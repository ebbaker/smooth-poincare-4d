import FirstOrderTwistor.GeometricChiralBlock
import Mathlib.Analysis.Real.Sqrt
import Mathlib.Basic.Real.Basic
import Mathlib.Data.Matrix.ColumnRowPartitioned
import Mathlib.LinearAlgebra.ExteriorPower.HodgeStar
import Mathlib.LinearAlgebra.Matrix.NonsingularInverse
import Mathlib.LinearAlgebra.Matrix.Trace

/-!
# Self-dual frame changes

The exterior-power Hodge star intertwines a change preserving the metric
pairing and the top-degree volume form. In orthonormal coordinates its
positive eigenspace is represented by an isometric inclusion. An orthogonal
change of coordinates that commutes with the corresponding projection acts
on its trace-free curvature compression by orthogonal conjugation.
-/

open Matrix

namespace FirstOrderTwistor

noncomputable section

section Hodge

open exteriorPower

variable {V : Type*} [AddCommGroup V] [Module ℝ V]

private theorem exteriorBilinForm_map (B : LinearMap.BilinForm ℝ V)
    (f : V →ₗ[ℝ] V) (hf : ∀ x y, B (f x) (f y) = B x y) (k : ℕ)
    (x y : ⋀[ℝ]^k V) :
    B.exteriorPower k (exteriorPower.map k f x) (exteriorPower.map k f y) =
      B.exteriorPower k x y := by
  have h : LinearMap.compl₂ (LinearMap.comp (B.exteriorPower k) (exteriorPower.map k f))
      (exteriorPower.map k f) = B.exteriorPower k := by
    apply exteriorPower.linearMap_ext
    apply AlternatingMap.ext
    intro v
    change ((B.exteriorPower k) (exteriorPower.map k f (ιMulti ℝ k v))).comp
      (exteriorPower.map k f) = (B.exteriorPower k) (ιMulti ℝ k v)
    apply exteriorPower.linearMap_ext
    apply AlternatingMap.ext
    intro w
    change B.exteriorPower k (exteriorPower.map k f (ιMulti ℝ k v))
      (exteriorPower.map k f (ιMulti ℝ k w)) = B.exteriorPower k (ιMulti ℝ k v) (ιMulti ℝ k w)
    simp only [LinearMap.BilinForm.exteriorPower, LinearMap.comp_apply, map_apply_ιMulti,
      pairingDual_ιMulti_ιMulti, Function.comp_apply, hf]
  exact DFunLike.congr_fun (DFunLike.congr_fun h x) y

private theorem exteriorMap_wedge (f : V →ₗ[ℝ] V) {k l : ℕ}
    (x : ⋀[ℝ]^k V) (y : ⋀[ℝ]^l V) :
    exteriorPower.map (k + l) f (wedge ℝ V k l x y) =
      wedge ℝ V k l (exteriorPower.map k f x) (exteriorPower.map l f y) := by
  apply Subtype.ext
  simp only [coe_map, DirectSum.gMulLHom_apply_apply, SetLike.coe_gMul, map_mul]

private theorem exteriorVolume_cast_map (f : V →ₗ[ℝ] V) {p n : ℕ} (h : p = n)
    (vol : ⋀[ℝ]^n V ≃ₗ[ℝ] ℝ) (hv : ∀ z, vol (exteriorPower.map n f z) = vol z)
    (z : ⋀[ℝ]^p V) :
    (h ▸ (vol : (⋀[ℝ]^n V) →ₗ[ℝ] ℝ) : (⋀[ℝ]^p V) →ₗ[ℝ] ℝ)
        (exteriorPower.map p f z) = (h ▸ (vol : (⋀[ℝ]^n V) →ₗ[ℝ] ℝ)) z := by
  subst n
  exact hv z

variable [Module.Finite ℝ V]

/-- An invertible metric-preserving map preserving the given top exterior volume
intertwines Hodge star. For degree two in dimension four, it preserves the
positive eigenspace. The orientation premise is written on the top exterior
power itself, so it also specifies the chosen volume convention. -/
theorem hodgeStar_map_of_volumePreserving
    (B : LinearMap.BilinForm ℝ V) (hB : Function.Bijective B)
    (vol : ⋀[ℝ]^(Module.finrank ℝ V) V ≃ₗ[ℝ] ℝ)
    (f : V ≃ₗ[ℝ] V) (hMetric : ∀ x y, B (f x) (f y) = B x y)
    (hVolume : ∀ z, vol (exteriorPower.map (Module.finrank ℝ V) f.toLinearMap z) = vol z)
    {k l : ℕ} (hkl : k + l = Module.finrank ℝ V) (x : ⋀[ℝ]^k V) :
    exteriorPower.map l f.toLinearMap (hodgeStar B hB vol hkl x) =
      hodgeStar B hB vol hkl (exteriorPower.map k f.toLinearMap x) := by
  have hPair (u : ⋀[ℝ]^k V) (v : ⋀[ℝ]^l V) :
      wedgePairing vol hkl (exteriorPower.map k f.toLinearMap u)
        (exteriorPower.map l f.toLinearMap v) = wedgePairing vol hkl u v := by
    simp only [wedgePairing, LinearMap.compr₂_apply, ← exteriorMap_wedge]
    exact exteriorVolume_cast_map f.toLinearMap hkl vol hVolume _
  have hHodge (u : ⋀[ℝ]^k V) :
      B.exteriorPower l (hodgeStar B hB vol hkl u) = wedgePairing vol hkl u := by
    let dual := LinearEquiv.ofBijective (B.exteriorPower l) (B.bijective_exteriorPower l hB)
    exact dual.apply_symm_apply (wedgePairing vol hkl u)
  apply (B.bijective_exteriorPower l hB).injective
  apply LinearMap.ext
  intro z
  obtain ⟨y, rfl⟩ := exteriorPower.map_surjective (n := l) f.surjective z
  rw [exteriorBilinForm_map B f.toLinearMap hMetric l, hHodge, hHodge, hPair]

end Hodge

section Matrix

variable {ι : Type*} [Fintype ι] [DecidableEq ι]

private theorem traceFree_orthogonalConjugate (A Q : Matrix (Fin 3) (Fin 3) ℝ)
    (hQ : Qᵀ * Q = 1) :
    Q * A * Qᵀ - ((Q * A * Qᵀ).trace / 3) • 1 =
      Q * (A - (A.trace / 3) • 1) * Qᵀ := by
  have hTrace : (Q * A * Qᵀ).trace = A.trace := by
    rw [Matrix.trace_mul_cycle, hQ, Matrix.one_mul]
  have hInv : Q * Qᵀ = 1 := mul_eq_one_comm.mp hQ
  rw [hTrace, Matrix.mul_sub, Matrix.sub_mul, Matrix.mul_smul, smul_mul, Matrix.mul_one, hInv]

/-- Compress an operator and its orthogonal pullback to the same isometrically
included three-dimensional space. Commutation with its orthogonal projection
is the matrix input for preservation of the self-dual space. -/
theorem traceFreeCompression_conjugate (U : Matrix ι (Fin 3) ℝ)
    (L R : Matrix ι ι ℝ)
    (hU : Uᵀ * U = 1) (hL : Lᵀ * L = 1)
    (hPreserves : L * (U * Uᵀ) = (U * Uᵀ) * L) :
    let old := Uᵀ * R * U
    let new := Uᵀ * (Lᵀ * R * L) * U
    ∃ Q : Matrix (Fin 3) (Fin 3) ℝ, Qᵀ * Q = 1 ∧
      new - (new.trace / 3) • 1 = Q * (old - (old.trace / 3) • 1) * Qᵀ := by
  let A := Uᵀ * L * U
  have hInvariant : L * U = U * A := by
    calc
      L * U = (L * (U * Uᵀ)) * U := by
        simp only [Matrix.mul_assoc, hU, Matrix.mul_one]
      _ = ((U * Uᵀ) * L) * U := by rw [hPreserves]
      _ = U * A := by simp only [A, Matrix.mul_assoc]
  have hOrthogonal : Aᵀ * A = 1 := by
    calc
      Aᵀ * A = (U * A)ᵀ * (U * A) := by
        simp only [Matrix.transpose_mul, Matrix.mul_assoc]
        rw [← Matrix.mul_assoc Uᵀ U A, hU, Matrix.one_mul]
      _ = (L * U)ᵀ * (L * U) := by rw [hInvariant]
      _ = 1 := by
        simp only [Matrix.transpose_mul, Matrix.mul_assoc]
        rw [← Matrix.mul_assoc Lᵀ L U, hL, Matrix.one_mul, hU]
  have hCompress : Uᵀ * (Lᵀ * R * L) * U =
      Aᵀ * (Uᵀ * R * U) * A := by
    calc
      _ = (L * U)ᵀ * R * (L * U) := by
        simp only [Matrix.transpose_mul, Matrix.mul_assoc]
      _ = (U * A)ᵀ * R * (U * A) := by rw [hInvariant]
      _ = _ := by simp only [Matrix.transpose_mul, Matrix.mul_assoc]
  have hQ : Aᵀᵀ * Aᵀ = 1 := by
    rw [Matrix.transpose_transpose]
    exact mul_eq_one_comm.mp hOrthogonal
  dsimp only
  refine ⟨Aᵀ, hQ, ?_⟩
  rw [hCompress]
  simpa only [Matrix.transpose_transpose] using traceFree_orthogonalConjugate (Uᵀ * R * U) Aᵀ hQ

end Matrix

section Coordinates

local notation "WedgeIndex" => (Fin 3 ⊕ Fin 3)
local notation "ThreeMatrix" => (Matrix (Fin 3) (Fin 3) ℝ)

/-- Columns of the normalized self-dual basis in the ordered complementary
wedge coordinates `(01, 02, 03; 23, 31, 12)`. -/
def selfDualWedgeInclusion : Matrix WedgeIndex (Fin 3) ℝ :=
  (1 / Real.sqrt 2 : ℝ) • Matrix.fromRows (1 : ThreeMatrix) 1

private theorem selfDualNormalization_sq :
    (1 / Real.sqrt 2 : ℝ) * (1 / Real.sqrt 2) = 1 / 2 := by
  rw [div_mul_div_comm, one_mul, ← pow_two, Real.sq_sqrt (by norm_num : (0 : ℝ) ≤ 2)]

theorem selfDualWedgeInclusion_orthogonal :
    selfDualWedgeInclusionᵀ * selfDualWedgeInclusion = 1 := by
  rw [selfDualWedgeInclusion, transpose_smul, Matrix.transpose_fromRows, transpose_one,
    smul_mul, Matrix.mul_smul, Matrix.fromCols_mul_fromRows, Matrix.one_mul, smul_smul,
    selfDualNormalization_sq]
  rw [← two_smul ℝ (1 : ThreeMatrix), smul_smul]
  norm_num

/-- Curvature matrix indexed by the same ordered wedge pairs as the positive
block. Each entry uses the input tensor's existing ordered-slot convention. -/
def curvatureWedgeMatrix (T : CurvatureFrameTensor) : Matrix WedgeIndex WedgeIndex ℝ :=
  let coefficients (p q : Fin 3 → Fin 4 × Fin 4) : ThreeMatrix :=
    Matrix.of fun i j ↦ T (p i).1 (p i).2 (q j).1 (q j).2
  Matrix.fromBlocks (coefficients selfDualFirstWedge selfDualFirstWedge)
    (coefficients selfDualFirstWedge selfDualSecondWedge)
    (coefficients selfDualSecondWedge selfDualFirstWedge)
    (coefficients selfDualSecondWedge selfDualSecondWedge)

theorem selfDualCurvatureBlock_eq_compression (T : CurvatureFrameTensor) :
    selfDualCurvatureBlock T =
      selfDualWedgeInclusionᵀ * curvatureWedgeMatrix T * selfDualWedgeInclusion := by
  simp only [selfDualWedgeInclusion, transpose_smul, Matrix.transpose_fromRows, transpose_one,
    smul_mul, Matrix.mul_smul, smul_smul, selfDualNormalization_sq]
  unfold curvatureWedgeMatrix
  rw [Matrix.fromCols_mul_fromBlocks, Matrix.fromCols_mul_fromRows]
  simp only [Matrix.one_mul, Matrix.mul_one]
  ext i j
  simp only [selfDualCurvatureBlock, Matrix.smul_apply, Matrix.add_apply, Matrix.of_apply,
    smul_eq_mul]
  ring

/-- If the lifted orthogonal frame change gives the supplied curvature
conjugacy and preserves the positive wedge space, it conjugates the actual
trace-free block defined by the four-slot coefficients. -/
theorem traceFreeSelfDualBlock_conjugate (T T' : CurvatureFrameTensor)
    (L : Matrix WedgeIndex WedgeIndex ℝ) (hL : Lᵀ * L = 1)
    (hPreserves : L * (selfDualWedgeInclusion * selfDualWedgeInclusionᵀ) =
      (selfDualWedgeInclusion * selfDualWedgeInclusionᵀ) * L)
    (hFrame : curvatureWedgeMatrix T' = Lᵀ * curvatureWedgeMatrix T * L) :
    ∃ Q : ThreeMatrix, Qᵀ * Q = 1 ∧
      traceFreeChiralBlock (selfDualCurvatureBlock T') =
        Q * traceFreeChiralBlock (selfDualCurvatureBlock T) * Qᵀ := by
  simp only [traceFreeChiralBlock, selfDualCurvatureBlock_eq_compression, hFrame]
  exact traceFreeCompression_conjugate selfDualWedgeInclusion L (curvatureWedgeMatrix T)
    selfDualWedgeInclusion_orthogonal hL hPreserves

end Coordinates

end

end FirstOrderTwistor
