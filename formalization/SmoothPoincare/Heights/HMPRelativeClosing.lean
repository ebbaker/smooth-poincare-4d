import SmoothPoincare.Heights.MarkedNativeRecognition
import DifferentialGeometry.Topology.Manifold.Sphere.PolarCoordinates
import DifferentialGeometry.Topology.Manifold.StereographicChart
import DifferentialGeometry.Topology.Homology.SingularPair
import Mathlib.Analysis.Convex.Contractible

/-! # The protected disk-framed meridian in the HMP cross-gluing -/

open Set Metric Manifold CategoryTheory DifferentialGeometry.Topology
open DifferentialGeometry.Topology.Manifold
open DifferentialGeometry.PDE.RicciFlow.Surgery.Topology
open scoped Manifold ContDiff

noncomputable section

namespace SmoothPoincare.HMP

local notation "V" => StandardSurgeryModel.Block 1
local notation "C₁" => StandardSurgeryModel.BoundarySphere 1
local notation "IV" => 𝓘(ℝ, V)
local notation "IT" => ModelWithCorners.prod (𝓡 1) IV
local notation "IB" => ModelWithCorners.prod IV 𝓘(ℝ, ℝ)
local notation "Tube" => C₁ × V
local notation "Box" => V × ℝ

private local instance : Fact (Module.finrank ℝ V = 1 + 1) := ⟨by simp⟩

private def diskCoordinates : V ≃L[ℝ] ℝ × ℝ :=
  ((WithLp.linearEquiv 2 ℝ (Fin 2 → ℝ)).trans
    (LinearEquiv.finTwoArrow ℝ ℝ)).toContinuousLinearEquiv

private theorem diskCoordinates_apply (w : V) : diskCoordinates w = (w 0, w 1) := rfl

private theorem norm_diskCoordinates_le (w : V) (i : Fin 2) : |w i| ≤ ‖w‖ :=
  PiLp.norm_apply_le w i

/-- In coordinates that straighten the isolated strand, the meridian is
`(z,0) ↦ (z,0)`. The radial and axial coordinates of the normal disk
are scaled by one quarter. The inverse reads direction, radius and height. -/
def diskFramedMeridian (v : C₁) : PartialDiffeomorph IT IB Tube Box ∞ where
  toFun p := ((1 + p.2 0 / 4) • p.1.val, p.2 1 / 4)
  invFun x := (sphereDirection v x.1, diskCoordinates.symm (4 * (‖x.1‖ - 1), 4 * x.2))
  source := {p | 0 < 1 + p.2 0 / 4}
  target := {x | x.1 ≠ 0}
  map_source' p hp := by
    change 0 < 1 + p.2 0 / 4 at hp
    exact smul_ne_zero hp.ne' (ne_zero_of_mem_unit_sphere p.1)
  map_target' x hx := by
    change 0 < 1 + (diskCoordinates.symm (4 * (‖x.1‖ - 1), 4 * x.2)) 0 / 4
    have h := congrArg Prod.fst (diskCoordinates.apply_symm_apply (4 * (‖x.1‖ - 1), 4 * x.2))
    rw [diskCoordinates_apply] at h
    change (diskCoordinates.symm (4 * (‖x.1‖ - 1), 4 * x.2)) 0 = 4 * (‖x.1‖ - 1) at h
    rw [h]
    linarith [norm_pos_iff.mpr (show x.1 ≠ 0 from hx)]
  left_inv' p hp := by
    have hr : 0 < 1 + p.2 0 / 4 := hp
    have hn : ‖(1 + p.2 0 / 4) • p.1.val‖ = 1 + p.2 0 / 4 := by
      simp [norm_smul, Real.norm_eq_abs, abs_of_pos hr, norm_eq_of_mem_sphere]
    apply Prod.ext (sphereDirection_pos_smul v p.1 hr)
    apply diskCoordinates.injective
    rw [diskCoordinates.apply_symm_apply, hn, diskCoordinates_apply]
    congr 1 <;> ring
  right_inv' x hx := by
    have h := diskCoordinates.apply_symm_apply (4 * (‖x.1‖ - 1), 4 * x.2)
    rw [diskCoordinates_apply] at h
    have h0 := congrArg Prod.fst h
    have h1 := congrArg Prod.snd h
    change (diskCoordinates.symm _) 0 = 4 * (‖x.1‖ - 1) at h0
    change (diskCoordinates.symm _) 1 = 4 * x.2 at h1
    apply Prod.ext
    · change (1 + (diskCoordinates.symm _) 0 / 4) • (sphereDirection v x.1).val = x.1
      rw [h0, show 1 + 4 * (‖x.1‖ - 1) / 4 = ‖x.1‖ by ring]
      exact norm_smul_sphereDirection v (show x.1 ≠ 0 from hx)
    · change (diskCoordinates.symm _) 1 / 4 = x.2
      rw [h1]
      ring
  open_source := isOpen_lt continuous_const (continuous_const.add
    (((EuclideanSpace.proj (𝕜 := ℝ) (0 : Fin 2)).continuous.comp continuous_snd).div_const 4))
  open_target := isOpen_compl_singleton.preimage continuous_fst
  contMDiffOn_toFun := by
    apply ContMDiff.contMDiffOn
    have hcoord (i : Fin 2) : ContMDiff IT 𝓘(ℝ, ℝ) ∞ (fun p : Tube => p.2 i) :=
      (EuclideanSpace.proj (𝕜 := ℝ) i).contMDiff.comp contMDiff_snd
    exact ((contMDiff_const.add ((hcoord 0).div_const 4)).smul
      (contMDiff_coe_sphere.comp contMDiff_fst)).prodMk ((hcoord 1).div_const 4)
  contMDiffOn_invFun := by
    have hdir : ContMDiffOn IB (𝓡 1) ∞ (fun x : Box => sphereDirection v x.1) {x | x.1 ≠ 0} :=
      (contMDiffOn_sphereDirection v).comp contMDiff_fst.contMDiffOn (fun _ hx => hx)
    have hnorm : ContMDiffOn IB 𝓘(ℝ, ℝ) ∞ (fun x : Box => ‖x.1‖) {x | x.1 ≠ 0} :=
      fun x hx => ((contDiffAt_norm ℝ hx).contMDiffAt.comp x contMDiff_fst.contMDiffAt).contMDiffWithinAt
    have hdisk : ContMDiffOn IB IV ∞
        (fun x : Box => diskCoordinates.symm (4 * (‖x.1‖ - 1), 4 * x.2)) {x | x.1 ≠ 0} := by
      exact (diskCoordinates.symm.toContinuousLinearMap.contMDiff.contMDiffOn (s := univ)).comp
        ((contMDiffOn_const.mul (hnorm.sub contMDiffOn_const)).prodMk_space
          (contMDiffOn_const.mul contMDiff_snd.contMDiffOn)) (mapsTo_univ _ _)
    exact hdir.prodMk hdisk

