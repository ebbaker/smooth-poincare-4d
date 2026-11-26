import SmoothPoincare.Heights.RoundedOutgoingCollar
import DifferentialGeometry.Topology.Manifold.PartialDiffeomorph

/-! # The four-dimensional transport of the selected outgoing marking -/

open DifferentialGeometry.Topology DifferentialGeometry.Topology.Morse Set
open DifferentialGeometry.Topology.Morse.CellAttachment
open DifferentialGeometry.Topology.Morse.ManifoldCellAttachment
open scoped ContDiff Manifold Topology

namespace SmoothPoincare.IsolatedOneHandle

noncomputable section

variable {H M : Type} [TopologicalSpace H] [TopologicalSpace M] [ChartedSpace H M]
  {J : ModelWithCorners ℝ (MorseModel 4) H} [J.Boundaryless] [IsManifold J ∞ M]
  [T2Space M] [CompactSpace M]
  {f : M → ℝ} {hf : ContMDiff J 𝓘(ℝ, ℝ) ∞ f} {p : M} {lo hi : ℝ}
  (D : IsolatedOneHandle hf p lo hi)

local notation "c" => f p + D.ε
local notation "K" => 𝓘(ℝ, MorseModel 3)
local notation "PMod" => ModelWithCorners.prod K 𝓘(ℝ, ℝ)
local notation "L₀" => LevelSetSpace f c
local notation "L₁" => LevelSetSpace f hi
local notation "band(" b "," r ")" => f ⁻¹' Ioo (b - r) (b + r)
local notation "strip(" r ")" => Ioo (-r) r

omit [T2Space M] [CompactSpace M] in
include D in
/-- The next filtration cut is regular by the actual isolation hypothesis. -/
theorem outgoingNextCut_regular
    (hunique : ∀ x, f x ∈ Icc lo hi → IsCriticalPointAt J f x → x = p) :
    ∀ x, f x = hi → ¬ IsCriticalPointAt J f x :=
  fun x hx => D.outgoingBand_regular hunique x (hx.symm ▸ ⟨D.upper_inside.le, le_rfl⟩)

