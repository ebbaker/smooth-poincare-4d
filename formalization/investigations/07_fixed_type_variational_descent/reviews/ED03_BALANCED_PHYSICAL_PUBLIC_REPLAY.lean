import SmoothPoincare.Variational.BalancedPhysicalDivision
import SmoothPoincare.Variational.BalancedCollarWall
import SmoothPoincare.Variational.SelectedPhysicalJetControl
import SmoothPoincare.Variational.ModifiedFrameDecomposition
import SmoothPoincare.Variational.PositiveCoreVariation
namespace PhysicalExactReplay

open DifferentialGeometry DifferentialGeometry.Integral.Measure Filter FirstOrderTwistor MeasureTheory
open SectionsAndConnections Set SmoothPoincare
open scoped ContDiff Manifold Topology

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "I₄" => 𝓘(ℝ, E₄)
local notation "T" => (4 * Real.pi ^ 2)

#check @exists_fine_atlas_disk_packing
#print axioms exists_fine_atlas_disk_packing
#check @exists_finite_markedDisk_separator
#print axioms exists_finite_markedDisk_separator
#check @exists_bufferedNestedMarkedDisk_fourMeasure
#print axioms exists_bufferedNestedMarkedDisk_fourMeasure
#check @exists_balancedPhysicalSpectralExteriorDivision_of_endpointData
#print axioms exists_balancedPhysicalSpectralExteriorDivision_of_endpointData
#check @exists_eventually_balancedPhysicalExterior_below_threshold
#print axioms exists_eventually_balancedPhysicalExterior_below_threshold
#check @eventually_protectedFourMeasureTrim
#print axioms eventually_protectedFourMeasureTrim
#check @balancedMarkedDisk_saving_gt
#print axioms balancedMarkedDisk_saving_gt
#check @eventually_balancedEndpointEnergy_gt_wall_on_selectedTrim
#print axioms eventually_balancedEndpointEnergy_gt_wall_on_selectedTrim

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M] [CompactSpace M]
  [PreconnectedSpace M] [Nonempty M] {o : ManifoldOrientation I M 4}

local instance : MeasurableSpace M := borel M
local instance : BorelSpace M := ⟨rfl⟩

-- Recover the no-change, half-depth, zero-error endpoint test from R05.
omit [PreconnectedSpace M] in
theorem exactNegativeWallAtHalfDepth
    (g h cap : SignedCollarMetric o) (m : NestedBalancedDisks I M)
    (hDiv : g.charge .minus (interior (selectedChartDisk m.outer))ᶜ ≤
      g.charge .minus (interior (selectedChartDisk m.core))ᶜ / 2)
    (hPos : 0 < classYamabeFour o.dimension_eq cap.metric)
    (hCap : cap.energy .minus ≤ h.charge .minus (interior (selectedChartDisk m.outer))ᶜ)
    (hFix : g.charge .minus (selectedChartDisk m.outer) = h.charge .minus (selectedChartDisk m.outer)) :
    sInf (geometricPositiveEnergies o) + g.energy .plus / 2 +
      g.charge .minus (selectedChartDisk m.core) / 2 ≤ h.energy .plus := by
  have hBound := balancedEndpointEnergy_lower_of_localChange g h cap m 1 .minus ∅
    MeasurableSet.empty (τ := 0) (δ := 0) (by simpa [div_eq_mul_inv, mul_comm] using hDiv)
    hPos (by simpa using hCap) (by simpa using hFix)
  norm_num [SignedCollarMetric.charge] at hBound ⊢
  linarith

#print axioms exactNegativeWallAtHalfDepth

