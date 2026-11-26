import SmoothPoincare.Heights.RoundGaussArea
import SmoothPoincare.Variational.AttainedRecognition
import SmoothPoincare.Variational.IntrinsicTerminalCharge
import SmoothPoincare.Variational.SignedCollarRepair
import SmoothPoincare.Variational.YamabeWall

/-! # Physical budgets on the original Bour trajectory

BRF-E01–03, 26 November 2026, prepared for Edward B. Baker III with OpenAI
Codex assistance. Serving model and reasoning effort are unavailable.
Inputs: working Proposition budget at intake 4d73fdde6804ce93fc2a3e4cef403e16eb941dab,
Bour arXiv:1012.0342v1 §§1.2, 3–4 and Lee–Parker §§3–4. The integrated Euler
and signature formulas, Yamabe realization and spectral sign data, and
the original-flow sublevel enter separately. No evolution or extraction is used.
-/

open DifferentialGeometry DifferentialGeometry.Geometry.Curvature
  DifferentialGeometry.Integral.Measure DifferentialGeometry.Tensor0SBundle
  Filter FirstOrderTwistor MeasureTheory SectionsAndConnections Set
open scoped ContDiff Manifold Topology

noncomputable section

namespace SmoothPoincare.Bour

variable {E H M : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  [BoundarylessManifold I M]

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩
private local instance : CompleteSpace E := FiniteDimensional.complete ℝ E
private local instance : IsManifold I 1 M := IsManifold.of_le (by decide : (1 : WithTop ℕ∞) ≤ ∞)

section Domain

variable [SigmaCompactSpace M]

/-- The components are integrated against the same metric's physical volume.
The `.full` component is the ordered four-tensor squared norm. -/
def bourChargeOn (o : ManifoldOrientation I M 4) (g : SmoothRiemannianMetric I M)
    (f : ∀ x, OrientedOrthonormalFrameAt g o x) (A : Set M) (c : ModifiedChargeComponent) : ℝ :=
  ∫ x in A, modifiedChargeDensity o g f c x ∂riemannianVolumeMeasure I M g

/-- The local curvature identity is valid on a domain without a signature
identity. The operator square is one quarter of the ordered tensor square. -/
theorem bourChargeOn_full_eq (o : ManifoldOrientation I M 4) (g : SmoothRiemannianMetric I M)
    (f : ∀ x, OrientedOrthonormalFrameAt g o x) (A : Set M)
    (hint : ∀ c, IntegrableOn (modifiedChargeDensity o g f c) A
      (riemannianVolumeMeasure I M g)) :
    bourChargeOn o g f A .full / 4 =
      bourChargeOn o g f A .plus + bourChargeOn o g f A .minus +
        bourChargeOn o g f A .ricci / 2 + bourChargeOn o g f A .scalar / 24 := by
  let d := modifiedChargeDensity o g f
  let μ := (riemannianVolumeMeasure I M g).restrict A
  have hPoint (x : M) : d .full x =
      4 * (d .plus x + d .minus x) + 2 * d .ricci x + d .scalar x / 6 :=
    metricFrameTensorNormSq_eq_chiral_ricci_scalar g o x (f x)
  have hp : Integrable (d .plus) μ := hint .plus
  have hn : Integrable (d .minus) μ := hint .minus
  have hs : Integrable (fun x => d .scalar x / 6) μ := (hint .scalar).div_const 6
  have hChiral : Integrable (fun x => 4 * (d .plus x + d .minus x)) μ :=
    (hp.add hn).const_mul 4
  have hRicci : Integrable (fun x => 2 * d .ricci x) μ := (hint .ricci).const_mul 2
  have hSum : Integrable (fun x => 4 * (d .plus x + d .minus x) + 2 * d .ricci x) μ :=
    hChiral.add hRicci
  have hInt : (∫ x, d .full x ∂μ) =
      4 * ((∫ x, d .plus x ∂μ) + ∫ x, d .minus x ∂μ) +
        2 * (∫ x, d .ricci x ∂μ) + (∫ x, d .scalar x ∂μ) / 6 := by
    calc
      _ = ∫ x, (4 * (d .plus x + d .minus x) + 2 * d .ricci x + d .scalar x / 6) ∂μ :=
        integral_congr_ae (ae_of_all _ hPoint)
      _ = _ := by
        rw [integral_add hSum hs, integral_add hChiral hRicci,
          integral_const_mul, integral_const_mul, integral_add hp hn, integral_div]
  change _ / 4 = _
  unfold bourChargeOn
  linarith only [hInt]

end Domain

section Closed

variable [I.Boundaryless] [CompactSpace M] [Nonempty M] {o : ManifoldOrientation I M 4}

omit [BoundarylessManifold I M] [I.Boundaryless] [CompactSpace M] [Nonempty M] in
private theorem scalar_continuous (g : SmoothRiemannianMetric I M) :
    Continuous (metricScalarAt g) :=
  (metricScalar_smooth g).continuous

omit [BoundarylessManifold I M] [I.Boundaryless] [Nonempty M] in
private theorem integral_of_continuous (g : SmoothRiemannianMetric I M) (d : M → ℝ)
    (hd : Continuous d) : Integrable d (riemannianVolumeMeasure I M g) := by
  let : IsFiniteMeasureOnCompacts (riemannianVolumeMeasure I M g) :=
    riemannianVolumeMeasure_isFiniteMeasureOnCompacts g
  exact hd.integrable_of_hasCompactSupport (HasCompactSupport.of_compactSpace d)

omit [BoundarylessManifold I M] [I.Boundaryless] [CompactSpace M] [Nonempty M] in
private theorem full_continuous (g : SmoothRiemannianMetric I M) :
    Continuous (intrinsicCurvatureSq g) := by
  change Continuous (fun x => normSq0S g x 4 (metricRm04At g x))
  simpa only [metricRm04_apply] using normSq0S_cont g (metricRm04 g)

omit [BoundarylessManifold I M] [I.Boundaryless] [CompactSpace M] [Nonempty M] in
private theorem euler_continuous (g : SmoothRiemannianMetric I M) :
    Continuous (intrinsicEulerDensity g) := by
  have hRic : Continuous (fun x => normSq0S g x 2 (metricRicciAt g x)) := by
    simpa only [metricRicci_apply] using normSq0S_cont g (metricRicci g)
  exact (((full_continuous g).div_const 4).sub hRic).add (((scalar_continuous g).pow 2).div_const 4)

omit [I.Boundaryless] [Nonempty M] in
/-- In addition to the signed integrability in a measured metric, compactness
and intrinsic formulas give the remaining three integrability statements. -/
theorem bourClosedDensity_integrable (q : SignedCollarMetric o) (c : ModifiedChargeComponent) :
    Integrable (modifiedChargeDensity o q.metric q.frame c) (riemannianVolumeMeasure I M q.metric) := by
  cases c with
  | plus => exact q.integrable .plus
  | minus => exact q.integrable .minus
  | scalar => exact integral_of_continuous _ _ ((scalar_continuous q.metric).pow 2)
  | full =>
    apply (integral_of_continuous _ _ (full_continuous q.metric)).congr
    exact ae_of_all _ fun x => (intrinsicTerminalCharge_eq_modifiedChargeDensity q.metric o q.frame x).1
  | ricci =>
    apply (integral_of_continuous _ _
      (((full_continuous q.metric).div_const 4).sub (euler_continuous q.metric))).congr
    exact ae_of_all _ fun x => (intrinsicTerminalCharge_eq_modifiedChargeDensity q.metric o q.frame x).2.1

/-- Ordinary trace-free Ricci two-tensor square integrated over the source. -/
def bourRicci (q : SignedCollarMetric o) : ℝ := bourChargeOn o q.metric q.frame univ .ricci

/-- Scalar curvature square integrated over the source. -/
def bourScalar (q : SignedCollarMetric o) : ℝ := bourChargeOn o q.metric q.frame univ .scalar

/-- Hilbert–Schmidt curvature-operator square integrated over the source. -/
def bourFullCurvature (q : SignedCollarMetric o) : ℝ :=
  bourChargeOn o q.metric q.frame univ .full / 4

/-- The intrinsic Euler integral in the normalization of Bour §1.2. -/
def bourEuler (q : SignedCollarMetric o) : ℝ :=
  ∫ x, intrinsicEulerDensity q.metric x ∂riemannianVolumeMeasure I M q.metric

omit [I.Boundaryless] [Nonempty M] in
/-- The frame expression is exactly the intrinsic trace-free Ricci integral. -/
theorem bourRicci_eq_integral (q : SignedCollarMetric o) :
    bourRicci q = ∫ x, intrinsicTraceFreeRicciSq q.metric x ∂riemannianVolumeMeasure I M q.metric := by
  simp only [bourRicci, bourChargeOn, Measure.restrict_univ]
  apply integral_congr_ae
  exact ae_of_all _ fun x =>
    (intrinsicTerminalCharge_eq_modifiedChargeDensity q.metric o q.frame x).2.1.symm

omit [BoundarylessManifold I M] [I.Boundaryless] [Nonempty M] in
theorem bourScalar_eq_integral (q : SignedCollarMetric o) :
    bourScalar q = ∫ x, metricScalarAt q.metric x ^ 2 ∂riemannianVolumeMeasure I M q.metric := by
  simp only [bourScalar, bourChargeOn, Measure.restrict_univ, modifiedChargeDensity]

omit [I.Boundaryless] [Nonempty M] in
/-- The curvature-operator energy uses one quarter of the intrinsic ordered
curvature tensor square. -/
theorem bourFullCurvature_eq_integral (q : SignedCollarMetric o) :
    bourFullCurvature q =
      (∫ x, intrinsicCurvatureSq q.metric x ∂riemannianVolumeMeasure I M q.metric) / 4 := by
  simp only [bourFullCurvature, bourChargeOn, Measure.restrict_univ]
  congr 1
  apply integral_congr_ae
  exact ae_of_all _ fun x =>
    (intrinsicTerminalCharge_eq_modifiedChargeDensity q.metric o q.frame x).1.symm

/-- Bour's source functional from the measured Weyl and Ricci energies. -/
def bourEnergy (α : ℝ) (q : SignedCollarMetric o) : ℝ :=
  (1 - α) * (q.energy .plus + q.energy .minus) + α * bourRicci q / 2

omit [BoundarylessManifold I M] [I.Boundaryless] [Nonempty M] in
/-- The measured Ricci integral is nonnegative. -/
theorem bourRicci_nonneg (q : SignedCollarMetric o) : 0 ≤ bourRicci q := by
  exact integral_nonneg (modifiedChargeDensity_nonneg o q.metric q.frame .ricci)

omit [BoundarylessManifold I M] [I.Boundaryless] [Nonempty M] in
theorem bourClosed_charge_eq_energy (q : SignedCollarMetric o) :
    bourChargeOn o q.metric q.frame univ .plus = q.energy .plus ∧
    bourChargeOn o q.metric q.frame univ .minus = q.energy .minus := by
  constructor <;> simp [bourChargeOn, SignedCollarMetric.energy, chiralFrameEnergy,
    modifiedChargeDensity, signedCollarWeylBlock]

omit [I.Boundaryless] [Nonempty M] in
/-- Integrated pointwise Euler normalization. The topological value of
the intrinsic integral is a separate premise in its applications. -/
theorem bourEuler_eq_charges (q : SignedCollarMetric o) :
    bourEuler q = 2 * q.energy .plus + bourScalar q / 24 - bourRicci q / 2 := by
  let d := modifiedChargeDensity o q.metric q.frame
  let μ := riemannianVolumeMeasure I M q.metric
  have hp : Integrable (d .plus) μ := bourClosedDensity_integrable q .plus
  have hn : Integrable (d .minus) μ := bourClosedDensity_integrable q .minus
  have hs : Integrable (d .scalar) μ := bourClosedDensity_integrable q .scalar
  have hr : Integrable (d .ricci) μ := bourClosedDensity_integrable q .ricci
  calc
    _ = ∫ x, (d .plus x + d .minus x + d .scalar x / 24 - d .ricci x / 2)
        ∂riemannianVolumeMeasure I M q.metric :=
      integral_congr_ae (ae_of_all _ (intrinsicEulerDensity_eq_modifiedChargeDensity q.metric o q.frame))
    _ = (∫ x, d .plus x ∂μ) + (∫ x, d .minus x ∂μ) +
        (∫ x, d .scalar x ∂μ) / 24 - (∫ x, d .ricci x ∂μ) / 2 := by
      have hSum : Integrable (fun x => d .plus x + d .minus x) μ := hp.add hn
      have hScalar : Integrable (fun x => d .scalar x / 24) μ := hs.div_const 24
      have hRicci : Integrable (fun x => d .ricci x / 2) μ := hr.div_const 2
      have hSumScalar : Integrable (fun x => d .plus x + d .minus x + d .scalar x / 24) μ :=
        hSum.add hScalar
      rw [integral_sub hSumScalar hRicci, integral_add hSum hScalar, integral_add hp hn,
        integral_div, integral_div]
    _ = _ := by
      simp only [bourScalar, bourRicci, bourChargeOn, Measure.restrict_univ]
      have h : q.energy .plus = q.energy .minus := q.signature_zero
      change q.energy .plus + q.energy .minus + _ - _ = _
      rw [← h]
      ring

omit [BoundarylessManifold I M] [I.Boundaryless] [Nonempty M] in
/-- The signed energies agree by the supplied closed signature identity. -/
theorem bourEnergy_minus_eq_plus (q : SignedCollarMetric o) : q.energy .minus = q.energy .plus :=
  q.signature_zero.symm

omit [BoundarylessManifold I M] [I.Boundaryless] [Nonempty M] in
theorem bourEnergy_eq_chiral_ricci (α : ℝ) (q : SignedCollarMetric o) :
    bourEnergy α q = 2 * (1 - α) * q.energy .plus + α * bourRicci q / 2 := by
  unfold bourEnergy
  rw [bourEnergy_minus_eq_plus]
  ring

omit [I.Boundaryless] [Nonempty M] in
theorem bourEnergy_eq_chiral_scalar (α : ℝ) (q : SignedCollarMetric o) :
    bourEnergy α q = 2 * q.energy .plus + α * bourScalar q / 24 - α * bourEuler q := by
  rw [bourEnergy_eq_chiral_ricci, bourEuler_eq_charges]
  ring

omit [I.Boundaryless] [Nonempty M] in
theorem bourFullCurvature_eq_euler_add_ricci (q : SignedCollarMetric o) :
    bourFullCurvature q = bourEuler q + bourRicci q := by
  have h := bourChargeOn_full_eq o q.metric q.frame univ
    (fun c => (bourClosedDensity_integrable q c).integrableOn)
  rw [(bourClosed_charge_eq_energy q).1, (bourClosed_charge_eq_energy q).2,
    bourEnergy_minus_eq_plus] at h
  change bourFullCurvature q = _ + _ + bourRicci q / 2 + bourScalar q / 24 at h
  linarith only [h, bourEuler_eq_charges q]

omit [BoundarylessManifold I M] [I.Boundaryless] [Nonempty M] in
/-- A unit-volume metric with constant scalar curvature realizes the
square of that constant in the physical scalar integral. -/
theorem bourScalar_eq_sq_of_volume_one (q : SignedCollarMetric o) (y : ℝ)
    (hVolume : riemannianVolumeMeasure I M q.metric univ = 1)
    (hScalar : ∀ x, metricScalarAt q.metric x = y) :
    bourScalar q = y ^ 2 := by
  simp [bourScalar, bourChargeOn, modifiedChargeDensity, hScalar, hVolume, Measure.real_def]

/-- A supplied representative is a conformal metric on the same source.
Its normalization and conformal Weyl comparison are explicit inputs. -/
structure UnitYamabeRepresentative (q : SignedCollarMetric o) where
  rep : SignedCollarMetric o
  factor : C^∞⟮I, M; ℝ⟯
  conformal : rep.metric = conformalMetric q.metric factor
  volume_one : riemannianVolumeMeasure I M rep.metric univ = 1
  scalar : ∀ x, metricScalarAt rep.metric x = classYamabeFour o.dimension_eq q.metric
  energy_eq : rep.energy .plus = q.energy .plus

omit [BoundarylessManifold I M] in
theorem UnitYamabeRepresentative.scalar_square {q : SignedCollarMetric o}
    (r : UnitYamabeRepresentative q) :
    bourScalar r.rep = classYamabeFour o.dimension_eq q.metric ^ 2 :=
  bourScalar_eq_sq_of_volume_one r.rep _ r.volume_one r.scalar

omit [BoundarylessManifold I M] in
theorem bourEnergy_mem_geometricPositiveEnergies (q : SignedCollarMetric o)
    (h : 0 < classYamabeFour o.dimension_eq q.metric) :
    q.energy .plus ∈ geometricPositiveEnergies o :=
  ⟨q.metric, q.frame, h, q.integrable .plus, rfl⟩

omit [BoundarylessManifold I M] in
theorem bourInfimum_le_energy (q : SignedCollarMetric o)
    (h : 0 < classYamabeFour o.dimension_eq q.metric) :
    sInf (geometricPositiveEnergies o) ≤ q.energy .plus :=
  csInf_le (geometricPositiveEnergies_bddBelow o) (bourEnergy_mem_geometricPositiveEnergies q h)

omit [BoundarylessManifold I M] in
/-- On a positive class the constant Yamabe test and the integrated variance
bound give the sharp lower bound for the actual scalar square. -/
theorem bourYamabe_sq_le_scalar_of_conformal (q q' : SignedCollarMetric o)
    (u : C^∞⟮I, M; ℝ⟯) (hConf : q'.metric = conformalMetric q.metric u)
    (hY : 0 < classYamabeFour o.dimension_eq q.metric) :
    classYamabeFour o.dimension_eq q.metric ^ 2 ≤ bourScalar q' := by
  let μ := riemannianVolumeMeasure I M q'.metric
  let V := (μ univ).toReal
  let R := metricScalarAt q'.metric
  let T := ∫ x, R x ∂μ
  let Y := classYamabeFour o.dimension_eq q.metric
  let Q := fun u : C^∞⟮I, M; ℝ⟯ =>
    let gu := conformalMetric q.metric u
    let ν := riemannianVolumeMeasure I M gu
    (∫ x, metricScalarAt gu x ∂ν) / Real.sqrt (ν univ).toReal
  have hInf : Y = sInf (range Q) := rfl
  have hBounded : BddBelow (range Q) := by
    by_contra h
    exact (ne_of_gt hY) (hInf.trans (Real.sInf_of_not_bddBelow h))
  have hTest : Y ≤ T / Real.sqrt V := by
    rw [hInf]
    have hMem : T / Real.sqrt V ∈ range Q :=
      ⟨u, by simp only [Q, T, R, μ, V, hConf]⟩
    exact csInf_le hBounded hMem
  let : IsFiniteMeasureOnCompacts μ := riemannianVolumeMeasure_isFiniteMeasureOnCompacts q'.metric
  let : μ.IsOpenPosMeasure := riemannianVolumeMeasure_isOpenPosMeasure q'.metric
  have hV : 0 < V := ENNReal.toReal_pos
    (isOpen_univ.measure_pos μ univ_nonempty).ne' isCompact_univ.measure_lt_top.ne
  have hTestMul := (le_div_iff₀ (Real.sqrt_pos.2 hV)).1 hTest
  have hTestSq := (sq_le_sq₀ (mul_nonneg hY.le (Real.sqrt_nonneg _))
    ((mul_pos hY (Real.sqrt_pos.2 hV)).le.trans hTestMul)).2 hTestMul
  rw [mul_pow, Real.sq_sqrt hV.le] at hTestSq
  have hR : Integrable R μ := integral_of_continuous _ _ (scalar_continuous q'.metric)
  have hR2 : Integrable (fun x => R x ^ 2) μ :=
    integral_of_continuous _ _ ((scalar_continuous q'.metric).pow 2)
  have hV2R : Integrable (fun x => V ^ 2 * R x ^ 2) μ := hR2.const_mul _
  have hVTR : Integrable (fun x => (2 * V * T) * R x) μ := hR.const_mul _
  have hT2 : Integrable (fun _ : M => T ^ 2) μ :=
    integral_of_continuous _ _ continuous_const
  have hPoint (x : M) : (V * R x - T) ^ 2 =
      V ^ 2 * R x ^ 2 - (2 * V * T) * R x + T ^ 2 := by ring
  have hVariance : 0 ≤ V ^ 2 * bourScalar q' - (2 * V * T) * T + V * T ^ 2 := by
    have hPos : 0 ≤ ∫ x, (V * R x - T) ^ 2 ∂μ := integral_nonneg fun _ => sq_nonneg _
    simp_rw [hPoint] at hPos
    have hSub : Integrable (fun x => V ^ 2 * R x ^ 2 - (2 * V * T) * R x) μ := hV2R.sub hVTR
    rw [integral_add hSub hT2, integral_sub hV2R hVTR, integral_const_mul, integral_const_mul,
      integral_const] at hPos
    simp only [smul_eq_mul, Measure.real_def] at hPos
    change 0 ≤ V ^ 2 * (∫ x, R x ^ 2 ∂μ) - (2 * V * T) * T + V * T ^ 2 at hPos
    simpa only [bourScalar, bourChargeOn, Measure.restrict_univ, modifiedChargeDensity] using hPos
  have hCS : T ^ 2 ≤ bourScalar q' * V := by
    apply (mul_le_mul_iff_right₀ hV).1
    linarith only [hVariance]
  exact (mul_le_mul_iff_left₀ hV).1 (hTestSq.trans hCS)

omit [BoundarylessManifold I M] in
theorem bourYamabe_sq_le_scalar (q : SignedCollarMetric o)
    (hY : 0 < classYamabeFour o.dimension_eq q.metric) :
    classYamabeFour o.dimension_eq q.metric ^ 2 ≤ bourScalar q :=
  bourYamabe_sq_le_scalar_of_conformal q q 0 (conformalMetric_zero q.metric).symm hY

omit [BoundarylessManifold I M] in
/-- A supplied normalized Yamabe representative minimizes Bour's functional
within its positive class when the conformal Weyl comparison is supplied. -/
theorem bourEnergy_conformal_minimum {q : SignedCollarMetric o}
    (r : UnitYamabeRepresentative q) (q' : SignedCollarMetric o) (α : ℝ) (hα : 0 ≤ α)
    (hY : 0 < classYamabeFour o.dimension_eq q.metric)
    (u : C^∞⟮I, M; ℝ⟯) (hConf : q'.metric = conformalMetric q.metric u)
    (hWeyl : q'.energy .plus = q.energy .plus)
    (hEuler : ∀ p : SignedCollarMetric o, bourEuler p = 16 * Real.pi ^ 2) :
    bourEnergy α r.rep =
      2 * q.energy .plus + α * classYamabeFour o.dimension_eq q.metric ^ 2 / 24 -
        16 * α * Real.pi ^ 2 ∧
      bourEnergy α r.rep ≤ bourEnergy α q' := by
  have hVal : bourEnergy α r.rep =
      2 * q.energy .plus + α * classYamabeFour o.dimension_eq q.metric ^ 2 / 24 -
        16 * α * Real.pi ^ 2 := by
    rw [bourEnergy_eq_chiral_scalar, r.energy_eq, r.scalar_square, hEuler]
    ring
  refine ⟨hVal, ?_⟩
  have hScalar := bourYamabe_sq_le_scalar_of_conformal q q' u hConf hY
  have hScaled := mul_le_mul_of_nonneg_left hScalar hα
  rw [hVal, bourEnergy_eq_chiral_scalar, hWeyl, hEuler]
  linarith only [hScaled]

section Trajectory

variable {P : Type*} [TopologicalSpace P]

/-- Measured data from a parameter-fixed original flow on its supplied time
carrier. Signature is included for each metric. This contract takes the
sublevel and the spectral sign comparison from analysis. -/
structure OriginalTrajectory (o : ManifoldOrientation I M 4) (α : ℝ) (start : P) where
  slice : P → SignedCollarMetric o
  yamabeRepresentative : ∀ t, UnitYamabeRepresentative (slice t)
  start_volume : riemannianVolumeMeasure I M (slice start).metric univ = 1
  start_scalar : ∀ x, metricScalarAt (slice start).metric x =
    classYamabeFour o.dimension_eq (slice start).metric
  start_positive : 0 < classYamabeFour o.dimension_eq (slice start).metric
  start_round : classYamabeFour o.dimension_eq (slice start).metric ≤ roundYamabeConstant
  level : P → ℝ
  level_continuous : Continuous level
  sign_positive : ∀ t, 0 < level t ↔ 0 < classYamabeFour o.dimension_eq (slice t).metric
  sign_zero : ∀ t, level t = 0 → classYamabeFour o.dimension_eq (slice t).metric = 0
  sublevel : ∀ t, bourEnergy α (slice t) ≤ bourEnergy α (slice start)

variable {α : ℝ} {start : P} (f : OriginalTrajectory o α start)

abbrev OriginalTrajectory.yamabe (t : P) : ℝ := classYamabeFour o.dimension_eq (f.slice t).metric

abbrev OriginalTrajectory.energy (t : P) : ℝ := (f.slice t).energy .plus

def OriginalTrajectory.excess : ℝ := f.energy start - sInf (geometricPositiveEnergies o)

def bourInitialMargin : ℝ := (1 - α) * (16 * Real.pi ^ 2) - bourEnergy α (f.slice start)

omit [BoundarylessManifold I M] in
theorem OriginalTrajectory.start_scalar_square :
    bourScalar (f.slice start) = f.yamabe start ^ 2 :=
  bourScalar_eq_sq_of_volume_one _ _ f.start_volume f.start_scalar

omit [BoundarylessManifold I M] in
theorem OriginalTrajectory.start_yamabe_sq_le : f.yamabe start ^ 2 ≤ 384 * Real.pi ^ 2 := by
  rw [← roundYamabeConstant_sq]
  exact (sq_le_sq₀ f.start_positive.le roundYamabeConstant_pos.le).mpr f.start_round

theorem bourInitialMargin_eq
    (hEuler : bourEuler (f.slice start) = 16 * Real.pi ^ 2) :
    bourInitialMargin f = 2 * (8 * Real.pi ^ 2 - f.energy start) - α * f.yamabe start ^ 2 / 24 := by
  unfold bourInitialMargin
  rw [bourEnergy_eq_chiral_scalar, hEuler, f.start_scalar_square]
  ring

theorem bourInitialMargin_pos_iff
    (hEuler : bourEuler (f.slice start) = 16 * Real.pi ^ 2) :
    0 < bourInitialMargin f ↔ α * f.yamabe start ^ 2 < 48 * (8 * Real.pi ^ 2 - f.energy start) := by
  rw [bourInitialMargin_eq f hEuler]
  constructor <;> intro h <;> linarith only [h]

theorem bourInitialMargin_pos_of_parameter (hα : 0 < α)
    (hEuler : bourEuler (f.slice start) = 16 * Real.pi ^ 2)
    (hSmall : α < 1 - f.energy start / (8 * Real.pi ^ 2)) :
    0 < bourInitialMargin f := by
  have hWall : 0 < 8 * Real.pi ^ 2 := mul_pos (by norm_num) (pow_pos Real.pi_pos 2)
  have hGap : α * (8 * Real.pi ^ 2) < 8 * Real.pi ^ 2 - f.energy start := by
    have h := (div_lt_iff₀ hWall).mp
      (show f.energy start / (8 * Real.pi ^ 2) < 1 - α by linarith only [hSmall])
    linarith only [h]
  apply (bourInitialMargin_pos_iff f hEuler).2
  have hRound := mul_le_mul_of_nonneg_left f.start_yamabe_sq_le hα.le
  linarith only [hGap, hRound]

/-- The connected-time argument excludes the first zero of the spectral
detector and gives the stronger floor with the factor `1 - α`. -/
theorem bourStrictSublevel_yamabeFloor [PreconnectedSpace P] (hα : 0 < α) (hα1 : α < 1)
    (hEuler : ∀ q : SignedCollarMetric o, bourEuler q = 16 * Real.pi ^ 2)
    (hPinched : 0 < bourInitialMargin f) (t : P) :
    f.energy t ≤ 8 * Real.pi ^ 2 - bourInitialMargin f / (2 * (1 - α)) ∧
      0 < f.yamabe t ∧ Real.sqrt (24 * bourInitialMargin f / (1 - α)) ≤ f.yamabe t ∧
      f.energy t ∈ geometricPositiveEnergies o := by
  let gap := bourInitialMargin f / (2 * (1 - α))
  have hDenom : 0 < 2 * (1 - α) := mul_pos (by norm_num) (sub_pos.mpr hα1)
  have hGap : 0 < gap := div_pos hPinched hDenom
  have hBand (s : P) : f.energy s ≤ 8 * Real.pi ^ 2 - gap := by
    have hLow : (2 * (1 - α)) * f.energy s ≤ bourEnergy α (f.slice s) := by
      rw [bourEnergy_eq_chiral_ricci]
      exact le_add_of_nonneg_right (div_nonneg (mul_nonneg hα.le (bourRicci_nonneg _)) (by norm_num))
    have h := hLow.trans (f.sublevel s)
    have hEq : (8 * Real.pi ^ 2 - gap) * (2 * (1 - α)) = bourEnergy α (f.slice start) := by
      dsimp [gap]
      rw [sub_mul, div_mul_cancel₀ _ hDenom.ne']
      unfold bourInitialMargin
      ring
    apply (mul_le_mul_iff_left₀ hDenom).mp
    rw [hEq, mul_comm]
    exact h
  have hYamEuler (s : P) : 48 * (8 * Real.pi ^ 2 - f.energy s) ≤ f.yamabe s ^ 2 := by
    let r := f.yamabeRepresentative s
    have h := bourEuler_eq_charges r.rep
    rw [hEuler, r.scalar_square, r.energy_eq] at h
    exact (show _ ≤ _ by linarith only [h, bourRicci_nonneg r.rep])
  have hResult := admissibleAlongSubcriticalMetricPath o (fun s => (f.slice s).metric)
    (fun s => (f.slice s).frame) f.level start gap hGap f.level_continuous
    ((f.sign_positive start).2 f.start_positive) f.sign_positive f.sign_zero
    (fun s => (f.slice s).integrable .plus) hYamEuler hBand t
  have hCoeff : 48 * gap = 24 * bourInitialMargin f / (1 - α) := by
    dsimp [gap]
    field_simp [(sub_pos.mpr hα1).ne']
    ring
  rw [← hCoeff]
  exact ⟨hBand t, hResult⟩

/-- All bounds refer to one time on the original supplied trajectory. -/
structure TimeBudget (t : P) : Prop where
  yamabe_positive : 0 < f.yamabe t
  yamabe_floor : Real.sqrt (24 * bourInitialMargin f / (1 - α)) ≤ f.yamabe t
  plus_infimum : sInf (geometricPositiveEnergies o) ≤ f.energy t
  minus_eq_plus : (f.slice t).energy .minus = f.energy t
  plus_upper : f.energy t ≤ f.energy start / (1 - α)
  scalar : bourScalar (f.slice t) ≤ f.yamabe start ^ 2 + 48 * f.excess / α
  ricci_sharp : bourRicci (f.slice t) ≤ 4 * sInf (geometricPositiveEnergies o) +
    4 * f.excess / α + (f.yamabe start ^ 2 - 384 * Real.pi ^ 2) / 12
  ricci : bourRicci (f.slice t) ≤ 4 * sInf (geometricPositiveEnergies o) + 4 * f.excess / α
  full_eq : bourFullCurvature (f.slice t) = 16 * Real.pi ^ 2 + bourRicci (f.slice t)
  energy_drop : bourEnergy α (f.slice start) - bourEnergy α (f.slice t) ≤
    2 * f.excess + 2 * α * sInf (geometricPositiveEnergies o)

omit [BoundarylessManifold I M] in
theorem TimeBudget.yamabe_sq_le_scalar {f : OriginalTrajectory o α start} {t : P}
    (h : TimeBudget f t) :
    f.yamabe t ^ 2 ≤ bourScalar (f.slice t) :=
  bourYamabe_sq_le_scalar _ h.yamabe_positive

/-- The sublevel in both equivalent expressions gives the original-time
scalar and Ricci estimates, including the initial scalar deficit. -/
theorem bourOriginalFlow_budget [PreconnectedSpace P] (hα : 0 < α) (hα1 : α < 1)
    (hEuler : ∀ q : SignedCollarMetric o, bourEuler q = 16 * Real.pi ^ 2)
    (hPinched : 0 < bourInitialMargin f) (t : P) : TimeBudget f t := by
  obtain ⟨_, hPos, hFloor, hMem⟩ := bourStrictSublevel_yamabeFloor f hα hα1 hEuler hPinched t
  let infM := sInf (geometricPositiveEnergies o)
  have hInf : infM ≤ f.energy t := csInf_le (geometricPositiveEnergies_bddBelow o) hMem
  have hEt : bourEuler (f.slice t) = 16 * Real.pi ^ 2 := hEuler _
  have hE₀ : bourEuler (f.slice start) = 16 * Real.pi ^ 2 := hEuler _
  have hRic : 0 ≤ bourRicci (f.slice t) := bourRicci_nonneg _
  have hRound := f.start_yamabe_sq_le
  have hStartS := f.start_scalar_square
  have hStartUpper : bourEnergy α (f.slice start) ≤ 2 * f.energy start := by
    rw [bourEnergy_eq_chiral_scalar, hE₀, hStartS]
    have hScaled := mul_le_mul_of_nonneg_left hRound hα.le
    linarith only [hScaled]
  have hUpper : f.energy t ≤ f.energy start / (1 - α) := by
    have hBound := (f.sublevel t).trans hStartUpper
    rw [bourEnergy_eq_chiral_ricci] at hBound
    apply (le_div_iff₀ (sub_pos.mpr hα1)).2
    have hScaled := mul_nonneg hα.le hRic
    linarith only [hBound, hScaled]
  have hScalar : bourScalar (f.slice t) ≤ f.yamabe start ^ 2 + 48 * f.excess / α := by
    have hBound := f.sublevel t
    rw [bourEnergy_eq_chiral_scalar, bourEnergy_eq_chiral_scalar, hEt, hE₀, hStartS] at hBound
    have hScaled : (bourScalar (f.slice t) - f.yamabe start ^ 2) * α ≤ 48 * f.excess := by
      dsimp only [OriginalTrajectory.excess, infM] at hInf ⊢
      linarith only [hBound, hInf]
    have hDiv := (le_div_iff₀ hα).2 hScaled
    linarith only [hDiv]
  have hSharpRicci : bourRicci (f.slice t) ≤
      4 * infM + 4 * f.excess / α + (f.yamabe start ^ 2 - 384 * Real.pi ^ 2) / 12 := by
    have hBound := f.sublevel t
    rw [bourEnergy_eq_chiral_ricci, bourEnergy_eq_chiral_ricci] at hBound
    have hInitD := bourEuler_eq_charges (f.slice start)
    rw [hE₀, hStartS] at hInitD
    have hScaled := mul_le_mul_of_nonneg_left hInf (sub_pos.mpr hα1).le
    have hMul : α * bourRicci (f.slice start) =
        α * (4 * f.energy start + (f.yamabe start ^ 2 - 384 * Real.pi ^ 2) / 12) := by
      congr 1
      linarith only [hInitD]
    have hCost : (bourRicci (f.slice t) -
        (4 * infM + (f.yamabe start ^ 2 - 384 * Real.pi ^ 2) / 12)) * α ≤ 4 * f.excess := by
      dsimp only [OriginalTrajectory.excess, infM] at hScaled ⊢
      linarith only [hBound, hMul, hScaled]
    have hDiv := (le_div_iff₀ hα).2 hCost
    linarith only [hDiv]
  have hDrop : bourEnergy α (f.slice start) - bourEnergy α (f.slice t) ≤
      2 * f.excess + 2 * α * infM := by
    have hScaled := mul_le_mul_of_nonneg_left hInf (sub_pos.mpr hα1).le
    have hRicScaled := mul_nonneg hα.le hRic
    rw [bourEnergy_eq_chiral_ricci α (f.slice t)]
    dsimp only [OriginalTrajectory.excess, infM] at hScaled ⊢
    linarith only [hStartUpper, hScaled, hRicScaled]
  refine ⟨hPos, hFloor, hInf, bourEnergy_minus_eq_plus _, hUpper, hScalar, hSharpRicci,
    ?_, ?_, hDrop⟩
  · linarith only [hSharpRicci, hRound]
  · rw [bourFullCurvature_eq_euler_add_ricci, hEt]

omit [BoundarylessManifold I M] in
/-- The sharp scalar deficit survives when the start already attains
the positive infimum. -/
theorem TimeBudget.exactStart {f : OriginalTrajectory o α start} {t : P}
    (h : TimeBudget f t) (hExact : f.excess = 0) :
    bourScalar (f.slice t) ≤ f.yamabe start ^ 2 ∧
      bourRicci (f.slice t) ≤ 4 * sInf (geometricPositiveEnergies o) +
        (f.yamabe start ^ 2 - 384 * Real.pi ^ 2) / 12 := by
  simpa only [hExact, mul_zero, zero_div, add_zero] using And.intro h.scalar h.ricci_sharp

end Trajectory

section Sequence

variable {P : ℕ → Type*} [∀ j, TopologicalSpace (P j)] [∀ j, PreconnectedSpace (P j)]
  {α : ℕ → ℝ} {start : ∀ j, P j} (f : ∀ j, OriginalTrajectory o (α j) (start j))

/-- The index cutoff is independent of time, even when each original
trajectory has a different carrier. The common chiral gap is `δ/2`, the
common Yamabe floor is `√(24δ)`, and the common Ricci margin is `2δ`. -/
theorem eventually_bourOriginalFlow_budget
    (hα : ∀ j, 0 < α j ∧ α j < 1) (hαlim : Tendsto α atTop (𝓝 0))
    (hEuler : ∀ q : SignedCollarMetric o, bourEuler q = 16 * Real.pi ^ 2)
    (hEntry : sInf (geometricPositiveEnergies o) < 8 * Real.pi ^ 2)
    (hExcess : ∀ j, (f j).excess ≤ (α j) ^ 2) :
    let infM := sInf (geometricPositiveEnergies o)
    let δ := 8 * Real.pi ^ 2 - infM
    (∃ j₀, ∀ j ≥ j₀,
      δ ≤ bourInitialMargin (f j) ∧
      (f j).energy (start j) / (1 - α j) ≤ 8 * Real.pi ^ 2 - δ / 2 ∧
      ∀ t, TimeBudget (f j) t ∧ Real.sqrt (24 * δ) ≤ (f j).yamabe t ∧
        (∀ s, infM ≤ ((f j).slice t).energy s ∧
          ((f j).slice t).energy s ≤ 8 * Real.pi ^ 2 - δ / 2) ∧
        bourScalar ((f j).slice t) ≤ (f j).yamabe (start j) ^ 2 + 48 * α j ∧
        bourRicci ((f j).slice t) ≤ 4 * infM + 4 * α j ∧
        4 * infM + 4 * α j ≤ 32 * Real.pi ^ 2 - 2 * δ ∧
        32 * Real.pi ^ 2 - 2 * δ < 32 * Real.pi ^ 2 ∧
        bourFullCurvature ((f j).slice t) ≤ 48 * Real.pi ^ 2 - 2 * δ) ∧
    (∀ ε > 0, ∃ j₁, ∀ j ≥ j₁, ∀ t s, |((f j).slice t).energy s - infM| < ε) := by
  intro infM δ
  have hδ : 0 < δ := sub_pos.mpr hEntry
  have hExcessNonneg (j : ℕ) : 0 ≤ (f j).excess :=
    sub_nonneg.mpr (bourInfimum_le_energy _ (f j).start_positive)
  have hConst (c : ℝ) : Tendsto (fun _ : ℕ => c) atTop (𝓝 c) := tendsto_const_nhds
  have hPow : Tendsto (fun j => (α j) ^ 2) atTop (𝓝 0) := by
    simpa only [zero_pow (by decide : 2 ≠ 0)] using hαlim.pow 2
  have hStartLim : Tendsto (fun j => (f j).energy (start j)) atTop (𝓝 infM) := by
    have hUpper : Tendsto (fun j => infM + (α j) ^ 2) atTop (𝓝 infM) := by
      simpa only [add_zero] using (hConst infM).add hPow
    apply (hConst infM).squeeze hUpper
    · intro j
      exact sub_nonneg.mp (hExcessNonneg j)
    · intro j
      have h := hExcess j
      dsimp only [OriginalTrajectory.excess] at h
      change (f j).energy (start j) ≤ infM + (α j) ^ 2
      linarith only [h]
  have hQuotient : Tendsto (fun j => (f j).energy (start j) / (1 - α j)) atTop (𝓝 infM) := by
    change Tendsto ((fun j => (f j).energy (start j)) / fun j => 1 - α j) atTop (𝓝 infM)
    simpa only [sub_zero, div_one] using
      hStartLim.div ((hConst 1).sub hαlim) (by norm_num : (1 : ℝ) - 0 ≠ 0)
  have hMarginLim : Tendsto (fun j => 2 * δ - 2 * (α j) ^ 2 - 16 * Real.pi ^ 2 * α j)
      atTop (𝓝 (2 * δ)) := by
    simpa only [mul_zero, sub_zero] using
      (((hConst (2 * δ)).sub ((hConst 2).mul hPow)).sub ((hConst (16 * Real.pi ^ 2)).mul hαlim))
  have hStartEventually :=
    (tendsto_order.1 hQuotient).2 (8 * Real.pi ^ 2 - δ / 2) (by dsimp [δ]; linarith only [hδ])
  have hMarginEventually := (tendsto_order.1 hMarginLim).1 δ (by linarith only [hδ])
  have hαEventually := (tendsto_order.1 hαlim).2 (δ / 2) (half_pos hδ)
  have hEventually : ∀ᶠ j in atTop, δ ≤ bourInitialMargin (f j) ∧
      (f j).energy (start j) / (1 - α j) ≤ 8 * Real.pi ^ 2 - δ / 2 ∧ α j ≤ δ / 2 := by
    filter_upwards [hMarginEventually, hStartEventually, hαEventually] with j hm hu ha
    refine ⟨?_, hu.le, ha.le⟩
    rw [bourInitialMargin_eq (f j) (hEuler _)]
    have hs := mul_le_mul_of_nonneg_left (f j).start_yamabe_sq_le (hα j).1.le
    have he := hExcess j
    dsimp only [OriginalTrajectory.excess] at he
    dsimp only [δ, infM] at hm ⊢
    linarith only [hm, hs, he]
  obtain ⟨j₀, hj₀⟩ := eventually_atTop.mp hEventually
  have hTime (j : ℕ) (hj : j₀ ≤ j) (t : P j) : TimeBudget (f j) t :=
    bourOriginalFlow_budget (f j) (hα j).1 (hα j).2 hEuler (hδ.trans_le (hj₀ j hj).1) t
  have hSigned (j : ℕ) (hj : j₀ ≤ j) (t : P j) (s : CollarChirality) :
      infM ≤ ((f j).slice t).energy s ∧
        ((f j).slice t).energy s ≤ (f j).energy (start j) / (1 - α j) := by
    have h := hTime j hj t
    cases s with
    | plus => exact ⟨h.plus_infimum, h.plus_upper⟩
    | minus => rw [h.minus_eq_plus]; exact ⟨h.plus_infimum, h.plus_upper⟩
  constructor
  · refine ⟨j₀, fun j hj => ?_⟩
    obtain ⟨hMargin, hStart, hαSmall⟩ := hj₀ j hj
    refine ⟨hMargin, hStart, fun t => ?_⟩
    have ht := hTime j hj t
    have hParameter := hα j
    have hDiv : (f j).excess / α j ≤ α j :=
      (div_le_iff₀ hParameter.1).2 (by simpa only [pow_two] using hExcess j)
    have hRicciMargin : 4 * infM + 4 * α j ≤ 32 * Real.pi ^ 2 - 2 * δ := by
      dsimp only [δ] at hαSmall ⊢
      linarith only [hαSmall]
    have hRicci : bourRicci ((f j).slice t) ≤ 4 * infM + 4 * α j := by
      have h := ht.ricci
      rw [mul_div_assoc] at h
      linarith only [h, hDiv]
    refine ⟨ht, ?_, fun s => ⟨(hSigned j hj t s).1, (hSigned j hj t s).2.trans hStart⟩, ?_,
      hRicci, hRicciMargin, by linarith only [hδ], ?_⟩
    · apply le_trans (Real.sqrt_le_sqrt ?_) ht.yamabe_floor
      apply (le_div_iff₀ (sub_pos.mpr hParameter.2)).2
      have hPos := mul_nonneg hδ.le hParameter.1.le
      linarith only [hMargin, hPos]
    · have h := ht.scalar
      rw [mul_div_assoc] at h
      linarith only [h, hDiv]
    · linarith only [ht.full_eq, hRicci, hRicciMargin]
  · intro ε hε
    obtain ⟨n, hn⟩ := eventually_atTop.mp ((tendsto_order.1 hQuotient).2 (infM + ε)
      (lt_add_of_pos_right _ hε))
    refine ⟨max n j₀, fun j hj t s => ?_⟩
    obtain ⟨hLower, hUpper⟩ := hSigned j ((le_max_right n j₀).trans hj) t s
    rw [abs_of_nonneg (sub_nonneg.mpr hLower)]
    have hq := hn j ((le_max_left n j₀).trans hj)
    linarith only [hUpper, hq]

end Sequence
end Closed

section Round

private local instance : Fact (Module.finrank ℝ (EuclideanSpace ℝ (Fin 5)) = 4 + 1) := ⟨by simp⟩
private local instance : MeasurableSpace StandardFourSphere := borel StandardFourSphere
private local instance : BorelSpace StandardFourSphere := ⟨rfl⟩

private theorem measure_cast_apply {X : Type*} {m n : MeasurableSpace X}
    (h : m = n) (μ : @Measure X m) (A : Set X) :
    (cast (congrArg (fun k => @Measure X k) h) μ) A = μ A := by
  cases h
  rfl

private theorem standardRoundFour_volume :
    riemannianVolumeMeasure (𝓡 4) StandardFourSphere standardRoundFourMetric univ =
      ENNReal.ofReal (8 * Real.pi ^ 2 / 3) := by
  have h := gaussRoundArea_univ
  unfold gaussRoundArea at h
  rw [measure_cast_apply] at h
  · exact h
  · exact BorelSpace.measurable_eq.symm

/-- Direct normalization check on the actual unit round sphere, using its
curvature slots and its ordinary Riemannian volume. -/
theorem bourStandardRound_charge_values
    (o : ManifoldOrientation (𝓡 4) StandardFourSphere 4)
    (f : ∀ x, OrientedOrthonormalFrameAt standardRoundFourMetric o x) :
    let q := bourChargeOn o standardRoundFourMetric f univ
    q .plus = 0 ∧ q .minus = 0 ∧ q .ricci = 0 ∧
      q .scalar = 384 * Real.pi ^ 2 ∧ q .full / 4 = 16 * Real.pi ^ 2 := by
  intro q
  let d := modifiedChargeDensity o standardRoundFourMetric f
  have hGauss : principalGaussTensor (fun _ => 1) = constantSectionalFrameTensor 1 := by
    funext a b c d
    change _ = 1 * ((if a = c then (1 : ℝ) else 0) * (if b = d then 1 else 0) -
      (if a = d then 1 else 0) * (if b = c then 1 else 0))
    exact (one_mul _).symm
  have hp (x : StandardFourSphere) : d .plus x = 0 := by
    change hilbertSchmidtSq (geometricChiralBlock standardRoundFourMetric o x (f x)) = 0
    simp [standardRoundFour_chiralBlock_eq_zero, hilbertSchmidtSq]
  have hn (x : StandardFourSphere) : d .minus x = 0 := by
    change hilbertSchmidtSq (traceFreeChiralBlock (antiSelfDualCurvatureBlock
      (metricCurvatureFrameTensor standardRoundFourMetric o x (f x)))) = 0
    rw [standardRoundFour_curvatureFrameTensor, ← hGauss, principalGauss_chiralBlocks_eq, hGauss,
      traceFreeSelfDualBlock_constantSectional]
    simp [hilbertSchmidtSq]
  have hR (x : StandardFourSphere) : metricScalarAt standardRoundFourMetric x = 12 := by
    rw [← frameScalarCurvature_metric standardRoundFourMetric o x (f x),
      standardRoundFour_curvatureFrameTensor, ← hGauss]
    norm_num [frameScalarCurvature, frameRicciTensor, principalGaussTensor, Fin.sum_univ_four]
  have hr (x : StandardFourSphere) : d .ricci x = 0 := by
    change endpointRicciDefectDensity standardRoundFourMetric o x (f x) = 0
    rw [endpointRicciDefectDensity, standardRoundFour_curvatureFrameTensor, ← hGauss, hR]
    norm_num [frameRicciTensor, principalGaussTensor, Fin.sum_univ_four]
  have hs (x : StandardFourSphere) : d .scalar x = 144 := by
    change metricScalarAt standardRoundFourMetric x ^ 2 = _
    rw [hR]
    norm_num
  have hf (x : StandardFourSphere) : d .full x = 24 := by
    have h := metricFrameTensorNormSq_eq_chiral_ricci_scalar standardRoundFourMetric o x (f x)
    change d .full x = 4 * (d .plus x + d .minus x) + 2 * d .ricci x + d .scalar x / 6 at h
    rw [h, hp, hn, hr, hs]
    norm_num
  have hVolume : (riemannianVolumeMeasure (𝓡 4) StandardFourSphere standardRoundFourMetric
      univ).toReal = 8 * Real.pi ^ 2 / 3 := by
    rw [standardRoundFour_volume, ENNReal.toReal_ofReal (by positivity)]
  let μ := riemannianVolumeMeasure (𝓡 4) StandardFourSphere standardRoundFourMetric
  have hCharge (c : ModifiedChargeComponent) : q c = ∫ x, d c x ∂μ := by
    simp only [q, bourChargeOn, Measure.restrict_univ, d, μ]
  rw [hCharge, hCharge, hCharge, hCharge, hCharge]
  simp only [hp, hn, hr, hs, hf, integral_zero, integral_const, smul_eq_mul,
    Measure.real_def, show (μ univ).toReal = _ from hVolume, true_and]
  constructor <;> ring

end Round

end SmoothPoincare.Bour
