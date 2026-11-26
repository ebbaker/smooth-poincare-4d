import SmoothPoincare.Variational.NativePocketFlattening
import DifferentialGeometry.Geometry.Metric.LinearAlgebra.QuadraticForm.MetricSignature
import DifferentialGeometry.Topology.Manifold.OrientationDiffeomorphTransport
import DifferentialGeometry.Topology.Manifold.RelativeCollarIsotopy

/-! # Center-value normalization inside the same marked disk -/

open DifferentialGeometry DifferentialGeometry.Geometry DifferentialGeometry.QuadraticForm
open Filter Manifold Metric Set
open scoped ContDiff Manifold Topology

namespace SmoothPoincare

noncomputable section

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "I₄" => 𝓘(ℝ, E₄)

/-- Take the positive inverse square root of the center Gram operator. -/
private theorem exists_positive_center_normalizer (B : E₄ →L[ℝ] E₄ →L[ℝ] ℝ)
    (hSymm : ∀ v w, B v w = B w v) (hPos : ∀ v, v ≠ 0 → 0 < B v v) :
    ∃ A : E₄ →L[ℝ] E₄,
      (∀ v, v ≠ 0 → 0 < inner ℝ (A v) v) ∧
      ∀ v w, B (A v) (A w) = inner ℝ v w := by
  let T := rieszFlat B
  let hT := isSymmetric_rieszFlat B hSymm
  have hDim : Module.finrank ℝ E₄ = 4 := by simp
  let b := hT.eigenvectorBasis hDim
  let eigenvalue := hT.eigenvalues hDim
  have hEigen (i : Fin 4) : 0 < eigenvalue i := by
    have hi := hPos (b i) (b.toBasis.ne_zero i)
    rw [← inner_rieszFlat] at hi
    change 0 < inner ℝ (T.toLinearMap (b i)) (b i) at hi
    rw [hT.apply_eigenvectorBasis hDim i] at hi
    simpa [eigenvalue, show hT.eigenvectorBasis hDim = b from rfl,
      real_inner_smul_left, real_inner_self_eq_norm_sq, b.orthonormal.1 i,
      one_pow, mul_one] using hi
  let c : Fin 4 → ℝ := fun i => (Real.sqrt (eigenvalue i))⁻¹
  let diag := Matrix.toEuclideanLin (Matrix.diagonal c)
  let A := (b.repr.symm.toLinearEquiv.toLinearMap.comp
    (diag.comp b.repr.toLinearEquiv.toLinearMap)).toContinuousLinearMap
  have hA (v : E₄) (i : Fin 4) : b.repr (A v) i = c i * b.repr v i := by
    change b.repr (b.repr.symm (diag (b.repr v))) i = _
    rw [b.repr.apply_symm_apply]
    simp [diag, Matrix.toLpLin_apply, Matrix.mulVec_diagonal]
  have hInner (v w : E₄) :
      inner ℝ v w = ∑ i : Fin 4, b.repr v i * b.repr w i := by
    rw [← b.repr.inner_map_map v w, PiLp.inner_apply]
    simp only [RCLike.inner_apply, RCLike.conj_to_real, mul_comm]
  refine ⟨A, ?_, ?_⟩
  · intro v hv
    rw [hInner]
    have hCoord : ∃ i, b.repr v i ≠ 0 := by
      by_contra! h
      apply hv
      apply b.repr.injective
      rw [map_zero]
      ext i
      exact h i
    obtain ⟨i, hi⟩ := hCoord
    simp only [hA]
    apply Finset.sum_pos' (fun j _ => ?_) (⟨i, Finset.mem_univ i, ?_⟩)
    · rw [mul_assoc, ← sq]
      exact mul_pos (inv_pos.mpr (Real.sqrt_pos.mpr (hEigen i))) (sq_pos_of_ne_zero hi)
    · rw [mul_assoc, ← sq]
      exact mul_nonneg (inv_nonneg.mpr (Real.sqrt_nonneg _)) (sq_nonneg _)
  · intro v w
    rw [← inner_rieszFlat, hInner, hInner]
    apply Finset.sum_congr rfl
    intro i _
    have hTv : b.repr (rieszFlat B (A v)) i = eigenvalue i * b.repr (A v) i :=
      hT.eigenvectorBasis_apply_self_apply hDim (A v) i
    rw [hTv, hA, hA]
    have hc : eigenvalue i * c i * c i = 1 := by
      dsimp only [c]
      have hs := (Real.sqrt_pos.mpr (hEigen i)).ne'
      field_simp
      nlinarith only [Real.sq_sqrt (hEigen i).le]
    calc
      eigenvalue i * (c i * b.repr v i) * (c i * b.repr w i) =
          (eigenvalue i * c i * c i) * (b.repr v i * b.repr w i) := by ring
      _ = _ := by rw [hc, one_mul]

