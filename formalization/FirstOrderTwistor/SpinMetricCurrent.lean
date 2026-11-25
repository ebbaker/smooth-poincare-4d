import FirstOrderTwistor.SpinGreenCurrent
import DifferentialGeometry.Geometry.Connection.DivergenceCovariantTrace
import DifferentialGeometry.Analysis.Integration.DivergenceTheorem.Global.Support

/-! # Integrated twisted Bochner estimate on the physical volume
Prepared for Edward B. Baker III on 25 November 2026 with OpenAI Codex.
A smooth compact current is identified by its diagonal first jets in the supplied
local gauges. Its integrated divergence is evaluated by the metric Stokes theorem.
-/

namespace FirstOrderTwistor

open DifferentialGeometry DifferentialGeometry.Geometry.Connection DifferentialGeometry.Integral.Measure
open DifferentialGeometry.Integral.DivergenceTheorem MeasureTheory Set
open scoped Quaternion Manifold ContDiff RealInnerProductSpace
noncomputable section

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [TopologicalSpace M] [ChartedSpace H M]
  [IsManifold I ∞ M] [I.Boundaryless] [T2Space M] [SigmaCompactSpace M]

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

omit [SigmaCompactSpace M] in
/-- Compute the divergence of an actual smooth tangent current in the supplied
oriented orthonormal frame. The local frame may depend on the point. -/
theorem spinCurrent_divergence_trace (g : SmoothRiemannianMetric I M)
    (o : ManifoldOrientation I M 4) (p : M) (frame : OrientedOrthonormalFrameAt g o p)
    (J : Cₛ^∞⟮I; E, (TangentSpace I : M → Type _)⟯) :
    divergenceG g J p = ∑ i, frame.basis.repr
      ((leviCivitaConnectionOfMetric g) J p (frame.basis i)) i := by
  rw [divergence_g_eq_leviCivita_divergence_of_isInteriorPoint (I := I) g J
    (show p ∈ I.interior M by rw [I.interior_eq_univ]; exact mem_univ _)]
  change LinearMap.trace ℝ (TangentSpace I p) _ = _
  rw [LinearMap.trace_eq_matrix_trace ℝ frame.basis]
  simp [Matrix.trace, Matrix.diag, LinearMap.toMatrix_apply]

/-- The diagonal first jet of the actual Green current, measured in a frame.
The two local factors represent the section and its raised covariant derivative
plus the back-Clifford action on its Dirac derivative. -/
def SpinGreenFrameRealizes (g : SmoothRiemannianMetric I M) (o : ManifoldOrientation I M 4)
    (p : M) (frame : OrientedOrthonormalFrameAt g o p)
    (J : Cₛ^∞⟮I; E, (TangentSpace I : M → Type _)⟯)
    (v : Fin 4 → ℍ[ℝ]) (B : Fin 4 → Fin 4 → ℍ[ℝ])
    (Hess : Fin 4 → Fin 4 → Fin 4 → ℍ[ℝ]) : Prop :=
  ∃ (y : EuclideanFour) (vLocal : Fin 4 → EuclideanFour → ℍ[ℝ])
    (T : Fin 4 → Fin 4 → EuclideanFour → ℍ[ℝ]),
    (∀ k, DifferentiableAt ℝ (vLocal k) y ∧ vLocal k y = v k) ∧
    (∀ i k, DifferentiableAt ℝ (T i k) y ∧
      T i k y = B i k + negativeCliffordVector i * frameTwistedDiracDerivative B k ∧
      spinCoordinatePartial (vLocal k) i y = B i k ∧
      spinCoordinatePartial (T i k) i y = Hess i i k + ∑ j, negativeCliffordVector i *
        (positiveCliffordVector j * Hess i j k)) ∧
    ∀ i, frame.basis.repr ((leviCivitaConnectionOfMetric g) J p (frame.basis i)) i =
      euclideanPartial (fun z => ∑ k, ⟪T i k z, vLocal k z⟫) i y

