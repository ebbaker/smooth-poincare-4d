import SmoothPoincare
import Mathlib.MeasureTheory.Measure.Dirac.Basic

/-! # FOT-E52 independent checks for the capped Euler and signed-collar proofs -/

open FirstOrderTwistor SmoothPoincare MeasureTheory Set
open DifferentialGeometry DifferentialGeometry.Integral.Measure
  DifferentialGeometry.Geometry.Curvature DifferentialGeometry.Tensor0SBundle
open scoped Topology NNReal Manifold ContDiff

noncomputable section

namespace E52EulerAndSignatureChecks

example : (∫ s in (0 : ℝ)..6, bourClosedCapRadialEuler (bourClosedCapProfile 2) s) =
    16 * Real.pi ^ 2 := by
  have h := bourClosedCapProfile_endJets (r := 2) (by norm_num)
  norm_num at h
  exact bourClosedCapRadialEuler_integral (bourClosedCapProfile_smooth 2) h.1 h.2

section TwoEnds

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "I₄" => 𝓘(ℝ, E₄)

variable {X N : Type} [TopologicalSpace X] [ChartedSpace E₄ X] [IsManifold I₄ ∞ X]
  [T2Space X] [SigmaCompactSpace X] [BoundarylessManifold I₄ X]
  [TopologicalSpace N] [ChartedSpace E₄ N] [IsManifold I₄ ∞ N]
  [T2Space N] [SigmaCompactSpace N] [BoundarylessManifold I₄ N] [CompactSpace N]

private local instance : MeasurableSpace X := borel X
private local instance : BorelSpace X := ⟨rfl⟩

-- At equality a compatible two-ended exhaustion has zero total Weyl cost.
-- Each chirality then has zero cost by its own physical nonnegativity.
example (g : SmoothRiemannianMetric I₄ X) (o : ManifoldOrientation I₄ X 4)
    (frame : ∀ x, OrientedOrthonormalFrameAt g o x)
    (C : BourClosedCapExhaustion g N 2)
    (hScalar : ∀ᵐ x ∂riemannianVolumeMeasure I₄ X g, metricScalarAt g x = 0)
    (hPlus : Integrable (modifiedChargeDensity o g frame .plus) (riemannianVolumeMeasure I₄ X g))
    (hMinus : Integrable (modifiedChargeDensity o g frame .minus) (riemannianVolumeMeasure I₄ X g))
    (hRicci : Integrable (modifiedChargeDensity o g frame .ricci) (riemannianVolumeMeasure I₄ X g))
    (hEq : (∫ x, normSq0S g x 2 (metricRicciAt g x) ∂riemannianVolumeMeasure I₄ X g) =
      32 * Real.pi ^ 2) :
    Bour.bourChargeOn o g frame univ .plus = 0 ∧ Bour.bourChargeOn o g frame univ .minus = 0 := by
  have h := bourClosedCaps_ricci_identity g o frame C hScalar hPlus hMinus hRicci
  rw [bourClosedCaps_ordinaryRicci g o frame hScalar, hEq] at h
  norm_num at h
  have hP : 0 ≤ Bour.bourChargeOn o g frame univ .plus :=
    integral_nonneg (modifiedChargeDensity_nonneg o g frame .plus)
  have hM : 0 ≤ Bour.bourChargeOn o g frame univ .minus :=
    integral_nonneg (modifiedChargeDensity_nonneg o g frame .minus)
  constructor <;> linarith only [h, hP, hM]

end TwoEnds

example :
    (0 : ℝ) - (9 * Real.pi ^ 2 / 4) =
      (fubiniStudySignatureFace (Real.pi / 6)).defect -
        (fubiniStudySignatureFace (Real.pi / 4)).defect ∧
    |(0 : ℝ) - (9 * Real.pi ^ 2 / 4)| ≤ Real.pi ^ 2 / 4 + 2 * Real.pi ^ 2 := by
  have hSinFour : (Real.sin (Real.pi / 4)) ^ 4 = (1 / 4 : ℝ) := by
    rw [Real.sin_pi_div_four,
      show (Real.sqrt 2 / 2) ^ 4 = ((Real.sqrt 2) ^ 2) ^ 2 / 16 by ring,
      Real.sq_sqrt (by norm_num)]
    norm_num
  have hSinSix : (Real.sin (Real.pi / 6)) ^ 4 = (1 / 16 : ℝ) := by
    norm_num [Real.sin_pi_div_six]
  have h := signedCollar_defect_of_signature
    (fubiniStudySignatureFace (Real.pi / 6)) (fubiniStudySignatureFace (Real.pi / 4))
    (plus := 9 * Real.pi ^ 2 / 4) (minus := 0)
    (physicalPontryagin := 9 / 16) (productPontryagin := 3 / 8)
    (by simp only [fubiniStudySignatureFace, hSinFour, hSinSix]; norm_num)
    (by simp only [fubiniStudySignatureFace, hSinFour, hSinSix]; ring)
    (by ring)
  have hReverse := signedCollar_reverse h
  have hInner : (fubiniStudySignatureFace (Real.pi / 6)).defect = 3 * Real.pi ^ 2 / 4 := by
    rw [fubiniStudySignatureFace_defect, hSinSix]
    ring
  have hOuter : (fubiniStudySignatureFace (Real.pi / 4)).defect = 3 * Real.pi ^ 2 := by
    rw [fubiniStudySignatureFace_defect, hSinFour]
    ring
  have hOutBound : |(fubiniStudySignatureFace (Real.pi / 4)).defect - Real.pi ^ 2| ≤
      2 * Real.pi ^ 2 := by
    rw [hOuter, show 3 * Real.pi ^ 2 - Real.pi ^ 2 = 2 * Real.pi ^ 2 by ring,
      abs_of_nonneg (by positivity)]
  have hInBound : |(fubiniStudySignatureFace (Real.pi / 6)).defect - Real.pi ^ 2| ≤
      Real.pi ^ 2 / 4 := by
    rw [hInner, show 3 * Real.pi ^ 2 / 4 - Real.pi ^ 2 = -(Real.pi ^ 2 / 4) by ring,
      abs_neg, abs_of_nonneg (by positivity)]
  exact ⟨hReverse, by
    rw [add_comm]
    exact (signedCollar_twoFace_bound hReverse hOutBound hInBound).1⟩

