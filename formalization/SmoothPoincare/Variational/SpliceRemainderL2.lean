import SmoothPoincare.Variational.ChartSpliceJets
import Mathlib.MeasureTheory.Function.LpSeminorm.LpNorm

/-! # An L² estimate for the quadratic chart-curvature remainder -/

open DifferentialGeometry DifferentialGeometry.Analysis
open DifferentialGeometry.Geometry.Curvature DifferentialGeometry.Geometry.Operator
open DifferentialGeometry.Tensor.Coordinates MeasureTheory Filter
open scoped ENNReal BigOperators ContDiff Manifold Topology

namespace SmoothPoincare

private structure PairEstimate (a b magnitude error : ℝ) : Prop where
  left : |a| ≤ magnitude
  right : |b| ≤ magnitude
  diff : |a - b| ≤ error

private theorem absSub_le (a b : ℝ) : |a - b| ≤ |a| + |b| := by
  simpa only [sub_eq_add_neg, abs_neg] using abs_add_le a (-b)

private theorem PairEstimate.add {a b c d M N ε δ : ℝ}
    (h : PairEstimate a b M ε) (k : PairEstimate c d N δ) :
    PairEstimate (a + c) (b + d) (M + N) (ε + δ) := by
  refine ⟨(abs_add_le _ _).trans (add_le_add h.left k.left),
    (abs_add_le _ _).trans (add_le_add h.right k.right), ?_⟩
  rw [show a + c - (b + d) = (a - b) + (c - d) by ring]
  exact (abs_add_le _ _).trans (add_le_add h.diff k.diff)

private theorem PairEstimate.neg {a b M ε : ℝ} (h : PairEstimate a b M ε) :
    PairEstimate (-a) (-b) M ε := by
  refine ⟨by simpa only [abs_neg] using h.left, by simpa only [abs_neg] using h.right, ?_⟩
  simpa only [show -a - -b = -(a - b) by ring, abs_neg] using h.diff

private theorem PairEstimate.sub {a b c d M N ε δ : ℝ}
    (h : PairEstimate a b M ε) (k : PairEstimate c d N δ) :
    PairEstimate (a - c) (b - d) (M + N) (ε + δ) := by
  simpa only [sub_eq_add_neg] using h.add k.neg

private theorem PairEstimate.mul {a b c d M N ε δ : ℝ}
    (h : PairEstimate a b M ε) (k : PairEstimate c d N δ) :
    PairEstimate (a * c) (b * d) (M * N) (ε * N + M * δ) := by
  have hM := (abs_nonneg a).trans h.left
  have hε := (abs_nonneg (a - b)).trans h.diff
  refine ⟨by rw [abs_mul]; exact mul_le_mul h.left k.left (abs_nonneg _) hM,
    by rw [abs_mul]; exact mul_le_mul h.right k.right (abs_nonneg _) hM, ?_⟩
  rw [show a * c - b * d = (a - b) * c + b * (c - d) by ring]
  refine (abs_add_le _ _).trans ?_
  simp only [abs_mul]
  exact add_le_add (mul_le_mul h.diff k.left (abs_nonneg _) hε)
    (mul_le_mul h.right k.diff (abs_nonneg _) hM)

private theorem PairEstimate.half {a b M ε : ℝ} (h : PairEstimate a b M ε) :
    PairEstimate ((1 / 2 : ℝ) * a) ((1 / 2 : ℝ) * b) ((1 / 2 : ℝ) * M) ((1 / 2 : ℝ) * ε) := by
  have hh : PairEstimate (1 / 2 : ℝ) (1 / 2 : ℝ) (1 / 2 : ℝ) 0 := ⟨by norm_num, by norm_num, by norm_num⟩
  simpa only [zero_mul, zero_add] using hh.mul h

private theorem abs_sum_fin_le {n : ℕ} {f : Fin n → ℝ} {L : ℝ} (hL : ∀ j, |f j| ≤ L) :
    |∑ j, f j| ≤ (n : ℝ) * L := by
  refine (Finset.abs_sum_le_sum_abs _ _).trans ?_
  simpa using Finset.sum_le_sum (s := Finset.univ) fun j _ => hL j