omit [SigmaCompactSpace M] [I.Boundaryless] [T2Space M] in
/-- One normal-frame description of the current suffices. The first derivative of
its first factor is calculated from the differentiable covariant gradient coefficients.
The Clifford symbols in this formula are frozen at their stationary normal-frame values. -/
theorem spinGreenFrameRealizes_of_normalGerm (g : SmoothRiemannianMetric I M)
    (o : ManifoldOrientation I M 4) (p : M) (frame : OrientedOrthonormalFrameAt g o p)
    (J : Cₛ^∞⟮I; E, (TangentSpace I : M → Type _)⟯) (y : EuclideanFour)
    (v : Fin 4 → EuclideanFour → ℍ[ℝ]) (B : Fin 4 → Fin 4 → EuclideanFour → ℍ[ℝ])
    (hv : ∀ k, DifferentiableAt ℝ (v k) y) (hB : ∀ j k, DifferentiableAt ℝ (B j k) y)
    (hFirst : ∀ j k, spinCoordinatePartial (v k) j y = B j k y)
    (hJ : ∀ i, frame.basis.repr ((leviCivitaConnectionOfMetric g) J p (frame.basis i)) i =
      euclideanPartial (fun z => ∑ k, ⟪B i k z + negativeCliffordVector i *
        (∑ j, positiveCliffordVector j * B j k z), v k z⟫) i y) :
    SpinGreenFrameRealizes g o p frame J (fun k => v k y) (fun i k => B i k y)
      (fun i j k => spinCoordinatePartial (B j k) i y) := by
  let U (k : Fin 4) (z : EuclideanFour) := ∑ j, positiveCliffordVector j * B j k z
  let T (i k : Fin 4) (z : EuclideanFour) := B i k z + negativeCliffordVector i * U k z
  have hU (k : Fin 4) : DifferentiableAt ℝ (U k) y :=
    DifferentiableAt.fun_sum fun j _ => (hB j k).const_mul _
  refine ⟨y, v, T, fun k => ⟨hv k, rfl⟩, ?_, hJ⟩
  intro i k
  refine ⟨(hB i k).add ((hU k).const_mul _), rfl, hFirst i k, ?_⟩
  unfold spinCoordinatePartial T
  rw [fderiv_fun_add (hB i k) ((hU k).const_mul _), fderiv_const_mul (hU k)]
  change _ + negativeCliffordVector i * ((fderiv ℝ (U k) y) (EuclideanSpace.single i 1)) = _
  unfold U
  rw [fderiv_fun_sum (u := Finset.univ) (fun j _ => (hB j k).const_mul _), sum_apply,
    Finset.mul_sum]
  congr 1
  apply Finset.sum_congr rfl
  intro j _
  rw [fderiv_const_mul (hB j k)]
  rfl

omit [SigmaCompactSpace M] in
/-- Pointwise divergence from the represented first jets and tensor commutator. -/
theorem SpinGreenFrameRealizes.divergence {g : SmoothRiemannianMetric I M}
    {o : ManifoldOrientation I M 4} {p : M} {frame : OrientedOrthonormalFrameAt g o p}
    {J : Cₛ^∞⟮I; E, (TangentSpace I : M → Type _)⟯} {v : Fin 4 → ℍ[ℝ]}
    {B : Fin 4 → Fin 4 → ℍ[ℝ]} {Hess : Fin 4 → Fin 4 → Fin 4 → ℍ[ℝ]}
    (h : SpinGreenFrameRealizes g o p frame J v B Hess)
    (hComm : ∀ i j k, Hess i j k - Hess j i k =
      frameTwistedCurvatureAction (metricCurvatureFrameTensor g o p frame) v i j k) :
    divergenceG g J p =
      (∑ k, ⟪frameTwistedCurvaturePotential (metricCurvatureFrameTensor g o p frame) v k, v k⟫) +
      (∑ i, ∑ k, Quaternion.normSq (B i k)) -
        ∑ k, Quaternion.normSq (frameTwistedDiracDerivative B k) := by
  obtain ⟨y, vl, T, hv, hT, hJ⟩ := h
  rw [spinCurrent_divergence_trace g o p frame]
  simp only [hJ, spinGreenCurrent_component_partial (fun k => (hT _ k).1) (fun k => (hv k).1),
    fun k => (hv k).2, fun i k => (hT i k).2.1, fun i k => (hT i k).2.2.1,
    fun i k => (hT i k).2.2.2]
  exact spinGreenCurrent_trace_of_commutator v B Hess hComm

