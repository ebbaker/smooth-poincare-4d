import FirstOrderTwistor.SpinTwistedSquare
import FirstOrderTwistor.SpinNormalGauge

/-!
# Infinitesimal Clifford compatibility in a moving frame

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex
assistance. The serving model and effort are unavailable.

The matrix of a tangent connection records its output in the row index.
The coordinate columns of the oriented orthonormal frame form U and its
inverse is V. The raised Clifford coefficients use rows of U. Clifford
multiplication by a coordinate tangent vector uses columns of V. The
moving-frame connection is assumed skew, as required in the chosen metric
orthonormal spin trivialization.
-/

open Topology
open scoped BigOperators Matrix.Norms.Elementwise Quaternion

namespace FirstOrderTwistor

noncomputable section

private abbrev FrameMat := Matrix (Fin 4) (Fin 4) ℝ

/-- Clifford multiplication in a frame is linear in the real frame
components of the vector or metrically identified covector. -/
def frameCliffordCombination (c : Fin 4 → ℍ[ℝ]) : (Fin 4 → ℝ) →ₗ[ℝ] ℍ[ℝ] where
  toFun v := ∑ a, v a • c a
  map_add' v w := by simp [Pi.add_apply, add_smul, Finset.sum_add_distrib]
  map_smul' t v := by
    simp only [RingHom.id_apply, Pi.smul_apply, smul_eq_mul, mul_smul, Finset.smul_sum]

/-- The two spin lifts intertwine the positive-to-negative Clifford action
with the infinitesimal tangent representation. -/
theorem positiveFrameClifford_commutator (Ω : FrameMat)
    (hΩ : ∀ a b, Ω b a = -Ω a b) (v : Fin 4 → ℝ) :
    negativeSpinConnectionLift Ω * frameCliffordCombination positiveCliffordVector v -
      frameCliffordCombination positiveCliffordVector v * spinConnectionLift Ω =
      frameCliffordCombination positiveCliffordVector (Ω.mulVec v) := by
  have hDiag (a : Fin 4) : Ω a a = 0 := by linarith [hΩ a a]
  apply Quaternion.ext <;>
    norm_num [frameCliffordCombination, positiveCliffordVector, spinUnit,
      negativeSpinConnectionLift, spinConnectionLift, Matrix.mulVec, dotProduct, Fin.sum_univ_four,
      hDiag, hΩ 0 1, hΩ 0 2, hΩ 0 3, hΩ 1 2, hΩ 3 1, hΩ 2 3,
      Quaternion.re_mul, Quaternion.imI_mul, Quaternion.imJ_mul, Quaternion.imK_mul, smul_eq_mul] <;> ring

/-- The corresponding negative-to-positive Clifford intertwining identity. -/
theorem negativeFrameClifford_commutator (Ω : FrameMat)
    (hΩ : ∀ a b, Ω b a = -Ω a b) (v : Fin 4 → ℝ) :
    spinConnectionLift Ω * frameCliffordCombination negativeCliffordVector v -
      frameCliffordCombination negativeCliffordVector v * negativeSpinConnectionLift Ω =
      frameCliffordCombination negativeCliffordVector (Ω.mulVec v) := by
  have hDiag (a : Fin 4) : Ω a a = 0 := by linarith [hΩ a a]
  apply Quaternion.ext <;>
    norm_num [frameCliffordCombination, negativeCliffordVector, spinUnit,
      negativeSpinConnectionLift, spinConnectionLift, Matrix.mulVec, dotProduct, Fin.sum_univ_four,
      hDiag, hΩ 0 1, hΩ 0 2, hΩ 0 3, hΩ 1 2, hΩ 3 1, hΩ 2 3,
      Quaternion.re_mul, Quaternion.imI_mul, Quaternion.imJ_mul, Quaternion.imK_mul, smul_eq_mul] <;> ring

/-- The raised coordinate Clifford symbol, acting by left multiplication in
the chosen chiral direction. It uses a row of the frame matrix. -/
def raisedFrameClifford (c : Fin 4 → ℍ[ℝ]) (U : EuclideanFour → FrameMat)
    (j : Fin 4) (x : EuclideanFour) : ℍ[ℝ] :=
  frameCliffordCombination c (U x j)

/-- Clifford multiplication by the coordinate tangent vector with index j,
expressed using its components in the orthonormal frame. -/
def lowerFrameClifford (c : Fin 4 → ℍ[ℝ]) (V : EuclideanFour → FrameMat)
    (j : Fin 4) (x : EuclideanFour) : ℍ[ℝ] :=
  frameCliffordCombination c (fun a => V x a j)

