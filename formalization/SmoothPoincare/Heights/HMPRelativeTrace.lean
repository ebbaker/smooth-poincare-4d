import SmoothPoincare.Heights.HMPFramedShrink
import SmoothPoincare.Heights.RelativePairReplacement
import Mathlib.Analysis.Normed.Module.Ball.Pointwise

/-! # A relative trace for the actual retained Figure 3 attachment -/

noncomputable section
open Set Function Manifold Metric
open DifferentialGeometry DifferentialGeometry.Topology
open DifferentialGeometry.PDE.RicciFlow.Surgery.Topology
open SmoothPoincare.RelativePairReplacement
open scoped ContDiff Manifold

namespace SmoothPoincare.HMP

local notation "V" => StandardSurgeryModel.Block 1
local notation "C₁" => StandardSurgeryModel.BoundarySphere 1
local notation "Tube" => C₁ × V
local notation "IT" => ModelWithCorners.prod (𝓡 1) (𝓘(ℝ, V))
local notation "Time" => CollarTime
local notation "CX" => ModelWithCorners.prod ThreeModel (𝓡∂ 1)

/-- An ordinary open tubular extension of the whole unit attachment
gives a uniform larger support. The open set may be the complement of
all protected compact sectors. -/
theorem retainedTube_enlarged_support
    {X : Type*} [TopologicalSpace X] [ChartedSpace ThreeSpace X]
    (T : PartialDiffeomorph IT ThreeModel Tube X ∞)
    (U : Set X) (hU : IsOpen U)
    (h : ∀ p : Tube, ‖p.2‖ ≤ 1 → p ∈ T.source ∧ T p ∈ U) :
    ∃ R : ℝ, 1 < R ∧ ∀ p : Tube, ‖p.2‖ ≤ R → p ∈ T.source ∧ T p ∈ U := by
  let N : Set Tube := T.source ∩ T ⁻¹' U
  have hN : IsOpen N :=
    T.contMDiffOn_toFun.continuousOn.isOpen_inter_preimage T.open_source hU
  have : CompactSpace C₁ := isCompact_iff_compactSpace.mp (isCompact_sphere _ _)
  have hprod : (univ : Set C₁) ×ˢ closedBall (0 : V) 1 ⊆ N := by
    intro p hp
    exact h p (by simpa [dist_zero_right] using hp.2)
  obtain ⟨L, M, -, hM, hL', hM', hLM⟩ :=
    generalized_tube_lemma isCompact_univ (isCompact_closedBall (0 : V) 1) hN hprod
  obtain ⟨ε, hε, hclose⟩ := (isCompact_closedBall (0 : V) 1).exists_cthickening_subset_open hM hM'
  refine ⟨1 + ε, by linarith, fun p hp => hLM ⟨hL' (mem_univ _), hclose ?_⟩⟩
  rw [cthickening_closedBall hε.le zero_le_one (0 : V)]
  simpa only [mem_closedBall, dist_zero_right, add_comm ε 1] using hp

section RelativeTrace

variable {X : Type*} [TopologicalSpace X] [ChartedSpace ThreeSpace X] [T2Space X]
  (T : PartialDiffeomorph IT ThreeModel Tube X ∞)
  (hT : ∀ p : Tube, ‖p.2‖ ≤ 2 → p ∈ T.source)

private def traceIsotopy (t : Time) := retainedTubeShrink T hT t.val

omit [T2Space X] in
private theorem timeToReal_smooth :
    ContMDiff CX (ThreeModel.prod 𝓘(ℝ, ℝ)) ∞
      (fun p : X × Time => (p.1,p.2.val)) := by
  have ht : ContMDiff (𝓡∂ 1) 𝓘(ℝ, ℝ) ∞ (fun t : Time => t.val) :=
    contMDiff_subtypeVal_Icc
  exact contMDiff_fst.prodMk (ht.comp contMDiff_snd)

private theorem traceIsotopy_smooth :
    ContMDiff CX ThreeModel ∞ (fun p : X × Time => traceIsotopy T hT p.2 p.1) := by
  have h := (retainedTubeShrink_contMDiff T hT).comp (timeToReal_smooth (X := X))
  exact h

