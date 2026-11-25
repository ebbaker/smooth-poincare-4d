import SmoothPoincare

/-! Boundary and same-witness replays for the second Edition 03 milestone. -/

open DifferentialGeometry FirstOrderTwistor SmoothPoincare Set
open scoped ContDiff Manifold

#check geometricDiscardedMass_le_excess
#check geometricDiscardedMass_le_excess_inclusive
#check MarkedSideReplacement.reassemble
#check MarkedSideReplacement.reassembleOfRecognition
#check MarkedSideReplacement.recognizeOriginalOfBothCaps_le_threshold
#print axioms eitherCappedEnergy_le_threshold
#print axioms geometricDiscardedMass_le_excess
#print axioms geometricDiscardedMass_le_excess_inclusive
#print axioms MarkedSideReplacement.reassembleOfRecognition
#print axioms MarkedSideReplacement.recognizeOriginalOfBothCaps_le_threshold

example (T : ℝ) : T ≤ T ∨ T ≤ T :=
  eitherCappedEnergy_le_threshold (by linarith : T + T ≤ 2 * T)

section
local instance : Fact (Module.finrank ℝ (EuclideanSpace ℝ (Fin 5)) = 4 + 1) := ⟨by simp⟩

variable {M X V A : Type*} [TopologicalSpace A]
  [TopologicalSpace M] [ChartedSpace (EuclideanSpace ℝ (Fin 4)) M] [IsManifold (𝓡 4) ∞ M]
  [TopologicalSpace X] [ChartedSpace (EuclideanSpace ℝ (Fin 4)) X] [IsManifold (𝓡 4) ∞ X]
  [T2Space X] [CompactSpace X] [Nonempty X]
  [TopologicalSpace V] [ChartedSpace (EuclideanSpace ℝ (Fin 4)) V] [IsManifold (𝓡 4) ∞ V]
  [T2Space V] [CompactSpace V] [Nonempty V]
  {oM : ManifoldOrientation (𝓡 4) M 4} {oX : ManifoldOrientation (𝓡 4) X 4}
  {oV : ManifoldOrientation (𝓡 4) V 4} {oS : ManifoldOrientation (𝓡 4) StandardFourSphere 4}

example (keep : GeometricMarkedCutSide (I := 𝓡 4) (M := M) oX)
    (discard : GeometricMarkedCutSide (I := 𝓡 4) (M := M) oV)
    (cut : MarkedSideReplacement (A := A) oM oS keep discard)
    (recognizeKeep : keep.cappedEnergy = 4 * Real.pi ^ 2 →
      Nonempty {r : X ≃ₘ⟮𝓡 4, 𝓡 4⟯ StandardFourSphere // r.preservesOrientation oX oS})
    (recognizeDiscard : discard.cappedEnergy = 4 * Real.pi ^ 2 →
      Nonempty {r : V ≃ₘ⟮𝓡 4, 𝓡 4⟯ StandardFourSphere // r.preservesOrientation oV oS})
    (hKeep : keep.cappedEnergy = 4 * Real.pi ^ 2) (hDiscard : discard.cappedEnergy = 4 * Real.pi ^ 2) :
    ∃ (Φ : M ≃ₘ⟮𝓡 4, 𝓡 4⟯ X) (r : X ≃ₘ⟮𝓡 4, 𝓡 4⟯ StandardFourSphere),
      (Φ.trans r).preservesOrientation oM oS ∧
      Φ '' keep.raw = (interior (keep.marking '' standardFourSphereCap))ᶜ ∧
      Φ '' discard.raw = keep.marking '' standardFourSphereCap := by
  obtain ⟨Φ, r, _, _, _, hCore, hCap, hOrientation⟩ :=
    cut.recognizeOriginalOfBothCaps_le_threshold
      (fun _ => recognizeKeep hKeep) (fun _ => recognizeDiscard hDiscard) hKeep.le hDiscard.le
  exact ⟨Φ, r, hOrientation, hCore, hCap⟩
end

section Geometry

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  {g : SmoothRiemannianMetric I M} {F : IsometricHypersurface g}
  {o : ManifoldOrientation I M 4}

/-- Deliberately permits unrelated choices of normal and principal basis at different points. -/
example (U : Set M) (hOpen : IsOpen U) (hExists : U.Nonempty)
    (P : ∀ z : U, PrincipalFrameAt F o z.val)
    (hSpec : ∀ z, ∃ k : ℝ, 0 < k ∧ (P z).curvature = ![-k, -k, k, k]) : False :=
  noOpenBalancedPrincipalFrames U hOpen hExists P hSpec

#check noOpenBalancedPrincipalFrames
#print axioms noOpenBalancedPrincipalFrames
#check principalNormal_gramJacobian
#print axioms principalNormal_gramJacobian
#check anchoredShell_places_charged_sets
#print axioms anchoredShell_places_charged_sets
#check chartCurvatureFirstJetTerm_sub_memLp_and_le
#print axioms chartCurvatureFirstJetTerm_sub_memLp_and_le
#check meanActualIndexTwo_eq_gaussMass
#print axioms meanActualIndexTwo_eq_gaussMass
#check inducedEnergy_strict_of_actualIndexTwo
#print axioms inducedEnergy_strict_of_actualIndexTwo

#check geometricRecognitionEndpoint
#print axioms geometricRecognitionEndpoint
#check geometricChargedCut_le_excess
#print axioms geometricChargedCut_le_excess
#check endpointPhysicalSpectralDeficit
#print axioms endpointPhysicalSpectralDeficit
#check endpointPhysicalSpectralLimits
#print axioms endpointPhysicalSpectralLimits
#check geometricEventually_lt_endpointCollarAllowance
#print axioms geometricEventually_lt_endpointCollarAllowance
#check metricChiralQuantile_div_tendsto_atTop_of_fullCurvature_vanishes
#print axioms metricChiralQuantile_div_tendsto_atTop_of_fullCurvature_vanishes

end Geometry
