import SmoothPoincare.PhysicalScales.PointedTerminalBuffer
import SmoothPoincare.Variational.SignedCollarRepair
import FirstOrderTwistor.CurvatureDensityLimit
import DifferentialGeometry.Topology.Manifold.PartialDiffeomorph
import DifferentialGeometry.Topology.Manifold.PartialDiffeomorph.CompactGluing
import DifferentialGeometry.Topology.Manifold.PartialDiffeomorph.Globalization
import DifferentialGeometry.Topology.Manifold.OrientationDiffeomorphTransport
import DifferentialGeometry.Geometry.Curvature.Metric.Scaling
import DifferentialGeometry.Geometry.Metric.TensorInner.Tensor0S.Scaling
import DifferentialGeometry.Analysis.Integration.Measure.Riemannian.Scaling

/-! # Whole marked comparisons for a Bour pointed return

A compact truncation, with all its buffers, is carried by one pointed comparison.
The one-end calculation takes the spherical link and boundary identities as
explicit inputs.
-/

open DifferentialGeometry DifferentialGeometry.CheegerGromovCompactness
  DifferentialGeometry.Geometry.Curvature DifferentialGeometry.Geometry.Metric
  DifferentialGeometry.Integral.Measure DifferentialGeometry.Tensor0SBundle
  Filter FirstOrderTwistor MeasureTheory SectionsAndConnections Set TopologicalSpace
open scoped Manifold ContDiff Topology ENNReal

noncomputable section

namespace SmoothPoincare

section Scaling

