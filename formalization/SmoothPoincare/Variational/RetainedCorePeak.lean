import SmoothPoincare.Variational.TransportLimits

/-! # Near equality of the peak on a prescribed charged core

All regions belong to one finite marked source. The signed disk complement
is the entire part outside the protected set. The exterior comparator on
the same smooth type has the exact cost of the retained exterior.
-/

noncomputable section
open DifferentialGeometry DifferentialGeometry.Integral.Measure FirstOrderTwistor SectionsAndConnections
open Set MeasureTheory Manifold Filter Topology
open scoped ContDiff Manifold

namespace SmoothPoincare

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "I₄" => 𝓘(ℝ,E₄)
variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M] [CompactSpace M]
  [Nonempty M] {o : ManifoldOrientation I M 4}
private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

/-- The larger incoming signed mass on the literal protected region. -/
def protectedChargeMax (g : SignedCollarMetric o) (Q : Set M) : ℝ :=
  max (g.charge .plus Q) (g.charge .minus Q)

/-- The sign attaining the finite maximum may vary with the source index. -/
def protectedChargeSign (g : SignedCollarMetric o) (Q : Set M) : CollarChirality :=
  if g.charge .minus Q ≤ g.charge .plus Q then .plus else .minus

omit [I.Boundaryless] [Nonempty M] in
theorem charge_protectedChargeSign (g : SignedCollarMetric o) (Q : Set M) :
    g.charge (protectedChargeSign g Q) Q = protectedChargeMax g Q := by
  unfold protectedChargeSign protectedChargeMax
  split_ifs with h
  · exact (max_eq_left h).symm
  · exact (max_eq_right (le_of_not_ge h)).symm

/-- On an exact positive exterior cap, the peak excess in either sign is
the sum of four nonnegative *measured* terms. A nearly sharp peak bounds
each cost separately on this very source. -/
theorem retainedCore_peak_decomposition (g q cap : SignedCollarMetric o)
    (F : PartialDiffeomorph I₄ I E₄ M ∞) (hF : Metric.closedBall (0:E₄) 1 ⊆ F.source)
    {Q : Set M} (hQ : MeasurableSet Q) (hQD : Q ⊆ selectedChartDisk F) (sg : CollarChirality)
    {P : ℝ} (hPeak : q.energy .plus ≤ P)
    (hCap : cap.energy .plus = q.charge sg (interior (selectedChartDisk F))ᶜ)
    (hp : 0 < classYamabeFour o.dimension_eq cap.metric) (hRetain : g.charge sg Q ≤ q.charge sg Q) :
    let infE := sInf (geometricPositiveEnergies o)
    let outside := q.charge sg (selectedChartDisk F \ Q)
    let gap := P - (infE + g.charge sg Q)
    gap = (P - q.energy .plus) + (cap.energy .plus - infE) + outside +
        (q.charge sg Q - g.charge sg Q) ∧
      P - q.energy .plus ≤ gap ∧ cap.energy .plus - infE ≤ gap ∧ outside ≤ gap ∧
        q.charge sg Q - g.charge sg Q ≤ gap := by
  intro infE outside gap
  have hInf := csInf_le (geometricPositiveEnergies_bddBelow o) (cap.energy_mem_of_positive hp)
  have hSplit := measureReal_add_sdiff (μ := q.chiralMeasure sg) (s := Q) (t := selectedChartDisk F) hQ
  rw [union_eq_right.mpr hQD] at hSplit
  change q.charge sg Q + outside = q.charge sg (selectedChartDisk F) at hSplit
  rw [signedCharge_fullMarkedExterior q sg F hF] at hCap
  have hn : 0 ≤ outside := measureReal_nonneg
  change infE ≤ cap.energy .plus at hInf
  dsimp only [gap]
  constructor
  · linarith only [hSplit, hCap]
  exact ⟨by linarith, by linarith, by linarith, by linarith⟩

