import SmoothPoincare

/-! 26 November 2026. Independent E49 application prepared for Edward B. Baker III
with OpenAI Codex assistance. Actual serving model and effort were unavailable.
The cap computation uses the actual round stereographic marking and dilates the
target mark by two. The sublevel check uses the same-type attained comparator. -/

noncomputable section

open DifferentialGeometry DifferentialGeometry.Topology.Manifold FirstOrderTwistor Metric Set
open scoped ContDiff Manifold Topology

namespace SmoothPoincare.E49CapReadback

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "I₄" => 𝓘(ℝ, E₄)
local notation "S₄" => StandardFourSphere
local instance : Fact (Module.finrank ℝ (EuclideanSpace ℝ (Fin 5)) = 4 + 1) := ⟨by simp⟩

private def dilation : E₄ ≃ₗ[ℝ] E₄ :=
  LinearEquiv.smulOfNeZero ℝ E₄ (2 : ℝ) (by norm_num)

private def sourceMark : PartialDiffeomorph I₄ I₄ E₄ S₄ ∞ :=
  transportedCapStereographic.symm

private def targetMark : PartialDiffeomorph I₄ I₄ E₄ S₄ ∞ :=
  dilation.toContinuousLinearEquiv.toDiffeomorph.toPartialDiffeomorph.trans sourceMark

private def markingChange : PartialDiffeomorph I₄ I₄ S₄ S₄ ∞ :=
  transportedCapStereographic.trans targetMark

private theorem mem_sourceMark (x : E₄) : x ∈ sourceMark.source := by
  change x ∈ transportedCapStereographic.target
  rw [transportedCapStereographic_target]
  trivial

private theorem mem_targetMark (x : E₄) : x ∈ targetMark.source :=
  ⟨mem_univ _, mem_sourceMark _⟩

private theorem targetMark_apply (x : E₄) :
    targetMark x = sourceMark ((2 : ℝ) • x) := rfl

