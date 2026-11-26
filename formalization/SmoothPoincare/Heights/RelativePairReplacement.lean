import SmoothPoincare.Heights.NativePrefixCancellation
import SmoothPoincare.Heights.TransportedPrefixTrace
import SmoothPoincare.Heights.ClosedMarkedControl
import DifferentialGeometry.Topology.Diffeomorph.IsotopyTrack
import DifferentialGeometry.Topology.Handle.Gluing

/-! # Relative motion after the first attachment of a framed pair -/

open Set Manifold
open DifferentialGeometry.Topology DifferentialGeometry.Topology.Ehresmann
open scoped ContDiff Manifold

namespace SmoothPoincare.RelativePairReplacement

noncomputable section

abbrev CollarTime := Icc (0 : ℝ) 1

def inlet : CollarTime := ⟨0, by norm_num⟩
def outlet : CollarTime := ⟨1, by norm_num⟩

/-- The time change leaves an open buffer at both faces of the collar. -/
def pairMoveTime (t : CollarTime) : CollarTime :=
  ⟨Real.smoothTransition (3 * t.val - 1), Real.smoothTransition.nonneg _,
    Real.smoothTransition.le_one _⟩

theorem pairMoveTime_lower {t : CollarTime} (ht : t.val ≤ 1 / 3) : pairMoveTime t = inlet := by
  apply Subtype.ext
  exact Real.smoothTransition.zero_of_nonpos (by linarith)

theorem pairMoveTime_upper {t : CollarTime} (ht : 2 / 3 ≤ t.val) : pairMoveTime t = outlet := by
  apply Subtype.ext
  exact Real.smoothTransition.one_of_one_le (by linarith)

theorem contMDiff_pairMoveTime : ContMDiff (𝓡∂ 1) (𝓡∂ 1) ∞ pairMoveTime := by
  have hreal : ContDiff ℝ ∞ (fun t : ℝ => Real.smoothTransition (3 * t - 1)) :=
    Real.smoothTransition.contDiff.comp (by fun_prop)
  have h : ContMDiff (𝓡∂ 1) 𝓘(ℝ) ∞ (fun t : CollarTime => (pairMoveTime t).val) :=
    hreal.contMDiff.comp contMDiff_subtypeVal_Icc
  exact contMDiff_iff_comp_subtypeVal_Icc.mpr ⟨h.continuous.subtype_mk _, h⟩

section Track

