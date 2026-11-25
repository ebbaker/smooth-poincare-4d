import SmoothPoincare

/-! # Edition 03 public global geometry and endpoint replays

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex
assistance. The replay checks the public umbrella import. The examples fix
the measures, widths, maps, energies and conclusions used in the handoff.
-/

open DifferentialGeometry DifferentialGeometry.Geometry.Curvature
open DifferentialGeometry.Integral.Measure DifferentialGeometry.Topology.Morse
open Filter FirstOrderTwistor MeasureTheory SectionsAndConnections Set SmoothPoincare
open scoped BigOperators ContDiff ENNReal Manifold Topology

noncomputable section

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "E₅" => EuclideanSpace ℝ (Fin 5)
local instance : Fact (Module.finrank ℝ E₅ = 4 + 1) := ⟨by simp⟩

/-! ## Physical shells and moving curvature slots -/

#check @physicalRadialVolume_real_Ioo
#print axioms physicalRadialVolume_real_Ioo
#check @physicalRadialVolume_eq_map_scaleMetric
#print axioms physicalRadialVolume_eq_map_scaleMetric
#check @physicalAnchor_and_anchoredBand_fullCurvature_le_of_radialApproximation
#print axioms physicalAnchor_and_anchoredBand_fullCurvature_le_of_radialApproximation
#check @physicalAnchor_and_anchoredBuffer_fullCurvature_tendsto_zero
#print axioms physicalAnchor_and_anchoredBuffer_fullCurvature_tendsto_zero
#check @shiftedPhysicalEuclideanShellVolume_strict_decrease
#print axioms shiftedPhysicalEuclideanShellVolume_strict_decrease
#check @exists_orientedMovingFrame
#print axioms exists_orientedMovingFrame
#check @movingCurvatureSlots_tensor
#print axioms movingCurvatureSlots_tensor
#check @continuous_chartGramDensity
#print axioms continuous_chartGramDensity
#check @tendstoUniformlyOn_movingChiralProjector
#print axioms tendstoUniformlyOn_movingChiralProjector

/-! ## Modified Yamabe charge and selected disks -/

#check @modifiedYamabe_variance_le
#print axioms modifiedYamabe_variance_le
#check @modifiedYamabe_square_density_L1
#print axioms modifiedYamabe_square_density_L1
#check @endpointPhysical_moment_limits
#print axioms endpointPhysical_moment_limits
#check @endpointPhysical_omitted_charges
#print axioms endpointPhysical_omitted_charges
#check @selectedDiskTrim_mass_tendsto_zero
#print axioms selectedDiskTrim_mass_tendsto_zero
#check @exists_selectedDiskWidths_small_chiral_sum
#print axioms exists_selectedDiskWidths_small_chiral_sum
#check @endpointAllowance_on_selectedChartDisks
#print axioms endpointAllowance_on_selectedChartDisks
#check @modifiedYamabe_retained_square_ge
#print axioms modifiedYamabe_retained_square_ge
#check @bandPhysical_yamabeEuler_sandwich
#print axioms bandPhysical_yamabeEuler_sandwich
#check @bandPhysical_omitted_charges
#print axioms bandPhysical_omitted_charges

