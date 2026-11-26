import SmoothPoincare.Heights.SelectedHandleReduction
import SmoothPoincare.Heights.MorseEndBounds
import Mathlib.Data.Finset.Sort
import Mathlib.Order.Fin.Tuple

/-! # Actual zero- and one-handle bands at the two ends of an ordered Morse height -/

open DifferentialGeometry.Topology DifferentialGeometry.Topology.Morse Set
open DifferentialGeometry.Topology.Morse.CellAttachment
open DifferentialGeometry.Topology.Morse.ManifoldCellAttachment
open scoped ContDiff Manifold

namespace SmoothPoincare

local notation "I₄" => morseModelWithCornersHalfSpace 3
local notation "I₁" => modelWithCornersEuclideanHalfSpace 1
local notation "I₃" => modelWithCornersEuclideanHalfSpace 3
local notation "D₄" => modelWithCornersEuclideanHalfSpace 4
local notation "V₄" => EuclideanSpace ℝ (Fin 4)
local notation "coords" => PiLp.continuousLinearEquiv 2 ℝ (fun _ : Fin 4 => ℝ)

section LocalBands

variable {H M : Type} [TopologicalSpace H] [TopologicalSpace M] [ChartedSpace H M]
  {J : ModelWithCorners ℝ (MorseModel 4) H} [J.Boundaryless] [IsManifold J ∞ M]
  {f : M → ℝ}

local instance : Fact (Module.finrank ℝ (EuclideanSpace ℝ (Fin 1)) = (1 - 1) + 1) :=
  ⟨by simp⟩
local instance : Fact (Module.finrank ℝ (EuclideanSpace ℝ (Fin 3)) = (3 - 1) + 1) :=
  ⟨by simp⟩
local instance : Fact (Module.finrank ℝ (EuclideanSpace ℝ (Fin 4)) = (4 - 1) + 1) :=
  ⟨by simp⟩

/-- A native rounded handle adjunction between two interior regular cuts of
an isolating band. The handle is indexed by its negative dimension `k`. -/
structure IsolatedEndHandle (hf : ContMDiff J 𝓘(ℝ, ℝ) ∞ f) (p : M) (lo hi : ℝ)
    (k : ℕ) (hk : k ≤ 4) where
  chart : MorseChart 4 k hk (f p) J f
  chart_point : chart.p = p
  chart_radius_lt : chart.R < chart.smoothRadius
  double_radius_le_smooth : 2 * chart.R ≤ chart.smoothRadius
  double_ball_subset_source : ∀ y : MorseModel 4, morseNorm 4 y ≤ 2 * chart.R → y ∈ chart.χ.source
  double_normalForm_on : ∀ y : MorseModel 4, morseNorm 4 y ≤ 2 * chart.R →
    f (chart.χ y) = morseNormalForm hk (f p) y
  ε : ℝ
  ε_pos : 0 < ε
  r : ℝ
  r_pos : 0 < r
  attaching_radius : Real.sqrt (2 * ε + 2 * r ^ 2) ≤ chart.R
  lower_inside : lo < f p - ε
  upper_inside : f p + ε < hi
  lower_regular : ∀ x : M, f x = f p - ε → ¬ IsCriticalPointAt J f x
  upper_regular : ∀ x : M, f x = f p + ε → ¬ IsCriticalPointAt J f x
  η : ℝ
  η_pos : 0 < η
  traceCharts : ChartedSpace (MorseHalfSpace 3)
    (Handle.AdjunctionSpace k (4 - k) (morseAttachingEmbedding hk (f p) ε r chart ε_pos attaching_radius))
  trace_isManifold :
    letI := traceCharts
    IsManifold I₄ ∞
      (Handle.AdjunctionSpace k (4 - k) (morseAttachingEmbedding hk (f p) ε r chart ε_pos attaching_radius))
  upper_isManifold :
    letI := manifoldSublevelChartedSpace J f (f p + ε) hf upper_regular
    IsManifold I₄ ∞ (SublevelSpace f (f p + ε))
  traceDiffeomorph :
    letI := traceCharts
    letI := manifoldSublevelChartedSpace J f (f p + ε) hf upper_regular
    (Handle.AdjunctionSpace k (4 - k) (morseAttachingEmbedding hk (f p) ε r chart ε_pos attaching_radius))
      ≃ₘ^∞⟮I₄, I₄⟯ SublevelSpace f (f p + ε)
  lower_smooth :
    letI := traceCharts
    letI := manifoldSublevelChartedSpace J f (f p - ε) hf lower_regular
    ContMDiff I₄ I₄ ∞
      (Handle.lower (morseAttachingEmbedding hk (f p) ε r chart ε_pos attaching_radius))
  fixes_deep_lower : ∀ x : M, f x ≤ f p - ε - η → ∀ hx : f x ≤ f p - ε,
    (traceDiffeomorph (Handle.lower
      (morseAttachingEmbedding hk (f p) ε r chart ε_pos attaching_radius) ⟨x, hx⟩)).1 = x
  deep_lower_preimage : ∀ x : M, (hxdeep : f x ≤ f p - ε - η) → ∀ hx : f x ≤ f p + ε,
    ∀ z, traceDiffeomorph z = ⟨x, hx⟩ → z = Handle.lower
      (morseAttachingEmbedding hk (f p) ε r chart ε_pos attaching_radius)
      ⟨x, le_trans hxdeep (sub_le_self _ η_pos.le)⟩

