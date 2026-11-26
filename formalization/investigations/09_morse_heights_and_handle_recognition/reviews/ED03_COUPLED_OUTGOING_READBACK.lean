import SmoothPoincare

/-! # Independent readback of the coupled outgoing strip

26 November 2026 (UTC). Prepared for Edward B. Baker III with OpenAI Codex
assistance. This replay was written by the independent validator of HT-E07g
after the implementation was handed back. Serving model and effort were
unavailable. The common Edition 03 intake was a7bb158d6af806d2573a7702386622ed4c0bb1f1.
[Coupled transport implementation](../../../SmoothPoincare/Heights/OutgoingEdgeTransport.lean).
-/

open DifferentialGeometry.Topology DifferentialGeometry.Topology.Morse Set SmoothPoincare
open DifferentialGeometry.Topology.Morse.ManifoldCellAttachment
open scoped ContDiff Manifold

local notation "K" => 𝓘(ℝ, MorseModel 3)
local notation "PMod" => ModelWithCorners.prod K 𝓘(ℝ, ℝ)

variable {H M : Type} [TopologicalSpace H] [TopologicalSpace M] [ChartedSpace H M]
  {J : ModelWithCorners ℝ (MorseModel 4) H} [J.Boundaryless] [IsManifold J ∞ M]
  [T2Space M] [CompactSpace M]
  {f : M → ℝ} {hf : ContMDiff J 𝓘(ℝ, ℝ) ∞ f} {p : M} {lo hi : ℝ}
  (D : IsolatedOneHandle hf p lo hi)

local notation "c" => f p + D.ε
local notation "L₀" => LevelSetSpace f c
local notation "L₁" => LevelSetSpace f hi

/-- A reader can provide its actual source collar and retain the entire parameter
of an independently supplied tube in the next-cut chart and its inverse. -/
example {Z : Type*} (u : Z → L₀)
    (hunique : ∀ x, f x ∈ Icc lo hi → IsCriticalPointAt J f x → x = p) :
    letI := manifoldLevelSetChartedSpace J f c hf D.upper_regular
    letI := manifoldLevelSetChartedSpace J f hi hf (D.outgoingNextCut_regular hunique)
    ∀ (r₀ : ℝ) (A : PartialDiffeomorph PMod J (L₀ × ℝ) M ∞),
      0 < r₀ → A.source = {q | q.2 ∈ Ioo (-r₀) r₀} →
      A.target = f ⁻¹' Ioo (c - r₀) (c + r₀) →
      (∀ x : L₀, A (x, 0) = x.val) →
      (∀ q ∈ A.source, f (A q) = c + q.2) →
      (∀ y ∈ A.target, (A.symm y).2 = f y - c) →
    ∃ (r : ℝ) (d : L₀ ≃ₘ^∞⟮K,K⟯ L₁)
      (B : PartialDiffeomorph PMod J (L₁ × ℝ) M ∞)
      (T : PartialDiffeomorph J J M M ∞),
      0 < r ∧ r ≤ r₀ ∧ r ≤ D.ε / 2 ∧
      ∀ z t, t ∈ Ioo (-r) r →
        T (A (u z,t)) = B (d (u z),t) ∧ T.symm (B (d (u z),t)) = A (u z,t) ∧
        f (B (d (u z),t)) - hi = t := by
  let _ := manifoldLevelSetChartedSpace J f c hf D.upper_regular
  let _ := manifoldLevelSetChartedSpace J f hi hf (D.outgoingNextCut_regular hunique)
  intro r₀ A hr₀ hAS hAT hA₀ hAh hAi
  obtain ⟨r, Φ, d, B, T, hr, hrb, hrε, hReg, hd, hdi, hTs, hTt, hAs, hBs, hAz, hBz,
    hAhr, hBhr, hforward, hback, hdiff, hdiffi⟩ :=
    D.exists_outgoingSignedBandTransport_fromCollar hunique r₀ A hr₀ hAS hAT hA₀ hAh hAi
  refine ⟨r, d, B, T, hr, hrb, hrε, ?_⟩
  intro z t ht
  have h := hBhr (d (u z),t) ht
  exact ⟨hforward (u z) t ht, by simpa only [d.symm_apply_apply] using hback (d (u z)) t ht, by linarith⟩

