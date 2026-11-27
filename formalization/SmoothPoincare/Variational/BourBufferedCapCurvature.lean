import SmoothPoincare.Variational.BourBufferedTruncation
import DifferentialGeometry.Geometry.Metric.Conformal.Curvature
import DifferentialGeometry.Geometry.Operator.HessianComposition

/-! # Curvature of the physical buffered cap

27 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance.
Actual serving model and effort were unavailable.
-/

set_option autoImplicit false
set_option maxHeartbeats 1000000

noncomputable section

open DifferentialGeometry
open DifferentialGeometry.Geometry (gaussianPotential gaussianPotential_apply
  gaussianPotential_gradFun gaussianPotential_hessian euclideanMetric_metricRm04At_eq_zero)
open DifferentialGeometry.Geometry.Curvature DifferentialGeometry.Geometry.Connection
open DifferentialGeometry.Geometry.Operator DifferentialGeometry.CheegerGromovCompactness
open FirstOrderTwistor SectionsAndConnections Set Filter
open DifferentialGeometry.Topology.Manifold
open scoped ContDiff Manifold Topology RealInnerProductSpace

namespace SmoothPoincare

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "I₄" => 𝓘(ℝ, E₄)
local notation "S₄" => StandardFourSphere

private local instance : Fact (Module.finrank ℝ (EuclideanSpace ℝ (Fin 5)) = 4 + 1) :=
  ⟨by simp⟩

private def capLogSquared (r b t : ℝ) : ℝ :=
  Real.smoothTransition (4 * t / b ^ 2 - 1) *
    Real.log (2 * r / (r ^ 2 + 4 * t))

private theorem capLogSquared_contDiff {r b : ℝ} (hr : 0 < r) (hb : 0 < b) :
    ContDiff ℝ ∞ (capLogSquared r b) := by
  rw [contDiff_iff_contDiffAt]
  intro t
  by_cases ht : 0 < t
  · have hLin : ContDiff ℝ ∞ (fun y : ℝ => 4 * y) := contDiff_const.mul contDiff_id
    have hDen : ContDiff ℝ ∞ (fun y : ℝ => r ^ 2 + 4 * y) := contDiff_const.add hLin
    have hArg : ContDiffAt ℝ ∞ (fun y : ℝ => 2 * r / (r ^ 2 + 4 * y)) t :=
      contDiffAt_const.div hDen.contDiffAt (by positivity)
    exact ((Real.smoothTransition.contDiff.comp
      ((hLin.div_const (b ^ 2)).sub contDiff_const)).contDiffAt).mul
      (hArg.log (by positivity : 2 * r / (r ^ 2 + 4 * t) ≠ 0))
  · have htb : t < b ^ 2 / 4 := lt_of_le_of_lt (le_of_not_gt ht) (by positivity)
    have hEq : capLogSquared r b =ᶠ[𝓝 t] fun _ => (0 : ℝ) := by
      filter_upwards [eventually_lt_nhds htb] with y hy
      have hCut : 4 * y / b ^ 2 - 1 ≤ 0 := by
        have h := (div_le_iff₀ (sq_pos_of_pos hb)).2
          (show 4 * y ≤ 1 * b ^ 2 by linarith)
        linarith
      simp [capLogSquared, Real.smoothTransition.zero_of_nonpos hCut]
    exact contDiffAt_const.congr_of_eventuallyEq hEq

private def capLogPotential (r b : ℝ) (hr : 0 < r) (hb : 0 < b) :
    C^∞⟮I₄, E₄; ℝ⟯ :=
  ⟨fun x => capLogSquared r b (gaussianPotential x),
    (capLogSquared_contDiff hr hb).contMDiff.comp (gaussianPotential (E := E₄)).contMDiff⟩