private theorem fderiv_frameClifford_entries
    (c : Fin 4 → ℍ[ℝ]) (entries : Fin 4 → Fin 4 × Fin 4)
    {U : EuclideanFour → FrameMat} {x : EuclideanFour}
    (hU : DifferentiableAt ℝ U x) (w : EuclideanFour) :
    fderiv ℝ (fun y => frameCliffordCombination c (fun a => U y (entries a).1 (entries a).2)) x w =
      frameCliffordCombination c (fun a => (fderiv ℝ U x w) (entries a).1 (entries a).2) := by
  let select : FrameMat →L[ℝ] (Fin 4 → ℝ) :=
    ContinuousLinearMap.pi fun a =>
      (ContinuousLinearMap.proj (R := ℝ) (φ := fun _ : Fin 4 => ℝ) (entries a).2).comp
        (ContinuousLinearMap.proj (R := ℝ) (φ := fun _ : Fin 4 => Fin 4 → ℝ) (entries a).1)
  let L := (frameCliffordCombination c).toContinuousLinearMap ∘L select
  change fderiv ℝ (L ∘ U) x w = L (fderiv ℝ U x w)
  have h := (L.hasFDerivAt.comp x hU.hasFDerivAt).fderiv
  rw [h]
  rfl

private theorem raisedFrameClifford_covariant
    (c : Fin 4 → ℍ[ℝ]) {U : EuclideanFour → FrameMat} {x : EuclideanFour}
    (hU : DifferentiableAt ℝ U x) (w : EuclideanFour) (A Ω : FrameMat)
    (hΩ : ∀ a b, Ω b a = -Ω a b)
    (hFrame : fderiv ℝ U x w + A * U x = U x * Ω)
    (qIn qOut : ℍ[ℝ])
    (hRep : ∀ v, qOut * frameCliffordCombination c v - frameCliffordCombination c v * qIn =
      frameCliffordCombination c (Ω.mulVec v)) (j : Fin 4) :
    fderiv ℝ (raisedFrameClifford c U j) x w +
      qOut * raisedFrameClifford c U j x - raisedFrameClifford c U j x * qIn =
      -∑ k, A j k • raisedFrameClifford c U k x := by
  have hRow : (fun a => (fderiv ℝ U x w) j a) + Ω.mulVec (U x j) =
      -(∑ k, A j k • U x k) := by
    funext a
    have hEntry := congrArg (fun T : FrameMat => T j a) hFrame
    simp only [Matrix.add_apply, Matrix.mul_apply] at hEntry
    have hSkew : (∑ b, U x j b * Ω b a) = -(Ω.mulVec (U x j)) a := by
      simp only [Matrix.mulVec, dotProduct, hΩ a _, mul_neg, Finset.sum_neg_distrib, mul_comm]
    rw [hSkew] at hEntry
    simp only [Fin.sum_univ_four, Pi.add_apply, Pi.neg_apply, Pi.smul_apply, smul_eq_mul] at hEntry ⊢
    linarith only [hEntry]
  unfold raisedFrameClifford
  rw [fderiv_frameClifford_entries c (fun a => (j, a)) hU w, add_sub_assoc, hRep,
    ← map_add, hRow, map_neg, map_sum]
  simp only [map_smul]

private theorem lowerFrameClifford_covariant
    (c : Fin 4 → ℍ[ℝ]) {V : EuclideanFour → FrameMat} {x : EuclideanFour}
    (hV : DifferentiableAt ℝ V x) (w : EuclideanFour) (A Ω : FrameMat)
    (hFrame : fderiv ℝ V x w + Ω * V x = V x * A)
    (qIn qOut : ℍ[ℝ])
    (hRep : ∀ v, qOut * frameCliffordCombination c v - frameCliffordCombination c v * qIn =
      frameCliffordCombination c (Ω.mulVec v)) (j : Fin 4) :
    fderiv ℝ (lowerFrameClifford c V j) x w +
      qOut * lowerFrameClifford c V j x - lowerFrameClifford c V j x * qIn =
      ∑ k, A k j • lowerFrameClifford c V k x := by
  have hCol : (fun a => (fderiv ℝ V x w) a j) + Ω.mulVec (fun a => V x a j) =
      ∑ k, A k j • (fun a => V x a k) := by
    funext a
    have hEntry := congrArg (fun T : FrameMat => T a j) hFrame
    simpa only [Matrix.add_apply, Matrix.mul_apply, Matrix.mulVec, dotProduct, Pi.add_apply,
      Fin.sum_univ_four, Pi.smul_apply, smul_eq_mul, mul_comm] using hEntry
  unfold lowerFrameClifford
  rw [fderiv_frameClifford_entries c (fun a => (a, j)) hV w, add_sub_assoc, hRep,
    ← map_add, hCol, map_sum]
  simp only [map_smul]

