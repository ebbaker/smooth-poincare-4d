import SmoothPoincare

/-! E48 applications for Edward B. Baker III, 26 November 2026.
OpenAI Codex assistance. Actual serving model and effort were unavailable. -/

set_option autoImplicit false

open DifferentialGeometry DifferentialGeometry.Geometry.Curvature
open DifferentialGeometry.Integral.Measure FirstOrderTwistor Filter MeasureTheory
open SectionsAndConnections Set
open scoped BigOperators ContDiff ENNReal Manifold Topology

namespace E48Readback

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "I₄" => 𝓘(ℝ, E₄)

section Geometry

open SmoothPoincare

variable {H M : Type*} [TopologicalSpace H]
  {I : ModelWithCorners ℝ E₄ H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  [CompactSpace M] [ConnectedSpace M]

local instance : MeasurableSpace M := borel M
local instance : BorelSpace M := ⟨rfl⟩
local instance : NeZero (Module.finrank ℝ E₄) := ⟨by simp⟩

-- The curvature operator bound at one gives the four-slot norm bound at two.
example (g : SmoothRiemannianMetric I M) (x : M)
    (h : intrinsicCurvatureSq g x / 4 ≤ 1) :
    Real.sqrt (intrinsicCurvatureSq g x) ≤ 2 := by
  simpa only [one_pow, mul_one] using
    bourFullCurvatureNorm_le_of_quarterSq g x (show 0 ≤ (1 : ℝ) by norm_num) (by simpa using h)

example (g : SmoothRiemannianMetric I M) (x : M) :
    intrinsicCurvatureSq (scaleMetric 2 (by norm_num) g) x = intrinsicCurvatureSq g x / 4 := by
  rw [bourFullCurvatureSq_scale]
  ring

-- Normalizing by a positive four-slot maximum gives operator norm one half at the basepoint.
example (g : SmoothRiemannianMetric I M) (x : M) {Q : ℝ} (hQ : 0 < Q)
    (hx : Real.sqrt (intrinsicCurvatureSq g x) = Q)
    (hMax : ∀ z : M, Real.sqrt (intrinsicCurvatureSq g z) ≤ Q) :
    intrinsicCurvatureSq (scaleMetric Q hQ g) x / 4 = 1 / 4 := by
  have he := (bourCurvatureMaximum_scale g x hQ hx hMax).2
  have hn : 0 ≤ intrinsicCurvatureSq (scaleMetric Q hQ g) x :=
    DifferentialGeometry.Tensor0SBundle.normSq0S_nonneg _ _ _ _
  have hSq := congrArg (fun r : ℝ => r ^ 2) he
  rw [Real.sq_sqrt hn, one_pow] at hSq
  rw [hSq]

-- A single constant serves every index and basepoint and uses that metric's distance.
example (g : ℕ → SmoothRiemannianMetric I M) {κ K : ℝ} (hκ : 0 < κ) (hK : 0 < K)
    (hRm : ∀ j x, intrinsicCurvatureSq (g j) x / 4 ≤ K ^ 2)
    (hVol : ∀ j x r, 0 < r → r ≤ 1 → κ * r ^ 4 ≤ bourBallVolume (g j) x r) :
    ∃ i₀ > 0, ∀ j x, ENNReal.ofReal i₀ ≤ bourPhysicalInjRadius (g j) x := by
  obtain ⟨i₀, hi₀, hInjectivity⟩ := bourUniformInjectivity_of_ballVolume
    (I := I) (M := M) (by simp) hκ (mul_pos (by norm_num : (0 : ℝ) < 2) hK)
  exact ⟨i₀, hi₀, fun j => hInjectivity (g j)
    (fun x => bourFullCurvatureNorm_le_of_quarterSq (g j) x hK.le (hRm j x)) (hVol j)⟩

-- One radius remains valid over independently rescaled metrics, with the actual normalized balls.
example (g : ℕ → SmoothRiemannianMetric I M) (R a : ℕ → ℝ) (ha : ∀ j, 0 < a j)
    {y C K : ℝ} (hy : 0 < y) (hC : 0 ≤ C) (hK : 0 < K)
    (hY : ∀ j, y ≤ classYamabeFour (by simp) (g j))
    (hScalar : ∀ j x, metricScalarAt (g j) x = R j)
    (hR : ∀ j, 0 ≤ R j ∧ R j ≤ C) (hScale : ∀ j, 1 ≤ a j)
    (hRm : ∀ j x, intrinsicCurvatureSq (g j) x / 4 ≤ (a j * K) ^ 2) :
    ∃ r > 0, ∀ j (x : M), ∃ F : PartialDiffeomorph I₄ I E₄ M ∞,
      F.source = Metric.ball (0 : E₄) r ∧
      F.target = riemannianBallOf (scaleMetric (a j) (ha j) (g j)) x r ∧
      F 0 = x ∧ ∀ z ∈ Metric.ball (0 : E₄) r, ∀ v : E₄,
        let W := mfderiv I₄ I F z v
        let h := scaleMetric (a j) (ha j) (g j)
        (1 / 2 : ℝ) * ‖v‖ ^ 2 ≤ h.inner (F z) W W ∧ h.inner (F z) W W ≤ 2 * ‖v‖ ^ 2 := by
  obtain ⟨r, hr, hCharts⟩ := bourUniformNormalBalls_of_yamabe
    (I := I) (M := M) (by simp) hy hC (mul_pos (by norm_num : (0 : ℝ) < 2) hK)
  refine ⟨r, hr, ?_⟩
  intro j x
  have hCurv (z : M) : intrinsicCurvatureSq (g j) z / 4 ≤ (a j * (2 * K / 2)) ^ 2 := by
    convert hRm j z using 1
    ring
  obtain ⟨ball⟩ := hCharts (g j) (R j) (a j) (ha j) (hY j) (hScalar j) (hR j).1 (hR j).2
    (hScale j) hCurv x
  exact ⟨ball.chart, ball.source_eq, ball.target_eq, ball.center_eq, ball.metric_bounds⟩

example {R C a : ℝ} (hR : 0 ≤ R) (hC : R ≤ C) (ha : 1 ≤ a) : R / (6 * a) ≤ C / 6 := by
  have h := (bourStationary_scalarCoefficient_bound (p := 0) le_rfl (by norm_num) hR hC ha).2
  convert h using 1
  have ha0 : a ≠ 0 := ne_of_gt (zero_lt_one.trans_le ha)
  field_simp [ha0]
  ring

end Geometry

section HarmonicRicci

open DifferentialGeometry.Geometry.Connection DifferentialGeometry.Geometry.Operator
  DifferentialGeometry.Tensor.Coordinates SmoothPoincare

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]

