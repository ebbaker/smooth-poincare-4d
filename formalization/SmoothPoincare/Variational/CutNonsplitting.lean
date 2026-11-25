import FirstOrderTwistor.OneCutDescent

/-! # The two possible survivors of a marked cut

Both raw energies are computed on the full sides in the source metric. The strict
total cap margin selects a side that can be recognized. The oriented reassembly
then sends the original manifold to the other cap, whose metric supplies the
competitor and whose cost controls the discarded mass.
-/

open DifferentialGeometry DifferentialGeometry.Integral.Measure
open FirstOrderTwistor MeasureTheory SectionsAndConnections Set
open scoped ContDiff Manifold

namespace SmoothPoincare

private theorem discardedMass_le_excess_of_mem {A : Set ℝ} {e keep discard E γ : ℝ}
    (hBelow : BddBelow A) (hSplit : keep + discard = e) (hCost : E ≤ keep + γ)
    (hMember : E ∈ A) : discard ≤ e - sInf A + γ := by
  linarith only [csInf_le hBelow hMember, hSplit, hCost]

/-- Whichever cap supplies an admissible energy, the mass discarded from the
other side is bounded using the surcharge of that admissible cap. -/
theorem discardedMass_le_excess (A : Set ℝ) (e m₁ m₂ E₁ E₂ γ₁ γ₂ : ℝ) :
    BddBelow A → m₁ + m₂ = e →
    E₁ ≤ m₁ + γ₁ → E₂ ≤ m₂ + γ₂ → (E₁ ∈ A ∨ E₂ ∈ A) →
    ((E₁ ∈ A ∧ m₂ ≤ e - sInf A + γ₁) ∨
      (E₂ ∈ A ∧ m₁ ≤ e - sInf A + γ₂)) := by
  intro hBelow hSplit hCost₁ hCost₂ hCompetitor
  rcases hCompetitor with h₁ | h₂
  · exact Or.inl ⟨h₁, discardedMass_le_excess_of_mem hBelow hSplit hCost₁ h₁⟩
  · exact Or.inr ⟨h₂, discardedMass_le_excess_of_mem hBelow ((add_comm _ _).trans hSplit) hCost₂ h₂⟩

local instance : Fact (Module.finrank ℝ (EuclideanSpace ℝ (Fin 5)) = 4 + 1) := ⟨by simp⟩

