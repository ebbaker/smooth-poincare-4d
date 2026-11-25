import SmoothPoincare.Immersions.InducedBlock
import DifferentialGeometry.Geometry.Connection.ConnectionForm.Curvature
import Batteries.Tactic.OpenPrivate

/-! # The normal Codazzi equation on a Euclidean immersion chart -/

open DifferentialGeometry DifferentialGeometry.Geometry DifferentialGeometry.Geometry.Connection
open Filter
open scoped ContDiff Manifold Topology

namespace SmoothPoincare

open private bundleMapCovDeriv_curvature bundleMapCovDeriv_differentiableAt
  from DifferentialGeometry.Geometry.Connection.ConnectionForm.Curvature

variable {V W : Type*} [NormedAddCommGroup V] [NormedSpace ℝ V]
  [NormedAddCommGroup W] [InnerProductSpace ℝ W]

/-- Scalar normal component of the connection derivative of the chart differential. -/
noncomputable def chartNormalForm (A : V → V →L[ℝ] V →L[ℝ] V)
    (F n : V → W) (x X Y : V) : ℝ :=
  inner ℝ (bundleMapCovDeriv A 0 (fderiv ℝ F) x X Y) (n x)

/-- The covariant derivative of a covariant two-tensor on constant chart vectors. -/
noncomputable def chartCovDerivTwo (A : V → V →L[ℝ] V →L[ℝ] V)
    (b : V → V → V → ℝ) (x X Y Z : V) : ℝ :=
  fderiv ℝ (fun y => b y Y Z) x X - b x (A x X Y) Z - b x Y (A x X Z)

/-- A normal field of unit length on a neighborhood has tangential derivative
in the sense that each derivative is orthogonal to the field itself. -/
theorem normalDerivative_orthogonal {n : V → W} {x : V}
    (hn : DifferentiableAt ℝ n x) (hu : ∀ᶠ y in 𝓝 x, inner ℝ (n y) (n y) = 1)
    (X : V) : inner ℝ (n x) (fderiv ℝ n x X) = 0 := by
  have heq : (fun y => inner ℝ (n y) (n y)) =ᶠ[𝓝 x] fun _ => (1 : ℝ) := hu
  have hd := congrArg (fun L : V →L[ℝ] ℝ => L X) (heq.fderiv_eq.trans (fderiv_const_apply (1 : ℝ)))
  rw [(hn.hasFDerivAt.inner ℝ hn.hasFDerivAt).fderiv] at hd
  simp only [ContinuousLinearMap.comp_apply, ContinuousLinearMap.prod_apply,
    fderivInnerCLM_apply, zero_apply] at hd
  rw [real_inner_comm (n x) (fderiv ℝ n x X)] at hd
  linarith

/-- Codazzi follows by projecting the connection curvature identity for the
actual differential of the chart map. At the point, the normal-valued second
form lies in the chosen line; this is all the rank-one information used. -/
theorem chartNormalForm_codazzi (A : V → V →L[ℝ] V →L[ℝ] V)
    (F n : V → W) {x : V} (hA : DifferentiableAt ℝ A x)
    (hF : ContDiffAt ℝ 3 F x) (hn : DifferentiableAt ℝ n x)
    (hu : ∀ᶠ y in 𝓝 x, inner ℝ (n y) (n y) = 1)
    (hperp : ∀ Z, inner ℝ (fderiv ℝ F x Z) (n x) = 0)
    (hLine : ∀ Y Z, ∃ s : ℝ, bundleMapCovDeriv A 0 (fderiv ℝ F) x Y Z = s • n x)
    (hsym : ∀ X Y, A x X Y = A x Y X) (X Y Z : V) :
    chartCovDerivTwo A (chartNormalForm A F n) x X Y Z =
      chartCovDerivTwo A (chartNormalForm A F n) x Y X Z := by
  let B := bundleMapCovDeriv A (0 : V → V →L[ℝ] W →L[ℝ] W) (fderiv ℝ F)
  have hJ : ContDiffAt ℝ 2 (fderiv ℝ F) x := hF.fderiv_right (by norm_num)
  have hC : DifferentiableAt ℝ (0 : V → V →L[ℝ] W →L[ℝ] W) x := differentiableAt_const _
  have hDeriv (a b c : V) :
      fderiv ℝ (fun y => chartNormalForm A F n y b c) x a =
        inner ℝ (fderiv ℝ (fun y => B y b c) x a) (n x) := by
    have hB := bundleMapCovDeriv_differentiableAt hA hC hJ b c
    change fderiv ℝ (fun y => inner ℝ (B y b c) (n y)) x a = _
    rw [(hB.hasFDerivAt.inner ℝ hn.hasFDerivAt).fderiv]
    obtain ⟨s, hs⟩ := hLine b c
    change B x b c = s • n x at hs
    simp only [ContinuousLinearMap.comp_apply, ContinuousLinearMap.prod_apply, fderivInnerCLM_apply]
    change inner ℝ (B x b c) ((fderiv ℝ n x) a) + _ = _
    rw [hs, real_inner_smul_left, normalDerivative_orthogonal hn hu a, mul_zero, zero_add]
  have hcurv := congrArg (fun z : W => inner ℝ z (n x))
    (bundleMapCovDeriv_curvature hA hC hJ X Y Z)
  have hzero : connectionFormCurvature (0 : V → V →L[ℝ] W →L[ℝ] W) x X Y
      (fderiv ℝ F x Z) = 0 := by simp [connectionFormCurvature]
  rw [hzero] at hcurv
  simp only [connectionFormCovDeriv, Pi.zero_apply, zero_apply, add_zero,
    inner_zero_left, inner_add_left, inner_sub_left, hperp] at hcurv
  unfold chartCovDerivTwo
  rw [hDeriv, hDeriv, hsym X Y]
  unfold chartNormalForm
  dsimp only [B]
  linarith only [hcurv]

end SmoothPoincare
