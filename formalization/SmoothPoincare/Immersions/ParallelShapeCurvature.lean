import SmoothPoincare.Immersions.CodazziJets
import Batteries.Tactic.OpenPrivate

/-! # Curvature commutation of a parallel shape operator -/

open Bundle DifferentialGeometry DifferentialGeometry.Geometry
open DifferentialGeometry.Geometry.Connection DifferentialGeometry.Geometry.Curvature
open DifferentialGeometry.Geometry.Riemannian.Geodesic
open DifferentialGeometry.Tensor.Coordinates FirstOrderTwistor Manifold Set Filter
open scoped ContDiff Manifold Topology

namespace SmoothPoincare

open private bundleMapCovDeriv_curvature
  from DifferentialGeometry.Geometry.Connection.ConnectionForm.Curvature

section ConnectionForm

variable {V E : Type*}
  [NormedAddCommGroup V] [NormedSpace ℝ V]
  [NormedAddCommGroup E] [NormedSpace ℝ E]

/-- The same connection acts on the source and target of an endomorphism.
If its covariant derivative vanishes on an open neighborhood, curvature
commutes with it at the point. -/
theorem connectionFormCurvature_commutes_of_parallelOn
    {Γ : V → V →L[ℝ] E →L[ℝ] E} {J : V → E →L[ℝ] E}
    {Ω : Set V} (hΩ : IsOpen Ω) {x : V} (hx : x ∈ Ω)
    (hΓ : DifferentiableAt ℝ Γ x) (hJ : ContDiffOn ℝ 2 J Ω)
    (hParallel : ∀ y ∈ Ω, ∀ X u, bundleMapCovDeriv Γ Γ J y X u = 0)
    (X Y : V) (u : E) :
    connectionFormCurvature Γ x X Y (J x u) = J x (connectionFormCurvature Γ x X Y u) := by
  have hJAt : ContDiffAt ℝ 2 J x := hJ.contDiffAt (hΩ.mem_nhds hx)
  have hDerivativeZero (D B : V) :
      connectionFormCovDeriv Γ (fun y => bundleMapCovDeriv Γ Γ J y B u) D x = 0 := by
    have hZero : (fun y => bundleMapCovDeriv Γ Γ J y B u) =ᶠ[𝓝 x] (fun _ => 0) := by
      filter_upwards [hΩ.mem_nhds hx] with y hy
      exact hParallel y hy B u
    simp [connectionFormCovDeriv, hZero.fderiv_eq, hZero.self_of_nhds]
  simpa only [hParallel x hx, hDerivativeZero, add_zero, sub_zero] using
    bundleMapCovDeriv_curvature hΓ hΓ hJAt X Y u

end ConnectionForm

open private chartConnectionBilin chartConnectionBilin_apply
  from DifferentialGeometry.Geometry.Connection.LeviCivita.Chart.Koszul

open private chartConnectionBilin_differentiableAt connectionFormCurvature_chartConnectionBilin
  from DifferentialGeometry.Geometry.Submanifold.Gauss

section Metric

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]

/-- The pinned Levi–Civita connection form in the chart centered at `p`. -/
noncomputable def metricChartConnectionForm (g : SmoothRiemannianMetric I M) (p : M) :
    E → E →L[ℝ] E →L[ℝ] E := chartConnectionBilin g p

theorem metricChartConnectionForm_apply (g : SmoothRiemannianMetric I M)
    (p : M) (z X Y : E) :
    metricChartConnectionForm g p z X Y = chartChristoffelContraction g p X Y z :=
  chartConnectionBilin_apply g p z X Y

theorem metricChartConnectionForm_differentiableAt (g : SmoothRiemannianMetric I M)
    (p : M) {z : E} (hz : z ∈ interior (extChartAt I p).target) :
    DifferentiableAt ℝ (metricChartConnectionForm g p) z :=
  chartConnectionBilin_differentiableAt g p hz

