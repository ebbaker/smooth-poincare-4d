import SmoothPoincare.Variational.BourRicciW26
import SmoothPoincare.Variational.BourCutoffRestriction

/-! # Sixth-power interior bounds for finite scalar systems in the Bour harmonic chart

26 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance.
Actual serving configuration unavailable. Edition 06, E51, Route 13.
-/

set_option autoImplicit false

noncomputable section

open Bundle DifferentialGeometry DifferentialGeometry.Analysis DifferentialGeometry.Analysis.Calculus
open DifferentialGeometry.Geometry.Operator DifferentialGeometry.Tensor.Coordinates
open Filter Manifold MeasureTheory Set
open scoped BigOperators ContDiff ENNReal Laplacian Manifold NNReal Topology

namespace SmoothPoincare

open Bour

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
  [FiniteDimensional ℝ E] [MeasurableSpace E] [BorelSpace E]
variable {κ : Type*} [Fintype κ]

local notation "J" => Fin (Module.finrank ℝ E)
local notation "ι" => 𝓘(ℝ, E)
local notation "H₂" => iteratedFDeriv ℝ 2

private theorem memLp_on_ball {F : Type*} [NormedAddCommGroup F] (μ : Measure E)
    [IsFiniteMeasureOnCompacts μ] {f : E → F} (hf : Continuous f) (z : E) (s : ℝ) :
    MemLp f 6 (μ.restrict (Metric.ball z s)) := by
  let : IsFiniteMeasure (μ.restrict (Metric.ball z s)) := isFiniteMeasure_restrict.mpr
    ((measure_mono Metric.ball_subset_closedBall).trans_lt (isCompact_closedBall z s).measure_lt_top).ne
  obtain ⟨C, hC⟩ := (isCompact_closedBall z s).bddAbove_image hf.norm.continuousOn
  apply MemLp.of_bound hf.aestronglyMeasurable C
  filter_upwards [ae_restrict_mem (μ := μ) Metric.isOpen_ball.measurableSet] with y hy
  exact hC (mem_image_of_mem _ (Metric.ball_subset_closedBall hy))

omit [InnerProductSpace ℝ E] [FiniteDimensional ℝ E] in
private theorem measure_closedBall_translate (μ : Measure E) [Measure.IsAddHaarMeasure μ]
    (z : E) (s : ℝ) : μ (Metric.closedBall z s) = μ (Metric.closedBall (0 : E) s) := by
  have hs : (fun x : E => z + x) ⁻¹' Metric.closedBall z s = Metric.closedBall (0 : E) s := by
    ext x
    change dist (z + x) z ≤ s ↔ dist x 0 ≤ s
    have hdist : dist (z + x) z = dist x 0 := by
      calc
        _ = dist (z + x) (z + 0) := by rw [add_zero]
        _ = _ := by simp
    rw [hdist]
  simpa only [hs] using (measure_preimage_add μ z (Metric.closedBall z s)).symm