/-- A positive linear map near the center extends to a smooth diffeomorphism
with both directions fixed away from a compact subset of any prescribed
small open ball. -/
private theorem exists_supported_center_linear_change (A : E₄ →L[ℝ] E₄)
    (hA : ∀ v, v ≠ 0 → 0 < inner ℝ (A v) v) {r : ℝ} (hr : 0 < r) :
    ∃ (J : E₄ ≃ₘ^∞⟮I₄,I₄⟯ E₄) (K : Set E₄), IsCompact K ∧ K ⊆ ball 0 r ∧
      J 0 = 0 ∧ (J : E₄ → E₄) =ᶠ[𝓝 0] A ∧
      (∀ x ∉ K, J x = x ∧ J.symm x = x) := by
  have hInj (t : ℝ) (ht : t ∈ Icc (0 : ℝ) 1) :
      Function.Injective ((1 - t) • ContinuousLinearMap.id ℝ E₄ + t • A) := by
    apply LinearMap.ker_eq_bot.mp
    rw [LinearMap.ker_eq_bot']
    intro v hv
    by_contra hne
    change (1 - t) • v + t • A v = 0 at hv
    have hp := congrArg (fun w : E₄ => inner ℝ w v) hv
    simp only [inner_add_left, real_inner_smul_left, inner_zero_left] at hp
    have hI := real_inner_self_pos.mpr hne
    by_cases ht0 : t = 0
    · exact hne (by simpa [ht0] using hv)
    · exact (ne_of_gt (add_pos_of_nonneg_of_pos
        (mul_nonneg (sub_nonneg.mpr ht.2) hI.le)
        (mul_pos (lt_of_le_of_ne ht.1 (Ne.symm ht0)) (hA v hne)))) hp
  obtain ⟨V, hV, h0V, _, J, _, _, _, hTrack, hFixed, _, K, hK, hKr, hOut⟩ :=
    Diffeomorph.exists_contDiff_compact_isotopy_eqOn_of_injective_convex_combination_preserving_linear_map
      (W := univ) (F := A) isOpen_univ A.contDiff.contDiffOn
      (0 : E₄ →L[ℝ] E₄) (by simp) (S := {0}) (K := {0})
      (by rintro x ⟨hx, _⟩; simp [mem_singleton_iff.mp hx]) isCompact_singleton
      (by simp) (fun x _ t ht => by rw [A.fderiv]; exact hInj t ht)
      (O := ball 0 r) isOpen_ball (singleton_subset_iff.mpr (mem_ball_self hr))
  refine ⟨J 1, K, hK, hKr, (hFixed 1).1 (mem_singleton 0), ?_, ?_⟩
  · filter_upwards [hV.mem_nhds (h0V (mem_singleton 0))] with x hx
    simpa using hTrack 1 (by constructor <;> norm_num) x hx
  · exact fun x hx => ⟨(hOut 1).1 hx, (hOut 1).2 hx⟩

variable {H M : Type*} [TopologicalSpace H] [TopologicalSpace M] [ChartedSpace H M]
  {I : ModelWithCorners ℝ E₄ H} [IsManifold I ∞ M]

/-- Normalize the actual incoming center Gram to the Euclidean metric by
precomposing the original marking. The closed unit disk has the same
image, the chart source is the same, and the original outside forward and
inverse maps are fixed. Both angular and normal data on a rim neighborhood
therefore use the original chart. -/
theorem exists_nativePocketCenter_normalizedChart
    (g : SmoothRiemannianMetric I M) (F : PartialDiffeomorph I₄ I E₄ M ∞)
    (hDisk : closedBall (0 : E₄) 1 ⊆ F.source) {r : ℝ} (hr : 0 < r) (hrim : r < 1) :
    ∃ (J : E₄ ≃ₘ^∞⟮I₄,I₄⟯ E₄) (F' : PartialDiffeomorph I₄ I E₄ M ∞),
      F' = J.toPartialDiffeomorph.trans F ∧ F'.source = F.source ∧
      F' '' closedBall (0 : E₄) 1 = F '' closedBall (0 : E₄) 1 ∧
      (∀ o : ManifoldOrientation I₄ E₄ 4, J.preservesOrientation o o) ∧
      (∀ x ∉ ball (0 : E₄) r, J x = x ∧ J.symm x = x) ∧
      F' 0 = F 0 ∧ ∀ v w : E₄,
        g.inner (F' 0) (mfderiv I₄ I (F' : E₄ → M) 0 v)
          (mfderiv I₄ I (F' : E₄ → M) 0 w) = inner ℝ v w := by
  let B := pullbackMetricCoefficients g (F : E₄ → M) 0
  have h0 : (0 : E₄) ∈ F.source := hDisk (mem_closedBall_self zero_le_one)
  have hInj : Function.Injective (mfderiv I₄ I (F : E₄ → M) 0) :=
    ((F.isLocalDiffeomorphAt I₄ I ∞ h0).mfderivToContinuousLinearEquiv
      (by decide)).injective
  obtain ⟨A, hA, hMatch⟩ := exists_positive_center_normalizer B
    (fun v w => g.symm (F 0) _ _) (fun v hv => pullbackMetricCoefficients_pos g hInj hv)
  obtain ⟨J, K, hK, hKr, hJ0, hJA, hFixK⟩ := exists_supported_center_linear_change A hA hr
  have hFix : ∀ x ∉ ball (0 : E₄) r, J x = x ∧ J.symm x = x :=
    fun x hx => hFixK x (fun hxK => hx (hKr hxK))
  have hMem (S : Set E₄) (hS : ball (0 : E₄) r ⊆ S) (x : E₄) : J x ∈ S ↔ x ∈ S := by
    constructor
    · intro hx
      by_contra hx'
      exact hx' ((hFix x (fun hm => hx' (hS hm))).1 ▸ hx)
    · intro hx
      by_contra hx'
      have hh := (hFix (J x) (fun hm => hx' (hS hm))).2
      rw [J.symm_apply_apply] at hh
      exact hx' (hh ▸ hx)
  have hsmall : ball (0 : E₄) r ⊆ closedBall (0 : E₄) 1 :=
    ball_subset_ball hrim.le |>.trans ball_subset_closedBall
  let F' := J.toPartialDiffeomorph.trans F
  have hsource : F'.source = F.source := by
    ext x
    change x ∈ univ ∩ J ⁻¹' F.source ↔ x ∈ F.source
    simp only [univ_inter, mem_preimage]
    exact hMem F.source (hsmall.trans hDisk) x
  have hImage : J '' closedBall (0 : E₄) 1 = closedBall (0 : E₄) 1 := by
    ext x
    refine ⟨?_, ?_⟩
    · rintro ⟨y, hy, rfl⟩
      exact (hMem _ hsmall _).mpr hy
    · intro hx
      exact ⟨J.symm x, (hMem _ hsmall _).mp (by simpa using hx), J.apply_symm_apply x⟩
  refine ⟨J, F', rfl, hsource, ?_, ?_, hFix, ?_, ?_⟩
  · change (fun x => F (J x)) '' closedBall (0 : E₄) 1 = _
    rw [← image_image (F : E₄ → M) J, hImage]
  · intro o
    let z : E₄ := EuclideanSpace.single 0 1
    have hz : ‖z‖ = 1 := by simp [z, PiLp.norm_single]
    have hzK : z ∉ K := by
      intro hm
      have := mem_ball_zero_iff.mp (hKr hm)
      linarith
    have hNear : (J : E₄ → E₄) =ᶠ[𝓝 z] id := by
      filter_upwards [hK.isClosed.isOpen_compl.mem_nhds hzK] with x hx
      exact (hFixK x hx).1
    apply J.preservesOrientation_of_eq_at o o z
    have hD : (J.mfderivToContinuousLinearEquiv (by simp) z).toLinearEquiv =
        LinearEquiv.refl ℝ (TangentSpace I₄ z) := by
      ext v
      change mfderiv I₄ I₄ (J : E₄ → E₄) z v = v
      rw [hNear.mfderiv_eq, mfderiv_id]
      rfl
    rw [hD, hNear.eq_of_nhds, Orientation.map_refl]
    rfl
  · change F (J 0) = F 0
    rw [hJ0]
  · intro v w
    have hJderiv : mfderiv I₄ I₄ (J : E₄ → E₄) 0 = A :=
      mfderiv_eq_fderiv.trans (hJA.fderiv_eq.trans A.fderiv)
    have hFdiff := ((F.contMDiffOn 0 h0).contMDiffAt (F.open_source.mem_nhds h0)).mdifferentiableAt
      (by simp)
    have hChain : mfderiv I₄ I (F' : E₄ → M) 0 =
        (mfderiv I₄ I (F : E₄ → M) 0).comp A := by
      change mfderiv I₄ I ((F : E₄ → M) ∘ (J : E₄ → E₄)) 0 = _
      rw [mfderiv_comp 0 (hJ0.symm ▸ hFdiff) (J.mdifferentiable (by simp) 0), hJ0, hJderiv]
      rfl
    change g.inner (F (J 0)) _ _ = _
    rw [hJ0, hChain]
    exact hMatch v w

end

end SmoothPoincare
