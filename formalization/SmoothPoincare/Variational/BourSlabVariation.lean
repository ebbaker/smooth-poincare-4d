import SmoothPoincare.Variational.BourReturnedBudgets
import SmoothPoincare.Variational.ConformalChiralCharges
import DifferentialGeometry.Analysis.Integration.Measure.Family.LocalVariation
import DifferentialGeometry.Tensor.RSTensor.Evaluation

/-! # First variation on a smooth Bour time slab

E48, 26 November 2026, prepared for Edward B. Baker III with OpenAI
Codex assistance. Serving model and reasoning effort were unavailable.
The metric velocity and curvature integrals use the physical slice metric.
-/

open Bundle DifferentialGeometry DifferentialGeometry.Geometry
  DifferentialGeometry.Geometry.Connection DifferentialGeometry.Geometry.Curvature
  DifferentialGeometry.Geometry.Operator DifferentialGeometry.Integral.Measure
  DifferentialGeometry.Tensor.Coordinates DifferentialGeometry.Tensor0SBundle
  Filter FirstOrderTwistor MeasureTheory Set
open scoped ContDiff Manifold Matrix Topology

namespace SmoothPoincare.Bour

noncomputable section

variable {E H M : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
  [FiniteDimensional ℝ E] [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]

private local instance : IsManifold I 1 M := IsManifold.of_le (by decide : (1 : WithTop ℕ∞) ≤ ∞)
private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

private theorem chartGram_hasDerivAt_of_velocity (g : ℝ → SmoothRiemannianMetric I M)
    (t : ℝ) (x₀ x : M) (i j : Fin (Module.finrank ℝ E))
    (K : Tensor0SSpace (𝕜 := ℝ) 2 I x)
    (hK : HasDerivAt (fun s => metricTensorField (g s) x) K t) :
    HasDerivAt (fun s => chartGramMatrix (g s) x₀ x i j)
      (K (vec2 (chartBasisVecFiber x₀ i x) (chartBasisVecFiber x₀ j x))) t := by
  let v := vec2 (I := I) (chartBasisVecFiber x₀ i x) (chartBasisVecFiber x₀ j x)
  let ev := tensor0SEvalCLM v
  have hFun : (fun s => chartGramMatrix (g s) x₀ x i j) =
      (fun s => ev (metricTensorField (g s) x)) := by
    funext s
    change chartGramMatrix (g s) x₀ x i j = metricTensorField (g s) x v
    rw [chartGramMatrix_apply, metricTensorField_apply]
    rfl
  rw [hFun]
  exact ev.hasFDerivAt.comp_hasDerivAt t hK

/-- A derivative of the actual covariant metric tensor computes the trace
in the physical volume variation formula. -/
theorem traceTimeDerivMetric_eq_inner_of_velocity (g : ℝ → SmoothRiemannianMetric I M) (t : ℝ)
    (x : M) (K : Tensor0SSpace (𝕜 := ℝ) 2 I x)
    (hK : HasDerivAt (fun s => metricTensorField (g s) x) K t) :
    traceTimeDerivMetric (I := I) g t x = inner0S (g t) x 2 K (metricTensorField (g t) x) := by
  let B := chartBasisVecFiber (I := I) x
  let T := chartGramMatrix (I := I) (g t) x x
  have hB : x ∈ (trivializationAt E (TangentSpace I) x).baseSet :=
    FiberBundle.mem_baseSet_trivializationAt' x
  have hEntries (i j : Fin (Module.finrank ℝ E)) :
      deriv (fun s => chartGramMatrix (g s) x x i j) t = K (vec2 (B i x) (B j x)) := by
    exact (chartGram_hasDerivAt_of_velocity g t x x i j K hK).deriv
  rw [traceTimeDerivMetric_eq]
  simp_rw [hEntries]
  have hSymm (i j : Fin (Module.finrank ℝ E)) : T⁻¹ j i = T⁻¹ i j := by
    have h := (chartGramMatrix_isHermitian (g t) x x).inv
    simpa [T, star_trivial] using h.apply i j
  have hm : metricTensor0S (g t) x = metricTensorField (g t) x := by
    ext v
    simp only [metricTensor0S_apply, metricTensorField_apply]
  rw [inner0S_comm, ← hm]
  change _ = metricTracePair0SAt (g t) K
  rw [metricTracePair0SAt_eq_sum_basis (g t) (chartBasisFamily x hB)
    (fun i j => chartInvGramMatrix (g t) x x i j) (chartInvGram_inverse (g t) x hB)]
  rw [Matrix.trace_mul_comm]
  simp only [Matrix.trace, Matrix.diag_apply, Matrix.mul_apply, Matrix.of_apply, chartBasisFamily_apply]
  apply Finset.sum_congr rfl
  intro i _
  apply Finset.sum_congr rfl
  intro j _
  change K (vec2 (B i x) (B j x)) * (T⁻¹ j i) = T⁻¹ i j * K (vec2 (B i x) (B j x))
  rw [hSymm, mul_comm]

section Compact

variable [T2Space M] [CompactSpace M]

/-- The derivative of physical volume uses the actual speed on an open
regular time set. The pinned localized volume variation provides the
germ of a globally regular family at the evaluation time. -/
theorem bourVolume_hasDerivAt_of_velocity
    {g : ℝ → SmoothRiemannianMetric I M} {U : Set ℝ} (hU : IsOpen U) {t : ℝ} (ht : t ∈ U)
    (hg : ∀ (x₀ : M) (i j : Fin (Module.finrank ℝ E)),
      ContMDiffOn (𝓘(ℝ, ℝ).prod I) 𝓘(ℝ, ℝ) ∞
        (fun p : ℝ × M => chartGramMatrix (g p.1) x₀ p.2 i j)
        (U ×ˢ (trivializationAt E (TangentSpace I) x₀).baseSet))
    (K : (x : M) → Tensor0SSpace (𝕜 := ℝ) 2 I x)
    (hK : ∀ x, HasDerivAt (fun s => metricTensorField (g s) x) (K x) t) :
    HasDerivAt (fun s => (riemannianVolumeMeasure I M (g s)).real univ)
      (1 / 2 * ∫ x, inner0S (g t) x 2 (K x) (metricTensorField (g t) x)
        ∂riemannianVolumeMeasure I M (g t)) t := by
  have h := first_var_joint (g_fam := g) (f := fun _ _ => (1 : ℝ)) hU ht hg contMDiffOn_const
  simp only [riemannianMeasureFamily_def, integral_const, smul_eq_mul, mul_one, deriv_const,
    zero_add, traceTimeDerivMetric_eq_inner_of_velocity g t _ _ (hK _), integral_const_mul] at h
  exact h

/-- A spatially integrated trace of zero implies actual physical volume
conservation on a finite slab, including endpoints by continuity. -/
theorem bourVolume_constant_on_slab
    (g : ℝ → SmoothRiemannianMetric I M) {U : Set ℝ} (hU : IsOpen U)
    {a b : ℝ} (hab : a ≤ b) (hTime : Ioo a b ⊆ U)
    (hg : ∀ (x₀ : M) (i j : Fin (Module.finrank ℝ E)),
      ContMDiffOn (𝓘(ℝ, ℝ).prod I) 𝓘(ℝ, ℝ) ∞
        (fun p : ℝ × M => chartGramMatrix (g p.1) x₀ p.2 i j)
        (U ×ˢ (trivializationAt E (TangentSpace I) x₀).baseSet))
    (hCont : ContinuousOn (fun s => (riemannianVolumeMeasure I M (g s)).real univ) (Icc a b))
    (G : ℝ → (x : M) → Tensor0SSpace (𝕜 := ℝ) 2 I x)
    (hVelocity : ∀ t ∈ Ioo a b, ∀ x, HasDerivAt (fun s => metricTensorField (g s) x)
      ((-2 : ℝ) • G t x) t)
    (hTrace : ∀ t ∈ Ioo a b, ∫ x, inner0S (g t) x 2 (G t x) (metricTensorField (g t) x)
      ∂riemannianVolumeMeasure I M (g t) = 0) :
    (riemannianVolumeMeasure I M (g b)).real univ =
      (riemannianVolumeMeasure I M (g a)).real univ := by
  have hDer (t : ℝ) (ht : t ∈ Ioo a b) :
      HasDerivAt (fun s => (riemannianVolumeMeasure I M (g s)).real univ) 0 t := by
    have h := bourVolume_hasDerivAt_of_velocity hU (hTime ht) hg _ (hVelocity t ht)
    simpa only [inner0S_smul_left, integral_const_mul, hTrace t ht, mul_zero] using h
  have h := intervalIntegral.integral_eq_sub_of_hasDerivAt_of_le hab hCont hDer
    (intervalIntegrable_const (c := (0 : ℝ)))
  exact sub_eq_zero.mp (by simpa using h.symm)

end Compact


section Closed

variable [T2Space M] [CompactSpace M] [I.Boundaryless] [BoundarylessManifold I M]
  {o : ManifoldOrientation I M 4}

/-- The exact scale direction is represented by a physical signed metric
at each real parameter, with metric factor `exp (s-1)`. -/
def bourScalePath (q : SignedCollarMetric o) (s : ℝ) : SignedCollarMetric o :=
  q.conformal (ContMDiffMap.const ((s - 1) / 2))

theorem bourScalePath_metric (q : SignedCollarMetric o) (s : ℝ) :
    (bourScalePath q s).metric = scaleMetric (Real.exp (s - 1)) (Real.exp_pos _) q.metric := by
  change conformalMetric q.metric (ContMDiffMap.const ((s - 1) / 2)) = _
  rw [conformalMetric_const]
  have h : 2 * ((s - 1) / 2) = s - 1 := by ring
  congr 1
  rw [h]

theorem bourScalePath_hasDerivAt (q : SignedCollarMetric o) (x : M) :
    HasDerivAt (fun s => metricTensorField (bourScalePath q s).metric x)
      (metricTensorField q.metric x) 1 := by
  have hMetric (s : ℝ) : metricTensorField (bourScalePath q s).metric x =
      Real.exp (s - 1) • metricTensorField q.metric x := by
    rw [bourScalePath_metric]
    ext v
    simp [metricTensorField_apply, scaleMetric_inner, smul_eq_mul]
  simp_rw [hMetric]
  let L : ℝ →L[ℝ] Tensor0SSpace (𝕜 := ℝ) 2 I x :=
    (ContinuousLinearMap.id ℝ ℝ).smulRight (metricTensorField q.metric x)
  have hExp : HasDerivAt (fun s : ℝ => Real.exp (s - 1)) 1 1 := by
    simpa only [id_eq, sub_self, Real.exp_zero, mul_one] using (((hasDerivAt_id (1 : ℝ)).sub_const 1).exp)
  have h : HasDerivAt (fun s => L (Real.exp (s - 1))) (L 1) 1 :=
    L.hasFDerivAt.comp_hasDerivAt 1 hExp
  have hApply (s : ℝ) : L (Real.exp (s - 1)) = Real.exp (s - 1) • metricTensorField q.metric x := rfl
  have hOne : L 1 = metricTensorField q.metric x := by
    change (1 : ℝ) • metricTensorField q.metric x = _
    rw [one_smul]
  simpa only [hApply, hOne] using h

/-- Constant scaling preserves the actual signed Weyl charges and the
ordinary trace-free Ricci energy in four dimensions. -/
theorem bourScalePath_energy_eq (q : SignedCollarMetric o) (α s : ℝ) :
    bourEnergy α (bourScalePath q s) = bourEnergy α q := by
  have hW : (bourScalePath q s).energy .plus = q.energy .plus :=
    q.energy_conformal (ContMDiffMap.const ((s - 1) / 2)) .plus
  have hD : bourRicci (bourScalePath q s) = bourRicci q := by
    rw [bourRicci_eq_integral, bourRicci_eq_integral, bourScalePath_metric]
    exact bourTraceFreeRicciIntegral_scale o.dimension_eq q.metric (Real.exp_pos _)
  rw [bourEnergy_eq_chiral_ricci, bourEnergy_eq_chiral_ricci, hW, hD]

theorem bourScalePath_energy_hasDerivAt (q : SignedCollarMetric o) (α : ℝ) :
    HasDerivAt (fun s => bourEnergy α (bourScalePath q s)) 0 1 := by
  simp_rw [bourScalePath_energy_eq q α]
  exact hasDerivAt_const _ _

/-- A true physical pairing for the exact scale path must have zero integrated
trace. This consumes the pairing with the derivative of that path. -/
theorem bourScalePath_pairing_eq_zero (q : SignedCollarMetric o) (α : ℝ)
    (G : (x : M) → Tensor0SSpace (𝕜 := ℝ) 2 I x)
    (hVariation : HasDerivAt (fun s => bourEnergy α (bourScalePath q s))
      (∫ x, inner0S q.metric x 2 (G x)
        (deriv (fun s => metricTensorField (bourScalePath q s).metric x) 1)
        ∂riemannianVolumeMeasure I M q.metric) 1) :
    (∫ x, inner0S q.metric x 2 (G x) (metricTensorField q.metric x)
      ∂riemannianVolumeMeasure I M q.metric) = 0 := by
  have h := hVariation.unique (bourScalePath_energy_hasDerivAt q α)
  have hVel (x : M) : deriv (fun s => metricTensorField (bourScalePath q s).metric x) 1 =
      metricTensorField q.metric x := (bourScalePath_hasDerivAt q x).deriv
  simpa only [hVel] using h


/-- The curvature density of Bour's functional after the closed Euler
constant is removed. The Ricci square here is the full ordinary square. -/
def bourBulkDensity (α : ℝ) (g : SmoothRiemannianMetric I M) (x : M) : ℝ :=
  normSq0S g x 2 (metricRicciAt g x) / 2 + (α - 4) * metricScalarAt g x ^ 2 / 24

omit [I.Boundaryless] in
/-- Reexpress the physical functional in intrinsic curvature densities,
so differentiating it does not require time-dependent chiral frames. -/
theorem bourEnergy_eq_integral_bulk (q : SignedCollarMetric o) (α : ℝ) :
    bourEnergy α q = (1 - α) * bourEuler q +
      ∫ x, bourBulkDensity α q.metric x ∂riemannianVolumeMeasure I M q.metric := by
  let g := q.metric
  let μ := riemannianVolumeMeasure I M g
  let A := fun x => normSq0S g x 2 (metricRicciAt g x)
  let S := fun x => metricScalarAt g x ^ 2
  have hAcont : Continuous A := by
    simpa only [A, metricRicci_apply] using normSq0S_cont g (metricRicci g)
  have hScont : Continuous S := (metricScalar_smooth g).continuous.pow 2
  let : IsFiniteMeasureOnCompacts μ := riemannianVolumeMeasure_isFiniteMeasureOnCompacts g
  have hA : Integrable A μ := hAcont.integrable_of_hasCompactSupport (HasCompactSupport.of_compactSpace _)
  have hS : Integrable S μ := hScont.integrable_of_hasCompactSupport (HasCompactSupport.of_compactSpace _)
  have hD : bourRicci q = (∫ x, A x ∂μ) - bourScalar q / 4 := by
    rw [bourRicci_eq_integral, bourScalar_eq_integral]
    calc
      _ = ∫ x, A x - S x / 4 ∂μ := by
        apply integral_congr_ae
        exact ae_of_all _ fun x => by
          dsimp only [intrinsicTraceFreeRicciSq, intrinsicCurvatureSq, intrinsicEulerDensity, A, S, g]
          ring
      _ = _ := by rw [integral_sub hA (hS.div_const 4), integral_div]
  have hInt : (∫ x, bourBulkDensity α g x ∂μ) =
      (∫ x, A x ∂μ) / 2 + (α - 4) * (∫ x, S x ∂μ) / 24 := by
    change (∫ x, A x / 2 + (α - 4) * S x / 24 ∂μ) = _
    rw [integral_add (hA.div_const 2) ((hS.const_mul (α - 4)).div_const 24),
      integral_div, integral_div, integral_const_mul]
  calc
    bourEnergy α q = (1 - α) * bourEuler q + bourRicci q / 2 - (1 - α) * bourScalar q / 24 := by
      rw [bourEnergy_eq_chiral_ricci, bourEuler_eq_charges]
      ring
    _ = _ := by
      rw [hD, bourScalar_eq_integral, hInt]
      change (1 - α) * bourEuler q + ((∫ x, A x ∂μ) - (∫ x, S x ∂μ) / 4) / 2 -
        (1 - α) * (∫ x, S x ∂μ) / 24 =
        (1 - α) * bourEuler q + ((∫ x, A x ∂μ) / 2 + (α - 4) * (∫ x, S x ∂μ) / 24)
      ring

omit [T2Space M] [CompactSpace M] [I.Boundaryless] [BoundarylessManifold I M] in
private theorem slabNormSq_contMDiffOn_of_chartComponents
    (g : ℝ → SmoothRiemannianMetric I M) {D : RealTimeInterval}
    (hG : MetricFamilySmoothOn (I := I) D g) {s : ℕ}
    (A : (t : ℝ) → (x : M) → Tensor0SSpace (𝕜 := ℝ) s I x)
    (hA : ∀ (x : M) (K : Fin s → Fin (Module.finrank ℝ E)) {t : ℝ}, t ∈ D.regular →
      ContMDiffAt (𝓘(ℝ, ℝ).prod I) 𝓘(ℝ, ℝ) ∞
        (fun p : ℝ × M => A p.1 p.2 (fun a => chartBasisVecFiber x (K a) p.2)) (t, x)) :
    ContMDiffOn (𝓘(ℝ, ℝ).prod I) 𝓘(ℝ, ℝ) ∞
      (fun p : ℝ × M => normSq0S (g p.1) p.2 s (A p.1 p.2)) (D.regular ×ˢ (univ : Set M)) := by
  rintro ⟨t, x⟩ ⟨ht, -⟩
  let U := (trivializationAt E (TangentSpace I) x).baseSet
  have hx : x ∈ U := FiberBundle.mem_baseSet_trivializationAt' x
  have hN : D.regular ×ˢ U ∈ 𝓝 (t, x) :=
    (D.regular_isOpen.prod (trivializationAt E (TangentSpace I) x).open_baseSet).mem_nhds ⟨ht, hx⟩
  have hInv (i j : Fin (Module.finrank ℝ E)) :
      ContMDiffAt (𝓘(ℝ, ℝ).prod I) 𝓘(ℝ, ℝ) ∞
        (fun p : ℝ × M => chartInvGramMatrix (I := I) (g p.1) x p.2 i j) (t, x) := by
    have h := (hG.chartInvGramMatrix_jointContMDiffOn g x i j).comp
      (contMDiffOn_snd.prodMk contMDiffOn_fst : ContMDiffOn (𝓘(ℝ, ℝ).prod I)
        (I.prod 𝓘(ℝ, ℝ)) ∞ (fun p : ℝ × M => (p.2, p.1)) (D.regular ×ˢ U))
      (fun p hp => ⟨hp.2, hp.1⟩)
    exact (h (t, x) ⟨ht, hx⟩).contMDiffAt hN
  let C (K : Fin s → Fin (Module.finrank ℝ E)) (p : ℝ × M) :=
    A p.1 p.2 (fun a => chartBasisVecFiber x (K a) p.2)
  have hSum : ContMDiffAt (𝓘(ℝ, ℝ).prod I) 𝓘(ℝ, ℝ) ∞
      (fun p : ℝ × M => ∑ K : Fin s → Fin (Module.finrank ℝ E),
        ∑ L : Fin s → Fin (Module.finrank ℝ E),
          (∏ a : Fin s, chartInvGramMatrix (g p.1) x p.2 (K a) (L a)) *
            C K p * C L p) (t, x) := by
    refine ContMDiffAt.sum fun K _ => ContMDiffAt.sum fun L _ => ?_
    exact ((ContMDiffAt.prod fun a _ => hInv (K a) (L a)).mul (hA x K ht)).mul (hA x L ht)
  refine (hSum.congr_of_eventuallyEq ?_).contMDiffWithinAt
  filter_upwards [hN] with p hp
  rw [normSq0S_eq_coord (g p.1) p.2 s (chartBasisFamily x hp.2)
    (fun i j => chartInvGramMatrix (g p.1) x p.2 i j)
    (chartInvGram_inverse (g p.1) x hp.2)]
  unfold coordInner0S
  refine Finset.sum_congr rfl fun K _ => Finset.sum_congr rfl fun L _ => ?_
  simp only [tensor0SComponent_apply, chartBasisFamily_apply, C]

omit [CompactSpace M] in
/-- Smoothness of the displayed intrinsic density on the regular part of
a genuine smooth metric family. This uses only Ricci and scalar jets. -/
theorem bourBulkDensity_contMDiffOn (α : ℝ)
    (g : ℝ → SmoothRiemannianMetric I M) {D : RealTimeInterval}
    (hG : MetricFamilySmoothOn (I := I) D g) :
    ContMDiffOn (𝓘(ℝ, ℝ).prod I) 𝓘(ℝ, ℝ) ∞
      (fun p : ℝ × M => bourBulkDensity α (g p.1) p.2) (D.regular ×ˢ (univ : Set M)) := by
  have hGram := chartGramMatrix_joint_contMDiffOn g D.regular
    (hG.metricCLMSection_contMDiffOn (J := D.regular) Subset.rfl)
  have hGramWithin x := chartGramFamilySmoothWithinOn_of_contMDiffOn g x (hGram x)
  have hChartN (t : ℝ) (x : M) (ht : t ∈ D.regular) :
      D.regular ×ˢ (chartAt H x).source ∈ 𝓝 (t, x) :=
    (D.regular_isOpen.prod (chartAt H x).open_source).mem_nhds ⟨ht, mem_chart_source H x⟩
  have hRic := slabNormSq_contMDiffOn_of_chartComponents g hG
    (fun t x => metricRicciAt (g t) x) ?_
  · rintro ⟨t, x⟩ ⟨ht, hu⟩
    have hX : x ∈ (chartAt H x).source := mem_chart_source H x
    have hSc : ContMDiffAt (𝓘(ℝ, ℝ).prod I) 𝓘(ℝ, ℝ) ∞
        (fun p : ℝ × M => metricScalarAt (g p.1) p.2) (t, x) := by
      have hExt : extChartAt I x x ∈ interior (extChartAt I x).target := by
        rw [(isOpen_extChartAt_target (I := I) x).interior_eq]
        exact (extChartAt I x).map_source (by simpa only [extChartAt_source] using hX)
      have hCoord := scalarOnE_contDiffOn_of_chartGramFamilySmoothWithinOn g x (hGramWithin x)
      have hLocal := joint_chart_comp_contMDiffWithinAt (I := I) x
        (fun s y => scalarOnE (I := I) x (metricScalarAt (g s)) y)
        (hCoord (t, extChartAt I x x) ⟨ht, hExt⟩) hX
      refine (hLocal.contMDiffAt (hChartN t x ht)).congr_of_eventuallyEq ?_
      filter_upwards [hChartN t x ht] with p hp
      change metricScalarAt (g p.1) p.2 =
        metricScalarAt (g p.1) ((extChartAt I x).symm (extChartAt I x p.2))
      rw [(extChartAt I x).left_inv (by simpa only [extChartAt_source] using hp.2)]
    exact ((hRic (t, x) ⟨ht, hu⟩).div_const 2).add
      ((contMDiffWithinAt_const.mul (hSc.contMDiffWithinAt.pow 2)).div_const 24)

  · intro x K t ht
    have hX : x ∈ (chartAt H x).source := mem_chart_source H x
    have hLocal := chartRicciTensor_comp_extChartAt_contMDiffWithinAt g x (hGramWithin x)
      (K 0) (K 1) ht hX
    refine (hLocal.contMDiffAt (hChartN t x ht)).congr_of_eventuallyEq ?_
    filter_upwards [hChartN t x ht] with p hp
    have hVec : (fun a : Fin 2 => chartBasisVecFiber (I := I) x (K a) p.2) =
        vec2 (chartBasisVecFiber (I := I) x (K 0) p.2)
          (chartBasisVecFiber (I := I) x (K 1) p.2) := by
      funext i
      fin_cases i <;> rfl
    have hGood : p.2 ∈ chartLeviCivitaGoodSet (I := I) x :=
      (mem_chartLeviCivitaGoodSet_iff_mem_extChartAt_source (I := I) x p.2).2
        (by simpa only [extChartAt_source] using hp.2)
    rw [hVec, metricRicciAt_apply_eq_ricciTensor,
      ricciTensor_chartBasisVec_alpha_eq (g p.1) x (K 0) (K 1) hGood]

/-- The actual first derivative, prior to spatial integration by parts,
with the speed and the varying Riemannian volume included. -/
theorem bourEnergy_hasDerivAt_intrinsic (q : ℝ → SignedCollarMetric o) (α C : ℝ)
    {D : RealTimeInterval} (hG : MetricFamilySmoothOn (I := I) D (fun s => (q s).metric))
    {t : ℝ} (ht : t ∈ D.regular)
    (hEuler : ∀ s ∈ D.regular, bourEuler (q s) = C)
    (K : (x : M) → Tensor0SSpace (𝕜 := ℝ) 2 I x)
    (hK : ∀ x, HasDerivAt (fun s => metricTensorField (q s).metric x) (K x) t) :
    HasDerivAt (fun s => bourEnergy α (q s))
      (∫ x, (deriv (fun s => bourBulkDensity α (q s).metric x) t +
        (1 / 2) * inner0S (q t).metric x 2 (K x) (metricTensorField (q t).metric x) *
          bourBulkDensity α (q t).metric x)
        ∂riemannianVolumeMeasure I M (q t).metric) t := by
  let g := fun s => (q s).metric
  have hGram := chartGramMatrix_joint_contMDiffOn g D.regular
    (hG.metricCLMSection_contMDiffOn (J := D.regular) Subset.rfl)
  have hd := first_var_joint (g_fam := g) (f := fun s => bourBulkDensity α (g s))
    D.regular_isOpen ht hGram (bourBulkDensity_contMDiffOn α g hG)
  simp only [riemannianMeasureFamily_def, traceTimeDerivMetric_eq_inner_of_velocity g t _ _ (hK _)] at hd
  apply (hd.const_add ((1 - α) * C)).congr_of_eventuallyEq
  filter_upwards [D.regular_isOpen.mem_nhds ht] with s hs
  rw [bourEnergy_eq_integral_bulk, hEuler s hs]


omit [T2Space M] [CompactSpace M] [I.Boundaryless] [BoundarylessManifold I M] in
/-- The actual covariant speed exists at every regular time of the smooth
metric family, independently of the fourth-order equation. -/
theorem bourMetric_hasDerivAt_regular (g : ℝ → SmoothRiemannianMetric I M)
    {D : RealTimeInterval} (hG : MetricFamilySmoothOn (I := I) D g)
    {t : ℝ} (ht : t ∈ D.regular) (x : M) :
    HasDerivAt (fun s => metricTensorField (g s) x)
      (deriv (fun s => metricTensorField (g s) x) t) t := by
  have hm := metricTensorField_contDiffOn_time g D.regular
    (hG.metricCLMSection_contMDiffOn (J := D.regular) Subset.rfl) x
  exact ((hm.contDiffAt (D.regular_isOpen.mem_nhds ht)).differentiableAt (by simp)).hasDerivAt

/-- The native covariant field equal to the gradient on a flow with
velocity minus twice the gradient. -/
def bourHalfNegativeVelocity (g : ℝ → SmoothRiemannianMetric I M) (t : ℝ) (x : M) :
    Tensor0SSpace (𝕜 := ℝ) 2 I x :=
  (-(1 / 2) : ℝ) • deriv (fun s => metricTensorField (g s) x) t

omit [I.Boundaryless] [BoundarylessManifold I M] in
/-- The physical square of half the metric velocity is continuous after
spatial integration in the actual time-slice volume. -/
theorem bourVelocityGradientSq_continuousOn_regular (g : ℝ → SmoothRiemannianMetric I M)
    {D : RealTimeInterval} (hG : MetricFamilySmoothOn (I := I) D g) :
    ContinuousOn (fun t => gradientSq (g t) (bourHalfNegativeVelocity g t)) D.regular := by
  have hGram := chartGramMatrix_joint_contMDiffOn g D.regular
    (hG.metricCLMSection_contMDiffOn (J := D.regular) Subset.rfl)
  have hNorm := slabNormSq_contMDiffOn_of_chartComponents g hG (bourHalfNegativeVelocity g) ?_
  · intro t ht
    have h := first_var_joint (g_fam := g)
      (f := fun s x => normSq0S (g s) x 2 (bourHalfNegativeVelocity g s x))
      D.regular_isOpen ht hGram hNorm
    exact h.continuousAt.continuousWithinAt
  · intro x K t ht
    let U := (trivializationAt E (TangentSpace I) x).baseSet
    have hx : x ∈ U := FiberBundle.mem_baseSet_trivializationAt' x
    have hN : D.regular ×ˢ U ∈ 𝓝 (t, x) :=
      (D.regular_isOpen.prod (trivializationAt E (TangentSpace I) x).open_baseSet).mem_nhds ⟨ht, hx⟩
    have hEntry := (hGram x (K 0) (K 1) (t, x) ⟨ht, hx⟩).contMDiffAt hN
    have hTimeDeriv := DifferentialGeometry.contMDiffAt_partial_deriv_fst (m := ∞) hEntry (by simp)
    have hConst : ContMDiffAt (𝓘(ℝ, ℝ).prod I) 𝓘(ℝ, ℝ) ∞
        (fun _ : ℝ × M => (-(1 / 2) : ℝ)) (t, x) := contMDiffAt_const
    refine (hConst.mul hTimeDeriv).congr_of_eventuallyEq ?_
    filter_upwards [hN] with p hp
    change bourHalfNegativeVelocity g p.1 p.2 (fun a => chartBasisVecFiber x (K a) p.2) =
      (-(1 / 2) : ℝ) * deriv (fun s => chartGramMatrix (g s) x p.2 (K 0) (K 1)) p.1
    have hVec : (fun a : Fin 2 => chartBasisVecFiber (I := I) x (K a) p.2) =
        vec2 (chartBasisVecFiber x (K 0) p.2) (chartBasisVecFiber x (K 1) p.2) := by
      funext i
      fin_cases i <;> rfl
    have hVel := bourMetric_hasDerivAt_regular g hG hp.1 p.2
    rw [hVec, (chartGram_hasDerivAt_of_velocity g p.1 x p.2 (K 0) (K 1) _ hVel).deriv]
    rfl

omit [I.Boundaryless] [BoundarylessManifold I M] in
/-- On a closed regular slab the gradient-square integral is interval
integrable from the velocity equation on the open slab. In Lebesgue time
the values at its two endpoints need no velocity equation. -/
theorem bourGradientSq_intervalIntegrable_on_regularSlab (g : ℝ → SmoothRiemannianMetric I M)
    {D : RealTimeInterval} (hG : MetricFamilySmoothOn (I := I) D g)
    {a b : ℝ} (hab : a ≤ b) (hTime : Icc a b ⊆ D.regular)
    (G : ℝ → (x : M) → Tensor0SSpace (𝕜 := ℝ) 2 I x)
    (hVelocity : ∀ t ∈ Ioo a b, ∀ x,
      HasDerivAt (fun s => metricTensorField (g s) x) ((-2 : ℝ) • G t x) t) :
    IntervalIntegrable (fun t => gradientSq (g t) (G t)) volume a b := by
  have hInt : IntervalIntegrable (fun t => gradientSq (g t) (bourHalfNegativeVelocity g t)) volume a b :=
    ContinuousOn.intervalIntegrable_of_Icc hab ((bourVelocityGradientSq_continuousOn_regular g hG).mono hTime)
  apply hInt.congr_uIoo
  rw [uIoo_of_le hab]
  intro t ht
  have hEq (x : M) : bourHalfNegativeVelocity g t x = G t x := by
    calc
      _ = (-(1 / 2) : ℝ) • ((-2 : ℝ) • G t x) :=
        congrArg (fun K : Tensor0SSpace (𝕜 := ℝ) 2 I x => (-(1 / 2) : ℝ) • K)
          (hVelocity t ht x).deriv
      _ = _ := by rw [smul_smul]; norm_num
  exact congrArg (gradientSq (g t)) (funext hEq)

/-- Energy and volume are continuous at every time in the open regular
carrier. An endpoint outside that carrier still needs its own continuity. -/
theorem bourEnergy_volume_continuousOn_regular (q : ℝ → SignedCollarMetric o) (α C : ℝ)
    {D : RealTimeInterval} (hG : MetricFamilySmoothOn (I := I) D (fun s => (q s).metric))
    (hEuler : ∀ s ∈ D.regular, bourEuler (q s) = C) :
    ContinuousOn (fun s => bourEnergy α (q s)) D.regular ∧
    ContinuousOn (fun s => (riemannianVolumeMeasure I M (q s).metric).real univ) D.regular := by
  let g := fun s => (q s).metric
  have hVel (t : ℝ) (ht : t ∈ D.regular) :=
    bourMetric_hasDerivAt_regular g hG ht
  constructor
  · intro t ht
    exact (bourEnergy_hasDerivAt_intrinsic q α C hG ht hEuler _ (hVel t ht)).continuousAt.continuousWithinAt
  · intro t ht
    have hGram := chartGramMatrix_joint_contMDiffOn g D.regular
      (hG.metricCLMSection_contMDiffOn (J := D.regular) Subset.rfl)
    exact (bourVolume_hasDerivAt_of_velocity D.regular_isOpen ht hGram _ (hVel t ht)).continuousAt.continuousWithinAt

/-- The finite slab gives both physical conclusions once the variational
pairing is identified on the evolving family and its actual scale path.
The localization and scale energy derivative are supplied by the geometry
above. Endpoint continuity and time-integrability are expressed on the
chosen slab. -/
theorem bourOriginal_slab_of_pairings (q : ℝ → SignedCollarMetric o) (α : ℝ)
    {D : RealTimeInterval} (hG : MetricFamilySmoothOn (I := I) D (fun s => (q s).metric))
    {a b : ℝ} (hab : a ≤ b) (hTime : Ioo a b ⊆ D.regular)
    (hEuler : ∀ t ∈ D.regular, bourEuler (q t) = 16 * Real.pi ^ 2)
    (G : ℝ → (x : M) → Tensor0SSpace (𝕜 := ℝ) 2 I x)
    (hVelocity : ∀ t ∈ Ioo a b, ∀ x, HasDerivAt (fun s => metricTensorField (q s).metric x)
      ((-2 : ℝ) • G t x) t)
    (hFCont : ContinuousOn (fun s => bourEnergy α (q s)) (Icc a b))
    (hVCont : ContinuousOn (fun s => (riemannianVolumeMeasure I M (q s).metric).real univ) (Icc a b))
    (hInt : IntervalIntegrable (fun t => gradientSq (q t).metric (G t)) volume a b)
    (hBulkPairing : ∀ t ∈ Ioo a b,
      (∫ x, (deriv (fun s => bourBulkDensity α (q s).metric x) t +
        (1 / 2) * inner0S (q t).metric x 2 ((-2 : ℝ) • G t x)
          (metricTensorField (q t).metric x) * bourBulkDensity α (q t).metric x)
        ∂riemannianVolumeMeasure I M (q t).metric) =
      ∫ x, inner0S (q t).metric x 2 (G t x)
        (deriv (fun s => metricTensorField (q s).metric x) t)
        ∂riemannianVolumeMeasure I M (q t).metric)
    (hScalePairing : ∀ t ∈ Ioo a b, HasDerivAt (fun s => bourEnergy α (bourScalePath (q t) s))
      (∫ x, inner0S (q t).metric x 2 (G t x)
        (deriv (fun s => metricTensorField (bourScalePath (q t) s).metric x) 1)
        ∂riemannianVolumeMeasure I M (q t).metric) 1) :
    (riemannianVolumeMeasure I M (q b).metric).real univ =
      (riemannianVolumeMeasure I M (q a).metric).real univ ∧
    bourEnergy α (q b) ≤ bourEnergy α (q a) ∧
    (∫ t in a..b, gradientSq (q t).metric (G t)) =
      (bourEnergy α (q a) - bourEnergy α (q b)) / 2 := by
  let g := fun s => (q s).metric
  have hGram := chartGramMatrix_joint_contMDiffOn g D.regular
    (hG.metricCLMSection_contMDiffOn (J := D.regular) Subset.rfl)
  have hVolume := bourVolume_constant_on_slab g D.regular_isOpen hab hTime hGram hVCont G hVelocity
    (fun t ht => bourScalePath_pairing_eq_zero (q t) α (G t) (hScalePairing t ht))
  refine ⟨hVolume, original_gradient_sublevel q α a b G hab hFCont hVelocity ?_ hInt⟩
  intro t ht
  exact (bourEnergy_hasDerivAt_intrinsic q α _ hG (hTime ht)
    hEuler _ (hVelocity t ht)).congr_deriv (hBulkPairing t ht)

/-- On a closed slab contained in the regular time carrier, smoothness
provides endpoint continuity and integrability of the physical dissipation.
The two first-variation pairings use one supplying gradient. -/
theorem bourOriginal_regularSlab_of_pairings (q : ℝ → SignedCollarMetric o) (α : ℝ)
    {D : RealTimeInterval} (hG : MetricFamilySmoothOn (I := I) D (fun s => (q s).metric))
    {a b : ℝ} (hab : a ≤ b) (hTime : Icc a b ⊆ D.regular)
    (hEuler : ∀ t ∈ D.regular, bourEuler (q t) = 16 * Real.pi ^ 2)
    (G : ℝ → (x : M) → Tensor0SSpace (𝕜 := ℝ) 2 I x)
    (hVelocity : ∀ t ∈ Ioo a b, ∀ x, HasDerivAt (fun s => metricTensorField (q s).metric x)
      ((-2 : ℝ) • G t x) t)
    (hBulkPairing : ∀ t ∈ Ioo a b,
      (∫ x, (deriv (fun s => bourBulkDensity α (q s).metric x) t +
        (1 / 2) * inner0S (q t).metric x 2 ((-2 : ℝ) • G t x)
          (metricTensorField (q t).metric x) * bourBulkDensity α (q t).metric x)
        ∂riemannianVolumeMeasure I M (q t).metric) =
      ∫ x, inner0S (q t).metric x 2 (G t x)
        (deriv (fun s => metricTensorField (q s).metric x) t)
        ∂riemannianVolumeMeasure I M (q t).metric)
    (hScalePairing : ∀ t ∈ Ioo a b, HasDerivAt (fun s => bourEnergy α (bourScalePath (q t) s))
      (∫ x, inner0S (q t).metric x 2 (G t x)
        (deriv (fun s => metricTensorField (bourScalePath (q t) s).metric x) 1)
        ∂riemannianVolumeMeasure I M (q t).metric) 1) :
    (riemannianVolumeMeasure I M (q b).metric).real univ =
      (riemannianVolumeMeasure I M (q a).metric).real univ ∧
    bourEnergy α (q b) ≤ bourEnergy α (q a) ∧
    (∫ t in a..b, gradientSq (q t).metric (G t)) =
      (bourEnergy α (q a) - bourEnergy α (q b)) / 2 := by
  obtain ⟨hF, hV⟩ := bourEnergy_volume_continuousOn_regular q α _ hG hEuler
  have hInt := bourGradientSq_intervalIntegrable_on_regularSlab
    (fun t => (q t).metric) hG hab hTime G hVelocity
  exact bourOriginal_slab_of_pairings q α hG hab (Ioo_subset_Icc_self.trans hTime)
    hEuler G hVelocity (hF.mono hTime) (hV.mono hTime) hInt hBulkPairing hScalePairing

end Closed

end
end SmoothPoincare.Bour
