import SmoothPoincare.PhysicalScales.AnchoredShell
import SmoothPoincare.PhysicalScales.MetricQuantiles
import DifferentialGeometry.Analysis.Integration.Measure.Riemannian.Scaling
import DifferentialGeometry.Analysis.Integration.Measure.Riemannian.Euclidean
import Mathlib.MeasureTheory.Measure.Lebesgue.VolumeOfBalls
import Mathlib.Analysis.Calculus.Deriv.MeanValue

/-! # Physical radial volume and chart placement
The normalized radius is formed from the length distance of the original metric.
The volume test restricts its original Riemannian volume to the comparison image
before taking the distance pushforward.
-/

open DifferentialGeometry DifferentialGeometry.Geometry DifferentialGeometry.Integral.Measure
open Filter FirstOrderTwistor MeasureTheory SectionsAndConnections Set
open scoped ContDiff Manifold Topology

namespace SmoothPoincare

section RadialPushforward

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  [CompactSpace M] [ConnectedSpace M]

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

variable (g : SmoothRiemannianMetric I M) (x : M) (ρ : ℝ)

/-- The actual physical length distance from `x`, expressed in units of `ρ`. -/
noncomputable def physicalNormalizedRadius (y : M) : ℝ :=
  (riemannianEDistOf g x y).toReal / ρ

omit [FiniteDimensional ℝ E] in
theorem continuous_physicalNormalizedRadius :
    Continuous (physicalNormalizedRadius g x ρ) := by
  let := physicalMetricSpace g
  change Continuous (fun y => dist x y / ρ)
  exact (continuous_const.dist continuous_id).div_const _

/-- The volume in four-dimensional scaling units, restricted on the source
before pushing forward by its physical radius. -/
noncomputable def physicalRadialVolume (region : Set M) : Measure ℝ :=
  ENNReal.ofReal (ρ ^ 4)⁻¹ • Measure.map (physicalNormalizedRadius g x ρ)
    ((riemannianVolumeMeasure I M g).restrict region)

omit [FiniteDimensional ℝ E] in
theorem physicalNormalizedRadius_preimage_Ioo (hρ : 0 < ρ) (u v : ℝ) :
    let := physicalMetricSpace g
    physicalNormalizedRadius g x ρ ⁻¹' Ioo u v = physicalAnnulus x (u * ρ) (v * ρ) := by
  let := physicalMetricSpace g
  ext y
  change (u < dist x y / ρ ∧ dist x y / ρ < v) ↔
    (y ∈ Metric.ball x (v * ρ) ∧ y ∉ Metric.closedBall x (u * ρ))
  rw [lt_div_iff₀ hρ, div_lt_iff₀ hρ, Metric.mem_ball, Metric.mem_closedBall, not_le, dist_comm x y]
  exact and_comm

/-- A shell volume in the pushforward is exactly the physical shell mass
inside the chosen region, with the explicit fourth-dimensional rescaling. -/
theorem physicalRadialVolume_real_Ioo (hρ : 0 < ρ) (u v : ℝ) (region : Set M) :
    let := physicalMetricSpace g
    (physicalRadialVolume g x ρ region).real (Ioo u v) =
      (riemannianVolumeMeasure I M g).real
        (physicalAnnulus x (u * ρ) (v * ρ) ∩ region) / ρ ^ 4 := by
  let := physicalMetricSpace g
  have hm := (continuous_physicalNormalizedRadius g x ρ).measurable
  rw [measureReal_def, physicalRadialVolume, Measure.smul_apply, Measure.map_apply hm measurableSet_Ioo,
    Measure.restrict_apply (hm measurableSet_Ioo), physicalNormalizedRadius_preimage_Ioo g x ρ hρ,
    smul_eq_mul, ENNReal.toReal_mul, ENNReal.toReal_ofReal (inv_nonneg.mpr (pow_nonneg hρ.le 4))]
  exact mul_comm _ _

