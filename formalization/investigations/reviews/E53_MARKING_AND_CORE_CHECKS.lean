import SmoothPoincare

/-! # FOT-E53 independent checks of the relative meridian and buffered core -/

open Set Metric Manifold DifferentialGeometry DifferentialGeometry.Topology
open DifferentialGeometry.PDE.RicciFlow.Surgery.Topology
open DifferentialGeometry.Integral.Measure MeasureTheory FirstOrderTwistor
open SmoothPoincare SmoothPoincare.HMP
open scoped Manifold ContDiff RealInnerProductSpace

noncomputable section

namespace E53MarkingAndCoreChecks

local notation "V" => StandardSurgeryModel.Block 1
local notation "C₁" => StandardSurgeryModel.BoundarySphere 1
local notation "IT" => ModelWithCorners.prod (𝓡 1) 𝓘(ℝ, V)
local notation "IB" => ModelWithCorners.prod 𝓘(ℝ, V) 𝓘(ℝ, ℝ)
local notation "Tube" => C₁ × V
local notation "Box" => V × ℝ

private def firstUnit : V := EuclideanSpace.single (0 : Fin 2) (1 : ℝ)

private theorem firstUnit_norm : ‖firstUnit‖ = 1 := by
  simp [firstUnit, EuclideanSpace.single]

private def firstAngle : C₁ := ⟨firstUnit, by
  exact mem_sphere_zero_iff_norm.mpr firstUnit_norm⟩

-- The closed solid torus reaches the lower radial bound and still has a
-- well-defined inverse. Its partner with the disk coordinate reversed differs.
example :
    let b := diskFramedMeridian firstAngle
    let p : Tube := (firstAngle, -firstUnit)
    ‖(b p).1‖ = (3 / 4 : ℝ) ∧ b.symm (b p) = p ∧
      b (p.1, -p.2) ≠ b p := by
  intro b p
  have hp : ‖p.2‖ ≤ 1 := by simp [p, firstUnit_norm]
  have hp' : ‖(-p.2 : V)‖ ≤ 1 := by simpa using hp
  have h := diskFramedMeridian_bounds firstAngle p hp
  have h' := diskFramedMeridian_bounds firstAngle (p.1, -p.2) hp'
  refine ⟨?_, b.left_inv h.1, ?_⟩
  · change ‖(diskFramedMeridian firstAngle (firstAngle, -firstUnit)).1‖ = _
    have he : firstUnit 0 = 1 := by simp [firstUnit, EuclideanSpace.single]
    simp [diskFramedMeridian, firstAngle, he, firstUnit_norm, norm_smul]
    norm_num
  · intro hEq
    have hpEq := b.injOn h'.1 h.1 hEq
    have hReal := congrArg (fun q : Tube => q.2 0) hpEq
    norm_num [p, firstUnit, EuclideanSpace.single] at hReal

-- Core agreement alone leaves the full normal-disk coordinates undetermined.
example (z : C₁) :
    diskFramedMeridian firstAngle (z, -(0 : V)) = diskFramedMeridian firstAngle (z, 0) := by
  rw [neg_zero]

example :
    range (meridianDisk (1 / 2)) ∩ range (fun s : ℝ => ((0 : V), s)) =
      {((0 : V), (1 / 2 : ℝ))} :=
  meridianDisk_inter_axis (1 / 2)