-- Pick the disk, then a width with arbitrarily prescribed lower index. The
-- same input metric and frame determine all four measures. Keep the endpoint
-- and cap quantifiers after the selected width and retain the exact core term.
theorem exactPhysicalHalfAndProtectedWidth
    (g : SignedCollarMetric o) (plus minus : M → Fin 3 → ℝ)
    (hSpectrum : EndpointPhysicalSpectralData o g.metric g.frame plus minus)
    (hFull : Integrable (fun x => frameTensorNormSq (metricCurvatureFrameTensor g.metric o x (g.frame x)))
      (riemannianVolumeMeasure I M g.metric))
    (Q : PartialDiffeomorph I₄ I E₄ M ∞) (hQ : Metric.closedBall (0 : E₄) 1 ⊆ Q.source)
    (N : ℕ) {ε η : ℝ} (hε : 0 < ε) (hη : 0 < η) :
    let σ := balancedPhysicalSpectralMeasure g plus minus
    let ν := metricFullCurvatureMeasure g.metric o g.frame
    let μ : Fin 4 → Measure M := ![g.chiralMeasure .plus, g.chiralMeasure .minus, σ, ν]
    ∃ (m : NestedBalancedDisks I M) (n : ℕ) (χ : M → ℝ), N ≤ n ∧
      BalancedPhysicalExteriorDivision g σ ν Q m 1 ε ∧
      Metric.closedBall (0 : E₄) (1 + 1 / ((n : ℝ) + 1)) ⊆ m.outer.source ∧
      selectedDiskTrim m.outer n = m.outer '' {z : E₄ | |‖z‖ - 1| < 1 / ((n : ℝ) + 1)} ∧
      Disjoint (selectedChartDisk Q) (selectedDiskTrim m.outer n) ∧
      (∑ j, (μ j).real (selectedDiskTrim m.outer n)) < η ∧
      (∀ᵐ x ∂selectedTrimPullback m.outer n (riemannianVolumeMeasure I M g.metric),
        |‖x‖ - 1| < 1 / ((n : ℝ) + 1)) ∧
      ContMDiff I 𝓘(ℝ) ∞ χ ∧
      (∀ x ∈ m.outer.source, χ (m.outer x) = selectedRadialCutoff (1 / ((n : ℝ) + 1)) x) ∧
      (∀ y ∈ selectedChartDisk Q, χ y = 1) ∧
      (∀ y ∉ selectedChartDisk m.outer ∪ selectedDiskTrim m.outer n, χ y = 0) ∧
      ∀ (h cap : SignedCollarMetric o) (δ : ℝ),
        h.energy .plus < 2 * T →
        0 < classYamabeFour o.dimension_eq cap.metric →
        (∀ sign, cap.energy sign ≤ h.charge sign (interior (selectedChartDisk m.outer))ᶜ + δ) →
        ∀ sign,
          g.energy .plus / 2 + g.charge sign (selectedChartDisk Q) / 2 +
            sInf (geometricPositiveEnergies o) - 2 * T - ε - δ <
            g.charge sign (selectedChartDisk m.outer) - h.charge sign (selectedChartDisk m.outer) := by
  intro σ ν μ
  obtain ⟨m, hDivide⟩ := exists_balancedPhysicalSpectralExteriorDivision_of_endpointData g
    plus minus hSpectrum hFull Q hQ 1 (by decide) hε
  let : IsFiniteMeasure σ := isFiniteEnergyMeasure hSpectrum.top_integrable
  let : IsFiniteMeasure ν := isFiniteEnergyMeasure hFull
  let : ∀ j, IsFiniteMeasure (μ j) := by
    intro j
    fin_cases j
    · exact (inferInstance : IsFiniteMeasure (g.chiralMeasure .plus))
    · exact (inferInstance : IsFiniteMeasure (g.chiralMeasure .minus))
    · exact (inferInstance : IsFiniteMeasure σ)
    · exact (inferInstance : IsFiniteMeasure ν)
  have hAc : ∀ j, μ j ≪ riemannianVolumeMeasure I M g.metric := by
    intro j
    fin_cases j
    · exact (show g.chiralMeasure .plus ≪ _ from withDensity_absolutelyContinuous _ _)
    · exact (show g.chiralMeasure .minus ≪ _ from withDensity_absolutelyContinuous _ _)
    · exact (show σ ≪ _ from withDensity_absolutelyContinuous _ _)
    · exact (show ν ≪ _ from withDensity_absolutelyContinuous _ _)
  obtain ⟨n, hTrim, hn⟩ := ((eventually_protectedFourMeasureTrim g.metric μ hAc m hη).and
    (eventually_ge_atTop N)).exists
  obtain ⟨hSource, hImage, hDisjoint, hMass⟩ := hTrim
  obtain ⟨χ, hχ, _, hPull, hZero⟩ := exists_selectedMarkedRadialCutoff m.outer n hSource
  have hOne (y) (hy : y ∈ selectedChartDisk Q) : χ y = 1 := by
    rw [← hDivide.core_eq] at hy
    obtain ⟨x, hx, rfl⟩ := m.core_inside hy
    have hs : x ∈ m.outer.source := m.outer_source (Metric.ball_subset_closedBall hx)
    rw [hPull x hs]
    apply selectedRadialCutoff_eq_one (by positivity)
    have hr : ‖x‖ < 1 := by simpa [Metric.mem_ball, dist_zero_right] using hx
    have hFar : ¬ |‖x‖ - 1| < 1 / ((n : ℝ) + 1) := by
      intro hNear
      have hMem : m.outer x ∈ selectedDiskTrim m.outer n := by
        rw [hImage]
        exact ⟨x, hNear, rfl⟩
      exact Set.disjoint_left.mp hDisjoint hy hMem
    rw [abs_of_neg (sub_neg.mpr hr)] at hFar
    nlinarith only [(not_lt.mp hFar), mul_nonneg (norm_nonneg x) (sub_nonneg.mpr hr.le)]
  refine ⟨m, n, χ, hn, hDivide, hSource, hImage, hDivide.core_eq ▸ hDisjoint, hMass,
    ae_selectedTrimPullback m.outer n _, hχ, hPull, hOne, hZero, ?_⟩
  intro h cap δ hJoined hPos hMatch sign
  have hDiv : ∀ s,
      |g.charge s (interior (selectedChartDisk m.outer))ᶜ -
        (1 / (2 : ℝ) ^ 1) * g.charge s (interior (selectedChartDisk m.core))ᶜ| ≤ ε := by
    intro s
    rw [hDivide.core_eq]
    exact (hDivide.chiral s).le
  have hSaved := balancedMarkedDisk_saving_gt g h cap m 1 hDiv hJoined hPos hMatch sign
  rw [hDivide.core_eq] at hSaved
  norm_num at hSaved ⊢
  linarith only [hSaved]

