import SmoothPoincare.PhysicalScales.CurvatureMeasure
import FirstOrderTwistor.GeometricCutDescent
import FirstOrderTwistor.MeasureAccounting

/-! # The necessary collar allowance at the recognition endpoint -/

open DifferentialGeometry DifferentialGeometry.Integral.Measure
open Filter FirstOrderTwistor Function MeasureTheory SectionsAndConnections Set
open scoped BigOperators ContDiff Manifold Topology

namespace SmoothPoincare

/-- Below any strict saving from `√T`, the joined ceiling becomes strict and
the returned candidate would have energy below the witnessed infimum `T`. -/
theorem eventually_lt_endpointCollarAllowance {A : Set ℝ} {T : ℝ} (hT : 0 < T)
    (hBelow : BddBelow A) (hInf : sInf A = T) {e r s η : ℕ → ℝ}
    (he : Tendsto e atTop (𝓝 T)) (hr : Tendsto r atTop (𝓝 0)) (hs : Tendsto s atTop (𝓝 0))
    (hη : ∀ i, 0 ≤ η i)
    (hCandidate : ∀ᶠ i in atTop, e i + 2 * Real.sqrt (s i) * η i + η i ^ 2 < 2 * T →
      ∃ c ∈ A, c ≤ (Real.sqrt (r i) + η i) ^ 2)
    {δ : ℝ} (hδ : 0 < δ) : ∀ᶠ i in atTop, Real.sqrt T - δ < η i := by
  let B := Real.sqrt T - δ
  by_cases hB : 0 ≤ B
  · have hBT : B ^ 2 < T := by
      rw [← Real.sq_sqrt hT.le]
      exact (sq_lt_sq₀ hB (Real.sqrt_nonneg T)).2 (sub_lt_self _ hδ)
    have hSqrtR : Tendsto (fun i => Real.sqrt (r i)) atTop (𝓝 0) := by
      simpa only [Function.comp_def, Real.sqrt_zero] using Real.continuous_sqrt.continuousAt.tendsto.comp hr
    have hSqrtS : Tendsto (fun i => Real.sqrt (s i)) atTop (𝓝 0) := by
      simpa only [Function.comp_def, Real.sqrt_zero] using Real.continuous_sqrt.continuousAt.tendsto.comp hs
    have hJoined : Tendsto (fun i => e i + 2 * Real.sqrt (s i) * B + B ^ 2) atTop (𝓝 (T + B ^ 2)) := by
      simpa only [mul_zero, zero_mul, add_zero] using
        (he.add ((hSqrtS.const_mul 2).mul_const B)).add_const (B ^ 2)
    have hRetained : Tendsto (fun i => (Real.sqrt (r i) + B) ^ 2) atTop (𝓝 (B ^ 2)) := by
      simpa only [zero_add] using (hSqrtR.add_const B).pow 2
    filter_upwards [hCandidate, (tendsto_order.1 hJoined).2 (2 * T) (by linarith only [hBT]),
      (tendsto_order.1 hRetained).2 T hBT] with i hRepair hiJoined hiRetained
    by_contra! hi
    change η i ≤ B at hi
    have hSquare := pow_le_pow_left₀ (hη i) hi 2
    have hCross := mul_le_mul_of_nonneg_left hi (by positivity : 0 ≤ 2 * Real.sqrt (s i))
    have hiStrict : e i + 2 * Real.sqrt (s i) * η i + η i ^ 2 < 2 * T := by
      linarith only [hiJoined, hSquare, hCross]
    obtain ⟨c, hc, hCost⟩ := hRepair hiStrict
    have hUpper : c < T := hCost.trans_lt ((pow_le_pow_left₀
      (add_nonneg (Real.sqrt_nonneg (r i)) (hη i)) (add_le_add_right hi _) 2).trans_lt hiRetained)
    exact hUpper.not_ge (hInf ▸ csInf_le hBelow hc)
  · exact Eventually.of_forall fun i => (lt_of_not_ge hB).trans_le (hη i)

/-- The exterior collar charge and exterior allowance can be kept separate
before applying the bound with the full retained mass and total allowance. -/
theorem endpointRetainedCost_le_envelope {r sₒ ηₒ η : ℝ} (hr : 0 ≤ r)
    (hsₒ : sₒ ≤ r) (hηₒ : 0 ≤ ηₒ) (hη : ηₒ ≤ η) :
    r + 2 * Real.sqrt sₒ * ηₒ + ηₒ ^ 2 ≤ (Real.sqrt r + η) ^ 2 := by
  have hCross := mul_le_mul (Real.sqrt_le_sqrt hsₒ) hη hηₒ (Real.sqrt_nonneg r)
  have hSq := pow_le_pow_left₀ hηₒ hη 2
  nlinarith only [hCross, hSq, Real.sq_sqrt hr]

