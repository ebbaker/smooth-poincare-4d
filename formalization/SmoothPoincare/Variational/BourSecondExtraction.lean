import SmoothPoincare.Variational.BourAttainedSublevel
import SmoothPoincare.Variational.AttainedYamabeSelection

/-! # Post-attainment extraction at fixed regularization

26 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance.
Actual serving settings were unavailable. Edition 06, E50, Routes 07 and 13.
Both limiting steps use ordinary trace-free Ricci charge in the physical gauge.
-/

open DifferentialGeometry DifferentialGeometry.Geometry.Curvature
  DifferentialGeometry.CheegerGromovCompactness DifferentialGeometry.Integral.Measure
  Filter FirstOrderTwistor MeasureTheory Set
open scoped ContDiff Manifold Topology

noncomputable section

namespace SmoothPoincare.Bour

local notation "E₄" => EuclideanSpace ℝ (Fin 4)

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H}
  [I.Boundaryless] [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [T2Space M] [CompactSpace M] [Nonempty M] [BoundarylessManifold I M]
  {o : ManifoldOrientation I M 4}

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

/-- Values of the physical regularized functional on all positive metrics
on the one original oriented carrier. -/
def bourRegularizedPositiveValues (o : ManifoldOrientation I M 4) (p : ℝ) : Set ℝ :=
  {r | ∃ q : SignedCollarMetric o, 0 < classYamabeFour o.dimension_eq q.metric ∧ bourEnergy p q = r}

omit [BoundarylessManifold I M] in
theorem bourRegularizedInfimum_le {p : ℝ} (hp : 0 ≤ p) (hp1 : p ≤ 1)
    (q : SignedCollarMetric o) (hY : 0 < classYamabeFour o.dimension_eq q.metric) :
    sInf (bourRegularizedPositiveValues o p) ≤ bourEnergy p q := by
  apply csInf_le ?_ (show bourEnergy p q ∈ bourRegularizedPositiveValues o p from ⟨q, hY, rfl⟩)
  refine ⟨0, ?_⟩
  rintro _ ⟨g, _, rfl⟩
  rw [bourEnergy_eq_chiral_ricci]
  exact add_nonneg (mul_nonneg (mul_nonneg (by norm_num) (sub_nonneg.mpr hp1))
    (chiralFrameEnergy_nonneg _ _)) (div_nonneg (mul_nonneg hp (bourRicci_nonneg g)) (by norm_num))

/-- The exact positive Yamabe comparator has a strict ordinary Ricci gap at
the attained Weyl value, by the closed Euler identity and strict comparison. -/
theorem bourExactComparator_ricciGap {BachFlat : SmoothRiemannianMetric I M → Prop}
    {a : ℝ} {q : SignedCollarMetric o} (hq : AttainedYamabeAt BachFlat a q)
    (ha : 0 < a) (hEuler : bourEuler q = 16 * Real.pi ^ 2)
    (hRound : classYamabeFour o.dimension_eq q.metric ≤ roundYamabeConstant)
    (hRoundEquality : classYamabeFour o.dimension_eq q.metric = roundYamabeConstant →
      q.energy .plus = 0) :
    4 * a - bourRicci q =
      (roundYamabeConstant ^ 2 - (classYamabeFour o.dimension_eq q.metric) ^ 2) / 12 ∧
    0 < 4 * a - bourRicci q := by
  have hStrict := lt_of_le_of_ne hRound fun h => ha.ne' (hq.plus_eq.symm.trans (hRoundEquality h))
  have hGB := bourEuler_eq_charges q
  rw [hEuler, hq.plus_eq, bourScalar_eq_sq_of_volume_one q _ hq.volume_one hq.scalar_eq] at hGB
  have hGap : 4 * a - bourRicci q =
      (roundYamabeConstant ^ 2 - (classYamabeFour o.dimension_eq q.metric) ^ 2) / 12 := by
    rw [roundYamabeConstant_sq]
    linarith only [hGB]
  exact ⟨hGap, hGap.symm ▸ div_pos
    (sub_pos.mpr ((sq_lt_sq₀ hq.positive.le roundYamabeConstant_pos.le).mpr hStrict)) (by norm_num)⟩

omit [BoundarylessManifold I M] in
/-- The near-minimizing initial values can be chosen in the physical
volume-one Yamabe gauge. The infimum compares against all smooth
positive metrics, including ones outside that gauge. -/
theorem exists_bourRegularizedYamabeStart [ConnectedSpace M] {p ε : ℝ} (hp : 0 < p) (hp1 : p < 1)
    (q : SignedCollarMetric o) (hq : 0 < classYamabeFour o.dimension_eq q.metric)
    (hε : 0 < ε) (hPin : bourEnergy p q + ε < (1 - p) * (16 * Real.pi ^ 2))
    (hNormalize : BourYamabeNormalization o)
    (hEuler : ∀ g : SignedCollarMetric o, bourEuler g = 16 * Real.pi ^ 2) :
    ∃ g : SignedCollarMetric o, 0 < classYamabeFour o.dimension_eq g.metric ∧
      riemannianVolumeMeasure I M g.metric univ = 1 ∧
      (∀ x, metricScalarAt g.metric x = classYamabeFour o.dimension_eq g.metric) ∧
      bourEnergy p g ≤ sInf (bourRegularizedPositiveValues o p) + ε := by
  let A := bourRegularizedPositiveValues o p
  have hA : A.Nonempty := ⟨bourEnergy p q, q, hq, rfl⟩
  obtain ⟨_, ⟨src, hSrc, rfl⟩, hNear⟩ :=
    exists_lt_of_csInf_lt hA (lt_add_of_pos_right (sInf A) hε)
  have hLevel := hNear.trans_le (add_le_add_left (bourRegularizedInfimum_le hp.le hp1.le q hq) ε)
  have hSub : src.energy .plus < 8 * Real.pi ^ 2 := by
    have hLower : 2 * (1 - p) * src.energy .plus ≤ bourEnergy p src := by
      rw [bourEnergy_eq_chiral_ricci]
      exact le_add_of_nonneg_right (div_nonneg (mul_nonneg hp.le (bourRicci_nonneg src)) (by norm_num))
    apply (mul_lt_mul_iff_right₀ (show 0 < 2 * (1-p) by positivity)).mp
    calc
      _ = 2 * (1-p) * src.energy .plus := by ring
      _ ≤ bourEnergy p src := hLower
      _ < (1-p) * (16 * Real.pi ^ 2) := hLevel.trans hPin
      _ = _ := by ring
  obtain ⟨u, g, hg, hVol, hScalar, hEnergy⟩ :=
    hNormalize src.metric src.frame hSrc (src.integrable .plus) hSub
  have hY : classYamabeFour o.dimension_eq g.metric = classYamabeFour o.dimension_eq src.metric := by
    rw [hg, classYamabeFour_conformalCore]
  let rep : UnitYamabeRepresentative src := ⟨g, u, hg, hVol, hScalar, hEnergy⟩
  have hCompare := (bourEnergy_conformal_minimum rep src p hp.le hSrc 0
    (conformalMetric_zero src.metric).symm rfl hEuler).2
  exact ⟨g, hY.symm ▸ hSrc, hVol, fun x => (hScalar x).trans hY.symm, hCompare.trans hNear.le⟩

/-- Working same-type Weyl attainment and exact first-value compactness
select one least-Ricci Yamabe comparator. For every sufficiently small
positive regularization parameter, that same comparator gives a common
wall margin and a sequence of positive near-minimizing Yamabe starts.
Every supplied original flow from one of these starts has the same
strict Ricci ceiling, uniformly in both the parameter and the start. -/
theorem exists_bourLeastRicci_uniformRegularizedStarts [ConnectedSpace M]
    (o : ManifoldOrientation I M 4) (BachFlat : SmoothRiemannianMetric I M → Prop)
    (hX : ∃ q : SignedCollarMetric o, 0 < classYamabeFour o.dimension_eq q.metric ∧
      BachFlat q.metric ∧ q.energy .plus = sInf (geometricPositiveEnergies o))
    (hPositive : 0 < sInf (geometricPositiveEnergies o)) {δ : ℝ} (hδ : 0 < δ)
    (hGap : sInf (geometricPositiveEnergies o) ≤ 8 * Real.pi ^ 2 - δ)
    (hNormalize : BourYamabeNormalization o)
    (hBachConformal : ∀ (g : SmoothRiemannianMetric I M) (u : C^∞⟮I, M; ℝ⟯),
      BachFlat g → BachFlat (conformalMetric g u))
    (hCompact : AttainedFirstValueCompactness o BachFlat (sInf (attainedBachValues o BachFlat)))
    (hEuler : ∀ q : SignedCollarMetric o, bourEuler q = 16 * Real.pi ^ 2)
    (hRound : ∀ q : SignedCollarMetric o, classYamabeFour o.dimension_eq q.metric ≤ roundYamabeConstant)
    (hRoundEquality : ∀ q : SignedCollarMetric o,
      classYamabeFour o.dimension_eq q.metric = roundYamabeConstant → q.energy .plus = 0) :
    let Istar := sInf (geometricPositiveEnergies o)
    let S := {q : SignedCollarMetric o | AttainedYamabeAt BachFlat Istar q}
    ∃ q ∈ S, IsLeast (bourRicci '' S) (bourRicci q) ∧
    let d := (4 * Istar + bourRicci q) / 2
    d < 4 * Istar ∧ ∃ p₀ ∈ Ioo (0 : ℝ) 1, ∃ m > 0,
      ∀ p ∈ Ioo (0 : ℝ) p₀, ∃ (ε : ℕ → ℝ) (g : ℕ → SignedCollarMetric o),
        Tendsto ε atTop (𝓝 0) ∧ ∀ n,
          0 < ε n ∧ 4 * ε n ≤ p * (4 * Istar - bourRicci q) ∧
          bourEnergy p q + ε n ≤ (1-p) * (16 * Real.pi ^ 2) - m ∧
          0 < classYamabeFour o.dimension_eq (g n).metric ∧
          riemannianVolumeMeasure I M (g n).metric univ = 1 ∧
          (∀ x, metricScalarAt (g n).metric x = classYamabeFour o.dimension_eq (g n).metric) ∧
          bourEnergy p (g n) ≤ sInf (bourRegularizedPositiveValues o p) + ε n ∧
          bourRicci (g n) ≤ d ∧
          ∀ {P : Type*} [TopologicalSpace P] [PreconnectedSpace P] {start : P}
            (f : OriginalTrajectory o p start), (f.slice start).metric = (g n).metric →
              ∀ t, bourRicci (f.slice t) ≤ d := by
  intro Istar S
  obtain ⟨ha, ⟨q, hq, _, hLeast⟩, _⟩ :=
    exists_attainedYamabe_leastRicci o BachFlat hX hPositive hδ hGap hNormalize
      hBachConformal hCompact hEuler hRound hRoundEquality
  rw [← ha] at hq hLeast
  let Δ := 4 * Istar - bourRicci q
  have hΔ : 0 < Δ := (bourExactComparator_ricciGap hq hPositive
    (hEuler q) (hRound q) (hRoundEquality q)).2
  let sSq := (classYamabeFour o.dimension_eq q.metric) ^ 2
  have hSSq : 0 ≤ sSq := sq_nonneg _
  let p₀ := min (1 / 2 : ℝ) (24 * δ / (sSq + 1))
  have hp₀ : p₀ ∈ Ioo (0 : ℝ) 1 :=
    ⟨lt_min (by norm_num) (div_pos (by positivity) (by positivity)),
      (min_le_left _ _).trans_lt (by norm_num)⟩
  refine ⟨q, hq, hLeast, ?_, p₀, hp₀, δ / 2, half_pos hδ, ?_⟩
  · dsimp only [Δ] at hΔ
    linarith only [hΔ]
  intro p hp
  have hp1 : p < 1 := hp.2.trans hp₀.2
  have hpSq : p * sSq ≤ 24 * δ := by
    have h := (le_div_iff₀ (show 0 < sSq + 1 by positivity)).1
      (hp.2.le.trans (min_le_right _ _))
    linarith only [h, hp.1]
  have hWall : bourEnergy p q ≤ (1-p) * (16 * Real.pi ^ 2) - δ := by
    rw [bourEnergy_eq_chiral_scalar, hEuler,
      bourScalar_eq_sq_of_volume_one _ _ hq.volume_one hq.scalar_eq, hq.plus_eq]
    change 2 * Istar + p * sSq / 24 - p * (16 * Real.pi ^ 2) ≤ _
    linarith only [hGap, hpSq]
  let c := min (δ / 2) (p * Δ / 4)
  have hc : 0 < c := lt_min (half_pos hδ) (div_pos (mul_pos hp.1 hΔ) (by norm_num))
  let ε : ℕ → ℝ := fun n => c * (1 / ((n : ℝ) + 1))
  have hε : Tendsto ε atTop (𝓝 0) := by
    simpa only [mul_zero, ε] using tendsto_one_div_add_atTop_nhds_zero_nat.const_mul c
  have hεPos (n : ℕ) : 0 < ε n := by dsimp [ε]; positivity
  have hεLe (n : ℕ) : ε n ≤ c := by
    apply mul_le_of_le_one_right hc.le
    exact (div_le_one (by positivity)).2 (by linarith only [Nat.cast_nonneg (α := ℝ) n])
  have hSmall (n : ℕ) : 4 * ε n ≤ p * Δ := by
    linarith only [(hεLe n).trans (min_le_right (δ / 2) (p * Δ / 4))]
  have hPin (n : ℕ) : bourEnergy p q + ε n ≤ (1-p) * (16 * Real.pi ^ 2) - δ / 2 := by
    linarith only [hWall, (hεLe n).trans (min_le_left (δ / 2) (p * Δ / 4))]
  have hPinStrict (n : ℕ) := (hPin n).trans_lt (sub_lt_self _ (half_pos hδ))
  choose g hG using fun n => exists_bourRegularizedYamabeStart hp.1 hp1 q hq.positive
    (hεPos n) (hPinStrict n) hNormalize hEuler
  have hExact : q.energy .plus = Istar := hq.plus_eq
  have hNear (n : ℕ) : bourEnergy p (g n) ≤ bourEnergy p q + ε n :=
    (hG n).2.2.2.trans (add_le_add_left (bourRegularizedInfimum_le hp.1.le hp1.le q hq.positive) _)
  refine ⟨ε, g, hε, fun n => ⟨hεPos n, hSmall n, hPin n, (hG n).1, (hG n).2.1,
    (hG n).2.2.1, (hG n).2.2.2, ?_, ?_⟩⟩
  · have hF := hNear n
    rw [bourEnergy_eq_chiral_ricci, bourEnergy_eq_chiral_ricci, hExact] at hF
    have hW := mul_le_mul_of_nonneg_left
      (show Istar ≤ (g n).energy .plus from bourInfimum_le_energy _ (hG n).1)
      (sub_nonneg.mpr hp1.le)
    apply (mul_le_mul_iff_right₀ hp.1).mp
    have hErr := hSmall n
    dsimp only [Δ] at hErr
    linarith only [hF, hW, hErr]
  intro P _ _ start f hStart t
  have hStartD : bourRicci (f.slice start) = bourRicci (g n) := by
    simp only [bourRicci_eq_integral, hStart]
  have hStartS : bourScalar (f.slice start) = bourScalar (g n) := by
    simp only [bourScalar_eq_integral, hStart]
  have hStartW : f.energy start = (g n).energy .plus := by
    have hFlowEuler := bourEuler_eq_charges (f.slice start)
    have hMetricEuler := bourEuler_eq_charges (g n)
    rw [hEuler, hStartD, hStartS] at hFlowEuler
    rw [hEuler] at hMetricEuler
    linarith only [hFlowEuler, hMetricEuler]
  have hStartF : bourEnergy p (f.slice start) = bourEnergy p (g n) := by
    rw [bourEnergy_eq_chiral_ricci, bourEnergy_eq_chiral_ricci, hStartD, ← hStartW]
  have hLevel : bourEnergy p (f.slice start) ≤ bourEnergy p q + ε n := by
    rw [hStartF]
    exact hNear n
  have hError : 4 * ε n ≤ p * (4 * q.energy .plus - bourRicci q) := by
    rw [hExact]
    exact hSmall n
  simpa only [hExact] using (bourOriginal_attainedComparator_margin f q hp.1 hp1 hEuler
    hq.plus_eq hLevel (hPinStrict n) hError t).2.1

omit [BoundarylessManifold I M] in
private theorem bourYamabe_le_scalar_of_unitCSC {r : ℝ} (q : SignedCollarMetric o)
    (hY : 0 < classYamabeFour o.dimension_eq q.metric)
    (hVol : riemannianVolumeMeasure I M q.metric univ = 1)
    (hScalar : ∀ x, metricScalarAt q.metric x = r) :
    classYamabeFour o.dimension_eq q.metric ≤ r := by
  have hBound : BddBelow (range (fun u : C^∞⟮I, M; ℝ⟯ =>
      let g := conformalMetric q.metric u
      (∫ x, metricScalarAt g x ∂riemannianVolumeMeasure I M g) /
        Real.sqrt (riemannianVolumeMeasure I M g univ).toReal)) := by
    by_contra hn
    exact hY.ne' (Real.sInf_of_not_bddBelow hn)
  have hTest := csInf_le hBound (mem_range_self (0 : C^∞⟮I, M; ℝ⟯))
  change classYamabeFour o.dimension_eq q.metric ≤
    (∫ x, metricScalarAt (conformalMetric q.metric 0) x
      ∂riemannianVolumeMeasure I M (conformalMetric q.metric 0)) /
      Real.sqrt (riemannianVolumeMeasure I M (conformalMetric q.metric 0) univ).toReal at hTest
  simp only [conformalMetric_zero, hVol, ENNReal.toReal_one, Real.sqrt_one, div_one,
    hScalar, integral_const, Measure.real_def, one_smul] at hTest
  exact hTest

/-- Convergence of both physical charges and the actual joined Yamabe tests
on one compact extraction. The metric returned here is the unit-volume
constant-scalar critical representative provided by the closed alternative. -/
structure BourClosedPhysicalExtraction {P : Type*} [TopologicalSpace P] {p : ℝ} {start : P}
    (f : OriginalTrajectory o p start) (q : SignedCollarMetric o) where
  time : ℕ → P
  plus : Tendsto (fun n => f.energy (time n)) atTop (𝓝 (q.energy .plus))
  ricci : Tendsto (fun n => bourRicci (f.slice (time n))) atTop (𝓝 (bourRicci q))
  scalar : Tendsto (fun n => bourScalar (f.slice (time n))) atTop (𝓝 (bourScalar q))
  tests : HasJoinedCapTests (fun n => (f.slice (time n)).metric) q.metric
  volume_one : riemannianVolumeMeasure I M q.metric univ = 1
  scalar_constant : ∃ r : ℝ, ∀ x, metricScalarAt q.metric x = r

/-- A first physical extraction with the strict comparator gap cannot be
pointed if its marked compactification is positive on the original type
and its Ricci charge transfers from the original times. -/
theorem bourFirstMarkedExtraction_impossible
    {P : Type*} [TopologicalSpace P] [PreconnectedSpace P] {p ε : ℝ} {start : P}
    (f : OriginalTrajectory o p start) (comparator returned : SignedCollarMetric o)
    (hp : 0 < p) (hp1 : p < 1)
    (hEuler : ∀ q : SignedCollarMetric o, bourEuler q = 16 * Real.pi ^ 2)
    (hAtt : comparator.energy .plus = sInf (geometricPositiveEnergies o))
    (hGap : 0 < 4 * comparator.energy .plus - bourRicci comparator)
    (hLevel : bourEnergy p (f.slice start) ≤ bourEnergy p comparator + ε)
    (hPin : bourEnergy p comparator + ε < (1-p) * (16 * Real.pi ^ 2))
    (hSmall : 4 * ε ≤ p * (4 * comparator.energy .plus - bourRicci comparator))
    (hY : 0 < classYamabeFour o.dimension_eq returned.metric) (t : ℕ → P) :
    ¬ 4 * returned.energy .plus ≤ liminf (fun n => bourRicci (f.slice (t n))) atTop := by
  apply bourNoMarkedBubble_of_ricciMargin (fun n => f.slice (t n)) returned hY
    (d := (4 * comparator.energy .plus + bourRicci comparator) / 2) (by rw [← hAtt]; linarith)
  exact Eventually.of_forall fun n =>
    (bourOriginal_attainedComparator_margin f comparator hp hp1 hEuler hAtt
      hLevel hPin hSmall (t n)).2.1

/-- At the first closed return the common strict ordinary Ricci margin,
Yamabe floor and scalar ceiling are carried by the endpoint itself. Both
signed charges use the whole closed metric through the signature identity. -/
theorem bourFirstClosedExtraction_bounds
    {P : Type*} [TopologicalSpace P] [PreconnectedSpace P] {p ε m : ℝ} {start : P}
    (f : OriginalTrajectory o p start) (comparator q : SignedCollarMetric o)
    (hClosed : BourClosedPhysicalExtraction f q) (hp : 0 < p) (hp1 : p < 1) (hm : 0 < m)
    (hEuler : ∀ g : SignedCollarMetric o, bourEuler g = 16 * Real.pi ^ 2)
    (hAtt : comparator.energy .plus = sInf (geometricPositiveEnergies o))
    (hNear : bourEnergy p (f.slice start) ≤ sInf (bourRegularizedPositiveValues o p) + ε)
    (hYComp : 0 < classYamabeFour o.dimension_eq comparator.metric)
    (hPin : bourEnergy p comparator + ε ≤ (1-p) * (16 * Real.pi ^ 2) - m)
    (hSmall : 4 * ε ≤ p * (4 * comparator.energy .plus - bourRicci comparator)) :
    let y := Real.sqrt (24 * m / (1-p))
    let d := (4 * comparator.energy .plus + bourRicci comparator) / 2
    y ≤ classYamabeFour o.dimension_eq q.metric ∧ bourRicci q ≤ d ∧
    bourScalar q ≤ bourScalar comparator + 24 * ε / p ∧
    (∃ r : ℝ, (∀ x, metricScalarAt q.metric x = r) ∧ y ≤ r ∧
      r ^ 2 ≤ bourScalar comparator + 24 * ε / p) ∧
    bourFullCurvature q ≤ 16 * Real.pi ^ 2 + d ∧
    (∀ sign, q.energy sign ≤ 8 * Real.pi ^ 2 - m / (2 * (1 - p))) ∧
    sInf (bourRegularizedPositiveValues o p) ≤ bourEnergy p q ∧
    bourEnergy p q ≤ sInf (bourRegularizedPositiveValues o p) + ε := by
  intro y d
  have hLevel := hNear.trans
    (add_le_add_left (bourRegularizedInfimum_le hp.le hp1.le comparator hYComp) ε)
  have hPin' := hPin.trans_lt (sub_lt_self _ hm)
  have hInitial : m ≤ bourInitialMargin f := by
    unfold bourInitialMargin
    linarith only [hLevel.trans hPin]
  have hy : 0 < y := Real.sqrt_pos_of_pos (div_pos (by positivity) (sub_pos.mpr hp1))
  have hFloors (t : P) := bourStrictSublevel_yamabeFloor f hp hp1 hEuler (hm.trans_le hInitial) t
  have hY : y ≤ classYamabeFour o.dimension_eq q.metric :=
    hClosed.tests.yamabeFloor o.dimension_eq o.dimension_eq hy fun i =>
      (Real.sqrt_le_sqrt (div_le_div_of_nonneg_right (by linarith only [hInitial])
        (sub_nonneg.mpr hp1.le))).trans (hFloors (hClosed.time i)).2.2.1
  have hMargins (t : P) :=
    bourOriginal_attainedComparator_margin f comparator hp hp1 hEuler hAtt hLevel hPin' hSmall t
  have hRic : bourRicci q ≤ d := le_of_tendsto hClosed.ricci
    (Eventually.of_forall fun n => (hMargins (hClosed.time n)).2.1)
  have hScalar := le_of_tendsto hClosed.scalar
    (Eventually.of_forall fun n => (hMargins (hClosed.time n)).2.2)
  have hFull : bourFullCurvature q ≤ 16 * Real.pi ^ 2 + d := by
    rw [bourFullCurvature_eq_euler_add_ricci, hEuler]
    exact add_le_add_right hRic _
  have hChiral : q.energy .plus ≤ 8 * Real.pi ^ 2 - m / (2 * (1 - p)) := by
    apply le_of_tendsto hClosed.plus
    exact Eventually.of_forall fun n => (hFloors (hClosed.time n)).1.trans
      (sub_le_sub_left (div_le_div_of_nonneg_right hInitial (by positivity)) _)
  have hF : Tendsto (fun n => bourEnergy p (f.slice (hClosed.time n))) atTop (𝓝 (bourEnergy p q)) := by
    simp only [bourEnergy_eq_chiral_ricci]
    exact (hClosed.plus.const_mul (2 * (1-p))).add ((hClosed.ricci.const_mul p).div_const 2)
  have hYPos := hy.trans_le hY
  obtain ⟨r, hr⟩ := hClosed.scalar_constant
  have hrFloor := hY.trans (bourYamabe_le_scalar_of_unitCSC q hYPos hClosed.volume_one hr)
  have hrUpper := (bourScalar_eq_sq_of_volume_one q r hClosed.volume_one hr).symm.trans_le hScalar
  refine ⟨hY, hRic, hScalar, ⟨r, hr, hrFloor, hrUpper⟩, hFull, ?_,
    bourRegularizedInfimum_le hp.le hp1.le q hYPos, ?_⟩
  · intro sign
    cases sign with
    | plus => exact hChiral
    | minus => simpa only [bourEnergy_minus_eq_plus] using hChiral
  · exact le_of_tendsto hF (Eventually.of_forall fun n => (f.sublevel (hClosed.time n)).trans hNear)

omit [BoundarylessManifold I M] in
/-- Every further subsequence of the original closed endpoints keeps the
same Ricci margin. The hypothesis compares the pointed charge with the
ordinary Ricci integrals of these endpoints, at their original scales. -/
theorem bourSecondMarkedExtraction_impossible
    (q : ℕ → SignedCollarMetric o) (returned : SignedCollarMetric o)
    (k : ℕ → ℕ) (hk : StrictMono k) {d : ℝ}
    (hD : ∀ᶠ n in atTop, bourRicci (q n) ≤ d)
    (hd : d < 4 * sInf (geometricPositiveEnergies o))
    (hY : 0 < classYamabeFour o.dimension_eq returned.metric) :
    ¬ 4 * returned.energy .plus ≤ liminf (fun n => bourRicci (q (k n))) atTop :=
  bourNoMarkedBubble_of_ricciMargin (fun n => q (k n)) returned hY hd (hk.tendsto_atTop.eventually hD)

section Rescaling

attribute [local instance] PointedRiemannianManifold.topology PointedRiemannianManifold.charted
  PointedRiemannianManifold.smooth PointedRiemannianManifold.t2
  PointedRiemannianManifold.sigmaCompact PointedRiemannianManifold.t2TangentBundle

private local instance (Q : PointedRiemannianManifold I) : MeasurableSpace Q.M := borel Q.M
private local instance (Q : PointedRiemannianManifold I) : BorelSpace Q.M := ⟨rfl⟩

/-- The second pointed source has the actual physical first endpoints,
each rescaled by its own positive constant and with its own basepoint. -/
def bourPointedScaledEndpoints
    (q : ℕ → SignedCollarMetric o) (a : ℕ → ℝ) (ha : ∀ n, 0 < a n) (base : ℕ → M) :
    PointedRiemannianSeq I where
  obj n :=
    { M := M
      basepoint := base n
      metric := scaleMetric (a n) (ha n) (q n).metric }

/-- Canonical pointed comparison on the rescaled physical endpoints gives
the Ricci upper bound directly in the original gauges. It is incompatible
with the supplied same-type positive marked compactification and its
one-end Ricci identity. -/
theorem bourSecondMarkedExtraction_of_canonicalRescaling_impossible
    (q : ℕ → SignedCollarMetric o) (a : ℕ → ℝ) (ha : ∀ n, 0 < a n) (base : ℕ → M)
    {P : PointedRiemannianManifold I} {k : ℕ → ℕ} (hk : StrictMono k)
    (F : PointedRiemannianConvergenceMaps (bourPointedScaledEndpoints q a ha base) P k)
    (C : MetricConvergenceData F)
    (hCanonical : ∀ n, C.domain n = CanonicalMetricCompactness.canonicalSourceData F n)
    {d : ℝ} (hD : ∀ᶠ n in atTop, bourRicci (q n) ≤ d)
    (hd : d < 4 * sInf (geometricPositiveEnergies o))
    (returned : SignedCollarMetric o)
    (hY : 0 < classYamabeFour o.dimension_eq returned.metric)
    (hEnd : (∫ x, intrinsicTraceFreeRicciSq P.metric x
      ∂riemannianVolumeMeasure I P.M P.metric) = 4 * returned.energy .plus) : False := by
  have hBound : ∀ᶠ n in atTop,
      (∫ x, intrinsicTraceFreeRicciSq (q (k n)).metric x
        ∂riemannianVolumeMeasure I M (q (k n)).metric) ≤ d := by
    simpa only [bourRicci_eq_integral] using hk.tendsto_atTop.eventually hD
  have h := bourPointedTraceFreeRicci_real_le_liminf F C hCanonical o.dimension_eq
    (fun _ => (inferInstance : CompactSpace M)) (fun n => (q n).metric) a ha (fun _ => rfl) hBound
  exact hd.not_ge ((mul_le_mul_of_nonneg_left (bourInfimum_le_energy returned hY)
    (by norm_num : (0 : ℝ) ≤ 4)).trans (hEnd ▸ h.2.2))

end Rescaling

omit [BoundarylessManifold I M] in
/-- A whole physical second limit of the fixed-parameter closed endpoints
attains the original regularized infimum. The only limit in the parameter
here is the vanishing error along the stationary sequence. -/
theorem bourRegularizedMinimum_of_secondClosed
    {p y : ℝ} (hp : 0 ≤ p) (hp1 : p ≤ 1) (hy : 0 < y)
    (q : ℕ → SignedCollarMetric o) (limit : SignedCollarMetric o)
    (k : ℕ → ℕ) (hk : StrictMono k) (ε : ℕ → ℝ) (hε : Tendsto ε atTop (𝓝 0))
    (hFloor : ∀ n, y ≤ classYamabeFour o.dimension_eq (q n).metric)
    (hNear : ∀ᶠ n in atTop, bourEnergy p (q n) ≤ sInf (bourRegularizedPositiveValues o p) + ε n)
    (hTests : HasJoinedCapTests (fun n => (q (k n)).metric) limit.metric)
    (hPlus : Tendsto (fun n => (q (k n)).energy .plus) atTop (𝓝 (limit.energy .plus)))
    (hRicci : Tendsto (fun n => bourRicci (q (k n))) atTop (𝓝 (bourRicci limit))) :
    y ≤ classYamabeFour o.dimension_eq limit.metric ∧
    bourEnergy p limit = sInf (bourRegularizedPositiveValues o p) := by
  have hY := hTests.yamabeFloor o.dimension_eq o.dimension_eq hy (fun n => hFloor (k n))
  have hLimit : Tendsto (fun n => bourEnergy p (q (k n))) atTop (𝓝 (bourEnergy p limit)) := by
    simp only [bourEnergy_eq_chiral_ricci]
    exact (hPlus.const_mul (2 * (1-p))).add ((hRicci.const_mul p).div_const 2)
  have hUpper := (hε.comp hk.tendsto_atTop).const_add (sInf (bourRegularizedPositiveValues o p))
  rw [add_zero] at hUpper
  exact ⟨hY, le_antisymm
    (le_of_tendsto_of_tendsto hLimit hUpper (hk.tendsto_atTop.eventually hNear))
    (bourRegularizedInfimum_le hp hp1 limit (hy.trans_le hY))⟩

/-- If the fixed-parameter global minimizer is in its physical
volume-one constant-scalar gauge, its scalar is its Yamabe constant.
Minimality against its own conformal normalization gives this conclusion. -/
theorem bourRegularizedMinimum_yamabeGauge [ConnectedSpace M] {p r : ℝ} (hp : 0 < p) (hp1 : p ≤ 1)
    (q : SignedCollarMetric o) (hY : 0 < classYamabeFour o.dimension_eq q.metric)
    (rep : UnitYamabeRepresentative q) (hMinimum : bourEnergy p q = sInf (bourRegularizedPositiveValues o p))
    (hVol : riemannianVolumeMeasure I M q.metric univ = 1)
    (hScalar : ∀ x, metricScalarAt q.metric x = r)
    (hEuler : ∀ g : SignedCollarMetric o, bourEuler g = 16 * Real.pi ^ 2) :
    r = classYamabeFour o.dimension_eq q.metric := by
  have hYRep : classYamabeFour o.dimension_eq rep.rep.metric = classYamabeFour o.dimension_eq q.metric := by
    rw [rep.conformal, classYamabeFour_conformalCore]
  have hCompare : bourEnergy p q ≤ bourEnergy p rep.rep := by
    rw [hMinimum]
    exact bourRegularizedInfimum_le hp.le hp1 rep.rep (hYRep.symm ▸ hY)
  simp only [bourEnergy_eq_chiral_scalar, hEuler, rep.energy_eq, rep.scalar_square,
    bourScalar_eq_sq_of_volume_one q r hVol hScalar] at hCompare
  have hS : r ^ 2 ≤ classYamabeFour o.dimension_eq q.metric ^ 2 := by
    apply le_of_mul_le_mul_left _ hp
    linarith only [hCompare]
  have hTest := bourYamabe_le_scalar_of_unitCSC q hY hVol hScalar
  exact le_antisymm ((sq_le_sq₀ (hY.le.trans hTest) hY.le).mp hS) hTest

omit [BoundarylessManifold I M] in
/-- At any positive regularized global minimum, comparison to an attained
Weyl metric bounds its ordinary Ricci integral and its Weyl excess. -/
theorem bourRegularizedMinimum_ricci_and_weyl_excess {p : ℝ} (hp : 0 < p) (hp1 : p < 1)
    (q comparator : SignedCollarMetric o)
    (hY : 0 < classYamabeFour o.dimension_eq q.metric)
    (hYComp : 0 < classYamabeFour o.dimension_eq comparator.metric)
    (hAtt : comparator.energy .plus = sInf (geometricPositiveEnergies o))
    (hMinimum : bourEnergy p q = sInf (bourRegularizedPositiveValues o p)) :
    bourRicci q ≤ bourRicci comparator ∧
    0 ≤ q.energy .plus - sInf (geometricPositiveEnergies o) ∧
    (q.energy .plus - sInf (geometricPositiveEnergies o)) ≤
      p * (bourRicci comparator - bourRicci q) / (4 * (1 - p)) := by
  have hCompare := bourRegularizedInfimum_le hp.le hp1.le comparator hYComp
  rw [← hMinimum, bourEnergy_eq_chiral_ricci, bourEnergy_eq_chiral_ricci, hAtt] at hCompare
  have hInf := bourInfimum_le_energy q hY
  have hProduct := mul_nonneg (sub_nonneg.mpr hp1.le) (sub_nonneg.mpr hInf)
  refine ⟨?_, sub_nonneg.mpr hInf, ?_⟩
  · apply le_of_mul_le_mul_left _ hp
    linarith only [hCompare, hProduct]
  · apply (le_div_iff₀ (show 0 < 4 * (1-p) from mul_pos (by norm_num) (sub_pos.mpr hp1))).2
    linarith only [hCompare]


omit [BoundarylessManifold I M] in
/-- A whole positive Yamabe limit of genuine regularized minima at
parameters tending to zero attains the exact Weyl value. If the limiting
Euler equation supplies Bach-flatness and the comparator is least Ricci
on that stratum, the limit has the same least Ricci value and the Weyl
excess divided by the parameter tends to zero. -/
theorem bourRegularizedMinima_limit_leastRicci
    {BachFlat : SmoothRiemannianMetric I M → Prop}
    (q : ℕ → SignedCollarMetric o) (comparator limit : SignedCollarMetric o)
    (p : ℕ → ℝ) (hp : ∀ n, 0 < p n) (hp1 : ∀ n, p n < 1)
    (hpZero : Tendsto p atTop (𝓝 0))
    (hComp : AttainedYamabeAt BachFlat (sInf (geometricPositiveEnergies o)) comparator)
    (hLeast : IsLeast (bourRicci '' {w : SignedCollarMetric o |
      AttainedYamabeAt BachFlat (sInf (geometricPositiveEnergies o)) w}) (bourRicci comparator))
    (hPositive : ∀ n, 0 < classYamabeFour o.dimension_eq (q n).metric)
    (hMinimum : ∀ n, bourEnergy (p n) (q n) = sInf (bourRegularizedPositiveValues o (p n)))
    (hPositiveLimit : 0 < classYamabeFour o.dimension_eq limit.metric)
    (hBach : BachFlat limit.metric)
    (hVolume : riemannianVolumeMeasure I M limit.metric univ = 1)
    (hGauge : ∀ x, metricScalarAt limit.metric x = classYamabeFour o.dimension_eq limit.metric)
    (hEnergy : Tendsto (fun n => (q n).energy .plus) atTop (𝓝 (limit.energy .plus)))
    (hRicci : Tendsto (fun n => bourRicci (q n)) atTop (𝓝 (bourRicci limit))) :
    AttainedYamabeAt BachFlat (sInf (geometricPositiveEnergies o)) limit ∧
    bourRicci limit = bourRicci comparator ∧
    Tendsto (fun n => ((q n).energy .plus - sInf (geometricPositiveEnergies o)) / p n) atTop (𝓝 0) := by
  let Istar := sInf (geometricPositiveEnergies o)
  let Dstar := bourRicci comparator
  have hCompBounds (n : ℕ) :=
    bourRegularizedMinimum_ricci_and_weyl_excess (hp n) (hp1 n) (q n) comparator
      (hPositive n) hComp.positive hComp.plus_eq (hMinimum n)
  have hD : bourRicci limit ≤ Dstar := le_of_tendsto hRicci
    (Eventually.of_forall fun n => (hCompBounds n).1)
  have hDiff : Tendsto (fun n => Dstar - bourRicci (q n)) atTop (𝓝 (Dstar - bourRicci limit)) :=
    hRicci.const_sub Dstar
  have hDenom : Tendsto (fun n => 4 * (1 - p n)) atTop (𝓝 4) := by
    simpa using (hpZero.const_sub 1).const_mul 4
  have hUpper : Tendsto (fun n => p n * (Dstar - bourRicci (q n)) / (4 * (1 - p n))) atTop (𝓝 0) := by
    simpa only [zero_mul, zero_div, Pi.div_def] using
      (hpZero.mul hDiff).div hDenom (by norm_num)
  have hElimit := le_of_tendsto_of_tendsto (hEnergy.sub_const Istar) hUpper
    (Eventually.of_forall fun n => (hCompBounds n).2.2)
  have hEeq : limit.energy .plus = Istar := le_antisymm
    (sub_nonpos.mp hElimit) (bourInfimum_le_energy limit hPositiveLimit)
  have hLimit : AttainedYamabeAt BachFlat Istar limit :=
    ⟨hPositiveLimit, hBach, hEeq, hVolume, hGauge⟩
  have hDexact : bourRicci limit = Dstar := le_antisymm hD (hLeast.2 ⟨limit, hLimit, rfl⟩)
  have hQuot : Tendsto (fun n => (Dstar - bourRicci (q n)) / (4 * (1 - p n))) atTop (𝓝 0) := by
    simpa only [hDexact, sub_self, zero_div, Pi.div_def] using
      hDiff.div hDenom (by norm_num)
  refine ⟨hLimit, hDexact, tendsto_of_tendsto_of_tendsto_of_le_of_le' tendsto_const_nhds hQuot
    (Eventually.of_forall fun n => div_nonneg (hCompBounds n).2.1 (hp n).le) ?_⟩
  exact Eventually.of_forall fun n => (div_le_iff₀ (hp n)).2 (by
    rw [mul_comm _ (p n), ← mul_div_assoc]
    exact (hCompBounds n).2.2)

end SmoothPoincare.Bour