#print axioms exactPhysicalHalfAndProtectedWidth

end PhysicalExactReplay
namespace JetExactReplay

open DifferentialGeometry DifferentialGeometry.Analysis DifferentialGeometry.Geometry.Operator
open DifferentialGeometry.Tensor.Coordinates
open Filter MeasureTheory Set SmoothPoincare
open scoped ContDiff Manifold RealInnerProductSpace Topology

local notation "E₄" => EuclideanSpace ℝ (Fin 4)

#check @fderiv_selectedRadialCutoff_apply
#print axioms fderiv_selectedRadialCutoff_apply
#check @exists_selectedRadialCutoff_radial_deriv
#print axioms exists_selectedRadialCutoff_radial_deriv
#check @fderiv_fderiv_selectedRadialCutoff_apply
#print axioms fderiv_fderiv_selectedRadialCutoff_apply
#check @exists_selectedRadialCutoff_partial_bounds
#print axioms exists_selectedRadialCutoff_partial_bounds
#check @selectedRadialSpliceSecondPartialError_memLp_and_le
#print axioms selectedRadialSpliceSecondPartialError_memLp_and_le
#check @exists_selectedMarkedRadialCutoff
#print axioms exists_selectedMarkedRadialCutoff
#check @ae_selectedTrimPullback
#print axioms ae_selectedTrimPullback
#check @exists_selectedRadialSpliceSecondPartialError_on_physicalTrim
#print axioms exists_selectedRadialSpliceSecondPartialError_on_physicalTrim
#check @exists_selectedMarkedMetricLift
#print axioms exists_selectedMarkedMetricLift
#check @selectedMarkedMetricLift_chartGram
#print axioms selectedMarkedMetricLift_chartGram
#check @contDiff_selectedMarkedMetricLift_chartGram
#print axioms contDiff_selectedMarkedMetricLift_chartGram

