import DifferentialGeometry.Analysis.Integration.Measure.Conformal
import DifferentialGeometry.Analysis.Integration.Measure.PullbackCross
import DifferentialGeometry.Analysis.Integration.Measure.Riemannian.Euclidean
import DifferentialGeometry.Geometry.Measure.Product
import DifferentialGeometry.Geometry.Metric.Euclidean.PolarCoordinates
import Mathlib.Analysis.SpecialFunctions.ImproperIntegrals
import DifferentialGeometry.Geometry.Metric.Sphere.Round.Metric
import Mathlib.MeasureTheory.Measure.Lebesgue.VolumeOfBalls
import SmoothPoincare.Heights.GaussSheets

/-! # Ordinary area of the Gauss direction sphere -/

noncomputable section

open DifferentialGeometry DifferentialGeometry.Geometry DifferentialGeometry.Integral.Measure
open MeasureTheory Set Manifold
open scoped ContDiff ENNReal Manifold Pointwise InnerProductSpace

namespace SmoothPoincare

local notation "E₅" => EuclideanSpace ℝ (Fin 5)

/-- Surface measure on the actual direction sphere, defined by radial cones
    in Euclidean five-dimensional Lebesgue measure. -/
def gaussConeArea : Measure GaussDirection := (volume : Measure E₅).toSphere

private theorem gaussAmbient_unitBall :
    (volume : Measure E₅) (Metric.ball 0 1) = ENNReal.ofReal (8 * Real.pi ^ 2 / 15) := by
  rw [EuclideanSpace.volume_ball (Fin 5)]
  simp only [Fintype.card_fin, ENNReal.ofReal_one, one_pow, one_mul, Nat.cast_ofNat]
  congr 1
  have h₁ := Real.Gamma_add_one (s := 1 / 2) (by norm_num)
  have h₂ := Real.Gamma_add_one (s := 1 / 2 + 1) (by norm_num)
  have h₃ := Real.Gamma_add_one (s := (1 / 2 + 1) + 1) (by norm_num)
  have harg : (5 : ℝ) / 2 + 1 = ((1 / 2 + 1) + 1) + 1 := by norm_num
  rw [harg, h₃, h₂, h₁, Real.Gamma_one_half_eq]
  have hπ : Real.sqrt Real.pi ≠ 0 := (Real.sqrt_pos.2 Real.pi_pos).ne'
  have hsq := Real.sq_sqrt Real.pi_pos.le
  rw [show (Real.sqrt Real.pi) ^ 5 = (Real.sqrt Real.pi) * ((Real.sqrt Real.pi) ^ 2) ^ 2 by ring,
    hsq]
  field_simp
  ring

/-- The cone normalization has the ordinary spherical area of the unit four-sphere. -/
theorem gaussConeArea_univ : gaussConeArea univ = ENNReal.ofReal (8 * Real.pi ^ 2 / 3) := by
  rw [gaussConeArea, Measure.toSphere_apply_univ, gaussAmbient_unitBall,
    finrank_euclideanSpace_fin]
  norm_num only [Nat.cast_ofNat]
  rw [← ENNReal.ofReal_ofNat (n := 5), ← ENNReal.ofReal_mul (by positivity : (0 : ℝ) ≤ 5)]
  congr 1
  ring

