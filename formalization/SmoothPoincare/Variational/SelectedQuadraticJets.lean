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

private theorem boundedProduct_memLp_and_le {a d : D → ℝ} {K : ℝ} {p : ENNReal}
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
  apply ENNReal.toReal_mono (ENNReal.mul_ne_top hf.eLpNorm_ne_top hg.eLpNorm_ne_top)
  change eLpNorm (fun x => f x * g x) 2 μ ≤ _
  simpa only [ENNReal.coe_one, one_mul] using hH

private theorem lpNorm_const_smul_nonneg {a : ℝ} (ha : 0 ≤ a) (f : D → ℝ) (p : ENNReal) :
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
  simp only [selectedSpliceFrozenFirstPartial, selectedSpliceFirstPartialError, partialDeriv,
    add_apply, sub_apply, smul_apply, Pi.add_apply, Pi.smul_apply, Pi.mul_apply, Pi.sub_apply, smul_eq_mul]
  ring

variable [MeasurableSpace E] [BorelSpace E] {μ : Measure E}

omit [MeasurableSpace E] [BorelSpace E] in
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


/-- The actual first jet minus the frozen first jet has the same bound with
its exact path factor. -/
theorem selectedSpliceCoefficient_partial_error_memLp_and_le {t w C : ℝ}
    (ht : 0 ≤ t) (hw : 0 < w) (hC : 0 ≤ C)
    {G B : E → ℝ} (hG : Differentiable ℝ G) (hB : Differentiable ℝ B)
    (i : Fin (Module.finrank ℝ E))
    (hCutoff : ∀ x : E, ‖x‖ ≤ 2 → |partialDeriv i (selectedRadialCutoff w) x| ≤ C / w)
    (hRegion : ∀ᵐ x ∂μ, ‖x‖ ≤ 2) (hMismatch : MemLp (B - G) 4 μ) :
    let R := partialDeriv i (selectedSpliceCoefficient t w G B) - selectedSpliceFrozenFirstPartial t w G B i
    MemLp R 4 μ ∧ lpNorm R 4 μ ≤ t * ((C / w) * lpNorm (B - G) 4 μ) := by
  intro R
  have hEq : R = t • selectedSpliceFirstPartialError w G B i := by
    dsimp only [R]
    rw [selectedSpliceCoefficient_partial t w hG hB i, add_sub_cancel_left]
  obtain ⟨hMem, hNorm⟩ := selectedSpliceFirstPartialError_memLp_and_le hw hC G B i hCutoff hRegion hMismatch
  rw [hEq, lpNorm_const_smul_nonneg ht]
  exact ⟨hMem.const_smul t, mul_le_mul_of_nonneg_left hNorm ht⟩

/-- When comparing with the convex combination of the endpoint products,
the frozen first jets also contribute the endpoint mismatch product. -/
theorem frozenFirstJet_mul_sub_weighted (a b c d s : ℝ) :
    ((1 - s) * a + s * b) * ((1 - s) * c + s * d) - ((1 - s) * (a * c) + s * (b * d)) =
      -s * (1 - s) * (b - a) * (d - c) := by ring

end Model


section Physical

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "I₄" => 𝓘(ℝ, E₄)
local notation "J₄" => Fin (Module.finrank ℝ E₄)

/-- The actual model splice of the two lifted metrics at the native width. -/
def selectedModelSplice (G B : SmoothRiemannianMetric I₄ E₄) (t w : ℝ) (ht : t ∈ Icc (0 : ℝ) 1) :
    SmoothRiemannianMetric I₄ E₄ :=
  chartSpliceMetric G B (selectedRadialCutoff w) (contDiff_selectedRadialCutoff w).contMDiff
    (selectedRadialCutoff_mem_Icc w) t ht

private theorem selectedModelSplice_inner (G B : SmoothRiemannianMetric I₄ E₄) (t w : ℝ)
    (ht : t ∈ Icc (0 : ℝ) 1) (x : E₄) (u v : TangentSpace I₄ x) :
    (selectedModelSplice G B t w ht).inner x u v =
      (1 - t * selectedRadialCutoff w x) * G.inner x u v +
        t * selectedRadialCutoff w x * B.inner x u v := by
  let k := fun y : E₄ => t * selectedRadialCutoff w y
  have hk : ContMDiff I₄ 𝓘(ℝ) ∞ k := contMDiff_const.mul (contDiff_selectedRadialCutoff w).contMDiff
  have hk01 (y : E₄) : k y ∈ Icc (0 : ℝ) 1 := by
    have hy := selectedRadialCutoff_mem_Icc w y
    exact ⟨mul_nonneg ht.1 hy.1, (mul_le_of_le_one_left hy.1 ht.2).trans hy.2⟩
  change (B.convexComb G k hk hk01).inner x u v = _
  rw [convexComb_inner]
  simp only [k, smul_eq_mul, add_comm]

