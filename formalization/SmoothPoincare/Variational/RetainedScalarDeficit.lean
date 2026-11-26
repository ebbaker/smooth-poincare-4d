import FirstOrderTwistor.SpinTwistedSquare
import SmoothPoincare.Variational.PositiveScalarYamabeFour
import SmoothPoincare.Variational.MatchedCurvedDisk
import Mathlib.MeasureTheory.Function.LpSpace.Indicator

/-! # The scalar deficit on a retained positive region -/

noncomputable section
open DifferentialGeometry DifferentialGeometry.Geometry.Curvature
open DifferentialGeometry.Integral.Measure FirstOrderTwistor SectionsAndConnections
open MeasureTheory Set Manifold
open scoped ContDiff Manifold Topology

namespace SmoothPoincare

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M] [CompactSpace M]

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

/-- The square of the physical (L^2) norm of the negative scalar part. -/
def scalarDeficitSq (g : SmoothRiemannianMetric I M) : ℝ :=
  ∫ x, (max (-metricScalarAt g x) 0) ^ 2 ∂riemannianVolumeMeasure I M g

/-- The physical (L^2) norm of the negative scalar part. -/
def scalarDeficitNorm (g : SmoothRiemannianMetric I M) : ℝ :=
  Real.sqrt (scalarDeficitSq g)

theorem scalarDeficitSq_nonneg (g : SmoothRiemannianMetric I M) : 0 ≤ scalarDeficitSq g :=
  integral_nonneg fun _ => sq_nonneg _

theorem scalarDeficitNorm_sq (g : SmoothRiemannianMetric I M) :
    scalarDeficitNorm g ^ 2 = scalarDeficitSq g :=
  Real.sq_sqrt (scalarDeficitSq_nonneg g)

variable [I.Boundaryless]

omit [CompactSpace M] in
private theorem continuous_metricScalar (g : SmoothRiemannianMetric I M) :
    Continuous (metricScalarAt g) :=
  (scalarCurv_contMDiff g).continuous.congr fun x => (metricScalar_eq_scal g x).symm

omit [I.Boundaryless] in
/-- The (L^2) bound for a nonnegative continuous scalar weight paired
with the square of a smooth conformal factor in physical volume. -/
theorem integral_mul_capFactorSq_le_l2 (g : SmoothRiemannianMetric I M)
    (v : M → ℝ) (hv : Continuous v) (hvNonneg : ∀ x, 0 ≤ v x)
    (f : C^∞⟮I, M; ℝ⟯) :
    (∫ x, v x * f x ^ 2 ∂riemannianVolumeMeasure I M g) ≤
      Real.sqrt (∫ x, v x ^ 2 ∂riemannianVolumeMeasure I M g) *
        Real.sqrt (capFactorVolume g f) := by
  let μ := riemannianVolumeMeasure I M g
  let : IsFiniteMeasureOnCompacts μ := riemannianVolumeMeasure_isFiniteMeasureOnCompacts g
  let w := fun x => f x ^ 2
  have hw : Continuous w := f.contMDiff.continuous.pow 2
  have hHolder := integral_mul_le_Lp_mul_Lq_of_nonneg
    (μ := μ) (p := 2) (q := 2) (f := v) (g := w)
    (Real.holderConjugate_iff.mpr (by norm_num))
    (Filter.Eventually.of_forall hvNonneg)
    (Filter.Eventually.of_forall fun _ => sq_nonneg _)
    (hv.memLp_of_hasCompactSupport (HasCompactSupport.of_compactSpace _))
    (hw.memLp_of_hasCompactSupport (HasCompactSupport.of_compactSpace _))
  have hTwo (a : ℝ) : a ^ (2 : ℝ) = a ^ (2 : ℕ) := Real.rpow_natCast a 2
  have hFour (a : ℝ) : (a ^ (2 : ℕ)) ^ (2 : ℕ) = a ^ (4 : ℕ) := by rw [← pow_mul]
  simpa only [hTwo, Real.sqrt_eq_rpow, capFactorVolume, w, μ, hFour] using hHolder

