import DifferentialGeometry.Analysis.Integration.Integral.LocalIntegrationByParts
import DifferentialGeometry.Analysis.Integration.Measure.ChartIntegral
import FirstOrderTwistor.BufferedInterpolation
import Mathlib.Analysis.InnerProductSpace.Calculus

/-!
# Compactly supported Green identities in annular coordinates

The fibre is expressed in a measured orthonormal trivialization. The
connection coefficients are skew for its real inner product. A weighted
flux includes the volume density and any raised coordinate indices.
-/

open MeasureTheory Set Topology
open scoped BigOperators InnerProductSpace

namespace FirstOrderTwistor

noncomputable section

variable {F : Type*} [NormedAddCommGroup F] [InnerProductSpace ℝ F]

/-- Covariant differentiation in a coordinate direction in the supplied
orthonormal trivialization. -/
def annularCovariantDerivative (Γ : Fin 4 → EuclideanFour → F →L[ℝ] F)
    (u : EuclideanFour → F) (i : Fin 4) (x : EuclideanFour) : F :=
  fderiv ℝ u x (EuclideanSpace.single i 1) + Γ i x (u x)

private theorem annularCovariantDerivative_continuousOn {Ω : Set EuclideanFour}
    {Γ : Fin 4 → EuclideanFour → F →L[ℝ] F} {u : EuclideanFour → F}
    (hΩ : IsOpen Ω) (hu : ContDiffOn ℝ 1 u Ω) (i : Fin 4) (hΓ : ContinuousOn (Γ i) Ω) :
    ContinuousOn (annularCovariantDerivative Γ u i) Ω :=
  ((hu.continuousOn_fderiv_of_isOpen hΩ le_rfl).clm_apply continuousOn_const).add
    (hΓ.clm_apply hu.continuousOn)

private theorem annularCovariantDerivative_eq_zero_off_support
    {Γ : Fin 4 → EuclideanFour → F →L[ℝ] F} {u : EuclideanFour → F}
    {x : EuclideanFour} (hx : x ∉ tsupport u) (i : Fin 4) :
    annularCovariantDerivative Γ u i x = 0 := by
  have hsub : tsupport (fun y => fderiv ℝ u y (EuclideanSpace.single i 1)) ⊆ tsupport u :=
    tsupport_fderiv_apply_subset ℝ (EuclideanSpace.single i 1)
  have hdu : fderiv ℝ u x (EuclideanSpace.single i 1) = 0 :=
    image_eq_zero_of_notMem_tsupport (f := fun y => fderiv ℝ u y (EuclideanSpace.single i 1))
      fun h => hx (hsub h)
  simp [annularCovariantDerivative, hdu, image_eq_zero_of_notMem_tsupport hx]

private theorem annular_tsupport_subset_of_vanishes {E G : Type*} [Zero E] [Zero G]
    {u : EuclideanFour → E} {f : EuclideanFour → G}
    (h : ∀ x ∉ tsupport u, f x = 0) : tsupport f ⊆ tsupport u := by
  apply closure_minimal _ (isClosed_tsupport u)
  intro x hx
  by_contra hxu
  exact (Function.mem_support.mp hx) (h x hxu)

variable [MeasurableSpace EuclideanFour] [BorelSpace EuclideanFour]

omit [InnerProductSpace ℝ F] in
private theorem annularIntegrableOn_of_compact {Ω : Set EuclideanFour}
    {u : EuclideanFour → F} {f : EuclideanFour → ℝ} {μ : Measure EuclideanFour}
    [IsFiniteMeasureOnCompacts μ]
    (hΩ : IsOpen Ω) (huc : HasCompactSupport u) (hus : tsupport u ⊆ Ω)
    (hf : ContinuousOn f Ω) (hzero : ∀ x ∉ tsupport u, f x = 0) : IntegrableOn f Ω μ := by
  have hsub : tsupport f ⊆ tsupport u := annular_tsupport_subset_of_vanishes hzero
  have hfc : HasCompactSupport f := huc.of_isClosed_subset (isClosed_tsupport f) hsub
  exact ((hf.continuous_of_tsupport_subset hΩ (hsub.trans hus)).integrable_of_hasCompactSupport
    hfc).integrableOn

