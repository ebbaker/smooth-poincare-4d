import SmoothPoincare.Variational.SelectedQuadraticJets
import SmoothPoincare.Variational.PositiveCoreVariation
import FirstOrderTwistor.FixedMetricEnergy
import DifferentialGeometry.Geometry.Curvature.Naturality.Pullback.PartialDiffeomorph
import DifferentialGeometry.Geometry.Curvature.Naturality.MetricLocality
import DifferentialGeometry.Geometry.Metric.RicciSoliton.Models

/-! # A Euclidean reference on a selected physical disk -/

open DifferentialGeometry DifferentialGeometry.Analysis
open DifferentialGeometry.Geometry.Operator DifferentialGeometry.Tensor.Coordinates
open DifferentialGeometry.Geometry.Curvature DifferentialGeometry.Integral.Measure
open FirstOrderTwistor SectionsAndConnections Filter MeasureTheory Set
open scoped ContDiff Manifold Topology

namespace SmoothPoincare

noncomputable section

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "I₄" => 𝓘(ℝ, E₄)
local notation "J₄" => Fin (Module.finrank ℝ E₄)

section Construction

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]

omit [T2Space M] in
private theorem splice_inner (g b : SmoothRiemannianMetric I M) (χ : M → ℝ)
    (hχ : ContMDiff I 𝓘(ℝ) ∞ χ) (hχ01 : ∀ y, χ y ∈ Icc (0 : ℝ) 1)
    (t : ℝ) (ht : t ∈ Icc (0 : ℝ) 1) (y : M) (u v : TangentSpace I y) :
    (chartSpliceMetric g b χ hχ hχ01 t ht).inner y u v =
      (1 - t * χ y) * g.inner y u v + t * χ y * b.inner y u v := by
  have h : ∀ z, t * χ z ∈ Icc (0 : ℝ) 1 := fun z =>
    ⟨mul_nonneg ht.1 (hχ01 z).1, (mul_le_of_le_one_left (hχ01 z).1 ht.2).trans (hχ01 z).2⟩
  simpa only [smul_eq_mul, add_comm, chartSpliceMetric] using
    convexComb_inner b g (fun z => t * χ z) (contMDiff_const.mul hχ) h y u v

