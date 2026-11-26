import SmoothPoincare.Heights.StandardSurgeryModel

/-! # Smoothness of the marked one-pair assembly -/

set_option autoImplicit false

noncomputable section

open Set Manifold
open scoped ContDiff Manifold
open SmoothPoincare.StandardSurgeryModel

namespace SmoothPoincare

/-- The marked common boundary of the standard one-pair product pieces. -/
abbrev OnePairSeam := BoundarySphere 1 × BoundarySphere 2

/-- The split round four-sphere of the standard one-pair product model. -/
abbrev OnePairRoundSphere := RoundSphere 1 2

local instance : Fact (Module.finrank ℝ (Ambient 1 2) = 4 + 1) := ⟨by
  rw [(WithLp.prodContinuousLinearEquiv 2 ℝ (Block 1) (Block 2)).toLinearEquiv.finrank_eq,
    Module.finrank_prod]
  simp⟩

/-- Points in the interior of the disk–sphere piece. -/
def onePairLeftInterior : Set OnePairRoundSphere := {z | seamParameter z < 0}

/-- Points in the interior of the sphere–disk piece. -/
def onePairRightInterior : Set OnePairRoundSphere := {z | 0 < seamParameter z}

private theorem continuous_onePairSeamParameter :
    Continuous (seamParameter : OnePairRoundSphere → ℝ) :=
  (((WithLp.continuous_fst).comp continuous_subtype_val).norm.pow 2).sub continuous_const

private theorem isOpen_onePairLeftInterior : IsOpen onePairLeftInterior :=
  isOpen_lt continuous_onePairSeamParameter continuous_const

private theorem isOpen_onePairRightInterior : IsOpen onePairRightInterior :=
  isOpen_lt continuous_const continuous_onePairSeamParameter

private theorem onePair_mem_seamTarget {z : OnePairRoundSphere} {r : ℝ} (hr : r ≤ 1 / 2)
    (hz : seamParameter z ∈ Ioo (-r) r) : z ∈ seamTarget := by
  have hnorm : ‖z.val.fst‖ ^ 2 + ‖z.val.snd‖ ^ 2 = 1 := by
    rw [← WithLp.prod_norm_sq_eq_of_L2, norm_eq_of_mem_sphere z]
    norm_num
  have hlow := hz.1
  have hhigh := hz.2
  unfold seamParameter at hlow hhigh
  have hfst : 0 < ‖z.val.fst‖ ^ 2 := by linarith
  have hsnd : 0 < ‖z.val.snd‖ ^ 2 := by linarith
  exact ⟨fun h => by simp [h] at hfst, fun h => by simp [h] at hsnd⟩

section Marked

variable {E H EB HB M B : Type*}
  [NormedAddCommGroup E] [NormedSpace ℝ E] [TopologicalSpace H]
  [TopologicalSpace M] [ChartedSpace H M]
  [NormedAddCommGroup EB] [NormedSpace ℝ EB] [TopologicalSpace HB]
  [TopologicalSpace B] [ChartedSpace HB B]
  {I : ModelWithCorners ℝ E H} {IB : ModelWithCorners ℝ EB HB}