local notation "J" => Fin (Module.finrank ℝ E₄)

example (g : SmoothRiemannianMetric I M) (p : M) {y : E₄}
    (hy : y ∈ interior (extChartAt I p).target)
    (hHarmonic : ∀ l : J, ∀ᶠ z in 𝓝 y, laplacian (LeviCivita g) g (bourChartCoordinate (I := I) p l)
      ((extChartAt I p).symm z) = 0) (i k : J) :
    (∑ a : J, ∑ b : J, chartInvGramOnE g p a b y *
      partialDeriv a (partialDeriv b (chartGramOnE g p i k)) y) =
      2 * (bourChartHarmonicRicciError g p i k y - chartRicciTensor g p i k y) := by
  rw [bourChartHarmonicRicci_principal_of_laplacian g p hy hHarmonic i k]
  ring

example (g : SmoothRiemannianMetric I M) (p : M) {y : E₄}
    (hy : y ∈ interior (extChartAt I p).target)
    (hGauge : ∀ j : J, bourChartLoweredHarmonicGauge g p j =ᶠ[𝓝 y] (fun _ => 0))
    (hInv : ∀ a b : J, |chartInvGramOnE g p a b y| ≤ 1)
    (hGrad : ∀ m a b : J, |partialDeriv m (chartGramOnE g p a b) y| ≤ 1)
    (i k : J) (hRicci : |chartRicciTensor g p i k y| ≤ 5) :
    |∑ a : J, ∑ b : J, chartInvGramOnE g p a b y *
      partialDeriv a (partialDeriv b (chartGramOnE g p i k)) y| ≤ 4618 := by
  have h := bourChartHarmonicRicci_trace_bound g p hy hGauge
    (show (0 : ℝ) ≤ 1 by norm_num) (show (0 : ℝ) ≤ 1 by norm_num) hInv hGrad i k hRicci
  have hDim : Module.finrank ℝ E₄ = 4 := by simp
  norm_num [hDim] at h
  exact h

end HarmonicRicci

section StartDeficit

open SmoothPoincare SmoothPoincare.Bour

