import SmoothPoincare.Variational.BourTrajectoryBudget
import SmoothPoincare.Variational.BourFlowBranches
import SmoothPoincare.Variational.BourFlowDissipation
import SmoothPoincare.Variational.BourMarkedCore

/-! # Physical estimates across the two fixed-parameter returns

The hypotheses here describe the transfer of integrals after the geometric
comparisons. They do not construct the fourth-order solution, a converging
subsequence, or the cap diffeomorphism. The exact returned class uses its
new Yamabe representative. The original Ricci integral is used before that
change of representative. -/

open DifferentialGeometry DifferentialGeometry.Geometry.Curvature DifferentialGeometry.Integral.Measure
open DifferentialGeometry.Tensor0SBundle FirstOrderTwistor Filter MeasureTheory Set
open scoped ContDiff Manifold Topology

namespace SmoothPoincare.Bour

variable {E H M : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [T2Space M] [CompactSpace M] [Nonempty M] [BoundarylessManifold I M]
  {o : ManifoldOrientation I M 4}

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

private local instance : IsManifold I 1 M := IsManifold.of_le (by decide : (1 : WithTop ℕ∞) ≤ ∞)

omit [I.Boundaryless] [Nonempty M] [BoundarylessManifold I M] in
/-- An actual first variation along the negative twice-gradient equation
supplies the functional sublevel used by the budget. This direction does
not assume an original-trajectory sublevel record. -/
theorem original_gradient_sublevel (q : ℝ → SignedCollarMetric o) (α a b : ℝ)
    (G : ℝ → (x : M) → Tensor0SSpace (𝕜 := ℝ) (I := I) 2 x) (hab : a ≤ b)
    (hC : ContinuousOn (fun t => bourEnergy α (q t)) (Icc a b))
    (hVelocity : ∀ t ∈ Ioo a b, ∀ x : M, HasDerivAt
      (fun s => metricTensorField (q s).metric x) ((-2 : ℝ) • G t x) t)
    (hVariation : ∀ t ∈ Ioo a b, HasDerivAt (fun s => bourEnergy α (q s))
      (∫ x, inner0S (q t).metric x 2 (G t x) (deriv (fun s => metricTensorField (q s).metric x) t)
        ∂riemannianVolumeMeasure I M (q t).metric) t)
    (hInt : IntervalIntegrable (fun t => gradientSq (q t).metric (G t)) volume a b) :
    bourEnergy α (q b) ≤ bourEnergy α (q a) ∧
      (∫ t in a..b, gradientSq (q t).metric (G t)) = (bourEnergy α (q a) - bourEnergy α (q b)) / 2 := by
  have h := energy_drop_eq_two_dissipation (fun t => (q t).metric) G _ hab hC hVelocity hVariation hInt
  have hn : 0 ≤ ∫ t in a..b, gradientSq (q t).metric (G t) :=
    intervalIntegral.integral_nonneg hab (fun t _ => integral_nonneg (fun x => normSq0S_nonneg _ _ _ _))
  exact ⟨by linarith, by linarith⟩

omit [I.Boundaryless] [Nonempty M] in
/-- The functional is unchanged on actual constant rescalings in dimension
four, with the closed Euler evaluations stated on the supplying metrics. -/
theorem bourEnergy_scale (q scaled : SignedCollarMetric o) (α c : ℝ) (hc : 0 < c)
    (hScaled : scaled.metric = scaleMetric c hc q.metric)
    (hEuler : bourEuler scaled = bourEuler q) :
    bourEnergy α scaled = bourEnergy α q := by
  have hD : bourRicci scaled = bourRicci q := by
    rw [bourRicci_eq_integral, bourRicci_eq_integral, hScaled]
    exact bourTraceFreeRicciIntegral_scale o.dimension_eq q.metric hc
  have hS : bourScalar scaled = bourScalar q := by
    rw [bourScalar_eq_integral, bourScalar_eq_integral, hScaled]
    simp_rw [metricScalarAt_scaleMetric, mul_pow]
    rw [volume_scaleMetric, o.dimension_eq, integral_smul_measure, ENNReal.toReal_pow,
      ENNReal.toReal_ofReal (Real.sqrt_nonneg _), smul_eq_mul, integral_const_mul]
    rw [show Real.sqrt c ^ 4 = c ^ 2 by rw [show (4:ℕ) = 2 * 2 by decide, pow_mul, Real.sq_sqrt hc.le]]
    field_simp
  have he := bourEuler_eq_charges scaled
  have hq := bourEuler_eq_charges q
  have hW : scaled.energy .plus = q.energy .plus := by linarith only [he,hq,hEuler,hS,hD]
  rw [bourEnergy_eq_chiral_ricci, bourEnergy_eq_chiral_ricci, hW, hD]

/-- Measured consequences of one supplied closed or marked pointed
extraction. In the pointed case the left side of the Ricci comparison is the
model's charge, identified as four times the conformally returned energy.
The scalar bound belongs to the new Yamabe gauge. -/
inductive ReturnedMeasurements {P : Type*} [TopologicalSpace P] {α : ℝ} {s : P}
    (f : OriginalTrajectory o α s) (q : SignedCollarMetric o) : ℝ → Prop
  | closed (t : ℕ → P)
      (energy : Tendsto (fun n => f.energy (t n)) atTop (𝓝 (q.energy .plus)))
      (ricci : Tendsto (fun n => bourRicci (f.slice (t n))) atTop (𝓝 (bourRicci q))) :
      ReturnedMeasurements f q α
  | pointed (t : ℕ → P)
      (energy : q.energy .plus ≤ liminf (fun n => f.energy (t n)) atTop)
      (ricci : 4 * q.energy .plus ≤ liminf (fun n => bourRicci (f.slice (t n))) atTop)
      (yamabeGauge : bourScalar q ≤ 384 * Real.pi^2) : ReturnedMeasurements f q 0

/-- Transfer the budget on the original time carrier to a measured return.
The Yamabe deficit is charged to the original Ricci mass only on the
regularized closed arm. -/
theorem fixedReturn_budget {P : Type*} [TopologicalSpace P] {α p : ℝ} {s : P}
    (f : OriginalTrajectory o α s) (q : SignedCollarMetric o) (hr : ReturnedMeasurements f q p)
    (hα : 0 < α) (he : f.excess ≤ α^2) (hb : ∀ t, TimeBudget f t)
    (hY : 0 < classYamabeFour o.dimension_eq q.metric) (hEuler : bourEuler q = 16 * Real.pi^2) :
    let Istar := sInf (geometricPositiveEnergies o)
    Istar ≤ q.energy .plus ∧ q.energy .plus ≤ f.energy s / (1-α) ∧
    0 ≤ p ∧ p ≤ α ∧
    (bourRicci q ≤ 4 * Istar + 4 * α + (f.yamabe s ^ 2 - 384 * Real.pi^2) / 12 ∨
      (384 * Real.pi^2 - f.yamabe s ^ 2 ≤ 48 * α ∧ bourRicci q ≤ 4 * q.energy .plus)) := by
  intro Istar
  have hI : Istar ≤ q.energy .plus := bourInfimum_le_energy q hY
  have ha : 4 * f.excess / α ≤ 4 * α := (div_le_iff₀ hα).2 (by nlinarith only [he])
  have dNonneg (t : P) := bourRicci_nonneg (f.slice t)
  have eNonneg (t : P) : 0 ≤ f.energy t := chiralFrameEnergy_nonneg _ _
  cases hr with
  | closed t hEt hDt =>
    have hUpper := le_of_tendsto hEt (Eventually.of_forall fun n => (hb (t n)).plus_upper)
    have hRic := le_of_tendsto hDt (Eventually.of_forall fun n => (hb (t n)).ricci_sharp)
    exact ⟨hI, hUpper, hα.le, le_rfl, Or.inl (by dsimp [Istar]; linarith only [hRic, ha])⟩
  | pointed t hEt hDt hS =>
    have hUpper := hEt.trans (liminf_le_of_frequently_le
      (Eventually.of_forall fun n => (hb (t n)).plus_upper).frequently
      (isBoundedUnder_of_eventually_ge (Eventually.of_forall fun n => eNonneg (t n))))
    have hRic := hDt.trans (liminf_le_of_frequently_le
      (Eventually.of_forall fun n => (hb (t n)).ricci_sharp).frequently
      (isBoundedUnder_of_eventually_ge (Eventually.of_forall fun n => dNonneg (t n))))
    have hDef := (bourFirstPointed_excess_and_deficit (f.slice s) q hα hY rfl hRic he).2
    have hGB := bourEuler_eq_charges q
    exact ⟨hI, hUpper, le_rfl, hα.le, Or.inr ⟨hDef, by linarith only [hGB, hEuler, hS]⟩⟩

/-- Both signed energies of the mixed returns converge to the fixed-type
infimum and their parameters converge to zero. Every input comparison uses
a time sequence on its own fixed-parameter trajectory. -/
theorem mixedReturn_energy_and_parameter {P : ℕ → Type*} [∀ j, TopologicalSpace (P j)]
    {α p : ℕ → ℝ} {s : ∀ j, P j} (f : ∀ j, OriginalTrajectory o (α j) (s j))
    (q : ℕ → SignedCollarMetric o) (hα : Tendsto α atTop (𝓝 0)) (hp : ∀ j, 0 < α j)
    (he : ∀ j, (f j).excess ≤ α j ^ 2) (hBud : ∀ᶠ j in atTop, ∀ t, TimeBudget (f j) t)
    (hr : ∀ᶠ j in atTop, ReturnedMeasurements (f j) (q j) (p j))
    (hY : ∀ᶠ j in atTop, 0 < classYamabeFour o.dimension_eq (q j).metric)
    (hEuler : ∀ j, bourEuler (q j) = 16 * Real.pi^2) :
    (∀ sign, Tendsto (fun j => (q j).energy sign) atTop (𝓝 (sInf (geometricPositiveEnergies o)))) ∧
      Tendsto p atTop (𝓝 0) := by
  let Istar := sInf (geometricPositiveEnergies o)
  have hConst (v : ℝ) : Tendsto (fun _ : ℕ => v) atTop (𝓝 v) := tendsto_const_nhds
  have hStart : Tendsto (fun j => (f j).energy (s j)) atTop (𝓝 Istar) := by
    have hu : Tendsto (fun j => Istar + (α j)^2) atTop (𝓝 Istar) := by
      simpa using (hConst Istar).add (hα.pow 2)
    apply (hConst Istar).squeeze hu
    · exact fun j => bourInfimum_le_energy _ (f j).start_positive
    · intro j
      have h := he j
      change (f j).energy (s j) - Istar ≤ _ at h
      linarith
  have hQuot : Tendsto (fun j => (f j).energy (s j) / (1 - α j)) atTop (𝓝 Istar) := by
    have h := hStart.div ((hConst 1).sub hα) (by norm_num : (1 : ℝ) - 0 ≠ 0)
    rw [sub_zero, div_one] at h
    exact h.congr fun j => by rfl
  have hBounds : ∀ᶠ j in atTop, Istar ≤ (q j).energy .plus ∧
      (q j).energy .plus ≤ (f j).energy (s j) / (1 - α j) ∧ 0 ≤ p j ∧ p j ≤ α j := by
    filter_upwards [hBud, hr, hY] with j hb ht hy
    have h := fixedReturn_budget _ _ ht (hp j) (he j) hb hy (hEuler j)
    exact ⟨h.1,h.2.1,h.2.2.1,h.2.2.2.1⟩
  have hPlus := tendsto_of_tendsto_of_tendsto_of_le_of_le' (hConst Istar) hQuot
    (hBounds.mono fun _ h => h.1) (hBounds.mono fun _ h => h.2.1)
  refine ⟨fun sign => ?_, tendsto_of_tendsto_of_tendsto_of_le_of_le' (hConst 0) hα
    (hBounds.mono fun _ h => h.2.2.1) (hBounds.mono fun _ h => h.2.2.2)⟩
  cases sign with
  | plus => exact hPlus
  | minus => exact hPlus.congr fun j => (q j).signature_zero

/-- One cutoff for the mixed physical representatives. The closed arm keeps
the physical Ricci transfer. On the exact arm the Yamabe scalar-square bound
is applied on the new representative. A Yamabe representative of the
returned class also yields its positive class floor. -/
theorem mixedReturn_uniform_physical_budget {P : ℕ → Type*} [∀ j, TopologicalSpace (P j)]
    {α p : ℕ → ℝ} {s : ∀ j, P j} (f : ∀ j, OriginalTrajectory o (α j) (s j))
    (q : ℕ → SignedCollarMetric o) (hα : Tendsto α atTop (𝓝 0)) (hp : ∀ j, 0 < α j)
    (he : ∀ j, (f j).excess ≤ α j ^ 2) (hb : ∀ᶠ j in atTop, ∀ t, TimeBudget (f j) t)
    (hr : ∀ᶠ j in atTop, ReturnedMeasurements (f j) (q j) (p j))
    (hY : ∀ᶠ j in atTop, 0 < classYamabeFour o.dimension_eq (q j).metric)
    (rep : ∀ j, UnitYamabeRepresentative (q j))
    (hEuler : ∀ m : SignedCollarMetric o, bourEuler m = 16 * Real.pi^2)
    (hEntry : sInf (geometricPositiveEnergies o) < 8 * Real.pi^2) :
    let δ := 8 * Real.pi^2 - sInf (geometricPositiveEnergies o)
    ∀ᶠ j in atTop, Real.sqrt (24 * δ) ≤ classYamabeFour o.dimension_eq (q j).metric ∧
      bourRicci (q j) ≤ 32 * Real.pi^2 - 2 * δ ∧
      bourScalar (q j) ≤ 384 * Real.pi^2 + 48 * α j ∧
      bourFullCurvature (q j) ≤ 48 * Real.pi^2 - 2 * δ := by
  intro δ
  let Istar := sInf (geometricPositiveEnergies o)
  have hδ : 0 < δ := sub_pos.mpr hEntry
  have hEnergy := (mixedReturn_energy_and_parameter f q hα hp he hb hr hY (fun j => hEuler (q j))).1 .plus
  have hE : ∀ᶠ j in atTop, (q j).energy .plus < Istar + δ/2 :=
    hEnergy.eventually (gt_mem_nhds (lt_add_of_pos_right _ (half_pos hδ)))
  filter_upwards [hb,hr,hY,hE,hα.eventually (gt_mem_nhds (half_pos hδ))] with j hj hret hy hUpper hSmall
  have h := fixedReturn_budget _ _ hret (hp j) (he j) hj hy (hEuler _)
  have hI := h.1
  have hD := h.2.2.2.2
  have hYGB := bourEuler_eq_charges (rep j).rep
  rw [hEuler, (rep j).scalar_square, (rep j).energy_eq] at hYGB
  have hPos := bourRicci_nonneg (rep j).rep
  have hQGB := bourEuler_eq_charges (q j)
  rw [hEuler] at hQGB
  have hR0 := (f j).start_yamabe_sq_le
  dsimp only [δ, Istar] at hUpper hSmall ⊢
  have hyFloor : Real.sqrt (24 * δ) ≤ classYamabeFour o.dimension_eq (q j).metric := by
    apply (Real.sqrt_le_iff).2
    exact ⟨hy.le, by dsimp [δ,Istar] at *; linarith only [hYGB,hPos,hUpper]⟩
  have hPair : bourRicci (q j) ≤ 32 * Real.pi^2 - 2 * δ ∧
      bourScalar (q j) ≤ 384 * Real.pi^2 + 48 * α j := by
    dsimp [δ]
    rcases hD with hd | ⟨_, hd⟩
    · constructor <;> linarith only [hd, hR0, hSmall, hQGB, hI]
    · constructor <;> linarith only [hd, hUpper, hQGB, (hp j)]
  refine ⟨hyFloor,hPair.1,hPair.2,?_⟩
  rw [bourFullCurvature_eq_euler_add_ricci, hEuler]
  linarith only [hPair.1]

/-- The actual fixed-flow measurements, with either branch at each index,
supply the deficit test on the specific second marked sequence.
The scale-invariant real lower semicontinuity and same-type energy comparison
belong to that second extraction. -/
theorem mixedReturn_pointed_saturation {P : ℕ → Type*} [∀ j, TopologicalSpace (P j)]
    {α p : ℕ → ℝ} {s : ∀ j, P j} (f : ∀ j, OriginalTrajectory o (α j) (s j))
    (q : ℕ → SignedCollarMetric o) (returned : SignedCollarMetric o)
    (hα : Tendsto α atTop (𝓝 0)) (hp : ∀ j, 0 < α j)
    (he : ∀ j, (f j).excess ≤ α j ^ 2)
    (hBud : ∀ᶠ j in atTop, ∀ t, TimeBudget (f j) t)
    (hr : ∀ᶠ j in atTop, ReturnedMeasurements (f j) (q j) (p j))
    (hY : ∀ᶠ j in atTop, 0 < classYamabeFour o.dimension_eq (q j).metric)
    (hEuler : ∀ j, bourEuler (q j) = 16 * Real.pi^2)
    (hReturned : 0 < classYamabeFour o.dimension_eq returned.metric)
    (hE : returned.energy .plus ≤ liminf (fun j => (q j).energy .plus) atTop)
    (hD : 4 * returned.energy .plus ≤ liminf (fun j => bourRicci (q j)) atTop) :
    returned.energy .plus = sInf (geometricPositiveEnergies o) ∧
      Tendsto (fun j => ((f j).yamabe (s j))^2) atTop (𝓝 (384 * Real.pi^2)) := by
  apply bourMixedPointed_startYamabeSq_tendsto (fun j => (f j).slice (s j)) q returned α hα
    hReturned (hE.trans_eq ((mixedReturn_energy_and_parameter f q hα hp he hBud hr hY hEuler).1 .plus).liminf_eq) (Eventually.of_forall fun j => (f j).start_yamabe_sq_le)
  · filter_upwards [hBud, hr, hY] with j hb hret hy
    have h := (fixedReturn_budget _ _ hret (hp j) (he j) hb hy (hEuler j)).2.2.2.2
    rcases h with hc | hbub
    · exact Or.inr ((bourRicci_eq_integral _).symm.trans_le hc)
    · exact Or.inl hbub.1
  · simpa only [← bourRicci_eq_integral] using hD

end SmoothPoincare.Bour
