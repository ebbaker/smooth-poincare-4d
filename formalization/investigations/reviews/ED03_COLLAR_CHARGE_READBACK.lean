import SmoothPoincare

/-! # Independent downstream checks of the E43 public declarations -/

open DifferentialGeometry.Topology Set
open SmoothPoincare
open scoped ContDiff Manifold Topology

namespace CollarChargeReadback

section Ball

local instance : ChartedSpace (EuclideanHalfSpace 4) (ClosedCell 4) :=
  Handle.closedCellChartedSpaceSucc 3

#check @exists_markedPatchDiffeomorph_of_unitBallCover
#print axioms exists_markedPatchDiffeomorph_of_unitBallCover

/-- Two proper relative patches, one containing the center and the other
the sphere, cover the literal closed unit ball. No target cover or inverse
overlap equation is given to the theorem. -/
theorem actual_unit_ball_covered_by_two_proper_patches :
    ∃ (P : Bool → PartialDiffeomorph (𝓡∂ 4) (𝓡∂ 4) (ClosedCell 4) (ClosedCell 4) ∞)
      (C : ClosedCell 4 ≃ₘ^∞⟮𝓡∂ 4,𝓡∂ 4⟯ ClosedCell 4),
      (∀ i, (P i).source ≠ univ) ∧
      (⋃ i, (P i).target) = univ ∧
      (∀ i, EqOn C (P i) (P i).source ∧ EqOn C.symm (P i).symm (P i).target) ∧
      (∀ x, C x = x ∧ C.symm x = x) := by
  let S : Bool → Set (ClosedCell 4) := fun i =>
    if i then {x | ‖x.val‖ < 3 / 4} else {x | 1 / 4 < ‖x.val‖}
  have hS (i : Bool) : IsOpen (S i) := by
    cases i
    · exact isOpen_lt continuous_const continuous_subtype_val.norm
    · exact isOpen_lt continuous_subtype_val.norm continuous_const
  have hCover (x : ClosedCell 4) : ∃ i, x ∈ S i := by
    by_cases h : ‖x.val‖ < (3 : ℝ) / 4
    · exact ⟨true, h⟩
    · exact ⟨false, show (1 : ℝ) / 4 < ‖x.val‖ by linarith⟩
  let D := (Diffeomorph.refl (𝓡∂ 4) (ClosedCell 4) ∞).toPartialDiffeomorph
  let P := fun i => DifferentialGeometry.Topology.PartialDiffeomorph.restrict D (S i) (hS i)
  have hSource (i : Bool) : (P i).source = S i := univ_inter _
  have hCover' (x : ClosedCell 4) : ∃ i, x ∈ (P i).source := by
    simpa only [hSource] using hCover x
  have hForward (i j : Bool) : EqOn (P i) (P j) ((P i).source ∩ (P j).source) :=
    fun _ _ => rfl
  letI : ConnectedSpace (ClosedCell 4) := by
    apply isConnected_iff_connectedSpace.mp
    exact convex_closedBall (0 : EuclideanSpace ℝ (Fin 4)) (1 : ℝ) |>.isConnected
      ⟨0, by simp⟩
  obtain ⟨C, hEq, hTarget⟩ := exists_markedPatchDiffeomorph_of_unitBallCover P hCover' hForward
  refine ⟨P, C, ?_, hTarget, hEq, ?_⟩
  · intro i
    rw [hSource]
    cases i
    · intro h
      let x : ClosedCell 4 := ⟨0, by simp⟩
      have hn : (1 : ℝ) / 4 < ‖x.val‖ := h.symm ▸ mem_univ x
      norm_num [x] at hn
    · intro h
      let u : EuclideanSpace ℝ (Fin 4) := PiLp.single 2 (0 : Fin 4) 1
      have hn : ‖u‖ = 1 := by simp [u, PiLp.norm_single]
      let x : ClosedCell 4 := ⟨u, by simpa [Metric.mem_closedBall, dist_zero_right, hn]⟩
      have hx : ‖u‖ < (3 : ℝ) / 4 := h.symm ▸ mem_univ x
      norm_num [hn] at hx
  · intro x
    obtain ⟨i, hx⟩ := hCover' x
    have hCx : C x = x := (hEq i).1 hx
    exact ⟨hCx, by rw [← hCx, C.symm_apply_apply]⟩

