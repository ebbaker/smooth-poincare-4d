import SmoothPoincare.Variational.BandChargeTransfer

/-! # Fixed-tolerance bounds for both physical chiral residuals -/

open DifferentialGeometry DifferentialGeometry.Integral.Measure
open Filter FirstOrderTwistor MeasureTheory SectionsAndConnections Set
open scoped ContDiff Manifold Topology

namespace SmoothPoincare

private theorem square_sub_positivePart_sq_le {a b : ℝ} (ha : 0 ≤ a) :
    a ^ 2 - (max (a - b) 0) ^ 2 ≤ 2 * a * b := by
  by_cases hab : 0 ≤ a - b
  · rw [max_eq_left hab]
    nlinarith only [sq_nonneg b]
  · rw [max_eq_right (le_of_not_ge hab), zero_pow (by decide : 2 ≠ 0)]
    have hle : a ≤ b := by linarith
    nlinarith only [mul_le_mul_of_nonneg_left hle ha, sq_nonneg a]

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  [CompactSpace M] [Nonempty M]

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

/-- The relaxed E58 tolerance bound for each chirality of the physical
metric, charging the entire complement of the same supplied region. -/
theorem bandPhysical_omitted_charges_le_tolerance
    (o : ManifoldOrientation I M 4) (g : SmoothRiemannianMetric I M)
    (frame : ∀ x, OrientedOrthonormalFrameAt g o x) (plus minus : M → Fin 3 → ℝ)
    (h : EndpointPhysicalSpectralData o g frame plus minus)
    {μ : Measure M} [IsProbabilityMeasure μ] {L : M → ℝ} {ell c d : ℝ}
    (hL : MemLp L 2 μ) (hell : 0 ≤ ell) (hMoment : ∫ x, L x ^ 2 ∂μ = ell ^ 2)
    (hc : c ≤ 0) (hTest : classYamabeFour o.dimension_eq g ≤ c + 6 * ∫ x, L x ∂μ)
    {U : Set M} (hU : MeasurableSet U) (hd : μ.real Uᶜ ≤ d)
    (hTotalTransport : (∫ x, endpointTopWeyl (plus x) (minus x) ^ 2
      ∂riemannianVolumeMeasure I M g) = ell ^ 2)
    (hTransport : (∫ x in U, endpointTopWeyl (plus x) (minus x) ^ 2
      ∂riemannianVolumeMeasure I M g) = ∫ x in U, L x ^ 2 ∂μ) :
    let dV := riemannianVolumeMeasure I M g
    let P := fun x => hilbertSchmidtSq (geometricChiralBlock g o x (frame x))
    let N := fun x => hilbertSchmidtSq (endpointNegativeWeylBlock g o x (frame x))
    let e := chiralFrameEnergy g (fun x => geometricChiralBlock g o x (frame x))
    let Y := classYamabeFour o.dimension_eq g
    let B := 4 * (e - 4 * Real.pi ^ 2) + Y * ell / 2 * Real.sqrt d
    (∫ x in Uᶜ, P x ∂dV) ≤ B ∧ (∫ x in Uᶜ, N x ∂dV) ≤ B := by
  intro dV P N e Y B
  have hExact := bandPhysical_omitted_charges o g frame plus minus h hL hell hMoment
    hc hTest hU hd hTransport
  obtain ⟨hY, _, _, hEuler⟩ := bandPhysical_yamabeEuler_sandwich o g frame plus minus h
    hL hell hMoment hTotalTransport hc hTest
  change 0 < Y / 6 at hY
  change 48 * (8 * Real.pi ^ 2 - e) ≤ Y ^ 2 at hEuler
  have hDiff := square_sub_positivePart_sq_le (b := ell * Real.sqrt d) hY.le
  have hBudget : 2 * e - (3 / 2 : ℝ) * (max (Y / 6 - ell * Real.sqrt d) 0) ^ 2 ≤ B := by
    dsimp only [B]
    nlinarith only [hDiff, hEuler]
  exact ⟨hExact.1.trans hBudget, hExact.2.trans hBudget⟩

