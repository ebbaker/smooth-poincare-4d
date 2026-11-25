import FirstOrderTwistor.SpinAnnularGreen
import FirstOrderTwistor.SpinLeviCivita
import DifferentialGeometry.Geometry.Connection.DivergenceCovariantTrace
import DifferentialGeometry.Geometry.Connection.ParallelTransport.AlongCurve
import DifferentialGeometry.Geometry.Operator.Hessian.TraceFormula
import Mathlib.LinearAlgebra.Trace

/-!
# Density-weighted Clifford and inverse-metric flux

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex
assistance. Serving model and effort are unavailable.

The coordinate coefficient indexed by i, k, j is the Christoffel coefficient
with lower slots i, k and upper slot j. The Clifford symbols have a raised
index, and the fibre connection in their compatibility equation acts by
commutator. All derivatives use the directions of the same coordinate basis.
-/

open scoped BigOperators

namespace FirstOrderTwistor

private theorem christoffelTrace_smul_eq {ι F : Type*} [Fintype ι]
    [AddCommMonoid F] [Module ℝ F] (A : ι → ι → ι → ℝ)
    (hTorsion : ∀ i j k, A i j k = A j i k) (v : ι → F) :
    (∑ i, (∑ k, A i k k) • v i) = ∑ i, ∑ k, A i k i • v k := by
  simp only [Finset.sum_smul]
  rw [Finset.sum_comm]
  simp only [hTorsion]

/-- The density derivative and the contracted Clifford connection cancel
in the covariant flux. The direction and symbol indices use the same basis. -/
theorem coordinateCliffordFlux_sum_eq_zero {ι E F : Type*} [Fintype ι]
    [NormedAddCommGroup E] [NormedSpace ℝ E] [NormedAddCommGroup F] [NormedSpace ℝ F]
    (direction : ι → E) (A : ι → ι → ι → ℝ) (density : E → ℝ)
    (Γ symbol : ι → E → F →L[ℝ] F) (x : E)
    (hDensity : DifferentiableAt ℝ density x)
    (hSymbol : ∀ j, DifferentiableAt ℝ (symbol j) x)
    (hTrace : ∀ i, fderiv ℝ density x (direction i) = density x * ∑ k, A i k k)
    (hTorsion : ∀ i j k, A i j k = A j i k)
    (hCompatibility : ∀ i j a,
      (fderiv ℝ (symbol j) x (direction i)) a +
        Γ i x (symbol j x a) - symbol j x (Γ i x a) =
        -∑ k, A i k j • symbol k x a)
    (a : F) :
    (∑ i : ι, ((fderiv ℝ (fun y => density y • symbol i y) x (direction i)) a +
        Γ i x (density x • symbol i x a) - density x • symbol i x (Γ i x a))) = 0 := by
  have hTerm (i : ι) :
      (fderiv ℝ (fun y => density y • symbol i y) x (direction i)) a +
        Γ i x (density x • symbol i x a) - density x • symbol i x (Γ i x a) =
        density x • ((∑ k, A i k k) • symbol i x a - ∑ k, A i k i • symbol k x a) := by
    rw [fderiv_fun_smul hDensity (hSymbol i)]
    simp only [add_apply, smul_apply, ContinuousLinearMap.smulRight_apply,
      map_smul, hTrace, mul_smul]
    calc
      _ = density x • ((∑ k, A i k k) • symbol i x a +
          ((fderiv ℝ (symbol i) x (direction i)) a + Γ i x (symbol i x a) -
            symbol i x (Γ i x a))) := by
        simp only [smul_add, smul_sub]
        abel
      _ = _ := by rw [hCompatibility, sub_eq_add_neg]
  simp only [hTerm, ← Finset.smul_sum, Finset.sum_sub_distrib,
    christoffelTrace_smul_eq A hTorsion, sub_self, smul_zero]