set_option backward.isDefEq.respectTransparency false in
/-- Apply the general recognized-double theorem on a genuine stereographic cap
of radius one with buffer radius two. The target has twice the stereographic
radius at each parameter, so the marking change is a dilation. -/
theorem roundDilationPreservesBothCapGerms
    (o : ManifoldOrientation I₄ S₄ 4) :
    ∃ F : S₄ ≃ₘ⟮I₄, I₄⟯ S₄, F.preservesOrientation o o ∧
      (∀ x ∈ closedBall (0 : E₄) 2,
        F (transportedCapStereographic.symm x) = transportedCapStereographic.symm ((2 : ℝ) • x)) ∧
      (∀ x ∈ ball (0 : E₄) 2,
        F.symm (transportedCapStereographic.symm ((2 : ℝ) • x)) = transportedCapStereographic.symm x) ∧
      (∀ x ∈ closedBall (0 : E₄) 1,
        F =ᶠ[nhds (transportedCapStereographic.symm x)] markingChange) ∧
      (∀ x ∈ closedBall (0 : E₄) 1,
        F.symm =ᶠ[nhds (transportedCapStereographic.symm ((2 : ℝ) • x))] markingChange.symm) ∧
      F '' (transportedCapStereographic.symm '' ball (0 : E₄) 1)ᶜ =
        ((fun x : E₄ => transportedCapStereographic.symm ((2 : ℝ) • x)) '' ball (0 : E₄) 1)ᶜ := by
  let _ : PathConnectedSpace S₄ := isPathConnected_iff_pathConnectedSpace.1
    (isPathConnected_sphere (by simp [← Module.finrank_eq_rank] :
      1 < Module.rank ℝ (EuclideanSpace ℝ (Fin 5))) (0 : EuclideanSpace ℝ (Fin 5)) zero_le_one)
  let A := Diffeomorph.refl I₄ S₄ ∞
  have sourceMem : closedBall (0 : E₄) 2 ⊆ sourceMark.source := fun x _ => mem_sourceMark x
  have targetMem : closedBall (0 : E₄) 2 ⊆ targetMark.source := fun x _ => mem_targetMark x
  have prescribedMem : sourceMark '' closedBall (0 : E₄) 2 ⊆ markingChange.source := by
    rintro _ ⟨x, _, rfl⟩
    exact ⟨sourceMark.map_source' (mem_sourceMark x), mem_targetMark _⟩
  have prescribedEq (x : E₄) (_ : x ∈ closedBall (0 : E₄) 2) :
      markingChange (sourceMark x) = targetMark x := by
    change targetMark (transportedCapStereographic (transportedCapStereographic.symm x)) = targetMark x
    rw [transportedCapStereographic.apply_symm_apply (mem_sourceMark x)]
  have zeroMem : (0 : E₄) ∈ closedBall (0 : E₄) 2 := mem_closedBall_self (by norm_num)
  let S : E₄ ≃ₗ[ℝ] E₄ := ((sourceMark.isLocalDiffeomorphAt I₄ I₄ ∞ (sourceMem zeroMem)).mfderivToContinuousLinearEquiv (by simp)).toLinearEquiv
  let T : E₄ ≃ₗ[ℝ] E₄ := ((targetMark.isLocalDiffeomorphAt I₄ I₄ ∞ (targetMem zeroMem)).mfderivToContinuousLinearEquiv (by simp)).toLinearEquiv
  let u : Orientation ℝ E₄ (Fin 4) := Orientation.map (Fin 4) S.symm (o.orientation (sourceMark 0))
  have hSourceOrientation : Orientation.map (Fin 4) S u = o.orientation (sourceMark 0) := by
    dsimp [u]
    rw [← Orientation.map_symm]
    exact Equiv.apply_symm_apply _ _
  have hDilationOrientation : Orientation.map (Fin 4) dilation u = u := by
    apply (Orientation.map_eq_iff_det_pos u dilation (by change 4 = Module.finrank ℝ E₄; simp)).mpr
    change 0 < LinearMap.det ((2 : ℝ) • (LinearMap.id : E₄ →ₗ[ℝ] E₄))
    simp [LinearMap.det_smul]
  have hDilationDeriv : mfderiv I₄ I₄ dilation.toContinuousLinearEquiv.toDiffeomorph 0 =
      dilation.toContinuousLinearEquiv.toContinuousLinearMap := by
    rw [mfderiv_eq_fderiv]
    exact dilation.toContinuousLinearEquiv.toContinuousLinearMap.fderiv
  have hTargetLinear : T = dilation.trans S := by
    apply LinearEquiv.ext
    intro v
    change mfderiv I₄ I₄ targetMark 0 v = S (dilation v)
    have hDiff : MDifferentiableAt I₄ I₄ (sourceMark : E₄ → S₄)
        (dilation.toContinuousLinearEquiv.toDiffeomorph 0) :=
      sourceMark.mdifferentiableAt (by simp) (mem_sourceMark _)
    have hScale := dilation.toContinuousLinearEquiv.toDiffeomorph.contMDiff.mdifferentiableAt
      (by simp : (∞ : WithTop ℕ∞) ≠ 0) (x := (0 : E₄))
    change mfderiv I₄ I₄ ((sourceMark : E₄ → S₄) ∘ dilation.toContinuousLinearEquiv.toDiffeomorph) 0 v = _
    rw [mfderiv_comp (f := (dilation.toContinuousLinearEquiv.toDiffeomorph : E₄ → E₄)) _ hDiff hScale,
      hDilationDeriv]
    change mfderiv I₄ I₄ sourceMark (dilation 0) (dilation v) =
      mfderiv I₄ I₄ sourceMark 0 (dilation v)
    rw [map_zero]
  have hTargetOrientation : Orientation.map (Fin 4) T u = o.orientation (targetMark 0) := by
    rw [hTargetLinear, DifferentialGeometry.orientation_map_trans, hDilationOrientation,
      hSourceOrientation, targetMark_apply, smul_zero]
  obtain ⟨F, hFOrientation, hBuffer, hForward, hInverse, hExterior⟩ :=
    bourMarkedExterior_of_recognizedSphere A A o o o
      (Diffeomorph.preservesOrientation_refl o) (Diffeomorph.preservesOrientation_refl o)
      sourceMark targetMark markingChange (r := 1) (R := 2) (by norm_num) (by norm_num)
      sourceMem targetMem prescribedMem prescribedEq u hSourceOrientation hTargetOrientation
  have hOpenSource : IsOpen (sourceMark '' ball (0 : E₄) 2) :=
    image_opens_isOpen sourceMark (U := ⟨_, isOpen_ball⟩) (ball_subset_closedBall.trans sourceMem)
  have hOpenTarget : IsOpen (targetMark '' ball (0 : E₄) 2) :=
    image_opens_isOpen targetMark (U := ⟨_, isOpen_ball⟩) (ball_subset_closedBall.trans targetMem)
  refine ⟨F, hFOrientation, hBuffer, ?_, ?_, ?_, hExterior⟩
  · intro x hx
    change F.symm (targetMark x) = sourceMark x
    rw [← hBuffer x (ball_subset_closedBall hx), F.symm_apply_apply]
  · intro x hx
    have hInside : x ∈ ball (0 : E₄) 2 := closedBall_subset_ball (by norm_num : (1 : ℝ) < 2) hx
    exact Filter.eventuallyEq_of_mem (hOpenSource.mem_nhds (mem_image_of_mem _ hInside)) hForward
  · intro x hx
    have hInside : x ∈ ball (0 : E₄) 2 := closedBall_subset_ball (by norm_num : (1 : ℝ) < 2) hx
    exact Filter.eventuallyEq_of_mem (hOpenTarget.mem_nhds (mem_image_of_mem _ hInside)) hInverse