/-- The chart Gram entries of the model splice are the scalar splice
coefficients, so taking their derivatives produces actual chart first jets. -/
theorem chartGramOnE_selectedModelSplice (G B : SmoothRiemannianMetric I₄ E₄) (t w : ℝ)
    (ht : t ∈ Icc (0 : ℝ) 1) (α : E₄) (a c : J₄) :
    chartGramOnE (selectedModelSplice G B t w ht) α a c =
      selectedSpliceCoefficient t w (chartGramOnE G α a c) (chartGramOnE B α a c) := by
  funext x
  simp only [selectedSpliceCoefficient, selectedMarkedMetricLift_chartGram]
  exact selectedModelSplice_inner G B t w ht x (chartModelBasis E₄ a) (chartModelBasis E₄ c)

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H}
  [TopologicalSpace M] [ChartedSpace H M]

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

private theorem memLp_four_continuous_selectedTrim (F : PartialDiffeomorph I₄ I E₄ M ∞)
    (n : ℕ) (μ : Measure M) [IsFiniteMeasure μ] {f : E₄ → ℝ} (hf : Continuous f) :
    MemLp f 4 (selectedTrimPullback F n μ) := by
  obtain ⟨C, hC⟩ := (isCompact_closedBall (0 : E₄) 2).bddAbove_image hf.norm.continuousOn
  apply MemLp.of_bound hf.aestronglyMeasurable C
  filter_upwards [ae_selectedTrimPullback_norm_le F n μ] with x hx
  exact hC (mem_image_of_mem (fun y : E₄ => ‖f y‖) (by simpa [dist_zero_right] using hx))

private theorem continuous_selectedSpliceFrozenFirstPartial (t w : ℝ) {G B : E₄ → ℝ}
    (hG : ContDiff ℝ ∞ G) (hB : ContDiff ℝ ∞ B) (i : J₄) :
    Continuous (selectedSpliceFrozenFirstPartial t w G B i) := by
  have hWeight : Continuous (fun x : E₄ => t * selectedRadialCutoff w x) :=
    continuous_const.mul (contDiff_selectedRadialCutoff (E := E₄) w).continuous
  exact ((continuous_const.sub hWeight).mul (continuous_partial hG i)).add
    (hWeight.mul (continuous_partial hB i))

variable [IsManifold I ∞ M] [T2Space M] [SigmaCompactSpace M]

/-- The selected physical-volume pullback supports the first-jet bound for
actual chart Gram entries of the spliced model metrics. -/
theorem exists_selectedChartGramFirstPartialError_on_physicalTrim
    (g : SmoothRiemannianMetric I M) [IsFiniteMeasure (riemannianVolumeMeasure I M g)]
    (F : PartialDiffeomorph I₄ I E₄ M ∞) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ (n : ℕ) (G B : SmoothRiemannianMetric I₄ E₄)
      (α : E₄) (i a c : J₄) (t : ℝ) (ht : t ∈ Icc (0 : ℝ) 1),
      let w : ℝ := 1 / ((n : ℝ) + 1)
      let μ := selectedTrimPullback F n (riemannianVolumeMeasure I M g)
      let A := chartGramOnE G α a c
      let D := chartGramOnE B α a c
      let R := partialDeriv i (chartGramOnE (selectedModelSplice G B t w ht) α a c) -
        selectedSpliceFrozenFirstPartial t w A D i
      MemLp R 4 μ ∧ lpNorm R 4 μ ≤ t * ((C / w) * lpNorm (D - A) 4 μ) := by
  obtain ⟨C, _, hC, _, hBound⟩ := exists_selectedRadialCutoff_partial_bounds (E := E₄)
  refine ⟨2 * C, by positivity, fun n G B α i a c t ht => ?_⟩
  intro w μ A D R
  have hw : 0 < w := by dsimp [w]; positivity
  have hA := contDiff_selectedMarkedMetricLift_chartGram G α a c
  have hD := contDiff_selectedMarkedMetricLift_chartGram B α a c
  have hMis := memLp_four_continuous_selectedTrim F n (riemannianVolumeMeasure I M g) (hD.sub hA).continuous
  have hRegion := ae_selectedTrimPullback_norm_le F n (riemannianVolumeMeasure I M g)
  dsimp only [R]
  rw [chartGramOnE_selectedModelSplice]
  apply selectedSpliceCoefficient_partial_error_memLp_and_le ht.1 hw (by positivity : 0 ≤ 2 * C)
    (hA.differentiable (by simp)) (hD.differentiable (by simp)) i _ hRegion hMis
  exact fun x hx => (hBound w hw x hx i i).1

