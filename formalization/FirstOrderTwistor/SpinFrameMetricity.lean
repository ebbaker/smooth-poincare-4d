import FirstOrderTwistor.SpinNormalGauge
import Mathlib.Tactic.NoncommRing

/-!
# Metricity in a moving spin frame

FOT-E18ab, 25 November 2026, prepared for Edward B. Baker III with OpenAI
Codex assistance. Serving model and effort are unavailable. Checkout `fc60509`.

The columns of `U` are an orthonormal frame for the coordinate metric `G`.
The matrix `Aᵢ` differentiates the coordinate frame in direction `i`.
The proof uses differentiability of the local orthonormality relation and
the coordinate metricity equation, so it applies away from normal centers.
-/

open Filter Topology
open scoped Matrix Matrix.Norms.Elementwise Quaternion RealInnerProductSpace

namespace FirstOrderTwistor

private abbrev FrameMatrix := Matrix (Fin 4) (Fin 4) ℝ

private noncomputable def frameTranspose : FrameMatrix →L[ℝ] FrameMatrix :=
  (Matrix.transposeLinearEquiv (Fin 4) (Fin 4) ℝ ℝ).toLinearMap.toContinuousLinearMap

private theorem frameProduct_differentiableAt {F G : EuclideanFour → FrameMatrix}
    {x : EuclideanFour} (hF : DifferentiableAt ℝ F x) (hG : DifferentiableAt ℝ G x) :
    DifferentiableAt ℝ (fun y => F y * G y) x := by
  let product : FrameMatrix →L[ℝ] FrameMatrix →L[ℝ] FrameMatrix :=
    ((LinearMap.toContinuousLinearMap :
        (FrameMatrix →ₗ[ℝ] FrameMatrix) ≃ₗ[ℝ] FrameMatrix →L[ℝ] FrameMatrix).toLinearMap.comp
      (LinearMap.mul ℝ FrameMatrix)).toContinuousLinearMap
  have hProduct : HasFDerivAt (⇑product) product (F x) := product.hasFDerivAt
  have hPartial : HasFDerivAt (fun y => product (F y)) (product ∘L fderiv ℝ F x) x :=
    hProduct.comp x hF.hasFDerivAt
  exact (hPartial.clm_apply hG.hasFDerivAt).differentiableAt

