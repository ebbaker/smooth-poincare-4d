import SmoothPoincare.Heights.NativeAmbientFoot
import SmoothPoincare.Heights.OutgoingHandleCollar
import SmoothPoincare.Heights.TwoFootHeightCollar

/-! # Simultaneous ambient normalization of the feet of one merging edge -/

open DifferentialGeometry DifferentialGeometry.Topology DifferentialGeometry.Topology.Morse
open DifferentialGeometry.Topology.Morse.CellAttachment
open DifferentialGeometry.PDE.RicciFlow.Surgery.Topology Set
open scoped ContDiff Manifold Topology

namespace SmoothPoincare

noncomputable section

/-- The model and protected ball coordinates in one component of a regular level. -/
structure FootCollarMarks {L : Type*} [TopologicalSpace L] [ChartedSpace ThreeSpace L]
    [IsManifold ThreeModel ∞ L] (actual : ThreeSpace → L) (ι : Type*) where
  orientation : ManifoldOrientation ThreeModel L 3
  model : OrientedBallEmbedding L orientation
  feet : ι → OrientedBallEmbedding L orientation
  disjoint_feet : ∀ i j, i ≠ j → Disjoint ((feet i).chart '' Metric.closedBall 0 1)
    ((feet j).chart '' Metric.closedBall 0 1)
  disjoint_actual : ∀ i, Disjoint (actual '' Metric.closedBall 0 1)
    ((feet i).chart '' Metric.closedBall 0 1)
  disjoint_model : ∀ i, Disjoint (model.chart '' Metric.closedBall 0 1)
    ((feet i).chart '' Metric.closedBall 0 1)

