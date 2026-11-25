import Mathlib.Analysis.Calculus.BumpFunction.FiniteDimension
import Mathlib.Analysis.Calculus.ContDiff.Comp
import Mathlib.Analysis.Calculus.Deriv.Inverse
import Mathlib.Analysis.Calculus.Deriv.Prod
import Mathlib.MeasureTheory.Measure.Haar.InnerProductSpace
import Mathlib.Topology.Order.LeftRightNhds

/-!
# Derivatives on spinor level sets

A zero with nonzero derivative along a real line is isolated on that line.
Countability, product slicing and absolute continuity transfer this
statement to the derivatives of finitely many fields in a coordinate gauge.
-/

open MeasureTheory Filter Set
open scoped Topology

namespace FirstOrderTwistor

variable {V : Type*} [NormedAddCommGroup V] [NormedSpace ℝ V]

/-- A real line curve has a zero derivative almost everywhere on each of its
level sets. At nondifferentiable points Lean uses zero for the derivative. -/
theorem deriv_eq_zero_ae_on_levelSet (f : ℝ → V) (c : V) :
    ∀ᵐ t ∂(volume : Measure ℝ), f t = c → deriv f t = 0 := by
  let Z : Set ℝ := {t | f t = c}
  have hbad : {t | f t = c ∧ deriv f t ≠ 0}.Countable := by
    apply (countable_setOfPred_isolated_right_within (s := Z)).mono
    intro t ht
    change f t = c ∧ deriv f t ≠ 0 at ht
    refine ⟨ht.1, ?_⟩
    have hne : ∀ᶠ s in 𝓝[≠] t, f s ≠ c :=
      (differentiableAt_of_deriv_ne_zero ht.2).hasDerivAt.eventually_ne ht.2
    have hmono : 𝓝[Z ∩ Ioi t] t ≤ 𝓝[≠] t :=
      nhdsWithin_mono t (fun _ hs => hs.2.ne')
    have hz : ∀ᶠ s in 𝓝[Z ∩ Ioi t] t, s ∈ Z ∩ Ioi t := self_mem_nhdsWithin
    have heq : ∀ᶠ s in 𝓝[Z ∩ Ioi t] t, f s = c :=
      hz.mono fun _ hs => hs.1
    exact eventually_false_iff_eq_bot.mp ((heq.and (hne.filter_mono hmono)).mono
      (fun _ hs => hs.2 hs.1))
  rw [ae_iff]
  simpa only [not_imp] using hbad.measure_zero volume

omit [NormedSpace ℝ V] in
private theorem measurableSet_level_imp {E : Type*} [TopologicalSpace E]
    [MeasurableSpace E] [OpensMeasurableSpace E]
    {W : Type*} [TopologicalSpace W] [T2Space W] {f : E → V} {g : E → W}
    (hf : Continuous f) (hg : Continuous g) (c : V) (d : W) :
    MeasurableSet {x | f x = c → g x = d} := by
  have h : {x | f x = c → g x = d} = {x | f x = c}ᶜ ∪ {x | g x = d} := by
    ext x
    simp
    tauto
  rw [h]
  exact (isClosed_eq hf continuous_const).measurableSet.compl.union
    (isClosed_eq hg continuous_const).measurableSet

/-- A coordinate partial derivative vanishes on a level set almost everywhere.
The proof splits product Lebesgue measure at the marked coordinate. -/
theorem pi_partial_eq_zero_ae_on_levelSet {n : ℕ} (f : (Fin (n + 1) → ℝ) → V)
    (hf : ContDiff ℝ 1 f) (c : V) (i : Fin (n + 1)) :
    ∀ᵐ x ∂(volume : Measure (Fin (n + 1) → ℝ)), f x = c →
      fderiv ℝ f x (Pi.single i 1) = 0 := by
  let p (x : Fin (n + 1) → ℝ) := f x = c → fderiv ℝ f x (Pi.single i 1) = 0
  let e := MeasurableEquiv.piFinSuccAbove (fun _ : Fin (n + 1) => ℝ) i
  have hp : MeasurableSet {x | p x} :=
    measurableSet_level_imp hf.continuous
      ((hf.continuous_fderiv one_ne_zero).clm_apply continuous_const) c 0
  have hmeas : MeasurableSet {z : ℝ × (Fin n → ℝ) | p (e.symm z)} :=
    e.symm.measurable hp
  have hslice (r : Fin n → ℝ) (t : ℝ) :
      HasDerivAt (fun s => e.symm (s, r)) (Pi.single i 1) t := by
    apply hasDerivAt_pi.mpr
    intro k
    have he (s : ℝ) : e.symm (s, r) = i.insertNth s r := rfl
    by_cases hk : k = i
    · subst k
      simpa only [he, Fin.insertNth_apply_same, Pi.single_eq_same] using hasDerivAt_id' t
    · obtain ⟨j, rfl⟩ := Fin.exists_succAbove_eq hk
      simpa only [he, Fin.insertNth_apply_succAbove, Pi.single_eq_of_ne (Fin.succAbove_ne _ _)] using
        hasDerivAt_const t (r j)
  have hsections (r : Fin n → ℝ) : ∀ᵐ t ∂(volume : Measure ℝ), p (e.symm (t, r)) := by
    filter_upwards [deriv_eq_zero_ae_on_levelSet (fun t => f (e.symm (t, r))) c] with t ht
    have hchain := ((hf.differentiable one_ne_zero (e.symm (t, r))).hasFDerivAt.comp_hasDerivAt
      t (hslice r t)).deriv
    intro hfc
    exact hchain.symm.trans (ht hfc)
  have hprod : ∀ᵐ z ∂(volume : Measure ℝ).prod (volume : Measure (Fin n → ℝ)), p (e.symm z) :=
    (Measure.ae_prod_iff_ae_ae hmeas).mpr
      ((Measure.ae_ae_comm hmeas).mpr (ae_of_all _ hsections))
  have he : MeasurePreserving e.symm ((volume : Measure ℝ).prod volume) volume :=
    (volume_preserving_piFinSuccAbove (fun _ : Fin (n + 1) => ℝ) i).symm e
  change ∀ᵐ x ∂(volume : Measure (Fin (n + 1) → ℝ)), p x
  rw [← he.map_eq]
  exact (ae_map_iff he.measurable.aemeasurable hp).mpr hprod


/-- All coordinate partial derivatives vanish simultaneously on the level set. -/
theorem pi_fderiv_eq_zero_ae_on_levelSet {n : ℕ} (f : (Fin (n + 1) → ℝ) → V)
    (hf : ContDiff ℝ 1 f) (c : V) :
    ∀ᵐ x ∂(volume : Measure (Fin (n + 1) → ℝ)), f x = c → fderiv ℝ f x = 0 := by
  have hpart : ∀ᵐ x ∂(volume : Measure (Fin (n + 1) → ℝ)),
      ∀ i : Fin (n + 1), f x = c → fderiv ℝ f x (Pi.single i 1) = 0 :=
    ae_all_iff.mpr fun i => pi_partial_eq_zero_ae_on_levelSet f hf c i
  filter_upwards [hpart] with x hx
  intro hxc
  ext v
  have hv : ∑ i : Fin (n + 1), v i • Pi.single i (1 : ℝ) = v := by
    ext j
    simp [Finset.sum_apply, Pi.single_apply]
  rw [← hv, map_sum]
  simp only [map_smul, hx _ hxc, smul_zero, Finset.sum_const_zero,
    zero_apply]

/-- The derivative vanishes almost everywhere on the level set in Euclidean
volume. The identification with the real product coordinates preserves volume. -/
theorem euclidean_fderiv_eq_zero_ae_on_levelSet {n : ℕ}
    (f : EuclideanSpace ℝ (Fin (n + 1)) → V) (hf : ContDiff ℝ 1 f) (c : V) :
    ∀ᵐ x ∂(volume : Measure (EuclideanSpace ℝ (Fin (n + 1)))),
      f x = c → fderiv ℝ f x = 0 := by
  let toE := (PiLp.continuousLinearEquiv 2 ℝ (fun _ : Fin (n + 1) => ℝ)).symm
  have hE : MeasurePreserving toE
      (volume : Measure (Fin (n + 1) → ℝ))
      (volume : Measure (EuclideanSpace ℝ (Fin (n + 1)))) := PiLp.volume_preserving_toLp _
  let p (x : EuclideanSpace ℝ (Fin (n + 1))) := f x = c → fderiv ℝ f x = 0
  have hp : MeasurableSet {x | p x} :=
    measurableSet_level_imp hf.continuous (hf.continuous_fderiv one_ne_zero) c 0
  have hAE : ∀ᵐ y ∂(volume : Measure (Fin (n + 1) → ℝ)), p (toE y) := by
    have hcomp : ContDiff ℝ 1 (f ∘ toE) := hf.comp toE.contDiff
    filter_upwards [pi_fderiv_eq_zero_ae_on_levelSet (f ∘ toE) hcomp c] with y hy
    intro hyc
    have hD := ((hf.differentiable one_ne_zero (toE y)).hasFDerivAt.comp y
      toE.toContinuousLinearMap.hasFDerivAt).fderiv
    have hy0 := hy hyc
    rw [hD] at hy0
    ext v
    have h := DFunLike.congr_fun hy0 (toE.symm v)
    simpa only [ContinuousLinearMap.comp_apply, ContinuousLinearEquiv.coe_coe,
      ContinuousLinearEquiv.apply_symm_apply, zero_apply] using h
  change ∀ᵐ x ∂(volume : Measure (EuclideanSpace ℝ (Fin (n + 1)))), p x
  rw [← hE.map_eq]
  exact (ae_map_iff hE.measurable.aemeasurable hp).2 hAE


/-- Localize the Euclidean level-set statement to a supplied open coordinate
domain. The test fields only need to be C¹ on that domain. -/
theorem euclidean_fderiv_eq_zero_ae_on_openLevelSet {n : ℕ}
    {Ω : Set (EuclideanSpace ℝ (Fin (n + 1)))} (hΩ : IsOpen Ω)
    (f : EuclideanSpace ℝ (Fin (n + 1)) → V) (hf : ContDiffOn ℝ 1 f Ω) (c : V) :
    ∀ᵐ x ∂(volume.restrict Ω), f x = c → fderiv ℝ f x = 0 := by
  classical
  let E := EuclideanSpace ℝ (Fin (n + 1))
  have hbump (x : Ω) : ∃ χ : E → ℝ, tsupport χ ⊆ Ω ∧ ContDiff ℝ 1 χ ∧ χ x = 1 := by
    obtain ⟨χ, hsup, _, hc, _, hx⟩ := exists_contDiff_tsupport_subset (n := 1) (hΩ.mem_nhds x.2)
    exact ⟨χ, hsup, hc, hx⟩
  choose χ hχsupport hχ hχone using hbump
  let U (x : Ω) := Function.support (χ x)
  have hU (x : Ω) : IsOpen (U x) := isOpen_ne_fun (hχ x).continuous continuous_const
  have hCover : Ω ⊆ ⋃ x : Ω, U x := by
    intro x hx
    apply mem_iUnion.mpr
    refine ⟨⟨x, hx⟩, ?_⟩
    change χ ⟨x, hx⟩ x ≠ 0
    rw [hχone]
    exact one_ne_zero
  obtain ⟨J, hJ, hJcover⟩ := (HereditarilyLindelofSpace.isLindelof Ω).elim_countable_subcover U hU hCover
  let : Countable J := hJ.to_subtype
  have hlocal (a : J) : ∀ᵐ y ∂(volume : Measure E), y ∈ U a → f y = c → fderiv ℝ f y = 0 := by
    let g (y : E) := χ a y • (f y - c)
    have hg : ContDiff ℝ 1 g := by
      apply contDiff_iff_contDiffAt.mpr
      intro y
      by_cases hy : y ∈ tsupport (χ a)
      · have hyΩ := hχsupport a hy
        exact (hχ a).contDiffAt.smul ((hf.contDiffAt (hΩ.mem_nhds hyΩ)).sub contDiffAt_const)
      · have hnear : ∀ᶠ z in 𝓝 y, χ a z = 0 :=
          (notMem_tsupport_iff_eventuallyEq.mp hy)
        apply (contDiffAt_const (c := (0 : V))).congr_of_eventuallyEq
        exact hnear.mono fun z hz => by simp [g, hz]
    filter_upwards [euclidean_fderiv_eq_zero_ae_on_levelSet g hg 0] with y hy
    intro hyU hfy
    have hyΩ := hχsupport a (subset_tsupport _ hyU)
    have hfy' := ((hf.contDiffAt (hΩ.mem_nhds hyΩ)).differentiableAt one_ne_zero).hasFDerivAt
    have hχy' := ((hχ a).differentiable one_ne_zero y).hasFDerivAt
    have hg' := (hχy'.smul (hfy'.sub_const c)).fderiv
    have hgZero : g y = 0 := by simp [g, hfy]
    have hScale : χ a y • fderiv ℝ f y = 0 := by
      simpa [g, hfy] using hg'.symm.trans (hy hgZero)
    exact (smul_eq_zero.mp hScale).resolve_left hyU
  have hAll : ∀ᵐ y ∂(volume : Measure E), ∀ a : J,
      y ∈ U a → f y = c → fderiv ℝ f y = 0 := ae_all_iff.mpr hlocal
  have hIn : ∀ᵐ y ∂(volume.restrict Ω), y ∈ Ω := ae_restrict_mem hΩ.measurableSet
  filter_upwards [ae_mono Measure.restrict_le_self hAll, hIn] with y hy hyΩ
  obtain ⟨a, ha⟩ := mem_iUnion.mp (hJcover hyΩ)
  obtain ⟨haJ, haU⟩ := mem_iUnion.mp ha
  exact hy ⟨a, haJ⟩ haU

/-- On the joint zero locus of a finite family, all values and all first
derivatives vanish almost everywhere for a gauge absolutely continuous
with respect to Euclidean volume. -/
theorem euclidean_spinJointZero_fderiv_ae {n : ℕ} {A : Type*}
    (μ : Measure (EuclideanSpace ℝ (Fin (n + 1)))) (hμ : μ ≪ volume)
    (fields : Finset A) (ψ : A → EuclideanSpace ℝ (Fin (n + 1)) → V)
    (hψ : ∀ a ∈ fields, ContDiff ℝ 1 (ψ a)) :
    ∀ᵐ x ∂μ, (∑ a ∈ fields, ‖ψ a x‖ ^ 2) = 0 →
      ∀ a ∈ fields, ψ a x = 0 ∧ fderiv ℝ (ψ a) x = 0 := by
  have hAll : ∀ᵐ x ∂μ, ∀ a : fields,
      ψ a x = 0 → fderiv ℝ (ψ a) x = 0 :=
    ae_all_iff.mpr fun a => hμ.ae_le
      (euclidean_fderiv_eq_zero_ae_on_levelSet (ψ a) (hψ a a.property) 0)
  filter_upwards [hAll] with x hx
  intro hMass a ha
  have haSq := (Finset.sum_eq_zero_iff_of_nonneg (fun _ _ => sq_nonneg _)).mp hMass a ha
  have haZero : ψ a x = 0 := by simpa using haSq
  exact ⟨haZero, hx ⟨a, ha⟩ haZero⟩

/-- The squared covariant derivative density in a coordinate gauge vanishes
on the joint zero locus. The frame directions and connection coefficients
can vary over the chart and can be supplied separately for each direction. -/
theorem euclidean_spinJointZero_gradientSq_ae {n : ℕ} {A B : Type*}
    (μ : Measure (EuclideanSpace ℝ (Fin (n + 1)))) (hμ : μ ≪ volume)
    (fields : Finset A) (directions : Finset B) (ψ : A → EuclideanSpace ℝ (Fin (n + 1)) → V)
    (frame : B → EuclideanSpace ℝ (Fin (n + 1)) → EuclideanSpace ℝ (Fin (n + 1)))
    (connection : B → EuclideanSpace ℝ (Fin (n + 1)) → V →L[ℝ] V)
    (hψ : ∀ a ∈ fields, ContDiff ℝ 1 (ψ a)) :
    ∀ᵐ x ∂μ, (∑ a ∈ fields, ‖ψ a x‖ ^ 2) = 0 →
      (∑ a ∈ fields, ∑ i ∈ directions,
        ‖fderiv ℝ (ψ a) x (frame i x) + connection i x (ψ a x)‖ ^ 2) = 0 := by
  filter_upwards [euclidean_spinJointZero_fderiv_ae μ hμ fields ψ hψ] with x hx
  intro hMass
  apply Finset.sum_eq_zero
  intro a ha
  have ha0 := hx hMass a ha
  simp [ha0.1, ha0.2]


/-- The covariant derivative density vanishes on the joint zero locus with
only C¹ fields on the open chart. Absolute continuity is required on that
chart, so the measure elsewhere is immaterial. -/
theorem euclidean_spinJointZero_gradientSq_ae_on_open {n : ℕ} {A B : Type*}
    {Ω : Set (EuclideanSpace ℝ (Fin (n + 1)))} (hΩ : IsOpen Ω)
    (μ : Measure (EuclideanSpace ℝ (Fin (n + 1)))) (hμ : μ.restrict Ω ≪ volume.restrict Ω)
    (fields : Finset A) (directions : Finset B) (ψ : A → EuclideanSpace ℝ (Fin (n + 1)) → V)
    (frame : B → EuclideanSpace ℝ (Fin (n + 1)) → EuclideanSpace ℝ (Fin (n + 1)))
    (connection : B → EuclideanSpace ℝ (Fin (n + 1)) → V →L[ℝ] V)
    (hψ : ∀ a ∈ fields, ContDiffOn ℝ 1 (ψ a) Ω) :
    ∀ᵐ x ∂μ.restrict Ω, (∑ a ∈ fields, ‖ψ a x‖ ^ 2) = 0 →
      (∑ a ∈ fields, ∑ i ∈ directions,
        ‖fderiv ℝ (ψ a) x (frame i x) + connection i x (ψ a x)‖ ^ 2) = 0 := by
  have hAll : ∀ᵐ x ∂μ.restrict Ω, ∀ a : fields,
      ψ a x = 0 → fderiv ℝ (ψ a) x = 0 :=
    ae_all_iff.mpr fun a => hμ.ae_le
      (euclidean_fderiv_eq_zero_ae_on_openLevelSet hΩ (ψ a) (hψ a a.property) 0)
  filter_upwards [hAll] with x hx
  intro hMass
  apply Finset.sum_eq_zero
  intro a ha
  have haSq := (Finset.sum_eq_zero_iff_of_nonneg (fun _ _ => sq_nonneg _)).mp hMass a ha
  have haZero : ψ a x = 0 := by simpa using haSq
  simp [haZero, hx ⟨a, ha⟩ haZero]

end FirstOrderTwistor