private theorem PairEstimate.sum {n : ℕ} {a b : Fin n → ℝ} {M ε : ℝ}
    (h : ∀ j, PairEstimate (a j) (b j) M ε) :
    PairEstimate (∑ j, a j) (∑ j, b j) ((n : ℝ) * M) ((n : ℝ) * ε) := by
  refine ⟨abs_sum_fin_le fun j => (h j).left, abs_sum_fin_le fun j => (h j).right, ?_⟩
  rw [← Finset.sum_sub_distrib]
  exact abs_sum_fin_le fun j => (h j).diff

/-- A common inverse bound turns the uniform Gram value error into a uniform
inverse error by the matrix inverse difference identity. -/
theorem abs_matrixInverse_sub_le {n : ℕ} (A B : Matrix (Fin n) (Fin n) ℝ)
    (hA : IsUnit A.det) (hB : IsUnit B.det) {K η : ℝ} (hK : 0 ≤ K)
    (hAinv : ∀ i j, |A⁻¹ i j| ≤ K) (hBinv : ∀ i j, |B⁻¹ i j| ≤ K)
    (hClose : ∀ i j, |A i j - B i j| ≤ η) (i j : Fin n) :
    |A⁻¹ i j - B⁻¹ i j| ≤ (n : ℝ) ^ 2 * K ^ 2 * η := by
  have hId : A⁻¹ - B⁻¹ = A⁻¹ * (B - A) * B⁻¹ := by
    rw [mul_sub, sub_mul, Matrix.nonsing_inv_mul _ hA, one_mul, Matrix.mul_assoc,
      Matrix.mul_nonsing_inv _ hB, mul_one]
  have hInner (k : Fin n) : |(A⁻¹ * (B - A)) i k| ≤ (n : ℝ) * (K * η) := by
    rw [Matrix.mul_apply]
    refine abs_sum_fin_le fun m => ?_
    rw [abs_mul, Matrix.sub_apply, abs_sub_comm]
    exact mul_le_mul (hAinv i m) (hClose m k) (abs_nonneg _) hK
  change |(A⁻¹ - B⁻¹) i j| ≤ _
  rw [hId, Matrix.mul_apply]
  calc
    _ ≤ (n : ℝ) * (((n : ℝ) * (K * η)) * K) := abs_sum_fin_le fun k => by
      rw [abs_mul]
      exact mul_le_mul (hInner k) (hBinv k j) (abs_nonneg _) ((abs_nonneg _).trans (hInner k))
    _ = _ := by ring

/-- A convex splice remainder is bounded by the two comparisons with the
reference metric. This permits the same first-jet estimates for both terms. -/
theorem abs_quadraticSpliceRemainder_le {t : ℝ} (ht : t ∈ Set.Icc (0 : ℝ) 1) (h g b : ℝ) :
    |h - ((1 - t) * g + t * b)| ≤ |h - b| + |g - b| := by
  rw [show h - ((1 - t) * g + t * b) = (h - b) - (1 - t) * (g - b) by ring]
  refine (absSub_le _ _).trans ?_
  rw [abs_mul, abs_of_nonneg (sub_nonneg.mpr ht.2)]
  exact add_le_add (le_refl _) (mul_le_of_le_one_left (abs_nonneg _) (by linarith only [ht.1]))

section Chart

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]