/-- Compactly supported coordinate flux has zero integrated divergence on
any open chart region in the model Haar measure. -/
theorem annularCoordinate_divergenceIntegral_eq_zero {Ω : Set EuclideanFour}
    {μ : Measure EuclideanFour} [μ.IsAddHaarMeasure]
    (hΩ : IsOpen Ω) (flux : Fin 4 → EuclideanFour → ℝ)
    (hflux : ∀ i, ContDiff ℝ 1 (flux i)) (hcompact : ∀ i, HasCompactSupport (flux i))
    (hsupport : ∀ i, tsupport (flux i) ⊆ Ω) :
    (∫ x in Ω, ∑ i, euclideanPartial (flux i) i x ∂μ) = 0 := by
  have hint (i : Fin 4) : IntegrableOn (euclideanPartial (flux i) i) Ω μ :=
    (((hflux i).continuous_fderiv one_ne_zero).clm_apply continuous_const
      |>.integrable_of_hasCompactSupport ((hcompact i).fderiv_apply ℝ _)).integrableOn
  rw [integral_finsetSum _ (fun i _ => hint i)]
  apply Finset.sum_eq_zero
  intro i _
  simpa [euclideanPartial] using
    DifferentialGeometry.Analysis.integral_mul_fderiv_eq_neg_fderiv_mul_of_contDiffOn
      (μ := μ) (f := fun _ => (1 : ℝ)) hΩ contDiffOn_const (hflux i) (hcompact i) (hsupport i)
      (EuclideanSpace.single i 1)

/-- Green's identity for the metric connection and a weighted contravariant
flux. Here `flux i` includes the coordinate volume density, so the integrals
are against the model Haar measure. The first field has compact support in
the chart region, which removes the boundary flux. -/
theorem annularCovariant_green {Ω : Set EuclideanFour}
    {μ : Measure EuclideanFour} [μ.IsAddHaarMeasure]
    (hΩ : IsOpen Ω) (Γ : Fin 4 → EuclideanFour → F →L[ℝ] F)
    (u : EuclideanFour → F) (flux : Fin 4 → EuclideanFour → F)
    (hΓ : ∀ i, ContinuousOn (Γ i) Ω)
    (hskew : ∀ i x, x ∈ Ω → ∀ a b, ⟪Γ i x a, b⟫_ℝ = -⟪a, Γ i x b⟫_ℝ)
    (hu : ContDiffOn ℝ 1 u Ω) (huc : HasCompactSupport u) (hus : tsupport u ⊆ Ω)
    (hflux : ∀ i, ContDiffOn ℝ 1 (flux i) Ω) :
    (∫ x in Ω, ∑ i, ⟪annularCovariantDerivative Γ u i x, flux i x⟫_ℝ ∂μ) =
      -∫ x in Ω, ∑ i, ⟪u x, annularCovariantDerivative Γ (flux i) i x⟫_ℝ ∂μ := by
  let pairing (i : Fin 4) (x : EuclideanFour) := ⟪u x, flux i x⟫_ℝ
  have hPairSupport (i : Fin 4) : tsupport (pairing i) ⊆ tsupport u :=
    annular_tsupport_subset_of_vanishes fun x hx => by
      simp [pairing, image_eq_zero_of_notMem_tsupport hx]
  have hPairOn (i : Fin 4) : ContDiffOn ℝ 1 (pairing i) Ω := hu.inner ℝ (hflux i)
  have hPairDiff (i : Fin 4) : ContDiff ℝ 1 (pairing i) :=
    (hPairOn i).contDiff_of_tsupport_subset hΩ ((hPairSupport i).trans hus)
  have hPairCompact (i : Fin 4) : HasCompactSupport (pairing i) :=
    huc.of_isClosed_subset (isClosed_tsupport _) (hPairSupport i)
  have hdiv := annularCoordinate_divergenceIntegral_eq_zero (μ := μ) hΩ pairing
    hPairDiff hPairCompact (fun i => (hPairSupport i).trans hus)
  have hleft (i : Fin 4) :
      IntegrableOn (fun x => ⟪annularCovariantDerivative Γ u i x, flux i x⟫_ℝ) Ω μ :=
    annularIntegrableOn_of_compact hΩ huc hus
      ((annularCovariantDerivative_continuousOn hΩ hu i (hΓ i)).inner (𝕜 := ℝ) (hflux i).continuousOn)
      (fun x hx => by rw [annularCovariantDerivative_eq_zero_off_support hx, inner_zero_left])
  have hright (i : Fin 4) :
      IntegrableOn (fun x => ⟪u x, annularCovariantDerivative Γ (flux i) i x⟫_ℝ) Ω μ :=
    annularIntegrableOn_of_compact hΩ huc hus
      (hu.continuousOn.inner (𝕜 := ℝ) (annularCovariantDerivative_continuousOn hΩ (hflux i) i (hΓ i)))
      (fun x hx => by rw [image_eq_zero_of_notMem_tsupport hx, inner_zero_left])
  have hderiv (i : Fin 4) (x : EuclideanFour) (hx : x ∈ Ω) :
      euclideanPartial (pairing i) i x =
        ⟪annularCovariantDerivative Γ u i x, flux i x⟫_ℝ +
          ⟪u x, annularCovariantDerivative Γ (flux i) i x⟫_ℝ := by
    have huAt := ((hu x hx).contDiffAt (hΩ.mem_nhds hx)).differentiableAt one_ne_zero
    have hfAt := ((hflux i x hx).contDiffAt (hΩ.mem_nhds hx)).differentiableAt one_ne_zero
    change fderiv ℝ (fun y => ⟪u y, flux i y⟫_ℝ) x (EuclideanSpace.single i 1) = _
    rw [(huAt.hasFDerivAt.inner ℝ hfAt.hasFDerivAt).fderiv]
    simp only [ContinuousLinearMap.comp_apply, ContinuousLinearMap.prod_apply, fderivInnerCLM_apply,
      annularCovariantDerivative, inner_add_left, inner_add_right, hskew i x hx]
    ring
  have hRearrange : (∫ x in Ω, ∑ i, euclideanPartial (pairing i) i x ∂μ) =
      ∫ x in Ω, (∑ i, ⟪annularCovariantDerivative Γ u i x, flux i x⟫_ℝ) +
        ∑ i, ⟪u x, annularCovariantDerivative Γ (flux i) i x⟫_ℝ ∂μ := by
    apply setIntegral_congr_fun hΩ.measurableSet
    intro x hx
    simp only [hderiv _ x hx, Finset.sum_add_distrib]
  rw [hRearrange, integral_add (integrable_finsetSum _ (fun i _ => hleft i))
    (integrable_finsetSum _ (fun i _ => hright i))] at hdiv
  linarith