/-- The index-zero trace has a smooth map from the native `D⁰ × D⁴`. -/
structure IsolatedZeroHandle (hf : ContMDiff J 𝓘(ℝ, ℝ) ∞ f) (p : M) (lo hi : ℝ)
    extends IsolatedEndHandle hf p lo hi 0 (Nat.zero_le 4) where
  handle_smooth :
    letI := traceCharts
    letI := Handle.standardHandleZeroChartedSpace 4
    ContMDiff ((𝓡 0).prod D₄) I₄ ∞
      (Handle.cell (morseAttachingEmbedding (Nat.zero_le 4) (f p) ε r chart ε_pos attaching_radius))

private theorem one_le_four : (1 : ℕ) ≤ 4 := by decide

/-- The index-one trace has a smooth map from the native `D¹ × D³`. -/
structure IsolatedOneHandle (hf : ContMDiff J 𝓘(ℝ, ℝ) ∞ f) (p : M) (lo hi : ℝ)
    extends IsolatedEndHandle hf p lo hi 1 one_le_four where
  handle_smooth :
    letI := traceCharts
    letI := Handle.standardHandleChartedSpace 1 3
    ContMDiff (ModelWithCorners.prod I₁ I₃) I₄ ∞
      (Handle.cell (morseAttachingEmbedding one_le_four (f p) ε r chart ε_pos attaching_radius))

/-- There is no attaching locus for the zero-handle. -/
theorem zeroHandle_attachingRegion_isEmpty : IsEmpty (Handle.AttachingRegion 0 4) := by
  refine ⟨fun p => ?_⟩
  have hp : ‖(p.1 : EuclideanSpace ℝ (Fin 0))‖ = 1 := p.1.2
  rw [Subsingleton.elim (p.1 : EuclideanSpace ℝ (Fin 0)) 0, norm_zero] at hp
  exact zero_ne_one hp

/-- The index-zero adjunction is the disjoint union of an actual closed
four-disk and the incoming body. -/
noncomputable def zeroHandle_adjunctionHomeomorph {X : Type} [TopologicalSpace X]
    (φ : Handle.AttachingRegion 0 4 → X) :
    Handle.AdjunctionSpace 0 4 φ ≃ₜ (ClosedCell 4 ⊕ X) := by
  letI : Unique (ClosedCell 0) :=
    ⟨⟨closedCellCenter 0⟩, fun x => Subtype.ext (Subsingleton.elim x.val 0)⟩
  have hrel (u v : Handle.StandardHandle 0 4 ⊕ X)
      (hr : adjunctionRel (Handle.attachingInclusion 0 4) φ u v) : u = v :=
    (zeroHandle_attachingRegion_isEmpty.false hr.choose).elim
  let q : Handle.AdjunctionSpace 0 4 φ ≃ₜ (Handle.StandardHandle 0 4 ⊕ X) :=
    { toFun := Quot.lift id hrel
      invFun := adjunctionMk (Handle.attachingInclusion 0 4) φ
      left_inv := fun z => Quot.induction_on z fun _ => rfl
      right_inv := fun _ => rfl
      continuous_toFun := continuous_adjunction_lift _ _ hrel continuous_id
      continuous_invFun := continuous_adjunctionMk _ _ }
  exact q.trans ((Homeomorph.uniqueProd (ClosedCell 0) (ClosedCell 4)).sumCongr (Homeomorph.refl X))

/-- Crossing the actual minimum adds a disjoint closed four-disk. -/
noncomputable def IsolatedZeroHandle.birthHomeomorph
    {hf : ContMDiff J 𝓘(ℝ, ℝ) ∞ f} {p : M} {lo hi : ℝ}
    (D : IsolatedZeroHandle hf p lo hi) :
    SublevelSpace f (f p + D.ε) ≃ₜ (ClosedCell 4 ⊕ SublevelSpace f (f p - D.ε)) := by
  letI := D.traceCharts
  letI := manifoldSublevelChartedSpace J f (f p + D.ε) hf D.upper_regular
  exact D.traceDiffeomorph.toHomeomorph.symm.trans
    (zeroHandle_adjunctionHomeomorph
      (morseAttachingEmbedding (Nat.zero_le 4) (f p) D.ε D.r D.chart D.ε_pos D.attaching_radius))

/-- Both feet `S⁰ × D³` lie smoothly in the actual incoming level. -/
theorem IsolatedOneHandle.attachingFeet_smooth
    {hf : ContMDiff J 𝓘(ℝ, ℝ) ∞ f} {p : M} {lo hi : ℝ}
    (D : IsolatedOneHandle hf p lo hi) :
    letI := Handle.attachingRegionChartedSpace 1 3
    letI := manifoldLevelSetChartedSpace J f (f p - D.ε) hf D.lower_regular
    ContMDiff ((𝓡 0).prod I₃) 𝓘(ℝ, MorseModel 3) ∞
      (cocoreAttachingEmbedding one_le_four (f p) D.ε D.r D.chart D.ε_pos D.attaching_radius) :=
  contMDiff_cocoreAttachingEmbedding one_le_four (f p) D.ε D.r D.chart D.ε_pos D.attaching_radius
    (D.attaching_radius.trans_lt D.chart_radius_lt) hf D.lower_regular