variable {E H Z : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [TopologicalSpace H]
  [TopologicalSpace Z] [ChartedSpace H Z] {I : ModelWithCorners ℝ E H}

local notation "IZ" => ModelWithCorners.prod I (𝓡∂ 1)

/-- A supplied ambient isotopy on the actual anchor-first level determines a
single smooth track. It is the identity in the lower buffer and uses the
outlet diffeomorphism, constant in the normal coordinate, in the upper buffer. -/
def pairMoveTrack (J : CollarTime → Z ≃ₘ^∞⟮I, I⟯ Z)
    (hJ : ContMDiff IZ I ∞ (fun y : Z × CollarTime => J y.2 y.1))
    (hJi : ContMDiff IZ I ∞ (fun y : Z × CollarTime => (J y.2).symm y.1)) :
    (Z × CollarTime) ≃ₘ^∞⟮IZ, IZ⟯ (Z × CollarTime) :=
  isotopyTrackDiffeomorph (fun t z => J (pairMoveTime t) z)
    (fun t z => (J (pairMoveTime t)).symm z)
    (fun _ _ => Diffeomorph.symm_apply_apply ..) (fun _ _ => Diffeomorph.apply_symm_apply ..)
    (hJ.comp (contMDiff_fst.prodMk (contMDiff_pairMoveTime.comp contMDiff_snd)))
    (hJi.comp (contMDiff_fst.prodMk (contMDiff_pairMoveTime.comp contMDiff_snd)))

theorem pairMoveTrack_faces (J : CollarTime → Z ≃ₘ^∞⟮I, I⟯ Z)
    (hJ : ContMDiff IZ I ∞ (fun y : Z × CollarTime => J y.2 y.1))
    (hJi : ContMDiff IZ I ∞ (fun y : Z × CollarTime => (J y.2).symm y.1))
    (h0 : J inlet = Diffeomorph.refl I Z ∞) (z : Z) (t : CollarTime) :
    let T := pairMoveTrack J hJ hJi
    (t.val ≤ 1 / 3 → T (z,t) = (z,t) ∧ T.symm (z,t) = (z,t)) ∧
      (2 / 3 ≤ t.val → T (z,t) = (J outlet z,t) ∧ T.symm (z,t) = ((J outlet).symm z,t)) := by
  constructor
  · intro ht
    change (J (pairMoveTime t) z,t) = (z,t) ∧ ((J (pairMoveTime t)).symm z,t) = (z,t)
    rw [pairMoveTime_lower ht, h0]
    exact ⟨rfl,rfl⟩
  · intro ht
    change (J (pairMoveTime t) z,t) = (J outlet z,t) ∧
      ((J (pairMoveTime t)).symm z,t) = ((J outlet).symm z,t)
    rw [pairMoveTime_upper ht]
    exact ⟨rfl,rfl⟩

/-- The entire smooth collar fixes every protected point on which all slices
of the specified ambient motion are the identity. The inverse fixes it too. -/
theorem pairMoveTrack_fixed (J : CollarTime → Z ≃ₘ^∞⟮I, I⟯ Z)
    (hJ : ContMDiff IZ I ∞ (fun y : Z × CollarTime => J y.2 y.1))
    (hJi : ContMDiff IZ I ∞ (fun y : Z × CollarTime => (J y.2).symm y.1))
    {z : Z} (hfix : ∀ t, J t z = z) (t : CollarTime) :
    let T := pairMoveTrack J hJ hJi
    T (z,t) = (z,t) ∧ T.symm (z,t) = (z,t) := by
  let T := pairMoveTrack J hJ hJi
  have hf : T (z,t) = (z,t) := Prod.ext (hfix (pairMoveTime t)) rfl
  exact ⟨hf, (congrArg T.symm hf.symm).trans (T.symm_apply_apply (z,t))⟩

/-- The upper buffer matches the whole attachment parameters, and the inverse
recovers those very parameters. `u` can be an extension across the tube rim. -/
theorem pairMoveTrack_tube_germ {A : Type*} (J : CollarTime → Z ≃ₘ^∞⟮I, I⟯ Z)
    (hJ : ContMDiff IZ I ∞ (fun y : Z × CollarTime => J y.2 y.1))
    (hJi : ContMDiff IZ I ∞ (fun y : Z × CollarTime => (J y.2).symm y.1))
    (u v : A → Z) (hslide : ∀ p, J outlet (u p) = v p)
    {t : CollarTime} (ht : 2 / 3 ≤ t.val) (p : A) :
    let T := pairMoveTrack J hJ hJi
    T (u p,t) = (v p,t) ∧ T.symm (v p,t) = (u p,t) := by
  let T := pairMoveTrack J hJ hJi
  have hf : T (u p,t) = (v p,t) := by
    change (J (pairMoveTime t) (u p),t) = (v p,t)
    rw [pairMoveTime_upper ht, hslide]
  exact ⟨hf, (congrArg T.symm hf.symm).trans (T.symm_apply_apply (u p,t))⟩

end Track

section Adjunction

variable {P Z : Type*} [TopologicalSpace P] [TopologicalSpace Z]

def bandIn (z : Z) : Z × CollarTime := (z,inlet)
def bandOut (z : Z) : Z × CollarTime := (z,outlet)

abbrev CollaredPrefix (j : Z → P) := AdjunctionSpace bandIn j

def outletAttachment (j : Z → P) (u : Handle.AttachingRegion 2 2 → Z) :
    Handle.AttachingRegion 2 2 → CollaredPrefix j :=
  adjunctionCell bandIn j ∘ bandOut ∘ u

abbrev PairTrace (j : Z → P) (u : Handle.AttachingRegion 2 2 → Z) :=
  Handle.AdjunctionSpace 2 2 (outletAttachment j u)

/-- The actual anchor-first body is left fixed while the intervening product
collar changes. It may already be an index-two adjunction on the original body. -/
def pairMovePrefixHomeomorph (j : Z → P) (T : (Z × CollarTime) ≃ₜ (Z × CollarTime))
    (hin : ∀ z, T (bandIn z) = bandIn z) : CollaredPrefix j ≃ₜ CollaredPrefix j :=
  adjunctionHomeomorph _ _ _ _ (Equiv.refl Z) T (Homeomorph.refl P) hin (fun _ => rfl)

/-- Extend the motion over the second index-two handle by the identity in
its complete product coordinates. `hout` is the upper-buffer equation on
the actual attaching tube, including the disk coordinate. -/
def pairMoveTraceHomeomorph (j : Z → P) (T : (Z × CollarTime) ≃ₜ (Z × CollarTime))
    (hin : ∀ z, T (bandIn z) = bandIn z) (u v : Handle.AttachingRegion 2 2 → Z)
    (hout : ∀ p, T (bandOut (u p)) = bandOut (v p)) : PairTrace j u ≃ₜ PairTrace j v :=
  adjunctionHomeomorph _ _ _ _ (Equiv.refl _) (Homeomorph.refl _) (pairMovePrefixHomeomorph j T hin)
    (fun _ => rfl) (fun p => congrArg (adjunctionCell bandIn j) (hout p))

theorem pairMoveTrace_representatives (j : Z → P) (T : (Z × CollarTime) ≃ₜ (Z × CollarTime))
    (hin : ∀ z, T (bandIn z) = bandIn z) (u v : Handle.AttachingRegion 2 2 → Z)
    (hout : ∀ p, T (bandOut (u p)) = bandOut (v p)) :
    let F := pairMoveTraceHomeomorph j T hin u v hout
    let lower₀ := Handle.lower (outletAttachment j u)
    let lower₁ := Handle.lower (outletAttachment j v)
    (∀ x, F (lower₀ (adjunctionLower j x)) = lower₁ (adjunctionLower j x) ∧
      F.symm (lower₁ (adjunctionLower j x)) = lower₀ (adjunctionLower j x)) ∧
    (∀ y, F (lower₀ (adjunctionCell bandIn j y)) = lower₁ (adjunctionCell bandIn j (T y)) ∧
      F.symm (lower₁ (adjunctionCell bandIn j y)) = lower₀ (adjunctionCell bandIn j (T.symm y))) ∧
    ∀ z, F (Handle.cell (outletAttachment j u) z) = Handle.cell (outletAttachment j v) z ∧
      F.symm (Handle.cell (outletAttachment j v) z) = Handle.cell (outletAttachment j u) z :=
  ⟨fun _ => ⟨rfl,rfl⟩, fun _ => ⟨rfl,rfl⟩, fun _ => ⟨rfl,rfl⟩⟩

end Adjunction

section MoveOnCut

variable {E H P Z : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [TopologicalSpace H]
  [TopologicalSpace P] [TopologicalSpace Z] [ChartedSpace H Z] {I : ModelWithCorners ℝ E H}

local notation "IZ" => ModelWithCorners.prod I (𝓡∂ 1)

/-- Apply the smooth track at the actual level after the anchor attachment
and extend it across the actual framed handle adjunction. -/
def pairMoveAlongActualCut (j : Z → P) (J : CollarTime → Z ≃ₘ^∞⟮I, I⟯ Z)
    (hJ : ContMDiff IZ I ∞ (fun y : Z × CollarTime => J y.2 y.1))
    (hJi : ContMDiff IZ I ∞ (fun y : Z × CollarTime => (J y.2).symm y.1))
    (h0 : J inlet = Diffeomorph.refl I Z ∞)
    (u v : Handle.AttachingRegion 2 2 → Z) (hmove : ∀ p, J outlet (u p) = v p) :
    PairTrace j u ≃ₜ PairTrace j v :=
  pairMoveTraceHomeomorph j (pairMoveTrack J hJ hJi).toHomeomorph
    (fun z => ((pairMoveTrack_faces J hJ hJi h0 z inlet).1 (by change (0 : ℝ) ≤ 1 / 3; norm_num)).1)
    u v (fun p => (pairMoveTrack_tube_germ J hJ hJi u v hmove
      (t := outlet) (by change (2 / 3 : ℝ) ≤ 1; norm_num) p).1)

/-- Check the entire open signed overlap at the moving handle. The two chart
models are supplied on the respective traces. On the collar half their angular
maps use the transported extended tube, and on the handle half they use the
same product handle coordinates. These equations force both seam maps of the
actual adjunction comparison. -/
theorem pairMoveAlongActualCut_openSeam
    {ER HR EX HX R : Type*} [NormedAddCommGroup ER] [NormedSpace ℝ ER] [TopologicalSpace HR]
    [TopologicalSpace R] [ChartedSpace HR R] {IR : ModelWithCorners ℝ ER HR}
    [NormedAddCommGroup EX] [NormedSpace ℝ EX] [TopologicalSpace HX]
    {IX : ModelWithCorners ℝ EX HX}
    (j : Z → P) (J : CollarTime → Z ≃ₘ^∞⟮I, I⟯ Z)
    (hJ : ContMDiff IZ I ∞ (fun y : Z × CollarTime => J y.2 y.1))
    (hJi : ContMDiff IZ I ∞ (fun y : Z × CollarTime => (J y.2).symm y.1))
    (h0 : J inlet = Diffeomorph.refl I Z ∞)
    (u v : Handle.AttachingRegion 2 2 → Z) (hmove : ∀ p, J outlet (u p) = v p)
    [ChartedSpace HX (PairTrace j u)] [ChartedSpace HX (PairTrace j v)]
    (A : PartialDiffeomorph IR IX R (PairTrace j u) ∞)
    (B : PartialDiffeomorph IR IX R (PairTrace j v) ∞) (hsource : A.source = B.source)
    (normal : R → ℝ) (t : R → CollarTime) (uNear vNear : R → Z)
    (cell : R → Handle.StandardHandle 2 2)
    (hcollar : ∀ p ∈ A.source, normal p ≤ 0 → 2 / 3 ≤ (t p).val ∧
      J outlet (uNear p) = vNear p ∧
      A p = Handle.lower (outletAttachment j u) (adjunctionCell bandIn j (uNear p,t p)) ∧
      B p = Handle.lower (outletAttachment j v) (adjunctionCell bandIn j (vNear p,t p)))
    (hhandle : ∀ p ∈ A.source, 0 ≤ normal p →
      A p = Handle.cell (outletAttachment j u) (cell p) ∧
      B p = Handle.cell (outletAttachment j v) (cell p)) :
    let F := pairMoveAlongActualCut j J hJ hJi h0 u v hmove
    let D := A.symm.trans B
    D.source = A.target ∧ D.target = B.target ∧
      EqOn F D A.target ∧ EqOn F.symm D.symm B.target := by
  dsimp only
  let F := pairMoveAlongActualCut j J hJ hJi h0 u v hmove
  let T := pairMoveTrack J hJ hJi
  let D := A.symm.trans B
  have hC : ∀ p ∈ A.source, F (A p) = B p := by
    intro p hp
    rcases le_total (normal p) 0 with h | h
    · obtain ⟨ht,hmoveNear,hA,hB⟩ := hcollar p hp h
      rw [hA,hB]
      change Handle.lower (outletAttachment j v) (adjunctionCell bandIn j (T (uNear p,t p))) = _
      rw [(pairMoveTrack_tube_germ J hJ hJi (fun _ : Unit => uNear p) (fun _ => vNear p)
        (fun _ => hmoveNear) ht ()).1]
    · obtain ⟨hA,hB⟩ := hhandle p hp h
      rw [hA,hB]
      rfl
  have hs : D.source = A.target := by
    ext x
    change (x ∈ A.target ∧ A.symm x ∈ B.source) ↔ x ∈ A.target
    exact ⟨And.left, fun hx => ⟨hx, hsource ▸ A.map_target hx⟩⟩
  have ht : D.target = B.target := by
    ext x
    change (x ∈ B.target ∧ B.symm x ∈ A.source) ↔ x ∈ B.target
    exact ⟨And.left, fun hx => ⟨hx, hsource.symm ▸ B.map_target hx⟩⟩
  have hF : EqOn F D A.target := by
    intro x hx
    exact (congrArg F (A.right_inv hx).symm).trans (hC _ (A.map_target hx))
  refine ⟨hs,ht,hF,?_⟩
  intro y hy
  have hy' : y ∈ D.target := ht ▸ hy
  apply F.injective
  exact (F.apply_symm_apply y).trans ((hF (hs ▸ D.map_target hy')).trans (D.right_inv hy')).symm

end MoveOnCut

section ContinueOrClose

variable {X X' Y Y' Q U : Type*} [TopologicalSpace X] [TopologicalSpace X']
  [TopologicalSpace Y] [TopologicalSpace Y'] [TopologicalSpace Q] [TopologicalSpace U]

/-- For a nonterminal occurrence of the pair, attach all later handles in
their actual transported coordinates. The same labels index later handles. -/
def pairMoveContinuationHomeomorph {J : Type*}
    (F : X ≃ₜ X') (e : Y ≃ₜ Y') (j : Y → X) (j' : Y' → X')
    (hF : ∀ y, F (j y) = j' (e y)) (u : MiddleAttachingRegions J → Y) :
    AdjunctionSpace (middleAttachingInclusion J) (j ∘ u) ≃ₜ
      AdjunctionSpace (middleAttachingInclusion J) (j' ∘ e ∘ u) :=
  adjunctionHomeomorph _ _ _ _ (Equiv.refl _) (Homeomorph.refl _) F
    (fun _ => rfl) (fun p => hF (u p))

theorem pairMoveContinuation_representatives {J : Type*}
    (F : X ≃ₜ X') (e : Y ≃ₜ Y') (j : Y → X) (j' : Y' → X')
    (hF : ∀ y, F (j y) = j' (e y)) (u : MiddleAttachingRegions J → Y) :
    let G := pairMoveContinuationHomeomorph F e j j' hF u
    let i := middleAttachingInclusion J
    (∀ x, G (adjunctionLower (j ∘ u) x) = adjunctionLower (j' ∘ e ∘ u) (F x) ∧
      G.symm (adjunctionLower (j' ∘ e ∘ u) (F x)) = adjunctionLower (j ∘ u) x) ∧
    ∀ p, G (adjunctionCell i (j ∘ u) p) = adjunctionCell i (j' ∘ e ∘ u) p ∧
      G.symm (adjunctionCell i (j' ∘ e ∘ u) p) = adjunctionCell i (j ∘ u) p := by
  dsimp only
  constructor
  · intro x
    refine ⟨rfl, ?_⟩
    change adjunctionLower (j ∘ u) (F.symm (F x)) = _
    rw [F.symm_apply_apply]
  · exact fun _ => ⟨rfl,rfl⟩

/-- Close the actual returned trace using `γ ∘ e⁻¹`, keeping the old upper
body. This is for the full outgoing boundary, after extending over every
later attachment if the pair occurred in the interior. -/
def pairMoveClosedHomeomorph (F : X ≃ₜ X') (e : Y ≃ₜ Y') (γ : Y ≃ₜ U)
    (j : Y → X) (j' : Y' → X') (k : U → Q) (hF : ∀ y, F (j y) = j' (e y)) :
    AdjunctionSpace j (k ∘ γ) ≃ₜ AdjunctionSpace j' (k ∘ (e.symm.trans γ)) :=
  adjunctionHomeomorph _ _ _ _ e.toEquiv F (Homeomorph.refl Q) hF (fun y => by
    change k (γ y) = k (γ (e.symm (e y)))
    rw [e.symm_apply_apply])

theorem pairMoveClosed_representatives (F : X ≃ₜ X') (e : Y ≃ₜ Y') (γ : Y ≃ₜ U)
    (j : Y → X) (j' : Y' → X') (k : U → Q) (hF : ∀ y, F (j y) = j' (e y)) :
    let G := pairMoveClosedHomeomorph F e γ j j' k hF
    let γ' := e.symm.trans γ
    (∀ x, G (adjunctionCell j (k ∘ γ) x) = adjunctionCell j' (k ∘ γ') (F x)) ∧
    (∀ x', G.symm (adjunctionCell j' (k ∘ γ') x') = adjunctionCell j (k ∘ γ) (F.symm x')) ∧
    (∀ q, G (adjunctionLower (k ∘ γ) q) = adjunctionLower (k ∘ γ') q) ∧
    (∀ q, G.symm (adjunctionLower (k ∘ γ') q) = adjunctionLower (k ∘ γ) q) ∧
    (∀ y, γ' y = γ (e.symm y)) ∧ ∀ w, γ'.symm w = e (γ.symm w) :=
  ⟨fun _ => rfl, fun _ => rfl, fun _ => rfl, fun _ => rfl, fun _ => rfl, fun _ => rfl⟩

/-- The returned outgoing face has the same dual attaching tube on the
retained upper body when read in the transported closing. This also compares
the inverse on the entire tube image, including each framing parameter. -/
theorem pairMoveClosed_dualTube {S D : Type*} (e : Y ≃ₜ Y') (γ : Y ≃ₜ U)
    (o : D × S → Y) (oInv : Y → D × S) (ho : Function.LeftInverse oInv o) :
    let γ' := e.symm.trans γ
    let a := fun p : S × D => γ (o p.swap)
    let a' := fun p : S × D => γ' (e (o p.swap))
    let aInv := fun y : U => (oInv (γ.symm y)).swap
    let aInv' := fun y : U => (oInv (e.symm (γ'.symm y))).swap
    a' = a ∧ aInv' = aInv ∧ Function.LeftInverse aInv a ∧
      Function.LeftInverse aInv' a' ∧ RightInvOn aInv' a' (range a') :=
  ClosedMarkedControl.slid_dualTube_and_inverse γ.toEquiv e.symm.toEquiv o
    (e ∘ o) oInv ho (fun v => e.symm_apply_apply (o v))

end ContinueOrClose

section TerminalCancellation

open DifferentialGeometry.Topology.Morse

variable {H M : Type*} [TopologicalSpace H] [TopologicalSpace M] [ChartedSpace H M]
  {I : ModelWithCorners ℝ (Fin 4 → ℝ) H} [I.Boundaryless] [IsManifold I ∞ M]
  [T2Space M] [CompactSpace M] [DecidableEq M]

local notation "C[" f "," j "]" => nativeMorseIndexSet I f j

omit [I.Boundaryless] [IsManifold I ∞ M] [T2Space M] [CompactSpace M] [DecidableEq M] in
private theorem count_after_one_deletion {f g : M → ℝ} {p q : M}
    (hsets : ∀ j, C[g,j] = C[f,j] \ {p,q}) (hp : p ∈ C[f,2]) (hq : q ∈ C[f,3])
    (hfinite : {x | IsCriticalPointAt I f x}.Finite) :
    C[g,2].ncard + 1 = C[f,2].ncard ∧ C[g,3].ncard + 1 = C[f,3].ncard := by
  have hsingle (j : ℕ) (x y : M) (he : ({p,q} : Set M) = {x,y})
      (hx : x ∈ C[f,j]) (hy : y ∉ C[f,j]) : C[g,j].ncard + 1 = C[f,j].ncard := by
    rw [hsets, he, ← Set.singleton_union, ← Set.sdiff_sdiff]
    rw [Set.sdiff_singleton_eq_self (fun h => hy h.1)]
    exact Set.ncard_sdiff_singleton_add_one hx (hfinite.subset fun _ hz => hz.1)
  refine ⟨hsingle 2 p q rfl hp ?_, hsingle 3 q p (Set.pair_comm p q) hq ?_⟩
  · exact fun h => (by decide : (2 : ℕ) ≠ 3) (h.2.symm.trans hq.2)
  · exact fun h => (by decide : (3 : ℕ) ≠ 2) (h.2.symm.trans hp.2)

/-- At a terminal split pair, two actual adjacent-index cancellations on
the same smooth source give the exact net decrease of both index counts.
The second witness is required on the height **after** the first cancellation.
The theorem performs both modifications and retains every other indexed point. -/
theorem exists_terminalPairReduction {f : M → ℝ} {a b l₀ r₀ l₁ r₁ : ℝ}
    {p₀ q₀ p₁ q₁ : M} (hf : MorseStrip I f a b) (ha : a ≤ l₀) (hb : r₁ ≤ b)
    (hsep : r₀ < l₁)
    (hreg₀ : ∀ x, f x = l₀ ∨ f x = r₀ → ¬ IsCriticalPointAt I f x)
    (hreg₁ : ∀ x, f x = l₁ ∨ f x = r₁ → ¬ IsCriticalPointAt I f x)
    (hpair₀ : isCancellingPair I f l₀ r₀ p₀ q₀) (hp₀ : morseIndex I f p₀ = 2)
    (hnext : ∀ g, ModifiedWithin f l₀ r₀ g → MorseStrip I g a b →
      isCancellingPair I g l₁ r₁ p₁ q₁ ∧ morseIndex I g p₁ = 2)
    (hfinite : {x | IsCriticalPointAt I f x}.Finite) (hr₁ : l₁ < r₁) :
    ∃ h : M → ℝ, ModifiedWithin f l₀ r₁ h ∧ MorseStrip I h a b ∧
      (∀ j, C[h,j] = (C[f,j] \ {p₀,q₀}) \ {p₁,q₁}) ∧
      C[h,2].ncard + 2 = C[f,2].ncard ∧ C[h,3].ncard + 2 = C[f,3].ncard ∧
      (∀ t, r₀ ≤ t → t ≤ l₁ → h ⁻¹' {t} = f ⁻¹' {t} ∧ h ⁻¹' Iic t = f ⁻¹' Iic t) := by
  have hleft : l₀ ≤ l₁ := (hpair₀.1.lt.trans hsep).le
  obtain ⟨g, hmod₀, hg, hset₀, _⟩ := exists_nativePrefixCancellation hf ha
    ((hsep.trans hr₁).le.trans hb) hreg₀ hpair₀
  obtain ⟨hpair₁, hp₁⟩ := hnext g hmod₀ hg
  have hreg₁g : ∀ x, g x = l₁ ∨ g x = r₁ → ¬ IsCriticalPointAt I g x := by
    intro x hx hcrit
    have hcritf : IsCriticalPointAt I f x :=
      ((hset₀ (morseIndex I g x) ▸ (show x ∈ C[g,morseIndex I g x] from ⟨hcrit,rfl⟩)).1).1
    apply hreg₁ x _ hcritf
    rcases hx with hx | hx
    · have hx' : x ∈ g ⁻¹' {l₁} := hx
      rw [(nativePrefixCancellation_sameUpperCut hmod₀ hsep.le).1] at hx'
      exact Or.inl hx'
    · have hx' : x ∈ g ⁻¹' {r₁} := hx
      rw [(nativePrefixCancellation_sameUpperCut hmod₀ (hsep.trans hr₁).le).1] at hx'
      exact Or.inr hx'
  obtain ⟨h, hmod₁, hh, hset₁, _⟩ :=
    exists_nativePrefixCancellation hg (ha.trans hleft) hb hreg₁g hpair₁
  have hfiniteg : {x | IsCriticalPointAt I g x}.Finite := hfinite.subset fun x hx => by
    have hx' : x ∈ C[g,morseIndex I g x] := ⟨hx,rfl⟩
    rw [hset₀] at hx'
    exact hx'.1.1
  have hq₀ : morseIndex I f q₀ = 3 := by rw [hpair₀.2.2.2.1, hp₀]
  have hq₁ : morseIndex I g q₁ = 3 := by rw [hpair₁.2.2.2.1, hp₁]
  obtain ⟨h₂₀, h₃₀⟩ := count_after_one_deletion hset₀
      ⟨((hpair₀.2.1 p₀).mp (mem_pair_left p₀ q₀)).2, hp₀⟩
      ⟨((hpair₀.2.1 q₀).mp (mem_pair_right p₀ q₀)).2, hq₀⟩ hfinite
  obtain ⟨h₂₁, h₃₁⟩ := count_after_one_deletion hset₁
      ⟨((hpair₁.2.1 p₁).mp (mem_pair_left p₁ q₁)).2, hp₁⟩
      ⟨((hpair₁.2.1 q₁).mp (mem_pair_right p₁ q₁)).2, hq₁⟩ hfiniteg
  refine ⟨h, (hmod₀.mono le_rfl (hsep.trans hr₁).le).trans (hmod₁.mono hleft le_rfl), hh,
    fun j => by rw [hset₁, hset₀], by omega, by omega, ?_⟩
  intro t ht htl
  have he := nativePrefixCancellation_sameUpperCut hmod₀ ht
  constructor
  · rw [← he.1]
    ext x
    by_cases hx : g x ∈ Ioo l₁ r₁
    · have hhx := htl.trans_lt (hmod₁.mapsTo hx).1
      have hgx := htl.trans_lt hx.1
      simp [ne_of_gt hhx, ne_of_gt hgx]
    · simp [hmod₁.eqOn hx]
  · rw [← he.2]
    ext x
    by_cases hx : g x ∈ Ioo l₁ r₁
    · have hhx := htl.trans_lt (hmod₁.mapsTo hx).1
      have hgx := htl.trans_lt hx.1
      simp [not_le_of_gt hhx, not_le_of_gt hgx]
    · simp [hmod₁.eqOn hx]

end TerminalCancellation

end

end SmoothPoincare.RelativePairReplacement