/-- Integrating a radial test against the normalized pushforward integrates
that same test on the selected part of the original physical source. -/
theorem integral_physicalRadialVolume (region : Set M) (φ : ℝ → ℝ) (hφ : Measurable φ)
    (hρ : 0 < ρ) :
    (∫ t, φ t ∂physicalRadialVolume g x ρ region) =
      (∫ y in region, φ (physicalNormalizedRadius g x ρ y)
        ∂riemannianVolumeMeasure I M g) / ρ ^ 4 := by
  rw [physicalRadialVolume, integral_smul_measure,
    integral_map (continuous_physicalNormalizedRadius g x ρ).measurable.aemeasurable
      hφ.aestronglyMeasurable,
    ENNReal.toReal_ofReal (inv_nonneg.mpr (pow_nonneg hρ.le 4)), smul_eq_mul,
    div_eq_mul_inv, mul_comm]

/-- The normalized whole-shell volume equals the measured part plus its
omitted physical volume. This remains true regardless of how the region is
obtained. -/
theorem physicalRadialVolume_real_Ioo_univ_eq_add
    [IsFiniteMeasure (riemannianVolumeMeasure I M g)]
    (hρ : 0 < ρ) (u v : ℝ) {region : Set M} (hregion : MeasurableSet region) :
    (physicalRadialVolume g x ρ univ).real (Ioo u v) =
      (physicalRadialVolume g x ρ region).real (Ioo u v) +
        (physicalRadialVolume g x ρ regionᶜ).real (Ioo u v) := by
  let := physicalMetricSpace g
  let S := physicalAnnulus x (u * ρ) (v * ρ)
  let vol := riemannianVolumeMeasure I M g
  have hS : MeasurableSet S := Metric.isOpen_ball.measurableSet.diff
    Metric.isClosed_closedBall.measurableSet
  have hdisj : Disjoint (S ∩ region) (S ∩ regionᶜ) :=
    disjoint_compl_right.mono inter_subset_right inter_subset_right
  have hadd : vol.real S = vol.real (S ∩ region) + vol.real (S ∩ regionᶜ) := by
    rw [← measureReal_union hdisj (hS.inter hregion.compl), ← inter_union_distrib_left,
      union_compl_self, inter_univ]
  simp only [physicalRadialVolume_real_Ioo g x ρ hρ, inter_univ]
  change vol.real S / ρ ^ 4 = vol.real (S ∩ region) / ρ ^ 4 + vol.real (S ∩ regionᶜ) / ρ ^ 4
  rw [hadd, add_div]

/-- In dimension four this pushforward is precisely the volume pushforward
for the constantly rescaled metric and its own distance. -/
theorem physicalRadialVolume_eq_map_scaleMetric
    (hdim : Module.finrank ℝ E = 4) {ρ : ℝ} (hρ : 0 < ρ) (region : Set M) :
    let h := scaleMetric (ρ ^ 2)⁻¹ (inv_pos.mpr (pow_pos hρ 2)) g
    physicalRadialVolume g x ρ region = Measure.map
      (fun y => (riemannianEDistOf h x y).toReal) ((riemannianVolumeMeasure I M h).restrict region) := by
  have hpos : 0 < (ρ ^ 2)⁻¹ := inv_pos.mpr (pow_pos hρ 2)
  have hsqrt : Real.sqrt ((ρ ^ 2)⁻¹) = ρ⁻¹ := by
    rw [Real.sqrt_inv, Real.sqrt_sq hρ.le]
  have hradius : (fun y => (riemannianEDistOf (scaleMetric (ρ ^ 2)⁻¹ hpos g) x y).toReal) =
      physicalNormalizedRadius g x ρ := by
    funext y
    rw [edistOf_scale, hsqrt, ENNReal.toReal_mul, ENNReal.toReal_ofReal (inv_nonneg.mpr hρ.le)]
    exact mul_comm _ _
  change _ = Measure.map (fun y => (riemannianEDistOf (scaleMetric (ρ ^ 2)⁻¹ hpos g) x y).toReal)
    ((riemannianVolumeMeasure I M (scaleMetric (ρ ^ 2)⁻¹ hpos g)).restrict region)
  rw [hradius, volume_scaleMetric, hdim, Measure.restrict_smul, Measure.map_smul _
    (continuous_physicalNormalizedRadius g x ρ).measurable.aemeasurable, physicalRadialVolume,
    ← ENNReal.ofReal_pow (Real.sqrt_nonneg _), hsqrt, inv_pow]

end RadialPushforward

section AnchoredChart

