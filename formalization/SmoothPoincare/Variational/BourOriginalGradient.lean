import SmoothPoincare.Variational.BourConformalTrace
import SmoothPoincare.Variational.BourPalatiniVariation
import SmoothPoincare.Variational.BourScalePathRegularity
import SmoothPoincare.Variational.BourMetricContractions

/-! # Adjoint of the complete Ricci variation on a closed Bour time slice

Prepared for Edward B. Baker III with OpenAI Codex assistance, 26 November 2026.
All contractions and integrals use the original slice metric.
-/

open Bundle DifferentialGeometry DifferentialGeometry.Analysis.Elliptic DifferentialGeometry.Geometry.Connection
  DifferentialGeometry.Geometry.Curvature DifferentialGeometry.Geometry.Operator
  DifferentialGeometry.Integral.Measure DifferentialGeometry.PDE.RicciFlow
  DifferentialGeometry.Tensor0SBundle DifferentialGeometry.Tensor.RSTensor
  DifferentialGeometry.Tensor.Coordinates DifferentialGeometry.Integral.DivergenceTheorem
  DifferentialGeometry.Geometry.Metric FirstOrderTwistor Filter MeasureTheory
open scoped ContDiff Manifold Topology

namespace SmoothPoincare.Bour

noncomputable section

