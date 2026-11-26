import SmoothPoincare.Variational.AttainedRecognition
import SmoothPoincare.Variational.ConformalChiralCharges
import SmoothPoincare.Variational.ConformalCoreReference
import Mathlib.Analysis.SpecialFunctions.SmoothTransition

/-! # The spherical first cut of the split control

Use the signed height on one unit round four-sphere. Its two heights can be
chosen independently inside the native latitude band. The complete metrics on
each cap are given by extending its own half-profile across the actual equator.
-/

noncomputable section

open DifferentialGeometry DifferentialGeometry.Geometry DifferentialGeometry.Geometry.Metric
open DifferentialGeometry.Integral.Measure FirstOrderTwistor MeasureTheory SectionsAndConnections
open Set Manifold
open scoped ContDiff Manifold

namespace SmoothPoincare.RoundEquatorialCaps

local notation "V₅" => EuclideanSpace ℝ (Fin 5)
local instance : Fact (Module.finrank ℝ V₅ = 4 + 1) := ⟨by simp⟩
private local instance : Nonempty StandardFourSphere :=
  ((NormedSpace.sphere_nonempty (x := (0 : V₅)) (r := 1)).mpr zero_le_one).to_subtype
private local instance : MeasurableSpace StandardFourSphere := borel StandardFourSphere
private local instance : BorelSpace StandardFourSphere := ⟨rfl⟩

/-- Height radii below the two poles. For physical latitude width w use sin w. -/
abbrev HeightRadius := Set.Ioo (0 : ℝ) 1

def latitudeRadius (w : ℝ) (hw : 0 < w) (hp : w < Real.pi / 2) : HeightRadius :=
  ⟨Real.sin w, Real.sin_pos_of_pos_of_lt_pi hw (by linarith [Real.pi_pos]),
    by simpa using Real.sin_lt_sin_of_lt_of_le_pi_div_two (by linarith [Real.pi_pos]) (le_refl (Real.pi / 2)) hp⟩

def height (p : StandardFourSphere) : ℝ := p.val (Fin.last 4)

private theorem height_smooth : ContMDiff (𝓡 4) 𝓘(ℝ, ℝ) ∞ height :=
  (EuclideanSpace.proj (𝕜 := ℝ) (Fin.last 4)).contMDiff.comp (contMDiff_coe_sphere (E := V₅) (n := 4))

private def cut (a b : HeightRadius) (z : ℝ) : ℝ :=
  Real.smoothTransition (2 + 4 * z / a.val) * Real.smoothTransition (2 - 4 * z / b.val)

private theorem cut_plateau (a b : HeightRadius) {z : ℝ}
    (hl : -a.val / 4 ≤ z) (hr : z ≤ b.val / 4) : cut a b z = 1 := by
  have h₁ : -1 ≤ 4 * z / a.val := (le_div_iff₀ a.property.1).mpr (by linarith)
  have h₂ : 4 * z / b.val ≤ 1 := (div_le_iff₀ b.property.1).mpr (by linarith)
  unfold cut
  rw [Real.smoothTransition.one_of_one_le (by linarith : 1 ≤ 2 + 4 * z / a.val),
    Real.smoothTransition.one_of_one_le (by linarith : 1 ≤ 2 - 4 * z / b.val), one_mul]

private theorem cut_outer (a b : HeightRadius) {z : ℝ}
    (hz : z ≤ -a.val / 2 ∨ b.val / 2 ≤ z) : cut a b z = 0 := by
  rcases hz with hl | hr
  · have : 4 * z / a.val ≤ -2 := (div_le_iff₀ a.property.1).mpr (by linarith)
    simp [cut, Real.smoothTransition.zero_of_nonpos (show 2 + 4 * z / a.val ≤ 0 by linarith)]
  · have : 2 ≤ 4 * z / b.val := (le_div_iff₀ b.property.1).mpr (by linarith)
    simp [cut, Real.smoothTransition.zero_of_nonpos (show 2 - 4 * z / b.val ≤ 0 by linarith)]

