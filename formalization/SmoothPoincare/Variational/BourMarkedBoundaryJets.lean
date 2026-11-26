import SmoothPoincare.Variational.BourALEBoundary
import DifferentialGeometry.Analysis.Integration.Measure.VolumeDensity
import DifferentialGeometry.Geometry.Operator.MetricComparison
import DifferentialGeometry.Geometry.Metric.RicciSoliton.Models

/-!
# Physical boundary jets on a normalized Bour end

26 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance.
Actual serving model and effort are unavailable.
-/

noncomputable section

open DifferentialGeometry DifferentialGeometry.Geometry.Operator
  DifferentialGeometry.Integral.Measure FirstOrderTwistor Filter MeasureTheory
open scoped ContDiff Manifold Topology ENNReal

namespace SmoothPoincare

section Shapes

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [FiniteDimensional ℝ E] [NeZero (Module.finrank ℝ E)] [TopologicalSpace H]
  {I : ModelWithCorners ℝ E H} [TopologicalSpace M] [ChartedSpace H M]
  [IsManifold I ∞ M] [T2Space M] [I.Boundaryless] [BoundarylessManifold I M]

omit [NeZero (Module.finrank ℝ E)] [T2Space M] [I.Boundaryless] [BoundarylessManifold I M] in
/-- Compare the dual norm of one fixed defining differential in two metrics. -/
private theorem gradientLength_unit_error
    (g h : SmoothRiemannianMetric I M) (u : M → ℝ) (x : M) {ε : ℝ}
    (hε : 0 ≤ ε) (hSmall : ε ≤ 1 / 2)
    (hUnit : g.inner x (gradientFun g u x) (gradientFun g u x) = 1)
    (hForm : ∀ v : TangentSpace I x, |h.inner x v v - g.inner x v v| ≤ ε * g.inner x v v) :
    let a := Real.sqrt (h.inner x (gradientFun h u x) (gradientFun h u x))
    |a - 1| ≤ 2 * ε ∧ 1 / 2 ≤ a := by
  let a := Real.sqrt (h.inner x (gradientFun h u x) (gradientFun h u x))
  have ha : 0 ≤ a := Real.sqrt_nonneg _
  have haSq : a ^ 2 = h.inner x (gradientFun h u x) (gradientFun h u x) :=
    Real.sq_sqrt (metric_inner_self_nonneg h x _)
  have hLow (v : TangentSpace I x) : (1 - ε) * g.inner x v v ≤ h.inner x v v := by
    have hv := (abs_le.mp (hForm v)).1
    linarith
  have hHigh (v : TangentSpace I x) : h.inner x v v ≤ (1 + ε) * g.inner x v v := by
    have hv := (abs_le.mp (hForm v)).2
    linarith
  have hFactor : 0 < 1 - ε := by linarith
  have hUpper := inner_gradFun_le_of_metric_lower_bound g h u x (1 - ε)⁻¹
    (fun v => by
      rw [← div_eq_inv_mul]
      exact (le_div_iff₀ hFactor).mpr (by simpa only [mul_comm] using hLow v))
  have hLower := inner_gradFun_le_of_metric_lower_bound h g u x (1 + ε) hHigh
  change h.inner x (gradientFun h u x) (gradientFun h u x) ≤
    (1 - ε)⁻¹ * g.inner x (gradientFun g u x) (gradientFun g u x) at hUpper
  change g.inner x (gradientFun g u x) (gradientFun g u x) ≤
    (1 + ε) * h.inner x (gradientFun h u x) (gradientFun h u x) at hLower
  rw [hUnit, ← haSq, mul_one, ← one_div] at hUpper
  rw [hUnit, ← haSq] at hLower
  have hUpper' : a ^ 2 * (1 - ε) ≤ 1 := (le_div_iff₀ hFactor).mp hUpper
  have hSquareBound : a ^ 2 ≤ 2 := hUpper.trans
    ((div_le_iff₀ hFactor).mpr (by linarith))
  have hSquareErr : |a ^ 2 - 1| ≤ 2 * ε := by
    have hm := mul_le_mul_of_nonneg_left hSquareBound hε
    exact abs_le.mpr ⟨by linarith, by linarith⟩
  have hAbsFactor : |a ^ 2 - 1| = |a - 1| * (a + 1) := by
    rw [show a ^ 2 - 1 = (a - 1) * (a + 1) by ring, abs_mul,
      abs_of_nonneg (by positivity : 0 ≤ a + 1)]
  change |a - 1| ≤ 2 * ε ∧ 1 / 2 ≤ a
  constructor
  · rw [hAbsFactor] at hSquareErr
    exact le_trans (by nlinarith only [mul_nonneg (abs_nonneg (a - 1)) ha]) hSquareErr
  · by_contra! h
    have haQuarter : a ^ 2 ≤ 1 / 4 := by nlinarith only [ha, h, sq_nonneg (a - 1 / 2)]
    have hProd := mul_le_mul_of_nonneg_right (show 1 + ε ≤ 3 / 2 by linarith)
      (sq_nonneg a)
    linarith

