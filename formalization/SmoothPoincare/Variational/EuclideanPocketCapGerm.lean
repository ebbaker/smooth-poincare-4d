import SmoothPoincare.Variational.TransportedDiskCaps
import Mathlib.Analysis.InnerProductSpace.Calculus
import Mathlib.Analysis.SpecialFunctions.Log.Deriv

/-! # The conformal cap germ of the actual Euclidean pocket -/

noncomputable section

open DifferentialGeometry Filter FirstOrderTwistor Set
open scoped ContDiff Manifold Topology InnerProductSpace

namespace SmoothPoincare

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "I₄" => 𝓘(ℝ, E₄)
local notation "S₄" => StandardFourSphere
local instance : Fact (Module.finrank ℝ (EuclideanSpace ℝ (Fin 5)) = 4 + 1) := ⟨by simp⟩

/-- The radius-two round density, pulled back under expansion by `2 / b`. -/
def transportedPocketRoundDensity (b : ℝ) (z : E₄) : ℝ :=
  16 * (2 / b) ^ 2 / (4 + ‖(2 / b) • z‖ ^ 2) ^ 2

theorem transportedPocketRoundDensity_pos {b : ℝ} (hb : 0 < b) (z : E₄) :
    0 < transportedPocketRoundDensity b z := by
  unfold transportedPocketRoundDensity
  positivity

private theorem transportedPocketRoundDensity_log_smooth {b : ℝ} (hb : 0 < b) :
    ContDiff ℝ ∞ (fun z : E₄ => Real.log (transportedPocketRoundDensity b z)) := by
  have hLinear : ContDiff ℝ ∞ (fun z : E₄ => (2 / b) • z) := by fun_prop
  have hNorm := (contDiff_norm_sq ℝ).comp hLinear
  have h : ContDiff ℝ ∞ (transportedPocketRoundDensity b) :=
    contDiff_const.div ((contDiff_const.add hNorm).pow 2)
      (fun z => ne_of_gt (by positivity : 0 < (4 + ‖(2 / b) • z‖ ^ 2) ^ 2))
  exact h.log (fun z => (transportedPocketRoundDensity_pos hb z).ne')

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]

omit [T2Space M] in
/-- A forward Euclidean chart identity gives the corresponding inverse
metric formula throughout the actual pocket image. -/
theorem euclideanPocket_inverseMetric_of_forward
    (flat : SmoothRiemannianMetric I M) (F : PartialDiffeomorph I₄ I E₄ M ∞)
    {U : Set E₄} (hUF : U ⊆ F.source)
    (hFlat : ∀ z ∈ U, ∀ v w : E₄,
      flat.inner (F z) (mfderiv I₄ I F z v) (mfderiv I₄ I F z w) = @inner ℝ E₄ _ v w) :
    ∀ p ∈ F '' U, ∀ v w : TangentSpace I p,
      flat.inner p v w =
        @inner ℝ E₄ _ (mfderiv I I₄ F.symm p v) (mfderiv I I₄ F.symm p w) := by
  rintro _ ⟨z, hz, rfl⟩ v w
  have hzF : z ∈ F.source := hUF hz
  have hTarget : F z ∈ F.target := F.map_source' hzF
  have hInv : F.symm (F z) = z := F.left_inv' hzF
  have hForward : MDifferentiableAt I₄ I (F : E₄ → M) (F.symm (F z)) :=
    (F.contMDiffOn_toFun.contMDiffAt (F.open_source.mem_nhds (hInv.symm ▸ hzF))).mdifferentiableAt (by simp)
  have hInverse : MDifferentiableAt I I₄ (F.symm : M → E₄) (F z) :=
    (F.contMDiffOn_invFun.contMDiffAt (F.open_target.mem_nhds hTarget)).mdifferentiableAt (by simp)
  have hGerm : ((F : E₄ → M) ∘ (F.symm : M → E₄)) =ᶠ[𝓝 (F z)] id := by
    filter_upwards [F.open_target.mem_nhds hTarget] with p hp
    exact F.right_inv' hp
  have hDeriv : (mfderiv I₄ I (F : E₄ → M) (F.symm (F z))).comp
      (mfderiv I I₄ (F.symm : M → E₄) (F z)) =
      ContinuousLinearMap.id ℝ (TangentSpace I (F z)) := by
    rw [← mfderiv_comp (F z) hForward hInverse, hGerm.mfderiv_eq, mfderiv_id]
    rfl
  rw [hInv] at hDeriv
  have hD (v : TangentSpace I (F z)) :
      mfderiv I₄ I F z (mfderiv I I₄ F.symm (F z) v) = v :=
    DFunLike.congr_fun hDeriv v
  have h := hFlat z hz (mfderiv I I₄ F.symm (F z) v) (mfderiv I I₄ F.symm (F z) w)
  rwa [hD v, hD w] at h

