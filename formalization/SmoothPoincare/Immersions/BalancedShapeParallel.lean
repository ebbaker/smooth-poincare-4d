import DifferentialGeometry.Geometry.Connection.ConnectionForm.Curvature
import SmoothPoincare.Immersions.CodazziJets

/-! # Parallel balanced shape in the metric chart -/

open DifferentialGeometry.Geometry.Connection Filter
open scoped Topology

namespace SmoothPoincare

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]

private theorem principalSign_sq (j : Fin 4) : saturatedPrincipalSign j ^ 2 = 1 := by
  fin_cases j <;> norm_num [saturatedPrincipalSign]

/-- The actual bundle-map covariant derivative has the eigenvalue derivative
as its same-sign block. Only the frame at the base point is used. -/
theorem balancedShapeCovDeriv_sameSign
    (Γ : E → E →L[ℝ] E →L[ℝ] E) (K : E → E →L[ℝ] E →L[ℝ] ℝ)
    (S : E → E →L[ℝ] E) (a : E → ℝ) {x : E}
    (hS : DifferentiableAt ℝ S x) (ha : DifferentiableAt ℝ a x) (hPos : 0 < a x)
    (hSquare : ∀ᶠ y in 𝓝 x, ∀ u, S y (S y u) = a y ^ 2 • u)
    (hSelf : ∀ u v, K x (S x u) v = K x u (S x v))
    (b : Module.Basis (Fin 4) ℝ E)
    (hOrtho : ∀ j k, K x (b j) (b k) = if j = k then 1 else 0)
    (hAdapted : ∀ j, S x (b j) = (saturatedPrincipalSign j * a x) • b j)
    (X : E) (j k : Fin 4) (hSame : saturatedPrincipalSign j = saturatedPrincipalSign k) :
    K x (bundleMapCovDeriv Γ Γ S x X (b j)) (b k) =
      if j = k then saturatedPrincipalSign j * fderiv ℝ a x X else 0 := by
  let dS := fderiv ℝ S x X
  let da := fderiv ℝ a x X
  let σ := saturatedPrincipalSign j
  have hσ : σ ^ 2 = 1 := principalSign_sq j
  have hσNe : σ ≠ 0 := by
    intro h
    rw [h] at hσ
    norm_num at hσ
  have hEigenJ : S x (b j) = (σ * a x) • b j := hAdapted j
  have hEigenK : S x (b k) = (σ * a x) • b k := by rw [hAdapted k, ← hSame]
  have hEq : (fun y => S y (S y (b j))) =ᶠ[𝓝 x] (fun y => a y ^ 2 • b j) :=
    hSquare.mono fun _ h => h (b j)
  have hLeft : fderiv ℝ (fun y => S y (S y (b j))) x X =
      S x (dS (b j)) + dS (S x (b j)) := by
    rw [(hS.hasFDerivAt.clm_apply (hS.hasFDerivAt.clm_apply
      (hasFDerivAt_const (b j) x))).fderiv]
    simp [dS]
  have hRight : fderiv ℝ (fun y => a y ^ 2 • b j) x X = ((2 * a x) * da) • b j := by
    rw [((ha.hasFDerivAt.pow 2).smul_const (b j)).fderiv]
    simp [da, two_mul]
  have hDiff : S x (dS (b j)) + dS (S x (b j)) = ((2 * a x) * da) • b j := by
    exact hLeft.symm.trans ((congrArg (fun L : E →L[ℝ] E => L X) hEq.fderiv_eq).trans hRight)
  have hPaired := congrArg (fun u => K x u (b k)) hDiff
  simp only [map_add, add_apply] at hPaired
  rw [hSelf (dS (b j)) (b k), hEigenK, hEigenJ] at hPaired
  simp only [map_smul, smul_apply, smul_eq_mul] at hPaired
  have hProjection : K x (dS (b j)) (b k) = (σ * da) * K x (b j) (b k) := by
    apply mul_left_cancel₀ (mul_ne_zero (by norm_num : (2 : ℝ) ≠ 0)
      (mul_ne_zero hσNe hPos.ne'))
    calc
      _ = ((2 * a x) * da) * K x (b j) (b k) := by
        calc
          _ = (σ * a x) * K x (dS (b j)) (b k) + (σ * a x) * K x (dS (b j)) (b k) := by ring
          _ = _ := hPaired
      _ = _ := by
        calc
          _ = σ ^ 2 * (((2 * a x) * da) * K x (b j) (b k)) := by rw [hσ, one_mul]
          _ = _ := by ring
  unfold bundleMapCovDeriv
  simp only [map_add, map_sub, add_apply, sub_apply]
  rw [hSelf (Γ x X (b j)) (b k), hEigenK, hEigenJ]
  simp only [map_smul, smul_apply, smul_eq_mul, add_sub_cancel_right]
  change K x (dS (b j)) (b k) = if j = k then σ * da else 0
  rw [hProjection, hOrtho]
  split <;> simp

/-- The first and last symmetry of the lowered covariant derivative and the
balanced spectrum force parallelism in every pair of directions at `x`. -/
theorem balancedShapeCovDeriv_eq_zero
    (Γ : E → E →L[ℝ] E →L[ℝ] E) (K : E → E →L[ℝ] E →L[ℝ] ℝ)
    (S : E → E →L[ℝ] E) (a : E → ℝ) {x : E}
    (hS : DifferentiableAt ℝ S x) (ha : DifferentiableAt ℝ a x) (hPos : 0 < a x)
    (hSquare : ∀ᶠ y in 𝓝 x, ∀ u, S y (S y u) = a y ^ 2 • u)
    (hSelf : ∀ u v, K x (S x u) v = K x u (S x v))
    (hMetricPos : ∀ u : E, u ≠ 0 → 0 < K x u u)
    (b : Module.Basis (Fin 4) ℝ E)
    (hOrtho : ∀ j k, K x (b j) (b k) = if j = k then 1 else 0)
    (hAdapted : ∀ j, S x (b j) = (saturatedPrincipalSign j * a x) • b j)
    (hCodazzi : ∀ X u v, K x (bundleMapCovDeriv Γ Γ S x X u) v =
      K x (bundleMapCovDeriv Γ Γ S x u X) v)
    (hAdjoint : ∀ X u v, K x (bundleMapCovDeriv Γ Γ S x X u) v =
      K x (bundleMapCovDeriv Γ Γ S x X v) u) :
    ∀ X u, bundleMapCovDeriv Γ Γ S x X u = 0 := by
  let T i j k := K x (bundleMapCovDeriv Γ Γ S x (b i) (b j)) (b k)
  obtain ⟨_, hJet⟩ := saturatedCodazziJets_zero T (fun i => fderiv ℝ a x (b i))
    (fun i j k => hCodazzi (b i) (b j) (b k)) (fun i j k => hAdjoint (b i) (b j) (b k))
    (fun i j k => balancedShapeCovDeriv_sameSign Γ K S a hS ha hPos hSquare hSelf
      b hOrtho hAdapted (b i) j k)
  have hBasis (i j : Fin 4) : bundleMapCovDeriv Γ Γ S x (b i) (b j) = 0 := by
    let w := bundleMapCovDeriv Γ Γ S x (b i) (b j)
    change w = 0
    have hZero : (K x w).toLinearMap = 0 := b.ext fun k => hJet i j k
    by_contra hne
    exact (hMetricPos w hne).ne' (congrArg (fun L : E →ₗ[ℝ] ℝ => L w) hZero)
  have hForU (i : Fin 4) (u : E) : bundleMapCovDeriv Γ Γ S x (b i) u = 0 := by
    let D := fderiv ℝ S x (b i) + (Γ x (b i)).comp (S x) - (S x).comp (Γ x (b i))
    have hZero : D.toLinearMap = 0 := b.ext (fun j => hBasis i j)
    exact congrArg (fun L : E →ₗ[ℝ] E => L u) hZero
  intro X u
  let D := (fderiv ℝ S x).flip u + (Γ x).flip (S x u) - (S x).comp ((Γ x).flip u)
  have hZero : D.toLinearMap = 0 := b.ext (fun i => hForU i u)
  exact congrArg (fun L : E →ₗ[ℝ] E => L X) hZero

end SmoothPoincare
