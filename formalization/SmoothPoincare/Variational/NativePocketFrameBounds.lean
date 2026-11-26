import SmoothPoincare.Variational.NativePocketFlattening
import SmoothPoincare.Variational.IntrinsicEulerDensity
import DifferentialGeometry.Geometry.Curvature.Coordinates.MetricJet.CurvatureFromJet
import DifferentialGeometry.Geometry.Curvature.CurvatureOperator.Derivatives.LocalPullback
import DifferentialGeometry.Geometry.Metric.TensorInner.Estimates.ComponentBounds
import DifferentialGeometry.Geometry.Connection.ChartBridge.Metric.InverseGram

/-! # Uniform native metric and curvature estimates on a shrinking pocket -/

open DifferentialGeometry DifferentialGeometry.Geometry DifferentialGeometry.Geometry.Curvature
open FirstOrderTwistor Filter Manifold Set Bundle
open DifferentialGeometry.Geometry.Operator DifferentialGeometry.Tensor.Coordinates
open DifferentialGeometry.Tensor0SBundle DifferentialGeometry.CheegerGromovCompactness
open scoped ContDiff Manifold Topology

namespace SmoothPoincare

noncomputable section

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "I₄" => 𝓘(ℝ, E₄)

private theorem nativePocketWeight_mem_Icc (s : Icc (0 : ℝ) 1) (r : ℝ) (x : E₄) :
    (s : ℝ) * nativePocketCutoff r x ∈ Icc (0 : ℝ) 1 := by
  have h₀ : 0 ≤ nativePocketCutoff r x := Real.smoothTransition.nonneg _
  have h₁ : nativePocketCutoff r x ≤ 1 := Real.smoothTransition.le_one _
  exact ⟨mul_nonneg s.2.1 h₀, (mul_le_of_le_one_left h₀ s.2.2).trans h₁⟩

