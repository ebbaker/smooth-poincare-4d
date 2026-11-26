import SmoothPoincare.Heights.MarkedBallCoverageModel
import DifferentialGeometry.Topology.Manifold.SphereDirection

/-! # The independent model's whole signed height collar -/

open DifferentialGeometry.Topology.Handle DifferentialGeometry.Topology.Manifold Set
open scoped ContDiff Manifold

namespace SmoothPoincare

noncomputable section

local notation "V" => EuclideanSpace ℝ (Fin 4)
local notation "S" => Metric.sphere (0 : V) 1
local notation "K" => ModelWithCorners.prod (𝓡 3) 𝓘(ℝ, ℝ)

private local instance markedEdgeModelCollar_dimension : Fact (Module.finrank ℝ V = 3 + 1) :=
  ⟨by simp⟩

private def modelAxis (a : ℝ) := Real.sqrt (a + 1)

private def modelTransverse (a t : ℝ) := Real.sqrt ((a + 1) * (a - 1 + t ^ 2))

private def modelFlatten (p : ℝ × V) : V :=
  closedCellCons 3 (p.2 0 / modelAxis p.1)
    ((modelTransverse p.1 (p.2 0))⁻¹ • closedCellTail 3 p.2)

private def modelUnflatten (p : ℝ × V) : V :=
  let t := modelAxis p.1 * p.2 0
  closedCellCons 3 t (modelTransverse p.1 t • closedCellTail 3 p.2)

private theorem modelFlatten_eq {a : ℝ} (ha : 1 < a) (x : V) :
    modelFlatten (a,x) = markedEdgeModelFlatten ha x := rfl

private theorem modelUnflatten_eq {a : ℝ} (ha : 1 < a) (x : V) :
    modelUnflatten (a,x) = (markedEdgeModelFlatten ha).symm x := rfl

private theorem contDiff_modelHeight : ContDiff ℝ ∞ markedEdgeModelHeight := by
  have h0 : ContDiff ℝ ∞ (fun x : V => x 0) := by fun_prop
  exact ((h0.pow 2).sub contDiff_const).pow 2 |>.add
    ((contDiff_norm_sq ℝ).comp (closedCellTail_contDiff (m := 3)))

private def outgoingParameters : Set (ℝ × V) := {p | 1 < p.1}

private theorem modelAxis_pos {a : ℝ} (ha : 1 < a) : 0 < modelAxis a :=
  Real.sqrt_pos.mpr (by linarith)

private theorem modelTransverse_pos {a : ℝ} (ha : 1 < a) (t : ℝ) :
    0 < modelTransverse a t :=
  Real.sqrt_pos.mpr (mul_pos (by linarith) (by nlinarith [sq_nonneg t]))

private theorem contDiffOn_modelAxis :
    ContDiffOn ℝ ∞ (fun p : ℝ × V => modelAxis p.1) outgoingParameters := by
  apply (show ContDiffOn ℝ ∞ (fun p : ℝ × V => p.1 + 1) outgoingParameters from
    (contDiff_fst.add contDiff_const).contDiffOn).sqrt
  intro p hp
  have h : 1 < p.1 := hp
  linarith

private theorem contDiffOn_modelTransverse {t : ℝ × V → ℝ}
    (ht : ContDiffOn ℝ ∞ t outgoingParameters) :
    ContDiffOn ℝ ∞ (fun p : ℝ × V => modelTransverse p.1 (t p)) outgoingParameters := by
  apply ((contDiff_fst.add contDiff_const).contDiffOn.mul
    ((contDiff_fst.sub contDiff_const).contDiffOn.add (ht.pow 2))).sqrt
  intro p hp
  have h : 1 < p.1 := hp
  exact (mul_pos (by linarith : 0 < p.1 + 1) (by nlinarith [sq_nonneg (t p)])).ne'

