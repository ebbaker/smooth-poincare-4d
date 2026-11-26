import SmoothPoincare.Heights.EndHandleBands

/-! # Both end filtrations of the same selected immersed height -/

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

omit [PolishSpace M] [Nonempty M] [CompactSpace M] in
/-- Every point of the original critical set belongs to the lower end, the
selected middle set or the upper end. The three sets are pairwise disjoint. -/
theorem orderedCriticalPartition {f h : M → ℝ} {a b : ℝ}
    (P : OrderedMorsePresentation I f h) (B : MiddleIndexCuts I h a b)
    {hs : ContMDiff (I.transContinuousLinearEquiv coords) 𝓘(ℝ, ℝ) ∞ h}
    {hsNeg : ContMDiff (I.transContinuousLinearEquiv coords) 𝓘(ℝ, ℝ) ∞ (fun x => -h x)}
    (L : EndHandleFiltration hs a) (R : EndHandleFiltration hsNeg (-b)) :
    let C := {x | IsCriticalPointAt I h x ∧ h x ∈ Icc a b}
    {x | IsCriticalPointAt I f x} = Set.range L.points ∪ C ∪ Set.range R.points ∧
      Disjoint (Set.range L.points) C ∧ Disjoint C (Set.range R.points) ∧
      Disjoint (Set.range L.points) (Set.range R.points) := by
  intro C
  have hlow (x : M) : x ∈ Set.range L.points ↔ IsCriticalPointAt I h x ∧ h x ≤ a := by
    rw [L.critical_points]; rfl
  have hhigh (x : M) : x ∈ Set.range R.points ↔ IsCriticalPointAt I h x ∧ b ≤ h x := by
    rw [R.critical_points]
    change IsCriticalPointAt I (fun y => -h y) x ∧ -h x ≤ -b ↔ _
    rw [NegDual.isCriticalPointAt_neg_iff, neg_le_neg_iff]
  have hc (x : M) (hx : x ∈ C) : a < h x ∧ h x < b :=
    B.inside x hx.1 ((B.critical_in_closed_band hx.1).1 hx.2)
  refine ⟨?_, Set.disjoint_left.mpr (fun x hl hm => (not_lt_of_ge ((hlow x).1 hl).2) (hc x hm).1),
    Set.disjoint_left.mpr (fun x hm hr => (not_lt_of_ge ((hhigh x).1 hr).2) (hc x hm).2),
    Set.disjoint_left.mpr (fun x hl hr => (not_le_of_gt B.lt) (((hhigh x).1 hr).2.trans ((hlow x).1 hl).2))⟩
  ext x
  change IsCriticalPointAt I f x ↔ (_ ∨ _) ∨ _
  rw [← P.critical x, hlow, hhigh]
  change _ ↔ ((_ ∧ h x ≤ a) ∨ (_ ∧ a ≤ h x ∧ h x ≤ b)) ∨ (_ ∧ b ≤ h x)
  constructor
  · intro hx
    rcases le_total (h x) a with ha | ha
    · exact Or.inl (Or.inl ⟨hx, ha⟩)
    rcases le_total (h x) b with hb | hb
    · exact Or.inl (Or.inr ⟨hx, ha, hb⟩)
    · exact Or.inr ⟨hx, hb⟩
  · rintro ((⟨hx,_⟩ | ⟨hx,_⟩) | ⟨hx,_⟩) <;> exact hx

/-- The same direction and the same ordered function supply both end
filtrations and at most one middle attachment, with the upper end read in reverse. Both ends retain their actual point sets and regular cuts. -/
theorem exists_selectedEndHandlePresentation_of_inducedEnergy_le
    (g : SmoothRiemannianMetric I M) (F : IsometricHypersurface g)
    (o : ManifoldOrientation I M 4) (A : OrthonormalBasis (Fin 5) ℝ V₅)
    (he : chiralFrameEnergy g (fun x => geometricChiralBlock g o x
      (orientedPrincipalFrameAt F o A x).frame) ≤ 64 * Real.pi ^ 2 / 9) :
    ∃ (u : GaussDirection) (h : M → ℝ) (a b : ℝ),
      OrderedMorsePresentation I (immersionHeight F (u : V₅)) h ∧ MiddleIndexCuts I h a b ∧
      {x | IsCriticalPointAt I h x ∧ h x ∈ Icc a b} = indexedHeightTwoPoints F u ∧
      ∃ (hs : ContMDiff (I.transContinuousLinearEquiv coords) 𝓘(ℝ, ℝ) ∞ h)
        (hsNeg : ContMDiff (I.transContinuousLinearEquiv coords) 𝓘(ℝ, ℝ) ∞ (fun x => -h x))
        (L : EndHandleFiltration hs a) (R : EndHandleFiltration hsNeg (-b)),
        {x | IsCriticalPointAt I (immersionHeight F (u : V₅)) x} =
          Set.range L.points ∪ indexedHeightTwoPoints F u ∪ Set.range R.points ∧
        ((indexedHeightTwoPoints F u = ∅ ∧ HasRegularLevelTransport I h a b) ∨
        ∃ (p : M) (hs : ContMDiff (I.transContinuousLinearEquiv coords) 𝓘(ℝ, ℝ) ∞ h)
          (D : IsolatedMiddleAttachment hs p a b),
          indexedHeightTwoPoints F u = {p} ∧
          HasRegularLevelTransport I h a (h p - D.ε) ∧
          HasRegularLevelTransport I h (h p + D.ε) b) := by
  obtain ⟨u, h, a, b, P, B, hband, cases⟩ := exists_selectedHandleReduction_of_inducedEnergy_le g F o A he
  obtain ⟨hs, hn, ⟨L⟩, ⟨R⟩⟩ := exists_orderedEndHandleFiltrations P B
  have hpart := (orderedCriticalPartition P B L R).1
  rw [hband] at hpart
  exact ⟨u, h, a, b, P, B, hband, hs, hn, L, R, hpart, cases⟩

end SmoothPoincare