/-- This open marked neighborhood contains the spanning disk, the whole
closed attaching solid torus, and the parallel disks defining its framing. -/
def protectedMeridianBox : Set Box := {x | ‖x.1‖ < 2 ∧ |x.2| < 1}

/-- The closed two-disk at each parallel level has its normal direction
given by the second coordinate. Its boundary is the corresponding parallel
of the meridian. -/
def meridianDisk (t : ℝ) (x : ClosedCell 2) : Box := (x.val, t)

theorem meridianDisk_inter_axis (t : ℝ) :
    range (meridianDisk t) ∩ range (fun s : ℝ => ((0 : V), s)) = {((0 : V), t)} := by
  ext x
  constructor
  · rintro ⟨⟨a, ha⟩, ⟨s, hs⟩⟩
    exact mem_singleton_iff.mpr (Prod.ext (congrArg Prod.fst hs).symm
      (congrArg Prod.snd ha).symm)
  · intro hx
    rcases mem_singleton_iff.mp hx with rfl
    exact ⟨⟨closedCellCenter 2, rfl⟩, ⟨t, rfl⟩⟩

theorem meridianDisk_in_protectedBox {t : ℝ} (ht : |t| < 1) :
    ∀ x : ClosedCell 2, meridianDisk t x ∈ protectedMeridianBox :=
  fun x => ⟨x.property.trans_lt (by norm_num), ht⟩

theorem diskFramedMeridian_bounds (v : C₁) (p : Tube) (hp : ‖p.2‖ ≤ 1) :
    p ∈ (diskFramedMeridian v).source ∧
      diskFramedMeridian v p ∈ protectedMeridianBox ∧
      (3 / 4 : ℝ) ≤ ‖(diskFramedMeridian v p).1‖ := by
  have h0 := abs_le.mp ((norm_diskCoordinates_le p.2 0).trans hp)
  have h1 := (norm_diskCoordinates_le p.2 1).trans hp
  have hr : 0 < 1 + p.2 0 / 4 := by linarith [h0.1]
  have hn : ‖(diskFramedMeridian v p).1‖ = 1 + p.2 0 / 4 := by
    change ‖(1 + p.2 0 / 4) • p.1.val‖ = _
    simp [norm_smul, Real.norm_eq_abs, abs_of_pos hr, norm_eq_of_mem_sphere]
  refine ⟨hr, ⟨?_, ?_⟩, ?_⟩
  · rw [hn]; linarith [h0.2]
  · change |p.2 1 / 4| < 1
    rw [abs_div, abs_of_pos (by norm_num : (0 : ℝ) < 4)]
    linarith
  · rw [hn]; linarith [h0.1]

/-- On the angular circle, the disk-coordinate direction `(0,4*t)`
gives the parallel bounding the level `t` meridian disk. -/
theorem diskFramedMeridian_parallel (v z : C₁) (t : ℝ) :
    diskFramedMeridian v (z, diskCoordinates.symm (0, 4 * t)) = (z.val, t) := by
  have h := diskCoordinates.apply_symm_apply (0, 4 * t)
  rw [diskCoordinates_apply] at h
  have h0 := congrArg Prod.fst h
  have h1 := congrArg Prod.snd h
  change (diskCoordinates.symm _) 0 = 0 at h0
  change (diskCoordinates.symm _) 1 = 4 * t at h1
  change ((1 + (diskCoordinates.symm _) 0 / 4) • z.val,
    (diskCoordinates.symm _) 1 / 4) = (z.val, t)
  simp [h0, h1]

section PhysicalChart

variable {X Y : Type*} [TopologicalSpace X] [ChartedSpace ThreeSpace X]
  [TopologicalSpace Y] [ChartedSpace ThreeSpace Y]

/-- The explicit meridian in the given physical chart about the retained
strand. The domain has the same circle and disk parameters as the
incoming tube in a marked mixed presentation. -/
def chartMeridian (v : C₁) (c : PartialDiffeomorph IB ThreeModel Box X ∞) :
    PartialDiffeomorph IT ThreeModel Tube X ∞ :=
  (diskFramedMeridian v).trans c