/-- Differentiating the metric orthonormality relation gives a skew matrix
for the connection in the moving frame, in each coordinate direction. -/
theorem spinNormalGaugeConnection_transpose_eq_neg_of_orthonormal
    {A : Fin 4 → EuclideanFour → FrameMatrix}
    {U V G : EuclideanFour → FrameMatrix} {x : EuclideanFour}
    (hU : DifferentiableAt ℝ U x) (hG : DifferentiableAt ℝ G x)
    (hOrtho : (fun y => (U y)ᵀ * G y * U y) =ᶠ[𝓝 x] (fun _ => 1))
    (hInverse : (fun y => V y * U y) =ᶠ[𝓝 x] (fun _ => 1))
    (i : Fin 4)
    (hMetric : fderiv ℝ G x (EuclideanSpace.single i 1) = (A i x)ᵀ * G x + G x * A i x) :
    (spinNormalGaugeConnection A U V i x)ᵀ = -spinNormalGaugeConnection A U V i x := by
  let w := EuclideanSpace.single i (1 : ℝ)
  let dU := fderiv ℝ U x w
  let dG := fderiv ℝ G x w
  let D := A i x * U x + dU
  have hOrthoAt : (U x)ᵀ * G x * U x = 1 := hOrtho.eq_of_nhds
  have hVU : V x * U x = 1 := hInverse.eq_of_nhds
  have hUV : U x * V x = 1 := Matrix.mul_eq_one_comm.mp hVU
  have hUG : (U x)ᵀ * G x = V x := calc
    _ = ((U x)ᵀ * G x) * (U x * V x) := by rw [hUV, mul_one]
    _ = V x := by rw [← mul_assoc, hOrthoAt, one_mul]
  have hVtUt : (V x)ᵀ * (U x)ᵀ = 1 := by
    rw [← Matrix.transpose_mul, hUV, Matrix.transpose_one]
  have hGU : G x * U x = (V x)ᵀ := calc
    _ = ((V x)ᵀ * (U x)ᵀ) * (G x * U x) := by rw [hVtUt, one_mul]
    _ = (V x)ᵀ * ((U x)ᵀ * G x * U x) := by noncomm_ring
    _ = (V x)ᵀ := by rw [hOrthoAt, mul_one]
  have hTranspose : DifferentiableAt ℝ (fun y => (U y)ᵀ) x :=
    frameTranspose.differentiableAt.comp x hU
  have hTransposeDeriv : fderiv ℝ (fun y => (U y)ᵀ) x w = (dU)ᵀ := by
    have h := (frameTranspose.hasFDerivAt.comp x hU.hasFDerivAt).fderiv
    exact DFunLike.congr_fun h w
  have hOrtho' : (fun y => (U y)ᵀ * (G y * U y)) =ᶠ[𝓝 x] (fun _ => 1) :=
    hOrtho.mono fun _ h => by simpa only [mul_assoc] using h
  have hDOrtho := DFunLike.congr_fun (hOrtho'.fderiv_eq (𝕜 := ℝ)) w
  rw [spinFrameMatrix_fderiv_mul_apply hTranspose (frameProduct_differentiableAt hG hU),
    spinFrameMatrix_fderiv_mul_apply hG hU, hTransposeDeriv] at hDOrtho
  have hDOrtho' : (U x)ᵀ * (G x * dU + dG * U x) + (dU)ᵀ * (G x * U x) = 0 := by
    simpa only [fderiv_const_apply, ContinuousLinearMap.zero_apply] using hDOrtho
  have hCompat : dG = (A i x)ᵀ * G x + G x * A i x := hMetric
  have hSkew : (D)ᵀ * (G x * U x) + ((U x)ᵀ * G x) * D = 0 := calc
    _ = (U x)ᵀ * (G x * dU + dG * U x) + (dU)ᵀ * (G x * U x) := by
      rw [hCompat]
      dsimp only [D]
      simp only [Matrix.transpose_add, Matrix.transpose_mul]
      noncomm_ring
    _ = 0 := hDOrtho'
  have hConnection : spinNormalGaugeConnection A U V i x = V x * D := by
    simp only [spinNormalGaugeConnection, D, mul_add]
    rfl
  rw [hGU, hUG, ← Matrix.transpose_mul, ← hConnection] at hSkew
  exact eq_neg_of_add_eq_zero_left hSkew

/-- Entrywise form of metricity for the connection-matrix spin lift. -/
theorem spinNormalGaugeConnection_skew_of_orthonormal
    {A : Fin 4 → EuclideanFour → FrameMatrix}
    {U V G : EuclideanFour → FrameMatrix} {x : EuclideanFour}
    (hU : DifferentiableAt ℝ U x) (hG : DifferentiableAt ℝ G x)
    (hOrtho : (fun y => (U y)ᵀ * G y * U y) =ᶠ[𝓝 x] (fun _ => 1))
    (hInverse : (fun y => V y * U y) =ᶠ[𝓝 x] (fun _ => 1))
    (hMetric : ∀ i, fderiv ℝ G x (EuclideanSpace.single i 1) = (A i x)ᵀ * G x + G x * A i x)
    (i a b : Fin 4) :
    spinNormalGaugeConnection A U V i x b a = -spinNormalGaugeConnection A U V i x a b := by
  exact congrArg (fun C : FrameMatrix => C a b)
    (spinNormalGaugeConnection_transpose_eq_neg_of_orthonormal hU hG hOrtho hInverse i (hMetric i))

end FirstOrderTwistor
