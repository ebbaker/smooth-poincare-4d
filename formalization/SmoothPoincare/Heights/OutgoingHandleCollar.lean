import SmoothPoincare.Heights.EndHandleBands
import SmoothPoincare.Heights.NativeHeightCollar

/-! # The signed collar of an actual isolated one-handle's outgoing cut -/

open DifferentialGeometry.Topology DifferentialGeometry.Topology.Morse Set
open DifferentialGeometry.Topology.Morse.CellAttachment
open scoped ContDiff Manifold Topology

namespace SmoothPoincare.IsolatedOneHandle

noncomputable section

variable {H M : Type} [TopologicalSpace H] [TopologicalSpace M] [ChartedSpace H M]
  {J : ModelWithCorners ℝ (MorseModel 4) H} [J.Boundaryless] [IsManifold J ∞ M]
  {f : M → ℝ} {hf : ContMDiff J 𝓘(ℝ, ℝ) ∞ f} {p : M} {lo hi : ℝ}
  (D : IsolatedOneHandle hf p lo hi)

local notation "V" => EuclideanSpace ℝ (Fin 3)
local notation "hk₁" => (show (1 : ℕ) ≤ 4 by decide)

private def outgoingAxisModelPoint : MorseModel 4 :=
  recombine hk₁ 0 (PiLp.single 2 (0 : Fin 3) (Real.sqrt (2 * D.ε)))

private theorem outgoingAxisModelPoint_norm : morseNorm 4 D.outgoingAxisModelPoint ≤ D.chart.R := by
  have hε := D.ε_pos
  have hR := D.chart.radius_pos
  have hr := (Real.sqrt_le_iff.mp D.attaching_radius).2
  apply (sq_le_sq₀ (norm_nonneg _) hR.le).1
  rw [outgoingAxisModelPoint, morseNorm_recombine_sq, norm_zero, zero_pow (by decide), zero_add,
    PiLp.norm_single, Real.norm_of_nonneg (Real.sqrt_nonneg _), Real.sq_sqrt (by positivity)]
  linarith [sq_nonneg D.r]

private theorem outgoingAxisModelPoint_value :
    f (D.chart.χ D.outgoingAxisModelPoint) = f p + D.ε := by
  have hε := D.ε_pos
  have hR := D.chart.radius_pos
  rw [D.double_normalForm_on _ (D.outgoingAxisModelPoint_norm.trans (by linarith)),
    outgoingAxisModelPoint, morseNormalForm_split, negPart_recombine, posPart_recombine,
    norm_zero, zero_pow (by decide), sub_zero, PiLp.norm_single,
    Real.norm_of_nonneg (Real.sqrt_nonneg _), Real.sq_sqrt (by positivity)]
  ring

/-- The actual outgoing level contains the point on the positive Morse axis
at distance `sqrt (2 * ε)` from the origin in the chosen chart. -/
def outgoingAxisPoint : LevelSetSpace f (f p + D.ε) :=
  ⟨D.chart.χ D.outgoingAxisModelPoint, D.outgoingAxisModelPoint_value⟩

/-- The actual outgoing cut admits the signed height collar on its full
open band. The parameter is the height difference in both directions. -/
theorem exists_outgoingSignedHeightCollar [T2Space M] [CompactSpace M] :
    let c := f p + D.ε
    letI := manifoldLevelSetChartedSpace J f c hf D.upper_regular
    ∃ ρ > (0 : ℝ), ∃ Φ : PartialDiffeomorph ((𝓘(ℝ, MorseModel 3)).prod 𝓘(ℝ, ℝ)) J
        (LevelSetSpace f c × ℝ) M ∞,
      Φ.source = {q | q.2 ∈ Ioo (-ρ) ρ} ∧ Φ.target = f ⁻¹' Ioo (c - ρ) (c + ρ) ∧
      (∀ x : LevelSetSpace f c, Φ (x, 0) = x.val) ∧
      (∀ q ∈ Φ.source, f (Φ q) = c + q.2) ∧
      (∀ y ∈ Φ.target, (Φ.symm y).2 = f y - c) :=
  exists_nativeSignedHeightCollar hf D.upper_regular D.outgoingAxisPoint

/-- Once the named critical point is known to be the only one in the
isolating band, the outgoing interval through the next cut is regular. -/
theorem outgoingBand_regular
    (hunique : ∀ x, f x ∈ Icc lo hi → IsCriticalPointAt J f x → x = p) :
    ∀ x, f x ∈ Icc (f p + D.ε) hi → ¬ IsCriticalPointAt J f x := by
  intro x hx hc
  have hε := D.ε_pos
  have hlo := D.lower_inside
  have heq : x = p := hunique x ⟨by linarith [hx.1], hx.2⟩ hc
  subst x
  linarith [hx.1]

/-- Use regular flow from the actual outgoing cut to the next filtration cut
to carry both native sublevel and level markings. -/
theorem exists_outgoingMarkedComparison [T2Space M] [CompactSpace M]
    (hunique : ∀ x, f x ∈ Icc lo hi → IsCriticalPointAt J f x → x = p) :
    ∃ Φ : M ≃ₘ^∞⟮J, J⟯ M, RegularEndMarked hf hf D.upper_regular
      (fun x hx => D.outgoingBand_regular hunique x
        (hx.symm ▸ ⟨D.upper_inside.le, le_rfl⟩)) Φ :=
  exists_regularBandEndMarked hf D.upper_inside.le
    (isClosed_Icc.preimage hf.continuous).isCompact
    (D.outgoingBand_regular hunique)

end
end SmoothPoincare.IsolatedOneHandle
