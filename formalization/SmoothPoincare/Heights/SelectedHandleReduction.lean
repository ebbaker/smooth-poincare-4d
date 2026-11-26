import SmoothPoincare.Heights.OrderedMorseHeight
import SmoothPoincare.Heights.IsolatedMiddleAttachment
import SmoothPoincare.Heights.MorseHandleCounts

/-! # The smooth zero- or one-attachment band of the selected immersed height -/

open FirstOrderTwistor DifferentialGeometry DifferentialGeometry.Topology DifferentialGeometry.Topology.Morse Set
open scoped ContDiff ContinuousMap Manifold

namespace SmoothPoincare

local notation "V₄" => EuclideanSpace ℝ (Fin 4)
local notation "V₅" => EuclideanSpace ℝ (Fin 5)
local notation "coords" => PiLp.continuousLinearEquiv 2 ℝ (fun _ : Fin 4 => ℝ)
local instance : Fact (Module.finrank ℝ V₅ = 4 + 1) := ⟨by simp⟩

variable {H M : Type} [TopologicalSpace H] {I : ModelWithCorners ℝ V₄ H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [PolishSpace M]
  [Nonempty M] [CompactSpace M]

/-- The ambient diffeomorphism records both marked sublevel sets in the original
smooth model. -/
def HasRegularLevelTransport (I : ModelWithCorners ℝ V₄ H) (h : M → ℝ) (a b : ℝ) : Prop :=
  ∃ Φ : M ≃ₘ⟮I, I⟯ M, Φ '' (h ⁻¹' Iic a) = h ⁻¹' Iic b ∧ Φ '' (h ⁻¹' {a}) = h ⁻¹' {b}

/-- At the inclusive threshold either the selected band has a smooth regular
transport, or the actual unique selected point supplies the framed two-handle.
The two regular transports connect its local attachment levels to both global cuts.
The signature and gluing types of the two end bodies remain to be identified. -/
theorem exists_selectedHandleReduction_of_inducedEnergy_le
    (g : SmoothRiemannianMetric I M) (F : IsometricHypersurface g)
    (o : ManifoldOrientation I M 4) (A : OrthonormalBasis (Fin 5) ℝ V₅)
    (he : chiralFrameEnergy g (fun x => geometricChiralBlock g o x
      (orientedPrincipalFrameAt F o A x).frame) ≤ 64 * Real.pi ^ 2 / 9) :
    ∃ (u : GaussDirection) (h : M → ℝ) (a b : ℝ),
      OrderedMorsePresentation I (immersionHeight F (u : V₅)) h ∧ MiddleIndexCuts I h a b ∧
      {x | IsCriticalPointAt I h x ∧ h x ∈ Icc a b} = indexedHeightTwoPoints F u ∧
      ((indexedHeightTwoPoints F u = ∅ ∧ HasRegularLevelTransport I h a b) ∨
        ∃ (p : M) (hs : ContMDiff (I.transContinuousLinearEquiv coords) 𝓘(ℝ, ℝ) ∞ h)
          (D : IsolatedMiddleAttachment hs p a b),
          indexedHeightTwoPoints F u = {p} ∧
          HasRegularLevelTransport I h a (h p - D.ε) ∧
          HasRegularLevelTransport I h (h p + D.ε) b) := by
  classical
  obtain ⟨u, h, a, b, P, B, hband, hf, hn⟩ := exists_orderedMiddleBand_of_inducedEnergy_le g F o A he
  refine ⟨u, h, a, b, P, B, hband, ?_⟩
  rcases (ncard_le_one_iff_eq hf).1 hn with hemt | ⟨p, hsing⟩
  · refine Or.inl ⟨hemt, B.regular_transport P.smooth ?_⟩
    intro x hc hi
    have hx : x ∈ indexedHeightTwoPoints F u := hband ▸
      (show x ∈ {x | IsCriticalPointAt I h x ∧ h x ∈ Icc a b} from
        ⟨hc, (B.critical_in_closed_band hc).2 hi⟩)
    simp [hemt] at hx
  · let e := coords
    let J := I.transContinuousLinearEquiv e
    have hs : ContMDiff J 𝓘(ℝ, ℝ) ∞ h := e.contMDiff_transContinuousLinearEquiv_left.mpr P.smooth
    have heq := hband.trans hsing
    have hset (x : M) : IsCriticalPointAt I h x ∧ h x ∈ Icc a b ↔ x = p :=
      Set.ext_iff.mp heq x
    obtain ⟨hcp, hbp⟩ := (hset p).2 rfl
    have hi := (B.critical_in_closed_band hcp).1 hbp
    have hpos := B.inside p hcp hi
    have hpnd := (DifferentialGeometry.Morse.isNondegenerateCriticalPointAt_transContinuousLinearEquiv_iff
      I e P.smooth BoundarylessManifold.isInteriorPoint).2 (P.morse p hcp)
    have hpidx := (DifferentialGeometry.Morse.sigNeg_chartHessianAt_transContinuousLinearEquiv
      I e P.smooth BoundarylessManifold.isInteriorPoint hcp).trans hi
    obtain ⟨D⟩ := exists_isolatedMiddleAttachment hs p hpos.1 hpos.2
      (fun x hxb => or_iff_not_imp_right.mpr fun hx => (hset x).1
        ⟨(isCriticalPointAt_transContinuousLinearEquiv_iff I e h x).1 (not_not.mp hx), hxb⟩)
      hpnd hpidx
    refine Or.inr ⟨p, hs, D, hsing, exists_regularSublevelTransport P.smooth D.lower_inside.le ?_,
      exists_regularSublevelTransport P.smooth D.upper_inside.le ?_⟩
    · intro x hx hc
      have hlt : h p - D.ε < h p := sub_lt_self _ D.ε_pos
      have he := (hset x).1 ⟨hc, hx.1, hx.2.trans (hlt.le.trans hpos.2.le)⟩
      subst x
      exact (not_lt_of_ge hx.2) hlt
    · intro x hx hc
      have hlt : h p < h p + D.ε := lt_add_of_pos_right _ D.ε_pos
      have he := (hset x).1 ⟨hc, hpos.1.le.trans (hlt.le.trans hx.1), hx.2⟩
      subst x
      exact (not_lt_of_ge hx.1) hlt

/-- The critical counts of the original Morse function obey the sphere Euler
balance even when it has coincident critical values. -/
theorem oddBalance_of_morse_on_homotopySphere
    (e : M ≃ₕ GaussDirection) {f : M → ℝ} (hs : ContMDiff I 𝓘(ℝ, ℝ) ∞ f)
    (hm : ∀ x, IsCriticalPointAt I f x → IsNondegenerateCriticalPointAt I f x) :
    let n := morseCriticalCount I f
    ((n 1 : ℤ) - n 0 + 1) + ((n 3 : ℤ) - n 4 + 1) = n 2 := by
  obtain ⟨h, P⟩ := exists_orderedMorsePresentation hs hm
  have hbal := morseCriticalCount_oddBalance e P.smooth P.morse P.distinct
  dsimp only at hbal ⊢
  simpa only [morseCriticalCount_congr P.critical P.index_eq] using hbal

end SmoothPoincare
