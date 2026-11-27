import SmoothPoincare.Variational.BourBufferedTruncation
import DifferentialGeometry.Analysis.Integration.Measure.Conformal
import DifferentialGeometry.Analysis.Integration.Measure.NullImage
import Mathlib.MeasureTheory.Function.JacobianOneDim

/-! # Physical volume of the buffered spherical cap

27 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance.
Actual serving model and effort were unavailable.
-/

noncomputable section

open DifferentialGeometry DifferentialGeometry.Geometry
open DifferentialGeometry.Integral.Measure DifferentialGeometry.Topology.Manifold
open Filter FirstOrderTwistor Function MeasureTheory Metric Set
open scoped ContDiff Manifold Topology RealInnerProductSpace

namespace SmoothPoincare

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "I₄" => 𝓘(ℝ, E₄)
local notation "S₄" => StandardFourSphere
local notation "north" => transportedCapNorthPole

private abbrev standardEuclideanMeasurableSpace : MeasurableSpace E₄ := inferInstance

private theorem unitLinkArea_borel (m : MeasurableSpace E₄) (hm : @BorelSpace E₄ _ m) :
    letI : MeasurableSpace E₄ := m
    letI : BorelSpace E₄ := hm
    ((volume : Measure E₄).toSphere).real univ = 2 * Real.pi ^ 2 := by
  have hDefault : @BorelSpace E₄ _ standardEuclideanMeasurableSpace := inferInstance
  have h : m = standardEuclideanMeasurableSpace :=
    hm.measurable_eq.trans hDefault.measurable_eq.symm
  cases h.symm
  exact bourEuclideanUnitLinkArea

private local instance : Fact (Module.finrank ℝ (EuclideanSpace ℝ (Fin 5)) = 4 + 1) := ⟨by simp⟩
private local instance : MeasurableSpace E₄ := borel E₄
private local instance : BorelSpace E₄ := ⟨rfl⟩
private local instance : MeasurableSpace S₄ := borel S₄
private local instance : BorelSpace S₄ := ⟨rfl⟩

private theorem chart_source {r : ℝ} (hr : 0 < r) :
    (bourBufferedSphereChart r hr).source = univ :=
  transportedCapPocketChart_target r hr

private theorem chart_target {r : ℝ} (hr : 0 < r) :
    (bourBufferedSphereChart r hr).target = ({north} : Set S₄)ᶜ := by
  change (transportedCapPocketChart r hr).source = _
  rw [transportedCapPocketChart_source, transportedCapStereographic_source]

private theorem chart_local {r : ℝ} (hr : 0 < r) :
    IsLocalDiffeomorph I₄ I₄ ∞ (bourBufferedSphereChart r hr : E₄ → S₄) :=
  fun x => (bourBufferedSphereChart r hr).isLocalDiffeomorphAt I₄ I₄ ∞
    (chart_source hr ▸ mem_univ x)

private theorem chart_injective {r : ℝ} (hr : 0 < r) :
    Injective (bourBufferedSphereChart r hr : E₄ → S₄) :=
  fun _ _ h => (bourBufferedSphereChart r hr).injOn
    (chart_source hr ▸ mem_univ _) (chart_source hr ▸ mem_univ _) h

private theorem markedCore_closed {r : ℝ} (hr : 0 < r) :
    IsClosed standardFourSphereCap := by
  rw [← (bourBufferedSphere_markedDisk r hr).1]
  exact ((isCompact_closedBall _ _).image (chart_local hr).contMDiff.continuous).isClosed

private theorem chart_preimage_cap {r : ℝ} (hr : 0 < r) :
    bourBufferedSphereChart r hr ⁻¹' standardFourSphereCapᶜ = (norm : E₄ → ℝ) ⁻¹' Ioi r := by
  rw [← (bourBufferedSphere_markedDisk r hr).1, preimage_compl, (chart_injective hr).preimage_image]
  ext z
  simp [mem_closedBall, dist_zero_right]

