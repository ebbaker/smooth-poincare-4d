import DifferentialGeometry.Geometry.Connection.ChartBridge.Connection.ChristoffelDerivative
import DifferentialGeometry.Geometry.Curvature.Coordinates.Ricci.Decomposition
import DifferentialGeometry.Geometry.Operator.Laplacian.Coordinates
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Ring

/-!
# The Ricci principal equation on a supplied harmonic chart

26 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance.
Actual serving configuration unavailable. The harmonic gauge is imposed on a
neighborhood in the actual chart of the supplying smooth metric.
-/

open DifferentialGeometry DifferentialGeometry.Geometry.Connection
open DifferentialGeometry.Geometry.Curvature DifferentialGeometry.Geometry.Operator
open DifferentialGeometry.Tensor.Coordinates Filter Set
open scoped BigOperators ContDiff Manifold Topology

noncomputable section

namespace SmoothPoincare

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [FiniteDimensional ℝ E] [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]

local notation "J" => Fin (Module.finrank ℝ E)
local notation "∂" => DifferentialGeometry.Tensor.Coordinates.partialDeriv

private def harmonicTraceEntry (g : SmoothRiemannianMetric I M) (p : M)
    (a b k : J) (z : E) : ℝ :=
  ∂ a (chartGramOnE g p b k) z - (1 / 2 : ℝ) * ∂ k (chartGramOnE g p a b) z

/-- The harmonic gauge with the free coordinate index lowered using the chart metric. -/
def bourChartLoweredHarmonicGauge (g : SmoothRiemannianMetric I M) (p : M)
    (k : J) (z : E) : ℝ :=
  ∑ a : J, ∑ b : J, chartInvGramOnE g p a b z * harmonicTraceEntry g p a b k z

private theorem harmonicTraceEntry_differentiableAt (g : SmoothRiemannianMetric I M)
    (p : M) {y : E} (hy : y ∈ interior (extChartAt I p).target) (a b k : J) :
    DifferentiableAt ℝ (harmonicTraceEntry g p a b k) y :=
  (partialDeriv_chartGramOnE_differentiableAt_interior g p a b k hy).sub
    ((partialDeriv_chartGramOnE_differentiableAt_interior g p k a b hy).const_mul _)

private theorem partialDeriv_harmonicTraceEntry (g : SmoothRiemannianMetric I M) (p : M)
    {y : E} (hy : y ∈ interior (extChartAt I p).target) (m a b k : J) :
    ∂ m (harmonicTraceEntry g p a b k) y = ∂ m (∂ a (chartGramOnE g p b k)) y -
      (1 / 2 : ℝ) * ∂ m (∂ k (chartGramOnE g p a b)) y := by
  have hl := partialDeriv_chartGramOnE_differentiableAt_interior g p a b k hy
  have hr := partialDeriv_chartGramOnE_differentiableAt_interior g p k a b hy
  change (fderiv ℝ (fun z => ∂ a (chartGramOnE g p b k) z -
    (1 / 2 : ℝ) * ∂ k (chartGramOnE g p a b) z) y) (chartModelBasis E m) = _
  rw [fderiv_fun_sub hl (hr.const_mul (1 / 2 : ℝ)), fderiv_const_mul hr]
  rfl

