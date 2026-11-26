import SmoothPoincare.Variational.BalancedMarkedExterior
import DifferentialGeometry.Topology.Manifold.EmbeddedBallContraction
import DifferentialGeometry.Topology.Diffeomorph.SphereGerm
import DifferentialGeometry.Topology.Attachment.Homeomorph
import DifferentialGeometry.Topology.Attachment.Union

/-! # Smooth compression of the original buffered marked disk -/

open Set Metric Manifold DifferentialGeometry.Topology
open scoped ContDiff Manifold Pointwise Topology

namespace SmoothPoincare

noncomputable section

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "I₄" => 𝓘(ℝ, E₄)

/-- The Gaussian-radius change, normalized to fix the unit sphere. Its target
excludes the positive radius approached at the deleted origin. -/
private def gaussianRadiusChange {ℓ : ℝ} (hℓ : 0 < ℓ) :
    PartialDiffeomorph I₄ I₄ E₄ E₄ ∞ := by
  let φ (x : E₄) := (Real.exp ((‖x‖ - 1) / ℓ) / ‖x‖) • x
  let ψ (y : E₄) := ((1 + ℓ * Real.log ‖y‖) / ‖y‖) • y
  let S := {x : E₄ | 0 < ‖x‖}
  let T := {y : E₄ | Real.exp (-1 / ℓ) < ‖y‖}
  have hφ (x : E₄) (hx : x ∈ S) : ‖φ x‖ = Real.exp ((‖x‖ - 1) / ℓ) := by
    change 0 < ‖x‖ at hx
    rw [show φ x = _ by rfl, norm_smul, Real.norm_of_nonneg (by positivity)]
    exact div_mul_cancel₀ _ hx.ne'
  have hψpos (y : E₄) (hy : y ∈ T) : 0 < 1 + ℓ * Real.log ‖y‖ := by
    have hy' : 0 < ‖y‖ := (Real.exp_pos _).trans (show Real.exp (-1 / ℓ) < ‖y‖ from hy)
    have h := Real.strictMonoOn_log (Set.mem_Ioi.mpr (Real.exp_pos (-1 / ℓ)))
      (Set.mem_Ioi.mpr hy') (show Real.exp (-1 / ℓ) < ‖y‖ from hy)
    rw [Real.log_exp] at h
    have hmul := (div_lt_iff₀ hℓ).mp h
    linarith [mul_comm ℓ (Real.log ‖y‖)]
  have hψ (y : E₄) (hy : y ∈ T) : ‖ψ y‖ = 1 + ℓ * Real.log ‖y‖ := by
    have hy' : 0 < ‖y‖ := (Real.exp_pos _).trans (show Real.exp (-1 / ℓ) < ‖y‖ from hy)
    rw [show ψ y = _ by rfl, norm_smul, Real.norm_of_nonneg
      (div_nonneg (hψpos y hy).le hy'.le)]
    exact div_mul_cancel₀ _ hy'.ne'
  refine
    { toPartialEquiv :=
        { toFun := φ
          invFun := ψ
          source := S
          target := T
          map_source' := ?_
          map_target' := ?_
          left_inv' := ?_
          right_inv' := ?_ }
      open_source := isOpen_lt continuous_const continuous_norm
      open_target := isOpen_lt continuous_const continuous_norm
      contMDiffOn_toFun := ?_
      contMDiffOn_invFun := ?_ }
  · intro x hx
    change Real.exp (-1 / ℓ) < ‖φ x‖
    rw [hφ x hx, Real.exp_lt_exp, div_lt_div_iff_of_pos_right hℓ]
    linarith [show 0 < ‖x‖ from hx]
  · intro y hy
    show 0 < ‖ψ y‖
    rw [hψ y hy]
    exact hψpos y hy
  · intro x hx
    have hx' : 0 < ‖x‖ := hx
    change ((1 + ℓ * Real.log ‖φ x‖) / ‖φ x‖) •
        ((Real.exp ((‖x‖ - 1) / ℓ) / ‖x‖) • x) = x
    rw [hφ x hx, Real.log_exp, smul_smul]
    have he : Real.exp ((‖x‖ - 1) / ℓ) ≠ 0 := (Real.exp_pos _).ne'
    have hcoef : (1 + ℓ * ((‖x‖ - 1) / ℓ)) / Real.exp ((‖x‖ - 1) / ℓ) *
        (Real.exp ((‖x‖ - 1) / ℓ) / ‖x‖) = 1 := by
      field_simp [hℓ.ne',he,hx'.ne']
      ring
    rw [hcoef, one_smul]
  · intro y hy
    have hy' : 0 < ‖y‖ := (Real.exp_pos _).trans (show Real.exp (-1 / ℓ) < ‖y‖ from hy)
    change (Real.exp ((‖ψ y‖ - 1) / ℓ) / ‖ψ y‖) •
        (((1 + ℓ * Real.log ‖y‖) / ‖y‖) • y) = y
    rw [hψ y hy, show (1 + ℓ * Real.log ‖y‖ - 1) / ℓ = Real.log ‖y‖ by
      field_simp [hℓ.ne']; ring, Real.exp_log hy', smul_smul]
    have hcoef : ‖y‖ / (1 + ℓ * Real.log ‖y‖) *
        ((1 + ℓ * Real.log ‖y‖) / ‖y‖) = 1 := by
      field_simp [(hψpos y hy).ne',hy'.ne']
    rw [hcoef, one_smul]
  · rw [contMDiffOn_iff_contDiffOn]
    intro x hx
    have hx' : 0 < ‖x‖ := hx
    have hn := contDiffAt_norm ℝ (norm_pos_iff.mp hx' : x ≠ 0) (n := ∞)
    exact (((((hn.sub contDiffAt_const).div_const ℓ).exp).div hn hx'.ne').smul
      contDiffAt_id).contDiffWithinAt
  · rw [contMDiffOn_iff_contDiffOn]
    intro y hy
    have hy' : 0 < ‖y‖ := (Real.exp_pos _).trans (show Real.exp (-1 / ℓ) < ‖y‖ from hy)
    have hn := contDiffAt_norm ℝ (norm_pos_iff.mp hy' : y ≠ 0) (n := ∞)
    exact (((contDiffAt_const.add (contDiffAt_const.mul (hn.log hy'.ne'))).div hn
      hy'.ne').smul contDiffAt_id).contDiffWithinAt

section Ambient

variable {H M : Type*} [TopologicalSpace H] [TopologicalSpace M] [ChartedSpace H M]
  [T2Space M] {I : ModelWithCorners ℝ E₄ H}

/-- The compactly supported ambient flow compresses a buffered part of the
original disk marking. It returns both smooth evaluation maps on the
original source and gives the exact inverse at every transported point. -/
theorem exists_nativeDiskCompressionFlow
    (F : PartialDiffeomorph I₄ I E₄ M ∞) {R B : ℝ} (hR : 0 < R) (hRB : R < B)
    (hBuffer : closedBall (0 : E₄) B ⊆ F.source) :
    ∃ J : ℝ → M ≃ₘ^∞⟮I,I⟯ M,
      ContMDiff (𝓘(ℝ).prod I) I ∞ (fun p : ℝ × M => J p.1 p.2) ∧
      ContMDiff (𝓘(ℝ).prod I) I ∞ (fun p : ℝ × M => (J p.1).symm p.2) ∧
      J 0 = Diffeomorph.refl I M ∞ ∧
      (∀ t, 0 ≤ t → ∀ x ∈ closedBall (0 : E₄) R,
        J t (F x) = F (Real.exp (-t) • x) ∧ (J t).symm (F (Real.exp (-t) • x)) = F x) ∧
      (∀ t, 0 ≤ t → ∀ r, 0 ≤ r → r ≤ R →
        J t '' (F '' closedBall (0 : E₄) r) = F '' closedBall (0 : E₄) (Real.exp (-t) * r) ∧
        J t '' (F '' ball (0 : E₄) r) = F '' ball (0 : E₄) (Real.exp (-t) * r) ∧
        J t '' (F '' sphere (0 : E₄) r) = F '' sphere (0 : E₄) (Real.exp (-t) * r)) ∧
      ∃ K : Set M, IsCompact K ∧ K ⊆ F '' ball (0 : E₄) B ∧
        ∀ t x, x ∉ K → J t x = x ∧ (J t).symm x = x := by
  have hOpen : IsOpen (F '' ball (0 : E₄) B) :=
    F.toOpenPartialHomeomorph.isOpen_image_of_subset_source isOpen_ball
      (ball_subset_closedBall.trans hBuffer)
  obtain ⟨J, hJ, hJi, h0, hrad, K, hK, hKB, _, hfix⟩ :=
    DifferentialGeometry.Topology.Manifold.exists_diffeomorphs_contracting_embedded_closedBall F hR
      ((closedBall_subset_closedBall hRB.le).trans hBuffer) hOpen
      (image_mono (closedBall_subset_ball hRB))
  refine ⟨J,hJ,hJi,h0,?_,?_,K,hK,hKB,hfix⟩
  · intro t ht x hx
    have h := hrad t x ht hx
    exact ⟨h,(congrArg (J t).symm h.symm).trans ((J t).symm_apply_apply (F x))⟩
  · intro t ht r hr hrR
    let c := Real.exp (-t)
    have hc : 0 < c := Real.exp_pos _
    have hcongr (s : Set E₄) (hs : s ⊆ closedBall (0 : E₄) R) :
        J t '' (F '' s) = F '' (c • s) := by
      rw [image_image]
      change (fun x => J t (F x)) '' s = F '' ((fun x : E₄ => c • x) '' s)
      rw [image_image]
      exact image_congr (fun x hx => hrad t x ht (hs hx))
    have hclose := closedBall_subset_closedBall hrR (x := (0 : E₄))
    refine ⟨?_,?_,?_⟩
    · rw [hcongr _ hclose, smul_closedBall c _ hr, smul_zero, Real.norm_of_nonneg hc.le]
    · rw [hcongr _ (ball_subset_closedBall.trans hclose), _root_.smul_ball hc.ne' _ _, smul_zero,
        Real.norm_of_nonneg hc.le]
    · rw [hcongr _ (sphere_subset_closedBall.trans hclose), smul_sphere c _ hr, smul_zero,
        Real.norm_of_nonneg hc.le]

/-- At the specified radius the closed disk, complete open interior and
complete exterior of the original source all have their exact images. The
normal marking on the buffered collar uses the original angular coordinate. -/
theorem exists_nativeDiskCompression
    (F : PartialDiffeomorph I₄ I E₄ M ∞) {R B b : ℝ} (hR : 1 < R) (hRB : R < B)
    (hBuffer : closedBall (0 : E₄) B ⊆ F.source) (hb : 0 < b) (hb₁ : b < 1) :
    ∃ J : M ≃ₘ^∞⟮I,I⟯ M,
      J '' selectedChartDisk F = F '' closedBall (0 : E₄) b ∧
      J '' (interior (selectedChartDisk F))ᶜ = (F '' ball (0 : E₄) b)ᶜ ∧
      (∀ x ∈ closedBall (0 : E₄) R, J (F x) = F (b • x) ∧ J.symm (F (b • x)) = F x) ∧
      ∀ x ∉ F '' ball (0 : E₄) B, J x = x ∧ J.symm x = x := by
  obtain ⟨J,_,_,_,hrad,hImage,K,_,hKB,hfix⟩ :=
    exists_nativeDiskCompressionFlow F (zero_lt_one.trans hR) hRB hBuffer
  have ht : 0 ≤ -Real.log b := neg_nonneg.mpr (Real.log_nonpos hb.le hb₁.le)
  obtain ⟨hc,ho,_⟩ := hImage (-Real.log b) ht 1 zero_le_one hR.le
  rw [neg_neg, Real.exp_log hb, mul_one] at hc ho
  refine ⟨J (-Real.log b),hc,?_,?_,fun x hx => hfix _ x (fun h => hx (hKB h))⟩
  · have h₁ : closedBall (0 : E₄) 1 ⊆ F.source :=
      (closedBall_subset_closedBall (hR.trans hRB).le).trans hBuffer
    rw [interior_selectedChartDisk F h₁]
    change (J (-Real.log b)).toEquiv '' (F '' ball (0 : E₄) 1)ᶜ = _
    rw [image_compl_eq (J (-Real.log b)).bijective]
    exact congrArg compl ho
  · intro x hx
    simpa only [neg_neg, Real.exp_log hb] using hrad (-Real.log b) ht x hx

/-- The same native disk compression with the physical Gaussian coordinate
on a full signed collar germ. Both directions preserve the original angle,
and the complete exterior is transported together with the closed disk. -/
theorem exists_nativeGaussianDiskCompression
    (F : PartialDiffeomorph I₄ I E₄ M ∞) {R B b ℓ : ℝ} (hR : 1 < R) (hRB : R < B)
    (hBuffer : closedBall (0 : E₄) B ⊆ F.source) (hb : 0 < b) (hb₁ : b < 1)
    (hℓ : 0 < ℓ) :
    ∃ (J : M ≃ₘ^∞⟮I,I⟯ M) (δ : ℝ), 0 < δ ∧
      J '' selectedChartDisk F = F '' closedBall (0 : E₄) b ∧
      J '' (interior (selectedChartDisk F))ᶜ = (F '' ball (0 : E₄) b)ᶜ ∧
      (∀ t, |t| < δ → ∀ y ∈ sphere (0 : E₄) 1,
        J (F ((1 + t) • y)) = F ((b * Real.exp (t / ℓ)) • y) ∧
        J.symm (F ((b * Real.exp (t / ℓ)) • y)) = F ((1 + t) • y)) ∧
      ∀ x ∉ F '' ball (0 : E₄) B, J x = x ∧ J.symm x = x := by
  let A := gaussianRadiusChange hℓ
  have hA (x : E₄) : A x = (Real.exp ((‖x‖ - 1) / ℓ) / ‖x‖) • x := rfl
  have hSA : sphere (0 : E₄) 1 ⊆ A.source := fun x hx => by
    change 0 < ‖x‖
    rw [mem_sphere_zero_iff_norm.mp hx]
    norm_num
  have hAfix : EqOn A id (sphere (0 : E₄) 1) := fun x hx => by
    rw [hA, mem_sphere_zero_iff_norm.mp hx]
    simp
  have hAmap : MapsTo A (closedBall (0 : E₄) 1 ∩ A.source) (closedBall (0 : E₄) 1) := by
    intro x hx
    have hx' : 0 < ‖x‖ := hx.2
    rw [mem_closedBall_zero_iff]
    rw [hA, norm_smul, Real.norm_of_nonneg (by positivity), div_mul_cancel₀ _ hx'.ne']
    exact Real.exp_le_one_iff.mpr (div_nonpos_of_nonpos_of_nonneg
      (sub_nonpos.mpr (mem_closedBall_zero_iff.mp hx.1)) hℓ.le)
  have hB : 1 < B := hR.trans hRB
  have hSO : sphere (0 : E₄) 1 ⊆ ball (0 : E₄) B :=
    sphere_subset_closedBall.trans (closedBall_subset_ball hB)
  obtain ⟨U,hU,hSU,_,P,hP,hPi,_,htrack,_,hPball,L,hL,hLB,hLfix⟩ :=
    A.exists_contDiff_compact_isotopy_eqOn_sphere_neighborhood zero_lt_one hSA hAfix hAmap
      isOpen_ball hSO
  obtain ⟨Q,_,_,hQ,_,_,hQfix⟩ :=
    DifferentialGeometry.Topology.Manifold.exists_diffeomorph_extension_of_partial_chart_family
      F.symm.toOpenPartialHomeomorph F.symm.contMDiffOn F.contMDiffOn P hP hPi hL
      (hLB.trans (ball_subset_closedBall.trans hBuffer))
      (fun t x hx => ⟨(hLfix t).1 hx,(hLfix t).2 hx⟩)
  have hQchart (x : E₄) (hx : x ∈ F.source) : Q 1 (F x) = F (P 1 x) := by
    classical
    rw [(hQ 1 (F x)).1]
    unfold DifferentialGeometry.Topology.Manifold.extendChartById
    change (if F x ∈ F.target then F (P 1 (F.symm (F x))) else F x) = _
    rw [ite_eq_left (F.map_source hx)]
    exact congrArg (fun z : E₄ => F (P 1 z)) (F.left_inv hx)
  have hQout (x : M) (hx : x ∉ F '' ball (0 : E₄) B) :
      Q 1 x = x ∧ (Q 1).symm x = x :=
    hQfix 1 x (fun hx' => hx (image_mono hLB hx'))
  have hPB : P 1 '' closedBall (0 : E₄) 1 = closedBall (0 : E₄) 1 :=
    hPball 1 ⟨zero_le_one,le_rfl⟩
  have hPO : P 1 '' ball (0 : E₄) 1 = ball (0 : E₄) 1 := by
    have he := (P 1).toHomeomorph.image_interior (closedBall (0 : E₄) 1)
    change P 1 '' interior (closedBall (0 : E₄) 1) =
      interior (P 1 '' closedBall (0 : E₄) 1) at he
    rwa [hPB, interior_closedBall'] at he
  have h₁ : closedBall (0 : E₄) 1 ⊆ F.source :=
    (closedBall_subset_closedBall hB.le).trans hBuffer
  have hQimage (s : Set E₄) (hs : s ⊆ F.source) (hPs : P 1 '' s = s) :
      Q 1 '' (F '' s) = F '' s := by
    calc
      Q 1 '' (F '' s) = F '' (P 1 '' s) := by
        rw [image_image, image_image]
        exact image_congr (fun x hx => hQchart x (hs hx))
      _ = F '' s := by rw [hPs]
  have hQD : Q 1 '' selectedChartDisk F = selectedChartDisk F := hQimage _ h₁ hPB
  have hQV : Q 1 '' (interior (selectedChartDisk F))ᶜ = (interior (selectedChartDisk F))ᶜ := by
    rw [interior_selectedChartDisk F h₁]
    change (Q 1).toEquiv '' (F '' ball (0 : E₄) 1)ᶜ = _
    rw [image_compl_eq (Q 1).bijective]
    exact congrArg compl (hQimage _ (ball_subset_closedBall.trans h₁) hPO)
  obtain ⟨C,hCD,hCV,hCrad,hCout⟩ := exists_nativeDiskCompression F hR hRB hBuffer hb hb₁
  obtain ⟨η,hη,hηU⟩ := (isCompact_sphere (0 : E₄) 1).exists_cthickening_subset_open hU hSU
  let δ : ℝ := min (1 / 2) (min η (min (B - 1) (ℓ * Real.log R)))
  have hδ : 0 < δ := lt_min (by norm_num) (lt_min hη
    (lt_min (sub_pos.mpr hB) (mul_pos hℓ (Real.log_pos hR))))
  refine ⟨(Q 1).trans C,δ,hδ,?_,?_,?_,?_⟩
  · change (fun x => C (Q 1 x)) '' selectedChartDisk F = _
    rw [← image_image, hQD, hCD]
  · change (fun x => C (Q 1 x)) '' (interior (selectedChartDisk F))ᶜ = _
    rw [← image_image, hQV, hCV]
  · intro t ht y hy
    have hn := mem_sphere_zero_iff_norm.mp hy
    have hhalf : |t| < 1 / 2 := ht.trans_le (min_le_left _ _)
    have htB : |t| < B - 1 := ht.trans_le ((min_le_right _ _).trans
      ((min_le_right _ _).trans (min_le_left _ _)))
    have htR : |t| < ℓ * Real.log R := ht.trans_le ((min_le_right _ _).trans
      ((min_le_right _ _).trans (min_le_right _ _)))
    have hpos : 0 < 1 + t := by linarith [(abs_lt.mp hhalf).1]
    have hnorm : ‖(1 + t) • y‖ = 1 + t := by rw [norm_smul, Real.norm_of_nonneg hpos.le, hn, mul_one]
    have hx : (1 + t) • y ∈ F.source := hBuffer (mem_closedBall_zero_iff.mpr (by
      rw [hnorm]
      linarith [le_abs_self t]))
    have hxU : (1 + t) • y ∈ U := hηU (mem_cthickening_of_dist_le _ y η _ hy (by
      rw [dist_eq_norm, show (1 + t) • y - y = t • y by rw [add_smul, one_smul, add_sub_cancel_left],
        norm_smul, Real.norm_eq_abs, hn, mul_one]
      exact (ht.trans_le ((min_le_right _ _).trans (min_le_left _ _))).le))
    have hExp : Real.exp (t / ℓ) < R := by
      rw [← Real.exp_log (zero_lt_one.trans hR), Real.exp_lt_exp, div_lt_iff₀ hℓ]
      linarith [le_abs_self t, mul_comm ℓ (Real.log R)]
    have hz : Real.exp (t / ℓ) • y ∈ closedBall (0 : E₄) R := by
      rw [mem_closedBall_zero_iff, norm_smul, Real.norm_of_nonneg (Real.exp_pos _).le, hn, mul_one]
      exact hExp.le
    have hNorm : A ((1 + t) • y) = Real.exp (t / ℓ) • y := by
      rw [hA, hnorm, smul_smul, show 1 + t - 1 = t by ring, div_mul_cancel₀ _ hpos.ne']
    have hf : ((Q 1).trans C) (F ((1 + t) • y)) = F ((b * Real.exp (t / ℓ)) • y) := by
      change C (Q 1 (F ((1 + t) • y))) = _
      rw [hQchart _ hx, htrack hxU, hNorm, (hCrad _ hz).1, smul_smul]
    exact ⟨hf,(congrArg ((Q 1).trans C).symm hf.symm).trans
      (((Q 1).trans C).symm_apply_apply _)⟩
  · intro x hx
    change C (Q 1 x) = x ∧ (Q 1).symm (C.symm x) = x
    simp only [(hQout x hx).1,(hCout x hx).1,(hCout x hx).2,(hQout x hx).2,and_self]

/-- The original unit-sphere marking as a map into the complete native
exterior, including the face. -/
def nativeDiskCapFace (F : PartialDiffeomorph I₄ I E₄ M ∞)
    (h₁ : closedBall (0 : E₄) 1 ⊆ F.source) :
    CellBoundary 4 → (interior (selectedChartDisk F))ᶜ := fun y =>
  ⟨F y, by
    rw [interior_selectedChartDisk F h₁]
    rintro ⟨x,hx,he⟩
    have he' := F.injOn (h₁ (ball_subset_closedBall hx)) (h₁ (sphere_subset_closedBall y.2)) he
    exact (not_lt_of_ge (mem_sphere_zero_iff_norm.mp y.2).ge)
      (mem_ball_zero_iff.mp (he' ▸ hx))⟩

/-- The closed exterior-cap adjunction using the original unit-sphere marking.
The realized exterior map is the ambient compression and the realized cap
map is its specified coordinate inclusion. Both inverse branches are exact. -/
theorem exists_nativeDiskExteriorCapClosure
    (F : PartialDiffeomorph I₄ I E₄ M ∞) (h₁ : closedBall (0 : E₄) 1 ⊆ F.source)
    {b : ℝ} (hb : 0 < b) (hb₁ : b ≤ 1) (J : M ≃ₘ^∞⟮I,I⟯ M)
    (hExterior : J '' (interior (selectedChartDisk F))ᶜ = (F '' ball (0 : E₄) b)ᶜ)
    (hFace : ∀ y ∈ sphere (0 : E₄) 1, J (F y) = F (b • y)) :
    ∃ G : CellAdjunctionSpace 4 (nativeDiskCapFace F h₁) ≃ₜ M,
      (∀ x : (interior (selectedChartDisk F))ᶜ,
        G (adjunctionLower (nativeDiskCapFace F h₁) x) = J x ∧
        G.symm (J x) = adjunctionLower (nativeDiskCapFace F h₁) x) ∧
      ∀ x : ClosedCell 4,
        G (adjunctionCell (cellBoundaryInclusion 4) (nativeDiskCapFace F h₁) x) =
          F (b • (x : E₄)) ∧
        G.symm (F (b • (x : E₄))) =
          adjunctionCell (cellBoundaryInclusion 4) (nativeDiskCapFace F h₁) x := by
  let V₀ := (interior (selectedChartDisk F))ᶜ
  let V := (F '' ball (0 : E₄) b)ᶜ
  let f : V₀ ≃ₜ V := (J.toHomeomorph.image V₀).trans (Homeomorph.setCongr hExterior)
  let φ₀ := nativeDiskCapFace F h₁
  let φ : CellBoundary 4 → V := f ∘ φ₀
  let c (x : ClosedCell 4) := F (b • (x : E₄))
  have hf (x : V₀) : (f x : M) = J x := rfl
  have hc₁ (x : ClosedCell 4) : b • (x : E₄) ∈ F.source := by
    apply h₁
    have hx := mem_closedBall_zero_iff.mp x.2
    rw [mem_closedBall_zero_iff, norm_smul, Real.norm_of_nonneg hb.le]
    exact (mul_le_of_le_one_right hb.le hx).trans hb₁
  have hφ (y : CellBoundary 4) : (φ y : M) = c (cellBoundaryInclusion 4 y) :=
    hFace y y.2
  have hc : Function.Injective c := by
    intro x y he
    have he' := F.injOn (hc₁ x) (hc₁ y) he
    apply Subtype.ext
    have hrecover (z : E₄) : b⁻¹ • (b • z) = z := by
      rw [smul_smul, inv_mul_cancel₀ hb.ne', one_smul]
    exact (hrecover x).symm.trans ((congrArg (b⁻¹ • ·) he').trans (hrecover y))
  have hcont : Continuous c := by
    exact F.contMDiffOn.continuousOn.comp_continuous
      (continuous_const.smul continuous_subtype_val) hc₁
  have hboundary (d : ClosedCell 4) (hd : c d ∈ V) : d ∈ range (cellBoundaryInclusion 4) := by
    have hle := mem_closedBall_zero_iff.mp d.2
    have hnot : ¬ ‖(d : E₄)‖ < 1 := fun hlt => hd ⟨b • (d : E₄), by
      rw [mem_ball_zero_iff, norm_smul, Real.norm_of_nonneg hb.le]
      simpa only [mul_one] using (mul_lt_mul_of_pos_left hlt hb), rfl⟩
    exact ⟨⟨d,mem_sphere_zero_iff_norm.mpr (le_antisymm hle (le_of_not_gt hnot))⟩,
      Subtype.ext rfl⟩
  have hclosed : IsClosed V := (F.toOpenPartialHomeomorph.isOpen_image_of_subset_source
    isOpen_ball (ball_subset_closedBall.trans ((closedBall_subset_closedBall hb₁).trans h₁))).isClosed_compl
  have hu : V ∪ range c = univ := by
    classical
    apply eq_univ_of_forall
    intro m
    by_cases hm : m ∈ V
    · exact Or.inl hm
    · obtain ⟨x,hx,rfl⟩ := not_not.mp (show ¬ ¬ (m ∈ F '' ball (0 : E₄) b) from hm)
      have hcell : b⁻¹ • x ∈ closedBall (0 : E₄) 1 := by
        rw [mem_closedBall_zero_iff, norm_smul, Real.norm_of_nonneg (inv_nonneg.mpr hb.le), ← div_eq_inv_mul]
        exact (div_le_iff₀ hb).mpr (by simpa only [one_mul] using (mem_ball_zero_iff.mp hx).le)
      refine Or.inr ⟨⟨b⁻¹ • x,hcell⟩,?_⟩
      change F (b • (b⁻¹ • x)) = F x
      rw [smul_smul, mul_inv_cancel₀ hb.ne', one_smul]
  let A := adjunctionHomeomorph (cellBoundaryInclusion 4) φ₀ (cellBoundaryInclusion 4) φ
    (Equiv.refl _) (Homeomorph.refl _) f (fun _ => rfl) (fun _ => rfl)
  let C := adjunctionHomeomorphUnionImage (cellBoundaryInclusion 4) φ c hφ hc hcont hboundary hclosed
  let G := A.trans (C.trans ((Homeomorph.setCongr hu).trans (Homeomorph.Set.univ M)))
  refine ⟨G,?_,?_⟩
  · intro x
    have he : G (adjunctionLower φ₀ x) = J x := by
      change (C (adjunctionLower φ (f x)) : M) = J x
      rw [adjunctionHomeomorphUnionImage_lower]
      exact hf x
    exact ⟨he,(congrArg G.symm he.symm).trans (G.symm_apply_apply _)⟩
  · intro x
    have he : G (adjunctionCell (cellBoundaryInclusion 4) φ₀ x) = c x := rfl
    exact ⟨he,(congrArg G.symm he.symm).trans (G.symm_apply_apply _)⟩

end Ambient

end

end SmoothPoincare
