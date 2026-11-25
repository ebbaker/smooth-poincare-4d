import SmoothPoincare.Heights.RegularMorseHeights
import SmoothPoincare.Heights.OpenMiddleLocus
import SmoothPoincare.Heights.RoundGaussArea
import SmoothPoincare.Heights.GaussParametricDensity
import SmoothPoincare.Immersions.StrictInducedEnergy

/-! # Indexed Gauss area of an oriented Euclidean hypersurface

The sheets, normal map, round area and absolute Jacobian are constructed
from the same immersion. Pointwise principal frames may vary discontinuously.
-/

open DifferentialGeometry DifferentialGeometry.Integral.Measure Filter FirstOrderTwistor
open DifferentialGeometry.Topology DifferentialGeometry.Topology.Morse
open Function MeasureTheory SectionsAndConnections Set
open scoped BigOperators ContDiff ENNReal Manifold

namespace SmoothPoincare

local notation "V₄" => EuclideanSpace ℝ (Fin 4)
local notation "V₅" => EuclideanSpace ℝ (Fin 5)
local instance : Fact (Module.finrank ℝ V₅ = 4 + 1) := ⟨by simp⟩

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ V₄ H}
  [I.Boundaryless] [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [PolishSpace M] [Nonempty M] [CompactSpace M]
  (g : SmoothRiemannianMetric I M) (F : IsometricHypersurface g)
  (o : ManifoldOrientation I M 4) (a : OrthonormalBasis (Fin 5) ℝ V₅)
  (P : ∀ x : M, PrincipalFrameAt F o x)

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

set_option quotPrecheck false

local notation "N₀" => orientedGaussNormal F o a
local notation "J₀" => (fun x : M => |∏ i, (P x).curvature i|)
local notation "U₀" => ({x : M | HasMiddlePrincipalSignature (P x).curvature})
local notation "μ₀" => normalizedGaussDirections gaussRoundArea (8 * Real.pi ^ 2 / 3)
local notation "dV" => riemannianVolumeMeasure I M g
local notation "W₀" => (fun x : M => geometricChiralBlock g o x (P x).frame)

private noncomputable def atlas_native_round {n : M → GaussDirection} {U : Set M} {J : M → ℝ≥0∞}
    (A : @GaussSheetAtlas M GaussDirection _ (borel GaussDirection) n U dV
      (riemannianVolumeMeasure (𝓡 4) GaussDirection gaussRoundMetric) J) :
    GaussSheetAtlas n U dV gaussRoundArea J := by
  exact A.transportTargetMeasurableSpace (BorelSpace.measurable_eq (α := GaussDirection)).symm

include a

omit [Nonempty M] in
/-- The absolute Gauss Jacobian is continuous even through repeated or zero
principal curvatures. On a compact source its integral is finite. -/
theorem orientedGauss_absProduct_continuous_integrable :
    Continuous J₀ ∧ Integrable J₀ dV := by
  have h := orientedGaussNormal_smooth F o a
  have hc : Continuous J₀ := continuousOn_univ.mp
    ((N₀).continuousOn_absPrincipalProduct isOpen_univ h.contMDiffOn
      (fun x _ => P x) (k := J₀) (fun _ _ => rfl))
  let : IsFiniteMeasureOnCompacts dV := riemannianVolumeMeasure_isFiniteMeasureOnCompacts g
  exact ⟨hc, hc.integrable_of_hasCompactSupport (HasCompactSupport.of_compactSpace _)⟩

private noncomputable def actualMiddleSheetAtlas (hOpen : IsOpen U₀) :
    GaussSheetAtlas (N₀).normal U₀ dV gaussRoundArea (fun x => ENNReal.ofReal (J₀ x)) := by
  have hn := orientedGaussNormal_smooth F o a
  have hinv (x : M) (hx : x ∈ U₀) :=
    (N₀).mfderiv_isInvertible_of_principal (P x) (hn.mdifferentiableAt (by simp)) hx.1
  let s := ((N₀).exists_regularSheets hOpen hn.contMDiffOn hinv).some
  have hJ := (orientedGauss_absProduct_continuous_integrable g F o a P).1.measurable
  exact atlas_native_round g ((N₀).measuredSheets_of_principal hOpen hn.contMDiffOn s
    (fun x _ => P x) hJ (fun _ _ => rfl))

/-- The mean of the actual source-point count for ordinary round probability.
Both normal directions and all sheets are counted with source multiplicity. -/
theorem orientedMeanActualIndexTwo :
    let m := fun u => (indexedHeightTwoPoints F u).ncard
    Measurable m ∧ (∀ᵐ u ∂μ₀, (indexedHeightTwoPoints F u).Finite) ∧
      IsProbabilityMeasure μ₀ ∧ Integrable (fun u => (m u : ℝ)) μ₀ ∧
      (∫ u, (m u : ℝ) ∂μ₀) = (2 / (8 * Real.pi ^ 2 / 3)) * ∫ x in U₀, J₀ x ∂dV :=
  meanActualIndexTwo_eq_gaussMass N₀ P U₀ (fun _ => Iff.rfl) J₀ gaussRoundArea
    gaussRoundArea_univ gaussRoundArea_antipodal (actualMiddleSheetAtlas g F o a P (isOpen_middlePrincipalLocus P))
    (orientedGauss_absProduct_continuous_integrable g F o a P).2.integrableOn
    (Eventually.of_forall fun _ => abs_nonneg _)

/-- The global measured prerequisites of the strict immersed-energy theorem
are discharged. The sign ordering describes the actual chosen oriented frames,
and the almost-sure count floor is the independent handle-theoretic input. -/
theorem inducedEnergy_strict_of_orientedHeightFloor
    (hOrder : ∀ x ∈ U₀, (P x).curvature 0 < 0 ∧ (P x).curvature 1 < 0 ∧
      0 < (P x).curvature 2 ∧ 0 < (P x).curvature 3)
    (hW : Integrable (fun x => hilbertSchmidtSq (W₀ x)) dV)
    (hcont : ContinuousOn (fun x => hilbertSchmidtSq (W₀ x) - (8 / 3 : ℝ) * J₀ x) U₀)
    (hfloor : ∀ᵐ u ∂μ₀, 2 ≤ (indexedHeightTwoPoints F u).ncard) :
    64 * Real.pi ^ 2 / 9 < chiralFrameEnergy g W₀ := by
  apply inducedEnergy_strict_of_actualIndexTwo g F o (fun x => (P x).frame) J₀ P
    (isOpen_middlePrincipalLocus P) (fun _ _ => rfl) _ N₀ gaussRoundArea gaussRoundArea_univ gaussRoundArea_antipodal
    (actualMiddleSheetAtlas g F o a P (isOpen_middlePrincipalLocus P)) hW
    (orientedGauss_absProduct_continuous_integrable g F o a P).2.integrableOn hcont hfloor
  intro x hx
  obtain ⟨h₀, h₁, h₂, h₃⟩ := hOrder x hx
  refine ⟨-(P x).curvature 0, -(P x).curvature 1, (P x).curvature 2, (P x).curvature 3,
    neg_pos.mpr h₀, neg_pos.mpr h₁, h₂, h₃, ?_, ?_⟩
  · ext i
    fin_cases i <;> simp
  · rw [Fin.prod_univ_four, abs_of_pos (mul_pos (mul_pos (mul_pos_of_neg_of_neg h₀ h₁) h₂) h₃)]
    ring

local notation "Pₛ" => orientedPrincipalFrameAt F o a
local notation "Uₛ" => {x : M | HasMiddlePrincipalSignature ((Pₛ) x).curvature}
local notation "Jₛ" => (fun x : M => |∏ i, ((Pₛ) x).curvature i|)
local notation "Wₛ" => (fun x : M => geometricChiralBlock g o x ((Pₛ) x).frame)

/-- Normalized indexed area from the oriented immersion and ambient orthonormal
basis alone, using its constructed principal curvatures on both normal fibers. -/
theorem orientedImmersion_indexedGaussMean :
    let m := fun u => (indexedHeightTwoPoints F u).ncard
    Measurable m ∧ (∀ᵐ u ∂μ₀, (indexedHeightTwoPoints F u).Finite) ∧
      IsProbabilityMeasure μ₀ ∧ Integrable (fun u => (m u : ℝ)) μ₀ ∧
      (∫ u, (m u : ℝ) ∂μ₀) = (2 / (8 * Real.pi ^ 2 / 3)) * ∫ x in Uₛ, Jₛ x ∂dV :=
  orientedMeanActualIndexTwo g F o a Pₛ

/-- At or below the inclusive immersed threshold there exists a smooth Morse
height on this immersion with a finite set of at most one index-two point. -/
theorem exists_morseHeight_le_one_of_inducedEnergy_le
    (hW : Integrable (fun x => hilbertSchmidtSq (Wₛ x)) dV)
    (hcont : ContinuousOn (fun x => hilbertSchmidtSq (Wₛ x) - (8 / 3 : ℝ) * Jₛ x) Uₛ)
    (he : chiralFrameEnergy g Wₛ ≤ 64 * Real.pi ^ 2 / 9) :
    ∃ u : GaussDirection, ContMDiff I 𝓘(ℝ, ℝ) ∞ (immersionHeight F (u : V₅)) ∧
      (∀ x, IsCriticalPointAt I (immersionHeight F (u : V₅)) x →
        IsNondegenerateCriticalPointAt I (immersionHeight F (u : V₅)) x) ∧
      (indexedHeightTwoPoints F u).Finite ∧ (indexedHeightTwoPoints F u).ncard ≤ 1 := by
  by_contra absent
  apply (not_lt_of_ge he)
  apply inducedEnergy_strict_of_orientedHeightFloor g F o a Pₛ
    (fun x hx => orientedPrincipalFrameAt_middle_order F o a x hx) hW hcont
  filter_upwards [orientedHeight_ae_nondegenerate F o a,
    (orientedImmersion_indexedGaussMean g F o a).2.1] with u hm hf
  by_contra! low
  exact absent ⟨u, hm.1, hm.2, hf, by omega⟩

end SmoothPoincare
