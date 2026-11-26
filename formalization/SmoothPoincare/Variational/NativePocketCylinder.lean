import SmoothPoincare.Variational.NativePocketCaps
import SmoothPoincare.Variational.ExactFacePhysicalInterpolation
import SmoothPoincare.PhysicalScales.MarkedProductWidth
import DifferentialGeometry.Topology.Manifold.Sphere.PolarCoordinates

/-! # The central product cylinder in a flattened native pocket -/

noncomputable section

open DifferentialGeometry DifferentialGeometry.Geometry DifferentialGeometry.Geometry.Curvature FirstOrderTwistor
open Function Manifold Metric Set Filter DifferentialGeometry.Topology.Manifold
open scoped ContDiff Manifold Topology RealInnerProductSpace ENNReal

namespace SmoothPoincare

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "I₄" => 𝓘(ℝ, E₄)
local notation "J" => ModelWithCorners.prod (𝓡 3) (𝓘(ℝ))
private local instance : Fact (Module.finrank ℝ E₄ = 3 + 1) := ⟨by simp⟩
private local instance : Nonempty ExactFaceSphere :=
  ⟨⟨EuclideanSpace.single 0 1, mem_sphere_zero_iff_norm.mpr (by simp)⟩⟩

private def pocketRadiusShift : ℝ ≃ₘ[ℝ] ℝ where
  toFun t := 1 + t
  invFun r := r - 1
  left_inv t := by dsimp; ring
  right_inv r := by dsimp; ring
  contMDiff_toFun := contMDiff_const.add contMDiff_id
  contMDiff_invFun := contMDiff_id.sub contMDiff_const

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H}
  [TopologicalSpace M] [ChartedSpace H M]

/-- The full angular marking with signed chart coordinate `t = |x| - 1`. -/
def nativePocketMarking (F : PartialDiffeomorph I₄ I E₄ M ∞) (p : ExactFaceSphere) :
    PartialDiffeomorph J I ExactFaceTube M ∞ :=
  (((Diffeomorph.refl (𝓡 3) ExactFaceSphere ∞).prodCongr pocketRadiusShift).toPartialDiffeomorph.trans
    (spherePolarChart (n := 3) p)).trans F

@[simp] theorem nativePocketMarking_apply (F : PartialDiffeomorph I₄ I E₄ M ∞)
    (p : ExactFaceSphere) (q : ExactFaceTube) :
    nativePocketMarking F p q = F ((1 + q.2) • (q.1 : E₄)) := rfl

theorem nativePocketMarking_mem_source (F : PartialDiffeomorph I₄ I E₄ M ∞)
    (p : ExactFaceSphere) (q : ExactFaceTube) (hpos : 0 < 1 + q.2)
    (hsrc : (1 + q.2) • (q.1 : E₄) ∈ F.source) :
    q ∈ (nativePocketMarking F p).source :=
  ⟨⟨trivial, hpos⟩, hsrc⟩

/-- The compressed annulus, with the same angular direction and signed height. -/
def nativePocketLogPolar (b ℓ : ℝ) (q : ExactFaceTube) : E₄ :=
  (b * Real.exp (q.2 / ℓ)) • (q.1 : E₄)

theorem nativePocketLogPolar_norm {b : ℝ} (hb : 0 < b) (ℓ : ℝ) (q : ExactFaceTube) :
    ‖nativePocketLogPolar b ℓ q‖ = b * Real.exp (q.2 / ℓ) := by
  rw [nativePocketLogPolar, norm_smul, Real.norm_of_nonneg (by positivity),
    norm_eq_of_mem_sphere, mul_one]

