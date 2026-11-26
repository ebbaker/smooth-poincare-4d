import SmoothPoincare.Variational.SpatialEulerFlux
import DifferentialGeometry.Geometry.Metric.Family.TensorNorm
import DifferentialGeometry.Geometry.Metric.Family.ChartCurvature.Scalar
import DifferentialGeometry.Geometry.Metric.Family.ChartCurvature.ManifoldSmoothness

/-! # Intrinsic normalization of the Euler density -/

open DifferentialGeometry DifferentialGeometry.Geometry.Connection
open DifferentialGeometry.Geometry.Curvature DifferentialGeometry.Tensor0SBundle
open DifferentialGeometry.Tensor.Coordinates DifferentialGeometry.PDE.RicciFlow
open Bundle Filter FirstOrderTwistor Set Manifold
open DifferentialGeometry.Geometry.Operator DifferentialGeometry.CheegerGromovCompactness
open scoped ContDiff Manifold Topology

namespace SmoothPoincare

noncomputable section

section Slice

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]

/-- The normalized scalar Euler density, using the full ordered tensor
norms of the actual Levi-Civita curvature and Ricci tensor. -/
def intrinsicEulerDensity (g : SmoothRiemannianMetric I M) (x : M) : ℝ :=
  normSq0S g x 4 (metricRm04At g x) / 4 - normSq0S g x 2 (metricRicciAt g x) +
    metricScalarAt g x ^ 2 / 4

variable [BoundarylessManifold I M] [T2Space M]

omit [BoundarylessManifold I M] [T2Space M] in
private theorem orientedFrame_identityInvMetric (g : SmoothRiemannianMetric I M)
    (o : ManifoldOrientation I M 4) (x : M) (f : OrientedOrthonormalFrameAt g o x) :
    MetricInverseInBasis g x f.basis (identityInvMetric (Idx := Fin 4)) := by
  intro i j
  constructor <;> simp [identityInvMetric, diagonalInvMetric, f.orthonormal]

/-- The full covariant curvature norm is the sum of squares in any supplied
oriented orthonormal frame, in the project's ordered slot convention. -/
theorem normSq0S_rm04_eq_frameTensorNormSq (g : SmoothRiemannianMetric I M)
    (o : ManifoldOrientation I M 4) (x : M) (f : OrientedOrthonormalFrameAt g o x) :
    normSq0S g x 4 (metricRm04At g x) =
      frameTensorNormSq (metricCurvatureFrameTensor g o x f) := by
  rw [normSq0S_identity_eq_sum_sq _ _ _ _ (orientedFrame_identityInvMetric g o x f),
    sum_fin_succ_fun 3]
  simp_rw [sum_fin_succ_fun 2, sum_fin_two_fun]
  unfold frameTensorNormSq
  apply Finset.sum_congr rfl
  intro a _
  apply Finset.sum_congr rfl
  intro b _
  apply Finset.sum_congr rfl
  intro c _
  apply Finset.sum_congr rfl
  intro d _
  have hSlots : (fun i : Fin 4 => f.basis (Fin.cons (α := fun _ : Fin 4 => Fin 4) a
      (Fin.cons (α := fun _ : Fin 3 => Fin 4) b (fun j : Fin 2 => if j = 0 then c else d)) i)) =
        vec4 (f.basis a) (f.basis b) (f.basis c) (f.basis d) := by
    funext i
    fin_cases i <;> rfl
  rw [component0S_apply, hSlots]
  change metricCurvatureFrameTensor g o x f a b d c ^ 2 =
    metricCurvatureFrameTensor g o x f a b c d ^ 2
  rw [metricCurvatureFrameTensor_swap_last]
  ring

private theorem normSq0S_ricci_eq_frameRicciTensor (g : SmoothRiemannianMetric I M)
    (o : ManifoldOrientation I M 4) (x : M) (f : OrientedOrthonormalFrameAt g o x) :
    normSq0S g x 2 (metricRicciAt g x) =
      ∑ a : Fin 4, ∑ b : Fin 4, frameRicciTensor (metricCurvatureFrameTensor g o x f) a b ^ 2 := by
  rw [normSq0S_identity_eq_sum_sq _ _ _ _ (orientedFrame_identityInvMetric g o x f),
    sum_fin_two_fun]
  rw [Finset.sum_comm]
  apply Finset.sum_congr rfl
  intro a _
  apply Finset.sum_congr rfl
  intro b _
  have hSlots : (fun i : Fin 2 => f.basis (if i = 0 then b else a)) =
    vec2 (f.basis b) (f.basis a) := by
    funext i
    fin_cases i <;> rfl
  rw [component0S_apply, hSlots, metricRicciAt_apply_eq_ricciTensor, frameRicciTensor_metric]

