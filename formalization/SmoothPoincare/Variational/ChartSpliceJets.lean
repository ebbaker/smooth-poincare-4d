import DifferentialGeometry.Geometry.Curvature.Coordinates.MetricJet.ChartBridge
import DifferentialGeometry.Geometry.Curvature.Riemann.SectionalCurvature
import DifferentialGeometry.Geometry.Metric.Construction.ConvexCombination
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.LinearCombination
import Mathlib.Tactic.Ring

/-! # Cutoff commutators in one metric chart

Only the spatial derivatives are taken. The interpolation parameter is fixed
for each derivative, and the formulas hold with the same cutoff at every
parameter in the path. The curvature indices use `chartRiemannLower` order.
-/

open DifferentialGeometry DifferentialGeometry.Analysis
open DifferentialGeometry.Geometry.Curvature DifferentialGeometry.Geometry.Operator
open DifferentialGeometry.Geometry.Riemannian
open DifferentialGeometry.Tensor.Coordinates Filter Set
open scoped BigOperators ContDiff Manifold Topology

namespace SmoothPoincare

noncomputable section

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]

private theorem partialAdd {f g : E → ℝ} {x : E} (hf : DifferentiableAt ℝ f x)
    (hg : DifferentiableAt ℝ g x) (i : Fin (Module.finrank ℝ E)) :
    partialDeriv i (fun y => f y + g y) x = partialDeriv i f x + partialDeriv i g x := by
  simp only [partialDeriv, fderiv_fun_add hf hg, add_apply]

private theorem partialSub {f g : E → ℝ} {x : E} (hf : DifferentiableAt ℝ f x)
    (hg : DifferentiableAt ℝ g x) (i : Fin (Module.finrank ℝ E)) :
    partialDeriv i (fun y => f y - g y) x = partialDeriv i f x - partialDeriv i g x := by
  simp only [partialDeriv, fderiv_fun_sub hf hg, sub_apply]

private theorem partialMul {f g : E → ℝ} {x : E} (hf : DifferentiableAt ℝ f x)
    (hg : DifferentiableAt ℝ g x) (i : Fin (Module.finrank ℝ E)) :
    partialDeriv i (fun y => f y * g y) x = f x * partialDeriv i g x + g x * partialDeriv i f x := by
  simp only [partialDeriv, fderiv_fun_mul hf hg, add_apply, smul_apply, smul_eq_mul]

private theorem partialConstMul {f : E → ℝ} {x : E} (hf : DifferentiableAt ℝ f x)
    (i : Fin (Module.finrank ℝ E)) (t : ℝ) :
    partialDeriv i (fun y => t * f y) x = t * partialDeriv i f x := by
  rw [partialMul (differentiableAt_const t) hf]
  simp [partialDeriv]

/-- The commutator for one scalar chart coefficient. Here `m` is the outer
derivative index. It involves the value and first derivatives of `b - g`. -/
def spliceSecondPartialError (t : ℝ) (χ g b : E → ℝ) (x : E)
    (m i : Fin (Module.finrank ℝ E)) : ℝ :=
  t * (partialDeriv m (partialDeriv i χ) x * (b x - g x) +
    partialDeriv i χ x * (partialDeriv m b x - partialDeriv m g x) +
    partialDeriv m χ x * (partialDeriv i b x - partialDeriv i g x))

