import SmoothPoincare.Variational.SelectedPhysicalJetControl

/-! # The first-jet products of a splice at the selected physical width -/

open DifferentialGeometry DifferentialGeometry.Analysis DifferentialGeometry.Integral.Measure
open DifferentialGeometry.Geometry.Operator DifferentialGeometry.Tensor.Coordinates
open Filter MeasureTheory Set
open scoped ContDiff Manifold Topology

namespace SmoothPoincare

noncomputable section

section Measured

variable {D : Type*} [MeasurableSpace D] {μ : Measure D}

private theorem boundedProduct_memLp_and_le {a d : D → ℝ} {K : ℝ} {p : ℝ≥0∞}
    (hK : 0 ≤ K) (ha : AEStronglyMeasurable a μ) (hd : MemLp d p μ)
    (h : ∀ᵐ x ∂μ, |a x| ≤ K) :
    MemLp (a * d) p μ ∧ lpNorm (a * d) p μ ≤ K * lpNorm d p μ := by
  let F : D → ℝ := K • fun x => ‖d x‖
  have hF : MemLp F p μ := hd.norm.const_smul K
  have hMeas := ha.mul hd.aestronglyMeasurable
  have hDom : ∀ᵐ x ∂μ, ‖(a * d) x‖ ≤ ‖F x‖ := by
    filter_upwards [h] with x hx
    calc
      ‖(a * d) x‖ = |a x| * ‖d x‖ := by rw [Pi.mul_apply, norm_mul, Real.norm_eq_abs (a x)]
      _ ≤ K * ‖d x‖ := mul_le_mul_of_nonneg_right hx (norm_nonneg _)
      _ = ‖F x‖ := by simp [F, Pi.smul_apply, Real.norm_of_nonneg hK]
  refine ⟨hF.of_le hMeas hDom, ?_⟩
  calc
    _ ≤ lpNorm F p μ := ENNReal.toReal_mono hF.eLpNorm_ne_top (eLpNorm_mono_ae hMeas hDom)
    _ = _ := by
      dsimp only [F]
      rw [lpNorm_const_smul, Real.nnnorm_of_nonneg hK, lpNorm_norm hd.aestronglyMeasurable]
      rfl

private theorem holderProductFour_memLp_and_le {f g : D → ℝ} (hf : MemLp f 4 μ) (hg : MemLp g 4 μ) :
    MemLp (f * g) 2 μ ∧ lpNorm (f * g) 2 μ ≤ lpNorm f 4 μ * lpNorm g 4 μ := by
  have hTriple : Real.HolderTriple 4 4 2 := ⟨by norm_num, by norm_num, by norm_num⟩
  let : ENNReal.HolderTriple 4 4 2 := by simpa using hTriple.ennrealOfReal
  refine ⟨hf.mul hg, ?_⟩
  have hH := eLpNorm_le_eLpNorm_mul_eLpNorm_of_norm (p := 4) (q := 4) (r := 2)
    (fun a b : ℝ => a * b) 1 (by fun_prop) hf.aestronglyMeasurable hg.aestronglyMeasurable
    (Eventually.of_forall fun _ => by simp only [norm_mul, NNReal.coe_one, one_mul, le_refl])
  rw [← toReal_eLpNorm, ← toReal_eLpNorm, ← toReal_eLpNorm, ← ENNReal.toReal_mul]
  exact ENNReal.toReal_mono (ENNReal.mul_ne_top hf.eLpNorm_ne_top hg.eLpNorm_ne_top)
    (by simpa only [ENNReal.coe_one, one_mul] using hH)

private theorem lpNorm_const_smul_nonneg {a : ℝ} (ha : 0 ≤ a) (f : D → ℝ) (p : ℝ≥0∞) :
    lpNorm (a • f) p μ = a * lpNorm f p μ := by
  rw [lpNorm_const_smul, Real.nnnorm_of_nonneg ha]
  rfl