private theorem traceIsotopy_symm_smooth :
    ContMDiff CX ThreeModel ∞ (fun p : X × Time => (traceIsotopy T hT p.2).symm p.1) := by
  have h := (retainedTubeShrink_symm_contMDiff T hT).comp (timeToReal_smooth (X := X))
  exact h

private theorem traceIsotopy_inlet :
    traceIsotopy T hT inlet = Diffeomorph.refl ThreeModel X ∞ := by
  ext x
  exact retainedTubeShrink_zero T hT x

/-- The actual product collar with a stationary buffer at each end. The
endpoint diffeomorphism is the specified shrink of the whole (A) tube. -/
def retainedTraceTrack : (X × Time) ≃ₘ^∞⟮CX, CX⟯ (X × Time) :=
  pairMoveTrack (traceIsotopy T hT) (traceIsotopy_smooth T hT) (traceIsotopy_symm_smooth T hT)

theorem retainedTraceTrack_faces (x : X) (t : Time) :
    let K := retainedTraceTrack T hT
    (t.val ≤ 1 / 3 → K (x,t) = (x,t) ∧ K.symm (x,t) = (x,t)) ∧
    (2 / 3 ≤ t.val → K (x,t) = (retainedTubeShrink T hT 1 x,t) ∧
      K.symm (x,t) = ((retainedTubeShrink T hT 1).symm x,t)) :=
  pairMoveTrack_faces _ _ _ (traceIsotopy_inlet T hT) x t

theorem retainedTraceTrack_fixed {x : X} (hx : x ∉ T '' {p : Tube | ‖p.2‖ ≤ 2}) (t : Time) :
    retainedTraceTrack T hT (x,t) = (x,t) ∧ (retainedTraceTrack T hT).symm (x,t) = (x,t) :=
  pairMoveTrack_fixed _ _ _ (fun s => retainedTubeShrink_fixed T hT s.val hx) t

/-- This whole enlarged target chart is transported by the endpoint
diffeomorphism, including outside the closed handle attachment. -/
def shrunkTraceTube : PartialDiffeomorph IT ThreeModel Tube X ∞ :=
  T.trans (retainedTubeShrink T hT 1).toPartialDiffeomorph

theorem shrunkTraceTube_apply {p : Tube} (hp : ‖p.2‖ ≤ 1) :
    shrunkTraceTube T hT p = T (p.1, (1 / 8 : ℝ) • p.2) :=
  retainedTubeShrink_one T hT hp

/-- The smooth overlap follows from the transported *open* marking,
without an equality assumption on the rim jets of a second tube. -/
theorem retainedTraceTrack_tube_germ {t : Time} (ht : 2 / 3 ≤ t.val) (p : Tube) :
    retainedTraceTrack T hT (T p,t) = (shrunkTraceTube T hT p,t) ∧
    (retainedTraceTrack T hT).symm (shrunkTraceTube T hT p,t) = (T p,t) := by
  exact pairMoveTrack_tube_germ (traceIsotopy T hT) (traceIsotopy_smooth T hT)
    (traceIsotopy_symm_smooth T hT) T (shrunkTraceTube T hT) (fun _ => rfl) ht p

/-- The thick closed handle parameters in the same marked coordinates. -/
def traceTubeParam (p : Handle.AttachingRegion 2 2) : Tube :=
  (⟨p.1.val, mem_sphere_zero_iff_norm.mpr p.1.property⟩, p.2.val)

theorem traceTubeParam_norm (p : Handle.AttachingRegion 2 2) :
    ‖(traceTubeParam p).2‖ ≤ 1 := p.2.property

/-- Pull back the auxiliary disk-framed meridian before attaching either
handle. Its entire extended marked chart is pulled back, not just its core. -/
def originalTraceMeridianChart (v : C₁) :=
  (retainedTubeMeridianChart v T).trans (retainedTubeShrink T hT 1).symm.toPartialDiffeomorph

