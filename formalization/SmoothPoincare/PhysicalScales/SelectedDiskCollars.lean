import SmoothPoincare.PhysicalScales.DistanceSphere
import SmoothPoincare.Variational.EndpointChargeTransfer

/-! # Shrinking collars in the prescribed disk markings

Thin the actual coordinate collars at each finite index. This makes their
raw physical charge small. The required derivatives of a cutoff on the
chosen width remain part of the splice budget.
-/
open DifferentialGeometry DifferentialGeometry.Integral.Measure FirstOrderTwistor
open MeasureTheory Filter Set
open scoped ContDiff Manifold Topology

namespace SmoothPoincare

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H}
  [TopologicalSpace M] [ChartedSpace H M]

/-- Open radial trim of the original chart around its unit seam. -/
def selectedDiskTrim (F : PartialDiffeomorph 𝓘(ℝ, E₄) I E₄ M ∞) (n : ℕ) : Set M :=
  F.target ∩ {x | |‖F.symm x‖ - 1| < 1 / ((n : ℝ) + 1)}

theorem isOpen_selectedDiskTrim (F : PartialDiffeomorph 𝓘(ℝ, E₄) I E₄ M ∞) (n : ℕ) :
    IsOpen (selectedDiskTrim F n) :=
  F.contMDiffOn_invFun.continuousOn.norm.sub continuousOn_const |>.abs
    |>.isOpen_inter_preimage F.open_target (isOpen_Iio)

variable [I.Boundaryless] [IsManifold I ∞ M] [T2Space M] [SigmaCompactSpace M]
private local instance : MeasurableSpace E₄ := borel E₄
private local instance : BorelSpace E₄ := ⟨rfl⟩
private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

/-- Every finite measure absolutely continuous with respect to the physical
metric volume assigns vanishing mass to sufficiently thin marked trims. -/
theorem selectedDiskTrim_mass_tendsto_zero (g : SmoothRiemannianMetric I M)
    (F : PartialDiffeomorph 𝓘(ℝ, E₄) I E₄ M ∞) (μ : Measure M) [IsFiniteMeasure μ]
    (hac : μ ≪ riemannianVolumeMeasure I M g) :
    Tendsto (fun n => μ.real (selectedDiskTrim F n)) atTop (𝓝 0) := by
  let T := selectedDiskTrim F
  have hd : Antitone T := by
    intro i j hij x hx
    refine ⟨hx.1, ?_⟩
    change |‖F.symm x‖ - 1| < 1 / ((i : ℝ) + 1)
    apply lt_of_lt_of_le (show |‖F.symm x‖ - 1| < 1 / ((j : ℝ) + 1) from hx.2)
    exact one_div_le_one_div_of_le (by positivity) (by exact_mod_cast Nat.add_le_add_right hij 1)
  have hs : (⋂ n, T n) ⊆ F '' (F.source ∩ Metric.sphere (0 : E₄) 1) := by
    intro x hx
    have ha := mem_iInter.mp hx
    have ht := (ha 0).1
    have hz : |‖F.symm x‖ - 1| ≤ 0 :=
      ge_of_tendsto' tendsto_one_div_add_atTop_nhds_zero_nat (fun n => (ha n).2.le)
    refine ⟨F.symm x, ⟨F.toPartialEquiv.map_target ht, ?_⟩, F.toPartialEquiv.right_inv ht⟩
    rw [Metric.mem_sphere, dist_zero_right]
    exact sub_eq_zero.mp (abs_nonpos_iff.mp hz)
  have hNull : μ (⋂ n, T n) = 0 := by
    apply measure_mono_null hs (hac ?_)
    exact riemannianVolumeMeasure_image_eq_zero_of_mdifferentiableOn g
      ((F.mdifferentiableOn (by simp)).mono inter_subset_left)
      (measure_mono_null inter_subset_right (Measure.addHaar_sphere _ _ _))
  have h := tendsto_measure_iInter_atTop
    (fun n => (isOpen_selectedDiskTrim F n).measurableSet.nullMeasurableSet (μ := μ)) hd
    ⟨0, measure_ne_top μ _⟩
  rw [hNull] at h
  exact (ENNReal.tendsto_toReal_zero_iff (fun _ => measure_ne_top μ _)).2 h

