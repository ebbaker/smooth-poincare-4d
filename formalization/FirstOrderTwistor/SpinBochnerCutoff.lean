import Mathlib.Analysis.Calculus.Deriv.Inv
import Mathlib.Analysis.InnerProductSpace.Calculus
import Mathlib.Analysis.InnerProductSpace.PiL2
import Mathlib.Analysis.SpecialFunctions.Sqrt
import Mathlib.Tactic.Linarith

/-!
# The regularized cutoff in the relative spinor Bochner estimate

The domain may be `EuclideanSpace ℝ (Fin 4)`. The target may be the real
Hilbert direct sum of the finite family of spinor fibers. The derivatives
are Fréchet derivatives in the given chart and their norms are operator norms.
-/

namespace FirstOrderTwistor

variable {E H : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [NormedAddCommGroup H] [InnerProductSpace ℝ H]

/-- The differential of the quotient cutoff from MATCH-E11 (4), obtained by
differentiating the squared Hilbert norm and the positive square root. -/
theorem normalizedSpinCutoff_fderiv {χ : E → ℝ} {Ψ : E → H} {x : E} {ε : ℝ}
    (hχ : DifferentiableAt ℝ χ x) (hΨ : DifferentiableAt ℝ Ψ x) (hε : 0 < ε) :
    let D := ‖Ψ x‖ ^ 2 + ε
    let r := Real.sqrt D
    let L := (innerSL ℝ (Ψ x)).comp (fderiv ℝ Ψ x)
    fderiv ℝ (fun y => χ y / Real.sqrt (‖Ψ y‖ ^ 2 + ε)) x =
      r⁻¹ • fderiv ℝ χ x - (χ x / (r * D)) • L := by
  let D := ‖Ψ x‖ ^ 2 + ε
  let r := Real.sqrt D
  let L := (innerSL ℝ (Ψ x)).comp (fderiv ℝ Ψ x)
  have hD : 0 < D := add_pos_of_nonneg_of_pos (sq_nonneg _) hε
  have hr : 0 < r := Real.sqrt_pos.2 hD
  have hrSq : r ^ 2 = D := Real.sq_sqrt hD.le
  have hMass : HasFDerivAt (fun y => ‖Ψ y‖ ^ 2 + ε) ((2 : ℝ) • L) x := by
    simpa only [L, two_smul] using hΨ.hasFDerivAt.norm_sq.add_const ε
  have hSqrt : HasFDerivAt (fun y => Real.sqrt (‖Ψ y‖ ^ 2 + ε)) (r⁻¹ • L) x := by
    have hScalar : (1 / (2 * r)) * 2 = r⁻¹ := by
      field_simp [hr.ne']
    have hChain := hMass.sqrt hD.ne'
    change HasFDerivAt (fun y => Real.sqrt (‖Ψ y‖ ^ 2 + ε))
      ((1 / (2 * r)) • ((2 : ℝ) • L)) x at hChain
    simpa only [smul_smul, hScalar] using hChain
  have hInv : HasFDerivAt (fun y => (Real.sqrt (‖Ψ y‖ ^ 2 + ε))⁻¹)
      (-(1 / (r * D)) • L) x := by
    have hScalar : (-(r ^ 2)⁻¹) * r⁻¹ = -(1 / (r * D)) := by
      rw [hrSq]
      field_simp [hr.ne', hD.ne']
    have hChain := (hasDerivAt_inv hr.ne').comp_hasFDerivAt x hSqrt
    change HasFDerivAt (fun y => (Real.sqrt (‖Ψ y‖ ^ 2 + ε))⁻¹)
      (-(r ^ 2)⁻¹ • (r⁻¹ • L)) x at hChain
    simpa only [smul_smul, hScalar] using hChain
  have hScaled : χ x • (-(1 / (r * D)) • L) = -((χ x / (r * D)) • L) := by
    simp [smul_smul, neg_smul, div_eq_mul_inv]
  have hProduct := (hχ.hasFDerivAt.fun_mul hInv).fderiv
  change fderiv ℝ (fun y => χ y * (Real.sqrt (‖Ψ y‖ ^ 2 + ε))⁻¹) x =
    χ x • (-(1 / (r * D)) • L) + r⁻¹ • fderiv ℝ χ x at hProduct
  rw [hScaled, add_comm, ← sub_eq_add_neg] at hProduct
  simpa only [div_eq_mul_inv] using hProduct

/-- The regularized cutoff term is bounded by the gradient of the cutoff and
the relative fourth power of the derivative, uniformly in positive `ε`.
`Q` may be any scalar dominating the squared operator norm of `dΨ`. -/
theorem normalizedSpinCutoff_fderiv_bound {χ : E → ℝ} {Ψ : E → H} {x : E} {ε Q : ℝ}
    (hχ : DifferentiableAt ℝ χ x) (hΨ : DifferentiableAt ℝ Ψ x) (hε : 0 < ε)
    (hQ : ‖fderiv ℝ Ψ x‖ ^ 2 ≤ Q) :
    let D := ‖Ψ x‖ ^ 2 + ε
    ‖fderiv ℝ (fun y => χ y / Real.sqrt (‖Ψ y‖ ^ 2 + ε)) x‖ ^ 2 * Q ≤
      2 * ‖fderiv ℝ χ x‖ ^ 2 * (Q / D) + 2 * χ x ^ 2 * (Q / D) ^ 2 := by
  let D := ‖Ψ x‖ ^ 2 + ε
  let r := Real.sqrt D
  let L := (innerSL ℝ (Ψ x)).comp (fderiv ℝ Ψ x)
  let a := ‖fderiv ℝ χ x‖ / r
  let b := |χ x| * ‖L‖ / (r * D)
  have hD : 0 < D := add_pos_of_nonneg_of_pos (sq_nonneg _) hε
  have hr : 0 < r := Real.sqrt_pos.2 hD
  have hrSq : r ^ 2 = D := Real.sq_sqrt hD.le
  have hQnonneg : 0 ≤ Q := (sq_nonneg _).trans hQ
  have hL : ‖L‖ ≤ ‖Ψ x‖ * ‖fderiv ℝ Ψ x‖ := by
    dsimp only [L]
    rw [← innerSL_apply_norm ℝ (Ψ x)]
    exact ContinuousLinearMap.opNorm_comp_le _ _
  have hLsq : ‖L‖ ^ 2 ≤ D * Q := calc
    _ ≤ (‖Ψ x‖ * ‖fderiv ℝ Ψ x‖) ^ 2 := pow_le_pow_left₀ (norm_nonneg _) hL 2
    _ = ‖Ψ x‖ ^ 2 * ‖fderiv ℝ Ψ x‖ ^ 2 := mul_pow _ _ _
    _ ≤ ‖Ψ x‖ ^ 2 * Q := mul_le_mul_of_nonneg_left hQ (sq_nonneg _)
    _ ≤ D * Q := mul_le_mul_of_nonneg_right (le_add_of_nonneg_right hε.le) hQnonneg
  have hCutoff := normalizedSpinCutoff_fderiv hχ hΨ hε
  change fderiv ℝ (fun y => χ y / Real.sqrt (‖Ψ y‖ ^ 2 + ε)) x =
    r⁻¹ • fderiv ℝ χ x - (χ x / (r * D)) • L at hCutoff
  have hNorm : ‖fderiv ℝ (fun y => χ y / Real.sqrt (‖Ψ y‖ ^ 2 + ε)) x‖ ≤ a + b := by
    rw [hCutoff]
    refine (norm_sub_le _ _).trans_eq ?_
    rw [norm_smul, norm_smul, Real.norm_eq_abs, Real.norm_eq_abs, abs_inv,
      abs_of_pos hr, abs_div, abs_of_pos (mul_pos hr hD)]
    dsimp only [a, b]
    ring
  have hA : a ^ 2 * Q = ‖fderiv ℝ χ x‖ ^ 2 * (Q / D) := by
    rw [show a = ‖fderiv ℝ χ x‖ / r from rfl, div_pow, hrSq]
    ring
  have hB : b ^ 2 * Q ≤ χ x ^ 2 * (Q / D) ^ 2 := calc
    b ^ 2 * Q = (χ x ^ 2 * ‖L‖ ^ 2 * Q) / (D * D ^ 2) := by
      rw [show b = |χ x| * ‖L‖ / (r * D) from rfl, div_pow,
        mul_pow |χ x|, mul_pow r, sq_abs, hrSq]
      ring
    _ ≤ (χ x ^ 2 * (D * Q) * Q) / (D * D ^ 2) :=
      div_le_div_of_nonneg_right
        (mul_le_mul_of_nonneg_right (mul_le_mul_of_nonneg_left hLsq (sq_nonneg _)) hQnonneg)
        (mul_nonneg hD.le (sq_nonneg _))
    _ = χ x ^ 2 * (Q / D) ^ 2 := by
      field_simp [hD.ne']
  change ‖fderiv ℝ (fun y => χ y / Real.sqrt (‖Ψ y‖ ^ 2 + ε)) x‖ ^ 2 * Q ≤
    2 * ‖fderiv ℝ χ x‖ ^ 2 * (Q / D) + 2 * χ x ^ 2 * (Q / D) ^ 2
  calc
    _ ≤ (a + b) ^ 2 * Q :=
      mul_le_mul_of_nonneg_right (pow_le_pow_left₀ (norm_nonneg _) hNorm 2) hQnonneg
    _ ≤ (2 * a ^ 2 + 2 * b ^ 2) * Q :=
      mul_le_mul_of_nonneg_right (by nlinarith [sq_nonneg (a - b)]) hQnonneg
    _ = 2 * (a ^ 2 * Q) + 2 * (b ^ 2 * Q) := by ring
    _ ≤ 2 * (‖fderiv ℝ χ x‖ ^ 2 * (Q / D)) + 2 * (χ x ^ 2 * (Q / D) ^ 2) := by
      rw [hA]
      exact add_le_add le_rfl (mul_le_mul_of_nonneg_left hB (by norm_num : (0 : ℝ) ≤ 2))
    _ = _ := by ring

/-- The finite-frame Hilbert–Schmidt square dominates the operator norm square. -/
theorem spinOpNormSq_le_frameSum {F ι : Type*} [NormedAddCommGroup F]
    [InnerProductSpace ℝ F] [Fintype ι] (basis : OrthonormalBasis ι ℝ F)
    (T : F →L[ℝ] H) : ‖T‖ ^ 2 ≤ ∑ i, ‖T (basis i)‖ ^ 2 := by
  let Q := ∑ i, ‖T (basis i)‖ ^ 2
  have hQ : 0 ≤ Q := Finset.sum_nonneg fun _ _ => sq_nonneg _
  have hNorm : ‖T‖ ≤ Real.sqrt Q := by
    apply T.opNorm_le_bound (Real.sqrt_nonneg Q)
    intro v
    have hParseval : (∑ i, |basis.repr v i| ^ 2) = ‖v‖ ^ 2 := by
      simp only [sq_abs, ← EuclideanSpace.real_norm_sq_eq, LinearIsometryEquiv.norm_map]
    calc
      ‖T v‖ = ‖∑ i, basis.repr v i • T (basis i)‖ := by
        congr 1
        simp_rw [← T.map_smul]
        rw [← map_sum, basis.sum_repr]
      _ ≤ ∑ i, |basis.repr v i| * ‖T (basis i)‖ := by
        simpa only [norm_smul, Real.norm_eq_abs] using
          norm_sum_le Finset.univ (fun i => basis.repr v i • T (basis i))
      _ ≤ Real.sqrt (∑ i, |basis.repr v i| ^ 2) * Real.sqrt Q :=
        Real.sum_mul_le_sqrt_mul_sqrt Finset.univ _ _
      _ = Real.sqrt Q * ‖v‖ := by rw [hParseval, Real.sqrt_sq (norm_nonneg v), mul_comm]
  exact (pow_le_pow_left₀ (norm_nonneg T) hNorm 2).trans_eq (Real.sq_sqrt hQ)

/-- The cutoff estimate with the full frame sum used for a finite family. -/
theorem normalizedSpinCutoff_fderiv_bound_frame {F ι : Type*} [NormedAddCommGroup F]
    [InnerProductSpace ℝ F] [Fintype ι] (basis : OrthonormalBasis ι ℝ F)
    {χ : F → ℝ} {Ψ : F → H} {x : F} {ε : ℝ}
    (hχ : DifferentiableAt ℝ χ x) (hΨ : DifferentiableAt ℝ Ψ x) (hε : 0 < ε) :
    let D := ‖Ψ x‖ ^ 2 + ε
    let Q := ∑ i, ‖fderiv ℝ Ψ x (basis i)‖ ^ 2
    ‖fderiv ℝ (fun y => χ y / Real.sqrt (‖Ψ y‖ ^ 2 + ε)) x‖ ^ 2 * Q ≤
      2 * ‖fderiv ℝ χ x‖ ^ 2 * (Q / D) + 2 * χ x ^ 2 * (Q / D) ^ 2 :=
  normalizedSpinCutoff_fderiv_bound hχ hΨ hε (spinOpNormSq_le_frameSum basis (fderiv ℝ Ψ x))

end FirstOrderTwistor
