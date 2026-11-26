import DifferentialGeometry.Analysis.Integration.Measure.NullImage
import SmoothPoincare.PhysicalScales.SelectedDiskCollars
import SmoothPoincare.Variational.FiniteBallDivision
import SmoothPoincare.Variational.FourMeasureBisection

/-! # Transport of physical measures through a marked four-ball chart -/

open DifferentialGeometry DifferentialGeometry.Integral.Measure
open MeasureTheory Set
open scoped ContDiff Manifold RealInnerProductSpace

namespace SmoothPoincare

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "I₄" => 𝓘(ℝ, E₄)
local notation "D₄" => Metric.closedBall (0 : E₄) 1
local notation "U₄" => Metric.ball (0 : E₄) 1

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H}
  [TopologicalSpace M] [ChartedSpace H M]

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

private noncomputable def markedDiskInverse (F : PartialDiffeomorph I₄ I E₄ M ∞) :
    M → E₄ := by
  classical
  exact F.target.piecewise F.symm (fun _ => 0)

private theorem measurable_markedDiskInverse (F : PartialDiffeomorph I₄ I E₄ M ∞) :
    Measurable (markedDiskInverse F) := by
  classical
  exact F.contMDiffOn_invFun.continuousOn.measurable_piecewise continuousOn_const
    F.open_target.measurableSet

/-- Pull the restriction to the marked disk back to its closed unit-ball
parameter set, and regard it as a measure on all of Euclidean four-space. -/
noncomputable def markedDiskPullback (F : PartialDiffeomorph I₄ I E₄ M ∞) (μ : Measure M) :
    Measure E₄ :=
  (μ.restrict (selectedChartDisk F)).map (markedDiskInverse F)

instance isFiniteMeasure_markedDiskPullback (F : PartialDiffeomorph I₄ I E₄ M ∞)
    (μ : Measure M) [IsFiniteMeasure μ] : IsFiniteMeasure (markedDiskPullback F μ) := by
  unfold markedDiskPullback
  infer_instance

