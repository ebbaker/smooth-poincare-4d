import SmoothPoincare.Heights.RetainedRoundedTrace

/-! # Compare the whole original trace with the retained rounded body -/

open DifferentialGeometry.Topology DifferentialGeometry.Topology.Morse Set
open DifferentialGeometry.Topology.Morse.CellAttachment
open DifferentialGeometry.Topology.Morse.ManifoldCellAttachment
open scoped ContDiff Manifold Topology

namespace SmoothPoincare.IsolatedOneHandle

noncomputable section

variable {H M : Type} [TopologicalSpace H] [TopologicalSpace M] [ChartedSpace H M]
  {J : ModelWithCorners ℝ (MorseModel 4) H} [J.Boundaryless] [IsManifold J ∞ M]
  {f : M → ℝ} {hf : ContMDiff J 𝓘(ℝ, ℝ) ∞ f} {p : M} {lo hi : ℝ}
  (D D' : IsolatedOneHandle hf p lo hi) (C : RetainedRoundedTrace D')

local notation "I₄" => morseModelWithCornersHalfSpace 3
local notation "I₃" => 𝓘(ℝ, MorseModel 3)
local notation "hk₁" => (show (1 : ℕ) ≤ 4 by decide)
local notation "c₀" => f p + D.ε
local notation "c₁" => f p + D'.ε
local notation "Y₀" => SublevelSpace f c₀
local notation "Y₁" => SublevelSpace f c₁
local notation "L₀" => LevelSetSpace f c₀
local notation "L₁" => LevelSetSpace f c₁
local notation "φ₀" => morseAttachingEmbedding hk₁ (f p) D.ε D.r D.chart D.ε_pos D.attaching_radius
local notation "φ₁" => morseAttachingEmbedding hk₁ (f p) D'.ε D'.r D'.chart D'.ε_pos D'.attaching_radius
local notation "T₀" => Handle.AdjunctionSpace 1 3 φ₀
local notation "T₁" => Handle.AdjunctionSpace 1 3 φ₁
local notation "g" => morseRoundedFunction hk₁ (f p) D'.ε D'.r C.δ C.R₀ C.R₁ D'.chart
local notation "Z" => SublevelSpace g (f p)
local notation "ι₀" => regularEndLevelInclusion f c₀
local notation "ι₁" => regularEndLevelInclusion f c₁

