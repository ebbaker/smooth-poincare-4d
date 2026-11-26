import SmoothPoincare.Variational.TransportedChargedDisk
import DifferentialGeometry.Analysis.Integration.Measure.VolumeDensityIntegrability

/-! # The signed endpoint measure tested against the incoming volume -/

noncomputable section
open DifferentialGeometry DifferentialGeometry.Integral.Measure FirstOrderTwistor SectionsAndConnections
open Set MeasureTheory Manifold
open scoped ContDiff Manifold

namespace SmoothPoincare
local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "I₄" => 𝓘(ℝ,E₄)
variable {H N : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H}
  [TopologicalSpace N] [ChartedSpace H N] [IsManifold I ∞ N] [T2Space N] [CompactSpace N]
  {o : ManifoldOrientation I N 4}
private local instance : MeasurableSpace N := borel N
private local instance : BorelSpace N := ⟨rfl⟩

/-- Measure the actual joint density, including the varying volume ratio
inside the integral, in a fixed reference metric on the marked carrier. -/
theorem signedCharge_le_incomingDensity_mul_volume (g q : SignedCollarMetric o)
    (sg : CollarChirality) {A : Set N} (hA : MeasurableSet A) {D : ℝ}
    (hD : ∀ x ∈ A, riemannianVolumeDensity g.metric q.metric x *
      hilbertSchmidtSq (signedCollarWeylBlock o q.metric q.frame sg x) ≤ D) :
    q.charge sg A ≤ D * (riemannianVolumeMeasure I N g.metric).real A := by
  let f := fun x => hilbertSchmidtSq (signedCollarWeylBlock o q.metric q.frame sg x)
  let μ := riemannianVolumeMeasure I N g.metric
  let : IsFiniteMeasureOnCompacts μ := riemannianVolumeMeasure_isFiniteMeasureOnCompacts g.metric
  have hf := ((integrable_riemannianVolumeMeasure_iff g.metric q.metric f).mp (q.integrable sg)).integrableOn (s := A)
  rw [SignedCollarMetric.charge, SignedCollarMetric.chiralMeasure, energyMeasure_real_apply hA
    (q.integrable sg).integrableOn (Filter.Eventually.of_forall fun x =>
      Finset.sum_nonneg fun i _ => Finset.sum_nonneg fun j _ => sq_nonneg _)]
  rw [riemannianVolumeMeasure_eq_withDensity g.metric q.metric,
    setIntegral_withDensity_eq_setIntegral_toReal_smul
      (riemannianVolumeDensity_contMDiff g.metric q.metric).continuous.measurable.ennreal_ofReal
      (Filter.Eventually.of_forall fun _ => ENNReal.ofReal_lt_top) _ hA]
  simp only [ENNReal.toReal_ofReal (riemannianVolumeDensity_pos g.metric q.metric _).le]
  calc
    _ ≤ ∫ _ in A, D ∂μ := setIntegral_mono_on hf (integrable_const D).integrableOn hA hD
    _ = _ := by simp [μ, mul_comm]

/-- Shrinking the support of a charged transport forces the supremum of
the signed endpoint density in the original volume gauge to grow. -/
theorem transportedDisk_fixedGauge_floor [I.Boundaryless] (g q : SignedCollarMetric o)
    (F : PartialDiffeomorph I₄ I E₄ N ∞) (hF : Metric.closedBall (0:E₄) 1 ⊆ F.source)
    (sg : CollarChirality) {A : Set N} (hA : MeasurableSet A)
    (hAV : A ⊆ (interior (selectedChartDisk F))ᶜ)
    (hOutside : q.charge sg ((interior (selectedChartDisk F))ᶜ \ A) =
      g.charge sg ((interior (selectedChartDisk F))ᶜ \ A))
    (hZero : q.charge sg (selectedChartDisk F) = 0) {η D : ℝ}
    (hSlack : g.energy .plus - η ≤ q.energy .plus)
    (hD : ∀ x ∈ A, riemannianVolumeDensity g.metric q.metric x *
      hilbertSchmidtSq (signedCollarWeylBlock o q.metric q.frame sg x) ≤ D)
    (hVol : 0 < (riemannianVolumeMeasure I N g.metric).real A) :
    (g.charge sg (selectedChartDisk F) - η + g.charge sg A) /
      (riemannianVolumeMeasure I N g.metric).real A ≤ D := by
  let V := (interior (selectedChartDisk F))ᶜ
  have split (p : SignedCollarMetric o) : p.charge sg A + p.charge sg (V \ A) = p.charge sg V := by
    have hUnion : A ∪ V = V := Set.union_eq_right.mpr hAV
    exact (measureReal_add_sdiff (μ := p.chiralMeasure sg) (s := A) (t := V) hA).trans
      (congrArg (fun S => (p.chiralMeasure sg).real S) hUnion)
  have hv (p : SignedCollarMetric o) : p.charge sg V =
      p.energy .plus - p.charge sg (selectedChartDisk F) := signedCharge_fullMarkedExterior p sg F hF
  change q.charge sg (V \ A) = g.charge sg (V \ A) at hOutside
  apply (div_le_iff₀ hVol).2
  linarith only [split q, split g, hv q, hv g, hOutside, hZero, hSlack,
    signedCharge_le_incomingDensity_mul_volume g q sg hA hD]

end SmoothPoincare
