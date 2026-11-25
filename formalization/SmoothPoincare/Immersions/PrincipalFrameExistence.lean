import SmoothPoincare.Immersions.OrientedGaussNormal
import SmoothPoincare.Heights.IndexedHeightFibers
import Mathlib.Analysis.InnerProductSpace.Spectrum

/-! # Existence of pointwise principal frames for an actual hypersurface -/

open DifferentialGeometry DifferentialGeometry.Geometry DifferentialGeometry.Tensor0SBundle
open FirstOrderTwistor
open scoped ContDiff Manifold

namespace SmoothPoincare

local notation "V₅" => EuclideanSpace ℝ (Fin 5)

private noncomputable def metricDualOperator {T : Type*} [NormedAddCommGroup T]
    [InnerProductSpace ℝ T] [FiniteDimensional ℝ T] (S : T →ₗ[ℝ] T →ₗ[ℝ] ℝ) :
    T →ₗ[ℝ] T :=
  (InnerProductSpace.toDual ℝ T).symm.toLinearEquiv.toLinearMap.comp
    (LinearMap.toContinuousLinearMap.toLinearMap.comp S)

private theorem inner_metricDualOperator {T : Type*} [NormedAddCommGroup T]
    [InnerProductSpace ℝ T] [FiniteDimensional ℝ T] (S : T →ₗ[ℝ] T →ₗ[ℝ] ℝ) (u v : T) :
    inner ℝ (metricDualOperator S u) v = S u v := by
  change inner ℝ ((InnerProductSpace.toDual ℝ T).symm (LinearMap.toContinuousLinearMap (S u))) v = _
  rw [InnerProductSpace.toDual_symm_apply]
  rfl

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  {g : SmoothRiemannianMetric I M} {F : IsometricHypersurface g}

