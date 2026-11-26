import SmoothPoincare.Heights.MarkedEdgeGluing
import DifferentialGeometry.Topology.Morse.Attachment.SublevelTransport

/-! # Retain the rounded factorization at a refined native one-handle -/

open DifferentialGeometry.Topology DifferentialGeometry.Topology.Morse Set
open DifferentialGeometry.Topology.Morse.CellAttachment
open DifferentialGeometry.Topology.Morse.ManifoldCellAttachment
open scoped ContDiff Manifold Topology

namespace SmoothPoincare.IsolatedOneHandle

noncomputable section

variable {H M : Type} [TopologicalSpace H] [TopologicalSpace M] [ChartedSpace H M]
  {J : ModelWithCorners ℝ (MorseModel 4) H} [J.Boundaryless] [IsManifold J ∞ M]
  {f : M → ℝ} {hf : ContMDiff J 𝓘(ℝ, ℝ) ∞ f} {p : M} {lo hi : ℝ}

local notation "I₄" => morseModelWithCornersHalfSpace 3
local notation "hk₁" => (show (1 : ℕ) ≤ 4 by decide)

/-- The rounded model, the two smooth comparison maps chosen in one construction,
and the exact markings on the two native trace representatives. -/
structure RetainedRoundedTrace (D : IsolatedOneHandle hf p lo hi) where
  δ : ℝ
  θ : ℝ
  R₀ : ℝ
  R₁ : ℝ
  core_room : Real.sqrt (2 * D.ε + 2 * D.r ^ 2) < R₀
  radii : R₀ < R₁
  smooth : ContMDiff J 𝓘(ℝ, ℝ) ∞ (morseRoundedFunction hk₁ (f p) D.ε D.r δ R₀ R₁ D.chart)
  regular : ∀ x, morseRoundedFunction hk₁ (f p) D.ε D.r δ R₀ R₁ D.chart x = f p →
    ¬ IsCriticalPointAt J (morseRoundedFunction hk₁ (f p) D.ε D.r δ R₀ R₁ D.chart) x
  toRounded :
    let g := morseRoundedFunction hk₁ (f p) D.ε D.r δ R₀ R₁ D.chart
    letI := D.traceCharts
    letI := manifoldSublevelChartedSpace J g (f p) smooth regular
    Handle.AdjunctionSpace 1 3 (morseAttachingEmbedding hk₁ (f p) D.ε D.r D.chart D.ε_pos D.attaching_radius) ≃ₘ^∞⟮I₄,I₄⟯ SublevelSpace g (f p)
  toUpper :
    let g := morseRoundedFunction hk₁ (f p) D.ε D.r δ R₀ R₁ D.chart
    letI := manifoldSublevelChartedSpace J g (f p) smooth regular
    letI := manifoldSublevelChartedSpace J f (f p + D.ε) hf D.upper_regular
    SublevelSpace g (f p) ≃ₘ^∞⟮I₄,I₄⟯ SublevelSpace f (f p + D.ε)
  factor :
    let g := morseRoundedFunction hk₁ (f p) D.ε D.r δ R₀ R₁ D.chart
    letI := D.traceCharts
    letI := manifoldSublevelChartedSpace J g (f p) smooth regular
    letI := manifoldSublevelChartedSpace J f (f p + D.ε) hf D.upper_regular
    ∀ z : Handle.AdjunctionSpace 1 3 (morseAttachingEmbedding hk₁ (f p) D.ε D.r D.chart D.ε_pos D.attaching_radius), D.traceDiffeomorph z = toUpper (toRounded z)
  lower_point :
    let g := morseRoundedFunction hk₁ (f p) D.ε D.r δ R₀ R₁ D.chart
    letI := D.traceCharts
    letI := manifoldSublevelChartedSpace J g (f p) smooth regular
    ∀ x : SublevelSpace f (f p - D.ε),
      (toRounded (Handle.lower (morseAttachingEmbedding hk₁ (f p) D.ε D.r D.chart D.ε_pos D.attaching_radius) x)).val =
        morseCapRoundedLowerRound hk₁ (f p) D.ε D.r δ θ D.chart x.val
  cell_point :
    let g := morseRoundedFunction hk₁ (f p) D.ε D.r δ R₀ R₁ D.chart
    letI := D.traceCharts
    letI := manifoldSublevelChartedSpace J g (f p) smooth regular
    ∀ d : Handle.StandardHandle 1 3, (toRounded (Handle.cell (morseAttachingEmbedding hk₁ (f p) D.ε D.r D.chart D.ε_pos D.attaching_radius) d)).val =
      handleRoundEmbedding hk₁ (f p) D.ε D.r δ θ D.chart d

  toRounded_deep :
    let g := morseRoundedFunction hk₁ (f p) D.ε D.r δ R₀ R₁ D.chart
    letI := D.traceCharts
    letI := manifoldSublevelChartedSpace J g (f p) smooth regular
    ∀ x : M, f x ≤ f p - D.ε - D.η → ∀ hx : f x ≤ f p - D.ε,
      let z := Handle.lower (morseAttachingEmbedding hk₁ (f p) D.ε D.r D.chart D.ε_pos D.attaching_radius) ⟨x,hx⟩
      (toRounded z).val = x ∧ ∀ hy : g x ≤ f p, toRounded.symm ⟨x,hy⟩ = z
  toUpper_deep :
    let g := morseRoundedFunction hk₁ (f p) D.ε D.r δ R₀ R₁ D.chart
    letI := manifoldSublevelChartedSpace J g (f p) smooth regular
    letI := manifoldSublevelChartedSpace J f (f p + D.ε) hf D.upper_regular
    ∀ x : M, f x ≤ f p - D.ε - D.η → ∀ hx : g x ≤ f p,
      (toUpper ⟨x,hx⟩).val = x ∧ ∀ hy : f x ≤ f p + D.ε, (toUpper.symm ⟨x,hy⟩).val = x

