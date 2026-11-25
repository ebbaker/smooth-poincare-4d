import FirstOrderTwistor.ExteriorRecognition
import FirstOrderTwistor.GeometricCutDescent
import FirstOrderTwistor.MarkedCut

/-! # Geometric descent through one marked exterior

The exterior and the compactification each carry their own supplied metric.
After recognizing the exterior, the local realization is taken on a signed
collar in the corrected cap neighborhood.
-/

open DifferentialGeometry DifferentialGeometry.Integral.Measure
open MeasureTheory SectionsAndConnections Set
open scoped ContDiff Manifold

namespace FirstOrderTwistor

local instance : Fact (Module.finrank ℝ (EuclideanSpace ℝ (Fin 5)) = 4 + 1) := ⟨by simp⟩

variable {E F L H K Hv M X V : Type*}
  [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [NormedAddCommGroup F] [NormedSpace ℝ F] [FiniteDimensional ℝ F]
  [NormedAddCommGroup L] [NormedSpace ℝ L] [FiniteDimensional ℝ L]
  [TopologicalSpace H] [TopologicalSpace K] [TopologicalSpace Hv]
  {I : ModelWithCorners ℝ E H} {J : ModelWithCorners ℝ F K} {IV : ModelWithCorners ℝ L Hv}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [TopologicalSpace X] [ChartedSpace K X] [IsManifold J ∞ X]
  [TopologicalSpace V] [ChartedSpace Hv V]

/-- Local identifications for the specified core and the exterior determined by
the corrected recognition. The common chart may be shrunk inside `U`. -/
structure MarkedCutRealization (A : Type*) [TopologicalSpace A]
    (oM : ManifoldOrientation I M 4) (oX : ManifoldOrientation J X 4)
    (core : PartialDiffeomorph I J M X ∞)
    (marking : PartialDiffeomorph (𝓡 4) IV StandardFourSphere V ∞)
    (recognition : V ≃ₘ⟮IV, 𝓡 4⟯ StandardFourSphere) (U : Set StandardFourSphere) where
  retained : PartialDiffeomorph I IV M V ∞
  normalBall : PartialDiffeomorph (𝓡 4) J StandardFourSphere X ∞
  sourceCollar : OpenPartialHomeomorph (ℝ × A) M
  targetCollar : OpenPartialHomeomorph (ℝ × A) X
  sphereCollar : OpenPartialHomeomorph (ℝ × A) StandardFourSphere
  targetDomain : sourceCollar.source = targetCollar.source
  sphereDomain : sourceCollar.source ⊆ sphereCollar.source
  insideRecognition : MapsTo sphereCollar sourceCollar.source U
  retainedMarking : EqOn (fun z => retained (sourceCollar z)) (fun z => marking (sphereCollar z))
    sourceCollar.source
  sourceCover : core.source ∪ (exteriorPatchOfRecognition retained recognition normalBall).source = univ
  targetCover : core.target ∪ (exteriorPatchOfRecognition retained recognition normalBall).target = univ
  sourceOverlap :
    sourceCollar.target = core.source ∩ (exteriorPatchOfRecognition retained recognition normalBall).source
  targetOverlap :
    targetCollar.target = core.target ∩ (exteriorPatchOfRecognition retained recognition normalBall).target
  coreFormula : EqOn (fun z => core (sourceCollar z)) targetCollar sourceCollar.source
  ballFormula : EqOn (fun z => normalBall (sphereCollar z)) targetCollar sourceCollar.source
  coreOrientation : PreservesPatchOrientation core.toOpenPartialHomeomorph oM oX
  exteriorOrientation :
    PreservesPatchOrientation
      (exteriorPatchOfRecognition retained recognition normalBall).toOpenPartialHomeomorph oM oX

variable [I.Boundaryless] [J.Boundaryless] [IV.Boundaryless]
  [T2Space M] [CompactSpace M] [Nonempty M]
  [T2Space X] [CompactSpace X] [Nonempty X]
  [IsManifold IV ∞ V] [T2Space V] [CompactSpace V] [Nonempty V]

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩
private local instance : MeasurableSpace X := borel X
private local instance : BorelSpace X := ⟨rfl⟩
private local instance : MeasurableSpace V := borel V
private local instance : BorelSpace V := ⟨rfl⟩

/-- A specified capped exterior with the CUT-E01 budget and positive Yamabe
class can be used to reassemble the original type. The compactification metric
then contributes its curvature-derived energy to the original variational set.
The supplied Route 02 residual data make the decrease strict and give a
uniform margin for each supplied Yamabe deficit. -/
theorem oneCutDescent {A : Type*} [TopologicalSpace A]
    (oM : ManifoldOrientation I M 4) (oX : ManifoldOrientation J X 4)
    (oV : ManifoldOrientation IV V 4) (oS : ManifoldOrientation (𝓡 4) StandardFourSphere 4)
    (core : PartialDiffeomorph I J M X ∞)
    (marking : PartialDiffeomorph (𝓡 4) IV StandardFourSphere V ∞)
    (hMarking : standardFourSphereCap ⊆ marking.source)
    (hMarkingOrientation : PreservesPatchOrientation marking.toOpenPartialHomeomorph oS oV)
    (gV : SmoothRiemannianMetric IV V) (frameV : ∀ p, OrientedOrthonormalFrameAt gV oV p)
    (gX : SmoothRiemannianMetric J X) (frameX : ∀ p, OrientedOrthonormalFrameAt gX oX p)
    (hYV : 0 < classYamabeFour oV.dimension_eq gV)
    (hYX : 0 < classYamabeFour oX.dimension_eq gX)
    (hIntV : Integrable (fun p => hilbertSchmidtSq (geometricChiralBlock gV oV p (frameV p)))
      (riemannianVolumeMeasure IV V gV))
    (hIntX : Integrable (fun p => hilbertSchmidtSq (geometricChiralBlock gX oX p (frameX p)))
      (riemannianVolumeMeasure J X gX))
    {e δ η : ℝ} (hδ : 0 < δ) (hBudget : e ≤ 2 * (4 * Real.pi ^ 2) - δ)
    (hBubble : 4 * Real.pi ^ 2 < chiralFrameEnergy gX (fun p => geometricChiralBlock gX oX p (frameX p)))
    (hη : 0 ≤ η) (hError : η ≤ δ)
    (hExterior : chiralFrameEnergy gV (fun p => geometricChiralBlock gV oV p (frameV p)) ≤
      e - chiralFrameEnergy gX (fun p => geometricChiralBlock gX oX p (frameX p)) + η)
    (hRecognize :
      Integrable (fun p => hilbertSchmidtSq (geometricChiralBlock gV oV p (frameV p)))
        (riemannianVolumeMeasure IV V gV) →
      0 < classYamabeFour oV.dimension_eq gV →
      chiralFrameEnergy gV (fun p => geometricChiralBlock gV oV p (frameV p)) < 4 * Real.pi ^ 2 →
      Nonempty {r : V ≃ₘ⟮IV, 𝓡 4⟯ StandardFourSphere // r.preservesOrientation oV oS})
    (hPalais : ∀ localMap : PartialDiffeomorph (𝓡 4) (𝓡 4) StandardFourSphere StandardFourSphere ∞,
      standardFourSphereCap ⊆ localMap.source →
      PreservesPatchOrientation localMap.toOpenPartialHomeomorph oS oS →
      ∃ (ambient : StandardFourSphere ≃ₘ⟮𝓡 4, 𝓡 4⟯ StandardFourSphere) (U : Set StandardFourSphere),
        ambient.preservesOrientation oS oS ∧ IsOpen U ∧ standardFourSphereCap ⊆ U ∧
          U ⊆ localMap.source ∧ EqOn ambient localMap U)
    (hRealize : ∀ (r : V ≃ₘ⟮IV, 𝓡 4⟯ StandardFourSphere) (U : Set StandardFourSphere),
      r.preservesOrientation oV oS → IsOpen U → standardFourSphereCap ⊆ U →
      U ⊆ marking.source → IsOpen (marking '' U) →
      EqOn r.symm marking U → EqOn r marking.symm (marking '' U) →
      r '' (interior (marking '' standardFourSphereCap))ᶜ = (interior standardFourSphereCap)ᶜ →
      r.symm '' (interior standardFourSphereCap)ᶜ = (interior (marking '' standardFourSphereCap))ᶜ →
      Nonempty (MarkedCutRealization A oM oX core marking r U))
    (residual : CutResidualInputs e (chiralFrameEnergy gX (fun p => geometricChiralBlock gX oX p (frameX p)))
      (classYamabeFour oX.dimension_eq gX))
    (hSharp : classYamabeFour oX.dimension_eq gX < roundYamabeConstant) :
    let x := chiralFrameEnergy gX (fun p => geometricChiralBlock gX oX p (frameX p))
    let infM := sInf (geometricPositiveEnergies oM)
    ∃ (Φ : M ≃ₘ⟮I, J⟯ X) (hΦ : Φ.preservesOrientation oM oX),
      let pull := Diffeomorph.pullbackMetricCross gX Φ
      let frames := pullbackOrientedOrthonormalFrames gX Φ hΦ frameX
      let W := fun p => geometricChiralBlock pull oM p (frames p)
      EqOn Φ core core.source ∧ 0 < classYamabeFour oM.dimension_eq pull ∧
        Integrable (fun p => hilbertSchmidtSq (W p)) (riemannianVolumeMeasure I M pull) ∧
        chiralFrameEnergy pull W = x ∧ x ∈ geometricPositiveEnergies oM ∧
        infM ≤ x ∧ x < e ∧
        (∀ deficit : ℝ, 0 < deficit → deficit < roundYamabeConstant →
          classYamabeFour oX.dimension_eq gX ≤ roundYamabeConstant - deficit →
          0 < uniformResidualMargin deficit ∧ x ≤ e - uniformResidualMargin deficit ∧
            uniformResidualMargin deficit ≤ e - infM) := by
  obtain ⟨_, r, U, hr, hOpen, hCap, hSource, hOpen', hInverse, hForward, _, _, hClosed, hClosed'⟩ :=
    exists_markedExteriorRecognition oV oS gV (fun p => geometricChiralBlock gV oV p (frameV p))
      hδ hBudget hBubble hη hError hExterior hYV (hRecognize hIntV) marking hMarking
      hMarkingOrientation hPalais
  obtain ⟨realization⟩ :=
    hRealize r U hr hOpen hCap hSource hOpen' hInverse hForward hClosed hClosed'
  obtain ⟨Φ, hΦ, hCore, _⟩ :=
    originalTypeOfRecognizedExterior oM oX core realization.retained r realization.normalBall
      marking hInverse realization.sourceCollar realization.targetCollar realization.sphereCollar
      realization.insideRecognition realization.retainedMarking realization.targetDomain
      realization.sourceCover realization.targetCover realization.sourceOverlap realization.targetOverlap
      realization.coreFormula realization.ballFormula realization.coreOrientation realization.exteriorOrientation
  obtain ⟨hY, hIntegral, hEnergy⟩ := geometricPullbackCompetitor Φ hΦ gX frameX hYX hIntX
  have hMember := geometricEnergy_mem_of_pullback Φ hΦ gX frameX hYX hIntX
  have hInf := csInf_le (geometricPositiveEnergies_bddBelow oM) hMember
  have hResidual := strictComponentResidual _ _ _ _ _ _ residual.euler residual.aeRicci
    residual.ricciBound residual.yamabeNonneg residual.yamabeTransfer hSharp
  refine ⟨Φ, hΦ, hCore, hY, hIntegral, hEnergy, hMember, hInf, sub_pos.mp hResidual.2.2.2, ?_⟩
  intro deficit hPositive hAdmissible hUniform
  obtain ⟨hMargin, hGap⟩ := uniformComponentResidual _ _ _ _ _ _ _ residual.euler residual.aeRicci
    residual.ricciBound residual.yamabeNonneg residual.yamabeTransfer hPositive hAdmissible hUniform
  exact ⟨hMargin, by linarith only [hGap], by linarith only [hGap, hInf]⟩

end FirstOrderTwistor
