import SmoothPoincare.Variational.EulerGaugeFrames
import DifferentialGeometry.Geometry.Metric.Comparison.DistanceScaling
import Mathlib.Analysis.SpecialFunctions.Pow.Deriv

/-! # Terminal distances under a scale-invariant lower Ricci bound -/

open Bundle DifferentialGeometry DifferentialGeometry.Geometry.Curvature
  DifferentialGeometry.PDE.RicciFlow Set
open scoped ContDiff Manifold Topology

noncomputable section
namespace SmoothPoincare

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  {D : RealTimeInterval}

private local instance : CompleteSpace E := FiniteDimensional.complete ℝ E
private local instance : IsManifold I 1 M := IsManifold.of_le (by decide : (1 : WithTop ℕ∞) ≤ ∞)

/-- A lower Ricci form bound at interior times controls the length distortion
to the actual terminal carrier metric with its exact power weight. -/
theorem ricciFlow_terminalDistance_power_bound (S : SolutionOn (I := I) (M := M) D) (hS : IsSolutionOn S)
    {τ b : ℝ} (hCarrier : Icc 0 τ ⊆ D.carrier) (hRegular : Ioo 0 τ ⊆ D.regular)
    (hRic : ∀ r ∈ Ioo 0 τ, ∀ x (v : TangentSpace I x),
      -(b/r) * (S.base.metric r).inner x v v ≤ S.ricciAt r x (vec2 v v))
    {s : ℝ} (hs : s ∈ Ioo 0 τ) (x y : M) :
    riemannianEDistOf (S.base.metric τ) x y ≤ ENNReal.ofReal (Real.sqrt (τ^(2*b) * s^(-(2*b)))) *
      riemannianEDistOf (S.base.metric s) x y := by
  have hτ := hs.1.trans hs.2
  apply edistOf_le_of_quad _ _ (mul_pos (Real.rpow_pos_of_pos hτ _) (Real.rpow_pos_of_pos hs.1 _))
  intro z v
  let G := fun r : ℝ => (S.base.metric r).inner z v v
  have hcont : ContinuousOn G D.carrier := by
    rw [continuousOn_iff_continuous_domRestrict]
    exact hS.smoothMetric.metricTensor_cont.eval_continuous
      (P := {r : ℝ // r ∈ D.carrier}) (τ := Subtype.val) (b := fun _ => z)
      continuous_subtype_val (fun p => p.2) continuous_const
      (v := fun i _ => vec2 v v i) (fun _ => continuous_const)
  have har (r : ℝ) (hr : r ∈ Ioo s τ) : r ∈ Ioo 0 τ := ⟨hs.1.trans hr.1,hr.2⟩
  have hpow (r : ℝ) (hr : 0 < r) := Real.hasDerivAt_rpow_const (p := -(2*b)) (Or.inl hr.ne')
  have hpc : ContinuousOn (fun r : ℝ => r^(-(2*b))) (Icc s τ) :=
    fun r hr => (hpow r (hs.1.trans_le hr.1)).continuousAt.continuousWithinAt
  have hanti : AntitoneOn (fun r : ℝ => r^(-(2*b)) * G r) (Icc s τ) := by
    apply antitoneOn_of_hasDerivWithinAt_nonpos (convex_Icc s τ)
      (f' := fun r => r^(-(2*b)) * (-2 * (S.ricciAt r z (vec2 v v) + b/r * G r)))
    · exact hpc.mul
        (hcont.mono (fun r hr => hCarrier ⟨hs.1.le.trans hr.1,hr.2⟩))
    · intro r hr
      rw [interior_Icc] at hr
      have hr0 := (har r hr).1
      have hg := metricDerivAt S hS ⟨r,hRegular (har r hr)⟩ z v v
      change HasDerivAt G (-2 * S.ricciAt r z (vec2 v v)) r at hg
      have hp := ((hpow r hr0).mul hg).hasDerivWithinAt (s := interior (Icc s τ))
      convert hp using 1
      rw [Real.rpow_sub hr0, Real.rpow_one]
      ring
    · intro r hr
      rw [interior_Icc] at hr
      have h := hRic r (har r hr) z v
      change -(b/r) * G r ≤ _ at h
      exact mul_nonpos_of_nonneg_of_nonpos (Real.rpow_nonneg (har r hr).1.le _) (by linarith)
  have h := hanti (left_mem_Icc.mpr hs.2.le) (right_mem_Icc.mpr hs.2.le) hs.2.le
  change τ^(-(2*b)) * G τ ≤ s^(-(2*b)) * G s at h
  rw [Real.rpow_neg hτ.le, ← div_eq_inv_mul, div_le_iff₀ (Real.rpow_pos_of_pos hτ _)] at h
  change G τ ≤ _
  linarith only [h]

end SmoothPoincare