#print axioms SmoothPoincare.IsolatedOneHandle.exists_outgoingSignedBandTransport_fromCollar

/-- Every transverse point on both native rims retains its label and signed
coordinate through the same rounded comparison and regular next-cut maps. -/
example (hunique : ∀ x, f x ∈ Icc lo hi → IsCriticalPointAt J f x → x = p)
    (δ R₀ R₁ : ℝ) (hR₀ : Real.sqrt (2 * D.ε + 2 * D.r ^ 2) < R₀) (h₀₁ : R₀ < R₁) :
    letI := manifoldLevelSetChartedSpace J f c hf D.upper_regular
    letI := manifoldLevelSetChartedSpace J f hi hf (D.outgoingNextCut_regular hunique)
    let R := D.roundedRimToOutgoing δ
    let g := morseRoundedFunction (show (1 : ℕ) ≤ 4 by decide) (f p) D.ε D.r δ R₀ R₁ D.chart
    let β := D.roundedRimOutgoingPoint δ R₀ R₁ hR₀.le h₀₁
    ∃ (s : ℝ) (Ψ : PartialDiffeomorph PMod J (L₀ × ℝ) M ∞)
      (d : L₀ ≃ₘ^∞⟮K,K⟯ L₁) (B : PartialDiffeomorph PMod J (L₁ × ℝ) M ∞)
      (T : PartialDiffeomorph J J M M ∞),
      0 < s ∧ s ≤ D.ε / 2 ∧
      (∀ (a : CellBoundary 1 × CellBoundary 3) t, t ∈ Ioo (-s) s →
        let q := (β a, t)
        let y := Ψ q
        let z := B (d (β a), t)
        y ∈ (R.trans T).source ∧ z ∈ (R.trans T).target ∧
          (R.trans T) y = z ∧ (R.trans T).symm z = y ∧ Ψ.symm ((R.trans T).symm z) = q ∧
          g y - f p = t ∧ f z - hi = t ∧ -f z - (-hi) = -t) ∧
      (∀ a : CellBoundary 1 × CellBoundary 3,
        let x := D.edgeBlockChart (a.1.val, a.2.val)
        (R.trans T) x = (d (β a)).val ∧ (R.trans T).symm (d (β a)).val = x) := by
  let _ := manifoldLevelSetChartedSpace J f c hf D.upper_regular
  let _ := manifoldLevelSetChartedSpace J f hi hf (D.outgoingNextCut_regular hunique)
  let β := D.roundedRimOutgoingPoint δ R₀ R₁ hR₀.le h₀₁
  let R := D.roundedRimToOutgoing δ
  obtain ⟨ρ, w, r, A, Ψ, U, Φ, d, B, T, hw, hwρ, hr, hrρ, hs, hsε, hU, hβ, hAS, hAT, hΨS,
    hTS, hTT, hmark, hd, hdi, hTf, hTi, hpatch, hcent⟩ :=
    D.exists_roundedRimTransport_toNextCut hunique δ R₀ R₁ hR₀ h₀₁
  refine ⟨min w r, Ψ, d, B, T, hs, hsε, ?_, ?_⟩
  · intro a t ht
    let q := (β a, t)
    have hq : q ∈ U ×ˢ Ioo (-(min w r)) (min w r) :=
      ⟨hβ (mem_range_self a), ht⟩
    obtain ⟨_, _, _, hR, hT, htarget, hRA, hforward, hback, hrestore, hcoordinates, hg, hfhi⟩ :=
      hpatch q hq
    let S := R.trans T
    have hs : Ψ q ∈ S.source := ⟨hR, hT⟩
    refine ⟨hs, ?_, hforward, hrestore, hcoordinates, ?_, ?_, ?_⟩
    · exact hforward ▸ S.map_source hs
    · linarith
    · linarith
    · linarith
  · intro a
    exact ⟨(hcent a).2.2.2.1, (hcent a).2.2.2.2⟩

#print axioms SmoothPoincare.IsolatedOneHandle.exists_roundedRimTransport_toNextCut
