import SmoothPoincare.IntrinsicEntry.RoundLatitudeRobin
import SmoothPoincare.Variational.MarkedCapSmoothing
import SmoothPoincare.Variational.StereographicCapMetric
import DifferentialGeometry.Geometry.Metric.Sphere.Isometry.OrthogonalAction
import SmoothPoincare.Variational.MarkedAtlasDivision

/-! # The actual smooth equatorial cap on the round four-sphere

The capped carrier for either side is the original round sphere. The cap is
its complementary hemisphere, marked by an inverse stereographic chart on
an open neighborhood of the closed unit ball. The same global metric gives
the scalar form and the two exact zero cost comparisons.
-/

open DifferentialGeometry DifferentialGeometry.Analysis.Sobolev
open DifferentialGeometry.Geometry DifferentialGeometry.Geometry.Curvature
open DifferentialGeometry.Geometry.Operator DifferentialGeometry.Integral.Measure
open Filter FirstOrderTwistor Manifold MeasureTheory Set
open SmoothPoincare.IntrinsicEntry SmoothPoincare.RoundEquatorialCaps
open scoped ContDiff Manifold RealInnerProductSpace Topology

noncomputable section

namespace SmoothPoincare

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "E₅" => EuclideanSpace ℝ (Fin 5)
local notation "S₄" => StandardFourSphere
local notation "I₄" => 𝓘(ℝ, E₄)
private local instance : Fact (Module.finrank ℝ E₅ = 4 + 1) := ⟨by simp⟩
private local instance : MeasurableSpace S₄ := borel S₄
private local instance : BorelSpace S₄ := ⟨rfl⟩
private local instance : Nonempty S₄ := ⟨transportedCapNorthPole⟩

private abbrev southCoordinates : PartialDiffeomorph I₄ (𝓡 4) E₄ S₄ ∞ :=
  (transportedCapPocketChart 1 one_pos).symm

/-- The hemisphere indicated by `north` is parametrized by the closed unit
ball, with an open extension containing that ball. -/
def roundEquatorCapChart (north : Bool) : PartialDiffeomorph I₄ (𝓡 4) E₄ S₄ ∞ :=
  if north then southCoordinates.trans flip.toPartialDiffeomorph else southCoordinates

private theorem southCoordinates_source : southCoordinates.source = univ :=
  transportedCapPocketChart_target 1 one_pos

@[simp] theorem roundEquatorCapChart_source (north : Bool) :
    (roundEquatorCapChart north).source = univ := by
  cases north
  · exact southCoordinates_source
  · change southCoordinates.source ∩ southCoordinates ⁻¹' flip.toPartialDiffeomorph.source = univ
    rw [southCoordinates_source, show flip.toPartialDiffeomorph.source = univ from rfl]
    simp

private theorem southCoordinates_image_closedBall :
    southCoordinates '' Metric.closedBall (0 : E₄) 1 = southClosure.raw := by
  change southCoordinates '' _ = standardFourSphereCap
  rw [← transportedCapPocketChart_image_cap 1 one_pos, image_image]
  refine (show EqOn (fun x => southCoordinates (transportedCapPocketChart 1 one_pos x)) id
    standardFourSphereCap from fun x hx => (transportedCapPocketChart 1 one_pos).left_inv' (by
      rw [transportedCapPocketChart_source]
      exact transportedCapStereographic_cap_in_source hx)).image_eq.trans (image_id _)

private theorem flip_image_south_eq_north : flip '' southClosure.raw = northClosure.raw := by
  ext x
  obtain ⟨p, rfl⟩ := flip.surjective x
  change flip p ∈ flip '' southClosure.raw ↔ _
  rw [Function.Injective.mem_set_image (f := (flip : S₄ → S₄)) flip.injective]
  change height p ≤ 0 ↔ 0 ≤ height (flip p)
  rw [flip_height, neg_nonneg]

