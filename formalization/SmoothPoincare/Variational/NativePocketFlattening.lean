import SmoothPoincare.Variational.SelectedDiskReference
import SmoothPoincare.Variational.PhysicalStripVolume
import SmoothPoincare.Variational.PairedStripCurvature
import DifferentialGeometry.Analysis.Integration.Measure.Riemannian.Euclidean
import DifferentialGeometry.Geometry.Metric.Pullback.Coefficients
import Mathlib.Analysis.Calculus.FDeriv.CompCLM

/-! # Affine flattening of a shrinking pocket in the original native disk -/

open DifferentialGeometry DifferentialGeometry.Geometry DifferentialGeometry.Geometry.Curvature
open DifferentialGeometry.Integral.Measure Filter FirstOrderTwistor Manifold MeasureTheory Set
open scoped ContDiff Manifold Topology ENNReal

namespace SmoothPoincare
noncomputable section

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "I₄" => 𝓘(ℝ, E₄)

def nativePocketUnitCutoff (x : E₄) : ℝ :=
  Real.smoothTransition ((25 - 4 * ‖x‖ ^ 2) / 7)

/-- One at least through radius two, zero at and beyond radius five halves. -/
def nativePocketCutoff (r : ℝ) (x : E₄) : ℝ :=
  nativePocketUnitCutoff (r⁻¹ • x)

theorem contDiff_nativePocketUnitCutoff : ContDiff ℝ ∞ nativePocketUnitCutoff :=
  Real.smoothTransition.contDiff.comp
    ((contDiff_const.sub (contDiff_const.mul (contDiff_id.norm_sq ℝ))).div_const _)

theorem contDiff_nativePocketCutoff (r : ℝ) : ContDiff ℝ ∞ (nativePocketCutoff r) := by
  let T := r⁻¹ • ContinuousLinearMap.id ℝ E₄
  have hT : ContDiff ℝ ∞ (T : E₄ → E₄) := T.contDiff
  exact contDiff_nativePocketUnitCutoff.comp hT

private theorem nativePocketCutoff_mem_Icc (r : ℝ) (x : E₄) :
    nativePocketCutoff r x ∈ Icc (0 : ℝ) 1 :=
  ⟨Real.smoothTransition.nonneg _, Real.smoothTransition.le_one _⟩

private theorem norm_nativePocketScale {r : ℝ} (hr : 0 < r) (x : E₄) :
    ‖r⁻¹ • x‖ = ‖x‖ / r := by
  rw [norm_smul, Real.norm_eq_abs, abs_of_pos (inv_pos.mpr hr), inv_mul_eq_div]

theorem nativePocketCutoff_eq_one {r : ℝ} (hr : 0 < r) {x : E₄} (hx : ‖x‖ ≤ 2 * r) :
    nativePocketCutoff r x = 1 := by
  have h : ‖r⁻¹ • x‖ ≤ 2 := by
    rw [norm_nativePocketScale hr, div_le_iff₀ hr]
    exact hx
  apply Real.smoothTransition.one_of_one_le
  nlinarith only [pow_le_pow_left₀ (norm_nonneg (r⁻¹ • x)) h 2]

theorem nativePocketCutoff_eq_zero {r : ℝ} (hr : 0 < r) {x : E₄}
    (hx : 5 * r / 2 ≤ ‖x‖) : nativePocketCutoff r x = 0 := by
  have h : 5 / 2 ≤ ‖r⁻¹ • x‖ := by
    rw [norm_nativePocketScale hr, le_div_iff₀ hr]
    linarith only [hx]
  apply Real.smoothTransition.zero_of_nonpos
  nlinarith only [pow_le_pow_left₀ (by norm_num : (0 : ℝ) ≤ 5 / 2) h 2]


private theorem compact_opNorm_bound {A B C : Type*}
    [NormedAddCommGroup A] [NormedAddCommGroup B] [NormedAddCommGroup C]
    [NormedSpace ℝ B] [NormedSpace ℝ C]
    {K : Set A} (hK : IsCompact K) {L : A → B →L[ℝ] C} (hL : ContinuousOn L K) :
    ∃ B₀ : ℝ, 0 ≤ B₀ ∧ ∀ x ∈ K, ‖L x‖ ≤ B₀ := by
  let J : SeminormedAddCommGroup (B →L[ℝ] C) := ContinuousLinearMap.toSeminormedAddCommGroup
  have hn : Continuous (fun T : B →L[ℝ] C => ‖T‖) :=
    @continuous_norm _ J.toSeminormedAddGroup
  obtain ⟨b, hb⟩ := hK.bddAbove_image (hn.comp_continuousOn hL)
  exact ⟨max 0 b, le_max_left .., fun x hx => (hb (mem_image_of_mem _ hx)).trans (le_max_right ..)⟩