private theorem capLogPotential_at (r b : ℝ) (hr : 0 < r) (hb : 0 < b) (x : E₄) :
    Real.exp (capLogPotential r b hr hb x) = bourBufferedRadialSpeed r b ‖x‖ := by
  have h : 4 * (‖x‖ ^ 2 / 4) = ‖x‖ ^ 2 := by ring
  change Real.exp (capLogSquared r b (gaussianPotential x)) = _
  rw [gaussianPotential_apply, capLogSquared, h, bourBufferedRadialSpeed]

private theorem capChart_local (r : ℝ) (hr : 0 < r) :
    IsLocalDiffeomorph I₄ I₄ ∞ (bourBufferedSphereChart r hr : E₄ → S₄) :=
  fun x => (bourBufferedSphereChart r hr).isLocalDiffeomorphAt I₄ I₄ ∞
    (by change x ∈ (transportedCapPocketChart r hr).target
        rw [transportedCapPocketChart_target]
        trivial)

private theorem capChart_pullMetric (r b : ℝ) (hr : 0 < r) (hb : 0 < b) :
    localPullMetric (bourBufferedSphereMetric r hr b hb) (bourBufferedSphereChart r hr)
      (capChart_local r hr) =
      conformalMetric (euclideanMetric (E := E₄)) (capLogPotential r b hr hb) := by
  apply SmoothRiemannianMetric.ext_inner
  intro x u v
  rw [localPullMetric_inner, conformalMetric_inner, euclideanMetric_inner,
    two_mul, Real.exp_add, capLogPotential_at, ← pow_two]
  exact bourBufferedSphereMetric_radial_inner hr hb x u v

private theorem capGaussian_differential (x : E₄) (u : TangentSpace I₄ x) :
    mvfderiv I₄ (gaussianPotential (E := E₄) : E₄ → ℝ) x u = (1 / 2 : ℝ) * (@inner ℝ E₄ _ x u) := by
  rw [← inner_gradientFun]
  change (euclideanMetric (E := E₄)).inner x (gradFun euclideanMetric gaussianPotential x) u = _
  rw [euclideanMetric_inner]
  change @inner ℝ E₄ _ (gradFun euclideanMetric gaussianPotential x) u = _
  rw [gaussianPotential_gradFun]
  exact real_inner_smul_left (x : E₄) (u : E₄) _

