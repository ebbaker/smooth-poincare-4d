import FirstOrderTwistor.CylinderWeakSynthesis

/-!
# Hilbert endpoint values of the synthesized cylinder field

FOT-E22g, prepared for Edward B. Baker III on 2026-11-25 with OpenAI Codex
assistance. Selected helper configuration: gpt-6.2-sol, ultra. Intake HEAD
5ff7014. Uses the square-integrable weak modes and countable Hilbert
synthesis.

The endpoint vectors and the single absolutely continuous representative
are in the supplied link Hilbert space. A geometric application must
identify its spinor eigenbasis, metric, and trace spaces with the supplied
realization.
-/

open MeasureTheory Set Filter
open scoped BigOperators Topology ENNReal

namespace FirstOrderTwistor

private theorem cylinderModalTraceEnergy_nonneg {ι V : Type*} [NormedAddCommGroup V]
    (eigenvalue : ι → ℝ) (trace : ι → V) (i : ι) :
    0 ≤ cylinderModalTraceEnergy eigenvalue trace i := by
  unfold cylinderModalTraceEnergy
  positivity

private theorem cylinderModalTrace_memℓp_without_weight {ι V : Type*} [NormedAddCommGroup V]
    (eigenvalue : ι → ℝ) (trace : ι → V)
    (hgap : ∀ i, (3 : ℝ) / 2 ≤ |eigenvalue i|)
    (hweighted : Summable (cylinderModalTraceEnergy eigenvalue trace)) :
    Memℓp trace 2 := by
  apply (memℓp_gen_iff (by norm_num : 0 < (2 : ℝ≥0∞).toReal)).mpr
  simp only [ENNReal.toReal_ofNat, Real.rpow_two]
  apply Summable.of_nonneg_of_le (fun _ => sq_nonneg _) _ hweighted
  intro i
  exact le_mul_of_one_le_left (sq_nonneg _) (by linarith [hgap i])

/-- Both full endpoint traces have finite weighted energy. At each end
the incoming and outgoing signs are complementary. -/
theorem CylinderWeakModalSolution.endpoint_traceEnergy_summable
    {ι V : Type*} [NormedAddCommGroup V] [NormedSpace ℝ V]
    {length : ℝ} {eigenvalue : ι → ℝ} {left right : ι → V} {forcing field : ι → ℝ → V}
    (h : CylinderWeakModalSolution length eigenvalue left right forcing field)
    (hleft_sq : Summable (cylinderModalTraceEnergy eigenvalue left))
    (hright_sq : Summable (cylinderModalTraceEnergy eigenvalue right)) :
    Summable (cylinderModalTraceEnergy eigenvalue (fun i => field i 0)) ∧
      Summable (cylinderModalTraceEnergy eigenvalue (fun i => field i length)) := by
  have hleft_point (i : ι) : cylinderModalTraceEnergy eigenvalue (fun i => field i 0) i ≤
      cylinderModalTraceEnergy eigenvalue left i +
        cylinderModalTraceEnergy eigenvalue (cylinderModalLeftOutgoing eigenvalue field) i := by
    by_cases hi : eigenvalue i < 0
    · have heq : cylinderModalLeftOutgoing eigenvalue field i = field i 0 := by
        simp [cylinderModalLeftOutgoing, hi]
      have hnonneg := cylinderModalTraceEnergy_nonneg eigenvalue left i
      simp only [cylinderModalTraceEnergy, heq] at hnonneg ⊢
      linarith only [hnonneg]
    · have heq : field i 0 = left i := by simpa [cylinderIncomingEnd, hi] using h.incoming i
      have hnonneg := cylinderModalTraceEnergy_nonneg eigenvalue
        (cylinderModalLeftOutgoing eigenvalue field) i
      simp only [cylinderModalTraceEnergy, heq] at hnonneg ⊢
      linarith only [hnonneg]
  have hright_point (i : ι) : cylinderModalTraceEnergy eigenvalue (fun i => field i length) i ≤
      cylinderModalTraceEnergy eigenvalue right i +
        cylinderModalTraceEnergy eigenvalue (cylinderModalRightOutgoing length eigenvalue field) i := by
    by_cases hi : eigenvalue i < 0
    · have heq : field i length = right i := by simpa [cylinderIncomingEnd, hi] using h.incoming i
      have hnonneg := cylinderModalTraceEnergy_nonneg eigenvalue
        (cylinderModalRightOutgoing length eigenvalue field) i
      simp only [cylinderModalTraceEnergy, heq] at hnonneg ⊢
      linarith only [hnonneg]
    · have heq : cylinderModalRightOutgoing length eigenvalue field i = field i length := by
        simp [cylinderModalRightOutgoing, hi]
      have hnonneg := cylinderModalTraceEnergy_nonneg eigenvalue right i
      simp only [cylinderModalTraceEnergy, heq] at hnonneg ⊢
      linarith only [hnonneg]
  have hleft : Summable (cylinderModalTraceEnergy eigenvalue (fun i => field i 0)) :=
    Summable.of_nonneg_of_le (cylinderModalTraceEnergy_nonneg _ _) hleft_point
      (hleft_sq.add h.leftOutgoing_summable)
  have hright : Summable (cylinderModalTraceEnergy eigenvalue (fun i => field i length)) :=
    Summable.of_nonneg_of_le (cylinderModalTraceEnergy_nonneg _ _) hright_point
      (hright_sq.add h.rightOutgoing_summable)
  exact ⟨hleft, hright⟩

