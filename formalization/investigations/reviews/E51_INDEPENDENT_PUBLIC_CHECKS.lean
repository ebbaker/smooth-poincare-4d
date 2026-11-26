import SmoothPoincare

/-! E51 independent applications for Edward B. Baker III, 26 November 2026.
OpenAI Codex assistance. Actual serving model and reasoning effort were unavailable. -/

set_option autoImplicit false

open Bundle DifferentialGeometry DifferentialGeometry.Geometry.Connection
  DifferentialGeometry.Geometry.Curvature DifferentialGeometry.Geometry.Operator
  DifferentialGeometry.Integral.Measure DifferentialGeometry.PDE.RicciFlow
  DifferentialGeometry.Tensor.Coordinates DifferentialGeometry.Tensor0SBundle
  Filter FirstOrderTwistor MeasureTheory Metric Set SmoothPoincare SmoothPoincare.Bour
open scoped BigOperators ContDiff ENNReal InnerProductSpace Laplacian Manifold NNReal Topology

namespace E51Readback

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "J₄" => Fin (Module.finrank ℝ E₄)

section Flat

-- At b = 6, a frozen constant of two and a quarter-sized coefficient
-- error yield the exact absorbed constant of four on the same full Hessian.
example (a : E₄ → Matrix J₄ J₄ ℝ) (a₀ : Matrix J₄ J₄ ℝ)
    (hFlat : BourFlatHessianEstimate (volume : Measure E₄) 6 a₀ 2)
    (u : E₄ → ℝ) (hSmooth : ContDiff ℝ ∞ u) (hSupport : HasCompactSupport u)
    (hOsc : ∀ᵐ z ∂(volume : Measure E₄), iteratedFDeriv ℝ 2 u z ≠ 0 →
      ∑ i : J₄, ∑ j : J₄, ‖a z i j - a₀ i j‖ * ‖chartModelBasis E₄ i‖ *
        ‖chartModelBasis E₄ j‖ ≤ 1 / 4)
    (hM : AEStronglyMeasurable (fun z => bourFlatOperator (a z) u z) volume) :
    eLpNorm (iteratedFDeriv ℝ 2 u) 6 volume ≤
      4 * eLpNorm (fun z => bourFlatOperator (a z) u z) 6 volume := by
  have hSmall : (2 : ℝ≥0∞) * ENNReal.ofReal (1 / 4) ≤ 1 / 2 := by
    calc
      _ = ENNReal.ofReal ((2 : ℝ) * (1 / 4)) := by rw [ENNReal.ofReal_mul (by norm_num)]; simp
      _ = ENNReal.ofReal (1 / 2) := by norm_num
      _ ≤ (1 / 2 : ℝ≥0∞) := by simp
  have h := bourFlatHessianEstimate_perturb (volume : Measure E₄) 6 (by norm_num) a a₀
    2 (by simpa using hFlat) u hSmooth hSupport (by simpa using hSmall) hOsc hM
  norm_num at h
  exact h

end Flat

section SquaredCutoff

-- An actual smooth cutoff controls a directional L⁶ norm on B(2).
-- On the outer ball B̄(3), take |u| ≤ 5 and |∂η| ≤ 2.
example (η u : E₄ → ℝ) (e : E₄) (hη : ContDiff ℝ 1 η)
    (hSupport : HasCompactSupport η)
    (hOne : ∀ x ∈ ball (0 : E₄) 2, η x = 1)
    (hOuter : tsupport η ⊆ closedBall (0 : E₄) 3)
    (hu : ∀ x ∈ tsupport η, ContDiffAt ℝ 2 u x)
    (hU : ∀ x ∈ tsupport η, |u x| ≤ 5)
    (hC : ∀ x ∈ tsupport η, |fderiv ℝ η x e| ≤ 2) :
    let v := fun x => fderiv ℝ u x e
    let w := fun x => fderiv ℝ v x e
    eLpNorm v 6 ((volume : Measure E₄).restrict (ball (0 : E₄) 2)) ≤
      ENNReal.ofReal (1 / 8) * eLpNorm (fun x => η x ^ 2 * w x) 6 volume +
      ENNReal.ofReal (880 * ((volume : Measure E₄).real (closedBall (0 : E₄) 3)) ^ (1 / 6 : ℝ)) := by
  have h := sixthPowerDirectional_eLpNorm_on_ball (volume : Measure E₄) η u e 0 hη hSupport
    hOne hOuter hu (ε := 1 / 8) (by norm_num) (by norm_num) (by norm_num) hU hC
  norm_num at h ⊢
  exact h

end SquaredCutoff

section MetricInterior

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H}
  [I.Boundaryless] [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]

-- A single Euclidean L⁶ estimate gives a common W²,⁶ bound before
-- choosing the physical metric, point and fixed harmonic patch.
example (A γ CΔ : ℝ≥0)
    (hLap : ∀ u : E₄ → ℝ, ContDiff ℝ ∞ u → HasCompactSupport u →
      eLpNorm (iteratedFDeriv ℝ 2 u) 6 (volume : Measure E₄) ≤
        (CΔ : ℝ≥0∞) * eLpNorm (Δ u) 6 volume) :
    ∃ C : ℝ≥0∞, C < ⊤ ∧
      ∀ (g : SmoothRiemannianMetric I M) (x : M) (b : BourHarmonicChart g x 2 A γ),
        b.chart.source = ball (0 : E₄) 4 →
        (∀ y : M, Real.sqrt (intrinsicCurvatureSq g y) ≤ 1) →
        ∃ G : SmoothRiemannianMetric (𝓘(ℝ, E₄)) E₄,
          (∀ z ∈ ball (0 : E₄) 3, ∀ v w : E₄, G.inner z v w = g.inner (b.chart z)
            (mfderiv (𝓘(ℝ, E₄)) I (b.chart : E₄ → M) z v)
            (mfderiv (𝓘(ℝ, E₄)) I (b.chart : E₄ → M) z w)) ∧
          ∀ i k : J₄,
            let u := chartGramOnE G 0 i k
            let μ := (volume : Measure E₄).restrict (ball (0 : E₄) (5 / 2))
            eLpNorm u 6 μ + eLpNorm (fderiv ℝ u) 6 μ +
              eLpNorm (iteratedFDeriv ℝ 2 u) 6 μ ≤ C := by
  obtain ⟨C, hC, hMetric⟩ := bourUniformHarmonicMetricW2_of_flatLaplacian (I := I) (M := M)
    (volume : Measure E₄) (p := 6) (by norm_num) (by norm_num) (r := 1) (L := 2) (K := 1)
    (by norm_num) (by norm_num) (by norm_num) A γ CΔ hLap
  refine ⟨C, hC, fun g x b hSource hCurvature => ?_⟩
  simpa only [mul_one] using hMetric g x b (by simpa only [mul_one] using hSource)
    (fun z _ => hCurvature (b.chart z))

end MetricInterior

section Ricci

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H}
  [I.Boundaryless] [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]

local notation "∂" => DifferentialGeometry.Tensor.Coordinates.partialDeriv