/-- A marked homeomorphism to the round one-pair assembly is a diffeomorphism
when both interior maps are smooth and its germ on a full signed collar is
the product of the seam diffeomorphism and the identity in the normal coordinate. -/
def diffeomorphOfSmoothMarkedSeam
    (h : M ≃ₜ OnePairRoundSphere)
    (collar : PartialDiffeomorph (IB.prod 𝓘(ℝ, ℝ)) I (B × ℝ) M ∞)
    (mark : B ≃ₘ^∞⟮IB, (𝓡 1).prod (𝓡 2)⟯ OnePairSeam)
    (u : BoundarySphere 1) (v : BoundarySphere 2)
    {r : ℝ} (hr : 0 < r) (hrmax : r ≤ 1 / 2)
    (hsource : collar.source = {p | p.2 ∈ Ioo (-r) r})
    (hproduct : ∀ p ∈ collar.source,
      h (collar p) = seamChart u v (mark p.1, p.2))
    (hleft : ContMDiffOn I (𝓡 4) ∞ h (h ⁻¹' onePairLeftInterior))
    (hright : ContMDiffOn I (𝓡 4) ∞ h (h ⁻¹' onePairRightInterior))
    (hleftInv : ContMDiffOn (𝓡 4) I ∞ h.symm onePairLeftInterior)
    (hrightInv : ContMDiffOn (𝓡 4) I ∞ h.symm onePairRightInterior) :
    M ≃ₘ^∞⟮I, 𝓡 4⟯ OnePairRoundSphere := by
  let standard := seamChart u v
  let product := (mark.prodCongr (Diffeomorph.refl 𝓘(ℝ, ℝ) ℝ ∞)).toPartialDiffeomorph
  let Φ := collar.symm.trans (product.trans standard)
  have hΦsource : Φ.source = collar.target := by
    ext x
    change (x ∈ collar.target ∧ collar.symm x ∈ Set.univ ∧
      (mark (collar.symm x).1, (collar.symm x).2) ∈ standard.source) ↔ x ∈ collar.target
    refine ⟨And.left, fun hx => ⟨hx, mem_univ _, ?_⟩⟩
    have hp := collar.toPartialEquiv.map_target hx
    rw [hsource] at hp
    change -(1 / 2) < (collar.symm x).2 ∧ (collar.symm x).2 < 1 / 2
    exact ⟨by linarith [hp.1], by linarith [hp.2]⟩
  have hforward : EqOn h Φ Φ.source := by
    intro x hx
    rw [hΦsource] at hx
    change h x = standard (mark (collar.symm x).1, (collar.symm x).2)
    rw [← collar.toPartialEquiv.right_inv hx]
    rw [collar.toPartialEquiv.left_inv (collar.toPartialEquiv.map_target hx)]
    exact hproduct _ (collar.toPartialEquiv.map_target hx)
  have hbackward : EqOn h.symm Φ.symm Φ.target := by
    intro z hz
    have hx := Φ.toPartialEquiv.map_target hz
    apply h.injective
    rw [h.apply_symm_apply, hforward hx, Φ.toPartialEquiv.right_inv hz]
  have hcovered {z : OnePairRoundSphere} (hz : seamParameter z ∈ Ioo (-r) r) :
      z ∈ Φ.target := by
    have hzStd : z ∈ standard.target := onePair_mem_seamTarget hrmax hz
    let q : B × ℝ := (mark.symm (standard.symm z).1, seamParameter z)
    have hq : q ∈ collar.source := by rw [hsource]; exact hz
    have hmark : (mark q.1, q.2) = standard.symm z := by
      apply Prod.ext
      · exact mark.apply_symm_apply _
      · rfl
    have hx : collar q ∈ Φ.source := by
      rw [hΦsource]
      exact collar.toPartialEquiv.map_source hq
    have hxc : Φ (collar q) = z := by
      change standard (mark (collar.symm (collar q)).1, (collar.symm (collar q)).2) = z
      rw [collar.toPartialEquiv.left_inv hq, hmark]
      exact standard.toPartialEquiv.right_inv hzStd
    exact hxc ▸ Φ.toPartialEquiv.map_source hx
  have hzero {z : OnePairRoundSphere} (hz : seamParameter z = 0) : z ∈ Φ.target := by
    apply hcovered
    rw [hz]
    exact ⟨neg_lt_zero.mpr hr, hr⟩
  refine { toEquiv := h.toEquiv, contMDiff_toFun := ?_, contMDiff_invFun := ?_ }
  · change ContMDiff I (𝓡 4) ∞ h
    intro x
    rcases lt_trichotomy (seamParameter (h x)) 0 with hneg | hzero' | hpos
    · exact hleft.contMDiffAt ((isOpen_onePairLeftInterior.preimage h.continuous).mem_nhds hneg)
    · have hy := hzero hzero'
      have hx : x ∈ Φ.source := by
        rw [← h.symm_apply_apply x, hbackward hy]
        exact Φ.toPartialEquiv.map_target hy
      exact (Φ.contMDiffOn.congr hforward).contMDiffAt (Φ.open_source.mem_nhds hx)
    · exact hright.contMDiffAt ((isOpen_onePairRightInterior.preimage h.continuous).mem_nhds hpos)
  · change ContMDiff (𝓡 4) I ∞ h.symm
    intro z
    rcases lt_trichotomy (seamParameter z) 0 with hneg | hzero' | hpos
    · exact hleftInv.contMDiffAt (isOpen_onePairLeftInterior.mem_nhds hneg)
    · exact (Φ.symm.contMDiffOn.congr hbackward).contMDiffAt
        (Φ.open_target.mem_nhds (hzero hzero'))
    · exact hrightInv.contMDiffAt (isOpen_onePairRightInterior.mem_nhds hpos)

end Marked

end SmoothPoincare
