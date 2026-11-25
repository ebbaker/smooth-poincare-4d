import FirstOrderTwistor.SpinCliffordCompatibility
import Mathlib.LinearAlgebra.Matrix.NonsingularInverse

/-!
# Inverse metric in a moving orthonormal frame

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex
assistance. The serving model and effort are unavailable.

The columns of U are the moving frame in the fixed Euclidean coordinate
directions and V is its local inverse. The inverse-metric coefficients
are the entries of U Uᵀ. The differential equation uses the tangent
connection matrix with output row and input column.
-/

open Topology
open scoped BigOperators Matrix.Norms.Elementwise

namespace FirstOrderTwistor

private abbrev FrameMatrix := Matrix (Fin 4) (Fin 4) ℝ

/-- Inverse-metric coefficient from the columns of an orthonormal frame. -/
def inverseMetricFromFrame (U : EuclideanFour → Matrix (Fin 4) (Fin 4) ℝ)
    (j k : Fin 4) (x : EuclideanFour) : ℝ :=
  ∑ a, U x j a * U x k a

/-- The inverse metric coefficients are the entries of the frame matrix
times its transpose. -/
theorem inverseMetricFromFrame_eq_matrix (U : EuclideanFour → Matrix (Fin 4) (Fin 4) ℝ)
    (j k : Fin 4) (x : EuclideanFour) :
    inverseMetricFromFrame U j k x = (U x * (U x).transpose) j k := by
  simp only [inverseMetricFromFrame, Matrix.mul_apply, Matrix.transpose_apply]

/-- For a supplied metric Gram matrix and orthonormal frame, the frame
product is the ordinary matrix inverse. A left inverse of the square
frame matrix suffices. -/
theorem frameGram_inverse_eq (G U V : Matrix (Fin 4) (Fin 4) ℝ)
    (hOrth : U.transpose * G * U = 1) (hVU : V * U = 1) :
    G⁻¹ = U * U.transpose := by
  have hUV := mul_eq_one_comm.mp hVU
  have hUTG : U.transpose * G = V := calc
    _ = (U.transpose * G * U) * V := by simp only [mul_assoc, hUV, mul_one]
    _ = _ := by rw [hOrth, one_mul]
  apply Matrix.inv_eq_left_inv
  rw [mul_assoc, hUTG, hUV]

/-- The individual frame coefficients agree with the entries of the inverse
of the marked chart Gram matrix. -/
theorem inverseMetricFromFrame_eq_gramInverse
    {U : EuclideanFour → Matrix (Fin 4) (Fin 4) ℝ} {x : EuclideanFour}
    {G V : Matrix (Fin 4) (Fin 4) ℝ}
    (hOrth : (U x).transpose * G * U x = 1) (hVU : V * U x = 1) (j k : Fin 4) :
    inverseMetricFromFrame U j k x = (G⁻¹) j k := by
  rw [inverseMetricFromFrame_eq_matrix, frameGram_inverse_eq G (U x) V hOrth hVU]

private def matrixEntryCLM (j a : Fin 4) : FrameMatrix →L[ℝ] ℝ :=
  (ContinuousLinearMap.proj (R := ℝ) (φ := fun _ : Fin 4 => ℝ) a).comp
    (ContinuousLinearMap.proj (R := ℝ) (φ := fun _ : Fin 4 => Fin 4 → ℝ) j)

/-- A C¹ moving frame supplies C¹ inverse-metric coefficients on the chart. -/
theorem inverseMetricFromFrame_contDiffOn
    {U : EuclideanFour → Matrix (Fin 4) (Fin 4) ℝ} {Ω : Set EuclideanFour}
    (hU : ContDiffOn ℝ 1 U Ω) (j k : Fin 4) :
    ContDiffOn ℝ 1 (inverseMetricFromFrame U j k) Ω := by
  have hEntry (i a : Fin 4) : ContDiffOn ℝ 1 (fun y => U y i a) Ω :=
    (matrixEntryCLM i a).contDiff.comp_contDiffOn hU
  unfold inverseMetricFromFrame
  exact ContDiffOn.sum (s := Finset.univ) fun a _ => (hEntry j a).mul (hEntry k a)

private theorem frameMatrixEntry_hasFDerivAt
    {U : EuclideanFour → FrameMatrix} {x : EuclideanFour}
    (hU : DifferentiableAt ℝ U x) (j a : Fin 4) :
    HasFDerivAt (fun y => U y j a) (matrixEntryCLM j a ∘L fderiv ℝ U x) x :=
  (matrixEntryCLM j a).hasFDerivAt.comp x hU.hasFDerivAt