-- A tangential Hessian component is present even when the tangential
-- first derivative vanishes. Use the exact prescribed width value.
theorem exactTangentialHessianAtIndexedWidth (n : ℕ) (x u : E₄)
    (hx : ‖x‖ = 1) (hu : ‖u‖ = 1) (hxu : ⟪x, u⟫ = 0) :
    let w : ℝ := 1 / ((n : ℝ) + 1)
    fderiv ℝ (fun y => fderiv ℝ (selectedRadialCutoff w) y u) x u =
      -deriv Real.smoothTransition (1 / 2) / w := by
  intro w
  have hw : w ≠ 0 := by dsimp [w]; positivity
  have hParam : selectedRadialParameter w x = (1 / 2 : ℝ) := by
    unfold selectedRadialParameter
    rw [hx]
    field_simp [hw]
    ring
  rw [fderiv_fderiv_selectedRadialCutoff_apply, hParam, hxu, real_inner_self_eq_norm_sq, hu]
  ring

#print axioms exactTangentialHessianAtIndexedWidth

theorem exactIndexedRadialDerivativeGrows (n : ℕ) (u : E₄) (hu : ‖u‖ = 1) :
    let w : ℝ := 1 / ((n : ℝ) + 1)
    ∃ r ∈ Ioo (1 - w) (1 + w),
      deriv (fun s : ℝ => selectedRadialCutoff w (s • u)) r = -((n : ℝ) + 1) / 2 := by
  intro w
  have hw : 0 < w := by dsimp [w]; positivity
  have hw1 : w ≤ 1 := by
    dsimp [w]
    exact (div_le_one (by positivity)).2 (by linarith only [(show 0 ≤ (n : ℝ) from Nat.cast_nonneg n)])
  obtain ⟨r, hr, hDeriv⟩ := exists_selectedRadialCutoff_radial_deriv u hu hw hw1
  refine ⟨r, hr, hDeriv.trans ?_⟩
  dsimp [w]
  field_simp <;> ring

#print axioms exactIndexedRadialDerivativeGrows

local notation "I₄" => 𝓘(ℝ, E₄)

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M] [SigmaCompactSpace M]

omit [I.Boundaryless] [SigmaCompactSpace M] in
theorem exactPhysicalMarkedGramAtIndexedWidth (m : NestedBalancedDisks I M) (n : ℕ)
    (hBuffer : Metric.closedBall (0 : E₄) (1 + 1 / ((n : ℝ) + 1)) ⊆ m.outer.source)
    (g : SmoothRiemannianMetric I M) (α : E₄) (a c : Fin (Module.finrank ℝ E₄)) :
    ∃ (G : SmoothRiemannianMetric I₄ E₄) (V : TopologicalSpace.Opens E₄),
      Metric.closedBall (0 : E₄) (1 + 1 / ((n : ℝ) + 1)) ⊆ (V : Set E₄) ∧
      ∀ x ∈ V, chartGramOnE G α a c x = g.inner (m.outer x)
        (mfderiv I₄ I (m.outer : E₄ → M) x (chartModelBasis E₄ a))
        (mfderiv I₄ I (m.outer : E₄ → M) x (chartModelBasis E₄ c)) := by
  obtain ⟨G, V, hV, _, hLift⟩ := exists_selectedMarkedMetricLift m.outer n hBuffer g
  refine ⟨G, V, hV, fun x hx => ?_⟩
  rw [selectedMarkedMetricLift_chartGram]
  exact hLift x hx _ _

#print axioms exactPhysicalMarkedGramAtIndexedWidth

end JetExactReplay
namespace LeadExactReplay

open DifferentialGeometry DifferentialGeometry.Integral.Measure Filter FirstOrderTwistor
open MeasureTheory SectionsAndConnections Set SmoothPoincare
open scoped ContDiff Interval Manifold Topology