/-- Under numerical retention in both signs, the start and the full exterior
give the two bounds at the same finite index. A strictly subcritical peak
therefore has strictly positive remaining headroom above this maximum. -/
theorem retainedCore_finite_peak_floor (g q cap : SignedCollarMetric o)
    (F : PartialDiffeomorph I₄ I E₄ M ∞) (hF : Metric.closedBall (0:E₄) 1 ⊆ F.source)
    {Q : Set M} (hQ : MeasurableSet Q) (hQD : Q ⊆ selectedChartDisk F)
    {P : ℝ} (hStart : g.energy .plus ≤ P) (hPeak : q.energy .plus ≤ P)
    (hCap : ∀ sg, cap.energy .plus = q.charge sg (interior (selectedChartDisk F))ᶜ)
    (hp : 0 < classYamabeFour o.dimension_eq cap.metric)
    (hRetain : ∀ sg, g.charge sg Q ≤ q.charge sg Q) :
    max (g.energy .plus) (sInf (geometricPositiveEnergies o) + protectedChargeMax g Q) ≤ P := by
  apply max_le hStart
  let s := protectedChargeSign g Q
  have h := (retainedCore_peak_decomposition g q cap F hF hQ hQD s hPeak (hCap s) hp (hRetain s)).2.1
  rw [← charge_protectedChargeSign g Q]
  linarith

/-- Near the optimal peak the capped exterior minimizes and the maximizing
chirality has vanishing charge on the whole punctured disk outside the
protected region. Neither a limiting metric nor a fixed maximizing sign
is required. -/
theorem retainedCore_nearSharp_limits
    (g q cap : ℕ → SignedCollarMetric o) (F : ℕ → PartialDiffeomorph I₄ I E₄ M ∞)
    (Q : ℕ → Set M) (P : ℕ → ℝ)
    (hF : ∀ n, Metric.closedBall (0:E₄) 1 ⊆ (F n).source)
    (hQ : ∀ n, MeasurableSet (Q n)) (hQD : ∀ n, Q n ⊆ selectedChartDisk (F n))
    (hPeak : ∀ n, (q n).energy .plus ≤ P n)
    (hCap : ∀ n sg, (cap n).energy .plus = (q n).charge sg (interior (selectedChartDisk (F n)))ᶜ)
    (hp : ∀ n, 0 < classYamabeFour o.dimension_eq (cap n).metric)
    (hRetain : ∀ n sg, (g n).charge sg (Q n) ≤ (q n).charge sg (Q n))
    (hSharp : Tendsto (fun n => P n - (sInf (geometricPositiveEnergies o) +
      protectedChargeMax (g n) (Q n))) atTop (𝓝 0)) :
    let s := fun n => protectedChargeSign (g n) (Q n)
    Tendsto (fun n => P n - (q n).energy .plus) atTop (𝓝 0) ∧
    Tendsto (fun n => (cap n).energy .plus - sInf (geometricPositiveEnergies o)) atTop (𝓝 0) ∧
    Tendsto (fun n => (q n).charge (s n) (selectedChartDisk (F n) \ Q n)) atTop (𝓝 0) ∧
    Tendsto (fun n => (q n).charge (s n) (Q n) - (g n).charge (s n) (Q n)) atTop (𝓝 0) := by
  intro s
  let gap := fun n => P n - (sInf (geometricPositiveEnergies o) + protectedChargeMax (g n) (Q n))
  have squeeze (f : ℕ → ℝ) (lo : ∀ n, 0 ≤ f n) (hi : ∀ n, f n ≤ gap n) :
      Tendsto f atTop (𝓝 0) := squeeze_zero lo hi hSharp
  have leGap (n : ℕ) := (retainedCore_peak_decomposition (g n) (q n) (cap n) (F n)
    (hF n) (hQ n) (hQD n) (protectedChargeSign (g n) (Q n)) (hPeak n) (hCap n _)
    (hp n) (hRetain n _)).2
  simp only [charge_protectedChargeSign] at leGap
  refine ⟨squeeze _ (fun n => sub_nonneg.mpr (hPeak n)) (fun n => (leGap n).1),
    squeeze _ (fun n => sub_nonneg.mpr (csInf_le (geometricPositiveEnergies_bddBelow o)
      ((cap n).energy_mem_of_positive (hp n)))) (fun n => (leGap n).2.1),
    squeeze _ (fun _ => measureReal_nonneg) (fun n => (leGap n).2.2.1), ?_⟩
  exact squeeze _ (fun n => sub_nonneg.mpr (hRetain n _)) (fun n => by
    simpa only [s, charge_protectedChargeSign] using (leGap n).2.2.2)

end SmoothPoincare