variable {M : Type*} [TopologicalSpace M] [ChartedSpace ShellCoordinates M]
  [IsManifold (𝓡 4) ∞ M] [T2Space M] [CompactSpace M] [ConnectedSpace M]

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

variable (g : SmoothRiemannianMetric (𝓡 4) M) (x : M)

private theorem normalizedDistanceLe (y : M) {ρ A : ℝ} (hρ : 0 < ρ)
    (h : physicalNormalizedRadius g x ρ y ≤ A) :
    riemannianEDistOf g x y ≤ ENNReal.ofReal (A * ρ) := by
  let := physicalMetricSpace g
  have hdist : dist x y ≤ A * ρ := (div_le_iff₀ hρ).mp h
  have heq : riemannianEDistOf g x y = ENNReal.ofReal (dist x y) := by
    simpa only [physicalMetricSpace_dist] using
      (ENNReal.ofReal_toReal (show riemannianEDistOf g x y ≠ ⊤ from
        riemannianEDistOf_ne_top g x y)).symm
  exact heq.trans_le (ENNReal.ofReal_le_ofReal hdist)

/-- A given radial comparison on the buffered band supplies the physical
anchor and places the entire band in one physical distance shell. -/
theorem physicalAnchor_and_anchoredBand_subset_of_radialApproximation
    (F : ShellCoordinates → M) {u v ρ α ε A s t : ℝ}
    (hρ : 0 < ρ) (hu : u ≤ 1) (hv : 1 ≤ v)
    (hApprox : ∀ z ∈ closedRadialBand u v,
      |physicalNormalizedRadius g x ρ (F z) - (α + ‖z‖)| ≤ ε)
    (hAnchor : α + 1 + ε ≤ A) (hs : s < α + u - ε) (ht : α + v + ε < t) :
    (∃ y ∈ anchoredSphere F 1, riemannianEDistOf g x y ≤ ENNReal.ofReal (A * ρ)) ∧
      (let := physicalMetricSpace g
       anchoredBand F u v ⊆ physicalAnnulus x (s * ρ) (t * ρ)) := by
  refine ⟨?_, ?_⟩
  · let z : ShellCoordinates := EuclideanSpace.single 0 1
    have hz : ‖z‖ = 1 := by simp [z]
    have hband : z ∈ closedRadialBand u v := by
      change u ≤ ‖z‖ ∧ ‖z‖ ≤ v
      rw [hz]
      exact ⟨hu, hv⟩
    have hb := (abs_le.mp (hApprox z hband)).2
    rw [hz] at hb
    refine ⟨F z, ⟨z, hz, rfl⟩, normalizedDistanceLe g x (F z) hρ ?_⟩
    linarith
  · let := physicalMetricSpace g
    change anchoredBand F u v ⊆ physicalAnnulus x (s * ρ) (t * ρ)
    rw [← physicalNormalizedRadius_preimage_Ioo g x ρ hρ]
    rintro _ ⟨z, hz, rfl⟩
    have hb := abs_le.mp (hApprox z hz)
    change u ≤ ‖z‖ ∧ ‖z‖ ≤ v at hz
    exact ⟨by linarith [hz.1, hb.1], by linarith [hz.2, hb.2]⟩

/-- Low full curvature on a guarded physical distance shell bounds the actual
full curvature of the buffered chart image, once its radial comparison is given. -/
theorem physicalAnchor_and_anchoredBand_fullCurvature_le_of_radialApproximation
    (F : ShellCoordinates → M) (o : ManifoldOrientation (𝓡 4) M 4)
    (frame : ∀ y, OrientedOrthonormalFrameAt g o y)
    (hFull : Integrable (fun y => frameTensorNormSq (metricCurvatureFrameTensor g o y (frame y)))
      (riemannianVolumeMeasure (𝓡 4) M g))
    {u v ρ α ε A s t : ℝ} (hρ : 0 < ρ) (hu : u ≤ 1) (hv : 1 ≤ v)
    (hApprox : ∀ z ∈ closedRadialBand u v,
      |physicalNormalizedRadius g x ρ (F z) - (α + ‖z‖)| ≤ ε)
    (hAnchor : α + 1 + ε ≤ A) (hs : s < α + u - ε) (ht : α + v + ε < t) :
    (∃ y ∈ anchoredSphere F 1, riemannianEDistOf g x y ≤ ENNReal.ofReal (A * ρ)) ∧
      (let := physicalMetricSpace g
       (metricFullCurvatureMeasure g o frame).real (anchoredBand F u v) ≤
         (metricFullCurvatureMeasure g o frame).real (physicalAnnulus x (s * ρ) (t * ρ))) := by
  let := physicalMetricSpace g
  let : IsFiniteMeasure (metricFullCurvatureMeasure g o frame) := isFiniteEnergyMeasure hFull
  obtain ⟨hy, hsub⟩ :=
    physicalAnchor_and_anchoredBand_subset_of_radialApproximation g x F hρ hu hv hApprox hAnchor hs ht
  exact ⟨hy, measureReal_mono hsub⟩

