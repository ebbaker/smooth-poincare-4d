import SmoothPoincare.Variational.SelectedDiskReference
import SmoothPoincare.Variational.BalancedPhysicalDivision
import SmoothPoincare.PhysicalScales.ProtectedMarkedTrims

/-! # Mandatory signed cost of flattening the selected disk -/

open DifferentialGeometry DifferentialGeometry.Geometry.Operator DifferentialGeometry.Geometry.Curvature DifferentialGeometry.Integral.Measure FirstOrderTwistor Filter MeasureTheory Set
open scoped ContDiff Manifold Topology

namespace SmoothPoincare

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "I₄" => 𝓘(ℝ, E₄)
variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H}
  [TopologicalSpace M] [ChartedSpace H M]

variable [I.Boundaryless] [IsManifold I ∞ M] [T2Space M] [CompactSpace M]
private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩
variable {o : ManifoldOrientation I M 4}

/-- Simultaneously realize the radial Euclidean replacement and price its original inputs
on a single protected width of this same four-measure disk. The original core lies
in the flat interior of the replacement. -/
theorem eventually_balancedFlatReference (g : SignedCollarMetric o)
    (σ ν : Measure M) [IsFiniteMeasure σ] [IsFiniteMeasure ν]
    (hσ : σ ≪ riemannianVolumeMeasure I M g.metric) (hν : ν ≪ riemannianVolumeMeasure I M g.metric)
    (m : NestedBalancedDisks I M) {η : ℝ} (hη : 0 < η) :
    ∀ᶠ n : ℕ in atTop,
      let B := selectedChartDisk m.outer
      let W := selectedDiskTrim m.outer n
      0 < n ∧ Disjoint (selectedChartDisk m.core) W ∧
      g.charge .plus W + g.charge .minus W + σ.real W + ν.real W < η ∧
      ∃ (χ : M → ℝ) (hχ : ContMDiff I 𝓘(ℝ) ∞ χ) (hχ01 : ∀ x, χ x ∈ Icc (0:ℝ) 1)
        (b : SmoothRiemannianMetric I M),
        (∀ y ∈ B \ W, metricRm04At (chartSpliceMetric g.metric b χ hχ hχ01 1 ⟨zero_le_one, le_rfl⟩) y = 0) ∧
        (∀ y ∈ selectedChartDisk m.core,
          metricRm04At (chartSpliceMetric g.metric b χ hχ hχ01 1 ⟨zero_le_one, le_rfl⟩) y = 0) ∧
        ∀ y ∉ B ∪ W, ∀ᶠ z in 𝓝 y, ∀ u v : TangentSpace I z, ∀ t : ℝ, ∀ ht : t ∈ Icc (0:ℝ) 1,
          (chartSpliceMetric g.metric b χ hχ hχ01 t ht).inner z u v = g.metric.inner z u v := by
  let μ : Fin 4 → Measure M := ![g.chiralMeasure .plus, g.chiralMeasure .minus, σ, ν]
  let : ∀ j, IsFiniteMeasure (μ j) := by
    intro j
    fin_cases j
    · exact (inferInstance : IsFiniteMeasure (g.chiralMeasure .plus))
    · exact (inferInstance : IsFiniteMeasure (g.chiralMeasure .minus))
    · exact (inferInstance : IsFiniteMeasure σ)
    · exact (inferInstance : IsFiniteMeasure ν)
  have hac : ∀ j, μ j ≪ riemannianVolumeMeasure I M g.metric := by
    intro j
    fin_cases j
    · exact (withDensity_absolutelyContinuous _ _)
    · exact (withDensity_absolutelyContinuous _ _)
    · exact hσ
    · exact hν
  filter_upwards [eventually_protectedFourMeasureTrim g.metric μ hac m hη,
    eventually_gt_atTop (0 : ℕ)] with n hn hpos
  obtain ⟨hbuf, -, hdis, hmass⟩ := hn
  obtain ⟨χ,hχ,hχ01,G,b,V,hBV,hV,-,-,hfix,hsp⟩ :=
    exists_selectedEuclideanReferenceSplice g.metric m.outer n hbuf
  let h := chartSpliceMetric g.metric b χ hχ hχ01 1 ⟨zero_le_one, le_rfl⟩
  obtain ⟨U,hU,-,-,hflat⟩ := selectedEuclideanSplice_flat_near_innerDisk m.outer n hpos G h V
    hBV hV (fun x hx u v => hsp x hx u v 1 _)
  have hinner (y) (hy : y ∈ selectedChartDisk m.outer \ selectedDiskTrim m.outer n) :
      metricRm04At h y = 0 := by
    have hm : y ∈ selectedChartDisk m.outer ∪ selectedDiskTrim m.outer n := Or.inl hy.1
    rw [← (selectedReference_innerDisk_partition m.outer n hbuf).2.2.2] at hm
    obtain ⟨x,hx,rfl⟩ := hm.resolve_right hy.2
    exact hflat x (hU hx)
  refine ⟨hpos,hdis,?_,χ,hχ,hχ01,b,hinner,?_,hfix⟩
  · simpa [μ, Fin.sum_univ_four, SignedCollarMetric.charge, add_assoc] using hmass
  · intro y hy
    obtain ⟨x,hx,he⟩ := m.core_inside hy
    exact hinner y ⟨⟨x,Metric.ball_subset_closedBall hx,he⟩, disjoint_left.mp hdis hy⟩

