import SmoothPoincare.Heights.MarkedHandleGluing
import DifferentialGeometry.Analysis.InnerProductSpace.EuclideanSplit
import Mathlib.Analysis.Convex.GaugeRescale

/-! # A topological leaf collapse in product coordinates -/

open DifferentialGeometry.Topology Set Metric

namespace SmoothPoincare

noncomputable section

local notation "V[" n "]" => EuclideanSpace ℝ (Fin n)

private theorem endLine_norm (x : V[1]) : ‖x‖ = |x 0| := by
  have h := EuclideanSpace.norm_sq_eq x
  rw [Fin.sum_univ_one, Real.norm_eq_abs] at h
  exact (sq_eq_sq₀ (norm_nonneg _) (abs_nonneg _)).mp h

private def endLine (t : ℝ) : V[1] := WithLp.toLp 2 (fun _ => t)

@[simp] private theorem endLine_apply (t : ℝ) (i : Fin 1) : endLine t i = t := rfl

private def endInterval (t : ℝ) (ht : t ∈ Icc (-1 : ℝ) 1) : ClosedCell 1 :=
  ⟨endLine t, by rwa [endLine_norm, endLine_apply, abs_le]⟩

private def endCoordinate (x : ClosedCell 1) : ℝ := x.val 0

@[simp] private theorem endCoordinate_endInterval (t : ℝ) (ht) :
    endCoordinate (endInterval t ht) = t := rfl

private theorem endCoordinate_bounds (x : ClosedCell 1) : endCoordinate x ∈ Icc (-1 : ℝ) 1 := by
  simpa only [endCoordinate, endLine_norm, abs_le, mem_Icc] using x.property

private theorem endCoordinate_injective : Function.Injective endCoordinate := by
  intro x y h
  apply Subtype.ext
  ext i
  have hi : i = 0 := Subsingleton.elim _ _
  subst i
  exact h

private theorem continuous_endCoordinate : Continuous endCoordinate :=
  (EuclideanSpace.proj (𝕜 := ℝ) 0).continuous.comp continuous_subtype_val

/-- Two product-coordinate zero bodies. Each factor is a cylinder of dimension `n+1`,
    with distinct labels for its two ends. The application uses `n = 3`. -/
abbrev LeafZeroBodies (n : ℕ) := Handle.StandardHandle 1 n ⊕ Handle.StandardHandle 1 n

/-- The native 1-handle attaches its negative endpoint to the positive disk of
    the left body and its positive endpoint to the negative disk of the right body. -/
def leafAttachment (n : ℕ) : Handle.AttachingRegion 1 n → LeafZeroBodies n := fun x =>
  if x.1.val 0 < 0 then
    .inl (endInterval 1 (by norm_num), x.2)
  else
    .inr (endInterval (-1) (by norm_num), x.2)

private def leftLeafFoot {n : ℕ} (y : ClosedCell n) : Handle.AttachingRegion 1 n :=
  (⟨endLine (-1), by rw [endLine_norm, endLine_apply, abs_neg, abs_one]⟩, y)

private def rightLeafFoot {n : ℕ} (y : ClosedCell n) : Handle.AttachingRegion 1 n :=
  (⟨endLine 1, by rw [endLine_norm, endLine_apply, abs_one]⟩, y)

/-- One actual adjunction of the native product 1-handle to the two zero bodies. -/
abbrev LeafAdjunction (n : ℕ) := Handle.AdjunctionSpace 1 n (leafAttachment n)

/-- The three intervals of length two concatenate to a single cylinder. -/
def leafCylinder (n : ℕ) : Set (V[n] × ℝ) := closedBall 0 1 ×ˢ Icc (-3) 3

private theorem isCompact_leafCylinder (n : ℕ) : IsCompact (leafCylinder n) :=
  (isCompact_closedBall _ _).prod isCompact_Icc