/-- One width works for the entire finite family at each index, without a
uniform bound on the number of selected disks. -/
theorem exists_selectedDiskWidths_small_chiral_sum
    (o : ManifoldOrientation I M 4) (g : ℕ → SmoothRiemannianMetric I M)
    (frame : ∀ i x, OrientedOrthonormalFrameAt (g i) o x)
    (hint : ∀ i, Integrable (fun x => SectionsAndConnections.hilbertSchmidtSq
      (geometricChiralBlock (g i) o x (frame i x))) (riemannianVolumeMeasure I M (g i)))
    (idx : ℕ → Finset ℕ) (F : ℕ → ℕ → PartialDiffeomorph 𝓘(ℝ, E₄) I E₄ M ∞) :
    ∃ k : ℕ → ℕ, (∀ i, i ≤ k i) ∧
      Tendsto (fun i => ∑ j ∈ idx i,
        (geometricChiralMeasure o (g i) (frame i)).real (selectedDiskTrim (F i j) (k i)))
        atTop (𝓝 0) := by
  let μ := fun i => geometricChiralMeasure o (g i) (frame i)
  have single (i j : ℕ) : Tendsto (fun n => (μ i).real (selectedDiskTrim (F i j) n))
      atTop (𝓝 0) := by
    let : IsFiniteMeasure (μ i) := geometricChiralMeasure_finite o (g i) (frame i) (hint i)
    exact selectedDiskTrim_mass_tendsto_zero (g i) (F i j) (μ i)
      (withDensity_absolutelyContinuous _ _)
  have pick (i : ℕ) : ∃ k, i ≤ k ∧ (∑ j ∈ idx i, (μ i).real (selectedDiskTrim (F i j) k)) <
      1 / ((i : ℝ) + 1) := by
    have hsum : Tendsto (fun n => ∑ j ∈ idx i, (μ i).real (selectedDiskTrim (F i j) n))
        atTop (𝓝 0) := by simpa using tendsto_finsetSum (idx i) (fun j _ => single i j)
    exact ((eventually_ge_atTop i).and ((tendsto_order.mp hsum).2 _ (by positivity))).exists
  choose k hwidth hsum using pick
  exact ⟨k, hwidth, tendsto_const_nhds.squeeze tendsto_one_div_add_atTop_nhds_zero_nat
    (fun i => Finset.sum_nonneg fun _ _ => measureReal_nonneg) (fun i => (hsum i).le)⟩

/-- Chart marks the whole standard closed disk whose boundary its radial trim
straightens. Both objects live on the same original smooth source. -/
def selectedChartDisk (F : PartialDiffeomorph 𝓘(ℝ, E₄) I E₄ M ∞) : Set M :=
  F '' Metric.closedBall (0 : E₄) 1

variable [CompactSpace M] [Nonempty M]

