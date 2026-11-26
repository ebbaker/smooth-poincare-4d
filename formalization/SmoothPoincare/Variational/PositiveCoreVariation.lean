import SmoothPoincare.Variational.BalancedMarkedExterior
import Mathlib.Analysis.Calculus.Taylor

/-! # Finite variations on a charged core of a positive comparison metric -/

open DifferentialGeometry DifferentialGeometry.Integral.Measure FirstOrderTwistor
open MeasureTheory SectionsAndConnections Set
open scoped ContDiff Manifold Interval

namespace SmoothPoincare

/-- Taylor's upper estimate on either side of the same basepoint, with the
actual derivatives at zero and the sharp factorial in the remainder. -/
theorem coreVariation_taylor_upper (f : ℝ → ℝ) (n : ℕ) {t D : ℝ} (ht : t ≠ 0)
    (hf : ContDiff ℝ (n+1) f)
    (hD : ∀ x ∈ uIoo 0 t, |iteratedDeriv (n+1) f x| ≤ D) :
    f t ≤ (∑ j ∈ Finset.range (n+1), ((j.factorial : ℝ)⁻¹ * t^j) * iteratedDeriv j f 0) +
      D * |t|^(n+1) / (n+1).factorial := by
  obtain ⟨z,hz,he⟩ := taylor_mean_remainder_lagrange_iteratedDeriv ht.symm hf.contDiffOn
  rw [taylor_within_apply] at he
  have co (j : ℕ) (hj : j ∈ Finset.range (n+1)) :
      iteratedDerivWithin j f (uIcc 0 t) 0 = iteratedDeriv j f 0 :=
    iteratedDerivWithin_eq_iteratedDeriv (uniqueDiffOn_uIcc ht.symm)
      (hf.of_le (by exact_mod_cast (Finset.mem_range.mp hj).le)).contDiffAt left_mem_uIcc
  simp only [sub_zero, smul_eq_mul] at he
  rw [Finset.sum_congr rfl (fun j hj => by rw [co j hj])] at he
  have hrem := le_abs_self (iteratedDeriv (n+1) f z * t^(n+1))
  rw [abs_mul, abs_pow] at hrem
  have hle := div_le_div_of_nonneg_right (hrem.trans (mul_le_mul_of_nonneg_right
    (hD z hz) (pow_nonneg (abs_nonneg t) _))) (Nat.cast_nonneg (n+1).factorial : 0 ≤ (_ : ℝ))
  linarith only [he, hle]

