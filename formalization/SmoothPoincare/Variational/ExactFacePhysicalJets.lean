import SmoothPoincare.Variational.ExactFacePhysicalInterpolation
import DifferentialGeometry.Topology.Manifold.PartialDiffeomorph
import DifferentialGeometry.Geometry.Metric.Pullback.Coefficients
import Mathlib.Analysis.Calculus.FDeriv.Mul
import Mathlib.Analysis.Calculus.MeanValue

/-! # Uniform two-jets in a buffered normalized face chart -/

open DifferentialGeometry DifferentialGeometry.Geometry
open Filter Manifold Set
open scoped ContDiff Manifold Topology

namespace SmoothPoincare
noncomputable section

variable {A : Type*} [NormedAddCommGroup A] [NormedSpace ℝ A]

/-- The coefficient multiplier of the normalized E44 splice. -/
def exactFaceJetWeight (s wL wR : ℝ) (t : ℝ) : ℝ :=
  1 - s * exactFaceCutoff wL wR t

/-- Apply the cutoff to an actual scalar coefficient of the metric defect. -/
def exactFaceCoordinateSplice (s wL wR : ℝ) (D : A × ℝ → ℝ) (z : A × ℝ) : ℝ :=
  exactFaceJetWeight s wL wR z.2 * D z

theorem contDiff_exactFaceJetWeight (s wL wR : ℝ) :
    ContDiff ℝ ∞ (exactFaceJetWeight s wL wR) :=
  contDiff_const.sub (contDiff_const.mul (contDiff_exactFaceCutoff _ _))

private theorem fderiv_normalComposition {f : ℝ → ℝ} (hf : ContDiff ℝ ∞ f) (z : A × ℝ) :
    fderiv ℝ (fun p : A × ℝ => f p.2) z =
      deriv f z.2 • ContinuousLinearMap.snd ℝ A ℝ := by
  have hn : HasFDerivAt (Prod.snd : A × ℝ → ℝ) (ContinuousLinearMap.snd ℝ A ℝ) z :=
    (ContinuousLinearMap.snd ℝ A ℝ).hasFDerivAt
  have hd := ((hf.differentiable (by simp) z.2).hasDerivAt.comp_hasFDerivAt z hn).fderiv
  exact hd

private theorem fderiv_fderiv_normalComposition {f : ℝ → ℝ}
    (hf : ContDiff ℝ ∞ f) (z v w : A × ℝ) :
    fderiv ℝ (fderiv ℝ (fun p : A × ℝ => f p.2)) z v w =
      deriv (deriv f) z.2 * v.2 * w.2 := by
  have h₁ : ContDiff ℝ ∞ (deriv f) :=
    (contDiff_succ_iff_deriv.mp (by simpa using hf)).2.2
  rw [show fderiv ℝ (fun p : A × ℝ => f p.2) =
    (fun p => deriv f p.2 • ContinuousLinearMap.snd ℝ A ℝ) from funext (fderiv_normalComposition hf)]
  have hd : DifferentiableAt ℝ (fun p : A × ℝ => deriv f p.2) z :=
    (h₁.comp contDiff_snd).differentiable (by simp) z
  rw [fderiv_smul_const hd (ContinuousLinearMap.snd ℝ A ℝ), fderiv_normalComposition h₁]
  rfl

private theorem contDiffOn_differentiableAt_infty {B : Type*}
    [NormedAddCommGroup B] [NormedSpace ℝ B]
    {f : A × ℝ → B} {U : Set (A × ℝ)} (hU : IsOpen U)
    (hf : ContDiffOn ℝ ∞ f U) {z : A × ℝ} (hz : z ∈ U) : DifferentiableAt ℝ f z :=
  (hf.contDiffAt (hU.mem_nhds hz)).differentiableAt (by simp)

/-- The full bilinear second differential of the physical affine splice.
For mixed slots one of the two first-order cutoff terms survives.
The first and second cutoff jets involve only the signed normal slot. -/
theorem exactFaceCoordinateSplice_two_jets
    {U : Set (A × ℝ)} (hU : IsOpen U) {D : A × ℝ → ℝ} (hD : ContDiffOn ℝ ∞ D U)
    (s wL wR : ℝ) {z : A × ℝ} (hz : z ∈ U) (v w : A × ℝ) :
    let θ := exactFaceJetWeight s wL wR
    let N := exactFaceCoordinateSplice s wL wR D
    fderiv ℝ N z v = θ z.2 * fderiv ℝ D z v + deriv θ z.2 * v.2 * D z ∧
    fderiv ℝ (fderiv ℝ N) z v w =
      θ z.2 * fderiv ℝ (fderiv ℝ D) z v w +
        deriv θ z.2 * v.2 * fderiv ℝ D z w +
        deriv θ z.2 * w.2 * fderiv ℝ D z v +
        deriv (deriv θ) z.2 * v.2 * w.2 * D z := by
  intro θ N
  let b : A × ℝ → ℝ := fun x => θ x.2
  have hθ : ContDiff ℝ ∞ θ := contDiff_exactFaceJetWeight s wL wR
  have hb : ContDiff ℝ ∞ b := hθ.comp contDiff_snd
  have hDiff {x : A × ℝ} (hx : x ∈ U) := contDiffOn_differentiableAt_infty hU hD hx
  have hFirst {x : A × ℝ} (hx : x ∈ U) :
      fderiv ℝ N x = b x • fderiv ℝ D x + D x • fderiv ℝ b x :=
    fderiv_fun_mul (hb.differentiable (by simp) x) (hDiff hx)
  have hCut1 (v : A × ℝ) : fderiv ℝ b z v = deriv θ z.2 * v.2 := by
    rw [fderiv_normalComposition hθ]
    rfl
  refine ⟨?_, ?_⟩
  · rw [hFirst hz]
    simp only [add_apply, smul_apply, smul_eq_mul, hCut1]
    change θ z.2 * fderiv ℝ D z v + D z * (deriv θ z.2 * v.2) = _
    ring
  have hFD : DifferentiableAt ℝ (fderiv ℝ D) z :=
    contDiffOn_differentiableAt_infty hU (hD.fderiv_of_isOpen hU (by simp)) hz
  have hFb : DifferentiableAt ℝ (fderiv ℝ b) z :=
    ((hb.fderiv_right (m := ∞) (by simp)).differentiable (by simp) z)
  have hbd := hb.differentiable (by simp) z
  have hEq : fderiv ℝ N =ᶠ[𝓝 z]
      (fun x => b x • fderiv ℝ D x + D x • fderiv ℝ b x) := by
    filter_upwards [hU.mem_nhds hz] with x hx using hFirst hx
  have hP : DifferentiableAt ℝ (fun x => b x • fderiv ℝ D x) z := hbd.smul hFD
  have hQ : DifferentiableAt ℝ (fun x => D x • fderiv ℝ b x) z := (hDiff hz).smul hFb
  rw [hEq.fderiv_eq, fderiv_fun_add hP hQ,
    fderiv_fun_smul hbd hFD, fderiv_fun_smul (hDiff hz) hFb]
  simp only [add_apply, smul_apply,
    ContinuousLinearMap.smulRight_apply, smul_eq_mul, hCut1]
  rw [fderiv_fderiv_normalComposition hθ]
  change θ z.2 * fderiv ℝ (fderiv ℝ D) z v w + _ + _ = _
  ring

