import SmoothPoincare.IntrinsicEntry.MatchedBallRobin
import Mathlib.Algebra.BigOperators.Fin
import Mathlib.Analysis.Real.Sqrt

/-!
# Weighted half-Laplacian comparison on a round-conformal cut

The compact spectral and conformal-operator inputs are explicit. The physical
boundary is measured with its induced metric, and the metric rescaled by the
positive scalar weight is used only for Raulot's spectral comparison.
-/

noncomputable section

open Filter MeasureTheory Set

namespace SmoothPoincare.IntrinsicEntry

/-- The boundary weight in the physical metric. -/
def boundaryScalarWeight {B : Type*} (R : B → ℝ) (x : B) : ℝ :=
  Real.sqrt (R x / 6)

/-- The unit round boundary has scalar curvature six and weight one. -/
theorem boundaryScalarWeight_round {B : Type*} (x : B) :
    boundaryScalarWeight (fun _ ↦ 6) x = 1 := by
  norm_num [boundaryScalarWeight]

/-- The normal component of a trace-free four-tensor in an orthonormal frame. -/
theorem traceFree_normalComponent_sq_le (Z : Fin 4 → Fin 4 → ℝ)
    (htrace : ∑ i, Z i i = 0) :
    Z 0 0 ^ 2 ≤ (3 / 4 : ℝ) * ∑ i, ∑ j, Z i j ^ 2 := by
  have hdiag : (∑ i, Z i i ^ 2) ≤ ∑ i, ∑ j, Z i j ^ 2 :=
    Finset.sum_le_sum fun i _ ↦ Finset.single_le_sum (fun j _ ↦ sq_nonneg (Z i j)) (Finset.mem_univ i)
  have hzero : Z 0 0 = -(Z 1 1 + Z 2 2 + Z 3 3) := by
    have hs : Z 0 0 + Z 1 1 + Z 2 2 + Z 3 3 = 0 := by
      simpa [Fin.sum_univ_four, add_assoc] using htrace
    linarith
  have hsq : Z 0 0 ^ 2 = (Z 1 1 + Z 2 2 + Z 3 3) ^ 2 := by rw [hzero, neg_sq]
  have hCauchy : Z 0 0 ^ 2 ≤ 3 * (Z 1 1 ^ 2 + Z 2 2 ^ 2 + Z 3 3 ^ 2) := by
    nlinarith only [hsq, sq_nonneg (Z 1 1 - Z 2 2), sq_nonneg (Z 1 1 - Z 3 3),
      sq_nonneg (Z 2 2 - Z 3 3)]
  rw [Fin.sum_univ_four] at hdiag
  linarith only [hdiag, hCauchy]

/-- Pointwise data in one CGY pinched representative, in frames with index
zero normal to the given umbilic cut. The intrinsic scalar and mean curvature
are those of that boundary. -/
structure UmbilicBoundaryGauss {B : Type*} (H R : B → ℝ) where
  ambientScalar : B → ℝ
  normalRicci : B → ℝ
  traceFreeRicci : B → Fin 4 → Fin 4 → ℝ
  ambientScalarPos : ∀ x, 0 < ambientScalar x
  traceFree : ∀ x, ∑ i, traceFreeRicci x i i = 0
  pinched : ∀ x, (∑ i, ∑ j, traceFreeRicci x i j ^ 2) < ambientScalar x ^ 2 / 12
  normalRicci_eq : ∀ x, normalRicci x = ambientScalar x / 4 + traceFreeRicci x 0 0
  gauss : ∀ x, R x = ambientScalar x - 2 * normalRicci x + (2 / 3 : ℝ) * H x ^ 2

