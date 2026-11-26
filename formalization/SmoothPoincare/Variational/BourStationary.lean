import SmoothPoincare.Variational.PositiveScalarYamabeFour
import DifferentialGeometry.Geometry.Comparison.Volume.CompactSmallBall
import DifferentialGeometry.Geometry.Curvature.Metric.Scaling
import DifferentialGeometry.Geometry.Operator.NormGradSqScaling
import DifferentialGeometry.Analysis.Integration.Measure.Riemannian.Scaling
import DifferentialGeometry.Analysis.Calculus.Cutoff.Profile
import DifferentialGeometry.Analysis.Calculus.Manifold.LipschitzApproximation
import DifferentialGeometry.Geometry.Metric.Distance.RadialCutoff

/-! # Physical noncollapse for the Bour stationary sequence -/

noncomputable section

open DifferentialGeometry DifferentialGeometry.Geometry.Curvature
open DifferentialGeometry.Geometry.Operator DifferentialGeometry.Integral.Measure
open DifferentialGeometry.Geometry.Riemannian
open DifferentialGeometry.Geometry.Riemannian.VolumeComparison
open FirstOrderTwistor Filter MeasureTheory Set
open scoped ContDiff ENNReal Manifold NNReal Topology

namespace SmoothPoincare

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [T2Space M] [CompactSpace M]

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

/-- The real volume of an open ball for the distance and measure of the same metric. -/
def bourBallVolume (g : SmoothRiemannianMetric I M) (x : M) (r : ℝ) : ℝ :=
  (riemannianVolumeMeasure I M g).real (riemannianBallOf g x r)

