import SmoothPoincare.Variational.BourMarkedEnd
import SmoothPoincare.Variational.BourMarkedCore
import DifferentialGeometry.Geometry.Operator.Hessian.Basic
import DifferentialGeometry.Geometry.Operator.Scalar.Calculus

/-!
# Euler boundary stability for a nonflat ALE link

26 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance.
Actual serving model and effort are unavailable. The boundary convention is
outward-normal-first, with the round Euclidean sphere having positive shape.
The bounds below use the shape and curvature of the metric at unit scale.
-/

open DifferentialGeometry DifferentialGeometry.Geometry.Operator
  Filter FirstOrderTwistor MeasureTheory Metric Set
open scoped BigOperators ContDiff ENNReal Manifold Topology

noncomputable section

namespace SmoothPoincare

/-- In an outward-adapted orthonormal frame, the Euler boundary scalar in
the (8\pi^2\chi) convention. The curvature matrix is the ambient tangential
curvature operator in the cyclic wedge basis ((e_1∧e_2,e_2∧e_0,e_0∧e_1)).
Its sectional entries are positive on a round four-sphere. -/
def bourEulerBoundaryDensity (shape curvature : Matrix (Fin 3) (Fin 3) ℝ) : ℝ :=
  4 * shape.det + 2 * ∑ i : Fin 3, ∑ j : Fin 3, shape i j * curvature i j

private theorem abs_sub_triple_product_le {a b c A B C ε : ℝ}
    (ha : |a - A| ≤ ε) (hb : |b - B| ≤ ε) (hc : |c - C| ≤ ε)
    (hA : |A| ≤ 1) (hB : |B| ≤ 1) (hb' : |b| ≤ 2) (hc' : |c| ≤ 2)
    (hε : 0 ≤ ε) :
    |a * b * c - A * B * C| ≤ 7 * ε := by
  have h₁ : |(a - A) * b * c| ≤ ε * 2 * 2 := by
    simp only [abs_mul]
    gcongr
  have h₂ : |A * (b - B) * c| ≤ 1 * ε * 2 := by
    simp only [abs_mul]
    gcongr
  have h₃ : |A * B * (c - C)| ≤ 1 * 1 * ε := by
    simp only [abs_mul]
    gcongr
  rw [show a * b * c - A * B * C =
    ((a - A) * b * c + A * (b - B) * c) + A * B * (c - C) by ring]
  have h₄ := abs_add_le ((a - A) * b * c + A * (b - B) * c) (A * B * (c - C))
  have h₅ := abs_add_le ((a - A) * b * c) (A * (b - B) * c)
  linarith only [h₁, h₂, h₃, h₄, h₅]

private theorem abs_one_matrix_apply_le (i j : Fin 3) :
    |(1 : Matrix (Fin 3) (Fin 3) ℝ) i j| ≤ 1 := by
  by_cases h : i = j <;> simp [Matrix.one_apply, h]

private theorem abs_matrix_apply_le_two {shape : Matrix (Fin 3) (Fin 3) ℝ}
    {ε : ℝ} (hε : ε ≤ 1)
    (hShape : ∀ i j, |shape i j - (1 : Matrix (Fin 3) (Fin 3) ℝ) i j| ≤ ε)
    (i j : Fin 3) : |shape i j| ≤ 2 := by
  have h := abs_add_le (shape i j - (1 : Matrix (Fin 3) (Fin 3) ℝ) i j)
    ((1 : Matrix (Fin 3) (Fin 3) ℝ) i j)
  rw [sub_add_cancel] at h
  linarith only [h, hShape i j, abs_one_matrix_apply_le i j, hε]