private theorem coreVariation_upper_at_endpoints (f : ℝ → ℝ) {r D : ℝ} (hr : 0 < r)
    (hf : ContDiff ℝ 4 f) (h₂ : ∀ t ∈ Icc (-r) r, |iteratedDeriv 2 f t| ≤ D)
    (h₄ : ∀ t ∈ Icc (-r) r, |iteratedDeriv 4 f t| ≤ D)
    (t : ℝ) (ht : t ∈ ({r,-r} : Set ℝ)) :
      f t ≤ f 0 + t * deriv f 0 + D*r^2/2 ∧
      f t ≤ f 0 + t * deriv f 0 + t^2 * iteratedDeriv 2 f 0 / 2 +
        t^3 * iteratedDeriv 3 f 0 / 6 + D*r^4/24 := by
    have hne : t ≠ 0 := by
      rcases ht with h|h
      · exact (show t = r from h).trans_ne hr.ne'
      · exact (show t = -r from h).trans_ne (neg_ne_zero.mpr hr.ne')
    have ha : |t| = r := by rcases ht with h|h <;> simp_all [abs_of_pos hr]
    have hi : uIoo 0 t ⊆ Icc (-r) r := by
      intro z hz
      rcases ht with h|h
      · change t = r at h
        subst t
        rw [uIoo_of_le hr.le] at hz
        exact ⟨by linarith [hz.1],hz.2.le⟩
      · change t = -r at h
        subst t
        rw [uIoo_of_ge (by linarith)] at hz
        exact ⟨hz.1.le,by linarith [hz.2]⟩
    have a := coreVariation_taylor_upper f 1 hne (hf.of_le (by norm_num)) (fun z hz => h₂ z (hi hz))
    have b := coreVariation_taylor_upper f 3 hne hf (fun z hz => h₄ z (hi hz))
    norm_num [Finset.sum_range_succ,Nat.factorial,ha] at a b
    constructor <;> linarith only [a,b]

section Metrics

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  [CompactSpace M] [Nonempty M] {o : ManifoldOrientation I M 4}

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

omit [I.Boundaryless] [Nonempty M] in
/-- For a clamped competitor the energy saving on the changed region is
the total saving for each chirality, including its sign. -/
theorem signedCoreSaving_eq_energySaving (g h : SignedCollarMetric o) {U : Set M}
    (hU : MeasurableSet U) (s : CollarChirality) (hfix : g.charge s Uᶜ = h.charge s Uᶜ) :
    g.charge s U - h.charge s U = g.energy .plus - h.energy .plus := by
  have split (v : SignedCollarMetric o) : v.charge s Uᶜ = v.energy .plus - v.charge s U := by
    change (v.chiralMeasure s).real Uᶜ = _
    rw [measureReal_compl hU]
    change v.charge s univ - v.charge s U = _
    rw [v.charge_univ]
    cases s with
    | plus => rfl
    | minus => exact congrArg (fun e => e - v.charge .minus U) v.signature_zero.symm
  linarith only [hfix, split g, split h]

set_option maxHeartbeats 1200000 in
/-- At a chosen finite width and step, actual positive competitors bound
the first and negative second variations by the fixed-type excess. The
assumed derivative bounds are on the actual two-sided energy path. -/
theorem positiveCoreVariation_bounds (g : ℝ → SignedCollarMetric o) {r D : ℝ}
    (hr : 0 < r) (hD : 0 ≤ D)
    (hp₀ : 0 < classYamabeFour o.dimension_eq (g 0).metric)
    (hp : ∀ t ∈ ({r, -r} : Set ℝ), 0 < classYamabeFour o.dimension_eq (g t).metric) :
    let f := fun t => (g t).energy .plus
    let d := f 0 - sInf (geometricPositiveEnergies o)
    ContDiff ℝ 4 f →
    (∀ t ∈ Icc (-r) r, |iteratedDeriv 2 f t| ≤ D) →
    (∀ t ∈ Icc (-r) r, |iteratedDeriv 4 f t| ≤ D) →
    |deriv f 0| ≤ d/r + D*r/2 ∧
      max 0 (-iteratedDeriv 2 f 0) ≤ 2*d/r^2 + D*r^2/12 := by
  intro f d hf h₂ h₄
  have floor (t) (ht : t ∈ ({r,-r} : Set ℝ)) : f 0 - d ≤ f t := by
    simpa only [d, sub_sub_cancel] using
      csInf_le (geometricPositiveEnergies_bddBelow o) ((g t).energy_mem_of_positive (hp t ht))
  have hTaylor := coreVariation_upper_at_endpoints f hr hf h₂ h₄
  have rp : r ∈ ({r,-r} : Set ℝ) := by simp
  have rm : -r ∈ ({r,-r} : Set ℝ) := by simp
  obtain ⟨ap,bp⟩ := hTaylor r rp
  obtain ⟨am,bm⟩ := hTaylor (-r) rm
  have lp := floor r rp
  have lm := floor (-r) rm
  have hdd : 0 ≤ d := by
    exact sub_nonneg.mpr (csInf_le (geometricPositiveEnergies_bddBelow o)
      ((g 0).energy_mem_of_positive hp₀))
  have hw : d/r + D*r/2 = (d + D*r^2/2)/r := by field_simp
  have hv : 2*d/r^2 + D*r^2/12 = (2*d + D*r^4/12)/r^2 := by field_simp
  constructor
  · rw [hw,abs_le,neg_le,le_div_iff₀ hr,le_div_iff₀ hr]
    constructor <;> nlinarith only [ap,am,lp,lm]
  · apply max_le (add_nonneg (div_nonneg (mul_nonneg (by norm_num) hdd) (sq_nonneg _))
      (div_nonneg (mul_nonneg hD (sq_nonneg _)) (by norm_num)))
    rw [hv,le_div_iff₀ (sq_pos_of_pos hr)]
    nlinarith only [bp,bm,lp,lm]

/-- On a clamped physical variation, the less energetic of the two tested
endpoints realizes both Taylor saving bounds simultaneously, in both
chiralities and on the same changed set. -/
theorem exists_positiveCoreVariation_signed_saving (g : ℝ → SignedCollarMetric o)
    {r D : ℝ} (hr : 0 < r) {U : Set M} (hU : MeasurableSet U)
    (hfix : ∀ t ∈ ({r,-r} : Set ℝ), ∀ s, (g 0).charge s Uᶜ = (g t).charge s Uᶜ)
    (hp : ∀ t ∈ ({r,-r} : Set ℝ), 0 < classYamabeFour o.dimension_eq (g t).metric) :
    let f := fun t => (g t).energy .plus
    ContDiff ℝ 4 f →
    (∀ t ∈ Icc (-r) r, |iteratedDeriv 2 f t| ≤ D) →
    (∀ t ∈ Icc (-r) r, |iteratedDeriv 4 f t| ≤ D) →
    ∃ t ∈ ({r,-r} : Set ℝ), 0 < classYamabeFour o.dimension_eq (g t).metric ∧
      ∀ s, max (|deriv f 0| * r - D*r^2/2) (-iteratedDeriv 2 f 0*r^2/2 - D*r^4/24) ≤
        (g 0).charge s U - (g t).charge s U := by
  intro f hf h₂ h₄
  have rp : r ∈ ({r,-r} : Set ℝ) := by simp
  have rm : -r ∈ ({r,-r} : Set ℝ) := by simp
  obtain ⟨ap,bp⟩ := coreVariation_upper_at_endpoints f hr hf h₂ h₄ r rp
  obtain ⟨am,bm⟩ := coreVariation_upper_at_endpoints f hr hf h₂ h₄ (-r) rm
  obtain ⟨t,ht,hp',hm'⟩ : ∃ t ∈ ({r,-r} : Set ℝ), f t ≤ f r ∧ f t ≤ f (-r) := by
    rcases le_total (f r) (f (-r)) with h|h
    · exact ⟨r,rp,le_rfl,h⟩
    · exact ⟨-r,rm,h,le_rfl⟩
  refine ⟨t,ht,hp t ht,fun s => ?_⟩
  rw [signedCoreSaving_eq_energySaving (g 0) (g t) hU s (hfix t ht s)]
  change _ ≤ f 0 - f t
  apply max_le
  · rcases le_total 0 (deriv f 0) with h|h
    · rw [abs_of_nonneg h]; nlinarith only [hm',am]
    · rw [abs_of_nonpos h]; nlinarith only [hp',ap]
  · nlinarith only [hp',hm',bp,bm]

end Metrics
section SelectedWidth

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  [CompactSpace M] [Nonempty M] {o : ManifoldOrientation I M 4}

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

/-- At the selected radial width, an actual two-sided clamped variation has
one positive endpoint realizing the Taylor gain. The finite saving on each
sign is bounded by both the fixed-type excess and the sign's accessible
disk-side charge. The protected core and the exterior belong to the fixed
complement whenever the supplied trim avoids the core. -/
theorem exists_selectedDiskSideVariation (m : NestedBalancedDisks I M) (n : ℕ)
    (g : ℝ → SignedCollarMetric o) {r D : ℝ} (hr : 0 < r)
    (hp : ∀ t ∈ ({r,-r} : Set ℝ), 0 < classYamabeFour o.dimension_eq (g t).metric) :
    let U := selectedChartDisk m.outer ∩ selectedDiskTrim m.outer n
    let f := fun t => (g t).energy .plus
    (∀ t ∈ ({r,-r} : Set ℝ), ∀ s, (g 0).charge s Uᶜ = (g t).charge s Uᶜ) →
    ContDiff ℝ 4 f →
    (∀ t ∈ Icc (-r) r, |iteratedDeriv 2 f t| ≤ D) →
    (∀ t ∈ Icc (-r) r, |iteratedDeriv 4 f t| ≤ D) →
    ∃ t ∈ ({r,-r} : Set ℝ), 0 < classYamabeFour o.dimension_eq (g t).metric ∧ ∀ s,
      let gain := (g 0).charge s U - (g t).charge s U
      max (|deriv f 0| * r - D*r^2/2) (-iteratedDeriv 2 f 0*r^2/2 - D*r^4/24) ≤ gain ∧
        gain ≤ min (f 0 - sInf (geometricPositiveEnergies o)) ((g 0).charge s U) := by
  intro U f hfix hf h₂ h₄
  have hU : MeasurableSet U := (isCompact_selectedChartDisk m.outer m.outer_source).isClosed.measurableSet.inter
    (isOpen_selectedDiskTrim m.outer n).measurableSet
  obtain ⟨t,ht,hpos,hgain⟩ := exists_positiveCoreVariation_signed_saving g hr hU hfix hp hf h₂ h₄
  refine ⟨t,ht,hpos,fun s => ⟨hgain s,le_min ?_ ?_⟩⟩
  · rw [signedCoreSaving_eq_energySaving (g 0) (g t) hU s (hfix t ht s)]
    exact sub_le_sub_left (csInf_le (geometricPositiveEnergies_bddBelow o)
      ((g t).energy_mem_of_positive hpos)) _
  · exact sub_le_self _ measureReal_nonneg

end SelectedWidth

end SmoothPoincare