/-- The actual radial cutoff pays exactly one inverse radius per derivative
in operator norm, on the complete native change region. -/
theorem exists_nativePocketCutoff_deriv_bounds :
    ∃ C₁ C₂ : ℝ, 0 ≤ C₁ ∧ 0 ≤ C₂ ∧ ∀ {r : ℝ}, 0 < r → ∀ x : E₄, ‖x‖ ≤ 3 * r →
      ‖fderiv ℝ (nativePocketCutoff r) x‖ ≤ C₁ / r ∧
        ‖fderiv ℝ (fderiv ℝ (nativePocketCutoff r)) x‖ ≤ C₂ / r ^ 2 := by
  let B := Metric.closedBall (0 : E₄) 3
  let f := nativePocketUnitCutoff
  have hf : ContDiff ℝ ∞ f := contDiff_nativePocketUnitCutoff
  have h₁ : ContDiff ℝ ∞ (fderiv ℝ f) := hf.fderiv_right (m := ∞) (by simp)
  have h₂ : ContDiff ℝ ∞ (fderiv ℝ (fderiv ℝ f)) := h₁.fderiv_right (m := ∞) (by simp)
  obtain ⟨C₁, hC₁, hc₁⟩ := compact_opNorm_bound (K := B) (isCompact_closedBall _ _) h₁.continuous.continuousOn
  obtain ⟨C₂, hC₂, hc₂⟩ := compact_opNorm_bound (K := B) (isCompact_closedBall _ _) h₂.continuous.continuousOn
  refine ⟨C₁, C₂, hC₁, hC₂, ?_⟩
  intro r hr x hx
  let T := r⁻¹ • ContinuousLinearMap.id ℝ E₄
  have hHead : T x ∈ B := by
    change dist (r⁻¹ • x) (0 : E₄) ≤ 3
    rw [dist_zero_right, norm_nativePocketScale hr, div_le_iff₀ hr]
    exact hx
  have hT : ‖T‖ ≤ r⁻¹ := by
    calc
      ‖T‖ = |r⁻¹| * ‖ContinuousLinearMap.id ℝ E₄‖ := by simp [T, norm_smul, Real.norm_eq_abs]
      _ ≤ r⁻¹ := by
        rw [abs_of_pos (inv_pos.mpr hr), mul_comm]
        exact mul_le_of_le_one_left (inv_pos.mpr hr).le ContinuousLinearMap.norm_id_le
  have hFirst (z : E₄) : fderiv ℝ (nativePocketCutoff r) z = (fderiv ℝ f (T z)).comp T := by
    change fderiv ℝ (f ∘ (T : E₄ → E₄)) z = _
    rw [fderiv_comp z (hf.differentiable (by simp) _) T.differentiableAt, T.fderiv]
  have hSecond (v w : E₄) : fderiv ℝ (fderiv ℝ (nativePocketCutoff r)) x v w =
      fderiv ℝ (fderiv ℝ f) (T x) (T v) (T w) := by
    rw [funext hFirst]
    have hh : DifferentiableAt ℝ (fun z => fderiv ℝ f (T z)) x :=
      (h₁.differentiable (by simp) _).comp x T.differentiableAt
    rw [fderiv_clm_comp hh (differentiableAt_const T), fderiv_const_apply, ContinuousLinearMap.comp_zero, zero_add]
    have hChain : fderiv ℝ (fun z => fderiv ℝ f (T z)) x =
        (fderiv ℝ (fderiv ℝ f) (T x)).comp T := by
      change fderiv ℝ (fderiv ℝ f ∘ (T : E₄ → E₄)) x = _
      rw [fderiv_comp x (h₁.differentiable (by simp) _) T.differentiableAt, T.fderiv]
    rw [hChain]
    rfl
  constructor
  · rw [hFirst]
    exact (ContinuousLinearMap.opNorm_comp_le ..).trans
      ((mul_le_mul (hc₁ _ hHead) hT (norm_nonneg T) hC₁).trans_eq (by ring))
  · apply ContinuousLinearMap.opNorm_le_bound _ (by positivity)
    intro v
    apply ContinuousLinearMap.opNorm_le_bound _ (by positivity)
    intro w
    rw [hSecond]
    have hW (u : E₄) : ‖T u‖ ≤ r⁻¹ * ‖u‖ := ContinuousLinearMap.le_of_opNorm_le T hT u
    calc
      ‖fderiv ℝ (fderiv ℝ f) (T x) (T v) (T w)‖ ≤ C₂ * ‖T v‖ * ‖T w‖ :=
        (ContinuousLinearMap.le_opNorm _ _).trans
          (mul_le_mul_of_nonneg_right (ContinuousLinearMap.le_of_opNorm_le _ (hc₂ _ hHead) _) (norm_nonneg _))
      _ ≤ C₂ * (r⁻¹ * ‖v‖) * (r⁻¹ * ‖w‖) :=
        mul_le_mul (mul_le_mul_of_nonneg_left (hW v) hC₂) (hW w) (norm_nonneg _) (by positivity)
      _ = _ := by ring