/-- The first derivative of the actual scalar affine defect stays bounded.
A vanishing center first jet improves the bound to order `r`. -/
theorem exists_nativePocketAffineCoefficient_first_bounds
    {U : Set E₄} (hU : IsOpen U) {R₀ : ℝ} (hR₀ : 0 ≤ R₀)
    (hBuffer : Metric.closedBall (0 : E₄) R₀ ⊆ U)
    {D : E₄ → ℝ} (hD : ContDiffOn ℝ ∞ D U) (hD₀ : D 0 = 0) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ (s : Icc (0 : ℝ) 1) {r : ℝ}, 0 < r → 3 * r ≤ R₀ →
      ∀ x ∈ Metric.closedBall (0 : E₄) (3 * r),
        let N := nativePocketAffineCoefficient s r D
        ‖fderiv ℝ N x‖ ≤ C ∧
          (fderiv ℝ D 0 = 0 → ‖fderiv ℝ N x‖ ≤ C * r) := by
  obtain ⟨A, hA, hTaylor⟩ := exists_nativePocketCoefficientTaylor hU hR₀ hBuffer hD hD₀
  obtain ⟨L, _, hL, _, hCut⟩ := exists_nativePocketCutoff_deriv_bounds
  refine ⟨A * (3 + 9 * L), by positivity, ?_⟩
  intro s r hr hR x hx N
  let b := fun y => 1 - (s : ℝ) * nativePocketCutoff r y
  have hB := Metric.closedBall_subset_closedBall hR hx
  have hNorm : ‖x‖ ≤ 3 * r := by simpa only [Metric.mem_closedBall, dist_zero_right] using hx
  have hbd : DifferentiableAt ℝ b x :=
    ((contDiff_const.sub (contDiff_const.mul (contDiff_nativePocketCutoff r))).differentiable
      (by simp) x)
  have hDd := (hD.contDiffAt (hU.mem_nhds (hBuffer hB))).differentiableAt (by simp)
  have hWeight := nativePocketWeight_mem_Icc s r x
  have hb₀ : |b x| ≤ 1 := by
    change |1 - (s : ℝ) * nativePocketCutoff r x| ≤ 1
    rw [abs_of_nonneg (sub_nonneg.mpr hWeight.2)]
    exact sub_le_self _ hWeight.1
  have hb₁ : ‖fderiv ℝ b x‖ ≤ L / r := by
    change ‖fderiv ℝ (fun y => 1 - (s : ℝ) * nativePocketCutoff r y) x‖ ≤ L / r
    rw [fderiv_const_sub]
    change ‖-fderiv ℝ (fun y => (s : ℝ) • nativePocketCutoff r y) x‖ ≤ L / r
    have heq : fderiv ℝ (fun y => (s : ℝ) • nativePocketCutoff r y) x =
        (s : ℝ) • fderiv ℝ (nativePocketCutoff r) x :=
      fderiv_const_smul ((contDiff_nativePocketCutoff r).differentiable (by simp) x) (s : ℝ)
    rw [heq, norm_neg, norm_smul, Real.norm_eq_abs, abs_of_nonneg s.2.1]
    exact (mul_le_of_le_one_left (norm_nonneg _) s.2.2).trans (hCut hr x hNorm).1
  have hProduct : ‖fderiv ℝ N x‖ ≤ ‖fderiv ℝ D x‖ + |D x| * (L / r) := by
    change ‖fderiv ℝ (fun y => b y * D y) x‖ ≤ _
    rw [fderiv_fun_mul hbd hDd]
    calc
      _ ≤ ‖b x • fderiv ℝ D x‖ + ‖D x • fderiv ℝ b x‖ := norm_add_le _ _
      _ ≤ _ := by
        rw [norm_smul, norm_smul, Real.norm_eq_abs, Real.norm_eq_abs]
        exact add_le_add (mul_le_of_le_one_left (norm_nonneg _) hb₀)
          (mul_le_mul_of_nonneg_left hb₁ (abs_nonneg _))
  obtain ⟨hVal, hDeriv, _, hExact⟩ := hTaylor x hB
  constructor
  · calc
      ‖fderiv ℝ N x‖ ≤ A + (A * (3 * r)) * (L / r) :=
        hProduct.trans (add_le_add hDeriv (mul_le_mul_of_nonneg_right
          (hVal.trans (mul_le_mul_of_nonneg_left hNorm hA)) (by positivity)))
      _ ≤ A * (3 + 9 * L) := by
        field_simp [hr.ne']
        nlinarith only [mul_nonneg hA hL, hA]
  · intro h₀
    obtain ⟨hVal', hDeriv'⟩ := hExact h₀
    calc
      ‖fderiv ℝ N x‖ ≤ A * (3 * r) + (A * (3 * r)^2) * (L / r) :=
        hProduct.trans (add_le_add (hDeriv'.trans (mul_le_mul_of_nonneg_left hNorm hA))
          (mul_le_mul_of_nonneg_right
            (hVal'.trans (mul_le_mul_of_nonneg_left (pow_le_pow_left₀ (norm_nonneg _) hNorm 2) hA))
            (by positivity)))
      _ = A * (3 + 9 * L) * r := by field_simp [hr.ne']; ring

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]

/-- Uniform first-jet estimates in the original marking for every slice of
the actual flattening metric and every radius in the fixed buffer. -/
theorem exists_nativePocketPath_nativeCoefficient_first_bounds
    (F : PartialDiffeomorph I₄ I E₄ M ∞) (g R : SmoothRiemannianMetric I M)
    (v w : E₄) {R₀ : ℝ} (hR₀ : 0 ≤ R₀)
    (hBuffer : Metric.closedBall (0 : E₄) R₀ ⊆ F.source)
    (hZero : nativePocketMetricCoefficient F g v w 0 = nativePocketMetricCoefficient F R v w 0) :
    let D := fun y => nativePocketMetricCoefficient F g v w y - nativePocketMetricCoefficient F R v w y
    ∃ C : ℝ, 0 ≤ C ∧ ∀ (s : Icc (0 : ℝ) 1) {r : ℝ} (hr : 0 < r)
      (hBound : 3 * r ≤ R₀) (x : E₄), x ∈ Metric.closedBall (0 : E₄) (3 * r) →
        let hS := (Metric.closedBall_subset_closedBall hBound).trans hBuffer
        let X := fun y => nativePocketMetricCoefficient F (nativePocketPath F g R hr hS s) v w y -
          nativePocketMetricCoefficient F R v w y
        ‖fderiv ℝ X x‖ ≤ C ∧ (fderiv ℝ D 0 = 0 → ‖fderiv ℝ X x‖ ≤ C * r) := by
  intro D
  have hD : ContDiffOn ℝ ∞ D F.source :=
    (contDiffOn_nativePocketMetricCoefficient F g v w).sub (contDiffOn_nativePocketMetricCoefficient F R v w)
  obtain ⟨C, hC, hRate⟩ :=
    exists_nativePocketAffineCoefficient_first_bounds F.open_source hR₀ hBuffer hD (sub_eq_zero.mpr hZero)
  refine ⟨C, hC, ?_⟩
  intro s r hr hBound x hx hS X
  have hGerm : X =ᶠ[𝓝 x] nativePocketAffineCoefficient s r D :=
    nativePocketPath_nativeCoefficient_germ F g R hr hS s v w (hS hx)
  rw [hGerm.fderiv_eq]
  exact hRate s hr hBound x hx

/-- In the marking, the path is the convex combination with the actual
native cutoff evaluated at the original physical point. -/
theorem nativePocketPath_nativeCoefficient_eq
    (F : PartialDiffeomorph I₄ I E₄ M ∞) (g R : SmoothRiemannianMetric I M)
    {r : ℝ} (hr : 0 < r) (hS : Metric.closedBall (0 : E₄) (3 * r) ⊆ F.source)
    (s : Icc (0 : ℝ) 1) (v w : E₄) {x : E₄} (hx : x ∈ F.source) :
    nativePocketMetricCoefficient F (nativePocketPath F g R hr hS s) v w x =
      (1 - (s : ℝ) * nativePocketCutoff r x) * nativePocketMetricCoefficient F g v w x +
        ((s : ℝ) * nativePocketCutoff r x) * nativePocketMetricCoefficient F R v w x := by
  have h := (nativePocketPath_nativeCoefficient_germ F g R hr hS s v w hx).eq_of_nhds
  unfold nativePocketAffineCoefficient at h
  linarith only [h]

omit [T2Space M] in
private theorem exists_nativePocketMetricCoefficient_lower_bound
    (F : PartialDiffeomorph I₄ I E₄ M ∞) (g : SmoothRiemannianMetric I M)
    {K : Set E₄} (hK : IsCompact K) (hKS : K ⊆ F.source) :
    ∃ c : ℝ, 0 < c ∧ ∀ x ∈ K, ∀ v : E₄, c * ‖v‖ ^ 2 ≤ nativePocketMetricCoefficient F g v v x := by
  let Q : E₄ × E₄ → ℝ := fun p => pullbackMetricCoefficients g (F : E₄ → M) p.1 p.2 p.2
  let S := K ×ˢ Metric.sphere (0 : E₄) 1
  have hS : IsCompact S := hK.prod (isCompact_sphere _ _)
  have hCont : ContinuousOn Q S := by
    have hCoeff := (contDiffOn_pullback_metric_coefficients g F.open_source
      F.contMDiffOn_toFun).continuousOn
    exact ((hCoeff.comp continuous_fst.continuousOn (fun p hp => hKS hp.1)).clm_apply
      continuous_snd.continuousOn).clm_apply continuous_snd.continuousOn
  have hPos (p : E₄ × E₄) (hp : p ∈ S) : 0 < Q p := by
    have hv : p.2 ≠ 0 := by
      intro h
      simpa [h] using hp.2
    have hLocal := PartialDiffeomorph.isLocalDiffeomorphAt I₄ I ∞ F (hKS hp.1)
    have hInj : Function.Injective (mfderiv I₄ I (F : E₄ → M) p.1) :=
      (hLocal.mfderivToContinuousLinearEquiv (by simp)).injective
    exact pullbackMetricCoefficients_pos g hInj hv
  have hMin : ∃ c : ℝ, 0 < c ∧ ∀ p ∈ S, c ≤ Q p := by
    by_cases hne : S.Nonempty
    · obtain ⟨p, hp, hMin⟩ := hS.exists_isMinOn hne hCont
      exact ⟨Q p, hPos p hp, fun q hq => hMin hq⟩
    · exact ⟨1, zero_lt_one, fun p hp => (hne ⟨p, hp⟩).elim⟩
  obtain ⟨c, hc, hMin⟩ := hMin
  refine ⟨c, hc, fun x hx v => ?_⟩
  by_cases hv : v = 0
  · simp [hv, nativePocketMetricCoefficient]
  have hv' : 0 < ‖v‖ := norm_pos_iff.mpr hv
  let w : E₄ := ‖v‖⁻¹ • v
  have hw : ‖w‖ = 1 := by simp [w, norm_smul, hv'.ne']
  have hvw : v = ‖v‖ • w := by simp [w, smul_smul, hv'.ne']
  have h := hMin (x, w) ⟨hx, by simpa using hw⟩
  calc
    c * ‖v‖ ^ 2 ≤ Q (x, w) * ‖v‖ ^ 2 := mul_le_mul_of_nonneg_right h (sq_nonneg _)
    _ = nativePocketMetricCoefficient F g v v x := by
      conv_rhs => rw [hvw]
      simp only [Q, nativePocketMetricCoefficient, map_smul, smul_apply,
        smul_eq_mul]
      ring

/-- A fixed, strictly positive coercivity constant works for the actual
native coefficient form throughout every pocket in the given compact buffer. -/
theorem exists_nativePocketPath_nativeCoefficient_coercive
    (F : PartialDiffeomorph I₄ I E₄ M ∞) (g R : SmoothRiemannianMetric I M)
    {R₀ : ℝ} (hBuffer : Metric.closedBall (0 : E₄) R₀ ⊆ F.source) :
    ∃ c : ℝ, 0 < c ∧ ∀ (s : Icc (0 : ℝ) 1) {r : ℝ} (hr : 0 < r)
      (hBound : 3 * r ≤ R₀) (x : E₄), x ∈ Metric.closedBall (0 : E₄) (3 * r) →
        let hS := (Metric.closedBall_subset_closedBall hBound).trans hBuffer
        ∀ v : E₄, c * ‖v‖ ^ 2 ≤
          nativePocketMetricCoefficient F (nativePocketPath F g R hr hS s) v v x := by
  obtain ⟨a, ha, hg⟩ := exists_nativePocketMetricCoefficient_lower_bound F g
    (isCompact_closedBall _ _) hBuffer
  obtain ⟨b, hb, hR⟩ := exists_nativePocketMetricCoefficient_lower_bound F R
    (isCompact_closedBall _ _) hBuffer
  refine ⟨min a b, lt_min ha hb, ?_⟩
  intro s r hr hBound x hx hS v
  let t := (s : ℝ) * nativePocketCutoff r x
  have ht : t ∈ Icc (0 : ℝ) 1 := nativePocketWeight_mem_Icc s r x
  have hxB := Metric.closedBall_subset_closedBall hBound hx
  rw [nativePocketPath_nativeCoefficient_eq F g R hr hS s v v (hBuffer hxB)]
  have h₁ := (mul_le_mul_of_nonneg_right (min_le_left a b) (sq_nonneg ‖v‖)).trans (hg x hxB v)
  have h₂ := (mul_le_mul_of_nonneg_right (min_le_right a b) (sq_nonneg ‖v‖)).trans (hR x hxB v)
  change min a b * ‖v‖ ^ 2 ≤
    (1-t) * nativePocketMetricCoefficient F g v v x + t * nativePocketMetricCoefficient F R v v x
  linarith only [mul_le_mul_of_nonneg_left h₁ (sub_nonneg.mpr ht.2),
    mul_le_mul_of_nonneg_left h₂ ht.1]

private theorem exists_nativePocketMetricLift
    (F : PartialDiffeomorph I₄ I E₄ M ∞) (g : SmoothRiemannianMetric I M)
    {K : Set E₄} (hK : IsCompact K) (hKS : K ⊆ F.source) :
    ∃ (G : SmoothRiemannianMetric I₄ E₄) (V : TopologicalSpace.Opens E₄),
      K ⊆ (V : Set E₄) ∧ (V : Set E₄) ⊆ F.source ∧
      ∀ x ∈ V, ∀ u v : E₄, G.inner x u v = nativePocketMetricCoefficient F g u v x := by
  have hImage := hK.image_of_continuousOn (F.contMDiffOn_toFun.continuousOn.mono hKS)
  have hImageSource : F '' K ⊆ F.symm.source := by
    rintro _ ⟨x, hx, rfl⟩
    exact F.map_source (hKS hx)
  obtain ⟨G, U, hKU, _, hLift, _⟩ :=
    PartialDiffeomorph.exists_metric_preserving_on_neighborhood_of_is_compact
      F.symm g (euclideanMetric E₄) hImage hImageSource
  let V : TopologicalSpace.Opens E₄ := ⟨F.source ∩ (F : E₄ → M) ⁻¹' U,
    F.toOpenPartialHomeomorph.isOpen_inter_preimage U.isOpen⟩
  refine ⟨G, V, fun x hx => ⟨hKS hx, hKU (mem_image_of_mem F hx)⟩, fun _ hx => hx.1, ?_⟩
  rintro x ⟨hx, hxU⟩ u v
  have hdF := (F.contMDiffOn_toFun.contMDiffAt
    (F.open_source.mem_nhds hx)).mdifferentiableAt (by simp)
  have hdS := (F.symm.contMDiffOn_toFun.contMDiffAt
    (F.open_target.mem_nhds (F.map_source hx))).mdifferentiableAt (by simp)
  have hLeft : ((F.symm : M → E₄) ∘ (F : E₄ → M)) =ᶠ[𝓝 x] id := by
    filter_upwards [F.open_source.mem_nhds hx] with z hz
    exact F.left_inv hz
  have hApply (a : E₄) : mfderiv I I₄ (F.symm : M → E₄) (F x)
      (mfderiv I₄ I (F : E₄ → M) x a) = a := by
    have h := mfderiv_comp_apply x hdS hdF a
    rw [hLeft.mfderiv_eq, mfderiv_id] at h
    exact h.symm
  have h := hLift (F x) hxU (mfderiv I₄ I (F : E₄ → M) x u)
    (mfderiv I₄ I (F : E₄ → M) x v)
  change nativePocketMetricCoefficient F g u v x =
    G.inner (F.symm (F x))
      (mfderiv I I₄ (F.symm : M → E₄) (F x) (mfderiv I₄ I (F : E₄ → M) x u))
      (mfderiv I I₄ (F.symm : M → E₄) (F x) (mfderiv I₄ I (F : E₄ → M) x v)) at h
  rw [hApply, hApply] at h
  have hinv : F.symm.toPartialEquiv (F.toPartialEquiv x) = x := F.left_inv hx
  exact (congrArg (fun y : E₄ => G.inner y u v) hinv.symm).trans h.symm

open DifferentialGeometry.CheegerGromovCompactness DifferentialGeometry.Tensor0SBundle in
private theorem nativePocketMetricLift_curvDerivNorm
    (F : PartialDiffeomorph I₄ I E₄ M ∞) (g : SmoothRiemannianMetric I M)
    (G : SmoothRiemannianMetric I₄ E₄) (V : TopologicalSpace.Opens E₄)
    (hVS : (V : Set E₄) ⊆ F.source)
    (hG : ∀ x ∈ V, ∀ u v : E₄, G.inner x u v = nativePocketMetricCoefficient F g u v x)
    {x : E₄} (hx : x ∈ V) :
    curvDerivNorm 0 G x = curvDerivNorm 0 g (F x) := by
  let f : V → M := fun y => F y
  have hf : IsLocalDiffeomorph I₄ I ∞ f := fun y =>
    IsLocalDiffeomorphAt.comp I M (isLocalDiffeomorph_subtype_val (I := I₄) V y)
      (PartialDiffeomorph.isLocalDiffeomorphAt I₄ I ∞ F (hVS y.2))
  have hMetric : G.restrictOpen V = localPullMetric g f hf := by
    apply SmoothRiemannianMetric.ext_inner
    intro y u v
    rw [SmoothRiemannianMetric.restrictOpen_inner, localPullMetric_inner]
    have hd : mfderiv I₄ I f y = mfderiv I₄ I (F : E₄ → M) y.val := by
      apply DFunLike.ext
      intro w
      change mfderiv I₄ I ((F : E₄ → M) ∘ Subtype.val) y w = _
      have hVal := ((isLocalDiffeomorph_subtype_val (I := I₄) V) y).contMDiffAt.mdifferentiableAt (by simp)
      rw [mfderiv_comp_apply y ((F.contMDiffOn_toFun.contMDiffAt
        (F.open_source.mem_nhds (hVS y.2))).mdifferentiableAt (by simp)) hVal,
        mfderiv_subtype_val]
      rfl
    rw [hd]
    exact hG y y.2 u v
  let y : V := ⟨x, hx⟩
  calc
    curvDerivNorm 0 G x = curvDerivNorm 0 (G.restrictOpen V) y :=
      (curvDerivNorm_restrictOpen G V 0 y).symm
    _ = curvDerivNorm 0 g (F x) := by
      rw [hMetric, curvDerivNorm_localPullMetric]

open DifferentialGeometry.Tensor.Coordinates in
private theorem exists_nativePocketPath_euclideanCoefficient_bounds
    (F : PartialDiffeomorph I₄ I E₄ M ∞) (g R : SmoothRiemannianMetric I M)
    {R₀ : ℝ} (hR₀ : 0 ≤ R₀)
    (hBuffer : Metric.closedBall (0 : E₄) R₀ ⊆ F.source)
    (U : TopologicalSpace.Opens E₄) (hBU : Metric.closedBall (0 : E₄) R₀ ⊆ U)
    (hFlat : ∀ x ∈ U, ∀ v w : E₄, nativePocketMetricCoefficient F R v w x = inner ℝ v w)
    (hZero : ∀ v w : E₄, nativePocketMetricCoefficient F g v w 0 =
      nativePocketMetricCoefficient F R v w 0) :
    let b := chartModelBasis E₄
    ∃ C₀ C₁ C₂ : ℝ, 0 ≤ C₀ ∧ 0 ≤ C₁ ∧ 0 ≤ C₂ ∧
      ∀ (s : Icc (0 : ℝ) 1) {r : ℝ} (hr : 0 < r), r ≤ 1 →
      ∀ (hBound : 3 * r ≤ R₀) (x : E₄), x ∈ Metric.closedBall (0 : E₄) (3 * r) →
      ∀ i j,
        let hS := (Metric.closedBall_subset_closedBall hBound).trans hBuffer
        let X := nativePocketMetricCoefficient F (nativePocketPath F g R hr hS s) (b i) (b j)
        |X x| ≤ C₀ ∧ ‖fderiv ℝ X x‖ ≤ C₁ ∧ ‖fderiv ℝ (fderiv ℝ X) x‖ ≤ C₂ / r ∧
        (fderiv ℝ (nativePocketMetricCoefficient F g (b i) (b j)) 0 = 0 →
          ‖fderiv ℝ (fderiv ℝ X) x‖ ≤ C₂) := by
  intro b
  let J := Fin (Module.finrank ℝ E₄)
  have hEntry (k : J × J) :
      ∃ C : ℝ, 0 ≤ C ∧ ∀ (s : Icc (0 : ℝ) 1) {r : ℝ} (hr : 0 < r), r ≤ 1 →
      ∀ (hBound : 3 * r ≤ R₀) (x : E₄), x ∈ Metric.closedBall (0 : E₄) (3 * r) →
        let hS := (Metric.closedBall_subset_closedBall hBound).trans hBuffer
        let X := nativePocketMetricCoefficient F (nativePocketPath F g R hr hS s) (b k.1) (b k.2)
        |X x| ≤ C ∧ ‖fderiv ℝ X x‖ ≤ C ∧ ‖fderiv ℝ (fderiv ℝ X) x‖ ≤ C / r ∧
        (fderiv ℝ (nativePocketMetricCoefficient F g (b k.1) (b k.2)) 0 = 0 →
          ‖fderiv ℝ (fderiv ℝ X) x‖ ≤ C) := by
    let H := nativePocketMetricCoefficient F g (b k.1) (b k.2)
    let B := nativePocketMetricCoefficient F R (b k.1) (b k.2)
    let D := fun y => H y - B y
    have hD : ContDiffOn ℝ ∞ D F.source :=
      (contDiffOn_nativePocketMetricCoefficient F g _ _).sub
        (contDiffOn_nativePocketMetricCoefficient F R _ _)
    obtain ⟨A, hA, hTaylor⟩ := exists_nativePocketCoefficientTaylor F.open_source hR₀ hBuffer hD
      (sub_eq_zero.mpr (hZero _ _))
    obtain ⟨P, hP, hFirst⟩ := exists_nativePocketPath_nativeCoefficient_first_bounds
      F g R (b k.1) (b k.2) hR₀ hBuffer (hZero _ _)
    obtain ⟨Q, hQ, hSecond⟩ := exists_nativePocketPath_nativeCoefficient_hessian_bounds
      F g R (b k.1) (b k.2) hR₀ hBuffer (hZero _ _)
    let C := |inner ℝ (b k.1) (b k.2)| + 3 * A + P + Q
    refine ⟨C, by dsimp [C]; positivity, ?_⟩
    intro s r hr hr₁ hBound x hx hS X
    have hxB := Metric.closedBall_subset_closedBall hBound hx
    have hRef (y : E₄) (hy : y ∈ U) : B y = inner ℝ (b k.1) (b k.2) := hFlat y hy _ _
    have hEq (y : E₄) (hy : y ∈ U) :
        (fun z => X z - B z) =ᶠ[𝓝 y] (fun z => X z - inner ℝ (b k.1) (b k.2)) := by
      filter_upwards [U.isOpen.mem_nhds hy] with z hz
      rw [hRef z hz]
    have hD₁ : fderiv ℝ (fun z => X z - B z) x = fderiv ℝ X x := by
      rw [(hEq x (hBU hxB)).fderiv_eq, fderiv_sub_const]
    have hD₂ : fderiv ℝ (fderiv ℝ (fun z => X z - B z)) x = fderiv ℝ (fderiv ℝ X) x := by
      rw [(hEq x (hBU hxB)).fderiv.fderiv_eq]
      have hSub : fderiv ℝ (fun z => X z - inner ℝ (b k.1) (b k.2)) = fderiv ℝ X :=
        funext fun y => by rw [fderiv_sub_const]
      rw [hSub]
    have hCenter : fderiv ℝ D 0 = fderiv ℝ H 0 := by
      have h0U := hBU (Metric.mem_closedBall_self hR₀)
      have heq : D =ᶠ[𝓝 (0 : E₄)] (fun z => H z - inner ℝ (b k.1) (b k.2)) := by
        filter_upwards [U.isOpen.mem_nhds h0U] with z hz
        change H z - B z = _
        rw [hRef z hz]
      rw [heq.fderiv_eq, fderiv_sub_const]
    have hV : |X x| ≤ |inner ℝ (b k.1) (b k.2)| + 3 * A := by
      let t := (s : ℝ) * nativePocketCutoff r x
      have ht : t ∈ Icc (0 : ℝ) 1 := nativePocketWeight_mem_Icc s r x
      have hEq' := (nativePocketPath_nativeCoefficient_germ F g R hr hS s (b k.1) (b k.2)
        (hS hx)).eq_of_nhds
      change X x - B x = (1-t) * D x at hEq'
      rw [show X x = B x + (1-t) * D x by linarith only [hEq'], hRef x (hBU hxB)]
      calc
        _ ≤ |inner ℝ (b k.1) (b k.2)| + |(1-t) * D x| := abs_add_le _ _
        _ ≤ _ := by
          rw [abs_mul, abs_of_nonneg (sub_nonneg.mpr ht.2)]
          apply add_le_add_right
          have hnorm : ‖x‖ ≤ 3 := by
            have hnorm' : ‖x‖ ≤ 3 * r := by simpa only [Metric.mem_closedBall, dist_zero_right] using hx
            linarith only [hnorm', hr₁]
          calc
            (1-t) * |D x| ≤ |D x| := mul_le_of_le_one_left (abs_nonneg _) (by linarith only [ht.1])
            _ ≤ A * ‖x‖ := (hTaylor x hxB).1
            _ ≤ _ := (mul_le_mul_of_nonneg_left hnorm hA).trans_eq (by ring)
    have h₁ := (hFirst s hr hBound x hx).1
    have h₂ := hSecond s hr hr₁ hBound x hx
    change ‖fderiv ℝ (fun z => X z - B z) x‖ ≤ P at h₁
    change ‖fderiv ℝ (fderiv ℝ (fun z => X z - B z)) x‖ ≤ Q / r ∧
      (fderiv ℝ D 0 = 0 → ‖fderiv ℝ (fderiv ℝ (fun z => X z - B z)) x‖ ≤ Q) at h₂
    rw [hD₁] at h₁
    rw [hD₂, hCenter] at h₂
    have hQC : Q ≤ C := by dsimp [C]; linarith [abs_nonneg (inner ℝ (b k.1) (b k.2))]
    refine ⟨hV.trans (by dsimp [C]; linarith), h₁.trans ?_,
      h₂.1.trans (div_le_div_of_nonneg_right hQC hr.le), fun h => (h₂.2 h).trans hQC⟩
    dsimp [C]
    linarith [abs_nonneg (inner ℝ (b k.1) (b k.2))]
  choose C hC hCbound using hEntry
  let L := ∑ k, C k
  have hL : 0 ≤ L := Finset.sum_nonneg fun k _ => hC k
  refine ⟨L, L, L, hL, hL, hL, ?_⟩
  intro s r hr hr₁ hBound x hx i j
  have hLe : C (i,j) ≤ L := Finset.single_le_sum (fun k _ => hC k) (Finset.mem_univ (i,j))
  obtain ⟨h₀, h₁, h₂, h₃⟩ := hCbound (i,j) s hr hr₁ hBound x hx
  exact ⟨h₀.trans hLe, h₁.trans hLe, h₂.trans (div_le_div_of_nonneg_right hLe hr.le),
    fun h => (h₃ h).trans hLe⟩

private theorem nativePocket_model_basis_eq (x : E₄) :
    centeredChartTangentBasis (I := I₄) x = chartModelBasis E₄ := by
  apply DFunLike.ext
  intro i
  rw [centeredChartTangentBasis_apply, centeredChartTangentEquiv_symm_apply]
  rfl

private theorem nativePocket_model_chartInvGram (G : SmoothRiemannianMetric I₄ E₄) (x : E₄) :
    MetricInverseInBasis G x (chartModelBasis E₄) (fun i j => chartInvGramOnE G x i j x) := by
  have hMem : x ∈ (trivializationAt E₄ (TangentSpace I₄) x).baseSet := FiberBundle.mem_baseSet_trivializationAt' x
  have hb : chartBasisFamily (I := I₄) x hMem = chartModelBasis E₄ := by
    apply DFunLike.ext
    intro i
    rw [chartBasisFamily_apply]
    simp only [chartBasisVecFiber, TangentBundle.symmL_model_space]
    rfl
  have h := DifferentialGeometry.Geometry.Connection.chartInvGram_inverse G x hMem
  rw [hb] at h
  simpa only [chartInvGramOnE_def, extChartAt_model_space_eq_id, PartialEquiv.refl_symm,
    PartialEquiv.refl_coe, id_eq] using h

set_option backward.isDefEq.respectTransparency false in
set_option maxHeartbeats 800000 in
private theorem abs_nativePocket_model_chartInvGram_le (G : SmoothRiemannianMetric I₄ E₄)
    (x : E₄) {c : ℝ} (hc : 0 < c) (hLow : ∀ v : E₄, c * ‖v‖ ^ 2 ≤ G.inner x v v) (i j) :
    |chartInvGramOnE G x i j x| ≤
      c⁻¹ * (∑ k, ‖((chartModelBasis E₄).coord k).toContinuousLinearMap‖) ^ 2 := by
  let b : Module.Basis (Fin (Module.finrank ℝ E₄)) ℝ (TangentSpace I₄ x) := chartModelBasis E₄
  let L := ∑ k, ‖(b.coord k).toContinuousLinearMap‖
  have hL : 0 ≤ L := Finset.sum_nonneg fun k _ => norm_nonneg _
  have hCoord (k) : ‖(b.coord k).toContinuousLinearMap‖ ≤ L := by
    exact Finset.single_le_sum (f := fun j => ‖(b.coord j).toContinuousLinearMap‖)
      (fun j _ => norm_nonneg _) (Finset.mem_univ k)
  have hLow' (v : E₄) : c * ‖v‖ * ‖v‖ ≤ G.inner x v v := by
    simpa only [pow_two, mul_assoc] using hLow v
  have hCo : IsCoercive (G.inner x) := ⟨c, hc, hLow'⟩
  have hSharp :
      (tangentFlatEquiv (I := I₄) G x).symm (b.coord i) =
        IsCoercive.sharp hCo (b.coord i).toContinuousLinearMap := by
    apply (tangentFlatEquiv (I := I₄) G x).injective
    rw [(tangentFlatEquiv (I := I₄) G x).apply_symm_apply]
    ext v
    change b.coord i v = G.inner x (IsCoercive.sharp hCo (b.coord i).toContinuousLinearMap) v
    exact congrArg (fun η : TangentSpace I₄ x →L[ℝ] ℝ => η v)
      (IsCoercive.apply_sharp hCo (b.coord i).toContinuousLinearMap).symm
  have hInv := MetricInverseInBasis.unique G x b _ _
      (nativePocket_model_chartInvGram G x) (basisInvMetric_isInverse G x b)
  have hBound := IsCoercive.sharp_norm_le hCo hc hLow' (b.coord i).toContinuousLinearMap
  rw [congrFun (congrFun hInv i) j]
  calc
    |basisInvMetric G x b i j| =
        ‖(b.coord j).toContinuousLinearMap (IsCoercive.sharp hCo (b.coord i).toContinuousLinearMap)‖ := by
      rw [Real.norm_eq_abs, basisInvMetric, hSharp]
      rfl
    _ ≤ ‖(b.coord j).toContinuousLinearMap‖ *
        ‖IsCoercive.sharp hCo (b.coord i).toContinuousLinearMap‖ := ContinuousLinearMap.le_opNorm _ _
    _ ≤ L * (c⁻¹ * ‖(b.coord i).toContinuousLinearMap‖) :=
      mul_le_mul (hCoord j) hBound (norm_nonneg _) hL
    _ ≤ L * (c⁻¹ * L) :=
      mul_le_mul_of_nonneg_left (mul_le_mul_of_nonneg_left (hCoord i) (inv_nonneg.mpr hc.le)) hL
    _ = _ := by change L * (c⁻¹ * L) = c⁻¹ * L ^ 2; ring

private theorem nativePocket_secondPartial_eq (X : E₄ → ℝ) (hX : ContDiff ℝ ∞ X)
    (x : E₄) (m i : Fin (Module.finrank ℝ E₄)) :
    partialDeriv m (partialDeriv i X) x =
      fderiv ℝ (fderiv ℝ X) x (chartModelBasis E₄ m) (chartModelBasis E₄ i) := by
  unfold partialDeriv
  rw [fderiv_clm_apply
    ((hX.fderiv_right (m := ∞) (by simp)).differentiable (by simp) x)
    (differentiableAt_const (chartModelBasis E₄ i))]
  simp [ContinuousLinearMap.flip_apply]

private theorem nativePocket_jetRiemannBound_div (n : ℕ) {A B K r : ℝ}
    (hA : 0 ≤ A) (hK : 0 ≤ K) (hr : 0 < r) (hr₁ : r ≤ 1) :
    Analysis.jetRiemannBound n A (B / r) K ≤ Analysis.jetRiemannBound n A B K / r := by
  let P := Analysis.jetRiemannBound n A 0 K
  let Q := 6 * (n : ℝ) * K * B
  have hP : 0 ≤ P := by unfold P Analysis.jetRiemannBound; positivity
  have hEq (b : ℝ) : Analysis.jetRiemannBound n A b K = P + 6 * (n : ℝ) * K * b := by
    unfold P Analysis.jetRiemannBound
    ring
  rw [hEq (B/r), hEq B]
  apply (le_div_iff₀ hr).2
  have hP' : P * r ≤ P := mul_le_of_le_one_right hP hr₁
  calc
    (P + 6 * (n : ℝ) * K * (B / r)) * r = P * r + Q := by dsimp [Q]; field_simp [hr.ne']
    _ ≤ _ := add_le_add hP' (le_refl Q)

private theorem nativePocket_squareCurvature_eq (g : SmoothRiemannianMetric I M) (x : M) :
    (curvDerivNorm 0 g x) ^ 2 = normSq0S g x 4 (metricRm04At g x) := by
  rw [curvDerivNorm, curvDerivNormSq]
  change (Real.sqrt (normSq0S g x 4 (metricRm04At g x))) ^ 2 = _
  exact Real.sq_sqrt (normSq0S_nonneg _ _ _ _)

set_option maxHeartbeats 1300000 in
/-- Native zeroth matching gives the physical curvature-square bound
`D/r²` on the entire closed change ball. If the original native metric
also has vanishing first jet at the center, the same constant gives a
radius-independent bound. Both bounds hold for every oriented
orthonormal frame of the actual affine path. -/
theorem exists_nativePocketPath_frameTensorNormSq_bounds [BoundarylessManifold I M]
    (F : PartialDiffeomorph I₄ I E₄ M ∞) (g R : SmoothRiemannianMetric I M)
    {R₀ : ℝ} (hR₀ : 0 ≤ R₀)
    (hBuffer : Metric.closedBall (0 : E₄) R₀ ⊆ F.source)
    (U : TopologicalSpace.Opens E₄) (hBU : Metric.closedBall (0 : E₄) R₀ ⊆ U)
    (hFlat : ∀ x ∈ U, ∀ v w : E₄, nativePocketMetricCoefficient F R v w x = inner ℝ v w)
    (hZero : ∀ v w : E₄, nativePocketMetricCoefficient F g v w 0 =
      nativePocketMetricCoefficient F R v w 0) (o : ManifoldOrientation I M 4) :
    ∃ D : ℝ, 0 ≤ D ∧ ∀ (s : Icc (0 : ℝ) 1) {r : ℝ} (hr : 0 < r), r ≤ 1 →
      ∀ (hBound : 3 * r ≤ R₀) (y : M), y ∈ F '' Metric.closedBall (0 : E₄) (3 * r) →
      let hS := (Metric.closedBall_subset_closedBall hBound).trans hBuffer
      let P := nativePocketPath F g R hr hS s
      ∀ frame : OrientedOrthonormalFrameAt P o y,
        frameTensorNormSq (metricCurvatureFrameTensor P o y frame) ≤ D / r ^ 2 ∧
          ((∀ v w : E₄, fderiv ℝ (nativePocketMetricCoefficient F g v w) 0 = 0) →
            frameTensorNormSq (metricCurvatureFrameTensor P o y frame) ≤ D) := by
  let n := Module.finrank ℝ E₄
  let b := chartModelBasis E₄
  let L := ∑ i, ‖b i‖
  have hL : 0 ≤ L := Finset.sum_nonneg fun i _ => norm_nonneg _
  have hVec (i : Fin n) : ‖b i‖ ≤ L := by
    exact Finset.single_le_sum (f := fun j => ‖b j‖) (fun j _ => norm_nonneg _) (Finset.mem_univ i)
  obtain ⟨c, hc, hCo⟩ := exists_nativePocketPath_nativeCoefficient_coercive F g R hBuffer
  obtain ⟨C₀, C₁, C₂, hC₀, hC₁, hC₂, hJet⟩ :=
    exists_nativePocketPath_euclideanCoefficient_bounds F g R hR₀ hBuffer U hBU hFlat hZero
  let K := c⁻¹ * (∑ i, ‖(b.coord i).toContinuousLinearMap‖) ^ 2
  have hK : 0 ≤ K := by dsimp [K]; positivity
  let J := (n : ℝ) * (C₀ * Analysis.jetRiemannBound n (C₁ * L) (C₂ * L ^ 2) K)
  have hJ : 0 ≤ J := by unfold J Analysis.jetRiemannBound; positivity
  let D := (n : ℝ) ^ 4 * ((n : ℝ) ^ 4 * (K ^ 4 * J ^ 2))
  refine ⟨D, by unfold D; positivity, ?_⟩
  intro s r hr hr₁ hBound y hy hS P frame
  obtain ⟨x, hx, rfl⟩ := hy
  obtain ⟨G, V, hBV, hVS, hG⟩ := exists_nativePocketMetricLift F P (isCompact_closedBall _ _) hS
  have hxV := hBV hx
  have hLow (v : E₄) : c * ‖v‖ ^ 2 ≤ G.inner x v v := by
    rw [hG x hxV]
    exact hCo s hr hBound x hx v
  have hLift (i j : Fin n) :
      chartGramOnE G x i j =ᶠ[𝓝 x] nativePocketMetricCoefficient F P (b i) (b j) := by
    filter_upwards [V.isOpen.mem_nhds hxV] with z hz
    rw [selectedMarkedMetricLift_chartGram]
    exact hG z hz _ _
  have h0 (i j : Fin n) : |chartGramMatrix G x x i j| ≤ C₀ := by
    have hHere := (hLift i j).eq_of_nhds
    rw [chartGramOnE_def, extChartAt_model_space_eq_id, PartialEquiv.refl_symm,
      PartialEquiv.refl_coe, id_eq] at hHere
    rw [hHere]
    exact (hJet s hr hr₁ hBound x hx i j).1
  have h1 (m i j : Fin n) :
      |partialDeriv m (chartGramOnE G x i j) x| ≤ C₁ * L := by
    rw [partialDeriv, (hLift i j).fderiv_eq, ← Real.norm_eq_abs]
    exact (ContinuousLinearMap.le_of_opNorm_le _ (hJet s hr hr₁ hBound x hx i j).2.1 _).trans
      (mul_le_mul_of_nonneg_left (hVec m) hC₁)
  have h2 (B : ℝ) (hB : 0 ≤ B) (hBd : ∀ i j : Fin n,
      ‖fderiv ℝ (fderiv ℝ (nativePocketMetricCoefficient F P (b i) (b j))) x‖ ≤ B)
      (m k i j : Fin n) :
      |partialDeriv m (partialDeriv k (chartGramOnE G x i j)) x| ≤ B * L ^ 2 := by
    rw [nativePocket_secondPartial_eq _ (contDiff_selectedMarkedMetricLift_chartGram G x i j),
      (hLift i j).fderiv.fderiv_eq, ← Real.norm_eq_abs]
    calc
      _ ≤ (B * ‖b m‖) * ‖b k‖ :=
        (ContinuousLinearMap.le_opNorm _ _).trans (mul_le_mul_of_nonneg_right
          (ContinuousLinearMap.le_of_opNorm_le _ (hBd i j) _) (norm_nonneg _))
      _ ≤ (B * L) * L := mul_le_mul
        (mul_le_mul_of_nonneg_left (hVec m) hB) (hVec k) (norm_nonneg _) (by positivity)
      _ = _ := by ring
  have hInv (i j : Fin n) : |chartInvGramOnE G x i j x| ≤ K :=
    abs_nativePocket_model_chartInvGram_le G x hc hLow i j
  have hCoordinate (B : ℝ) (hB : 0 ≤ B) (hBd : ∀ i j : Fin n,
      ‖fderiv ℝ (fderiv ℝ (nativePocketMetricCoefficient F P (b i) (b j))) x‖ ≤ B)
      (i j k l : Fin n) := by
    have hBound' := abs_metricRm04StandardAt_centeredChartBasis_le_of_jetBounds G x
      hC₀ (mul_nonneg hC₁ hL) hK h0
      (by simpa only [extChartAt_model_space_eq_id, PartialEquiv.refl_coe, id_eq] using h1)
      (by simpa only [extChartAt_model_space_eq_id, PartialEquiv.refl_coe, id_eq] using h2 B hB hBd)
      (by simpa only [extChartAt_model_space_eq_id, PartialEquiv.refl_coe, id_eq] using hInv)
      i j k l
    exact hBound'
  have hNorm := nativePocketMetricLift_curvDerivNorm F P G V hVS hG hxV
  have hSquare (A : ℝ) (hA : 0 ≤ A) (hComp : ∀ i j k l : Fin n,
      |metricRm04StandardAt G x (centeredChartTangentBasis x i) (centeredChartTangentBasis x j)
        (centeredChartTangentBasis x k) (centeredChartTangentBasis x l)| ≤ A) :
      frameTensorNormSq (metricCurvatureFrameTensor P o (F x) frame) ≤
        (n : ℝ) ^ 4 * ((n : ℝ) ^ 4 * (K ^ 4 * A ^ 2)) := by
    have hI : MetricInverseInBasis G x (centeredChartTangentBasis x)
        (fun i j => chartInvGramOnE G x i j (extChartAt I₄ x x)) := by
      rw [nativePocket_model_basis_eq]
      simpa only [extChartAt_model_space_eq_id, PartialEquiv.refl_coe, id_eq] using
        nativePocket_model_chartInvGram G x
    have hCurv := curvDerivNorm_zero_le_of_centralChart_component_bounds G x hK hA hI
      (by simpa only [extChartAt_model_space_eq_id, PartialEquiv.refl_coe, id_eq] using hInv) hComp
    have hSq := (Real.sqrt_le_iff.mp hCurv).2
    rw [Real.sq_sqrt (by positivity)] at hSq
    rw [← normSq0S_rm04_eq_frameTensorNormSq, ← nativePocket_squareCurvature_eq, ← hNorm,
      nativePocket_squareCurvature_eq]
    exact hSq
  refine ⟨?_, ?_⟩
  · have hBase := hCoordinate (C₂ / r) (by positivity)
      (fun i j => (hJet s hr hr₁ hBound x hx i j).2.2.1)
    have hComp (i j k l : Fin n) :
        |metricRm04StandardAt G x (centeredChartTangentBasis x i) (centeredChartTangentBasis x j)
          (centeredChartTangentBasis x k) (centeredChartTangentBasis x l)| ≤ J / r := by
      refine (hBase i j k l).trans ?_
      have hb := nativePocket_jetRiemannBound_div n (mul_nonneg hC₁ hL) hK hr hr₁
        (B := C₂ * L ^ 2)
      calc
        _ = (n : ℝ) * (C₀ * Analysis.jetRiemannBound n (C₁ * L) ((C₂ * L ^ 2) / r) K) := by
          rw [show C₂ / r * L ^ 2 = (C₂ * L ^ 2) / r by ring]
        _ ≤ (n : ℝ) * (C₀ * (Analysis.jetRiemannBound n (C₁ * L) (C₂ * L ^ 2) K / r)) :=
          mul_le_mul_of_nonneg_left (mul_le_mul_of_nonneg_left hb hC₀) (Nat.cast_nonneg _)
        _ = J / r := by unfold J; ring
    refine (hSquare (J / r) (by positivity) hComp).trans_eq ?_
    unfold D
    ring
  · intro hFirst
    exact hSquare J hJ (hCoordinate C₂ hC₂ (fun i j => (hJet s hr hr₁ hBound x hx i j).2.2.2
      (hFirst (b i) (b j))))


end

end SmoothPoincare
