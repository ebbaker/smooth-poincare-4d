import SmoothPoincare

/-! # Edition 03 public checks of the marked handle and disk constructions

25 November 2026. Prepared for Edward B. Baker III with OpenAI assistance.
These checks use the public import and the actual selected maps and measurements.
-/

open SmoothPoincare FirstOrderTwistor DifferentialGeometry DifferentialGeometry.Topology.Morse Filter Set
open scoped ContDiff ContinuousMap Manifold Topology BigOperators

noncomputable section

#check @SmoothPoincare.exists_orderedMorsePresentation
#print axioms SmoothPoincare.exists_orderedMorsePresentation
#check @SmoothPoincare.OrderedMorsePresentation.exists_middleIndexCuts
#print axioms SmoothPoincare.OrderedMorsePresentation.exists_middleIndexCuts
#check @SmoothPoincare.exists_orderedMiddleBand_of_inducedEnergy_le
#print axioms SmoothPoincare.exists_orderedMiddleBand_of_inducedEnergy_le
#check @SmoothPoincare.MiddleIndexCuts.regular_transport
#print axioms SmoothPoincare.MiddleIndexCuts.regular_transport
#check @SmoothPoincare.exists_isolatedMiddleAttachment
#print axioms SmoothPoincare.exists_isolatedMiddleAttachment
#check @SmoothPoincare.exists_selectedHandleReduction_of_inducedEnergy_le
#print axioms SmoothPoincare.exists_selectedHandleReduction_of_inducedEnergy_le
#check @SmoothPoincare.oddBalance_of_morse_on_homotopySphere
#print axioms SmoothPoincare.oddBalance_of_morse_on_homotopySphere
#check @SmoothPoincare.morseCriticalCount_congr
#print axioms SmoothPoincare.morseCriticalCount_congr
#check @SmoothPoincare.alternating_morseCriticalCounts_eq_two
#print axioms SmoothPoincare.alternating_morseCriticalCounts_eq_two
#check @SmoothPoincare.morseCriticalCount_reducedOddCases
#print axioms SmoothPoincare.morseCriticalCount_reducedOddCases
#check @SmoothPoincare.morseCriticalCount_neg
#print axioms SmoothPoincare.morseCriticalCount_neg
#check @SmoothPoincare.morseCriticalCount_zero_le_one_add_one_of_homologyZero
#print axioms SmoothPoincare.morseCriticalCount_zero_le_one_add_one_of_homologyZero
#check @SmoothPoincare.morseCriticalCount_four_le_three_add_one_of_dual_homologyZero
#print axioms SmoothPoincare.morseCriticalCount_four_le_three_add_one_of_dual_homologyZero
#check @SmoothPoincare.transportedMiddleTraceHomeomorph
#print axioms SmoothPoincare.transportedMiddleTraceHomeomorph
#check @SmoothPoincare.transportedMorsePresentationHomeomorph
#print axioms SmoothPoincare.transportedMorsePresentationHomeomorph
#check @SmoothPoincare.transportedOutgoingDiffeomorph
#print axioms SmoothPoincare.transportedOutgoingDiffeomorph
#check @SmoothPoincare.StandardSurgeryModel.pieces_agree_on_face
#print axioms SmoothPoincare.StandardSurgeryModel.pieces_agree_on_face
#check @SmoothPoincare.StandardSurgeryModel.leftRegion_union_rightRegion
#print axioms SmoothPoincare.StandardSurgeryModel.leftRegion_union_rightRegion
#check @SmoothPoincare.StandardSurgeryModel.leftRegion_inter_rightRegion
#print axioms SmoothPoincare.StandardSurgeryModel.leftRegion_inter_rightRegion
#check @SmoothPoincare.StandardSurgeryModel.seamChart
#print axioms SmoothPoincare.StandardSurgeryModel.seamChart
#check @SmoothPoincare.StandardSurgeryModel.seamChart_at_zero
#print axioms SmoothPoincare.StandardSurgeryModel.seamChart_at_zero
#check @SmoothPoincare.StandardSurgeryModel.seamChart_sides
#print axioms SmoothPoincare.StandardSurgeryModel.seamChart_sides
#check @SmoothPoincare.diffeomorphOfSmoothMarkedSeam
#print axioms SmoothPoincare.diffeomorphOfSmoothMarkedSeam
#check @SmoothPoincare.diffeomorphToS4OfSmoothMarkedSeam
#print axioms SmoothPoincare.diffeomorphToS4OfSmoothMarkedSeam
#check @SmoothPoincare.exists_selectedChartDisk_of_compact_subset
#print axioms SmoothPoincare.exists_selectedChartDisk_of_compact_subset
#check @SmoothPoincare.eventually_exists_selectedComparisonDisks
#print axioms SmoothPoincare.eventually_exists_selectedComparisonDisks
#check @SmoothPoincare.eventually_exists_markedBandCharge
#print axioms SmoothPoincare.eventually_exists_markedBandCharge
#check @SmoothPoincare.selectedDiskTrim_eq_full_image
#print axioms SmoothPoincare.selectedDiskTrim_eq_full_image
#check @SmoothPoincare.eventually_fullDiskTrims_small_both_charges
#print axioms SmoothPoincare.eventually_fullDiskTrims_small_both_charges
#check @SmoothPoincare.interior_selectedChartDisk
#print axioms SmoothPoincare.interior_selectedChartDisk
#check @SmoothPoincare.signedCharge_fullMarkedExterior
#print axioms SmoothPoincare.signedCharge_fullMarkedExterior
#check @SmoothPoincare.eventually_balancedMarkedExterior_below_threshold
#print axioms SmoothPoincare.eventually_balancedMarkedExterior_below_threshold
#check @SmoothPoincare.balancedMarkedDisk_saving_gt
#print axioms SmoothPoincare.balancedMarkedDisk_saving_gt
#check @SmoothPoincare.exists_dyadicDepth_for_recognitionGap
#print axioms SmoothPoincare.exists_dyadicDepth_for_recognitionGap
#check @SmoothPoincare.eventually_balancedMarkedDisk_saving_gt_gap
#print axioms SmoothPoincare.eventually_balancedMarkedDisk_saving_gt_gap
#check @SmoothPoincare.normSq_sub_le_signedJoinedCollarCost
#print axioms SmoothPoincare.normSq_sub_le_signedJoinedCollarCost
#check @SmoothPoincare.SignedCollarAssembly.Estimates.ofWeightedDensities
#print axioms SmoothPoincare.SignedCollarAssembly.Estimates.ofWeightedDensities
#check @SmoothPoincare.SignedCollarAssembly.joinedEnergy_le
#print axioms SmoothPoincare.SignedCollarAssembly.joinedEnergy_le
#check @SmoothPoincare.SignedCollarAssembly.outputEnergy_le
#print axioms SmoothPoincare.SignedCollarAssembly.outputEnergy_le
#check @SmoothPoincare.SignedCollarCapTestPath.outputYamabeFloor_of_ceiling_lt
#print axioms SmoothPoincare.SignedCollarCapTestPath.outputYamabeFloor_of_ceiling_lt
#check @SmoothPoincare.excludesStrictSelectedDiskSignedCollarRepair_of_capTests
#print axioms SmoothPoincare.excludesStrictSelectedDiskSignedCollarRepair_of_capTests
#check @SmoothPoincare.exists_measuredCollarChoice
#print axioms SmoothPoincare.exists_measuredCollarChoice
#check @SmoothPoincare.signedCollarCosts_le_measuredScore
#print axioms SmoothPoincare.signedCollarCosts_le_measuredScore
#check @SmoothPoincare.excludesStrictRepair_of_measuredCollarChoice
#print axioms SmoothPoincare.excludesStrictRepair_of_measuredCollarChoice
#check @SmoothPoincare.excludesStrictRepair_of_measuredSelectedDiskCollarChoice
#print axioms SmoothPoincare.excludesStrictRepair_of_measuredSelectedDiskCollarChoice
#check @SmoothPoincare.orderedEndpointSpectrum_hilbertSchmidt_bounds
#print axioms SmoothPoincare.orderedEndpointSpectrum_hilbertSchmidt_bounds
#check @SmoothPoincare.endpointPhysicalIsotropicGapBounds
#print axioms SmoothPoincare.endpointPhysicalIsotropicGapBounds
#check @SmoothPoincare.IsotropicGapBounds.quantity_sandwich
#print axioms SmoothPoincare.IsotropicGapBounds.quantity_sandwich
#check @SmoothPoincare.isotropicGap_smoothingEntry
#print axioms SmoothPoincare.isotropicGap_smoothingEntry
#check @SmoothPoincare.endpointPhysicalIsotropicGap_smoothingEntry
#print axioms SmoothPoincare.endpointPhysicalIsotropicGap_smoothingEntry
#check @SmoothPoincare.orientedImmersion_indexedGaussMean
#print axioms SmoothPoincare.orientedImmersion_indexedGaussMean
#check @SmoothPoincare.orientedHeight_ae_nondegenerate
#print axioms SmoothPoincare.orientedHeight_ae_nondegenerate
#check @SmoothPoincare.exists_morseHeight_le_one_of_inducedEnergy_le
#print axioms SmoothPoincare.exists_morseHeight_le_one_of_inducedEnergy_le
#check @SmoothPoincare.IsolatedMiddleAttachment.attachingTube_smooth
#print axioms SmoothPoincare.IsolatedMiddleAttachment.attachingTube_smooth
#check @SmoothPoincare.IsolatedMiddleAttachment.attachingTube_isClosedEmbedding
#print axioms SmoothPoincare.IsolatedMiddleAttachment.attachingTube_isClosedEmbedding
#check @SmoothPoincare.morseCriticalCount_oddBalance
#print axioms SmoothPoincare.morseCriticalCount_oddBalance
#check @SmoothPoincare.transportedAttachingTube
#print axioms SmoothPoincare.transportedAttachingTube
#check @SmoothPoincare.transportedOutgoingGluing
#print axioms SmoothPoincare.transportedOutgoingGluing
#check @SmoothPoincare.contMDiff_transportedAttachingTube
#print axioms SmoothPoincare.contMDiff_transportedAttachingTube
#check @SmoothPoincare.StandardSurgeryModel.contMDiff_leftPiece
#print axioms SmoothPoincare.StandardSurgeryModel.contMDiff_leftPiece
#check @SmoothPoincare.StandardSurgeryModel.contMDiff_rightPiece
#print axioms SmoothPoincare.StandardSurgeryModel.contMDiff_rightPiece
#check @SmoothPoincare.onePairRoundSphereToStandard
#print axioms SmoothPoincare.onePairRoundSphereToStandard
#check @SmoothPoincare.FixedBandComparisonWindows.HasMarking
#print axioms SmoothPoincare.FixedBandComparisonWindows.HasMarking
#check @SmoothPoincare.SignedCollarAssembly.exteriorIncrement_sub_eq_diskCharge_sub
#print axioms SmoothPoincare.SignedCollarAssembly.exteriorIncrement_sub_eq_diskCharge_sub
#check @SmoothPoincare.SignedCollarCapTestPath.gain_le_excess_of_ceiling_lt
#print axioms SmoothPoincare.SignedCollarCapTestPath.gain_le_excess_of_ceiling_lt