/-- Compact support in the annulus eliminates the boundary flux. All three
integrals use the actual Riemannian volume restricted to that same annulus.
Pointwise jet identifications are required only almost everywhere there. -/
theorem spinMetricAnnulus_unweighted (g : SmoothRiemannianMetric I M)
    (o : ManifoldOrientation I M 4) (frame : ∀ p, OrientedOrthonormalFrameAt g o p)
    (A : Set M) (_hA : MeasurableSet A)
    (J : Cₛ^∞⟮I; E, (TangentSpace I : M → Type _)⟯)
    (hJ : HasCompactSupport J) (hSupport : tsupport J ⊆ A)
    (v : M → Fin 4 → ℍ[ℝ]) (B : M → Fin 4 → Fin 4 → ℍ[ℝ])
    (Hess : M → Fin 4 → Fin 4 → Fin 4 → ℍ[ℝ]) :
    let ν := (riemannianVolumeMeasure I M g).restrict A
    let gradient (p : M) := ∑ i, ∑ k, Quaternion.normSq (B p i k)
    let dirac (p : M) := ∑ k, Quaternion.normSq (frameTwistedDiracDerivative (B p) k)
    let curvature (p : M) := frameRiemannHSNorm (metricCurvatureFrameTensor g o p (frame p)) *
      ∑ k, Quaternion.normSq (v p k)
    (∀ᵐ p ∂ν, SpinGreenFrameRealizes g o p (frame p) J (v p) (B p) (Hess p) ∧
      ∀ i j k, Hess p i j k - Hess p j i k =
        frameTwistedCurvatureAction (metricCurvatureFrameTensor g o p (frame p)) (v p) i j k) →
    Integrable gradient ν → Integrable dirac ν → Integrable curvature ν →
    (∫ p, gradient p ∂ν) ≤ (∫ p, dirac p ∂ν) + 96 * ∫ p, curvature p ∂ν := by
  intro ν gradient dirac curvature hReal hGrad hDir hCurv
  have hd := integral_divergence_eq_zero_of_hasCompactSupport (I := I) g J hJ
  have hSupp := (tsupport_divergence_g_subset (I := I) g J).trans hSupport
  have hdA : (∫ p, divergenceG g J p ∂ν) = 0 := by
    change (∫ p in A, divergenceG g J p ∂riemannianVolumeMeasure I M g) = 0
    rw [setIntegral_eq_integral_of_forall_compl_eq_zero (fun p hp =>
      image_eq_zero_of_notMem_tsupport (fun h => hp (hSupp h)))]
    exact hd
  let _ := riemannianVolumeMeasure_isFiniteMeasureOnCompacts (I := I) (M := M) g
  have hInt : Integrable (divergenceG g J) ν :=
    ((divergence_g_contMDiff g J).continuous.integrable_of_hasCompactSupport
      (hasCompactSupport_divergence_g g hJ)).integrableOn
  have hbound : ∀ᵐ p ∂ν, gradient p ≤ divergenceG g J p + dirac p + 96 * curvature p := by
    filter_upwards [hReal] with p hp
    have he := hp.1.divergence hp.2
    have hc := frameTwistedCurvaturePotential_pairing_le
      (metricCurvatureFrameTensor g o p (frame p)) (v p)
    dsimp only [gradient, dirac, curvature]
    linarith only [he, (abs_le.mp hc).1, mul_assoc (96 : ℝ)
      (frameRiemannHSNorm (metricCurvatureFrameTensor g o p (frame p))) (∑ k, Quaternion.normSq (v p k))]
  have h := integral_mono_ae hGrad ((hInt.add hDir).add (hCurv.const_mul 96)) hbound
  simp only [Pi.add_apply] at h
  have hIntSum : Integrable (fun p => divergenceG g J p + dirac p) ν := hInt.add hDir
  rw [integral_add hIntSum (hCurv.const_mul 96), integral_add hInt hDir,
    integral_const_mul, hdA, zero_add] at h
  exact h

