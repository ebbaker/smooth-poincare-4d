import FirstOrderTwistor.MetricJetEnergy
import SmoothPoincare.Variational.MarkedCapTestFactors
import SmoothPoincare.Variational.PositiveScalarYamabeFour

/-!
# Whole-carrier returns on the original oriented type

26 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance.
Actual serving model and effort were unavailable. BAT-E01/E05 uses the Edition 05
revision 1 handoff and its Route 13 plan at intake HEAD `4d73fdde6804ce93fc2a3e4cef403e16eb941dab`.
The stationary convention is Bour, Proposition 4.4, as stated in the working
attainment manuscript. Geometric limit inputs and Bach transport are explicit.
-/

noncomputable section

open DifferentialGeometry DifferentialGeometry.Geometry.Curvature
open DifferentialGeometry.Integral.Measure FirstOrderTwistor Filter MeasureTheory
open SectionsAndConnections Set
open scoped ContDiff Manifold Topology

namespace SmoothPoincare

variable {E F H K M N : Type*}
  [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [NormedAddCommGroup F] [NormedSpace ℝ F] [FiniteDimensional ℝ F]
  [TopologicalSpace H] [TopologicalSpace K]
  {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  {J : ModelWithCorners ℝ F K} [J.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  [CompactSpace M] [Nonempty M]
  [TopologicalSpace N] [ChartedSpace K N] [IsManifold J ∞ N] [T2Space N]
  [CompactSpace N] [Nonempty N]
  {oM : ManifoldOrientation I M 4} {oN : ManifoldOrientation J N 4}

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩
private local instance : MeasurableSpace N := borel N
private local instance : BorelSpace N := ⟨rfl⟩

namespace SignedCollarMetric

private theorem signedBlock_pullbackCross (q : SignedCollarMetric oN)
    (Φ : M ≃ₘ⟮I, J⟯ N) (hΦ : Φ.preservesOrientation oM oN) (sign : CollarChirality) (x : M) :
    signedCollarWeylBlock oM (Diffeomorph.pullbackMetricCross q.metric Φ)
      (pullbackOrientedOrthonormalFrames q.metric Φ hΦ q.frame) sign x =
      signedCollarWeylBlock oN q.metric q.frame sign (Φ x) := by
  cases sign with
  | plus => exact geometricChiralBlock_pullback q.metric Φ hΦ x (q.frame (Φ x))
  | minus =>
    change traceFreeChiralBlock (antiSelfDualCurvatureBlock _) =
      traceFreeChiralBlock (antiSelfDualCurvatureBlock _)
    exact congrArg (fun r => traceFreeChiralBlock (antiSelfDualCurvatureBlock r))
      (metricCurvatureFrameTensor_pullback q.metric Φ hΦ x (q.frame (Φ x)))

private theorem signedEnergy_pullbackCross (q : SignedCollarMetric oN)
    (Φ : M ≃ₘ⟮I, J⟯ N) (hΦ : Φ.preservesOrientation oM oN) (sign : CollarChirality) :
    chiralFrameEnergy (Diffeomorph.pullbackMetricCross q.metric Φ)
      (signedCollarWeylBlock oM (Diffeomorph.pullbackMetricCross q.metric Φ)
        (pullbackOrientedOrthonormalFrames q.metric Φ hΦ q.frame) sign) = q.energy sign := by
  unfold chiralFrameEnergy energy
  simp_rw [signedBlock_pullbackCross]
  rw [riemannianVolumeMeasure_pullback_cross, Φ.symm.toHomeomorph.measurableEmbedding.integral_map]
  simp

/-- Both signed blocks follow the actual oriented pullback metric and its physical volume. -/
def pullbackCross (q : SignedCollarMetric oN) (Φ : M ≃ₘ⟮I, J⟯ N)
    (hΦ : Φ.preservesOrientation oM oN) : SignedCollarMetric oM where
  metric := Diffeomorph.pullbackMetricCross q.metric Φ
  frame := pullbackOrientedOrthonormalFrames q.metric Φ hΦ q.frame
  integrable sign := by
    simp_rw [signedBlock_pullbackCross]
    rw [riemannianVolumeMeasure_pullback_cross, Φ.symm.toHomeomorph.measurableEmbedding.integrable_map_iff]
    simpa only [Function.comp_apply, Φ.apply_symm_apply] using q.integrable sign
  signature_zero := (signedEnergy_pullbackCross q Φ hΦ .plus).trans
    (q.signature_zero.trans (signedEnergy_pullbackCross q Φ hΦ .minus).symm)

/-- The total energy of each chirality is invariant under this oriented identification. -/
theorem energy_pullbackCross (q : SignedCollarMetric oN) (Φ : M ≃ₘ⟮I, J⟯ N)
    (hΦ : Φ.preservesOrientation oM oN) (sign : CollarChirality) :
    (q.pullbackCross Φ hΦ).energy sign = q.energy sign :=
  signedEnergy_pullbackCross q Φ hΦ sign

/-- The same identification preserves the conformal Yamabe constant. -/
theorem yamabe_pullbackCross (q : SignedCollarMetric oN) (Φ : M ≃ₘ⟮I, J⟯ N)
    (hΦ : Φ.preservesOrientation oM oN) :
    classYamabeFour oM.dimension_eq (q.pullbackCross Φ hΦ).metric =
      classYamabeFour oN.dimension_eq q.metric :=
  classYamabeFour_pullback oM.dimension_eq oN.dimension_eq q.metric Φ

end SignedCollarMetric

/-- A whole marked positive candidate at or below the source infimum attains it
on the actual pullback metric. Bach-flatness is a separate geometric input and
its transport refers to the very same metric and diffeomorphism. -/
theorem bourAttainsOfSignedPullback
    (q : SignedCollarMetric oN) (Φ : M ≃ₘ⟮I, J⟯ N) (hΦ : Φ.preservesOrientation oM oN)
    (BachFlatM : SmoothRiemannianMetric I M → Prop) (BachFlatN : SmoothRiemannianMetric J N → Prop)
    (hBach : BachFlatN q.metric)
    (hBachTransport : BachFlatN q.metric → BachFlatM (Diffeomorph.pullbackMetricCross q.metric Φ))
    (hY : 0 < classYamabeFour oN.dimension_eq q.metric)
    (hUpper : q.energy .plus ≤ sInf (geometricPositiveEnergies oM)) :
    let pull := q.pullbackCross Φ hΦ
    0 < classYamabeFour oM.dimension_eq pull.metric ∧ BachFlatM pull.metric ∧
      ∀ sign, pull.energy sign = sInf (geometricPositiveEnergies oM) := by
  intro pull
  have hPositive : 0 < classYamabeFour oM.dimension_eq pull.metric := by
    rwa [SignedCollarMetric.yamabe_pullbackCross]
  have hMember := pull.energy_mem_of_positive hPositive
  have hPlus : pull.energy .plus = sInf (geometricPositiveEnergies oM) := by
    refine le_antisymm ?_ (csInf_le (geometricPositiveEnergies_bddBelow oM) hMember)
    rwa [SignedCollarMetric.energy_pullbackCross]
  refine ⟨hPositive, hBachTransport hBach, ?_⟩
  intro sign
  cases sign with
  | plus => exact hPlus
  | minus => exact pull.signature_zero.symm.trans hPlus

end SmoothPoincare