/-- Hölder bounds the negative scalar term while retaining the entire
nonnegative scalar contribution of the same smooth test. -/
theorem capFactorScalar_add_scalarDeficitNorm (hd : Module.finrank ℝ E = 4)
    (g : SmoothRiemannianMetric I M) (f : C^∞⟮I, M; ℝ⟯) :
    (∫ x, max (metricScalarAt g x) 0 * f x ^ 2 ∂riemannianVolumeMeasure I M g) ≤
      capFactorScalar g f + scalarDeficitNorm g * Real.sqrt (capFactorVolume g f) := by
  let μ := riemannianVolumeMeasure I M g
  let : IsFiniteMeasureOnCompacts μ := riemannianVolumeMeasure_isFiniteMeasureOnCompacts g
  let u := fun x => max (metricScalarAt g x) 0
  let v := fun x => max (-metricScalarAt g x) 0
  let w := fun x => f x ^ 2
  have hu : Continuous u := (continuous_metricScalar g).max continuous_const
  have hv : Continuous v := (continuous_metricScalar g).neg.max continuous_const
  have hw : Continuous w := f.contMDiff.continuous.pow 2
  have hNeg : (∫ x, v x * w x ∂μ) ≤
      scalarDeficitNorm g * Real.sqrt (capFactorVolume g f) :=
    integral_mul_capFactorSq_le_l2 g v hv (fun _ => le_max_right _ _) f
  have hIntPos : Integrable (fun x => u x * w x) μ :=
    (hu.mul hw).integrable_of_hasCompactSupport
    (HasCompactSupport.of_compactSpace _)
  have hIntNeg : Integrable (fun x => v x * w x) μ :=
    (hv.mul hw).integrable_of_hasCompactSupport
    (HasCompactSupport.of_compactSpace _)
  have hSplit :
      (∫ x, scalarCurv g x * f x ^ 2 ∂μ) =
        (∫ x, u x * w x ∂μ) - (∫ x, v x * w x ∂μ) := by
    rw [← integral_sub hIntPos hIntNeg]
    apply integral_congr_ae
    exact Filter.Eventually.of_forall fun x => by
      change scalarCurv g x * f x ^ 2 = u x * w x - v x * w x
      rw [← metricScalar_eq_scal]
      simp only [u, v, w, ← sub_mul]
      congr 1
      rcases le_total 0 (metricScalarAt g x) with hx | hx
      · rw [max_eq_left hx, max_eq_right (neg_nonpos.mpr hx), sub_zero]
      · rw [max_eq_right hx, max_eq_left (neg_nonneg.mpr hx), zero_sub, neg_neg]
  have hGrad : 0 ≤ ∫ x, DifferentialGeometry.Geometry.Operator.normGradSqFun g f x ∂μ :=
    integral_nonneg fun x => DifferentialGeometry.Geometry.Operator.normGradSqFun_nonneg g f x
  rw [capFactorScalar_eq_dirichletForm hd, hSplit]
  linarith only [hNeg, hGrad]

variable [Nonempty M]

omit [I.Boundaryless] in
private theorem scalarDeficit_logVolume_pos (g : SmoothRiemannianMetric I M)
    (u : C^∞⟮I, M; ℝ⟯) : 0 < capTestVolume (conformalMetric g u) := by
  let ν := riemannianVolumeMeasure I M (conformalMetric g u)
  let : IsFiniteMeasureOnCompacts ν :=
    riemannianVolumeMeasure_isFiniteMeasureOnCompacts (conformalMetric g u)
  let : ν.IsOpenPosMeasure := riemannianVolumeMeasure_isOpenPosMeasure (conformalMetric g u)
  exact ENNReal.toReal_pos (isOpen_univ.measure_pos ν univ_nonempty).ne' (measure_ne_top ν univ)