/-- An inverse-Gram coefficient with bound `K` multiplies the sum of the two
mixed first-jet products and the square-order error product. -/
theorem quadraticFirstJetProduct_memLp_and_le {k H₁ H₂ E₁ E₂ : D → ℝ} {K t d₁ d₂ : ℝ}
    (hK : 0 ≤ K) (ht : 0 ≤ t) (hk : AEStronglyMeasurable k μ) (hCoef : ∀ᵐ x ∂μ, |k x| ≤ K)
    (hH₁ : MemLp H₁ 4 μ) (hH₂ : MemLp H₂ 4 μ) (hE₁ : MemLp E₁ 4 μ) (hE₂ : MemLp E₂ 4 μ)
    (hD₁ : lpNorm E₁ 4 μ ≤ d₁) (hD₂ : lpNorm E₂ 4 μ ≤ d₂) :
    let R := k * ((H₁ + t • E₁) * (H₂ + t • E₂) - H₁ * H₂)
    MemLp R 2 μ ∧ lpNorm R 2 μ ≤ K *
      (t * (lpNorm H₁ 4 μ * d₂ + d₁ * lpNorm H₂ 4 μ) + t ^ 2 * (d₁ * d₂)) := by
  intro R
  obtain ⟨hA, hnA⟩ := holderProductFour_memLp_and_le hH₁ hE₂
  obtain ⟨hB, hnB⟩ := holderProductFour_memLp_and_le hE₁ hH₂
  obtain ⟨hC, hnC⟩ := holderProductFour_memLp_and_le hE₁ hE₂
  let Q : D → ℝ := t • (H₁ * E₂ + E₁ * H₂) + t ^ 2 • (E₁ * E₂)
  have hAB : MemLp (H₁ * E₂ + E₁ * H₂) 2 μ := hA.add hB
  have hScaled : MemLp (t • (H₁ * E₂ + E₁ * H₂)) 2 μ := hAB.const_smul t
  have hQ : MemLp Q 2 μ := hScaled.add (hC.const_smul (t ^ 2))
  have hEq : R = k * Q := by
    funext x
    simp only [R, Q, Pi.mul_apply, Pi.sub_apply, Pi.add_apply, Pi.smul_apply, smul_eq_mul]
    ring
  obtain ⟨hMem, hSize⟩ := boundedProduct_memLp_and_le hK hk hQ hCoef
  rw [hEq]
  refine ⟨hMem, hSize.trans (mul_le_mul_of_nonneg_left ?_ hK)⟩
  have hDA := hnA.trans (mul_le_mul_of_nonneg_left hD₂ lpNorm_nonneg)
  have hDB := hnB.trans (mul_le_mul_of_nonneg_right hD₁ lpNorm_nonneg)
  have hDC := hnC.trans (mul_le_mul hD₁ hD₂ lpNorm_nonneg (lpNorm_nonneg.trans hD₁))
  calc
    lpNorm Q 2 μ ≤ lpNorm (t • (H₁ * E₂ + E₁ * H₂)) 2 μ + lpNorm (t ^ 2 • (E₁ * E₂)) 2 μ :=
      lpNorm_add_le hScaled (by norm_num)
    _ = t * lpNorm (H₁ * E₂ + E₁ * H₂) 2 μ + t ^ 2 * lpNorm (E₁ * E₂) 2 μ := by
      rw [lpNorm_const_smul_nonneg ht, lpNorm_const_smul_nonneg (sq_nonneg t)]
    _ ≤ _ := add_le_add (mul_le_mul_of_nonneg_left
      ((lpNorm_add_le hA (by norm_num)).trans (add_le_add hDA hDB)) ht)
      (mul_le_mul_of_nonneg_left hDC (sq_nonneg t))

end Measured

section Model

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]

/-- The scalar coefficient used in the affine splice of the chart metrics. -/
def selectedSpliceCoefficient (t w : ℝ) (G B : E → ℝ) (x : E) : ℝ :=
  (1 - t * selectedRadialCutoff w x) * G x + t * selectedRadialCutoff w x * B x

