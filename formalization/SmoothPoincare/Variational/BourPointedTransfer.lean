import SmoothPoincare.Variational.BourMarkedCore
import SmoothPoincare.Variational.ConformalChiralCharges

/-!
# Compact signed Weyl transfer on a Bour pointed comparison

26 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance.
Actual serving model and effort were unavailable. FOT-E48 uses the E47 marked
comparison and its physical normalizations at intake HEAD
`226b8f404b6e5c99f8e71f85280e5c9988bbf652`.
-/

open DifferentialGeometry DifferentialGeometry.CheegerGromovCompactness
open DifferentialGeometry.Geometry.Curvature DifferentialGeometry.Integral.Measure
open FirstOrderTwistor Filter MeasureTheory SectionsAndConnections Set TopologicalSpace
open scoped ContDiff Manifold Topology ENNReal

noncomputable section

namespace SmoothPoincare

section Density

variable {E H M : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]

/-- The density of each actual signed block in its physical frame. -/
def bourSignedWeylDensity (g : SmoothRiemannianMetric I M) (o : ManifoldOrientation I M 4)
    (frame : ∀ x, OrientedOrthonormalFrameAt g o x) (sign : CollarChirality) (x : M) : ℝ :=
  hilbertSchmidtSq (signedCollarWeylBlock o g frame sign x)

variable [BoundarylessManifold I M]

/-- The common operator curvature square dominates the sum of the two
signed densities. Its normalization is one quarter of the ordered square. -/
theorem bourSignedWeylDensity_sum_le_operatorSq (g : SmoothRiemannianMetric I M)
    (o : ManifoldOrientation I M 4) (frame : ∀ x, OrientedOrthonormalFrameAt g o x) (x : M) :
    bourSignedWeylDensity g o frame .plus x + bourSignedWeylDensity g o frame .minus x ≤
      intrinsicCurvatureSq g x / 4 := by
  have hFull := normSq0S_rm04_eq_frameTensorNormSq g o x (frame x)
  have hSplit := metricFrameTensorNormSq_eq_chiral_ricci_scalar g o x (frame x)
  have hRic := modifiedChargeDensity_nonneg o g frame .ricci x
  change 0 ≤ endpointRicciDefectDensity g o x (frame x) at hRic
  change hilbertSchmidtSq (geometricChiralBlock g o x (frame x)) +
    hilbertSchmidtSq (endpointNegativeWeylBlock g o x (frame x)) ≤ _
  change intrinsicCurvatureSq g x = _ at hFull
  linarith only [hFull, hSplit, hRic, sq_nonneg (metricScalarAt g x)]

variable [I.Boundaryless] [SigmaCompactSpace M]

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

omit [FiniteDimensional ℝ E] [T2Space M] [BoundarylessManifold I M] [I.Boundaryless]
  [SigmaCompactSpace M] in
private theorem eq_conformalMetric_of_scale (g : SmoothRiemannianMetric I M)
    {a : ℝ} (ha : 0 < a) :
    scaleMetric a ha g = conformalMetric g (.const (Real.log a / 2)) := by
  rw [conformalMetric_const]
  have h : Real.exp (2 * (Real.log a / 2)) = a := by
    rw [show 2 * (Real.log a / 2) = Real.log a by ring, Real.exp_log ha]
  apply SmoothRiemannianMetric.ext_inner
  intro x v w
  rw [scaleMetric_inner, scaleMetric_inner, h]

/-- The normalized frame is the actual physical frame after constant rescaling.
The equality permits use with a metric supplied by curvature normalization. -/
def bourScaledFrame {g scaled : SmoothRiemannianMetric I M} (o : ManifoldOrientation I M 4)
    (frame : ∀ x, OrientedOrthonormalFrameAt g o x) {a : ℝ} (ha : 0 < a)
    (hScale : scaled = scaleMetric a ha g) : ∀ x, OrientedOrthonormalFrameAt scaled o x :=
  (hScale.trans (eq_conformalMetric_of_scale g ha)).symm ▸
    (fun x => conformalOrientedFrameAt (.const (Real.log a / 2)) (frame x))