/-- The moving-frame relation for the frame and its inverse follows from
the actual derivative of the inverse identity in a neighborhood.
The pointwise connection matrix uses the direction i in the coordinate basis. -/
theorem spinMovingFrame_derivatives
    {A : Fin 4 → EuclideanFour → FrameMat} {U V : EuclideanFour → FrameMat} {x : EuclideanFour}
    (hU : DifferentiableAt ℝ U x) (hV : DifferentiableAt ℝ V x)
    (hInv : (fun y => V y * U y) =ᶠ[𝓝 x] fun _ => 1) (hUV : U x * V x = 1) (i : Fin 4) :
    let w : EuclideanFour := EuclideanSpace.single i 1
    let Ω := spinNormalGaugeConnection A U V i x
    fderiv ℝ U x w + A i x * U x = U x * Ω ∧
      fderiv ℝ V x w + Ω * V x = V x * A i x := by
  let w : EuclideanFour := EuclideanSpace.single i 1
  let Ω := spinNormalGaugeConnection A U V i x
  have hProduct : fderiv ℝ (fun y => V y * U y) x = 0 := by
    erw [hInv.fderiv_eq]
    simp
  have hDV := spinFrameMatrix_fderiv_mul_apply hV hU w
  erw [hProduct] at hDV
  have hDVU : fderiv ℝ V x w * U x = -(V x * fderiv ℝ U x w) :=
    eq_neg_of_add_eq_zero_right (by simpa using hDV.symm)
  change fderiv ℝ U x w + A i x * U x = U x * Ω ∧
    fderiv ℝ V x w + Ω * V x = V x * A i x
  constructor
  · simp only [Ω, spinNormalGaugeConnection, Matrix.mul_add, ← mul_assoc, hUV, one_mul, add_comm, w]
  · calc
      _ = (fderiv ℝ V x w * U x + Ω) * V x := by
        rw [Matrix.add_mul, mul_assoc (fderiv ℝ V x w), hUV, mul_one]
      _ = (V x * (A i x * U x)) * V x := by
        rw [hDVU]
        dsimp only [Ω, spinNormalGaugeConnection, w]
        abel_nf
      _ = _ := by simp only [mul_assoc, hUV, mul_one]

/-- Both raised Clifford coefficients satisfy the coordinate covector
connection equation. The positive-to-negative identity uses the negative
spin lift on the output and the positive lift on the input. -/
theorem raisedFrameCliffordConnection_of_movingFrame
    {A : Fin 4 → EuclideanFour → FrameMat} {U V : EuclideanFour → FrameMat} {x : EuclideanFour}
    (hU : DifferentiableAt ℝ U x) (hV : DifferentiableAt ℝ V x)
    (hInv : (fun y => V y * U y) =ᶠ[𝓝 x] fun _ => 1) (hUV : U x * V x = 1)
    (i j : Fin 4) (hΩ : ∀ a b, spinNormalGaugeConnection A U V i x b a =
      -spinNormalGaugeConnection A U V i x a b) :
    let Ω := spinNormalGaugeConnection A U V i x
    let Γplus := spinConnectionLift Ω
    let Γminus := negativeSpinConnectionLift Ω
    let cPlus := raisedFrameClifford positiveCliffordVector U
    let cMinus := raisedFrameClifford negativeCliffordVector U
    let w : EuclideanFour := EuclideanSpace.single i 1
    (fderiv ℝ (cPlus j) x w + Γminus * cPlus j x - cPlus j x * Γplus =
      -∑ k, A i x j k • cPlus k x) ∧
    (fderiv ℝ (cMinus j) x w + Γplus * cMinus j x - cMinus j x * Γminus =
      -∑ k, A i x j k • cMinus k x) := by
  have hFrame := (spinMovingFrame_derivatives (A := A) hU hV hInv hUV i).1
  exact ⟨raisedFrameClifford_covariant _ hU _ _ _ hΩ hFrame _ _
    (positiveFrameClifford_commutator _ hΩ) j,
    raisedFrameClifford_covariant _ hU _ _ _ hΩ hFrame _ _
    (negativeFrameClifford_commutator _ hΩ) j⟩

/-- The coordinate tangent-symbol equation instead has the Christoffel
coefficient with output row k and input column j, and positive sign. -/
theorem lowerFrameCliffordConnection_of_movingFrame
    {A : Fin 4 → EuclideanFour → FrameMat} {U V : EuclideanFour → FrameMat} {x : EuclideanFour}
    (hU : DifferentiableAt ℝ U x) (hV : DifferentiableAt ℝ V x)
    (hInv : (fun y => V y * U y) =ᶠ[𝓝 x] fun _ => 1) (hUV : U x * V x = 1)
    (i j : Fin 4) (hΩ : ∀ a b, spinNormalGaugeConnection A U V i x b a =
      -spinNormalGaugeConnection A U V i x a b) :
    let Ω := spinNormalGaugeConnection A U V i x
    let Γplus := spinConnectionLift Ω
    let Γminus := negativeSpinConnectionLift Ω
    let cPlus := lowerFrameClifford positiveCliffordVector V
    let cMinus := lowerFrameClifford negativeCliffordVector V
    let w : EuclideanFour := EuclideanSpace.single i 1
    (fderiv ℝ (cPlus j) x w + Γminus * cPlus j x - cPlus j x * Γplus =
      ∑ k, A i x k j • cPlus k x) ∧
    (fderiv ℝ (cMinus j) x w + Γplus * cMinus j x - cMinus j x * Γminus =
      ∑ k, A i x k j • cMinus k x) := by
  have hFrame := (spinMovingFrame_derivatives (A := A) hU hV hInv hUV i).2
  exact ⟨lowerFrameClifford_covariant _ hV _ _ _ hFrame _ _
    (positiveFrameClifford_commutator _ hΩ) j,
    lowerFrameClifford_covariant _ hV _ _ _ hFrame _ _
    (negativeFrameClifford_commutator _ hΩ) j⟩

end

end FirstOrderTwistor