private theorem bourChartLoweredHarmonicGauge_deriv (g : SmoothRiemannianMetric I M)
    (p : M) {y : E} (hy : y ∈ interior (extChartAt I p).target) (m k : J) :
    ∂ m (bourChartLoweredHarmonicGauge g p k) y =
      (∑ a : J, ∑ b : J, ∂ m (chartInvGramOnE g p a b) y * harmonicTraceEntry g p a b k y) +
      ∑ a : J, ∑ b : J, chartInvGramOnE g p a b y * ∂ m (harmonicTraceEntry g p a b k) y := by
  have hA (a b : J) := chartInvGramOnE_differentiableAt_interior g p a b hy
  have hT (a b : J) := harmonicTraceEntry_differentiableAt g p hy a b k
  have hprod (a b : J) : DifferentiableAt ℝ
      (fun z => chartInvGramOnE g p a b z * harmonicTraceEntry g p a b k z) y :=
    (hA a b).mul (hT a b)
  unfold bourChartLoweredHarmonicGauge partialDeriv
  rw [fderiv_fun_sum (fun a _ => DifferentiableAt.fun_sum (fun b _ => hprod a b)), sum_apply,
    ← Finset.sum_add_distrib]
  refine Finset.sum_congr rfl fun a _ => ?_
  rw [fderiv_fun_sum (fun b _ => hprod a b), sum_apply, ← Finset.sum_add_distrib]
  refine Finset.sum_congr rfl fun b _ => ?_
  rw [fderiv_fun_mul (hA a b) (hT a b)]
  simp only [add_apply, smul_apply, smul_eq_mul]
  ring

/-- The lower-order Ricci term in the harmonic gauge. It uses Christoffel
products and first derivatives of the inverse chart metric and of the chart
metric. The pinned inverse-Gram derivative identity expresses the inverse
derivative in terms of those inverse coefficients and the metric first jet. -/
def bourChartHarmonicRicciError (g : SmoothRiemannianMetric I M) (p : M)
    (i k : J) (y : E) : ℝ :=
  chartRicciFirstOrderTerm g p i k y + (1 / 2 : ℝ) *
    (∑ a : J, ∑ b : J,
      (∂ a (chartInvGramOnE g p a b) y * chartChristoffelBracket g p i k b y -
      ∂ k (chartInvGramOnE g p a b) y * chartChristoffelBracket g p i a b y -
      ∂ i (chartInvGramOnE g p a b) y * harmonicTraceEntry g p a b k y -
      ∂ k (chartInvGramOnE g p a b) y * harmonicTraceEntry g p a b i y))

