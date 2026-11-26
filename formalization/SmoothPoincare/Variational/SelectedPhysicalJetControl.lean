import SmoothPoincare.Variational.SpliceRemainderL2
import SmoothPoincare.PhysicalScales.FullDiskTrims
import DifferentialGeometry.Geometry.Metric.Pullback.PartialDiffeomorph.CompactExtension
import DifferentialGeometry.Geometry.Metric.Conformal
import Mathlib.Analysis.Calculus.BumpFunction.InnerProduct
import Mathlib.Analysis.Calculus.Deriv.MeanValue

/-! # Differentiated radial cutoffs at the selected physical width -/

open DifferentialGeometry DifferentialGeometry.Analysis DifferentialGeometry.Integral.Measure
open DifferentialGeometry.Geometry DifferentialGeometry.Geometry.Riemannian DifferentialGeometry.Geometry.Operator
open DifferentialGeometry.Tensor.Coordinates Filter MeasureTheory Set
open scoped ContDiff Manifold Topology RealInnerProductSpace

namespace SmoothPoincare

noncomputable section

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]

/-- The squared radial coordinate gives a smooth step even at the center. -/
def selectedRadialParameter (w : ℝ) (x : E) : ℝ :=
  (1 + w - ‖x‖ ^ 2) / (2 * w)

/-- The cutoff equals one at the inner edge and zero at the outer edge. -/
def selectedRadialCutoff (w : ℝ) (x : E) : ℝ :=
  Real.smoothTransition (selectedRadialParameter w x)

theorem contDiff_selectedRadialCutoff (w : ℝ) : ContDiff ℝ ∞ (selectedRadialCutoff w : E → ℝ) :=
  Real.smoothTransition.contDiff.comp ((contDiff_const.sub (contDiff_id.norm_sq ℝ)).div_const _)

omit [InnerProductSpace ℝ E] in
theorem selectedRadialCutoff_mem_Icc (w : ℝ) (x : E) :
    selectedRadialCutoff w x ∈ Icc (0 : ℝ) 1 :=
  ⟨Real.smoothTransition.nonneg _, Real.smoothTransition.le_one _⟩

omit [InnerProductSpace ℝ E] in
theorem selectedRadialCutoff_eq_one {w : ℝ} (hw : 0 < w) {x : E} (hx : ‖x‖ ^ 2 ≤ 1 - w) :
    selectedRadialCutoff w x = 1 := by
  apply Real.smoothTransition.one_of_one_le
  exact (le_div_iff₀ (by positivity)).2 (by linarith)

omit [InnerProductSpace ℝ E] in
theorem selectedRadialCutoff_eq_zero {w : ℝ} (hw : 0 < w) {x : E} (hx : 1 + w ≤ ‖x‖ ^ 2) :
    selectedRadialCutoff w x = 0 :=
  Real.smoothTransition.zero_of_nonpos (div_nonpos_of_nonpos_of_nonneg (by linarith) (by positivity))

/-- On a unit radial line the first derivative has size at least the inverse
of the full width somewhere inside the selected band. -/
theorem exists_selectedRadialCutoff_radial_deriv (u : E) (hu : ‖u‖ = 1) {w : ℝ}
    (hw : 0 < w) (hw₁ : w ≤ 1) :
    ∃ r ∈ Ioo (1 - w) (1 + w),
      deriv (fun s : ℝ => selectedRadialCutoff w (s • u)) r = -(1 / (2 * w)) := by
  let f := fun s : ℝ => selectedRadialCutoff w (s • u)
  have hF : ContDiff ℝ ∞ f := (contDiff_selectedRadialCutoff w).comp (contDiff_id.smul contDiff_const)
  obtain ⟨r, hr, hSlope⟩ := exists_deriv_eq_slope f (show 1 - w < 1 + w by linarith)
    hF.continuous.continuousOn (hF.differentiable (by simp)).differentiableOn
  have hLeft : f (1 - w) = 1 := by
    apply selectedRadialCutoff_eq_one hw
    rw [norm_smul, Real.norm_of_nonneg (sub_nonneg.mpr hw₁), hu, mul_one]
    nlinarith [mul_nonneg hw.le (sub_nonneg.mpr hw₁)]
  have hRight : f (1 + w) = 0 := by
    apply selectedRadialCutoff_eq_zero hw
    rw [norm_smul, Real.norm_of_nonneg (by positivity : 0 ≤ 1 + w), hu, mul_one]
    nlinarith [sq_nonneg w]
  refine ⟨r, hr, hSlope.trans ?_⟩
  rw [hLeft, hRight, show 1 + w - (1 - w) = 2 * w by ring]
  ring

