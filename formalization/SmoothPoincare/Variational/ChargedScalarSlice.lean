import SmoothPoincare.Variational.TerminalChargeTransfer
import DifferentialGeometry.Geometry.Flow.RicciFlow.Evolution.Scalar.IntrinsicDerivation
import DifferentialGeometry.Geometry.Flow.RicciFlow.Solution.Regularity
import DifferentialGeometry.Geometry.Metric.Distance.Continuity

/-! # Scalar positivity on the charged part of a regular Ricci-flow slice -/

open DifferentialGeometry DifferentialGeometry.Geometry.Curvature
  DifferentialGeometry.Geometry.Operator DifferentialGeometry.Integral.Measure
  DifferentialGeometry.PDE.RicciFlow DifferentialGeometry.Tensor0SBundle
  Filter MeasureTheory Set
open scoped ContDiff Manifold Topology

namespace SmoothPoincare

noncomputable section

variable {E H M : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
  [FiniteDimensional ℝ E] [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  {D : RealTimeInterval}

private local instance : CompleteSpace E := FiniteDimensional.complete ℝ E
private local instance : IsManifold I 1 M := IsManifold.of_le (by decide : (1 : WithTop ℕ∞) ≤ ∞)
private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

/-- At a regular time with scalar nonnegativity on both axes through a point,
positive trace-free Ricci charge there forces positive scalar curvature.
The hypotheses and proof are local, so the carrier can be noncompact. -/
theorem ricciFlow_scalar_pos_of_intrinsicTraceFreeRicciSq_pos
    (S : SolutionOn (I := I) (M := M) D) (hS : IsSolutionOn S)
    {t : ℝ} (ht : t ∈ D.regular) (x : M)
    (hTime : ∀ᶠ s in 𝓝 t, 0 ≤ S.scalar s x)
    (hSpace : ∀ᶠ y in 𝓝 x, 0 ≤ S.scalar t y)
    (hCharge : 0 < intrinsicTraceFreeRicciSq (S.base.metric t) x) :
    0 < S.scalar t x := by
  have hNonneg := hTime.self_of_nhds
  by_contra! hNot
  have hZero : S.scalar t x = 0 := le_antisymm hNot hNonneg
  have hTimeMin : IsLocalMin (fun s => S.scalar s x) t := by
    filter_upwards [hTime] with s hs
    simpa only [hZero] using hs
  have hSpaceMin : IsLocalMin (S.scalar t) x := by
    filter_upwards [hSpace] with y hy
    simpa only [hZero] using hy
  have hEvol := (scalar_curvature_evolution (I := I) S hS ⟨t, ht⟩ x).hasDerivAt
    (D.regular_mem_nhds ht)
  have hEvolZero := hTimeMin.hasDerivAt_eq_zero hEvol
  let G := flowG (I := I) S
  have hSmooth := scalarSmoothOfSolution (I := I) S t
  have hDiff (y : M) : MDifferentiableAt I 𝓘(ℝ) (S.scalar t) y :=
    hSmooth.contMDiffAt.mdifferentiableAt (by simp)
  have hLap : 0 ≤ laplacianAt (I := I) G t (S.scalar t) x :=
    laplacian_nonneg_at_spatial_min_of_metricCompatible (I := I)
      (G.connection t) (G.metric t) (G.metricCompatible t) hSpaceMin (hDiff x)
      (Eventually.of_forall hDiff) (gradientFun_mdiffAt (I := I) (G.metric t) hSmooth x)
  have hRic : 0 < normSq0S (S.family.metric t) x 2 (S.ricci t x) := by
    rw [intrinsicTraceFreeRicciSq_eq_ricciNormSq_sub_scalarSq] at hCharge
    have hSame : S.ricci t x = metricRicciAt (S.base.metric t) x := by
      simp only [SolutionOn.ricci_eq, SolutionFamily.ricci_apply, SolutionFamily.ricciAt]
    rw [hSame, SolutionOn.family_metric]
    linarith only [hCharge, sq_nonneg (metricScalarAt (S.base.metric t) x)]
  change laplacianAt (I := I) G t (S.scalar t) x +
    2 * normSq0S (S.family.metric t) x 2 (S.ricci t x) = 0 at hEvolZero
  linarith only [hEvolZero, hLap, hRic]

/-- A positive intrinsic charge on an open region yields a point in that
same region with both positive scalar curvature and positive trace-free
Ricci norm. The measure is the actual regular slice measure. -/
theorem ricciFlow_exists_scalar_pos_in_charged_openSet [SigmaCompactSpace M]
    (S : SolutionOn (I := I) (M := M) D) (hS : IsSolutionOn S)
    {t : ℝ} (ht : t ∈ D.regular) {U : Set M} (hU : IsOpen U)
    (hNonneg : ∀ᶠ s in 𝓝 t, ∀ x ∈ U, 0 ≤ S.scalar s x)
    (hCharge : 0 < ∫ x in U, intrinsicTraceFreeRicciSq (S.base.metric t) x
      ∂riemannianVolumeMeasure I M (S.base.metric t)) :
    ∃ x ∈ U, 0 < S.scalar t x ∧ 0 < intrinsicTraceFreeRicciSq (S.base.metric t) x := by
  obtain ⟨x, hx, hPositive⟩ := exists_pos_intrinsicTraceFreeRicciSq_of_setIntegral_pos
    (S.base.metric t) hU.measurableSet hCharge
  have hTime : ∀ᶠ s in 𝓝 t, 0 ≤ S.scalar s x := hNonneg.mono fun _ hs => hs x hx
  have hNear : ∀ᶠ y in 𝓝 x, y ∈ U := hU.mem_nhds hx
  have hSpace : ∀ᶠ y in 𝓝 x, 0 ≤ S.scalar t y :=
    hNear.mono hNonneg.self_of_nhds
  exact ⟨x, hx, ricciFlow_scalar_pos_of_intrinsicTraceFreeRicciSq_pos
    S hS ht x hTime hSpace hPositive, hPositive⟩

/-- The charged region may be the actual ball of the regular slice.
The time nonnegativity test is on this fixed set of points. -/
theorem ricciFlow_exists_scalar_pos_in_charged_ball [SigmaCompactSpace M]
    (S : SolutionOn (I := I) (M := M) D) (hS : IsSolutionOn S)
    {t : ℝ} (ht : t ∈ D.regular) (p : M) (r : ℝ)
    (hNonneg : ∀ᶠ s in 𝓝 t, ∀ x ∈ riemannianBallOf (S.base.metric t) p r, 0 ≤ S.scalar s x)
    (hCharge : 0 < ∫ x in riemannianBallOf (S.base.metric t) p r,
      intrinsicTraceFreeRicciSq (S.base.metric t) x
      ∂riemannianVolumeMeasure I M (S.base.metric t)) :
    ∃ x ∈ riemannianBallOf (S.base.metric t) p r,
      0 < S.scalar t x ∧ 0 < intrinsicTraceFreeRicciSq (S.base.metric t) x := by
  have hOpen : IsOpen (riemannianBallOf (S.base.metric t) p r) :=
    isOpen_lt (Geometry.Riemannian.continuous_riemannianEDist (S.base.metric t) p) continuous_const
  exact ricciFlow_exists_scalar_pos_in_charged_openSet S hS ht hOpen hNonneg hCharge

end

end SmoothPoincare