/-- The fixed E56 shift and the anchored-shell buffer need only the
guarded physical window from normalized radii `1/8` to `L`. -/
theorem physicalAnchor_and_anchoredBuffer_fullCurvature_tendsto_zero
    (G : ℕ → SmoothRiemannianMetric (𝓡 4) M) (x : ℕ → M) (ρ : ℕ → ℝ)
    (F : ℕ → ShellCoordinates → M) (o : ManifoldOrientation (𝓡 4) M 4)
    (frame : ∀ i y, OrientedOrthonormalFrameAt (G i) o y)
    (hFull : ∀ i, Integrable (fun y => frameTensorNormSq (metricCurvatureFrameTensor (G i) o y (frame i y)))
      (riemannianVolumeMeasure (𝓡 4) M (G i)))
    {L : ℝ} (hL : 8 < L) (hρ : ∀ᶠ i in atTop, 0 < ρ i)
    (hApprox : ∀ᶠ i in atTop, ∀ z ∈ closedRadialBand (3 / 16) (3 * L / 4),
      |physicalNormalizedRadius (G i) (x i) (ρ i) (F i z) - (1 / 16 + ‖z‖)| ≤ 1 / 16)
    (hShell : Tendsto (fun i =>
      let := physicalMetricSpace (G i)
      (metricFullCurvatureMeasure (G i) o (frame i)).real
        (physicalAnnulus (x i) ((1 / 8) * ρ i) (L * ρ i))) atTop (𝓝 0)) :
    (∀ᶠ i in atTop, ∃ y ∈ anchoredSphere (F i) 1,
      riemannianEDistOf (G i) (x i) y ≤ ENNReal.ofReal (2 * ρ i)) ∧
    Tendsto (fun i => (metricFullCurvatureMeasure (G i) o (frame i)).real
      (anchoredBand (F i) (3 / 16) (3 * L / 4))) atTop (𝓝 0) := by
  have hboth : ∀ᶠ i in atTop,
      (∃ y ∈ anchoredSphere (F i) 1,
        riemannianEDistOf (G i) (x i) y ≤ ENNReal.ofReal (2 * ρ i)) ∧
      (let := physicalMetricSpace (G i)
       (metricFullCurvatureMeasure (G i) o (frame i)).real
          (anchoredBand (F i) (3 / 16) (3 * L / 4)) ≤
       (metricFullCurvatureMeasure (G i) o (frame i)).real
          (physicalAnnulus (x i) ((1 / 8) * ρ i) (L * ρ i))) := by
    filter_upwards [hρ, hApprox] with i hρi hApproxi
    exact physicalAnchor_and_anchoredBand_fullCurvature_le_of_radialApproximation
      (G i) (x i) (F i) o (frame i) (hFull i) hρi (by norm_num) (by linarith) hApproxi
      (by norm_num) (by norm_num) (by linarith)
  exact ⟨hboth.mono fun _ hi => hi.1, squeeze_zero'
    (Eventually.of_forall fun _ => ENNReal.toReal_nonneg) (hboth.mono fun _ hi => hi.2) hShell⟩

end AnchoredChart

section ShiftedVolume

private local instance : MeasurableSpace ShellCoordinates := borel ShellCoordinates
private local instance : BorelSpace ShellCoordinates := ⟨rfl⟩

