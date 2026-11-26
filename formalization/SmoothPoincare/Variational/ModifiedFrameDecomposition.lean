import FirstOrderTwistor.SpinTwistedSquare
import SmoothPoincare.Variational.ModifiedEulerCharge

/-! # Four-dimensional curvature norm decomposition in an oriented frame -/

open DifferentialGeometry DifferentialGeometry.Geometry.Curvature
open DifferentialGeometry.Integral.Measure FirstOrderTwistor MeasureTheory SectionsAndConnections Set
open scoped ContDiff Manifold

namespace SmoothPoincare

private theorem traceFreeChiralBlock_entry (A : Matrix (Fin 3) (Fin 3) ℝ) (i j : Fin 3) :
    traceFreeChiralBlock A i j = A i j - (A.trace / 3) * (if i = j then 1 else 0) := by
  change A i j - (A.trace / 3) • (1 : Matrix (Fin 3) (Fin 3) ℝ) i j = _
  rw [smul_eq_mul, Matrix.one_apply]

/-- The four-slot squared norm of an algebraic curvature tensor. The two
normalized wedge compressions have their traces removed, and the Ricci trace
uses the same slot convention as the curvature operator. -/
theorem frameTensorNormSq_eq_chiral_ricci_scalar (R : CurvatureFrameTensor)
    (hFirst : ∀ a b c d, R b a c d = -R a b c d)
    (hLast : ∀ a b c d, R a b d c = -R a b c d)
    (hPair : ∀ a b c d, R a b c d = R c d a b)
    (hBianchi : R 0 1 2 3 + R 1 2 0 3 + R 2 0 1 3 = 0) :
    frameTensorNormSq R =
      4 * (hilbertSchmidtSq (traceFreeChiralBlock (selfDualCurvatureBlock R)) +
        hilbertSchmidtSq (traceFreeChiralBlock (antiSelfDualCurvatureBlock R))) +
      2 * (∑ a : Fin 4, ∑ b : Fin 4, (frameRicciTensor R a b -
        (frameScalarCurvature R / 4) * (if a = b then 1 else 0)) ^ 2) +
      frameScalarCurvature R ^ 2 / 6 := by
  have firstDiagonal (a c d : Fin 4) : R a a c d = 0 := by
    linarith only [hFirst a a c d]
  have lastDiagonal (a b c : Fin 4) : R a b c c = 0 := by
    linarith only [hLast a b c c]
  have orderFirst (a b c d : Fin 4) (_h : b < a) : R a b c d = -R b a c d :=
    hFirst b a c d
  have orderLast (a b c d : Fin 4) (_h : d < c) : R a b c d = -R a b d c :=
    hLast a b d c
  have orderPairs (a b c d : Fin 4) (_h : 4 * c.val + d.val < 4 * a.val + b.val) :
      R a b c d = R c d a b := hPair a b c d
  have bianchi : R 0 1 2 3 = R 0 2 1 3 - R 0 3 1 2 := by
    rw [hPair 1 2 0 3, hFirst 0 2 1 3] at hBianchi
    linarith only [hBianchi]
  simp only [frameTensorNormSq, hilbertSchmidtSq, frameRicciTensor, frameScalarCurvature,
    Fin.sum_univ_four, Fin.sum_univ_three]
  simp only [traceFreeChiralBlock_entry]
  simp only [Matrix.trace, Fin.sum_univ_three]
  simp only [Matrix.diag_apply]
  norm_num [selfDualCurvatureBlock, antiSelfDualCurvatureBlock, selfDualFirstWedge,
    selfDualSecondWedge]
  simp (disch := decide) only [firstDiagonal, lastDiagonal, orderFirst, orderLast, orderPairs,
    neg_neg, bianchi]
  ring

