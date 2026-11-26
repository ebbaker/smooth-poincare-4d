import SmoothPoincare.Heights.NativeBirthBody
import SmoothPoincare.Heights.RegularEndMarkings
import DifferentialGeometry.Analysis.Calculus.Cutoff.Compact

/-! # The whole surviving body at a native index-zero birth -/

open DifferentialGeometry.Topology DifferentialGeometry.Topology.Morse Set Filter Metric
open scoped ContDiff Manifold Topology

namespace SmoothPoincare.IsolatedZeroHandle

noncomputable section

variable {H M : Type} [TopologicalSpace H] [TopologicalSpace M] [ChartedSpace H M]
  {J : ModelWithCorners ℝ (MorseModel 4) H} [J.Boundaryless] [IsManifold J ∞ M]
  {f : M → ℝ} {hf : ContMDiff J 𝓘(ℝ, ℝ) ∞ f} {p : M} {lo hi : ℝ}
  (D : IsolatedZeroHandle hf p lo hi)

local notation "V" => EuclideanSpace ℝ (Fin 4)
local notation "a" => f p - D.ε
local notation "b" => f p + D.ε
local notation "E" => D.birthBodyChart
local notation "B" => E '' closedBall (0 : V) 1

/-- In the whole open birth chart, the upper sublevel consists precisely
of the closed round birth ball. -/
theorem birthBodyChart_inter_sublevel :
    D.birthBodyChart.target ∩ f ⁻¹' Iic b = B := by
  have hsmall : closedBall (0 : V) 1 ⊆ D.birthBodyChart.source :=
    (closedBall_subset_closedBall (by norm_num : (1 : ℝ) ≤ 2)).trans D.birthBodyChart_closedBall_two
  ext x
  constructor
  · rintro ⟨hx, hxsub⟩
    have hval := D.birthBodyChart_height (D.birthBodyChart.map_target hx)
    have heq : f x = f p + D.ε * ‖D.birthBodyChart.symm x‖ ^ 2 :=
      (congrArg f (D.birthBodyChart.right_inv hx)).symm.trans hval
    change f x ≤ b at hxsub
    have hn₀ : ‖D.birthBodyChart.symm x‖ ^ 2 ≤ 1 := by
      by_contra! hn
      have hmul := mul_lt_mul_of_pos_left hn D.ε_pos
      linarith
    exact ⟨D.birthBodyChart.symm x, mem_closedBall_zero_iff.mpr
      (by nlinarith [norm_nonneg (D.birthBodyChart.symm x)]), D.birthBodyChart.right_inv hx⟩
  · rintro ⟨z, hz, rfl⟩
    refine ⟨D.birthBodyChart.map_source (hsmall hz), ?_⟩
    change f (E z) ≤ b
    rw [D.birthBodyChart_height (hsmall hz)]
    have hn := mem_closedBall_zero_iff.mp hz
    have hsq : ‖z‖ ^ 2 ≤ 1 := by nlinarith [norm_nonneg z]
    linarith [mul_le_mul_of_nonneg_left hsq D.ε_pos.le]

