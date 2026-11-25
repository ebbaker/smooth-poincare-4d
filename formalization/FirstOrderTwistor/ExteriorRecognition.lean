import FirstOrderTwistor.ChiralTransport
import FirstOrderTwistor.CutMargin
import FirstOrderTwistor.MarkedCapRecognition
import FirstOrderTwistor.OrientedCutGluing
import FirstOrderTwistor.YamabeTransport
import Mathlib.Geometry.Manifold.Instances.Sphere
import Mathlib.Tactic.Linarith

/-!
# Recognition of the specified capped exterior

The recognition input supplies an oriented smooth map to the standard sphere
from strict energy and positive Yamabe bounds on the capped exterior. A
separate local extension input adjusts the map to its recorded cap marking.
-/

open DifferentialGeometry Set
open scoped ContDiff Manifold

namespace FirstOrderTwistor

/-- The unit four-sphere with the standard smooth sphere structure. -/
abbrev StandardFourSphere : Type := ↥(Metric.sphere (0 : EuclideanSpace ℝ (Fin 5)) 1)

local instance : Fact (Module.finrank ℝ (EuclideanSpace ℝ (Fin 5)) = 4 + 1) := ⟨by simp⟩

/-- The closed southern hemisphere used as the model of the attached exterior cap. -/
def standardFourSphereCap : Set StandardFourSphere := {p | p.1 (Fin.last 4) ≤ 0}

theorem standardFourSphereCap_isClosed : IsClosed standardFourSphereCap :=
  isClosed_Iic.preimage ((EuclideanSpace.proj (𝕜 := ℝ) (Fin.last 4)).continuous.comp
    continuous_subtype_val)

/-- If the sum of two capped energies is below twice the threshold, some
summand lies strictly below it. -/
theorem eitherSummandEnergyLtThreshold {T core exterior : ℝ}
    (hsum : core + exterior < 2 * T) : core < T ∨ exterior < T := by
  by_cases hcore : core < T
  · exact Or.inl hcore
  · exact Or.inr (by linarith only [hsum, le_of_not_gt hcore])

/-- Two positive energies can have a sum below twice a positive threshold
while the specified exterior energy is strictly above the threshold. -/
theorem twoSummandEnergyCounterexample {T : ℝ} (hT : 0 < T) :
    ∃ core exterior : ℝ, 0 < core ∧ 0 < exterior ∧
      core + exterior < 2 * T ∧ core < T ∧ T < exterior := by
  refine ⟨T / 4, 3 * T / 2, ?_, ?_, ?_, ?_, ?_⟩ <;> linarith only [hT]

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  {Vhat : Type*} [TopologicalSpace Vhat] [ChartedSpace H Vhat] [IsManifold I ∞ Vhat]
  [T2Space Vhat] [CompactSpace Vhat] [Nonempty Vhat]