/-- The contracted derivative of the weighted inverse metric, derived from
the uncontracted inverse-metric connection equation and the density trace. -/
theorem weightedInverseMetric_divergence_of_coordinateConnection {ι E : Type*}
    [Fintype ι] [NormedAddCommGroup E] [NormedSpace ℝ E]
    (direction : ι → E) (A : ι → ι → ι → ℝ) (density : E → ℝ)
    (inverseMetric : ι → ι → E → ℝ) (x : E)
    (hDensity : DifferentiableAt ℝ density x)
    (hMetric : ∀ i j, DifferentiableAt ℝ (inverseMetric i j) x)
    (hTrace : ∀ i, fderiv ℝ density x (direction i) = density x * ∑ k, A i k k)
    (hTorsion : ∀ i j k, A i j k = A j i k)
    (hCompatibility : ∀ i j k,
      fderiv ℝ (inverseMetric j k) x (direction i) =
        -(∑ l : ι, (A i l j * inverseMetric l k x + A i l k * inverseMetric j l x)))
    (j : ι) :
    (∑ i, fderiv ℝ (fun y => density y * inverseMetric i j y) x (direction i)) =
      -density x * ∑ i, ∑ k, A i k j * inverseMetric i k x := by
  have hTerm (i : ι) :
      fderiv ℝ (fun y => density y * inverseMetric i j y) x (direction i) =
      density x * ((∑ k, A i k k) * inverseMetric i j x -
        (∑ k, A i k i * inverseMetric k j x) - ∑ k, A i k j * inverseMetric i k x) := by
    rw [fderiv_fun_mul hDensity (hMetric i j)]
    simp only [add_apply, smul_apply, smul_eq_mul, hTrace, hCompatibility,
      Finset.sum_add_distrib]
    ring
  have hCancel : (∑ i, (∑ k, A i k k) * inverseMetric i j x) =
      ∑ i, ∑ k, A i k i * inverseMetric k j x :=
    christoffelTrace_smul_eq A hTorsion (fun i => inverseMetric i j x)
  simp only [hTerm, ← Finset.mul_sum, Finset.sum_sub_distrib, hCancel, sub_self, zero_sub, mul_neg, neg_mul]

/-- A supplied density and raised Clifford symbol satisfying the differential
connection equations in the fixed Euclidean directions give exactly the
weighted compatibility required by the annular Green identity. -/
theorem annularCliffordFluxCompatible_of_coordinateConnection {F : Type*}
    [NormedAddCommGroup F] [InnerProductSpace ℝ F] {Ω : Set EuclideanFour}
    (A : Fin 4 → Fin 4 → Fin 4 → EuclideanFour → ℝ) (density : EuclideanFour → ℝ)
    (Γ symbol : Fin 4 → EuclideanFour → F →L[ℝ] F)
    (hDensity : ∀ x ∈ Ω, DifferentiableAt ℝ density x)
    (hSymbol : ∀ x ∈ Ω, ∀ j, DifferentiableAt ℝ (symbol j) x)
    (hTrace : ∀ x ∈ Ω, ∀ i, euclideanPartial density i x = density x * ∑ k, A i k k x)
    (hTorsion : ∀ x ∈ Ω, ∀ i j k, A i j k x = A j i k x)
    (hCompatibility : ∀ x ∈ Ω, ∀ i j a,
      (fderiv ℝ (symbol j) x (EuclideanSpace.single i 1)) a +
        Γ i x (symbol j x a) - symbol j x (Γ i x a) =
        -∑ k, A i k j x • symbol k x a) :
    AnnularCliffordFluxCompatible Ω density Γ symbol := by
  intro x hx a
  exact coordinateCliffordFlux_sum_eq_zero (fun i => EuclideanSpace.single i 1)
    (fun i j k => A i j k x) density Γ symbol x (hDensity x hx) (hSymbol x hx)
    (hTrace x hx) (hTorsion x hx) (hCompatibility x hx) a

open DifferentialGeometry DifferentialGeometry.Geometry.Connection DifferentialGeometry.Geometry.Operator
open DifferentialGeometry.Integral.Measure DifferentialGeometry.Tensor.Coordinates
open Set
open scoped ContDiff Manifold

