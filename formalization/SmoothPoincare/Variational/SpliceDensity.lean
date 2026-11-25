import FirstOrderTwistor.CapSplice
import FirstOrderTwistor.CurvatureCompressionBound
import FirstOrderTwistor.FixedMetricEnergy
import Mathlib.Analysis.InnerProductSpace.PiL2

/-! # From curvature errors to energy errors on a fixed domain

The moving curvature and its comparison take values in one coefficient space.
The linear maps into the chiral coefficient space include the square root
of the volume Jacobian relative to the fixed measure.
-/

open Filter FirstOrderTwistor MeasureTheory
open scoped Topology

namespace SmoothPoincare

section Measured

variable {D C F : Type*} [MeasurableSpace D] {μ : Measure D}
  [NormedAddCommGroup C] [NormedSpace ℝ C] [NormedAddCommGroup F] [NormedSpace ℝ F]

omit [NormedSpace ℝ F] in
private theorem lpNorm_two_sq_eq_integral {f : D → F} (hf : MemLp f 2 μ) :
    lpNorm f 2 μ ^ 2 = ∫ x, ‖f x‖ ^ 2 ∂μ := by
  rw [lpNorm_eq_integral_norm_rpow_toReal (by norm_num) (by simp) hf.aestronglyMeasurable]
  norm_num [Real.rpow_two, one_div, ← Real.sqrt_eq_rpow,
    Real.sq_sqrt (integral_nonneg fun _ => sq_nonneg _)]

private theorem projected_memLp_and_bound {R : D → C} {P : D → C →L[ℝ] F} {B : ℝ}
    (hR : MemLp R 2 μ) (hMeas : AEStronglyMeasurable (fun x => P x (R x)) μ)
    (hB : 0 ≤ B) (hP : ∀ᵐ x ∂μ, ‖P x‖ ≤ B) :
    MemLp (fun x => P x (R x)) 2 μ ∧
      lpNorm (fun x => P x (R x)) 2 μ ≤ B * lpNorm R 2 μ := by
  have hScaled := hR.const_smul B
  have hBound : ∀ᵐ x ∂μ, ‖P x (R x)‖ ≤ ‖(B • R) x‖ := by
    filter_upwards [hP] with x hx
    change ‖P x (R x)‖ ≤ ‖B • R x‖
    rw [norm_smul, Real.norm_of_nonneg hB]
    exact ((P x).le_opNorm _).trans (mul_le_mul_of_nonneg_right hx (norm_nonneg _))
  refine ⟨hScaled.of_le hMeas hBound, ?_⟩
  calc
    _ ≤ lpNorm (B • R) 2 μ :=
      ENNReal.toReal_mono hScaled.eLpNorm_ne_top (eLpNorm_mono_ae hMeas hBound)
    _ = B * lpNorm R 2 μ := by
      rw [lpNorm_const_smul, Real.nnnorm_of_nonneg hB]
      rfl