/-- The spectral gap transfers finite weighted endpoint energy to the
ordinary square-summable trace spaces. -/
theorem CylinderWeakModalSolution.endpoint_memℓp
    {ι V : Type*} [NormedAddCommGroup V] [NormedSpace ℝ V]
    {length : ℝ} {eigenvalue : ι → ℝ} {left right : ι → V} {forcing field : ι → ℝ → V}
    (h : CylinderWeakModalSolution length eigenvalue left right forcing field)
    (hgap : ∀ i, (3 : ℝ) / 2 ≤ |eigenvalue i|)
    (hleft_sq : Summable (cylinderModalTraceEnergy eigenvalue left))
    (hright_sq : Summable (cylinderModalTraceEnergy eigenvalue right)) :
    Memℓp (fun i => field i 0) 2 ∧ Memℓp (fun i => field i length) 2 := by
  obtain ⟨hleft, hright⟩ := h.endpoint_traceEnergy_summable hleft_sq hright_sq
  exact ⟨cylinderModalTrace_memℓp_without_weight _ _ hgap hleft,
    cylinderModalTrace_memℓp_without_weight _ _ hgap hright⟩

section HilbertTrace

variable {ι 𝕜 H : Type*} [RCLike 𝕜]
  [NormedAddCommGroup H] [InnerProductSpace 𝕜 H] [NormedSpace ℝ H]
  [IsScalarTower ℝ 𝕜 H] [CompleteSpace H]