/-- Exact zeroth matching bounds the native scalar defect linearly in radius.
If the normal-coordinate first jet also vanishes, the same fixed compact
bounds give the quadratic value and linear derivative rates. -/
theorem exists_nativePocketCoefficientTaylor {U : Set E₄} (hU : IsOpen U)
    {R₀ : ℝ} (hR₀ : 0 ≤ R₀) (hBuffer : Metric.closedBall (0 : E₄) R₀ ⊆ U)
    {D : E₄ → ℝ} (hD : ContDiffOn ℝ ∞ D U) (hD₀ : D 0 = 0) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ x ∈ Metric.closedBall (0 : E₄) R₀,
      |D x| ≤ C * ‖x‖ ∧ ‖fderiv ℝ D x‖ ≤ C ∧
      ‖fderiv ℝ (fderiv ℝ D) x‖ ≤ C ∧
      (fderiv ℝ D 0 = 0 → |D x| ≤ C * ‖x‖ ^ 2 ∧ ‖fderiv ℝ D x‖ ≤ C * ‖x‖) := by
  let B := Metric.closedBall (0 : E₄) R₀
  have hB : IsCompact B := isCompact_closedBall _ _
  have hD₁ : ContDiffOn ℝ ∞ (fderiv ℝ D) U := hD.fderiv_of_isOpen hU (by simp)
  have hD₂ : ContDiffOn ℝ ∞ (fderiv ℝ (fderiv ℝ D)) U := hD₁.fderiv_of_isOpen hU (by simp)
  obtain ⟨C₁, hC₁, hB₁⟩ := compact_opNorm_bound hB (hD₁.continuousOn.mono hBuffer)
  obtain ⟨C₂, hC₂, hB₂⟩ := compact_opNorm_bound hB (hD₂.continuousOn.mono hBuffer)
  let C := max C₁ C₂
  have hC : 0 ≤ C := hC₁.trans (le_max_left ..)
  have h0B : (0 : E₄) ∈ B := Metric.mem_closedBall_self hR₀
  have hCvx : Convex ℝ B := convex_closedBall _ _
  have hDiff (x : E₄) (hx : x ∈ B) : DifferentiableAt ℝ D x :=
    (hD.contDiffAt (hU.mem_nhds (hBuffer hx))).differentiableAt (by simp)
  have hDiff₁ (x : E₄) (hx : x ∈ B) : DifferentiableAt ℝ (fderiv ℝ D) x :=
    (hD₁.contDiffAt (hU.mem_nhds (hBuffer hx))).differentiableAt (by simp)
  have hGrad (x : E₄) (hx : x ∈ B) : ‖fderiv ℝ D x‖ ≤ C :=
    (hB₁ x hx).trans (le_max_left ..)
  have hHess (x : E₄) (hx : x ∈ B) : ‖fderiv ℝ (fderiv ℝ D) x‖ ≤ C :=
    (hB₂ x hx).trans (le_max_right ..)
  refine ⟨C, hC, fun x hx => ⟨?_, hGrad x hx, hHess x hx, ?_⟩⟩
  · simpa only [hD₀, sub_zero, Real.norm_eq_abs] using
      hCvx.norm_image_sub_le_of_norm_fderiv_le hDiff hGrad h0B hx
  · intro hExact
    have hGradExact (y : E₄) (hy : y ∈ B) : ‖fderiv ℝ D y‖ ≤ C * ‖y‖ := by
      simpa only [hExact, sub_zero] using
        hCvx.norm_image_sub_le_of_norm_fderiv_le hDiff₁ hHess h0B hy
    refine ⟨?_, hGradExact x hx⟩
    let Bx := Metric.closedBall (0 : E₄) ‖x‖
    have hBx : Bx ⊆ B := Metric.closedBall_subset_closedBall
      (by simpa only [B, Metric.mem_closedBall, dist_zero_right] using hx)
    have hCvx' : Convex ℝ Bx := convex_closedBall _ _
    have hb (y : E₄) (hy : y ∈ Bx) : ‖fderiv ℝ D y‖ ≤ C * ‖x‖ :=
      (hGradExact y (hBx hy)).trans (mul_le_mul_of_nonneg_left
        (by simpa only [Bx, Metric.mem_closedBall, dist_zero_right] using hy) hC)
    have h0Bx : (0 : E₄) ∈ Bx := Metric.mem_closedBall_self (norm_nonneg _)
    have hxBx : x ∈ Bx := by simp [Bx, Metric.mem_closedBall, dist_zero_right]
    have hh := hCvx'.norm_image_sub_le_of_norm_fderiv_le (fun y hy => hDiff y (hBx hy)) hb h0Bx hxBx
    simpa only [hD₀, sub_zero, Real.norm_eq_abs, mul_assoc, ← pow_two] using hh


variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]

private def nativePocketPush (F : PartialDiffeomorph I₄ I E₄ M ∞) (r : ℝ) : M → ℝ := by
  classical
  exact F.target.piecewise (nativePocketCutoff r ∘ F.symm) (fun _ => 0)

omit [IsManifold I ∞ M] [T2Space M] in
private theorem nativePocketPush_chart (F : PartialDiffeomorph I₄ I E₄ M ∞)
    (r : ℝ) {x : E₄} (hx : x ∈ F.source) : nativePocketPush F r (F x) = nativePocketCutoff r x := by
  classical
  rw [nativePocketPush, piecewise_eq_of_mem _ _ _ (F.map_source hx), Function.comp_apply]
  exact congrArg (nativePocketCutoff r) (F.left_inv hx)

omit [IsManifold I ∞ M] [T2Space M] in
private theorem nativePocketPush_ne_zero (F : PartialDiffeomorph I₄ I E₄ M ∞)
    {r : ℝ} (hr : 0 < r) {y : M} (hy : nativePocketPush F r y ≠ 0) :
    y ∈ F '' Metric.closedBall (0 : E₄) (5 * r / 2) := by
  classical
  have hyt : y ∈ F.target := by
    by_contra h
    exact hy (piecewise_eq_of_notMem _ _ _ h)
  refine ⟨F.symm y, ?_, F.right_inv hyt⟩
  rw [Metric.mem_closedBall, dist_zero_right]
  by_contra! h
  apply hy
  rw [nativePocketPush, piecewise_eq_of_mem _ _ _ hyt, Function.comp_apply,
    nativePocketCutoff_eq_zero hr h.le]

omit [IsManifold I ∞ M] in
private theorem contMDiff_nativePocketPush (F : PartialDiffeomorph I₄ I E₄ M ∞)
    {r : ℝ} (hr : 0 < r) (hS : Metric.closedBall (0 : E₄) (3 * r) ⊆ F.source) :
    ContMDiff I 𝓘(ℝ) ∞ (nativePocketPush F r) := by
  classical
  let K := Metric.closedBall (0 : E₄) (5 * r / 2)
  have hK : K ⊆ F.source :=
    (Metric.closedBall_subset_closedBall (by linarith)).trans hS
  have hClosed : IsClosed (F '' K) :=
    ((isCompact_closedBall _ _).image_of_continuousOn (F.contMDiffOn_toFun.continuousOn.mono hK)).isClosed
  have hOn : ContMDiffOn I 𝓘(ℝ) ∞ (nativePocketPush F r) F.target := by
    apply (((contDiff_nativePocketCutoff r).contMDiff.contMDiffOn (s := univ)).comp
      F.contMDiffOn_invFun (mapsTo_univ _ _)).congr
    intro y hy
    exact piecewise_eq_of_mem _ _ _ hy
  intro y
  by_cases hy : y ∈ F.target
  · exact hOn.contMDiffAt (F.open_target.mem_nhds hy)
  · have hOff : y ∉ F '' K := by
      rintro ⟨x, hx, rfl⟩
      exact hy (F.map_source (hK hx))
    apply contMDiffAt_const.congr_of_eventuallyEq
    filter_upwards [hClosed.isOpen_compl.mem_nhds hOff] with z hz
    exact not_ne_iff.mp (fun h => hz (nativePocketPush_ne_zero F hr h))

omit [IsManifold I ∞ M] [T2Space M] in
private theorem nativePocketPush_mem_Icc (F : PartialDiffeomorph I₄ I E₄ M ∞)
    (r : ℝ) (y : M) : nativePocketPush F r y ∈ Icc (0 : ℝ) 1 := by
  classical
  by_cases hy : y ∈ F.target
  · rw [nativePocketPush, piecewise_eq_of_mem _ _ _ hy]
    exact nativePocketCutoff_mem_Icc _ _
  · rw [nativePocketPush, piecewise_eq_of_notMem _ _ _ hy]
    exact ⟨le_rfl, zero_le_one⟩