private theorem contDiffOn_modelFlatten : ContDiffOn ℝ ∞ modelFlatten outgoingParameters := by
  have h0 : ContDiff ℝ ∞ (fun p : ℝ × V => p.2 0) := by fun_prop
  have ht := h0.contDiffOn.div contDiffOn_modelAxis (fun p hp => (modelAxis_pos hp).ne')
  have hs := (contDiffOn_modelTransverse h0.contDiffOn).inv
    (fun p hp => (modelTransverse_pos hp (p.2 0)).ne')
  have hz : ContDiff ℝ ∞ (fun p : ℝ × V => closedCellTail 3 p.2) :=
    (closedCellTail_contDiff (m := 3)).comp contDiff_snd
  exact (closedCellCons_contDiff (m := 3)).comp_contDiffOn (ht.prodMk (hs.smul hz.contDiffOn))

private theorem contDiffOn_modelUnflatten : ContDiffOn ℝ ∞ modelUnflatten outgoingParameters := by
  have h0 : ContDiff ℝ ∞ (fun p : ℝ × V => p.2 0) := by fun_prop
  have ht := contDiffOn_modelAxis.mul h0.contDiffOn
  have hs := contDiffOn_modelTransverse ht
  have hz : ContDiff ℝ ∞ (fun p : ℝ × V => closedCellTail 3 p.2) :=
    (closedCellTail_contDiff (m := 3)).comp contDiff_snd
  exact (closedCellCons_contDiff (m := 3)).comp_contDiffOn (ht.prodMk (hs.smul hz.contDiffOn))

private def collarSource (w : ℝ) : Set (S × ℝ) := {p | p.2 ∈ Ioo (-w) w}

private def collarTarget (c w : ℝ) : Set V := markedEdgeModelHeight ⁻¹' Ioo (c - w) (c + w)

private def collarForward (c : ℝ) (p : S × ℝ) : V :=
  modelUnflatten (Real.sqrt (c + p.2), p.1.val)

private def collarBackward (v : S) (c : ℝ) (x : V) : S × ℝ :=
  (sphereDirection v (modelFlatten (Real.sqrt (markedEdgeModelHeight x), x)), markedEdgeModelHeight x - c)

private theorem sqrt_one_lt {b : ℝ} (hb : 1 < b) : 1 < Real.sqrt b := by
  have hs : (Real.sqrt b) ^ 2 = b := Real.sq_sqrt (by linarith)
  apply (sq_lt_sq₀ zero_le_one (Real.sqrt_nonneg _)).mp
  nlinarith

private theorem collarForward_height {c w : ℝ} (hw : w < c - 1) {p : S × ℝ}
    (hp : p ∈ collarSource w) : markedEdgeModelHeight (collarForward c p) = c + p.2 := by
  have hp' : -w < p.2 := hp.1
  have hpos : 1 < c + p.2 := by linarith
  let b := Real.sqrt (c + p.2)
  have hb : 1 < b := sqrt_one_lt hpos
  let d := markedEdgeModelFlatten hb
  have hpart : p.1.val ∈ d '' (markedEdgeModelHeight ⁻¹' {b ^ 2}) :=
    (markedEdgeModelFlatten_images hb).2.symm ▸ p.1.property
  obtain ⟨x, hx, hMap⟩ := hpart
  have he : d.symm p.1.val = x := by rw [← hMap, d.symm_apply_apply]
  change markedEdgeModelHeight x = b ^ 2 at hx
  unfold collarForward
  rw [modelUnflatten_eq hb, he, hx, Real.sq_sqrt (by linarith)]

private theorem collarBackward_angular {c w : ℝ} (v : S) (hw : w < c - 1) {x : V}
    (hx : x ∈ collarTarget c w) :
    (collarBackward v c x).1.val = modelFlatten (Real.sqrt (markedEdgeModelHeight x), x) := by
  have hx' : c - w < markedEdgeModelHeight x := hx.1
  have hpos : 1 < markedEdgeModelHeight x := by linarith
  let b := Real.sqrt (markedEdgeModelHeight x)
  have hb : 1 < b := sqrt_one_lt hpos
  have hq : markedEdgeModelHeight x ∈ ({b ^ 2} : Set ℝ) := by
    rw [mem_singleton_iff, Real.sq_sqrt (by linarith)]
  have hz : modelFlatten (b,x) ∈ S := by
    rw [modelFlatten_eq hb, ← (markedEdgeModelFlatten_images hb).2]
    exact ⟨x, hq, rfl⟩
  let z : S := ⟨modelFlatten (b,x), hz⟩
  change (sphereDirection v z.val).val = z.val
  have he : sphereDirection v z.val = z := by
    simpa only [one_smul] using (sphereDirection_pos_smul v z (r := 1) zero_lt_one)
  exact congrArg Subtype.val he

private theorem contMDiffOn_collarForward {c w : ℝ} (hw : w < c - 1) :
    ContMDiffOn K 𝓘(ℝ,V) ∞ (collarForward c) (collarSource w) := by
  have hs : ContMDiff K 𝓘(ℝ, ℝ) ∞ (fun p : S × ℝ => c + p.2) :=
    contMDiff_const.add contMDiff_snd
  have hh : ContMDiffOn K 𝓘(ℝ, ℝ) ∞ (fun p : S × ℝ => Real.sqrt (c + p.2)) (collarSource w) := by
    intro p hp
    have hp' : -w < p.2 := hp.1
    exact (Real.contDiffAt_sqrt (show c + p.2 ≠ 0 by linarith)).contMDiffAt
      |>.comp_contMDiffWithinAt p (hs.contMDiffOn p hp)
  have hu := (contMDiff_coe_sphere (m := ∞) (n := 3) (E := V)).comp
    (contMDiff_fst : ContMDiff K (𝓡 3) ∞ (Prod.fst : S × ℝ → S))
  exact contDiffOn_modelUnflatten.contMDiffOn.comp (hh.prodMk_space hu.contMDiffOn) (fun p hp => by
    have hp' : -w < p.2 := hp.1
    exact sqrt_one_lt (by linarith))

private theorem contMDiffOn_collarBackward (v : S) {c w : ℝ} (hw : w < c - 1) :
    ContMDiffOn 𝓘(ℝ,V) K ∞ (collarBackward v c) (collarTarget c w) := by
  have hq := contDiff_modelHeight.contMDiff
  have hs : ContMDiffOn 𝓘(ℝ,V) 𝓘(ℝ, ℝ) ∞ (fun x => Real.sqrt (markedEdgeModelHeight x))
      (collarTarget c w) := by
    intro x hx
    have hx' : c - w < markedEdgeModelHeight x := hx.1
    exact (Real.contDiffAt_sqrt (show markedEdgeModelHeight x ≠ 0 by linarith)).contMDiffAt
      |>.comp_contMDiffWithinAt x (hq.contMDiffOn x hx)
  have hf := contDiffOn_modelFlatten.contMDiffOn.comp (hs.prodMk_space contMDiff_id.contMDiffOn)
    (fun x hx => by
      have hx' : c - w < markedEdgeModelHeight x := hx.1
      exact sqrt_one_lt (by linarith))
  refine ((contMDiffOn_sphereDirection (n := 3) v).comp hf ?_).prodMk
    (hq.sub contMDiff_const).contMDiffOn
  intro x hx
  change modelFlatten (Real.sqrt (markedEdgeModelHeight x), x) ≠ 0
  rw [← collarBackward_angular v hw hx]
  exact ne_zero_of_mem_unit_sphere (collarBackward v c x).1

/-- Entire signed collar of the model level at height `c`. Its range is the
actual open height band and its angular coordinate is the sphere direction
at the point's own height, including on the inward half. -/
def markedEdgeModelCollar (v : S) {c w : ℝ} (hw : w < c - 1) :
    PartialDiffeomorph K 𝓘(ℝ,V) (S × ℝ) V ∞ where
  toFun := collarForward c
  invFun := collarBackward v c
  source := collarSource w
  target := collarTarget c w
  map_source' p hp := by
    have hp' : p.2 ∈ Ioo (-w) w := hp
    change markedEdgeModelHeight (collarForward c p) ∈ Ioo (c - w) (c + w)
    rw [collarForward_height hw hp]
    exact ⟨by linarith [hp'.1], by linarith [hp'.2]⟩
  map_target' x hx := by
    have hx' : markedEdgeModelHeight x ∈ Ioo (c - w) (c + w) := hx
    change markedEdgeModelHeight x - c ∈ Ioo (-w) w
    exact ⟨by linarith [hx'.1], by linarith [hx'.2]⟩
  left_inv' p hp := by
    have hp' : p.2 ∈ Ioo (-w) w := hp
    have hq := collarForward_height hw hp
    have hy : collarForward c p ∈ collarTarget c w := by
      change markedEdgeModelHeight (collarForward c p) ∈ Ioo (c - w) (c + w)
      rw [hq]
      exact ⟨by linarith [hp'.1], by linarith [hp'.2]⟩
    have hb : 1 < Real.sqrt (c + p.2) := sqrt_one_lt (by linarith [hp'.1])
    apply Prod.ext
    · apply Subtype.ext
      rw [collarBackward_angular v hw hy, hq, modelFlatten_eq hb]
      have hforward := modelUnflatten_eq hb p.1.val
      change collarForward c p = (markedEdgeModelFlatten hb).symm p.1.val at hforward
      rw [hforward, Diffeomorph.apply_symm_apply]
    · change markedEdgeModelHeight (collarForward c p) - c = p.2
      rw [hq]
      ring
  right_inv' x hx := by
    have hx' : c - w < markedEdgeModelHeight x := hx.1
    have hb : 1 < Real.sqrt (markedEdgeModelHeight x) := sqrt_one_lt (by linarith)
    have ht : c + (markedEdgeModelHeight x - c) = markedEdgeModelHeight x := by ring
    change modelUnflatten (Real.sqrt (c + (markedEdgeModelHeight x - c)), (collarBackward v c x).1.val) = x
    rw [ht, collarBackward_angular v hw hx, modelFlatten_eq hb, modelUnflatten_eq hb,
      Diffeomorph.symm_apply_apply]
  open_source := isOpen_Ioo.preimage continuous_snd
  open_target := isOpen_Ioo.preimage contDiff_modelHeight.continuous
  contMDiffOn_toFun := contMDiffOn_collarForward hw
  contMDiffOn_invFun := contMDiffOn_collarBackward v hw

/-- The forward and inverse equations on the literal full signed strip.
The angular formula and signed height hold for every parameter in the strip,
so they can also be applied to any fully parametrized tube there. -/
theorem markedEdgeModelCollar_coordinates (v : S) {c w : ℝ} (hw : w < c - 1) :
    let C := markedEdgeModelCollar v hw
    C.source = {p : S × ℝ | p.2 ∈ Ioo (-w) w} ∧
    C.target = markedEdgeModelHeight ⁻¹' Ioo (c - w) (c + w) ∧
    (∀ p : S × ℝ, p.2 ∈ Ioo (-w) w →
      (∀ h : 1 < Real.sqrt (c + p.2), C p = (markedEdgeModelFlatten h).symm p.1.val) ∧
      markedEdgeModelHeight (C p) = c + p.2 ∧ C.symm (C p) = p) ∧
    (∀ x : V, markedEdgeModelHeight x ∈ Ioo (c - w) (c + w) →
      (∀ h : 1 < Real.sqrt (markedEdgeModelHeight x),
        (C.symm x).1.val = markedEdgeModelFlatten h x) ∧
      (C.symm x).2 = markedEdgeModelHeight x - c ∧ C (C.symm x) = x) := by
  let C := markedEdgeModelCollar v hw
  refine ⟨rfl, rfl, ?_, ?_⟩
  · intro p hp
    exact ⟨fun h => modelUnflatten_eq h p.1.val, collarForward_height hw hp, C.left_inv hp⟩
  · intro x hx
    exact ⟨fun h => (collarBackward_angular v hw hx).trans (modelFlatten_eq h x), rfl, C.right_inv hx⟩

/-- Place the calibrated collar in the ambient space of the literal round
ball by the same flattening that sends the entire model body to that ball. -/
def markedEdgeRoundBallCollar (v : S) {a w : ℝ} (ha : 1 < a) (hw : w < a ^ 2 - 1) :
    PartialDiffeomorph K 𝓘(ℝ,V) (S × ℝ) V ∞ :=
  (markedEdgeModelCollar v hw).trans (markedEdgeModelFlatten ha).toPartialDiffeomorph

/-- In the round target the zero section is the identity sphere, and the
entire inward half lands in the literal closed ball with its exact signed
height and inverse. This uses the same comparison on the exterior half. -/
theorem markedEdgeRoundBallCollar_coordinates (v : S) {a w : ℝ} (ha : 1 < a) (hw : w < a ^ 2 - 1) :
    let P := markedEdgeRoundBallCollar v ha hw
    let d := markedEdgeModelFlatten ha
    P.source = {p : S × ℝ | p.2 ∈ Ioo (-w) w} ∧
    P.target = (markedEdgeModelHeight ∘ d.symm) ⁻¹' Ioo (a ^ 2 - w) (a ^ 2 + w) ∧
    (∀ u : S, P (u,0) = u.val) ∧
    (∀ p ∈ P.source, markedEdgeModelHeight (d.symm (P p)) = a ^ 2 + p.2 ∧
      (‖P p‖ ≤ 1 ↔ p.2 ≤ 0) ∧ P.symm (P p) = p) := by
  let P := markedEdgeRoundBallCollar v ha hw
  let d := markedEdgeModelFlatten ha
  let C := markedEdgeModelCollar v hw
  have hClosed (x : V) : ‖d x‖ ≤ 1 ↔ markedEdgeModelHeight x ≤ a ^ 2 := by
    have hImg := (markedEdgeModelFlatten_images ha).1
    constructor
    · intro h
      have hm : d x ∈ Metric.closedBall (0 : V) 1 :=
        by simpa only [Metric.mem_closedBall, dist_zero_right] using h
      rw [← hImg] at hm
      obtain ⟨z,hz,he⟩ := hm
      exact d.injective he ▸ hz
    · intro hx
      have hm : d x ∈ Metric.closedBall (0 : V) 1 := hImg ▸ ⟨x,hx,rfl⟩
      simpa only [Metric.mem_closedBall, dist_zero_right] using hm
  refine ⟨?_, ?_, ?_, ?_⟩
  · change C.source ∩ (C ⁻¹' univ) = C.source
    rw [preimage_univ, inter_univ]
  · change univ ∩ (d.symm ⁻¹' C.target) = _
    rw [univ_inter]
    rfl
  · intro u
    change d (modelUnflatten (Real.sqrt (a ^ 2 + 0), u.val)) = u.val
    rw [add_zero, Real.sqrt_sq (by linarith), modelUnflatten_eq ha, d.apply_symm_apply]
  · intro p hp
    have hq : markedEdgeModelHeight (C p) = a ^ 2 + p.2 := collarForward_height hw hp.1
    refine ⟨?_, ?_, P.left_inv hp⟩
    · change markedEdgeModelHeight (d.symm (d (C p))) = a ^ 2 + p.2
      exact (congrArg markedEdgeModelHeight (d.symm_apply_apply (C p))).trans hq
    · change ‖d (C p)‖ ≤ 1 ↔ p.2 ≤ 0
      rw [hClosed, hq, add_le_iff_nonpos_right]

end

end SmoothPoincare