/-- Vanishing value on the open face implies vanishing tangential derivative
there. Combined with the signed unit normal jet this gives the full first jet. -/
theorem fderiv_eq_zero_of_exactFace {U : Set (A × ℝ)} (hU : IsOpen U)
    {D : A × ℝ → ℝ} (hD : ContDiffOn ℝ ∞ D U)
    (hFace : ∀ x : A, (x, 0) ∈ U → D (x, 0) = 0)
    {a : A} (ha : (a, 0) ∈ U) (hN : fderiv ℝ D (a, 0) (0, 1) = 0) :
    fderiv ℝ D (a, 0) = 0 := by
  let j := ContinuousLinearMap.inl ℝ A ℝ
  have hLike : (D ∘ (j : A → A × ℝ)) =ᶠ[𝓝 a] (fun _ => (0 : ℝ)) := by
    filter_upwards [(j.continuous.tendsto a) (hU.mem_nhds ha)] with x hx using hFace x hx
  have hd := contDiffOn_differentiableAt_infty hU hD ha
  have hT : (fderiv ℝ D (a, 0)).comp j = 0 := by
    have hcomp := (hd.hasFDerivAt.comp a j.hasFDerivAt).fderiv
    simpa only [hLike.fderiv_eq, fderiv_const_apply] using hcomp.symm
  apply ContinuousLinearMap.ext
  intro v
  have hv : v = j v.1 + v.2 • ((0, 1) : A × ℝ) := by
    ext <;> simp [j]
  have hTv : fderiv ℝ D (a, 0) (j v.1) = 0 :=
    DFunLike.congr_fun hT v.1
  rw [hv, map_add, map_smul, hTv, hN]
  simp


omit [NormedSpace ℝ A] in
private theorem norm_verticalDifference (a : A) (t : ℝ) :
    ‖((a, t) : A × ℝ) - (a, 0)‖ = |t| := by
  rw [Prod.norm_def]
  simp [Real.norm_eq_abs]

private theorem abs_le_of_mem_zero_uIcc {t r : ℝ} (hr : r ∈ uIcc 0 t) : |r| ≤ |t| := by
  rcases le_total 0 t with h | h
  · rw [uIcc_of_le h] at hr
    rw [abs_of_nonneg hr.1, abs_of_nonneg h]
    exact hr.2
  · rw [uIcc_of_ge h] at hr
    rw [abs_of_nonpos hr.2, abs_of_nonpos h]
    exact neg_le_neg hr.1

/-- Compactness on a fixed buffered angular patch yields one constant for
the full value, full differential and bilinear second differential. The
vertical segments on either side end at zero inside the same chart. -/
theorem exists_exactFaceCoordinateTaylor {U : Set (A × ℝ)} (hU : IsOpen U)
    {K : Set A} (hK : IsCompact K) {WL WR : ℝ} (hWL : 0 ≤ WL) (hWR : 0 ≤ WR)
    (hBuffer : K ×ˢ Icc (-WL) WR ⊆ U)
    {D : A × ℝ → ℝ} (hD : ContDiffOn ℝ ∞ D U)
    (hFace : ∀ x : A, (x, 0) ∈ U → D (x, 0) = 0)
    (hN : ∀ a ∈ K, fderiv ℝ D (a, 0) (0, 1) = 0) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ z ∈ K ×ˢ Icc (-WL) WR,
      |D z| ≤ C * |z.2| ^ 2 ∧ ‖fderiv ℝ D z‖ ≤ C * |z.2| ∧
        ‖fderiv ℝ (fderiv ℝ D) z‖ ≤ C := by
  let B := K ×ˢ Icc (-WL) WR
  have hB : IsCompact B := hK.prod isCompact_Icc
  have hFD : ContDiffOn ℝ ∞ (fderiv ℝ D) U := hD.fderiv_of_isOpen hU (by simp)
  have hDD : ContDiffOn ℝ ∞ (fderiv ℝ (fderiv ℝ D)) U := hFD.fderiv_of_isOpen hU (by simp)
  let J : SeminormedAddCommGroup ((A × ℝ) →L[ℝ] (A × ℝ) →L[ℝ] ℝ) :=
    ContinuousLinearMap.toSeminormedAddCommGroup
  have hn : Continuous (fun T : (A × ℝ) →L[ℝ] (A × ℝ) →L[ℝ] ℝ => ‖T‖) :=
    @continuous_norm _ J.toSeminormedAddGroup
  have hNorm : ContinuousOn (fun z => ‖fderiv ℝ (fderiv ℝ D) z‖) U :=
    hn.comp_continuousOn hDD.continuousOn
  obtain ⟨C₀, hC₀⟩ := hB.bddAbove_image (hNorm.mono hBuffer)
  let C := max 0 C₀
  have hC : 0 ≤ C := le_max_left _ _
  have hCdd {z : A × ℝ} (hz : z ∈ B) : ‖fderiv ℝ (fderiv ℝ D) z‖ ≤ C :=
    (hC₀ (mem_image_of_mem _ hz)).trans (le_max_right _ _)
  have h0 : (0 : ℝ) ∈ Icc (-WL) WR := ⟨neg_nonpos.mpr hWL, hWR⟩
  have hF {a : A} (ha : a ∈ K) {t : ℝ} (ht : t ∈ Icc (-WL) WR) :
      ‖fderiv ℝ D (a, t)‖ ≤ C * |t| := by
    let S := ({a} : Set A) ×ˢ Icc (-WL) WR
    have hSB : S ⊆ B := prod_mono (singleton_subset_iff.mpr ha) (Subset.rfl)
    have hS : Convex ℝ S := (convex_singleton a).prod (convex_Icc _ _)
    have hz0 : (a, (0 : ℝ)) ∈ S := ⟨mem_singleton _, h0⟩
    have hzt : (a, t) ∈ S := ⟨mem_singleton _, ht⟩
    have hZero := fderiv_eq_zero_of_exactFace hU hD hFace (hBuffer (hSB hz0)) (hN a ha)
    have h := hS.norm_image_sub_le_of_norm_fderiv_le
      (fun x hx => contDiffOn_differentiableAt_infty hU hFD (hBuffer (hSB hx)))
      (fun x hx => hCdd (hSB hx)) hz0 hzt
    simpa only [hZero, sub_zero, norm_verticalDifference] using h
  refine ⟨C, hC, ?_⟩
  rintro ⟨a, t⟩ hz
  have ha := hz.1
  have ht := hz.2
  refine ⟨?_, hF ha ht, hCdd hz⟩
  let S := ({a} : Set A) ×ˢ uIcc 0 t
  have hSB : S ⊆ B := prod_mono (singleton_subset_iff.mpr ha) (uIcc_subset_Icc h0 ht)
  have hS : Convex ℝ S := (convex_singleton a).prod (convex_uIcc _ _)
  have hz0 : (a, (0 : ℝ)) ∈ S := ⟨mem_singleton _, left_mem_uIcc⟩
  have hzt : (a, t) ∈ S := ⟨mem_singleton _, right_mem_uIcc⟩
  have hBound (x : A × ℝ) (hx : x ∈ S) : ‖fderiv ℝ D x‖ ≤ C * |t| :=
    (hF (hSB hx).1 (hSB hx).2).trans (mul_le_mul_of_nonneg_left (abs_le_of_mem_zero_uIcc hx.2) hC)
  have h := hS.norm_image_sub_le_of_norm_fderiv_le
    (fun x hx => contDiffOn_differentiableAt_infty hU hD (hBuffer (hSB hx))) hBound hz0 hzt
  rw [hFace a (hBuffer (hSB hz0)), sub_zero, norm_verticalDifference, Real.norm_eq_abs,
    mul_assoc, ← pow_two] at h
  exact h