variable {H M : Type*} [TopologicalSpace H]
  {I : ModelWithCorners ℝ E₄ H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  [CompactSpace M] [ConnectedSpace M] {o : ManifoldOrientation I M 4}

local instance : MeasurableSpace M := borel M
local instance : BorelSpace M := ⟨rfl⟩

-- Nonemptiness still matters if the two real infima coincide.
example {δ : ℝ} (hEmpty : bourDeficitEnergies o δ = ∅) :
    ¬(∀ ε > 0, ∃ e ∈ bourDeficitEnergies o δ, e < sInf (geometricPositiveEnergies o) + ε) := by
  intro hNear
  have hNonempty := ((bourDeficitInfimum_eq_iff_near o δ).mpr hNear).1
  simp [hEmpty] at hNonempty

-- The common margin is chosen before both metrics and the schedule.
example (hNormalize : BourYamabeNormalization o)
    (hEntry : sInf (geometricPositiveEnergies o) < 8 * Real.pi ^ 2) {δ : ℝ}
    (hNear : ∀ ε > 0, ∃ e ∈ bourDeficitEnergies o δ, e < sInf (geometricPositiveEnergies o) + ε) :
    ∃ η > 0, ∀ (α : ℕ → ℝ), (∀ j, 0 < α j) →
      ∃ q : ℕ → SignedCollarMetric o, ∀ j,
        riemannianVolumeMeasure I M (q j).metric univ = 1 ∧
        (∀ x, metricScalarAt (q j).metric x = classYamabeFour o.dimension_eq (q j).metric) ∧
        (q j).energy .plus ≤ 8 * Real.pi ^ 2 - η ∧
        (q j).energy .plus - sInf (geometricPositiveEnergies o) ≤ (α j) ^ 2 ∧
        δ ≤ 384 * Real.pi ^ 2 - (classYamabeFour o.dimension_eq (q j).metric) ^ 2 := by
  obtain ⟨η, hη, hStarts⟩ := (bourUniformDeficitStarts_iff hNormalize hEntry δ).mp
    ((bourDeficitInfimum_eq_iff_near o δ).mpr hNear)
  refine ⟨η, hη, fun α hα => ?_⟩
  obtain ⟨q, hq⟩ := hStarts α hα
  exact ⟨q, fun j => ⟨(hq j).volume_one, (hq j).scalar_csc, (hq j).subcritical,
    (hq j).excess_upper, (hq j).deficit⟩⟩

example (start : ℕ → SignedCollarMetric o) {δ : ℝ} (hδ : 0 < δ) (k : ℕ → ℕ)
    (hk : Tendsto k atTop atTop)
    (hDeficit : ∀ᶠ j in atTop, δ ≤ 384 * Real.pi ^ 2 - (classYamabeFour o.dimension_eq (start j).metric) ^ 2) :
    ¬Tendsto (fun j => (classYamabeFour o.dimension_eq (start (k j)).metric) ^ 2)
      atTop (𝓝 (384 * Real.pi ^ 2)) :=
  bourStartDeficit_excludes_saturation start hδ k hk hDeficit

example (start : ℕ → SignedCollarMetric o) (α : ℕ → ℝ) (hα : ∀ j, 0 < α j)
    (hLimit : Tendsto α atTop (𝓝 0)) {δ : ℝ} (hδ : 0 < δ)
    (hExact : ∀ᶠ j in atTop, (start j).energy .plus = sInf (geometricPositiveEnergies o))
    (hDeficit : ∀ᶠ j in atTop, δ ≤ 384 * Real.pi ^ 2 - (classYamabeFour o.dimension_eq (start j).metric) ^ 2) :
    ∀ᶠ j in atTop, ∀ returned : SignedCollarMetric o,
      0 < classYamabeFour o.dimension_eq returned.metric →
      4 * returned.energy .plus ≤ 4 * sInf (geometricPositiveEnergies o) +
        ((classYamabeFour o.dimension_eq (start j).metric) ^ 2 - 384 * Real.pi ^ 2) / 12 → False := by
  have hExcess : ∀ᶠ j in atTop,
      (start j).energy .plus - sInf (geometricPositiveEnergies o) ≤ (α j) ^ 2 :=
    hExact.mono fun j hj => by rw [hj, sub_self]; exact sq_nonneg _
  have h := eventually_bourStartDeficit_excludes_firstPointed start α hα hLimit hδ hExcess hDeficit
  filter_upwards [h, hExact] with j hj hZero
  intro returned hPositive hRicci
  apply hj returned (4 * returned.energy .plus) hPositive rfl
  simpa only [hZero, sub_self, mul_zero, zero_div, add_zero] using hRicci

end StartDeficit

section MarkedExterior

open SmoothPoincare

variable {P D : Type*} [TopologicalSpace P] [ChartedSpace E₄ P] [IsManifold I₄ ∞ P]
  [TopologicalSpace D] [ChartedSpace E₄ D] [IsManifold I₄ ∞ D] [T2Space D] [PreconnectedSpace D]

example (A : P ≃ₘ⟮I₄, I₄⟯ D) (oP : ManifoldOrientation I₄ P 4) (oD : ManifoldOrientation I₄ D 4)
    (hA : A.preservesOrientation oP oD)
    (sourceCap : PartialDiffeomorph I₄ I₄ E₄ P ∞) (targetCap : PartialDiffeomorph I₄ I₄ E₄ D ∞)
    (prescribed : PartialDiffeomorph I₄ I₄ P D ∞) (chart : PartialDiffeomorph I₄ I₄ D E₄ ∞)
    {r R : ℝ} (hr : 0 < r) (hBuffer : r < R)
    (hSource : Metric.closedBall (0 : E₄) R ⊆ sourceCap.source)
    (hTarget : Metric.closedBall (0 : E₄) R ⊆ targetCap.source)
    (hPrescribed : sourceCap '' Metric.closedBall (0 : E₄) R ⊆ prescribed.source)
    (hAgree : ∀ x ∈ Metric.closedBall (0 : E₄) R, prescribed (sourceCap x) = targetCap x)
    (hChartSource : A '' (sourceCap '' Metric.closedBall (0 : E₄) R) ⊆ chart.source)
    (hChartTarget : targetCap '' Metric.closedBall (0 : E₄) R ⊆ chart.source)
    (hSegment : ∀ t ∈ Icc (0 : ℝ) 1,
      (1 - t) • chart (A (sourceCap 0)) + t • chart (targetCap 0) ∈ chart.target)
    (hDet : 0 < (fderiv ℝ (fun x : E₄ => chart (A (sourceCap x))) 0).det *
      (fderiv ℝ (fun x : E₄ => chart (targetCap x)) 0).det)
    (pole : D) (hPole : pole ∉ chart.source) :
    ∃ F : P ≃ₘ⟮I₄, I₄⟯ D,
      F.preservesOrientation oP oD ∧
      EqOn F prescribed (sourceCap '' Metric.closedBall (0 : E₄) r) ∧
      EqOn F.symm prescribed.symm (targetCap '' Metric.closedBall (0 : E₄) r) ∧
      F '' (sourceCap '' Metric.ball (0 : E₄) r)ᶜ = (targetCap '' Metric.ball (0 : E₄) r)ᶜ := by
  obtain ⟨F, hOrientation, _, _, _, hF, hInv, hExterior⟩ := bourMarkedExterior_of_commonChart
    A oP oD hA sourceCap targetCap prescribed chart hr hBuffer hSource hTarget hPrescribed hAgree
    hChartSource hChartTarget hSegment hDet pole hPole
  exact ⟨F, hOrientation, hF.mono (image_mono (Metric.closedBall_subset_ball hBuffer)),
    hInv.mono (image_mono (Metric.closedBall_subset_ball hBuffer)), hExterior⟩

end MarkedExterior

section RoundEnd

open SmoothPoincare Metric

local instance : Fact (Module.finrank ℝ (EuclideanSpace ℝ (Fin 5)) = 4 + 1) := ⟨by simp⟩

example (o : ManifoldOrientation I₄ StandardFourSphere 4) (v : E₄) :
    ∃ F : StandardFourSphere ≃ₘ⟮I₄, I₄⟯ StandardFourSphere, F.preservesOrientation o o ∧
      F (transportedCapStereographic.symm 0) = transportedCapStereographic.symm v ∧
      F.symm (transportedCapStereographic.symm v) = transportedCapStereographic.symm 0 ∧
      F '' (transportedCapStereographic.symm '' ball (0 : E₄) 2)ᶜ =
        ((fun x : E₄ => transportedCapStereographic.symm (x + v)) '' ball (0 : E₄) 2)ᶜ := by
  obtain ⟨F, hOrientation, hF, hInv, hExt⟩ := bourMarkedTranslatedRoundCap o v (R := 3) (by norm_num)
  exact ⟨F, hOrientation, by simpa using hF 0 (mem_closedBall_self (by norm_num)),
    by simpa using hInv 0 (mem_ball_self (by norm_num)), hExt⟩

example :
    (∫ _ : sphere (0 : E₄) 1,
      4 * Matrix.det ((2 : ℝ)⁻¹ • (1 : Matrix (Fin 3) (Fin 3) ℝ))
      ∂(ENNReal.ofReal ((2 : ℝ) ^ 3) • (volume : Measure E₄).toSphere)) = 8 * Real.pi ^ 2 :=
  bourEuclideanSphereCubicBoundaryIntegral (by norm_num)

end RoundEnd

section CompactTransfer

open DifferentialGeometry.CheegerGromovCompactness SmoothPoincare SmoothPoincare.Bour

universe u uE uH

variable {E : Type uE} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
  [FiniteDimensional ℝ E] [NeZero (Module.finrank ℝ E)]
  {H : Type uH} [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  {X : PointedRiemannianSeq.{u,uE,uH} I} {P : PointedRiemannianManifold.{u,uE,uH} I}
  {φ : ℕ → ℕ}

attribute [local instance] PointedRiemannianManifold.topology PointedRiemannianManifold.charted
  PointedRiemannianManifold.smooth PointedRiemannianManifold.t2
  PointedRiemannianManifold.sigmaCompact PointedRiemannianManifold.t2TangentBundle

local instance : CompleteSpace E := FiniteDimensional.complete ℝ E
local instance (Q : PointedRiemannianManifold.{u,uE,uH} I) : MeasurableSpace Q.M := borel Q.M
local instance (Q : PointedRiemannianManifold.{u,uE,uH} I) : BorelSpace Q.M := ⟨rfl⟩

-- The two signed totals transfer on the actual sequence indexed by φ.
example [CompactSpace P.M] [∀ i, CompactSpace (X.obj i).M]
    (F : PointedRiemannianConvergenceMaps X P φ) (C : MetricConvergenceData F)
    (hc : ∀ i, C.domain i = CanonicalMetricCompactness.canonicalSourceData F i)
    (hconn : ∀ i, ConnectedSpace (X.obj (φ i)).M)
    (oP : ManifoldOrientation I P.M 4) (oX : ∀ i, ManifoldOrientation I (X.obj i).M 4)
    (q : ∀ i, SignedCollarMetric (oX i)) (limit : SignedCollarMetric oP)
    (hMetric : ∀ i, (q i).metric = (X.obj i).metric) (hLimit : limit.metric = P.metric)
    (hEuler : ∀ᶠ i in atTop, bourEuler (q (φ i)) = bourEuler limit) :
    Tendsto (fun i => (q (φ i)).energy .minus + (q (φ i)).energy .plus) atTop
      (𝓝 (limit.energy .minus + limit.energy .plus)) := by
  have h := compactReturn_signed_energy F C hc hconn oP oX q limit hMetric hLimit hEuler
  exact (h .minus).add (h .plus)

-- Proper compact truncations retain separate signs, with their actual image masses.
example (F : PointedRiemannianConvergenceMaps X P φ) (C : MetricConvergenceData F)
    (hc : ∀ i, C.domain i = CanonicalMetricCompactness.canonicalSourceData F i)
    (oP : ManifoldOrientation I P.M 4) (oX : ∀ i, ManifoldOrientation I (X.obj i).M 4)
    (frameP : ∀ x, OrientedOrthonormalFrameAt P.metric oP x)
    (g : ∀ i, SmoothRiemannianMetric I (X.obj i).M)
    (frame : ∀ i x, OrientedOrthonormalFrameAt (g i) (oX i) x)
    (a : ℕ → ℝ) (ha : ∀ i, 0 < a i)
    (hScale : ∀ i, (X.obj i).metric = scaleMetric (a i) (ha i) (g i))
    (hOrientation : ∀ᶠ i in atTop, bourComparisonPreservesOrientation F oP oX i)
    {K : Set P.M} (hK : IsCompact K) {B : ℝ}
    (hBound : ∀ᶠ i in atTop, ∀ y ∈ F.map i '' K, intrinsicCurvatureSq (X.obj (φ i)).metric y / 4 ≤ B) :
    let frames := fun i => bourScaledFrame (oX i) (frame i) (ha i) (hScale i)
    let source := fun i sign => bourSignedWeylDensity (g i) (oX i) (frame i) sign
    let limit := fun sign => bourSignedWeylDensity P.metric oP frameP sign
    (∀ x ∈ K, ∀ a b c d, Tendsto (fun i =>
      metricCurvatureFrameTensor (X.obj (φ i)).metric (oX (φ i)) (F.map i x)
        (frames (φ i) (F.map i x)) a b c d)
      atTop (𝓝 (metricCurvatureFrameTensor P.metric oP x (frameP x) a b c d))) →
    (∀ i sign, Measurable (fun x => ENNReal.ofReal
      (bourSignedWeylDensity (X.obj i).metric (oX i) (frames i) sign x))) →
    Tendsto (fun i => (energyMeasure (riemannianVolumeMeasure I (X.obj (φ i)).M (g (φ i)))
      (source (φ i) .minus)).real (F.map i '' K)) atTop
      (𝓝 ((energyMeasure (riemannianVolumeMeasure I P.M P.metric) (limit .minus)).real K)) := by
  intro frames source limit hTensor hMeas
  exact ((bourPointedSignedWeylPhysicalMass F C hc oP oX frameP g frame a ha hScale
    hOrientation hK hBound hTensor hMeas).2 .minus).2

-- Saturation allows both exterior thresholds on a fixed sufficiently late truncation.
example (F : PointedRiemannianConvergenceMaps X P φ)
    (source : ∀ i, CollarChirality → Measure (X.obj i).M) (model : CollarChirality → Measure P.M)
    [∀ i sign, IsFiniteMeasure (source i sign)] [∀ sign, IsFiniteMeasure (model sign)]
    (K : ℕ → Set P.M) (hK : ∀ L, IsCompact (K L)) (hIncreasing : Monotone K)
    (hExhausts : ⋃ L, K L = univ)
    (hTotals : ∀ s, Tendsto (fun i => (source (φ i) s).real univ) atTop (𝓝 ((model s).real univ)))
    (hLocal : ∀ L s, Tendsto (fun i => (source (φ i) s).real (F.map i '' K L)) atTop
      (𝓝 ((model s).real (K L)))) {ε : ℝ} (hε : 0 < ε) (minRadiusIndex : ℕ) :
    ∃ L ≥ minRadiusIndex, ∀ᶠ i in atTop,
      (source (φ i) .plus).real (F.map i '' K L)ᶜ < ε ∧
      (source (φ i) .minus).real (F.map i '' K L)ᶜ < ε := by
  have h := bourPointedSignedExterior_small_of_saturation F source model K hK hIncreasing
    hExhausts hTotals hLocal ε hε
  obtain ⟨L, hL, hExterior⟩ := ((eventually_ge_atTop minRadiusIndex).and h).exists
  exact ⟨L, hL, hExterior.mono fun _ hi => ⟨hi .plus, hi .minus⟩⟩

end CompactTransfer

section PointedScale

open SmoothPoincare

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M] [SigmaCompactSpace M]

local instance : MeasurableSpace M := borel M
local instance : BorelSpace M := ⟨rfl⟩

example (g : SmoothRiemannianMetric I M) (o : ManifoldOrientation I M 4)
    (frame : ∀ x, OrientedOrthonormalFrameAt g o x) (A : Set M) :
    let ha : 0 < (2 : ℝ) := by norm_num
    let scaled := scaleMetric 2 ha g
    (energyMeasure (riemannianVolumeMeasure I M scaled)
      (bourSignedWeylDensity scaled o (bourScaledFrame o frame ha rfl) .minus)).real A =
    (energyMeasure (riemannianVolumeMeasure I M g) (bourSignedWeylDensity g o frame .minus)).real A := by
  intro ha scaled
  exact congrArg (fun μ : Measure M => μ.real A)
    (bourScaledSignedWeylMeasure_eq (g := g) (scaled := scaled) o frame ha rfl .minus)

end PointedScale

section SlabVolume

open Bundle DifferentialGeometry.Geometry DifferentialGeometry.Tensor.Coordinates
  DifferentialGeometry.Tensor0SBundle SmoothPoincare SmoothPoincare.Bour

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M] [CompactSpace M]

