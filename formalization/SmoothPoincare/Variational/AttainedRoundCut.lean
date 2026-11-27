import SmoothPoincare.Variational.MarkedCapSmoothing
import SmoothPoincare.IntrinsicEntry.WeightedBallRobin

/-! # Rigidity at an attained minimum from one marked round cut

The positive cap of lower raw energy is recognized at an actual smoothing
index. Its oriented reassembly identifies the other fixed capped carrier
with the original type. Taking the positive smooth metrics on that carrier
to the raw cost forces both discarded Weyl integrals to vanish.
-/

open DifferentialGeometry DifferentialGeometry.Integral.Measure
open Filter FirstOrderTwistor MeasureTheory SectionsAndConnections Set
open SmoothPoincare.IntrinsicEntry
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
  {oM : ManifoldOrientation I M 4} {oX : ManifoldOrientation J X 4}
  {oV : ManifoldOrientation IV V 4} {oS : ManifoldOrientation (𝓡 4) StandardFourSphere 4}
  {A : Type*} [TopologicalSpace A]
  {source : SignedCollarMetric oM}
  {left : MarkedCapGeometry I M J X} {right : MarkedCapGeometry I M IV V}
  {formL : C^∞⟮J, X; ℝ⟯ → ℝ} {formR : C^∞⟮IV, V; ℝ⟯ → ℝ}

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩
private local instance : MeasurableSpace X := borel X
private local instance : BorelSpace X := ⟨rfl⟩

private theorem attainedCap_discarded_zero
    (keep : MarkedCapSmoothing (oX := oX) source left formL)
    (discard : MarkedCapSmoothing (oX := oV) source right formR)
    (hKeep : ∀ᶠ n in atTop, 0 < classYamabeFour oX.dimension_eq (keep.smooth n).metric)
    (hDiscard : ∀ᶠ m in atTop, 0 < classYamabeFour oV.dimension_eq (discard.smooth m).metric)
    (hReassemble : ∀ n m hY₁ hY₂, MarkedSideReplacement (A := A) oM oS
      (left.toSide (keep.smooth n) hY₁) (right.toSide (discard.smooth m) hY₂))
    (hAttain : source.energy .plus = sInf (geometricPositiveEnergies oM))
    (hSplit : source.charge .plus left.raw + source.charge .plus right.raw = source.energy .plus)
    (hSmall : source.charge .plus right.raw < 4 * Real.pi ^ 2) :
    ∀ sign, source.charge sign right.raw = 0 := by
  obtain ⟨hLimitKeep, _⟩ := markedCap_energyLimit_of_firstJet keep
  obtain ⟨hLimitDiscard, hSigns⟩ := markedCap_energyLimit_of_firstJet discard
  obtain ⟨m, hmY, hmSmall⟩ :=
    (hDiscard.and ((hLimitDiscard .plus).eventually_lt_const hSmall)).exists
  have hLower : ∀ᶠ n in atTop,
      sInf (geometricPositiveEnergies oM) ≤ (keep.smooth n).energy .plus := by
    filter_upwards [hKeep] with n hnY
    obtain ⟨Φ, hΦ, _, _⟩ := (hReassemble n m hnY hmY).reassemble
      (by simpa only [MarkedCapGeometry.toSide_cappedEnergy] using hmSmall)
    exact csInf_le (geometricPositiveEnergies_bddBelow oM) (geometricEnergy_mem_of_pullback
      Φ hΦ (keep.smooth n).metric (keep.smooth n).frame hnY ((keep.smooth n).integrable .plus))
  have hLimit := ge_of_tendsto (hLimitKeep .plus) hLower
  have hZero : source.charge .plus right.raw = 0 := by
    have hNonneg : 0 ≤ source.charge .plus right.raw := measureReal_nonneg
    linarith only [hNonneg, hLimit, hAttain, hSplit]
  intro sign
  cases sign
  · exact hZero
  · exact hSigns.symm.trans hZero

