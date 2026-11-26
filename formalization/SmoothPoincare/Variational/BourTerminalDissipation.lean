import SmoothPoincare.Variational.BourOriginalGradient

/-! # Terminal dissipation of the original Bour flow

26 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance.
Actual serving model and reasoning effort were unavailable.
-/

open DifferentialGeometry DifferentialGeometry.Geometry DifferentialGeometry.Geometry.Curvature
  DifferentialGeometry.PDE.RicciFlow DifferentialGeometry.Tensor0SBundle Filter MeasureTheory Set
open scoped ContDiff Manifold Topology

namespace SmoothPoincare.Bour

noncomputable section

variable {E H M : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
  [FiniteDimensional ℝ E] [NeZero (Module.finrank ℝ E)] [TopologicalSpace H]
  {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [T2Space M] [CompactSpace M] [BoundarylessManifold I M]
  {o : ManifoldOrientation I M 4}

/-- The actual regularized energy decreases to its infimum in the order
of regular times. This order treats finite and infinite terminal times
in the same way. -/
theorem originalGradient_energy_tendsto_terminal
    (q : ℝ → SignedCollarMetric o) {α C : ℝ} (hα : 0 ≤ α) (hα₁ : α ≤ 1)
    {D : RealTimeInterval} (hConnected : D.regular.OrdConnected)
    (hG : MetricFamilySmoothOn (I := I) D (fun s => (q s).metric))
    (hEuler : ∀ t ∈ D.regular, bourEuler (q t) = C)
    (hFlow : ∀ t ∈ D.regular, ∀ x,
      deriv (fun s => metricTensorField (q s).metric x) t =
        (-2 : ℝ) • bourCovariantGradient α (q t).metric x) :
    Tendsto (fun t : D.RegularTime => bourEnergy α (q t)) atTop
      (𝓝 (⨅ t : D.RegularTime, bourEnergy α (q t))) := by
  let _ : D.regular.OrdConnected := hConnected
  apply tendsto_atTop_ciInf
  · intro a b hab
    have hTime : Icc (a : ℝ) b ⊆ D.regular :=
      D.regular.Icc_subset a.property b.property
    exact (originalGradient_regularSlab q α C hG hab hTime hEuler
      (fun t ht => hFlow t (hTime (Ioo_subset_Icc_self ht)))).2.1
  · refine ⟨0, ?_⟩
    rintro _ ⟨t, rfl⟩
    have hCharge (sign : CollarChirality) : 0 ≤ (q t).energy sign := by
      rw [← (q t).charge_univ]
      exact ENNReal.toReal_nonneg
    unfold bourEnergy
    exact add_nonneg (mul_nonneg (sub_nonneg.mpr hα₁) (add_nonneg (hCharge _) (hCharge _)))
      (div_nonneg (mul_nonneg hα (bourRicci_nonneg (q t))) (by norm_num))

/-- The integral of the physical gradient square on a terminal family of
original slabs goes to zero if both endpoints are cofinal in the same
regular interval. -/
theorem originalGradient_dissipation_tendsto_terminal
    (q : ℝ → SignedCollarMetric o) {α C : ℝ} (hα : 0 ≤ α) (hα₁ : α ≤ 1)
    {D : RealTimeInterval} (hConnected : D.regular.OrdConnected)
    (hG : MetricFamilySmoothOn (I := I) D (fun s => (q s).metric))
    (hEuler : ∀ t ∈ D.regular, bourEuler (q t) = C)
    (hFlow : ∀ t ∈ D.regular, ∀ x,
      deriv (fun s => metricTensorField (q s).metric x) t =
        (-2 : ℝ) • bourCovariantGradient α (q t).metric x)
    {ι : Type*} {l : Filter ι} {a b : ι → D.RegularTime}
    (ha : Tendsto a l atTop) (hb : Tendsto b l atTop)
    (hab : ∀ᶠ i in l, a i ≤ b i) :
    Tendsto (fun i => ∫ t in (a i : ℝ)..(b i : ℝ),
      gradientSq (q t).metric (bourCovariantGradient α (q t).metric)) l (𝓝 0) := by
  let _ : D.regular.OrdConnected := hConnected
  have hEnergy := originalGradient_energy_tendsto_terminal q hα hα₁ hConnected hG hEuler hFlow
  have hLimit := ((hEnergy.comp ha).sub (hEnergy.comp hb)).div_const 2
  rw [sub_self, zero_div] at hLimit
  apply hLimit.congr'
  filter_upwards [hab] with i hi
  have hTime : Icc (a i : ℝ) (b i : ℝ) ⊆ D.regular :=
    D.regular.Icc_subset (a i).property (b i).property
  exact (originalGradient_regularSlab q α C hG hi hTime hEuler
    (fun t ht => hFlow t (hTime (Ioo_subset_Icc_self ht)))).2.2.symm

/-- A fixed backward window in fourth-order time has vanishing rescaled
dissipation when its original endpoints are cofinal in the same regular
interval. The field inside this integral is the actual rescaled velocity
divided by negative two. -/
theorem originalGradient_parabolicDissipation_tendsto_terminal
    (q : ℝ → SignedCollarMetric o) {α C : ℝ} (hα : 0 ≤ α) (hα₁ : α ≤ 1)
    {D : RealTimeInterval} (hConnected : D.regular.OrdConnected)
    (hG : MetricFamilySmoothOn (I := I) D (fun s => (q s).metric))
    (hEuler : ∀ t ∈ D.regular, bourEuler (q t) = C)
    (hFlow : ∀ t ∈ D.regular, ∀ x,
      deriv (fun s => metricTensorField (q s).metric x) t =
        (-2 : ℝ) • bourCovariantGradient α (q t).metric x)
    {ι : Type*} {l : Filter ι} {a b : ι → D.RegularTime}
    (ha : Tendsto a l atTop) (hb : Tendsto b l atTop)
    (c : ι → ℝ) (hc : ∀ i, 0 < c i)
    (A : ℝ) (hA : A ≤ 0)
    (hWindow : ∀ᶠ i in l, (a i : ℝ) = A / (c i)^2 + (b i : ℝ)) :
    Tendsto (fun i => ∫ s in A..(0 : ℝ),
      let t := s / (c i)^2 + (b i : ℝ)
      gradientSq (scaleMetric (c i) (hc i) (q t).metric)
        (fun x => (c i)⁻¹ • bourCovariantGradient α (q t).metric x)) l (𝓝 0) := by
  have hab : ∀ᶠ i in l, a i ≤ b i := hWindow.mono fun i hi => by
    change (a i : ℝ) ≤ (b i : ℝ)
    rw [hi]
    exact add_le_of_nonpos_left (div_nonpos_of_nonpos_of_nonneg hA (sq_nonneg _))
  apply (originalGradient_dissipation_tendsto_terminal q hα hα₁ hConnected hG hEuler hFlow
    ha hb hab).congr'
  filter_upwards [hWindow] with i hi
  have h := parabolic_dissipation_eq o.dimension_eq
    (fun t => (q t).metric) (fun t x => bourCovariantGradient α (q t).metric x)
    (hc i) (b i : ℝ) A 0
  rw [zero_div, zero_add, ← hi] at h
  exact h.symm

end
end SmoothPoincare.Bour