private theorem inverseMetricFromFrame_fderiv
    {U : EuclideanFour → FrameMatrix} {x : EuclideanFour}
    (hU : DifferentiableAt ℝ U x) (w : EuclideanFour) (j k : Fin 4) :
    fderiv ℝ (inverseMetricFromFrame U j k) x w =
      (U x * (fderiv ℝ U x w).transpose + (fderiv ℝ U x w) * (U x).transpose) j k := by
  unfold inverseMetricFromFrame
  rw [fderiv_fun_sum (u := Finset.univ) (A := fun a y => U y j a * U y k a)
    (fun a _ => (frameMatrixEntry_hasFDerivAt hU j a).differentiableAt.mul
      (frameMatrixEntry_hasFDerivAt hU k a).differentiableAt)]
  simp only [sum_apply, Matrix.add_apply, Matrix.mul_apply, Matrix.transpose_apply]
  rw [← Finset.sum_add_distrib]
  apply Finset.sum_congr rfl
  intro a _
  rw [fderiv_fun_mul (frameMatrixEntry_hasFDerivAt hU j a).differentiableAt
    (frameMatrixEntry_hasFDerivAt hU k a).differentiableAt,
    (frameMatrixEntry_hasFDerivAt hU j a).fderiv, (frameMatrixEntry_hasFDerivAt hU k a).fderiv]
  simp only [add_apply, smul_apply, smul_eq_mul]
  change U x j a * (fderiv ℝ U x w) k a + U x k a * (fderiv ℝ U x w) j a = _
  ring

/-- The inverse-metric connection equation follows by differentiating the
frame product. The skew moving-frame connection cancels with its transpose. -/
theorem inverseMetricFromFrame_derivative_of_movingFrame
    {A : Fin 4 → EuclideanFour → Matrix (Fin 4) (Fin 4) ℝ}
    {U V : EuclideanFour → Matrix (Fin 4) (Fin 4) ℝ} {x : EuclideanFour}
    (hU : DifferentiableAt ℝ U x) (hV : DifferentiableAt ℝ V x)
    (hInv : (fun y => V y * U y) =ᶠ[𝓝 x] fun _ => 1)
    (i j k : Fin 4)
    (hSkew : ∀ a b, spinNormalGaugeConnection A U V i x b a =
      -spinNormalGaugeConnection A U V i x a b) :
    euclideanPartial (inverseMetricFromFrame U j k) i x =
      -(∑ l, (A i x j l * inverseMetricFromFrame U l k x +
        A i x k l * inverseMetricFromFrame U j l x)) := by
  let w : EuclideanFour := EuclideanSpace.single i 1
  let Ω := spinNormalGaugeConnection A U V i x
  let Q := U x * (U x).transpose
  have hUV : U x * V x = 1 := mul_eq_one_comm.mp hInv.self_of_nhds
  have hFrame := (spinMovingFrame_derivatives (A := A) hU hV hInv hUV i).1
  have hDU : fderiv ℝ U x w = U x * Ω - A i x * U x := eq_sub_of_add_eq hFrame
  have hTranspose : Ω.transpose = -Ω := Matrix.ext fun a b => hSkew a b
  have hMatrix :
      U x * (fderiv ℝ U x w).transpose + (fderiv ℝ U x w) * (U x).transpose =
        -(A i x * Q + Q * (A i x).transpose) := by
    rw [hDU, Matrix.transpose_sub, Matrix.transpose_mul, Matrix.transpose_mul, hTranspose]
    dsimp only [Q]
    noncomm_ring
  change fderiv ℝ (inverseMetricFromFrame U j k) x w = _
  rw [inverseMetricFromFrame_fderiv hU, hMatrix]
  simp only [inverseMetricFromFrame_eq_matrix, Finset.sum_add_distrib,
    Matrix.neg_apply, Matrix.add_apply, Matrix.mul_apply, Matrix.transpose_apply]
  change -((∑ l, A i x j l * Q l k) + ∑ l, Q j l * A i x k l) =
    -((∑ l, A i x j l * Q l k) + ∑ l, A i x k l * Q j l)
  simp only [mul_comm]

open DifferentialGeometry
open scoped Manifold ContDiff

/-- The inverse-metric derivative hypothesis of the annular Weitzenböck
estimate for a supplied moving frame in the chart of the actual metric. -/
theorem annularInverseMetricConnection_of_movingFrame
    {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ EuclideanFour H}
    [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
    (g : SmoothRiemannianMetric I M) (p : M) {Ω : Set EuclideanFour}
    (U V : EuclideanFour → Matrix (Fin 4) (Fin 4) ℝ)
    (hU : ∀ x ∈ Ω, DifferentiableAt ℝ U x)
    (hV : ∀ x ∈ Ω, DifferentiableAt ℝ V x)
    (hInv : ∀ x ∈ Ω, (fun y => V y * U y) =ᶠ[𝓝 x] fun _ => 1)
    (hSkew : ∀ x ∈ Ω, ∀ i a b,
      spinNormalGaugeConnection (leviCivitaCoordinateMatrices g p) U V i x b a =
        -spinNormalGaugeConnection (leviCivitaCoordinateMatrices g p) U V i x a b) :
    ∀ x ∈ Ω, ∀ i j k, euclideanPartial (inverseMetricFromFrame U j k) i x =
      -(∑ l, (leviCivitaCoordinateMatrices g p i x j l * inverseMetricFromFrame U l k x +
        leviCivitaCoordinateMatrices g p i x k l * inverseMetricFromFrame U j l x)) :=
  fun x hx i j k => inverseMetricFromFrame_derivative_of_movingFrame
    (hU x hx) (hV x hx) (hInv x hx) i j k (hSkew x hx i)

end FirstOrderTwistor