/-- The coordinate covector-twisted Dirac operator written in a measured
orthonormal fibre gauge. The symbols contain the raised coordinate index. -/
def annularDirac (Γ symbol : Fin 4 → EuclideanFour → F →L[ℝ] F)
    (u : EuclideanFour → F) (x : EuclideanFour) : F :=
  ∑ i, symbol i x (annularCovariantDerivative Γ u i x)

/-- Vanishing covariant divergence of the density-weighted Clifford symbol.
This is the coordinate compatibility for the Dirac flux. It is the sum of
ordinary derivatives and the commutators with the fibre connection. -/
def AnnularCliffordFluxCompatible (Ω : Set EuclideanFour) (density : EuclideanFour → ℝ)
    (Γ symbol : Fin 4 → EuclideanFour → F →L[ℝ] F) : Prop :=
  ∀ x ∈ Ω, ∀ a : F, (∑ i,
    ((fderiv ℝ (fun y => density y • symbol i y) x (EuclideanSpace.single i 1)) a +
      Γ i x (density x • symbol i x a) - density x • symbol i x (Γ i x a))) = 0

/-- The formally self-adjoint Dirac pairing on a measured annular chart.
The symbol and connection are skew for the fibre metric. The weighted
compatibility is stated in the same coordinate density as the two integrals. -/
theorem annularDirac_green {Ω : Set EuclideanFour}
    {μ : Measure EuclideanFour} [μ.IsAddHaarMeasure]
    (hΩ : IsOpen Ω) (density : EuclideanFour → ℝ)
    (Γ symbol : Fin 4 → EuclideanFour → F →L[ℝ] F) (u v : EuclideanFour → F)
    (hΓ : ∀ i, ContinuousOn (Γ i) Ω)
    (hskew : ∀ i x, x ∈ Ω → ∀ a b, ⟪Γ i x a, b⟫_ℝ = -⟪a, Γ i x b⟫_ℝ)
    (hCliffordSkew : ∀ i x, x ∈ Ω → ∀ a b, ⟪symbol i x a, b⟫_ℝ = -⟪a, symbol i x b⟫_ℝ)
    (hρ : ContDiffOn ℝ 1 density Ω) (hSymbol : ∀ i, ContDiffOn ℝ 1 (symbol i) Ω)
    (hCompatible : AnnularCliffordFluxCompatible Ω density Γ symbol)
    (hu : ContDiffOn ℝ 1 u Ω) (hv : ContDiffOn ℝ 1 v Ω)
    (huc : HasCompactSupport u) (hus : tsupport u ⊆ Ω) :
    (∫ x in Ω, density x * ⟪annularDirac Γ symbol u x, v x⟫_ℝ ∂μ) =
      ∫ x in Ω, density x * ⟪u x, annularDirac Γ symbol v x⟫_ℝ ∂μ := by
  let weighted (i : Fin 4) (x : EuclideanFour) := density x • symbol i x
  let flux (i : Fin 4) (x : EuclideanFour) := weighted i x (v x)
  have hWeighted (i : Fin 4) : ContDiffOn ℝ 1 (weighted i) Ω := hρ.smul (hSymbol i)
  have hFlux (i : Fin 4) : ContDiffOn ℝ 1 (flux i) Ω := (hWeighted i).clm_apply hv
  have hGreen := annularCovariant_green (μ := μ) hΩ Γ u flux hΓ hskew hu huc hus hFlux
  have hLeft : (∫ x in Ω, ∑ i, ⟪annularCovariantDerivative Γ u i x, flux i x⟫_ℝ ∂μ) =
      ∫ x in Ω, -(density x * ⟪annularDirac Γ symbol u x, v x⟫_ℝ) ∂μ := by
    apply setIntegral_congr_fun hΩ.measurableSet
    intro x hx
    change (∑ i, ⟪annularCovariantDerivative Γ u i x, flux i x⟫_ℝ) =
      -(density x * ⟪annularDirac Γ symbol u x, v x⟫_ℝ)
    rw [annularDirac, sum_inner, Finset.mul_sum, ← Finset.sum_neg_distrib]
    apply Finset.sum_congr rfl
    intro i _
    simp only [flux, weighted, smul_apply, real_inner_smul_right,
      hCliffordSkew i x hx, mul_neg, neg_neg]
  have hRight : (∫ x in Ω, ∑ i, ⟪u x, annularCovariantDerivative Γ (flux i) i x⟫_ℝ ∂μ) =
      ∫ x in Ω, density x * ⟪u x, annularDirac Γ symbol v x⟫_ℝ ∂μ := by
    apply setIntegral_congr_fun hΩ.measurableSet
    intro x hx
    let error (i : Fin 4) :=
      (fderiv ℝ (weighted i) x (EuclideanSpace.single i 1)) (v x) +
        Γ i x (density x • symbol i x (v x)) - density x • symbol i x (Γ i x (v x))
    have hError : (∑ i, error i) = 0 := hCompatible x hx (v x)
    have hCovFlux (i : Fin 4) : annularCovariantDerivative Γ (flux i) i x =
        density x • symbol i x (annularCovariantDerivative Γ v i x) + error i := by
      have hwa := (((hWeighted i) x hx).contDiffAt (hΩ.mem_nhds hx)).differentiableAt one_ne_zero
      have hva := ((hv x hx).contDiffAt (hΩ.mem_nhds hx)).differentiableAt one_ne_zero
      have hderivative : fderiv ℝ (flux i) x (EuclideanSpace.single i 1) =
          weighted i x (fderiv ℝ v x (EuclideanSpace.single i 1)) +
            (fderiv ℝ (weighted i) x (EuclideanSpace.single i 1)) (v x) := by
        unfold flux
        rw [fderiv_clm_apply hwa hva]
        rfl
      unfold annularCovariantDerivative
      rw [hderivative]
      simp only [flux, weighted, error, smul_apply, map_add, smul_add]
      abel
    simp only [hCovFlux, inner_add_right, real_inner_smul_right, Finset.sum_add_distrib,
      ← inner_sum, hError, inner_zero_right, add_zero, ← Finset.mul_sum, annularDirac]
  rw [hLeft, integral_neg, hRight] at hGreen
  exact neg_injective hGreen