/-- A uniform bound for the logarithmic conformal tests bounds the actual
four-dimensional class infimum. -/
theorem le_classYamabeFour_of_capFactorScalar (hd : Module.finrank ℝ E = 4)
    (g : SmoothRiemannianMetric I M) {b : ℝ}
    (h : ∀ u : C^∞⟮I, M; ℝ⟯,
      b * Real.sqrt (capFactorVolume g (capExpFactor u)) ≤ capFactorScalar g (capExpFactor u)) :
    b ≤ classYamabeFour hd g := by
  refine le_csInf (range_nonempty _) ?_
  rintro _ ⟨u, rfl⟩
  change b ≤
    capTestScalar (conformalMetric g u) / Real.sqrt (capTestVolume (conformalMetric g u))
  rw [le_div_iff₀ (Real.sqrt_pos_of_pos (scalarDeficit_logVolume_pos g u)),
    capTestScalar_eq_capFactorScalar hd, capTestVolume_eq_capFactorVolume hd]
  exact h u

/-- Every closed four-dimensional class has Yamabe constant bounded below by
minus the negative scalar norm of the given representative. -/
theorem neg_scalarDeficitNorm_le_classYamabeFour (hd : Module.finrank ℝ E = 4)
    (g : SmoothRiemannianMetric I M) :
    -scalarDeficitNorm g ≤ classYamabeFour hd g := by
  apply le_classYamabeFour_of_capFactorScalar hd g
  intro u
  have hPositive : 0 ≤ ∫ x, max (metricScalarAt g x) 0 * (capExpFactor u) x ^ 2
      ∂riemannianVolumeMeasure I M g :=
    integral_nonneg fun _ => mul_nonneg (le_max_right _ _) (sq_nonneg _)
  linarith only [hPositive, capFactorScalar_add_scalarDeficitNorm hd g (capExpFactor u)]

/-- Equality at the negative scalar bound is impossible if the positive
scalar region has positive physical volume and a smooth log factor attains
the Yamabe infimum. Any retained positive-volume subregion suffices. -/
theorem neg_scalarDeficitNorm_lt_classYamabeFour_of_attains
    (hd : Module.finrank ℝ E = 4) (g : SmoothRiemannianMetric I M) {V : Set M}
    (hVolume : 0 < (riemannianVolumeMeasure I M g) V)
    (hScalar : ∀ x ∈ V, 0 < metricScalarAt g x)
    (u : C^∞⟮I, M; ℝ⟯)
    (hAttains : classYamabeFour hd g =
      capTestScalar (conformalMetric g u) /
        Real.sqrt (capTestVolume (conformalMetric g u))) :
    -scalarDeficitNorm g < classYamabeFour hd g := by
  let μ := riemannianVolumeMeasure I M g
  let : IsFiniteMeasureOnCompacts μ := riemannianVolumeMeasure_isFiniteMeasureOnCompacts g
  let f := capExpFactor u
  let p := fun x => max (metricScalarAt g x) 0 * f x ^ 2
  have hpCont : Continuous p :=
    ((continuous_metricScalar g).max continuous_const).mul (f.contMDiff.continuous.pow 2)
  have hp : Integrable p μ := hpCont.integrable_of_hasCompactSupport
    (HasCompactSupport.of_compactSpace _)
  have hSupport : V ⊆ Function.support p := fun x hx =>
    (mul_pos ((hScalar x hx).trans_le (le_max_left _ _))
      (pow_pos (Real.exp_pos (u x)) 2)).ne'
  have hPositive : 0 < ∫ x, p x ∂μ :=
    (integral_pos_iff_support_of_nonneg
      (fun _ => mul_nonneg (le_max_right _ _) (sq_nonneg _)) hp).2
      (hVolume.trans_le (measure_mono hSupport))
  rw [hAttains, lt_div_iff₀ (Real.sqrt_pos_of_pos (scalarDeficit_logVolume_pos g u)),
    capTestScalar_eq_capFactorScalar hd, capTestVolume_eq_capFactorVolume hd]
  change -scalarDeficitNorm g * Real.sqrt (capFactorVolume g f) < capFactorScalar g f
  have hDeficit := capFactorScalar_add_scalarDeficitNorm hd g f
  change (∫ x, p x ∂μ) ≤ _ at hDeficit
  linarith only [hPositive, hDeficit]

