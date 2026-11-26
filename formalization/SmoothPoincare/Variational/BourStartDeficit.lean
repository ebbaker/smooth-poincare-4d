import SmoothPoincare.Variational.BourReturnedBudgets
import SmoothPoincare.Variational.BourYamabeStarts

/-!
# A fixed Yamabe deficit on prescribed-excess Bour starts

26 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance.
Actual serving model and effort were unavailable. FOT-E48 uses the E47
start selection and measured saturation at intake HEAD
`226b8f404b6e5c99f8e71f85280e5c9988bbf652`.
-/

open DifferentialGeometry DifferentialGeometry.Geometry.Curvature DifferentialGeometry.Integral.Measure
open FirstOrderTwistor Filter MeasureTheory SectionsAndConnections Set
open scoped ContDiff Manifold Topology

namespace SmoothPoincare

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [T2Space M] [CompactSpace M] [ConnectedSpace M]
  {o : ManifoldOrientation I M 4}

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

/-- The energies of actual positive conformal classes on this type whose
squared Yamabe deficit is at least `δ`. All energies use their own physical
volume and the oriented curvature-derived positive Weyl block. -/
def bourDeficitEnergies (o : ManifoldOrientation I M 4) (δ : ℝ) : Set ℝ :=
  {e | ∃ (g : SmoothRiemannianMetric I M) (frame : ∀ x, OrientedOrthonormalFrameAt g o x),
    let W := fun x => geometricChiralBlock g o x (frame x)
    0 < classYamabeFour o.dimension_eq g ∧
      Integrable (fun x => hilbertSchmidtSq (W x)) (riemannianVolumeMeasure I M g) ∧
      chiralFrameEnergy g W = e ∧ δ ≤ 384 * Real.pi ^ 2 - (classYamabeFour o.dimension_eq g)^2}

private theorem bourDeficitEnergies_subset (o : ManifoldOrientation I M 4) (δ : ℝ) :
    bourDeficitEnergies o δ ⊆ geometricPositiveEnergies o := by
  rintro e ⟨g, frame, hY, hInt, hE, _⟩
  exact ⟨g, frame, hY, hInt, hE⟩

/-- The numerical characterization requires a nonempty restricted set even
when its real infimum happens to be zero. -/
theorem bourDeficitInfimum_eq_iff_near (o : ManifoldOrientation I M 4) (δ : ℝ) :
    ((bourDeficitEnergies o δ).Nonempty ∧
      sInf (bourDeficitEnergies o δ) = sInf (geometricPositiveEnergies o)) ↔
    ∀ ε > 0, ∃ e ∈ bourDeficitEnergies o δ, e < sInf (geometricPositiveEnergies o) + ε := by
  let A := bourDeficitEnergies o δ
  let Istar := sInf (geometricPositiveEnergies o)
  have hBelow := (geometricPositiveEnergies_bddBelow o).mono (bourDeficitEnergies_subset o δ)
  have hLower (e) (he : e ∈ A) : Istar ≤ e :=
    csInf_le (geometricPositiveEnergies_bddBelow o) (bourDeficitEnergies_subset o δ he)
  constructor
  · rintro ⟨hA, heq⟩ ε hε
    exact exists_lt_of_csInf_lt hA (heq.trans_lt (lt_add_of_pos_right Istar hε))
  · intro hNear
    obtain ⟨e, he, _⟩ := hNear 1 zero_lt_one
    have hA : A.Nonempty := ⟨e, he⟩
    refine ⟨hA, le_antisymm ?_ (le_csInf hA hLower)⟩
    by_contra! hlt
    obtain ⟨e', he', hE'⟩ := hNear (sInf A - Istar) (sub_pos.mpr hlt)
    exact (csInf_le hBelow he').not_gt (by linarith only [hE'])

/-- Each selected metric is in the same unit-volume constant-scalar Yamabe
normalization as the E47 start. The fixed threshold and deficit gaps are
independent of the parameter in the excess inequality. -/
structure BourDeficitYamabeStart (q : SignedCollarMetric o) (δ η α : ℝ) : Prop where
  positive : 0 < classYamabeFour o.dimension_eq q.metric
  volume_one : riemannianVolumeMeasure I M q.metric univ = 1
  scalar_csc : ∀ x, metricScalarAt q.metric x = classYamabeFour o.dimension_eq q.metric
  scalar_square : (∫ x, metricScalarAt q.metric x ^ 2 ∂riemannianVolumeMeasure I M q.metric) =
    (classYamabeFour o.dimension_eq q.metric)^2
  subcritical : q.energy .plus ≤ 8 * Real.pi ^ 2 - η
  excess_nonneg : 0 ≤ q.energy .plus - sInf (geometricPositiveEnergies o)
  excess_upper : q.energy .plus - sInf (geometricPositiveEnergies o) ≤ α^2
  deficit : δ ≤ 384 * Real.pi ^ 2 - (classYamabeFour o.dimension_eq q.metric)^2