private theorem bourCopiedConformalWeylMeasure_eq {g scaled : SmoothRiemannianMetric I M}
    (o : ManifoldOrientation I M 4) (frame : ∀ x, OrientedOrthonormalFrameAt g o x)
    (u : C^∞⟮I, M; ℝ⟯) (h : scaled = conformalMetric g u) (sign : CollarChirality) :
    energyMeasure (riemannianVolumeMeasure I M scaled)
      (bourSignedWeylDensity scaled o (h.symm ▸ fun x => conformalOrientedFrameAt u (frame x)) sign) =
    energyMeasure (riemannianVolumeMeasure I M g) (bourSignedWeylDensity g o frame sign) := by
  subst scaled
  exact signedChiralEnergyMeasure_conformalMetric g u o frame sign

/-- On the same subset of the original carrier, constant rescaling preserves
the full physical signed energy measure. -/
theorem bourScaledSignedWeylMeasure_eq {g scaled : SmoothRiemannianMetric I M}
    (o : ManifoldOrientation I M 4) (frame : ∀ x, OrientedOrthonormalFrameAt g o x)
    {a : ℝ} (ha : 0 < a) (hScale : scaled = scaleMetric a ha g) (sign : CollarChirality) :
    energyMeasure (riemannianVolumeMeasure I M scaled)
      (bourSignedWeylDensity scaled o (bourScaledFrame o frame ha hScale) sign) =
    energyMeasure (riemannianVolumeMeasure I M g) (bourSignedWeylDensity g o frame sign) :=
  bourCopiedConformalWeylMeasure_eq o frame (.const (Real.log a / 2))
    (hScale.trans (eq_conformalMetric_of_scale g ha)) sign

end Density

private theorem tendsto_traceFreeAntiSelfDualBlock_apply {ι : Type*} {l : Filter ι}
    {R : ι → CurvatureFrameTensor} {S : CurvatureFrameTensor}
    (hTensor : ∀ a b c d, Tendsto (fun i => R i a b c d) l (𝓝 (S a b c d))) (a b : Fin 3) :
    Tendsto (fun i => traceFreeChiralBlock (antiSelfDualCurvatureBlock (R i)) a b) l
      (𝓝 (traceFreeChiralBlock (antiSelfDualCurvatureBlock S) a b)) := by
  have hAnti (j k : Fin 3) : Tendsto (fun i => antiSelfDualCurvatureBlock (R i) j k)
      l (𝓝 (antiSelfDualCurvatureBlock S j k)) := by
    let u := selfDualFirstWedge
    let v := selfDualSecondWedge
    unfold antiSelfDualCurvatureBlock
    exact ((((hTensor (u j).1 (u j).2 (u k).1 (u k).2).sub
      (hTensor (u j).1 (u j).2 (v k).1 (v k).2)).sub
      (hTensor (v j).1 (v j).2 (u k).1 (u k).2)).add
      (hTensor (v j).1 (v j).2 (v k).1 (v k).2)).div_const 2
  have hTrace : Tendsto (fun i => (antiSelfDualCurvatureBlock (R i)).trace) l
      (𝓝 (antiSelfDualCurvatureBlock S).trace) := by
    simp only [Matrix.trace, Matrix.diag_apply]
    exact tendsto_finsetSum _ fun j _ => hAnti j j
  simp only [traceFreeChiralBlock, Matrix.sub_apply, Matrix.smul_apply, smul_eq_mul]
  exact (hAnti a b).sub ((hTrace.div_const 3).mul_const _)

section Pointed

universe u uE uH