/-- The native marking supplies an actual global reference and a smooth
positive-definite path on the physical source. The reference is Euclidean in
the marking on a neighborhood of the whole buffered disk. The same cutoff
makes the model and the physical splice agree there at every parameter. -/
theorem exists_selectedEuclideanReferenceSplice [SigmaCompactSpace M]
    (g : SmoothRiemannianMetric I M) (F : PartialDiffeomorph I₄ I E₄ M ∞) (n : ℕ)
    (hBuffer : Metric.closedBall (0 : E₄) (1 + 1 / ((n : ℝ) + 1)) ⊆ F.source) :
    ∃ (χ : M → ℝ) (hχ : ContMDiff I 𝓘(ℝ) ∞ χ) (hχ01 : ∀ y, χ y ∈ Icc (0 : ℝ) 1)
      (G : SmoothRiemannianMetric I₄ E₄) (b : SmoothRiemannianMetric I M)
      (V : TopologicalSpace.Opens E₄),
      let w : ℝ := 1 / ((n : ℝ) + 1)
      Metric.closedBall (0 : E₄) (1 + w) ⊆ (V : Set E₄) ∧
      (V : Set E₄) ⊆ F.source ∧
      (∀ x ∈ V, ∀ u v : E₄,
        (euclideanMetric (E := E₄)).inner x u v =
          b.inner (F x) (mfderiv I₄ I (F : E₄ → M) x u) (mfderiv I₄ I (F : E₄ → M) x v)) ∧
      (∀ x ∈ V, ∀ u v : E₄,
        G.inner x u v =
          g.inner (F x) (mfderiv I₄ I (F : E₄ → M) x u) (mfderiv I₄ I (F : E₄ → M) x v)) ∧
      (∀ y ∉ selectedChartDisk F ∪ selectedDiskTrim F n, ∀ᶠ z in 𝓝 y,
        ∀ u v : TangentSpace I z, ∀ t : ℝ, ∀ ht : t ∈ Icc (0 : ℝ) 1,
          (chartSpliceMetric g b χ hχ hχ01 t ht).inner z u v = g.inner z u v) ∧
      ∀ x ∈ V, ∀ u v : E₄, ∀ t : ℝ, ∀ ht : t ∈ Icc (0 : ℝ) 1,
        (selectedModelSplice G (euclideanMetric (E := E₄)) t w ht).inner x u v =
          (chartSpliceMetric g b χ hχ hχ01 t ht).inner (F x)
            (mfderiv I₄ I (F : E₄ → M) x u) (mfderiv I₄ I (F : E₄ → M) x v) := by
  obtain ⟨χ, hχ, hχ01, hNative, hZero⟩ := exists_selectedMarkedRadialCutoff F n hBuffer
  obtain ⟨G, U, hU, hUS, hG⟩ := exists_selectedMarkedMetricLift F n hBuffer g
  obtain ⟨b, V, hV, _, hB, _⟩ :=
    PartialDiffeomorph.exists_metric_preserving_on_neighborhood_of_is_compact
      F (euclideanMetric (E := E₄)) g (isCompact_closedBall _ _) hBuffer
  refine ⟨χ, hχ, hχ01, G, b, U ⊓ V, ?_, ?_, ?_, ?_, ?_, ?_⟩
  · exact fun _ hx => ⟨hU hx, hV hx⟩
  · exact fun _ hx => hUS hx.1
  · exact fun _ hx => hB _ hx.2
  · exact fun _ hx => hG _ hx.1
  · intro y hy
    let w : ℝ := 1 / ((n : ℝ) + 1)
    have hw : 0 < w := by dsimp [w]; positivity
    let K := Metric.closedBall (0 : E₄) (1 + w / 2)
    have hK : K ⊆ F.source := (Metric.closedBall_subset_closedBall (by
      change 1 + w / 2 ≤ 1 + w
      linarith)).trans hBuffer
    have hClosed : IsClosed (F '' K) :=
      ((isCompact_closedBall _ _).image_of_continuousOn (F.contMDiffOn_toFun.continuousOn.mono hK)).isClosed
    have hMissing : y ∉ F '' K := by
      rintro ⟨x, hx, rfl⟩
      have hx' : ‖x‖ ≤ 1 + w / 2 := by simpa [K, Metric.mem_closedBall, dist_zero_right] using hx
      apply hy
      by_cases h : ‖x‖ ≤ 1
      · exact Or.inl ⟨x, by simpa [Metric.mem_closedBall, dist_zero_right] using h, rfl⟩
      · right
        refine ⟨F.map_source (hK hx), ?_⟩
        change |‖F.symm (F x)‖ - 1| < w
        have hInv : F.symm.toPartialEquiv (F.toPartialEquiv x) = x := F.left_inv (hK hx)
        rw [hInv, abs_of_nonneg (sub_nonneg.mpr (le_of_not_ge h))]
        linarith
    filter_upwards [hClosed.isOpen_compl.mem_nhds hMissing] with z hz
    have hχZero : χ z = 0 := by
      by_cases hzt : z ∈ F.target
      · let x := F.symm z
        have hx : x ∈ F.source := F.map_target hzt
        have hzx : F x = z := F.right_inv hzt
        have hRad : 1 + w / 2 < ‖x‖ := by
          by_contra! h
          exact hz ⟨x, by simpa [K, Metric.mem_closedBall, dist_zero_right] using h, hzx⟩
        have hSq : 1 + w ≤ ‖x‖ ^ 2 := by
          have hp := pow_le_pow_left₀ (by positivity : 0 ≤ 1 + w / 2) hRad.le 2
          nlinarith only [hp, sq_nonneg w]
        exact (congrArg χ hzx).symm.trans ((hNative x hx).trans (selectedRadialCutoff_eq_zero hw hSq))
      · apply hZero
        rintro (⟨x, hx, rfl⟩ | hz')
        · apply hzt
          exact F.map_source (hBuffer (Metric.closedBall_subset_closedBall (by
            change (1 : ℝ) ≤ 1 + w
            linarith) hx))
        · exact hzt hz'.1
    intro u v t ht
    rw [splice_inner, hχZero]
    ring
  · rintro x ⟨hxU, hxV⟩ u v t ht
    let w : ℝ := 1 / ((n : ℝ) + 1)
    let k : E₄ → ℝ := selectedRadialCutoff w
    have hk : ContMDiff I₄ 𝓘(ℝ) ∞ k := (contDiff_selectedRadialCutoff w).contMDiff
    have hk01 : ∀ z, k z ∈ Icc (0 : ℝ) 1 := selectedRadialCutoff_mem_Icc w
    calc
      _ = (1 - t * k x) * G.inner x u v + t * k x * (euclideanMetric (E := E₄)).inner x u v :=
        splice_inner G _ k hk hk01 t ht x u v
      _ = _ := by
        have hK : k x = χ (F x) := (hNative x (hUS hxU)).symm
        rw [hG x hxU u v, hB x hxV u v, hK]
        exact (splice_inner g b χ hχ hχ01 t ht (F x)
          (mfderiv I₄ I (F : E₄ → M) x u) (mfderiv I₄ I (F : E₄ → M) x v)).symm

/-- The Euclidean reference has constant coefficients in the native coordinate
basis. This basis need not be orthonormal for the Euclidean metric. -/
theorem chartGramOnE_euclideanReference (α : E₄) (a c : J₄) :
    chartGramOnE (euclideanMetric (E := E₄)) α a c =
      fun _ => inner ℝ (chartModelBasis E₄ a) (chartModelBasis E₄ c) := by
  funext x
  exact (selectedMarkedMetricLift_chartGram _ α x a c).trans
    (euclideanMetric_inner x (chartModelBasis E₄ a) (chartModelBasis E₄ c))

/-- All coordinate first jets of the constant reference vanish. -/
theorem partialDeriv_chartGram_euclideanReference (α : E₄) (a c i : J₄) :
    partialDeriv i (chartGramOnE (euclideanMetric (E := E₄)) α a c) = 0 := by
  rw [chartGramOnE_euclideanReference]
  ext x
  simp [partialDeriv]

/-- An open Euclidean germ in the actual marking has zero physical lowered
curvature in all slots on its image. -/
theorem selectedEuclideanGerm_flat (h : SmoothRiemannianMetric I M)
    (F : PartialDiffeomorph I₄ I E₄ M ∞) (U : TopologicalSpace.Opens E₄)
    (hU : (U : Set E₄) ⊆ F.source)
    (hEuclidean : ∀ x ∈ U, ∀ u v : E₄, (euclideanMetric (E := E₄)).inner x u v =
      h.inner (F x) (mfderiv I₄ I (F : E₄ → M) x u) (mfderiv I₄ I (F : E₄ → M) x v))
    (x : U) : metricRm04At h (F x) = 0 := by
  have hx := hU x.property
  have hy := F.map_source hx
  have hdF := (F.contMDiffOn_toFun.contMDiffAt (F.open_source.mem_nhds hx)).mdifferentiableAt (by simp)
  have hdS := (F.symm.contMDiffOn_toFun.contMDiffAt
    (F.symm.open_source.mem_nhds hy)).mdifferentiableAt (by simp)
  have hRight : ((F : E₄ → M) ∘ (F.symm : M → E₄)) =ᶠ[𝓝 (F x)] id := by
    filter_upwards [F.symm.open_source.mem_nhds hy] with z hz
    exact F.right_inv hz
  have hDeriv : (mfderiv I₄ I (F : E₄ → M) x.val).comp
      (mfderiv I I₄ (F.symm : M → E₄) (F x)) = ContinuousLinearMap.id ℝ E₄ := by
    have hLeft : F.symm (F x) = x.val := F.left_inv hx
    have hdF' : MDifferentiableAt I₄ I (F : E₄ → M) (F.symm (F x)) := by
      rw [hLeft]
      exact hdF
    have he := mfderiv_comp (F x) hdF' hdS
    rw [hRight.mfderiv_eq, mfderiv_id, hLeft] at he
    exact he.symm
  have hApply (a : TangentSpace I (F x)) : mfderiv I₄ I (F : E₄ → M) x.val
      (mfderiv I I₄ (F.symm : M → E₄) (F x) a) = a := DFunLike.congr_fun hDeriv a
  ext v
  let u := fun i => mfderiv I I₄ (F.symm : M → E₄) (F x) (v i)
  have heq := metricRm04StandardAt_eq_of_partialDiffeomorph_restriction F U hU
    (euclideanMetric (E := E₄)) h (fun z => hEuclidean z z.property) x (u 0) (u 1) (u 2) (u 3)
  simp only [u, hApply] at heq
  have hflat : metricRm04At (euclideanMetric (E := E₄)) x.val = 0 :=
    DifferentialGeometry.Geometry.euclideanMetric_metricRm04At_eq_zero _
  have hvec : vec4 (v 0) (v 1) (v 2) (v 3) = v := by
    funext i
    fin_cases i <;> rfl
  change (metricRm04At (euclideanMetric (E := E₄)) x.val) (vec4 (u 0) (u 1) (u 2) (u 3)) =
    (metricRm04At h (F x)) (vec4 (v 0) (v 1) (v 2) (v 3)) at heq
  rw [hflat, hvec] at heq
  exact heq.symm

/-- On the entire open inner region the time-one metric is exactly
Euclidean in the original marking. -/
theorem selectedModelSplice_euclidean_inner (G : SmoothRiemannianMetric I₄ E₄)
    {w : ℝ} (hw : 0 < w) (x u v : E₄) (hx : ‖x‖ ^ 2 < 1 - w) :
    (selectedModelSplice G (euclideanMetric (E := E₄)) 1 w (by exact ⟨zero_le_one, le_rfl⟩)).inner x u v =
      (euclideanMetric (E := E₄)).inner x u v := by
  have ht : (1 : ℝ) ∈ Icc (0 : ℝ) 1 := ⟨zero_le_one, le_rfl⟩
  have h := splice_inner G (euclideanMetric (E := E₄)) (selectedRadialCutoff w)
    (contDiff_selectedRadialCutoff w).contMDiff (selectedRadialCutoff_mem_Icc w) 1 ht x u v
  rwa [selectedRadialCutoff_eq_one hw hx.le, one_mul, sub_self, zero_mul, zero_add, one_mul] at h

/-- The closed disk at radius `1 - w` lies inside an open Euclidean region
of the actual time-one splice. This cut admits its own exact Euclidean cap. -/
theorem selectedEuclideanSplice_flat_near_innerDisk
    (F : PartialDiffeomorph I₄ I E₄ M ∞) (n : ℕ) (hn : 0 < n)
    (G : SmoothRiemannianMetric I₄ E₄) (h : SmoothRiemannianMetric I M)
    (V : TopologicalSpace.Opens E₄)
    (hBuffer : Metric.closedBall (0 : E₄) (1 + 1 / ((n : ℝ) + 1)) ⊆ (V : Set E₄))
    (hV : (V : Set E₄) ⊆ F.source)
    (hSplice : ∀ x ∈ V, ∀ u v : E₄,
      (selectedModelSplice G (euclideanMetric (E := E₄)) 1 (1 / ((n : ℝ) + 1))
        (by exact ⟨zero_le_one, le_rfl⟩)).inner x u v =
        h.inner (F x) (mfderiv I₄ I (F : E₄ → M) x u) (mfderiv I₄ I (F : E₄ → M) x v)) :
    ∃ U : TopologicalSpace.Opens E₄,
      Metric.closedBall (0 : E₄) (1 - 1 / ((n : ℝ) + 1)) ⊆ (U : Set E₄) ∧
      (U : Set E₄) ⊆ F.source ∧
      (∀ x ∈ U, ∀ u v : E₄, (euclideanMetric (E := E₄)).inner x u v =
        h.inner (F x) (mfderiv I₄ I (F : E₄ → M) x u) (mfderiv I₄ I (F : E₄ → M) x v)) ∧
      ∀ x ∈ U, metricRm04At h (F x) = 0 := by
  let w : ℝ := 1 / ((n : ℝ) + 1)
  have hw : 0 < w := by dsimp [w]; positivity
  have hw' : w < 1 := by
    dsimp [w]
    exact (div_lt_one (by positivity)).2 (by exact_mod_cast Nat.succ_lt_succ hn)
  let U : TopologicalSpace.Opens E₄ :=
    ⟨(V : Set E₄) ∩ {x | ‖x‖ ^ 2 < 1 - w},
      V.isOpen.inter (isOpen_lt (continuous_norm.pow 2) continuous_const)⟩
  have hEuclidean (x : E₄) (hx : x ∈ U) (u v : E₄) :
      (euclideanMetric (E := E₄)).inner x u v =
        h.inner (F x) (mfderiv I₄ I (F : E₄ → M) x u) (mfderiv I₄ I (F : E₄ → M) x v) :=
    (selectedModelSplice_euclidean_inner G hw x u v hx.2).symm.trans (hSplice x hx.1 u v)
  refine ⟨U, ?_, fun _ hx => hV hx.1, hEuclidean, ?_⟩
  · intro x hx
    have hNorm : ‖x‖ ≤ 1 - w := by simpa only [w, Metric.mem_closedBall, dist_zero_right] using hx
    refine ⟨hBuffer ?_, ?_⟩
    · rw [Metric.mem_closedBall, dist_zero_right]
      change ‖x‖ ≤ 1 + w
      linarith
    · change ‖x‖ ^ 2 < 1 - w
      have hSq := pow_le_pow_left₀ (norm_nonneg x) hNorm 2
      have hProduct := mul_pos hw (sub_pos.mpr hw')
      nlinarith only [hSq, hProduct]
  · intro x hx
    exact selectedEuclideanGerm_flat h F U (fun _ hy => hV hy.1) hEuclidean ⟨x, hx⟩

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

omit [IsManifold I ∞ M] in
/-- Splitting off the shrunken cap changes the cut within the original
selected trim and preserves the complete fixed exterior set. -/
theorem selectedReference_innerDisk_partition
    (F : PartialDiffeomorph I₄ I E₄ M ∞) (n : ℕ)
    (hBuffer : Metric.closedBall (0 : E₄) (1 + 1 / ((n : ℝ) + 1)) ⊆ F.source) :
    let w : ℝ := 1 / ((n : ℝ) + 1)
    let A := F '' Metric.closedBall (0 : E₄) (1 - w)
    let C := selectedDiskTrim F n
    MeasurableSet A ∧ MeasurableSet C ∧ Disjoint A C ∧
      A ∪ C = selectedChartDisk F ∪ C := by
  intro w A C
  have hw : 0 < w := by dsimp [w]; positivity
  have hOuter : Metric.closedBall (0 : E₄) 1 ⊆ F.source :=
    (Metric.closedBall_subset_closedBall (by change (1 : ℝ) ≤ 1 + w; linarith)).trans hBuffer
  have hACoords : Metric.closedBall (0 : E₄) (1 - w) ⊆ Metric.closedBall 0 1 :=
    Metric.closedBall_subset_closedBall (by linarith)
  have hASource := hACoords.trans hOuter
  have hMeas : MeasurableSet A :=
    ((isCompact_closedBall _ _).image_of_continuousOn
      (F.contMDiffOn_toFun.continuousOn.mono hASource)).isClosed.measurableSet
  refine ⟨hMeas, (isOpen_selectedDiskTrim _ _).measurableSet, ?_, ?_⟩
  · refine disjoint_left.mpr ?_
    rintro _ ⟨x, hx, rfl⟩ ht
    have hi : F.symm.toPartialEquiv (F.toPartialEquiv x) = x := F.left_inv (hASource hx)
    have hnear : |‖F.symm.toPartialEquiv (F.toPartialEquiv x)‖ - 1| < w := ht.2
    rw [hi, abs_lt] at hnear
    have hp := Metric.mem_closedBall.mp hx
    rw [dist_zero_right] at hp
    linarith only [hp, hnear.1]
  · apply Subset.antisymm
    · exact union_subset_union (image_mono hACoords) Subset.rfl
    · rintro _ (⟨x, hx, rfl⟩ | hc)
      · by_cases h : ‖x‖ ≤ 1 - w
        · exact Or.inl ⟨x, by simpa only [Metric.mem_closedBall, dist_zero_right] using h, rfl⟩
        · right
          refine ⟨F.map_source (hOuter hx), ?_⟩
          have hi : F.symm.toPartialEquiv (F.toPartialEquiv x) = x := F.left_inv (hOuter hx)
          have hp := Metric.mem_closedBall.mp hx
          rw [dist_zero_right] at hp
          change |‖F.symm.toPartialEquiv (F.toPartialEquiv x)‖ - 1| < w
          rw [hi, abs_of_nonpos (sub_nonpos.mpr hp)]
          linarith only [lt_of_not_ge h]
      · exact Or.inr hc

omit [IsManifold I ∞ M] in
/-- For every finite incoming measure, moving the cut to the flat inner cap
adds at most the raw charge of the same selected full trim. -/
theorem selectedReference_complement_cost
    (F : PartialDiffeomorph I₄ I E₄ M ∞) (n : ℕ)
    (hBuffer : Metric.closedBall (0 : E₄) (1 + 1 / ((n : ℝ) + 1)) ⊆ F.source)
    (μ : Measure M) [IsFiniteMeasure μ] :
    let w : ℝ := 1 / ((n : ℝ) + 1)
    let A := F '' Metric.closedBall (0 : E₄) (1 - w)
    let B := selectedChartDisk F
    0 ≤ μ.real Aᶜ - μ.real Bᶜ ∧ μ.real Aᶜ - μ.real Bᶜ ≤ μ.real (selectedDiskTrim F n) := by
  intro w A B
  obtain ⟨hA, hC, hAC, hEqual⟩ := selectedReference_innerDisk_partition F n hBuffer
  have hw : 0 < w := by dsimp [w]; positivity
  have hOuter : Metric.closedBall (0 : E₄) 1 ⊆ F.source :=
    (Metric.closedBall_subset_closedBall (by change (1 : ℝ) ≤ 1 + w; linarith)).trans hBuffer
  have hB : MeasurableSet B := (isCompact_selectedChartDisk F hOuter).isClosed.measurableSet
  have hAB : A ⊆ B := image_mono (Metric.closedBall_subset_closedBall (by linarith))
  have hMono := measureReal_mono (μ := μ) hAB
  have hBC : B ⊆ A ∪ selectedDiskTrim F n := by
    rw [hEqual]
    exact subset_union_left
  have hCost := measureReal_mono (μ := μ) hBC
  rw [measureReal_union hAC hC] at hCost
  rw [measureReal_compl hA, measureReal_compl hB]
  exact ⟨by linarith only [hMono], by linarith only [hCost]⟩

/-- On the physical trim, the exact Euclidean reference removes its own
first jets from the Hessian cutoff price. -/
theorem exists_selectedEuclideanSecondPartialError_on_physicalTrim [SigmaCompactSpace M]
    (g : SmoothRiemannianMetric I M) [IsFiniteMeasure (riemannianVolumeMeasure I M g)]
    (F : PartialDiffeomorph I₄ I E₄ M ∞) :
    ∃ C₁ C₂ : ℝ, 0 ≤ C₁ ∧ 0 ≤ C₂ ∧
      ∀ (n : ℕ) (G : SmoothRiemannianMetric I₄ E₄) (α : E₄) (a c m i : J₄)
        (t : ℝ), t ∈ Icc (0 : ℝ) 1 →
      let w : ℝ := 1 / ((n : ℝ) + 1)
      let μ := selectedTrimPullback F n (riemannianVolumeMeasure I M g)
      let A := chartGramOnE G α a c
      let B := chartGramOnE (euclideanMetric (E := E₄)) α a c
      let R := fun x => spliceSecondPartialError t (selectedRadialCutoff w) A B x m i
      MemLp R 2 μ ∧ lpNorm R 2 μ ≤ t * (
        (4 * C₂ / w ^ 2 + C₁ / w) * lpNorm (B - A) 2 μ +
        (2 * C₁ / w) * (lpNorm (partialDeriv m A) 2 μ + lpNorm (partialDeriv i A) 2 μ)) := by
  obtain ⟨C₁, C₂, hC₁, hC₂, hError⟩ := exists_selectedRadialSpliceSecondPartialError_on_physicalTrim g F
  refine ⟨C₁, C₂, hC₁, hC₂, fun n G α a c m i t ht => ?_⟩
  have h := hError n (chartGramOnE G α a c) (chartGramOnE (euclideanMetric (E := E₄)) α a c)
    (contDiff_selectedMarkedMetricLift_chartGram G α a c)
    (contDiff_selectedMarkedMetricLift_chartGram (euclideanMetric (E := E₄)) α a c) m i t ht
  simpa only [partialDeriv_chartGram_euclideanReference, zero_sub, lpNorm_neg] using h

end Construction

section Energy

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  [CompactSpace M] [Nonempty M] {o : ManifoldOrientation I M 4}

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

omit [I.Boundaryless] [Nonempty M] in
/-- Every measurable part of the flat germ has zero actual charge for
both physical chiralities. -/
theorem selectedReference_charge_eq_zero_of_flat (h : SignedCollarMetric o)
    {A : Set M} (hA : MeasurableSet A) (hFlat : ∀ x ∈ A, metricRm04At h.metric x = 0)
    (sign : CollarChirality) : h.charge sign A = 0 := by
  rw [SignedCollarMetric.charge, SignedCollarMetric.chiralMeasure, energyMeasure_real_apply hA
    (h.integrable sign).integrableOn (Eventually.of_forall fun x =>
      Finset.sum_nonneg fun a _ => Finset.sum_nonneg fun b _ =>
        sq_nonneg (signedCollarWeylBlock o h.metric h.frame sign x a b))]
  have hW (x : M) (hx : x ∈ A) : metricCurvatureFrameTensor h.metric o x (h.frame x) = 0 := by
    funext i j k l
    change metricRm04StandardAt h.metric x ((h.frame x).basis i) ((h.frame x).basis j)
      ((h.frame x).basis l) ((h.frame x).basis k) = 0
    simp [hFlat x hx]
  calc
    _ = ∫ x in A, (0 : ℝ) ∂riemannianVolumeMeasure I M h.metric := by
      apply setIntegral_congr_fun hA
      intro x hx
      have hZero : (fun _ _ : Fin 3 => (0 : ℝ)) = (0 : Matrix (Fin 3) (Fin 3) ℝ) := rfl
      cases sign <;> simp [signedCollarWeylBlock, geometricChiralBlock, endpointNegativeWeylBlock,
        traceFreeChiralBlock, selfDualCurvatureBlock, antiSelfDualCurvatureBlock, hilbertSchmidtSq,
        Matrix.trace, Matrix.diag, hW x hx] <;>
        rw [hZero, sub_zero] <;> simp
    _ = 0 := by simp

omit [I.Boundaryless] [Nonempty M] in
/-- Equality of the full metric germs gives exact signed charge equality in
the same exterior oriented frames. Each charge keeps its own physical volume. -/
theorem selectedReference_charge_eq_of_germ (g h : SignedCollarMetric o)
    {A : Set M} (hA : MeasurableSet A)
    (hGerm : ∀ x ∈ A, ∀ᶠ y in 𝓝 x, ∀ u v : TangentSpace I y,
      g.metric.inner y u v = h.metric.inner y u v)
    (hFrame : ∀ x ∈ A, (g.frame x).basis = (h.frame x).basis)
    (sign : CollarChirality) : g.charge sign A = h.charge sign A := by
  have hCharge (q : SignedCollarMetric o) :
      q.charge sign A =
        ∫ x in A, hilbertSchmidtSq (signedCollarWeylBlock o q.metric q.frame sign x)
          ∂riemannianVolumeMeasure I M q.metric :=
    energyMeasure_real_apply hA (q.integrable sign).integrableOn
      (Eventually.of_forall fun x => Finset.sum_nonneg fun a _ =>
        Finset.sum_nonneg fun b _ => sq_nonneg (signedCollarWeylBlock o q.metric q.frame sign x a b))
  rw [hCharge g, hCharge h, chiralIntegral_eq_referenceDensity g.metric h.metric hA]
  apply setIntegral_congr_fun hA
  intro x hx
  have hMetric := (hGerm x hx).self_of_nhds
  have hCurv := metricRm04At_eq_of_metric_eventuallyEq g.metric h.metric x (hGerm x hx)
  have hTensor : metricCurvatureFrameTensor g.metric o x (g.frame x) =
      metricCurvatureFrameTensor h.metric o x (h.frame x) := by
    funext i j k l
    change metricRm04StandardAt g.metric x ((g.frame x).basis i) ((g.frame x).basis j)
      ((g.frame x).basis l) ((g.frame x).basis k) =
        metricRm04StandardAt h.metric x ((h.frame x).basis i) ((h.frame x).basis j)
          ((h.frame x).basis l) ((h.frame x).basis k)
    simp only [metricRm04StandardAt_apply, hFrame x hx, hCurv]
  have hGram : chartGramMatrix h.metric x x = chartGramMatrix g.metric x x := by
    ext i j
    simp only [chartGramMatrix_apply, hMetric]
  have hChart : chartDensity h.metric x x = chartDensity g.metric x x := by
    simp only [chartDensity, hGram]
  have hChartPos : 0 < chartDensity g.metric x x :=
    chartDensity_pos _ _ (show x ∈ (chartAt H x).source from mem_chart_source H x)
  have hDensity : riemannianVolumeDensity g.metric h.metric x = 1 := by
    rw [riemannianVolumeDensity_apply_of_mem_chart_source _ _ x (mem_chart_source H x), hChart,
      div_self hChartPos.ne']
  cases sign <;> simp [chiralHSDensity, hDensity, signedCollarWeylBlock, geometricChiralBlock,
    endpointNegativeWeylBlock, hTensor]

/-- The signed saving is the complete incoming inner charge minus the exact
increase on the retained transition. A positive endpoint on the fixed type
has this same saving in both signs, bounded by its source's finite excess. -/
theorem selectedReference_endpoint_saving (g h : SignedCollarMetric o)
    {A C : Set M} (hA : MeasurableSet A) (hC : MeasurableSet C) (hAC : Disjoint A C)
    (hFlat : ∀ sign, h.charge sign A = 0)
    (hExterior : ∀ sign, g.charge sign (A ∪ C)ᶜ = h.charge sign (A ∪ C)ᶜ)
    (hPositive : 0 < classYamabeFour o.dimension_eq h.metric) (sign : CollarChirality) :
    let saving := g.charge sign A - (h.charge sign C - g.charge sign C)
    saving = g.energy .plus - h.energy .plus ∧
      saving ≤ g.energy .plus - sInf (geometricPositiveEnergies o) := by
  intro saving
  have hSplit (s : SignedCollarMetric o) :
      s.charge sign (A ∪ C) = s.charge sign A + s.charge sign C :=
    measureReal_union hAC hC
  have hTotal := signedCoreSaving_eq_energySaving g h (hA.union hC) sign (hExterior sign)
  rw [hSplit g, hSplit h, hFlat sign] at hTotal
  have hEq : saving = g.energy .plus - h.energy .plus := by
    dsimp [saving]
    linarith only [hTotal]
  exact ⟨hEq, hEq.le.trans (sub_le_sub_left
    (csInf_le (geometricPositiveEnergies_bddBelow o) (h.energy_mem_of_positive hPositive)) _)⟩

/-- Test a strict, positive saving on the same physical endpoint, using
the zero inner curvature and exact exterior germs. The upper bound on the
retained signed transition cost can have either sign. -/
theorem selectedReference_positive_saving_of_cost_lt (g h : SignedCollarMetric o)
    {A C : Set M} (hA : MeasurableSet A) (hC : MeasurableSet C) (hAC : Disjoint A C)
    (hFlat : ∀ x ∈ A, metricRm04At h.metric x = 0)
    (hGerm : ∀ x ∈ (A ∪ C)ᶜ, ∀ᶠ y in 𝓝 x, ∀ u v : TangentSpace I y,
      g.metric.inner y u v = h.metric.inner y u v)
    (hFrame : ∀ x ∈ (A ∪ C)ᶜ, (g.frame x).basis = (h.frame x).basis)
    (hPositive : 0 < classYamabeFour o.dimension_eq h.metric)
    (sign : CollarChirality) {cost : ℝ}
    (hCost : h.charge sign C - g.charge sign C ≤ cost)
    (hStrict : cost < g.charge sign A) :
    0 < g.charge sign A - cost ∧
      g.charge sign A - cost ≤ g.energy .plus - h.energy .plus ∧
      g.charge sign A - cost ≤ g.energy .plus - sInf (geometricPositiveEnergies o) := by
  obtain ⟨hEq, hLe⟩ := selectedReference_endpoint_saving g h hA hC hAC
    (selectedReference_charge_eq_zero_of_flat h hA hFlat)
    (selectedReference_charge_eq_of_germ g h (hA.union hC).compl hGerm hFrame)
    hPositive sign
  exact ⟨sub_pos.mpr hStrict, (sub_le_sub_left hCost _).trans_eq hEq,
    (sub_le_sub_left hCost _).trans hLe⟩

/-- Apply the finite gain test at the actual inner cut of the chosen
splice, with the complete complement and the actual transition charged once. -/
theorem selectedEuclideanSplice_positive_saving (g h : SignedCollarMetric o)
    (F : PartialDiffeomorph I₄ I E₄ M ∞) (n : ℕ) (hn : 0 < n)
    (G : SmoothRiemannianMetric I₄ E₄) (V : TopologicalSpace.Opens E₄)
    (hBuffer : Metric.closedBall (0 : E₄) (1 + 1 / ((n : ℝ) + 1)) ⊆ (V : Set E₄))
    (hV : (V : Set E₄) ⊆ F.source)
    (hSplice : ∀ x ∈ V, ∀ u v : E₄,
      (selectedModelSplice G (euclideanMetric (E := E₄)) 1 (1 / ((n : ℝ) + 1))
        (by exact ⟨zero_le_one, le_rfl⟩)).inner x u v =
        h.metric.inner (F x) (mfderiv I₄ I (F : E₄ → M) x u) (mfderiv I₄ I (F : E₄ → M) x v))
    (hGerm : ∀ x ∉ selectedChartDisk F ∪ selectedDiskTrim F n, ∀ᶠ y in 𝓝 x,
      ∀ u v : TangentSpace I y, g.metric.inner y u v = h.metric.inner y u v)
    (hFrame : ∀ x ∉ selectedChartDisk F ∪ selectedDiskTrim F n,
      (g.frame x).basis = (h.frame x).basis)
    (hPositive : 0 < classYamabeFour o.dimension_eq h.metric)
    (sign : CollarChirality) {cost : ℝ}
    (hCost : h.charge sign (selectedDiskTrim F n) - g.charge sign (selectedDiskTrim F n) ≤ cost)
    (hStrict : cost < g.charge sign (F '' Metric.closedBall (0 : E₄) (1 - 1 / ((n : ℝ) + 1)))) :
    let gain := g.charge sign (F '' Metric.closedBall (0 : E₄) (1 - 1 / ((n : ℝ) + 1))) - cost
    0 < gain ∧ gain ≤ g.energy .plus - h.energy .plus ∧
      gain ≤ g.energy .plus - sInf (geometricPositiveEnergies o) := by
  obtain ⟨hA, hC, hAC, hUnion⟩ := selectedReference_innerDisk_partition F n (hBuffer.trans hV)
  obtain ⟨U, hU, _, _, hFlat⟩ := selectedEuclideanSplice_flat_near_innerDisk F n hn G h.metric V
    hBuffer hV hSplice
  apply selectedReference_positive_saving_of_cost_lt g h hA hC hAC ?_ ?_ ?_ hPositive sign hCost hStrict
  · rintro _ ⟨x, hx, rfl⟩
    exact hFlat x (hU hx)
  · intro x hx
    apply hGerm x
    rwa [hUnion] at hx
  · intro x hx
    apply hFrame x
    rwa [hUnion] at hx

end Energy

end

end SmoothPoincare