/-- For a round radial shell whose Euclidean radius is `t - c`, a larger
shift `α` gives strictly unequal normalized volumes on adjacent intervals. -/
theorem shiftedRoundShellRatio_strict_decrease {c α t₀ t₁ t₂ : ℝ}
    (hc : c < α) (h₀ : α < t₀) (h₁ : t₀ < t₁) (h₂ : t₁ < t₂) :
    ((t₂ - c) ^ 4 - (t₁ - c) ^ 4) / ((t₂ - α) ^ 4 - (t₁ - α) ^ 4) <
      ((t₁ - c) ^ 4 - (t₀ - c) ^ 4) / ((t₁ - α) ^ 4 - (t₀ - α) ^ 4) := by
  have hslope {u v : ℝ} (hu : α < u) (huv : u < v) :
      ∃ w ∈ Ioo u v,
        ((v - c) ^ 4 - (u - c) ^ 4) / ((v - α) ^ 4 - (u - α) ^ 4) =
          ((w - c) / (w - α)) ^ 3 := by
    have hder (k w : ℝ) :
        HasDerivAt (fun t : ℝ => (t - k) ^ 4) (4 * (w - k) ^ 3) w := by
      have h : HasDerivAt (fun t : ℝ => t - k) 1 w := (hasDerivAt_id w).sub_const k
      convert h.pow 4 using 1
      norm_num
    obtain ⟨w, hw, heq⟩ := exists_ratio_hasDerivAt_eq_ratio_slope
      (fun t => (t - c) ^ 4) (fun t => 4 * (t - c) ^ 3)
      huv (by fun_prop) (fun w _ => hder c w)
      (fun t => (t - α) ^ 4) (fun t => 4 * (t - α) ^ 3)
      (by fun_prop) (fun w _ => hder α w)
    have hwα := sub_pos.mpr (hu.trans hw.1)
    have hDen : 0 < (v - α) ^ 4 - (u - α) ^ 4 :=
      sub_pos.mpr (pow_lt_pow_left₀ (sub_lt_sub_right huv _) (sub_nonneg.mpr hu.le) (by decide))
    refine ⟨w, hw, ?_⟩
    change ((v - α) ^ 4 - (u - α) ^ 4) * (4 * (w - c) ^ 3) =
      ((v - c) ^ 4 - (u - c) ^ 4) * (4 * (w - α) ^ 3) at heq
    rw [div_pow]
    apply (div_eq_div_iff hDen.ne' (pow_ne_zero _ hwα.ne')).2
    linarith only [heq]
  obtain ⟨v, hv, hvSlope⟩ := hslope (h₀.trans h₁) h₂
  obtain ⟨u, hu, huSlope⟩ := hslope h₀ h₁
  rw [hvSlope, huSlope]
  have huα := sub_pos.mpr (h₀.trans hu.1)
  have hvα := sub_pos.mpr (h₀.trans (h₁.trans hv.1))
  have huv := hu.2.trans hv.1
  have hratio : (v - c) / (v - α) < (u - c) / (u - α) := by
    apply (div_lt_div_iff₀ hvα huα).2
    nlinarith only [mul_pos (sub_pos.mpr hc) (sub_pos.mpr huv)]
  exact pow_lt_pow_left₀ hratio
    (div_nonneg (sub_nonneg.mpr (hc.trans (h₀.trans (h₁.trans hv.1))).le) hvα.le) (by decide)

private theorem real_volume_openRadialBand {u v : ℝ} (hu : 0 ≤ u) (huv : u < v) :
    (volume : Measure ShellCoordinates).real (openRadialBand u v) =
      (Real.pi ^ 2 / 2) * (v ^ 4 - u ^ 4) := by
  have hband : openRadialBand u v =
      Metric.ball (0 : ShellCoordinates) v \ Metric.closedBall 0 u := by
    ext z
    simp [openRadialBand, Metric.mem_ball, Metric.mem_closedBall, and_comm]
  have hdim : Module.finrank ℝ ShellCoordinates = 2 * 2 := by simp [ShellCoordinates]
  have hball := InnerProductSpace.volume_ball_of_dim_even hdim (0 : ShellCoordinates) v
  have hclosed := InnerProductSpace.volume_closedBall_of_dim_even hdim (0 : ShellCoordinates) u
  have hballfin : volume (Metric.ball (0 : ShellCoordinates) v) ≠ ⊤ := by
    rw [hball]
    exact ENNReal.mul_ne_top (ENNReal.pow_ne_top ENNReal.ofReal_ne_top) ENNReal.ofReal_ne_top
  rw [hband, measureReal_sdiff (Metric.closedBall_subset_ball huv)
    Metric.isClosed_closedBall.measurableSet hballfin, measureReal_def, measureReal_def,
    hball, hclosed]
  have hv := hu.trans huv.le
  have hpi : 0 ≤ Real.pi ^ 2 / ((2 : ℕ).factorial : ℝ) := by positivity
  simp only [ENNReal.toReal_mul, ENNReal.toReal_pow, ENNReal.toReal_ofReal hv,
    ENNReal.toReal_ofReal hu, ENNReal.toReal_ofReal hpi, hdim]
  norm_num
  ring

