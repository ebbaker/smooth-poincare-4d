import FirstOrderTwistor.SpinLeviCivita
import FirstOrderTwistor.SpinNormalGauge
import FirstOrderTwistor.SpinTwistorDerivative

/-! # Clifford coefficients in an aligned normal coordinate chart -/

namespace FirstOrderTwistor

open scoped Quaternion Matrix.Norms.Elementwise

/-- In the Dirac contraction, the coefficients of the orthonormal frame
vectors in the coordinate basis multiply the positive-to-negative symbols. -/
noncomputable def normalChartDiracSymbol
    (U : EuclideanFour → Matrix (Fin 4) (Fin 4) ℝ) (k : Fin 4)
    (y : EuclideanFour) : ℍ[ℝ] :=
  ∑ a, U y k a • positiveCliffordVector a

/-- Clifford multiplication by the coordinate tangent vector uses its
coefficients in the orthonormal frame and acts from the negative half. -/
noncomputable def normalChartTwistorSymbol
    (V : EuclideanFour → Matrix (Fin 4) (Fin 4) ℝ) (j : Fin 4)
    (y : EuclideanFour) : ℍ[ℝ] :=
  ∑ a, V y a j • negativeCliffordVector a

private theorem normalChartMatrixEntry_hasFDerivAt_zero
    {W : EuclideanFour → Matrix (Fin 4) (Fin 4) ℝ} {x : EuclideanFour}
    (hW : HasFDerivAt (𝕜 := ℝ) W 0 x) (i j : Fin 4) :
    HasFDerivAt (𝕜 := ℝ) (fun y => W y i j) 0 x := by
  let entry : Matrix (Fin 4) (Fin 4) ℝ →L[ℝ] ℝ :=
    (ContinuousLinearMap.proj (R := ℝ) (φ := fun _ : Fin 4 => ℝ) j).comp
      (ContinuousLinearMap.proj (R := ℝ) (φ := fun _ : Fin 4 => Fin 4 → ℝ) i)
  change HasFDerivAt (𝕜 := ℝ) (entry ∘ W) 0 x
  have hZero : entry.comp (0 : EuclideanFour →L[ℝ] Matrix (Fin 4) (Fin 4) ℝ) = 0 :=
    ContinuousLinearMap.comp_zero _
  rw [← hZero]
  exact entry.hasFDerivAt.comp x hW

/-- The upper Clifford coefficients are standard and stationary at the center. -/
theorem normalChartDiracSymbol_at_center
    {U : EuclideanFour → Matrix (Fin 4) (Fin 4) ℝ} {x : EuclideanFour}
    (hUone : U x = 1) (hUzero : HasFDerivAt (𝕜 := ℝ) U 0 x) (k : Fin 4) :
    HasFDerivAt (𝕜 := ℝ) (normalChartDiracSymbol U k) 0 x ∧
      normalChartDiracSymbol U k x = positiveCliffordVector k := by
  refine ⟨?_, ?_⟩
  · have hSummand (a : Fin 4) :
        HasFDerivAt (𝕜 := ℝ) (fun y => U y k a • positiveCliffordVector a) 0 x := by
      simpa only [ContinuousLinearMap.zero_smulRight] using
        (normalChartMatrixEntry_hasFDerivAt_zero hUzero k a).smul_const (positiveCliffordVector a)
    unfold normalChartDiracSymbol
    have hZero : (∑ _a : Fin 4, (0 : EuclideanFour →L[ℝ] ℍ[ℝ])) = 0 := Finset.sum_const_zero
    rw [← hZero]
    exact HasFDerivAt.fun_sum fun a _ => hSummand a
  · simp [normalChartDiracSymbol, hUone, Matrix.one_apply]

/-- The lower Clifford coefficients are standard and stationary at the center. -/
theorem normalChartTwistorSymbol_at_center
    {V : EuclideanFour → Matrix (Fin 4) (Fin 4) ℝ} {x : EuclideanFour}
    (hVone : V x = 1) (hVzero : HasFDerivAt (𝕜 := ℝ) V 0 x) (j : Fin 4) :
    HasFDerivAt (𝕜 := ℝ) (normalChartTwistorSymbol V j) 0 x ∧
      normalChartTwistorSymbol V j x = negativeCliffordVector j := by
  refine ⟨?_, ?_⟩
  · have hSummand (a : Fin 4) :
        HasFDerivAt (𝕜 := ℝ) (fun y => V y a j • negativeCliffordVector a) 0 x := by
      simpa only [ContinuousLinearMap.zero_smulRight] using
        (normalChartMatrixEntry_hasFDerivAt_zero hVzero a j).smul_const (negativeCliffordVector a)
    unfold normalChartTwistorSymbol
    have hZero : (∑ _a : Fin 4, (0 : EuclideanFour →L[ℝ] ℍ[ℝ])) = 0 := Finset.sum_const_zero
    rw [← hZero]
    exact HasFDerivAt.fun_sum fun a _ => hSummand a
  · simp [normalChartTwistorSymbol, hVone, Matrix.one_apply]