variable [I.Boundaryless]

/-- The endomorphism on the tangent fiber represented by `J` at the center. -/
noncomputable def chartEndomorphismAt (p : M) (J : E → E →L[ℝ] E) :
    TangentSpace I p →L[ℝ] TangentSpace I p :=
  let e := centeredChartTangentEquiv (I := I) p
  e.symm.toContinuousLinearMap.comp ((J (extChartAt I p p)).comp e.toContinuousLinearMap)

omit [FiniteDimensional ℝ E] [I.Boundaryless] in
private theorem centeredChartTangentEquiv_chartEndomorphismAt (p : M)
    (J : E → E →L[ℝ] E) (u : TangentSpace I p) :
    centeredChartTangentEquiv (I := I) p (chartEndomorphismAt (I := I) p J u) =
      J (extChartAt I p p) (centeredChartTangentEquiv (I := I) p u) := by
  let e := centeredChartTangentEquiv (I := I) p
  change e (e.symm _) = _
  exact e.apply_symm_apply _

/-- Curvature of the actual metric commutes at the chart center with an
endomorphism that is parallel on the supplied open chart neighborhood. -/
theorem chartRiemannCLM_commutes_of_parallelOn (g : SmoothRiemannianMetric I M)
    (p : M) (J : E → E →L[ℝ] E) {Ω : Set E} (hΩ : IsOpen Ω)
    (hΩchart : Ω ⊆ (extChartAt I p).target) (hp : extChartAt I p p ∈ Ω)
    (hJ : ContDiffOn ℝ 2 J Ω)
    (hParallel : ∀ y ∈ Ω, ∀ X u,
      bundleMapCovDeriv (metricChartConnectionForm g p) (metricChartConnectionForm g p) J y X u = 0)
    (X Y Z : TangentSpace I p) :
    chartRiemannCLM g p X Y (chartEndomorphismAt (I := I) p J Z) =
      chartEndomorphismAt (I := I) p J (chartRiemannCLM g p X Y Z) := by
  let z := extChartAt I p p
  let e := centeredChartTangentEquiv (I := I) p
  let Γ := metricChartConnectionForm g p
  have hInterior : z ∈ interior (extChartAt I p).target :=
    interior_maximal hΩchart hΩ hp
  have hΓ : DifferentiableAt ℝ Γ z := metricChartConnectionForm_differentiableAt g p hInterior
  have hCurv (u : TangentSpace I p) :
      connectionFormCurvature Γ z (e X) (e Y) (e u) = e (chartRiemannCLM g p X Y u) := by
    dsimp only [Γ, metricChartConnectionForm, z, e]
    rw [connectionFormCurvature_chartConnectionBilin]
    simp only [ContinuousLinearEquiv.symm_apply_apply]
  have hComm := connectionFormCurvature_commutes_of_parallelOn hΩ hp hΓ hJ hParallel
    (e X) (e Y) (e Z)
  apply e.injective
  rw [← hCurv, centeredChartTangentEquiv_chartEndomorphismAt,
    centeredChartTangentEquiv_chartEndomorphismAt, ← hCurv]
  exact hComm

variable [T2Space M]