variable {o : ManifoldOrientation I M 4}

/-- The normalized Euler floor and the negative scalar bound give a positive
Yamabe class under a strict scalar budget, without an attainment premise. -/
theorem signedMetric_yamabe_pos_of_scalarDeficit_lt (g : SignedCollarMetric o)
    (hEuler : 48 * (8 * Real.pi ^ 2 - g.energy .plus) ≤
      classYamabeFour o.dimension_eq g.metric ^ 2)
    (hBudget : scalarDeficitSq g.metric < 48 * (8 * Real.pi ^ 2 - g.energy .plus)) :
    0 < classYamabeFour o.dimension_eq g.metric := by
  by_contra! hSign
  have hNeg := neg_scalarDeficitNorm_le_classYamabeFour o.dimension_eq g.metric
  have hSq : classYamabeFour o.dimension_eq g.metric ^ 2 ≤ scalarDeficitNorm g.metric ^ 2 := by
    rw [← neg_sq (classYamabeFour o.dimension_eq g.metric)]
    exact pow_le_pow_left₀ (neg_nonneg.mpr hSign) (neg_le.mp hNeg) 2
  rw [scalarDeficitNorm_sq] at hSq
  exact (hSq.trans_lt hBudget).not_ge hEuler

/-- The scalar budget is inclusive at a strict Weyl energy gap if the
actual candidate retains positive scalar curvature on positive volume.
Only the negative class requires a smooth attaining factor. -/
theorem signedMetric_yamabe_pos_of_retainedScalar (g : SignedCollarMetric o) {V : Set M}
    (hVolume : 0 < (riemannianVolumeMeasure I M g.metric) V)
    (hScalar : ∀ x ∈ V, 0 < metricScalarAt g.metric x)
    (hAttain : classYamabeFour o.dimension_eq g.metric < 0 →
      ∃ u : C^∞⟮I, M; ℝ⟯, classYamabeFour o.dimension_eq g.metric =
        capTestScalar (conformalMetric g.metric u) /
          Real.sqrt (capTestVolume (conformalMetric g.metric u)))
    (hEuler : 48 * (8 * Real.pi ^ 2 - g.energy .plus) ≤
      classYamabeFour o.dimension_eq g.metric ^ 2)
    (hGap : g.energy .plus < 8 * Real.pi ^ 2)
    (hBudget : scalarDeficitSq g.metric ≤ 48 * (8 * Real.pi ^ 2 - g.energy .plus)) :
    0 < classYamabeFour o.dimension_eq g.metric ∧
      Real.sqrt (48 * (8 * Real.pi ^ 2 - g.energy .plus)) ≤
        classYamabeFour o.dimension_eq g.metric := by
  have hGap' : 0 < 48 * (8 * Real.pi ^ 2 - g.energy .plus) :=
    mul_pos (by norm_num) (sub_pos.mpr hGap)
  have hY : 0 < classYamabeFour o.dimension_eq g.metric := by
    by_contra! hSign
    have hNeg : classYamabeFour o.dimension_eq g.metric < 0 := by
      refine hSign.lt_of_ne ?_
      intro hZero
      rw [hZero, zero_pow (by decide : 2 ≠ 0)] at hEuler
      exact hGap'.not_ge hEuler
    obtain ⟨u, hu⟩ := hAttain hNeg
    have hStrict := neg_scalarDeficitNorm_lt_classYamabeFour_of_attains
      o.dimension_eq g.metric hVolume hScalar u hu
    have hSq : classYamabeFour o.dimension_eq g.metric ^ 2 < scalarDeficitNorm g.metric ^ 2 := by
      rw [← neg_sq (classYamabeFour o.dimension_eq g.metric)]
      exact pow_lt_pow_left₀ (neg_lt.mp hStrict) (neg_nonneg.mpr hSign) (by decide)
    rw [scalarDeficitNorm_sq] at hSq
    exact (hSq.trans_le hBudget).not_ge hEuler
  exact ⟨hY, Real.sqrt_le_iff.mpr ⟨hY.le, hEuler⟩⟩