variable {E H M : Type*}
  [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  [CompactSpace M] [Nonempty M]

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

/-- On the given endpoint diagonal, the full retained region and all collars
are measured with the same source chiral density. An individual positive
candidate on the original type is used whenever the joined ceiling is strict. -/
theorem geometricEventually_lt_endpointCollarAllowance
    (o : ManifoldOrientation I M 4) (g : ℕ → SmoothRiemannianMetric I M)
    (frame : ∀ i p, OrientedOrthonormalFrameAt (g i) o p)
    (hInt : ∀ i, Integrable (fun p => hilbertSchmidtSq (geometricChiralBlock (g i) o p (frame i p)))
      (riemannianVolumeMeasure I M (g i)))
    (indices : ℕ → Finset ℕ) (B collar : ℕ → ℕ → Set M) (η : ℕ → ℝ) :
    let T := 4 * Real.pi ^ 2
    let e := fun i => chiralFrameEnergy (g i) (fun p => geometricChiralBlock (g i) o p (frame i p))
    let chiral := fun i => geometricChiralMeasure o (g i) (frame i)
    let exterior := fun i => (⋃ j ∈ indices i, B i j)ᶜ
    let collars := fun i => ⋃ j ∈ indices i, collar i j
    let r := fun i => (chiral i).real (exterior i)
    let s := fun i => (chiral i).real (collars i)
    let sₒ := fun i => (chiral i).real (collars i ∩ exterior i)
    sInf (geometricPositiveEnergies o) = T →
    Tendsto e atTop (𝓝 T) → Tendsto r atTop (𝓝 0) →
    (∀ i j, j ∈ indices i → MeasurableSet (collar i j)) →
    (∀ i, Set.Pairwise (↑(indices i)) (AEDisjoint (chiral i) on collar i)) →
    Tendsto (fun i => ∑ j ∈ indices i, (chiral i).real (collar i j)) atTop (𝓝 0) →
    (∀ i, 0 ≤ η i) →
    (∀ᶠ i in atTop, e i + 2 * Real.sqrt (s i) * η i + η i ^ 2 < 2 * T →
      ∃ (q : SmoothRiemannianMetric I M) (qFrame : ∀ p, OrientedOrthonormalFrameAt q o p),
        let W := fun p => geometricChiralBlock q o p (qFrame p)
        let cost := chiralFrameEnergy q W
        0 < classYamabeFour o.dimension_eq q ∧
        Integrable (fun p => hilbertSchmidtSq (W p)) (riemannianVolumeMeasure I M q) ∧
        (cost ≤ (Real.sqrt (r i) + η i) ^ 2 ∨
          ∃ ηₒ : ℝ, 0 ≤ ηₒ ∧ ηₒ ≤ η i ∧ cost ≤ r i + 2 * Real.sqrt (sₒ i) * ηₒ + ηₒ ^ 2)) →
    ∀ δ : ℝ, 0 < δ → ∀ᶠ i in atTop, Real.sqrt T - δ < η i := by
  intro T e chiral exterior collars r s sₒ hInf he hr hMeas hDisjoint hs hη hRepair δ hδ
  have hSum (i : ℕ) : s i = ∑ j ∈ indices i, (chiral i).real (collar i j) := by
    let : IsFiniteMeasure (chiral i) := geometricChiralMeasure_finite o (g i) (frame i) (hInt i)
    exact measureReal_biUnion_finset₀ (hDisjoint i) (fun j hj => (hMeas i j hj).nullMeasurableSet)
  have hs' : Tendsto s atTop (𝓝 0) := hs.congr fun i => (hSum i).symm
  refine eventually_lt_endpointCollarAllowance (by dsimp [T]; positivity)
    (geometricPositiveEnergies_bddBelow o) hInf he hr hs' hη ?_ hδ
  filter_upwards [hRepair] with i hi
  intro hStrict
  obtain ⟨q, qFrame, hPositive, hIntegrable, hCost⟩ := hi hStrict
  refine ⟨chiralFrameEnergy q (fun p => geometricChiralBlock q o p (qFrame p)),
    ⟨q, qFrame, hPositive, hIntegrable, rfl⟩, ?_⟩
  rcases hCost with hCost | ⟨ηₒ, hηₒ, hAllowance, hCost⟩
  · exact hCost
  · let : IsFiniteMeasure (chiral i) := geometricChiralMeasure_finite o (g i) (frame i) (hInt i)
    have hOuter : sₒ i ≤ r i := measureReal_mono inter_subset_right
    exact hCost.trans (endpointRetainedCost_le_envelope measureReal_nonneg hOuter hηₒ hAllowance)

end SmoothPoincare
