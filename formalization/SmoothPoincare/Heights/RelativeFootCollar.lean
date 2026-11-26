import DifferentialGeometry.Topology.Manifold.BallEmbedding.RelativeIsotopy
import DifferentialGeometry.Topology.Manifold.PartialDiffeomorphTrans
import Mathlib.Analysis.SpecialFunctions.SmoothTransition

/-! # Relative normalization on a signed product collar -/

set_option autoImplicit false

noncomputable section

open Set Manifold
open scoped ContDiff Manifold

namespace SmoothPoincare

section Product

variable {E H L : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [TopologicalSpace H] [TopologicalSpace L] [ChartedSpace H L]
  {I : ModelWithCorners ℝ E H} {C : Set L}

/-- A level isotopy with jointly smooth forward and inverse maps and one compact support
away from the protected set. The parameter is defined on all of `ℝ`. -/
structure SupportedLevelIsotopy (I : ModelWithCorners ℝ E H) (C : Set L) where
  isotopy : ℝ → L ≃ₘ^∞⟮I, I⟯ L
  support : Set L
  compact_support : IsCompact support
  disjoint_support : Disjoint support C
  start : isotopy 0 = Diffeomorph.refl I L ∞
  smooth : ContMDiff (𝓘(ℝ, ℝ).prod I) I ∞ (fun p : ℝ × L => isotopy p.1 p.2)
  smooth_symm : ContMDiff (𝓘(ℝ, ℝ).prod I) I ∞ (fun p : ℝ × L => (isotopy p.1).symm p.2)
  fixes_off_support : ∀ s, EqOn (isotopy s) id supportᶜ
  symm_fixes_off_support : ∀ s, EqOn (isotopy s).symm id supportᶜ

/-- The same smooth cutoff on both sides of the seam, with a constant plateau
for `|t| ≤ a` and zero for `b ≤ |t|` when `0 < a < b`. -/
def signedFootCollarCutoff (a b t : ℝ) : ℝ :=
  Real.smoothTransition ((b ^ 2 - t ^ 2) / (b ^ 2 - a ^ 2))

theorem signedFootCollarCutoff_smooth (a b : ℝ) :
    ContDiff ℝ ∞ (signedFootCollarCutoff a b) := by
  exact Real.smoothTransition.contDiff.comp
    ((contDiff_const.sub (contDiff_id.pow 2)).div_const (b ^ 2 - a ^ 2))

private theorem signedFootCollar_width_pos {a b : ℝ} (ha : 0 < a) (hab : a < b) :
    0 < b ^ 2 - a ^ 2 :=
  sub_pos.mpr ((sq_lt_sq₀ ha.le (ha.trans hab).le).2 hab)

theorem signedFootCollarCutoff_eq_one {a b t : ℝ} (ha : 0 < a) (hab : a < b)
    (ht : |t| ≤ a) : signedFootCollarCutoff a b t = 1 := by
  apply Real.smoothTransition.one_of_one_le
  have hs := (sq_le_sq₀ (abs_nonneg t) ha.le).2 ht
  rw [sq_abs] at hs
  exact (le_div_iff₀ (signedFootCollar_width_pos ha hab)).2 (by linarith)

theorem signedFootCollarCutoff_eq_zero {a b t : ℝ} (ha : 0 < a) (hab : a < b)
    (ht : b ≤ |t|) : signedFootCollarCutoff a b t = 0 := by
  apply Real.smoothTransition.zero_of_nonpos
  have hs := (sq_le_sq₀ (ha.trans hab).le (abs_nonneg t)).2 ht
  rw [sq_abs] at hs
  exact div_nonpos_of_nonpos_of_nonneg (sub_nonpos.mpr hs) (signedFootCollar_width_pos ha hab).le

namespace SupportedLevelIsotopy

/-- The signed product lift is smooth across the seam in both directions.
Each map preserves the entire signed normal coordinate. -/
def signedCollarDiffeomorph (A : SupportedLevelIsotopy I C) (a b : ℝ) :
    (L × ℝ) ≃ₘ^∞⟮I.prod 𝓘(ℝ, ℝ), I.prod 𝓘(ℝ, ℝ)⟯ (L × ℝ) := by
  have h : ContMDiff (I.prod 𝓘(ℝ, ℝ)) 𝓘(ℝ, ℝ) ∞
      (fun p : L × ℝ => signedFootCollarCutoff a b p.2) :=
    (signedFootCollarCutoff_smooth a b).contMDiff.comp contMDiff_snd
  exact {
    toFun := fun p => (A.isotopy (signedFootCollarCutoff a b p.2) p.1, p.2)
    invFun := fun p => ((A.isotopy (signedFootCollarCutoff a b p.2)).symm p.1, p.2)
    left_inv := fun p => Prod.ext ((A.isotopy _).symm_apply_apply p.1) rfl
    right_inv := fun p => Prod.ext ((A.isotopy _).apply_symm_apply p.1) rfl
    contMDiff_toFun := (A.smooth.comp (h.prodMk contMDiff_fst)).prodMk contMDiff_snd
    contMDiff_invFun := (A.smooth_symm.comp (h.prodMk contMDiff_fst)).prodMk contMDiff_snd }

theorem signedCollarDiffeomorph_apply (A : SupportedLevelIsotopy I C) (a b : ℝ) (p : L × ℝ) :
    A.signedCollarDiffeomorph a b p = (A.isotopy (signedFootCollarCutoff a b p.2) p.1, p.2) := rfl

theorem signedCollarDiffeomorph_symm_apply (A : SupportedLevelIsotopy I C) (a b : ℝ)
    (p : L × ℝ) : (A.signedCollarDiffeomorph a b).symm p =
      ((A.isotopy (signedFootCollarCutoff a b p.2)).symm p.1, p.2) := rfl

/-- At the outer end of either signed half the forward and inverse lifts are identities. -/
theorem signedCollarDiffeomorph_eq_identity (A : SupportedLevelIsotopy I C) {a b : ℝ}
    (ha : 0 < a) (hab : a < b) {p : L × ℝ} (hp : b ≤ |p.2|) :
    A.signedCollarDiffeomorph a b p = p ∧ (A.signedCollarDiffeomorph a b).symm p = p := by
  rw [signedCollarDiffeomorph_apply, signedCollarDiffeomorph_symm_apply,
    signedFootCollarCutoff_eq_zero ha hab hp, A.start]
  exact ⟨rfl, rfl⟩

/-- On the entire central plateau the lift is precisely the endpoint marking times
the identity, with its inverse given by the inverse endpoint marking. -/
theorem signedCollarDiffeomorph_eq_endpoint (A : SupportedLevelIsotopy I C) {a b : ℝ}
    (ha : 0 < a) (hab : a < b) {p : L × ℝ} (hp : |p.2| ≤ a) :
    A.signedCollarDiffeomorph a b p = (A.isotopy 1 p.1, p.2) ∧
    (A.signedCollarDiffeomorph a b).symm p = ((A.isotopy 1).symm p.1, p.2) := by
  rw [signedCollarDiffeomorph_apply, signedCollarDiffeomorph_symm_apply,
    signedFootCollarCutoff_eq_one ha hab hp]
  exact ⟨rfl, rfl⟩

/-- Every point outside the level support is fixed, for all signed parameters. -/
theorem signedCollarDiffeomorph_fixes_off_support (A : SupportedLevelIsotopy I C) (a b : ℝ)
    {p : L × ℝ} (hp : p.1 ∉ A.support) :
    A.signedCollarDiffeomorph a b p = p ∧ (A.signedCollarDiffeomorph a b).symm p = p := by
  exact ⟨Prod.ext (A.fixes_off_support _ hp) rfl, Prod.ext (A.symm_fixes_off_support _ hp) rfl⟩

theorem signedCollarDiffeomorph_fixes_protected (A : SupportedLevelIsotopy I C) (a b : ℝ)
    {p : L × ℝ} (hp : p.1 ∈ C) :
    A.signedCollarDiffeomorph a b p = p ∧ (A.signedCollarDiffeomorph a b).symm p = p :=
  A.signedCollarDiffeomorph_fixes_off_support a b (fun h => disjoint_left.mp A.disjoint_support h hp)

end SupportedLevelIsotopy
end Product

section CollarCharts

variable {E H L EX HX X EY HY Y : Type*}
  [NormedAddCommGroup E] [NormedSpace ℝ E] [TopologicalSpace H]
  [TopologicalSpace L] [ChartedSpace H L]
  [NormedAddCommGroup EX] [NormedSpace ℝ EX] [TopologicalSpace HX]
  [TopologicalSpace X] [ChartedSpace HX X]
  [NormedAddCommGroup EY] [NormedSpace ℝ EY] [TopologicalSpace HY]
  [TopologicalSpace Y] [ChartedSpace HY Y]
  {I : ModelWithCorners ℝ E H} {IX : ModelWithCorners ℝ EX HX} {IY : ModelWithCorners ℝ EY HY}
  {C : Set L}

namespace SupportedLevelIsotopy

variable (A : SupportedLevelIsotopy I C) (a b : ℝ)
  (χ : PartialDiffeomorph (I.prod 𝓘(ℝ, ℝ)) IX (L × ℝ) X ∞)
  (ψ : PartialDiffeomorph (I.prod 𝓘(ℝ, ℝ)) IY (L × ℝ) Y ∞)

/-- Move the product lift into the ambient charts on the source and target collars. -/
def signedCollarComparison : PartialDiffeomorph IX IY X Y ∞ :=
  χ.symm.trans ((A.signedCollarDiffeomorph a b).toPartialDiffeomorph.trans ψ)

theorem signedCollarComparison_source_target {r : ℝ}
    (hχ : χ.source = {p | p.2 ∈ Ioo (-r) r}) (hψ : ψ.source = {p | p.2 ∈ Ioo (-r) r}) :
    (A.signedCollarComparison a b χ ψ).source = χ.target ∧
    (A.signedCollarComparison a b χ ψ).target = ψ.target := by
  constructor
  · ext x
    change (x ∈ χ.target ∧ χ.symm x ∈ Set.univ ∧
      A.signedCollarDiffeomorph a b (χ.symm x) ∈ ψ.source) ↔ x ∈ χ.target
    refine ⟨And.left, fun hx => ⟨hx, mem_univ _, ?_⟩⟩
    have hp := χ.toPartialEquiv.map_target hx
    rw [hχ] at hp
    rw [hψ]
    exact hp
  · ext y
    change ((y ∈ ψ.target ∧ ψ.symm y ∈ Set.univ) ∧
      (A.signedCollarDiffeomorph a b).symm (ψ.symm y) ∈ χ.source) ↔ y ∈ ψ.target
    refine ⟨fun hy => hy.1.1, fun hy => ⟨⟨hy, mem_univ _⟩, ?_⟩⟩
    have hp := ψ.toPartialEquiv.map_target hy
    rw [hψ] at hp
    rw [hχ]
    exact hp

theorem signedCollarComparison_apply {p : L × ℝ} (hp : p ∈ χ.source) :
    A.signedCollarComparison a b χ ψ (χ p) = ψ (A.signedCollarDiffeomorph a b p) := by
  change ψ (A.signedCollarDiffeomorph a b (χ.symm (χ p))) = _
  rw [χ.symm_apply_apply hp]

theorem signedCollarComparison_symm_apply {p : L × ℝ} (hp : p ∈ ψ.source) :
    (A.signedCollarComparison a b χ ψ).symm (ψ p) =
      χ ((A.signedCollarDiffeomorph a b).symm p) := by
  change χ ((A.signedCollarDiffeomorph a b).symm (ψ.symm (ψ p))) = _
  rw [ψ.symm_apply_apply hp]

/-- A protected tube in product coordinates is sent with its original parametrization in
both directions. For a common ambient collar this fixes every such tube pointwise. -/
theorem signedCollarComparison_protected {T : Set (L × ℝ)}
    (hT : T ⊆ χ.source ∩ ψ.source ∩ {p | p.1 ∈ C}) :
    EqOn ((A.signedCollarComparison a b χ ψ) ∘ χ) ψ T ∧
    EqOn ((A.signedCollarComparison a b χ ψ).symm ∘ ψ) χ T := by
  constructor
  · intro p hp
    have h := hT hp
    change A.signedCollarComparison a b χ ψ (χ p) = ψ p
    rw [A.signedCollarComparison_apply a b χ ψ h.1.1,
      (A.signedCollarDiffeomorph_fixes_protected a b h.2).1]
  · intro p hp
    have h := hT hp
    change (A.signedCollarComparison a b χ ψ).symm (ψ p) = χ p
    rw [A.signedCollarComparison_symm_apply a b χ ψ h.1.2,
      (A.signedCollarDiffeomorph_fixes_protected a b h.2).2]

/-- The comparison has the unchanged collar marking on the two outer regions. -/
theorem signedCollarComparison_end {p : L × ℝ} (ha : 0 < a) (hab : a < b)
    (hχ : p ∈ χ.source) (hψ : p ∈ ψ.source) (hp : b ≤ |p.2|) :
    A.signedCollarComparison a b χ ψ (χ p) = ψ p ∧
    (A.signedCollarComparison a b χ ψ).symm (ψ p) = χ p := by
  have h := A.signedCollarDiffeomorph_eq_identity ha hab hp
  constructor
  · rw [A.signedCollarComparison_apply a b χ ψ hχ, h.1]
  · rw [A.signedCollarComparison_symm_apply a b χ ψ hψ, h.2]

end SupportedLevelIsotopy
end CollarCharts

section OrientedFeet

open DifferentialGeometry DifferentialGeometry.PDE.RicciFlow.Surgery.Topology

variable {L : Type*} [TopologicalSpace L] [ChartedSpace ThreeSpace L]
  [IsManifold ThreeModel ∞ L] [T2Space L] [PreconnectedSpace L]

/-- The pinned ball isotopy matches the full unit-foot coordinates. Its orientation,
radius-two chart room, complement, and disjointness hypotheses are retained. -/
theorem exists_relativeFootLevelIsotopy
    (o : ManifoldOrientation ThreeModel L 3) (e e' : OrientedBallEmbedding L o)
    (C : Set L) (hC : IsCompact C) (hcomp : IsPreconnected Cᶜ)
    (he : Disjoint (e.chart '' Metric.closedBall (0 : ThreeSpace) 1) C)
    (he' : Disjoint (e'.chart '' Metric.closedBall (0 : ThreeSpace) 1) C) :
    ∃ A : SupportedLevelIsotopy ThreeModel C,
      ∀ z ∈ Metric.closedBall (0 : ThreeSpace) 1, A.isotopy 1 (e.chart z) = e'.chart z := by
  obtain ⟨J, K, hK, hKC, hzero, hJ, hJi, hfix, hfixi, hmatch⟩ :=
    OrientedBallEmbedding.exists_isotopy_eqOn_closedBall_of_isPreconnected_compl
      o e e' C hC hcomp he he'
  exact ⟨⟨J, K, hK, hKC, hzero, hJ, hJi, hfix, hfixi⟩, hmatch⟩

variable {EX HX X EY HY Y : Type*}
  [NormedAddCommGroup EX] [NormedSpace ℝ EX] [TopologicalSpace HX]
  [TopologicalSpace X] [ChartedSpace HX X]
  [NormedAddCommGroup EY] [NormedSpace ℝ EY] [TopologicalSpace HY]
  [TopologicalSpace Y] [ChartedSpace HY Y]
  {IX : ModelWithCorners ℝ EX HX} {IY : ModelWithCorners ℝ EY HY}

/-- Two oriented feet in a common level admit a relative comparison of the actual signed
collar charts. It matches all unit-foot coordinates on a central plateau on both sides,
and preserves the parametrizations of the protected tubes and both outer regions. -/
theorem exists_relativeFootSignedCollarComparison
    (o : ManifoldOrientation ThreeModel L 3) (e e' : OrientedBallEmbedding L o)
    (C : Set L) (hC : IsCompact C) (hcomp : IsPreconnected Cᶜ)
    (he : Disjoint (e.chart '' Metric.closedBall (0 : ThreeSpace) 1) C)
    (he' : Disjoint (e'.chart '' Metric.closedBall (0 : ThreeSpace) 1) C)
    (χ : PartialDiffeomorph (ThreeModel.prod 𝓘(ℝ, ℝ)) IX (L × ℝ) X ∞)
    (ψ : PartialDiffeomorph (ThreeModel.prod 𝓘(ℝ, ℝ)) IY (L × ℝ) Y ∞)
    {a b r : ℝ} (ha : 0 < a) (hab : a < b) (hbr : b < r)
    (hχ : χ.source = {p | p.2 ∈ Ioo (-r) r})
    (hψ : ψ.source = {p | p.2 ∈ Ioo (-r) r}) :
    ∃ Φ : PartialDiffeomorph IX IY X Y ∞,
      Φ.source = χ.target ∧ Φ.target = ψ.target ∧
      (∀ z ∈ Metric.closedBall (0 : ThreeSpace) 1, ∀ t : ℝ, |t| ≤ a →
        Φ (χ (e.chart z, t)) = ψ (e'.chart z, t) ∧
        Φ.symm (ψ (e'.chart z, t)) = χ (e.chart z, t)) ∧
      (∀ p : L × ℝ, p.2 ∈ Ioo (-r) r → p.1 ∈ C ∨ b ≤ |p.2| →
        Φ (χ p) = ψ p ∧ Φ.symm (ψ p) = χ p) := by
  obtain ⟨A, hmatch⟩ := exists_relativeFootLevelIsotopy o e e' C hC hcomp he he'
  let Φ := A.signedCollarComparison a b χ ψ
  have hsource_target := A.signedCollarComparison_source_target a b χ ψ hχ hψ
  refine ⟨Φ, hsource_target.1, hsource_target.2, ?_, ?_⟩
  · intro z hz t ht
    have htr : t ∈ Ioo (-r) r := abs_lt.mp (ht.trans_lt (hab.trans hbr))
    have hχz : (e.chart z, t) ∈ χ.source := hχ ▸ htr
    have hψz : (e'.chart z, t) ∈ ψ.source := hψ ▸ htr
    have hmatchInv := congrArg ((A.isotopy 1).symm : L → L) (hmatch z hz)
    rw [Diffeomorph.symm_apply_apply] at hmatchInv
    constructor
    · rw [A.signedCollarComparison_apply a b χ ψ hχz,
        (A.signedCollarDiffeomorph_eq_endpoint ha hab (p := (e.chart z, t)) ht).1, hmatch z hz]
    · rw [A.signedCollarComparison_symm_apply a b χ ψ hψz,
        (A.signedCollarDiffeomorph_eq_endpoint ha hab (p := (e'.chart z, t)) ht).2, ← hmatchInv]
  · intro p hp h
    have hχp : p ∈ χ.source := hχ ▸ hp
    have hψp : p ∈ ψ.source := hψ ▸ hp
    rcases h with hCmem | hend
    · have hfix := A.signedCollarDiffeomorph_fixes_protected a b hCmem
      constructor
      · rw [A.signedCollarComparison_apply a b χ ψ hχp, hfix.1]
      · rw [A.signedCollarComparison_symm_apply a b χ ψ hψp, hfix.2]
    · exact A.signedCollarComparison_end a b χ ψ ha hab hχp hψp hend

end OrientedFeet

end SmoothPoincare