omit [Nonempty M] in
/-- The matched metric germ preserves scalar curvature in the common frame. -/
theorem signedMetric_scalar_eq_of_germ (g h : SignedCollarMetric o) (x : M)
    (hGerm : ∀ᶠ y in 𝓝 x, ∀ u v : TangentSpace I y, g.metric.inner y u v = h.metric.inner y u v)
    (hFrame : (g.frame x).basis = (h.frame x).basis) :
    metricScalarAt g.metric x = metricScalarAt h.metric x := by
  have hRm := metricRm04At_eq_of_metric_eventuallyEq g.metric h.metric x hGerm
  have hTensor : metricCurvatureFrameTensor g.metric o x (g.frame x) =
      metricCurvatureFrameTensor h.metric o x (h.frame x) := by
    funext i j k l
    change metricRm04StandardAt g.metric x _ _ _ _ = metricRm04StandardAt h.metric x _ _ _ _
    simp only [metricRm04StandardAt_apply, hRm, hFrame]
  simpa only [frameScalarCurvature_metric] using congrArg frameScalarCurvature hTensor

section MarkedCap

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "I₄" => 𝓘(ℝ,E₄)
variable {J : ModelWithCorners ℝ E₄ H} [J.Boundaryless] [IsManifold J ∞ M]
  {orientation : ManifoldOrientation J M 4}