local instance : IsManifold I 1 M := IsManifold.of_le (by decide : (1 : ℕ∞ω) ≤ (∞ : ℕ∞ω))
local instance : MeasurableSpace M := borel M
local instance : BorelSpace M := ⟨rfl⟩

example (g : ℝ → SmoothRiemannianMetric I M) {a b : ℝ} (hab : a ≤ b)
    (hg : ∀ (x₀ : M) (i j : Fin (Module.finrank ℝ E₄)),
      ContMDiffOn (𝓘(ℝ, ℝ).prod I) 𝓘(ℝ, ℝ) ∞
        (fun p : ℝ × M => chartGramMatrix (g p.1) x₀ p.2 i j)
        (Ioo a b ×ˢ (trivializationAt E₄ (TangentSpace I) x₀).baseSet))
    (G : ℝ → (x : M) → Tensor0SSpace (𝕜 := ℝ) 2 I x)
    (hV : ∀ t ∈ Ioo a b, ∀ x, HasDerivAt (fun s => metricTensorField (g s) x) ((-2 : ℝ) • G t x) t)
    (hTrace : ∀ t ∈ Ioo a b, ∫ x, inner0S (g t) x 2 (G t x) (metricTensorField (g t) x)
      ∂riemannianVolumeMeasure I M (g t) = 0)
    (hCont : ContinuousOn (fun t => (riemannianVolumeMeasure I M (g t)).real univ) (Icc a b))
    (hInitial : (riemannianVolumeMeasure I M (g a)).real univ = 1) :
    (riemannianVolumeMeasure I M (g b)).real univ = 1 :=
  (bourVolume_constant_on_slab g isOpen_Ioo hab Subset.rfl hg hCont G hV hTrace).trans hInitial

