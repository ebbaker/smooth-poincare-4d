import SmoothPoincare.Variational.SelectedDiskReference
import SmoothPoincare.Variational.BalancedPhysicalDivision

/-! # A curved replacement with exactly matched native trim -/

open DifferentialGeometry DifferentialGeometry.Geometry.Curvature
open FirstOrderTwistor Filter Manifold MeasureTheory Set
open scoped ContDiff Manifold Topology

namespace SmoothPoincare

noncomputable section

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "I₄" => 𝓘(ℝ, E₄)

section Construction

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]

/-- Nonzero native curvature in an exact open pullback germ gives
nonzero physical curvature at its image. -/
theorem nativeCurvedGerm_nonflat (r : SmoothRiemannianMetric I₄ E₄)
    (h : SmoothRiemannianMetric I M) (F : PartialDiffeomorph I₄ I E₄ M ∞)
    (U : TopologicalSpace.Opens E₄) (hU : (U : Set E₄) ⊆ F.source)
    (hPull : ∀ x ∈ U, ∀ u v : E₄, r.inner x u v =
      h.inner (F x) (mfderiv I₄ I (F : E₄ → M) x u) (mfderiv I₄ I (F : E₄ → M) x v))
    (x : U) (hCurv : metricRm04At r x.val ≠ 0) : metricRm04At h (F x) ≠ 0 := by
  intro hFlat
  apply hCurv
  ext v
  have hSlots : vec4 (v 0) (v 1) (v 2) (v 3) = v := by
    funext i
    fin_cases i <;> rfl
  have heq := metricRm04StandardAt_eq_of_partialDiffeomorph_restriction F U hU
    r h (fun z => hPull z z.property) x (v 0) (v 1) (v 2) (v 3)
  simpa [hSlots, hFlat] using heq

omit [T2Space M] in
private theorem curvedAffine_inner (g b : SmoothRiemannianMetric I M) (χ : M → ℝ)
    (hχ : ContMDiff I 𝓘(ℝ) ∞ χ) (hχ01 : ∀ y, χ y ∈ Icc (0 : ℝ) 1)
    (t : ℝ) (ht : t ∈ Icc (0 : ℝ) 1) (y : M) (u v : TangentSpace I y) :
    (chartSpliceMetric g b χ hχ hχ01 t ht).inner y u v =
      (1 - t * χ y) * g.inner y u v + t * χ y * b.inner y u v := by
  have hw : ∀ z, t * χ z ∈ Icc (0 : ℝ) 1 := fun z =>
    ⟨mul_nonneg ht.1 (hχ01 z).1, (mul_le_of_le_one_left (hχ01 z).1 ht.2).trans (hχ01 z).2⟩
  simpa only [smul_eq_mul, add_comm, chartSpliceMetric] using
    convexComb_inner b g (fun z => t * χ z) (contMDiff_const.mul hχ) hw y u v

