import SmoothPoincare.Heights.GaussParametricDensity
import SmoothPoincare.Heights.IndexedHeightFibers
import SmoothPoincare.Heights.ManifoldGaussSard
import SmoothPoincare.Heights.RoundGaussArea
import SmoothPoincare.Immersions.PrincipalFrameExistence

/-! # Morse nondegeneracy from regular values of the two normal fibers -/

open DifferentialGeometry DifferentialGeometry.Geometry DifferentialGeometry.Integral.Measure
open DifferentialGeometry.Topology DifferentialGeometry.Topology.Morse MeasureTheory
open scoped BigOperators ContDiff Manifold

namespace SmoothPoincare

local notation "V₅" => EuclideanSpace ℝ (Fin 5)
local instance : Fact (Module.finrank ℝ V₅ = 4 + 1) := ⟨by simp⟩
local notation "μₛ" => normalizedGaussDirections gaussRoundArea (8 * Real.pi ^ 2 / 3)

variable {E H M : Type*}
  [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  {g : SmoothRiemannianMetric I M} {F : IsometricHypersurface g}
  {o : ManifoldOrientation I M 4}

private theorem inner_gaussDirection_self (u : GaussDirection) : inner ℝ (u : V₅) (u : V₅) = 1 := by
  rw [real_inner_self_eq_norm_sq, mem_sphere_zero_iff_norm.mp u.property]
  norm_num

/-- At a critical point of the actual height, regularity of either corresponding
    normal fiber gives nondegeneracy of the chart Hessian. -/
theorem ImmersionGaussNormal.nondegenerate_height_of_regular_two_normal_fibers
    (N : ImmersionGaussNormal F) {x : M} (P : PrincipalFrameAt F o x)
    (hn : MDifferentiableAt I (𝓡 4) N.normal x) (u : GaussDirection)
    (hreg : N.normal x = u ∨ N.normal x = -u → (mfderiv I (𝓡 4) N.normal x).IsInvertible)
    (hu : IsCriticalPointAt I (immersionHeight F (u : V₅)) x) :
    IsNondegenerateCriticalPointAt I (immersionHeight F (u : V₅)) x := by
  have hNcrit : IsCriticalPointAt I (immersionHeight F (N.normal x : V₅)) x :=
    (immersionHeight_critical_iff F (N.normal x : V₅)).2 (N.perpendicular x)
  have hNsign := (principalHeight_unitCritical_iff P _ (inner_gaussDirection_self (N.normal x))).1 hNcrit
  have hUsign := (principalHeight_unitCritical_iff P _ (inner_gaussDirection_self u)).1 hu
  have hpair : (u : V₅) = (N.normal x : V₅) ∨ (u : V₅) = -(N.normal x : V₅) := by
    rcases hNsign with h | h
    · simpa only [h] using hUsign
    · simpa only [h, neg_neg, or_comm] using hUsign
  have hInv : (mfderiv I (𝓡 4) N.normal x).IsInvertible := by
    apply hreg
    rcases hpair with h | h
    · exact Or.inl (Subtype.ext h.symm)
    · exact Or.inr (Subtype.ext (by
        change (N.normal x : V₅) = -(u : V₅)
        rw [h, neg_neg]))
  have hJac : gaussFrameJacobian N.normal P.frame ≠ 0 :=
    (gaussMFDeriv_isInvertible_iff_frameJacobian_ne_zero N.normal P.frame hn).mp hInv
  rw [N.frameJacobian_eq_abs_prod P hn] at hJac
  have hk (i : Fin 4) : P.curvature i ≠ 0 := by
    intro h
    exact hJac (abs_eq_zero.mpr (Finset.prod_eq_zero (Finset.mem_univ i) h))
  rcases hUsign with h | h
  · simpa only [h, one_smul] using
      principalHeight_nondegenerateCritical P 1 (fun i => by simpa only [one_mul] using hk i)
  · simpa only [h, neg_one_smul] using
      principalHeight_nondegenerateCritical P (-1) (fun i => by
        simpa only [neg_mul, one_mul, neg_ne_zero] using hk i)

/-- With a smooth unit normal on this immersion, almost every direction
    under normalized round area gives a smooth height whose critical points
    are nondegenerate. Its pointwise principal frames are constructed. -/
theorem ImmersionGaussNormal.ae_nondegenerate_height [SecondCountableTopology M]
    (N : ImmersionGaussNormal F) (o : ManifoldOrientation I M 4)
    (hn : ContMDiff I (𝓡 4) ∞ N.normal) :
    ∀ᵐ u : GaussDirection ∂μₛ,
      ContMDiff I 𝓘(ℝ, ℝ) ∞ (immersionHeight F (u : V₅)) ∧
      ∀ x, IsCriticalPointAt I (immersionHeight F (u : V₅)) x →
        IsNondegenerateCriticalPointAt I (immersionHeight F (u : V₅)) x := by
  have hSard := N.ae_invertible_mfderiv_on_two_normal_fibers o.dimension_eq hn
  have hNative : ∀ᵐ u : GaussDirection ∂μₛ,
      ∀ x : M, N.normal x = u ∨ N.normal x = -u →
        (mfderiv I (𝓡 4) N.normal x).IsInvertible := by
    rw [ae_iff] at hSard ⊢
    rw [normalizedGaussDirections, Measure.smul_apply, gaussRoundArea_apply]
    simpa only [normalizedGaussDirections, Measure.smul_apply] using hSard
  filter_upwards [hNative] with u hu
  refine ⟨(innerSL ℝ (u : V₅)).contDiff.contMDiff.comp F.smooth, ?_⟩
  intro x hx
  exact N.nondegenerate_height_of_regular_two_normal_fibers
    (N.principalFrameAt o x) (hn.mdifferentiableAt (by simp)) u (hu x) hx

/-- The globally constructed normal of the actual oriented immersion gives
    Morse heights for almost every direction under normalized round area. -/
theorem orientedHeight_ae_nondegenerate [SecondCountableTopology M]
    (F : IsometricHypersurface g) (o : ManifoldOrientation I M 4)
    (a : OrthonormalBasis (Fin 5) ℝ V₅) :
    ∀ᵐ u : GaussDirection ∂μₛ,
      ContMDiff I 𝓘(ℝ, ℝ) ∞ (immersionHeight F (u : V₅)) ∧
      ∀ x, IsCriticalPointAt I (immersionHeight F (u : V₅)) x →
        IsNondegenerateCriticalPointAt I (immersionHeight F (u : V₅)) x :=
  (orientedGaussNormal F o a).ae_nondegenerate_height o (orientedGaussNormal_smooth F o a)

end SmoothPoincare