/-- The actual closed cap is the full hemisphere, including the equator. -/
theorem roundEquatorCapChart_image_closedBall (north : Bool) :
    roundEquatorCapChart north '' Metric.closedBall (0 : E₄) 1 =
      if north then northClosure.raw else southClosure.raw := by
  cases north
  · exact southCoordinates_image_closedBall
  · change (fun x => flip (southCoordinates x)) '' _ = northClosure.raw
    rw [← image_image, southCoordinates_image_closedBall, flip_image_south_eq_north]

/-- The two actual markings include smooth inverse maps on the cap images. -/
theorem roundEquatorCapChart_inverse (north : Bool) :
    (∀ z : E₄, (roundEquatorCapChart north).symm (roundEquatorCapChart north z) = z) ∧
      ∀ x ∈ (if north then northClosure.raw else southClosure.raw),
        roundEquatorCapChart north ((roundEquatorCapChart north).symm x) = x := by
  refine ⟨fun z => (roundEquatorCapChart north).left_inv' (by simp), ?_⟩
  intro x hx
  rw [← roundEquatorCapChart_image_closedBall] at hx
  obtain ⟨z, _, rfl⟩ := hx
  exact (roundEquatorCapChart north).right_inv' ((roundEquatorCapChart north).map_source' (by simp))

private theorem flip_preserves_round_inner (x : S₄) (v w : TangentSpace (𝓡 4) x) :
    standardRoundFourMetric.inner (flip x) (mfderiv (𝓡 4) (𝓡 4) flip x v)
      (mfderiv (𝓡 4) (𝓡 4) flip x w) = standardRoundFourMetric.inner x v w := by
  exact roundInner_sphereDiffeo (ℝ ∙ poleVector)ᗮ.reflection x v w

/-- The same round metric pulls back on both marked cap charts to the
Euclidean metric with factor `(2 / (1 + ‖z‖²))²`. -/
theorem roundEquatorCapChart_round_inner (north : Bool) (z v w : E₄) :
    let F := roundEquatorCapChart north
    standardRoundFourMetric.inner (F z) (mfderiv I₄ (𝓡 4) F z v)
      (mfderiv I₄ (𝓡 4) F z w) = (2 / (1 + ‖z‖ ^ 2)) ^ 2 * inner ℝ v w := by
  have hSouth : standardRoundFourMetric.inner (southCoordinates z)
      (mfderiv I₄ (𝓡 4) southCoordinates z v) (mfderiv I₄ (𝓡 4) southCoordinates z w) =
      (2 / (1 + ‖z‖ ^ 2)) ^ 2 * inner ℝ v w := by
    have h := transportedCapPocketChart_metric_inner 1 one_pos z v w
    dsimp only at h
    rw [h, norm_smul, Real.norm_eq_abs, abs_of_nonneg (show 0 ≤ (2 : ℝ) / 1 by norm_num)]
    ring_nf
    field_simp
    ring
  cases north
  · exact hSouth
  · change standardRoundFourMetric.inner (flip (southCoordinates z))
      (mfderiv I₄ (𝓡 4) (flip ∘ southCoordinates) z v)
      (mfderiv I₄ (𝓡 4) (flip ∘ southCoordinates) z w) = _
    have hz : z ∈ southCoordinates.source := by rw [southCoordinates_source]; trivial
    have hSouthDiff := (southCoordinates.contMDiffOn_toFun.contMDiffAt
      (southCoordinates.open_source.mem_nhds hz)).mdifferentiableAt
        (by simp : (∞ : ℕ∞ω) ≠ 0)
    have hFlipDiff := flip.contMDiff.mdifferentiableAt (by simp : (∞ : ℕ∞ω) ≠ 0)
      (x := southCoordinates z)
    have hD (u : E₄) : mfderiv I₄ (𝓡 4) (flip ∘ southCoordinates) z u =
        mfderiv (𝓡 4) (𝓡 4) flip (southCoordinates z)
          (mfderiv I₄ (𝓡 4) southCoordinates z u) :=
      mfderiv_comp_apply z hFlipDiff hSouthDiff u
    erw [hD v, hD w, flip_preserves_round_inner]
    exact hSouth