/-- On a supplied smooth harmonic chart of the actual metric, the Ricci
components have diagonal principal part `-1/2` times the inverse Gram
contraction of the coordinate Hessian of each metric component. -/
theorem bourChartHarmonicRicci_principal (g : SmoothRiemannianMetric I M) (p : M)
    {y : E} (hy : y ∈ interior (extChartAt I p).target)
    (hGauge : ∀ j : J, bourChartLoweredHarmonicGauge g p j =ᶠ[𝓝 y] (fun _ => 0))
    (i k : J) :
    chartRicciTensor g p i k y =
      -(1 / 2 : ℝ) * (∑ a : J, ∑ b : J,
        chartInvGramOnE g p a b y * ∂ a (∂ b (chartGramOnE g p i k)) y) +
      bourChartHarmonicRicciError g p i k y := by
  let A := fun a b : J => chartInvGramOnE g p a b y
  let B := chartChristoffelBracket g p
  let T := harmonicTraceEntry g p
  let dd := fun a b i j : J => ∂ a (∂ b (chartGramOnE g p i j)) y
  have hComm (a b i j : J) : dd a b i j = dd b a i j :=
    partialDeriv_partialDeriv_chartGramOnE_swap g p i j a b hy
  have hSymm (a b i j : J) : dd a b i j = dd a b j i := by
    have he : chartGramOnE g p i j = chartGramOnE g p j i :=
      funext (chartGramOnE_symm g p i j)
    change ∂ a (∂ b (chartGramOnE g p i j)) y = _
    rw [he]
  have hTranspose : (∑ a : J, ∑ b : J, A a b * dd k b i a) =
      ∑ a : J, ∑ b : J, A a b * dd k a b i := by
    rw [Finset.sum_comm]
    refine Finset.sum_congr rfl fun a _ => Finset.sum_congr rfl fun b _ => ?_
    rw [show A b a = A a b from chartInvGramOnE_symm g p b a y, hSymm k a i b]
  have hGaugeTerms (m j : J) : (∑ a : J, ∑ b : J, A a b * ∂ m (T a b j) y) =
      -(∑ a : J, ∑ b : J, ∂ m (chartInvGramOnE g p a b) y * T a b j y) := by
    have hz : ∂ m (bourChartLoweredHarmonicGauge g p j) y = 0 := by
      unfold partialDeriv
      rw [(hGauge j).fderiv_eq]
      simp
    rw [bourChartLoweredHarmonicGauge_deriv g p hy m j] at hz
    change _ + (∑ a : J, ∑ b : J, A a b * ∂ m (T a b j) y) = 0 at hz
    linarith only [hz]
  have hTop : (∑ a : J, ∑ b : J, A a b *
      (chartChristoffelBracketDeriv g p a i k b y - chartChristoffelBracketDeriv g p k i a b y)) =
      (∑ a : J, ∑ b : J, A a b * ∂ i (T a b k) y) +
      (∑ a : J, ∑ b : J, A a b * ∂ k (T a b i) y) -
      (∑ a : J, ∑ b : J, A a b * dd a b i k) := by
    calc
      _ = ∑ a : J, ∑ b : J, A a b * (∂ i (T a b k) y + ∂ k (T a b i) y - dd a b i k
          + dd k b i a - dd k a b i) := by
        refine Finset.sum_congr rfl fun a _ => Finset.sum_congr rfl fun b _ => ?_
        have hi := partialDeriv_harmonicTraceEntry g p hy i a b k
        have hk := partialDeriv_harmonicTraceEntry g p hy k a b i
        change ∂ i (T a b k) y = dd i a b k - (1 / 2 : ℝ) * dd i k a b at hi
        change ∂ k (T a b i) y = dd k a b i - (1 / 2 : ℝ) * dd k i a b at hk
        change A a b * ((dd a i b k + dd a k b i - dd a b i k) -
          (dd k i b a + dd k a b i - dd k b i a)) = _
        rw [hi, hk, hComm a i b k, hComm a k b i, hSymm k i b a, hComm i k a b]
        ring
      _ = _ := by
        simp only [mul_add, mul_sub, Finset.sum_add_distrib, Finset.sum_sub_distrib, hTranspose]
        ring
  rw [chartRicciTensor_eq_secondOrder_add_firstOrder, chartRicciSecondOrderTerm]
  simp only [partialDeriv_chartChristoffel_eq g p _ _ _ _ hy]
  have hCombine : (∑ a : J,
      ((1 / 2 : ℝ) * (∑ b : J, (∂ a (chartInvGramOnE g p a b) y * B i k b y +
        A a b * chartChristoffelBracketDeriv g p a i k b y)) -
      (1 / 2 : ℝ) * ∑ b : J, (∂ k (chartInvGramOnE g p a b) y * B i a b y +
        A a b * chartChristoffelBracketDeriv g p k i a b y))) =
      (1 / 2 : ℝ) * ((∑ a : J, ∑ b : J,
        (∂ a (chartInvGramOnE g p a b) y * B i k b y - ∂ k (chartInvGramOnE g p a b) y * B i a b y)) +
        (∑ a : J, ∑ b : J, A a b *
          (chartChristoffelBracketDeriv g p a i k b y - chartChristoffelBracketDeriv g p k i a b y))) := by
    simp only [Finset.mul_sum, mul_add, mul_sub, Finset.sum_add_distrib, Finset.sum_sub_distrib]
    ring
  change _ + chartRicciFirstOrderTerm g p i k y =
    -(1 / 2 : ℝ) * (∑ a : J, ∑ b : J, A a b * dd a b i k) + _
  rw [hCombine, hTop, hGaugeTerms i k, hGaugeTerms k i]
  unfold bourChartHarmonicRicciError
  change _ = _ + (chartRicciFirstOrderTerm g p i k y + (1 / 2 : ℝ) *
    (∑ a : J, ∑ b : J,
      (∂ a (chartInvGramOnE g p a b) y * B i k b y -
      ∂ k (chartInvGramOnE g p a b) y * B i a b y -
      ∂ i (chartInvGramOnE g p a b) y * T a b k y -
      ∂ k (chartInvGramOnE g p a b) y * T a b i y)))
  simp only [Finset.sum_sub_distrib]
  ring

