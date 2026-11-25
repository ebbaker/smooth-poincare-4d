import DifferentialGeometry.Analysis.Integration.Measure.Parametric.Integration
import Mathlib.MeasureTheory.Function.Jacobian
import Mathlib.MeasureTheory.Measure.Count
import SmoothPoincare.Heights.IntegratedSelection
import SmoothPoincare.Immersions.InducedBlock

/-! # Indexed Gauss area from measured injective sheets -/

open DifferentialGeometry DifferentialGeometry.Geometry DifferentialGeometry.Integral.Measure
open MeasureTheory Set
open scoped ContDiff ENNReal Function Manifold

namespace SmoothPoincare

section Sheets

variable {M Ω : Type*} [MeasurableSpace M] [MeasurableSpace Ω]
  [MeasurableSingletonClass M] [MeasurableSingletonClass Ω]

/-- A disjoint source partition and the local pushforward of each Jacobian-weighted
    sheet. Their images may overlap in the direction space. -/
structure GaussSheetAtlas (n : M → Ω) (U : Set M) (vol : Measure M) (area : Measure Ω)
    (jacobian : M → ℝ≥0∞) where
  sheet : ℕ → Set M
  measurableSheet : ∀ i, MeasurableSet (sheet i)
  disjoint : Pairwise (Disjoint on sheet)
  covers : (⋃ i, sheet i) = U
  injectiveOn : ∀ i, InjOn n (sheet i)
  measurableImage : ∀ i, MeasurableSet (n '' sheet i)
  pushforward : ∀ i, Measure.map n ((vol.restrict (sheet i)).withDensity jacobian) =
    area.restrict (n '' sheet i)

/-- Counting measure of the actual preimage on the source. This counts distinct
    domain points even if their images under the immersion coincide. -/
