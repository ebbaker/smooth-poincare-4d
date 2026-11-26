import SmoothPoincare.Variational.CutNonsplitting
import SmoothPoincare.Variational.ChargedCorePayment

/-! # Both complete raw side masses on one fixed source -/

open DifferentialGeometry DifferentialGeometry.Integral.Measure
open Filter FirstOrderTwistor MeasureTheory SectionsAndConnections Set
open scoped ContDiff Manifold Topology

namespace SmoothPoincare

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

/-- The side, closed cap marking and open core comparison are fixed before
choosing a cap metric or a drift tolerance. -/
structure FixedMarkedCutCore
    (I : ModelWithCorners ℝ E H) (M : Type*) [TopologicalSpace M] [ChartedSpace H M]
    (J : ModelWithCorners ℝ F K) (X : Type*) [TopologicalSpace X] [ChartedSpace K X] where
  raw : Set M
  rawMeasurable : MeasurableSet raw
  core : PartialDiffeomorph I J M X ∞
  marking : PartialDiffeomorph (𝓡 4) J StandardFourSphere X ∞
  capInMarking : standardFourSphereCap ⊆ marking.source
  rawInCore : raw ⊆ core.source
  coreImage : core '' raw = (interior (marking '' standardFourSphereCap))ᶜ

variable {oM : ManifoldOrientation I M 4} {oX : ManifoldOrientation J X 4}
  {oV : ManifoldOrientation IV V 4} {oS : ManifoldOrientation (𝓡 4) StandardFourSphere 4}

/-- Give the fixed marked type its actual positive metric for this tolerance. -/
def FixedMarkedCutCore.toSide (core : FixedMarkedCutCore I M J X)
    (cap : SignedCollarMetric oX) (hY : 0 < classYamabeFour oX.dimension_eq cap.metric) :
    GeometricMarkedCutSide (I := I) (M := M) oX where
  raw := core.raw
  rawMeasurable := core.rawMeasurable
  core := core.core
  marking := core.marking
  capInMarking := core.capInMarking
  rawInCore := core.rawInCore
  coreImage := core.coreImage
  metric := cap.metric
  frame := cap.frame
  positive := hY
  integrable := cap.integrable .plus

/-- Independently positive capped metrics at every error tolerance, measured
against both complete raw side energies in the same original metric. -/
def FixedMarkedCutCore.HasPositiveCaps (core : FixedMarkedCutCore I M J X)
    (source : SignedCollarMetric oM) (oX : ManifoldOrientation J X 4) : Prop :=
  ∀ ε : ℝ, 0 < ε → ∃ cap : SignedCollarMetric oX,
    0 < classYamabeFour oX.dimension_eq cap.metric ∧
      ∀ sign, |cap.energy sign - source.charge sign core.raw| < ε

omit [I.Boundaryless] [Nonempty M] [J.Boundaryless] [Nonempty X] in
/-- One closed cap with signature zero forces any imbalance of the raw
signs to be charged to its complete signed errors. -/
theorem FixedMarkedCutCore.signedMassImbalance_le
    (core : FixedMarkedCutCore I M J X) (source : SignedCollarMetric oM)
    (cap : SignedCollarMetric oX) {εPlus εMinus : ℝ}
    (hp : |cap.energy .plus - source.charge .plus core.raw| ≤ εPlus)
    (hm : |cap.energy .minus - source.charge .minus core.raw| ≤ εMinus) :
    |source.charge .plus core.raw - source.charge .minus core.raw| ≤ εPlus + εMinus := by
  have hSig : cap.energy .plus = cap.energy .minus := cap.signature_zero
  rw [show source.charge .plus core.raw - source.charge .minus core.raw =
    (source.charge .plus core.raw - cap.energy .plus) +
      (cap.energy .minus - source.charge .minus core.raw) by linarith only [hSig]]
  exact (abs_add_le _ _).trans (add_le_add ((abs_sub_comm _ _).trans_le hp) hm)

