import SmoothPoincare.Variational.RoundHemisphereMarkings
import SmoothPoincare.Variational.RoundLatitudeProduct
import SmoothPoincare.Variational.PositiveScalarYamabeFour

/-! # An exact marked face and two positive caps on one physical source -/

noncomputable section

open DifferentialGeometry DifferentialGeometry.Geometry FirstOrderTwistor Manifold Set
open scoped ContDiff Manifold

namespace SmoothPoincare.RoundEquatorialCaps

local notation "V₅" => EuclideanSpace ℝ (Fin 5)
local notation "S₄" => StandardFourSphere
local instance : Fact (Module.finrank ℝ V₅ = 4 + 1) := ⟨by simp⟩
private local instance : Nonempty S₄ :=
  ((NormedSpace.sphere_nonempty (x := (0 : V₅)) (r := 1)).mpr zero_le_one).to_subtype
private local instance : Fact (Module.finrank ℝ (ℝ ∙ (roundLatitudeNorth : V₅))ᗮ = 3 + 1) :=
  ⟨polarDir_finrank (n := 3) roundLatitudeNorth⟩
local notation "Ipolar" => (ModelWithCorners.prod (𝓘(ℝ, ℝ)) (𝓡 3))

theorem logFactor_jointly_smooth (a b : HeightRadius) :
    ContMDiff ((𝓘(ℝ, ℝ)).prod (𝓡 4)) 𝓘(ℝ, ℝ) ∞
      (fun (p : ℝ × S₄) => logFactor a b p.1 p.2) := by
  have h := contMDiff_fst.mul ((logFactor a b 1).contMDiff.comp
    (contMDiff_snd (I := 𝓘(ℝ, ℝ))))
  exact h.congr (fun p => by simp [logFactor])

/-- The actual endpoint equals the product on the full open angular chart.
Cylinder time increases towards the south, so the opposite signed normal
uses its negative on the same chart. -/
theorem marked_product_endpoint (a b : HeightRadius) (q : ℝ × PolarDir roundLatitudeNorth)
    (hq : q.1 ∈ Ioo 0 Real.pi) (hL : -a.val / 4 ≤ Real.cos q.1)
    (hR : Real.cos q.1 ≤ b.val / 4) (v w : ℝ × EuclideanSpace ℝ (Fin 3)) :
    let F := roundLatitudeChart roundLatitudeNorth
    (metric a b 1).inner (F q) (mfderiv Ipolar (𝓡 4) F q v) (mfderiv Ipolar (𝓡 4) F q w) =
      mvfderiv Ipolar (roundLatitudeCylinderTime ∘ Prod.fst) q v *
      mvfderiv Ipolar (roundLatitudeCylinderTime ∘ Prod.fst) q w +
      (roundMetric (E := (ℝ ∙ (roundLatitudeNorth : V₅))ᗮ) (n := 3)).inner q.2 v.2 w.2 := by
  have hHeight : height (roundLatitudeChart roundLatitudeNorth q) = Real.cos q.1 :=
    roundLatitudeChart_last q
  dsimp only
  rw [endpoint_inner a b _ (hHeight.symm ▸ hL)
    (hHeight.symm ▸ hR), hHeight,
    show 1 - Real.cos q.1 ^ 2 = Real.sin q.1 ^ 2 by linarith [Real.sin_sq_add_cos_sq q.1]]
  exact roundLatitudeChart_cylindrical_inner _ q hq v w

/-- A finite fixed-source test at any two available physical latitude widths.
Both positive capped metrics already satisfy every drift tolerance at these
widths. All signed charges, including the complete joined charge, are zero. -/
theorem fixedSource_at_physical_widths (o : ManifoldOrientation (𝓡 4) S₄ 4)
    (wL wR : ℝ) (hl : 0 < wL) (hr : 0 < wR) (hlp : wL < Real.pi / 2)
    (hrp : wR < Real.pi / 2) :
    let a := latitudeRadius wL hl hlp
    let b := latitudeRadius wR hr hrp
    (∀ s : ℝ, 0 < classYamabeFour o.dimension_eq (metric a b s)) ∧
    0 < classYamabeFour o.dimension_eq (metric a a 1) ∧
    0 < classYamabeFour o.dimension_eq (metric b b 1) ∧
    (∀ s : ℝ, ∀ sg : CollarChirality, ∀ A : Set S₄,
      ((signedRound o).conformal (logFactor a b s)).charge sg A = 0) ∧
    (∀ s : ℝ, ((signedRound o).conformal (logFactor a b s)).energy .plus < 2 * (4 * Real.pi ^ 2)) ∧
    southClosure.HasPositiveCaps (signedRound o) o ∧ northClosure.HasPositiveCaps (signedRound o) o ∧
    (∀ core ∈ ({southClosure, northClosure} : Set _), ∀ sg : CollarChirality,
      sInf (geometricPositiveEnergies o) ≤ (signedRound o).charge sg core.raw) := by
  let a := latitudeRadius wL hl hlp
  let b := latitudeRadius wR hr hrp
  have hy := joined_and_caps_positive o standardRoundFour_yamabe_pos a b
  have hCaps := positive_caps_on_marked_hemispheres o standardRoundFour_yamabe_pos a b
  refine ⟨hy.1, hy.2.1, hy.2.2, fun s sg A => zero_charge o a b s sg A, ?_,
    hCaps.1, hCaps.2, ?_⟩
  · intro s
    rw [← SignedCollarMetric.charge_univ, zero_charge]
    positivity
  · intro core hc sg
    rcases (mem_insert_iff.mp hc) with rfl | hc
    · exact (southClosure.rawMasses_of_positiveCaps (signedRound o) hCaps.1).2 sg
    · have heq : core = northClosure := mem_singleton_iff.mp hc
      subst core
      exact (northClosure.rawMasses_of_positiveCaps (signedRound o) hCaps.2).2 sg

end SmoothPoincare.RoundEquatorialCaps
