import SmoothPoincare.Heights.HMPRelativeClosing
import DifferentialGeometry.Topology.Manifold.InverseFunctionTheorem.Parametric
import Mathlib.Analysis.InnerProductSpace.Calculus
import Mathlib.Analysis.SpecialFunctions.SmoothTransition

/-! # A supported shrink of all the disk parameters of the retained HMP tube -/

noncomputable section
open Set Function Metric Manifold
open DifferentialGeometry
open DifferentialGeometry.PDE.RicciFlow.Surgery.Topology
open scoped ContDiff Manifold Topology RealInnerProductSpace

namespace SmoothPoincare.HMP

local notation "V" => StandardSurgeryModel.Block 1
local notation "IV" => 𝓘(ℝ, V)
local notation "IVT" => ModelWithCorners.prod IV (𝓘(ℝ, ℝ))
local notation "C₁" => StandardSurgeryModel.BoundarySphere 1
local notation "Tube" => C₁ × V
local notation "IT" => ModelWithCorners.prod (𝓡 1) IV

/-- The multiplier is smooth in both variables and nondecreasing in the
squared disk radius. The time cutoff makes the family smooth on all real times. -/
def framedShrinkFactor (t a : ℝ) : ℝ :=
  1 - (7 / 8) * Real.smoothTransition t * (1 - Real.smoothTransition ((a - 1) / 3))

