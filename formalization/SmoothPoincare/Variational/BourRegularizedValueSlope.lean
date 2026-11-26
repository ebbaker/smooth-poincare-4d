import SmoothPoincare.Variational.BourSecondExtraction

/-! # The post-attainment right slope of the positive regularized value

Prepared for Edward B. Baker III with OpenAI Codex assistance, 26 November 2026.
A single whole least-Ricci return of fixed-parameter minimizers suffices for the slope.
-/

open DifferentialGeometry DifferentialGeometry.Geometry.Curvature DifferentialGeometry.Integral.Measure
  Filter FirstOrderTwistor MeasureTheory Set
open scoped ContDiff Manifold Topology

namespace SmoothPoincare.Bour

noncomputable section

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H}
  [I.Boundaryless] [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [T2Space M] [CompactSpace M] [Nonempty M] {o : ManifoldOrientation I M 4}

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

local notation "W₀" => sInf (geometricPositiveEnergies o)
local notation "J" => fun p => sInf (bourRegularizedPositiveValues o p)

/-- On the entered type, the secants of the infimum of affine physical
functionals decrease in the parameter. The competitor at the lower
parameter need not attain the infimum. -/
theorem bourRegularized_secant_antitone (w : SignedCollarMetric o)
    (hw : 0 < classYamabeFour o.dimension_eq w.metric) {s t : ℝ}
    (hs : 0 < s) (hst : s ≤ t) (ht : t ≤ 1) :
    (J t - 2 * W₀) / t ≤ (J s - 2 * W₀) / s := by
  have htpos := hs.trans_le hst
  have hbound : 2 * W₀ + (s / t) * (J t - 2 * W₀) ≤ J s := by
    apply le_csInf (show (bourRegularizedPositiveValues o s).Nonempty from ⟨bourEnergy s w,w,hw,rfl⟩)
    rintro _ ⟨g,hg,rfl⟩
    have hupper := bourRegularizedInfimum_le htpos.le ht g hg
    have hmin := bourInfimum_le_energy g hg
    rw [bourEnergy_eq_chiral_ricci] at hupper ⊢
    have h₁ := mul_nonneg (sub_nonneg.mpr hst) (sub_nonneg.mpr hmin)
    have h₂ := mul_le_mul_of_nonneg_left hupper hs.le
    field_simp [htpos.ne']
    nlinarith only [h₁,h₂]
  apply (div_le_div_iff₀ htpos hs).2
  have h := mul_le_mul_of_nonneg_right hbound htpos.le
  field_simp [htpos.ne'] at h
  linarith

/-- One sequence of genuine fixed-parameter minima whose ordinary Ricci
energy returns to that of an exact comparator determines the right secant
limit of the entire value function. No selection at other parameters is used. -/
theorem bourRegularized_value_rightSlope_of_oneReturn
    (w : SignedCollarMetric o) (hw : 0 < classYamabeFour o.dimension_eq w.metric)
    (hW : w.energy .plus = W₀)
    (q : ℕ → SignedCollarMetric o) (p : ℕ → ℝ) (hp : ∀ n, 0 < p n)
    (hp₁ : ∀ n, p n < 1)
    (hy : ∀ n, 0 < classYamabeFour o.dimension_eq (q n).metric)
    (hmin : ∀ n, bourEnergy (p n) (q n) = J (p n))
    (hD : Tendsto (fun n => bourRicci (q n)) atTop (𝓝 (bourRicci w))) :
    Tendsto (fun t => (J t - 2 * W₀) / t) (𝓝[>] 0) (𝓝 (bourRicci w / 2 - 2 * W₀)) := by
  have hupper (t : ℝ) (ht : 0 < t) (ht1 : t ≤ 1) :
      (J t - 2 * W₀) / t ≤ bourRicci w / 2 - 2 * W₀ := by
    have h := bourRegularizedInfimum_le ht.le ht1 w hw
    rw [bourEnergy_eq_chiral_ricci, hW] at h
    apply (div_le_iff₀ ht).2
    linarith
  have hlower (n : ℕ) : bourRicci (q n) / 2 - 2 * W₀ ≤ (J (p n) - 2 * W₀) / p n := by
    rw [← hmin n, bourEnergy_eq_chiral_ricci]
    apply (le_div_iff₀ (hp n)).2
    have h := mul_nonneg (sub_nonneg.mpr (hp₁ n).le) (sub_nonneg.mpr (bourInfimum_le_energy (q n) (hy n)))
    linarith
  apply tendsto_order.2
  constructor
  · intro lo hlo
    have hnear := ((hD.div_const 2).sub_const (2 * W₀)).eventually (lt_mem_nhds hlo)
    obtain ⟨n,hn⟩ := hnear.exists
    filter_upwards [self_mem_nhdsWithin, mem_nhdsWithin_of_mem_nhds (Iio_mem_nhds (hp n))]
      with t ht ht'
    exact (hn.trans_le (hlower n)).trans_le (bourRegularized_secant_antitone w hw ht (le_of_lt ht') (hp₁ n).le)
  · intro hi hhi
    filter_upwards [self_mem_nhdsWithin, mem_nhdsWithin_of_mem_nhds (Iio_mem_nhds (show (0 : ℝ) < 1 by norm_num))] with t ht ht'
    exact (hupper t ht (le_of_lt ht')).trans_lt hhi

/-- Post-X slope of the positive-class value at zero after both fixed-parameter
extractions. Only one whole positive Yamabe and Bach return of the actual
minimizers is needed, with convergence of its two physical energies. -/
theorem bourRegularizedValue_hasRightDerivative
    {BachFlat : SmoothRiemannianMetric I M → Prop}
    (q : ℕ → SignedCollarMetric o) (w limit : SignedCollarMetric o)
    (p : ℕ → ℝ) (hp : ∀ n, 0 < p n) (hp₁ : ∀ n, p n < 1) (hp0 : Tendsto p atTop (𝓝 0))
    (hw : AttainedYamabeAt BachFlat W₀ w)
    (hleast : IsLeast (bourRicci '' {v : SignedCollarMetric o | AttainedYamabeAt BachFlat W₀ v}) (bourRicci w))
    (hy : ∀ n, 0 < classYamabeFour o.dimension_eq (q n).metric)
    (hmin : ∀ n, bourEnergy (p n) (q n) = J (p n))
    (hyLim : 0 < classYamabeFour o.dimension_eq limit.metric) (hBach : BachFlat limit.metric)
    (hVol : riemannianVolumeMeasure I M limit.metric univ = 1)
    (hCSC : ∀ x, metricScalarAt limit.metric x = classYamabeFour o.dimension_eq limit.metric)
    (hE : Tendsto (fun n => (q n).energy .plus) atTop (𝓝 (limit.energy .plus)))
    (hD : Tendsto (fun n => bourRicci (q n)) atTop (𝓝 (bourRicci limit))) :
    J 0 = 2 * W₀ ∧ HasDerivWithinAt J (bourRicci w / 2 - 2 * W₀) (Ioi 0) 0 := by
  have hJ : J 0 = 2 * W₀ := by
    refine le_antisymm ?_ ?_
    · have h := bourRegularizedInfimum_le (p := 0) le_rfl (by norm_num) w hw.positive
      simpa [bourEnergy_eq_chiral_ricci, hw.plus_eq] using h
    · apply le_csInf (show (bourRegularizedPositiveValues o 0).Nonempty from ⟨_,w,hw.positive,rfl⟩)
      rintro _ ⟨g,hg,rfl⟩
      simpa [bourEnergy_eq_chiral_ricci] using (mul_le_mul_of_nonneg_left (bourInfimum_le_energy g hg) (by norm_num : (0:ℝ) ≤ 2))
  have hret := bourRegularizedMinima_limit_leastRicci q w limit p hp hp₁ hp0 hw hleast
    hy hmin hyLim hBach hVol hCSC hE hD
  have hslope := bourRegularized_value_rightSlope_of_oneReturn w hw.positive hw.plus_eq q p
    hp hp₁ hy hmin (hret.2.1 ▸ hD)
  refine ⟨hJ, (hasDerivWithinAt_iff_tendsto_slope' (show (0:ℝ) ∉ Ioi 0 by simp)).2 ?_⟩
  change sInf (bourRegularizedPositiveValues o 0) = 2 * W₀ at hJ
  exact hslope.congr (fun t => by simp only [slope_def_field, hJ, sub_zero])

end
end SmoothPoincare.Bour