private theorem abs_det_sub_one_le {shape : Matrix (Fin 3) (Fin 3) ℝ} {ε : ℝ}
    (hε : 0 ≤ ε) (hε' : ε ≤ 1)
    (hShape : ∀ i j, |shape i j - (1 : Matrix (Fin 3) (Fin 3) ℝ) i j| ≤ ε) :
    |shape.det - 1| ≤ 42 * ε := by
  classical
  let unit : Matrix (Fin 3) (Fin 3) ℝ := 1
  have hTerm (σ : Equiv.Perm (Fin 3)) :
      |(∏ i, shape (σ i) i) - ∏ i, unit (σ i) i| ≤ 7 * ε := by
    simp only [Fin.prod_univ_three]
    exact abs_sub_triple_product_le (hShape _ _) (hShape _ _) (hShape _ _)
      (abs_one_matrix_apply_le _ _) (abs_one_matrix_apply_le _ _)
      (abs_matrix_apply_le_two hε' hShape _ _) (abs_matrix_apply_le_two hε' hShape _ _) hε
  rw [← Matrix.det_one (n := Fin 3) (R := ℝ)]
  change |shape.det - unit.det| ≤ _
  simp only [Matrix.det_apply', ← Finset.sum_sub_distrib, ← mul_sub]
  apply (Finset.abs_sum_le_sum_abs _ _).trans
  calc
    (∑ σ : Equiv.Perm (Fin 3), |(↑↑(Equiv.Perm.sign σ) : ℝ) *
        ((∏ i, shape (σ i) i) - ∏ i, unit (σ i) i)|) ≤ ∑ _ : Equiv.Perm (Fin 3), 7 * ε := by
      apply Finset.sum_le_sum
      intro σ _
      rw [abs_mul]
      have hSign : |(↑↑(Equiv.Perm.sign σ) : ℝ)| = 1 := by
        rcases Int.units_eq_one_or (Equiv.Perm.sign σ) with h | h <;> simp [h]
      rw [hSign, one_mul]
      exact hTerm σ
    _ = 42 * ε := by norm_num [Fintype.card_perm]; ring

/-- The nonflat curvature term vanishes to first order with the ambient
curvature. The cubic term is stable under perturbation of the shape. -/
theorem bourEulerBoundaryDensity_error {shape curvature : Matrix (Fin 3) (Fin 3) ℝ}
    {ε : ℝ} (hε : 0 ≤ ε) (hε' : ε ≤ 1)
    (hShape : ∀ i j, |shape i j - (1 : Matrix (Fin 3) (Fin 3) ℝ) i j| ≤ ε)
    (hCurvature : ∀ i j, |curvature i j| ≤ ε) :
    |bourEulerBoundaryDensity shape curvature - 4| ≤ 204 * ε := by
  have hProd (i j) : |shape i j * curvature i j| ≤ 2 * ε := by
    rw [abs_mul]
    exact mul_le_mul (abs_matrix_apply_le_two hε' hShape i j) (hCurvature i j)
      (abs_nonneg _) (by norm_num)
  have hRow (i) : |∑ j : Fin 3, shape i j * curvature i j| ≤ 3 * (2 * ε) := by
    apply (Finset.abs_sum_le_sum_abs _ _).trans
    simpa using (Finset.sum_le_sum fun j (_ : j ∈ (Finset.univ : Finset (Fin 3))) =>
      hProd i j)
  have hSum : |∑ i : Fin 3, ∑ j : Fin 3, shape i j * curvature i j| ≤ 18 * ε := by
    apply (Finset.abs_sum_le_sum_abs _ _).trans
    calc
      _ ≤ ∑ _i : Fin 3, 3 * (2 * ε) := Finset.sum_le_sum fun i _ => hRow i
      _ = 18 * ε := by simp; ring
  unfold bourEulerBoundaryDensity
  rw [show 4 * shape.det + 2 * (∑ i, ∑ j, shape i j * curvature i j) - 4 =
    4 * (shape.det - 1) + 2 * (∑ i, ∑ j, shape i j * curvature i j) by ring]
  apply (abs_add_le _ _).trans
  rw [abs_mul, abs_mul]
  norm_num only [abs_of_nonneg (by norm_num : (0 : ℝ) ≤ 4),
    abs_of_nonneg (by norm_num : (0 : ℝ) ≤ 2)]
  linarith only [abs_det_sub_one_le hε hε' hShape, hSum]

/-- The link's induced area relative to round area supplies a third error.
The estimate includes the cubic, mixed curvature and area terms. -/
theorem bourEulerBoundaryDensity_withArea_error
    {shape curvature : Matrix (Fin 3) (Fin 3) ℝ} {J ε : ℝ}
    (hε : 0 ≤ ε) (hε' : ε ≤ 1)
    (hShape : ∀ i j, |shape i j - (1 : Matrix (Fin 3) (Fin 3) ℝ) i j| ≤ ε)
    (hCurvature : ∀ i j, |curvature i j| ≤ ε) (hArea : |J - 1| ≤ ε) :
    |J * bourEulerBoundaryDensity shape curvature - 4| ≤ 412 * ε := by
  have hJ : |J| ≤ 2 := by
    have h := abs_add_le (J - 1) (1 : ℝ)
    rw [sub_add_cancel, abs_one] at h
    linarith only [h, hArea, hε']
  rw [show J * bourEulerBoundaryDensity shape curvature - 4 =
    J * (bourEulerBoundaryDensity shape curvature - 4) + 4 * (J - 1) by ring]
  apply (abs_add_le _ _).trans
  rw [abs_mul, abs_mul, abs_of_nonneg (by norm_num : (0 : ℝ) ≤ 4)]
  calc
    _ ≤ 2 * (204 * ε) + 4 * ε := by
      gcongr
      exact bourEulerBoundaryDensity_error hε hε' hShape hCurvature
    _ = 412 * ε := by ring


section Geometric

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [FiniteDimensional ℝ E] [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]

/-- The shape coefficients on a regular level of the radial function.
For this interpretation the supplied oriented metric frame has outward unit
normal in slot zero and the three tangent vectors in slots one through three. -/
def bourLevelShapeMatrix [NeZero (Module.finrank ℝ E)]
    (g : SmoothRiemannianMetric I M) (radius : M → ℝ) (x : M)
    (o : ManifoldOrientation I M 4) (frame : OrientedOrthonormalFrameAt g o x) :
    Matrix (Fin 3) (Fin 3) ℝ :=
  let grad := gradientFun g radius x
  fun i j => hessFun g radius x (frame.basis i.succ) (frame.basis j.succ) /
    Real.sqrt (g.inner x grad grad)

/-- Ambient curvature restricted to the three cyclic tangent wedges of the
supplied outward-adapted frame. The underlying four-slot convention has
positive sectional curvature on a round sphere. -/
def bourTangentialCurvatureMatrix
    (g : SmoothRiemannianMetric I M) (x : M)
    (o : ManifoldOrientation I M 4) (frame : OrientedOrthonormalFrameAt g o x) :
    Matrix (Fin 3) (Fin 3) ℝ :=
  fun i j => metricCurvatureFrameTensor g o x frame
    (i + 1).succ (i + 2).succ (j + 1).succ (j + 2).succ

end Geometric

/-- The integrated Euler error on a fixed link with finite round measure,
using the ratio of the induced boundary area to round area. -/
theorem bourEulerBoundaryIntegral_error {L : Type*} [MeasurableSpace L]
    (μ : Measure L) [IsFiniteMeasure μ]
    (shape curvature : L → Matrix (Fin 3) (Fin 3) ℝ) (J : L → ℝ) {ε : ℝ}
    (hε : 0 ≤ ε) (hε' : ε ≤ 1)
    (hShape : ∀ᵐ x ∂μ, ∀ i j,
      |shape x i j - (1 : Matrix (Fin 3) (Fin 3) ℝ) i j| ≤ ε)
    (hCurvature : ∀ᵐ x ∂μ, ∀ i j, |curvature x i j| ≤ ε)
    (hArea : ∀ᵐ x ∂μ, |J x - 1| ≤ ε)
    (hIntegrable : Integrable (fun x => J x * bourEulerBoundaryDensity (shape x) (curvature x)) μ) :
    |(∫ x, J x * bourEulerBoundaryDensity (shape x) (curvature x) ∂μ) - 4 * μ.real univ| ≤
      412 * ε * μ.real univ := by
  have hNorm : ∀ᵐ x ∂μ, ‖J x * bourEulerBoundaryDensity (shape x) (curvature x) - 4‖ ≤ 412 * ε := by
    filter_upwards [hShape, hCurvature, hArea] with x hS hK hJ
    simpa only [Real.norm_eq_abs] using bourEulerBoundaryDensity_withArea_error hε hε' hS hK hJ
  have hIntegral := norm_integral_le_of_norm_le_const hNorm
  rw [integral_sub hIntegrable (integrable_const 4), integral_const, smul_eq_mul, mul_comm (μ.real univ) 4,
    Real.norm_eq_abs] at hIntegral
  exact hIntegral

section Quotient

open DifferentialGeometry.Geometry.Riemannian.VolumeComparison

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "S₃" => sphere (0 : E₄) 1

/-- The round quotient measure is identified by the actual map from the unit
sphere and its degree. This consumes the finite-cover measure identity. -/
theorem bourRoundLinkArea_of_cover {L : Type*} [MeasurableSpace L]
    (μ : Measure L) [IsFiniteMeasure μ] (q : S₃ → L) (hq : Measurable q)
    {degree : ℕ} (hDegree : 0 < degree)
    (hCover : Measure.map q ((volume : Measure E₄).toSphere) = (degree : ℝ≥0∞) • μ) :
    μ.real univ = 2 * Real.pi ^ 2 / degree := by
  have hArea := congrArg (fun ν : Measure L => (ν univ).toReal) hCover
  change ((Measure.map q ((volume : Measure E₄).toSphere)) univ).toReal =
    (((degree : ℝ≥0∞) • μ) univ).toReal at hArea
  rw [Measure.map_apply hq MeasurableSet.univ, preimage_univ, Measure.smul_apply,
    smul_eq_mul, ENNReal.toReal_mul, ENNReal.toReal_natCast] at hArea
  change ((volume : Measure E₄).toSphere).real univ = (degree : ℝ) * μ.real univ at hArea
  rw [bourEuclideanUnitLinkArea] at hArea
  exact (eq_div_iff (by exact_mod_cast hDegree.ne')).mpr (by linarith only [hArea])

/-- The nonflat Euler boundary integral tends to (8\pi^2/|Γ|). The errors
are uniform on the link and are supplied for the shape, the ambient curvature
and the ratio of the induced area, after rescaling the link to unit radius. -/
theorem bourALEBoundaryIntegral_tendsto {L : Type*} [MeasurableSpace L]
    (μ : Measure L) [IsFiniteMeasure μ] (q : S₃ → L) (hq : Measurable q)
    {degree : ℕ} (hDegree : 0 < degree)
    (hCover : Measure.map q ((volume : Measure E₄).toSphere) = (degree : ℝ≥0∞) • μ)
    (shape curvature : ℝ → L → Matrix (Fin 3) (Fin 3) ℝ) (J : ℝ → L → ℝ)
    (error : ℝ → ℝ) (hError : Tendsto error atTop (𝓝 0))
    (hBound : ∀ᶠ r in atTop,
      0 ≤ error r ∧ error r ≤ 1 ∧
      (∀ᵐ x ∂μ, ∀ i j, |shape r x i j - (1 : Matrix (Fin 3) (Fin 3) ℝ) i j| ≤ error r) ∧
      (∀ᵐ x ∂μ, ∀ i j, |curvature r x i j| ≤ error r) ∧
      (∀ᵐ x ∂μ, |J r x - 1| ≤ error r) ∧
      Integrable (fun x => J r x * bourEulerBoundaryDensity (shape r x) (curvature r x)) μ) :
    Tendsto (fun r => ∫ x, J r x * bourEulerBoundaryDensity (shape r x) (curvature r x) ∂μ)
      atTop (𝓝 (8 * Real.pi ^ 2 / degree)) := by
  have hArea : 4 * μ.real univ = 8 * Real.pi ^ 2 / degree := by
    rw [bourRoundLinkArea_of_cover μ q hq hDegree hCover]
    ring
  rw [← hArea, tendsto_iff_dist_tendsto_zero]
  have hLimit : Tendsto (fun r => 412 * error r * μ.real univ) atTop (𝓝 0) := by
    simpa using (hError.const_mul 412).mul_const (μ.real univ)
  refine squeeze_zero' (Eventually.of_forall fun _ => dist_nonneg) ?_ hLimit
  filter_upwards [hBound] with r hr
  rw [Real.dist_eq]
  exact bourEulerBoundaryIntegral_error μ (shape r) (curvature r) (J r)
    hr.1 hr.2.1 hr.2.2.1 hr.2.2.2.1 hr.2.2.2.2.1 hr.2.2.2.2.2


/-- Use the actual metric Hessian and ambient Riemann tensor along a
parametrized link. The geometry supplies the outward-adapted frames, the
area ratio and the uniform normalized ALE bounds. -/
theorem bourALELevelBoundary_tendsto {E H M L : Type*}
    [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    [NeZero (Module.finrank ℝ E)] [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
    [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [MeasurableSpace L]
    (μ : Measure L) [IsFiniteMeasure μ] (q : S₃ → L) (hq : Measurable q)
    {degree : ℕ} (hDegree : 0 < degree)
    (hCover : Measure.map q ((volume : Measure E₄).toSphere) = (degree : ℝ≥0∞) • μ)
    (g : ℝ → SmoothRiemannianMetric I M) (radius : M → ℝ) (o : ManifoldOrientation I M 4)
    (link : ℝ → L → M)
    (frame : ∀ r x, OrientedOrthonormalFrameAt (g r) o (link r x))
    (J : ℝ → L → ℝ) (error : ℝ → ℝ) (hError : Tendsto error atTop (𝓝 0)) :
    let shape := fun r x => bourLevelShapeMatrix (g r) radius (link r x) o (frame r x)
    let curvature := fun r x => bourTangentialCurvatureMatrix (g r) (link r x) o (frame r x)
    (∀ᶠ r in atTop,
      0 ≤ error r ∧ error r ≤ 1 ∧
      (∀ᵐ x ∂μ, ∀ i j, |shape r x i j - (1 : Matrix (Fin 3) (Fin 3) ℝ) i j| ≤ error r) ∧
      (∀ᵐ x ∂μ, ∀ i j, |curvature r x i j| ≤ error r) ∧
      (∀ᵐ x ∂μ, |J r x - 1| ≤ error r) ∧
      Integrable (fun x => J r x * bourEulerBoundaryDensity (shape r x) (curvature r x)) μ) →
    Tendsto (fun r => ∫ x, J r x * bourEulerBoundaryDensity (shape r x) (curvature r x) ∂μ)
      atTop (𝓝 (8 * Real.pi ^ 2 / degree)) := by
  intro shape curvature hBound
  exact bourALEBoundaryIntegral_tendsto μ q hq hDegree hCover shape curvature J error hError hBound

end Quotient

/-- Exhausting the compact scalar-flat Euler formulas transfers the boundary
contributions for all finitely many end links at once. -/
theorem bourExhaustedEulerIdentity {k : ℕ} (degree : Fin k → ℕ)
    (plusMass minusMass ricciMass : ℝ → ℝ) (boundary : Fin k → ℝ → ℝ)
    {ePlus eMinus d χ : ℝ}
    (hPlus : Tendsto plusMass atTop (𝓝 ePlus)) (hMinus : Tendsto minusMass atTop (𝓝 eMinus))
    (hRicci : Tendsto ricciMass atTop (𝓝 d))
    (hBoundary : ∀ b, Tendsto (boundary b) atTop (𝓝 (8 * Real.pi ^ 2 / degree b)))
    (hEuler : ∀ᶠ r in atTop,
      plusMass r + minusMass r - ricciMass r / 2 + ∑ b, boundary b r = 8 * Real.pi ^ 2 * χ) :
    ePlus + eMinus - d / 2 + ∑ b, 8 * Real.pi ^ 2 / degree b = 8 * Real.pi ^ 2 * χ := by
  have hSum := tendsto_finsetSum Finset.univ (fun b _ => hBoundary b)
  have hLimit := ((hPlus.add hMinus).sub (hRicci.div_const 2)).add hSum
  have hConstant := tendsto_const_nhds (x := 8 * Real.pi ^ 2 * χ)
    (f := (atTop : Filter ℝ))
  exact tendsto_nhds_unique hLimit (hConstant.congr' (hEuler.mono fun _ h => h.symm))

/-- Specialize the exhaustion to spherical links and to the Euler
characteristic supplied by the compact marked core. -/
theorem bourOneEuclideanEnd_of_boundaryLimits {k : ℕ} (hk : 0 < k)
    (plusMass minusMass ricciMass : ℝ → ℝ) (boundary : Fin k → ℝ → ℝ)
    {ePlus eMinus d dMax : ℝ}
    (hPlus : Tendsto plusMass atTop (𝓝 ePlus)) (hMinus : Tendsto minusMass atTop (𝓝 eMinus))
    (hRicci : Tendsto ricciMass atTop (𝓝 d))
    (hBoundary : ∀ b, Tendsto (boundary b) atTop (𝓝 (8 * Real.pi ^ 2)))
    (hEuler : ∀ᶠ r in atTop,
      plusMass r + minusMass r - ricciMass r / 2 + ∑ b, boundary b r =
        8 * Real.pi ^ 2 * (2 - (k : ℝ)))
    (hPlusNonneg : 0 ≤ ePlus) (hMinusNonneg : 0 ≤ eMinus)
    (hD : d ≤ dMax) (hMax : dMax < 32 * Real.pi ^ 2) :
    k = 1 ∧ ePlus + eMinus - d / 2 = 0 := by
  have h := bourExhaustedEulerIdentity (fun _ => 1) plusMass minusMass ricciMass boundary
    hPlus hMinus hRicci (fun b => by simpa using hBoundary b) hEuler
  simp only [Nat.cast_one, div_one, Finset.sum_const, Finset.card_univ, Fintype.card_fin,
    nsmul_eq_mul] at h
  have hBalance : ePlus + eMinus - d / 2 = 8 * Real.pi ^ 2 * (2 - 2 * (k : ℝ)) := by
    calc
      ePlus + eMinus - d / 2 = 8 * Real.pi ^ 2 * (2 - (k : ℝ)) - (k : ℝ) * (8 * Real.pi ^ 2) := by
        linarith only [h]
      _ = _ := by ring
  have hOne := bourOneEuclideanEnd hk hPlusNonneg hMinusNonneg hBalance hD hMax
  exact ⟨hOne, by simpa [hOne] using hBalance⟩

end SmoothPoincare
