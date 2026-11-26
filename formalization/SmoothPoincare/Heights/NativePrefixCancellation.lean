import DifferentialGeometry.Topology.Morse.Cancellation.FirstCancellation
import Mathlib.Data.Set.Card

/-! # Relative cancellation on the original Morse source -/

open Set DifferentialGeometry.Topology DifferentialGeometry.Topology.Morse
open scoped ContDiff Manifold Topology

namespace SmoothPoincare

section UnchangedCuts

variable {M : Type*} {f g : M → ℝ} {l r t : ℝ}

/-- The second prefix and the full outgoing level are above the cancelled
strip. Their ambient level sets and closed lower bodies are identical, so a
cost measured on either fixed region in the original metric is identical. -/
theorem nativePrefixCancellation_sameUpperCut (h : ModifiedWithin f l r g) (ht : r ≤ t) :
    g ⁻¹' {t} = f ⁻¹' {t} ∧ g ⁻¹' Iic t = f ⁻¹' Iic t := by
  constructor <;> ext x <;> by_cases hx : f x ∈ Ioo l r
  · have hg := (h.mapsTo hx).2.trans_le ht
    have hf := hx.2.trans_le ht
    simp [ne_of_lt hg, ne_of_lt hf]
  · simp [h.eqOn hx]
  · have hg := (h.mapsTo hx).2.le.trans ht
    have hf := hx.2.le.trans ht
    simp [hg, hf]
  · simp [h.eqOn hx]

