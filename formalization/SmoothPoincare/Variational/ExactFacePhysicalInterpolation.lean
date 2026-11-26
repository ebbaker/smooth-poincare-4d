import SmoothPoincare.Variational.ConformalChiralCharges
import SmoothPoincare.Variational.SelectedDiskReference
import DifferentialGeometry.Geometry.Metric.Construction.ConvexCombination
import DifferentialGeometry.Geometry.Metric.Conformal
import DifferentialGeometry.Geometry.Metric.Pullback.PartialDiffeomorph.CompactExtension
import DifferentialGeometry.Geometry.Metric.Sphere.Round.Metric
import DifferentialGeometry.Geometry.Metric.Product
import Mathlib.Analysis.SpecialFunctions.SmoothTransition
import Mathlib.Analysis.Calculus.Deriv.Mul
import Mathlib.Analysis.Calculus.Deriv.Comp
import Mathlib.Analysis.Calculus.Deriv.MeanValue
import Mathlib.Analysis.Calculus.ContDiff.Deriv
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring

/-! # The physical interpolation at a supplied marked spherical face -/

open DifferentialGeometry DifferentialGeometry.Geometry
open Filter Manifold Set TopologicalSpace
open scoped ContDiff Manifold Topology

namespace SmoothPoincare

noncomputable section

/-- One fixed profile in the nonnegative relative normal coordinate. -/
def exactFaceProfile (r : ℝ) : ℝ := Real.smoothTransition (3 / 2 - 2 * r)

theorem contDiff_exactFaceProfile : ContDiff ℝ ∞ exactFaceProfile :=
  Real.smoothTransition.contDiff.comp (contDiff_const.sub (contDiff_const.mul contDiff_id))

theorem exactFaceProfile_mem_Icc (r : ℝ) :
    exactFaceProfile r ∈ Icc (0 : ℝ) 1 :=
  ⟨Real.smoothTransition.nonneg _, Real.smoothTransition.le_one _⟩

theorem exactFaceProfile_eq_one {r : ℝ} (hr : r ≤ 1 / 4) :
    exactFaceProfile r = 1 :=
  Real.smoothTransition.one_of_one_le (by linarith)

theorem exactFaceProfile_eq_zero {r : ℝ} (hr : 3 / 4 ≤ r) :
    exactFaceProfile r = 0 :=
  Real.smoothTransition.zero_of_nonpos (by linarith)

/-- On each half the factor from the opposite side is identically one. -/
def exactFaceCutoff (wL wR t : ℝ) : ℝ :=
  exactFaceProfile (-t / wL) * exactFaceProfile (t / wR)

theorem contDiff_exactFaceCutoff (wL wR : ℝ) : ContDiff ℝ ∞ (exactFaceCutoff wL wR) :=
  (contDiff_exactFaceProfile.comp (contDiff_id.neg.div_const _)).mul
    (contDiff_exactFaceProfile.comp (contDiff_id.div_const _))

theorem exactFaceCutoff_mem_Icc (wL wR t : ℝ) :
    exactFaceCutoff wL wR t ∈ Icc (0 : ℝ) 1 := by
  have hL := exactFaceProfile_mem_Icc (-t / wL)
  have hR := exactFaceProfile_mem_Icc (t / wR)
  exact ⟨mul_nonneg hL.1 hR.1, (mul_le_mul_of_nonneg_right hL.2 hR.1).trans (by simpa using hR.2)⟩

theorem exactFaceCutoff_eq_one {wL wR t : ℝ} (hL : 0 < wL) (hR : 0 < wR)
    (htL : -(wL / 4) ≤ t) (htR : t ≤ wR / 4) : exactFaceCutoff wL wR t = 1 := by
  rw [exactFaceCutoff, exactFaceProfile_eq_one ((div_le_iff₀ hL).2 (by linarith)),
    exactFaceProfile_eq_one ((div_le_iff₀ hR).2 (by linarith)), mul_one]

theorem exactFaceCutoff_eq_zero {wL wR t : ℝ} (hL : 0 < wL) (hR : 0 < wR)
    (ht : t ≤ -((3 / 4) * wL) ∨ (3 / 4) * wR ≤ t) : exactFaceCutoff wL wR t = 0 := by
  rcases ht with ht | ht
  · rw [exactFaceCutoff, exactFaceProfile_eq_zero ((le_div_iff₀ hL).2 (by linarith)),
      zero_mul]
  · rw [exactFaceCutoff, exactFaceProfile_eq_zero ((le_div_iff₀ hR).2 ht), mul_zero]

theorem exactFaceCutoff_left {wL wR t : ℝ} (hR : 0 < wR) (ht : t ≤ 0) :
    exactFaceCutoff wL wR t = exactFaceProfile (-t / wL) := by
  rw [exactFaceCutoff, exactFaceProfile_eq_one ((div_le_iff₀ hR).2 (by linarith)), mul_one]

theorem exactFaceCutoff_right {wL wR t : ℝ} (hL : 0 < wL) (ht : 0 ≤ t) :
    exactFaceCutoff wL wR t = exactFaceProfile (t / wR) := by
  rw [exactFaceCutoff, exactFaceProfile_eq_one ((div_le_iff₀ hL).2 (by linarith)), one_mul]

abbrev ExactFaceSphere := Metric.sphere (0 : EuclideanSpace ℝ (Fin 4)) 1
abbrev ExactFaceTube := ExactFaceSphere × ℝ

local notation "J" => ModelWithCorners.prod (𝓡 3) (𝓘(ℝ))

private local instance : Fact (Module.finrank ℝ (EuclideanSpace ℝ (Fin 4)) = 3 + 1) :=
  ⟨by simp⟩

/-- The unit round product in the angular marking. -/
def exactFaceRoundCylinder : SmoothRiemannianMetric J ExactFaceTube :=
  (roundMetric (E := EuclideanSpace ℝ (Fin 4)) (n := 3)).prod (euclideanMetric ℝ)

/-- The complete angular cross-section at every signed height in the slab. -/
def exactFaceSlab (wL wR : ℝ) : Set ExactFaceTube :=
  univ ×ˢ Icc (-wL) wR

theorem isCompact_exactFaceSlab (wL wR : ℝ) : IsCompact (exactFaceSlab wL wR) :=
  isCompact_univ.prod isCompact_Icc

section PhysicalMetric

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [FiniteDimensional ℝ E] [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]

/-- Extend a scalar in the signed collar by zero using the actual inverse. -/
def exactFacePush (F : PartialDiffeomorph J I ExactFaceTube M ∞)
    (f : ExactFaceTube → ℝ) : M → ℝ := by
  classical
  exact F.target.piecewise (f ∘ F.symm) (fun _ => 0)

omit [FiniteDimensional ℝ E] [IsManifold I ∞ M] [T2Space M] in
theorem exactFacePush_apply_chart (F : PartialDiffeomorph J I ExactFaceTube M ∞)
    (f : ExactFaceTube → ℝ) {z : ExactFaceTube} (hz : z ∈ F.source) :
    exactFacePush F f (F z) = f z := by
  classical
  rw [exactFacePush, piecewise_eq_of_mem _ _ _ (F.map_source hz), Function.comp_apply]
  exact congrArg f (F.left_inv hz)

omit [FiniteDimensional ℝ E] [IsManifold I ∞ M] [T2Space M] in
theorem exactFacePush_eq_zero_off_image (F : PartialDiffeomorph J I ExactFaceTube M ∞)
    {K : Set ExactFaceTube} {f : ExactFaceTube → ℝ}
    (hSupp : ∀ z, f z ≠ 0 → z ∈ K) {y : M} (hy : y ∉ F '' K) :
    exactFacePush F f y = 0 := by
  classical
  by_cases hyt : y ∈ F.target
  · rw [exactFacePush, piecewise_eq_of_mem _ _ _ hyt, Function.comp_apply]
    by_contra hf
    exact hy ⟨F.symm y, hSupp _ hf, F.right_inv hyt⟩
  · exact piecewise_eq_of_notMem _ _ _ hyt

