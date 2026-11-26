import SmoothPoincare.Variational.BourTransportedInterior
import DifferentialGeometry.Geometry.Coordinates.TensorComponents
import SmoothPoincare.Variational.BourGradientComparison
import SmoothPoincare.Variational.BourMetricInteriorEstimate
import DifferentialGeometry.Geometry.Metric.Coordinates.InverseGramPerturbation

/-! # Stationary Ricci equation in harmonic coordinates

E51, 26 November 2026. Prepared for Edward B. Baker III with OpenAI Codex
assistance. Actual serving model and reasoning effort were unavailable.
-/

open DifferentialGeometry DifferentialGeometry.Geometry.Connection
  DifferentialGeometry.Geometry.Curvature DifferentialGeometry.Geometry.Operator
  DifferentialGeometry.PDE.RicciFlow DifferentialGeometry.Tensor.Coordinates
  DifferentialGeometry.Tensor0SBundle DifferentialGeometry.Tensor.RSTensor
  Bundle Set Filter SmoothPoincare.Bour
open scoped ContDiff Manifold Topology BigOperators NNReal

namespace SmoothPoincare

noncomputable section

variable {E H M : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
  [FiniteDimensional ℝ E] [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]

local notation "J" => Fin (Module.finrank ℝ E)
local notation "∂" => DifferentialGeometry.Tensor.Coordinates.partialDeriv

private theorem bourContractedChristoffelGauge_deriv
    (g : SmoothRiemannianMetric I M) (p : M) {y : E}
    (hy : y ∈ interior (extChartAt I p).target) (i k : J)
    (hGauge : (fun z => ∑ a : J, ∑ b : J, chartInvGramOnE g p a b z *
      chartChristoffel g p a b k z) =ᶠ[𝓝 y] (fun _ => 0)) :
    (∑ a : J, ∑ b : J, ∂ i (chartInvGramOnE g p a b) y * chartChristoffel g p a b k y) +
      (∑ a : J, ∑ b : J, chartInvGramOnE g p a b y * ∂ i (chartChristoffel g p a b k) y) = 0 := by
  have hA (a b : J) := chartInvGramOnE_differentiableAt_interior g p a b hy
  have hΓ (a b : J) : DifferentiableAt ℝ (chartChristoffel g p a b k) y :=
    (((chartChristoffel_contDiffOn_interior g p a b k).contDiffAt
      (isOpen_interior.mem_nhds hy)).differentiableAt (by simp))
  have hProd (a b : J) : DifferentiableAt ℝ
      (fun z => chartInvGramOnE g p a b z * chartChristoffel g p a b k z) y :=
    (hA a b).mul (hΓ a b)
  have hd : ∂ i (fun z => ∑ a : J, ∑ b : J, chartInvGramOnE g p a b z *
      chartChristoffel g p a b k z) y =
      (∑ a : J, ∑ b : J, ∂ i (chartInvGramOnE g p a b) y * chartChristoffel g p a b k y) +
      ∑ a : J, ∑ b : J, chartInvGramOnE g p a b y * ∂ i (chartChristoffel g p a b k) y := by
    unfold partialDeriv
    rw [fderiv_fun_sum (fun a _ => DifferentiableAt.fun_sum (fun b _ => hProd a b)),
      sum_apply, ← Finset.sum_add_distrib]
    refine Finset.sum_congr rfl fun a _ => ?_
    rw [fderiv_fun_sum (fun b _ => hProd a b), sum_apply, ← Finset.sum_add_distrib]
    refine Finset.sum_congr rfl fun b _ => ?_
    rw [fderiv_fun_mul (hA a b) (hΓ a b)]
    simp only [add_apply, smul_apply, smul_eq_mul]
    ring
  rw [← hd]
  unfold partialDeriv
  rw [hGauge.fderiv_eq]
  simp

/-- The derivative of the zero harmonic gauge replaces the contracted
Christoffel derivative by curvature and first metric jets. -/
theorem bourChartContractedChristoffelDerivative_eq
    (g : SmoothRiemannianMetric I M) (p : M) {y : E}
    (hy : y ∈ interior (extChartAt I p).target) (i k : J)
    (hGauge : (fun z => ∑ a : J, ∑ b : J, chartInvGramOnE g p a b z *
      chartChristoffel g p a b k z) =ᶠ[𝓝 y] (fun _ => 0)) :
    (∑ a : J, ∑ b : J, chartInvGramOnE g p a b y * ∂ a (chartChristoffel g p b i k) y) =
      (∑ a : J, ∑ b : J, chartInvGramOnE g p a b y *
        (chartRiemannTensor g p b a i k y -
          ∑ m : J, (chartChristoffel g p a m k y * chartChristoffel g p b i m y -
            chartChristoffel g p i m k y * chartChristoffel g p b a m y))) -
      ∑ a : J, ∑ b : J, ∂ i (chartInvGramOnE g p a b) y * chartChristoffel g p a b k y := by
  have hG := bourContractedChristoffelGauge_deriv g p hy i k hGauge
  have hC (a b : J) : chartRiemannTensor g p b a i k y -
      (∑ m : J, (chartChristoffel g p a m k y * chartChristoffel g p b i m y -
        chartChristoffel g p i m k y * chartChristoffel g p b a m y)) =
      ∂ a (chartChristoffel g p b i k) y - ∂ i (chartChristoffel g p a b k) y := by
    rw [chartRiemannTensor_def, add_sub_cancel_right]
    rw [show chartChristoffel g p b a k = chartChristoffel g p a b k from
      funext (chartChristoffel_symm g p b a k)]
  simp_rw [hC, mul_sub, Finset.sum_sub_distrib]
  linarith only [hG]

variable [I.Boundaryless] [T2Space M]

/-- The cancellation applies to harmonicity of the actual chart coordinate
function throughout a neighborhood. It requires no metric second-jet bound. -/
theorem bourChartContractedChristoffelDerivative_eq_of_laplacian
    (g : SmoothRiemannianMetric I M) (p : M) {y : E}
    (hy : y ∈ interior (extChartAt I p).target) (i k : J)
    (hHarm : ∀ᶠ z in 𝓝 y, laplacian (LeviCivita g) g
      (bourChartCoordinate (I := I) p k) ((extChartAt I p).symm z) = 0) :
    (∑ a : J, ∑ b : J, chartInvGramOnE g p a b y * ∂ a (chartChristoffel g p b i k) y) =
      (∑ a : J, ∑ b : J, chartInvGramOnE g p a b y *
        (chartRiemannTensor g p b a i k y -
          ∑ m : J, (chartChristoffel g p a m k y * chartChristoffel g p b i m y -
            chartChristoffel g p i m k y * chartChristoffel g p b a m y))) -
      ∑ a : J, ∑ b : J, ∂ i (chartInvGramOnE g p a b) y * chartChristoffel g p a b k y := by
  refine bourChartContractedChristoffelDerivative_eq g p hy i k ?_
  filter_upwards [hHarm, isOpen_interior.mem_nhds hy] with z hz hzi
  have ht := interior_subset hzi
  have hs : (extChartAt I p).symm z ∈ (chartAt H p).source := by
    rw [← extChartAt_source (I := I)]
    exact (extChartAt I p).map_target ht
  have h := bourLaplacian_chartCoordinate g p k hs
  rw [(extChartAt I p).right_inv ht, hz] at h
  exact neg_eq_zero.mp h.symm

omit [FiniteDimensional ℝ E] in
private theorem abs_sum_le_finrank (f : J → ℝ) (C : ℝ) (h : ∀ i, |f i| ≤ C) :
    |∑ i, f i| ≤ (Module.finrank ℝ E : ℝ) * C := by
  calc
    _ ≤ ∑ i, |f i| := Finset.abs_sum_le_sum_abs _ _
    _ ≤ ∑ _i : J, C := Finset.sum_le_sum fun i _ => h i
    _ = _ := by simp

private theorem abs_mul_le_nonneg {a b A B : ℝ} (hA : 0 ≤ A) (ha : |a| ≤ A)
    (hb : |b| ≤ B) : |a * b| ≤ A * B := by
  rw [abs_mul]
  exact mul_le_mul ha hb (abs_nonneg _) hA

/-- Uniform bound for the differentiated connection after the two
derivative indices have been contracted in the harmonic chart.
Only the actual curvature and first metric jet enter the bound. -/
theorem bourChartContractedChristoffelDerivative_bound
    (g : SmoothRiemannianMetric I M) (p : M) {y : E}
    (hy : y ∈ interior (extChartAt I p).target) (i k : J)
    (hHarm : ∀ᶠ z in 𝓝 y, laplacian (LeviCivita g) g
      (bourChartCoordinate (I := I) p k) ((extChartAt I p).symm z) = 0)
    {A D G K : ℝ} (hA : 0 ≤ A) (hD : 0 ≤ D) (hG : 0 ≤ G)
    (hInv : ∀ a b : J, |chartInvGramOnE g p a b y| ≤ A)
    (hGradInv : ∀ a b : J, |∂ i (chartInvGramOnE g p a b) y| ≤ D)
    (hConn : ∀ a b c : J, |chartChristoffel g p a b c y| ≤ G)
    (hCurv : ∀ a b c d : J, |chartRiemannTensor g p a b c d y| ≤ K) :
    |∑ a : J, ∑ b : J, chartInvGramOnE g p a b y * ∂ a (chartChristoffel g p b i k) y| ≤
      (Module.finrank ℝ E : ℝ) ^ 2 *
        (A * (K + 2 * (Module.finrank ℝ E : ℝ) * G ^ 2) + D * G) := by
  rw [bourChartContractedChristoffelDerivative_eq_of_laplacian g p hy i k hHarm]
  let n : ℝ := Module.finrank ℝ E
  have hn : 0 ≤ n := Nat.cast_nonneg _
  let error (a b : J) := ∑ m : J,
    (chartChristoffel g p a m k y * chartChristoffel g p b i m y -
      chartChristoffel g p i m k y * chartChristoffel g p b a m y)
  have hError (a b : J) : |error a b| ≤ 2 * n * G ^ 2 := by
    calc
      _ ≤ n * (G * G + G * G) := abs_sum_le_finrank _ _ fun m =>
        (abs_sub _ _).trans (add_le_add
          (abs_mul_le_nonneg hG (hConn _ _ _) (hConn _ _ _))
          (abs_mul_le_nonneg hG (hConn _ _ _) (hConn _ _ _)))
      _ = _ := by ring
  have doubleBound (f : J → J → ℝ) (B : ℝ) (h : ∀ a b, |f a b| ≤ B) :
      |∑ a, ∑ b, f a b| ≤ n ^ 2 * B := by
    calc
      _ ≤ n * (n * B) := abs_sum_le_finrank _ _ (fun a => abs_sum_le_finrank _ _ (h a))
      _ = _ := by ring
  calc
    _ ≤ |∑ a : J, ∑ b : J, chartInvGramOnE g p a b y *
        (chartRiemannTensor g p b a i k y - error a b)| +
        |∑ a : J, ∑ b : J, ∂ i (chartInvGramOnE g p a b) y * chartChristoffel g p a b k y| :=
      abs_sub _ _
    _ ≤ n ^ 2 * (A * (K + 2 * n * G ^ 2)) + n ^ 2 * (D * G) :=
      add_le_add (doubleBound _ _ fun a b => abs_mul_le_nonneg hA (hInv a b)
        ((abs_sub _ _).trans (add_le_add (hCurv b a i k) (hError a b))))
        (doubleBound _ _ fun a b => abs_mul_le_nonneg hD (hGradInv a b) (hConn a b k))
    _ = _ := by dsimp [n]; ring

variable [BoundarylessManifold I M]

/-- The tensor in the stationary equation, with the ordinary covariant
trace-free Ricci components in dimension four. -/
def bourTraceFreeRicciField (g : SmoothRiemannianMetric I M) :
    Tensor0SField (I := I) (M := M) ∞ 2 :=
  metricRicci g - (1 / 4 : ℝ) •
    tensor0SFieldSmulByFun ∞ (metricScalarAt g) (metricScalar_smooth g) (metricTensorField g)

omit [I.Boundaryless] [BoundarylessManifold I M] in
theorem bourTraceFreeRicciField_apply (g : SmoothRiemannianMetric I M)
    (x : M) (u v : TangentSpace I x) :
    bourTraceFreeRicciField g x (vec2 u v) =
      metricRicciAt g x (vec2 u v) - metricScalarAt g x / 4 * g.inner x u v := by
  simp [bourTraceFreeRicciField, ContMDiffSection.coe_sub, Pi.sub_apply,
    ContMDiffSection.coe_smul, Pi.smul_apply, tensor0SField_smulByFun_apply,
    smul_eq_mul, metricRicci_apply, metricTensorField_apply, vec2]
  ring

omit [I.Boundaryless] [BoundarylessManifold I M] in
/-- The stationary tensor's covariant components are unchanged under
physical constant rescaling, even though its raised components change. -/
theorem bourTraceFreeRicciField_scale (g : SmoothRiemannianMetric I M)
    {a : ℝ} (ha : 0 < a) :
    bourTraceFreeRicciField (scaleMetric a ha g) = bourTraceFreeRicciField g := by
  ext x w
  have hw : w = vec2 (w 0) (w 1) := by
    funext i
    fin_cases i <;> rfl
  rw [hw, bourTraceFreeRicciField_apply, bourTraceFreeRicciField_apply,
    metricRicciAt_scaleMetric, metricScalarAt_scaleMetric, scaleMetric_inner]
  field_simp

/-- The full geometric forcing of the rough Ricci equation on an actual
constant-scalar stationary slice, prior to the coordinate expansion. -/
theorem bourStationary_roughRicci_eq (α : ℝ) (g : SmoothRiemannianMetric I M)
    (R : ℝ) (hR : ∀ y, metricScalarAt g y = R) (x : M)
    (hStat : Bour.bourCovariantGradient α g x = 0) (u v : TangentSpace I x) :
    roughLap0SField g (metricRicci g) x (vec2 u v) =
      -2 * hamiltonCurvatureRicciAt g x (vec2 u v) -
        (α - 4) / 6 * R * metricRicciAt g x (vec2 u v) +
        bourBulkDensity α g x * g.inner x u v := by
  have h := Bour.bourCovariantGradient_apply_csc α g R hR x u v
  rw [hStat] at h
  have hz : (0 : Tensor0SSpace 2 I x) (vec2 u v) = 0 := rfl
  rw [hz] at h
  linarith only [h]

/-- On a constant-scalar metric the physical trace-free Ricci equation
has precisely the same rough forcing as the full Ricci equation. -/
theorem bourStationary_roughTraceFreeRicci_eq (α : ℝ) (g : SmoothRiemannianMetric I M)
    (R : ℝ) (hR : ∀ y, metricScalarAt g y = R) (x : M)
    (hStat : bourCovariantGradient α g x = 0) (u v : TangentSpace I x) :
    roughLap0SField g (bourTraceFreeRicciField g) x (vec2 u v) =
      -2 * hamiltonCurvatureRicciAt g x (vec2 u v) -
        (α - 4) / 6 * R * metricRicciAt g x (vec2 u v) +
        bourBulkDensity α g x * g.inner x u v := by
  have hzero : metricNabla0S g (tensor0SFieldSmulByFun ∞ (metricScalarAt g)
      (metricScalar_smooth g) (metricTensorField g)) = 0 := by
    ext y w
    have hw : w = Fin.cons (w 0) (vec2 (w 1) (w 2)) := by
      funext i
      fin_cases i <;> rfl
    rw [hw, bourMetricNabla_scalarMetric, differential1FormFun_apply_eq_mvfderiv]
    rw [show metricScalarAt g = fun _ => R from funext hR]
    simp [mvfderiv, mfderiv_const]
  have hN : metricNabla0S g (bourTraceFreeRicciField g) = metricNabla0S g (metricRicci g) := by
    rw [bourTraceFreeRicciField, metricNabla0S_sub, metricNabla0S_smul, hzero, smul_zero, sub_zero]
  rw [roughLap0SField, hN, ← roughLap0SField]
  exact bourStationary_roughRicci_eq α g R hR x hStat u v

omit [I.Boundaryless] [T2Space M] [BoundarylessManifold I M] in
/-- The stationary zeroth-order coefficient on the normalized metric
is the original coefficient divided by the curvature scale. -/
theorem bourStationary_scalarCoefficient_scale (α : ℝ) (g : SmoothRiemannianMetric I M)
    {a : ℝ} (ha : 0 < a) (x : M) :
    (2 - α) / 12 * metricScalarAt (scaleMetric a ha g) x =
      ((2 - α) / 12 * metricScalarAt g x) / a := by
  rw [metricScalarAt_scaleMetric]
  ring

/-- The smooth covariant section expressed on the fixed chart axes,
including the derivative slots of an iterated covariant derivative. -/
def bourChartTensorComponent {s : ℕ}
    (T : Tensor0SField (I := I) (M := M) ∞ s) (p : M) (slots : Fin s → J) (z : E) : ℝ :=
  T ((extChartAt I p).symm z)
    (fun i => chartBasisVecFiber p (slots i) ((extChartAt I p).symm z))

omit [BoundarylessManifold I M] in
/-- The actual coordinate derivative formula for the smooth Levi–Civita
derivative, with the new derivative index in front. -/
theorem bourChartTensorComponent_nabla (g : SmoothRiemannianMetric I M)
    {s : ℕ} (T : Tensor0SField (I := I) (M := M) ∞ s) (p : M)
    {z : E} (hz : z ∈ (extChartAt I p).target) (d : J) (slots : Fin s → J) :
    bourChartTensorComponent (metricNabla0S g T) p (Fin.cons d slots) z =
      ∂ d (bourChartTensorComponent T p slots) z -
      ∑ i : Fin s, ∑ k : J, chartChristoffel g p d (slots i) k z *
        bourChartTensorComponent T p (Function.update slots i k) z := by
  let x := (extChartAt I p).symm z
  have hx : x ∈ chartLeviCivitaGoodSet (I := I) p :=
    (mem_chartLeviCivitaGoodSet_iff_mem_extChartAt_source (I := I) p x).2
      ((extChartAt I p).map_target hz)
  have hR : TotalNabla0SRealizes s (metricCov g) T (metricNabla0S g T) :=
    totalNabla0S_realizes s (metricCov g) T _
  have h := totalNabla0S_chartComponent g T (metricNabla0S g T) hR p hx d slots
  rw [show extChartAt I p x = z from (extChartAt I p).right_inv hz] at h
  have hAxes : (fun i => chartBasisVecFiber (I := I) p ((Fin.cons d slots : Fin (s + 1) → J) i) x) =
      Fin.cons (chartBasisVecFiber p d x) (fun i => chartBasisVecFiber p (slots i) x) := by
    funext i
    cases i using Fin.cases <;> rfl
  unfold bourChartTensorComponent
  rw [hAxes]
  exact h

omit [BoundarylessManifold I M] in
/-- The physical rough Laplacian of the genuine smooth covariant tensor
is the inverse Gram trace of its ordered second derivative on the chart. -/
theorem bourChartRoughTwo_eq_orderedTrace (g : SmoothRiemannianMetric I M)
    (T : Tensor0SField (I := I) (M := M) ∞ 2) (p : M)
    {z : E} (hz : z ∈ (extChartAt I p).target) (i j : J) :
    bourChartTensorComponent (roughLap0SField g T) p ![i, j] z =
      ∑ a : J, ∑ b : J, chartInvGramOnE g p a b z *
        bourChartTensorComponent (metricNabla0S g (metricNabla0S g T)) p
          (Fin.cons a (Fin.cons b ![i, j])) z := by
  let x := (extChartAt I p).symm z
  have hx : x ∈ (trivializationAt E (TangentSpace I) p).baseSet :=
    chartLeviCivitaGoodSet_mem_baseSet (I := I)
      ((mem_chartLeviCivitaGoodSet_iff_mem_extChartAt_source (I := I) p x).2
        ((extChartAt I p).map_target hz))
  unfold bourChartTensorComponent
  rw [roughLap0SField, covDiv0SField, metricTraceFirstTwoField_apply, metricTraceFirstTwo0STensor_apply,
    metricTraceFirstTwo0SAt_eq_sum_basis g (chartBasisFamily p hx)
      (fun a b => chartInvGramMatrix g p x a b) (chartInvGram_inverse g p hx)]
  unfold metricTrace0S2InBasis
  simp_rw [chartBasisFamily_apply (I := I) p hx]
  refine Finset.sum_congr rfl fun a _ => Finset.sum_congr rfl fun b _ => ?_
  congr 2
  funext k
  fin_cases k <;> rfl

omit [BoundarylessManifold I M] in
/-- The differentiated connection acting in both tensor slots has
pointwise bounded coefficient after the harmonic contraction. -/
theorem bourChartDerivativeActionTwo_cancel
    (g : SmoothRiemannianMetric I M) (p : M) {z : E}
    (hz : z ∈ interior (extChartAt I p).target)
    (hHarm : ∀ k : J, ∀ᶠ y in 𝓝 z, laplacian (LeviCivita g) g
      (bourChartCoordinate (I := I) p k) ((extChartAt I p).symm y) = 0)
    (T : J → J → ℝ) (i j : J) :
    let D (d k : J) := (∑ a : J, ∑ b : J, chartInvGramOnE g p a b z *
      (chartRiemannTensor g p b a d k z -
        ∑ m : J, (chartChristoffel g p a m k z * chartChristoffel g p b d m z -
          chartChristoffel g p d m k z * chartChristoffel g p b a m z))) -
      ∑ a : J, ∑ b : J, ∂ d (chartInvGramOnE g p a b) z * chartChristoffel g p a b k z
    (∑ a : J, ∑ b : J, chartInvGramOnE g p a b z *
      ∑ k : J, (∂ a (chartChristoffel g p b i k) z * T k j +
        ∂ a (chartChristoffel g p b j k) z * T i k)) =
      ∑ k : J, (D i k * T k j + D j k * T i k) := by
  dsimp only
  simp_rw [← bourChartContractedChristoffelDerivative_eq_of_laplacian g p hz _ _ (hHarm _)]
  let V (a b k : J) := chartInvGramOnE g p a b z *
    (∂ a (chartChristoffel g p b i k) z * T k j +
      ∂ a (chartChristoffel g p b j k) z * T i k)
  calc
    _ = ∑ a : J, ∑ b : J, ∑ k : J, V a b k := by simp only [V, Finset.mul_sum]
    _ = ∑ a : J, ∑ k : J, ∑ b : J, V a b k :=
      Finset.sum_congr rfl fun a _ => Finset.sum_comm
    _ = ∑ k : J, ∑ a : J, ∑ b : J, V a b k := Finset.sum_comm
    _ = _ := by
      refine Finset.sum_congr rfl fun k _ => ?_
      simp only [V, mul_add, Finset.sum_add_distrib, Finset.sum_mul]
      apply congrArg₂ (· + ·) <;> refine Finset.sum_congr rfl fun a _ => ?_
        <;> refine Finset.sum_congr rfl fun b _ => ?_ <;> ring

omit [BoundarylessManifold I M] in
/-- The first derivative in the two covariant tensor slots, in the
actual supplying chart. -/
theorem bourChartTwo_nabla (g : SmoothRiemannianMetric I M)
    (T : Tensor0SField (I := I) (M := M) ∞ 2) (p : M)
    {z : E} (hz : z ∈ (extChartAt I p).target) (a i j : J) :
    bourChartTensorComponent (metricNabla0S g T) p (Fin.cons a ![i, j]) z =
      ∂ a (bourChartTensorComponent T p ![i, j]) z -
        ∑ k : J, (chartChristoffel g p a i k z * bourChartTensorComponent T p ![k, j] z +
          chartChristoffel g p a j k z * bourChartTensorComponent T p ![i, k] z) := by
  rw [bourChartTensorComponent_nabla g T p hz]
  have h₀ (k : J) : Function.update (![i, j] : Fin 2 → J) 0 k = ![k, j] := by
    funext m; fin_cases m <;> rfl
  have h₁ (k : J) : Function.update (![i, j] : Fin 2 → J) 1 k = ![i, k] := by
    funext m; fin_cases m <;> rfl
  simp only [Fin.sum_univ_two, Matrix.cons_val_zero, Matrix.cons_val_one, h₀, h₁,
    Finset.sum_add_distrib]

omit [BoundarylessManifold I M] in
/-- After harmonic contraction the differentiated derivative slot drops
out of the actual rough Laplacian on a smooth covariant two-tensor. -/
theorem bourChartRoughTwo_eq_harmonicFirstTrace (g : SmoothRiemannianMetric I M)
    (T : Tensor0SField (I := I) (M := M) ∞ 2) (p : M)
    {z : E} (hz : z ∈ (extChartAt I p).target)
    (hHarm : ∀ k : J, laplacian (LeviCivita g) g (bourChartCoordinate (I := I) p k)
      ((extChartAt I p).symm z) = 0) (i j : J) :
    let N (b i j : J) := bourChartTensorComponent (metricNabla0S g T) p (Fin.cons b ![i,j])
    bourChartTensorComponent (roughLap0SField g T) p ![i, j] z =
      ∑ a : J, ∑ b : J, chartInvGramOnE g p a b z *
        (∂ a (N b i j) z -
          ∑ k : J, (chartChristoffel g p a i k z * N b k j z +
            chartChristoffel g p a j k z * N b i k z)) := by
  dsimp only
  let N (b i j : J) := bourChartTensorComponent (metricNabla0S g T) p (Fin.cons b ![i,j])
  let A (a b : J) := chartInvGramOnE g p a b z
  let Γ (a b k : J) := chartChristoffel g p a b k z
  have hΓ (k : J) : (∑ a : J, ∑ b : J, A a b * Γ a b k) = 0 := by
    have hs : (extChartAt I p).symm z ∈ (chartAt H p).source := by
      rw [← extChartAt_source (I := I)]
      exact (extChartAt I p).map_target hz
    have h := bourLaplacian_chartCoordinate g p k hs
    rw [(extChartAt I p).right_inv hz, hHarm k] at h
    exact neg_eq_zero.mp h.symm
  have hgauge : (∑ a : J, ∑ b : J, A a b * ∑ k : J, Γ a b k * N k i j z) = 0 := by
    calc
      _ = ∑ a : J, ∑ b : J, ∑ k : J, (A a b * Γ a b k) * N k i j z := by
        simp_rw [Finset.mul_sum, mul_assoc]
      _ = ∑ a : J, ∑ k : J, ∑ b : J, (A a b * Γ a b k) * N k i j z :=
        Finset.sum_congr rfl fun a _ => Finset.sum_comm
      _ = ∑ k : J, (∑ a : J, ∑ b : J, A a b * Γ a b k) * N k i j z := by
        rw [Finset.sum_comm]
        simp only [Finset.sum_mul]
      _ = _ := by simp only [hΓ, zero_mul, Finset.sum_const_zero]
  have hN (a b : J) :
      bourChartTensorComponent (metricNabla0S g (metricNabla0S g T)) p
        (Fin.cons a (Fin.cons b ![i, j])) z =
      ∂ a (N b i j) z -
        (∑ k : J, Γ a b k * N k i j z +
          ∑ k : J, (Γ a i k * N b k j z + Γ a j k * N b i k z)) := by
    rw [bourChartTensorComponent_nabla g (metricNabla0S g T) p hz]
    have h₀ (k : J) : Function.update (Fin.cons b ![i,j] : Fin 3 → J) 0 k =
        Fin.cons k ![i,j] := by funext m; fin_cases m <;> rfl
    have h₁ (k : J) : Function.update (Fin.cons b ![i,j] : Fin 3 → J) 1 k =
        Fin.cons b ![k,j] := by funext m; fin_cases m <;> rfl
    have h₂ (k : J) : Function.update (Fin.cons b ![i,j] : Fin 3 → J) 2 k =
        Fin.cons b ![i,k] := by funext m; fin_cases m <;> rfl
    change ∂ a (N b i j) z -
      (∑ m : Fin 3, ∑ k : J, Γ a ((Fin.cons b ![i,j] : Fin 3 → J) m) k *
        bourChartTensorComponent (metricNabla0S g T) p
          (Function.update (Fin.cons b ![i,j] : Fin 3 → J) m k) z) = _
    rw [Fin.sum_univ_three]
    simp only [h₀, h₁, h₂, N, Γ, Finset.sum_add_distrib, add_assoc]
    rfl
  rw [bourChartRoughTwo_eq_orderedTrace g T p hz]
  simp_rw [hN, sub_add_eq_sub_sub, mul_sub, Finset.sum_sub_distrib]
  change _ - (∑ a : J, ∑ b : J, A a b * ∑ k : J, Γ a b k * N k i j z) - _ = _
  rw [hgauge, sub_zero]

omit [I.Boundaryless] [T2Space M] [BoundarylessManifold I M] in
/-- Smoothness of actual coordinate components on the interior of the chart. -/
theorem bourChartTensorComponent_contDiffAt {s : ℕ}
    (T : Tensor0SField (I := I) (M := M) ∞ s) (p : M) (slots : Fin s → J)
    {z : E} (hz : z ∈ interior (extChartAt I p).target) :
    ContDiffAt ℝ ∞ (bourChartTensorComponent T p slots) z :=
  (tensor_field_chart_components_contDiffOn T p interior_subset slots).contDiffAt
    (isOpen_interior.mem_nhds hz)

omit [BoundarylessManifold I M] in
/-- On the harmonic chart the physical rough Laplacian differs from the
component second derivative by two first-jet connection terms and the
differentiated connection contracted in the two derivative indices. -/
theorem bourChartTwo_principal_eq (g : SmoothRiemannianMetric I M) (p : M)
    (T : Tensor0SField (I := I) (M := M) ∞ 2)
    {z : E} (hz : z ∈ interior (extChartAt I p).target)
    (hHarm : ∀ k : J, laplacian (LeviCivita g) g (bourChartCoordinate (I := I) p k)
      ((extChartAt I p).symm z) = 0)
    (i j : J) :
    let Z (a b : J) := bourChartTensorComponent T p ![a,b]
    let N (d a b : J) := bourChartTensorComponent (metricNabla0S g T) p (Fin.cons d ![a,b])
    let A (a b : J) := chartInvGramOnE g p a b z
    let Γ (a b k : J) := chartChristoffel g p a b k z
    (∑ a : J, ∑ b : J, A a b * ∂ a (∂ b (Z i j)) z) =
      bourChartTensorComponent (roughLap0SField g T) p ![i,j] z +
        (∑ a : J, ∑ b : J, A a b * ∑ k : J,
          (Γ b i k * ∂ a (Z k j) z + Γ b j k * ∂ a (Z i k) z +
            Γ a i k * N b k j z + Γ a j k * N b i k z)) +
        ∑ a : J, ∑ b : J, A a b * ∑ k : J,
          (∂ a (chartChristoffel g p b i k) z * Z k j z +
            ∂ a (chartChristoffel g p b j k) z * Z i k z) := by
  let Z (a b : J) := bourChartTensorComponent T p ![a,b]
  let N (d a b : J) := bourChartTensorComponent (metricNabla0S g T) p (Fin.cons d ![a,b])
  let Γ (a b k : J) := chartChristoffel g p a b k
  have hΓ (a b k : J) : DifferentiableAt ℝ (Γ a b k) z :=
    ((chartChristoffel_contDiffOn_interior g p a b k).contDiffAt
      (isOpen_interior.mem_nhds hz)).differentiableAt (by simp)
  have hSmooth (a b : J) : ContDiffAt ℝ ∞ (Z a b) z :=
    bourChartTensorComponent_contDiffAt T p ![a,b] hz
  have hZ (a b : J) : DifferentiableAt ℝ (Z a b) z :=
    (hSmooth a b).differentiableAt (by simp)
  have hDZ (b : J) : DifferentiableAt ℝ (∂ b (Z i j)) z := by
    have h := (hSmooth i j).fderiv_right (m := 1) (by simp)
    exact (h.clm_apply contDiffAt_const).differentiableAt (by simp)
  have hND (a b : J) :
      ∂ a (N b i j) z = ∂ a (∂ b (Z i j)) z -
        ∑ k : J, ((∂ a (Γ b i k) z * Z k j z + Γ b i k z * ∂ a (Z k j) z) +
          (∂ a (Γ b j k) z * Z i k z + Γ b j k z * ∂ a (Z i k) z)) := by
    let U (k : J) (y : E) := Γ b i k y * Z k j y + Γ b j k y * Z i k y
    have he : N b i j =ᶠ[𝓝 z] (fun y => ∂ b (Z i j) y - ∑ k : J, U k y) := by
      filter_upwards [isOpen_interior.mem_nhds hz] with y hy
      exact bourChartTwo_nabla g T p (interior_subset hy) b i j
    have hU (k : J) : DifferentiableAt ℝ (U k) z :=
      ((hΓ b i k).mul (hZ k j)).add ((hΓ b j k).mul (hZ i k))
    unfold partialDeriv
    rw [he.fderiv_eq, fderiv_fun_sub (hDZ b) (DifferentiableAt.fun_sum (fun k _ => hU k)),
      sub_apply, fderiv_fun_sum (fun k _ => hU k), sum_apply]
    apply congrArg (fun u : ℝ => _ - u)
    refine Finset.sum_congr rfl fun k _ => ?_
    unfold U
    have h₁ : DifferentiableAt ℝ (fun y => Γ b i k y * Z k j y) z := (hΓ b i k).mul (hZ k j)
    have h₂ : DifferentiableAt ℝ (fun y => Γ b j k y * Z i k y) z := (hΓ b j k).mul (hZ i k)
    rw [fderiv_fun_add h₁ h₂,
      fderiv_fun_mul (hΓ b i k) (hZ k j), fderiv_fun_mul (hΓ b j k) (hZ i k)]
    simp only [add_apply, smul_apply, smul_eq_mul]
    ring
  dsimp only
  rw [bourChartRoughTwo_eq_harmonicFirstTrace g T p (interior_subset hz) hHarm i j]
  dsimp only
  dsimp only [N, Z, Γ] at hND
  simp_rw [hND, sub_sub]
  simp only [mul_sub, mul_add, Finset.sum_sub_distrib, Finset.sum_add_distrib]
  ring

omit [BoundarylessManifold I M] in
/-- Pointwise inhomogeneous principal bound for the actual rank-two rough
equation in a harmonic chart. The first-derivative term remains on the
right and has a coefficient given by the first metric jet. -/
theorem bourChartTwo_principal_bound (g : SmoothRiemannianMetric I M) (p : M)
    (T : Tensor0SField (I := I) (M := M) ∞ 2)
    {z : E} (hz : z ∈ interior (extChartAt I p).target)
    (hHarm : ∀ k : J, ∀ᶠ y in 𝓝 z, laplacian (LeviCivita g) g
      (bourChartCoordinate (I := I) p k) ((extChartAt I p).symm y) = 0)
    {A D G K U V F : ℝ} (hA : 0 ≤ A) (hD : 0 ≤ D) (hG : 0 ≤ G)
    (hInv : ∀ a b : J, |chartInvGramOnE g p a b z| ≤ A)
    (hGradInv : ∀ i a b : J, |∂ i (chartInvGramOnE g p a b) z| ≤ D)
    (hConn : ∀ a b c : J, |chartChristoffel g p a b c z| ≤ G)
    (hCurv : ∀ a b c d : J, |chartRiemannTensor g p a b c d z| ≤ K)
    (hZ : ∀ i j : J, |bourChartTensorComponent T p ![i,j] z| ≤ U)
    (hDZ : ∀ a i j : J, |∂ a (bourChartTensorComponent T p ![i,j]) z| ≤ V)
    (i j : J) (hRough : |bourChartTensorComponent (roughLap0SField g T) p ![i,j] z| ≤ F) :
    let n : ℝ := Module.finrank ℝ E
    let H := n ^ 2 * (A * (K + 2 * n * G ^ 2) + D * G)
    |∑ a : J, ∑ b : J, chartInvGramOnE g p a b z *
      ∂ a (∂ b (bourChartTensorComponent T p ![i,j])) z| ≤
      F + (2 * n * H + 4 * n ^ 4 * A * G ^ 2) * U + 4 * n ^ 3 * A * G * V := by
  let Z (a b : J) := bourChartTensorComponent T p ![a,b]
  let N (d a b : J) := bourChartTensorComponent (metricNabla0S g T) p (Fin.cons d ![a,b])
  let Γ (a b k : J) := chartChristoffel g p a b k z
  let n : ℝ := Module.finrank ℝ E
  let H := n ^ 2 * (A * (K + 2 * n * G ^ 2) + D * G)
  have hh (k : J) := (hHarm k).self_of_nhds
  have hN (a b c : J) : |N a b c z| ≤ V + 2 * n * G * U := by
    change |bourChartTensorComponent (metricNabla0S g T) p (Fin.cons a ![b,c]) z| ≤ _
    rw [bourChartTwo_nabla g T p (interior_subset hz)]
    refine (abs_sub _ _).trans (add_le_add (hDZ a b c) ?_)
    calc
      _ ≤ n * (G * U + G * U) := abs_sum_le_finrank _ _ fun k =>
        (abs_add_le _ _).trans (add_le_add
          (abs_mul_le_nonneg hG (hConn _ _ _) (hZ _ _))
          (abs_mul_le_nonneg hG (hConn _ _ _) (hZ _ _)))
      _ = _ := by ring
  let L (a b : J) := ∑ k : J, (Γ b i k * ∂ a (Z k j) z + Γ b j k * ∂ a (Z i k) z +
    Γ a i k * N b k j z + Γ a j k * N b i k z)
  have hL (a b : J) : |L a b| ≤ n * (4 * G * V + 4 * n * G ^ 2 * U) := by
    calc
      _ ≤ n * (G * V + G * V + G * (V + 2 * n * G * U) + G * (V + 2 * n * G * U)) :=
        abs_sum_le_finrank _ _ fun k =>
          (abs_add_le _ _).trans (add_le_add
            ((abs_add_le _ _).trans (add_le_add
              ((abs_add_le _ _).trans (add_le_add
                (abs_mul_le_nonneg hG (hConn _ _ _) (hDZ _ _ _))
                (abs_mul_le_nonneg hG (hConn _ _ _) (hDZ _ _ _))))
              (abs_mul_le_nonneg hG (hConn _ _ _) (hN _ _ _))))
            (abs_mul_le_nonneg hG (hConn _ _ _) (hN _ _ _)))
      _ = _ := by ring
  let C (d k : J) := (∑ a : J, ∑ b : J, chartInvGramOnE g p a b z *
    (chartRiemannTensor g p b a d k z -
      ∑ m : J, (Γ a m k * Γ b d m - Γ d m k * Γ b a m))) -
    ∑ a : J, ∑ b : J, ∂ d (chartInvGramOnE g p a b) z * Γ a b k
  have hC (d k : J) : |C d k| ≤ H := by
    have h := bourChartContractedChristoffelDerivative_bound g p hz d k (hHarm k)
      hA hD hG hInv (hGradInv d) hConn hCurv
    rw [bourChartContractedChristoffelDerivative_eq_of_laplacian g p hz d k (hHarm k)] at h
    exact h
  have hH : 0 ≤ H := (abs_nonneg _).trans (hC i j)
  have he := bourChartTwo_principal_eq g p T hz hh i j
  dsimp only at he
  rw [he, bourChartDerivativeActionTwo_cancel g p hz hHarm (fun a b => Z a b z) i j]
  change |bourChartTensorComponent (roughLap0SField g T) p ![i,j] z +
    (∑ a : J, ∑ b : J, chartInvGramOnE g p a b z * L a b) +
    ∑ k : J, (C i k * Z k j z + C j k * Z i k z)| ≤ _
  have hLow : |∑ k : J, (C i k * Z k j z + C j k * Z i k z)| ≤ n * (H * U + H * U) :=
    abs_sum_le_finrank _ _ fun k =>
      (abs_add_le _ _).trans (add_le_add
        (abs_mul_le_nonneg hH (hC _ _) (hZ _ _))
        (abs_mul_le_nonneg hH (hC _ _) (hZ _ _)))
  have hFirst : |∑ a : J, ∑ b : J, chartInvGramOnE g p a b z * L a b| ≤
      n * (n * (A * (n * (4 * G * V + 4 * n * G ^ 2 * U)))) :=
    abs_sum_le_finrank _ _ fun a => abs_sum_le_finrank _ _ fun b =>
      abs_mul_le_nonneg hA (hInv a b) (hL a b)
  calc
    _ ≤ (F + n * (n * (A * (n * (4 * G * V + 4 * n * G ^ 2 * U))))) +
        n * (H * U + H * U) :=
      (abs_add_le _ _).trans (add_le_add ((abs_add_le _ _).trans (add_le_add hRough hFirst)) hLow)
    _ = _ := by ring


omit [BoundarylessManifold I M] in
/-- The bound in the scalar principal-operator form used by the flat
Calderón–Zygmund premise. -/
theorem bourChartTwo_flatOperator_bound (g : SmoothRiemannianMetric I M) (p : M)
    (T : Tensor0SField (I := I) (M := M) ∞ 2)
    {z : E} (hz : z ∈ interior (extChartAt I p).target)
    (hHarm : ∀ k : J, ∀ᶠ y in 𝓝 z, laplacian (LeviCivita g) g
      (bourChartCoordinate (I := I) p k) ((extChartAt I p).symm y) = 0)
    {A D G K U V F : ℝ} (hA : 0 ≤ A) (hD : 0 ≤ D) (hG : 0 ≤ G)
    (hInv : ∀ a b : J, |chartInvGramOnE g p a b z| ≤ A)
    (hGradInv : ∀ i a b : J, |∂ i (chartInvGramOnE g p a b) z| ≤ D)
    (hConn : ∀ a b c : J, |chartChristoffel g p a b c z| ≤ G)
    (hCurv : ∀ a b c d : J, |chartRiemannTensor g p a b c d z| ≤ K)
    (hZ : ∀ i j : J, |bourChartTensorComponent T p ![i,j] z| ≤ U)
    (hDZ : ∀ a i j : J, |∂ a (bourChartTensorComponent T p ![i,j]) z| ≤ V)
    (i j : J) (hRough : |bourChartTensorComponent (roughLap0SField g T) p ![i,j] z| ≤ F) :
    let n : ℝ := Module.finrank ℝ E
    let H := n ^ 2 * (A * (K + 2 * n * G ^ 2) + D * G)
    |bourFlatOperator (Matrix.of fun a b => chartInvGramOnE g p a b z)
      (bourChartTensorComponent T p ![i,j]) z| ≤
      F + (2 * n * H + 4 * n ^ 4 * A * G ^ 2) * U + 4 * n ^ 3 * A * G * V := by
  dsimp only
  rw [bourFlatOperator_eq_partialDeriv _ _ _ (bourChartTensorComponent_contDiffAt T p ![i,j] hz)]
  simpa only [Matrix.of_apply] using
    bourChartTwo_principal_bound g p T hz hHarm hA hD hG hInv hGradInv hConn
      hCurv hZ hDZ i j hRough


omit [I.Boundaryless] [T2Space M] [BoundarylessManifold I M] in
/-- The actual chart Christoffel symbols need only the metric first jet. -/
theorem bourChartChristoffel_abs_le (g : SmoothRiemannianMetric I M) (p : M) (z : E)
    {A Q : ℝ} (hA : 0 ≤ A)
    (hInv : ∀ a b : J, |chartInvGramOnE g p a b z| ≤ A)
    (hGram : ∀ d a b : J, |∂ d (chartGramOnE g p a b) z| ≤ Q)
    (i j k : J) :
    |chartChristoffel g p i j k z| ≤ (3 / 2 : ℝ) * (Module.finrank ℝ E : ℝ) * A * Q := by
  rw [chartChristoffel_def, abs_mul, abs_of_nonneg (by norm_num : (0 : ℝ) ≤ 1 / 2)]
  have h (l : J) :
      |∂ i (chartGramOnE g p l j) z + ∂ j (chartGramOnE g p l i) z -
        ∂ l (chartGramOnE g p i j) z| ≤ Q + Q + Q :=
    (abs_sub _ _).trans (add_le_add ((abs_add_le _ _).trans
      (add_le_add (hGram i l j) (hGram j l i))) (hGram l i j))
  calc
    _ ≤ (1 / 2 : ℝ) * ((Module.finrank ℝ E : ℝ) * (A * (Q + Q + Q))) :=
      mul_le_mul_of_nonneg_left (abs_sum_le_finrank _ _ (fun l =>
        abs_mul_le_nonneg hA (hInv k l) (h l))) (by norm_num)
    _ = _ := by ring

omit [I.Boundaryless] [T2Space M] [BoundarylessManifold I M] in
/-- In the model chart the component is the smooth tensor on the fixed
model axes at the same physical coordinate point. -/
theorem bourChartTensorComponent_model {s : ℕ}
    (T : Tensor0SField (I := 𝓘(ℝ, E)) (M := E) ∞ s) (p z : E) (slots : Fin s → J) :
    bourChartTensorComponent T p slots z =
      T z (fun i => chartModelBasis E (slots i)) := by
  have hPoint : (extChartAt 𝓘(ℝ, E) p).symm z = z := by
    rw [extChartAt_model_space_eq_id]
    rfl
  refine (congrArg (fun x : E => T x (fun i => chartBasisVecFiber p (slots i) x)) hPoint).trans ?_
  congr 1
  funext i
  simp only [chartBasisVecFiber, TangentBundle.symmL_model_space]
  rfl

omit [I.Boundaryless] [T2Space M] [BoundarylessManifold I M] in
/-- Principal bound for actual components on the open harmonic part of
the extended model. The metric input is the inverse-entry bound and the
ordinary metric first jet on the same ball. -/
theorem bourModelHarmonicTwo_flatOperator_bound
    (g : SmoothRiemannianMetric 𝓘(ℝ, E) E)
    (T : Tensor0SField (I := 𝓘(ℝ, E)) (M := E) ∞ 2)
    {W : Set E} (hW : IsOpen W) {z : E} (hz : z ∈ W)
    (hHarm : ∀ y ∈ W, ∀ k : J, laplacian (LeviCivita g) g
      (bourChartCoordinate (I := 𝓘(ℝ, E)) (0 : E) k) y = 0)
    {A Q B K U V F : ℝ} (hA : 0 ≤ A) (hQ : 0 ≤ Q) (hB : 0 ≤ B)
    (hAxis : ∀ a : J, ‖chartModelBasis E a‖ ≤ B)
    (hInv : ∀ a b : J, |chartInvGramOnE g 0 a b z| ≤ A)
    (hGram : ∀ a b : J, ‖fderiv ℝ (chartGramOnE g 0 a b) z‖ ≤ Q)
    (hCurv : ∀ a b c d : J, |chartRiemannTensor g 0 a b c d z| ≤ K)
    (hZ : ∀ i j : J, |bourChartTensorComponent T 0 ![i,j] z| ≤ U)
    (hDZ : ∀ a i j : J, |∂ a (bourChartTensorComponent T 0 ![i,j]) z| ≤ V)
    (i j : J) (hRough : |bourChartTensorComponent (roughLap0SField g T) 0 ![i,j] z| ≤ F) :
    let n : ℝ := Module.finrank ℝ E
    let D := n ^ 2 * A ^ 2 * (Q * B)
    let G := (3 / 2 : ℝ) * n * A * (Q * B)
    let H := n ^ 2 * (A * (K + 2 * n * G ^ 2) + D * G)
    |bourFlatOperator (Matrix.of fun a b => chartInvGramOnE g 0 a b z)
      (bourChartTensorComponent T 0 ![i,j]) z| ≤
      F + (2 * n * H + 4 * n ^ 4 * A * G ^ 2) * U + 4 * n ^ 3 * A * G * V := by
  have hChart : z ∈ interior (extChartAt 𝓘(ℝ, E) (0 : E)).target := by
    rw [extChartAt_model_space_eq_id]
    simp
  have hG (d a b : J) : |∂ d (chartGramOnE g 0 a b) z| ≤ Q * B := by
    rw [← Real.norm_eq_abs]
    exact ((fderiv ℝ (chartGramOnE g 0 a b) z).le_opNorm _).trans
      (mul_le_mul (hGram a b) (hAxis d) (norm_nonneg _) hQ)
  have hH (k : J) : ∀ᶠ y in 𝓝 z, laplacian (LeviCivita g) g
      (bourChartCoordinate (I := 𝓘(ℝ, E)) (0 : E) k) ((extChartAt 𝓘(ℝ, E) (0 : E)).symm y) = 0 := by
    filter_upwards [hW.mem_nhds hz] with y hy
    simpa only [extChartAt_model_space_eq_id, PartialEquiv.refl_symm,
      PartialEquiv.refl_coe, id_eq] using hHarm y hy k
  exact bourChartTwo_flatOperator_bound g 0 T hChart hH hA (by positivity) (by positivity)
    hInv (fun d i j =>
      DifferentialGeometry.Analysis.Spectral.DeTurckCoefficients.invGramD_abs_le g 0 hChart hA hInv hG d i j)
    (bourChartChristoffel_abs_le g 0 z hA hInv hG) hCurv hZ hDZ i j hRough

omit [I.Boundaryless] [T2Space M] [BoundarylessManifold I M] in
/-- A common stationary Ricci principal bound on the physical E50
harmonic models, conditional on the algebraic curvature, field and rough
source component bounds. The first derivative on the right remains
the actual first derivative of the corresponding tensor entries. -/
theorem bourUniformHarmonicTraceFreeRicci_principal_bound
    {r L : ℝ} (hr : 0 < r) (hL : 0 < L) (A γ : ℝ≥0)
    {K U F : ℝ} (hK : 0 ≤ K) (hU : 0 ≤ U) (hF : 0 ≤ F) :
    ∃ C₀ C₁ : ℝ, 0 ≤ C₀ ∧ 0 ≤ C₁ ∧
      ∀ (g : SmoothRiemannianMetric I M) (x : M) (b : BourHarmonicChart g x L A γ),
        b.chart.source = Metric.ball (0 : E) (4 * r) →
      ∀ (G : SmoothRiemannianMetric 𝓘(ℝ, E) E),
        (∀ z ∈ Metric.ball (0 : E) (3 * r), ∀ v w : E, G.inner z v w = g.inner (b.chart z)
          (mfderiv 𝓘(ℝ, E) I (b.chart : E → M) z v) (mfderiv 𝓘(ℝ, E) I (b.chart : E → M) z w)) →
        (∀ z ∈ Metric.ball (0 : E) (3 * r), ∀ k : J, laplacian (LeviCivita G) G
          (bourChartCoordinate (I := 𝓘(ℝ, E)) (0 : E) k) z = 0) →
        (∀ z ∈ Metric.ball (0 : E) (3 * r), ∀ a b c d : J, |chartRiemannTensor G 0 a b c d z| ≤ K) →
        let Z := bourTraceFreeRicciField G
        (∀ z ∈ Metric.ball (0 : E) (3 * r), ∀ i j : J,
          |bourChartTensorComponent Z 0 ![i,j] z| ≤ U) →
        (∀ z ∈ Metric.ball (0 : E) (3 * r), ∀ i j : J,
          |bourChartTensorComponent (roughLap0SField G Z) 0 ![i,j] z| ≤ F) →
        ∀ z ∈ Metric.ball (0 : E) (3 * r), ∀ i j : J,
          |bourFlatOperator (Matrix.of fun a b => chartInvGramOnE G 0 a b z)
            (bourChartTensorComponent Z 0 ![i,j]) z| ≤
            C₀ + C₁ * ∑ q : (J × J) × J,
              |fderiv ℝ (bourChartTensorComponent Z 0 ![q.1.1,q.1.2]) z (chartModelBasis E q.2)| := by
  let n : ℝ := Module.finrank ℝ E
  let B : ℝ := 1 + ∑ a : J, ‖chartModelBasis E a‖
  have hB : 0 ≤ B := by dsimp [B]; positivity
  have hAxis (a : J) : ‖chartModelBasis E a‖ ≤ B := by
    apply le_trans (Finset.single_le_sum (fun j _ => norm_nonneg (chartModelBasis E j)) (Finset.mem_univ a))
    dsimp only [B]
    linarith
  obtain ⟨D, hD, hControl⟩ :=
    bourMetricInverse_entry_controls (E := E) (r := r) (L := L) hL (A := (A : ℝ))
  let Γ := (3 / 2 : ℝ) * n * D * ((A : ℝ) * B)
  let E₁ := n ^ 2 * D ^ 2 * ((A : ℝ) * B)
  let H := n ^ 2 * (D * (K + 2 * n * Γ ^ 2) + E₁ * Γ)
  have hΓ : 0 ≤ Γ := by dsimp [Γ, n]; positivity
  have hE₁ : 0 ≤ E₁ := by dsimp [E₁, n]; positivity
  have hH : 0 ≤ H := by dsimp only [H, n]; positivity
  refine ⟨F + (2 * n * H + 4 * n ^ 4 * D * Γ ^ 2) * U,
    4 * n ^ 3 * D * Γ, by positivity, by positivity, ?_⟩
  intro g x b hs G hPull hHarm hCurv
  dsimp only
  intro hZ hRough z hz i j
  have hSource (w : E) (hw : w ∈ Metric.ball (0 : E) (3 * r)) : w ∈ b.chart.source := by
    rw [hs]
    exact Metric.ball_subset_ball (by linarith) hw
  have hForm (w : E) (hw : w ∈ Metric.ball (0 : E) (3 * r)) (v : E) :
      L⁻¹ ^ 2 * ‖v‖ ^ 2 ≤ G.inner w v v := by
    rw [hPull w hw v v]
    exact (b.metric_bounds w (hSource w hw) v).1
  have hGram (a b' : J) (w : E) (hw : w ∈ Metric.ball (0 : E) (3 * r)) :
      ‖fderiv ℝ (chartGramOnE G 0 a b') w‖ ≤ (A : ℝ) :=
    bourModelGram_fderiv_bound_of_pullback b G hPull a b' hw (hSource w hw)
  let Z (a b : J) := bourChartTensorComponent (bourTraceFreeRicciField G) 0 ![a,b]
  let v (q : (J × J) × J) : ℝ :=
    |fderiv ℝ (Z q.1.1 q.1.2) z (chartModelBasis E q.2)|
  let V := ∑ q, v q
  have hDeriv (a c d : J) : |∂ a (Z c d) z| ≤ V :=
    Finset.single_le_sum (fun q _ => abs_nonneg (fderiv ℝ (Z q.1.1 q.1.2) z (chartModelBasis E q.2)))
      (Finset.mem_univ ((c,d),a))
  have h := bourModelHarmonicTwo_flatOperator_bound G (bourTraceFreeRicciField G)
    Metric.isOpen_ball hz hHarm hD A.2 hB hAxis
    (fun a b => (hControl G hForm hGram).1 a b z hz) (fun a b => hGram a b z hz)
    (hCurv z hz) (hZ z hz) hDeriv i j (hRough z hz i j)
  exact h

end
end SmoothPoincare
