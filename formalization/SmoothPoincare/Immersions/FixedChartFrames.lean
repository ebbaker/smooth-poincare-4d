import SmoothPoincare.Immersions.ImmersionChart
import DifferentialGeometry.Geometry.Geodesic.Chart.TransitionMap
import DifferentialGeometry.Geometry.Submanifold.SecondFundamentalForm.MetricCompatibility

/-! # Transport of principal frames to a fixed chart -/

open Bundle DifferentialGeometry DifferentialGeometry.Geometry
open DifferentialGeometry.Geometry.Connection DifferentialGeometry.Geometry.Riemannian.Geodesic
open FirstOrderTwistor Manifold Set
open scoped ContDiff Manifold Topology

namespace SmoothPoincare

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]

/-- The derivative of the actual transition from the fixed chart to the
chart centered at the point where the frame is given. -/
noncomputable def fixedChartFrameTransition (p q : M) : E →L[ℝ] E :=
  fderiv ℝ ((extChartAt I q : M → E) ∘ (extChartAt I p).symm) (extChartAt I p q)

omit [FiniteDimensional ℝ E] [I.Boundaryless] in
private theorem centeredChartTriv_apply (q : M) (u : TangentSpace I q) :
    trivToE (I := I) q q u = u := by
  rw [trivToE, TangentBundle.continuousLinearMapAt_trivializationAt (mem_chart_source H q),
    mfderiv_extChartAt_self]
  rfl

omit [FiniteDimensional ℝ E] in
private theorem fixedChartFrameTransition_apply (p : M) {q : M}
    (hq : q ∈ (extChartAt I p).source) (u : E) :
    fixedChartFrameTransition (I := I) p q u = trivFromE (I := I) p q u := by
  have hqp : q ∈ (chartAt H p).source := by simpa only [extChartAt_source] using hq
  have hqq := mem_chart_source H q
  have h := trivToE_mfderiv_trivFromE (I := I) (IN := I) (f := id)
    p q q hqp hqq mdifferentiableAt_id u
  simp only [id_eq, mfderiv_id, ContinuousLinearMap.id_apply] at h
  rw [centeredChartTriv_apply] at h
  exact h.symm

