import SmoothPoincare.Variational.BourStationaryW26
import DifferentialGeometry.Analysis.Sobolev.Euclidean.Embedding.Morrey.HigherOrder
import Mathlib.Analysis.Calculus.ContDiff.Bounds

/-!
# Interior Morrey bounds on a Bour harmonic four-ball

26 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance.
Actual serving settings unavailable. Edition 06, E51, Route 13.
-/

set_option autoImplicit false

noncomputable section

open Bundle FirstOrderTwistor DifferentialGeometry DifferentialGeometry.Analysis
open DifferentialGeometry.Analysis.Sobolev.EuclideanMorrey
open DifferentialGeometry.Geometry.Riemannian DifferentialGeometry.Geometry.Curvature
open DifferentialGeometry.Geometry.Operator DifferentialGeometry.Tensor.Coordinates
open Manifold MeasureTheory Filter Set
open scoped BigOperators ContDiff ENNReal Laplacian Manifold NNReal Topology

namespace SmoothPoincare

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "Dᵏ" => iteratedFDeriv ℝ

/-- The same Haar normalization factor multiplies all three terms of the
physical scalar norm under passage to the pinned Euclidean volume. -/
theorem bourW26Norm_volume_eq (μ : Measure E₄) [Measure.IsAddHaarMeasure μ]
    (S : Set E₄) (u : E₄ → ℝ) :
    bourW26Norm ((volume : Measure E₄).restrict S) u =
      ((volume : Measure E₄).addHaarScalarFactor μ : ℝ≥0∞) ^ ((6 : ℝ≥0∞).toReal⁻¹) *
        bourW26Norm (μ.restrict S) u := by
  let c : ℝ≥0∞ := (volume : Measure E₄).addHaarScalarFactor μ
  have hc : c ≠ 0 := ENNReal.coe_ne_zero.mpr
    (Measure.addHaarScalarFactor_pos_of_isAddHaarMeasure volume μ).ne'
  have hV := Measure.isAddLeftInvariant_eq_smul (volume : Measure E₄) μ
  have hRestrict : (volume : Measure E₄).restrict S = c • μ.restrict S := by
    rw [hV, Measure.restrict_smul]
    simp only [ENNReal.smul_def, c]
  unfold bourW26Norm
  rw [hRestrict]
  simp only [eLpNorm_smul_measure_of_ne_zero hc, smul_eq_mul, one_div, ENNReal.toReal_inv, mul_add, c]

private theorem cutoff_deriv_norm_uniform {r : ℝ} (hr : 0 < r) :
    ∃ L : ℝ, 0 ≤ L ∧ ∀ k ≤ 2, ∀ x : E₄,
      ‖Dᵏ k (ballCutoff 0 (2 * r) (9 * r / 4)) x‖ ≤ L := by
  let s := 2 * r
  let R := 9 * r / 4
  have hs : 0 ≤ s := by dsimp [s]; positivity
  have hsR : s < R := by dsimp [s, R]; linarith
  let L₁ := ballCutoffFDerivBound s R
  let L₂ := ballCutoffFDeriv2Bound s R
  have hL₁ : 0 ≤ L₁ := ballCutoffFDerivBound_nonneg hs hsR
  have hL₂ : 0 ≤ L₂ := ballCutoffFDeriv2Bound_nonneg hs hsR
  refine ⟨1 + L₁ + L₂, by positivity, ?_⟩
  intro k hk x
  interval_cases k
  · rw [norm_iteratedFDeriv_zero, Real.norm_of_nonneg (ballCutoff_mem_Icc 0 s R x).1]
    linarith [(ballCutoff_mem_Icc 0 s R x).2]
  · rw [norm_iteratedFDeriv_one, fderiv_ballCutoff]
    exact (norm_ballCutoffFDeriv_le hs hsR x).trans (by change L₁ ≤ _; linarith)
  · rw [← norm_iteratedFDeriv_fderiv (n := 1), norm_iteratedFDeriv_one,
      fderiv_ballCutoff, fderiv_ballCutoffFDeriv]
    exact (norm_ballCutoffFDeriv2_le hs hsR x).trans (by change L₂ ≤ _; linarith)

