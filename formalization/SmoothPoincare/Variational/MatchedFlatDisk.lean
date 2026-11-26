import SmoothPoincare.Variational.SelectedDiskReference

/-! # A flat replacement matched to a constant native collar Gram -/

open DifferentialGeometry DifferentialGeometry.Geometry.Curvature DifferentialGeometry.Tensor0SBundle
open DifferentialGeometry.Integral.Measure FirstOrderTwistor Filter Manifold MeasureTheory Set
open scoped ContDiff Manifold Topology

namespace SmoothPoincare

noncomputable section

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "I₄" => 𝓘(ℝ, E₄)

/-- The constant reference in the native coordinates. The linear equivalence
specifies the metric; it does not move the marked disk or its trim. -/
def nativeConstantMetric (L : E₄ ≃L[ℝ] E₄) : SmoothRiemannianMetric I₄ E₄ :=
  Diffeomorph.pullbackMetricCross (euclideanMetric (E := E₄)) L.toDiffeomorph

theorem nativeConstantMetric_inner (L : E₄ ≃L[ℝ] E₄) (x u v : E₄) :
    (nativeConstantMetric L).inner x u v = inner ℝ (L u) (L v) := by
  have hD : mfderiv I₄ I₄ (L.toDiffeomorph : E₄ → E₄) x = (L : E₄ →L[ℝ] E₄) :=
    mfderiv_eq_fderiv.trans (L : E₄ →L[ℝ] E₄).fderiv
  exact (Diffeomorph.pullbackMetricCross_inner (euclideanMetric (E := E₄)) L.toDiffeomorph x u v).trans
    (by rw [hD]; exact euclideanMetric_inner (L x) (L u) (L v))

/-- A constant positive native Gram contributes no covariant curvature in any slots. -/
theorem nativeConstantMetric_flat (L : E₄ ≃L[ℝ] E₄) (x : E₄) :
    metricRm04At (nativeConstantMetric L) x = 0 := by
  ext v
  have hv : vec4 (v 0) (v 1) (v 2) (v 3) = v := by
    funext i
    fin_cases i <;> rfl
  have h := metricRm04Standard_pullbackCross (euclideanMetric (E := E₄))
    L.toDiffeomorph x (v 0) (v 1) (v 2) (v 3)
  simp only [metricRm04StandardAt_apply, hv,
    DifferentialGeometry.Geometry.euclideanMetric_metricRm04At_eq_zero] at h
  exact h

section Construction

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]

omit [T2Space M] in
/-- Freezing the actual pullback at a specified native point supplies the
constant reference by the differential of the marking and an orthonormal
basis of the physical tangent fiber. -/
theorem exists_nativeConstantMetric_at (o : ManifoldOrientation I M 4)
    (g : SmoothRiemannianMetric I M) (F : PartialDiffeomorph I₄ I E₄ M ∞)
    (x : E₄) (hx : x ∈ F.source) :
    ∃ L : E₄ ≃L[ℝ] E₄, ∀ z u v : E₄, (nativeConstantMetric L).inner z u v =
      g.inner (F x) (mfderiv I₄ I (F : E₄ → M) x u) (mfderiv I₄ I (F : E₄ → M) x v) := by
  let y := F x
  obtain ⟨e, he⟩ : ∃ e : TangentSpace I y ≃ₗ[ℝ] E₄, ∀ u v : TangentSpace I y,
      inner ℝ (e u) (e v) = g.inner y u v := by
    let D := (tangentMetricData g y).metric
    let : InnerProductSpace.Core ℝ (TangentSpace I y) := D.toCore
    let : NormedAddCommGroup (TangentSpace I y) :=
      @InnerProductSpace.Core.toNormedAddCommGroup ℝ (TangentSpace I y) _ _ _ D.toCore
    let : InnerProductSpace ℝ (TangentSpace I y) :=
      @InnerProductSpace.ofCore ℝ (TangentSpace I y) _ _ _ D.toCore.toCore
    let b := (o.orientation y).finOrthonormalBasis (by decide)
      (show Module.finrank ℝ (TangentSpace I y) = 4 from o.dimension_eq)
    refine ⟨b.repr.toLinearEquiv, fun u v => (b.repr.inner_map_map u v).trans ?_⟩
    rw [← TangentMetricData.inner_eq (tangentMetricData g y)]
    exact MetricFiberData.toCore_inner D u v
  let d := (PartialDiffeomorph.isLocalDiffeomorphAt I₄ I ∞ F hx).mfderivToContinuousLinearEquiv
    (by decide)
  refine ⟨d.trans e.toContinuousLinearEquiv, fun z u v => ?_⟩
  exact (nativeConstantMetric_inner _ z u v).trans (he (d u) (d v))