private theorem logArgument_pos (a b : HeightRadius) (z : ℝ) : 0 < 1 - cut a b z * z ^ 2 := by
  by_cases h : z ≤ -a.val / 2 ∨ b.val / 2 ≤ z
  · simp [cut_outer a b h]
  push Not at h
  have hl : -1 < z := by linarith [a.property.2]
  have hr : z < 1 := by linarith [b.property.2]
  have hc : cut a b z ≤ 1 := by
    unfold cut
    exact (mul_le_mul_of_nonneg_right (Real.smoothTransition.le_one _) (Real.smoothTransition.nonneg _)).trans
      (by simpa using Real.smoothTransition.le_one _)
  have := mul_le_mul_of_nonneg_right hc (sq_nonneg z)
  nlinarith [mul_pos (sub_pos.mpr hr) (by linarith : 0 < 1 + z)]

/-- A global smooth logarithmic conformal factor, regular at both poles. -/
def logFactor (a b : HeightRadius) (s : ℝ) : C^∞⟮𝓡 4, StandardFourSphere; ℝ⟯ :=
  ⟨fun p => s * (-(Real.log (1 - cut a b (height p) * height p ^ 2)) / 2), by
    have hc : ContDiff ℝ ∞ (cut a b) := by unfold cut; fun_prop
    have hlog : ContDiff ℝ ∞ (fun z => Real.log (1 - cut a b z * z ^ 2)) :=
      (contDiff_const.sub (hc.mul (contDiff_id.pow 2))).log (fun z => (logArgument_pos a b z).ne')
    exact contMDiff_const.mul ((hlog.contMDiff.comp height_smooth).neg.div_const 2)⟩

def metric (a b : HeightRadius) (s : ℝ) : SmoothRiemannianMetric (𝓡 4) StandardFourSphere :=
  conformalMetric standardRoundFourMetric (logFactor a b s)

theorem metric_start (a b : HeightRadius) : metric a b 0 = standardRoundFourMetric := by
  have h : logFactor a b 0 = 0 := by ext p; simp [logFactor]
  rw [metric, h, conformalMetric_zero]

theorem outer_germ (a b : HeightRadius) (s : ℝ) (p : StandardFourSphere)
    (h : height p ≤ -a.val / 2 ∨ b.val / 2 ≤ height p) (v w : TangentSpace (𝓡 4) p) :
    (metric a b s).inner p v w = standardRoundFourMetric.inner p v w := by
  rw [metric, DifferentialGeometry.conformalMetric_inner]
  simp [logFactor, cut_outer a b h]

theorem endpoint_inner (a b : HeightRadius) (p : StandardFourSphere)
    (hl : -a.val / 4 ≤ height p) (hr : height p ≤ b.val / 4) (v w : TangentSpace (𝓡 4) p) :
    (metric a b 1).inner p v w =
      (1 - height p ^ 2)⁻¹ * standardRoundFourMetric.inner p v w := by
  have hc := cut_plateau a b hl hr
  have hp := logArgument_pos a b (height p)
  rw [hc, one_mul] at hp
  rw [metric, DifferentialGeometry.conformalMetric_inner]
  change Real.exp (2 * (1 * (-Real.log _ / 2))) * _ = _
  simp only [hc, one_mul]
  rw [show 2 * (-Real.log (1 - height p ^ 2) / 2) = -Real.log (1 - height p ^ 2) by ring,
    Real.exp_neg, Real.exp_log hp]

/-- Extending the opposite half using the retained side's radius leaves
the full retained tensor unchanged, with the identity equatorial marking. -/
theorem cap_restrictions (a b : HeightRadius) (p : StandardFourSphere) :
    (height p ≤ 0 → (metric a a 1).inner p = (metric a b 1).inner p) ∧
    (0 ≤ height p → (metric b b 1).inner p = (metric a b 1).inner p) := by
  have left (c : HeightRadius) (h : 0 ≤ height p) :
      Real.smoothTransition (2 + 4 * height p / c.val) = 1 :=
    Real.smoothTransition.one_of_one_le (by have := div_nonneg (mul_nonneg (by norm_num : (0:ℝ) ≤ 4) h) c.property.1.le; linarith)
  have right (c : HeightRadius) (h : height p ≤ 0) :
      Real.smoothTransition (2 - 4 * height p / c.val) = 1 :=
    Real.smoothTransition.one_of_one_le (by have := div_nonpos_of_nonpos_of_nonneg (mul_nonpos_of_nonneg_of_nonpos (by norm_num : (0:ℝ) ≤ 4) h) c.property.1.le; linarith)
  constructor
  · intro h
    ext v w
    change Real.exp (2 * logFactor a a 1 p) * _ = Real.exp (2 * logFactor a b 1 p) * _
    simp [logFactor, cut, right a h, right b h]
  · intro h
    ext v w
    change Real.exp (2 * logFactor b b 1 p) * _ = Real.exp (2 * logFactor a b 1 p) * _
    simp [logFactor, cut, left a h, left b h]

private theorem round_block_zero (o : ManifoldOrientation (𝓡 4) StandardFourSphere 4)
    (sg : CollarChirality) (x : StandardFourSphere) :
    signedCollarWeylBlock o standardRoundFourMetric
      (orientedOrthonormalFrameAt standardRoundFourMetric o) sg x = 0 := by
  cases sg with
  | plus => exact standardRoundFour_chiralBlock_eq_zero o x _
  | minus =>
    change traceFreeChiralBlock (antiSelfDualCurvatureBlock _) = 0
    rw [standardRoundFour_curvatureFrameTensor]
    have h : constantSectionalFrameTensor 1 = principalGaussTensor (fun _ => 1) := by
      funext i j k l
      change 1 * ((if i = k then 1 else 0) * (if j = l then 1 else 0) -
        (if i = l then 1 else 0) * (if j = k then 1 else 0)) = _
      simp [principalGaussTensor]
    rw [h, principalGauss_chiralBlocks_eq, ← h, traceFreeSelfDualBlock_constantSectional]

def signedRound (o : ManifoldOrientation (𝓡 4) StandardFourSphere 4) : SignedCollarMetric o where
  metric := standardRoundFourMetric
  frame := orientedOrthonormalFrameAt standardRoundFourMetric o
  integrable := by intro sg; simp [round_block_zero, hilbertSchmidtSq]
  signature_zero := by simp [chiralFrameEnergy, round_block_zero, hilbertSchmidtSq]

/-- Both actual signed Weyl measures vanish on every part of each global
conformal metric. This includes the whole joined sphere and either capped sphere. -/
theorem zero_charge (o : ManifoldOrientation (𝓡 4) StandardFourSphere 4)
    (a b : HeightRadius) (s : ℝ) (sg : CollarChirality) (A : Set StandardFourSphere) :
    ((signedRound o).conformal (logFactor a b s)).charge sg A = 0 := by
  rw [SignedCollarMetric.charge_conformal]
  simp [SignedCollarMetric.charge, SignedCollarMetric.chiralMeasure, signedRound, energyMeasure,
    round_block_zero, hilbertSchmidtSq]

/-- A single sign hypothesis on the fixed round source gives both cap signs
and the sign throughout the entire interpolation. -/
theorem joined_and_caps_positive (o : ManifoldOrientation (𝓡 4) StandardFourSphere 4)
    (hy : 0 < classYamabeFour o.dimension_eq standardRoundFourMetric) (a b : HeightRadius) :
    (∀ s : ℝ, 0 < classYamabeFour o.dimension_eq (metric a b s)) ∧
      0 < classYamabeFour o.dimension_eq (metric a a 1) ∧
      0 < classYamabeFour o.dimension_eq (metric b b 1) := by
  have hSphereRank : 1 < Module.rank ℝ V₅ := by simp [← Module.finrank_eq_rank]
  let : PathConnectedSpace StandardFourSphere := isPathConnected_iff_pathConnectedSpace.1
    (isPathConnected_sphere hSphereRank (0 : V₅) zero_le_one)
  have same (c d : HeightRadius) (s : ℝ) :
      classYamabeFour o.dimension_eq (metric c d s) = classYamabeFour o.dimension_eq standardRoundFourMetric :=
    classYamabeFour_conformalCore _ _ _
  exact ⟨fun s => (same a b s).symm ▸ hy, (same a a 1).symm ▸ hy, (same b b 1).symm ▸ hy⟩

end SmoothPoincare.RoundEquatorialCaps
