import DifferentialGeometry.Topology.Morse.Attachment.SublevelTransport
import DifferentialGeometry.Topology.Morse.SmoothMorseChart

/-! # The native two-handle at an isolated index-two point -/

open DifferentialGeometry.Topology DifferentialGeometry.Topology.Morse
open DifferentialGeometry.Topology.Morse.CellAttachment
open DifferentialGeometry.Topology.Morse.ManifoldCellAttachment
open scoped ContDiff Manifold

namespace SmoothPoincare

variable {H M : Type} [TopologicalSpace H] [TopologicalSpace M] [ChartedSpace H M]
  {I : ModelWithCorners ℝ (MorseModel 4) H} [I.Boundaryless] [IsManifold I ∞ M]
  {f : M → ℝ}

local notation "I₄" => morseModelWithCornersHalfSpace 3
local notation "I₂" => modelWithCornersEuclideanHalfSpace 2

private theorem two_le_four : (2 : ℕ) ≤ 4 := by decide

local notation "le₂₄" => two_le_four

local instance : Fact (Module.finrank ℝ (EuclideanSpace ℝ (Fin 2)) = (2 - 1) + 1) :=
  ⟨by simp⟩

/-- An actual smooth native two-handle attachment on the given manifold. The
    chosen regular cuts lie strictly in the original band. -/
structure IsolatedMiddleAttachment (fSmooth : ContMDiff I 𝓘(ℝ, ℝ) ∞ f)
    (p : M) (lo hi : ℝ) where
  chart : MorseChart 4 2 le₂₄ (f p) I f
  chart_point : chart.p = p
  chart_radius_lt : chart.R < chart.smoothRadius
  ε : ℝ
  ε_pos : 0 < ε
  r : ℝ
  r_pos : 0 < r
  attaching_radius : Real.sqrt (2 * ε + 2 * r ^ 2) ≤ chart.R
  lower_inside : lo < f p - ε
  upper_inside : f p + ε < hi
  lower_regular : ∀ x : M, f x = f p - ε → ¬ IsCriticalPointAt I f x
  upper_regular : ∀ x : M, f x = f p + ε → ¬ IsCriticalPointAt I f x
  η : ℝ
  η_pos : 0 < η
  traceCharts : ChartedSpace (MorseHalfSpace 3)
    (Handle.AdjunctionSpace 2 2 (morseAttachingEmbedding le₂₄ (f p) ε r chart ε_pos attaching_radius))
  trace_isManifold :
    letI := traceCharts
    IsManifold I₄ ∞
      (Handle.AdjunctionSpace 2 2 (morseAttachingEmbedding le₂₄ (f p) ε r chart ε_pos attaching_radius))
  upper_isManifold :
    letI := manifoldSublevelChartedSpace I f (f p + ε) fSmooth upper_regular
    IsManifold I₄ ∞ (SublevelSpace f (f p + ε))
  traceDiffeomorph :
    letI := traceCharts
    letI := manifoldSublevelChartedSpace I f (f p + ε) fSmooth upper_regular
    (Handle.AdjunctionSpace 2 2 (morseAttachingEmbedding le₂₄ (f p) ε r chart ε_pos attaching_radius))
      ≃ₘ^∞⟮I₄, I₄⟯ SublevelSpace f (f p + ε)
  lower_smooth :
    letI := traceCharts
    letI := manifoldSublevelChartedSpace I f (f p - ε) fSmooth lower_regular
    ContMDiff I₄ I₄ ∞
      (Handle.lower (morseAttachingEmbedding le₂₄ (f p) ε r chart ε_pos attaching_radius))
  handle_smooth :
    letI := traceCharts
    letI := Handle.standardHandleChartedSpace 2 2
    ContMDiff (ModelWithCorners.prod I₂ I₂) I₄ ∞
      (Handle.cell (morseAttachingEmbedding le₂₄ (f p) ε r chart ε_pos attaching_radius))
  fixes_deep_lower : ∀ x : M, f x ≤ f p - ε - η → ∀ hx : f x ≤ f p - ε,
    (traceDiffeomorph (Handle.lower
      (morseAttachingEmbedding le₂₄ (f p) ε r chart ε_pos attaching_radius) ⟨x, hx⟩)).1 = x
  deep_lower_preimage : ∀ x : M, (hxdeep : f x ≤ f p - ε - η) → ∀ hx : f x ≤ f p + ε,
    ∀ z, traceDiffeomorph z = ⟨x, hx⟩ → z = Handle.lower
      (morseAttachingEmbedding le₂₄ (f p) ε r chart ε_pos attaching_radius)
      ⟨x, le_trans hxdeep (sub_le_self _ η_pos.le)⟩

/-- The full framed tube lies smoothly in the actual incoming regular level. -/
theorem IsolatedMiddleAttachment.attachingTube_smooth
    {hf : ContMDiff I 𝓘(ℝ, ℝ) ∞ f} {p : M} {lo hi : ℝ}
    (D : IsolatedMiddleAttachment hf p lo hi) :
    letI := Handle.attachingRegionChartedSpace 2 2
    letI := manifoldLevelSetChartedSpace I f (f p - D.ε) hf D.lower_regular
    ContMDiff ((𝓡 1).prod I₂) 𝓘(ℝ, MorseModel 3) ∞
      (cocoreAttachingEmbedding le₂₄ (f p) D.ε D.r D.chart D.ε_pos D.attaching_radius) :=
  contMDiff_cocoreAttachingEmbedding le₂₄ (f p) D.ε D.r D.chart D.ε_pos D.attaching_radius
    (D.attaching_radius.trans_lt D.chart_radius_lt) hf D.lower_regular