/-- Inverting the stored trace uses exactly the inverses of its retained factors. -/
theorem RetainedRoundedTrace.inverse {D : IsolatedOneHandle hf p lo hi}
    (C : RetainedRoundedTrace D) :
    let g := morseRoundedFunction hk₁ (f p) D.ε D.r C.δ C.R₀ C.R₁ D.chart
    letI := D.traceCharts
    letI := manifoldSublevelChartedSpace J g (f p) C.smooth C.regular
    letI := manifoldSublevelChartedSpace J f (f p + D.ε) hf D.upper_regular
    ∀ y : SublevelSpace f (f p + D.ε), D.traceDiffeomorph.symm y = C.toRounded.symm (C.toUpper.symm y) := by
  let g := morseRoundedFunction hk₁ (f p) D.ε D.r C.δ C.R₀ C.R₁ D.chart
  let _ := D.traceCharts
  let _ := manifoldSublevelChartedSpace J g (f p) C.smooth C.regular
  let _ := manifoldSublevelChartedSpace J f (f p + D.ε) hf D.upper_regular
  intro _ y
  apply D.traceDiffeomorph.injective
  let z := C.toRounded.symm (C.toUpper.symm y)
  calc
    D.traceDiffeomorph (D.traceDiffeomorph.symm y) = y :=
      D.traceDiffeomorph.apply_symm_apply y
    _ = C.toUpper (C.toRounded z) := by
      change y = C.toUpper (C.toRounded (C.toRounded.symm (C.toUpper.symm y)))
      rw [C.toRounded.apply_symm_apply, C.toUpper.apply_symm_apply]
    _ = D.traceDiffeomorph z := (C.factor z).symm

