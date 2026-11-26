import SmoothPoincare.Variational.BourHarmonicRicci
import DifferentialGeometry.Geometry.Connection.ChartBridge.Connection.ChristoffelBounds
import DifferentialGeometry.Analysis.Elliptic.ConnectionLaplacian.ChartCoordinateExpansion.CoordinateFormula.ChristoffelTraceCorrection

/-!
# The connection terms on a supplied stationary harmonic chart

26 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance.
Actual serving configuration unavailable.
-/

set_option autoImplicit false

noncomputable section

open Bundle DifferentialGeometry DifferentialGeometry.Geometry.Connection
open DifferentialGeometry.Geometry.Operator DifferentialGeometry.Tensor.Coordinates
open DifferentialGeometry.Analysis.Elliptic
open DifferentialGeometry.Analysis.Parabolic.TensorSpectral
open DifferentialGeometry.Analysis.Spectral.DeTurckCoefficients
open Set
open scoped BigOperators ContDiff Manifold Topology

namespace SmoothPoincare

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [FiniteDimensional ℝ E] [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]

local notation "J" => Fin (Module.finrank ℝ E)
local notation "∂" => DifferentialGeometry.Tensor.Coordinates.partialDeriv

/-- A bound for the derivative of the actual Levi–Civita chart coefficients,
affine in a pointwise bound for the second derivatives of the metric.
The bound can thus be used with a common first-jet bound and a varying
second-jet bound in the interior (L^b) estimate. -/
theorem bourChartConnectionDerivative_bound (g : SmoothRiemannianMetric I M) (p : M)
    {y : E} (hy : y ∈ interior (extChartAt I p).target)
    {A L D : ℝ} (hA : 0 ≤ A) (hL : 0 ≤ L)
    (hInv : ∀ a b : J, |chartInvGramOnE g p a b y| ≤ A)
    (hGrad : ∀ m a b : J, |∂ m (chartGramOnE g p a b) y| ≤ L)
    (hHess : ∀ m l a b : J, |∂ m (∂ l (chartGramOnE g p a b)) y| ≤ D)
    (m i j k : J) :
    |∂ m (chartChristoffel g p i j k) y| ≤
      (3 / 2 : ℝ) * (Module.finrank ℝ E : ℝ) *
        ((Module.finrank ℝ E : ℝ) ^ 2 * A ^ 2 * L ^ 2 + A * D) := by
  let n : ℝ := Module.finrank ℝ E
  have hInvGrad (a b : J) : |∂ m (chartInvGramOnE g p a b) y| ≤
      n ^ 2 * A ^ 2 * L := by
    rw [partialDeriv_chartInvGramOnE_eq g p y m a b hy, abs_neg]
    calc
      _ ≤ ∑ c : J, ∑ d : J, |chartInvGramOnE g p a c y *
          chartInvGramOnE g p d b y * ∂ m (chartGramOnE g p c d) y| :=
        (Finset.abs_sum_le_sum_abs _ _).trans <|
          Finset.sum_le_sum fun _ _ => Finset.abs_sum_le_sum_abs _ _
      _ ≤ ∑ _c : J, ∑ _d : J, A ^ 2 * L := by
        refine Finset.sum_le_sum fun c _ => Finset.sum_le_sum fun d _ => ?_
        rw [abs_mul, abs_mul, pow_two]
        exact mul_le_mul (mul_le_mul (hInv a c) (hInv d b) (abs_nonneg _) hA)
          (hGrad m c d) (abs_nonneg _) (mul_nonneg hA hA)
      _ = _ := by
        simp only [Finset.sum_const, Finset.card_univ, Fintype.card_fin, nsmul_eq_mul, n]
        ring
  calc
    _ ≤ (1 / 2 : ℝ) * n * ((n ^ 2 * A ^ 2 * L) * (3 * L) + A * (3 * D)) :=
      christoffelD_abs_le g p hy m i j k hA (by positivity) (hInv k)
        (hInvGrad k) (fun l => chartChristoffelBracket_abs_le g p y hGrad i j l)
        (fun l => chartChristoffelBracketDeriv_abs_le g p y hHess m i j l)
    _ = _ := by dsimp [n]; ring

variable [I.Boundaryless] [T2Space M]

/-- The trace of the Levi–Civita derivatives of the actual coordinate frame
vanishes when the actual chart functions are harmonic at the point. -/
theorem bourChartConnection_trace_eq_zero (g : SmoothRiemannianMetric I M) (p : M)
    {x : M} (hx : x ∈ chartLeviCivitaGoodSet (I := I) p)
    (hHarm : ∀ l : J, laplacian (I := I) (LeviCivita (I := I) g) g
      (bourChartCoordinate (I := I) p l) x = 0) :
    (∑ a : J, ∑ b : J, chartInvGramMatrix (I := I) g p x a b •
      (LeviCivita (I := I) g).toFun (chartBasisVecFiber (I := I) p b) x
        (chartBasisVecFiber (I := I) p a x)) = 0 := by
  have hSource := chartLeviCivitaGoodSet_mem_extChartAt_source (I := I) hx
  have hInv (a b : J) : chartInvGramMatrix (I := I) g p x a b =
      chartInvGramOnE g p a b (extChartAt I p x) := by
    rw [chartInvGramOnE_def, (extChartAt I p).left_inv hSource]
  have hZero (l : J) : (∑ a : J, ∑ b : J,
      chartInvGramMatrix (I := I) g p x a b * chartChristoffel g p a b l (extChartAt I p x)) = 0 := by
    simpa only [hInv, hHarm l, eq_comm, neg_eq_zero] using
      (bourLaplacian_chartCoordinate g p l
        (chartLeviCivitaGoodSet_mem_chartAt_source (I := I) hx))
  simp_rw [LeviCivita_chartBasisVec_alpha_basis_apply (I := I) g p _ _ hx, Finset.smul_sum, smul_smul]
  rw [Finset.sum_comm]
  refine Finset.sum_eq_zero fun l _ => ?_
  rw [Finset.sum_comm, ← Finset.sum_smul]
  simp_rw [← Finset.sum_smul]
  rw [← Finset.sum_smul, hZero l, zero_smul]

end SmoothPoincare
