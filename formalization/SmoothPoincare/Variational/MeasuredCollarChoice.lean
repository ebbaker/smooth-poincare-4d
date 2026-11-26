import SmoothPoincare.Variational.SignedCollarCapTests

/-! # Finite measured selection of collar repairs -/

open DifferentialGeometry FirstOrderTwistor MeasureTheory Set
open scoped ContDiff Manifold

namespace SmoothPoincare

variable {ι κ : Type*}

/-- The measured candidate score combines the chiral curvature bound and the local
weighted splice error. -/
noncomputable def measuredCollarScore (curvature allowance : ℝ) : ℝ :=
  curvature ^ 2 + allowance ^ 2

/-- The row budget from measured curvature, gauge derivative and chart
deviation over the same candidates of a protected core. -/
noncomputable def measuredCollarCandidateBudget (candidates : ι → Finset κ)
    (curvature gaugeDerivative chartDeviation : ι → κ → ℝ)
    (smallness : ι → ℝ) (C : ℝ) (j : ι) : ℝ :=
  let Wsq := ∑ k ∈ candidates j, curvature j k ^ 2
  let Lsq := ∑ k ∈ candidates j, gaugeDerivative j k ^ 2
  let Psq := ∑ k ∈ candidates j, chartDeviation j k ^ 2
  Wsq + C * (smallness j ^ 2 * (Wsq + Lsq) +
    Real.sqrt Psq * (Real.sqrt Wsq + Real.sqrt Lsq) + Psq)

/-- The total price is twice the sum of the certified row averages. -/
noncomputable def measuredCollarGamma (indices : Finset ι) (candidates : ι → Finset κ)
    (budget : ι → ℝ) : ℝ :=
  2 * ∑ j ∈ indices, budget j / (candidates j).card

/-- A minimizing candidate is selected independently for every core. Its
score is at most the certified row average, including at singletons. -/
theorem exists_measuredCollarChoice [Nonempty κ] (indices : Finset ι)
    (candidates : ι → Finset κ) (curvature allowance : ι → κ → ℝ) (budget : ι → ℝ)
    (hNonempty : ∀ j ∈ indices, (candidates j).Nonempty)
    (hBudget : ∀ j ∈ indices,
      (∑ k ∈ candidates j, measuredCollarScore (curvature j k) (allowance j k)) ≤ budget j) :
    ∃ pick : ι → κ,
      (∀ j ∈ indices, pick j ∈ candidates j ∧
        ∀ k ∈ candidates j, measuredCollarScore (curvature j (pick j)) (allowance j (pick j)) ≤
          measuredCollarScore (curvature j k) (allowance j k)) ∧
      (∀ j ∈ indices, measuredCollarScore (curvature j (pick j)) (allowance j (pick j)) ≤
        budget j / (candidates j).card) ∧
      (∑ j ∈ indices, 2 * measuredCollarScore (curvature j (pick j)) (allowance j (pick j))) ≤
        measuredCollarGamma indices candidates budget := by
  classical
  let score := fun j k => measuredCollarScore (curvature j k) (allowance j k)
  have hExists (j : ι) :
      ∃ p, j ∈ indices → p ∈ candidates j ∧ ∀ k ∈ candidates j, score j p ≤ score j k := by
    by_cases hj : j ∈ indices
    · obtain ⟨p, hp, hmin⟩ := (candidates j).exists_min_image (score j) (hNonempty j hj)
      exact ⟨p, fun _ => ⟨hp, hmin⟩⟩
    · exact ⟨Classical.choice ‹Nonempty κ›, fun h => (hj h).elim⟩
  choose pick hPick using hExists
  have hAverage (j : ι) (hj : j ∈ indices) : score j (pick j) ≤ budget j / (candidates j).card := by
    have hCard : 0 < ((candidates j).card : ℝ) := by
      exact_mod_cast Finset.card_pos.mpr (hNonempty j hj)
    apply (le_div_iff₀ hCard).2
    calc
      _ = ∑ k ∈ candidates j, score j (pick j) := by simp [mul_comm]
      _ ≤ ∑ k ∈ candidates j, score j k := Finset.sum_le_sum (hPick j hj).2
      _ ≤ budget j := hBudget j hj
  refine ⟨pick, hPick, hAverage, ?_⟩
  unfold measuredCollarGamma
  rw [Finset.mul_sum]
  exact Finset.sum_le_sum fun j hj => mul_le_mul_of_nonneg_left (hAverage j hj) (by norm_num)