/-- The two feet have disjoint images given by the same closed embedding of
the full attaching region. -/
theorem IsolatedOneHandle.attachingFeet_isClosedEmbedding [T2Space M]
    {hf : ContMDiff J 𝓘(ℝ, ℝ) ∞ f} {p : M} {lo hi : ℝ}
    (D : IsolatedOneHandle hf p lo hi) :
    Topology.IsClosedEmbedding
      (cocoreAttachingEmbedding one_le_four (f p) D.ε D.r D.chart D.ε_pos D.attaching_radius) :=
  isClosedEmbedding_cocoreAttachingEmbedding one_le_four (f p) D.ε D.r D.chart D.ε_pos D.r_pos.ne'
    D.attaching_radius (D.attaching_radius.trans_lt D.chart_radius_lt) hf D.lower_regular

/-- Doubling the cocore radius keeps the whole radius-two foot strictly
inside the preserved Morse normal-form ball. -/
theorem IsolatedOneHandle.attaching_radius_two_lt
    {hf : ContMDiff J 𝓘(ℝ, ℝ) ∞ f} {p : M} {lo hi : ℝ}
    (D : IsolatedOneHandle hf p lo hi) :
    Real.sqrt (2 * D.ε + 8 * D.r ^ 2) < 2 * D.chart.R := by
  have hε := D.ε_pos
  have hR := D.chart.radius_pos
  have hbound := (Real.sqrt_le_iff.mp D.attaching_radius).2
  apply (Real.sqrt_lt (by positivity) (by positivity)).2
  nlinarith only [hε, hbound]

/-- The native cocore formula with twice the radius parametrizes the two
larger feet in the same incoming level and inside the smooth chart room. -/
theorem IsolatedOneHandle.radiusTwo_modelPoint_mem_and_value
    {hf : ContMDiff J 𝓘(ℝ, ℝ) ∞ f} {p : M} {lo hi : ℝ}
    (D : IsolatedOneHandle hf p lo hi) (q : Handle.AttachingRegion 1 3) :
    let y := cocoreModelPoint one_le_four D.ε (2 * D.r) q
    morseNorm 4 y < D.chart.smoothRadius ∧ y ∈ D.chart.χ.source ∧
      f (D.chart.χ y) = f p - D.ε := by
  have hrad : Real.sqrt (2 * D.ε + 2 * (2 * D.r) ^ 2) < 2 * D.chart.R := by
    rw [show 2 * (2 * D.r) ^ 2 = 8 * D.r ^ 2 by ring]
    exact D.attaching_radius_two_lt
  let chart : MorseChart 4 1 one_le_four (f p) J f :=
    { D.chart with
      R := 2 * D.chart.R
      radius_pos := mul_pos (by norm_num) D.chart.radius_pos
      sqrt_two_epsilon_le_radius :=
        D.chart.sqrt_two_epsilon_le_radius.trans (by linarith [D.chart.radius_pos])
      normalForm_on := D.double_normalForm_on
      closedBall_subset_source := D.double_ball_subset_source }
  have hy := (cocoreModelPoint_norm_le one_le_four D.ε (2 * D.r) D.ε_pos.le q).trans_lt hrad
  exact ⟨hy.trans_le D.double_radius_le_smooth, D.double_ball_subset_source _ hy.le,
    cocoreAttachingEmbedding_value one_le_four (f p) D.ε (2 * D.r) chart D.ε_pos hrad.le q⟩