/-- The twice differentiated cutoff interpolation, using actual Fréchet
derivatives along the fixed chart basis. -/
theorem spliceSecondPartial_sub (t : ℝ) {χ g b : E → ℝ} {x : E}
    (hχ : ContDiffAt ℝ 2 χ x) (hg : ContDiffAt ℝ 2 g x) (hb : ContDiffAt ℝ 2 b x)
    (m i : Fin (Module.finrank ℝ E)) :
    partialDeriv m (partialDeriv i (fun y => (1 - t * χ y) * g y + t * χ y * b y)) x -
      ((1 - t * χ x) * partialDeriv m (partialDeriv i g) x +
        t * χ x * partialDeriv m (partialDeriv i b) x) = spliceSecondPartialError t χ g b x m i := by
  let d := fun y => b y - g y
  have hd : ContDiffAt ℝ 2 d x := hb.sub hg
  have hFirst {f : E → ℝ} (hf : ContDiffAt ℝ 2 f x) :
      DifferentiableAt ℝ (partialDeriv i f) x :=
    ((hf.fderiv_right (m := 1) (by norm_num)).clm_apply contDiffAt_const).differentiableAt one_ne_zero
  have hInterp : (fun y => (1 - t * χ y) * g y + t * χ y * b y) =
      (fun y => g y + t * (χ y * d y)) := by
    funext y
    simp only [d]
    ring
  have hNear : partialDeriv i (fun y => g y + t * (χ y * d y)) =ᶠ[𝓝 x]
      (fun y => partialDeriv i g y + t * (χ y * partialDeriv i d y + d y * partialDeriv i χ y)) := by
    filter_upwards [hχ.eventually (by simp), hg.eventually (by simp), hd.eventually (by simp)]
      with y hχy hgy hdy
    have hc := hχy.differentiableAt (by norm_num)
    have hD := hdy.differentiableAt (by norm_num)
    have hProd : DifferentiableAt ℝ (fun z => χ z * d z) y := hc.mul hD
    have hScaled : DifferentiableAt ℝ (fun z => t * (χ z * d z)) y := hProd.const_mul t
    rw [partialAdd (hgy.differentiableAt (by norm_num)) hScaled, partialConstMul hProd, partialMul hc hD]
  have hDiffPartial : partialDeriv i d =ᶠ[𝓝 x] (fun y => partialDeriv i b y - partialDeriv i g y) := by
    filter_upwards [hb.eventually (by simp), hg.eventually (by simp)] with y hby hgy
    exact partialSub (hby.differentiableAt (by norm_num)) (hgy.differentiableAt (by norm_num)) i
  have hD2 : partialDeriv m (partialDeriv i d) x =
      partialDeriv m (partialDeriv i b) x - partialDeriv m (partialDeriv i g) x := by
    exact (congrArg (fun L : E →L[ℝ] ℝ => L (chartModelBasis E m)) hDiffPartial.fderiv_eq).trans
      (partialSub (hFirst hb) (hFirst hg) m)
  have hc := hχ.differentiableAt (by norm_num)
  have hD := hd.differentiableAt (by norm_num)
  have hp : DifferentiableAt ℝ (fun y => χ y * partialDeriv i d y) x := hc.mul (hFirst hd)
  have hq : DifferentiableAt ℝ (fun y => d y * partialDeriv i χ y) x := hD.mul (hFirst hχ)
  have hSum : DifferentiableAt ℝ (fun y => χ y * partialDeriv i d y + d y * partialDeriv i χ y) x := hp.add hq
  have hScaled : DifferentiableAt ℝ (fun y => t * (χ y * partialDeriv i d y + d y * partialDeriv i χ y)) x :=
    hSum.const_mul t
  have hNearEq : partialDeriv m (partialDeriv i (fun y => g y + t * (χ y * d y))) x =
      partialDeriv m (fun y => partialDeriv i g y + t * (χ y * partialDeriv i d y + d y * partialDeriv i χ y)) x :=
    congrArg (fun L : E →L[ℝ] ℝ => L (chartModelBasis E m)) hNear.fderiv_eq
  have hAt : partialDeriv i d x = partialDeriv i b x - partialDeriv i g x := hDiffPartial.eq_of_nhds
  rw [hInterp, hNearEq, partialAdd (hFirst hg) hScaled, partialConstMul hSum, partialAdd hp hq,
    partialMul hc (hFirst hd), partialMul hD (hFirst hχ), hD2, hAt]
  rw [show partialDeriv m d x = partialDeriv m b x - partialDeriv m g x from
    partialSub (hb.differentiableAt (by norm_num)) (hg.differentiableAt (by norm_num)) m]
  simp only [spliceSecondPartialError, d]
  ring