theorem chartMeridian_closedTube (v : C₁)
    (c : PartialDiffeomorph IB ThreeModel Box X ∞)
    (hsource : protectedMeridianBox ⊆ c.source) (p : Tube) (hp : ‖p.2‖ ≤ 1) :
    p ∈ (chartMeridian v c).source ∧
      (chartMeridian v c).symm (chartMeridian v c p) = p := by
  obtain ⟨ht, hc, _⟩ := diskFramedMeridian_bounds v p hp
  have hs : p ∈ (chartMeridian v c).source := ⟨ht, hsource hc⟩
  exact ⟨hs, (chartMeridian v c).left_inv hs⟩

/-- The full meridian tube misses the retained tube when the part of the
latter in the protected box lies in the thinner strand cylinder. -/
theorem diskFramedMeridian_disjoint_strandTube (v : C₁)
    (c : PartialDiffeomorph IB ThreeModel Box X ∞) (hsource : protectedMeridianBox ⊆ c.source)
    (strandTube : Set X)
    (hstrand : strandTube ∩ c '' protectedMeridianBox ⊆
      c '' {x ∈ protectedMeridianBox | ‖x.1‖ ≤ 1 / 2}) :
    Disjoint (chartMeridian v c '' {p | ‖p.2‖ ≤ 1}) strandTube := by
  rw [Set.disjoint_left]
  rintro x ⟨p, hp, rfl⟩ hx
  obtain ⟨_, hc, hrad⟩ := diskFramedMeridian_bounds v p hp
  obtain ⟨y, hy, hyeq⟩ := hstrand ⟨hx, ⟨diskFramedMeridian v p, hc, rfl⟩⟩
  have heq : y = diskFramedMeridian v p :=
    c.injOn (hsource hy.1) (hsource hc) hyeq
  rw [heq] at hy
  linarith [hy.2]

/-- The marked axis and the pushed spanning disk intersect in the marked
center. Away from the center the whole disk and the axis remain distinct.
The complementary axial and transverse linear directions are visible in
the same coordinates. -/
theorem chartMeridianDisk_inter_strand (c : PartialDiffeomorph IB ThreeModel Box X ∞)
    (hsource : protectedMeridianBox ⊆ c.source) (t : ℝ) (ht : |t| < 1) :
    range (fun x : ClosedCell 2 => c (meridianDisk t x)) ∩
      (fun s : ℝ => c ((0 : V), s)) '' {s | |s| < 1} = {c (0, t)} ∧
    ∀ v : Box, v = (v.1, 0) + (0, v.2) := by
  refine ⟨?_, fun v => by simp⟩
  ext x
  constructor
  · rintro ⟨⟨p, rfl⟩, ⟨s, hs, h⟩⟩
    have hax : ((0 : V), s) ∈ protectedMeridianBox := ⟨by norm_num, hs⟩
    have heq := c.injOn (hsource hax) (hsource (meridianDisk_in_protectedBox ht p)) h
    have hval : p.val = 0 := (congrArg Prod.fst heq).symm
    exact mem_singleton_iff.mpr (by change c (p.val, t) = c (0, t); rw [hval])
  · intro hx
    rcases mem_singleton_iff.mp hx with rfl
    exact ⟨⟨closedCellCenter 2, rfl⟩, ⟨t, ht, rfl⟩⟩

