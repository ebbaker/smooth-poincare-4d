import SmoothPoincare.Heights.MarkedHandleGluing
import DifferentialGeometry.Geometry.Flow.RicciFlow.Surgery.Topology.Homology
import Mathlib.Geometry.Manifold.LocalDiffeomorph

/-! # Marked lower reduction and transport of the second cut -/

open Set Manifold DifferentialGeometry.Topology
open scoped ContDiff Manifold Topology

namespace SmoothPoincare

noncomputable section

section ResidualTubes

variable {E H F K : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [TopologicalSpace H] [NormedAddCommGroup F] [NormedSpace ℝ F] [TopologicalSpace K]
  {IB : ModelWithCorners ℝ E H} {IT : ModelWithCorners ℝ F K}
  {Z Z' U : Type*} [TopologicalSpace Z] [ChartedSpace H Z]
  [TopologicalSpace Z'] [ChartedSpace H Z'] [TopologicalSpace U] [ChartedSpace H U]
  {A : Type*} [TopologicalSpace A] [ChartedSpace K A]

/-- Transport the entire framed open tube through the marked ball comparison.
Its source remains the original parameter domain, including any specified closed
solid torus contained there. The image is the inverse image of the actual tube. -/
def prefixResidualTube (e : Z' ≃ₘ^∞⟮IB, IB⟯ Z)
    (u : PartialDiffeomorph IT IB A Z ∞) : PartialDiffeomorph IT IB A Z' ∞ :=
  u.trans e.symm.toPartialDiffeomorph

theorem prefixResidualTube_marked (e : Z' ≃ₘ^∞⟮IB, IB⟯ Z)
    (u : PartialDiffeomorph IT IB A Z ∞) :
    let v := prefixResidualTube e u
    v.source = u.source ∧ v.target = e ⁻¹' u.target ∧
      (∀ a, e (v a) = u a) ∧ (∀ z, v.symm z = u.symm (e z)) := by
  dsimp only [prefixResidualTube]
  refine ⟨?_, ?_, fun a => e.apply_symm_apply (u a), fun _ => rfl⟩
  · change u.source ∩ u ⁻¹' univ = u.source
    simp
  · change univ ∩ e ⁻¹' u.target = e ⁻¹' u.target
    simp

/-- The two surviving solid tori keep every disk parameter. The disjointness
condition is required on their full marked images, not just on their cores. -/
theorem prefixResidualTubes_disjoint (e : Z' ≃ₘ^∞⟮IB, IB⟯ Z)
    (u : Fin 2 → PartialDiffeomorph IT IB A Z ∞) (T : Set A)
    (h : Disjoint (u 0 '' T) (u 1 '' T)) :
    Disjoint (prefixResidualTube e (u 0) '' T) (prefixResidualTube e (u 1) '' T) := by
  rw [Set.disjoint_left] at h ⊢
  rintro z ⟨a, ha, haz⟩ ⟨b, hb, hbz⟩
  exact h (show e z ∈ u 0 '' T from ⟨a, ha,
    ((prefixResidualTube_marked e (u 0)).2.2.1 a).symm.trans (congrArg e haz)⟩)
    (show e z ∈ u 1 '' T from ⟨b, hb,
      ((prefixResidualTube_marked e (u 1)).2.2.1 b).symm.trans (congrArg e hbz)⟩)

/-- The upper map uses the full outgoing boundary of the successor trace.
Its inverse transports the original upper point back to that same boundary. -/
def prefixClosingMark (e : Z' ≃ₘ^∞⟮IB, IB⟯ Z) (γ : Z ≃ₘ^∞⟮IB, IB⟯ U) :
    Z' ≃ₘ^∞⟮IB, IB⟯ U := e.trans γ

theorem prefixClosingMark_marked (e : Z' ≃ₘ^∞⟮IB, IB⟯ Z)
    (γ : Z ≃ₘ^∞⟮IB, IB⟯ U) :
    (∀ z, prefixClosingMark e γ z = γ (e z)) ∧
      (∀ y, (prefixClosingMark e γ).symm y = e.symm (γ.symm y)) :=
  ⟨fun _ => rfl, fun _ => rfl⟩

end ResidualTubes

section Trace

variable {J K P P' Z Z' : Type*} [TopologicalSpace P] [TopologicalSpace P']
  [TopologicalSpace Z] [TopologicalSpace Z']

local notation "Attach" => MiddleAttachingRegions
local notation "Tr(" j "," a ")" => AdjunctionSpace (middleAttachingInclusion j) a

/-- The successor trace comparison uses the actual lower ball comparison and
the literal identity on each residual handle. The latter retains the entire
parametrization on both outgoing solid tori. -/
def prefixTraceHomeomorph (ψ : P' ≃ₜ P) (ψb : Z' ≃ₜ Z) (i : Z → P) (i' : Z' → P')
    (hi : ∀ z, ψ (i' z) = i (ψb z)) (u : Attach J → Z) :
    Tr(J,i' ∘ ψb.symm ∘ u) ≃ₜ Tr(J,i ∘ u) := by
  refine adjunctionHomeomorph _ _ _ _ (Equiv.refl _) (Homeomorph.refl _) ψ (fun _ => rfl) ?_
  intro p
  change ψ (i' (ψb.symm (u p))) = i (u p)
  rw [hi, ψb.apply_symm_apply]

theorem prefixTraceHomeomorph_handle (ψ : P' ≃ₜ P) (ψb : Z' ≃ₜ Z) (i : Z → P) (i' : Z' → P')
    (hi : ∀ z, ψ (i' z) = i (ψb z)) (u : Attach J → Z) (t : MiddleHandles J) :
    let e := prefixTraceHomeomorph ψ ψb i i' hi u
    e (adjunctionCell (middleAttachingInclusion J) (i' ∘ ψb.symm ∘ u) t) =
      adjunctionCell (middleAttachingInclusion J) (i ∘ u) t ∧
      e.symm (adjunctionCell (middleAttachingInclusion J) (i ∘ u) t) =
        adjunctionCell (middleAttachingInclusion J) (i' ∘ ψb.symm ∘ u) t :=
  ⟨rfl, rfl⟩

private def restrictHandleLabels (ρ : K → J) (t : Attach K) : Attach J := ⟨ρ t.1, t.2⟩

/-- Include the selected prefix into the full two-component trace, retaining
the lower representative and each chosen handle. For the actual two-prefix
diagram take `K = Fin 1`, `J = Fin 2` and `ρ 0 = 0`. -/
def includePrefixTrace {X : Type*} (ρ : K → J) (u : Attach J → X) :
    Tr(K,u ∘ restrictHandleLabels ρ) → Tr(J,u) :=
  Quot.lift (Sum.elim (fun t => adjunctionCell (middleAttachingInclusion J) u ⟨ρ t.1, t.2⟩)
    (adjunctionLower u)) fun _ _ h => by
      rcases h with ⟨t, ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩⟩
      · exact adjunction_coherence (middleAttachingInclusion J) u (restrictHandleLabels ρ t)
      · exact (adjunction_coherence (middleAttachingInclusion J) u (restrictHandleLabels ρ t)).symm

/-- The comparison at the selected prefix is the restriction of the full
comparison under both trace inclusions. The inverse square holds as well. -/
theorem prefixTraceHomeomorph_commutes (ψ : P' ≃ₜ P) (ψb : Z' ≃ₜ Z) (i : Z → P) (i' : Z' → P')
    (hi : ∀ z, ψ (i' z) = i (ψb z)) (u : Attach J → Z) (ρ : K → J) :
    let e := prefixTraceHomeomorph ψ ψb i i' hi u
    let eb := prefixTraceHomeomorph ψ ψb i i' hi (u ∘ restrictHandleLabels ρ)
    let j := includePrefixTrace ρ (i ∘ u)
    let j' := includePrefixTrace ρ (i' ∘ ψb.symm ∘ u)
    (∀ x, e (j' x) = j (eb x)) ∧ (∀ y, e.symm (j y) = j' (eb.symm y)) := by
  dsimp only
  have h (x : Tr(K,i' ∘ ψb.symm ∘ u ∘ restrictHandleLabels ρ)) :
      prefixTraceHomeomorph ψ ψb i i' hi u (includePrefixTrace ρ (i' ∘ ψb.symm ∘ u) x) =
        includePrefixTrace ρ (i ∘ u) (prefixTraceHomeomorph ψ ψb i i' hi
          (u ∘ restrictHandleLabels ρ) x) := by
    induction x using Quot.ind with
    | mk t => cases t <;> rfl
  refine ⟨h, fun y => ?_⟩
  apply (prefixTraceHomeomorph ψ ψb i i' hi u).injective
  rw [Homeomorph.apply_symm_apply, h, Homeomorph.apply_symm_apply]

end Trace

section Degree

open DifferentialGeometry.PDE.RicciFlow.Surgery.Topology CategoryTheory
open scoped ContinuousMap

universe u

variable {S Y Y' : Type u} [TopologicalSpace S] [TopologicalSpace Y] [TopologicalSpace Y']
  [ChartedSpace ThreeSpace S] [ChartedSpace ThreeSpace Y] [ChartedSpace ThreeSpace Y']
  [IsManifold ThreeModel ∞ S] [IsManifold ThreeModel ∞ Y] [IsManifold ThreeModel ∞ Y']
  [T2Space S] [T2Space Y] [T2Space Y'] [CompactSpace S] [CompactSpace Y] [CompactSpace Y']
  [ConnectedSpace Y] [ConnectedSpace Y']

/-- The very same PSC source can witness the successor prefix: postcomposition
by the inverse of the comparison between the *second* cuts preserves nonzero
integral degree. The orientations on the two targets may be chosen separately. -/
theorem orientedDegree_prefixTransport_ne_zero_iff
    (oS : TangentOrientationSection S) (oY : TangentOrientationSection Y)
    (oY' : TangentOrientationSection Y') (e : Y' ≃ₜ Y) (f : C(S, Y)) :
    orientedDegree oS oY' ((⟨e.symm, e.symm.continuous⟩ : C(Y, Y')).comp f) ≠ 0 ↔
      orientedDegree oS oY f ≠ 0 := by
  let E : C(Y', Y) := ⟨e, e.continuous⟩
  let Ei : C(Y, Y') := ⟨e.symm, e.symm.continuous⟩
  have hcomp : integralHomologyMap 3 (Ei.comp f) =
      integralHomologyMap 3 f ≫ integralHomologyMap 3 Ei :=
    (integralHomologyFunctor 3).map_comp (TopCat.ofHom f) (TopCat.ofHom Ei)
  have hinv : integralHomologyMap 3 Ei ≫ integralHomologyMap 3 E = 𝟙 (IntegralHomology Y 3) := by
    unfold integralHomologyMap
    rw [← (integralHomologyFunctor 3).map_comp]
    have h : TopCat.ofHom Ei ≫ TopCat.ofHom E = 𝟙 (TopCat.of Y) := by
      ext y
      exact e.apply_symm_apply y
    rw [h, (integralHomologyFunctor 3).map_id]
  have hzero : orientedDegree oS oY' (Ei.comp f) = 0 ↔
      orientedDegree oS oY f = 0 := by
    rw [orientedDegree_eq_iff, orientedDegree_eq_iff, zero_smul, zero_smul, hcomp]
    change integralHomologyMap 3 Ei (integralHomologyMap 3 f (fundamentalClass oS)) = 0 ↔ _
    refine ⟨fun h => ?_, fun h => by rw [h, map_zero]⟩
    have he := congrArg (fun k : IntegralHomology Y 3 ⟶ IntegralHomology Y 3 =>
      k (integralHomologyMap 3 f (fundamentalClass oS))) hinv
    change integralHomologyMap 3 E (integralHomologyMap 3 Ei
      (integralHomologyMap 3 f (fundamentalClass oS))) = _ at he
    rwa [h, map_zero, eq_comm] at he
  exact not_congr hzero

end Degree

end

end SmoothPoincare