-- In a physical chart with inverse, first inverse jet and connection
-- entries bounded by one, the contracted second derivative bound is
-- 16(K+9). The harmonicity premise is a neighborhood equality.
example (g : SmoothRiemannianMetric I M) (p : M) {y : E₄}
    (hy : y ∈ interior (extChartAt I p).target) (i k : J₄)
    (hHarm : ∀ᶠ z in 𝓝 y, laplacian (LeviCivita g) g
      (bourChartCoordinate (I := I) p k) ((extChartAt I p).symm z) = 0)
    {K : ℝ}
    (hInv : ∀ a b : J₄, |chartInvGramOnE g p a b y| ≤ 1)
    (hGradInv : ∀ a b : J₄, |∂ i (chartInvGramOnE g p a b) y| ≤ 1)
    (hConn : ∀ a b c : J₄, |chartChristoffel g p a b c y| ≤ 1)
    (hCurv : ∀ a b c d : J₄, |chartRiemannTensor g p a b c d y| ≤ K) :
    |∑ a : J₄, ∑ b : J₄, chartInvGramOnE g p a b y * ∂ a (chartChristoffel g p b i k) y| ≤
      16 * (K + 9) := by
  have h := bourChartContractedChristoffelDerivative_bound g p hy i k hHarm
    (by norm_num) (by norm_num) (by norm_num) hInv hGradInv hConn hCurv
  have hd : Module.finrank ℝ E₄ = 4 := by simp
  convert h using 1
  rw [hd]
  push_cast
  ring

-- The normalized trace-free Ricci covariant slots remain exactly the
-- original tensor on a scale-four slice.
example (g : SmoothRiemannianMetric I M) (ha : 0 < (4 : ℝ)) (x : M) (u v : TangentSpace I x) :
    bourTraceFreeRicciField (scaleMetric 4 ha g) x (vec2 u v) =
      metricRicciAt g x (vec2 u v) - metricScalarAt g x / 4 * g.inner x u v := by
  rw [bourTraceFreeRicciField_scale g ha, bourTraceFreeRicciField_apply]

-- On a stationary constant-scalar slice at p = 1/2, the equation for the
-- actual trace-free tensor has its full geometric forcing.
example [BoundarylessManifold I M] (g : SmoothRiemannianMetric I M) (R : ℝ)
    (hR : ∀ x, metricScalarAt g x = R) (x : M)
    (hStationary : bourCovariantGradient (1 / 2) g x = 0) (u v : TangentSpace I x) :
    roughLap0SField g (bourTraceFreeRicciField g) x (vec2 u v) =
      -2 * hamiltonCurvatureRicciAt g x (vec2 u v) +
        (7 / 12) * R * metricRicciAt g x (vec2 u v) +
        bourBulkDensity (1 / 2) g x * g.inner x u v := by
  rw [bourStationary_roughTraceFreeRicci_eq (1 / 2) g R hR x hStationary u v]
  ring

-- On a four-dimensional harmonic chart, both Ricci tensor slots enter the
-- differentiated connection and first-derivative error. The latter keeps
-- its explicit coefficient, which is needed by shrinking-ball absorption.
example (g : SmoothRiemannianMetric I M) (p : M) {z : E₄}
    (hz : z ∈ interior (extChartAt I p).target)
    (hHarm : ∀ k : J₄, ∀ᶠ y in 𝓝 z, laplacian (LeviCivita g) g
      (bourChartCoordinate (I := I) p k) ((extChartAt I p).symm y) = 0)
    {K U V F : ℝ}
    (hInv : ∀ a b : J₄, |chartInvGramOnE g p a b z| ≤ 1)
    (hGradInv : ∀ i a b : J₄, |∂ i (chartInvGramOnE g p a b) z| ≤ 1)
    (hConn : ∀ a b c : J₄, |chartChristoffel g p a b c z| ≤ 1)
    (hCurv : ∀ a b c d : J₄, |chartRiemannTensor g p a b c d z| ≤ K)
    (hZ : ∀ i j : J₄, |bourChartTensorComponent (bourTraceFreeRicciField g) p ![i, j] z| ≤ U)
    (hDZ : ∀ a i j : J₄, |∂ a (bourChartTensorComponent (bourTraceFreeRicciField g) p ![i, j]) z| ≤ V)
    (i j : J₄)
    (hRough : |bourChartTensorComponent (roughLap0SField g (bourTraceFreeRicciField g)) p ![i, j] z| ≤ F) :
    |∑ a : J₄, ∑ b : J₄, chartInvGramOnE g p a b z *
      ∂ a (∂ b (bourChartTensorComponent (bourTraceFreeRicciField g) p ![i, j])) z| ≤
      F + (128 * K + 2176) * U + 256 * V := by
  have h := bourChartTwo_principal_bound g p (bourTraceFreeRicciField g) hz hHarm
    (by norm_num) (by norm_num) (by norm_num) hInv hGradInv hConn hCurv hZ hDZ i j hRough
  have hd : Module.finrank ℝ E₄ = 4 := by simp
  convert h using 1
  rw [hd]
  push_cast
  ring

end Ricci

section RicciInterior

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H}
  [I.Boundaryless] [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]

-- The uniform principal bound chooses the constants before any
-- particular realized harmonic model, just as in the metric estimate.
example (A γ : ℝ≥0) :
    ∃ C₀ C₁ : ℝ, 0 ≤ C₀ ∧ 0 ≤ C₁ ∧
      ∀ (g : SmoothRiemannianMetric I M) (x : M) (b : BourHarmonicChart g x 2 A γ),
        b.chart.source = ball (0 : E₄) 4 →
      ∀ (G : SmoothRiemannianMetric (𝓘(ℝ, E₄)) E₄),
        (∀ z ∈ ball (0 : E₄) 3, ∀ v w : E₄, G.inner z v w = g.inner (b.chart z)
          (mfderiv (𝓘(ℝ, E₄)) I (b.chart : E₄ → M) z v)
          (mfderiv (𝓘(ℝ, E₄)) I (b.chart : E₄ → M) z w)) →
        (∀ z ∈ ball (0 : E₄) 3, ∀ k : J₄, laplacian (LeviCivita G) G
          (bourChartCoordinate (I := 𝓘(ℝ, E₄)) (0 : E₄) k) z = 0) →
        (∀ z ∈ ball (0 : E₄) 3, ∀ a b c d : J₄, |chartRiemannTensor G 0 a b c d z| ≤ 1) →
        let Z := bourTraceFreeRicciField G
        (∀ z ∈ ball (0 : E₄) 3, ∀ i j : J₄, |bourChartTensorComponent Z 0 ![i,j] z| ≤ 2) →
        (∀ z ∈ ball (0 : E₄) 3, ∀ i j : J₄,
          |bourChartTensorComponent (roughLap0SField G Z) 0 ![i,j] z| ≤ 3) →
        ∀ z ∈ ball (0 : E₄) 3, ∀ i j : J₄,
          |bourFlatOperator (Matrix.of fun a b => chartInvGramOnE G 0 a b z)
            (bourChartTensorComponent Z 0 ![i,j]) z| ≤
              C₀ + C₁ * ∑ q : (J₄ × J₄) × J₄,
                |fderiv ℝ (bourChartTensorComponent Z 0 ![q.1.1,q.1.2]) z (chartModelBasis E₄ q.2)| := by
  simpa only [mul_one] using bourUniformHarmonicTraceFreeRicci_principal_bound (I := I) (M := M)
    (r := 1) (L := 2) (by norm_num) (by norm_num) A γ
    (K := 1) (U := 2) (F := 3) (by norm_num) (by norm_num) (by norm_num)

end RicciInterior