variable {E H M : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
  [FiniteDimensional ℝ E] [NeZero (Module.finrank ℝ E)] [TopologicalSpace H]
  {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [T2Space M] [CompactSpace M] [BoundarylessManifold I M]

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

/-- Differential part of the Ricci adjoint arising from the divergence of
the Koszul flux. Its crossed terms retain the derivative order. -/
def bourRicciFluxAdjoint (g : SmoothRiemannianMetric I M)
    (A : Tensor0SField (I := I) (M := M) ∞ 2) : Tensor0SField (I := I) (M := M) ∞ 2 :=
  let e := (Equiv.swap (0 : Fin 3) 1).trans (Equiv.swap (0 : Fin 3) 2)
  (1 / 2 : ℝ) • (covDiv0SField g (Tensor0SField.domDomCongr ∞ e.symm (metricNabla0S g A)) +
    covDiv0SField g (Tensor0SField.domDomCongr ∞ (Equiv.swap (0 : Fin 3) 2).symm (metricNabla0S g A)) -
    roughLap0SField g A)

omit [NeZero (Module.finrank ℝ E)] [I.Boundaryless] [T2Space M] [CompactSpace M]
  [BoundarylessManifold I M] in
/-- Scalar trace pairing represented in the same rank-two fiber as the
native speed. -/
private theorem scalarTrace_pair (g : SmoothRiemannianMetric I M)
    (K : Tensor0SField (I := I) (M := M) ∞ 2) (x : M) (f : Tensor0SSpace 0 I x) :
    inner0S g x 0 f (metricTraceFirstTwoField (s := 0) g K x) =
      inner0S g x 2 ((f Fin.elim0) • metricTensorField g x) (K x) := by
  let b := coordinateFrameAtToBasis (I := I) x
  let a := fun i j => inverseMetricFlatModelInChartComponent (I := I) g x i j (extChartAt I x x)
  have ha : MetricInverseInBasis g x b a :=
    DifferentialGeometry.Tensor.Coordinates.inverseMetricFlatModelInChart_metricInverseInBasis_center g x
  rw [inner0S_eq_coord g x 0 b a ha]
  unfold coordInner0S tensor0SComponent
  simp only [Finset.univ_unique, Finset.univ_eq_empty, Finset.prod_empty, one_mul,
    Finset.sum_singleton]
  have hemp (w : Fin 0 → TangentSpace I x) : w = Fin.elim0 := Subsingleton.elim _ _
  simp only [hemp, inner0S_smul_left]
  congr 1
  have hm : metricTensorField g x = metricTensor0S g x := by
    ext v
    simp only [metricTensor0S_apply, metricTensorField_apply]
  rw [hm]
  change _ = metricTracePair0SAt g (K x)
  rw [metricTraceFirstTwoField_apply, metricTraceFirstTwo0STensor_apply,
    metricTraceFirstTwo0SAt_eq_sum_basis g b a ha, metricTracePair0SAt_eq_sum_basis g b a ha]
  unfold metricTrace0S2InBasis
  apply Finset.sum_congr rfl
  intro i _
  apply Finset.sum_congr rfl
  intro j _
  congr 2
  funext k
  fin_cases k <;> rfl

omit [NeZero (Module.finrank ℝ E)] [I.Boundaryless] [CompactSpace M] [BoundarylessManifold I M] in
private theorem bourRicciWeight_swap (α : ℝ) (g : SmoothRiemannianMetric I M) :
    Tensor0SField.domDomCongr ∞ (Equiv.swap (0 : Fin 2) 1).symm (bourRicciWeight α g) =
      bourRicciWeight α g := by
  ext x w
  rw [Tensor0SField.domDomCongr_apply, Tensor0SSpace.domDomCongr_apply]
  have hs : (fun i => w ((Equiv.swap (0 : Fin 2) 1).symm i)) = vec2 (I := I) (w 1) (w 0) := by
    funext i; fin_cases i <;> rfl
  have hw : w = vec2 (I := I) (w 0) (w 1) := by funext i; fin_cases i <;> rfl
  rw [hs]
  conv_rhs => rw [hw]
  change metricRicciAt g x (vec2 (w 1) (w 0)) + (α-4)/12 * (metricScalarAt g x *
    g.inner x (w 1) (w 0)) = metricRicciAt g x (vec2 (w 0) (w 1)) +
    (α-4)/12 * (metricScalarAt g x * g.inner x (w 0) (w 1))
  rw [metricRicciAt_symm g x (w 1) (w 0), g.symm x (w 1) (w 0)]

/-- The complete differential part of the first variation, on the original
family, after transferring both derivatives from each connection term. -/
theorem bourWeightedPalatini_secondAdjoint (α : ℝ) (g : ℝ → SmoothRiemannianMetric I M)
    {D : RealTimeInterval} (hG : MetricFamilySmoothOn (I := I) D g)
    {t : ℝ} (ht : t ∈ D.regular) :
    let K := bourMetricVelocity g hG ht
    let A := bourRicciWeight α (g t)
    bourClosedTensorPairing (g t) (bourRicciVelocity (g t) K) A =
      bourClosedTensorPairing (g t) (bourRicciFluxAdjoint (g t) A) K -
      (1 / 2 : ℝ) * bourClosedTensorPairing (g t) (covDiv0SField (g t) (covDiv0SField (g t) A))
        (metricTraceFirstTwoField (s := 0) (g t) K) := by
  dsimp only
  rw [bourRicciVelocity, bourClosedTensorPairing_sub, bourClosedTensorPairing_permute,
    bourRicciWeight_swap, bourKoszulTrace_native_secondAdjoint]
  exact congrArg (fun z : ℝ => z - _) (bourWeightedRicciKoszul_secondAdjoint α (g t) _)

/-- The twice-diverged weight, multiplied back into the metric. This
represents the adjoint of the variation of the connection trace. -/
def bourRicciTraceAdjoint (g : SmoothRiemannianMetric I M)
    (A : Tensor0SField (I := I) (M := M) ∞ 2) : Tensor0SField (I := I) (M := M) ∞ 2 :=
  let f := covDiv0SField g (covDiv0SField g A)
  tensor0SFieldSmulByFun ∞ (Tensor0SField.toScalarField ∞ f)
    (Tensor0SField.toScalarField_contMDiff ∞ inferInstance f) (metricTensorField g)

omit [NeZero (Module.finrank ℝ E)] [I.Boundaryless] [BoundarylessManifold I M] in
private theorem bourRicciTraceAdjoint_pair (g : SmoothRiemannianMetric I M)
    (A K : Tensor0SField (I := I) (M := M) ∞ 2) :
    bourClosedTensorPairing g (covDiv0SField g (covDiv0SField g A))
      (metricTraceFirstTwoField (s := 0) g K) =
      bourClosedTensorPairing g (bourRicciTraceAdjoint g A) K := by
  apply integral_congr_ae
  filter_upwards [] with x
  exact scalarTrace_pair g K x _

/-- Symmetric projection in the two free metric slots. -/
def bourSymmetricPart (A : Tensor0SField (I := I) (M := M) ∞ 2) :
    Tensor0SField (I := I) (M := M) ∞ 2 :=
  (1 / 2 : ℝ) • (A + Tensor0SField.domDomCongr ∞ (Equiv.swap (0 : Fin 2) 1) A)

omit [NeZero (Module.finrank ℝ E)] [I.Boundaryless] [T2Space M] [CompactSpace M]
  [BoundarylessManifold I M] in
theorem bourSymmetricPart_symm (A : Tensor0SField (I := I) (M := M) ∞ 2)
    (x : M) (u v : TangentSpace I x) :
    bourSymmetricPart A x (vec2 u v) = bourSymmetricPart A x (vec2 v u) := by
  have h (a b : TangentSpace I x) :
      (fun i => (vec2 (I := I) a b) ((Equiv.swap (0 : Fin 2) 1) i)) = vec2 b a := by
    funext i; fin_cases i <;> rfl
  simp only [bourSymmetricPart, ContMDiffSection.coe_smul, ContMDiffSection.coe_add,
    Pi.smul_apply, Pi.add_apply, Tensor0SSpace.smul_apply, Tensor0SSpace.add_apply,
    Tensor0SField.domDomCongr_apply, Tensor0SSpace.domDomCongr_apply, h]
  rw [add_comm]

/-- The physical gradient in divergence form, including both inverse-metric
slots, variation of the scalar trace, and variation of the volume. -/
def bourCovariantGradient (α : ℝ) (g : SmoothRiemannianMetric I M) :
    Tensor0SField (I := I) (M := M) ∞ 2 :=
  let A := bourRicciWeight α g
  bourSymmetricPart (bourRicciFluxAdjoint g A -
    (1 / 2 : ℝ) • bourRicciTraceAdjoint g A + bourBulkMetricCorrection α g)

omit [I.Boundaryless] [BoundarylessManifold I M] in
private theorem bourSymmetricPart_native_pair (g : ℝ → SmoothRiemannianMetric I M)
    {D : RealTimeInterval} (hG : MetricFamilySmoothOn (I := I) D g)
    {t : ℝ} (ht : t ∈ D.regular) (U : Tensor0SField (I := I) (M := M) ∞ 2) :
    let K := bourMetricVelocity g hG ht
    bourClosedTensorPairing (g t) (bourSymmetricPart U) K = bourClosedTensorPairing (g t) U K := by
  let K := bourMetricVelocity g hG ht
  have hswap : Tensor0SField.domDomCongr ∞ (Equiv.swap (0 : Fin 2) 1).symm K = K := by
    ext x w
    rw [Tensor0SField.domDomCongr_apply, Tensor0SSpace.domDomCongr_apply]
    have hs : (fun i => w ((Equiv.swap (0 : Fin 2) 1).symm i)) = vec2 (I := I) (w 1) (w 0) := by
      funext i; fin_cases i <;> rfl
    have hw : w = vec2 (I := I) (w 0) (w 1) := by funext i; fin_cases i <;> rfl
    rw [hs]
    conv_rhs => rw [hw]
    exact bourMetricVelocity_symm g hG ht x _ _
  change bourClosedTensorPairing (g t) (bourSymmetricPart U) K = _
  rw [bourSymmetricPart, bourClosedTensorPairing_smul, bourClosedTensorPairing_add,
    bourClosedTensorPairing_permute, hswap]
  ring

variable {o : ManifoldOrientation I M 4}

/-- The covariant symmetric gradient gives the derivative of the original
functional on every regular slice of the signed family with constant Euler
integral. All spatial and moving-metric terms are derived. -/
theorem originalGradient_pairing (q : ℝ → SignedCollarMetric o) (α C : ℝ)
    {D : RealTimeInterval} (hG : MetricFamilySmoothOn (I := I) D (fun s => (q s).metric))
    {t : ℝ} (ht : t ∈ D.regular) (hEuler : ∀ s ∈ D.regular, bourEuler (q s) = C) :
    HasDerivAt (fun s => bourEnergy α (q s))
      (bourClosedTensorPairing (q t).metric (bourCovariantGradient α (q t).metric)
        (bourMetricVelocity _ hG ht)) t := by
  let g := fun s => (q s).metric
  let K := bourMetricVelocity g hG ht
  let A := bourRicciWeight α (g t)
  have hP (x : M) := (bourMetricRicciAt_hasDerivAt g hG ht x).deriv
  refine (bourEnergy_hasDerivAt_contractions_of_ricciVelocity q α C hG ht hEuler _ hP).congr_deriv ?_
  change bourClosedTensorPairing (g t) A (bourRicciVelocity (g t) K) + _ =
    bourClosedTensorPairing (g t) (bourCovariantGradient α (g t)) K
  rw [bourCovariantGradient, bourSymmetricPart_native_pair g hG ht,
    bourClosedTensorPairing_add, bourClosedTensorPairing_sub, bourClosedTensorPairing_smul,
    bourClosedTensorPairing_symm (g t) A, bourWeightedPalatini_secondAdjoint α g hG ht,
    bourRicciTraceAdjoint_pair]

/-- Constant scaling of any closed metric gives zero integrated trace of
the computed gradient. The scale direction is realized by its own smooth
physical path through the original slice. -/
theorem bourCovariantGradient_integral_trace (q : SignedCollarMetric o) (α : ℝ) :
    ∫ x, inner0S q.metric x 2 (bourCovariantGradient α q.metric x)
      (metricTensorField q.metric x) ∂riemannianVolumeMeasure I M q.metric = 0 := by
  let D := RealTimeInterval.closed 0 2 (by norm_num)
  have ht : (1 : ℝ) ∈ D.regular := ⟨by norm_num, by norm_num⟩
  have hG := bourScalePath_metricFamilySmoothOn q D
  have hF := originalGradient_pairing (bourScalePath q) α (bourEuler q) hG ht
    (fun s _ => bourScalePath_euler_eq q s)
  simp only [bourClosedTensorPairing, bourMetricVelocity_eq_deriv, bourScalePath_metric_one] at hF
  have hK (x : M) := (bourScalePath_hasDerivAt q x).deriv
  have hz := hF.unique (bourScalePath_energy_hasDerivAt q α)
  convert hz using 1
  apply integral_congr_ae
  filter_upwards [] with x
  exact congrArg (fun v => inner0S q.metric x 2 (bourCovariantGradient α q.metric x) v) (hK x).symm

/-- For an original regular solution with velocity equal to negative twice
the computed gradient, volume is constant and the energy drop is twice the
integrated physical gradient norm squared. No spatial pairing is assumed. -/
theorem originalGradient_regularSlab (q : ℝ → SignedCollarMetric o) (α C : ℝ)
    {D : RealTimeInterval} (hG : MetricFamilySmoothOn (I := I) D (fun s => (q s).metric))
    {a b : ℝ} (hab : a ≤ b) (hTime : Set.Icc a b ⊆ D.regular)
    (hEuler : ∀ t ∈ D.regular, bourEuler (q t) = C)
    (hFlow : ∀ t ∈ Set.Ioo a b, ∀ x,
      deriv (fun s => metricTensorField (q s).metric x) t =
        (-2 : ℝ) • bourCovariantGradient α (q t).metric x) :
    (riemannianVolumeMeasure I M (q b).metric).real Set.univ =
      (riemannianVolumeMeasure I M (q a).metric).real Set.univ ∧
    bourEnergy α (q b) ≤ bourEnergy α (q a) ∧
    (∫ t in a..b, gradientSq (q t).metric (bourCovariantGradient α (q t).metric)) =
      (bourEnergy α (q a) - bourEnergy α (q b)) / 2 := by
  let g := fun t => (q t).metric
  let G := fun t x => bourCovariantGradient α (g t) x
  have hInterior := Set.Ioo_subset_Icc_self.trans hTime
  have hv (t : ℝ) (ht : t ∈ Set.Ioo a b) (x : M) :
      HasDerivAt (fun s => metricTensorField (g s) x) ((-2 : ℝ) • G t x) t :=
    (bourMetric_hasDerivAt_regular g hG (hInterior ht) x).congr_deriv (hFlow t ht x)
  obtain ⟨hf, hvol⟩ := bourEnergy_volume_continuousOn_regular q α C hG hEuler
  have hGram := chartGramMatrix_joint_contMDiffOn g D.regular
    (hG.metricCLMSection_contMDiffOn (J := D.regular) Set.Subset.rfl)
  have hvconst := bourVolume_constant_on_slab g D.regular_isOpen hab hInterior hGram
    (hvol.mono hTime) G hv (fun t _ => bourCovariantGradient_integral_trace (q t) α)
  refine ⟨hvconst, original_gradient_sublevel q α a b G hab (hf.mono hTime) hv ?_
    (bourGradientSq_intervalIntegrable_on_regularSlab g hG hab hTime G hv)⟩
  intro t ht
  have h := originalGradient_pairing q α C hG (hInterior ht) hEuler
  simpa only [bourClosedTensorPairing, bourMetricVelocity_eq_deriv] using h

section Four

variable {H₄ M₄ : Type*} [TopologicalSpace H₄] {I₄ : ModelWithCorners ℝ (EuclideanSpace ℝ (Fin 4)) H₄}
  [I₄.Boundaryless] [TopologicalSpace M₄] [ChartedSpace H₄ M₄] [IsManifold I₄ ∞ M₄]
  [T2Space M₄] [CompactSpace M₄] [BoundarylessManifold I₄ M₄] {o₄ : ManifoldOrientation I₄ M₄ 4}

private local instance : MeasurableSpace M₄ := borel M₄
private local instance : BorelSpace M₄ := ⟨rfl⟩

/-- The trace of the computed symmetric tensor agrees pointwise with the
analyst's scalar Laplacian. Only conformal Euler constancy near the tested
metric is required. -/
theorem bourCovariantGradient_trace (q : SignedCollarMetric o₄) (α : ℝ)
    (hEuler : ∀ u : C^∞⟮I₄, M₄; ℝ⟯, ∀ᶠ t : ℝ in 𝓝 0,
      bourEuler (q.conformal (t • u)) = bourEuler q) (x : M₄) :
    inner0S q.metric x 2 (bourCovariantGradient α q.metric x) (metricTensorField q.metric x) =
      -(α / 4) * ΔG q.metric ⟨_, metricScalar_smooth q.metric⟩ x := by
  let G := bourCovariantGradient α q.metric
  apply gradientTrace_eq_scalarLaplacian q α G _ hEuler _ x
  · have h := tensorInnerScalar_contMDiff q.metric 0 2
        (unitScalarRSLiftCₛ (I := I₄) G) (unitScalarRSLiftCₛ (I := I₄) (metricTensorField q.metric))
    convert h using 1
    funext y
    rw [tensorInnerScalar, DifferentialGeometry.TensorMetric.tensorInnerPointwise_eq_inner0S,
      unitScalarRSLiftCₛ_apply, unitScalarRSLiftCₛ_apply,
      unitScalarRSLiftSection_apply_unit, unitScalarRSLiftSection_apply_unit]
  · intro u
    rcases Metric.eventually_nhds_iff.mp (hEuler u) with ⟨δ, hδ, he⟩
    let D := RealTimeInterval.closed (-δ) δ (by linarith)
    have ht : (0 : ℝ) ∈ D.regular := ⟨neg_lt_zero.mpr hδ, hδ⟩
    have he' (s : ℝ) (hs : s ∈ D.regular) :
        bourEuler (q.conformal (s • u)) = bourEuler q := by
      apply he
      rw [Real.dist_eq, sub_zero, abs_lt]
      exact hs
    have h := originalGradient_pairing (fun s => q.conformal (s • u)) α (bourEuler q)
      (bourConformalPath_metricFamilySmoothOn q u D) ht he'
    have hb : (q.conformal ((0 : ℝ) • u)).metric = q.metric := by
      change conformalMetric q.metric ((0 : ℝ) • u) = q.metric
      rw [zero_smul, conformalMetric_zero]
    simpa only [bourClosedTensorPairing, bourMetricVelocity_eq_deriv, hb, G] using h


end Four

end
end SmoothPoincare.Bour