/-- A linear projection error and a curvature residual on the same reference
measure give a quantitative difference of squared projected integrals. -/
theorem spliceEnergyDifference_le
    {R S : D → C} {P Q : D → C →L[ℝ] F} {B K ε η : ℝ}
    (hB : 0 ≤ B) (hη : 0 ≤ η)
    (hR : MemLp R 2 μ) (hS : MemLp S 2 μ)
    (hPR : AEStronglyMeasurable (fun x => P x (R x)) μ)
    (hQS : AEStronglyMeasurable (fun x => Q x (S x)) μ)
    (hP : ∀ᵐ x ∂μ, ‖P x‖ ≤ B) (hQ : ∀ᵐ x ∂μ, ‖Q x‖ ≤ B)
    (hProjector : ∀ᵐ x ∂μ, ‖P x - Q x‖ ≤ η)
    (hCurvature : lpNorm (R - S) 2 μ ≤ ε) (hSize : lpNorm S 2 μ ≤ K) :
    let error := B * ε + η * K
    |(∫ x, ‖P x (R x)‖ ^ 2 ∂μ) - ∫ x, ‖Q x (S x)‖ ^ 2 ∂μ| ≤
      (2 * (B * K) + error) * error := by
  let f := fun x => P x (R x)
  let g := fun x => Q x (S x)
  intro error
  have hf := (projected_memLp_and_bound hR hPR hB hP).1
  obtain ⟨hg, hgSize⟩ := projected_memLp_and_bound hS hQS hB hQ
  have hgK : lpNorm g 2 μ ≤ B * K := hgSize.trans (mul_le_mul_of_nonneg_left hSize hB)
  have hRS := hR.sub hS
  have hCutoff := hRS.norm.const_smul B
  have hCutoffNorm : lpNorm (B • fun x => ‖(R - S) x‖) 2 μ ≤ B * ε := by
    rw [lpNorm_const_smul, Real.nnnorm_of_nonneg hB, lpNorm_norm hRS.aestronglyMeasurable]
    exact mul_le_mul_of_nonneg_left hCurvature hB
  have hDiff : lpNorm (f - g) 2 μ ≤ error := by
    have h := capSpliceProjectionErrorBound (a := η) (C := 1) (coverCurvature := K)
      hη zero_le_one (hPR.sub hQS) hS.norm hCutoff
      (by rwa [lpNorm_norm hS.aestronglyMeasurable]) hCutoffNorm (by
        filter_upwards [hP, hProjector] with x hxP hxDiff
        change ‖P x (R x) - Q x (S x)‖ ≤ 1 * (η * ‖S x‖ + B * ‖R x - S x‖)
        have hDecomp : P x (R x) - Q x (S x) =
            (P x - Q x) (S x) + P x (R x - S x) := by
          rw [sub_apply, map_sub]
          abel
        rw [hDecomp, one_mul]
        exact (norm_add_le _ _).trans (add_le_add
          (((P x - Q x).le_opNorm _).trans (mul_le_mul_of_nonneg_right hxDiff (norm_nonneg _)))
          (((P x).le_opNorm _).trans (mul_le_mul_of_nonneg_right hxP (norm_nonneg _)))))
    simpa only [one_mul, add_comm, error] using h
  have hForward := lpNorm_le_lpNorm_add_lpNorm_sub' (f := f) hg (by norm_num)
  have hBackward := lpNorm_le_lpNorm_add_lpNorm_sub (f := g) hf (by norm_num)
  have hAbs : |lpNorm f 2 μ - lpNorm g 2 μ| ≤ error := by
    apply abs_le.mpr
    constructor <;> linarith only [hForward, hBackward, hDiff]
  have hSum : lpNorm f 2 μ + lpNorm g 2 μ ≤ 2 * (B * K) + error := by
    linarith only [hForward, hDiff, hgK]
  have hNonneg : 0 ≤ lpNorm f 2 μ + lpNorm g 2 μ :=
    add_nonneg ENNReal.toReal_nonneg ENNReal.toReal_nonneg
  change |(∫ x, ‖f x‖ ^ 2 ∂μ) - ∫ x, ‖g x‖ ^ 2 ∂μ| ≤ _
  rw [← lpNorm_two_sq_eq_integral hf, ← lpNorm_two_sq_eq_integral hg, sq_sub_sq, abs_mul,
    abs_of_nonneg hNonneg]
  exact mul_le_mul hSum hAbs (abs_nonneg _) (hNonneg.trans hSum)

variable {T : Type*}

/-- The comparison is uniform over all supplied path parameters. The only
limit estimates are the common operator distortion and curvature residual. -/
theorem tendstoUniformly_spliceEnergyDifference
    {R S : ℕ → T → D → C} {P Q : ℕ → T → D → C →L[ℝ] F}
    {B K : ℝ} {ε η : ℕ → ℝ}
    (hB : 0 ≤ B) (hη : ∀ n, 0 ≤ η n)
    (hεLim : Tendsto ε atTop (𝓝 0)) (hηLim : Tendsto η atTop (𝓝 0))
    (hR : ∀ n t, MemLp (R n t) 2 μ) (hS : ∀ n t, MemLp (S n t) 2 μ)
    (hPR : ∀ n t, AEStronglyMeasurable (fun x => P n t x (R n t x)) μ)
    (hQS : ∀ n t, AEStronglyMeasurable (fun x => Q n t x (S n t x)) μ)
    (hP : ∀ n t, ∀ᵐ x ∂μ, ‖P n t x‖ ≤ B) (hQ : ∀ n t, ∀ᵐ x ∂μ, ‖Q n t x‖ ≤ B)
    (hProjector : ∀ n t, ∀ᵐ x ∂μ, ‖P n t x - Q n t x‖ ≤ η n)
    (hCurvature : ∀ n t, lpNorm (R n t - S n t) 2 μ ≤ ε n)
    (hSize : ∀ n t, lpNorm (S n t) 2 μ ≤ K) :
    TendstoUniformly (fun n t => (∫ x, ‖P n t x (R n t x)‖ ^ 2 ∂μ) -
      ∫ x, ‖Q n t x (S n t x)‖ ^ 2 ∂μ) (fun _ => 0) atTop := by
  let error := fun n => B * ε n + η n * K
  have hError : Tendsto error atTop (𝓝 0) := by
    simpa only [mul_zero, zero_mul, add_zero] using
      (hεLim.const_mul B).add (hηLim.mul_const K)
  have hUpper : Tendsto (fun n => (2 * (B * K) + error n) * error n) atTop (𝓝 0) := by
    simpa only [add_zero, mul_zero] using ((tendsto_const_nhds (x := 2 * (B * K))).add hError).mul hError
  rw [Metric.tendstoUniformly_iff]
  intro δ hδ
  filter_upwards [(Metric.tendsto_nhds.mp hUpper) δ hδ] with n hn t
  have hBound := spliceEnergyDifference_le hB (hη n) (hR n t) (hS n t) (hPR n t) (hQS n t)
    (hP n t) (hQ n t) (hProjector n t) (hCurvature n t) (hSize n t)
  simp only [Real.dist_eq, sub_zero, zero_sub, abs_neg] at hn ⊢
  exact hBound.trans_lt ((le_abs_self _).trans_lt hn)

