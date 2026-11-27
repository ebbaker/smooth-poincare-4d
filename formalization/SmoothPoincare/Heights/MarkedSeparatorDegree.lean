import DifferentialGeometry.Geometry.Flow.RicciFlow.Surgery.Topology.Homology
import DifferentialGeometry.Geometry.Curvature.Metric.Defs

/-! # Integral degree of a marked separator

The class relation is supplied in the band's singular homology. The orientation
of its incoming face points toward the outgoing end, and each separator
component uses the orientation in that relation.
-/

open CategoryTheory DifferentialGeometry DifferentialGeometry.Geometry.Curvature
open DifferentialGeometry.PDE.RicciFlow.Surgery.Topology
open scoped Manifold ContDiff BigOperators

noncomputable section

namespace SmoothPoincare

universe u

private theorem integralHomologyMap_comp_apply {X B Z : Type u}
    [TopologicalSpace X] [TopologicalSpace B] [TopologicalSpace Z]
    (p : C(B, Z)) (i : C(X, B)) (x : IntegralHomology X 3) :
    integralHomologyMap 3 p (integralHomologyMap 3 i x) =
      integralHomologyMap 3 (p.comp i) x := by
  have hcomp : integralHomologyMap 3 (p.comp i) =
      integralHomologyMap 3 i ≫ integralHomologyMap 3 p :=
    (integralHomologyFunctor 3).map_comp (TopCat.ofHom i) (TopCat.ofHom p)
  rw [hcomp]
  rfl

variable {Z : Type u} [TopologicalSpace Z] [ChartedSpace ThreeSpace Z]
  [IsManifold ThreeModel ∞ Z] [T2Space Z] [CompactSpace Z] [ConnectedSpace Z]

/-- An actual smooth positive-scalar source and continuous nonzero-degree map
to the oriented target. -/
inductive PscDominatesThreeCut (oZ : TangentOrientationSection Z) : Prop where
  | intro {S : Type u} [TopologicalSpace S] [ChartedSpace ThreeSpace S]
      [IsManifold ThreeModel ∞ S] [T2Space S] [CompactSpace S] [ConnectedSpace S]
      (oS : TangentOrientationSection S) (g : SmoothRiemannianMetric ThreeModel S)
      (hg : ∀ x, 0 < metricScalarAt g x) (f : C(S, Z))
      (hf : orientedDegree oS oZ f ≠ 0) : PscDominatesThreeCut oZ

section Degree

variable {B Y : Type u} [TopologicalSpace B] [TopologicalSpace Y]
  [ChartedSpace ThreeSpace Y] [IsManifold ThreeModel ∞ Y] [T2Space Y] [CompactSpace Y]
  {J : Type*} [Fintype J] {S : J → Type u}
  [∀ j, TopologicalSpace (S j)] [∀ j, ChartedSpace ThreeSpace (S j)]
  [∀ j, IsManifold ThreeModel ∞ (S j)] [∀ j, T2Space (S j)] [∀ j, CompactSpace (S j)]

/-- Push the sum of the included fundamental classes through the marked band
map and compare the integer coefficients of the target fundamental class. -/
theorem markedSeparator_degree_sum
    (oY : TangentOrientationSection Y) (oZ : TangentOrientationSection Z)
    (oS : ∀ j, TangentOrientationSection (S j))
    (p : C(B, Z)) (i₀ : C(Y, B)) (i : ∀ j, C(S j, B))
    (hin : orientedDegree oY oZ (p.comp i₀) = 1)
    (hclass : ∑ j, integralHomologyMap 3 (i j) (fundamentalClass (oS j)) =
      integralHomologyMap 3 i₀ (fundamentalClass oY)) :
    ∑ j, orientedDegree (oS j) oZ (p.comp (i j)) = 1 := by
  apply (fundamentalClassEquiv oZ).injective
  rw [map_sum]
  change (∑ j, orientedDegree (oS j) oZ (p.comp (i j)) • fundamentalClass oZ) =
    (1 : ℤ) • fundamentalClass oZ
  have h := congrArg (integralHomologyMap 3 p).hom hclass
  rw [map_sum] at h
  change ∑ j, integralHomologyMap 3 p
    (integralHomologyMap 3 (i j) (fundamentalClass (oS j))) =
    integralHomologyMap 3 p (integralHomologyMap 3 i₀ (fundamentalClass oY)) at h
  calc
    (∑ j, orientedDegree (oS j) oZ (p.comp (i j)) • fundamentalClass oZ) =
        ∑ j, integralHomologyMap 3 p
          (integralHomologyMap 3 (i j) (fundamentalClass (oS j))) := by
      apply Finset.sum_congr rfl
      intro j _
      rw [integralHomologyMap_comp_apply]
      exact (orientedDegree_spec (oS j) oZ (p.comp (i j))).symm
    _ = integralHomologyMap 3 p (integralHomologyMap 3 i₀ (fundamentalClass oY)) := h
    _ = (1 : ℤ) • fundamentalClass oZ := by
      rw [integralHomologyMap_comp_apply]
      exact (orientedDegree_eq_iff oY oZ (p.comp i₀) 1).mp hin

