import DifferentialGeometry.Topology.Manifold.ClosedBall
import DifferentialGeometry.Topology.Manifold.Sphere.PolarCoordinates
import Mathlib.Analysis.InnerProductSpace.ProdL2

set_option autoImplicit false

noncomputable section

open Set Metric Manifold
open scoped ContDiff Manifold
open DifferentialGeometry.Topology DifferentialGeometry.Topology.Handle
open DifferentialGeometry.Topology.Manifold

namespace SmoothPoincare.StandardSurgeryModel

/-- The Euclidean space underlying a unit disk of dimension `k + 1`. -/
abbrev Block (k : ℕ) := EuclideanSpace ℝ (Fin (k + 1))

/-- The boundary sphere of the unit disk of dimension `k + 1`. -/
abbrev BoundarySphere (k : ℕ) := sphere (0 : Block k) 1

/-- Orthogonal sum of the two disk-coordinate spaces. -/
abbrev Ambient (m n : ℕ) := WithLp 2 (Block m × Block n)

/-- The round sphere in the orthogonal sum, of dimension `m + n + 1`. -/
abbrev RoundSphere (m n : ℕ) := sphere (0 : Ambient m n) 1

local instance (k : ℕ) : Fact (Module.finrank ℝ (Block k) = k + 1) := ⟨by simp⟩

local instance (m n : ℕ) : Fact (Module.finrank ℝ (Ambient m n) = (m + n + 1) + 1) :=
  ⟨by
    rw [(WithLp.prodContinuousLinearEquiv 2 ℝ (Block m) (Block n)).toLinearEquiv.finrank_eq,
      Module.finrank_prod]
    simp only [finrank_euclideanSpace_fin]
    omega⟩

local instance (k : ℕ) : ChartedSpace (EuclideanHalfSpace (k + 1)) (ClosedCell (k + 1)) :=
  closedCellChartedSpaceSucc k

local instance (k : ℕ) : IsManifold (𝓡∂ (k + 1)) ∞ (ClosedCell (k + 1)) :=
  closedCellIsManifold k

/-- The common radius of the two orthogonal components on the attaching face. -/
def seamRadius : ℝ := Real.sqrt (1 / 2)

theorem seamRadius_pos : 0 < seamRadius := Real.sqrt_pos.mpr (by norm_num)

theorem seamRadius_sq : seamRadius ^ 2 = 1 / 2 := Real.sq_sqrt (by norm_num)

private def remainingRadius {k : ℕ} (x : Block k) : ℝ :=
  Real.sqrt (1 - ‖seamRadius • x‖ ^ 2)

private theorem norm_small {k : ℕ} (x : ClosedCell (k + 1)) :
    ‖seamRadius • x.val‖ ^ 2 ≤ 1 / 2 := by
  rw [norm_smul, Real.norm_eq_abs, abs_of_pos seamRadius_pos, mul_pow, seamRadius_sq]
  nlinarith [x.property, norm_nonneg x.val]

private theorem remainingRadius_pos {k : ℕ} (x : ClosedCell (k + 1)) :
    0 < remainingRadius x.val := Real.sqrt_pos.mpr (by linarith [norm_small x])

private theorem remainingRadius_sq {k : ℕ} (x : ClosedCell (k + 1)) :
    remainingRadius x.val ^ 2 = 1 - ‖seamRadius • x.val‖ ^ 2 :=
  Real.sq_sqrt (by linarith [norm_small x])

private theorem norm_smul_boundary {k : ℕ} (r : ℝ) (u : BoundarySphere k) :
    ‖r • u.val‖ ^ 2 = r ^ 2 := by
  rw [norm_smul, norm_eq_of_mem_sphere u, mul_one, Real.norm_eq_abs, sq_abs]

private theorem norm_sq_components {m n : ℕ} (z : RoundSphere m n) :
    ‖z.val.fst‖ ^ 2 + ‖z.val.snd‖ ^ 2 = 1 := by
  rw [← WithLp.prod_norm_sq_eq_of_L2, norm_eq_of_mem_sphere z]
  norm_num

