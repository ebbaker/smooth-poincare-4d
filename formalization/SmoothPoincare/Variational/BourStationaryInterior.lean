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
open DifferentialGeometry.Geometry.Curvature
open DifferentialGeometry.Geometry.Operator DifferentialGeometry.Tensor.Coordinates
open DifferentialGeometry.Tensor DifferentialGeometry.Tensor0SBundle
open DifferentialGeometry.Analysis.Elliptic
open DifferentialGeometry.Analysis.Parabolic.TensorSpectral
open DifferentialGeometry.Analysis.Spectral.DeTurckCoefficients
open DifferentialGeometry.Integral.L2
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
  let A (a b : J) := chartInvGramMatrix (I := I) g p x a b
  let G (a b l : J) := chartChristoffel g p a b l (extChartAt I p x)
  let V (l : J) := chartBasisVecFiber (I := I) p l x
  have hSource := chartLeviCivitaGoodSet_mem_extChartAt_source (I := I) hx
  have hInv (a b : J) : A a b =
      chartInvGramOnE g p a b (extChartAt I p x) := by
    dsimp only [A]
    rw [chartInvGramOnE_def, (extChartAt I p).left_inv hSource]
  have hZero (l : J) : (∑ a : J, ∑ b : J, A a b * G a b l) = 0 := by
    have h := bourLaplacian_chartCoordinate g p l
      (chartLeviCivitaGoodSet_mem_chartAt_source (I := I) hx)
    rw [hHarm l] at h
    simpa only [hInv, G] using (neg_eq_zero.mp h.symm)
  simp_rw [LeviCivita_chartBasisVec_alpha_basis_apply (I := I) g p _ _ hx, Finset.smul_sum, smul_smul]
  change (∑ a : J, ∑ b : J, ∑ l : J, (A a b * G a b l) • V l) = 0
  calc
    _ = ∑ a : J, ∑ l : J, ∑ b : J, (A a b * G a b l) • V l :=
      Finset.sum_congr rfl fun _ _ => Finset.sum_comm
    _ = ∑ l : J, ∑ a : J, ∑ b : J, (A a b * G a b l) • V l := Finset.sum_comm
    _ = 0 := by
      refine Finset.sum_eq_zero fun l _ => ?_
      simpa only [Finset.sum_smul, zero_smul] using
        congrArg (fun c : ℝ => c • V l) (hZero l)

variable [NeZero (Module.finrank ℝ E)] [BoundarylessManifold I M]

/-- The raw rough Laplacian on a supplied harmonic chart is the sum of the
iterated covariant derivatives contracted by the inverse chart metric. The
correction from covariantly differentiating the derivative slot vanishes.
The derivatives of the connection in the tensor slots remain in the sum. -/
theorem bourChartRoughLaplacian_eq_secondCovariantTrace
    (g : SmoothRiemannianMetric I M) (p : M) (r s : ℕ) (T : SmoothCcTensor g r s)
    (upper : Fin r → J) (lower : Fin s → J)
    {x : M} (hx : x ∈ chartLeviCivitaGoodSet (I := I) p)
    (hHarm : ∀ l : J, laplacian (I := I) (LeviCivita (I := I) g) g
      (bourChartCoordinate (I := I) p l) x = 0) :
    tensorChartComponentRaw (I := I) (M := M) g r s
      (rawTensorConnLapSmooth (I := I) g r s T) p upper lower x =
        chartInvGramPrincipalSum (I := I) (M := M) g r s p T upper lower x := by
  apply sub_eq_zero.mp
  rw [rawConnLap_chartα_minus_invGramPrincipalSum_eq_christoffelTrace g r s p T upper lower hx]
  apply neg_eq_zero.mpr
  let eval : TensorRSSpace r s I x →L[ℝ] ℝ :=
    (tensorChartComponentProjection (E := E) r s upper lower).comp
      ((trivializationAt (TensorRSModel r s ℝ E)
        (fun y : M => TensorRSSpace r s I y) p).continuousLinearMapAt ℝ x)
  let dT : TangentSpace I x →L[ℝ] TensorRSSpace r s I x :=
    (TensorRSNabla.tensorRSCovariantDerivative I M r s
      (LeviCivita (I := I) g)).toFun (fun z : M => T.toSection z) x
  let C (a b : J) := (LeviCivita (I := I) g).toFun (chartBasisVecFiber (I := I) p b) x
    (chartBasisVecFiber (I := I) p a x)
  have hSymm (a b : J) : C a b = C b a := by
    dsimp only [C]
    rw [LeviCivita_chartBasisVec_alpha_basis_apply (I := I) g p a b hx,
      LeviCivita_chartBasisVec_alpha_basis_apply (I := I) g p b a hx]
    refine Finset.sum_congr rfl fun l _ => ?_
    rw [chartChristoffel_symm g p a b l]
  change (∑ a : J, ∑ b : J, chartInvGramMatrix (I := I) g p x a b *
    eval (dT (C b a))) = 0
  calc
    _ = ∑ a : J, ∑ b : J, chartInvGramMatrix (I := I) g p x a b *
        eval (dT (C a b)) := by
      refine Finset.sum_congr rfl fun a _ => Finset.sum_congr rfl fun b _ => ?_
      rw [hSymm b a]
    _ = 0 := by
      have h := congrArg (eval.comp dT) (bourChartConnection_trace_eq_zero g p hx hHarm)
      simpa only [map_sum, map_smul, map_zero, ContinuousLinearMap.comp_apply, smul_eq_mul] using h

end SmoothPoincare