omit [FiniteDimensional ℝ E] [IsManifold I ∞ M] in
theorem contMDiff_exactFacePush (F : PartialDiffeomorph J I ExactFaceTube M ∞)
    {K : Set ExactFaceTube} (hK : IsCompact K) (hSource : K ⊆ F.source)
    {f : ExactFaceTube → ℝ} (hf : ContMDiff J 𝓘(ℝ) ∞ f)
    (hSupp : ∀ z, f z ≠ 0 → z ∈ K) : ContMDiff I 𝓘(ℝ) ∞ (exactFacePush F f) := by
  classical
  have hClosed : IsClosed (F '' K) :=
    (hK.image_of_continuousOn (F.contMDiffOn_toFun.continuousOn.mono hSource)).isClosed
  have hOn : ContMDiffOn I 𝓘(ℝ) ∞ (exactFacePush F f) F.target := by
    apply ((hf.contMDiffOn (s := univ)).comp F.contMDiffOn_invFun (mapsTo_univ _ _)).congr
    intro y hy
    exact piecewise_eq_of_mem _ _ _ hy
  intro y
  by_cases hy : y ∈ F.target
  · exact hOn.contMDiffAt (F.open_target.mem_nhds hy)
  · have hyK : y ∉ F '' K := by
      rintro ⟨z, hz, rfl⟩
      exact hy (F.map_source (hSource hz))
    apply contMDiffAt_const.congr_of_eventuallyEq
    filter_upwards [hClosed.isOpen_compl.mem_nhds hyK] with p hp
    exact exactFacePush_eq_zero_off_image F hSupp hp

/-- The transition ends strictly inside the native outer faces. -/
theorem exactFaceCutoff_support_slab {wL wR : ℝ} (hL : 0 < wL) (hR : 0 < wR)
    (z : ExactFaceTube) (hz : exactFaceCutoff wL wR z.2 ≠ 0) :
    z ∈ exactFaceSlab ((3 / 4) * wL) ((3 / 4) * wR) := by
  refine ⟨trivial, ?_, ?_⟩
  · by_contra! h
    exact hz (exactFaceCutoff_eq_zero hL hR (Or.inl h.le))
  · by_contra! h
    exact hz (exactFaceCutoff_eq_zero hL hR (Or.inr h.le))

theorem exactFaceSlab_mono {wL wR WL WR : ℝ} (hL : wL ≤ WL) (hR : wR ≤ WR) :
    exactFaceSlab wL wR ⊆ exactFaceSlab WL WR := by
  intro z hz
  exact ⟨trivial, (neg_le_neg hL).trans hz.2.1, hz.2.2.trans hR⟩

/-- The physical cutoff, with the same two normalized Gaussian widths. -/
def exactFacePhysicalCutoff (F : PartialDiffeomorph J I ExactFaceTube M ∞)
    {wL wR : ℝ} (hL : 0 < wL) (hR : 0 < wR)
    (hS : exactFaceSlab wL wR ⊆ F.source) : C^∞⟮I, M; ℝ⟯ :=
  ⟨exactFacePush F (fun z => exactFaceCutoff wL wR z.2),
    contMDiff_exactFacePush F (isCompact_exactFaceSlab _ _) hS
      ((contDiff_exactFaceCutoff wL wR).contMDiff.comp contMDiff_snd)
      (fun z hz => exactFaceSlab_mono (by linarith) (by linarith)
        (exactFaceCutoff_support_slab hL hR z hz))⟩

omit [FiniteDimensional ℝ E] [IsManifold I ∞ M] in
theorem exactFacePhysicalCutoff_mem_Icc (F : PartialDiffeomorph J I ExactFaceTube M ∞)
    {wL wR : ℝ} (hL : 0 < wL) (hR : 0 < wR)
    (hS : exactFaceSlab wL wR ⊆ F.source) (y : M) :
    exactFacePhysicalCutoff F hL hR hS y ∈ Icc (0 : ℝ) 1 := by
  classical
  change exactFacePush F (fun z => exactFaceCutoff wL wR z.2) y ∈ _
  rw [exactFacePush]
  by_cases hy : y ∈ F.target
  · rw [piecewise_eq_of_mem _ _ _ hy]
    exact exactFaceCutoff_mem_Icc _ _ _
  · rw [piecewise_eq_of_notMem _ _ _ hy]
    exact ⟨le_rfl, zero_le_one⟩

omit [FiniteDimensional ℝ E] [IsManifold I ∞ M] in
theorem exactFacePhysicalCutoff_apply_chart (F : PartialDiffeomorph J I ExactFaceTube M ∞)
    {wL wR : ℝ} (hL : 0 < wL) (hR : 0 < wR)
    (hS : exactFaceSlab wL wR ⊆ F.source) {z : ExactFaceTube} (hz : z ∈ F.source) :
    exactFacePhysicalCutoff F hL hR hS (F z) = exactFaceCutoff wL wR z.2 :=
  exactFacePush_apply_chart F _ hz

omit [FiniteDimensional ℝ E] [IsManifold I ∞ M] in
theorem exactFacePhysicalCutoff_eq_zero_off (F : PartialDiffeomorph J I ExactFaceTube M ∞)
    {wL wR : ℝ} (hL : 0 < wL) (hR : 0 < wR)
    (hS : exactFaceSlab wL wR ⊆ F.source) {y : M}
    (hy : y ∉ F '' exactFaceSlab ((3 / 4) * wL) ((3 / 4) * wR)) :
    exactFacePhysicalCutoff F hL hR hS y = 0 :=
  exactFacePush_eq_zero_off_image F (exactFaceCutoff_support_slab hL hR) hy


omit [FiniteDimensional ℝ E] [IsManifold I ∞ M] [T2Space M] in
private theorem exactFaceExposure_slab_subset
    {F : PartialDiffeomorph J I ExactFaceTube M ∞} {wL wR : ℝ} (hL : 0 < wL) (hR : 0 < wR)
    (hS : exactFaceSlab wL wR ⊆ F.source) :
    exactFaceSlab (wL / 4) (wR / 4) ⊆ F.source :=
  (exactFaceSlab_mono (by linarith) (by linarith)).trans hS

/-- Convex interpolation of the normalized source metric and the round reference. -/
def exactFaceNormalizedPath (F : PartialDiffeomorph J I ExactFaceTube M ∞)
    (g R : SmoothRiemannianMetric I M) (u : C^∞⟮I, M; ℝ⟯)
    {wL wR : ℝ} (hL : 0 < wL) (hR : 0 < wR)
    (hS : exactFaceSlab wL wR ⊆ F.source)
    (s : Icc (0 : ℝ) 1) : SmoothRiemannianMetric I M :=
  let χ := exactFacePhysicalCutoff F hL hR hS
  let χs := fun y => (s : ℝ) * χ y
  let hχs := contMDiff_const.mul χ.contMDiff
  let hχs01 (y : M) : χs y ∈ Icc (0 : ℝ) 1 := by
    have hχy := exactFacePhysicalCutoff_mem_Icc F hL hR hS y
    exact ⟨mul_nonneg s.2.1 hχy.1,
      (mul_le_mul_of_nonneg_right s.2.2 hχy.1).trans (by simpa using hχy.2)⟩
  R.convexComb (conformalMetric g u u.contMDiff) χs hχs hχs01

/-- The scalar factor restores the original source at time zero and exposes
the exact product near the middle at time one. -/
def exactFacePhysicalExposure (F : PartialDiffeomorph J I ExactFaceTube M ∞)
    (u : C^∞⟮I, M; ℝ⟯) {wL wR : ℝ} (hL : 0 < wL) (hR : 0 < wR)
    (hS : exactFaceSlab wL wR ⊆ F.source) (s : ℝ) : C^∞⟮I, M; ℝ⟯ :=
  let ζ := exactFacePhysicalCutoff F (div_pos hL (by norm_num : (0 : ℝ) < 4))
    (div_pos hR (by norm_num : (0 : ℝ) < 4)) (exactFaceExposure_slab_subset hL hR hS)
  ⟨fun y => (s * ζ y - 1) * u y,
    (((contMDiff_const.mul ζ.contMDiff).sub contMDiff_const).mul u.contMDiff)⟩