private theorem BourDeficitYamabeStart.energy_mem_deficit {q : SignedCollarMetric o} {δ η α : ℝ}
    (h : BourDeficitYamabeStart q δ η α) : q.energy .plus ∈ bourDeficitEnergies o δ :=
  ⟨q.metric, q.frame, h.positive, q.integrable .plus, rfl, h.deficit⟩

private theorem exists_normalizedDeficitStart (hNormalize : BourYamabeNormalization o)
    {e δ η α : ℝ} (hMem : e ∈ bourDeficitEnergies o δ) (hη : 0 < η)
    (hGap : e ≤ 8 * Real.pi ^ 2 - η) (hNear : e - sInf (geometricPositiveEnergies o) ≤ α^2) :
    ∃ q : SignedCollarMetric o, BourDeficitYamabeStart q δ η α := by
  obtain ⟨g, frame, hY, hInt, hE, hDef⟩ := hMem
  have hSub : chiralFrameEnergy g (fun x => geometricChiralBlock g o x (frame x)) < 8 * Real.pi ^ 2 := by
    rw [hE]
    exact hGap.trans_lt (sub_lt_self _ hη)
  obtain ⟨u, q, hMetric, hVol, hScalar, hEnergy⟩ := hNormalize g frame hY hInt hSub
  have hYq : classYamabeFour o.dimension_eq q.metric = classYamabeFour o.dimension_eq g := by
    rw [hMetric, classYamabeFour_conformalCore]
  have hPos : 0 < classYamabeFour o.dimension_eq q.metric := hYq.symm ▸ hY
  have hCSC x := (hScalar x).trans hYq.symm
  have hSq : (∫ x, metricScalarAt q.metric x ^ 2 ∂riemannianVolumeMeasure I M q.metric) =
      (classYamabeFour o.dimension_eq q.metric)^2 := by
    simp only [hCSC, integral_const, Measure.real, hVol, ENNReal.toReal_one, one_smul]
  have hEq : q.energy .plus = e := hEnergy.trans hE
  refine ⟨q, hPos, hVol, hCSC, hSq, hEq.trans_le hGap, ?_, ?_, hYq.symm ▸ hDef⟩
  · exact sub_nonneg.mpr (csInf_le (geometricPositiveEnergies_bddBelow o) (q.energy_mem_of_positive hPos))
  · rwa [hEq]

private theorem exists_deficitStarts_for_schedule (hNormalize : BourYamabeNormalization o)
    (hEntry : sInf (geometricPositiveEnergies o) < 8 * Real.pi ^ 2) {δ : ℝ}
    (hNear : ∀ ε > 0, ∃ e ∈ bourDeficitEnergies o δ, e < sInf (geometricPositiveEnergies o) + ε)
    (α : ℕ → ℝ) (hα : ∀ j, 0 < α j) :
    ∃ q : ℕ → SignedCollarMetric o, ∀ j, BourDeficitYamabeStart (q j) δ
      ((8 * Real.pi ^ 2 - sInf (geometricPositiveEnergies o)) / 2) (α j) := by
  let Istar := sInf (geometricPositiveEnergies o)
  let η := (8 * Real.pi ^ 2 - Istar) / 2
  have hη : 0 < η := half_pos (sub_pos.mpr hEntry)
  have hStarts (j : ℕ) : ∃ q : SignedCollarMetric o, BourDeficitYamabeStart q δ η (α j) := by
    obtain ⟨e, he, hE⟩ := hNear (min ((α j)^2) η) (lt_min (sq_pos_of_pos (hα j)) hη)
    have h₁ : e < Istar + η := hE.trans_le (add_le_add_right (min_le_right _ _) _)
    have h₂ : e < Istar + (α j)^2 := hE.trans_le (add_le_add_right (min_le_left _ _) _)
    exact exists_normalizedDeficitStart hNormalize he hη (by dsimp only [η] at h₁ ⊢; linarith only [h₁])
      ((sub_lt_iff_lt_add).mpr (by simpa only [add_comm Istar] using h₂)).le
  choose q hq using hStarts
  exact ⟨q, hq⟩