theorem IsolatedMiddleAttachment.attachingTube_isClosedEmbedding [T2Space M]
    {hf : ContMDiff I 𝓘(ℝ, ℝ) ∞ f} {p : M} {lo hi : ℝ}
    (D : IsolatedMiddleAttachment hf p lo hi) :
    Topology.IsClosedEmbedding
      (cocoreAttachingEmbedding le₂₄ (f p) D.ε D.r D.chart D.ε_pos D.attaching_radius) :=
  isClosedEmbedding_cocoreAttachingEmbedding le₂₄ (f p) D.ε D.r D.chart D.ε_pos D.r_pos.ne'
    D.attaching_radius (D.attaching_radius.trans_lt D.chart_radius_lt) hf D.lower_regular

/-- An isolated nondegenerate index-two critical point in a fixed band of a compact
    smooth four-manifold gives a genuine native smooth two-handle attachment. -/
theorem exists_isolatedMiddleAttachment [T2Space M] [CompactSpace M]
    (hf : ContMDiff I 𝓘(ℝ, ℝ) ∞ f) (p : M) {lo hi : ℝ}
    (hlo : lo < f p) (hhi : f p < hi)
    (hunique : ∀ x : M, f x ∈ Set.Icc lo hi → x = p ∨ ¬ IsCriticalPointAt I f x)
    (hnd : IsNondegenerateCriticalPointAt I f p)
    (hindex : sigNeg (chartHessianAt (fun y => f ((extChartAt I p).symm y))
      (extChartAt I p p)) = 2) :
    Nonempty (IsolatedMiddleAttachment hf p lo hi) := by
  obtain ⟨oldChart, hp, _⟩ := DifferentialGeometry.Morse.exists_interior_morse_chart I f hf p
    BoundarylessManifold.isInteriorPoint 2 le₂₄ hnd hindex
  let gap := min (f p - lo) (hi - f p)
  have gap_pos : 0 < gap := lt_min (sub_pos.mpr hlo) (sub_pos.mpr hhi)
  let bound := min (min oldChart.R oldChart.smoothRadius) (min 1 gap)
  have bound_pos : 0 < bound := lt_min (lt_min oldChart.radius_pos oldChart.smoothRadius_pos)
    (lt_min zero_lt_one gap_pos)
  let R := bound / 2
  have R_pos : 0 < R := by dsimp [R]; positivity
  have R_lt_bound : R < bound := by dsimp [R]; linarith
  have R_lt_old : R < oldChart.R := R_lt_bound.trans_le
    (min_le_left .. |>.trans (min_le_left ..))
  have R_lt_smooth : R < oldChart.smoothRadius := R_lt_bound.trans_le
    (min_le_left .. |>.trans (min_le_right ..))
  have R_lt_one : R < 1 := R_lt_bound.trans_le (min_le_right .. |>.trans (min_le_left ..))
  have R_lt_gap : R < gap := R_lt_bound.trans_le (min_le_right .. |>.trans (min_le_right ..))
  have R_sq_le : R ^ 2 ≤ R := by
    nlinarith [mul_nonneg R_pos.le (sub_nonneg.mpr R_lt_one.le)]
  let chart : MorseChart 4 2 le₂₄ (f p) I f :=
    { oldChart with
      R := R
      ε := R ^ 2 / 4
      radius_pos := R_pos
      epsilon_pos := by positivity
      sqrt_two_epsilon_le_radius := Real.sqrt_le_iff.mpr ⟨R_pos.le, by nlinarith [sq_nonneg R]⟩
      normalForm_on := fun y hy => oldChart.normalForm_on y (hy.trans R_lt_old.le)
      closedBall_subset_source := fun y hy => oldChart.closedBall_subset_source y (hy.trans R_lt_old.le) }
  let a := R ^ 2 / 16
  have a_pos : 0 < a := by dsimp [a]; positivity
  have a_lt_R : a < R := by dsimp [a]; linarith
  have R_lt_left : R < f p - lo := R_lt_gap.trans_le (min_le_left ..)
  have R_lt_right : R < hi - f p := R_lt_gap.trans_le (min_le_right ..)
  have bandInside : Set.Icc (f p - a) (f p + a) ⊆ Set.Icc lo hi :=
    fun _ hx => ⟨by linarith [hx.1], by linarith [hx.2]⟩
  have bandCompact : IsCompact (f ⁻¹' Set.Icc (f p - a) (f p + a)) :=
    (isClosed_Icc.preimage hf.continuous).isCompact
  obtain ⟨ε, ε_pos, r, hr, η, η_pos, hl, hu, charts, e, hTrace, hUpper, hLower, hHandle, hFix, hPre⟩ :=
    exists_morseHandleAdjunction_diffeomorph_upperSublevel_of_morseChart
      (m := 3) (k := 2) le₂₄ (f p) a chart hf a_pos le_rfl R_lt_smooth bandCompact
      (fun x hx => by simpa only [show chart.p = p from hp] using hunique x (bandInside hx))
  have ε_lt_R : ε < R := by
    have hεr : 2 * ε + 2 * r ^ 2 ≤ R ^ 2 := (Real.sqrt_le_iff.mp hr.2).2
    linarith [sq_nonneg r]
  exact ⟨{
    chart := chart
    chart_point := hp
    chart_radius_lt := R_lt_smooth
    ε := ε
    ε_pos := ε_pos
    r := r
    r_pos := hr.1
    attaching_radius := hr.2
    lower_inside := by linarith
    upper_inside := by linarith
    lower_regular := hl
    upper_regular := hu
    η := η
    η_pos := η_pos
    traceCharts := charts
    trace_isManifold := hTrace
    upper_isManifold := hUpper
    traceDiffeomorph := e
    lower_smooth := hLower
    handle_smooth := hHandle
    fixes_deep_lower := hFix
    deep_lower_preimage := hPre }⟩

end SmoothPoincare