variable {E : Type uE} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type uH} [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  {X : PointedRiemannianSeq.{u,uE,uH} I} {P : PointedRiemannianManifold.{u,uE,uH} I}
  {φ : ℕ → ℕ}

attribute [local instance] PointedRiemannianManifold.topology PointedRiemannianManifold.charted
  PointedRiemannianManifold.smooth PointedRiemannianManifold.t2
  PointedRiemannianManifold.sigmaCompact PointedRiemannianManifold.t2TangentBundle

private local instance (Q : PointedRiemannianManifold.{u,uE,uH} I) :
    MeasurableSpace Q.M := borel Q.M
private local instance (Q : PointedRiemannianManifold.{u,uE,uH} I) :
    BorelSpace Q.M := ⟨rfl⟩

omit [FiniteDimensional ℝ E] [I.Boundaryless] in
private theorem eventually_bourPointed_image_measurable
    (F : PointedRiemannianConvergenceMaps X P φ) {K : Set P.M} (hK : IsCompact K) :
    ∀ᶠ i in atTop, K ⊆ F.source i ∧ MeasurableSet (F.map i '' K) := by
  obtain ⟨N, hN⟩ := F.source_subset hK
  filter_upwards [eventually_ge_atTop N] with i hi
  exact ⟨hN i hi, (hK.image_of_continuousOn
    ((F.partialDiffeomorph i).contMDiffOn_toFun.continuousOn.mono (hN i hi))).measurableSet⟩

/-- Both compact chiral masses converge on the actual image of a fixed
truncation in the signed marking. One common bound on the curvature-operator
square supplies the dominating constant for both signs. The chosen frame
coefficients and their measurable densities on the compared metrics are inputs. -/
theorem bourPointedSignedWeylCompactMass
    (F : PointedRiemannianConvergenceMaps X P φ) (C : MetricConvergenceData F)
    (hCanonical : ∀ i, C.domain i = CanonicalMetricCompactness.canonicalSourceData F i)
    (oP : ManifoldOrientation I P.M 4) (oX : ∀ i, ManifoldOrientation I (X.obj i).M 4)
    (frameP : ∀ x, OrientedOrthonormalFrameAt P.metric oP x)
    (frameX : ∀ i x, OrientedOrthonormalFrameAt (X.obj i).metric (oX i) x)
    (hOrientation : ∀ᶠ i in atTop, bourComparisonPreservesOrientation F oP oX i)
    {K : Set P.M} (hK : IsCompact K) {B : ℝ}
    (hCurvature : ∀ᶠ i in atTop, ∀ y ∈ F.map i '' K, intrinsicCurvatureSq (X.obj (φ i)).metric y / 4 ≤ B)
    (hTensor : ∀ x ∈ K, ∀ a b c d, Tendsto (fun i =>
      metricCurvatureFrameTensor (X.obj (φ i)).metric (oX (φ i)) (F.map i x)
        (frameX (φ i) (F.map i x)) a b c d)
      atTop (𝓝 (metricCurvatureFrameTensor P.metric oP x (frameP x) a b c d))) :
    let density := fun i => bourSignedWeylDensity (X.obj i).metric (oX i) (frameX i)
    let limit := bourSignedWeylDensity P.metric oP frameP
    let μ := fun i sign => energyMeasure
      (riemannianVolumeMeasure I (X.obj i).M (X.obj i).metric) (density i sign)
    let ν := fun sign => energyMeasure (riemannianVolumeMeasure I P.M P.metric) (limit sign)
    (∀ i sign, Measurable (fun x => ENNReal.ofReal (density i sign x))) →
    (∀ᶠ i in atTop, bourComparisonPreservesOrientation F oP oX i ∧ K ⊆ F.source i ∧
      MeasurableSet (F.map i '' K)) ∧
    ∀ sign, Tendsto (fun i => (μ (φ i) sign) (F.map i '' K)) atTop (𝓝 (ν sign K)) ∧
      Tendsto (fun i => (μ (φ i) sign).real (F.map i '' K)) atTop (𝓝 ((ν sign).real K)) := by
  intro density limit μ ν hMeas
  have hImage := eventually_bourPointed_image_measurable F hK
  refine ⟨hOrientation.and hImage, fun sign => ?_⟩
  have hBound : ∀ᶠ i in atTop, ∀ x ∈ K,
      ENNReal.ofReal (density (φ i) sign (F.map i x)) ≤ ENNReal.ofReal B := by
    filter_upwards [hCurvature] with i hi
    intro x hx
    have hSum := bourSignedWeylDensity_sum_le_operatorSq (X.obj (φ i)).metric (oX (φ i))
      (frameX (φ i)) (F.map i x)
    have hNonneg (s : CollarChirality) : 0 ≤ density (φ i) s (F.map i x) := by
      unfold density bourSignedWeylDensity hilbertSchmidtSq
      positivity
    have hOp := hi (F.map i x) (mem_image_of_mem _ hx)
    apply ENNReal.ofReal_le_ofReal
    cases sign <;>
      linarith only [show density (φ i) .plus (F.map i x) + density (φ i) .minus (F.map i x) ≤ _ from hSum,
        hNonneg .plus, hNonneg .minus, hOp]
  have hPoint (x : P.M) (hx : x ∈ K) : Tendsto (fun i => ENNReal.ofReal (density (φ i) sign (F.map i x)))
      atTop (𝓝 (ENNReal.ofReal (limit sign x))) := by
    apply (ENNReal.continuous_ofReal.tendsto _).comp
    unfold density limit bourSignedWeylDensity hilbertSchmidtSq
    refine tendsto_finsetSum _ fun a _ => tendsto_finsetSum _ fun b _ => ?_
    apply Tendsto.pow
    cases sign with
    | plus => exact tendsto_traceFreeSelfDualBlock_apply (hTensor x hx) a b
    | minus => exact tendsto_traceFreeAntiSelfDualBlock_apply (hTensor x hx) a b
  have hIntegral := F.tendsto_setLIntegral_image C hCanonical hK
    (fun i x => ENNReal.ofReal (density i sign x)) (fun i => hMeas i sign)
    ENNReal.ofReal_ne_top hBound hPoint
  have hModel : ν sign K = ∫⁻ x in K, ENNReal.ofReal (limit sign x)
      ∂riemannianVolumeMeasure I P.M P.metric := withDensity_apply _ hK.measurableSet
  have hMass : Tendsto (fun i => μ (φ i) sign (F.map i '' K)) atTop (𝓝 (ν sign K)) := by
    rw [hModel]
    apply hIntegral.congr'
    filter_upwards [hImage] with i hi
    exact (withDensity_apply _ hi.2).symm
  have hBoundLim (x : P.M) (hx : x ∈ K) : ENNReal.ofReal (limit sign x) ≤ ENNReal.ofReal B :=
    le_of_tendsto (hPoint x hx) (hBound.mono fun _ hi => hi x hx)
  let m := riemannianVolumeMeasure I P.M P.metric
  let : IsFiniteMeasureOnCompacts m := riemannianVolumeMeasure_isFiniteMeasureOnCompacts P.metric
  have hFinite : ν sign K ≠ ⊤ := by
    rw [hModel]
    apply ne_of_lt
    refine (setLIntegral_mono' hK.measurableSet hBoundLim).trans_lt ?_
    rw [lintegral_const, Measure.restrict_apply_univ]
    exact lt_top_iff_ne_top.mpr (ENNReal.mul_ne_top ENNReal.ofReal_ne_top hK.measure_lt_top.ne)
  exact ⟨hMass, (ENNReal.tendsto_toReal hFinite).comp hMass⟩

/-- The compact comparison is an equality of limiting masses in the original,
unscaled source measures. The curvature bound and coefficient comparisons
are tested on the normalized metrics and their matched rescaled frames. -/
theorem bourPointedSignedWeylPhysicalMass
    (F : PointedRiemannianConvergenceMaps X P φ) (C : MetricConvergenceData F)
    (hCanonical : ∀ i, C.domain i = CanonicalMetricCompactness.canonicalSourceData F i)
    (oP : ManifoldOrientation I P.M 4) (oX : ∀ i, ManifoldOrientation I (X.obj i).M 4)
    (frameP : ∀ x, OrientedOrthonormalFrameAt P.metric oP x)
    (g : ∀ i, SmoothRiemannianMetric I (X.obj i).M)
    (frame : ∀ i x, OrientedOrthonormalFrameAt (g i) (oX i) x)
    (a : ℕ → ℝ) (ha : ∀ i, 0 < a i)
    (hScale : ∀ i, (X.obj i).metric = scaleMetric (a i) (ha i) (g i))
    (hOrientation : ∀ᶠ i in atTop, bourComparisonPreservesOrientation F oP oX i)
    {K : Set P.M} (hK : IsCompact K) {B : ℝ}
    (hCurvature : ∀ᶠ i in atTop, ∀ y ∈ F.map i '' K, intrinsicCurvatureSq (X.obj (φ i)).metric y / 4 ≤ B) :
    let frames := fun i => bourScaledFrame (oX i) (frame i) (ha i) (hScale i)
    let μ := fun i sign => energyMeasure (riemannianVolumeMeasure I (X.obj i).M (g i))
      (bourSignedWeylDensity (g i) (oX i) (frame i) sign)
    let ν := fun sign => energyMeasure (riemannianVolumeMeasure I P.M P.metric)
      (bourSignedWeylDensity P.metric oP frameP sign)
    (∀ x ∈ K, ∀ a b c d, Tendsto (fun i =>
      metricCurvatureFrameTensor (X.obj (φ i)).metric (oX (φ i)) (F.map i x)
        (frames (φ i) (F.map i x)) a b c d)
      atTop (𝓝 (metricCurvatureFrameTensor P.metric oP x (frameP x) a b c d))) →
    (∀ i sign, Measurable (fun x =>
      ENNReal.ofReal (bourSignedWeylDensity (X.obj i).metric (oX i) (frames i) sign x))) →
    (∀ᶠ i in atTop, bourComparisonPreservesOrientation F oP oX i ∧ K ⊆ F.source i ∧
      MeasurableSet (F.map i '' K)) ∧
    ∀ sign, Tendsto (fun i => (μ (φ i) sign) (F.map i '' K)) atTop (𝓝 (ν sign K)) ∧
      Tendsto (fun i => (μ (φ i) sign).real (F.map i '' K)) atTop (𝓝 ((ν sign).real K)) := by
  intro frames μ ν hTensor hMeas
  have h := bourPointedSignedWeylCompactMass F C hCanonical oP oX frameP frames
    hOrientation hK hCurvature hTensor hMeas
  refine ⟨h.1, fun sign => ?_⟩
  have hEq (i : ℕ) : energyMeasure (riemannianVolumeMeasure I (X.obj i).M (X.obj i).metric)
      (bourSignedWeylDensity (X.obj i).metric (oX i) (frames i) sign) = μ i sign :=
    bourScaledSignedWeylMeasure_eq (oX i) (frame i) (ha i) (hScale i) sign
  simpa only [hEq] using h.2 sign

omit [FiniteDimensional ℝ E] [I.Boundaryless] in
/-- At saturated totals and for an increasing exhaustion, the raw signed
complement of each late fixed truncation has arbitrarily small physical
mass in the late source images. The order is truncation first, source index
second. The finite signed measures can be the original unscaled ones. -/
theorem bourPointedSignedExterior_small_of_saturation
    (F : PointedRiemannianConvergenceMaps X P φ)
    (source : ∀ i, CollarChirality → Measure (X.obj i).M) (model : CollarChirality → Measure P.M)
    [∀ i sign, IsFiniteMeasure (source i sign)] [∀ sign, IsFiniteMeasure (model sign)]
    (K : ℕ → Set P.M) (hK : ∀ L, IsCompact (K L)) (hIncreasing : Monotone K)
    (hExhausts : ⋃ L, K L = univ)
    (hTotals : ∀ s, Tendsto (fun i => (source (φ i) s).real univ) atTop (𝓝 ((model s).real univ)))
    (hLocal : ∀ L s, Tendsto (fun i => (source (φ i) s).real (F.map i '' K L)) atTop
      (𝓝 ((model s).real (K L)))) :
    ∀ ε > (0 : ℝ), ∀ᶠ L in atTop, ∀ᶠ i in atTop, ∀ s,
      (source (φ i) s).real (F.map i '' K L)ᶜ < ε := by
  intro ε hε
  have hEx (s : CollarChirality) : Tendsto (fun L => (model s).real (K L)) atTop (𝓝 ((model s).real univ)) := by
    rw [← hExhausts]
    exact (ENNReal.tendsto_toReal (measure_ne_top _ _)).comp (tendsto_measure_iUnion_atTop hIncreasing)
  have hSmall (s : CollarChirality) : ∀ᶠ L in atTop, (model s).real univ - ε < (model s).real (K L) :=
    (hEx s).eventually_const_lt (sub_lt_self _ hε)
  filter_upwards [hSmall .plus, hSmall .minus] with L hp hn
  have hComp (s : CollarChirality) : Tendsto (fun i => (source (φ i) s).real (F.map i '' K L)ᶜ)
      atTop (𝓝 ((model s).real univ - (model s).real (K L))) := by
    apply ((hTotals s).sub (hLocal L s)).congr'
    filter_upwards [eventually_bourPointed_image_measurable F (hK L)] with i hi
    exact (measureReal_compl hi.2).symm
  have hGap (s : CollarChirality) : (model s).real univ - (model s).real (K L) < ε := by
    cases s <;> linarith only [hp, hn]
  filter_upwards [(hComp .plus).eventually_lt_const (hGap .plus),
    (hComp .minus).eventually_lt_const (hGap .minus)] with i hp' hn' s
  cases s <;> assumption

end Pointed

end SmoothPoincare
