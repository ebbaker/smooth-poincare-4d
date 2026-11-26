import SmoothPoincare.Variational.ConformalChiralCharges
import SmoothPoincare.Variational.ConformalCoreReference

/-! # Exact transport of marked exterior divisions through a protected conformal core -/

open DifferentialGeometry DifferentialGeometry.Geometry.Curvature
open DifferentialGeometry.Integral.Measure DifferentialGeometry.Tensor0SBundle
open Filter FirstOrderTwistor Function MeasureTheory Set
open scoped ContDiff Manifold Topology

namespace SmoothPoincare

noncomputable section

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "I₄" => 𝓘(ℝ, E₄)

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H}
  [I.Boundaryless] [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [T2Space M] [BoundarylessManifold I M] [CompactSpace M] {o : ManifoldOrientation I M 4}

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩
private local instance : IsManifold I 1 M := IsManifold.of_le (by decide : (1 : WithTop ℕ∞) ≤ ∞)

omit [I.Boundaryless] [IsManifold I ∞ M] [T2Space M] [BoundarylessManifold I M]
  [CompactSpace M] in
private theorem conformalFactor_eventually_zero (u : M → ℝ) {x : M}
    (hx : x ∉ tsupport u) : ∀ᶠ y in 𝓝 x, u y = 0 := by
  filter_upwards [(isClosed_tsupport u).isOpen_compl.mem_nhds hx] with y hy
  exact notMem_support.mp fun h => hy (subset_closure h)

/-- Off the topological support, a conformal logarithm vanishes on a
neighborhood, so the metric and matched basis vectors agree as germs. -/
theorem SignedCollarMetric.conformal_metric_frame_eventually_eq (g : SignedCollarMetric o)
    (u : C^∞⟮I, M; ℝ⟯) {x : M} (hx : x ∉ tsupport (u : M → ℝ)) :
    ∀ᶠ y in 𝓝 x,
      (∀ v w : TangentSpace I y, (g.conformal u).metric.inner y v w = g.metric.inner y v w) ∧
        ∀ a : Fin 4, ((g.conformal u).frame y).basis a = (g.frame y).basis a := by
  filter_upwards [conformalFactor_eventually_zero u hx] with y hy
  constructor
  · intro v w
    change (conformalMetric g.metric u).inner y v w = _
    rw [conformalMetric_inner, hy, mul_zero, Real.exp_zero, one_mul]
  · intro a
    change (conformalOrientedFrameAt u (g.frame y)).basis a = _
    rw [conformalOrientedFrameAt_basis, hy, neg_zero, Real.exp_zero, one_smul]

/-- Away from the topological support of the conformal factor, the physical
full-curvature measures agree on every measurable subset. -/
theorem metricFullCurvatureMeasure_conformal_restrict_of_disjoint (g : SignedCollarMetric o)
    (u : C^∞⟮I, M; ℝ⟯) {A : Set M} (hA : MeasurableSet A)
    (hDisjoint : Disjoint A (tsupport (u : M → ℝ))) :
    (metricFullCurvatureMeasure (g.conformal u).metric o (g.conformal u).frame).restrict A =
      (metricFullCurvatureMeasure g.metric o g.frame).restrict A := by
  let h := g.conformal u
  have hZero (x : M) (hx : x ∈ A) : x ∉ tsupport (u : M → ℝ) := fun hSupport =>
    Set.disjoint_left.mp hDisjoint hx hSupport
  have hVol : (riemannianVolumeMeasure I M h.metric).restrict A =
      (riemannianVolumeMeasure I M g.metric).restrict A := by
    change (riemannianVolumeMeasure I M (conformalMetric g.metric u)).restrict A = _
    rw [riemannianVolumeMeasure_conformalMetric, restrict_withDensity hA]
    rw [withDensity_congr_ae (g := (1 : M → ENNReal)) ?_, withDensity_one]
    filter_upwards [ae_restrict_mem hA] with x hx
    simp [(conformalFactor_eventually_zero u (hZero x hx)).self_of_nhds]
  change (metricFullCurvatureMeasure h.metric o h.frame).restrict A = _
  simp only [metricFullCurvatureMeasure, energyMeasure, restrict_withDensity hA, hVol]
  apply withDensity_congr_ae
  filter_upwards [ae_restrict_mem hA] with x hx
  have hGerm := g.conformal_metric_frame_eventually_eq u (hZero x hx)
  have hRm := metricRm04At_eq_of_metric_eventuallyEq h.metric g.metric x (hGerm.mono fun _ h => h.1)
  have hBasis (a : Fin 4) : (h.frame x).basis a = (g.frame x).basis a := hGerm.self_of_nhds.2 a
  have hTensor : metricCurvatureFrameTensor h.metric o x (h.frame x) =
      metricCurvatureFrameTensor g.metric o x (g.frame x) := by
    funext a b c d
    change metricRm04StandardAt h.metric x ((h.frame x).basis a) ((h.frame x).basis b)
        ((h.frame x).basis d) ((h.frame x).basis c) =
      metricRm04StandardAt g.metric x ((g.frame x).basis a) ((g.frame x).basis b)
        ((g.frame x).basis d) ((g.frame x).basis c)
    simp only [metricRm04StandardAt_apply, hBasis, hRm]
  simp only [hTensor]

/-- On both complete closed exteriors the full-curvature measures of the
conformal metric and of the source have equal restrictions. -/
theorem metricFullCurvatureMeasure_conformal_restrict_closedExteriors (g : SignedCollarMetric o)
    (u : C^∞⟮I, M; ℝ⟯) (marks : NestedBalancedDisks I M)
    (hSupp : tsupport (u : M → ℝ) ⊆ interior (selectedChartDisk marks.core)) :
    let ν := metricFullCurvatureMeasure g.metric o g.frame
    let ν' := metricFullCurvatureMeasure (g.conformal u).metric o (g.conformal u).frame
    ν'.restrict (interior (selectedChartDisk marks.core))ᶜ =
        ν.restrict (interior (selectedChartDisk marks.core))ᶜ ∧
      ν'.restrict (interior (selectedChartDisk marks.outer))ᶜ =
        ν.restrict (interior (selectedChartDisk marks.outer))ᶜ := by
  have hInside : interior (selectedChartDisk marks.core) ⊆
      interior (selectedChartDisk marks.outer) := by
    rw [interior_selectedChartDisk marks.outer marks.outer_source]
    exact interior_subset.trans marks.core_inside
  exact ⟨metricFullCurvatureMeasure_conformal_restrict_of_disjoint g u
    isOpen_interior.measurableSet.compl
    (Set.disjoint_left.mpr fun _ hx hu => hx (hSupp hu)),
    metricFullCurvatureMeasure_conformal_restrict_of_disjoint g u
      isOpen_interior.measurableSet.compl
      (Set.disjoint_left.mpr fun _ hx hu => hx (hInside (hSupp hu)))⟩

/-- Conformal variation supported inside the original protected disk
preserves all four division inequalities on the same marked disks. -/
theorem BalancedPhysicalExteriorDivision.conformal_of_support (g : SignedCollarMetric o)
    (plus minus : M → Fin 3 → ℝ) (Q : PartialDiffeomorph I₄ I E₄ M ∞)
    (marks : NestedBalancedDisks I M) (k : ℕ) (ε : ℝ)
    (div : BalancedPhysicalExteriorDivision g (balancedPhysicalSpectralMeasure g plus minus)
      (metricFullCurvatureMeasure g.metric o g.frame) Q marks k ε)
    (u : C^∞⟮I, M; ℝ⟯) (hSupp : tsupport (u : M → ℝ) ⊆ interior (selectedChartDisk Q)) :
    BalancedPhysicalExteriorDivision (g.conformal u)
      (balancedPhysicalSpectralMeasure (g.conformal u)
        (fun x => Real.exp (-2 * u x) • plus x) (fun x => Real.exp (-2 * u x) • minus x))
      (metricFullCurvatureMeasure (g.conformal u).metric o (g.conformal u).frame) Q marks k ε := by
  have hSuppCore : tsupport (u : M → ℝ) ⊆ interior (selectedChartDisk marks.core) := by
    rwa [div.core_eq]
  obtain ⟨hCore, hOuter⟩ :=
    metricFullCurvatureMeasure_conformal_restrict_closedExteriors g u marks hSuppCore
  refine ⟨div.core_eq, fun sign => ?_, ?_, ?_⟩
  · simpa only [SignedCollarMetric.charge_conformal] using div.chiral sign
  · simpa only [balancedPhysicalSpectralMeasure_conformal] using div.spectral
  · have hRealCore := congrArg (fun μ : Measure M => μ.real univ) hCore
    have hRealOuter := congrArg (fun μ : Measure M => μ.real univ) hOuter
    simp only [measureReal_restrict_apply_univ, div.core_eq] at hRealCore hRealOuter
    rw [hRealCore, hRealOuter]
    exact div.full_curvature

variable [ConnectedSpace M]

/-- The prescribed protected outer trim and both closed exteriors persist at
every amplitude of a positive conformal family with a genuinely curved,
arbitrarily small nonzero endpoint inside the original disk. -/
theorem exists_protectedPositiveConformalDivision (g : SignedCollarMetric o)
    (plus minus : M → Fin 3 → ℝ) (Q : PartialDiffeomorph I₄ I E₄ M ∞)
    (marks : NestedBalancedDisks I M) (k n : ℕ) (ε : ℝ)
    (div : BalancedPhysicalExteriorDivision g (balancedPhysicalSpectralMeasure g plus minus)
      (metricFullCurvatureMeasure g.metric o g.frame) Q marks k ε)
    (hTrim : Disjoint (selectedChartDisk Q) (selectedDiskTrim marks.outer n))
    (hPos : 0 < classYamabeFour o.dimension_eq g.metric) {η : ℝ} (hη : 0 < η) :
    ∃ (u : C^∞⟮I, M; ℝ⟯) (x : M) (t : ℝ),
      let path := fun s : ℝ => g.conformal (s • u)
      t ≠ 0 ∧ |t| ≤ η ∧ (path t).metric ≠ g.metric ∧
      tsupport (u : M → ℝ) ⊆ interior (selectedChartDisk Q) ∧
      x ∈ interior (selectedChartDisk Q) ∧ metricScalarAt (path t).metric x ≠ 0 ∧
      metricRm04At (path t).metric x ≠ 0 ∧
      ∀ s : ℝ, 0 < classYamabeFour o.dimension_eq (path s).metric ∧
        BalancedPhysicalExteriorDivision (path s)
          (balancedPhysicalSpectralMeasure (path s)
            (fun y => Real.exp (-2 * (s • u) y) • plus y)
            (fun y => Real.exp (-2 * (s • u) y) • minus y))
          (metricFullCurvatureMeasure (path s).metric o (path s).frame) Q marks k ε ∧
        (metricFullCurvatureMeasure (path s).metric o (path s).frame).restrict
            (selectedDiskTrim marks.outer n) =
          (metricFullCurvatureMeasure g.metric o g.frame).restrict (selectedDiskTrim marks.outer n) ∧
        (path s).energy .plus = g.energy .plus := by
  have hCore : Metric.closedBall (0 : E₄) 1 ⊆ Q.source := div.core_eq ▸ marks.core_source
  obtain ⟨m, hm, hmPos⟩ := ((eventually_selectedChartDisk_buffer Q hCore).and
    (eventually_gt_atTop (0 : ℕ))).exists
  obtain ⟨u, x, t, _, ht, htη, hNe, _, hu, hx, hSc, hRm, hPositive, _⟩ :=
    exists_selectedPositiveConformalCoreReference g.metric Q m hmPos hm o.dimension_eq hPos hη
  have hInterior : Q '' Metric.ball (0 : E₄) (1 - 1 / ((m : ℝ) + 1)) ⊆
      interior (selectedChartDisk Q) := by
    rw [interior_selectedChartDisk Q hCore]
    exact image_mono (Metric.ball_subset_ball (sub_le_self _ (by positivity)))
  refine ⟨u, x, t, ht, htη, hNe, hu.trans hInterior, hInterior hx, hSc, hRm, ?_⟩
  intro s
  have hScaled : tsupport ((s • u : C^∞⟮I, M; ℝ⟯) : M → ℝ) ⊆ interior (selectedChartDisk Q) :=
    (tsupport_smul_subset_right (fun _ : M => s) (u : M → ℝ)).trans (hu.trans hInterior)
  refine ⟨hPositive s, div.conformal_of_support g plus minus Q marks k ε (s • u) hScaled,
    metricFullCurvatureMeasure_conformal_restrict_of_disjoint g (s • u)
      (isOpen_selectedDiskTrim marks.outer n).measurableSet
      (hTrim.symm.mono_right (hScaled.trans interior_subset)),
    g.energy_conformal (s • u) .plus⟩

end

end SmoothPoincare