private def spherePoint {m n : ℕ} (x : Block m) (y : Block n)
    (h : ‖x‖ ^ 2 + ‖y‖ ^ 2 = 1) : RoundSphere m n :=
  ⟨WithLp.toLp 2 (x, y), mem_sphere_zero_iff_norm.mpr (by
    have hs : ‖WithLp.toLp 2 (x, y)‖ ^ 2 = 1 := by
      rw [WithLp.prod_norm_sq_eq_of_L2]
      exact h
    nlinarith [norm_nonneg (WithLp.toLp 2 (x, y))])⟩

/-- Parametrization of the disk–sphere piece by orthogonal coordinates in the round sphere. -/
def leftPiece {m n : ℕ} (p : ClosedCell (m + 1) × BoundarySphere n) : RoundSphere m n :=
  spherePoint (seamRadius • p.1.val) (remainingRadius p.1.val • p.2.val) (by
    rw [norm_smul_boundary, remainingRadius_sq]
    ring)

/-- Parametrization of the sphere–disk piece in the same round sphere. -/
def rightPiece {m n : ℕ} (p : BoundarySphere m × ClosedCell (n + 1)) : RoundSphere m n :=
  spherePoint (remainingRadius p.2.val • p.1.val) (seamRadius • p.2.val) (by
    rw [norm_smul_boundary, remainingRadius_sq]
    ring)

/-- Map a unit sphere to the boundary of its corresponding closed disk. -/
def onBoundary {k : ℕ} (u : BoundarySphere k) : ClosedCell (k + 1) :=
  ⟨u.val, (norm_eq_of_mem_sphere u).le⟩

/-- Both maps use the same face coordinates, with no twist of either sphere factor. -/
theorem pieces_agree_on_face {m n : ℕ} (u : BoundarySphere m) (v : BoundarySphere n) :
    leftPiece (onBoundary u, v) = rightPiece (u, onBoundary v) := by
  have radius {k : ℕ} (w : BoundarySphere k) : remainingRadius w.val = seamRadius := by
    change Real.sqrt (1 - ‖seamRadius • w.val‖ ^ 2) = Real.sqrt (1 / 2)
    rw [norm_smul_boundary, seamRadius_sq]
    norm_num
  apply Subtype.ext
  simp [leftPiece, rightPiece, spherePoint, onBoundary, radius]

/-- For the disk–sphere piece the first orthogonal block lies inside the seam radius. -/
abbrev leftRegion {m n : ℕ} : Set (RoundSphere m n) := {z | ‖z.val.fst‖ ^ 2 ≤ 1 / 2}

/-- For the sphere–disk piece the second orthogonal block lies inside the seam radius. -/
abbrev rightRegion {m n : ℕ} : Set (RoundSphere m n) := {z | ‖z.val.snd‖ ^ 2 ≤ 1 / 2}

private def diskOfSmall {k : ℕ} (x : Block k) (h : ‖x‖ ^ 2 ≤ 1 / 2) : ClosedCell (k + 1) :=
  ⟨seamRadius⁻¹ • x, by
    have hle : ‖x‖ ≤ seamRadius := by nlinarith [norm_nonneg x, seamRadius_pos, seamRadius_sq]
    change ‖seamRadius⁻¹ • x‖ ≤ 1
    rw [norm_smul, Real.norm_eq_abs, abs_of_pos (inv_pos.mpr seamRadius_pos)]
    calc
      seamRadius⁻¹ * ‖x‖ ≤ seamRadius⁻¹ * seamRadius :=
        mul_le_mul_of_nonneg_left hle (inv_pos.mpr seamRadius_pos).le
      _ = 1 := inv_mul_cancel₀ seamRadius_pos.ne'⟩