/-- A compact current and measured identifications for one localized covector-spinor.
The three input functions are the squared gradient, squared Dirac derivative and
full curvature norm times squared field norm. -/
def SpinMetricTestRealization (g : SmoothRiemannianMetric I M)
    (o : ManifoldOrientation I M 4) (A : Set M) (gradient dirac curvatureCost : M → ℝ) : Prop :=
  ∃ (frame : ∀ p, OrientedOrthonormalFrameAt g o p)
    (J : Cₛ^∞⟮I; E, (TangentSpace I : M → Type _)⟯)
    (v : M → Fin 4 → ℍ[ℝ]) (B : M → Fin 4 → Fin 4 → ℍ[ℝ])
    (Hess : M → Fin 4 → Fin 4 → Fin 4 → ℍ[ℝ]),
    HasCompactSupport J ∧ tsupport J ⊆ A ∧
    ∀ᵐ p ∂(riemannianVolumeMeasure I M g).restrict A,
      SpinGreenFrameRealizes g o p (frame p) J (v p) (B p) (Hess p) ∧
      (∀ i j k, Hess p i j k - Hess p j i k =
        frameTwistedCurvatureAction (metricCurvatureFrameTensor g o p (frame p)) (v p) i j k) ∧
      gradient p = ∑ i, ∑ k, Quaternion.normSq (B p i k) ∧
      dirac p = ∑ k, Quaternion.normSq (frameTwistedDiracDerivative (B p) k) ∧
      curvatureCost p = frameRiemannHSNorm (metricCurvatureFrameTensor g o p (frame p)) *
        ∑ k, Quaternion.normSq (v p k)

/-- A measured realization supplies the compact-test inequality used by regularization. -/
theorem SpinMetricTestRealization.estimate {g : SmoothRiemannianMetric I M}
    {o : ManifoldOrientation I M 4} {A : Set M} (hA : MeasurableSet A)
    {gradient dirac curvatureCost : M → ℝ}
    (h : SpinMetricTestRealization g o A gradient dirac curvatureCost) :
    let ν := (riemannianVolumeMeasure I M g).restrict A
    Integrable gradient ν → Integrable dirac ν → Integrable curvatureCost ν →
    (∫ p, gradient p ∂ν) ≤ (∫ p, dirac p ∂ν) + 96 * ∫ p, curvatureCost p ∂ν := by
  intro ν hG hD hC
  obtain ⟨frame, J, v, B, Hess, hJ, hS, hR⟩ := h
  have hg := hR.mono (fun _ h => h.2.2.1)
  have hd := hR.mono (fun _ h => h.2.2.2.1)
  have hc := hR.mono (fun _ h => h.2.2.2.2)
  have hBound := spinMetricAnnulus_unweighted g o frame A hA J hJ hS v B Hess
    (hR.mono fun _ h => ⟨h.1, h.2.1⟩) (hG.congr hg) (hD.congr hd) (hC.congr hc)
  rw [integral_congr_ae hg, integral_congr_ae hd, integral_congr_ae hc]
  exact hBound

end
end FirstOrderTwistor