/-- The true positive affine path on the unchanged ambient source. -/
def nativePocketPath (F : PartialDiffeomorph I₄ I E₄ M ∞)
    (g R : SmoothRiemannianMetric I M) {r : ℝ} (hr : 0 < r)
    (hS : Metric.closedBall (0 : E₄) (3 * r) ⊆ F.source) (s : Icc (0 : ℝ) 1) :
    SmoothRiemannianMetric I M :=
  chartSpliceMetric g R (nativePocketPush F r) (contMDiff_nativePocketPush F hr hS)
    (nativePocketPush_mem_Icc F r) s s.2

set_option backward.isDefEq.respectTransparency false in
theorem nativePocketPath_inner (F : PartialDiffeomorph I₄ I E₄ M ∞)
    (g R : SmoothRiemannianMetric I M) {r : ℝ} (hr : 0 < r)
    (hS : Metric.closedBall (0 : E₄) (3 * r) ⊆ F.source) (s : Icc (0 : ℝ) 1)
    (y : M) (v w : TangentSpace I y) :
    (nativePocketPath F g R hr hS s).inner y v w =
      ((s : ℝ) * nativePocketPush F r y) * R.inner y v w +
        (1 - (s : ℝ) * nativePocketPush F r y) * g.inner y v w := by
  unfold nativePocketPath chartSpliceMetric
  rw [convexComb_inner]
  rfl

/-- Exact agreement with the source near the entire complement of the
chosen open pocket. The strictly smaller cutoff support also fixes its rim. -/
theorem nativePocketPath_outer_germ (F : PartialDiffeomorph I₄ I E₄ M ∞)
    (g R : SmoothRiemannianMetric I M) {r : ℝ} (hr : 0 < r)
    (hS : Metric.closedBall (0 : E₄) (3 * r) ⊆ F.source) (s : Icc (0 : ℝ) 1)
    {y : M} (hy : y ∉ F '' Metric.ball (0 : E₄) (3 * r)) :
    ∀ᶠ z in 𝓝 y, ∀ v w : TangentSpace I z, (nativePocketPath F g R hr hS s).inner z v w =
      g.inner z v w := by
  let K := Metric.closedBall (0 : E₄) (5 * r / 2)
  have hK : K ⊆ F.source := (Metric.closedBall_subset_closedBall (by linarith)).trans hS
  have hClosed : IsClosed (F '' K) :=
    ((isCompact_closedBall _ _).image_of_continuousOn (F.contMDiffOn_toFun.continuousOn.mono hK)).isClosed
  have hOff : y ∉ F '' K :=
    fun h => hy (image_mono (Metric.closedBall_subset_ball (by linarith)) h)
  filter_upwards [hClosed.isOpen_compl.mem_nhds hOff] with z hz
  intro v w
  have hχ : nativePocketPush F r z = 0 := not_ne_iff.mp (fun hp => hz (nativePocketPush_ne_zero F hr hp))
  rw [nativePocketPath_inner, hχ]
  simp

theorem nativePocketPath_at_zero (F : PartialDiffeomorph I₄ I E₄ M ∞)
    (g R : SmoothRiemannianMetric I M) {r : ℝ} (hr : 0 < r)
    (hS : Metric.closedBall (0 : E₄) (3 * r) ⊆ F.source) :
    nativePocketPath F g R hr hS ⟨0, le_rfl, zero_le_one⟩ = g := by
  apply SmoothRiemannianMetric.ext_inner
  intro y v w
  rw [nativePocketPath_inner]
  simp

variable [SigmaCompactSpace M]

/-- Extend the Euclidean reference from one fixed compact native ball.
The same extension is used for every small affine pocket. -/
theorem exists_nativePocketReference (g : SmoothRiemannianMetric I M)
    (F : PartialDiffeomorph I₄ I E₄ M ∞) {R₀ : ℝ}
    (hB : Metric.closedBall (0 : E₄) R₀ ⊆ F.source) :
    ∃ (R : SmoothRiemannianMetric I M) (U : TopologicalSpace.Opens E₄),
      Metric.closedBall (0 : E₄) R₀ ⊆ (U : Set E₄) ∧ (U : Set E₄) ⊆ F.source ∧
      ∀ x ∈ U, ∀ v w : E₄,
        (euclideanMetric E₄).inner x v w = R.inner (F x)
          (mfderiv I₄ I (F : E₄ → M) x v) (mfderiv I₄ I (F : E₄ → M) x w) := by
  obtain ⟨R, U, hU, hUs, hR, _⟩ :=
    F.exists_metric_preserving_on_neighborhood_of_is_compact (euclideanMetric E₄) g
      (isCompact_closedBall _ _) hB
  exact ⟨R, U, hU, hUs, hR⟩