#check @modifiedEuler_timeWeight
#print axioms modifiedEuler_timeWeight
#check @modifiedEuler_transport_of_flux
#print axioms modifiedEuler_transport_of_flux
#check @modifiedTerminalRicci_lower_of_eulerTransport
#print axioms modifiedTerminalRicci_lower_of_eulerTransport
#check @metricFrameTensorNormSq_eq_chiral_ricci_scalar
#print axioms metricFrameTensorNormSq_eq_chiral_ricci_scalar
#check @modifiedCutoffMoments_full_eq
#print axioms modifiedCutoffMoments_full_eq
#check @modifiedTerminalRicci_lower_of_eulerTransport_of_measurableCharges
#print axioms modifiedTerminalRicci_lower_of_eulerTransport_of_measurableCharges
#check @coreVariation_taylor_upper
#print axioms coreVariation_taylor_upper
#check @signedCoreSaving_eq_energySaving
#print axioms signedCoreSaving_eq_energySaving
#check @positiveCoreVariation_bounds
#print axioms positiveCoreVariation_bounds
#check @exists_selectedDiskSideVariation
#print axioms exists_selectedDiskSideVariation

theorem exactModifiedWeightQuarter {τ : ℝ} (hτ : 0 < τ) :
    (∫ s in (0 : ℝ)..τ, τ ^ (2 * (1 / 4 : ℝ)) * s ^ (-(2 * (1 / 4 : ℝ)))) = 2 * τ := by
  rw [modifiedEuler_timeWeight hτ (by norm_num : (1 / 4 : ℝ) < 1 / 2)]
  ring

#print axioms exactModifiedWeightQuarter

local notation "E₄" => EuclideanSpace ℝ (Fin 4)

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M] [CompactSpace M]
  [Nonempty M] {o : ManifoldOrientation I M 4}

local instance : MeasurableSpace M := borel M
local instance : BorelSpace M := ⟨rfl⟩

theorem exactClampedNegativeTrimSaving (g h : SignedCollarMetric o) (m : NestedBalancedDisks I M)
    (n : ℕ) (hPos : 0 < classYamabeFour o.dimension_eq h.metric)
    (hFix : g.charge .minus (selectedDiskTrim m.outer n)ᶜ =
      h.charge .minus (selectedDiskTrim m.outer n)ᶜ) :
    g.charge .minus (selectedDiskTrim m.outer n) - h.charge .minus (selectedDiskTrim m.outer n) ≤
      g.energy .plus - sInf (geometricPositiveEnergies o) := by
  rw [signedCoreSaving_eq_energySaving g h (isOpen_selectedDiskTrim _ _).measurableSet .minus hFix]
  exact sub_le_sub_left (csInf_le (geometricPositiveEnergies_bddBelow o)
    (h.energy_mem_of_positive hPos)) _

#print axioms exactClampedNegativeTrimSaving

theorem exactPositiveEndpointPaysCompleteExterior (g h : SignedCollarMetric o)
    (m : NestedBalancedDisks I M) (hPos : 0 < classYamabeFour o.dimension_eq h.metric)
    (s : CollarChirality) :
    g.charge s (selectedChartDisk m.outer) - h.charge s (selectedChartDisk m.outer) -
      (g.energy .plus - sInf (geometricPositiveEnergies o)) ≤
      h.charge s (interior (selectedChartDisk m.outer))ᶜ -
        g.charge s (interior (selectedChartDisk m.outer))ᶜ := by
  rw [signedCharge_fullMarkedExterior g s _ m.outer_source, signedCharge_fullMarkedExterior h s _ m.outer_source]
  have hInf := csInf_le (geometricPositiveEnergies_bddBelow o) (h.energy_mem_of_positive hPos)
  linarith only [hInf]

#print axioms exactPositiveEndpointPaysCompleteExterior

