import SmoothPoincare.PhysicalScales.SelectedComparisonDisks
import SmoothPoincare.Variational.SignedCollarRepair

/-! # Raw exterior charge and required saving on a larger marked disk -/

open DifferentialGeometry DifferentialGeometry.Integral.Measure
open Filter FirstOrderTwistor MeasureTheory Set
open scoped ContDiff Manifold Topology

namespace SmoothPoincare

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "I₄" => 𝓘(ℝ, E₄)
local notation "T" => (4 * Real.pi ^ 2)

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H}
  [TopologicalSpace M] [ChartedSpace H M]

/-- The protected closed disk lies inside the larger disk's marked interior.
Both charts are smooth on an open neighborhood of the closed unit disk. -/
structure NestedBalancedDisks (I : ModelWithCorners ℝ E₄ H) (M : Type*)
    [TopologicalSpace M] [ChartedSpace H M] where
  core : PartialDiffeomorph I₄ I E₄ M ∞
  outer : PartialDiffeomorph I₄ I E₄ M ∞
  core_source : Metric.closedBall (0 : E₄) 1 ⊆ core.source
  outer_source : Metric.closedBall (0 : E₄) 1 ⊆ outer.source
  core_inside : selectedChartDisk core ⊆ outer '' Metric.ball (0 : E₄) 1

/-- The image of the open unit ball is exactly the interior of its marked disk. -/
theorem interior_selectedChartDisk (F : PartialDiffeomorph I₄ I E₄ M ∞)
    (hDisk : Metric.closedBall (0 : E₄) 1 ⊆ F.source) :
    interior (selectedChartDisk F) = F '' Metric.ball (0 : E₄) 1 := by
  let P := F.toOpenPartialHomeomorph
  have hTarget : selectedChartDisk F ⊆ P.target := by
    rintro _ ⟨x, hx, rfl⟩
    exact P.map_source (hDisk hx)
  have hImage : P.IsImage (Metric.closedBall (0 : E₄) 1) (selectedChartDisk F) := by
    apply OpenPartialHomeomorph.IsImage.of_image_eq
    rw [inter_eq_self_of_subset_right (show Metric.closedBall (0 : E₄) 1 ⊆ P.source from hDisk),
      inter_eq_self_of_subset_right hTarget]
    rfl
  have hBall : Metric.ball (0 : E₄) 1 ⊆ P.source := Metric.ball_subset_closedBall.trans hDisk
  have hInt := hImage.interior.image_eq
  rw [interior_closedBall' _, inter_eq_self_of_subset_right hBall,
    inter_eq_self_of_subset_right (interior_subset.trans hTarget)] at hInt
  exact hInt.symm

variable [I.Boundaryless] [IsManifold I ∞ M] [T2Space M] [CompactSpace M]

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩
private local instance : MeasurableSpace E₄ := borel E₄
private local instance : BorelSpace E₄ := ⟨rfl⟩

variable {o : ManifoldOrientation I M 4}

/-- Including the smooth seam in the full exterior has zero physical chiral
cost. In particular this exterior charge is the whole energy minus the disk. -/
theorem signedCharge_fullMarkedExterior (g : SignedCollarMetric o) (sign : CollarChirality)
    (F : PartialDiffeomorph I₄ I E₄ M ∞)
    (hDisk : Metric.closedBall (0 : E₄) 1 ⊆ F.source) :
    g.charge sign (interior (selectedChartDisk F))ᶜ =
      g.energy .plus - g.charge sign (selectedChartDisk F) := by
  let D := selectedChartDisk F
  let μ := g.chiralMeasure sign
  have hAC : μ ≪ riemannianVolumeMeasure I M g.metric := withDensity_absolutelyContinuous _ _
  have hSeam : μ (D \ interior D) = 0 := by
    apply hAC
    rw [show interior D = F '' Metric.ball (0 : E₄) 1 from interior_selectedChartDisk F hDisk]
    apply measure_mono_null (subset_image_sdiff _ _ _)
    rw [Metric.closedBall_sdiff_ball]
    exact riemannianVolumeMeasure_image_eq_zero_of_mdifferentiableOn g.metric
      ((F.mdifferentiableOn (by simp)).mono (Metric.sphere_subset_closedBall.trans hDisk))
      (Measure.addHaar_sphere _ _ _)
  have hSDiff : (interior D)ᶜ \ Dᶜ = D \ interior D := by
    ext x
    simp [and_comm]
  have hCompl : μ.real (interior D)ᶜ = μ.real Dᶜ := by
    apply (measureReal_eq_measureReal_smaller_of_between_null_sdiff
      (compl_subset_compl.mpr interior_subset) Subset.rfl ?_).symm
    rw [hSDiff, Measure.real_def, hSeam, ENNReal.toReal_zero]
  have hWhole : μ.real univ = g.energy .plus := by
    change g.charge sign univ = g.energy .plus
    rw [g.charge_univ]
    cases sign
    · rfl
    · exact g.signature_zero.symm
  have hMeas : MeasurableSet D := (isCompact_selectedChartDisk F hDisk).isClosed.measurableSet
  change μ.real (interior D)ᶜ = g.energy .plus - μ.real D
  rw [hCompl, measureReal_compl hMeas, hWhole]

