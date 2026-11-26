import SmoothPoincare.Heights.RetainedOutgoingCollar
import DifferentialGeometry.Topology.Manifold.HalfCollarExtension
import DifferentialGeometry.Topology.Morse.SublevelInclusion

/-! # Two-sided extension of the actual retained inward collar -/

open DifferentialGeometry.Topology DifferentialGeometry.Topology.Morse Set
open DifferentialGeometry.Topology.Morse.ManifoldCellAttachment
open scoped ContDiff Manifold Topology

namespace SmoothPoincare.IsolatedOneHandle

variable {H M : Type} [TopologicalSpace H] [TopologicalSpace M] [ChartedSpace H M]
  {J : ModelWithCorners ℝ (MorseModel 4) H} [J.Boundaryless] [IsManifold J ∞ M]
  [T2Space M] [CompactSpace M]
  {f : M → ℝ} {hf : ContMDiff J 𝓘(ℝ, ℝ) ∞ f} {p : M} {lo hi : ℝ}
  {D : IsolatedOneHandle hf p lo hi} (C : RetainedRoundedTrace D)

local notation "I₄" => morseModelWithCornersHalfSpace 3
local notation "K" => 𝓘(ℝ, MorseModel 3)
local notation "Kℝ" => ModelWithCorners.prod K 𝓘(ℝ, ℝ)
local notation "K₊" => ModelWithCorners.prod K (𝓡∂ 1)
local notation "hk₁" => (show (1 : ℕ) ≤ 4 by decide)
local notation "g" => morseRoundedFunction hk₁ (f p) D.ε D.r C.δ C.R₀ C.R₁ D.chart
local notation "c" => f p + D.ε
local notation "L" => LevelSetSpace g (f p)
local notation "ι" => regularEndLevelInclusion g (f p)