private theorem abs_fin_sum_le {n : ℕ} (f : Fin n → ℝ) {C : ℝ}
    (h : ∀ a, |f a| ≤ C) : |∑ a, f a| ≤ (n : ℝ) * C := by
  calc
    _ ≤ ∑ a, |f a| := Finset.abs_sum_le_sum_abs _ _
    _ ≤ ∑ _ : Fin n, C := Finset.sum_le_sum (fun a _ => h a)
    _ = _ := by simp [nsmul_eq_mul]

private theorem abs_fin_double_sum_le {n : ℕ} (f : Fin n → Fin n → ℝ) {C : ℝ}
    (h : ∀ a b, |f a b| ≤ C) : |∑ a, ∑ b, f a b| ≤ (n : ℝ) ^ 2 * C := by
  calc
    _ ≤ (n : ℝ) * ((n : ℝ) * C) := abs_fin_sum_le _ (fun a => abs_fin_sum_le _ (h a))
    _ = _ := by ring

private theorem abs_mul_bound {a b A B : ℝ} (hA : 0 ≤ A) (ha : |a| ≤ A) (hb : |b| ≤ B) :
    |a * b| ≤ A * B := by
  rw [abs_mul]
  exact mul_le_mul ha hb (abs_nonneg _) hA

private theorem abs_sub_bound {a b A B : ℝ} (ha : |a| ≤ A) (hb : |b| ≤ B) :
    |a - b| ≤ A + B := by
  calc
    _ ≤ |a| + |b| := by simpa only [sub_eq_add_neg, abs_neg] using abs_add_le a (-b)
    _ ≤ _ := add_le_add ha hb

