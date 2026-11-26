import SmoothPoincare

/-! # Exact public types and kernel dependencies for the selected end filtrations and marked disks
Prepared for Edward B. Baker III, 25 November 2026 (America/New_York). -/

#check @SmoothPoincare.EndHandleFiltration
#print axioms SmoothPoincare.EndHandleFiltration
#check @SmoothPoincare.exists_orderedEndHandleFiltrations
#print axioms SmoothPoincare.exists_orderedEndHandleFiltrations
#check @SmoothPoincare.orderedCriticalPartition
#print axioms SmoothPoincare.orderedCriticalPartition
#check @SmoothPoincare.exists_selectedEndHandlePresentation_of_inducedEnergy_le
#print axioms SmoothPoincare.exists_selectedEndHandlePresentation_of_inducedEnergy_le
#check @SmoothPoincare.IsolatedZeroHandle.birthHomeomorph
#print axioms SmoothPoincare.IsolatedZeroHandle.birthHomeomorph
#check @SmoothPoincare.IsolatedOneHandle.attaching_radius_two_lt
#print axioms SmoothPoincare.IsolatedOneHandle.attaching_radius_two_lt
#check @SmoothPoincare.IsolatedOneHandle.attachingFeet_smooth
#print axioms SmoothPoincare.IsolatedOneHandle.attachingFeet_smooth
#check @SmoothPoincare.IsolatedOneHandle.attachingFeet_isClosedEmbedding
#print axioms SmoothPoincare.IsolatedOneHandle.attachingFeet_isClosedEmbedding
#check @SmoothPoincare.regularEndMarked_of_image_eq
#print axioms SmoothPoincare.regularEndMarked_of_image_eq
#check @SmoothPoincare.RegularEndMarked.exists_tubeTransport
#print axioms SmoothPoincare.RegularEndMarked.exists_tubeTransport
#check @SmoothPoincare.exists_regularBandEndMarked
#print axioms SmoothPoincare.exists_regularBandEndMarked
#check @SmoothPoincare.HasRegularLevelTransport.exists_nativeMarked
#print axioms SmoothPoincare.HasRegularLevelTransport.exists_nativeMarked
#check @SmoothPoincare.nativeOppositeLevelDiffeomorph
#print axioms SmoothPoincare.nativeOppositeLevelDiffeomorph
#check @SmoothPoincare.exists_leafBallHomeomorph
#print axioms SmoothPoincare.exists_leafBallHomeomorph
#check @SmoothPoincare.exists_roundLeafAdjunction
#print axioms SmoothPoincare.exists_roundLeafAdjunction
#check @SmoothPoincare.exists_leafBallTransport
#print axioms SmoothPoincare.exists_leafBallTransport
#check @SmoothPoincare.exists_bisecting_measured_subfamily
#print axioms SmoothPoincare.exists_bisecting_measured_subfamily
#check @SmoothPoincare.exists_four_measure_ball_division
#print axioms SmoothPoincare.exists_four_measure_ball_division
#check @SmoothPoincare.exists_fine_atlas_disk_packing
#print axioms SmoothPoincare.exists_fine_atlas_disk_packing
#check @SmoothPoincare.exists_four_measure_atlas_division
#print axioms SmoothPoincare.exists_four_measure_atlas_division
#check @SmoothPoincare.exists_bisecting_marked_disks
#print axioms SmoothPoincare.exists_bisecting_marked_disks
#check @SmoothPoincare.markedDisk_seam_null
#print axioms SmoothPoincare.markedDisk_seam_null
#check @SmoothPoincare.exists_marked_four_measure_half_of_separation
#print axioms SmoothPoincare.exists_marked_four_measure_half_of_separation
#check @SmoothPoincare.exists_finitePointRouting_into_opens
#print axioms SmoothPoincare.exists_finitePointRouting_into_opens
#check @SmoothPoincare.exists_diffeomorph_contracting_finiteMarkedDisks
#print axioms SmoothPoincare.exists_diffeomorph_contracting_finiteMarkedDisks
#check @SmoothPoincare.exists_finite_markedDisk_separator
#print axioms SmoothPoincare.exists_finite_markedDisk_separator
#check @SmoothPoincare.exists_nestedMarkedDisk_fourMeasure_dyadic
#print axioms SmoothPoincare.exists_nestedMarkedDisk_fourMeasure_dyadic
#check @SmoothPoincare.exists_bufferedNestedMarkedDisk_fourMeasure
#print axioms SmoothPoincare.exists_bufferedNestedMarkedDisk_fourMeasure
#check @SmoothPoincare.exists_balancedPhysicalExteriorDivision
#print axioms SmoothPoincare.exists_balancedPhysicalExteriorDivision
#check @SmoothPoincare.exists_balancedPhysicalSpectralExteriorDivision
#print axioms SmoothPoincare.exists_balancedPhysicalSpectralExteriorDivision
#check @SmoothPoincare.exists_eventually_balancedPhysicalExterior_below_threshold
#print axioms SmoothPoincare.exists_eventually_balancedPhysicalExterior_below_threshold
#check @SmoothPoincare.halfDivision_of_packing_trace
#print axioms SmoothPoincare.halfDivision_of_packing_trace
#check @SmoothPoincare.exists_iteratedMarkedDiskDivision
#print axioms SmoothPoincare.exists_iteratedMarkedDiskDivision
#check @SmoothPoincare.NestedBalancedDisks.eventually_trim_disjoint_core
#print axioms SmoothPoincare.NestedBalancedDisks.eventually_trim_disjoint_core
#check @SmoothPoincare.eventually_protectedFourMeasureTrim
#print axioms SmoothPoincare.eventually_protectedFourMeasureTrim
#check @SmoothPoincare.fourMeasureImbalance_continuous
#print axioms SmoothPoincare.fourMeasureImbalance_continuous
#check @SmoothPoincare.fourMeasureImbalance_odd
#print axioms SmoothPoincare.fourMeasureImbalance_odd
#check @SmoothPoincare.exists_fourMeasureBall_bisection
#print axioms SmoothPoincare.exists_fourMeasureBall_bisection
#check @SmoothPoincare.markedDiskPullback_absolutelyContinuous
#print axioms SmoothPoincare.markedDiskPullback_absolutelyContinuous
#check @SmoothPoincare.exists_markedDisk_affine_bisection
#print axioms SmoothPoincare.exists_markedDisk_affine_bisection
#check @SmoothPoincare.exists_markedDisk_finiteBall_division
#print axioms SmoothPoincare.exists_markedDisk_finiteBall_division
#check @SmoothPoincare.measuredCollarAllowance_sq_le
#print axioms SmoothPoincare.measuredCollarAllowance_sq_le
#check @SmoothPoincare.measuredCollarRowBudget_of_localAllowances
#print axioms SmoothPoincare.measuredCollarRowBudget_of_localAllowances
#check @SmoothPoincare.SignedCollarCandidateControls.ofCutoffCharges
#print axioms SmoothPoincare.SignedCollarCandidateControls.ofCutoffCharges
#check @SmoothPoincare.excludesStrictRepair_of_localMeasuredSelectedDiskCollars
#print axioms SmoothPoincare.excludesStrictRepair_of_localMeasuredSelectedDiskCollars
#check @SmoothPoincare.balancedEndpointEnergy_lower_of_localChange
#print axioms SmoothPoincare.balancedEndpointEnergy_lower_of_localChange
#check @SmoothPoincare.eventually_balancedEndpointEnergy_gt_wall_on_selectedTrim
#print axioms SmoothPoincare.eventually_balancedEndpointEnergy_gt_wall_on_selectedTrim
#check @SmoothPoincare.isPreconnected_compl_finset_four
#print axioms SmoothPoincare.isPreconnected_compl_finset_four
#check @SmoothPoincare.exists_finitePointRouting
#print axioms SmoothPoincare.exists_finitePointRouting
#check @SmoothPoincare.zeroHandle_attachingRegion_isEmpty
#print axioms SmoothPoincare.zeroHandle_attachingRegion_isEmpty
#check @SmoothPoincare.exists_isolatedZeroHandle
#print axioms SmoothPoincare.exists_isolatedZeroHandle
#check @SmoothPoincare.exists_isolatedOneHandle
#print axioms SmoothPoincare.exists_isolatedOneHandle
#check @SmoothPoincare.orientedImmersion_indexedGaussMean
#print axioms SmoothPoincare.orientedImmersion_indexedGaussMean
#check @SmoothPoincare.orientedHeight_ae_nondegenerate
#print axioms SmoothPoincare.orientedHeight_ae_nondegenerate
#check @SmoothPoincare.exists_morseHeight_le_one_of_inducedEnergy_le
#print axioms SmoothPoincare.exists_morseHeight_le_one_of_inducedEnergy_le
#check @SmoothPoincare.balancedMarkedDisk_saving_gt
#print axioms SmoothPoincare.balancedMarkedDisk_saving_gt