private noncomputable def ascendingPrincipalFrameAt (N : ImmersionGaussNormal F)
    (o : ManifoldOrientation I M 4) (x : M) :
    { P : PrincipalFrameAt F o x // Monotone P.curvature ∧ P.normal = (N.normal x : V₅) } := by
  let T := TangentSpace I x
  let n : V₅ := N.normal x
  let B : T →L[ℝ] T →L[ℝ] V₅ := secondFundamentalFormAmbientAt g euclideanMetric F.map x
  have hn : inner ℝ n n = 1 := by
    rw [real_inner_self_eq_norm_sq, show ‖n‖ = 1 from
      mem_sphere_zero_iff_norm.mp (N.normal x).property, one_pow]
  have hSymm (u v : T) : B u v = B v u :=
    secondFundamentalFormAmbientAt_symmetric g euclideanMetric
      ((F.smooth.contMDiffAt (x := x)).of_le (by simp)) u v
  let b₀ := orientedOrthonormalFrameAt g o x
  let t : Fin 4 → V₅ := fun i => mfderiv I 𝓘(ℝ, V₅) F.map x (b₀.basis i)
  have ht : Orthonormal ℝ t := orthonormal_iff_ite.mpr fun i j =>
    (F.isometric x (b₀.basis i) (b₀.basis j)).trans (b₀.orthonormal i j)
  have hLine (u v : T) : B u v = (inner ℝ n (B u v)) • n := by
    rw [real_inner_comm (B u v) n]
    exact ambientOrthogonal_eq_inner_smul_normal t n (B u v) ht hn
      (fun i => N.perpendicular x (b₀.basis i)) (fun i =>
        secondFundamentalFormAmbientAt_inner_mfderiv_eq_zero_of_inner_map
          F.smooth F.isometric x u v (b₀.basis i))
  let L := innerSL ℝ n
  let S : T →ₗ[ℝ] T →ₗ[ℝ] ℝ :=
    { toFun := fun u => L.toLinearMap.comp (B u).toLinearMap
      map_add' := fun u v => by
        ext w
        change L (B (u + v) w) = L (B u w) + L (B v w)
        simp
      map_smul' := fun r u => by
        ext w
        change L (B (r • u) w) = r * L (B u w)
        simp }
  let D := (tangentMetricData (I := I) g x).metric
  letI : InnerProductSpace.Core ℝ T := D.toCore
  letI : NormedAddCommGroup T := @InnerProductSpace.Core.toNormedAddCommGroup ℝ T _ _ _ D.toCore
  letI : InnerProductSpace ℝ T := @InnerProductSpace.ofCore ℝ T _ _ _ D.toCore.toCore
  let A := metricDualOperator S
  have hA (u v : T) : inner ℝ (A u) v = inner ℝ n (B u v) :=
    inner_metricDualOperator S u v
  have hInner (u v : T) : inner ℝ u v = g.inner x u v := by
    rw [← TangentMetricData.inner_eq (tangentMetricData (I := I) g x)]
    exact MetricFiberData.toCore_inner D u v
  have hSymmA : A.IsSymmetric := by
    intro u v
    rw [real_inner_comm (A v) u, hA, hA, hSymm u v]
  let hd : Module.finrank ℝ T = 4 := o.dimension_eq
  let e := (hSymmA.eigenvectorBasis hd).reindex Fin.revPerm
  let k := hSymmA.eigenvalues hd ∘ Fin.rev
  let b := e.adjustToOrientation (o.orientation x)
  have hEig (i : Fin 4) : A (b i) = k i • b i := by
    have h : A (e i) = k i • e i := by
      have h := hSymmA.apply_eigenvectorBasis hd (Fin.rev i)
      change A (hSymmA.eigenvectorBasis hd (Fin.rev i)) = hSymmA.eigenvalues hd (Fin.rev i) •
        hSymmA.eigenvectorBasis hd (Fin.rev i) at h
      simpa only [e, k, OrthonormalBasis.reindex_apply, Fin.revPerm_symm, Fin.revPerm_apply,
        Function.comp_apply] using h
    rcases e.adjustToOrientation_apply_eq_or_eq_neg (o.orientation x) i with hi | hi
    · change b i = e i at hi
      rw [hi, h]
    · change b i = -e i at hi
      rw [hi, map_neg, h, smul_neg]
  refine ⟨
    { frame := ⟨b.toBasis, fun i j => ?_, e.orientation_adjustToOrientation _⟩
      normal := n
      unit := hn
      perpendicular := N.perpendicular x
      curvature := k
      principal := fun i j => ?_ }, ?_, rfl⟩
  · change g.inner x (b i) (b j) = _
    rw [← hInner]
    exact b.inner_eq_ite i j
  · change B (b i) (b j) = (if i = j then k i else 0) • n
    rw [hLine, ← hA, hEig, real_inner_smul_left, b.inner_eq_ite]
    by_cases hij : i = j <;> simp [hij]
  · intro i j hij
    exact hSymmA.eigenvalues_antitone hd (Fin.rev_le_rev.mpr hij)

/-- Choose an oriented orthonormal principal frame at one point, in
ascending order of the curvatures measured against the given normal. -/
noncomputable def ImmersionGaussNormal.principalFrameAt (N : ImmersionGaussNormal F)
    (o : ManifoldOrientation I M 4) (x : M) : PrincipalFrameAt F o x :=
  (ascendingPrincipalFrameAt N o x).1

theorem ImmersionGaussNormal.principalFrameAt_monotone (N : ImmersionGaussNormal F)
    (o : ManifoldOrientation I M 4) (x : M) : Monotone (N.principalFrameAt o x).curvature :=
  (ascendingPrincipalFrameAt N o x).2.1

@[simp]
theorem ImmersionGaussNormal.principalFrameAt_normal (N : ImmersionGaussNormal F)
    (o : ManifoldOrientation I M 4) (x : M) : (N.principalFrameAt o x).normal = (N.normal x : V₅) :=
  (ascendingPrincipalFrameAt N o x).2.2

/-- An ascending strict middle spectrum has its two negative curvatures first. -/
theorem HasMiddlePrincipalSignature.ordered_of_monotone {k : Fin 4 → ℝ}
    (h : HasMiddlePrincipalSignature k) (hk : Monotone k) :
    k 0 < 0 ∧ k 1 < 0 ∧ 0 < k 2 ∧ 0 < k 3 := by
  have h₁ : k 1 < 0 := by
    by_contra! h₁
    have hs : {i | k i < 0} ⊆ ({0} : Set (Fin 4)) := by
      intro i hi
      fin_cases i
      · simp
      all_goals
        exfalso
        exact (not_lt_of_ge (h₁.trans (hk (by decide)))) hi
    have hcard := Set.ncard_le_ncard hs
    rw [h.2, Set.ncard_singleton] at hcard
    omega
  have h₂ : 0 < k 2 := by
    by_contra! h₂
    have hneg : k 2 < 0 := lt_of_le_of_ne h₂ (h.1 2)
    have hs : ({0, 1, 2} : Set (Fin 4)) ⊆ {i | k i < 0} := by
      intro i hi
      simp only [Set.mem_insert_iff, Set.mem_singleton_iff] at hi
      rcases hi with rfl | rfl | rfl
      · exact lt_of_le_of_lt (hk (by decide)) hneg
      · exact h₁
      · exact hneg
    have hcard := Set.ncard_le_ncard hs
    have hthree : ({0, 1, 2} : Set (Fin 4)).ncard = 3 := by
      rw [Set.ncard_insert_of_notMem (by decide : (0 : Fin 4) ∉ ({1, 2} : Set (Fin 4))),
        Set.ncard_pair (by decide : (1 : Fin 4) ≠ 2)]
    rw [hthree, h.2] at hcard
    omega
  exact ⟨lt_of_le_of_lt (hk (by decide)) h₁, h₁, h₂, lt_of_lt_of_le h₂ (hk (by decide))⟩

/-- Every point of the oriented isometric immersion has an actual oriented
principal frame for the global Gauss normal. -/
noncomputable def orientedPrincipalFrameAt (F : IsometricHypersurface g)
    (o : ManifoldOrientation I M 4) (a : OrthonormalBasis (Fin 5) ℝ V₅) (x : M) :
    PrincipalFrameAt F o x :=
  (orientedGaussNormal F o a).principalFrameAt o x

theorem orientedPrincipalFrameAt_monotone (F : IsometricHypersurface g)
    (o : ManifoldOrientation I M 4) (a : OrthonormalBasis (Fin 5) ℝ V₅) (x : M) :
    Monotone (orientedPrincipalFrameAt F o a x).curvature :=
  (orientedGaussNormal F o a).principalFrameAt_monotone o x

theorem orientedPrincipalFrameAt_middle_order (F : IsometricHypersurface g)
    (o : ManifoldOrientation I M 4) (a : OrthonormalBasis (Fin 5) ℝ V₅) (x : M)
    (h : HasMiddlePrincipalSignature (orientedPrincipalFrameAt F o a x).curvature) :
    let k := (orientedPrincipalFrameAt F o a x).curvature
    k 0 < 0 ∧ k 1 < 0 ∧ 0 < k 2 ∧ 0 < k 3 :=
  h.ordered_of_monotone (orientedPrincipalFrameAt_monotone F o a x)

end SmoothPoincare
