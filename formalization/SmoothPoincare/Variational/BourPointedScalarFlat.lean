import SmoothPoincare.Variational.BourPointedCutoffs
import SmoothPoincare.Variational.BourPointedVolume
import SmoothPoincare.Variational.BourPointedScalar
import SmoothPoincare.Variational.BourStationaryTrace

/-! # Scalar flatness of a positive-parameter stationary pointed limit

26 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance.
All balls, energies, and volume in this result belong to the same limit metric.
-/

open DifferentialGeometry DifferentialGeometry.Geometry.Operator DifferentialGeometry.Geometry.Curvature
  DifferentialGeometry.Geometry.Riemannian DifferentialGeometry.Integral.Measure Filter Set MeasureTheory
open DifferentialGeometry.Tensor0SBundle DifferentialGeometry.PDE.RicciFlow
open scoped ContDiff ENNReal Manifold Topology

namespace SmoothPoincare.Bour

noncomputable section

variable {E H M : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  [ConnectedSpace M] [SigmaCompactSpace M] [BoundarylessManifold I M]

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

/-- Positive-parameter stationarity with finite scalar-square energy,
compact closed balls, noncompactness, and noncollapse forces zero scalar
curvature on the whole pointed limit. -/
theorem bourPointedStationary_scalarFlat (hDim : Module.finrank ℝ E = 4)
    {p : ℝ} (hp : 0 < p) (g : SmoothRiemannianMetric I M) (o : M)
    (hNoncompact : ¬ IsCompact (univ : Set M))
    (hClosed : ∀ x : M, ∀ r : ℝ, 0 < r → IsCompact (riemannianClosedBallOf g x r))
    {v : ℝ} (hv : 0 < v)
    (hVol : ∀ x : M, v ≤ (riemannianVolumeMeasure I M g).real (riemannianBallOf g x 1))
    (hS : Integrable (fun x => metricScalarAt g x ^ 2) (riemannianVolumeMeasure I M g))
    (hStat : ∀ x, bourCovariantGradient p g x = 0) :
    ∀ x, metricScalarAt g x = 0 := by
  let _ : NeZero (Module.finrank ℝ E) := ⟨by omega⟩
  let R (n : ℕ) : ℝ := (n:ℝ)+1
  have hr (n : ℕ) : 0 < R n := by dsimp [R]; positivity
  have htop : Tendsto R atTop atTop := tendsto_atTop_add_const_right _ 1 tendsto_natCast_atTop_atTop
  choose η hη using fun n : ℕ => bourSmoothPointedBallCutoff g o (hClosed o) (hr n)
  let f : C^∞⟮I, M; ℝ⟯ := ⟨metricScalarAt g, metricScalar_smooth g⟩
  apply bourPointed_harmonic_L2_zero g f
    (fun x => bourStationary_scalarLaplacian_eq_zero hDim hp g x (hStat x)) hS
    (bourPointedVolume_eq_top_of_unit_ball_lower g hNoncompact
      (fun x => hClosed x 2 (by norm_num)) hv hVol) η (fun n => (hη n).1)
  · intro x
    filter_upwards [htop.eventually_gt_atTop (2*(riemannianEDistOf g o x).toReal)] with n hn
    apply (hη n).2.2.2.1
    change riemannianEDistOf g o x < ENNReal.ofReal (R n / 2)
    rw [← ENNReal.ofReal_toReal (riemannianEDistOf_ne_top g o x)]
    exact (ENNReal.ofReal_lt_ofReal_iff (by positivity)).2 (by linarith)
  · simpa using (tendsto_const_nhds.div_atTop htop (a := bourCutoffSlope)).pow 2
  · exact fun n => (hη n).2.2.2.2.2

omit [ConnectedSpace M] [SigmaCompactSpace M] in
/-- Once the scalar vanishes, stationarity passes to zero parameter and
gives the scalar-flat fourth-order Weyl equation in Ricci form on this metric. -/
theorem bourScalarFlat_stationary_zeroParameter (p : ℝ) (g : SmoothRiemannianMetric I M)
    (hs : ∀ y, metricScalarAt g y = 0) (x : M) (hStat : bourCovariantGradient p g x = 0) :
    bourCovariantGradient 0 g x = 0 ∧ ∀ u v : TangentSpace I x,
      roughLap0SField g (metricRicci g) x (vec2 u v) +
        2 * hamiltonCurvatureRicciAt g x (vec2 u v) =
        normSq0S g x 2 (metricRicciAt g x) / 2 * g.inner x u v := by
  have h (u v : TangentSpace I x) := bourCovariantGradient_apply_csc p g 0 hs x u v
  simp only [hStat, Tensor0SSpace.zero_apply, bourBulkDensity, hs, zero_pow (by decide : 2 ≠ 0),
    mul_zero, zero_div, add_zero, zero_mul, sub_zero] at h
  constructor
  · apply tensor0SSpace_ext
    intro w
    have hw : w = vec2 (w 0) (w 1) := by funext i; fin_cases i <;> rfl
    rw [hw, bourCovariantGradient_apply_csc 0 g 0 hs]
    simp only [Tensor0SSpace.zero_apply, bourBulkDensity, hs, zero_pow (by decide : 2 ≠ 0),
      mul_zero, zero_div, add_zero, zero_mul, sub_zero]
    linarith only [h (w 0) (w 1)]
  · intro u v
    linarith only [h u v]

end
end SmoothPoincare.Bour