/-- A pointwise bound on the full lower-order Ricci term from bounds on the
inverse Gram entries and the first derivatives of the same metric entries. -/
theorem bourChartHarmonicRicciError_bound (g : SmoothRiemannianMetric I M) (p : M)
    {y : E} (hy : y ∈ interior (extChartAt I p).target)
    {K L : ℝ} (hK : 0 ≤ K) (hL : 0 ≤ L)
    (hInv : ∀ a b : J, |chartInvGramOnE g p a b y| ≤ K)
    (hGrad : ∀ m a b : J, |∂ m (chartGramOnE g p a b) y| ≤ L) (i k : J) :
    |bourChartHarmonicRicciError g p i k y| ≤
      9 * (Module.finrank ℝ E : ℝ) ^ 4 * K ^ 2 * L ^ 2 := by
  let n := (Module.finrank ℝ E : ℝ)
  let A := n ^ 2 * (K * K * L)
  let Γ := (1 / 2 : ℝ) * (n * (K * (3 * L)))
  have hn : 0 ≤ n := Nat.cast_nonneg _
  have hA : 0 ≤ A := by dsimp [A]; positivity
  have hΓ : 0 ≤ Γ := by dsimp [Γ]; positivity
  have hInvGrad (m a b : J) : |∂ m (chartInvGramOnE g p a b) y| ≤ A := by
    rw [partialDeriv_chartInvGramOnE_eq g p y m a b hy, abs_neg]
    exact abs_fin_double_sum_le _ (fun c d =>
      abs_mul_bound (mul_nonneg hK hK) (abs_mul_bound hK (hInv a c) (hInv d b)) (hGrad m c d))
  have hBracket (a b c : J) : |chartChristoffelBracket g p a b c y| ≤ 3 * L := by
    unfold chartChristoffelBracket
    calc
      _ ≤ (L + L) + L := abs_sub_bound
        ((abs_add_le _ _).trans (add_le_add (hGrad a c b) (hGrad b c a))) (hGrad c a b)
      _ = _ := by ring
  have hTrace (a b c : J) : |harmonicTraceEntry g p a b c y| ≤ (3 / 2 : ℝ) * L := by
    unfold harmonicTraceEntry
    calc
      _ ≤ L + (1 / 2 : ℝ) * L := abs_sub_bound (hGrad a b c)
        (abs_mul_bound (by norm_num) (by norm_num) (hGrad c a b))
      _ = _ := by ring
  have hChrist (a b c : J) : |chartChristoffel g p a b c y| ≤ Γ := by
    rw [chartChristoffel_eq_sum_invGramOnE_chartChristoffelBracket]
    exact abs_mul_bound (by norm_num) (by norm_num) (abs_fin_sum_le _ (fun l =>
      abs_mul_bound hK (hInv c l) (hBracket a b l)))
  have hFirst : |chartRicciFirstOrderTerm g p i k y| ≤ n ^ 2 * (Γ * Γ + Γ * Γ) := by
    unfold chartRicciFirstOrderTerm
    exact abs_fin_double_sum_le _ fun a b =>
      abs_sub_bound (abs_mul_bound hΓ (hChrist a b a) (hChrist i k b))
        (abs_mul_bound hΓ (hChrist k b a) (hChrist i a b))
  have hSecond : |∑ a : J, ∑ b : J,
      (∂ a (chartInvGramOnE g p a b) y * chartChristoffelBracket g p i k b y -
      ∂ k (chartInvGramOnE g p a b) y * chartChristoffelBracket g p i a b y -
      ∂ i (chartInvGramOnE g p a b) y * harmonicTraceEntry g p a b k y -
      ∂ k (chartInvGramOnE g p a b) y * harmonicTraceEntry g p a b i y)| ≤
        n ^ 2 * (A * (3 * L) + A * (3 * L) + A * ((3 / 2 : ℝ) * L) + A * ((3 / 2 : ℝ) * L)) := by
    exact abs_fin_double_sum_le _ fun a b => abs_sub_bound
      (abs_sub_bound
        (abs_sub_bound (abs_mul_bound hA (hInvGrad a a b) (hBracket i k b))
          (abs_mul_bound hA (hInvGrad k a b) (hBracket i a b)))
        (abs_mul_bound hA (hInvGrad i a b) (hTrace a b k)))
      (abs_mul_bound hA (hInvGrad k a b) (hTrace a b i))
  unfold bourChartHarmonicRicciError
  calc
    _ ≤ n ^ 2 * (Γ * Γ + Γ * Γ) + (1 / 2 : ℝ) *
        (n ^ 2 * (A * (3 * L) + A * (3 * L) + A * ((3 / 2 : ℝ) * L) + A * ((3 / 2 : ℝ) * L))) := by
      exact (abs_add_le _ _).trans (add_le_add hFirst
        (abs_mul_bound (by norm_num) (by norm_num) hSecond))
    _ = _ := by dsimp [n, A, Γ]; ring

/-- The actual harmonic-coordinate operator applied to a metric entry has
an explicit bound in terms of the measured Ricci entry and first jets. -/
theorem bourChartHarmonicRicci_trace_bound (g : SmoothRiemannianMetric I M) (p : M)
    {y : E} (hy : y ∈ interior (extChartAt I p).target)
    (hGauge : ∀ j : J, bourChartLoweredHarmonicGauge g p j =ᶠ[𝓝 y] (fun _ => 0))
    {K L R : ℝ} (hK : 0 ≤ K) (hL : 0 ≤ L)
    (hInv : ∀ a b : J, |chartInvGramOnE g p a b y| ≤ K)
    (hGrad : ∀ m a b : J, |∂ m (chartGramOnE g p a b) y| ≤ L)
    (i k : J) (hRicci : |chartRicciTensor g p i k y| ≤ R) :
    |∑ a : J, ∑ b : J, chartInvGramOnE g p a b y * ∂ a (∂ b (chartGramOnE g p i k)) y| ≤
      2 * R + 18 * (Module.finrank ℝ E : ℝ) ^ 4 * K ^ 2 * L ^ 2 := by
  have he := bourChartHarmonicRicci_principal g p hy hGauge i k
  have hsum : (∑ a : J, ∑ b : J, chartInvGramOnE g p a b y * ∂ a (∂ b (chartGramOnE g p i k)) y) =
      2 * bourChartHarmonicRicciError g p i k y - 2 * chartRicciTensor g p i k y := by
    linarith only [he]
  rw [hsum]
  have hQ := bourChartHarmonicRicciError_bound g p hy hK hL hInv hGrad i k
  calc
    _ ≤ 2 * (9 * (Module.finrank ℝ E : ℝ) ^ 4 * K ^ 2 * L ^ 2) + 2 * R :=
      abs_sub_bound (abs_mul_bound (by norm_num) (by norm_num) hQ)
        (abs_mul_bound (by norm_num) (by norm_num) hRicci)
    _ = _ := by ring