section Endpoint

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H}
  [I.Boundaryless] [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [T2Space M] [SigmaCompactSpace M] [CompactSpace M] [Nonempty M]

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

/-- One width is chosen at each index before testing the allowance. The actual
chart marks, full physical exterior, trim union and strict ceiling are fixed
in the conclusion. -/
example
    (o : ManifoldOrientation I M 4) (g : ℕ → SmoothRiemannianMetric I M)
    (frame : ∀ i x, OrientedOrthonormalFrameAt (g i) o x)
    (plus minus : ℕ → M → Fin 3 → ℝ)
    (h : ∀ i, EndpointPhysicalSpectralData o (g i) (frame i) (plus i) (minus i))
    (idx : ℕ → Finset ℕ) (F : ℕ → ℕ → PartialDiffeomorph 𝓘(ℝ, E₄) I E₄ M ∞)
    (hDisk : ∀ i j, j ∈ idx i → Metric.closedBall (0 : E₄) 1 ⊆ (F i j).source)
    (hApart : ∀ i, (idx i : Set ℕ).PairwiseDisjoint (fun j => (F i j).target))
    (μ : ℕ → Measure M) [∀ i, IsProbabilityMeasure (μ i)]
    (L : ℕ → M → ℝ) (c : ℕ → ℝ)
    (hL : ∀ i, MemLp (L i) 2 (μ i)) (hc : ∀ i, c i ≤ 0)
    (hTest : ∀ i, classYamabeFour o.dimension_eq (g i) ≤ c i + 6 * ∫ x, L i x ∂μ i)
    (hTrans : ∀ i (A : Set M), MeasurableSet A →
      (∫ x in A, endpointTopWeyl (plus i x) (minus i x) ^ 2 ∂riemannianVolumeMeasure I M (g i)) =
      ∫ x in A, L i x ^ 2 ∂μ i) :
    let T := 4 * Real.pi ^ 2
    let e := fun i => chiralFrameEnergy (g i) (fun x => geometricChiralBlock (g i) o x (frame i x))
    let χ := fun i => geometricChiralMeasure o (g i) (frame i)
    let S := fun i => (⋃ j ∈ idx i, selectedChartDisk (F i j))ᶜ
    let r := fun i => (χ i).real (S i)
    sInf (geometricPositiveEnergies o) = T → Tendsto e atTop (𝓝 T) →
    Tendsto (fun i => (μ i).real (S i)) atTop (𝓝 0) →
    ∃ k : ℕ → ℕ,
      (∀ i, i ≤ k i) ∧ Tendsto r atTop (𝓝 0) ∧
      Tendsto (fun i => ∑ j ∈ idx i, (χ i).real (selectedDiskTrim (F i j) (k i))) atTop (𝓝 0) ∧
      ∀ η : ℕ → ℝ, (∀ i, 0 ≤ η i) →
        (∀ᶠ i in atTop, let s := (χ i).real (⋃ j ∈ idx i, selectedDiskTrim (F i j) (k i))
          e i + 2 * Real.sqrt s * η i + η i ^ 2 < 2 * T →
            ∃ cost ∈ geometricPositiveEnergies o, cost ≤ (Real.sqrt (r i) + η i) ^ 2) →
        ∀ δ > (0 : ℝ), ∀ᶠ i in atTop, 2 * Real.pi - δ < η i :=
  endpointAllowance_on_selectedChartDisks o g frame plus minus h idx F hDisk hApart μ L c
    hL hc hTest hTrans

/-- The probability-gauge estimate controls both physical charge integrals
on the complement of the actual retained set. -/
example
    (o : ManifoldOrientation I M 4) (g : SmoothRiemannianMetric I M)
    (frame : ∀ x, OrientedOrthonormalFrameAt g o x) (plus minus : M → Fin 3 → ℝ)
    (h : EndpointPhysicalSpectralData o g frame plus minus)
    {μ : Measure M} [IsProbabilityMeasure μ] {L : M → ℝ} {ell c d : ℝ}
    (hL : MemLp L 2 μ) (hell : 0 ≤ ell) (hMoment : ∫ x, L x ^ 2 ∂μ = ell ^ 2)
    (hc : c ≤ 0) (hTest : classYamabeFour o.dimension_eq g ≤ c + 6 * ∫ x, L x ∂μ)
    {U : Set M} (hU : MeasurableSet U) (hd : μ.real Uᶜ ≤ d)
    (hTransport : (∫ x in U, endpointTopWeyl (plus x) (minus x) ^ 2
      ∂riemannianVolumeMeasure I M g) = ∫ x in U, L x ^ 2 ∂μ) :
    let dV := riemannianVolumeMeasure I M g
    let P := fun x => hilbertSchmidtSq (geometricChiralBlock g o x (frame x))
    let N := fun x => hilbertSchmidtSq (endpointNegativeWeylBlock g o x (frame x))
    let e := chiralFrameEnergy g (fun x => geometricChiralBlock g o x (frame x))
    let Y := classYamabeFour o.dimension_eq g
    let B := 2 * e - (3 / 2 : ℝ) * (max (Y / 6 - ell * Real.sqrt d) 0) ^ 2
    (∫ x in Uᶜ, P x ∂dV) ≤ B ∧ (∫ x in Uᶜ, N x ∂dV) ≤ B :=
  bandPhysical_omitted_charges o g frame plus minus h hL hell hMoment hc hTest hU hd hTransport

end Endpoint

/-! ## Positive marked caps and their costs -/

#check @HasJoinedCapTests.yamabeFloor
#print axioms HasJoinedCapTests.yamabeFloor
#check @twoCapSigns_of_joinedTests
#print axioms twoCapSigns_of_joinedTests
#check @HasJoinedCapTests.markedSide
#print axioms HasJoinedCapTests.markedSide
#check @cappedEnergy_le_raw_add_halfCollarError
#print axioms cappedEnergy_le_raw_add_halfCollarError
#check @MarkedSideReplacement.reassembleOfRecognition
#print axioms MarkedSideReplacement.reassembleOfRecognition
#check @geometricDiscardedMass_le_excess_inclusive
#print axioms geometricDiscardedMass_le_excess_inclusive

section MarkedSide

variable {H K M X P : Type*} [TopologicalSpace H] [TopologicalSpace K]
  {I : ModelWithCorners ℝ E₄ H} {J : ModelWithCorners ℝ E₄ K}
  [I.Boundaryless] [J.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [T2Space M] [CompactSpace M] [Nonempty M]
  [TopologicalSpace X] [ChartedSpace K X] [IsManifold J ∞ X]
  [T2Space X] [CompactSpace X] [Nonempty X]

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

/-- The cap supplied to the transplant tests is the metric installed in the
side with the specified source set, core and cap marking. -/
example {joined : P → SmoothRiemannianMetric I M} {q : SmoothRiemannianMetric J X}
    (tests : HasJoinedCapTests joined q) (o : ManifoldOrientation I M 4)
    (oc : ManifoldOrientation J X 4) (frame : ∀ x, OrientedOrthonormalFrameAt q oc x)
    {b : ℝ} (hb : 0 < b) (hJoined : ∀ t, b ≤ classYamabeFour o.dimension_eq (joined t))
    (raw : Set M) (hm : MeasurableSet raw) (core : PartialDiffeomorph I J M X ∞)
    (marking : PartialDiffeomorph (𝓡 4) J StandardFourSphere X ∞)
    (hmark : standardFourSphereCap ⊆ marking.source) (hcore : raw ⊆ core.source)
    (hImage : core '' raw = (interior (marking '' standardFourSphereCap))ᶜ)
    (hi : Integrable (fun x => hilbertSchmidtSq (geometricChiralBlock q oc x (frame x)))
      (riemannianVolumeMeasure J X q)) :
    let side := tests.markedSide o oc frame hb hJoined raw hm core marking hmark hcore hImage hi
    side.metric = q ∧ side.raw = raw ∧ side.core = core ∧ side.marking = marking ∧
      0 < classYamabeFour oc.dimension_eq side.metric := by
  dsimp only
  exact ⟨rfl, rfl, rfl, rfl, hb.trans_le (tests.yamabeFloor o.dimension_eq oc.dimension_eq hb hJoined)⟩

end MarkedSide

/-! ## Oriented normal, principal frames and Gauss density -/

#check @orientedGaussVector_eq_of_basis
#print axioms orientedGaussVector_eq_of_basis
#check @orientedGaussVector_volume_pos
#print axioms orientedGaussVector_volume_pos
#check @orientedGaussNormal_smooth
#print axioms orientedGaussNormal_smooth
#check @orientedPrincipalFrameAt
#print axioms orientedPrincipalFrameAt
#check @ImmersionGaussNormal.principalFrameAt_normal
#print axioms ImmersionGaussNormal.principalFrameAt_normal
#check @orientedPrincipalFrameAt_middle_order
#print axioms orientedPrincipalFrameAt_middle_order
#check @isOpen_middlePrincipalLocus
#print axioms isOpen_middlePrincipalLocus
#check @gaussFrameJacobian
#print axioms gaussFrameJacobian
#check @gaussParamDensity_eq_mul_frameJacobian
#print axioms gaussParamDensity_eq_mul_frameJacobian
#check @gaussFrameJacobian_eq_ambient
#print axioms gaussFrameJacobian_eq_ambient
#check @gaussMFDeriv_isInvertible_iff_frameJacobian_ne_zero
#print axioms gaussMFDeriv_isInvertible_iff_frameJacobian_ne_zero
#check @ImmersionGaussNormal.frameJacobian_eq_abs_prod
#print axioms ImmersionGaussNormal.frameJacobian_eq_abs_prod
#check @ImmersionGaussNormal.mfderiv_isInvertible_of_principal
#print axioms ImmersionGaussNormal.mfderiv_isInvertible_of_principal
#check @ImmersionGaussNormal.continuousOn_absPrincipalProduct
#print axioms ImmersionGaussNormal.continuousOn_absPrincipalProduct
#check @ImmersionGaussNormal.measuredSheets_of_principal
#print axioms ImmersionGaussNormal.measuredSheets_of_principal
#check @ImmersionGaussNormal.exists_measuredSheets_of_principal
#print axioms ImmersionGaussNormal.exists_measuredSheets_of_principal
#check @GaussSheetAtlas.transportTargetMeasurableSpace
#print axioms GaussSheetAtlas.transportTargetMeasurableSpace

/-! ## Exact round area, conull Morse heights and indexed mean -/

#check @gaussRoundArea_apply
#print axioms gaussRoundArea_apply
#check @gaussRoundArea_borel
#print axioms gaussRoundArea_borel
#check @gaussRoundArea_eq_gaussConeArea
#print axioms gaussRoundArea_eq_gaussConeArea
#check @gaussRoundArea_univ
#print axioms gaussRoundArea_univ
#check @gaussRoundArea_antipodal
#print axioms gaussRoundArea_antipodal
#check @riemannianVolumeMeasure_criticalValues_eq_zero
#print axioms riemannianVolumeMeasure_criticalValues_eq_zero
#check @ImmersionGaussNormal.roundArea_criticalValues_eq_zero
#print axioms ImmersionGaussNormal.roundArea_criticalValues_eq_zero
#check @ImmersionGaussNormal.ae_invertible_mfderiv_on_two_normal_fibers
#print axioms ImmersionGaussNormal.ae_invertible_mfderiv_on_two_normal_fibers
#check @ImmersionGaussNormal.ae_nondegenerate_height
#print axioms ImmersionGaussNormal.ae_nondegenerate_height
#check @orientedHeight_ae_nondegenerate
#print axioms orientedHeight_ae_nondegenerate
#check @orientedGauss_absProduct_continuous_integrable
#print axioms orientedGauss_absProduct_continuous_integrable
#check @orientedMeanActualIndexTwo
#print axioms orientedMeanActualIndexTwo
#check @orientedImmersion_indexedGaussMean
#print axioms orientedImmersion_indexedGaussMean
#check @inducedEnergy_strict_of_orientedHeightFloor
#print axioms inducedEnergy_strict_of_orientedHeightFloor
#check @exists_morseHeight_le_one_of_inducedEnergy_le
#print axioms exists_morseHeight_le_one_of_inducedEnergy_le

/-- The Riemannian sheet measure is transported to native spherical area. -/
example {M : Type*} [MeasurableSpace M] {n : M → GaussDirection} {U : Set M}
    {vol : Measure M} {J : M → ℝ≥0∞}
    (A : @GaussSheetAtlas M GaussDirection _ (borel GaussDirection) n U vol
      (riemannianVolumeMeasure (𝓡 4) GaussDirection gaussRoundMetric) J) :
    GaussSheetAtlas n U vol gaussRoundArea J :=
  A.transportTargetMeasurableSpace (BorelSpace.measurable_eq (α := GaussDirection)).symm

example : gaussRoundArea (univ : Set GaussDirection) = ENNReal.ofReal (8 * Real.pi ^ 2 / 3) ∧
    MeasurePreserving (fun u : GaussDirection => -u) gaussRoundArea gaussRoundArea :=
  ⟨gaussRoundArea_univ, gaussRoundArea_antipodal⟩

section IndexedHeights

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H}
  [I.Boundaryless] [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  (g : SmoothRiemannianMetric I M) (F : IsometricHypersurface g)
  (o : ManifoldOrientation I M 4) (a : OrthonormalBasis (Fin 5) ℝ E₅)

local notation "μ₄" => normalizedGaussDirections gaussRoundArea (8 * Real.pi ^ 2 / 3)

/-- Nondegeneracy covers every critical point of the actual height on the
full source and uses ordinary normalized round area. -/
example [SecondCountableTopology M] :
    ∀ᵐ u : GaussDirection ∂μ₄,
      ContMDiff I 𝓘(ℝ, ℝ) ∞ (immersionHeight F (u : E₅)) ∧
      ∀ x : M, IsCriticalPointAt I (immersionHeight F (u : E₅)) x →
        IsNondegenerateCriticalPointAt I (immersionHeight F (u : E₅)) x :=
  orientedHeight_ae_nondegenerate F o a

variable [PolishSpace M] [Nonempty M] [CompactSpace M]

/-- The two-normal factor and spherical mass normalize the mean of actual
source-point cardinalities. The principal family comes from the fixed
immersion, and compactness supplies integrability. -/
example :
    let P := orientedPrincipalFrameAt F o a
    let m := fun u => (indexedHeightTwoPoints F u).ncard
    Measurable m ∧ (∀ᵐ u ∂μ₄, (indexedHeightTwoPoints F u).Finite) ∧
      IsProbabilityMeasure μ₄ ∧ Integrable (fun u => (m u : ℝ)) μ₄ ∧
      (∫ u, (m u : ℝ) ∂μ₄) =
        (2 / (8 * Real.pi ^ 2 / 3)) *
          ∫ x in {x : M | HasMiddlePrincipalSignature (P x).curvature},
            |∏ i, (P x).curvature i| ∂riemannianVolumeMeasure I M g :=
  orientedImmersion_indexedGaussMean g F o a

end IndexedHeights