omit [SigmaCompactSpace M] in
/-- The endpoint is the genuinely flat native metric on the entire open
inner pocket, with the actual partial diffeomorphism as its marking. -/
theorem nativePocketPath_endpoint_flat (F : PartialDiffeomorph I₄ I E₄ M ∞)
    (g R : SmoothRiemannianMetric I M) {r : ℝ} (hr : 0 < r)
    (hS : Metric.closedBall (0 : E₄) (3 * r) ⊆ F.source)
    (hMatch : ∀ x ∈ Metric.ball (0 : E₄) (2 * r), ∀ v w : E₄,
      (euclideanMetric E₄).inner x v w = R.inner (F x)
        (mfderiv I₄ I (F : E₄ → M) x v) (mfderiv I₄ I (F : E₄ → M) x w)) :
    let P := nativePocketPath F g R hr hS ⟨1, zero_le_one, le_rfl⟩
    (∀ x ∈ Metric.ball (0 : E₄) (2 * r), ∀ v w : E₄,
      (euclideanMetric E₄).inner x v w = P.inner (F x)
        (mfderiv I₄ I (F : E₄ → M) x v) (mfderiv I₄ I (F : E₄ → M) x w)) ∧
    (∀ x ∈ Metric.ball (0 : E₄) (2 * r), metricRm04At P (F x) = 0) := by
  intro P
  let U : TopologicalSpace.Opens E₄ := ⟨Metric.ball 0 (2 * r), Metric.isOpen_ball⟩
  have hUS : (U : Set E₄) ⊆ F.source :=
    Metric.ball_subset_closedBall.trans ((Metric.closedBall_subset_closedBall (by linarith)).trans hS)
  have hEucl (x : E₄) (hx : x ∈ U) (v w : E₄) :
      (euclideanMetric E₄).inner x v w = P.inner (F x)
        (mfderiv I₄ I (F : E₄ → M) x v) (mfderiv I₄ I (F : E₄ → M) x w) := by
    have hRad : ‖x‖ ≤ 2 * r := by
      change x ∈ Metric.ball (0 : E₄) (2 * r) at hx
      exact (by simpa only [Metric.mem_ball, dist_zero_right] using hx : ‖x‖ < 2 * r).le
    rw [hMatch x hx v w, nativePocketPath_inner, nativePocketPush_chart F r (hUS hx),
      nativePocketCutoff_eq_one hr hRad]
    simp
  exact ⟨hEucl, fun x hx => selectedEuclideanGerm_flat P F U hUS hEucl ⟨x, hx⟩⟩


section Volume

variable [I.Boundaryless]
private local instance : MeasurableSpace E₄ := borel E₄
private local instance : BorelSpace E₄ := ⟨rfl⟩
private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