private theorem southCoordinates_image_ball : southCoordinates '' Metric.ball (0 : E₄) 1 =
    interior standardFourSphereCap := by
  change southCoordinates '' Metric.ball (0 : E₄) 1 = interior southClosure.raw
  rw [← southCoordinates_image_closedBall]
  exact (interior_selectedChartDisk southCoordinates (southCoordinates_source ▸ subset_univ _)).symm

/-- The two boundary parametrizations have the same angular identification.
Their charts are the inverse of the supplied coordinate markings on the
entire closed ball, by `roundEquatorCapChart_inverse`. -/
theorem roundEquatorCapChart_same_boundary {z : E₄} (hz : z ∈ Metric.sphere 0 1) :
    roundEquatorCapChart true z = roundEquatorCapChart false z := by
  change flip (southCoordinates z) = southCoordinates z
  apply flip_fixes_equator
  have hc : southCoordinates z ∈ southClosure.raw := by
    rw [← southCoordinates_image_closedBall]
    exact mem_image_of_mem _ (Metric.sphere_subset_closedBall hz)
  have hni : southCoordinates z ∉ interior standardFourSphereCap := by
    rw [← southCoordinates_image_ball]
    rintro ⟨z', hz', he⟩
    have hs : Function.Injective (southCoordinates : E₄ → S₄) := fun u v huv => by
      have hu := (roundEquatorCapChart_inverse false).1 u
      have hv := (roundEquatorCapChart_inverse false).1 v
      exact hu.symm.trans ((congrArg (fun y => southCoordinates.symm y) huv).trans hv)
    have hz'': z ∈ Metric.ball (0 : E₄) 1 := hs he ▸ hz'
    exact (Metric.mem_ball.mp hz'').ne (Metric.mem_sphere.mp hz)
  rw [interior_south] at hni
  exact le_antisymm hc (le_of_not_gt hni)

/-- The closed joined form on the actual global round metric. -/
def roundEquatorJoinedForm (f : C^∞⟮𝓡 4, S₄; ℝ⟯) : ℝ :=
  let μ := riemannianVolumeMeasure (𝓡 4) S₄ standardRoundFourMetric
  12 * (∫ x, f x ^ 2 ∂μ) + 6 * ∫ x, normGradSqFun standardRoundFourMetric f x ∂μ

/-- The reference norm is defined using the same global metric and measure. -/
def roundEquatorH1Sq (f : C^∞⟮𝓡 4, S₄; ℝ⟯) : ℝ :=
  let μ := riemannianVolumeMeasure (𝓡 4) S₄ standardRoundFourMetric
  (∫ x, f x ^ 2 ∂μ) + ∫ x, normGradSqFun standardRoundFourMetric f x ∂μ

/-- Green's identity identifies the whole scalar numerator with the actual
round joined form. The potential is twelve everywhere. -/
theorem roundEquatorJoinedForm_eq_capFactorScalar (f : C^∞⟮𝓡 4, S₄; ℝ⟯) :
    roundEquatorJoinedForm f = capFactorScalar standardRoundFourMetric f := by
  rw [capFactorScalar_eq_dirichletForm (by simp : Module.finrank ℝ E₄ = 4)]
  have hscalar (x : S₄) : scalarCurv standardRoundFourMetric x = 12 :=
    (metricScalar_eq_scal standardRoundFourMetric x).symm.trans (standardRoundFour_scalar_eq_twelve x)
  simp only [roundEquatorJoinedForm, hscalar, integral_const_mul]