/-- A fixed omitted-volume tolerance suffices in the subcritical subband
for both physical raw residuals of one supplied finite family at each index. -/
theorem bandPhysical_omitted_charges_eventually_lt_threshold
    (o : ManifoldOrientation I M 4) (G : ℕ → SmoothRiemannianMetric I M)
    (frame : ∀ i x, OrientedOrthonormalFrameAt (G i) o x)
    (plus minus : ℕ → M → Fin 3 → ℝ)
    (h : ∀ i, EndpointPhysicalSpectralData o (G i) (frame i) (plus i) (minus i))
    (μ : ℕ → Measure M) [∀ i, IsProbabilityMeasure (μ i)] (L : ℕ → M → ℝ)
    (ell c : ℕ → ℝ) (hL : ∀ i, MemLp (L i) 2 (μ i)) (hell : ∀ i, 0 ≤ ell i)
    (hMoment : ∀ i, ∫ x, L i x ^ 2 ∂μ i = ell i ^ 2) (hc : ∀ i, c i ≤ 0)
    (hTest : ∀ i, classYamabeFour o.dimension_eq (G i) ≤ c i + 6 * ∫ x, L i x ∂μ i)
    (hTransport : ∀ i (U : Set M), MeasurableSet U →
      (∫ x in U, endpointTopWeyl (plus i x) (minus i x) ^ 2 ∂riemannianVolumeMeasure I M (G i)) =
        ∫ x in U, L i x ^ 2 ∂μ i)
    {eLim : ℝ} (hLim : eLim < (5 / 4 : ℝ) * (4 * Real.pi ^ 2))
    (he : Tendsto (fun i => chiralFrameEnergy (G i)
      (fun x => geometricChiralBlock (G i) o x (frame i x))) atTop (𝓝 eLim)) :
    ∃ d > (0 : ℝ), ∀ (idx : ℕ → Finset ℕ) (disks : ℕ → ℕ → Set M),
      (∀ i j, j ∈ idx i → MeasurableSet (disks i j)) →
      let U := fun i => ⋃ j ∈ idx i, disks i j
      (∀ᶠ i in atTop, (μ i).real (U i)ᶜ ≤ d) →
      ∀ᶠ i in atTop,
        (∫ x in (U i)ᶜ, hilbertSchmidtSq (geometricChiralBlock (G i) o x (frame i x))
          ∂riemannianVolumeMeasure I M (G i)) < 4 * Real.pi ^ 2 ∧
        (∫ x in (U i)ᶜ, hilbertSchmidtSq (endpointNegativeWeylBlock (G i) o x (frame i x))
          ∂riemannianVolumeMeasure I M (G i)) < 4 * Real.pi ^ 2 := by
  let T := 4 * Real.pi ^ 2
  let e := fun i => chiralFrameEnergy (G i) (fun x => geometricChiralBlock (G i) o x (frame i x))
  let Y := fun i => classYamabeFour o.dimension_eq (G i)
  let e₀ := (eLim + (5 / 4 : ℝ) * T) / 2
  let K := max e₀ 1
  let gap := T - 4 * (e₀ - T)
  let d := (gap / (8 * K)) ^ 2
  have he₀ : eLim < e₀ := by dsimp only [e₀, T]; linarith
  have hK : 0 < K := zero_lt_one.trans_le (le_max_right _ _)
  have hgap : 0 < gap := by dsimp only [gap, e₀, T]; linarith
  have hroot : Real.sqrt d = gap / (8 * K) := Real.sqrt_sq (by positivity)
  have herror : 4 * K * Real.sqrt d = gap / 2 := by
    rw [hroot]
    field_simp [hK.ne']
    ring
  refine ⟨d, sq_pos_of_pos (div_pos hgap (by positivity)), ?_⟩
  intro idx disks hDisks U hSmall
  have hWhole (i : ℕ) : (∫ x, endpointTopWeyl (plus i x) (minus i x) ^ 2
      ∂riemannianVolumeMeasure I M (G i)) = ell i ^ 2 := by
    have hAll := hTransport i univ MeasurableSet.univ
    rw [setIntegral_univ, setIntegral_univ] at hAll
    exact hAll.trans (hMoment i)
  filter_upwards [he.eventually_lt_const he₀, hSmall] with i hei hdi
  have hUi : MeasurableSet (U i) := Finset.measurableSet_biUnion _ (hDisks i)
  have hBound := bandPhysical_omitted_charges_le_tolerance o (G i) (frame i) (plus i) (minus i)
    (h i) (hL i) (hell i) (hMoment i) (hc i) (hTest i) hUi hdi (hWhole i) (hTransport i _ hUi)
  obtain ⟨_, hY, hSpec, _⟩ := bandPhysical_yamabeEuler_sandwich o (G i) (frame i) (plus i)
    (minus i) (h i) (hL i) (hell i) (hMoment i) (hWhole i) (hc i) (hTest i)
  change Y i / 6 ≤ ell i at hY
  change ell i ^ 2 ≤ (4 / 3 : ℝ) * e i at hSpec
  have hei' : e i ≤ e₀ := hei.le
  have hCoeff : Y i * ell i / 2 ≤ 4 * K := by
    nlinarith only [mul_le_mul_of_nonneg_right hY (hell i), hSpec, hei', le_max_left e₀ 1]
  have hBudget : 4 * (e i - T) + Y i * ell i / 2 * Real.sqrt d < T := by
    linarith only [hei', mul_le_mul_of_nonneg_right hCoeff (Real.sqrt_nonneg d), herror,
      hgap, (show gap = T - 4 * (e₀ - T) from rfl)]
  exact ⟨hBound.1.trans_lt hBudget, hBound.2.trans_lt hBudget⟩

end SmoothPoincare