private theorem abs_loweredFirstJet_sub_le {n : ℕ} (basis : Fin n → E)
    (A B : Fin n → Fin n → ℝ) (u v : E →L[ℝ] Fin n → Fin n → ℝ)
    {K η G d : ℝ}
    (hValue : ∀ a c, PairEstimate (A a c) (B a c) K η)
    (hInverse : ∀ a c, PairEstimate ((Matrix.of A)⁻¹ a c) ((Matrix.of B)⁻¹ a c) K η)
    (hFirst : ∀ m a c, PairEstimate (u (basis m) a c) (v (basis m) a c) G d)
    (i j k l : Fin n) :
    |(∑ m, A l m * jetRiemann basis (A, u, 0) i j k m) -
      (∑ m, B l m * jetRiemann basis (B, v, 0) i j k m)| ≤
      (n : ℝ) ^ 4 * ((45 / 2 : ℝ) * K ^ 2 * η * G ^ 2 + 15 * K ^ 3 * d * G) := by
  let p : MatJet E n := (A, u, 0)
  let q : MatJet E n := (B, v, 0)
  let N : ℝ := n
  have hBracket (a b c : Fin n) := ((hFirst a c b).add (hFirst b c a)).sub (hFirst c a b)
  have hΓ (a b c : Fin n) : PairEstimate (jetChristoffel basis p a b c)
      (jetChristoffel basis q a b c) ((1 / 2 : ℝ) * (N * (K * (G + G + G))))
      ((1 / 2 : ℝ) * (N * (η * (G + G + G) + K * (d + d + d)))) := by
    exact (PairEstimate.sum fun r => (hInverse c r).mul (hBracket a b r)).half
  have hInvDer (m c r : Fin n) :=
    (PairEstimate.sum fun a => PairEstimate.sum fun b =>
      ((hInverse c a).mul (hInverse b r)).mul (hFirst m a b)).neg
  let invSize := N * (N * (K * K * G))
  let invError := N * (N * ((η * K + K * η) * G + K * K * d))
  have hΓD (m a b c : Fin n) : PairEstimate (jetChristoffelDeriv basis p m a b c)
      (jetChristoffelDeriv basis q m a b c) ((1 / 2 : ℝ) * (N * (invSize * (G + G + G))))
      ((1 / 2 : ℝ) * (N * (invError * (G + G + G) + invSize * (d + d + d)))) := by
    simpa only [jetChristoffelDeriv, p, q, zero_apply, Pi.zero_apply, add_zero, sub_zero, mul_zero]
      using (PairEstimate.sum fun r => (hInvDer m c r).mul (hBracket a b r)).half
  have hRm (m : Fin n) := ((hΓD j i k m).sub (hΓD k i j m)).add
    (PairEstimate.sum fun a => ((hΓ j a m).mul (hΓ i k a)).sub ((hΓ k a m).mul (hΓ i j a)))
  have hTotal := (PairEstimate.sum fun m => (hValue l m).mul (hRm m)).diff
  change |(∑ m, A l m * jetRiemann basis p i j k m) -
    (∑ m, B l m * jetRiemann basis q i j k m)| ≤ _
  convert hTotal using 1
  all_goals simp only [jetRiemann, N, invSize, invError]
  all_goals ring

variable [FiniteDimensional ℝ E] {H M : Type*} [TopologicalSpace H]
  {I : ModelWithCorners ℝ E H} [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]

/-- A uniform coefficient bound on the difference of the actual quadratic
chart remainders. `K` bounds the values and inverse matrices, `η` bounds their
differences, and `G` and `d` bound the first jets and their difference. -/
theorem abs_chartCurvatureFirstJetTerm_sub_le (p q : SmoothRiemannianMetric I M) (α : M) (x : E)
    {K η G d : ℝ}
    (hValues : ∀ a c, |chartGramPi p α x a c| ≤ K ∧ |chartGramPi q α x a c| ≤ K ∧
      |chartGramPi p α x a c - chartGramPi q α x a c| ≤ η)
    (hInverses : ∀ a c, |(Matrix.of (chartGramPi p α x))⁻¹ a c| ≤ K ∧
      |(Matrix.of (chartGramPi q α x))⁻¹ a c| ≤ K ∧
      |(Matrix.of (chartGramPi p α x))⁻¹ a c - (Matrix.of (chartGramPi q α x))⁻¹ a c| ≤ η)
    (hFirst : ∀ m a c, let P := fderiv ℝ (chartGramPi p α) x (chartModelBasis E m) a c
      let Q := fderiv ℝ (chartGramPi q α) x (chartModelBasis E m) a c
      |P| ≤ G ∧ |Q| ≤ G ∧ |P - Q| ≤ d)
    (i j k l : Fin (Module.finrank ℝ E)) :
    |chartCurvatureFirstJetTerm p α x i j k l - chartCurvatureFirstJetTerm q α x i j k l| ≤
      (Module.finrank ℝ E : ℝ) ^ 4 * ((45 / 2 : ℝ) * K ^ 2 * η * G ^ 2 + 15 * K ^ 3 * d * G) :=
  abs_loweredFirstJet_sub_le (chartModelBasis E) (chartGramPi p α x) (chartGramPi q α x)
    (fderiv ℝ (chartGramPi p α) x) (fderiv ℝ (chartGramPi q α) x)
    (fun a c => ⟨(hValues a c).1, (hValues a c).2.1, (hValues a c).2.2⟩)
    (fun a c => ⟨(hInverses a c).1, (hInverses a c).2.1, (hInverses a c).2.2⟩)
    (fun m a c => ⟨(hFirst m a c).1, (hFirst m a c).2.1, (hFirst m a c).2.2⟩) i j k l