private theorem selectedRadialParameter_hasFDerivAt (w : ℝ) (x : E) :
    HasFDerivAt (selectedRadialParameter w) ((-(w⁻¹)) • innerSL ℝ x) x := by
  unfold selectedRadialParameter
  simp only [div_eq_mul_inv]
  convert ((hasStrictFDerivAt_norm_sq x).hasFDerivAt.const_sub (1 + w)).mul_const (2 * w)⁻¹ using 1
  ext v
  simp only [smul_apply, neg_apply, smul_eq_mul, mul_inv]
  ring

/-- Spatial differentiation in any fixed model direction. -/
theorem fderiv_selectedRadialCutoff_apply (w : ℝ) (x u : E) :
    fderiv ℝ (selectedRadialCutoff w) x u =
      -deriv Real.smoothTransition (selectedRadialParameter w x) * (⟪x, u⟫ / w) := by
  have hp := (Real.smoothTransition.contDiff (n := 1)).differentiable (by simp)
  change fderiv ℝ (Real.smoothTransition ∘ selectedRadialParameter w) x u = _
  rw [((hp (selectedRadialParameter w x)).hasDerivAt.comp_hasFDerivAt x
    (selectedRadialParameter_hasFDerivAt w x)).fderiv]
  simp only [smul_apply, smul_eq_mul, innerSL_apply_apply]
  ring