/-- On a unit reference level where the reference Hessian is the reference
metric on the tangent frame, normalized shape follows from zeroth and first
metric comparison. The connection input is the difference of the two actual
Levi–Civita connections, measured in the reference metric. -/
theorem bourLevelShapeMatrix_error_of_metricComparison
    (g h : SmoothRiemannianMetric I M) (u : M → ℝ) (hu : ContMDiff I 𝓘(ℝ) ∞ u)
    (x : M) (o : ManifoldOrientation I M 4) (frame : OrientedOrthonormalFrameAt h o x)
    {ε : ℝ} (hε : 0 ≤ ε) (hSmall : ε ≤ 1 / 2)
    (hUnit : g.inner x (gradientFun g u x) (gradientFun g u x) = 1)
    (hRef : ∀ i j : Fin 3,
      hessFun g u x (frame.basis i.succ) (frame.basis j.succ) =
        g.inner x (frame.basis i.succ) (frame.basis j.succ))
    (hForm : ∀ v w : TangentSpace I x,
      |h.inner x v w - g.inner x v w| ≤
        ε * Real.sqrt (g.inner x v v) * Real.sqrt (g.inner x w w))
    (hConnection : ∀ v w : TangentSpace I x,
      let A := DifferentialGeometry.PDE.DeTurck.connectionDifference h g x w v
      Real.sqrt (g.inner x A A) ≤
        ε * Real.sqrt (g.inner x v v) * Real.sqrt (g.inner x w w))
    (i j : Fin 3) :
    |bourLevelShapeMatrix h u x o frame i j - (1 : Matrix (Fin 3) (Fin 3) ℝ) i j| ≤
      20 * ε := by
  have hQuadratic (v : TangentSpace I x) :
      |h.inner x v v - g.inner x v v| ≤ ε * g.inner x v v := by
    simpa only [mul_assoc, Real.mul_self_sqrt (metric_inner_self_nonneg g x v)] using hForm v v
  have hFrameNorm (a : Fin 4) : Real.sqrt (g.inner x (frame.basis a) (frame.basis a)) ≤ 2 := by
    have h := (abs_le.mp (hQuadratic (frame.basis a))).1
    rw [frame.orthonormal, ite_eq_left rfl] at h
    have hG : g.inner x (frame.basis a) (frame.basis a) ≤ 2 := by
      have hProd := mul_le_mul_of_nonneg_right hSmall (metric_inner_self_nonneg g x (frame.basis a))
      linarith
    exact Real.sqrt_le_left (by norm_num) |>.mpr (by linarith)
  let v := frame.basis i.succ
  let w := frame.basis j.succ
  let δ := (1 : Matrix (Fin 3) (Fin 3) ℝ) i j
  let a := Real.sqrt (h.inner x (gradientFun h u x) (gradientFun h u x))
  have hDelta : h.inner x v w = δ := by
    simp [v, w, δ, frame.orthonormal, Matrix.one_apply]
  have hAbsDelta : |δ| ≤ 1 := by
    rcases eq_or_ne i j with hij | hij <;> simp [δ, Matrix.one_apply, hij]
  obtain ⟨hGradError, hGradLow⟩ := gradientLength_unit_error g h u x hε hSmall hUnit hQuadratic
  change |a - 1| ≤ 2 * ε at hGradError
  change 1 / 2 ≤ a at hGradLow
  have hPositive : 0 < a := by linarith
  have hFactor :
      ε * Real.sqrt (g.inner x v v) * Real.sqrt (g.inner x w w) ≤ 4 * ε := by
    calc
      _ ≤ ε * 2 * 2 := by
        gcongr
        · exact hFrameNorm i.succ
        · exact hFrameNorm j.succ
      _ = _ := by ring
  have hHess : |hessFun h u x v w - g.inner x v w| ≤ 4 * ε := by
    have hv := abs_hessFun_sub_le_of_connectionDifference_bound g h u hu x v w ε (hConnection v w)
    change |hessFun h u x v w - hessFun g u x v w| ≤
      ε * Real.sqrt (g.inner x (gradientFun g u x) (gradientFun g u x)) *
        Real.sqrt (g.inner x v v) * Real.sqrt (g.inner x w w) at hv
    rw [hRef i j, hUnit, Real.sqrt_one, mul_one] at hv
    exact hv.trans hFactor
  have hNumerator : |hessFun h u x v w - a * δ| ≤ 10 * ε := by
    rw [show hessFun h u x v w - a * δ =
      (hessFun h u x v w - g.inner x v w) +
        (g.inner x v w - h.inner x v w) - (a - 1) * δ by rw [hDelta]; ring]
    have hMetric := (hForm v w).trans hFactor
    have hMetric' : |g.inner x v w - h.inner x v w| ≤ 4 * ε := by
      rwa [abs_sub_comm]
    have hMixed : |(a - 1) * δ| ≤ 2 * ε := by
      rw [abs_mul]
      simpa using mul_le_mul hGradError hAbsDelta (abs_nonneg δ) (by positivity : 0 ≤ 2 * ε)
    linarith only [abs_sub ((hessFun h u x v w - g.inner x v w) + (g.inner x v w - h.inner x v w)) ((a - 1) * δ), abs_add_le (hessFun h u x v w - g.inner x v w)
      (g.inner x v w - h.inner x v w), hHess, hMetric', hMixed]
  change |hessFun h u x v w / a - δ| ≤ _
  rw [div_sub' hPositive.ne', abs_div, abs_of_pos hPositive]
  apply (div_le_iff₀ hPositive).mpr
  exact hNumerator.trans (by nlinarith only [hGradLow, hε, mul_nonneg hε (sub_nonneg.mpr hGradLow)])

end Shapes

section InducedArea

variable {F K L : Type*} [NormedAddCommGroup F] [NormedSpace ℝ F]
  [FiniteDimensional ℝ F] [TopologicalSpace K] {J : ModelWithCorners ℝ F K}
  [TopologicalSpace L] [ChartedSpace K L] [IsManifold J ∞ L]
  [T2Space L] [SigmaCompactSpace L]

/-- In link dimension three the actual induced volume ratio is controlled by
relative quadratic-form bounds. The ratio uses the two physical link metrics. -/
theorem bourLinkAreaDensity_error_of_quadraticComparison
    (round induced : SmoothRiemannianMetric J L) (z : L)
    (hDim : Module.finrank ℝ F = 3) {ε : ℝ} (hε : 0 ≤ ε) (hSmall : ε ≤ 1 / 2)
    (hForm : ∀ v : TangentSpace J z,
      |induced.inner z v v - round.inner z v v| ≤ ε * round.inner z v v) :
    |riemannianVolumeDensity round induced z - 1| ≤ 3 * ε := by
  let j := riemannianVolumeDensity round induced z
  let j' := riemannianVolumeDensity induced round z
  have hPos : 0 < j := riemannianVolumeDensity_pos round induced z
  have hMul : j * j' = 1 := riemannianVolumeDensity_mul_swap round induced z
  have hLow (v : TangentSpace J z) : (1 - ε) * round.inner z v v ≤ induced.inner z v v := by
    have hv := (abs_le.mp (hForm v)).1
    linarith
  have hHigh (v : TangentSpace J z) : induced.inner z v v ≤ (1 + ε) * round.inner z v v := by
    have hv := (abs_le.mp (hForm v)).2
    linarith
  have hUpper := riemannianVolumeDensity_le_of_inner_le round induced
    (show 0 < 1 + ε by linarith) z hHigh
  have hRecip : 1 ≤ (1 - ε)⁻¹ := by
    rw [← one_div]
    exact (le_div_iff₀ (by linarith : 0 < 1 - ε)).mpr (by linarith)
  have hPosFactor : 0 < 1 - ε := by linarith
  have hReverse := riemannianVolumeDensity_le_of_inner_le induced round
    (inv_pos.mpr hPosFactor) z (fun v => by
      rw [← div_eq_inv_mul]
      exact (le_div_iff₀ (by linarith : 0 < 1 - ε)).mpr (by simpa only [mul_comm] using hLow v))
  have hSqrt {Q : ℝ} (hQ : 1 ≤ Q) : Real.sqrt (Q ^ 3) ≤ Q ^ 2 := by
    apply (Real.sqrt_le_left (sq_nonneg Q)).mpr
    have hProd : 0 ≤ (Q - 1) * Q ^ 3 :=
      mul_nonneg (sub_nonneg.mpr hQ) (pow_nonneg (by linarith) 3)
    linarith only [show (Q - 1) * Q ^ 3 = (Q ^ 2) ^ 2 - Q ^ 3 by ring, hProd]
  rw [hDim] at hUpper hReverse
  have hJUpper : j ≤ (1 + ε) ^ 2 := hUpper.trans (hSqrt (by linarith))
  have hJReverse : j' ≤ ((1 - ε)⁻¹) ^ 2 := hReverse.trans (hSqrt hRecip)
  have hJLower : (1 - ε) ^ 2 ≤ j := by
    have hm := mul_le_mul_of_nonneg_left hJReverse hPos.le
    rw [hMul, inv_pow, ← div_eq_mul_inv] at hm
    apply (le_div_iff₀ (pow_pos hPosFactor 2)).mp at hm
    simpa only [one_mul] using hm
  change |j - 1| ≤ _
  exact abs_le.mpr ⟨by nlinarith [sq_nonneg ε], by nlinarith [mul_nonneg hε (show 0 ≤ 1 - ε by linarith)]⟩

end InducedArea

end SmoothPoincare