set_option maxHeartbeats 2000000 in
/-- At the same actual critical point, construct a smaller native one-handle
on the original Morse chart. Preserve the complete lower and upper regular
marked comparisons to the original cuts and retain both rounded factors. -/
theorem exists_retainedRoundedTrace [T2Space M] [CompactSpace M]
    (D : IsolatedOneHandle hf p lo hi)
    (hunique : ∀ x, f x ∈ Icc lo hi → IsCriticalPointAt J f x → x = p) :
    let a := min D.ε (D.chart.R ^ 2 / 16)
    ∃ (D' : IsolatedOneHandle hf p lo hi) (C : RetainedRoundedTrace D')
      (A G : M ≃ₘ^∞⟮J,J⟯ M),
      D'.chart = D.chart ∧ D'.ε = a / 4 ∧ D'.r = Real.sqrt a / 2 ∧ D'.η = a / 4 ∧
      D'.ε < D.ε ∧ C.δ = a / 20 ∧ C.θ = a / 20 ∧ C.R₀ = Real.sqrt (2 * a) ∧
      C.R₁ = 3 * D.chart.R / 4 ∧
      f p - D.ε - D.η < f p - D'.ε - D'.η ∧
      RegularEndMarked hf hf D.lower_regular D'.lower_regular A ∧
      RegularEndMarked hf hf D'.upper_regular D.upper_regular G := by
  let c := f p
  let data := D.chart
  let R := data.R
  let a := min D.ε (R ^ 2 / 16)
  let ε := a / 4
  let r := Real.sqrt a / 2
  let δ := a / 20
  let θ := δ
  let η := a / 4
  let ε₀ := a / 200
  let η' := a / 20
  let R₀ := Real.sqrt (2 * a)
  let R₁ := 3 * R / 4
  let R₂ := 7 * R / 8
  have hRpos : 0 < R := data.radius_pos
  have hR2 : 0 < R ^ 2 := sq_pos_of_pos hRpos
  have ha : 0 < a := lt_min D.ε_pos (by positivity)
  have haεold : a ≤ D.ε := min_le_left _ _
  have haR : a ≤ R ^ 2 / 16 := min_le_right _ _
  have hr2 : r ^ 2 = a / 4 := by
    dsimp only [r]
    rw [div_pow, Real.sq_sqrt ha.le]
    norm_num
  have hR₀sq : R₀ ^ 2 = 2 * a := Real.sq_sqrt (by positivity)
  have hε : 0 < ε := by dsimp [ε]; positivity
  have hr : 0 < r := by dsimp [r]; positivity
  have hδ : 0 < δ := by dsimp [δ]; positivity
  have hθ : 0 < θ := hδ
  have hδr : δ < r ^ 2 := by rw [hr2]; dsimp [δ]; linarith
  have hθr : θ < r ^ 2 := hδr
  have hη : 0 < η := by dsimp [η]; positivity
  have hε₀ : 0 < ε₀ := by dsimp [ε₀]; positivity
  have hη' : 0 < η' := by dsimp [η']; positivity
  have hR₀ : 0 ≤ R₀ := Real.sqrt_nonneg _
  have hR₁ : 0 ≤ R₁ := by dsimp [R₁]; positivity
  have hR₀R₁ : R₀ < R₁ := by
    apply (sq_lt_sq₀ hR₀ hR₁).1
    rw [hR₀sq]
    dsimp only [R₁]
    nlinarith only [haR,hR2]
  have hR₁R₂ : R₁ < R₂ := by dsimp [R₁,R₂]; linarith
  have hR₂R : R₂ ≤ R := by dsimp [R₂]; linarith
  have hR₁R := hR₁R₂.le.trans hR₂R
  have hR₀R := hR₀R₁.trans_le hR₁R
  have hR₂smooth : R₂ ≤ data.smoothRadius := hR₂R.trans D.chart_radius_lt.le
  have hRbig : r ^ 2 + 2 * ε + δ ≤ (R / 2) ^ 2 := by
    rw [hr2]
    dsimp only [ε,δ]
    nlinarith only [haR,hR2]
  have hbig : 2 * (r ^ 2 + 2 * ε + δ) ≤ R₀ ^ 2 := by
    rw [hr2,hR₀sq]
    dsimp only [ε,δ]
    linarith only [ha]
  have hR₁big : 2 * (R / 2) ^ 2 - 2 * ε ≤ R₁ ^ 2 := by
    dsimp only [ε,R₁]
    nlinarith only [ha,hR2]
  have hδR : 40 * δ < R₁ ^ 2 - R₀ ^ 2 := by
    rw [hR₀sq]
    dsimp only [δ,R₁]
    nlinarith only [haR,hR2]
  have hεr' : Real.sqrt (2 * ε + 2 * r ^ 2) < R / 2 := by
    rw [hr2, show 2 * ε + 2 * (a / 4) = a from by dsimp [ε]; ring]
    apply (sq_lt_sq₀ (Real.sqrt_nonneg _) (by positivity : 0 ≤ R / 2)).1
    rw [Real.sq_sqrt ha.le]
    nlinarith only [haR,hR2]
  have hεr : Real.sqrt (2 * ε + 2 * r ^ 2) ≤ R := hεr'.le.trans (by linarith)
  have hcore : Real.sqrt (2 * ε + 2 * r ^ 2) < R₀ := by
    apply (sq_lt_sq₀ (Real.sqrt_nonneg _) hR₀).1
    rw [hr2,hR₀sq,Real.sq_sqrt (by positivity)]
    dsimp only [ε]
    linarith only [ha]
  have hε₀le : 2 * ε₀ < min (min ε (r ^ 2 / 2)) ((r ^ 2 - δ) / 2) := by
    rw [hr2,lt_min_iff,lt_min_iff]
    dsimp only [ε,δ,ε₀]
    exact ⟨⟨by linarith, by linarith⟩, by linarith⟩
  have hηguard : r ^ 2 + δ ≤ 2 * η := by rw [hr2]; dsimp [δ,η]; linarith
  have hηε₀ : 2 * ε₀ < η := by dsimp [ε₀,η]; linarith
  have haε : ε + 2 * ε₀ ≤ a := by dsimp [ε,ε₀]; linarith
  have hηθ : 2 * η' ≤ r ^ 2 - θ := by rw [hr2]; dsimp [η',θ,δ]; linarith
  have hηε : η' < ε := by dsimp [η',ε]; linarith
  have h2R₀R : 2 * R₀ < R := by
    apply (sq_lt_sq₀ (by positivity) hRpos.le).1
    rw [mul_pow,hR₀sq]
    nlinarith only [haR,hR2]
  have hεold : ε < D.ε := (show ε < a by dsimp [ε]; linarith).trans_le haεold
  have haband (x : M) (hx : f x ∈ Icc (c-a) (c+a)) : f x ∈ Icc lo hi := by
    exact ⟨by linarith [hx.1,D.lower_inside,haεold], by linarith [hx.2,D.upper_inside,haεold]⟩
  have huniq (x : M) (hx : f x ∈ Icc (c-a) (c+a)) :
      x = data.p ∨ ¬ IsCriticalPointAt J f x := by
    by_cases h : IsCriticalPointAt J f x
    · exact Or.inl ((hunique x (haband x hx) h).trans D.chart_point.symm)
    · exact Or.inr h
  have hcompact : IsCompact (f ⁻¹' Icc (c-a) (c+a)) :=
    (isClosed_Icc.preimage hf.continuous).isCompact
  have hl (x : M) (hx : f x = c-ε) : ¬ IsCriticalPointAt J f x := by
    intro hxcrit
    have hxband : f x ∈ Icc lo hi := ⟨by linarith [D.lower_inside], by linarith [D.upper_inside]⟩
    have hxp := hunique x hxband hxcrit
    subst x
    change f p = f p - ε at hx
    linarith
  have hu (x : M) (hx : f x = c+ε) : ¬ IsCriticalPointAt J f x :=
    morseFunction_no_critical_at_upper_level_of_morseChart hk₁ c ε a ε₀ data hε hε₀ haε huniq hx
  let g := morseRoundedFunction hk₁ c ε r δ R₀ R₁ data
  have hg : ContMDiff J 𝓘(ℝ,ℝ) ∞ g :=
    contMDiff_morseRoundedFunction hk₁ c ε r δ R₀ R₁ R₂ data hf hR₀R₁ hR₀ hR₁R₂ hR₂R hR₂smooth
  have hgreg : ∀ x, g x = c → ¬ IsCriticalPointAt J g x :=
    fun _ hx => morseRoundedFunction_no_critical_at_level hk₁ c ε r δ R₀ R₁ R₂ data
      hε hδ hδr hR₀R₁ hR₀ hbig hR₁R₂ hR₂R hR₂smooth hl hx
  let φ := morseAttachingEmbedding hk₁ c ε r data hε hεr
  let charts := morseHandleAdjunctionChartedSpace hk₁ c ε r δ θ R₀ R₀ R₁ R₂ data hε hδ hθ
    hδr hθr hr hεr hεr' hR₀ hR₀R hbig hRbig hR₀R₁ hR₀ hbig hR₁big hR₁R hR₁R₂ hR₂R hR₂smooth
    hf.continuous hf hl
  let _ := charts
  let _ := manifoldSublevelChartedSpace J g c hg hgreg
  let _ := manifoldSublevelChartedSpace J f (c+ε) hf hu
  let e₀ := morseHandleAdjunctionDiffeomorphRoundedSublevel hk₁ c ε r δ θ R₀ R₀ R₁ R₂ data hε hδ hθ
    hδr hθr hr hεr hεr' hR₀ hR₀R hbig hRbig hR₀R₁ hR₀ hbig hR₁big hR₁R hR₁R₂ hR₂R hR₂smooth
    hf.continuous hf hl
  obtain ⟨e₂, hdeep₂⟩ := exists_morseRoundedSublevel_diffeomorph_upperSublevel_of_morseChart
    hk₁ c ε r δ R₀ R₁ R₂ a η ε₀ data hε hε₀ hδ hδr
    hR₀R₁ hR₀ hbig hδR hε₀le hR₁R₂ hR₂R hR₂smooth hf haε hcompact huniq hl hηguard hηε₀
  let E := e₀.trans e₂
  have hdeep₀ (x : M) (hx : f x ≤ c-ε-η) (hxlo : f x ≤ c-ε) :
      (e₀ (Handle.lower φ ⟨x,hxlo⟩)).val = x :=
    morseHandleAdjunctionEquivRoundedSublevel_lower_deep hk₁ c ε r δ θ R₀ R₀ R₁ η data
      hε hδ hθ hδr hθr hr hεr hεr' hR₀ hR₀R hbig hRbig hR₀R₁ hR₀ hbig hR₁big hR₁R
      hf.continuous hηguard hxlo hx
  have hdeep (x : M) (hx : f x ≤ c-ε-η) (hxlo : f x ≤ c-ε) :
      (E (Handle.lower φ ⟨x,hxlo⟩)).val = x := by
    have heq₀ := hdeep₀ x hx hxlo
    have hmem : g x ≤ c := heq₀ ▸ (e₀ (Handle.lower φ ⟨x,hxlo⟩)).property
    have heq : e₀ (Handle.lower φ ⟨x,hxlo⟩) = ⟨x,hmem⟩ := Subtype.ext heq₀
    change (e₂ (e₀ (Handle.lower φ ⟨x,hxlo⟩))).val = x
    rw [heq]
    exact (hdeep₂ x hx hmem).1
  let D' : IsolatedOneHandle hf p lo hi :=
    { chart := data
      chart_point := D.chart_point
      chart_radius_lt := D.chart_radius_lt
      double_radius_le_smooth := D.double_radius_le_smooth
      double_ball_subset_source := D.double_ball_subset_source
      double_normalForm_on := D.double_normalForm_on
      ε := ε
      ε_pos := hε
      r := r
      r_pos := hr
      attaching_radius := hεr
      lower_inside := by linarith [D.lower_inside]
      upper_inside := by linarith [D.upper_inside]
      lower_regular := hl
      upper_regular := hu
      η := η
      η_pos := hη
      traceCharts := charts
      trace_isManifold := morseHandleAdjunctionIsManifold hk₁ c ε r δ θ R₀ R₀ R₁ R₂ data hε hδ hθ
        hδr hθr hr hεr hεr' hR₀ hR₀R hbig hRbig hR₀R₁ hR₀ hbig hR₁big hR₁R hR₁R₂ hR₂R hR₂smooth
        hf.continuous hf hl
      upper_isManifold := manifoldSublevelIsManifold J f (c+ε) hf hu
      traceDiffeomorph := E
      lower_smooth := contMDiff_morseHandleAdjunctionLower hk₁ c ε r δ θ η' R₀ R R₀ R₁ R₂ data hε hδ hθ
        hδr hθr hr hη' hηθ hηε hεr hεr' hR₀ hR₀R hR₀R le_rfl D.chart_radius_lt.le
        h2R₀R hbig hRbig hR₀R₁ hR₀R₁ hR₀ hbig hR₁big hR₁R
        (hR₁R₂.trans_le hR₂R) hR₁R₂ hR₂R hR₂smooth hf.continuous hf hl
      fixes_deep_lower := hdeep
      deep_lower_preimage := fun x hx hy z hz => E.injective
        (hz.trans (Subtype.ext (hdeep x hx (hx.trans (sub_le_self _ hη.le)))).symm)
      handle_smooth := contMDiff_morseHandleAdjunctionCell hk₁ c ε r δ θ R₀ R₀ R₁ R₂ data hε hδ hθ
        hδr hθr hr hεr hεr' hR₀ hR₀R hbig hRbig hR₀R₁ hR₀ hbig hR₁big hR₁R hR₁R₂ hR₂R hR₂smooth
        D.chart_radius_lt hf.continuous hf hl }
  let C : RetainedRoundedTrace D' :=
    { δ := δ
      θ := θ
      R₀ := R₀
      R₁ := R₁
      core_room := hcore
      radii := hR₀R₁
      smooth := hg
      regular := hgreg
      toRounded := e₀
      toUpper := e₂
      factor := fun _ => rfl
      lower_point := morseHandleAdjunctionEquivRoundedSublevel_lower hk₁ c ε r δ θ R₀ R₀ R₁ data hε hδ hθ
        hδr hθr hr hεr hεr' hR₀ hR₀R hbig hRbig hR₀R₁ hR₀ hbig hR₁big hR₁R hf.continuous
      cell_point := morseHandleAdjunctionEquivRoundedSublevel_cell hk₁ c ε r δ θ R₀ R₀ R₁ data hε hδ hθ
        hδr hθr hr hεr hεr' hR₀ hR₀R hbig hRbig hR₀R₁ hR₀ hbig hR₁big hR₁R hf.continuous
      toRounded_deep := by
        intro _ x hx hxlo
        refine ⟨hdeep₀ x hx hxlo, ?_⟩
        intro hy
        apply e₀.injective
        calc
          e₀ (e₀.symm ⟨x,hy⟩) = ⟨x,hy⟩ := e₀.apply_symm_apply _
          _ = e₀ (Handle.lower φ ⟨x,hxlo⟩) := (Subtype.ext (hdeep₀ x hx hxlo)).symm
      toUpper_deep := hdeep₂ }
  have hleft (x : M) (hx : f x ∈ Icc (f p-D.ε) (f p-ε)) : ¬ IsCriticalPointAt J f x := by
    intro hxcrit
    have hc := hunique x ⟨by linarith [hx.1,D.lower_inside], by linarith [hx.2,D.upper_inside]⟩ hxcrit
    subst x
    linarith [hx.2]
  have hright (x : M) (hx : f x ∈ Icc (f p+ε) (f p+D.ε)) : ¬ IsCriticalPointAt J f x := by
    intro hxcrit
    have hc := hunique x ⟨by linarith [hx.1,D.lower_inside], by linarith [hx.2,D.upper_inside]⟩ hxcrit
    subst x
    linarith [hx.1]
  obtain ⟨A,hA⟩ := exists_regularBandEndMarked hf (show f p-D.ε ≤ f p-ε by linarith)
    (isClosed_Icc.preimage hf.continuous).isCompact hleft
  obtain ⟨G,hG⟩ := exists_regularBandEndMarked hf (show f p+ε ≤ f p+D.ε by linarith)
    (isClosed_Icc.preimage hf.continuous).isCompact hright
  exact ⟨D', C, A, G, rfl, rfl, rfl, rfl, hεold, rfl, rfl, rfl, rfl,
    by change f p-D.ε-D.η < f p-ε-η; dsimp [ε,η]; linarith [D.η_pos], hA, hG⟩

end

end SmoothPoincare.IsolatedOneHandle