/-- The two mixed terms and the product of the first-jet corrections on the
same physical trim, with an optional bounded inverse-metric coefficient. -/
theorem exists_selectedChartGramQuadraticFirstJet_on_physicalTrim
    (g : SmoothRiemannianMetric I M) [IsFiniteMeasure (riemannianVolumeMeasure I M g)]
    (F : PartialDiffeomorph I₄ I E₄ M ∞) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ (n : ℕ) (G B : SmoothRiemannianMetric I₄ E₄) (α : E₄)
      (i j a c b d : J₄) (t : ℝ) (ht : t ∈ Icc (0 : ℝ) 1) (k : E₄ → ℝ) (K : ℝ),
      let w : ℝ := 1 / ((n : ℝ) + 1)
      let μ := selectedTrimPullback F n (riemannianVolumeMeasure I M g)
      0 ≤ K → AEStronglyMeasurable k μ → (∀ᵐ x ∂μ, |k x| ≤ K) →
      let A₁ := chartGramOnE G α a c
      let B₁ := chartGramOnE B α a c
      let A₂ := chartGramOnE G α b d
      let B₂ := chartGramOnE B α b d
      let H₁ := selectedSpliceFrozenFirstPartial t w A₁ B₁ i
      let H₂ := selectedSpliceFrozenFirstPartial t w A₂ B₂ j
      let d₁ := (C / w) * lpNorm (B₁ - A₁) 4 μ
      let d₂ := (C / w) * lpNorm (B₂ - A₂) 4 μ
      let P := selectedModelSplice G B t w ht
      let R := k * ((partialDeriv i (chartGramOnE P α a c)) *
        (partialDeriv j (chartGramOnE P α b d)) - H₁ * H₂)
      MemLp R 2 μ ∧ lpNorm R 2 μ ≤ K *
        (t * (lpNorm H₁ 4 μ * d₂ + d₁ * lpNorm H₂ 4 μ) + t ^ 2 * (d₁ * d₂)) := by
  obtain ⟨C, _, hC, _, hBound⟩ := exists_selectedRadialCutoff_partial_bounds (E := E₄)
  refine ⟨2 * C, by positivity, fun n G B α i j a c b d t ht k K => ?_⟩
  intro w μ hK hk hCoef A₁ B₁ A₂ B₂ H₁ H₂ d₁ d₂ P R
  have hw : 0 < w := by dsimp [w]; positivity
  have hC' : 0 ≤ 2 * C := by positivity
  have hA₁ := contDiff_selectedMarkedMetricLift_chartGram G α a c
  have hB₁ := contDiff_selectedMarkedMetricLift_chartGram B α a c
  have hA₂ := contDiff_selectedMarkedMetricLift_chartGram G α b d
  have hB₂ := contDiff_selectedMarkedMetricLift_chartGram B α b d
  have hH₁ : MemLp H₁ 4 μ := memLp_four_continuous_selectedTrim F n _
    (continuous_selectedSpliceFrozenFirstPartial t w hA₁ hB₁ i)
  have hH₂ : MemLp H₂ 4 μ := memLp_four_continuous_selectedTrim F n _
    (continuous_selectedSpliceFrozenFirstPartial t w hA₂ hB₂ j)
  have hRegion := ae_selectedTrimPullback_norm_le F n (riemannianVolumeMeasure I M g)
  have hMis₁ := memLp_four_continuous_selectedTrim F n (riemannianVolumeMeasure I M g) (hB₁.sub hA₁).continuous
  have hMis₂ := memLp_four_continuous_selectedTrim F n (riemannianVolumeMeasure I M g) (hB₂.sub hA₂).continuous
  obtain ⟨hE₁, hD₁⟩ := selectedSpliceFirstPartialError_memLp_and_le hw hC' A₁ B₁ i
    (fun x hx => (hBound w hw x hx i i).1) hRegion hMis₁
  obtain ⟨hE₂, hD₂⟩ := selectedSpliceFirstPartialError_memLp_and_le hw hC' A₂ B₂ j
    (fun x hx => (hBound w hw x hx j j).1) hRegion hMis₂
  have hP₁ : partialDeriv i (chartGramOnE P α a c) = H₁ + t • selectedSpliceFirstPartialError w A₁ B₁ i := by
    dsimp only [P]
    rw [chartGramOnE_selectedModelSplice]
    exact selectedSpliceCoefficient_partial t w (hA₁.differentiable (by simp)) (hB₁.differentiable (by simp)) i
  have hP₂ : partialDeriv j (chartGramOnE P α b d) = H₂ + t • selectedSpliceFirstPartialError w A₂ B₂ j := by
    dsimp only [P]
    rw [chartGramOnE_selectedModelSplice]
    exact selectedSpliceCoefficient_partial t w (hA₂.differentiable (by simp)) (hB₂.differentiable (by simp)) j
  dsimp only [R]
  rw [hP₁, hP₂]
  exact quadraticFirstJetProduct_memLp_and_le hK ht.1 hk hCoef hH₁ hH₂ hE₁ hE₂ hD₁ hD₂


