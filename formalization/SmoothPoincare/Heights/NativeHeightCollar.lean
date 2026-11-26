import SmoothPoincare.Heights.MarkedRegularTransport
import DifferentialGeometry.Topology.Morse.Strip.RegularBand

/-! # The smooth signed collar of the actual selected regular level -/

open DifferentialGeometry.Topology DifferentialGeometry.Topology.Morse Set
open scoped Manifold ContDiff Topology

namespace SmoothPoincare

variable {m : ℕ} {H M : Type*} [TopologicalSpace H] [TopologicalSpace M] [ChartedSpace H M]
  {I : ModelWithCorners ℝ (MorseModel (m+1)) H} [I.Boundaryless] [IsManifold I ∞ M]
  [T2Space M] [CompactSpace M]

/-- The signed parameter is the height difference itself. The inverse is
the smooth flow projection back to the original level and this signed
coordinate. Both equalities refer to the same entire open height band. -/
theorem exists_nativeSignedHeightCollar {f : M → ℝ} {c : ℝ}
    (hf : ContMDiff I 𝓘(ℝ, ℝ) ∞ f) (hc : ∀ x, f x = c → ¬ IsCriticalPointAt I f x)
    (x₀ : LevelSetSpace f c) :
    letI := manifoldLevelSetChartedSpace I f c hf hc
    ∃ r > (0 : ℝ), ∃ Φ : PartialDiffeomorph ((𝓘(ℝ, MorseModel m)).prod 𝓘(ℝ, ℝ)) I
        (LevelSetSpace f c × ℝ) M ∞,
      Φ.source = {p | p.2 ∈ Ioo (-r) r} ∧ Φ.target = f ⁻¹' Ioo (c-r) (c+r) ∧
      (∀ x : LevelSetSpace f c, Φ (x,0) = x.val) ∧
      (∀ p ∈ Φ.source, f (Φ p) = c + p.2) ∧
      (∀ y ∈ Φ.target, (Φ.symm y).2 = f y - c) := by
  classical
  let := manifoldLevelSetChartedSpace I f c hf hc
  let := manifoldLevelSetIsManifold I f c hf hc
  have hclosed : IsClosed {x | IsCriticalPointAt I f x} := by
    simpa only [Set.compl_ofPred, not_not] using (MorseExistence.isOpen_regular hf).isClosed_compl
  have hcompact := hclosed.isCompact.image hf.continuous
  have havoid : c ∉ f '' {x | IsCriticalPointAt I f x} := by
    rintro ⟨x,hx,hxc⟩
    exact hc x hxc hx
  obtain ⟨ε,hε,hball⟩ := Metric.mem_nhds_iff.mp (hcompact.isClosed.isOpen_compl.mem_nhds havoid)
  let r := ε/2
  have hr : 0 < r := half_pos hε
  have hab : c-r < c+r := by linarith
  have hband (x : M) (hx : f x ∈ Icc (c-r) (c+r)) : ¬ IsCriticalPointAt I f x := by
    intro hcrit
    apply hball (a := f x) _ ⟨x,hcrit,rfl⟩
    rw [Metric.mem_ball,Real.dist_eq,abs_lt]
    dsimp [r] at hx
    constructor <;> linarith [hx.1,hx.2]
  let S : MorseStrip I f (c-r) (c+r) :=
    { smooth := hf
      lt := hab
      compact := (isClosed_Icc.preimage hf.continuous).isCompact
      regular := by
        rintro x (hx|hx) <;> apply hband <;> rw [hx]
        · exact ⟨le_rfl,hab.le⟩
        · exact ⟨hab.le,le_rfl⟩
      nondegenerate := fun x hx hcrit => (hband x ⟨hx.1.le,hx.2.le⟩ hcrit).elim }
  obtain ⟨D,-,-,-⟩ := exists_gradientLikeStrip S le_rfl hab le_rfl S.regular
    (∅ : Finset M) (by
      intro x
      simp only [Finset.notMem_empty,false_iff,not_and]
      exact fun hx => hband x ⟨hx.1.le,hx.2.le⟩) (R₀ := 1) zero_lt_one
  have flow_level (x : M) (hx : f x ∈ Icc (c-r) (c+r)) (t : ℝ)
      (ht : t ∈ Icc (c-r) (c+r)) : f (D.flow (f x - t) x) = t := by
    have h := D.f_flow_eq_sub_of_levels hf (T := f x-t) hx
      (by simpa only [sub_sub_cancel] using ht)
      (by intro y hy p hp; exact (Finset.notMem_empty p hp).elim)
      (f x-t) right_mem_uIcc
    simpa only [sub_sub_cancel] using h
  have hcenter : c ∈ Icc (c-r) (c+r) := ⟨by linarith,by linarith⟩
  let U : TopologicalSpace.Opens M := ⟨f ⁻¹' Ioo (c-r) (c+r),isOpen_Ioo.preimage hf.continuous⟩
  let F := fun p : LevelSetSpace f c × ℝ => D.flow (-p.2) p.1.val
  have hF : ContMDiff ((𝓘(ℝ, MorseModel m)).prod 𝓘(ℝ, ℝ)) I ∞ F :=
    D.contMDiff_flow_joint.comp (contMDiff_snd.neg.prodMk
      ((contMDiff_levelSetInclusion I f c hf hc).comp contMDiff_fst))
  have hval (x : LevelSetSpace f c) (t : ℝ) (ht : t ∈ Ioo (-r) r) : f (F (x,t)) = c+t := by
    have hx : f x.val = c := x.property
    have he := flow_level x.val (by rwa [hx]) (c+t) ⟨by linarith [ht.1],by linarith [ht.2]⟩
    simpa only [hx,show c-(c+t) = -t by ring,F] using he
  have hback (y : M) (hy : y ∈ U) : f (D.π c y) = c :=
    flow_level y ⟨hy.1.le,hy.2.le⟩ c hcenter
  let L := fun y : M => if hy : y ∈ U then (⟨D.π c y,hback y hy⟩ : LevelSetSpace f c) else x₀
  let G := fun y : M => (L y,f y-c)
  have hp : ContMDiff I (𝓘(ℝ, MorseModel m)) ∞ (fun y : U => L y.val) := by
    have hh := contMDiff_levelSet_factor I f c hf hc
      (fun y : U => D.π c y.val) ((D.contMDiff_π hf c).comp contMDiff_subtype_val)
      (fun y => hback y.val y.property)
    simpa only [L,dite_eq_left (Subtype.property _)] using hh
  have hl : ContMDiffOn I (𝓘(ℝ, MorseModel m)) ∞ L U := by
    intro y hy
    exact (contMDiffAt_subtype_iff.mp (hp (⟨y,hy⟩ : U))).contMDiffWithinAt
  let Φ : PartialDiffeomorph ((𝓘(ℝ, MorseModel m)).prod 𝓘(ℝ, ℝ)) I (LevelSetSpace f c × ℝ) M ∞ :=
    { toFun := F, invFun := G, source := {p | p.2 ∈ Ioo (-r) r}, target := U
      map_source' := by
        intro p hp
        change f (F p) ∈ Ioo (c-r) (c+r)
        rw [hval p.1 p.2 hp]; constructor <;> linarith [hp.1,hp.2]
      map_target' := by
        intro y hy
        change f y-c ∈ Ioo (-r) r
        constructor <;> linarith [hy.1,hy.2]
      left_inv' := by
        intro p hp
        have he := hval p.1 p.2 hp
        have hy : F p ∈ U := by
          change f (F p) ∈ Ioo (c-r) (c+r)
          rw [he]; constructor <;> linarith [hp.1,hp.2]
        apply Prod.ext
        · apply Subtype.ext
          simp only [G,L,dite_eq_left hy,GradientLikeStrip.π,he,F,D.flow_flow]
          rw [show -p.2 + (c+p.2-c) = 0 by ring,D.flow_zero]
        · change f (F p)-c = p.2
          linarith
      right_inv' := by
        intro y hy
        change y ∈ U at hy
        simp only [F,G,L,dite_eq_left hy,GradientLikeStrip.π,D.flow_flow,add_neg_cancel,D.flow_zero]
      open_source := isOpen_Ioo.preimage continuous_snd
      open_target := U.isOpen
      contMDiffOn_toFun := hF.contMDiffOn
      contMDiffOn_invFun := hl.prodMk (hf.sub contMDiff_const).contMDiffOn }
  refine ⟨r,hr,Φ,rfl,rfl,?_,fun p hp => hval p.1 p.2 hp,fun _ _ => rfl⟩
  intro x
  change D.flow (-(0 : ℝ)) x.val = x.val
  rw [neg_zero,D.flow_zero]