/-- On the actual overlap the transition derivative is a continuous linear
equivalence, whose inverse is the derivative of the reverse transition. -/
noncomputable def fixedChartFrameTransitionEquiv (p : M) {q : M}
    (hq : q ∈ (extChartAt I p).source) : E ≃L[ℝ] E := by
  let y := extChartAt I p q
  let z := extChartAt I q q
  let L := fixedChartFrameTransition (I := I) p q
  let R := chartTransitionAt (I := I) q p z
  have hqp : q ∈ (chartAt H p).source := by simpa only [extChartAt_source] using hq
  have hy : y ∈ chartTransitionSource (I := I) p q :=
    extChartAt_mem_chartTransitionSource p q hqp (mem_chart_source H q)
  have hz : chartTransitionMap (I := I) p q y = z :=
    chartTransitionMap_apply_extChartAt p q hqp
  have hL : chartTransitionAt (I := I) p q y = L := by
    rw [chartTransitionAt_def, chartTransitionMap_def]
    rfl
  have hRL : R.comp L = ContinuousLinearMap.id ℝ E := by
    simpa only [hz, hL] using chartTransitionAt_comp_chartTransitionAt p q hy
  have hLR : L.comp R = ContinuousLinearMap.id ℝ E := by
    simpa only [hz, hL] using chartTransitionAt_reverse_comp p q hy
  exact
    { toLinearEquiv :=
        { toFun := L
          invFun := R
          left_inv := fun u => congrArg (fun A : E →L[ℝ] E => A u) hRL
          right_inv := fun u => congrArg (fun A : E →L[ℝ] E => A u) hLR
          map_add' := L.map_add
          map_smul' := L.map_smul }
      continuous_toFun := L.continuous
      continuous_invFun := R.continuous }

omit [FiniteDimensional ℝ E] in
@[simp]
theorem fixedChartFrameTransitionEquiv_apply (p : M) {q : M}
    (hq : q ∈ (extChartAt I p).source) (u : E) :
    fixedChartFrameTransitionEquiv (I := I) p hq u =
      fixedChartFrameTransition (I := I) p q u := rfl

omit [FiniteDimensional ℝ E] in
@[simp]
theorem fixedChartFrameTransitionEquiv_symm_apply (p : M) {q : M}
    (hq : q ∈ (extChartAt I p).source) (u : E) :
    (fixedChartFrameTransitionEquiv (I := I) p hq).symm u =
      fderiv ℝ ((extChartAt I p : M → E) ∘ (extChartAt I q).symm) (extChartAt I q q) u :=
  rfl

omit [FiniteDimensional ℝ E] in
/-- The actual overlap derivative transports the fixed-chart metric to the
same metric written in the chart centered at the overlap point. -/
theorem fixedChartFrameTransition_metric (g : SmoothRiemannianMetric I M)
    (p : M) {q : M} (hq : q ∈ (extChartAt I p).source) (u v : E) :
    chartMetricBilin g q (extChartAt I q q)
        (fixedChartFrameTransition (I := I) p q u)
        (fixedChartFrameTransition (I := I) p q v) =
      chartMetricBilin g p (extChartAt I p q) u v := by
  have hqq := mem_chart_source H q
  calc
    _ = g.inner q (trivFromE (I := I) p q u) (trivFromE (I := I) p q v) := by
      rw [fixedChartFrameTransition_apply p hq u, fixedChartFrameTransition_apply p hq v]
      simpa only [centeredChartTriv_apply] using chartMetricBilin_trivToE g q q hqq
        (trivFromE (I := I) p q u) (trivFromE (I := I) p q v)
    _ = _ := by rw [chartMetricBilin_apply, (extChartAt I p).left_inv hq]

variable [T2Space M] {g : SmoothRiemannianMetric I M}

local notation "V₅" => EuclideanSpace ℝ (Fin 5)

omit [FiniteDimensional ℝ E] [T2Space M] in
/-- The derivative of the written immersion in the fixed source chart is
the manifold derivative applied to the same tangent vector. -/
theorem fixedChartFrameTransition_immersionDerivative (F : IsometricHypersurface g)
    (p : M) {q : M} (hq : q ∈ (extChartAt I p).source) (u : E) :
    fderiv ℝ (F.localMap p) (extChartAt I p q) u =
      mfderiv I 𝓘(ℝ, V₅) F.map q (fixedChartFrameTransition (I := I) p q u) := by
  have hqp : q ∈ (chartAt H p).source := by simpa only [extChartAt_source] using hq
  have h := trivToE_mfderiv_trivFromE (I := 𝓘(ℝ, V₅)) (IN := I) (f := F.map)
    p q (F.map p) hqp (by simp) (F.smooth.mdifferentiableAt (by simp)) u
  rw [fixedChartFrameTransition_apply p hq]
  rw [trivToE, TangentBundle.continuousLinearMapAt_model_space] at h
  exact h.symm

omit [T2Space M] in
/-- A given principal frame at an overlap point yields an orthonormal basis
in the fixed chart, and the written derivative sends its vectors to the
ambient images of the given frame. -/
theorem exists_fixedChartPrincipalBasis {F : IsometricHypersurface g}
    {o : ManifoldOrientation I M 4} (p : M) {q : M}
    (hq : q ∈ (extChartAt I p).source) (Q : PrincipalFrameAt F o q) :
    let y := extChartAt I p q
    let z := extChartAt I q q
    let L := fixedChartFrameTransition (I := I) p q
    ∃ b : Module.Basis (Fin 4) ℝ E,
      y ∈ interior (extChartAt I p).target ∧
      z ∈ interior (extChartAt I q).target ∧
      (∀ i, L (b i) = Q.frame.basis i) ∧
      (∀ i j, chartMetricBilin g p y (b i) (b j) = if i = j then 1 else 0) ∧
      (∀ i, fderiv ℝ (F.localMap p) y (b i) =
        mfderiv I 𝓘(ℝ, V₅) F.map q (Q.frame.basis i)) := by
  dsimp only
  let L := fixedChartFrameTransitionEquiv (I := I) p hq
  let b := Q.frame.basis.map L.symm.toLinearEquiv
  have hb (i : Fin 4) : fixedChartFrameTransition (I := I) p q (b i) = Q.frame.basis i := by
    change L (L.symm (Q.frame.basis i)) = Q.frame.basis i
    exact L.apply_symm_apply _
  refine ⟨b, ?_, ?_, hb, ?_, ?_⟩
  · rw [(isOpen_extChartAt_target p).interior_eq]
    exact (extChartAt I p).map_source hq
  · rw [(isOpen_extChartAt_target q).interior_eq]
    exact mem_extChartAt_target q
  · intro i j
    rw [← fixedChartFrameTransition_metric g p hq, hb, hb]
    simpa only [centeredChartTriv_apply, Q.frame.orthonormal] using
      chartMetricBilin_trivToE g q q (mem_chart_source H q) (Q.frame.basis i) (Q.frame.basis j)
  · intro i
    rw [fixedChartFrameTransition_immersionDerivative F p hq, hb]

end SmoothPoincare