example (g : ℝ → SmoothRiemannianMetric I M) {D : RealTimeInterval}
    (hG : MetricFamilySmoothOn (I := I) D g) {a b : ℝ} (hab : a ≤ b)
    (hTime : Icc a b ⊆ D.regular) (G : ℝ → (x : M) → Tensor0SSpace (𝕜 := ℝ) 2 I x)
    (hV : ∀ t ∈ Ioo a b, ∀ x, HasDerivAt (fun s => metricTensorField (g s) x) ((-2 : ℝ) • G t x) t) :
    IntervalIntegrable (fun t => gradientSq (g t) (G t)) volume a b :=
  bourGradientSq_intervalIntegrable_on_regularSlab g hG hab hTime G hV

example [I.Boundaryless] {o : ManifoldOrientation I M 4} (q : SignedCollarMetric o) :
    bourEnergy 1 q = ∫ x, normSq0S q.metric x 2 (metricRicciAt q.metric x) / 2 -
      metricScalarAt q.metric x ^ 2 / 8 ∂riemannianVolumeMeasure I M q.metric := by
  rw [bourEnergy_eq_integral_bulk]
  simp only [sub_self, zero_mul, zero_add]
  apply integral_congr_ae
  exact ae_of_all _ fun x => by unfold bourBulkDensity; ring

