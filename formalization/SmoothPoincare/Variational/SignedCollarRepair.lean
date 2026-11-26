import SmoothPoincare.PhysicalScales.SelectedDiskCollars

/-! # Signed costs for one simultaneous collar repair -/

open DifferentialGeometry DifferentialGeometry.Integral.Measure
open FirstOrderTwistor MeasureTheory SectionsAndConnections
open scoped ContDiff Manifold

namespace SmoothPoincare

/-- The joined path starts at the raw collar, so its uniform allowance is nonnegative. -/
noncomputable def signedJoinedCollarCost (raw weighted allowance : ℝ) : ℝ :=
  max 0 ((Real.sqrt weighted + allowance) ^ 2 - raw)

/-- The exterior endpoint may save energy relative to its own raw half collar. -/
noncomputable def signedExteriorCollarCost (raw weighted allowance : ℝ) : ℝ :=
  (Real.sqrt weighted + allowance) ^ 2 - raw

section Density

variable {L : Type*} [NormedAddCommGroup L] [NormedSpace ℝ L]

/-- For the weighted affine leading density, the error allowance grows linearly
in the parameter. The triangle inequality bounds the norm by interpolation
of the two endpoint bounds. -/
theorem normSq_sub_le_signedJoinedCollarCost (raw weighted actual : L)
    {s allowance : ℝ} (hs : s ∈ Set.Icc (0 : ℝ) 1)
    (hError : ‖actual - ((1 - s) • raw + s • weighted)‖ ≤ s * allowance) :
    ‖actual‖ ^ 2 - ‖raw‖ ^ 2 ≤
      signedJoinedCollarCost (‖raw‖ ^ 2) (‖weighted‖ ^ 2) allowance := by
  have hLeading := norm_add_le ((1 - s) • raw) (s • weighted)
  rw [norm_smul, norm_smul, Real.norm_of_nonneg (sub_nonneg.mpr hs.2),
    Real.norm_of_nonneg hs.1] at hLeading
  have hTriangle := norm_add_le (actual - ((1 - s) • raw + s • weighted))
    ((1 - s) • raw + s • weighted)
  rw [sub_add_cancel] at hTriangle
  let b := max ‖raw‖ (‖weighted‖ + allowance)
  have hInterpolated : ‖actual‖ ≤ (1 - s) * ‖raw‖ + s * (‖weighted‖ + allowance) := by
    linarith only [hLeading, hTriangle, hError]
  have hUpper : ‖actual‖ ≤ b := by
    calc
      _ ≤ (1 - s) * ‖raw‖ + s * (‖weighted‖ + allowance) := hInterpolated
      _ ≤ (1 - s) * b + s * b := add_le_add
        (mul_le_mul_of_nonneg_left (le_max_left _ _) (sub_nonneg.mpr hs.2))
        (mul_le_mul_of_nonneg_left (le_max_right _ _) hs.1)
      _ = b := by ring
  have hSq := pow_le_pow_left₀ (norm_nonneg actual) hUpper 2
  rw [signedJoinedCollarCost, Real.sqrt_sq (norm_nonneg weighted)]
  rcases le_total (‖weighted‖ + allowance) ‖raw‖ with h | h
  · rw [show b = ‖raw‖ from max_eq_left h] at hSq
    exact (sub_nonpos.mpr hSq).trans (le_max_left _ _)
  · rw [show b = ‖weighted‖ + allowance from max_eq_right h] at hSq
    exact (sub_le_sub_right hSq _).trans (le_max_right _ _)

omit [NormedSpace ℝ L] in
/-- Restricting the endpoint error to the exterior produces a signed
increment relative to the exterior's raw charge. -/
theorem normSq_sub_le_signedExteriorCollarCost (raw weighted actual : L)
    {allowance : ℝ} (hError : ‖actual - weighted‖ ≤ allowance) :
    ‖actual‖ ^ 2 - ‖raw‖ ^ 2 ≤
      signedExteriorCollarCost (‖raw‖ ^ 2) (‖weighted‖ ^ 2) allowance := by
  have hTriangle := norm_add_le (actual - weighted) weighted
  rw [sub_add_cancel] at hTriangle
  have hUpper : ‖actual‖ ≤ ‖weighted‖ + allowance := by linarith only [hTriangle, hError]
  rw [signedExteriorCollarCost, Real.sqrt_sq (norm_nonneg weighted)]
  exact sub_le_sub_right (pow_le_pow_left₀ (norm_nonneg actual) hUpper 2) _