/-- The geometric density trace for DifferentialGeometry's model directions.
This formulation leaves the Clifford and fibre data in this same model basis. -/
theorem chartCliffordFlux_sum_eq_zero
    {E H M F : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
    [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
    [NormedAddCommGroup F] [NormedSpace ℝ F]
    (g : SmoothRiemannianMetric I M) (p : M) {x : E}
    (hx : x ∈ interior (extChartAt I p).target)
    (Γ symbol : Fin (Module.finrank ℝ E) → E → F →L[ℝ] F)
    (hSymbol : ∀ j, DifferentiableAt ℝ (symbol j) x)
    (hCompatibility : ∀ i j a,
      (fderiv ℝ (symbol j) x (chartModelBasis E i)) a +
        Γ i x (symbol j x a) - symbol j x (Γ i x a) =
        -∑ k, chartChristoffel g p i k j x • symbol k x a) (a : F) :
    (∑ i : Fin (Module.finrank ℝ E),
      ((fderiv ℝ (fun y => chartDensityOnE g p y • symbol i y) x (chartModelBasis E i)) a +
        Γ i x (chartDensityOnE g p x • symbol i x a) -
        chartDensityOnE g p x • symbol i x (Γ i x a))) = 0 := by
  have hDensity : DifferentiableAt ℝ (chartDensityOnE g p) x :=
    ((chartDensityOnE_contDiffOn g p).contDiffAt
      (mem_interior_iff_mem_nhds.mp hx)).differentiableAt (by simp)
  have hTrace (i : Fin (Module.finrank ℝ E)) :
      fderiv ℝ (chartDensityOnE g p) x (chartModelBasis E i) =
        chartDensityOnE g p x * ∑ k, chartChristoffel g p i k k x := by
    simpa only [partialDeriv, mul_comm] using
      partialDeriv_chartDensityOnE_eq_sum_chartChristoffel_diag g p i hx
  exact coordinateCliffordFlux_sum_eq_zero (chartModelBasis E)
    (fun i j k => chartChristoffel g p i j k x) (chartDensityOnE g p) Γ symbol x
    hDensity hSymbol hTrace (fun i j k => chartChristoffel_symm g p i j k x) hCompatibility a

section WeightedMetric

open Bundle

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
    [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]

/-- The actual metric weighted inverse-Gram divergence in the chart model
basis, obtained from the contracted Christoffel identity. -/
theorem chartWeightedInverseMetric_divergence
    (g : SmoothRiemannianMetric I M) (p : M) {x : E}
    (hx : x ∈ interior (extChartAt I p).target) (j : Fin (Module.finrank ℝ E)) :
    (∑ i, partialDeriv i (fun y => chartDensityOnE g p y * chartInvGramOnE g p i j y) x) =
      -chartDensityOnE g p x * ∑ i, ∑ k, chartChristoffel g p i k j x * chartInvGramOnE g p i k x := by
  have hbase : (extChartAt I p).symm x ∈ (trivializationAt E (TangentSpace I) p).baseSet := by
    have hs := (extChartAt I p).map_target (interior_subset hx)
    rw [extChartAt_source_eq_chartAt_source (I := I)] at hs
    rwa [trivializationAt_baseSet_eq_chartAt_source]
  have hDensity : chartDensityOnE g p x ≠ 0 := ne_of_gt (chartDensity_pos g p hbase)
  have hDG := chartContractedChristoffel_holds g p x j hx
  unfold ChartContractedChristoffelOn at hDG
  have hMul := congrArg (fun z : ℝ => -chartDensityOnE g p x * z) hDG
  change -chartDensityOnE g p x * _ = -chartDensityOnE g p x * (_ * _) at hMul
  have hFactor : -chartDensityOnE g p x * -(1 / chartDensityOnE g p x) = 1 := by
    field_simp
  rw [← mul_assoc, hFactor, one_mul] at hMul
  convert hMul.symm using 1
  · apply Finset.sum_congr rfl
    intro i _
    congr 1
    funext y
    rw [chartInvGramOnE_symm g p i j y]
  · congr 1
    apply Finset.sum_congr rfl
    intro i _
    apply Finset.sum_congr rfl
    intro k _
    exact mul_comm _ _

end WeightedMetric

section EuclideanChart

open DifferentialGeometry.Geometry.Riemannian.Geodesic
open DifferentialGeometry.Geometry.Riemannian.AlongCurve

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ EuclideanFour H}
    [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]

set_option maxHeartbeats 700000 in
/-- The chart density trace in the standard Euclidean directions. The
trace calculation starts in the model basis used by DifferentialGeometry
and then computes the same endomorphism's trace in the Euclidean basis. -/
theorem euclideanPartial_chartDensityOnE_eq_leviCivitaTrace (g : SmoothRiemannianMetric I M) (p : M)
    {x : EuclideanFour} (hx : x ∈ interior (extChartAt I p).target) (i : Fin 4) :
    euclideanPartial (chartDensityOnE g p) i x =
      chartDensityOnE g p x * ∑ k, leviCivitaCoordinateMatrices g p i x k k := by
  classical
  let C : EuclideanFour →ₗ[ℝ] EuclideanFour →ₗ[ℝ] EuclideanFour :=
    { toFun := fun v => (chartChristoffelContractionRightCLM g p v x).toLinearMap
      map_add' := by
        intro u v
        apply LinearMap.ext
        intro w
        exact ChartChristoffel.contraction_add_left (g := g) (α := p) (y := x) u v w
      map_smul' := by
        intro t v
        apply LinearMap.ext
        intro w
        exact ChartChristoffel.contraction_smul_left (g := g) (α := p) (y := x) t v w }
  let b := chartModelBasis EuclideanFour
  have hNative (i : Fin (Module.finrank ℝ EuclideanFour)) :
      LinearMap.trace ℝ EuclideanFour (C (b i)) = ∑ k, chartChristoffel g p i k k x := by
    rw [LinearMap.trace_eq_matrix_trace ℝ b, Matrix.trace]
    refine Finset.sum_congr rfl fun k _ => ?_
    simp only [Matrix.diag_apply, LinearMap.toMatrix_apply]
    change b.repr (chartChristoffelContraction g p (b i) (b k) x) k = _
    rw [chartChristoffelContraction_def]
    have hBasis (i j : Fin (Module.finrank ℝ EuclideanFour)) :
        chartCoord i (b j) = if i = j then 1 else 0 := by
      change b.repr (b j) i = _
      rw [Module.Basis.repr_self, Finsupp.single_apply]
      by_cases h : i = j
      · simp [h]
      · simp [h, Ne.symm h]
    have hTerm (l : Fin (Module.finrank ℝ EuclideanFour)) :
        (∑ a, ∑ d, chartChristoffel g p a d l x * chartCoord a (b i) * chartCoord d (b k)) =
          chartChristoffel g p i k l x := by
      simp only [hBasis, mul_ite, mul_one, mul_zero, Finset.sum_ite_eq', Finset.mem_univ, ite_true]
    simp only [hTerm, map_sum, map_smul]
    change (Finsupp.lapply k : (_ →₀ ℝ) →ₗ[ℝ] ℝ)
      (∑ l, chartChristoffel g p i k l x • b.repr (b l)) = _
    simp only [map_sum, map_smul, Finsupp.lapply_apply, Module.Basis.repr_self, Finsupp.single_apply,
      smul_eq_mul, mul_ite, mul_zero, mul_one, Finset.sum_ite_eq', Finset.mem_univ, ite_true]
  have hMap : (fderiv ℝ (chartDensityOnE g p) x).toLinearMap =
      chartDensityOnE g p x • (LinearMap.trace ℝ EuclideanFour).comp C := by
    apply b.ext
    intro j
    change partialDeriv j (chartDensityOnE g p) x =
      chartDensityOnE g p x * LinearMap.trace ℝ EuclideanFour (C (b j))
    rw [hNative]
    simpa only [mul_comm] using partialDeriv_chartDensityOnE_eq_sum_chartChristoffel_diag g p j hx
  have hStd :
      LinearMap.trace ℝ EuclideanFour (C (EuclideanSpace.single i 1)) =
        ∑ k, leviCivitaCoordinateMatrices g p i x k k := by
    let bStd := (EuclideanSpace.basisFun (Fin 4) ℝ).toBasis
    rw [LinearMap.trace_eq_matrix_trace ℝ bStd, Matrix.trace]
    refine Finset.sum_congr rfl fun k _ => ?_
    simp only [Matrix.diag_apply, LinearMap.toMatrix_apply]
    change bStd.repr (chartChristoffelContraction g p (EuclideanSpace.single i 1) (bStd k) x) k =
      chartChristoffelContraction g p (EuclideanSpace.single k 1) (EuclideanSpace.single i 1) x k
    have hb (k : Fin 4) : bStd k = EuclideanSpace.single k 1 :=
      EuclideanSpace.basisFun_apply (Fin 4) ℝ k
    rw [hb, chartChristoffelContraction_symm g p (EuclideanSpace.single i 1) (EuclideanSpace.single k 1) x]
    rfl
  have hEq := DFunLike.congr_fun hMap (EuclideanSpace.single i 1)
  change euclideanPartial (chartDensityOnE g p) i x =
    chartDensityOnE g p x * LinearMap.trace ℝ EuclideanFour (C (EuclideanSpace.single i 1)) at hEq
  rwa [hStd] at hEq

/-- In a chart of the actual metric the raised Clifford connection equation
gives the weighted annular Green compatibility in the fixed Euclidean
coordinate directions. The supplied Clifford symbols and fibre connection
must describe the same geometric trivialization. -/
theorem annularCliffordFluxCompatible_of_leviCivita {F : Type*}
    [NormedAddCommGroup F] [InnerProductSpace ℝ F] {Ω : Set EuclideanFour}
    (g : SmoothRiemannianMetric I M) (p : M) (hΩ : Ω ⊆ interior (extChartAt I p).target)
    (Γ symbol : Fin 4 → EuclideanFour → F →L[ℝ] F)
    (hSymbol : ∀ x ∈ Ω, ∀ j, DifferentiableAt ℝ (symbol j) x)
    (hCompatibility : ∀ x ∈ Ω, ∀ i j a,
      (fderiv ℝ (symbol j) x (EuclideanSpace.single i 1)) a +
        Γ i x (symbol j x a) - symbol j x (Γ i x a) =
        -∑ k, leviCivitaCoordinateMatrices g p i x j k • symbol k x a) :
    AnnularCliffordFluxCompatible Ω (chartDensityOnE g p) Γ symbol := by
  refine annularCliffordFluxCompatible_of_coordinateConnection
    (fun i j k x => leviCivitaCoordinateMatrices g p i x k j) (chartDensityOnE g p)
    Γ symbol ?_ hSymbol ?_ ?_ hCompatibility
  · intro x hx
    exact ((chartDensityOnE_contDiffOn g p).contDiffAt
      (mem_interior_iff_mem_nhds.mp (hΩ hx))).differentiableAt (by simp)
  · intro x hx i
    exact euclideanPartial_chartDensityOnE_eq_leviCivitaTrace g p (hΩ hx) i
  · intro x _ i j k
    change (chartChristoffelContraction g p (EuclideanSpace.single j 1)
      (EuclideanSpace.single i 1) x) k =
      (chartChristoffelContraction g p (EuclideanSpace.single i 1)
        (EuclideanSpace.single j 1) x) k
    rw [chartChristoffelContraction_symm g p (EuclideanSpace.single j 1)
      (EuclideanSpace.single i 1) x]

end EuclideanChart

end FirstOrderTwistor
