import SmoothPoincare.Heights.OutgoingEdgeTransport
import SmoothPoincare.Heights.NativeEdgeIncidence
import DifferentialGeometry.Topology.Morse.SublevelInclusion
import DifferentialGeometry.Topology.Manifold.ContMDiff.OpenSubtype

/-! # Smooth assembly on the open patches of a marked Morse edge -/

open DifferentialGeometry.Topology DifferentialGeometry.Topology.Morse Set
open DifferentialGeometry.Topology.Morse.CellAttachment
open DifferentialGeometry.Topology.Morse.ManifoldCellAttachment
open scoped ContDiff Manifold Topology

namespace SmoothPoincare

noncomputable section

section Patches

variable {E F : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [NormedAddCommGroup F] [NormedSpace ℝ F]
  {H K : Type*} [TopologicalSpace H] [TopologicalSpace K]
  {I : ModelWithCorners ℝ E H} {J : ModelWithCorners ℝ F K}
  {M N : Type*} [TopologicalSpace M] [ChartedSpace H M]
  [TopologicalSpace N] [ChartedSpace K N]

/-- A common chart on the *entire* source and target overlap forces the
inverse agreement, once its forward equations with both patch maps hold. -/
theorem markedEdgeInverseOverlap
    (P Q R : PartialDiffeomorph I J M N ∞)
    (hS : R.source = P.source ∩ Q.source) (hT : R.target = P.target ∩ Q.target)
    (hP : EqOn P R R.source) (hQ : EqOn Q R R.source) :
    EqOn P.symm Q.symm (P.target ∩ Q.target) := by
  intro y hy
  have hyR : y ∈ R.target := hT ▸ hy
  have hx : R.symm y ∈ R.source := R.map_target hyR
  have hsplit : R.symm y ∈ P.source ∩ Q.source := hS ▸ hx
  have hP' : P (R.symm y) = y := (hP hx).trans (R.right_inv hyR)
  have hQ' : Q (R.symm y) = y := (hQ hx).trans (R.right_inv hyR)
  calc
    P.symm y = P.symm (P (R.symm y)) := congrArg P.symm hP'.symm
    _ = R.symm y := P.left_inv hsplit.1
    _ = Q.symm (Q (R.symm y)) := (Q.left_inv hsplit.2).symm
    _ = Q.symm y := congrArg Q.symm hQ'

private def markedEdgePatchValue {X Y : Type*} (S : Fin 4 → Set X) (a : Fin 4 → X → Y)
    (x : X) : Y := by
  classical
  exact if h : ∃ i, x ∈ S i then a h.choose x else a 0 x

private theorem markedEdgePatchValue_eq {X Y : Type*} (S : Fin 4 → Set X) (a : Fin 4 → X → Y)
    (h : ∀ i j, EqOn (a i) (a j) (S i ∩ S j)) (i : Fin 4) :
    EqOn (markedEdgePatchValue S a) (a i) (S i) := by
  classical
  intro x hx
  have hx' : ∃ j, x ∈ S j := ⟨i, hx⟩
  rw [markedEdgePatchValue, dite_eq_left hx']
  exact h hx'.choose i ⟨hx'.choose_spec, hx⟩

variable (P : Fin 4 → PartialDiffeomorph I J M N ∞)
  (hS : ∀ i j, EqOn (P i) (P j) ((P i).source ∩ (P j).source))
  (hT : ∀ i j, EqOn (P i).symm (P j).symm ((P i).target ∩ (P j).target))

/-- Glue the two incoming patches, the rounded block and the outgoing
collar, provided their open overlaps agree in both directions. The source
and target are their respective unions. -/
def markedEdgePatchUnion : PartialDiffeomorph I J M N ∞ := by
  let a := markedEdgePatchValue (fun i => (P i).source) (fun i => P i)
  let b := markedEdgePatchValue (fun i => (P i).target) (fun i => (P i).symm)
  have ha (i : Fin 4) : EqOn a (P i) (P i).source := markedEdgePatchValue_eq _ _ hS i
  have hb (i : Fin 4) : EqOn b (P i).symm (P i).target := markedEdgePatchValue_eq _ _ hT i
  refine
    { toFun := a
      invFun := b
      source := ⋃ i, (P i).source
      target := ⋃ i, (P i).target
      map_source' := ?_
      map_target' := ?_
      left_inv' := ?_
      right_inv' := ?_
      open_source := isOpen_iUnion (fun i => (P i).open_source)
      open_target := isOpen_iUnion (fun i => (P i).open_target)
      contMDiffOn_toFun := ?_
      contMDiffOn_invFun := ?_ }
  · intro x hx
    obtain ⟨i, hi⟩ := mem_iUnion.mp hx
    exact mem_iUnion.mpr ⟨i, ha i hi ▸ (P i).map_source hi⟩
  · intro y hy
    obtain ⟨i, hi⟩ := mem_iUnion.mp hy
    exact mem_iUnion.mpr ⟨i, hb i hi ▸ (P i).map_target hi⟩
  · intro x hx
    obtain ⟨i, hi⟩ := mem_iUnion.mp hx
    calc
      b (a x) = b (P i x) := congrArg b (ha i hi)
      _ = (P i).symm (P i x) := hb i ((P i).map_source hi)
      _ = x := (P i).left_inv hi
  · intro y hy
    obtain ⟨i, hi⟩ := mem_iUnion.mp hy
    calc
      a (b y) = a ((P i).symm y) := congrArg a (hb i hi)
      _ = P i ((P i).symm y) := ha i ((P i).map_target hi)
      _ = y := (P i).right_inv hi
  · intro x hx
    obtain ⟨i, hi⟩ := mem_iUnion.mp hx
    exact (((P i).contMDiffOn.congr (ha i)).contMDiffAt
      ((P i).open_source.mem_nhds hi)).contMDiffWithinAt
  · intro y hy
    obtain ⟨i, hi⟩ := mem_iUnion.mp hy
    exact (((P i).symm.contMDiffOn.congr (hb i)).contMDiffAt
      ((P i).open_target.mem_nhds hi)).contMDiffWithinAt

theorem markedEdgePatchUnion_domains :
    (markedEdgePatchUnion P hS hT).source = ⋃ i, (P i).source ∧
      (markedEdgePatchUnion P hS hT).target = ⋃ i, (P i).target := ⟨rfl, rfl⟩

/-- Both directions of the assembled chart agree pointwise with the selected
patch over its entire open domain. -/
theorem markedEdgePatchUnion_eqOn (i : Fin 4) :
    EqOn (markedEdgePatchUnion P hS hT) (P i) (P i).source ∧
      EqOn (markedEdgePatchUnion P hS hT).symm (P i).symm (P i).target :=
  ⟨markedEdgePatchValue_eq _ _ hS i, markedEdgePatchValue_eq _ _ hT i⟩

/-- Full covers give a smooth global comparison, with the same two-sided
restriction equations. Here both smooth structures are the supplied ones. -/
def markedEdgePatchDiffeomorph
    (hs : (⋃ i, (P i).source) = univ) (ht : (⋃ i, (P i).target) = univ) :
    M ≃ₘ^∞⟮I,J⟯ N := by
  let d := markedEdgePatchUnion P hS hT
  have hdS : d.source = univ := (markedEdgePatchUnion_domains P hS hT).1.trans hs
  have hdT : d.target = univ := (markedEdgePatchUnion_domains P hS hT).2.trans ht
  have hSmooth : ContMDiff I J ∞ d := by
    apply contMDiffOn_univ.mp
    rw [← hdS]
    exact d.contMDiffOn
  have hInverse : ContMDiff J I ∞ d.symm := by
    apply contMDiffOn_univ.mp
    rw [← hdT]
    exact d.symm.contMDiffOn
  exact
    { toFun := d
      invFun := d.symm
      left_inv := fun x => d.left_inv (hdS.symm ▸ mem_univ x)
      right_inv := fun y => d.right_inv (hdT.symm ▸ mem_univ y)
      contMDiff_toFun := hSmooth
      contMDiff_invFun := hInverse }

theorem markedEdgePatchDiffeomorph_eqOn
    (hs : (⋃ i, (P i).source) = univ) (ht : (⋃ i, (P i).target) = univ) (i : Fin 4) :
    EqOn (markedEdgePatchDiffeomorph P hS hT hs ht) (P i) (P i).source ∧
      EqOn (markedEdgePatchDiffeomorph P hS hT hs ht).symm (P i).symm (P i).target :=
  markedEdgePatchUnion_eqOn P hS hT i

/-- Shrink the two incoming chart neighborhoods while retaining both
entire compact bodies. Their ambient targets can then be made disjoint,
with exactly the original coordinate maps in both directions. -/
theorem exists_disjointIncomingEdgePatches [T2Space N]
    (P Q : PartialDiffeomorph I J M N ∞) {C D : Set M}
    (hC : IsCompact C) (hD : IsCompact D) (hCS : C ⊆ P.source) (hDS : D ⊆ Q.source)
    (hCD : Disjoint (P '' C) (Q '' D)) :
    ∃ P' Q' : PartialDiffeomorph I J M N ∞,
      C ⊆ P'.source ∧ D ⊆ Q'.source ∧ Disjoint P'.target Q'.target ∧
        (∀ x, P' x = P x ∧ Q' x = Q x) ∧
        (∀ y, P'.symm y = P.symm y ∧ Q'.symm y = Q.symm y) := by
  have hPC := hC.image_of_continuousOn (P.contMDiffOn.continuousOn.mono hCS)
  have hQD := hD.image_of_continuousOn (Q.contMDiffOn.continuousOn.mono hDS)
  obtain ⟨U, V, hU, hV, hPU, hQV, hUV⟩ :=
    SeparatedNhds.of_isCompact_isCompact hPC hQD hCD
  let P' := (DifferentialGeometry.Topology.PartialDiffeomorph.restrict P.symm U hU).symm
  let Q' := (DifferentialGeometry.Topology.PartialDiffeomorph.restrict Q.symm V hV).symm
  refine ⟨P', Q', ?_, ?_, ?_, fun _ => ⟨rfl, rfl⟩, fun _ => ⟨rfl,rfl⟩⟩
  · intro x hx
    exact ⟨hCS hx, hPU ⟨x, hx, rfl⟩⟩
  · intro x hx
    exact ⟨hDS hx, hQV ⟨x, hx, rfl⟩⟩
  · exact hUV.mono inter_subset_right inter_subset_right

section Collar

variable {E₀ E₁ : Type*} [NormedAddCommGroup E₀] [NormedSpace ℝ E₀]
  [NormedAddCommGroup E₁] [NormedSpace ℝ E₁]
  {H₀ H₁ : Type*} [TopologicalSpace H₀] [TopologicalSpace H₁]
  {L₀ L₁ : Type*} [TopologicalSpace L₀] [TopologicalSpace L₁]
  [ChartedSpace H₀ L₀] [ChartedSpace H₁ L₁]
  {I₀ : ModelWithCorners ℝ E₀ H₀} {I₁ : ModelWithCorners ℝ E₁ H₁}
  (A : PartialDiffeomorph (I₀.prod 𝓘(ℝ,ℝ)) I (L₀ × ℝ) M ∞)
  (B : PartialDiffeomorph (I₁.prod 𝓘(ℝ,ℝ)) J (L₁ × ℝ) N ∞)
  (d : L₀ ≃ₘ^∞⟮I₀,I₁⟯ L₁)

/-- Build the overlap map from the actual collar, the chosen model collar
and their marked level comparison. The transverse sign is retained. -/
def markedEdgeSignedCollar : PartialDiffeomorph I J M N ∞ :=
  let p := d.prodCongr (Diffeomorph.refl 𝓘(ℝ,ℝ) ℝ ∞)
  (A.symm.trans p.toPartialDiffeomorph).trans B

/-- On the entire common signed strip, the collar transition covers both
ambient patches and transports each marked level parameter with its signed
distance. Both inverse equations use the same supplied collars. -/
theorem markedEdgeSignedCollar_eqOn
    {U : Set L₀} {V : Set L₁} {r : ℝ}
    (hA : A.source = U ×ˢ Ioo (-r) r) (hB : B.source = V ×ˢ Ioo (-r) r)
    (hd : ∀ x, d x ∈ V ↔ x ∈ U) :
    let T := markedEdgeSignedCollar A B d
    T.source = A.target ∧ T.target = B.target ∧
      (∀ q ∈ A.source, T (A q) = B (d q.1,q.2)) ∧
      (∀ q ∈ B.source, T.symm (B q) = A (d.symm q.1,q.2)) := by
  let T := markedEdgeSignedCollar A B d
  let p := d.prodCongr (Diffeomorph.refl 𝓘(ℝ,ℝ) ℝ ∞)
  have hf (q : L₀ × ℝ) : p q ∈ B.source ↔ q ∈ A.source := by
    rw [hA, hB]
    change (d q.1 ∈ V ∧ q.2 ∈ Ioo (-r) r) ↔ (q.1 ∈ U ∧ q.2 ∈ Ioo (-r) r)
    rw [hd]
  have hb (q : L₁ × ℝ) : p.symm q ∈ A.source ↔ q ∈ B.source := by
    refine (hf (p.symm q)).symm.trans ?_
    rw [p.apply_symm_apply]
  refine ⟨?_, ?_, ?_, ?_⟩
  · ext x
    change ((x ∈ A.target ∧ A.symm x ∈ univ) ∧ p (A.symm x) ∈ B.source) ↔ _
    exact ⟨fun hx => hx.1.1,
      fun hx => ⟨⟨hx, mem_univ _⟩, (hf _).2 (A.map_target hx)⟩⟩
  · ext y
    change (y ∈ B.target ∧ B.symm y ∈ univ ∧ p.symm (B.symm y) ∈ A.source) ↔ _
    exact ⟨fun hy => hy.1,
      fun hy => ⟨hy, mem_univ _, (hb _).2 (B.map_target hy)⟩⟩
  · intro q hq
    change B (p (A.symm (A q))) = B (p q)
    exact congrArg (fun q => B (p q)) (A.left_inv hq)
  · intro q hq
    change A (p.symm (B.symm (B q))) = A (p.symm q)
    exact congrArg (fun q => A (p.symm q)) (B.left_inv hq)

/-- Calibrating each collar by its own height identifies both complete
signed germs, including the inverse height difference. -/
theorem markedEdgeSignedCollar_height
    {U : Set L₀} {V : Set L₁} {r a b : ℝ} {f : M → ℝ} {g : N → ℝ}
    (hA : A.source = U ×ˢ Ioo (-r) r) (hB : B.source = V ×ˢ Ioo (-r) r)
    (hd : ∀ x, d x ∈ V ↔ x ∈ U)
    (hf : ∀ q ∈ A.source, f (A q) = a + q.2) (hg : ∀ q ∈ B.source, g (B q) = b + q.2) :
    let T := markedEdgeSignedCollar A B d
    (∀ x ∈ T.source, g (T x) - b = f x - a) ∧
      (∀ y ∈ T.target, f (T.symm y) - a = g y - b) := by
  let T := markedEdgeSignedCollar A B d
  obtain ⟨hTS,hTT,hTF,hTI⟩ := markedEdgeSignedCollar_eqOn A B d hA hB hd
  constructor
  · intro x hx
    have hxA : x ∈ A.target := hTS ▸ hx
    let q := A.symm x
    have hq : q ∈ A.source := A.map_target hxA
    have hq' : q ∈ U ×ˢ Ioo (-r) r := by rwa [← hA]
    have hqd : (d q.1,q.2) ∈ B.source := by
      rw [hB]
      exact ⟨(hd _).2 hq'.1, hq'.2⟩
    have he : A q = x := A.right_inv hxA
    have hforward : T x = B (d q.1,q.2) := he ▸ hTF q hq
    rw [hforward, hg _ hqd, ← he, hf _ hq]
    ring
  · intro y hy
    have hyB : y ∈ B.target := hTT ▸ hy
    let q := B.symm y
    have hq : q ∈ B.source := B.map_target hyB
    have hq' : q ∈ V ×ˢ Ioo (-r) r := by rwa [← hB]
    have hqu : d.symm q.1 ∈ U := by
      apply (hd (d.symm q.1)).1
      rw [d.apply_symm_apply]
      exact hq'.1
    have hqd : (d.symm q.1,q.2) ∈ A.source := by
      rw [hA]
      exact ⟨hqu, hq'.2⟩
    have he : B q = y := B.right_inv hyB
    have hback : T.symm y = A (d.symm q.1,q.2) := he ▸ hTI q hq
    rw [hback, hf _ hqd, ← he, hg _ hq]
    ring

end Collar

end Patches

namespace IsolatedOneHandle

variable {H M : Type} [TopologicalSpace H] [TopologicalSpace M] [ChartedSpace H M]
  {J : ModelWithCorners ℝ (MorseModel 4) H} [J.Boundaryless] [IsManifold J ∞ M]
  {f : M → ℝ} {hf : ContMDiff J 𝓘(ℝ, ℝ) ∞ f} {p : M} {lo hi : ℝ}
  (D : IsolatedOneHandle hf p lo hi)
  {K N : Type*} [TopologicalSpace K] [TopologicalSpace N] [ChartedSpace K N]
  {I : ModelWithCorners ℝ (MorseModel 4) K}

local notation "I₄" => morseModelWithCornersHalfSpace 3
local notation "X" => SublevelSpace f (f p - D.ε)
local notation "Y" => SublevelSpace f (f p + D.ε)
local notation "hk₁" => (show (1 : ℕ) ≤ 4 by decide)
local notation "φ" => morseAttachingEmbedding hk₁ (f p) D.ε D.r D.chart D.ε_pos D.attaching_radius
local notation "Trace" => Handle.AdjunctionSpace 1 3 φ

/-- Two complete incoming ball charts with disjoint open targets determine
the bodies of both native feet. For a merger, the whole feet lie on opposite
marked spheres, including every transverse boundary parameter. -/
theorem nativeFeet_on_oppositeIncomingSpheres
    (b b' : CellBoundary 1) (hlabels : D.incomingBodyFoot b ≠ D.incomingBodyFoot b')
    (P Q : PartialDiffeomorph 𝓘(ℝ, EuclideanSpace ℝ (Fin 4)) J
      (EuclideanSpace ℝ (Fin 4)) M ∞)
    (hP : Metric.closedBall 0 1 ⊆ P.source) (hQ : Metric.closedBall 0 1 ⊆ Q.source)
    (hbody : (P '' Metric.closedBall 0 1) ∪ (Q '' Metric.closedBall 0 1) =
      f ⁻¹' Iic (f p - D.ε))
    (hlevel : (P '' Metric.sphere 0 1) ∪ (Q '' Metric.sphere 0 1) =
      f ⁻¹' {f p - D.ε})
    (hdisj : Disjoint P.target Q.target) :
    ((∀ z : ClosedCell 3, (φ (b,z)).val ∈ P '' Metric.sphere 0 1) ∧
      (∀ z : ClosedCell 3, (φ (b',z)).val ∈ Q '' Metric.sphere 0 1)) ∨
    ((∀ z : ClosedCell 3, (φ (b,z)).val ∈ Q '' Metric.sphere 0 1) ∧
      (∀ z : ClosedCell 3, (φ (b',z)).val ∈ P '' Metric.sphere 0 1)) := by
  let _ := Handle.attachingRegionChartedSpace 1 3
  let _ := manifoldLevelSetChartedSpace J f (f p - D.ε) hf D.lower_regular
  have hcell : Convex ℝ ({x : EuclideanSpace ℝ (Fin 3) | ‖x‖ ≤ 1} : Set _) := by
    simpa only [Metric.closedBall, dist_zero_right] using
      (convex_closedBall (0 : EuclideanSpace ℝ (Fin 3)) (1 : ℝ))
  let : PreconnectedSpace (ClosedCell 3) := Subtype.preconnectedSpace hcell.isPreconnected
  let foot (a : CellBoundary 1) (z : ClosedCell 3) := (φ (a,z)).val
  have hc (a : CellBoundary 1) : Continuous (foot a) :=
    (continuous_subtype_val.comp D.attachingFeet_smooth.continuous).comp
      (continuous_const.prodMk continuous_id)
  have hPl : P '' Metric.sphere 0 1 ⊆ P.target := by
    rintro _ ⟨x,hx,rfl⟩
    exact P.map_source (hP (Metric.sphere_subset_closedBall hx))
  have hQl : Q '' Metric.sphere 0 1 ⊆ Q.target := by
    rintro _ ⟨x,hx,rfl⟩
    exact Q.map_source (hQ (Metric.sphere_subset_closedBall hx))
  have hmem (a : CellBoundary 1) (z : ClosedCell 3) :
      foot a z ∈ (P '' Metric.sphere 0 1) ∪ (Q '' Metric.sphere 0 1) := by
    rw [hlevel]
    exact morseAttachingEmbedding_value hk₁ (f p) D.ε D.r D.chart D.ε_pos D.attaching_radius (a,z)
  have hgo (a : CellBoundary 1) :
      (∀ z, foot a z ∈ P '' Metric.sphere 0 1) ∨ (∀ z, foot a z ∈ Q '' Metric.sphere 0 1) := by
    have hsub : range (foot a) ⊆ P.target ∪ Q.target := by
      rintro _ ⟨z,rfl⟩
      exact (union_subset_union hPl hQl) (hmem a z)
    rcases IsPreconnected.subset_or_subset P.open_target Q.open_target hdisj hsub
      (isPreconnected_range (hc a)) with h | h
    · exact Or.inl fun z => (hmem a z).resolve_right
        (fun hz => Set.disjoint_left.mp hdisj (h (mem_range_self z)) (hQl hz))
    · exact Or.inr fun z => (hmem a z).resolve_left
        (fun hz => Set.disjoint_left.mp hdisj (hPl hz) (h (mem_range_self z)))
  have separated
      (R : PartialDiffeomorph 𝓘(ℝ, EuclideanSpace ℝ (Fin 4)) J
      (EuclideanSpace ℝ (Fin 4)) M ∞)
      (hR : Metric.closedBall 0 1 ⊆ R.source)
      (hRbody : R '' Metric.closedBall 0 1 ⊆ f ⁻¹' Iic (f p - D.ε))
      (ha : ∀ z, foot b z ∈ R '' Metric.sphere 0 1)
      (ha' : ∀ z, foot b' z ∈ R '' Metric.sphere 0 1) : False := by
    let C := Metric.closedBall (0 : EuclideanSpace ℝ (Fin 4)) 1
    let lift : C → X := fun x => ⟨R x.val, hRbody ⟨x.val,x.property,rfl⟩⟩
    have hc : Continuous lift :=
      (R.contMDiffOn.continuousOn.comp_continuous continuous_subtype_val (fun x => hR x.property)).subtype_mk _
    let : PreconnectedSpace C := isPreconnected_iff_preconnectedSpace.mp Metric.isPreconnected_closedBall
    have hC : IsPreconnected (range lift) := isPreconnected_range hc
    have hcen (a : CellBoundary 1) (h : ∀ z, foot a z ∈ R '' Metric.sphere 0 1) :
        φ (a, closedCellCenter 3) ∈ range lift := by
      obtain ⟨v,hv,he⟩ := h (closedCellCenter 3)
      exact ⟨⟨v,Metric.sphere_subset_closedBall hv⟩, Subtype.ext he⟩
    apply hlabels
    exact ConnectedComponents.coe_eq_coe'.mpr
      ((hC.subset_connectedComponent (hcen b' ha')) (hcen b ha))
  rcases hgo b with hb | hb <;> rcases hgo b' with hb' | hb'
  · exact False.elim (separated P hP (by rw [← hbody]; exact subset_union_left) hb hb')
  · exact Or.inl ⟨hb,hb'⟩
  · exact Or.inr ⟨hb,hb'⟩
  · exact False.elim (separated Q hQ (by rw [← hbody]; exact subset_union_right) hb hb')

/-- The actual lower open region on which the stored trace fixes
the ambient point. The strict inequality gives an open patch. -/
def nativeDeepLower : TopologicalSpace.Opens X :=
  ⟨{x | f x.val < f p - D.ε - D.η},
    isOpen_lt (hf.continuous.comp continuous_subtype_val) continuous_const⟩

/-- The corresponding open region of the actual rounded adjunction. -/
def nativeDeepTrace : TopologicalSpace.Opens Trace := by
  letI := D.traceCharts
  letI := manifoldSublevelChartedSpace J f (f p + D.ε) hf D.upper_regular
  exact ⟨{z | f (D.traceDiffeomorph z).val < f p - D.ε - D.η},
    isOpen_lt (hf.continuous.comp (continuous_subtype_val.comp D.traceDiffeomorph.continuous))
      continuous_const⟩

private def nativeDeepTrace_inclusion :
    letI := D.traceCharts
    D.nativeDeepLower → D.nativeDeepTrace := by
  letI := D.traceCharts
  letI := manifoldSublevelChartedSpace J f (f p + D.ε) hf D.upper_regular
  intro x
  have hx : f x.val.val < f p - D.ε - D.η := x.property
  have he := D.fixes_deep_lower x.val.val hx.le x.val.property
  exact ⟨Handle.lower φ x.val, by
    change f (D.traceDiffeomorph (Handle.lower φ x.val)).val < _
    rw [he]
    exact hx⟩

private def nativeDeepTrace_inverse :
    letI := D.traceCharts
    D.nativeDeepTrace → D.nativeDeepLower := by
  letI := D.traceCharts
  letI := manifoldSublevelChartedSpace J f (f p + D.ε) hf D.upper_regular
  intro z
  have hz : f (D.traceDiffeomorph z.val).val < f p - D.ε - D.η := z.property
  exact ⟨⟨(D.traceDiffeomorph z.val).val, hz.le.trans (sub_le_self _ D.η_pos.le)⟩, hz⟩

/-- The stored trace induces a smooth open patch with the literal lower
insertion as forward map. The inverse reads the same ambient point. -/
def nativeDeepTraceDiffeomorph :
    letI := D.traceCharts
    letI := manifoldSublevelChartedSpace J f (f p - D.ε) hf D.lower_regular
    D.nativeDeepLower ≃ₘ^∞⟮I₄,I₄⟯ D.nativeDeepTrace := by
  letI := D.traceCharts
  letI := manifoldSublevelChartedSpace J f (f p - D.ε) hf D.lower_regular
  letI := manifoldSublevelChartedSpace J f (f p + D.ε) hf D.upper_regular
  refine
    { toFun := D.nativeDeepTrace_inclusion
      invFun := D.nativeDeepTrace_inverse
      left_inv := ?_
      right_inv := ?_
      contMDiff_toFun := ?_
      contMDiff_invFun := ?_ }
  · intro x
    have hx : f x.val.val < f p - D.ε - D.η := x.property
    exact Subtype.ext (Subtype.ext (D.fixes_deep_lower x.val.val hx.le x.val.property))
  · intro z
    have hz : f (D.traceDiffeomorph z.val).val < f p - D.ε - D.η := z.property
    exact Subtype.ext (D.deep_lower_preimage _ hz.le (D.traceDiffeomorph z.val).property z.val rfl).symm
  · apply (DifferentialGeometry.Manifold.contMDiff_subtypeVal_comp_iff
      D.nativeDeepTrace _).mp
    exact D.lower_smooth.comp contMDiff_subtype_val
  · apply (DifferentialGeometry.Manifold.contMDiff_subtypeVal_comp_iff
      D.nativeDeepLower _).mp
    apply contMDiff_sublevelCorestrict J f (f p - D.ε) hf D.lower_regular
      (fun z : D.nativeDeepTrace => (D.traceDiffeomorph z.val).val)
    · exact (contMDiff_manifoldSublevelInclusion J f (f p + D.ε) hf D.upper_regular).comp
        (D.traceDiffeomorph.contMDiff.comp contMDiff_subtype_val)

theorem nativeDeepTraceDiffeomorph_apply :
    letI := D.traceCharts
    letI := manifoldSublevelChartedSpace J f (f p - D.ε) hf D.lower_regular
    ∀ x : D.nativeDeepLower, (D.nativeDeepTraceDiffeomorph x).val = Handle.lower φ x.val :=
  fun _ => rfl

theorem nativeDeepTraceDiffeomorph_symm_apply :
    letI := D.traceCharts
    letI := manifoldSublevelChartedSpace J f (f p - D.ε) hf D.lower_regular
    letI := manifoldSublevelChartedSpace J f (f p + D.ε) hf D.upper_regular
    ∀ z : D.nativeDeepTrace,
      (D.nativeDeepTraceDiffeomorph.symm z).val.val = (D.traceDiffeomorph z.val).val :=
  fun _ => rfl

/-- Read a comparison on the actual upper body using exactly the smooth
structure and diffeomorphism stored on this adjunction. -/
def markedEdgeTraceMap :
    letI := D.traceCharts
    letI := manifoldSublevelChartedSpace J f (f p + D.ε) hf D.upper_regular
    (PartialDiffeomorph I₄ I Y N ∞) → PartialDiffeomorph I₄ I Trace N ∞ := by
  letI := D.traceCharts
  letI := manifoldSublevelChartedSpace J f (f p + D.ε) hf D.upper_regular
  exact fun F => D.traceDiffeomorph.toPartialDiffeomorph.trans F

theorem markedEdgeTraceMap_domains :
    letI := D.traceCharts
    letI := manifoldSublevelChartedSpace J f (f p + D.ε) hf D.upper_regular
    ∀ (F : PartialDiffeomorph I₄ I Y N ∞),
      (D.markedEdgeTraceMap F).source = D.traceDiffeomorph ⁻¹' F.source ∧
        (D.markedEdgeTraceMap F).target = F.target := by
  let _ := D.traceCharts
  let _ := manifoldSublevelChartedSpace J f (f p + D.ε) hf D.upper_regular
  intro F
  change univ ∩ (D.traceDiffeomorph ⁻¹' F.source) = _ ∧
    F.target ∩ F.symm ⁻¹' univ = _
  simp only [univ_inter, preimage_univ, inter_univ, and_self]

theorem markedEdgeTraceMap_apply :
    letI := D.traceCharts
    letI := manifoldSublevelChartedSpace J f (f p + D.ε) hf D.upper_regular
    ∀ (F : PartialDiffeomorph I₄ I Y N ∞) (z : Trace),
      D.markedEdgeTraceMap F z = F (D.traceDiffeomorph z) := fun _ _ => rfl

theorem markedEdgeTraceMap_symm_apply :
    letI := D.traceCharts
    letI := manifoldSublevelChartedSpace J f (f p + D.ε) hf D.upper_regular
    ∀ (F : PartialDiffeomorph I₄ I Y N ∞) (y : N),
      (D.markedEdgeTraceMap F).symm y = D.traceDiffeomorph.symm (F.symm y) := fun _ _ => rfl

/-- The actual deep lower insertion is fixed by the stored trace. The glued
map therefore uses the original point there, and its inverse returns the
original lower representative. -/
theorem markedEdgeTraceMap_deepLower :
    letI := D.traceCharts
    letI := manifoldSublevelChartedSpace J f (f p + D.ε) hf D.upper_regular
    ∀ (F : PartialDiffeomorph I₄ I Y N ∞)
      (x : M) (hx : f x ≤ f p - D.ε - D.η),
      let xl : X := ⟨x, hx.trans (sub_le_self _ D.η_pos.le)⟩
      let xu : Y := ⟨x, hx.trans (by linarith [D.ε_pos, D.η_pos])⟩
      let z := Handle.lower φ xl
      xu ∈ F.source →
      z ∈ (D.markedEdgeTraceMap F).source ∧
        D.markedEdgeTraceMap F z = F xu ∧
        (D.markedEdgeTraceMap F).symm (F xu) = z := by
  let _ := D.traceCharts
  let _ := manifoldSublevelChartedSpace J f (f p + D.ε) hf D.upper_regular
  intro F x hx xl xu z hxu
  have htrace : D.traceDiffeomorph z = xu :=
    Subtype.ext (D.fixes_deep_lower x hx xl.property)
  have hs : z ∈ (D.markedEdgeTraceMap F).source := by
    rw [(D.markedEdgeTraceMap_domains F).1, mem_preimage, htrace]
    exact hxu
  have hforward : D.markedEdgeTraceMap F z = F xu := congrArg F htrace
  exact ⟨hs, hforward, hforward ▸ (D.markedEdgeTraceMap F).left_inv hs⟩

/-- On the full parameter domain of a supplied outgoing tube, use the same
assembled comparison and the same native trace in both directions. -/
theorem markedEdgeTraceMap_transportTube
    {E A L : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [TopologicalSpace L] [TopologicalSpace A] [ChartedSpace L A]
    {IA : ModelWithCorners ℝ E L} :
    letI := D.traceCharts
    letI := manifoldSublevelChartedSpace J f (f p + D.ε) hf D.upper_regular
    ∀ (F : PartialDiffeomorph I₄ I Y N ∞) (u : A → Y),
      ContMDiff IA I₄ ∞ u → (∀ a, u a ∈ F.source) →
      ∃ v : A → N, ContMDiff IA I ∞ v ∧
        (∀ a, v a = F (u a) ∧
          D.markedEdgeTraceMap F (D.traceDiffeomorph.symm (u a)) = v a ∧
          (D.markedEdgeTraceMap F).symm (v a) = D.traceDiffeomorph.symm (u a)) ∧
        (Function.Injective u → Function.Injective v) := by
  let _ := D.traceCharts
  let _ := manifoldSublevelChartedSpace J f (f p + D.ε) hf D.upper_regular
  intro F u hu hdom
  refine ⟨F ∘ u, ?_, ?_, ?_⟩
  · apply contMDiffOn_univ.mp
    exact F.contMDiffOn.comp hu.contMDiffOn (fun a _ => hdom a)
  · intro a
    refine ⟨rfl, congrArg F (D.traceDiffeomorph.apply_symm_apply _), ?_⟩
    exact congrArg D.traceDiffeomorph.symm (F.left_inv (hdom a))
  · intro hinj a b hab
    exact hinj (F.toPartialEquiv.injOn (hdom a) (hdom b) hab)

/-- An actual marked outgoing level map into the model keeps the whole tube
and its inverse parameter equality upon composing through the native trace. -/
theorem markedEdgeTraceMap_transportOutgoingTube
    {E A L : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [TopologicalSpace L] [TopologicalSpace A] [ChartedSpace L A]
    [CompactSpace A] [T2Space N] {IA : ModelWithCorners ℝ E L} :
    letI := D.traceCharts
    letI := manifoldSublevelChartedSpace J f (f p + D.ε) hf D.upper_regular
    letI := manifoldLevelSetChartedSpace J f (f p + D.ε) hf D.upper_regular
    ∀ (F : PartialDiffeomorph I₄ I Y N ∞) (u : A → LevelSetSpace f (f p + D.ε)),
      ContMDiff IA 𝓘(ℝ, MorseModel 3) ∞ u → (∀ a, regularEndLevelInclusion f _ (u a) ∈ F.source) →
      ∃ v : A → N, ContMDiff IA I ∞ v ∧
        (∀ a, let x := regularEndLevelInclusion f (f p + D.ε) (u a)
          v a = F x ∧ D.markedEdgeTraceMap F (D.traceDiffeomorph.symm x) = v a ∧
            (D.markedEdgeTraceMap F).symm (v a) = D.traceDiffeomorph.symm x) ∧
        (Function.Injective u → Topology.IsClosedEmbedding v) := by
  let _ := D.traceCharts
  let _ := manifoldSublevelChartedSpace J f (f p + D.ε) hf D.upper_regular
  let _ := manifoldLevelSetChartedSpace J f (f p + D.ε) hf D.upper_regular
  intro F u hu hdom
  let inc := regularEndLevelInclusion f (f p + D.ε)
  have hinc : ContMDiff 𝓘(ℝ, MorseModel 3) I₄ ∞ inc :=
    contMDiff_levelSetSublevelInclusion f (f p + D.ε) hf D.upper_regular
  obtain ⟨v, hv, heq, hinj⟩ := D.markedEdgeTraceMap_transportTube F (inc ∘ u) (hinc.comp hu) hdom
  refine ⟨v, hv, heq, fun h => hv.continuous.isClosedEmbedding (hinj ?_)⟩
  intro a b hab
  apply h
  exact Subtype.ext (congrArg (fun x : Y => x.val) hab)

/-- If the four matched patches cover both bodies, identify the stored
rounded adjunction with the model by a smooth global map. Both lower and
handle representatives retain the actual trace images. -/
theorem exists_markedEdgeTraceDiffeomorph_of_cover :
    letI := D.traceCharts
    letI := manifoldSublevelChartedSpace J f (f p + D.ε) hf D.upper_regular
    ∀ (P : Fin 4 → PartialDiffeomorph I₄ I Y N ∞)
      (_hS : ∀ i j, EqOn (P i) (P j) ((P i).source ∩ (P j).source))
      (_hT : ∀ i j, EqOn (P i).symm (P j).symm ((P i).target ∩ (P j).target)),
      (⋃ i, (P i).source) = univ → (⋃ i, (P i).target) = univ →
      ∃ (F : Y ≃ₘ^∞⟮I₄,I⟯ N) (e : Trace ≃ₘ^∞⟮I₄,I⟯ N),
        (∀ i, EqOn F (P i) (P i).source ∧ EqOn F.symm (P i).symm (P i).target) ∧
        (∀ x : X, e (Handle.lower φ x) = F (D.traceDiffeomorph (Handle.lower φ x))) ∧
        (∀ x : Handle.StandardHandle 1 3,
          e (Handle.cell φ x) = F (D.traceDiffeomorph (Handle.cell φ x))) ∧
        (∀ y, e.symm y = D.traceDiffeomorph.symm (F.symm y)) := by
  let _ := D.traceCharts
  let _ := manifoldSublevelChartedSpace J f (f p + D.ε) hf D.upper_regular
  intro P hS hT hs ht
  let F := markedEdgePatchDiffeomorph P hS hT hs ht
  exact ⟨F, D.traceDiffeomorph.trans F, markedEdgePatchDiffeomorph_eqOn P hS hT hs ht,
    fun _ => rfl, fun _ => rfl, fun _ => rfl⟩

end IsolatedOneHandle

end

end SmoothPoincare