example [I.Boundaryless] {o : ManifoldOrientation I M 4} (q : SignedCollarMetric o) (x : M) :
    deriv (fun s => metricTensorField (bourScalePath q s).metric x) 1 = metricTensorField q.metric x :=
  (bourScalePath_hasDerivAt q x).deriv

end SlabVolume

section ConformalTrace

open DifferentialGeometry.Geometry DifferentialGeometry.Tensor0SBundle SmoothPoincare SmoothPoincare.Bour

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M] [CompactSpace M]
  [ConnectedSpace M] {o : ManifoldOrientation I M 4}

local instance : MeasurableSpace M := borel M
local instance : BorelSpace M := ⟨rfl⟩
local instance : IsManifold I 1 M := IsManifold.of_le (by decide : (1 : ℕ∞ω) ≤ (∞ : ℕ∞ω))

-- All smooth conformal test directions are required in the positive-parameter branch.
example (q : SignedCollarMetric o) {p : ℝ} (hp : 0 < p)
    (hEuler : ∀ u : C^∞⟮I, M; ℝ⟯, ∀ᶠ t : ℝ in 𝓝 0,
      bourEuler (q.conformal (t • u)) = bourEuler q)
    (hCritical : ∀ u : C^∞⟮I, M; ℝ⟯,
      HasDerivAt (fun t : ℝ => bourEnergy p (q.conformal (t • u))) 0 0)
    (x y : M) : metricScalarAt q.metric x = metricScalarAt q.metric y := by
  obtain ⟨R, hR⟩ := scalar_constant_of_conformal_critical q hp hEuler hCritical
  exact (hR x).trans (hR y).symm

