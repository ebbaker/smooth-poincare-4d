import SmoothPoincare
import DifferentialGeometry.Geometry.Flow.RicciFlow.Surgery.Topology.OrientationDegree

/-! Public replay of the E52 marked separator and native closing contracts. -/

open CategoryTheory DifferentialGeometry DifferentialGeometry.Geometry.Curvature
open DifferentialGeometry.PDE.RicciFlow.Surgery.Topology
open scoped BigOperators ContDiff Manifold ContinuousMap

namespace SmoothPoincare

#check markedSeparator_degree_sum
#check markedSeparator_connected_degree_one
#check markedSeparator_exists_nonzero_degree
#check markedSeparator_pscDominates_of_nonzero
#check markedSeparator_pscDominates
#check standard_of_pscDominated_markedNativeCut
#check mazur_meridianFirst_control
#check mazur_longFirst_noPsc
#check HMP.standard_of_markedProductSlice
#check MillerSchuppEquator.no_ambient_comparison_to_native_side

#print axioms exists_unique_fundamentalClass
#print axioms fundamentalClass_generator
#print axioms fundamentalClassEquiv
#print axioms orientedDegree_spec
#print axioms orientedDegree_eq_iff
#print axioms fundamentalClass_natural_diffeomorph
#print axioms orientedDegree_diffeomorph
#print axioms Functor.map_comp
#print axioms markedSeparator_degree_sum
#print axioms markedSeparator_pscDominates
#print axioms orientedDegree_prefixTransport_ne_zero_iff
#print axioms standard_of_pscDominated_markedNativeCut
#print axioms mazur_meridianFirst_control
#print axioms mazur_longFirst_noPsc
#print axioms HMP.Closing.marked
#print axioms HMP.ProductSlice.degree_one
#print axioms HMP.standard_of_markedProductSlice
#print axioms MillerSchuppEquator.noncommuting_generators
#print axioms MillerSchuppEquator.no_ambient_comparison_to_native_side

/-- A finite class relation can have degree sum one with degree zero on the
only component carrying the supplied scalar certificate. -/
example : let degree : Fin 3 → ℤ := ![0, 2, -1]
    (∑ j, degree j) = 1 ∧ (∀ j, degree j ≠ 1) ∧
      ¬ (∃ j, j = 0 ∧ degree j ≠ 0) := by
  dsimp
  refine ⟨by norm_num [Fin.sum_univ_three], ?_, ?_⟩
  · intro j
    fin_cases j <;> norm_num
  · rintro ⟨j, rfl, hj⟩
    exact hj rfl

universe u

section Homology

variable {X B Z : Type u} [TopologicalSpace X] [TopologicalSpace B] [TopologicalSpace Z]

/-- The two actual maps act in the covariant order on the same integral class. -/
example (i : C(X, B)) (p : C(B, Z)) (x : IntegralHomology X 3) :
    integralHomologyMap 3 (p.comp i) x =
      integralHomologyMap 3 p (integralHomologyMap 3 i x) := by
  have h := (integralHomologyFunctor 3).map_comp (TopCat.ofHom i) (TopCat.ofHom p)
  change integralHomologyMap 3 (p.comp i) =
    integralHomologyMap 3 i ≫ integralHomologyMap 3 p at h
  rw [h]
  rfl

end Homology

section OrientedDegree

variable {Y Z : Type u} [TopologicalSpace Y] [TopologicalSpace Z]
  [ChartedSpace ThreeSpace Y] [ChartedSpace ThreeSpace Z]
  [IsManifold ThreeModel ∞ Y] [IsManifold ThreeModel ∞ Z]
  [CompactSpace Y] [CompactSpace Z] [T2Space Y] [T2Space Z]
  [ConnectedSpace Y] [ConnectedSpace Z]

/-- A supplied preserving map gives degree plus one with the specified orientations. -/
example (oY : TangentOrientationSection Y) (oZ : TangentOrientationSection Z)
    (e : Y ≃ₘ^∞⟮ThreeModel, ThreeModel⟯ Z) (h : PreservesTangentOrientation oY oZ e) :
    orientedDegree oY oZ (⟨e, e.continuous⟩ : C(Y, Z)) = 1 :=
  orientedDegree_diffeomorph oY oZ e h

/-- The negative sign of the pushed fundamental class yields degree minus one. -/
example (oY : TangentOrientationSection Y) (oZ : TangentOrientationSection Z)
    (f : C(Y, Z))
    (h : integralHomologyMap 3 f (fundamentalClass oY) = (-1 : ℤ) • fundamentalClass oZ) :
    orientedDegree oY oZ f = -1 :=
  (orientedDegree_eq_iff oY oZ f (-1)).mpr h

