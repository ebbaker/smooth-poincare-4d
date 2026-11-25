import FirstOrderTwistor.FrameCompression
import FirstOrderTwistor.SpinNormalFrame

/-!
# A pointwise Ricci-flat Weyl and spin two-jet

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex
assistance. The serving model and effort are unavailable. Input checkout
`5ff7014` with the E18 frame and curvature proofs and pinned Lean dependencies.

In the positive block take `diag(k, -k, 0)`, with zero negative block.
Take spinor value `1`, zero first covariant derivative, and skew second
covariant derivative equal to one half of the curvature commutator.
These are formal data at one point, with no assertion about a solution
on a neighborhood or a sequence of metrics or spinors.
-/

namespace FirstOrderTwistor

open scoped Quaternion

noncomputable section

private def exampleWeyl (k : ℝ) : Matrix (Fin 3) (Fin 3) ℝ :=
  !![k, 0, 0; 0, -k, 0; 0, 0, 0]

private def exampleCurvature (k : ℝ) : CurvatureFrameTensor :=
  chiralFrameTensor (exampleWeyl k) 0

private theorem exampleCurvature_apply (k : ℝ) (a b c d : Fin 4) :
    exampleCurvature k a b c d =
      let row i := skewPairArray (fun j => exampleWeyl k j i / 2)
        (fun j => exampleWeyl k j i / 2) a b
      skewPairArray row row c d := by
  unfold exampleCurvature chiralFrameTensor
  let Z : Matrix (Fin 3) (Fin 3) ℝ := 0
  change skewPairArray
    (fun i => skewPairArray (fun j => (exampleWeyl k j i + Z j i) / 2)
      (fun j => (exampleWeyl k j i - Z j i) / 2) a b)
    (fun i => skewPairArray (fun j => (exampleWeyl k j i - Z j i) / 2)
      (fun j => (exampleWeyl k j i + Z j i) / 2) a b) c d = _
  simp only [Z, Matrix.zero_apply, add_zero, sub_zero]

private def firstForm : Matrix (Fin 4) (Fin 4) ℝ :=
  skewPairArray ![1, 0, 0] ![1, 0, 0]

private def secondForm : Matrix (Fin 4) (Fin 4) ℝ :=
  skewPairArray ![0, 1, 0] ![0, 1, 0]

private theorem exampleCurvature_factor (k : ℝ) (a b c d : Fin 4) :
    exampleCurvature k a b c d =
      k / 2 * (firstForm a b * firstForm c d - secondForm a b * secondForm c d) := by
  rw [exampleCurvature_apply]
  dsimp only
  have hRow (i : Fin 3) :
      skewPairArray (fun j => exampleWeyl k j i / 2)
          (fun j => exampleWeyl k j i / 2) a b =
        ![k / 2 * firstForm a b, -(k / 2) * secondForm a b, 0] i := by
    fin_cases i <;> fin_cases a <;> fin_cases b <;>
      norm_num [firstForm, secondForm, skewPairArray, exampleWeyl] <;> ring
  simp_rw [hRow]
  fin_cases c <;> fin_cases d <;> norm_num [firstForm, secondForm, skewPairArray]

private theorem exampleCurvature_symmetries (k : ℝ) (a b c d : Fin 4) :
    exampleCurvature k a b c d = -exampleCurvature k b a c d ∧
      exampleCurvature k a b c d = -exampleCurvature k a b d c ∧
      exampleCurvature k a b c d = exampleCurvature k c d a b := by
  have hFirst (i j : Fin 4) : firstForm j i = -firstForm i j := by
    fin_cases i <;> fin_cases j <;> norm_num [firstForm, skewPairArray]
  have hSecond (i j : Fin 4) : secondForm j i = -secondForm i j := by
    fin_cases i <;> fin_cases j <;> norm_num [secondForm, skewPairArray]
  simp only [exampleCurvature_factor]
  refine ⟨?_, ?_, ?_⟩
  · rw [hFirst a b, hSecond a b]
    ring
  · rw [hFirst c d, hSecond c d]
    ring
  · ring

private theorem exampleCurvature_bianchi (k : ℝ) (a b c d : Fin 4) :
    exampleCurvature k a b c d + exampleCurvature k b c a d +
      exampleCurvature k c a b d = 0 := by
  simp only [exampleCurvature_factor, ← mul_add]
  suffices h : (firstForm a b * firstForm c d - secondForm a b * secondForm c d) +
      (firstForm b c * firstForm a d - secondForm b c * secondForm a d) +
      (firstForm c a * firstForm b d - secondForm c a * secondForm b d) = 0 by
    rw [h, mul_zero]
  fin_cases a <;> fin_cases b <;> fin_cases c <;> fin_cases d <;>
    norm_num [firstForm, secondForm, skewPairArray]

