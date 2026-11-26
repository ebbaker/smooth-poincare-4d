import SmoothPoincare.Variational.BourTerminalDissipation
import DifferentialGeometry.Analysis.Integration.Measure.PullbackPartial
import DifferentialGeometry.Analysis.Integration.Measure.VolumeDensity

/-! # Stationarity on measured terminal backward comparisons

26 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance.
Actual serving settings were unavailable. Edition 06, E51, Route 12.
-/

open DifferentialGeometry DifferentialGeometry.Geometry DifferentialGeometry.Geometry.Curvature
  DifferentialGeometry.Integral.Measure
  DifferentialGeometry.PDE.RicciFlow DifferentialGeometry.Tensor0SBundle
  Filter MeasureTheory Set TopologicalSpace
open scoped ContDiff ENNReal Manifold Topology

set_option autoImplicit false

namespace SmoothPoincare.Bour

noncomputable section

variable {E F H H' M N : Type*}
  [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
  [NormedAddCommGroup F] [InnerProductSpace ℝ F] [FiniteDimensional ℝ F]
  [TopologicalSpace H] [TopologicalSpace H']
  {I : ModelWithCorners ℝ E H} {J : ModelWithCorners ℝ F H'}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M] [CompactSpace M]
  [TopologicalSpace N] [ChartedSpace H' N] [IsManifold J ∞ N] [T2Space N] [SigmaCompactSpace N]

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩
private local instance : MeasurableSpace N := borel N
private local instance : BorelSpace N := ⟨rfl⟩

omit [SigmaCompactSpace N] [T2Space N] in
/-- Vanishing dissipation on a fixed backward slab forces a continuous
limit gradient to vanish through its final slice. On each compact domain
the squared norms are compared on one time-independent spatial map.
Only a uniform positive lower bound on its image volume is needed
to transfer the dissipation. -/
theorem terminalGradient_zero_of_measuredComparisons {A : ℝ} (hA : A < 0)
    (g : ℕ → ℝ → SmoothRiemannianMetric I M)
    (G : ℕ → ℝ → (x : M) → Tensor0SSpace (𝕜 := ℝ) 2 I x)
    (h : ℝ → SmoothRiemannianMetric J N)
    (K : ℝ → (x : N) → Tensor0SSpace (𝕜 := ℝ) 2 J x)
    (hSpatial : ∀ i t, t ∈ Icc A 0 → Integrable (fun x => normSq0S (g i t) x 2 (G i t x))
      (riemannianVolumeMeasure I M (g i t)))
    (hTime : ∀ᶠ i in atTop, IntervalIntegrable (fun s => gradientSq (g i s) (G i s)) volume A 0)
    (hDissipation : Tendsto (fun i => ∫ s in A..(0 : ℝ), gradientSq (g i s) (G i s)) atTop (𝓝 0))
    (hContinuous : ContinuousOn (fun z : ℝ × N => normSq0S (h z.1) z.2 2 (K z.1 z.2))
      (Icc A 0 ×ˢ univ))
    (hLocal : ∀ L : Set N, IsCompact L → (interior L).Nonempty →
      ∃ (Φ : ℕ → N → M) (b : ℝ), 0 < b ∧
        TendstoUniformlyOn (fun i (z : ℝ × N) => normSq0S (g i z.1) (Φ i z.2) 2 (G i z.1 (Φ i z.2)))
          (fun z : ℝ × N => normSq0S (h z.1) z.2 2 (K z.1 z.2)) atTop (Icc A 0 ×ˢ L) ∧
        ∀ᶠ i in atTop, MeasurableSet (Φ i '' L) ∧
          ∀ s ∈ Icc A (0 : ℝ), b ≤ (riemannianVolumeMeasure I M (g i s)).real (Φ i '' L)) :
    ∀ t ∈ Icc A (0 : ℝ), ∀ x, K t x = 0 := by
  let F := fun z : ℝ × N => normSq0S (h z.1) z.2 2 (K z.1 z.2)
  have hInterior : ∀ t ∈ Ioo A (0 : ℝ), ∀ x : N, F (t, x) = 0 := by
    intro t ht x
    by_contra hne
    have hp : 0 < F (t, x) := lt_of_le_of_ne (normSq0S_nonneg _ _ _ _) (fun hz => hne hz.symm)
    let δ := F (t, x) / 4
    have hδ : 0 < δ := by dsimp [δ]; positivity
    have hAt : ContinuousAt F (t, x) := (hContinuous.mono (show
      Ioo A (0 : ℝ) ×ˢ (univ : Set N) ⊆ Icc A 0 ×ˢ univ from
      prod_mono Ioo_subset_Icc_self Subset.rfl)).continuousAt
        ((isOpen_Ioo.prod isOpen_univ).mem_nhds ⟨ht, mem_univ x⟩)
    have hNhds : {z : ℝ × N | 2 * δ < F z} ∩ (Ioo A 0 ×ˢ univ) ∈ 𝓝 (t, x) :=
      inter_mem (hAt.eventually (lt_mem_nhds (show 2 * δ < F (t, x) by dsimp [δ]; linarith only [hp])))
        ((isOpen_Ioo.prod isOpen_univ).mem_nhds ⟨ht, mem_univ x⟩)
    obtain ⟨U, V, hU, htU, hV, hxV, hBox⟩ := mem_nhds_prod_iff'.mp hNhds
    let : LocallyCompactSpace N := Manifold.locallyCompact_of_finiteDimensional J
    obtain ⟨L, hLc, hxL, hLV⟩ := exists_compact_subset hV hxV
    obtain ⟨r, hr, hBall⟩ := Metric.mem_nhds_iff.mp (hU.mem_nhds htU)
    let u := t - r / 2
    let v := t + r / 2
    have huv : u < v := by dsimp [u, v]; linarith
    have hIn (s : ℝ) (hs : s ∈ Icc u v) : s ∈ U := by
      apply hBall
      rw [Metric.mem_ball, Real.dist_eq, abs_lt]
      change t - r / 2 ≤ s ∧ s ≤ t + r / 2 at hs
      constructor <;> linarith only [hr, hs.1, hs.2]
    have hLx := interior_subset hxL
    have hApply (s : ℝ) (hs : s ∈ Icc u v) (y : N) (hy : y ∈ L) :
        2 * δ < F (s, y) ∧ s ∈ Ioo A 0 := by
      have hz : (s, y) ∈ U ×ˢ V := ⟨hIn s hs, hLV hy⟩
      exact ⟨(hBox hz).1, (hBox hz).2.1⟩
    have hAu : A ≤ u := (hApply u ⟨le_rfl, huv.le⟩ x hLx).2.1.le
    have hv0 : v ≤ 0 := (hApply v ⟨huv.le, le_rfl⟩ x hLx).2.2.le
    obtain ⟨Φ, b, hb, hUniform, hVolume⟩ := hLocal L hLc ⟨x, hxL⟩
    have hlower : ∀ᶠ i in atTop, (v - u) * (δ * b) ≤
        ∫ s in A..(0 : ℝ), gradientSq (g i s) (G i s) := by
      filter_upwards [Metric.tendstoUniformlyOn_iff.mp hUniform δ hδ, hVolume, hTime] with i hSpeed hVol hInt
      have hWin (s : ℝ) (hs : s ∈ Icc u v) : δ * b ≤ gradientSq (g i s) (G i s) := by
        have hs₀ : s ∈ Icc A 0 := Ioo_subset_Icc_self (hApply s hs x hLx).2
        let μ := riemannianVolumeMeasure I M (g i s)
        have hfin : μ (Φ i '' L) ≠ ⊤ := by
          let : IsFiniteMeasureOnCompacts μ := riemannianVolumeMeasure_isFiniteMeasureOnCompacts _
          exact ne_of_lt ((measure_mono (subset_univ _)).trans_lt (isCompact_univ.measure_lt_top (μ := μ)))
        have hPos (y : M) (hy : y ∈ Φ i '' L) : δ ≤ normSq0S (g i s) y 2 (G i s y) := by
          obtain ⟨z, hz, rfl⟩ := hy
          have hClose := hSpeed (s, z) ⟨hs₀, hz⟩
          rw [Real.dist_eq, abs_lt] at hClose
          have hUp := hClose.2
          change F (s, z) - normSq0S (g i s) (Φ i z) 2 (G i s (Φ i z)) < δ at hUp
          exact le_of_lt (by linarith only [hUp, (hApply s hs z hz).1])
        calc
          δ * b ≤ δ * μ.real (Φ i '' L) := mul_le_mul_of_nonneg_left (hVol.2 s hs₀) hδ.le
          _ ≤ ∫ y in Φ i '' L, normSq0S (g i s) y 2 (G i s y) ∂μ :=
            setIntegral_ge_of_const_le_real hVol.1 hfin hPos (hSpatial i s hs₀).integrableOn
          _ ≤ gradientSq (g i s) (G i s) :=
            setIntegral_le_integral (hSpatial i s hs₀) (ae_of_all _ fun y => normSq0S_nonneg _ _ _ _)
      have hSub := hInt.mono_set (show uIcc u v ⊆ uIcc A 0 by
        rw [uIcc_of_le huv.le, uIcc_of_le hA.le]
        exact Icc_subset_Icc hAu hv0)
      calc
        _ = ∫ _ in u..v, δ * b := by rw [intervalIntegral.integral_const]; rfl
        _ ≤ ∫ s in u..v, gradientSq (g i s) (G i s) :=
          intervalIntegral.integral_mono_on huv.le intervalIntegrable_const hSub hWin
        _ ≤ _ := intervalIntegral.integral_mono_interval hAu huv.le hv0
          (Eventually.of_forall fun s => integral_nonneg fun y => normSq0S_nonneg _ _ _ _) hInt
    exact (mul_pos (sub_pos.mpr huv) (mul_pos hδ hb)).not_ge (ge_of_tendsto hDissipation hlower)
  intro t ht x
  apply (normSq0S_eq_zero_iff (h t) x 2 _).1
  change F (t, x) = 0
  have hContX : ContinuousOn (fun s => F (s, x)) (Icc A 0) :=
    hContinuous.comp (continuous_id.prodMk continuous_const).continuousOn
      (fun s hs => ⟨hs, mem_univ x⟩)
  rw [← closure_Ioo hA.ne] at ht hContX
  exact le_antisymm (le_on_closure (fun s hs => (hInterior s hs x).le) hContX continuousOn_const ht)
    (normSq0S_nonneg _ _ _ _)

section Pullback

variable [I.Boundaryless] [J.Boundaryless]

/-- Physical volume on the image of a compact domain has a quantitative
lower bound when the actual pulled-back metric dominates a fixed metric. -/
theorem terminalImageVolume_lower
    (Φ : PartialDiffeomorph J I N M ∞) (g : SmoothRiemannianMetric I M)
    (pull ref : SmoothRiemannianMetric J N) (U : Opens N)
    (hU : (U : Set N) ⊆ Φ.source) {L : Set N} (hL : IsCompact L) (hLU : L ⊆ U)
    (hPull : ∀ x ∈ U, ∀ v w : TangentSpace J x,
      pull.inner x v w = g.inner (Φ x) (mfderiv J I Φ x v) (mfderiv J I Φ x w))
    {B : ℝ} (hB : 0 < B) (hQuad : ∀ x ∈ L, ∀ v : TangentSpace J x,
      ref.inner x v v ≤ B * pull.inner x v v) :
    (Real.sqrt (B ^ Module.finrank ℝ F))⁻¹ * (riemannianVolumeMeasure J N ref).real L ≤
      (riemannianVolumeMeasure I M g).real (Φ '' L) := by
  let a := Real.sqrt (B ^ Module.finrank ℝ F)
  have ha : 0 < a := Real.sqrt_pos_of_pos (pow_pos hB _)
  let μ := riemannianVolumeMeasure I M g
  let ν := riemannianVolumeMeasure J N ref
  have hρ (x : N) (hx : x ∈ L) : a⁻¹ ≤ riemannianVolumeDensity ref pull x := by
    have hUpper := riemannianVolumeDensity_le_of_inner_le pull ref hB x (hQuad x hx)
    apply (inv_le_iff_one_le_mul₀ ha).2
    calc
      1 = riemannianVolumeDensity ref pull x * riemannianVolumeDensity pull ref x :=
        (riemannianVolumeDensity_mul_swap ref pull x).symm
      _ ≤ riemannianVolumeDensity ref pull x * a :=
        mul_le_mul_of_nonneg_left hUpper (riemannianVolumeDensity_pos ref pull x).le
  have hImage : μ (Φ '' L) = riemannianVolumeMeasure J N pull L := by
    simpa only [setLIntegral_const, one_mul] using
      setLIntegral_image_partialDiffeomorph Φ pull g U hU hPull hL.measurableSet hLU
        (fun _ => (1 : ℝ≥0∞))
  have hLower : ENNReal.ofReal a⁻¹ * ν L ≤ μ (Φ '' L) := by
    rw [hImage, riemannianVolumeMeasure_eq_withDensity ref pull,
      withDensity_apply _ hL.measurableSet, ← setLIntegral_const]
    exact setLIntegral_mono' hL.measurableSet fun x hx => ENNReal.ofReal_le_ofReal (hρ x hx)
  have hFinite : μ (Φ '' L) ≠ ⊤ := by
    let : IsFiniteMeasureOnCompacts μ := riemannianVolumeMeasure_isFiniteMeasureOnCompacts _
    exact ne_of_lt ((measure_mono (subset_univ _)).trans_lt (isCompact_univ.measure_lt_top (μ := μ)))
  simpa only [Measure.real_def, ENNReal.toReal_mul, ENNReal.toReal_ofReal (inv_nonneg.mpr ha.le)]
    using ENNReal.toReal_mono hFinite hLower

/-- Compact spacetime comparison of the actual squared covariant speeds
on time-independent partial diffeomorphisms. Pullback identities and
metric equivalence suffice to compare the physical volume; no local
integral convergence is an input. -/
def BourTerminalComparison (A : ℝ)
    (g : ℕ → ℝ → SmoothRiemannianMetric I M)
    (G : ℕ → ℝ → (x : M) → Tensor0SSpace (𝕜 := ℝ) 2 I x)
    (h : ℝ → SmoothRiemannianMetric J N)
    (K : ℝ → (x : N) → Tensor0SSpace (𝕜 := ℝ) 2 J x) : Prop :=
  ∀ L : Set N, IsCompact L → ∃ (Φ : ℕ → PartialDiffeomorph J I N M ∞)
    (pull : ℕ → ℝ → SmoothRiemannianMetric J N) (B : ℝ), 0 < B ∧
    TendstoUniformlyOn (fun i (z : ℝ × N) => normSq0S (g i z.1) (Φ i z.2) 2 (G i z.1 (Φ i z.2)))
      (fun z : ℝ × N => normSq0S (h z.1) z.2 2 (K z.1 z.2)) atTop (Icc A 0 ×ˢ L) ∧
    ∀ᶠ i in atTop, ∃ U : Opens N, L ⊆ U ∧ (U : Set N) ⊆ (Φ i).source ∧
      ∀ t ∈ Icc A (0 : ℝ),
        (∀ x ∈ U, ∀ v w : TangentSpace J x,
          (pull i t).inner x v w =
            (g i t).inner (Φ i x) (mfderiv J I (Φ i) x v) (mfderiv J I (Φ i) x w)) ∧
        (∀ x ∈ L, ∀ v : TangentSpace J x, (h 0).inner x v v ≤ B * (pull i t).inner x v v)

/-- The measured terminal conclusion on the actual spatial comparison
maps and normalized physical volumes. -/
theorem terminalGradient_zero_of_pullbackComparisons {A : ℝ} (hA : A < 0)
    (g : ℕ → ℝ → SmoothRiemannianMetric I M)
    (G : ℕ → ℝ → (x : M) → Tensor0SSpace (𝕜 := ℝ) 2 I x)
    (h : ℝ → SmoothRiemannianMetric J N)
    (K : ℝ → (x : N) → Tensor0SSpace (𝕜 := ℝ) 2 J x)
    (hSpatial : ∀ i t, t ∈ Icc A 0 → Integrable (fun x => normSq0S (g i t) x 2 (G i t x))
      (riemannianVolumeMeasure I M (g i t)))
    (hTime : ∀ᶠ i in atTop, IntervalIntegrable (fun s => gradientSq (g i s) (G i s)) volume A 0)
    (hDissipation : Tendsto (fun i => ∫ s in A..(0 : ℝ), gradientSq (g i s) (G i s)) atTop (𝓝 0))
    (hContinuous : ContinuousOn (fun z : ℝ × N => normSq0S (h z.1) z.2 2 (K z.1 z.2))
      (Icc A 0 ×ˢ univ))
    (hCompare : BourTerminalComparison A g G h K) :
    ∀ t ∈ Icc A (0 : ℝ), ∀ x, K t x = 0 := by
  apply terminalGradient_zero_of_measuredComparisons hA g G h K hSpatial hTime hDissipation hContinuous
  intro L hL hNonempty
  obtain ⟨Φ, pull, B, hB, hUniform, hOpen⟩ := hCompare L hL
  let ν := riemannianVolumeMeasure J N (h 0)
  let : IsFiniteMeasureOnCompacts ν := riemannianVolumeMeasure_isFiniteMeasureOnCompacts _
  let : ν.IsOpenPosMeasure := riemannianVolumeMeasure_isOpenPosMeasure _
  have hν : 0 < ν.real L := by
    apply ENNReal.toReal_pos
    · exact ne_of_gt ((isOpen_interior.measure_pos ν hNonempty).trans_le (measure_mono interior_subset))
    · exact hL.measure_lt_top.ne
  let b := (Real.sqrt (B ^ Module.finrank ℝ F))⁻¹ * ν.real L
  have hb : 0 < b := mul_pos (inv_pos.mpr (Real.sqrt_pos_of_pos (pow_pos hB _))) hν
  refine ⟨fun i x => Φ i x, b, hb, hUniform, ?_⟩
  filter_upwards [hOpen] with i hi
  obtain ⟨U, hLU, hU, hMetric⟩ := hi
  refine ⟨(hL.image_of_continuousOn ((Φ i).contMDiffOn_toFun.continuousOn.mono
    (hLU.trans hU))).measurableSet, ?_⟩
  intro t ht
  exact terminalImageVolume_lower (Φ i) (g i t) (pull i t) (h 0) U hU hL hLU
    (hMetric t ht).1 hB (hMetric t ht).2

end Pullback

section Original

variable [NeZero (Module.finrank ℝ E)] [I.Boundaryless] [J.Boundaryless]
  [BoundarylessManifold I M] {o : ManifoldOrientation I M 4}

omit [J.Boundaryless] [I.Boundaryless] [BoundarylessManifold I M]
  [NeZero (Module.finrank ℝ E)] in
private theorem gradientSq_continuousOn_of_originalVelocity
    (q : ℝ → SignedCollarMetric o) (α : ℝ) {D : RealTimeInterval}
    (hG : MetricFamilySmoothOn (I := I) D (fun t => (q t).metric))
    (hFlow : ∀ t ∈ D.regular, ∀ x,
      deriv (fun s => metricTensorField (q s).metric x) t =
        (-2 : ℝ) • bourCovariantGradient α (q t).metric x) :
    ContinuousOn (fun t => gradientSq (q t).metric (bourCovariantGradient α (q t).metric)) D.regular := by
  apply (bourVelocityGradientSq_continuousOn_regular (fun t => (q t).metric) hG).congr
  intro t ht
  apply congrArg (gradientSq (q t).metric)
  funext x
  rw [bourHalfNegativeVelocity, hFlow t ht x, smul_smul]
  norm_num

/-- On cofinal regular parabolic slabs of the actual original equation,
a supplied compact spacetime comparison to the computed limiting
gradient forces that gradient to vanish pointwise on the whole closed
window, including the terminal metric at time zero. -/
theorem originalGradient_stationary_of_terminalComparison
    (q : ℝ → SignedCollarMetric o) {α C : ℝ} (hα : 0 ≤ α) (hα₁ : α ≤ 1)
    {D : RealTimeInterval} (hConnected : D.regular.OrdConnected)
    (hG : MetricFamilySmoothOn (I := I) D (fun s => (q s).metric))
    (hEuler : ∀ t ∈ D.regular, bourEuler (q t) = C)
    (hFlow : ∀ t ∈ D.regular, ∀ x,
      deriv (fun s => metricTensorField (q s).metric x) t =
        (-2 : ℝ) • bourCovariantGradient α (q t).metric x)
    {a b : ℕ → D.RegularTime} (ha : Tendsto a atTop atTop) (hb : Tendsto b atTop atTop)
    (c : ℕ → ℝ) (hc : ∀ i, 0 < c i) (A : ℝ) (hA : A < 0)
    (hWindow : ∀ᶠ i in atTop, (a i : ℝ) = A / (c i)^2 + (b i : ℝ))
    (h : ℝ → SmoothRiemannianMetric J N)
    (hContinuous : ContinuousOn (fun z : ℝ × N =>
      normSq0S (h z.1) z.2 2 (bourCovariantGradient α (h z.1) z.2)) (Icc A 0 ×ˢ univ)) :
    let t := fun (i : ℕ) (s : ℝ) => s / (c i)^2 + (b i : ℝ)
    let g := fun i s => scaleMetric (c i) (hc i) (q (t i s)).metric
    let G := fun i s x => (c i)⁻¹ • bourCovariantGradient α (q (t i s)).metric x
    BourTerminalComparison A g G h (fun s x => bourCovariantGradient α (h s) x) →
    ∀ s ∈ Icc A (0 : ℝ), ∀ x, bourCovariantGradient α (h s) x = 0 := by
  intro t g G hCompare
  have hD := originalGradient_parabolicDissipation_tendsto_terminal q hα hα₁
    hConnected hG hEuler hFlow ha hb c hc A hA.le hWindow
  apply terminalGradient_zero_of_pullbackComparisons hA g G h
    (fun s x => bourCovariantGradient α (h s) x) ?_ ?_ hD hContinuous hCompare
  · intro i s _
    let μ := riemannianVolumeMeasure I M (g i s)
    let : IsFiniteMeasureOnCompacts μ := riemannianVolumeMeasure_isFiniteMeasureOnCompacts _
    have hCont := normSq0S_cont (g i s)
      ((c i)⁻¹ • bourCovariantGradient α (q (t i s)).metric)
    exact hCont.integrable_of_hasCompactSupport (μ := μ) (HasCompactSupport.of_compactSpace _)
  · filter_upwards [hWindow] with i hi
    have hMap : MapsTo (t i) (Icc A (0 : ℝ)) D.regular := by
      intro s hs
      have hIn : t i s ∈ Icc (a i : ℝ) (b i : ℝ) := by
        rw [hi]
        change A / (c i)^2 + (b i : ℝ) ≤ t i s ∧ t i s ≤ (b i : ℝ)
        exact ⟨add_le_add_left (div_le_div_of_nonneg_right hs.1 (sq_nonneg _)) _,
          add_le_of_nonpos_left (div_nonpos_of_nonpos_of_nonneg hs.2 (sq_nonneg _))⟩
      let : D.regular.OrdConnected := hConnected
      exact D.regular.Icc_subset (a i).property (b i).property hIn
    have hAffine : Continuous (t i) := (continuous_id.div_const ((c i)^2)).add continuous_const
    have hCon := ((gradientSq_continuousOn_of_originalVelocity q α hG hFlow).comp
      hAffine.continuousOn hMap).const_mul (((c i)^2)⁻¹)
    have hEq (s : ℝ) : gradientSq (g i s) (G i s) =
        ((c i)^2)⁻¹ * gradientSq (q (t i s)).metric (bourCovariantGradient α (q (t i s)).metric) :=
      gradientSq_scale o.dimension_eq _ _ (hc i)
    exact (hCon.congr (fun s _ => hEq s)).intervalIntegrable_of_Icc hA.le

end Original

end
end SmoothPoincare.Bour