private theorem exactFaceJetWeight_norm_le {s wL wR t : ℝ} (hs : s ∈ Icc 0 1) :
    |exactFaceJetWeight s wL wR t| ≤ 1 := by
  have hc := exactFaceCutoff_mem_Icc wL wR t
  have hNonneg : 0 ≤ s * exactFaceCutoff wL wR t := mul_nonneg hs.1 hc.1
  have hOne : s * exactFaceCutoff wL wR t ≤ 1 :=
    (mul_le_mul_of_nonneg_right hs.2 hc.1).trans (by simpa using hc.2)
  rw [exactFaceJetWeight, abs_of_nonneg (sub_nonneg.mpr hOne)]
  exact sub_le_self _ hNonneg

private theorem exactFaceJetWeight_deriv_eq (s wL wR : ℝ) :
    deriv (exactFaceJetWeight s wL wR) = fun t => -s * deriv (exactFaceCutoff wL wR) t := by
  ext
  unfold exactFaceJetWeight
  rw [deriv_fun_sub (differentiableAt_const _)
    ((contDiff_const.mul (contDiff_exactFaceCutoff wL wR)).differentiable (by simp) _),
    deriv_const, deriv_const_mul_field, zero_sub, neg_mul]

private theorem exactFaceJetWeight_secondDeriv_eq (s wL wR : ℝ) (t : ℝ) :
    deriv (deriv (exactFaceJetWeight s wL wR)) t =
      -s * deriv (deriv (exactFaceCutoff wL wR)) t := by
  rw [exactFaceJetWeight_deriv_eq, deriv_const_mul_field]

private theorem exactFaceJetWeight_abs_derivs_le {s wL wR t L₁ L₂ : ℝ}
    (hs : s ∈ Icc 0 1)
    (h₁ : |deriv (exactFaceCutoff wL wR) t| ≤ L₁)
    (h₂ : |deriv (deriv (exactFaceCutoff wL wR)) t| ≤ L₂) :
    |deriv (exactFaceJetWeight s wL wR) t| ≤ L₁ ∧
      |deriv (deriv (exactFaceJetWeight s wL wR)) t| ≤ L₂ := by
  rw [exactFaceJetWeight_secondDeriv_eq, exactFaceJetWeight_deriv_eq]
  simp only [abs_mul, abs_neg, abs_of_nonneg hs.1]
  exact ⟨(mul_le_of_le_one_left (abs_nonneg _) hs.2).trans h₁,
    (mul_le_of_le_one_left (abs_nonneg _) hs.2).trans h₂⟩