/-- The weighted contravariant gradient of a field, with the inverse metric
in the coordinate-direction indices. -/
def annularWeightedGradient (density : EuclideanFour → ℝ)
    (inverseMetric : Fin 4 → Fin 4 → EuclideanFour → ℝ)
    (Γ : Fin 4 → EuclideanFour → F →L[ℝ] F) (u : EuclideanFour → F)
    (i : Fin 4) (x : EuclideanFour) : F :=
  density x • ∑ j, inverseMetric i j x • annularCovariantDerivative Γ u j x

/-- The rough Laplacian Green identity, expressed using the density-weighted
raised gradient. The divergence inside the pairing retains the fibre connection. -/
theorem annularRoughGradient_green {Ω : Set EuclideanFour}
    {μ : Measure EuclideanFour} [μ.IsAddHaarMeasure]
    (hΩ : IsOpen Ω) (density : EuclideanFour → ℝ)
    (inverseMetric : Fin 4 → Fin 4 → EuclideanFour → ℝ)
    (Γ : Fin 4 → EuclideanFour → F →L[ℝ] F) (u : EuclideanFour → F)
    (hΓ : ∀ i, ContinuousOn (Γ i) Ω)
    (hskew : ∀ i x, x ∈ Ω → ∀ a b, ⟪Γ i x a, b⟫_ℝ = -⟪a, Γ i x b⟫_ℝ)
    (hu : ContDiffOn ℝ 1 u Ω) (huc : HasCompactSupport u) (hus : tsupport u ⊆ Ω)
    (hFlux : ∀ i, ContDiffOn ℝ 1 (annularWeightedGradient density inverseMetric Γ u i) Ω) :
    (∫ x in Ω, density x * ∑ i, ∑ j, inverseMetric i j x *
      ⟪annularCovariantDerivative Γ u i x, annularCovariantDerivative Γ u j x⟫_ℝ ∂μ) =
      -∫ x in Ω, ⟪u x, ∑ i, annularCovariantDerivative Γ
        (annularWeightedGradient density inverseMetric Γ u i) i x⟫_ℝ ∂μ := by
  simpa only [annularWeightedGradient, real_inner_smul_right, inner_sum, ← Finset.mul_sum] using
    annularCovariant_green (μ := μ) hΩ Γ u (annularWeightedGradient density inverseMetric Γ u)
      hΓ hskew hu huc hus hFlux