/-- Raise the new minimum above the upper cut with a smooth cutoff supported
in its birth chart. Both cuts of the surviving body are then regular in the
modified height, which agrees with the original height near every surviving
point of the band. -/
theorem exists_birthExcisionHeight [T2Space M] [CompactSpace M]
    (hunique : ∀ x, f x ∈ Icc lo hi → IsCriticalPointAt J f x → x = p) :
    ∃ (g : M → ℝ) (_hg : ContMDiff J 𝓘(ℝ, ℝ) ∞ g),
      (∀ x ∈ g ⁻¹' Icc a b, ¬ IsCriticalPointAt J g x) ∧
      g ⁻¹' Iic a = f ⁻¹' Iic a ∧ g ⁻¹' {a} = f ⁻¹' {a} ∧
      g ⁻¹' Iic b = (f ⁻¹' Iic b) \ B ∧ g ⁻¹' {b} = (f ⁻¹' {b}) \ B ∧
      (∀ x ∉ D.birthBodyChart.target, g =ᶠ[𝓝 x] f) := by
  have hsmall : closedBall (0 : V) 1 ⊆ D.birthBodyChart.source :=
    (closedBall_subset_closedBall (by norm_num : (1 : ℝ) ≤ 2)).trans D.birthBodyChart_closedBall_two
  have hB : IsCompact B :=
    (isCompact_closedBall _ _).image_of_continuousOn (D.birthBodyChart.contMDiffOn.continuousOn.mono hsmall)
  have hBV : B ⊆ D.birthBodyChart.target := image_subset_iff.mpr fun _ hz => D.birthBodyChart.map_source (hsmall hz)
  obtain ⟨χ, hχ, _, hχone, hχsupp, hχrange⟩ :=
    DifferentialGeometry.Analysis.exists_mfd_bump (I := J) hB D.birthBodyChart.open_target hBV
  let g := fun x : M => f x + (2 * D.ε) * χ x
  have hg : ContMDiff J 𝓘(ℝ, ℝ) ∞ g := hf.add (contMDiff_const.mul hχ)
  have hχ0 (x : M) : 0 ≤ χ x := (hχrange (mem_range_self x)).1
  have hfg (x : M) : f x ≤ g x := by
    dsimp only [g]
    linarith [mul_nonneg (by linarith [D.ε_pos] : 0 ≤ 2 * D.ε) (hχ0 x)]
  have heq (x : M) (hx : x ∉ D.birthBodyChart.target) : g =ᶠ[𝓝 x] f := by
    have hχzero := notMem_tsupport_iff_eventuallyEq.mp (fun hs => hx (hχsupp hs))
    filter_upwards [hχzero] with y hy
    change χ y = 0 at hy
    simp [g, hy]
  have hcp (x : M) (hx : x ∈ D.birthBodyChart.target) : f p ≤ f x := by
    have h := D.birthBodyChart_height (D.birthBodyChart.map_target hx)
    have he : f x = f p + D.ε * ‖D.birthBodyChart.symm x‖ ^ 2 :=
      (congrArg f (D.birthBodyChart.right_inv hx)).symm.trans h
    rw [he]
    exact le_add_of_nonneg_right (mul_nonneg D.ε_pos.le (sq_nonneg _))
  have habove (x : M) (hx : x ∈ D.birthBodyChart.target) : b < g x := by
    by_cases hxB : x ∈ B
    · have hlocal : χ =ᶠ[𝓝 x] (1 : M → ℝ) :=
        Filter.EventuallyEq.filter_mono hχone (nhds_le_nhdsSet hxB)
      have hval : χ x = 1 := hlocal.eq_of_nhds
      dsimp only [g]
      rw [hval, mul_one]
      linarith [hcp x hx, D.ε_pos]
    · have hval : b < f x := by
        apply lt_of_not_ge
        intro hs
        exact hxB (D.birthBodyChart_inter_sublevel ▸ ⟨hx, hs⟩)
      exact hval.trans_le (hfg x)
  have hzero : (0 : V) ∈ D.birthBodyChart.source :=
    D.birthBodyChart_closedBall_two (mem_closedBall_self (by norm_num))
  have hp : p ∈ D.birthBodyChart.target := by
    simpa only [D.birthBodyChart_zero] using D.birthBodyChart.map_source hzero
  have hregular (x : M) (hx : x ∈ g ⁻¹' Icc a b) : ¬ IsCriticalPointAt J g x := by
    have hxOut : x ∉ D.birthBodyChart.target := fun h => (habove x h).not_ge hx.2
    have hval := (heq x hxOut).eq_of_nhds
    intro hcrit
    have hcritF : IsCriticalPointAt J f x := by
      change mfderiv J 𝓘(ℝ, ℝ) f x = 0
      rw [(heq x hxOut).symm.mfderiv_eq, hcrit, ContinuousLinearMap.comp_zero]
    have hx' : f x ∈ Icc lo hi :=
      ⟨D.lower_inside.le.trans (hval ▸ hx.1), (hval ▸ hx.2).trans D.upper_inside.le⟩
    exact hxOut (hunique x hx' hcritF ▸ hp)
  refine ⟨g, hg, hregular, ?_, ?_, ?_, ?_, heq⟩
  · ext x
    change g x ≤ a ↔ f x ≤ a
    by_cases hx : x ∈ D.birthBodyChart.target
    · have hfa : a < f x := by linarith [hcp x hx, D.ε_pos]
      exact ⟨fun h => False.elim ((hfa.trans_le (hfg x)).not_ge h),
        fun h => False.elim (hfa.not_ge h)⟩
    · rw [(heq x hx).eq_of_nhds]
  · ext x
    change g x = a ↔ f x = a
    by_cases hx : x ∈ D.birthBodyChart.target
    · have hfa : a < f x := by linarith [hcp x hx, D.ε_pos]
      exact ⟨fun h => False.elim ((hfa.trans_le (hfg x)).ne h.symm),
        fun h => False.elim (hfa.ne h.symm)⟩
    · rw [(heq x hx).eq_of_nhds]
  · ext x
    change g x ≤ b ↔ f x ≤ b ∧ x ∉ B
    by_cases hx : x ∈ D.birthBodyChart.target
    · exact ⟨fun h => False.elim ((habove x hx).not_ge h),
        fun ⟨hv, hn⟩ => False.elim (hn (D.birthBodyChart_inter_sublevel ▸ ⟨hx, hv⟩))⟩
    · rw [(heq x hx).eq_of_nhds]
      exact ⟨fun hv => ⟨hv, fun h => hx (hBV h)⟩, And.left⟩
  · ext x
    change g x = b ↔ f x = b ∧ x ∉ B
    by_cases hx : x ∈ D.birthBodyChart.target
    · exact ⟨fun h => False.elim ((habove x hx).ne h.symm),
        fun ⟨hv, hn⟩ => False.elim (hn (D.birthBodyChart_inter_sublevel ▸ ⟨hx, hv.le⟩))⟩
    · rw [(heq x hx).eq_of_nhds]
      exact ⟨fun hv => ⟨hv, fun h => hx (hBV h)⟩, And.left⟩

/-- A single ambient smooth comparison carries the actual incoming body and
its full boundary to the part of the actual outgoing body and its boundary
that survives the birth. The native regular marked restrictions use the
same map. -/
theorem exists_survivingBirthTransport [T2Space M] [CompactSpace M]
    (hunique : ∀ x, f x ∈ Icc lo hi → IsCriticalPointAt J f x → x = p) :
    ∃ (g : M → ℝ) (hg : ContMDiff J 𝓘(ℝ, ℝ) ∞ g)
      (hreg : ∀ x, g x = b → ¬ IsCriticalPointAt J g x)
      (Φ : M ≃ₘ^∞⟮J,J⟯ M),
      g ⁻¹' Iic b = (f ⁻¹' Iic b) \ B ∧ g ⁻¹' {b} = (f ⁻¹' {b}) \ B ∧
      Φ '' (f ⁻¹' Iic a) = (f ⁻¹' Iic b) \ B ∧ Φ '' (f ⁻¹' {a}) = (f ⁻¹' {b}) \ B ∧
      RegularEndMarked hf hg D.lower_regular hreg Φ ∧
      (∀ x ∉ D.birthBodyChart.target, g =ᶠ[𝓝 x] f) := by
  obtain ⟨g, hg, hregular, hloS, hloL, hupS, hupL, heq⟩ := D.exists_birthExcisionHeight hunique
  have hab : a ≤ b := by linarith [D.ε_pos]
  have hc : IsCompact (g ⁻¹' Icc a b) :=
    (isClosed_Icc.preimage hg.continuous).isCompact
  obtain ⟨_, Φ, _, _, _, _, ⟨_, hsub, _⟩, hl, _, hli, _⟩ :=
    no_critical_value_transport g hg hab hc hregular
  have hlev : Φ '' (g ⁻¹' {a}) = g ⁻¹' {b} := by
    ext y
    constructor
    · rintro ⟨x, hx, rfl⟩
      exact hl x hx
    · intro hy
      exact ⟨Φ.symm y, hli y hy, Φ.apply_symm_apply y⟩
  have hsub' : Φ '' (f ⁻¹' Iic a) = g ⁻¹' Iic b := hloS ▸ hsub
  have hlev' : Φ '' (f ⁻¹' {a}) = g ⁻¹' {b} := hloL ▸ hlev
  have hreg (x : M) (hx : g x = b) : ¬ IsCriticalPointAt J g x :=
    hregular x (show g x ∈ Icc a b from hx.symm ▸ ⟨hab, le_rfl⟩)
  exact ⟨g, hg, hreg, Φ, hupS, hupL, hsub'.trans hupS, hlev'.trans hupL,
    regularEndMarked_of_image_eq hf hg D.lower_regular hreg Φ hsub' hlev', heq⟩