/-- A supplied dyadic division on the actual marked disks puts the full raw
exterior below the recognition threshold for both physical chiralities. -/
theorem eventually_balancedMarkedExterior_below_threshold
    (g : ℕ → SignedCollarMetric o) (marks : ℕ → NestedBalancedDisks I M)
    {k : ℕ} (hk : 1 ≤ k) (τ : ℕ → ℝ) {eLim : ℝ}
    (he : Tendsto (fun i => (g i).energy .plus) atTop (𝓝 eLim))
    (hLim : eLim < 2 * T) (hτ : Tendsto τ atTop (𝓝 0))
    (hDivision : ∀ᶠ i in atTop, ∀ sign,
      |(g i).charge sign (interior (selectedChartDisk (marks i).outer))ᶜ -
        (1 / (2 : ℝ) ^ k) * (g i).charge sign (interior (selectedChartDisk (marks i).core))ᶜ| ≤ τ i) :
    ∀ᶠ i in atTop, ∀ sign,
      (g i).charge sign (interior (selectedChartDisk (marks i).outer))ᶜ < T := by
  have hLimit : Tendsto (fun i => (g i).energy .plus / 2 + τ i) atTop (𝓝 (eLim / 2)) := by
    simpa only [add_zero] using (he.div_const 2).add hτ
  have hHalf : eLim / 2 < T := by linarith
  have hWeight : 1 / (2 : ℝ) ^ k ≤ 1 / 2 := by
    simpa only [pow_one] using one_div_pow_le_one_div_pow_of_le (by norm_num : (1 : ℝ) ≤ 2) hk
  filter_upwards [hDivision, hLimit.eventually_lt_const hHalf] with i hi hMargin
  intro sign
  have hRaw := (abs_le.mp (hi sign)).2
  let Q := selectedChartDisk (marks i).core
  have hTotal : (g i).charge sign (interior Q)ᶜ ≤ (g i).energy .plus := by
    rw [signedCharge_fullMarkedExterior _ _ _ (marks i).core_source]
    exact sub_le_self _ measureReal_nonneg
  have hScale := mul_le_mul_of_nonneg_left hTotal (by positivity : 0 ≤ 1 / (2 : ℝ) ^ k)
  have hEnergy : 0 ≤ (g i).energy .plus := by
    rw [← (g i).charge_univ .plus]
    exact measureReal_nonneg
  have hScale' := mul_le_mul_of_nonneg_right hWeight hEnergy
  linarith only [hRaw, hMargin, hScale, hScale']

variable [Nonempty M]

/-- Finite necessary disk-side saving for a supplied positive capped metric
on this same smooth type. The capped energy can exceed the joined exterior
charge by at most `δ`. Exact energy matching uses `δ = 0`. -/
theorem balancedMarkedDisk_saving_gt (g h cap : SignedCollarMetric o)
    (marks : NestedBalancedDisks I M) (k : ℕ) {τ δ : ℝ}
    (hDivision : ∀ sign,
      |g.charge sign (interior (selectedChartDisk marks.outer))ᶜ -
        (1 / (2 : ℝ) ^ k) * g.charge sign (interior (selectedChartDisk marks.core))ᶜ| ≤ τ)
    (hJoined : h.energy .plus < 2 * T)
    (hPositive : 0 < classYamabeFour o.dimension_eq cap.metric)
    (hMatch : ∀ sign,
      cap.energy sign ≤ h.charge sign (interior (selectedChartDisk marks.outer))ᶜ + δ) :
    let Q := selectedChartDisk marks.core
    let B := selectedChartDisk marks.outer
    let q := 1 / (2 : ℝ) ^ k
    let a := sInf (geometricPositiveEnergies o)
    ∀ sign, (1 - q) * g.energy .plus + q * g.charge sign Q + a - 2 * T - τ - δ <
      g.charge sign B - h.charge sign B := by
  intro Q B q a sign
  have hCap : a ≤ cap.energy sign := by
    have hInf := csInf_le (geometricPositiveEnergies_bddBelow o) (cap.energy_mem_of_positive hPositive)
    cases sign
    · exact hInf
    · exact hInf.trans_eq cap.signature_zero
  have hRetained := hCap.trans (hMatch sign)
  rw [signedCharge_fullMarkedExterior h sign marks.outer marks.outer_source] at hRetained
  have hRaw := (abs_le.mp (hDivision sign)).2
  rw [signedCharge_fullMarkedExterior g sign marks.outer marks.outer_source,
    signedCharge_fullMarkedExterior g sign marks.core marks.core_source] at hRaw
  linarith only [hRetained, hJoined, hRaw]

/-- The depth needed for a given recognition gap is independent of the
surviving smooth type and the sequence of metrics. -/
theorem exists_dyadicDepth_for_recognitionGap {ε : ℝ} (hε : 0 < ε) :
    ∃ k : ℕ, 1 ≤ k ∧ (1 / (2 : ℝ) ^ k) * (T + ε) ≤ ε := by
  have hLimit : Tendsto (fun k : ℕ => (1 / (2 : ℝ) ^ k) * (T + ε)) atTop (𝓝 0) := by
    simpa only [div_pow, one_pow, zero_mul] using
      (tendsto_pow_atTop_nhds_zero_of_lt_one (by norm_num : 0 ≤ (1 / 2 : ℝ))
        (by norm_num)).mul_const (T + ε)
  obtain ⟨k, hk, hεk⟩ := ((eventually_ge_atTop (1 : ℕ)).and
    (hLimit.eventually_lt_const hε)).exists
  exact ⟨k, hk, hεk.le⟩

/-- For one fixed depth at the uniform recognition gap, the required actual
disk-side saving exceeds the gap on every late source, in both signs. -/
theorem eventually_balancedMarkedDisk_saving_gt_gap
    (g h cap : ℕ → SignedCollarMetric o) (marks : ℕ → NestedBalancedDisks I M)
    {k : ℕ} {ε : ℝ} (hWeight : (1 / (2 : ℝ) ^ k) * (T + ε) ≤ ε)
    (τ δ : ℕ → ℝ)
    (hGap : T + ε < sInf (geometricPositiveEnergies o))
    (he : Tendsto (fun i => (g i).energy .plus) atTop (𝓝 (sInf (geometricPositiveEnergies o))))
    (hErrors : Tendsto (fun i => τ i + δ i) atTop (𝓝 0))
    (hDivision : ∀ᶠ i in atTop, ∀ sign,
      |(g i).charge sign (interior (selectedChartDisk (marks i).outer))ᶜ -
        (1 / (2 : ℝ) ^ k) * (g i).charge sign (interior (selectedChartDisk (marks i).core))ᶜ| ≤ τ i)
    (hEndpoint : ∀ᶠ i in atTop, (h i).energy .plus < 2 * T ∧
      0 < classYamabeFour o.dimension_eq (cap i).metric ∧
      ∀ sign, (cap i).energy sign ≤ (h i).charge sign
        (interior (selectedChartDisk (marks i).outer))ᶜ + δ i) :
    ∀ᶠ i in atTop, ∀ sign,
      ε < (g i).charge sign (selectedChartDisk (marks i).outer) -
        (h i).charge sign (selectedChartDisk (marks i).outer) := by
  let q := 1 / (2 : ℝ) ^ k
  let a := sInf (geometricPositiveEnergies o)
  have hQ : 0 ≤ q := by dsimp [q]; positivity
  have hQle : q ≤ 1 := by
    simpa only [pow_zero, div_one, q] using one_div_pow_le_one_div_pow_of_le
      (by norm_num : (1 : ℝ) ≤ 2) (Nat.zero_le k)
  have hLimit : Tendsto (fun i => (1 - q) * (g i).energy .plus + a - 2 * T - (τ i + δ i))
      atTop (𝓝 ((1 - q) * a + a - 2 * T)) := by
    simpa only [sub_zero] using (((he.const_mul (1 - q)).add_const a).sub_const (2 * T)).sub hErrors
  have hStrict : ε < (1 - q) * a + a - 2 * T := by
    have hPos := mul_pos (show 0 < 2 - q by linarith) (sub_pos.mpr hGap)
    change q * (T + ε) ≤ ε at hWeight
    nlinarith only [hPos, hWeight]
  filter_upwards [hDivision, hEndpoint, hLimit.eventually_const_lt hStrict] with i hDiv hEnd hBound
  intro sign
  have hSaving := balancedMarkedDisk_saving_gt (g i) (h i) (cap i) (marks i) k
    hDiv hEnd.1 hEnd.2.1 hEnd.2.2 sign
  have hCore : 0 ≤ q * (g i).charge sign (selectedChartDisk (marks i).core) :=
    mul_nonneg hQ measureReal_nonneg
  linarith only [hBound, hSaving, hCore]

end SmoothPoincare