/-- A realized (L^2) field has a single absolutely continuous
representative whose basis coefficients are the modal solutions at
every point of the closed interval. The full endpoint vectors are
the Hilbert sums of the corresponding modal traces. -/
theorem CylinderWeakModalSolution.continuousTrace_realization
    {length : ℝ} (hlength : 0 ≤ length) {eigenvalue : ι → ℝ}
    (hgap : ∀ i, (3 : ℝ) / 2 ≤ |eigenvalue i|)
    {left right : ι → 𝕜} {forcing field : ι → ℝ → 𝕜}
    (h : CylinderWeakModalSolution length eigenvalue left right forcing field)
    (hleft_sq : Summable (cylinderModalTraceEnergy eigenvalue left))
    (hright_sq : Summable (cylinderModalTraceEnergy eigenvalue right))
    (basis : HilbertBasis ι 𝕜 H) {U velocity : ℝ → H}
    (hvelocity : MemLp velocity 2 (volume.restrict (Icc 0 length)))
    (hcoords : ∀ᵐ t ∂volume.restrict (Icc 0 length), ∀ i,
      basis.repr (U t) i = field i t ∧
      basis.repr (velocity t) i = forcing i t - eigenvalue i • field i t) :
    ∃ leftEndpoint rightEndpoint : H,
      HasSum (fun i => field i 0 • basis i) leftEndpoint ∧
      HasSum (fun i => field i length • basis i) rightEndpoint ∧
      ∃ continuousField : ℝ → H,
        CylinderModeH1 length continuousField velocity ∧
        (∀ t, continuousField t = leftEndpoint + ∫ s in 0..t, velocity s) ∧
        (∀ t ∈ Icc 0 length, ∀ i, basis.repr (continuousField t) i = field i t) ∧
        continuousField 0 = leftEndpoint ∧ continuousField length = rightEndpoint ∧
        continuousField =ᵐ[volume.restrict (Icc 0 length)] U := by
  let ν := volume.restrict (Icc (0 : ℝ) length)
  let : IsFiniteMeasure ν := isFiniteMeasure_restrict.mpr isCompact_Icc.measure_lt_top.ne
  obtain ⟨hL, hR⟩ := h.endpoint_memℓp hgap hleft_sq hright_sq
  let leftCoords : lp (fun _ : ι => 𝕜) 2 := ⟨_, hL⟩
  let rightCoords : lp (fun _ : ι => 𝕜) 2 := ⟨_, hR⟩
  let leftEndpoint := basis.repr.symm leftCoords
  let rightEndpoint := basis.repr.symm rightCoords
  let continuousField := forcedCylinderMode length 0 leftEndpoint 0 velocity
  have hForm (t : ℝ) : continuousField t = leftEndpoint + ∫ s in 0..t, velocity s := by
    simp [continuousField, forcedCylinderMode, cylinderIncomingEnd]
  have hH1 : CylinderModeH1 length continuousField velocity := by
    simpa [continuousField] using forcedCylinderMode_memH1 hlength 0 leftEndpoint 0 hvelocity
  have hleft (i : ι) : basis.repr leftEndpoint i = field i 0 := by
    change basis.repr (basis.repr.symm leftCoords) i = _
    rw [basis.repr.apply_symm_apply]
  have hright (i : ι) : basis.repr rightEndpoint i = field i length := by
    change basis.repr (basis.repr.symm rightCoords) i = _
    rw [basis.repr.apply_symm_apply]
  have hVelocity_Icc : IntegrableOn velocity (Icc 0 length) volume :=
    hvelocity.integrable (by norm_num : (1 : ℝ≥0∞) ≤ 2)
  have h0 : (0 : ℝ) ∈ Icc 0 length := ⟨le_rfl, hlength⟩
  have hCoordinate (t : ℝ) (ht : t ∈ Icc 0 length) (i : ι) :
      basis.repr (continuousField t) i = field i t := by
    let coordK : H →L[𝕜] 𝕜 :=
      (lp.evalCLM 𝕜 (fun _ : ι => 𝕜) 2 i).comp
        basis.repr.toContinuousLinearEquiv.toContinuousLinearMap
    let coord : H →L[ℝ] 𝕜 := coordK.restrictScalars ℝ
    have hsub : uIoc 0 t ⊆ Icc 0 length := uIoc_subset_uIcc.trans (uIcc_subset_Icc h0 ht)
    have hInt : IntervalIntegrable velocity volume 0 t :=
      intervalIntegrable_iff.mpr (hVelocity_Icc.mono_set hsub)
    have hcoords' : (fun s => coord (velocity s)) =ᵐ[volume.restrict (uIoc 0 t)]
        (fun s => forcing i s - eigenvalue i • field i s) := by
      have hevent : ∀ᵐ s ∂volume.restrict (uIoc 0 t), ∀ j,
          basis.repr (U s) j = field j s ∧
          basis.repr (velocity s) j = forcing j s - eigenvalue j • field j s :=
        ae_mono (Measure.restrict_mono hsub (le_refl volume)) hcoords
      exact hevent.mono fun s hs => (hs i).2
    change coord (continuousField t) = field i t
    rw [hForm, map_add, ← coord.intervalIntegral_comp_comm hInt,
      intervalIntegral.integral_congr_ae_restrict hcoords',
      (h.modes i).integral_velocity_eq_sub hlength h0 ht]
    change basis.repr leftEndpoint i + (field i t - field i 0) = field i t
    rw [hleft]
    abel
  refine ⟨leftEndpoint, rightEndpoint, basis.hasSum_repr_symm leftCoords,
    basis.hasSum_repr_symm rightCoords, continuousField, hH1, hForm, hCoordinate, ?_, ?_, ?_⟩
  · simp [hForm]
  · apply basis.repr.injective
    ext i
    exact (hCoordinate length ⟨hlength, le_rfl⟩ i).trans (hright i).symm
  · filter_upwards [hcoords, ae_restrict_mem (μ := volume) measurableSet_Icc] with t hct ht
    apply basis.repr.injective
    ext i
    exact (hCoordinate t ht i).trans (hct i).1.symm

end HilbertTrace

end FirstOrderTwistor
