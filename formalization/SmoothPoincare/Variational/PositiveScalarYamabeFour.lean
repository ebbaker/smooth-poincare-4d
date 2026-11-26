import SmoothPoincare.Variational.MarkedCapTestFactors
import SmoothPoincare.Variational.AttainedRecognition
import DifferentialGeometry.Analysis.Integration.DivergenceTheorem.Green.Energy
import DifferentialGeometry.Analysis.Sobolev.Manifold.Embedding.Intrinsic
import DifferentialGeometry.Geometry.Curvature.ScalarSectional
import Mathlib.MeasureTheory.Function.LocallyIntegrable

/-! # Positive scalar curvature gives a positive four-dimensional Yamabe class -/

open DifferentialGeometry DifferentialGeometry.Geometry.Connection
open DifferentialGeometry.Geometry.Curvature DifferentialGeometry.Geometry.Operator
open DifferentialGeometry.Integral.Measure DifferentialGeometry.Integral.DivergenceTheorem
open DifferentialGeometry.Analysis.Sobolev
open FirstOrderTwistor MeasureTheory Set
open scoped ContDiff Manifold

namespace SmoothPoincare

section Compact

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [T2Space M] [CompactSpace M] [Nonempty M]

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

omit [Nonempty M] in
/-- On the closed metric, Green's identity identifies the numerator with
the scalar and Dirichlet form on any smooth test. -/
theorem capFactorScalar_eq_dirichletForm (hd : Module.finrank ℝ E = 4)
    (g : SmoothRiemannianMetric I M) (f : C^∞⟮I, M; ℝ⟯) :
    capFactorScalar g f =
      (∫ x, scalarCurv g x * f x ^ 2 ∂riemannianVolumeMeasure I M g) +
        6 * ∫ x, normGradSqFun g f x ∂riemannianVolumeMeasure I M g := by
  let μ := riemannianVolumeMeasure I M g
  let : IsFiniteMeasureOnCompacts μ := riemannianVolumeMeasure_isFiniteMeasureOnCompacts g
  let : NeZero (Module.finrank ℝ E) := ⟨by rw [hd]; decide⟩
  have hR : Integrable (fun x => scalarCurv g x * f x ^ 2) μ :=
    Continuous.integrable_of_hasCompactSupport
      ((scalarCurv_contMDiff g).continuous.mul (f.contMDiff.continuous.pow 2))
      (HasCompactSupport.of_compactSpace _)
  have hL : Integrable (fun x => (-laplacian (LeviCivita g) g f x) * f x) μ :=
    Continuous.integrable_of_hasCompactSupport
      ((contMDiff_laplacian_leviCivita g f.contMDiff).continuous.neg.mul f.contMDiff.continuous)
      (HasCompactSupport.of_compactSpace _)
  have hG := integral_normGradSqFun_eq_integral_neg_laplacian_mul g f.contMDiff
    (HasCompactSupport.of_compactSpace _)
  rw [hG, ← integral_const_mul, ← integral_add hR (hL.const_mul 6)]
  unfold capFactorScalar
  apply integral_congr_ae
  exact Filter.Eventually.of_forall fun x => by ring

omit [I.Boundaryless] [Nonempty M] in
private theorem lpNorm_four_sq_eq_capFactorVolume (g : SmoothRiemannianMetric I M)
    (f : C^∞⟮I, M; ℝ⟯) :
    lpNorm f 4 (riemannianVolumeMeasure I M g) ^ 2 = Real.sqrt (capFactorVolume g f) := by
  have hf : AEStronglyMeasurable f (riemannianVolumeMeasure I M g) :=
    f.contMDiff.continuous.aestronglyMeasurable
  have hFour (x : ℝ) : |x| ^ (4 : ℝ) = x ^ (4 : ℕ) := by
    rw [show (4 : ℝ) = ((4 : ℕ) : ℝ) by norm_num, Real.rpow_natCast,
      ← abs_pow, abs_of_nonneg (by positivity)]
  rw [lpNorm_eq_integral_norm_rpow_toReal (by norm_num) (by simp) hf]
  norm_num only [ENNReal.toReal_ofNat, Real.norm_eq_abs]
  simp only [hFour]
  change ((∫ x, f x ^ 4 ∂riemannianVolumeMeasure I M g) ^ (1 / 4 : ℝ)) ^ 2 =
    Real.sqrt (∫ x, f x ^ 4 ∂riemannianVolumeMeasure I M g)
  have hI : 0 ≤ ∫ x, f x ^ 4 ∂riemannianVolumeMeasure I M g :=
    integral_nonneg (fun x => by positivity)
  rw [← Real.rpow_natCast, ← Real.rpow_mul hI, Real.sqrt_eq_rpow]
  norm_num