/-- Extend the actual inward collar induced by the retained body map.
The normal coordinate is signed rounded height on the source. The target
collar follows the retained map on its full inward half. -/
theorem RetainedRoundedTrace.exists_twoSidedCollar_extending_toUpper
    (w : ℝ) (hw : 0 < w) :
    letI := manifoldLevelSetChartedSpace J g (f p) C.smooth C.regular
    letI := manifoldSublevelChartedSpace J g (f p) C.smooth C.regular
    letI := manifoldSublevelChartedSpace J f c hf D.upper_regular
    ∀ (A : PartialDiffeomorph Kℝ J (L × ℝ) M ∞),
      A.source = {q | q.2 ∈ Ioo (-w) w} →
      (∀ x : L, A (x,0) = x.val) →
      (∀ q ∈ A.source, g (A q) = f p + q.2) →
      ∃ B : SmoothTwoSidedCollar K J (fun x : L => (C.toUpper (ι x)).val),
        B.radius ≤ w ∧
        ∀ (x : L) (s : symmetricOpenInterval B.radius), 0 ≤ s.val →
          ∃ (hx : g (A (x,-s.val)) ≤ f p) (hy : f (B.toFun (x,s)) ≤ c),
            B.toFun (x,s) = (C.toUpper ⟨A (x,-s.val),hx⟩).val ∧
            (C.toUpper.symm ⟨B.toFun (x,s),hy⟩).val = A (x,-s.val) := by
  let := manifoldLevelSetChartedSpace J g (f p) C.smooth C.regular
  let := manifoldLevelSetIsManifold J g (f p) C.smooth C.regular
  let := manifoldSublevelChartedSpace J g (f p) C.smooth C.regular
  let := manifoldSublevelIsManifold J g (f p) C.smooth C.regular
  let := manifoldSublevelChartedSpace J f c hf D.upper_regular
  let := D.upper_isManifold
  let := Manifold.halfClosedIntervalChartedSpace hw
  let := Manifold.halfClosedInterval_isManifold hw
  let _ : CompactSpace L := isCompact_iff_compactSpace.mp
    (isClosed_eq C.smooth.continuous continuous_const).isCompact
  intro A hAs hA0 hAh
  let E := C.toUpper
  let e : L × Ico (0 : ℝ) w → L × ℝ := Prod.map id (-(Subtype.val : Ico (0 : ℝ) w → ℝ))
  have he (q : L × Ico (0 : ℝ) w) : e q ∈ A.source := by
    rw [hAs]
    exact ⟨neg_lt_neg q.2.property.2, (neg_nonpos.mpr q.2.property.1).trans_lt hw⟩
  let F : L × Ico (0 : ℝ) w → SublevelSpace g (f p) :=
    fun q => ⟨A (e q), (hAh _ (he q)).le.trans (add_le_of_nonpos_right (neg_nonpos.mpr q.2.property.1))⟩
  let G : L × Ico (0 : ℝ) w → M := (fun y : SublevelSpace f c => y.val) ∘ E ∘ F
  have hj := Manifold.isSmoothEmbedding_halfClosedInterval_inclusion hw
  have heSmooth : ContMDiff K₊ Kℝ ∞ e := contMDiff_id.prodMap hj.contMDiff.neg
  have hA (q : L × Ico (0 : ℝ) w) : ContMDiffAt Kℝ J ∞ A (e q) :=
    A.contMDiffOn_toFun.contMDiffAt (A.open_source.mem_nhds (he q))
  have hFambient : ContMDiff K₊ J ∞ (A ∘ e) :=
    fun q => (hA q).comp q (heSmooth q)
  have hF : ContMDiff K₊ I₄ ∞ F :=
    contMDiff_sublevelCorestrict J g (f p) C.smooth C.regular _ hFambient (fun q => (F q).property)
  have hGc := contMDiff_manifoldSublevelInclusion J f c hf D.upper_regular
  have hG : ContMDiff K₊ J ∞ G := hGc.comp (E.contMDiff.comp hF)
  have hF0 (x : L) : F (x, ⟨0,le_rfl,hw⟩) = ι x := by
    apply Subtype.ext
    change A (x, -(0 : ℝ)) = x.val
    rw [neg_zero, hA0]
  have hG0 (x : L) : G (x, ⟨0,le_rfl,hw⟩) = (E (ι x)).val :=
    congrArg (fun y : SublevelSpace g (f p) => (E y).val) (hF0 x)
  have hinj : Function.Injective (fun x : L => G (x, ⟨0,le_rfl,hw⟩)) := by
    intro x y hxy
    change G (x, ⟨0,le_rfl,hw⟩) = G (y, ⟨0,le_rfl,hw⟩) at hxy
    rw [hG0, hG0] at hxy
    exact Subtype.ext (congrArg (fun z : SublevelSpace g (f p) => z.val)
      (E.injective (Subtype.ext hxy)))
  have hderiv (q : L × Ico (0 : ℝ) w) : Function.Bijective (mfderiv K₊ J G q) := by
    have hs := hj.contMDiff.mdifferentiableAt (x := q.2) (by simp)
    have hjs : Function.Bijective (mfderiv (𝓡∂ 1) 𝓘(ℝ, ℝ)
        (Subtype.val : Ico (0 : ℝ) w → ℝ) q.2) :=
      Manifold.bijective_mfderiv_of_isImmersionAt (𝓡∂ 1) 𝓘(ℝ, ℝ) _ _
        (hj.isImmersion.isImmersionAt _) (by simp)
    have hneg : Function.Bijective (mfderiv (𝓡∂ 1) 𝓘(ℝ, ℝ)
        (-(Subtype.val : Ico (0 : ℝ) w → ℝ)) q.2) := by
      rw [mfderiv_neg]
      exact (Equiv.neg ℝ).bijective.comp hjs
    have hde : Function.Bijective (mfderiv K₊ Kℝ e q) := by
      rw [show e = Prod.map id (-(Subtype.val : Ico (0 : ℝ) w → ℝ)) from rfl,
        mfderiv_prodMap mdifferentiableAt_id hs.neg, mfderiv_id]
      exact Function.bijective_id.prodMap hneg
    have hdA := ((A.isLocalDiffeomorphAt Kℝ J ∞ (he q)).mfderivToContinuousLinearEquiv
      (by simp)).bijective
    have hcomp : Function.Bijective (mfderiv K₊ J (A ∘ e) q) := by
      rw [mfderiv_comp q ((hA q).mdifferentiableAt (by simp))
        ((heSmooth q).mdifferentiableAt (by simp))]
      exact hdA.comp hde
    have hFc := contMDiff_manifoldSublevelInclusion J g (f p) C.smooth C.regular
    change Function.Bijective (mfderiv K₊ J ((fun y : SublevelSpace g (f p) => y.val) ∘ F) q) at hcomp
    rw [mfderiv_comp q ((hFc (F q)).mdifferentiableAt (by simp))
      ((hF q).mdifferentiableAt (by simp))] at hcomp
    change Function.Bijective
      (⇑(mfderiv I₄ J (fun y : SublevelSpace g (f p) => y.val) (F q)) ∘
        ⇑(mfderiv K₊ I₄ F q)) at hcomp
    have hdF := Function.Bijective.of_comp_left hcomp
      (mfderiv_manifoldSublevelInclusion_bijective J g (f p) C.smooth C.regular (F q)).injective
    rw [show G = (fun y : SublevelSpace f c => y.val) ∘ (E ∘ F) from rfl,
      mfderiv_comp q ((hGc (E (F q))).mdifferentiableAt (by simp))
        ((E.contMDiff.comp hF q).mdifferentiableAt (by simp)),
      mfderiv_comp q ((E.contMDiff (F q)).mdifferentiableAt (by simp))
        ((hF q).mdifferentiableAt (by simp))]
    exact (mfderiv_manifoldSublevelInclusion_bijective J f c hf D.upper_regular (E (F q))).comp
      (((E.mfderivToContinuousLinearEquiv (by simp) (F q)).bijective).comp hdF)
  obtain ⟨B, hBw, hB⟩ := exists_smoothTwoSidedCollar_of_halfClosedInterval
    hw G hG hinj (fun x => hderiv (x, ⟨0,le_rfl,hw⟩))
  let B' : SmoothTwoSidedCollar K J (fun x : L => (E (ι x)).val) :=
    { radius := B.radius, radius_pos := B.radius_pos, neighborhood := B.neighborhood,
      toDiffeomorph := B.toDiffeomorph, zero_eq := fun x => (B.zero_eq x).trans (hG0 x) }
  refine ⟨B', hBw, ?_⟩
  intro x s hs
  let q : L × Ico (0 : ℝ) w := (x, ⟨s.val,hs,s.property.2.trans_le hBw⟩)
  have hEq : B'.toFun (x,s) = (E (F q)).val := hB (x,s) hs
  refine ⟨(F q).property, hEq.symm ▸ (E (F q)).property, hEq, ?_⟩
  have hSub : (⟨B'.toFun (x,s), hEq.symm ▸ (E (F q)).property⟩ : SublevelSpace f c) =
      E (F q) := Subtype.ext hEq
  rw [hSub,E.symm_apply_apply]
  rfl

end SmoothPoincare.IsolatedOneHandle
