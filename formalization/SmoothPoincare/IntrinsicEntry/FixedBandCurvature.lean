import SmoothPoincare.Variational.ChartSpliceJets
import FirstOrderTwistor.GeometricChiralBlock
import SmoothPoincare.Immersions.InducedBlock
import DifferentialGeometry.Geometry.Curvature.Product
import DifferentialGeometry.Geometry.Curvature.DimensionTwo.RicciScalar
import DifferentialGeometry.Geometry.Curvature.Naturality.Pullback.Cross

/-! # Curvature of the fixed marked convex band from endpoint first jets -/

open DifferentialGeometry DifferentialGeometry.Analysis
open DifferentialGeometry.Geometry.Curvature DifferentialGeometry.Geometry.Connection
open DifferentialGeometry.Geometry.Riemannian DifferentialGeometry.Geometry.Operator
open DifferentialGeometry.Tensor.Coordinates
open Bundle Filter Set
open scoped BigOperators ContDiff Manifold Topology

namespace SmoothPoincare.IntrinsicEntry

noncomputable section

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]

/-- The entire positive tensor interpolation in one common band chart. -/
abbrev fixedBandMetric (A B : SmoothRiemannianMetric I M) (a : M → ℝ)
    (ha : ContMDiff I 𝓘(ℝ) ∞ a) (h01 : ∀ z, a z ∈ Icc (0 : ℝ) 1) :=
  chartSpliceMetric A B a ha h01 1 (by norm_num)

/-- The switch expressed in the same chart as both endpoints. -/
abbrev fixedBandChartWeight (a : M → ℝ) (α : M) : E → ℝ := fun y => a ((extChartAt I α).symm y)

variable [NeZero (Module.finrank ℝ E)]

omit [NeZero (Module.finrank ℝ E)] in
/-- The chart metric values are computed from the two physical endpoint values. -/
theorem fixedBandChartGram_eq (A B : SmoothRiemannianMetric I M) (a : M → ℝ)
    (ha : ContMDiff I 𝓘(ℝ) ∞ a) (h01 : ∀ z, a z ∈ Icc (0 : ℝ) 1) (α : M) :
    chartGramPi (fixedBandMetric A B a ha h01) α = fun y =>
      (1 - fixedBandChartWeight (I := I) a α y) • chartGramPi A α y +
        fixedBandChartWeight (I := I) a α y • chartGramPi B α y := by
  funext y i j
  simp only [chartGramPi_apply, Pi.add_apply, Pi.smul_apply, smul_eq_mul]
  simp only [chartGramOnE_def, chartGramMatrix_apply, fixedBandChartWeight]
  rw [add_comm]
  simpa only [chartSpliceMetric, smul_eq_mul, one_mul] using
    convexComb_inner B A (fun z => 1 * a z) (contMDiff_const.mul ha)
      (by simpa only [one_mul] using h01) ((extChartAt I α).symm y)
      (chartBasisVecFiber (I := I) α i ((extChartAt I α).symm y))
      (chartBasisVecFiber (I := I) α j ((extChartAt I α).symm y))

omit [FiniteDimensional ℝ E] [NeZero (Module.finrank ℝ E)] in
private theorem chartWeight_differentiableAt (a : M → ℝ)
    (ha : ContMDiff I 𝓘(ℝ) ∞ a) (α : M) {x : E}
    (hx : x ∈ interior (extChartAt I α).target) :
    DifferentiableAt ℝ (fixedBandChartWeight (I := I) a α) x := by
  have hOn : ContDiffOn ℝ ∞ (fixedBandChartWeight (I := I) a α) (extChartAt I α).target :=
    ((ha.contMDiffOn (s := univ)).comp (contMDiffOn_extChartAt_symm (I := I) α)
      (mapsTo_univ _ _)).contDiffOn
  exact (hOn.contDiffAt (mem_interior_iff_mem_nhds.mp hx)).differentiableAt (by simp)