open SmoothPoincare
example : (1 : ℝ) ^ 2 ≤ (12 * (1 : ℝ) ^ 2) * (1 ^ 2 * (1 ^ 2 + 0 ^ 2) + 0 * (1 + 0) + 0 ^ 2) := by
  apply measuredCollarAllowance_sq_le (a := 1) <;> norm_num [measuredCollarLocalAllowance]

#check SmoothPoincare.exists_leafBallHomeomorph 3
#check SmoothPoincare.exists_roundLeafAdjunction 2

section FiniteSource

open DifferentialGeometry DifferentialGeometry.Integral.Measure MeasureTheory Set
open scoped ContDiff Manifold Topology
local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "I₄" => 𝓘(ℝ, E₄)
variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  [PreconnectedSpace M] [CompactSpace M]
private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

/-- At depth two the whole exterior carries one quarter of each original
exterior mass to arbitrary absolute tolerance on this actual marked source. -/
example (g : SmoothRiemannianMetric I M) (μ : Fin 4 → Measure M)
    [∀ j, IsFiniteMeasure (μ j)]
    (hac : ∀ j, μ j ≪ riemannianVolumeMeasure I M g)
    (Q : PartialDiffeomorph I₄ I E₄ M ∞) (hQ : Metric.closedBall (0 : E₄) 1 ⊆ Q.source)
    {ε : ℝ} (hε : 0 < ε) :
    ∃ m : NestedBalancedDisks I M, m.core = Q ∧ ∀ j,
      |(μ j).real (interior (selectedChartDisk m.outer))ᶜ -
        (1 / 4 : ℝ) * (μ j).real (interior (selectedChartDisk Q))ᶜ| < ε := by
  simpa only [show (2 : ℝ) ^ (2 : ℕ) = 4 by norm_num] using
    exists_nestedMarkedDisk_fourMeasure_dyadic g μ hac Q hQ 2 (by decide) hε

end FiniteSource