example (q : SignedCollarMetric o) (u : C^∞⟮I, M; ℝ⟯)
    (hEuler : ∀ᶠ t : ℝ in 𝓝 0, bourEuler (q.conformal (t • u)) = bourEuler q) :
    HasDerivAt (fun t : ℝ => bourEnergy 0 (q.conformal (t • u))) 0 0 := by
  simpa using bourEnergy_conformal_firstVariation q 0 u hEuler

example (q : SignedCollarMetric o) (G : (x : M) → Tensor0SSpace (𝕜 := ℝ) 2 I x)
    (hSmooth : ContMDiff I 𝓘(ℝ) ∞ (fun x => inner0S q.metric x 2 (G x) (metricTensorField q.metric x)))
    (hEuler : ∀ u : C^∞⟮I, M; ℝ⟯, ∀ᶠ t : ℝ in 𝓝 0,
      bourEuler (q.conformal (t • u)) = bourEuler q)
    (hPairing : ∀ u : C^∞⟮I, M; ℝ⟯, HasDerivAt (fun t : ℝ => bourEnergy 0 (q.conformal (t • u)))
      (∫ x, inner0S q.metric x 2 (G x)
        (deriv (fun t : ℝ => metricTensorField (q.conformal (t • u)).metric x) 0)
        ∂riemannianVolumeMeasure I M q.metric) 0) (x : M) :
    inner0S q.metric x 2 (G x) (metricTensorField q.metric x) = 0 := by
  simpa using gradientTrace_eq_scalarLaplacian q 0 G hSmooth hEuler hPairing x

end ConformalTrace

section ScaleCalibration

open DifferentialGeometry.Geometry DifferentialGeometry.Tensor0SBundle SmoothPoincare SmoothPoincare.Bour

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M] [SigmaCompactSpace M]

local instance : MeasurableSpace M := borel M
local instance : BorelSpace M := ⟨rfl⟩

example (g : SmoothRiemannianMetric I M) (A : Set M) :
    let scaled := scaleMetric 2 (by norm_num) g
    (∫ x in A, intrinsicEulerDensity scaled x ∂riemannianVolumeMeasure I M scaled) =
      ∫ x in A, intrinsicEulerDensity g x ∂riemannianVolumeMeasure I M g :=
  bourEulerIntegral_homothety (by simp) g (by norm_num) A

example [I.Boundaryless] [CompactSpace M] {o : ManifoldOrientation I M 4}
    (q scaled : SignedCollarMetric o) (α : ℝ)
    (h : scaled.metric = scaleMetric 2 (by norm_num) q.metric) :
    bourEnergy α scaled = bourEnergy α q :=
  bourEnergy_homothety q scaled α (by norm_num) h

local instance : Fact (Module.finrank ℝ (EuclideanSpace ℝ (Fin 5)) = 4 + 1) := ⟨by simp⟩

-- The full directional derivative vanishes on the actual round metric, including α = 1.
example {o : ManifoldOrientation I₄ StandardFourSphere 4} (q : ℝ → SignedCollarMetric o)
    {D : RealTimeInterval} (hG : MetricFamilySmoothOn (I := I₄) D (fun s => (q s).metric))
    {t : ℝ} (ht : t ∈ D.regular) (hRound : (q t).metric = standardRoundFourMetric) :
    HasDerivAt (fun s => bourEnergy 1 (q s)) 0 t := by
  apply (bourRound_fullFirstVariation o q (by norm_num : (0 : ℝ) ≤ 1)
    le_rfl hG ht hRound).congr_deriv
  calc
    _ = ∫ _x : StandardFourSphere, (0 : ℝ) ∂riemannianVolumeMeasure I₄ StandardFourSphere (q t).metric := by
      apply integral_congr_ae
      apply ae_of_all
      intro x
      change inner0S (q t).metric x 2 0 (deriv (fun s => metricTensorField (q s).metric x) t) = 0
      rw [show (0 : Tensor0SSpace (𝕜 := ℝ) 2 I₄ x) =
        (0 : ℝ) • (deriv (fun s => metricTensorField (q s).metric x) t) from (zero_smul _ _).symm,
        inner0S_smul_left, zero_mul]
    _ = 0 := integral_zero _ _

end ScaleCalibration