/-- Pinching and the umbilic Gauss identity give a positive boundary scalar
and a strict comparison with either outward mean curvature. -/
theorem UmbilicBoundaryGauss.scalar_pos_and_absMean_lt {B : Type*} {H R : B → ℝ}
    (G : UmbilicBoundaryGauss H R) (x : B) :
    0 < R x ∧ |H x| < 3 * boundaryScalarWeight R x := by
  have hsmall := traceFree_normalComponent_sq_le (G.traceFreeRicci x) (G.traceFree x)
  have hzsq : G.traceFreeRicci x 0 0 ^ 2 < (G.ambientScalar x / 4) ^ 2 := by
    nlinarith only [hsmall, G.pinched x]
  have hz : G.traceFreeRicci x 0 0 < G.ambientScalar x / 4 := by
    by_contra! h
    nlinarith only [G.ambientScalarPos x, hzsq,
      mul_nonneg (sub_nonneg.mpr h)
        (show 0 ≤ G.traceFreeRicci x 0 0 + G.ambientScalar x / 4 by linarith [G.ambientScalarPos x])]
  have hne : 0 < G.ambientScalar x - 2 * G.normalRicci x := by
    rw [G.normalRicci_eq]
    linarith
  have hR : 0 < R x := by linarith [G.gauss x, sq_nonneg (H x)]
  have hs : (boundaryScalarWeight R x) ^ 2 = R x / 6 :=
    Real.sq_sqrt (by positivity)
  have hW : 0 ≤ boundaryScalarWeight R x := Real.sqrt_nonneg _
  have hsq : |H x| ^ 2 < (3 * boundaryScalarWeight R x) ^ 2 := by
    rw [sq_abs]
    nlinarith only [G.gauss x, hne, hs]
  exact ⟨hR, lt_of_not_ge fun h ↦ hsq.not_ge
    ((sq_le_sq₀ (by positivity : 0 ≤ 3 * boundaryScalarWeight R x) (abs_nonneg _)).mpr h)⟩

/-- First weighted Rayleigh eigenvalues in boundary dimension three.
The sign premise identifies the positive branch of the half-Laplacian spectrum. -/
theorem firstHalfLaplacian_ge_one_of_raulot
    {p₁ p₂ : ℝ} (hpos : 0 ≤ p₁) (h₂ : 3 / 4 ≤ p₂)
    (hraulot : (4 / 3 : ℝ) * p₂ ≤ p₁ ^ 2) : 1 ≤ p₁ := by
  have hsq : 1 ≤ p₁ ^ 2 := by linarith
  exact (sq_le_sq₀ zero_le_one hpos).mp (by simpa using hsq)

section WeightedMeasure

variable {B : Type*} [MeasurableSpace B] (μ : Measure B) (R : B → ℝ)

/-- Squared mass in the temporary metric `V² h`, whose volume is `V³ dA_h`. -/
def weightedHatMassSq (φ : B → ℝ) : ℝ :=
  ∫ x, φ x ^ 2 ∂ballBoundaryVolume μ (boundaryScalarWeight R)

private theorem weightedHatMassSq_eq (hR : Measurable R) (φ : B → ℝ) :
    weightedHatMassSq μ R φ = ∫ x, boundaryScalarWeight R x ^ 3 * φ x ^ 2 ∂μ := by
  have hW : Measurable (boundaryScalarWeight R) := (hR.div measurable_const).sqrt
  unfold weightedHatMassSq ballBoundaryVolume
  rw [integral_withDensity_eq_integral_toReal_smul (hW.pow_const 3).ennreal_ofReal
    (ae_of_all _ fun _ ↦ ENNReal.ofReal_lt_top)]
  apply integral_congr_ae
  exact ae_of_all _ fun x ↦ by
    change (ENNReal.ofReal (boundaryScalarWeight R x ^ 3)).toReal • φ x ^ 2 = _
    have h_nonneg : 0 ≤ boundaryScalarWeight R x := Real.sqrt_nonneg _
    rw [ENNReal.toReal_ofReal (pow_nonneg h_nonneg 3), smul_eq_mul]

private theorem weightedHatMassSq_order_two (hR : Measurable R) (φ : B → ℝ) :
    weightedHatMassSq μ R φ =
      ∫ x, boundaryScalarWeight R x ^ 2 * (Real.sqrt (boundaryScalarWeight R x) * φ x) ^ 2
        ∂μ := by
  rw [weightedHatMassSq_eq μ R hR φ]
  apply integral_congr_ae
  exact ae_of_all _ fun x ↦ by
    have h_nonneg : 0 ≤ boundaryScalarWeight R x := Real.sqrt_nonneg _
    change boundaryScalarWeight R x ^ 3 * φ x ^ 2 =
      boundaryScalarWeight R x ^ 2 * (Real.sqrt (boundaryScalarWeight R x) * φ x) ^ 2
    rw [mul_pow, Real.sq_sqrt h_nonneg]
    ring

