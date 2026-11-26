import SmoothPoincare

/-! # Independent downstream checks of the E43 public declarations -/

open DifferentialGeometry.Topology Set
open SmoothPoincare
open scoped ContDiff Manifold Topology

namespace CollarChargeReadback

section Ball

noncomputable local instance : ChartedSpace (EuclideanHalfSpace 4) (ClosedCell 4) :=
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
  let : ConnectedSpace (ClosedCell 4) := by
    have hConvex : Convex ℝ ({x : EuclideanSpace ℝ (Fin 4) | ‖x‖ ≤ 1} : Set _) := by
      simpa only [Metric.closedBall, dist_zero_right] using
        convex_closedBall (0 : EuclideanSpace ℝ (Fin 4)) (1 : ℝ)
    exact isConnected_iff_connectedSpace.mp (hConvex.isConnected ⟨0, by simp⟩)
  obtain ⟨C, hEq, hTarget⟩ := exists_markedPatchDiffeomorph_of_unitBallCover P hCover' hForward
  refine ⟨P, C, ?_, hTarget, hEq, ?_⟩
  · intro i
    rw [hSource]
    cases i
    · intro h
      let x : ClosedCell 4 := ⟨0, by simp⟩
      have hx : x ∈ S false := h.symm ▸ mem_univ x
      have hn : (1 : ℝ) / 4 < ‖x.val‖ := hx
      norm_num [x] at hn
    · intro h
      let u : EuclideanSpace ℝ (Fin 4) := PiLp.single 2 (0 : Fin 4) 1
      have hn : ‖u‖ = 1 := by simp [u, PiLp.norm_single]
      let x : ClosedCell 4 := ⟨u, hn.le⟩
      have hxSet : x ∈ S true := h.symm ▸ mem_univ x
      have hx : ‖u‖ < (3 : ℝ) / 4 := hxSet
      norm_num [hn] at hx
  · intro x
    obtain ⟨i, hx⟩ := hCover' x
    have hCx : C x = x := (hEq i).1 hx
    exact ⟨hCx, (congrArg C.symm hCx).symm.trans (C.symm_apply_apply x)⟩

#print axioms actual_unit_ball_covered_by_two_proper_patches

#check @markedEdgeModelFlatten_images
#print axioms markedEdgeModelFlatten_images

local notation "V" => EuclideanSpace ℝ (Fin 4)
local notation "flatten" => markedEdgeModelFlatten (show (1 : ℝ) < 2 by norm_num)