private def logSpeed (r b : ℝ) (z : E₄) : ℝ :=
  Real.smoothTransition (‖z‖ ^ 2 / b ^ 2 - 1) * Real.log (2 * r / (r ^ 2 + ‖z‖ ^ 2))

private theorem logSpeed_smooth {r : ℝ} (hr : 0 < r) (b : ℝ) : ContDiff ℝ ∞ (logSpeed r b) := by
  have hn : ContDiff ℝ ∞ (fun z : E₄ => ‖z‖ ^ 2) := contDiff_norm_sq ℝ
  have hround : ContDiff ℝ ∞ (fun z : E₄ => 2 * r / (r ^ 2 + ‖z‖ ^ 2)) :=
    contDiff_const.div (contDiff_const.add hn) (fun _ => ne_of_gt (by positivity))
  exact (Real.smoothTransition.contDiff.comp ((hn.div_const (b ^ 2)).sub contDiff_const)).mul
    (hround.log (fun _ => ne_of_gt (by positivity)))

private theorem speed_continuous {r : ℝ} (hr : 0 < r) (b : ℝ) :
    Continuous (bourBufferedRadialSpeed r b) := by
  have hround : Continuous (fun t : ℝ => 2 * r / (r ^ 2 + t ^ 2)) :=
    continuous_const.div (continuous_const.add (continuous_id.pow 2))
      (fun _ => ne_of_gt (by positivity))
  unfold bourBufferedRadialSpeed
  exact Real.continuous_exp.comp (((Real.smoothTransition.contDiff (n := ⊤)).continuous.comp
    (((continuous_id.pow 2).div_const (b ^ 2)).sub continuous_const)).mul
      (hround.log (fun _ => ne_of_gt (by positivity))))

private theorem pole_volume_zero (G : SmoothRiemannianMetric I₄ S₄) :
    riemannianVolumeMeasure I₄ S₄ G {north} = 0 := by
  have h := riemannianVolumeMeasure_image_eq_zero_of_mdifferentiableOn G
    (f := fun _ : E₄ => north) (s := {(0 : E₄)})
    mdifferentiable_const.mdifferentiableOn (measure_singleton _)
  simpa using h