/-- On any prescribed vanishing positive schedule, the eventual geometric
start data suffice for equality of the nonempty restricted infimum. Conversely,
the same infimum condition constructs all indices with a common threshold gap. -/
theorem bourUniformDeficitTail_iff (hNormalize : BourYamabeNormalization o)
    (hEntry : sInf (geometricPositiveEnergies o) < 8 * Real.pi ^ 2) (δ : ℝ)
    (α : ℕ → ℝ) (hα : ∀ j, 0 < α j) (hLimit : Tendsto α atTop (𝓝 0)) :
    ((bourDeficitEnergies o δ).Nonempty ∧
      sInf (bourDeficitEnergies o δ) = sInf (geometricPositiveEnergies o)) ↔
    ∃ η > 0, ∃ q : ℕ → SignedCollarMetric o, ∀ᶠ j in atTop, BourDeficitYamabeStart (q j) δ η (α j) := by
  rw [bourDeficitInfimum_eq_iff_near]
  constructor
  · intro hNear
    obtain ⟨q, hq⟩ := exists_deficitStarts_for_schedule hNormalize hEntry hNear α hα
    exact ⟨_, half_pos (sub_pos.mpr hEntry), q, Eventually.of_forall hq⟩
  · rintro ⟨η, _, q, hq⟩ ε hε
    have hSq : Tendsto (fun j => (α j)^2) atTop (𝓝 0) := by simpa using hLimit.pow 2
    have hEventually : ∀ᶠ j in atTop, (α j)^2 < ε := hSq.eventually (gt_mem_nhds hε)
    obtain ⟨j, hStart, hSmall⟩ := (hq.and hEventually).exists
    have hE := hStart.excess_upper.trans_lt hSmall
    exact ⟨(q j).energy .plus, hStart.energy_mem_deficit, by linarith only [hE]⟩

/-- A single fixed positive squared deficit and the original arbitrary `α²`
excess are compatible exactly when the restricted set has the original infimum.
The gap below the entry threshold can be chosen before the parameter schedule. -/
theorem bourUniformDeficitStarts_iff (hNormalize : BourYamabeNormalization o)
    (hEntry : sInf (geometricPositiveEnergies o) < 8 * Real.pi ^ 2) (δ : ℝ) :
    ((bourDeficitEnergies o δ).Nonempty ∧
      sInf (bourDeficitEnergies o δ) = sInf (geometricPositiveEnergies o)) ↔
    ∃ η > 0, ∀ (α : ℕ → ℝ), (∀ j, 0 < α j) →
      ∃ q : ℕ → SignedCollarMetric o, ∀ j, BourDeficitYamabeStart (q j) δ η (α j) := by
  constructor
  · intro hInf
    have hNear := (bourDeficitInfimum_eq_iff_near o δ).mp hInf
    refine ⟨(8 * Real.pi ^ 2 - sInf (geometricPositiveEnergies o)) / 2,
      half_pos (sub_pos.mpr hEntry), ?_⟩
    intro α hα
    exact exists_deficitStarts_for_schedule hNormalize hEntry hNear α hα
  · rintro ⟨η, hη, h⟩
    let α : ℕ → ℝ := fun j => 1 / ((j : ℝ) + 1)
    have hα (j : ℕ) : 0 < α j := by dsimp [α]; positivity
    obtain ⟨q, hq⟩ := h α hα
    exact (bourUniformDeficitTail_iff hNormalize hEntry δ α hα
      tendsto_one_div_add_atTop_nhds_zero_nat).mpr ⟨η, hη, q, Eventually.of_forall hq⟩

/-- If every positive fixed-deficit restricted set fails to recover the original
infimum, each positive minimizing sequence with the round comparison must
itself saturate the round Yamabe bound. -/
theorem bourStartYamabeSq_tendsto_of_no_deficitRecovery (start : ℕ → SignedCollarMetric o)
    (hPositive : ∀ᶠ j in atTop, 0 < classYamabeFour o.dimension_eq (start j).metric)
    (hRound : ∀ᶠ j in atTop, (classYamabeFour o.dimension_eq (start j).metric)^2 ≤ 384 * Real.pi ^ 2)
    (hEnergy : Tendsto (fun j => (start j).energy .plus) atTop
      (𝓝 (sInf (geometricPositiveEnergies o))))
    (hNo : ∀ δ > 0, ¬ ((bourDeficitEnergies o δ).Nonempty ∧
      sInf (bourDeficitEnergies o δ) = sInf (geometricPositiveEnergies o))) :
    Tendsto (fun j => (classYamabeFour o.dimension_eq (start j).metric)^2) atTop
      (𝓝 (384 * Real.pi ^ 2)) := by
  rw [Metric.tendsto_nhds]
  intro δ hδ
  have hMissing := mt (bourDeficitInfimum_eq_iff_near o δ).mpr (hNo δ hδ)
  push Not at hMissing
  obtain ⟨ε, hε, hLower⟩ := hMissing
  have hUpper : ∀ᶠ j in atTop, (start j).energy .plus < sInf (geometricPositiveEnergies o) + ε :=
    hEnergy.eventually (gt_mem_nhds (lt_add_of_pos_right _ hε))
  filter_upwards [hPositive, hRound, hUpper] with j hPos hR hU
  rw [Real.dist_eq, abs_of_nonpos (sub_nonpos.mpr hR)]
  by_contra! hDef
  change δ ≤ -((classYamabeFour o.dimension_eq (start j).metric)^2 - 384 * Real.pi ^ 2) at hDef
  have hm : (start j).energy .plus ∈ bourDeficitEnergies o δ :=
    ⟨(start j).metric, (start j).frame, hPos, (start j).integrable .plus, rfl,
      by linarith only [hDef]⟩
  exact hU.not_ge (hLower _ hm)

