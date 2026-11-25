import FirstOrderTwistor.SpinAnnularGreen
import FirstOrderTwistor.SpinMetricFlux

/-!
# Unweighted twisted Dirac estimate in the physical metric volume

The coordinate Green formulas use the metric chart density. The scalar
realizations identify the coordinate terms with the physical ones on the
same patch, and their support permits integration on the whole manifold.
-/

namespace FirstOrderTwistor

open DifferentialGeometry DifferentialGeometry.Integral.Measure
open MeasureTheory Set Topology
open scoped BigOperators ContDiff InnerProductSpace Manifold

noncomputable section

variable {H M F : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ EuclideanFour H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  [SigmaCompactSpace M] [I.Boundaryless] [NormedAddCommGroup F] [InnerProductSpace ℝ F]

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩
private local instance : MeasurableSpace EuclideanFour := borel EuclideanFour
private local instance : BorelSpace EuclideanFour := ⟨rfl⟩

/-- A physical scalar term and its expression in the measured annular chart. -/
structure AnnularChartScalarRealization (g : SmoothRiemannianMetric I M) (p : M)
    (Ω : Set EuclideanFour) (physical : M → ℝ) (coordinate : EuclideanFour → ℝ) : Prop where
  compact : HasCompactSupport physical
  support : tsupport physical ⊆ (chartAt H p).source ∩ (extChartAt I p) ⁻¹' Ω
  chartMeasurable : AEStronglyMeasurable physical (chartLocalMeasure g p)
  pullback : ∀ y ∈ Ω, coordinate y = physical ((extChartAt I p).symm y)

omit [T2Space M] [SigmaCompactSpace M] [I.Boundaryless] [InnerProductSpace ℝ F] in
private theorem annularPatch_integrableOn {Ω : Set EuclideanFour}
    {u : EuclideanFour → F} {term : EuclideanFour → ℝ}
    (hΩ : IsOpen Ω) (huc : HasCompactSupport u) (hus : tsupport u ⊆ Ω)
    (hcont : ContinuousOn term Ω) (hzero : ∀ x ∉ tsupport u, term x = 0) :
    IntegrableOn term Ω (modelHaar (E := EuclideanFour)) := by
  have hsub : tsupport term ⊆ tsupport u := by
    apply closure_minimal _ (isClosed_tsupport u)
    intro x hx
    by_contra hxu
    exact (Function.mem_support.mp hx) (hzero x hxu)
  exact ((hcont.continuous_of_tsupport_subset hΩ (hsub.trans hus)).integrable_of_hasCompactSupport
    (huc.of_isClosed_subset (isClosed_tsupport term) hsub)).integrableOn

/-- The unweighted rough-gradient estimate for a compactly supported annular
field. The symbol and rough square are realized in one orthonormal fibre
gauge and the scalar terms in the physical metric volume. `curvatureMass`
is the physical realization of the curvature norm times the field norm
squared. The curvature-potential estimate is pointwise. -/
theorem annularMetric_rough_le
    (g : SmoothRiemannianMetric I M) (p : M) {Ω : Set EuclideanFour}
    (hΩ : IsOpen Ω) (hPatch : Ω ⊆ (extChartAt I p).target)
    (inverseMetric : Fin 4 → Fin 4 → EuclideanFour → ℝ)
    (Γ symbol : Fin 4 → EuclideanFour → F →L[ℝ] F) (u potential : EuclideanFour → F)
    (curvatureNorm : EuclideanFour → ℝ) (C : ℝ) (gradientSq diracSq curvatureMass : M → ℝ)
    (hΓ : ∀ i, ContinuousOn (Γ i) Ω)
    (hskew : ∀ i x, x ∈ Ω → ∀ a b, ⟪Γ i x a, b⟫_ℝ = -⟪a, Γ i x b⟫_ℝ)
    (hCliffordSkew : ∀ i x, x ∈ Ω → ∀ a b, ⟪symbol i x a, b⟫_ℝ = -⟪a, symbol i x b⟫_ℝ)
    (hSymbol : ∀ i, ContDiffOn ℝ 1 (symbol i) Ω)
    (hCompatible : AnnularCliffordFluxCompatible Ω (chartDensityOnE g p) Γ symbol)
    (hu : ContDiffOn ℝ 1 u Ω) (huc : HasCompactSupport u) (hus : tsupport u ⊆ Ω)
    (hDu : ContDiffOn ℝ 1 (annularDirac Γ symbol u) Ω)
    (hPotential : ContinuousOn potential Ω) (hCurvature : ContinuousOn curvatureNorm Ω)
    (hFlux : ∀ i, ContDiffOn ℝ 1
      (annularWeightedGradient (chartDensityOnE g p) inverseMetric Γ u i) Ω)
    (hSquare : ∀ x ∈ Ω,
      chartDensityOnE g p x • annularDirac Γ symbol (annularDirac Γ symbol u) x =
        -(∑ i, annularCovariantDerivative Γ
          (annularWeightedGradient (chartDensityOnE g p) inverseMetric Γ u i) i x) +
        chartDensityOnE g p x • potential x)
    (hCurvatureBound : ∀ x ∈ Ω, |⟪u x, potential x⟫_ℝ| ≤ C * (curvatureNorm x * ‖u x‖ ^ 2))
    (hGradient : AnnularChartScalarRealization g p Ω gradientSq
      (fun x => ∑ i, ∑ j, inverseMetric i j x *
        ⟪annularCovariantDerivative Γ u i x, annularCovariantDerivative Γ u j x⟫_ℝ))
    (hDirac : AnnularChartScalarRealization g p Ω diracSq (fun x => ‖annularDirac Γ symbol u x‖ ^ 2))
    (hMass : AnnularChartScalarRealization g p Ω curvatureMass (fun x => curvatureNorm x * ‖u x‖ ^ 2)) :
    let ν := riemannianVolumeMeasure (I := I) (M := M) g
    (∫ x, gradientSq x ∂ν) ≤ (∫ x, diracSq x ∂ν) + C * ∫ x, curvatureMass x ∂ν := by
  let density := chartDensityOnE g p
  have hρ : ContDiffOn ℝ 1 density Ω :=
    ((chartDensityOnE_contDiffOn g p).mono hPatch).of_le (by simp)
  have hIdentity := annularTwistedLichnerowicz_integral (μ := modelHaar (E := EuclideanFour))
    hΩ density inverseMetric Γ symbol u potential hΓ hskew hCliffordSkew hρ hSymbol hCompatible
    hu huc hus hDu hPotential hFlux hSquare
  have hPotentialInt : IntegrableOn (fun x => density x * ⟪u x, potential x⟫_ℝ) Ω modelHaar :=
    annularPatch_integrableOn hΩ huc hus
      (hρ.continuousOn.mul (hu.continuousOn.inner (𝕜 := ℝ) hPotential))
      (fun x hx => by rw [image_eq_zero_of_notMem_tsupport hx, inner_zero_left, mul_zero])
  have hCurvatureInt : IntegrableOn (fun x => density x * (curvatureNorm x * ‖u x‖ ^ 2)) Ω modelHaar :=
    annularPatch_integrableOn hΩ huc hus
      (hρ.continuousOn.mul (hCurvature.mul (hu.continuousOn.norm.pow 2)))
      (fun x hx => by simp [image_eq_zero_of_notMem_tsupport hx])
  have hBound : -(∫ x in Ω, density x * ⟪u x, potential x⟫_ℝ ∂modelHaar) ≤
      C * ∫ x in Ω, density x * (curvatureNorm x * ‖u x‖ ^ 2) ∂modelHaar := by
    rw [← integral_neg, ← integral_const_mul]
    apply integral_mono_ae hPotentialInt.neg (hCurvatureInt.const_mul C)
    filter_upwards [ae_restrict_mem (μ := modelHaar (E := EuclideanFour)) hΩ.measurableSet] with x hx
    have hDensity : 0 ≤ density x := Real.sqrt_nonneg _
    have h := mul_le_mul_of_nonneg_left ((neg_le_abs _).trans (hCurvatureBound x hx)) hDensity
    simpa only [Pi.neg_apply, mul_neg, mul_left_comm C] using h
  have hTransport {physical : M → ℝ} {coordinate : EuclideanFour → ℝ}
      (h : AnnularChartScalarRealization g p Ω physical coordinate) :=
    annularChartIntegral_eq_riemannianVolume g p hΩ hPatch physical coordinate h.compact h.support
      h.chartMeasurable h.pullback
  dsimp only
  rw [← hTransport hGradient, ← hTransport hDirac, ← hTransport hMass]
  linarith only [hIdentity, hBound]

omit [T2Space M] [SigmaCompactSpace M] [I.Boundaryless] in
/-- The divergence of the weighted raised gradient is the density times
the metric trace of the covariant Hessian. The Christoffel coefficient
`A i j k` is the component in direction `k` of the derivative of coordinate
direction `j` along `i`. The three compatibility assumptions are pointwise. -/
theorem annularWeightedGradient_divergence_eq_traceHessian
    (density : EuclideanFour → ℝ) (inverseMetric : Fin 4 → Fin 4 → EuclideanFour → ℝ)
    (A : Fin 4 → Fin 4 → Fin 4 → ℝ) (Γ : Fin 4 → EuclideanFour → F →L[ℝ] F)
    (u : EuclideanFour → F) (x : EuclideanFour)
    (hDensity : DifferentiableAt ℝ density x)
    (hMetric : ∀ i j, DifferentiableAt ℝ (inverseMetric i j) x)
    (hGradient : ∀ j, DifferentiableAt ℝ (annularCovariantDerivative Γ u j) x)
    (hTrace : ∀ i, euclideanPartial density i x = density x * ∑ k, A i k k)
    (hTorsion : ∀ i j k, A i j k = A j i k)
    (hCompatibility : ∀ i j k, euclideanPartial (inverseMetric j k) i x =
      -(∑ l, (A i l j * inverseMetric l k x + A i l k * inverseMetric j l x))) :
    (∑ i, annularCovariantDerivative Γ (annularWeightedGradient density inverseMetric Γ u i) i x) =
      density x • ∑ i, ∑ j, inverseMetric i j x •
        (annularCovariantDerivative Γ (annularCovariantDerivative Γ u j) i x -
          ∑ k, A i j k • annularCovariantDerivative Γ u k x) := by
  let w (i j : Fin 4) (y : EuclideanFour) := density y * inverseMetric i j y
  let V := annularCovariantDerivative Γ u
  have hWeight (i j : Fin 4) : DifferentiableAt ℝ (w i j) x := hDensity.mul (hMetric i j)
  have hFlux (i : Fin 4) : annularWeightedGradient density inverseMetric Γ u i =
      fun y => ∑ j, w i j y • V j y := by
    funext y
    simp only [annularWeightedGradient, w, V, Finset.smul_sum, mul_smul]
  have hCov (i : Fin 4) :
      annularCovariantDerivative Γ (annularWeightedGradient density inverseMetric Γ u i) i x =
        ∑ j, (euclideanPartial (w i j) i x • V j x +
          w i j x • annularCovariantDerivative Γ (V j) i x) := by
    rw [hFlux i]
    change fderiv ℝ (fun y => ∑ j, w i j y • V j y) x (EuclideanSpace.single i 1) +
      Γ i x (∑ j, w i j x • V j x) = _
    rw [fderiv_fun_sum (u := Finset.univ) (A := fun j y => w i j y • V j y)
      (fun j _ => (hWeight i j).smul (hGradient j)), sum_apply, map_sum, ← Finset.sum_add_distrib]
    apply Finset.sum_congr rfl
    intro j _
    rw [fderiv_fun_smul (hWeight i j) (hGradient j),
      show annularCovariantDerivative Γ (V j) i x =
        fderiv ℝ (V j) x (EuclideanSpace.single i 1) + Γ i x (V j x) from rfl]
    simp only [add_apply, smul_apply, ContinuousLinearMap.smulRight_apply,
      map_smul, euclideanPartial, smul_add]
    abel
  have hWeightedDiv (j : Fin 4) : (∑ i, euclideanPartial (w i j) i x) =
      -density x * ∑ i, ∑ k, A i k j * inverseMetric i k x :=
    weightedInverseMetric_divergence_of_coordinateConnection
      (fun i => EuclideanSpace.single i 1) A density inverseMetric x
      hDensity hMetric hTrace hTorsion hCompatibility j
  have hOrder : (∑ j, (∑ i, ∑ k, A i k j * inverseMetric i k x) • V j x) =
      ∑ i, ∑ k, inverseMetric i k x • (∑ j, A i k j • V j x) := by
    simp only [Finset.sum_smul, Finset.smul_sum]
    rw [Finset.sum_comm]
    apply Finset.sum_congr rfl
    intro i _
    rw [Finset.sum_comm]
    apply Finset.sum_congr rfl
    intro k _
    apply Finset.sum_congr rfl
    intro j _
    rw [← mul_smul, mul_comm]
  have hFirst : (∑ i, ∑ j, euclideanPartial (w i j) i x • V j x) =
      -(density x • ∑ i, ∑ j, inverseMetric i j x • (∑ k, A i j k • V k x)) := by
    calc
      _ = ∑ j, (∑ i, euclideanPartial (w i j) i x) • V j x := by
        rw [Finset.sum_comm]
        simp only [Finset.sum_smul]
      _ = -(density x • ∑ j, (∑ i, ∑ k, A i k j * inverseMetric i k x) • V j x) := by
        simp only [hWeightedDiv, neg_mul, neg_smul, mul_smul, Finset.sum_neg_distrib, Finset.smul_sum]
      _ = _ := by rw [hOrder]
  have hSecond : (∑ i, ∑ j, w i j x • annularCovariantDerivative Γ (V j) i x) =
      density x • ∑ i, ∑ j, inverseMetric i j x • annularCovariantDerivative Γ (V j) i x := by
    simp only [w, mul_smul, Finset.smul_sum]
  change _ = density x • ∑ i, ∑ j, inverseMetric i j x •
    (annularCovariantDerivative Γ (V j) i x - ∑ k, A i j k • V k x)
  simp only [hCov, Finset.sum_add_distrib, hFirst, hSecond, smul_sub, Finset.sum_sub_distrib]
  abel

end

end FirstOrderTwistor