def originalTraceMeridian (v : C₁) : PartialDiffeomorph IT ThreeModel Tube X ∞ :=
  chartMeridian v (originalTraceMeridianChart T hT v)

theorem originalTraceMeridian_transport (v : C₁) (p : Tube) :
    retainedTubeShrink T hT 1 (originalTraceMeridian T hT v p) =
      retainedTubeMeridian v T p := by
  exact (retainedTubeShrink T hT 1).apply_symm_apply _

/-- The shrink fixes the whole core, and hence pulling back the meridian
chart leaves its marked axial parameter on the original core. -/
theorem originalTraceMeridianChart_axis (v : C₁) (s : ℝ) :
    originalTraceMeridianChart T hT v (0,s) = retainedTubeMeridianChart v T (0,s) := by
  change (retainedTubeShrink T hT 1).symm (retainedTubeMeridianChart v T (0,s)) = _
  rw [retainedTubeMeridianChart_axis]
  let p : Tube := boxInRetainedTube v (0,s)
  have hz : p.2 = 0 := by simp [p, boxInRetainedTube_apply]
  have hp : ‖p.2‖ ≤ 1 := by simp [hz]
  have hf := retainedTubeShrink_one_inverse T hT hp
  simpa only [p, boxInRetainedTube_apply, smul_zero] using hf