/-- Either signed cost is at most the uniform surcharge on the measured
candidate when the cutoff-weighted charge lies below the raw charge. -/
theorem signedCollarCosts_le_measuredScore {raw weighted error curvature allowance : ℝ}
    (hRaw : 0 ≤ raw) (hWeighted : weighted ≤ raw) (hCurvature : raw ≤ curvature ^ 2 / 4)
    (hError : 0 ≤ error) (hAllowance : error ≤ allowance) :
    signedJoinedCollarCost raw weighted error ≤ 2 * measuredCollarScore curvature allowance ∧
      signedExteriorCollarCost raw weighted error ≤ 2 * measuredCollarScore curvature allowance := by
  have hSquare := pow_le_pow_left₀ (add_nonneg (Real.sqrt_nonneg weighted) hError)
    (add_le_add (Real.sqrt_le_sqrt hWeighted) hAllowance) 2
  have hBound : (Real.sqrt weighted + error) ^ 2 - raw ≤ 2 * measuredCollarScore curvature allowance := by
    unfold measuredCollarScore
    nlinarith only [hSquare, Real.sq_sqrt hRaw, sq_nonneg (Real.sqrt raw - allowance),
      hCurvature, sq_nonneg curvature]
  exact ⟨max_le (by unfold measuredCollarScore; positivity) hBound, hBound⟩

section Geometric

