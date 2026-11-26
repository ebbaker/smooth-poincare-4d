import SmoothPoincare.Variational.RoundEquatorialCaps
import SmoothPoincare.Variational.FixedSourceMarkedCaps
import DifferentialGeometry.Topology.Manifold.SphereOrthogonalAction
import DifferentialGeometry.Geometry.Metric.Sphere.Round.GreatCircle
import Mathlib.Analysis.InnerProductSpace.Projection.Reflection

/-! # Genuine caps in the native round equatorial marking -/

noncomputable section

open DifferentialGeometry DifferentialGeometry.Geometry FirstOrderTwistor Filter Set Manifold
open scoped ContDiff Manifold InnerProductSpace Topology

namespace SmoothPoincare.RoundEquatorialCaps

local notation "V₅" => EuclideanSpace ℝ (Fin 5)
local notation "S₄" => StandardFourSphere
local notation "I₄" => 𝓡 4
local instance : Fact (Module.finrank ℝ V₅ = 4 + 1) := ⟨by simp⟩
private local instance : MeasurableSpace S₄ := borel S₄
private local instance : BorelSpace S₄ := ⟨rfl⟩
private local instance : Nonempty S₄ :=
  ((NormedSpace.sphere_nonempty (x := (0 : V₅)) (r := 1)).mpr zero_le_one).to_subtype

/-- Unit normal used in the signed angular identification of the two hemispheres. -/
def poleVector : V₅ := EuclideanSpace.single (Fin.last 4) 1

private theorem inner_pole (x : V₅) : ⟪x, poleVector⟫_ℝ = x (Fin.last 4) := by
  simp [poleVector, EuclideanSpace.inner_single_right]

private theorem height_continuous : Continuous height :=
  (EuclideanSpace.proj (𝕜 := ℝ) (Fin.last 4)).continuous.comp continuous_subtype_val