/-- The actual round closed form is coercive in the same reference norm. -/
theorem roundEquatorJoinedForm_coercive (f : C^∞⟮𝓡 4, S₄; ℝ⟯) :
    6 * roundEquatorH1Sq f ≤ roundEquatorJoinedForm f := by
  unfold roundEquatorH1Sq roundEquatorJoinedForm
  linarith only [show 0 ≤ ∫ x, f x ^ 2 ∂riemannianVolumeMeasure (𝓡 4) S₄ standardRoundFourMetric from
    integral_nonneg fun _ => sq_nonneg _]

private theorem roundEquator_testVolumeBound : ∃ C > (0 : ℝ), ∀ u : C^∞⟮𝓡 4, S₄; ℝ⟯,
    Real.sqrt (capTestVolume (conformalMetric standardRoundFourMetric u)) ≤
      C * roundEquatorH1Sq (capExpFactor u) := by
  have hd : Module.finrank ℝ E₄ = 4 := by simp
  obtain ⟨C, _, hSob⟩ := sobolev_two_integral standardRoundFourMetric (by rw [hd]; norm_num)
  refine ⟨2 * C ^ 2 + 1, by positivity, ?_⟩
  intro u
  let f := capExpFactor u
  rw [capTestVolume_eq_capFactorVolume hd, ← lpNorm_four_sq_eq_capFactorVolume]
  have h := hSob f.contMDiff
  rw [hd] at h
  norm_num at h
  have hNorm : 0 ≤ roundEquatorH1Sq f := add_nonneg (integral_nonneg fun _ => sq_nonneg _)
    (integral_nonneg (normGradSqFun_nonneg standardRoundFourMetric f))
  have hGrad (x : S₄) : ‖dIncl (n := 4) x (gradFun standardRoundFourMetric f x)‖ ^ 2 =
      normGradSqFun standardRoundFourMetric f x := by
    rw [← real_inner_self_eq_norm_sq]
    rfl
  simp_rw [← gradFun_def, hGrad] at h
  exact h.trans (mul_le_mul_of_nonneg_right (le_add_of_nonneg_right zero_le_one) hNorm)

/-- The actual round metric has zero signed Weyl charge on every set. -/
theorem roundEquator_charge_zero (o : ManifoldOrientation (𝓡 4) S₄ 4)
    (sign : CollarChirality) (U : Set S₄) : (signedRound o).charge sign U = 0 := by
  let r : HeightRadius := ⟨1 / 2, by norm_num, by norm_num⟩
  rw [← SignedCollarMetric.charge_conformal _ (logFactor r r 0)]
  exact zero_charge o r r 0 sign U

private theorem interior_southClosure_nonempty : (interior southClosure.raw).Nonempty := by
  change (interior standardFourSphereCap).Nonempty
  rw [← southCoordinates_image_ball]
  exact (Metric.nonempty_ball.mpr one_pos).image _

private theorem interior_northClosure_nonempty : (interior northClosure.raw).Nonempty := by
  rw [← flip_image_south_eq_north]
  change (interior (flip.toHomeomorph '' southClosure.raw)).Nonempty
  rw [← flip.toHomeomorph.image_interior]
  exact interior_southClosure_nonempty.image _

/-- The fixed core marking is the identity on the source. The attached
ball marking uses the opposite hemisphere. -/
def roundEquatorMarkedGeometry (north : Bool) : MarkedCapGeometry (𝓡 4) S₄ (𝓡 4) S₄ :=
  let fixed := if north then northClosure else southClosure
  { raw := fixed.raw
    rawMeasurable := fixed.rawMeasurable
    interior_nonempty := by
      cases north
      · exact interior_southClosure_nonempty
      · exact interior_northClosure_nonempty
    core := fixed.core
    marking := fixed.marking
    capInMarking := fixed.capInMarking
    rawInCore := fixed.rawInCore
    coreImage := fixed.coreImage }

/-- The cap chart uses the same hemisphere and angular marking as the
fixed marked geometry of the retained side. -/
theorem roundEquatorCapChart_tracks_marking (north : Bool) (z : E₄) :
    (roundEquatorMarkedGeometry north).marking (roundEquatorCapChart false z) =
      roundEquatorCapChart (!north) z := by
  cases north <;> rfl

