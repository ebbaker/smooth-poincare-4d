import SmoothPoincare.Variational.IncomingChargeDensity

/-! # Consequences of the finite marked tests at shrinking supports and fixed type -/

noncomputable section
open DifferentialGeometry DifferentialGeometry.Integral.Measure FirstOrderTwistor SectionsAndConnections
open Set MeasureTheory Manifold Filter Topology
open scoped ContDiff Manifold

namespace SmoothPoincare
local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "I₄" => 𝓘(ℝ,E₄)
variable {H N : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H} [I.Boundaryless]
  [TopologicalSpace N] [ChartedSpace H N] [IsManifold I ∞ N] [T2Space N] [CompactSpace N]
  {o : ManifoldOrientation I N 4}
private local instance : MeasurableSpace N := borel N
private local instance : BorelSpace N := ⟨rfl⟩

/-- At a single charged smooth index any uniform-in-space ceiling for the
actual outgoing signed density in the incoming volume gauge tends to
infinity as its outer support shrinks, even with a fixed flattening error. -/
theorem transportedDisk_density_tendsto_top (g : SignedCollarMetric o)
    (F : PartialDiffeomorph I₄ I E₄ N ∞) (hF : Metric.closedBall (0:E₄) 1 ⊆ F.source)
    (sg : CollarChirality) (q : ℕ → SignedCollarMetric o) (A : ℕ → Set N) (B : ℕ → ℝ)
    {η : ℝ} (hm : η < g.charge sg (selectedChartDisk F))
    (hA : ∀ n, MeasurableSet (A n)) (hAV : ∀ n, A n ⊆ (interior (selectedChartDisk F))ᶜ)
    (hOutside : ∀ n, (q n).charge sg ((interior (selectedChartDisk F))ᶜ \ A n) =
      g.charge sg ((interior (selectedChartDisk F))ᶜ \ A n))
    (hZero : ∀ n, (q n).charge sg (selectedChartDisk F) = 0)
    (hSlack : ∀ n, g.energy .plus - η ≤ (q n).energy .plus)
    (hB : ∀ n, ∀ x ∈ A n, riemannianVolumeDensity g.metric (q n).metric x *
      hilbertSchmidtSq (signedCollarWeylBlock o (q n).metric (q n).frame sg x) ≤ B n)
    (hVol : ∀ n, 0 < (riemannianVolumeMeasure I N g.metric).real (A n))
    (hSmall : Tendsto (fun n => (riemannianVolumeMeasure I N g.metric).real (A n)) atTop (𝓝 0)) :
    Tendsto B atTop atTop := by
  apply tendsto_atTop.2
  intro b
  have hm' : (0 : ℝ) < g.charge sg (selectedChartDisk F) - η := sub_pos.mpr hm
  have hL : Tendsto (fun n => b * (riemannianVolumeMeasure I N g.metric).real (A n))
      atTop (𝓝 0) := by simpa using hSmall.const_mul b
  filter_upwards [hL.eventually_lt_const hm'] with n hn
  have hf := transportedDisk_fixedGauge_floor g (q n) F hF sg (hA n) (hAV n)
    (hOutside n) (hZero n) (hSlack n) (hB n) (hVol n)
  have hbase : 0 ≤ g.charge sg (A n) := measureReal_nonneg
  exact (le_div_iff₀ (hVol n)).2 (by linarith) |>.trans hf

/-- Every positive exterior comparator in the same smooth type obeys the
finite core inequality first. Any common finite limit of the complete
loss, slack and surcharge on a minimizing sequence must pay the limiting
protected charge in the chosen chirality. -/
theorem protectedCore_limit_le_paid [Nonempty N]
    (g q cap : ℕ → SignedCollarMetric o) (F : ℕ → PartialDiffeomorph I₄ I E₄ N ∞)
    (sg : CollarChirality) (K : ℕ → Set N) (δ η j : ℕ → ℝ)
    (hF : ∀ n, Metric.closedBall (0 : E₄) 1 ⊆ (F n).source)
    (hK : ∀ n, K n ⊆ selectedChartDisk (F n))
    (hp : ∀ n, 0 < classYamabeFour o.dimension_eq (cap n).metric)
    (hPeak : ∀ n, (q n).energy .plus ≤ (g n).energy .plus + η n)
    (hCap : ∀ n, (cap n).energy sg ≤ (q n).charge sg (interior (selectedChartDisk (F n)))ᶜ + j n)
    (hRetain : ∀ n, (g n).charge sg (K n) - δ n ≤ (q n).charge sg (K n))
    {mass paid : ℝ} (hMass : Tendsto (fun n => (g n).charge sg (K n)) atTop (𝓝 mass))
    (hEnergy : Tendsto (fun n => (g n).energy .plus) atTop (𝓝 (sInf (geometricPositiveEnergies o))))
    (hCost : Tendsto (fun n => δ n + η n + j n) atTop (𝓝 paid)) :
    mass ≤ paid := by
  have hlim := hMass.sub (hEnergy.sub_const (sInf (geometricPositiveEnergies o)))
  have h := le_of_tendsto_of_tendsto hlim hCost (Filter.Eventually.of_forall fun n =>
    transportedDisk_protectedCore_loss (g n) (q n) (cap n) (F n) (hF n) sg (hK n)
      (hp n) (hPeak n) (hCap n) (hRetain n))
  simpa using h

end SmoothPoincare