end Density

section Measures

variable {X ι : Type*} [MeasurableSpace X]

private theorem real_univ_eq_compl_add_sum (μ : Measure X) [IsFiniteMeasure μ]
    (indices : Finset ι) (A : ι → Set X)
    (hA : ∀ j ∈ indices, MeasurableSet (A j))
    (hDisjoint : (indices : Set ι).PairwiseDisjoint A) :
    μ.real Set.univ = μ.real (⋃ j ∈ indices, A j)ᶜ + ∑ j ∈ indices, μ.real (A j) := by
  rw [measureReal_compl (Finset.measurableSet_biUnion _ hA),
    measureReal_biUnion_finset hDisjoint hA, sub_add_cancel]

/-- For a single patch, common total positive and negative increments and
unchanged full complements give common local increments. -/
theorem signedCollarIncrement_eq_of_signature
    (sourcePlus sourceMinus actualPlus actualMinus : Measure X)
    [IsFiniteMeasure sourcePlus] [IsFiniteMeasure sourceMinus]
    [IsFiniteMeasure actualPlus] [IsFiniteMeasure actualMinus]
    {A : Set X} (hA : MeasurableSet A)
    (hSourceSignature : sourcePlus.real Set.univ = sourceMinus.real Set.univ)
    (hActualSignature : actualPlus.real Set.univ = actualMinus.real Set.univ)
    (hOutsidePlus : actualPlus.real Aᶜ = sourcePlus.real Aᶜ)
    (hOutsideMinus : actualMinus.real Aᶜ = sourceMinus.real Aᶜ) :
    actualPlus.real A - sourcePlus.real A = actualMinus.real A - sourceMinus.real A := by
  rw [measureReal_compl hA, measureReal_compl hA] at hOutsidePlus hOutsideMinus
  linarith only [hSourceSignature, hActualSignature, hOutsidePlus, hOutsideMinus]

end Measures

/-- The chiral blocks use one and the same manifold orientation. -/
inductive CollarChirality
  | plus
  | minus

section Geometric