/-- The weighted first jet with the cutoff held fixed at a point. -/
def selectedSpliceFrozenFirstPartial (t w : ℝ) (G B : E → ℝ)
    (i : Fin (Module.finrank ℝ E)) (x : E) : ℝ :=
  (1 - t * selectedRadialCutoff w x) * partialDeriv i G x +
    t * selectedRadialCutoff w x * partialDeriv i B x

/-- The coefficient error before multiplication by the path parameter. -/
def selectedSpliceFirstPartialError (w : ℝ) (G B : E → ℝ)
    (i : Fin (Module.finrank ℝ E)) : E → ℝ :=
  partialDeriv i (selectedRadialCutoff w) * (B - G)

/-- The first derivative of the actual splice equals the frozen first
jet plus the path parameter times the cutoff commutator. -/
theorem selectedSpliceCoefficient_partial (t w : ℝ) {G B : E → ℝ}
    (hG : Differentiable ℝ G) (hB : Differentiable ℝ B) (i : Fin (Module.finrank ℝ E)) :
    partialDeriv i (selectedSpliceCoefficient t w G B) =
      selectedSpliceFrozenFirstPartial t w G B i + t • selectedSpliceFirstPartialError w G B i := by
  let χ := selectedRadialCutoff (E := E) w
  have hχ := (contDiff_selectedRadialCutoff (E := E) w).differentiable (by simp)
  have hEq : selectedSpliceCoefficient t w G B = fun x => G x + t * (χ x * (B x - G x)) := by
    funext x
    unfold selectedSpliceCoefficient χ
    ring
  funext x
  rw [hEq]
  have hDerivative := (hG x).hasFDerivAt.add
    (((hχ x).hasFDerivAt.mul ((hB x).hasFDerivAt.sub (hG x).hasFDerivAt)).const_mul t)
  change (fderiv ℝ (G + (fun _ => t) * (χ * (B - G))) x) (chartModelBasis E i) = _
  have hD : fderiv ℝ (G + (fun _ => t) * (χ * (B - G))) x = _ := hDerivative.fderiv
  rw [hD]
  simp only [selectedSpliceFrozenFirstPartial, selectedSpliceFirstPartialError, partialDeriv, χ,
    add_apply, sub_apply, smul_apply, Pi.add_apply, Pi.smul_apply, Pi.mul_apply, Pi.sub_apply, smul_eq_mul]
  ring

variable [MeasurableSpace E] [BorelSpace E] {μ : Measure E}

private theorem continuous_partial {f : E → ℝ} (hf : ContDiff ℝ ∞ f)
    (i : Fin (Module.finrank ℝ E)) : Continuous (partialDeriv i f) :=
  ((hf.fderiv_right (m := ∞) (by simp)).clm_apply contDiff_const).continuous

/-- On the selected band the first-jet commutator is controlled by the
actual coefficient mismatch in the same measure and in `L⁴`. -/
theorem selectedSpliceFirstPartialError_memLp_and_le {w C : ℝ} (hw : 0 < w) (hC : 0 ≤ C)
    (G B : E → ℝ) (i : Fin (Module.finrank ℝ E))
    (hCutoff : ∀ x : E, ‖x‖ ≤ 2 → |partialDeriv i (selectedRadialCutoff w) x| ≤ C / w)
    (hRegion : ∀ᵐ x ∂μ, ‖x‖ ≤ 2) (hMismatch : MemLp (B - G) 4 μ) :
    MemLp (selectedSpliceFirstPartialError w G B i) 4 μ ∧
      lpNorm (selectedSpliceFirstPartialError w G B i) 4 μ ≤ (C / w) * lpNorm (B - G) 4 μ :=
  boundedProduct_memLp_and_le (div_nonneg hC hw.le)
    (continuous_partial (contDiff_selectedRadialCutoff w) i).aestronglyMeasurable hMismatch
    (hRegion.mono hCutoff)

end Model

end

end SmoothPoincare