/-- Extend the regular marking using a specified native signed collar at the
outgoing cut. The same input chart is used in the forward and inverse formulas
on the common strip, whose width is at most the width of the input collar. -/
theorem exists_outgoingSignedBandTransport_fromCollar
    (hunique : ∀ x, f x ∈ Icc lo hi → IsCriticalPointAt J f x → x = p) :
    letI := manifoldLevelSetChartedSpace J f c hf D.upper_regular
    letI := manifoldLevelSetChartedSpace J f hi hf (D.outgoingNextCut_regular hunique)
    ∀ (r₀ : ℝ) (A : PartialDiffeomorph PMod J (L₀ × ℝ) M ∞),
      0 < r₀ → A.source = {q | q.2 ∈ strip(r₀)} → A.target = band(c, r₀) →
      (∀ x : L₀, A (x, 0) = x.val) →
      (∀ q ∈ A.source, f (A q) = c + q.2) →
      (∀ y ∈ A.target, (A.symm y).2 = f y - c) →
    ∃ (r : ℝ) (Φ : M ≃ₘ^∞⟮J,J⟯ M) (d : L₀ ≃ₘ^∞⟮K,K⟯ L₁)
      (B : PartialDiffeomorph PMod J (L₁ × ℝ) M ∞)
      (T : PartialDiffeomorph J J M M ∞),
      0 < r ∧ r ≤ r₀ ∧ r ≤ D.ε / 2 ∧
      RegularEndMarked hf hf D.upper_regular (D.outgoingNextCut_regular hunique) Φ ∧
      (∀ x, (d x).val = Φ x.val) ∧ (∀ y, (d.symm y).val = Φ.symm y.val) ∧
      T.source = band(c, r) ∧ T.target = band(hi, r) ∧
      {q | q.2 ∈ strip(r)} ⊆ A.source ∧ {q | q.2 ∈ strip(r)} ⊆ B.source ∧
      (∀ x, A (x, 0) = x.val ∧ T x.val = Φ x.val) ∧
      (∀ y, B (y, 0) = y.val ∧ T.symm y.val = Φ.symm y.val) ∧
      (∀ q : L₀ × ℝ, q.2 ∈ strip(r) → f (A q) = c + q.2) ∧
      (∀ q : L₁ × ℝ, q.2 ∈ strip(r) → f (B q) = hi + q.2) ∧
      (∀ x t, t ∈ strip(r) → T (A (x,t)) = B (d x,t)) ∧
      (∀ y t, t ∈ strip(r) → T.symm (B (y,t)) = A (d.symm y,t)) ∧
      (∀ x ∈ T.source, f (T x) - hi = f x - c ∧ -f (T x) - (-hi) = -f x - (-c)) ∧
      (∀ y ∈ T.target, f (T.symm y) - c = f y - hi ∧ -f (T.symm y) - (-c) = -f y - (-hi)) := by
  let _ := manifoldLevelSetChartedSpace J f c hf D.upper_regular
  let _ := manifoldLevelSetChartedSpace J f hi hf (D.outgoingNextCut_regular hunique)
  intro r₀ A hr₀ hAS hAT hA0 hAh hAi
  obtain ⟨Φ, hΦ⟩ := D.exists_outgoingMarkedComparison hunique
  have HM : RegularEndMarked hf hf D.upper_regular (D.outgoingNextCut_regular hunique) Φ := hΦ
  obtain ⟨_, d, _, _, hd, hdi, _, _, _, _⟩ := hΦ
  obtain ⟨r₁, hr₁, B, hBS, hBT, hB0, hBh, hBi⟩ :=
    exists_nativeSignedHeightCollar hf (D.outgoingNextCut_regular hunique) (d D.outgoingAxisPoint)
  -- Both chart widths are available before taking a common guarded width.
  let r := min (min r₀ r₁) (D.ε / 2)
  have hr : 0 < r := lt_min (lt_min hr₀ hr₁) (half_pos D.ε_pos)
  have hr0 : r ≤ r₀ := (min_le_left _ _).trans (min_le_left _ _)
  have hr1 : r ≤ r₁ := (min_le_left _ _).trans (min_le_right _ _)
  have hs0 : strip(r) ⊆ strip(r₀) := Ioo_subset_Ioo (neg_le_neg hr0) hr0
  have hs1 : strip(r) ⊆ strip(r₁) := Ioo_subset_Ioo (neg_le_neg hr1) hr1
  let P := d.prodCongr (Diffeomorph.refl 𝓘(ℝ, ℝ) ℝ ∞)
  let G := (A.symm.trans P.toPartialDiffeomorph).trans B
  have hGS (x : M) : x ∈ G.source ↔ x ∈ A.target ∧ (A.symm x).2 ∈ strip(r₁) := by
    change ((x ∈ A.target ∧ A.symm x ∈ univ) ∧ P (A.symm x) ∈ B.source) ↔ _
    rw [hBS]
    simp [P]
  have hGT (y : M) : y ∈ G.target ↔ y ∈ B.target ∧ (B.symm y).2 ∈ strip(r₀) := by
    change (y ∈ B.target ∧ B.symm y ∈ univ ∧ P.symm (B.symm y) ∈ A.source) ↔ _
    rw [hAS]
    simp [P, Diffeomorph.prodCongr_symm]
  have hGh (x : M) (hx : x ∈ G.source) : f (G x) = hi + (f x - c) := by
    have hx' := (hGS x).1 hx
    have hs : P (A.symm x) ∈ B.source := by rw [hBS]; exact hx'.2
    change f (B (P (A.symm x))) = _
    rw [hBh _ hs]
    exact congrArg (hi + ·) (hAi x hx'.1)
  have hGi (y : M) (hy : y ∈ G.target) : f (G.symm y) = c + (f y - hi) := by
    have hy' := (hGT y).1 hy
    have hs : P.symm (B.symm y) ∈ A.source := by rw [hAS]; exact hy'.2
    change f (A (P.symm (B.symm y))) = _
    rw [hAh _ hs]
    exact congrArg (c + ·) (hBi y hy'.1)
  let T := DifferentialGeometry.Topology.PartialDiffeomorph.restrict G (band(c, r))
    (isOpen_Ioo.preimage hf.continuous)
  have hTS : T.source = band(c, r) := by
    ext x
    change (x ∈ G.source ∧ x ∈ band(c, r)) ↔ x ∈ band(c, r)
    refine ⟨And.right, fun hx => ⟨(hGS x).2 ?_, hx⟩⟩
    have hmem : x ∈ A.target := by
      rw [hAT]
      exact Ioo_subset_Ioo (by linarith) (by linarith) hx
    refine ⟨hmem, ?_⟩
    rw [hAi x hmem]
    exact hs1 ⟨by linarith [hx.1], by linarith [hx.2]⟩
  have hTT : T.target = band(hi, r) := by
    ext y
    change (y ∈ G.target ∧ G.symm y ∈ band(c, r)) ↔ y ∈ band(hi, r)
    constructor
    · rintro ⟨hy, hs⟩
      change f (G.symm y) ∈ Ioo (c - r) (c + r) at hs
      rw [hGi y hy] at hs
      exact ⟨by linarith [hs.1], by linarith [hs.2]⟩
    · intro hy
      have hb : y ∈ B.target := by
        rw [hBT]
        exact Ioo_subset_Ioo (by linarith) (by linarith) hy
      have hg : y ∈ G.target := (hGT y).2 ⟨hb, by
        rw [hBi y hb]
        exact hs0 ⟨by linarith [hy.1], by linarith [hy.2]⟩⟩
      refine ⟨hg, ?_⟩
      change f (G.symm y) ∈ Ioo (c - r) (c + r)
      rw [hGi y hg]
      exact ⟨by linarith [hy.1], by linarith [hy.2]⟩
  have hfwd (x : L₀) (t : ℝ) (ht : t ∈ strip(r)) : T (A (x,t)) = B (d x,t) := by
    have ha : (x,t) ∈ A.source := hAS.symm ▸ hs0 ht
    change B (P (A.symm (A (x,t)))) = _
    exact congrArg (fun q => B (P q)) (A.toPartialEquiv.left_inv ha)
  have hbwd (y : L₁) (t : ℝ) (ht : t ∈ strip(r)) : T.symm (B (y,t)) = A (d.symm y,t) := by
    have hb : (y,t) ∈ B.source := hBS.symm ▸ hs1 ht
    change A (P.symm (B.symm (B (y,t)))) = _
    exact congrArg (fun q => A (P.symm q)) (B.toPartialEquiv.left_inv hb)
  have hz : (0 : ℝ) ∈ strip(r) := ⟨neg_lt_zero.mpr hr, hr⟩
  refine ⟨r, Φ, d, B, T, hr, hr0, min_le_right _ _, HM, hd, hdi, hTS, hTT, ?_, ?_,
    ?_, ?_, ?_, ?_, hfwd, hbwd, ?_, ?_⟩
  · rw [hAS]
    exact fun _ hq => hs0 hq
  · rw [hBS]
    exact fun _ hq => hs1 hq
  · intro x
    refine ⟨hA0 x, ?_⟩
    simpa only [hA0, hB0, hd] using hfwd x 0 hz
  · intro y
    refine ⟨hB0 y, ?_⟩
    simpa only [hA0, hB0, hdi] using hbwd y 0 hz
  · intro q hq
    exact hAh q (by rw [hAS]; exact hs0 hq)
  · intro q hq
    exact hBh q (by rw [hBS]; exact hs1 hq)
  · intro x hx
    have hx' : x ∈ G.source := hx.1
    change f (G x) - hi = f x - c ∧ -f (G x) - (-hi) = -f x - (-c)
    rw [hGh x hx']
    constructor <;> ring
  · intro y hy
    have hy' : y ∈ G.target := hy.1
    change f (G.symm y) - c = f y - hi ∧ -f (G.symm y) - (-c) = -f y - (-hi)
    rw [hGi y hy']
    constructor <;> ring

/-- The regular end comparison extends across both full open bands by keeping
    the signed normal coordinate. Both zero sections restrict to the original
    ambient comparison. The bound on the common radius keeps both bands
    strictly above the handle's critical level. -/
theorem exists_outgoingSignedBandTransport
    (hunique : ∀ x, f x ∈ Icc lo hi → IsCriticalPointAt J f x → x = p) :
    letI := manifoldLevelSetChartedSpace J f c hf D.upper_regular
    letI := manifoldLevelSetChartedSpace J f hi hf (D.outgoingNextCut_regular hunique)
    ∃ (r : ℝ) (Φ : M ≃ₘ^∞⟮J,J⟯ M) (d : L₀ ≃ₘ^∞⟮K,K⟯ L₁)
      (A : PartialDiffeomorph PMod J (L₀ × ℝ) M ∞)
      (B : PartialDiffeomorph PMod J (L₁ × ℝ) M ∞)
      (T : PartialDiffeomorph J J M M ∞),
      0 < r ∧ r ≤ D.ε / 2 ∧
      RegularEndMarked hf hf D.upper_regular (D.outgoingNextCut_regular hunique) Φ ∧
      (∀ x, (d x).val = Φ x.val) ∧ (∀ y, (d.symm y).val = Φ.symm y.val) ∧
      T.source = band(c, r) ∧ T.target = band(hi, r) ∧
      {q | q.2 ∈ strip(r)} ⊆ A.source ∧ {q | q.2 ∈ strip(r)} ⊆ B.source ∧
      (∀ x, A (x, 0) = x.val ∧ T x.val = Φ x.val) ∧
      (∀ y, B (y, 0) = y.val ∧ T.symm y.val = Φ.symm y.val) ∧
      (∀ q : L₀ × ℝ, q.2 ∈ strip(r) → f (A q) = c + q.2) ∧
      (∀ q : L₁ × ℝ, q.2 ∈ strip(r) → f (B q) = hi + q.2) ∧
      (∀ x t, t ∈ strip(r) → T (A (x,t)) = B (d x,t)) ∧
      (∀ y t, t ∈ strip(r) → T.symm (B (y,t)) = A (d.symm y,t)) ∧
      (∀ x ∈ T.source, f (T x) - hi = f x - c ∧ -f (T x) - (-hi) = -f x - (-c)) ∧
      (∀ y ∈ T.target, f (T.symm y) - c = f y - hi ∧ -f (T.symm y) - (-c) = -f y - (-hi)) := by
  let _ := manifoldLevelSetChartedSpace J f c hf D.upper_regular
  let _ := manifoldLevelSetChartedSpace J f hi hf (D.outgoingNextCut_regular hunique)
  obtain ⟨r₀, hr₀, A, hAS, hAT, hA0, hAh, hAi⟩ := D.exists_outgoingSignedHeightCollar
  obtain ⟨r, Φ, d, B, T, hr, _, htail⟩ :=
    D.exists_outgoingSignedBandTransport_fromCollar hunique r₀ A hr₀ hAS hAT hA0 hAh hAi
  exact ⟨r, Φ, d, A, B, T, hr, htail⟩

set_option maxHeartbeats 600000 in
/-- Use the actual outgoing collar from the rounded-rim comparison as the
input collar of the next-cut transport. The two ambient maps then compose on
one common strip, including every parameter of both marked native rims. -/
theorem exists_roundedRimTransport_toNextCut
    (hunique : ∀ x, f x ∈ Icc lo hi → IsCriticalPointAt J f x → x = p)
    (δ R₀ R₁ : ℝ) (hR₀ : Real.sqrt (2 * D.ε + 2 * D.r ^ 2) < R₀) (h₀₁ : R₀ < R₁) :
    letI := manifoldLevelSetChartedSpace J f c hf D.upper_regular
    letI := manifoldLevelSetChartedSpace J f hi hf (D.outgoingNextCut_regular hunique)
    let R := D.roundedRimToOutgoing δ
    let g := morseRoundedFunction (show (1 : ℕ) ≤ 4 by decide) (f p) D.ε D.r δ R₀ R₁ D.chart
    let β := D.roundedRimOutgoingPoint δ R₀ R₁ hR₀.le h₀₁
    ∃ (ρ w r : ℝ) (A Ψ : PartialDiffeomorph PMod J (L₀ × ℝ) M ∞) (U : Set L₀)
      (Φ : M ≃ₘ^∞⟮J,J⟯ M) (d : L₀ ≃ₘ^∞⟮K,K⟯ L₁)
      (B : PartialDiffeomorph PMod J (L₁ × ℝ) M ∞) (T : PartialDiffeomorph J J M M ∞),
      0 < w ∧ w ≤ ρ ∧ 0 < r ∧ r ≤ ρ ∧ 0 < min w r ∧ min w r ≤ D.ε / 2 ∧
      IsOpen U ∧ range β ⊆ U ∧
      A.source = {q | q.2 ∈ strip(ρ)} ∧ A.target = band(c, ρ) ∧
      Ψ.source = U ×ˢ strip(w) ∧ T.source = band(c, r) ∧ T.target = band(hi, r) ∧
      RegularEndMarked hf hf D.upper_regular (D.outgoingNextCut_regular hunique) Φ ∧
      (∀ x, (d x).val = Φ x.val) ∧ (∀ y, (d.symm y).val = Φ.symm y.val) ∧
      (∀ x t, t ∈ strip(r) → T (A (x,t)) = B (d x,t)) ∧
      (∀ y t, t ∈ strip(r) → T.symm (B (y,t)) = A (d.symm y,t)) ∧
      (∀ q ∈ U ×ˢ strip(min w r),
        let y := Ψ q
        let z := B (d q.1,q.2)
        q ∈ Ψ.source ∧ q ∈ A.source ∧ (d q.1,q.2) ∈ B.source ∧
        y ∈ R.source ∧ R y ∈ T.source ∧ z ∈ T.target ∧
        R y = A q ∧ T (R y) = z ∧ T.symm z = A q ∧ R.symm (T.symm z) = y ∧
        Ψ.symm (R.symm (T.symm z)) = q ∧
        g y = f p + q.2 ∧ f z = hi + q.2) ∧
      (∀ a : CellBoundary 1 × CellBoundary 3,
        let x := D.edgeBlockChart (a.1.val,a.2.val)
        let q := (β a,(0 : ℝ))
        q ∈ U ×ˢ strip(min w r) ∧ Ψ q = x ∧ Ψ.symm x = q ∧
        T (R x) = (d (β a)).val ∧ R.symm (T.symm (d (β a)).val) = x) := by
  let _ := manifoldLevelSetChartedSpace J f c hf D.upper_regular
  let _ := manifoldLevelSetChartedSpace J f hi hf (D.outgoingNextCut_regular hunique)
  let R := D.roundedRimToOutgoing δ
  let β := D.roundedRimOutgoingPoint δ R₀ R₁ hR₀.le h₀₁
  obtain ⟨ρ, A, Ψ, U, w, hw, hwρ, hwε, hU, hβ, hAS, hAT, hA0, hAh, hAi,
    hΨS, hΨf, hΨi, hcen⟩ := D.exists_roundedOutgoingCollar_nearNativeRims δ R₀ R₁ hR₀ h₀₁
  obtain ⟨r, Φ, d, B, T, hr, hrρ, _, hmarked, hd, hdi, hTS, hTT, hAs, hBs, _, hB0,
    _, hBh, hTf, hTi, _, _⟩ :=
    D.exists_outgoingSignedBandTransport_fromCollar hunique ρ A (hw.trans_le hwρ) hAS hAT hA0 hAh hAi
  let s := min w r
  have hs : 0 < s := lt_min hw hr
  have hsw : strip(s) ⊆ strip(w) := Ioo_subset_Ioo (neg_le_neg (min_le_left w r)) (min_le_left w r)
  have hsr : strip(s) ⊆ strip(r) := Ioo_subset_Ioo (neg_le_neg (min_le_right w r)) (min_le_right w r)
  have hTback (x : L₀) t (ht : t ∈ strip(r)) : T.symm (B (d x,t)) = A (x,t) := by
    simpa only [Diffeomorph.symm_apply_apply] using hTi (d x) t ht
  refine ⟨ρ, w, r, A, Ψ, U, Φ, d, B, T, hw, hwρ, hr, hrρ, hs, (min_le_left w r).trans hwε,
    hU, hβ, hAS, hAT, hΨS, hTS, hTT, hmarked, hd, hdi, hTf, hTi, ?_, ?_⟩
  · intro q hq
    have htr := hsr hq.2
    have hΨq : q ∈ Ψ.source := hΨS.symm ▸ ⟨hq.1, hsw hq.2⟩
    have hAq : q ∈ A.source := hAs htr
    obtain ⟨hpre, hRA, hheight⟩ := hΨf q hΨq
    have hRdom : Ψ q ∈ R.source := (hΨi _ (Ψ.map_source hΨq)).1
    have hTx : R (Ψ q) ∈ T.source := by
      rw [hTS, mem_preimage]
      rw [hRA, hAh q hAq]
      exact ⟨by linarith [htr.1], by linarith [htr.2]⟩
    have hTz : T (R (Ψ q)) = B (d q.1,q.2) := (congrArg T hRA).trans (hTf q.1 q.2 htr)
    have hback := hTback q.1 q.2 htr
    have hRback : R.symm (T.symm (B (d q.1,q.2))) = Ψ q :=
      (congrArg R.symm hback).trans hpre.symm
    exact ⟨hΨq, hAq, hBs htr, hRdom, hTx, hTz ▸ T.map_source hTx, hRA, hTz, hback, hRback,
      (congrArg Ψ.symm hRback).trans (Ψ.left_inv hΨq), hheight, hBh _ htr⟩
  · intro a
    have hz : (0 : ℝ) ∈ strip(s) := ⟨neg_lt_zero.mpr hs, hs⟩
    obtain ⟨hq, hΨx, hΨix⟩ := hcen a
    obtain ⟨hpre, hRA, _⟩ := hΨf (β a,0) hq
    have hRax := (congrArg R hΨx.symm).trans hRA
    have hRsa := hpre.symm.trans hΨx
    have hzB := (hB0 (d (β a))).1
    exact ⟨⟨hβ (mem_range_self a), hz⟩, hΨx, hΨix,
      (congrArg T hRax).trans ((hTf (β a) 0 (hsr hz)).trans hzB),
      (congrArg (fun y => R.symm (T.symm y)) hzB.symm).trans
        ((congrArg R.symm (hTback (β a) 0 (hsr hz))).trans hRsa)⟩

end
end SmoothPoincare.IsolatedOneHandle
