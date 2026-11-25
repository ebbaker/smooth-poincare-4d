import FirstOrderTwistor.SpinRegularizedEstimate
import FirstOrderTwistor.SpinProjectedHessian
import FirstOrderTwistor.SpinTwistedSquare
import Mathlib.Analysis.Calculus.FDeriv.WithLp

/-!
# Local spin germs in the regularized Bochner estimate

FOT-E18u, 25 November 2026, prepared for Edward B. Baker III with OpenAI
Codex assistance. Serving model and effort are unavailable. Checkout `5ff7014`.
Uses the tensor-connection and Clifford conventions of MATCH-E11 (2)–(5).
-/

namespace FirstOrderTwistor

open scoped Quaternion Matrix.Norms.Elementwise Topology

noncomputable section

/-- A covector with quaternionic spin coefficients in an orthonormal frame. -/
abbrev SpinFrameCovector := PiLp 2 (fun _ : Fin 4 => ℍ[ℝ])

/-- Two ordered cotangent slots in the Hilbert tensor norm. -/
abbrev SpinFrameHessian := PiLp 2 (fun _ : Fin 4 => SpinFrameCovector)

def spinFrameCovectorValue (v : Fin 4 → ℍ[ℝ]) : SpinFrameCovector := WithLp.toLp 2 v

def spinFrameHessianValue (B : Fin 4 → Fin 4 → ℍ[ℝ]) : SpinFrameHessian :=
  WithLp.toLp 2 (fun i => spinFrameCovectorValue (B i))

theorem spinFrameCovectorValue_normSq (v : Fin 4 → ℍ[ℝ]) :
    ‖spinFrameCovectorValue v‖ ^ 2 = ∑ k, Quaternion.normSq (v k) := by
  rw [PiLp.norm_sq_eq_of_L2]
  simp only [spinFrameCovectorValue, WithLp.ofLp_toLp,
    Quaternion.normSq_eq_norm_mul_self, sq]

theorem spinFrameHessianValue_normSq (B : Fin 4 → Fin 4 → ℍ[ℝ]) :
    ‖spinFrameHessianValue B‖ ^ 2 = ∑ i, ∑ k, Quaternion.normSq (B i k) := by
  rw [PiLp.norm_sq_eq_of_L2]
  simp only [spinFrameHessianValue, WithLp.ofLp_toLp, spinFrameCovectorValue_normSq]