/-- Convert the actual two coordinate metric identities into a local
conformal log factor on an open neighborhood of the entire retained disk.
The Euclidean input is written using the inverse physical chart. -/
theorem euclideanPocket_localCapConformalGerm
    (flat : SmoothRiemannianMetric I M)
    (F : PartialDiffeomorph I₄ I E₄ M ∞)
    (hF : Metric.closedBall (0 : E₄) 1 ⊆ F.source)
    (φ : M ≃ₘ⟮I, I⟯ M) {b : ℝ} (hb : 0 < b) (hb1 : b ≤ 1)
    (hImage : φ '' selectedChartDisk F = F '' Metric.closedBall 0 b)
    (u : C^∞⟮I, M; ℝ⟯)
    {U : Set E₄} (hU : IsOpen U) (hBall : Metric.closedBall 0 b ⊆ U) (hUF : U ⊆ F.source)
    (hFlat : ∀ p ∈ F '' U, ∀ v w : TangentSpace I p,
      flat.inner p v w =
        @inner ℝ E₄ _ (mfderiv I I₄ F.symm p v) (mfderiv I I₄ F.symm p w))
    (hRound :
      let C := transportedCapPocketChart b hb
      ∀ z ∈ U, ∀ v w : TangentSpace I₄ z,
        standardRoundFourMetric.inner (C.symm z)
          (mfderiv I₄ I₄ C.symm z v) (mfderiv I₄ I₄ C.symm z w) =
        transportedPocketRoundDensity b z * @inner ℝ E₄ _ v w) :
    ∃ W : Set S₄, IsOpen W ∧ standardFourSphereCap ⊆ W ∧
      ∃ uLocal : S₄ → ℝ, ContMDiffOn I₄ 𝓘(ℝ) ∞ uLocal W ∧
        let A := (transportedDiskCore F hF φ hb hb1 hImage).core
        let q := Diffeomorph.pullbackMetricCross (DifferentialGeometry.conformalMetric flat u) φ
        ∀ x ∈ selectedChartDisk F, ∀ᶠ y in 𝓝 x, ∀ v w : TangentSpace I y,
          q.inner y v w = Real.exp (2 * uLocal (A y)) *
            standardRoundFourMetric.inner (A y) (mfderiv I I₄ A y v) (mfderiv I I₄ A y w) := by
  let C := transportedCapPocketChart b hb
  let A := (transportedDiskCore F hF φ hb hb1 hImage).core
  let W : Set S₄ := C.source ∩ C ⁻¹' U
  let uLocal : S₄ → ℝ := fun p =>
    u (F (C p)) - Real.log (transportedPocketRoundDensity b (C p)) / 2
  have hW : IsOpen W := C.contMDiffOn_toFun.continuousOn.isOpen_inter_preimage C.open_source hU
  have hCapW : standardFourSphereCap ⊆ W := by
    intro p hp
    constructor
    · dsimp [C]
      rw [transportedCapPocketChart_source]
      exact transportedCapStereographic_cap_in_source hp
    · have hz := mem_image_of_mem C hp
      change C p ∈ C '' standardFourSphereCap at hz
      rw [transportedCapPocketChart_image_cap] at hz
      exact hBall hz
  have hCW : ContMDiffOn I₄ I₄ ∞ C W := C.contMDiffOn_toFun.mono inter_subset_left
  have hFComp : ContMDiffOn I₄ I ∞ ((F : E₄ → M) ∘ C) W :=
    F.contMDiffOn_toFun.comp hCW (fun p hp => hUF hp.2)
  have hInput : ContMDiffOn I₄ 𝓘(ℝ) ∞ (fun p => u (F (C p))) W :=
    (u.contMDiff.contMDiffOn (s := univ)).comp hFComp (fun _ _ => mem_univ _)
  have hLog : ContMDiffOn I₄ 𝓘(ℝ) ∞ (fun p => Real.log (transportedPocketRoundDensity b (C p))) W :=
    ((transportedPocketRoundDensity_log_smooth hb).contMDiff.contMDiffOn (s := univ)).comp hCW
      (fun _ _ => mem_univ _)
  have hULocal : ContMDiffOn I₄ 𝓘(ℝ) ∞ uLocal W := hInput.sub (hLog.div_const 2)
  refine ⟨W, hW, hCapW, uLocal, hULocal, ?_⟩
  dsimp only
  intro x hx
  have hPhiImage : φ x ∈ F '' Metric.closedBall (0 : E₄) b := hImage ▸ mem_image_of_mem φ hx
  obtain ⟨z₀, hz₀, hFz₀⟩ := hPhiImage
  have hz₀F : z₀ ∈ F.source := hUF (hBall hz₀)
  have hxF : φ x ∈ F.target := hFz₀ ▸ F.map_source' hz₀F
  have hInv : F.symm (φ x) = z₀ := by
    rw [← hFz₀]
    exact F.left_inv' hz₀F
  have hxU : F.symm (φ x) ∈ U := hInv.symm ▸ hBall hz₀
  have hNearF : ∀ᶠ y in 𝓝 x, φ y ∈ F.target :=
    φ.continuous.continuousAt.tendsto.eventually (F.open_target.mem_nhds hxF)
  have hInvCont : ContinuousAt (fun y => F.symm (φ y)) x :=
    (F.contMDiffOn_invFun.contMDiffAt (F.open_target.mem_nhds hxF)).continuousAt.comp φ.continuous.continuousAt
  have hNearU : ∀ᶠ y in 𝓝 x, F.symm (φ y) ∈ U := hInvCont.tendsto.eventually (hU.mem_nhds hxU)
  filter_upwards [hNearF, hNearU] with y hyF hyU
  intro v w
  let z := F.symm (φ y)
  have hz : z ∈ U := hyU
  have hFz : F z = φ y := F.right_inv' hyF
  have hzC : z ∈ C.target := by
    change z ∈ (transportedCapPocketChart b hb).target
    rw [transportedCapPocketChart_target]
    trivial
  have hCz : C (C.symm z) = z := C.right_inv' hzC
  have hDiffC : MDifferentiableAt I₄ I₄ (C.symm : E₄ → S₄) z :=
    (C.contMDiffOn_invFun.contMDiffAt (C.open_target.mem_nhds hzC)).mdifferentiableAt (by simp)
  have hDiffF : MDifferentiableAt I I₄ (F.symm : M → E₄) (φ y) :=
    (F.contMDiffOn_invFun.contMDiffAt (F.open_target.mem_nhds hyF)).mdifferentiableAt (by simp)
  have hDiffPhi := φ.contMDiff.mdifferentiableAt (x := y) (by simp)
  have hD (a : TangentSpace I y) : mfderiv I I₄ A y a =
      mfderiv I₄ I₄ C.symm z (mfderiv I I₄ F.symm (φ y) (mfderiv I I φ y a)) := by
    change mfderiv I I₄ ((C.symm : E₄ → S₄) ∘ ((F.symm : M → E₄) ∘ (φ : M → M))) y a = _
    rw [mfderiv_comp y hDiffC (hDiffF.comp y hDiffPhi), mfderiv_comp y hDiffF hDiffPhi]
    rfl
  have hCf : uLocal (A y) = u (φ y) - Real.log (transportedPocketRoundDensity b z) / 2 := by
    change u (F (C (C.symm z))) - Real.log (transportedPocketRoundDensity b (C (C.symm z))) / 2 = _
    rw [hCz, hFz]
  have hExp : Real.exp (2 * uLocal (A y)) * transportedPocketRoundDensity b z =
      Real.exp (2 * u (φ y)) := by
    rw [hCf, show 2 * (u (φ y) - Real.log (transportedPocketRoundDensity b z) / 2) =
      2 * u (φ y) - Real.log (transportedPocketRoundDensity b z) by ring,
      Real.exp_sub, Real.exp_log (transportedPocketRoundDensity_pos hb z)]
    exact div_mul_cancel₀ _ (transportedPocketRoundDensity_pos hb z).ne'
  change (Diffeomorph.pullbackMetricCross (DifferentialGeometry.conformalMetric flat u) φ).inner y v w =
    Real.exp (2 * uLocal (A y)) * standardRoundFourMetric.inner (C.symm z)
      (mfderiv I I₄ A y v) (mfderiv I I₄ A y w)
  rw [Diffeomorph.pullbackMetricCross_inner, DifferentialGeometry.conformalMetric_inner,
    hFlat (φ y) ⟨z, hz, hFz⟩, hD v, hD w, hRound z hz, ← mul_assoc, hExp]

end SmoothPoincare