/-- Both height orientations use the very same open collar in the ambient
source. Reversing the height reverses the signed normal and preserves the
marked native level point. The inverse comparison retains both coordinates. -/
theorem exists_nativeOppositeSignedCollars {f : M → ℝ} {c : ℝ}
    (hf : ContMDiff I 𝓘(ℝ, ℝ) ∞ f) (hc : ∀ x, f x = c → ¬ IsCriticalPointAt I f x)
    (x₀ : LevelSetSpace f c)
    (hc' : ∀ x, -f x = -c → ¬ IsCriticalPointAt I (fun y => -f y) x :=
      fun x hx h => hc x (neg_injective hx) ((NegDual.isCriticalPointAt_neg_iff I f x).1 h)) :
    letI := manifoldLevelSetChartedSpace I f c hf hc
    letI := manifoldLevelSetChartedSpace I (fun y => -f y) (-c) hf.neg hc'
    let K := 𝓘(ℝ, MorseModel m)
    let L := LevelSetSpace f c
    let L' := LevelSetSpace (fun y => -f y) (-c)
    ∃ r > (0 : ℝ), ∃ (d : L ≃ₘ^∞⟮K,K⟯ L')
      (F : PartialDiffeomorph (K.prod 𝓘(ℝ, ℝ)) I (L × ℝ) M ∞)
      (G : PartialDiffeomorph (K.prod 𝓘(ℝ, ℝ)) I (L' × ℝ) M ∞),
      (∀ x, (d x).val = x.val) ∧ (∀ y, (d.symm y).val = y.val) ∧
      F.source = {p | p.2 ∈ Ioo (-r) r} ∧ G.source = {p | p.2 ∈ Ioo (-r) r} ∧
      F.target = f ⁻¹' Ioo (c-r) (c+r) ∧ G.target = F.target ∧
      (∀ x, F (x,0) = x.val) ∧ (∀ y, G (y,0) = y.val) ∧
      (∀ p ∈ F.source, f (F p) = c + p.2) ∧
      (∀ q ∈ G.source, -f (G q) = -c + q.2) ∧
      (∀ x t, G (d x,-t) = F (x,t)) ∧
      (∀ z ∈ F.target, G.symm z = (d (F.symm z).1, -(F.symm z).2)) := by
  let := manifoldLevelSetChartedSpace I f c hf hc
  let := manifoldLevelSetChartedSpace I (fun y => -f y) (-c) hf.neg hc'
  obtain ⟨r,hr,F,hFS,hFT,hF0,hFh,-⟩ := exists_nativeSignedHeightCollar hf hc x₀
  obtain ⟨d,hd,hi⟩ := nativeOppositeLevelDiffeomorph hf hc hc'
  let N : ℝ ≃ₘ^∞⟮𝓘(ℝ, ℝ),𝓘(ℝ, ℝ)⟯ ℝ :=
    { toEquiv := Equiv.neg ℝ, contMDiff_toFun := contMDiff_id.neg, contMDiff_invFun := contMDiff_id.neg }
  let P := d.symm.prodCongr N
  let G := P.toPartialDiffeomorph.trans F
  have hsrc : G.source = {p | p.2 ∈ Ioo (-r) r} := by
    ext p
    change (p ∈ Set.univ ∧ (d.symm p.1,-p.2) ∈ F.source) ↔ _
    rw [hFS]
    change (True ∧ -r < -p.2 ∧ -p.2 < r) ↔ -r < p.2 ∧ p.2 < r
    constructor
    · rintro ⟨-,hl,hu⟩; constructor <;> linarith
    · rintro ⟨hl,hu⟩; exact ⟨trivial,by linarith,by linarith⟩
  have htarget : G.target = F.target := by
    ext y
    change (y ∈ F.target ∧ _ ∈ Set.univ) ↔ _
    simp
  refine ⟨r,hr,d,F,G,hd,hi,hFS,hsrc,hFT,htarget,hF0,?_,hFh,?_,?_,fun _ _ => rfl⟩
  · intro y
    change F (d.symm y,-(0 : ℝ)) = y.val
    rw [neg_zero,hF0,hi]
  · intro p hp
    have hmem : (d.symm p.1,-p.2) ∈ F.source := hp.2
    change -f (F (d.symm p.1,-p.2)) = -c+p.2
    rw [hFh _ hmem]
    ring
  · intro x t
    change F (d.symm (d x),- -t) = F (x,t)
    rw [d.symm_apply_apply,neg_neg]

end SmoothPoincare