/-- A real cotangent vector in the positive-to-negative Clifford representation
acts with its full squared length on the spinor norm. -/
theorem positiveFrameClifford_normSq (d : Fin 4 → ℝ) (ψ : ℍ[ℝ]) :
    Quaternion.normSq ((∑ i, d i • positiveCliffordVector i) * ψ) =
      (∑ i, d i ^ 2) * Quaternion.normSq ψ := by
  rw [map_mul, Quaternion.normSq_def' (∑ i, d i • positiveCliffordVector i)]
  norm_num [positiveCliffordVector, spinUnit, Fin.sum_univ_four, smul_eq_mul]

private theorem euclideanPartial_sum_sq (f : EuclideanFour → ℝ) (x : EuclideanFour) :
    (∑ i, euclideanPartial f i x ^ 2) = ‖fderiv ℝ f x‖ ^ 2 := by
  simpa only [euclideanPartial, EuclideanSpace.basisFun_apply] using
    ((EuclideanSpace.basisFun (Fin 4) ℝ).norm_dual (fderiv ℝ f x)).symm

private theorem spinCovariantDerivative_smul_germ
    (Γ : Fin 4 → EuclideanFour → ℍ[ℝ]) {f : EuclideanFour → ℝ}
    {v : EuclideanFour → ℍ[ℝ]} {x : EuclideanFour}
    (hf : DifferentiableAt ℝ f x) (hv : DifferentiableAt ℝ v x) (i : Fin 4) :
    spinCovariantDerivative Γ i (fun y => f y • v y) x =
      f x • spinCovariantDerivative Γ i v x + euclideanPartial f i x • v x := by
  simp only [spinCovariantDerivative, spinCoordinatePartial, euclideanPartial,
    fderiv_fun_smul hf hv, add_apply, smul_apply,
    ContinuousLinearMap.smulRight_apply, mul_smul_comm, smul_add]
  abel

/-- The differentiated tensor product rule uses the same covector connection
on both sides. It holds even before evaluating at a normal frame center. -/
theorem spinCovectorCovariantDerivative_smul_germ
    (Γ : Fin 4 → EuclideanFour → ℍ[ℝ])
    (A : Fin 4 → EuclideanFour → Matrix (Fin 4) (Fin 4) ℝ)
    {f : EuclideanFour → ℝ} {v : CoordinateSpinCovector} {x : EuclideanFour}
    (hf : DifferentiableAt ℝ f x) (hv : ∀ k, DifferentiableAt ℝ (v k) x) (i k : Fin 4) :
    spinCovectorCovariantDerivative Γ A i (fun k y => f y • v k y) k x =
      f x • spinCovectorCovariantDerivative Γ A i v k x + euclideanPartial f i x • v k x := by
  change spinCovariantDerivative Γ i (fun y => f y • v k y) x -
      (∑ a, A i x a k • (f x • v a x)) =
    f x • (spinCovariantDerivative Γ i (v k) x - (∑ a, A i x a k • v a x)) +
      euclideanPartial f i x • v k x
  rw [spinCovariantDerivative_smul_germ Γ hf (hv k) i, smul_sub, Finset.smul_sum]
  simp_rw [smul_comm (A i x _ k) (f x)]
  abel

/-- The contracted product rule for the ordinary covector-twisted Dirac
operator. The symbol acts on the spin slot of each covector component. -/
theorem coordinateTwistedDirac_smul_germ
    (Γ symbol : Fin 4 → EuclideanFour → ℍ[ℝ])
    (A : Fin 4 → EuclideanFour → Matrix (Fin 4) (Fin 4) ℝ)
    {f : EuclideanFour → ℝ} {v : CoordinateSpinCovector} {x : EuclideanFour}
    (hf : DifferentiableAt ℝ f x) (hv : ∀ k, DifferentiableAt ℝ (v k) x) (k : Fin 4) :
    coordinateTwistedDirac Γ symbol A (fun k y => f y • v k y) k x =
      f x • coordinateTwistedDirac Γ symbol A v k x +
        (∑ i, euclideanPartial f i x • symbol i x) * v k x := by
  simp only [coordinateTwistedDirac, spinCovectorCovariantDerivative_smul_germ Γ A hf hv,
    mul_add, mul_smul_comm, Finset.sum_add_distrib, ← Finset.smul_sum, Finset.sum_mul,
    smul_mul_assoc]

/-- In a normal orthonormal chart, the two cutoff product remainders have
the exact squared norm `|df|² |q|²` in the relevant Hilbert frame spaces.
This is the pointwise product hypothesis of `spinRegularizedEstimate_of_unweighted`. -/
theorem spinCoordinateProductTerms_at_normalCenter
    (Γ symbol : Fin 4 → EuclideanFour → ℍ[ℝ])
    (A : Fin 4 → EuclideanFour → Matrix (Fin 4) (Fin 4) ℝ)
    {f : EuclideanFour → ℝ} {v : CoordinateSpinCovector} {x : EuclideanFour}
    (hf : DifferentiableAt ℝ f x) (hv : ∀ k, DifferentiableAt ℝ (v k) x)
    (hSymbol : ∀ i, symbol i x = positiveCliffordVector i) :
    let q := spinFrameCovectorValue (fun k => v k x)
    let covariant (w : CoordinateSpinCovector) :=
      spinFrameHessianValue (fun i k => spinCovectorCovariantDerivative Γ A i w k x)
    let twisted (w : CoordinateSpinCovector) :=
      spinFrameCovectorValue (fun k => coordinateTwistedDirac Γ symbol A w k x)
    ∃ (eCov : SpinFrameHessian) (eDirac : SpinFrameCovector),
      covariant (fun k y => f y • v k y) = f x • covariant v + eCov ∧
      twisted (fun k y => f y • v k y) = f x • twisted v + eDirac ∧
      ‖eCov‖ ^ 2 = ‖fderiv ℝ f x‖ ^ 2 * ‖q‖ ^ 2 ∧
      ‖eDirac‖ ^ 2 = ‖fderiv ℝ f x‖ ^ 2 * ‖q‖ ^ 2 := by
  let eCov := spinFrameHessianValue (fun i k => euclideanPartial f i x • v k x)
  let eDirac := spinFrameCovectorValue (fun k =>
    (∑ i, euclideanPartial f i x • positiveCliffordVector i) * v k x)
  refine ⟨eCov, eDirac, ?_, ?_, ?_, ?_⟩
  · apply WithLp.ofLp_injective 2
    funext i
    apply WithLp.ofLp_injective 2
    funext k
    exact spinCovectorCovariantDerivative_smul_germ Γ A hf hv i k
  · apply WithLp.ofLp_injective 2
    funext k
    change coordinateTwistedDirac Γ symbol A (fun k y => f y • v k y) k x =
      f x • coordinateTwistedDirac Γ symbol A v k x +
        (∑ i, euclideanPartial f i x • positiveCliffordVector i) * v k x
    simpa only [hSymbol] using coordinateTwistedDirac_smul_germ Γ symbol A hf hv k
  · dsimp only [eCov]
    rw [spinFrameHessianValue_normSq, spinFrameCovectorValue_normSq, ← euclideanPartial_sum_sq]
    simp only [Quaternion.normSq_smul, ← Finset.mul_sum, ← Finset.sum_mul]
  · dsimp only [eDirac]
    rw [spinFrameCovectorValue_normSq, spinFrameCovectorValue_normSq, ← euclideanPartial_sum_sq]
    simp only [positiveFrameClifford_normSq, ← Finset.mul_sum]

private theorem spinCenter_germ_derivative {F : Type*} [NormedAddCommGroup F] [NormedSpace ℝ F]
    {f : EuclideanFour → F} {x : EuclideanFour} (hf : DifferentiableAt ℝ f x) :
    HasFDerivAt (fun y : EuclideanFour => f (x + y)) (fderiv ℝ f x) 0 := by
  let translation (y : EuclideanFour) := x + y
  have ht : HasFDerivAt translation (ContinuousLinearMap.id ℝ EuclideanFour) 0 :=
    (hasFDerivAt_id (𝕜 := ℝ) (0 : EuclideanFour)).const_add x
  have hAt : HasFDerivAt f (fderiv ℝ f x) (translation 0) := by
    simpa only [translation, add_zero] using hf.hasFDerivAt
  change HasFDerivAt (f ∘ translation) (fderiv ℝ f x) 0
  simpa only [ContinuousLinearMap.comp_id] using hAt.comp 0 ht

private theorem spinFamilyCutoff_differentiableAt {ι : Type*} [Fintype ι]
    {ψ : ι → EuclideanFour → ℍ[ℝ]} {χ : EuclideanFour → ℝ} {x : EuclideanFour} {ε : ℝ}
    (hχ : DifferentiableAt ℝ χ x) (hψ : ∀ a, DifferentiableAt ℝ (ψ a) x) (hε : 0 < ε) :
    DifferentiableAt ℝ (fun y => χ y / Real.sqrt ((∑ a, ‖ψ a y‖ ^ 2) + ε)) x := by
  let S (y : EuclideanFour) := ∑ a, ‖ψ a y‖ ^ 2
  have hS : DifferentiableAt ℝ S x :=
    DifferentiableAt.fun_sum fun a _ => ((hψ a).hasFDerivAt.norm_sq).differentiableAt
  have hDen : 0 < S x + ε := add_pos_of_nonneg_of_pos (Finset.sum_nonneg fun _ _ => sq_nonneg _) hε
  have hRoot := ((hS.hasFDerivAt.add_const ε).sqrt hDen.ne').differentiableAt
  have hInv : DifferentiableAt ℝ (fun y => (Real.sqrt (S y + ε))⁻¹) x :=
    ((hasDerivAt_inv (Real.sqrt_pos.2 hDen).ne').comp_hasFDerivAt x hRoot.hasFDerivAt).differentiableAt
  simpa only [div_eq_mul_inv] using hχ.fun_mul hInv

/-- A finite family of actual chart spinors supplies the cutoff jet. The
center is recentered to zero and `PiLp 2` gives the summed squared mass and
the exact summed squared covariant gradient at the normal center. -/
theorem spinNormalCutoffJet_of_coordinateFamily {ι : Type*} [Fintype ι]
    (Γ : Fin 4 → EuclideanFour → ℍ[ℝ]) (ψ : ι → EuclideanFour → ℍ[ℝ])
    {χ : EuclideanFour → ℝ} {x : EuclideanFour}
    (hχ : DifferentiableAt ℝ χ x) (hψ : ∀ a, DifferentiableAt ℝ (ψ a) x)
    (hΓ : ∀ i, Γ i x = 0) :
    let S (y : EuclideanFour) := ∑ a, ‖ψ a y‖ ^ 2
    let Q := ∑ a, ‖spinFrameCovectorValue (fun i => spinCovariantDerivative Γ i (ψ a) x)‖ ^ 2
    SpinNormalCutoffJet (PiLp 2 (fun _ : ι => ℍ[ℝ])) (χ x) (S x) Q ‖fderiv ℝ χ x‖
      (fun ε => ‖fderiv ℝ (fun y => χ y / Real.sqrt (S y + ε)) x‖) := by
  let Ψ (y : EuclideanFour) := WithLp.toLp 2 (fun a => ψ a y)
  have hΨ : DifferentiableAt ℝ Ψ x := (differentiableAt_piLp (𝕜 := ℝ) 2).2 hψ
  have hΨNorm (y : EuclideanFour) : ‖Ψ y‖ ^ 2 = ∑ a, ‖ψ a y‖ ^ 2 := by
    exact PiLp.norm_sq_eq_of_L2 _ _
  have hΨDerivative (a : ι) (v : EuclideanFour) :
      (fderiv ℝ Ψ x v).ofLp a = fderiv ℝ (ψ a) x v := by
    let eval : (PiLp 2 (fun _ : ι => ℍ[ℝ])) →L[ℝ] ℍ[ℝ] :=
      PiLp.proj 2 (fun _ : ι => ℍ[ℝ]) a
    have hComp := (eval.hasFDerivAt.comp x hΨ.hasFDerivAt).fderiv
    change fderiv ℝ (ψ a) x = eval.comp (fderiv ℝ Ψ x) at hComp
    exact congrArg (fun T : EuclideanFour →L[ℝ] ℍ[ℝ] => T v) hComp.symm
  refine ⟨(fun y => χ (x + y)), (fun y => Ψ (x + y)),
    (spinCenter_germ_derivative hχ).differentiableAt, (spinCenter_germ_derivative hΨ).differentiableAt,
    by simp, by simp only [add_zero, hΨNorm], ?_, ?_, ?_⟩
  · rw [(spinCenter_germ_derivative hχ).fderiv]
  · rw [(spinCenter_germ_derivative hΨ).fderiv]
    simp only [PiLp.norm_sq_eq_of_L2, hΨDerivative, EuclideanSpace.basisFun_apply,
      spinFrameCovectorValue, spinCovariantDerivative, spinCoordinatePartial,
      hΓ, zero_mul, add_zero]
    exact Finset.sum_comm.le
  · intro ε hε
    simp only [hΨNorm]
    rw [(spinCenter_germ_derivative (spinFamilyCutoff_differentiableAt hχ hψ hε)).fderiv]

/-- The normalized finite-family cutoff gives both product remainders for
`qₐ = ∇ψₐ` from `C²` spinor germs and differentiable connection coefficients. -/
theorem spinCoordinateRegularizedFamilyProduct_at_normalCenter {ι : Type*} [Fintype ι]
    (Γ upper : Fin 4 → EuclideanFour → ℍ[ℝ])
    (A : Fin 4 → EuclideanFour → Matrix (Fin 4) (Fin 4) ℝ)
    (ψ : ι → EuclideanFour → ℍ[ℝ]) {χ : EuclideanFour → ℝ} {x : EuclideanFour}
    (hχ : DifferentiableAt ℝ χ x) (hψ : ∀ a, ContDiffAt ℝ 2 (ψ a) x)
    (hΓ : ∀ i, DifferentiableAt ℝ (Γ i) x)
    (hUpper : ∀ i, upper i x = positiveCliffordVector i) {ε : ℝ} (hε : 0 < ε) (a : ι) :
    let f (y : EuclideanFour) := χ y / Real.sqrt ((∑ b, ‖ψ b y‖ ^ 2) + ε)
    let v : CoordinateSpinCovector := fun k => spinCovariantDerivative Γ k (ψ a)
    let q := spinFrameCovectorValue (fun k => v k x)
    let covariant (w : CoordinateSpinCovector) :=
      spinFrameHessianValue (fun i k => spinCovectorCovariantDerivative Γ A i w k x)
    let twisted (w : CoordinateSpinCovector) :=
      spinFrameCovectorValue (fun k => coordinateTwistedDirac Γ upper A w k x)
    ∃ (eCov : SpinFrameHessian) (eDirac : SpinFrameCovector),
      covariant (fun k y => f y • v k y) = f x • covariant v + eCov ∧
      twisted (fun k y => f y • v k y) = f x • twisted v + eDirac ∧
      ‖eCov‖ ^ 2 = ‖fderiv ℝ f x‖ ^ 2 * ‖q‖ ^ 2 ∧
      ‖eDirac‖ ^ 2 = ‖fderiv ℝ f x‖ ^ 2 * ‖q‖ ^ 2 := by
  have hψDiff (b : ι) : DifferentiableAt ℝ (ψ b) x := (hψ b).differentiableAt (by norm_num)
  have hv (k : Fin 4) : DifferentiableAt ℝ (spinCovariantDerivative Γ k (ψ a)) x := by
    have hPartial : DifferentiableAt ℝ (spinCoordinatePartial (ψ a) k) x :=
      ((((hψ a).fderiv_right (m := 1) (by norm_num)).clm_apply
        (contDiffAt_const (c := EuclideanSpace.single k 1))).differentiableAt one_ne_zero)
    exact hPartial.add ((hΓ k).mul (hψDiff a))
  exact spinCoordinateProductTerms_at_normalCenter Γ upper A
    (spinFamilyCutoff_differentiableAt hχ hψDiff hε) hv hUpper

open DifferentialGeometry DifferentialGeometry.Geometry.Curvature
open DifferentialGeometry.Geometry.Riemannian.Geodesic DifferentialGeometry.Tensor.Coordinates
open Filter
open scoped Manifold ContDiff

/-- In a supplied aligned normal chart of the metric, an ordinary harmonic
spinor provides the one-field Ricci equality and the chiral Hessian bound.
The Hilbert component norms are the physical tensor norms at the center. -/
theorem metricNormalChartHarmonicBochnerValues
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
    let spinMatrix := spinNormalGaugeConnection A U V
    let Γ := fun i y => spinConnectionLift (spinMatrix i y)
    let q : CoordinateSpinCovector := fun j => spinCovariantDerivative Γ j ψ
    let upper := normalChartDiracSymbol U
    (fun y => ∑ k, upper k y * q k y) =ᶠ[𝓝 x] (fun _ => 0) →
    SectionsAndConnections.hilbertSchmidtSq (geometricChiralBlock g o p frame) * ‖ψ x‖ ^ 2 ≤
      4 * ‖spinFrameHessianValue (fun i j => spinCovectorCovariantDerivative Γ A i q j x)‖ ^ 2 ∧
    ‖spinFrameCovectorValue (fun j => coordinateTwistedDirac Γ upper A q j x)‖ ^ 2 =
      (1 / 4 : ℝ) * (∑ j, ∑ a, ricciTensor g p (frame.basis j) (frame.basis a) ^ 2) * ‖ψ x‖ ^ 2 := by
  intro x A spinMatrix Γ q upper hHarm
  let lower := normalChartTwistorSymbol V
  let T := coordinateTwistorComponent upper lower q
  let B := fun i j => spinCovectorCovariantDerivative Γ A i q j x
  have hT (j : Fin 4) : T j =ᶠ[𝓝 x] q j := by
    filter_upwards [hHarm] with y hy
    simp only [T, coordinateTwistorComponent, hy, mul_zero, smul_zero, add_zero]
  have hCov (i j : Fin 4) :
      spinCovariantDerivative Γ i (T j) x - ∑ k, A i x k j • T k x = B i j := by
    change spinCovariantDerivative Γ i (T j) x - ∑ k, A i x k j • T k x =
      spinCovariantDerivative Γ i (q j) x - ∑ k, A i x k j • q k x
    simp only [spinCovariantDerivative, spinCoordinatePartial, (hT j).fderiv_eq,
      fun k => (hT k).eq_of_nhds]
  constructor
  · have hCurl := metricNormalChartTwistorDefect g o p frame hAligned hNormal hψ hU hV
      hUone hUzero hInv
    change (∑ a, Quaternion.normSq (selfDualCliffordProjection (selfDualAlternation
      (fun i j => spinCovariantDerivative Γ i (T j) x - ∑ k, A i x k j • T k x)) a)) = _ at hCurl
    simp only [hCov] at hCurl
    have hAlt := (selfDualCliffordProjection_normSq_le (selfDualAlternation B)).trans
      (selfDualAlternation_normSq_le B)
    rw [spinFrameHessianValue_normSq, sq, ← Quaternion.normSq_eq_norm_mul_self]
    change SectionsAndConnections.hilbertSchmidtSq (geometricChiralBlock g o p frame) *
      Quaternion.normSq (ψ x) ≤ 4 * ∑ i, ∑ j, Quaternion.normSq (B i j)
    linarith only [hCurl, hAlt]
  · obtain ⟨hSpinMatrixZero, hSpinMatrixDiff, hCurv⟩ := spinNormalGauge_leviCivita_at_center g o p frame
      hAligned hNormal hU hV hUone hUzero.fderiv hInv
    have hAzero (i : Fin 4) : A i x = 0 :=
      leviCivitaCoordinateMatrices_eq_zero_at_normalCenter g p hNormal i
    have hUpper := normalChartDiracSymbol_at_center hUone hUzero
    have hRicci := harmonicMetricCoordinateTwistedDiracDerivative_normSq g o p frame hψ
      hSpinMatrixDiff hSpinMatrixZero (fun i j k => A i x k j)
      (fun i j k => by rw [hAzero i, Matrix.zero_apply]) hUpper hCurv hHarm
    change (∑ j, Quaternion.normSq (frameTwistedDiracDerivative B j)) = _ at hRicci
    have hDirac (j : Fin 4) : coordinateTwistedDirac Γ upper A q j x =
        frameTwistedDiracDerivative B j := by
      have hSymbol (i : Fin 4) : upper i x = positiveCliffordVector i := (hUpper i).2
      simp only [coordinateTwistedDirac, frameTwistedDiracDerivative, B, hSymbol]
    rw [spinFrameCovectorValue_normSq]
    simp only [hDirac, Quaternion.normSq_eq_norm_mul_self, ← sq] at hRicci ⊢
    exact hRicci

/-- Sum the chiral Hessian inequalities in their common oriented normal frame.
This is the family projection input of `spinRegularizedEstimate_of_unweighted`. -/
theorem spinBochnerFamily_projection {ι : Type*} [Fintype ι]
    (ψ : ι → ℍ[ℝ]) (B : ι → SpinFrameHessian) (Wsq : ℝ)
    (hField : ∀ a, Wsq * ‖ψ a‖ ^ 2 ≤ 4 * ‖B a‖ ^ 2) :
    Wsq * (∑ a, ‖ψ a‖ ^ 2) ≤ 4 * ∑ a, ‖B a‖ ^ 2 := by
  rw [Finset.mul_sum, Finset.mul_sum]
  exact Finset.sum_le_sum fun a _ => hField a

end

end FirstOrderTwistor