section LaplaceHarmonicCoordinates

open Bundle

private theorem bourChartGram_mul_inv_apply (g : SmoothRiemannianMetric I M) (p : M)
    {z : E} (hz : z ∈ (extChartAt I p).target) (k m : J) :
    (∑ l : J, chartGramOnE g p k l z * chartInvGramOnE g p l m z) =
      if k = m then 1 else 0 := by
  classical
  have hb : (extChartAt I p).symm z ∈ (trivializationAt E (TangentSpace I) p).baseSet := by
    rw [trivializationAt_baseSet_eq_chartAt_source, ← extChartAt_source (I := I)]
    exact (extChartAt I p).map_target hz
  have h := congrArg (fun A => A k m) (chartGramMatrix_mul_chartInvGramMatrix g p hb)
  simpa only [Matrix.mul_apply, Matrix.one_apply, chartGramOnE_def, chartInvGramOnE_def] using h

private theorem bourChartGram_contract_Christoffel (g : SmoothRiemannianMetric I M)
    (p : M) {z : E} (hz : z ∈ (extChartAt I p).target) (a b k : J) :
    (∑ l : J, chartGramOnE g p k l z * chartChristoffel g p a b l z) =
      (1 / 2 : ℝ) * chartChristoffelBracket g p a b k z := by
  classical
  let G : J → ℝ := fun l => chartGramOnE g p k l z
  let A : J → J → ℝ := fun l m => chartInvGramOnE g p l m z
  let B : J → ℝ := fun m => chartChristoffelBracket g p a b m z
  change (∑ l : J, G l * chartChristoffel g p a b l z) = (1 / 2 : ℝ) * B k
  calc
    _ = (1 / 2 : ℝ) * ∑ l : J, ∑ m : J, (G l * A l m) * B m := by
      rw [Finset.mul_sum]
      refine Finset.sum_congr rfl fun l _ => ?_
      rw [chartChristoffel_eq_sum_invGramOnE_chartChristoffelBracket]
      change G l * ((1 / 2 : ℝ) * ∑ m : J, A l m * B m) = _
      rw [mul_left_comm, Finset.mul_sum]
      congr 1
      refine Finset.sum_congr rfl fun m _ => ?_
      ring
    _ = (1 / 2 : ℝ) * ∑ m : J, (∑ l : J, G l * A l m) * B m := by
      rw [Finset.sum_comm]
      simp only [Finset.sum_mul]
    _ = _ := by
      simp only [G, A, bourChartGram_mul_inv_apply g p hz, ite_mul, one_mul, zero_mul]
      simp

