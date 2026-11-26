import SmoothPoincare.Variational.CapTestTransfer
import DifferentialGeometry.Analysis.Integration.Measure.Conformal
import DifferentialGeometry.Geometry.Curvature.CurvatureOperator.Identities.ContractedBianchi
import DifferentialGeometry.Geometry.Metric.Conformal.Curvature
import DifferentialGeometry.Geometry.Operator.LaplacianExponential
import DifferentialGeometry.Geometry.Operator.LaplacianRegularity
import Mathlib.Analysis.SpecialFunctions.Log.Deriv

/-! # Nonnegative marked test factors and genuine joined conformal metrics -/

open DifferentialGeometry DifferentialGeometry.Geometry.Connection
open DifferentialGeometry.Geometry.Curvature DifferentialGeometry.Geometry.Operator
open DifferentialGeometry.Integral.Measure FirstOrderTwistor Filter MeasureTheory Set
open scoped ContDiff Manifold Topology

namespace SmoothPoincare

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M] [CompactSpace M]

local instance : MeasurableSpace M := borel M
local instance : BorelSpace M := ⟨rfl⟩

/-- The four-dimensional conformal scalar numerator evaluated on a smooth
factor, including factors with zeros. Integration by parts gives the
usual scalar and Dirichlet form on this closed metric. -/
noncomputable def capFactorScalar (g : SmoothRiemannianMetric I M) (f : C^∞⟮I, M; ℝ⟯) : ℝ :=
  ∫ x, scalarCurv g x * f x ^ 2 - 6 * f x * laplacian (LeviCivita g) g f x
    ∂riemannianVolumeMeasure I M g

/-- The fourth-power mass of a smooth factor, which may vanish on an open set. -/
noncomputable def capFactorVolume (g : SmoothRiemannianMetric I M) (f : C^∞⟮I, M; ℝ⟯) : ℝ :=
  ∫ x, f x ^ 4 ∂riemannianVolumeMeasure I M g

/-- The smooth positive factor of the log-conformal metric. -/
noncomputable def capExpFactor (u : C^∞⟮I, M; ℝ⟯) : C^∞⟮I, M; ℝ⟯ :=
  ⟨fun x => Real.exp (u x), Real.contDiff_exp.contMDiff.comp u.contMDiff⟩

theorem capTestScalar_eq_capFactorScalar (hd : Module.finrank ℝ E = 4)
    (g : SmoothRiemannianMetric I M) (u : C^∞⟮I, M; ℝ⟯) :
    capTestScalar (conformalMetric g u) = capFactorScalar g (capExpFactor u) := by
  let : NeZero (Module.finrank ℝ E) := ⟨by rw [hd]; decide⟩
  unfold capTestScalar capFactorScalar
  rw [integral_conformalMetric_eq_integral_smul_exp]
  apply integral_congr_ae
  filter_upwards [] with x
  have hu : ContMDiffAt I 𝓘(ℝ, ℝ) 2 (u : M → ℝ) x := u.contMDiff.contMDiffAt.of_le (by simp)
  change Real.exp ((Module.finrank ℝ E : ℝ) * u x) *
    metricScalarAt (conformalMetric g u) x =
      scalarCurv g x * Real.exp (u x) ^ 2 -
        6 * Real.exp (u x) * laplacian (LeviCivita g) g (fun y => Real.exp (u y)) x
  rw [metricScalar_eq_scal, scalarCurv_conformalMetric, laplacian_exp _ _ hu, hd]
  norm_num
  change Real.exp (4 * u x) * (Real.exp (-(2 * u x)) *
    (scalarCurv g x - 6 * laplacian (LeviCivita g) g u x -
      6 * (g.inner x (gradientFun g u x) (gradientFun g u x)))) =
    scalarCurv g x * Real.exp (u x) ^ 2 - 6 * Real.exp (u x) *
      (Real.exp (u x) * (laplacian (LeviCivita g) g u x +
        g.inner x (gradientFun g u x) (gradientFun g u x)))
  rw [← mul_assoc, ← Real.exp_add, show 4 * u x + -(2 * u x) = u x + u x by ring,
    Real.exp_add]
  ring

omit [I.Boundaryless] in
theorem capTestVolume_eq_capFactorVolume (hd : Module.finrank ℝ E = 4)
    (g : SmoothRiemannianMetric I M) (u : C^∞⟮I, M; ℝ⟯) :
    capTestVolume (conformalMetric g u) = capFactorVolume g (capExpFactor u) := by
  unfold capTestVolume capFactorVolume
  have hOne : (∫ _x, (1 : ℝ) ∂riemannianVolumeMeasure I M (conformalMetric g u)) =
      (riemannianVolumeMeasure I M (conformalMetric g u)).real univ := by simp
  rw [← hOne, integral_conformalMetric_eq_integral_smul_exp]
  apply integral_congr_ae
  filter_upwards [] with x
  change Real.exp ((Module.finrank ℝ E : ℝ) * u x) * 1 = Real.exp (u x) ^ 4
  rw [mul_one, ← Real.exp_nat_mul, hd]

