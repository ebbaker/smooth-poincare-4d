import SmoothPoincare

/-! # Independent replay of the Figure 3 collar on the standard lower model -/

open Set Metric Manifold DifferentialGeometry DifferentialGeometry.Topology
open DifferentialGeometry.PDE.RicciFlow.Surgery.Topology
open SmoothPoincare SmoothPoincare.HMP SmoothPoincare.RelativePairReplacement
open scoped Manifold ContDiff RealInnerProductSpace

noncomputable section

namespace E54HMPChecks

local notation "V" => StandardSurgeryModel.Block 1
local notation "C₁" => StandardSurgeryModel.BoundarySphere 1
local notation "Tube" => C₁ × V

private def e₀ : V := EuclideanSpace.single (0 : Fin 2) (1 : ℝ)
private def e₁ : V := EuclideanSpace.single (1 : Fin 2) (1 : ℝ)

private theorem norm_e₀ : ‖e₀‖ = 1 := by simp [e₀, EuclideanSpace.single]
private theorem norm_e₁ : ‖e₁‖ = 1 := by simp [e₁, EuclideanSpace.single]

private def angle : C₁ := ⟨e₀, mem_sphere_zero_iff_norm.mpr norm_e₀⟩
private def pole : sphere (0 : EuclideanSpace ℝ (Fin 3)) 1 :=
  ⟨EuclideanSpace.single (0 : Fin 3) (1 : ℝ), by
    simp [EuclideanSpace.single]⟩

private abbrev tube := standardRetainedTube pole
local notation "T" => tube

private theorem chartSource (p : Tube) : p ∈ tube.source := by
  rw [standardRetainedTube_source]
  exact mem_univ _

private theorem radiusTwo (p : Tube) (_ : ‖p.2‖ ≤ 2) : p ∈ tube.source := chartSource p

private def lowerTime : CollarTime := ⟨1 / 4, by norm_num⟩
private def upperTime : CollarTime := ⟨3 / 4, by norm_num⟩
private def middleTime : CollarTime := ⟨1 / 2, by norm_num⟩

-- Tests both buffer faces with a point on the rim of the full attaching disk.
example :
    let p : Tube := (angle, e₁)
    let K := retainedTraceTrack T radiusTwo
    K (T p, lowerTime) = (T p, lowerTime) ∧
      K.symm (T p, lowerTime) = (T p, lowerTime) ∧
      K (T p, upperTime) = (T (angle, (1 / 8 : ℝ) • e₁), upperTime) ∧
      K.symm (T (angle, (1 / 8 : ℝ) • e₁), upperTime) = (T p, upperTime) := by
  intro p K
  have hl : lowerTime.val ≤ 1 / 3 := by norm_num [lowerTime]
  have hu : 2 / 3 ≤ upperTime.val := by norm_num [upperTime]
  have hp : ‖p.2‖ ≤ 1 := by simp [p, norm_e₁]
  have hshrink := shrunkTraceTube_apply T radiusTwo hp
  have hout := retainedTraceTrack_tube_germ T radiusTwo hu p
  rw [hshrink] at hout
  exact ⟨((retainedTraceTrack_faces T radiusTwo (T p) lowerTime).1 hl).1,
    ((retainedTraceTrack_faces T radiusTwo (T p) lowerTime).1 hl).2, hout.1, hout.2⟩

-- A point strictly beyond the moving tube stays fixed during the transition.
example :
    let p : Tube := (angle, (3 : ℝ) • e₀)
    let K := retainedTraceTrack T radiusTwo
    K (T p, middleTime) = (T p, middleTime) ∧
      K.symm (T p, middleTime) = (T p, middleTime) := by
  intro p K
  apply retainedTraceTrack_fixed
  rintro ⟨q, hq, heq⟩
  have hqp := tube.injOn (chartSource q) (chartSource p) heq
  have h := hq
  rw [hqp] at h
  norm_num [p, norm_smul, norm_e₀] at h