/-- Both marked reassemblies are realized by the identity on the original
oriented sphere, with the whole discarded side equal to the marked cap. -/
theorem roundEquator_orientedReassembly (o : ManifoldOrientation (𝓡 4) S₄ 4) (north : Bool) :
    let keep := roundEquatorMarkedGeometry north
    let discard := roundEquatorMarkedGeometry (!north)
    ∃ Φ : S₄ ≃ₘ⟮𝓡 4, 𝓡 4⟯ S₄, Φ.preservesOrientation o o ∧
      EqOn Φ keep.core keep.core.source ∧ Φ '' discard.raw = keep.marking '' standardFourSphereCap := by
  intro keep discard
  refine ⟨Diffeomorph.refl (𝓡 4) S₄ ∞, Diffeomorph.preservesOrientation_refl o, ?_, ?_⟩
  · cases north <;> intro x hx <;> rfl
  · cases north
    · change id '' northClosure.raw = flip '' southClosure.raw
      rw [image_id, flip_image_south_eq_north]
    · change id '' southClosure.raw = id '' southClosure.raw
      rfl

/-- The two complete sides cover the actual source and overlap in a set of
zero physical volume. The seam is the boundary of the marked chart disk. -/
theorem roundEquator_rawCover_and_nullOverlap :
    (roundEquatorMarkedGeometry true).raw ∪ (roundEquatorMarkedGeometry false).raw = univ ∧
    AEDisjoint (riemannianVolumeMeasure (𝓡 4) S₄ standardRoundFourMetric)
      (roundEquatorMarkedGeometry true).raw (roundEquatorMarkedGeometry false).raw := by
  constructor
  · exact eq_univ_of_forall fun x => (le_total 0 (height x)).elim Or.inl Or.inr
  · have hm := markedDisk_seam_null standardRoundFourMetric
      (riemannianVolumeMeasure (𝓡 4) S₄ standardRoundFourMetric)
      Measure.AbsolutelyContinuous.rfl southCoordinates (southCoordinates_source ▸ subset_univ _)
    change riemannianVolumeMeasure (𝓡 4) S₄ standardRoundFourMetric
      ((southCoordinates '' Metric.closedBall (0 : E₄) 1) \ interior (southCoordinates '' Metric.closedBall 0 1)) = 0 at hm
    rw [southCoordinates_image_closedBall] at hm
    have hsets : northClosure.raw ∩ southClosure.raw = southClosure.raw \ interior southClosure.raw := by
      change northClosure.raw ∩ southClosure.raw = southClosure.raw \ interior standardFourSphereCap
      rw [interior_south]
      ext x
      change (0 ≤ height x ∧ height x ≤ 0) ↔ height x ≤ 0 ∧ ¬ height x < 0
      rw [not_lt, and_comm]
    change riemannianVolumeMeasure (𝓡 4) S₄ standardRoundFourMetric
      (northClosure.raw ∩ southClosure.raw) = 0
    rw [hsets]
    exact hm