private theorem capFactorScalar_continuous_const_add
    (g : SmoothRiemannianMetric I M) (f : C^∞⟮I, M; ℝ⟯) :
    Continuous (fun ε : ℝ => capFactorScalar g (.const ε + f)) := by
  let μ := riemannianVolumeMeasure I M g
  let : IsFiniteMeasureOnCompacts μ := riemannianVolumeMeasure_isFiniteMeasureOnCompacts g
  have hL (ε : ℝ) (x : M) :
      laplacian (LeviCivita g) g (fun y => ε + f y) x = laplacian (LeviCivita g) g f x := by
    have hf : ContMDiffAt I 𝓘(ℝ, ℝ) 2 (f : M → ℝ) x := f.contMDiff.contMDiffAt.of_le (by simp)
    exact laplacian_add_const _ _ _ (Eventually.of_forall fun y =>
      f.contMDiff.contMDiffAt.mdifferentiableAt (by simp))
      ((gradientFun_contMDiffAt_one g hf).mdifferentiableAt one_ne_zero)
  have hR := (scalarCurv_contMDiff g).continuous
  have hD := (contMDiff_laplacian_leviCivita g f.contMDiff).continuous
  have hf := f.contMDiff.continuous
  let F : ℝ → M → ℝ := fun ε x =>
    scalarCurv g x * (ε + f x) ^ 2 - 6 * (ε + f x) * laplacian (LeviCivita g) g f x
  have hF : Continuous (Function.uncurry F) := by
    exact ((hR.comp continuous_snd).mul ((continuous_fst.add (hf.comp continuous_snd)).pow 2)).sub
      ((continuous_const.mul (continuous_fst.add (hf.comp continuous_snd))).mul
        (hD.comp continuous_snd))
  have h := continuous_parametric_integral_of_continuous (μ := μ) hF isCompact_univ
  have hEq (ε : ℝ) : capFactorScalar g (.const ε + f) = ∫ x in univ, F ε x ∂μ := by
    rw [setIntegral_univ, capFactorScalar]
    apply integral_congr_ae
    filter_upwards [] with x
    change scalarCurv g x * (ε + f x) ^ 2 -
      6 * (ε + f x) * laplacian (LeviCivita g) g (fun y => ε + f y) x = F ε x
    rw [hL]
  simpa only [hEq] using h

omit [I.Boundaryless] in
private theorem capFactorVolume_continuous_const_add
    (g : SmoothRiemannianMetric I M) (f : C^∞⟮I, M; ℝ⟯) :
    Continuous (fun ε : ℝ => capFactorVolume g (.const ε + f)) := by
  let μ := riemannianVolumeMeasure I M g
  let : IsFiniteMeasureOnCompacts μ := riemannianVolumeMeasure_isFiniteMeasureOnCompacts g
  have hf := f.contMDiff.continuous
  let F : ℝ → M → ℝ := fun ε x => (ε + f x) ^ 4
  have hF : Continuous (Function.uncurry F) :=
    (continuous_fst.add (hf.comp continuous_snd)).pow 4
  change Continuous (fun ε : ℝ => ∫ x, (ε + f x) ^ 4 ∂μ)
  simpa only [setIntegral_univ, F] using
    (continuous_parametric_integral_of_continuous (μ := μ) hF isCompact_univ)

