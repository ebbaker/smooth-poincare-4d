import SmoothPoincare.Variational.EndpointChargeTransfer

/-! # Finite-index physical charge above the recognition endpoint

A small omitted volume in the modified Yamabe gauge bounds the two omitted
chiral integrals of the original physical metric on the same set.
-/

open DifferentialGeometry DifferentialGeometry.Geometry.Curvature DifferentialGeometry.Integral.Measure
open Filter FirstOrderTwistor MeasureTheory SectionsAndConnections Set
open scoped ContDiff Manifold

namespace SmoothPoincare

section Measured

variable {X : Type*} [MeasurableSpace X] {μ : Measure X} [IsProbabilityMeasure μ]

private theorem setIntegral_le_sqrt_square_mul_sqrt_measure {L : X → ℝ}
    (hL : MemLp L 2 μ) (S : Set X) :
    (∫ x in S, L x ∂μ) ≤ Real.sqrt (∫ x in S, L x ^ 2 ∂μ) * Real.sqrt (μ.real S) := by
  have hc := integral_mul_norm_le_Lp_mul_Lq (f := L) (g := fun _ : X => (1 : ℝ))
    (μ := μ.restrict S) Real.HolderConjugate.two_two
    (by simpa using hL.restrict S) (memLp_const (1 : ℝ))
  have hnorm : (∫ x in S, L x ∂μ) ≤ ∫ x in S, ‖L x‖ ∂μ :=
    (le_abs_self _).trans (norm_integral_le_integral_norm L)
  refine hnorm.trans ?_
  simpa only [norm_one, one_pow, mul_one, Real.rpow_two, Real.norm_eq_abs, sq_abs,
    integral_const, smul_eq_mul, Measure.real_def, Measure.restrict_apply MeasurableSet.univ,
    univ_inter, ← Real.sqrt_eq_rpow] using hc

/-- A bound on the omitted volume in the probability gauge leaves at least
the squared positive part of the remaining first moment on the retained set. -/
theorem modifiedYamabe_retained_square_ge {L : X → ℝ} {ell Y c d : ℝ}
    (hL : MemLp L 2 μ) (hell : 0 ≤ ell) (hMoment : ∫ x, L x ^ 2 ∂μ = ell ^ 2)
    (hc : c ≤ 0) (hTest : Y ≤ c + 6 * ∫ x, L x ∂μ)
    {U : Set X} (hU : MeasurableSet U) (hd : μ.real Uᶜ ≤ d) :
    (max (Y / 6 - ell * Real.sqrt d) 0) ^ 2 ≤ ∫ x in U, L x ^ 2 ∂μ := by
  have hTotMono : (∫ x in Uᶜ, L x ^ 2 ∂μ) ≤ ∫ x, L x ^ 2 ∂μ :=
    setIntegral_le_integral hL.integrable_sq (Eventually.of_forall fun x => sq_nonneg (L x))
  have hOmitted := (setIntegral_le_sqrt_square_mul_sqrt_measure hL Uᶜ).trans
    (mul_le_mul (Real.sqrt_le_sqrt (hTotMono.trans_eq hMoment)) (Real.sqrt_le_sqrt hd)
      (Real.sqrt_nonneg _) (Real.sqrt_nonneg _))
  rw [Real.sqrt_sq hell] at hOmitted
  have hSplit := integral_add_compl hU (hL.integrable (by norm_num))
  have hRetained := (setIntegral_le_sqrt_square_mul_sqrt_measure hL U).trans
    (mul_le_of_le_one_right (Real.sqrt_nonneg _) (by
      rw [← Real.sqrt_one]
      exact Real.sqrt_le_sqrt (measureReal_le_one (μ := μ) (s := U))))
  have hLower : Y / 6 - ell * Real.sqrt d ≤ Real.sqrt (∫ x in U, L x ^ 2 ∂μ) := by
    linarith only [hTest, hc, hSplit, hOmitted, hRetained]
  have hroot := max_le hLower (Real.sqrt_nonneg _)
  exact (pow_le_pow_left₀ (le_max_right _ _) hroot 2).trans_eq
    (Real.sq_sqrt (integral_nonneg fun _ => sq_nonneg _))

end Measured

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  [CompactSpace M] [Nonempty M]

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

/-- Four-dimensional physical Yamabe, spectral, and Euler bounds at one
source index, using the spectral moment in the modified probability gauge. -/
theorem bandPhysical_yamabeEuler_sandwich
    (o : ManifoldOrientation I M 4) (g : SmoothRiemannianMetric I M)
    (frame : ∀ x, OrientedOrthonormalFrameAt g o x) (plus minus : M → Fin 3 → ℝ)
    (h : EndpointPhysicalSpectralData o g frame plus minus)
    {μ : Measure M} [IsProbabilityMeasure μ] {L : M → ℝ} {ell c : ℝ}
    (hL : MemLp L 2 μ) (hell : 0 ≤ ell)
    (hMoment : ∫ x, L x ^ 2 ∂μ = ell ^ 2)
    (hTotalTransport : (∫ x, endpointTopWeyl (plus x) (minus x) ^ 2
      ∂riemannianVolumeMeasure I M g) = ell ^ 2)
    (hc : c ≤ 0) (hTest : classYamabeFour o.dimension_eq g ≤ c + 6 * ∫ x, L x ∂μ) :
    let e := chiralFrameEnergy g (fun x => geometricChiralBlock g o x (frame x))
    let Y := classYamabeFour o.dimension_eq g
    0 < Y / 6 ∧ Y / 6 ≤ ell ∧ ell ^ 2 ≤ (4 / 3 : ℝ) * e ∧
      48 * (8 * Real.pi ^ 2 - e) ≤ Y ^ 2 := by
  intro e Y
  have hFloor := (modifiedYamabe_variance_le hL hell hMoment hTest).2
  have hD := endpointPhysicalSpectralDeficit o g frame plus minus h
  dsimp only at hD
  rw [hTotalTransport] at hD
  have hScalar : (∫ x, metricScalarAt g x ^ 2 ∂riemannianVolumeMeasure I M g) = Y ^ 2 := by
    simp [Y, h.yamabe_scalar, h.volume_one, Measure.real_def]
  have hEuler := h.euler_two
  dsimp only at hEuler
  rw [h.signature_zero, hScalar] at hEuler
  exact ⟨div_pos h.positive (by norm_num), by linarith only [hFloor, hc],
    by linarith only [hD.1, hD.2.2.1], by linarith only [hEuler, hD.2.1]⟩