private def leafPlacement {n : ℕ} (shift : ℝ) (hshift : shift ∈ Icc (-2 : ℝ) 2)
    (p : Handle.StandardHandle 1 n) : leafCylinder n := by
  refine ⟨(p.2.val, endCoordinate p.1 + shift), ?_⟩
  refine ⟨by simpa only [mem_closedBall_zero_iff] using p.2.property, ?_⟩
  have hx := endCoordinate_bounds p.1
  exact ⟨by linarith [hx.1, hshift.1], by linarith [hx.2, hshift.2]⟩

private theorem continuous_leafPlacement {n : ℕ} (shift : ℝ) (hshift) :
    Continuous (leafPlacement (n := n) shift hshift) :=
  ((continuous_subtype_val.comp continuous_snd).prodMk
    ((continuous_endCoordinate.comp continuous_fst).add continuous_const)).subtype_mk _

private theorem leafPlacement_eq {n : ℕ} {shift shift' : ℝ} {hshift hshift'}
    {p q : Handle.StandardHandle 1 n}
    (h : leafPlacement shift hshift p = leafPlacement shift' hshift' q) :
    p.2 = q.2 ∧ endCoordinate p.1 + shift = endCoordinate q.1 + shift' :=
  ⟨Subtype.ext (congrArg (fun z : leafCylinder n => z.val.1) h),
    congrArg (fun z : leafCylinder n => z.val.2) h⟩

private theorem leafPlacement_eq_same {n : ℕ} {shift : ℝ} {hshift}
    {p q : Handle.StandardHandle 1 n}
    (h : leafPlacement shift hshift p = leafPlacement shift hshift q) : p = q :=
  Prod.ext (endCoordinate_injective (add_right_cancel (leafPlacement_eq h).2))
    (leafPlacement_eq h).1

private def leafRepresentatives (n : ℕ) :
    Handle.StandardHandle 1 n ⊕ LeafZeroBodies n → leafCylinder n :=
  Sum.elim (leafPlacement 0 (by norm_num))
    (Sum.elim (leafPlacement (-2) (by norm_num)) (leafPlacement 2 (by norm_num)))

private theorem leafRepresentatives_coherence {n : ℕ} (p : Handle.AttachingRegion 1 n) :
    leafRepresentatives n (.inl (Handle.attachingInclusion 1 n p)) =
      leafRepresentatives n (.inr (leafAttachment n p)) := by
  have hp : |p.1.val 0| = 1 := (endLine_norm _).symm.trans p.1.property
  unfold leafAttachment
  split_ifs with hs
  · rw [abs_of_neg hs] at hp
    apply Subtype.ext
    change (p.2.val, p.1.val 0 + 0) = (p.2.val, 1 + -2)
    exact Prod.ext rfl (by linarith)
  · rw [abs_of_nonneg (le_of_not_gt hs)] at hp
    apply Subtype.ext
    change (p.2.val, p.1.val 0 + 0) = (p.2.val, -1 + 2)
    exact Prod.ext rfl (by linarith)

private def leafCylinderMap (n : ℕ) : LeafAdjunction n → leafCylinder n :=
  Quot.lift (leafRepresentatives n) fun _ _ h => by
    rcases h with ⟨a, ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩⟩
    · exact leafRepresentatives_coherence a
    · exact (leafRepresentatives_coherence a).symm

private theorem continuous_leafCylinderMap (n : ℕ) : Continuous (leafCylinderMap n) :=
  continuous_quot_lift _ ((continuous_leafPlacement 0 _).sumElim
      ((continuous_leafPlacement (-2) _).sumElim (continuous_leafPlacement 2 _)))