omit [I.Boundaryless] [Nonempty M] [J.Boundaryless] [Nonempty X] in
/-- Vanishing signed cap drift forces raw equality even when cap positivity
is unavailable. The cap type is fixed throughout. -/
theorem FixedMarkedCutCore.rawMasses_eq_of_signedCaps
    (core : FixedMarkedCutCore I M J X) (source : SignedCollarMetric oM)
    (hCaps : ∀ ε : ℝ, 0 < ε → ∃ cap : SignedCollarMetric oX,
      ∀ sign, |cap.energy sign - source.charge sign core.raw| < ε) :
    source.charge .plus core.raw = source.charge .minus core.raw := by
  apply eq_of_abs_sub_eq_zero
  apply le_antisymm _ (abs_nonneg _)
  apply le_of_forall_pos_le_add
  intro ε hε
  obtain ⟨q, hClose⟩ := hCaps (ε / 2) (by positivity)
  have h := core.signedMassImbalance_le source q (hClose .plus).le (hClose .minus).le
  linarith only [h]

omit [I.Boundaryless] [Nonempty M] in
/-- The closed signed energies agree by signature at every actual cap. With
two-sided vanishing error this forces equality of the complete raw masses
and bounds the positive-class infimum on the specified capped type. -/
theorem FixedMarkedCutCore.rawMasses_of_positiveCaps
    (core : FixedMarkedCutCore I M J X) (source : SignedCollarMetric oM)
    (hCaps : core.HasPositiveCaps source oX) :
    source.charge .plus core.raw = source.charge .minus core.raw ∧
      ∀ sign, sInf (geometricPositiveEnergies oX) ≤ source.charge sign core.raw := by
  have hEq := core.rawMasses_eq_of_signedCaps source (oX := oX) fun ε hε => by
    obtain ⟨q, _, hClose⟩ := hCaps ε hε
    exact ⟨q, hClose⟩
  refine ⟨hEq, ?_⟩
  have hInf : sInf (geometricPositiveEnergies oX) ≤ source.charge .plus core.raw := by
    apply le_of_forall_pos_le_add
    intro ε hε
    obtain ⟨q, hY, hClose⟩ := hCaps ε hε
    exact (csInf_le (geometricPositiveEnergies_bddBelow oX)
      (q.energy_mem_of_positive hY)).trans (by linarith only [(abs_lt.mp (hClose .plus)).2])
  intro sign
  cases sign with
  | plus => exact hInf
  | minus => rwa [← hEq]

omit [I.Boundaryless] [Nonempty M] [FiniteDimensional ℝ F] [FiniteDimensional ℝ L]
  [J.Boundaryless] [IV.Boundaryless] [IsManifold J ∞ X] [T2Space X] [CompactSpace X]
  [Nonempty X] [IsManifold IV ∞ V] [T2Space V] [CompactSpace V] [Nonempty V] in
/-- Volume-a.e. disjointness of the two measured full sides also holds for
both absolutely continuous chiral measures. The seam is counted once. -/
theorem FixedMarkedCutCore.fullMassPartition
    (left : FixedMarkedCutCore I M J X) (right : FixedMarkedCutCore I M IV V)
    (source : SignedCollarMetric oM) (hCover : left.raw ∪ right.raw = univ)
    (hOverlap : AEDisjoint (riemannianVolumeMeasure I M source.metric) left.raw right.raw)
    (sign : CollarChirality) :
    source.charge sign left.raw + source.charge sign right.raw = source.energy sign := by
  have hChiral : AEDisjoint (source.chiralMeasure sign) left.raw right.raw :=
    hOverlap.of_absolutelyContinuous (withDensity_absolutelyContinuous _ _)
  have hSum := measureReal_union₀ right.rawMeasurable.nullMeasurableSet hChiral
    (measure_ne_top (source.chiralMeasure sign) left.raw)
    (measure_ne_top (source.chiralMeasure sign) right.raw)
  rw [hCover] at hSum
  exact hSum.symm.trans (source.charge_univ sign)

