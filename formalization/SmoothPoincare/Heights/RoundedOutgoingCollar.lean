import SmoothPoincare.Heights.RoundedEdgeBlock

/-! # Pull the actual outgoing signed collar back across both rounded rims -/

open DifferentialGeometry.Topology DifferentialGeometry.Topology.Morse Set
open DifferentialGeometry.Topology.Morse.CellAttachment
open DifferentialGeometry.Topology.Morse.ManifoldCellAttachment
open scoped ContDiff Manifold Topology

namespace SmoothPoincare.IsolatedOneHandle

noncomputable section

local notation "hk₁" => (show (1 : ℕ) ≤ 4 by decide)

variable {H M : Type} [TopologicalSpace H] [TopologicalSpace M] [ChartedSpace H M]
  {J : ModelWithCorners ℝ (MorseModel 4) H} [J.Boundaryless] [IsManifold J ∞ M]
  {f : M → ℝ} {hf : ContMDiff J 𝓘(ℝ, ℝ) ∞ f} {p : M} {lo hi : ℝ}
  (D : IsolatedOneHandle hf p lo hi)

local notation "L" => LevelSetSpace f (f p + D.ε)
local notation "K" => ModelWithCorners.prod 𝓘(ℝ, MorseModel 3) 𝓘(ℝ, ℝ)
local notation "A" => CellBoundary 1 × CellBoundary 3

/-- The full marked outgoing rim obtained from one native attaching label
and its transverse unit-sphere parameter. -/
def roundedRimOutgoingPoint (δ R₀ R₁ : ℝ)
    (hR₀ : Real.sqrt (2 * D.ε + 2 * D.r ^ 2) ≤ R₀) (h₀₁ : R₀ < R₁)
    (q : A) : L :=
  ⟨D.roundedRimToOutgoing δ (D.edgeBlockChart (q.1.val, q.2.val)),
    (D.roundedRimToOutgoing_nativeRim δ R₀ R₁ hR₀ h₀₁ q.1 q.2).2.1⟩

private theorem nativeRimModel_norm_upper (q : A) :
    morseNorm 4 (D.edgeBlockModel (q.1.val, q.2.val)) ≤
      Real.sqrt (2 * D.ε + 2 * D.r ^ 2) := by
  let z : ClosedCell 3 := ⟨q.2.val, q.2.property.le⟩
  have he : D.edgeBlockModel (q.1.val, q.2.val) = cocoreModelPoint hk₁ D.ε D.r (q.1, z) := by
    simp only [edgeBlockModel, cocoreModelPoint, negPart_cellMap_smul, z]
  rw [he]
  exact cocoreModelPoint_norm_le hk₁ D.ε D.r D.ε_pos.le _