/-- A coefficientwise error bound uniform in the path parameter on `[0,1]`. -/
theorem abs_spliceSecondPartialError_le {t : ℝ} (ht : t ∈ Icc (0 : ℝ) 1)
    (χ g b : E → ℝ) (x : E) (m i : Fin (Module.finrank ℝ E)) :
    |spliceSecondPartialError t χ g b x m i| ≤
      |partialDeriv m (partialDeriv i χ) x| * |b x - g x| +
      |partialDeriv i χ x| * |partialDeriv m b x - partialDeriv m g x| +
      |partialDeriv m χ x| * |partialDeriv i b x - partialDeriv i g x| := by
  unfold spliceSecondPartialError
  rw [abs_mul, abs_of_nonneg ht.1]
  refine (mul_le_of_le_one_left (abs_nonneg _) ht.2).trans ?_
  refine (abs_add_le _ _).trans ?_
  simpa only [abs_mul] using add_le_add_left (abs_add_le
    (partialDeriv m (partialDeriv i χ) x * (b x - g x))
    (partialDeriv i χ x * (partialDeriv m b x - partialDeriv m g x)))
    |partialDeriv m χ x * (partialDeriv i b x - partialDeriv i g x)|

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]

omit [TopologicalSpace M] in
private theorem spliceWeight_mem_Icc (χ : M → ℝ) (hχ01 : ∀ z, χ z ∈ Icc (0 : ℝ) 1)
    (t : ℝ) (ht : t ∈ Icc (0 : ℝ) 1) : ∀ z, (fun y => t * χ y) z ∈ Icc (0 : ℝ) 1 := by
  intro z
  exact ⟨mul_nonneg ht.1 (hχ01 z).1, (mul_le_of_le_one_left (hχ01 z).1 ht.2).trans (hχ01 z).2⟩

/-- A smooth Riemannian splice with coefficient `t * χ` on `b`. -/
def chartSpliceMetric (g b : SmoothRiemannianMetric I M) (χ : M → ℝ)
    (hχ : ContMDiff I 𝓘(ℝ) ∞ χ) (hχ01 : ∀ z, χ z ∈ Icc (0 : ℝ) 1)
    (t : ℝ) (ht : t ∈ Icc (0 : ℝ) 1) : SmoothRiemannianMetric I M :=
  b.convexComb g (fun z => t * χ z) (contMDiff_const.mul hχ) (spliceWeight_mem_Icc χ hχ01 t ht)

private theorem chartGramOnE_splice (g b : SmoothRiemannianMetric I M) (χ : M → ℝ)
    (hχ : ContMDiff I 𝓘(ℝ) ∞ χ) (hχ01 : ∀ z, χ z ∈ Icc (0 : ℝ) 1)
    (t : ℝ) (ht : t ∈ Icc (0 : ℝ) 1) (α : M) (a c : Fin (Module.finrank ℝ E)) :
    chartGramOnE (chartSpliceMetric g b χ hχ hχ01 t ht) α a c = fun x =>
      (1 - t * χ ((extChartAt I α).symm x)) * chartGramOnE g α a c x +
        t * χ ((extChartAt I α).symm x) * chartGramOnE b α a c x := by
  funext x
  simp only [chartGramOnE_def, chartGramMatrix_apply]
  rw [add_comm]
  simpa only [smul_eq_mul, chartSpliceMetric] using convexComb_inner b g (fun z => t * χ z) (contMDiff_const.mul hχ)
    (spliceWeight_mem_Icc χ hχ01 t ht) ((extChartAt I α).symm x)
    (chartBasisVecFiber (I := I) α a ((extChartAt I α).symm x))
    (chartBasisVecFiber (I := I) α c ((extChartAt I α).symm x))