omit [I.Boundaryless] [Nonempty M] in
/-- Recognize a strictly smaller raw side at a finite tolerance. The
resulting reassembly remembers the full closed core and cap images. -/
theorem FixedMarkedCutCore.reassemble_of_rawMass_lt {A : Type*} [TopologicalSpace A]
    (keep : FixedMarkedCutCore I M J X) (discard : FixedMarkedCutCore I M IV V)
    (source : SignedCollarMetric oM)
    (hKeep : keep.HasPositiveCaps source oX) (hDiscard : discard.HasPositiveCaps source oV)
    (replace : ∀ (q : SignedCollarMetric oX) (r : SignedCollarMetric oV)
      (hq : 0 < classYamabeFour oX.dimension_eq q.metric)
      (hr : 0 < classYamabeFour oV.dimension_eq r.metric),
      MarkedSideReplacement (A := A) oM oS (keep.toSide q hq) (discard.toSide r hr))
    (hSmall : source.charge .plus discard.raw < 4 * Real.pi ^ 2) :
    Nonempty {r : V ≃ₘ⟮IV, 𝓡 4⟯ StandardFourSphere // r.preservesOrientation oV oS} ∧
      ∃ Φ : M ≃ₘ⟮I, J⟯ X, Φ.preservesOrientation oM oX ∧
        EqOn Φ keep.core keep.core.source ∧
        Φ '' keep.raw = (interior (keep.marking '' standardFourSphereCap))ᶜ ∧
        Φ '' discard.raw = keep.marking '' standardFourSphereCap := by
  let ε := 4 * Real.pi ^ 2 - source.charge .plus discard.raw
  have hε : 0 < ε := sub_pos.mpr hSmall
  obtain ⟨q, hq, _⟩ := hKeep ε hε
  obtain ⟨r, hr, hCost⟩ := hDiscard ε hε
  have hFinite : (discard.toSide r hr).cappedEnergy < 4 * Real.pi ^ 2 := by
    change r.energy .plus < _
    have h := (abs_lt.mp (hCost .plus)).2
    dsimp [ε] at h
    linarith only [h]
  have hRecognized := (replace q r hq hr).recognize hFinite
  obtain ⟨⟨r', hr'⟩⟩ := hRecognized
  obtain ⟨Φ, hΦ, hCore, hCap⟩ := (replace q r hq hr).reassembleOfRecognition r' hr'
  exact ⟨⟨⟨r', hr'⟩⟩, Φ, hΦ, hCore,
    ((hCore.mono keep.rawInCore).image_eq).trans keep.coreImage, hCap⟩

/-- The identification of the two full regions and the energy constraints
are recorded for the same survivor and the same oriented reassembly. -/
def FixedMarkedCutCore.Survives
    (keep : FixedMarkedCutCore I M J X) (discard : FixedMarkedCutCore I M IV V)
    (source : SignedCollarMetric oM) (oX : ManifoldOrientation J X 4)
    (oV : ManifoldOrientation IV V 4) (oS : ManifoldOrientation (𝓡 4) StandardFourSphere 4) : Prop :=
    Nonempty {r : V ≃ₘ⟮IV, 𝓡 4⟯ StandardFourSphere // r.preservesOrientation oV oS} ∧
      (∀ sign, 4 * Real.pi ^ 2 ≤ source.charge sign keep.raw ∧
        source.charge sign discard.raw < 4 * Real.pi ^ 2 ∧
        source.charge sign discard.raw ≤ source.energy .plus - sInf (geometricPositiveEnergies oM)) ∧
      ∃ Φ : M ≃ₘ⟮I, J⟯ X, Φ.preservesOrientation oM oX ∧
        EqOn Φ keep.core keep.core.source ∧
        Φ '' keep.raw = (interior (keep.marking '' standardFourSphereCap))ᶜ ∧
        Φ '' discard.raw = keep.marking '' standardFourSphereCap

/-- The same marked survivor works in both signs. It is strictly heavier
than the recognized side on a nonstandard source: the latter has raw mass
strictly below the threshold, the former at least the threshold. -/
theorem FixedMarkedCutCore.survives_of_rawMass_lt {A : Type*} [TopologicalSpace A]
    (keep : FixedMarkedCutCore I M J X) (discard : FixedMarkedCutCore I M IV V)
    (source : SignedCollarMetric oM)
    (hKeep : keep.HasPositiveCaps source oX) (hDiscard : discard.HasPositiveCaps source oV)
    (replace : ∀ (q : SignedCollarMetric oX) (r : SignedCollarMetric oV)
      (hq : 0 < classYamabeFour oX.dimension_eq q.metric)
      (hr : 0 < classYamabeFour oV.dimension_eq r.metric),
      MarkedSideReplacement (A := A) oM oS (keep.toSide q hq) (discard.toSide r hr))
    (replaceBack : ∀ (r : SignedCollarMetric oV) (q : SignedCollarMetric oX)
      (hr : 0 < classYamabeFour oV.dimension_eq r.metric)
      (hq : 0 < classYamabeFour oX.dimension_eq q.metric),
      MarkedSideReplacement (A := A) oM oS (discard.toSide r hr) (keep.toSide q hq))
    (hCover : keep.raw ∪ discard.raw = univ)
    (hOverlap : AEDisjoint (riemannianVolumeMeasure I M source.metric) keep.raw discard.raw)
    (hNonstandard : ¬ Nonempty {r : M ≃ₘ⟮I, 𝓡 4⟯ StandardFourSphere // r.preservesOrientation oM oS})
    (hSmall : source.charge .plus discard.raw < 4 * Real.pi ^ 2) :
    keep.Survives discard source oX oV oS := by
  obtain ⟨hd, Φ, hΦ, hCore, hKeepImage, hDiscardImage⟩ :=
    keep.reassemble_of_rawMass_lt discard source hKeep hDiscard replace hSmall
  have hLarge : 4 * Real.pi ^ 2 ≤ source.charge .plus keep.raw := by
    by_contra! h
    obtain ⟨⟨⟨ψ, hψ⟩⟩, _⟩ :=
      discard.reassemble_of_rawMass_lt keep source hDiscard hKeep replaceBack h
    exact hNonstandard ⟨⟨Φ.trans ψ, Diffeomorph.preservesOrientation_trans hΦ hψ⟩⟩
  obtain ⟨hKeepEq, hKeepInf⟩ := keep.rawMasses_of_positiveCaps source hKeep
  obtain ⟨hDiscardEq, _⟩ := discard.rawMasses_of_positiveCaps source hDiscard
  rw [← geometricPositiveEnergies_eq_of_diffeomorph Φ hΦ] at hKeepInf
  have hSplit := keep.fullMassPartition discard source hCover hOverlap .plus
  have hExcess : source.charge .plus discard.raw ≤
      source.energy .plus - sInf (geometricPositiveEnergies oM) := by
    linarith only [hSplit, hKeepInf .plus]
  refine ⟨hd, ?_, Φ, hΦ, hCore, hKeepImage, hDiscardImage⟩
  intro sign
  cases sign with
  | plus => exact ⟨hLarge, hSmall, hExcess⟩
  | minus => simpa only [← hKeepEq, ← hDiscardEq] using And.intro hLarge (And.intro hSmall hExcess)

/-- Both capped infima are bounded at the fixed source. On a nonstandard
source in the strict band one raw side crosses the actual finite recognition
test. The complementary marked side and both of its raw masses survive. -/
theorem fixedSourceRawSideMasses {A : Type*} [TopologicalSpace A]
    (left : FixedMarkedCutCore I M J X) (right : FixedMarkedCutCore I M IV V)
    (source : SignedCollarMetric oM)
    (hl : left.HasPositiveCaps source oX) (hr : right.HasPositiveCaps source oV)
    (keepLeft : ∀ (q : SignedCollarMetric oX) (r : SignedCollarMetric oV)
      (hq : 0 < classYamabeFour oX.dimension_eq q.metric)
      (hr : 0 < classYamabeFour oV.dimension_eq r.metric),
      MarkedSideReplacement (A := A) oM oS (left.toSide q hq) (right.toSide r hr))
    (keepRight : ∀ (r : SignedCollarMetric oV) (q : SignedCollarMetric oX)
      (hr : 0 < classYamabeFour oV.dimension_eq r.metric)
      (hq : 0 < classYamabeFour oX.dimension_eq q.metric),
      MarkedSideReplacement (A := A) oM oS (right.toSide r hr) (left.toSide q hq))
    (hCover : left.raw ∪ right.raw = univ)
    (hOverlap : AEDisjoint (riemannianVolumeMeasure I M source.metric) left.raw right.raw)
    (hBand : source.energy .plus < 2 * (4 * Real.pi ^ 2)) :
    (source.charge .plus left.raw = source.charge .minus left.raw ∧
      ∀ sign, sInf (geometricPositiveEnergies oX) ≤ source.charge sign left.raw) ∧
    (source.charge .plus right.raw = source.charge .minus right.raw ∧
      ∀ sign, sInf (geometricPositiveEnergies oV) ≤ source.charge sign right.raw) ∧
    ((¬ Nonempty {r : M ≃ₘ⟮I, 𝓡 4⟯ StandardFourSphere // r.preservesOrientation oM oS}) →
      left.Survives right source oX oV oS ∨ right.Survives left source oV oX oS) := by
  refine ⟨left.rawMasses_of_positiveCaps source hl, right.rawMasses_of_positiveCaps source hr, ?_⟩
  intro hNonstandard
  have hSplit := left.fullMassPartition right source hCover hOverlap .plus
  by_cases hLeft : source.charge .plus left.raw < 4 * Real.pi ^ 2
  · exact Or.inr (right.survives_of_rawMass_lt left source hr hl keepRight keepLeft
      ((union_comm _ _).trans hCover) hOverlap.symm hNonstandard hLeft)
  · have hRight : source.charge .plus right.raw < 4 * Real.pi ^ 2 := by
      linarith only [le_of_not_gt hLeft, hSplit, hBand]
    exact Or.inl (left.survives_of_rawMass_lt right source hl hr keepLeft keepRight
      hCover hOverlap hNonstandard hRight)

section OriginalDisk

local notation "E₄" => EuclideanSpace ℝ (Fin 4)

variable {H₄ N : Type*} [TopologicalSpace H₄] {I₄ : ModelWithCorners ℝ E₄ H₄} [I₄.Boundaryless]
  [TopologicalSpace N] [ChartedSpace H₄ N] [IsManifold I₄ ∞ N] [T2Space N] [CompactSpace N]
  [Nonempty N] {o : ManifoldOrientation I₄ N 4}

/-- On the already selected, fixed-type sequence, the charge of the original
disk eventually prohibits arbitrarily small complete exterior cap drift.
Each prohibited family would have supplied positive caps at that very index. -/
theorem eventually_no_smallDriftCaps_of_chargedOriginalDisk
    (source : ℕ → SignedCollarMetric o)
    (F : ℕ → PartialDiffeomorph 𝓘(ℝ, E₄) I₄ E₄ N ∞)
    (he : Tendsto (fun i => (source i).energy .plus) atTop (𝓝 (sInf (geometricPositiveEnergies o))))
    {a : ℝ} (ha : 0 < a) (sign : CollarChirality)
    (hCharged : ∀ᶠ i in atTop, Metric.closedBall (0 : E₄) 1 ⊆ (F i).source ∧
      a ≤ (source i).charge sign (selectedChartDisk (F i))) :
    ∀ᶠ i in atTop, ¬ (∀ ε > (0 : ℝ), ∃ cap : SignedCollarMetric o,
      0 < classYamabeFour o.dimension_eq cap.metric ∧
        ∀ s, |cap.energy s - (source i).charge s (interior (selectedChartDisk (F i)))ᶜ| < ε) := by
  have hLate := he.eventually (gt_mem_nhds (lt_add_of_pos_right (sInf (geometricPositiveEnergies o)) ha))
  filter_upwards [hCharged, hLate] with i hCharge hEnergy
  intro hCaps
  have hBound :=
    (original_markedDisk_charge_eq_and_le_excess_of_arbitrarily_small_cap_drift
      (source i) (F i) hCharge.1 hCaps).2 sign
  linarith only [hBound, hCharge.2, hEnergy]

end OriginalDisk

end SmoothPoincare