theorem framedShrinkFactor_bounds (t a : ℝ) :
    1 / 8 ≤ framedShrinkFactor t a ∧ framedShrinkFactor t a ≤ 1 := by
  have ht := Real.smoothTransition.nonneg t
  have ht' := Real.smoothTransition.le_one t
  have ha := Real.smoothTransition.nonneg ((a - 1) / 3)
  have ha' := Real.smoothTransition.le_one ((a - 1) / 3)
  have h : Real.smoothTransition t * (1 - Real.smoothTransition ((a - 1) / 3)) ≤ 1 := by
    simpa using mul_le_mul ht' (sub_le_self _ ha) (sub_nonneg.mpr ha') zero_le_one
  have h' := mul_nonneg ht (sub_nonneg.mpr ha')
  constructor <;> unfold framedShrinkFactor <;> linarith only [h, h']

private theorem framedShrinkFactor_pos (t a : ℝ) : 0 < framedShrinkFactor t a :=
  (by norm_num : (0 : ℝ) < 1 / 8).trans_le (framedShrinkFactor_bounds t a).1

private theorem framedShrinkFactor_monotone (t : ℝ) : Monotone (framedShrinkFactor t) := by
  intro a b hab
  have h := Real.smoothTransition.monotone (show (a - 1) / 3 ≤ (b - 1) / 3 by linarith)
  unfold framedShrinkFactor
  gcongr
  exact mul_nonneg (by norm_num) (Real.smoothTransition.nonneg t)

private theorem framedShrinkFactor_smooth : ContDiff ℝ ∞ (fun p : ℝ × ℝ => framedShrinkFactor p.1 p.2) := by
  unfold framedShrinkFactor
  exact contDiff_const.sub ((contDiff_const.mul
    (Real.smoothTransition.contDiff.comp contDiff_fst)).mul
      (contDiff_const.sub (Real.smoothTransition.contDiff.comp
        ((contDiff_snd.sub contDiff_const).div_const 3))))

private theorem framedShrinkFactor_smooth_slice (t : ℝ) : ContDiff ℝ ∞ (framedShrinkFactor t) :=
  framedShrinkFactor_smooth.comp (contDiff_const.prodMk contDiff_id)

private theorem framedShrinkFactor_outer (t : ℝ) {a : ℝ} (ha : 4 ≤ a) :
    framedShrinkFactor t a = 1 := by
  simp [framedShrinkFactor, Real.smoothTransition.one_of_one_le (by linarith : 1 ≤ (a - 1) / 3)]

def framedDiskShrink (t : ℝ) (w : V) : V := framedShrinkFactor t (‖w‖ ^ 2) • w

theorem framedDiskShrink_zero (w : V) : framedDiskShrink 0 w = w := by
  simp [framedDiskShrink, framedShrinkFactor, Real.smoothTransition.zero]

theorem framedDiskShrink_one {w : V} (hw : ‖w‖ ≤ 1) :
    framedDiskShrink 1 w = (1 / 8 : ℝ) • w := by
  have h : (‖w‖ ^ 2 - 1) / 3 ≤ 0 := by nlinarith [norm_nonneg w]
  unfold framedDiskShrink framedShrinkFactor
  rw [Real.smoothTransition.one, Real.smoothTransition.zero_of_nonpos h]
  norm_num

theorem framedDiskShrink_outer (t : ℝ) {w : V} (hw : 2 ≤ ‖w‖) :
    framedDiskShrink t w = w := by
  rw [framedDiskShrink, framedShrinkFactor_outer t (by nlinarith), one_smul]

private theorem framedDiskShrink_smooth :
    ContDiff ℝ ∞ (fun p : V × ℝ => framedDiskShrink p.2 p.1) := by
  exact (framedShrinkFactor_smooth.comp (contDiff_snd.prodMk
    ((contDiff_norm_sq ℝ).comp contDiff_fst))).smul contDiff_fst

private theorem framedRadius_strictMono (t : ℝ) :
    StrictMonoOn (fun r : ℝ => r * framedShrinkFactor t (r ^ 2)) (Ici 0) := by
  intro r hr s hs hrs
  have hSq : r ^ 2 ≤ s ^ 2 := pow_le_pow_left₀ hr hrs.le 2
  exact (mul_lt_mul_of_pos_right hrs (framedShrinkFactor_pos _ _)).trans_le
    (mul_le_mul_of_nonneg_left (framedShrinkFactor_monotone t hSq) hs)

private theorem framedDiskShrink_bijective (t : ℝ) : Bijective (framedDiskShrink t) := by
  have hNorm (x : V) : ‖framedDiskShrink t x‖ = ‖x‖ * framedShrinkFactor t (‖x‖ ^ 2) := by
    rw [framedDiskShrink, norm_smul, Real.norm_of_nonneg (framedShrinkFactor_pos _ _).le, mul_comm]
  constructor
  · intro v w h
    have hn := congrArg norm h
    rw [hNorm, hNorm] at hn
    have hEq := (framedRadius_strictMono t).injOn (norm_nonneg v) (norm_nonneg w) hn
    unfold framedDiskShrink at h
    rw [hEq] at h
    exact smul_right_injective V (framedShrinkFactor_pos t (‖w‖ ^ 2)).ne' h
  · intro y
    let R := max (2 : ℝ) ‖y‖
    let u := fun r : ℝ => r * framedShrinkFactor t (r ^ 2)
    have hR : 2 ≤ R := le_max_left _ _
    have hR' : 0 ≤ R := by linarith
    have hu : Continuous u :=
      continuous_id.mul ((framedShrinkFactor_smooth_slice t).continuous.comp (continuous_id.pow 2))
    have h0 : u 0 = 0 := zero_mul _
    have hRval : u R = R := by
      change R * framedShrinkFactor t (R ^ 2) = R
      rw [framedShrinkFactor_outer t (by nlinarith), mul_one]
    have hy : ‖y‖ ∈ Icc (u 0) (u R) := by
      rw [h0, hRval]
      exact ⟨norm_nonneg _, le_max_right _ _⟩
    obtain ⟨r, hr, hval⟩ := intermediate_value_Icc hR' hu.continuousOn hy
    let a := framedShrinkFactor t (r ^ 2)
    have ha : 0 < a := framedShrinkFactor_pos _ _
    let x := a⁻¹ • y
    have hx : ‖x‖ = r := by
      rw [norm_smul, Real.norm_of_nonneg (inv_nonneg.mpr ha.le)]
      change r * a = ‖y‖ at hval
      rw [← hval]
      field_simp
    exact ⟨x, by rw [framedDiskShrink, hx]; exact smul_inv_smul₀ ha.ne' _⟩

private theorem framedDiskShrink_fderiv_injective (t : ℝ) (x : V) :
    Injective (fderiv ℝ (framedDiskShrink t) x) := by
  let a := framedShrinkFactor t (‖x‖ ^ 2)
  let d := deriv (framedShrinkFactor t) (‖x‖ ^ 2)
  have ha : 0 < a := framedShrinkFactor_pos _ _
  have hd : 0 ≤ d := (framedShrinkFactor_monotone t).deriv_nonneg
  have hφ := ((framedShrinkFactor_smooth_slice t).differentiable (by simp) (‖x‖ ^ 2)).hasDerivAt
  have hsq := (hasFDerivAt_id x).norm_sq
  have hD := (hφ.hasFDerivAt.comp x hsq).smul (hasFDerivAt_id x)
  apply LinearMap.ker_eq_bot.mp
  apply le_bot_iff.mp
  intro v hv
  have hv0 : (fderiv ℝ (framedDiskShrink t) x) v = 0 := hv
  rw [show fderiv ℝ (framedDiskShrink t) x = _ from hD.fderiv] at hv0
  simp only [add_apply, smul_apply,
    ContinuousLinearMap.id_apply, ContinuousLinearMap.smulRight_apply,
    ContinuousLinearMap.comp_apply, ContinuousLinearMap.toSpanSingleton_apply,
    innerSL_apply_apply, Function.comp_apply, id, smul_eq_mul, two_smul] at hv0
  change a • v + ((⟪x, v⟫ + ⟪x, v⟫) * d) • x = 0 at hv0
  have h := congrArg (inner ℝ v) hv0
  rw [inner_add_right, real_inner_smul_right, real_inner_smul_right, real_inner_self_eq_norm_sq,
    inner_zero_right] at h
  simp only [real_inner_comm x v] at h
  have hsum : 0 ≤ 2 * ⟪x, v⟫ ^ 2 * d := by positivity
  have hn : a * ‖v‖ ^ 2 = 0 := by nlinarith [mul_nonneg ha.le (sq_nonneg ‖v‖)]
  exact (Submodule.mem_bot ℝ).mpr (norm_eq_zero.mp (sq_eq_zero_iff.mp
    ((mul_eq_zero.mp hn).resolve_left ha.ne')))

private theorem framedDiskShrink_graph_local :
    IsLocalDiffeomorph IVT IVT ∞ (fun p : V × ℝ => (framedDiskShrink p.2 p.1, p.2)) := by
  rintro ⟨x, t⟩
  have hf : ContMDiffOn IVT IV ∞ (fun p : V × ℝ => framedDiskShrink p.2 p.1)
      ((univ : Set V) ×ˢ (univ : Set ℝ)) := by
    rw [univ_prod_univ, ← modelWithCornersSelf_prod, chartedSpaceSelf_prod]
    exact framedDiskShrink_smooth.contMDiff.contMDiffOn
  apply Coordinates.isLocalDiffeomorphAt_parameter_graph_of_slice_mfderiv_injective
    isOpen_univ (mem_univ x) isOpen_univ (mem_univ t) hf
  rw [mfderiv_eq_fderiv]
  exact (NormedSpace.fromTangentSpace (𝕜 := ℝ) (framedDiskShrink t x)).symm.injective.comp
    ((framedDiskShrink_fderiv_injective t x).comp
      (NormedSpace.fromTangentSpace (𝕜 := ℝ) x).injective)

private def framedDiskShrinkGraph : Diffeomorph IVT IVT (V × ℝ) (V × ℝ) ∞ :=
  framedDiskShrink_graph_local.diffeomorphOfBijective (by
    refine ⟨?_, ?_⟩
    · rintro ⟨v, t⟩ ⟨w, s⟩ h
      have he : t = s := congrArg Prod.snd h
      subst s
      exact Prod.ext ((framedDiskShrink_bijective t).injective (congrArg Prod.fst h)) rfl
    · rintro ⟨y, t⟩
      obtain ⟨v, hv⟩ := (framedDiskShrink_bijective t).surjective y
      exact ⟨(v, t), Prod.ext hv rfl⟩)

private theorem framedDiskShrinkGraph_symm_time (p : V × ℝ) :
    (framedDiskShrinkGraph.symm p).2 = p.2 := by
  have h := congrArg Prod.snd (framedDiskShrinkGraph.apply_symm_apply p)
  exact h

/-- A smooth isotopy on the whole disk parameter plane, with a jointly smooth inverse. -/
def framedDiskUnshrink (t : ℝ) (w : V) : V := (framedDiskShrinkGraph.symm (w, t)).1

theorem framedDiskShrink_contMDiff :
    ContMDiff IVT IV ∞ (fun p : V × ℝ => framedDiskShrink p.2 p.1) :=
  contMDiff_fst.comp framedDiskShrinkGraph.contMDiff_toFun

theorem framedDiskUnshrink_contMDiff :
    ContMDiff IVT IV ∞ (fun p : V × ℝ => framedDiskUnshrink p.2 p.1) :=
  contMDiff_fst.comp framedDiskShrinkGraph.contMDiff_invFun

theorem framedDiskUnshrink_shrink (t : ℝ) (w : V) :
    framedDiskUnshrink t (framedDiskShrink t w) = w :=
  congrArg Prod.fst (framedDiskShrinkGraph.symm_apply_apply (w, t))

theorem framedDiskShrink_unshrink (t : ℝ) (w : V) :
    framedDiskShrink t (framedDiskUnshrink t w) = w := by
  have h := congrArg Prod.fst (framedDiskShrinkGraph.apply_symm_apply (w, t))
  change framedDiskShrink (framedDiskShrinkGraph.symm (w, t)).2
    (framedDiskShrinkGraph.symm (w, t)).1 = w at h
  simpa only [framedDiskShrinkGraph_symm_time, framedDiskUnshrink] using h

theorem framedDiskUnshrink_outer (t : ℝ) {w : V} (hw : 2 ≤ ‖w‖) :
    framedDiskUnshrink t w = w := by
  conv_lhs => rw [← framedDiskShrink_outer t hw]
  exact framedDiskUnshrink_shrink t w

theorem framedDiskUnshrink_one {w : V} (hw : ‖w‖ ≤ 1) :
    framedDiskUnshrink 1 ((1 / 8 : ℝ) • w) = w := by
  rw [← framedDiskShrink_one hw, framedDiskUnshrink_shrink]

section Ambient

open Filter

variable {X : Type*} [TopologicalSpace X] [ChartedSpace ThreeSpace X]

/-- A common cutoff for the two directions of the isotopy. -/
def framedTubeExtension (T : PartialDiffeomorph IT ThreeModel Tube X ∞)
    (d : ℝ → V → V) (t : ℝ) (x : X) : X := by
  classical
  exact if x ∈ T.target then T ((T.symm x).1, d t (T.symm x).2) else x

private theorem framedTubeExtension_in_source
    (T : PartialDiffeomorph IT ThreeModel Tube X ∞)
    (hT : ∀ p : Tube, ‖p.2‖ ≤ 2 → p ∈ T.source) (d : ℝ → V → V)
    (hout : ∀ t w, 2 ≤ ‖w‖ → d t w = w) (t : ℝ)
    (hball : ∀ w, ‖w‖ ≤ 2 → ‖d t w‖ ≤ 2) {p : Tube} (hp : p ∈ T.source) :
    (p.1, d t p.2) ∈ T.source := by
  by_cases h : ‖p.2‖ ≤ 2
  · exact hT _ (hball _ h)
  · simpa only [hout t p.2 (le_of_lt (lt_of_not_ge h)), Prod.eta] using hp

theorem framedTubeExtension_apply (T : PartialDiffeomorph IT ThreeModel Tube X ∞)
    (d : ℝ → V → V) (t : ℝ) {p : Tube} (hp : p ∈ T.source) :
    framedTubeExtension T d t (T p) = T (p.1, d t p.2) := by
  unfold framedTubeExtension
  have h : T.symm.toPartialEquiv (T p) = p := T.left_inv hp
  rw [ite_eq_left (T.map_source hp), h]

/-- The extension fixes the complement of the image of the whole closed
radius-two tube. -/
theorem framedTubeExtension_fixed (T : PartialDiffeomorph IT ThreeModel Tube X ∞)
    (d : ℝ → V → V) (hout : ∀ t w, 2 ≤ ‖w‖ → d t w = w) (t : ℝ) {x : X}
    (hx : x ∉ T '' {p : Tube | ‖p.2‖ ≤ 2}) : framedTubeExtension T d t x = x := by
  unfold framedTubeExtension
  split_ifs with hxt
  · have hr : 2 ≤ ‖(T.symm x).2‖ := by
      by_contra! hn
      exact hx ⟨T.symm x, hn.le, T.right_inv hxt⟩
    rw [hout t _ hr, Prod.eta]
    exact T.right_inv hxt
  · rfl

private theorem framedTubeExtension_contMDiff [T2Space X]
    (T : PartialDiffeomorph IT ThreeModel Tube X ∞)
    (hT : ∀ p : Tube, ‖p.2‖ ≤ 2 → p ∈ T.source) (d : ℝ → V → V)
    (hout : ∀ t w, 2 ≤ ‖w‖ → d t w = w)
    (hball : ∀ t w, ‖w‖ ≤ 2 → ‖d t w‖ ≤ 2)
    (hd : ContMDiff IVT IV ∞ (fun p : V × ℝ => d p.2 p.1)) :
    ContMDiff (ThreeModel.prod 𝓘(ℝ, ℝ)) ThreeModel ∞
      (fun p : X × ℝ => framedTubeExtension T d p.2 p.1) := by
  let K : Set X := T '' {p : Tube | ‖p.2‖ ≤ 2}
  have hK : IsClosed K := by
    have : CompactSpace C₁ := isCompact_iff_compactSpace.mp (isCompact_sphere _ _)
    have hprod : IsCompact ((univ : Set C₁) ×ˢ closedBall (0 : V) 2) :=
      isCompact_univ.prod (isCompact_closedBall _ _)
    have hset : {p : Tube | ‖p.2‖ ≤ 2} = (univ : Set C₁) ×ˢ closedBall (0 : V) 2 := by
      ext p
      simp [dist_zero_right]
    have hc : IsCompact {p : Tube | ‖p.2‖ ≤ 2} := hset ▸ hprod
    exact (hc.image_of_continuousOn (T.contMDiffOn_toFun.continuousOn.mono hT)).isClosed
  intro p
  by_cases hp : p.1 ∈ T.target
  · let U : Set (X × ℝ) := Prod.fst ⁻¹' T.target
    have hU : IsOpen U := T.open_target.preimage continuous_fst
    have hcoord : ContMDiffOn (ThreeModel.prod 𝓘(ℝ, ℝ)) IT ∞
        (fun q : X × ℝ => T.symm q.1) U :=
      T.contMDiffOn_invFun.comp contMDiffOn_fst (fun _ h => h)
    have hchange : ContMDiffOn (ThreeModel.prod 𝓘(ℝ, ℝ)) IT ∞
        (fun q : X × ℝ => ((T.symm q.1).1, d q.2 (T.symm q.1).2)) U :=
      (contMDiff_fst.comp_contMDiffOn hcoord).prodMk
        (hd.comp_contMDiffOn ((contMDiff_snd.comp_contMDiffOn hcoord).prodMk
          contMDiffOn_snd))
    have hg := T.contMDiffOn_toFun.comp hchange (fun q hq =>
      framedTubeExtension_in_source T hT d hout q.2 (hball q.2) (T.map_target hq))
    apply (hg.contMDiffAt (hU.mem_nhds hp)).congr_of_eventuallyEq
    filter_upwards [hU.mem_nhds hp] with q hq
    exact ite_eq_left hq
  · have hpK : p.1 ∉ K := by
      rintro ⟨q, hq, he⟩
      exact hp (he ▸ T.map_source (hT q hq))
    apply contMDiffAt_fst.congr_of_eventuallyEq
    filter_upwards [(hK.isOpen_compl.preimage continuous_fst).mem_nhds hpK] with q hq
    exact framedTubeExtension_fixed T d hout q.2 hq

private theorem framedDiskShrink_closedBall (t : ℝ) (w : V) (hw : ‖w‖ ≤ 2) :
    ‖framedDiskShrink t w‖ ≤ 2 := by
  rw [framedDiskShrink, norm_smul, Real.norm_of_nonneg (framedShrinkFactor_pos _ _).le]
  exact (mul_le_of_le_one_left (norm_nonneg w) (framedShrinkFactor_bounds _ _).2).trans hw

private theorem framedDiskUnshrink_closedBall (t : ℝ) (w : V) (hw : ‖w‖ ≤ 2) :
    ‖framedDiskUnshrink t w‖ ≤ 2 := by
  by_contra! h
  have he := framedDiskShrink_outer t h.le
  rw [framedDiskShrink_unshrink] at he
  exact h.not_ge (he ▸ hw)

/-- Each time slice of the ambient isotopy is a diffeomorphism of the actual
three-manifold with the specified retained tube. -/
def retainedTubeShrink [T2Space X]
    (T : PartialDiffeomorph IT ThreeModel Tube X ∞)
    (hT : ∀ p : Tube, ‖p.2‖ ≤ 2 → p ∈ T.source) (t : ℝ) :
    Diffeomorph ThreeModel ThreeModel X X ∞ where
  toFun := framedTubeExtension T framedDiskShrink t
  invFun := framedTubeExtension T framedDiskUnshrink t
  left_inv x := by
    by_cases hx : x ∈ T.target
    · let p : Tube := T.symm x
      have hp : p ∈ T.source := T.map_target hx
      have hstep : (p.1, framedDiskShrink t p.2) ∈ T.source :=
        framedTubeExtension_in_source T hT _ (fun _ _ h => framedDiskShrink_outer _ h)
          t (framedDiskShrink_closedBall t) hp
      rw [show framedTubeExtension T framedDiskShrink t x = T (p.1, framedDiskShrink t p.2)
        from ite_eq_left hx, framedTubeExtension_apply T framedDiskUnshrink t hstep]
      change T (p.1, framedDiskUnshrink t (framedDiskShrink t p.2)) = x
      rw [framedDiskUnshrink_shrink, Prod.eta]
      exact T.right_inv hx
    · simp [framedTubeExtension, hx]
  right_inv x := by
    by_cases hx : x ∈ T.target
    · let p : Tube := T.symm x
      have hp : p ∈ T.source := T.map_target hx
      have hstep : (p.1, framedDiskUnshrink t p.2) ∈ T.source :=
        framedTubeExtension_in_source T hT _ (fun _ _ h => framedDiskUnshrink_outer _ h)
          t (framedDiskUnshrink_closedBall t) hp
      rw [show framedTubeExtension T framedDiskUnshrink t x = T (p.1, framedDiskUnshrink t p.2)
        from ite_eq_left hx, framedTubeExtension_apply T framedDiskShrink t hstep]
      change T (p.1, framedDiskShrink t (framedDiskUnshrink t p.2)) = x
      rw [framedDiskShrink_unshrink, Prod.eta]
      exact T.right_inv hx
    · simp [framedTubeExtension, hx]
  contMDiff_toFun := (framedTubeExtension_contMDiff T hT _
    (fun _ _ h => framedDiskShrink_outer _ h) framedDiskShrink_closedBall
    framedDiskShrink_contMDiff).comp (contMDiff_id.prodMk contMDiff_const)
  contMDiff_invFun := (framedTubeExtension_contMDiff T hT _
    (fun _ _ h => framedDiskUnshrink_outer _ h) framedDiskUnshrink_closedBall
    framedDiskUnshrink_contMDiff).comp (contMDiff_id.prodMk contMDiff_const)

variable [T2Space X] (T : PartialDiffeomorph IT ThreeModel Tube X ∞)
  (hT : ∀ p : Tube, ‖p.2‖ ≤ 2 → p ∈ T.source)

theorem retainedTubeShrink_contMDiff :
    ContMDiff (ThreeModel.prod 𝓘(ℝ, ℝ)) ThreeModel ∞
      (fun p : X × ℝ => retainedTubeShrink T hT p.2 p.1) :=
  framedTubeExtension_contMDiff T hT _ (fun _ _ h => framedDiskShrink_outer _ h)
    framedDiskShrink_closedBall framedDiskShrink_contMDiff

theorem retainedTubeShrink_symm_contMDiff :
    ContMDiff (ThreeModel.prod 𝓘(ℝ, ℝ)) ThreeModel ∞
      (fun p : X × ℝ => (retainedTubeShrink T hT p.2).symm p.1) :=
  framedTubeExtension_contMDiff T hT _ (fun _ _ h => framedDiskUnshrink_outer _ h)
    framedDiskUnshrink_closedBall framedDiskUnshrink_contMDiff

theorem retainedTubeShrink_zero (x : X) : retainedTubeShrink T hT 0 x = x := by
  change framedTubeExtension T framedDiskShrink 0 x = x
  by_cases h : x ∈ T.target
  · simp [framedTubeExtension, h, framedDiskShrink_zero, T.right_inv h]
  · simp [framedTubeExtension, h]

theorem retainedTubeShrink_one {p : Tube} (hp : ‖p.2‖ ≤ 1) :
    retainedTubeShrink T hT 1 (T p) = T (p.1, (1 / 8 : ℝ) • p.2) := by
  change framedTubeExtension T framedDiskShrink 1 (T p) = _
  rw [framedTubeExtension_apply T _ 1 (hT _ (by linarith)), framedDiskShrink_one hp]

theorem retainedTubeShrink_one_inverse {p : Tube} (hp : ‖p.2‖ ≤ 1) :
    (retainedTubeShrink T hT 1).symm (T (p.1, (1 / 8 : ℝ) • p.2)) = T p := by
  rw [← retainedTubeShrink_one T hT hp, Diffeomorph.symm_apply_apply]

theorem retainedTubeShrink_fixed (t : ℝ) {x : X} (hx : x ∉ T '' {p : Tube | ‖p.2‖ ≤ 2}) :
    retainedTubeShrink T hT t x = x :=
  framedTubeExtension_fixed T _ (fun _ _ h => framedDiskShrink_outer _ h) t hx

end Ambient

end SmoothPoincare.HMP