end Chart

section Measured

variable {D : Type*} [MeasurableSpace D] {μ : Measure D}

private theorem lpNorm_mul_four_le {f g : D → ℝ} (hf : MemLp f 4 μ) (hg : MemLp g 4 μ) :
    MemLp (fun x => f x * g x) 2 μ ∧
      lpNorm (fun x => f x * g x) 2 μ ≤ lpNorm f 4 μ * lpNorm g 4 μ := by
  have hTriple : Real.HolderTriple 4 4 2 := ⟨by norm_num, by norm_num, by norm_num⟩
  let : ENNReal.HolderTriple 4 4 2 := by simpa using hTriple.ennrealOfReal
  refine ⟨hf.fun_mul hg, ?_⟩
  have hH := eLpNorm_le_eLpNorm_mul_eLpNorm_of_norm (p := 4) (q := 4) (r := 2)
    (fun a b : ℝ => a * b) 1 (by fun_prop) hf.aestronglyMeasurable hg.aestronglyMeasurable
    (Eventually.of_forall fun _ => by simp only [norm_mul, NNReal.coe_one, one_mul, le_refl])
  rw [← toReal_eLpNorm, ← toReal_eLpNorm, ← toReal_eLpNorm, ← ENNReal.toReal_mul]
  exact ENNReal.toReal_mono (ENNReal.mul_ne_top hf.eLpNorm_ne_top hg.eLpNorm_ne_top)
    (by simpa only [ENNReal.coe_one, one_mul] using hH)

/-- A first-jet difference times a bounded-in-`L⁴` first jet and a small
coefficient times its square have the indicated Hölder `L²` bound. -/
theorem quadraticRemainder_memLp_and_le {R G d : D → ℝ} {A B : ℝ}
    (hA : 0 ≤ A) (hB : 0 ≤ B) (hG : MemLp G 4 μ) (hd : MemLp d 4 μ)
    (hMeas : AEStronglyMeasurable R μ)
    (hBound : ∀ᵐ x ∂μ, |R x| ≤ A * (‖d x‖ * ‖G x‖) + B * (‖G x‖ * ‖G x‖)) :
    MemLp R 2 μ ∧ lpNorm R 2 μ ≤ A * (lpNorm d 4 μ * lpNorm G 4 μ) + B * (lpNorm G 4 μ ^ 2) := by
  let J := fun x => ‖d x‖ * ‖G x‖
  let K := fun x => ‖G x‖ * ‖G x‖
  obtain ⟨hJ, hJBound⟩ := lpNorm_mul_four_le hd.norm hG.norm
  obtain ⟨hK, hKBound⟩ := lpNorm_mul_four_le hG.norm hG.norm
  rw [lpNorm_norm hd.aestronglyMeasurable, lpNorm_norm hG.aestronglyMeasurable] at hJBound
  rw [lpNorm_norm hG.aestronglyMeasurable, ← pow_two] at hKBound
  have hM := (hJ.const_smul A).add (hK.const_smul B)
  have hDom : ∀ᵐ x ∂μ, ‖R x‖ ≤ ‖(A • J + B • K) x‖ := by
    filter_upwards [hBound] with x hx
    rw [Real.norm_eq_abs, show (A • J + B • K) x = A * J x + B * K x from rfl]
    exact hx.trans (le_abs_self _)
  refine ⟨hM.of_le hMeas hDom, ?_⟩
  calc
    _ ≤ lpNorm (A • J + B • K) 2 μ :=
      ENNReal.toReal_mono hM.eLpNorm_ne_top (eLpNorm_mono_ae hMeas hDom)
    _ ≤ lpNorm (A • J) 2 μ + lpNorm (B • K) 2 μ := lpNorm_add_le (hJ.const_smul A) (by norm_num)
    _ ≤ _ := by
      rw [lpNorm_const_smul, lpNorm_const_smul, Real.nnnorm_of_nonneg hA, Real.nnnorm_of_nonneg hB]
      exact add_le_add (mul_le_mul_of_nonneg_left hJBound hA) (mul_le_mul_of_nonneg_left hKBound hB)