noncomputable def gaussMultiplicity (n : M → Ω) (U : Set M) (u : Ω) : ℝ≥0∞ :=
  Measure.count (U ∩ n ⁻¹' {u})

omit [MeasurableSingletonClass M] in
/-- Actual cardinality of a measurable fiber, including an infinite fiber. -/
theorem gaussMultiplicity_eq_encard (n : M → Ω) (hn : Measurable n) (U : Set M)
    (hU : MeasurableSet U) (u : Ω) :
    gaussMultiplicity n U u = (U ∩ n ⁻¹' {u}).encard :=
  Measure.count_apply (hU.inter (hn (measurableSet_singleton u)))

omit [MeasurableSpace Ω] [MeasurableSingletonClass Ω] in
private theorem gaussMultiplicity_eq_indicator_of_injOn (n : M → Ω) (S : Set M)
    (hinj : InjOn n S) (u : Ω) :
    gaussMultiplicity n S u = (n '' S).indicator (fun _ => (1 : ℝ≥0∞)) u := by
  classical
  by_cases h : u ∈ n '' S
  · obtain ⟨x, hx, rfl⟩ := h
    rw [indicator_of_mem (mem_image_of_mem n hx)]
    have hfiber : S ∩ n ⁻¹' {n x} = {x} := by
      ext y
      simp only [mem_inter_iff, mem_preimage, mem_singleton_iff]
      refine ⟨fun hy => hinj hy.1 hx hy.2, fun hy => ?_⟩
      subst y
      exact ⟨hx, rfl⟩
    rw [gaussMultiplicity, hfiber, Measure.count_singleton]
  · rw [indicator_of_notMem h, gaussMultiplicity]
    exact Measure.count_eq_zero_iff.mpr (eq_empty_of_forall_notMem fun x hx =>
      h ⟨x, hx.1, hx.2⟩)

variable {n : M → Ω} {U : Set M} {vol : Measure M} {area : Measure Ω}
  {J : M → ℝ≥0∞}

/-- The source fiber decomposes into its disjoint fibers within sheets. The
    formula sums indicators, so image overlap contributes multiplicity. -/
theorem GaussSheetAtlas.multiplicity_eq_tsum (A : GaussSheetAtlas n U vol area J)
    (hn : Measurable n) (u : Ω) :
    gaussMultiplicity n U u = ∑' i, (n '' A.sheet i).indicator (fun _ => (1 : ℝ≥0∞)) u := by
  unfold gaussMultiplicity
  conv_lhs => rw [← A.covers, iUnion_inter]
  rw [measure_iUnion (fun i j hij => (A.disjoint hij).mono inter_subset_left inter_subset_left)
    (fun i => (A.measurableSheet i).inter (hn (measurableSet_singleton u)))]
  exact tsum_congr fun i => gaussMultiplicity_eq_indicator_of_injOn n _ (A.injectiveOn i) u

/-- Sheet multiplicity is measurable even where the source fiber is infinite. -/
theorem GaussSheetAtlas.measurableMultiplicity (A : GaussSheetAtlas n U vol area J)
    (hn : Measurable n) : Measurable (gaussMultiplicity n U) := by
  rw [show gaussMultiplicity n U =
    (fun u => ∑' i, (n '' A.sheet i).indicator (fun _ => (1 : ℝ≥0∞)) u) from
    funext (A.multiplicity_eq_tsum hn)]
  exact Measurable.tsum fun i => measurable_const.indicator (A.measurableImage i)

/-- The one-normal area identity obtained by integrating the source multiplicity. -/
theorem GaussSheetAtlas.lintegral_multiplicity (A : GaussSheetAtlas n U vol area J)
    (hn : Measurable n) :
    (∫⁻ u, gaussMultiplicity n U u ∂area) = ∫⁻ x in U, J x ∂vol := by
  calc
    _ = ∫⁻ u, ∑' i, (n '' A.sheet i).indicator (fun _ => (1 : ℝ≥0∞)) u ∂area :=
      lintegral_congr (A.multiplicity_eq_tsum hn)
    _ = ∑' i, area (n '' A.sheet i) := by
      rw [lintegral_tsum (fun i => (measurable_const.indicator (A.measurableImage i)).aemeasurable)]
      simp only [lintegral_indicator_const (A.measurableImage _), one_mul]
    _ = ∑' i, ∫⁻ x in A.sheet i, J x ∂vol := by
      refine tsum_congr fun i => ?_
      have h := congrArg (fun μ : Measure Ω => μ univ) (A.pushforward i)
      simpa only [Measure.map_apply hn MeasurableSet.univ, preimage_univ,
        Measure.restrict_apply MeasurableSet.univ, univ_inter,
        withDensity_apply J MeasurableSet.univ, Measure.restrict_univ] using h.symm
    _ = _ := by
      conv_rhs => rw [← A.covers, lintegral_iUnion A.measurableSheet A.disjoint]

omit [MeasurableSingletonClass M] in
/-- Both normals count a disjoint union of actual source fibers whenever the
    direction and its opposite differ. -/
theorem gaussTwoNormalMultiplicity_eq_count (n : M → Ω) (hn : Measurable n) (U : Set M)
    (hU : MeasurableSet U) {u v : Ω} (huv : u ≠ v) :
    gaussMultiplicity n U u + gaussMultiplicity n U v =
      Measure.count (U ∩ n ⁻¹' ({u, v} : Set Ω)) := by
  have hdis : Disjoint (U ∩ n ⁻¹' {u}) (U ∩ n ⁻¹' {v}) :=
    disjoint_left.mpr fun _ hx hy => huv (hx.2.symm.trans hy.2)
  rw [gaussMultiplicity, gaussMultiplicity,
    ← measure_union hdis (hU.inter (hn (measurableSet_singleton v)))]
  congr 1
  ext x
  simp only [mem_union, mem_inter_iff, mem_preimage, mem_singleton_iff, mem_insert_iff]
  exact and_or_left.symm

/-- Integrating both normals gives exactly twice the Jacobian mass. -/
theorem GaussSheetAtlas.lintegral_twoNormals (A : GaussSheetAtlas n U vol area J)
    (hn : Measurable n) (opposite : Ω → Ω) (hop : MeasurePreserving opposite area area) :
    (∫⁻ u, (gaussMultiplicity n U u + gaussMultiplicity n U (opposite u)) ∂area) =
      2 * ∫⁻ x in U, J x ∂vol := by
  have hm := A.measurableMultiplicity hn
  change (∫⁻ u, (gaussMultiplicity n U u + (gaussMultiplicity n U ∘ opposite) u) ∂area) = _
  rw [lintegral_add_left hm (gaussMultiplicity n U ∘ opposite)]
  simp only [Function.comp_apply, hop.lintegral_comp hm, A.lintegral_multiplicity hn, two_mul]

/-- Normalize a finite area measure by the stated total area. -/
noncomputable def normalizedGaussDirections (area : Measure Ω) (mass : ℝ) : Measure Ω :=
  (ENNReal.ofReal mass)⁻¹ • area

omit [MeasurableSingletonClass Ω] in
theorem normalizedGaussDirections_isProbability (area : Measure Ω) {mass : ℝ}
    (hmass : 0 < mass) (harea : area univ = ENNReal.ofReal mass) :
    IsProbabilityMeasure (normalizedGaussDirections area mass) :=
  ⟨by
    rw [normalizedGaussDirections, Measure.smul_apply, smul_eq_mul, harea]
    exact ENNReal.inv_mul_cancel (ENNReal.ofReal_pos.mpr hmass).ne' ENNReal.ofReal_ne_top⟩

/-- Transport the both-normal identity to the normalized Bochner mean. The
    almost-everywhere hypothesis identifies the given height count with the
    actual two fibers on the regular directions. -/
theorem GaussSheetAtlas.mean_eq_gaussMass {detA : M → ℝ}
    (A : GaussSheetAtlas n U vol area (fun x => ENNReal.ofReal (detA x)))
    (hn : Measurable n) (opposite : Ω → Ω) (hop : MeasurePreserving opposite area area)
    {mass : ℝ} (hmass : 0 < mass) (m : Ω → ℕ)
    (hdetInt : IntegrableOn detA U vol) (hdetNonneg : 0 ≤ᵐ[vol.restrict U] detA)
    (hCount : ∀ᵐ u ∂normalizedGaussDirections area mass,
      (m u : ℝ≥0∞) = gaussMultiplicity n U u + gaussMultiplicity n U (opposite u)) :
    Integrable (fun u => (m u : ℝ)) (normalizedGaussDirections area mass) ∧
      (∫ u, (m u : ℝ) ∂normalizedGaussDirections area mass) =
      (2 / mass) * ∫ x in U, detA x ∂vol := by
  have hIntegral : (∫⁻ u, (m u : ℝ≥0∞) ∂normalizedGaussDirections area mass) =
      (ENNReal.ofReal mass)⁻¹ * (2 * ∫⁻ x in U, ENNReal.ofReal (detA x) ∂vol) := by
    rw [lintegral_congr_ae hCount, normalizedGaussDirections, lintegral_smul_measure,
      A.lintegral_twoNormals hn opposite hop, smul_eq_mul]
  have hm := A.measurableMultiplicity hn
  have hMult : Measurable (fun u => gaussMultiplicity n U u + gaussMultiplicity n U (opposite u)) :=
    hm.add (hm.comp hop.measurable)
  have hMeas : AEMeasurable (fun u => (m u : ℝ≥0∞)) (normalizedGaussDirections area mass) :=
    hMult.aemeasurable.congr (Filter.EventuallyEq.symm hCount)
  have hDet := ofReal_integral_eq_lintegral_ofReal hdetInt hdetNonneg
  have hdetFinite : (∫⁻ x in U, ENNReal.ofReal (detA x) ∂vol) ≠ ⊤ := by
    rw [← hDet]
    exact ENNReal.ofReal_ne_top
  have hNonneg : ∀ᵐ u ∂normalizedGaussDirections area mass, (0 : ℝ) ≤ (m u : ℝ) :=
    ae_of_all _ fun u => Nat.cast_nonneg (m u)
  have hmInt : Integrable (fun u => (m u : ℝ)) (normalizedGaussDirections area mass) := by
    refine ⟨?_, (hasFiniteIntegral_iff_ofReal hNonneg).2 ?_⟩
    · simpa only [ENNReal.toReal_natCast] using hMeas.ennreal_toReal.aestronglyMeasurable
    · simp only [ENNReal.ofReal_natCast, hIntegral, lt_top_iff_ne_top]
      exact ENNReal.mul_ne_top (ENNReal.inv_ne_top.mpr (ENNReal.ofReal_pos.mpr hmass).ne')
        (ENNReal.mul_ne_top (by simp) hdetFinite)
  refine ⟨hmInt, ?_⟩
  have hreal := congrArg ENNReal.toReal hIntegral
  rw [← hDet] at hreal
  rw [integral_eq_lintegral_of_nonneg_ae hNonneg hmInt.aestronglyMeasurable]
  simpa [ENNReal.toReal_mul, ENNReal.toReal_inv, ENNReal.toReal_ofReal hmass.le,
    ENNReal.toReal_ofReal (integral_nonneg_of_ae hdetNonneg), div_eq_mul_inv, mul_assoc,
    mul_comm, mul_left_comm] using hreal

end Sheets

section EuclideanChart

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [MeasurableSpace E] [BorelSpace E]

/-- The per-sheet pushforward in Euclidean coordinates is supplied by the
    pinned injective Jacobian change-of-variables theorem. -/
theorem gaussSheet_pushforward_of_fderivWithin (vol : Measure E) [vol.IsAddHaarMeasure]
    {s : Set E} {f : E → E} {f' : E → E →L[ℝ] E}
    (hs : MeasurableSet s) (hd : ∀ x ∈ s, HasFDerivWithinAt f (f' x) s x)
    (hi : InjOn f s) :
    Measure.map f ((vol.restrict s).withDensity (fun x => ENNReal.ofReal |(f' x).det|)) =
      vol.restrict (f '' s) :=
  map_withDensity_abs_det_fderiv_eq_addHaar vol hs.nullMeasurableSet hd hi

end EuclideanChart

section ParametrizedSheet

variable {E H K M N : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] [TopologicalSpace K] {I : ModelWithCorners ℝ E H}
  {I' : ModelWithCorners ℝ E K}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M] [SigmaCompactSpace M]
  [TopologicalSpace N] [ChartedSpace K N] [IsManifold I' ∞ N] [T2Space N] [SigmaCompactSpace N]

private local instance : MeasurableSpace E := borel E
private local instance : BorelSpace E := ⟨rfl⟩
private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩
private local instance : MeasurableSpace N := borel N
private local instance : BorelSpace N := ⟨rfl⟩

/-- On a common parametrization, both volumes have their actual pullback
    densities. A local Jacobian comparison gives the sheet pushforward. -/
theorem gaussSheet_pushforward_of_paramDensity (g : SmoothRiemannianMetric I M)
    (g' : SmoothRiemannianMetric I' N) {n : M → N} (hn : Measurable n)
    {p : E → M} {O B : Set E} (hO : IsOpen O) (hB : MeasurableSet B) (hBO : B ⊆ O)
    (hp : ContMDiffOn 𝓘(ℝ, E) I 1 p O) (hnp : ContMDiffOn 𝓘(ℝ, E) I' 1 (n ∘ p) O)
    (hpi : InjOn p B) (hni : InjOn n (p '' B)) {J : M → ℝ≥0∞} (hJ : Measurable J)
    (hJac : ∀ x ∈ B, ENNReal.ofReal (paramDensity g' (n ∘ p) x) =
      ENNReal.ofReal (paramDensity g p x) * J (p x)) :
    Measure.map n (((riemannianVolumeMeasure I M g).restrict (p '' B)).withDensity J) =
      (riemannianVolumeMeasure I' N g').restrict (n '' (p '' B)) := by
  have hnpi : InjOn (n ∘ p) B := fun _ hx _ hy hxy =>
    hpi hx hy (hni (mem_image_of_mem p hx) (mem_image_of_mem p hy) hxy)
  refine Measure.ext_of_lintegral _ fun f hf => ?_
  have hcomp : Measurable (fun y : M => f (n y)) := hf.comp hn
  rw [lintegral_map hf hn, lintegral_withDensity_eq_lintegral_mul _ hJ hcomp]
  change (∫⁻ y in p '' B, (J y * f (n y)) ∂riemannianVolumeMeasure I M g) =
    ∫⁻ y in n '' (p '' B), f y ∂riemannianVolumeMeasure I' N g'
  have hIntegrand : Measurable (fun y : M => J y * f (n y)) := hJ.mul hcomp
  rw [lintegral_image_eq_lintegral_paramDensity_mul g hO hB hBO hp hpi _
    hIntegrand.aemeasurable, ← image_comp,
    lintegral_image_eq_lintegral_paramDensity_mul g' hO hB hBO hnp hnpi _ hf.aemeasurable]
  exact setLIntegral_congr_fun hB fun x hx => by
    simp only [hJac x hx, Function.comp_apply, mul_assoc]

end ParametrizedSheet

section Immersion

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M] [SigmaCompactSpace M]

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

/-- Directions on the unit sphere in the immersion's ambient space. -/
abbrev GaussDirection := Metric.sphere (0 : EuclideanSpace ℝ (Fin 5)) 1

private theorem gaussDirection_ne_neg (u : GaussDirection) : u ≠ -u := by
  intro hu
  have hneg : (u : EuclideanSpace ℝ (Fin 5)) = -(u : EuclideanSpace ℝ (Fin 5)) :=
    congrArg Subtype.val hu
  have htwo : (2 : ℝ) • (u : EuclideanSpace ℝ (Fin 5)) = 0 := by
    calc
      _ = (u : EuclideanSpace ℝ (Fin 5)) + u := two_smul ℝ _
      _ = -(u : EuclideanSpace ℝ (Fin 5)) + u := congrArg (· + ↑u) hneg
      _ = 0 := neg_add_cancel _
  exact ne_zero_of_mem_unit_sphere u ((smul_eq_zero.mp htwo).resolve_left two_ne_zero)

/-- A measurable unit normal field of the specified isometric immersion. -/
structure ImmersionGaussNormal {g : SmoothRiemannianMetric I M} (F : IsometricHypersurface g) where
  normal : M → GaussDirection
  measurable : Measurable normal
  perpendicular : ∀ (x : M) (v : TangentSpace I x),
    inner ℝ (normal x : EuclideanSpace ℝ (Fin 5))
      (mfderiv I 𝓘(ℝ, EuclideanSpace ℝ (Fin 5)) F.map x v) = 0

/-- The indexed mean identity for the actual immersion's normal and source
    measure, from its measured atlas and its almost-everywhere height count. -/
theorem meanIndexTwo_eq_gaussMass {g : SmoothRiemannianMetric I M} {F : IsometricHypersurface g}
    (N : ImmersionGaussNormal F) (U : Set M) (detA : M → ℝ) (area : Measure GaussDirection)
    (hArea : area univ = ENNReal.ofReal (8 * Real.pi ^ 2 / 3))
    (hop : MeasurePreserving (fun u : GaussDirection => -u) area area)
    (A : GaussSheetAtlas N.normal U (riemannianVolumeMeasure I M g) area
      (fun x => ENNReal.ofReal (detA x)))
    (m : GaussDirection → ℕ)
    (hdetInt : IntegrableOn detA U (riemannianVolumeMeasure I M g))
    (hdetNonneg : 0 ≤ᵐ[(riemannianVolumeMeasure I M g).restrict U] detA)
    (hCount : ∀ᵐ u ∂normalizedGaussDirections area (8 * Real.pi ^ 2 / 3),
      (m u : ℝ≥0∞) = Measure.count (U ∩ N.normal ⁻¹' ({u, -u} : Set GaussDirection))) :
    IsProbabilityMeasure (normalizedGaussDirections area (8 * Real.pi ^ 2 / 3)) ∧
      Integrable (fun u => (m u : ℝ)) (normalizedGaussDirections area (8 * Real.pi ^ 2 / 3)) ∧
      (∫ u, (m u : ℝ) ∂normalizedGaussDirections area (8 * Real.pi ^ 2 / 3)) =
        (2 / (8 * Real.pi ^ 2 / 3)) * ∫ x in U, detA x ∂riemannianVolumeMeasure I M g := by
  refine ⟨normalizedGaussDirections_isProbability area (by positivity) hArea,
    A.mean_eq_gaussMass N.measurable _ hop (by positivity) m hdetInt hdetNonneg ?_⟩
  have hU : MeasurableSet U := A.covers ▸ MeasurableSet.iUnion A.measurableSheet
  filter_upwards [hCount] with u hu
  exact hu.trans (gaussTwoNormalMultiplicity_eq_count N.normal N.measurable U hU
    (gaussDirection_ne_neg u)).symm

end Immersion
end SmoothPoincare
