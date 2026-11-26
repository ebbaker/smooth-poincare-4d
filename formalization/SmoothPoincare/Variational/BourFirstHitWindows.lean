import SmoothPoincare.Variational.BourGradientScaling
import SmoothPoincare.Variational.BourTerminalDissipation
import SmoothPoincare.Variational.BourHarmonicBalls

/-! # First hits of the ordered curvature on an original regular time interval

Prepared for Edward B. Baker III with OpenAI Codex assistance, 26 November 2026.
A fixed interior starting slice suffices, even when the right endpoint is finite.
-/

open DifferentialGeometry DifferentialGeometry.Geometry.Curvature DifferentialGeometry.PDE.RicciFlow
  DifferentialGeometry.Tensor0SBundle Filter Set MeasureTheory
open scoped Manifold ContDiff Topology

namespace SmoothPoincare.Bour

noncomputable section

/-- The earliest time a jointly continuous field on a compact carrier reaches
a prescribed level. At that time every spatial value still lies below or at the level. -/
private theorem firstHit_on_compact_slab {M : Type*} [TopologicalSpace M] [CompactSpace M]
    (F : ℝ × M → ℝ) {a b L : ℝ} (hab : a ≤ b)
    (hF : ContinuousOn F (Icc a b ×ˢ univ))
    (hstart : ∀ x, F (a, x) < L) (hhigh : ∃ x, L ≤ F (b,x)) :
    ∃ t ∈ Icc a b, ∃ x, F (t,x) = L ∧
      (∀ s ∈ Ico a t, ∀ y, F (s,y) < L) ∧ ∀ y, F (t,y) ≤ L := by
  let K := Icc a b ×ˢ (univ : Set M)
  let H := K ∩ F ⁻¹' Ici L
  have hK : IsCompact K := isCompact_Icc.prod isCompact_univ
  have hH : IsCompact H := hF.upperSemicontinuousOn.isCompact_inter_preimage_Ici hK L
  obtain ⟨y, hy⟩ := hhigh
  have hne : H.Nonempty := ⟨(b,y), ⟨⟨⟨hab, le_rfl⟩, mem_univ _⟩, hy⟩⟩
  obtain ⟨⟨t,x⟩, hx, hmin⟩ := hH.exists_isMinOn hne continuous_fst.continuousOn
  have ht : t ∈ Icc a b := hx.1.1
  have hlt (s : ℝ) (hs : s ∈ Ico a t) (z : M) : F (s,z) < L := by
    by_contra! he
    exact hs.2.not_ge (hmin (show (s,z) ∈ H from ⟨⟨⟨hs.1, hs.2.le.trans ht.2⟩, mem_univ _⟩, he⟩))
  have hle (z : M) : F (t,z) ≤ L := by
    by_contra! he
    have hc : ContinuousOn (fun s => F (s,z)) (Icc a t) :=
      hF.comp (continuous_id.prodMk continuous_const).continuousOn
        (fun s hs => ⟨⟨hs.1, hs.2.trans ht.2⟩, mem_univ _⟩)
    obtain ⟨u, hu, heq⟩ := intermediate_value_Icc ht.1 hc ⟨(hstart z).le, he.le⟩
    by_cases hut : u = t
    · subst u
      exact he.ne' heq
    · exact (hlt u ⟨hu.1, lt_of_le_of_ne hu.2 hut⟩ z).ne heq
  exact ⟨t, ht, x, le_antisymm (hle x) hx.2, hlt, hle⟩