/-- The lowered gauge is the Gram matrix applied to the contraction of the
Christoffel symbols. This exact relation keeps both chart indices on the
same physical metric. -/
theorem bourChartLoweredHarmonicGauge_eq_gram_contract (g : SmoothRiemannianMetric I M)
    (p : M) {z : E} (hz : z ∈ (extChartAt I p).target) (k : J) :
    bourChartLoweredHarmonicGauge g p k z =
      ∑ l : J, chartGramOnE g p k l z *
        (∑ a : J, ∑ b : J, chartInvGramOnE g p a b z * chartChristoffel g p a b l z) := by
  let A : J → J → ℝ := fun a b => chartInvGramOnE g p a b z
  let G : J → ℝ := fun l => chartGramOnE g p k l z
  let C : J → J → J → ℝ := fun a b l => chartChristoffel g p a b l z
  have hswap :
      (∑ a : J, ∑ b : J, A a b * ∂ b (chartGramOnE g p k a) z) =
        ∑ a : J, ∑ b : J, A a b * ∂ a (chartGramOnE g p b k) z := by
    rw [Finset.sum_comm]
    refine Finset.sum_congr rfl fun a _ => Finset.sum_congr rfl fun b _ => ?_
    rw [show A b a = A a b from chartInvGramOnE_symm g p b a z,
      funext (chartGramOnE_symm g p k b)]
  have hhalf : bourChartLoweredHarmonicGauge g p k z =
      ∑ a : J, ∑ b : J, A a b * ((1 / 2 : ℝ) * chartChristoffelBracket g p a b k z) := by
    have hleft (a b : J) :
        A a b * harmonicTraceEntry g p a b k z =
          A a b * ∂ a (chartGramOnE g p b k) z -
            (1 / 2 : ℝ) * (A a b * ∂ k (chartGramOnE g p a b) z) := by
      unfold harmonicTraceEntry
      ring
    have hright (a b : J) :
        A a b * ((1 / 2 : ℝ) * chartChristoffelBracket g p a b k z) =
          (1 / 2 : ℝ) * (A a b * ∂ a (chartGramOnE g p b k) z +
          A a b * ∂ b (chartGramOnE g p k a) z -
          A a b * ∂ k (chartGramOnE g p a b) z) := by
      unfold chartChristoffelBracket
      rw [funext (chartGramOnE_symm g p k b)]
      ring
    change (∑ a : J, ∑ b : J, A a b * harmonicTraceEntry g p a b k z) = _
    simp only [hleft, hright, Finset.sum_sub_distrib, Finset.sum_add_distrib,
      ← Finset.mul_sum, hswap]
    ring
  calc
    _ = ∑ a : J, ∑ b : J, A a b * ((1 / 2 : ℝ) * chartChristoffelBracket g p a b k z) :=
      hhalf
    _ = ∑ a : J, ∑ b : J, A a b * ∑ l : J, G l * C a b l := by
      refine Finset.sum_congr rfl fun a _ => Finset.sum_congr rfl fun b _ => ?_
      exact congrArg (A a b * ·) (bourChartGram_contract_Christoffel g p hz a b k).symm
    _ = ∑ a : J, ∑ b : J, ∑ l : J, G l * (A a b * C a b l) := by
      simp_rw [Finset.mul_sum]
      refine Finset.sum_congr rfl fun a _ => Finset.sum_congr rfl fun b _ =>
        Finset.sum_congr rfl fun l _ => ?_
      ring
    _ = ∑ a : J, ∑ l : J, ∑ b : J, G l * (A a b * C a b l) :=
      Finset.sum_congr rfl (fun a _ => Finset.sum_comm)
    _ = ∑ l : J, ∑ a : J, ∑ b : J, G l * (A a b * C a b l) := Finset.sum_comm
    _ = _ := by
      change (∑ l : J, ∑ a : J, ∑ b : J, G l * (A a b * C a b l)) =
        ∑ l : J, G l * ∑ a : J, ∑ b : J, A a b * C a b l
      simp only [Finset.mul_sum]

/-- The coordinate functional of the extended chart in its chosen basis. -/
def bourChartCoordinate (p : M) (l : J) (x : M) : ℝ :=
  (chartModelBasis E).coord l (extChartAt I p x)

variable [I.Boundaryless] [T2Space M]

