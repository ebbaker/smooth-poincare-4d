import FirstOrderTwistor.SpinCovariantJet
import FirstOrderTwistor.SpinNormalFrame

/-! # Differentiating the twistor operator in a supplied normal spin gauge -/

namespace FirstOrderTwistor
open scoped Quaternion Matrix.Norms.Elementwise

/-- Coordinate components of Pψ from Uⱼ=∇ⱼψ. The upper Clifford coefficients in
the Dirac contraction include the inverse metric, and the lower coefficients
act from the negative half to the positive half. -/
noncomputable def coordinateTwistorComponent
    (upper lower U : Fin 4 → EuclideanFour → ℍ[ℝ]) (j : Fin 4) (x : EuclideanFour) : ℍ[ℝ] :=
  U j x + (1 / 4 : ℝ) • (lower j x * ∑ k, upper k x * U k x)

private theorem partial_mul_at_normal_symbol {a b : EuclideanFour → ℍ[ℝ]}
    {x : EuclideanFour} (ha : HasFDerivAt (𝕜 := ℝ) a 0 x) (hb : DifferentiableAt ℝ b x) (i : Fin 4) :
    spinCoordinatePartial (fun y => a y * b y) i x = a x * spinCoordinatePartial b i x := by
  unfold spinCoordinatePartial
  rw [fderiv_fun_mul' ha.differentiableAt hb, ha.fderiv]
  simp

/-- Differentiate the coordinate definition of P at a point where the first
derivatives of the Clifford symbols vanish. -/
theorem coordinateTwistorComponent_partial
    {upper lower U : Fin 4 → EuclideanFour → ℍ[ℝ]} {x : EuclideanFour}
    (hupper : ∀ k, HasFDerivAt (𝕜 := ℝ) (upper k) 0 x) (hlower : ∀ j, HasFDerivAt (𝕜 := ℝ) (lower j) 0 x)
    (hU : ∀ k, DifferentiableAt ℝ (U k) x) (i j : Fin 4) :
    spinCoordinatePartial (coordinateTwistorComponent upper lower U j) i x =
      spinCoordinatePartial (U j) i x + (1 / 4 : ℝ) •
        (lower j x * ∑ k, upper k x * spinCoordinatePartial (U k) i x) := by
  let D := fun y => ∑ k, upper k y * U k y
  have hprod (k : Fin 4) : DifferentiableAt ℝ (fun y => upper k y * U k y) x := (hupper k).differentiableAt.mul (hU k)
  have hD : DifferentiableAt ℝ D x := DifferentiableAt.fun_sum fun k _ => hprod k
  have hsum : spinCoordinatePartial D i x = ∑ k, upper k x * spinCoordinatePartial (U k) i x := by
    change (fderiv ℝ (fun y => ∑ k, upper k y * U k y) x) (EuclideanSpace.single i 1) = _
    rw [fderiv_fun_sum (u := Finset.univ) (A := fun k y => upper k y * U k y) (fun k _ => hprod k), sum_apply]
    exact Finset.sum_congr rfl fun k _ => partial_mul_at_normal_symbol (hupper k) (hU k) i
  have hmult : DifferentiableAt ℝ (fun y => lower j y * D y) x := (hlower j).differentiableAt.mul hD
  change (fderiv ℝ (fun y => U j y + (1 / 4 : ℝ) • (lower j y * D y)) x)
    (EuclideanSpace.single i 1) = _
  have hscaled : DifferentiableAt ℝ (fun y => (1 / 4 : ℝ) • (lower j y * D y)) x := hmult.const_smul (1 / 4 : ℝ)
  rw [fderiv_fun_add (hU j) hscaled, fderiv_fun_const_smul hmult]
  change spinCoordinatePartial (U j) i x +
    (1 / 4 : ℝ) • spinCoordinatePartial (fun y => lower j y * D y) i x = _
  rw [partial_mul_at_normal_symbol (hlower j) hD i, hsum]

/-- The projected covariant curl of the *differentiated* coordinate twistor
operator in a supplied normal gauge. The curvature of the supplied connection
must match the chosen curvature tensor in the positive spin lift. -/
theorem projectedCoordinateTwistorCurl
    {Γ upper lower : Fin 4 → EuclideanFour → ℍ[ℝ]} {ψ : EuclideanFour → ℍ[ℝ]}
    {x : EuclideanFour} (hψ : ContDiffAt ℝ 2 ψ x)
    (hΓ : ∀ j, DifferentiableAt ℝ (Γ j) x) (hnormal : ∀ j, Γ j x = 0)
    (hupper : ∀ j, HasFDerivAt (𝕜 := ℝ) (upper j) 0 x ∧ upper j x = positiveCliffordVector j)
    (hlower : ∀ j, HasFDerivAt (𝕜 := ℝ) (lower j) 0 x ∧ lower j x = negativeCliffordVector j)
    {R : CurvatureFrameTensor} (hsym : (selfDualCurvatureBlock R).IsSymm)
    (hcurv : ∀ i j, spinCoordinateCurvature Γ i j x =
      (-1 / 2 : ℝ) • frameCurvatureQuaternion R i j) :
    selfDualCliffordProjection (selfDualAlternation (fun i j =>
      spinCovariantDerivative Γ i
        (coordinateTwistorComponent upper lower (fun k => spinCovariantDerivative Γ k ψ) j) x)) =
      weylSpinDefect (traceFreeChiralBlock (selfDualCurvatureBlock R)) (ψ x) := by
  let U j := spinCovariantDerivative Γ j ψ
  let B i j := spinCovariantDerivative Γ i (U j) x
  have hU j : DifferentiableAt ℝ (U j) x := by
    have hd := ((hψ.fderiv_right (m := 1) (by norm_num)).clm_apply
      (contDiffAt_const (c := EuclideanSpace.single j 1))).differentiableAt one_ne_zero
    exact hd.add ((hΓ j).mul (hψ.differentiableAt (by norm_num)))
  have hB : SpinFrameCommutator R (ψ x) B := by
    intro i j
    rw [show B i j - B j i = spinCoordinateCurvature Γ i j x * ψ x from
      spinCovariantDerivative_commutator hψ i j (hΓ i) (hΓ j), hcurv, smul_mul_assoc]
  have hD (i j : Fin 4) : spinCovariantDerivative Γ i
      (coordinateTwistorComponent upper lower U j) x =
      B i j + (1 / 4 : ℝ) • (negativeCliffordVector j *
        ∑ k, positiveCliffordVector k * B i k) := by
    simp only [B, spinCovariantDerivative, hnormal, zero_mul, add_zero]
    rw [coordinateTwistorComponent_partial (fun k => (hupper k).1) (fun k => (hlower k).1) hU]
    simp only [(hlower j).2, fun k => (hupper k).2]
  rw [show (fun i j => spinCovariantDerivative Γ i
      (coordinateTwistorComponent upper lower (fun k => spinCovariantDerivative Γ k ψ) j) x) =
      (B + fun i j => (1 / 4 : ℝ) • (negativeCliffordVector j *
        ∑ k, positiveCliffordVector k * B i k)) from funext fun i => funext fun j => hD i j]
  exact projectedFrameTwistorCurl hB hsym

open DifferentialGeometry
open scoped Manifold ContDiff

/-- The squared projected curl for coordinate fields in a supplied normal chart
of an actual metric. Input frame curvature components use the Riemann operator
convention, and derivatives of both Clifford symbols vanish at the marked point. -/
theorem metricCoordinateTwistorDefect
    {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
    [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
    [BoundarylessManifold I M] (g : SmoothRiemannianMetric I M) (o : ManifoldOrientation I M 4)
    (p : M) (frame : OrientedOrthonormalFrameAt g o p)
    {A : Fin 4 → EuclideanFour → Matrix (Fin 4) (Fin 4) ℝ}
    {upper lower : Fin 4 → EuclideanFour → ℍ[ℝ]} {ψ : EuclideanFour → ℍ[ℝ]} {x : EuclideanFour}
    (hψ : ContDiffAt ℝ 2 ψ x) (hA : ∀ j, DifferentiableAt ℝ (A j) x)
    (hnormal : ∀ j, A j x = 0)
    (hupper : ∀ j, HasFDerivAt (𝕜 := ℝ) (upper j) 0 x ∧ upper j x = positiveCliffordVector j)
    (hlower : ∀ j, HasFDerivAt (𝕜 := ℝ) (lower j) 0 x ∧ lower j x = negativeCliffordVector j)
    (hR : ∀ i j, spinFrameCoordinateCurvature A i j x =
      Matrix.of (metricCurvatureFrameTensor g o p frame i j)) :
    let Γ := fun j y => spinConnectionLift (A j y)
    let U := fun k => spinCovariantDerivative Γ k ψ
    let curl := selfDualAlternation fun i j =>
      spinCovariantDerivative Γ i (coordinateTwistorComponent upper lower U j) x
    (∑ a, Quaternion.normSq (selfDualCliffordProjection curl a)) =
      (1 / 2 : ℝ) * SectionsAndConnections.hilbertSchmidtSq (geometricChiralBlock g o p frame) *
        Quaternion.normSq (ψ x) := by
  let Γ := fun j y => spinConnectionLift (A j y)
  let lift := spinConnectionLift.toContinuousLinearMap
  have hΓ j : DifferentiableAt ℝ (Γ j) x :=
    (lift.hasFDerivAt.comp x (hA j).hasFDerivAt).differentiableAt
  have hΓzero j : Γ j x = 0 := by simp [Γ, hnormal]
  have hskew j (a b : Fin 4) : A j x b a = -A j x a b := by simp [hnormal]
  have hcurv i j : spinCoordinateCurvature Γ i j x =
      (-1 / 2 : ℝ) • frameCurvatureQuaternion (metricCurvatureFrameTensor g o p frame) i j := by
    rw [spinCoordinateCurvature_connectionLift i j hA hskew, hR]
    rfl
  exact (congrArg (fun t : Fin 3 → ℍ[ℝ] => ∑ a, Quaternion.normSq (t a))
    (projectedCoordinateTwistorCurl hψ hΓ hΓzero hupper hlower
      (selfDualCurvatureBlock_metric_isSymm g o p frame) hcurv)).trans (weylSpinDefect_normSq _ _)

end FirstOrderTwistor
