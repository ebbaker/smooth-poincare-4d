import SmoothPoincare.Variational.PositiveCoreVariation
import SmoothPoincare.Variational.SelectedDiskReference
import Mathlib.Analysis.Calculus.Deriv.Slope

/-! # A first-order variation with the complete marked exterior fixed -/

open Bundle DifferentialGeometry DifferentialGeometry.Geometry
open DifferentialGeometry.Integral.Measure Filter FirstOrderTwistor
open Function MeasureTheory SectionsAndConnections Set
open scoped ContDiff Manifold Topology

namespace SmoothPoincare

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "T" => (4 * Real.pi ^ 2)
local notation "WALL" => (2 * T)

noncomputable section

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]

omit [IsManifold I ∞ M] in
private theorem diskAffine_coeff_abs {t : ℝ} : |max (-1/2 : ℝ) (min t (1/2))| ≤ 1/2 := by
  apply abs_le.mpr
  constructor
  · have h := le_max_left (-1/2 : ℝ) (min t (1/2))
    linarith only [h]
  · exact max_le (by norm_num) (min_le_right _ _)

omit [IsManifold I ∞ M] in
private theorem diskAffine_coeff_eq {t : ℝ} (ht : |t| ≤ 1/2) :
    max (-1/2 : ℝ) (min t (1/2)) = t := by
  rw [min_eq_left (abs_le.mp ht).2]
  exact max_eq_right (by linarith only [(abs_le.mp ht).1])

