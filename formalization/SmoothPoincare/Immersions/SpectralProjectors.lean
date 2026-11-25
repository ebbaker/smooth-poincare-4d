import Mathlib.Analysis.Matrix.Normed
import Mathlib.Analysis.SpecialFunctions.Sqrt
import Mathlib.LinearAlgebra.Trace
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Linarith

/-! # Smooth projectors for the balanced shape spectrum -/

open Matrix
open scoped ContDiff Matrix.Norms.Frobenius Topology

namespace SmoothPoincare

local notation "Mat4" => Matrix (Fin 4) (Fin 4) ℝ

/-- The two choices `σ = 1` and `σ = -1` project to the corresponding
eigenspaces when the shape field has eigenvalues `±a`, `a > 0`. -/
noncomputable def shapeSpectralProjector (σ a : ℝ) (A : Mat4) : Mat4 :=
  (1 / 2 : ℝ) • (1 + (σ / a) • A)

private theorem spectralCoefficient {σ a : ℝ} (hσ : σ ^ 2 = 1) (ha : a ≠ 0) :
    (σ * a) * (σ / a) = 1 := by
  calc
    (σ * a) * (σ / a) = σ ^ 2 := by field_simp
    _ = 1 := hσ

/-- The projector commutes with the shape, which acts on its range by `σ * a`. -/
theorem shapeSpectralProjector_mul {σ a : ℝ} {A : Mat4}
    (hσ : σ ^ 2 = 1) (ha : a ≠ 0) (hSquare : A * A = a ^ 2 • (1 : Mat4)) :
    A * shapeSpectralProjector σ a A = (σ * a) • shapeSpectralProjector σ a A ∧
    shapeSpectralProjector σ a A * A = (σ * a) • shapeSpectralProjector σ a A := by
  have hCoeff : (σ / a) * a ^ 2 = σ * a := by field_simp
  have hLeft : A * shapeSpectralProjector σ a A = (σ * a) • shapeSpectralProjector σ a A := by
    calc
      _ = (1 / 2 : ℝ) • (A + (σ * a) • (1 : Mat4)) := by
        simp only [shapeSpectralProjector, mul_smul_comm, mul_add, mul_one, hSquare,
          smul_smul, hCoeff]
      _ = _ := by
        rw [shapeSpectralProjector, smul_comm (σ * a) (1 / 2 : ℝ), smul_add (σ * a),
          smul_smul, spectralCoefficient hσ ha, one_smul, add_comm]
  refine ⟨hLeft, ?_⟩
  calc
    _ = A * shapeSpectralProjector σ a A := by
      simp only [shapeSpectralProjector, smul_mul_assoc, mul_smul_comm, add_mul, mul_add,
        one_mul, mul_one]
    _ = _ := hLeft

theorem shapeSpectralProjector_idempotent {σ a : ℝ} {A : Mat4}
    (hσ : σ ^ 2 = 1) (ha : a ≠ 0) (hSquare : A * A = a ^ 2 • (1 : Mat4)) :
    shapeSpectralProjector σ a A * shapeSpectralProjector σ a A = shapeSpectralProjector σ a A := by
  let P := shapeSpectralProjector σ a A
  have hRight : P * A = (σ * a) • P := (shapeSpectralProjector_mul hσ ha hSquare).2
  have hCoeff : (σ / a) * (σ * a) = 1 := by
    rw [mul_comm, spectralCoefficient hσ ha]
  change P * ((1 / 2 : ℝ) • (1 + (σ / a) • A)) = P
  rw [mul_smul_comm, mul_add, mul_one, mul_smul_comm, hRight, smul_smul, hCoeff, one_smul,
    ← two_smul ℝ P, smul_smul]
  norm_num

theorem shapeSpectralProjectors_complement (σ a : ℝ) (A : Mat4) :
    shapeSpectralProjector σ a A + shapeSpectralProjector (-σ) a A = 1 := by
  ext i j
  simp only [shapeSpectralProjector, Matrix.add_apply, Matrix.smul_apply, smul_eq_mul, neg_div]
  ring

