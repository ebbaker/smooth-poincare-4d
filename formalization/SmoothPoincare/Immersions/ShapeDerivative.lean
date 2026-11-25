import SmoothPoincare.Immersions.NormalCodazzi

/-! # Raising one index in the local normal Codazzi equation -/

open DifferentialGeometry.Geometry.Connection Filter
open scoped Topology

namespace SmoothPoincare

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]

/-- The same metric duality used to define a shape operator also identifies
its covariant derivative. The duality must hold as a germ. -/
theorem chartShapeDerivative_lower (Γ : E → E →L[ℝ] E →L[ℝ] E)
    (K : E → E →L[ℝ] E →L[ℝ] ℝ) (S : E → E →L[ℝ] E) (b : E → E → E → ℝ)
    {x : E} (hK : DifferentiableAt ℝ K x) (hS : DifferentiableAt ℝ S x)
    (hdual : ∀ᶠ y in 𝓝 x, ∀ u v, b y u v = K y (S y u) v)
    (hmetric : ∀ X u v, fderiv ℝ K x X u v =
      K x (Γ x X u) v + K x u (Γ x X v)) (X u v : E) :
    K x (bundleMapCovDeriv Γ Γ S x X u) v = chartCovDerivTwo Γ b x X u v := by
  have hz := hdual.self_of_nhds
  have hgerm : (fun y => b y u v) =ᶠ[𝓝 x] (fun y => K y (S y u) v) :=
    hdual.mono fun y h => h u v
  have hd := ((hK.hasFDerivAt.clm_apply (hS.hasFDerivAt.clm_apply
    (hasFDerivAt_const u x))).clm_apply (hasFDerivAt_const v x)).fderiv
  rw [chartCovDerivTwo, hgerm.fderiv_eq, hd, hz, hz]
  simp only [bundleMapCovDeriv, add_apply, sub_apply, map_add, map_sub, zero_apply,
    ContinuousLinearMap.comp_apply, ContinuousLinearMap.flip_apply, map_zero,
    zero_add, hmetric]
  ring

/-- If the normal form satisfies Codazzi and is symmetric on a neighborhood,
the metric-lowered derivative of its shape operator has both symmetries. -/
theorem chartShapeDerivative_symmetries (Γ : E → E →L[ℝ] E →L[ℝ] E)
    (K : E → E →L[ℝ] E →L[ℝ] ℝ) (S : E → E →L[ℝ] E) (b : E → E → E → ℝ)
    {x : E} (hK : DifferentiableAt ℝ K x) (hS : DifferentiableAt ℝ S x)
    (hdual : ∀ᶠ y in 𝓝 x, ∀ u v, b y u v = K y (S y u) v)
    (hmetric : ∀ X u v, fderiv ℝ K x X u v =
      K x (Γ x X u) v + K x u (Γ x X v))
    (hsym : ∀ᶠ y in 𝓝 x, ∀ u v, b y u v = b y v u)
    (hCodazzi : ∀ X u v, chartCovDerivTwo Γ b x X u v = chartCovDerivTwo Γ b x u X v) :
    let T := fun X u v => K x (bundleMapCovDeriv Γ Γ S x X u) v
    (∀ X u v, T X u v = T u X v) ∧ (∀ X u v, T X u v = T X v u) := by
  dsimp only
  have h := chartShapeDerivative_lower Γ K S b hK hS hdual hmetric
  constructor
  · intro X u v
    rw [h, h, hCodazzi]
  · intro X u v
    have hgerm : (fun y => b y u v) =ᶠ[𝓝 x] fun y => b y v u :=
      hsym.mono fun y hy => hy u v
    rw [h, h, chartCovDerivTwo, chartCovDerivTwo, hgerm.fderiv_eq,
      hsym.self_of_nhds (Γ x X u) v, hsym.self_of_nhds u (Γ x X v)]
    ring

end SmoothPoincare