/-- The Hessian commutator applied to the actual Gram coefficients of the
smooth splice in the common chart. -/
theorem chartSpliceMetric_secondPartial_sub (g b : SmoothRiemannianMetric I M) (χ : M → ℝ)
    (hχ : ContMDiff I 𝓘(ℝ) ∞ χ) (hχ01 : ∀ z, χ z ∈ Icc (0 : ℝ) 1)
    (t : ℝ) (ht : t ∈ Icc (0 : ℝ) 1) (α : M) {x : E}
    (hx : x ∈ interior (extChartAt I α).target) (m i a c : Fin (Module.finrank ℝ E)) :
    let χ' := fun y => χ ((extChartAt I α).symm y)
    let G := chartGramOnE g α a c
    let B := chartGramOnE b α a c
    partialDeriv m (partialDeriv i (chartGramOnE (chartSpliceMetric g b χ hχ hχ01 t ht) α a c)) x -
      ((1 - t * χ' x) * partialDeriv m (partialDeriv i G) x +
        t * χ' x * partialDeriv m (partialDeriv i B) x) = spliceSecondPartialError t χ' G B x m i := by
  intro χ' G B
  have hχOn : ContDiffOn ℝ ∞ χ' (extChartAt I α).target :=
    ((hχ.contMDiffOn (s := univ)).comp (contMDiffOn_extChartAt_symm (I := I) α)
      (mapsTo_univ _ _)).contDiffOn
  have hInt : (extChartAt I α).target ∈ 𝓝 x := mem_interior_iff_mem_nhds.mp hx
  rw [chartGramOnE_splice]
  exact spliceSecondPartial_sub t ((hχOn.contDiffAt hInt).of_le (by simp))
    (((chartGramOnE_contDiffOn g α a c).contDiffAt hInt).of_le (by simp))
    (((chartGramOnE_contDiffOn b α a c).contDiffAt hInt).of_le (by simp)) m i

/-- The constant-coefficient principal part for `chartRiemannLower`. The first
two slots of `D` are the outer and inner derivative directions. -/
def loweredCurvaturePrincipal {n : ℕ} (D : Fin n → Fin n → Fin n → Fin n → ℝ)
    (i j k l : Fin n) : ℝ :=
  (1 / 2 : ℝ) * ((D j i l k + D j k l i - D j l i k) - (D k i l j + D k j l i - D k l i j))

/-- The principal part has operator bound three for the maximum coefficient norm. -/
theorem abs_loweredCurvaturePrincipal_le {n : ℕ} (D : Fin n → Fin n → Fin n → Fin n → ℝ)
    {C : ℝ} (hC : ∀ m d a c, |D m d a c| ≤ C) (i j k l : Fin n) :
    |loweredCurvaturePrincipal D i j k l| ≤ 3 * C := by
  have hSub (a b : ℝ) : |a - b| ≤ |a| + |b| := by
    simpa only [sub_eq_add_neg, abs_neg] using abs_add_le a (-b)
  have hThree (a b c : ℝ) (ha : |a| ≤ C) (hb : |b| ≤ C) (hc : |c| ≤ C) :
      |a + b - c| ≤ 3 * C := by
    linarith only [hSub (a + b) c, abs_add_le a b, ha, hb, hc]
  have hLeft := hThree _ _ _ (hC j i l k) (hC j k l i) (hC j l i k)
  have hRight := hThree _ _ _ (hC k i l j) (hC k j l i) (hC k l i j)
  rw [loweredCurvaturePrincipal, abs_mul, abs_of_nonneg (by norm_num : 0 ≤ (1 / 2 : ℝ))]
  linarith only [hLeft, hRight, hSub (D j i l k + D j k l i - D j l i k) (D k i l j + D k j l i - D k l i j)]

/-- The principal curvature term computed from the actual coordinate Hessian. -/
def chartCurvaturePrincipal (g : SmoothRiemannianMetric I M) (α : M) (x : E)
    (i j k l : Fin (Module.finrank ℝ E)) : ℝ :=
  loweredCurvaturePrincipal (fun m d a c => partialDeriv m (partialDeriv d (chartGramOnE g α a c)) x)
    i j k l

/-- The principal curvature commutator for the path on the original type.
The error has only cutoff derivatives and the degree zero and one metric jets. -/
theorem chartSplicePrincipal_sub (g b : SmoothRiemannianMetric I M) (χ : M → ℝ)
    (hχ : ContMDiff I 𝓘(ℝ) ∞ χ) (hχ01 : ∀ z, χ z ∈ Icc (0 : ℝ) 1)
    (t : ℝ) (ht : t ∈ Icc (0 : ℝ) 1) (α : M) {x : E}
    (hx : x ∈ interior (extChartAt I α).target) (i j k l : Fin (Module.finrank ℝ E)) :
    let χ' := fun y => χ ((extChartAt I α).symm y)
    chartCurvaturePrincipal (chartSpliceMetric g b χ hχ hχ01 t ht) α x i j k l -
      ((1 - t * χ' x) * chartCurvaturePrincipal g α x i j k l +
        t * χ' x * chartCurvaturePrincipal b α x i j k l) =
      loweredCurvaturePrincipal (fun m d a c =>
        spliceSecondPartialError t χ' (chartGramOnE g α a c) (chartGramOnE b α a c) x m d) i j k l := by
  intro χ'
  have h (m d a c : Fin (Module.finrank ℝ E)) :=
    sub_eq_iff_eq_add.mp (chartSpliceMetric_secondPartial_sub g b χ hχ hχ01 t ht α hx m d a c)
  simp only [chartCurvaturePrincipal, loweredCurvaturePrincipal, h]
  ring

private def firstOnlyJet {n : ℕ} (p : MatJet E n) : MatJet E n := (p.1, p.2.1, 0)

omit [FiniteDimensional ℝ E] in
private theorem loweredJetRiemann_eq {n : ℕ} (basis : Fin n → E) (p : MatJet E n)
    (hDet : IsUnit (Matrix.of p.1).det) (i j k l : Fin n) :
    (∑ m, p.1 l m * jetRiemann basis p i j k m) =
      loweredCurvaturePrincipal (fun a d r s => p.2.2 (basis a) (basis d) r s) i j k l +
        ∑ m, p.1 l m * jetRiemann basis (firstOnlyJet p) i j k m := by
  let A := Matrix.of p.1
  let B := fun a d r s => p.2.2 (basis a) (basis d) r s
  let C := fun m a d r => B m a r d + B m d r a - B m r a d
  have hΓ (a d r : Fin n) : jetChristoffel basis p a d r =
      jetChristoffel basis (firstOnlyJet p) a d r := rfl
  have hD (m a d q : Fin n) : jetChristoffelDeriv basis p m a d q =
      jetChristoffelDeriv basis (firstOnlyJet p) m a d q +
        (1 / 2 : ℝ) * ∑ r, A⁻¹ q r * C m a d r := by
    simp only [jetChristoffelDeriv, firstOnlyJet, zero_apply, Pi.zero_apply,
      add_zero, sub_zero, mul_zero, Finset.sum_add_distrib, mul_add, A, B, C]
  let D := fun r => C j i k r - C k i j r
  have hR (q : Fin n) : jetRiemann basis p i j k q = jetRiemann basis (firstOnlyJet p) i j k q +
      (1 / 2 : ℝ) * ∑ r, A⁻¹ q r * D r := by
    simp only [jetRiemann, hD, hΓ, D, mul_sub, Finset.sum_sub_distrib]
    ring
  have hContract : (∑ q, p.1 l q * ∑ r, A⁻¹ q r * D r) = D l := by
    change A.mulVec (A⁻¹.mulVec D) l = D l
    rw [Matrix.mulVec_mulVec, Matrix.mul_nonsing_inv _ hDet, Matrix.one_mulVec]
  calc
    _ = (∑ m, p.1 l m * jetRiemann basis (firstOnlyJet p) i j k m) +
        (1 / 2 : ℝ) * ∑ q, p.1 l q * ∑ r, A⁻¹ q r * D r := by
      simp_rw [hR, mul_add, Finset.sum_add_distrib]
      congr 1
      rw [Finset.mul_sum]
      exact Finset.sum_congr rfl fun _ _ => by ring
    _ = _ := by
      rw [hContract, add_comm]
      rfl

/-- The lower-order term uses just the value, inverse, and first derivative of
the coordinate metric. It is the lowered jet curvature with zero second jet. -/
def chartCurvatureFirstJetTerm (g : SmoothRiemannianMetric I M) (α : M) (x : E)
    (i j k l : Fin (Module.finrank ℝ E)) : ℝ :=
  ∑ m, chartGramOnE g α l m x *
    jetRiemann (chartModelBasis E) (chartGramPi g α x, fderiv ℝ (chartGramPi g α) x, 0) i j k m

/-- Identify the constant-coefficient principal part with the all-lowered
curvature of the actual chart metric. Matrix inversion cancels when lowering
the second-derivative contribution. -/
theorem chartRiemannLower_eq_principal_add_firstJet [NeZero (Module.finrank ℝ E)]
    (g : SmoothRiemannianMetric I M) (α : M) {x : E} (hx : x ∈ interior (extChartAt I α).target)
    (i j k l : Fin (Module.finrank ℝ E)) :
    chartRiemannLower g α i j k l x = chartCurvaturePrincipal g α x i j k l +
      chartCurvatureFirstJetTerm g α x i j k l := by
  have hInt : (extChartAt I α).target ∈ 𝓝 x := mem_interior_iff_mem_nhds.mp hx
  have hG : ContDiffAt ℝ 2 (chartGramPi g α) x := by
    refine contDiffAt_pi.mpr fun a => contDiffAt_pi.mpr fun c => ?_
    exact ((chartGramOnE_contDiffOn g α a c).contDiffAt hInt).of_le (by simp)
  have hG0 := hG.differentiableAt (by norm_num)
  have hG1 : ∀ᶠ y in 𝓝 x, DifferentiableAt ℝ (chartGramPi g α) y :=
    (hG.eventually (by simp)).mono fun _ hy => hy.differentiableAt (by norm_num)
  have hG2 := (hG.fderiv_right (m := 1) (by norm_num)).differentiableAt one_ne_zero
  let p := jet2 (chartGramPi g α) x
  have hGram : Matrix.of p.1 = chartGramMatrix g α ((extChartAt I α).symm x) := by ext a c; rfl
  have hDet : IsUnit (Matrix.of p.1).det := by
    rw [hGram, isUnit_iff_ne_zero]
    exact (chartGramMatrix_det_pos g α (extChartAt_symm_mem_trivializationAt_baseSet α (interior_subset hx))).ne'
  rw [chartRiemannLower_def]
  simp_rw [chartRiemann_eq_jet g α hx hG0 hG1 hG2]
  change (∑ m, p.1 l m * jetRiemann (chartModelBasis E) p i j k m) = _
  rw [loweredJetRiemann_eq _ _ hDet]
  simp only [chartCurvaturePrincipal, loweredCurvaturePrincipal, chartCurvatureFirstJetTerm, p]
  simp only [jet2_chartGram_d2 g α hG1 hG2]
  rfl

/-- For actual all-lowered curvature, the commutator splits into the explicit
cutoff error and the difference of first-jet terms. In particular, neither
term on the right uses second derivatives of the input metrics. -/
theorem chartSpliceRiemannLower_sub [NeZero (Module.finrank ℝ E)]
    (g b : SmoothRiemannianMetric I M) (χ : M → ℝ)
    (hχ : ContMDiff I 𝓘(ℝ) ∞ χ) (hχ01 : ∀ z, χ z ∈ Icc (0 : ℝ) 1)
    (t : ℝ) (ht : t ∈ Icc (0 : ℝ) 1) (α : M) {x : E}
    (hx : x ∈ interior (extChartAt I α).target) (i j k l : Fin (Module.finrank ℝ E)) :
    let χ' := fun y => χ ((extChartAt I α).symm y)
    let h := chartSpliceMetric g b χ hχ hχ01 t ht
    chartRiemannLower h α i j k l x -
      ((1 - t * χ' x) * chartRiemannLower g α i j k l x + t * χ' x * chartRiemannLower b α i j k l x) =
      loweredCurvaturePrincipal (fun m d a c =>
        spliceSecondPartialError t χ' (chartGramOnE g α a c) (chartGramOnE b α a c) x m d) i j k l +
      (chartCurvatureFirstJetTerm h α x i j k l -
        ((1 - t * χ' x) * chartCurvatureFirstJetTerm g α x i j k l +
          t * χ' x * chartCurvatureFirstJetTerm b α x i j k l)) := by
  intro χ' h
  simp only [chartRiemannLower_eq_principal_add_firstJet _ α hx]
  linear_combination chartSplicePrincipal_sub g b χ hχ hχ01 t ht α hx i j k l

end

end SmoothPoincare