/-- The E58 measured bound on both physical residuals, for an already chosen
measurable retained set of small omitted modified Yamabe volume. -/
theorem bandPhysical_omitted_charges
    (o : ManifoldOrientation I M 4) (g : SmoothRiemannianMetric I M)
    (frame : ∀ x, OrientedOrthonormalFrameAt g o x) (plus minus : M → Fin 3 → ℝ)
    (h : EndpointPhysicalSpectralData o g frame plus minus)
    {μ : Measure M} [IsProbabilityMeasure μ] {L : M → ℝ} {ell c d : ℝ}
    (hL : MemLp L 2 μ) (hell : 0 ≤ ell) (hMoment : ∫ x, L x ^ 2 ∂μ = ell ^ 2)
    (hc : c ≤ 0) (hTest : classYamabeFour o.dimension_eq g ≤ c + 6 * ∫ x, L x ∂μ)
    {U : Set M} (hU : MeasurableSet U) (hd : μ.real Uᶜ ≤ d)
    (hTransport : (∫ x in U, endpointTopWeyl (plus x) (minus x) ^ 2
      ∂riemannianVolumeMeasure I M g) = ∫ x in U, L x ^ 2 ∂μ) :
    let dV := riemannianVolumeMeasure I M g
    let P := fun x => hilbertSchmidtSq (geometricChiralBlock g o x (frame x))
    let N := fun x => hilbertSchmidtSq (endpointNegativeWeylBlock g o x (frame x))
    let e := chiralFrameEnergy g (fun x => geometricChiralBlock g o x (frame x))
    let Y := classYamabeFour o.dimension_eq g
    let B := 2 * e - (3 / 2 : ℝ) * (max (Y / 6 - ell * Real.sqrt d) 0) ^ 2
    (∫ x in Uᶜ, P x ∂dV) ≤ B ∧ (∫ x in Uᶜ, N x ∂dV) ≤ B := by
  intro dV P N e Y B
  have hPN (x : M) : endpointTopWeyl (plus x) (minus x) ^ 2 ≤
      (2 / 3 : ℝ) * (P x + N x) := by
    have heq := endpointSpectralDefectDensity_eq _ _ _ _ (h.plus_spectrum x) (h.minus_spectrum x)
      (trace_geometricChiralBlock g o x (frame x)) (trace_traceFreeChiralBlock _)
    exact sub_nonneg.mp (heq ▸ endpointSpectralDefectDensity_nonneg (plus x) (minus x))
  have hCombined := setIntegral_mono_on h.top_integrable.integrableOn
    ((h.plus_integrable.add h.minus_integrable).const_mul (2 / 3 : ℝ)).integrableOn hU
    (fun x _ => hPN x)
  rw [hTransport, integral_const_mul] at hCombined
  change (∫ x in U, L x ^ 2 ∂μ) ≤ (2 / 3 : ℝ) * (∫ x in U, P x + N x ∂dV) at hCombined
  rw [integral_add h.plus_integrable.integrableOn h.minus_integrable.integrableOn] at hCombined
  have hAux := modifiedYamabe_retained_square_ge hL hell hMoment hc hTest hU hd
  change (max (Y / 6 - ell * Real.sqrt d) 0) ^ 2 ≤ _ at hAux
  have hSplitP : (∫ x in U, P x ∂dV) + (∫ x in Uᶜ, P x ∂dV) = e :=
    integral_add_compl hU h.plus_integrable
  have hSplitN : (∫ x in U, N x ∂dV) + (∫ x in Uᶜ, N x ∂dV) = e :=
    (integral_add_compl hU h.minus_integrable).trans h.signature_zero
  have hPNonneg : 0 ≤ ∫ x in Uᶜ, P x ∂dV := integral_nonneg fun _ =>
    Finset.sum_nonneg fun _ _ => Finset.sum_nonneg fun _ _ => sq_nonneg _
  have hNNonneg : 0 ≤ ∫ x in Uᶜ, N x ∂dV := integral_nonneg fun _ =>
    Finset.sum_nonneg fun _ _ => Finset.sum_nonneg fun _ _ => sq_nonneg _
  dsimp only [B]
  constructor <;> linarith only [hAux, hCombined, hSplitP, hSplitN, hPNonneg, hNNonneg]

end SmoothPoincare