variable [Nonempty M]

/-- Every positive endpoint flat on the selected disk away from the trim must move
charge onto the trim or into the complete exterior. This accounts for actual exterior
drift in each sign and retains the protected core's original charge. -/
theorem balancedFlatReference_cost (g h : SignedCollarMetric o) (σ ν : Measure M)
    (Q : PartialDiffeomorph I₄ I E₄ M ∞) (m : NestedBalancedDisks I M)
    {k n : ℕ} {ε : ℝ} (div : BalancedPhysicalExteriorDivision g σ ν Q m k ε)
    (hflat : ∀ y ∈ selectedChartDisk m.outer \ selectedDiskTrim m.outer n, metricRm04At h.metric y = 0)
    (hpos : 0 < classYamabeFour o.dimension_eq h.metric) (s : CollarChirality) :
    let W := selectedDiskTrim m.outer n
    let R := (selectedChartDisk m.outer ∪ W)ᶜ
    sInf (geometricPositiveEnergies o) - (1 / (2:ℝ)^k) *
      (g.energy .plus - g.charge s (selectedChartDisk m.core)) - ε <
      h.charge s W + (h.charge s R - g.charge s R) := by
  let B := selectedChartDisk m.outer
  let W := selectedDiskTrim m.outer n
  let R := (B ∪ W)ᶜ
  have hb : MeasurableSet B := (isCompact_selectedChartDisk m.outer m.outer_source).isClosed.measurableSet
  have hw : MeasurableSet W := (isOpen_selectedDiskTrim m.outer n).measurableSet
  have hz := selectedReference_charge_eq_zero_of_flat h (hb.diff hw) hflat s
  have hunion : h.charge s (B ∪ W) = h.charge s W := by
    have hu : (B \ W) ∪ W = B ∪ W := by ext x; simp
    rw [← hu, SignedCollarMetric.charge, measureReal_union disjoint_sdiff_left hw]
    change h.charge s (B \ W) + h.charge s W = h.charge s W
    rw [hz, zero_add]
  have htotal : h.charge s W + h.charge s R = h.energy s := by
    rw [← hunion, ← h.charge_univ]
    exact measureReal_add_measureReal_compl (hb.union hw)
  have hE : sInf (geometricPositiveEnergies o) ≤ h.energy s := by
    have hi := csInf_le (geometricPositiveEnergies_bddBelow o) (h.energy_mem_of_positive hpos)
    cases s with
    | plus => exact hi
    | minus => exact hi.trans_eq h.signature_zero
  have hsub : R ⊆ (interior B)ᶜ := compl_subset_compl.mpr (interior_subset.trans subset_union_left)
  have hraw : g.charge s R ≤ g.charge s (interior B)ᶜ := measureReal_mono hsub
  have hdiv := (abs_lt.mp (div.chiral s)).2
  rw [← div.core_eq, signedCharge_fullMarkedExterior g s m.core m.core_source] at hdiv
  change g.charge s (interior B)ᶜ - _ < ε at hdiv
  linarith only [htotal,hE,hraw,hdiv]

/-- With matching actual exterior germs and frames, the selected trim alone
carries the mandatory charge in each chirality. -/
theorem balancedFlatReference_trim_cost (g h : SignedCollarMetric o) (σ ν : Measure M)
    (Q : PartialDiffeomorph I₄ I E₄ M ∞) (m : NestedBalancedDisks I M)
    {k n : ℕ} {ε : ℝ} (div : BalancedPhysicalExteriorDivision g σ ν Q m k ε)
    (hflat : ∀ y ∈ selectedChartDisk m.outer \ selectedDiskTrim m.outer n, metricRm04At h.metric y = 0)
    (hpos : 0 < classYamabeFour o.dimension_eq h.metric)
    (hGerm : ∀ x ∈ (selectedChartDisk m.outer ∪ selectedDiskTrim m.outer n)ᶜ,
      ∀ᶠ y in 𝓝 x, ∀ u v : TangentSpace I y, g.metric.inner y u v = h.metric.inner y u v)
    (hFrame : ∀ x ∈ (selectedChartDisk m.outer ∪ selectedDiskTrim m.outer n)ᶜ,
      (g.frame x).basis = (h.frame x).basis) (s : CollarChirality) :
    sInf (geometricPositiveEnergies o) - (1 / (2:ℝ)^k) *
      (g.energy .plus - g.charge s (selectedChartDisk m.core)) - ε <
        h.charge s (selectedDiskTrim m.outer n) := by
  have hb := (isCompact_selectedChartDisk m.outer m.outer_source).isClosed.measurableSet
  have hw := (isOpen_selectedDiskTrim m.outer n).measurableSet
  have hR := selectedReference_charge_eq_of_germ g h (hb.union hw).compl hGerm hFrame s
  have hc := balancedFlatReference_cost g h σ ν Q m div hflat hpos s
  simpa only [← hR, sub_self, add_zero] using hc