/-- Write the actual curvature commutation in an orthonormal frame
diagonalizing the endomorphism at the chart center. -/
theorem metricCurvatureFrameTensor_commutes_of_parallelOn
    (g : SmoothRiemannianMetric I M) (o : ManifoldOrientation I M 4) (p : M)
    (frame : OrientedOrthonormalFrameAt g o p) (J : E → E →L[ℝ] E)
    {Ω : Set E} (hΩ : IsOpen Ω) (hΩchart : Ω ⊆ (extChartAt I p).target)
    (hp : extChartAt I p p ∈ Ω) (hJ : ContDiffOn ℝ 2 J Ω)
    (hParallel : ∀ y ∈ Ω, ∀ X u,
      bundleMapCovDeriv (metricChartConnectionForm g p) (metricChartConnectionForm g p) J y X u = 0)
    (eigenvalue : Fin 4 → ℝ)
    (hDiagonal : ∀ i, chartEndomorphismAt (I := I) p J (frame.basis i) = eigenvalue i • frame.basis i)
    (i j u v : Fin 4) :
    let R := metricCurvatureFrameTensor g o p frame
    R i j u v * eigenvalue v = eigenvalue u * R i j u v := by
  let S := chartEndomorphismAt (I := I) p J
  let L := (g.inner p).flip (frame.basis u)
  have hLinear : (L.comp S).toLinearMap = (eigenvalue u • L).toLinearMap := by
    apply frame.basis.ext
    intro k
    change g.inner p (S (frame.basis k)) (frame.basis u) =
      eigenvalue u * g.inner p (frame.basis k) (frame.basis u)
    rw [hDiagonal k, map_smul, smul_apply, smul_eq_mul, frame.orthonormal]
    by_cases hku : k = u <;> simp [hku]
  have hPair (w : TangentSpace I p) :
      g.inner p (S w) (frame.basis u) = eigenvalue u * g.inner p w (frame.basis u) :=
    LinearMap.congr_fun hLinear w
  let V := chartRiemannCLM g p (frame.basis i) (frame.basis j) (frame.basis v)
  have hComm : eigenvalue v • V = S V := by
    have h := chartRiemannCLM_commutes_of_parallelOn g p J hΩ hΩchart hp hJ hParallel
      (frame.basis i) (frame.basis j) (frame.basis v)
    rw [hDiagonal v, map_smul] at h
    exact h
  have hEntry : metricCurvatureFrameTensor g o p frame i j u v =
      g.inner p V (frame.basis u) := by
    let : CompleteSpace E := FiniteDimensional.complete ℝ E
    change metricRm04StandardAt g p (frame.basis i) (frame.basis j)
      (frame.basis v) (frame.basis u) = _
    rw [metricRm04StandardAt_eq_chartRiemannCLM]
    exact g.symm p _ _
  have h := congrArg (fun w => g.inner p w (frame.basis u)) hComm
  rw [map_smul, smul_apply, smul_eq_mul, hPair] at h
  dsimp only
  rw [hEntry, mul_comm (g.inner p V (frame.basis u)) (eigenvalue v)]
  exact h

/-- A chart realization of a parallel endomorphism with the saturated
principal shape spectrum contradicts the actual mixed Gauss curvature. -/
theorem saturatedPrincipalFrame_noParallelShapeInChart
    {g : SmoothRiemannianMetric I M} {F : IsometricHypersurface g}
    {o : ManifoldOrientation I M 4} {p : M} (P : PrincipalFrameAt F o p)
    {a : ℝ} (ha : 0 < a) (hSpectrum : P.curvature = ![-a, -a, a, a])
    (J : E → E →L[ℝ] E) {Ω : Set E} (hΩ : IsOpen Ω)
    (hΩchart : Ω ⊆ (extChartAt I p).target) (hp : extChartAt I p p ∈ Ω)
    (hJ : ContDiffOn ℝ 2 J Ω)
    (hParallel : ∀ y ∈ Ω, ∀ X u,
      bundleMapCovDeriv (metricChartConnectionForm g p) (metricChartConnectionForm g p) J y X u = 0)
    (hDiagonal : ∀ i, chartEndomorphismAt (I := I) p J (P.frame.basis i) =
      (saturatedPrincipalSign i * a) • P.frame.basis i) : False := by
  apply saturatedPrincipalFrame_noCurvatureCommutation P ha hSpectrum
  exact metricCurvatureFrameTensor_commutes_of_parallelOn g o p P.frame J
    hΩ hΩchart hp hJ hParallel (fun i => saturatedPrincipalSign i * a) hDiagonal

end Metric
end SmoothPoincare
