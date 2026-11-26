import SmoothPoincare.Variational.IntrinsicTerminalCharge
import DifferentialGeometry.Geometry.Curvature.Bounds.MetricDerivatives
import DifferentialGeometry.Geometry.Metric.Convergence.Curvature.RicciFromJets
import DifferentialGeometry.Geometry.Metric.Convergence.CovariantDerivative.Continuity
import DifferentialGeometry.Geometry.Flow.RicciFlow.Uniqueness.Forward.Data.UniformBounds

/-! # The trace-free Ricci density from the metric two-jet in a fixed buffer -/

open DifferentialGeometry DifferentialGeometry.CheegerGromovCompactness
  DifferentialGeometry.Geometry.Curvature DifferentialGeometry.Tensor0SBundle
  DifferentialGeometry.PDE.RicciFlow Filter Set
open scoped Manifold ContDiff Topology

noncomputable section
namespace SmoothPoincare

variable {E H M : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
  [NeZero (Module.finrank ℝ E)] [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [I.Boundaryless] [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [T2Space M] [SigmaCompactSpace M] [BoundarylessManifold I M]

private local instance : CompleteSpace E := FiniteDimensional.complete ℝ E
private local instance : IsManifold I 1 M := IsManifold.of_le (n := ∞) (by decide)
private local instance : IsManifold I 2 M := IsManifold.of_le (n := ∞) (by decide)

/-- On a fixed compact comparison set, second-order metric convergence gives pointwise
convergence and an eventual uniform upper bound for the actual trace-free Ricci square.
The scalar coefficient is the four-dimensional normalization. -/
theorem terminalTraceFreeRicciSq_of_twoJets
    (g : SmoothRiemannianMetric I M) (h : ℕ → SmoothRiemannianMetric I M)
    {K : Set M} (hK : IsCompact K)
    (hjet : ∀ ε > (0 : ℝ), ∀ᶠ i in atTop, ∀ x ∈ K, ∀ a ≤ 2,
      metricDerivNorm a (h i) g g x < ε) :
    (∀ x ∈ K, Tendsto (fun i => intrinsicTraceFreeRicciSq (h i) x) atTop
      (𝓝 (intrinsicTraceFreeRicciSq g x))) ∧
    ∃ B : ℝ, ∀ᶠ i in atTop, ∀ x ∈ K, intrinsicTraceFreeRicciSq (h i) x ≤ B := by
  let n : ℝ := Module.finrank ℝ E
  have hn : 0 ≤ n := Nat.cast_nonneg _
  let δ : ℝ := (2 * (n+1))⁻¹
  have hδ : 0 < δ := inv_pos.mpr (by positivity)
  have hδn : n * δ ≤ 1/2 := by
    dsimp [δ]
    rw [← div_eq_mul_inv, div_le_iff₀ (by positivity : 0 < 2 * (n+1))]
    linarith
  have hδ₁ : δ ≤ 1 := by
    rw [show δ = 1 / (2 * (n+1)) by simp [δ], div_le_iff₀ (by positivity : 0 < 2 * (n+1))]
    linarith
  obtain ⟨C₀,h₀⟩ := metricCovDerivNorm_le_of_isCompact 0 g g hK
  obtain ⟨C₁,h₁⟩ := metricCovDerivNorm_le_of_isCompact 1 g g hK
  obtain ⟨C₂,h₂⟩ := metricCovDerivNorm_le_of_isCompact 2 g g hK
  let B := max 0 (max C₀ (max C₁ C₂)) + 1
  have hB : 0 ≤ B := by dsimp [B]; linarith [le_max_left 0 (max C₀ (max C₁ C₂))]
  have hbg (x) (hx : x ∈ K) (a : ℕ) (ha : a ≤ 2) :
      metricCovDerivNorm a g g x ≤ B-1 := by
    have hb : max C₀ (max C₁ C₂) ≤ B-1 := by dsimp [B]; linarith [le_max_right 0 (max C₀ (max C₁ C₂))]
    interval_cases a
    · exact (h₀ x hx).trans ((le_max_left ..).trans hb)
    · exact (h₁ x hx).trans ((le_max_left ..).trans ((le_max_right ..).trans hb))
    · exact (h₂ x hx).trans ((le_max_right ..).trans ((le_max_right ..).trans hb))
  have hgood : ∀ᶠ i in atTop, ∀ x ∈ K,
      (∀ v : TangentSpace I x, (2:ℝ)⁻¹ * g.inner x v v ≤ (h i).inner x v v ∧
        (h i).inner x v v ≤ 2 * g.inner x v v) ∧
      (∀ a ≤ 2, metricCovDerivNorm a (h i) g x ≤ B) := by
    filter_upwards [hjet δ hδ] with i hi
    intro x hx
    constructor
    · intro v
      have hh := metricQuadFormDiff_le_metricDerivNorm (h i) g g x v
      change |(h i).inner x v v - g.inner x v v| ≤ n * metricDerivNorm 0 (h i) g g x * g.inner x v v at hh
      have hbase := metric_inner_self_nonneg g x v
      have hsmall := (mul_le_mul_of_nonneg_left (hi x hx 0 (by decide)).le hn).trans hδn
      have hbound := abs_le.mp (hh.trans (mul_le_mul_of_nonneg_right hsmall hbase))
      constructor <;> linarith [hbound.1,hbound.2]
    · intro a ha
      have hdiff := (hi x hx a ha).le.trans hδ₁
      linarith [hbg x hx a ha,covNorm_le_add a (h i) g g x]
  have heq (u : SmoothRiemannianMetric I M) (x : M) :
      intrinsicTraceFreeRicciSq u x = normSq0S u x 2 (metricRicci u x) - metricScalarAt u x ^ 2 / 4 := by
    unfold intrinsicTraceFreeRicciSq intrinsicCurvatureSq intrinsicEulerDensity
    rw [metricRicci_apply]
    ring
  constructor
  · intro x hx
    have conv (F : SmoothRiemannianMetric I M → ℝ)
        (hlip : ∃ C > (0:ℝ), ∀ u u' : SmoothRiemannianMetric I M,
          (∀ v : TangentSpace I x, (2:ℝ)⁻¹ * g.inner x v v ≤ u.inner x v v) →
          (∀ v : TangentSpace I x, (2:ℝ)⁻¹ * g.inner x v v ≤ u'.inner x v v) →
          (∀ a ≤ 2, metricCovDerivNorm a u g x ≤ B) →
          (∀ a ≤ 2, metricCovDerivNorm a u' g x ≤ B) →
          |F u - F u'| ≤ C * ∑ a ∈ Finset.range 3, metricDerivNorm a u u' g x) :
        Tendsto (fun i => F (h i)) atTop (𝓝 (F g)) := by
      obtain ⟨C,hC,hLip⟩ := hlip
      apply Metric.tendsto_nhds.mpr
      intro ε hε
      have hd : 0 < ε / (3*C) := div_pos hε (by positivity)
      filter_upwards [hgood,hjet _ hd] with i hi hij
      have hs := hLip (h i) g (fun v => ((hi x hx).1 v).1)
        (fun v => by linarith [metric_inner_self_nonneg g x v]) (hi x hx).2
        (fun a ha => (hbg x hx a ha).trans (by linarith))
      rw [Finset.sum_range_succ,Finset.sum_range_succ,Finset.sum_range_one] at hs
      have hsum : metricDerivNorm 0 (h i) g g x + metricDerivNorm 1 (h i) g g x +
          metricDerivNorm 2 (h i) g g x < 3 * (ε/(3*C)) := by
        linarith [hij x hx 0 (by decide),hij x hx 1 (by decide),hij x hx 2 (by decide)]
      rw [Real.dist_eq]
      exact hs.trans_lt ((mul_lt_mul_of_pos_left hsum hC).trans_eq (by field_simp))
    simp_rw [heq]
    exact (conv _ (ricNormSub_le_dn g x _ B (by norm_num) hB)).sub
      (((conv _ (scalarSub_le_dNorm g x _ B (by norm_num) hB)).pow 2).div_const 4)
  · obtain ⟨C,hC,hcurv⟩ := exists_pos_bound_intrinsic_curvature_derivative_on_compact_of_metric_jets
      g hK 0 2 B (by norm_num) hB
    refine ⟨n^4*C^2, ?_⟩
    filter_upwards [hgood] with i hi
    intro x hx
    have hRm := hcurv (h i) x hx (hi x hx).1 (hi x hx).2
    change Real.sqrt (normSq0S (h i) x 4 (metricRm04At (h i) x)) ≤ C at hRm
    have hRsq := Real.le_sq_of_sqrt_le hRm
    have hRic := ricciSq_le_rm04 (h i) (h i) x
    change normSq0S (h i) x 2 (metricRicciAt (h i) x) ≤ n^4 * normSq0S (h i) x 4 (metricRm04At (h i) x) at hRic
    rw [heq,metricRicci_apply]
    exact (sub_le_self _ (by positivity)).trans (hRic.trans (mul_le_mul_of_nonneg_left hRsq (by positivity)))

end SmoothPoincare