theorem shapeSpectralProjectors_orthogonal {σ a : ℝ} {A : Mat4}
    (hσ : σ ^ 2 = 1) (ha : a ≠ 0) (hSquare : A * A = a ^ 2 • (1 : Mat4)) :
    shapeSpectralProjector σ a A * shapeSpectralProjector (-σ) a A = 0 ∧
      shapeSpectralProjector (-σ) a A * shapeSpectralProjector σ a A = 0 := by
  let P := shapeSpectralProjector σ a A
  have hComp : shapeSpectralProjector (-σ) a A = 1 - P :=
    eq_sub_of_add_eq (by simpa only [add_comm] using shapeSpectralProjectors_complement σ a A)
  have hPP : P * P = P := shapeSpectralProjector_idempotent hσ ha hSquare
  change P * shapeSpectralProjector (-σ) a A = 0 ∧ shapeSpectralProjector (-σ) a A * P = 0
  rw [hComp, mul_sub, sub_mul, mul_one, one_mul, hPP, sub_self]
  exact ⟨rfl, rfl⟩

theorem shapeSpectralProjector_isSymm {A : Mat4} (hSymm : A.IsSymm) (σ a : ℝ) :
    (shapeSpectralProjector σ a A).IsSymm := by
  change (shapeSpectralProjector σ a A)ᵀ = _
  simp [shapeSpectralProjector, Matrix.transpose_smul, hSymm.eq]

/-- The algebraic range consists of exactly the `σ * a` eigenvectors,
including zero. -/
theorem shapeSpectralProjector_mulVec_eq_self_iff {σ a : ℝ} {A : Mat4}
    (hσ : σ ^ 2 = 1) (ha : a ≠ 0) (hSquare : A * A = a ^ 2 • (1 : Mat4))
    (v : Fin 4 → ℝ) :
    shapeSpectralProjector σ a A *ᵥ v = v ↔ A *ᵥ v = (σ * a) • v := by
  constructor
  · intro hv
    have h := congrArg (fun B : Mat4 => B *ᵥ v) (shapeSpectralProjector_mul hσ ha hSquare).1
    simpa only [← mulVec_mulVec, smul_mulVec, hv] using h
  · intro hv
    simp only [shapeSpectralProjector, smul_mulVec, add_mulVec, one_mulVec, hv,
      smul_smul, mul_comm (σ / a) (σ * a), spectralCoefficient hσ ha, one_smul,
      ← two_smul ℝ v]
    norm_num [smul_smul]