/-- With a single cutoff, the global (L^6) norms through order two are
bounded by the input (W^{2,6}) norm on the larger open ball. -/
private theorem cutoff_eLpNorm_iteratedFDeriv_le
    {r L : ℝ} (hr : 0 < r) (hL : 0 ≤ L)
    (hχ : ∀ k ≤ 2, ∀ x : E₄, ‖Dᵏ k (ballCutoff 0 (2 * r) (9 * r / 4)) x‖ ≤ L)
    {u : E₄ → ℝ} (hu : ContDiff ℝ ∞ u) {B : ℝ≥0∞}
    (hB : bourW26Norm ((volume : Measure E₄).restrict (Metric.ball 0 (5 * r / 2))) u ≤ B)
    {k : ℕ} (hk : k ≤ 2) :
    eLpNorm (Dᵏ k (fun x => ballCutoff 0 (2 * r) (9 * r / 4) x * u x)) 6 volume ≤
      3 * (ENNReal.ofReal (2 * L) * B) := by
  classical
  let S := Metric.ball (0 : E₄) (5 * r / 2)
  let χ := ballCutoff (0 : E₄) (2 * r) (9 * r / 4)
  let w := fun x => χ x * u x
  have hχsmooth : ContDiff ℝ ∞ χ := ballCutoff_contDiff ..
  have hw : ContDiff ℝ ∞ w := hχsmooth.mul hu
  have hSupp : tsupport w ⊆ S := by
    apply (tsupport_mul_subset_left (f := χ) (g := u)).trans
    exact (ballCutoff_tsupport_subset_closedBall (by positivity) (by linarith)).trans
      (Metric.closedBall_subset_ball (by linarith))
  let v (i : Fin 3) := S.indicator (fun x => ‖Dᵏ (i : ℕ) u x‖)
  have hRow (i : Fin 3) : eLpNorm (v i) 6 volume ≤ B := by
    rw [eLpNorm_indicator_eq_eLpNorm_restrict Metric.isOpen_ball.measurableSet]
    have hB' : eLpNorm u 6 (volume.restrict S) + eLpNorm (fderiv ℝ u) 6 (volume.restrict S) +
          eLpNorm (Dᵏ 2 u) 6 (volume.restrict S) ≤ B := hB
    fin_cases i
    · simpa only [norm_iteratedFDeriv_zero, eLpNorm_norm u hu.continuous.aestronglyMeasurable] using
        ((le_self_add : eLpNorm u 6 (volume.restrict S) ≤ _).trans (le_self_add.trans hB'))
    · simpa only [norm_iteratedFDeriv_one,
        eLpNorm_norm _ (hu.continuous_fderiv (by simp)).aestronglyMeasurable] using
        ((le_add_self : eLpNorm (fderiv ℝ u) 6 (volume.restrict S) ≤ _).trans (le_self_add.trans hB'))
    · rw [eLpNorm_norm _ (hu.continuous_iteratedFDeriv (m := 2) (by simp)).aestronglyMeasurable]
      exact le_add_self.trans hB'
  have hPoint (x : E₄) : ‖Dᵏ k w x‖ ≤ ∑ i : Fin 3, (2 * L) * v i x := by
    by_cases hx : x ∈ S
    · have hProd := norm_iteratedFDeriv_mul_le hχsmooth hu x (n := k) (by simp)
      change ‖Dᵏ k w x‖ ≤ _ at hProd
      simp only [v, Set.indicator_of_mem hx, Fin.sum_univ_three, Fin.val_zero, Fin.val_one]
      have h₀ : ‖Dᵏ 0 χ x‖ ≤ L := hχ 0 (by norm_num) x
      have h₁ : ‖Dᵏ 1 χ x‖ ≤ L := hχ 1 (by norm_num) x
      have h₂ : ‖Dᵏ 2 χ x‖ ≤ L := hχ 2 (by norm_num) x
      let A₀ := ‖Dᵏ 0 u x‖
      let A₁ := ‖Dᵏ 1 u x‖
      let A₂ := ‖Dᵏ 2 u x‖
      let T := 2 * L * A₀ + 2 * L * A₁ + 2 * L * A₂
      change ‖Dᵏ k w x‖ ≤ T
      have hA₀ : 0 ≤ L * A₀ := mul_nonneg hL (norm_nonneg _)
      have hA₁ : 0 ≤ L * A₁ := mul_nonneg hL (norm_nonneg _)
      have hA₂ : 0 ≤ L * A₂ := mul_nonneg hL (norm_nonneg _)
      refine hProd.trans ?_
      interval_cases k
      · have h : ‖Dᵏ 0 χ x‖ * A₀ ≤ T := by
          dsimp only [T]
          nlinarith only [mul_le_mul_of_nonneg_right h₀ (show 0 ≤ A₀ from norm_nonneg _),
            hA₀, hA₁, hA₂]
        simpa [Finset.sum_range_succ, A₀] using h
      · have h : ‖Dᵏ 0 χ x‖ * A₁ + ‖Dᵏ 1 χ x‖ * A₀ ≤ T := by
          dsimp only [T]
          nlinarith only [mul_le_mul_of_nonneg_right h₀ (show 0 ≤ A₁ from norm_nonneg _),
            mul_le_mul_of_nonneg_right h₁ (show 0 ≤ A₀ from norm_nonneg _), hA₀, hA₁, hA₂]
        simpa [Finset.sum_range_succ, A₀, A₁] using h
      · have h : ‖Dᵏ 0 χ x‖ * A₂ + 2 * ‖Dᵏ 1 χ x‖ * A₁ + ‖Dᵏ 2 χ x‖ * A₀ ≤ T := by
          dsimp only [T]
          nlinarith only [mul_le_mul_of_nonneg_right h₀ (show 0 ≤ A₂ from norm_nonneg _),
            mul_le_mul_of_nonneg_right h₁ (show 0 ≤ A₁ from norm_nonneg _),
            mul_le_mul_of_nonneg_right h₂ (show 0 ≤ A₀ from norm_nonneg _), hA₀, hA₂]
        simpa [Finset.sum_range_succ, A₀, A₁, A₂] using h
    · have hzero : Dᵏ k w x = 0 := by
        by_contra hn
        exact hx (hSupp ((support_iteratedFDeriv_subset k) hn))
      simp [hzero, v, hx]
  have hsum (x : E₄) : (∑ i : Fin 3, (2 * L : ℝ) • v i) x =
      ∑ i : Fin 3, (2 * L) * v i x := by simp [Finset.sum_apply, smul_eq_mul]
  calc
    _ ≤ eLpNorm (∑ i : Fin 3, (2 * L : ℝ) • v i) 6 volume :=
      eLpNorm_mono_real (hw.continuous_iteratedFDeriv (m := k) (by simp)).aestronglyMeasurable
        (fun x => by rw [hsum]; exact hPoint x)
    _ ≤ ∑ i : Fin 3, eLpNorm ((2 * L : ℝ) • v i) 6 volume := eLpNorm_sum_le (by norm_num)
    _ ≤ ∑ _i : Fin 3, ENNReal.ofReal (2 * L) * B := by
      refine Finset.sum_le_sum fun i _ => ?_
      rw [eLpNorm_const_smul, ← ofReal_norm, Real.norm_of_nonneg (by positivity)]
      exact mul_le_mul' le_rfl (hRow i)
    _ = _ := by simp [nsmul_eq_mul]

private theorem fderiv_direction_norm_le {u : E₄ → ℝ} (hu : ContDiff ℝ ∞ u)
    (x e : E₄) (he : ‖e‖ = 1) :
    ‖fderiv ℝ (fun y => fderiv ℝ u y e) x‖ ≤ ‖Dᵏ 2 u x‖ := by
  refine ContinuousLinearMap.opNorm_le_bound _ (norm_nonneg _) fun v => ?_
  have hSmooth : ContDiff ℝ ∞ (fderiv ℝ u) := hu.fderiv_right (by simp)
  have hdiff := hSmooth.differentiable (by simp) x
  have hf : fderiv ℝ (fun y => fderiv ℝ u y e) x = (fderiv ℝ (fderiv ℝ u) x).flip e := by
    simp [fderiv_clm_apply hdiff (differentiableAt_const e)]
  rw [hf, ContinuousLinearMap.flip_apply]
  calc
    _ = ‖Dᵏ 2 u x ![v, e]‖ := congrArg norm (iteratedFDeriv_two_apply u x ![v, e]).symm
    _ ≤ _ := by simpa [Fin.prod_univ_two, he] using (Dᵏ 2 u x).le_opNorm ![v, e]

/-- Value, Fréchet first derivative, and one-third Hölder derivative bounds
for a smooth scalar chart entry. -/
def BourC1ThirdBound (S : Set E₄) (C : ℝ) (u : E₄ → ℝ) : Prop :=
  (∀ x ∈ S, ‖u x‖ ≤ C ∧ ‖fderiv ℝ u x‖ ≤ C) ∧
  (∀ x ∈ S, ∀ y ∈ S,
    ‖fderiv ℝ u x - fderiv ℝ u y‖ ≤ C * dist x y ^ (1 / 3 : ℝ))

/-- A finite W²,⁶ bound on the outer four-ball gives a uniform bound
for the values, Fréchet derivatives, and (1/3)-Hölder derivative modulus
of the same smooth scalar entries on (B(2r)). -/
theorem bourHarmonicMorrey_of_W26_volume {r : ℝ} (hr : 0 < r) {B : ℝ≥0∞} (hB : B < ⊤) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ u : E₄ → ℝ, ContDiff ℝ ∞ u →
      bourW26Norm (volume.restrict (Metric.ball 0 (5 * r / 2))) u ≤ B →
      BourC1ThirdBound (Metric.ball 0 (2 * r)) C u := by
  classical
  obtain ⟨L, hL, hχ⟩ := cutoff_deriv_norm_uniform hr
  let R := 5 * r
  have hR : 0 < R := by dsimp [R]; positivity
  have hs : 0 ≤ 2 * r := by positivity
  have hsR : 2 * r < 9 * r / 4 := by linarith
  have hHalf : Metric.ball (0 : E₄) (2 * r) ⊆ Metric.ball (0 : E₄) (R / 2) :=
    Metric.ball_subset_ball (by dsimp [R]; linarith)
  have hp : (4 : ℝ) < 6 := by norm_num
  obtain ⟨C₀, hC₀, hSup₀⟩ := smooth_morrey_iteratedFDeriv_bound_uniform
    (d := 4) (p := 6) hp (x₀ := (0 : E₄)) hR 0
  obtain ⟨C₁, hC₁, hSup₁⟩ := smooth_morrey_iteratedFDeriv_bound_uniform
    (d := 4) (p := 6) hp (x₀ := (0 : E₄)) hR 1
  obtain ⟨CP, hCP, hPair⟩ := smooth_morrey_pair_bound_uniform
    (d := 4) (p := 6) hp (x₀ := (0 : E₄)) hR
  let B' := 3 * (ENNReal.ofReal (2 * L) * B)
  have hB' : B' < ⊤ := ENNReal.mul_lt_top (by norm_num) (ENNReal.mul_lt_top ENNReal.ofReal_lt_top hB)
  let T := B'.toReal
  have hT : 0 ≤ T := ENNReal.toReal_nonneg
  let b := EuclideanSpace.basisFun (Fin 4) ℝ
  let K := (Fintype.card (Fin 4) : ℝ) * ‖b.toBasis.equivFunL.toContinuousLinearMap‖
  have hK : 0 ≤ K := by dsimp [K]; positivity
  let CVal := C₀ * (3 * T)
  let CDer := C₁ * (3 * T)
  let CMod := K * CP * T
  have hCVal : 0 ≤ CVal := by dsimp [CVal]; positivity
  have hCDer : 0 ≤ CDer := by dsimp [CDer]; positivity
  have hCMod : 0 ≤ CMod := by dsimp [CMod]; positivity
  let C := CVal + CDer + CMod
  have hV : CVal ≤ C := by dsimp [C]; linarith only [hCDer, hCMod]
  have hD : CDer ≤ C := by dsimp [C]; linarith only [hCVal, hCMod]
  have hM : CMod ≤ C := by dsimp [C]; linarith only [hCVal, hCDer]
  refine ⟨C, hCVal.trans hV, ?_⟩
  intro u hu huB
  let χ := ballCutoff (0 : E₄) (2 * r) (9 * r / 4)
  let w := fun x => χ x * u x
  have hw : ContDiff ℝ ∞ w := (ballCutoff_contDiff ..).mul hu
  have hEq : EqOn w u (Metric.ball 0 (2 * r)) := by
    intro x hx
    have hh := ballCutoff_eq_one_of_mem_closedBall hs hsR (Metric.ball_subset_closedBall hx)
    simp only [w, χ, hh, one_mul]
  have hGradEq (x : E₄) (hx : x ∈ Metric.ball 0 (2 * r)) : fderiv ℝ w x = fderiv ℝ u x :=
    (hEq.eventuallyEq_of_mem (Metric.isOpen_ball.mem_nhds hx)).fderiv_eq
  let ν := (volume : Measure E₄).restrict (Metric.ball 0 R)
  have hmDer (k : ℕ) (hk : k ≤ 2) :
      eLpNorm (fun z => ‖Dᵏ k w z‖) (ENNReal.ofReal 6) ν ≤ B' := by
    rw [eLpNorm_norm _ (hw.continuous_iteratedFDeriv (m := k) (by simp)).aestronglyMeasurable,
      ENNReal.ofReal_ofNat]
    exact (eLpNorm_restrict_le _ _ _ _).trans (cutoff_eLpNorm_iteratedFDeriv_le hr hL hχ hu huB hk)
  have hSum (m : ℕ) (hm : m ≤ 1) :
      (Finset.range (m + 2)).sum (fun j =>
        (eLpNorm (fun z => ‖Dᵏ j w z‖) (ENNReal.ofReal 6) ν).toReal) ≤ 3 * T := by
    calc
      _ ≤ (Finset.range (m + 2)).sum (fun _ => T) := by
        apply Finset.sum_le_sum
        intro j hj
        exact ENNReal.toReal_mono hB'.ne (hmDer j (by have := Finset.mem_range.mp hj; omega))
      _ = (m + 2 : ℕ) • T := by simp
      _ ≤ _ := by rw [nsmul_eq_mul]; gcongr; exact_mod_cast (show m + 2 ≤ 3 by omega)
  constructor
  · intro x hx
    have hv := (hSup₀ hw x (hHalf hx)).trans (mul_le_mul_of_nonneg_left (hSum 0 (by norm_num)) hC₀)
    have hd := (hSup₁ hw x (hHalf hx)).trans (mul_le_mul_of_nonneg_left (hSum 1 (by norm_num)) hC₁)
    rw [norm_iteratedFDeriv_zero, hEq hx] at hv
    rw [norm_iteratedFDeriv_one, hGradEq x hx] at hd
    exact ⟨hv.trans hV, hd.trans hD⟩
  · intro x hx y hy
    let g (j : Fin 4) := fun z => fderiv ℝ w z (b j)
    have hw' : ContDiff ℝ ∞ (fderiv ℝ w) := hw.fderiv_right (by simp)
    have hg (j : Fin 4) : ContDiff ℝ ∞ (g j) := hw'.clm_apply contDiff_const
    have hG (j : Fin 4) : (eLpNorm (fun z => ‖fderiv ℝ (g j) z‖) (ENNReal.ofReal 6) ν).toReal ≤ T := by
      apply ENNReal.toReal_mono hB'.ne
      refine (eLpNorm_mono_real ((hg j).continuous_fderiv (by simp)).norm.aestronglyMeasurable
        (fun z => ?_)).trans (hmDer 2 le_rfl)
      rw [norm_norm]
      exact fderiv_direction_norm_le hw z (b j) (b.norm_eq_one j)
    let D := CP * dist x y ^ (1/3 : ℝ) * T
    have hD₀ : 0 ≤ D := by dsimp [D]; positivity
    have hPoint (j : Fin 4) : ‖(fderiv ℝ w x - fderiv ℝ w y) (b.toBasis j)‖ ≤ D := by
      have hh := hPair (hg j) (hHalf hx) (hHalf hy)
      rw [show 1 - (↑(4 : ℕ) : ℝ) / 6 = 1 / 3 by norm_num] at hh
      change ‖g j x - g j y‖ ≤ D
      refine hh.trans (mul_le_mul_of_nonneg_left (hG j) (by positivity))
    have hOp := b.toBasis.opNorm_le hD₀ hPoint
    rw [hGradEq x hx, hGradEq y hy, nsmul_eq_mul] at hOp
    refine hOp.trans ?_
    change K * D ≤ C * _
    have hscalar := mul_le_mul_of_nonneg_right hM
      (Real.rpow_nonneg (show 0 ≤ dist x y from dist_nonneg) (1/3 : ℝ))
    calc
      K * D = CMod * dist x y ^ (1/3 : ℝ) := by dsimp only [D, CMod]; ring
      _ ≤ _ := hscalar

/-- The same interior Morrey transfer for the Haar normalization of the
supplying (W^{2,6}) theorem. -/
theorem bourHarmonicMorrey_of_W26 (μ : Measure E₄) [Measure.IsAddHaarMeasure μ]
    {r : ℝ} (hr : 0 < r) {B : ℝ≥0∞} (hB : B < ⊤) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ u : E₄ → ℝ, ContDiff ℝ ∞ u →
      bourW26Norm (μ.restrict (Metric.ball 0 (5 * r / 2))) u ≤ B →
      BourC1ThirdBound (Metric.ball 0 (2 * r)) C u := by
  let c : ℝ≥0∞ := ((volume : Measure E₄).addHaarScalarFactor μ : ℝ≥0∞) ^ ((6 : ℝ≥0∞).toReal⁻¹)
  have hc : c < ⊤ := ENNReal.rpow_lt_top_of_nonneg (by positivity) ENNReal.coe_ne_top
  obtain ⟨C, hC, hEstimate⟩ := bourHarmonicMorrey_of_W26_volume hr (ENNReal.mul_lt_top hc hB)
  refine ⟨C, hC, fun u hu hb => hEstimate u hu ?_⟩
  rw [bourW26Norm_volume_eq μ]
  exact mul_le_mul' le_rfl hb

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  [CompactSpace M] [BoundarylessManifold I M] [ConnectedSpace M] [Nonempty M]

local notation "J" => Fin (Module.finrank ℝ E₄)
local notation "ι" => 𝓘(ℝ, E₄)

/-- The same physical harmonic realization in the mixed stationary family has
common (C^{1,1/3}) controls for the metric and covariant trace-free Ricci
entries on (B(2r)), retaining the physical pullback and radius comparison. -/
theorem bourMixedStationary_uniformHarmonicC1Third
    (μ : Measure E₄) [Measure.IsAddHaarMeasure μ]
    {y C K : ℝ} (hy : 0 < y) (hC : 0 ≤ C) (hK : 0 < K)
    (γ CΔ : ℝ≥0) (hPeters : BourHarmonicRadiusSupplier (I := I) (M := M) K γ)
    (hLap : ∀ u : E₄ → ℝ, ContDiff ℝ ∞ u → HasCompactSupport u →
      eLpNorm (Dᵏ 2 u) 6 μ ≤ (CΔ : ℝ≥0∞) * eLpNorm (Δ u) 6 μ) :
    ∃ (r R L : ℝ) (A : ℝ≥0) (Q : ℝ), 0 < r ∧ 0 < R ∧ 0 < L ∧ 0 ≤ Q ∧
      ∀ (g : SmoothRiemannianMetric I M) (s p a : ℝ) (ha : 0 < a),
        y ≤ classYamabeFour (finrank_euclideanSpace_fin (𝕜 := ℝ) (n := 4)) g →
        (∀ z, metricScalarAt g z = s) → 0 ≤ s → s ≤ C →
        0 ≤ p → p ≤ 1 → 1 ≤ a → (∀ z, Bour.bourCovariantGradient p g z = 0) →
        (∀ z, Real.sqrt (intrinsicCurvatureSq (scaleMetric a ha g) z) ≤ K) →
        ∀ x, ∃ (b : BourHarmonicChart (scaleMetric a ha g) x L A γ) (G : SmoothRiemannianMetric ι E₄),
          b.chart.source = Metric.ball (0 : E₄) (4 * r) ∧
          b.chart.target ⊆ riemannianBallOf (scaleMetric a ha g) x R ∧
          riemannianBallOf g x ((r / L) / Real.sqrt a) ⊆ b.chart '' Metric.closedBall (0 : E₄) r ∧
          (∀ z ∈ Metric.ball (0 : E₄) (3 * r), ∀ v w : E₄, G.inner z v w =
            (scaleMetric a ha g).inner (b.chart z)
              (mfderiv ι I (b.chart : E₄ → M) z v) (mfderiv ι I (b.chart : E₄ → M) z w)) ∧
          ∀ i j : J, let S := Metric.ball (0 : E₄) (2 * r)
            BourC1ThirdBound S Q (chartGramOnE G 0 i j) ∧
              BourC1ThirdBound S Q (bourChartTensorComponent (bourTraceFreeRicciField G) 0 ![i,j]) := by
  have hdim : Module.finrank ℝ E₄ = 4 := finrank_euclideanSpace_fin
  let : NeZero (Module.finrank ℝ E₄) := ⟨by rw [hdim]; norm_num⟩
  obtain ⟨r, R, L, A, B, hr, hR, hL, hB, hBounds⟩ :=
    bourMixedStationary_uniformHarmonicW26 (I := I) (M := M) hdim μ hy hC hK γ CΔ hPeters hLap
  obtain ⟨Q, hQ, hMorrey⟩ := bourHarmonicMorrey_of_W26 μ hr hB
  refine ⟨r, R, L, A, Q, hr, hR, hL, hQ, ?_⟩
  intro g s p a ha hY hs hs₀ hsC hp hp₁ ha₁ hStationary hCurv x
  obtain ⟨b, G, hSource, hTarget, hBall, hPull, hW⟩ :=
    hBounds g s p a ha hY hs hs₀ hsC hp hp₁ ha₁ hStationary hCurv x
  refine ⟨b, G, hSource, hTarget, hBall, hPull, ?_⟩
  intro i j
  have hMetric : ContDiff ℝ ∞ (chartGramOnE G 0 i j) := by
    rw [← contDiffOn_univ]
    simpa using chartGramOnE_contDiffOn G (0 : E₄) i j
  have hRicci : ContDiff ℝ ∞ (bourChartTensorComponent (bourTraceFreeRicciField G) 0 ![i,j]) := by
    rw [contDiff_iff_contDiffAt]
    intro z
    apply bourChartTensorComponent_contDiffAt
    rw [extChartAt_model_space_eq_id]
    simp
  exact ⟨hMorrey _ hMetric (le_self_add.trans (hW i j)),
    hMorrey _ hRicci (le_add_self.trans (hW i j))⟩

end SmoothPoincare