theorem exactAttainedDiskSideAtIndexedWidth (m : NestedBalancedDisks I M) (n : ℕ)
    (g : ℝ → SignedCollarMetric o) {r D : ℝ} (hr : 0 < r)
    (hp : ∀ t ∈ ({r,-r} : Set ℝ), 0 < classYamabeFour o.dimension_eq (g t).metric) :
    let U := selectedChartDisk m.outer ∩ selectedDiskTrim m.outer n
    let f := fun t => (g t).energy .plus
    f 0 = sInf (geometricPositiveEnergies o) →
    (∀ t ∈ ({r,-r} : Set ℝ), ∀ s, (g 0).charge s Uᶜ = (g t).charge s Uᶜ) →
    ContDiff ℝ 4 f →
    (∀ t ∈ Icc (-r) r, |iteratedDeriv 2 f t| ≤ D) →
    (∀ t ∈ Icc (-r) r, |iteratedDeriv 4 f t| ≤ D) →
    ∃ t ∈ ({r,-r} : Set ℝ), 0 < classYamabeFour o.dimension_eq (g t).metric ∧ ∀ s,
      (g 0).charge s U - (g t).charge s U ≤ 0 := by
  intro U f hAttained hfix hf h₂ h₄
  obtain ⟨t, ht, hPos, hGain⟩ := exists_selectedDiskSideVariation m n g hr hp hfix hf h₂ h₄
  refine ⟨t, ht, hPos, fun s => ?_⟩
  have hUpper := (hGain s).2.trans (min_le_left _ _)
  change (g 0).charge s U - (g t).charge s U ≤ f 0 - sInf (geometricPositiveEnergies o) at hUpper
  rwa [hAttained, sub_self] at hUpper

#print axioms exactAttainedDiskSideAtIndexedWidth

omit [Nonempty M] in
theorem exactModifiedTerminalRicciFromCommonCutoffFlux
    (g₀ gτ : SmoothRiemannianMetric I M)
    (f₀ : ∀ x, OrientedOrthonormalFrameAt g₀ o x) (fτ : ∀ x, OrientedOrthonormalFrameAt gτ o x)
    (χ : M → ℝ) {A B : Set M} (hA : MeasurableSet A) (hB : MeasurableSet B)
    (hχ : ∀ x, χ x ∈ Icc (0 : ℝ) 1) (hOne : ∀ x ∈ A, χ x = 1)
    (hZero : ∀ x ∉ B, χ x = 0) {τ K L ε : ℝ} (hτ : 0 < τ) (hK : 0 ≤ K) (hL : 0 ≤ L)
    (a : ℝ → ℝ) (ha : MemLp a 2 (volume.restrict (Ioc 0 τ)))
    (hn : 0 ≤ᵐ[volume.restrict (Ioc 0 τ)] a)
    (hbudget : (∫ s in (0 : ℝ)..τ, (a s)^2) ≤ L^2) :
    let u := modifiedChargeDensity o g₀ f₀
    let v := modifiedChargeDensity o gτ fτ
    let μ := riemannianVolumeMeasure I M g₀
    let ν := riemannianVolumeMeasure I M gτ
    let m := fun c => ∫ x, χ x * u c x ∂μ
    let n := fun c => ∫ x, χ x * v c x ∂ν
    Integrable (u .full) μ → Integrable (fun x => χ x * u .full x) μ →
    Integrable (v .ricci) ν → Integrable (fun x => χ x * v .ricci x) ν →
    (∀ c, AEStronglyMeasurable (fun x => χ x * u c x) μ) →
    ε ^ 2 ≤ (∫ x in A, u .full x ∂μ) →
    |modifiedEulerMoment n - modifiedEulerMoment m| ≤
      K * ∫ s in (0 : ℝ)..τ, Real.sqrt (τ^(2*(1/4 : ℝ)) * s^(-(2*(1/4 : ℝ)))) * a s →
    ε ^ 2 / 2 - 4 * (m .plus + m .minus) - m .scalar / 6 -
      2 * (K * L) * Real.sqrt (2 * τ) ≤ ∫ x in B, v .ricci x ∂ν := by
  intro u v μ ν m n hu hwu hv hwv hMeas hCharge hFlux
  have hb : (1 / 4 : ℝ) < 1 / 2 := by norm_num
  have hTransport := modifiedEuler_transport_of_flux hτ hb hK hL a ha hn hbudget hFlux
  have hRicci := modifiedTerminalRicci_lower_of_eulerTransport_of_measurableCharges
    o g₀ gτ f₀ fτ χ hA hB hχ hOne hZero hτ hb hu hwu hv hwv hMeas hCharge hTransport
  rw [show τ / (1 - 2 * (1 / 4 : ℝ)) = 2 * τ by ring] at hRicci
  exact hRicci

#print axioms exactModifiedTerminalRicciFromCommonCutoffFlux

end LeadExactReplay