/-- A compactly supported nonnegative transplant can vanish on the rest of the
joined source. Adding a sufficiently small positive constant and taking its
log gives a genuine smooth conformal test with both prescribed errors. -/
theorem exists_capLogTest_of_nonnegativeFactor (hd : Module.finrank ℝ E = 4)
    (g : SmoothRiemannianMetric I M) (f : C^∞⟮I, M; ℝ⟯) (hf : ∀ x, 0 ≤ f x)
    {ε : ℝ} (hε : 0 < ε) :
    ∃ u : C^∞⟮I, M; ℝ⟯,
      |capTestScalar (conformalMetric g u) - capFactorScalar g f| < ε ∧
      |capTestVolume (conformalMetric g u) - capFactorVolume g f| < ε := by
  have hs := (capFactorScalar_continuous_const_add g f).continuousAt (x := 0)
  have hv := (capFactorVolume_continuous_const_add g f).continuousAt (x := 0)
  obtain ⟨δs, hδs, hs⟩ := Metric.continuousAt_iff.mp hs ε hε
  obtain ⟨δv, hδv, hv⟩ := Metric.continuousAt_iff.mp hv ε hε
  let δ := min δs δv / 2
  have hδ : 0 < δ := half_pos (lt_min hδs hδv)
  have hδs' : δ < δs := (half_lt_self (lt_min hδs hδv)).trans_le (min_le_left _ _)
  have hδv' : δ < δv := (half_lt_self (lt_min hδs hδv)).trans_le (min_le_right _ _)
  let w : C^∞⟮I, M; ℝ⟯ := .const δ + f
  have hw (x : M) : 0 < w x := add_pos_of_pos_of_nonneg hδ (hf x)
  let u : C^∞⟮I, M; ℝ⟯ := ⟨fun x => Real.log (w x), by
    intro x
    exact (Real.contDiffAt_log.2 (hw x).ne').contMDiffAt.comp x w.contMDiff.contMDiffAt⟩
  have he : capExpFactor u = w := by ext x; exact Real.exp_log (hw x)
  have h0 : (.const 0 + f : C^∞⟮I, M; ℝ⟯) = f := by
    ext x
    exact zero_add (f x)
  have hDist : dist δ 0 = δ := by rw [Real.dist_eq, sub_zero, abs_of_pos hδ]
  refine ⟨u, ?_, ?_⟩
  · rw [capTestScalar_eq_capFactorScalar hd, he]
    simpa only [w, Real.dist_eq, h0] using hs (x := δ) (by rwa [hDist])
  · rw [capTestVolume_eq_capFactorVolume hd, he]
    simpa only [w, Real.dist_eq, h0] using hv (x := δ) (by rwa [hDist])

variable {F K X P : Type*} [NormedAddCommGroup F] [NormedSpace ℝ F] [FiniteDimensional ℝ F]
  [TopologicalSpace K] {J : ModelWithCorners ℝ F K} [J.Boundaryless]
  [TopologicalSpace X] [ChartedSpace K X] [IsManifold J ∞ X] [T2Space X] [CompactSpace X]

/-- For each truncated test, regularize only after selecting its finite joined
metric. The smoothing size may depend on that metric and on the test. -/
theorem hasJoinedCapTests_of_transplantedFactors (dM : Module.finrank ℝ E = 4)
    (dX : Module.finrank ℝ F = 4)
    (joined : P → SmoothRiemannianMetric I M) (cap : SmoothRiemannianMetric J X)
    (hTransplant : ∀ (u : C^∞⟮J, X; ℝ⟯) (ε : ℝ), 0 < ε →
      ∃ (t : P) (f : C^∞⟮I, M; ℝ⟯), (∀ x, 0 ≤ f x) ∧
        |capFactorScalar (joined t) f - capFactorScalar cap (capExpFactor u)| < ε ∧
        |capFactorVolume (joined t) f - capFactorVolume cap (capExpFactor u)| < ε) :
    HasJoinedCapTests joined cap := by
  intro u
  let a (n : ℕ) : ℝ := 1 / ((n : ℝ) + 1)
  have ha (n : ℕ) : 0 < a n := by dsimp [a]; positivity
  choose t f hf hs hv using fun n => hTransplant u (a n) (ha n)
  choose v hs' hv' using fun n =>
    exists_capLogTest_of_nonnegativeFactor dM (joined (t n)) (f n) (hf n) (ha n)
  have hZero : Tendsto (fun n => a n + a n) atTop (𝓝 (0 : ℝ)) := by
    have h : Tendsto a atTop (𝓝 (0 : ℝ)) := tendsto_one_div_add_atTop_nhds_zero_nat
    simpa only [zero_add] using h.add h
  have hErrors {b c : ℕ → ℝ} {z : ℝ}
      (h₁ : ∀ n, |b n - c n| < a n) (h₂ : ∀ n, |c n - z| < a n) :
      Tendsto b atTop (𝓝 z) := by
    rw [Metric.tendsto_nhds]
    intro ε hε
    filter_upwards [hZero.eventually (gt_mem_nhds hε)] with n hn
    rw [Real.dist_eq]
    calc
      |b n - z| = |(b n - c n) + (c n - z)| := by ring_nf
      _ ≤ |b n - c n| + |c n - z| := abs_add_le _ _
      _ < a n + a n := add_lt_add (h₁ n) (h₂ n)
      _ < ε := hn
  refine ⟨t, v, ?_, ?_⟩
  · rw [capTestScalar_eq_capFactorScalar dX]
    exact hErrors hs' hs
  · rw [capTestVolume_eq_capFactorVolume dX]
    exact hErrors hv' hv

end SmoothPoincare