private theorem weightedHatMassSq_order_one (hR : Measurable R) (hRpos : ∀ x, 0 < R x)
    (f : B → ℝ) :
    weightedHatMassSq μ R (fun x ↦ f x / boundaryScalarWeight R x) =
      ∫ x, boundaryScalarWeight R x * f x ^ 2 ∂μ := by
  rw [weightedHatMassSq_eq μ R hR]
  apply integral_congr_ae
  exact ae_of_all _ fun x ↦ by
    change boundaryScalarWeight R x ^ 3 * (f x / boundaryScalarWeight R x) ^ 2 = _
    have hp : 0 < boundaryScalarWeight R x := Real.sqrt_pos.2 (by linarith [hRpos x])
    field_simp

end WeightedMeasure

/-- The analytic supplier uses the same physical boundary as the matched ball.
The spectral comparison and order-one/order-two covariance are stated in their
normalizations. Cap minimization is the harmonic-extension inequality from
the Euclidean unit ball, transported to the marked physical trace. -/
structure WeightedBallBoundarySpectrum {V C B Test : Type*} [MeasurableSpace V]
    [MeasurableSpace C] [MeasurableSpace B] (D : MatchedBallRobinData V C B Test)
    (R : B → ℝ) where
  scalarMeasurable : Measurable R
  p1FirstEigenvalue : ℝ
  p2FirstEigenvalue : ℝ
  p2Ground : B → ℝ
  p2GroundMass : weightedHatMassSq D.boundaryVolume R p2Ground = 1
  p2GroundGradient : ℝ
  p2GroundGradientNonneg : 0 ≤ p2GroundGradient
  p2CovariantGroundForm : p2FirstEigenvalue = p2GroundGradient +
    ∫ x, (R x / 8) * (Real.sqrt (boundaryScalarWeight R x) * p2Ground x) ^ 2 ∂D.boundaryVolume
  p1FirstEigenvalueNonneg : 0 ≤ p1FirstEigenvalue
  raulot : (4 / 3 : ℝ) * p2FirstEigenvalue ≤ p1FirstEigenvalue ^ 2
  p1HatForm : (B → ℝ) → ℝ
  p1PhysicalForm : (B → ℝ) → ℝ
  p1Rayleigh : ∀ t, p1FirstEigenvalue *
    weightedHatMassSq D.boundaryVolume R (fun x ↦ D.coreTrace t x / boundaryScalarWeight R x) ≤
      p1HatForm (fun x ↦ D.coreTrace t x / boundaryScalarWeight R x)
  p1Covariance : ∀ t,
    p1HatForm (fun x ↦ D.coreTrace t x / boundaryScalarWeight R x) = p1PhysicalForm (D.coreTrace t)
  weightedTraceIntegrable : ∀ t,
    Integrable (fun x ↦ boundaryScalarWeight R x * D.coreTrace t x ^ 2) D.boundaryVolume
  capMinimization : ∀ t, 6 * p1PhysicalForm (D.coreTrace t) ≤ D.capRobinForm t

namespace WeightedBallBoundarySpectrum

variable {V C B Test : Type*} [MeasurableSpace V] [MeasurableSpace C] [MeasurableSpace B]
variable {D : MatchedBallRobinData V C B Test} {R : B → ℝ}
variable (S : WeightedBallBoundarySpectrum D R)

theorem p2FirstEigenvalue_lower (hRpos : ∀ x, 0 < R x) : 3 / 4 ≤ S.p2FirstEigenvalue := by
  have hMass := weightedHatMassSq_order_two D.boundaryVolume R S.scalarMeasurable S.p2Ground
  have hpot (x : B) : R x / 8 = (3 / 4 : ℝ) * boundaryScalarWeight R x ^ 2 := by
    have hs : (boundaryScalarWeight R x) ^ 2 = R x / 6 :=
      Real.sq_sqrt (by linarith [hRpos x])
    rw [hs]
    ring
  rw [S.p2CovariantGroundForm]
  simp_rw [hpot, mul_assoc]
  rw [integral_const_mul, ← hMass, S.p2GroundMass]
  linarith [S.p2GroundGradientNonneg]

/-- Raulot's bound gives the weighted order-one comparison in the physical metric. -/
theorem p1PhysicalForm_lower (hRpos : ∀ x, 0 < R x) (t : Test) :
    (∫ x, boundaryScalarWeight R x * D.coreTrace t x ^ 2 ∂D.boundaryVolume) ≤
      S.p1PhysicalForm (D.coreTrace t) := by
  have hP1 := firstHalfLaplacian_ge_one_of_raulot S.p1FirstEigenvalueNonneg
    (S.p2FirstEigenvalue_lower hRpos) S.raulot
  have hRay := S.p1Rayleigh t
  rw [weightedHatMassSq_order_one _ _ S.scalarMeasurable hRpos, S.p1Covariance t] at hRay
  have hWeight : 0 ≤ ∫ x, boundaryScalarWeight R x * D.coreTrace t x ^ 2 ∂D.boundaryVolume :=
    integral_nonneg fun x ↦ mul_nonneg (Real.sqrt_nonneg _) (sq_nonneg _)
  exact le_trans (by simpa using mul_le_mul_of_nonneg_right hP1 hWeight) hRay