/-- An already attained positive class with strictly subround Yamabe constant
has one normalized representative usable at every parameter with zero excess. -/
theorem exists_bourConstantDeficitYamabeStart_of_attainment
    (q : SignedCollarMetric o) (hNormalize : BourYamabeNormalization o)
    (hY : 0 < classYamabeFour o.dimension_eq q.metric)
    (hSubround : classYamabeFour o.dimension_eq q.metric < roundYamabeConstant)
    (hAttain : q.energy .plus = sInf (geometricPositiveEnergies o))
    (hEntry : sInf (geometricPositiveEnergies o) < 8 * Real.pi ^ 2) :
    ∃ δ > 0, ∃ η > 0, ∃ u : SignedCollarMetric o,
      u.energy .plus = sInf (geometricPositiveEnergies o) ∧ ∀ α : ℝ, BourDeficitYamabeStart u δ η α := by
  let δ := 384 * Real.pi^2 - (classYamabeFour o.dimension_eq q.metric)^2
  let η := (8 * Real.pi ^ 2 - sInf (geometricPositiveEnergies o)) / 2
  have hδ : 0 < δ := by
    dsimp [δ]
    rw [← roundYamabeConstant_sq]
    exact sub_pos.mpr ((sq_lt_sq₀ hY.le roundYamabeConstant_pos.le).mpr hSubround)
  have hη : 0 < η := half_pos (sub_pos.mpr hEntry)
  have hMem : q.energy .plus ∈ bourDeficitEnergies o δ :=
    ⟨q.metric, q.frame, hY, q.integrable .plus, rfl, le_rfl⟩
  obtain ⟨u, hu⟩ := exists_normalizedDeficitStart hNormalize (α := 0) hMem hη
    (by rw [hAttain]; dsimp [η]; linarith only [hEntry]) (by rw [hAttain]; norm_num)
  have hz : u.energy .plus - sInf (geometricPositiveEnergies o) ≤ 0 := by
    simpa only [zero_pow (by decide : 2 ≠ 0)] using hu.excess_upper
  have hElim := sub_nonpos.mp hz
  have hEin := sub_nonneg.mp hu.excess_nonneg
  exact ⟨δ, hδ, η, hη, u, le_antisymm hElim hEin, fun α =>
    {hu with excess_upper := hz.trans (sq_nonneg α)}⟩

/-- A tail with one positive squared Yamabe deficit cannot saturate on
any cofinal extracted subsequence of those same starting metrics. -/
theorem bourStartDeficit_excludes_saturation (start : ℕ → SignedCollarMetric o)
    {δ : ℝ} (hδ : 0 < δ) (k : ℕ → ℕ) (hk : Tendsto k atTop atTop)
    (hDeficit : ∀ᶠ j in atTop,
      δ ≤ 384 * Real.pi ^ 2 - (classYamabeFour o.dimension_eq (start j).metric)^2)
    (hSaturation : Tendsto (fun j => (classYamabeFour o.dimension_eq (start (k j)).metric)^2)
      atTop (𝓝 (384 * Real.pi ^ 2))) : False := by
  have hUpper : ∀ᶠ j in atTop,
      (classYamabeFour o.dimension_eq (start (k j)).metric)^2 ≤ 384 * Real.pi ^ 2 - δ :=
    (hk.eventually hDeficit).mono (fun _ h => by linarith only [h])
  exact (sub_lt_self _ hδ).not_ge (le_of_tendsto hSaturation hUpper)