/-- On the original incoming boundary the pulled-back meridian and the
whole original closed attaching torus are disjoint. -/
theorem originalTraceMeridian_disjoint (v : C₁) :
    Disjoint (originalTraceMeridian T hT v '' {p | ‖p.2‖ ≤ 1})
      (T '' {p | ‖p.2‖ ≤ 1}) := by
  rw [Set.disjoint_left]
  rintro x ⟨p, hp, rfl⟩ ⟨q, hq, he⟩
  have hq' : ‖q.2‖ ≤ 1 := hq
  have himg : retainedTubeMeridian v T p = T (q.1, (1 / 8 : ℝ) • q.2) := by
    rw [← originalTraceMeridian_transport T hT v, ← he, retainedTubeShrink_one T hT hq']
  apply Set.disjoint_left.mp (retainedTubeMeridian_disjoint_shrunk v T
    (fun z hz => hT z (hz.trans (by norm_num)))) ⟨p, hp, rfl⟩
  refine ⟨(q.1, (1 / 8 : ℝ) • q.2), ?_, himg.symm⟩
  change ‖(1 / 8 : ℝ) • q.2‖ ≤ 1 / 8
  rw [norm_smul, Real.norm_of_nonneg (by norm_num : (0 : ℝ) ≤ 1 / 8)]
  linarith

/-- The pullback is confined to the open annulus of the actual original
tube, between its attachment and the outer boundary of the shrink. -/
theorem originalTraceMeridian_annulus (v : C₁) (p : Tube) (hp : ‖p.2‖ ≤ 1) :
    ∃ q : Tube, 1 < ‖q.2‖ ∧ ‖q.2‖ < 2 ∧
      q.1 = (boxInRetainedTube v (diskFramedMeridian v p)).1 ∧
      T q = originalTraceMeridian T hT v p := by
  let r := boxInRetainedTube v (diskFramedMeridian v p)
  have hrad : ‖r.2‖ = (1 / 4 : ℝ) * ‖(diskFramedMeridian v p).1‖ := by
    change ‖(1 / 4 : ℝ) • (diskFramedMeridian v p).1‖ = _
    rw [norm_smul, Real.norm_of_nonneg (by norm_num : (0 : ℝ) ≤ 1 / 4)]
  obtain ⟨_, hbox, hmin⟩ := diskFramedMeridian_bounds v p hp
  have hbox' : ‖(diskFramedMeridian v p).1‖ < 2 := hbox.1
  have hrmin : 3 / 16 ≤ ‖r.2‖ := by linarith
  have hrmax : ‖r.2‖ < 1 / 2 := by linarith
  let q : Tube := (r.1, framedDiskUnshrink 1 r.2)
  have hqmax : ‖q.2‖ < 2 := by
    by_contra! h
    have hh := framedDiskShrink_outer 1 h
    change framedDiskShrink 1 (framedDiskUnshrink 1 r.2) = framedDiskUnshrink 1 r.2 at hh
    rw [framedDiskShrink_unshrink] at hh
    change 2 ≤ ‖framedDiskUnshrink 1 r.2‖ at h
    rw [← hh] at h
    linarith
  have hqmin : 1 < ‖q.2‖ := by
    by_contra! h
    have hh := framedDiskShrink_one h
    change framedDiskShrink 1 (framedDiskUnshrink 1 r.2) =
      (1 / 8 : ℝ) • q.2 at hh
    rw [framedDiskShrink_unshrink] at hh
    have hn := congrArg norm hh
    rw [norm_smul, Real.norm_of_nonneg (by norm_num : (0 : ℝ) ≤ 1 / 8)] at hn
    linarith
  refine ⟨q, hqmin, hqmax, rfl, ?_⟩
  apply (retainedTubeShrink T hT 1).injective
  change retainedTubeShrink T hT 1 (T q) = retainedTubeShrink T hT 1 (originalTraceMeridian T hT v p)
  rw [originalTraceMeridian_transport]
  change framedTubeExtension T framedDiskShrink 1 (T q) = T r
  rw [framedTubeExtension_apply T framedDiskShrink 1 (hT q hqmax.le)]
  change T (r.1, framedDiskShrink 1 (framedDiskUnshrink 1 r.2)) = T r
  rw [framedDiskShrink_unshrink, Prod.eta]

/-- The spanning disks and their parallels in the original marking use
the same pulled-back chart as the full meridian. -/
theorem originalTraceMeridian_disk (v : C₁) (s : ℝ) (hs : |s| < 1) :
    range (fun x : ClosedCell 2 => originalTraceMeridianChart T hT v (meridianDisk s x)) ∩
      (fun t : ℝ => originalTraceMeridianChart T hT v (0,t)) '' {t | |t| < 1} =
        {originalTraceMeridianChart T hT v (0,s)} := by
  have hsource : protectedMeridianBox ⊆ (originalTraceMeridianChart T hT v).source := by
    intro p hp
    exact ⟨retainedTubeMeridianChart_box v T (fun z hz => hT z (hz.trans (by norm_num))) hp,
      mem_univ _⟩
  exact (chartMeridianDisk_inter_strand _ hsource s hs).1

/-- This is the whole (b) chart on the upper plateau, with no change to
the inverse disk or circle parameters on the overlap. -/
theorem retainedTraceTrack_meridian_germ (v : C₁) {t : Time} (ht : 2 / 3 ≤ t.val) (p : Tube) :
    retainedTraceTrack T hT (originalTraceMeridian T hT v p,t) = (retainedTubeMeridian v T p,t) ∧
    (retainedTraceTrack T hT).symm (retainedTubeMeridian v T p,t) =
      (originalTraceMeridian T hT v p,t) :=
  pairMoveTrack_tube_germ (traceIsotopy T hT) (traceIsotopy_smooth T hT)
    (traceIsotopy_symm_smooth T hT) (originalTraceMeridian T hT v) (retainedTubeMeridian v T)
    (originalTraceMeridian_transport T hT v) ht p

section Adjunction

variable {P J : Type*} [TopologicalSpace P] (j : X → P)

/-- The full simultaneous trace adjunction with the common lower collar. -/
abbrev RetainedPairTrace (u : MiddleAttachingRegions J → X) :=
  AdjunctionSpace (middleAttachingInclusion J) (adjunctionCell bandIn j ∘ bandOut ∘ u)

private theorem retainedTrace_inlet (x : X) :
    retainedTraceTrack T hT (bandIn x) = bandIn x :=
  ((retainedTraceTrack_faces T hT x inlet).1 (by change (0 : ℝ) ≤ 1/3; norm_num)).1

private theorem retainedTrace_outlet (x : X) :
    retainedTraceTrack T hT (bandOut x) = bandOut (retainedTubeShrink T hT 1 x) :=
  ((retainedTraceTrack_faces T hT x outlet).2 (by change (2 / 3 : ℝ) ≤ 1; norm_num)).1

/-- Attach all the handles with their whole transported markings and
leave every point of each handle unchanged in its handle coordinates. -/
def retainedPairTraceHomeomorph (u : MiddleAttachingRegions J → X) :
    RetainedPairTrace j u ≃ₜ RetainedPairTrace j (retainedTubeShrink T hT 1 ∘ u) :=
  adjunctionHomeomorph _ _ _ _ (Equiv.refl _) (Homeomorph.refl _)
    (pairMovePrefixHomeomorph j (retainedTraceTrack T hT).toHomeomorph
      (retainedTrace_inlet T hT))
    (fun _ => rfl) (fun p => congrArg (adjunctionCell bandIn j) (retainedTrace_outlet T hT (u p)))

theorem retainedPairTrace_representatives (u : MiddleAttachingRegions J → X) :
    let K := retainedTraceTrack T hT
    let G := retainedPairTraceHomeomorph T hT j u
    let i := middleAttachingInclusion J
    let φ := adjunctionCell bandIn j ∘ bandOut ∘ u
    let ψ := adjunctionCell bandIn j ∘ bandOut ∘ retainedTubeShrink T hT 1 ∘ u
    (∀ p, G (adjunctionLower φ (adjunctionLower j p)) =
        adjunctionLower ψ (adjunctionLower j p) ∧
      G.symm (adjunctionLower ψ (adjunctionLower j p)) =
        adjunctionLower φ (adjunctionLower j p)) ∧
    (∀ p, G (adjunctionLower φ (adjunctionCell bandIn j p)) =
        adjunctionLower ψ (adjunctionCell bandIn j (K p)) ∧
      G.symm (adjunctionLower ψ (adjunctionCell bandIn j p)) =
        adjunctionLower φ (adjunctionCell bandIn j (K.symm p))) ∧
    (∀ a, G (adjunctionCell i φ a) = adjunctionCell i ψ a ∧
      G.symm (adjunctionCell i ψ a) = adjunctionCell i φ a) :=
  ⟨fun _ => ⟨rfl,rfl⟩, fun _ => ⟨rfl,rfl⟩, fun _ => ⟨rfl,rfl⟩⟩

end Adjunction

section RetainedPair

variable {P : Type*} [TopologicalSpace P]

/-- Label the retained (A) attachment by false and its chosen reverse
meridian by true. Both maps use the full closed handle parameters. -/
def originalRetainedPairTubes (v : C₁) (p : MiddleAttachingRegions Bool) : X :=
  match p.1 with
  | false => T (traceTubeParam p.2)
  | true => originalTraceMeridian T hT v (traceTubeParam p.2)

def shrunkRetainedPairTubes (v : C₁) (p : MiddleAttachingRegions Bool) : X :=
  match p.1 with
  | false => shrunkTraceTube T hT (traceTubeParam p.2)
  | true => retainedTubeMeridian v T (traceTubeParam p.2)

theorem retainedPairTubes_transport (v : C₁) :
    retainedTubeShrink T hT 1 ∘ originalRetainedPairTubes T hT v =
      shrunkRetainedPairTubes T hT v := by
  funext p
  obtain ⟨k, a⟩ := p
  cases k
  · rfl
  · exact originalTraceMeridian_transport T hT v (traceTubeParam a)

/-- The collar and handle comparison for the specified pair: the old
retained (A) and the exterior pullback of the auxiliary meridian. -/
def normalizedRetainedPairTraceHomeomorph (j : X → P) (v : C₁) :
    RetainedPairTrace j (originalRetainedPairTubes T hT v) ≃ₜ
      RetainedPairTrace j (shrunkRetainedPairTubes T hT v) :=
  retainedPairTubes_transport T hT v ▸
    retainedPairTraceHomeomorph T hT j (originalRetainedPairTubes T hT v)

end RetainedPair

end RelativeTrace

end SmoothPoincare.HMP