/-- On the actual marked disk use the same connector set for the scalar
and Weyl budgets, with all off-connector cap mass included. An inclusive
scalar budget gives a positive same-type cap with the specified energy.
An attempted cap below the positive same-type infimum must exceed that
budget strictly. -/
theorem selectedMatchedCap_scalarTest (source cap : SignedCollarMetric orientation)
    (F : PartialDiffeomorph I₄ J E₄ M ∞)
    (hDisk : Metric.closedBall (0 : E₄) 1 ⊆ F.source) (sign : CollarChirality)
    {A : Set M} (hA : MeasurableSet A) (hADisk : A ⊆ selectedChartDisk F)
    (hGerm : ∀ x ∉ interior (selectedChartDisk F), ∀ᶠ y in 𝓝 x,
      ∀ u v : TangentSpace J y, source.metric.inner y u v = cap.metric.inner y u v)
    (hFrame : ∀ x ∉ interior (selectedChartDisk F), (source.frame x).basis = (cap.frame x).basis)
    (hExterior : ∀ x ∉ interior (selectedChartDisk F), 0 ≤ metricScalarAt source.metric x)
    (hPositive : ∃ x ∉ interior (selectedChartDisk F), 0 < metricScalarAt source.metric x)
    (hAttain : classYamabeFour orientation.dimension_eq cap.metric < 0 →
      ∃ u : C^∞⟮J, M; ℝ⟯, classYamabeFour orientation.dimension_eq cap.metric =
        capTestScalar (conformalMetric cap.metric u) /
          Real.sqrt (capTestVolume (conformalMetric cap.metric u)))
    (hEuler : 48 * (8 * Real.pi ^ 2 - cap.energy .plus) ≤
      classYamabeFour orientation.dimension_eq cap.metric ^ 2) :
    let B := selectedChartDisk F
    let e := source.energy .plus - source.charge sign B + cap.charge sign A +
      cap.charge sign (B \ A)
    let μ := riemannianVolumeMeasure J M cap.metric
    let density := fun x => (max (-metricScalarAt cap.metric x) 0) ^ 2
    let nSq := (∫ x in A, density x ∂μ) + (∫ x in B \ A, density x ∂μ)
    cap.energy .plus = e ∧ scalarDeficitSq cap.metric = nSq ∧
      (e < 8 * Real.pi ^ 2 → nSq ≤ 48 * (8 * Real.pi ^ 2 - e) →
        0 < classYamabeFour orientation.dimension_eq cap.metric ∧
          Real.sqrt (48 * (8 * Real.pi ^ 2 - e)) ≤
            classYamabeFour orientation.dimension_eq cap.metric ∧
          e ∈ geometricPositiveEnergies orientation) ∧
      (e < 8 * Real.pi ^ 2 → e < sInf (geometricPositiveEnergies orientation) →
        48 * (8 * Real.pi ^ 2 - e) < nSq) := by
  intro B e μ density nSq
  change A ⊆ B at hADisk
  have hSplitCharge : cap.charge sign B = cap.charge sign (B \ A) + cap.charge sign A := by
    conv_lhs => rw [← sdiff_union_of_subset hADisk]
    exact measureReal_union disjoint_sdiff_left hA
  have hEnergy : cap.energy .plus = e := by
    have h := (selectedMatchedCurvedDisk_energy source cap F hDisk hGerm hFrame sign).2
    change source.energy .plus - cap.energy .plus = source.charge sign B - cap.charge sign B at h
    dsimp only [e]
    linarith only [h, hSplitCharge]
  let : IsFiniteMeasureOnCompacts μ := riemannianVolumeMeasure_isFiniteMeasureOnCompacts cap.metric
  let : μ.IsOpenPosMeasure := riemannianVolumeMeasure_isOpenPosMeasure cap.metric
  have hDensity : Integrable density μ :=
    ((continuous_metricScalar cap.metric).neg.max continuous_const |>.pow 2)
      |>.integrable_of_hasCompactSupport (HasCompactSupport.of_compactSpace _)
  have hDensityZero (x : M) (hx : x ∉ B) : density x = 0 := by
    have hOutside : x ∉ interior B := fun h => hx (interior_subset h)
    have hEq := signedMetric_scalar_eq_of_germ source cap x (hGerm x hOutside) (hFrame x hOutside)
    simp [density, ← hEq, max_eq_right (neg_nonpos.mpr (hExterior x hOutside))]
  have hDeficit : scalarDeficitSq cap.metric = nSq := by
    change ∫ x, density x ∂μ = _
    rw [← setIntegral_eq_integral_of_forall_compl_eq_zero hDensityZero]
    have hSplit := setIntegral_sdiff hA hDensity.integrableOn hADisk
    dsimp only [nSq]
    linarith only [hSplit]
  let V := {x | 0 < metricScalarAt cap.metric x}
  have hV : IsOpen V := isOpen_lt continuous_const (continuous_metricScalar cap.metric)
  obtain ⟨x, hx, hxScalar⟩ := hPositive
  have hNonempty : V.Nonempty :=
    ⟨x, hxScalar.trans_eq (signedMetric_scalar_eq_of_germ source cap x (hGerm x hx) (hFrame x hx))⟩
  have hCert (he : e < 8 * Real.pi ^ 2) (hn : nSq ≤ 48 * (8 * Real.pi ^ 2 - e)) :=
    signedMetric_yamabe_pos_of_retainedScalar cap (hV.measure_pos μ hNonempty)
      (fun _ hx => hx) hAttain hEuler (hEnergy.trans_lt he) (by rwa [hDeficit, hEnergy])
  refine ⟨hEnergy, hDeficit, ?_, ?_⟩
  · intro he hn
    obtain ⟨hY, hFloor⟩ := hCert he hn
    exact ⟨hY, by rwa [← hEnergy], hEnergy ▸ cap.energy_mem_of_positive hY⟩
  · intro he hBelow
    by_contra! hn
    have hMem := cap.energy_mem_of_positive (hCert he hn).1
    have hInf := csInf_le (geometricPositiveEnergies_bddBelow orientation) (hEnergy ▸ hMem)
    exact hBelow.not_ge hInf

end MarkedCap

end SmoothPoincare