/-- The supplied transport preserves nonvanishing even when the two target
orientations are chosen independently. -/
example (oY oY' : TangentOrientationSection Y) (oZ : TangentOrientationSection Z)
    (e : Y ≃ₜ Y) (f : C(Z, Y)) :
    orientedDegree oZ oY' ((⟨e.symm, e.symm.continuous⟩ : C(Y, Y)).comp f) ≠ 0 ↔
      orientedDegree oZ oY f ≠ 0 :=
  orientedDegree_prefixTransport_ne_zero_iff oZ oY oY' e f

end OrientedDegree

section PSCComponent

variable {Z : Type u} [TopologicalSpace Z] [ChartedSpace ThreeSpace Z]
  [IsManifold ThreeModel ∞ Z] [T2Space Z] [CompactSpace Z] [ConnectedSpace Z]
  {S : Fin 3 → Type u} [∀ j, TopologicalSpace (S j)]
  [∀ j, ChartedSpace ThreeSpace (S j)] [∀ j, IsManifold ThreeModel ∞ (S j)]
  [∀ j, T2Space (S j)] [∀ j, CompactSpace (S j)] [∀ j, ConnectedSpace (S j)]

/-- Applying the certificate definition to a family of actual degree maps,
positivity supplied only at component zero has no nonzero degree there. -/
example (oZ : TangentOrientationSection Z) (oS : ∀ j, TangentOrientationSection (S j))
    (f : ∀ j, C(S j, Z))
    (g : SmoothRiemannianMetric ThreeModel (S 0)) (hg : ∀ x, 0 < metricScalarAt g x)
    (hd : ∀ j, orientedDegree (oS j) oZ (f j) = (![0, 2, -1] : Fin 3 → ℤ) j) :
    (∃ g₀ : SmoothRiemannianMetric ThreeModel (S 0), ∀ x, 0 < metricScalarAt g₀ x) ∧
      (∑ j, orientedDegree (oS j) oZ (f j)) = 1 ∧
      ¬ (∃ j, j = 0 ∧ orientedDegree (oS j) oZ (f j) ≠ 0) := by
  simp_rw [hd]
  exact ⟨⟨g, hg⟩, by norm_num [Fin.sum_univ_three], fun ⟨_, rfl, h⟩ ↦ h rfl⟩

end PSCComponent

section Closing

variable {E H M : Type u} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [TopologicalSpace H] [TopologicalSpace M] [ChartedSpace H M]
  {I : ModelWithCorners ℝ E H}

/-- The meridian-first closing uses the inverse of the original upper gluing
followed by the forward order comparison on the original upper point. -/
example (P : MarkedMixedNativePresentation I M) (y : P.upper.Carrier) :
    (P.closing .windingZero).symm y = P.orderComparison (P.upperClosing.symm y) ∧
    P.outgoingInclusion .windingZero ((P.closing .windingZero).symm y) =
      P.upperInclusion y :=
  ⟨P.windingZeroClosing_marked.2 y, P.closing_sameFace_inverse .windingZero y⟩

/-- On the HMP returned presentation, read the winding-one inverse through the
same upper point and take degree one on the marked winding-zero slice. -/
example (P : MarkedMixedNativePresentation I M) (Q : HMP.Closing P)
    (S : HMP.ProductSlice P) (y : P.upper.Carrier) :
    (P.closing .windingOne).symm y =
      P.orderComparison.symm (Q.boundaryJ.symm (Q.delta.symm (Q.boundaryXiPlus.symm y))) ∧
    orientedDegree S.source.orientation (P.nativeCut .windingZero).orientation
      ⟨S.projection, S.projection.continuous⟩ = 1 :=
  ⟨Q.marked.2.2.2 y, S.degree_one⟩

end Closing

/-- Both complementary side presentations have noncommuting generators;
either side obstructs assignment to a cyclic native complement. -/
example (side : Bool) :
    let X : PresentedGroup (MillerSchuppEquator.Relators side) := PresentedGroup.of false
    let Y : PresentedGroup (MillerSchuppEquator.Relators side) := PresentedGroup.of true
    X * Y ≠ Y * X := by
  cases side
  · exact MillerSchuppEquator.noncommuting_generators false
  · exact MillerSchuppEquator.noncommuting_generators true

end SmoothPoincare