theorem interior_south : interior standardFourSphereCap = {p : S₄ | height p < 0} := by
  apply le_antisymm
  · intro p hp
    have hn : height p ≤ 0 := (interior_subset hp : p ∈ standardFourSphereCap)
    rcases hn.lt_or_eq with h | h
    · exact h
    have hu : ‖poleVector‖ = 1 := by simp [poleVector]
    have horth : ⟪(p : V₅), poleVector⟫_ℝ = 0 := (inner_pole p).trans h
    let c := greatCircle p poleVector hu horth
    have hc : Tendsto c (𝓝[>] (0:ℝ)) (𝓝 p) := by
      have hs := (greatCircle_smooth (n := 4) p poleVector hu horth).continuous.continuousAt (x := (0:ℝ))
      simpa [c] using hs.tendsto.mono_left nhdsWithin_le_nhds
    have hcap : ∀ᶠ t : ℝ in 𝓝[>] 0, c t ∈ standardFourSphereCap := hc (mem_interior_iff_mem_nhds.mp hp)
    have hsin : ∀ᶠ t : ℝ in 𝓝[>] 0, 0 < Real.sin t := by
      filter_upwards [self_mem_nhdsWithin, (eventually_lt_nhds Real.pi_pos).filter_mono nhdsWithin_le_nhds]
        with t ht ht' using Real.sin_pos_of_pos_of_lt_pi ht ht'
    obtain ⟨t, ht, ht'⟩ := (hcap.and hsin).exists
    change height (c t) ≤ 0 at ht
    have he : height (c t) = Real.sin t := by
      change (Real.cos t • (p : V₅) + Real.sin t • poleVector) (Fin.last 4) = _
      change (p : V₅) (Fin.last 4) = 0 at h
      have hp0 : (p : V₅) 4 = 0 := h
      simp [poleVector, hp0, PiLp.add_apply, PiLp.smul_apply]
    exact False.elim (ht'.not_ge (he ▸ ht))
  · have hsub : {p : S₄ | height p < 0} ⊆ standardFourSphereCap := fun p hp => (le_of_lt hp : height p ≤ 0)
    exact interior_maximal hsub (isOpen_lt height_continuous continuous_const)

private abbrev equatorialPlane := (ℝ ∙ poleVector)ᗮ

/-- The cap-ball map and its inverse both reflect the physical normal while
fixing the entire pointwise angular parametrization on the equator. -/
def flip : S₄ ≃ₘ⟮I₄, I₄⟯ S₄ := sphereDiffeo equatorialPlane.reflection

theorem flip_height (p : S₄) : height (flip p) = -height p := by
  let R := equatorialPlane.reflection
  have hn : R poleVector = -poleVector := Submodule.reflection_orthogonalComplement_singleton_eq_neg _
  have h := R.inner_map_map (p : V₅) poleVector
  rw [hn, inner_neg_right, inner_pole, inner_pole] at h
  change (R (p : V₅)) (Fin.last 4) = -(p : V₅) (Fin.last 4)
  linarith

theorem flip_fixes_equator (p : S₄) (h : height p = 0) : flip p = p := by
  apply Subtype.ext
  apply Submodule.reflection_mem_subspace_eq_self
  apply Submodule.mem_orthogonal_singleton_iff_inner_right.mpr
  rw [real_inner_comm, inner_pole]
  exact h

def northClosure : FixedMarkedCutCore I₄ S₄ I₄ S₄ where
  raw := {p | 0 ≤ height p}
  rawMeasurable := (isClosed_le continuous_const height_continuous).measurableSet
  core := (Diffeomorph.refl I₄ S₄ ∞).toPartialDiffeomorph
  marking := (Diffeomorph.refl I₄ S₄ ∞).toPartialDiffeomorph
  capInMarking := subset_univ _
  rawInCore := subset_univ _
  coreImage := by
    change id '' _ = (interior (id '' standardFourSphereCap))ᶜ
    rw [image_id, image_id, interior_south]
    ext p
    change 0 ≤ height p ↔ ¬ height p < 0
    exact not_lt.symm

def southClosure : FixedMarkedCutCore I₄ S₄ I₄ S₄ where
  raw := {p | height p ≤ 0}
  rawMeasurable := (isClosed_le height_continuous continuous_const).measurableSet
  core := (Diffeomorph.refl I₄ S₄ ∞).toPartialDiffeomorph
  marking := flip.toPartialDiffeomorph
  capInMarking := subset_univ _
  rawInCore := subset_univ _
  coreImage := by
    change id '' _ = (interior (flip.toHomeomorph '' standardFourSphereCap))ᶜ
    rw [image_id, ← Homeomorph.image_interior, interior_south]
    ext p
    obtain ⟨x, rfl⟩ := flip.surjective p
    change height (flip x) ≤ 0 ↔ ¬ flip x ∈ flip '' {p | height p < 0}
    rw [flip_height]
    have h : flip x ∈ flip '' {p | height p < 0} ↔ height x < 0 := by
      exact Function.Injective.mem_set_image (f := (flip : S₄ → S₄)) flip.injective
    rw [h]
    simp

/-- All tolerances on this one physical metric are met by the two displayed
cap metrics at the very same latitude radii. -/
theorem positive_caps_on_marked_hemispheres (o : ManifoldOrientation I₄ S₄ 4)
    (hy : 0 < classYamabeFour o.dimension_eq standardRoundFourMetric) (a b : HeightRadius) :
    southClosure.HasPositiveCaps (signedRound o) o ∧ northClosure.HasPositiveCaps (signedRound o) o := by
  have hs := joined_and_caps_positive o hy a b
  have done (core : FixedMarkedCutCore I₄ S₄ I₄ S₄) (r : HeightRadius)
      (hr : 0 < classYamabeFour o.dimension_eq (metric r r 1)) : core.HasPositiveCaps (signedRound o) o := by
    intro ε hε
    refine ⟨(signedRound o).conformal (logFactor r r 1), hr, fun sg => ?_⟩
    have h0 : (signedRound o).charge sg core.raw = 0 := by
      rw [← SignedCollarMetric.charge_conformal _ (logFactor a b 0)]
      exact zero_charge o _ _ _ _ _
    rw [← SignedCollarMetric.charge_univ, zero_charge, h0, sub_zero, abs_zero]
    exact hε
  exact ⟨done southClosure a hs.2.1, done northClosure b hs.2.2⟩

/-- The entire unit round sphere is an induced metric from the indicated
global hypersurface immersion. -/
def roundInclusion : IsometricHypersurface standardRoundFourMetric where
  map := Subtype.val
  smooth := contMDiff_coe_sphere (E := V₅) (n := 4)
  isometric p v w := by
    change ⟪dIncl (n := 4) p v, dIncl (n := 4) p w⟫_ℝ = _
    exact (roundMetric_inner p v w).symm

end SmoothPoincare.RoundEquatorialCaps