set_option maxHeartbeats 600000 in
/-- The actual outgoing product chart pulls back to a signed collar of the
rounded source around both native rims on one common open strip. -/
theorem exists_roundedOutgoingCollar_nearNativeRims [T2Space M] [CompactSpace M]
    (δ R₀ R₁ : ℝ) (hR₀ : Real.sqrt (2 * D.ε + 2 * D.r ^ 2) < R₀) (h₀₁ : R₀ < R₁) :
    let c := f p + D.ε
    letI := manifoldLevelSetChartedSpace J f c hf D.upper_regular
    let T := D.roundedRimToOutgoing δ
    let rounded := morseRoundedFunction hk₁ (f p) D.ε D.r δ R₀ R₁ D.chart
    let β := D.roundedRimOutgoingPoint δ R₀ R₁ hR₀.le h₀₁
    ∃ (ρ : ℝ) (Φ Ψ : PartialDiffeomorph K J (L × ℝ) M ∞) (U : Set L) (w : ℝ),
      0 < w ∧ w ≤ ρ ∧ w ≤ D.ε / 2 ∧ IsOpen U ∧ range β ⊆ U ∧
      Φ.source = {q | q.2 ∈ Ioo (-ρ) ρ} ∧ Φ.target = f ⁻¹' Ioo (c - ρ) (c + ρ) ∧
      (∀ x : L, Φ (x, 0) = x.val) ∧
      (∀ q ∈ Φ.source, f (Φ q) = c + q.2) ∧
      (∀ y ∈ Φ.target, (Φ.symm y).2 = f y - c) ∧
      Ψ.source = U ×ˢ Ioo (-w) w ∧
      (∀ q ∈ Ψ.source, Ψ q = T.symm (Φ q) ∧ T (Ψ q) = Φ q ∧ rounded (Ψ q) = f p + q.2) ∧
      (∀ x ∈ Ψ.target, x ∈ T.source ∧ Ψ.symm x = Φ.symm (T x) ∧
        (Ψ.symm x).2 = rounded x - f p) ∧
      (∀ q : A, (β q, 0) ∈ Ψ.source ∧
        Ψ (β q, 0) = D.edgeBlockChart (q.1.val, q.2.val) ∧
        Ψ.symm (D.edgeBlockChart (q.1.val, q.2.val)) = (β q, 0)) := by
  let c := f p + D.ε
  let := manifoldLevelSetChartedSpace J f c hf D.upper_regular
  let T := D.roundedRimToOutgoing δ
  let rounded := morseRoundedFunction hk₁ (f p) D.ε D.r δ R₀ R₁ D.chart
  let β := D.roundedRimOutgoingPoint δ R₀ R₁ hR₀.le h₀₁
  let rim : A → M := fun q => D.edgeBlockChart (q.1.val, q.2.val)
  let B := D.doubleBallChart
  let C : Set M := B '' (B.source ∩ {y | morseNorm 4 y < R₀})
  have hC : IsOpen C := B.toOpenPartialHomeomorph.isOpen_image_of_subset_source
    (B.open_source.inter (isOpen_morseNorm_lt _)) inter_subset_left
  have hcore {x : M} (hx : x ∈ C) : morseNorm 4 (D.chart.χ.symm x) < R₀ := by
    rcases hx with ⟨y, ⟨hsrc, hy⟩, hxy⟩
    have hys : y ∈ D.chart.χ.source := by
      rw [D.doubleBallChart_source] at hsrc
      exact D.double_ball_subset_source y (le_of_lt hsrc)
    change D.chart.χ y = x at hxy
    rw [← hxy, D.chart.χ.left_inv hys]
    exact hy
  let T' := DifferentialGeometry.Topology.PartialDiffeomorph.restrict T C hC
  have hrim (q : A) : rim q ∈ T'.source := by
    have h := D.roundedRimToOutgoing_nativeRim δ R₀ R₁ hR₀.le h₀₁ q.1 q.2
    refine ⟨h.1, ?_⟩
    let y := D.edgeBlockModel (q.1.val, q.2.val)
    have hy := D.nativeRimModel_norm_upper q
    refine ⟨y, ⟨?_, hy.trans_lt hR₀⟩, rfl⟩
    rw [D.doubleBallChart_source]
    exact (hy.trans D.attaching_radius).trans_lt (by linarith [D.chart.radius_pos])
  have hrimC : Continuous rim := by
    apply D.edgeBlockChart.contMDiffOn.continuousOn.comp_continuous
    · exact continuous_subtype_val.comp continuous_fst |>.prodMk
        (continuous_subtype_val.comp continuous_snd)
    · intro q
      rw [D.edgeBlockChart_source]
      exact ((D.nativeRimModel_norm_upper q).trans D.attaching_radius).trans_lt
        (by linarith [D.chart.radius_pos])
  have hβ : Continuous β := by
    exact (T.contMDiffOn.continuousOn.comp_continuous hrimC
      (fun q => (hrim q).1)).subtype_mk _
  obtain ⟨ρ, hρ, Φ, hΦs, hΦt, hΦ0, hΦh, hΦi⟩ := D.exists_outgoingSignedHeightCollar
  let E := Φ.trans T'.symm
  have hzero : range β ×ˢ ({0} : Set ℝ) ⊆ E.source := by
    rintro ⟨x, t⟩ ⟨⟨q, rfl⟩, ht⟩
    have ht0 : t = 0 := ht
    subst t
    change (β q, 0) ∈ Φ.source ∧ Φ (β q, 0) ∈ T'.target
    refine ⟨by rw [hΦs]; exact ⟨by linarith, hρ⟩, ?_⟩
    rw [hΦ0]
    exact T'.map_source (hrim q)
  obtain ⟨U, V, hU, hV, hKU, h0V, hUV⟩ :=
    generalized_tube_lemma (isCompact_range hβ) isCompact_singleton E.open_source hzero
  obtain ⟨d, hd, hdV⟩ := Metric.isOpen_iff.mp hV 0 (h0V (by simp))
  let w := min d (min ρ (D.ε / 2))
  have hw : 0 < w := lt_min hd (lt_min hρ (half_pos D.ε_pos))
  have hwd : w ≤ d := min_le_left ..
  have hwρ : w ≤ ρ := (min_le_right ..).trans (min_le_left ..)
  have hwε : w ≤ D.ε / 2 := (min_le_right ..).trans (min_le_right ..)
  have hstrip : U ×ˢ Ioo (-w) w ⊆ E.source := by
    intro q hq
    apply hUV
    refine ⟨hq.1, hdV ?_⟩
    rw [Metric.mem_ball, Real.dist_eq, sub_zero, abs_lt]
    exact ⟨(neg_le_neg hwd).trans_lt hq.2.1, hq.2.2.trans_le hwd⟩
  let Ψ := DifferentialGeometry.Topology.PartialDiffeomorph.restrict E (U ×ˢ Ioo (-w) w)
    (hU.prod isOpen_Ioo)
  have hΨs : Ψ.source = U ×ˢ Ioo (-w) w := inter_eq_right.mpr hstrip
  have h₀ : 0 ≤ R₀ := (Real.sqrt_nonneg _).trans hR₀.le
  have hforward (q : L × ℝ) (hq : q ∈ Ψ.source) :
      Ψ q = T.symm (Φ q) ∧ T (Ψ q) = Φ q ∧ rounded (Ψ q) = f p + q.2 ∧ Ψ q ∈ T.source := by
    have he : q ∈ E.source := hq.1
    have hx : Ψ q ∈ T'.source := T'.map_target he.2
    have hr : T (Ψ q) = Φ q := T'.right_inv he.2
    have hheight := (D.edgeBlockChart_signedOutgoing δ R₀ R₁ h₀ h₀₁ hx.1 (hcore hx.2).le).1
    change f (T (Ψ q)) - (f p + D.ε) = rounded (Ψ q) - f p at hheight
    rw [hr, hΦh q he.1] at hheight
    exact ⟨rfl, hr, by linarith, hx.1⟩
  refine ⟨ρ, Φ, Ψ, U, w, hw, hwρ, hwε, hU, hKU, hΦs, hΦt, hΦ0, hΦh, hΦi, hΨs, ?_, ?_, ?_⟩
  · intro q hq
    exact ⟨(hforward q hq).1, (hforward q hq).2.1, (hforward q hq).2.2.1⟩
  · intro x hx
    have he : Ψ.symm x ∈ Ψ.source := Ψ.map_target hx
    have hi := Ψ.right_inv hx
    have h := hforward (Ψ.symm x) he
    refine ⟨hi ▸ h.2.2.2, rfl, ?_⟩
    have heq : rounded x = f p + (Ψ.symm x).2 := calc
      rounded x = rounded (Ψ (Ψ.symm x)) := congrArg rounded hi.symm
      _ = _ := h.2.2.1
    linarith
  · intro q
    have hsource : (β q, 0) ∈ Ψ.source := by
      rw [hΨs]
      exact ⟨hKU (mem_range_self q), by constructor <;> linarith⟩
    have h : Ψ (β q, 0) = rim q := by
      change T.symm (Φ (β q, 0)) = rim q
      rw [hΦ0]
      exact T.left_inv (hrim q).1
    refine ⟨hsource, h, ?_⟩
    calc
      Ψ.symm (rim q) = Ψ.symm (Ψ (β q, 0)) := congrArg Ψ.symm h.symm
      _ = (β q, 0) := Ψ.left_inv hsource

end

end SmoothPoincare.IsolatedOneHandle
