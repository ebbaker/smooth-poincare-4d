import SmoothPoincare.Variational.NativePocketFlattening
import SmoothPoincare.Variational.ModifiedFrameDecomposition
import SmoothPoincare.Variational.RetainedScalarDeficit

/-! # Joint scalar and chiral price on the actual changed ball

The ordered curvature norm pays for both chiral Weyl integrals and the
negative scalar part in the metric used for integration. The native
interpolation agrees with the original scalar curvature off its support.
-/

noncomputable section
open DifferentialGeometry DifferentialGeometry.Geometry.Curvature DifferentialGeometry.Integral.Measure
open FirstOrderTwistor SectionsAndConnections MeasureTheory Set Manifold
open scoped ContDiff Manifold Topology

namespace SmoothPoincare

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "I₄" => 𝓘(ℝ,E₄)
variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M] [CompactSpace M]
  {o : ManifoldOrientation I M 4}
private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

/-- The physical scalar part and the two Weyl blocks share one ordered
curvature bound, with the four-dimensional tensor normalization. -/
theorem signedCharges_add_scalarDeficit_on (h : SignedCollarMetric o) {A : Set M}
    (hA : MeasurableSet A) {D : ℝ}
    (hCurv : ∀ x ∈ A, frameTensorNormSq (metricCurvatureFrameTensor h.metric o x (h.frame x)) ≤ D) :
    h.charge .plus A + h.charge .minus A +
        (∫ x in A, (max (-metricScalarAt h.metric x) 0) ^ 2 ∂riemannianVolumeMeasure I M h.metric) / 24 ≤
      D / 4 * (riemannianVolumeMeasure I M h.metric).real A := by
  let μ := riemannianVolumeMeasure I M h.metric
  let : IsFiniteMeasureOnCompacts μ := riemannianVolumeMeasure_isFiniteMeasureOnCompacts h.metric
  let w (s : CollarChirality) (x : M) := hilbertSchmidtSq (signedCollarWeylBlock o h.metric h.frame s x)
  let n (x : M) := (max (-metricScalarAt h.metric x) 0) ^ 2
  have hs : Continuous (metricScalarAt h.metric) :=
    (scalarCurv_contMDiff h.metric).continuous.congr (fun x => (metricScalar_eq_scal h.metric x).symm)
  have hi : Integrable n μ := (hs.neg.max continuous_const |>.pow 2).integrable_of_hasCompactSupport
    (HasCompactSupport.of_compactSpace _)
  have price (s : CollarChirality) : h.charge s A = ∫ x in A, w s x ∂μ :=
    energyMeasure_real_apply hA (h.integrable s).integrableOn
      (Filter.Eventually.of_forall fun x => Finset.sum_nonneg fun _ _ => Finset.sum_nonneg fun _ _ => sq_nonneg _)
  have hw : Integrable (fun x => w .plus x + w .minus x) μ := (h.integrable .plus).add (h.integrable .minus)
  have hpt (x : M) (hx : x ∈ A) : w .plus x + w .minus x + n x / 24 ≤ D / 4 := by
    have hn : n x ≤ metricScalarAt h.metric x ^ 2 := by
      dsimp [n]
      rcases le_total 0 (metricScalarAt h.metric x) with hp | hm
      · rw [max_eq_right (neg_nonpos.mpr hp)]
        simpa using sq_nonneg (metricScalarAt h.metric x)
      · rw [max_eq_left (neg_nonneg.mpr hm), neg_sq]
    have hd := metricFrameTensorNormSq_eq_chiral_ricci_scalar h.metric o x (h.frame x)
    have hr := modifiedChargeDensity_nonneg o h.metric h.frame .ricci x
    change 0 ≤ endpointRicciDefectDensity h.metric o x (h.frame x) at hr
    change _ = 4 * (w .plus x + w .minus x) + _ + _ at hd
    linarith only [hn, hd, hr, hCurv x hx]
  change h.charge .plus A + h.charge .minus A + (∫ x in A, n x ∂μ) / 24 ≤ _
  rw [price, price, ← integral_add (h.integrable .plus).integrableOn (h.integrable .minus).integrableOn,
    ← integral_div, ← integral_add hw.integrableOn (hi.div_const 24).integrableOn]
  calc
    _ ≤ ∫ _ in A, D / 4 ∂μ :=
      setIntegral_mono_on (hw.add (hi.div_const 24)).integrableOn
        (integrable_const _).integrableOn hA hpt
    _ = _ := by simp [μ, mul_comm]

/-- The negative scalar square of a native slice is confined to the changed
ball when the source is scalar-nonnegative outside it. This conclusion
uses the actual collar germ and the same matching outer frames as the
signed price, and includes the entire exterior. -/
theorem nativePocketPath_scalarDeficit_supported (F : PartialDiffeomorph I₄ I E₄ M ∞)
    (g h : SignedCollarMetric o) (R : SmoothRiemannianMetric I M) {r : ℝ} (hr : 0 < r)
    (hS : Metric.closedBall (0 : E₄) (3 * r) ⊆ F.source) (s : Icc (0 : ℝ) 1)
    (hPath : h.metric = nativePocketPath F g.metric R hr hS s)
    (hFrame : ∀ y ∉ F '' Metric.closedBall (0 : E₄) (3 * r), (g.frame y).basis = (h.frame y).basis)
    (hSource : ∀ y ∉ F '' Metric.closedBall (0 : E₄) (3 * r), 0 ≤ metricScalarAt g.metric y) :
    let A := F '' Metric.closedBall (0 : E₄) (3 * r)
    (∫ x, (max (-metricScalarAt h.metric x) 0) ^ 2 ∂riemannianVolumeMeasure I M h.metric) =
      ∫ x in A, (max (-metricScalarAt h.metric x) 0) ^ 2 ∂riemannianVolumeMeasure I M h.metric := by
  intro A
  symm
  apply setIntegral_eq_integral_of_forall_compl_eq_zero
  intro y hy
  have hOff : y ∉ F '' Metric.ball (0 : E₄) (3 * r) :=
    fun hz => hy (image_mono Metric.ball_subset_closedBall hz)
  have hgerm : ∀ᶠ z in 𝓝 y, ∀ v w : TangentSpace I z, g.metric.inner z v w = h.metric.inner z v w := by
    rw [hPath]
    exact (nativePocketPath_outer_germ F g.metric R hr hS s hOff).mono fun z hz v w => (hz v w).symm
  have hsc := signedMetric_scalar_eq_of_germ g h y hgerm (hFrame y hy)
  simp [← hsc, max_eq_right (neg_nonpos.mpr (hSource y hy))]