set_option maxHeartbeats 1000000 in
/-- On the smaller ball, a finite smooth scalar system with a common zeroth bound
and at most linear first-order forcing has a common full `W²,6` bound. The principal
operator is the actual inverse Gram matrix of the metric in the identity chart.
The common constants are chosen before the metric and all rows. -/
theorem bourUniformHarmonicSystemW26
    (μ : Measure E) [Measure.IsAddHaarMeasure μ] {r L : ℝ} (hr : 0 < r) (hL : 0 < L)
    (A : ℝ≥0) {U F₀ F₁ : ℝ} (hU : 0 ≤ U) (hF₀ : 0 ≤ F₀) (hF₁ : 0 ≤ F₁) (C₀ : ℝ≥0)
    (hFlat : ∀ (G : SmoothRiemannianMetric ι E) (z : E),
      (∀ v : E, G.inner z v v ≤ L ^ 2 * ‖v‖ ^ 2) →
      BourFlatHessianEstimate μ 6 (fun i k => chartInvGramOnE G 0 i k z) C₀) :
    ∃ C : ℝ≥0∞, C < ⊤ ∧
      ∀ (G : SmoothRiemannianMetric ι E),
        (∀ z ∈ Metric.ball (0 : E) (3 * r), ∀ v : E,
          L⁻¹ ^ 2 * ‖v‖ ^ 2 ≤ G.inner z v v ∧ G.inner z v v ≤ L ^ 2 * ‖v‖ ^ 2) →
        (∀ i k : J, ∀ z ∈ Metric.ball (0 : E) (3 * r),
          ‖fderiv ℝ (chartGramOnE G 0 i k) z‖ ≤ (A : ℝ)) →
        ∀ (u : κ → E → ℝ), (∀ j, ContDiff ℝ ∞ (u j)) →
          (∀ j z, z ∈ Metric.ball (0 : E) (3 * r) → |u j z| ≤ U) →
          (∀ j z, z ∈ Metric.ball (0 : E) (3 * r) →
            |bourFlatOperator (fun i k => chartInvGramOnE G 0 i k z) (u j) z| ≤
              F₀ + F₁ * ∑ i : κ × J, |fderiv ℝ (u i.1) z (chartModelBasis E i.2)|) →
          ∀ j, let ν := μ.restrict (Metric.ball (0 : E) (5 * r / 2))
            eLpNorm (u j) 6 ν + eLpNorm (fderiv ℝ (u j)) 6 ν + eLpNorm (H₂ (u j)) 6 ν ≤ C := by
  classical
  obtain ⟨D, hD, hInv⟩ := bourMetricInverse_entry_controls (E := E) (r := r) (A := A) hL
  let B := ∑ i : J, ‖chartModelBasis E i‖
  have hB : 0 ≤ B := Finset.sum_nonneg fun _ _ => norm_nonneg _
  have hAxis (i : J) : ‖chartModelBasis E i‖ ≤ B :=
    Finset.single_le_sum (fun k _ => norm_nonneg (chartModelBasis E k)) (Finset.mem_univ i)
  let n := (Module.finrank ℝ E : ℝ)
  let mInv := n ^ 2 * D ^ 2 * (A : ℝ)
  have hmInv : 0 ≤ mInv := by dsimp [mInv]; positivity
  let v := (C₀ : ℝ) * mInv * B ^ 2
  have hv : 0 ≤ v := by dsimp [v]; positivity
  let ρ := min (r / 4) (1 / (2 * (1 + v)))
  have hρ : 0 < ρ := lt_min (by positivity) (by positivity)
  have hρr : ρ ≤ r / 4 := min_le_left _ _
  have hSmallReal : (C₀ : ℝ) * ((mInv * ρ) * B ^ 2) ≤ 1 / 2 := by
    calc
      _ = v * ρ := by dsimp [v]; ring
      _ ≤ (1 + v) * ρ := by gcongr; linarith
      _ ≤ 1 / 2 := by
        have h := (le_div_iff₀ (show 0 < 2 * (1 + v) by positivity)).mp
          (show ρ ≤ 1 / (2 * (1 + v)) from min_le_right _ _)
        nlinarith only [h]
  have hSmall : (C₀ : ℝ≥0∞) * ENNReal.ofReal ((mInv * ρ) * B ^ 2) ≤ 1 / 2 := by
    have h := ENNReal.ofReal_le_ofReal hSmallReal
    rw [ENNReal.ofReal_mul (p := (C₀ : ℝ)) (q := (mInv * ρ) * B ^ 2) C₀.2,
      ENNReal.ofReal_coe_nnreal, ENNReal.ofReal_div_of_pos (show 0 < (2 : ℝ) by norm_num)] at h
    simpa only [ENNReal.ofReal_one, ENNReal.ofReal_ofNat] using h
  let s := ρ / 2
  have hs : 0 ≤ s := (half_pos hρ).le
  have hsρ : s < ρ := by dsimp [s]; linarith
  obtain ⟨Ncover, hCover⟩ := bourFiniteCover_eLpNorm (E := E) μ (p := 6) (by norm_num) (r := r)
    (show 0 < s by exact half_pos hρ)
  let P := ballCutoffFDerivBound s ρ * B
  let Q := ballCutoffFDeriv2Bound s ρ * B * B
  have hP : 0 ≤ P := mul_nonneg (ballCutoffFDerivBound_nonneg hs hsρ) hB
  have hQ : 0 ≤ Q := mul_nonneg (mul_nonneg (ballCutoffFDeriv2Bound_nonneg hs hsρ) hB) hB
  let m := (μ.real (Metric.closedBall (0 : E) ρ)) ^ (1/6 : ℝ)
  let d₀ := 2 * U * (Q + P ^ 2)
  let d₁ := 4 * P
  let α := 2 * (C₀ : ℝ) * (F₀ + n ^ 2 * D * d₀) * m
  let β := 2 * (C₀ : ℝ) * (F₁ + n ^ 2 * D * d₁)
  let N := (Fintype.card (κ × J) : ℝ)
  let ε := 1 / (2 * (1 + N * (B ^ 2 * β + d₁)))
  let Y := 2 * N * ((24 * U * P + 16 / ε * U) * m + ε * (d₀ * m + B ^ 2 * α))
  let X := α + β * Y
  let Bcoord := (Fintype.card J : ℝ) * ‖(chartModelBasis E).equivFunL.toContinuousLinearMap‖
  have hBcoord : 0 ≤ Bcoord := by dsimp [Bcoord]; positivity
  let S := Metric.ball (0 : E) (5 * r / 2)
  let CVal := μ S ^ ((6 : ℝ≥0∞).toReal⁻¹) * ENNReal.ofReal U
  let CGrad := (Ncover : ℝ≥0∞) * ENNReal.ofReal (Bcoord * Y)
  let CHess := (Ncover : ℝ≥0∞) * ENNReal.ofReal X
  have hμ : μ S < ⊤ := (measure_mono Metric.ball_subset_closedBall).trans_lt
    (isCompact_closedBall (0 : E) (5 * r / 2)).measure_lt_top
  refine ⟨CVal + CGrad + CHess, ?_, ?_⟩
  · refine ENNReal.add_lt_top.mpr ⟨ENNReal.add_lt_top.mpr ⟨?_, ?_⟩, ?_⟩
    · exact ENNReal.mul_lt_top (ENNReal.rpow_lt_top_of_nonneg (by positivity) hμ.ne)
        ENNReal.ofReal_lt_top
    · exact ENNReal.mul_lt_top (by simp) ENNReal.ofReal_lt_top
    · exact ENNReal.mul_lt_top (by simp) ENNReal.ofReal_lt_top
  intro G hForm hJet u hu hu0 hForce j
  let a (z : E) : Matrix J J ℝ := fun i k => chartInvGramOnE G 0 i k z
  have haCont (i k : J) : Continuous fun z => a z i k := by
    have h : ContDiff ℝ ∞ (chartInvGramOnE G 0 i k) := by
      rw [← contDiffOn_univ]
      simpa using chartInvGramOnE_contDiffOn G (0 : E) i k
    exact h.continuous
  obtain ⟨hEntry, hOsc⟩ := hInv G (fun z hz w => (hForm z hz w).1) hJet
  have hLocal (z : E) (hz : z ∈ Metric.closedBall (0 : E) (5 * r / 2)) :
      eLpNorm (fderiv ℝ (u j)) 6 (μ.restrict (Metric.ball z s)) ≤ ENNReal.ofReal (Bcoord * Y) ∧
      eLpNorm (H₂ (u j)) 6 (μ.restrict (Metric.ball z s)) ≤ ENNReal.ofReal X := by
    let K := Metric.closedBall z ρ
    have hK : IsCompact K := isCompact_closedBall z ρ
    have hz₀ : z ∈ Metric.ball (0 : E) (3 * r) := Metric.closedBall_subset_ball (by linarith) hz
    have hSub (x : E) (hx : x ∈ K) : x ∈ Metric.ball (0 : E) (3 * r) := by
      change dist x 0 < 3 * r
      linarith [dist_triangle x z 0, Metric.mem_closedBall.mp hx, Metric.mem_closedBall.mp hz]
    let η := ballCutoff z s ρ
    have hη : ContDiff ℝ ∞ η := ballCutoff_contDiff z s ρ
    have hηK : tsupport η ⊆ K := ballCutoff_tsupport_subset_closedBall hs hsρ
    have hFlat₀ : BourFlatHessianEstimate μ 6 (a z) C₀ := hFlat G z (fun w => (hForm z hz₀ w).2)
    have hOsc₀ (x : E) (hx : x ∈ K) (i k : J) : ‖a x i k - a z i k‖ ≤ mInv * ρ := by
      rw [Real.norm_eq_abs]
      exact (hOsc i k z hz₀ x (hSub x hx)).trans
        (mul_le_mul_of_nonneg_left (Metric.mem_closedBall.mp hx) hmInv)
    have hη0 (x : E) (_ : x ∈ K) : |η x| ≤ 1 := by
      change |ballCutoff z s ρ x| ≤ 1
      have hh := ballCutoff_mem_Icc z s ρ x
      rw [abs_of_nonneg hh.1]
      exact hh.2
    have hη1 (x : E) (_ : x ∈ K) (i : J) : |fderiv ℝ η x (chartModelBasis E i)| ≤ P := by
      refine bourNorm_directional_bound ?_ (hAxis i) (ballCutoffFDerivBound_nonneg hs hsρ)
      change ‖fderiv ℝ (ballCutoff z s ρ) x‖ ≤ _
      rw [fderiv_ballCutoff]
      exact norm_ballCutoffFDeriv_le hs hsρ x
    have hη2 (x : E) (_ : x ∈ K) (i k : J) :
        |H₂ η x ![chartModelBasis E i, chartModelBasis E k]| ≤ Q :=
      (bourBallCutoff_hessian_eval_bound hs hsρ z x _ _).trans
        (mul_le_mul (mul_le_mul_of_nonneg_left (hAxis i) (ballCutoffFDeriv2Bound_nonneg hs hsρ))
          (hAxis k) (norm_nonneg _) (mul_nonneg (ballCutoffFDeriv2Bound_nonneg hs hsρ) hB))
    have hResult := bourCutoffSystem_sixthInterior μ K hK a haCont (a z) C₀ hFlat₀ hSmall hOsc₀
      η hη hηK u hu hU hP hQ hD hF₀ hF₁ hη0 hη1 hη2
      (fun k x hx => hu0 k x (hSub x hx)) (fun x hx i k => hEntry i k x (hSub x hx))
      (fun k x hx => hForce k x (hSub x hx))
    have hVol : μ.real K = μ.real (Metric.closedBall (0 : E) ρ) := by
      unfold Measure.real
      rw [measure_closedBall_translate μ z ρ]
    dsimp only at hResult
    rw [hVol] at hResult
    have hY : (∑ i : κ × J, lpNorm (bourCutoffSystemGradient η u i) 6 μ) ≤ Y := hResult.1
    have hX : lpNorm (H₂ (fun x => η x ^ 2 * u j x)) 6 μ ≤ X := hResult.2 j
    have hOne (x : E) (hx : x ∈ Metric.ball z s) : η x = 1 :=
      ballCutoff_eq_one_of_mem_closedBall hs hsρ (Metric.ball_subset_closedBall hx)
    have hCompact : HasCompactSupport η := hK.of_isClosed_subset isClosed_closure hηK
    have hGrad (i : J) : MemLp (fun x => η x * fderiv ℝ (u j) x (chartModelBasis E i)) 6 μ := by
      have hc := (hu j).continuous_fderiv (by simp)
      exact (hη.continuous.mul (hc.clm_apply continuous_const)).memLp_of_hasCompactSupport
        hCompact.mul_right
    have hCompactProduct : HasCompactSupport (fun x => η x ^ 2 * u j x) := by
      apply hK.of_isClosed_subset isClosed_closure
      apply closure_minimal _ hK.isClosed
      intro x hx
      by_contra hxK
      have hxη : η x = 0 := image_eq_zero_of_notMem_tsupport (fun h => hxK (hηK h))
      exact hx (by simp [hxη])
    have hHess : MemLp (H₂ (fun x => η x ^ 2 * u j x)) 6 μ :=
      (((hη.pow 2).mul (hu j)).continuous_iteratedFDeriv (by simp)).memLp_of_hasCompactSupport
        (hCompactProduct.iteratedFDeriv 2)
    have hRows : (∑ i : J, lpNorm (fun x => η x * fderiv ℝ (u j) x (chartModelBasis E i)) 6 μ) ≤ Y := by
      let Yrow (k : κ) := ∑ i : J, lpNorm (bourCutoffSystemGradient η u (k, i)) 6 μ
      change Yrow j ≤ Y
      have hSum : (∑ k : κ, Yrow k) ≤ Y := by
        simpa only [Yrow, Fintype.sum_prod_type] using hY
      exact (Finset.single_le_sum (f := Yrow)
        (fun k _ => Finset.sum_nonneg fun _ _ => lpNorm_nonneg) (Finset.mem_univ j)).trans hSum
    have hFirst := bourCutoffInnerBall_fderiv_lpNorm_le_sum μ 6 (by norm_num) (by norm_num)
      η (u j) z s hOne hη.continuous ((hu j).of_le (by simp)) hGrad
    have hSecond := bourCutoffInnerBall_hessian_lpNorm_le μ 6 η (u j) z s hOne hHess
    rw [← ofReal_lpNorm (memLp_on_ball μ ((hu j).continuous_fderiv (by simp)) z s),
      ← ofReal_lpNorm (memLp_on_ball μ ((hu j).continuous_iteratedFDeriv (by simp)) z s)]
    exact ⟨ENNReal.ofReal_le_ofReal (hFirst.trans (mul_le_mul_of_nonneg_left hRows hBcoord)),
      ENNReal.ofReal_le_ofReal (hSecond.trans hX)⟩
  have hVal : eLpNorm (u j) 6 (μ.restrict S) ≤ CVal := by
    have hh := eLpNorm_le_of_ae_bound (p := 6)
      ((hu j).continuous.aestronglyMeasurable (μ := μ.restrict S))
      (C := U) ((ae_restrict_mem (μ := μ) Metric.isOpen_ball.measurableSet).mono fun z hz => by
        rw [Real.norm_eq_abs]
        exact hu0 j z (Metric.ball_subset_ball (by linarith only [hr]) hz))
    simpa only [CVal, Measure.restrict_apply_univ] using hh
  exact add_le_add (add_le_add hVal (hCover (fderiv ℝ (u j)) ((hu j).continuous_fderiv (by simp))
    _ (fun z hz => (hLocal z hz).1))) (hCover (H₂ (u j)) ((hu j).continuous_iteratedFDeriv (by simp))
    _ (fun z hz => (hLocal z hz).2))

