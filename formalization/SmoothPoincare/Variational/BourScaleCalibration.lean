import SmoothPoincare.Variational.BourSlabVariation
import SmoothPoincare.Variational.BourFixedTypeReturn
import Mathlib.Analysis.Calculus.LocalExtr.Basic

/-! # Physical Euler scaling and the round Bour first variation

E48, 26 November 2026, prepared for Edward B. Baker III with OpenAI
Codex assistance. Serving model and reasoning effort were unavailable.
-/

noncomputable section

open Bundle DifferentialGeometry DifferentialGeometry.Geometry
  DifferentialGeometry.Geometry.Connection DifferentialGeometry.Geometry.Curvature
  DifferentialGeometry.Geometry.Operator DifferentialGeometry.Integral.Measure
  DifferentialGeometry.Tensor.Coordinates
  DifferentialGeometry.Tensor0SBundle
  FirstOrderTwistor Filter MeasureTheory Set
open scoped BigOperators ContDiff ENNReal Manifold Topology

namespace SmoothPoincare.Bour

section Scaling

variable {E H M : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
  [FiniteDimensional ℝ E] [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]

private local instance : CompleteSpace E := FiniteDimensional.complete ℝ E
private local instance : IsManifold I 1 M := IsManifold.of_le (by decide : (1 : WithTop ℕ∞) ≤ (↑(⊤ : ℕ∞) : WithTop ℕ∞))
private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

/-- The intrinsic Euler density has weight minus two under constant metric
scaling, using the ordered curvature slots and ordinary Ricci tensor norm. -/
theorem bourEulerDensity_homothety (g : SmoothRiemannianMetric I M) {c : ℝ}
    (hc : 0 < c) (x : M) :
    intrinsicEulerDensity (scaleMetric c hc g) x = c⁻¹ ^ 2 * intrinsicEulerDensity g x := by
  unfold intrinsicEulerDensity
  rw [show metricRm04At (scaleMetric c hc g) x = c • metricRm04At g x
    from metricRm_scale c hc g x, metricRicciAt_scaleMetric, metricScalarAt_scaleMetric]
  rw [normSq0S_scale, normSq0S_scale, normSq0S_smul, mul_pow]
  field_simp

/-- In four dimensions the physical Euler integral is unchanged by metric
homothety on any measured part of the same carrier. -/
theorem bourEulerIntegral_homothety [SigmaCompactSpace M] (hd : Module.finrank ℝ E = 4)
    (g : SmoothRiemannianMetric I M) {c : ℝ} (hc : 0 < c) (A : Set M) :
    (∫ x in A, intrinsicEulerDensity (scaleMetric c hc g) x
      ∂riemannianVolumeMeasure I M (scaleMetric c hc g)) =
    ∫ x in A, intrinsicEulerDensity g x ∂riemannianVolumeMeasure I M g := by
  simp_rw [bourEulerDensity_homothety g hc]
  have hV : Real.sqrt c ^ 4 = c ^ 2 := by
    rw [show (4 : ℕ) = 2 * 2 by decide, pow_mul, Real.sq_sqrt hc.le]
  rw [volume_scaleMetric, hd, Measure.restrict_smul, integral_smul_measure,
    ENNReal.toReal_pow, ENNReal.toReal_ofReal (Real.sqrt_nonneg _), smul_eq_mul,
    integral_const_mul, hV]
  field_simp

/-- The same physical identity specializes to any two actual signed metrics
whose underlying metrics are positive constant rescalings. -/
theorem bourEuler_homothety [CompactSpace M] {o : ManifoldOrientation I M 4}
    (q scaled : SignedCollarMetric o) {c : ℝ} (hc : 0 < c)
    (hScaled : scaled.metric = scaleMetric c hc q.metric) :
    bourEuler scaled = bourEuler q := by
  unfold bourEuler
  rw [hScaled]
  simpa only [setIntegral_univ] using bourEulerIntegral_homothety o.dimension_eq q.metric hc univ

/-- Homothety invariance of the original Bour energy on any measured signed
pair in the same compact boundaryless four-manifold. -/
theorem bourEnergy_homothety [CompactSpace M] [BoundarylessManifold I M]
    {o : ManifoldOrientation I M 4} (q scaled : SignedCollarMetric o) (α : ℝ) {c : ℝ}
    (hc : 0 < c) (hScaled : scaled.metric = scaleMetric c hc q.metric) :
    bourEnergy α scaled = bourEnergy α q :=
  bourEnergy_scale q scaled α c hc hScaled (bourEuler_homothety q scaled hc hScaled)

end Scaling

section Variation

variable {E H M : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
  [FiniteDimensional ℝ E] [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [T2Space M] [CompactSpace M] [I.Boundaryless] [BoundarylessManifold I M]
  {o : ManifoldOrientation I M 4}

private local instance : CompleteSpace E := FiniteDimensional.complete ℝ E
private local instance : IsManifold I 1 M := IsManifold.of_le (by decide : (1 : WithTop ℕ∞) ≤ (↑(⊤ : ℕ∞) : WithTop ℕ∞))
private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

/-- The whole physical density of the Bour functional, including the intrinsic
Euler term. This expression uses no choice of moving oriented frames. -/
def bourFullDensity (α : ℝ) (g : SmoothRiemannianMetric I M) (x : M) : ℝ :=
  (1 - α) * intrinsicEulerDensity g x + bourBulkDensity α g x

omit [I.Boundaryless] in
private theorem bourEnergy_eq_integral_fullDensity (q : SignedCollarMetric o) (α : ℝ) :
    bourEnergy α q =
      ∫ x, bourFullDensity α q.metric x ∂riemannianVolumeMeasure I M q.metric := by
  let g := q.metric
  let μ := riemannianVolumeMeasure I M g
  let _ : IsFiniteMeasureOnCompacts μ := riemannianVolumeMeasure_isFiniteMeasureOnCompacts g
  have hRic : Continuous (fun x => normSq0S g x 2 (metricRicciAt g x)) := by
    simpa only [metricRicci_apply] using normSq0S_cont g (metricRicci g)
  have hFull : Continuous (fun x => intrinsicCurvatureSq g x) := by
    simpa only [intrinsicCurvatureSq, metricRm04_apply] using normSq0S_cont g (metricRm04 g)
  have hScalar : Continuous (fun x => metricScalarAt g x ^ 2) := (metricScalar_smooth g).continuous.pow 2
  have hEuler : Continuous (intrinsicEulerDensity g) :=
    ((hFull.div_const 4).sub hRic).add (hScalar.div_const 4)
  have hBulk : Continuous (bourBulkDensity α g) :=
    (hRic.div_const 2).add ((hScalar.const_mul (α - 4)).div_const 24)
  have hE : Integrable (fun x => (1 - α) * intrinsicEulerDensity g x) μ :=
    (hEuler.const_mul _).integrable_of_hasCompactSupport (HasCompactSupport.of_compactSpace _)
  have hB : Integrable (bourBulkDensity α g) μ :=
    hBulk.integrable_of_hasCompactSupport (HasCompactSupport.of_compactSpace _)
  change bourEnergy α q =
    ∫ x, ((1 - α) * intrinsicEulerDensity g x + bourBulkDensity α g x) ∂μ
  rw [bourEnergy_eq_integral_bulk, bourEuler, integral_add hE hB, integral_const_mul]

omit [CompactSpace M] in
/-- The ordered four-slot curvature square is jointly smooth on the original regular family. -/
theorem bourCurvatureSq_contMDiffOn (g : ℝ → SmoothRiemannianMetric I M)
    {D : RealTimeInterval} (hG : MetricFamilySmoothOn (I := I) D g) :
    ContMDiffOn (𝓘(ℝ, ℝ).prod I) 𝓘(ℝ, ℝ) ∞
      (fun p : ℝ × M => intrinsicCurvatureSq (g p.1) p.2) (D.regular ×ˢ (univ : Set M)) := by
  have hGram := chartGramMatrix_joint_contMDiffOn g D.regular
    (hG.metricCLMSection_contMDiffOn (J := D.regular) Subset.rfl)
  rintro ⟨t, x⟩ ⟨ht, -⟩
  let U := (trivializationAt E (TangentSpace I) x).baseSet
  have hx : x ∈ U := FiberBundle.mem_baseSet_trivializationAt' x
  have hX : x ∈ (chartAt H x).source := mem_chart_source H x
  have hN : D.regular ×ˢ U ∈ 𝓝 (t, x) :=
    (D.regular_isOpen.prod (trivializationAt E (TangentSpace I) x).open_baseSet).mem_nhds ⟨ht, hx⟩
  have hChartN : D.regular ×ˢ (chartAt H x).source ∈ 𝓝 (t, x) :=
    (D.regular_isOpen.prod (chartAt H x).open_source).mem_nhds ⟨ht, hX⟩
  have hGramWithin := chartGramFamilySmoothWithinOn_of_contMDiffOn g x (hGram x)
  have hInv (i j : Fin (Module.finrank ℝ E)) :
      ContMDiffAt (𝓘(ℝ, ℝ).prod I) 𝓘(ℝ, ℝ) ∞
        (fun p : ℝ × M => chartInvGramMatrix (I := I) (g p.1) x p.2 i j) (t, x) := by
    have h := (hG.chartInvGramMatrix_jointContMDiffOn g x i j).comp
      (contMDiffOn_snd.prodMk contMDiffOn_fst : ContMDiffOn (𝓘(ℝ, ℝ).prod I)
        (I.prod 𝓘(ℝ, ℝ)) ∞ (fun p : ℝ × M => (p.2, p.1)) (D.regular ×ˢ U))
      (fun p hp => ⟨hp.2, hp.1⟩)
    exact (h (t, x) ⟨ht, hx⟩).contMDiffAt hN
  let C (K : Fin 4 → Fin (Module.finrank ℝ E)) (p : ℝ × M) :=
    metricRm04At (g p.1) p.2 (fun a => chartBasisVecFiber (I := I) x (K a) p.2)
  have hC (K : Fin 4 → Fin (Module.finrank ℝ E)) :
      ContMDiffAt (𝓘(ℝ, ℝ).prod I) 𝓘(ℝ, ℝ) ∞ (C K) (t, x) := by
    have hR (l : Fin (Module.finrank ℝ E)) :=
      (chartRiemannTensor_comp_extChartAt_contMDiffWithinAt g x hGramWithin
        (K 2) (K 0) (K 1) l ht hX).contMDiffAt hChartN
    have hTerm := fun l => (hR l).mul ((hGram x (K 3) l (t, x) ⟨ht, hx⟩).contMDiffAt hN)
    refine (ContMDiffAt.sum (t := Finset.univ) fun l _ => hTerm l).congr_of_eventuallyEq ?_
    filter_upwards [hChartN] with p hp
    have hGood : p.2 ∈ chartLeviCivitaGoodSet (I := I) x :=
      (mem_chartLeviCivitaGoodSet_iff_mem_extChartAt_source (I := I) x p.2).2
        (by simpa only [extChartAt_source] using hp.2)
    have hVec : (fun a : Fin 4 => chartBasisVecFiber (I := I) x (K a) p.2) =
        vec4 (chartBasisVecFiber (I := I) x (K 0) p.2) (chartBasisVecFiber (I := I) x (K 1) p.2)
          (chartBasisVecFiber (I := I) x (K 2) p.2) (chartBasisVecFiber (I := I) x (K 3) p.2) := by
      funext a
      fin_cases a <;> rfl
    dsimp only [C]
    rw [hVec, metricRm04At_eq_riemannCurvature04At,
      CovariantDerivative.riemannCurvature04At_apply_const,
      connectionRiemannCurvatureField_tangentConst_eq_riemannOp (LeviCivita (I := I) (g p.1))
        (leviCivita_contMDiffCovariantDerivativeLocally (g p.1)),
      riemannOp_chartBasisVec_alpha_eq (g p.1) x (K 2) (K 0) (K 1) hGood, map_sum]
    exact Finset.sum_congr rfl fun l _ => by
      rw [map_smul, smul_eq_mul, ← chartGramMatrix_apply, Pi.mul_apply]
  have hSum : ContMDiffAt (𝓘(ℝ, ℝ).prod I) 𝓘(ℝ, ℝ) ∞
      (fun p : ℝ × M => ∑ K : Fin 4 → Fin (Module.finrank ℝ E),
        ∑ L : Fin 4 → Fin (Module.finrank ℝ E),
          (∏ a : Fin 4, chartInvGramMatrix (g p.1) x p.2 (K a) (L a)) * C K p * C L p) (t, x) := by
    refine ContMDiffAt.sum fun K _ => ContMDiffAt.sum fun L _ => ?_
    exact ((ContMDiffAt.prod fun a _ => hInv (K a) (L a)).mul (hC K)).mul (hC L)
  refine (hSum.congr_of_eventuallyEq ?_).contMDiffWithinAt
  filter_upwards [hN] with p hp
  rw [intrinsicCurvatureSq, normSq0S_eq_coord (g p.1) p.2 4 (chartBasisFamily x hp.2)
    (fun i j => chartInvGramMatrix (g p.1) x p.2 i j) (chartInvGram_inverse (g p.1) x hp.2)]
  unfold coordInner0S
  refine Finset.sum_congr rfl fun K _ => Finset.sum_congr rfl fun L _ => ?_
  simp only [tensor0SComponent_apply, chartBasisFamily_apply, C]

omit [CompactSpace M] in
private theorem bourFullDensity_contMDiffOn (α : ℝ) (g : ℝ → SmoothRiemannianMetric I M)
    {D : RealTimeInterval} (hG : MetricFamilySmoothOn (I := I) D g) :
    ContMDiffOn (𝓘(ℝ, ℝ).prod I) 𝓘(ℝ, ℝ) ∞
      (fun p : ℝ × M => bourFullDensity α (g p.1) p.2) (D.regular ×ˢ (univ : Set M)) := by
  have hFull := bourCurvatureSq_contMDiffOn g hG
  have hB₁ := bourBulkDensity_contMDiffOn (1 : ℝ) g hG
  have hB := bourBulkDensity_contMDiffOn α g hG
  have hE := (hFull.div_const 4).sub ((contMDiffOn_const (c := (2 : ℝ))).mul hB₁)
  apply (((contMDiffOn_const (c := 1 - α)).mul hE).add hB).congr
  rintro ⟨s, x⟩ _
  change (1 - α) * intrinsicEulerDensity (g s) x + bourBulkDensity α (g s) x =
    (1 - α) * (intrinsicCurvatureSq (g s) x / 4 - 2 * bourBulkDensity 1 (g s) x) +
      bourBulkDensity α (g s) x
  unfold intrinsicEulerDensity intrinsicCurvatureSq bourBulkDensity
  ring

/-- Differentiate the complete original functional at a regular time, including
the varying physical measure and the actual intrinsic Euler density. -/
theorem bourEnergy_hasDerivAt_fullDensity (q : ℝ → SignedCollarMetric o) (α : ℝ)
    {D : RealTimeInterval} (hG : MetricFamilySmoothOn (I := I) D (fun s => (q s).metric))
    {t : ℝ} (ht : t ∈ D.regular)
    (K : (x : M) → Tensor0SSpace (𝕜 := ℝ) 2 I x)
    (hK : ∀ x, HasDerivAt (fun s => metricTensorField (q s).metric x) (K x) t) :
    HasDerivAt (fun s => bourEnergy α (q s))
      (∫ x, (deriv (fun s => bourFullDensity α (q s).metric x) t +
        (1 / 2) * inner0S (q t).metric x 2 (K x) (metricTensorField (q t).metric x) *
          bourFullDensity α (q t).metric x)
        ∂riemannianVolumeMeasure I M (q t).metric) t := by
  let g := fun s => (q s).metric
  have hGram := chartGramMatrix_joint_contMDiffOn g D.regular
    (hG.metricCLMSection_contMDiffOn (J := D.regular) Subset.rfl)
  have hFirst := first_var_joint (g_fam := g) (f := fun s => bourFullDensity α (g s))
    D.regular_isOpen ht hGram (bourFullDensity_contMDiffOn α g hG)
  simp only [riemannianMeasureFamily_def, traceTimeDerivMetric_eq_inner_of_velocity g t _ _ (hK _)] at hFirst
  simpa only [bourEnergy_eq_integral_fullDensity] using hFirst

end Variation

section Round

local notation "I₄" => 𝓡 4
local instance : Fact (Module.finrank ℝ (EuclideanSpace ℝ (Fin 5)) = 4 + 1) := ⟨by simp⟩
private local instance : Nonempty StandardFourSphere :=
  ((NormedSpace.sphere_nonempty (x := (0 : EuclideanSpace ℝ (Fin 5))) (r := 1)).mpr
    zero_le_one).to_subtype
private local instance : MeasurableSpace StandardFourSphere := borel StandardFourSphere
private local instance : BorelSpace StandardFourSphere := ⟨rfl⟩

private theorem bourEnergy_eq_zero_of_roundMetric
    {o : ManifoldOrientation I₄ StandardFourSphere 4} (q : SignedCollarMetric o) (α : ℝ)
    (hRound : q.metric = standardRoundFourMetric) : bourEnergy α q = 0 := by
  obtain ⟨g, frame, hInt, hSig⟩ := q
  dsimp only at hRound
  subst g
  have h := bourStandardRound_charge_values o frame
  rw [bourEnergy_eq_chiral_ricci, ← (bourClosed_charge_eq_energy _).1]
  change 2 * (1 - α) * bourChargeOn o standardRoundFourMetric frame univ .plus +
    α * bourChargeOn o standardRoundFourMetric frame univ .ricci / 2 = 0
  rw [h.1, h.2.2.1]
  ring

/-- In the regularization range a measured metric with the actual round
metric minimizes the full Bour functional. -/
theorem bourRound_isMin {o : ManifoldOrientation I₄ StandardFourSphere 4} {α : ℝ}
    (hα : 0 ≤ α) (hα₁ : α ≤ 1) (round q : SignedCollarMetric o)
    (hRound : round.metric = standardRoundFourMetric) :
    bourEnergy α round ≤ bourEnergy α q := by
  rw [bourEnergy_eq_zero_of_roundMetric round α hRound, bourEnergy_eq_chiral_ricci]
  exact add_nonneg (mul_nonneg (mul_nonneg (by norm_num) (sub_nonneg.mpr hα₁))
    (chiralFrameEnergy_nonneg _ _)) (div_nonneg (mul_nonneg hα (bourRicci_nonneg _)) (by norm_num))

/-- On an arbitrary regular metric variation through the actual round
metric, the derivative of the full Bour functional is the physical
pairing with the zero covariant gradient. Differentiability is taken
from the full curvature density and its physical volume variation. -/
theorem bourRound_fullFirstVariation
    (o : ManifoldOrientation I₄ StandardFourSphere 4) (q : ℝ → SignedCollarMetric o)
    {α : ℝ} (hα : 0 ≤ α) (hα₁ : α ≤ 1)
    {D : RealTimeInterval} (hG : MetricFamilySmoothOn (I := I₄) D (fun s => (q s).metric))
    {t : ℝ} (ht : t ∈ D.regular)
    (hRound : (q t).metric = standardRoundFourMetric) :
    HasDerivAt (fun s => bourEnergy α (q s))
      (∫ x, inner0S (q t).metric x 2 0
        (deriv (fun s => metricTensorField (q s).metric x) t)
        ∂riemannianVolumeMeasure I₄ StandardFourSphere (q t).metric) t := by
  let K := fun x : StandardFourSphere => deriv (fun s => metricTensorField (q s).metric x) t
  have hK (x : StandardFourSphere) :
      HasDerivAt (fun s => metricTensorField (q s).metric x) (K x) t :=
    bourMetric_hasDerivAt_regular (fun s => (q s).metric) hG ht x
  have hDer := bourEnergy_hasDerivAt_fullDensity q α hG ht K hK
  have hMin : IsLocalMin (fun s => bourEnergy α (q s)) t :=
    Eventually.of_forall fun s => bourRound_isMin hα hα₁ (q t) (q s) hRound
  have hZero := hMin.hasDerivAt_eq_zero hDer
  have h := hDer.congr_deriv hZero
  have hPair (x : StandardFourSphere) :
      inner0S (q t).metric x 2 0 (K x) = 0 := by
    rw [show (0 : Tensor0SSpace (𝕜 := ℝ) 2 I₄ x) = (0 : ℝ) • (K x)
      from (zero_smul _ _).symm, inner0S_smul_left, zero_mul]
  change HasDerivAt (fun s => bourEnergy α (q s))
    (∫ x, inner0S (q t).metric x 2 0 (K x)
      ∂riemannianVolumeMeasure I₄ StandardFourSphere (q t).metric) t
  simpa only [hPair, integral_zero] using h

end Round

end SmoothPoincare.Bour