/-- Coordinate masses agree exactly with their physical image masses after
intersecting the coordinate set with the closed unit ball. -/
theorem markedDiskPullback_apply (F : PartialDiffeomorph I₄ I E₄ M ∞)
    (hDisk : D₄ ⊆ F.source) (μ : Measure M) {s : Set E₄} (hs : MeasurableSet s) :
    markedDiskPullback F μ s = μ (F '' (s ∩ D₄)) := by
  classical
  let f := markedDiskInverse F
  have hf : Measurable f := measurable_markedDiskInverse F
  rw [markedDiskPullback, Measure.map_apply hf hs, Measure.restrict_apply (hf hs)]
  change μ (f ⁻¹' s ∩ F '' D₄) = μ (F '' (s ∩ D₄))
  congr 1
  have hInv (x : E₄) (hx : x ∈ D₄) : f (F x) = x := by
    change F.target.piecewise F.symm (fun _ => 0) (F x) = x
    rw [piecewise_eq_of_mem _ _ _ (F.map_source (hDisk hx))]
    exact F.left_inv (hDisk hx)
  ext y
  constructor
  · rintro ⟨hy, ⟨x, hx, rfl⟩⟩
    exact ⟨x, ⟨by simpa only [mem_preimage, hInv x hx] using hy, hx⟩, rfl⟩
  · rintro ⟨x, ⟨hxs, hx⟩, rfl⟩
    exact ⟨by simpa only [mem_preimage, hInv x hx] using hxs, ⟨x, hx, rfl⟩⟩

/-- An arbitrary measurable coordinate set contained in the closed ball
has exactly the mass of its chart image. -/
theorem markedDiskPullback_real_image (F : PartialDiffeomorph I₄ I E₄ M ∞)
    (hDisk : D₄ ⊆ F.source) (μ : Measure M) {s : Set E₄} (hs : MeasurableSet s)
    (hSub : s ⊆ D₄) : (markedDiskPullback F μ).real s = μ.real (F '' s) := by
  simp only [Measure.real_def, markedDiskPullback_apply F hDisk μ hs,
    inter_eq_left.mpr hSub]

/-- The total pullback mass is the mass of the entire marked disk. -/
theorem markedDiskPullback_real_univ (F : PartialDiffeomorph I₄ I E₄ M ∞)
    (hDisk : D₄ ⊆ F.source) (μ : Measure M) :
    (markedDiskPullback F μ).real univ = μ.real (selectedChartDisk F) := by
  simp only [Measure.real_def, markedDiskPullback_apply F hDisk μ MeasurableSet.univ,
    univ_inter, selectedChartDisk]

/-- The finite chart pushforward is supported on the closed unit ball. -/
theorem markedDiskPullback_restrict_closedBall (F : PartialDiffeomorph I₄ I E₄ M ∞)
    (hDisk : D₄ ⊆ F.source) (μ : Measure M) :
    (markedDiskPullback F μ).restrict D₄ = markedDiskPullback F μ := by
  apply Measure.restrict_eq_self_of_ae_mem
  rw [ae_iff]
  change (markedDiskPullback F μ) D₄ᶜ = 0
  rw [markedDiskPullback_apply F hDisk μ Metric.isClosed_closedBall.measurableSet.compl,
    compl_inter_self, image_empty, measure_empty]

private theorem modelHaar_null_of_volume_null {E : Type*}
    [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
    [MeasurableSpace E] [BorelSpace E] {s : Set E}
    (hNull : (volume : Measure E) s = 0) : modelHaar (E := E) s = 0 := by
  borelize E
  exact Measure.absolutelyContinuous_isAddHaarMeasure (modelHaar (E := E)) volume hNull

variable [I.Boundaryless] [IsManifold I ∞ M] [T2Space M] [SigmaCompactSpace M]

/-- A measure absolutely continuous with respect to smooth Riemannian
volume pulls back to a measure absolutely continuous with respect to
Euclidean volume. This includes arbitrary volume-null coordinate sets. -/
theorem markedDiskPullback_absolutelyContinuous
    (F : PartialDiffeomorph I₄ I E₄ M ∞) (hDisk : D₄ ⊆ F.source)
    (g : SmoothRiemannianMetric I M) (μ : Measure M)
    (hμ : μ ≪ riemannianVolumeMeasure I M g) :
    markedDiskPullback F μ ≪ volume := by
  intro s hs
  obtain ⟨t, hst, ht, htNull⟩ := exists_measurable_superset_of_null hs
  apply measure_mono_null hst
  rw [markedDiskPullback_apply F hDisk μ ht]
  apply hμ
  have hModelNull : modelHaar (E := E₄) (t ∩ D₄) = 0 :=
    modelHaar_null_of_volume_null (measure_mono_null inter_subset_left htNull)
  exact riemannianVolumeMeasure_image_eq_zero_of_mdifferentiableOn g
    ((F.mdifferentiableOn (by simp)).mono (inter_subset_right.trans hDisk)) hModelNull

/-- Every point of the coordinate pullback is null. -/
theorem markedDiskPullback_nullSingletonClass
    (F : PartialDiffeomorph I₄ I E₄ M ∞) (hDisk : D₄ ⊆ F.source)
    (g : SmoothRiemannianMetric I M) (μ : Measure M)
    (hμ : μ ≪ riemannianVolumeMeasure I M g) :
    NullSingletonClass (markedDiskPullback F μ) :=
  ⟨fun x => markedDiskPullback_absolutelyContinuous F hDisk g μ hμ (measure_singleton x)⟩

/-- The same affine cut bisects the four physical masses on one marked disk.
The separating set has zero mass for every component. -/
theorem exists_markedDisk_affine_bisection (hZero : FourDimensionalAntipodalZero)
    (F : PartialDiffeomorph I₄ I E₄ M ∞) (hDisk : D₄ ⊆ F.source)
    (g : SmoothRiemannianMetric I M) (μ : Fin 4 → Measure M)
    [∀ j, IsFiniteMeasure (μ j)] (hμ : ∀ j, μ j ≪ riemannianVolumeMeasure I M g) :
    ∃ (n : E₄) (c : ℝ), n ≠ 0 ∧
      (U₄ ∩ affineCutPositive n c).Nonempty ∧
      (U₄ ∩ affineCutNegative n c).Nonempty ∧
      ∀ j, (μ j).real (F '' (affineCutPositive n c ∩ D₄)) =
          (μ j).real (selectedChartDisk F) / 2 ∧
        (μ j).real (F '' (affineCutNegative n c ∩ D₄)) =
          (μ j).real (selectedChartDisk F) / 2 ∧
        μ j (F '' (affineCutPlane n c ∩ D₄)) = 0 := by
  let ν := fun j => markedDiskPullback F (μ j)
  have hν : ∀ j, ν j ≪ volume :=
    fun j => markedDiskPullback_absolutelyContinuous F hDisk g (μ j) (hμ j)
  have : ∀ j, IsFiniteMeasure (ν j) := fun j => inferInstanceAs
    (IsFiniteMeasure (markedDiskPullback F (μ j)))
  obtain ⟨n, c, hn, hPos, hNeg, hSplit⟩ := exists_fourMeasureBall_bisection hZero ν hν
  simp only [ν, markedDiskPullback_restrict_closedBall F hDisk] at hSplit
  have hInner : Continuous (fun x : E₄ => ⟪n, x⟫) := continuous_const.inner continuous_id
  have hAffine : Continuous (affineCutValue n c) := hInner.add continuous_const
  have hPosMeas : MeasurableSet (affineCutPositive n c) :=
    (isOpen_lt continuous_const hAffine).measurableSet
  have hNegMeas : MeasurableSet (affineCutNegative n c) :=
    (isOpen_lt hAffine continuous_const).measurableSet
  have hPlaneMeas : MeasurableSet (affineCutPlane n c) :=
    (isClosed_eq hAffine continuous_const).measurableSet
  refine ⟨n, c, hn, hPos, hNeg, fun j => ?_⟩
  simpa only [Measure.real_def, markedDiskPullback_apply F hDisk _ hPosMeas,
    markedDiskPullback_apply F hDisk _ hNegMeas, markedDiskPullback_apply F hDisk _ hPlaneMeas,
    markedDiskPullback_apply F hDisk _ MeasurableSet.univ, univ_inter, selectedChartDisk]
    using hSplit j

/-- A finite common packing approximates half of the entire marked disk mass
for all four component measures. Its balls lie in the interior parameter
ball and their physical images are disjoint. -/
theorem exists_markedDisk_finiteBall_division
    (F : PartialDiffeomorph I₄ I E₄ M ∞) (hDisk : D₄ ⊆ F.source)
    (g : SmoothRiemannianMetric I M) (μ : Fin 4 → Measure M)
    [∀ j, IsFiniteMeasure (μ j)] (hμ : ∀ j, μ j ≪ riemannianVolumeMeasure I M g)
    {ε : ℝ} (hε : 0 < ε) :
    ∃ (s : Finset E₄) (r : E₄ → ℝ),
      (∀ x ∈ s, 0 < r x ∧ Metric.closedBall x (r x) ⊆ U₄) ∧
      (s : Set E₄).PairwiseDisjoint (fun x => F '' Metric.closedBall x (r x)) ∧
      ∀ j, |(μ j).real (F '' (⋃ x ∈ s, Metric.closedBall x (r x))) -
        (μ j).real (selectedChartDisk F) / 2| < ε := by
  let ν := fun j => markedDiskPullback F (μ j)
  have : ∀ j, IsFiniteMeasure (ν j) := fun j => inferInstanceAs
    (IsFiniteMeasure (markedDiskPullback F (μ j)))
  have : ∀ j, NullSingletonClass (ν j) :=
    fun j => markedDiskPullback_nullSingletonClass F hDisk g (μ j) (hμ j)
  obtain ⟨s, r, hBall, hDisj, hApprox⟩ :=
    exists_four_measure_ball_division ν Metric.isOpen_ball hε
  have hClosed (x : E₄) (hx : x ∈ s) : Metric.closedBall x (r x) ⊆ D₄ :=
    (hBall x hx).2.trans Metric.ball_subset_closedBall
  have hMeas : MeasurableSet (⋃ x ∈ s, Metric.closedBall x (r x)) :=
    s.measurableSet_biUnion fun _ _ => Metric.isClosed_closedBall.measurableSet
  have hOpenMass (j : Fin 4) : (ν j).real U₄ = (μ j).real (selectedChartDisk F) := by
    have hEq : ν j U₄ = ν j D₄ := by
      apply measure_eq_measure_of_null_sdiff Metric.ball_subset_closedBall
      rw [Metric.closedBall_sdiff_ball]
      exact markedDiskPullback_absolutelyContinuous F hDisk g (μ j) (hμ j)
        (Measure.addHaar_sphere volume _ _)
    change ENNReal.toReal (ν j U₄) = _
    rw [hEq]
    exact markedDiskPullback_real_image F hDisk (μ j)
      Metric.isClosed_closedBall.measurableSet Subset.rfl
  refine ⟨s, r, hBall, ?_, fun j => ?_⟩
  · intro x hx y hy hxy
    apply disjoint_left.mpr
    rintro _ ⟨a, ha, rfl⟩ ⟨b, hb, hba⟩
    have hab : a = b := F.toOpenPartialHomeomorph.injOn
      (hDisk (hClosed x hx ha)) (hDisk (hClosed y hy hb)) hba.symm
    exact disjoint_left.mp (hDisj hx hy hxy) ha (hab.symm ▸ hb)
  · have hImage := markedDiskPullback_real_image F hDisk (μ j) hMeas
      (iUnion₂_subset hClosed)
    exact (hImage ▸ hOpenMass j ▸ hApprox j)

end SmoothPoincare