/-- The second spatial derivative retains the tangential Hessian term from
squaring the radial coordinate. -/
theorem fderiv_fderiv_selectedRadialCutoff_apply (w : ℝ) (x u v : E) :
    fderiv ℝ (fun y => fderiv ℝ (selectedRadialCutoff w) y u) x v =
      deriv (deriv Real.smoothTransition) (selectedRadialParameter w x) *
        (⟪x, u⟫ / w) * (⟪x, v⟫ / w) -
      deriv Real.smoothTransition (selectedRadialParameter w x) * (⟪v, u⟫ / w) := by
  simp only [fderiv_selectedRadialCutoff_apply]
  have hp := ((Real.smoothTransition.contDiff (n := 2)).deriv' (n := 1)).differentiable (by simp)
  have hProfile := (hp (selectedRadialParameter w x)).hasDerivAt.comp_hasFDerivAt x
    (selectedRadialParameter_hasFDerivAt w x)
  have hLinear : HasFDerivAt (fun y : E => ⟪y, u⟫ / w) (w⁻¹ • innerSL ℝ u) x := by
    simpa only [real_inner_comm _ u, div_eq_mul_inv, innerSL_apply_apply] using
      ((innerSL ℝ u).hasFDerivAt (x := x)).mul_const w⁻¹
  change fderiv ℝ (-(deriv Real.smoothTransition ∘ selectedRadialParameter w) *
    (fun y => ⟪y, u⟫ / w)) x v = _
  rw [(hProfile.neg.mul hLinear).fderiv]
  simp only [smul_apply, add_apply, neg_apply,
    smul_eq_mul, innerSL_apply_apply, real_inner_comm u v, Pi.neg_apply, Function.comp_apply]
  ring

private theorem exists_smoothTransition_deriv_bounds :
    ∃ C₁ C₂ : ℝ, 0 ≤ C₁ ∧ 0 ≤ C₂ ∧ ∀ z : ℝ,
      |deriv Real.smoothTransition z| ≤ C₁ ∧ |deriv (deriv Real.smoothTransition) z| ≤ C₂ := by
  have h₁ : Continuous (deriv Real.smoothTransition) :=
    ((Real.smoothTransition.contDiff (n := 1)).deriv' (n := 0)).continuous
  have h₂ : Continuous (deriv (deriv Real.smoothTransition)) :=
    (((Real.smoothTransition.contDiff (n := 2)).deriv' (n := 1)).deriv' (n := 0)).continuous
  obtain ⟨C₁, hC₁⟩ := (isCompact_Icc (a := (0 : ℝ)) (b := 1)).bddAbove_image h₁.abs.continuousOn
  obtain ⟨C₂, hC₂⟩ := (isCompact_Icc (a := (0 : ℝ)) (b := 1)).bddAbove_image h₂.abs.continuousOn
  refine ⟨max C₁ 0, max C₂ 0, le_max_right _ _, le_max_right _ _, fun z => ?_⟩
  by_cases hz : z ∈ Icc (0 : ℝ) 1
  · exact ⟨(hC₁ (mem_image_of_mem _ hz)).trans (le_max_left _ _),
      (hC₂ (mem_image_of_mem _ hz)).trans (le_max_left _ _)⟩
  have hConst : ∃ c : ℝ, Real.smoothTransition =ᶠ[𝓝 z] fun _ => c := by
    by_cases hneg : z < 0
    · refine ⟨0, ?_⟩
      filter_upwards [gt_mem_nhds hneg] with y hy
      exact Real.smoothTransition.zero_of_nonpos hy.le
    · have hbig : 1 < z := lt_of_not_ge (fun h => hz ⟨le_of_not_gt hneg, h⟩)
      refine ⟨1, ?_⟩
      filter_upwards [lt_mem_nhds hbig] with y hy
      exact Real.smoothTransition.one_of_one_le hy.le
  obtain ⟨c, hc⟩ := hConst
  rw [hc.deriv_eq, hc.deriv.deriv_eq]
  simp

private theorem abs_inner_div_le {w : ℝ} (hw : 0 < w) {x u : E} {R L : ℝ}
    (hx : ‖x‖ ≤ R) (hu : ‖u‖ ≤ L) : |⟪x, u⟫ / w| ≤ R * L / w := by
  rw [abs_div, abs_of_pos hw]
  exact (div_le_div_iff_of_pos_right hw).2 ((abs_real_inner_le_norm x u).trans
    (mul_le_mul hx hu (norm_nonneg _) ((norm_nonneg x).trans hx)))

/-- There are universal first and second radial-cutoff bounds at each width.
The second bound keeps the lower-order tangential term separately. -/
theorem exists_selectedRadialCutoff_directional_bounds :
    ∃ C₁ C₂ : ℝ, 0 ≤ C₁ ∧ 0 ≤ C₂ ∧ ∀ (w : ℝ) (_ : 0 < w) (L : ℝ) (x u v : E),
      ‖x‖ ≤ 2 → ‖u‖ ≤ L → ‖v‖ ≤ L →
      |fderiv ℝ (selectedRadialCutoff w) x u| ≤ 2 * C₁ * L / w ∧
      |fderiv ℝ (fun y => fderiv ℝ (selectedRadialCutoff w) y u) x v| ≤
        4 * C₂ * L ^ 2 / w ^ 2 + C₁ * L ^ 2 / w := by
  obtain ⟨C₁, C₂, hC₁, hC₂, hC⟩ := exists_smoothTransition_deriv_bounds
  refine ⟨C₁, C₂, hC₁, hC₂, fun w hw L x u v hx hu hv => ?_⟩
  obtain ⟨hφ₁, hφ₂⟩ := hC (selectedRadialParameter w x)
  have hL := (norm_nonneg u).trans hu
  have hxu := abs_inner_div_le hw hx hu
  have hxv := abs_inner_div_le hw hx hv
  have hvu := abs_inner_div_le hw hv hu
  rw [fderiv_selectedRadialCutoff_apply, fderiv_fderiv_selectedRadialCutoff_apply, abs_mul, abs_neg]
  constructor
  · calc
      _ ≤ C₁ * (2 * L / w) := mul_le_mul hφ₁ hxu (abs_nonneg _) hC₁
      _ = _ := by ring
  · refine (abs_sub _ _).trans ?_
    simp only [abs_mul]
    calc
      _ ≤ C₂ * (2 * L / w) * (2 * L / w) + C₁ * (L * L / w) := add_le_add
        (mul_le_mul (mul_le_mul hφ₂ hxu (abs_nonneg _) hC₂) hxv (abs_nonneg _) (by positivity))
        (mul_le_mul hφ₁ hvu (abs_nonneg _) hC₁)
      _ = _ := by ring

variable [FiniteDimensional ℝ E]

/-- Bounds for the derivatives appearing in the actual chart splice formula. -/
theorem exists_selectedRadialCutoff_partial_bounds :
    ∃ C₁ C₂ : ℝ, 0 ≤ C₁ ∧ 0 ≤ C₂ ∧ ∀ (w : ℝ) (_ : 0 < w) (x : E),
      ‖x‖ ≤ 2 → ∀ m i : Fin (Module.finrank ℝ E),
      |partialDeriv i (selectedRadialCutoff w) x| ≤ 2 * C₁ / w ∧
      |partialDeriv m (partialDeriv i (selectedRadialCutoff w)) x| ≤ 4 * C₂ / w ^ 2 + C₁ / w := by
  obtain ⟨C₁, C₂, hC₁, hC₂, hC⟩ := exists_selectedRadialCutoff_directional_bounds (E := E)
  let T := (toEuclidean (E := E)).symm.toContinuousLinearMap
  let L := max (1 : ℝ) ‖T‖
  have hL : 1 ≤ L := le_max_left _ _
  have hBasis (i : Fin (Module.finrank ℝ E)) : ‖chartModelBasis E i‖ ≤ L := by
    rw [chartModelBasis_apply]
    change ‖T (EuclideanSpace.single i (1 : ℝ))‖ ≤ L
    exact (T.le_opNorm _).trans (by simp [PiLp.norm_single, L])
  refine ⟨C₁ * L ^ 2, C₂ * L ^ 2, by positivity, by positivity, fun w hw x hx m i => ?_⟩
  obtain ⟨h₁, h₂⟩ := hC w hw L x (chartModelBasis E i) (chartModelBasis E m) hx (hBasis i) (hBasis m)
  constructor
  · refine h₁.trans ((div_le_div_iff_of_pos_right hw).2 ?_)
    nlinarith only [mul_nonneg hC₁ (mul_nonneg (show 0 ≤ L by linarith) (sub_nonneg.mpr hL))]
  · exact h₂.trans_eq (by ring)


section Measured

variable [MeasurableSpace E] [BorelSpace E] {μ : Measure E}

omit [MeasurableSpace E] [BorelSpace E] in
private theorem contDiff_partialDeriv {f : E → ℝ} (hf : ContDiff ℝ ∞ f)
    (i : Fin (Module.finrank ℝ E)) : ContDiff ℝ ∞ (partialDeriv i f) :=
  (hf.fderiv_right (m := ∞) (by simp)).clm_apply contDiff_const

omit [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E] [BorelSpace E] in
private theorem measuredProduct_memLp_and_le {a d : E → ℝ} {K : ℝ} (hK : 0 ≤ K)
    (ha : AEStronglyMeasurable a μ) (hd : MemLp d 2 μ) (h : ∀ᵐ x ∂μ, |a x| ≤ K) :
    MemLp (a * d) 2 μ ∧ lpNorm (a * d) 2 μ ≤ K * lpNorm d 2 μ := by
  let D : E → ℝ := K • fun x => ‖d x‖
  have hD : MemLp D 2 μ := hd.norm.const_smul K
  have hMeas := ha.mul hd.aestronglyMeasurable
  have hDom : ∀ᵐ x ∂μ, ‖(a * d) x‖ ≤ ‖D x‖ := by
    filter_upwards [h] with x hx
    calc
      ‖(a * d) x‖ = |a x| * ‖d x‖ := by rw [Pi.mul_apply, norm_mul, Real.norm_eq_abs (a x)]
      _ ≤ K * ‖d x‖ := mul_le_mul_of_nonneg_right hx (norm_nonneg _)
      _ = ‖D x‖ := by simp [D, Pi.smul_apply, Real.norm_of_nonneg hK]
  refine ⟨hD.of_le hMeas hDom, ?_⟩
  calc
    _ ≤ lpNorm D 2 μ := ENNReal.toReal_mono hD.eLpNorm_ne_top (eLpNorm_mono_ae hMeas hDom)
    _ = _ := by
      dsimp only [D]
      rw [lpNorm_const_smul, Real.nnnorm_of_nonneg hK, lpNorm_norm hd.aestronglyMeasurable]
      rfl

omit [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E] [BorelSpace E] in
private theorem lpNorm_three_term_smul_le {V P Q : E → ℝ} {a b c t : ℝ}
    (ht : 0 ≤ t) (hV : MemLp V 2 μ) (hP : MemLp P 2 μ)
    (ha : lpNorm V 2 μ ≤ a) (hb : lpNorm P 2 μ ≤ b) (hc : lpNorm Q 2 μ ≤ c) :
    lpNorm (t • (V + P + Q)) 2 μ ≤ t * (a + b + c) := by
  rw [lpNorm_const_smul, Real.nnnorm_of_nonneg ht]
  change t * lpNorm (V + P + Q) 2 μ ≤ t * (a + b + c)
  apply mul_le_mul_of_nonneg_left _ ht
  exact (lpNorm_add_le (hV.add hP) (by norm_num)).trans
    (add_le_add (lpNorm_add_le hV (by norm_num)) le_rfl |>.trans (add_le_add (add_le_add ha hb) hc))

/-- Integrated price of the actual Hessian commutator on the given measure.
Both mixed cutoff/metric-jet products contribute. -/
theorem selectedRadialSpliceSecondPartialError_memLp_and_le
    {w t C₁ C₂ : ℝ} (hw : 0 < w) (ht : t ∈ Icc (0 : ℝ) 1) (hC₁ : 0 ≤ C₁) (hC₂ : 0 ≤ C₂)
    (G B : E → ℝ)
    (m i : Fin (Module.finrank ℝ E))
    (hCutoff : ∀ x : E, ‖x‖ ≤ 2 → ∀ a c : Fin (Module.finrank ℝ E),
      |partialDeriv c (selectedRadialCutoff w) x| ≤ 2 * C₁ / w ∧
      |partialDeriv a (partialDeriv c (selectedRadialCutoff w)) x| ≤ 4 * C₂ / w ^ 2 + C₁ / w)
    (hRegion : ∀ᵐ x ∂μ, ‖x‖ ≤ 2)
    (hValue : MemLp (B - G) 2 μ)
    (hMi : MemLp (partialDeriv m B - partialDeriv m G) 2 μ)
    (hIi : MemLp (partialDeriv i B - partialDeriv i G) 2 μ) :
    let R := fun x => spliceSecondPartialError t (selectedRadialCutoff w) G B x m i
    MemLp R 2 μ ∧ lpNorm R 2 μ ≤ t * (
      (4 * C₂ / w ^ 2 + C₁ / w) * lpNorm (B - G) 2 μ +
      (2 * C₁ / w) * (lpNorm (partialDeriv m B - partialDeriv m G) 2 μ +
        lpNorm (partialDeriv i B - partialDeriv i G) 2 μ)) := by
  intro R
  let A : ℝ := 4 * C₂ / w ^ 2 + C₁ / w
  let C : ℝ := 2 * C₁ / w
  have hA : 0 ≤ A := by dsimp [A]; positivity
  have hC : 0 ≤ C := by dsimp [C]; positivity
  let χ := selectedRadialCutoff (E := E) w
  have hχ := contDiff_selectedRadialCutoff (E := E) w
  let V : E → ℝ := partialDeriv m (partialDeriv i χ) * (B - G)
  let P : E → ℝ := partialDeriv i χ * (partialDeriv m B - partialDeriv m G)
  let Q : E → ℝ := partialDeriv m χ * (partialDeriv i B - partialDeriv i G)
  have hVBound : ∀ᵐ x ∂μ, |partialDeriv m (partialDeriv i χ) x| ≤ A :=
    hRegion.mono fun x hx => (hCutoff x hx m i).2
  have hPBound : ∀ᵐ x ∂μ, |partialDeriv i χ x| ≤ C :=
    hRegion.mono fun x hx => (hCutoff x hx m i).1
  have hQBound : ∀ᵐ x ∂μ, |partialDeriv m χ x| ≤ C :=
    hRegion.mono fun x hx => (hCutoff x hx i m).1
  obtain ⟨hV, hVNorm⟩ : MemLp V 2 μ ∧ lpNorm V 2 μ ≤ A * lpNorm (B - G) 2 μ :=
    measuredProduct_memLp_and_le hA
      (contDiff_partialDeriv (contDiff_partialDeriv hχ i) m).continuous.aestronglyMeasurable hValue hVBound
  obtain ⟨hP, hPNorm⟩ : MemLp P 2 μ ∧ lpNorm P 2 μ ≤ C * lpNorm (partialDeriv m B - partialDeriv m G) 2 μ :=
    measuredProduct_memLp_and_le hC (contDiff_partialDeriv hχ i).continuous.aestronglyMeasurable hMi hPBound
  obtain ⟨hQ, hQNorm⟩ : MemLp Q 2 μ ∧ lpNorm Q 2 μ ≤ C * lpNorm (partialDeriv i B - partialDeriv i G) 2 μ :=
    measuredProduct_memLp_and_le hC (contDiff_partialDeriv hχ m).continuous.aestronglyMeasurable hIi hQBound
  have hR : R = t • (V + P + Q) := by
    funext x
    rfl
  rw [hR]
  refine ⟨((hV.add hP).add hQ).const_smul t, ?_⟩
  have hBound := lpNorm_three_term_smul_le ht.1 hV hP hVNorm hPNorm hQNorm
  simpa only [A, C, mul_add, add_assoc] using hBound

end Measured


section Marked

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "I₄" => 𝓘(ℝ, E₄)
variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]

omit [IsManifold I ∞ M] in
/-- The radial step extends smoothly to the physical source at the same
buffered width. Its zero region includes the entire complement of disk and trim. -/
theorem exists_selectedMarkedRadialCutoff (F : PartialDiffeomorph I₄ I E₄ M ∞) (n : ℕ)
    (hBuffer : Metric.closedBall (0 : E₄) (1 + 1 / ((n : ℝ) + 1)) ⊆ F.source) :
    ∃ χ : M → ℝ, ContMDiff I 𝓘(ℝ) ∞ χ ∧ (∀ y, χ y ∈ Icc (0 : ℝ) 1) ∧
      (∀ x ∈ F.source, χ (F x) = selectedRadialCutoff (1 / ((n : ℝ) + 1)) x) ∧
      (∀ y ∉ selectedChartDisk F ∪ selectedDiskTrim F n, χ y = 0) := by
  classical
  let w : ℝ := 1 / ((n : ℝ) + 1)
  have hw : 0 < w := by dsimp [w]; positivity
  let K := Metric.closedBall (0 : E₄) (1 + w)
  let χ : M → ℝ := F.target.piecewise (selectedRadialCutoff w ∘ F.symm) (fun _ => 0)
  have hPositiveRadius {x : E₄} (hx : selectedRadialCutoff w x ≠ 0) : ‖x‖ < 1 + w := by
    contrapose! hx
    apply selectedRadialCutoff_eq_zero hw
    have h := mul_le_mul hx hx (by positivity) (by positivity)
    nlinarith [sq_nonneg w]
  have hSupp : ∀ y, χ y ≠ 0 → y ∈ F '' K := by
    intro y hy
    have ht : y ∈ F.target := by
      by_contra h
      exact hy (piecewise_eq_of_notMem _ _ _ h)
    have hr := hPositiveRadius (by simpa only [χ, piecewise_eq_of_mem _ _ _ ht, Function.comp_apply] using hy)
    exact ⟨F.symm y, by simpa only [K, Metric.mem_closedBall, dist_zero_right] using hr.le, F.right_inv ht⟩
  have hClosed : IsClosed (F '' K) :=
    ((isCompact_closedBall _ _).image_of_continuousOn (F.contMDiffOn_toFun.continuousOn.mono hBuffer)).isClosed
  have hχOn : ContMDiffOn I 𝓘(ℝ) ∞ χ F.target := by
    apply (((contDiff_selectedRadialCutoff (E := E₄) w).contMDiff.contMDiffOn (s := univ)).comp
      F.contMDiffOn_invFun (mapsTo_univ _ _)).congr
    intro y hy
    exact piecewise_eq_of_mem _ _ _ hy
  refine ⟨χ, ?_, ?_, ?_, ?_⟩
  · intro y
    by_cases hy : y ∈ F.target
    · exact hχOn.contMDiffAt (F.open_target.mem_nhds hy)
    · have hOutside : y ∉ F '' K := by
        rintro ⟨x, hx, rfl⟩
        exact hy (F.map_source (hBuffer hx))
      apply contMDiffAt_const.congr_of_eventuallyEq
      filter_upwards [hClosed.isOpen_compl.mem_nhds hOutside] with z hz
      exact not_ne_iff.mp (fun h => hz (hSupp z h))
  · intro y
    by_cases hy : y ∈ F.target
    · dsimp only [χ]
      rw [piecewise_eq_of_mem _ _ _ hy]
      exact selectedRadialCutoff_mem_Icc w (F.symm y)
    · dsimp only [χ]
      rw [piecewise_eq_of_notMem _ _ _ hy]
      exact ⟨le_rfl, zero_le_one⟩
  · intro x hx
    dsimp only [χ]
    rw [piecewise_eq_of_mem _ _ _ (F.map_source hx), Function.comp_apply]
    exact congrArg (selectedRadialCutoff w) (F.left_inv hx)
  · intro y hy
    by_contra h
    obtain ⟨x, hx, rfl⟩ := hSupp y h
    have hs : x ∈ F.source := hBuffer hx
    have ht := F.map_source hs
    have hn : 1 < ‖x‖ := by
      apply lt_of_not_ge
      intro hx'
      exact hy (Or.inl ⟨x, by simpa only [Metric.mem_closedBall, dist_zero_right] using hx', rfl⟩)
    have hinv : F.symm.toPartialEquiv (F.toPartialEquiv x) = x := F.left_inv hs
    have hu : ‖x‖ < 1 + w := hPositiveRadius (by
      simpa only [χ, piecewise_eq_of_mem _ _ _ ht, Function.comp_apply, hinv] using h)
    apply hy (Or.inr ⟨ht, ?_⟩)
    change |‖F.symm (F x)‖ - 1| < w
    rw [hinv, abs_of_nonneg (sub_nonneg.mpr hn.le)]
    linarith


private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

private def selectedMarkedInverse (F : PartialDiffeomorph I₄ I E₄ M ∞) : M → E₄ := by
  classical
  exact F.target.piecewise F.symm (fun _ => 0)

omit [IsManifold I ∞ M] [T2Space M] in
private theorem measurable_selectedMarkedInverse (F : PartialDiffeomorph I₄ I E₄ M ∞) :
    Measurable (selectedMarkedInverse F) := by
  classical
  exact F.contMDiffOn_invFun.continuousOn.measurable_piecewise continuousOn_const
    F.open_target.measurableSet

/-- Transport the measure of the entire selected trim to the native marking. -/
def selectedTrimPullback (F : PartialDiffeomorph I₄ I E₄ M ∞) (n : ℕ) (μ : Measure M) : Measure E₄ :=
  (μ.restrict (selectedDiskTrim F n)).map (selectedMarkedInverse F)

instance isFiniteMeasure_selectedTrimPullback (F : PartialDiffeomorph I₄ I E₄ M ∞)
    (n : ℕ) (μ : Measure M) [IsFiniteMeasure μ] : IsFiniteMeasure (selectedTrimPullback F n μ) := by
  unfold selectedTrimPullback
  infer_instance

omit [IsManifold I ∞ M] [T2Space M] in
/-- A.e. physical band points become a.e. points of the native radial band
when the restriction is transported to the marking. -/
theorem ae_selectedTrimPullback (F : PartialDiffeomorph I₄ I E₄ M ∞) (n : ℕ) (μ : Measure M) :
    ∀ᵐ x ∂selectedTrimPullback F n μ, |‖x‖ - 1| < 1 / ((n : ℝ) + 1) := by
  have hMeas : MeasurableSet {x : E₄ | |‖x‖ - 1| < 1 / ((n : ℝ) + 1)} :=
    (isOpen_lt ((continuous_norm.sub continuous_const).abs) continuous_const).measurableSet
  apply (ae_map_iff (measurable_selectedMarkedInverse F).aemeasurable hMeas).2
  filter_upwards [ae_restrict_mem (isOpen_selectedDiskTrim F n).measurableSet (μ := μ)] with y hy
  classical
  have hr : |‖F.symm y‖ - 1| < 1 / ((n : ℝ) + 1) := hy.2
  simpa only [selectedMarkedInverse, piecewise_eq_of_mem _ _ _ hy.1] using hr

omit [IsManifold I ∞ M] [T2Space M] in
/-- The transported trim is a.e. inside the closed radius-two ball. -/
theorem ae_selectedTrimPullback_norm_le (F : PartialDiffeomorph I₄ I E₄ M ∞) (n : ℕ) (μ : Measure M) :
    ∀ᵐ x ∂selectedTrimPullback F n μ, ‖x‖ ≤ 2 := by
  filter_upwards [ae_selectedTrimPullback F n μ] with x hx
  have hw : 1 / ((n : ℝ) + 1) ≤ 1 := (div_le_one (by positivity)).2 (by linarith [Nat.cast_nonneg (α := ℝ) n])
  linarith [(abs_lt.mp hx).2]


omit [IsManifold I ∞ M] [T2Space M] in
private theorem memLp_continuous_selectedTrimPullback (F : PartialDiffeomorph I₄ I E₄ M ∞)
    (n : ℕ) (μ : Measure M) [IsFiniteMeasure μ] {f : E₄ → ℝ} (hf : Continuous f) :
    MemLp f 2 (selectedTrimPullback F n μ) := by
  let K := Metric.closedBall (0 : E₄) 2
  obtain ⟨C, hC⟩ := (isCompact_closedBall (0 : E₄) 2).bddAbove_image hf.norm.continuousOn
  apply MemLp.of_bound hf.aestronglyMeasurable C
  filter_upwards [ae_selectedTrimPullback_norm_le F n μ] with x hx
  exact hC (mem_image_of_mem (fun y : E₄ => ‖f y‖) (show x ∈ K by
    simpa only [K, Metric.mem_closedBall, dist_zero_right] using hx))

variable [SigmaCompactSpace M]

/-- The coefficient Hessian commutator in the pullback of the source's
actual physical trim volume. The constants are independent of the source,
the selected width and the interpolation parameter. -/
theorem exists_selectedRadialSpliceSecondPartialError_on_physicalTrim
    (g : SmoothRiemannianMetric I M) [IsFiniteMeasure (riemannianVolumeMeasure I M g)]
    (F : PartialDiffeomorph I₄ I E₄ M ∞) :
    ∃ C₁ C₂ : ℝ, 0 ≤ C₁ ∧ 0 ≤ C₂ ∧ ∀ (n : ℕ) (G B : E₄ → ℝ),
      ContDiff ℝ ∞ G → ContDiff ℝ ∞ B → ∀ (m i : Fin (Module.finrank ℝ E₄))
      (t : ℝ), t ∈ Icc (0 : ℝ) 1 →
      let w : ℝ := 1 / ((n : ℝ) + 1)
      let μ := selectedTrimPullback F n (riemannianVolumeMeasure I M g)
      let R := fun x => spliceSecondPartialError t (selectedRadialCutoff w) G B x m i
      MemLp R 2 μ ∧ lpNorm R 2 μ ≤ t * (
        (4 * C₂ / w ^ 2 + C₁ / w) * lpNorm (B - G) 2 μ +
        (2 * C₁ / w) * (lpNorm (partialDeriv m B - partialDeriv m G) 2 μ +
          lpNorm (partialDeriv i B - partialDeriv i G) 2 μ)) := by
  obtain ⟨C₁, C₂, hC₁, hC₂, hCutoff⟩ := exists_selectedRadialCutoff_partial_bounds (E := E₄)
  refine ⟨C₁, C₂, hC₁, hC₂, fun n G B hG hB m i t ht => ?_⟩
  intro w μ R
  have hw : 0 < w := by dsimp [w]; positivity
  apply selectedRadialSpliceSecondPartialError_memLp_and_le hw ht hC₁ hC₂ G B m i (hCutoff w hw)
    (ae_selectedTrimPullback_norm_le F n (riemannianVolumeMeasure I M g))
  · exact memLp_continuous_selectedTrimPullback F n _ (hB.sub hG).continuous
  · exact memLp_continuous_selectedTrimPullback F n _
      ((contDiff_partialDeriv hB m).sub (contDiff_partialDeriv hG m)).continuous
  · exact memLp_continuous_selectedTrimPullback F n _
      ((contDiff_partialDeriv hB i).sub (contDiff_partialDeriv hG i)).continuous


omit [SigmaCompactSpace M] in
/-- The source tensors admit smooth Euclidean lifts that agree with their
actual native pullbacks on a neighborhood of the entire buffered trim. -/
theorem exists_selectedMarkedMetricLift (F : PartialDiffeomorph I₄ I E₄ M ∞) (n : ℕ)
    (hBuffer : Metric.closedBall (0 : E₄) (1 + 1 / ((n : ℝ) + 1)) ⊆ F.source)
    (g : SmoothRiemannianMetric I M) :
    ∃ (G : SmoothRiemannianMetric I₄ E₄) (V : TopologicalSpace.Opens E₄),
      Metric.closedBall (0 : E₄) (1 + 1 / ((n : ℝ) + 1)) ⊆ (V : Set E₄) ∧
      (V : Set E₄) ⊆ F.source ∧ ∀ x ∈ V, ∀ u v : E₄,
        G.inner x u v = g.inner (F x) (mfderiv I₄ I (F : E₄ → M) x u)
          (mfderiv I₄ I (F : E₄ → M) x v) := by
  let K := Metric.closedBall (0 : E₄) (1 + 1 / ((n : ℝ) + 1))
  have hK : IsCompact (F '' K) :=
    (isCompact_closedBall _ _).image_of_continuousOn (F.contMDiffOn_toFun.continuousOn.mono hBuffer)
  have hKSource : F '' K ⊆ F.symm.source := by
    rintro _ ⟨x, hx, rfl⟩
    exact F.map_source (hBuffer hx)
  obtain ⟨G, U, hKU, hU, hLift, _⟩ :=
    PartialDiffeomorph.exists_metric_preserving_on_neighborhood_of_is_compact
      F.symm g (euclideanMetric E₄) hK hKSource
  let V : TopologicalSpace.Opens E₄ := ⟨F.source ∩ (F : E₄ → M) ⁻¹' U,
    F.toOpenPartialHomeomorph.isOpen_inter_preimage U.isOpen⟩
  refine ⟨G, V, fun x hx => ⟨hBuffer hx, hKU (mem_image_of_mem F hx)⟩, fun _ hx => hx.1, ?_⟩
  rintro x ⟨hx, hxU⟩ u v
  have hxTarget := F.map_source hx
  have hdF := (F.contMDiffOn_toFun.contMDiffAt (F.open_source.mem_nhds hx)).mdifferentiableAt (by simp)
  have hdS := (F.symm.contMDiffOn_toFun.contMDiffAt
    (F.symm.open_source.mem_nhds hxTarget)).mdifferentiableAt (by simp)
  have hLeft : ((F.symm : M → E₄) ∘ (F : E₄ → M)) =ᶠ[𝓝 x] id := by
    filter_upwards [F.open_source.mem_nhds hx] with z hz
    exact F.left_inv hz
  have hDeriv : (mfderiv I I₄ (F.symm : M → E₄) (F x)).comp
      (mfderiv I₄ I (F : E₄ → M) x) = ContinuousLinearMap.id ℝ E₄ := by
    rw [← mfderiv_comp x hdS hdF, hLeft.mfderiv_eq, mfderiv_id]
    rfl
  have hApply (a : E₄) : mfderiv I I₄ (F.symm : M → E₄) (F x)
      (mfderiv I₄ I (F : E₄ → M) x a) = a := DFunLike.congr_fun hDeriv a
  have hinv : F.symm.toPartialEquiv (F.toPartialEquiv x) = x := F.left_inv hx
  have hLiftAt := hLift (F x) hxU (mfderiv I₄ I (F : E₄ → M) x u)
    (mfderiv I₄ I (F : E₄ → M) x v)
  change g.inner (F x) _ _ = G.inner (F.symm.toPartialEquiv (F x)) _ _ at hLiftAt
  calc
    G.inner x u v = G.inner (F.symm.toPartialEquiv (F.toPartialEquiv x)) u v :=
      congrArg (fun y : E₄ => G.inner y u v) hinv.symm
    _ = _ := by simpa only [hApply] using hLiftAt.symm

/-- The inherited coordinate Gram coefficient on the whole Euclidean model
uses the same fixed model basis and hence the same derivatives. -/
theorem selectedMarkedMetricLift_chartGram (G : SmoothRiemannianMetric I₄ E₄)
    (α x : E₄) (a c : Fin (Module.finrank ℝ E₄)) :
    chartGramOnE G α a c x = G.inner x (chartModelBasis E₄ a) (chartModelBasis E₄ c) := by
  rw [chartGramOnE_def, extChartAt_model_space_eq_id, PartialEquiv.refl_symm,
    PartialEquiv.refl_coe, id_eq, chartGramMatrix_apply]
  simp only [chartBasisVecFiber, TangentBundle.symmL_model_space]
  rfl


/-- These exact native Gram coefficients can be used as the smooth scalar
inputs of the physical-trim commutator bound. -/
theorem contDiff_selectedMarkedMetricLift_chartGram (G : SmoothRiemannianMetric I₄ E₄)
    (α : E₄) (a c : Fin (Module.finrank ℝ E₄)) : ContDiff ℝ ∞ (chartGramOnE G α a c) := by
  apply contDiffOn_univ.mp
  simpa only [extChartAt_model_space_eq_id, PartialEquiv.refl_target] using chartGramOnE_contDiffOn G α a c

end Marked

end

end SmoothPoincare