section RicciPullback

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H}
  [I.Boundaryless] [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [T2Space M] [BoundarylessManifold I M]

-- Scalar-flat stationarity is needed only on the source carrier.
-- The trace-free rough Ricci equation on an extension of the patch
-- therefore has the source curvature and bulk on its right-hand side.
example (G : SmoothRiemannianMetric (𝓘(ℝ, E₄)) E₄) (g : SmoothRiemannianMetric I M)
    (Φ : PartialDiffeomorph (𝓘(ℝ, E₄)) I E₄ M ∞) (U : TopologicalSpace.Opens E₄)
    (hU : (U : Set E₄) ⊆ Φ.source)
    (hPull : ∀ y ∈ U, ∀ v w : TangentSpace (𝓘(ℝ, E₄)) y,
      G.inner y v w = g.inner (Φ y)
        (mfderiv (𝓘(ℝ, E₄)) I Φ y v) (mfderiv (𝓘(ℝ, E₄)) I Φ y w))
    (hR : ∀ y, metricScalarAt g y = 0) {z : E₄} (hz : z ∈ U)
    (hStat : bourCovariantGradient (1 / 2) g (Φ z) = 0)
    (u v : TangentSpace (𝓘(ℝ, E₄)) z) :
    let du := mfderiv (𝓘(ℝ, E₄)) I Φ z u
    let dv := mfderiv (𝓘(ℝ, E₄)) I Φ z v
    roughLap0SField G (bourTraceFreeRicciField G) z (vec2 u v) =
      -2 * hamiltonCurvatureRicciAt g (Φ z) (vec2 du dv) +
        bourBulkDensity (1 / 2) g (Φ z) * g.inner (Φ z) du dv := by
  simpa only [mul_zero, zero_mul, sub_zero] using
    bourStationaryRoughTraceFreeRicci_of_partialDiffeomorph_inner G g Φ U hU hPull
      (1 / 2) 0 hR hz hStat u v

end RicciPullback

section Euler

local notation "A₃" => Matrix (Fin 3) (Fin 3) ℝ

-- For anisotropic shape with principal curvatures 2, 3 and 5, the
-- mixed term couples to ambient tangent curvature, and the cubic
-- coefficient retains the determinant 30 throughout the connection path.
example (κ t : ℝ) :
    let S : A₃ := Matrix.diagonal ![2, 3, 5]
    let R := fun a b i j : Fin 3 =>
      κ * ((if a = i then 1 else 0) * (if b = j then 1 else 0) -
        (if a = j then 1 else 0) * (if b = i then 1 else 0))
    2 * (∑ a : Fin 3, ∑ i : Fin 3, S a i *
      bourBoundaryComplementaryWedges (bourBoundaryPathTangentialCurvature S R t) a i) =
      20 * κ + 180 * (1 - t ^ 2) := by
  intro S R
  have hW : bourBoundaryComplementaryWedges R = κ • (1 : A₃) := by
    ext a i
    fin_cases a <;> fin_cases i <;>
      norm_num [R, bourBoundaryComplementaryWedges, Fin.add_def, Matrix.one_apply]
  have hS : S.det = 30 := by norm_num [S, Matrix.det_diagonal, Fin.prod_univ_three]
  have hMixed : (∑ a : Fin 3, ∑ i : Fin 3, S a i * bourBoundaryComplementaryWedges R a i) =
      10 * κ := by
    rw [hW]
    simp only [Fin.sum_univ_three]
    norm_num [S, Matrix.diagonal_apply, Matrix.one_apply]
    ring
  rw [bourBoundaryPath_pfaffianCoefficient S R t, hMixed, hS]
  ring

-- The opposite normal has negative shape. In the oriented Pfaffian
-- expansion the resulting ambient mixed contribution is -6 κ.
example (κ : ℝ) (Θ : Fin 4 → Fin 4 → Fin 4 → ℝ) (R : CurvatureFrameTensor)
    (hMixed : ∀ a i : Fin 3, Θ 0 a.succ i.succ = -(-(1 : A₃)) a i)
    (hTangent : ∀ a b i : Fin 3, Θ a.succ b.succ i.succ = 0)
    (hFiber : ∀ a b i j, R a b i j = -R b a i j)
    (hBase : ∀ a b i j, R a b i j = -R a b j i)
    (hCurv : bourBoundaryComplementaryWedges (fun b c j k => R b.succ c.succ j.succ k.succ) =
      κ • (1 : A₃)) :
    -frameEulerTransgression Θ R 1 2 3 = -6 * κ := by
  rw [bourFrameEulerTransgression_boundary (-(1 : A₃)) Θ R hMixed hTangent hFiber hBase, hCurv]
  simp [Matrix.one_apply]
  ring

-- The two outward faces at π/3 and 2π/3 have nonzero integrated
-- corrections, each of sign minus, against the positive shell bulk.
example :
    let a := Real.pi / 3
    let b := Real.pi - a
    bourRoundEulerBulk a b = 11 * Real.pi ^ 2 ∧
    bourRoundEulerBoundary 1 b = -(11 / 2) * Real.pi ^ 2 ∧
    bourRoundEulerBoundary (-1) a = -(11 / 2) * Real.pi ^ 2 ∧
    bourRoundEulerBulk a b + bourRoundEulerBoundary 1 b + bourRoundEulerBoundary (-1) a = 0 := by
  intro a b
  have ha : 0 < a := by dsimp [a]; positivity
  have hab : a < b := by dsimp [a, b]; linarith [Real.pi_pos]
  have hb : b < Real.pi := by dsimp [b]; linarith
  have hpa : bourRoundEulerPrimitive a = (11 / 2) * Real.pi ^ 2 := by
    unfold bourRoundEulerPrimitive a
    rw [Real.cos_pi_div_three]
    ring
  have hpb : bourRoundEulerPrimitive b = -(11 / 2) * Real.pi ^ 2 := by
    unfold bourRoundEulerPrimitive b a
    rw [Real.cos_pi_sub, Real.cos_pi_div_three]
    ring
  refine ⟨?_, ?_, ?_, bourRoundEulerShell_total ha hab hb⟩
  · rw [bourRoundEulerBulk_eq, hpa, hpb]
    ring
  · rw [bourRoundEulerBoundary_increasing (ha.trans hab) hb, hpb]
  · rw [bourRoundEulerBoundary_decreasing ha (hab.trans hb), hpa]
    ring

end Euler

section FiniteBulk

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [T2Space M] [SigmaCompactSpace M] [BoundarylessManifold I M]

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

-- The actual scalar-flat bulk on a finite core keeps the two signed
-- Weyl integrals separate and gives a negative half-Ricci term.
example (g : SmoothRiemannianMetric I M) (o : ManifoldOrientation I M 4)
    (frame : ∀ x, OrientedOrthonormalFrameAt g o x) (K : Set M)
    (hScalar : ∀ᵐ x ∂(riemannianVolumeMeasure I M g).restrict K, metricScalarAt g x = 0)
    (hPlus : IntegrableOn (modifiedChargeDensity o g frame .plus) K (riemannianVolumeMeasure I M g))
    (hMinus : IntegrableOn (modifiedChargeDensity o g frame .minus) K (riemannianVolumeMeasure I M g))
    (hRicci : IntegrableOn (modifiedChargeDensity o g frame .ricci) K (riemannianVolumeMeasure I M g)) :
    (∫ x in K, intrinsicEulerDensity g x ∂riemannianVolumeMeasure I M g) +
      bourChargeOn o g frame K .ricci / 2 =
      bourChargeOn o g frame K .plus + bourChargeOn o g frame K .minus := by
  rw [bourEulerBulk_setIntegral_eq_scalarFlat g o frame K hScalar hPlus hMinus hRicci]
  ring

end FiniteBulk

section Coupled

-- There are 16 tensor entries and 64 directional derivatives in the
-- unrestricted two-tensor component system. The explicit interpolation
-- length absorbs the whole sum, with the weighted estimates supplied.
example (row : Fin 64 → Fin 16) (X : Fin 16 → ℝ) (Y Z : Fin 64 → ℝ)
    (A C G : ℝ) (hX : ∀ j, X j ≤ A + ∑ i, Y i)
    (hZ : ∀ i, Z i ≤ C + X (row i) + ∑ j, Y j)
    (hY : ∀ i, Y i ≤ G + (1 / 258) * Z i) (hPos : ∀ i, 0 ≤ Y i) :
    (∑ i, Y i) ≤ 128 * (G + (1 / 258) * (C + A)) ∧
      ∀ j, X j ≤ A + 128 * (G + (1 / 258) * (C + A)) := by
  have hSmall : (Fintype.card (Fin 64) : ℝ) * (1 / 258) * (1 * 1 + 1) ≤ 1 / 2 := by
    have h := (bourCoupledInterior_absorptionLength 64 1 1 1
      (by norm_num) (by norm_num) (by norm_num) (by norm_num)).2
    norm_num at h ⊢
  have h := bourCoupledInterior_absorb row X Y Z (A := A) (B := 1) (C := C) (D := 1)
    (F := 1) (G := G) (ε := 1 / 258) (by norm_num) (by norm_num) (by norm_num)
    (fun j => by simpa only [one_mul] using hX j)
    (fun i => by simpa only [one_mul] using hZ i) hY hPos hSmall
  simpa only [Fintype.card_fin, Nat.cast_ofNat, one_mul, show (2 : ℝ) * 64 = 128 by norm_num] using h

end Coupled

section HarmonicSystem

-- A scalar flat Laplacian estimate feeds a sixteen-row system with
-- genuine first-order coupling, controlling all three norms on B(5/2).
example (A CΔ : ℝ≥0)
    (hLap : ∀ u : E₄ → ℝ, ContDiff ℝ ∞ u → HasCompactSupport u →
      eLpNorm (iteratedFDeriv ℝ 2 u) 6 (volume : Measure E₄) ≤
        (CΔ : ℝ≥0∞) * eLpNorm (Δ u) 6 volume) :
    ∃ C : ℝ≥0∞, C < ⊤ ∧
      ∀ (G : SmoothRiemannianMetric (𝓘(ℝ, E₄)) E₄),
        (∀ z ∈ ball (0 : E₄) 3, ∀ v : E₄,
          (2 : ℝ)⁻¹ ^ 2 * ‖v‖ ^ 2 ≤ G.inner z v v ∧ G.inner z v v ≤ 2 ^ 2 * ‖v‖ ^ 2) →
        (∀ i k : J₄, ∀ z ∈ ball (0 : E₄) 3, ‖fderiv ℝ (chartGramOnE G 0 i k) z‖ ≤ (A : ℝ)) →
        ∀ (u : J₄ × J₄ → E₄ → ℝ), (∀ j, ContDiff ℝ ∞ (u j)) →
          (∀ j z, z ∈ ball (0 : E₄) 3 → |u j z| ≤ 2) →
          (∀ j z, z ∈ ball (0 : E₄) 3 →
            |bourFlatOperator (fun i k => chartInvGramOnE G 0 i k z) (u j) z| ≤
              3 + 5 * ∑ i : (J₄ × J₄) × J₄, |fderiv ℝ (u i.1) z (chartModelBasis E₄ i.2)|) →
          ∀ j, let μ := (volume : Measure E₄).restrict (ball (0 : E₄) (5 / 2))
            eLpNorm (u j) 6 μ + eLpNorm (fderiv ℝ (u j)) 6 μ +
              eLpNorm (iteratedFDeriv ℝ 2 (u j)) 6 μ ≤ C := by
  have hFlat (G : SmoothRiemannianMetric (𝓘(ℝ, E₄)) E₄) (z : E₄)
      (hG : ∀ v : E₄, G.inner z v v ≤ 2 ^ 2 * ‖v‖ ^ 2) :
      BourFlatHessianEstimate (volume : Measure E₄) 6
        (fun i k => chartInvGramOnE G 0 i k z) (4 * CΔ : ℝ≥0) := by
    have h := bourFlatHessianEstimate_metricFrozen (volume : Measure E₄) 6 (by norm_num)
      (by norm_num) G z (L := 2) (by norm_num) hG (CΔ : ℝ≥0∞) hLap
    have hScale : ENNReal.ofReal ((2 : ℝ) ^ 2) = ((4 : ℝ≥0) : ℝ≥0∞) := by norm_num
    simpa only [ENNReal.coe_mul, hScale] using h
  simpa only [mul_one] using bourUniformHarmonicSystemW26 (κ := J₄ × J₄) (volume : Measure E₄)
    (r := 1) (L := 2) (by norm_num) (by norm_num) A
    (U := 2) (F₀ := 3) (F₁ := 5) (by norm_num) (by norm_num) (by norm_num) (4 * CΔ) hFlat

end HarmonicSystem

section StationaryInterior

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H}
  [I.Boundaryless] [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [T2Space M] [CompactSpace M] [BoundarylessManifold I M]

local instance : NeZero (Module.finrank ℝ E₄) := ⟨by simp⟩

-- For p=1/2 the same bound works at scale one and scale four.
-- The very metric G furnishing both Sobolev bounds has physical
-- unit curvature ceiling on B(3), by the marked curvature transfer.
example (A γ CΔ : ℝ≥0)
    (hLap : ∀ u : E₄ → ℝ, ContDiff ℝ ∞ u → HasCompactSupport u →
      eLpNorm (iteratedFDeriv ℝ 2 u) 6 (volume : Measure E₄) ≤
        (CΔ : ℝ≥0∞) * eLpNorm (Δ u) 6 volume) :
    ∃ B : ℝ≥0∞, B < ⊤ ∧
      ∀ (g : SmoothRiemannianMetric I M) (R : ℝ),
        (∀ x, metricScalarAt g x = R) → |R| ≤ 3 →
      ∀ k : Fin 2, let a : ℝ := if k = 0 then 1 else 4
      ∀ (ha : 0 < a) (x : M) (b : BourHarmonicChart (scaleMetric a ha g) x 2 A γ),
        b.chart.source = ball (0 : E₄) 4 →
        (∀ z ∈ ball (0 : E₄) 3, bourCovariantGradient (1 / 2) g (b.chart z) = 0) →
        (∀ z ∈ ball (0 : E₄) 3, Real.sqrt (intrinsicCurvatureSq (scaleMetric a ha g) (b.chart z)) ≤ 1) →
        ∃ G : SmoothRiemannianMetric (𝓘(ℝ, E₄)) E₄,
          (∀ z ∈ ball (0 : E₄) 3, ∀ v w : E₄, G.inner z v w =
            (scaleMetric a ha g).inner (b.chart z)
              (mfderiv (𝓘(ℝ, E₄)) I (b.chart : E₄ → M) z v)
              (mfderiv (𝓘(ℝ, E₄)) I (b.chart : E₄ → M) z w)) ∧
          (∀ z ∈ ball (0 : E₄) 3, Real.sqrt (intrinsicCurvatureSq G z) ≤ 1) ∧
          ∀ i j : J₄, let ν := (volume : Measure E₄).restrict (ball (0 : E₄) (5 / 2))
            bourW26Norm ν (chartGramOnE G 0 i j) +
              bourW26Norm ν (bourChartTensorComponent (bourTraceFreeRicciField G) 0 ![i,j]) ≤ B := by
  obtain ⟨B, hB, hW⟩ := bourStationary_harmonic_W26 (I := I) (M := M)
    (by simp : Module.finrank ℝ E₄ = 4) (volume : Measure E₄)
    (r := 1) (L := 2) (K := 1) (C := 3)
    (by norm_num) (by norm_num) (by norm_num) (by norm_num) A γ CΔ hLap
  refine ⟨B, hB, ?_⟩
  intro g R hR hC k a ha x b hs hStat hK
  obtain ⟨G, hPull, hBounds⟩ := hW g R hR hC a ha (1 / 2) (by norm_num) (by norm_num) x b
    (by simpa only [mul_one] using hs) (by simpa only [mul_one] using hStat)
    (by simpa only [mul_one] using hK)
  have hPull' : ∀ z ∈ ball (0 : E₄) 3, ∀ v w : E₄, G.inner z v w =
      (scaleMetric a ha g).inner (b.chart z)
        (mfderiv (𝓘(ℝ, E₄)) I (b.chart : E₄ → M) z v)
        (mfderiv (𝓘(ℝ, E₄)) I (b.chart : E₄ → M) z w) := by
    simpa only [mul_one] using hPull
  let U : TopologicalSpace.Opens E₄ := ⟨ball 0 3, isOpen_ball⟩
  have hU : (U : Set E₄) ⊆ b.chart.source := by
    rw [hs]
    exact ball_subset_ball (by norm_num)
  refine ⟨G, hPull', ?_, ?_⟩
  · intro z hz
    rw [bourIntrinsicCurvatureSq_of_partialDiffeomorph_inner G (scaleMetric a ha g) b.chart U hU hPull' hz]
    exact hK z hz
  · simpa only [mul_one] using hBounds

end StationaryInterior

section MixedInterior

open DifferentialGeometry.Geometry.Riemannian

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H}
  [I.Boundaryless] [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [T2Space M] [CompactSpace M] [ConnectedSpace M] [BoundarylessManifold I M] [Nonempty M]

local instance : NeZero (Module.finrank ℝ E₄) := ⟨by simp⟩

-- A scale-four application of the mixed supplier gives the original
-- physical radius r/(2L), with G furnishing both interior estimates.
example (A CΔ : ℝ≥0) (hPeters : BourHarmonicRadiusSupplier (I := I) (M := M) 1 A)
    (hLap : ∀ u : E₄ → ℝ, ContDiff ℝ ∞ u → HasCompactSupport u →
      eLpNorm (iteratedFDeriv ℝ 2 u) 6 (volume : Measure E₄) ≤
        (CΔ : ℝ≥0∞) * eLpNorm (Δ u) 6 volume) :
    let hDim : Module.finrank ℝ E₄ = 4 := by simp
    let hFour : (0 : ℝ) < 4 := by norm_num
    ∃ (r R L : ℝ) (D : ℝ≥0) (B : ℝ≥0∞), 0 < r ∧ 0 < R ∧ 0 < L ∧ B < ⊤ ∧
      ∀ (g : SmoothRiemannianMetric I M) (s : ℝ),
        1 ≤ classYamabeFour hDim g → (∀ z, metricScalarAt g z = s) → 0 ≤ s → s ≤ 3 →
        (∀ z, bourCovariantGradient 0 g z = 0) →
        (∀ z, Real.sqrt (intrinsicCurvatureSq (scaleMetric 4 hFour g) z) ≤ 1) →
        ∀ x, ∃ (b : BourHarmonicChart (scaleMetric 4 hFour g) x L D A)
            (G : SmoothRiemannianMetric (𝓘(ℝ, E₄)) E₄),
          b.chart.source = ball (0 : E₄) (4*r) ∧
          b.chart.target ⊆ riemannianBallOf (scaleMetric 4 hFour g) x R ∧
          riemannianBallOf g x ((r/L)/2) ⊆ b.chart '' closedBall (0 : E₄) r ∧
          (∀ z ∈ ball (0 : E₄) (3*r), ∀ v w : E₄, G.inner z v w =
            (scaleMetric 4 hFour g).inner (b.chart z)
              (mfderiv (𝓘(ℝ, E₄)) I (b.chart : E₄ → M) z v)
              (mfderiv (𝓘(ℝ, E₄)) I (b.chart : E₄ → M) z w)) ∧
          ∀ i j : J₄, let ν := (volume : Measure E₄).restrict (ball (0 : E₄) (5*r/2))
            bourW26Norm ν (chartGramOnE G 0 i j) +
              bourW26Norm ν (bourChartTensorComponent (bourTraceFreeRicciField G) 0 ![i,j]) ≤ B := by
  intro hDim hFour
  obtain ⟨r, R, L, D, B, hr, hR, hL, hB, hUniform⟩ :=
    bourMixedStationary_uniformHarmonicW26 hDim (volume : Measure E₄)
      (y := 1) (C := 3) (K := 1) (by norm_num) (by norm_num) (by norm_num) A CΔ hPeters hLap
  refine ⟨r, R, L, D, B, hr, hR, hL, hB, ?_⟩
  intro g s hY hs hs₀ hs₃ hStat hK x
  have h := hUniform g s 0 4 hFour hY hs hs₀ hs₃ le_rfl (by norm_num) (by norm_num) hStat hK x
  simpa only [show Real.sqrt (4 : ℝ) = 2 by norm_num] using h

end MixedInterior

section InnerMorrey

-- At r=1, on B(2) inside B(5/2), the actual metric and trace-free
-- Ricci entry derivatives belong to the same Hölder class of order 1/3.
example (B : ℝ≥0∞) (hB : B < ⊤) :
    ∃ C : ℝ≥0, ∀ (G : SmoothRiemannianMetric (𝓘(ℝ, E₄)) E₄) (i j : J₄),
      let u := chartGramOnE G 0 i j
      let v := bourChartTensorComponent (bourTraceFreeRicciField G) 0 ![i,j]
      let ν := (volume : Measure E₄).restrict (ball (0 : E₄) (5 / 2))
      bourW26Norm ν u + bourW26Norm ν v ≤ B →
      HolderOnWith C (1 / 3) (fderiv ℝ u) (ball (0 : E₄) 2) ∧
      HolderOnWith C (1 / 3) (fderiv ℝ v) (ball (0 : E₄) 2) := by
  obtain ⟨C, hC, hMorrey⟩ := bourHarmonicMorrey_of_W26 (volume : Measure E₄)
    (r := 1) (by norm_num) hB
  let Q : ℝ≥0 := ⟨C, hC⟩
  have hQ : ENNReal.ofReal C = (Q : ℝ≥0∞) := by
    change ENNReal.ofReal (Q : ℝ) = (Q : ℝ≥0∞)
    exact ENNReal.ofReal_coe_nnreal
  refine ⟨Q, ?_⟩
  have hApply (w : E₄ → ℝ) (hw : ContDiff ℝ ∞ w)
      (hW : bourW26Norm ((volume : Measure E₄).restrict (ball (0 : E₄) (5 / 2))) w ≤ B) :
      HolderOnWith Q (1 / 3) (fderiv ℝ w) (ball (0 : E₄) 2) := by
    have h := (hMorrey w hw (by simpa only [mul_one] using hW)).2
    intro x hx y hy
    have hPair := h x (by simpa only [mul_one] using hx) y (by simpa only [mul_one] using hy)
    rw [edist_dist, edist_dist, dist_eq_norm]
    have hExp : (((1 / 3 : ℝ≥0)) : ℝ) = (1 / 3 : ℝ) := by norm_num
    rw [hExp, ENNReal.ofReal_rpow_of_nonneg dist_nonneg (by norm_num),
      ← hQ, ← ENNReal.ofReal_mul hC]
    exact ENNReal.ofReal_le_ofReal hPair
  intro G i j u v ν hSum
  refine ⟨hApply u ?_ (le_self_add.trans hSum), hApply v ?_ (le_add_self.trans hSum)⟩
  · apply contDiffOn_univ.mp
    simpa only [u, extChartAt_model_space_eq_id, PartialEquiv.refl_target] using
      (chartGramOnE_contDiffOn G (0 : E₄) i j)
  · rw [contDiff_iff_contDiffAt]
    intro z
    apply bourChartTensorComponent_contDiffAt
    rw [extChartAt_model_space_eq_id]
    simp

end InnerMorrey

section NativeScale

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H}
  [I.Boundaryless] [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  [CompactSpace M] [BoundarylessManifold I M]

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

-- Under the scale-four parabolic change, the half-unit normalized slab
-- corresponds to a physical interval of length 1/32. Both integrands
-- use their own metric's computed gradient at p = 1/2.
example (g : ℝ → SmoothRiemannianMetric I M) (t₀ : ℝ) :
    (∫ s in (-1 / 2 : ℝ)..0,
      let h := scaleMetric 4 (by norm_num) (g (s / 4^2 + t₀))
      gradientSq h (bourCovariantGradient (1 / 2) h)) =
      ∫ t in (t₀ - 1 / 32)..t₀, gradientSq (g t) (bourCovariantGradient (1 / 2) (g t)) := by
  have h := bourParabolicGradientDissipation_eq (by simp [EuclideanSpace]) g (1 / 2)
    (c := 4) (by norm_num) t₀ (-1 / 2) 0
  have hLeft : (-1 / 2 : ℝ) / 4^2 + t₀ = t₀ - 1 / 32 := by ring
  have hRight : (0 : ℝ) / 4^2 + t₀ = t₀ := by ring
  simpa only [hLeft, hRight] using h

end NativeScale

section FirstWindows

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H}
  [I.Boundaryless] [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [T2Space M] [CompactSpace M] [BoundarylessManifold I M]
  {o : ManifoldOrientation I M 4}

local instance : NeZero (Module.finrank ℝ E₄) := ⟨by simp⟩

-- Fix the whole backward window [-2,0] on true curvature first hits.
-- The same basepoints give unit ordered curvature and zero limiting
-- dissipation on these physical rescalings.
example (q : ℝ → SignedCollarMetric o) {p C : ℝ} (hp : 0 ≤ p) (hp₁ : p ≤ 1)
    {D : RealTimeInterval} (hInt : D.regular.OrdConnected)
    (hG : MetricFamilySmoothOn (I := I) D (fun s => (q s).metric))
    (hEuler : ∀ s ∈ D.regular, bourEuler (q s) = C)
    (hFlow : ∀ s ∈ D.regular, ∀ x, deriv (fun v => metricTensorField (q v).metric x) s =
      (-2 : ℝ) • bourCovariantGradient p (q s).metric x)
    (a : D.RegularTime) (Q : ℕ → ℝ) (hpos : ∀ n, 0 < Q n) (hQ : Tendsto Q atTop atTop)
    (hStart : ∀ n x, Real.sqrt (intrinsicCurvatureSq (q a).metric x) < Q n)
    (hHigh : ∀ L : ℝ, ∃ b : D.RegularTime, a ≤ b ∧
      ∃ x, L ≤ Real.sqrt (intrinsicCurvatureSq (q b).metric x)) :
    ∃ (t : ℕ → D.RegularTime) (x : ℕ → M),
      (∀ n, Real.sqrt (intrinsicCurvatureSq (scaleMetric (Q n) (hpos n) (q (t n)).metric) (x n)) = 1) ∧
      (∀ᶠ n in atTop, ∀ s ∈ Icc (-2 : ℝ) 0, let v := s / (Q n)^2 + (t n : ℝ)
        v ∈ D.regular ∧ ∀ y, Real.sqrt
          (intrinsicCurvatureSq (scaleMetric (Q n) (hpos n) (q v).metric) y) ≤ 1) ∧
      Tendsto (fun n => ∫ s in (-2 : ℝ)..0, let v := s / (Q n)^2 + (t n : ℝ)
        let g := scaleMetric (Q n) (hpos n) (q v).metric
        gradientSq g (bourCovariantGradient p g)) atTop (𝓝 0) := by
  obtain ⟨t, x, -, hOne, hWindow⟩ :=
    originalGradient_firstHit_nativeWindows q hp hp₁ hInt hG hEuler hFlow a Q hpos hQ hStart hHigh
  exact ⟨t, x, hOne, hWindow (-2) (by norm_num)⟩

end FirstWindows

section Terminal

variable {H H' M N : Type*} [TopologicalSpace H] [TopologicalSpace H']
  {I : ModelWithCorners ℝ E₄ H} {J : ModelWithCorners ℝ E₄ H'}
  [I.Boundaryless] [J.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M] [CompactSpace M]
  [TopologicalSpace N] [ChartedSpace H' N] [IsManifold J ∞ N] [T2Space N] [SigmaCompactSpace N]

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩
private local instance : MeasurableSpace N := borel N
private local instance : BorelSpace N := ⟨rfl⟩

-- The volume bound uses the actual compact comparison image. A factor
-- four in the quadratic form gives a factor 1/16 in dimension four.
example (Φ : PartialDiffeomorph J I N M ∞) (g : SmoothRiemannianMetric I M)
    (pull ref : SmoothRiemannianMetric J N) (U : TopologicalSpace.Opens N)
    (hU : (U : Set N) ⊆ Φ.source) {L : Set N} (hL : IsCompact L) (hLU : L ⊆ U)
    (hPull : ∀ x ∈ U, ∀ v w : TangentSpace J x,
      pull.inner x v w = g.inner (Φ x) (mfderiv J I Φ x v) (mfderiv J I Φ x w))
    (hQuad : ∀ x ∈ L, ∀ v : TangentSpace J x, ref.inner x v v ≤ 4 * pull.inner x v v) :
    (1 / 16 : ℝ) * (riemannianVolumeMeasure J N ref).real L ≤
      (riemannianVolumeMeasure I M g).real (Φ '' L) := by
  have h := terminalImageVolume_lower Φ g pull ref U hU hL hLU hPull
    (by norm_num : (0 : ℝ) < 4) hQuad
  have hDim : Module.finrank ℝ E₄ = 4 := by simp
  have hRoot : Real.sqrt ((4 : ℝ) ^ 4) = 16 := by norm_num
  rw [hDim, hRoot, ← one_div] at h
  exact h

-- At time zero the true half-negative velocity is zero on the compact
-- pulled-back domains covered by a terminal comparison.
example (g : ℕ → ℝ → SmoothRiemannianMetric I M)
    (G : ℕ → ℝ → (x : M) → Tensor0SSpace 2 I x)
    (h : ℝ → SmoothRiemannianMetric J N)
    (K : ℝ → (x : N) → Tensor0SSpace 2 J x)
    (hSpace : ∀ i t, t ∈ Icc (-2 : ℝ) 0 → Integrable (fun x => normSq0S (g i t) x 2 (G i t x))
      (riemannianVolumeMeasure I M (g i t)))
    (hTime : ∀ᶠ i in atTop, IntervalIntegrable (fun s => gradientSq (g i s) (G i s)) volume (-2) 0)
    (hDiss : Tendsto (fun i => ∫ s in (-2 : ℝ)..0, gradientSq (g i s) (G i s)) atTop (𝓝 0))
    (hCont : ContinuousOn (fun z : ℝ × N => normSq0S (h z.1) z.2 2 (K z.1 z.2))
      (Icc (-2 : ℝ) 0 ×ˢ univ))
    (hCmp : BourTerminalComparison (-2) g G h K)
    (hVelocity : ∀ x : N, HasDerivWithinAt (fun s => metricTensorField (h s) x)
      ((-2 : ℝ) • K 0 x) (Icc (-2 : ℝ) 0) 0) :
    ∀ x : N, HasDerivWithinAt (fun s => metricTensorField (h s) x) 0 (Icc (-2 : ℝ) 0) 0 := by
  intro x
  have hZero := terminalGradient_zero_of_pullbackComparisons (by norm_num : (-2 : ℝ) < 0)
    g G h K hSpace hTime hDiss hCont hCmp
  simpa only [hZero 0 (by norm_num) x, smul_zero] using hVelocity x

local instance : NeZero (Module.finrank ℝ E₄) := ⟨by simp⟩

-- With a genuine comparison to the computed gradient, cofinal regular
-- original windows at the increasing scale n + 1 give a stationary endpoint.
example [BoundarylessManifold I M] {o : ManifoldOrientation I M 4}
    (q : ℝ → SignedCollarMetric o) {p C : ℝ} (hp : 0 ≤ p) (hp1 : p ≤ 1)
    {D : RealTimeInterval} (hInt : D.regular.OrdConnected)
    (hG : MetricFamilySmoothOn (I := I) D (fun s => (q s).metric))
    (hEuler : ∀ s ∈ D.regular, bourEuler (q s) = C)
    (hFlow : ∀ s ∈ D.regular, ∀ x, deriv (fun v => metricTensorField (q v).metric x) s =
      (-2 : ℝ) • bourCovariantGradient p (q s).metric x)
    {a b : ℕ → D.RegularTime} (ha : Tendsto a atTop atTop) (hb : Tendsto b atTop atTop)
    (hWindow : ∀ᶠ i in atTop, (a i : ℝ) = (-2 : ℝ) / ((i : ℝ) + 1)^2 + (b i : ℝ))
    (h : ℝ → SmoothRiemannianMetric J N)
    (hCont : ContinuousOn (fun z : ℝ × N =>
      normSq0S (h z.1) z.2 2 (bourCovariantGradient p (h z.1) z.2)) (Icc (-2 : ℝ) 0 ×ˢ univ))
    (hCompare :
      let t := fun (i : ℕ) (s : ℝ) => s / ((i : ℝ) + 1)^2 + (b i : ℝ)
      BourTerminalComparison (-2)
        (fun i s => scaleMetric ((i : ℝ) + 1) (by positivity) (q (t i s)).metric)
        (fun i s x => ((i : ℝ) + 1)⁻¹ • bourCovariantGradient p (q (t i s)).metric x)
        h (fun s x => bourCovariantGradient p (h s) x)) :
    ∀ x : N, bourCovariantGradient p (h 0) x = 0 :=
  originalGradient_stationary_of_terminalComparison q hp hp1 hInt hG hEuler hFlow ha hb
    (fun i => (i : ℝ) + 1) (fun _ => by positivity) (-2) (by norm_num) hWindow h hCont
    hCompare 0 (by norm_num)

-- Pointwise convergence of metric values on fixed spacetime markings
-- suffices for the limit metric to agree at times -1 and zero once the
-- actual native speeds are uniformly small there.
example (g : ℕ → ℝ → SmoothRiemannianMetric I M) (h : ℝ → SmoothRiemannianMetric J N)
    (hVel : ∀ᶠ i in atTop, ∀ s ∈ Icc (-1 : ℝ) 0, ∀ y : M,
      HasDerivAt (fun t => metricTensorField (g i t) y)
        ((-2 : ℝ) • bourCovariantGradient (1 / 2) (g i s) y) s)
    (hLocal : ∀ x : N, ∃ Φ : ℕ → PartialDiffeomorph J I N M ∞,
      (∀ᶠ i in atTop, x ∈ (Φ i).source) ∧
      (∃ B ≥ (0 : ℝ), ∀ᶠ i in atTop, ∀ s ∈ Icc (-1 : ℝ) 0, ∀ v : TangentSpace J x,
        (g i s).inner (Φ i x) (mfderiv J I (Φ i) x v) (mfderiv J I (Φ i) x v) ≤
          B * (h 0).inner x v v) ∧
      (∀ ε > (0 : ℝ), ∀ᶠ i in atTop, ∀ s ∈ Icc (-1 : ℝ) 0,
        Real.sqrt (normSq0S (g i s) (Φ i x) 2
          (bourCovariantGradient (1 / 2) (g i s) (Φ i x))) ≤ ε) ∧
      (∀ s ∈ Icc (-1 : ℝ) 0, ∀ v w : TangentSpace J x,
        Tendsto (fun i => (g i s).inner (Φ i x) (mfderiv J I (Φ i) x v) (mfderiv J I (Φ i) x w))
          atTop (𝓝 ((h s).inner x v w)))) :
    h (-1) = h 0 :=
  terminalMetric_eq_final_of_nativeSpeed (A := -1) (by norm_num) g
    (fun i s x => bourCovariantGradient (1 / 2) (g i s) x) h hVel hLocal (-1) (by norm_num)

end Terminal

section PointedScalar

open DifferentialGeometry.Geometry.Riemannian

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H}
  [I.Boundaryless] [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  [SigmaCompactSpace M] [ConnectedSpace M] [BoundarylessManifold I M]

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

-- On the noncompact terminal branch the physical scalar comes from the
-- native gradient, a positive unit-ball floor and the cutoff exhaustion.
example (g : SmoothRiemannianMetric I M)
    (o : M)
    (hStationary : ∀ x, bourCovariantGradient (1 / 2) g x = 0)
    (hEnergy : Integrable (fun x => metricScalarAt g x ^ 2) (riemannianVolumeMeasure I M g))
    (hNoncompact : ¬ IsCompact (univ : Set M))
    (hClosed : ∀ x : M, ∀ R : ℝ, 0 < R → IsCompact (riemannianClosedBallOf g x R))
    (hVolume : ∀ x : M, (1 / 2 : ℝ) ≤
      (riemannianVolumeMeasure I M g).real (riemannianBallOf g x 1)) :
    ∀ x, metricScalarAt g x = 0 :=
  bourPointedStationary_scalarFlat (by simp : Module.finrank ℝ E₄ = 4)
    (by norm_num : (0 : ℝ) < 1 / 2) g o hNoncompact hClosed
    (by norm_num : (0 : ℝ) < 1 / 2) hVolume hEnergy hStationary

-- The same complete pointed metric now solves the zero-parameter
-- equation in its actual tangent fibers, with no residual scalar term.
example (h : SmoothRiemannianMetric I M) (o : M)
    (hStationary : ∀ x, bourCovariantGradient (1 / 2) h x = 0)
    (hEnergy : Integrable (fun x => metricScalarAt h x ^ 2) (riemannianVolumeMeasure I M h))
    (hNoncompact : ¬ IsCompact (univ : Set M))
    (hClosed : ∀ x : M, ∀ R : ℝ, 0 < R → IsCompact (riemannianClosedBallOf h x R))
    (hVolume : ∀ x : M, (1 / 2 : ℝ) ≤
      (riemannianVolumeMeasure I M h).real (riemannianBallOf h x 1)) :
    ∀ x : M, bourCovariantGradient 0 h x = 0 ∧ ∀ u v : TangentSpace I x,
      roughLap0SField h (metricRicci h) x (vec2 u v) +
        2 * hamiltonCurvatureRicciAt h x (vec2 u v) =
        normSq0S h x 2 (metricRicciAt h x) / 2 * h.inner x u v := by
  have hScalar := bourPointedStationary_scalarFlat (by simp : Module.finrank ℝ E₄ = 4)
    (by norm_num : (0 : ℝ) < 1 / 2) h o hNoncompact hClosed
    (by norm_num : (0 : ℝ) < 1 / 2) hVolume hEnergy hStationary
  intro x
  exact bourScalarFlat_stationary_zeroParameter (1 / 2) h hScalar x (hStationary x)

end PointedScalar

section ValueSlope

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H}
  [I.Boundaryless] [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [T2Space M] [CompactSpace M] [Nonempty M] [BoundarylessManifold I M]
  {o : ManifoldOrientation I M 4}

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

-- The derivative from one whole least-Ricci return is exactly minus
-- one twenty-fourth of its spherical Yamabe deficit.
example {BachFlat : SmoothRiemannianMetric I M → Prop}
    (q : ℕ → SignedCollarMetric o) (w limit : SignedCollarMetric o)
    (p : ℕ → ℝ) (hp : ∀ n, 0 < p n) (hp1 : ∀ n, p n < 1) (hp0 : Tendsto p atTop (𝓝 0))
    (hw : AttainedYamabeAt BachFlat (sInf (geometricPositiveEnergies o)) w)
    (hLeast : IsLeast (bourRicci '' {v : SignedCollarMetric o |
      AttainedYamabeAt BachFlat (sInf (geometricPositiveEnergies o)) v}) (bourRicci w))
    (hy : ∀ n, 0 < classYamabeFour o.dimension_eq (q n).metric)
    (hMin : ∀ n, bourEnergy (p n) (q n) = sInf (bourRegularizedPositiveValues o (p n)))
    (hyLimit : 0 < classYamabeFour o.dimension_eq limit.metric) (hBach : BachFlat limit.metric)
    (hVol : riemannianVolumeMeasure I M limit.metric univ = 1)
    (hCSC : ∀ x, metricScalarAt limit.metric x = classYamabeFour o.dimension_eq limit.metric)
    (hE : Tendsto (fun n => (q n).energy .plus) atTop (𝓝 (limit.energy .plus)))
    (hD : Tendsto (fun n => bourRicci (q n)) atTop (𝓝 (bourRicci limit)))
    (hI : 0 < sInf (geometricPositiveEnergies o))
    (hEuler : bourEuler w = 16 * Real.pi ^ 2)
    (hRound : classYamabeFour o.dimension_eq w.metric ≤ roundYamabeConstant)
    (hEquality : classYamabeFour o.dimension_eq w.metric = roundYamabeConstant →
      w.energy .plus = 0) :
    let d := roundYamabeConstant ^ 2 - (classYamabeFour o.dimension_eq w.metric) ^ 2
    0 < d ∧ sInf (bourRegularizedPositiveValues o 0) = 2 * sInf (geometricPositiveEnergies o) ∧
      HasDerivWithinAt (fun t => sInf (bourRegularizedPositiveValues o t)) (-d / 24) (Ioi 0) 0 := by
  intro d
  obtain ⟨hGapEq, hGap⟩ := bourExactComparator_ricciGap hw hI hEuler hRound hEquality
  obtain ⟨hValue, hDerivative⟩ := bourRegularizedValue_hasRightDerivative q w limit p hp hp1 hp0 hw
    hLeast hy hMin hyLimit hBach hVol hCSC hE hD
  change 4 * sInf (geometricPositiveEnergies o) - bourRicci w = d / 12 at hGapEq
  have hRate : bourRicci w / 2 - 2 * sInf (geometricPositiveEnergies o) = -d / 24 := by
    linarith only [hGapEq]
  have hd : 0 < d := by linarith only [hGapEq, hGap]
  exact ⟨hd, hValue, hRate ▸ hDerivative⟩

end ValueSlope

#print axioms bourFlatHessianEstimate_perturb
#print axioms bourFlatHessianEstimate_perturb_entries
#print axioms bourFlatHessianEstimate_metricFrozen
#print axioms bourUniformHarmonicMetricHessian_bound
#print axioms bourUniformHarmonicMetricW2_of_flatLaplacian
#print axioms bourChartContractedChristoffelDerivative_eq_of_laplacian
#print axioms bourChartContractedChristoffelDerivative_bound
#print axioms bourTraceFreeRicciField_scale
#print axioms bourStationary_roughRicci_eq
#print axioms bourStationary_roughTraceFreeRicci_eq
#print axioms bourChartDerivativeActionTwo_cancel
#print axioms bourStationary_scalarCoefficient_scale
#print axioms bourChartTwo_principal_bound
#print axioms bourUniformHarmonicTraceFreeRicci_principal_bound
#print axioms bourStationaryRoughTraceFreeRicci_of_partialDiffeomorph_inner
#print axioms bourStationary_roughTraceFreeRicci_abs_le
#print axioms bourBoundaryMixedConnection_eq_neg
#print axioms bourBoundaryPathTangentialCurvature_of_connectionForms
#print axioms bourFrameEulerTransgression_boundary
#print axioms bourBoundaryPath_pfaffianCoefficient
#print axioms bourFrameEulerTransgression_boundary_integral
#print axioms bourEulerBulk_setIntegral_eq_scalarFlat
#print axioms bourRoundEulerBoundary_increasing
#print axioms bourRoundEulerBoundary_decreasing
#print axioms bourRoundEulerBulk_eq
#print axioms bourRoundEulerShell_total
#print axioms bourInterior_dyadicAbsorption
#print axioms sixthPowerDirectional_cutoff_ibp
#print axioms sixthPowerDirectional_cutoff_eLpNorm
#print axioms sixthPowerDirectional_eLpNorm_on_ball
#print axioms bourSquaredCutoff_operator_error
#print axioms bourCoupledInterior_absorb
#print axioms bourCoupledInterior_absorptionLength
#print axioms bourCutoffSystem_sixthInterior
#print axioms bourUniformHarmonicSystemW26
#print axioms bourUniformHarmonicSystemW26_of_flatLaplacian
#print axioms bourUniformHarmonicPullbackSystemW26_of_flatLaplacian
#print axioms bourStationary_harmonic_W26
#print axioms bourMixedStationary_uniformHarmonicW26
#print axioms bourIntrinsicCurvatureSq_of_partialDiffeomorph_inner
#print axioms bourW26Norm_volume_eq
#print axioms bourHarmonicMorrey_of_W26_volume
#print axioms bourHarmonicMorrey_of_W26
#print axioms bourMixedStationary_uniformHarmonicC1Third
#print axioms bourCovariantGradient_scaleMetric
#print axioms bourParabolicVelocity_hasDerivAt
#print axioms bourParabolicGradientDissipation_eq
#print axioms bourOriginal_curvature_firstHits
#print axioms bourRegular_backwardWindow
#print axioms originalGradient_firstHit_spacetimeWindows
#print axioms originalGradient_firstHit_nativeWindows
#print axioms terminalImageVolume_lower
#print axioms terminalGradient_zero_of_pullbackComparisons
#print axioms originalGradient_stationary_of_terminalComparison
#print axioms terminalMetric_eq_final_of_nativeSpeed
#print axioms bourStationary_scalarLaplacian_eq_zero
#print axioms bourPointedVolume_eq_top_of_unit_ball_lower
#print axioms bourHarmonic_cutoff_energy
#print axioms bourPointed_harmonic_L2_zero
#print axioms bourSmoothPointedBallCutoff
#print axioms bourPointedStationary_scalarFlat
#print axioms bourScalarFlat_stationary_zeroParameter
#print axioms bourRegularized_secant_antitone
#print axioms bourRegularized_value_rightSlope_of_oneReturn
#print axioms bourRegularizedValue_hasRightDerivative

end E51Readback
