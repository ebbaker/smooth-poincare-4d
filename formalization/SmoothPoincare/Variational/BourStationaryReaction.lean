import SmoothPoincare.Variational.BourRicciInteriorEstimate
import SmoothPoincare.Variational.BourGradientScaling
import SmoothPoincare.Variational.BourStationaryPullback
import DifferentialGeometry.Geometry.Curvature.MetricPairing
import DifferentialGeometry.Geometry.Flow.RicciFlow.Compactness.Fields.Open.HalfLineCurvatureContinuity

/-! # Physical stationary reaction and chart curvature bounds

E51, 26 November 2026. Prepared for Edward B. Baker III with OpenAI Codex
assistance. Actual serving model and reasoning effort were unavailable.
-/

open DifferentialGeometry DifferentialGeometry.Geometry.Connection
  DifferentialGeometry.Geometry.Curvature DifferentialGeometry.Geometry.Operator
  DifferentialGeometry.PDE.RicciFlow DifferentialGeometry.Tensor.Coordinates
  DifferentialGeometry.Tensor0SBundle Bundle Set
open scoped ContDiff Manifold NNReal

namespace SmoothPoincare.Bour

noncomputable section

variable {E H M : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
  [FiniteDimensional ℝ E] [NeZero (Module.finrank ℝ E)] [TopologicalSpace H]
  {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [T2Space M] [CompactSpace M] [BoundarylessManifold I M]

local notation "J" => Fin (Module.finrank ℝ E)

omit [NeZero (Module.finrank ℝ E)] [I.Boundaryless] [T2Space M]
  [CompactSpace M] [BoundarylessManifold I M] in
/-- Evaluate the ordered covariant Riemann tensor in arbitrary tangent
directions using the physical curvature ceiling. -/
theorem bourRm04_apply_abs_le (g : SmoothRiemannianMetric I M) (x : M) {K : ℝ}
    (hK : Real.sqrt (intrinsicCurvatureSq g x) ≤ K) (v : Fin 4 → TangentSpace I x) :
    |metricRm04At g x v| ≤ K * ∏ i, Real.sqrt (g.inner x (v i) (v i)) := by
  obtain ⟨b₀, hb₀⟩ := Tensor0SBundle.exists_orthonormal_basis (I := I) g x
  let b : Module.Basis J ℝ (TangentSpace I x) := b₀
  have hb (i j : J) : g.inner x (b i) (b j) = if i = j then 1 else 0 := hb₀ i j
  exact (abs_apply_le_sqrt_normSq0S g x 4 b hb (metricRm04At g x) v).trans
    (mul_le_mul_of_nonneg_right hK (Finset.prod_nonneg fun _ _ => Real.sqrt_nonneg _))

omit [NeZero (Module.finrank ℝ E)] [I.Boundaryless] [CompactSpace M] in
/-- The Ricci trace in a physical orthonormal basis bounds an arbitrary
component in terms of the same ordered curvature ceiling. -/
theorem bourMetricRicci_apply_abs_le (g : SmoothRiemannianMetric I M) (x : M) {K : ℝ}
    (hK : Real.sqrt (intrinsicCurvatureSq g x) ≤ K) (u v : TangentSpace I x) :
    |metricRicciAt g x (vec2 u v)| ≤ (Module.finrank ℝ E : ℝ) * K *
      Real.sqrt (g.inner x u u) * Real.sqrt (g.inner x v v) := by
  classical
  obtain ⟨b₀, hb₀⟩ := Tensor0SBundle.exists_orthonormal_basis (I := I) g x
  let b : Module.Basis J ℝ (TangentSpace I x) := b₀
  have hb (i j : J) : g.inner x (b i) (b j) = if i = j then 1 else 0 := hb₀ i j
  have hTerm (i : J) :
      |g.inner x (riemannOp (LeviCivita g) x (b i) u v) (b i)| ≤
        K * Real.sqrt (g.inner x u u) * Real.sqrt (g.inner x v v) := by
    change |g.inner x (riemannOp (metricCov g) x (b i) u v) (b i)| ≤ _
    rw [← metricRm04At_inner]
    have h := bourRm04_apply_abs_le g x hK (vec4 (b i) u v (b i))
    have hUnit : g.inner x (b i) (b i) = 1 := by simp [hb]
    simpa [vec4, Fin.prod_univ_four, hUnit, mul_assoc] using h
  rw [metricRicciAt_apply_eq_ricciTensor, ricciTensor_eq_orthonormal_trace g x u v b hb]
  calc
    _ ≤ ∑ i, |g.inner x (riemannOp (LeviCivita g) x (b i) u v) (b i)| :=
      Finset.abs_sum_le_sum_abs _ _
    _ ≤ ∑ _ : J, K * Real.sqrt (g.inner x u u) * Real.sqrt (g.inner x v v) :=
      Finset.sum_le_sum fun i _ => hTerm i
    _ = _ := by rw [Finset.sum_const, Finset.card_univ, Fintype.card_fin, nsmul_eq_mul]; ring

omit [NeZero (Module.finrank ℝ E)] [I.Boundaryless] [CompactSpace M] in
/-- The scalar curvature is controlled by the same ordered physical
Riemann ceiling at every positive scale. -/
theorem bourMetricScalar_abs_le_orderedCurvature (g : SmoothRiemannianMetric I M)
    (x : M) {K : ℝ} (hK : Real.sqrt (intrinsicCurvatureSq g x) ≤ K) :
    |metricScalarAt g x| ≤ (Module.finrank ℝ E : ℝ) ^ 2 * K := by
  classical
  obtain ⟨b₀, hb₀⟩ := Tensor0SBundle.exists_orthonormal_basis (I := I) g x
  let b : Module.Basis J ℝ (TangentSpace I x) := b₀
  have hb (i j : J) : g.inner x (b i) (b j) = if i = j then 1 else 0 := hb₀ i j
  have hi := metricInverseInBasis_identity_of_orthonormal g b hb
  have hScalar : metricScalarAt g x = ∑ i, metricRicciAt g x (vec2 (b i) (b i)) := by
    rw [metricScalarAt_def, metricTracePair0SAt_eq_sum_basis _ b _ hi]
    simp only [identityInvMetric, diagonalInvMetric, ite_mul, one_mul, zero_mul,
      Finset.sum_ite_eq, Finset.mem_univ, ite_true]
  rw [hScalar]
  calc
    _ ≤ ∑ i, |metricRicciAt g x (vec2 (b i) (b i))| := Finset.abs_sum_le_sum_abs _ _
    _ ≤ ∑ _ : J, (Module.finrank ℝ E : ℝ) * K := by
      refine Finset.sum_le_sum fun i _ => ?_
      simpa [hb] using bourMetricRicci_apply_abs_le g x hK (b i) (b i)
    _ = _ := by
      rw [Finset.sum_const, Finset.card_univ, Fintype.card_fin, nsmul_eq_mul]
      ring

omit [NeZero (Module.finrank ℝ E)] [I.Boundaryless] [CompactSpace M] in
private theorem bourMetricRicci_normSq_le (g : SmoothRiemannianMetric I M) (x : M) {K : ℝ}
    (hK : Real.sqrt (intrinsicCurvatureSq g x) ≤ K) :
    normSq0S g x 2 (metricRicciAt g x) ≤ (Module.finrank ℝ E : ℝ) ^ 4 * K ^ 2 := by
  classical
  obtain ⟨b₀, hb₀⟩ := Tensor0SBundle.exists_orthonormal_basis (I := I) g x
  let b : Module.Basis J ℝ (TangentSpace I x) := b₀
  have hb (i j : J) : g.inner x (b i) (b j) = if i = j then 1 else 0 := hb₀ i j
  have hi := metricInverseInBasis_identity_of_orthonormal g b hb
  rw [normSq0S_identity_eq_sum_sq g x 2 b hi]
  calc
    _ ≤ ∑ _ : Fin 2 → J, ((Module.finrank ℝ E : ℝ) * K) ^ 2 := by
      refine Finset.sum_le_sum fun i _ => ?_
      have hs : (fun j => b (i j)) = vec2 (b (i 0)) (b (i 1)) := by
        funext j
        fin_cases j <;> rfl
      have hB (i : J) : Real.sqrt (g.inner x (b i) (b i)) = 1 := by simp [hb]
      have h := bourMetricRicci_apply_abs_le g x hK (b (i 0)) (b (i 1))
      simp only [hB, mul_one] at h
      rw [component0S_apply, hs, ← sq_abs]
      exact pow_le_pow_left₀ (abs_nonneg _) h 2
    _ = _ := by
      simp only [Finset.sum_const, Finset.card_univ, Fintype.card_fun, Fintype.card_fin,
        nsmul_eq_mul, Nat.cast_pow]
      ring

omit [NeZero (Module.finrank ℝ E)] [I.Boundaryless] [CompactSpace M] in
/-- Bound the actual Riemann action on Ricci in arbitrary physical axes. -/
theorem bourHamiltonCurvatureRicci_abs_le (g : SmoothRiemannianMetric I M) (x : M) {K : ℝ}
    (hK : Real.sqrt (intrinsicCurvatureSq g x) ≤ K) (u v : TangentSpace I x) :
    |hamiltonCurvatureRicciAt g x (vec2 u v)| ≤ (Module.finrank ℝ E : ℝ)^3 * K ^ 2 *
      Real.sqrt (g.inner x u u) * Real.sqrt (g.inner x v v) := by
  classical
  obtain ⟨b₀, hb₀⟩ := Tensor0SBundle.exists_orthonormal_basis (I := I) g x
  let b : Module.Basis J ℝ (TangentSpace I x) := b₀
  have hb (i j : J) : g.inner x (b i) (b j) = if i = j then 1 else 0 := hb₀ i j
  let d := identityInvMetric (Idx := J)
  have hi := metricInverseInBasis_identity_of_orthonormal g b hb
  have hd (i : J) (f : J → ℝ) : (∑ j, d i j * f j) = f i := by
    simp [d, identityInvMetric, diagonalInvMetric, ite_mul]
  have hRaised (i j : J) : raised02CompAt (I := I) b d (metricRicci g x) i j =
      metricRicciAt g x (vec2 (b i) (b j)) := by
    unfold raised02CompAt
    calc
      _ = ∑ k, d i k * ∑ l, d j l * metricRicci g x (vec2 (b k) (b l)) := by
        simp only [Finset.mul_sum, mul_assoc]
      _ = _ := by simp only [hd, metricRicci_apply]
  have hB (i : J) : Real.sqrt (g.inner x (b i) (b i)) = 1 := by simp [hb]
  have hterm (i j : J) : |metricRm04At g x (vec4 u (b i) (b j) v) *
      metricRicciAt g x (vec2 (b i) (b j))| ≤
      (Module.finrank ℝ E : ℝ) * K ^ 2 * Real.sqrt (g.inner x u u) *
        Real.sqrt (g.inner x v v) := by
    have hRm := bourRm04_apply_abs_le g x hK (vec4 u (b i) (b j) v)
    have hRic := bourMetricRicci_apply_abs_le g x hK (b i) (b j)
    simp [vec4, Fin.prod_univ_four, hB] at hRm
    simp only [hB, mul_one] at hRic
    rw [abs_mul]
    calc
      _ ≤ (K * (Real.sqrt (g.inner x u u) * Real.sqrt (g.inner x v v))) *
          ((Module.finrank ℝ E : ℝ) * K) :=
        mul_le_mul hRm hRic (abs_nonneg _) ((abs_nonneg _).trans hRm)
      _ = _ := by ring
  rw [hamiltonCurvatureRicciAt_eq_raised_contraction g b d hi]
  simp only [hRaised, metricRm04_apply]
  calc
    _ ≤ ∑ i, ∑ j, |metricRm04At g x (vec4 u (b i) (b j) v) *
        metricRicciAt g x (vec2 (b i) (b j))| :=
      (Finset.abs_sum_le_sum_abs _ _).trans
        (Finset.sum_le_sum fun _ _ => Finset.abs_sum_le_sum_abs _ _)
    _ ≤ ∑ _ : J, ∑ _ : J, (Module.finrank ℝ E : ℝ) * K ^ 2 *
        Real.sqrt (g.inner x u u) * Real.sqrt (g.inner x v v) :=
      Finset.sum_le_sum fun i _ => Finset.sum_le_sum fun j _ => hterm i j
    _ = _ := by
      simp only [Finset.sum_const, Finset.card_univ, Fintype.card_fin, nsmul_eq_mul]
      ring

omit [NeZero (Module.finrank ℝ E)] [I.Boundaryless] [CompactSpace M] in
/-- The native trace-free Ricci component uses the same physical curvature
and scalar ceilings. -/
theorem bourTraceFreeRicci_apply_abs_le
    (hDim : Module.finrank ℝ E = 4) (g : SmoothRiemannianMetric I M) (x : M)
    {K C : ℝ} (hK : Real.sqrt (intrinsicCurvatureSq g x) ≤ K)
    (hC : |metricScalarAt g x| ≤ C) (u v : TangentSpace I x) :
    |SmoothPoincare.bourTraceFreeRicciField g x (vec2 u v)| ≤
      (4 * K + C / 4) * Real.sqrt (g.inner x u u) * Real.sqrt (g.inner x v v) := by
  let U := Real.sqrt (g.inner x u u)
  let V := Real.sqrt (g.inner x v v)
  have hC₀ : 0 ≤ C := (abs_nonneg _).trans hC
  have hRic : |metricRicciAt g x (vec2 u v)| ≤ 4 * K * U * V := by
    simpa only [hDim, Nat.cast_ofNat] using bourMetricRicci_apply_abs_le g x hK u v
  have hInner : |g.inner x u v| ≤ U * V :=
    SmoothRiemannianMetric.abs_metric_inner_le_sqrt_metric_quadratic g x u v
  have hScalar : |metricScalarAt g x / 4 * g.inner x u v| ≤ (C / 4) * (U * V) := by
    simp only [abs_mul, abs_div, abs_of_nonneg (by norm_num : (0 : ℝ) ≤ 4)]
    exact mul_le_mul (div_le_div_of_nonneg_right hC (by norm_num))
      hInner (abs_nonneg _) (by positivity)
  rw [SmoothPoincare.bourTraceFreeRicciField_apply]
  exact (abs_sub _ _).trans ((add_le_add hRic hScalar).trans_eq (by ring))

omit [NeZero (Module.finrank ℝ E)] [I.Boundaryless] [T2Space M]
  [CompactSpace M] [BoundarylessManifold I M] in
/-- At the normalized physical scale the scalar coefficient in Bour's CSC
equation is the original scalar divided by the curvature scale. -/
theorem bourStationary_scalarCoefficient_scale_bound (α : ℝ) (hα₀ : 0 ≤ α) (hα₁ : α ≤ 1)
    (g : SmoothRiemannianMetric I M) {a : ℝ} (ha : 0 < a) (x : M)
    {C : ℝ} (hC : |metricScalarAt g x| ≤ C) :
    ((2 - α) / 12) * metricScalarAt (scaleMetric a ha g) x =
      (2 - α) * metricScalarAt g x / (12 * a) ∧
    |((2 - α) / 12) * metricScalarAt (scaleMetric a ha g) x| ≤ C / (6 * a) := by
  have h := SmoothPoincare.bourStationary_scalarCoefficient_scale α g ha x
  have hpos : 0 ≤ (2 - α) / 12 := by linarith
  have hcoef : (2 - α) / 12 ≤ 1 / 6 := by linarith
  have hC₀ : 0 ≤ C := (abs_nonneg _).trans hC
  constructor
  · rw [h]
    ring
  · rw [h, abs_div, abs_of_pos ha, abs_mul, abs_of_nonneg hpos]
    calc
      _ ≤ ((1 / 6 : ℝ) * C) / a :=
        div_le_div_of_nonneg_right (mul_le_mul hcoef hC (abs_nonneg _) (by norm_num)) ha.le
      _ = _ := by ring

/-- A uniform envelope for the stationary rough reaction in dimension four.
The generous constants only use elementary orthonormal summation. -/
def bourStationaryReactionBound (K C : ℝ) : ℝ :=
  256 * K ^ 2 + (8 / 3 : ℝ) * C * K + C ^ 2 / 6

omit [NeZero (Module.finrank ℝ E)] [CompactSpace M] in
/-- The rough trace-free Ricci forcing is bounded using only the actual
stationary equation, the physical curvature ceiling and the scalar ceiling.
The last two factors give the cost of the transported tangent directions. -/
theorem bourStationary_roughTraceFreeRicci_abs_le
    (hDim : Module.finrank ℝ E = 4) (α : ℝ) (hα₀ : 0 ≤ α) (hα₁ : α ≤ 1)
    (g : SmoothRiemannianMetric I M) (R : ℝ)
    (hR : ∀ y, metricScalarAt g y = R) {C : ℝ} (hC : |R| ≤ C) (x : M)
    (hStat : bourCovariantGradient α g x = 0) {K : ℝ}
    (hK : Real.sqrt (intrinsicCurvatureSq g x) ≤ K) (u v : TangentSpace I x) :
    |roughLap0SField g (SmoothPoincare.bourTraceFreeRicciField g) x (vec2 u v)| ≤
      bourStationaryReactionBound K C *
        Real.sqrt (g.inner x u u) * Real.sqrt (g.inner x v v) := by
  let U := Real.sqrt (g.inner x u u)
  let V := Real.sqrt (g.inner x v v)
  have hK₀ : 0 ≤ K := (Real.sqrt_nonneg _).trans hK
  have hC₀ : 0 ≤ C := (abs_nonneg _).trans hC
  have hUV : 0 ≤ U * V := mul_nonneg (Real.sqrt_nonneg _) (Real.sqrt_nonneg _)
  have hα : |α - 4| ≤ 4 := by rw [abs_of_nonpos (by linarith)]; linarith
  have hQ : |metricRicciAt g x (vec2 u v)| ≤ 4 * K * U * V := by
    simpa only [hDim, Nat.cast_ofNat] using bourMetricRicci_apply_abs_le g x hK u v
  have hA : |hamiltonCurvatureRicciAt g x (vec2 u v)| ≤ 64 * K ^ 2 * U * V := by
    have ha := bourHamiltonCurvatureRicci_abs_le g x hK u v
    rw [hDim] at ha
    norm_num at ha
    exact ha
  have hSq : normSq0S g x 2 (metricRicciAt g x) ≤ 256 * K ^ 2 := by
    have h := bourMetricRicci_normSq_le g x hK
    rw [hDim] at h
    norm_num at h
    exact h
  have hRsq : R ^ 2 ≤ C ^ 2 := by
    rw [← sq_abs R]
    exact pow_le_pow_left₀ (abs_nonneg _) hC 2
  have hBulk : |bourBulkDensity α g x| ≤ 128 * K ^ 2 + C ^ 2 / 6 := by
    rw [bourBulkDensity, hR x]
    refine (abs_add_le _ _).trans ?_
    simp only [abs_div, abs_mul, abs_pow, sq_abs,
      abs_of_nonneg (normSq0S_nonneg g _ _ _)]
    norm_num
    have hmult := mul_le_mul hα hRsq (sq_nonneg R) (by norm_num : (0 : ℝ) ≤ 4)
    change normSq0S g x 2 (metricRicciAt g x) / 2 + |α - 4| * R ^ 2 / 24 ≤ _
    linarith only [hSq, hmult]
  have hInner : |g.inner x u v| ≤ U * V :=
    SmoothRiemannianMetric.abs_metric_inner_le_sqrt_metric_quadratic g x u v
  have hLinear :
      |(α - 4) / 6 * R * metricRicciAt g x (vec2 u v)| ≤
        ((8 / 3 : ℝ) * C * K) * (U * V) := by
    rw [abs_mul, abs_mul, abs_div]
    norm_num
    have hcoef : |α - 4| / 6 * |R| ≤ (4 / 6 : ℝ) * C :=
      mul_le_mul (div_le_div_of_nonneg_right hα (by norm_num))
        hC (abs_nonneg _) (by norm_num)
    calc
      _ ≤ ((4 / 6 : ℝ) * C) * (4 * K * U * V) :=
        mul_le_mul hcoef hQ (abs_nonneg _) (by positivity)
      _ = _ := by ring
  have hAction : |-2 * hamiltonCurvatureRicciAt g x (vec2 u v)| ≤
      2 * (64 * K ^ 2 * U * V) := by
    rw [abs_mul, show |-(2 : ℝ)| = 2 by norm_num]
    exact mul_le_mul_of_nonneg_left hA (by norm_num)
  have hVolume : |bourBulkDensity α g x * g.inner x u v| ≤
      (128 * K ^ 2 + (C ^ 2) / (6 : ℝ)) * (U * V) := by
    rw [abs_mul]
    exact mul_le_mul hBulk hInner (abs_nonneg _) (by positivity)
  rw [SmoothPoincare.bourStationary_roughTraceFreeRicci_eq α g R hR x hStat]
  calc
    _ ≤ |-2 * hamiltonCurvatureRicciAt g x (vec2 u v)| +
        |(α - 4) / 6 * R * metricRicciAt g x (vec2 u v)| +
        |bourBulkDensity α g x * g.inner x u v| :=
      (abs_add_le _ _).trans (by gcongr; exact abs_sub _ _)
    _ ≤ 2 * (64 * K ^ 2 * U * V) + ((8 / 3 : ℝ) * C * K) * (U * V) +
        (128 * K ^ 2 + (C ^ 2) / (6 : ℝ)) * (U * V) :=
      add_le_add (add_le_add hAction hLinear) hVolume
    _ = _ := by unfold bourStationaryReactionBound; ring

omit [NeZero (Module.finrank ℝ E)] [CompactSpace M] in
/-- Both physical scales use the same bound on the CSC forcing. The input
curvature ceiling concerns the normalized metric and stationarity is
inherited from the original one. -/
theorem bourStationary_roughTraceFreeRicci_scale_abs_le
    (hDim : Module.finrank ℝ E = 4) (α : ℝ) (hα₀ : 0 ≤ α) (hα₁ : α ≤ 1)
    (g : SmoothRiemannianMetric I M) (R : ℝ) (hR : ∀ y, metricScalarAt g y = R)
    {C : ℝ} (hC : |R| ≤ C) {a : ℝ} (ha : 0 < a) (ha₁ : 1 ≤ a)
    (x : M) (hStat : bourCovariantGradient α g x = 0) {K : ℝ}
    (hK : Real.sqrt (intrinsicCurvatureSq (scaleMetric a ha g) x) ≤ K)
    (u v : TangentSpace I x) :
    let h := scaleMetric a ha g
    |roughLap0SField h (SmoothPoincare.bourTraceFreeRicciField h) x (vec2 u v)| ≤
      bourStationaryReactionBound K C *
        Real.sqrt (h.inner x u u) * Real.sqrt (h.inner x v v) := by
  let h := scaleMetric a ha g
  have hRs (y : M) : metricScalarAt h y = R / a := by
    simp only [h, metricScalarAt_scaleMetric, hR, div_eq_mul_inv, mul_comm]
  have hCs : |R / a| ≤ C := by
    rw [abs_div, abs_of_pos ha]
    exact (div_le_self (abs_nonneg _) ha₁).trans hC
  have hStats : bourCovariantGradient α h x = 0 := by
    change bourCovariantGradient α (scaleMetric a ha g) x = 0
    rw [bourCovariantGradient_scaleMetric]
    change a⁻¹ • bourCovariantGradient α g x = 0
    rw [hStat, smul_zero]
  exact bourStationary_roughTraceFreeRicci_abs_le hDim α hα₀ hα₁ h (R / a) hRs
    hCs x hStats hK u v

omit [NeZero (Module.finrank ℝ E)] [CompactSpace M] [BoundarylessManifold I M] in
/-- The output-raised chart curvature in the harmonic cancellation is
controlled by the ordered physical Riemann tensor and the inverse Gram. -/
theorem bourChartRiemann_abs_le_orderedCurvature
    (g : SmoothRiemannianMetric I M) (p : M) {x : M}
    (hx : x ∈ (extChartAt I p).source) {K L D : ℝ}
    (hK : Real.sqrt (intrinsicCurvatureSq g x) ≤ K)
    (_hL : 0 ≤ L)
    (hAxis : ∀ j : J, Real.sqrt (g.inner x
      (chartBasisVecFiber p j x) (chartBasisVecFiber p j x)) ≤ L)
    (hD : 0 ≤ D)
    (hInv : ∀ i j : J, |chartInvGramOnE g p i j (extChartAt I p x)| ≤ D)
    (i j k m : J) :
    |chartRiemannTensor g p i j k m (extChartAt I p x)| ≤
      (Module.finrank ℝ E : ℝ) * D * K * L ^ 4 := by
  classical
  have hgood := (mem_chartLeviCivitaGoodSet_iff_mem_extChartAt_source (I := I) p x).2 hx
  have hK₀ : 0 ≤ K := (Real.sqrt_nonneg _).trans hK
  rw [chartRiemannTensor_eq_sum_metricRm04At_mul_chartInvGramMatrix g p j k i m hgood]
  let b := fun j => chartBasisVecFiber (I := I) p j x
  have hOne (d : J) : |chartInvGramMatrix g p x m d *
      metricRm04At g x (fun q : Fin 4 => b (![j, k, i, d] q))| ≤ D * (K * L ^ 4) := by
    let v := fun q : Fin 4 => b (![j, k, i, d] q)
    have hR := bourRm04_apply_abs_le g x hK v
    have hProd :
        (∏ q : Fin 4, Real.sqrt (g.inner x (v q) (v q))) ≤ L ^ 4 := by
      calc
        _ ≤ ∏ _ : Fin 4, L :=
          Finset.prod_le_prod₀ (fun q _ => Real.sqrt_nonneg _) (fun q _ => hAxis _)
        _ = _ := by simp
    have hInv' : |chartInvGramMatrix g p x m d| ≤ D := by
      simpa only [chartInvGramOnE_def, (extChartAt I p).left_inv hx] using hInv m d
    rw [abs_mul]
    exact mul_le_mul hInv'
      (hR.trans (mul_le_mul_of_nonneg_left hProd hK₀)) (abs_nonneg _) hD
  calc
    _ ≤ ∑ d : J, |chartInvGramMatrix g p x m d *
        metricRm04At g x (fun q : Fin 4 => b (![j, k, i, d] q))| :=
      Finset.abs_sum_le_sum_abs _ _
    _ ≤ ∑ _ : J, D * (K * L ^ 4) := Finset.sum_le_sum fun d _ => hOne d
    _ = _ := by
      rw [Finset.sum_const, Finset.card_univ, Fintype.card_fin, nsmul_eq_mul]
      ring

omit [NeZero (Module.finrank ℝ E)] [CompactSpace M] in
/-- On the actual model patch, all three stationary source bounds use
one physical curvature ceiling. The extension only needs to agree with
the pulled-back metric on the open patch. -/
theorem bourModelStationaryReaction_bounds
    (hDim : Module.finrank ℝ E = 4) (α : ℝ) (hα₀ : 0 ≤ α) (hα₁ : α ≤ 1)
    (g : SmoothRiemannianMetric I M) (R : ℝ)
    (hR : ∀ y, metricScalarAt g y = R) {C : ℝ} (hC : |R| ≤ C)
    (G : SmoothRiemannianMetric 𝓘(ℝ, E) E)
    (Φ : PartialDiffeomorph 𝓘(ℝ, E) I E M ∞)
    (U : TopologicalSpace.Opens E) (hU : (U : Set E) ⊆ Φ.source)
    (hInner : ∀ z ∈ U, ∀ u v : E, G.inner z u v =
      g.inner (Φ z) (mfderiv 𝓘(ℝ, E) I Φ z u) (mfderiv 𝓘(ℝ, E) I Φ z v))
    {z : E} (hz : z ∈ U) (hStat : bourCovariantGradient α g (Φ z) = 0)
    {K L B D : ℝ} (hK : Real.sqrt (intrinsicCurvatureSq g (Φ z)) ≤ K)
    (hL : 0 ≤ L) (hB : 0 ≤ B)
    (hUpper : ∀ v : E, G.inner z v v ≤ L ^ 2 * ‖v‖ ^ 2)
    (hAxis : ∀ a : J, ‖chartModelBasis E a‖ ≤ B)
    (hD : 0 ≤ D) (hInv : ∀ a b : J, |chartInvGramOnE G 0 a b z| ≤ D) :
    (∀ a b c d : J, |chartRiemannTensor G 0 a b c d z| ≤ 4 * D * K * (L * B) ^ 4) ∧
    (∀ i j : J, |SmoothPoincare.bourChartTensorComponent
      (SmoothPoincare.bourTraceFreeRicciField G) 0 ![i,j] z| ≤
      (4 * K + C / 4) * (L * B) ^ 2) ∧
    (∀ i j : J, |SmoothPoincare.bourChartTensorComponent
      (roughLap0SField G (SmoothPoincare.bourTraceFreeRicciField G)) 0 ![i,j] z| ≤
      bourStationaryReactionBound K C * (L * B) ^ 2) := by
  have hK₀ : 0 ≤ K := (Real.sqrt_nonneg _).trans hK
  have hC₀ : 0 ≤ C := (abs_nonneg _).trans hC
  have hKG : Real.sqrt (intrinsicCurvatureSq G z) ≤ K := by
    rw [bourIntrinsicCurvatureSq_of_partialDiffeomorph_inner G g Φ U hU hInner hz]
    exact hK
  have hCG : |metricScalarAt G z| ≤ C := by
    rw [metricScalarAt_eq_of_partialDiffeomorph_inner G g Φ U hU hInner hz, hR]
    exact hC
  have hGlen (a : J) :
      Real.sqrt (G.inner z (chartModelBasis E a) (chartModelBasis E a)) ≤ L * B := by
    have h := Real.sqrt_le_sqrt (hUpper (chartModelBasis E a))
    rw [← mul_pow, Real.sqrt_sq (mul_nonneg hL (norm_nonneg _))] at h
    exact h.trans (mul_le_mul_of_nonneg_left (hAxis a) hL)
  have hLengths (i j : J) :
      Real.sqrt (G.inner z (chartModelBasis E i) (chartModelBasis E i)) *
        Real.sqrt (G.inner z (chartModelBasis E j) (chartModelBasis E j)) ≤ (L * B) ^ 2 := by
    rw [pow_two]
    exact mul_le_mul (hGlen i) (hGlen j) (Real.sqrt_nonneg _) (mul_nonneg hL hB)
  have hComponent (T : Tensor0SField (I := 𝓘(ℝ, E)) (M := E) ∞ 2) (i j : J) :
      SmoothPoincare.bourChartTensorComponent T 0 ![i,j] z =
        T z (vec2 (chartModelBasis E i) (chartModelBasis E j)) := by
    rw [SmoothPoincare.bourChartTensorComponent_model]
    congr 1
    funext k
    fin_cases k <;> rfl
  refine ⟨?_, ?_, ?_⟩
  · intro a b c d
    have hx : z ∈ (extChartAt 𝓘(ℝ, E) (0 : E)).source := by
      rw [extChartAt_model_space_eq_id]
      exact mem_univ _
    have hChart : extChartAt 𝓘(ℝ, E) (0 : E) z = z := by
      rw [extChartAt_model_space_eq_id]
      rfl
    have hFrame (j : J) :
        chartBasisVecFiber (I := 𝓘(ℝ, E)) (0 : E) j z = chartModelBasis E j := by
      unfold chartBasisVecFiber
      rw [TangentBundle.symmL_model_space]
      rfl
    have h := bourChartRiemann_abs_le_orderedCurvature G 0 hx hKG
      (mul_nonneg hL hB) (fun j => by rw [hFrame]; exact hGlen j) hD
      (by simpa only [hChart] using hInv) a b c d
    simpa only [hChart, hDim, Nat.cast_ofNat] using h
  · intro i j
    rw [hComponent]
    refine (bourTraceFreeRicci_apply_abs_le hDim G z hKG hCG _ _).trans ?_
    rw [mul_assoc]
    exact mul_le_mul_of_nonneg_left (hLengths i j) (by positivity)
  · intro i j
    let u : TangentSpace 𝓘(ℝ, E) z := chartModelBasis E i
    let v : TangentSpace 𝓘(ℝ, E) z := chartModelBasis E j
    let d := mfderiv 𝓘(ℝ, E) I Φ z
    have hTransport := bourRoughTraceFreeRicci_of_partialDiffeomorph_inner G g Φ U hU hInner hz u v
    have hi := congrArg Real.sqrt (hInner z hz u u).symm
    have hj := congrArg Real.sqrt (hInner z hz v v).symm
    calc
      _ = |roughLap0SField G (bourTraceFreeRicciField G) z (vec2 u v)| :=
        congrArg abs (hComponent _ i j)
      _ = |roughLap0SField g (bourTraceFreeRicciField g) (Φ z) (vec2 (d u) (d v))| :=
        congrArg abs hTransport
      _ ≤ bourStationaryReactionBound K C * Real.sqrt (g.inner (Φ z) (d u) (d u)) *
          Real.sqrt (g.inner (Φ z) (d v) (d v)) :=
        bourStationary_roughTraceFreeRicci_abs_le hDim α hα₀ hα₁ g R hR hC
          (Φ z) hStat hK (d u) (d v)
      _ ≤ _ := by
        change bourStationaryReactionBound K C *
          Real.sqrt (g.inner (Φ z) (mfderiv 𝓘(ℝ, E) I Φ z u) (mfderiv 𝓘(ℝ, E) I Φ z u)) *
          Real.sqrt (g.inner (Φ z) (mfderiv 𝓘(ℝ, E) I Φ z v) (mfderiv 𝓘(ℝ, E) I Φ z v)) ≤ _
        rw [hi, hj, mul_assoc]
        exact mul_le_mul_of_nonneg_left (hLengths i j) (by unfold bourStationaryReactionBound; positivity)

omit [NeZero (Module.finrank ℝ E)] [CompactSpace M] in
/-- Common trace-free Ricci size and principal source bounds in the
actual harmonic charts of any positive physical rescaling. Scalar constancy
and the stationary equation are supplied on the native metric. -/
theorem bourUniformStationaryHarmonicTraceFreeRicci_bounds
    (hDim : Module.finrank ℝ E = 4) {r L : ℝ} (hr : 0 < r) (hL : 0 < L)
    (A γ : ℝ≥0) {K C : ℝ} (hK : 0 ≤ K) (hC : 0 ≤ C) :
    ∃ U F₀ F₁ : ℝ, 0 ≤ U ∧ 0 ≤ F₀ ∧ 0 ≤ F₁ ∧
      ∀ (g : SmoothRiemannianMetric I M) (R : ℝ),
        (∀ y, metricScalarAt g y = R) → |R| ≤ C →
      ∀ (a : ℝ) (ha : 0 < a) (α : ℝ), 0 ≤ α → α ≤ 1 →
      ∀ (x : M) (b : BourHarmonicChart (scaleMetric a ha g) x L A γ),
        b.chart.source = Metric.ball (0 : E) (4 * r) →
      ∀ (G : SmoothRiemannianMetric 𝓘(ℝ, E) E),
        (∀ z ∈ Metric.ball (0 : E) (3 * r), ∀ v w : E,
          G.inner z v w = (scaleMetric a ha g).inner (b.chart z)
            (mfderiv 𝓘(ℝ, E) I (b.chart : E → M) z v)
            (mfderiv 𝓘(ℝ, E) I (b.chart : E → M) z w)) →
        (∀ z ∈ Metric.ball (0 : E) (3 * r), ∀ k : J,
          laplacian (LeviCivita G) G (bourChartCoordinate (I := 𝓘(ℝ, E)) (0 : E) k) z = 0) →
        (∀ z ∈ Metric.ball (0 : E) (3 * r), bourCovariantGradient α g (b.chart z) = 0) →
        (∀ z ∈ Metric.ball (0 : E) (3 * r),
          Real.sqrt (intrinsicCurvatureSq (scaleMetric a ha g) (b.chart z)) ≤ K) →
        let Z (j : J × J) := bourChartTensorComponent (bourTraceFreeRicciField G) 0 ![j.1,j.2]
        (∀ j z, z ∈ Metric.ball (0 : E) (3 * r) → |Z j z| ≤ U) ∧
        (∀ j z, z ∈ Metric.ball (0 : E) (3 * r) →
          |bourFlatOperator (fun i k => chartInvGramOnE G 0 i k z) (Z j) z| ≤
            F₀ + F₁ * ∑ i : (J × J) × J, |fderiv ℝ (Z i.1) z (chartModelBasis E i.2)|) := by
  let B : ℝ := 1 + ∑ j : J, ‖chartModelBasis E j‖
  have hB : 0 ≤ B := by dsimp [B]; positivity
  have hAxis (j : J) : ‖chartModelBasis E j‖ ≤ B := by
    apply le_trans (Finset.single_le_sum (fun k _ => norm_nonneg (chartModelBasis E k))
      (Finset.mem_univ j))
    dsimp only [B]
    linarith
  obtain ⟨D, hD, hControl⟩ :=
    bourMetricInverse_entry_controls (E := E) (r := r) hL (A := (A : ℝ))
  let C' : ℝ := C + 16 * K
  have hC' : 0 ≤ C' := by dsimp [C']; positivity
  let K' : ℝ := 4 * D * K * (L * B) ^ 4
  let U : ℝ := (4 * K + C' / 4) * (L * B) ^ 2
  let F : ℝ := bourStationaryReactionBound K C' * (L * B) ^ 2
  have hK' : 0 ≤ K' := by dsimp [K']; positivity
  have hU : 0 ≤ U := by dsimp only [U]; positivity
  have hF : 0 ≤ F := by dsimp only [F, bourStationaryReactionBound]; positivity
  obtain ⟨F₀, F₁, hF₀, hF₁, hPrincipal⟩ :=
    bourUniformHarmonicTraceFreeRicci_principal_bound (I := I) (M := M) hr hL A γ hK' hU hF
  refine ⟨U, F₀, F₁, hU, hF₀, hF₁, ?_⟩
  intro g R hR _ a ha α hα₀ hα₁ x b hs G hPull hHarm hStationary hRm
  let h := scaleMetric a ha g
  let V : TopologicalSpace.Opens E := ⟨Metric.ball (0 : E) (3 * r), Metric.isOpen_ball⟩
  have hSource : (V : Set E) ⊆ b.chart.source := by
    rw [hs]
    exact Metric.ball_subset_ball (by linarith)
  have hForm (z : E) (hz : z ∈ V) (v : E) :
      L⁻¹ ^ 2 * ‖v‖ ^ 2 ≤ G.inner z v v := by
    rw [hPull z hz v v]
    exact (b.metric_bounds z (hSource hz) v).1
  have hUpper (z : E) (hz : z ∈ V) (v : E) :
      G.inner z v v ≤ L ^ 2 * ‖v‖ ^ 2 := by
    rw [hPull z hz v v]
    exact (b.metric_bounds z (hSource hz) v).2
  have hGram (i j : J) (z : E) (hz : z ∈ V) :
      ‖fderiv ℝ (chartGramOnE G 0 i j) z‖ ≤ (A : ℝ) :=
    bourModelGram_fderiv_bound_of_pullback b G hPull i j hz (hSource hz)
  have hRs (y : M) : metricScalarAt h y = R / a := by
    simp only [h, metricScalarAt_scaleMetric, hR, div_eq_mul_inv, mul_comm]
  have hStats (z : E) (hz : z ∈ V) : bourCovariantGradient α h (b.chart z) = 0 := by
    change bourCovariantGradient α (scaleMetric a ha g) (b.chart z) = 0
    rw [bourCovariantGradient_scaleMetric]
    change a⁻¹ • bourCovariantGradient α g (b.chart z) = 0
    rw [hStationary z hz, smul_zero]
  have hBounds (z : E) (hz : z ∈ V) := by
    have hScalar := bourMetricScalar_abs_le_orderedCurvature h (b.chart z) (hRm z hz)
    rw [hRs, hDim, Nat.cast_ofNat] at hScalar
    have hScalar' : |R / a| ≤ C' := by dsimp only [C']; nlinarith
    exact bourModelStationaryReaction_bounds hDim α hα₀ hα₁ h (R / a) hRs hScalar'
      G b.chart V hSource hPull hz (hStats z hz) (hRm z hz) hL.le hB (hUpper z hz) hAxis
      hD (fun i j => (hControl G hForm hGram).1 i j z hz)
  refine ⟨fun j z hz => (hBounds z hz).2.1 j.1 j.2, ?_⟩
  intro j z hz
  exact hPrincipal h x b hs G hPull hHarm (fun w hw => (hBounds w hw).1)
    (fun w hw => (hBounds w hw).2.1) (fun w hw => (hBounds w hw).2.2) z hz j.1 j.2

end
end SmoothPoincare.Bour