/-- At a strictly higher regular cut the two heights agree on an open
ambient neighborhood. This conclusion also applies where a protected tube
intersects that neighborhood. -/
theorem nativePrefixCancellation_eventuallyEq [TopologicalSpace M]
    (h : ModifiedWithin f l r g) (hf : Continuous f)
    {x : M} (hx : r < f x) : g =ᶠ[nhds x] f := by
  apply (show EqOn g f (f ⁻¹' Ioi r) from fun y hy => h.eqOn (fun hy' =>
    (not_lt_of_ge (le_of_lt hy)) hy'.2)).eventuallyEq_of_mem
  exact (isOpen_Ioi.preimage hf).mem_nhds hx

end UnchangedCuts

section

variable {H M : Type*} [TopologicalSpace H] [TopologicalSpace M] [ChartedSpace H M]
  {I : ModelWithCorners ℝ (Fin 4 → ℝ) H} [I.Boundaryless] [IsManifold I ∞ M]
  [T2Space M] [CompactSpace M] [DecidableEq M]

/-- The index set in the Euclidean-coordinate Morse cancellation API. -/
def nativeMorseIndexSet (I : ModelWithCorners ℝ (Fin 4 → ℝ) H) (f : M → ℝ) (j : ℕ) : Set M :=
  {x | IsCriticalPointAt I f x ∧ morseIndex I f x = j}

local notation "C[" f "," j "]" => nativeMorseIndexSet I f j

/-- For a supplied geometric cancelling pair in a Morse strip, the modified
height has exactly the original critical set in each index with the two
specified points deleted. Both faces and both closed sublevels are the same
subsets of the original smooth source. -/
theorem exists_nativePrefixCancellation {f : M → ℝ} {a b l r : ℝ} {p q : M}
    (hf : MorseStrip I f a b) (hl : a ≤ l) (hr : r ≤ b)
    (hreg : ∀ x, f x = l ∨ f x = r → ¬ IsCriticalPointAt I f x)
    (hpair : isCancellingPair I f l r p q) :
    ∃ g : M → ℝ, ModifiedWithin f l r g ∧ MorseStrip I g a b ∧
      (∀ j, C[g,j] = C[f,j] \ {p, q}) ∧
      (g ⁻¹' {l} = f ⁻¹' {l}) ∧ (g ⁻¹' {r} = f ⁻¹' {r}) ∧
      (g ⁻¹' Iic l = f ⁻¹' Iic l) ∧ (g ⁻¹' Iic r = f ⁻¹' Iic r) := by
  obtain ⟨g, hmod, _, hg, hoff, hno⟩ :=
    exists_cancel_pair_strip_of_isCancellingPair I hf hl hr hreg hpair
  refine ⟨g, hmod, hg, ?_, hmod.preimage_singleton_left, hmod.preimage_singleton_right,
    hmod.preimage_Iic_left, hmod.preimage_Iic_right⟩
  intro j
  ext x
  constructor
  · intro hx
    have hfg : f x ∉ Ioo l r := fun hx' => hno x (hmod.mapsTo hx') hx.1
    have hcrit : IsCriticalPointAt I f x := (hoff x hfg).2.1.mp hx.1
    refine ⟨⟨hcrit, ((hoff x hfg).2.2 hcrit).symm.trans hx.2⟩, ?_⟩
    intro hpx
    have hmem : x ∈ ({p, q} : Finset M) := by simpa using hpx
    exact hfg ((hpair.2.1 x).mp hmem).1
  · rintro ⟨hx, hpx⟩
    have hfg : f x ∉ Ioo l r := by
      intro hx'
      exact hpx (by simpa using (hpair.2.1 x).mpr ⟨hx', hx.1⟩)
    exact ⟨(hoff x hfg).2.1.mpr hx.1, ((hoff x hfg).2.2 hx.1).trans hx.2⟩

/-- In a globally Morse height with finite critical set, a verified lower
1/2 pair gives the strict three-to-two decrease on the same smooth source.
All other index sets are returned pointwise by `exists_nativePrefixCancellation`. -/
theorem exists_nativeThreeToTwo {f : M → ℝ} {a b l r : ℝ} {p q : M}
    (hf : MorseStrip I f a b) (hl : a ≤ l) (hr : r ≤ b)
    (hreg : ∀ x, f x = l ∨ f x = r → ¬ IsCriticalPointAt I f x)
    (hpair : isCancellingPair I f l r p q) (hp : morseIndex I f p = 1)
    (hfinite : {x | IsCriticalPointAt I f x}.Finite)
    (hOne : C[f,1].ncard = 1) (hThree : C[f,2].ncard = 3) :
    ∃ g : M → ℝ, ModifiedWithin f l r g ∧ MorseStrip I g a b ∧
      C[g,1].ncard = 0 ∧ C[g,2].ncard = 2 ∧
      ∀ j, j ≠ 1 → j ≠ 2 → C[g,j] = C[f,j] := by
  obtain ⟨g, hmod, hg, hsets, _⟩ := exists_nativePrefixCancellation hf hl hr hreg hpair
  have hq : morseIndex I f q = 2 := by rw [hpair.2.2.2.1, hp]
  have hpcrit := ((hpair.2.1 p).mp (mem_pair_left p q)).2
  have hqcrit := ((hpair.2.1 q).mp (mem_pair_right p q)).2
  have hcount {j : ℕ} {x : M} (hx : x ∈ C[f,j]) :=
    ncard_sdiff_singleton_add_one hx (hfinite.subset fun _ hy => hy.1)
  refine ⟨g, hmod, hg, ?_, ?_, ?_⟩
  · have heq : C[g,1] = C[f,1] \ {p} := by
      rw [hsets]
      ext x
      simp only [nativeMorseIndexSet, mem_sdiff, mem_ofPred_eq, mem_insert_iff, mem_singleton_iff, not_or]
      exact ⟨fun h => ⟨h.1, h.2.1⟩, fun h => ⟨h.1, h.2, fun e => by
        subst x
        omega⟩⟩
    have h := hcount (show p ∈ C[f,1] from ⟨hpcrit, hp⟩)
    rw [heq]
    omega
  · have heq : C[g,2] = C[f,2] \ {q} := by
      rw [hsets]
      ext x
      simp only [nativeMorseIndexSet, mem_sdiff, mem_ofPred_eq, mem_insert_iff, mem_singleton_iff, not_or]
      exact ⟨fun h => ⟨h.1, h.2.2⟩, fun h => ⟨h.1, (fun e => by
        subst x
        omega), h.2⟩⟩
    have h := hcount (show q ∈ C[f,2] from ⟨hqcrit, hq⟩)
    rw [heq]
    omega
  · intro j hj₁ hj₂
    rw [hsets]
    ext x
    simp only [nativeMorseIndexSet, mem_sdiff, mem_ofPred_eq, mem_insert_iff, mem_singleton_iff, not_or]
    refine ⟨And.left, fun h => ⟨h, ?_, ?_⟩⟩
    · intro e
      subst x
      exact hj₁ (h.2.symm.trans hp)
    · intro e
      subst x
      exact hj₂ (h.2.symm.trans hq)

end

end SmoothPoincare