/-- A fixed positive deficit also excludes eventual first pointed returns
that already supply the marked positive same-type competitor and the
required ordinary Ricci comparison. -/
theorem eventually_bourStartDeficit_excludes_firstPointed
    (start : ℕ → SignedCollarMetric o) (α : ℕ → ℝ) (hα : ∀ j, 0 < α j)
    (hαLimit : Tendsto α atTop (𝓝 0)) {δ : ℝ} (hδ : 0 < δ)
    (hExcess : ∀ᶠ j in atTop, (start j).energy .plus - sInf (geometricPositiveEnergies o) ≤ (α j)^2)
    (hDeficit : ∀ᶠ j in atTop,
      δ ≤ 384 * Real.pi ^ 2 - (classYamabeFour o.dimension_eq (start j).metric)^2) :
    ∀ᶠ j in atTop, ∀ (returned : SignedCollarMetric o) (Dlimit : ℝ),
      0 < classYamabeFour o.dimension_eq returned.metric → Dlimit = 4 * returned.energy .plus →
      Dlimit ≤ 4 * sInf (geometricPositiveEnergies o) +
        4 * ((start j).energy .plus - sInf (geometricPositiveEnergies o)) / α j +
        ((classYamabeFour o.dimension_eq (start j).metric)^2 - 384 * Real.pi ^ 2) / 12 → False := by
  have hLimit : ∀ᶠ j in atTop, α j < δ / 48 :=
    hαLimit.eventually (gt_mem_nhds (div_pos hδ (by norm_num)))
  filter_upwards [hExcess, hDeficit, hLimit] with j hEx hDef hSmall returned Dlimit hY hEnd hRicci
  have hPointed := (bourFirstPointed_excess_and_deficit (start j) returned
    (hα j) hY hEnd hRicci hEx).2
  linarith only [hPointed, hDef, hSmall]

namespace Bour

variable [BoundarylessManifold I M]

/-- In the physical unit-volume Yamabe gauge, a squared Yamabe deficit
is exactly twelve times the gap between four times the positive energy
and the ordinary trace-free Ricci integral. -/
theorem start_deficit_eq_ricciGap (q : SignedCollarMetric o)
    (hEuler : bourEuler q = 16 * Real.pi ^ 2)
    (hYamabe : bourScalar q = (classYamabeFour o.dimension_eq q.metric)^2) :
    384 * Real.pi ^ 2 - (classYamabeFour o.dimension_eq q.metric)^2 =
      12 * (4 * q.energy .plus - bourRicci q) := by
  have h := bourEuler_eq_charges q
  rw [hEuler, hYamabe] at h
  linarith only [h]

/-- On the extracted second sequence, the actual E47 marked-return contract
is incompatible with one fixed positive deficit on its initial metrics.
The time sequences, comparison hypotheses and liminf's all belong to that
extracted sequence. -/
theorem mixedReturn_pointed_impossible_of_startDeficit {P : ℕ → Type*} [∀ j, TopologicalSpace (P j)]
    {α p : ℕ → ℝ} {s : ∀ j, P j} (f : ∀ j, OriginalTrajectory o (α j) (s j))
    (q : ℕ → SignedCollarMetric o) (returned : SignedCollarMetric o)
    (hα : Tendsto α atTop (𝓝 0)) (hp : ∀ j, 0 < α j)
    (he : ∀ j, (f j).excess ≤ α j ^ 2)
    (hBud : ∀ᶠ j in atTop, ∀ t, TimeBudget (f j) t)
    (hr : ∀ᶠ j in atTop, ReturnedMeasurements (f j) (q j) (p j))
    (hY : ∀ᶠ j in atTop, 0 < classYamabeFour o.dimension_eq (q j).metric)
    (hEuler : ∀ j, bourEuler (q j) = 16 * Real.pi ^ 2)
    (hReturned : 0 < classYamabeFour o.dimension_eq returned.metric)
    (hE : returned.energy .plus ≤ liminf (fun j => (q j).energy .plus) atTop)
    (hD : 4 * returned.energy .plus ≤ liminf (fun j => bourRicci (q j)) atTop)
    {δ : ℝ} (hδ : 0 < δ)
    (hDeficit : ∀ᶠ j in atTop, δ ≤ 384 * Real.pi ^ 2 - ((f j).yamabe (s j))^2) : False :=
  bourStartDeficit_excludes_saturation (fun j => (f j).slice (s j)) hδ
    id tendsto_id hDeficit
    (mixedReturn_pointed_saturation f q returned hα hp he hBud hr hY hEuler hReturned hE hD).2

end Bour

end SmoothPoincare