/-- Use a single flat Euclidean Laplacian estimate at exponent six. -/
theorem bourUniformHarmonicSystemW26_of_flatLaplacian
    (μ : Measure E) [Measure.IsAddHaarMeasure μ] {r L : ℝ} (hr : 0 < r) (hL : 0 < L)
    (A : ℝ≥0) {U F₀ F₁ : ℝ} (hU : 0 ≤ U) (hF₀ : 0 ≤ F₀) (hF₁ : 0 ≤ F₁) (CΔ : ℝ≥0)
    (hLap : ∀ u : E → ℝ, ContDiff ℝ ∞ u → HasCompactSupport u →
      eLpNorm (H₂ u) 6 μ ≤ (CΔ : ℝ≥0∞) * eLpNorm (Δ u) 6 μ) :
    ∃ C : ℝ≥0∞, C < ⊤ ∧
      ∀ (G : SmoothRiemannianMetric ι E),
        (∀ z ∈ Metric.ball (0 : E) (3 * r), ∀ v : E,
          L⁻¹ ^ 2 * ‖v‖ ^ 2 ≤ G.inner z v v ∧ G.inner z v v ≤ L ^ 2 * ‖v‖ ^ 2) →
        (∀ i k : J, ∀ z ∈ Metric.ball (0 : E) (3 * r),
          ‖fderiv ℝ (chartGramOnE G 0 i k) z‖ ≤ (A : ℝ)) →
        ∀ (u : κ → E → ℝ), (∀ j, ContDiff ℝ ∞ (u j)) →
          (∀ j z, z ∈ Metric.ball (0 : E) (3 * r) → |u j z| ≤ U) →
          (∀ j z, z ∈ Metric.ball (0 : E) (3 * r) →
            |bourFlatOperator (fun i k => chartInvGramOnE G 0 i k z) (u j) z| ≤
              F₀ + F₁ * ∑ i : κ × J, |fderiv ℝ (u i.1) z (chartModelBasis E i.2)|) →
          ∀ j, let ν := μ.restrict (Metric.ball (0 : E) (5 * r / 2))
            eLpNorm (u j) 6 ν + eLpNorm (fderiv ℝ (u j)) 6 ν + eLpNorm (H₂ (u j)) 6 ν ≤ C := by
  let Cscale : ℝ≥0 := ⟨L ^ 2, sq_nonneg L⟩
  let C₀ : ℝ≥0 := Cscale * CΔ
  refine bourUniformHarmonicSystemW26 μ hr hL A hU hF₀ hF₁ C₀ ?_
  intro G z hform
  have h := bourFlatHessianEstimate_metricFrozen μ 6 (by norm_num) (by norm_num)
    G z hL.le hform (CΔ : ℝ≥0∞) hLap
  have hScale : ENNReal.ofReal (L ^ 2) = (Cscale : ℝ≥0∞) := by
    change ENNReal.ofReal (Cscale : ℝ) = (Cscale : ℝ≥0∞)
    exact ENNReal.ofReal_coe_nnreal
  simpa only [C₀, ENNReal.coe_mul, hScale] using h

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]