variable {E H M : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
  [FiniteDimensional ℝ E] [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [I.Boundaryless] [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [T2Space M] [CompactSpace M] [BoundarylessManifold I M]

/-- A sequence of true first hits, including a physical spacetime point, control of
all earlier slices after the fixed anchor, and cofinality in the regular time order. -/
theorem bourOriginal_curvature_firstHits (g : ℝ → SmoothRiemannianMetric I M)
    {D : RealTimeInterval} (hG : MetricFamilySmoothOn (I := I) D g)
    (hInt : D.regular.OrdConnected) (a : D.RegularTime) (Q : ℕ → ℝ)
    (hQ : Tendsto Q atTop atTop)
    (hstart : ∀ n x, Real.sqrt (intrinsicCurvatureSq (g a) x) < Q n)
    (hhigh : ∀ L : ℝ, ∃ b : D.RegularTime, a ≤ b ∧
      ∃ x, L ≤ Real.sqrt (intrinsicCurvatureSq (g b) x)) :
    ∃ (t : ℕ → D.RegularTime) (x : ℕ → M), Tendsto t atTop atTop ∧
      ∀ n, a ≤ t n ∧ Real.sqrt (intrinsicCurvatureSq (g (t n)) (x n)) = Q n ∧
      (∀ s ∈ Ico (a : ℝ) (t n : ℝ), ∀ y, Real.sqrt (intrinsicCurvatureSq (g s) y) < Q n) ∧
      ∀ y, Real.sqrt (intrinsicCurvatureSq (g (t n)) y) ≤ Q n := by
  let _ : D.regular.OrdConnected := hInt
  let F := fun p : ℝ × M => Real.sqrt (intrinsicCurvatureSq (g p.1) p.2)
  have hF : ContinuousOn F (D.regular ×ˢ univ) := (bourCurvatureSq_contMDiffOn g hG).continuousOn.sqrt
  have hfind (n : ℕ) : ∃ t : D.RegularTime, ∃ x, a ≤ t ∧ F (t,x) = Q n ∧
      (∀ s ∈ Ico (a : ℝ) (t : ℝ), ∀ y, F (s,y) < Q n) ∧ ∀ y, F (t,y) ≤ Q n := by
    obtain ⟨b, hab, hb⟩ := hhigh (Q n)
    have hslab := D.regular.Icc_subset a.property b.property
    obtain ⟨t, ht, x, he, hprev,hcur⟩ := firstHit_on_compact_slab F hab
      (hF.mono (prod_mono hslab Subset.rfl)) (hstart n) hb
    exact ⟨⟨t,hslab ht⟩, x, ht.1, he, hprev,hcur⟩
  choose t x ht using hfind
  refine ⟨t, x, tendsto_atTop.2 (fun b => ?_), ht⟩
  by_cases hab : a ≤ b
  · let K := Icc (a : ℝ) (b : ℝ) ×ˢ (univ : Set M)
    have hk : IsCompact K := isCompact_Icc.prod isCompact_univ
    have hslab := D.regular.Icc_subset a.property b.property
    obtain ⟨L,hL⟩ := (hk.image_of_continuousOn (hF.mono (prod_mono hslab Subset.rfl))).bddAbove
    filter_upwards [hQ.eventually_gt_atTop L] with n hn
    by_contra! he
    have hmem : ((t n : ℝ),x n) ∈ K := ⟨⟨(ht n).1,he.le⟩,mem_univ _⟩
    exact hn.not_ge ((ht n).2.1 ▸ hL (mem_image_of_mem F hmem))
  · exact Eventually.of_forall (fun n => (le_of_not_ge hab).trans (ht n).1)


/-- A vanishing negative time shift of cofinal regular times is eventually
regular and remains cofinal, also at a finite open terminal time. The max
only supplies a total regular-time sequence before the windows fit. -/
theorem bourRegular_backwardWindow {D : RealTimeInterval} (hInt : D.regular.OrdConnected)
    (a : D.RegularTime) {t : ℕ → D.RegularTime} (hta : ∀ n, a ≤ t n)
    (ht : Tendsto t atTop atTop) (Q : ℕ → ℝ) (hQ : Tendsto Q atTop atTop)
    {A : ℝ} (hA : A ≤ 0) :
    ∃ left : ℕ → D.RegularTime, Tendsto left atTop atTop ∧
      (∀ n, a ≤ left n ∧ left n ≤ t n) ∧
      ∀ᶠ n in atTop, (left n : ℝ) = A / (Q n)^2 + (t n : ℝ) := by
  let _ : D.regular.OrdConnected := hInt
  let δ := fun n => A / (Q n)^2
  have hδ : Tendsto δ atTop (𝓝 0) :=
    tendsto_const_nhds.div_atTop ((tendsto_pow_atTop (n := 2) (by decide)).comp hQ)
  have hshift (b : D.RegularTime) : ∀ᶠ n in atTop, (b : ℝ) ≤ δ n + (t n : ℝ) := by
    obtain ⟨l, u, hlu, hsub⟩ :=
      mem_nhds_iff_exists_Ioo_subset.mp (D.regular_isOpen.mem_nhds b.property)
    obtain ⟨v,hbv,hvu⟩ := exists_between hlu.2
    let v' : D.RegularTime := ⟨v,hsub ⟨hlu.1.trans hbv,hvu⟩⟩
    filter_upwards [ht.eventually_ge_atTop v', hδ.eventually (lt_mem_nhds (sub_neg.mpr hbv))] with n hn hsmall
    change v ≤ (t n : ℝ) at hn
    linarith
  let left (n : ℕ) : D.RegularTime :=
    ⟨max (a : ℝ) (δ n + (t n : ℝ)), D.regular.Icc_subset a.property (t n).property
      ⟨le_max_left _ _,max_le (hta n) (add_le_of_nonpos_left
        (div_nonpos_of_nonpos_of_nonneg hA (sq_nonneg _)))⟩⟩
  refine ⟨left, tendsto_atTop.2 (fun b => ?_), ?_, ?_⟩
  · exact (hshift b).mono (fun n hn => hn.trans (le_max_right _ _))
  · intro n
    change (a : ℝ) ≤ max (a : ℝ) _ ∧ max (a : ℝ) _ ≤ (t n : ℝ)
    exact ⟨le_max_left _ _, max_le (hta n) (add_le_of_nonpos_left
      (div_nonpos_of_nonpos_of_nonneg hA (sq_nonneg _)))⟩
  · exact (hshift a).mono (fun n hn => max_eq_right hn)

variable [NeZero (Module.finrank ℝ E)] {o : ManifoldOrientation I M 4}

/-- On unbounded original curvature, choose true first hits once for all
window lengths. Every fixed normalized backward window has curvature
at most one everywhere, curvature one at its marked endpoint, and
vanishing original negative twice-gradient dissipation in scaled time. -/
theorem originalGradient_firstHit_spacetimeWindows
    (q : ℝ → SignedCollarMetric o) {p C : ℝ} (hp : 0 ≤ p) (hp₁ : p ≤ 1)
    {D : RealTimeInterval} (hInt : D.regular.OrdConnected)
    (hG : MetricFamilySmoothOn (I := I) D (fun s => (q s).metric))
    (hEuler : ∀ s ∈ D.regular, bourEuler (q s) = C)
    (hFlow : ∀ s ∈ D.regular, ∀ x, deriv (fun v => metricTensorField (q v).metric x) s =
      (-2 : ℝ) • bourCovariantGradient p (q s).metric x)
    (a : D.RegularTime) (Q : ℕ → ℝ) (hpos : ∀ n, 0 < Q n) (hQ : Tendsto Q atTop atTop)
    (hstart : ∀ n x, Real.sqrt (intrinsicCurvatureSq (q a).metric x) < Q n)
    (hhigh : ∀ L : ℝ, ∃ b : D.RegularTime, a ≤ b ∧
      ∃ x, L ≤ Real.sqrt (intrinsicCurvatureSq (q b).metric x)) :
    ∃ (t : ℕ → D.RegularTime) (x : ℕ → M), Tendsto t atTop atTop ∧
      (∀ n, Real.sqrt (intrinsicCurvatureSq (scaleMetric (Q n) (hpos n) (q (t n)).metric) (x n)) = 1) ∧
      ∀ A : ℝ, A ≤ 0 →
        (∀ᶠ n in atTop, ∀ s ∈ Icc A 0, let v := s / (Q n)^2 + (t n : ℝ)
          v ∈ D.regular ∧ ∀ y, Real.sqrt
            (intrinsicCurvatureSq (scaleMetric (Q n) (hpos n) (q v).metric) y) ≤ 1) ∧
        Tendsto (fun n => ∫ s in A..(0 : ℝ), let v := s / (Q n)^2 + (t n : ℝ)
          gradientSq (scaleMetric (Q n) (hpos n) (q v).metric)
            (fun y => (Q n)⁻¹ • bourCovariantGradient p (q v).metric y)) atTop (𝓝 0) := by
  let _ : D.regular.OrdConnected := hInt
  obtain ⟨t,x,ht,hh⟩ := bourOriginal_curvature_firstHits (fun s => (q s).metric)
    hG hInt a Q hQ hstart hhigh
  refine ⟨t,x,ht,fun n => ?_,fun A hA => ?_⟩
  · rw [bourFullCurvatureNorm_scale _ _ _, (hh n).2.1, div_self (hpos n).ne']
  · obtain ⟨left, hl, hbracket, hwin⟩ :=
      bourRegular_backwardWindow hInt a (fun n => (hh n).1) ht Q hQ hA
    refine ⟨?_,originalGradient_parabolicDissipation_tendsto_terminal q hp hp₁ hInt hG hEuler hFlow
      hl ht Q hpos A hA hwin⟩
    filter_upwards [hwin] with n hn
    intro s hs
    dsimp only
    let v := s / (Q n)^2 + (t n : ℝ)
    have hlv : (left n : ℝ) ≤ v := by
      rw [hn]
      exact add_le_add (div_le_div_of_nonneg_right hs.1 (sq_nonneg (Q n))) le_rfl
    have hvt : v ≤ (t n : ℝ) := add_le_of_nonpos_left (div_nonpos_of_nonpos_of_nonneg hs.2 (sq_nonneg _))
    refine ⟨D.regular.Icc_subset (left n).property (t n).property ⟨hlv,hvt⟩,fun y => ?_⟩
    rw [bourFullCurvatureNorm_scale]
    apply (div_le_one (hpos n)).2
    rcases hvt.lt_or_eq with h | h
    · exact ((hh n).2.2.1 v ⟨(show (a : ℝ) ≤ (left n : ℝ) from (hbracket n).1).trans hlv,h⟩ y).le
    · change Real.sqrt (intrinsicCurvatureSq (q v).metric y) ≤ Q n
      rw [h]
      exact (hh n).2.2.2 y

/-- At genuine curvature first hits, the vanishing integral uses the native gradient
of the rescaled metric at every time in the normalized window. -/
theorem originalGradient_firstHit_nativeWindows
    (q : ℝ → SignedCollarMetric o) {p C : ℝ} (hp : 0 ≤ p) (hp₁ : p ≤ 1)
    {D : RealTimeInterval} (hInt : D.regular.OrdConnected)
    (hG : MetricFamilySmoothOn (I := I) D (fun s => (q s).metric))
    (hEuler : ∀ s ∈ D.regular, bourEuler (q s) = C)
    (hFlow : ∀ s ∈ D.regular, ∀ x, deriv (fun v => metricTensorField (q v).metric x) s =
      (-2 : ℝ) • bourCovariantGradient p (q s).metric x)
    (a : D.RegularTime) (Q : ℕ → ℝ) (hpos : ∀ n, 0 < Q n) (hQ : Tendsto Q atTop atTop)
    (hstart : ∀ n x, Real.sqrt (intrinsicCurvatureSq (q a).metric x) < Q n)
    (hhigh : ∀ L : ℝ, ∃ b : D.RegularTime, a ≤ b ∧
      ∃ x, L ≤ Real.sqrt (intrinsicCurvatureSq (q b).metric x)) :
    ∃ (t : ℕ → D.RegularTime) (x : ℕ → M), Tendsto t atTop atTop ∧
      (∀ n, Real.sqrt (intrinsicCurvatureSq (scaleMetric (Q n) (hpos n) (q (t n)).metric) (x n)) = 1) ∧
      ∀ A : ℝ, A ≤ 0 →
        (∀ᶠ n in atTop, ∀ s ∈ Icc A 0, let v := s / (Q n)^2 + (t n : ℝ)
          v ∈ D.regular ∧ ∀ y, Real.sqrt
            (intrinsicCurvatureSq (scaleMetric (Q n) (hpos n) (q v).metric) y) ≤ 1) ∧
        Tendsto (fun n => ∫ s in A..(0 : ℝ), let v := s / (Q n)^2 + (t n : ℝ)
          gradientSq (scaleMetric (Q n) (hpos n) (q v).metric)
            (bourCovariantGradient p (scaleMetric (Q n) (hpos n) (q v).metric))) atTop (𝓝 0) := by
  simp_rw [bourCovariantGradient_scaleMetric]
  exact originalGradient_firstHit_spacetimeWindows q hp hp₁ hInt hG hEuler hFlow a Q hpos hQ hstart hhigh

end
end SmoothPoincare.Bour