/-- Every supplied oriented orthonormal frame gives the same normalized
Pfaffian, since the right-hand side computes an intrinsic scalar. -/
theorem intrinsicEulerDensity_eq_frameEulerPfaffian
    (g : SmoothRiemannianMetric I M) (o : ManifoldOrientation I M 4)
    (x : M) (f : OrientedOrthonormalFrameAt g o x) :
    intrinsicEulerDensity g x = 2 * frameEulerPfaffian (metricCurvatureFrameTensor g o x f) := by
  rw [intrinsicEulerDensity, normSq0S_rm04_eq_frameTensorNormSq g o x f,
    normSq0S_ricci_eq_frameRicciTensor g o x f]
  rw [frameEulerPfaffian_eq_quadratic _ (metricCurvatureFrameTensor_swap_first g o x f)
    (metricCurvatureFrameTensor_swap_last g o x f)
    (metricCurvatureFrameTensor_pair_symm g o x f)
    (metricCurvatureFrameTensor_bianchi g o x f 0 1 2 3), frameScalarCurvature_metric]

/-- Identify the intrinsic test density with the four frame charge densities
used in the existing Ricci-concentration accounting. -/
theorem intrinsicEulerDensity_eq_modifiedChargeDensity
    (g : SmoothRiemannianMetric I M) (o : ManifoldOrientation I M 4)
    (f : ∀ x, OrientedOrthonormalFrameAt g o x) (x : M) :
    intrinsicEulerDensity g x =
      modifiedChargeDensity o g f .plus x + modifiedChargeDensity o g f .minus x +
      modifiedChargeDensity o g f .scalar x / 24 - modifiedChargeDensity o g f .ricci x / 2 :=
  (intrinsicEulerDensity_eq_frameEulerPfaffian g o x (f x)).trans
    (metricFrameEulerPfaffian_eq_chargeDensity g o f x)

end Slice

section Flow

set_option maxHeartbeats 1000000