variable {E H M : Type*}
  [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  [CompactSpace M] [Nonempty M]

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

/-- The actual Weyl block of either chirality in a common oriented
orthonormal frame. -/
noncomputable def signedCollarWeylBlock (o : ManifoldOrientation I M 4)
    (g : SmoothRiemannianMetric I M) (frame : ∀ x, OrientedOrthonormalFrameAt g o x)
    (sign : CollarChirality) (x : M) : Matrix (Fin 3) (Fin 3) ℝ :=
  match sign with
  | .plus => geometricChiralBlock g o x (frame x)
  | .minus => endpointNegativeWeylBlock g o x (frame x)

/-- Both actual curvature energies of one smooth metric on the fixed
oriented source. Signature zero is an explicit geometric input. -/
structure SignedCollarMetric (o : ManifoldOrientation I M 4) where
  metric : SmoothRiemannianMetric I M
  frame : ∀ x, OrientedOrthonormalFrameAt metric o x
  integrable : ∀ sign, Integrable (fun x => hilbertSchmidtSq (signedCollarWeylBlock o metric frame sign x))
    (riemannianVolumeMeasure I M metric)
  signature_zero : chiralFrameEnergy metric (signedCollarWeylBlock o metric frame .plus) =
    chiralFrameEnergy metric (signedCollarWeylBlock o metric frame .minus)

namespace SignedCollarMetric

variable {o : ManifoldOrientation I M 4} (g : SignedCollarMetric o)

/-- Actual Hilbert–Schmidt energy with the physical volume of this metric. -/
noncomputable def energy (sign : CollarChirality) : ℝ :=
  chiralFrameEnergy g.metric (signedCollarWeylBlock o g.metric g.frame sign)

/-- Physical measure of the indicated chiral block of the same metric. -/
noncomputable def chiralMeasure (sign : CollarChirality) : Measure M :=
  energyMeasure (riemannianVolumeMeasure I M g.metric)
    (fun x => hilbertSchmidtSq (signedCollarWeylBlock o g.metric g.frame sign x))

instance (sign : CollarChirality) : IsFiniteMeasure (g.chiralMeasure sign) :=
  isFiniteEnergyMeasure (g.integrable sign)

/-- Physical charge on the supplied region. -/
noncomputable def charge (sign : CollarChirality) (A : Set M) : ℝ :=
  (g.chiralMeasure sign).real A

omit [I.Boundaryless] [Nonempty M] in
theorem charge_univ (sign : CollarChirality) : g.charge sign Set.univ = g.energy sign := by
  rw [charge, chiralMeasure, energyMeasure_real_apply MeasurableSet.univ
    (g.integrable sign).integrableOn (Filter.Eventually.of_forall fun x =>
      Finset.sum_nonneg fun a _ => Finset.sum_nonneg fun b _ =>
        sq_nonneg (signedCollarWeylBlock o g.metric g.frame sign x a b)),
    setIntegral_univ, energy, chiralFrameEnergy]

omit [I.Boundaryless] [Nonempty M] in
theorem charge_univ_plus_eq_minus : g.charge .plus Set.univ = g.charge .minus Set.univ := by
  rw [g.charge_univ, g.charge_univ]
  exact g.signature_zero

theorem energy_mem_of_positive (hY : 0 < classYamabeFour o.dimension_eq g.metric) :
    g.energy .plus ∈ geometricPositiveEnergies o :=
  ⟨g.metric, g.frame, hY, g.integrable .plus, rfl⟩

end SignedCollarMetric

variable {ι : Type*} {o : ManifoldOrientation I M 4}

/-- Accounting inputs for the actual simultaneous path and its actual
capped output on the original oriented manifold. The local estimates and
the unchanged full complements refer to the same sets for both signs. -/
structure SignedCollarAssembly (source : SignedCollarMetric o) (indices : Finset ι)
    (disk annulus : ι → Set M) where
  joined : Set.Icc (0 : ℝ) 1 → SignedCollarMetric o
  joinedSingle : ι → Set.Icc (0 : ℝ) 1 → SignedCollarMetric o
  output : SignedCollarMetric o
  outputSingle : ι → SignedCollarMetric o
  disk_measurable : ∀ j ∈ indices, MeasurableSet (disk j)
  annulus_measurable : ∀ j ∈ indices, MeasurableSet (annulus j)
  disjoint : (indices : Set ι).PairwiseDisjoint (fun j => disk j ∪ annulus j)
  joined_complement : ∀ t sign,
    (joined t).charge sign (⋃ j ∈ indices, annulus j)ᶜ =
      source.charge sign (⋃ j ∈ indices, annulus j)ᶜ
  joined_single_complement : ∀ j ∈ indices, ∀ t sign,
    (joinedSingle j t).charge sign (annulus j)ᶜ = source.charge sign (annulus j)ᶜ
  joined_patch : ∀ j ∈ indices, ∀ t sign,
    (joined t).charge sign (annulus j) = (joinedSingle j t).charge sign (annulus j)
  output_complement : ∀ sign,
    output.charge sign (⋃ j ∈ indices, disk j ∪ annulus j)ᶜ =
      source.charge sign (⋃ j ∈ indices, disk j ∪ annulus j)ᶜ
  output_single_complement : ∀ j ∈ indices, ∀ sign,
    (outputSingle j).charge sign (disk j ∪ annulus j)ᶜ =
      source.charge sign (disk j ∪ annulus j)ᶜ
  output_cap_zero : ∀ j ∈ indices, ∀ sign, output.charge sign (disk j) = 0
  output_single_cap_zero : ∀ j ∈ indices, ∀ sign, (outputSingle j).charge sign (disk j) = 0
  output_patch : ∀ j ∈ indices, ∀ sign,
    output.charge sign (annulus j \ disk j) =
      (outputSingle j).charge sign (annulus j \ disk j)

namespace SignedCollarAssembly

variable {source : SignedCollarMetric o} {indices : Finset ι} {disk annulus : ι → Set M}
  (a : SignedCollarAssembly source indices disk annulus)

/-- The Weyl density estimates on the joined annulus and its exterior half.
The weighted square masses are the squares of the leading endpoint densities
and the errors are the corresponding local L² allowances. -/
structure Estimates where
  joinedWeighted : ι → CollarChirality → ℝ
  exteriorWeighted : ι → CollarChirality → ℝ
  joinedAllowance : ι → CollarChirality → ℝ
  exteriorAllowance : ι → CollarChirality → ℝ
  joined_bound : ∀ j ∈ indices, ∀ t sign,
    (a.joinedSingle j t).charge sign (annulus j) - source.charge sign (annulus j) ≤
      signedJoinedCollarCost (source.charge sign (annulus j)) (joinedWeighted j sign)
        (joinedAllowance j sign)
  exterior_bound : ∀ j ∈ indices, ∀ sign,
    (a.outputSingle j).charge sign (annulus j \ disk j) -
      source.charge sign (annulus j \ disk j) ≤
      signedExteriorCollarCost (source.charge sign (annulus j \ disk j))
        (exteriorWeighted j sign) (exteriorAllowance j sign)

variable {a}

/-- Build the local budgets from densities in a common normed coefficient
space, such as the marked chart L² space. The norm-square identifications
transport the raw and actual geometric charges on the indicated regions.
The weighted input represents the cutoff-weighted raw endpoint density. -/
noncomputable def Estimates.ofWeightedDensities {L : Type*}
    [NormedAddCommGroup L] [NormedSpace ℝ L]
    (raw weighted rawExterior weightedExterior actualExterior : ι → CollarChirality → L)
    (actualJoined : ι → Set.Icc (0 : ℝ) 1 → CollarChirality → L)
    (joinedAllowance exteriorAllowance : ι → CollarChirality → ℝ)
    (hRaw : ∀ j ∈ indices, ∀ sign, source.charge sign (annulus j) = ‖raw j sign‖ ^ 2)
    (hRawExterior : ∀ j ∈ indices, ∀ sign,
      source.charge sign (annulus j \ disk j) = ‖rawExterior j sign‖ ^ 2)
    (hJoined : ∀ j ∈ indices, ∀ t sign,
      (a.joinedSingle j t).charge sign (annulus j) = ‖actualJoined j t sign‖ ^ 2)
    (hExterior : ∀ j ∈ indices, ∀ sign,
      (a.outputSingle j).charge sign (annulus j \ disk j) = ‖actualExterior j sign‖ ^ 2)
    (hJoinedError : ∀ j ∈ indices, ∀ t sign,
      ‖actualJoined j t sign - ((1 - (t : ℝ)) • raw j sign + (t : ℝ) • weighted j sign)‖ ≤
        (t : ℝ) * joinedAllowance j sign)
    (hExteriorError : ∀ j ∈ indices, ∀ sign,
      ‖actualExterior j sign - weightedExterior j sign‖ ≤ exteriorAllowance j sign) :
    a.Estimates where
  joinedWeighted j sign := ‖weighted j sign‖ ^ 2
  exteriorWeighted j sign := ‖weightedExterior j sign‖ ^ 2
  joinedAllowance := joinedAllowance
  exteriorAllowance := exteriorAllowance
  joined_bound j hj t sign := by
    rw [hJoined j hj t sign, hRaw j hj sign]
    exact normSq_sub_le_signedJoinedCollarCost (raw j sign) (weighted j sign)
      (actualJoined j t sign) t.property (hJoinedError j hj t sign)
  exterior_bound j hj sign := by
    rw [hExterior j hj sign, hRawExterior j hj sign]
    exact normSq_sub_le_signedExteriorCollarCost (rawExterior j sign) (weightedExterior j sign)
      (actualExterior j sign) (hExteriorError j hj sign)

noncomputable def Estimates.joinedCost (b : a.Estimates) (j : ι) (sign : CollarChirality) : ℝ :=
  signedJoinedCollarCost (source.charge sign (annulus j)) (b.joinedWeighted j sign)
    (b.joinedAllowance j sign)

noncomputable def Estimates.exteriorCost (b : a.Estimates) (j : ι) (sign : CollarChirality) : ℝ :=
  signedExteriorCollarCost (source.charge sign (annulus j \ disk j)) (b.exteriorWeighted j sign)
    (b.exteriorAllowance j sign)

/-- Sum the tighter of two joined allowances at each patch. -/
noncomputable def Estimates.joinedCeiling (b : a.Estimates) : ℝ :=
  source.energy .plus + ∑ j ∈ indices, min (b.joinedCost j .plus) (b.joinedCost j .minus)

/-- Sum the larger of two guaranteed gains at each patch. The sign can vary. -/
noncomputable def Estimates.gain (b : a.Estimates) : ℝ :=
  ∑ j ∈ indices, max (source.charge .plus (disk j) - b.exteriorCost j .plus)
    (source.charge .minus (disk j) - b.exteriorCost j .minus)

omit [I.Boundaryless] [Nonempty M] in
private theorem energy_sub_eq_sum (q g : SignedCollarMetric o) (sign : CollarChirality)
    (A : ι → Set M) (hA : ∀ j ∈ indices, MeasurableSet (A j))
    (hDisjoint : (indices : Set ι).PairwiseDisjoint A)
    (hOutside : q.charge sign (⋃ j ∈ indices, A j)ᶜ =
      g.charge sign (⋃ j ∈ indices, A j)ᶜ) :
    q.energy sign - g.energy sign =
      ∑ j ∈ indices, (q.charge sign (A j) - g.charge sign (A j)) := by
  have hq : q.energy sign = q.charge sign (⋃ j ∈ indices, A j)ᶜ +
      ∑ j ∈ indices, q.charge sign (A j) :=
    (q.charge_univ sign).symm.trans (real_univ_eq_compl_add_sum _ _ A hA hDisjoint)
  have hg : g.energy sign = g.charge sign (⋃ j ∈ indices, A j)ᶜ +
      ∑ j ∈ indices, g.charge sign (A j) :=
    (g.charge_univ sign).symm.trans (real_univ_eq_compl_add_sum _ _ A hA hDisjoint)
  rw [Finset.sum_sub_distrib]
  linarith only [hq, hg, hOutside]

omit [I.Boundaryless] [Nonempty M] in
private theorem singleIncrement_eq (q : SignedCollarMetric o) {A : Set M} (hA : MeasurableSet A)
    (hOutside : ∀ sign, q.charge sign Aᶜ = source.charge sign Aᶜ) :
    q.charge .plus A - source.charge .plus A = q.charge .minus A - source.charge .minus A :=
  signedCollarIncrement_eq_of_signature _ _ _ _ hA source.charge_univ_plus_eq_minus
    q.charge_univ_plus_eq_minus (hOutside .plus) (hOutside .minus)

omit [I.Boundaryless] [Nonempty M] in
/-- At each joined parameter, signature for the single-patch metric
allows the simultaneous energy to use the smaller allowance patch by patch. -/
theorem joinedEnergy_le (b : a.Estimates) (t : Set.Icc (0 : ℝ) 1) :
    (a.joined t).energy .plus ≤ b.joinedCeiling := by
  have hDisjoint : (indices : Set ι).PairwiseDisjoint annulus := by
    intro j hj k hk hjk
    exact (a.disjoint hj hk hjk).mono Set.subset_union_right Set.subset_union_right
  have hAccount := energy_sub_eq_sum (a.joined t) source .plus annulus
    a.annulus_measurable hDisjoint (a.joined_complement t .plus)
  have hSum : (∑ j ∈ indices, ((a.joined t).charge .plus (annulus j) -
      source.charge .plus (annulus j))) ≤
      ∑ j ∈ indices, min (b.joinedCost j .plus) (b.joinedCost j .minus) := by
    apply Finset.sum_le_sum
    intro j hj
    rw [a.joined_patch j hj t .plus]
    exact le_min (b.joined_bound j hj t .plus) (by
      rw [singleIncrement_eq (a.joinedSingle j t) (a.annulus_measurable j hj)
        (a.joined_single_complement j hj t)]
      exact b.joined_bound j hj t .minus)
  unfold Estimates.joinedCeiling
  linarith only [hAccount, hSum]

omit [I.Boundaryless] [Nonempty M] in
private theorem charge_patch (a : SignedCollarAssembly source indices disk annulus)
    (q : SignedCollarMetric o) (sign : CollarChirality)
    (j : ι) (hj : j ∈ indices) :
    q.charge sign (disk j ∪ annulus j) =
      q.charge sign (disk j) + q.charge sign (annulus j \ disk j) :=
  (measureReal_add_sdiff (μ := q.chiralMeasure sign) (t := annulus j) (a.disk_measurable j hj)).symm

omit [I.Boundaryless] [Nonempty M] in
private theorem outputSingleIncrement_eq (j : ι) (hj : j ∈ indices) :
    (a.outputSingle j).charge .plus (disk j ∪ annulus j) -
      source.charge .plus (disk j ∪ annulus j) =
    (a.outputSingle j).charge .minus (disk j ∪ annulus j) -
      source.charge .minus (disk j ∪ annulus j) :=
  singleIncrement_eq (a.outputSingle j) ((a.disk_measurable j hj).union (a.annulus_measurable j hj))
    (a.output_single_complement j hj)

omit [I.Boundaryless] [Nonempty M] in
/-- The actual exterior increments differ exactly by the difference of the
two raw whole-disk charges. This is the post-cap single-patch signature identity. -/
theorem exteriorIncrement_sub_eq_diskCharge_sub (j : ι) (hj : j ∈ indices) :
    ((a.outputSingle j).charge .plus (annulus j \ disk j) -
        source.charge .plus (annulus j \ disk j)) -
      ((a.outputSingle j).charge .minus (annulus j \ disk j) -
        source.charge .minus (annulus j \ disk j)) =
      source.charge .plus (disk j) - source.charge .minus (disk j) := by
  have h := a.outputSingleIncrement_eq j hj
  rw [a.charge_patch (a.outputSingle j) .plus j hj, a.charge_patch (a.outputSingle j) .minus j hj,
    a.charge_patch source .plus j hj, a.charge_patch source .minus j hj,
    a.output_single_cap_zero j hj .plus, a.output_single_cap_zero j hj .minus] at h
  linarith only [h]

omit [I.Boundaryless] [Nonempty M] in
/-- The energy bound is for the same output metric at every patch. The full
complement is accounted for before summing the larger per-patch gain. -/
theorem outputEnergy_le (b : a.Estimates) :
    a.output.energy .plus ≤ source.energy .plus - b.gain := by
  have hAccount := energy_sub_eq_sum a.output source .plus (fun j => disk j ∪ annulus j)
    (fun j hj => (a.disk_measurable j hj).union (a.annulus_measurable j hj))
    a.disjoint (a.output_complement .plus)
  have hSum : b.gain ≤ ∑ j ∈ indices,
      (-(a.output.charge .plus (disk j ∪ annulus j) - source.charge .plus (disk j ∪ annulus j))) := by
    unfold Estimates.gain
    apply Finset.sum_le_sum
    intro j hj
    have hOutput : a.output.charge .plus (disk j ∪ annulus j) =
        (a.outputSingle j).charge .plus (disk j ∪ annulus j) := by
      rw [a.charge_patch a.output .plus j hj, a.charge_patch (a.outputSingle j) .plus j hj,
        a.output_cap_zero j hj .plus, a.output_single_cap_zero j hj .plus, a.output_patch j hj .plus]
    rw [hOutput]
    apply max_le
    · have hBound := b.exterior_bound j hj .plus
      change _ ≤ b.exteriorCost j .plus at hBound
      rw [a.charge_patch (a.outputSingle j) .plus j hj, a.charge_patch source .plus j hj,
        a.output_single_cap_zero j hj .plus]
      linarith only [hBound]
    · have hBound := b.exterior_bound j hj .minus
      change _ ≤ b.exteriorCost j .minus at hBound
      rw [a.outputSingleIncrement_eq j hj, a.charge_patch (a.outputSingle j) .minus j hj,
        a.charge_patch source .minus j hj, a.output_single_cap_zero j hj .minus]
      linarith only [hBound]
  rw [Finset.sum_neg_distrib] at hSum
  linarith only [hSum, hAccount]

/-- A strict joined ceiling triggers positivity of the same capped output
via the supplied marked stretching and compactification implication. -/
theorem outputPositive_of_joinedCeiling_lt (b : a.Estimates)
    (hPositive : (∀ t, (a.joined t).energy .plus < 2 * (4 * Real.pi ^ 2)) →
      0 < classYamabeFour o.dimension_eq a.output.metric)
    (hCeiling : b.joinedCeiling < 2 * (4 * Real.pi ^ 2)) :
    0 < classYamabeFour o.dimension_eq a.output.metric :=
  hPositive fun t => (joinedEnergy_le b t).trans_lt hCeiling

/-- A positive capped output is an actual same-type competitor. Its
guaranteed gain cannot exceed the finite excess of its source. -/
theorem gain_le_excess (b : a.Estimates)
    (hY : 0 < classYamabeFour o.dimension_eq a.output.metric) :
    b.gain ≤ source.energy .plus - sInf (geometricPositiveEnergies o) := by
  have hInf := csInf_le (geometricPositiveEnergies_bddBelow o) (a.output.energy_mem_of_positive hY)
  linarith only [hInf, outputEnergy_le b]

/-- A strict saving past the finite excess and a strict joined ceiling
exclude a realization of the supplied marked accounting and positivity data. -/
theorem excludesStrictSignedCollarRepair (b : a.Estimates)
    (hPositive : (∀ t, (a.joined t).energy .plus < 2 * (4 * Real.pi ^ 2)) →
      0 < classYamabeFour o.dimension_eq a.output.metric)
    (hCeiling : b.joinedCeiling < 2 * (4 * Real.pi ^ 2))
    (hGain : source.energy .plus - sInf (geometricPositiveEnergies o) < b.gain) : False :=
  hGain.not_ge (gain_le_excess b (outputPositive_of_joinedCeiling_lt b hPositive hCeiling))

end SignedCollarAssembly

end Geometric

section SelectedWidths

local notation "E₄" => EuclideanSpace ℝ (Fin 4)

variable {H M ι : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  [CompactSpace M] [Nonempty M] {o : ManifoldOrientation I M 4}
  {source : SignedCollarMetric o} {indices : Finset ι}

/-- The exact trims of the supplied marked disks, with radial width
`1 / (width j + 1)` on patch `j`. Taking `width` constant uses one width
for the entire finite family. -/
abbrev SelectedDiskSignedCollarAssembly (source : SignedCollarMetric o) (indices : Finset ι)
    (F : ι → PartialDiffeomorph 𝓘(ℝ, E₄) I E₄ M ∞) (width : ι → ℕ) :=
  SignedCollarAssembly source indices (fun j => selectedChartDisk (F j))
    (fun j => selectedDiskTrim (F j) (width j))

/-- The strict same-type comparison uses the supplied marked widths for both
the joined and exterior estimates. -/
theorem excludesStrictSelectedDiskSignedCollarRepair
    {F : ι → PartialDiffeomorph 𝓘(ℝ, E₄) I E₄ M ∞} {width : ι → ℕ}
    {a : SelectedDiskSignedCollarAssembly source indices F width} (b : a.Estimates)
    (hPositive : (∀ t, (a.joined t).energy .plus < 2 * (4 * Real.pi ^ 2)) →
      0 < classYamabeFour o.dimension_eq a.output.metric)
    (hCeiling : b.joinedCeiling < 2 * (4 * Real.pi ^ 2))
    (hGain : source.energy .plus - sInf (geometricPositiveEnergies o) < b.gain) : False :=
  SignedCollarAssembly.excludesStrictSignedCollarRepair b hPositive hCeiling hGain

end SelectedWidths

end SmoothPoincare