/-- Integrated covector-twisted square on a compactly supported field. The
pointwise square is supplied in the same gauge as the Green formulas. The
connection, symbols, inverse metric and volume density enter explicitly. -/
theorem annularTwistedLichnerowicz_integral {Ω : Set EuclideanFour}
    {μ : Measure EuclideanFour} [μ.IsAddHaarMeasure]
    (hΩ : IsOpen Ω) (density : EuclideanFour → ℝ)
    (inverseMetric : Fin 4 → Fin 4 → EuclideanFour → ℝ)
    (Γ symbol : Fin 4 → EuclideanFour → F →L[ℝ] F) (u potential : EuclideanFour → F)
    (hΓ : ∀ i, ContinuousOn (Γ i) Ω)
    (hskew : ∀ i x, x ∈ Ω → ∀ a b, ⟪Γ i x a, b⟫_ℝ = -⟪a, Γ i x b⟫_ℝ)
    (hCliffordSkew : ∀ i x, x ∈ Ω → ∀ a b, ⟪symbol i x a, b⟫_ℝ = -⟪a, symbol i x b⟫_ℝ)
    (hρ : ContDiffOn ℝ 1 density Ω) (hSymbol : ∀ i, ContDiffOn ℝ 1 (symbol i) Ω)
    (hCompatible : AnnularCliffordFluxCompatible Ω density Γ symbol)
    (hu : ContDiffOn ℝ 1 u Ω) (huc : HasCompactSupport u) (hus : tsupport u ⊆ Ω)
    (hDu : ContDiffOn ℝ 1 (annularDirac Γ symbol u) Ω)
    (hPotential : ContinuousOn potential Ω)
    (hFlux : ∀ i, ContDiffOn ℝ 1 (annularWeightedGradient density inverseMetric Γ u i) Ω)
    (hSquare : ∀ x ∈ Ω,
      density x • annularDirac Γ symbol (annularDirac Γ symbol u) x =
        -(∑ i, annularCovariantDerivative Γ (annularWeightedGradient density inverseMetric Γ u i) i x) +
          density x • potential x) :
    (∫ x in Ω, density x * ‖annularDirac Γ symbol u x‖ ^ 2 ∂μ) =
      (∫ x in Ω, density x * ∑ i, ∑ j, inverseMetric i j x *
        ⟪annularCovariantDerivative Γ u i x, annularCovariantDerivative Γ u j x⟫_ℝ ∂μ) +
      ∫ x in Ω, density x * ⟪u x, potential x⟫_ℝ ∂μ := by
  let flux := annularWeightedGradient density inverseMetric Γ u
  let divFlux (x : EuclideanFour) := ∑ i, annularCovariantDerivative Γ (flux i) i x
  have hDivCont : ContinuousOn divFlux Ω := by
    apply continuousOn_finsetSum
    intro i _
    exact annularCovariantDerivative_continuousOn hΩ (hFlux i) i (hΓ i)
  have hDivInt : IntegrableOn (fun x => ⟪u x, divFlux x⟫_ℝ) Ω μ :=
    annularIntegrableOn_of_compact hΩ huc hus (hu.continuousOn.inner (𝕜 := ℝ) hDivCont)
      (fun x hx => by rw [image_eq_zero_of_notMem_tsupport hx, inner_zero_left])
  have hPotInt : IntegrableOn (fun x => density x * ⟪u x, potential x⟫_ℝ) Ω μ :=
    annularIntegrableOn_of_compact hΩ huc hus
      (hρ.continuousOn.mul (hu.continuousOn.inner (𝕜 := ℝ) hPotential))
      (fun x hx => by rw [image_eq_zero_of_notMem_tsupport hx, inner_zero_left, mul_zero])
  have hDirac := annularDirac_green (μ := μ) hΩ density Γ symbol u (annularDirac Γ symbol u)
    hΓ hskew hCliffordSkew hρ hSymbol hCompatible hu hDu huc hus
  have hRough := annularRoughGradient_green (μ := μ) hΩ density inverseMetric Γ u
    hΓ hskew hu huc hus hFlux
  simp only [real_inner_self_eq_norm_sq] at hDirac
  have hCombine := integral_add hDivInt.neg hPotInt
  simp only [Pi.neg_apply, divFlux, flux] at hCombine
  rw [hDirac, hRough, ← integral_neg, ← hCombine]
  apply setIntegral_congr_fun hΩ.measurableSet
  intro x hx
  simpa only [real_inner_smul_right, inner_add_right, inner_neg_right, divFlux, flux] using
    congrArg (fun w => ⟪u x, w⟫_ℝ) (hSquare x hx)