end Measured

section ProjectionWeights

variable {C F : Type*} [NormedAddCommGroup C] [NormedSpace ℝ C]
  [NormedAddCommGroup F] [NormedSpace ℝ F]

/-- Bounds on the unweighted operators and on the volume Jacobians give
the operator bounds for square-root-weighted chiral coefficients. -/
theorem weightedSpliceProjector_bounds (P Q : C →L[ℝ] F) {a b B V η δ : ℝ}
    (ha : 0 ≤ a) (hb : 0 ≤ b) (hV : 0 ≤ V)
    (hVa : Real.sqrt a ≤ V) (hVb : Real.sqrt b ≤ V)
    (hP : ‖P‖ ≤ B) (hQ : ‖Q‖ ≤ B) (hDiff : ‖P - Q‖ ≤ η) (hWeight : |a - b| ≤ δ) :
    ‖Real.sqrt a • P‖ ≤ V * B ∧ ‖Real.sqrt b • Q‖ ≤ V * B ∧
      ‖Real.sqrt a • P - Real.sqrt b • Q‖ ≤ V * η + B * Real.sqrt δ := by
  have hRootSq : (Real.sqrt a - Real.sqrt b) ^ 2 ≤ |a - b| := by
    by_cases h : b ≤ a
    · rw [abs_of_nonneg (sub_nonneg.mpr h)]
      nlinarith only [Real.sq_sqrt ha, Real.sq_sqrt hb,
        mul_nonneg (Real.sqrt_nonneg b) (sub_nonneg.mpr (Real.sqrt_le_sqrt h))]
    · have h' : a ≤ b := le_of_not_ge h
      rw [abs_of_nonpos (sub_nonpos.mpr h')]
      nlinarith only [Real.sq_sqrt ha, Real.sq_sqrt hb,
        mul_nonneg (Real.sqrt_nonneg a) (sub_nonneg.mpr (Real.sqrt_le_sqrt h'))]
  have hRoot : |Real.sqrt a - Real.sqrt b| ≤ Real.sqrt δ := by
    apply (sq_le_sq₀ (abs_nonneg _) (Real.sqrt_nonneg _)).mp
    rw [sq_abs, Real.sq_sqrt ((abs_nonneg _).trans hWeight)]
    exact hRootSq.trans hWeight
  have hNorm (A : C →L[ℝ] F) (j : ℝ) : ‖Real.sqrt j • A‖ = Real.sqrt j * ‖A‖ := by
    rw [norm_smul, Real.norm_of_nonneg (Real.sqrt_nonneg _)]
  refine ⟨?_, ?_, ?_⟩
  · rw [hNorm]
    exact mul_le_mul hVa hP (norm_nonneg _) hV
  · rw [hNorm]
    exact mul_le_mul hVb hQ (norm_nonneg _) hV
  · have hSplit : Real.sqrt a • P - Real.sqrt b • Q =
        Real.sqrt a • (P - Q) + (Real.sqrt a - Real.sqrt b) • Q := by
      rw [smul_sub, sub_smul]
      abel
    rw [hSplit]
    apply (norm_add_le _ _).trans
    rw [hNorm, norm_smul, Real.norm_eq_abs, mul_comm B]
    exact add_le_add (mul_le_mul hVa hDiff (norm_nonneg _) hV)
      (mul_le_mul hRoot hQ (norm_nonneg _) (Real.sqrt_nonneg _))

end ProjectionWeights

section Geometric

open DifferentialGeometry DifferentialGeometry.Integral.Measure SectionsAndConnections
open scoped ContDiff Manifold

variable {E H M C T : Type*}
  [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M] [SigmaCompactSpace M]
  [NormedAddCommGroup C] [NormedSpace ℝ C]

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

/-- Identify a chiral matrix with its nine Euclidean coefficients. -/
def chiralEuclideanCoefficients (W : Matrix (Fin 3) (Fin 3) ℝ) :
    EuclideanSpace ℝ (Fin 3 × Fin 3) := WithLp.toLp 2 (fun p => W p.1 p.2)

theorem chiralEuclideanCoefficients_norm_sq (W : Matrix (Fin 3) (Fin 3) ℝ) :
    ‖chiralEuclideanCoefficients W‖ ^ 2 = hilbertSchmidtSq W := by
  rw [EuclideanSpace.norm_sq_eq]
  simp only [chiralEuclideanCoefficients, WithLp.ofLp_toLp, Real.norm_eq_abs, sq_abs,
    hilbertSchmidtSq, Fintype.sum_prod_type]

private def unpackFramedCurvature (R : EuclideanSpace ℝ ((Fin 4 × Fin 4) × (Fin 4 × Fin 4))) :
    CurvatureFrameTensor :=
  fun a b c d => R ((a, b), (c, d))

private theorem compress_add (A B : CurvatureFrameTensor) :
    selfDualCurvatureBlock (A + B) = selfDualCurvatureBlock A + selfDualCurvatureBlock B := by
  ext i j
  change selfDualCurvatureBlock (A + B) i j =
    selfDualCurvatureBlock A i j + selfDualCurvatureBlock B i j
  simp only [selfDualCurvatureBlock, Pi.add_apply]
  ring

private theorem compress_smul (c : ℝ) (A : CurvatureFrameTensor) :
    selfDualCurvatureBlock (c • A) = c • selfDualCurvatureBlock A := by
  ext i j
  change selfDualCurvatureBlock (c • A) i j = c * selfDualCurvatureBlock A i j
  simp only [selfDualCurvatureBlock, Pi.smul_apply, smul_eq_mul]
  ring

private theorem removeTrace_add (A B : Matrix (Fin 3) (Fin 3) ℝ) :
    traceFreeChiralBlock (A + B) = traceFreeChiralBlock A + traceFreeChiralBlock B := by
  simp only [traceFreeChiralBlock, Matrix.trace_add, add_div, add_smul]
  abel

private theorem removeTrace_smul (c : ℝ) (A : Matrix (Fin 3) (Fin 3) ℝ) :
    traceFreeChiralBlock (c • A) = c • traceFreeChiralBlock A := by
  simp only [traceFreeChiralBlock, Matrix.trace_smul, smul_eq_mul, smul_sub]
  rw [mul_div_assoc, mul_smul]

/-- The actual positive chiral compression, after the curvature slots have
been evaluated in one oriented orthonormal frame. -/
noncomputable def framedChiralCompression :
    EuclideanSpace ℝ ((Fin 4 × Fin 4) × (Fin 4 × Fin 4)) →L[ℝ] EuclideanSpace ℝ (Fin 3 × Fin 3) :=
  LinearMap.toContinuousLinearMap
    { toFun := fun R => chiralEuclideanCoefficients (traceFreeSelfDualBlock (unpackFramedCurvature R))
      map_add' := by
        intro R S
        have h : unpackFramedCurvature (R + S) = unpackFramedCurvature R + unpackFramedCurvature S := rfl
        rw [h, traceFreeSelfDualBlock, compress_add, removeTrace_add]
        rfl
      map_smul' := by
        intro c R
        have h : unpackFramedCurvature (c • R) = c • unpackFramedCurvature R := rfl
        rw [h, traceFreeSelfDualBlock, compress_smul, removeTrace_smul]
        rfl }

theorem norm_framedChiralCompression_le_one : ‖framedChiralCompression‖ ≤ 1 := by
  refine ContinuousLinearMap.opNorm_le_bound _ zero_le_one fun R => ?_
  rw [one_mul]
  apply (sq_le_sq₀ (norm_nonneg _) (norm_nonneg _)).mp
  change ‖chiralEuclideanCoefficients (traceFreeSelfDualBlock (unpackFramedCurvature R))‖ ^ 2 ≤ _
  rw [chiralEuclideanCoefficients_norm_sq]
  calc
    _ ≤ frameTensorNormSq (unpackFramedCurvature R) :=
      hilbertSchmidtSq_traceFreeSelfDualBlock_le_frameTensorNormSq _
    _ = ‖R‖ ^ 2 := by
      rw [EuclideanSpace.real_norm_sq_eq]
      simp only [unpackFramedCurvature, frameTensorNormSq, Fintype.sum_prod_type]

omit [T2Space M] [SigmaCompactSpace M] in
/-- Compressing the ordered Levi-Civita curvature slots gives the existing
geometric block in the same oriented orthonormal frame. -/
theorem framedChiralCompression_metricCurvature (o : ManifoldOrientation I M 4)
    (g : SmoothRiemannianMetric I M) (x : M) (frame : OrientedOrthonormalFrameAt g o x) :
    framedChiralCompression (WithLp.toLp 2 (fun p =>
      metricCurvatureFrameTensor g o x frame p.1.1 p.1.2 p.2.1 p.2.2)) =
      chiralEuclideanCoefficients (geometricChiralBlock g o x frame) := rfl

/-- The exact physical energy of the actual moving positive Weyl block has
the uniform comparison. The frame evaluation of the weighted linear map
is specified on the curvature of the moving metric, and the measure is the
actual volume of one fixed smooth reference metric. -/
theorem tendstoUniformly_geometricSpliceEnergy
    (o : ManifoldOrientation I M 4) (q : SmoothRiemannianMetric I M)
    (g : ℕ → T → SmoothRiemannianMetric I M)
    (frames : ∀ n t x, OrientedOrthonormalFrameAt (g n t) o x)
    {U : Set M} (hU : MeasurableSet U)
    {R S : ℕ → T → M → C}
    {P Q : ℕ → T → M → C →L[ℝ] EuclideanSpace ℝ (Fin 3 × Fin 3)}
    {B K : ℝ} {ε η : ℕ → ℝ} (hB : 0 ≤ B) (hη : ∀ n, 0 ≤ η n)
    (hεLim : Tendsto ε atTop (𝓝 0)) (hηLim : Tendsto η atTop (𝓝 0)) :
    let μ := (riemannianVolumeMeasure I M q).restrict U
    let W := fun n t x => geometricChiralBlock (g n t) o x (frames n t x)
    (∀ n t, MemLp (R n t) 2 μ) → (∀ n t, MemLp (S n t) 2 μ) →
    (∀ n t, AEStronglyMeasurable (fun x => P n t x (R n t x)) μ) →
    (∀ n t, AEStronglyMeasurable (fun x => Q n t x (S n t x)) μ) →
    (∀ n t, ∀ᵐ x ∂μ, ‖P n t x‖ ≤ B) → (∀ n t, ∀ᵐ x ∂μ, ‖Q n t x‖ ≤ B) →
    (∀ n t, ∀ᵐ x ∂μ, ‖P n t x - Q n t x‖ ≤ η n) →
    (∀ n t, lpNorm (R n t - S n t) 2 μ ≤ ε n) →
    (∀ n t, lpNorm (S n t) 2 μ ≤ K) →
    (∀ n t, ∀ᵐ x ∂μ, P n t x (R n t x) =
      Real.sqrt (riemannianVolumeDensity q (g n t) x) • chiralEuclideanCoefficients (W n t x)) →
    TendstoUniformly (fun n t =>
      (∫ x in U, hilbertSchmidtSq (W n t x) ∂riemannianVolumeMeasure I M (g n t)) -
        ∫ x, ‖Q n t x (S n t x)‖ ^ 2 ∂μ) (fun _ => 0) atTop := by
  intro μ W hR hS hPR hQS hP hQ hProjector hCurvature hSize hActual
  have hEnergy (n : ℕ) (t : T) :
      (∫ x in U, hilbertSchmidtSq (W n t x) ∂riemannianVolumeMeasure I M (g n t)) =
        ∫ x, ‖P n t x (R n t x)‖ ^ 2 ∂μ := by
    rw [chiralIntegral_eq_referenceDensity q (g n t) hU (W n t)]
    apply integral_congr_ae
    filter_upwards [hActual n t] with x hx
    rw [hx, norm_smul, Real.norm_of_nonneg (Real.sqrt_nonneg _), mul_pow,
      Real.sq_sqrt (riemannianVolumeDensity_pos q (g n t) x).le,
      chiralEuclideanCoefficients_norm_sq]
    rfl
  simp_rw [hEnergy]
  exact tendstoUniformly_spliceEnergyDifference hB hη hεLim hηLim hR hS hPR hQS
    hP hQ hProjector hCurvature hSize

end Geometric

end SmoothPoincare