private theorem flat_of_nativeConstantMetric (h : SmoothRiemannianMetric I M)
    (F : PartialDiffeomorph I₄ I E₄ M ∞) (L : E₄ ≃L[ℝ] E₄) (U : TopologicalSpace.Opens E₄)
    (hU : (U : Set E₄) ⊆ F.source)
    (hNative : ∀ x ∈ U, ∀ u v : E₄, (nativeConstantMetric L).inner x u v =
      h.inner (F x) (mfderiv I₄ I (F : E₄ → M) x u) (mfderiv I₄ I (F : E₄ → M) x v))
    (x : U) : metricRm04At h (F x) = 0 := by
  let D := (PartialDiffeomorph.isLocalDiffeomorphAt I₄ I ∞ F (hU x.property)).mfderivToContinuousLinearEquiv (by decide)
  ext v
  let u := fun i => D.symm (v i)
  have hApply (i : Fin 4) : mfderiv I₄ I (F : E₄ → M) x.val (u i) = v i :=
    D.apply_symm_apply (v i)
  have heq := metricRm04StandardAt_eq_of_partialDiffeomorph_restriction F U hU
    (nativeConstantMetric L) h (fun z => hNative z z.property) x (u 0) (u 1) (u 2) (u 3)
  simp only [hApply, metricRm04StandardAt_apply, nativeConstantMetric_flat] at heq
  have hvec : vec4 (v 0) (v 1) (v 2) (v 3) = v := by
    funext i
    fin_cases i <;> rfl
  simpa [hvec] using heq.symm

omit [T2Space M] in
private theorem affineMetric_inner (g b : SmoothRiemannianMetric I M) (χ : M → ℝ)
    (hχ : ContMDiff I 𝓘(ℝ) ∞ χ) (hχ01 : ∀ y, χ y ∈ Icc (0 : ℝ) 1)
    (t : ℝ) (ht : t ∈ Icc (0 : ℝ) 1) (y : M) (u v : TangentSpace I y) :
    (chartSpliceMetric g b χ hχ hχ01 t ht).inner y u v =
      (1 - t * χ y) * g.inner y u v + t * χ y * b.inner y u v := by
  have h : ∀ z, t * χ z ∈ Icc (0 : ℝ) 1 := fun z =>
    ⟨mul_nonneg ht.1 (hχ01 z).1, (mul_le_of_le_one_left (hχ01 z).1 ht.2).trans (hχ01 z).2⟩
  simpa only [smul_eq_mul, add_comm, chartSpliceMetric] using
    convexComb_inner b g (fun z => t * χ z) (contMDiff_const.mul hχ) h y u v