/-- A normalized symmetric direction with smooth local coefficients gives
actual smooth positive-definite metrics. The parameter is affine on the
fixed interval around zero. Saturation provides a total real parameter. -/
theorem exists_clampedAffineMetricFamily (g : SmoothRiemannianMetric I M)
    (D : ∀ x : M, TangentSpace I x →L[ℝ] TangentSpace I x →L[ℝ] ℝ)
    (hSymm : ∀ x (u v : TangentSpace I x), D x u v = D x v u)
    (hNorm : ∀ x (u : TangentSpace I x), |D x u u| ≤ g.inner x u u)
    (hSmooth : ∀ x₀ (i j : Fin (Module.finrank ℝ E₄)),
      ContMDiffOn I 𝓘(ℝ) ∞
        (fun x => D x (frameVec (I := I) x₀ i x) (frameVec (I := I) x₀ j x))
        (trivializationAt E₄ (TangentSpace I) x₀).baseSet)
    {K : Set M} (hK : IsClosed K) (hSupport : ∀ x ∉ K, D x = 0) :
    ∃ G : ℝ → SmoothRiemannianMetric I M,
      G 0 = g ∧
      (∀ t, |t| ≤ 1/2 → ∀ x (u v : TangentSpace I x),
        (G t).inner x u v = g.inner x u v + t * D x u v) ∧
      (∀ x ∉ K, ∀ᶠ y in 𝓝 x, ∀ t (u v : TangentSpace I y),
        (G t).inner y u v = g.inner y u v) := by
  let a := fun t : ℝ => max (-1/2 : ℝ) (min t (1/2))
  let B := fun (t : ℝ) (x : M) => g.inner x + a t • D x
  have hApply (t : ℝ) (x : M) (u v : TangentSpace I x) :
      B t x u v = g.inner x u v + a t * D x u v := by
    simp [B, smul_eq_mul]
  have hSym (t : ℝ) (x : M) (u v : TangentSpace I x) : B t x u v = B t x v u := by
    rw [hApply, hApply, g.symm x u v, hSymm x u v]
  have hPos (t : ℝ) (x : M) (u : TangentSpace I x) (hu : u ≠ 0) :
      0 < B t x u u := by
    have habs : |a t| ≤ 1/2 := diskAffine_coeff_abs
    have hBound : |a t * D x u u| ≤ 1/2 * g.inner x u u := by
      rw [abs_mul]
      exact mul_le_mul habs (hNorm x u) (abs_nonneg _) (by norm_num)
    rw [hApply]
    linarith only [neg_abs_le (a t * D x u u), hBound, g.pos x u hu]
  have hCoeff (t : ℝ) (x₀ : M) (i j : Fin (Module.finrank ℝ E₄)) :
      ContMDiffOn I 𝓘(ℝ) ∞
        (fun x => B t x (frameVec (I := I) x₀ i x) (frameVec (I := I) x₀ j x))
        (trivializationAt E₄ (TangentSpace I) x₀).baseSet := by
    have hG (x : M) (hx : x ∈ (trivializationAt E₄ (TangentSpace I) x₀).baseSet) :
        ContMDiffAt I 𝓘(ℝ) ∞
          (fun y => g.inner y (frameVec (I := I) x₀ i y) (frameVec (I := I) x₀ j y)) x := by
      let e := trivializationAt E₄ (TangentSpace I) x₀
      let b := Module.finBasis ℝ E₄
      have hv (k : Fin (Module.finrank ℝ E₄)) :
          ContMDiffAt I (I.prod 𝓘(ℝ, E₄)) ∞
            (fun y : M => TotalSpace.mk' E₄ y (frameVec (I := I) x₀ k y)) x := by
        have he : frameVec (I := I) x₀ k =ᶠ[𝓝 x] e.localFrame b k := by
          filter_upwards [e.open_baseSet.mem_nhds hx] with y hy
          change (e.symmL ℝ y) (b k) = e.localFrame b k y
          rw [Bundle.Trivialization.localFrame, dite_eq_left hy,
            Bundle.Trivialization.basisAt, Module.Basis.map_apply,
            Bundle.Trivialization.linearEquivAt_symm_apply]
          exact e.symmL_apply hy (b k)
        exact (contMDiffAt_localFrame_of_mem (I := I) (n := (∞ : WithTop ℕ∞))
          (e := e) (b := b) (i := k) hx).congr_of_eventuallyEq
          (he.mono fun y hy => congrArg (TotalSpace.mk' E₄ y) hy)
      exact Curvature.CovariantDerivative.metric_inner_contMDiffAt g (hv i) (hv j) le_rfl
    have hg : ContMDiffOn I 𝓘(ℝ) ∞
        (fun x => g.inner x (frameVec (I := I) x₀ i x) (frameVec (I := I) x₀ j x))
        (trivializationAt E₄ (TangentSpace I) x₀).baseSet :=
      fun x hx => (hG x hx).contMDiffWithinAt
    refine (hg.add (contMDiffOn_const.mul (hSmooth x₀ i j) :
      ContMDiffOn I 𝓘(ℝ) ∞
        (fun x => a t * D x (frameVec (I := I) x₀ i x) (frameVec (I := I) x₀ j x))
        (trivializationAt E₄ (TangentSpace I) x₀).baseSet)).congr ?_
    intro x _
    exact hApply t x _ _
  choose G hG using fun t => smoothMetric_of_localCoeff (B t) (hSym t) (hPos t) (hCoeff t)
  have hInner (t : ℝ) (x : M) (u v : TangentSpace I x) :
      (G t).inner x u v = g.inner x u v + a t * D x u v :=
    (hG t x u v).trans (hApply t x u v)
  have hAffine (t : ℝ) (ht : |t| ≤ 1/2) (x : M) (u v : TangentSpace I x) :
      (G t).inner x u v = g.inner x u v + t * D x u v := by
    rw [hInner, show a t = t from diskAffine_coeff_eq ht]
  refine ⟨G, ?_, hAffine, ?_⟩
  · apply SmoothRiemannianMetric.ext_inner
    intro x u v
    rw [hAffine 0 (by norm_num), zero_mul, add_zero]
  · intro x hx
    filter_upwards [hK.isOpen_compl.mem_nhds hx] with y hy
    intro t u v
    rw [hInner, hSupport y hy]
    simp

/-- A non-scalar direction at a single point excludes pointwise conformal
equivalence for every nonzero parameter in the affine interval. -/
theorem clampedAffineMetric_not_pointwise_conformal
    (g h : SmoothRiemannianMetric I M) (x : M) {t : ℝ} (ht : t ≠ 0)
    (D : TangentSpace I x →L[ℝ] TangentSpace I x →L[ℝ] ℝ)
    (hNonscalar : ¬ ∃ c : ℝ, ∀ u v, D u v = c * g.inner x u v)
    (hAffine : ∀ u v, h.inner x u v = g.inner x u v + t * D u v) :
    ¬ ∃ c : ℝ, ∀ u v, h.inner x u v = c * g.inner x u v := by
  rintro ⟨c, hc⟩
  apply hNonscalar
  refine ⟨(c - 1) / t, fun u v => ?_⟩
  calc
    D u v = (t * D u v) / t := by field_simp
    _ = ((c - 1) * g.inner x u v) / t := by
      rw [← sub_eq_iff_eq_add'.mpr (hAffine u v), hc]
      ring
    _ = _ := by ring

omit [IsManifold I ∞ M] in
/-- A negative first variation furnishes a right-hand step at any prescribed
upper radius, with a linear lower bound on the saving. Continuity propagates
the original sign and the strict energy bound over the whole segment. -/
theorem exists_firstVariation_step {f level : ℝ → ℝ} {d α r wall : ℝ}
    (hDerivative : HasDerivAt f (-d) 0) (hLevel : ContinuousAt level 0)
    (hPos : 0 < level 0) (hSubcritical : f 0 < wall)
    (hα : α < d) (hr : 0 < r) :
    ∃ t ∈ Ioo 0 r, α * t < f 0 - f t ∧
      ∀ s ∈ Icc 0 t, 0 < level s ∧ f s < (f 0 + wall) / 2 := by
  have hHalf : f 0 < (f 0 + wall) / 2 := by linarith only [hSubcritical]
  have hNear : ∀ᶠ s in 𝓝 (0 : ℝ), 0 < level s ∧ f s < (f 0 + wall) / 2 :=
    (hLevel.eventually_const_lt hPos).and (hDerivative.continuousAt.eventually_lt_const hHalf)
  obtain ⟨ε, hε, hball⟩ := Metric.eventually_nhds_iff.mp hNear
  have hUpper : ∀ᶠ s in 𝓝[>] (0 : ℝ), s < min r ε :=
    nhdsWithin_le_nhds (Iio_mem_nhds (lt_min hr hε))
  have hLower : ∀ᶠ s in 𝓝[>] (0 : ℝ), 0 < s := self_mem_nhdsWithin
  have hSlope := hDerivative.tendsto_slope_zero_right.eventually_lt_const (neg_lt_neg hα)
  obtain ⟨t, ⟨ht, hlt⟩, hs⟩ := ((hLower.and hUpper).and hSlope).exists
  rw [zero_add, smul_eq_mul, ← div_eq_inv_mul, div_lt_iff₀ ht] at hs
  refine ⟨t, ⟨ht, (lt_min_iff.mp hlt).1⟩, by linarith only [hs], ?_⟩
  intro s hs
  apply hball
  rw [Real.dist_eq, sub_zero, abs_of_nonneg hs.1]
  exact hs.2.trans_lt (lt_min_iff.mp hlt).2

section SignedSaving

variable [I.Boundaryless] [T2Space M] [CompactSpace M] [Nonempty M]
  {o : ManifoldOrientation I M 4}

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

/-- The variation is supported on one compact set in the interior of the
actual selected disk, outside its full trim and the protected closed core.
The endpoint is a metric on the original carrier with a common signed
saving. Its whole segment is subcritical and positive. Every measurable
portion of the fixed complement retains its exact physical charge. -/
theorem exists_selectedDiskSaving_of_firstVariation (m : NestedBalancedDisks I M) (n : ℕ)
    (g : ℝ → SignedCollarMetric o) {K : Set M} (hK : IsClosed K)
    (hLoc : K ⊆ interior (selectedChartDisk m.outer) \
      (selectedChartDisk m.core ∪ selectedDiskTrim m.outer n))
    (hGerm : ∀ x ∉ K, ∀ᶠ y in 𝓝 x, ∀ t (u v : TangentSpace I y),
      (g t).metric.inner y u v = (g 0).metric.inner y u v)
    (hFrame : ∀ t x, x ∉ K → ((g t).frame x).basis = ((g 0).frame x).basis)
    (level : ℝ → ℝ) (hLevel : ContinuousAt level 0)
    (hSign : ∀ t, 0 < level t ↔ 0 < classYamabeFour o.dimension_eq (g t).metric)
    (hPositive : 0 < classYamabeFour o.dimension_eq (g 0).metric)
    (hSubcritical : (g 0).energy .plus < WALL)
    {d α r : ℝ} (hDerivative : HasDerivAt (fun t => (g t).energy .plus) (-d) 0)
    (hα : 0 < α) (hαd : α < d) (hr : 0 < r) :
    let B := selectedChartDisk m.outer
    let V := (interior B)ᶜ
    let Istar := sInf (geometricPositiveEnergies o)
    ∃ t ∈ Ioo 0 r,
      (∀ s ∈ Icc 0 t, 0 < classYamabeFour o.dimension_eq (g s).metric ∧
        ∀ sign, (g 0).charge sign V + (g s).charge sign B = (g s).energy sign ∧
          (g s).energy sign < ((g 0).energy .plus + WALL) / 2) ∧
      (∀ s ∈ Icc 0 t, ∀ sign A, MeasurableSet A → A ⊆ Kᶜ →
        (g 0).charge sign A = (g s).charge sign A) ∧
      (∀ x ∈ V ∪ selectedChartDisk m.core ∪ selectedDiskTrim m.outer n, ∀ᶠ y in 𝓝 x,
        ∀ s (u v : TangentSpace I y), (g s).metric.inner y u v = (g 0).metric.inner y u v) ∧
      (∀ sign,
        let gain := (g 0).energy .plus - (g t).energy .plus
        (g 0).charge sign V = (g t).charge sign V ∧
        (g 0).charge sign B - (g t).charge sign B = gain ∧
        (g 0).charge sign K - (g t).charge sign K = gain ∧
        0 < α * t ∧ α * t < gain ∧
        gain ≤ min ((g 0).energy .plus - Istar) ((g 0).charge sign K)) := by
  intro B V Istar
  have hV : V ⊆ Kᶜ := fun x hx hxK => hx (hLoc hxK).1
  have hB : Bᶜ ⊆ Kᶜ := fun x hx hxK => hx (interior_subset (hLoc hxK).1)
  have hPos := (hSign 0).2 hPositive
  obtain ⟨t,ht,hgain,hPath⟩ := exists_firstVariation_step hDerivative hLevel hPos
    hSubcritical hαd hr
  have htPath : t ∈ Icc (0 : ℝ) t := ⟨ht.1.le, le_rfl⟩
  have hAgree (s : ℝ) (sign : CollarChirality) (A : Set M)
      (hA : MeasurableSet A) (hSub : A ⊆ Kᶜ) :
      (g 0).charge sign A = (g s).charge sign A := by
    apply selectedReference_charge_eq_of_germ _ _ hA _ _ sign
    · intro x hx
      filter_upwards [hGerm x (hSub hx)] with y hy
      exact fun u v => (hy s u v).symm
    · exact fun x hx => (hFrame s x (hSub hx)).symm
  refine ⟨t, ht, ?_, fun s _ => hAgree s, ?_, ?_⟩
  · intro s hs
    refine ⟨(hSign s).1 (hPath s hs).1, fun sign => ?_⟩
    have hChange := signedCharge_fullMarkedExterior (g s) sign m.outer m.outer_source
    have hSame := hAgree s sign V isOpen_interior.measurableSet.compl hV
    have heq : (g s).energy .plus = (g s).energy sign := by
      cases sign with
      | plus => rfl
      | minus => exact (g s).signature_zero
    rw [← heq]
    exact ⟨by linarith only [hSame, hChange], (hPath s hs).2⟩
  · intro x hx
    apply hGerm x
    intro hxK
    rcases hx with (hx | hx) | hx
    · exact hV hx hxK
    · exact (hLoc hxK).2 (Or.inl hx)
    · exact (hLoc hxK).2 (Or.inr hx)
  · intro sign gain
    have hBm : MeasurableSet B :=
      (isCompact_selectedChartDisk m.outer m.outer_source).isClosed.measurableSet
    have hInf : Istar ≤ (g t).energy .plus :=
      csInf_le (geometricPositiveEnergies_bddBelow o)
        ((g t).energy_mem_of_positive ((hSign t).1 (hPath t htPath).1))
    have hKsave := signedCoreSaving_eq_energySaving (g 0) (g t) hK.measurableSet sign
      (hAgree t sign Kᶜ hK.measurableSet.compl Subset.rfl)
    refine ⟨hAgree t sign V isOpen_interior.measurableSet.compl hV,
      signedCoreSaving_eq_energySaving (g 0) (g t) hBm sign (hAgree t sign Bᶜ hBm.compl hB),
      hKsave, mul_pos hα ht.1, hgain, le_min (sub_le_sub_left hInf _) ?_⟩
    change (g 0).energy .plus - (g t).energy .plus ≤ (g 0).charge sign K
    rw [← hKsave]
    exact sub_le_self _ measureReal_nonneg

omit [I.Boundaryless] [Nonempty M] in
/-- A nonnegative weighted square with a strictly positive value at a point
has positive physical integral. In the Bach first-variation formula the
weight is the clamping bump and the squared function is the Bach norm. -/
theorem diskVariation_weightedSquare_integral_pos (g : SmoothRiemannianMetric I M)
    (χ b : M → ℝ) (hχ : Continuous χ) (hb : Continuous b) (hχ₀ : ∀ x, 0 ≤ χ x)
    {x : M} (hx : 0 < χ x) (hbx : b x ≠ 0) :
    0 < ∫ y, χ y * b y ^ 2 ∂riemannianVolumeMeasure I M g := by
  let μ := riemannianVolumeMeasure I M g
  let f := fun y => χ y * b y ^ 2
  let : μ.IsOpenPosMeasure := riemannianVolumeMeasure_isOpenPosMeasure g
  have hf : Continuous f := hχ.mul (hb.pow 2)
  let : IsFiniteMeasureOnCompacts μ := riemannianVolumeMeasure_isFiniteMeasureOnCompacts g
  have hInt : Integrable f μ := hf.integrable_of_hasCompactSupport (HasCompactSupport.of_compactSpace f)
  have hs : x ∈ support f := (mul_pos hx (sq_pos_of_ne_zero hbx)).ne'
  exact (integral_pos_iff_support_of_nonneg (fun y => mul_nonneg (hχ₀ y) (sq_nonneg _)) hInt).2
    (hf.isOpen_support.measure_pos μ ⟨x, hs⟩)

/-- A positive same-type cap and the strict joined wall force the allowance
to cover the protected charge on the joined disk. Neither a dyadic division
nor exterior matching is required. The complete exterior can change. -/
theorem protectedDisk_positiveCap_allowance_lower
    (g h cap : SignedCollarMetric o) (m : NestedBalancedDisks I M) (n : ℕ)
    (hDisj : Disjoint (selectedChartDisk m.core) (selectedDiskTrim m.outer n))
    (hCore : ∀ sign, g.charge sign (selectedChartDisk m.core) =
      h.charge sign (selectedChartDisk m.core))
    (hTrim : ∀ sign, g.charge sign (selectedChartDisk m.outer ∩ selectedDiskTrim m.outer n) =
      h.charge sign (selectedChartDisk m.outer ∩ selectedDiskTrim m.outer n))
    (hJoined : h.energy .plus < WALL)
    (hPositiveCap : 0 < classYamabeFour o.dimension_eq cap.metric)
    (δ : CollarChirality → ℝ)
    (hCapCost : ∀ sign, cap.energy sign ≤
      h.charge sign (interior (selectedChartDisk m.outer))ᶜ + δ sign) :
    ∀ sign, sInf (geometricPositiveEnergies o) +
      g.charge sign (selectedChartDisk m.core) +
      g.charge sign (selectedChartDisk m.outer ∩ selectedDiskTrim m.outer n) - WALL <
      δ sign := by
  intro sign
  let B := selectedChartDisk m.outer
  let Q := selectedChartDisk m.core
  let W := selectedDiskTrim m.outer n
  have hQ : Q ⊆ B := by
    intro x hx
    apply interior_subset
    rw [interior_selectedChartDisk m.outer m.outer_source]
    exact m.core_inside hx
  have hWB : MeasurableSet (B ∩ W) :=
    (isCompact_selectedChartDisk m.outer m.outer_source).isClosed.measurableSet.inter
      (isOpen_selectedDiskTrim m.outer n).measurableSet
  have hDisj' : Disjoint Q (B ∩ W) := hDisj.mono_right inter_subset_right
  have hAtLeast : h.charge sign Q + h.charge sign (B ∩ W) ≤ h.charge sign B := by
    change (h.chiralMeasure sign).real Q + (h.chiralMeasure sign).real (B ∩ W) ≤
      (h.chiralMeasure sign).real B
    rw [← measureReal_union hDisj' hWB]
    exact measureReal_mono (union_subset hQ inter_subset_left)
  have hSame := signedCharge_fullMarkedExterior h sign m.outer m.outer_source
  have hInf : sInf (geometricPositiveEnergies o) ≤ cap.energy sign := by
    have hI := csInf_le (geometricPositiveEnergies_bddBelow o)
      (cap.energy_mem_of_positive hPositiveCap)
    cases sign with
    | plus => exact hI
    | minus => exact hI.trans_eq cap.signature_zero
  change h.charge sign (interior B)ᶜ = h.energy .plus - h.charge sign B at hSame
  have hCost : cap.energy sign ≤ h.charge sign (interior B)ᶜ + δ sign := hCapCost sign
  linarith only [hAtLeast, hSame, hInf, hCost, hCore sign, hTrim sign, hJoined]

/-- At any index with sufficiently large protected charge, every positive
same-type cap on a strictly subcritical joined slice exceeds a prescribed
allowance, even allowing changes to the complete exterior. -/
theorem eventually_protectedDisk_capPrice_gt
    (g : ℕ → SignedCollarMetric o) (m : ℕ → NestedBalancedDisks I M) (n : ℕ → ℕ)
    {a : ℝ}
    (hProtected : ∀ᶠ i in atTop, Disjoint (selectedChartDisk (m i).core)
      (selectedDiskTrim (m i).outer (n i)) ∧ ∀ sign,
      WALL - sInf (geometricPositiveEnergies o) + a ≤
        (g i).charge sign (selectedChartDisk (m i).core) +
        (g i).charge sign (selectedChartDisk (m i).outer ∩ selectedDiskTrim (m i).outer (n i))) :
    ∀ᶠ i in atTop, ∀ (h cap : SignedCollarMetric o) (δ : CollarChirality → ℝ),
      (∀ sign, (g i).charge sign (selectedChartDisk (m i).core) =
        h.charge sign (selectedChartDisk (m i).core)) →
      (∀ sign, (g i).charge sign (selectedChartDisk (m i).outer ∩ selectedDiskTrim (m i).outer (n i)) =
        h.charge sign (selectedChartDisk (m i).outer ∩ selectedDiskTrim (m i).outer (n i))) →
      h.energy .plus < WALL →
      0 < classYamabeFour o.dimension_eq cap.metric →
      (∀ sign, cap.energy sign ≤ h.charge sign (interior (selectedChartDisk (m i).outer))ᶜ + δ sign) →
      ∀ sign, a < δ sign := by
  filter_upwards [hProtected] with i hi
  intro h cap δ hQ hW hJoined hPositive hCost sign
  have hδ := protectedDisk_positiveCap_allowance_lower (g i) h cap (m i) (n i)
    hi.1 hQ hW hJoined hPositive δ hCost sign
  linarith only [hδ, hi.2 sign]

/-- For an exactly fixed exterior the finite cap allowance additionally
has to cover the full disk charge less the finite minimizing excess.
The cap has its own positive sign and need not lie on the path. -/
theorem matchedDisk_positiveCap_allowance_ge_disk_minus_excess
    (g h cap : SignedCollarMetric o) (m : NestedBalancedDisks I M)
    (hPositiveCap : 0 < classYamabeFour o.dimension_eq cap.metric)
    (δ : CollarChirality → ℝ)
    (hExterior : ∀ sign, g.charge sign (interior (selectedChartDisk m.outer))ᶜ =
      h.charge sign (interior (selectedChartDisk m.outer))ᶜ)
    (hCapCost : ∀ sign, cap.energy sign ≤
      h.charge sign (interior (selectedChartDisk m.outer))ᶜ + δ sign) :
    ∀ sign, g.charge sign (selectedChartDisk m.outer) -
      (g.energy .plus - sInf (geometricPositiveEnergies o)) ≤ δ sign := by
  intro sign
  have hInf : sInf (geometricPositiveEnergies o) ≤ cap.energy sign := by
    have hI := csInf_le (geometricPositiveEnergies_bddBelow o)
      (cap.energy_mem_of_positive hPositiveCap)
    cases sign with
    | plus => exact hI
    | minus => exact hI.trans_eq cap.signature_zero
  have hOutside := signedCharge_fullMarkedExterior g sign m.outer m.outer_source
  linarith only [hInf, hOutside, hExterior sign, hCapCost sign]

/-- If the cap allowance and additional measured joined cost are paid
from the realized whole-metric saving, the resulting disk charge and
additional cost fit in the original minimizing excess. This payment
test permits arbitrary changes in the entire closed exterior. -/
theorem diskCharge_add_joinedCost_le_excess_of_cap_paid_from_saving
    (g h cap : SignedCollarMetric o) (m : NestedBalancedDisks I M)
    (hPositiveCap : 0 < classYamabeFour o.dimension_eq cap.metric)
    (δ j : CollarChirality → ℝ) (sign : CollarChirality)
    (hCapCost : cap.energy sign ≤ h.charge sign (interior (selectedChartDisk m.outer))ᶜ + δ sign)
    (hPays : δ sign + j sign ≤ g.energy .plus - h.energy sign) :
    h.charge sign (selectedChartDisk m.outer) + j sign ≤
      g.energy .plus - sInf (geometricPositiveEnergies o) := by
  have hInf : sInf (geometricPositiveEnergies o) ≤ cap.energy sign := by
    have hI := csInf_le (geometricPositiveEnergies_bddBelow o)
      (cap.energy_mem_of_positive hPositiveCap)
    cases sign with
    | plus => exact hI
    | minus => exact hI.trans_eq cap.signature_zero
  have hJoined : h.energy .plus = h.energy sign := by
    cases sign with
    | plus => rfl
    | minus => exact h.signature_zero
  have hSplit := signedCharge_fullMarkedExterior h sign m.outer m.outer_source
  linarith only [hInf, hCapCost, hPays, hJoined, hSplit]

/-- A whole-metric saving cannot fund the cap allowance and a nonnegative
additional joined cost on a minimizing tail whose protected disk stays
charged. The obstructing sign may vary with the index. In particular this
excludes the payment on every strictly subcritical joined slice. -/
theorem eventually_no_paid_cap_of_protectedDisk_charge
    (g : ℕ → SignedCollarMetric o) (m : ℕ → NestedBalancedDisks I M)
    (he : Tendsto (fun i => (g i).energy .plus) atTop (𝓝 (sInf (geometricPositiveEnergies o))))
    {ρ : ℝ} (hρ : 0 < ρ)
    (hProtected : ∀ᶠ i in atTop, ∃ sign, ρ ≤ (g i).charge sign (selectedChartDisk (m i).core)) :
    ∀ᶠ i in atTop, ∀ (h cap : SignedCollarMetric o) (δ j : CollarChirality → ℝ),
      0 < classYamabeFour o.dimension_eq cap.metric →
      (∀ sign, (g i).charge sign (selectedChartDisk (m i).core) ≤
        h.charge sign (selectedChartDisk (m i).core)) →
      (∀ sign, 0 ≤ j sign) →
      (∀ sign, cap.energy sign ≤ h.charge sign (interior (selectedChartDisk (m i).outer))ᶜ + δ sign) →
      ¬ ∀ sign, δ sign + j sign ≤ (g i).energy .plus - h.energy sign := by
  have hCut : sInf (geometricPositiveEnergies o) < sInf (geometricPositiveEnergies o) + ρ :=
    lt_add_of_pos_right _ hρ
  filter_upwards [hProtected, he.eventually_lt_const hCut] with i hi hLate
  intro h cap δ j hPositive hCore hAdd hCap hPay
  obtain ⟨sign, hCharge⟩ := hi
  have hIncluded : selectedChartDisk (m i).core ⊆ selectedChartDisk (m i).outer := by
    intro x hx
    apply interior_subset
    rw [interior_selectedChartDisk (m i).outer (m i).outer_source]
    exact (m i).core_inside hx
  have hDisk : h.charge sign (selectedChartDisk (m i).core) ≤
      h.charge sign (selectedChartDisk (m i).outer) :=
    measureReal_mono hIncluded
  have hPaid := diskCharge_add_joinedCost_le_excess_of_cap_paid_from_saving (g i) h cap
    (m i) hPositive δ j sign (hCap sign) (hPay sign)
  linarith only [hLate, hCharge, hCore sign, hAdd sign, hDisk, hPaid]

/-- For a local Bach-type first variation, pointwise nonzero norm on the
positive bump forces a strict signed saving at a nonconformal endpoint.
The derivative identity and sign detector refer to the actual affine
family. An independent cap matched to its exterior retains its full
allowance, even though the joined energy has decreased. -/
theorem exists_selectedNonconformalDiskSaving_of_weightedSquare
    (m : NestedBalancedDisks I M) (n : ℕ)
    (g : ℝ → SignedCollarMetric o) {K : Set M} (hK : IsClosed K)
    (hLoc : K ⊆ interior (selectedChartDisk m.outer) \
      (selectedChartDisk m.core ∪ selectedDiskTrim m.outer n))
    (hGerm : ∀ x ∉ K, ∀ᶠ y in 𝓝 x, ∀ t (u v : TangentSpace I y),
      (g t).metric.inner y u v = (g 0).metric.inner y u v)
    (hFrame : ∀ t x, x ∉ K → ((g t).frame x).basis = ((g 0).frame x).basis)
    (level : ℝ → ℝ) (hLevel : ContinuousAt level 0)
    (hSign : ∀ t, 0 < level t ↔ 0 < classYamabeFour o.dimension_eq (g t).metric)
    (hPositive : 0 < classYamabeFour o.dimension_eq (g 0).metric)
    (hSubcritical : (g 0).energy .plus < WALL)
    (χ b : M → ℝ) (hχ : Continuous χ) (hb : Continuous b) (hχ₀ : ∀ x, 0 ≤ χ x)
    (x : M) (hx : 0 < χ x) (hbx : b x ≠ 0)
    (D : TangentSpace I x →L[ℝ] TangentSpace I x →L[ℝ] ℝ)
    (hNonscalar : ¬ ∃ c : ℝ, ∀ u v, D u v = c * (g 0).metric.inner x u v)
    (hAffine : ∀ t : ℝ, |t| ≤ 1/2 → ∀ u v,
      (g t).metric.inner x u v = (g 0).metric.inner x u v + t * D u v)
    (hDerivative : HasDerivAt (fun t => (g t).energy .plus)
      (-(∫ y, χ y * b y ^ 2 ∂riemannianVolumeMeasure I M (g 0).metric) / 2) 0) :
    let B := selectedChartDisk m.outer
    let V := (interior B)ᶜ
    let α := (∫ y, χ y * b y ^ 2 ∂riemannianVolumeMeasure I M (g 0).metric) / 4
    ∃ t ∈ Ioo 0 (1/2 : ℝ),
      (¬ ∃ c : ℝ, ∀ u v, (g t).metric.inner x u v = c * (g 0).metric.inner x u v) ∧
      (∀ s ∈ Icc 0 t, 0 < classYamabeFour o.dimension_eq (g s).metric ∧
        ∀ sign, (g 0).charge sign V + (g s).charge sign B = (g s).energy sign ∧
          (g s).energy sign < ((g 0).energy .plus + WALL) / 2) ∧
      (∀ y ∈ V ∪ selectedChartDisk m.core ∪ selectedDiskTrim m.outer n, ∀ᶠ z in 𝓝 y,
        ∀ s (u v : TangentSpace I z), (g s).metric.inner z u v = (g 0).metric.inner z u v) ∧
      (∀ sign, (g 0).charge sign V = (g t).charge sign V ∧
        0 < α * t ∧ α * t < (g 0).charge sign B - (g t).charge sign B ∧
        (g 0).charge sign B - (g t).charge sign B ≤
          (g 0).energy .plus - sInf (geometricPositiveEnergies o)) ∧
      ∀ (cap : SignedCollarMetric o) (δ : CollarChirality → ℝ),
        0 < classYamabeFour o.dimension_eq cap.metric →
        (∀ sign, cap.energy sign ≤ (g t).charge sign V + δ sign) →
        ∀ sign, (g 0).charge sign B -
          ((g 0).energy .plus - sInf (geometricPositiveEnergies o)) ≤ δ sign := by
  intro B V α
  let bInt := ∫ y, χ y * b y ^ 2 ∂riemannianVolumeMeasure I M (g 0).metric
  have hbInt : 0 < bInt :=
    diskVariation_weightedSquare_integral_pos (g 0).metric χ b hχ hb hχ₀ hx hbx
  have hSlope : HasDerivAt (fun t => (g t).energy .plus) (-(bInt / 2)) 0 := by
    simpa only [neg_div] using hDerivative
  have hα : 0 < α := by change 0 < bInt / 4; linarith only [hbInt]
  have hαd : α < bInt / 2 := by change bInt / 4 < bInt / 2; linarith only [hbInt]
  obtain ⟨t, ht, hPath, _, hFixed, hGain⟩ := exists_selectedDiskSaving_of_firstVariation m n
    g hK hLoc hGerm hFrame level hLevel hSign hPositive hSubcritical
    hSlope hα hαd (show 0 < (1/2 : ℝ) by norm_num)
  have hAbs : |t| ≤ (1/2 : ℝ) := by rw [abs_of_pos ht.1]; exact ht.2.le
  refine ⟨t, ht, clampedAffineMetric_not_pointwise_conformal (g 0).metric (g t).metric
    x ht.1.ne' D hNonscalar (hAffine t hAbs), hPath, hFixed, ?_, ?_⟩
  · intro sign
    obtain ⟨hExt, hDisk, _, hGain₀, hGainα, hGainUpper⟩ := hGain sign
    refine ⟨hExt, hGain₀, ?_, ?_⟩
    · exact hGainα.trans_eq hDisk.symm
    · exact hDisk.trans_le (hGainUpper.trans (min_le_left _ _))
  · intro cap δ hPositiveCap hCap
    exact matchedDisk_positiveCap_allowance_ge_disk_minus_excess (g 0) (g t) cap m
      hPositiveCap δ (fun sign => (hGain sign).1) hCap

end SignedSaving

end

end SmoothPoincare