private theorem exists_smallEndMorseChart
    (hf : ContMDiff J 𝓘(ℝ, ℝ) ∞ f) (p : M) {lo hi : ℝ}
    (hlo : lo < f p) (hhi : f p < hi) (k : ℕ) (hk : k ≤ 4)
    (hnd : IsNondegenerateCriticalPointAt J f p) (hindex : morseIndex J f p = k) :
    ∃ chart : MorseChart 4 k hk (f p) J f, chart.p = p ∧ chart.R < chart.smoothRadius ∧
      chart.R ^ 2 ≤ chart.R ∧ chart.R < f p - lo ∧ chart.R < hi - f p ∧
      2 * chart.R ≤ chart.smoothRadius ∧
      (∀ y : MorseModel 4, morseNorm 4 y ≤ 2 * chart.R → y ∈ chart.χ.source) ∧
      (∀ y : MorseModel 4, morseNorm 4 y ≤ 2 * chart.R →
        f (chart.χ y) = morseNormalForm hk (f p) y) := by
  obtain ⟨oldChart, hp, _⟩ := DifferentialGeometry.Morse.exists_interior_morse_chart J f hf p
    BoundarylessManifold.isInteriorPoint k hk hnd hindex
  let gap := min (f p - lo) (hi - f p)
  have gap_pos : 0 < gap := lt_min (sub_pos.mpr hlo) (sub_pos.mpr hhi)
  let bound := min (min oldChart.R oldChart.smoothRadius) (min 1 gap)
  have bound_pos : 0 < bound := lt_min (lt_min oldChart.radius_pos oldChart.smoothRadius_pos)
    (lt_min zero_lt_one gap_pos)
  let R := bound / 2
  have R_pos : 0 < R := by dsimp [R]; positivity
  have R_lt_bound : R < bound := by dsimp [R]; linarith
  have double_R_le_bound : 2 * R ≤ bound := by dsimp [R]; linarith
  have double_R_le_old : 2 * R ≤ oldChart.R := double_R_le_bound.trans
    ((min_le_left ..).trans (min_le_left ..))
  have double_R_le_smooth : 2 * R ≤ oldChart.smoothRadius := double_R_le_bound.trans
    ((min_le_left ..).trans (min_le_right ..))
  have R_lt_old : R < oldChart.R := R_lt_bound.trans_le
    (min_le_left .. |>.trans (min_le_left ..))
  have R_lt_smooth : R < oldChart.smoothRadius := R_lt_bound.trans_le
    (min_le_left .. |>.trans (min_le_right ..))
  have R_lt_one : R < 1 := R_lt_bound.trans_le (min_le_right .. |>.trans (min_le_left ..))
  have R_lt_gap : R < gap := R_lt_bound.trans_le (min_le_right .. |>.trans (min_le_right ..))
  have R_sq_le : R ^ 2 ≤ R := by
    nlinarith [mul_nonneg R_pos.le (sub_nonneg.mpr R_lt_one.le)]
  exact ⟨{ oldChart with
      R := R
      ε := R ^ 2 / 4
      radius_pos := R_pos
      epsilon_pos := by positivity
      sqrt_two_epsilon_le_radius := Real.sqrt_le_iff.mpr ⟨R_pos.le, by nlinarith [sq_nonneg R]⟩
      normalForm_on := fun y hy => oldChart.normalForm_on y (hy.trans R_lt_old.le)
      closedBall_subset_source := fun y hy => oldChart.closedBall_subset_source y (hy.trans R_lt_old.le) },
    hp, R_lt_smooth, R_sq_le, R_lt_gap.trans_le (min_le_left ..),
    R_lt_gap.trans_le (min_le_right ..), double_R_le_smooth,
    fun y hy => oldChart.closedBall_subset_source y (hy.trans double_R_le_old),
    fun y hy => oldChart.normalForm_on y (hy.trans double_R_le_old)⟩

variable [T2Space M] [CompactSpace M]