private theorem seamRadius_smul_diskOfSmall {k : ℕ} (x : Block k) (h : ‖x‖ ^ 2 ≤ 1 / 2) :
    seamRadius • (diskOfSmall x h).val = x := by
  simp [diskOfSmall, smul_smul, seamRadius_pos.ne']

private theorem diskOfSmall_seamRadius_smul {k : ℕ} (x : ClosedCell (k + 1)) :
    diskOfSmall (seamRadius • x.val) (norm_small x) = x := by
  apply Subtype.ext
  simp [diskOfSmall, smul_smul, seamRadius_pos.ne']

private theorem left_big {m n : ℕ} (z : leftRegion (m := m) (n := n)) : z.val.val.snd ≠ 0 := by
  have h : ‖z.val.val.fst‖ ^ 2 ≤ 1 / 2 := z.property
  intro hz
  have hs := norm_sq_components z.val
  rw [hz, norm_zero, zero_pow (by decide : (2 : ℕ) ≠ 0), add_zero] at hs
  linarith

private theorem right_big {m n : ℕ} (z : rightRegion (m := m) (n := n)) : z.val.val.fst ≠ 0 := by
  have h : ‖z.val.val.snd‖ ^ 2 ≤ 1 / 2 := z.property
  intro hz
  have hs := norm_sq_components z.val
  rw [hz, norm_zero, zero_pow (by decide : (2 : ℕ) ≠ 0), zero_add] at hs
  linarith

/-- Exact inverse of the disk–sphere parametrization on the indicated closed region. -/
def leftCoordinates {m n : ℕ} (v : BoundarySphere n) :
    ClosedCell (m + 1) × BoundarySphere n ≃ ↥(leftRegion (m := m) (n := n)) where
  toFun p := ⟨leftPiece p, norm_small p.1⟩
  invFun z := (diskOfSmall z.val.val.fst z.property, sphereDirection v z.val.val.snd)
  left_inv p := by
    apply Prod.ext
    · exact diskOfSmall_seamRadius_smul p.1
    · exact sphereDirection_pos_smul v p.2 (remainingRadius_pos p.1)
  right_inv z := by
    have hs : remainingRadius (diskOfSmall z.val.val.fst z.property).val = ‖z.val.val.snd‖ := by
      rw [remainingRadius, seamRadius_smul_diskOfSmall, show 1 - ‖z.val.val.fst‖ ^ 2 =
        ‖z.val.val.snd‖ ^ 2 by linarith [norm_sq_components z.val]]
      exact Real.sqrt_sq (norm_nonneg _)
    apply Subtype.ext
    apply Subtype.ext
    apply (WithLp.prodContinuousLinearEquiv 2 ℝ (Block m) (Block n)).injective
    apply Prod.ext
    · exact seamRadius_smul_diskOfSmall _ z.property
    · change remainingRadius (diskOfSmall z.val.val.fst z.property).val •
        (sphereDirection v z.val.val.snd).val = z.val.val.snd
      rw [hs, norm_smul_sphereDirection v (left_big z)]

/-- Exact inverse of the sphere–disk parametrization on the other closed region. -/
def rightCoordinates {m n : ℕ} (u : BoundarySphere m) :
    BoundarySphere m × ClosedCell (n + 1) ≃ ↥(rightRegion (m := m) (n := n)) where
  toFun p := ⟨rightPiece p, norm_small p.2⟩
  invFun z := (sphereDirection u z.val.val.fst, diskOfSmall z.val.val.snd z.property)
  left_inv p := by
    apply Prod.ext
    · exact sphereDirection_pos_smul u p.1 (remainingRadius_pos p.2)
    · exact diskOfSmall_seamRadius_smul p.2
  right_inv z := by
    have hs : remainingRadius (diskOfSmall z.val.val.snd z.property).val = ‖z.val.val.fst‖ := by
      rw [remainingRadius, seamRadius_smul_diskOfSmall, show 1 - ‖z.val.val.snd‖ ^ 2 =
        ‖z.val.val.fst‖ ^ 2 by linarith [norm_sq_components z.val]]
      exact Real.sqrt_sq (norm_nonneg _)
    apply Subtype.ext
    apply Subtype.ext
    apply (WithLp.prodContinuousLinearEquiv 2 ℝ (Block m) (Block n)).injective
    apply Prod.ext
    · change remainingRadius (diskOfSmall z.val.val.snd z.property).val •
        (sphereDirection u z.val.val.fst).val = z.val.val.fst
      rw [hs, norm_smul_sphereDirection u (right_big z)]
    · exact seamRadius_smul_diskOfSmall _ z.property

theorem leftRegion_union_rightRegion {m n : ℕ} :
    (leftRegion ∪ rightRegion : Set (RoundSphere m n)) = univ := by
  ext z
  change (‖z.val.fst‖ ^ 2 ≤ 1 / 2 ∨ ‖z.val.snd‖ ^ 2 ≤ 1 / 2) ↔ True
  have hs := norm_sq_components z
  constructor
  · exact fun _ => trivial
  · intro _
    by_cases hz : ‖z.val.fst‖ ^ 2 ≤ 1 / 2
    · exact Or.inl hz
    · exact Or.inr (by linarith)

/-- The common face is exactly the balanced locus in the split sphere. -/
theorem leftRegion_inter_rightRegion {m n : ℕ} :
    (leftRegion ∩ rightRegion : Set (RoundSphere m n)) = {z | ‖z.val.fst‖ ^ 2 = 1 / 2} := by
  ext z
  change (‖z.val.fst‖ ^ 2 ≤ 1 / 2 ∧ ‖z.val.snd‖ ^ 2 ≤ 1 / 2) ↔ ‖z.val.fst‖ ^ 2 = 1 / 2
  have hs := norm_sq_components z
  constructor
  · rintro ⟨hleft, hright⟩
    linarith
  · intro h
    exact ⟨h.le, by linarith⟩

private theorem contMDiffAt_remainingRadius {k : ℕ} (x : ClosedCell (k + 1)) :
    ContMDiffAt (𝓡 (k + 1)) 𝓘(ℝ, ℝ) ∞ (remainingRadius (k := k)) x.val := by
  have h : 0 < 1 - ‖seamRadius • x.val‖ ^ 2 := by linarith [norm_small x]
  have hx : ContDiff ℝ ∞ (fun y : Block k => seamRadius • y) :=
    (contDiff_const (c := seamRadius) : ContDiff ℝ ∞ (fun _ : Block k => seamRadius)).smul
      (contDiff_id : ContDiff ℝ ∞ (id : Block k → Block k))
  have hrad : ContDiff ℝ ∞ (fun y : Block k => 1 - ‖seamRadius • y‖ ^ 2) :=
    contDiff_const.sub (hx.norm_sq ℝ)
  change ContMDiffAt (𝓡 (k + 1)) 𝓘(ℝ, ℝ) ∞
    (Real.sqrt ∘ fun y : Block k => 1 - ‖seamRadius • y‖ ^ 2) x.val
  exact (Real.contDiffAt_sqrt h.ne').contMDiffAt.comp x.val hrad.contMDiff.contMDiffAt

/-- The disk–sphere parametrization is smooth up to the attaching face in the closed-disk atlas. -/
theorem contMDiff_leftPiece {m n : ℕ} :
    ContMDiff ((𝓡∂ (m + 1)).prod (𝓡 n)) (𝓡 (m + n + 1)) ∞ (leftPiece (m := m) (n := n)) := by
  have hx : ContMDiff ((𝓡∂ (m + 1)).prod (𝓡 n)) (𝓡 (m + 1)) ∞
      (fun p : ClosedCell (m + 1) × BoundarySphere n => p.1.val) :=
    (isSmoothEmbedding_closedCell_inclusion m).contMDiff.comp contMDiff_fst
  have hr : ContMDiff ((𝓡∂ (m + 1)).prod (𝓡 n)) 𝓘(ℝ, ℝ) ∞
      (remainingRadius ∘ (fun p : ClosedCell (m + 1) × BoundarySphere n => p.1.val)) :=
    fun p => (contMDiffAt_remainingRadius p.1).comp p (hx p)
  have hf : ContMDiff ((𝓡∂ (m + 1)).prod (𝓡 n)) (𝓡 (m + 1)) ∞
      (fun p : ClosedCell (m + 1) × BoundarySphere n => seamRadius • p.1.val) :=
    (contMDiff_const (I' := 𝓘(ℝ, ℝ)) (c := seamRadius)).smul hx
  have hg : ContMDiff ((𝓡∂ (m + 1)).prod (𝓡 n)) (𝓡 (n + 1)) ∞
      (fun p : ClosedCell (m + 1) × BoundarySphere n => remainingRadius p.1.val • p.2.val) :=
    hr.smul ((contMDiff_coe_sphere (n := n)).comp contMDiff_snd)
  have hmap := (WithLp.prodContinuousLinearEquiv 2 ℝ (Block m) (Block n)).symm.toContinuousLinearMap.contMDiff (n := ∞)
  exact (hmap.comp (hf.prodMk_space hg)).codRestrict_sphere (fun p => (leftPiece p).property)

/-- The sphere–disk parametrization is smooth up to the attaching face in the closed-disk atlas. -/
theorem contMDiff_rightPiece {m n : ℕ} :
    ContMDiff ((𝓡 m).prod (𝓡∂ (n + 1))) (𝓡 (m + n + 1)) ∞ (rightPiece (m := m) (n := n)) := by
  have hx : ContMDiff ((𝓡 m).prod (𝓡∂ (n + 1))) (𝓡 (n + 1)) ∞
      (fun p : BoundarySphere m × ClosedCell (n + 1) => p.2.val) :=
    (isSmoothEmbedding_closedCell_inclusion n).contMDiff.comp contMDiff_snd
  have hr : ContMDiff ((𝓡 m).prod (𝓡∂ (n + 1))) 𝓘(ℝ, ℝ) ∞
      (remainingRadius ∘ (fun p : BoundarySphere m × ClosedCell (n + 1) => p.2.val)) :=
    fun p => (contMDiffAt_remainingRadius p.2).comp p (hx p)
  have hf : ContMDiff ((𝓡 m).prod (𝓡∂ (n + 1))) (𝓡 (m + 1)) ∞
      (fun p : BoundarySphere m × ClosedCell (n + 1) => remainingRadius p.2.val • p.1.val) :=
    hr.smul ((contMDiff_coe_sphere (n := m)).comp contMDiff_fst)
  have hg : ContMDiff ((𝓡 m).prod (𝓡∂ (n + 1))) (𝓡 (n + 1)) ∞
      (fun p : BoundarySphere m × ClosedCell (n + 1) => seamRadius • p.2.val) :=
    (contMDiff_const (I' := 𝓘(ℝ, ℝ)) (c := seamRadius)).smul hx
  have hmap := (WithLp.prodContinuousLinearEquiv 2 ℝ (Block m) (Block n)).symm.toContinuousLinearMap.contMDiff (n := ∞)
  exact (hmap.comp (hf.prodMk_space hg)).codRestrict_sphere (fun p => (rightPiece p).property)

section Seam

variable {m n : ℕ}

abbrev SeamDomain (m n : ℕ) := (BoundarySphere m × BoundarySphere n) × ℝ

private abbrev seamModel (m n : ℕ) :=
  ModelWithCorners.prod (ModelWithCorners.prod (𝓡 m) (𝓡 n)) 𝓘(ℝ, ℝ)

def seamSource : Set (SeamDomain m n) := {p | p.2 ∈ Ioo (-(1 / 2)) (1 / 2)}

private theorem isOpen_seamSource : IsOpen (seamSource (m := m) (n := n)) :=
  isOpen_Ioo.preimage continuous_snd

def seamTarget : Set (RoundSphere m n) := {z | z.val.fst ≠ 0 ∧ z.val.snd ≠ 0}

private def fstBlock : Ambient m n →L[ℝ] Block m :=
  (ContinuousLinearMap.fst ℝ (Block m) (Block n)).comp
    (WithLp.prodContinuousLinearEquiv 2 ℝ (Block m) (Block n)).toContinuousLinearMap

private def sndBlock : Ambient m n →L[ℝ] Block n :=
  (ContinuousLinearMap.snd ℝ (Block m) (Block n)).comp
    (WithLp.prodContinuousLinearEquiv 2 ℝ (Block m) (Block n)).toContinuousLinearMap

private theorem contMDiff_fstBlock :
    ContMDiff (𝓡 (m + n + 1)) (𝓡 (m + 1)) ∞ (fun z : RoundSphere m n => z.val.fst) :=
  fstBlock.contMDiff.comp contMDiff_coe_sphere

private theorem contMDiff_sndBlock :
    ContMDiff (𝓡 (m + n + 1)) (𝓡 (n + 1)) ∞ (fun z : RoundSphere m n => z.val.snd) :=
  sndBlock.contMDiff.comp contMDiff_coe_sphere

private theorem isOpen_seamTarget : IsOpen (seamTarget (m := m) (n := n)) :=
  (isOpen_compl_singleton.preimage contMDiff_fstBlock.continuous).inter
    (isOpen_compl_singleton.preimage contMDiff_sndBlock.continuous)

private def seamPoint (p : SeamDomain m n) : RoundSphere m n := by
  classical
  exact if h : p ∈ seamSource then
    spherePoint (Real.sqrt (1 / 2 + p.2) • p.1.1.val)
      (Real.sqrt (1 / 2 - p.2) • p.1.2.val) (by
        have hp : p.2 ∈ Ioo (-(1 / 2)) (1 / 2) := h
        rw [norm_smul_boundary, norm_smul_boundary, Real.sq_sqrt (by linarith [hp.1]),
          Real.sq_sqrt (by linarith [hp.2])]
        ring)
  else leftPiece (⟨0, by simp⟩, p.1.2)

private theorem seamPoint_fst {p : SeamDomain m n} (h : p ∈ seamSource) :
    ((seamPoint p).val).fst = Real.sqrt (1 / 2 + p.2) • p.1.1.val := by
  simp [seamPoint, h, spherePoint]

private theorem seamPoint_snd {p : SeamDomain m n} (h : p ∈ seamSource) :
    ((seamPoint p).val).snd = Real.sqrt (1 / 2 - p.2) • p.1.2.val := by
  simp [seamPoint, h, spherePoint]

/-- Signed coordinate through the attaching face in the round smooth structure. -/
def seamParameter (z : RoundSphere m n) : ℝ := ‖z.val.fst‖ ^ 2 - 1 / 2

private theorem seamParameter_seamPoint {p : SeamDomain m n} (hp : p ∈ seamSource) :
    seamParameter (seamPoint p) = p.2 := by
  have hp' : p.2 ∈ Ioo (-(1 / 2)) (1 / 2) := hp
  rw [seamParameter, seamPoint_fst hp, norm_smul_boundary, Real.sq_sqrt (by linarith [hp'.1])]
  ring

private theorem contMDiffOn_seamPoint :
    ContMDiffOn (seamModel m n) (𝓡 (m + n + 1)) ∞ (seamPoint (m := m) (n := n)) seamSource := by
  let U : TopologicalSpace.Opens (SeamDomain m n) := ⟨seamSource, isOpen_seamSource⟩
  have hi : ContMDiff (seamModel m n) (seamModel m n) ∞ (Subtype.val : U → SeamDomain m n) := contMDiff_subtype_val
  have ht : ContMDiff (seamModel m n) 𝓘(ℝ, ℝ) ∞ (fun p : U => p.val.2) := contMDiff_snd.comp hi
  have hleft : ContMDiff (seamModel m n) 𝓘(ℝ, ℝ) ∞ (fun p : U => Real.sqrt (1 / 2 + p.val.2)) := by
    intro p
    have hp : p.val.2 ∈ Ioo (-(1 / 2)) (1 / 2) := p.property
    exact (Real.contDiffAt_sqrt (by linarith [hp.1] : 1 / 2 + p.val.2 ≠ 0)).contMDiffAt.comp p
      ((contMDiff_const.add ht) p)
  have hright : ContMDiff (seamModel m n) 𝓘(ℝ, ℝ) ∞ (fun p : U => Real.sqrt (1 / 2 - p.val.2)) := by
    intro p
    have hp : p.val.2 ∈ Ioo (-(1 / 2)) (1 / 2) := p.property
    exact (Real.contDiffAt_sqrt (by linarith [hp.2] : 1 / 2 - p.val.2 ≠ 0)).contMDiffAt.comp p
      ((contMDiff_const.sub ht) p)
  have hf : ContMDiff (seamModel m n) (𝓡 (m + 1)) ∞
      (fun p : U => Real.sqrt (1 / 2 + p.val.2) • p.val.1.1.val) :=
    hleft.smul (contMDiff_coe_sphere.comp (contMDiff_fst.comp (contMDiff_fst.comp hi)))
  have hg : ContMDiff (seamModel m n) (𝓡 (n + 1)) ∞
      (fun p : U => Real.sqrt (1 / 2 - p.val.2) • p.val.1.2.val) :=
    hright.smul (contMDiff_coe_sphere.comp (contMDiff_snd.comp (contMDiff_fst.comp hi)))
  have hmap := (WithLp.prodContinuousLinearEquiv 2 ℝ (Block m) (Block n)).symm.toContinuousLinearMap.contMDiff (n := ∞)
  have heq : (fun p : U => (seamPoint p.val).val) = fun p =>
      WithLp.toLp 2 (Real.sqrt (1 / 2 + p.val.2) • p.val.1.1.val,
        Real.sqrt (1 / 2 - p.val.2) • p.val.1.2.val) := by
    funext p
    have hp : p.val ∈ seamSource := p.property
    rw [seamPoint, dite_eq_left hp]
    rfl
  have he : ContMDiff (seamModel m n) 𝓘(ℝ, Ambient m n) ∞ (fun p : U => (seamPoint p.val).val) := by
    rw [heq]
    exact hmap.comp (hf.prodMk_space hg)
  have h : ContMDiff (seamModel m n) (𝓡 (m + n + 1)) ∞ (fun p : U => seamPoint p.val) :=
    he.codRestrict_sphere (fun p : U => (seamPoint p.val).property)
  intro q hq
  exact ((contMDiffAt_subtype_iff (U := U) (f := seamPoint)).mp (h ⟨q, hq⟩)).contMDiffWithinAt

private theorem contMDiff_seamParameter :
    ContMDiff (𝓡 (m + n + 1)) 𝓘(ℝ, ℝ) ∞ (seamParameter (m := m) (n := n)) :=
  ((contDiff_norm_sq ℝ).contMDiff.comp contMDiff_fstBlock).sub contMDiff_const

/-- A single smooth chart across the common face of the two product pieces.
The inverse keeps both sphere directions and reads off their signed radial separation. -/
def seamChart (u : BoundarySphere m) (v : BoundarySphere n) :
    PartialDiffeomorph (seamModel m n) (𝓡 (m + n + 1)) (SeamDomain m n) (RoundSphere m n) ∞ where
  toFun := seamPoint
  invFun z := ((sphereDirection u z.val.fst, sphereDirection v z.val.snd), seamParameter z)
  source := seamSource
  target := seamTarget
  map_source' p hp := by
    have h : p.2 ∈ Ioo (-(1 / 2)) (1 / 2) := hp
    change (seamPoint p).val.fst ≠ 0 ∧ (seamPoint p).val.snd ≠ 0
    rw [seamPoint_fst hp, seamPoint_snd hp]
    exact ⟨smul_ne_zero (Real.sqrt_pos.mpr (by linarith [h.1])).ne'
      (ne_zero_of_mem_unit_sphere p.1.1), smul_ne_zero (Real.sqrt_pos.mpr (by linarith [h.2])).ne'
      (ne_zero_of_mem_unit_sphere p.1.2)⟩
  map_target' z hz := by
    have h : z.val.fst ≠ 0 ∧ z.val.snd ≠ 0 := hz
    have h₁ := sq_pos_of_ne_zero (norm_ne_zero_iff.mpr h.1)
    have h₂ := sq_pos_of_ne_zero (norm_ne_zero_iff.mpr h.2)
    change -(1 / 2) < seamParameter z ∧ seamParameter z < 1 / 2
    dsimp only [seamParameter]
    exact ⟨by linarith, by linarith [norm_sq_components z]⟩
  left_inv' p hp := by
    have hr : p.2 ∈ Ioo (-(1 / 2)) (1 / 2) := hp
    apply Prod.ext
    · apply Prod.ext
      · change sphereDirection u (seamPoint p).val.fst = p.1.1
        rw [seamPoint_fst hp]
        exact sphereDirection_pos_smul u p.1.1 (Real.sqrt_pos.mpr (by linarith [hr.1]))
      · change sphereDirection v (seamPoint p).val.snd = p.1.2
        rw [seamPoint_snd hp]
        exact sphereDirection_pos_smul v p.1.2 (Real.sqrt_pos.mpr (by linarith [hr.2]))
    · exact seamParameter_seamPoint hp
  right_inv' z hz := by
    have h : z.val.fst ≠ 0 ∧ z.val.snd ≠ 0 := hz
    let p : SeamDomain m n := ((sphereDirection u z.val.fst, sphereDirection v z.val.snd),
      seamParameter z)
    have hp : p ∈ seamSource := by
      have h₁ := sq_pos_of_ne_zero (norm_ne_zero_iff.mpr h.1)
      have h₂ := sq_pos_of_ne_zero (norm_ne_zero_iff.mpr h.2)
      change -(1 / 2) < seamParameter z ∧ seamParameter z < 1 / 2
      dsimp only [seamParameter]
      exact ⟨by linarith, by linarith [norm_sq_components z]⟩
    change seamPoint p = z
    apply Subtype.ext
    apply (WithLp.prodContinuousLinearEquiv 2 ℝ (Block m) (Block n)).injective
    apply Prod.ext
    · change (seamPoint p).val.fst = z.val.fst
      rw [seamPoint_fst hp]
      change Real.sqrt (1 / 2 + seamParameter z) • (sphereDirection u z.val.fst).val = z.val.fst
      rw [show 1 / 2 + seamParameter z = ‖z.val.fst‖ ^ 2 by unfold seamParameter; ring,
        Real.sqrt_sq (norm_nonneg _), norm_smul_sphereDirection u h.1]
    · change (seamPoint p).val.snd = z.val.snd
      rw [seamPoint_snd hp]
      change Real.sqrt (1 / 2 - seamParameter z) • (sphereDirection v z.val.snd).val = z.val.snd
      rw [show 1 / 2 - seamParameter z = ‖z.val.snd‖ ^ 2 by
        unfold seamParameter
        linarith [norm_sq_components z], Real.sqrt_sq (norm_nonneg _), norm_smul_sphereDirection v h.2]
  open_source := isOpen_seamSource
  open_target := isOpen_seamTarget
  contMDiffOn_toFun := contMDiffOn_seamPoint
  contMDiffOn_invFun := by
    have hl := (contMDiffOn_sphereDirection (n := m) u).comp
      (contMDiff_fstBlock (m := m) (n := n)).contMDiffOn
      (fun z (hz : z ∈ seamTarget) => hz.1)
    have hr := (contMDiffOn_sphereDirection (n := n) v).comp
      (contMDiff_sndBlock (m := m) (n := n)).contMDiffOn
      (fun z (hz : z ∈ seamTarget) => hz.2)
    exact (hl.prodMk hr).prodMk contMDiff_seamParameter.contMDiffOn

/-- The zero slice of the collar is exactly the attaching face in either product. -/
theorem seamChart_at_zero (u₀ u : BoundarySphere m) (v₀ v : BoundarySphere n) :
    seamChart u₀ v₀ ((u, v), 0) = leftPiece (onBoundary u, v) := by
  have hp : ((u, v), (0 : ℝ)) ∈ seamSource := by
    change -(1 / 2 : ℝ) < 0 ∧ 0 < (1 / 2 : ℝ)
    norm_num
  have hr : remainingRadius u.val = seamRadius := by
    change Real.sqrt (1 - ‖seamRadius • u.val‖ ^ 2) = Real.sqrt (1 / 2)
    rw [norm_smul_boundary, seamRadius_sq]
    norm_num
  apply Subtype.ext
  apply (WithLp.prodContinuousLinearEquiv 2 ℝ (Block m) (Block n)).injective
  apply Prod.ext
  · change (seamPoint ((u, v), 0)).val.fst = seamRadius • u.val
    rw [seamPoint_fst hp]
    simp [seamRadius]
  · change (seamPoint ((u, v), 0)).val.snd = remainingRadius u.val • v.val
    rw [seamPoint_snd hp, hr]
    simp [seamRadius]

/-- The product disk pieces meet at zero and lie on opposite sides in the collar. -/
theorem seamChart_sides (u : BoundarySphere m) (v : BoundarySphere n)
    {p : SeamDomain m n} (hp : p ∈ (seamChart u v).source) :
    ((seamChart u v p ∈ leftRegion) ↔ p.2 ≤ 0) ∧
    ((seamChart u v p ∈ rightRegion) ↔ 0 ≤ p.2) := by
  have hs : ‖(seamChart u v p).val.fst‖ ^ 2 - 1 / 2 = p.2 :=
    seamParameter_seamPoint hp
  have ht := norm_sq_components (seamChart u v p)
  change (‖(seamChart u v p).val.fst‖ ^ 2 ≤ 1 / 2 ↔ p.2 ≤ 0) ∧
    (‖(seamChart u v p).val.snd‖ ^ 2 ≤ 1 / 2 ↔ 0 ≤ p.2)
  constructor <;> constructor <;> intro h <;> linarith

end Seam

end SmoothPoincare.StandardSurgeryModel