set_option maxHeartbeats 800000 in
/-- The same marked upper band compares the actual original trace to the
refined rounded sublevel. The full outgoing equations use its level and body
restrictions, so they hold pointwise on every supplied tube. Transported
refined lower and handle representatives retain the rounded formulas. -/
theorem RetainedRoundedTrace.exists_originalTraceComparison
    (Φ : M ≃ₘ^∞⟮J,J⟯ M)
    (P : RegularEndMarked hf hf D'.upper_regular D.upper_regular Φ) :
    letI := D.traceCharts
    letI := D'.traceCharts
    letI := manifoldSublevelChartedSpace J f c₀ hf D.upper_regular
    letI := manifoldSublevelChartedSpace J f c₁ hf D'.upper_regular
    letI := manifoldSublevelChartedSpace J g (f p) C.smooth C.regular
    letI := manifoldLevelSetChartedSpace J f c₀ hf D.upper_regular
    letI := manifoldLevelSetChartedSpace J f c₁ hf D'.upper_regular
    ∃ (s : Y₁ ≃ₘ^∞⟮I₄,I₄⟯ Y₀) (l : L₁ ≃ₘ^∞⟮I₃,I₃⟯ L₀)
      (F : T₀ ≃ₘ^∞⟮I₄,I₄⟯ Z) (e : T₀ ≃ₘ^∞⟮I₄,I₄⟯ T₁),
      (∀ x, (s x).val = Φ x.val) ∧ (∀ y, (s.symm y).val = Φ.symm y.val) ∧
      (∀ x, (l x).val = Φ x.val) ∧ (∀ y, (l.symm y).val = Φ.symm y.val) ∧
      (∀ z, F z = C.toUpper.symm (s.symm (D.traceDiffeomorph z))) ∧
      (∀ w, F.symm w = D.traceDiffeomorph.symm (s (C.toUpper w))) ∧
      (∀ z, e z = D'.traceDiffeomorph.symm (s.symm (D.traceDiffeomorph z))) ∧
      (∀ z, e.symm z = D.traceDiffeomorph.symm (s (D'.traceDiffeomorph z))) ∧
      (∀ z, F z = C.toRounded (e z)) ∧
      (∀ w, F.symm w = e.symm (C.toRounded.symm w)) ∧
      (∀ y : L₀, F (D.traceDiffeomorph.symm (ι₀ y)) = C.toUpper.symm (ι₁ (l.symm y))) ∧
      (∀ x : L₁, F.symm (C.toUpper.symm (ι₁ x)) = D.traceDiffeomorph.symm (ι₀ (l x))) ∧
      (∀ x : SublevelSpace f (f p - D'.ε),
        (F (e.symm (Handle.lower φ₁ x))).val =
          morseCapRoundedLowerRound hk₁ (f p) D'.ε D'.r C.δ C.θ D'.chart x.val) ∧
      (∀ z : Handle.StandardHandle 1 3, (F (e.symm (Handle.cell φ₁ z))).val =
        handleRoundEmbedding hk₁ (f p) D'.ε D'.r C.δ C.θ D'.chart z) := by
  let _ := D.traceCharts
  let _ := D'.traceCharts
  let _ := manifoldSublevelChartedSpace J f c₀ hf D.upper_regular
  let _ := manifoldSublevelChartedSpace J f c₁ hf D'.upper_regular
  let _ := manifoldSublevelChartedSpace J g (f p) C.smooth C.regular
  let _ := manifoldLevelSetChartedSpace J f c₀ hf D.upper_regular
  let _ := manifoldLevelSetChartedSpace J f c₁ hf D'.upper_regular
  obtain ⟨s, l, hsf, hsi, hlf, hli, hsq, hsqinv, -, -⟩ := P
  let F := D.traceDiffeomorph.trans (s.symm.trans C.toUpper.symm)
  let e := D.traceDiffeomorph.trans (s.symm.trans D'.traceDiffeomorph.symm)
  have hf (z : T₀) : F z = C.toRounded (e z) := by
    let y := s.symm (D.traceDiffeomorph z)
    change C.toUpper.symm y = C.toRounded (D'.traceDiffeomorph.symm y)
    calc
      C.toUpper.symm y = C.toRounded (C.toRounded.symm (C.toUpper.symm y)) :=
        (C.toRounded.apply_symm_apply _).symm
      _ = C.toRounded (D'.traceDiffeomorph.symm y) :=
        congrArg C.toRounded ((RetainedRoundedTrace.inverse C y).symm)
  have hfi (w : Z) : F.symm w = e.symm (C.toRounded.symm w) := by
    apply F.injective
    calc
      F (F.symm w) = w := F.apply_symm_apply w
      _ = C.toRounded (C.toRounded.symm w) := (C.toRounded.apply_symm_apply w).symm
      _ = C.toRounded (e (e.symm (C.toRounded.symm w))) :=
        (congrArg C.toRounded (e.apply_symm_apply (C.toRounded.symm w))).symm
      _ = F (e.symm (C.toRounded.symm w)) := (hf _).symm
  have hlevel (y : L₀) :
      F (D.traceDiffeomorph.symm (ι₀ y)) = C.toUpper.symm (ι₁ (l.symm y)) := by
    change C.toUpper.symm (s.symm (D.traceDiffeomorph (D.traceDiffeomorph.symm (ι₀ y)))) = _
    calc
      _ = C.toUpper.symm (s.symm (ι₀ y)) :=
        congrArg (fun x => C.toUpper.symm (s.symm x)) (D.traceDiffeomorph.apply_symm_apply (ι₀ y))
      _ = _ := congrArg C.toUpper.symm (hsqinv y)
  have hlevelinv (x : L₁) :
      F.symm (C.toUpper.symm (ι₁ x)) = D.traceDiffeomorph.symm (ι₀ (l x)) := by
    change D.traceDiffeomorph.symm (s (C.toUpper (C.toUpper.symm (ι₁ x)))) = _
    calc
      _ = D.traceDiffeomorph.symm (s (ι₁ x)) :=
        congrArg (fun y => D.traceDiffeomorph.symm (s y)) (C.toUpper.apply_symm_apply (ι₁ x))
      _ = _ := congrArg D.traceDiffeomorph.symm (hsq x)
  have hrep (z : T₁) : F (e.symm z) = C.toRounded z :=
    (hf _).trans (congrArg C.toRounded (e.apply_symm_apply z))
  exact ⟨s,l,F,e,hsf,hsi,hlf,hli,fun _ => rfl,fun _ => rfl,fun _ => rfl,fun _ => rfl,
    hf,hfi,hlevel,hlevelinv,
    fun x => (congrArg Subtype.val (hrep (Handle.lower φ₁ x))).trans (C.lower_point x),
    fun z => (congrArg Subtype.val (hrep (Handle.cell φ₁ z))).trans (C.cell_point z)⟩

end

end SmoothPoincare.IsolatedOneHandle