variable {E H M : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
  [FiniteDimensional ℝ E] [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  [SigmaCompactSpace M]

private local instance : CompleteSpace E := FiniteDimensional.complete ℝ E
private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

/-- The weight of the squared ordinary Ricci tensor norm cancels the
four-dimensional physical volume weight under a positive constant scale. -/
theorem bourTraceFreeRicciIntegral_scale
    (hd : Module.finrank ℝ E = 4) (g : SmoothRiemannianMetric I M) {a : ℝ} (ha : 0 < a) :
    (∫ x, intrinsicTraceFreeRicciSq (scaleMetric a ha g) x
      ∂riemannianVolumeMeasure I M (scaleMetric a ha g)) =
    ∫ x, intrinsicTraceFreeRicciSq g x ∂riemannianVolumeMeasure I M g := by
  have hDensity (x : M) : intrinsicTraceFreeRicciSq (scaleMetric a ha g) x =
      (a⁻¹) ^ 2 * intrinsicTraceFreeRicciSq g x := by
    rw [intrinsicTraceFreeRicciSq_eq_ricciNormSq_sub_scalarSq,
      intrinsicTraceFreeRicciSq_eq_ricciNormSq_sub_scalarSq, metricRicciAt_scaleMetric,
      metricScalarAt_scaleMetric, normSq0S_scale]
    ring
  simp_rw [hDensity]
  rw [volume_scaleMetric, hd, integral_smul_measure, ENNReal.toReal_pow,
    ENNReal.toReal_ofReal (Real.sqrt_nonneg _), smul_eq_mul, integral_const_mul]
  rw [show Real.sqrt a ^ 4 = a ^ 2 by rw [show (4:ℕ) = 2 * 2 by decide,
      pow_mul, Real.sq_sqrt ha.le]]
  field_simp

end Scaling

section Pointed

universe u uE uH

variable {E : Type uE} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
  [FiniteDimensional ℝ E] [NeZero (Module.finrank ℝ E)]
  {H : Type uH} [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  {X : PointedRiemannianSeq.{u,uE,uH} I} {P : PointedRiemannianManifold.{u,uE,uH} I}
  {φ : ℕ → ℕ}

attribute [local instance] PointedRiemannianManifold.topology PointedRiemannianManifold.charted
  PointedRiemannianManifold.smooth PointedRiemannianManifold.t2
  PointedRiemannianManifold.sigmaCompact PointedRiemannianManifold.t2TangentBundle

private local instance : CompleteSpace E := FiniteDimensional.complete ℝ E
private local instance (Q : PointedRiemannianManifold.{u,uE,uH} I) :
    MeasurableSpace Q.M := borel Q.M
private local instance (Q : PointedRiemannianManifold.{u,uE,uH} I) :
    BorelSpace Q.M := ⟨rfl⟩

/-- The sign is imposed on the actual open-domain comparison of the supplied
pointed data. The restrictions use the ambient orientations of the two carriers. -/
def bourComparisonPreservesOrientation (F : PointedRiemannianConvergenceMaps X P φ)
    (oP : ManifoldOrientation I P.M 4) (oX : ∀ i, ManifoldOrientation I (X.obj i).M 4)
    (i : ℕ) : Prop :=
  letI : IsManifold I ∞ (MetricSourceDomain F i) := metric_source_domain_smooth F i
  letI : IsManifold I ∞ (MetricTargetDomain F i) := metric_target_domain_smooth F i
  (metricSourceTargetDiffeomorph F i).preservesOrientation
    (oP.restrictOpen (metricSourceOpenSubset F i))
    ((oX (φ i)).restrictOpen (metricTargetOpenSubset F i))

omit [NeZero (Module.finrank ℝ E)] [I.Boundaryless] in
/-- Any actual restriction of the pointed comparison inherits the sign
on the chosen open neighborhood. -/
theorem bourComparison_orientationAt
    (F : PointedRiemannianConvergenceMaps X P φ)
    (oP : ManifoldOrientation I P.M 4) (oX : ∀ i, ManifoldOrientation I (X.obj i).M 4)
    {i : ℕ} (hOri : bourComparisonPreservesOrientation F oP oX i)
    (f : PartialDiffeomorph I I P.M (X.obj (φ i)).M ∞)
    (hSource : f.source ⊆ F.source i) (hMap : ∀ x, f x = F.map i x)
    {x : P.M} (hx : x ∈ f.source) :
    Orientation.map (Fin 4)
      ((f.isLocalDiffeomorphAt I I ∞ hx).mfderivToContinuousLinearEquiv (by simp)).toLinearEquiv
      (oP.orientation x) = (oX (φ i)).orientation (f x) := by
  let _ := metric_source_domain_smooth F i
  let _ := metric_target_domain_smooth F i
  let e := metricSourceTargetDiffeomorph F i
  let y : MetricSourceDomain F i := ⟨x, hSource hx⟩
  have hDeriv : (e.mfderivToContinuousLinearEquiv (by simp) y).toLinearEquiv =
      ((f.isLocalDiffeomorphAt I I ∞ hx).mfderivToContinuousLinearEquiv (by simp)).toLinearEquiv := by
    ext v
    change mfderiv I I e y v = mfderiv I I f x v
    rw [metric_source_target_diffeomorph_mfderiv F i y v]
    exact (congrArg (fun map : P.M → (X.obj (φ i)).M => mfderiv I I map x v) (funext hMap)).symm
  have h := hOri y
  change Orientation.map (Fin 4) (e.mfderivToContinuousLinearEquiv (by simp) y).toLinearEquiv
    (oP.orientation x) = (oX (φ i)).orientation (F.map i x) at h
  rwa [hDeriv, ← hMap x] at h

omit [NeZero (Module.finrank ℝ E)] [I.Boundaryless] in
/-- Every sufficiently late comparison covers the compact truncation and every
buffer contained in it simultaneously. Its restricted open map keeps the
actual inverse, and the ambient comparison is signed. -/
theorem bourWholeCoreComparison
    (F : PointedRiemannianConvergenceMaps X P φ)
    (oP : ManifoldOrientation I P.M 4) (oX : ∀ i, ManifoldOrientation I (X.obj i).M 4)
    (hOrientation : ∀ᶠ i in atTop, bourComparisonPreservesOrientation F oP oX i)
    {K core : Set P.M} (hK : IsCompact K)
    (U : Opens P.M) (hUK : (U : Set P.M) ⊆ K) (hCore : core ⊆ U)
    {ι : Type*} (buffer : ι → Set P.M) (hBuffer : ∀ b, buffer b ⊆ U) :
    ∀ᶠ i in atTop,
      bourComparisonPreservesOrientation F oP oX i ∧ K ⊆ F.source i ∧
      ∃ f : PartialDiffeomorph I I P.M (X.obj (φ i)).M ∞,
        f.source = U ∧ f.target = F.map i '' (U : Set P.M) ∧
        (∀ x, f x = F.map i x) ∧
        (∀ y, f.symm y = (F.partialDiffeomorph i).symm y) ∧
        f.symm '' (F.map i '' core) = core ∧
        (∀ b, f.symm '' (F.map i '' buffer b) = buffer b) := by
  obtain ⟨N, hN⟩ := F.source_subset hK
  filter_upwards [eventually_ge_atTop N, hOrientation] with i hi hOi
  have hKS := hN i hi
  have hUS := hUK.trans hKS
  let f := DifferentialGeometry.Topology.PartialDiffeomorph.restrict
    (F.partialDiffeomorph i) U U.isOpen
  have hs : f.source = U := inter_eq_right.mpr hUS
  have ht : f.target = F.map i '' (U : Set P.M) :=
    (hs ▸ f.image_source_eq_target).symm
  have hinverse (A : Set P.M) (hA : A ⊆ U) :
      f.symm '' (F.map i '' A) = A := by
    rw [← image_comp]
    exact image_congr (fun x hx => f.left_inv (hs ▸ hA hx)) |>.trans (image_id A)
  exact ⟨hOi, hKS, f, hs, ht, fun _ => rfl, fun _ => rfl,
    hinverse core hCore, fun b => hinverse (buffer b) (hBuffer b)⟩

omit [NeZero (Module.finrank ℝ E)] [I.Boundaryless] in
/-- Compact-domain convergence of a nonnegative physical density implies the
lower-semicontinuity of its full integral. Exhaustion takes place on the limit;
no tightness of the source integrals is needed. -/
theorem bourPointedIntegral_le_liminf
    (F : PointedRiemannianConvergenceMaps X P φ)
    (fs : ∀ i, (X.obj i).M → ℝ≥0∞) (f : P.M → ℝ≥0∞)
    (hLocal : ∀ K : Set P.M, IsCompact K →
      Tendsto (fun i => ∫⁻ x in F.map i '' K, fs (φ i) x
        ∂riemannianVolumeMeasure I (X.obj (φ i)).M (X.obj (φ i)).metric)
        atTop (𝓝 (∫⁻ x in K, f x ∂riemannianVolumeMeasure I P.M P.metric))) :
    (∫⁻ x, f x ∂riemannianVolumeMeasure I P.M P.metric) ≤
      liminf (fun i => ∫⁻ x, fs (φ i) x
        ∂riemannianVolumeMeasure I (X.obj (φ i)).M (X.obj (φ i)).metric) atTop := by
  let ν := riemannianVolumeMeasure I P.M P.metric
  calc
    _ = ∫⁻ x in ⋃ n, compactCovering P.M n, f x ∂ν := by
      rw [iUnion_compactCovering, setLIntegral_univ]
    _ = ⨆ n, ∫⁻ x in compactCovering P.M n, f x ∂ν :=
      setLIntegral_iUnion_of_directed f (fun m n => ⟨max m n,
        compactCovering_subset P.M (le_max_left _ _),
        compactCovering_subset P.M (le_max_right _ _)⟩)
    _ ≤ _ := iSup_le fun n => by
      rw [← (hLocal _ (isCompact_compactCovering P.M n)).liminf_eq]
      exact liminf_le_liminf (Eventually.of_forall fun i => setLIntegral_le_lintegral _ _)

/-- The existing compact two-jet transport for the trace-free Ricci density
therefore controls its full pointed integral in the physical measures. -/
theorem bourPointedTraceFreeRicci_le_liminf
    (F : PointedRiemannianConvergenceMaps X P φ) (C : MetricConvergenceData F)
    (hCanonical : ∀ i, C.domain i = CanonicalMetricCompactness.canonicalSourceData F i) :
    (∫⁻ x, ENNReal.ofReal (intrinsicTraceFreeRicciSq P.metric x)
      ∂riemannianVolumeMeasure I P.M P.metric) ≤
      liminf (fun i => ∫⁻ x, ENNReal.ofReal (intrinsicTraceFreeRicciSq (X.obj (φ i)).metric x)
        ∂riemannianVolumeMeasure I (X.obj (φ i)).M (X.obj (φ i)).metric) atTop :=
  bourPointedIntegral_le_liminf F
    (fun i x => ENNReal.ofReal (intrinsicTraceFreeRicciSq (X.obj i).metric x))
    (fun x => ENNReal.ofReal (intrinsicTraceFreeRicciSq P.metric x))
    (fun _ hK => pointedTerminalBuffer_tendsto_traceFreeRicci F C hCanonical hK)

/-- A finite eventual bound gives integrability of the full limit Ricci
density and lets the lower bound pass back to the ordinary real integrals
of the unrescaled physical sources. -/
theorem bourPointedTraceFreeRicci_real_le_liminf
    (F : PointedRiemannianConvergenceMaps X P φ) (C : MetricConvergenceData F)
    (hCanonical : ∀ i, C.domain i = CanonicalMetricCompactness.canonicalSourceData F i)
    (hd : Module.finrank ℝ E = 4) (hCompact : ∀ i, CompactSpace (X.obj i).M)
    (g : ∀ i, SmoothRiemannianMetric I (X.obj i).M) (a : ℕ → ℝ) (ha : ∀ i, 0 < a i)
    (hScale : ∀ i, (X.obj i).metric = scaleMetric (a i) (ha i) (g i)) {dMax : ℝ}
    (hBound : ∀ᶠ i in atTop, (∫ x, intrinsicTraceFreeRicciSq (g (φ i)) x
      ∂riemannianVolumeMeasure I (X.obj (φ i)).M (g (φ i))) ≤ dMax) :
    let ρ := intrinsicTraceFreeRicciSq P.metric
    let ν := riemannianVolumeMeasure I P.M P.metric
    Integrable ρ ν ∧ (∫ x, ρ x ∂ν) ≤ liminf (fun i => ∫ x, intrinsicTraceFreeRicciSq (g (φ i)) x
      ∂riemannianVolumeMeasure I (X.obj (φ i)).M (g (φ i))) atTop ∧ (∫ x, ρ x ∂ν) ≤ dMax := by
  intro ρ ν
  let d := fun i => ∫ x, intrinsicTraceFreeRicciSq (g (φ i)) x
    ∂riemannianVolumeMeasure I (X.obj (φ i)).M (g (φ i))
  let D := fun i => ∫⁻ x, ENNReal.ofReal (intrinsicTraceFreeRicciSq (X.obj (φ i)).metric x)
    ∂riemannianVolumeMeasure I (X.obj (φ i)).M (X.obj (φ i)).metric
  have hEq (i : ℕ) : D i = ENNReal.ofReal (d i) := by
    let _ := hCompact (φ i)
    have h := ofReal_integral_intrinsicTraceFreeRicciSq_eq_lintegral_of_compactSpace hd
      ((X.obj (φ i)).metric) univ
    simp only [setIntegral_univ, setLIntegral_univ] at h
    dsimp only [D, d]
    rw [← h, hScale, bourTraceFreeRicciIntegral_scale hd]
  have hNonneg (i : ℕ) : 0 ≤ d i :=
    integral_nonneg (intrinsicTraceFreeRicciSq_nonneg_of_finrank hd _)
  have hDBound : ∀ᶠ i in atTop, D i ≤ ENNReal.ofReal dMax :=
    hBound.mono fun i hi => (hEq i).trans_le (ENNReal.ofReal_le_ofReal hi)
  have hMax : liminf D atTop ≤ ENNReal.ofReal dMax := by
    simpa only [liminf_const] using liminf_le_liminf hDBound
  have hFinite : liminf D atTop ≠ ⊤ :=
    ne_of_lt (hMax.trans_lt ENNReal.ofReal_lt_top)
  have hLimit : (∫⁻ x, ENNReal.ofReal (ρ x) ∂ν) ≤ liminf D atTop :=
    bourPointedTraceFreeRicci_le_liminf F C hCanonical
  have hPos : 0 ≤ᵐ[ν] ρ := ae_of_all ν (intrinsicTraceFreeRicciSq_nonneg_of_finrank hd _)
  have hSm : AEStronglyMeasurable ρ ν :=
    (continuous_intrinsicTraceFreeRicciSq P.metric).measurable.aestronglyMeasurable
  have hInt : Integrable ρ ν := ⟨hSm, (hasFiniteIntegral_iff_ofReal hPos).2
    (hLimit.trans_lt (lt_top_iff_ne_top.mpr hFinite))⟩
  have hReal : (liminf D atTop).toReal = liminf d atTop := by
    rw [← ENNReal.liminf_toReal_eq ENNReal.ofReal_ne_top hDBound]
    simp_rw [hEq, ENNReal.toReal_ofReal (hNonneg _)]
  have hMaxNonneg : 0 ≤ dMax := by
    obtain ⟨i, hi⟩ := hBound.exists
    exact (hNonneg i).trans hi
  refine ⟨hInt, ?_, ?_⟩
  · rw [integral_eq_lintegral_of_nonneg_ae hPos hSm, ← hReal]
    exact ENNReal.toReal_mono hFinite hLimit
  · rw [integral_eq_lintegral_of_nonneg_ae hPos hSm, ← ENNReal.toReal_ofReal hMaxNonneg]
    exact ENNReal.toReal_mono ENNReal.ofReal_ne_top (hLimit.trans hMax)

omit [NeZero (Module.finrank ℝ E)] in
/-- For actual source and limit frame densities, transport through the same
pointed maps controls each signed total. The explicit compact majorant and
pointwise convergence are measured in the indicated frames after comparison. -/
theorem bourPointedSignedWeyl_le_liminf
    (F : PointedRiemannianConvergenceMaps X P φ) (C : MetricConvergenceData F)
    (hCanonical : ∀ i, C.domain i = CanonicalMetricCompactness.canonicalSourceData F i)
    (oP : ManifoldOrientation I P.M 4) (oX : ∀ i, ManifoldOrientation I (X.obj i).M 4)
    (frameP : ∀ x, OrientedOrthonormalFrameAt P.metric oP x)
    (frameX : ∀ i x, OrientedOrthonormalFrameAt (X.obj i).metric (oX i) x) :
    let density := fun i sign x =>
      ENNReal.ofReal (hilbertSchmidtSq (signedCollarWeylBlock (oX i) (X.obj i).metric (frameX i) sign x))
    let limit := fun sign x =>
      ENNReal.ofReal (hilbertSchmidtSq (signedCollarWeylBlock oP P.metric frameP sign x))
    (∀ i sign, Measurable (density i sign)) →
    (∀ sign (K : Set P.M), IsCompact K → ∃ B : ℝ≥0∞, B ≠ ⊤ ∧
      ∀ᶠ i in atTop, ∀ x ∈ K, density (φ i) sign (F.map i x) ≤ B) →
    (∀ x a b c d, Tendsto (fun i =>
      metricCurvatureFrameTensor (X.obj (φ i)).metric (oX (φ i)) (F.map i x)
        (frameX (φ i) (F.map i x)) a b c d)
      atTop (𝓝 (metricCurvatureFrameTensor P.metric oP x (frameP x) a b c d))) →
    ∀ sign, (∫⁻ x, limit sign x ∂riemannianVolumeMeasure I P.M P.metric) ≤
      liminf (fun i => ∫⁻ x, density (φ i) sign x
        ∂riemannianVolumeMeasure I (X.obj (φ i)).M (X.obj (φ i)).metric) atTop := by
  intro density limit hMeas hBound hTensor sign
  apply bourPointedIntegral_le_liminf F (fun i => density i sign) (limit sign)
  intro K hK
  obtain ⟨B, hB, hBoundK⟩ := hBound sign K hK
  apply F.tendsto_setLIntegral_image C hCanonical hK (fun i => density i sign)
    (fun i => hMeas i sign) hB hBoundK
  intro x _
  apply (ENNReal.continuous_ofReal.tendsto _).comp
  unfold hilbertSchmidtSq
  refine tendsto_finsetSum _ fun a _ => tendsto_finsetSum _ fun b _ => ?_
  apply Filter.Tendsto.pow
  let R (i : ℕ) := metricCurvatureFrameTensor (X.obj (φ i)).metric (oX (φ i))
    (F.map i x) (frameX (φ i) (F.map i x))
  let S := metricCurvatureFrameTensor P.metric oP x (frameP x)
  cases sign
  · exact tendsto_traceFreeSelfDualBlock_apply (hTensor x) a b
  · have hAnti (j k : Fin 3) : Tendsto (fun i => antiSelfDualCurvatureBlock (R i) j k)
        atTop (𝓝 (antiSelfDualCurvatureBlock S j k)) := by
      let u := selfDualFirstWedge
      let v := selfDualSecondWedge
      unfold antiSelfDualCurvatureBlock
      exact ((((hTensor x (u j).1 (u j).2 (u k).1 (u k).2).sub
        (hTensor x (u j).1 (u j).2 (v k).1 (v k).2)).sub
        (hTensor x (v j).1 (v j).2 (u k).1 (u k).2)).add
        (hTensor x (v j).1 (v j).2 (v k).1 (v k).2)).div_const 2
    have hTrace : Tendsto (fun i => (antiSelfDualCurvatureBlock (R i)).trace) atTop
        (𝓝 (antiSelfDualCurvatureBlock S).trace) := by
      simp only [Matrix.trace, Matrix.diag_apply]
      exact tendsto_finsetSum _ fun j _ => hAnti j j
    change Tendsto (fun i => traceFreeChiralBlock (antiSelfDualCurvatureBlock (R i)) a b)
      atTop (𝓝 (traceFreeChiralBlock (antiSelfDualCurvatureBlock S) a b))
    simp only [traceFreeChiralBlock, Matrix.sub_apply, Matrix.smul_apply, smul_eq_mul]
    exact (hAnti a b).sub ((hTrace.div_const 3).mul_const _)

end Pointed

/-- The one-end calculation uses the Euler transgression on the spherical
truncation with Hilbert–Schmidt Weyl norms and ordinary tensor Ricci norm. -/
theorem bourOneEuclideanEnd
    {k : ℕ} (hk : 0 < k) {ePlus eMinus d dMax : ℝ}
    (hPlus : 0 ≤ ePlus) (hMinus : 0 ≤ eMinus)
    (hEuler : ePlus + eMinus - d / 2 = 8 * Real.pi ^ 2 * (2 - 2 * (k : ℝ)))
    (hD : d ≤ dMax) (hMax : dMax < 32 * Real.pi ^ 2) :
    k = 1 := by
  by_contra h
  have hTwo : (2 : ℝ) ≤ k := by exact_mod_cast (show 2 ≤ k by omega)
  have hMul := mul_nonneg (sq_nonneg Real.pi) (sub_nonneg.mpr hTwo)
  nlinarith only [hPlus, hMinus, hEuler, hD, hMax, hMul]

/-- After the spherical one-end test, the signature identity gives equal
chiral totals and the two separate source and Ricci ceilings. -/
theorem bourSignedEndEnergy {ePlus eMinus d dMax e : ℝ}
    (hEuler : ePlus + eMinus - d / 2 = 0)
    (hSignature : ePlus - eMinus = 0) (hD : d ≤ dMax)
    (hPlus : ePlus ≤ e) (hMinus : eMinus ≤ e) :
    ePlus = eMinus ∧ d = 4 * ePlus ∧
      ePlus ≤ min e (dMax / 4) ∧ eMinus ≤ min e (dMax / 4) := by
  have hEqual : ePlus = eMinus := sub_eq_zero.mp hSignature
  have hRicci : d = 4 * ePlus := by linarith only [hEuler, hEqual]
  refine ⟨hEqual, hRicci, le_min hPlus ?_, le_min hMinus ?_⟩
  · linarith only [hRicci, hD]
  · linarith only [hRicci, hD, hEqual]

/-- On each chirality the retained compact core removes more than one
threshold of energy from the source. A fixed smaller margin in this
subtraction pays for the full exterior splice. -/
theorem bourCappedExterior_both_lt
    {eCore : CollarChirality → ℝ} {δ cost : ℝ}
    (hCost : cost ≤ δ)
    (rawCore capped source : ℕ → CollarChirality → ℝ)
    (hCore : ∀ sign, 4 * Real.pi ^ 2 < eCore sign)
    (hLimit : ∀ sign, Tendsto (fun i => rawCore i sign) atTop (𝓝 (eCore sign)))
    (hSource : ∀ᶠ i in atTop, ∀ sign, source i sign ≤ 8 * Real.pi ^ 2 - δ)
    (hSplice : ∀ᶠ i in atTop, ∀ sign, capped i sign ≤ source i sign - rawCore i sign + cost) :
    ∀ᶠ i in atTop, ∀ sign, capped i sign < 4 * Real.pi ^ 2 := by
  filter_upwards [hSource, hSplice, (hLimit .plus).eventually_const_lt (hCore .plus),
    (hLimit .minus).eventually_const_lt (hCore .minus)] with i hs hc hp hm
  intro sign
  have hr : 4 * Real.pi ^ 2 < rawCore i sign := by cases sign <;> assumption
  linarith only [hs sign, hc sign, hr, hCost]

section Gluing

open DifferentialGeometry.PDE.RicciFlow.Perelman.KappaSolutions

variable {E H M N : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [FiniteDimensional ℝ E] [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T3Space M]
  [TopologicalSpace N] [ChartedSpace H N] [IsManifold I ∞ N] [T2Space N]
  [PreconnectedSpace N]

/-- Glue the actual inverse core comparison to the exterior replacement when
the compact pieces cover, their maps have the same germ at the seam, and
their images meet only along the common image. The returned diffeomorphism
has both inverse and forward germs on neighborhoods of the compact core
and replacement. Positive orientation is read at one point of the core. -/
theorem bourGlueMarkedInverse
    (core exterior : PartialDiffeomorph I I M N ∞)
    (oM : ManifoldOrientation I M 4) (oN : ManifoldOrientation I N 4)
    {K V W : Set M} (hK : IsCompact K) (hV : IsCompact V)
    (hCore : K ⊆ core.source) (hExt : V ⊆ exterior.source)
    (hW : IsOpen W) (hSeam : K ∩ V ⊆ W) (hAgree : EqOn core exterior W)
    (hOverlap : core '' K ∩ exterior '' V ⊆ core '' (K ∩ V))
    (hSource : K ∪ V = univ) (hTarget : core '' K ∪ exterior '' V = univ)
    {p : M} (hp : p ∈ K)
    (hOrientation : Orientation.map (Fin 4)
      ((core.isLocalDiffeomorphAt I I ∞ (hCore hp)).mfderivToContinuousLinearEquiv
        (by simp)).toLinearEquiv (oM.orientation p) = oN.orientation (core p)) :
    ∃ (F : M ≃ₘ⟮I, I⟯ N) (U₀ U₁ : Opens M),
      F.preservesOrientation oM oN ∧ K ⊆ U₀ ∧ V ⊆ U₁ ∧
      (U₀ : Set M) ⊆ core.source ∧ (U₁ : Set M) ⊆ exterior.source ∧
      EqOn F core U₀ ∧ EqOn F exterior U₁ ∧
      EqOn F.symm core.symm (core '' (U₀ : Set M)) ∧
      EqOn F.symm exterior.symm (exterior '' (U₁ : Set M)) := by
  obtain ⟨D, U, V', hU, hV', hKU, hVV', hDom, hDU, hDV⟩ :=
    PartialDiffeomorph.exists_eqOn_neighborhoods_of_isCompact core exterior
      hK hV hCore hExt hW hSeam hAgree hOverlap
  have hDS : D.source = univ := eq_univ_of_univ_subset
    (hSource ▸ (union_subset_union hKU hVV').trans hDom)
  have hDT : D.target = univ := by
    apply eq_univ_of_univ_subset
    rw [← hTarget]
    rintro y (⟨x, hx, rfl⟩ | ⟨x, hx, rfl⟩)
    · rw [← hDU (hKU hx)]
      exact D.map_source' (hDS.symm ▸ mem_univ x)
    · rw [← hDV (hVV' hx)]
      exact D.map_source' (hDS.symm ▸ mem_univ x)
  let F := globalDiffeomorphOfUniv D hDS hDT
  let U₀ : Opens M := ⟨U ∩ core.source, hU.inter core.open_source⟩
  let U₁ : Opens M := ⟨V' ∩ exterior.source, hV'.inter exterior.open_source⟩
  have hF₀ : EqOn F core U₀ := fun _ hx => hDU hx.1
  have hF₁ : EqOn F exterior U₁ := fun _ hx => hDV hx.1
  have hpU : p ∈ U₀ := ⟨hKU hp, hCore hp⟩
  have hGerm := hF₀.eventuallyEq_of_mem (U₀.isOpen.mem_nhds hpU)
  have hFMap : F p = core p := hF₀ hpU
  have hFOrientation : F.preservesOrientation oM oN := by
    apply (F.preservesOrientation_iff_eq_at oM oN p).mpr
    have hDeriv : (F.mfderivToContinuousLinearEquiv (by simp) p).toLinearEquiv =
        ((core.isLocalDiffeomorphAt I I ∞ (hCore hp)).mfderivToContinuousLinearEquiv
          (by simp)).toLinearEquiv := by
      ext v
      exact congrArg (fun T => T v) (hGerm.mfderiv_eq (I := I) (I' := I))
    rw [hDeriv, hFMap]
    exact hOrientation
  refine ⟨F, U₀, U₁, hFOrientation, fun _ h => ⟨hKU h, hCore h⟩,
    fun _ h => ⟨hVV' h, hExt h⟩, inter_subset_right, inter_subset_right,
    hF₀, hF₁, ?_, ?_⟩
  · rintro _ ⟨x, hx, rfl⟩
    calc
      F.symm (core x) = x := by rw [← hF₀ hx, F.symm_apply_apply]
      _ = core.symm (core x) := (core.left_inv' hx.2).symm
  · rintro _ ⟨x, hx, rfl⟩
    calc
      F.symm (exterior x) = x := by rw [← hF₁ hx, F.symm_apply_apply]
      _ = exterior.symm (exterior x) := (exterior.left_inv' hx.2).symm

end Gluing

end SmoothPoincare