/-- For the div-grad Laplacian, the Laplacian of an actual coordinate
function is minus the corresponding contracted Christoffel symbol. -/
theorem bourLaplacian_chartCoordinate (g : SmoothRiemannianMetric I M) (p : M) (l : J)
    {x : M} (hx : x ∈ (chartAt H p).source) :
    laplacian (I := I) (LeviCivita (I := I) g) g (bourChartCoordinate (I := I) p l) x =
      -(∑ a : J, ∑ b : J, chartInvGramOnE g p a b (extChartAt I p x) *
        chartChristoffel g p a b l (extChartAt I p x)) := by
  classical
  let c : E →L[ℝ] ℝ := ((chartModelBasis E).coord l).toContinuousLinearMap
  change laplacian (I := I) (LeviCivita (I := I) g) g (c ∘ extChartAt I p) x = _
  rw [laplacian_comp_extChartAt g p hx c.contDiff.contDiffAt]
  have hderiv : fderiv ℝ c = fun _ : E => c := funext fun _ => c.fderiv
  have heval (k : J) : c (chartModelBasis E k) = if k = l then 1 else 0 := by
    change (chartModelBasis E).repr (chartModelBasis E k) l = _
    exact (chartModelBasis E).repr_self_apply k l
  simp only [hderiv, fderiv_const_apply, zero_apply, zero_sub, heval, mul_ite, mul_one, mul_zero,
    Finset.sum_ite_eq', Finset.mem_univ, ite_true, mul_neg, Finset.sum_neg_distrib]

/-- Harmonic coordinate functions on a neighborhood give the zero lowered
gauge on that neighborhood via the actual coordinate Laplacian identity. -/
theorem bourChartLoweredHarmonicGauge_eventually_zero_of_laplacian
    (g : SmoothRiemannianMetric I M) (p : M) {y : E}
    (hy : y ∈ interior (extChartAt I p).target)
    (hHarm : ∀ l : J,
      ∀ᶠ z in 𝓝 y, laplacian (I := I) (LeviCivita (I := I) g) g (bourChartCoordinate (I := I) p l)
        ((extChartAt I p).symm z) = 0) (k : J) :
    bourChartLoweredHarmonicGauge g p k =ᶠ[𝓝 y] (fun _ => 0) := by
  have hAll : ∀ᶠ z in 𝓝 y, ∀ l : J,
      laplacian (I := I) (LeviCivita (I := I) g) g (bourChartCoordinate (I := I) p l) ((extChartAt I p).symm z) = 0 :=
    Filter.eventually_all.2 hHarm
  filter_upwards [hAll, isOpen_interior.mem_nhds hy] with z hz hzi
  have ht := interior_subset hzi
  have hs : (extChartAt I p).symm z ∈ (chartAt H p).source := by
    rw [← extChartAt_source (I := I)]
    exact (extChartAt I p).map_target ht
  have hzero (l : J) : (∑ a : J, ∑ b : J,
      chartInvGramOnE g p a b z * chartChristoffel g p a b l z) = 0 := by
    have h := bourLaplacian_chartCoordinate g p l hs
    rw [(extChartAt I p).right_inv ht, hz l] at h
    exact neg_eq_zero.mp h.symm
  simp only [bourChartLoweredHarmonicGauge_eq_gram_contract g p ht, hzero, mul_zero,
    Finset.sum_const_zero]

/-- The Ricci principal equation on a chart with Laplace-harmonic coordinate
functions. The neighborhood condition supplies the gauge derivatives. -/
theorem bourChartHarmonicRicci_principal_of_laplacian
    (g : SmoothRiemannianMetric I M) (p : M) {y : E}
    (hy : y ∈ interior (extChartAt I p).target)
    (hHarm : ∀ l : J,
      ∀ᶠ z in 𝓝 y, laplacian (I := I) (LeviCivita (I := I) g) g (bourChartCoordinate (I := I) p l)
        ((extChartAt I p).symm z) = 0) (i k : J) :
    chartRicciTensor g p i k y =
      -(1 / 2 : ℝ) * (∑ a : J, ∑ b : J,
        chartInvGramOnE g p a b y * ∂ a (∂ b (chartGramOnE g p i k)) y) +
      bourChartHarmonicRicciError g p i k y :=
  bourChartHarmonicRicci_principal g p hy
    (bourChartLoweredHarmonicGauge_eventually_zero_of_laplacian g p hy hHarm) i k

end LaplaceHarmonicCoordinates

end SmoothPoincare