variable {E H M : Type*}
  [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [T2Space M] [CompactSpace M] [Nonempty M]
  {o : ManifoldOrientation I M 4} {source : SignedCollarMetric o} {indices : Finset ι}
  {disk annulus : ι → Set M} {a : SignedCollarAssembly source indices disk annulus}

/-- The chosen candidate quantities bound the two physical charges and
both errors on the identical annulus used to assemble the metric. -/
structure SignedCollarCandidateControls (b : a.Estimates) (curvature allowance : ι → ℝ) : Prop where
  raw_le : ∀ j ∈ indices, ∀ sign, source.charge sign (annulus j) ≤ curvature j ^ 2 / 4
  joined_weighted_le : ∀ j ∈ indices, ∀ sign,
    b.joinedWeighted j sign ≤ source.charge sign (annulus j)
  exterior_weighted_le : ∀ j ∈ indices, ∀ sign,
    b.exteriorWeighted j sign ≤ source.charge sign (annulus j \ disk j)
  joined_error : ∀ j ∈ indices, ∀ sign,
    0 ≤ b.joinedAllowance j sign ∧ b.joinedAllowance j sign ≤ allowance j
  exterior_error : ∀ j ∈ indices, ∀ sign,
    0 ≤ b.exteriorAllowance j sign ∧ b.exteriorAllowance j sign ≤ allowance j

namespace SignedCollarCandidateControls

variable {b : a.Estimates} {curvature allowance : ι → ℝ}

omit [I.Boundaryless] [Nonempty M] in
theorem joinedCost_le (h : SignedCollarCandidateControls b curvature allowance)
    (j : ι) (hj : j ∈ indices) (sign : CollarChirality) :
    b.joinedCost j sign ≤ 2 * measuredCollarScore (curvature j) (allowance j) :=
  (signedCollarCosts_le_measuredScore measureReal_nonneg (h.joined_weighted_le j hj sign)
    (h.raw_le j hj sign) (h.joined_error j hj sign).1 (h.joined_error j hj sign).2).1

omit [I.Boundaryless] [Nonempty M] in
theorem exteriorCost_le (h : SignedCollarCandidateControls b curvature allowance)
    (j : ι) (hj : j ∈ indices) (sign : CollarChirality) :
    b.exteriorCost j sign ≤ 2 * measuredCollarScore (curvature j) (allowance j) :=
  (signedCollarCosts_le_measuredScore measureReal_nonneg (h.exterior_weighted_le j hj sign)
    ((measureReal_mono (μ := source.chiralMeasure sign) Set.sdiff_subset).trans (h.raw_le j hj sign))
    (h.exterior_error j hj sign).1 (h.exterior_error j hj sign).2).2

end SignedCollarCandidateControls

/-- Combine the two signed allowances and the charge on each protected core
for one supplied simultaneous repair and its own cap test path. -/
theorem excludesStrictMeasuredCollarRepair
    {P : Type*} [TopologicalSpace P] [PreconnectedSpace P]
    (path : SignedCollarCapTestPath a P) (b : a.Estimates)
    {curvature allowance : ι → ℝ} (hControl : SignedCollarCandidateControls b curvature allowance)
    (core : ι → Set M) (hCore : ∀ j ∈ indices, core j ⊆ disk j)
    {Γ : ℝ}
    (hSum : (∑ j ∈ indices, 2 * measuredCollarScore (curvature j) (allowance j)) ≤ Γ)
    (hSource : 0 < classYamabeFour o.dimension_eq source.metric)
    (hCeiling : source.energy .plus + Γ < 2 * (4 * Real.pi ^ 2))
    (hGain : Γ + (source.energy .plus - sInf (geometricPositiveEnergies o)) <
      ∑ j ∈ indices, max (source.charge .plus (core j)) (source.charge .minus (core j))) :
    False := by
  let row := fun j => 2 * measuredCollarScore (curvature j) (allowance j)
  have hJoined : b.joinedCeiling ≤ source.energy .plus + ∑ j ∈ indices, row j := by
    unfold SignedCollarAssembly.Estimates.joinedCeiling
    apply add_le_add_right
    apply Finset.sum_le_sum
    intro j hj
    exact (min_le_left _ _).trans (hControl.joinedCost_le j hj .plus)
  have hCoreSum : (∑ j ∈ indices, max (source.charge .plus (core j))
      (source.charge .minus (core j))) ≤ b.gain + ∑ j ∈ indices, row j := by
    unfold SignedCollarAssembly.Estimates.gain
    rw [← Finset.sum_add_distrib]
    apply Finset.sum_le_sum
    intro j hj
    apply max_le
    · have hCharge := measureReal_mono (μ := source.chiralMeasure .plus) (hCore j hj)
      change source.charge .plus (core j) ≤ source.charge .plus (disk j) at hCharge
      have hCost := hControl.exteriorCost_le j hj .plus
      change b.exteriorCost j .plus ≤ row j at hCost
      linarith only [hCharge, hCost, le_max_left (source.charge .plus (disk j) -
        b.exteriorCost j .plus) (source.charge .minus (disk j) - b.exteriorCost j .minus)]
    · have hCharge := measureReal_mono (μ := source.chiralMeasure .minus) (hCore j hj)
      change source.charge .minus (core j) ≤ source.charge .minus (disk j) at hCharge
      have hCost := hControl.exteriorCost_le j hj .minus
      change b.exteriorCost j .minus ≤ row j at hCost
      linarith only [hCharge, hCost, le_max_right (source.charge .plus (disk j) -
        b.exteriorCost j .plus) (source.charge .minus (disk j) - b.exteriorCost j .minus)]
  change (∑ j ∈ indices, row j) ≤ Γ at hSum
  exact path.excludesStrictRepair b hSource (by linarith only [hJoined, hSum, hCeiling])
    (by linarith only [hCoreSum, hSum, hGain])

/-- The finite measured criterion chooses candidate annuli and consumes a
geometric realization on those exact choices. The coordinate derivative
and chart-deviation budget is certified separately for each row. -/
theorem excludesStrictRepair_of_measuredCollarChoice
    {P : Type*} [TopologicalSpace P] [PreconnectedSpace P] [Nonempty κ]
    (candidates : ι → Finset κ) (candidateDisk candidateAnnulus : ι → κ → Set M)
    (curvature gaugeDerivative chartDeviation allowance : ι → κ → ℝ)
    (smallness : ι → ℝ) (C : ℝ) (core : ι → Set M)
    (hNonempty : ∀ j ∈ indices, (candidates j).Nonempty)
    (hCore : ∀ j ∈ indices, ∀ k ∈ candidates j, core j ⊆ candidateDisk j k)
    (hBudget : ∀ j ∈ indices,
      (∑ k ∈ candidates j, measuredCollarScore (curvature j k) (allowance j k)) ≤
        measuredCollarCandidateBudget candidates curvature gaugeDerivative chartDeviation smallness C j)
    (hRealize : ∀ pick : ι → κ,
      (∀ j ∈ indices, pick j ∈ candidates j ∧
        ∀ k ∈ candidates j, measuredCollarScore (curvature j (pick j)) (allowance j (pick j)) ≤
          measuredCollarScore (curvature j k) (allowance j k)) →
      ∃ (assembly : SignedCollarAssembly source indices (fun j => candidateDisk j (pick j))
          (fun j => candidateAnnulus j (pick j))) (b : assembly.Estimates),
        Nonempty (SignedCollarCapTestPath assembly P) ∧
          SignedCollarCandidateControls b (fun j => curvature j (pick j))
            (fun j => allowance j (pick j))) :
    let Γ := measuredCollarGamma indices candidates
      (measuredCollarCandidateBudget candidates curvature gaugeDerivative chartDeviation smallness C)
    0 < classYamabeFour o.dimension_eq source.metric →
    source.energy .plus + Γ < 2 * (4 * Real.pi ^ 2) →
    Γ + (source.energy .plus - sInf (geometricPositiveEnergies o)) <
      (∑ j ∈ indices, max (source.charge .plus (core j)) (source.charge .minus (core j))) →
    False := by
  intro Γ hSource hCeiling hGain
  obtain ⟨pick, hPick, _, hSum⟩ :=
    exists_measuredCollarChoice indices candidates curvature allowance _ hNonempty hBudget
  obtain ⟨assembly, b, ⟨path⟩, hControl⟩ := hRealize pick hPick
  exact excludesStrictMeasuredCollarRepair path b hControl core
    (fun j hj => hCore j hj (pick j) (hPick j hj).1) hSum hSource hCeiling hGain

end Geometric

section SelectedWidths

local notation "E₄" => EuclideanSpace ℝ (Fin 4)

variable {H M P : Type*}
  [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [T2Space M] [CompactSpace M] [Nonempty M] [TopologicalSpace P] [PreconnectedSpace P]
  {o : ManifoldOrientation I M 4} {source : SignedCollarMetric o} {indices : Finset ι}

/-- Specialize the measured criterion to the original chart disks and the
radial trim width of each selected candidate. -/
theorem excludesStrictRepair_of_measuredSelectedDiskCollarChoice [Nonempty κ]
    (candidates : ι → Finset κ) (F : ι → κ → PartialDiffeomorph 𝓘(ℝ, E₄) I E₄ M ∞)
    (width : ι → κ → ℕ)
    (curvature gaugeDerivative chartDeviation allowance : ι → κ → ℝ)
    (smallness : ι → ℝ) (C : ℝ) (core : ι → Set M)
    (hNonempty : ∀ j ∈ indices, (candidates j).Nonempty)
    (hCore : ∀ j ∈ indices, ∀ k ∈ candidates j, core j ⊆ selectedChartDisk (F j k))
    (hBudget : ∀ j ∈ indices,
      (∑ k ∈ candidates j, measuredCollarScore (curvature j k) (allowance j k)) ≤
        measuredCollarCandidateBudget candidates curvature gaugeDerivative chartDeviation smallness C j)
    (hRealize : ∀ pick : ι → κ,
      (∀ j ∈ indices, pick j ∈ candidates j ∧
        ∀ k ∈ candidates j, measuredCollarScore (curvature j (pick j)) (allowance j (pick j)) ≤
          measuredCollarScore (curvature j k) (allowance j k)) →
      ∃ (assembly : SelectedDiskSignedCollarAssembly source indices (fun j => F j (pick j))
          (fun j => width j (pick j))) (b : assembly.Estimates),
        Nonempty (SignedCollarCapTestPath assembly P) ∧
          SignedCollarCandidateControls b (fun j => curvature j (pick j))
            (fun j => allowance j (pick j))) :
    let Γ := measuredCollarGamma indices candidates
      (measuredCollarCandidateBudget candidates curvature gaugeDerivative chartDeviation smallness C)
    0 < classYamabeFour o.dimension_eq source.metric →
    source.energy .plus + Γ < 2 * (4 * Real.pi ^ 2) →
    Γ + (source.energy .plus - sInf (geometricPositiveEnergies o)) <
      (∑ j ∈ indices, max (source.charge .plus (core j)) (source.charge .minus (core j))) →
    False :=
  excludesStrictRepair_of_measuredCollarChoice candidates (fun j k => selectedChartDisk (F j k))
    (fun j k => selectedDiskTrim (F j k) (width j k)) curvature gaugeDerivative chartDeviation
    allowance smallness C core hNonempty hCore hBudget hRealize

end SelectedWidths

end SmoothPoincare