private theorem exampleCurvature_ricci (k : ℝ) (i j : Fin 4) :
    (∑ a, exampleCurvature k a i a j) = 0 := by
  fin_cases i <;> fin_cases j <;>
    norm_num [Fin.sum_univ_four, exampleCurvature_apply, skewPairArray, exampleWeyl] <;> ring

private def exampleFirstSpinJet : Fin 4 → ℍ[ℝ] := 0

private def exampleSecondSpinJet (k : ℝ) (i j : Fin 4) : ℍ[ℝ] :=
  (-1 / 4 : ℝ) • (frameCurvatureQuaternion (exampleCurvature k) i j * 1)

private theorem exampleSpinFrameCommutator (k : ℝ) :
    SpinFrameCommutator (exampleCurvature k) 1 (exampleSecondSpinJet k) := by
  intro i j
  fin_cases i <;> fin_cases j <;> apply Quaternion.ext <;>
    norm_num [exampleSecondSpinJet, frameCurvatureQuaternion, exampleCurvature_apply,
      skewPairArray, exampleWeyl, smul_eq_mul] <;> ring

private theorem exampleDiracDerivative (k : ℝ) (i : Fin 4) :
    (∑ j, positiveCliffordVector j * exampleSecondSpinJet k i j) = 0 := by
  fin_cases i <;> apply Quaternion.ext <;>
    norm_num [Fin.sum_univ_four, positiveCliffordVector, spinUnit, exampleSecondSpinJet,
      frameCurvatureQuaternion, exampleCurvature_apply, skewPairArray, exampleWeyl,
      smul_eq_mul] <;> ring

private theorem examplePositiveBlockIsSymm (k : ℝ) :
    (selfDualCurvatureBlock (exampleCurvature k)).IsSymm := by
  rw [exampleCurvature, selfDualCurvatureBlock_chiralFrameTensor]
  show (exampleWeyl k).transpose = exampleWeyl k
  ext i j
  fin_cases i <;> fin_cases j <;> rfl

private theorem exampleProjectedCurlNorm (k : ℝ) :
    (∑ a, Quaternion.normSq
      (selfDualCliffordProjection (frameTwistorCurl (exampleSecondSpinJet k)) a)) = k ^ 2 := by
  have hTr : (exampleWeyl k).trace = 0 := by
    simp [Matrix.trace, Fin.sum_univ_three, exampleWeyl]
  rw [projectedFrameTwistorCurl_normSq (exampleSpinFrameCommutator k)
    (examplePositiveBlockIsSymm k), exampleCurvature,
    traceFreeChiralBlock_chiralFrameTensor _ _ hTr]
  simp [SectionsAndConnections.hilbertSchmidtSq, Fin.sum_univ_three, exampleWeyl]
  ring

/-- At a point, a zero first spin jet and zero Clifford contraction of the second
spin jet can coexist with a projected curl of squared norm `k²`. -/
private theorem pointwiseRicciFlatSpinJet (k : ℝ) :
    exampleFirstSpinJet = 0 ∧
      (∀ a b c d, exampleCurvature k a b c d = -exampleCurvature k b a c d ∧
        exampleCurvature k a b c d = -exampleCurvature k a b d c ∧
        exampleCurvature k a b c d = exampleCurvature k c d a b) ∧
      (∀ a b c d, exampleCurvature k a b c d + exampleCurvature k b c a d +
        exampleCurvature k c a b d = 0) ∧
      (∀ i j, (∑ a, exampleCurvature k a i a j) = 0) ∧
      SpinFrameCommutator (exampleCurvature k) 1 (exampleSecondSpinJet k) ∧
      (∀ i, (∑ j, positiveCliffordVector j * exampleSecondSpinJet k i j) = 0) ∧
      (∑ a, Quaternion.normSq
        (selfDualCliffordProjection (frameTwistorCurl (exampleSecondSpinJet k)) a)) = k ^ 2 :=
  ⟨rfl, exampleCurvature_symmetries k, exampleCurvature_bianchi k,
    exampleCurvature_ricci k, exampleSpinFrameCommutator k,
    exampleDiracDerivative k, exampleProjectedCurlNorm k⟩

#print axioms pointwiseRicciFlatSpinJet

end
end FirstOrderTwistor