#print axioms SmoothPoincare.bourFullCurvatureSq_scale
#print axioms SmoothPoincare.bourFullCurvatureNorm_le_of_quarterSq
#print axioms SmoothPoincare.bourFullCurvatureNorm_attains_max
#print axioms SmoothPoincare.bourCurvatureMaximum_scale
#print axioms SmoothPoincare.bourUniformInjectivity_of_ballVolume
#print axioms SmoothPoincare.bourUniformNormalBalls_of_ballVolume
#print axioms SmoothPoincare.bourUniformNormalBalls_of_yamabe
#print axioms SmoothPoincare.bourStationary_scalarCoefficient_bound
#print axioms SmoothPoincare.bourChartHarmonicRicci_principal
#print axioms SmoothPoincare.bourChartHarmonicRicciError_bound
#print axioms SmoothPoincare.bourChartHarmonicRicci_trace_bound
#print axioms SmoothPoincare.bourChartLoweredHarmonicGauge_eq_gram_contract
#print axioms SmoothPoincare.bourLaplacian_chartCoordinate
#print axioms SmoothPoincare.bourChartLoweredHarmonicGauge_eventually_zero_of_laplacian
#print axioms SmoothPoincare.bourChartHarmonicRicci_principal_of_laplacian
#print axioms SmoothPoincare.bourDeficitInfimum_eq_iff_near
#print axioms SmoothPoincare.bourUniformDeficitTail_iff
#print axioms SmoothPoincare.bourUniformDeficitStarts_iff
#print axioms SmoothPoincare.exists_bourConstantDeficitYamabeStart_of_attainment
#print axioms SmoothPoincare.bourStartDeficit_excludes_saturation
#print axioms SmoothPoincare.eventually_bourStartDeficit_excludes_firstPointed
#print axioms SmoothPoincare.Bour.mixedReturn_pointed_impossible_of_startDeficit
#print axioms SmoothPoincare.bourMarkedExterior_of_commonChart
#print axioms SmoothPoincare.bourMarkedTranslatedRoundCap
#print axioms SmoothPoincare.bourEuclideanOutwardRadialDerivative
#print axioms SmoothPoincare.bourEuclideanUnitLinkArea
#print axioms SmoothPoincare.bourEuclideanSphereCubicBoundaryIntegral
#print axioms SmoothPoincare.Bour.pointedScalarSq_integral_image
#print axioms SmoothPoincare.Bour.pointedScalarSq_le_liminf
#print axioms SmoothPoincare.Bour.compactReturn_ricci_scalar
#print axioms SmoothPoincare.Bour.compactReturn_signed_energy
#print axioms SmoothPoincare.bourSignedWeylDensity_sum_le_operatorSq
#print axioms SmoothPoincare.bourPointedSignedWeylCompactMass
#print axioms SmoothPoincare.bourPointedSignedWeylPhysicalMass
#print axioms SmoothPoincare.bourScaledSignedWeylMeasure_eq
#print axioms SmoothPoincare.bourPointedSignedExterior_small_of_saturation
#print axioms SmoothPoincare.Bour.traceTimeDerivMetric_eq_inner_of_velocity
#print axioms SmoothPoincare.Bour.bourVolume_hasDerivAt_of_velocity
#print axioms SmoothPoincare.Bour.bourVolume_constant_on_slab
#print axioms SmoothPoincare.Bour.bourScalePath_hasDerivAt
#print axioms SmoothPoincare.Bour.bourScalePath_pairing_eq_zero
#print axioms SmoothPoincare.Bour.bourEnergy_eq_integral_bulk
#print axioms SmoothPoincare.Bour.bourEnergy_hasDerivAt_intrinsic
#print axioms SmoothPoincare.Bour.bourEnergy_volume_continuousOn_regular
#print axioms SmoothPoincare.Bour.bourOriginal_slab_of_pairings
#print axioms SmoothPoincare.Bour.bourGradientSq_intervalIntegrable_on_regularSlab
#print axioms SmoothPoincare.Bour.bourOriginal_regularSlab_of_pairings
#print axioms SmoothPoincare.Bour.scalarSq_hasDerivAt_conformal
#print axioms SmoothPoincare.Bour.bourEnergy_conformal_firstVariation
#print axioms SmoothPoincare.Bour.metricVelocity_conformal
#print axioms SmoothPoincare.Bour.gradientTrace_eq_scalarLaplacian
#print axioms SmoothPoincare.Bour.scalar_constant_of_conformal_critical
#print axioms SmoothPoincare.Bour.bourEulerDensity_homothety
#print axioms SmoothPoincare.Bour.bourEulerIntegral_homothety
#print axioms SmoothPoincare.Bour.bourEuler_homothety
#print axioms SmoothPoincare.Bour.bourEnergy_homothety
#print axioms SmoothPoincare.Bour.bourEnergy_hasDerivAt_fullDensity
#print axioms SmoothPoincare.Bour.bourRound_isMin
#print axioms SmoothPoincare.Bour.bourRound_fullFirstVariation

end E48Readback