variable {E F L H K Hv M X V : Type*}
  [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [NormedAddCommGroup F] [NormedSpace ℝ F] [FiniteDimensional ℝ F]
  [NormedAddCommGroup L] [NormedSpace ℝ L] [FiniteDimensional ℝ L]
  [TopologicalSpace H] [TopologicalSpace K] [TopologicalSpace Hv]
  {I : ModelWithCorners ℝ E H} {J : ModelWithCorners ℝ F K} {IV : ModelWithCorners ℝ L Hv}
  [I.Boundaryless] [J.Boundaryless] [IV.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [T2Space M] [CompactSpace M] [Nonempty M]
  [TopologicalSpace X] [ChartedSpace K X] [IsManifold J ∞ X]
  [T2Space X] [CompactSpace X] [Nonempty X]
  [TopologicalSpace V] [ChartedSpace Hv V] [IsManifold IV ∞ V]
  [T2Space V] [CompactSpace V] [Nonempty V]

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩
private local instance : MeasurableSpace X := borel X
private local instance : BorelSpace X := ⟨rfl⟩

/-- One full raw side and its capped metric. The core map identifies the raw
side, including the seam, with the closed complement of its marked cap. -/
structure GeometricMarkedCutSide (oX : ManifoldOrientation J X 4) where
  raw : Set M
  rawMeasurable : MeasurableSet raw
  core : PartialDiffeomorph I J M X ∞
  marking : PartialDiffeomorph (𝓡 4) J StandardFourSphere X ∞
  capInMarking : standardFourSphereCap ⊆ marking.source
  rawInCore : raw ⊆ core.source
  coreImage : core '' raw = (interior (marking '' standardFourSphereCap))ᶜ
  metric : SmoothRiemannianMetric J X
  frame : ∀ x, OrientedOrthonormalFrameAt metric oX x
  positive : 0 < classYamabeFour oX.dimension_eq metric
  integrable : Integrable (fun x => hilbertSchmidtSq (geometricChiralBlock metric oX x (frame x)))
    (riemannianVolumeMeasure J X metric)

variable {oM : ManifoldOrientation I M 4} {oX : ManifoldOrientation J X 4}
  {oV : ManifoldOrientation IV V 4} {oS : ManifoldOrientation (𝓡 4) StandardFourSphere 4}

/-- Energy on the entire measured side in the unmodified source metric. -/
noncomputable def GeometricMarkedCutSide.rawEnergy (side : GeometricMarkedCutSide (I := I) (M := M) oX)
    (g : SmoothRiemannianMetric I M) (frame : ∀ x, OrientedOrthonormalFrameAt g oM x) : ℝ :=
  ∫ x in side.raw, hilbertSchmidtSq (geometricChiralBlock g oM x (frame x))
    ∂riemannianVolumeMeasure I M g

/-- Energy of the actual smooth metric on the closed capped side. -/
noncomputable def GeometricMarkedCutSide.cappedEnergy
    (side : GeometricMarkedCutSide (I := I) (M := M) oX) : ℝ :=
  chiralFrameEnergy side.metric (fun x => geometricChiralBlock side.metric oX x (side.frame x))

/-- The geometric inputs for discarding the specified side. Recognition tests its
own metric. The cap germ extends to an ambient map of the standard sphere,
and the two signed collar patches identify the retained core and its actual cap. -/
structure MarkedSideReplacement {A : Type*} [TopologicalSpace A]
    (oM : ManifoldOrientation I M 4) (oS : ManifoldOrientation (𝓡 4) StandardFourSphere 4)
    (keep : GeometricMarkedCutSide (I := I) (M := M) oX)
    (discard : GeometricMarkedCutSide (I := I) (M := M) oV) : Prop where
  recognize : discard.cappedEnergy < 4 * Real.pi ^ 2 →
    Nonempty {r : V ≃ₘ⟮IV, 𝓡 4⟯ StandardFourSphere // r.preservesOrientation oV oS}
  extendMarking : ∀ r : V ≃ₘ⟮IV, 𝓡 4⟯ StandardFourSphere, r.preservesOrientation oV oS →
    ∃ (ambient : StandardFourSphere ≃ₘ⟮𝓡 4, 𝓡 4⟯ StandardFourSphere)
      (U : Set StandardFourSphere), ambient.preservesOrientation oS oS ∧
        IsOpen U ∧ standardFourSphereCap ⊆ U ∧ U ⊆ discard.marking.source ∧
        EqOn ambient (discard.marking.trans r.toPartialDiffeomorph) U
  realize : ∀ (r : V ≃ₘ⟮IV, 𝓡 4⟯ StandardFourSphere) (U : Set StandardFourSphere),
    r.preservesOrientation oV oS → IsOpen U → standardFourSphereCap ⊆ U →
    U ⊆ discard.marking.source → EqOn r.symm discard.marking U →
    r '' (interior (discard.marking '' standardFourSphereCap))ᶜ = (interior standardFourSphereCap)ᶜ →
    ∃ q : MarkedCutRealization A oM oX keep.core discard.marking r U,
      discard.raw ⊆ (exteriorPatchOfRecognition q.retained r q.normalBall).source ∧
      EqOn q.retained discard.core discard.raw ∧
      q.normalBall '' (interior standardFourSphereCap)ᶜ = keep.marking '' standardFourSphereCap

omit [I.Boundaryless] [T2Space M] [CompactSpace M] [Nonempty M] in
/-- An oriented recognition of the opposite cap gives a marked diffeomorphism
that follows the retained core and sends the discarded piece onto the retained cap. -/
theorem MarkedSideReplacement.reassembleOfRecognition {A : Type*} [TopologicalSpace A]
    {keep : GeometricMarkedCutSide (I := I) (M := M) oX}
    {discard : GeometricMarkedCutSide (I := I) (M := M) oV}
    (cut : MarkedSideReplacement (A := A) oM oS keep discard)
    (initial : V ≃ₘ⟮IV, 𝓡 4⟯ StandardFourSphere) (hInitial : initial.preservesOrientation oV oS) :
    ∃ Φ : M ≃ₘ⟮I, J⟯ X, Φ.preservesOrientation oM oX ∧
      EqOn Φ keep.core keep.core.source ∧ Φ '' discard.raw = keep.marking '' standardFourSphereCap := by
  obtain ⟨r, U, hr, hOpen, hCap, hSource, _, hInverse, _, _, _, hClosed, _⟩ :=
    exists_recognition_eqOn_capNeighborhood oV oS initial hInitial discard.marking standardFourSphereCap
      (cut.extendMarking initial hInitial)
  obtain ⟨q, hRaw, hRawMap, hBallImage⟩ := cut.realize r U hr hOpen hCap hSource hInverse hClosed
  obtain ⟨Φ, hΦ, hCore, hExterior⟩ := originalTypeOfRecognizedExterior oM oX keep.core q.retained r
    q.normalBall discard.marking hInverse q.sourceCollar q.targetCollar q.sphereCollar
    q.insideRecognition q.retainedMarking q.targetDomain q.sourceCover q.targetCover
    q.sourceOverlap q.targetOverlap q.coreFormula q.ballFormula q.coreOrientation q.exteriorOrientation
  refine ⟨Φ, hΦ, hCore, ?_⟩
  calc
    Φ '' discard.raw = (fun x => q.normalBall (r (discard.core x))) '' discard.raw :=
      (show EqOn Φ (fun x => q.normalBall (r (discard.core x))) discard.raw from fun x hx =>
        (hExterior (hRaw hx)).trans (congrArg (fun z => q.normalBall (r z)) (hRawMap hx))).image_eq
    _ = q.normalBall '' (r '' (discard.core '' discard.raw)) := by simp only [image_image]
    _ = keep.marking '' standardFourSphereCap := by rw [discard.coreImage, hClosed, hBallImage]

omit [I.Boundaryless] [T2Space M] [CompactSpace M] [Nonempty M] in
/-- The original strict-threshold marked reassembly. -/
theorem MarkedSideReplacement.reassemble {A : Type*} [TopologicalSpace A]
    {keep : GeometricMarkedCutSide (I := I) (M := M) oX}
    {discard : GeometricMarkedCutSide (I := I) (M := M) oV}
    (cut : MarkedSideReplacement (A := A) oM oS keep discard)
    (hSmall : discard.cappedEnergy < 4 * Real.pi ^ 2) :
    ∃ Φ : M ≃ₘ⟮I, J⟯ X, Φ.preservesOrientation oM oX ∧
      EqOn Φ keep.core keep.core.source ∧ Φ '' discard.raw = keep.marking '' standardFourSphereCap := by
  obtain ⟨⟨initial, hInitial⟩⟩ := cut.recognize hSmall
  exact cut.reassembleOfRecognition initial hInitial

/-- The returned competitor includes the oriented map, its core restriction,
the full raw side and cap images, and the energy of its actual pullback metric. -/
def GeometricMarkedCutSide.ProvidesCompetitor
    (keep : GeometricMarkedCutSide (I := I) (M := M) oX) (discardedRaw : Set M) : Prop :=
  keep.cappedEnergy ∈ geometricPositiveEnergies oM ∧
    ∃ (Φ : M ≃ₘ⟮I, J⟯ X) (hΦ : Φ.preservesOrientation oM oX),
      let pull := Diffeomorph.pullbackMetricCross keep.metric Φ
      let frames := pullbackOrientedOrthonormalFrames keep.metric Φ hΦ keep.frame
      let W := fun x => geometricChiralBlock pull oM x (frames x)
      EqOn Φ keep.core keep.core.source ∧
        Φ '' keep.raw = (interior (keep.marking '' standardFourSphereCap))ᶜ ∧
        Φ '' discardedRaw = keep.marking '' standardFourSphereCap ∧
        0 < classYamabeFour oM.dimension_eq pull ∧
        Integrable (fun x => hilbertSchmidtSq (W x)) (riemannianVolumeMeasure I M pull) ∧
        chiralFrameEnergy pull W = keep.cappedEnergy

private theorem MarkedSideReplacement.competitorOfRecognition {A : Type*} [TopologicalSpace A]
    {keep : GeometricMarkedCutSide (I := I) (M := M) oX}
    {discard : GeometricMarkedCutSide (I := I) (M := M) oV}
    (cut : MarkedSideReplacement (A := A) oM oS keep discard)
    (initial : V ≃ₘ⟮IV, 𝓡 4⟯ StandardFourSphere) (hInitial : initial.preservesOrientation oV oS) :
    keep.ProvidesCompetitor (oM := oM) discard.raw := by
  obtain ⟨Φ, hΦ, hCore, hCap⟩ := cut.reassembleOfRecognition initial hInitial
  have hRaw := ((hCore.mono keep.rawInCore).image_eq).trans keep.coreImage
  obtain ⟨hPositive, hIntegral, hEnergy⟩ :=
    geometricPullbackCompetitor Φ hΦ keep.metric keep.frame keep.positive keep.integrable
  refine ⟨?_, Φ, hΦ, hCore, hRaw, hCap, hPositive, hIntegral, hEnergy⟩
  exact ⟨Diffeomorph.pullbackMetricCross keep.metric Φ,
    pullbackOrientedOrthonormalFrames keep.metric Φ hΦ keep.frame, hPositive, hIntegral, hEnergy⟩

private theorem MarkedSideReplacement.competitor {A : Type*} [TopologicalSpace A]
    {keep : GeometricMarkedCutSide (I := I) (M := M) oX}
    {discard : GeometricMarkedCutSide (I := I) (M := M) oV}
    (cut : MarkedSideReplacement (A := A) oM oS keep discard)
    (hSmall : discard.cappedEnergy < 4 * Real.pi ^ 2) :
    keep.ProvidesCompetitor (oM := oM) discard.raw := by
  obtain ⟨⟨initial, hInitial⟩⟩ := cut.recognize hSmall
  exact cut.competitorOfRecognition initial hInitial

omit [I.Boundaryless] [Nonempty M] in
private theorem rawEnergies_add (g : SmoothRiemannianMetric I M)
    (frame : ∀ x, OrientedOrthonormalFrameAt g oM x)
    (left : GeometricMarkedCutSide (I := I) (M := M) oX)
    (right : GeometricMarkedCutSide (I := I) (M := M) oV)
    (hInt : Integrable (fun x => hilbertSchmidtSq (geometricChiralBlock g oM x (frame x)))
      (riemannianVolumeMeasure I M g))
    (hCover : left.raw ∪ right.raw = univ)
    (hOverlap : AEDisjoint (riemannianVolumeMeasure I M g) left.raw right.raw) :
    left.rawEnergy g frame + right.rawEnergy g frame =
      chiralFrameEnergy g (fun x => geometricChiralBlock g oM x (frame x)) := by
  have hSum := setIntegral_union₀ hOverlap right.rawMeasurable.nullMeasurableSet
    hInt.integrableOn hInt.integrableOn
  rw [hCover, setIntegral_univ] at hSum
  exact hSum.symm

/-- For two full measured sides of one marked cut, the total cap budget selects
a recognized opposite cap. The resulting marked competitor gives the bound
with the surcharge of the retained cap. -/
theorem geometricDiscardedMass_le_excess {A : Type*} [TopologicalSpace A]
    (g : SmoothRiemannianMetric I M) (frame : ∀ x, OrientedOrthonormalFrameAt g oM x)
    (left : GeometricMarkedCutSide (I := I) (M := M) oX)
    (right : GeometricMarkedCutSide (I := I) (M := M) oV)
    (hInt : Integrable (fun x => hilbertSchmidtSq (geometricChiralBlock g oM x (frame x)))
      (riemannianVolumeMeasure I M g))
    (hCover : left.raw ∪ right.raw = univ)
    (hOverlap : AEDisjoint (riemannianVolumeMeasure I M g) left.raw right.raw)
    (keepLeft : MarkedSideReplacement (A := A) oM oS left right)
    (keepRight : MarkedSideReplacement (A := A) oM oS right left)
    {γ₁ γ₂ : ℝ} :
    let e := chiralFrameEnergy g (fun x => geometricChiralBlock g oM x (frame x))
    let excess := e - sInf (geometricPositiveEnergies oM)
    left.cappedEnergy ≤ left.rawEnergy g frame + γ₁ →
    right.cappedEnergy ≤ right.rawEnergy g frame + γ₂ →
    e + γ₁ + γ₂ < 2 * (4 * Real.pi ^ 2) →
    ((left.ProvidesCompetitor (oM := oM) right.raw ∧ right.rawEnergy g frame ≤ excess + γ₁) ∨
      (right.ProvidesCompetitor (oM := oM) left.raw ∧ left.rawEnergy g frame ≤ excess + γ₂)) := by
  intro e excess hCost₁ hCost₂ hMargin
  have hSplit : left.rawEnergy g frame + right.rawEnergy g frame = e :=
    rawEnergies_add g frame left right hInt hCover hOverlap
  have hCaps : left.cappedEnergy + right.cappedEnergy < 2 * (4 * Real.pi ^ 2) := by
    linarith only [hSplit, hCost₁, hCost₂, hMargin]
  have hBelow := geometricPositiveEnergies_bddBelow oM
  rcases eitherSummandEnergyLtThreshold hCaps with hSmall | hSmall
  · have hCompetitor := keepRight.competitor hSmall
    exact Or.inr ⟨hCompetitor,
      discardedMass_le_excess_of_mem hBelow ((add_comm _ _).trans hSplit) hCost₂ hCompetitor.1⟩
  · have hCompetitor := keepLeft.competitor hSmall
    exact Or.inl ⟨hCompetitor, discardedMass_le_excess_of_mem hBelow hSplit hCost₁ hCompetitor.1⟩

/-- A nonstrict total cap budget supplies at least one inclusive recognition test. -/
theorem eitherCappedEnergy_le_threshold {T E₁ E₂ : ℝ} (hSum : E₁ + E₂ ≤ 2 * T) :
    E₁ ≤ T ∨ E₂ ≤ T := by
  by_cases h₁ : E₁ ≤ T
  · exact Or.inl h₁
  · exact Or.inr (by linarith only [lt_of_not_ge h₁, hSum])

/-- With inclusive recognition, either a bound on the two actual capped energies
or the sufficient bound on the source energy plus both surcharges gives a marked
competitor and the retained-side discarded-mass inequality. -/
theorem geometricDiscardedMass_le_excess_inclusive {A : Type*} [TopologicalSpace A]
    (g : SmoothRiemannianMetric I M) (frame : ∀ x, OrientedOrthonormalFrameAt g oM x)
    (left : GeometricMarkedCutSide (I := I) (M := M) oX)
    (right : GeometricMarkedCutSide (I := I) (M := M) oV)
    (hInt : Integrable (fun x => hilbertSchmidtSq (geometricChiralBlock g oM x (frame x)))
      (riemannianVolumeMeasure I M g))
    (hCover : left.raw ∪ right.raw = univ)
    (hOverlap : AEDisjoint (riemannianVolumeMeasure I M g) left.raw right.raw)
    (keepLeft : MarkedSideReplacement (A := A) oM oS left right)
    (keepRight : MarkedSideReplacement (A := A) oM oS right left)
    (recognizeLeft : left.cappedEnergy ≤ 4 * Real.pi ^ 2 →
      Nonempty {r : X ≃ₘ⟮J, 𝓡 4⟯ StandardFourSphere // r.preservesOrientation oX oS})
    (recognizeRight : right.cappedEnergy ≤ 4 * Real.pi ^ 2 →
      Nonempty {r : V ≃ₘ⟮IV, 𝓡 4⟯ StandardFourSphere // r.preservesOrientation oV oS})
    {γ₁ γ₂ : ℝ} :
    let e := chiralFrameEnergy g (fun x => geometricChiralBlock g oM x (frame x))
    let excess := e - sInf (geometricPositiveEnergies oM)
    left.cappedEnergy ≤ left.rawEnergy g frame + γ₁ →
    right.cappedEnergy ≤ right.rawEnergy g frame + γ₂ →
    (left.cappedEnergy + right.cappedEnergy ≤ 2 * (4 * Real.pi ^ 2) ∨
      e + γ₁ + γ₂ ≤ 2 * (4 * Real.pi ^ 2)) →
    ((left.ProvidesCompetitor (oM := oM) right.raw ∧ right.rawEnergy g frame ≤ excess + γ₁) ∨
      (right.ProvidesCompetitor (oM := oM) left.raw ∧ left.rawEnergy g frame ≤ excess + γ₂)) := by
  intro e excess hCost₁ hCost₂ hMargin
  have hSplit : left.rawEnergy g frame + right.rawEnergy g frame = e :=
    rawEnergies_add g frame left right hInt hCover hOverlap
  have hCaps : left.cappedEnergy + right.cappedEnergy ≤ 2 * (4 * Real.pi ^ 2) := by
    rcases hMargin with hCaps | hTotal
    · exact hCaps
    · linarith only [hSplit, hCost₁, hCost₂, hTotal]
  have hBelow := geometricPositiveEnergies_bddBelow oM
  rcases eitherCappedEnergy_le_threshold hCaps with hSmall | hSmall
  · obtain ⟨⟨r, hr⟩⟩ := recognizeLeft hSmall
    have hCompetitor := keepRight.competitorOfRecognition r hr
    exact Or.inr ⟨hCompetitor,
      discardedMass_le_excess_of_mem hBelow ((add_comm _ _).trans hSplit) hCost₂ hCompetitor.1⟩
  · obtain ⟨⟨r, hr⟩⟩ := recognizeRight hSmall
    have hCompetitor := keepLeft.competitorOfRecognition r hr
    exact Or.inl ⟨hCompetitor, discardedMass_le_excess_of_mem hBelow hSplit hCost₁ hCompetitor.1⟩

omit [I.Boundaryless] [T2Space M] [CompactSpace M] [Nonempty M] in
/-- When both actual caps meet the inclusive threshold, their recognitions give
an oriented identification of the original manifold with the standard sphere.
The intermediate diffeomorphism retains the two marked image identities. -/
theorem MarkedSideReplacement.recognizeOriginalOfBothCaps_le_threshold {A : Type*} [TopologicalSpace A]
    {keep : GeometricMarkedCutSide (I := I) (M := M) oX}
    {discard : GeometricMarkedCutSide (I := I) (M := M) oV}
    (cut : MarkedSideReplacement (A := A) oM oS keep discard)
    (recognizeKeep : keep.cappedEnergy ≤ 4 * Real.pi ^ 2 →
      Nonempty {r : X ≃ₘ⟮J, 𝓡 4⟯ StandardFourSphere // r.preservesOrientation oX oS})
    (recognizeDiscard : discard.cappedEnergy ≤ 4 * Real.pi ^ 2 →
      Nonempty {r : V ≃ₘ⟮IV, 𝓡 4⟯ StandardFourSphere // r.preservesOrientation oV oS})
    (hKeep : keep.cappedEnergy ≤ 4 * Real.pi ^ 2)
    (hDiscard : discard.cappedEnergy ≤ 4 * Real.pi ^ 2) :
    ∃ (Φ : M ≃ₘ⟮I, J⟯ X) (r : X ≃ₘ⟮J, 𝓡 4⟯ StandardFourSphere),
      Φ.preservesOrientation oM oX ∧ r.preservesOrientation oX oS ∧
      EqOn Φ keep.core keep.core.source ∧
      Φ '' keep.raw = (interior (keep.marking '' standardFourSphereCap))ᶜ ∧
      Φ '' discard.raw = keep.marking '' standardFourSphereCap ∧
      (Φ.trans r).preservesOrientation oM oS := by
  obtain ⟨⟨initial, hInitial⟩⟩ := recognizeDiscard hDiscard
  obtain ⟨⟨r, hr⟩⟩ := recognizeKeep hKeep
  obtain ⟨Φ, hΦ, hCore, hCap⟩ := cut.reassembleOfRecognition initial hInitial
  exact ⟨Φ, r, hΦ, hr, hCore, ((hCore.mono keep.rawInCore).image_eq).trans keep.coreImage,
    hCap, Diffeomorph.preservesOrientation_trans hΦ hr⟩

end SmoothPoincare