local notation "V₄" => EuclideanSpace ℝ (Fin 4)
local notation "V₅" => EuclideanSpace ℝ (Fin 5)
local instance : Fact (Module.finrank ℝ V₅ = 4 + 1) := ⟨by simp⟩

section Height

variable {H M : Type} [TopologicalSpace H] {I : ModelWithCorners ℝ V₄ H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [PolishSpace M]
  [Nonempty M] [CompactSpace M]

example (g : SmoothRiemannianMetric I M) (F : IsometricHypersurface g)
    (o : ManifoldOrientation I M 4) (A : OrthonormalBasis (Fin 5) ℝ V₅)
    (he : chiralFrameEnergy g (fun x => geometricChiralBlock g o x
      (orientedPrincipalFrameAt F o A x).frame) ≤ 64 * Real.pi ^ 2 / 9) :
    ∃ (u : GaussDirection) (h : M → ℝ) (a b : ℝ),
      OrderedMorsePresentation I (immersionHeight F (u : V₅)) h ∧
      {x | IsCriticalPointAt I h x ∧ h x ∈ Icc a b} = indexedHeightTwoPoints F u ∧
      (HasRegularLevelTransport I h a b ∨
        ∃ p, indexedHeightTwoPoints F u = {p} ∧ a < h p ∧ h p < b) := by
  obtain ⟨u, h, a, b, P, B, hband, hz | hone⟩ :=
    exists_selectedHandleReduction_of_inducedEnergy_le g F o A he
  · exact ⟨u, h, a, b, P, hband, Or.inl hz.2⟩
  · obtain ⟨p, hs, D, hsing, _, _⟩ := hone
    exact ⟨u, h, a, b, P, hband, Or.inr ⟨p, hsing, by linarith [D.lower_inside, D.ε_pos],
      by linarith [D.upper_inside, D.ε_pos]⟩⟩

example (e : M ≃ₕ GaussDirection) {f : M → ℝ} (hs : ContMDiff I 𝓘(ℝ, ℝ) ∞ f)
    (hm : ∀ x, IsCriticalPointAt I f x → IsNondegenerateCriticalPointAt I f x) :
    let n := morseCriticalCount I f
    ((n 1 : ℤ) - n 0 + 1) + ((n 3 : ℤ) - n 4 + 1) = n 2 :=
  oddBalance_of_morse_on_homotopySphere e hs hm

end Height

example : signedJoinedCollarCost 4 1 0 = 0 ∧ signedExteriorCollarCost 4 1 0 = -3 := by
  norm_num [signedJoinedCollarCost, signedExteriorCollarCost]

example {T e σ D Y : ℝ} (h : IsotropicGapBounds T e σ D Y) :
    9 * e / 2 ≤ 4 * e + 3 * σ ∧ 4 * e + 3 * σ ≤ 8 * e := by
  obtain ⟨h₁, h₂⟩ := h.quantity_sandwich
  unfold isotropicGapQuantity at h₁ h₂
  constructor <;> linarith

example :
    measuredCollarGamma ({0, 1} : Finset ℕ)
      (fun j => if j = 0 then ({0, 1} : Finset ℕ) else {2}) (fun _ => 4) = 12 := by
  norm_num [measuredCollarGamma, Finset.sum_insert]

example {T e σ D Y : ℝ} (h : IsotropicGapBounds T e σ D Y) (hΔ : 0 ≤ 36 * σ - Y ^ 2)
    (hP : 4 * e + 3 * σ = 8 * T) : D = 0 ∧ 36 * σ = Y ^ 2 := by
  have hb := h.balance
  simp only [isotropicGapQuantity, isotropicYamabeDeficit] at hb
  constructor <;> linarith [h.ricci_nonnegative]

section MarkedExterior

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ V₄ H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M] [CompactSpace M]
  [Nonempty M] {o : ManifoldOrientation I M 4}

example (g h cap : SignedCollarMetric o) (marks : NestedBalancedDisks I M)
    (division : ∀ s, g.charge s (interior (selectedChartDisk marks.outer))ᶜ =
      (1 / 2 : ℝ) * g.charge s (interior (selectedChartDisk marks.core))ᶜ)
    (ceiling : h.energy .plus < 2 * (4 * Real.pi ^ 2))
    (positive : 0 < classYamabeFour o.dimension_eq cap.metric)
    (matched : ∀ s, cap.energy s = h.charge s (interior (selectedChartDisk marks.outer))ᶜ) :
    ∀ s, g.energy .plus / 2 + g.charge s (selectedChartDisk marks.core) / 2 +
      sInf (geometricPositiveEnergies o) - 2 * (4 * Real.pi ^ 2) <
        g.charge s (selectedChartDisk marks.outer) - h.charge s (selectedChartDisk marks.outer) := by
  have proof := balancedMarkedDisk_saving_gt g h cap marks 1 (τ := 0) (δ := 0)
    (fun s => by rw [division s]; norm_num) ceiling positive
    (fun s => by rw [matched s, add_zero])
  intro s
  have hs := proof s
  norm_num at hs
  linarith

end MarkedExterior
