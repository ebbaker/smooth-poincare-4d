import FirstOrderTwistor.SpinLeviCivita

/-!
# First-order comparison of normal-coordinate and moving-frame connections

The change of frame and its inverse are supplied. At a normal center with
identity frame matrix and vanishing first frame derivative, the alternating
derivatives of the transformed coefficients recover the coordinate curvature.
-/

open Topology
open scoped Matrix.Norms.Elementwise

namespace FirstOrderTwistor

private abbrev FrameMatrix := Matrix (Fin 4) (Fin 4) ℝ

private noncomputable def frameMatrixMul : FrameMatrix →L[ℝ] FrameMatrix →L[ℝ] FrameMatrix :=
  ((LinearMap.toContinuousLinearMap :
      (FrameMatrix →ₗ[ℝ] FrameMatrix) ≃ₗ[ℝ] FrameMatrix →L[ℝ] FrameMatrix).toLinearMap.comp
    (LinearMap.mul ℝ FrameMatrix)).toContinuousLinearMap

set_option backward.isDefEq.respectTransparency false in
private theorem frameMatrix_hasFDerivAt_mul {F G : EuclideanFour → FrameMatrix}
    {F' G' : EuclideanFour →L[ℝ] FrameMatrix} {x : EuclideanFour}
    (hF : HasFDerivAt F F' x) (hG : HasFDerivAt G G' x) :
    ∃ L : EuclideanFour →L[ℝ] FrameMatrix, HasFDerivAt (fun y => F y * G y) L x ∧
      ∀ w, L w = F x * G' w + F' w * G x := by
  let B := frameMatrixMul
  have hB : HasFDerivAt (⇑B) B (F x) := B.hasFDerivAt
  have hComp : HasFDerivAt (fun y => B (F y)) (B ∘L F') x := hB.comp x hF
  have hMul := hComp.clm_apply hG
  refine ⟨_, hMul, fun w => ?_⟩
  rfl

private theorem frameMatrix_differentiableAt_mul {F G : EuclideanFour → FrameMatrix}
    {x : EuclideanFour} (hF : DifferentiableAt ℝ F x) (hG : DifferentiableAt ℝ G x) :
    DifferentiableAt ℝ (fun y => F y * G y) x := by
  obtain ⟨_, h, _⟩ := frameMatrix_hasFDerivAt_mul hF.hasFDerivAt hG.hasFDerivAt
  exact h.differentiableAt

/-- The product rule in the finite matrix space with the elementwise norm. -/
theorem spinFrameMatrix_fderiv_mul_apply {F G : EuclideanFour → Matrix (Fin 4) (Fin 4) ℝ}
    {x : EuclideanFour} (hF : DifferentiableAt ℝ F x) (hG : DifferentiableAt ℝ G x)
    (w : EuclideanFour) :
    fderiv ℝ (fun y => F y * G y) x w =
      F x * fderiv ℝ G x w + fderiv ℝ F x w * G x := by
  obtain ⟨_, h, hApply⟩ := frameMatrix_hasFDerivAt_mul hF.hasFDerivAt hG.hasFDerivAt
  erw [h.fderiv]
  exact hApply w

private theorem frameMatrix_fderiv_add_apply {F G : EuclideanFour → FrameMatrix}
    {x : EuclideanFour} (hF : DifferentiableAt ℝ F x) (hG : DifferentiableAt ℝ G x)
    (w : EuclideanFour) :
    fderiv ℝ (fun y => F y + G y) x w = fderiv ℝ F x w + fderiv ℝ G x w := by
  erw [fderiv_fun_add hF hG]
  rfl

/-- The coefficients of the connection in the moving frame with columns U and
inverse V. The direction of the connection remains the coordinate direction. -/
noncomputable def spinNormalGaugeConnection
    (A : Fin 4 → EuclideanFour → Matrix (Fin 4) (Fin 4) ℝ)
    (U V : EuclideanFour → Matrix (Fin 4) (Fin 4) ℝ)
    (i : Fin 4) (x : EuclideanFour) : Matrix (Fin 4) (Fin 4) ℝ :=
  V x * (A i x * U x) + V x * fderiv ℝ U x (EuclideanSpace.single i 1)

/-- At the normal center the transformed coefficients vanish. Their derivative
differs from the coordinate derivative by the Hessian of the frame matrix. -/
theorem spinNormalGauge_firstJet
    {A : Fin 4 → EuclideanFour → Matrix (Fin 4) (Fin 4) ℝ}
    {U V : EuclideanFour → Matrix (Fin 4) (Fin 4) ℝ} {x : EuclideanFour}
    (hA : ∀ i, DifferentiableAt ℝ (A i) x) (hU : ContDiffAt ℝ 2 U x)
    (hV : DifferentiableAt ℝ V x) (hAzero : ∀ i, A i x = 0)
    (hUone : U x = 1) (hVone : V x = 1) (hUzero : fderiv ℝ U x = 0) :
    (∀ i, spinNormalGaugeConnection A U V i x = 0) ∧
    (∀ i, DifferentiableAt ℝ (spinNormalGaugeConnection A U V i) x) ∧
    (∀ i w, fderiv ℝ (spinNormalGaugeConnection A U V i) x w =
      fderiv ℝ (A i) x w + fderiv ℝ (fderiv ℝ U) x w (EuclideanSpace.single i 1)) := by
  have hUdiff := hU.differentiableAt (by norm_num)
  have hUderiv := (hU.fderiv_right (m := 1) (by norm_num)).differentiableAt one_ne_zero
  let dU (i : Fin 4) (y : EuclideanFour) := fderiv ℝ U y (EuclideanSpace.single i 1)
  have hdU (i : Fin 4) : DifferentiableAt ℝ (dU i) x :=
    hUderiv.clm_apply (differentiableAt_const _)
  have hAU (i : Fin 4) : DifferentiableAt ℝ (fun y => A i y * U y) x :=
    frameMatrix_differentiableAt_mul (hA i) hUdiff
  have hVAU (i : Fin 4) : DifferentiableAt ℝ (fun y => V y * (A i y * U y)) x :=
    frameMatrix_differentiableAt_mul hV (hAU i)
  have hVdU (i : Fin 4) : DifferentiableAt ℝ (fun y => V y * dU i y) x :=
    frameMatrix_differentiableAt_mul hV (hdU i)
  refine ⟨fun i => ?_, fun i => (hVAU i).add (hVdU i), fun i w => ?_⟩
  · simp [spinNormalGaugeConnection, hAzero, hUzero]
  · change fderiv ℝ (fun y => V y * (A i y * U y) + V y * dU i y) x w = _
    erw [frameMatrix_fderiv_add_apply (hVAU i) (hVdU i),
      spinFrameMatrix_fderiv_mul_apply hV (hAU i),
      spinFrameMatrix_fderiv_mul_apply (hA i) hUdiff,
      spinFrameMatrix_fderiv_mul_apply hV (hdU i)]
    have hdUvalue : dU i x = 0 := by simp [dU, hUzero]
    have hdUderivative : fderiv ℝ (dU i) x w =
        fderiv ℝ (fderiv ℝ U) x w (EuclideanSpace.single i 1) := by
      unfold dU
      erw [fderiv_clm_apply hUderiv (differentiableAt_const (EuclideanSpace.single i 1))]
      simp
      rfl
    simp [hAzero, hUone, hVone, hdUvalue, hdUderivative]

/-- Hessian symmetry cancels the change-of-frame contribution to the curvature
at the normal center. The proof uses the first-order conditions at the center.
In the geometric application V is the inverse frame matrix near the center. -/
theorem spinNormalGauge_at_center
    {A : Fin 4 → EuclideanFour → Matrix (Fin 4) (Fin 4) ℝ}
    {U V : EuclideanFour → Matrix (Fin 4) (Fin 4) ℝ} {x : EuclideanFour}
    (hA : ∀ i, DifferentiableAt ℝ (A i) x) (hU : ContDiffAt ℝ 2 U x)
    (hV : DifferentiableAt ℝ V x) (hAzero : ∀ i, A i x = 0)
    (hUone : U x = 1) (hVone : V x = 1) (hUzero : fderiv ℝ U x = 0) :
    (∀ i, spinNormalGaugeConnection A U V i x = 0) ∧
    (∀ i, DifferentiableAt ℝ (spinNormalGaugeConnection A U V i) x) ∧
    (∀ i j, spinFrameCoordinateCurvature (spinNormalGaugeConnection A U V) i j x =
      spinFrameCoordinateCurvature A i j x) := by
  obtain ⟨hzero, hdiff, hderiv⟩ := spinNormalGauge_firstJet hA hU hV hAzero hUone hVone hUzero
  refine ⟨hzero, hdiff, fun i j => ?_⟩
  have hsymm := hU.isSymmSndFDerivAt (by simp)
  simp only [spinFrameCoordinateCurvature, hzero, hAzero, mul_zero, sub_self, add_zero, hderiv]
  erw [hsymm.eq (EuclideanSpace.single i 1) (EuclideanSpace.single j 1), add_sub_add_right_eq_sub]

/-- A differentiable inverse of a normalized frame matrix has the same identity
value and zero first derivative. Only a neighborhood of the center is needed
for the inverse relation. -/
theorem spinNormalGauge_inverse_firstJet
    {U V : EuclideanFour → Matrix (Fin 4) (Fin 4) ℝ} {x : EuclideanFour}
    (hU : DifferentiableAt ℝ U x) (hV : DifferentiableAt ℝ V x)
    (hUone : U x = 1) (hUzero : fderiv ℝ U x = 0)
    (hInverse : (fun y => V y * U y) =ᶠ[𝓝 x] fun _ => 1) :
    V x = 1 ∧ fderiv ℝ V x = 0 := by
  have hVone : V x = 1 := by simpa only [hUone, mul_one] using hInverse.self_of_nhds
  have hProduct : fderiv ℝ (fun y => V y * U y) x = 0 := by
    erw [hInverse.fderiv_eq]
    simp
  refine ⟨hVone, ContinuousLinearMap.ext fun w => ?_⟩
  have h := spinFrameMatrix_fderiv_mul_apply hV hU w
  erw [hProduct, hUzero, hUone] at h
  simpa using h.symm

open DifferentialGeometry DifferentialGeometry.Geometry.Connection
open DifferentialGeometry.Geometry.Riemannian.Geodesic
open DifferentialGeometry.PDE.RicciFlow.Perelman.KappaSolutions
open DifferentialGeometry.Tensor.Coordinates
open scoped Manifold ContDiff

/-- In the supplied aligned normal chart, the transformed Levi–Civita
coefficients have the metric curvature of the marked frame at the center.
U and V are the supplied frame and inverse on the chart. The assumptions
refer to their first jets and the center of the chosen chart. -/
theorem spinNormalGauge_leviCivita_at_center
    {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ EuclideanFour H}
    [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [I.Boundaryless] [T2Space M]
    (g : SmoothRiemannianMetric I M) (o : ManifoldOrientation I M 4)
    (p : M) (frame : OrientedOrthonormalFrameAt g o p)
    (hAligned : ∀ i, centeredChartTangentEquiv (I := I) p (frame.basis i) =
      EuclideanSpace.single i 1)
    (hNormal : ∀ u v, chartChristoffelContraction g p u v (extChartAt I p p) = 0)
    {U V : EuclideanFour → Matrix (Fin 4) (Fin 4) ℝ}
    (hU : ContDiffAt ℝ 2 U (extChartAt I p p)) (hV : DifferentiableAt ℝ V (extChartAt I p p))
    (hUone : U (extChartAt I p p) = 1) (hUzero : fderiv ℝ U (extChartAt I p p) = 0)
    (hInverse : (fun y => V y * U y) =ᶠ[𝓝 (extChartAt I p p)] fun _ => 1) :
    let x := extChartAt I p p
    let A := spinNormalGaugeConnection (leviCivitaCoordinateMatrices g p) U V
    (∀ i, A i x = 0) ∧ (∀ i, DifferentiableAt ℝ (A i) x) ∧
    (∀ i j, spinFrameCoordinateCurvature A i j x =
      Matrix.of (metricCurvatureFrameTensor g o p frame i j)) := by
  obtain ⟨hVone, _⟩ :=
    spinNormalGauge_inverse_firstJet (hU.differentiableAt (by norm_num)) hV hUone hUzero hInverse
  obtain ⟨hzero, hdiff, hcurvature⟩ :=
    spinNormalGauge_at_center (differentiableAt_leviCivitaCoordinateMatrices g p) hU hV
      (leviCivitaCoordinateMatrices_eq_zero_at_normalCenter g p hNormal) hUone hVone hUzero
  exact ⟨hzero, hdiff, fun i j => (hcurvature i j).trans
    (spinFrameCoordinateCurvature_leviCivita_normalCenter g o p frame hAligned hNormal i j)⟩

end FirstOrderTwistor