/-- First select low raw-charge trims on the very disks that capture modified
volume. On those widths alone a successful positive exterior repair forces
the endpoint allowance to be at least 2π in the limit. The inequality for
the joined path is strict, and the entire physical exterior is charged. -/
theorem endpointAllowance_on_selectedChartDisks
    (o : ManifoldOrientation I M 4) (g : ℕ → SmoothRiemannianMetric I M)
    (frame : ∀ i x, OrientedOrthonormalFrameAt (g i) o x)
    (plus minus : ℕ → M → Fin 3 → ℝ)
    (h : ∀ i, EndpointPhysicalSpectralData o (g i) (frame i) (plus i) (minus i))
    (idx : ℕ → Finset ℕ) (F : ℕ → ℕ → PartialDiffeomorph 𝓘(ℝ, E₄) I E₄ M ∞)
    (hDisk : ∀ i j, j ∈ idx i → Metric.closedBall (0 : E₄) 1 ⊆ (F i j).source)
    (hApart : ∀ i, (idx i : Set ℕ).PairwiseDisjoint (fun j => (F i j).target))
    (μ : ℕ → Measure M) [∀ i, IsProbabilityMeasure (μ i)]
    (L : ℕ → M → ℝ) (c : ℕ → ℝ)
    (hL : ∀ i, MemLp (L i) 2 (μ i)) (hc : ∀ i, c i ≤ 0)
    (hTest : ∀ i, classYamabeFour o.dimension_eq (g i) ≤ c i + 6 * ∫ x, L i x ∂μ i)
    (hTrans : ∀ i (A : Set M), MeasurableSet A →
      (∫ x in A, endpointTopWeyl (plus i x) (minus i x) ^ 2 ∂riemannianVolumeMeasure I M (g i)) =
      ∫ x in A, L i x ^ 2 ∂μ i) :
    let T := 4 * Real.pi ^ 2
    let e := fun i => chiralFrameEnergy (g i) (fun x => geometricChiralBlock (g i) o x (frame i x))
    let χ := fun i => geometricChiralMeasure o (g i) (frame i)
    let S := fun i => (⋃ j ∈ idx i, selectedChartDisk (F i j))ᶜ
    let r := fun i => (χ i).real (S i)
    sInf (geometricPositiveEnergies o) = T → Tendsto e atTop (𝓝 T) →
    Tendsto (fun i => (μ i).real (S i)) atTop (𝓝 0) →
    ∃ k : ℕ → ℕ,
      (∀ i, i ≤ k i) ∧ Tendsto r atTop (𝓝 0) ∧
      Tendsto (fun i => ∑ j ∈ idx i, (χ i).real (selectedDiskTrim (F i j) (k i))) atTop (𝓝 0) ∧
      ∀ η : ℕ → ℝ, (∀ i, 0 ≤ η i) →
        (∀ᶠ i in atTop, let s := (χ i).real (⋃ j ∈ idx i, selectedDiskTrim (F i j) (k i))
          e i + 2 * Real.sqrt s * η i + η i ^ 2 < 2 * T →
            ∃ cost ∈ geometricPositiveEnergies o, cost ≤ (Real.sqrt (r i) + η i) ^ 2) →
        ∀ δ > (0 : ℝ), ∀ᶠ i in atTop, 2 * Real.pi - δ < η i := by
  intro T e χ S r hInf he hSmall
  have hS (i : ℕ) : MeasurableSet (S i) := by
    apply MeasurableSet.compl
    apply Finset.measurableSet_biUnion
    intro j hj
    exact ((isCompact_closedBall (0 : E₄) 1).image_of_continuousOn
      ((F i j).contMDiffOn.continuousOn.mono (hDisk i j hj))).isClosed.measurableSet
  have hBoth := (endpointPhysical_omitted_charges o g frame plus minus h he μ L c S
    hL hc hTest hTrans hS hSmall).2
  have hr : Tendsto r atTop (𝓝 0) := by
    apply tendsto_const_nhds.squeeze hBoth (fun _ => measureReal_nonneg)
    intro i
    change (geometricChiralMeasure o (g i) (frame i)).real (S i) ≤ _
    rw [geometricChiralMeasure_real_eq_setIntegral _ _ _ (h i).plus_integrable (hS i)]
    apply integral_mono (h i).plus_integrable.integrableOn ((h i).plus_integrable.add
      (h i).minus_integrable).integrableOn
    exact fun x => le_add_of_nonneg_right (Finset.sum_nonneg fun _ _ =>
      Finset.sum_nonneg fun _ _ => sq_nonneg _)
  obtain ⟨k, hk, hSum⟩ := exists_selectedDiskWidths_small_chiral_sum o g frame
    (fun i => (h i).plus_integrable) idx F
  refine ⟨k, hk, hr, hSum, ?_⟩
  intro η hη hCandidate δ hδ
  let strip := fun i j => selectedDiskTrim (F i j) (k i)
  have hRaw (i : ℕ) : (χ i).real (⋃ j ∈ idx i, strip i j) = ∑ j ∈ idx i, (χ i).real (strip i j) := by
    let : IsFiniteMeasure (χ i) := geometricChiralMeasure_finite o (g i) (frame i) (h i).plus_integrable
    apply measureReal_biUnion_finset₀ _ (fun j _ => (isOpen_selectedDiskTrim (F i j) _).measurableSet.nullMeasurableSet)
    intro j hj l hl hjl
    exact ((hApart i hj hl hjl).mono (fun _ hx => hx.1) (fun _ hx => hx.1)).aedisjoint
  have hLimit := eventually_lt_endpointCollarAllowance (show 0 < T by dsimp [T]; positivity)
    (geometricPositiveEnergies_bddBelow o) hInf he hr (hSum.congr fun i => (hRaw i).symm)
    hη hCandidate hδ
  have hsqrt : Real.sqrt T = 2 * Real.pi := by
    dsimp [T]
    rw [Real.sqrt_mul (by norm_num : (0 : ℝ) ≤ 4), Real.sqrt_sq Real.pi_pos.le]
    norm_num
  rwa [hsqrt] at hLimit

end SmoothPoincare