example {X Y : Type*} [TopologicalSpace X] [ChartedSpace ThreeSpace X]
    [TopologicalSpace Y] [ChartedSpace ThreeSpace Y]
    (c : PartialDiffeomorph IB ThreeModel Box X ∞)
    (c' : PartialDiffeomorph IB ThreeModel Box Y ∞)
    (e : X ≃ₘ^∞⟮ThreeModel, ThreeModel⟯ Y)
    (hs : protectedMeridianBox ⊆ c.source) (hs' : protectedMeridianBox ⊆ c'.source)
    (hfixed : EqOn (e ∘ c) c' protectedMeridianBox)
    (a : PartialDiffeomorph IT ThreeModel Tube X ∞) :
    let p : Tube := (firstAngle, -firstUnit)
    e.symm (chartMeridian firstAngle c' p) = chartMeridian firstAngle c p ∧
      (chartMeridian firstAngle c').symm (chartMeridian firstAngle c' p) = p ∧
      (prefixResidualTube e.symm a).symm (chartMeridian firstAngle c' p) =
        a.symm (chartMeridian firstAngle c p) := by
  intro p
  have h := protectedMeridian_transport firstAngle c c' e hs hs' hfixed a
  have hp : ‖p.2‖ ≤ 1 := by simp [p, firstUnit_norm]
  have hMeridian := h.1 p hp
  refine ⟨hMeridian.2.1, hMeridian.2.2.1, ?_⟩
  rw [h.2.2, hMeridian.2.1]

example {X : Type} [TopologicalSpace X] [ChartedSpace ThreeSpace X]
    (c : PartialDiffeomorph IB ThreeModel Box X ∞) (hs : protectedMeridianBox ⊆ c.source)
    (core : C(ULift (CellBoundary 2), X))
    (hcore : ∀ z, core z = chartMeridian firstAngle c
      (⟨z.down.val, mem_sphere_zero_iff_norm.mpr z.down.property⟩, 0))
    (ξ : IntegralHomology (ULift (CellBoundary 2)) 1) :
    integralHomologyMap 1 core ξ = 0 :=
  chartMeridian_core_windingZero firstAngle c hs core hcore ξ

private def lowerModelPole : sphere (0 : EuclideanSpace ℝ (Fin 3)) 1 :=
  ⟨EuclideanSpace.single (0 : Fin 3) (1 : ℝ), by
    simp [EuclideanSpace.single]⟩

example (ξ : IntegralHomology (ULift (CellBoundary 2)) 1) :
    let b := standardLowerMeridian lowerModelPole firstAngle
    let a := standardRetainedTube lowerModelPole
    let p : Tube := (firstAngle, -firstUnit)
    Disjoint (b '' {z | ‖z.2‖ ≤ 1}) (a '' {z | ‖z.2‖ ≤ 1}) ∧
      b.symm (b p) = p ∧
      integralHomologyMap 1 (standardLowerMeridianCore lowerModelPole firstAngle) ξ = 0 := by
  intro b a p
  have hp : ‖p.2‖ ≤ 1 := by simp [p, firstUnit_norm]
  exact ⟨standardLowerMeridian_disjoint_retainedTube lowerModelPole firstAngle,
    (standardLowerMeridian_closedTube lowerModelPole firstAngle p hp).2,
    standardLowerMeridian_windingZero lowerModelPole firstAngle ξ⟩

-- The meridian is contained in the original chart tube. The actual clearance
-- is from the specified shrunk attaching tube.
example {X : Type} [TopologicalSpace X] [ChartedSpace ThreeSpace X]
    (T : PartialDiffeomorph IT ThreeModel Tube X ∞)
    (hT : ∀ z : Tube, ‖z.2‖ ≤ 1 → z ∈ T.source) :
    let b := retainedTubeMeridian firstAngle T
    let p : Tube := (firstAngle, -firstUnit)
    let w : Tube := (firstAngle, (1 / 8 : ℝ) • firstUnit)
    b p ∈ T '' {z | ‖z.2‖ ≤ 1} ∧
      Disjoint (b '' {z | ‖z.2‖ ≤ 1}) (T '' {z | ‖z.2‖ ≤ 1 / 8}) ∧
      b.symm (b p) = p ∧ T.symm (T w) = w := by
  intro b p w
  have hp : ‖p.2‖ ≤ 1 := by simp [p, firstUnit_norm]
  have hw : ‖w.2‖ ≤ (1 / 8 : ℝ) := by norm_num [w, norm_smul, firstUnit_norm]
  have hinv := retainedTubeMeridian_inverses firstAngle T hT p w hp hw
  have hBox : ‖(diskFramedMeridian firstAngle p).1‖ < 2 :=
    (diskFramedMeridian_bounds firstAngle p hp).2.1.1
  have hInside : ‖(boxInRetainedTube firstAngle (diskFramedMeridian firstAngle p)).2‖ ≤ 1 := by
    rw [boxInRetainedTube_apply, norm_smul]
    norm_num [Real.norm_eq_abs]
    linarith
  exact ⟨⟨boxInRetainedTube firstAngle (diskFramedMeridian firstAngle p), hInside, rfl⟩,
    retainedTubeMeridian_disjoint_shrunk firstAngle T hT, hinv.2.1, hinv.2.2⟩

section FramedShrink

variable {X : Type} [TopologicalSpace X] [ChartedSpace ThreeSpace X] [T2Space X]
  (T : PartialDiffeomorph IT ThreeModel Tube X ∞)
  (hT : ∀ z : Tube, ‖z.2‖ ≤ 2 → z ∈ T.source)

-- The closed input disk reaches radius one. The outer test uses the
-- boundary of the support cutoff, where membership in the chart matters.
example :
    let p : Tube := (firstAngle, firstUnit)
    let q : Tube := (firstAngle, (2 : ℝ) • firstUnit)
    let F := retainedTubeShrink T hT 1
    F (T p) = T (p.1, (1 / 8 : ℝ) • p.2) ∧
      F.symm (T (p.1, (1 / 8 : ℝ) • p.2)) = T p ∧
      F (T q) = T q ∧ F.symm (T q) = T q := by
  intro p q F
  have hp : ‖p.2‖ ≤ 1 := by simp [p, firstUnit_norm]
  have hq : ‖q.2‖ = 2 := by norm_num [q, norm_smul, firstUnit_norm]
  have hCut : F (T q) = T q := by
    change framedTubeExtension T framedDiskShrink 1 (T q) = T q
    rw [framedTubeExtension_apply T _ 1 (hT q hq.le),
      framedDiskShrink_outer _ hq.ge, Prod.eta]
  refine ⟨retainedTubeShrink_one T hT hp,
    retainedTubeShrink_one_inverse T hT hp, hCut, ?_⟩
  exact (congrArg F.symm hCut.symm).trans (F.symm_apply_apply (T q))

example (t : ℝ) {x : X} (hx : x ∉ T '' {z : Tube | ‖z.2‖ ≤ 2}) :
    retainedTubeShrink T hT t x = x ∧ (retainedTubeShrink T hT t).symm x = x := by
  have h := retainedTubeShrink_fixed T hT t hx
  exact ⟨h, (congrArg (retainedTubeShrink T hT t).symm h.symm).trans
    ((retainedTubeShrink T hT t).symm_apply_apply x)⟩

end FramedShrink

section RetainedBelt

universe u

variable {E H M : Type u} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [TopologicalSpace H] [TopologicalSpace M] [ChartedSpace H M]
  {I : ModelWithCorners ℝ E H} {P : MarkedMixedNativePresentation I M}

local notation "Trace(" a ")" => AdjunctionSpace (middleAttachingInclusion NativeMiddleHandle) a

example (Q : Closing P)
    {R S L L' : Type u}
    [TopologicalSpace R] [TopologicalSpace S] [TopologicalSpace L] [TopologicalSpace L']
    (body : R ≃ₜ S) (boundary : L' ≃ₜ L) (i : L → S) (i' : L' → R)
    (hbody : ∀ x, body (i' x) = i (boundary x))
    (u : MiddleAttachingRegions NativeMiddleHandle → L)
    (j : Q.beforeD.Carrier → Trace(i ∘ u))
    (j' : (P.outgoing .windingZero).Carrier → Trace(i' ∘ boundary.symm ∘ u))
    (hj : Function.Injective j)
    (restriction : ∀ x, j (Q.boundaryJ x) =
      prefixTraceHomeomorph body boundary i i' hbody u (j' x))
    (oldBelt : NativeMiddleHandle → Handle.BeltRegion 2 2 → Q.beforeD.Carrier)
    (oldMarked : ∀ k p, j (oldBelt k p) =
      adjunctionCell (middleAttachingInclusion NativeMiddleHandle) (i ∘ u)
        ⟨k, Handle.beltInclusion 2 2 p⟩)
    (newMarked : ∀ k p, j' (P.outgoingBelt .windingZero k p) =
      adjunctionCell (middleAttachingInclusion NativeMiddleHandle) (i' ∘ boundary.symm ∘ u)
        ⟨k, Handle.beltInclusion 2 2 p⟩)
    (k : NativeMiddleHandle) (p : Handle.BeltRegion 2 2) :
    (P.closing .windingOne).symm (P.closing .windingZero (P.outgoingBelt .windingZero k p)) =
      P.outgoingBelt .windingOne k p := by
  obtain ⟨hZero, _, _, hOneInv⟩ :=
    Q.marked_retainedBelts body boundary i i' hbody u j j' hj restriction oldBelt oldMarked newMarked k p
  exact (congrArg (P.closing .windingOne).symm hZero).trans hOneInv

end RetainedBelt

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "I₄" => 𝓘(ℝ, E₄)
local notation "S₄" => StandardFourSphere

local instance : Fact (Module.finrank ℝ (EuclideanSpace ℝ (Fin 5)) = 4 + 1) := ⟨by simp⟩
private local instance : MeasurableSpace E₄ := borel E₄
private local instance : BorelSpace E₄ := ⟨rfl⟩
private local instance : MeasurableSpace S₄ := borel S₄
private local instance : BorelSpace S₄ := ⟨rfl⟩

private def bufferPoint : E₄ := EuclideanSpace.single (0 : Fin 4) (3 / 2 : ℝ)

private theorem bufferPoint_norm : ‖bufferPoint‖ = (3 / 2 : ℝ) := by
  simp [bufferPoint, EuclideanSpace.single]

-- The metric equality is tested strictly outside the radius-one core,
-- at a point of the actual buffered shell on the same capped sphere.
example (v w : E₄) :
    let Q := bourBufferedSphereChart 1 (by norm_num)
    1 < ‖bufferPoint‖ ∧ ‖bufferPoint‖ < 2 ∧
      (bourBufferedSphereMetric 1 (by norm_num) 2 (by norm_num)).inner (Q bufferPoint)
        (mfderiv I₄ I₄ Q bufferPoint v) (mfderiv I₄ I₄ Q bufferPoint w) = ⟪v, w⟫ ∧
      intrinsicCurvatureSq (bourBufferedSphereMetric 1 (by norm_num) 2 (by norm_num))
        (Q bufferPoint) = 0 := by
  intro Q
  have h₁ : (1 : ℝ) < ‖bufferPoint‖ := by rw [bufferPoint_norm]; norm_num
  have h₂ : ‖bufferPoint‖ < (2 : ℝ) := by rw [bufferPoint_norm]; norm_num
  exact ⟨h₁, h₂, bourBufferedSphereMetric_inner (by norm_num) (by norm_num)
    bufferPoint h₂.le v w, bourBufferedSphere_flat (by norm_num) (by norm_num) h₂⟩

example :
    let A : Set E₄ := {x | 1 < ‖x‖ ∧ ‖x‖ < 2}
    riemannianVolumeMeasure I₄ S₄ (bourBufferedSphereMetric 1 (by norm_num) 2 (by norm_num))
      (bourBufferedSphereChart 1 (by norm_num) '' A) = volume A := by
  intro A
  have hOpen : IsOpen A := (isOpen_lt continuous_const continuous_norm).inter
    (isOpen_lt continuous_norm continuous_const)
  apply bourBufferedSphere_volume (by norm_num) (by norm_num) hOpen.measurableSet
  intro x hx
  exact mem_closedBall.mpr (by simpa only [dist_zero_right] using hx.2.le)

example (x : E₄) (hx : ‖x‖ = 1) :
    let Q := bourBufferedSphereChart 1 (by norm_num)
    let P := bourBufferedSphereCapChart 1 (by norm_num)
    Q x = P x ∧ Q.symm (P x) = x ∧ P.symm (Q x) = x := by
  exact (bourBufferedSphere_markedDisk 1 (by norm_num)).2.2.1 x
    (by simpa [mem_sphere, dist_zero_right] using hx)

example (v w : TangentSpace I₄ transportedCapNorthPole) :
    (bourBufferedSphereMetric 1 (by norm_num) 2 (by norm_num)).inner
      transportedCapNorthPole v w = standardRoundFourMetric.inner transportedCapNorthPole v w :=
  (bourBufferedSphereMetric_near_pole (r := 1) (b := 2) (by norm_num) (by norm_num)).self_of_nhds v w

example :
    let Q := bourBufferedSphereChart 2 (by norm_num)
    let A := Q '' (closedBall 0 2 \ ball 0 (2 / 2))
    let g := bourBufferedSphereMetric 2 (by norm_num) 3 (by norm_num)
    let G := scaleMetric ((2 : ℝ) ^ 2)⁻¹ (by norm_num) g
    intrinsicCurvatureSq G (Q bufferPoint) = 0 ∧
      riemannianVolumeMeasure I₄ S₄ G A ≤ ENNReal.ofReal (Real.pi ^ 2 / 2) := by
  intro Q A g G
  have h : bufferPoint ∈ closedBall 0 2 \ ball 0 (2 / 2) := by
    norm_num [mem_closedBall, mem_ball, dist_zero_right, bufferPoint_norm]
  have hShell := bourBufferedSphere_normalizedShell (r := 2) (b := 3) (by norm_num) (by norm_num)
  exact ⟨hShell.1 _ ⟨bufferPoint, h, rfl⟩, hShell.2⟩

example : deriv (fun s : ℝ => 2 * Real.sin ((3 - s) / 2)) 3 = -1 :=
  (bourRoundPole_deriv (L := 3) (a := 2) (by norm_num)).deriv

example :
    deriv (fun x : ℝ => 2 * Real.arctan (2 / x)) 3 = -(4 / 13 : ℝ) ∧
      Real.sin (2 * Real.arctan (2 / 3)) = (12 / 13 : ℝ) := by
  constructor
  · convert (bourStereographicPole_distance_deriv (r := 2) (ρ := 3) (by norm_num)).deriv
      using 1
    norm_num
  · rw [← bourStereographicPole_warp_eq_sin (r := 2) (ρ := 3) (by norm_num)]
    norm_num

section Polar

local notation "S₃" => sphere (0 : E₄) 1
local notation "IP" => ModelWithCorners.prod (𝓡 3) 𝓘(ℝ, ℝ)

local instance : Fact (Module.finrank ℝ E₄ = 3 + 1) := ⟨by simp⟩

private def capParameters : S₃ × ℝ :=
  (⟨EuclideanSpace.single (0 : Fin 4) (1 : ℝ), by
    simp [EuclideanSpace.single]⟩, 3)

private theorem capSpeed : bourBufferedRadialSpeed 1 2 capParameters.2 = (1 / 5 : ℝ) := by
  change Real.exp (Real.smoothTransition ((3 : ℝ) ^ 2 / 2 ^ 2 - 1) *
    Real.log (2 * 1 / (1 ^ 2 + 3 ^ 2))) = _
  rw [Real.smoothTransition.one_of_one_le (by norm_num), one_mul, Real.exp_log (by norm_num)]
  norm_num

-- Radius three is on the round portion of the punctured cap. The marked
-- metric has length coefficient one fifth and angular radius three fifths.
example (v w : TangentSpace IP capParameters) :
    let P := bourBufferedSpherePolarChart 1 (by norm_num)
    (bourBufferedSphereMetric 1 (by norm_num) 2 (by norm_num)).inner (P capParameters)
      (mfderiv IP I₄ P capParameters v) (mfderiv IP I₄ P capParameters w) =
      (1 / 5 : ℝ) ^ 2 * v.2 * w.2 +
        (3 / 5 : ℝ) ^ 2 *
          (DifferentialGeometry.Geometry.roundMetric (n := 3)).inner capParameters.1 v.1 w.1 := by
  intro P
  have h := bourBufferedSphere_polar_inner (r := 1) (b := 2) (by norm_num) (by norm_num)
    capParameters (by norm_num [capParameters]) v w
  have hs : bourBufferedRadialSpeed 1 2 3 = (1 / 5 : ℝ) := capSpeed
  simpa only [P, capParameters, hs, show (3 : ℝ) * (1 / 5) = 3 / 5 by norm_num] using h

example :
    let P := bourBufferedSpherePolarChart 1 (by norm_num)
    P capParameters ∈ (standardFourSphereCap ∪ {transportedCapNorthPole})ᶜ ∧
      P.symm (P capParameters) = capParameters := by
  intro P
  obtain ⟨hImage, hInv, _⟩ := bourBufferedSphere_puncturedCap (r := 1) (by norm_num)
  exact ⟨hImage ▸ ⟨capParameters, by norm_num [capParameters], rfl⟩,
    hInv capParameters (by norm_num [capParameters])⟩

example : deriv (bourBufferedRadialLength 1 2) capParameters.2 = (1 / 5 : ℝ) :=
  (bourBufferedRadialLength_hasDerivAt (r := 1) (by norm_num) 2 capParameters.2).deriv.trans capSpeed

example :
    let s := bourBufferedRadialLength 2 3
    s 4 ∈ Ioo 0 (bourBufferedCapLength 2 3) ∧
      ∃ e : OpenPartialHomeomorph ℝ ℝ, (e : ℝ → ℝ) = s ∧
        4 ∈ e.source ∧ ContDiffAt ℝ ∞ e.symm (s 4) ∧ e.symm (s 4) = 4 := by
  intro s
  have hImage := bourBufferedRadialLength_image (r := 2) (b := 3) (by norm_num) (by norm_num)
  exact ⟨hImage ▸ ⟨4, by norm_num, rfl⟩,
    bourBufferedRadialLength_localInverse (r := 2) (by norm_num) 3 4⟩

example :
    bourBufferedCapLength 2 3 - bourBufferedRadialLength 2 3 7 =
      2 * Real.arctan (2 / 7) ∧
      7 * bourBufferedRadialSpeed 2 3 7 =
        Real.sin (bourBufferedCapLength 2 3 - bourBufferedRadialLength 2 3 7) :=
  ⟨bourBufferedRadialLength_roundTail (r := 2) (b := 3) (ρ := 7)
    (by norm_num) (by norm_num) (by norm_num),
    bourBufferedAngularRadius_roundTail (r := 2) (b := 3) (ρ := 7)
      (by norm_num) (by norm_num) (by norm_num)⟩

end Polar

end E53MarkingAndCoreChecks

#print axioms diskFramedMeridian
#print axioms diskFramedMeridian_disjoint_strandTube
#print axioms protectedMeridian_transport
#print axioms chartMeridian_core_windingZero
#print axioms standardLowerMeridian_disjoint_retainedTube
#print axioms standardLowerMeridian_windingZero
#print axioms retainedTubeMeridian_disjoint_shrunk
#print axioms retainedTubeMeridian_inverses
#print axioms retainedTubeShrink_contMDiff
#print axioms retainedTubeShrink_symm_contMDiff
#print axioms retainedTubeShrink_one_inverse
#print axioms retainedTubeShrink_fixed
#print axioms HMP.Closing.marked_retainedBelts
#print axioms bourBufferedSphere_markedDisk
#print axioms bourBufferedSphereMetric_inner
#print axioms bourBufferedSphereMetric_near_pole
#print axioms bourBufferedSphere_flat
#print axioms bourBufferedSphere_volume
#print axioms bourBufferedSphere_normalizedShell
#print axioms bourNormalizedShell_curvature_of_chartJets
#print axioms bourVariableCapEuler_roundPole
#print axioms bourStereographicPole_warp_eq_sin
#print axioms bourBufferedSphere_puncturedCap
#print axioms bourBufferedSphere_polar_inner
#print axioms bourBufferedRadialLength_hasDerivAt
#print axioms bourBufferedRadialLength_image
#print axioms bourBufferedRadialLength_localInverse
#print axioms bourBufferedAngularRadius_roundTail