-- The old meridian comes from a strict exterior annulus at an off-core
-- parameter with both its transverse and axial coordinates active.
example :
    let p : Tube := (angle, (1 / 2 : ℝ) • e₀ + (1 / 2 : ℝ) • e₁)
    let old := originalTraceMeridian T radiusTwo angle
    let new := retainedTubeMeridian angle T
    (∃ q : Tube, 1 < ‖q.2‖ ∧ ‖q.2‖ < 2 ∧
      q.1 = (boxInRetainedTube angle (diskFramedMeridian angle p)).1 ∧ T q = old p) ∧
    old p ∉ T '' {q : Tube | ‖q.2‖ ≤ 1} ∧
    retainedTraceTrack T radiusTwo (old p, upperTime) = (new p, upperTime) ∧
    (retainedTraceTrack T radiusTwo).symm (new p, upperTime) = (old p, upperTime) := by
  intro p old new
  have hp : ‖p.2‖ ≤ 1 := by
    change ‖(1 / 2 : ℝ) • e₀ + (1 / 2 : ℝ) • e₁‖ ≤ 1
    calc
      _ ≤ ‖(1 / 2 : ℝ) • e₀‖ + ‖(1 / 2 : ℝ) • e₁‖ := norm_add_le _ _
      _ = 1 := by norm_num [norm_smul, norm_e₀, norm_e₁]
  have hu : 2 / 3 ≤ upperTime.val := by norm_num [upperTime]
  have hm : retainedTubeShrink T radiusTwo 1 (old p) = new p :=
    originalTraceMeridian_transport T radiusTwo angle p
  have hforward : retainedTraceTrack T radiusTwo (old p, upperTime) = (new p, upperTime) := by
    rw [((retainedTraceTrack_faces T radiusTwo (old p) upperTime).2 hu).1, hm]
  refine ⟨originalTraceMeridian_annulus T radiusTwo angle p hp, ?_, hforward, ?_⟩
  · exact (Set.disjoint_left.mp (originalTraceMeridian_disjoint T radiusTwo angle)) ⟨p, hp, rfl⟩
  · rw [← hforward, Diffeomorph.symm_apply_apply]

example :
    let c := originalTraceMeridianChart T radiusTwo angle
    range (fun p : ClosedCell 2 => c (meridianDisk (1 / 2) p)) ∩
      (fun t : ℝ => c (0,t)) '' {t | |t| < 1} =
        {retainedTubeMeridianChart angle T (0,(1 / 2 : ℝ))} := by
  intro c
  rw [originalTraceMeridian_disk T radiusTwo angle (1 / 2) (by norm_num)]
  exact congrArg singleton (originalTraceMeridianChart_axis T radiusTwo angle (1 / 2))

local notation "X" => sphereTwoTimesCircleLift.Carrier

example (a : Handle.AttachingRegion 2 2) :
    let F := retainedTubeShrink T radiusTwo 1
    let u := originalRetainedPairTubes T radiusTwo angle
    let u' := shrunkRetainedPairTubes T radiusTwo angle
    F (u ⟨false, a⟩) = u' ⟨false, a⟩ ∧ F (u ⟨true, a⟩) = u' ⟨true, a⟩ := by
  intro F u u'
  exact ⟨congrFun (retainedPairTubes_transport T radiusTwo angle) ⟨false,a⟩,
    congrFun (retainedPairTubes_transport T radiusTwo angle) ⟨true,a⟩⟩

example (a : MiddleHandles Bool) :
    let j : X → X := id
    let u := originalRetainedPairTubes T radiusTwo angle
    let G := retainedPairTraceHomeomorph T radiusTwo j u
    let i := middleAttachingInclusion Bool
    let φ := adjunctionCell bandIn j ∘ bandOut ∘ u
    let ψ := adjunctionCell bandIn j ∘ bandOut ∘ retainedTubeShrink T radiusTwo 1 ∘ u
    G (adjunctionCell i φ a) = adjunctionCell i ψ a ∧
      G.symm (adjunctionCell i ψ a) = adjunctionCell i φ a :=
  (retainedPairTrace_representatives T radiusTwo id (originalRetainedPairTubes T radiusTwo angle)).2.2 a

#print axioms retainedTube_enlarged_support
#print axioms retainedTraceTrack
#print axioms retainedTraceTrack_tube_germ
#print axioms originalTraceMeridian_disjoint
#print axioms originalTraceMeridian_annulus
#print axioms originalTraceMeridian_disk
#print axioms retainedTraceTrack_meridian_germ
#print axioms retainedPairTrace_representatives
#print axioms normalizedRetainedPairTraceHomeomorph

end E54HMPChecks