theorem nativePocketLogPolar_time {b ℓ : ℝ} (hb : 0 < b) (hℓ : 0 < ℓ)
    (q : ExactFaceTube) : ℓ * Real.log (‖nativePocketLogPolar b ℓ q‖ / b) = q.2 := by
  rw [nativePocketLogPolar_norm hb, mul_div_cancel_left₀ _ hb.ne', Real.log_exp]
  field_simp

theorem nativePocketLogPolar_angle (p : ExactFaceSphere) {b : ℝ} (hb : 0 < b) (ℓ : ℝ)
    (q : ExactFaceTube) : sphereDirection p (nativePocketLogPolar b ℓ q) = q.1 :=
  sphereDirection_pos_smul p q.1 (by positivity : 0 < b * Real.exp (q.2 / ℓ))

private theorem nativePocketLogPolar_smooth (b ℓ : ℝ) :
    ContMDiff J I₄ ∞ (nativePocketLogPolar b ℓ) :=
  ((contMDiff_const.mul (Real.contDiff_exp.contMDiff.comp (contMDiff_snd.div_const ℓ))).smul
    ((contMDiff_coe_sphere (E := E₄) (n := 3)).comp contMDiff_fst))

private theorem nativePocketLogPolar_deriv (b ℓ : ℝ) (q : ExactFaceTube)
    (v : TangentSpace J q) :
    mfderiv J I₄ (nativePocketLogPolar b ℓ) q v =
      (b * Real.exp (q.2 / ℓ) * (v.2 / ℓ)) • (q.1 : E₄) +
      (b * Real.exp (q.2 / ℓ)) • dIncl (E := E₄) (n := 3) q.1 v.1 := by
  let f : ℝ → ℝ := fun t => b * Real.exp (t / ℓ)
  let c : ExactFaceTube → ℝ := f ∘ Prod.snd
  let a : ExactFaceTube → E₄ := ((↑) : ExactFaceSphere → E₄) ∘ Prod.fst
  have hf : HasDerivAt f (b * (Real.exp (q.2 / ℓ) * (1 / ℓ))) q.2 := by
    simpa only [f, id_eq] using (((hasDerivAt_id q.2).div_const ℓ).exp.const_mul b)
  have hfd : MDifferentiableAt 𝓘(ℝ) 𝓘(ℝ) f q.2 :=
    hf.hasFDerivAt.hasMFDerivAt.mdifferentiableAt
  have hcd : MDifferentiableAt J 𝓘(ℝ) c q := hfd.comp q mdifferentiableAt_snd
  have hinc : MDifferentiableAt (𝓡 3) I₄ ((↑) : ExactFaceSphere → E₄) q.1 :=
    (contMDiff_coe_sphere (E := E₄) (n := 3)).mdifferentiable
      (by decide : (∞ : ℕ∞ω) ≠ 0) q.1
  have had : MDifferentiableAt J I₄ a q := hinc.comp q mdifferentiableAt_fst
  have hc : mvfderiv J c q v = b * Real.exp (q.2 / ℓ) * (v.2 / ℓ) := by
    rw [mvfderiv_comp_apply q hfd mdifferentiableAt_snd, mfderiv_snd, mvfderiv_eq_fderiv,
      hf.hasFDerivAt.fderiv]
    change v.2 * (b * (Real.exp (q.2 / ℓ) * (1 / ℓ))) = _
    ring
  have ha : mvfderiv J a q v = dIncl (E := E₄) (n := 3) q.1 v.1 := by
    rw [mvfderiv_comp_apply q hinc mdifferentiableAt_fst, mfderiv_fst]
    rfl
  change mvfderiv J (c • a) q v = _
  rw [mvfderiv_smul hcd had]
  simp only [add_apply, ContinuousLinearMap.smulRight_apply, smul_apply, hc, ha]
  exact add_comm _ _

/-- The exact Euclidean polar tensor times the square of `ℓ / |x|`.
The angular metric comes from the actual unit sphere, and the signed height
has coefficient one. -/
theorem nativePocketLogPolar_product_inner {b ℓ : ℝ} (hb : 0 < b) (hℓ : 0 < ℓ)
    (q : ExactFaceTube) (v w : TangentSpace J q) :
    (ℓ / ‖nativePocketLogPolar b ℓ q‖) ^ 2 *
      @inner ℝ E₄ _ (mfderiv J I₄ (nativePocketLogPolar b ℓ) q v)
        (mfderiv J I₄ (nativePocketLogPolar b ℓ) q w) =
      v.2 * w.2 + ℓ ^ 2 * (roundMetric (E := E₄) (n := 3)).inner q.1 v.1 w.1 := by
  let ρ := b * Real.exp (q.2 / ℓ)
  let a (u : TangentSpace J q) := dIncl (E := E₄) (n := 3) q.1 u.1
  have hρ : ρ ≠ 0 := (mul_pos hb (Real.exp_pos _)).ne'
  have huu : ⟪(q.1 : E₄), (q.1 : E₄)⟫ = 1 := by
    rw [real_inner_self_eq_norm_sq, norm_eq_of_mem_sphere, one_pow]
  have hua (u : TangentSpace J q) : ⟪(q.1 : E₄), a u⟫ = 0 := by
    change ⟪(q.1 : E₄), dIncl (n := 3) q.1 u.1⟫ = 0
    rw [← dInclEquiv_coe (n := 3) q.1 u.1]
    exact Submodule.mem_orthogonal_singleton_iff_inner_right.mp (dInclEquiv (n := 3) q.1 u.1).2
  have hau (u : TangentSpace J q) : ⟪a u, (q.1 : E₄)⟫ = 0 :=
    (real_inner_comm _ _).trans (hua u)
  rw [nativePocketLogPolar_norm hb, nativePocketLogPolar_deriv, nativePocketLogPolar_deriv]
  erw [roundMetric_inner (E := E₄) (n := 3)]
  change (ℓ / ρ) ^ 2 * ⟪(ρ * (v.2 / ℓ)) • (q.1 : E₄) + ρ • a v,
    (ρ * (w.2 / ℓ)) • (q.1 : E₄) + ρ • a w⟫ =
    v.2 * w.2 + ℓ ^ 2 * ⟪a v, a w⟫
  simp only [inner_add_left, inner_add_right, real_inner_smul_left, real_inner_smul_right,
    huu, hua, hau, mul_zero, mul_one, zero_add, add_zero]
  field_simp [hρ, hℓ.ne']


theorem nativePocketMarking_mem_disk_iff (F : PartialDiffeomorph I₄ I E₄ M ∞)
    (p : ExactFaceSphere) (q : ExactFaceTube)
    (hF : closedBall (0 : E₄) 1 ⊆ F.source) (hq : q ∈ (nativePocketMarking F p).source) :
    nativePocketMarking F p q ∈ selectedChartDisk F ↔ q.2 ≤ 0 := by
  have hpos : 0 < 1 + q.2 := hq.1.2
  have hsrc : (1 + q.2) • (q.1 : E₄) ∈ F.source := hq.2
  have hn : ‖(1 + q.2) • (q.1 : E₄)‖ = 1 + q.2 := by
    rw [norm_smul, Real.norm_of_nonneg hpos.le, norm_eq_of_mem_sphere, mul_one]
  change F ((1 + q.2) • (q.1 : E₄)) ∈ F '' closedBall (0 : E₄) 1 ↔ _
  constructor
  · rintro ⟨x, hx, hfx⟩
    have hxq := F.injOn (hF hx) hsrc hfx
    rw [hxq, mem_closedBall_zero_iff, hn] at hx
    linarith
  · intro h
    refine mem_image_of_mem F (mem_closedBall_zero_iff.mpr ?_)
    rw [hn]
    linarith

theorem nativePocketMarking_mem_exterior_iff (F : PartialDiffeomorph I₄ I E₄ M ∞)
    (p : ExactFaceSphere) (q : ExactFaceTube)
    (hF : closedBall (0 : E₄) 1 ⊆ F.source) (hq : q ∈ (nativePocketMarking F p).source) :
    nativePocketMarking F p q ∈ (interior (selectedChartDisk F))ᶜ ↔ 0 ≤ q.2 := by
  have hpos : 0 < 1 + q.2 := hq.1.2
  have hsrc : (1 + q.2) • (q.1 : E₄) ∈ F.source := hq.2
  have hn : ‖(1 + q.2) • (q.1 : E₄)‖ = 1 + q.2 := by
    rw [norm_smul, Real.norm_of_nonneg hpos.le, norm_eq_of_mem_sphere, mul_one]
  have hInterior : nativePocketMarking F p q ∈ interior (selectedChartDisk F) ↔ q.2 < 0 := by
    rw [interior_selectedChartDisk F hF]
    change F ((1 + q.2) • (q.1 : E₄)) ∈ F '' ball (0 : E₄) 1 ↔ _
    constructor
    · rintro ⟨x, hx, hfx⟩
      have hxq := F.injOn (hF (ball_subset_closedBall hx)) hsrc hfx
      rw [hxq, mem_ball_zero_iff, hn] at hx
      linarith
    · intro h
      refine mem_image_of_mem F (mem_ball_zero_iff.mpr ?_)
      rw [hn]
      linarith
  exact (not_congr hInterior).trans not_lt

variable [IsManifold I ∞ M] [T2Space M]

/-- Extend the physical logarithmic exponent from a closed radial annulus.
Its support stays in the punctured Euclidean pocket. -/
theorem exists_nativePocketCylinder_exponent
    (F : PartialDiffeomorph I₄ I E₄ M ∞) {a c R ℓ : ℝ} (ha : 0 < a)
    (hcR : c < R) (hℓ : 0 < ℓ) (hF : ball (0 : E₄) R ⊆ F.source) :
    ∃ u : C^∞⟮I, M; ℝ⟯,
      tsupport (u : M → ℝ) ⊆ F '' (ball (0 : E₄) R ∩ {0}ᶜ) ∧
      ∀ x : E₄, ‖x‖ ∈ Icc a c → u (F x) = Real.log (ℓ / ‖x‖) := by
  let K : Set E₄ := (fun x : E₄ => ‖x‖) ⁻¹' Icc a c
  let W : Set E₄ := ball (0 : E₄) R ∩ {0}ᶜ
  have hKO : K ⊆ W := by
    intro x hx
    exact ⟨mem_ball_zero_iff.mpr (hx.2.trans_lt hcR),
      norm_ne_zero_iff.mp (ha.trans_le hx.1).ne'⟩
  have hWF : W ⊆ F.source := inter_subset_left.trans hF
  have hK : IsCompact K := (isCompact_closedBall (0 : E₄) c).of_isClosed_subset
    (isClosed_Icc.preimage continuous_norm) (fun x hx => mem_closedBall_zero_iff.mpr hx.2)
  have hImK := hK.image_of_continuousOn (F.contMDiffOn.continuousOn.mono (hKO.trans hWF))
  have hW : IsOpen W := isOpen_ball.inter isOpen_compl_singleton
  have hImW := F.toOpenPartialHomeomorph.isOpen_image_of_subset_source hW hWF
  obtain ⟨χ, hχ, _, hχW, _, hχ1⟩ := DifferentialGeometry.Topology.exists_contMDiff_cutoff_of_isCompact
    (I := I) hImK hImW (image_mono hKO)
  let f : E₄ → ℝ := fun x => Real.log (ℓ / ‖x‖)
  have hSmoothAt (x : E₄) (hx : x ≠ 0) : ContDiffAt ℝ ∞ f x := by
    have hNorm := contDiffAt_norm (𝕜 := ℝ) (n := ∞) hx
    exact (contDiffAt_const.div hNorm (norm_ne_zero_iff.mpr hx)).log
      (div_ne_zero hℓ.ne' (norm_ne_zero_iff.mpr hx))
  let u : M → ℝ := fun y => χ y * f (F.symm y)
  have huSupp : tsupport u ⊆ tsupport χ := tsupport_mul_subset_left
  have hu : ContMDiff I 𝓘(ℝ) ∞ u := by
    apply contMDiff_of_tsupport
    intro y hy
    obtain ⟨x,hxW,rfl⟩ := hχW (huSupp hy)
    have hxF := hWF hxW
    have hyF := F.map_source hxF
    have hInv : F.symm (F x) = x := F.left_inv' hxF
    have hLocal : ContMDiffAt I₄ 𝓘(ℝ) ∞ f (F.symm (F x)) := by
      rw [hInv]
      exact (hSmoothAt x hxW.2).contMDiffAt
    exact hχ.contMDiffAt.mul (hLocal.comp (F x)
      (F.contMDiffOn_invFun.contMDiffAt (F.open_target.mem_nhds hyF)))
  refine ⟨⟨u,hu⟩,huSupp.trans hχW,?_⟩
  intro x hx
  have hxK : x ∈ K := hx
  have hχNear : χ =ᶠ[𝓝 (F x)] 1 :=
    (eventually_nhdsSet_iff_forall.mp hχ1) (F x) (mem_image_of_mem F hxK)
  have hχx : χ (F x) = 1 := hχNear.eq_of_nhds
  change χ (F x) * f (F.symm (F x)) = f x
  have hInv : F.symm (F x) = x := F.left_inv' (hWF (hKO hxK))
  rw [hχx, hInv, one_mul]

/-- Radius `ℓ` in the angular factor and unit speed in the signed height. -/
def nativePocketCylinderMetric {ℓ : ℝ} (hℓ : 0 < ℓ) :
    SmoothRiemannianMetric J ExactFaceTube :=
  (scaleMetric (ℓ ^ 2) (pow_pos hℓ _) (roundMetric (E := E₄) (n := 3))).prod
    (euclideanMetric ℝ)

theorem nativePocketCylinderMetric_inner {ℓ : ℝ} (hℓ : 0 < ℓ)
    (q : ExactFaceTube) (v w : TangentSpace J q) :
    (nativePocketCylinderMetric hℓ).inner q v w =
      v.2 * w.2 + ℓ ^ 2 * (roundMetric (E := E₄) (n := 3)).inner q.1 v.1 w.1 := by
  rw [nativePocketCylinderMetric, SmoothRiemannianMetric.prod_inner]
  erw [scaleMetric_inner, euclideanMetric_inner, Real.inner_apply]
  exact add_comm _ _

theorem nativePocketCylinderMetric_one :
    nativePocketCylinderMetric zero_lt_one = exactFaceRoundCylinder := by
  ext q v w : 2
  rw [nativePocketCylinderMetric_inner, exactFaceRoundCylinder, SmoothRiemannianMetric.prod_inner,
    euclideanMetric_inner, Real.inner_apply]
  simp [add_comm]

/-- Pull the cylindrical expression back using the actual smooth compression.
The equality of the marking maps holds on an open signed tube, so their
manifold differentials agree there. -/
theorem nativePocket_pullbackCylinder_inner
    (F : PartialDiffeomorph I₄ I E₄ M ∞) (p : ExactFaceSphere)
    (flat : SmoothRiemannianMetric I M) (φ : M ≃ₘ⟮I,I⟯ M)
    (u : C^∞⟮I, M; ℝ⟯) {b ℓ ε : ℝ} (hb : 0 < b) (hℓ : 0 < ℓ)
    (hMark : ∀ q : ExactFaceTube, |q.2| < ε →
      φ (nativePocketMarking F p q) = F (nativePocketLogPolar b ℓ q))
    (q : ExactFaceTube) (hq : |q.2| < ε) (hNative : q ∈ (nativePocketMarking F p).source)
    (hSrc : nativePocketLogPolar b ℓ q ∈ F.source)
    (hFlat : ∀ v w : E₄, flat.inner (F (nativePocketLogPolar b ℓ q))
      (mfderiv I₄ I F (nativePocketLogPolar b ℓ q) v)
      (mfderiv I₄ I F (nativePocketLogPolar b ℓ q) w) = ⟪v,w⟫)
    (hFactor : u (F (nativePocketLogPolar b ℓ q)) =
      Real.log (ℓ / ‖nativePocketLogPolar b ℓ q‖))
    (v w : TangentSpace J q) :
    let A := nativePocketMarking F p
    (Diffeomorph.pullbackMetricCross (DifferentialGeometry.conformalMetric flat u) φ).inner
      (A q) (mfderiv J I A q v) (mfderiv J I A q w) =
      (nativePocketCylinderMetric hℓ).inner q v w := by
  let A := nativePocketMarking F p
  let C := nativePocketLogPolar b ℓ
  have hO : IsOpen {y : ExactFaceTube | |y.2| < ε} :=
    isOpen_lt continuous_snd.abs continuous_const
  have hEq : (⇑φ ∘ ⇑A) =ᶠ[𝓝 q] (⇑F ∘ C) := by
    filter_upwards [hO.mem_nhds hq] with y hy
    exact hMark y hy
  have hDiffF := (F.contMDiffOn_toFun.contMDiffAt (F.open_source.mem_nhds hSrc)).mdifferentiableAt
    (by decide : (∞ : ℕ∞ω) ≠ 0)
  have hDiffA := (A.contMDiffOn_toFun.contMDiffAt (A.open_source.mem_nhds hNative)).mdifferentiableAt
    (by decide : (∞ : ℕ∞ω) ≠ 0)
  have hDiffC := (nativePocketLogPolar_smooth b ℓ).mdifferentiable
    (by decide : (∞ : ℕ∞ω) ≠ 0) q
  have hDiffφ := φ.contMDiff.mdifferentiableAt (x := A q) (by simp)
  have hD (a : TangentSpace J q) :
      mfderiv I I φ (A q) (mfderiv J I A q a) =
      mfderiv I₄ I F (C q) (mfderiv J I₄ C q a) := by
    have hh := hEq.mfderiv_eq (I := J) (I' := I)
    rw [mfderiv_comp q hDiffφ hDiffA, mfderiv_comp q hDiffF hDiffC] at hh
    exact congrArg (fun D : (TangentSpace J q) →L[ℝ] E₄ => D a) hh
  have hRatio : 0 < ℓ / ‖C q‖ := by rw [nativePocketLogPolar_norm hb]; positivity
  have hExp : Real.exp (2 * Real.log (ℓ / ‖C q‖)) = (ℓ / ‖C q‖)^2 := by
    rw [show 2 * Real.log (ℓ / ‖C q‖) = Real.log (ℓ / ‖C q‖) + Real.log (ℓ / ‖C q‖) by ring,
      Real.exp_add, Real.exp_log hRatio, pow_two]
  dsimp only
  rw [Diffeomorph.pullbackMetricCross_inner, DifferentialGeometry.conformalMetric_inner,
    hD v, hD w, hMark q hq, hFactor, hExp, nativePocketCylinderMetric_inner]
  change (ℓ / ‖C q‖)^2 * flat.inner (F (C q))
    (mfderiv I₄ I F (C q) (mfderiv J I₄ C q v))
    (mfderiv I₄ I F (C q) (mfderiv J I₄ C q w)) = _
  rw [hFlat (mfderiv J I₄ C q v) (mfderiv J I₄ C q w)]
  exact nativePocketLogPolar_product_inner hb hℓ q v w


/-- Choose the annular exponent before choosing a compression. Every
compression with the prescribed exponential germ realizes the same product
metric on a positive closed signed subslab of that germ. -/
theorem exists_nativePocketCylinder_on_nativeSlab
    (F : PartialDiffeomorph I₄ I E₄ M ∞) (p : ExactFaceSphere) {B R b ℓ : ℝ}
    (hB : 1 < B) (hb : 0 < b) (hbR : b < R) (hℓ : 0 < ℓ)
    (hBuffer : closedBall (0 : E₄) B ⊆ F.source)
    (hPocket : ball (0 : E₄) R ⊆ F.source) :
    ∃ u : C^∞⟮I, M; ℝ⟯,
      tsupport (u : M → ℝ) ⊆ F '' (ball (0 : E₄) R ∩ {0}ᶜ) ∧
      ∀ (flat : SmoothRiemannianMetric I M) (φ : M ≃ₘ⟮I,I⟯ M) {ε : ℝ}, 0 < ε →
      (∀ t, |t| < ε → ∀ y ∈ sphere (0 : E₄) 1,
        φ (F ((1+t) • y)) = F ((b * Real.exp (t/ℓ)) • y)) →
      (∀ x ∈ ball (0 : E₄) R, ∀ v w : E₄, flat.inner (F x) (mfderiv I₄ I F x v)
        (mfderiv I₄ I F x w) = ⟪v, w⟫) →
      ∃ d : ℝ, 0 < d ∧ d < ε ∧
        let A := nativePocketMarking F p
        exactFaceSlab d d ⊆ A.source ∧
        ∀ q ∈ exactFaceSlab d d, ∀ v w : TangentSpace J q,
          (Diffeomorph.pullbackMetricCross (DifferentialGeometry.conformalMetric flat u) φ).inner
            (A q) (mfderiv J I A q v) (mfderiv J I A q w) =
            (nativePocketCylinderMetric hℓ).inner q v w := by
  let a := b / 2
  let c := (b + R) / 2
  have ha : 0 < a := by dsimp [a]; linarith
  have hab : a < b := by dsimp [a]; linarith
  have hbc : b < c := by dsimp [c]; linarith
  have hcR : c < R := by dsimp [c]; linarith
  obtain ⟨u, hu, huEq⟩ := exists_nativePocketCylinder_exponent F ha hcR hℓ hPocket
  refine ⟨u, hu, ?_⟩
  intro flat φ ε hε hMark hFlat
  let s : Set ℝ := (fun t => b * Real.exp (t / ℓ)) ⁻¹' Ioo a c
  have hOpen : IsOpen s := isOpen_Ioo.preimage
    (continuous_const.mul (Real.continuous_exp.comp (continuous_id.div_const ℓ)))
  have hZero : (0 : ℝ) ∈ s := by simpa [s] using (show a < b ∧ b < c from ⟨hab,hbc⟩)
  obtain ⟨τ, hτ, hτs⟩ := Metric.isOpen_iff.mp hOpen 0 hZero
  let m := min (1 / 2 : ℝ) (min (B - 1) (min ε τ))
  have hm : 0 < m := lt_min (by norm_num) (lt_min (sub_pos.mpr hB) (lt_min hε hτ))
  let d := m / 2
  have hd : 0 < d := half_pos hm
  have hdm : d < m := half_lt_self hm
  have hdmε : m ≤ ε := (min_le_right ..).trans ((min_le_right ..).trans (min_le_left ..))
  have hAbs (q : ExactFaceTube) (hq : q ∈ exactFaceSlab d d) : |q.2| ≤ d :=
    abs_le.mpr hq.2
  have hNative (q : ExactFaceTube) (hq : q ∈ exactFaceSlab d d) :
      q ∈ (nativePocketMarking F p).source := by
    have htm : |q.2| < m := (hAbs q hq).trans_lt hdm
    have ht₁ : |q.2| < 1 / 2 := htm.trans_le (min_le_left ..)
    have htB : |q.2| < B - 1 := htm.trans_le
      ((min_le_right ..).trans (min_le_left ..))
    have hPos : 0 < 1 + q.2 := by linarith [(abs_lt.mp ht₁).1]
    apply nativePocketMarking_mem_source F p q hPos
    apply hBuffer
    rw [mem_closedBall_zero_iff, norm_smul, Real.norm_of_nonneg hPos.le, norm_eq_of_mem_sphere, mul_one]
    linarith [(abs_lt.mp htB).2]
  refine ⟨d, hd, hdm.trans_le hdmε, hNative, ?_⟩
  intro q hq v w
  have hqε := ((hAbs q hq).trans_lt hdm).trans_le hdmε
  have hqτ : |q.2| < τ := ((hAbs q hq).trans_lt hdm).trans_le
    ((min_le_right ..).trans ((min_le_right ..).trans (min_le_right ..)))
  have hqs : q.2 ∈ s := hτs (by simpa [Metric.mem_ball, Real.dist_eq] using hqτ)
  have hρ : ‖nativePocketLogPolar b ℓ q‖ ∈ Ioo a c := by
    rw [nativePocketLogPolar_norm hb]
    exact hqs
  have hBall : nativePocketLogPolar b ℓ q ∈ ball (0 : E₄) R :=
    mem_ball_zero_iff.mpr (hρ.2.trans hcR)
  exact nativePocket_pullbackCylinder_inner F p flat φ u hb hℓ
    (fun y hy => hMark y.2 hy y.1 y.1.2) q hqε (hNative q hq)
    (hPocket hBall) (hFlat _ hBall) (huEq _ ⟨hρ.1.le,hρ.2.le⟩) v w


omit [T2Space M] in
/-- Every closed subinterval of the supplied product strip has its actual
intrinsic metric width, including either half up to the marked face. -/
theorem nativePocketCylinder_substrip_width
    (F : PartialDiffeomorph I₄ I E₄ M ∞) (p : ExactFaceSphere)
    (g : SmoothRiemannianMetric I M) {ℓ a c : ℝ} (hℓ : 0 < ℓ) (hac : a ≤ c)
    (hBand : univ ×ˢ Icc a c ⊆ (nativePocketMarking F p).source)
    (hMetric : ∀ q ∈ univ ×ˢ Icc a c, ∀ v : TangentSpace J q,
      g.inner (nativePocketMarking F p q) (mfderiv J I (nativePocketMarking F p) q v)
        (mfderiv J I (nativePocketMarking F p) q v) = (nativePocketCylinderMetric hℓ).inner q v v) :
    let A := nativePocketMarking F p
    PositiveScalarCuts.markedBandEWidth g (A '' (univ ×ˢ Icc a c)) (A '' (univ ×ˢ {a}))
      (A '' (univ ×ˢ {c})) = ENNReal.ofReal (c-a) := by
  exact PositiveScalarCuts.markedBandEWidth_eq_of_cylinderPullback g
    (scaleMetric (ℓ ^ 2) (pow_pos hℓ _) (roundMetric (E := E₄) (n := 3)))
    (nativePocketMarking F p) hac hBand hMetric

variable [I.Boundaryless] [CompactSpace M] [Nonempty M] [PathConnectedSpace M]
  {o : ManifoldOrientation I M 4}

local notation "S₄" => StandardFourSphere
private local instance : Fact (Module.finrank ℝ (EuclideanSpace ℝ (Fin 5)) = 4 + 1) := ⟨by simp⟩
private local instance : Nonempty S₄ := ⟨transportedCapNorthPole⟩

/-- A supplied Euclidean reference determines the very same flattening
endpoint used by the cylinder and both positive cap metrics. -/
theorem nativePocket_matchedCylinderCaps_of_reference (g : SignedCollarMetric o)
    (F : PartialDiffeomorph I₄ I E₄ M ∞) (p : ExactFaceSphere)
    {R B r b ℓ : ℝ} (hR : 1 < R) (hRB : R < B)
    (hBuffer : closedBall (0 : E₄) B ⊆ F.source) (hr : 0 < r) (h3r : 3*r ≤ B)
    (hb : 0 < b) (hb₁ : b < 1) (hb₂ : b < 2*r) (hℓ : 0 < ℓ)
    (oS : ManifoldOrientation I₄ S₄ 4) (Rflat : SmoothRiemannianMetric I M)
    (hRef : ∀ x ∈ ball (0 : E₄) (2*r), ∀ v w : E₄,
      (Geometry.euclideanMetric E₄).inner x v w =
        Rflat.inner (F x) (mfderiv I₄ I F x v) (mfderiv I₄ I F x w)) :
    let hF := (closedBall_subset_closedBall (hR.trans hRB).le).trans hBuffer
    let hS := (closedBall_subset_closedBall h3r).trans hBuffer
    ∀ (flat : SignedCollarMetric o),
      flat.metric = nativePocketPath F g.metric Rflat hr hS ⟨1, zero_le_one, le_rfl⟩ →
      0 < classYamabeFour o.dimension_eq flat.metric →
      ∃ (u : C^∞⟮I, M; ℝ⟯) (φ : M ≃ₘ⟮I,I⟯ M) (hφ : φ.preservesOrientation o o)
        (hImage : φ '' selectedChartDisk F = F '' closedBall (0 : E₄) b)
        (uDisk : C^∞⟮I₄, S₄; ℝ⟯) (ε d : ℝ),
        let A := nativePocketMarking F p
        let disk := transportedDiskCore F hF φ hb hb₁.le hImage
        let exterior := transportedExteriorCore F hF φ hb hb₁.le hImage
        let capD := (RoundEquatorialCaps.signedRound oS).conformal uDisk
        let capV := flat.conformal u
        let q := capV.pullback φ hφ
        0 < d ∧ d < ε ∧ exactFaceSlab d d ⊆ A.source ∧
        (∀ x ∈ exactFaceSlab d d, ∀ v w : TangentSpace J x,
          q.metric.inner (A x) (mfderiv J I A x v) (mfderiv J I A x w) =
            (nativePocketCylinderMetric hℓ).inner x v w) ∧
        (∀ t, |t| < ε → ∀ y ∈ sphere (0 : E₄) 1,
          φ (F ((1+t) • y)) = F ((b * Real.exp (t/ℓ)) • y) ∧
          φ.symm (F ((b * Real.exp (t/ℓ)) • y)) = F ((1+t) • y)) ∧
        0 < classYamabeFour oS.dimension_eq capD.metric ∧
        0 < classYamabeFour o.dimension_eq capV.metric ∧
        (∀ x ∈ disk.raw, ∀ᶠ y in 𝓝 x, ∀ v w : TangentSpace I y,
          q.metric.inner y v w = capD.metric.inner (disk.core y)
            (mfderiv I I₄ disk.core y v) (mfderiv I I₄ disk.core y w)) ∧
        (∀ x ∈ exterior.raw, exterior.core.symm (exterior.core x) = x ∧
          ∀ v w : TangentSpace I x, q.metric.inner x v w = capV.metric.inner (exterior.core x)
            (mfderiv I I exterior.core x v) (mfderiv I I exterior.core x w)) ∧
        (∀ sg, capD.energy sg = 0 ∧ capD.energy sg = q.charge sg disk.raw ∧
          capV.energy sg = q.charge sg exterior.raw ∧
          capV.energy sg - g.charge sg exterior.raw =
            g.charge sg disk.raw + (flat.energy .plus - g.energy .plus)) := by
  intro hF hS flat hEndpoint hp
  let U := ball (0 : E₄) (2*r)
  have hUB : U ⊆ closedBall (0 : E₄) B :=
    ball_subset_closedBall.trans (closedBall_subset_closedBall (by linarith))
  have hUF := hUB.trans hBuffer
  obtain ⟨hEuclidean, hRm⟩ := nativePocketPath_endpoint_flat F g.metric Rflat hr hS
    hRef
  rw [← hEndpoint] at hEuclidean hRm
  obtain ⟨u, _, hTube⟩ := exists_nativePocketCylinder_on_nativeSlab F p (hR.trans hRB)
    hb hb₂ hℓ hBuffer hUF
  obtain ⟨φ, ε, hφ, hε, hImage, _, hRadius, _⟩ :=
    exists_nativeGaussianDiskCompression_preservesOrientation o F hR hRB hBuffer hb hb₁ hℓ
  obtain ⟨d, hd, hdε, hBand, hProduct⟩ := hTube flat.metric φ hε
    (fun t ht y hy => (hRadius t ht y hy).1)
    (fun z hz v w => (hEuclidean z hz v w).symm.trans (Geometry.euclideanMetric_inner E₄ z v w))
  have hball : closedBall (0 : E₄) b ⊆ U := closedBall_subset_ball hb₂
  have hFlat : ∀ x ∈ φ '' selectedChartDisk F, metricRm04At flat.metric x = 0 := by
    rw [hImage]
    rintro _ ⟨x,hx,rfl⟩
    exact hRm x (hball hx)
  have hInv := euclideanPocket_inverseMetric_of_forward flat.metric F hUF
    (fun z hz v w => (hEuclidean z hz v w).symm)
  obtain ⟨W,hW,hCapW,uLocal,hLocal,hGerm⟩ := euclideanPocket_localCapConformalGerm
    flat.metric F hF φ hb hb₁.le hImage u isOpen_ball hball hUF hInv
    (fun z _ v w => by simpa only [transportedPocketRoundDensity, add_comm (4 : ℝ)] using
      transportedCapPocketChart_metric_inner b hb z v w)
  obtain ⟨uDisk,_,hDiskGerm,_,_,hD,hV,hCharges⟩ := exists_transportedDiskCaps_with_matchingGerm
    g flat F hF φ hφ hb hb₁.le hImage u oS hFlat hp hW hCapW uLocal hLocal hGerm
  refine ⟨u,φ,hφ,hImage,uDisk,ε,d,hd,hdε,hBand,hProduct,hRadius,hD,hV,hDiskGerm,
    transportedExterior_metric_relative flat F hF φ hφ hb hb₁.le hImage u,?_⟩
  intro sg
  have hLedger := (transportedDiskCaps_zeroDrift g flat F hF φ hφ hb hb₁.le hImage u uDisk oS
    hFlat hp).2.2.2.2 sg
  have hz := ((chargedDisk_flatPocket_transport g flat F hF φ hφ u hFlat hp).2.2 sg).1
  exact ⟨(hCharges sg).1.trans hz,(hCharges sg).1,(hCharges sg).2,hLedger.2.2⟩

/-- The positive native flattening endpoint gives a single transported
cylinder with both matched positive cap metrics, on the original marked disk
and complete exterior. The same exponent supplies the central product and
both cap comparisons. -/
theorem exists_nativePocket_matchedCylinderCaps (g : SignedCollarMetric o)
    (F : PartialDiffeomorph I₄ I E₄ M ∞) (p : ExactFaceSphere)
    {R B r b ℓ : ℝ} (hR : 1 < R) (hRB : R < B)
    (hBuffer : closedBall (0 : E₄) B ⊆ F.source) (hr : 0 < r) (h3r : 3*r ≤ B)
    (hb : 0 < b) (hb₁ : b < 1) (hb₂ : b < 2*r) (hℓ : 0 < ℓ)
    (oS : ManifoldOrientation I₄ S₄ 4) :
    let hF := (closedBall_subset_closedBall (hR.trans hRB).le).trans hBuffer
    let hS := (closedBall_subset_closedBall h3r).trans hBuffer
    ∃ Rflat : SmoothRiemannianMetric I M, ∀ (flat : SignedCollarMetric o),
      flat.metric = nativePocketPath F g.metric Rflat hr hS ⟨1, zero_le_one, le_rfl⟩ →
      0 < classYamabeFour o.dimension_eq flat.metric →
      ∃ (u : C^∞⟮I, M; ℝ⟯) (φ : M ≃ₘ⟮I,I⟯ M) (hφ : φ.preservesOrientation o o)
        (hImage : φ '' selectedChartDisk F = F '' closedBall (0 : E₄) b)
        (uDisk : C^∞⟮I₄, S₄; ℝ⟯) (ε d : ℝ),
        let A := nativePocketMarking F p
        let disk := transportedDiskCore F hF φ hb hb₁.le hImage
        let exterior := transportedExteriorCore F hF φ hb hb₁.le hImage
        let capD := (RoundEquatorialCaps.signedRound oS).conformal uDisk
        let capV := flat.conformal u
        let q := capV.pullback φ hφ
        0 < d ∧ d < ε ∧ exactFaceSlab d d ⊆ A.source ∧
        (∀ x ∈ exactFaceSlab d d, ∀ v w : TangentSpace J x,
          q.metric.inner (A x) (mfderiv J I A x v) (mfderiv J I A x w) =
            (nativePocketCylinderMetric hℓ).inner x v w) ∧
        (∀ t, |t| < ε → ∀ y ∈ sphere (0 : E₄) 1,
          φ (F ((1+t) • y)) = F ((b * Real.exp (t/ℓ)) • y) ∧
          φ.symm (F ((b * Real.exp (t/ℓ)) • y)) = F ((1+t) • y)) ∧
        0 < classYamabeFour oS.dimension_eq capD.metric ∧
        0 < classYamabeFour o.dimension_eq capV.metric ∧
        (∀ x ∈ disk.raw, ∀ᶠ y in 𝓝 x, ∀ v w : TangentSpace I y,
          q.metric.inner y v w = capD.metric.inner (disk.core y)
            (mfderiv I I₄ disk.core y v) (mfderiv I I₄ disk.core y w)) ∧
        (∀ x ∈ exterior.raw, exterior.core.symm (exterior.core x) = x ∧
          ∀ v w : TangentSpace I x, q.metric.inner x v w = capV.metric.inner (exterior.core x)
            (mfderiv I I exterior.core x v) (mfderiv I I exterior.core x w)) ∧
        (∀ sg, capD.energy sg = 0 ∧ capD.energy sg = q.charge sg disk.raw ∧
          capV.energy sg = q.charge sg exterior.raw ∧
          capV.energy sg - g.charge sg exterior.raw =
            g.charge sg disk.raw + (flat.energy .plus - g.energy .plus)) := by
  intro hF hS
  obtain ⟨Rflat, O, hBO, _, hRef⟩ := exists_nativePocketReference g.metric F hBuffer
  have hUB : ball (0 : E₄) (2*r) ⊆ closedBall (0 : E₄) B :=
    ball_subset_closedBall.trans (closedBall_subset_closedBall (by linarith))
  exact ⟨Rflat, nativePocket_matchedCylinderCaps_of_reference g F p hR hRB hBuffer
    hr h3r hb hb₁ hb₂ hℓ oS Rflat (fun x hx => hRef x (hBO (hUB hx)))⟩

end SmoothPoincare