/-- A relative cancellation that fixes the indicated chart on its protected
box carries the constructed full meridian and its disk coordinates in
both directions. The surviving strand's whole marking is carried by the
same diffeomorphism even where the strand meets the cancellation support. -/
theorem protectedMeridian_transport (v : C₁)
    (c : PartialDiffeomorph IB ThreeModel Box X ∞)
    (c' : PartialDiffeomorph IB ThreeModel Box Y ∞)
    (e : X ≃ₘ^∞⟮ThreeModel, ThreeModel⟯ Y)
    (hs : protectedMeridianBox ⊆ c.source) (hs' : protectedMeridianBox ⊆ c'.source)
    (hfixed : EqOn (e ∘ c) c' protectedMeridianBox)
    (strandTube : PartialDiffeomorph IT ThreeModel Tube X ∞) :
    let b := chartMeridian v c
    let b' := chartMeridian v c'
    let a' := prefixResidualTube e.symm strandTube
    (∀ p : Tube, ‖p.2‖ ≤ 1 →
      e (b p) = b' p ∧ e.symm (b' p) = b p ∧ b'.symm (b' p) = p ∧ b.symm (b p) = p) ∧
      (∀ p : Tube, e.symm (a' p) = strandTube p) ∧
      (∀ y : Y, a'.symm y = strandTube.symm (e.symm y)) := by
  dsimp only
  have ha := prefixResidualTube_marked e.symm strandTube
  refine ⟨?_, ha.2.2.1, ha.2.2.2⟩
  intro p hp
  have h : e (chartMeridian v c p) = chartMeridian v c' p :=
    hfixed (diskFramedMeridian_bounds v p hp).2.1
  refine ⟨h, ?_, (chartMeridian_closedTube v c' hs' p hp).2,
    (chartMeridian_closedTube v c hs p hp).2⟩
  rw [← h, e.symm_apply_apply]

end PhysicalChart

section Winding

universe u

variable {X : Type u} [TopologicalSpace X] [ChartedSpace ThreeSpace X]

/-- The actual spanning disk through the physical chart, with the same
center and boundary as the disk framing. -/
def chartMeridianDisk (c : PartialDiffeomorph IB ThreeModel Box X ∞)
    (hsource : protectedMeridianBox ⊆ c.source) :
    C(ULift.{u} (ClosedCell 2), X) :=
  ⟨fun x => c (meridianDisk 0 x.down),
    c.toOpenPartialHomeomorph.continuousOn.comp_continuous
      ((continuous_subtype_val.comp continuous_uliftDown).prodMk continuous_const)
      (fun x => hsource (meridianDisk_in_protectedBox (by norm_num) x.down))⟩

private def diskBoundary : C(ULift.{u} (CellBoundary 2), ULift.{u} (ClosedCell 2)) :=
  ⟨fun z => ULift.up (cellBoundaryInclusion 2 z.down),
    continuous_uliftUp.comp ((continuous_cellBoundaryInclusion 2).comp continuous_uliftDown)⟩

/-- The actual core of the chart meridian is the boundary of its
parametrized spanning disk. -/
theorem chartMeridian_core_eq_diskBoundary (v : C₁)
    (c : PartialDiffeomorph IB ThreeModel Box X ∞)
    (hsource : protectedMeridianBox ⊆ c.source) (z : ULift.{u} (CellBoundary 2)) :
    let q : C₁ := ⟨z.down.val, mem_sphere_zero_iff_norm.mpr z.down.property⟩
    chartMeridian v c (q, 0) = ((chartMeridianDisk c hsource).comp diskBoundary) z := by
  dsimp only
  change c (((1 + (0 : V) 0 / 4) • z.down.val), (0 : V) 1 / 4) = c (z.down.val, 0)
  simp

/-- Winding zero on the physical lower boundary follows directly from
the actual local disk, before any normalization of the winding row. -/
theorem chartMeridian_core_windingZero (v : C₁)
    (c : PartialDiffeomorph IB ThreeModel Box X ∞)
    (hsource : protectedMeridianBox ⊆ c.source)
    (core : C(ULift.{u} (CellBoundary 2), X))
    (hcore : ∀ z, core z =
      chartMeridian v c (⟨z.down.val, mem_sphere_zero_iff_norm.mpr z.down.property⟩, 0))
    (z : IntegralHomology (ULift.{u} (CellBoundary 2)) 1) :
    integralHomologyMap 1 core z = 0 := by
  have he : core = (chartMeridianDisk c hsource).comp diskBoundary := by
    ext x
    exact (hcore x).trans (chartMeridian_core_eq_diskBoundary v c hsource x)
  let : ContractibleSpace (ClosedCell 2) := by
    have hball : {v : V | ‖v‖ ≤ 1} = Metric.closedBall 0 1 := by
      ext v
      simp [Metric.mem_closedBall, dist_zero_right]
    change ContractibleSpace ↥{v : V | ‖v‖ ≤ 1}
    rw [hball]
    exact (convex_closedBall _ _).contractibleSpace ⟨0, by simp⟩
  let : ContractibleSpace (ULift.{u} (ClosedCell 2)) :=
    (Homeomorph.ulift : ULift.{u} (ClosedCell 2) ≃ₜ ClosedCell 2).contractibleSpace
  have hD := SingularPair.isZero_of_contractible integralCoefficients
    (ULift.{u} (ClosedCell 2)) 1 one_ne_zero
  have hzero : integralHomologyMap 1 diskBoundary z = 0 :=
    congrArg (fun f : IntegralHomology (ULift.{u} (CellBoundary 2)) 1 ⟶
      IntegralHomology (ULift.{u} (ClosedCell 2)) 1 => f z) (hD.eq_of_tgt _ 0)
  rw [he]
  have hcomp : integralHomologyMap 1 ((chartMeridianDisk c hsource).comp diskBoundary) =
      integralHomologyMap 1 diskBoundary ≫ integralHomologyMap 1 (chartMeridianDisk c hsource) :=
    (integralHomologyFunctor 1).map_comp (TopCat.ofHom diskBoundary)
      (TopCat.ofHom (chartMeridianDisk c hsource))
  rw [hcomp]
  change integralHomologyMap 1 (chartMeridianDisk c hsource) (integralHomologyMap 1 diskBoundary z) = 0
  rw [hzero, map_zero]

end Winding

section Reassembly

universe u

variable {E H M : Type u} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [TopologicalSpace H] [TopologicalSpace M] [ChartedSpace H M]
  {I : ModelWithCorners ℝ E H}
  {P : MarkedMixedNativePresentation I M}

local notation "Labels" => NativeMiddleHandle
local notation "Trace(" a ")" => AdjunctionSpace (middleAttachingInclusion Labels) a

/-- The lower boundary factor restricts to the actual extension of the
inverse lower cancellation over the two retained handles. This identifies
both belt faces with their original handle coordinates. Consequently the
other two factors act on the original marked faces, in both handle orders
and both directions. The inclusions into the rounded traces are supplied. -/
theorem Closing.marked_retainedBelts (Q : Closing P)
    {R S L L' : Type u}
    [TopologicalSpace R] [TopologicalSpace S] [TopologicalSpace L] [TopologicalSpace L']
    (body : R ≃ₜ S) (boundary : L' ≃ₜ L) (i : L → S) (i' : L' → R)
    (hbody : ∀ x, body (i' x) = i (boundary x))
    (u : MiddleAttachingRegions Labels → L)
    (j : Q.beforeD.Carrier → Trace(i ∘ u))
    (j' : (P.outgoing .windingZero).Carrier → Trace(i' ∘ boundary.symm ∘ u))
    (hj : Function.Injective j)
    (restriction : ∀ x, j (Q.boundaryJ x) =
      prefixTraceHomeomorph body boundary i i' hbody u (j' x))
    (oldBelt : Labels → Handle.BeltRegion 2 2 → Q.beforeD.Carrier)
    (oldMarked : ∀ k p, j (oldBelt k p) =
      adjunctionCell (middleAttachingInclusion Labels) (i ∘ u) ⟨k, Handle.beltInclusion 2 2 p⟩)
    (newMarked : ∀ k p, j' (P.outgoingBelt .windingZero k p) =
      adjunctionCell (middleAttachingInclusion Labels) (i' ∘ boundary.symm ∘ u)
        ⟨k, Handle.beltInclusion 2 2 p⟩) :
    ∀ k p,
      let oldImage := Q.boundaryXiPlus (Q.delta (oldBelt k p))
      P.closing .windingZero (P.outgoingBelt .windingZero k p) = oldImage ∧
        (P.closing .windingZero).symm oldImage = P.outgoingBelt .windingZero k p ∧
      P.closing .windingOne (P.outgoingBelt .windingOne k p) = oldImage ∧
        (P.closing .windingOne).symm oldImage = P.outgoingBelt .windingOne k p := by
  intro k p
  have hJ : Q.boundaryJ (P.outgoingBelt .windingZero k p) = oldBelt k p := by
    apply hj
    rw [restriction, newMarked, oldMarked]
    exact (prefixTraceHomeomorph_handle body boundary i i' hbody u
      ⟨k, Handle.beltInclusion 2 2 p⟩).1
  have hZero : P.closing .windingZero (P.outgoingBelt .windingZero k p) =
       Q.boundaryXiPlus (Q.delta (oldBelt k p)) := by
    rw [Q.marked.1, hJ]
  have hOne : P.closing .windingOne (P.outgoingBelt .windingOne k p) =
       Q.boundaryXiPlus (Q.delta (oldBelt k p)) := by
    rw [Q.marked.2.2.1, P.orderBelt, hJ]
  exact ⟨hZero, by rw [← hZero, Diffeomorph.symm_apply_apply], hOne,
    by rw [← hOne, Diffeomorph.symm_apply_apply]⟩

end Reassembly

section StandardLowerBody

local notation "S₂" => Metric.sphere (0 : EuclideanSpace ℝ (Fin 3)) 1
local notation "U" => EuclideanSpace ℝ (Fin 1)
local notation "LowerBoundary" => sphereTwoTimesCircleLift.Carrier

private local instance : Fact (Module.finrank ℝ (EuclideanSpace ℝ (Fin 3)) = 2 + 1) := ⟨by simp⟩

private def inverseStereo {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    {n : ℕ} [Fact (Module.finrank ℝ E = n + 1)] (v : Metric.sphere (0 : E) 1) :
    PartialDiffeomorph (𝓡 n) (𝓡 n) (EuclideanSpace ℝ (Fin n)) (Metric.sphere (0 : E) 1) ∞ :=
  { toPartialEquiv := (stereographic' n v).symm.toPartialEquiv
    open_source := (stereographic' n v).open_target
    open_target := (stereographic' n v).open_source
    contMDiffOn_toFun := (stereographicInverse_isLocalDiffeomorph v).contMDiff.contMDiffOn
    contMDiffOn_invFun := (stereographic_isLocalDiffeomorphOn v).contMDiffOn }

private theorem inverseStereo_source {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    {n : ℕ} [Fact (Module.finrank ℝ E = n + 1)] (v : Metric.sphere (0 : E) 1) :
    (inverseStereo (n := n) v).source = univ :=
  stereographic'_target v

private def scaleCoordinates (E : Type*) [NormedAddCommGroup E] [NormedSpace ℝ E]
    (a : ℝ) (ha : a ≠ 0) : E ≃ₘ[ℝ] E where
  toEquiv := {
    toFun x := a • x
    invFun x := a⁻¹ • x
    left_inv x := by
      change a⁻¹ • (a • x) = x
      rw [smul_smul, inv_mul_cancel₀ ha, one_smul]
    right_inv x := by
      change a • (a⁻¹ • x) = x
      rw [smul_smul, mul_inv_cancel₀ ha, one_smul] }
  contMDiff_toFun := by
    change ContMDiff 𝓘(ℝ, E) 𝓘(ℝ, E) ∞ (fun x : E => a • x)
    exact ((contDiff_const : ContDiff ℝ ∞ (fun _ : E => a)).smul contDiff_id).contMDiff
  contMDiff_invFun := by
    change ContMDiff 𝓘(ℝ, E) 𝓘(ℝ, E) ∞ (fun x : E => a⁻¹ • x)
    exact ((contDiff_const : ContDiff ℝ ∞ (fun _ : E => a⁻¹)).smul contDiff_id).contMDiff

private def axialCoordinates : ℝ ≃L[ℝ] U :=
  ((EuclideanSpace.equiv (Fin 1) ℝ).trans (ContinuousLinearEquiv.funUnique (Fin 1) ℝ ℝ)).symm

private def transverseChart (p : S₂) (scale : ℝ) (h : scale ≠ 0) :
    PartialDiffeomorph IV (𝓡 2) V S₂ ∞ :=
  (scaleCoordinates V scale h).toPartialDiffeomorph.trans (inverseStereo (n := 2) p)

private def axialChart (v : C₁) :
    PartialDiffeomorph 𝓘(ℝ, ℝ) (𝓡 1) ℝ C₁ ∞ :=
  (scaleCoordinates ℝ (1 / 4) (by norm_num)).toPartialDiffeomorph.trans
    (axialCoordinates.toDiffeomorph.toPartialDiffeomorph.trans (inverseStereo v))

private theorem transverseChart_source (p : S₂) (scale : ℝ) (h : scale ≠ 0) :
    (transverseChart p scale h).source = univ := by
  ext x
  change (x ∈ univ ∧ (scaleCoordinates V scale h) x ∈ (inverseStereo (n := 2) p).source) ↔ x ∈ univ
  simp [inverseStereo_source]

private theorem axialChart_source (v : C₁) : (axialChart v).source = univ := by
  ext x
  change (x ∈ univ ∧ (scaleCoordinates ℝ (1 / 4) (by norm_num)) x ∈ univ ∧
    axialCoordinates ((scaleCoordinates ℝ (1 / 4) (by norm_num)) x) ∈ (inverseStereo v).source) ↔
    x ∈ univ
  simp [inverseStereo_source]

private def chartProduct {F₁ F₂ F₃ F₄ H₁ H₂ H₃ H₄ X₁ X₂ X₃ X₄ : Type*}
    [NormedAddCommGroup F₁] [NormedAddCommGroup F₂] [NormedAddCommGroup F₃] [NormedAddCommGroup F₄]
    [NormedSpace ℝ F₁] [NormedSpace ℝ F₂] [NormedSpace ℝ F₃] [NormedSpace ℝ F₄]
    [TopologicalSpace H₁] [TopologicalSpace H₂] [TopologicalSpace H₃] [TopologicalSpace H₄]
    [TopologicalSpace X₁] [TopologicalSpace X₂] [TopologicalSpace X₃] [TopologicalSpace X₄]
    [ChartedSpace H₁ X₁] [ChartedSpace H₂ X₂] [ChartedSpace H₃ X₃] [ChartedSpace H₄ X₄]
    {I₁ : ModelWithCorners ℝ F₁ H₁} {I₂ : ModelWithCorners ℝ F₂ H₂}
    {I₃ : ModelWithCorners ℝ F₃ H₃} {I₄ : ModelWithCorners ℝ F₄ H₄}
    (a : PartialDiffeomorph I₁ I₂ X₁ X₂ ∞) (b : PartialDiffeomorph I₃ I₄ X₃ X₄ ∞) :
    PartialDiffeomorph (I₁.prod I₃) (I₂.prod I₄) (X₁ × X₃) (X₂ × X₄) ∞ where
  toPartialEquiv := a.toPartialEquiv.prod b.toPartialEquiv
  open_source := a.open_source.prod b.open_source
  open_target := a.open_target.prod b.open_target
  contMDiffOn_toFun := a.contMDiffOn_toFun.prodMap b.contMDiffOn_toFun
  contMDiffOn_invFun := a.contMDiffOn_invFun.prodMap b.contMDiffOn_invFun

/-- The standard lower boundary is the product of the circle and the
two-sphere. Both factors use inverse stereographic coordinates, with the
axial coordinate restricted to an arc by the protected box. The coordinate
scale (1/4) sends the protected box strictly inside these charts. -/
def standardLowerChart (p : S₂) (v : C₁) :
    PartialDiffeomorph IB ThreeModel Box LowerBoundary ∞ :=
  (chartProduct (transverseChart p (1 / 4) (by norm_num)) (axialChart v)).trans
    sphereTwoTimesCircleModelCopy.equiv.toPartialDiffeomorph

theorem standardLowerChart_source (p : S₂) (v : C₁) :
    (standardLowerChart p v).source = univ := by
  ext x
  change ((x.1 ∈ (transverseChart p (1 / 4) (by norm_num)).source ∧
    x.2 ∈ (axialChart v).source) ∧
    (transverseChart p (1 / 4) (by norm_num) x.1, axialChart v x.2) ∈ (univ : Set SphereTwoTimesCircle)) ↔
    x ∈ univ
  simp [transverseChart_source, axialChart_source]

private theorem standardLowerChart_box (p : S₂) (v : C₁) :
    protectedMeridianBox ⊆ (standardLowerChart p v).source := by
  rw [standardLowerChart_source]
  exact subset_univ _

/-- The whole retained strand in the standard lower model is a product
circle. In the chosen patch it is the axial segment of this global curve. -/
def standardRetainedStrand (p : S₂) (z : C₁) : LowerBoundary :=
  sphereTwoTimesCircleModelCopy.equiv ((inverseStereo (n := 2) p) 0, z)

theorem standardRetainedStrand_smooth (p : S₂) :
    ContMDiff (𝓡 1) ThreeModel ∞ (standardRetainedStrand p) :=
  sphereTwoTimesCircleModelCopy.equiv.contMDiff.comp (contMDiff_const.prodMk contMDiff_id)

theorem standardRetainedStrand_embedding (p : S₂) :
    _root_.Topology.IsEmbedding (standardRetainedStrand p) :=
  sphereTwoTimesCircleModelCopy.equiv.toHomeomorph.isEmbedding.comp
    (isEmbedding_prodMkRight _)

theorem standardLowerChart_axis (p : S₂) (v : C₁) (t : ℝ) :
    standardLowerChart p v (0, t) = standardRetainedStrand p (axialChart v t) := by
  change sphereTwoTimesCircleModelCopy.equiv
    (inverseStereo (n := 2) p ((1 / 4 : ℝ) • (0 : V)), axialChart v t) =
    sphereTwoTimesCircleModelCopy.equiv (inverseStereo (n := 2) p 0, axialChart v t)
  rw [smul_zero]

/-- A global retained framed tube with normal radius (1/8) in the
sphere coordinates. Its restriction to the standard lower chart is
strictly thinner than the meridian radius. -/
def standardRetainedTube (p : S₂) : PartialDiffeomorph IT ThreeModel Tube LowerBoundary ∞ :=
  (Diffeomorph.prodComm (I := 𝓡 1) (J := IV) (M := C₁) (N := V) (n := ∞)).toPartialDiffeomorph.trans
    ((chartProduct (transverseChart p (1 / 8) (by norm_num))
      (Diffeomorph.refl (𝓡 1) C₁ ∞).toPartialDiffeomorph).trans
        sphereTwoTimesCircleModelCopy.equiv.toPartialDiffeomorph)

theorem standardRetainedTube_source (p : S₂) : (standardRetainedTube p).source = univ := by
  ext x
  change (x ∈ univ ∧ ((x.2 ∈ (transverseChart p (1 / 8) (by norm_num)).source ∧ x.1 ∈ univ) ∧
    (transverseChart p (1 / 8) (by norm_num) x.2, x.1) ∈ (univ : Set SphereTwoTimesCircle))) ↔ x ∈ univ
  simp [transverseChart_source]

theorem standardRetainedTube_core (p : S₂) (z : C₁) :
    standardRetainedTube p (z, 0) = standardRetainedStrand p z := by
  change sphereTwoTimesCircleModelCopy.equiv
    (inverseStereo (n := 2) p ((1 / 8 : ℝ) • (0 : V)), z) =
    sphereTwoTimesCircleModelCopy.equiv (inverseStereo (n := 2) p 0, z)
  rw [smul_zero]

/-- Explicit meridian on the standard returned lower boundary. -/
def standardLowerMeridian (p : S₂) (v : C₁) : PartialDiffeomorph IT ThreeModel Tube LowerBoundary ∞ :=
  chartMeridian v (standardLowerChart p v)

theorem standardLowerMeridian_closedTube (p : S₂) (v : C₁) (z : Tube) (hz : ‖z.2‖ ≤ 1) :
    z ∈ (standardLowerMeridian p v).source ∧
      (standardLowerMeridian p v).symm (standardLowerMeridian p v z) = z :=
  chartMeridian_closedTube v (standardLowerChart p v) (standardLowerChart_box p v) z hz

theorem standardLowerMeridian_disjoint_retainedTube (p : S₂) (v : C₁) :
    Disjoint (standardLowerMeridian p v '' {z | ‖z.2‖ ≤ 1})
      (standardRetainedTube p '' {z | ‖z.2‖ ≤ 1}) := by
  apply diskFramedMeridian_disjoint_strandTube v (standardLowerChart p v) (standardLowerChart_box p v)
  rintro _ ⟨⟨w, hw, rfl⟩, ⟨x, hx, he⟩⟩
  have hSphere : inverseStereo (n := 2) p ((1 / 4 : ℝ) • x.1) =
      inverseStereo (n := 2) p ((1 / 8 : ℝ) • w.2) :=
    congrArg Prod.fst (sphereTwoTimesCircleModelCopy.equiv.injective he)
  have heq := (inverseStereo (n := 2) p).injOn
    (show (1 / 4 : ℝ) • x.1 ∈ (inverseStereo (n := 2) p).source by simp [inverseStereo_source])
    (show (1 / 8 : ℝ) • w.2 ∈ (inverseStereo (n := 2) p).source by simp [inverseStereo_source])
    hSphere
  change ‖w.2‖ ≤ 1 at hw
  have hnorm := congrArg norm heq
  simp only [norm_smul, Real.norm_eq_abs, abs_of_nonneg (by norm_num : (0 : ℝ) ≤ 1 / 4),
    abs_of_nonneg (by norm_num : (0 : ℝ) ≤ 1 / 8)] at hnorm
  exact ⟨x, ⟨hx, by linarith⟩, he⟩

def standardLowerMeridianCore (p : S₂) (v : C₁) :
    C(ULift.{0} (CellBoundary 2), LowerBoundary) :=
  (chartMeridianDisk (standardLowerChart p v) (standardLowerChart_box p v)).comp diskBoundary

theorem standardLowerMeridianCore_marked (p : S₂) (v : C₁) (z : ULift.{0} (CellBoundary 2)) :
    standardLowerMeridianCore p v z =
      standardLowerMeridian p v (⟨z.down.val, mem_sphere_zero_iff_norm.mpr z.down.property⟩, 0) :=
  (chartMeridian_core_eq_diskBoundary v (standardLowerChart p v) (standardLowerChart_box p v) z).symm

theorem standardLowerMeridian_windingZero (p : S₂) (v : C₁)
    (z : IntegralHomology (ULift.{0} (CellBoundary 2)) 1) :
    integralHomologyMap 1 (standardLowerMeridianCore p v) z = 0 :=
  chartMeridian_core_windingZero v (standardLowerChart p v) (standardLowerChart_box p v)
    (standardLowerMeridianCore p v) (standardLowerMeridianCore_marked p v) z


end StandardLowerBody

section ActualRetainedTube

variable {X : Type*} [TopologicalSpace X] [ChartedSpace ThreeSpace X]

/-- The protected box in the coordinates of the actual retained tube,
using an axial circle arc and a quarter-scale normal disk. -/
def boxInRetainedTube (v : C₁) : PartialDiffeomorph IB IT Box Tube ∞ :=
  (chartProduct (scaleCoordinates V (1 / 4) (by norm_num)).toPartialDiffeomorph
    (axialChart v)).trans (Diffeomorph.prodComm (I := IV) (J := 𝓡 1)
      (M := V) (N := C₁) (n := ∞)).toPartialDiffeomorph

theorem boxInRetainedTube_apply (v : C₁) (x : Box) :
    boxInRetainedTube v x = (axialChart v x.2, (1 / 4 : ℝ) • x.1) := rfl

theorem boxInRetainedTube_source (v : C₁) : (boxInRetainedTube v).source = univ := by
  ext x
  change ((x.1 ∈ univ ∧ x.2 ∈ (axialChart v).source) ∧
    ((1 / 4 : ℝ) • x.1, axialChart v x.2) ∈ (univ : Set (V × C₁))) ↔ x ∈ univ
  simp [axialChart_source]

/-- The chart on the actual marked (A)-tube. The old transverse parameter
zero is the axis in these coordinates, independently of the global knot. -/
def retainedTubeMeridianChart (v : C₁) (T : PartialDiffeomorph IT ThreeModel Tube X ∞) :
    PartialDiffeomorph IB ThreeModel Box X ∞ :=
  (boxInRetainedTube v).trans T

theorem retainedTubeMeridianChart_axis (v : C₁) (T : PartialDiffeomorph IT ThreeModel Tube X ∞)
    (t : ℝ) : retainedTubeMeridianChart v T (0, t) = T (axialChart v t, 0) := by
  change T (boxInRetainedTube v (0, t)) = _
  rw [boxInRetainedTube_apply, smul_zero]

theorem retainedTubeMeridianChart_box (v : C₁) (T : PartialDiffeomorph IT ThreeModel Tube X ∞)
    (hT : ∀ p : Tube, ‖p.2‖ ≤ 1 → p ∈ T.source) :
    protectedMeridianBox ⊆ (retainedTubeMeridianChart v T).source := by
  intro x hx
  have hx1 : ‖x.1‖ < 2 := hx.1
  refine ⟨by simp [boxInRetainedTube_source], hT (boxInRetainedTube v x) ?_⟩
  rw [boxInRetainedTube_apply, norm_smul, Real.norm_eq_abs, abs_of_nonneg (by norm_num : 0 ≤ (1 / 4 : ℝ))]
  linarith

/-- Construct the framed meridian in the actual tubular coordinates,
retaining its two normal parameters. -/
def retainedTubeMeridian (v : C₁) (T : PartialDiffeomorph IT ThreeModel Tube X ∞) :
    PartialDiffeomorph IT ThreeModel Tube X ∞ :=
  chartMeridian v (retainedTubeMeridianChart v T)

theorem retainedTubeMeridian_disjoint_shrunk (v : C₁)
    (T : PartialDiffeomorph IT ThreeModel Tube X ∞)
    (hT : ∀ p : Tube, ‖p.2‖ ≤ 1 → p ∈ T.source) :
    Disjoint (retainedTubeMeridian v T '' {p | ‖p.2‖ ≤ 1})
      (T '' {p | ‖p.2‖ ≤ 1 / 8}) := by
  apply diskFramedMeridian_disjoint_strandTube v (retainedTubeMeridianChart v T)
    (retainedTubeMeridianChart_box v T hT)
  rintro _ ⟨⟨w, hw, rfl⟩, ⟨x, hx, he⟩⟩
  have hw' : ‖w.2‖ ≤ (1 / 8 : ℝ) := hw
  have hxT := (retainedTubeMeridianChart_box v T hT hx).2
  have hEq : boxInRetainedTube v x = w := T.injOn hxT (hT w (by linarith)) he
  have hNorm := congrArg (fun p : Tube => ‖p.2‖) hEq
  rw [boxInRetainedTube_apply] at hNorm
  change ‖(1 / 4 : ℝ) • x.1‖ = ‖w.2‖ at hNorm
  rw [norm_smul, Real.norm_eq_abs, abs_of_nonneg (by norm_num : 0 ≤ (1 / 4 : ℝ))] at hNorm
  exact ⟨x, ⟨hx, by linarith⟩, he⟩

/-- Return both inverses in the actual boundary. The same original tube
reads the meridian coordinates and recovers every point of the shrunk
retained tube. -/
theorem retainedTubeMeridian_inverses (v : C₁)
    (T : PartialDiffeomorph IT ThreeModel Tube X ∞)
    (hT : ∀ p : Tube, ‖p.2‖ ≤ 1 → p ∈ T.source) (p w : Tube)
    (hp : ‖p.2‖ ≤ 1) (hw : ‖w.2‖ ≤ 1 / 8) :
    T.symm (retainedTubeMeridian v T p) = boxInRetainedTube v (diskFramedMeridian v p) ∧
      (retainedTubeMeridian v T).symm (retainedTubeMeridian v T p) = p ∧
      T.symm (T w) = w := by
  have hx := (diskFramedMeridian_bounds v p hp).2.1
  exact ⟨T.left_inv ((retainedTubeMeridianChart_box v T hT hx).2),
    (chartMeridian_closedTube v (retainedTubeMeridianChart v T)
      (retainedTubeMeridianChart_box v T hT) p hp).2, T.left_inv (hT w (by linarith))⟩

theorem retainedTubeMeridian_core_windingZero (v : C₁)
    (T : PartialDiffeomorph IT ThreeModel Tube X ∞)
    (hT : ∀ p : Tube, ‖p.2‖ ≤ 1 → p ∈ T.source)
    (core : C(ULift (CellBoundary 2), X))
    (hcore : ∀ z, core z =
      retainedTubeMeridian v T (⟨z.down.val, mem_sphere_zero_iff_norm.mpr z.down.property⟩, 0))
    (z : IntegralHomology (ULift (CellBoundary 2)) 1) :
    integralHomologyMap 1 core z = 0 :=
  chartMeridian_core_windingZero v (retainedTubeMeridianChart v T)
    (retainedTubeMeridianChart_box v T hT) core hcore z

end ActualRetainedTube

end SmoothPoincare.HMP
