import SmoothPoincare.Variational.BourTensorFirstVariation
import DifferentialGeometry.Geometry.Connection.MetricTrace.CovariantTwoTensor

/-! # Trace of the connection speed on the original metric family

Prepared for Edward B. Baker III, 26 November 2026, with OpenAI Codex assistance.
The basis used to contract the output and last slot need not be orthonormal.
-/

open Bundle DifferentialGeometry DifferentialGeometry.Geometry.Connection
  DifferentialGeometry.Geometry.Curvature DifferentialGeometry.Geometry.Operator
  DifferentialGeometry.PDE.RicciFlow DifferentialGeometry.Tensor0SBundle
  DifferentialGeometry.Tensor.RSTensor DifferentialGeometry.Tensor.Coordinates
open scoped ContDiff Manifold BigOperators

namespace SmoothPoincare.Bour

noncomputable section

variable {E H M : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
  [FiniteDimensional ℝ E] [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  [BoundarylessManifold I M]

/-- Tracing the lowered native Koszul flux in a fixed basis, including an
oblique chart basis, gives half the spatial differential of the metric trace
of the physical speed. The contraction is between the output and last slot. -/
theorem bourKoszulFlux_native_trace (g : ℝ → SmoothRiemannianMetric I M)
    {D : RealTimeInterval} (hG : MetricFamilySmoothOn (I := I) D g)
    {t : ℝ} (ht : t ∈ D.regular) {x : M}
    {ι : Type*} [Fintype ι] [DecidableEq ι]
    (b : Module.Basis ι ℝ (TangentSpace I x)) (a : ι → ι → ℝ)
    (ha : MetricInverseInBasis (g t) x b a) (v : TangentSpace I x) :
    let K := bourMetricVelocity g hG ht
    ∑ i, ∑ j, a i j * bourKoszulFlux (g t) K x (Fin.cons (b i) (vec2 v (b j))) =
      (1 / 2 : ℝ) * differential1FormFun (I := I)
        (fun y => metricTracePair0SAt (g t) (K y)) x (fun _ => v) := by
  let K := bourMetricVelocity g hG ht
  let N := totalNabla0SFun 2 (LeviCivita (g t)) K x
  let T (i j : ι) := a i j * N (vec3 v (b i) (b j))
  let Z (i j : ι) := a i j * N (Fin.cons (b i) (vec2 v (b j)))
  have hderiv (y : M) (u w : TangentSpace I y) :
      HasDerivAt (fun s => (g s).inner y u w) (K y (vec2 u w)) t := by
    have hv := (tensor0SEvalCLM (I := I) (vec2 u w)).hasFDerivAt.comp_hasDerivAt t
      (bourMetric_hasDerivAt_regular g hG ht y)
    change HasDerivAt (fun s => metricTensorField (g s) y (vec2 u w))
      (deriv (fun s => metricTensorField (g s) y) t (vec2 u w)) t at hv
    simpa [K, vec2] using hv
  have hcons (u w z : TangentSpace I x) :
      Fin.cons u (vec2 w z) = vec3 (I := I) u w z := by
    funext i
    fin_cases i <;> rfl
  have hentry (i j : ι) :
      a i j * bourKoszulFlux (g t) K x (Fin.cons (b i) (vec2 v (b j))) =
      (1 / 2 : ℝ) * (T j i + Z j i - Z i j) := by
    rw [bourKoszulFlux_native]
    have h := leviCivita_variation_koszul_of_metricFamilySmoothOn hG
      (D.regular_isOpen.mem_nhds ht) K hderiv x v (b j) (b i)
    change 2 * _ = N (Fin.cons v (vec2 (b j) (b i))) +
      N (Fin.cons (b j) (vec2 v (b i))) - N (Fin.cons (b i) (vec2 v (b j))) at h
    unfold T Z
    rw [MetricInverseInBasis.symmetric (g t) x b a ha j i]
    rw [hcons v (b j) (b i)] at h
    linarith only [congrArg (fun z : ℝ => a i j * z) h]
  change ∑ i, ∑ j, a i j * bourKoszulFlux (g t) K x _ = _
  simp_rw [hentry]
  simp only [← Finset.mul_sum, Finset.sum_sub_distrib, Finset.sum_add_distrib]
  rw [Finset.sum_comm (f := fun i j => Z j i), add_sub_cancel_right,
    Finset.sum_comm (f := fun i j => T j i)]
  have hTrace := differential_metricTrace_eq_trace_totalNabla_inBasis
    (leviCivitaConnectionOfMetric (I := I) (g t)) (g t)
    (leviCivitaConnectionOfMetric_isMetricCompatible (g t)) K b a ha v
  exact congrArg (fun r : ℝ => (1 / 2 : ℝ) * r) hTrace.symm

/-- A spatially trace-free native speed kills the contracted connection speed
on the time slice. This requires the trace to vanish as a spatial function. -/
theorem bourKoszulFlux_native_trace_eq_zero (g : ℝ → SmoothRiemannianMetric I M)
    {D : RealTimeInterval} (hG : MetricFamilySmoothOn (I := I) D g)
    {t : ℝ} (ht : t ∈ D.regular)
    (htrace : ∀ y, metricTracePair0SAt (g t) (bourMetricVelocity g hG ht y) = 0)
    {x : M} {ι : Type*} [Fintype ι] [DecidableEq ι]
    (b : Module.Basis ι ℝ (TangentSpace I x)) (a : ι → ι → ℝ)
    (ha : MetricInverseInBasis (g t) x b a) (v : TangentSpace I x) :
    ∑ i, ∑ j, a i j * bourKoszulFlux (g t) (bourMetricVelocity g hG ht) x
        (Fin.cons (b i) (vec2 v (b j))) = 0 := by
  rw [bourKoszulFlux_native_trace g hG ht b a ha v]
  simp_rw [htrace]
  simp [differential1FormFun_apply_eq_mvfderiv, mvfderiv, mfderiv_const]

/-- The actual trace of the connection flux, with its first and third slots
contracted in the slice metric. -/
def bourKoszulTraceForm (g : SmoothRiemannianMetric I M)
    (K : Tensor0SField (I := I) (M := M) ∞ 2) : Tensor0SField (I := I) (M := M) ∞ 1 :=
  metricTraceFirstTwoField g
    (Tensor0SField.domDomCongr ∞ (Equiv.swap (1 : Fin 3) 2) (bourKoszulFlux g K))

omit [BoundarylessManifold I M] in
theorem bourKoszulTraceForm_inBasis (g : SmoothRiemannianMetric I M)
    (K : Tensor0SField (I := I) (M := M) ∞ 2) {x : M}
    {ι : Type*} [Fintype ι] [DecidableEq ι]
    (b : Module.Basis ι ℝ (TangentSpace I x)) (a : ι → ι → ℝ)
    (ha : MetricInverseInBasis g x b a) (w : Fin 1 → TangentSpace I x) :
    bourKoszulTraceForm g K x w =
      ∑ i, ∑ j, a i j * bourKoszulFlux g K x (Fin.cons (b i) (vec2 (w 0) (b j))) := by
  rw [bourKoszulTraceForm, metricTraceFirstTwoField_apply, metricTraceFirstTwo0STensor_apply,
    metricTraceFirstTwo0SAt_eq_sum_basis g b a ha]
  unfold metricTrace0S2InBasis
  apply Finset.sum_congr rfl
  intro i _
  apply Finset.sum_congr rfl
  intro j _
  congr 1
  rw [Tensor0SField.domDomCongr_apply, Tensor0SSpace.domDomCongr_apply]
  congr 1
  funext k
  fin_cases k <;> rfl

/-- As a smooth one-form, the traced physical connection variation is
half the covariant derivative of the scalar trace of the metric speed. -/
theorem bourKoszulTraceForm_native (g : ℝ → SmoothRiemannianMetric I M)
    {D : RealTimeInterval} (hG : MetricFamilySmoothOn (I := I) D g)
    {t : ℝ} (ht : t ∈ D.regular) :
    let K := bourMetricVelocity g hG ht
    bourKoszulTraceForm (g t) K =
      (1 / 2 : ℝ) • metricNabla0S (g t) (metricTraceFirstTwoField (s := 0) (g t) K) := by
  let K := bourMetricVelocity g hG ht
  ext x w
  let b := coordinateFrameAtToBasis (I := I) x
  let a := fun i j => inverseMetricFlatModelInChartComponent (I := I) (g t) x i j (extChartAt I x x)
  have ha : MetricInverseInBasis (g t) x b a := DifferentialGeometry.Tensor.Coordinates.inverseMetricFlatModelInChart_metricInverseInBasis_center (g t) x
  rw [bourKoszulTraceForm_inBasis (g t) K b a ha,
    bourKoszulFlux_native_trace g hG ht b a ha (w 0)]
  change _ = (1 / 2 : ℝ) * totalNabla0SFun 0 (LeviCivita (g t))
    (metricTraceFirstTwoField (g t) K) x w
  congr 1
  let tail : Fin 0 → TangentSpace I x := Fin.elim0
  have hw : w = Fin.cons (w 0) tail := by funext k; fin_cases k; rfl
  conv_rhs => rw [hw]
  rw [nabla_metricTraceFirstTwo0S (LeviCivita (g t)) (g t)
    (leviCivitaConnectionOfMetric_isMetricCompatible (g t)) K b a ha]
  have hd := differential_metricTrace_eq_trace_totalNabla_inBasis
    (LeviCivita (g t)) (g t) (leviCivitaConnectionOfMetric_isMetricCompatible (g t)) K b a ha (w 0)
  rw [hd]
  apply Finset.sum_congr rfl
  intro i _
  apply Finset.sum_congr rfl
  intro j _
  congr 2
  funext k
  fin_cases k <;> rfl

end
end SmoothPoincare.Bour