private theorem dyadic_sqrt_lower {v : ℕ → ℝ} {c κ : ℝ}
    (hc : 0 < c) (hκ : 0 < κ) (hv : ∀ n, 0 ≤ v n)
    (hstep : ∀ n, c * Real.sqrt (v (n + 1)) ≤ v n)
    (hseed : ∀ᶠ n in atTop, κ ≤ v n) :
    c ^ 2 ≤ v 0 := by
  let u : ℕ → ℝ := fun n => v n / c ^ 2
  have hu (n : ℕ) : 0 ≤ u n := div_nonneg (hv n) (sq_nonneg _)
  have hrec (n : ℕ) : u (n + 1) ≤ (u n) ^ 2 := by
    rw [show u n ^ 2 = v n ^ 2 / c ^ 2 / c ^ 2 by dsimp [u]; ring]
    apply div_le_div_of_nonneg_right _ (sq_nonneg _)
    apply (le_div_iff₀ (sq_pos_of_pos hc)).2
    have hs := pow_le_pow_left₀ (by positivity : 0 ≤ c * Real.sqrt (v (n + 1))) (hstep n) 2
    simpa only [mul_pow, Real.sq_sqrt (hv (n + 1)), mul_comm] using hs
  by_contra! h0
  have hu0 : u 0 < 1 := (div_lt_one (sq_pos_of_pos hc)).2 h0
  have hpow (n : ℕ) : u n ≤ u 0 ^ (n + 1) := by
    induction n with
    | zero => simp
    | succ n ih =>
      have hle : u n ≤ u 0 :=
        ih.trans (by
          rw [pow_succ]
          exact mul_le_of_le_one_left (hu 0) (pow_le_one₀ (hu 0) hu0.le))
      calc
        u (n + 1) ≤ u n ^ 2 := hrec n
        _ ≤ u 0 ^ (n + 1) * u 0 := by
          rw [pow_two]
          exact mul_le_mul ih hle (hu n) (pow_nonneg (hu 0) _)
        _ = _ := (pow_succ _ _).symm
  have ht : Tendsto (fun n : ℕ => u 0 ^ (n + 1)) atTop (𝓝 0) :=
    (tendsto_pow_atTop_nhds_zero_of_lt_one (hu 0) hu0).comp
      (tendsto_add_atTop_nat 1)
  have he : ∀ᶠ n in atTop, u 0 ^ (n + 1) < κ / c ^ 2 :=
    ht.eventually (gt_mem_nhds (div_pos hκ (sq_pos_of_pos hc)))
  obtain ⟨n, hn, hn'⟩ := (hseed.and he).exists
  exact (not_lt_of_ge (div_le_div_of_nonneg_right hn (sq_nonneg _)))
    ((hpow n).trans_lt hn')

/-- A ball cutoff inequality on the physical metric yields the manuscript's
positive lower volume ratio. The infinitesimal seed is supplied by the
pinned smooth small-ball theorem for each individual metric. -/
private theorem bourBallVolume_lower_of_cutoff_coefficient (hd : Module.finrank ℝ E = 4)
    (g : SmoothRiemannianMetric I M) {y A C : ℝ} (hy : 0 < y) (hA : 0 < A) (hC : 0 ≤ C)
    (hcut : ∀ x : M, ∀ r : ℝ, 0 < r → r ≤ 1 →
      y * Real.sqrt (bourBallVolume g x (r / 2)) ≤
        (A / r ^ 2 + C) * bourBallVolume g x r)
    (x : M) {r : ℝ} (hr : 0 < r) (hr1 : r ≤ 1) :
    (y / (4 * (A + C))) ^ 2 * r ^ 4 ≤ bourBallVolume g x r := by
  let μ := riemannianVolumeMeasure I M g
  let : IsFiniteMeasureOnCompacts μ := riemannianVolumeMeasure_isFiniteMeasureOnCompacts g
  have hf (s : Set M) : μ s ≠ (⊤ : ℝ≥0∞) := measure_ne_top μ s
  obtain ⟨ρ, κ, hρ, hκ, hsmall⟩ := exists_uniform_small_ball_volume_lower_bound g
  let d : ℕ → ℝ := fun n => r / 2 ^ n
  have hdpos (n : ℕ) : 0 < d n := div_pos hr (by positivity)
  have hd1 (n : ℕ) : d n ≤ 1 := hr1.trans' (div_le_self hr.le (one_le_pow₀ (by norm_num)))
  have hds (n : ℕ) : d (n + 1) = d n / 2 := by
    simp only [d, pow_succ, div_div]
  let v : ℕ → ℝ := fun n => bourBallVolume g x (d n) / d n ^ 4
  have hv (n : ℕ) : 0 ≤ v n := div_nonneg ENNReal.toReal_nonneg (by positivity)
  have hseed : ∀ᶠ n in atTop, κ ≤ v n := by
    have ht : Tendsto d atTop (𝓝 0) := by
      have hhalf : ∀ n : ℕ, d n = r * (1 / 2 : ℝ) ^ n := by
        intro n
        simp only [d, div_eq_mul_inv, one_mul, inv_pow]
      simpa only [← hhalf, mul_zero] using
        (tendsto_pow_atTop_nhds_zero_of_lt_one (by norm_num : (0 : ℝ) ≤ 1 / 2)
          (by norm_num)).const_mul r
    filter_upwards [ht.eventually (gt_mem_nhds hρ)] with n hn
    specialize hsmall x (d n) (hdpos n) hn.le
    rw [hd] at hsmall
    apply (le_div_iff₀ (pow_pos (hdpos n) 4)).2
    have hh := ENNReal.toReal_mono (hf _) hsmall
    simpa only [ENNReal.toReal_mul, ENNReal.toReal_pow, ENNReal.toReal_ofReal hκ.le,
      ENNReal.toReal_ofReal (hdpos n).le, bourBallVolume, Measure.real_def] using hh
  have hCpos : 0 < A + C := by linarith
  let c := y / (4 * (A + C))
  have hc : 0 < c := div_pos hy (by positivity)
  have hstep (n : ℕ) : c * Real.sqrt (v (n + 1)) ≤ v n := by
    let s := d n
    have hs : 0 < s := hdpos n
    have hV : 0 ≤ bourBallVolume g x s := ENNReal.toReal_nonneg
    have hcoef : A / s ^ 2 + C ≤ (A + C) / s ^ 2 := by
      apply (le_div_iff₀ (sq_pos_of_pos hs)).2
      have hsq : s ^ 2 ≤ 1 := pow_le_one₀ hs.le (hd1 n)
      have hmul := mul_le_mul_of_nonneg_left hsq hC
      have hid : (A / s ^ 2 + C) * s ^ 2 = A + C * s ^ 2 := by field_simp
      rw [hid]
      linarith only [hmul]
    have hbound := (hcut x s hs (hd1 n)).trans (mul_le_mul_of_nonneg_right hcoef hV)
    change c * Real.sqrt (bourBallVolume g x (d (n + 1)) / d (n + 1) ^ 4) ≤
      bourBallVolume g x s / s ^ 4
    rw [hds]
    change c * Real.sqrt (bourBallVolume g x (s / 2) / (s / 2) ^ 4) ≤ _
    rw [Real.sqrt_div (show 0 ≤ bourBallVolume g x (s / 2) from ENNReal.toReal_nonneg),
      show (s / 2) ^ 4 = ((s / 2) ^ 2) ^ 2 by ring, Real.sqrt_sq (sq_nonneg _)]
    dsimp only [c]
    apply (le_div_iff₀ (pow_pos hs 4)).2
    apply (le_of_mul_le_mul_left (a := (A + C) / s ^ 2) _ (div_pos hCpos (by positivity)))
    calc
      _ = y * Real.sqrt (bourBallVolume g x (s / 2)) := by field_simp; ring
      _ ≤ _ := hbound
  have h := dyadic_sqrt_lower hc hκ hv hstep hseed
  apply (le_div_iff₀ (pow_pos hr 4)).1
  simpa only [v, d, pow_zero, div_one, c] using h

/-- A ball cutoff inequality on the physical metric yields the manuscript's
uniform lower volume ratio. The infinitesimal seed is supplied by the
pinned smooth small-ball theorem for each individual metric. -/
theorem bourBallVolume_lower_of_cutoff (hd : Module.finrank ℝ E = 4)
    (g : SmoothRiemannianMetric I M) {y C : ℝ} (hy : 0 < y) (hC : 0 ≤ C)
    (hcut : ∀ x : M, ∀ r : ℝ, 0 < r → r ≤ 1 →
      y * Real.sqrt (bourBallVolume g x (r / 2)) ≤
        (24 / r ^ 2 + C) * bourBallVolume g x r)
    (x : M) {r : ℝ} (hr : 0 < r) (hr1 : r ≤ 1) :
    (y / (4 * (24 + C))) ^ 2 * r ^ 4 ≤ bourBallVolume g x r :=
  bourBallVolume_lower_of_cutoff_coefficient hd g hy (by norm_num) hC hcut x hr hr1

/-- A positive floor for the actual conformal Yamabe infimum bounds the
Dirichlet form for every nonnegative smooth test on that metric, also
when the test has zeros. -/
theorem bourYamabe_smooth_test [Nonempty M] (hd : Module.finrank ℝ E = 4)
    (g : SmoothRiemannianMetric I M) {y R : ℝ} (hy : 0 < y)
    (hY : y ≤ classYamabeFour hd g) (hR : ∀ x, metricScalarAt g x = R)
    (f : C^∞⟮I, M; ℝ⟯) (hf : ∀ x, 0 ≤ f x) :
    y * Real.sqrt (capFactorVolume g f) ≤
      6 * (∫ x, normGradSqFun g f x ∂riemannianVolumeMeasure I M g) +
        R * ∫ x, f x ^ 2 ∂riemannianVolumeMeasure I M g := by
  let S := range (fun u : C^∞⟮I, M; ℝ⟯ =>
    capTestScalar (conformalMetric g u) / Real.sqrt (capTestVolume (conformalMetric g u)))
  change y ≤ sInf S at hY
  have hBelow : BddBelow S := by
    by_contra h
    rw [Real.sInf_of_not_bddBelow h] at hY
    exact hy.not_ge hY
  have hTest (u : C^∞⟮I, M; ℝ⟯) :
      y * Real.sqrt (capTestVolume (conformalMetric g u)) ≤
        capTestScalar (conformalMetric g u) := by
    let μ := riemannianVolumeMeasure I M (conformalMetric g u)
    let : IsFiniteMeasureOnCompacts μ :=
      riemannianVolumeMeasure_isFiniteMeasureOnCompacts (conformalMetric g u)
    let : μ.IsOpenPosMeasure := riemannianVolumeMeasure_isOpenPosMeasure (conformalMetric g u)
    have hp : 0 < capTestVolume (conformalMetric g u) :=
      ENNReal.toReal_pos (isOpen_univ.measure_pos μ univ_nonempty).ne' (measure_ne_top μ univ)
    exact (le_div_iff₀ (Real.sqrt_pos.mpr hp)).1 (hY.trans (csInf_le hBelow (mem_range_self u)))
  let ε (n : ℕ) : ℝ := 1 / ((n : ℝ) + 1)
  choose u hs hv using fun n : ℕ => exists_capLogTest_of_nonnegativeFactor hd g f hf
    (show 0 < ε n by dsimp [ε]; positivity)
  have hε : Tendsto ε atTop (𝓝 0) := tendsto_one_div_add_atTop_nhds_zero_nat
  have hclose {a : ℕ → ℝ} {b : ℝ} (h : ∀ n, |a n - b| < ε n) :
      Tendsto a atTop (𝓝 b) := by
    rw [Metric.tendsto_nhds]
    intro η hη
    filter_upwards [hε.eventually (gt_mem_nhds hη)] with n hn
    simpa only [Real.dist_eq] using (h n).trans hn
  have hv' := Real.continuous_sqrt.continuousAt.tendsto.comp (hclose hv)
  have h := le_of_tendsto_of_tendsto (hv'.const_mul y) (hclose hs)
    (Eventually.of_forall fun n => hTest (u n))
  convert h using 1
  rw [capFactorScalar_eq_dirichletForm hd, add_comm]
  congr 1
  rw [← integral_const_mul]
  apply integral_congr_ae
  exact Eventually.of_forall fun x => by simp only [← metricScalar_eq_scal, hR]

/-- The physical Sobolev inequality has the same Yamabe floor after a
constant rescaling. The scalar coefficient is divided by the scale. -/
theorem bourYamabe_smooth_test_scale [Nonempty M] (hd : Module.finrank ℝ E = 4)
    (g : SmoothRiemannianMetric I M) {y R a : ℝ} (hy : 0 < y)
    (hY : y ≤ classYamabeFour hd g) (hR : ∀ x, metricScalarAt g x = R) (ha : 0 < a)
    (f : C^∞⟮I, M; ℝ⟯) (hf : ∀ x, 0 ≤ f x) :
    let h := scaleMetric a ha g
    y * Real.sqrt (capFactorVolume h f) ≤
      6 * (∫ x, normGradSqFun h f x ∂riemannianVolumeMeasure I M h) +
        (R / a) * ∫ x, f x ^ 2 ∂riemannianVolumeMeasure I M h := by
  let μ := riemannianVolumeMeasure I M g
  let h := scaleMetric a ha g
  have hVol : riemannianVolumeMeasure I M h = ENNReal.ofReal (a ^ 2) • μ := by
    rw [volume_scaleMetric a ha g, hd, ← ENNReal.ofReal_pow (Real.sqrt_nonneg _)]
    rw [show Real.sqrt a ^ 4 = (Real.sqrt a ^ 2) ^ 2 by ring, Real.sq_sqrt ha.le]
  have h4 : capFactorVolume h f = a ^ 2 * capFactorVolume g f := by
    simp only [capFactorVolume, hVol, integral_smul_measure,
      ENNReal.toReal_ofReal (sq_nonneg _), smul_eq_mul, μ]
  have h2 : (∫ x, f x ^ 2 ∂riemannianVolumeMeasure I M h) = a ^ 2 * ∫ x, f x ^ 2 ∂μ := by
    simp only [hVol, integral_smul_measure, ENNReal.toReal_ofReal (sq_nonneg _), smul_eq_mul]
  have hG : (∫ x, normGradSqFun h f x ∂riemannianVolumeMeasure I M h) =
      a * ∫ x, normGradSqFun g f x ∂μ := by
    simp only [hVol, integral_smul_measure, ENNReal.toReal_ofReal (sq_nonneg _), smul_eq_mul,
      h, normGradSqFun_scaleMetric, integral_const_mul]
    field_simp
  change y * Real.sqrt (capFactorVolume h f) ≤
    6 * (∫ x, normGradSqFun h f x ∂riemannianVolumeMeasure I M h) +
      R / a * ∫ x, f x ^ 2 ∂riemannianVolumeMeasure I M h
  rw [h4, h2, hG, Real.sqrt_mul (sq_nonneg _), Real.sqrt_sq ha.le]
  convert mul_le_mul_of_nonneg_left (bourYamabe_smooth_test hd g hy hY hR f hf) ha.le using 1
  · ring
  · dsimp only [μ]
    field_simp

/-- A fixed slope for the smooth cutoff profile, used for all metrics. -/
def bourCutoffSlope : ℝ := 1 + 8 * Analysis.CutoffProfile.derivBound

private theorem bourCutoffSlope_pos : 0 < bourCutoffSlope := by
  unfold bourCutoffSlope
  linarith [Analysis.CutoffProfile.derivBound_nonneg]

private theorem bourSmoothBallCutoff [PreconnectedSpace M]
    (g : SmoothRiemannianMetric I M) (x : M) {r : ℝ} (hr : 0 < r) (hr1 : r ≤ 1) :
    ∃ f : C^∞⟮I, M; ℝ⟯, (∀ z, f z ∈ Icc 0 1) ∧
      (∀ z ∈ riemannianBallOf g x (r / 2), f z = 1) ∧
      (∀ z ∉ riemannianBallOf g x r, f z = 0 ∧ normGradSqFun g f z = 0) ∧
      (∀ z, normGradSqFun g f z ≤ (bourCutoffSlope / r) ^ 2) := by
  let R := 3 * r / 4
  have hR : 0 < R := by dsimp [R]; positivity
  have hRr : R < r := by dsimp [R]; linarith
  let L : ℝ≥0 := ⟨1 / R, by positivity⟩
  let F := radialDistanceCutoff g x R
  let B := riemannianBallOf g x r
  have hclosed : IsClosed (riemannianClosedBallOf g x R) :=
    isClosed_le (continuous_riemannianEDist g x) continuous_const
  have hcomp := hclosed.isCompact
  have hsub : tsupport F ⊆ B := by
    have hsupp : Function.support F ⊆ riemannianClosedBallOf g x R := by
      intro z hz
      by_contra hOut
      exact hz (radialDistanceCutoff_eq_zero_of_not_mem_closedBall g x hR hOut)
    intro z hz
    exact lt_of_le_of_lt (closure_minimal hsupp hclosed hz)
      ((ENNReal.ofReal_lt_ofReal_iff hr).2 hRr)
  obtain ⟨u, hu, _, huSupp, huClose, huDeriv⟩ :=
    Geometry.exists_contMDiff_approximation_of_lipschitz_hasCompactSupport (L := L) g
      (fun v w => by rw [← ENNReal.ofReal_coe_nnreal]; exact edist_radialDistanceCutoff_le g x hR v w)
      (hasCompactSupport_radialDistanceCutoff g x hR hcomp)
      (isOpen_lt (continuous_riemannianEDist g x) continuous_const) hsub
      (show 0 < (1 / 12 : ℝ) by norm_num)
  let φ : ℝ → ℝ := fun t => Analysis.CutoffProfile.value (2 - 4 * t)
  let f : C^∞⟮I, M; ℝ⟯ := ⟨φ ∘ u,
    (Analysis.CutoffProfile.contDiff.contMDiff.comp
      (contMDiff_const.sub (contMDiff_const.mul hu)))⟩
  have hzero : φ 0 = 0 := Analysis.CutoffProfile.zero_of_two_le (by norm_num)
  refine ⟨f, fun z => Analysis.CutoffProfile.mem_Icc _, ?_, ?_, ?_⟩
  · intro z hz
    have hdist : (riemannianEDistOf g x z).toReal < r / 2 :=
      (ENNReal.toReal_lt_toReal (riemannianEDistOf_ne_top g x z) ENNReal.ofReal_ne_top).2 hz
        |>.trans_eq (ENNReal.toReal_ofReal (by positivity))
    have hF : 1 / 3 ≤ F z := by
      apply le_trans _ (le_max_right _ _)
      change 1 / 3 ≤ 1 - (riemannianEDistOf g x z).toReal / R
      rw [le_sub_comm, div_le_iff₀ hR]
      dsimp [R]
      linarith
    have hPos : 1 / 4 ≤ u z := by linarith [(abs_lt.mp (huClose z)).1]
    exact Analysis.CutoffProfile.one_of_le_one (by linarith)
  · intro z hz
    have hLocal : u =ᶠ[𝓝 z] fun _ => (0 : ℝ) := by
      filter_upwards [(isClosed_tsupport u).isOpen_compl.mem_nhds (fun h => hz (huSupp h))] with w hw
      by_contra! hn
      exact hw (subset_tsupport u hn)
    have hLocal' : (f : M → ℝ) =ᶠ[𝓝 z] fun _ => (0 : ℝ) :=
      hLocal.mono fun w hw => by change φ (u w) = 0; rw [hw]; exact hzero
    exact ⟨hLocal'.eq_of_nhds, normGradSqFun_eq_zero_iff.2 (by
      rw [hLocal'.mfderiv_eq, mfderiv_const]; rfl)⟩
  · intro z
    have hDeriv (t : ℝ) : HasDerivAt φ
        (deriv Analysis.CutoffProfile.value (2 - 4 * t) * (-4)) t := by
      have ht : HasDerivAt (fun q : ℝ => 2 - 4 * q) (-4) t := by
        convert (hasDerivAt_const t (2 : ℝ)).sub ((hasDerivAt_id t).const_mul 4) using 1 <;> first | rfl | norm_num
      exact ((Analysis.CutoffProfile.contDiff.differentiable (by simp) _).hasDerivAt).comp t ht
    have hChain := mfderiv_comp z (hDeriv (u z)).hasFDerivAt.hasMFDerivAt.mdifferentiableAt
      (hu.mdifferentiable (by simp) z)
    have hm (v : TangentSpace I z) :
        (show ℝ from mfderiv I 𝓘(ℝ) f z v) =
          deriv Analysis.CutoffProfile.value (2 - 4 * u z) * (-4) *
            (show ℝ from mfderiv I 𝓘(ℝ) u z v) := by
      change (show ℝ from mfderiv I 𝓘(ℝ) (φ ∘ u) z v) = _
      rw [hChain, mfderiv_eq_fderiv, (hDeriv (u z)).hasFDerivAt.fderiv]
      exact mul_comm _ _
    let v := gradFun g f z
    have hn : 0 ≤ normGradSqFun g f z := normGradSqFun_nonneg g f z
    have hL : (L : ℝ) + 1 / 12 ≤ 2 / r := by
      change 1 / R + 1 / 12 ≤ 2 / r
      have he : 1 / R = (4 / 3) / r := by dsimp [R]; field_simp
      rw [he]
      apply (le_div_iff₀ hr).2
      have he' : ((4 / 3 : ℝ) / r + 1 / 12) * r = 4 / 3 + r / 12 := by
        field_simp
      rw [he']
      linarith
    have hb : normGradSqFun g f z ≤ (bourCutoffSlope / r) *
        Real.sqrt (normGradSqFun g f z) := by
      have he : (show ℝ from mfderiv I 𝓘(ℝ) f z v) = normGradSqFun g f z :=
        (inner_gradFun g f z v).symm
      calc
        _ = |(show ℝ from mfderiv I 𝓘(ℝ) f z v)| := by rw [he, abs_of_nonneg hn]
        _ = |deriv Analysis.CutoffProfile.value (2 - 4 * u z)| * 4 *
              |(show ℝ from mfderiv I 𝓘(ℝ) u z v)| := by
          rw [hm, abs_mul, abs_mul]
          norm_num
        _ ≤ Analysis.CutoffProfile.derivBound * 4 *
              (((L : ℝ) + 1 / 12) * Real.sqrt (normGradSqFun g f z)) := by
          exact mul_le_mul (mul_le_mul_of_nonneg_right
            (Analysis.CutoffProfile.abs_deriv_le_derivBound _) (by norm_num)) (huDeriv z v)
            (abs_nonneg _) (mul_nonneg Analysis.CutoffProfile.derivBound_nonneg (by norm_num))
        _ ≤ (bourCutoffSlope / r) * Real.sqrt (normGradSqFun g f z) := by
          rw [← mul_assoc]
          apply mul_le_mul_of_nonneg_right _ (Real.sqrt_nonneg _)
          calc
            _ ≤ Analysis.CutoffProfile.derivBound * 4 * (2 / r) :=
              mul_le_mul_of_nonneg_left hL (mul_nonneg Analysis.CutoffProfile.derivBound_nonneg (by norm_num))
            _ ≤ bourCutoffSlope / r := by
              rw [le_div_iff₀ hr]
              unfold bourCutoffSlope
              field_simp
              linarith
    by_cases hs : Real.sqrt (normGradSqFun g f z) = 0
    · rw [← Real.sq_sqrt hn, hs, zero_pow (by decide)]
      positivity
    · have hb' : Real.sqrt (normGradSqFun g f z) ≤ bourCutoffSlope / r := by
        have hpos : 0 < Real.sqrt (normGradSqFun g f z) :=
          lt_of_le_of_ne (Real.sqrt_nonneg _) (Ne.symm hs)
        apply le_of_mul_le_mul_right _ hpos
        rw [← pow_two, Real.sq_sqrt hn]
        exact hb
      rw [← Real.sq_sqrt hn]
      exact pow_le_pow_left₀ (Real.sqrt_nonneg _) hb' 2

/-- Uniform physical noncollapse in both stationary gauges, using the smooth
radial cutoff profile. The same constant applies to every metric with the
same Yamabe floor and scalar ceiling, and to all scale factors at least one. -/
theorem bourBallVolume_lower_of_yamabe_scale [Nonempty M] [PreconnectedSpace M]
    (hd : Module.finrank ℝ E = 4) (g : SmoothRiemannianMetric I M) {y R C a : ℝ}
    (hy : 0 < y) (hY : y ≤ classYamabeFour hd g) (hR : ∀ x, metricScalarAt g x = R)
    (hR0 : 0 ≤ R) (hRC : R ≤ C) (ha : 0 < a) (ha1 : 1 ≤ a)
    (x : M) {r : ℝ} (hr : 0 < r) (hr1 : r ≤ 1) :
    (y / (4 * (6 * bourCutoffSlope ^ 2 + C))) ^ 2 * r ^ 4 ≤
      bourBallVolume (scaleMetric a ha g) x r := by
  let h := scaleMetric a ha g
  let μ := riemannianVolumeMeasure I M h
  let : IsFiniteMeasureOnCompacts μ := riemannianVolumeMeasure_isFiniteMeasureOnCompacts h
  have hC : 0 ≤ C := hR0.trans hRC
  have hA : 0 < 6 * bourCutoffSlope ^ 2 := mul_pos (by norm_num) (sq_pos_of_pos bourCutoffSlope_pos)
  have hopen (z : M) (s : ℝ) : IsOpen (riemannianBallOf h z s) :=
    isOpen_lt (continuous_riemannianEDist h z) continuous_const
  have hRC' : R / a ≤ C := (div_le_self hR0 ha1).trans hRC
  refine bourBallVolume_lower_of_cutoff_coefficient hd h hy hA hC ?_ x hr hr1
  intro z s hs hs1
  let B := riemannianBallOf h z s
  let Bhalf := riemannianBallOf h z (s / 2)
  have hB : MeasurableSet B := (hopen z s).measurableSet
  have hBhalf : MeasurableSet Bhalf := (hopen z (s / 2)).measurableSet
  obtain ⟨f, hf, hfOne, hfOutside, hfGrad⟩ := bourSmoothBallCutoff h z hs hs1
  have hL : bourBallVolume h z (s / 2) ≤ capFactorVolume h f := by
    change μ.real Bhalf ≤ ∫ w, f w ^ 4 ∂μ
    rw [← integral_indicator_one hBhalf]
    apply integral_mono ((integrable_const 1).indicator hBhalf)
      ((f.contMDiff.continuous.pow 4).integrable_of_hasCompactSupport
        (HasCompactSupport.of_compactSpace _))
    intro w
    by_cases hw : w ∈ Bhalf
    · simp [Set.indicator_of_mem hw, hfOne w hw]
    · simp [Set.indicator_of_notMem hw, pow_nonneg (hf w).1]
  have hUpper {F : M → ℝ} (hF : Continuous F) {K : ℝ}
      (hin : ∀ w, F w ≤ K) (hout : ∀ w ∉ B, F w = 0) :
      (∫ w, F w ∂μ) ≤ K * bourBallVolume h z s := by
    change (∫ w, F w ∂μ) ≤ K * μ.real B
    rw [mul_comm, ← smul_eq_mul, ← integral_indicator_const K hB]
    apply integral_mono (hF.integrable_of_hasCompactSupport (HasCompactSupport.of_compactSpace _))
      ((integrable_const K).indicator hB)
    intro w
    by_cases hw : w ∈ B
    · simpa [Set.indicator_of_mem hw] using hin w
    · simp [Set.indicator_of_notMem hw, hout w hw]
  have hG := hUpper (normGradSqFun_continuous h f.contMDiff) hfGrad (fun w hw => (hfOutside w hw).2)
  have h2 := hUpper (f.contMDiff.continuous.pow 2)
    (fun w => pow_le_one₀ (hf w).1 (hf w).2) (fun w hw => by simp [(hfOutside w hw).1])
  have hV : 0 ≤ bourBallVolume h z s := ENNReal.toReal_nonneg
  calc
    y * Real.sqrt (bourBallVolume h z (s / 2)) ≤ y * Real.sqrt (capFactorVolume h f) :=
      mul_le_mul_of_nonneg_left (Real.sqrt_le_sqrt hL) hy.le
    _ ≤ 6 * (∫ w, normGradSqFun h f w ∂μ) + (R / a) * ∫ w, f w ^ 2 ∂μ :=
      bourYamabe_smooth_test_scale hd g hy hY hR ha f (fun w => (hf w).1)
    _ ≤ 6 * ((bourCutoffSlope / s) ^ 2 * bourBallVolume h z s) +
        (R / a) * (1 * bourBallVolume h z s) :=
      add_le_add (mul_le_mul_of_nonneg_left hG (by norm_num))
        (mul_le_mul_of_nonneg_left h2 (div_nonneg hR0 ha.le))
    _ ≤ (6 * bourCutoffSlope ^ 2 / s ^ 2 + C) * bourBallVolume h z s := by
      rw [one_mul, div_pow, ← mul_assoc, ← add_mul, mul_div_assoc]
      exact mul_le_mul_of_nonneg_right (add_le_add_right hRC' _) hV

omit [I.Boundaryless] [T2Space M] [CompactSpace M] in
/-- The covariant trace-free Ricci components are unchanged by constant
rescaling in four dimensions. -/
theorem bourTraceFreeRicci_scale (g : SmoothRiemannianMetric I M)
    {a : ℝ} (ha : 0 < a) (x : M) (v w : TangentSpace I x) :
    metricRicciAt (scaleMetric a ha g) x ![v, w] -
      metricScalarAt (scaleMetric a ha g) x / 4 * (scaleMetric a ha g).inner x v w =
    metricRicciAt g x ![v, w] - metricScalarAt g x / 4 * g.inner x v w := by
  rw [metricRicciAt_scaleMetric, metricScalarAt_scaleMetric, scaleMetric_inner]
  field_simp

omit [I.Boundaryless] in
/-- The total physical volume has weight two, including at a curvature
maximum rescaling of a unit-volume metric. -/
theorem bourVolume_scale (hd : Module.finrank ℝ E = 4)
    (g : SmoothRiemannianMetric I M) {a : ℝ} (ha : 0 < a) :
    capTestVolume (scaleMetric a ha g) = a ^ 2 * capTestVolume g := by
  unfold capTestVolume
  rw [Measure.real_def, volume_scale_apply, hd, ENNReal.toReal_mul, ENNReal.toReal_pow,
    ENNReal.toReal_ofReal (Real.sqrt_nonneg _)]
  rw [show Real.sqrt a ^ 4 = (Real.sqrt a ^ 2) ^ 2 by ring, Real.sq_sqrt ha.le]
  rfl

end SmoothPoincare