/-- All three jet bounds in one half arise from its own width. The two
cross terms each consume one inverse width. -/
private theorem exactFaceCoordinateSplice_bound_on_half
    {U : Set (A × ℝ)} (hU : IsOpen U) {D : A × ℝ → ℝ} (hD : ContDiffOn ℝ ∞ D U)
    {s wL wR w C L₁ L₂ : ℝ} (hs : s ∈ Icc 0 1) (hw : 0 < w)
    (hC : 0 ≤ C) (hL₁ : 0 ≤ L₁) (hL₂ : 0 ≤ L₂) {z : A × ℝ} (hz : z ∈ U)
    (h₀ : |D z| ≤ C * w ^ 2) (h₁ : ‖fderiv ℝ D z‖ ≤ C * w)
    (h₂ : ‖fderiv ℝ (fderiv ℝ D) z‖ ≤ C)
    (hb₁ : |deriv (exactFaceJetWeight s wL wR) z.2| ≤ L₁ / w)
    (hb₂ : |deriv (deriv (exactFaceJetWeight s wL wR)) z.2| ≤ L₂ / w ^ 2) :
    let N := exactFaceCoordinateSplice s wL wR D
    |N z| ≤ C * w ^ 2 ∧ ‖fderiv ℝ N z‖ ≤ C * (1 + L₁) * w ∧
      ‖fderiv ℝ (fderiv ℝ N) z‖ ≤ C * (1 + 2 * L₁ + L₂) := by
  intro N
  let θ := exactFaceJetWeight s wL wR
  have hb₀ : |θ z.2| ≤ 1 := exactFaceJetWeight_norm_le hs
  have hN₀ : |N z| ≤ C * w ^ 2 := by
    change |θ z.2 * D z| ≤ _
    exact (abs_mul _ _).trans_le ((mul_le_of_le_one_left (abs_nonneg _) hb₀).trans h₀)
  have hFirst (v : A × ℝ) : |fderiv ℝ D z v| ≤ C * w * ‖v‖ := by
    rw [← Real.norm_eq_abs]
    exact (ContinuousLinearMap.le_opNorm _ _).trans (mul_le_mul_of_nonneg_right h₁ (norm_nonneg _))
  have hSecond (v w : A × ℝ) : |fderiv ℝ (fderiv ℝ D) z v w| ≤ C * ‖v‖ * ‖w‖ := by
    rw [← Real.norm_eq_abs]
    exact (ContinuousLinearMap.le_opNorm _ _).trans
      (mul_le_mul_of_nonneg_right (ContinuousLinearMap.le_of_opNorm_le _ h₂ v) (norm_nonneg _))
  have hNormal (v : A × ℝ) : |v.2| ≤ ‖v‖ := by
    rw [← Real.norm_eq_abs]
    exact norm_snd_le v
  have hCross (v w' : A × ℝ) :
      |deriv θ z.2 * v.2 * fderiv ℝ D z w'| ≤ C * L₁ * ‖v‖ * ‖w'‖ := by
    rw [abs_mul, abs_mul]
    calc
      _ ≤ L₁ / w * ‖v‖ * (C * w * ‖w'‖) :=
        mul_le_mul (mul_le_mul hb₁ (hNormal v) (abs_nonneg _) (by positivity))
          (hFirst w') (abs_nonneg _) (by positivity)
      _ = _ := by field_simp [hw.ne']
  have hDiff₁ : ‖fderiv ℝ N z‖ ≤ C * (1 + L₁) * w := by
    apply ContinuousLinearMap.opNorm_le_bound _ (by positivity)
    intro v
    rw [Real.norm_eq_abs, (exactFaceCoordinateSplice_two_jets hU hD s wL wR hz v v).1]
    calc
      _ ≤ |θ z.2 * fderiv ℝ D z v| + |deriv θ z.2 * v.2 * D z| := abs_add_le _ _
      _ ≤ C * w * ‖v‖ + L₁ / w * ‖v‖ * (C * w ^ 2) := by
        rw [abs_mul, abs_mul, abs_mul]
        exact add_le_add ((mul_le_of_le_one_left (abs_nonneg _) hb₀).trans (hFirst v))
          (mul_le_mul (mul_le_mul hb₁ (hNormal v) (abs_nonneg _) (by positivity))
            h₀ (abs_nonneg _) (by positivity))
      _ = _ := by field_simp [hw.ne']
  refine ⟨hN₀, hDiff₁, ?_⟩
  apply ContinuousLinearMap.opNorm_le_bound _ (by positivity)
  intro v
  apply ContinuousLinearMap.opNorm_le_bound _ (by positivity)
  intro w'
  rw [Real.norm_eq_abs, (exactFaceCoordinateSplice_two_jets hU hD s wL wR hz v w').2]
  let p := θ z.2 * fderiv ℝ (fderiv ℝ D) z v w'
  let q := deriv θ z.2 * v.2 * fderiv ℝ D z w'
  let r := deriv θ z.2 * w'.2 * fderiv ℝ D z v
  let d := deriv (deriv θ) z.2 * v.2 * w'.2 * D z
  change |p + q + r + d| ≤ _
  have hp : |p| ≤ C * ‖v‖ * ‖w'‖ := by
    rw [show p = θ z.2 * fderiv ℝ (fderiv ℝ D) z v w' from rfl, abs_mul]
    exact (mul_le_of_le_one_left (abs_nonneg _) hb₀).trans (hSecond v w')
  have hq : |q| ≤ C * L₁ * ‖v‖ * ‖w'‖ := hCross v w'
  have hr : |r| ≤ C * L₁ * ‖v‖ * ‖w'‖ := (hCross w' v).trans_eq (by ring)
  have hd : |d| ≤ C * L₂ * ‖v‖ * ‖w'‖ := by
    dsimp [d]
    rw [abs_mul, abs_mul, abs_mul]
    calc
      _ ≤ L₂ / w ^ 2 * ‖v‖ * ‖w'‖ * (C * w ^ 2) := by
        apply mul_le_mul _ h₀ (abs_nonneg _) (by positivity)
        apply mul_le_mul _ (hNormal w') (abs_nonneg _) (by positivity)
        exact mul_le_mul hb₂ (hNormal v) (abs_nonneg _) (by positivity)
      _ = _ := by field_simp [hw.ne']
  calc
    _ ≤ |p + q + r| + |d| := abs_add_le (p + q + r) d
    _ ≤ |p + q| + |r| + |d| := add_le_add (abs_add_le (p + q) r) le_rfl
    _ ≤ |p| + |q| + |r| + |d| :=
      add_le_add (add_le_add (abs_add_le p q) le_rfl) le_rfl
    _ ≤ C * ‖v‖ * ‖w'‖ + C * L₁ * ‖v‖ * ‖w'‖ +
        C * L₁ * ‖v‖ * ‖w'‖ + C * L₂ * ‖v‖ * ‖w'‖ :=
      add_le_add (add_le_add (add_le_add hp hq) hr) hd
    _ = _ := by ring


/-- Uniform value, gradient and full Hessian control on both physical halves.
The compact buffer and the exact face jets are fixed before choosing widths.
The second-order constant, in particular, is independent of their ratio. -/
theorem exists_exactFaceCoordinateSplice_twoJetBound
    {U : Set (A × ℝ)} (hU : IsOpen U) {K : Set A} (hK : IsCompact K)
    {WL WR : ℝ} (hWL : 0 ≤ WL) (hWR : 0 ≤ WR)
    (hBuffer : K ×ˢ Icc (-WL) WR ⊆ U)
    {D : A × ℝ → ℝ} (hD : ContDiffOn ℝ ∞ D U)
    (hFace : ∀ x : A, (x, 0) ∈ U → D (x, 0) = 0)
    (hN : ∀ a ∈ K, fderiv ℝ D (a, 0) (0, 1) = 0) :
    ∃ C L₁ L₂ : ℝ, 0 ≤ C ∧ 0 ≤ L₁ ∧ 0 ≤ L₂ ∧
      ∀ (s wL wR : ℝ), s ∈ Icc 0 1 → 0 < wL → 0 < wR → wL ≤ WL → wR ≤ WR →
      ∀ z : A × ℝ, z.1 ∈ K →
        let N := exactFaceCoordinateSplice s wL wR D
        let H := C * (1 + 2 * L₁ + L₂)
        (z.2 ∈ Icc (-wL) 0 → |N z| ≤ C * wL ^ 2 ∧
          ‖fderiv ℝ N z‖ ≤ C * (1 + L₁) * wL ∧ ‖fderiv ℝ (fderiv ℝ N) z‖ ≤ H) ∧
        (z.2 ∈ Icc 0 wR → |N z| ≤ C * wR ^ 2 ∧
          ‖fderiv ℝ N z‖ ≤ C * (1 + L₁) * wR ∧ ‖fderiv ℝ (fderiv ℝ N) z‖ ≤ H) := by
  obtain ⟨C, hC, hD₀⟩ := exists_exactFaceCoordinateTaylor hU hK hWL hWR hBuffer hD hFace hN
  obtain ⟨L₁, L₂, hL₁, hL₂, hCut⟩ := exists_exactFaceCutoff_deriv_bounds
  refine ⟨C, L₁, L₂, hC, hL₁, hL₂, fun s wL wR hs hwL hwR hL hR z hzK => ?_⟩
  intro N H
  have hSide {w : ℝ} (hw : 0 < w) (ht : z.2 ∈ Icc (-WL) WR) (hzt : |z.2| ≤ w)
      (hc₁ : |deriv (exactFaceCutoff wL wR) z.2| ≤ L₁ / w)
      (hc₂ : |deriv (deriv (exactFaceCutoff wL wR)) z.2| ≤ L₂ / w ^ 2) :
      |N z| ≤ C * w ^ 2 ∧ ‖fderiv ℝ N z‖ ≤ C * (1 + L₁) * w ∧
        ‖fderiv ℝ (fderiv ℝ N) z‖ ≤ H := by
    obtain ⟨hDval, hDgrad, hDhess⟩ := hD₀ z ⟨hzK, ht⟩
    obtain ⟨hCut₁, hCut₂⟩ := exactFaceJetWeight_abs_derivs_le hs hc₁ hc₂
    exact exactFaceCoordinateSplice_bound_on_half hU hD hs hw hC hL₁ hL₂ (hBuffer ⟨hzK, ht⟩)
      (hDval.trans (mul_le_mul_of_nonneg_left (pow_le_pow_left₀ (abs_nonneg _) hzt _) hC))
      (hDgrad.trans (mul_le_mul_of_nonneg_left hzt hC)) hDhess hCut₁ hCut₂
  constructor
  · intro ht
    obtain ⟨hCut₁, hCut₂⟩ := (hCut wL wR hwL hwR z.2).1 ht
    exact hSide hwL ⟨(neg_le_neg hL).trans ht.1, ht.2.trans hWR⟩
      (by rw [abs_of_nonpos ht.2]; linarith [ht.1]) hCut₁ hCut₂
  · intro ht
    obtain ⟨hCut₁, hCut₂⟩ := (hCut wL wR hwL hwR z.2).2 ht
    exact hSide hwR ⟨(neg_nonpos.mpr hWL).trans ht.1, ht.2.trans hR⟩
      (by simpa only [abs_of_nonneg ht.1] using ht.2) hCut₁ hCut₂

/-- Tangential and mixed formulas read off in the signed angular-normal
coordinates. Each mixed order keeps the derivative of the weight times
the corresponding angular derivative of the defect. -/
theorem exactFaceCoordinateSplice_angular_mixed
    {U : Set (A × ℝ)} (hU : IsOpen U) {D : A × ℝ → ℝ} (hD : ContDiffOn ℝ ∞ D U)
    (s wL wR : ℝ) {z : A × ℝ} (hz : z ∈ U) (a b : A) :
    let θ := exactFaceJetWeight s wL wR
    let N := exactFaceCoordinateSplice s wL wR D
    fderiv ℝ N z (a, 0) = θ z.2 * fderiv ℝ D z (a, 0) ∧
    fderiv ℝ (fderiv ℝ N) z (a, 0) (b, 0) = θ z.2 * fderiv ℝ (fderiv ℝ D) z (a, 0) (b, 0) ∧
    fderiv ℝ (fderiv ℝ N) z (a, 0) (0, 1) =
      θ z.2 * fderiv ℝ (fderiv ℝ D) z (a, 0) (0, 1) + deriv θ z.2 * fderiv ℝ D z (a, 0) ∧
    fderiv ℝ (fderiv ℝ N) z (0, 1) (b, 0) =
      θ z.2 * fderiv ℝ (fderiv ℝ D) z (0, 1) (b, 0) + deriv θ z.2 * fderiv ℝ D z (b, 0) := by
  intro θ N
  refine ⟨?_, ?_, ?_, ?_⟩
  · simpa only [Prod.snd, mul_zero, zero_mul, add_zero] using
      (exactFaceCoordinateSplice_two_jets hU hD s wL wR hz (a, 0) (b, 0)).1
  · simpa only [Prod.snd, mul_zero, zero_mul, add_zero] using
      (exactFaceCoordinateSplice_two_jets hU hD s wL wR hz (a, 0) (b, 0)).2
  · simpa only [Prod.snd, mul_zero, zero_mul, mul_one, add_zero] using
      (exactFaceCoordinateSplice_two_jets hU hD s wL wR hz (a, 0) (0, 1)).2
  · simpa only [Prod.snd, mul_zero, zero_mul, mul_one, add_zero] using
      (exactFaceCoordinateSplice_two_jets hU hD s wL wR hz (0, 1) (b, 0)).2

omit [NormedSpace ℝ A] in
/-- On the entire open common plateau all jets are those of the indicated
multiple of the source defect. On each open outer plateau they are those
of the original defect. -/
theorem exactFaceCoordinateSplice_plateau_germs
    (s : ℝ) {wL wR : ℝ} (hL : 0 < wL) (hR : 0 < wR) (D : A × ℝ → ℝ) (z : A × ℝ) :
    ((-(wL / 4) < z.2 ∧ z.2 < wR / 4) →
      exactFaceCoordinateSplice s wL wR D =ᶠ[𝓝 z] (fun y => (1 - s) * D y)) ∧
    ((z.2 < -((3 / 4) * wL) ∨ (3 / 4) * wR < z.2) →
      exactFaceCoordinateSplice s wL wR D =ᶠ[𝓝 z] D) := by
  constructor
  · intro hz
    filter_upwards [(continuous_snd.tendsto z) (Ioo_mem_nhds hz.1 hz.2)] with y hy
    simp [exactFaceCoordinateSplice, exactFaceJetWeight,
      exactFaceCutoff_eq_one hL hR (le_of_lt hy.1) (le_of_lt hy.2)]
  · intro hz
    rcases hz with hz | hz
    · filter_upwards [(continuous_snd.tendsto z) (Iio_mem_nhds hz)] with y hy
      simp [exactFaceCoordinateSplice, exactFaceJetWeight, exactFaceCutoff_eq_zero hL hR
        (Or.inl (le_of_lt (mem_Iio.mp hy)))]
    · filter_upwards [(continuous_snd.tendsto z) (Ioi_mem_nhds hz)] with y hy
      simp [exactFaceCoordinateSplice, exactFaceJetWeight, exactFaceCutoff_eq_zero hL hR
        (Or.inr (le_of_lt (mem_Ioi.mp hy)))]


section NativeChart

local notation "A₃" => EuclideanSpace ℝ (Fin 3)
local notation "J₄" => ModelWithCorners.prod (𝓡 3) (𝓘(ℝ))

variable {E G M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [FiniteDimensional ℝ E] [TopologicalSpace G] {I : ModelWithCorners ℝ E G}
  [TopologicalSpace M] [ChartedSpace G M] [IsManifold I ∞ M] [T2Space M]

/-- The native signed coordinate is retained exactly in the angular chart. -/
def exactFaceAngularProduct (φ : PartialDiffeomorph 𝓘(ℝ, A₃) (𝓡 3) A₃ ExactFaceSphere ∞)
    (z : A₃ × ℝ) : ExactFaceTube :=
  (φ z.1, z.2)

/-- A genuine pullback coefficient of a physical metric in the supplied
marked product chart. Both vectors are fixed coordinate slots. -/
def exactFaceNativeCoefficient
    (F : PartialDiffeomorph J₄ I ExactFaceTube M ∞)
    (φ : PartialDiffeomorph 𝓘(ℝ, A₃) (𝓡 3) A₃ ExactFaceSphere ∞)
    (q : SmoothRiemannianMetric I M) (v w z : A₃ × ℝ) : ℝ :=
  pullbackMetricCoefficients q ((F : ExactFaceTube → M) ∘ exactFaceAngularProduct φ) z v w

omit [FiniteDimensional ℝ E] [T2Space M] in
theorem contDiffOn_exactFaceNativeCoefficient
    (F : PartialDiffeomorph J₄ I ExactFaceTube M ∞)
    (φ : PartialDiffeomorph 𝓘(ℝ, A₃) (𝓡 3) A₃ ExactFaceSphere ∞)
    (q : SmoothRiemannianMetric I M) (v w : A₃ × ℝ) {U : Set (A₃ × ℝ)}
    (hU : IsOpen U) (hAng : ∀ z ∈ U, z.1 ∈ φ.source)
    (hNative : ∀ z ∈ U, exactFaceAngularProduct φ z ∈ F.source) :
    ContDiffOn ℝ ∞ (exactFaceNativeCoefficient F φ q v w) U := by
  have hPr₁ : ContMDiff 𝓘(ℝ, A₃ × ℝ) 𝓘(ℝ, A₃) ∞ (Prod.fst : A₃ × ℝ → A₃) :=
    contDiff_fst.contMDiff
  have hPr₂ : ContMDiff 𝓘(ℝ, A₃ × ℝ) 𝓘(ℝ) ∞ (Prod.snd : A₃ × ℝ → ℝ) :=
    contDiff_snd.contMDiff
  have hAng₀ : ContMDiffOn 𝓘(ℝ, A₃ × ℝ) J₄ ∞ (exactFaceAngularProduct φ) U :=
    (φ.contMDiffOn_toFun.comp hPr₁.contMDiffOn hAng).prodMk hPr₂.contMDiffOn
  have hF := F.contMDiffOn_toFun.comp hAng₀ hNative
  have hh := contDiffOn_pullback_metric_coefficients q hU hF
  exact (hh.clm_apply contDiffOn_const).clm_apply contDiffOn_const

/-- The exact defect relative to the E44 reference extension, which
pulls back to the unit round product on the buffered reference slab. -/
def exactFaceNativeDefect
    (F : PartialDiffeomorph J₄ I ExactFaceTube M ∞)
    (φ : PartialDiffeomorph 𝓘(ℝ, A₃) (𝓡 3) A₃ ExactFaceSphere ∞)
    (g R : SmoothRiemannianMetric I M) (u : C^∞⟮I, M; ℝ⟯)
    (v w z : A₃ × ℝ) : ℝ :=
  exactFaceNativeCoefficient F φ (Geometry.conformalMetric g u u.contMDiff) v w z -
    exactFaceNativeCoefficient F φ R v w z

set_option backward.isDefEq.respectTransparency false in
/-- The affine formula holds at every nearby point of the native chart,
including neighborhoods of the chosen physical strip endpoints. -/
theorem exactFaceNativePath_sub_reference
    (F : PartialDiffeomorph J₄ I ExactFaceTube M ∞)
    (φ : PartialDiffeomorph 𝓘(ℝ, A₃) (𝓡 3) A₃ ExactFaceSphere ∞)
    (g R : SmoothRiemannianMetric I M) (u : C^∞⟮I, M; ℝ⟯)
    {wL wR : ℝ} (hL : 0 < wL) (hR : 0 < wR)
    (hS : exactFaceSlab wL wR ⊆ F.source) (s : Icc (0 : ℝ) 1)
    (v w z : A₃ × ℝ) (hz : exactFaceAngularProduct φ z ∈ F.source) :
    exactFaceNativeCoefficient F φ (exactFaceNormalizedPath F g R u hL hR hS s) v w z -
        exactFaceNativeCoefficient F φ R v w z =
      exactFaceCoordinateSplice s wL wR (exactFaceNativeDefect F φ g R u v w) z := by
  simp only [exactFaceNativeDefect, exactFaceNativeCoefficient, exactFaceCoordinateSplice,
    pullbackMetricCoefficients_apply, Function.comp_apply]
  unfold exactFaceNormalizedPath
  dsimp only
  rw [convexComb_inner, exactFacePhysicalCutoff_apply_chart F hL hR hS hz]
  simp only [exactFaceJetWeight, smul_eq_mul]
  rw [show (exactFaceAngularProduct φ z).2 = z.2 from rfl]
  ring

/-- Convert the signed one-variable normal derivative at an actual chart face
to the normal slot of the full coordinate derivative. -/
theorem exactFaceNativeNormal_eq_fderiv_normal
    {U : Set (A₃ × ℝ)} (hU : IsOpen U) {D : A₃ × ℝ → ℝ}
    (hD : ContDiffOn ℝ ∞ D U) {a : A₃} (ha : (a, 0) ∈ U) :
    deriv (fun t => D (a, t)) 0 = fderiv ℝ D (a, 0) (0, 1) := by
  have hLine : HasDerivAt (fun t : ℝ => (a, t)) ((0, 1) : A₃ × ℝ) 0 :=
    (hasDerivAt_const 0 a).prodMk (hasDerivAt_id 0)
  exact ((contDiffOn_differentiableAt_infty hU hD ha).hasFDerivAt.comp_hasDerivAt 0 hLine).deriv

/-- The actual normalized E44 metric has the affine coefficient formula
as a germ in each buffered chart, so both spatial derivatives of that
formula are the derivatives of the same metric path. -/
theorem exactFaceNativePath_sub_reference_germ
    (F : PartialDiffeomorph J₄ I ExactFaceTube M ∞)
    (φ : PartialDiffeomorph 𝓘(ℝ, A₃) (𝓡 3) A₃ ExactFaceSphere ∞)
    (g R : SmoothRiemannianMetric I M) (u : C^∞⟮I, M; ℝ⟯)
    {wL wR : ℝ} (hL : 0 < wL) (hR : 0 < wR)
    (hS : exactFaceSlab wL wR ⊆ F.source) (s : Icc (0 : ℝ) 1)
    (v w : A₃ × ℝ) {U : Set (A₃ × ℝ)} (hU : IsOpen U)
    (hNative : ∀ z ∈ U, exactFaceAngularProduct φ z ∈ F.source)
    {z : A₃ × ℝ} (hz : z ∈ U) :
    (fun y => exactFaceNativeCoefficient F φ (exactFaceNormalizedPath F g R u hL hR hS s) v w y -
      exactFaceNativeCoefficient F φ R v w y) =ᶠ[𝓝 z]
      exactFaceCoordinateSplice s wL wR (exactFaceNativeDefect F φ g R u v w) := by
  filter_upwards [hU.mem_nhds hz] with y hy
  exact exactFaceNativePath_sub_reference F φ g R u hL hR hS s v w y (hNative y hy)

/-- In one normalized spherical chart, the exact face identities give
uniform spatial two-jets for every smaller physical width pair.
The value and first derivative bounds keep the powers of each side's width.
The angular and mixed component bounds follow by evaluation of these
operator-norm estimates on the prescribed coordinate directions. -/
theorem exists_exactFaceNativePath_twoJetBound
    (F : PartialDiffeomorph J₄ I ExactFaceTube M ∞)
    (φ : PartialDiffeomorph 𝓘(ℝ, A₃) (𝓡 3) A₃ ExactFaceSphere ∞)
    (g R : SmoothRiemannianMetric I M) (u : C^∞⟮I, M; ℝ⟯)
    (v w : A₃ × ℝ) {U : Set (A₃ × ℝ)} (hU : IsOpen U)
    (hAng : ∀ z ∈ U, z.1 ∈ φ.source)
    (hNative : ∀ z ∈ U, exactFaceAngularProduct φ z ∈ F.source)
    {K : Set A₃} (hK : IsCompact K) {WL WR : ℝ} (hWL : 0 ≤ WL) (hWR : 0 ≤ WR)
    (hBuffer : K ×ˢ Icc (-WL) WR ⊆ U)
    (hFace : ∀ a : A₃, (a, 0) ∈ U → exactFaceNativeDefect F φ g R u v w (a, 0) = 0)
    (hNormal : ∀ a ∈ K, HasDerivAt (fun t => exactFaceNativeDefect F φ g R u v w (a, t)) 0 0) :
    ∃ C L₁ L₂ : ℝ, 0 ≤ C ∧ 0 ≤ L₁ ∧ 0 ≤ L₂ ∧
      ∀ (s : Icc (0 : ℝ) 1) {wL wR : ℝ} (hL : 0 < wL) (hR : 0 < wR),
        wL ≤ WL → wR ≤ WR → ∀ (hS : exactFaceSlab wL wR ⊆ F.source) (z : A₃ × ℝ),
        z.1 ∈ K →
          let X := fun y => exactFaceNativeCoefficient F φ (exactFaceNormalizedPath F g R u hL hR hS s)
            v w y - exactFaceNativeCoefficient F φ R v w y
          let H := C * (1 + 2 * L₁ + L₂)
          (z.2 ∈ Icc (-wL) 0 → |X z| ≤ C * wL ^ 2 ∧
            ‖fderiv ℝ X z‖ ≤ C * (1 + L₁) * wL ∧ ‖fderiv ℝ (fderiv ℝ X) z‖ ≤ H) ∧
          (z.2 ∈ Icc 0 wR → |X z| ≤ C * wR ^ 2 ∧
            ‖fderiv ℝ X z‖ ≤ C * (1 + L₁) * wR ∧ ‖fderiv ℝ (fderiv ℝ X) z‖ ≤ H) := by
  let D := exactFaceNativeDefect F φ g R u v w
  have hD : ContDiffOn ℝ ∞ D U :=
    (contDiffOn_exactFaceNativeCoefficient F φ (Geometry.conformalMetric g u u.contMDiff)
      v w hU hAng hNative).sub (contDiffOn_exactFaceNativeCoefficient F φ R v w hU hAng hNative)
  have hDN (a : A₃) (ha : a ∈ K) : fderiv ℝ D (a, 0) (0, 1) = 0 := by
    rw [← exactFaceNativeNormal_eq_fderiv_normal hU hD (hBuffer ⟨ha, neg_nonpos.mpr hWL, hWR⟩)]
    exact (hNormal a ha).deriv
  obtain ⟨C, L₁, L₂, hC, hL₁, hL₂, hUniform⟩ :=
    exists_exactFaceCoordinateSplice_twoJetBound hU hK hWL hWR hBuffer hD hFace hDN
  refine ⟨C, L₁, L₂, hC, hL₁, hL₂, fun s wL wR hL hR hWL' hWR' hS z hzK => ?_⟩
  intro X H
  have hUniform' := hUniform s wL wR s.2 hL hR hWL' hWR' z hzK
  let N := exactFaceCoordinateSplice s wL wR D
  have hTransfer {w₀ : ℝ} (hz : z ∈ U)
      (h : |N z| ≤ C * w₀ ^ 2 ∧ ‖fderiv ℝ N z‖ ≤ C * (1 + L₁) * w₀ ∧
        ‖fderiv ℝ (fderiv ℝ N) z‖ ≤ H) :
      |X z| ≤ C * w₀ ^ 2 ∧ ‖fderiv ℝ X z‖ ≤ C * (1 + L₁) * w₀ ∧
        ‖fderiv ℝ (fderiv ℝ X) z‖ ≤ H := by
    have hGerm : X =ᶠ[𝓝 z] N :=
      exactFaceNativePath_sub_reference_germ F φ g R u hL hR hS s v w hU hNative hz
    rwa [hGerm.self_of_nhds, hGerm.fderiv_eq, hGerm.fderiv.fderiv_eq]
  exact ⟨fun ht => hTransfer (hBuffer ⟨hzK, (neg_le_neg hWL').trans ht.1, ht.2.trans hWR⟩)
      (hUniform'.1 ht),
    fun ht => hTransfer (hBuffer ⟨hzK, (neg_nonpos.mpr hWL).trans ht.1, ht.2.trans hWR'⟩)
      (hUniform'.2 ht)⟩

private theorem exists_compactScalarTwoJetBound
    {U : Set (A₃ × ℝ)} (hU : IsOpen U) {B : Set (A₃ × ℝ)} (hB : IsCompact B) (hBU : B ⊆ U)
    {Q : A₃ × ℝ → ℝ} (hQ : ContDiffOn ℝ ∞ Q U) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ z ∈ B,
      |Q z| ≤ C ∧ ‖fderiv ℝ Q z‖ ≤ C ∧ ‖fderiv ℝ (fderiv ℝ Q) z‖ ≤ C := by
  have hQ₁ : ContDiffOn ℝ ∞ (fderiv ℝ Q) U := hQ.fderiv_of_isOpen hU (by simp)
  have hQ₂ : ContDiffOn ℝ ∞ (fderiv ℝ (fderiv ℝ Q)) U :=
    hQ₁.fderiv_of_isOpen hU (by simp)
  let J₁ : SeminormedAddCommGroup ((A₃ × ℝ) →L[ℝ] ℝ) :=
    ContinuousLinearMap.toSeminormedAddCommGroup
  let J₂ : SeminormedAddCommGroup ((A₃ × ℝ) →L[ℝ] (A₃ × ℝ) →L[ℝ] ℝ) :=
    ContinuousLinearMap.toSeminormedAddCommGroup
  have hn₁ : Continuous (fun T : (A₃ × ℝ) →L[ℝ] ℝ => ‖T‖) :=
    @continuous_norm _ J₁.toSeminormedAddGroup
  have hn₂ : Continuous (fun T : (A₃ × ℝ) →L[ℝ] (A₃ × ℝ) →L[ℝ] ℝ => ‖T‖) :=
    @continuous_norm _ J₂.toSeminormedAddGroup
  have hJet : ContinuousOn (fun z => |Q z| + ‖fderiv ℝ Q z‖ + ‖fderiv ℝ (fderiv ℝ Q) z‖) U :=
    (hQ.continuousOn.abs.add (hn₁.comp_continuousOn hQ₁.continuousOn)).add
      (hn₂.comp_continuousOn hQ₂.continuousOn)
  obtain ⟨C, hC⟩ := hB.bddAbove_image (hJet.mono hBU)
  refine ⟨max 0 C, le_max_left _ _, fun z hz => ?_⟩
  have h : |Q z| + ‖fderiv ℝ Q z‖ + ‖fderiv ℝ (fderiv ℝ Q) z‖ ≤ max 0 C :=
    (hC (mem_image_of_mem _ hz)).trans (le_max_right _ _)
  exact ⟨by linarith only [h, norm_nonneg (fderiv ℝ Q z), norm_nonneg (fderiv ℝ (fderiv ℝ Q) z)],
    by linarith only [h, abs_nonneg (Q z), norm_nonneg (fderiv ℝ (fderiv ℝ Q) z)],
    by linarith only [h, abs_nonneg (Q z), norm_nonneg (fderiv ℝ Q z)]⟩

/-- Uniform bounds for the full coefficients of the actual normalized
metric path, in the same model chart. The smooth fixed reference contributes
its own compact value, first-jet and second-jet bounds. -/
theorem exists_exactFaceNativePath_fullCoefficientBound
    (F : PartialDiffeomorph J₄ I ExactFaceTube M ∞)
    (φ : PartialDiffeomorph 𝓘(ℝ, A₃) (𝓡 3) A₃ ExactFaceSphere ∞)
    (g R : SmoothRiemannianMetric I M) (u : C^∞⟮I, M; ℝ⟯)
    (v w : A₃ × ℝ) {U : Set (A₃ × ℝ)} (hU : IsOpen U)
    (hAng : ∀ z ∈ U, z.1 ∈ φ.source)
    (hNative : ∀ z ∈ U, exactFaceAngularProduct φ z ∈ F.source)
    {K : Set A₃} (hK : IsCompact K) {WL WR : ℝ} (hWL : 0 ≤ WL) (hWR : 0 ≤ WR)
    (hBuffer : K ×ˢ Icc (-WL) WR ⊆ U)
    (hFace : ∀ a : A₃, (a, 0) ∈ U → exactFaceNativeDefect F φ g R u v w (a, 0) = 0)
    (hNormal : ∀ a ∈ K, HasDerivAt (fun t => exactFaceNativeDefect F φ g R u v w (a, t)) 0 0) :
    ∃ B : ℝ, 0 ≤ B ∧
      ∀ (s : Icc (0 : ℝ) 1) {wL wR : ℝ} (hL : 0 < wL) (hR : 0 < wR),
        wL ≤ WL → wR ≤ WR → wL ≤ 1 → wR ≤ 1 →
        ∀ (hS : exactFaceSlab wL wR ⊆ F.source) (z : A₃ × ℝ), z ∈ K ×ˢ Icc (-wL) wR →
          let Y := exactFaceNativeCoefficient F φ (exactFaceNormalizedPath F g R u hL hR hS s) v w
          |Y z| ≤ B ∧ ‖fderiv ℝ Y z‖ ≤ B ∧ ‖fderiv ℝ (fderiv ℝ Y) z‖ ≤ B := by
  obtain ⟨C, L₁, L₂, hC, hL₁, hL₂, hRate⟩ :=
    exists_exactFaceNativePath_twoJetBound F φ g R u v w hU hAng hNative hK
      hWL hWR hBuffer hFace hNormal
  let Q := exactFaceNativeCoefficient F φ R v w
  have hQ : ContDiffOn ℝ ∞ Q U :=
    contDiffOn_exactFaceNativeCoefficient F φ R v w hU hAng hNative
  obtain ⟨C₀, hC₀, hRef⟩ := exists_compactScalarTwoJetBound hU (hK.prod isCompact_Icc) hBuffer hQ
  let H := C * (1 + 2 * L₁ + L₂)
  have hH : 0 ≤ H := by dsimp [H]; positivity
  refine ⟨H + C₀, add_nonneg hH hC₀, fun s wL wR hL hR hL' hR' hL₁' hR₁' hS z hz => ?_⟩
  intro Y
  let X := fun y => Y y - Q y
  have hZ : z ∈ K ×ˢ Icc (-WL) WR :=
    ⟨hz.1, (neg_le_neg hL').trans hz.2.1, hz.2.2.trans hR'⟩
  have hZU := hBuffer hZ
  have hX : |X z| ≤ H ∧ ‖fderiv ℝ X z‖ ≤ H ∧ ‖fderiv ℝ (fderiv ℝ X) z‖ ≤ H := by
    have hBounds := hRate s hL hR hL' hR' hS z hz.1
    have hW {w₀ : ℝ} (hw : 0 < w₀) (hw' : w₀ ≤ 1)
        (hb : |X z| ≤ C * w₀ ^ 2 ∧ ‖fderiv ℝ X z‖ ≤ C * (1 + L₁) * w₀ ∧
          ‖fderiv ℝ (fderiv ℝ X) z‖ ≤ H) :
        |X z| ≤ H ∧ ‖fderiv ℝ X z‖ ≤ H ∧ ‖fderiv ℝ (fderiv ℝ X) z‖ ≤ H := by
      have hVal : C * w₀ ^ 2 ≤ C :=
        (mul_le_mul_of_nonneg_left (pow_le_pow_left₀ hw.le hw' _) hC).trans_eq (by ring)
      have hDiff : C * (1 + L₁) * w₀ ≤ C * (1 + L₁) :=
        mul_le_of_le_one_right (by positivity) hw'
      have hCH : C ≤ H := by dsimp [H]; nlinarith [mul_nonneg hC hL₁, mul_nonneg hC hL₂]
      have hCH' : C * (1 + L₁) ≤ H := by dsimp [H]; nlinarith [mul_nonneg hC hL₁, mul_nonneg hC hL₂]
      exact And.intro (hb.1.trans (hVal.trans hCH))
        (And.intro (hb.2.1.trans (hDiff.trans hCH')) hb.2.2)
    rcases le_total z.2 0 with ht | ht
    · exact hW hL hL₁' (hBounds.1 ⟨hz.2.1, ht⟩)
    · exact hW hR hR₁' (hBounds.2 ⟨ht, hz.2.2⟩)
  have hY : ContDiffOn ℝ ∞ Y U :=
    contDiffOn_exactFaceNativeCoefficient F φ (exactFaceNormalizedPath F g R u hL hR hS s)
      v w hU hAng hNative
  have hFirst {x : A₃ × ℝ} (hx : x ∈ U) :
      fderiv ℝ X x = fderiv ℝ Y x - fderiv ℝ Q x :=
    fderiv_fun_sub (contDiffOn_differentiableAt_infty hU hY hx) (contDiffOn_differentiableAt_infty hU hQ hx)
  have hSecond : fderiv ℝ (fderiv ℝ X) z = fderiv ℝ (fderiv ℝ Y) z - fderiv ℝ (fderiv ℝ Q) z := by
    have hGerm : fderiv ℝ X =ᶠ[𝓝 z] (fun x => fderiv ℝ Y x - fderiv ℝ Q x) := by
      filter_upwards [hU.mem_nhds hZU] with x hx using hFirst hx
    rw [hGerm.fderiv_eq, fderiv_fun_sub
      (contDiffOn_differentiableAt_infty hU (hY.fderiv_of_isOpen hU (by simp)) hZU)
      (contDiffOn_differentiableAt_infty hU (hQ.fderiv_of_isOpen hU (by simp)) hZU)]
  obtain ⟨hRval, hR₁, hR₂⟩ := hRef z hZ
  refine ⟨?_, ?_, ?_⟩
  · rw [show Y z = X z + Q z by dsimp [X]; ring]
    exact (abs_add_le _ _).trans (add_le_add hX.1 hRval)
  · rw [← sub_add_cancel (fderiv ℝ Y z) (fderiv ℝ Q z), ← hFirst hZU]
    exact (norm_add_le _ _).trans (add_le_add hX.2.1 hR₁)
  · rw [← sub_add_cancel (fderiv ℝ (fderiv ℝ Y) z) (fderiv ℝ (fderiv ℝ Q) z), ← hSecond]
    exact (norm_add_le (fderiv ℝ (fderiv ℝ X) z) (fderiv ℝ (fderiv ℝ Q) z)).trans
      (add_le_add hX.2.2 hR₂)

end NativeChart

end
end SmoothPoincare
