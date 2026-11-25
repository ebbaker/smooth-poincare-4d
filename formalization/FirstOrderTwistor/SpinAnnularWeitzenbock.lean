import FirstOrderTwistor.SpinAnnularMetricEstimate
import FirstOrderTwistor.SpinCoordinateSquare

/-!
# The compactly supported covector-twisted estimate on a metric chart

The calculation starts with the first-order connection coefficients in a
single measured full Clifford-module gauge. The density and Christoffel
coefficients are those of the actual metric. The square is derived pointwise
and then integrated in the Riemannian volume.
-/

namespace FirstOrderTwistor

open DifferentialGeometry DifferentialGeometry.Geometry.Riemannian.Geodesic
open DifferentialGeometry.Integral.Measure
open MeasureTheory Set Topology
open scoped BigOperators ContDiff InnerProductSpace Manifold

noncomputable section

variable {H M F : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ EuclideanFour H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  [SigmaCompactSpace M] [I.Boundaryless] [NormedAddCommGroup F] [InnerProductSpace ℝ F]

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

/-- The rough-gradient bound for a compactly supported covector-spinor in an
actual metric chart. The raised Clifford symbols, the fibre metric connection
and the inverse metric are identified by their pointwise coefficient
equations. The curvature bound concerns the Clifford contraction of this same
connection. The scalar realizations match all three terms in metric volume. -/
theorem annularMetric_weitzenbock_le
    (g : SmoothRiemannianMetric I M) (p : M) {Ω : Set EuclideanFour}
    (hΩ : IsOpen Ω) (hPatch : Ω ⊆ (extChartAt I p).target)
    (inverseMetric : Fin 4 → Fin 4 → EuclideanFour → ℝ)
    (Γ symbol : Fin 4 → EuclideanFour → F →L[ℝ] F) (u : EuclideanFour → F)
    (curvatureNorm : EuclideanFour → ℝ) (C : ℝ) (gradientSq diracSq curvatureMass : M → ℝ)
    (hΓ : ∀ i, ContDiffOn ℝ 1 (Γ i) Ω) (hSymbol : ∀ i, ContDiffOn ℝ 1 (symbol i) Ω)
    (hInvMetric : ∀ i j, ContDiffOn ℝ 1 (inverseMetric i j) Ω)
    (hMetricSkew : ∀ i x, x ∈ Ω → ∀ a b, ⟪Γ i x a, b⟫_ℝ = -⟪a, Γ i x b⟫_ℝ)
    (hCliffordSkew : ∀ i x, x ∈ Ω → ∀ a b,
      ⟪symbol i x a, b⟫_ℝ = -⟪a, symbol i x b⟫_ℝ)
    (hCliffordConnection : ∀ x ∈ Ω, ∀ i j a,
      (fderiv ℝ (symbol j) x (EuclideanSpace.single i 1)) a + Γ i x (symbol j x a) -
        symbol j x (Γ i x a) = -∑ k, leviCivitaCoordinateMatrices g p i x j k • symbol k x a)
    (hClifford : ∀ x ∈ Ω, ∀ i j a,
      symbol i x (symbol j x a) + symbol j x (symbol i x a) =
        ((-2 : ℝ) * inverseMetric i j x) • a)
    (hInverseMetricConnection : ∀ x ∈ Ω, ∀ i j k, euclideanPartial (inverseMetric j k) i x =
      -(∑ l, (leviCivitaCoordinateMatrices g p i x j l * inverseMetric l k x +
        leviCivitaCoordinateMatrices g p i x k l * inverseMetric j l x)))
    (hu : ContDiffOn ℝ 2 u Ω) (huc : HasCompactSupport u) (hus : tsupport u ⊆ Ω)
    (hCurvature : ContinuousOn curvatureNorm Ω)
    (hCurvatureBound : ∀ x ∈ Ω,
      |⟪u x, annularTwistedCurvaturePotential Γ symbol u x⟫_ℝ| ≤ C * (curvatureNorm x * ‖u x‖ ^ 2))
    (hGradient : AnnularChartScalarRealization g p Ω gradientSq
      (fun x => ∑ i, ∑ j, inverseMetric i j x *
        ⟪annularCovariantDerivative Γ u i x, annularCovariantDerivative Γ u j x⟫_ℝ))
    (hDirac : AnnularChartScalarRealization g p Ω diracSq (fun x => ‖annularDirac Γ symbol u x‖ ^ 2))
    (hMass : AnnularChartScalarRealization g p Ω curvatureMass (fun x => curvatureNorm x * ‖u x‖ ^ 2)) :
    let ν := riemannianVolumeMeasure (I := I) (M := M) g
    (∫ x, gradientSq x ∂ν) ≤ (∫ x, diracSq x ∂ν) + C * ∫ x, curvatureMass x ∂ν := by
  let ρ := chartDensityOnE g p
  have hInterior : Ω ⊆ interior (extChartAt I p).target := interior_maximal hPatch hΩ
  have hρ : ContDiffOn ℝ 1 ρ Ω := ((chartDensityOnE_contDiffOn g p).mono hPatch).of_le (by simp)
  have hu₁ : ContDiffOn ℝ 1 u Ω := hu.of_le (by norm_num)
  have hD := annularDirac_contDiffOn hΩ hΓ hSymbol hu
  have hPotential := annularTwistedCurvaturePotential_continuousOn
    hΩ hΓ (fun i => (hSymbol i).continuousOn) hu.continuousOn
  have huDerivative : ContDiffOn ℝ 1 (fderiv ℝ u) Ω := hu.fderiv_of_isOpen hΩ (by norm_num)
  have hFirst (j : Fin 4) : ContDiffOn ℝ 1 (annularCovariantDerivative Γ u j) Ω :=
    (huDerivative.clm_apply contDiffOn_const).add ((hΓ j).clm_apply hu₁)
  have hFlux (i : Fin 4) : ContDiffOn ℝ 1 (annularWeightedGradient ρ inverseMetric Γ u i) Ω := by
    unfold annularWeightedGradient
    apply hρ.smul
    apply ContDiffOn.sum (s := Finset.univ)
    intro j _
    exact (hInvMetric i j).smul (hFirst j)
  have hSymbolAt (x : EuclideanFour) (hx : x ∈ Ω) (j : Fin 4) :
      DifferentiableAt ℝ (symbol j) x :=
    (((hSymbol j) x hx).contDiffAt (hΩ.mem_nhds hx)).differentiableAt one_ne_zero
  have hGreen := annularCliffordFluxCompatible_of_leviCivita g p hInterior
    Γ symbol hSymbolAt hCliffordConnection
  have hSquare (x : EuclideanFour) (hx : x ∈ Ω) :
      ρ x • annularDirac Γ symbol (annularDirac Γ symbol u) x =
        -(∑ i, annularCovariantDerivative Γ (annularWeightedGradient ρ inverseMetric Γ u i) i x) +
          ρ x • annularTwistedCurvaturePotential Γ symbol u x := by
    let A (i j k : Fin 4) := leviCivitaCoordinateMatrices g p i x k j
    have hTorsion (i j k : Fin 4) : A i j k = A j i k := by
      change (chartChristoffelContraction g p (EuclideanSpace.single j 1) (EuclideanSpace.single i 1) x) k =
        (chartChristoffelContraction g p (EuclideanSpace.single i 1) (EuclideanSpace.single j 1) x) k
      rw [chartChristoffelContraction_symm g p (EuclideanSpace.single j 1) (EuclideanSpace.single i 1) x]
    have hAt {f : EuclideanFour → F} (hf : ContDiffOn ℝ 1 f Ω) : DifferentiableAt ℝ f x :=
      ((hf x hx).contDiffAt (hΩ.mem_nhds hx)).differentiableAt one_ne_zero
    have hΓAt (i : Fin 4) : DifferentiableAt ℝ (Γ i) x :=
      (((hΓ i) x hx).contDiffAt (hΩ.mem_nhds hx)).differentiableAt one_ne_zero
    have hInvAt (i j : Fin 4) : DifferentiableAt ℝ (inverseMetric i j) x :=
      (((hInvMetric i j) x hx).contDiffAt (hΩ.mem_nhds hx)).differentiableAt one_ne_zero
    have hρAt : DifferentiableAt ℝ ρ x :=
      ((hρ x hx).contDiffAt (hΩ.mem_nhds hx)).differentiableAt one_ne_zero
    have hPointwise := annularDiracSquare_eq_traceHessian_add_curvature Γ symbol u A
      (fun i j => inverseMetric i j x) x ((hu x hx).contDiffAt (hΩ.mem_nhds hx))
      hΓAt (hSymbolAt x hx) hTorsion (hCliffordConnection x hx) (hClifford x hx)
    have hDivergence := annularWeightedGradient_divergence_eq_traceHessian ρ inverseMetric A Γ u x
      hρAt hInvAt (fun j => hAt (hFirst j))
      (euclideanPartial_chartDensityOnE_eq_leviCivitaTrace g p (hInterior hx)) hTorsion
      (hInverseMetricConnection x hx)
    rw [hPointwise, hDivergence]
    simp only [smul_add, smul_neg, annularCovariantHessian]
  exact annularMetric_rough_le g p hΩ hPatch inverseMetric Γ symbol u
    (annularTwistedCurvaturePotential Γ symbol u) curvatureNorm C gradientSq diracSq curvatureMass
    (fun i => (hΓ i).continuousOn) hMetricSkew hCliffordSkew hSymbol hGreen hu₁ huc hus hD
    hPotential hCurvature hFlux hSquare hCurvatureBound hGradient hDirac hMass

end

end FirstOrderTwistor