open DifferentialGeometry DifferentialGeometry.Geometry.Riemannian.Geodesic
open DifferentialGeometry.Tensor.Coordinates
open scoped Manifold ContDiff Topology

/-- The differentiated twistor norm identity in an aligned normal chart of the
actual metric. In a spin gauge, `U` has the coordinate columns of an oriented
orthonormal frame near the center and `V` is its inverse. Equivalently the
columns satisfy `Uᵀ G U = I` for the chart metric matrix `G`, with the chosen
orientation. The quaternionic field `ψ` represents the half-spinor in a local
positive spin lift of that frame. The algebra below uses the local inverse and
the first jet of `U`. The chart alignment and vanishing Christoffel symbols
identify the curvature and remove the coordinate covector connection at the
center. -/
theorem metricNormalChartTwistorDefect
    {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ EuclideanFour H}
    [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [I.Boundaryless] [T2Space M]
    (g : SmoothRiemannianMetric I M) (o : ManifoldOrientation I M 4)
    (p : M) (frame : OrientedOrthonormalFrameAt g o p)
    {U V : EuclideanFour → Matrix (Fin 4) (Fin 4) ℝ} {ψ : EuclideanFour → ℍ[ℝ]}
    (hAligned : ∀ i, centeredChartTangentEquiv (I := I) p (frame.basis i) =
      EuclideanSpace.single i 1)
    (hNormal : ∀ u v, chartChristoffelContraction g p u v (extChartAt I p p) = 0)
    (hψ : ContDiffAt ℝ 2 ψ (extChartAt I p p))
    (hU : ContDiffAt ℝ 2 U (extChartAt I p p)) (hV : DifferentiableAt ℝ V (extChartAt I p p))
    (hUone : U (extChartAt I p p) = 1) (hUzero : HasFDerivAt (𝕜 := ℝ) U 0 (extChartAt I p p))
    (hInv : (fun y => V y * U y) =ᶠ[𝓝 (extChartAt I p p)] fun _ => 1) :
    let x := extChartAt I p p
    let A := leviCivitaCoordinateMatrices g p
    let Γ := fun i y => spinConnectionLift (spinNormalGaugeConnection A U V i y)
    let T := coordinateTwistorComponent (normalChartDiracSymbol U) (normalChartTwistorSymbol V)
      (fun k => spinCovariantDerivative Γ k ψ)
    let curl := selfDualAlternation fun i j => spinCovariantDerivative Γ i (T j) x -
      ∑ k, A i x k j • T k x
    (∑ a, Quaternion.normSq (selfDualCliffordProjection curl a)) =
      (1 / 2 : ℝ) * SectionsAndConnections.hilbertSchmidtSq (geometricChiralBlock g o p frame) *
        Quaternion.normSq (ψ x) := by
  obtain ⟨hVone, hVzero⟩ :=
    spinNormalGauge_inverse_firstJet hUzero.differentiableAt hV hUone hUzero.fderiv hInv
  have hVDerivative : HasFDerivAt (𝕜 := ℝ) V 0 (extChartAt I p p) :=
    hVzero ▸ hV.hasFDerivAt
  obtain ⟨hAzero, hAdiff, hCurvature⟩ := spinNormalGauge_leviCivita_at_center g o p frame
    hAligned hNormal hU hV hUone hUzero.fderiv hInv
  dsimp only
  simp only [leviCivitaCoordinateMatrices_eq_zero_at_normalCenter g p hNormal,
    Matrix.zero_apply, zero_smul, Finset.sum_const_zero, sub_zero]
  exact metricCoordinateTwistorDefect g o p frame hψ hAdiff hAzero
    (normalChartDiracSymbol_at_center hUone hUzero)
    (normalChartTwistorSymbol_at_center hVone hVDerivative) hCurvature

end FirstOrderTwistor
