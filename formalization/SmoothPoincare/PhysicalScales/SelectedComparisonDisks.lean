import SmoothPoincare.PhysicalScales.SelectedDiskCollars

/-! # Marked disks from smooth comparison ball charts -/

open DifferentialGeometry DifferentialGeometry.Integral.Measure
open Filter FirstOrderTwistor MeasureTheory Set
open scoped ContDiff Manifold Topology

namespace SmoothPoincare

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "I₄" => 𝓘(ℝ, E₄)

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H}
  [TopologicalSpace M] [ChartedSpace H M]

private noncomputable def rescaleDiskChart (F : PartialDiffeomorph I₄ I E₄ M ∞) {r : ℝ} (hr : 0 < r) :
    PartialDiffeomorph I₄ I E₄ M ∞ :=
  let A : E₄ ≃L[ℝ] E₄ := Units.mk0 r hr.ne' • ContinuousLinearEquiv.refl ℝ E₄
  A.toDiffeomorph.toPartialDiffeomorph.trans F

/-- A compact core of an open model ball lies strictly inside a marked unit disk
after a positive dilation of its parameter. The larger open marking has the
same image and includes the seam on both sides. -/
theorem exists_selectedChartDisk_of_compact_subset
    (F : PartialDiffeomorph I₄ I E₄ M ∞) {R : ℝ} (hR : 0 < R)
    (hSource : F.source = Metric.ball 0 R) {K : Set M} (hK : IsCompact K)
    (hTarget : K ⊆ F.target) :
    ∃ (F' : PartialDiffeomorph I₄ I E₄ M ∞) (b : ℝ),
      1 < b ∧ F'.source = Metric.ball 0 b ∧ F'.target = F.target ∧
      K ⊆ F' '' Metric.ball 0 1 ∧ selectedChartDisk F' ⊆ F'.target := by
  let C : Set E₄ := insert 0 (F.symm '' K)
  have hC : IsCompact C := (hK.image_of_continuousOn
    (F.contMDiffOn_invFun.continuousOn.mono hTarget)).insert 0
  have hCsub : C ⊆ Metric.ball 0 R := by
    intro z hz
    rcases mem_insert_iff.mp hz with rfl | ⟨x, hx, rfl⟩
    · exact Metric.mem_ball_self hR
    · rw [← hSource]
      exact F.map_target (hTarget hx)
  obtain ⟨q, hq, hMax⟩ := hC.exists_isMaxOn ⟨0, mem_insert _ _⟩ continuous_norm.continuousOn
  have hqR : ‖q‖ < R := by simpa [Metric.mem_ball, dist_zero_right] using hCsub hq
  let r := (‖q‖ + R) / 2
  have hr : 0 < r := by dsimp [r]; positivity
  have hrR : r < R := by dsimp [r]; linarith
  have hqr : ‖q‖ < r := by dsimp [r]; linarith
  let F' := rescaleDiskChart F hr
  have hS : F'.source = Metric.ball 0 (R / r) := by
    change (univ ∩ (fun z : E₄ => r • z) ⁻¹' F.source) = _
    rw [univ_inter, hSource]
    ext z
    simp only [mem_preimage, Metric.mem_ball, dist_zero_right, norm_smul, Real.norm_eq_abs,
      abs_of_pos hr, lt_div_iff₀ hr, mul_comm r]
  have hT : F'.target = F.target := by
    change F.target ∩ F.symm ⁻¹' univ = F.target
    simp
  have hb : 1 < R / r := (lt_div_iff₀ hr).2 (by simpa using hrR)
  refine ⟨F', R / r, hb, hS, hT, ?_, ?_⟩
  · intro x hx
    have hxnorm : ‖F.symm x‖ < r := (hMax (show F.symm x ∈ C from mem_insert_of_mem _
      (mem_image_of_mem F.symm hx))).trans_lt hqr
    refine ⟨r⁻¹ • F.symm x, ?_, ?_⟩
    · simpa [Metric.mem_ball, dist_zero_right, norm_smul, Real.norm_eq_abs, abs_of_pos hr,
        inv_mul_lt_iff₀ hr] using hxnorm
    · change F (r • (r⁻¹ • F.symm x)) = x
      rw [smul_smul, mul_inv_cancel₀ hr.ne', one_smul]
      exact F.right_inv (hTarget hx)
  · rintro x ⟨z, hz, rfl⟩
    apply F'.map_source
    rw [hS]
    exact Metric.closedBall_subset_ball hb hz

/-- The parametrized closed disk is compact when the whole disk lies in the
source of its smooth marking. -/
theorem isCompact_selectedChartDisk (F : PartialDiffeomorph I₄ I E₄ M ∞)
    (hDisk : Metric.closedBall (0 : E₄) 1 ⊆ F.source) : IsCompact (selectedChartDisk F) :=
  (isCompact_closedBall (0 : E₄) 1).image_of_continuousOn (F.contMDiffOn.continuousOn.mono hDisk)

variable [IsManifold I ∞ M] [T2Space M] [CompactSpace M] [ConnectedSpace M]

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

/-- Realize a finite collection of comparison ball sandwiches on one smooth
source. The metric `k` supplies all the radii and separation. The measure `μ`
is the modified probability, while `g` supplies the full physical tensor
curvature of the disk, its open marking and the containing comparison ball. -/
theorem exists_selectedComparisonDisks
    (k g : SmoothRiemannianMetric I M) (o : ManifoldOrientation I M 4)
    (frame : ∀ x, OrientedOrthonormalFrameAt g o x)
    (hFull : Integrable (fun x => frameTensorNormSq (metricCurvatureFrameTensor g o x (frame x)))
      (riemannianVolumeMeasure I M g))
    (μ : Measure M) [IsProbabilityMeasure μ] (idx : Finset ℕ)
    (x : ℕ → M) (rIn rMid rOut : ℕ → ℝ) {d ζ : ℝ} :
    letI := physicalMetricSpace k
    let ν := metricFullCurvatureMeasure g o frame
    (∀ j ∈ idx, rMid j ≤ rOut j) →
    (idx : Set ℕ).Pairwise (fun j l => rMid j + rMid l ≤ dist (x j) (x l)) →
    (∀ j ∈ idx, ∃ (F : PartialDiffeomorph I₄ I E₄ M ∞) (R : ℝ),
      0 < R ∧ F.source = Metric.ball 0 R ∧
      Metric.closedBall (x j) (rIn j) ⊆ F.target ∧ F.target ⊆ Metric.ball (x j) (rMid j)) →
    μ.real (⋃ j ∈ idx, Metric.closedBall (x j) (rIn j))ᶜ < d →
    (∀ j ∈ idx, ν.real (Metric.ball (x j) (rOut j)) < ζ) →
    ∃ F : ℕ → PartialDiffeomorph I₄ I E₄ M ∞,
      (idx : Set ℕ).PairwiseDisjoint (fun j => (F j).target) ∧
      (∀ j ∈ idx, (∃ b > (1 : ℝ), (F j).source = Metric.ball 0 b) ∧
        Metric.closedBall (0 : E₄) 1 ⊆ (F j).source ∧
        Metric.closedBall (x j) (rIn j) ⊆ (F j) '' Metric.ball 0 1 ∧
        selectedChartDisk (F j) ⊆ (F j).target ∧
        (F j).target ⊆ Metric.ball (x j) (rMid j) ∧
        (F j).target ⊆ Metric.ball (x j) (rOut j) ∧
        ν.real (selectedChartDisk (F j)) ≤ ν.real (F j).target ∧
        ν.real (F j).target ≤ ν.real (Metric.ball (x j) (rOut j)) ∧
        ν.real (Metric.ball (x j) (rOut j)) < ζ) ∧
      μ.real (⋃ j ∈ idx, selectedChartDisk (F j))ᶜ ≤
        μ.real (⋃ j ∈ idx, Metric.closedBall (x j) (rIn j))ᶜ ∧
      μ.real (⋃ j ∈ idx, selectedChartDisk (F j))ᶜ < d := by
  let : MetricSpace M := physicalMetricSpace k
  intro ν hRadius hSep hCharts hVol hCurv
  let : IsFiniteMeasure ν := isFiniteEnergyMeasure hFull
  have hChart (j : ℕ) : ∃ F : PartialDiffeomorph I₄ I E₄ M ∞, j ∈ idx →
      (∃ b > (1 : ℝ), F.source = Metric.ball 0 b) ∧
      Metric.closedBall (0 : E₄) 1 ⊆ F.source ∧
      Metric.closedBall (x j) (rIn j) ⊆ F '' Metric.ball 0 1 ∧
      selectedChartDisk F ⊆ F.target ∧
      F.target ⊆ Metric.ball (x j) (rMid j) := by
    by_cases hj : j ∈ idx
    · obtain ⟨P, R, hR, hSource, hCore, hTarget⟩ := hCharts j hj
      obtain ⟨F, b, hb, hFsource, hFtarget, hInterior, hDisk⟩ :=
        exists_selectedChartDisk_of_compact_subset P hR hSource (isCompact_closedBall _ _) hCore
      refine ⟨F, fun _ => ⟨⟨b, hb, hFsource⟩, ?_, hInterior, hDisk, hFtarget ▸ hTarget⟩⟩
      rw [hFsource]
      exact Metric.closedBall_subset_ball hb
    · let F : PartialDiffeomorph I₄ I E₄ M ∞ :=
        { toFun := Function.const E₄ (x j)
          invFun := Function.const M 0
          source := ∅
          target := ∅
          map_source' := fun _ h => h.elim
          map_target' := fun _ h => h.elim
          left_inv' := fun _ h => h.elim
          right_inv' := fun _ h => h.elim
          open_source := isOpen_empty
          open_target := isOpen_empty
          contMDiffOn_toFun := contMDiffOn_empty
          contMDiffOn_invFun := contMDiffOn_empty }
      exact ⟨F, fun hj' => (hj hj').elim⟩
  choose F hF using hChart
  have hCaptured (j : ℕ) (hj : j ∈ idx) :
      Metric.closedBall (x j) (rIn j) ⊆ selectedChartDisk (F j) :=
    (hF j hj).2.2.1.trans (image_mono Metric.ball_subset_closedBall)
  have hOmit : μ.real (⋃ j ∈ idx, selectedChartDisk (F j))ᶜ ≤
      μ.real (⋃ j ∈ idx, Metric.closedBall (x j) (rIn j))ᶜ :=
    measureReal_mono (compl_subset_compl.mpr (iUnion₂_mono hCaptured))
  refine ⟨F, ?_, ?_, hOmit, hOmit.trans_lt hVol⟩
  · intro j hj l hl hjl
    exact (Metric.ball_disjoint_ball (hSep hj hl hjl)).mono
      (hF j hj).2.2.2.2 (hF l hl).2.2.2.2
  · intro j hj
    obtain ⟨hb, hUnit, hCore, hDisk, hMid⟩ := hF j hj
    have hOut := hMid.trans (Metric.ball_subset_ball (hRadius j hj))
    exact ⟨hb, hUnit, hCore, hDisk, hMid, hOut, measureReal_mono hDisk,
      measureReal_mono hOut, hCurv j hj⟩

/-- Fixed-radius comparison data with strict margins transfer to every late
source. The three radii of each label are fixed before the source limit.
The convergence premises concern only the indicated scalar quantities at
those radii. The smooth model ball charts may vary with the source index. -/
theorem eventually_exists_selectedComparisonDisks
    (k g : ℕ → SmoothRiemannianMetric I M) (o : ManifoldOrientation I M 4)
    (frame : ∀ i x, OrientedOrthonormalFrameAt (g i) o x)
    (hFull : ∀ i, Integrable
      (fun x => frameTensorNormSq (metricCurvatureFrameTensor (g i) o x (frame i x)))
      (riemannianVolumeMeasure I M (g i)))
    (μ : ℕ → Measure M) [∀ i, IsProbabilityMeasure (μ i)] (idx : Finset ℕ)
    (x : ℕ → ℕ → M) (rIn rMid rOut : ℕ → ℝ) {d ζ rMax δ : ℝ}
    (κ : ℕ → ℝ) (D : ℕ → ℕ → ℝ)
    (hRadius : ∀ j ∈ idx, 0 < rIn j ∧ rIn j < rMid j ∧ rMid j < rOut j ∧ rOut j < rMax)
    (hSep : (idx : Set ℕ).Pairwise (fun j l => rMid j + rMid l < D j l))
    (hDist : ∀ j ∈ idx, ∀ l ∈ idx, j ≠ l → Tendsto (fun i =>
      letI := physicalMetricSpace (k i)
      dist (x i j) (x i l)) atTop (𝓝 (D j l)))
    (hCharts : ∀ᶠ i in atTop, letI := physicalMetricSpace (k i)
      ∀ j ∈ idx, ∃ (F : PartialDiffeomorph I₄ I E₄ M ∞) (R : ℝ),
        0 < R ∧ F.source = Metric.ball 0 R ∧
        Metric.closedBall (x i j) (rIn j) ⊆ F.target ∧ F.target ⊆ Metric.ball (x i j) (rMid j))
    (hOmit : Tendsto (fun i => letI := physicalMetricSpace (k i)
      (μ i).real (⋃ j ∈ idx, Metric.closedBall (x i j) (rIn j))ᶜ) atTop (𝓝 δ))
    (hMass : ∀ j ∈ idx, Tendsto (fun i => letI := physicalMetricSpace (k i)
      (metricFullCurvatureMeasure (g i) o (frame i)).real (Metric.ball (x i j) (rOut j)))
        atTop (𝓝 (κ j)))
    (hd : δ < d) (hζ : ∀ j ∈ idx, κ j < ζ) :
    ∀ᶠ i in atTop, letI := physicalMetricSpace (k i)
    let ν := metricFullCurvatureMeasure (g i) o (frame i)
    ∃ F : ℕ → PartialDiffeomorph I₄ I E₄ M ∞,
      (idx : Set ℕ).PairwiseDisjoint (fun j => (F j).target) ∧
      (∀ j ∈ idx, (∃ b > (1 : ℝ), (F j).source = Metric.ball 0 b) ∧
        Metric.closedBall (0 : E₄) 1 ⊆ (F j).source ∧
        Metric.closedBall (x i j) (rIn j) ⊆ (F j) '' Metric.ball 0 1 ∧
        selectedChartDisk (F j) ⊆ (F j).target ∧
        (F j).target ⊆ Metric.ball (x i j) (rOut j) ∧ rOut j < rMax ∧
        ν.real (selectedChartDisk (F j)) ≤ ν.real (F j).target ∧
        ν.real (F j).target ≤ ν.real (Metric.ball (x i j) (rOut j)) ∧
        ν.real (Metric.ball (x i j) (rOut j)) < ζ) ∧
      (μ i).real (⋃ j ∈ idx, selectedChartDisk (F j))ᶜ < d := by
  have hSepEventually : ∀ᶠ i in atTop, letI := physicalMetricSpace (k i)
      (idx : Set ℕ).Pairwise (fun j l => rMid j + rMid l ≤ dist (x i j) (x i l)) := by
    simp only [Set.Pairwise, Finset.mem_coe, Filter.eventually_all_finset, Filter.eventually_imp_distrib_left]
    intro j hj l hl hjl
    exact ((hDist j hj l hl hjl).eventually_const_lt (hSep hj hl hjl)).mono fun _ h => h.le
  have hMassEventually : ∀ᶠ i in atTop, letI := physicalMetricSpace (k i)
      ∀ j ∈ idx, (metricFullCurvatureMeasure (g i) o (frame i)).real
        (Metric.ball (x i j) (rOut j)) < ζ :=
    (idx.eventually_all).2 fun j hj => (hMass j hj).eventually_lt_const (hζ j hj)
  filter_upwards [hCharts, hSepEventually, hOmit.eventually_lt_const hd, hMassEventually] with
    i hChart hApart hProb hCurv
  obtain ⟨F, hDisjoint, hF, _, hOmitted⟩ := exists_selectedComparisonDisks (k i) (g i) o
    (frame i) (hFull i) (μ i) idx (x i) rIn rMid rOut (fun j hj => (hRadius j hj).2.2.1.le)
    hApart hChart hProb hCurv
  refine ⟨F, hDisjoint, ?_, hOmitted⟩
  intro j hj
  obtain ⟨hb, hUnit, hInner, hDisk, _, hOuter, hDiskMass, hChartMass, hCeiling⟩ := hF j hj
  exact ⟨hb, hUnit, hInner, hDisk, hOuter, (hRadius j hj).2.2.2, hDiskMass, hChartMass, hCeiling⟩

end SmoothPoincare