/-- A single affine metric path on the original source and original disk.
Its full trim is unchanged and flat at every parameter. Its time-one
metric is the native constant reference on a neighborhood of the whole disk. -/
theorem exists_selectedMatchedFlatDisk [SigmaCompactSpace M]
    (g : SmoothRiemannianMetric I M) (F : PartialDiffeomorph I₄ I E₄ M ∞)
    (n : ℕ) (hn : 0 < n) (L : E₄ ≃L[ℝ] E₄)
    (hBuffer : Metric.closedBall (0 : E₄) (1 + 1 / ((n : ℝ) + 1)) ⊆ F.source)
    (U : TopologicalSpace.Opens E₄) (hUsrc : (U : Set E₄) ⊆ F.source)
    (hTrim : {x : E₄ | |‖x‖ - 1| ≤ 1 / ((n : ℝ) + 1)} ⊆ (U : Set E₄))
    (hMatch : ∀ x ∈ U, ∀ u v : E₄, (nativeConstantMetric L).inner x u v =
      g.inner (F x) (mfderiv I₄ I (F : E₄ → M) x u) (mfderiv I₄ I (F : E₄ → M) x v)) :
    ∃ (χ : M → ℝ) (hχ : ContMDiff I 𝓘(ℝ) ∞ χ) (hχ01 : ∀ y, χ y ∈ Icc (0 : ℝ) 1)
      (b : SmoothRiemannianMetric I M) (V : TopologicalSpace.Opens E₄),
      let path := chartSpliceMetric g b χ hχ hχ01
      let B := selectedChartDisk F
      let C := selectedDiskTrim F n
      Metric.closedBall (0 : E₄) 1 ⊆ (V : Set E₄) ∧
      (V : Set E₄) ⊆ F.source ∧
      path 0 ⟨le_rfl, zero_le_one⟩ = g ∧
      (∀ x ∈ V, ∀ u v : E₄, (nativeConstantMetric L).inner x u v =
        (path 1 ⟨zero_le_one, le_rfl⟩).inner (F x)
          (mfderiv I₄ I (F : E₄ → M) x u) (mfderiv I₄ I (F : E₄ → M) x v)) ∧
      (∀ y ∈ B, metricRm04At (path 1 ⟨zero_le_one, le_rfl⟩) y = 0) ∧
      (∀ y ∈ C, metricRm04At g y = 0 ∧
        ∀ (t : ℝ) (ht : t ∈ Icc (0 : ℝ) 1), metricRm04At (path t ht) y = 0) ∧
      (∀ y ∈ C, ∀ u v : TangentSpace I y, ∀ t : ℝ, ∀ ht : t ∈ Icc (0 : ℝ) 1,
        (path t ht).inner y u v = g.inner y u v) ∧
      ∀ y ∉ interior B, ∀ᶠ z in 𝓝 y, ∀ u v : TangentSpace I z, ∀ t : ℝ, ∀ ht : t ∈ Icc (0 : ℝ) 1,
        (path t ht).inner z u v = g.inner z u v := by
  let w : ℝ := 1 / ((n : ℝ) + 1)
  have hw : 0 < w := by dsimp [w]; positivity
  have hw' : w < 1 := by
    dsimp [w]
    exact (div_lt_one (by positivity)).2 (by exact_mod_cast Nat.succ_lt_succ hn)
  let B := selectedChartDisk F
  let C := selectedDiskTrim F n
  let A := F '' Metric.closedBall (0 : E₄) (1 - w)
  have hab : Metric.closedBall (0 : E₄) (1 - w) ⊆ Metric.closedBall (0 : E₄) 1 :=
    Metric.closedBall_subset_closedBall (by linarith)
  have hbb : Metric.closedBall (0 : E₄) 1 ⊆ Metric.closedBall (0 : E₄) (1 + w) :=
    Metric.closedBall_subset_closedBall (by linarith)
  have hASrc := hab.trans (hbb.trans hBuffer)
  have hAClosed : IsClosed A :=
    ((isCompact_closedBall _ _).image_of_continuousOn
      (F.contMDiffOn_toFun.continuousOn.mono hASrc)).isClosed
  have hAInterior : A ⊆ interior B := by
    rw [interior_selectedChartDisk F (hbb.trans hBuffer)]
    apply image_mono
    intro x hx
    rw [Metric.mem_closedBall, dist_zero_right] at hx
    rw [Metric.mem_ball, dist_zero_right]
    linarith
  obtain ⟨χ, hχ, hχ01, hχNative, hχZero⟩ := exists_selectedMarkedRadialCutoff F n hBuffer
  obtain ⟨b, W, hW, hWSrc, hB, _⟩ :=
    PartialDiffeomorph.exists_metric_preserving_on_neighborhood_of_is_compact
      F (nativeConstantMetric L) g (isCompact_closedBall _ _) hBuffer
  let path := chartSpliceMetric g b χ hχ hχ01
  let R : TopologicalSpace.Opens E₄ := U ⊓ W
  let V : TopologicalSpace.Opens E₄ :=
    ⟨(W : Set E₄) ∩ ({x | ‖x‖ ^ 2 < 1 - w} ∪ (U : Set E₄)),
      W.isOpen.inter ((isOpen_lt (continuous_norm.pow 2) continuous_const).union U.isOpen)⟩
  have hV : Metric.closedBall (0 : E₄) 1 ⊆ (V : Set E₄) := by
    intro x hx
    have hNorm : ‖x‖ ≤ 1 := by simpa only [Metric.mem_closedBall, dist_zero_right] using hx
    refine ⟨hW (hbb hx), ?_⟩
    by_cases h : ‖x‖ < 1 - w
    · left
      change ‖x‖ ^ 2 < 1 - w
      have hSq := pow_lt_pow_left₀ h (norm_nonneg x) (by decide : 2 ≠ 0)
      have hProduct := mul_pos hw (sub_pos.mpr hw')
      nlinarith only [hSq, hProduct]
    · right
      apply hTrim
      change |‖x‖ - 1| ≤ w
      rw [abs_of_nonpos (sub_nonpos.mpr hNorm)]
      linarith only [le_of_not_gt h]
  have hNative (x : E₄) (hx : x ∈ V) (u v : E₄) :
      (nativeConstantMetric L).inner x u v =
        (path 1 ⟨zero_le_one, le_rfl⟩).inner (F x)
          (mfderiv I₄ I (F : E₄ → M) x u) (mfderiv I₄ I (F : E₄ → M) x v) := by
    have hAff := affineMetric_inner g b χ hχ hχ01 1 ⟨zero_le_one, le_rfl⟩ (F x)
      (mfderiv I₄ I (F : E₄ → M) x u) (mfderiv I₄ I (F : E₄ → M) x v)
    refine Eq.trans ?_ hAff.symm
    rcases hx.2 with h | h
    · rw [hχNative x (hWSrc hx.1), selectedRadialCutoff_eq_one hw (le_of_lt h), hB x hx.1 u v]
      ring
    · rw [← hB x hx.1 u v, ← hMatch x h u v]
      ring
  have hR (y : M) (hy : y ∈ C) : ∃ x : R, F x = y := by
    rw [show C = F '' {z : E₄ | |‖z‖ - 1| < w} from selectedDiskTrim_eq_full_image F n hBuffer] at hy
    obtain ⟨x, hx, rfl⟩ := hy
    have hr : |‖x‖ - 1| < w := hx
    have hxb : x ∈ Metric.closedBall (0 : E₄) (1 + w) := by
      rw [Metric.mem_closedBall, dist_zero_right]
      linarith only [(abs_lt.mp hr).2]
    exact ⟨⟨x, hTrim hr.le, hW hxb⟩, rfl⟩
  have hC (x : R) (t : ℝ) (ht : t ∈ Icc (0 : ℝ) 1) (u v : E₄) :
      (nativeConstantMetric L).inner x u v = (path t ht).inner (F x)
        (mfderiv I₄ I (F : E₄ → M) x u) (mfderiv I₄ I (F : E₄ → M) x v) := by
    have hAff := affineMetric_inner g b χ hχ hχ01 t ht (F x)
      (mfderiv I₄ I (F : E₄ → M) x u) (mfderiv I₄ I (F : E₄ → M) x v)
    refine Eq.trans ?_ hAff.symm
    rw [← hB x x.property.2 u v, ← hMatch x x.property.1 u v]
    ring
  have hMatchC (z : M) (hz : z ∈ C) (u v : TangentSpace I z)
      (t : ℝ) (ht : t ∈ Icc (0 : ℝ) 1) :
      (path t ht).inner z u v = g.inner z u v := by
    obtain ⟨x, rfl⟩ := hR z hz
    let D := (PartialDiffeomorph.isLocalDiffeomorphAt I₄ I ∞ F
      (hUsrc x.property.1)).mfderivToContinuousLinearEquiv (by decide)
    have hu : mfderiv I₄ I (F : E₄ → M) x.val (D.symm u) = u := D.apply_symm_apply u
    have hv : mfderiv I₄ I (F : E₄ → M) x.val (D.symm v) = v := D.apply_symm_apply v
    simpa only [hu, hv] using (hC x t ht (D.symm u) (D.symm v)).symm.trans
      (hMatch x x.property.1 (D.symm u) (D.symm v))
  refine ⟨χ, hχ, hχ01, b, V, hV, fun _ hx => hWSrc hx.1, ?_, hNative, ?_, ?_, hMatchC, ?_⟩
  · apply SmoothRiemannianMetric.ext_inner
    intro x u v
    have h := affineMetric_inner g b χ hχ hχ01 0 ⟨le_rfl, zero_le_one⟩ x u v
    simpa using h
  · rintro _ ⟨x, hx, rfl⟩
    exact flat_of_nativeConstantMetric _ F L V (fun _ hz => hWSrc hz.1) hNative ⟨x, hV hx⟩
  · intro y hy
    obtain ⟨x, rfl⟩ := hR y hy
    refine ⟨flat_of_nativeConstantMetric g F L U hUsrc hMatch ⟨x, x.property.1⟩, ?_⟩
    intro t ht
    exact flat_of_nativeConstantMetric _ F L R (fun _ hz => hUsrc hz.1)
      (fun z hz => hC ⟨z, hz⟩ t ht) x
  · intro y hy
    have hMissing : y ∉ A := fun ha => hy (hAInterior ha)
    filter_upwards [hAClosed.isOpen_compl.mem_nhds hMissing] with z hz
    intro u v t ht
    by_cases hIn : z ∈ B ∪ C
    · have hPartition := (selectedReference_innerDisk_partition F n hBuffer).2.2.2
      have hIn' : z ∈ A ∪ C := hPartition ▸ hIn
      exact hMatchC z (hIn'.resolve_left hz) u v t ht
    · rw [affineMetric_inner, hχZero z hIn]
      ring

end Construction

section Energy

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  [CompactSpace M] [Nonempty M] {o : ManifoldOrientation I M 4}

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

omit [I.Boundaryless] [Nonempty M] in
/-- Both raw and current chiral charges vanish on the actual trim. The
matched construction provides both curvature hypotheses at every time. -/
theorem selectedMatchedFlatDisk_trim_charge (g h : SignedCollarMetric o)
    (F : PartialDiffeomorph I₄ I E₄ M ∞) (n : ℕ)
    (hg : ∀ y ∈ selectedDiskTrim F n, metricRm04At g.metric y = 0)
    (hh : ∀ y ∈ selectedDiskTrim F n, metricRm04At h.metric y = 0)
    (sign : CollarChirality) :
    g.charge sign (selectedDiskTrim F n) = 0 ∧ h.charge sign (selectedDiskTrim F n) = 0 := by
  have hMeas := (isOpen_selectedDiskTrim F n).measurableSet
  exact ⟨selectedReference_charge_eq_zero_of_flat g hMeas hg sign,
    selectedReference_charge_eq_zero_of_flat h hMeas hh sign⟩

/-- The positive endpoint realized by the matched construction loses exactly
the original disk charge in both signs. Its energy is the incoming charge
of the complete closed exterior of the original unit disk. -/
theorem selectedMatchedFlatDisk_exact_saving (g h : SignedCollarMetric o)
    (F : PartialDiffeomorph I₄ I E₄ M ∞)
    (hDisk : Metric.closedBall (0 : E₄) 1 ⊆ F.source)
    (hFlat : ∀ y ∈ selectedChartDisk F, metricRm04At h.metric y = 0)
    (hGerm : ∀ x ∉ interior (selectedChartDisk F), ∀ᶠ y in 𝓝 x,
      ∀ u v : TangentSpace I y, g.metric.inner y u v = h.metric.inner y u v)
    (hFrame : ∀ x ∉ interior (selectedChartDisk F), (g.frame x).basis = (h.frame x).basis)
    (hPos : 0 < classYamabeFour o.dimension_eq h.metric) (sign : CollarChirality) :
    let B := selectedChartDisk F
    h.charge sign B = 0 ∧ h.energy sign = g.charge sign (interior B)ᶜ ∧
      g.charge sign B = g.energy .plus - h.energy .plus ∧
      g.charge sign B ≤ g.energy .plus - sInf (geometricPositiveEnergies o) := by
  intro B
  have hB : MeasurableSet B := (isCompact_selectedChartDisk F hDisk).isClosed.measurableSet
  have hZero := selectedReference_charge_eq_zero_of_flat h hB hFlat sign
  have hFix := selectedReference_charge_eq_of_germ g h isOpen_interior.measurableSet.compl
    hGerm hFrame sign
  have hIncoming := signedCharge_fullMarkedExterior g sign F hDisk
  have hEndpoint := signedCharge_fullMarkedExterior h sign F hDisk
  change h.charge sign (interior B)ᶜ = h.energy .plus - h.charge sign B at hEndpoint
  rw [hZero, sub_zero] at hEndpoint
  have hSignature : h.energy sign = h.energy .plus := by
    cases sign
    · rfl
    · exact h.signature_zero.symm
  have hSaving : g.charge sign B = g.energy .plus - h.energy .plus := by
    change g.charge sign (interior B)ᶜ = g.energy .plus - g.charge sign B at hIncoming
    linarith only [hIncoming, hFix, hEndpoint]
  refine ⟨hZero, hSignature.trans (hFix.trans hEndpoint).symm, hSaving, ?_⟩
  exact hSaving.le.trans (sub_le_sub_left
    (csInf_le (geometricPositiveEnergies_bddBelow o) (h.energy_mem_of_positive hPos)) _)

end Energy

end

end SmoothPoincare