/-- A uniform pointwise positive scalar bound on this closed metric gives a
strictly positive lower bound on the entire smooth conformal quotient. -/
theorem classYamabeFour_pos_of_scalar_lower (hd : Module.finrank ℝ E = 4)
    (g : SmoothRiemannianMetric I M) {ρ : ℝ} (hρ : 0 < ρ)
    (hscalar : ∀ x, ρ ≤ metricScalarAt g x) :
    0 < classYamabeFour hd g := by
  let μ := riemannianVolumeMeasure I M g
  let : IsFiniteMeasureOnCompacts μ := riemannianVolumeMeasure_isFiniteMeasureOnCompacts g
  let : NeZero (Module.finrank ℝ E) := ⟨by rw [hd]; decide⟩
  obtain ⟨C, _, hSob⟩ := sobolev_two_integral g (by rw [hd]; norm_num)
  let c := min ρ 6
  let D := 2 * C ^ 2 + 1
  have hc : 0 < c := lt_min hρ (by norm_num)
  have hD : 0 < D := by dsimp [D]; positivity
  have hb : 0 < c / D := div_pos hc hD
  refine hb.trans_le (le_csInf (range_nonempty _) ?_)
  rintro _ ⟨u, rfl⟩
  let w := capExpFactor u
  have hYVol : 0 < capTestVolume (conformalMetric g u) := by
    let ν := riemannianVolumeMeasure I M (conformalMetric g u)
    let : IsFiniteMeasureOnCompacts ν :=
      riemannianVolumeMeasure_isFiniteMeasureOnCompacts (conformalMetric g u)
    let : ν.IsOpenPosMeasure := riemannianVolumeMeasure_isOpenPosMeasure (conformalMetric g u)
    exact ENNReal.toReal_pos (isOpen_univ.measure_pos ν univ_nonempty).ne' (measure_ne_top ν univ)
  change c / D ≤ capTestScalar (conformalMetric g u) /
    Real.sqrt (capTestVolume (conformalMetric g u))
  rw [le_div_iff₀ (Real.sqrt_pos_of_pos hYVol), capTestScalar_eq_capFactorScalar hd,
    capTestVolume_eq_capFactorVolume hd, capFactorScalar_eq_dirichletForm hd]
  let A := ∫ x, w x ^ 2 ∂μ
  let B := ∫ x, normGradSqFun g w x ∂μ
  have hA : 0 ≤ A := integral_nonneg (fun x => sq_nonneg _)
  have hB : 0 ≤ B := integral_nonneg (fun x => normGradSqFun_nonneg g w x)
  have hG : Real.sqrt (capFactorVolume g w) ≤ 2 * C ^ 2 * (A + B) := by
    have h := hSob w.contMDiff
    rw [hd] at h
    norm_num at h
    rw [← lpNorm_four_sq_eq_capFactorVolume]
    exact h
  have hGD : Real.sqrt (capFactorVolume g w) ≤ D * (A + B) := by
    exact hG.trans (mul_le_mul_of_nonneg_right (le_add_of_nonneg_right zero_le_one) (add_nonneg hA hB))
  have hR : c * A ≤ ∫ x, scalarCurv g x * w x ^ 2 ∂μ := by
    rw [← integral_const_mul]
    apply integral_mono
    · exact Continuous.integrable_of_hasCompactSupport
        (continuous_const.mul (w.contMDiff.continuous.pow 2)) (HasCompactSupport.of_compactSpace _)
    · exact Continuous.integrable_of_hasCompactSupport
        ((scalarCurv_contMDiff g).continuous.mul (w.contMDiff.continuous.pow 2))
        (HasCompactSupport.of_compactSpace _)
    · intro x
      exact mul_le_mul_of_nonneg_right
        ((min_le_left _ _).trans ((hscalar x).trans_eq (metricScalar_eq_scal g x))) (sq_nonneg _)
  change c / D * Real.sqrt (capFactorVolume g w) ≤
    (∫ x, scalarCurv g x * w x ^ 2 ∂μ) + 6 * B
  calc
    _ ≤ c / D * (D * (A + B)) := mul_le_mul_of_nonneg_left hGD hb.le
    _ = c * (A + B) := by field_simp
    _ = c * A + c * B := mul_add _ _ _
    _ ≤ _ := add_le_add hR (mul_le_mul_of_nonneg_right (min_le_right _ _) hB)

/-- Compactness supplies the uniform scalar floor from pointwise positivity. -/
theorem classYamabeFour_pos_of_scalar_pos (hd : Module.finrank ℝ E = 4)
    (g : SmoothRiemannianMetric I M) (hscalar : ∀ x, 0 < metricScalarAt g x) :
    0 < classYamabeFour hd g := by
  have hc : Continuous (metricScalarAt g) :=
    (scalarCurv_contMDiff g).continuous.congr (fun x => (metricScalar_eq_scal g x).symm)
  obtain ⟨x, _, hx⟩ := isCompact_univ.exists_isMinOn univ_nonempty hc.continuousOn
  exact classYamabeFour_pos_of_scalar_lower hd g (hscalar x) (fun y => hx (mem_univ y))

end Compact

local instance : Fact (Module.finrank ℝ (EuclideanSpace ℝ (Fin 5)) = 4 + 1) := ⟨by simp⟩
private local instance : Nonempty StandardFourSphere :=
  (NormedSpace.sphere_nonempty (x := (0 : EuclideanSpace ℝ (Fin 5))) (r := 1)).mpr zero_le_one
    |>.to_subtype

/-- The actual unit round four-sphere has a positive Yamabe class. -/
theorem standardRoundFour_yamabe_pos :
    0 < classYamabeFour (show Module.finrank ℝ (EuclideanSpace ℝ (Fin 4)) = 4 by simp)
      standardRoundFourMetric := by
  apply classYamabeFour_pos_of_scalar_lower _ _ (show (0 : ℝ) < 12 by norm_num)
  intro x
  have hdim : Module.finrank ℝ (EuclideanSpace ℝ (Fin 4)) = 4 := by simp
  let : NeZero (Module.finrank ℝ (EuclideanSpace ℝ (Fin 4))) := ⟨by rw [hdim]; decide⟩
  have h := DifferentialGeometry.Geometry.Riemannian.metricScalarAt_of_constant_sectional
    standardRoundFourMetric x 1
    (fun u v => by simpa only [one_mul, pow_two] using DifferentialGeometry.Geometry.roundMetric_sec_value x u v)
  norm_num [hdim] at h
  exact h.ge

end SmoothPoincare