/-- The shifted equality test can fail even for the exact centered Euclidean
physical annulus. Its ordinary Euclidean volume is the Riemannian volume
of the Euclidean metric. -/
theorem shiftedEuclideanShellVolume_strict_decrease {α t₀ t₁ t₂ : ℝ}
    (hα : 0 < α) (h₀ : α < t₀) (h₁ : t₀ < t₁) (h₂ : t₁ < t₂) :
    4 * (volume : Measure ShellCoordinates).real (openRadialBand t₁ t₂) /
        ((t₂ - α) ^ 4 - (t₁ - α) ^ 4) <
      4 * (volume : Measure ShellCoordinates).real (openRadialBand t₀ t₁) /
        ((t₁ - α) ^ 4 - (t₀ - α) ^ 4) := by
  rw [real_volume_openRadialBand (hα.trans (h₀.trans h₁)).le h₂,
    real_volume_openRadialBand (hα.trans h₀).le h₁, ← mul_assoc, ← mul_assoc,
    mul_div_assoc, mul_div_assoc]
  apply mul_lt_mul_of_pos_left _ (by positivity)
  simpa only [sub_zero] using shiftedRoundShellRatio_strict_decrease hα h₀ h₁ h₂

/-- A strict deficit for the actual Riemannian distance and volume of flat
Euclidean four-space with the original center at zero and scale one. -/
theorem shiftedPhysicalEuclideanShellVolume_strict_decrease {α t₀ t₁ t₂ : ℝ}
    (hα : 0 < α) (h₀ : α < t₀) (h₁ : t₀ < t₁) (h₂ : t₁ < t₂) :
    let g := standardEuclideanMetric ShellCoordinates
    let μ := riemannianVolumeMeasure (𝓡 4) ShellCoordinates g
    let r := physicalNormalizedRadius g 0 1
    4 * μ.real (r ⁻¹' Ioo t₁ t₂) / ((t₂ - α) ^ 4 - (t₁ - α) ^ 4) <
      4 * μ.real (r ⁻¹' Ioo t₀ t₁) / ((t₁ - α) ^ 4 - (t₀ - α) ^ 4) := by
  let g := standardEuclideanMetric ShellCoordinates
  have hr : physicalNormalizedRadius g 0 1 = fun z => ‖z‖ := by
    funext z
    change (riemannianEDistOf (standardEuclideanMetric ShellCoordinates) 0 z).toReal / 1 = ‖z‖
    rw [div_one, riemannianEDistOf_standardEuclideanMetric, edist_dist,
      ENNReal.toReal_ofReal dist_nonneg, dist_zero_left]
  have hvol : riemannianVolumeMeasure (𝓡 4) ShellCoordinates g =
      (volume : Measure ShellCoordinates) :=
    riemannianVolumeMeasure_euclideanMetric (E := ShellCoordinates)
  change 4 * (riemannianVolumeMeasure (𝓡 4) ShellCoordinates g).real
      (physicalNormalizedRadius g 0 1 ⁻¹' Ioo t₁ t₂) / ((t₂ - α) ^ 4 - (t₁ - α) ^ 4) <
    4 * (riemannianVolumeMeasure (𝓡 4) ShellCoordinates g).real
      (physicalNormalizedRadius g 0 1 ⁻¹' Ioo t₀ t₁) / ((t₁ - α) ^ 4 - (t₀ - α) ^ 4)
  rw [hvol, hr]
  exact shiftedEuclideanShellVolume_strict_decrease hα h₀ h₁ h₂

end ShiftedVolume

end SmoothPoincare