/-- An isolated index-zero critical point gives the native smooth attachment
between two regular cuts inside its isolating band. -/
theorem exists_isolatedZeroHandle
    (hf : ContMDiff J 𝓘(ℝ, ℝ) ∞ f) (p : M) {lo hi : ℝ}
    (hlo : lo < f p) (hhi : f p < hi)
    (hunique : ∀ x : M, f x ∈ Icc lo hi → x = p ∨ ¬ IsCriticalPointAt J f x)
    (hnd : IsNondegenerateCriticalPointAt J f p) (hindex : morseIndex J f p = 0) :
    Nonempty (IsolatedZeroHandle hf p lo hi) := by
  obtain ⟨chart, hp, hR, hRsq, hleft, hright, hdouble, hsource, hnormal⟩ :=
    exists_smallEndMorseChart hf p hlo hhi 0 (Nat.zero_le 4) hnd hindex
  let a := chart.R ^ 2 / 16
  have ha : 0 < a := by dsimp [a]; have := chart.radius_pos; positivity
  have haR : a < chart.R := by dsimp [a]; linarith [chart.radius_pos]
  have hcompact : IsCompact (f ⁻¹' Icc (f p - a) (f p + a)) :=
    (isClosed_Icc.preimage hf.continuous).isCompact
  obtain ⟨ε, hε, r, hr, η, hη, hl, hu, charts, e, hTrace, hUpper, hLower, hHandle, hFix, hPre⟩ :=
    exists_morseHandleAdjunction_diffeomorph_upperSublevel_of_morseChart_zero
      (m := 3) (f p) a chart hf ha le_rfl hR hcompact
      (fun x hx => by rw [hp]; exact hunique x ⟨by linarith [hx.1], by linarith [hx.2]⟩)
  have hεR : ε < chart.R := by
    have hbound := (Real.sqrt_le_iff.mp hr.2).2
    linarith [sq_nonneg r, chart.radius_pos]
  exact ⟨{
    chart := chart
    chart_point := hp
    chart_radius_lt := hR
    double_radius_le_smooth := hdouble
    double_ball_subset_source := hsource
    double_normalForm_on := hnormal
    ε := ε
    ε_pos := hε
    r := r
    r_pos := hr.1
    attaching_radius := hr.2
    lower_inside := by linarith
    upper_inside := by linarith
    lower_regular := hl
    upper_regular := hu
    η := η
    η_pos := hη
    traceCharts := charts
    trace_isManifold := hTrace
    upper_isManifold := hUpper
    traceDiffeomorph := e
    lower_smooth := hLower
    fixes_deep_lower := hFix
    deep_lower_preimage := hPre
    handle_smooth := hHandle }⟩

/-- An isolated index-one critical point gives the native smooth attachment
between two regular cuts inside its isolating band. -/
theorem exists_isolatedOneHandle
    (hf : ContMDiff J 𝓘(ℝ, ℝ) ∞ f) (p : M) {lo hi : ℝ}
    (hlo : lo < f p) (hhi : f p < hi)
    (hunique : ∀ x : M, f x ∈ Icc lo hi → x = p ∨ ¬ IsCriticalPointAt J f x)
    (hnd : IsNondegenerateCriticalPointAt J f p) (hindex : morseIndex J f p = 1) :
    Nonempty (IsolatedOneHandle hf p lo hi) := by
  obtain ⟨chart, hp, hR, hRsq, hleft, hright, hdouble, hsource, hnormal⟩ :=
    exists_smallEndMorseChart hf p hlo hhi 1 one_le_four hnd hindex
  let a := chart.R ^ 2 / 16
  have ha : 0 < a := by dsimp [a]; have := chart.radius_pos; positivity
  have haR : a < chart.R := by dsimp [a]; linarith [chart.radius_pos]
  have hcompact : IsCompact (f ⁻¹' Icc (f p - a) (f p + a)) :=
    (isClosed_Icc.preimage hf.continuous).isCompact
  obtain ⟨ε, hε, r, hr, η, hη, hl, hu, charts, e, hTrace, hUpper, hLower, hHandle, hFix, hPre⟩ :=
    exists_morseHandleAdjunction_diffeomorph_upperSublevel_of_morseChart
      (m := 3) one_le_four (f p) a chart hf ha le_rfl hR hcompact
      (fun x hx => by rw [hp]; exact hunique x ⟨by linarith [hx.1], by linarith [hx.2]⟩)
  have hεR : ε < chart.R := by
    have hbound := (Real.sqrt_le_iff.mp hr.2).2
    linarith [sq_nonneg r, chart.radius_pos]
  exact ⟨{
    chart := chart
    chart_point := hp
    chart_radius_lt := hR
    double_radius_le_smooth := hdouble
    double_ball_subset_source := hsource
    double_normalForm_on := hnormal
    ε := ε
    ε_pos := hε
    r := r
    r_pos := hr.1
    attaching_radius := hr.2
    lower_inside := by linarith
    upper_inside := by linarith
    lower_regular := hl
    upper_regular := hu
    η := η
    η_pos := hη
    traceCharts := charts
    trace_isManifold := hTrace
    upper_isManifold := hUpper
    traceDiffeomorph := e
    lower_smooth := hLower
    fixes_deep_lower := hFix
    deep_lower_preimage := hPre
    handle_smooth := hHandle }⟩

end LocalBands


section Filtration

variable {H M : Type} [TopologicalSpace H] [TopologicalSpace M] [ChartedSpace H M]
  {I : ModelWithCorners ℝ V₄ H} [I.Boundaryless] [IsManifold I ∞ M] [T2Space M] [CompactSpace M]

/-- One elementary step at a specified actual point, with the ambient flow
identifying its two native levels with the neighboring filtration cuts. -/
inductive EndHandleStep {h : M → ℝ}
    (hs : ContMDiff (I.transContinuousLinearEquiv coords) 𝓘(ℝ, ℝ) ∞ h)
    (p : M) (lo hi : ℝ) : Prop
  | zero (index : morseIndex I h p = 0) (D : IsolatedZeroHandle hs p lo hi)
      (incoming : HasRegularLevelTransport I h lo (h p - D.ε))
      (outgoing : HasRegularLevelTransport I h (h p + D.ε) hi)
  | one (index : morseIndex I h p = 1) (D : IsolatedOneHandle hs p lo hi)
      (incoming : HasRegularLevelTransport I h lo (h p - D.ε))
      (outgoing : HasRegularLevelTransport I h (h p + D.ε) hi)

/-- A finite filtration from the empty set to a specified end cut. Every
critical point below that cut occurs once, and successive elementary
adjunctions share the intermediate actual sublevel and boundary levels. -/
structure EndHandleFiltration {h : M → ℝ}
    (hs : ContMDiff (I.transContinuousLinearEquiv coords) 𝓘(ℝ, ℝ) ∞ h) (cap : ℝ) where
  n : ℕ
  points : Fin n → M
  cuts : Fin (n + 1) → ℝ
  points_strictMono : StrictMono (h ∘ points)
  cuts_strictMono : StrictMono cuts
  cuts_below : ∀ j, cuts j < cap
  critical_points : Set.range points = {x | IsCriticalPointAt I h x ∧ h x ≤ cap}
  initial_empty : h ⁻¹' Iic (cuts 0) = ∅
  cuts_regular : ∀ j x, h x = cuts j → ¬ IsCriticalPointAt I h x
  terminal_regular : ∀ x, h x ∈ Icc (cuts (Fin.last n)) cap → ¬ IsCriticalPointAt I h x
  terminal_transport : HasRegularLevelTransport I h (cuts (Fin.last n)) cap
  critical_interior : ∀ i, h (points i) ∈ Ioo (cuts i.castSucc) (cuts i.succ)
  unique_critical : ∀ i x, h x ∈ Icc (cuts i.castSucc) (cuts i.succ) →
    IsCriticalPointAt I h x → x = points i
  step : ∀ i, EndHandleStep hs (points i) (cuts i.castSucc) (cuts i.succ)

private theorem exists_endHandleStep {h : M → ℝ}
    (hf : ContMDiff I 𝓘(ℝ, ℝ) ∞ h)
    (hs : ContMDiff (I.transContinuousLinearEquiv coords) 𝓘(ℝ, ℝ) ∞ h)
    (p : M) {lo hi : ℝ} (hval : h p ∈ Ioo lo hi)
    (hunique : ∀ x, h x ∈ Icc lo hi → IsCriticalPointAt I h x → x = p)
    (hnd : IsNondegenerateCriticalPointAt I h p) (hindex : morseIndex I h p ≤ 1) :
    EndHandleStep hs p lo hi := by
  have hcrit (x : M) :=
    isCriticalPointAt_transContinuousLinearEquiv_iff I coords h x
  have hjnd := (DifferentialGeometry.Morse.isNondegenerateCriticalPointAt_transContinuousLinearEquiv_iff
    I coords hf BoundarylessManifold.isInteriorPoint).2 hnd
  have hji := DifferentialGeometry.Morse.sigNeg_chartHessianAt_transContinuousLinearEquiv
    I coords hf BoundarylessManifold.isInteriorPoint hnd.1
  have huniq x hx : x = p ∨ ¬ IsCriticalPointAt (I.transContinuousLinearEquiv coords) h x :=
    or_iff_not_imp_right.mpr (fun hnc => hunique x hx ((hcrit x).1 (not_not.mp hnc)))
  have leftTransport {ε : ℝ} (hε : 0 < ε) (hlo : lo < h p - ε) :
      HasRegularLevelTransport I h lo (h p - ε) :=
    exists_regularSublevelTransport hf hlo.le (by
      intro x hx hc
      have hlt : h p - ε < h p := sub_lt_self _ hε
      have he := hunique x ⟨hx.1, hx.2.trans (hlt.le.trans hval.2.le)⟩ hc
      subst x
      exact hlt.not_ge hx.2)
  have rightTransport {ε : ℝ} (hε : 0 < ε) (hhi : h p + ε < hi) :
      HasRegularLevelTransport I h (h p + ε) hi :=
    exists_regularSublevelTransport hf hhi.le (by
      intro x hx hc
      have hlt : h p < h p + ε := lt_add_of_pos_right _ hε
      have he := hunique x ⟨hval.1.le.trans (hlt.le.trans hx.1), hx.2⟩ hc
      subst x
      exact hlt.not_ge hx.1)
  rcases Nat.le_one_iff_eq_zero_or_eq_one.mp hindex with h₀ | h₁
  · obtain ⟨D⟩ := exists_isolatedZeroHandle hs p hval.1 hval.2 huniq hjnd (hji.trans h₀)
    exact .zero h₀ D (leftTransport D.ε_pos D.lower_inside) (rightTransport D.ε_pos D.upper_inside)
  · obtain ⟨D⟩ := exists_isolatedOneHandle hs p hval.1 hval.2 huniq hjnd (hji.trans h₁)
    exact .one h₁ D (leftTransport D.ε_pos D.lower_inside) (rightTransport D.ε_pos D.upper_inside)

/-- On a compact smooth four-manifold, an end cut below which all actual
critical points have index zero or one has a smooth finite handle filtration. -/
theorem exists_endHandleFiltration {h : M → ℝ}
    (hf : ContMDiff I 𝓘(ℝ, ℝ) ∞ h)
    (hnd : ∀ x, IsCriticalPointAt I h x → IsNondegenerateCriticalPointAt I h x)
    (hinj : InjOn h (criticalPoints I h)) (cap : ℝ)
    (hend : ∀ x, IsCriticalPointAt I h x → h x ≤ cap → h x < cap ∧ morseIndex I h x ≤ 1) :
    ∃ hs : ContMDiff (I.transContinuousLinearEquiv coords) 𝓘(ℝ, ℝ) ∞ h,
      Nonempty (EndHandleFiltration hs cap) := by
  classical
  let C := {x | IsCriticalPointAt I h x ∧ h x ≤ cap}
  have hfinite := finite_criticalPoints_of_compact_of_isNondegenerate h hf hnd
  have hC : C.Finite := hfinite.subset (fun _ hx => hx.1)
  let s := (hC.image h).toFinset
  let n := s.card
  let q := s.orderEmbOfFin (show s.card = n from rfl)
  have hq (i : Fin n) : q i ∈ h '' C := by
    simpa only [s, Set.Finite.mem_toFinset] using s.orderEmbOfFin_mem rfl i
  choose p hp hpval using hq
  have hpmono : StrictMono (h ∘ p) := by
    intro i j hij
    change h (p i) < h (p j)
    rw [hpval, hpval]
    exact q.strictMono hij
  have hcover : Set.range p = C := by
    apply Subset.antisymm
    · rintro _ ⟨i, rfl⟩
      exact hp i
    · intro x hx
      have hmem : h x ∈ (s : Set ℝ) := by simpa [s] using (mem_image_of_mem h hx)
      have hqrange := s.range_orderEmbOfFin (show s.card = n from rfl)
      obtain ⟨i, hi⟩ := hqrange.symm ▸ hmem
      exact ⟨i, hinj (hp i).1 hx.1 ((hpval i).trans hi)⟩
  obtain ⟨l, hl⟩ := (isCompact_range hf.continuous).bddBelow
  let a := min (l - 1) (cap - 1)
  have ha (x : M) : a < h x :=
    (min_le_left _ _).trans_lt ((sub_one_lt l).trans_le (hl (mem_range_self x)))
  have hacap : a < cap := (min_le_right _ _).trans_lt (sub_one_lt cap)
  have hpcap (i : Fin n) : h (p i) < cap := (hend _ (hp i).1 (hp i).2).1
  let w : Fin (n + 1) → ℝ := Fin.snoc (fun i => h (p i)) cap
  have hsnoc : StrictMono w := by
    intro i
    refine Fin.lastCases (fun j hij => (not_lt_of_ge (Fin.le_last j) hij).elim) (fun i j => ?_) i
    refine Fin.lastCases (fun _ => ?_) (fun j hij => ?_) j
    · simpa only [w, Fin.snoc_last, Fin.snoc_castSucc] using hpcap i
    · simpa only [w, Fin.snoc_castSucc, Function.comp_apply] using hpmono (show i < j from by simpa using hij)
  let v : Fin (n + 2) → ℝ := Fin.cons a w
  have hv : StrictMono v := Fin.strictMono_cons.mpr ⟨fun j => by
    refine Fin.lastCases ?_ (fun i => ?_) j
    · simpa only [w, Fin.snoc_last] using hacap
    · simpa only [w, Fin.snoc_castSucc] using ha (p i), hsnoc⟩
  have hvp (i : Fin n) : v i.castSucc.succ = h (p i) := by
    simp [v, w]
  have hvfirst : v 0 = a := by simp [v]
  have hvlast : v (Fin.last (n + 1)) = cap := by
    rw [← Fin.succ_last, show v (Fin.last n).succ = cap by simp [v, w]]
  let cut (j : Fin (n + 1)) := (v j.castSucc + v j.succ) / 2
  have hcut (j : Fin (n + 1)) : cut j ∈ Ioo (v j.castSucc) (v j.succ) := by
    have hj := hv (show j.castSucc < j.succ by
      change j.val < j.val + 1
      omega)
    exact ⟨by dsimp [cut]; linarith, by dsimp [cut]; linarith⟩
  have hcutMono : StrictMono cut := by
    intro i j hij
    exact (hcut i).2.trans_le ((hv.monotone
      (show i.succ ≤ j.castSucc by
        change i.val + 1 ≤ j.val
        omega)).trans (hcut j).1.le)
  have hcutcap (i : Fin (n + 1)) : cut i < cap :=
    (hcut i).2.trans_le ((hv.monotone (Fin.le_last _)).trans_eq hvlast)
  have hcrit (x : M) (hx : IsCriticalPointAt I h x) (hxcap : h x ≤ cap) :
      ∃ j, p j = x := by
    change x ∈ Set.range p
    rw [hcover]
    exact ⟨hx, hxcap⟩
  have hcritical_interior (i : Fin n) : h (p i) ∈ Ioo (cut i.castSucc) (cut i.succ) := by
    rw [← hvp]
    refine ⟨(hcut i.castSucc).2, ?_⟩
    simpa only [show i.castSucc.succ = i.succ.castSucc from Fin.ext rfl] using (hcut i.succ).1
  have hunique (i : Fin n) (x : M) (hx : h x ∈ Icc (cut i.castSucc) (cut i.succ))
      (hc : IsCriticalPointAt I h x) : x = p i := by
    obtain ⟨j, rfl⟩ := hcrit x hc (hx.2.trans (hcutcap _).le)
    rw [← hvp] at hx
    rcases lt_trichotomy j i with hji | rfl | hij
    · have hh := hv.monotone (show j.castSucc.succ ≤ i.castSucc.castSucc by
        change j.val + 1 ≤ i.val
        omega)
      exact (not_le_of_gt (hh.trans_lt (hcut i.castSucc).1) hx.1).elim
    · rfl
    · have hh := hv.monotone (show i.succ.succ ≤ j.castSucc.succ by
        change i.val + 1 + 1 ≤ j.val + 1
        omega)
      exact (not_le_of_gt ((hcut i.succ).2.trans_le hh) hx.2).elim
  have hfirst (x : M) (hx : h x ∈ Icc a (cut 0)) : ¬ IsCriticalPointAt I h x := by
    intro hc
    obtain ⟨j, rfl⟩ := hcrit x hc (hx.2.trans (hcutcap _).le)
    have hh := hv.monotone (show (0 : Fin (n + 1)).succ ≤ j.castSucc.succ by
      change 0 + 1 ≤ j.val + 1
      omega)
    exact (not_le_of_gt ((hcut 0).2.trans_le (hh.trans_eq (hvp j))) hx.2)
  have hlast (x : M) (hx : h x ∈ Icc (cut (Fin.last n)) cap) : ¬ IsCriticalPointAt I h x := by
    intro hc
    obtain ⟨j, rfl⟩ := hcrit x hc hx.2
    have hh := hv.monotone (show j.castSucc.succ ≤ (Fin.last n).castSucc by
      change j.val + 1 ≤ n
      exact j.isLt)
    exact (not_le_of_gt ((hvp j).symm.trans_le hh |>.trans_lt (hcut (Fin.last n)).1) hx.1)
  have hcuts_regular (j : Fin (n + 1)) (x : M) (hx : h x = cut j) :
      ¬ IsCriticalPointAt I h x := by
    intro hc
    obtain ⟨i, rfl⟩ := hcrit x hc (hx.le.trans (hcutcap _).le)
    rcases le_or_gt i.castSucc.succ j.castSucc with hij | hij
    · exact (not_le_of_gt ((hvp i).symm.trans_le (hv.monotone hij) |>.trans_lt (hcut j).1)) hx.ge
    · have hj : j.succ ≤ i.castSucc.succ := by
        change j.val < i.val + 1 at hij
        change j.val + 1 ≤ i.val + 1
        omega
      exact (not_le_of_gt ((hcut j).2.trans_le ((hv.monotone hj).trans_eq (hvp i)))) hx.le
  let e := coords
  have hs : ContMDiff (I.transContinuousLinearEquiv e) 𝓘(ℝ, ℝ) ∞ h :=
    e.contMDiff_transContinuousLinearEquiv_left.mpr hf
  refine ⟨hs, ⟨{
    n := n
    points := p
    cuts := cut
    points_strictMono := hpmono
    cuts_strictMono := hcutMono
    cuts_below := hcutcap
    critical_points := hcover
    initial_empty := ?_
    cuts_regular := hcuts_regular
    terminal_regular := hlast
    terminal_transport := exists_regularSublevelTransport hf (hcutcap _).le hlast
    critical_interior := hcritical_interior
    unique_critical := hunique
    step := fun i => exists_endHandleStep hf hs (p i) (hcritical_interior i) (hunique i)
      (hnd _ (hp i).1) (hend _ (hp i).1 (hp i).2).2 }⟩⟩
  obtain ⟨Φ, hsub, _⟩ := exists_regularSublevelTransport hf
    (hvfirst.symm.trans_le (hcut 0).1.le) hfirst
  have hempty : h ⁻¹' Iic a = ∅ := eq_empty_iff_forall_notMem.mpr (fun x hx => (ha x).not_ge hx)
  rw [hempty, image_empty] at hsub
  exact hsub.symm

/-- The lower sublevel at the first middle cut and the upper superlevel at
the second middle cut admit actual native zero- and one-handle filtrations.
The upper one uses the sublevels of the reversed height. -/
theorem exists_orderedEndHandleFiltrations {f h : M → ℝ} {a b : ℝ}
    (P : OrderedMorsePresentation I f h) (B : MiddleIndexCuts I h a b) :
    ∃ (hs : ContMDiff (I.transContinuousLinearEquiv coords) 𝓘(ℝ, ℝ) ∞ h)
      (hsNeg : ContMDiff (I.transContinuousLinearEquiv coords) 𝓘(ℝ, ℝ) ∞ (fun x => -h x)),
      Nonempty (EndHandleFiltration hs a) ∧ Nonempty (EndHandleFiltration hsNeg (-b)) := by
  obtain ⟨hs, hsLower⟩ := exists_endHandleFiltration P.smooth P.morse P.distinct a (by
    intro x hx hxa
    rcases lt_trichotomy (morseIndex I h x) 2 with hlo | heq | hhi
    · exact ⟨B.below x hx hlo, by omega⟩
    · exact ((B.inside x hx heq).1.not_ge hxa).elim
    · exact ((B.lt.trans (B.above x hx hhi)).not_ge hxa).elim)
  have hnegND (x : M) (hx : IsCriticalPointAt I (fun y => -h y) x) :=
    (NegDual.isNondegenerateCriticalPointAt_neg_iff I h x).2
      (P.morse x ((NegDual.isCriticalPointAt_neg_iff I h x).1 hx))
  have hnegInj : InjOn (fun x => -h x) (criticalPoints I (fun x => -h x)) := by
    intro x hx y hy hxy
    exact P.distinct ((NegDual.isCriticalPointAt_neg_iff I h x).1 hx)
      ((NegDual.isCriticalPointAt_neg_iff I h y).1 hy) (neg_injective hxy)
  obtain ⟨hsNeg, hsUpper⟩ := exists_endHandleFiltration P.smooth.neg hnegND hnegInj (-b) (by
    intro x hx hxb
    have hc := (NegDual.isCriticalPointAt_neg_iff I h x).1 hx
    have hdual := morseIndex_neg_add_four (P.morse x hc)
    rcases lt_trichotomy (morseIndex I h x) 2 with hlo | heq | hhi
    · linarith [B.below x hc hlo, B.lt]
    · linarith [(B.inside x hc heq).2]
    · exact ⟨neg_lt_neg (B.above x hc hhi), by omega⟩)
  exact ⟨hs, hsNeg, hsLower, hsUpper⟩

end Filtration
end SmoothPoincare