private theorem leafCylinderMap_surjective (n : ℕ) : Function.Surjective (leafCylinderMap n) := by
  intro ⟨⟨y, t⟩, hy, ht⟩
  have ht' : t ∈ Icc (-3 : ℝ) 3 := ht
  let d : ClosedCell n := ⟨y, mem_closedBall_zero_iff.mp hy⟩
  by_cases hlo : t < -1
  · let p : Handle.StandardHandle 1 n :=
      (endInterval (t + 2) ⟨by linarith [ht'.1], by linarith⟩, d)
    refine ⟨Handle.lower (leafAttachment n) (.inl p), Subtype.ext ?_⟩
    change (y, (t + 2) + -2) = (y, t)
    exact Prod.ext rfl (by ring)
  by_cases hhi : 1 < t
  · let p : Handle.StandardHandle 1 n :=
      (endInterval (t - 2) ⟨by linarith, by linarith [ht'.2]⟩, d)
    refine ⟨Handle.lower (leafAttachment n) (.inr p), Subtype.ext ?_⟩
    change (y, (t - 2) + 2) = (y, t)
    exact Prod.ext rfl (by ring)
  · let p : Handle.StandardHandle 1 n :=
      (endInterval t ⟨le_of_not_gt hlo, le_of_not_gt hhi⟩, d)
    refine ⟨Handle.cell (leafAttachment n) p, Subtype.ext ?_⟩
    change (y, t + 0) = (y, t)
    rw [add_zero]

private theorem leafCell_eq_left {n : ℕ} {p q : Handle.StandardHandle 1 n}
    (h : leafPlacement 0 (by norm_num) p = leafPlacement (-2) (by norm_num) q) :
    Handle.cell (leafAttachment n) p = Handle.lower (leafAttachment n) (.inl q) := by
  obtain ⟨hd, hs⟩ := leafPlacement_eq h
  have hp := endCoordinate_bounds p.1
  have hq := endCoordinate_bounds q.1
  have heqp : p = Handle.attachingInclusion 1 n (leftLeafFoot p.2) :=
    Prod.ext (endCoordinate_injective (show endCoordinate p.1 = -1 by linarith [hp.1, hq.2])) rfl
  have heqq : (Sum.inl q : LeafZeroBodies n) = leafAttachment n (leftLeafFoot p.2) := by
    change Sum.inl q = (if (-1 : ℝ) < 0 then _ else _)
    rw [ite_eq_left (by norm_num)]
    exact congrArg Sum.inl
      (Prod.ext (endCoordinate_injective (show endCoordinate q.1 = 1 by linarith [hp.1, hq.2]))
        hd.symm)
  rw [heqq]
  exact (congrArg (Handle.cell (leafAttachment n)) heqp).trans (adjunction_coherence _ _ _)

private theorem leafCell_eq_right {n : ℕ} {p q : Handle.StandardHandle 1 n}
    (h : leafPlacement 0 (by norm_num) p = leafPlacement 2 (by norm_num) q) :
    Handle.cell (leafAttachment n) p = Handle.lower (leafAttachment n) (.inr q) := by
  obtain ⟨hd, hs⟩ := leafPlacement_eq h
  have hp := endCoordinate_bounds p.1
  have hq := endCoordinate_bounds q.1
  have heqp : p = Handle.attachingInclusion 1 n (rightLeafFoot p.2) :=
    Prod.ext (endCoordinate_injective (show endCoordinate p.1 = 1 by linarith [hp.2, hq.1])) rfl
  have heqq : (Sum.inr q : LeafZeroBodies n) = leafAttachment n (rightLeafFoot p.2) := by
    change Sum.inr q = (if (1 : ℝ) < 0 then _ else _)
    rw [ite_eq_right (by norm_num)]
    exact congrArg Sum.inr
      (Prod.ext (endCoordinate_injective (show endCoordinate q.1 = -1 by linarith [hp.2, hq.1]))
        hd.symm)
  rw [heqq]
  exact (congrArg (Handle.cell (leafAttachment n)) heqp).trans (adjunction_coherence _ _ _)

private theorem leafLeft_ne_right {n : ℕ} {p q : Handle.StandardHandle 1 n}
    (h : leafPlacement (-2) (by norm_num) p = leafPlacement 2 (by norm_num) q) : False := by
  have hp := (endCoordinate_bounds p.1).2
  have hq := (endCoordinate_bounds q.1).1
  linarith [(leafPlacement_eq h).2]

private theorem leafCylinderMap_injective (n : ℕ) : Function.Injective (leafCylinderMap n) := by
  intro x y h
  revert h
  induction x using Quot.ind with
  | mk x =>
  induction y using Quot.ind with
  | mk y =>
  intro h
  change leafRepresentatives n x = leafRepresentatives n y at h
  rcases x with p | (p | p) <;> rcases y with q | (q | q)
  · exact congrArg (Handle.cell (leafAttachment n)) (leafPlacement_eq_same (shift := 0) (hshift := by norm_num) h)
  · exact leafCell_eq_left h
  · exact leafCell_eq_right h
  · exact (leafCell_eq_left h.symm).symm
  · exact congrArg (fun z => Handle.lower (leafAttachment n) (.inl z)) (leafPlacement_eq_same (shift := -2) (hshift := by norm_num) h)
  · exact (leafLeft_ne_right h).elim
  · exact (leafCell_eq_right h.symm).symm
  · exact (leafLeft_ne_right h.symm).elim
  · exact congrArg (fun z => Handle.lower (leafAttachment n) (.inr z)) (leafPlacement_eq_same (shift := 2) (hshift := by norm_num) h)

private theorem compactSpace_leafAdjunction (n : ℕ) : CompactSpace (LeafAdjunction n) := by
  exact (Quot.mk_surjective : Function.Surjective (adjunctionMk
    (Handle.attachingInclusion 1 n) (leafAttachment n))).compactSpace
      (continuous_adjunctionMk _ _)

/-- A genuine quotient homeomorphism. The negative ball, handle and positive
    ball are translated by `-2,0,2` in the axial coordinate. The proof checks
    that the only cross-piece coincidences are precisely the glued feet. -/
def leafCylinderHomeomorph (n : ℕ) : LeafAdjunction n ≃ₜ leafCylinder n := by
  letI := compactSpace_leafAdjunction n
  exact Equiv.toHomeomorphOfContinuousClosed
    (Equiv.ofBijective _ ⟨leafCylinderMap_injective n, leafCylinderMap_surjective n⟩)
    (continuous_leafCylinderMap n)
      (Continuous.isClosedMap (continuous_leafCylinderMap n))

@[simp] theorem leafCylinderHomeomorph_cell {n : ℕ} (p : Handle.StandardHandle 1 n) :
    (leafCylinderHomeomorph n (Handle.cell (leafAttachment n) p)).val =
      (p.2.val, p.1.val 0) := by
  change (p.2.val, endCoordinate p.1 + 0) = _
  rw [add_zero]
  rfl

@[simp] theorem leafCylinderHomeomorph_left {n : ℕ} (p : Handle.StandardHandle 1 n) :
    (leafCylinderHomeomorph n (Handle.lower (leafAttachment n) (.inl p))).val =
      (p.2.val, p.1.val 0 - 2) := by
  change (_, endCoordinate p.1 + -2) = _
  rw [sub_eq_add_neg]
  rfl

@[simp] theorem leafCylinderHomeomorph_right {n : ℕ} (p : Handle.StandardHandle 1 n) :
    (leafCylinderHomeomorph n (Handle.lower (leafAttachment n) (.inr p))).val =
      (p.2.val, p.1.val 0 + 2) := rfl

/-- The boundary of the composite is the exterior frontier of the concatenated
    cylinder. The interiors of the two glued disk faces are now interior points. -/
abbrev LeafBoundary (n : ℕ) := frontier (leafCylinder n)

def leafBoundaryInclusion (n : ℕ) (x : LeafBoundary n) : LeafAdjunction n :=
  (leafCylinderHomeomorph n).symm
    ⟨x.val, (isCompact_leafCylinder n).isClosed.frontier_subset x.property⟩

theorem mem_leafCylinder_frontier_iff {n : ℕ} (p : leafCylinder (n + 1)) :
    p.val ∈ frontier (leafCylinder (n + 1)) ↔
      ‖p.val.1‖ = 1 ∨ p.val.2 = -3 ∨ p.val.2 = 3 := by
  have hp₁ : p.val.1 ∈ closedBall (0 : V[n + 1]) 1 := p.property.1
  have hp₂ : p.val.2 ∈ Icc (-3 : ℝ) 3 := p.property.2
  change p.val ∈ frontier (closedBall (0 : V[n + 1]) 1 ×ˢ Icc (-3 : ℝ) 3) ↔ _
  rw [frontier_prod_eq, isClosed_closedBall.closure_eq, isClosed_Icc.closure_eq,
    frontier_closedBall _ (by norm_num : (1 : ℝ) ≠ 0), frontier_Icc (by norm_num : (-3 : ℝ) ≤ 3)]
  simp [hp₁, hp₂, or_comm]

/-- The reduced body is a ball. The identification sends the full exterior
    frontier to the boundary sphere and intertwines the native inclusions. -/
theorem exists_leafBallHomeomorph (n : ℕ) :
    ∃ (e : LeafAdjunction n ≃ₜ ClosedCell (n + 1))
      (b : LeafBoundary n ≃ₜ CellBoundary (n + 1)),
      ∀ x, e (leafBoundaryInclusion n x) = cellBoundaryInclusion (n + 1) (b x) := by
  let L := EuclideanSpace.equivProdLast (𝕜 := ℝ) n
  let S : Set V[n + 1] := L ⁻¹' leafCylinder n
  have hc : IsCompact S := by
    change IsCompact (L.toHomeomorph ⁻¹' leafCylinder n)
    rw [← Homeomorph.image_symm]
    exact (isCompact_leafCylinder n).image L.symm.continuous
  have hconv : Convex ℝ S :=
    ((convex_closedBall (0 : V[n]) 1).prod (convex_Icc (-3 : ℝ) 3)).linear_preimage L.toLinearMap
  have hi : (interior S).Nonempty := by
    refine ⟨0, ?_⟩
    rw [show interior S = L.toHomeomorph ⁻¹' interior (leafCylinder n) from
      (L.toHomeomorph.preimage_interior _).symm, leafCylinder, interior_prod_eq]
    change (L 0).1 ∈ interior (closedBall (0 : V[n]) 1) ∧ (L 0).2 ∈ interior (Icc (-3 : ℝ) 3)
    rw [map_zero]
    exact ⟨mem_interior_iff_mem_nhds.mpr (closedBall_mem_nhds _ zero_lt_one),
      mem_interior_iff_mem_nhds.mpr (Icc_mem_nhds (by norm_num) (by norm_num))⟩
  obtain ⟨G, -, hGball, hGboundary⟩ :=
    exists_homeomorph_image_interior_closure_frontier_eq_unitBall hconv hi hc.isBounded
  rw [hc.isClosed.closure_eq] at hGball
  let F := L.toHomeomorph.symm.trans G
  have hFball : F '' leafCylinder n = closedBall (0 : V[n + 1]) 1 := by
    change (G ∘ L.toHomeomorph.symm) '' leafCylinder n = _
    rw [Set.image_comp]
    rw [Homeomorph.image_symm]
    exact hGball
  have hFboundary : F '' frontier (leafCylinder n) = sphere (0 : V[n + 1]) 1 := by
    change (G ∘ L.toHomeomorph.symm) '' frontier (leafCylinder n) = _
    rw [Set.image_comp]
    rw [Homeomorph.image_symm, Homeomorph.preimage_frontier]
    exact hGboundary
  have hFb : F ⁻¹' ({x : V[n + 1] | ‖x‖ ≤ 1}) = leafCylinder n := by
    rw [← show closedBall (0 : V[n + 1]) 1 = {x | ‖x‖ ≤ 1} from by ext; exact mem_closedBall_zero_iff]
    rw [← hFball, Set.preimage_image_eq _ F.injective]
  have hFs : F ⁻¹' ({x : V[n + 1] | ‖x‖ = 1}) = frontier (leafCylinder n) := by
    rw [← show sphere (0 : V[n + 1]) 1 = {x | ‖x‖ = 1} from by ext; exact mem_sphere_zero_iff_norm]
    rw [← hFboundary, Set.preimage_image_eq _ F.injective]
  refine ⟨(leafCylinderHomeomorph n).trans (F.sets hFb.symm), F.sets hFs.symm, ?_⟩
  intro x
  apply Subtype.ext
  change F ((leafCylinderHomeomorph n) ((leafCylinderHomeomorph n).symm _)).val = F x.val
  rw [Homeomorph.apply_symm_apply]

private def expandedLeafPlacement (n : ℕ) (p : Handle.StandardHandle 1 n) :
    leafCylinder n :=
  ⟨(p.2.val, 3 * endCoordinate p.1),
    mem_closedBall_zero_iff.mpr p.2.property,
    ⟨by linarith [(endCoordinate_bounds p.1).1], by linarith [(endCoordinate_bounds p.1).2]⟩⟩

private def expandedLeafHomeomorph (n : ℕ) : Handle.StandardHandle 1 n ≃ₜ leafCylinder n := by
  have hcont : Continuous (expandedLeafPlacement n) :=
    ((continuous_subtype_val.comp continuous_snd).prodMk
      (continuous_const.mul (continuous_endCoordinate.comp continuous_fst))).subtype_mk _
  have hinj : Function.Injective (expandedLeafPlacement n) := by
    intro p q h
    refine Prod.ext (endCoordinate_injective ?_) (Subtype.ext ?_)
    · have ht := congrArg (fun z : leafCylinder n => z.val.2) h
      change 3 * endCoordinate p.1 = 3 * endCoordinate q.1 at ht
      linarith
    · exact congrArg (fun z : leafCylinder n => z.val.1) h
  have hsurj : Function.Surjective (expandedLeafPlacement n) := by
    rintro ⟨⟨y, t⟩, hy, ht⟩
    have h : t ∈ Icc (-3 : ℝ) 3 := ht
    refine ⟨(endInterval (t / 3) ⟨by linarith [h.1], by linarith [h.2]⟩,
      ⟨y, mem_closedBall_zero_iff.mp hy⟩), Subtype.ext ?_⟩
    exact Prod.ext rfl (by change 3 * (t / 3) = t; ring)
  exact (Equiv.ofBijective _ ⟨hinj, hsurj⟩).toHomeomorphOfContinuousClosed hcont hcont.isClosedMap

/-- Change the two zero bodies to copies of the native round ball. The same
    disk coordinates are used at the two feet of the actual 1-handle. -/
def roundLeafAttachment (n : ℕ) (c : Handle.StandardHandle 1 n ≃ₜ ClosedCell (n + 1)) :
    Handle.AttachingRegion 1 n → ClosedCell (n + 1) ⊕ ClosedCell (n + 1) :=
  (c.sumCongr c) ∘ leafAttachment n

/-- In native round-ball carriers the marked feet are in the boundary sphere.
    The one-edge adjunction is a round ball, with its exterior boundary map
    induced by the same homeomorphism. -/
theorem exists_roundLeafAdjunction (n : ℕ) :
    ∃ (c : Handle.StandardHandle 1 (n + 1) ≃ₜ ClosedCell (n + 2))
      (s : LeafAdjunction (n + 1) ≃ₜ Handle.AdjunctionSpace 1 (n + 1)
        (roundLeafAttachment (n + 1) c))
      (d : Handle.AdjunctionSpace 1 (n + 1) (roundLeafAttachment (n + 1) c) ≃ₜ
        ClosedCell (n + 2))
      (b : LeafBoundary (n + 1) ≃ₜ CellBoundary (n + 2)),
      (∀ a : Handle.AttachingRegion 1 (n + 1), ‖(c (Handle.attachingInclusion 1 (n + 1) a)).val‖ = 1) ∧
      (∀ p, s (Handle.cell (leafAttachment (n + 1)) p) =
        Handle.cell (roundLeafAttachment (n + 1) c) p) ∧
      (∀ x, d (s (leafBoundaryInclusion (n + 1) x)) = cellBoundaryInclusion (n + 2) (b x)) := by
  obtain ⟨e, b, hb⟩ := exists_leafBallHomeomorph (n + 1)
  let c := (expandedLeafHomeomorph (n + 1)).trans ((leafCylinderHomeomorph (n + 1)).symm.trans e)
  let s := adjunctionHomeomorph (Handle.attachingInclusion 1 (n + 1)) (leafAttachment (n + 1))
    (Handle.attachingInclusion 1 (n + 1)) (roundLeafAttachment (n + 1) c)
    (Equiv.refl _) (Homeomorph.refl _) (c.sumCongr c) (fun _ => rfl) (fun _ => rfl)
  refine ⟨c, s, s.symm.trans e, b, ?_, fun _ => rfl, ?_⟩
  · intro a
    let p := Handle.attachingInclusion 1 (n + 1) a
    let z := expandedLeafHomeomorph (n + 1) p
    have hnorm : |endCoordinate p.1| = 1 := (endLine_norm _).symm.trans a.1.property
    have hx : z.val ∈ frontier (leafCylinder (n + 1)) := by
      apply (mem_leafCylinder_frontier_iff z).mpr
      change ‖p.2.val‖ = 1 ∨ 3 * endCoordinate p.1 = -3 ∨ 3 * endCoordinate p.1 = 3
      rcases le_or_gt 0 (endCoordinate p.1) with hpos | hneg
      · rw [abs_of_nonneg hpos] at hnorm
        exact Or.inr (Or.inr (by rw [hnorm]; norm_num))
      · rw [abs_of_neg hneg] at hnorm
        exact Or.inr (Or.inl (by linarith))
    let y : LeafBoundary (n + 1) := ⟨z.val, hx⟩
    change ‖(e (leafBoundaryInclusion (n + 1) y)).val‖ = 1
    rw [hb]
    exact (b y).property
  · intro x
    change e (s.symm (s (leafBoundaryInclusion (n + 1) x))) = _
    rw [s.symm_apply_apply, hb]

/-- Transport every remaining attaching coordinate through the leaf collapse.
    The handle representatives use the identity map, so all normal-disk
    coordinates of each surviving handle are preserved. -/
theorem exists_leafBallTransport (n : ℕ) {A H Z : Type*} [TopologicalSpace H] [TopologicalSpace Z]
    (i : A → H) (a : A → LeafBoundary n) (η : Z ≃ₜ LeafBoundary n) :
    ∃ (e : LeafAdjunction n ≃ₜ ClosedCell (n + 1))
      (b : LeafBoundary n ≃ₜ CellBoundary (n + 1))
      (s : AdjunctionSpace i (leafBoundaryInclusion n ∘ a) ≃ₜ
        AdjunctionSpace i (cellBoundaryInclusion (n + 1) ∘ b ∘ a))
      (η' : Z ≃ₜ CellBoundary (n + 1)),
      (∀ z, η' z = b (η z)) ∧
      (∀ h, s (adjunctionCell i (leafBoundaryInclusion n ∘ a) h) =
        adjunctionCell i (cellBoundaryInclusion (n + 1) ∘ b ∘ a) h) ∧
      (∀ p, s (adjunctionLower (leafBoundaryInclusion n ∘ a) p) =
        adjunctionLower (cellBoundaryInclusion (n + 1) ∘ b ∘ a) (e p)) := by
  obtain ⟨e, b, h⟩ := exists_leafBallHomeomorph n
  let s := adjunctionHomeomorph i (leafBoundaryInclusion n ∘ a)
    i (cellBoundaryInclusion (n + 1) ∘ b ∘ a)
    (Equiv.refl A) (Homeomorph.refl H) e (fun _ => rfl) (fun x => h (a x))
  exact ⟨e, b, s, η.trans b, fun _ => rfl, fun _ => rfl, fun _ => rfl⟩

end

end SmoothPoincare
