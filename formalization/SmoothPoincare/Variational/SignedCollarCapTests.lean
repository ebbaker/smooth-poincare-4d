import SmoothPoincare.Variational.CapTestTransfer
import SmoothPoincare.Variational.SignedCollarRepair

/-! # Positivity of the signed simultaneous collar repair

The actual phase of joined metrics used for the smooth test transplants
may include product stretching. Its energies, scalar-flat wall, sign
detector and initial metric refer to that same family.
-/

open DifferentialGeometry FirstOrderTwistor
open scoped ContDiff Manifold

namespace SmoothPoincare

variable {E H M P : Type*}
  [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [T2Space M] [CompactSpace M] [Nonempty M]
  [TopologicalSpace P]
  {ι : Type*} {o : ManifoldOrientation I M 4} {source : SignedCollarMetric o}
  {indices : Finset ι} {disk annulus : ι → Set M}

/-- Actual metrics used to test the capped output, starting at the source.
The family can use the original interpolation or an extended path whose
additional metrics retain the signed interpolation's energy ceiling. The
Yamabe-square inequality is the normalized Euler budget on each metric. -/
structure SignedCollarCapTestPath (a : SignedCollarAssembly source indices disk annulus)
    (P : Type*) [TopologicalSpace P] where
  joined : P → SignedCollarMetric o
  start : P
  starts_at_source : (joined start).metric = source.metric
  level : P → ℝ
  continuous_level : Continuous level
  positive_iff : ∀ p, 0 < level p ↔ 0 < classYamabeFour o.dimension_eq (joined p).metric
  zero_yamabe : ∀ p, level p = 0 → classYamabeFour o.dimension_eq (joined p).metric = 0
  yamabe_square : ∀ p,
    48 * (2 * (4 * Real.pi ^ 2) - (joined p).energy .plus) ≤
      classYamabeFour o.dimension_eq (joined p).metric ^ 2
  energy_le_joined : ∀ p, ∃ t, (joined p).energy .plus ≤ (a.joined t).energy .plus
  cap_tests : HasJoinedCapTests (fun p => (joined p).metric) a.output.metric

namespace SignedCollarCapTestPath

variable [PreconnectedSpace P] {a : SignedCollarAssembly source indices disk annulus}
  (path : SignedCollarCapTestPath a P) (b : a.Estimates)

/-- The signed joined ceiling gives a common positive floor for the
interpolation or stretched metrics used by the capped test transplants. -/
theorem joinedYamabeFloor_of_ceiling_lt
    (hSource : 0 < classYamabeFour o.dimension_eq source.metric)
    (hCeiling : b.joinedCeiling < 2 * (4 * Real.pi ^ 2)) (p : P) :
    Real.sqrt (48 * (2 * (4 * Real.pi ^ 2) - b.joinedCeiling)) ≤
      classYamabeFour o.dimension_eq (path.joined p).metric := by
  let gap := 2 * (4 * Real.pi ^ 2) - b.joinedCeiling
  have hGap : 0 < gap := sub_pos.mpr hCeiling
  have hStart : 0 < path.level path.start := by
    apply (path.positive_iff path.start).mpr
    simpa only [path.starts_at_source] using hSource
  have hBand (q : P) : (path.joined q).energy .plus ≤ 8 * Real.pi ^ 2 - gap := by
    obtain ⟨t, ht⟩ := path.energy_le_joined q
    rw [show 8 * Real.pi ^ 2 - gap = b.joinedCeiling by dsimp [gap]; ring]
    exact ht.trans (SignedCollarAssembly.joinedEnergy_le b t)
  have hEuler (q : P) : 48 * (8 * Real.pi ^ 2 - (path.joined q).energy .plus) ≤
      classYamabeFour o.dimension_eq (path.joined q).metric ^ 2 := by
    have h := path.yamabe_square q
    linarith only [h]
  exact (admissibleAlongSubcriticalMetricPath o
    (fun q => (path.joined q).metric) (fun q => (path.joined q).frame)
    path.level path.start gap hGap path.continuous_level hStart path.positive_iff
    path.zero_yamabe (fun q => (path.joined q).integrable .plus) hEuler hBand p).2.1

include path in
/-- Transfer the uniform joined floor to the actual output metric of the
signed assembly using all its smooth conformal tests. -/
theorem outputYamabeFloor_of_ceiling_lt
    (hSource : 0 < classYamabeFour o.dimension_eq source.metric)
    (hCeiling : b.joinedCeiling < 2 * (4 * Real.pi ^ 2)) :
    let floor := Real.sqrt (48 * (2 * (4 * Real.pi ^ 2) - b.joinedCeiling))
    0 < floor ∧ floor ≤ classYamabeFour o.dimension_eq a.output.metric := by
  have hFloor : 0 < Real.sqrt (48 * (2 * (4 * Real.pi ^ 2) - b.joinedCeiling)) :=
    Real.sqrt_pos_of_pos (mul_pos (by norm_num) (sub_pos.mpr hCeiling))
  exact ⟨hFloor, HasJoinedCapTests.yamabeFloor path.cap_tests o.dimension_eq o.dimension_eq hFloor
    (path.joinedYamabeFloor_of_ceiling_lt b hSource hCeiling)⟩

include path in
/-- Positivity and the signed energy bound now concern the same capped
metric. The finite excess limits its guaranteed energy gain. -/
theorem gain_le_excess_of_ceiling_lt
    (hSource : 0 < classYamabeFour o.dimension_eq source.metric)
    (hCeiling : b.joinedCeiling < 2 * (4 * Real.pi ^ 2)) :
    b.gain ≤ source.energy .plus - sInf (geometricPositiveEnergies o) := by
  obtain ⟨hFloor, hOutput⟩ := path.outputYamabeFloor_of_ceiling_lt b hSource hCeiling
  exact SignedCollarAssembly.gain_le_excess b (hFloor.trans_le hOutput)

include path in
/-- The strict signed gain and strict joined ceiling contradict the
fixed-type infimum when the joined test path is available. -/
theorem excludesStrictRepair
    (hSource : 0 < classYamabeFour o.dimension_eq source.metric)
    (hCeiling : b.joinedCeiling < 2 * (4 * Real.pi ^ 2))
    (hGain : source.energy .plus - sInf (geometricPositiveEnergies o) < b.gain) : False :=
  hGain.not_ge (path.gain_le_excess_of_ceiling_lt b hSource hCeiling)

end SignedCollarCapTestPath

section SelectedWidths

local notation "E₄" => EuclideanSpace ℝ (Fin 4)

variable {H M P ι : Type*}
  [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [T2Space M] [CompactSpace M] [Nonempty M] [TopologicalSpace P] [PreconnectedSpace P]
  {o : ManifoldOrientation I M 4} {source : SignedCollarMetric o} {indices : Finset ι}

/-- Realized test transplants discharge positivity for the same output
and exact selected trim widths used in the strict gain test. -/
theorem excludesStrictSelectedDiskSignedCollarRepair_of_capTests
    {F : ι → PartialDiffeomorph 𝓘(ℝ, E₄) I E₄ M ∞} {width : ι → ℕ}
    {a : SelectedDiskSignedCollarAssembly source indices F width}
    (path : SignedCollarCapTestPath a P) (b : a.Estimates)
    (hSource : 0 < classYamabeFour o.dimension_eq source.metric)
    (hCeiling : b.joinedCeiling < 2 * (4 * Real.pi ^ 2))
    (hGain : source.energy .plus - sInf (geometricPositiveEnergies o) < b.gain) : False :=
  path.excludesStrictRepair b hSource hCeiling hGain

end SelectedWidths

end SmoothPoincare