omit [T2Space M] [SigmaCompactSpace M] in
private theorem selectedAffineSplice_inner (g b : SmoothRiemannianMetric I M) (χ : M → ℝ)
    (hχ : ContMDiff I 𝓘(ℝ) ∞ χ) (hχ01 : ∀ y, χ y ∈ Icc (0 : ℝ) 1)
    (t : ℝ) (ht : t ∈ Icc (0 : ℝ) 1) (y : M) (u v : TangentSpace I y) :
    (chartSpliceMetric g b χ hχ hχ01 t ht).inner y u v =
      (1 - t * χ y) * g.inner y u v + t * χ y * b.inner y u v := by
  have h : ∀ z, t * χ z ∈ Icc (0 : ℝ) 1 := fun z =>
    ⟨mul_nonneg ht.1 (hχ01 z).1, (mul_le_of_le_one_left (hχ01 z).1 ht.2).trans (hχ01 z).2⟩
  simpa only [smul_eq_mul, add_comm, chartSpliceMetric] using
    convexComb_inner b g (fun z => t * χ z) (contMDiff_const.mul hχ) h y u v

omit [SigmaCompactSpace M] in
/-- The actual ambient metric splice pulls back to the model splice on an
open neighborhood of the full buffered chart. Both metric lifts and the
cutoff are chosen at the same width, before the path parameter. -/
theorem exists_selectedPhysicalSplice_native_model
    (F : PartialDiffeomorph I₄ I E₄ M ∞) (n : ℕ)
    (hBuffer : Metric.closedBall (0 : E₄) (1 + 1 / ((n : ℝ) + 1)) ⊆ F.source)
    (g b : SmoothRiemannianMetric I M) :
    ∃ (χ : M → ℝ) (hχ : ContMDiff I 𝓘(ℝ) ∞ χ) (hχ01 : ∀ y, χ y ∈ Icc (0 : ℝ) 1)
      (G B : SmoothRiemannianMetric I₄ E₄) (V : TopologicalSpace.Opens E₄),
      Metric.closedBall (0 : E₄) (1 + 1 / ((n : ℝ) + 1)) ⊆ (V : Set E₄) ∧
      (V : Set E₄) ⊆ F.source ∧
      (∀ y ∉ selectedChartDisk F ∪ selectedDiskTrim F n, χ y = 0) ∧
      ∀ x ∈ V, ∀ u v : E₄, ∀ t : ℝ, ∀ ht : t ∈ Icc (0 : ℝ) 1,
        (selectedModelSplice G B t (1 / ((n : ℝ) + 1)) ht).inner x u v =
          (chartSpliceMetric g b χ hχ hχ01 t ht).inner (F x)
            (mfderiv I₄ I (F : E₄ → M) x u) (mfderiv I₄ I (F : E₄ → M) x v) := by
  obtain ⟨χ, hχ, hχ01, hNative, hZero⟩ := exists_selectedMarkedRadialCutoff F n hBuffer
  obtain ⟨G, U, hU, hUS, hG⟩ := exists_selectedMarkedMetricLift F n hBuffer g
  obtain ⟨B, V, hV, _, hB⟩ := exists_selectedMarkedMetricLift F n hBuffer b
  refine ⟨χ, hχ, hχ01, G, B, U ⊓ V, fun x hx => ⟨hU hx, hV hx⟩, fun _ hx => hUS hx.1, hZero, ?_⟩
  rintro x ⟨hxU, hxV⟩ u v t ht
  let w : ℝ := 1 / ((n : ℝ) + 1)
  calc
    _ = (1 - t * selectedRadialCutoff w x) * G.inner x u v +
        t * selectedRadialCutoff w x * B.inner x u v := selectedModelSplice_inner G B t w ht x u v
    _ = _ := by
      rw [hG x hxU u v, hB x hxV u v, ← hNative x (hUS hxU)]
      exact (selectedAffineSplice_inner g b χ hχ hχ01 t ht (F x)
        (mfderiv I₄ I (F : E₄ → M) x u) (mfderiv I₄ I (F : E₄ → M) x v)).symm

end Physical

end

end SmoothPoincare