/-- Trace zero fixes multiplicity two for each of the complementary eigenspaces. -/
theorem shapeSpectralProjector_rank {σ a : ℝ} {A : Mat4}
    (hσ : σ ^ 2 = 1) (ha : a ≠ 0) (hSquare : A * A = a ^ 2 • (1 : Mat4))
    (hTrace : A.trace = 0) :
    Module.finrank ℝ (LinearMap.range (shapeSpectralProjector σ a A).toLin') = 2 := by
  let P := shapeSpectralProjector σ a A
  have hIdempotent : IsIdempotentElem P.toLin' := by
    change P.toLin' ∘ₗ P.toLin' = P.toLin'
    rw [← Matrix.toLin'_mul, shapeSpectralProjector_idempotent hσ ha hSquare]
  have hProj := (LinearMap.isProj_range_iff_isIdempotentElem P.toLin').mpr hIdempotent
  have hTraceP : P.trace = 2 := by
    norm_num [P, shapeSpectralProjector, Matrix.trace_smul, Matrix.trace_one, hTrace]
  have h := hProj.trace
  rw [Matrix.trace_toLin'_eq, hTraceP] at h
  exact_mod_cast h.symm

/-- A pointwise orthogonal principal frame with the balanced spectrum gives
the square and trace identities in the original frame. -/
theorem balancedShape_square_and_trace (a : ℝ) {A Q : Mat4}
    (hQQt : Q * Qᵀ = 1) (hQtQ : Qᵀ * Q = 1)
    (hSpectrum : A = Q * diagonal ![-a, -a, a, a] * Qᵀ) :
    A * A = a ^ 2 • (1 : Mat4) ∧ A.trace = 0 := by
  let D := diagonal ![-a, -a, a, a]
  change A = Q * D * Qᵀ at hSpectrum
  have hSquareD : D * D = a ^ 2 • (1 : Mat4) := by
    dsimp only [D]
    rw [Matrix.diagonal_mul_diagonal]
    ext i j
    by_cases h : i = j
    · subst j
      fin_cases i <;> simp [pow_two]
    · simp [h]
  rw [hSpectrum]
  constructor
  · calc
      _ = (Q * D) * (Qᵀ * Q) * (D * Qᵀ) := by simp only [mul_assoc]
      _ = Q * (D * D) * Qᵀ := by rw [hQtQ, mul_one]; simp only [mul_assoc]
      _ = _ := by rw [hSquareD, mul_smul_comm, mul_one, smul_mul_assoc, hQQt]
  · rw [Matrix.trace_mul_comm (Q * D) Qᵀ, ← mul_assoc, hQtQ, one_mul]
    simp [D, Matrix.trace_diagonal, Fin.sum_univ_four]

section Smooth

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]

/-- Intrinsic magnitude on the nonzero balanced locus. -/
noncomputable def shapeSpectralMagnitude (A : Mat4) : ℝ := Real.sqrt ((A * A).trace / 4)

private theorem traceShapeSquare_div_four {A : Mat4} {a : ℝ}
    (hSquare : A * A = a ^ 2 • (1 : Mat4)) : (A * A).trace / 4 = a ^ 2 := by
  norm_num [hSquare, Matrix.trace_smul, Matrix.trace_one, smul_eq_mul]

theorem shapeSpectralMagnitude_eq {A : Mat4} {a : ℝ} (ha : 0 ≤ a)
    (hSquare : A * A = a ^ 2 • (1 : Mat4)) : shapeSpectralMagnitude A = a := by
  rw [shapeSpectralMagnitude, traceShapeSquare_div_four hSquare, Real.sqrt_sq ha]

/-- The magnitude recovered from the trace is smooth on the nonzero locus. -/
theorem shapeSpectralMagnitude_contDiffOn {U : Set E} {A : E → Mat4} {a : E → ℝ}
    (hA : ContDiffOn ℝ ∞ A U) (ha : ∀ x ∈ U, 0 < a x)
    (hSquare : ∀ x ∈ U, A x * A x = (a x) ^ 2 • (1 : Mat4)) :
    ContDiffOn ℝ ∞ (fun x => shapeSpectralMagnitude (A x)) U := by
  let tr : Mat4 →L[ℝ] ℝ := LinearMap.toContinuousLinearMap
    (Matrix.traceLinearMap (Fin 4) ℝ ℝ)
  have hTr : ContDiffOn ℝ ∞ (fun x => (A x * A x).trace) U :=
    tr.contDiff.comp_contDiffOn (hA.mul hA)
  refine (hTr.div_const 4).sqrt fun x hx => ?_
  rw [traceShapeSquare_div_four (hSquare x hx)]
  exact (pow_pos (ha x hx) 2).ne'

private theorem positiveShapeMagnitude_contDiffOn {U : Set E} {A : E → Mat4} {a : E → ℝ}
    (hA : ContDiffOn ℝ ∞ A U) (ha : ∀ x ∈ U, 0 < a x)
    (hSquare : ∀ x ∈ U, A x * A x = (a x) ^ 2 • (1 : Mat4)) : ContDiffOn ℝ ∞ a U :=
  (shapeSpectralMagnitude_contDiffOn hA ha hSquare).congr fun x hx =>
    (shapeSpectralMagnitude_eq (ha x hx).le (hSquare x hx)).symm

theorem shapeSpectralProjector_contDiffOn {U : Set E} {A : E → Mat4} {a : E → ℝ}
    (hA : ContDiffOn ℝ ∞ A U) (ha : ∀ x ∈ U, 0 < a x)
    (hSquare : ∀ x ∈ U, A x * A x = (a x) ^ 2 • (1 : Mat4)) (σ : ℝ) :
    ContDiffOn ℝ ∞ (fun x => shapeSpectralProjector σ (a x) (A x)) U := by
  have hScale : ContDiffOn ℝ ∞ (fun x => σ / a x) U :=
    contDiffOn_const.div (positiveShapeMagnitude_contDiffOn hA ha hSquare) fun x hx => (ha x hx).ne'
  exact (contDiffOn_const.add (hScale.smul hA)).const_smul _

/-- The same-sign diagonal block of the actual derivative is the derivative
of its eigenvalue times the projector. The spectral equation holds throughout
the open neighborhood, so it can be differentiated at `x`. -/
theorem shapeSpectralProjector_fderiv {U : Set E} {A : E → Mat4} {a : E → ℝ}
    (hU : IsOpen U) (hA : ContDiffOn ℝ ∞ A U)
    (ha : ∀ y ∈ U, 0 < a y) (hSquare : ∀ y ∈ U, A y * A y = (a y) ^ 2 • (1 : Mat4))
    {σ : ℝ} (hσ : σ ^ 2 = 1) {x : E} (hx : x ∈ U) (v : E) :
    let P := shapeSpectralProjector σ (a x) (A x)
    P * fderiv ℝ A x v * P = (σ * fderiv ℝ a x v) • P := by
  let P := fun y => shapeSpectralProjector σ (a y) (A y)
  let eigenvalue := fun y => σ * a y
  have haNe (y : E) (hy : y ∈ U) : a y ≠ 0 := (ha y hy).ne'
  have hSmooth := positiveShapeMagnitude_contDiffOn hA ha hSquare
  have hSmoothP := shapeSpectralProjector_contDiffOn hA ha hSquare σ
  have hNear := hU.mem_nhds hx
  have hDa := ((hSmooth.differentiableOn (by simp)) x hx).differentiableAt hNear
  have hDA := ((hA.differentiableOn (by simp)) x hx).differentiableAt hNear
  have hDP := ((hSmoothP.differentiableOn (by simp)) x hx).differentiableAt hNear
  have hDEigenvalue : HasFDerivAt eigenvalue (σ • fderiv ℝ a x) x := hDa.hasFDerivAt.const_smul σ
  have hEq : (fun y => A y * P y) =ᶠ[𝓝 x] (fun y => eigenvalue y • P y) :=
    Filter.mem_of_superset hNear fun y hy => (shapeSpectralProjector_mul hσ (haNe y hy) (hSquare y hy)).1
  have hD := ((hDA.hasFDerivAt.mul' hDP.hasFDerivAt).congr_of_eventuallyEq hEq.symm).unique
    (hDEigenvalue.smul hDP.hasFDerivAt)
  let DA := fderiv ℝ A x v
  let DP := fderiv ℝ P x v
  let dEigenvalue := σ * fderiv ℝ a x v
  have hEval : A x * DP + DA * P x = eigenvalue x • DP + dEigenvalue • P x :=
    congrArg (fun D : E →L[ℝ] Mat4 => D v) hD
  have hRight : P x * A x = eigenvalue x • P x :=
    (shapeSpectralProjector_mul hσ (haNe x hx) (hSquare x hx)).2
  have hId : P x * P x = P x := shapeSpectralProjector_idempotent hσ (haNe x hx) (hSquare x hx)
  change P x * DA * P x = dEigenvalue • P x
  apply add_left_cancel (a := eigenvalue x • (P x * DP))
  calc
    _ = P x * (A x * DP + DA * P x) := by
      rw [mul_add, ← mul_assoc (P x) (A x), hRight, smul_mul_assoc, ← mul_assoc (P x) DA]
    _ = P x * (eigenvalue x • DP + dEigenvalue • P x) := by rw [hEval]
    _ = _ := by rw [mul_add, mul_smul_comm, mul_smul_comm, hId]

/-- In a local frame the connection contributes a commutator to the shape
derivative. Its same-sign diagonal block vanishes for every connection matrix. -/
theorem shapeSpectralProjector_covariantDerivative {U : Set E} {A : E → Mat4} {a : E → ℝ}
    (hU : IsOpen U) (hA : ContDiffOn ℝ ∞ A U)
    (ha : ∀ y ∈ U, 0 < a y) (hSquare : ∀ y ∈ U, A y * A y = (a y) ^ 2 • (1 : Mat4))
    {σ : ℝ} (hσ : σ ^ 2 = 1) {x : E} (hx : x ∈ U) (v : E) (Γ : Mat4) :
    let P := shapeSpectralProjector σ (a x) (A x)
    P * (fderiv ℝ A x v + (Γ * A x - A x * Γ)) * P = (σ * fderiv ℝ a x v) • P := by
  let P := shapeSpectralProjector σ (a x) (A x)
  obtain ⟨hLeft, hRight⟩ := shapeSpectralProjector_mul hσ (ha x hx).ne' (hSquare x hx)
  change A x * P = (σ * a x) • P at hLeft
  change P * A x = (σ * a x) • P at hRight
  change P * (fderiv ℝ A x v + (Γ * A x - A x * Γ)) * P = _
  have hComm : P * (Γ * A x - A x * Γ) * P = 0 := by
    rw [mul_sub, sub_mul, ← mul_assoc P Γ, mul_assoc (P * Γ), hLeft, mul_smul_comm,
      ← mul_assoc P (A x), hRight, smul_mul_assoc, smul_mul_assoc, sub_self]
  rw [mul_add, add_mul, hComm, add_zero]
  exact shapeSpectralProjector_fderiv hU hA ha hSquare hσ hx v

/-- The same-sign components of the covariant derivative in a frame adapted
at `x`. The frame need only diagonalize the shape at the base point. -/
theorem shapeCovariantDerivative_sameSign_entry {U : Set E} {A : E → Mat4} {a : E → ℝ}
    (hU : IsOpen U) (hA : ContDiffOn ℝ ∞ A U)
    (ha : ∀ y ∈ U, 0 < a y) (hSquare : ∀ y ∈ U, A y * A y = (a y) ^ 2 • (1 : Mat4))
    {σ : ℝ} (hσ : σ ^ 2 = 1) {x : E} (hx : x ∈ U) (v : E) (Γ : Mat4)
    (signs : Fin 4 → ℝ) (hDiagonal : A x = diagonal (fun i => signs i * a x))
    {j k : Fin 4} (hj : signs j = σ) (hk : signs k = σ) :
    (fderiv ℝ A x v + (Γ * A x - A x * Γ)) j k =
      if j = k then σ * fderiv ℝ a x v else 0 := by
  let d (i : Fin 4) := (1 / 2 : ℝ) * (1 + (σ / a x) * (signs i * a x))
  have hProjector : shapeSpectralProjector σ (a x) (A x) = diagonal d := by
    ext i l
    by_cases h : i = l
    · subst l
      simp [shapeSpectralProjector, hDiagonal, d]
    · simp [shapeSpectralProjector, hDiagonal, h]
  have hUnit (i : Fin 4) (hi : signs i = σ) : d i = 1 := by
    dsimp [d]
    rw [hi, mul_comm (σ / a x) (σ * a x), spectralCoefficient hσ (ha x hx).ne']
    norm_num
  have hEntry := congrArg (fun B : Mat4 => B j k)
    (shapeSpectralProjector_covariantDerivative hU hA ha hSquare hσ hx v Γ)
  rw [hProjector, Matrix.mul_diagonal, Matrix.diagonal_mul] at hEntry
  simp only [hUnit j hj, hUnit k hk, one_mul, mul_one, Matrix.smul_apply, smul_eq_mul,
    Matrix.diagonal_apply, mul_ite, mul_zero] at hEntry
  exact hEntry

end Smooth
end SmoothPoincare