/-- A single included separator class gives degree one. -/
theorem markedSeparator_connected_degree_one
    {T : Type u} [TopologicalSpace T] [ChartedSpace ThreeSpace T]
    [IsManifold ThreeModel ∞ T] [T2Space T] [CompactSpace T]
    (oY : TangentOrientationSection Y) (oZ : TangentOrientationSection Z)
    (oT : TangentOrientationSection T)
    (p : C(B, Z)) (i₀ : C(Y, B)) (i : C(T, B))
    (hin : orientedDegree oY oZ (p.comp i₀) = 1)
    (hclass : integralHomologyMap 3 i (fundamentalClass oT) =
      integralHomologyMap 3 i₀ (fundamentalClass oY)) :
    orientedDegree oT oZ (p.comp i) = 1 := by
  simpa only [Fin.sum_univ_one] using
    (markedSeparator_degree_sum (J := Fin 1) (S := fun _ => T) oY oZ (fun _ => oT)
      p i₀ (fun _ => i) hin (by simpa only [Fin.sum_univ_one] using hclass))

/-- A total degree of one guarantees some nonzero component degree. -/
theorem markedSeparator_exists_nonzero_degree
    (oY : TangentOrientationSection Y) (oZ : TangentOrientationSection Z)
    (oS : ∀ j, TangentOrientationSection (S j))
    (p : C(B, Z)) (i₀ : C(Y, B)) (i : ∀ j, C(S j, B))
    (hin : orientedDegree oY oZ (p.comp i₀) = 1)
    (hclass : ∑ j, integralHomologyMap 3 (i j) (fundamentalClass (oS j)) =
      integralHomologyMap 3 i₀ (fundamentalClass oY)) :
    ∃ j, orientedDegree (oS j) oZ (p.comp (i j)) ≠ 0 := by
  by_contra! hall
  have h := markedSeparator_degree_sum oY oZ oS p i₀ i hin hclass
  simp only [hall, Finset.sum_const_zero, zero_ne_one] at h

variable [∀ j, ConnectedSpace (S j)]

omit [Fintype J] in
/-- A selected component supplies domination when its actual metric is PSC
and the same component has nonzero degree. -/
theorem markedSeparator_pscDominates_of_nonzero
    (oZ : TangentOrientationSection Z) (oS : ∀ j, TangentOrientationSection (S j))
    (p : C(B, Z)) (i : ∀ j, C(S j, B)) (j : J)
    (g : SmoothRiemannianMetric ThreeModel (S j)) (hg : ∀ x, 0 < metricScalarAt g x)
    (hdeg : orientedDegree (oS j) oZ (p.comp (i j)) ≠ 0) :
    PscDominatesThreeCut oZ :=
  .intro (oS j) g hg (p.comp (i j)) hdeg

/-- If each component admits a positive-scalar metric, the nonzero degree
component selected by the integral class relation supplies domination. -/
theorem markedSeparator_pscDominates
    (oY : TangentOrientationSection Y) (oZ : TangentOrientationSection Z)
    (oS : ∀ j, TangentOrientationSection (S j))
    (p : C(B, Z)) (i₀ : C(Y, B)) (i : ∀ j, C(S j, B))
    (hin : orientedDegree oY oZ (p.comp i₀) = 1)
    (hclass : ∑ j, integralHomologyMap 3 (i j) (fundamentalClass (oS j)) =
      integralHomologyMap 3 i₀ (fundamentalClass oY))
    (hpsc : ∀ j, ∃ g : SmoothRiemannianMetric ThreeModel (S j), ∀ x, 0 < metricScalarAt g x) :
    PscDominatesThreeCut oZ := by
  obtain ⟨j, hdeg⟩ := markedSeparator_exists_nonzero_degree oY oZ oS p i₀ i hin hclass
  obtain ⟨g, hg⟩ := hpsc j
  exact markedSeparator_pscDominates_of_nonzero oZ oS p i j g hg hdeg

end Degree

-- Arithmetic checks on a finite list of degrees.
example : let d : Fin 2 → ℤ := ![2, -1]; (∑ j, d j) = 1 ∧ ∀ j, d j ≠ 1 := by
  dsimp
  norm_num [Fin.sum_univ_two, Fin.forall_fin_two]

example : let d : Fin 2 → ℤ := ![0, 1]
    (∑ j, d j) = 1 ∧ ¬ ∃ j : Fin 2, j = 0 ∧ d j ≠ 0 := by
  dsimp
  norm_num [Fin.sum_univ_two, Fin.exists_fin_two]

end SmoothPoincare