private theorem capLogPotential_differential (r b : ℝ) (hr : 0 < r) (hb : 0 < b)
    (x : E₄) (u : TangentSpace I₄ x) :
    mvfderiv I₄ (capLogPotential r b hr hb : E₄ → ℝ) x u =
      (deriv (capLogSquared r b) (gaussianPotential x) / 2) * (@inner ℝ E₄ _ x u) := by
  have h := mvfderiv_comp_apply (I := 𝓘(ℝ)) (I' := I₄)
    (f := (gaussianPotential (E := E₄) : E₄ → ℝ)) (g := capLogSquared r b) x
    (((capLogSquared_contDiff hr hb).differentiable (by simp) _).mdifferentiableAt)
    ((gaussianPotential (E := E₄)).contMDiff.mdifferentiable (by simp) x) u
  have hd := ((capLogSquared_contDiff hr hb).differentiable (by simp) (gaussianPotential x)).hasDerivAt
  rw [mvfderiv_real_model_eq_fderiv, hd.hasFDerivAt.fderiv] at h
  have he : (NormedSpace.fromTangentSpace (gaussianPotential (E := E₄) x))
      (mfderiv I₄ 𝓘(ℝ) (gaussianPotential (E := E₄) : E₄ → ℝ) x u) =
      mvfderiv I₄ (gaussianPotential (E := E₄) : E₄ → ℝ) x u := rfl
  rw [he, capGaussian_differential] at h
  change mvfderiv I₄ (capLogPotential r b hr hb : E₄ → ℝ) x u = _ at h
  rw [h, ContinuousLinearMap.toSpanSingleton_apply, smul_eq_mul]
  ring

private theorem capLogPotential_gradient (r b : ℝ) (hr : 0 < r) (hb : 0 < b)
    (x : E₄) :
    (gradientFun (euclideanMetric (E := E₄)) (capLogPotential r b hr hb) x : E₄) =
      (deriv (capLogSquared r b) (gaussianPotential x) / 2) • x := by
  apply ext_inner_right ℝ (E := E₄)
  intro u
  change (euclideanMetric (E := E₄)).inner x
    (gradientFun euclideanMetric (capLogPotential r b hr hb) x) u =
      @inner ℝ E₄ _ ((deriv (capLogSquared r b) (gaussianPotential x) / 2) • x) u
  calc
    _ = mvfderiv I₄ (capLogPotential r b hr hb : E₄ → ℝ) x (u : TangentSpace I₄ x) :=
      inner_gradientFun _ _ x (u : TangentSpace I₄ x)
    _ = _ := (capLogPotential_differential r b hr hb x (u : TangentSpace I₄ x)).trans
      (real_inner_smul_left (x : E₄) u _).symm

private theorem capLogPotential_hessian (r b : ℝ) (hr : 0 < r) (hb : 0 < b)
    (x : E₄) (u v : TangentSpace I₄ x) :
    hessFun (euclideanMetric (E := E₄)) (capLogPotential r b hr hb) x u v =
      (deriv (deriv (capLogSquared r b)) (gaussianPotential x) / 4) *
        (@inner ℝ E₄ _ x u) * (@inner ℝ E₄ _ x v) +
      (deriv (capLogSquared r b) (gaussianPotential x) / 2) * (@inner ℝ E₄ _ u v) := by
  change hessFun (euclideanMetric (E := E₄)) (fun y =>
    capLogSquared r b (gaussianPotential y)) x u v = _
  rw [hessFun_comp _ (capLogSquared_contDiff hr hb) (gaussianPotential (E := E₄)).contMDiff,
    capGaussian_differential, capGaussian_differential, gaussianPotential_hessian,
    euclideanMetric_inner]
  ring_nf
  rfl

private theorem capLogPotential_cov_gradient (r b : ℝ) (hr : 0 < r) (hb : 0 < b)
    (x : E₄) (u v : TangentSpace I₄ x) :
    (euclideanMetric (E := E₄)).inner x
        ((LeviCivita (euclideanMetric (E := E₄))) (gradientFun euclideanMetric
          (capLogPotential r b hr hb)) x u) v =
      (deriv (deriv (capLogSquared r b)) (gaussianPotential x) / 4) *
        (@inner ℝ E₄ _ x u) * (@inner ℝ E₄ _ x v) +
      (deriv (capLogSquared r b) (gaussianPotential x) / 2) * (@inner ℝ E₄ _ u v) := by
  exact (hessFun_eq_cov_grad _ (capLogPotential r b hr hb).contMDiff x u v).symm.trans
    (capLogPotential_hessian r b hr hb x u v)

/-- The full physical curvature tensor in the actual stereographic chart.
The vectors on the left are native Euclidean vectors pushed to the sphere.
The last pair follows the library's `Rm(u,v,v,u)` sectional convention. -/
theorem bourBufferedCapCurvature_native {r b : ℝ} (hr : 0 < r) (hb : 0 < b)
    (x : E₄) (u v w z : TangentSpace I₄ x) :
    let Q := bourBufferedSphereChart r hr
    let dQ := mfderiv I₄ I₄ Q x
    let σ := deriv (capLogSquared r b) (gaussianPotential x) / 2
    let τ := deriv (deriv (capLogSquared r b)) (gaussianPotential x) / 4
    metricRm04StandardAt (bourBufferedSphereMetric r hr b hb) (Q x)
        (dQ u) (dQ v) (dQ w) (dQ z) =
      bourBufferedRadialSpeed r b ‖x‖ ^ 2 *
        ((-2 * σ - σ ^ 2 * ‖x‖ ^ 2) *
            ((@inner ℝ E₄ _ u z) * (@inner ℝ E₄ _ v w) - (@inner ℝ E₄ _ u w) * (@inner ℝ E₄ _ v z)) +
          (σ ^ 2 - τ) *
            ((@inner ℝ E₄ _ x u) * (@inner ℝ E₄ _ x z) * (@inner ℝ E₄ _ v w) + (@inner ℝ E₄ _ x v) * (@inner ℝ E₄ _ x w) * (@inner ℝ E₄ _ u z) -
             (@inner ℝ E₄ _ x u) * (@inner ℝ E₄ _ x w) * (@inner ℝ E₄ _ v z) - (@inner ℝ E₄ _ x v) * (@inner ℝ E₄ _ x z) * (@inner ℝ E₄ _ u w))) := by
  dsimp only
  let g := euclideanMetric (E := E₄)
  let F := capLogPotential r b hr hb
  have hFlat : g.inner x z (riemannOp (LeviCivita g) x u v w) = 0 := by
    rw [← metricRm04StandardAt_eq_inner_riemannOp, metricRm04StandardAt_apply,
      euclideanMetric_metricRm04At_eq_zero]
    rfl
  have hGrad : normGradSqFun g F x =
      (deriv (capLogSquared r b) (gaussianPotential x) / 2) ^ 2 * ‖x‖ ^ 2 := by
    rw [normGradSqFun_def, euclideanMetric_inner]
    change @inner ℝ E₄ _ (gradientFun g F x) (gradientFun g F x) = _
    rw [show (gradientFun g F x : E₄) = _ from capLogPotential_gradient r b hr hb x,
      real_inner_smul_left, real_inner_smul_right, real_inner_self_eq_norm_sq]
    ring
  rw [← metricRm04StandardAt_localPullMetric _ _ (capChart_local r hr),
    capChart_pullMetric, metricRm04StandardAt_eq_inner_riemannOp,
    riemannOp_conformalMetric, conformalMetric_inner,
    two_mul, Real.exp_add, capLogPotential_at, ← pow_two]
  simp only [g, F] at hFlat hGrad
  simp only [map_add, map_sub, map_smul, smul_eq_mul, hFlat, zero_add, hGrad]
  rw [g.symm x z ((LeviCivita g) (gradientFun g F) x u),
    g.symm x z ((LeviCivita g) (gradientFun g F) x v),
    g.symm x z (gradientFun g F x), inner_gradientFun]
  rw [capLogPotential_cov_gradient r b hr hb x u w,
    capLogPotential_cov_gradient r b hr hb x v w,
    capLogPotential_cov_gradient r b hr hb x u z,
    capLogPotential_cov_gradient r b hr hb x v z]
  have hDiffz : mvfderiv I₄ (F : E₄ → ℝ) x z =
      (deriv (capLogSquared r b) (gaussianPotential x) / 2) * (@inner ℝ E₄ _ x z) :=
    capLogPotential_differential r b hr hb x z
  rw [g.symm x z u, g.symm x z v]
  simp only [hDiffz, capLogPotential_differential, g, euclideanMetric_inner]
  ring!


private theorem capQuarterSquare_hasDerivAt (ρ : ℝ) :
    HasDerivAt (fun t : ℝ => t ^ 2 / 4) (ρ / 2) ρ := by
  convert ((hasDerivAt_id ρ).pow 2).div_const (4 : ℝ) using 1
  · rfl
  · norm_num
    ring

private theorem capLengthFactor_hasDerivAt {r b : ℝ} (hr : 0 < r) (hb : 0 < b) (ρ : ℝ) :
    HasDerivAt (bourBufferedRadialSpeed r b)
      (bourBufferedRadialSpeed r b ρ * ρ * (deriv (capLogSquared r b) (ρ ^ 2 / 4) / 2)) ρ := by
  have hC := ((capLogSquared_contDiff hr hb).differentiable (by simp) (ρ ^ 2 / 4)).hasDerivAt
  have hExp := (hC.comp ρ (capQuarterSquare_hasDerivAt ρ)).exp
  have hFun : (fun t => Real.exp (capLogSquared r b (t ^ 2 / 4))) =
      bourBufferedRadialSpeed r b := by
    funext t
    have ht : 4 * (t ^ 2 / 4) = t ^ 2 := by ring
    change Real.exp (capLogSquared r b (t ^ 2 / 4)) = bourBufferedRadialSpeed r b t
    rw [capLogSquared, ht, bourBufferedRadialSpeed]
  have hValue (t : ℝ) : Real.exp (capLogSquared r b (t ^ 2 / 4)) =
      bourBufferedRadialSpeed r b t := congrFun hFun t
  change HasDerivAt (fun t => Real.exp (capLogSquared r b (t ^ 2 / 4)))
    (Real.exp (capLogSquared r b (ρ ^ 2 / 4)) *
      (deriv (capLogSquared r b) (ρ ^ 2 / 4) * (ρ / 2))) ρ at hExp
  rw [hFun, hValue] at hExp
  convert hExp using 1
  ring

/-- Curvature coefficients of the radial conformal log potential agree
with the physical arclength second jet of the same angular radius. -/
private theorem capArclength_warp_curvature {r b ρ : ℝ} (hr : 0 < r) (hb : 0 < b)
    (hρ : 0 < ρ) {f : ℝ → ℝ} (hf : ContDiff ℝ ∞ f)
    (hRadius : (f ∘ bourBufferedRadialLength r b) =ᶠ[𝓝 ρ]
      (fun t => t * bourBufferedRadialSpeed r b t)) :
    let s := bourBufferedRadialLength r b ρ
    let speed := bourBufferedRadialSpeed r b ρ
    let σ := deriv (capLogSquared r b) (ρ ^ 2 / 4) / 2
    let τ := deriv (deriv (capLogSquared r b)) (ρ ^ 2 / 4) / 4
    (-deriv (deriv f) s / f s) = (-2 * σ - ρ ^ 2 * τ) / speed ^ 2 ∧
      (1 - deriv f s ^ 2) / f s ^ 2 = (-2 * σ - σ ^ 2 * ρ ^ 2) / speed ^ 2 := by
  intro s speed σ τ
  let σAt := fun t : ℝ => deriv (capLogSquared r b) (t ^ 2 / 4) / 2
  have hspeed : speed ≠ 0 := (bourBufferedRadialSpeed_pos r b ρ).ne'
  have hF : f s = ρ * speed := hRadius.eq_of_nhds
  have hSlope : (deriv f ∘ bourBufferedRadialLength r b) =ᶠ[𝓝 ρ]
      (fun t => 1 + t ^ 2 * σAt t) := by
    filter_upwards [hRadius.eventuallyEq_nhds] with t ht
    have h := bourBufferedAngularRadius_arclength_deriv hr b t
      ((hf.differentiable (by simp) (bourBufferedRadialLength r b t)).hasDerivAt) ht
    rw [(capLengthFactor_hasDerivAt hr hb t).deriv] at h
    change deriv f (bourBufferedRadialLength r b t) = _
    rw [h]
    have htspeed := (bourBufferedRadialSpeed_pos r b t).ne'
    dsimp [σAt]
    field_simp [htspeed]
  have hFirst : deriv f s = 1 + ρ ^ 2 * σ := hSlope.eq_of_nhds
  have hQ := capQuarterSquare_hasDerivAt ρ
  have hDiff := (contDiff_infty_iff_deriv.mp (capLogSquared_contDiff hr hb)).2
  have hSigma := (((hDiff.differentiable (by simp) (ρ ^ 2 / 4)).hasDerivAt.comp ρ hQ).div_const 2)
  have hSigma' : HasDerivAt σAt (ρ * τ) ρ := by
    convert hSigma using 1
    dsimp [τ]
    ring
  have hNative := (((hasDerivAt_id ρ).pow 2).mul hSigma').const_add 1
  have hArclength := (((contDiff_infty_iff_deriv.mp hf).2.differentiable (by simp) s).hasDerivAt).comp
    ρ (bourBufferedRadialLength_hasDerivAt hr b ρ)
  have hSecond := (hArclength.congr_of_eventuallyEq hSlope.symm).unique hNative
  change deriv (deriv f) s * speed = 2 * ρ ^ 1 * 1 * σ + ρ ^ 2 * (ρ * τ) at hSecond
  have hSecond' : deriv (deriv f) s = (2 * ρ * σ + ρ ^ 3 * τ) / speed := by
    apply (eq_div_iff hspeed).mpr
    rw [hSecond]
    ring
  constructor
  · rw [hF, hSecond']
    field_simp [hρ.ne', hspeed]
    ring
  · rw [hF, hFirst]
    field_simp [hρ.ne', hspeed]
    ring


private def capKronecker (a b : Fin 4) : ℝ := if a = b then 1 else 0

private theorem capRadial_slots (a b i j : Fin 4) (ρ ε : ℝ) (hε : ε ^ 2 = 1) :
    let δ := capKronecker
    let n := fun k : Fin 4 => if k = 0 then ε * ρ else 0
    n a * n i * δ b j + n b * n j * δ a i - n a * n j * δ b i - n b * n i * δ a j =
      if a = 0 ∨ b = 0 then ρ ^ 2 * (δ a i * δ b j - δ a j * δ b i) else 0 := by
  have hSquare : (ε * ρ) * (ε * ρ) = ρ ^ 2 := by
    rw [← pow_two, mul_pow, hε, one_mul]
  dsimp only
  by_cases ha : a = 0 <;> by_cases hb : b = 0 <;>
    by_cases hi : i = 0 <;> by_cases hj : j = 0 <;>
    simp [ha, hb, hi, hj, capKronecker, eq_comm (a := (0 : Fin 4)), hSquare]

/-- In a physical orthonormal frame obtained by pushing a radial-first
Euclidean orthonormal frame through the actual chart, all curvature slots
are the warped cap tensor. Reversing the first vector preserves the formula. -/
theorem bourBufferedCapCurvature_frame {r b : ℝ} (hr : 0 < r) (hb : 0 < b)
    (x : E₄) (hx : 0 < ‖x‖) {f : ℝ → ℝ} (hf : ContDiff ℝ ∞ f)
    (hRadius : (f ∘ bourBufferedRadialLength r b) =ᶠ[𝓝 ‖x‖]
      (fun t => t * bourBufferedRadialSpeed r b t))
    (e : OrthonormalBasis (Fin 4) ℝ E₄) {ε : ℝ} (hε : ε ^ 2 = 1)
    (he : ∀ i, ⟪x, e i⟫ = if i = 0 then ε * ‖x‖ else 0)
    (o : ManifoldOrientation I₄ S₄ 4)
    (frame : OrientedOrthonormalFrameAt (bourBufferedSphereMetric r hr b hb) o
      (bourBufferedSphereChart r hr x))
    (hFrame : ∀ i, frame.basis i = mfderiv I₄ I₄ (bourBufferedSphereChart r hr) x
      ((bourBufferedRadialSpeed r b ‖x‖)⁻¹ • e i)) :
    let s := bourBufferedRadialLength r b ‖x‖
    metricCurvatureFrameTensor (bourBufferedSphereMetric r hr b hb) o
      (bourBufferedSphereChart r hr x) frame =
      bourClosedCapFrameCurvature (-deriv (deriv f) s / f s) ((1 - deriv f s ^ 2) / f s ^ 2) := by
  intro s
  have hJets := capArclength_warp_curvature hr hb hx hf hRadius
  dsimp only at hJets
  funext a b₁ i j
  let vT (k : Fin 4) : TangentSpace I₄ x := (bourBufferedRadialSpeed r b ‖x‖)⁻¹ • (e k : E₄)
  have hFrame' (k : Fin 4) : frame.basis k =
      mfderiv I₄ I₄ (bourBufferedSphereChart r hr) x (vT k) := hFrame k
  simp only [metricCurvatureFrameTensor, hFrame']
  rw [bourBufferedCapCurvature_native hr hb x (vT a) (vT b₁) (vT j) (vT i),
    hJets.1, hJets.2, gaussianPotential_apply]
  let δ := capKronecker
  let n := fun k : Fin 4 => if k = 0 then ε * ‖x‖ else 0
  let speed := bourBufferedRadialSpeed r b ‖x‖
  let σ := deriv (capLogSquared r b) (‖x‖ ^ 2 / 4) / 2
  let τ := deriv (deriv (capLogSquared r b)) (‖x‖ ^ 2 / 4) / 4
  let v : Fin 4 → E₄ := fun k => speed⁻¹ • e k
  have hV (k l : Fin 4) : ⟪v k, v l⟫ = speed⁻¹ * (speed⁻¹ * δ k l) := by
    simp only [v, real_inner_smul_left, real_inner_smul_right, e.inner_eq_ite, δ, capKronecker]
  have hN (k : Fin 4) : ⟪x, v k⟫ = speed⁻¹ * n k := by
    simp only [v, real_inner_smul_right, he, n]
  let d := δ a i * δ b₁ j - δ a j * δ b₁ i
  let c := n a * n i * δ b₁ j + n b₁ * n j * δ a i -
    n a * n j * δ b₁ i - n b₁ * n i * δ a j
  change speed ^ 2 *
      ((-2 * σ - σ ^ 2 * ‖x‖ ^ 2) *
          (⟪v a, v i⟫ * ⟪v b₁, v j⟫ - ⟪v a, v j⟫ * ⟪v b₁, v i⟫) +
        (σ ^ 2 - τ) *
          (⟪x, v a⟫ * ⟪x, v i⟫ * ⟪v b₁, v j⟫ + ⟪x, v b₁⟫ * ⟪x, v j⟫ * ⟪v a, v i⟫ -
           ⟪x, v a⟫ * ⟪x, v j⟫ * ⟪v b₁, v i⟫ - ⟪x, v b₁⟫ * ⟪x, v i⟫ * ⟪v a, v j⟫)) =
    (if a = 0 ∨ b₁ = 0 then (-2 * σ - ‖x‖ ^ 2 * τ) / speed ^ 2
      else (-2 * σ - σ ^ 2 * ‖x‖ ^ 2) / speed ^ 2) * d
  simp only [hV, hN]
  have hScaled :
      speed ^ 2 *
        ((-2 * σ - σ ^ 2 * ‖x‖ ^ 2) *
          (speed⁻¹ * (speed⁻¹ * δ a i) * (speed⁻¹ * (speed⁻¹ * δ b₁ j)) -
           speed⁻¹ * (speed⁻¹ * δ a j) * (speed⁻¹ * (speed⁻¹ * δ b₁ i))) +
         (σ ^ 2 - τ) *
          (speed⁻¹ * n a * (speed⁻¹ * n i) * (speed⁻¹ * (speed⁻¹ * δ b₁ j)) +
           speed⁻¹ * n b₁ * (speed⁻¹ * n j) * (speed⁻¹ * (speed⁻¹ * δ a i)) -
           speed⁻¹ * n a * (speed⁻¹ * n j) * (speed⁻¹ * (speed⁻¹ * δ b₁ i)) -
           speed⁻¹ * n b₁ * (speed⁻¹ * n i) * (speed⁻¹ * (speed⁻¹ * δ a j)))) =
      ((-2 * σ - σ ^ 2 * ‖x‖ ^ 2) * d + (σ ^ 2 - τ) * c) / speed ^ 2 := by
    have hSpeed : speed ≠ 0 := (bourBufferedRadialSpeed_pos r b ‖x‖).ne'
    dsimp only [d, c]
    field_simp [hSpeed]
  rw [hScaled, show c = if a = 0 ∨ b₁ = 0 then ‖x‖ ^ 2 * d else 0 from
    capRadial_slots a b₁ i j ‖x‖ ε hε]
  split_ifs <;> ring

end SmoothPoincare
