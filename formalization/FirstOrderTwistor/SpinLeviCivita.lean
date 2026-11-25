import DifferentialGeometry.Geometry.Curvature.Coordinates.ChristoffelContraction
import FirstOrderTwistor.SpinCovariantJet

/-!
# Levi–Civita curvature in marked normal coordinates

These coefficients are the real coordinate Christoffel matrices. The
coordinate center is supplied with vanishing Christoffel symbols and the
coordinate directions coincide there with the marked oriented orthonormal
frame. The result identifies their actual matrix curvature at that point.
An orthonormal spin trivialization away from the center requires a further
frame comparison.
-/

open DifferentialGeometry DifferentialGeometry.Geometry.Connection
open DifferentialGeometry.Geometry.Operator DifferentialGeometry.Geometry.Riemannian.Geodesic
open DifferentialGeometry.PDE.RicciFlow.Perelman.KappaSolutions
open DifferentialGeometry.Tensor.Coordinates
open scoped Manifold ContDiff Matrix.Norms.Elementwise

namespace FirstOrderTwistor

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ EuclideanFour H}
    [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [I.Boundaryless]

/-- Raw Christoffel matrices, with column the differentiated vector and row
the output coordinate. The two lower Christoffel slots agree by torsion-freeness. -/
noncomputable def leviCivitaCoordinateMatrices (g : SmoothRiemannianMetric I M) (p : M)
    (i : Fin 4) (x : EuclideanFour) : Matrix (Fin 4) (Fin 4) ℝ :=
  Matrix.of fun a b =>
    (chartChristoffelContraction g p (EuclideanSpace.single b 1) (EuclideanSpace.single i 1) x) a

private theorem chartChristoffelContraction_differentiableAt_center
    (g : SmoothRiemannianMetric I M) (p : M) (u v : EuclideanFour) :
    DifferentiableAt ℝ (chartChristoffelContraction g p u v) (extChartAt I p p) := by
  have hcenter : extChartAt I p p ∈ interior (extChartAt I p).target := by
    rw [(isOpen_extChartAt_target p).interior_eq]
    exact mem_extChartAt_target p
  have hcoeff (i j k : Fin (Module.finrank ℝ EuclideanFour)) :=
    ((chartChristoffel_contDiffOn_interior g p i j k).contDiffAt
      (isOpen_interior.mem_nhds hcenter)).differentiableAt (by simp)
  unfold chartChristoffelContraction
  apply DifferentiableAt.fun_sum
  intro k _
  apply DifferentiableAt.smul_const
  apply DifferentiableAt.fun_sum
  intro i _
  apply DifferentiableAt.fun_sum
  intro j _
  exact ((hcoeff i j k).mul_const _).mul_const _

private theorem leviCivitaCoordinateMatrices_hasFDerivAt_center
    (g : SmoothRiemannianMetric I M) (p : M) (i : Fin 4) :
    HasFDerivAt (leviCivitaCoordinateMatrices g p i)
      (ContinuousLinearMap.pi fun a => ContinuousLinearMap.pi fun b =>
        (EuclideanSpace.proj a).comp (fderiv ℝ
          (chartChristoffelContraction g p (EuclideanSpace.single b 1) (EuclideanSpace.single i 1))
          (extChartAt I p p))) (extChartAt I p p) := by
  change HasFDerivAt (fun x a b => (chartChristoffelContraction g p
    (EuclideanSpace.single b 1) (EuclideanSpace.single i 1) x) a) _ _
  apply hasFDerivAt_pi.mpr
  intro a
  apply hasFDerivAt_pi.mpr
  intro b
  exact (EuclideanSpace.proj a).hasFDerivAt.comp _ (chartChristoffelContraction_differentiableAt_center
    g p (EuclideanSpace.single b 1) (EuclideanSpace.single i 1)).hasFDerivAt

/-- Differentiability of the real coordinate Christoffel matrices at the center. -/
theorem differentiableAt_leviCivitaCoordinateMatrices
    (g : SmoothRiemannianMetric I M) (p : M) (i : Fin 4) :
    DifferentiableAt ℝ (leviCivitaCoordinateMatrices g p i) (extChartAt I p p) :=
  (leviCivitaCoordinateMatrices_hasFDerivAt_center g p i).differentiableAt

omit [I.Boundaryless] in
/-- The Christoffel matrices of a supplied normal chart vanish at its center. -/
theorem leviCivitaCoordinateMatrices_eq_zero_at_normalCenter
    (g : SmoothRiemannianMetric I M) (p : M)
    (hNormal : ∀ u v, chartChristoffelContraction g p u v (extChartAt I p p) = 0)
    (i : Fin 4) : leviCivitaCoordinateMatrices g p i (extChartAt I p p) = 0 := by
  ext a b
  change (chartChristoffelContraction g p (EuclideanSpace.single b 1)
    (EuclideanSpace.single i 1) (extChartAt I p p)) a = 0
  rw [hNormal]
  rfl

/-- In an aligned normal chart, the derivative and product expression
for the real coordinate matrices is the actual metric frame tensor.
The curvature acts on the column vector before pairing with the row vector. -/
theorem spinFrameCoordinateCurvature_leviCivita_normalCenter
    [T2Space M] (g : SmoothRiemannianMetric I M) (o : ManifoldOrientation I M 4)
    (p : M) (frame : OrientedOrthonormalFrameAt g o p)
    (hAligned : ∀ i, centeredChartTangentEquiv (I := I) p (frame.basis i) =
      EuclideanSpace.single i 1)
    (hNormal : ∀ u v, chartChristoffelContraction g p u v (extChartAt I p p) = 0)
    (i j : Fin 4) :
    spinFrameCoordinateCurvature (leviCivitaCoordinateMatrices g p) i j (extChartAt I p p) =
      Matrix.of (metricCurvatureFrameTensor g o p frame i j) := by
  let e := centeredChartTangentEquiv (I := I) p
  have hInv (k : Fin 4) :
      (centeredChartTangentEquiv (I := I) p).symm (EuclideanSpace.single k 1) =
        frame.basis k := by
    rw [← hAligned k]
    exact e.symm_apply_apply _
  have hEntry (v : TangentSpace I p) (a : Fin 4) :
      e v a = g.inner p (frame.basis a) v := by
    have hMap : ((EuclideanSpace.proj a).comp e.toContinuousLinearMap).toLinearMap =
        (g.inner p (frame.basis a)).toLinearMap := by
      apply frame.basis.ext
      intro k
      change e (frame.basis k) a = g.inner p (frame.basis a) (frame.basis k)
      rw [hAligned k, frame.orthonormal]
      simp [PiLp.single_apply]
    exact DFunLike.congr_fun hMap v
  ext a b
  have hCurv := chartRiemannCLM_model_eq_contractions g p
    (EuclideanSpace.single i 1) (EuclideanSpace.single j 1) (EuclideanSpace.single b 1)
  simp only [hInv, hNormal, add_zero, sub_zero] at hCurv
  have hCurvEntry := congrArg (fun v : EuclideanFour => v a) hCurv
  have hPartial (u v : Fin 4) :
      (fderiv ℝ (leviCivitaCoordinateMatrices g p u) (extChartAt I p p)
        (EuclideanSpace.single v 1)) a b =
      (fderiv ℝ (chartChristoffelContraction g p (EuclideanSpace.single b 1)
        (EuclideanSpace.single u 1)) (extChartAt I p p) (EuclideanSpace.single v 1)) a := by
    let coeff : EuclideanFour → Fin 4 → Fin 4 → ℝ := fun t r c =>
      (chartChristoffelContraction g p (EuclideanSpace.single c 1) (EuclideanSpace.single u 1) t) r
    let deriv : EuclideanFour →L[ℝ] (Fin 4 → Fin 4 → ℝ) :=
      ContinuousLinearMap.pi fun r => ContinuousLinearMap.pi fun c =>
        (EuclideanSpace.proj r).comp (fderiv ℝ
          (chartChristoffelContraction g p (EuclideanSpace.single c 1) (EuclideanSpace.single u 1))
          (extChartAt I p p))
    have hDeriv : HasFDerivAt coeff deriv (extChartAt I p p) :=
      leviCivitaCoordinateMatrices_hasFDerivAt_center g p u
    change (fderiv ℝ coeff (extChartAt I p p) (EuclideanSpace.single v 1)) a b = _
    rw [hDeriv.fderiv]
    rfl
  unfold spinFrameCoordinateCurvature
  simp only [leviCivitaCoordinateMatrices_eq_zero_at_normalCenter g p hNormal, zero_mul,
    sub_self, add_zero, Matrix.sub_apply, hPartial, Matrix.of_apply]
  unfold metricCurvatureFrameTensor
  rw [metricRm04StandardAt_eq_chartRiemannCLM, ← hEntry]
  exact hCurvEntry.symm

end FirstOrderTwistor