/-- One reference and physical volume constant at the fixed source work
for every sufficiently small pocket and every point on its affine path. -/
theorem exists_nativePocket_volume_bound (g : SmoothRiemannianMetric I M)
    (F : PartialDiffeomorph I₄ I E₄ M ∞) {R₀ : ℝ}
    (hB : Metric.closedBall (0 : E₄) R₀ ⊆ F.source) :
    ∃ (R : SmoothRiemannianMetric I M) (V : ℝ), 0 ≤ V ∧
      (∀ x ∈ Metric.closedBall (0 : E₄) R₀, ∀ v w : E₄,
        (euclideanMetric E₄).inner x v w = R.inner (F x)
          (mfderiv I₄ I (F : E₄ → M) x v) (mfderiv I₄ I (F : E₄ → M) x w)) ∧
      ∀ {r : ℝ} (hr : 0 < r) (hBound : 3 * r ≤ R₀) (s : Icc (0 : ℝ) 1),
        let hS := (Metric.closedBall_subset_closedBall hBound).trans hB
        (riemannianVolumeMeasure I M (nativePocketPath F g R hr hS s)).real
          (F '' Metric.closedBall (0 : E₄) (3 * r)) ≤ V * r ^ 4 := by
  obtain ⟨R, U, hU, hUs, hRef⟩ := exists_nativePocketReference g F hB
  let K := F '' Metric.closedBall (0 : E₄) R₀
  let Q := R.convexComb g (fun _ => 1 / 2) contMDiff_const (fun _ => by norm_num)
  have hK : IsCompact K := (isCompact_closedBall _ _).image_of_continuousOn
    (F.contMDiffOn_toFun.continuousOn.mono hB)
  obtain ⟨B, hBmax⟩ := hK.bddAbove_image (riemannianVolumeDensity_contMDiff R Q).continuous.continuousOn
  let B₀ := max 0 B * Real.sqrt (2 ^ Module.finrank ℝ E₄)
  have hB₀ : 0 ≤ B₀ := mul_nonneg (le_max_left ..) (Real.sqrt_nonneg _)
  let k : ℝ := volume.real (Metric.ball (0 : E₄) 1)
  have hk : 0 ≤ k := measureReal_nonneg
  refine ⟨R, B₀ * (3 : ℝ) ^ 4 * k, by positivity,
    fun x hx => hRef x (hU hx), ?_⟩
  intro r hr hBound s hS
  let P := nativePocketPath F g R hr hS s
  let A := Metric.closedBall (0 : E₄) (3 * r)
  have hAc : IsCompact A := isCompact_closedBall _ _
  have hAS : A ⊆ F.source := hS
  have hAP : IsCompact (F '' A) :=
    hAc.image_of_continuousOn (F.contMDiffOn_toFun.continuousOn.mono hAS)
  have hV (y : M) (hy : y ∈ F '' A) : riemannianVolumeDensity R P y ≤ B₀ := by
    have hI (v : TangentSpace I y) : P.inner y v v ≤ 2 * Q.inner y v v := by
      have hs₀ := mul_nonneg s.2.1 (nativePocketPush_mem_Icc F r y).1
      have hs₁ := (mul_le_mul_of_nonneg_right s.2.2 (nativePocketPush_mem_Icc F r y).1).trans
        (by simpa using (nativePocketPush_mem_Icc F r y).2)
      have hg := metric_inner_self_nonneg g y v
      have hR := metric_inner_self_nonneg R y v
      have hQ : Q.inner y v v =
          (1 / 2 : ℝ) * R.inner y v v + (1 - (1 / 2 : ℝ)) * g.inner y v v := by
        unfold Q
        rw [convexComb_inner]
        rfl
      rw [nativePocketPath_inner, hQ]
      exact (add_le_add (mul_le_of_le_one_left hR hs₁)
        (mul_le_of_le_one_left hg (by linarith only [hs₀]))).trans_eq (by ring)
    have hY : y ∈ K := image_mono (Metric.closedBall_subset_closedBall hBound) hy
    rw [← riemannianVolumeDensity_mul R Q P]
    exact mul_le_mul ((hBmax (mem_image_of_mem _ hY)).trans (le_max_right ..))
      (riemannianVolumeDensity_le_of_inner_le Q P (by norm_num : 0 < (2 : ℝ)) y hI)
      (riemannianVolumeDensity_pos Q P y).le (le_max_left ..)
  have hChange := setLIntegral_image_partialDiffeomorph F (euclideanMetric E₄) R U hUs hRef
    hAc.measurableSet ((Metric.closedBall_subset_closedBall hBound).trans hU) (fun _ => (1 : ℝ≥0∞))
  have hρ : (riemannianVolumeMeasure I M R).real (F '' A) = (3 * r) ^ 4 * k := by
    have heq : riemannianVolumeMeasure I M R (F '' A) =
        riemannianVolumeMeasure I₄ E₄ (euclideanMetric E₄) A := by simpa using hChange
    change (riemannianVolumeMeasure I M R (F '' A)).toReal = _
    have hMetric : Geometry.euclideanMetric E₄ = DifferentialGeometry.euclideanMetric (E := E₄) := by
      apply SmoothRiemannianMetric.ext_inner
      intro x v w
      rfl
    rw [heq, hMetric, riemannianVolumeMeasure_euclideanMetric]
    change volume.real (Metric.closedBall (0 : E₄) (3 * r)) = _
    rw [Measure.addHaar_real_closedBall volume 0 (by positivity)]
    simp [k]
  exact (physicalVolumeReal_le_of_density R P hAP hB₀ hV).trans_eq (by rw [hρ]; ring)

end Volume


section Signed

open SectionsAndConnections

variable [I.Boundaryless] [CompactSpace M] {o : ManifoldOrientation I M 4}

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