private def twoPointMeasure (a b : ℝ≥0) : Measure (Fin 2) :=
  a • Measure.dirac 0 + b • Measure.dirac 1

private instance (a b : ℝ≥0) : IsFiniteMeasure (twoPointMeasure a b) := by
  unfold twoPointMeasure
  infer_instance

private theorem twoPointMeasure_total (a b : ℝ≥0) :
    (twoPointMeasure a b).real univ = (a : ℝ) + b := by
  simp [twoPointMeasure, Measure.real, ← ENNReal.coe_add]

private theorem twoPointMeasure_first (a b : ℝ≥0) :
    (twoPointMeasure a b).real {0} = (a : ℝ) := by
  have h : (1 : Fin 2) ∉ ({0} : Set (Fin 2)) := by simp
  simp [twoPointMeasure, Measure.real, h]

private theorem twoPointMeasure_compl (a b : ℝ≥0) :
    (twoPointMeasure a b).real ({0} : Set (Fin 2))ᶜ = (b : ℝ) := by
  have h := measureReal_add_measureReal_compl
    (μ := twoPointMeasure a b) (measurableSet_singleton (0 : Fin 2))
  rw [twoPointMeasure_first, twoPointMeasure_total] at h
  linarith

-- Both chiral measures have mass in both pieces. Exchanging the two measures
-- reverses the ledger sign and keeps the discarded region fixed.
example :
    (twoPointMeasure 5 1).real univ - |(3 : ℝ)| =
      (twoPointMeasure 2 4).real {0} + (twoPointMeasure 5 1).real ({0} : Set (Fin 2))ᶜ ∧
    (twoPointMeasure 2 4).real univ - |(-3 : ℝ)| =
      (twoPointMeasure 2 4).real {0} + (twoPointMeasure 5 1).real ({0} : Set (Fin 2))ᶜ ∧
    (twoPointMeasure 2 4).real {0} + (twoPointMeasure 5 1).real ({0} : Set (Fin 2))ᶜ = 3 := by
  have hPos := signedCut_exactDeficit (twoPointMeasure 5 1) (twoPointMeasure 2 4)
    (measurableSet_singleton (0 : Fin 2)) ⟨0, 3⟩
    (by norm_num [twoPointMeasure_total])
    (by norm_num [twoPointMeasure_first, SignatureFace.defect])
  have hNeg := signedCut_exactDeficit (twoPointMeasure 2 4) (twoPointMeasure 5 1)
    (measurableSet_singleton (0 : Fin 2)) ⟨0, -3⟩
    (by norm_num [twoPointMeasure_total])
    (by norm_num [twoPointMeasure_first, SignatureFace.defect])
  exact ⟨by simpa [SignatureFace.defect] using hPos.1 (by norm_num [SignatureFace.defect]),
    by simpa [SignatureFace.defect] using hNeg.2.1 (by norm_num [SignatureFace.defect]),
    by norm_num [twoPointMeasure_first, twoPointMeasure_compl]⟩

example {X : Type*} [MeasurableSpace X]
    (plus minus : Measure X) [IsFiniteMeasure plus] [IsFiniteMeasure minus]
    {V : Set X} (hV : MeasurableSet V) (f : SignatureFace)
    (hTotal : plus.real univ = minus.real univ)
    (hLedger : plus.real V - minus.real V = f.defect)
    (hWall : 8 * Real.pi ^ 2 ≤ |f.defect|) :
    ¬ plus.real univ < 8 * Real.pi ^ 2 := by
  have h := (signedCut_exactDeficit plus minus hV f hTotal hLedger).2.2
  exact not_lt_of_ge (hWall.trans h)

end E52EulerAndSignatureChecks

#print axioms bourClosedCapEuler_integral
#print axioms bourClosedCaps_ricci_identity
#print axioms bour_closedCaps_force_oneEnd
#print axioms signedCollar_defect_of_signature
#print axioms signatureFace_transgression_le_holder
#print axioms signedCut_exactDeficit