/-- The actual smooth positive metric at each interpolation parameter. -/
def exactFacePhysicalPath (F : PartialDiffeomorph J I ExactFaceTube M ∞)
    (g R : SmoothRiemannianMetric I M) (u : C^∞⟮I, M; ℝ⟯)
    {wL wR : ℝ} (hL : 0 < wL) (hR : 0 < wR)
    (hS : exactFaceSlab wL wR ⊆ F.source)
    (s : Icc (0 : ℝ) 1) : SmoothRiemannianMetric I M :=
  let U := exactFacePhysicalExposure F u hL hR hS s
  conformalMetric (exactFaceNormalizedPath F g R u hL hR hS s) U U.contMDiff

set_option backward.isDefEq.respectTransparency false in
theorem exactFacePhysicalPath_inner (F : PartialDiffeomorph J I ExactFaceTube M ∞)
    (g R : SmoothRiemannianMetric I M) (u : C^∞⟮I, M; ℝ⟯)
    {wL wR : ℝ} (hL : 0 < wL) (hR : 0 < wR)
    (hS : exactFaceSlab wL wR ⊆ F.source)
    (s : Icc (0 : ℝ) 1) (y : M) (v w : TangentSpace I y) :
    let χ := exactFacePhysicalCutoff F hL hR hS
    let ζ := exactFacePhysicalCutoff F (div_pos hL (by norm_num : (0 : ℝ) < 4)) (div_pos hR (by norm_num : (0 : ℝ) < 4))
      (exactFaceExposure_slab_subset hL hR hS)
    (exactFacePhysicalPath F g R u hL hR hS s).inner y v w =
      Real.exp (2 * (((s : ℝ) * ζ y - 1) * u y)) *
        ((s : ℝ) * χ y * R.inner y v w +
          (1 - (s : ℝ) * χ y) * (Real.exp (2 * u y) * g.inner y v w)) := by
  unfold exactFacePhysicalPath exactFaceNormalizedPath
  dsimp only
  rw [Geometry.conformalMetric_inner, convexComb_inner, Geometry.conformalMetric_inner]
  rfl