omit [I.Boundaryless] [SigmaCompactSpace M] in
/-- The only signed change on the full joined source comes from the
shrinking native pocket. All terms use their own metric's volume. -/
theorem nativePocketPath_signed_change (F : PartialDiffeomorph I₄ I E₄ M ∞)
    (g h : SignedCollarMetric o) (R : SmoothRiemannianMetric I M) {r : ℝ} (hr : 0 < r)
    (hS : Metric.closedBall (0 : E₄) (3 * r) ⊆ F.source) (s : Icc (0 : ℝ) 1)
    (hPath : h.metric = nativePocketPath F g.metric R hr hS s)
    (hFrame : ∀ y ∉ F '' Metric.closedBall (0 : E₄) (3 * r), (g.frame y).basis = (h.frame y).basis)
    (σ : CollarChirality) :
    let A := F '' Metric.closedBall (0 : E₄) (3 * r)
    h.energy σ - g.energy σ = h.charge σ A - g.charge σ A := by
  intro A
  have hA : MeasurableSet A := ((isCompact_closedBall _ _).image_of_continuousOn
    (F.contMDiffOn_toFun.continuousOn.mono hS)).measurableSet
  have hGerm (y : M) (hy : y ∈ Aᶜ) :
      ∀ᶠ z in 𝓝 y, ∀ v w : TangentSpace I z, g.metric.inner z v w = h.metric.inner z v w := by
    rw [hPath]
    have hOff : y ∉ F '' Metric.ball (0 : E₄) (3 * r) :=
      fun hz => hy (image_mono Metric.ball_subset_closedBall hz)
    exact (nativePocketPath_outer_germ F g.metric R hr hS s hOff).mono fun z hz v w => (hz v w).symm
  have hChg := selectedReference_charge_eq_of_germ g h hA.compl hGerm
    (fun y hy => hFrame y hy) σ
  change (g.chiralMeasure σ).real Aᶜ = (h.chiralMeasure σ).real Aᶜ at hChg
  rw [measureReal_compl hA, measureReal_compl hA] at hChg
  change g.charge σ univ - g.charge σ A = h.charge σ univ - h.charge σ A at hChg
  rw [g.charge_univ, h.charge_univ] at hChg
  linarith only [hChg]

/-- Uniform native curvature and volume estimates give a signed drift and
the strict joined bound at this same finite metric. -/
theorem nativePocketPath_signed_peak_of_curvature (F : PartialDiffeomorph I₄ I E₄ M ∞)
    (g h : SignedCollarMetric o) (R : SmoothRiemannianMetric I M) {r : ℝ} (hr : 0 < r)
    (hS : Metric.closedBall (0 : E₄) (3 * r) ⊆ F.source) (s : Icc (0 : ℝ) 1)
    (hPath : h.metric = nativePocketPath F g.metric R hr hS s)
    (hFrame : ∀ y ∉ F '' Metric.closedBall (0 : E₄) (3 * r), (g.frame y).basis = (h.frame y).basis)
    {V D T : ℝ} (hD : 0 ≤ D)
    (hVolume : ∀ q ∈ ({g, h} : Set (SignedCollarMetric o)),
      (riemannianVolumeMeasure I M q.metric).real (F '' Metric.closedBall (0 : E₄) (3 * r)) ≤ V * r ^ 4)
    (hCurv : ∀ q ∈ ({g, h} : Set (SignedCollarMetric o)),
      ∀ y ∈ F '' Metric.closedBall (0 : E₄) (3 * r),
        frameTensorNormSq (metricCurvatureFrameTensor q.metric o y (q.frame y)) ≤ D)
    (hGap : g.energy .plus + D * V * r ^ 4 < 2 * T) :
    (∀ σ, |h.energy σ - g.energy σ| ≤ D * V * r ^ 4) ∧
      ∀ σ, h.energy σ < 2 * T := by
  let A := F '' Metric.closedBall (0 : E₄) (3 * r)
  have hA : MeasurableSet A := ((isCompact_closedBall _ _).image_of_continuousOn
    (F.contMDiffOn_toFun.continuousOn.mono hS)).measurableSet
  have hCharge (q : SignedCollarMetric o) (hq : q ∈ ({g, h} : Set (SignedCollarMetric o)))
      (σ : CollarChirality) : q.charge σ A ≤ D * V * r ^ 4 := by
    have hh := (signedStripChargeSum_le q hA (hCurv q hq)).trans
      (mul_le_mul_of_nonneg_left (hVolume q hq) hD)
    rw [← mul_assoc] at hh
    cases σ
    · have hm : 0 ≤ q.charge .minus A := measureReal_nonneg
      linarith only [hh, hm]
    · have hp : 0 ≤ q.charge .plus A := measureReal_nonneg
      linarith only [hh, hp]
  have hDrift (σ : CollarChirality) : |h.energy σ - g.energy σ| ≤ D * V * r ^ 4 := by
    rw [nativePocketPath_signed_change F g h R hr hS s hPath hFrame σ]
    have h0 : 0 ≤ g.charge σ A := measureReal_nonneg
    have h1 : 0 ≤ h.charge σ A := measureReal_nonneg
    have hOld := hCharge g (by simp) σ
    have hNew := hCharge h (by simp) σ
    exact abs_le.mpr ⟨by linarith only [hOld, h1], by linarith only [hNew, h0]⟩
  have hPlus : h.energy .plus < 2 * T := by
    linarith only [(abs_le.mp (hDrift .plus)).2, hGap]
  have hSignature : h.energy .plus = h.energy .minus := h.signature_zero
  refine ⟨hDrift, fun σ => ?_⟩
  cases σ
  · exact hPlus
  · rwa [← hSignature]

end Signed

end
end SmoothPoincare