private theorem diffeomorph_mapsTo_of_fixes_compl
    {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [TopologicalSpace H]
    [TopologicalSpace M] [ChartedSpace H M] {J : ModelWithCorners ℝ E H}
    (F : M ≃ₘ^∞⟮J,J⟯ M) {U : Set M} (hF : ∀ x ∉ U, F x = x) : MapsTo F U U := by
  intro x hx
  by_contra hy
  have h := F.injective (hF (F x) hy)
  exact hy (h.symm ▸ hx)

private theorem trans_diffeomorph_agrees_on_disjoint_regions
    {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [TopologicalSpace H]
    [TopologicalSpace M] [ChartedSpace H M] {J : ModelWithCorners ℝ E H}
    (F₀ F₁ : M ≃ₘ^∞⟮J,J⟯ M) {U₀ U₁ : Set M} (hU : Disjoint U₀ U₁)
    (hF₀ : ∀ y ∉ U₀, F₀ y = y ∧ F₀.symm y = y)
    (hF₁ : ∀ y ∉ U₁, F₁ y = y ∧ F₁.symm y = y) :
    (∀ y ∈ U₀, F₀.trans F₁ y = F₀ y ∧ (F₀.trans F₁).symm y = F₀.symm y) ∧
    (∀ y ∈ U₁, F₀.trans F₁ y = F₁ y ∧ (F₀.trans F₁).symm y = F₁.symm y) := by
  have hmap₀ := diffeomorph_mapsTo_of_fixes_compl F₀ (fun y hy => (hF₀ y hy).1)
  have hmap₁ := diffeomorph_mapsTo_of_fixes_compl F₁.symm (fun y hy => (hF₁ y hy).2)
  constructor
  · intro y hy
    change F₁ (F₀ y) = F₀ y ∧ F₀.symm (F₁.symm y) = F₀.symm y
    exact ⟨(hF₁ _ (disjoint_left.mp hU (hmap₀ hy))).1,
      congrArg F₀.symm (hF₁ y (disjoint_left.mp hU hy)).2⟩
  · intro y hy
    change F₁ (F₀ y) = F₁ y ∧ F₀.symm (F₁.symm y) = F₁.symm y
    exact ⟨congrArg F₁ (hF₀ y (disjoint_right.mp hU hy)).1,
      (hF₀ _ (disjoint_right.mp hU (hmap₁ hy))).2⟩

namespace IsolatedOneHandle

variable {H M : Type} [TopologicalSpace H] [TopologicalSpace M] [ChartedSpace H M]
  {J : ModelWithCorners ℝ (MorseModel 4) H} [J.Boundaryless] [IsManifold J ∞ M]
  [T2Space M] [CompactSpace M]
  {f : M → ℝ} {hf : ContMDiff J 𝓘(ℝ, ℝ) ∞ f} {p : M} {lo hi : ℝ}
  (D : IsolatedOneHandle hf p lo hi)

local notation "c" => f p - D.ε
local notation "L" => LevelSetSpace f (f p - D.ε)
local notation "K" => 𝓘(ℝ, MorseModel 3)

/-- Exact comparison of all unit-foot points on the central plateau and every
protected tube point on the full signed collar. -/
def NativeFootCollarEquations (b : CellBoundary 1) {ι : Type*} :
    letI := D.footLevelEuclideanCharts
    letI := D.footComponent_isManifold b
    FootCollarMarks (D.footComponentChart b) ι →
    PartialDiffeomorph (ThreeModel.prod 𝓘(ℝ, ℝ)) J (D.footComponent b × ℝ) M ∞ →
    ℝ → (ThreeSpace ≃ₗᵢ[ℝ] ThreeSpace) → (M ≃ₘ^∞⟮J,J⟯ M) → Prop := by
  letI := D.footLevelEuclideanCharts
  letI := D.footComponent_isManifold b
  exact fun marks χ r A F =>
    (∀ (z : ClosedCell 3) t, |t| ≤ r / 3 →
      F (χ (D.footComponentPoint b z, t)) = χ (marks.model.chart (A z.val), t) ∧
      F.symm (χ (marks.model.chart (A z.val), t)) = χ (D.footComponentPoint b z, t)) ∧
    ∀ i (z : ClosedCell 3) t, t ∈ Ioo (-r) r →
      F (χ ((marks.feet i).chart z.val, t)) = χ ((marks.feet i).chart z.val, t) ∧
      F.symm (χ ((marks.feet i).chart z.val, t)) = χ ((marks.feet i).chart z.val, t)

/-- Normalize one native foot inside a calibrated component collar chosen in advance. -/
theorem exists_ambientNativeFootNormalization_inCollar {ι : Type*} [Finite ι] (b : CellBoundary 1) :
    letI := D.footLevelEuclideanCharts
    letI := D.footComponent_isManifold b
    ∀ (marks : FootCollarMarks (D.footComponentChart b) ι)
      (χ : PartialDiffeomorph (ThreeModel.prod 𝓘(ℝ, ℝ)) J (D.footComponent b × ℝ) M ∞)
      {r : ℝ}, 0 < r → χ.source = {q | q.2 ∈ Ioo (-r) r} →
      (∀ q ∈ χ.source, f (χ q) = c + q.2) →
      ∃ (A : ThreeSpace ≃ₗᵢ[ℝ] ThreeSpace) (F : M ≃ₘ^∞⟮J,J⟯ M) (S : Set M),
        (A = LinearIsometryEquiv.refl ℝ ThreeSpace ∨ A = LinearIsometryEquiv.neg ℝ) ∧
        IsCompact S ∧ S ⊆ χ.target ∧ (∀ y ∉ S, F y = y ∧ F.symm y = y) ∧
        (∀ y, f (F y) = f y ∧ f (F.symm y) = f y) ∧ D.NativeFootCollarEquations b marks χ r A F := by
  let := D.footLevelEuclideanCharts
  let := D.footComponent_isManifold b
  let := D.footComponent_connectedSpace b
  intro marks χ r hr hχ hχh
  obtain ⟨A, e, hA, he, hImg⟩ := D.exists_orientedNativeFootComponentChart b marks.orientation
  obtain ⟨T, hT⟩ := exists_relativeFootLevelIsotopy_awayFromFiniteFeet marks.orientation e
    marks.model marks.feet marks.disjoint_feet
    (fun i => hImg.symm ▸ marks.disjoint_actual i) marks.disjoint_model
  have ha : 0 < r / 3 := by linarith
  have hab : r / 3 < 2 * r / 3 := by linarith
  have hbr : 2 * r / 3 < r := by linarith
  obtain ⟨F, hcoord, -, hSc, hSs, hfix, hheight⟩ := T.exists_ambientSignedCollarDiffeomorph χ ha hab hbr hχ
  refine ⟨A, F, _, hA, hSc, hSs, hfix, hheight f c hχh, ?_, ?_⟩
  · intro z t ht
    have hz : A z.val ∈ Metric.closedBall 0 1 := by
      simpa [Metric.mem_closedBall, dist_zero_right] using z.property
    have hmz := hT _ hz
    rw [he z] at hmz
    have hback := congrArg (fun y => (T.isotopy 1).symm y) hmz
    rw [Diffeomorph.symm_apply_apply] at hback
    have htr := abs_lt.mp (ht.trans_lt (hab.trans hbr))
    have hs (v : D.footComponent b) : (v, t) ∈ χ.source := hχ ▸ htr
    rw [(hcoord _ (hs _)).1, (hcoord _ (hs _)).2,
      (T.signedCollarDiffeomorph_eq_endpoint ha hab (p := (D.footComponentPoint b z, t)) ht).1,
      (T.signedCollarDiffeomorph_eq_endpoint ha hab (p := (marks.model.chart (A z.val), t)) ht).2]
    simp only [hmz, ← hback, and_self]
  · intro i z t ht
    let v := (marks.feet i).chart z.val
    have hz : z.val ∈ Metric.closedBall 0 1 := by
      simpa [Metric.mem_closedBall, dist_zero_right] using z.property
    have hv : v ∈ ⋃ j, (marks.feet j).chart '' Metric.closedBall 0 1 :=
      mem_iUnion.mpr ⟨i, z.val, hz, rfl⟩
    have hh := T.signedCollarDiffeomorph_fixes_protected (r / 3) (2 * r / 3) (p := (v, t)) hv
    have hs : (v, t) ∈ χ.source := hχ ▸ ht
    exact ⟨(hcoord _ hs).1.trans (congrArg χ hh.1), (hcoord _ hs).2.trans (congrArg χ hh.2)⟩

omit [T2Space M] [CompactSpace M] in
private theorem nativeFootCollarEquations_of_agrees_on_target {ι : Type*} (b : CellBoundary 1) :
    letI := D.footLevelEuclideanCharts
    letI := D.footComponent_isManifold b
    ∀ (marks : FootCollarMarks (D.footComponentChart b) ι)
      (χ : PartialDiffeomorph (ThreeModel.prod 𝓘(ℝ, ℝ)) J (D.footComponent b × ℝ) M ∞)
      {r : ℝ} {A : ThreeSpace ≃ₗᵢ[ℝ] ThreeSpace} {F G : M ≃ₘ^∞⟮J,J⟯ M},
      0 < r → χ.source = {q | q.2 ∈ Ioo (-r) r} →
      (∀ y ∈ χ.target, G y = F y ∧ G.symm y = F.symm y) →
      D.NativeFootCollarEquations b marks χ r A F → D.NativeFootCollarEquations b marks χ r A G := by
  let := D.footLevelEuclideanCharts
  let := D.footComponent_isManifold b
  intro marks χ r A F G hr hχ hagree heq
  have htarget (v : D.footComponent b) {t : ℝ} (ht : t ∈ Ioo (-r) r) :
      χ (v, t) ∈ χ.target := χ.map_source (hχ ▸ ht)
  constructor
  · intro z t ht
    have ht' : t ∈ Ioo (-r) r := abs_lt.mp (ht.trans_lt (by linarith))
    rw [(hagree _ (htarget _ ht')).1, (hagree _ (htarget _ ht')).2]
    exact heq.1 z t ht
  · intro i z t ht
    rw [(hagree _ (htarget _ ht)).1, (hagree _ (htarget _ ht)).2]
    exact heq.2 i z t ht

/-- One ambient height-preserving diffeomorphism normalizes both native feet on
the shared signed strip for a merging edge, with disjoint compact supports.
It fixes the protected tubes and the open neighborhood above the critical height. -/
theorem exists_markedTreeEdgeFootNormalization {ι₀ ι₁ : Type*} [Finite ι₀] [Finite ι₁]
    (b₀ b₁ : CellBoundary 1)
    (hcomponents : Disjoint (D.footComponent b₀ : Set L) (D.footComponent b₁ : Set L)) :
    letI := manifoldLevelSetChartedSpace J f c hf D.lower_regular
    letI := D.footLevelEuclideanCharts
    letI := D.footComponent_isManifold b₀
    letI := D.footComponent_isManifold b₁
    ∀ (marks₀ : FootCollarMarks (D.footComponentChart b₀) ι₀)
      (marks₁ : FootCollarMarks (D.footComponentChart b₁) ι₁),
      ∃ (r : ℝ) (G : PartialDiffeomorph (ModelWithCorners.prod K 𝓘(ℝ, ℝ)) J (L × ℝ) M ∞)
        (χ : PartialDiffeomorph (ThreeModel.prod 𝓘(ℝ, ℝ)) J (D.footComponent b₀ × ℝ) M ∞)
        (ψ : PartialDiffeomorph (ThreeModel.prod 𝓘(ℝ, ℝ)) J (D.footComponent b₁ × ℝ) M ∞)
        (A₀ A₁ : ThreeSpace ≃ₗᵢ[ℝ] ThreeSpace) (F : M ≃ₘ^∞⟮J,J⟯ M) (S₀ S₁ : Set M),
        0 < r ∧ r ≤ D.ε / 2 ∧ G.source = {q | q.2 ∈ Ioo (-r) r} ∧
        G.target = f ⁻¹' Ioo (c - r) (c + r) ∧
        χ.source = {q | q.2 ∈ Ioo (-r) r} ∧ ψ.source = {q | q.2 ∈ Ioo (-r) r} ∧
        Disjoint χ.target ψ.target ∧
        (∀ q, χ q = G (q.1.val, q.2)) ∧ (∀ q, ψ q = G (q.1.val, q.2)) ∧
        (∀ x : D.footComponent b₀, χ (x, 0) = x.val.val) ∧
        (∀ x : D.footComponent b₁, ψ (x, 0) = x.val.val) ∧
        (∀ q ∈ χ.source, f (χ q) = c + q.2) ∧ (∀ q ∈ ψ.source, f (ψ q) = c + q.2) ∧
        (A₀ = LinearIsometryEquiv.refl ℝ ThreeSpace ∨ A₀ = LinearIsometryEquiv.neg ℝ) ∧
        (A₁ = LinearIsometryEquiv.refl ℝ ThreeSpace ∨ A₁ = LinearIsometryEquiv.neg ℝ) ∧
        IsCompact S₀ ∧ IsCompact S₁ ∧ S₀ ⊆ χ.target ∧ S₁ ⊆ ψ.target ∧ Disjoint S₀ S₁ ∧
        (∀ y ∉ S₀ ∪ S₁, F y = y ∧ F.symm y = y) ∧
        (∀ y, f (F y) = f y ∧ f (F.symm y) = f y) ∧
        (∀ y, f p ≤ f y → F y = y ∧ F.symm y = y) ∧
        D.NativeFootCollarEquations b₀ marks₀ χ r A₀ F ∧
        D.NativeFootCollarEquations b₁ marks₁ ψ r A₁ F := by
  let := manifoldLevelSetChartedSpace J f c hf D.lower_regular
  let := D.footLevelEuclideanCharts
  let := D.footComponent_isManifold b₀
  let := D.footComponent_isManifold b₁
  intro marks₀ marks₁
  obtain ⟨r, hr, hrε, G, χ, ψ, hGS, hGT, hχ, hψ, htargets, hχG, hψG, hχ0, hψ0, hχh, hψh, -, -⟩ :=
    D.exists_twoFootHeightCollars b₀ b₁ hcomponents
  obtain ⟨A₀, F₀, S₀, hA₀, hSc₀, hSs₀, hfix₀, hheight₀, heq₀⟩ :=
    D.exists_ambientNativeFootNormalization_inCollar b₀ marks₀ χ hr hχ hχh
  obtain ⟨A₁, F₁, S₁, hA₁, hSc₁, hSs₁, hfix₁, hheight₁, heq₁⟩ :=
    D.exists_ambientNativeFootNormalization_inCollar b₁ marks₁ ψ hr hψ hψh
  let F := F₀.trans F₁
  have hagree := trans_diffeomorph_agrees_on_disjoint_regions F₀ F₁ htargets
    (fun y hy => hfix₀ y (fun h => hy (hSs₀ h))) (fun y hy => hfix₁ y (fun h => hy (hSs₁ h)))
  have hfix (y : M) (hy : y ∉ S₀ ∪ S₁) : F y = y ∧ F.symm y = y := by
    have h₀ := hfix₀ y (fun h => hy (Or.inl h))
    have h₁ := hfix₁ y (fun h => hy (Or.inr h))
    change F₁ (F₀ y) = y ∧ F₀.symm (F₁.symm y) = y
    rw [h₀.1, h₁.1, h₁.2, h₀.2]
    exact ⟨rfl, rfl⟩
  refine ⟨r, G, χ, ψ, A₀, A₁, F, S₀, S₁, hr, hrε, hGS, hGT, hχ, hψ, htargets, hχG, hψG,
    hχ0, hψ0, hχh, hψh, hA₀, hA₁, hSc₀, hSc₁, hSs₀, hSs₁, htargets.mono hSs₀ hSs₁, hfix, ?_, ?_,
    D.nativeFootCollarEquations_of_agrees_on_target b₀ marks₀ χ hr hχ hagree.1 heq₀,
    D.nativeFootCollarEquations_of_agrees_on_target b₁ marks₁ ψ hr hψ hagree.2 heq₁⟩
  · intro y
    change f (F₁ (F₀ y)) = f y ∧ f (F₀.symm (F₁.symm y)) = f y
    exact ⟨(hheight₁ (F₀ y)).1.trans (hheight₀ y).1,
      (hheight₀ (F₁.symm y)).2.trans (hheight₁ y).2⟩
  · intro y hy
    have hlow (b : CellBoundary 1)
        (φ : PartialDiffeomorph (ThreeModel.prod 𝓘(ℝ, ℝ)) J (D.footComponent b × ℝ) M ∞)
        (hsource : φ.source = {q | q.2 ∈ Ioo (-r) r})
        (hheight : ∀ q ∈ φ.source, f (φ q) = c + q.2)
        (hmem : y ∈ φ.target) : f y < f p := by
      have hq : φ.symm y ∈ φ.source := φ.map_target hmem
      have ht : (φ.symm y).2 ∈ Ioo (-r) r := by simpa only [hsource, mem_ofPred_eq] using hq
      calc
        f y = f (φ (φ.symm y)) := congrArg f (φ.apply_symm_apply hmem).symm
        _ = c + (φ.symm y).2 := hheight _ hq
        _ < f p := by linarith [ht.2, D.ε_pos]
    apply hfix y
    rintro (hy₀ | hy₁)
    · exact (not_lt_of_ge hy) (hlow b₀ χ hχ hχh (hSs₀ hy₀))
    · exact (not_lt_of_ge hy) (hlow b₁ ψ hψ hψh (hSs₁ hy₁))

/-- An ambient map that fixes the region above the critical height fixes both
sides of the actual outgoing height collar after shrinking its width. -/
theorem exists_fixedOutgoingSignedHeightCollar (F : M ≃ₘ^∞⟮J,J⟯ M)
    (hfix : ∀ y, f p ≤ f y → F y = y ∧ F.symm y = y) :
    let c' := f p + D.ε
    letI := manifoldLevelSetChartedSpace J f c' hf D.upper_regular
    ∃ ρ > (0 : ℝ), ∃ χ : PartialDiffeomorph (ModelWithCorners.prod K 𝓘(ℝ, ℝ)) J
        (LevelSetSpace f c' × ℝ) M ∞,
      χ.source = {q | q.2 ∈ Ioo (-ρ) ρ} ∧ χ.target = f ⁻¹' Ioo (c' - ρ) (c' + ρ) ∧
      (∀ x : LevelSetSpace f c', χ (x, 0) = x.val) ∧
      (∀ q ∈ χ.source, f (χ q) = c' + q.2) ∧
      let δ := min ρ (D.ε / 2)
      0 < δ ∧ ∀ (x : LevelSetSpace f c') t, t ∈ Ioo (-δ) δ →
        F (χ (x, t)) = χ (x, t) ∧ F.symm (χ (x, t)) = χ (x, t) := by
  let c' := f p + D.ε
  let := manifoldLevelSetChartedSpace J f c' hf D.upper_regular
  obtain ⟨ρ, hρ, χ, hχ, htarget, hzero, hheight, -⟩ := D.exists_outgoingSignedHeightCollar
  let δ := min ρ (D.ε / 2)
  refine ⟨ρ, hρ, χ, hχ, htarget, hzero, hheight, lt_min hρ (half_pos D.ε_pos), ?_⟩
  intro x t ht
  have hδρ : δ ≤ ρ := min_le_left _ _
  have hδε : δ ≤ D.ε / 2 := min_le_right _ _
  have hs : (x, t) ∈ χ.source := by
    rw [hχ]
    exact ⟨(neg_le_neg hδρ).trans_lt ht.1, ht.2.trans_le hδρ⟩
  apply hfix
  rw [hheight _ hs]
  change f p ≤ f p + D.ε + t
  linarith [ht.1, D.ε_pos]

end IsolatedOneHandle
end
end SmoothPoincare