variable {E H M : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  {D : RealTimeInterval}

omit [I.Boundaryless] in
/-- Continuity on the full supplied time carrier follows from the actual
continuous curvature tensors, including the endpoint times in the carrier. -/
theorem intrinsicEulerDensity_continuous_carrier (S : SolutionOn (I := I) (M := M) D)
    (hS : IsSolutionOn S) :
    Continuous (fun p : {t : ℝ // t ∈ D.carrier} × M =>
      intrinsicEulerDensity (S.base.metric p.1.val) p.2) := by
  unfold intrinsicEulerDensity
  let g : ℝ → SmoothRiemannianMetric I M := S.base.metric
  let G : (t : ℝ) → (x : M) → Tensor0SSpace 4 I x := fun t x => metricRm04At (g t) x
  let R : (t : ℝ) → (x : M) → Tensor0SSpace 2 I x := fun t x => metricRicciAt (g t) x
  have hRm : tensor0SFamilyContinuousOnSet (I := I) (M := M) 4 D.carrier G := by
    simpa only [G, g, SolutionFamily.rm04, metricRm04_apply] using hS.rm04Cont
  have hRic : tensor0SFamilyContinuousOnSet (I := I) (M := M) 2 D.carrier R := by
    simpa only [R, g, SolutionOn.ricci, SolutionFamily.ricci, metricRicci_apply] using hS.ricciCont
  have hMetric : tensor0SFamilyContinuousOnSet (I := I) (M := M) 2 D.carrier
      (fun t x => metricTensorField (I := I) (g t) x) :=
    hS.smoothMetric.metricTensor_cont
  have hRmSq := continuous_normSq0S_family (I := I) (K := D.carrier) g G hMetric hRm
  have hRicSq := continuous_normSq0S_family (I := I) (K := D.carrier) g R hMetric hRic
  let incl : ↥D.carrier × M → ℝ × M := fun p => (p.1.val, p.2)
  have hIncl : Continuous incl := (continuous_subtype_val.comp continuous_fst).prodMk continuous_snd
  have hInclMaps : MapsTo incl univ (D.carrier ×ˢ (univ : Set M)) :=
    fun p _ => ⟨p.1.property, trivial⟩
  have hSc0 : ContinuousOn (fun p : ℝ × M => metricScalarAt (g p.1) p.2)
      (D.carrier ×ˢ (univ : Set M)) := hS.scalarCont
  have hSc := continuousOn_univ.mp (hSc0.comp hIncl.continuousOn hInclMaps)
  exact ((hRmSq.div_const 4).sub hRicSq).add ((hSc.pow 2).div_const 4)

omit [I.Boundaryless] in
/-- Carrier continuity in the ambient time-space product, with the same
normalization at the endpoint times. -/
theorem intrinsicEulerDensity_continuousOn_carrier (S : SolutionOn (I := I) (M := M) D)
    (hS : IsSolutionOn S) :
    ContinuousOn (fun p : ℝ × M => intrinsicEulerDensity (S.base.metric p.1) p.2)
      (D.carrier ×ˢ (univ : Set M)) := by
  apply continuousOn_iff_continuous_domRestrict.2
  let P := ↥(D.carrier ×ˢ (univ : Set M))
  let leave : P → ℝ × M := Subtype.val
  have hTime : Continuous (fun p : P => (leave p).1) := continuous_fst.comp continuous_subtype_val
  have hSpace : Continuous (fun p : P => (leave p).2) := continuous_snd.comp continuous_subtype_val
  let split : P → ↥D.carrier × M := fun p => (⟨(leave p).1, p.property.1⟩, (leave p).2)
  have hs : Continuous split := (hTime.subtype_mk (fun p : P => p.property.1)).prodMk hSpace
  have hc := (intrinsicEulerDensity_continuous_carrier (I := I) S hS).comp hs
  change Continuous (fun p : P => intrinsicEulerDensity (S.base.metric (leave p).1) (leave p).2)
  exact hc

omit [I.Boundaryless] [T2Space M] in
/-- The finite inverse-Gram contraction for the squared norm preserves
regular spacetime smoothness of the supplied tensor coefficients. -/
private theorem normSq0S_contMDiffOn_regular
    (g : ℝ → SmoothRiemannianMetric I M) (hG : MetricFamilySmoothOn (I := I) D g)
    {s : ℕ} (A : (t : ℝ) → (x : M) → Tensor0SSpace s I x)
    (hA : ∀ (x : M) (K : Fin s → Fin (Module.finrank ℝ E)) {t : ℝ}, t ∈ D.regular →
      ContMDiffAt (𝓘(ℝ, ℝ).prod I) 𝓘(ℝ) ∞
        (fun p : ℝ × M => A p.1 p.2 (fun a => chartBasisVecFiber (I := I) x (K a) p.2))
        (t, x)) :
    ContMDiffOn (𝓘(ℝ, ℝ).prod I) 𝓘(ℝ) ∞
      (fun p : ℝ × M => normSq0S (g p.1) p.2 s (A p.1 p.2))
      (D.regular ×ˢ (univ : Set M)) := by
  rintro ⟨t, x⟩ ⟨ht, -⟩
  let U := (trivializationAt E (TangentSpace I) x).baseSet
  have hx : x ∈ U := FiberBundle.mem_baseSet_trivializationAt' x
  have hN : D.regular ×ˢ U ∈ 𝓝 (t, x) :=
    (D.regular_isOpen.prod (trivializationAt E (TangentSpace I) x).open_baseSet).mem_nhds ⟨ht, hx⟩
  have hInv (i j : Fin (Module.finrank ℝ E)) :
      ContMDiffAt (𝓘(ℝ, ℝ).prod I) 𝓘(ℝ) ∞
        (fun p : ℝ × M => chartInvGramMatrix (I := I) (g p.1) x p.2 i j) (t, x) := by
    have h := (hG.chartInvGramMatrix_jointContMDiffOn g x i j).comp
      (contMDiffOn_snd.prodMk contMDiffOn_fst : ContMDiffOn (𝓘(ℝ, ℝ).prod I)
        (I.prod 𝓘(ℝ, ℝ)) ∞ (fun p : ℝ × M => (p.2, p.1)) (D.regular ×ˢ U))
      (fun p hp => ⟨hp.2, hp.1⟩)
    exact (h (t, x) ⟨ht, hx⟩).contMDiffAt hN
  let coeff (K : Fin s → Fin (Module.finrank ℝ E)) (p : ℝ × M) :=
    A p.1 p.2 (fun a => chartBasisVecFiber (I := I) x (K a) p.2)
  have hSum : ContMDiffAt (𝓘(ℝ, ℝ).prod I) 𝓘(ℝ) ∞
      (fun p : ℝ × M => ∑ K : Fin s → Fin (Module.finrank ℝ E),
        ∑ L : Fin s → Fin (Module.finrank ℝ E),
          (∏ a : Fin s, chartInvGramMatrix (I := I) (g p.1) x p.2 (K a) (L a)) *
            coeff K p * coeff L p) (t, x) := by
    refine ContMDiffAt.sum fun K _ => ContMDiffAt.sum fun L _ => ?_
    exact ((ContMDiffAt.prod fun a _ => hInv (K a) (L a)).mul (hA x K ht)).mul (hA x L ht)
  refine (hSum.congr_of_eventuallyEq ?_).contMDiffWithinAt
  filter_upwards [hN] with p hp
  have hBase : p.2 ∈ (trivializationAt E (TangentSpace I) x).baseSet := hp.2
  rw [normSq0S_eq_coord (I := I) (g p.1) p.2 s (chartBasisFamily (I := I) x hBase)
    (fun i j => chartInvGramMatrix (I := I) (g p.1) x p.2 i j)
    (chartInvGram_inverse (I := I) (g p.1) x hBase) (A p.1 p.2)]
  unfold coordInner0S
  refine Finset.sum_congr rfl fun K _ => Finset.sum_congr rfl fun L _ => ?_
  simp only [tensor0SComponent_apply, chartBasisFamily_apply, coeff]

/-- Smoothness across regular spacetime, from the curvature and Gram
coefficients of the actual solution. No spacetime frame field is chosen. -/
theorem intrinsicEulerDensity_contMDiffOn_regular (S : SolutionOn (I := I) (M := M) D)
    (hS : IsSolutionOn S) :
    ContMDiffOn (𝓘(ℝ, ℝ).prod I) 𝓘(ℝ) ∞
      (fun p : ℝ × M => intrinsicEulerDensity (S.base.metric p.1) p.2)
      (D.regular ×ˢ (univ : Set M)) := by
  let g := S.base.metric
  have hMetric := hS.smoothMetric.metricCLMSection_contMDiffOn (J := D.regular) Subset.rfl
  have hGram := chartGramMatrix_joint_contMDiffOn g D.regular hMetric
  have hG x := chartGramFamilySmoothWithinOn_of_contMDiffOn g x (hGram x)
  have chartN (x : M) {t : ℝ} (ht : t ∈ D.regular) :
      D.regular ×ˢ (chartAt H x).source ∈ 𝓝 (t, x) :=
    (D.regular_isOpen.prod (chartAt H x).open_source).mem_nhds ⟨ht, mem_chart_source H x⟩
  have chartGood (x : M) {y : M} (hy : y ∈ (chartAt H x).source) :
      y ∈ chartLeviCivitaGoodSet (I := I) x :=
    (mem_chartLeviCivitaGoodSet_iff_mem_extChartAt_source (I := I) x y).2
      (by simpa only [extChartAt_source] using hy)
  have hRm := normSq0S_contMDiffOn_regular g hS.smoothMetric (fun t x => metricRm04At (g t) x) ?_
  · have hRic := normSq0S_contMDiffOn_regular g hS.smoothMetric (fun t x => metricRicciAt (g t) x) ?_
    · have hSc : ContMDiffOn (𝓘(ℝ, ℝ).prod I) 𝓘(ℝ) ∞
          (fun p : ℝ × M => metricScalarAt (g p.1) p.2) (D.regular ×ˢ (univ : Set M)) := by
        rintro ⟨t, x⟩ ⟨ht, -⟩
        have hx := mem_chart_source H x
        have hExt : extChartAt I x x ∈ interior (extChartAt I x).target := by
          rw [(isOpen_extChartAt_target (I := I) x).interior_eq]
          exact (extChartAt I x).map_source (by simpa only [extChartAt_source] using hx)
        have hCoord := scalarOnE_contDiffOn_of_chartGramFamilySmoothWithinOn g x (hG x)
        have hLocal := joint_chart_comp_contMDiffWithinAt (I := I) x
          (fun s y => scalarOnE (I := I) x (metricScalarAt (g s)) y)
          (hCoord (t, extChartAt I x x) ⟨ht, hExt⟩) hx
        refine ((hLocal.contMDiffAt (chartN x ht)).congr_of_eventuallyEq ?_).contMDiffWithinAt
        filter_upwards [chartN x ht] with p hp
        change metricScalarAt (g p.1) p.2 =
          metricScalarAt (g p.1) ((extChartAt I x).symm (extChartAt I x p.2))
        rw [(extChartAt I x).left_inv (by simpa only [extChartAt_source] using hp.2)]
      exact ((hRm.div_const 4).sub hRic).add ((hSc.pow 2).div_const 4)
    · intro x K t ht
      have hx := mem_chart_source H x
      have hLocal := chartRicciTensor_comp_extChartAt_contMDiffWithinAt g x (hG x)
        (K 0) (K 1) ht hx
      refine (hLocal.contMDiffAt (chartN x ht)).congr_of_eventuallyEq ?_
      filter_upwards [chartN x ht] with p hp
      have hVec : (fun a : Fin 2 => chartBasisVecFiber (I := I) x (K a) p.2) =
          vec2 (chartBasisVecFiber (I := I) x (K 0) p.2)
            (chartBasisVecFiber (I := I) x (K 1) p.2) := by
        funext i
        fin_cases i <;> rfl
      rw [hVec, metricRicciAt_apply_eq_ricciTensor,
        ricciTensor_chartBasisVec_alpha_eq (I := I) (g p.1) x (K 0) (K 1) (chartGood x hp.2)]
  · intro x K t ht
    have hx := mem_chart_source H x
    have hGramN : D.regular ×ˢ (trivializationAt E (TangentSpace I) x).baseSet ∈ 𝓝 (t, x) :=
      (D.regular_isOpen.prod (trivializationAt E (TangentSpace I) x).open_baseSet).mem_nhds
        ⟨ht, FiberBundle.mem_baseSet_trivializationAt' x⟩
    have hSum : ContMDiffAt (𝓘(ℝ, ℝ).prod I) 𝓘(ℝ) ∞
        (fun p : ℝ × M => ∑ l : Fin (Module.finrank ℝ E),
          chartRiemannTensor (I := I) (g p.1) x (K 2) (K 0) (K 1) l (extChartAt I x p.2) *
            chartGramMatrix (I := I) (g p.1) x p.2 (K 3) l) (t, x) := by
      refine ContMDiffAt.sum fun l _ => ?_
      exact ((chartRiemannTensor_comp_extChartAt_contMDiffWithinAt g x (hG x) (K 2) (K 0)
        (K 1) l ht hx).contMDiffAt (chartN x ht)).mul
        ((hGram x (K 3) l (t, x) ⟨ht, FiberBundle.mem_baseSet_trivializationAt' x⟩).contMDiffAt hGramN)
    refine hSum.congr_of_eventuallyEq ?_
    filter_upwards [chartN x ht] with p hp
    let v (i : Fin 4) := chartBasisVecFiber (I := I) x (K i) p.2
    have hVec : v = vec4 (v 0) (v 1) (v 2) (v 3) := by
      funext i
      fin_cases i <;> rfl
    change metricRm04At (g p.1) p.2 v = _
    rw [hVec, ← metricRm04StandardAt_apply, metricRm04StandardAt_eq_inner_riemannOp]
    dsimp only [v]
    rw [riemannOp_chartBasisVec_alpha_eq (I := I) (g p.1) x (K 2) (K 0) (K 1) (chartGood x hp.2)]
    simp only [map_sum, map_smul, smul_eq_mul, chartGramMatrix_apply]

end Flow

end

end SmoothPoincare