/-- Starting from an empty predecessor cut, the parametrized first birth
fills the entire actual body through every subsequent regular cut. -/
theorem exists_firstBirthChart_at_regularCut [T2Space M] [CompactSpace M]
    (hunique : ∀ x, f x ∈ Icc lo hi → IsCriticalPointAt J f x → x = p)
    (hempty : f ⁻¹' Iic a = ∅)
    {u : ℝ} (hbu : b ≤ u) (hregular : ∀ x, f x ∈ Icc b u → ¬ IsCriticalPointAt J f x) :
    ∃ (Ξ : M ≃ₘ^∞⟮J,J⟯ M) (G : PartialDiffeomorph 𝓘(ℝ, V) J V M ∞),
      closedBall (0 : V) 2 ⊆ G.source ∧
      G '' closedBall (0 : V) 1 = f ⁻¹' Iic u ∧ G '' sphere (0 : V) 1 = f ⁻¹' {u} ∧
      (∀ x, G x = Ξ (E x)) ∧ (∀ y, G.symm y = (E).symm (Ξ.symm y)) := by
  obtain ⟨_, _, _, Φ, _, _, hΦS, _, _⟩ := D.exists_survivingBirthTransport hunique
  have hn : (f ⁻¹' Iic b) \ B = ∅ := by rw [← hΦS, hempty, image_empty]
  have hBsub : B ⊆ f ⁻¹' Iic b :=
    D.birthBodyChart_inter_sublevel ▸ inter_subset_right
  have hfull : B = f ⁻¹' Iic b :=
    hBsub.antisymm (sdiff_eq_empty.mp hn)
  have hlevel : E '' sphere (0 : V) 1 = f ⁻¹' {b} := by
    have hs := D.birthBodyChart_component.2
    change E '' sphere (0 : V) 1 = connectedComponentIn {y | f y ≤ b} p ∩ (f ⁻¹' {b}) at hs
    rw [← D.birthBodyChart_component.1, hfull, inter_eq_right.mpr] at hs
    · exact hs
    · intro x hx
      exact le_of_eq hx
  obtain ⟨_, Ξ, _, _, _, _, ⟨_, hΞS, _⟩, hΞto, _, hΞfrom, _⟩ :=
    no_critical_value_transport f hf hbu (isClosed_Icc.preimage hf.continuous).isCompact hregular
  have hΞL : Ξ '' (f ⁻¹' {b}) = f ⁻¹' {u} := by
    ext y
    constructor
    · rintro ⟨x, hx, rfl⟩
      exact hΞto x hx
    · intro hy
      exact ⟨Ξ.symm y, hΞfrom y hy, Ξ.apply_symm_apply y⟩
  let G := (E).trans Ξ.toPartialDiffeomorph
  refine ⟨Ξ, G, fun x hx => ⟨D.birthBodyChart_closedBall_two hx, mem_univ _⟩, ?_, ?_,
    fun _ => rfl, fun _ => rfl⟩
  · change (Ξ ∘ E) '' _ = _
    rw [image_comp, hfull]
    exact hΞS
  · change (Ξ ∘ E) '' _ = _
    rw [image_comp, hlevel, hΞL]

/-- If the actual body before a birth is one parametrized ball, then the
surviving ball and the new birth ball give two whole, disjoint parametrized
bodies at any subsequent regular cut. The same ambient maps provide their
entire boundary markings and the inverse on their chart neighborhoods. -/
theorem exists_twoBirthCharts_at_regularCut [T2Space M] [CompactSpace M]
    (hunique : ∀ x, f x ∈ Icc lo hi → IsCriticalPointAt J f x → x = p)
    {u : ℝ} (hbu : b ≤ u) (hregular : ∀ x, f x ∈ Icc b u → ¬ IsCriticalPointAt J f x)
    (G : PartialDiffeomorph 𝓘(ℝ, V) J V M ∞)
    (hG : closedBall (0 : V) 2 ⊆ G.source)
    (hbody : G '' closedBall (0 : V) 1 = f ⁻¹' Iic a)
    (hboundary : G '' sphere (0 : V) 1 = f ⁻¹' {a}) :
    ∃ (Φ Ξ : M ≃ₘ^∞⟮J,J⟯ M) (P Q : PartialDiffeomorph 𝓘(ℝ, V) J V M ∞),
      closedBall (0 : V) 2 ⊆ P.source ∧ closedBall (0 : V) 2 ⊆ Q.source ∧
      ((P '' closedBall (0 : V) 1) ∪ (Q '' closedBall (0 : V) 1)) = f ⁻¹' Iic u ∧
      ((P '' sphere (0 : V) 1) ∪ (Q '' sphere (0 : V) 1)) = f ⁻¹' {u} ∧
      Disjoint (P '' closedBall (0 : V) 1) (Q '' closedBall (0 : V) 1) ∧
      (∀ x, P x = Ξ (Φ (G x)) ∧ Q x = Ξ (E x)) ∧
      (∀ y, P.symm y = G.symm (Φ.symm (Ξ.symm y)) ∧ Q.symm y = D.birthBodyChart.symm (Ξ.symm y)) := by
  obtain ⟨_, _, _, Φ, _, _, hΦS, hΦL, _⟩ := D.exists_survivingBirthTransport hunique
  obtain ⟨_, Ξ, _, _, _, _, ⟨_, hΞS, _⟩, hΞto, _, hΞfrom, _⟩ :=
    no_critical_value_transport f hf hbu (isClosed_Icc.preimage hf.continuous).isCompact hregular
  have hΞL : Ξ '' (f ⁻¹' {b}) = f ⁻¹' {u} := by
    ext y
    constructor
    · rintro ⟨x, hx, rfl⟩
      exact hΞto x hx
    · intro hy
      exact ⟨Ξ.symm y, hΞfrom y hy, Ξ.apply_symm_apply y⟩
  let P := G.trans (Φ.trans Ξ).toPartialDiffeomorph
  let Q := D.birthBodyChart.trans Ξ.toPartialDiffeomorph
  have hPB : P '' closedBall (0 : V) 1 = Ξ '' ((f ⁻¹' Iic b) \ B) := by
    change (Ξ ∘ Φ ∘ G) '' _ = _
    rw [image_comp, image_comp, hbody, hΦS]
  have hQB : Q '' closedBall (0 : V) 1 = Ξ '' B := by
    change (Ξ ∘ E) '' _ = _
    rw [image_comp]
  have hPL : P '' sphere (0 : V) 1 = Ξ '' ((f ⁻¹' {b}) \ B) := by
    change (Ξ ∘ Φ ∘ G) '' _ = _
    rw [image_comp, image_comp, hboundary, hΦL]
  have hQL : Q '' sphere (0 : V) 1 = Ξ '' ((f ⁻¹' {b}) ∩ B) := by
    have hball := D.birthBodyChart_component.1
    have hlevel := D.birthBodyChart_component.2
    change E '' sphere (0 : V) 1 = connectedComponentIn {y | f y ≤ b} p ∩ (f ⁻¹' {b}) at hlevel
    rw [← hball] at hlevel
    change (Ξ ∘ E) '' _ = _
    rw [image_comp, hlevel, inter_comm B]
  have hBsub : B ⊆ f ⁻¹' Iic b :=
    D.birthBodyChart_inter_sublevel ▸ inter_subset_right
  have hBS : ((f ⁻¹' Iic b) \ B) ∪ B = f ⁻¹' Iic b :=
    sdiff_union_of_subset hBsub
  have hBL : ((f ⁻¹' {b}) \ B) ∪ ((f ⁻¹' {b}) ∩ B) = f ⁻¹' {b} :=
    sdiff_union_inter _ _
  refine ⟨Φ, Ξ, P, Q, fun x hx => ⟨hG hx, mem_univ _⟩,
    fun x hx => ⟨D.birthBodyChart_closedBall_two hx, mem_univ _⟩, ?_, ?_, ?_,
    fun _ => ⟨rfl, rfl⟩, fun _ => ⟨rfl, rfl⟩⟩
  · rw [hPB, hQB, ← image_union, hBS]
    exact hΞS
  · rw [hPL, hQL, ← image_union, hBL, hΞL]
  · rw [hPB, hQB]
    refine disjoint_left.mpr ?_
    rintro _ ⟨y, hy, rfl⟩ ⟨z, hz, heq⟩
    exact hy.2 (Ξ.injective heq ▸ hz)

/-- Two actual births from an empty predecessor, separated by a regular band
and followed by a regular band, give both native ball charts at the chosen
cut. The inverse returns every point in the closed radius-two parameter ball. -/
theorem exists_twoBirthCharts_after_emptyCut [T2Space M] [CompactSpace M]
    {p₀ : M} {lo₀ hi₀ : ℝ} (D₀ : IsolatedZeroHandle hf p₀ lo₀ hi₀)
    (hunique₀ : ∀ x, f x ∈ Icc lo₀ hi₀ → IsCriticalPointAt J f x → x = p₀)
    (hunique : ∀ x, f x ∈ Icc lo hi → IsCriticalPointAt J f x → x = p)
    (hempty : f ⁻¹' Iic (f p₀ - D₀.ε) = ∅)
    (hbetween : f p₀ + D₀.ε ≤ a)
    (hregular₀ : ∀ x, f x ∈ Icc (f p₀ + D₀.ε) a → ¬ IsCriticalPointAt J f x)
    {u : ℝ} (hbu : b ≤ u) (hregular : ∀ x, f x ∈ Icc b u → ¬ IsCriticalPointAt J f x) :
    ∃ (P Q : PartialDiffeomorph 𝓘(ℝ, V) J V M ∞),
      closedBall (0 : V) 2 ⊆ P.source ∧ closedBall (0 : V) 2 ⊆ Q.source ∧
      ((P '' closedBall (0 : V) 1) ∪ (Q '' closedBall (0 : V) 1)) = f ⁻¹' Iic u ∧
      ((P '' sphere (0 : V) 1) ∪ (Q '' sphere (0 : V) 1)) = f ⁻¹' {u} ∧
      Disjoint (P '' closedBall (0 : V) 1) (Q '' closedBall (0 : V) 1) ∧
      (∀ x ∈ closedBall (0 : V) 2, P.symm (P x) = x ∧ Q.symm (Q x) = x) := by
  obtain ⟨_, G, hG, hbody, hboundary, _, _⟩ :=
    D₀.exists_firstBirthChart_at_regularCut hunique₀ hempty hbetween hregular₀
  obtain ⟨_, _, P, Q, hP, hQ, hballs, hboundaries, hdisj, _, _⟩ :=
    D.exists_twoBirthCharts_at_regularCut hunique hbu hregular G hG hbody hboundary
  exact ⟨P, Q, hP, hQ, hballs, hboundaries, hdisj, fun x hx => ⟨P.left_inv (hP hx), Q.left_inv (hQ hx)⟩⟩

end
end SmoothPoincare.IsolatedZeroHandle