end SmoothPoincare.E49CapReadback

#print axioms SmoothPoincare.E49CapReadback.roundDilationPreservesBothCapGerms

namespace SmoothPoincare.E49CapReadback

open Bour DifferentialGeometry.Geometry.Curvature DifferentialGeometry.Integral.Measure
open MeasureTheory

variable {E H M P : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [T2Space M] [CompactSpace M] [Nonempty M] [BoundarylessManifold I M]
  [TopologicalSpace P] [PreconnectedSpace P] {o : ManifoldOrientation I M 4}

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

/-- On the original trajectory at fixed positive parameter, read the uniform
Ricci margin explicitly in terms of the attained comparator's Yamabe deficit. -/
theorem subroundAttainedComparatorMargin {p ε : ℝ} {start : P}
    (f : OriginalTrajectory o p start) (q : SignedCollarMetric o)
    (hp : 0 < p) (hp1 : p < 1)
    (hEuler : ∀ q' : SignedCollarMetric o, bourEuler q' = 16 * Real.pi ^ 2)
    (hAtt : q.energy .plus = sInf (geometricPositiveEnergies o))
    (hVolume : riemannianVolumeMeasure I M q.metric univ = 1)
    (hScalar : ∀ x, metricScalarAt q.metric x = classYamabeFour o.dimension_eq q.metric)
    (hDeficit : 0 < 384 * Real.pi ^ 2 - (classYamabeFour o.dimension_eq q.metric) ^ 2)
    (hLevel : bourEnergy p (f.slice start) ≤ bourEnergy p q + ε)
    (hPin : ε < 16 * Real.pi ^ 2 - 2 * q.energy .plus -
      p * (classYamabeFour o.dimension_eq q.metric) ^ 2 / 24)
    (hErr : 48 * ε ≤ p * (384 * Real.pi ^ 2 - (classYamabeFour o.dimension_eq q.metric) ^ 2))
    (t : P) :
    0 < f.yamabe t ∧
      bourRicci (f.slice t) ≤ 4 * sInf (geometricPositiveEnergies o) -
        (384 * Real.pi ^ 2 - (classYamabeFour o.dimension_eq q.metric) ^ 2) / 24 ∧
      bourRicci (f.slice t) < 4 * sInf (geometricPositiveEnergies o) := by
  let y := classYamabeFour o.dimension_eq q.metric
  have hY : bourScalar q = y ^ 2 := bourScalar_eq_sq_of_volume_one q y hVolume hScalar
  have hGB := bourEuler_eq_charges q
  rw [hEuler, hY] at hGB
  have hGap : 4 * q.energy .plus - bourRicci q = (384 * Real.pi ^ 2 - y ^ 2) / 12 := by
    linarith only [hGB]
  have hPinch : bourEnergy p q + ε < (1-p) * (16 * Real.pi ^ 2) := by
    rw [bourEnergy_eq_chiral_scalar, hEuler, hY]
    change ε < 16 * Real.pi ^ 2 - 2 * q.energy .plus - p * y ^ 2 / 24 at hPin
    linarith only [hPin]
  have hSmall : 4 * ε ≤ p * (4 * q.energy .plus - bourRicci q) := by
    rw [hGap]
    change 48 * ε ≤ p * (384 * Real.pi ^ 2 - y ^ 2) at hErr
    linarith only [hErr]
  obtain ⟨hPositive, hRicci, _⟩ :=
    bourOriginal_attainedComparator_margin f q hp hp1 hEuler hAtt hLevel hPinch hSmall t
  have hBound : bourRicci (f.slice t) ≤
      4 * sInf (geometricPositiveEnergies o) - (384 * Real.pi ^ 2 - y ^ 2) / 24 := by
    linarith only [hRicci, hGap, hAtt]
  exact ⟨hPositive, hBound, hBound.trans_lt (by
    change 0 < 384 * Real.pi ^ 2 - y ^ 2 at hDeficit
    linarith only [hDeficit])⟩

end SmoothPoincare.E49CapReadback

#print axioms SmoothPoincare.E49CapReadback.subroundAttainedComparatorMargin