/-- One independently chosen double-well body covers the whole unit ball,
and the actual inverse sends every point of its sphere to the exact
chosen outgoing height. -/
theorem independently_chosen_double_well_body_and_whole_outgoing_level :
    flatten '' (markedEdgeModelHeight ⁻¹' Iic ((2 : ℝ) ^ 2)) = Metric.closedBall (0 : V) 1 ∧
    ∀ y ∈ Metric.sphere (0 : V) 1,
      markedEdgeModelHeight ((flatten).symm y) = (2 : ℝ) ^ 2 := by
  obtain ⟨hBall, hSphere⟩ := markedEdgeModelFlatten_images (show (1 : ℝ) < 2 by norm_num)
  refine ⟨hBall, fun y hy => ?_⟩
  rw [← hSphere] at hy
  obtain ⟨x,hx, hxy⟩ := hy
  have hi := (flatten).symm_apply_apply x
  rw [hxy] at hi
  exact (congrArg markedEdgeModelHeight hi).trans hx

#print axioms independently_chosen_double_well_body_and_whole_outgoing_level

#check @markedEdgeRoundBallCollar_coordinates
#print axioms markedEdgeRoundBallCollar_coordinates

local instance : Fact (Module.finrank ℝ V = 3 + 1) := ⟨by simp⟩

/-- The independently specified ball carries an arbitrary sphere marking
on the full signed collar. Its inward half lies on the actual ball side. -/
theorem independent_model_collar_recovers_all_parameters
    (v : Metric.sphere (0 : V) 1) {A : Type*} (u : A → Metric.sphere (0 : V) 1) :
    let C := markedEdgeRoundBallCollar v (show (1 : ℝ) < 2 by norm_num)
      (show (1 : ℝ) < 2 ^ 2 - 1 by norm_num)
    ∀ a t, t ∈ Ioo (-1 : ℝ) 1 →
      C (u a,0) = (u a).val ∧
      markedEdgeModelHeight ((flatten).symm (C (u a,t))) = 2 ^ 2 + t ∧
      (‖C (u a,t)‖ ≤ 1 ↔ t ≤ 0) ∧ C.symm (C (u a,t)) = (u a,t) := by
  intro C a t ht
  obtain ⟨hSource,_,hZero,hForward⟩ := markedEdgeRoundBallCollar_coordinates v
    (show (1 : ℝ) < 2 by norm_num) (show (1 : ℝ) < 2 ^ 2 - 1 by norm_num)
  have hMem : (u a,t) ∈ C.source := by rw [hSource]; exact ht
  exact ⟨hZero (u a), hForward (u a,t) hMem⟩

#print axioms independent_model_collar_recovers_all_parameters

end Ball

section Collar

open DifferentialGeometry.Topology.Morse DifferentialGeometry.Topology.Morse.ManifoldCellAttachment

#check @IsolatedOneHandle.RetainedRoundedTrace.exists_outgoingCollarComparison
#print axioms IsolatedOneHandle.RetainedRoundedTrace.exists_outgoingCollarComparison
#check @IsolatedOneHandle.RetainedRoundedTrace.exists_outgoingCollarComparison_toNextCut
#print axioms IsolatedOneHandle.RetainedRoundedTrace.exists_outgoingCollarComparison_toNextCut

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
local notation "L₁" => LevelSetSpace f hi

/-- At every parameter of an arbitrary marked family, the calibrated
coordinates give exact heights at both cuts and recover the retained
body point and its inverse throughout the inward overlap. -/
theorem outgoing_actual_and_calibrated_tubes
    (hUnique : ∀ x, f x ∈ Icc lo hi → IsCriticalPointAt J f x → x = p)
    {U : Type*} (u : U → Lᵣ) :
    letI := manifoldLevelSetChartedSpace J g (f p) C.smooth C.regular
    letI := manifoldLevelSetChartedSpace J f c hf D.upper_regular
    letI := manifoldLevelSetChartedSpace J f hi hf (D.outgoingNextCut_regular hUnique)
    letI := manifoldSublevelChartedSpace J g (f p) C.smooth C.regular
    letI := manifoldSublevelChartedSpace J f c hf D.upper_regular
    ∃ (r : ℝ) (F R : PartialDiffeomorph Kℝ J (Lᵣ × ℝ) M ∞)
      (T : PartialDiffeomorph Kℝ Kℝ (Lᵣ × ℝ) (Lᵣ × ℝ) ∞)
      (E : PartialDiffeomorph Kℝ J (L₁ × ℝ) M ∞)
      (l : L₀ ≃ₘ^∞⟮K,K⟯ L₁) (Q : PartialDiffeomorph J J M M ∞),
      0 < r ∧ ∀ a (t : ℝ), t ∈ Ioo (-r) r →
        let q := (u a,t)
        let z := E (l (C.outgoingLevel (u a)),t)
        q ∈ T.source ∩ T.target ∧ z ∈ Q.target ∧
        f (F (T.symm q)) = c + t ∧ f z = hi + t ∧
        Q (F (T.symm q)) = z ∧ Q.symm z = F (T.symm q) ∧
        ((T.symm q).2 < 0 ↔ t < 0) ∧ (0 < (T.symm q).2 ↔ 0 < t) ∧
        (t ≤ 0 → ∃ (hx : g (R q) ≤ f p) (hy : f (F (T.symm q)) ≤ c),
          F (T.symm q) = (C.toUpper ⟨R q,hx⟩).val ∧
          (C.toUpper.symm ⟨F (T.symm q),hy⟩).val = R q) := by
  let _ := manifoldLevelSetChartedSpace J g (f p) C.smooth C.regular
  let _ := manifoldLevelSetChartedSpace J f c hf D.upper_regular
  let _ := manifoldLevelSetChartedSpace J f hi hf (D.outgoingNextCut_regular hUnique)
  let _ := manifoldSublevelChartedSpace J g (f p) C.smooth C.regular
  let _ := manifoldSublevelChartedSpace J f c hf D.upper_regular
  obtain ⟨r,_,F,R,T,E,l,Q,hr,_,_,_,hStrip,_,_,hInverse,hInward⟩ :=
    C.exists_outgoingCollarComparison_toNextCut hUnique
  refine ⟨r,F,R,T,E,l,Q,hr, fun a t ht => ?_⟩
  have hq : (u a,t) ∈ T.source ∩ T.target := hStrip ⟨mem_univ _,ht⟩
  obtain ⟨hNeg,hPos,hz,hF,hE,hQE,hEQ,_⟩ := hInverse (u a,t) hq.2
  exact ⟨hq,hz,hF,hE,hQE,hEQ,hNeg,hPos,hInward (u a,t) hq.2⟩

#print axioms outgoing_actual_and_calibrated_tubes

end Collar

section Controls

open DifferentialGeometry.Topology.Handle DifferentialGeometry.Topology.Manifold
  SmoothPoincare.ClosedMarkedControl SmoothPoincare.StandardSurgeryModel

local notation "ControlCircle" => ClosedMarkedControl.Circle
local notation "ControlDisk" => ClosedMarkedControl.Disk

#check @splitExterior_torus
#print axioms splitExterior_torus
#check @splitTorusCollar_transport
#print axioms splitTorusCollar_transport
#check @slid_dualTube_and_inverse
#print axioms slid_dualTube_and_inverse
#check @slidClosedAssembly_representatives
#print axioms slidClosedAssembly_representatives
#check @exists_splitClosingHomeomorph
#print axioms exists_splitClosingHomeomorph

/-- The split spectator's entire marked torus has the paired exterior
coordinates, including their precise inverse at the fixed control radius. -/
theorem split_spectator_recovers_the_two_torus_parameters (q₀ z w : ControlCircle) :
    let ε := (1/2 : ℝ)
    let E := splitExteriorCoordinates (show 0 < ε by norm_num [ε])
      (show ε < 1 by norm_num [ε]) q₀
    let y := splitSpectatorTube (show 0 < ε by norm_num [ε])
      (show ε < 1 by norm_num [ε]) (z,onBoundary w)
    ∃ h : y ∈ splitExterior ε, E.symm ⟨y,h⟩ = (onBoundary z,w) := by
  intro ε E y
  have hMark := splitExterior_torus (show 0 < ε by norm_num [ε])
    (show ε < 1 by norm_num [ε]) q₀ z w
  have hY : y ∈ splitExterior ε := by
    rw [← show (E (onBoundary z,w)).val = y from hMark]
    exact (E (onBoundary z,w)).property
  have hEq : E (onBoundary z,w) = ⟨y,hY⟩ := Subtype.ext hMark
  exact ⟨hY, by rw [← hEq, E.symm_apply_apply]⟩

#print axioms split_spectator_recovers_the_two_torus_parameters

local instance : Fact (Module.finrank ℝ (Block 1) = 1 + 1) := ⟨by simp⟩
local instance : Fact (Module.finrank ℝ (Ambient 1 1) = (1 + 1 + 1) + 1) := ⟨by
  rw [(WithLp.prodContinuousLinearEquiv 2 ℝ (Block 1) (Block 1)).toLinearEquiv.finrank_eq,
    Module.finrank_prod]
  simp only [finrank_euclideanSpace_fin]⟩

/-- The actual torus collar retains the zero section and the complete
angular and signed parameters throughout its positive-width domain. -/
theorem split_spectator_open_collar_has_both_signed_sides
    (z₀ w₀ z w : ControlCircle) :
    let C := splitTorusCollar (1/2 : ℝ) z₀ w₀
    ∀ t ∈ Ioo (-((1/2 : ℝ)^2)) (1 - (1/2 : ℝ)^2),
      C ((z,w),0) = splitSpectatorTube (by norm_num : 0 < (1/2 : ℝ))
        (by norm_num) (z,onBoundary w) ∧
      C.symm (C ((z,w),t)) = ((z,w),t) ∧
      ‖(C ((z,w),t)).val.snd‖ ^ 2 = (1/2 : ℝ) ^ 2 + t ∧
      (C ((z,w),t) ∈ splitExterior (1/2) ↔ 0 ≤ t) := by
  intro C t ht
  have hp : ((z,w),t) ∈ C.source := by
    rw [show C.source = _ from (splitTorusCollar_domains (1/2) z₀ w₀).1]
    exact ht
  exact ⟨splitTorusCollar_at_zero (by norm_num : 0 < (1/2 : ℝ)) (by norm_num) z₀ w₀ z w,
    splitTorusCollar_transport (by norm_num : 0 < (1/2 : ℝ)) z₀ w₀ ((z,w),t) hp⟩

#print axioms split_spectator_open_collar_has_both_signed_sides

/-- In a supplied slid trace comparison using the same boundary map in
both pieces, the full transported dual tube and its coordinate inverse
agree on the upper side, whose representatives are fixed in both directions. -/
theorem slid_spectator_and_upper_piece_are_carried_by_one_closing_map
    {X X' Y Y' U Q : Type*} [TopologicalSpace X] [TopologicalSpace X']
    [TopologicalSpace Y] [TopologicalSpace Y'] [TopologicalSpace U] [TopologicalSpace Q]
    (F : X' ≃ₜ X) (Fb : Y' ≃ₜ Y) (γ : Y ≃ₜ U)
    (j' : Y' → X') (j : Y → X) (k : U → Q) (hF : ∀ y, F (j' y) = j (Fb y))
    (b : ControlDisk × ControlCircle → Y) (b' : ControlDisk × ControlCircle → Y') (bInv : Y → ControlDisk × ControlCircle)
    (hb : Function.LeftInverse bInv b) (hMark : ∀ v, Fb (b' v) = b v) :
    let γ' := Fb.trans γ
    let A := slidClosedAssembly F Fb γ j' j k hF
    (∀ p : ControlCircle × ControlDisk,
      γ' (b' p.swap) = γ (b p.swap) ∧
      (bInv (Fb (γ'.symm (γ' (b' p.swap))))).swap = p) ∧
    ∀ q : Q, A (adjunctionLower (k ∘ γ') q) = adjunctionLower (k ∘ γ) q ∧
      A.symm (adjunctionLower (k ∘ γ) q) = adjunctionLower (k ∘ γ') q := by
  intro γ' A
  obtain ⟨hDual, _, _, hInverse, _⟩ :=
    slid_dualTube_and_inverse γ.toEquiv Fb.toEquiv b b' bInv hb hMark
  obtain ⟨_,hUpper,_,hUpperInv⟩ := slidClosedAssembly_representatives F Fb γ j' j k hF
  exact ⟨fun p => ⟨congrFun hDual p, hInverse p⟩, fun q => ⟨hUpper q,hUpperInv q⟩⟩

#print axioms slid_spectator_and_upper_piece_are_carried_by_one_closing_map

end Controls

section Disk

open Bundle DifferentialGeometry DifferentialGeometry.Geometry Filter Manifold
open FirstOrderTwistor MeasureTheory

#check @exists_selectedDiskSaving_of_firstVariation
#print axioms exists_selectedDiskSaving_of_firstVariation
#check @protectedDisk_positiveCap_allowance_lower
#print axioms protectedDisk_positiveCap_allowance_lower
#check @matchedDisk_positiveCap_allowance_ge_disk_minus_excess
#print axioms matchedDisk_positiveCap_allowance_ge_disk_minus_excess
#check @exists_selectedNonconformalDiskSaving_of_weightedSquare
#print axioms exists_selectedNonconformalDiskSaving_of_weightedSquare
#check @eventually_no_paid_cap_of_original_charged_markedDisk
#print axioms eventually_no_paid_cap_of_original_charged_markedDisk
#check @original_markedDisk_charge_eq_and_le_excess_of_arbitrarily_small_cap_drift
#print axioms original_markedDisk_charge_eq_and_le_excess_of_arbitrarily_small_cap_drift

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "WALL" => (2 * (4 * Real.pi ^ 2))

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [I.Boundaryless] [T2Space M] [CompactSpace M] [Nonempty M]
  {o : ManifoldOrientation I M 4}

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

/-- For the actual selected finite disk, a first variation at an attained
positive infimum cannot satisfy the strict descending-slope premise. -/
theorem attained_disk_rules_out_strict_descending_slope
    (m : NestedBalancedDisks I M) (n : ℕ)
    (g : ℝ → SignedCollarMetric o) {K : Set M} (hK : IsClosed K)
    (hLoc : K ⊆ interior (selectedChartDisk m.outer) \
      (selectedChartDisk m.core ∪ selectedDiskTrim m.outer n))
    (hGerm : ∀ x ∉ K, ∀ᶠ y in 𝓝 x, ∀ t (u v : TangentSpace I y),
      (g t).metric.inner y u v = (g 0).metric.inner y u v)
    (hFrame : ∀ t x, x ∉ K → ((g t).frame x).basis = ((g 0).frame x).basis)
    (level : ℝ → ℝ) (hLevel : ContinuousAt level 0)
    (hSign : ∀ t, 0 < level t ↔ 0 < classYamabeFour o.dimension_eq (g t).metric)
    (hPositive : 0 < classYamabeFour o.dimension_eq (g 0).metric)
    (hSubcritical : (g 0).energy .plus < WALL)
    (hAttained : (g 0).energy .plus = sInf (geometricPositiveEnergies o))
    {d : ℝ} (hd : 0 < d) :
    ¬ HasDerivAt (fun t => (g t).energy .plus) (-d) 0 := by
  intro hDerivative
  obtain ⟨t, _, _, _, _, hGain⟩ := exists_selectedDiskSaving_of_firstVariation
    m n g hK hLoc hGerm hFrame level hLevel hSign hPositive hSubcritical
    hDerivative (half_pos hd) (half_lt_self hd) zero_lt_one
  obtain ⟨_, _, _, h0, hStep, hBound⟩ := hGain .minus
  have hUpper : (g 0).energy .plus - (g t).energy .plus ≤ 0 :=
    (hBound.trans (min_le_left _ _)).trans_eq (sub_eq_zero.mpr hAttained)
  exact (h0.trans hStep).not_ge hUpper

#print axioms attained_disk_rules_out_strict_descending_slope

/-- The same independent cap on the selected width pays both bounds in
each sign. The protected subtotal and the exact-exterior estimate use
different portions of the measured price. -/
theorem actual_positive_cap_pays_protected_subtotal_and_full_disk
    (g h cap : SignedCollarMetric o) (m : NestedBalancedDisks I M) (n : ℕ)
    (hDisj : Disjoint (selectedChartDisk m.core) (selectedDiskTrim m.outer n))
    (hCore : ∀ sign, g.charge sign (selectedChartDisk m.core) =
      h.charge sign (selectedChartDisk m.core))
    (hTrim : ∀ sign, g.charge sign (selectedChartDisk m.outer ∩ selectedDiskTrim m.outer n) =
      h.charge sign (selectedChartDisk m.outer ∩ selectedDiskTrim m.outer n))
    (hJoined : h.energy .plus < WALL)
    (hPositiveCap : 0 < classYamabeFour o.dimension_eq cap.metric)
    (δ : CollarChirality → ℝ)
    (hExterior : ∀ sign, g.charge sign (interior (selectedChartDisk m.outer))ᶜ =
      h.charge sign (interior (selectedChartDisk m.outer))ᶜ)
    (hCapCost : ∀ sign, cap.energy sign ≤
      h.charge sign (interior (selectedChartDisk m.outer))ᶜ + δ sign) :
    ∀ sign,
      sInf (geometricPositiveEnergies o) + g.charge sign (selectedChartDisk m.core) +
        g.charge sign (selectedChartDisk m.outer ∩ selectedDiskTrim m.outer n) - WALL < δ sign ∧
      g.charge sign (selectedChartDisk m.outer) -
        (g.energy .plus - sInf (geometricPositiveEnergies o)) ≤ δ sign :=
  fun sign =>
    ⟨protectedDisk_positiveCap_allowance_lower g h cap m n hDisj hCore hTrim hJoined
        hPositiveCap δ hCapCost sign,
      matchedDisk_positiveCap_allowance_ge_disk_minus_excess g h cap m hPositiveCap
        δ hExterior hCapCost sign⟩

#print axioms actual_positive_cap_pays_protected_subtotal_and_full_disk

end Disk

section Flow

open DifferentialGeometry DifferentialGeometry.CheegerGromovCompactness
  DifferentialGeometry.Geometry.Curvature DifferentialGeometry.Integral.Measure
  DifferentialGeometry.PDE.RicciFlow DifferentialGeometry.PDE.RicciFlow.Perelman.KappaSolutions
  DifferentialGeometry.Tensor0SBundle Filter MeasureTheory Manifold
open scoped ENNReal

#check @tendsto_terminalBallCutoff_weylScalarCharge_of_initial_region
#print axioms tendsto_terminalBallCutoff_weylScalarCharge_of_initial_region
#check @eventually_ricciFlow_terminalBall_intrinsicRicciCharge
#print axioms eventually_ricciFlow_terminalBall_intrinsicRicciCharge
#check @pointedTerminalBuffer_traceFreeRicci_charge
#print axioms pointedTerminalBuffer_traceFreeRicci_charge
#check @ricciFlow_terminalBall_intrinsicRicciCharge_pointedLimit
#print axioms ricciFlow_terminalBall_intrinsicRicciCharge_pointedLimit
#check @ricciFlow_terminalPointed_noncompact_of_initialVolume
#print axioms ricciFlow_terminalPointed_noncompact_of_initialVolume

universe u uE uH
variable {E : Type uE} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type uH} [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [I.Boundaryless] {D : RealTimeInterval}
  {M : ℕ → Type u} [∀ i, TopologicalSpace (M i)] [∀ i, ChartedSpace H (M i)]
  [∀ i, IsManifold I ∞ (M i)] [∀ i, T2Space (M i)] [∀ i, CompactSpace (M i)]
  [∀ i, T2Space (TangentBundle I (M i))]
  [∀ i, BoundarylessManifold I (M i)] [∀ i, PreconnectedSpace (M i)]

attribute [local instance] PointedRiemannianManifold.topology PointedRiemannianManifold.charted
  PointedRiemannianManifold.smooth PointedRiemannianManifold.t2
  PointedRiemannianManifold.sigmaCompact PointedRiemannianManifold.t2TangentBundle
private local instance {N : Type*} [TopologicalSpace N] : MeasurableSpace N := borel N
private local instance {N : Type*} [TopologicalSpace N] : BorelSpace N := ⟨rfl⟩
private local instance : CompleteSpace E := FiniteDimensional.complete ℝ E

/-- Actual initial-region charge passes to the entire source terminal
ball and then through its strict positive-time comparison buffer. The
same pointed limit is noncompact when the initial source volumes escape.
The epsilon-squared-over-eight loss leaves a positive density somewhere
in the radius-R-plus-two comparison ball. -/
theorem initial_region_charge_reaches_the_actual_pointed_limit_ball
    (S : ∀ i, SolutionOn (I := I) (M := M i) D) (hS : ∀ i, IsSolutionOn (S i))
    (o : ∀ i, ManifoldOrientation I (M i) 4) {τ b A L ε R : ℝ}
    (hτ : 0 < τ) (hb : b < 1/2) (hA : 0 ≤ A) (hL : 0 ≤ L)
    (hCarrier : Icc 0 τ ⊆ D.carrier) (hRegular : Ioo 0 τ ⊆ D.regular)
    (hRic : ∀ i, ∀ s ∈ Ioo 0 τ, ∀ x (v : TangentSpace I x),
      -(b/s) * ((S i).base.metric s).inner x v v ≤ (S i).ricciAt s x (vec2 v v))
    (p : ∀ i, M i) (P Q : ∀ i, Set (M i)) (hP : ∀ i, MeasurableSet (P i))
    (hQ : ∀ i, MeasurableSet (Q i))
    (hIn : ∀ i, ∀ x ∈ P i, (riemannianEDistOf ((S i).base.metric τ) (p i) x).toReal ≤ R)
    (hSupport : ∀ i, {x | (riemannianEDistOf ((S i).base.metric τ) (p i) x).toReal < R+1} ⊆ Q i)
    {Y : PointedRiemannianManifold.{u,uE,uH} I} {φ : ℕ → ℕ} (hφ : StrictMono φ)
    (F : PointedRiemannianConvergenceMaps (terminalPointedFlowSequence S p τ) Y φ)
    (C : MetricConvergenceData F)
    (hCanonical : ∀ i, C.domain i = CanonicalMetricCompactness.canonicalSourceData F i)
    (hComplete : MetricComplete Y) (hR : 0 < R+1) (hε : 0 < ε)
    (hLoss : 2*(144*A*L)*Real.sqrt (τ/(1-2*b)) ≤ ε^2/8) :
    let g := fun i => (S i).base.metric
    let μ := fun i s => riemannianVolumeMeasure I (M i) (g i s)
    (∀ i, ∀ s ∈ Ioo 0 τ, Real.sqrt (∫ x, testedEulerCurvatureNorm (g i s) x ^ 2 ∂(μ i s)) ≤ A) →
    (∀ i, IntervalIntegrable (fun s => ∫ x, testedEulerRicciDerivativeNorm (g i s) x ^ 2
      ∂(μ i s)) volume 0 τ) →
    (∀ i, (∫ s in (0 : ℝ)..τ, ∫ x, testedEulerRicciDerivativeNorm (g i s) x ^ 2
      ∂(μ i s)) ≤ L^2) →
    (∀ i, ε^2 ≤ (∫ x in P i, intrinsicCurvatureSq (g i 0) x ∂(μ i 0))) →
    Tendsto (fun i => ∫ x in Q i, intrinsicWeylScalarCharge (g i 0) x ∂(μ i 0)) atTop (𝓝 0) →
    Tendsto (fun i => ((μ i 0) univ).toReal) atTop atTop →
    let B := riemannianBallOf Y.metric Y.basepoint (R+2)
    (¬ CompactSpace Y.M) ∧ ε^2/4 ≤ (∫ x in B, intrinsicTraceFreeRicciSq Y.metric x
      ∂riemannianVolumeMeasure I Y.M Y.metric) ∧
    ∃ x ∈ B, 0 < intrinsicTraceFreeRicciSq Y.metric x := by
  intro g μ hU hInt hBudget hFull hMass hInitialVolume B
  have hMargin : ε^2/4 < ε^2/2 - 2*(144*A*L)*Real.sqrt (τ/(1-2*b)) := by
    linarith only [hLoss, sq_pos_of_pos hε]
  have hQuarter : 0 < ε^2/4 := div_pos (sq_pos_of_pos hε) (by norm_num)
  have hCharge := ricciFlow_terminalBall_intrinsicRicciCharge_pointedLimit
    S hS o hτ hb hA hL hCarrier hRegular hRic p P Q hP hQ hIn hSupport
    F C hCanonical hφ.tendsto_atTop hComplete hR (r := R+2) (by linarith)
    hQuarter hMargin hU hInt hBudget hFull hMass
  have hNoncompact := ricciFlow_terminalPointed_noncompact_of_initialVolume
    S hS o p hτ hA hCarrier hRegular F C hCanonical hφ.tendsto_atTop hU hInitialVolume
  refine ⟨hNoncompact, hCharge, ?_⟩
  by_contra! h
  let : EMetricSpace Y.M := Y.emetricSpace
  have hOpen : IsOpen B := by
    change IsOpen {x : Y.M | edist Y.basepoint x < ENNReal.ofReal (R+2)}
    exact isOpen_lt (continuous_const.edist continuous_id) continuous_const
  have hNonpositive : (∫ x in B, intrinsicTraceFreeRicciSq Y.metric x
      ∂riemannianVolumeMeasure I Y.M Y.metric) ≤ 0 :=
    setIntegral_nonpos hOpen.measurableSet h
  exact (hQuarter.trans_le hCharge).not_ge hNonpositive

#print axioms initial_region_charge_reaches_the_actual_pointed_limit_ball

end Flow

end CollarChargeReadback
