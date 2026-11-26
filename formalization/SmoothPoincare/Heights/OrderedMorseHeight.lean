import SmoothPoincare.Heights.OrientedIndexedMean
import DifferentialGeometry.Topology.Morse.CriticalPoints
import DifferentialGeometry.Topology.Morse.ModelTransport
import DifferentialGeometry.Topology.Morse.Rearrangement.SelfIndexing
import DifferentialGeometry.Topology.Morse.Rearrangement.DistinctSelfIndexing
import DifferentialGeometry.Topology.Manifold.ModelWithCorners
import DifferentialGeometry.Topology.Morse.RegularLevel.NoCriticalValues
import Mathlib.Data.Finset.DenselyOrdered

/-! # Ordering the handles of the selected height on its smooth domain -/

open FirstOrderTwistor DifferentialGeometry DifferentialGeometry.Topology DifferentialGeometry.Topology.Morse Set
open scoped ContDiff Manifold

namespace SmoothPoincare

local notation "V₄" => EuclideanSpace ℝ (Fin 4)
local notation "V₅" => EuclideanSpace ℝ (Fin 5)

variable {H M : Type} [TopologicalSpace H] {I : ModelWithCorners ℝ V₄ H}
  [I.Boundaryless] [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [T2Space M] [CompactSpace M] [Nonempty M]

/-- An auxiliary smooth function on the same source as the selected Morse function.
Every critical point and index is retained, and its critical values are distinct
and strictly ordered between index classes. -/
structure OrderedMorsePresentation (I : ModelWithCorners ℝ V₄ H) (f h : M → ℝ) : Prop where
  smooth : ContMDiff I 𝓘(ℝ, ℝ) ∞ h
  morse : ∀ x, IsCriticalPointAt I h x → IsNondegenerateCriticalPointAt I h x
  critical : ∀ x, IsCriticalPointAt I h x ↔ IsCriticalPointAt I f x
  index_eq : ∀ x, IsCriticalPointAt I f x → morseIndex I h x = morseIndex I f x
  distinct : InjOn h (criticalPoints I h)
  ordered : ∀ p q, IsCriticalPointAt I h p → IsCriticalPointAt I h q →
    morseIndex I h p < morseIndex I h q → h p < h q

/-- Place a full compact Morse function in one open band, rearrange, then separate
ties inside the ordered index classes. The change of model for the rearrangement
preserves the chart Hessian inertia at each critical point. -/
theorem exists_orderedMorsePresentation {f : M → ℝ} (hf : ContMDiff I 𝓘(ℝ, ℝ) ∞ f)
    (hnd : ∀ x, IsCriticalPointAt I f x → IsNondegenerateCriticalPointAt I f x) :
    ∃ h, OrderedMorsePresentation I f h := by
  let e : V₄ ≃L[ℝ] (Fin 4 → ℝ) := PiLp.continuousLinearEquiv 2 ℝ _
  let J := I.transContinuousLinearEquiv e
  let : J.Boundaryless := inferInstanceAs (I.transContinuousLinearEquiv e).Boundaryless
  let : IsManifold J ∞ M := inferInstanceAs (IsManifold (I.transContinuousLinearEquiv e) ∞ M)
  have hs (v : M → ℝ) : ContMDiff J 𝓘(ℝ, ℝ) ∞ v ↔ ContMDiff I 𝓘(ℝ, ℝ) ∞ v :=
    e.contMDiff_transContinuousLinearEquiv_left
  have hc (v : M → ℝ) (x : M) : IsCriticalPointAt J v x ↔ IsCriticalPointAt I v x :=
    isCriticalPointAt_transContinuousLinearEquiv_iff I e v x
  have hn (v : M → ℝ) (hv : ContMDiff I 𝓘(ℝ, ℝ) ∞ v) (x : M) :
      IsNondegenerateCriticalPointAt J v x ↔ IsNondegenerateCriticalPointAt I v x :=
    DifferentialGeometry.Morse.isNondegenerateCriticalPointAt_transContinuousLinearEquiv_iff
      I e hv BoundarylessManifold.isInteriorPoint
  have hi (v : M → ℝ) (hv : ContMDiff I 𝓘(ℝ, ℝ) ∞ v) (x : M)
      (hx : IsCriticalPointAt I v x) : morseIndex J v x = morseIndex I v x :=
    DifferentialGeometry.Morse.sigNeg_chartHessianAt_transContinuousLinearEquiv
      I e hv BoundarylessManifold.isInteriorPoint hx
  obtain ⟨l, hl⟩ := (isCompact_range hf.continuous).bddBelow
  obtain ⟨r, hr⟩ := (isCompact_range hf.continuous).bddAbove
  have hall (x : M) : f x ∈ Ioo (l - 1) (r + 1) :=
    ⟨(sub_one_lt l).trans_le (hl (mem_range_self x)), (hr (mem_range_self x)).trans_lt (lt_add_one r)⟩
  have strip : MorseStrip J f (l - 1) (r + 1) :=
    ⟨(hs f).2 hf, (hall (Classical.arbitrary M)).1.trans (hall _).2,
     (isClosed_Icc.preimage hf.continuous).isCompact,
     fun x hx => (hx.elim (hall x).1.ne' (hall x).2.ne).elim,
     fun x _ hx => (hn f hf x).2 (hnd x ((hc f x).1 hx))⟩
  obtain ⟨v, hm, hv, hord, hcrit, hidx⟩ := exists_selfIndexing J strip
  obtain ⟨h, hm', hh, horder, hcrit', hidx', hinj⟩ := exists_distinct_selfIndexing J hv hord
  have hvs (x : M) := hm.mapsTo (hall x)
  have hhs (x : M) := hm'.mapsTo (hvs x)
  have hreg := (hs h).1 hh.smooth
  have hcritEq (x : M) : IsCriticalPointAt I h x ↔ IsCriticalPointAt I f x :=
    (hc h x).symm.trans ((hcrit' x (hvs x)).trans ((hcrit x (hall x)).trans (hc f x)))
  refine ⟨h, hreg, fun x hx => (hn h hreg x).1 (hh.nondegenerate x (hhs x) ((hc h x).2 hx)),
    hcritEq, ?_, ?_, ?_⟩
  · intro x hx
    have hfj := (hc f x).2 hx
    rw [← hi h hreg x ((hcritEq x).2 hx), ← hi f hf x hx,
      hidx' x (hvs x) ((hcrit x (hall x)).2 hfj), hidx x (hall x) hfj]
  · intro x hx y hy heq
    exact hinj ⟨hhs x, (hc h x).2 hx⟩ ⟨hhs y, (hc h y).2 hy⟩ heq
  · intro p q hp hq hlt
    apply horder p q (hhs p) (hhs q) ((hc h p).2 hp) ((hc h q).2 hq)
    rwa [hi h hreg p hp, hi h hreg q hq]


/-- Regular levels strictly separating the lower, middle and upper critical
points. The cuts belong to the auxiliary function. -/
structure MiddleIndexCuts (I : ModelWithCorners ℝ V₄ H) (h : M → ℝ) (a b : ℝ) : Prop where
  lt : a < b
  below : ∀ x, IsCriticalPointAt I h x → morseIndex I h x < 2 → h x < a
  inside : ∀ x, IsCriticalPointAt I h x → morseIndex I h x = 2 → h x ∈ Ioo a b
  above : ∀ x, IsCriticalPointAt I h x → 2 < morseIndex I h x → b < h x

omit [T2Space M] [Nonempty M] in
theorem OrderedMorsePresentation.exists_middleIndexCuts {f h : M → ℝ}
    (P : OrderedMorsePresentation I f h) : ∃ a b, MiddleIndexCuts I h a b := by
  let C := criticalPoints I h
  have hC : C.Finite := finite_criticalPoints_of_compact_of_isNondegenerate h P.smooth P.morse
  let lower := fun k : ℕ => h '' (C ∩ {x | morseIndex I h x < k})
  let upper := fun k : ℕ => h '' (C ∩ {x | k ≤ morseIndex I h x})
  have hl (k) : (lower k).Finite := (hC.inter_of_left _).image h
  have hu (k) : (upper k).Finite := (hC.inter_of_left _).image h
  have sep (k) : ∀ v ∈ lower k, ∀ w ∈ upper k, v < w := by
    rintro _ ⟨x, hx, rfl⟩ _ ⟨y, hy, rfl⟩
    exact P.ordered x y hx.1 hy.1 (lt_of_lt_of_le hx.2 hy.2)
  obtain ⟨a, ha, ha'⟩ := (hl 2).exists_between' (hu 2) (sep 2)
  have next : ∀ v ∈ insert a (lower 3), ∀ w ∈ upper 3, v < w := by
    intro v hv w hw
    rcases mem_insert_iff.mp hv with rfl | hv
    · obtain ⟨x, hx, rfl⟩ := hw
      exact ha' _ ⟨x, ⟨hx.1, (by decide : 2 ≤ 3).trans hx.2⟩, rfl⟩
    · exact sep 3 v hv w hw
  obtain ⟨b, hb, hb'⟩ := ((hl 3).insert a).exists_between' (hu 3) next
  refine ⟨a, b, hb a (mem_insert _ _), fun x hx hi => ha _ ⟨x, ⟨hx, hi⟩, rfl⟩, ?_, ?_⟩
  · intro x hx hi
    exact ⟨ha' _ ⟨x, ⟨hx, hi.ge⟩, rfl⟩,
      hb _ (mem_insert_of_mem _ ⟨x, ⟨hx, hi.trans_lt (by decide)⟩, rfl⟩)⟩
  · intro x hx hi
    exact hb' _ ⟨x, ⟨hx, hi⟩, rfl⟩

omit [T2Space M] [CompactSpace M] [Nonempty M] [I.Boundaryless] [IsManifold I ∞ M] in
theorem MiddleIndexCuts.critical_in_closed_band {h : M → ℝ} {a b : ℝ}
    (B : MiddleIndexCuts I h a b) {x : M} (hx : IsCriticalPointAt I h x) :
    h x ∈ Icc a b ↔ morseIndex I h x = 2 := by
  constructor
  · intro hx'
    rcases lt_trichotomy (morseIndex I h x) 2 with hlo | heq | hhi
    · exact (not_lt_of_ge hx'.1 (B.below x hx hlo)).elim
    · exact heq
    · exact (not_lt_of_ge hx'.2 (B.above x hx hhi)).elim
  · exact fun hi => Ioo_subset_Icc_self (B.inside x hx hi)

omit [Nonempty M] in
/-- The regular flow carries both the full lower sublevel and its marked
boundary to the corresponding upper sets. -/
theorem exists_regularSublevelTransport {h : M → ℝ} {a b : ℝ}
    (hh : ContMDiff I 𝓘(ℝ, ℝ) ∞ h) (hab : a ≤ b)
    (hreg : ∀ x, h x ∈ Icc a b → ¬ IsCriticalPointAt I h x) :
    ∃ Φ : M ≃ₘ⟮I, I⟯ M,
      Φ '' (h ⁻¹' Iic a) = h ⁻¹' Iic b ∧ Φ '' (h ⁻¹' {a}) = h ⁻¹' {b} := by
  obtain ⟨_, Φ, _, _, _, _, ⟨_, hsub, _⟩, hto, _, hfrom, _⟩ :=
    no_critical_value_transport h hh hab (isClosed_Icc.preimage hh.continuous).isCompact hreg
  refine ⟨Φ, hsub, Subset.antisymm ?_ ?_⟩
  · rintro _ ⟨x, hx, rfl⟩
    exact hto x hx
  · intro y hy
    exact ⟨Φ.symm y, hfrom y hy, Φ.apply_symm_apply y⟩

omit [Nonempty M] in
theorem MiddleIndexCuts.regular_transport {h : M → ℝ} {a b : ℝ}
    (B : MiddleIndexCuts I h a b) (hh : ContMDiff I 𝓘(ℝ, ℝ) ∞ h)
    (hzero : ∀ x, IsCriticalPointAt I h x → morseIndex I h x ≠ 2) :
    ∃ Φ : M ≃ₘ⟮I, I⟯ M,
      Φ '' (h ⁻¹' Iic a) = h ⁻¹' Iic b ∧ Φ '' (h ⁻¹' {a}) = h ⁻¹' {b} :=
  exists_regularSublevelTransport hh B.lt.le
    (fun x hx hc => hzero x hc ((B.critical_in_closed_band hc).1 hx))

section Immersion

variable [PolishSpace M]
local instance : Fact (Module.finrank ℝ V₅ = 4 + 1) := ⟨by simp⟩

/-- The inclusive energy bound supplies an ordered auxiliary presentation
with regular middle cuts on the same source. Its whole critical set in the
closed middle band is the original height's selected point set. -/
theorem exists_orderedMiddleBand_of_inducedEnergy_le
    (g : SmoothRiemannianMetric I M) (F : IsometricHypersurface g)
    (o : ManifoldOrientation I M 4) (A : OrthonormalBasis (Fin 5) ℝ V₅)
    (he : chiralFrameEnergy g (fun x => geometricChiralBlock g o x
      (orientedPrincipalFrameAt F o A x).frame) ≤ 64 * Real.pi ^ 2 / 9) :
    ∃ (u : GaussDirection) (h : M → ℝ) (a b : ℝ),
      OrderedMorsePresentation I (immersionHeight F (u : V₅)) h ∧ MiddleIndexCuts I h a b ∧
      {x | IsCriticalPointAt I h x ∧ h x ∈ Icc a b} = indexedHeightTwoPoints F u ∧
      (indexedHeightTwoPoints F u).Finite ∧ (indexedHeightTwoPoints F u).ncard ≤ 1 := by
  obtain ⟨u, hs, hm, hfinite, hcount⟩ := exists_morseHeight_le_one_of_inducedEnergy_le g F o A he
  obtain ⟨h, P⟩ := exists_orderedMorsePresentation hs hm
  obtain ⟨a, b, B⟩ := P.exists_middleIndexCuts
  refine ⟨u, h, a, b, P, B, ?_, hfinite, hcount⟩
  rw [indexedHeightTwoPoints_eq_criticalPoints_of_morse F u hm]
  ext x
  constructor
  · rintro ⟨hx, hb⟩
    have hfx := (P.critical x).1 hx
    exact ⟨hfx, (P.index_eq x hfx).symm.trans ((B.critical_in_closed_band hx).1 hb)⟩
  · rintro ⟨hx, hi⟩
    have hhx := (P.critical x).2 hx
    exact ⟨hhx, (B.critical_in_closed_band hhx).2 ((P.index_eq x hx).trans hi)⟩

end Immersion
end SmoothPoincare