/-- The scalar-system estimate for the actual coordinate pullback of a physical
metric. The given harmonic chart provides both the ellipticity and the first jet. -/
theorem bourUniformHarmonicPullbackSystemW26_of_flatLaplacian
    (μ : Measure E) [Measure.IsAddHaarMeasure μ] {r L : ℝ} (hr : 0 < r) (hL : 0 < L)
    (A γ : ℝ≥0) {U F₀ F₁ : ℝ} (hU : 0 ≤ U) (hF₀ : 0 ≤ F₀) (hF₁ : 0 ≤ F₁) (CΔ : ℝ≥0)
    (hLap : ∀ u : E → ℝ, ContDiff ℝ ∞ u → HasCompactSupport u →
      eLpNorm (H₂ u) 6 μ ≤ (CΔ : ℝ≥0∞) * eLpNorm (Δ u) 6 μ) :
    ∃ C : ℝ≥0∞, C < ⊤ ∧
      ∀ (g : SmoothRiemannianMetric I M) (x : M) (b : BourHarmonicChart g x L A γ),
        b.chart.source = Metric.ball (0 : E) (4 * r) →
        ∀ (G : SmoothRiemannianMetric ι E),
          (∀ z ∈ Metric.ball (0 : E) (3 * r), ∀ v w : E,
            G.inner z v w = g.inner (b.chart z)
              (mfderiv ι I (b.chart : E → M) z v) (mfderiv ι I (b.chart : E → M) z w)) →
          ∀ (u : κ → E → ℝ), (∀ j, ContDiff ℝ ∞ (u j)) →
            (∀ j z, z ∈ Metric.ball (0 : E) (3 * r) → |u j z| ≤ U) →
            (∀ j z, z ∈ Metric.ball (0 : E) (3 * r) →
              |bourFlatOperator (fun i k => chartInvGramOnE G 0 i k z) (u j) z| ≤
                F₀ + F₁ * ∑ i : κ × J, |fderiv ℝ (u i.1) z (chartModelBasis E i.2)|) →
            ∀ j, let ν := μ.restrict (Metric.ball (0 : E) (5 * r / 2))
              eLpNorm (u j) 6 ν + eLpNorm (fderiv ℝ (u j)) 6 ν + eLpNorm (H₂ (u j)) 6 ν ≤ C := by
  obtain ⟨C, hC, hSystem⟩ := bourUniformHarmonicSystemW26_of_flatLaplacian
    (κ := κ) μ hr hL A hU hF₀ hF₁ CΔ hLap
  refine ⟨C, hC, ?_⟩
  intro g x b hSource G hPull
  have hSub (z : E) (hz : z ∈ Metric.ball (0 : E) (3 * r)) : z ∈ b.chart.source := by
    rw [hSource]
    exact Metric.ball_subset_ball (by linarith) hz
  apply hSystem G
  · intro z hz w
    rw [hPull z hz w w]
    exact b.metric_bounds z (hSub z hz) w
  · intro i k z hz
    exact bourModelGram_fderiv_bound_of_pullback b G hPull i k hz (hSub z hz)

end SmoothPoincare