/-- At fixed positive dyadic depth the charge on a positive replacement cannot
vanish together with its complete exterior drift when the infimum is positive.
The tolerance is chosen before the index and the sign. -/
theorem eventually_balancedFlatReference_cost (g : ℕ → SignedCollarMetric o)
    (σ ν : ℕ → Measure M) (Q : ℕ → PartialDiffeomorph I₄ I E₄ M ∞)
    (m : ℕ → NestedBalancedDisks I M) (n : ℕ → ℕ) {k : ℕ} {ε : ℕ → ℝ}
    (hdiv : ∀ i, BalancedPhysicalExteriorDivision (g i) (σ i) (ν i) (Q i) (m i) k (ε i))
    (he : Tendsto (fun i => (g i).energy .plus) atTop (𝓝 (sInf (geometricPositiveEnergies o))))
    (hε : Tendsto ε atTop (𝓝 0)) {δ : ℝ} (hδ : 0 < δ) :
    ∀ᶠ i : ℕ in atTop, ∀ h : SignedCollarMetric o,
      let B := selectedChartDisk (m i).outer
      let W := selectedDiskTrim (m i).outer (n i)
      let R := (B ∪ W)ᶜ
      (∀ y ∈ B \ W, metricRm04At h.metric y = 0) →
      0 < classYamabeFour o.dimension_eq h.metric → ∀ s : CollarChirality,
      (1 - 1 / (2:ℝ)^k) * sInf (geometricPositiveEnergies o) - δ <
        h.charge s W + (h.charge s R - (g i).charge s R) := by
  let q := 1 / (2:ℝ)^k
  let Istar := sInf (geometricPositiveEnergies o)
  have hlim : Tendsto (fun i => Istar - q * (g i).energy .plus - ε i)
      atTop (𝓝 ((1-q)*Istar)) := by
    convert (tendsto_const_nhds (x := Istar) |>.sub (he.const_mul q) |>.sub hε) using 2
    ring
  filter_upwards [hlim.eventually_const_lt (sub_lt_self _ hδ)] with i hi
  intro h B W R hf hp s
  have hfin := balancedFlatReference_cost (g i) h (σ i) (ν i) (Q i) (m i) (hdiv i) hf hp s
  have hQ : 0 ≤ q * (g i).charge s (selectedChartDisk (m i).core) :=
    mul_nonneg (by dsimp [q]; positivity) measureReal_nonneg
  change Istar - q * (_ - _) - ε i < _ at hfin
  change (1-q)*Istar - δ < _
  linarith only [hi,hfin,hQ]

/-- At positive dyadic depth and positive infimum, a late positive endpoint
flat on the disk away from the trim must have positive trim charge in
each sign whose full exterior charge agrees with the incoming metric. -/
theorem eventually_balancedFlatReference_trim_charge_pos (g : ℕ → SignedCollarMetric o)
    (σ ν : ℕ → Measure M) (Q : ℕ → PartialDiffeomorph I₄ I E₄ M ∞)
    (m : ℕ → NestedBalancedDisks I M) (n : ℕ → ℕ) {k : ℕ} {ε : ℕ → ℝ}
    (hdiv : ∀ i, BalancedPhysicalExteriorDivision (g i) (σ i) (ν i) (Q i) (m i) k (ε i))
    (he : Tendsto (fun i => (g i).energy .plus) atTop (𝓝 (sInf (geometricPositiveEnergies o))))
    (hε : Tendsto ε atTop (𝓝 0)) (hk : 0 < k) (hI : 0 < sInf (geometricPositiveEnergies o)) :
    ∀ᶠ i : ℕ in atTop, ∀ h : SignedCollarMetric o,
      let B := selectedChartDisk (m i).outer
      let W := selectedDiskTrim (m i).outer (n i)
      let R := (B ∪ W)ᶜ
      (∀ y ∈ B \ W, metricRm04At h.metric y = 0) →
      0 < classYamabeFour o.dimension_eq h.metric → ∀ s : CollarChirality,
      h.charge s R = (g i).charge s R → 0 < h.charge s W := by
  let lower := (1 - 1 / (2 : ℝ)^k) * sInf (geometricPositiveEnergies o)
  have hpow : 1 < (2 : ℝ)^k := one_lt_pow₀ (by norm_num) hk.ne'
  have hfrac : 1 / (2 : ℝ)^k < 1 := (div_lt_one (zero_lt_one.trans hpow)).2 hpow
  have hlower : 0 < lower := mul_pos (sub_pos.mpr hfrac) hI
  filter_upwards [eventually_balancedFlatReference_cost g σ ν Q m n hdiv he hε
    (δ := lower / 2) (half_pos hlower)] with i hi
  intro h B W R hflat hpos s hExterior
  have hcost := hi h hflat hpos s
  change lower - lower / 2 < h.charge s W + (h.charge s R - (g i).charge s R) at hcost
  rw [hExterior, sub_self, add_zero] at hcost
  linarith only [hlower, hcost]


end SmoothPoincare