/-- The first-jet term in the full splice commutator is controlled by the sum
of its two `L²` comparisons with the reference metric. -/
theorem quadraticSpliceRemainder_memLp_and_le {h g b w : D → ℝ}
    (hWeightMeas : AEStronglyMeasurable w μ) (hWeight : ∀ᵐ x ∂μ, w x ∈ Set.Icc (0 : ℝ) 1)
    (hSplice : MemLp (h - b) 2 μ) (hSource : MemLp (g - b) 2 μ) :
    let R := fun x => h x - ((1 - w x) * g x + w x * b x)
    MemLp R 2 μ ∧ lpNorm R 2 μ ≤ lpNorm (h - b) 2 μ + lpNorm (g - b) 2 μ := by
  intro R
  let S := fun x => (1 - w x) * (g x - b x)
  have hMeas : AEStronglyMeasurable S μ :=
    (aestronglyMeasurable_const.sub hWeightMeas).mul hSource.aestronglyMeasurable
  have hDom : ∀ᵐ x ∂μ, ‖S x‖ ≤ ‖(g - b) x‖ := by
    filter_upwards [hWeight] with x hx
    change ‖(1 - w x) * (g x - b x)‖ ≤ ‖g x - b x‖
    rw [norm_mul, Real.norm_of_nonneg (sub_nonneg.mpr hx.2)]
    exact mul_le_of_le_one_left (norm_nonneg _) (by linarith only [hx.1])
  have hSMem := hSource.of_le hMeas hDom
  have hSize : lpNorm S 2 μ ≤ lpNorm (g - b) 2 μ :=
    ENNReal.toReal_mono hSource.eLpNorm_ne_top (eLpNorm_mono_ae hMeas hDom)
  have hIdentity : R = (h - b) - S := by
    funext x
    change h x - ((1 - w x) * g x + w x * b x) = (h x - b x) - (1 - w x) * (g x - b x)
    ring
  rw [hIdentity]
  exact ⟨hSplice.sub hSMem, (lpNorm_sub_le hSplice (by norm_num)).trans (add_le_add_right hSize _)⟩

/-- If the pointwise majorant uses one uniform coefficient error and one common
first-jet difference bound at each source index, the `L²` error is uniform over
all path parameters. -/
theorem tendstoUniformly_quadraticRemainder_l2 {T : Type*}
    {R : ℕ → T → D → ℝ} {G d : ℕ → D → ℝ} {η : ℕ → ℝ} {A B C : ℝ}
    (hA : 0 ≤ A) (hB : 0 ≤ B) (hη : ∀ n, 0 ≤ η n)
    (hG : ∀ n, MemLp (G n) 4 μ) (hd : ∀ n, MemLp (d n) 4 μ)
    (hGSize : ∀ n, lpNorm (G n) 4 μ ≤ C)
    (hdLim : Tendsto (fun n => lpNorm (d n) 4 μ) atTop (𝓝 0))
    (hηLim : Tendsto η atTop (𝓝 0))
    (hMeas : ∀ n t, AEStronglyMeasurable (R n t) μ)
    (hBound : ∀ n t, ∀ᵐ x ∂μ,
      |R n t x| ≤ A * (‖d n x‖ * ‖G n x‖) + (B * η n) * (‖G n x‖ * ‖G n x‖)) :
    TendstoUniformly (fun n t => lpNorm (R n t) 2 μ) (fun _ => 0) atTop := by
  have hUpper : Tendsto (fun n => A * (lpNorm (d n) 4 μ * C) + B * η n * C ^ 2) atTop (𝓝 0) := by
    simpa only [zero_mul, mul_zero, add_zero] using
      ((hdLim.mul_const C).const_mul A).add ((hηLim.const_mul B).mul_const (C ^ 2))
  rw [Metric.tendstoUniformly_iff]
  intro ε hε
  filter_upwards [(Metric.tendsto_nhds.mp hUpper) ε hε] with n hn t
  have hNorm := (quadraticRemainder_memLp_and_le hA (mul_nonneg hB (hη n)) (hG n) (hd n)
    (hMeas n t) (hBound n t)).2
  have hBound' : lpNorm (R n t) 2 μ ≤ A * (lpNorm (d n) 4 μ * C) + B * η n * C ^ 2 := by
    refine hNorm.trans (add_le_add ?_ ?_)
    · exact mul_le_mul_of_nonneg_left (mul_le_mul_of_nonneg_left (hGSize n) lpNorm_nonneg) hA
    · exact mul_le_mul_of_nonneg_left (pow_le_pow_left₀ lpNorm_nonneg (hGSize n) 2) (mul_nonneg hB (hη n))
  simp only [Real.dist_eq, zero_sub, abs_neg, abs_of_nonneg (lpNorm_nonneg : 0 ≤ lpNorm (R n t) 2 μ)]
  simpa only [Real.dist_eq, sub_zero] using hBound'.trans_lt ((le_abs_self _).trans_lt (by simpa only [Real.dist_eq, sub_zero] using hn))