/-- The two bulk Dirichlet forms of an actual smooth joined test add to the
closed round form. Both integrals are in the physical round measure. -/
theorem roundEquatorJoinedForm_eq_sideSum (f : C^∞⟮𝓡 4, S₄; ℝ⟯) :
    let μ := riemannianVolumeMeasure (𝓡 4) S₄ standardRoundFourMetric
    let d := fun x => 12 * f x ^ 2 + 6 * normGradSqFun standardRoundFourMetric f x
    roundEquatorJoinedForm f = (∫ x in northClosure.raw, d x ∂μ) + (∫ x in southClosure.raw, d x ∂μ) := by
  intro μ d
  let : IsFiniteMeasureOnCompacts μ := riemannianVolumeMeasure_isFiniteMeasureOnCompacts standardRoundFourMetric
  have hMass : Integrable (fun x => f x ^ 2) μ :=
    (f.contMDiff.continuous.pow 2).integrable_of_hasCompactSupport (HasCompactSupport.of_compactSpace _)
  have hGrad : Integrable (normGradSqFun standardRoundFourMetric f) μ :=
    (normGradSqFun_continuous standardRoundFourMetric f.contMDiff).integrable_of_hasCompactSupport
      (HasCompactSupport.of_compactSpace _)
  have hD : Integrable d μ := (hMass.const_mul 12).add (hGrad.const_mul 6)
  have hCover : northClosure.raw ∪ southClosure.raw = univ := roundEquator_rawCover_and_nullOverlap.1
  have hDisjoint : AEDisjoint μ northClosure.raw southClosure.raw := roundEquator_rawCover_and_nullOverlap.2
  have hSum := setIntegral_union₀ hDisjoint southClosure.rawMeasurable.nullMeasurableSet
    hD.integrableOn hD.integrableOn
  rw [hCover, setIntegral_univ] at hSum
  rw [← hSum]
  unfold d roundEquatorJoinedForm
  rw [integral_add (hMass.const_mul 12) (hGrad.const_mul 6), integral_const_mul, integral_const_mul]

/-- Either fixed round side can be closed on the original carrier itself by
its opposite hemisphere. The whole metric is already smooth, so the E52
cap supplier is constant and its smoothing strip is empty. -/
def roundEquatorCapSmoothing (o : ManifoldOrientation (𝓡 4) S₄ 4)
    (north : Bool) : MarkedCapSmoothing (oX := o) (signedRound o) (roundEquatorMarkedGeometry north)
      (fun u => roundEquatorJoinedForm (capExpFactor u)) where
  smooth _ := signedRound o
  sourceBand _ := ∅
  capBand _ := ∅
  sourceBand_measurable _ := MeasurableSet.empty
  capBand_measurable _ := MeasurableSet.empty
  sourceBand_subset _ := empty_subset _
  offBand_eq _ sign := (roundEquator_charge_zero o sign _).trans (roundEquator_charge_zero o sign _).symm
  sourceBandVolume_zero := by simp
  capBandVolume_zero := by simp
  densityBound := 0
  sourceDensity_le _ _ _ hx := hx.elim
  capDensity_le _ _ _ hx := hx.elim
  referenceH1Sq u := roundEquatorH1Sq (capExpFactor u)
  formError _ := 0
  formError_zero := tendsto_const_nhds
  formError_le _ u := by
    change |capTestScalar (conformalMetric standardRoundFourMetric u) - _| ≤ _
    rw [capTestScalar_eq_capFactorScalar (by simp : Module.finrank ℝ E₄ = 4),
      ← roundEquatorJoinedForm_eq_capFactorScalar]
    simp
  testVolume_le := by
    obtain ⟨C, hC, hTest⟩ := roundEquator_testVolumeBound
    exact ⟨C, hC, fun _ => hTest⟩

/-- Both actual caps are already positive. The signed comparisons are exact
on the complete source sides and on the complete capped carrier. -/
theorem roundEquator_exact_cap (o : ManifoldOrientation (𝓡 4) S₄ 4) (north : Bool) :
    0 < classYamabeFour o.dimension_eq ((roundEquatorCapSmoothing o north).smooth 0).metric ∧
    (∀ sign, ((roundEquatorCapSmoothing o north).smooth 0).energy sign = 0 ∧
      (signedRound o).charge sign (roundEquatorMarkedGeometry north).raw = 0) := by
  constructor
  · exact standardRoundFour_yamabe_pos
  · intro sign
    change (signedRound o).energy sign = 0 ∧ _
    rw [← SignedCollarMetric.charge_univ]
    exact ⟨roundEquator_charge_zero o sign _, roundEquator_charge_zero o sign _⟩

end SmoothPoincare