/-- The actual Levi–Civita curvature norm, in the same frame and convention
as the physical chiral and trace-free Ricci densities. -/
theorem metricFrameTensorNormSq_eq_chiral_ricci_scalar
    {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
    [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
    [BoundarylessManifold I M] [T2Space M]
    (g : SmoothRiemannianMetric I M) (o : ManifoldOrientation I M 4) (x : M)
    (f : OrientedOrthonormalFrameAt g o x) :
    frameTensorNormSq (metricCurvatureFrameTensor g o x f) =
      4 * (hilbertSchmidtSq (geometricChiralBlock g o x f) +
        hilbertSchmidtSq (endpointNegativeWeylBlock g o x f)) +
      2 * endpointRicciDefectDensity g o x f + metricScalarAt g x ^ 2 / 6 := by
  simpa only [geometricChiralBlock, endpointNegativeWeylBlock, endpointRicciDefectDensity,
    frameScalarCurvature_metric] using
    frameTensorNormSq_eq_chiral_ricci_scalar (metricCurvatureFrameTensor g o x f)
      (metricCurvatureFrameTensor_swap_first g o x f)
      (metricCurvatureFrameTensor_swap_last g o x f)
      (metricCurvatureFrameTensor_pair_symm g o x f)
      (metricCurvatureFrameTensor_bianchi g o x f 0 1 2 3)

section Cutoff

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [BoundarylessManifold I M] [T2Space M] [CompactSpace M]

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

/-- The tested identity follows from the pointwise decomposition. The
weighted full density dominates the four measurable, nonnegative summands. -/
theorem modifiedCutoffMoments_full_eq (o : ManifoldOrientation I M 4)
    (g : SmoothRiemannianMetric I M) (f : ∀ x, OrientedOrthonormalFrameAt g o x)
    (χ : M → ℝ) (hχ : ∀ x, 0 ≤ χ x) :
    let w := fun c x => χ x * modifiedChargeDensity o g f c x
    let μ := riemannianVolumeMeasure I M g
    let m := fun c => ∫ x, w c x ∂μ
    Integrable (w .full) μ → (∀ c, AEStronglyMeasurable (w c) μ) →
    m .full = 4 * (m .plus + m .minus) + 2 * m .ricci + m .scalar / 6 := by
  intro w μ m hFull hMeas
  have hSplit (x : M) :
      w .full x = 4 * (w .plus x + w .minus x) + 2 * w .ricci x + w .scalar x / 6 := by
    dsimp only [w, modifiedChargeDensity]
    rw [metricFrameTensorNormSq_eq_chiral_ricci_scalar]
    ring
  have hNonneg (c : ModifiedChargeComponent) (x : M) : 0 ≤ w c x :=
    mul_nonneg (hχ x) (modifiedChargeDensity_nonneg o g f c x)
  have hBounds (x : M) : w .plus x ≤ w .full x ∧ w .minus x ≤ w .full x ∧
      w .ricci x ≤ w .full x ∧ w .scalar x ≤ 6 * w .full x := by
    refine ⟨?_, ?_, ?_, ?_⟩ <;>
      linarith only [hSplit x, hNonneg .plus x, hNonneg .minus x, hNonneg .ricci x, hNonneg .scalar x]
  have hp := hFull.mono_nonneg (hMeas .plus) (ae_of_all _ (hNonneg .plus))
    (ae_of_all _ fun x => (hBounds x).1)
  have hn := hFull.mono_nonneg (hMeas .minus) (ae_of_all _ (hNonneg .minus))
    (ae_of_all _ fun x => (hBounds x).2.1)
  have hr := hFull.mono_nonneg (hMeas .ricci) (ae_of_all _ (hNonneg .ricci))
    (ae_of_all _ fun x => (hBounds x).2.2.1)
  have hs := (hFull.const_mul 6).mono_nonneg (hMeas .scalar) (ae_of_all _ (hNonneg .scalar))
    (ae_of_all _ fun x => (hBounds x).2.2.2)
  have hChiral : Integrable (fun x => 4 * (w .plus x + w .minus x)) μ := (hp.add hn).const_mul 4
  have hRicci := hr.const_mul 2
  have hChiralRicci : Integrable (fun x => 4 * (w .plus x + w .minus x) + 2 * w .ricci x) μ :=
    hChiral.add hRicci
  calc
    m .full = ∫ x, (4 * (w .plus x + w .minus x) + 2 * w .ricci x + w .scalar x / 6) ∂μ :=
      integral_congr_ae (ae_of_all _ hSplit)
    _ = _ := by
      dsimp only [m]
      rw [integral_add hChiralRicci (hs.div_const 6), integral_add hChiral hRicci,
        integral_const_mul, integral_const_mul, integral_add hp hn, integral_div]

/-- The finite-time Ricci lower bound with the tested initial decomposition
derived from the initial slice's actual curvature and cutoff. -/
theorem modifiedTerminalRicci_lower_of_eulerTransport_of_measurableCharges
    (o : ManifoldOrientation I M 4) (g₀ gτ : SmoothRiemannianMetric I M)
    (f₀ : ∀ x, OrientedOrthonormalFrameAt g₀ o x) (fτ : ∀ x, OrientedOrthonormalFrameAt gτ o x)
    (χ : M → ℝ) {A B : Set M} (hA : MeasurableSet A) (hB : MeasurableSet B)
    (hχ : ∀ x, χ x ∈ Icc (0 : ℝ) 1) (hOne : ∀ x ∈ A, χ x = 1)
    (hZero : ∀ x ∉ B, χ x = 0) {τ b C ε : ℝ} (hτ : 0 < τ) (hb : b < 1 / 2) :
    let u := modifiedChargeDensity o g₀ f₀
    let v := modifiedChargeDensity o gτ fτ
    let μ := riemannianVolumeMeasure I M g₀
    let ν := riemannianVolumeMeasure I M gτ
    let m := fun c => ∫ x, χ x * u c x ∂μ
    let n := fun c => ∫ x, χ x * v c x ∂ν
    Integrable (u .full) μ → Integrable (fun x => χ x * u .full x) μ →
    Integrable (v .ricci) ν → Integrable (fun x => χ x * v .ricci x) ν →
    (∀ c, AEStronglyMeasurable (fun x => χ x * u c x) μ) →
    ε ^ 2 ≤ (∫ x in A, u .full x ∂μ) →
    |modifiedEulerMoment n - modifiedEulerMoment m| ≤
      C * Real.sqrt (∫ s in (0 : ℝ)..τ, τ ^ (2 * b) * s ^ (-(2 * b))) →
    ε ^ 2 / 2 - 4 * (m .plus + m .minus) - m .scalar / 6 -
      2 * C * Real.sqrt (τ / (1 - 2 * b)) ≤ ∫ x in B, v .ricci x ∂ν := by
  intro u v μ ν m n hu hwu hv hwv hMeas hcharge htrans
  exact modifiedTerminalRicci_lower_of_eulerTransport o g₀ gτ f₀ fτ χ hA hB hχ hOne hZero hτ hb
    hu hwu hv hwv hcharge
    (modifiedCutoffMoments_full_eq o g₀ f₀ χ (fun x => (hχ x).1) hwu hMeas) htrans

end Cutoff

end SmoothPoincare