/-- The coefficients of the actual physical path in smooth spatial
sections have a jointly smooth extension to a real parameter, including
both parameter endpoints. -/
theorem exactFacePhysicalPath_joint_coefficient
    (F : PartialDiffeomorph J I ExactFaceTube M ∞)
    (g R : SmoothRiemannianMetric I M) (u : C^∞⟮I, M; ℝ⟯)
    {wL wR : ℝ} (hL : 0 < wL) (hR : 0 < wR)
    (hS : exactFaceSlab wL wR ⊆ F.source)
    (v w : ∀ y : M, TangentSpace I y)
    (hg : ContMDiff I 𝓘(ℝ) ∞ (fun y => g.inner y (v y) (w y)))
    (hR' : ContMDiff I 𝓘(ℝ) ∞ (fun y => R.inner y (v y) (w y))) :
    ∃ f : ℝ × M → ℝ, ContMDiff (𝓘(ℝ).prod I) 𝓘(ℝ) ∞ f ∧
      ∀ (s : Icc (0 : ℝ) 1) y,
        f ((s : ℝ), y) = (exactFacePhysicalPath F g R u hL hR hS s).inner y (v y) (w y) := by
  let χ := exactFacePhysicalCutoff F hL hR hS
  let ζ := exactFacePhysicalCutoff F (div_pos hL (by norm_num : (0 : ℝ) < 4))
    (div_pos hR (by norm_num : (0 : ℝ) < 4)) (exactFaceExposure_slab_subset hL hR hS)
  let f := fun p : ℝ × M =>
    Real.exp (2 * ((p.1 * ζ p.2 - 1) * u p.2)) *
      (p.1 * χ p.2 * R.inner p.2 (v p.2) (w p.2) +
        (1 - p.1 * χ p.2) * (Real.exp (2 * u p.2) * g.inner p.2 (v p.2) (w p.2)))
  refine ⟨f, ?_, fun s y => (exactFacePhysicalPath_inner F g R u hL hR hS s y (v y) (w y)).symm⟩
  have hsnd : ContMDiff (𝓘(ℝ).prod I) I ∞ (Prod.snd : ℝ × M → M) := contMDiff_snd
  have hfst : ContMDiff (𝓘(ℝ).prod I) 𝓘(ℝ) ∞ (Prod.fst : ℝ × M → ℝ) := contMDiff_fst
  have hχ := χ.contMDiff.comp hsnd
  have hζ := ζ.contMDiff.comp hsnd
  have hu := u.contMDiff.comp hsnd
  have hgs := hg.comp hsnd
  have hRs := hR'.comp hsnd
  have hExp : ContMDiff (𝓘(ℝ).prod I) 𝓘(ℝ) ∞
      (fun p : ℝ × M => Real.exp (2 * ((p.1 * ζ p.2 - 1) * u p.2))) :=
    Real.contDiff_exp.contMDiff.comp (contMDiff_const.mul
      (((hfst.mul hζ).sub contMDiff_const).mul hu))
  have hExpG : ContMDiff (𝓘(ℝ).prod I) 𝓘(ℝ) ∞
      (fun p : ℝ × M => Real.exp (2 * u p.2) * g.inner p.2 (v p.2) (w p.2)) :=
    (Real.contDiff_exp.contMDiff.comp (contMDiff_const.mul hu)).mul hgs
  exact hExp.mul (((hfst.mul hχ).mul hRs).add
    ((contMDiff_const.sub (hfst.mul hχ)).mul hExpG))

private theorem exactFace_exp_cancel (a b : ℝ) :
    Real.exp (2 * (-1 * a)) * (Real.exp (2 * a) * b) = b := by
  rw [← mul_assoc, ← Real.exp_add, show 2 * (-1 * a) + 2 * a = 0 by ring,
    Real.exp_zero, one_mul]

theorem exactFacePhysicalPath_zero (F : PartialDiffeomorph J I ExactFaceTube M ∞)
    (g R : SmoothRiemannianMetric I M) (u : C^∞⟮I, M; ℝ⟯)
    {wL wR : ℝ} (hL : 0 < wL) (hR : 0 < wR)
    (hS : exactFaceSlab wL wR ⊆ F.source) :
    exactFacePhysicalPath F g R u hL hR hS ⟨0, le_rfl, zero_le_one⟩ = g := by
  apply SmoothRiemannianMetric.ext_inner
  intro y v w
  rw [exactFacePhysicalPath_inner]
  simp only [zero_mul, zero_sub, zero_add, sub_zero, one_mul]
  exact exactFace_exp_cancel _ _

theorem exactFacePhysicalPath_inner_eq_off (F : PartialDiffeomorph J I ExactFaceTube M ∞)
    (g R : SmoothRiemannianMetric I M) (u : C^∞⟮I, M; ℝ⟯)
    {wL wR : ℝ} (hL : 0 < wL) (hR : 0 < wR)
    (hS : exactFaceSlab wL wR ⊆ F.source)
    (s : Icc (0 : ℝ) 1) {y : M}
    (hy : y ∉ F '' exactFaceSlab ((3 / 4) * wL) ((3 / 4) * wR))
    (v w : TangentSpace I y) :
    (exactFacePhysicalPath F g R u hL hR hS s).inner y v w = g.inner y v w := by
  have hχ := exactFacePhysicalCutoff_eq_zero_off F hL hR hS hy
  have hy' : y ∉ F '' exactFaceSlab ((3 / 4) * (wL / 4)) ((3 / 4) * (wR / 4)) :=
    fun h => hy (image_mono (exactFaceSlab_mono (by linarith) (by linarith)) h)
  have hζ := exactFacePhysicalCutoff_eq_zero_off F (div_pos hL (by norm_num : (0 : ℝ) < 4)) (div_pos hR (by norm_num : (0 : ℝ) < 4))
    (exactFaceExposure_slab_subset hL hR hS) hy'
  rw [exactFacePhysicalPath_inner, hχ, hζ]
  simp only [mul_zero, zero_mul, zero_sub, zero_add, sub_zero, one_mul]
  exact exactFace_exp_cancel _ _

/-- Equality on an open set containing both native outer faces and their exterior. -/
theorem exactFacePhysicalPath_outer_germ (F : PartialDiffeomorph J I ExactFaceTube M ∞)
    (g R : SmoothRiemannianMetric I M) (u : C^∞⟮I, M; ℝ⟯)
    {wL wR : ℝ} (hL : 0 < wL) (hR : 0 < wR)
    (hS : exactFaceSlab wL wR ⊆ F.source)
    (s : Icc (0 : ℝ) 1) {y : M}
    (hy : y ∉ F '' exactFaceSlab ((3 / 4) * wL) ((3 / 4) * wR)) :
    ∀ᶠ p in 𝓝 y, ∀ v w : TangentSpace I p,
      (exactFacePhysicalPath F g R u hL hR hS s).inner p v w = g.inner p v w := by
  have hSmall : exactFaceSlab ((3 / 4) * wL) ((3 / 4) * wR) ⊆ F.source :=
    (exactFaceSlab_mono (by linarith) (by linarith)).trans hS
  have hClosed : IsClosed (F '' exactFaceSlab ((3 / 4) * wL) ((3 / 4) * wR)) :=
    ((isCompact_exactFaceSlab _ _).image_of_continuousOn
      (F.contMDiffOn_toFun.continuousOn.mono hSmall)).isClosed
  filter_upwards [hClosed.isOpen_compl.mem_nhds hy] with p hp
  exact exactFacePhysicalPath_inner_eq_off F g R u hL hR hS s hp

theorem exactFacePhysicalPath_one_inner (F : PartialDiffeomorph J I ExactFaceTube M ∞)
    (g R : SmoothRiemannianMetric I M) (u : C^∞⟮I, M; ℝ⟯)
    {wL wR : ℝ} (hL : 0 < wL) (hR : 0 < wR)
    (hS : exactFaceSlab wL wR ⊆ F.source)
    {z : ExactFaceTube} (hz : z ∈ exactFaceSlab (wL / 16) (wR / 16))
    (v w : TangentSpace I (F z)) :
    (exactFacePhysicalPath F g R u hL hR hS ⟨1, zero_le_one, le_rfl⟩).inner (F z) v w =
      R.inner (F z) v w := by
  have hzF := hS (exactFaceSlab_mono (by linarith) (by linarith) hz)
  have hχ := exactFacePhysicalCutoff_apply_chart F hL hR hS hzF
  have hζ := exactFacePhysicalCutoff_apply_chart F (div_pos hL (by norm_num : (0 : ℝ) < 4)) (div_pos hR (by norm_num : (0 : ℝ) < 4))
    (exactFaceExposure_slab_subset hL hR hS) hzF
  rw [exactFaceCutoff_eq_one hL hR (by linarith [hz.2.1]) (by linarith [hz.2.2])] at hχ
  rw [exactFaceCutoff_eq_one (div_pos hL (by norm_num : (0 : ℝ) < 4)) (div_pos hR (by norm_num : (0 : ℝ) < 4))
    (by linarith [hz.2.1]) (by linarith [hz.2.2])] at hζ
  rw [exactFacePhysicalPath_inner, hχ, hζ]
  simp

section CompactExtension

variable [SigmaCompactSpace M]

/-- Extend the actual round product from one fixed compact reference slab
and use the same extension at every pair of smaller widths. -/
theorem exists_exactFaceReference (F : PartialDiffeomorph J I ExactFaceTube M ∞)
    (g : SmoothRiemannianMetric I M) {WL WR : ℝ}
    (hS : exactFaceSlab WL WR ⊆ F.source) :
    ∃ R : SmoothRiemannianMetric I M,
      ∀ z ∈ exactFaceSlab WL WR, ∀ a b : TangentSpace J z,
      R.inner (F z) (mfderiv J I (F : ExactFaceTube → M) z a)
        (mfderiv J I (F : ExactFaceTube → M) z b) =
      exactFaceRoundCylinder.inner z a b := by
  obtain ⟨R, U, hU, _, hR, _⟩ :=
    F.exists_metric_preserving_on_neighborhood_of_is_compact exactFaceRoundCylinder g
      (isCompact_exactFaceSlab WL WR) hS
  exact ⟨R, fun z hz a b => (hR z (hU hz) a b).symm⟩

/-- At every allowed pair of widths the constructed source metric path
starts at the source and has the literal unit round product on the
same angular marking in an open central neighborhood. -/
theorem exists_exactFacePhysicalPath (F : PartialDiffeomorph J I ExactFaceTube M ∞)
    (g : SmoothRiemannianMetric I M) (u : C^∞⟮I, M; ℝ⟯)
    {WL WR : ℝ} (hS : exactFaceSlab WL WR ⊆ F.source) :
    ∃ R : SmoothRiemannianMetric I M,
      ∀ {wL wR : ℝ} (hL : 0 < wL) (hR : 0 < wR) (hwL : wL ≤ WL) (hwR : wR ≤ WR),
      let hSmall : exactFaceSlab wL wR ⊆ F.source := (exactFaceSlab_mono hwL hwR).trans hS
      let P := exactFacePhysicalPath F g R u hL hR hSmall
      P ⟨0, le_rfl, zero_le_one⟩ = g ∧
      (∀ (s : Icc (0 : ℝ) 1) (y : M),
        y ∉ F '' exactFaceSlab ((3 / 4) * wL) ((3 / 4) * wR) →
        ∀ᶠ p in 𝓝 y, ∀ v w : TangentSpace I p, (P s).inner p v w = g.inner p v w) ∧
      (∀ z ∈ exactFaceSlab (wL / 16) (wR / 16), ∀ a b : TangentSpace J z,
        (P ⟨1, zero_le_one, le_rfl⟩).inner (F z)
          (mfderiv J I (F : ExactFaceTube → M) z a)
          (mfderiv J I (F : ExactFaceTube → M) z b) =
        exactFaceRoundCylinder.inner z a b) := by
  obtain ⟨R, hR⟩ := exists_exactFaceReference F g hS
  refine ⟨R, fun hL hR' hwL hwR => ?_⟩
  intro hSmall P
  refine ⟨exactFacePhysicalPath_zero F g R u hL hR' hSmall,
    fun s y hy => exactFacePhysicalPath_outer_germ F g R u hL hR' hSmall s hy,
    fun z hz a b => ?_⟩
  rw [exactFacePhysicalPath_one_inner F g R u hL hR' hSmall hz]
  exact hR z (exactFaceSlab_mono (by linarith) (by linarith) hz) a b


end CompactExtension

/-- The normalization exponent in the original signed Gaussian chart.
Here H is the trace of the second fundamental form with left-to-right
normal, so the linear term prescribes minus its average. -/
def exactFaceNormalizingExponent (F₀ : PartialDiffeomorph J I ExactFaceTube M ∞)
    (v H : C^∞⟮𝓡 3, ExactFaceSphere; ℝ⟯)
    {wL wR : ℝ} (hL : 0 < wL) (hR : 0 < wR)
    (hS : exactFaceSlab wL wR ⊆ F₀.source) : C^∞⟮I, M; ℝ⟯ :=
  ⟨exactFacePush F₀ (fun z => exactFaceCutoff wL wR z.2 * (v z.1 - z.2 * H z.1 / 3)),
    contMDiff_exactFacePush F₀ (isCompact_exactFaceSlab _ _) hS
      (((contDiff_exactFaceCutoff wL wR).contMDiff.comp contMDiff_snd).mul
        ((v.contMDiff.comp contMDiff_fst).sub
          ((contMDiff_snd.mul (H.contMDiff.comp contMDiff_fst)).div_const 3)))
      (fun z hz => exactFaceSlab_mono (by linarith) (by linarith)
        (exactFaceCutoff_support_slab hL hR z
          (fun h => hz (by rw [h, zero_mul]))))⟩

omit [FiniteDimensional ℝ E] [IsManifold I ∞ M] in
theorem exactFaceNormalizingExponent_germ (F₀ : PartialDiffeomorph J I ExactFaceTube M ∞)
    (v H : C^∞⟮𝓡 3, ExactFaceSphere; ℝ⟯)
    {wL wR : ℝ} (hL : 0 < wL) (hR : 0 < wR)
    (hS : exactFaceSlab wL wR ⊆ F₀.source) (x : ExactFaceSphere) :
    (fun t : ℝ => exactFaceNormalizingExponent F₀ v H hL hR hS (F₀ (x, t)))
      =ᶠ[𝓝 0] (fun t => v x - t * H x / 3) := by
  have hL' : -(wL / 4) < 0 := by linarith
  have hR' : 0 < wR / 4 := by linarith
  filter_upwards [Ioo_mem_nhds hL' hR'] with t ht
  have hz : (x,t) ∈ F₀.source := hS ⟨trivial,
    by linarith [ht.1], by linarith [ht.2]⟩
  change exactFacePush F₀ (fun z => exactFaceCutoff wL wR z.2 * (v z.1 - z.2 * H z.1 / 3))
    (F₀ (x,t)) = _
  rw [exactFacePush_apply_chart F₀ _ hz, exactFaceCutoff_eq_one hL hR ht.1.le ht.2.le, one_mul]

omit [FiniteDimensional ℝ E] [IsManifold I ∞ M] in
/-- The actual extended exponent has the required value and signed normal
derivative in the original Gaussian marking. -/
theorem exactFaceNormalizingExponent_face_jet (F₀ : PartialDiffeomorph J I ExactFaceTube M ∞)
    (v H : C^∞⟮𝓡 3, ExactFaceSphere; ℝ⟯)
    {wL wR : ℝ} (hL : 0 < wL) (hR : 0 < wR)
    (hS : exactFaceSlab wL wR ⊆ F₀.source) (x : ExactFaceSphere) :
    exactFaceNormalizingExponent F₀ v H hL hR hS (F₀ (x, 0)) = v x ∧
    HasDerivAt (fun t => exactFaceNormalizingExponent F₀ v H hL hR hS (F₀ (x, t)))
      (-(H x / 3)) 0 := by
  have hGerm := exactFaceNormalizingExponent_germ F₀ v H hL hR hS x
  refine ⟨by simpa using hGerm.self_of_nhds, ?_⟩
  have hLin : HasDerivAt (fun t : ℝ => v x - t * H x / 3) (-(H x / 3)) 0 := by
    convert (hasDerivAt_const (0 : ℝ) (v x)).sub
      (((hasDerivAt_id (0 : ℝ)).mul_const (H x)).div_const 3) using 1
    · rfl
    · ring
  exact hLin.congr_of_eventuallyEq hGerm

omit [FiniteDimensional ℝ E] in
/-- Face matching for the tangential slots of the conformally normalized
physical metric, in the unchanged angular marking. -/
theorem exactFaceNormalizedMetric_tangent_inner
    (F₀ : PartialDiffeomorph J I ExactFaceTube M ∞) (g : SmoothRiemannianMetric I M)
    (v H : C^∞⟮𝓡 3, ExactFaceSphere; ℝ⟯)
    {wL wR : ℝ} (hL : 0 < wL) (hR : 0 < wR)
    (hS : exactFaceSlab wL wR ⊆ F₀.source) (x : ExactFaceSphere)
    (a b : TangentSpace (𝓡 3) x)
    (hFace : g.inner (F₀ (x, 0))
      (mfderiv J I (F₀ : ExactFaceTube → M) (x, 0) (a, 0))
      (mfderiv J I (F₀ : ExactFaceTube → M) (x, 0) (b, 0)) =
      Real.exp (-2 * v x) * (roundMetric (E := EuclideanSpace ℝ (Fin 4)) (n := 3)).inner x a b) :
    let u := exactFaceNormalizingExponent F₀ v H hL hR hS
    (conformalMetric g u u.contMDiff).inner (F₀ (x, 0))
      (mfderiv J I (F₀ : ExactFaceTube → M) (x, 0) (a, 0))
      (mfderiv J I (F₀ : ExactFaceTube → M) (x, 0) (b, 0)) =
      (roundMetric (E := EuclideanSpace ℝ (Fin 4)) (n := 3)).inner x a b := by
  intro u
  rw [Geometry.conformalMetric_inner, (exactFaceNormalizingExponent_face_jet F₀ v H hL hR hS x).1,
    hFace, ← mul_assoc, ← Real.exp_add, show 2 * v x + -2 * v x = 0 by ring,
    Real.exp_zero, one_mul]


omit [FiniteDimensional ℝ E] in
/-- The normalized tangential coefficients have zero first normal jet in
the original Gaussian chart. The hypothesis is the umbilic relation
h' = 2(H/3)h in that chart, with left-to-right normal. -/
theorem exactFaceNormalizedMetric_first_tangential_jet
    (F₀ : PartialDiffeomorph J I ExactFaceTube M ∞) (g : SmoothRiemannianMetric I M)
    (v H : C^∞⟮𝓡 3, ExactFaceSphere; ℝ⟯)
    {wL wR : ℝ} (hL : 0 < wL) (hR : 0 < wR)
    (hS : exactFaceSlab wL wR ⊆ F₀.source) (x : ExactFaceSphere)
    (a b : TangentSpace (𝓡 3) x) :
    let coeff (q : SmoothRiemannianMetric I M) (t : ℝ) :=
      q.inner (F₀ (x, t))
        (mfderiv J I (F₀ : ExactFaceTube → M) (x, t) (a, 0))
        (mfderiv J I (F₀ : ExactFaceTube → M) (x, t) (b, 0))
    let u := exactFaceNormalizingExponent F₀ v H hL hR hS
    HasDerivAt (coeff g) (2 * (H x / 3) * coeff g 0) 0 →
    HasDerivAt (coeff (conformalMetric g u u.contMDiff)) 0 0 := by
  intro coeff u hDeriv
  let uLine := fun t : ℝ => u (F₀ (x, t))
  have hu : HasDerivAt uLine (-(H x / 3)) 0 :=
    (exactFaceNormalizingExponent_face_jet F₀ v H hL hR hS x).2
  have hExp := ((hu.const_mul 2).exp).mul hDeriv
  convert hExp using 1
  · funext t
    exact Geometry.conformalMetric_inner _ _ _ _ _ _
  · ring

set_option backward.isDefEq.respectTransparency false in
/-- In the fixed marking the actual pulled-back normalized metric has
the stated affine deviation, for every pair of slots (including normal
and mixed slots). -/
theorem exactFaceNormalizedPath_pullback_sub_round
    (F : PartialDiffeomorph J I ExactFaceTube M ∞)
    (g R : SmoothRiemannianMetric I M) (u : C^∞⟮I, M; ℝ⟯)
    {wL wR : ℝ} (hL : 0 < wL) (hR : 0 < wR)
    (hS : exactFaceSlab wL wR ⊆ F.source) (s : Icc (0 : ℝ) 1)
    (z : ExactFaceTube) (hz : z ∈ exactFaceSlab wL wR) (a b : TangentSpace J z) :
    let dF := mfderiv J I (F : ExactFaceTube → M) z
    let q := exactFaceRoundCylinder.inner z a b
    let D := (conformalMetric g u u.contMDiff).inner (F z) (dF a) (dF b) - q
    R.inner (F z) (dF a) (dF b) = q →
    (exactFaceNormalizedPath F g R u hL hR hS s).inner (F z) (dF a) (dF b) - q =
      (1 - (s : ℝ) * exactFaceCutoff wL wR z.2) * D := by
  intro dF q D hRz
  unfold exactFaceNormalizedPath
  dsimp only
  rw [convexComb_inner, exactFacePhysicalCutoff_apply_chart F hL hR hS (hS hz), hRz]
  dsimp only [D, smul_eq_mul]
  ring

/-- The scalar coefficient of the normalized path relative to the round
product, before the conformal exposure factor. In the actual tube the
defect is the corresponding coefficient of the normalized source minus
the round reference. -/
def exactFaceJetSplice (s wL wR : ℝ) (D : ℝ → ℝ) (t : ℝ) : ℝ :=
  (1 - s * exactFaceCutoff wL wR t) * D t

/-- The first two signed normal derivatives of one actual Gaussian coefficient
of the interpolation, with all three product-rule terms in the second jet. -/
theorem exactFaceJetSplice_derivs (s wL wR : ℝ) {D : ℝ → ℝ}
    (hD : ContDiff ℝ ∞ D) (t : ℝ) :
    let χ := exactFaceCutoff wL wR
    deriv (exactFaceJetSplice s wL wR D) t =
      (1 - s * χ t) * deriv D t - s * deriv χ t * D t ∧
    deriv (deriv (exactFaceJetSplice s wL wR D)) t =
      (1 - s * χ t) * deriv (deriv D) t -
        2 * s * deriv χ t * deriv D t - s * deriv (deriv χ) t * D t := by
  intro χ
  have hχ := contDiff_exactFaceCutoff wL wR
  have hDiff (f : ℝ → ℝ) (hf : ContDiff ℝ ∞ f) (x : ℝ) :=
    (hf.differentiable (by simp) x)
  have hχ' : ContDiff ℝ ∞ (deriv χ) := (contDiff_succ_iff_deriv.mp (by simpa using hχ)).2.2
  have hD' : ContDiff ℝ ∞ (deriv D) := (contDiff_succ_iff_deriv.mp (by simpa using hD)).2.2
  have hB : ContDiff ℝ ∞ (fun x => 1 - s * χ x) :=
    contDiff_const.sub (contDiff_const.mul hχ)
  have hB' (x : ℝ) : deriv (fun x => 1 - s * χ x) x = -(s * deriv χ x) := by
    rw [deriv_fun_sub (differentiableAt_const _) (hDiff _ (contDiff_const.mul hχ) x),
      deriv_const, deriv_const_mul_field, zero_sub]
  have hSplice' (x : ℝ) : deriv (exactFaceJetSplice s wL wR D) x =
      (1 - s * χ x) * deriv D x - s * deriv χ x * D x := by
    unfold exactFaceJetSplice
    rw [deriv_fun_mul (hDiff _ hB x) (hDiff _ hD x), hB']
    ring
  refine ⟨hSplice' t, ?_⟩
  rw [funext hSplice']
  have hP := hB.mul hD'
  have hQ' : ContDiff ℝ ∞ (fun x => s * deriv χ x) := contDiff_const.mul hχ'
  have hQ := hQ'.mul hD
  rw [deriv_fun_sub (hDiff _ hP t) (hDiff _ hQ t),
    deriv_fun_mul (hDiff _ hB t) (hDiff _ hD' t), hB',
    deriv_fun_mul (hDiff _ hQ' t) (hDiff _ hD t),
    deriv_const_mul_field]
  ring


private theorem exactFaceScaledProfile_derivs (a t : ℝ) :
    deriv (fun x => exactFaceProfile (a * x)) t = a * deriv exactFaceProfile (a * t) ∧
    deriv (deriv (fun x => exactFaceProfile (a * x))) t =
      a ^ 2 * deriv (deriv exactFaceProfile) (a * t) := by
  have hLinear : Differentiable ℝ (fun x : ℝ => a * x) :=
    ((contDiff_const.mul contDiff_id : ContDiff ℝ ∞ (fun x : ℝ => a * x))).differentiable (by simp)
  have hDiff := contDiff_exactFaceProfile.differentiable (by simp)
  have hDiff' := ((contDiff_succ_iff_deriv.mp (by simpa using contDiff_exactFaceProfile)).2.2 :
    ContDiff ℝ ∞ (deriv exactFaceProfile)).differentiable (by simp)
  have hFirst (x : ℝ) : deriv (fun z => exactFaceProfile (a * z)) x =
      a * deriv exactFaceProfile (a * x) := by
    change deriv (exactFaceProfile ∘ fun z => a * z) x = _
    rw [deriv_comp x (hDiff _) (hLinear _), deriv_const_mul_id, mul_comm]
  refine ⟨hFirst t, ?_⟩
  rw [funext hFirst, deriv_const_mul_field]
  change a * deriv (deriv exactFaceProfile ∘ fun z => a * z) t = _
  rw [deriv_comp t (hDiff' _) (hLinear _), deriv_const_mul_id]
  ring

/-- Exact first and second derivatives on the signed left half, including the seam. -/
theorem exactFaceCutoff_derivs_left {wL wR t : ℝ} (hR : 0 < wR) (ht : t ≤ 0) :
    deriv (exactFaceCutoff wL wR) t = (-1 / wL) * deriv exactFaceProfile (-t / wL) ∧
    deriv (deriv (exactFaceCutoff wL wR)) t =
      (1 / wL ^ 2) * deriv (deriv exactFaceProfile) (-t / wL) := by
  have hEq : exactFaceCutoff wL wR =ᶠ[𝓝 t]
      (fun x => exactFaceProfile ((-1 / wL) * x)) := by
    filter_upwards [Iio_mem_nhds (show t < wR / 4 by linarith)] with x hx
    have hOne : exactFaceProfile (x / wR) = 1 :=
      exactFaceProfile_eq_one ((div_le_iff₀ hR).2 (by linarith [mem_Iio.mp hx]))
    rw [exactFaceCutoff, hOne, mul_one]
    congr 1
    ring
  obtain ⟨h₁, h₂⟩ := exactFaceScaledProfile_derivs (-1 / wL) t
  rw [hEq.deriv_eq, hEq.deriv.deriv_eq, h₁, h₂,
    show (-1 / wL) * t = -t / wL by ring, show (-1 / wL) ^ 2 = 1 / wL ^ 2 by ring]
  exact ⟨rfl, rfl⟩

/-- Exact first and second derivatives on the signed right half, including the seam. -/
theorem exactFaceCutoff_derivs_right {wL wR t : ℝ} (hL : 0 < wL) (ht : 0 ≤ t) :
    deriv (exactFaceCutoff wL wR) t = (1 / wR) * deriv exactFaceProfile (t / wR) ∧
    deriv (deriv (exactFaceCutoff wL wR)) t =
      (1 / wR ^ 2) * deriv (deriv exactFaceProfile) (t / wR) := by
  have hEq : exactFaceCutoff wL wR =ᶠ[𝓝 t]
      (fun x => exactFaceProfile ((1 / wR) * x)) := by
    filter_upwards [Ioi_mem_nhds (show -(wL / 4) < t by linarith)] with x hx
    have hOne : exactFaceProfile (-x / wL) = 1 :=
      exactFaceProfile_eq_one ((div_le_iff₀ hL).2 (by linarith [mem_Ioi.mp hx]))
    rw [exactFaceCutoff, hOne, one_mul]
    congr 1
    ring
  obtain ⟨h₁, h₂⟩ := exactFaceScaledProfile_derivs (1 / wR) t
  rw [hEq.deriv_eq, hEq.deriv.deriv_eq, h₁, h₂,
    show (1 / wR) * t = t / wR by ring, show (1 / wR) ^ 2 = 1 / wR ^ 2 by ring]
  exact ⟨rfl, rfl⟩

/-- One fixed pair of derivative constants works for arbitrary ratios of
the physical left and right widths. -/
theorem exists_exactFaceCutoff_deriv_bounds :
    ∃ L₁ L₂ : ℝ, 0 ≤ L₁ ∧ 0 ≤ L₂ ∧
      ∀ wL wR : ℝ, 0 < wL → 0 < wR → ∀ t : ℝ,
      (t ∈ Icc (-wL) 0 → |deriv (exactFaceCutoff wL wR) t| ≤ L₁ / wL ∧
        |deriv (deriv (exactFaceCutoff wL wR)) t| ≤ L₂ / wL ^ 2) ∧
      (t ∈ Icc 0 wR → |deriv (exactFaceCutoff wL wR) t| ≤ L₁ / wR ∧
        |deriv (deriv (exactFaceCutoff wL wR)) t| ≤ L₂ / wR ^ 2) := by
  have h₁ : ContDiff ℝ ∞ (deriv exactFaceProfile) :=
    (contDiff_succ_iff_deriv.mp (by simpa using contDiff_exactFaceProfile)).2.2
  have h₂ : ContDiff ℝ ∞ (deriv (deriv exactFaceProfile)) :=
    (contDiff_succ_iff_deriv.mp (by simpa using h₁)).2.2
  obtain ⟨a, ha⟩ : BddAbove ((fun r => |deriv exactFaceProfile r|) '' Icc (0 : ℝ) 1) :=
    isCompact_Icc.bddAbove_image h₁.continuous.abs.continuousOn
  obtain ⟨b, hb⟩ : BddAbove ((fun r => |deriv (deriv exactFaceProfile) r|) '' Icc (0 : ℝ) 1) :=
    isCompact_Icc.bddAbove_image h₂.continuous.abs.continuousOn
  refine ⟨max 0 a, max 0 b, le_max_left .., le_max_left .., fun wL wR hL hR t => ⟨?_, ?_⟩⟩
  · intro ht
    obtain ⟨hL₁, hL₂⟩ := exactFaceCutoff_derivs_left hR ht.2
    have hr : -t / wL ∈ Icc (0 : ℝ) 1 := by
      exact ⟨div_nonneg (neg_nonneg.mpr ht.2) hL.le,
        (div_le_one hL).2 (by simpa only [neg_neg] using neg_le_neg ht.1)⟩
    rw [hL₁, hL₂, abs_mul, abs_mul, abs_div, abs_div, abs_neg, abs_one,
      abs_of_pos hL, abs_of_nonneg (sq_nonneg wL), one_div, one_div, inv_mul_eq_div,
      inv_mul_eq_div]
    exact ⟨div_le_div_of_nonneg_right ((ha (mem_image_of_mem _ hr)).trans (le_max_right ..)) hL.le,
      div_le_div_of_nonneg_right ((hb (mem_image_of_mem _ hr)).trans (le_max_right ..)) (sq_nonneg wL)⟩
  · intro ht
    obtain ⟨hR₁, hR₂⟩ := exactFaceCutoff_derivs_right hL ht.1
    have hr : t / wR ∈ Icc (0 : ℝ) 1 :=
      ⟨div_nonneg ht.1 hR.le, (div_le_one hR).2 ht.2⟩
    rw [hR₁, hR₂, abs_mul, abs_mul, abs_div, abs_div, abs_one,
      abs_of_pos hR, abs_of_nonneg (sq_nonneg wR), one_div, one_div, inv_mul_eq_div,
      inv_mul_eq_div]
    exact ⟨div_le_div_of_nonneg_right ((ha (mem_image_of_mem _ hr)).trans (le_max_right ..)) hR.le,
      div_le_div_of_nonneg_right ((hb (mem_image_of_mem _ hr)).trans (le_max_right ..)) (sq_nonneg wR)⟩

/-- Taylor control for either actual normal half-interval, expressed on
a convex set so the same theorem applies on the separate native widths.
The value bound allows the coefficient one in front of the second jet. -/
theorem exactFaceDefect_taylor_bounds {D : ℝ → ℝ} (hD : ContDiff ℝ ∞ D)
    {S : Set ℝ} (hS : Convex ℝ S) (h0 : 0 ∈ S)
    {α β M : ℝ} (hα : |D 0| ≤ α) (hβ : |deriv D 0| ≤ β)
    (hM : ∀ x ∈ S, |deriv (deriv D) x| ≤ M)
    {w t : ℝ} (hSL : ∀ x ∈ S, |x| ≤ w) (ht : t ∈ S) :
    |D t| ≤ α + (β + M * w) * |t| ∧ |deriv D t| ≤ β + M * |t| := by
  have hD' : ContDiff ℝ ∞ (deriv D) :=
    (contDiff_succ_iff_deriv.mp (by simpa using hD)).2.2
  have hM₀ : 0 ≤ M := (abs_nonneg _).trans (hM 0 h0)
  have hDeriv (x : ℝ) (hx : x ∈ S) : |deriv D x| ≤ β + M * |x| := by
    have hDiff := hS.norm_image_sub_le_of_norm_deriv_le
      (fun y _ => hD'.differentiable (by simp) y)
      (fun y hy => by simpa only [Real.norm_eq_abs] using hM y hy) h0 hx
    simp only [Real.norm_eq_abs, sub_zero] at hDiff
    calc
      |deriv D x| = |(deriv D x - deriv D 0) + deriv D 0| := by rw [sub_add_cancel]
      _ ≤ |deriv D x - deriv D 0| + |deriv D 0| := abs_add_le _ _
      _ ≤ β + M * |x| := by linarith only [hDiff, hβ]
  refine ⟨?_, hDeriv t ht⟩
  have hDiff := hS.norm_image_sub_le_of_norm_deriv_le
    (fun y _ => hD.differentiable (by simp) y)
    (C := β + M * w) (fun y hy => by
      rw [Real.norm_eq_abs]
      exact (hDeriv y hy).trans (add_le_add_right (mul_le_mul_of_nonneg_left (hSL y hy) hM₀) _))
    h0 ht
  simp only [Real.norm_eq_abs, sub_zero] at hDiff
  calc
    |D t| = |(D t - D 0) + D 0| := by rw [sub_add_cancel]
    _ ≤ |D t - D 0| + |D 0| := abs_add_le _ _
    _ ≤ α + (β + M * w) * |t| := by linarith only [hDiff, hα]

/-- Once uniform strip constants for the actual path have been established
at the fixed source, every sufficiently small pair of positive subwidths
meets both tolerance allowances and the strict joined budget. -/
theorem exists_exactFace_subwidth_budgets {WL WR CL CR ε e T : ℝ}
    (hWL : 0 < WL) (hWR : 0 < WR) (hCL : 0 ≤ CL) (hCR : 0 ≤ CR)
    (hε : 0 < ε) (he : e < 2 * T) :
    ∃ dL dR : ℝ, 0 < dL ∧ 0 < dR ∧ dL ≤ WL ∧ dR ≤ WR ∧
      ∀ wL wR : ℝ, 0 < wL → 0 < wR → wL ≤ dL → wR ≤ dR →
        CL * wL < ε ∧ CR * wR < ε ∧ e + CL * wL + CR * wR < 2 * T := by
  let δ := min (ε / 2) ((2 * T - e) / 4)
  have hδ : 0 < δ := lt_min (by linarith) (by linarith)
  let dL := min WL (δ / (CL + 1))
  let dR := min WR (δ / (CR + 1))
  have hL₀ : 0 < CL + 1 := by linarith
  have hR₀ : 0 < CR + 1 := by linarith
  refine ⟨dL, dR, lt_min hWL (div_pos hδ hL₀), lt_min hWR (div_pos hδ hR₀),
    min_le_left .., min_le_left .., fun wL wR hwL hwR hL hR => ?_⟩
  have hLc := (le_div_iff₀ hL₀).mp (hL.trans (min_le_right ..))
  have hRc := (le_div_iff₀ hR₀).mp (hR.trans (min_le_right ..))
  have hδ₁ : δ ≤ ε / 2 := min_le_left ..
  have hδ₂ : δ ≤ (2 * T - e) / 4 := min_le_right ..
  exact ⟨by nlinarith only [hLc, hδ₁, hwL, hε],
    by nlinarith only [hRc, hδ₁, hwR, hε],
    by nlinarith only [hLc, hRc, hδ₂, hwL, hwR, he]⟩

end PhysicalMetric

section SignedEnergy

open DifferentialGeometry.Integral.Measure FirstOrderTwistor MeasureTheory SectionsAndConnections

variable {H M : Type*} [TopologicalSpace H]
  {I : ModelWithCorners ℝ (EuclideanSpace ℝ (Fin 4)) H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  [BoundarylessManifold I M] [CompactSpace M]

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

/-- The conformal exposure leaves the actual measure unchanged in either
chirality, throughout the path and on every physical region. -/
theorem exactFacePhysicalPath_chiralMeasure
    (F : PartialDiffeomorph J I ExactFaceTube M ∞)
    (g R : SmoothRiemannianMetric I M) (u : C^∞⟮I, M; ℝ⟯)
    {wL wR : ℝ} (hL : 0 < wL) (hR : 0 < wR)
    (hS : exactFaceSlab wL wR ⊆ F.source) (s : Icc (0 : ℝ) 1)
    (o : ManifoldOrientation I M 4) (sign : CollarChirality)
    (frame : ∀ y, OrientedOrthonormalFrameAt (exactFaceNormalizedPath F g R u hL hR hS s) o y) :
    let N := exactFaceNormalizedPath F g R u hL hR hS s
    let P := exactFacePhysicalPath F g R u hL hR hS s
    let U := exactFacePhysicalExposure F u hL hR hS s
    energyMeasure (riemannianVolumeMeasure I M P)
      (fun x => hilbertSchmidtSq (signedCollarWeylBlock o P
        (fun y => conformalOrientedFrameAt U (frame y)) sign x)) =
    energyMeasure (riemannianVolumeMeasure I M N)
      (fun x => hilbertSchmidtSq (signedCollarWeylBlock o N frame sign x)) :=
  signedChiralEnergyMeasure_conformalMetric _ _ o frame sign

variable [Nonempty M] {o : ManifoldOrientation I M 4}

omit [I.Boundaryless] [BoundarylessManifold I M] [Nonempty M] in
/-- Exactly the signed change on the physical strip is paid on the
complete side. The source and deformed energy each use their own volume. -/
theorem exactFacePhysicalPath_side_change (F : PartialDiffeomorph J I ExactFaceTube M ∞)
    (source deformed : SignedCollarMetric o) (R : SmoothRiemannianMetric I M)
    (u : C^∞⟮I, M; ℝ⟯) {wL wR : ℝ} (hL : 0 < wL) (hR : 0 < wR)
    (hS : exactFaceSlab wL wR ⊆ F.source) (s : Icc (0 : ℝ) 1)
    (hPath : deformed.metric = exactFacePhysicalPath F source.metric R u hL hR hS s)
    {P U : Set M} (hU : MeasurableSet U) (hUP : U ⊆ P)
    (hOutside : ∀ x ∈ P \ U, x ∉ F '' exactFaceSlab ((3 / 4) * wL) ((3 / 4) * wR))
    (hFrame : ∀ x ∈ P \ U, (source.frame x).basis = (deformed.frame x).basis)
    (hP : MeasurableSet P) (sign : CollarChirality) :
    deformed.charge sign P - source.charge sign P =
      deformed.charge sign U - source.charge sign U := by
  have hGerm (x : M) (hx : x ∈ P \ U) : ∀ᶠ y in 𝓝 x, ∀ v w : TangentSpace I y,
      source.metric.inner y v w = deformed.metric.inner y v w := by
    rw [hPath]
    exact (exactFacePhysicalPath_outer_germ F source.metric R u hL hR hS s
      (hOutside x hx)).mono fun y hy v w => (hy v w).symm
  have hFixed := selectedReference_charge_eq_of_germ source deformed (hP.diff hU) hGerm hFrame sign
  have hSplit (q : SignedCollarMetric o) :
      q.charge sign P = q.charge sign (P \ U) + q.charge sign U := by
    conv_lhs => rw [← sdiff_union_of_subset hUP]
    exact measureReal_union disjoint_sdiff_left hU
  rw [hSplit source, hSplit deformed, hFixed]
  ring

omit [I.Boundaryless] [BoundarylessManifold I M] [Nonempty M] in
/-- From estimates on two actual physical strips obtain both full-side
absolute drift bounds and the joined strict bound. The two complete
closed sides may meet on a common null seam. -/
theorem exactFacePhysicalPath_joined_bound (F : PartialDiffeomorph J I ExactFaceTube M ∞)
    (source deformed : SignedCollarMetric o) (R : SmoothRiemannianMetric I M)
    (u : C^∞⟮I, M; ℝ⟯) {wL wR : ℝ} (hL : 0 < wL) (hR : 0 < wR)
    (hS : exactFaceSlab wL wR ⊆ F.source) (s : Icc (0 : ℝ) 1)
    (hPath : deformed.metric = exactFacePhysicalPath F source.metric R u hL hR hS s)
    (P : Bool → Set M) (hP : ∀ j, MeasurableSet (P j)) (hCover : P false ∪ P true = univ)
    (sign : CollarChirality)
    (hSeam : ∀ q ∈ ({source, deformed} : Set (SignedCollarMetric o)),
      q.charge sign (P false ∩ P true) = 0)
    (C : Bool → ℝ)
    (hSide : ∀ j,
      let U := F '' (univ ×ˢ if j then Icc (0 : ℝ) wR else Icc (-wL) 0)
      MeasurableSet U ∧ U ⊆ P j ∧
      (∀ x ∈ P j \ U, x ∉ F '' exactFaceSlab ((3 / 4) * wL) ((3 / 4) * wR)) ∧
      (∀ x ∈ P j \ U, (source.frame x).basis = (deformed.frame x).basis) ∧
      source.charge sign U ≤ C j * (if j then wR else wL) ∧
      deformed.charge sign U ≤ C j * (if j then wR else wL))
    {T : ℝ} (hBudget : source.energy sign + C false * wL + C true * wR < 2 * T) :
    (∀ j, |deformed.charge sign (P j) - source.charge sign (P j)| ≤
      C j * (if j then wR else wL)) ∧ deformed.energy sign < 2 * T := by
  have hDrift (j : Bool) : |deformed.charge sign (P j) - source.charge sign (P j)| ≤
      C j * (if j then wR else wL) := by
    let U := F '' (univ ×ˢ if j then Icc (0 : ℝ) wR else Icc (-wL) 0)
    obtain ⟨hU, hUP, hOff, hFrames, hOld, hNew⟩ := hSide j
    rw [exactFacePhysicalPath_side_change F source deformed R u hL hR hS s hPath hU hUP
      hOff hFrames (hP j) sign]
    have hOld₀ : 0 ≤ source.charge sign U := measureReal_nonneg
    have hNew₀ : 0 ≤ deformed.charge sign U := measureReal_nonneg
    dsimp only [U] at hOld₀ hNew₀
    exact abs_le.mpr ⟨by linarith only [hOld, hNew₀], by linarith only [hNew, hOld₀]⟩
  have hWhole (q : SignedCollarMetric o)
      (hq : q ∈ ({source, deformed} : Set (SignedCollarMetric o))) :
      q.energy sign = q.charge sign (P false) + q.charge sign (P true) := by
    have heq := measureReal_union_add_inter (μ := q.chiralMeasure sign) (s := P false) (hP true)
    change q.charge sign (P false ∪ P true) + q.charge sign (P false ∩ P true) = _ at heq
    rw [hCover, hSeam q hq, add_zero, q.charge_univ] at heq
    exact heq
  have hLeft := (abs_le.mp (hDrift false)).2
  have hRight := (abs_le.mp (hDrift true)).2
  simp only [Bool.false_eq_true, ↓reduceIte] at hLeft
  simp only [↓reduceIte] at hRight
  refine ⟨hDrift, ?_⟩
  rw [hWhole source (by simp)] at hBudget
  rw [hWhole deformed (by simp)]
  linarith only [hLeft, hRight, hBudget]

end SignedEnergy

end

end SmoothPoincare