omit [NeZero (Module.finrank ℝ E)] in
/-- The only spatial metric derivatives needed in the quadratic connection
terms are the endpoint first derivatives and the first derivative of the switch. -/
theorem fixedBandChartGram_fderiv (A B : SmoothRiemannianMetric I M) (a : M → ℝ)
    (ha : ContMDiff I 𝓘(ℝ) ∞ a) (h01 : ∀ z, a z ∈ Icc (0 : ℝ) 1) (α : M) {x : E}
    (hx : x ∈ interior (extChartAt I α).target) :
    let w := fixedBandChartWeight (I := I) a α
    fderiv ℝ (chartGramPi (fixedBandMetric A B a ha h01) α) x =
      ((1 - w x) • fderiv ℝ (chartGramPi A α) x + w x • fderiv ℝ (chartGramPi B α) x) +
        (fderiv ℝ w x).smulRight (chartGramPi B α x - chartGramPi A α x) := by
  intro w
  have hw : DifferentiableAt ℝ w x := chartWeight_differentiableAt a ha α hx
  have hG (g : SmoothRiemannianMetric I M) : DifferentiableAt ℝ (chartGramPi g α) x := by
    exact differentiableAt_pi.mpr fun i => differentiableAt_pi.mpr fun j =>
      ((chartGramOnE_contDiffOn g α i j).contDiffAt (mem_interior_iff_mem_nhds.mp hx)).differentiableAt (by simp)
  rw [fixedBandChartGram_eq]
  change fderiv ℝ (fun y => (1 - w y) • chartGramPi A α y + w y • chartGramPi B α y) x = _
  have hw' : DifferentiableAt ℝ (fun y : E => (1 : ℝ) - w y) x :=
    (differentiableAt_const (1 : ℝ)).sub hw
  have hleft : DifferentiableAt ℝ (fun y => (1 - w y) • chartGramPi A α y) x := hw'.smul (hG A)
  have hright : DifferentiableAt ℝ (fun y => w y • chartGramPi B α y) x := hw.smul (hG B)
  have hdiff : fderiv ℝ (fun y : E => (1 : ℝ) - w y) x = -fderiv ℝ w x := by
    exact fderiv_const_sub (𝕜 := ℝ) (f := w) (x := x) 1
  rw [fderiv_fun_add hleft hright, fderiv_fun_smul hw' (hG A), fderiv_fun_smul hw (hG B), hdiff]
  ext v i j
  simp only [add_apply, smul_apply, ContinuousLinearMap.smulRight_apply, neg_apply,
    Pi.add_apply, Pi.smul_apply, Pi.sub_apply, smul_eq_mul]
  ring

/-- The corrected all-lowered tensor computed with the endpoint curvature
values and the zero and first metric jets in the common chart. -/
def fixedBandCurvatureFromFirstJets (A B : SmoothRiemannianMetric I M) (a : M → ℝ)
    (ha : ContMDiff I 𝓘(ℝ) ∞ a) (h01 : ∀ z, a z ∈ Icc (0 : ℝ) 1) (α : M) (x : E)
    (RA RB : Fin (Module.finrank ℝ E) → Fin (Module.finrank ℝ E) →
      Fin (Module.finrank ℝ E) → Fin (Module.finrank ℝ E) → ℝ)
    (i j k l : Fin (Module.finrank ℝ E)) : ℝ :=
  let w := fixedBandChartWeight (I := I) a α
  (1 - w x) * RA i j k l + w x * RB i j k l +
    loweredCurvaturePrincipal (fun p q u v =>
      spliceSecondPartialError 1 w (chartGramOnE A α u v) (chartGramOnE B α u v) x p q) i j k l +
    (chartCurvatureFirstJetTerm (fixedBandMetric A B a ha h01) α x i j k l -
      ((1 - w x) * chartCurvatureFirstJetTerm A α x i j k l +
        w x * chartCurvatureFirstJetTerm B α x i j k l))

set_option maxHeartbeats 500000 in
/-- Exact cancellation of the metric Hessians in the physical lowered curvature.
The known geometric endpoint tensors may be inserted in the two remaining slots. -/
theorem fixedBandCurvature_eq_firstJets (A B : SmoothRiemannianMetric I M) (a : M → ℝ)
    (ha : ContMDiff I 𝓘(ℝ) ∞ a) (h01 : ∀ z, a z ∈ Icc (0 : ℝ) 1) (α : M) {x : E}
    (hx : x ∈ interior (extChartAt I α).target) (i j k l : Fin (Module.finrank ℝ E)) :
    chartRiemannLower (fixedBandMetric A B a ha h01) α i j k l x =
      fixedBandCurvatureFromFirstJets A B a ha h01 α x
        (fun i j k l => chartRiemannLower A α i j k l x)
        (fun i j k l => chartRiemannLower B α i j k l x) i j k l := by
  have h := chartSpliceRiemannLower_sub A B a ha h01 1 (by norm_num) α hx i j k l
  simp only [one_mul] at h
  unfold fixedBandCurvatureFromFirstJets
  dsimp only [fixedBandChartWeight, fixedBandMetric]
  linear_combination h

omit [NeZero (Module.finrank ℝ E)] in
private theorem firstJetTerm_eq_of_chartValue_fderiv (G A : SmoothRiemannianMetric I M) (α : M) (x : E)
    (hvalue : chartGramPi G α x = chartGramPi A α x)
    (hderiv : fderiv ℝ (chartGramPi G α) x = fderiv ℝ (chartGramPi A α) x)
    (i j k l : Fin (Module.finrank ℝ E)) :
    chartCurvatureFirstJetTerm G α x i j k l = chartCurvatureFirstJetTerm A α x i j k l := by
  change (∑ m, chartGramPi G α x l m *
      jetRiemann (chartModelBasis E) (chartGramPi G α x, fderiv ℝ (chartGramPi G α) x, 0) i j k m) =
    ∑ m, chartGramPi A α x l m *
      jetRiemann (chartModelBasis E) (chartGramPi A α x, fderiv ℝ (chartGramPi A α) x, 0) i j k m
  rw [hvalue, hderiv]

omit [NeZero (Module.finrank ℝ E)] in
/-- The actual cutoff error vanishes when both cutoff derivative orders do. -/
theorem fixedBandCutoffError_eq_zero (w G B : E → ℝ) (x : E)
    (h₁ : fderiv ℝ w x = 0)
    (h₂ : ∀ p q : Fin (Module.finrank ℝ E), partialDeriv p (partialDeriv q w) x = 0)
    (p q : Fin (Module.finrank ℝ E)) : spliceSecondPartialError 1 w G B x p q = 0 := by
  rw [spliceSecondPartialError, h₂ p q]
  simp [partialDeriv, h₁]

/-- At a flat inner end, the entire correction reduces to the left curvature. -/
theorem fixedBandCurvature_eq_left_of_flat (A B : SmoothRiemannianMetric I M) (a : M → ℝ)
    (ha : ContMDiff I 𝓘(ℝ) ∞ a) (h01 : ∀ z, a z ∈ Icc (0 : ℝ) 1) (α : M) {x : E}
    (hx : x ∈ interior (extChartAt I α).target)
    (h₀ : fixedBandChartWeight (I := I) a α x = 0)
    (h₁ : fderiv ℝ (fixedBandChartWeight (I := I) a α) x = 0)
    (h₂ : ∀ p q : Fin (Module.finrank ℝ E),
      partialDeriv p (partialDeriv q (fixedBandChartWeight (I := I) a α)) x = 0)
    (i j k l : Fin (Module.finrank ℝ E)) :
    chartRiemannLower (fixedBandMetric A B a ha h01) α i j k l x = chartRiemannLower A α i j k l x := by
  have hvalue := congrFun (fixedBandChartGram_eq A B a ha h01 α) x
  have hderiv := fixedBandChartGram_fderiv A B a ha h01 α hx
  simp only [h₀, h₁, sub_zero, one_smul, zero_smul, add_zero,
    ContinuousLinearMap.zero_smulRight] at hvalue hderiv
  have hterm := firstJetTerm_eq_of_chartValue_fderiv _ A α x hvalue hderiv i j k l
  rw [fixedBandCurvature_eq_firstJets A B a ha h01 α hx,
    fixedBandCurvatureFromFirstJets, hterm]
  simp [h₀, fixedBandCutoffError_eq_zero _ _ _ _ h₁ h₂, loweredCurvaturePrincipal]

/-- At a flat outer end, the entire correction reduces to the right curvature.
Only derivatives of the switch enter this equality, including at the closed end. -/
theorem fixedBandCurvature_eq_right_of_flat (A B : SmoothRiemannianMetric I M) (a : M → ℝ)
    (ha : ContMDiff I 𝓘(ℝ) ∞ a) (h01 : ∀ z, a z ∈ Icc (0 : ℝ) 1) (α : M) {x : E}
    (hx : x ∈ interior (extChartAt I α).target)
    (h₀ : fixedBandChartWeight (I := I) a α x = 1)
    (h₁ : fderiv ℝ (fixedBandChartWeight (I := I) a α) x = 0)
    (h₂ : ∀ p q : Fin (Module.finrank ℝ E),
      partialDeriv p (partialDeriv q (fixedBandChartWeight (I := I) a α)) x = 0)
    (i j k l : Fin (Module.finrank ℝ E)) :
    chartRiemannLower (fixedBandMetric A B a ha h01) α i j k l x = chartRiemannLower B α i j k l x := by
  have hvalue := congrFun (fixedBandChartGram_eq A B a ha h01 α) x
  have hderiv := fixedBandChartGram_fderiv A B a ha h01 α hx
  simp only [h₀, h₁, sub_self, one_smul, zero_smul, add_zero, zero_add,
    ContinuousLinearMap.zero_smulRight] at hvalue hderiv
  have hterm := firstJetTerm_eq_of_chartValue_fderiv _ B α x hvalue hderiv i j k l
  rw [fixedBandCurvature_eq_firstJets A B a ha h01 α hx,
    fixedBandCurvatureFromFirstJets, hterm]
  simp [h₀, fixedBandCutoffError_eq_zero _ _ _ _ h₁ h₂, loweredCurvaturePrincipal]

section Geometric

open FirstOrderTwistor SectionsAndConnections
open DifferentialGeometry.Geometry.Metric DifferentialGeometry.Integral.Measure
open DifferentialGeometry.Tensor0SBundle MeasureTheory

variable [I.Boundaryless] [T2Space M] [BoundarylessManifold I M]

omit [NeZero (Module.finrank ℝ E)] in
/-- The chart order is output input first, then the two curvature inputs, then
lowering. The physical standard order is `R(j,k,i,l)`. -/
theorem fixedBandChartLowered_eq_metricRm (g : SmoothRiemannianMetric I M) (α p : M)
    (hp : p ∈ chartLeviCivitaGoodSet (I := I) α) (i j k l : Fin (Module.finrank ℝ E)) :
    chartRiemannLower g α i j k l (extChartAt I α p) =
      metricRm04StandardAt g p (chartBasisVecFiber α j p) (chartBasisVecFiber α k p)
        (chartBasisVecFiber α i p) (chartBasisVecFiber α l p) := by
  let _ : CompleteSpace E := FiniteDimensional.complete ℝ E
  rw [rm04_eq_inner_riem, riemannOp_chartBasisVec_alpha_eq g α i j k hp,
    chartRiemannLower_def]
  simp only [map_sum, map_smul, smul_eq_mul]
  refine Finset.sum_congr rfl fun m _ => ?_
  rw [chartGramOnE_def, (extChartAt I α).left_inv (chartLeviCivitaGoodSet_mem_extChartAt_source hp),
    chartGramMatrix_apply, mul_comm]

/-- The tangent basis of the same physical chart at an arbitrary good point. -/
def fixedBandChartBasis (α p : M) (hp : p ∈ chartLeviCivitaGoodSet (I := I) α) :
    Module.Basis (Fin (Module.finrank ℝ E)) ℝ (TangentSpace I p) :=
  (trivializationAt E (TangentSpace I) α).basisAt (chartModelBasis E)
    (chartLeviCivitaGoodSet_mem_baseSet hp)

omit [NeZero (Module.finrank ℝ E)] [I.Boundaryless] [T2Space M] [BoundarylessManifold I M] in
private theorem fixedBandChartBasis_apply (α p : M)
    (hp : p ∈ chartLeviCivitaGoodSet (I := I) α) (i : Fin (Module.finrank ℝ E)) :
    fixedBandChartBasis α p hp i = chartBasisVecFiber α i p := by
  simp only [fixedBandChartBasis, Bundle.Trivialization.basisAt, Module.Basis.map_apply,
    chartBasisVecFiber]
  rw [(trivializationAt E (TangentSpace I) α).symmL_apply (chartLeviCivitaGoodSet_mem_baseSet hp)]
  rfl

/-- Evaluate the all-lowered coordinate reconstruction in a single oriented
orthonormal frame. The last two frame slots are swapped for the wedge convention. -/
def fixedBandFrameFromLowered (α p : M) (hp : p ∈ chartLeviCivitaGoodSet (I := I) α)
    (basis : Fin 4 → TangentSpace I p)
    (R : Fin (Module.finrank ℝ E) → Fin (Module.finrank ℝ E) →
      Fin (Module.finrank ℝ E) → Fin (Module.finrank ℝ E) → ℝ) : CurvatureFrameTensor :=
  fun i j k l =>
    let v := vec4 (I := I) (x := p) (basis i) (basis j) (basis l) (basis k)
    ∑ n : Fin 4 → Fin (Module.finrank ℝ E),
      (∏ r, (fixedBandChartBasis α p hp).repr (v r) (n r)) * R (n 2) (n 0) (n 1) (n 3)

/-- The physical Levi–Civita tensor in any chosen oriented orthonormal frame
is the reconstructed chart tensor. This uses the actual chart basis and
physical metric rather than a separately supplied curvature array. -/
theorem fixedBandFrameTensor_eq_firstJets (A B : SmoothRiemannianMetric I M) (a : M → ℝ)
    (ha : ContMDiff I 𝓘(ℝ) ∞ a) (h01 : ∀ z, a z ∈ Icc (0 : ℝ) 1) (α p : M)
    (hp : p ∈ chartLeviCivitaGoodSet (I := I) α) (o : ManifoldOrientation I M 4)
    (frame : OrientedOrthonormalFrameAt (fixedBandMetric A B a ha h01) o p) :
    metricCurvatureFrameTensor (fixedBandMetric A B a ha h01) o p frame =
      fixedBandFrameFromLowered α p hp frame.basis
        (fixedBandCurvatureFromFirstJets A B a ha h01 α (extChartAt I α p)
          (fun i j k l => chartRiemannLower A α i j k l (extChartAt I α p))
          (fun i j k l => chartRiemannLower B α i j k l (extChartAt I α p))) := by
  classical
  let _ : CompleteSpace E := FiniteDimensional.complete ℝ E
  let G := fixedBandMetric A B a ha h01
  let e := fixedBandChartBasis (I := I) α p hp
  let x := extChartAt I α p
  let T := metricRm04At G p
  funext i j k l
  let v := vec4 (I := I) (x := p) (frame.basis i) (frame.basis j) (frame.basis l) (frame.basis k)
  have hv : v = fun r => ∑ n, (e.repr (v r) n) • e n := by
    funext r
    exact (e.sum_repr (v r)).symm
  change T v = ∑ n : Fin 4 → Fin (Module.finrank ℝ E),
    (∏ r, e.repr (v r) (n r)) *
      fixedBandCurvatureFromFirstJets A B a ha h01 α x
        (fun i j k l => chartRiemannLower A α i j k l x)
        (fun i j k l => chartRiemannLower B α i j k l x) (n 2) (n 0) (n 1) (n 3)
  conv_lhs => rw [hv, Tensor0SSpace.map_sum]
  apply Finset.sum_congr rfl
  intro n _
  rw [Tensor0SSpace.map_smul_univ, smul_eq_mul]
  congr 1
  have hvec : (fun r => e (n r)) = vec4 (I := I) (x := p) (e (n 0)) (e (n 1)) (e (n 2)) (e (n 3)) := by
    funext r
    fin_cases r <;> rfl
  change metricRm04At G p (fun r => e (n r)) = _
  rw [hvec]
  change metricRm04StandardAt G p (e (n 0)) (e (n 1)) (e (n 2)) (e (n 3)) = _
  dsimp only [e]
  simp only [fixedBandChartBasis_apply]
  rw [← fixedBandChartLowered_eq_metricRm G α p hp]
  exact fixedBandCurvature_eq_firstJets A B a ha h01 α
    (chartLeviCivitaGoodSet_extChartAt_mem_interior hp) (n 2) (n 0) (n 1) (n 3)

variable {F K N L J' P : Type*}
  [NormedAddCommGroup F] [NormedSpace ℝ F] [FiniteDimensional ℝ F]
  [TopologicalSpace K] {J : ModelWithCorners ℝ F K} [J.Boundaryless]
  [TopologicalSpace N] [ChartedSpace K N] [IsManifold J ∞ N] [T2Space N]
  [BoundarylessManifold J N]
  [NormedAddCommGroup L] [NormedSpace ℝ L] [FiniteDimensional ℝ L]
  [TopologicalSpace J'] {J₂ : ModelWithCorners ℝ L J'} [J₂.Boundaryless]
  [TopologicalSpace P] [ChartedSpace J' P] [IsManifold J₂ ∞ P] [T2Space P]
  [BoundarylessManifold J₂ P]

/-- The curvature of the actual product of two surfaces of Gaussian curvature
`-1` and `+1`, evaluated on arbitrary product tangent vectors. -/
theorem fixedBandSurfaceProductRm_eq_gram (q : SmoothRiemannianMetric J N)
    (σ : SmoothRiemannianMetric J₂ P) (x : N × P)
    (hqDim : Module.finrank ℝ F = 2) (hσDim : Module.finrank ℝ L = 2)
    (hq : metricScalarAt q x.1 = -2) (hσ : metricScalarAt σ x.2 = 2)
    (u v w z : TangentSpace (J.prod J₂) x) :
    metricRm04StandardAt (q.prod σ) x u v w z =
      -(q.inner x.1 u.1 z.1 * q.inner x.1 v.1 w.1 -
        q.inner x.1 u.1 w.1 * q.inner x.1 v.1 z.1) +
      (σ.inner x.2 u.2 z.2 * σ.inner x.2 v.2 w.2 -
        σ.inner x.2 u.2 w.2 * σ.inner x.2 v.2 z.2) := by
  change metricRm04At (q.prod σ) x (vec4 (I := J.prod J₂) (x := x) u v w z) = _
  rw [metricRm04At_productMetric_apply]
  have hfirst : (fun k : Fin 4 => (vec4 (I := J.prod J₂) (x := x) u v w z k).1) =
      vec4 (I := J) (x := x.1) u.1 v.1 w.1 z.1 := by
    funext k
    fin_cases k <;> rfl
  have hsecond : (fun k : Fin 4 => (vec4 (I := J.prod J₂) (x := x) u v w z k).2) =
      vec4 (I := J₂) (x := x.2) u.2 v.2 w.2 z.2 := by
    funext k
    fin_cases k <;> rfl
  rw [hfirst, hsecond]
  change metricRm04StandardAt q x.1 u.1 v.1 w.1 z.1 +
    metricRm04StandardAt σ x.2 u.2 v.2 w.2 z.2 = _
  have hq' := metricRm04StdAt_eq_scalar_div_two_of_finrank_eq_two q hqDim x.1 u.1 v.1 w.1 z.1
  have hσ' := metricRm04StdAt_eq_scalar_div_two_of_finrank_eq_two σ hσDim x.2 u.2 v.2 w.2 z.2
  rw [hq] at hq'
  rw [hσ] at hσ'
  calc
    _ = _ := congrArg₂ (· + ·) hq' hσ'
    _ = _ := by ring

omit [NeZero (Module.finrank ℝ E)] in
/-- At a point of an endpoint obtained by a marked product pullback, the
actual chart curvature is the two signed Gram products. Restrict to the
open domain and range of the physical local product maps before applying it. -/
theorem fixedBandPullbackProductChartLowered (q : SmoothRiemannianMetric J N)
    (σ : SmoothRiemannianMetric J₂ P) (Φ : M ≃ₘ⟮I, J.prod J₂⟯ (N × P))
    (α p : M) (hp : p ∈ chartLeviCivitaGoodSet (I := I) α)
    (hqDim : Module.finrank ℝ F = 2) (hσDim : Module.finrank ℝ L = 2)
    (hq : metricScalarAt q (Φ p).1 = -2) (hσ : metricScalarAt σ (Φ p).2 = 2)
    (i j k l : Fin (Module.finrank ℝ E)) :
    let V := fun r => mfderiv I (J.prod J₂) (Φ : M → N × P) p (chartBasisVecFiber α r p)
    let negGram := fun r s => q.inner (Φ p).1 (V r).1 (V s).1
    let posGram := fun r s => σ.inner (Φ p).2 (V r).2 (V s).2
    chartRiemannLower (Diffeomorph.pullbackMetricCross (q.prod σ) Φ) α i j k l (extChartAt I α p) =
      -(negGram j l * negGram k i - negGram j i * negGram k l) +
        (posGram j l * posGram k i - posGram j i * posGram k l) := by
  let _ : CompleteSpace E := FiniteDimensional.complete ℝ E
  let _ : CompleteSpace F := FiniteDimensional.complete ℝ F
  let _ : CompleteSpace L := FiniteDimensional.complete ℝ L
  let _ : IsManifold I 1 M := IsManifold.of_le (by decide : (1 : WithTop ℕ∞) ≤ ∞)
  let _ : IsManifold (J.prod J₂) 1 (N × P) := IsManifold.of_le (by decide : (1 : WithTop ℕ∞) ≤ ∞)
  dsimp only
  rw [fixedBandChartLowered_eq_metricRm _ α p hp,
    metricRm04Standard_pullbackCross _ Φ]
  exact fixedBandSurfaceProductRm_eq_gram q σ (Φ p) hqDim hσDim hq hσ _ _ _ _

/-- The two pointwise squared Hilbert–Schmidt integrands, in the physical
orientation and orthonormal frame of the assembled band. -/
def fixedBandChiralDensities (R : CurvatureFrameTensor) : ℝ × ℝ :=
  (hilbertSchmidtSq (traceFreeChiralBlock (selfDualCurvatureBlock R)),
    hilbertSchmidtSq (traceFreeChiralBlock (antiSelfDualCurvatureBlock R)))

/-- Both actual signed densities use the same chart reconstruction and the
same physical orthonormal frame. -/
theorem fixedBandSignedDensities_eq_firstJets (A B : SmoothRiemannianMetric I M) (a : M → ℝ)
    (ha : ContMDiff I 𝓘(ℝ) ∞ a) (h01 : ∀ z, a z ∈ Icc (0 : ℝ) 1) (α p : M)
    (hp : p ∈ chartLeviCivitaGoodSet (I := I) α) (o : ManifoldOrientation I M 4)
    (frame : OrientedOrthonormalFrameAt (fixedBandMetric A B a ha h01) o p) :
    fixedBandChiralDensities (metricCurvatureFrameTensor (fixedBandMetric A B a ha h01) o p frame) =
      fixedBandChiralDensities (fixedBandFrameFromLowered α p hp frame.basis
        (fixedBandCurvatureFromFirstJets A B a ha h01 α (extChartAt I α p)
          (fun i j k l => chartRiemannLower A α i j k l (extChartAt I α p))
          (fun i j k l => chartRiemannLower B α i j k l (extChartAt I α p)))) :=
  congrArg fixedBandChiralDensities (fixedBandFrameTensor_eq_firstJets A B a ha h01 α p hp o frame)

end Geometric

end

end SmoothPoincare.IntrinsicEntry