end Measured

section ChartMeasured

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [MeasurableSpace E] {μ : Measure E} {H M : Type*} [TopologicalSpace H]
  {I : ModelWithCorners ℝ E H} [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]

/-- The actual two-metric chart remainder difference is in `L²` on the fixed
measure and obeys the quantitative bound from its zero and first jets. -/
theorem chartCurvatureFirstJetTerm_sub_memLp_and_le
    (p q : SmoothRiemannianMetric I M) (α : M) (i j k l : Fin (Module.finrank ℝ E))
    {K η : ℝ} {G d : E → ℝ}
    (hK : 0 ≤ K) (hη : 0 ≤ η) (hG : MemLp G 4 μ) (hd : MemLp d 4 μ)
    (hMeas : AEStronglyMeasurable (fun x =>
      chartCurvatureFirstJetTerm p α x i j k l - chartCurvatureFirstJetTerm q α x i j k l) μ)
    (hValues : ∀ᵐ x ∂μ, ∀ a c, |chartGramPi p α x a c| ≤ K ∧ |chartGramPi q α x a c| ≤ K ∧
      |chartGramPi p α x a c - chartGramPi q α x a c| ≤ η)
    (hInverses : ∀ᵐ x ∂μ, ∀ a c, |(Matrix.of (chartGramPi p α x))⁻¹ a c| ≤ K ∧
      |(Matrix.of (chartGramPi q α x))⁻¹ a c| ≤ K ∧
      |(Matrix.of (chartGramPi p α x))⁻¹ a c - (Matrix.of (chartGramPi q α x))⁻¹ a c| ≤ η)
    (hFirst : ∀ᵐ x ∂μ, ∀ m a c, let P := fderiv ℝ (chartGramPi p α) x (chartModelBasis E m) a c
      let Q := fderiv ℝ (chartGramPi q α) x (chartModelBasis E m) a c
      |P| ≤ ‖G x‖ ∧ |Q| ≤ ‖G x‖ ∧ |P - Q| ≤ ‖d x‖) :
    let R := fun x => chartCurvatureFirstJetTerm p α x i j k l - chartCurvatureFirstJetTerm q α x i j k l
    let N := (Module.finrank ℝ E : ℝ)
    MemLp R 2 μ ∧ lpNorm R 2 μ ≤
      (N ^ 4 * 15 * K ^ 3) * (lpNorm d 4 μ * lpNorm G 4 μ) +
      (N ^ 4 * (45 / 2 : ℝ) * K ^ 2 * η) * (lpNorm G 4 μ ^ 2) := by
  intro R N
  apply quadraticRemainder_memLp_and_le (by positivity) (by positivity) hG hd hMeas
  filter_upwards [hValues, hInverses, hFirst] with x hxValue hxInverse hxFirst
  convert abs_chartCurvatureFirstJetTerm_sub_le p q α x hxValue hxInverse hxFirst i j k l using 1
  all_goals ring

end ChartMeasured

end SmoothPoincare