/-- Recognize and mark the specific capped exterior. The parent recognition
principle has a metric criterion on `Vhat` and supplies an unmarked oriented
diffeomorphism. Palais's input extends a partial orientation-preserving
self-diffeomorphism of the model sphere near the named hemisphere. -/
theorem exists_markedExteriorRecognition
    (recordedOrientation : ManifoldOrientation I Vhat 4)
    (modelOrientation : ManifoldOrientation (𝓡 4) StandardFourSphere 4)
    (g : SmoothRiemannianMetric I Vhat) (W : Vhat → Matrix (Fin 3) (Fin 3) ℝ)
    {δ e x η : ℝ}
    (hδ : 0 < δ) (hBudget : e ≤ 2 * (4 * Real.pi ^ 2) - δ)
    (hBubble : 4 * Real.pi ^ 2 < x) (hη : 0 ≤ η) (hError : η ≤ δ)
    (hExterior : chiralFrameEnergy g W ≤ e - x + η)
    (hPositive : 0 < classYamabeFour recordedOrientation.dimension_eq g)
    (hRecognize : 0 < classYamabeFour recordedOrientation.dimension_eq g →
      chiralFrameEnergy g W < 4 * Real.pi ^ 2 →
      Nonempty {recognition : Vhat ≃ₘ⟮I, 𝓡 4⟯ StandardFourSphere //
        recognition.preservesOrientation recordedOrientation modelOrientation})
    (marking : PartialDiffeomorph (𝓡 4) I StandardFourSphere Vhat ∞)
    (hMarking : standardFourSphereCap ⊆ marking.source)
    (hMarkingOrientation :
      PreservesPatchOrientation marking.toOpenPartialHomeomorph modelOrientation recordedOrientation)
    (hPalais : ∀ localMap : PartialDiffeomorph (𝓡 4) (𝓡 4) StandardFourSphere StandardFourSphere ∞,
      standardFourSphereCap ⊆ localMap.source →
      PreservesPatchOrientation localMap.toOpenPartialHomeomorph modelOrientation modelOrientation →
      ∃ (ambient : StandardFourSphere ≃ₘ⟮𝓡 4, 𝓡 4⟯ StandardFourSphere) (U : Set StandardFourSphere),
        ambient.preservesOrientation modelOrientation modelOrientation ∧ IsOpen U ∧
          standardFourSphereCap ⊆ U ∧ U ⊆ localMap.source ∧ EqOn ambient localMap U) :
    chiralFrameEnergy g W < 4 * Real.pi ^ 2 ∧
      ∃ (corrected : Vhat ≃ₘ⟮I, 𝓡 4⟯ StandardFourSphere) (U : Set StandardFourSphere),
        corrected.preservesOrientation recordedOrientation modelOrientation ∧
          IsOpen U ∧ standardFourSphereCap ⊆ U ∧ U ⊆ marking.source ∧ IsOpen (marking '' U) ∧
          EqOn corrected.symm marking U ∧ EqOn corrected marking.symm (marking '' U) ∧
          corrected '' (marking '' standardFourSphereCap)ᶜ = standardFourSphereCapᶜ ∧
          corrected.symm '' standardFourSphereCapᶜ = (marking '' standardFourSphereCap)ᶜ ∧
          corrected '' (interior (marking '' standardFourSphereCap))ᶜ =
            (interior standardFourSphereCap)ᶜ ∧
          corrected.symm '' (interior standardFourSphereCap)ᶜ =
            (interior (marking '' standardFourSphereCap))ᶜ := by
  have hThreshold : chiralFrameEnergy g W < 4 * Real.pi ^ 2 :=
    exteriorEnergyLtThreshold _ δ e x η _ (by positivity) hδ hBudget hBubble hη hError hExterior
  obtain ⟨⟨recognition, hRecognition⟩⟩ := hRecognize hPositive hThreshold
  let localMap := marking.trans recognition.toPartialDiffeomorph
  have hSource : localMap.source = marking.source := by
    change marking.source ∩ marking ⁻¹' (univ : Set Vhat) = marking.source
    rw [preimage_univ, inter_univ]
  have hLocalOrientation :
      PreservesPatchOrientation localMap.toOpenPartialHomeomorph modelOrientation modelOrientation := by
    intro p hp
    change p ∈ localMap.source at hp
    have hLocal := hSource ▸ hp
    obtain ⟨A, hDerivative, hOrientation⟩ := hMarkingOrientation p hLocal
    let B := (recognition.mfderivToContinuousLinearEquiv (by simp) (marking p)).toLinearEquiv
    refine ⟨A.trans B, ?_, ?_⟩
    · intro v
      change mfderiv I (𝓡 4) recognition (marking p) (A v) =
        mfderiv (𝓡 4) (𝓡 4) (recognition ∘ marking) p v
      rw [hDerivative v]
      exact (mfderiv_comp_apply p (recognition.mdifferentiable (by simp) (marking p))
        (marking.mdifferentiableAt (by simp) hLocal) v).symm
    · erw [orientation_map_trans, hOrientation]
      exact hRecognition (marking p)
  obtain ⟨ambient, U, hAmbient, hOpen, hCap, hIn, hAgree⟩ :=
    hPalais localMap (by rwa [hSource]) hLocalOrientation
  exact ⟨hThreshold, exists_recognition_eqOn_capNeighborhood recordedOrientation modelOrientation
    recognition hRecognition marking standardFourSphereCap
    ⟨ambient, U, hAmbient, hOpen, hCap, hSource ▸ hIn, hAgree⟩⟩

end FirstOrderTwistor