#print axioms actual_unit_ball_covered_by_two_proper_patches

end Ball

section Collar

open DifferentialGeometry.Topology.Morse DifferentialGeometry.Topology.Morse.ManifoldCellAttachment

#check @IsolatedOneHandle.RetainedRoundedTrace.exists_outgoingCollarComparison
#print axioms IsolatedOneHandle.RetainedRoundedTrace.exists_outgoingCollarComparison

variable {H M : Type} [TopologicalSpace H] [TopologicalSpace M] [ChartedSpace H M]
  {J : ModelWithCorners ℝ (MorseModel 4) H} [J.Boundaryless] [IsManifold J ∞ M]
  [T2Space M] [CompactSpace M]
  {f : M → ℝ} {hf : ContMDiff J 𝓘(ℝ, ℝ) ∞ f} {p : M} {lo hi : ℝ}
  {D : IsolatedOneHandle hf p lo hi} (C : IsolatedOneHandle.RetainedRoundedTrace D)

local notation "K" => 𝓘(ℝ, MorseModel 3)
local notation "Kℝ" => ModelWithCorners.prod K 𝓘(ℝ, ℝ)
local notation "g" => morseRoundedFunction (show (1 : ℕ) ≤ 4 by decide)
  (f p) D.ε D.r C.δ C.R₀ C.R₁ D.chart
local notation "c" => f p + D.ε
local notation "Lᵣ" => LevelSetSpace g (f p)
local notation "L₀" => LevelSetSpace f c
local notation "strip(" r ")" => ((univ : Set Lᵣ) ×ˢ Ioo (-r) r)

/-- At every parameter of an arbitrary marked family the exact overlapping
germs compare in both directions. The signed inverse carries calibrated
heights on a whole common strip and preserves its side of the cut. -/
theorem outgoing_actual_and_calibrated_tubes {A : Type*} (u : A → Lᵣ) :
    letI := manifoldLevelSetChartedSpace J g (f p) C.smooth C.regular
    letI := manifoldLevelSetChartedSpace J f c hf D.upper_regular
    ∃ (r : ℝ) (F P : PartialDiffeomorph Kℝ J (Lᵣ × ℝ) M ∞)
      (T : PartialDiffeomorph Kℝ Kℝ (Lᵣ × ℝ) (Lᵣ × ℝ) ∞),
      0 < r ∧ ∀ a (t : ℝ), t ∈ Ioo (-r) r →
        (u a,t) ∈ T.source ∩ T.target ∧
        P (T (u a,t)) = F (u a,t) ∧ (T (u a,t)).2 = f (F (u a,t)) - c ∧
        F (T.symm (u a,t)) = P (u a,t) ∧ f (F (T.symm (u a,t))) = c + t ∧
        ((T (u a,t)).2 < 0 ↔ t < 0) ∧ (0 < (T.symm (u a,t)).2 ↔ 0 < t) := by
  letI := manifoldLevelSetChartedSpace J g (f p) C.smooth C.regular
  letI := manifoldLevelSetChartedSpace J f c hf D.upper_regular
  obtain ⟨w,hw,A,B,hAs,hBs,_,_,hA0,hB0,hAh,hBh⟩ := exists_nativeSignedHeightCollar_pair
    C.smooth C.regular (C.outgoingLevel.symm D.outgoingAxisPoint)
    hf D.upper_regular D.outgoingAxisPoint
  obtain ⟨r,F,P,T,hr,_,_,_,_,_,hStrip,_,hForward,hInverse,_⟩ :=
    C.exists_outgoingCollarComparison w hw A B hAs hBs hA0 hB0 hAh hBh
  refine ⟨r,F,P,T,hr, fun a t ht => ?_⟩
  have hq : (u a,t) ∈ T.source ∩ T.target := hStrip ⟨mem_univ _,ht⟩
  obtain ⟨hP, hFheight, hFside, _⟩ := hForward _ hq.1
  obtain ⟨hF, hPheight, _, hPside⟩ := hInverse _ hq.2
  exact ⟨hq,hP,hFheight,hF,hPheight,hFside,hPside⟩

#print axioms outgoing_actual_and_calibrated_tubes

end Collar

end CollarChargeReadback