/-- The cone definition is invariant under the actual antipodal map. -/
theorem gaussConeArea_antipodal :
    MeasurePreserving (fun u : GaussDirection => -u) gaussConeArea gaussConeArea := by
  have hn : Measurable (fun u : GaussDirection => -u) :=
    (continuous_neg.comp continuous_subtype_val).subtype_mk (fun u : GaussDirection => (-u).2) |>.measurable
  refine ⟨hn, Measure.ext fun s hs => ?_⟩
  rw [Measure.map_apply hn hs, gaussConeArea, Measure.toSphere_apply' _ (hn hs),
    Measure.toSphere_apply' _ hs]
  congr 1
  have hc : (Ioo (0 : ℝ) 1 • (Subtype.val '' ((fun u : GaussDirection => -u) ⁻¹' s))) =
      (fun x : E₅ => -x) ⁻¹' (Ioo (0 : ℝ) 1 • (Subtype.val '' s)) := by
    ext x
    simp only [mem_preimage, mem_smul]
    constructor
    · rintro ⟨r, hr, _, ⟨u, hu, rfl⟩, rfl⟩
      exact ⟨r, hr, ↑(-u), ⟨-u, hu, rfl⟩, by simp⟩
    · rintro ⟨r, hr, _, ⟨u, hu, rfl⟩, h⟩
      refine ⟨r, hr, ↑(-u), ⟨-u, by simpa using hu, rfl⟩, ?_⟩
      simpa only [coe_neg_sphere, smul_neg, neg_neg] using congrArg Neg.neg h
  rw [hc]
  have hp := Measure.measurePreserving_neg (volume : Measure E₅)
  apply hp.measure_preimage
  apply MeasurableSet.nullMeasurableSet
  let e := homeomorphUnitSphereProd E₅
  let r₁ : Ioi (0 : ℝ) := ⟨1, mem_Ioi.mpr zero_lt_one⟩
  have hset : MeasurableSet ((Subtype.val ∘ e.symm) '' (s ×ˢ Iio r₁)) :=
    ((MeasurableEmbedding.subtype_coe (measurableSet_singleton (0 : E₅)).compl).comp
      e.symm.measurableEmbedding).measurableSet_image' (hs.prod measurableSet_Iio)
  convert hset using 1
  ext x
  constructor
  · rintro ⟨r, hr, _, ⟨u, hu, rfl⟩, rfl⟩
    exact ⟨(u, ⟨r, hr.1⟩), ⟨hu, hr.2⟩, by simp [e]⟩
  · rintro ⟨⟨u, r⟩, ⟨hu, hr⟩, rfl⟩
    exact ⟨r, ⟨r.2, hr⟩, ↑u, ⟨u, hu, rfl⟩, by simp [e]⟩

private local instance : Fact (Module.finrank ℝ E₅ = 4 + 1) := ⟨by simp⟩

/-- The induced round metric on the actual direction sphere. -/
abbrev gaussRoundMetric : SmoothRiemannianMetric (𝓡 4) GaussDirection :=
  roundMetric (E := E₅) (n := 4)

/-- The Riemannian target volume used in the Gauss sheet change of variables. -/
def gaussRoundArea : Measure GaussDirection :=
  cast (congrArg (fun m => @Measure GaussDirection m)
    (BorelSpace.measurable_eq (α := GaussDirection)).symm)
    (riemannianVolumeMeasure (𝓡 4) GaussDirection gaussRoundMetric)

private theorem gaussMeasure_apply_cast {X : Type*} {m m' : MeasurableSpace X}
    (h : m = m') (μ : @Measure X m) (s : Set X) :
    (cast (congrArg (fun q => @Measure X q) h) μ) s = μ s := by
  cases h
  rfl

/-- The Riemannian volume evaluated in the sphere's inherited measurable space. -/
theorem gaussRoundArea_apply (s : Set GaussDirection) :
    gaussRoundArea s = riemannianVolumeMeasure (𝓡 4) GaussDirection gaussRoundMetric s :=
  gaussMeasure_apply_cast (BorelSpace.measurable_eq (α := GaussDirection)).symm _ _

/-- Transport to the Borel instance used by the parametric area formula. -/
theorem gaussRoundArea_borel :
    cast (congrArg (fun m => @Measure GaussDirection m)
      (BorelSpace.measurable_eq (α := GaussDirection))) gaussRoundArea =
      riemannianVolumeMeasure (𝓡 4) GaussDirection gaussRoundMetric := by
  have hm := BorelSpace.measurable_eq (α := GaussDirection)
  exact @Measure.ext GaussDirection (borel GaussDirection) _ _ fun s _ =>
    (gaussMeasure_apply_cast hm gaussRoundArea s).trans (gaussRoundArea_apply s)

private theorem gaussMeasurableSet_cast {X : Type*} {m m' : MeasurableSpace X}
    (h : m = m') {s : Set X} (hs : @MeasurableSet X m s) :
    @MeasurableSet X m' s := h ▸ hs

private theorem gaussSetLIntegral_cast {X : Type*} {m m' : MeasurableSpace X}
    (h : m = m') (μ : @Measure X m) (s : Set X) (f : X → ℝ≥0∞) :
    @lintegral X m' ((cast (congrArg (fun q => @Measure X q) h) μ).restrict s) f =
      @lintegral X m (μ.restrict s) f := by
  cases h
  rfl

section Polar

open DifferentialGeometry.Geometry.Riemannian

local notation "C" => GaussDirection × ℝ
local notation "I₄" => 𝓡 4
local notation "I₅" => 𝓘(ℝ, E₅)
local notation "I꜀" => (ModelWithCorners.prod (𝓡 4) 𝓘(ℝ, ℝ))

private def gaussExpRadial : PartialDiffeomorph I꜀ I꜀ C C 1 where
  toFun := Prod.map id Real.exp
  invFun := Prod.map id Real.log
  source := univ
  target := {p | 0 < p.2}
  map_source' p _ := Real.exp_pos p.2
  map_target' _ _ := mem_univ _
  left_inv' p _ := Prod.ext rfl (Real.log_exp p.2)
  right_inv' p hp := Prod.ext rfl (Real.exp_log hp)
  open_source := isOpen_univ
  open_target := isOpen_Ioi.preimage continuous_snd
  contMDiffOn_toFun :=
    (contMDiff_id.prodMap Real.contDiff_exp.contMDiff).contMDiffOn
  contMDiffOn_invFun := by
    intro p hp
    have hp' : 0 < p.2 := hp
    have hlog : ContMDiffAt 𝓘(ℝ, ℝ) 𝓘(ℝ, ℝ) 1 Real.log p.2 :=
      (Real.contDiffAt_log.mpr hp'.ne').contMDiffAt
    have hfst : ContMDiffAt I꜀ I₄ 1 Prod.fst p := contMDiff_fst.contMDiffAt
    exact (hfst.prodMk (hlog.comp p contMDiff_snd.contMDiffAt)).contMDiffWithinAt

private def gaussLogPolar : PartialDiffeomorph I꜀ I₅ C E₅ 1 :=
  let P := euclideanPolarDiffeomorph (E := E₅) (n := 4)
  gaussExpRadial.trans
    { toPartialEquiv := P.toPartialEquiv
      open_source := P.open_source
      open_target := P.open_target
      contMDiffOn_toFun := P.contMDiffOn_toFun.of_le (by simp)
      contMDiffOn_invFun := P.contMDiffOn_invFun.of_le (by simp) }

private theorem gaussLogPolar_source : gaussLogPolar.source = univ := by
  ext p
  exact ⟨fun _ => mem_univ _, fun _ => ⟨mem_univ _, Real.exp_pos p.2⟩⟩

private theorem gaussLogPolar_apply (p : C) :
    gaussLogPolar p = Real.exp p.2 • (p.1 : E₅) := rfl

private theorem gaussLogPolar_mfderiv (p : C) (v : TangentSpace I꜀ p) :
    mfderiv I꜀ I₅ gaussLogPolar p v =
      Real.exp p.2 • (v.2 • (p.1 : E₅) + dIncl (n := 4) p.1 v.1) := by
  let R : C → C := Prod.map id Real.exp
  have hR : ContMDiff I꜀ I꜀ ∞ R := contMDiff_id.prodMap Real.contDiff_exp.contMDiff
  have hP := (euclideanPolarMap_smooth (E := E₅) (n := 4)).mdifferentiableAt
    (by simp : (∞ : ℕ∞ω) ≠ 0) (x := R p)
  change mfderiv I꜀ I₅ (euclideanPolarMap ∘ R) p v = _
  rw [mfderiv_comp_apply p hP (hR.mdifferentiableAt (by simp))]
  have hD : mfderiv I꜀ I꜀ R p v = (v.1, v.2 * Real.exp p.2) := by
    change mfderiv I꜀ I꜀ (Prod.map (id : GaussDirection → GaussDirection) Real.exp) p v = _
    have hExp : ContMDiff 𝓘(ℝ, ℝ) 𝓘(ℝ, ℝ) ∞ Real.exp := Real.contDiff_exp.contMDiff
    rw [mfderiv_prodMap mdifferentiableAt_id (hExp.mdifferentiableAt (by simp)), mfderiv_id,
      mfderiv_eq_fderiv, (Real.hasDerivAt_exp p.2).hasFDerivAt.fderiv]
    rfl
  rw [hD]
  refine (euclideanPolarMap_mfderiv (n := 4) (R p) (v.1, v.2 * Real.exp p.2)).trans ?_
  change (v.2 * Real.exp p.2) • (p.1 : E₅) + Real.exp p.2 • dIncl (n := 4) p.1 v.1 = _
  rw [smul_add, smul_smul, mul_comm (Real.exp p.2) v.2]

private def gaussCylinderMetric : SmoothRiemannianMetric I꜀ C :=
  gaussRoundMetric.prod (euclideanMetric (E := ℝ))

private def gaussCylinderHeight : C^∞⟮I꜀, C; ℝ⟯ := ⟨Prod.snd, contMDiff_snd⟩

private theorem gaussCylinder_inner (p : C) (v w : TangentSpace I꜀ p) :
    gaussCylinderMetric.inner p v w = gaussRoundMetric.inner p.1 v.1 w.1 + v.2 * w.2 := by
  rw [gaussCylinderMetric, SmoothRiemannianMetric.prod_inner]
  change _ + w.2 * v.2 = _
  rw [mul_comm w.2 v.2]

private theorem gauss_dIncl_orthogonal (u : GaussDirection) (v : TangentSpace I₄ u) :
    inner ℝ (u : E₅) (dIncl (n := 4) u v) = 0 := by
  apply Submodule.mem_orthogonal_singleton_iff_inner_right.mp
  have hv : dIncl (n := 4) u v ∈
      (mvfderiv I₄ (Subtype.val : GaussDirection → E₅) u).range := ⟨v, rfl⟩
  rwa [range_mvfderiv_subtypeVal (n := 4)] at hv

private theorem gaussLogPolar_inner {u a b : E₅}
    (hu : ⟪u, u⟫_ℝ = 1) (ha : ⟪a, u⟫_ℝ = 0) (hb : ⟪u, b⟫_ℝ = 0)
    (t v w : ℝ) :
    Real.exp (2 * t) * (⟪a, b⟫_ℝ + v * w) =
      ⟪Real.exp t • (v • u + a), Real.exp t • (w • u + b)⟫_ℝ := by
  simp only [real_inner_smul_left, real_inner_smul_right, inner_add_left, inner_add_right,
    ha, hb, hu, mul_zero, add_zero, zero_add, mul_one, two_mul, Real.exp_add]
  ring

private theorem gaussLogPolar_metric (p : C) (v w : TangentSpace I꜀ p) :
    (conformalMetric gaussCylinderMetric gaussCylinderHeight).inner p v w =
      (euclideanMetric (E := E₅)).inner (gaussLogPolar p)
        (mfderiv I꜀ I₅ gaussLogPolar p v) (mfderiv I꜀ I₅ gaussLogPolar p w) := by
  rw [conformalMetric_inner, gaussCylinder_inner, euclideanMetric_inner,
    gaussLogPolar_mfderiv, gaussLogPolar_mfderiv]
  change Real.exp (2 * p.2) *
    (⟪dIncl (n := 4) p.1 v.1, dIncl (n := 4) p.1 w.1⟫_ℝ + v.2 * w.2) = _
  have hv := gauss_dIncl_orthogonal p.1 v.1
  have hw := gauss_dIncl_orthogonal p.1 w.1
  rw [real_inner_comm] at hv
  have hnorm : ⟪(p.1 : E₅), (p.1 : E₅)⟫_ℝ = 1 := by
    rw [real_inner_self_eq_norm_sq, norm_eq_of_mem_sphere p.1, one_pow]
  exact gaussLogPolar_inner hnorm hv hw p.2 v.2 w.2

private theorem gaussLogPolar_image (s : Set GaussDirection) :
    gaussLogPolar '' (s ×ˢ Iio (0 : ℝ)) = Ioo (0 : ℝ) 1 • (Subtype.val '' s) := by
  ext x
  constructor
  · rintro ⟨⟨u, t⟩, ⟨hu, ht⟩, rfl⟩
    exact ⟨Real.exp t, ⟨Real.exp_pos _, Real.exp_lt_one_iff.mpr ht⟩,
      ↑u, ⟨u, hu, rfl⟩, gaussLogPolar_apply (u, t) |>.symm⟩
  · rintro ⟨r, hr, _, ⟨u, hu, rfl⟩, rfl⟩
    refine ⟨(u, Real.log r), ⟨hu, Real.log_neg hr.1 hr.2⟩, ?_⟩
    rw [gaussLogPolar_apply, Real.exp_log hr.1]

private theorem gaussLogPolar_radial_mass :
    (∫⁻ t in Iio (0 : ℝ), ENNReal.ofReal (Real.exp (5 * t)) ∂volume) =
      ENNReal.ofReal (1 / 5) := by
  rw [Measure.restrict_congr_set Iio_ae_eq_Iic,
    ← ofReal_integral_eq_lintegral_ofReal (integrableOn_exp_mul_Iic (by norm_num) 0)
      (Filter.Eventually.of_forall fun _ => (Real.exp_pos _).le),
    integral_exp_mul_Iic (by norm_num)]
  simp

private theorem gaussCylinder_volume (s : Set GaussDirection)
    (hs : @MeasurableSet C (borel C) (s ×ˢ Iio (0 : ℝ))) :
    riemannianVolumeMeasure I꜀ C (conformalMetric gaussCylinderMetric gaussCylinderHeight)
      (s ×ˢ Iio (0 : ℝ)) = gaussRoundArea s * ENNReal.ofReal (1 / 5) := by
  let _ : MeasurableSpace GaussDirection := borel GaussDirection
  let _ : BorelSpace GaussDirection := ⟨rfl⟩
  let μ := riemannianVolumeMeasure I₄ GaussDirection gaussRoundMetric
  let _ : SigmaFinite μ := riemannianVolumeMeasure_sigmaFinite gaussRoundMetric
  have hProduct :=
    DifferentialGeometry.PDE.RicciFlow.Perelman.KappaSolutions.riemannianVolumeMeasure_product_real_of_inner_eq
      (I := I₄) gaussRoundMetric gaussCylinderMetric
      (fun u t v w a b => gaussCylinder_inner (u, t) (v, a) (w, b))
  have hMeasProduct := BorelSpace.measurable_eq (α := C)
  rw [riemannianVolumeMeasure_conformalMetric, withDensity_apply _ hs,
    hProduct, gaussSetLIntegral_cast hMeasProduct, ← Measure.prod_restrict, gaussRoundArea_apply]
  have hn : Module.finrank ℝ (EuclideanSpace ℝ (Fin 4) × ℝ) = 5 := by
    rw [Module.finrank_prod, finrank_euclideanSpace_fin, Module.finrank_self]
  simp only [hn, Nat.cast_ofNat]
  change (∫⁻ p, ENNReal.ofReal (Real.exp (5 * p.2)) ∂
    (μ.restrict s).prod (volume.restrict (Iio (0 : ℝ)))) = μ s * ENNReal.ofReal (1 / 5)
  have hExp : Measurable (fun t : ℝ => ENNReal.ofReal (Real.exp (5 * t))) :=
    (Real.continuous_exp.comp (continuous_const.mul continuous_id)).measurable.ennreal_ofReal
  simpa only [one_mul, lintegral_const, Measure.restrict_apply_univ, gaussLogPolar_radial_mass]
    using (lintegral_prod_mul (μ := μ.restrict s) (ν := volume.restrict (Iio (0 : ℝ)))
      (f := fun _ => 1) aemeasurable_const hExp.aemeasurable)

private theorem gaussAmbient_volume_apply (s : Set E₅) :
    riemannianVolumeMeasure I₅ E₅ (euclideanMetric (E := E₅)) s =
      (volume : Measure E₅) s := by
  have h := BorelSpace.measurable_eq (α := E₅)
  have h_cast :
      cast (congrArg (fun m => @Measure E₅ m) h) (volume : Measure E₅) =
        riemannianVolumeMeasure I₅ E₅ (euclideanMetric (E := E₅)) := by
    rw [riemannianVolumeMeasure_euclideanMetric]
    have hNative : BorelSpace E₅ := inferInstance
    let _ : MeasurableSpace E₅ := borel E₅
    have hBorel : BorelSpace E₅ := ⟨rfl⟩
    exact cast_addHaar h hNative hBorel (stdOrthonormalBasis ℝ E₅).toBasis
  rw [← h_cast]
  exact gaussMeasure_apply_cast h volume s

/-- The round metric's Riemannian volume equals the ambient radial-cone measure. -/
theorem gaussRoundArea_eq_gaussConeArea : gaussRoundArea = gaussConeArea := by
  refine Measure.ext fun s hs => ?_
  have hsC : @MeasurableSet C (borel C) (s ×ˢ Iio (0 : ℝ)) :=
    gaussMeasurableSet_cast (BorelSpace.measurable_eq (α := C)) (hs.prod measurableSet_Iio)
  have h := riemannianVolumeMeasure_image_of_partialIsometry
    (conformalMetric gaussCylinderMetric gaussCylinderHeight) (euclideanMetric (E := E₅))
    gaussLogPolar (fun p _ => gaussLogPolar_metric p) hsC
    (by rw [gaussLogPolar_source]; exact subset_univ _)
  rw [gaussLogPolar_image, gaussCylinder_volume s hsC,
    gaussAmbient_volume_apply] at h
  rw [gaussConeArea, Measure.toSphere_apply' _ hs, finrank_euclideanSpace_fin, ← h]
  norm_num only [Nat.cast_ofNat]
  rw [← mul_assoc, mul_comm (5 : ℝ≥0∞) (gaussRoundArea s), mul_assoc,
    ← ENNReal.ofReal_ofNat (n := 5), ← ENNReal.ofReal_mul (by norm_num : (0 : ℝ) ≤ 5)]
  norm_num

/-- The Riemannian target area has mass $8\pi^2/3$. -/
theorem gaussRoundArea_univ : gaussRoundArea univ = ENNReal.ofReal (8 * Real.pi ^ 2 / 3) := by
  rw [gaussRoundArea_eq_gaussConeArea, gaussConeArea_univ]

/-- The actual antipodal map preserves the Riemannian target area. -/
theorem gaussRoundArea_antipodal :
    MeasurePreserving (fun u : GaussDirection => -u) gaussRoundArea gaussRoundArea := by
  rw [gaussRoundArea_eq_gaussConeArea]
  exact gaussConeArea_antipodal

end Polar

end SmoothPoincare