/-- Extend the curved native reference and use the original marked cutoff.
The resulting affine family is positive definite, starts at the source,
and has exactly the incoming metric germs on the full native trim and
complete closed exterior. The original closed disk has an open
time-one germ given by the curved reference. -/
theorem exists_selectedMatchedCurvedDisk [SigmaCompactSpace M]
    (g : SmoothRiemannianMetric I M) (F : PartialDiffeomorph I₄ I E₄ M ∞)
    (n : ℕ) (hn : 0 < n) (r : SmoothRiemannianMetric I₄ E₄)
    (hBuffer : Metric.closedBall (0 : E₄) (1 + 1 / ((n : ℝ) + 1)) ⊆ F.source)
    (U : TopologicalSpace.Opens E₄)
    (hTrim : {x : E₄ | |‖x‖ - 1| ≤ 1 / ((n : ℝ) + 1)} ⊆ (U : Set E₄))
    (hMatch : ∀ x ∈ U, ∀ u v : E₄, r.inner x u v =
      g.inner (F x) (mfderiv I₄ I (F : E₄ → M) x u) (mfderiv I₄ I (F : E₄ → M) x v))
    (x₀ : E₄) (hx₀ : x₀ ∈ Metric.closedBall (0 : E₄) 1)
    (hCurv : metricRm04At r x₀ ≠ 0) :
    ∃ (χ : M → ℝ) (hχ : ContMDiff I 𝓘(ℝ) ∞ χ) (hχ01 : ∀ y, χ y ∈ Icc (0 : ℝ) 1)
      (b : SmoothRiemannianMetric I M) (V : TopologicalSpace.Opens E₄),
      let path := chartSpliceMetric g b χ hχ hχ01
      let B := selectedChartDisk F
      let C := selectedDiskTrim F n
      Metric.closedBall (0 : E₄) 1 ⊆ (V : Set E₄) ∧
      (V : Set E₄) ⊆ F.source ∧
      path 0 ⟨le_rfl, zero_le_one⟩ = g ∧
      (∀ x ∈ V, ∀ u v : E₄, r.inner x u v =
        (path 1 ⟨zero_le_one, le_rfl⟩).inner (F x)
          (mfderiv I₄ I (F : E₄ → M) x u) (mfderiv I₄ I (F : E₄ → M) x v)) ∧
      metricRm04At (path 1 ⟨zero_le_one, le_rfl⟩) (F x₀) ≠ 0 ∧
      ∀ y ∈ C ∪ (interior B)ᶜ, ∀ᶠ z in 𝓝 y,
        ∀ u v : TangentSpace I z, ∀ t : ℝ, ∀ ht : t ∈ Icc (0 : ℝ) 1,
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
  have hPartition := selectedReference_innerDisk_partition F n hBuffer
  obtain ⟨χ, hχ, hχ01, hχNative, hχZero⟩ := exists_selectedMarkedRadialCutoff F n hBuffer
  obtain ⟨b, W, hW, hWSrc, hB, _⟩ :=
    PartialDiffeomorph.exists_metric_preserving_on_neighborhood_of_is_compact
      F r g (isCompact_closedBall _ _) hBuffer
  let path := chartSpliceMetric g b χ hχ hχ01
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
      r.inner x u v = (path 1 ⟨zero_le_one, le_rfl⟩).inner (F x)
        (mfderiv I₄ I (F : E₄ → M) x u) (mfderiv I₄ I (F : E₄ → M) x v) := by
    have hAff := curvedAffine_inner g b χ hχ hχ01 1 ⟨zero_le_one, le_rfl⟩ (F x)
      (mfderiv I₄ I (F : E₄ → M) x u) (mfderiv I₄ I (F : E₄ → M) x v)
    refine Eq.trans ?_ hAff.symm
    rcases hx.2 with h | h
    · rw [hχNative x (hWSrc hx.1), selectedRadialCutoff_eq_one hw (le_of_lt h), hB x hx.1 u v]
      ring
    · rw [← hB x hx.1 u v, ← hMatch x h u v]
      ring
  have hSameTrim (y : M) (hy : y ∈ C) (u v : TangentSpace I y) (t : ℝ)
      (ht : t ∈ Icc (0 : ℝ) 1) : (path t ht).inner y u v = g.inner y u v := by
    rw [show C = F '' {z : E₄ | |‖z‖ - 1| < w} from selectedDiskTrim_eq_full_image F n hBuffer] at hy
    obtain ⟨x, hx, rfl⟩ := hy
    have hr : |‖x‖ - 1| < w := hx
    have hxb : x ∈ Metric.closedBall (0 : E₄) (1 + w) := by
      rw [Metric.mem_closedBall, dist_zero_right]
      linarith only [(abs_lt.mp hr).2]
    have hxs := hBuffer hxb
    let D := (PartialDiffeomorph.isLocalDiffeomorphAt I₄ I ∞ F hxs).mfderivToContinuousLinearEquiv
      (by decide)
    have hu : mfderiv I₄ I (F : E₄ → M) x (D.symm u) = u := D.apply_symm_apply u
    have hv : mfderiv I₄ I (F : E₄ → M) x (D.symm v) = v := D.apply_symm_apply v
    have hEq := (hB x (hW hxb) (D.symm u) (D.symm v)).symm.trans
      (hMatch x (hTrim hr.le) (D.symm u) (D.symm v))
    simp only [hu, hv] at hEq
    have hAff := curvedAffine_inner g b χ hχ hχ01 t ht (F x) u v
    rw [hAff, hEq]
    ring
  refine ⟨χ, hχ, hχ01, b, V, hV, fun _ hx => hWSrc hx.1, ?_, hNative, ?_, ?_⟩
  · apply SmoothRiemannianMetric.ext_inner
    intro x u v
    simpa using curvedAffine_inner g b χ hχ hχ01 0 ⟨le_rfl, zero_le_one⟩ x u v
  · exact nativeCurvedGerm_nonflat r _ F V (fun _ hx => hWSrc hx.1) hNative ⟨x₀, hV hx₀⟩ hCurv
  · intro y hy
    have hMissing : y ∉ A := by
      rcases hy with h | h
      · exact fun ha => disjoint_left.mp hPartition.2.2.1 ha h
      · exact fun ha => h (hAInterior ha)
    filter_upwards [hAClosed.isOpen_compl.mem_nhds hMissing] with z hz
    intro u v t ht
    by_cases hIn : z ∈ B ∪ C
    · have hIn' : z ∈ A ∪ C := hPartition.2.2.2 ▸ hIn
      exact hSameTrim z (hIn'.resolve_left hz) u v t ht
    · rw [curvedAffine_inner, hχZero z hIn]
      ring

/-- If a supplied curved replacement differs only on the protected inner
disk, the exact-width splice realizes the ordinary affine path everywhere
and reaches that same ambient replacement. -/
theorem exists_selectedClampedCorePath
    (g b : SmoothRiemannianMetric I M) (F : PartialDiffeomorph I₄ I E₄ M ∞)
    (n : ℕ) (hn : 0 < n)
    (hBuffer : Metric.closedBall (0 : E₄) (1 + 1 / ((n : ℝ) + 1)) ⊆ F.source)
    (hAgree : ∀ y ∉ F '' Metric.closedBall (0 : E₄) (1 - 1 / ((n : ℝ) + 1)),
      ∀ u v : TangentSpace I y, b.inner y u v = g.inner y u v) :
    ∃ (χ : M → ℝ) (hχ : ContMDiff I 𝓘(ℝ) ∞ χ) (hχ01 : ∀ y, χ y ∈ Icc (0 : ℝ) 1),
      let path := chartSpliceMetric g b χ hχ hχ01
      let A := F '' Metric.closedBall (0 : E₄) (1 - 1 / ((n : ℝ) + 1))
      path 0 ⟨le_rfl, zero_le_one⟩ = g ∧ path 1 ⟨zero_le_one, le_rfl⟩ = b ∧
      (∀ y : M, ∀ u v : TangentSpace I y, ∀ t : ℝ, ∀ ht : t ∈ Icc (0 : ℝ) 1,
        (path t ht).inner y u v = (1 - t) * g.inner y u v + t * b.inner y u v) ∧
      ∀ y ∉ A, ∀ᶠ z in 𝓝 y, ∀ u v : TangentSpace I z, ∀ t : ℝ, ∀ ht : t ∈ Icc (0 : ℝ) 1,
        (path t ht).inner z u v = g.inner z u v := by
  let w : ℝ := 1 / ((n : ℝ) + 1)
  have hw : 0 < w := by dsimp [w]; positivity
  have hw' : w < 1 := by
    dsimp [w]
    exact (div_lt_one (by positivity)).2 (by exact_mod_cast Nat.succ_lt_succ hn)
  let A := F '' Metric.closedBall (0 : E₄) (1 - w)
  have hASrc : Metric.closedBall (0 : E₄) (1 - w) ⊆ F.source :=
    (Metric.closedBall_subset_closedBall (by change 1 - w ≤ 1 + w; linarith)).trans hBuffer
  have hClosed : IsClosed A :=
    ((isCompact_closedBall _ _).image_of_continuousOn
      (F.contMDiffOn_toFun.continuousOn.mono hASrc)).isClosed
  obtain ⟨χ, hχ, hχ01, hNative, _⟩ := exists_selectedMarkedRadialCutoff F n hBuffer
  let path := chartSpliceMetric g b χ hχ hχ01
  have hPath (y : M) (u v : TangentSpace I y) (t : ℝ) (ht : t ∈ Icc (0 : ℝ) 1) :
      (path t ht).inner y u v = (1 - t) * g.inner y u v + t * b.inner y u v := by
    rw [curvedAffine_inner]
    by_cases hy : y ∈ A
    · obtain ⟨x, hx, rfl⟩ := hy
      have hNorm : ‖x‖ ≤ 1 - w := by simpa only [Metric.mem_closedBall, dist_zero_right] using hx
      have hSq := pow_le_pow_left₀ (norm_nonneg x) hNorm 2
      have hProduct := mul_pos hw (sub_pos.mpr hw')
      have hChi : χ (F x) = 1 := (hNative x (hASrc hx)).trans
        (selectedRadialCutoff_eq_one hw (by nlinarith only [hSq, hProduct]))
      rw [hChi]
      ring
    · rw [hAgree y hy]
      ring
  refine ⟨χ, hχ, hχ01, ?_, ?_, hPath, ?_⟩
  · apply SmoothRiemannianMetric.ext_inner
    intro x u v
    simpa using hPath x u v 0 ⟨le_rfl, zero_le_one⟩
  · apply SmoothRiemannianMetric.ext_inner
    intro x u v
    simpa using hPath x u v 1 ⟨zero_le_one, le_rfl⟩
  · intro y hy
    filter_upwards [hClosed.isOpen_compl.mem_nhds hy] with z hz
    intro u v t ht
    rw [hPath, hAgree z hz]
    ring

end Construction

section Energy

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  [CompactSpace M] [Nonempty M] {o : ManifoldOrientation I M 4}

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

omit [I.Boundaryless] [Nonempty M] in
/-- For any signed slice of the clamped path, the chiral trim charges
agree exactly. The common value can be nonzero. -/
theorem selectedMatchedCurvedDisk_trim_charge (g h : SignedCollarMetric o)
    (F : PartialDiffeomorph I₄ I E₄ M ∞) (n : ℕ)
    (hGerm : ∀ x ∈ selectedDiskTrim F n, ∀ᶠ y in 𝓝 x,
      ∀ u v : TangentSpace I y, g.metric.inner y u v = h.metric.inner y u v)
    (hFrame : ∀ x ∈ selectedDiskTrim F n, (g.frame x).basis = (h.frame x).basis)
    (sign : CollarChirality) :
    h.charge sign (selectedDiskTrim F n) = g.charge sign (selectedDiskTrim F n) :=
  (selectedReference_charge_eq_of_germ g h (isOpen_selectedDiskTrim F n).measurableSet
    hGerm hFrame sign).symm

omit [Nonempty M] in
/-- Exact disk accounting for a matched slice. This identity also permits
testing the joined ceiling from the actual disk charges at every parameter. -/
theorem selectedMatchedCurvedDisk_energy (g h : SignedCollarMetric o)
    (F : PartialDiffeomorph I₄ I E₄ M ∞)
    (hDisk : Metric.closedBall (0 : E₄) 1 ⊆ F.source)
    (hGerm : ∀ x ∉ interior (selectedChartDisk F), ∀ᶠ y in 𝓝 x,
      ∀ u v : TangentSpace I y, g.metric.inner y u v = h.metric.inner y u v)
    (hFrame : ∀ x ∉ interior (selectedChartDisk F), (g.frame x).basis = (h.frame x).basis)
    (sign : CollarChirality) :
    let B := selectedChartDisk F
    h.energy .plus = g.charge sign (interior B)ᶜ + h.charge sign B ∧
      g.energy .plus - h.energy .plus = g.charge sign B - h.charge sign B := by
  intro B
  have hFix := selectedReference_charge_eq_of_germ g h isOpen_interior.measurableSet.compl
    hGerm hFrame sign
  have hIncoming := signedCharge_fullMarkedExterior g sign F hDisk
  have hSlice := signedCharge_fullMarkedExterior h sign F hDisk
  exact ⟨by linarith only [hFix, hSlice], by linarith only [hFix, hIncoming, hSlice]⟩

/-- The same-type infimum gives the minimum retained curved disk charge
at an actual positive endpoint. A strictly smaller disk charge is
equivalent to a strict whole-metric saving for this same endpoint. -/
theorem selectedMatchedCurvedDisk_cost_window (g h : SignedCollarMetric o)
    (F : PartialDiffeomorph I₄ I E₄ M ∞)
    (hDisk : Metric.closedBall (0 : E₄) 1 ⊆ F.source)
    (hGerm : ∀ x ∉ interior (selectedChartDisk F), ∀ᶠ y in 𝓝 x,
      ∀ u v : TangentSpace I y, g.metric.inner y u v = h.metric.inner y u v)
    (hFrame : ∀ x ∉ interior (selectedChartDisk F), (g.frame x).basis = (h.frame x).basis)
    (hPos : 0 < classYamabeFour o.dimension_eq h.metric) (sign : CollarChirality) :
    let B := selectedChartDisk F
    let I₀ := sInf (geometricPositiveEnergies o)
    I₀ - g.charge sign (interior B)ᶜ ≤ h.charge sign B ∧
      g.charge sign B - h.charge sign B ≤ g.energy .plus - I₀ ∧
      (h.charge sign B < g.charge sign B ↔ h.energy .plus < g.energy .plus) := by
  intro B I₀
  obtain ⟨hEnergy, hGain⟩ := selectedMatchedCurvedDisk_energy g h F hDisk hGerm hFrame sign
  have hInf : I₀ ≤ h.energy .plus :=
    csInf_le (geometricPositiveEnergies_bddBelow o) (h.energy_mem_of_positive hPos)
  refine ⟨by linarith only [hInf, hEnergy], by linarith only [hInf, hGain], ?_⟩
  constructor <;> intro hStrict <;> linarith only [hStrict, hGain]

/-- A positive endpoint with the exact curved trim and exterior has a
mandatory charge strictly inside the original disk away from the trim.
The finite estimate retains the raw protected-core correction. -/
theorem selectedMatchedCurvedDisk_core_charge_of_division
    (g h : SignedCollarMetric o) (σ ν : Measure M)
    (Q : PartialDiffeomorph I₄ I E₄ M ∞) (marks : NestedBalancedDisks I M)
    (k n : ℕ) {ε : ℝ} (div : BalancedPhysicalExteriorDivision g σ ν Q marks k ε)
    (hGerm : ∀ x ∈ selectedDiskTrim marks.outer n ∪ (interior (selectedChartDisk marks.outer))ᶜ,
      ∀ᶠ y in 𝓝 x, ∀ u v : TangentSpace I y, g.metric.inner y u v = h.metric.inner y u v)
    (hFrame : ∀ x ∈ selectedDiskTrim marks.outer n ∪ (interior (selectedChartDisk marks.outer))ᶜ,
      (g.frame x).basis = (h.frame x).basis)
    (hPos : 0 < classYamabeFour o.dimension_eq h.metric) (s : CollarChirality) :
    let B := selectedChartDisk marks.outer
    let C := selectedDiskTrim marks.outer n
    sInf (geometricPositiveEnergies o) - (1 / (2 : ℝ) ^ k) *
      (g.energy .plus - g.charge s (selectedChartDisk marks.core)) - ε - g.charge s (B ∩ C) <
        h.charge s (B \ C) := by
  intro B C
  have hB : MeasurableSet B :=
    (isCompact_selectedChartDisk marks.outer marks.outer_source).isClosed.measurableSet
  have hC : MeasurableSet C := (isOpen_selectedDiskTrim marks.outer n).measurableSet
  have hCollar := selectedReference_charge_eq_of_germ g h (hB.inter hC)
    (fun x hx => hGerm x (Or.inl hx.2)) (fun x hx => hFrame x (Or.inl hx.2)) s
  have hSplit : h.charge s (B ∩ C) + h.charge s (B \ C) = h.charge s B :=
    measureReal_inter_add_sdiff hC (measure_ne_top _ _)
  have hLower := (selectedMatchedCurvedDisk_cost_window g h marks.outer marks.outer_source
    (fun x hx => hGerm x (Or.inr hx)) (fun x hx => hFrame x (Or.inr hx)) hPos s).1
  have hRaw := (abs_lt.mp (div.chiral s)).2
  rw [← div.core_eq, signedCharge_fullMarkedExterior g s marks.core marks.core_source] at hRaw
  change g.charge s (interior B)ᶜ - _ < ε at hRaw
  change sInf (geometricPositiveEnergies o) - g.charge s (interior B)ᶜ ≤ h.charge s B at hLower
  linarith only [hCollar, hSplit, hLower, hRaw]

end Energy

end

end SmoothPoincare