/-- The measure of the whole physical closed metric is the pushforward of
the Euclidean chart measure with the fourth power of its actual length factor. -/
theorem bourBufferedSphere_chart_volume {r b : ℝ} (hr : 0 < r) (hb : 0 < b) :
    Measure.map (bourBufferedSphereChart r hr)
      ((volume : Measure E₄).withDensity
        (fun z => ENNReal.ofReal (bourBufferedRadialSpeed r b ‖z‖ ^ 4))) =
      riemannianVolumeMeasure I₄ S₄ (bourBufferedSphereMetric r hr b hb) := by
  let Q := bourBufferedSphereChart r hr
  let G := bourBufferedSphereMetric r hr b hb
  let u : C^∞⟮I₄, E₄; ℝ⟯ := ⟨logSpeed r b, (logSpeed_smooth hr b).contMDiff⟩
  let g := DifferentialGeometry.conformalMetric (euclideanMetric (E := E₄)) u
  have hmetric (z v w : E₄) :
      g.inner z v w = G.inner (Q z) (mfderiv I₄ I₄ Q z v) (mfderiv I₄ I₄ Q z w) := by
    rw [show G.inner (Q z) (mfderiv I₄ I₄ Q z v) (mfderiv I₄ I₄ Q z w) =
      bourBufferedRadialSpeed r b ‖z‖ ^ 2 * ⟪v, w⟫ from
        bourBufferedSphereMetric_radial_inner hr hb z v w]
    change Real.exp (2 * logSpeed r b z) * ⟪v, w⟫ = _
    congr 1
    simpa only [Nat.cast_ofNat, logSpeed, bourBufferedRadialSpeed] using
      (Real.exp_nat_mul (logSpeed r b z) 2)
  have hg : riemannianVolumeMeasure I₄ E₄ g =
      (volume : Measure E₄).withDensity
        (fun z => ENNReal.ofReal (bourBufferedRadialSpeed r b ‖z‖ ^ 4)) := by
    have hdim : Module.finrank ℝ E₄ = 4 := by simp
    rw [show g = DifferentialGeometry.conformalMetric (euclideanMetric (E := E₄)) u from rfl,
      riemannianVolumeMeasure_conformalMetric, riemannianVolumeMeasure_euclideanMetric,
      hdim, Nat.cast_ofNat]
    congr 1
    funext z
    change ENNReal.ofReal (Real.exp (4 * logSpeed r b z)) = _
    congr 1
    simpa only [Nat.cast_ofNat, logSpeed, bourBufferedRadialSpeed] using
      (Real.exp_nat_mul (logSpeed r b z) 4)
  have hRange : range (Q : E₄ → S₄) = ({north} : Set S₄)ᶜ := by
    rw [← chart_target hr]
    exact subset_antisymm
      (by rintro _ ⟨z, rfl⟩; exact Q.map_source' (chart_source hr ▸ mem_univ z))
      (fun p hp => ⟨Q.symm p, Q.right_inv' hp⟩)
  let μ := riemannianVolumeMeasure I₄ S₄ G
  have hPole : μ {north} = 0 := pole_volume_zero G
  rw [← hg, DifferentialGeometry.Geometry.Measure.riemannianVolumeMeasure_map_of_injective_local_isometry
    g G Q (chart_local hr) (chart_injective hr) hmetric, hRange]
  apply Measure.restrict_eq_self_of_ae_mem
  rw [ae_iff]
  simpa only [mem_compl_iff, not_not, ofPred_mem_eq] using hPole

/-- The native radius read by the actual inverse marking, with a chosen
value at the measure-zero omitted pole. -/
def bourBufferedSphereRadius (r : ℝ) (hr : 0 < r) (p : S₄) : ℝ :=
  ‖(bourBufferedSphereChart r hr).symm p‖

theorem bourBufferedSphereRadius_measurable {r : ℝ} (hr : 0 < r) :
    Measurable (bourBufferedSphereRadius r hr) := by
  apply measurable_of_measurable_on_compl_singleton north
  have h : ContinuousOn (bourBufferedSphereRadius r hr) ({north} : Set S₄)ᶜ := by
    rw [← chart_target hr]
    exact (bourBufferedSphereChart r hr).contMDiffOn_invFun.continuousOn.norm
  exact (continuousOn_iff_continuous_domRestrict.mp h).measurable

@[simp] theorem bourBufferedSphereRadius_chart {r : ℝ} (hr : 0 < r) (z : E₄) :
    bourBufferedSphereRadius r hr (bourBufferedSphereChart r hr z) = ‖z‖ := by
  let Q := bourBufferedSphereChart r hr
  have hInv : Q.symm (Q z) = z := Q.left_inv' (chart_source hr ▸ mem_univ z)
  change ‖Q.symm (Q z)‖ = ‖z‖
  rw [hInv]

/-- The physical open cap is covered almost everywhere by the same marked
chart at native radii beyond the seam. -/
theorem bourBufferedSphere_cap_ae {r b : ℝ} (hr : 0 < r) (hb : 0 < b) :
    ∀ᵐ p ∂(riemannianVolumeMeasure I₄ S₄ (bourBufferedSphereMetric r hr b hb)).restrict
        standardFourSphereCapᶜ,
      ∃ z : E₄, r < ‖z‖ ∧ bourBufferedSphereChart r hr z = p := by
  let Q := bourBufferedSphereChart r hr
  let G := bourBufferedSphereMetric r hr b hb
  let μ := riemannianVolumeMeasure I₄ S₄ G
  have hPole : ∀ᵐ p ∂μ, p ∈ ({north} : Set S₄)ᶜ := by
    rw [ae_iff]
    simpa only [mem_compl_iff, not_not, ofPred_mem_eq] using pole_volume_zero G
  filter_upwards [ae_restrict_of_ae hPole,
    ae_restrict_mem (μ := μ) (markedCore_closed hr).isOpen_compl.measurableSet] with p hp hCap
  have hpQ : p ∈ Q.target := chart_target hr ▸ hp
  have hInv : Q (Q.symm p) = p := Q.right_inv' hpQ
  refine ⟨Q.symm p, ?_, hInv⟩
  change Q.symm p ∈ (norm : E₄ → ℝ) ⁻¹' Ioi r
  rw [← chart_preimage_cap hr, mem_preimage, hInv]
  exact hCap

private theorem norm_volume :
    Measure.map (norm : E₄ → ℝ) volume =
      (volume.restrict (Ioi (0 : ℝ))).withDensity (fun ρ => ENNReal.ofReal (2 * Real.pi ^ 2 * ρ ^ 3)) := by
  let A := ({(0 : E₄)} : Set E₄)ᶜ
  let B := Ioi (0 : ℝ)
  let σ := (volume : Measure E₄).toSphere
  let e := homeomorphUnitSphereProd E₄
  have hA : MeasurableSet A := (measurableSet_singleton _).compl
  have hB : MeasurableSet B := measurableSet_Ioi
  have h0 : (Measure.comap ((↑) : A → E₄) volume).map ((↑) : A → E₄) = volume := by
    rw [map_comap_subtype_coe hA, restrict_compl_singleton]
  have hDim : Module.finrank ℝ E₄ - 1 = 3 := by simp
  have hPolar : Measure.map e (Measure.comap ((↑) : A → E₄) volume) =
      σ.prod (Measure.volumeIoiPow 3) := by
    simpa only [hDim] using (Measure.measurePreserving_homeomorphUnitSphereProd (volume : Measure E₄)).map_eq
  have hCompose : (fun x : A => ‖(x : E₄)‖) =
      ((↑) : B → ℝ) ∘ Prod.snd ∘ e := by
    funext x
    exact (homeomorphUnitSphereProd_apply_snd_coe E₄ x).symm
  have hArea : σ univ = ENNReal.ofReal (2 * Real.pi ^ 2) := by
    have hAreaReal : (σ univ).toReal = 2 * Real.pi ^ 2 := by
      simpa only [Measure.real_def, σ] using
        unitLinkArea_borel (borel E₄) ⟨rfl⟩
    rw [← hAreaReal, ENNReal.ofReal_toReal (measure_ne_top σ univ)]
  have hBVol : Measure.map ((↑) : B → ℝ) (Measure.volumeIoiPow 3) =
      (volume.restrict B).withDensity (fun ρ => ENNReal.ofReal (ρ ^ 3)) := by
    ext T hT
    rw [Measure.map_apply measurable_subtype_coe hT, Measure.volumeIoiPow,
      withDensity_apply _ (measurable_subtype_coe hT)]
    change (∫⁻ x in ((↑) : B → ℝ) ⁻¹' T, ENNReal.ofReal ((x : ℝ) ^ 3)
      ∂Measure.comap ((↑) : B → ℝ) volume) = _
    rw [setLIntegral_subtype hB _ (fun ρ : ℝ => ENNReal.ofReal (ρ ^ 3)),
      withDensity_apply _ hT, Measure.restrict_restrict hT, image_preimage_eq_inter_range,
      Subtype.range_coe]
  have hDensity : Measurable (fun ρ : ℝ => ENNReal.ofReal (ρ ^ 3)) :=
    (continuous_id.pow (3 : ℕ)).measurable.ennreal_ofReal
  calc
    _ = Measure.map (fun x : A => ‖(x : E₄)‖) (Measure.comap ((↑) : A → E₄) volume) := by
      change _ = Measure.map ((norm : E₄ → ℝ) ∘ ((↑) : A → E₄)) _
      rw [← Measure.map_map continuous_norm.measurable measurable_subtype_coe, h0]
    _ = (σ univ) • Measure.map ((↑) : B → ℝ) (Measure.volumeIoiPow 3) := by
      rw [hCompose, ← Measure.map_map measurable_subtype_coe (measurable_snd.comp e.measurable),
        ← Measure.map_map measurable_snd e.measurable, hPolar, Measure.map_snd_prod,
        Measure.map_smul _ measurable_subtype_coe.aemeasurable]
    _ = _ := by
      rw [hBVol, hArea, ← withDensity_smul _ hDensity]
      apply withDensity_congr_ae
      exact ae_of_all _ fun ρ =>
        (ENNReal.ofReal_mul (by positivity : 0 ≤ 2 * Real.pi ^ 2)).symm

/-- The actual cap volume pushed to its native positive radii. -/
theorem bourBufferedSphere_native_volume {r b : ℝ} (hr : 0 < r) (hb : 0 < b) :
    Measure.map (bourBufferedSphereRadius r hr)
      ((riemannianVolumeMeasure I₄ S₄ (bourBufferedSphereMetric r hr b hb)).restrict
        standardFourSphereCapᶜ) =
      (volume.restrict (Ioi r)).withDensity
        (fun ρ => ENNReal.ofReal (2 * Real.pi ^ 2 * ρ ^ 3 * bourBufferedRadialSpeed r b ρ ^ 4)) := by
  let Q := bourBufferedSphereChart r hr
  let μ := (volume : Measure E₄)
  let w := fun ρ => ENNReal.ofReal (bourBufferedRadialSpeed r b ρ ^ 4)
  have hw : Measurable w := ((speed_continuous hr b).pow 4).measurable.ennreal_ofReal
  have hDensity : Measurable (fun ρ : ℝ => ENNReal.ofReal (2 * Real.pi ^ 2 * ρ ^ 3)) :=
    (continuous_const.mul (continuous_id.pow (3 : ℕ))).measurable.ennreal_ofReal
  have hQ : Measurable (Q : E₄ → S₄) := (chart_local hr).contMDiff.continuous.measurable
  rw [← bourBufferedSphere_chart_volume hr hb,
    Measure.restrict_map hQ (markedCore_closed hr).isOpen_compl.measurableSet,
    chart_preimage_cap hr, Measure.map_map (bourBufferedSphereRadius_measurable hr) hQ,
    show (bourBufferedSphereRadius r hr) ∘ Q = (norm : E₄ → ℝ) from
      funext (bourBufferedSphereRadius_chart hr)]
  ext T hT
  rw [Measure.map_apply continuous_norm.measurable hT, Measure.restrict_apply (continuous_norm.measurable hT),
    withDensity_apply _ ((continuous_norm.measurable hT).inter (continuous_norm.measurable measurableSet_Ioi))]
  change (∫⁻ z in (norm : E₄ → ℝ) ⁻¹' (T ∩ Ioi r), w ‖z‖ ∂μ) = _
  rw [← setLIntegral_map (hT.inter measurableSet_Ioi) hw continuous_norm.measurable, norm_volume,
    restrict_withDensity (hT.inter measurableSet_Ioi),
    lintegral_withDensity_eq_lintegral_mul _ hDensity hw,
    Measure.restrict_restrict (hT.inter measurableSet_Ioi),
    inter_eq_left.mpr (inter_subset_right.trans (Ioi_subset_Ioi hr.le)),
    withDensity_apply _ hT, Measure.restrict_restrict hT]
  apply lintegral_congr_ae
  filter_upwards [ae_restrict_mem (μ := volume) (hT.inter measurableSet_Ioi)] with ρ hρ
  have hpos : 0 < ρ := hr.trans hρ.2
  exact (ENNReal.ofReal_mul (by positivity : 0 ≤ 2 * Real.pi ^ 2 * ρ ^ 3)).symm

/-- The physical arclength is read on the closed metric via the same marked
spherical chart. -/
def bourBufferedSphereArclength (r : ℝ) (hr : 0 < r) (b : ℝ) : S₄ → ℝ :=
  bourBufferedRadialLength r b ∘ bourBufferedSphereRadius r hr

theorem bourBufferedSphereArclength_measurable {r : ℝ} (hr : 0 < r) (b : ℝ) :
    Measurable (bourBufferedSphereArclength r hr b) :=
  (continuous_iff_continuousAt.mpr (fun ρ =>
    (bourBufferedRadialLength_hasDerivAt hr b ρ).continuousAt)).measurable.comp
      (bourBufferedSphereRadius_measurable hr)

@[simp] theorem bourBufferedSphereArclength_chart {r : ℝ} (hr : 0 < r) (b : ℝ) (z : E₄) :
    bourBufferedSphereArclength r hr b (bourBufferedSphereChart r hr z) =
      bourBufferedRadialLength r b ‖z‖ := by
  simp only [bourBufferedSphereArclength, comp_apply, bourBufferedSphereRadius_chart]

/-- The actual cap volume pushed to the finite physical arclength interval.
Every profile realizing the marked angular radii has this same density. -/
theorem bourBufferedSphere_arclength_volume {r b : ℝ} (hr : 0 < r) (hBuffer : r < b)
    {f : ℝ → ℝ} (hf : Measurable f)
    (hRadius : ∀ ρ > r, f (bourBufferedRadialLength r b ρ) = ρ * bourBufferedRadialSpeed r b ρ) :
    Measure.map (bourBufferedSphereArclength r hr b)
      ((riemannianVolumeMeasure I₄ S₄ (bourBufferedSphereMetric r hr b (hr.trans hBuffer))).restrict
        standardFourSphereCapᶜ) =
      (volume.restrict (Ioo 0 (bourBufferedCapLength r b))).withDensity
        (fun s => ENNReal.ofReal (2 * Real.pi ^ 2 * f s ^ 3)) := by
  let s := bourBufferedRadialLength r b
  let L := bourBufferedCapLength r b
  let speed := bourBufferedRadialSpeed r b
  let u := fun y => ENNReal.ofReal (2 * Real.pi ^ 2 * f y ^ 3)
  have hs : Measurable s := (continuous_iff_continuousAt.mpr (fun ρ =>
    (bourBufferedRadialLength_hasDerivAt hr b ρ).continuousAt)).measurable
  have hMono : StrictMono s := bourBufferedRadialLength_strictMono hr b
  have hu : Measurable u := (measurable_const.mul (hf.pow_const 3)).ennreal_ofReal
  rw [bourBufferedSphereArclength, ← Measure.map_map hs (bourBufferedSphereRadius_measurable hr),
    bourBufferedSphere_native_volume hr (hr.trans hBuffer)]
  ext T hT
  rw [Measure.map_apply hs hT, withDensity_apply _ (hs hT), Measure.restrict_restrict (hs hT),
    withDensity_apply _ hT, Measure.restrict_restrict hT]
  have hImage : s '' (s ⁻¹' T ∩ Ioi r) = T ∩ Ioo 0 L := by
    rw [← bourBufferedRadialLength_image hr hBuffer, image_preimage_inter]
  rw [← hImage, lintegral_image_eq_lintegral_deriv_mul_of_monotoneOn
    ((hs hT).inter measurableSet_Ioi)
    (fun ρ _ => (bourBufferedRadialLength_hasDerivAt hr b ρ).hasDerivWithinAt)
    (hMono.monotone.monotoneOn _) u]
  apply lintegral_congr_ae
  filter_upwards [ae_restrict_mem (μ := volume) ((hs hT).inter measurableSet_Ioi)] with ρ hρ
  change ENNReal.ofReal (2 * Real.pi ^ 2 * ρ ^ 3 * speed ρ ^ 4) =
    ENNReal.ofReal (speed ρ) * u (s ρ)
  rw [show u (s ρ) = ENNReal.ofReal (2 * Real.pi ^ 2 * (ρ * speed ρ) ^ 3) by
    simp only [u, s, speed, hRadius ρ hρ.2],
    ← ENNReal.ofReal_mul (bourBufferedRadialSpeed_pos r b ρ).le]
  congr 1
  ring

end SmoothPoincare