/-- The full raw sides cover the source up to their shared null seam. One
actual positive cap has subthreshold energy. Applying the marked replacement
and taking the other cap to its limiting energy gives zero in both signs. -/
theorem attainedRoundCut_discarded_zero
    (capsL : MarkedCapSmoothing (oX := oX) source left formL)
    (capsR : MarkedCapSmoothing (oX := oV) source right formR)
    (hPosL : ∀ᶠ n in atTop, 0 < classYamabeFour oX.dimension_eq (capsL.smooth n).metric)
    (hPosR : ∀ᶠ n in atTop, 0 < classYamabeFour oV.dimension_eq (capsR.smooth n).metric)
    (keepL : ∀ n m hY₁ hY₂, MarkedSideReplacement (A := A) oM oS
      (left.toSide (capsL.smooth n) hY₁) (right.toSide (capsR.smooth m) hY₂))
    (keepR : ∀ m n hY₂ hY₁, MarkedSideReplacement (A := A) oM oS
      (right.toSide (capsR.smooth m) hY₂) (left.toSide (capsL.smooth n) hY₁))
    (hAttain : source.energy .plus = sInf (geometricPositiveEnergies oM))
    (hSubcritical : source.energy .plus < 2 * (4 * Real.pi ^ 2))
    (hCover : left.raw ∪ right.raw = univ)
    (hOverlap : AEDisjoint (riemannianVolumeMeasure I M source.metric) left.raw right.raw) :
    (∀ sign, source.charge sign left.raw = 0) ∨ (∀ sign, source.charge sign right.raw = 0) := by
  have hOverlap' : AEDisjoint (source.chiralMeasure .plus) left.raw right.raw :=
    hOverlap.of_absolutelyContinuous
      (show source.chiralMeasure .plus ≪ riemannianVolumeMeasure I M source.metric from
        withDensity_absolutelyContinuous _ _)
  have hSplit : source.charge .plus left.raw + source.charge .plus right.raw = source.energy .plus := by
    calc
      _ = source.charge .plus (left.raw ∪ right.raw) :=
        (measureReal_union₀ right.rawMeasurable.nullMeasurableSet hOverlap').symm
      _ = _ := by rw [hCover, source.charge_univ]
  rcases eitherSummandEnergyLtThreshold (hSplit.trans_lt hSubcritical) with hLeft | hRight
  · exact Or.inl (attainedCap_discarded_zero capsR capsL hPosR hPosL keepR hAttain
      ((add_comm _ _).trans hSplit) hLeft)
  · exact Or.inr (attainedCap_discarded_zero capsL capsR hPosL hPosR keepL hAttain hSplit hRight)

omit [I.Boundaryless] [Nonempty M] in
/-- On the interior of a complete side, a vanished chiral integral forces
its continuous squared Weyl density to vanish pointwise. -/
private theorem signedCharge_zero_on_interior (q : SignedCollarMetric oM) (sign : CollarChirality)
    {U : Set M} (hU : MeasurableSet U)
    (hCont : Continuous fun x => hilbertSchmidtSq (signedCollarWeylBlock oM q.metric q.frame sign x))
    (hCharge : q.charge sign U = 0) :
    ∀ x ∈ interior U, signedCollarWeylBlock oM q.metric q.frame sign x = 0 := by
  let μ := riemannianVolumeMeasure I M q.metric
  let W := signedCollarWeylBlock oM q.metric q.frame sign
  let d := fun x => hilbertSchmidtSq (W x)
  let : μ.IsOpenPosMeasure := riemannianVolumeMeasure_isOpenPosMeasure q.metric
  have hNonneg (x : M) : 0 ≤ d x := Finset.sum_nonneg fun _ _ => Finset.sum_nonneg fun _ _ => sq_nonneg _
  change (energyMeasure μ d).real U = 0 at hCharge
  rw [energyMeasure_real_apply hU (q.integrable sign).integrableOn
    (ae_of_all _ hNonneg)] at hCharge
  have hae := (integral_eq_zero_iff_of_nonneg hNonneg (q.integrable sign).integrableOn).mp hCharge
  have hPoint := Measure.eqOn_open_of_ae_eq (ae_restrict_of_ae_restrict_of_subset interior_subset hae)
    isOpen_interior hCont.continuousOn continuous_const.continuousOn
  intro x hx
  have hZero : d x = 0 := hPoint hx
  have hTerms := (Finset.sum_eq_zero_iff_of_nonneg (fun _ _ =>
    Finset.sum_nonneg fun _ _ => sq_nonneg _)).mp hZero
  ext i j
  have hi := (Finset.sum_eq_zero_iff_of_nonneg (fun _ _ => sq_nonneg _)).mp (hTerms i (Finset.mem_univ i))
  exact sq_eq_zero_iff.mp (hi j (Finset.mem_univ j))

/-- The rigidity conclusion from positive smoothing along both marked sides.
The variation, unique continuation and locally conformally flat recognition
are supplied on the same original oriented smooth type. -/
theorem standard_of_attained_roundCut_positiveCaps
    (capsL : MarkedCapSmoothing (oX := oX) source left formL)
    (capsR : MarkedCapSmoothing (oX := oV) source right formR)
    (hPosL : ∀ᶠ n in atTop, 0 < classYamabeFour oX.dimension_eq (capsL.smooth n).metric)
    (hPosR : ∀ᶠ n in atTop, 0 < classYamabeFour oV.dimension_eq (capsR.smooth n).metric)
    (keepL : ∀ n m hY₁ hY₂, MarkedSideReplacement (A := A) oM oS
      (left.toSide (capsL.smooth n) hY₁) (right.toSide (capsR.smooth m) hY₂))
    (keepR : ∀ m n hY₂ hY₁, MarkedSideReplacement (A := A) oM oS
      (right.toSide (capsR.smooth m) hY₂) (left.toSide (capsL.smooth n) hY₁))
    (hPositive : 0 < classYamabeFour oM.dimension_eq source.metric)
    (hAttain : source.energy .plus = sInf (geometricPositiveEnergies oM))
    (hSubcritical : source.energy .plus < 2 * (4 * Real.pi ^ 2))
    (hCover : left.raw ∪ right.raw = univ)
    (hOverlap : AEDisjoint (riemannianVolumeMeasure I M source.metric) left.raw right.raw)
    (hContinuous : ∀ sign, Continuous fun x =>
      hilbertSchmidtSq (signedCollarWeylBlock oM source.metric source.frame sign x))
    (BachFlat : SmoothRiemannianMetric I M → Prop)
    (hVariation : 0 < classYamabeFour oM.dimension_eq source.metric →
      source.energy .plus = sInf (geometricPositiveEnergies oM) → BachFlat source.metric)
    (hContinuation : BachFlat source.metric → ∀ U : Set M, IsOpen U → U.Nonempty →
      (∀ x ∈ U, ∀ sign, signedCollarWeylBlock oM source.metric source.frame sign x = 0) →
      (∀ x sign, signedCollarWeylBlock oM source.metric source.frame sign x = 0))
    (hRecognition : (∀ x sign, signedCollarWeylBlock oM source.metric source.frame sign x = 0) →
      Nonempty {Φ : M ≃ₘ⟮I, 𝓡 4⟯ StandardFourSphere // Φ.preservesOrientation oM oS}) :
    Nonempty {Φ : M ≃ₘ⟮I, 𝓡 4⟯ StandardFourSphere // Φ.preservesOrientation oM oS} := by
  have hBach := hVariation hPositive hAttain
  have hFinish {U : Set M} (hU : MeasurableSet U) (hNonempty : (interior U).Nonempty)
      (hZero : ∀ sign, source.charge sign U = 0) :=
    hRecognition (hContinuation hBach (interior U) isOpen_interior hNonempty fun x hx sign =>
      signedCharge_zero_on_interior source sign hU (hContinuous sign) (hZero sign) x hx)
  rcases attainedRoundCut_discarded_zero capsL capsR hPosL hPosR keepL keepR
      hAttain hSubcritical hCover hOverlap with hL | hR
  · exact hFinish left.rawMeasurable left.interior_nonempty hL
  · exact hFinish right.rawMeasurable right.interior_nonempty hR

section Robin

variable {Core Cap Boundary Test : Type*}
  [MeasurableSpace Core] [MeasurableSpace Cap] [MeasurableSpace Boundary]

/-- The smooth cap tests are restricted to the matched-ball form. The Gårding
comparison uses the same reference Sobolev norm that controls the smoothing
error. -/
structure RoundCapSmoothing (source : SignedCollarMetric oM)
    (G : MarkedCapGeometry I M J X) (D : MatchedBallRobinData Core Cap Boundary Test) where
  test : C^∞⟮J, X; ℝ⟯ → Test
  smoothing : MarkedCapSmoothing (oX := oX) source G (fun u => D.joinedForm (test u))
  testMass_pos : ∀ u, 0 < D.joinedMassSq (test u)
  garding : ∃ a > 0, ∃ b ≥ 0, ∀ u,
    a * smoothing.referenceH1Sq u ≤ D.joinedForm (test u) + b * D.joinedMassSq (test u)

omit [I.Boundaryless] [Nonempty M] in
/-- The strictly positive matched eigenvalue and the Gårding estimate give
coercivity on the actual smooth cap tests. -/
theorem RoundCapSmoothing.eventually_positive_of_eigenvalue
    {D : MatchedBallRobinData Core Cap Boundary Test}
    (R : RoundCapSmoothing (oX := oX) source left D)
    (hGround : D.HasGroundState)
    (hEigen : 0 < D.firstEigenvalue) :
    ∀ᶠ n in atTop, 0 < classYamabeFour oX.dimension_eq (R.smoothing.smooth n).metric := by
  obtain ⟨a, ha, b, hb, hGarding⟩ := R.garding
  let eig := D.firstEigenvalue
  have heig : 0 < eig := hEigen
  have hSum : 0 < eig + b := add_pos_of_pos_of_nonneg heig hb
  apply R.smoothing.eventually_positive
  refine ⟨eig * a / (eig + b), div_pos (mul_pos heig ha) hSum, ?_⟩
  intro u
  have hRayleigh : eig * D.joinedMassSq (R.test u) ≤ D.joinedForm (R.test u) :=
    D.firstEigenvalue_mul_mass_le_form hGround _ (R.testMass_pos u)
  have hComb := add_le_add (mul_le_mul_of_nonneg_left (hGarding u) heig.le)
    (mul_le_mul_of_nonneg_left hRayleigh hb)
  have hEstimate : (eig * a) * R.smoothing.referenceH1Sq u ≤
      D.joinedForm (R.test u) * (eig + b) := by
    nlinarith only [hComb]
  change (eig * a / (eig + b)) * R.smoothing.referenceH1Sq u ≤ D.joinedForm (R.test u)
  rw [div_mul_eq_mul_div]
  exact (div_le_iff₀ hSum).2 hEstimate

omit [I.Boundaryless] [Nonempty M] in
/-- The inclusive mean-curvature trace bound gives eventually positive smooth caps. -/
theorem RoundCapSmoothing.eventually_positive
    {D : MatchedBallRobinData Core Cap Boundary Test}
    (R : RoundCapSmoothing (oX := oX) source left D)
    (hGround : D.HasGroundState)
    (hTrace : negativeMeanL3 D.boundaryVolume D.outwardMean ≤ roundBallMeanThreshold) :
    ∀ᶠ n in atTop, 0 < classYamabeFour oX.dimension_eq (R.smoothing.smooth n).metric :=
  R.eventually_positive_of_eigenvalue hGround (matchedBall_robinPositive_of_traceBound D hGround hTrace)

variable {CoreR CapR TestR : Type*} [MeasurableSpace CoreR] [MeasurableSpace CapR]

/-- Recognition of the attained type from the inclusive signed trace bound
in a common representative. The geometric input identifies the two outward
normal conventions and their shared physical boundary measure. -/
theorem standard_of_attained_roundCut_traceBound
    (D₁ : MatchedBallRobinData Core Cap Boundary Test)
    (D₂ : MatchedBallRobinData CoreR CapR Boundary TestR)
    (R₁ : RoundCapSmoothing (oX := oX) source left D₁)
    (R₂ : RoundCapSmoothing (oX := oV) source right D₂)
    (hGround₁ : D₁.HasGroundState) (hGround₂ : D₂.HasGroundState)
    (hBoundary : D₂.boundaryVolume = D₁.boundaryVolume)
    (hOutward : D₂.outwardMean = -D₁.outwardMean)
    (hTrace : max (negativeMeanL3 D₁.boundaryVolume D₁.outwardMean)
      (negativeMeanL3 D₁.boundaryVolume (-D₁.outwardMean)) ≤ roundBallMeanThreshold)
    (keepL : ∀ n m hY₁ hY₂, MarkedSideReplacement (A := A) oM oS
      (left.toSide (R₁.smoothing.smooth n) hY₁) (right.toSide (R₂.smoothing.smooth m) hY₂))
    (keepR : ∀ m n hY₂ hY₁, MarkedSideReplacement (A := A) oM oS
      (right.toSide (R₂.smoothing.smooth m) hY₂) (left.toSide (R₁.smoothing.smooth n) hY₁))
    (hPositive : 0 < classYamabeFour oM.dimension_eq source.metric)
    (hAttain : source.energy .plus = sInf (geometricPositiveEnergies oM))
    (hSubcritical : source.energy .plus < 2 * (4 * Real.pi ^ 2))
    (hCover : left.raw ∪ right.raw = univ)
    (hOverlap : AEDisjoint (riemannianVolumeMeasure I M source.metric) left.raw right.raw)
    (hContinuous : ∀ sign, Continuous fun x =>
      hilbertSchmidtSq (signedCollarWeylBlock oM source.metric source.frame sign x))
    (BachFlat : SmoothRiemannianMetric I M → Prop)
    (hVariation : 0 < classYamabeFour oM.dimension_eq source.metric →
      source.energy .plus = sInf (geometricPositiveEnergies oM) → BachFlat source.metric)
    (hContinuation : BachFlat source.metric → ∀ U : Set M, IsOpen U → U.Nonempty →
      (∀ x ∈ U, ∀ sign, signedCollarWeylBlock oM source.metric source.frame sign x = 0) →
      (∀ x sign, signedCollarWeylBlock oM source.metric source.frame sign x = 0))
    (hRecognition : (∀ x sign, signedCollarWeylBlock oM source.metric source.frame sign x = 0) →
      Nonempty {Φ : M ≃ₘ⟮I, 𝓡 4⟯ StandardFourSphere // Φ.preservesOrientation oM oS}) :
    Nonempty {Φ : M ≃ₘ⟮I, 𝓡 4⟯ StandardFourSphere // Φ.preservesOrientation oM oS} := by
  have hTrace₂ : negativeMeanL3 D₂.boundaryVolume D₂.outwardMean ≤ roundBallMeanThreshold := by
    rw [hBoundary, hOutward]
    exact (max_le_iff.mp hTrace).2
  exact standard_of_attained_roundCut_positiveCaps R₁.smoothing R₂.smoothing
    (R₁.eventually_positive hGround₁ (max_le_iff.mp hTrace).1)
    (R₂.eventually_positive hGround₂ hTrace₂) keepL keepR hPositive hAttain hSubcritical
    hCover hOverlap hContinuous BachFlat hVariation hContinuation hRecognition

/-- Recognition using the weighted spectral comparison for both caps of the
supplied cut in its pinched representative. Each comparison uses the same
intrinsic boundary scalar and its own outward mean curvature. -/
theorem standard_of_attained_roundCut_weighted
    (D₁ : MatchedBallRobinData Core Cap Boundary Test)
    (D₂ : MatchedBallRobinData CoreR CapR Boundary TestR)
    (R₁ : RoundCapSmoothing (oX := oX) source left D₁)
    (R₂ : RoundCapSmoothing (oX := oV) source right D₂)
    (hGround₁ : D₁.HasGroundState) (hGround₂ : D₂.HasGroundState)
    (boundaryScalar : Boundary → ℝ)
    (gauss₁ : UmbilicBoundaryGauss D₁.outwardMean boundaryScalar)
    (gauss₂ : UmbilicBoundaryGauss D₂.outwardMean boundaryScalar)
    (spectra₁ : WeightedBallBoundarySpectrum D₁ boundaryScalar)
    (spectra₂ : WeightedBallBoundarySpectrum D₂ boundaryScalar)
    (keepL : ∀ n m hY₁ hY₂, MarkedSideReplacement (A := A) oM oS
      (left.toSide (R₁.smoothing.smooth n) hY₁) (right.toSide (R₂.smoothing.smooth m) hY₂))
    (keepR : ∀ m n hY₂ hY₁, MarkedSideReplacement (A := A) oM oS
      (right.toSide (R₂.smoothing.smooth m) hY₂) (left.toSide (R₁.smoothing.smooth n) hY₁))
    (hPositive : 0 < classYamabeFour oM.dimension_eq source.metric)
    (hAttain : source.energy .plus = sInf (geometricPositiveEnergies oM))
    (hSubcritical : source.energy .plus < 2 * (4 * Real.pi ^ 2))
    (hCover : left.raw ∪ right.raw = univ)
    (hOverlap : AEDisjoint (riemannianVolumeMeasure I M source.metric) left.raw right.raw)
    (hContinuous : ∀ sign, Continuous fun x =>
      hilbertSchmidtSq (signedCollarWeylBlock oM source.metric source.frame sign x))
    (BachFlat : SmoothRiemannianMetric I M → Prop)
    (hVariation : 0 < classYamabeFour oM.dimension_eq source.metric →
      source.energy .plus = sInf (geometricPositiveEnergies oM) → BachFlat source.metric)
    (hContinuation : BachFlat source.metric → ∀ U : Set M, IsOpen U → U.Nonempty →
      (∀ x ∈ U, ∀ sign, signedCollarWeylBlock oM source.metric source.frame sign x = 0) →
      (∀ x sign, signedCollarWeylBlock oM source.metric source.frame sign x = 0))
    (hRecognition : (∀ x sign, signedCollarWeylBlock oM source.metric source.frame sign x = 0) →
      Nonempty {Φ : M ≃ₘ⟮I, 𝓡 4⟯ StandardFourSphere // Φ.preservesOrientation oM oS}) :
    Nonempty {Φ : M ≃ₘ⟮I, 𝓡 4⟯ StandardFourSphere // Φ.preservesOrientation oM oS} := by
  have hEigen₁ := weightedMatchedBall_robinPositive_of_pinched_umbilic_cut
    D₁ boundaryScalar gauss₁ spectra₁ hGround₁
  have hEigen₂ := weightedMatchedBall_robinPositive_of_pinched_umbilic_cut
    D₂ boundaryScalar gauss₂ spectra₂ hGround₂
  exact standard_of_attained_roundCut_positiveCaps R₁.smoothing R₂.smoothing
    (R₁.eventually_positive_of_eigenvalue hGround₁ hEigen₁)
    (R₂.eventually_positive_of_eigenvalue hGround₂ hEigen₂) keepL keepR hPositive hAttain hSubcritical
    hCover hOverlap hContinuous BachFlat hVariation hContinuation hRecognition

end Robin

end SmoothPoincare
