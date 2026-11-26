import SmoothPoincare.Variational.BalancedPhysicalDivision
import SmoothPoincare.PhysicalScales.ProtectedMarkedTrims

/-! # Where a positive cap must pay on the chosen curved disk -/

open DifferentialGeometry DifferentialGeometry.Integral.Measure Filter FirstOrderTwistor MeasureTheory Set
open scoped ContDiff Manifold Topology

namespace SmoothPoincare

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "I₄" => 𝓘(ℝ,E₄)
local notation "T" => (4 * Real.pi ^ 2)
variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M] [CompactSpace M] [Nonempty M]
  {o : ManifoldOrientation I M 4}
private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

/-- At a finite source the cap allowance and the complete exterior change
must repay the positive same-type infimum, irrespective of the reference's
curvature and of the size of the saving on the other side. -/
theorem curvedCap_exteriorPrice (g h cap : SignedCollarMetric o) (σ ν : Measure M)
    (Q : PartialDiffeomorph I₄ I E₄ M ∞) (m : NestedBalancedDisks I M)
    {k : ℕ} {ε δ : ℝ} (div : BalancedPhysicalExteriorDivision g σ ν Q m k ε)
    (hpos : 0 < classYamabeFour o.dimension_eq cap.metric) (s : CollarChirality)
    (hcap : cap.energy s ≤ h.charge s (interior (selectedChartDisk m.outer))ᶜ + δ) :
    let V := (interior (selectedChartDisk m.outer))ᶜ
    sInf (geometricPositiveEnergies o) - (1 / (2:ℝ)^k) *
      (g.energy .plus - g.charge s (selectedChartDisk m.core)) - ε <
      h.charge s V - g.charge s V + δ := by
  intro V
  have hi := csInf_le (geometricPositiveEnergies_bddBelow o) (cap.energy_mem_of_positive hpos)
  have hs : sInf (geometricPositiveEnergies o) ≤ cap.energy s := by
    cases s with
    | plus => exact hi
    | minus => exact hi.trans_eq cap.signature_zero
  have hd := (abs_lt.mp (div.chiral s)).2
  rw [← div.core_eq, signedCharge_fullMarkedExterior g s m.core m.core_source] at hd
  change g.charge s V - _ < ε at hd
  change cap.energy s ≤ h.charge s V + δ at hcap
  linarith only [hs, hd, hcap]

/-- Separate the increase on the *outer part* of the native trim from every
point left in the closed exterior. The disjoint sets account for its seam. -/
theorem curvedCap_outerTrimPrice (g h cap : SignedCollarMetric o) (σ ν : Measure M)
    (Q : PartialDiffeomorph I₄ I E₄ M ∞) (m : NestedBalancedDisks I M) (n : ℕ)
    {k : ℕ} {ε δ : ℝ} (div : BalancedPhysicalExteriorDivision g σ ν Q m k ε)
    (hpos : 0 < classYamabeFour o.dimension_eq cap.metric) (s : CollarChirality)
    (hcap : cap.energy s ≤ h.charge s (interior (selectedChartDisk m.outer))ᶜ + δ) :
    let V := (interior (selectedChartDisk m.outer))ᶜ
    let W := selectedDiskTrim m.outer n
    sInf (geometricPositiveEnergies o) - (1 / (2:ℝ)^k) *
      (g.energy .plus - g.charge s (selectedChartDisk m.core)) - ε <
      (h.charge s (V ∩ W) - g.charge s (V ∩ W)) +
      (h.charge s (V \ W) - g.charge s (V \ W)) + δ := by
  intro V W
  have hprice := curvedCap_exteriorPrice g h cap σ ν Q m div hpos s hcap
  have hW : MeasurableSet W := (isOpen_selectedDiskTrim m.outer n).measurableSet
  have hV : MeasurableSet V := isOpen_interior.measurableSet.compl
  have hpart (a : SignedCollarMetric o) :
      a.charge s V = a.charge s (V ∩ W) + a.charge s (V \ W) := by
    change (a.chiralMeasure s).real V = _
    have hd : Disjoint (V ∩ W) (V \ W) := Set.disjoint_left.mpr (fun _ hx hy => hy.2 hx.2)
    simpa only [SignedCollarMetric.charge, Set.inter_union_sdiff] using
      (measureReal_union (μ := a.chiralMeasure s) hd (hV.diff hW))
  change _ < h.charge s V - g.charge s V + δ at hprice
  linarith only [hprice, hpart g, hpart h]

/-- At any fixed level below a positive candidate infimum one dyadic depth
forces a larger allowance on every late matched exterior, for every attainable
positive cap. Depth and sequence index are chosen before the endpoint and sign. -/
theorem exists_depth_eventually_curvedCap_price_gt (g : ℕ → SignedCollarMetric o)
    (he : Tendsto (fun i => (g i).energy .plus) atTop (𝓝 (sInf (geometricPositiveEnergies o))))
    {a : ℝ} (hI : a < sInf (geometricPositiveEnergies o)) :
    ∃ k : ℕ, 0 < k ∧ ∀ (σ ν : ℕ → Measure M)
      (Q : ℕ → PartialDiffeomorph I₄ I E₄ M ∞) (m : ℕ → NestedBalancedDisks I M)
      (ε : ℕ → ℝ), Tendsto ε atTop (𝓝 0) →
      (∀ i, BalancedPhysicalExteriorDivision (g i) (σ i) (ν i) (Q i) (m i) k (ε i)) →
      ∀ᶠ i : ℕ in atTop, ∀ (h cap : SignedCollarMetric o) (s : CollarChirality) (δ : ℝ),
        let V := (interior (selectedChartDisk (m i).outer))ᶜ
        0 < classYamabeFour o.dimension_eq cap.metric → cap.energy s ≤ h.charge s V + δ →
        a < h.charge s V - (g i).charge s V + δ := by
  let Istar := sInf (geometricPositiveEnergies o)
  have hq : Tendsto (fun k : ℕ => 1 / (2:ℝ)^k) atTop (𝓝 0) := by
    simpa only [div_pow, one_pow] using
      (tendsto_pow_atTop_nhds_zero_of_lt_one (by norm_num : 0 ≤ (1/2:ℝ)) (by norm_num))
  have hlim : Tendsto (fun k : ℕ => Istar - (1/(2:ℝ)^k)*Istar) atTop (𝓝 Istar) := by
    simpa only [zero_mul, sub_zero] using tendsto_const_nhds (x := Istar) |>.sub (hq.mul_const Istar)
  obtain ⟨k,hk,ha⟩ := ((eventually_gt_atTop 0).and (hlim.eventually_const_lt hI)).exists
  refine ⟨k,hk,?_⟩
  intro σ ν Q m ε hε hdiv
  have hl := (tendsto_const_nhds (x := Istar) |>.sub (he.const_mul (1 / (2:ℝ)^k))).sub hε
  rw [sub_zero] at hl
  filter_upwards [hl.eventually_const_lt ha] with i hi
  intro h cap s δ V hp hm
  have hfin := curvedCap_exteriorPrice (g i) h cap (σ i) (ν i) (Q i) (m i) (hdiv i) hp s hm
  have hc : 0 ≤ 1 / (2:ℝ)^k * (g i).charge s (selectedChartDisk (m i).core) :=
    mul_nonneg (by positivity) measureReal_nonneg
  change Istar - _ * (_ - _) - _ < h.charge s V - _ + δ at hfin
  linarith only [hi,hfin,hc]

end SmoothPoincare