/-- At one finite radius the full positive-class test and both signed prices
use the same slice. The scalar deficit is paid inside the very same bound
as the Weyl energy. A Yamabe sign detector along the path is unnecessary. -/
theorem nativePocketPath_positive_of_joint_price [Nonempty M]
    (F : PartialDiffeomorph I₄ I E₄ M ∞) (g h : SignedCollarMetric o)
    (R : SmoothRiemannianMetric I M) {r : ℝ} (hr : 0 < r)
    (hS : Metric.closedBall (0 : E₄) (3 * r) ⊆ F.source) (s : Icc (0 : ℝ) 1)
    (hPath : h.metric = nativePocketPath F g.metric R hr hS s)
    (hFrame : ∀ y ∉ F '' Metric.closedBall (0 : E₄) (3 * r), (g.frame y).basis = (h.frame y).basis)
    (hSource : ∀ y ∉ F '' Metric.closedBall (0 : E₄) (3 * r), 0 ≤ metricScalarAt g.metric y)
    {D : ℝ} (hCurv : ∀ x ∈ F '' Metric.closedBall (0 : E₄) (3 * r),
      frameTensorNormSq (metricCurvatureFrameTensor h.metric o x (h.frame x)) ≤ D)
    (hEuler : 48 * (8 * Real.pi ^ 2 - h.energy .plus) ≤ classYamabeFour o.dimension_eq h.metric ^ 2) :
    let A := F '' Metric.closedBall (0 : E₄) (3 * r)
    let cost := D / 4 * (riemannianVolumeMeasure I M h.metric).real A
    (∀ sg, h.energy sg + scalarDeficitSq h.metric / 24 ≤ g.energy sg - g.charge sg A + cost) ∧
    (g.energy .plus - g.charge .plus A + cost < 8 * Real.pi ^ 2 →
      0 < classYamabeFour o.dimension_eq h.metric ∧
      Real.sqrt (48 * (8 * Real.pi ^ 2 - h.energy .plus)) ≤ classYamabeFour o.dimension_eq h.metric ∧
      ∀ sg, h.energy sg < 8 * Real.pi ^ 2) := by
  intro A cost
  have hA : MeasurableSet A := ((isCompact_closedBall _ _).image_of_continuousOn
    (F.contMDiffOn_toFun.continuousOn.mono hS)).measurableSet
  have hlocal := signedCharges_add_scalarDeficit_on h hA hCurv
  have hs : scalarDeficitSq h.metric =
      ∫ x in A, (max (-metricScalarAt h.metric x) 0) ^ 2 ∂riemannianVolumeMeasure I M h.metric :=
    nativePocketPath_scalarDeficit_supported F g h R hr hS s hPath hFrame hSource
  rw [← hs] at hlocal
  have hboth (sg : CollarChirality) :
      h.energy sg + scalarDeficitSq h.metric / 24 ≤ g.energy sg - g.charge sg A + cost := by
    have hchg := nativePocketPath_signed_change F g h R hr hS s hPath hFrame sg
    change h.energy sg - g.energy sg = h.charge sg A - g.charge sg A at hchg
    change _ ≤ cost at hlocal
    have hneg : 0 ≤ h.charge .minus A := measureReal_nonneg
    have hpos : 0 ≤ h.charge .plus A := measureReal_nonneg
    cases sg <;> linarith only [hlocal, hneg, hpos, hchg]
  refine ⟨hboth, ?_⟩
  intro hgap
  have hn : 0 ≤ scalarDeficitSq h.metric := integral_nonneg (fun _ => sq_nonneg _)
  have hbudget := (hboth .plus).trans_lt hgap
  have hY : 0 < classYamabeFour o.dimension_eq h.metric := by
    by_contra! hnon
    have hl := neg_scalarDeficitNorm_le_classYamabeFour o.dimension_eq h.metric
    have hsq := pow_le_pow_left₀ (neg_nonneg.mpr hnon) (neg_le.mp hl) 2
    rw [neg_sq, scalarDeficitNorm_sq] at hsq
    linarith only [hsq, hEuler, hbudget, hn]
  refine ⟨hY, Real.sqrt_le_iff.mpr ⟨hY.le, hEuler⟩, ?_⟩
  have hstrict : h.energy .plus < 8 * Real.pi ^ 2 := by linarith only [hbudget, hn]
  intro sg
  cases sg with
  | plus => exact hstrict
  | minus => exact (show h.energy .minus = h.energy .plus from h.signature_zero.symm).trans_lt hstrict

end SmoothPoincare
