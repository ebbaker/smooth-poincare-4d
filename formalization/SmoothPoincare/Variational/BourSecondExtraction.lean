import SmoothPoincare.Variational.BourAttainedSublevel
import SmoothPoincare.Variational.AttainedYamabeSelection

/-! # Post-attainment extraction at fixed regularization

26 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance.
Actual serving settings were unavailable. Edition 06, E50, Routes 07 and 13.
Both limiting steps use ordinary trace-free Ricci charge in the physical gauge.
-/

open DifferentialGeometry DifferentialGeometry.Geometry.Curvature
  DifferentialGeometry.Integral.Measure Filter FirstOrderTwistor MeasureTheory Set
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
  apply csInf_le _ ⟨q, hY, rfl⟩
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
  have hLevel := hNear.trans_le (add_le_add_right (bourRegularizedInfimum_le hp.le hp1.le q hq) ε)
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
    bourFullCurvature q ≤ 16 * Real.pi ^ 2 + d ∧
    (∀ sign, q.energy sign ≤ 8 * Real.pi ^ 2 - m / (2 * (1 - p))) ∧
    sInf (bourRegularizedPositiveValues o p) ≤ bourEnergy p q ∧
    bourEnergy p q ≤ sInf (bourRegularizedPositiveValues o p) + ε := by
  intro y d
  have hLevel := hNear.trans
    (add_le_add_right (bourRegularizedInfimum_le hp.le hp1.le comparator hYComp) ε)
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
    exact add_le_add_left hRic _
  have hChiral : q.energy .plus ≤ 8 * Real.pi ^ 2 - m / (2 * (1 - p)) := by
    apply le_of_tendsto hClosed.plus
    exact Eventually.of_forall fun n => (hFloors (hClosed.time n)).1.trans
      (sub_le_sub_left (div_le_div_of_nonneg_right hInitial (by positivity)) _)
  have hF : Tendsto (fun n => bourEnergy p (f.slice (hClosed.time n))) atTop (𝓝 (bourEnergy p q)) := by
    simp only [bourEnergy_eq_chiral_ricci]
    exact (hClosed.plus.const_mul (2 * (1-p))).add ((hClosed.ricci.const_mul p).div_const 2)
  refine ⟨hY, hRic, hScalar, hFull, ?_, bourRegularizedInfimum_le hp.le hp1.le q (hy.trans_le hY), ?_⟩
  · intro sign
    cases sign with
    | plus => exact hChiral
    | minus => exact q.signature_zero.symm ▸ hChiral
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
theorem bourRegularizedMinimum_yamabeGauge {p r : ℝ} (hp : 0 < p) (hp1 : p ≤ 1)
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

end SmoothPoincare.Bour