end

section Riemannian

open DifferentialGeometry DifferentialGeometry.Integral.Measure
open scoped Manifold ContDiff

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ EuclideanFour H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  [SigmaCompactSpace M] [I.Boundaryless]

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩
private local instance : MeasurableSpace EuclideanFour := borel EuclideanFour
private local instance : BorelSpace EuclideanFour := ⟨rfl⟩

/-- A compact annular scalar density integrates against the actual metric
volume. Its coordinate expression uses `chartDensityOnE` and the model Haar
measure. The support condition keeps the entire contribution in the patch. -/
theorem annularChartIntegral_eq_riemannianVolume
    (g : SmoothRiemannianMetric I M) (p : M) {Ω : Set EuclideanFour}
    (hΩ : IsOpen Ω) (hPatch : Ω ⊆ (extChartAt I p).target)
    (f : M → ℝ) (coordinate : EuclideanFour → ℝ) (hf : HasCompactSupport f)
    (hSupport : tsupport f ⊆ (chartAt H p).source ∩ (extChartAt I p) ⁻¹' Ω)
    (hMeas : AEStronglyMeasurable f (chartLocalMeasure g p))
    (hMatch : ∀ y ∈ Ω, coordinate y = f ((extChartAt I p).symm y)) :
    (∫ y in Ω, chartDensityOnE g p y * coordinate y ∂modelHaar) =
      ∫ x, f x ∂riemannianVolumeMeasure (I := I) (M := M) g := by
  rw [integral_riemannianVolumeMeasure_eq_chartDensity_of_tsupport_subset g p hf
    (hSupport.trans inter_subset_left) hMeas]
  have hZero (y : EuclideanFour) (hy : y ∈ (extChartAt I p).target \ Ω) :
      chartDensity g p ((extChartAt I p).symm y) * f ((extChartAt I p).symm y) = 0 := by
    have hOutside : (extChartAt I p).symm y ∉ tsupport f := by
      intro hySupport
      have hIn := (hSupport hySupport).2
      change extChartAt I p ((extChartAt I p).symm y) ∈ Ω at hIn
      rw [(extChartAt I p).right_inv hy.1] at hIn
      exact hy.2 hIn
    rw [image_eq_zero_of_notMem_tsupport hOutside, mul_zero]
  have hTrim := setIntegral_eq_of_subset_of_forall_sdiff_eq_zero
    (μ := modelHaar (E := EuclideanFour))
    (f := fun y => chartDensity g p ((extChartAt I p).symm y) * f ((extChartAt I p).symm y))
    (isOpen_extChartAt_target p).measurableSet hPatch hZero
  rw [hTrim]
  exact setIntegral_congr_fun hΩ.measurableSet fun y hy => by rw [hMatch y hy, chartDensityOnE]

end Riemannian

end FirstOrderTwistor