include S in
/-- The two physical Robin terms yield the precise weighted boundary margin. -/
theorem coreBulk_add_weightedTraceMargin_le_joinedForm (hRpos : ∀ x, 0 < R x) (t : Test) :
    D.coreBulk t + (∫ x, (6 * boundaryScalarWeight R x + 2 * D.outwardMean x) *
      D.coreTrace t x ^ 2 ∂D.boundaryVolume) ≤ D.joinedForm t := by
  have hcap := (mul_le_mul_of_nonneg_left (S.p1PhysicalForm_lower hRpos t)
    (by norm_num : (0 : ℝ) ≤ 6)).trans (S.capMinimization t)
  have hMeanInt := boundary_mean_mul_sq_integrable D.outwardMeanMemLp (D.traceMemLp t)
  have hWeightInt := S.weightedTraceIntegrable t
  have hsum : (∫ x, (6 * boundaryScalarWeight R x + 2 * D.outwardMean x) *
      D.coreTrace t x ^ 2 ∂D.boundaryVolume) =
      6 * (∫ x, boundaryScalarWeight R x * D.coreTrace t x ^ 2 ∂D.boundaryVolume) +
      2 * (∫ x, D.outwardMean x * D.coreTrace t x ^ 2 ∂D.boundaryVolume) := by
    calc
      _ = ∫ x, 6 * (boundaryScalarWeight R x * D.coreTrace t x ^ 2) +
          2 * (D.outwardMean x * D.coreTrace t x ^ 2) ∂D.boundaryVolume := by
        apply integral_congr_ae
        exact ae_of_all _ fun _ ↦ by dsimp; ring
      _ = _ := by
        rw [integral_add (hWeightInt.const_mul 6) (hMeanInt.const_mul 2),
          integral_const_mul, integral_const_mul]
  rw [D.joinedForm_eq_robinSum, hsum]
  unfold MatchedBallRobinData.coreRobinBoundary
  linarith only [hcap]

include S in
theorem coreBulk_le_joinedForm_of_gauss (G : UmbilicBoundaryGauss D.outwardMean R) (t : Test) :
    D.coreBulk t ≤ D.joinedForm t := by
  have hbound := S.coreBulk_add_weightedTraceMargin_le_joinedForm
    (fun x ↦ (G.scalar_pos_and_absMean_lt x).1) t
  have hmargin : 0 ≤ ∫ x, (6 * boundaryScalarWeight R x + 2 * D.outwardMean x) *
      D.coreTrace t x ^ 2 ∂D.boundaryVolume := by
    apply integral_nonneg
    intro x
    have hpos : 0 < 6 * boundaryScalarWeight R x + 2 * D.outwardMean x := by
      linarith [(G.scalar_pos_and_absMean_lt x).2, neg_le_abs (D.outwardMean x)]
    exact mul_nonneg hpos.le (sq_nonneg _)
  linarith only [hbound, hmargin]

end WeightedBallBoundarySpectrum

/-- The CGY representative gives positive cap sign on the supplied marked
umbilic round-conformal cut, using the weighted spectral estimate. -/
theorem weightedMatchedBall_robinPositive_of_pinched_umbilic_cut
    {V C B Test : Type*} [MeasurableSpace V] [MeasurableSpace C] [MeasurableSpace B]
    (D : MatchedBallRobinData V C B Test) (R : B → ℝ) (G : UmbilicBoundaryGauss D.outwardMean R)
    (S : WeightedBallBoundarySpectrum D R) (hground : D.HasGroundState) :
    0 < D.firstEigenvalue := by
  apply D.firstEigenvalue_pos_of_joinedForm_pos hground
  intro t hmass
  by_cases hcore : D.coreRestriction t =ᵐ[D.coreVolume] 0
  · exact D.joinedForm_pos_of_coreZero t hmass hcore
  · exact (D.coreBulk_pos_of_coreNonzero t hcore).trans_le (S.coreBulk_le_joinedForm_of_gauss G t)

end SmoothPoincare.IntrinsicEntry
