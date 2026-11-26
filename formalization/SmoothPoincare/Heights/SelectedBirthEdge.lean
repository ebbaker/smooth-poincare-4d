import SmoothPoincare.Heights.MarkedEdgeGluing
import SmoothPoincare.Heights.SurvivingBirthBodies

/-! # The two incoming birth bodies of a selected native edge -/

open DifferentialGeometry.Topology DifferentialGeometry.Topology.Morse Set
open DifferentialGeometry.Topology.Morse.ManifoldCellAttachment
open scoped ContDiff Manifold Topology

namespace SmoothPoincare.IsolatedOneHandle

noncomputable section

local notation "V" => EuclideanSpace ℝ (Fin 4)
local notation "B" => Metric.closedBall (0 : V) 1
local notation "S" => Metric.sphere (0 : V) 1
local notation "hk₁" => (show (1 : ℕ) ≤ 4 by decide)

variable {H M : Type} [TopologicalSpace H] [TopologicalSpace M] [ChartedSpace H M]
  [T2Space M] [CompactSpace M]
  {J : ModelWithCorners ℝ (MorseModel 4) H} [J.Boundaryless] [IsManifold J ∞ M]
  {f : M → ℝ} {hf : ContMDiff J 𝓘(ℝ, ℝ) ∞ f}
  {p₀ p₁ p : M} {lo₀ hi₀ lo₁ hi₁ lo hi : ℝ}

/-- Apply the constructions to two actual births followed by a native isolated
one-handle. Whole closed bodies and opposite attaching feet survive the
restriction to disjoint ambient neighborhoods. -/
theorem exists_twoBirthCharts_withNativeEdgeFeet
    (D : IsolatedOneHandle hf p lo hi)
    (D₀ : IsolatedZeroHandle hf p₀ lo₀ hi₀) (D₁ : IsolatedZeroHandle hf p₁ lo₁ hi₁)
    (hunique₀ : ∀ x, f x ∈ Icc lo₀ hi₀ → IsCriticalPointAt J f x → x = p₀)
    (hunique₁ : ∀ x, f x ∈ Icc lo₁ hi₁ → IsCriticalPointAt J f x → x = p₁)
    (hempty : f ⁻¹' Iic (f p₀ - D₀.ε) = ∅)
    (hbetween : f p₀ + D₀.ε ≤ f p₁ - D₁.ε)
    (hregular₀ : ∀ x, f x ∈ Icc (f p₀ + D₀.ε) (f p₁ - D₁.ε) → ¬ IsCriticalPointAt J f x)
    (hbelow : f p₁ + D₁.ε ≤ f p - D.ε)
    (hregular₁ : ∀ x, f x ∈ Icc (f p₁ + D₁.ε) (f p - D.ε) → ¬ IsCriticalPointAt J f x)
    (a a' : CellBoundary 1) (hd : D.incomingBodyFoot a ≠ D.incomingBodyFoot a') :
    let φ := morseAttachingEmbedding hk₁ (f p) D.ε D.r D.chart D.ε_pos D.attaching_radius
    ∃ P Q : PartialDiffeomorph 𝓘(ℝ,V) J V M ∞,
      B ⊆ P.source ∧ B ⊆ Q.source ∧ Disjoint P.target Q.target ∧
      (P '' B) ∪ (Q '' B) = f ⁻¹' Iic (f p - D.ε) ∧
      (P '' S) ∪ (Q '' S) = f ⁻¹' {f p - D.ε} ∧
      (((∀ z : ClosedCell 3, (φ (a,z)).val ∈ P '' S) ∧
        (∀ z : ClosedCell 3, (φ (a',z)).val ∈ Q '' S)) ∨
       ((∀ z : ClosedCell 3, (φ (a,z)).val ∈ Q '' S) ∧
        (∀ z : ClosedCell 3, (φ (a',z)).val ∈ P '' S))) := by
  obtain ⟨P,Q,hP,hQ,hbody,hbdry,hdisjoint,_⟩ :=
    D₁.exists_twoBirthCharts_after_emptyCut D₀ hunique₀ hunique₁ hempty hbetween hregular₀ hbelow hregular₁
  have hsmall : B ⊆ Metric.closedBall (0 : V) 2 := Metric.closedBall_subset_closedBall (by norm_num)
  obtain ⟨P',Q',hP',hQ',hDisj,hcoords,_⟩ :=
    exists_disjointIncomingEdgePatches P Q (isCompact_closedBall 0 1) (isCompact_closedBall 0 1)
      (hsmall.trans hP) (hsmall.trans hQ) hdisjoint
  have hPeq : ⇑P' = P := funext fun x => (hcoords x).1
  have hQeq : ⇑Q' = Q := funext fun x => (hcoords x).2
  have hb' : (P' '' B) ∪ (Q' '' B) = f ⁻¹' Iic (f p - D.ε) := by rw [hPeq,hQeq,hbody]
  have hl' : (P' '' S) ∪ (Q' '' S) = f ⁻¹' {f p - D.ε} := by rw [hPeq,hQeq,hbdry]
  exact ⟨P',Q',hP',hQ',hDisj,hb',hl',
    D.nativeFeet_on_oppositeIncomingSpheres a a' hd P' Q' hP' hQ' hb' hl' hDisj⟩

end

end SmoothPoincare.IsolatedOneHandle
