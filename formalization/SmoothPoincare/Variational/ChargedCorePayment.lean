import SmoothPoincare.Variational.NonconformalDiskSaving

/-! # Charged original disks and cap payment on their protected enlargements -/

open DifferentialGeometry DifferentialGeometry.Integral.Measure Filter FirstOrderTwistor
  MeasureTheory Set
open scoped ContDiff Manifold Topology

namespace SmoothPoincare

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "I₄" => 𝓘(ℝ, E₄)
variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  [CompactSpace M] [Nonempty M] {o : ManifoldOrientation I M 4}

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

/-- On the supplied selected subsequence, a fixed positive signed charge on
the original marked disk persists in its protected enlargement by monotonicity.
A retained metric germ there gives the input to the late two-cost exclusion.
No part of the complete enlarged exterior is assumed fixed. -/
theorem eventually_no_paid_cap_of_original_charged_markedDisk
    (g : ℕ → SignedCollarMetric o) (m : ℕ → NestedBalancedDisks I M)
    (F : ℕ → PartialDiffeomorph I₄ I E₄ M ∞)
    (he : Tendsto (fun i => (g i).energy .plus) atTop (𝓝 (sInf (geometricPositiveEnergies o))))
    (hSelected : ∃ ρ > (0 : ℝ), ∃ sign, ∀ᶠ i in atTop,
      Metric.closedBall (0 : E₄) 1 ⊆ (F i).source ∧
      selectedChartDisk (F i) ⊆ selectedChartDisk (m i).core ∧
      ρ ≤ (g i).charge sign (selectedChartDisk (F i))) :
    ∀ᶠ i in atTop, ∀ (h cap : SignedCollarMetric o) (δ j : CollarChirality → ℝ),
      0 < classYamabeFour o.dimension_eq cap.metric →
      (∀ x ∈ selectedChartDisk (m i).core, ∀ᶠ y in 𝓝 x, ∀ u v : TangentSpace I y,
        (g i).metric.inner y u v = h.metric.inner y u v) →
      (∀ x ∈ selectedChartDisk (m i).core, ((g i).frame x).basis = (h.frame x).basis) →
      (∀ sign, 0 ≤ j sign) →
      (∀ sign, cap.energy sign ≤ h.charge sign (interior (selectedChartDisk (m i).outer))ᶜ + δ sign) →
      ¬ ∀ sign, δ sign + j sign ≤ (g i).energy .plus - h.energy sign := by
  obtain ⟨ρ, hρ, sign, hSelected⟩ := hSelected
  have hCore : ∀ᶠ i in atTop, ∃ s, ρ ≤ (g i).charge s (selectedChartDisk (m i).core) := by
    filter_upwards [hSelected] with i hi
    exact ⟨sign, hi.2.2.trans (measureReal_mono hi.2.1)⟩
  filter_upwards [eventually_no_paid_cap_of_protectedDisk_charge g m he hρ hCore] with i hi
  intro h cap δ j hPos hGerm hFrame hCost hCap
  have hMeas : MeasurableSet (selectedChartDisk (m i).core) :=
    (isCompact_selectedChartDisk (m i).core (m i).core_source).isClosed.measurableSet
  exact hi h cap δ j hPos
    (fun s => (selectedReference_charge_eq_of_germ (g i) h hMeas hGerm hFrame s).le) hCost hCap

/-- At one fixed source, an independently positive cap at each arbitrarily
small two-sided signed drift forces equality of the original disk charges and
bounds each charge by the original excess. Each tolerance tests one actual cap
in both chiralities. The strict joined path used to construct the caps is an
upstream geometric input. -/
theorem original_markedDisk_charge_eq_and_le_excess_of_arbitrarily_small_cap_drift
    (g : SignedCollarMetric o) (F : PartialDiffeomorph I₄ I E₄ M ∞)
    (hF : Metric.closedBall (0 : E₄) 1 ⊆ F.source)
    (hCap : ∀ ε > (0 : ℝ), ∃ cap : SignedCollarMetric o,
      0 < classYamabeFour o.dimension_eq cap.metric ∧
      ∀ sign, |cap.energy sign - g.charge sign (interior (selectedChartDisk F))ᶜ| < ε) :
    let B := selectedChartDisk F
    g.charge .plus B = g.charge .minus B ∧
      ∀ sign, g.charge sign B ≤ g.energy .plus - sInf (geometricPositiveEnergies o) := by
  intro B
  let V := (interior B)ᶜ
  let Istar := sInf (geometricPositiveEnergies o)
  have hExt (s : CollarChirality) : g.charge s V = g.energy .plus - g.charge s B :=
    signedCharge_fullMarkedExterior g s F hF
  have hVLe (s r : CollarChirality) : g.charge s V ≤ g.charge r V := by
    by_contra! h
    have hε : 0 < (g.charge s V - g.charge r V) / 2 := by linarith only [h]
    obtain ⟨cap, _, hClose⟩ := hCap _ hε
    have hEq (q : CollarChirality) : cap.energy q = cap.energy .plus := by
      cases q with
      | plus => rfl
      | minus => exact cap.signature_zero.symm
    linarith only [(abs_lt.mp (hClose s)).1, (abs_lt.mp (hClose r)).2, hEq s, hEq r]
  have hInf (s : CollarChirality) : Istar ≤ g.charge s V := by
    by_contra! h
    have hε : 0 < (Istar - g.charge s V) / 2 := by linarith only [h]
    obtain ⟨cap, hPos, hClose⟩ := hCap _ hε
    have hI : Istar ≤ cap.energy .plus :=
      csInf_le (geometricPositiveEnergies_bddBelow o) (cap.energy_mem_of_positive hPos)
    have hIs : Istar ≤ cap.energy s := by
      cases s with
      | plus => exact hI
      | minus => exact hI.trans_eq cap.signature_zero
    have hUpper : cap.energy s - g.charge s V < (Istar - g.charge s V) / 2 :=
      (abs_lt.mp (hClose s)).2
    linarith only [h, hIs, hUpper]
  constructor
  · have hEq := le_antisymm (hVLe .plus .minus) (hVLe .minus .plus)
    linarith only [hEq, hExt .plus, hExt .minus]
  · intro s
    linarith only [hInf s, hExt s]

end SmoothPoincare
