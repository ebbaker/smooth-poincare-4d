import SmoothPoincare.Variational.BourSlabVariation
import DifferentialGeometry.Analysis.Elliptic.ConnectionLaplacian.IntegrationByParts.WeightedDivergence
import DifferentialGeometry.Geometry.Connection.LeviCivita.Variation.MetricDerivative
import DifferentialGeometry.Geometry.Metric.Family.TimeDerivative
import DifferentialGeometry.Geometry.Metric.TensorInner.FiberMetric.Tensor0SMetricCongr
import DifferentialGeometry.Tensor.RSTensor.Coordinates.Field

/-! # Spatial adjoints for Bour's first variation

E49, 26 November 2026. Prepared for Edward B. Baker III with OpenAI Codex
assistance. Actual serving model and effort were unavailable.
-/

open Bundle DifferentialGeometry DifferentialGeometry.Analysis.Elliptic
  DifferentialGeometry.Geometry.Connection DifferentialGeometry.Geometry.Curvature
  DifferentialGeometry.Geometry.Operator DifferentialGeometry.Integral.Measure
  DifferentialGeometry.PDE.RicciFlow DifferentialGeometry.Tensor0SBundle
  DifferentialGeometry.Tensor.RSTensor MeasureTheory
open scoped ContDiff Manifold

namespace SmoothPoincare.Bour

noncomputable section

variable {E H M : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
  [FiniteDimensional ℝ E] [NeZero (Module.finrank ℝ E)] [TopologicalSpace H]
  {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [T2Space M] [CompactSpace M] [BoundarylessManifold I M]

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

/-- The physical $L^2$ pairing of two smooth covariant sections on one slice. -/
def bourClosedTensorPairing (g : SmoothRiemannianMetric I M) {s : ℕ}
    (A K : Tensor0SField (I := I) (M := M) ∞ s) : ℝ :=
  ∫ x, inner0S g x s (A x) (K x) ∂riemannianVolumeMeasure I M g

omit [NeZero (Module.finrank ℝ E)] [I.Boundaryless] [BoundarylessManifold I M] in
private theorem bourClosedTensorPairing_symm (g : SmoothRiemannianMetric I M) {s : ℕ}
    (A K : Tensor0SField (I := I) (M := M) ∞ s) :
    bourClosedTensorPairing g A K = bourClosedTensorPairing g K A := by
  apply integral_congr_ae
  exact Filter.Eventually.of_forall fun x => inner0S_symm g x (A x) (K x)

omit [NeZero (Module.finrank ℝ E)] [I.Boundaryless] [BoundarylessManifold I M] in
private theorem bourClosedTensorPairing_smul (g : SmoothRiemannianMetric I M) {s : ℕ}
    (A K : Tensor0SField (I := I) (M := M) ∞ s) (c : ℝ) :
    bourClosedTensorPairing g (c • A) K = c * bourClosedTensorPairing g A K := by
  unfold bourClosedTensorPairing
  simp only [ContMDiffSection.coe_smul, Pi.smul_apply,
    DifferentialGeometry.Tensor0SBundle.inner0S_smul_left, integral_const_mul]

omit [NeZero (Module.finrank ℝ E)] [I.Boundaryless] [BoundarylessManifold I M] in
private theorem bourTensorInner_integrable (g : SmoothRiemannianMetric I M) {s : ℕ}
    (A K : Tensor0SField (I := I) (M := M) ∞ s) :
    Integrable (fun x => inner0S g x s (A x) (K x)) (riemannianVolumeMeasure I M g) := by
  let _ := riemannianVolumeMeasure_isFiniteMeasureOnCompacts g
  have h := (tensorInnerScalar_contMDiff g 0 s
    (unitScalarRSLiftCₛ (I := I) A) (unitScalarRSLiftCₛ (I := I) K)).continuous
  apply Continuous.integrable_of_hasCompactSupport _ (HasCompactSupport.of_compactSpace _)
  convert h using 1
  funext x
  rw [tensorInnerScalar, DifferentialGeometry.TensorMetric.tensorInnerPointwise_eq_inner0S,
    unitScalarRSLiftCₛ_apply, unitScalarRSLiftCₛ_apply,
    unitScalarRSLiftSection_apply_unit, unitScalarRSLiftSection_apply_unit]

omit [NeZero (Module.finrank ℝ E)] [I.Boundaryless] [BoundarylessManifold I M] in
private theorem bourClosedTensorPairing_add (g : SmoothRiemannianMetric I M) {s : ℕ}
    (A B K : Tensor0SField (I := I) (M := M) ∞ s) :
    bourClosedTensorPairing g (A + B) K =
      bourClosedTensorPairing g A K + bourClosedTensorPairing g B K := by
  unfold bourClosedTensorPairing
  simp only [ContMDiffSection.coe_add, Pi.add_apply, inner0S_add_left]
  exact integral_add (bourTensorInner_integrable g A K) (bourTensorInner_integrable g B K)

omit [NeZero (Module.finrank ℝ E)] [I.Boundaryless] [BoundarylessManifold I M] in
private theorem bourClosedTensorPairing_sub (g : SmoothRiemannianMetric I M) {s : ℕ}
    (A B K : Tensor0SField (I := I) (M := M) ∞ s) :
    bourClosedTensorPairing g (A - B) K =
      bourClosedTensorPairing g A K - bourClosedTensorPairing g B K := by
  unfold bourClosedTensorPairing
  simp only [ContMDiffSection.coe_sub, Pi.sub_apply, inner0S_sub_left]
  exact integral_sub (bourTensorInner_integrable g A K) (bourTensorInner_integrable g B K)

omit [I.Boundaryless] [BoundarylessManifold I M] in
private theorem bourClosedTensorPairing_permute (g : SmoothRiemannianMetric I M) {s : ℕ}
    (e : Equiv.Perm (Fin s)) (A K : Tensor0SField (I := I) (M := M) ∞ s) :
    bourClosedTensorPairing g (Tensor0SField.domDomCongr ∞ e A) K =
      bourClosedTensorPairing g A (Tensor0SField.domDomCongr ∞ e.symm K) := by
  apply integral_congr_ae
  filter_upwards [] with x
  let basis := (smoothOrtho_isLocal g x).toBasisAt (mem_smoothOrthoFrameNeighborhood_self x)
  have horth : ∀ i j, g.inner x (basis i) (basis j) = if i = j then 1 else 0 := by
    intro i j
    simpa only [basis, IsLocalFrameOn.toBasisAt_coe] using
      smoothOrthoFrame_orthonormal_at_center g x i j
  have h := inner0S_domDomCongr g x basis
    (metricInverseInBasis_identity_of_orthonormal g basis horth)
    e (A x) (Tensor0SField.domDomCongr ∞ e.symm K x)
  rw [← Tensor0SField.domDomCongr_apply, ← Tensor0SField.domDomCongr_apply,
    Tensor0SField.domDomCongr_trans, Equiv.symm_trans_self, Tensor0SField.domDomCongr_refl] at h
  exact h

omit [BoundarylessManifold I M] in
/-- Move the divergence in the lowered connection flux onto its weight.
The contracted slot of the flux is the first covariant slot. -/
theorem bourRicciDivergence_adjoint (g : SmoothRiemannianMetric I M) {s : ℕ}
    (A : Tensor0SField (I := I) (M := M) ∞ s)
    (V : Tensor0SField (I := I) (M := M) ∞ (s + 1)) :
    bourClosedTensorPairing g (covDiv0SField g V) A =
      -bourClosedTensorPairing g (metricNabla0S g A) V := by
  let one : C^∞⟮I, M; ℝ⟯ := ⟨fun _ => 1, contMDiff_const⟩
  have h := integral_weighted_covDiv0SField_eq_neg_metricNabla0S_of_hasCompactSupport
    g s one (HasCompactSupport.of_compactSpace _) A V
  have hOne : ∀ x : M, mvfderiv (I := I) (one : M → ℝ) x = 0 := by
    intro x
    simp [one, mvfderiv, mfderiv_const]
  have hZero (x : M) (Z : Tensor0SSpace (s + 1) I x) :
      inner0S g x (s + 1) 0 Z = 0 := by
    simpa only [zero_smul, zero_mul] using
      (DifferentialGeometry.Tensor0SBundle.inner0S_smul_left g x (s + 1)
        (0 : ℝ) (0 : Tensor0SSpace (s + 1) I x) Z)
  simpa only [bourClosedTensorPairing, hOne, ContinuousLinearMap.zero_smulRight,
    map_zero, TensorRSSpace.zero_apply, hZero, integral_zero, sub_zero,
    show ∀ x : M, one x = 1 from fun _ => rfl, one_mul] using h

omit [BoundarylessManifold I M] in
/-- Both adjoints for the ∇^k∇_k term, before its Ricci coefficient. -/
theorem bourRicciRough_adjoint (g : SmoothRiemannianMetric I M) {s : ℕ}
    (A K : Tensor0SField (I := I) (M := M) ∞ s) :
    bourClosedTensorPairing g (roughLap0SField g K) A =
      bourClosedTensorPairing g (roughLap0SField g A) K := by
  rw [roughLap0SField, roughLap0SField, bourRicciDivergence_adjoint,
    bourRicciDivergence_adjoint, bourClosedTensorPairing_symm g
      (metricNabla0S g A) (metricNabla0S g K)]

omit [BoundarylessManifold I M] in
/-- Move both derivatives in a permuted covariant Hessian contraction.
The second transfer applies the inverse permutation before taking divergence. -/
theorem bourRicciCrossed_adjoint (g : SmoothRiemannianMetric I M) {s : ℕ}
    (e : Equiv.Perm (Fin (s + 1))) (A K : Tensor0SField (I := I) (M := M) ∞ s) :
    bourClosedTensorPairing g
        (covDiv0SField g (Tensor0SField.domDomCongr ∞ e (metricNabla0S g K))) A =
      bourClosedTensorPairing g
        (covDiv0SField g (Tensor0SField.domDomCongr ∞ e.symm (metricNabla0S g A))) K := by
  rw [bourRicciDivergence_adjoint, bourRicciDivergence_adjoint,
    bourClosedTensorPairing_symm g (metricNabla0S g A) _,
    bourClosedTensorPairing_permute]

/-- The ordinary covariant weight multiplying the Ricci speed in the bulk density. -/
def bourRicciWeight (α : ℝ) (g : SmoothRiemannianMetric I M) :
    Tensor0SField (I := I) (M := M) ∞ 2 :=
  metricRicci g + ((α - 4) / 12) •
    tensor0SFieldSmulByFun ∞ (metricScalarAt g) (metricScalar_smooth g) (metricTensorField g)

omit [BoundarylessManifold I M] in
/-- The full coefficient of the rough-Laplacian term in the weighted Ricci variation. -/
theorem bourWeightedRicciRough_adjoint (α : ℝ) (g : SmoothRiemannianMetric I M)
    (K : Tensor0SField (I := I) (M := M) ∞ 2) :
    bourClosedTensorPairing g ((-(1 / 2) : ℝ) • roughLap0SField g K) (bourRicciWeight α g) =
      bourClosedTensorPairing g ((-(1 / 2) : ℝ) • roughLap0SField g (bourRicciWeight α g)) K := by
  rw [bourClosedTensorPairing_smul, bourClosedTensorPairing_smul, bourRicciRough_adjoint]

private def bourKoszulFirstSlots : Equiv.Perm (Fin 3) :=
  (Equiv.swap (0 : Fin 3) 1).trans (Equiv.swap (0 : Fin 3) 2)

/-- Connection variation with the output lowered in the first slot.
Its value on (z,v,w) is g(z, δ∇_v w). -/
def bourKoszulFlux (g : SmoothRiemannianMetric I M)
    (K : Tensor0SField (I := I) (M := M) ∞ 2) : Tensor0SField (I := I) (M := M) ∞ 3 :=
  (1 / 2 : ℝ) • (Tensor0SField.domDomCongr ∞ bourKoszulFirstSlots (metricNabla0S g K) +
    Tensor0SField.domDomCongr ∞ (Equiv.swap (0 : Fin 3) 2) (metricNabla0S g K) -
    metricNabla0S g K)

omit [BoundarylessManifold I M] in
/-- First transfer of the exact lowered connection flux into the physical bulk weight. -/
theorem bourWeightedRicciKoszul_firstAdjoint (α : ℝ) (g : SmoothRiemannianMetric I M)
    (K : Tensor0SField (I := I) (M := M) ∞ 2) :
    bourClosedTensorPairing g (covDiv0SField g (bourKoszulFlux g K)) (bourRicciWeight α g) =
      -bourClosedTensorPairing g (metricNabla0S g (bourRicciWeight α g)) (bourKoszulFlux g K) :=
  bourRicciDivergence_adjoint g _ _

omit [BoundarylessManifold I M] in
/-- Both transfers on the derivative of the connection with its output
index contracted. This is the derivative part of the Ricci variation for
trace-free speeds, where the other trace-of-connection term vanishes. -/
theorem bourWeightedRicciKoszul_secondAdjoint (α : ℝ) (g : SmoothRiemannianMetric I M)
    (K : Tensor0SField (I := I) (M := M) ∞ 2) :
    let A := bourRicciWeight α g
    let B := (1 / 2 : ℝ) • (covDiv0SField g
      (Tensor0SField.domDomCongr ∞ bourKoszulFirstSlots.symm (metricNabla0S g A)) +
      covDiv0SField g
        (Tensor0SField.domDomCongr ∞ (Equiv.swap (0 : Fin 3) 2).symm (metricNabla0S g A)) -
      roughLap0SField g A)
    bourClosedTensorPairing g (covDiv0SField g (bourKoszulFlux g K)) A =
      bourClosedTensorPairing g B K := by
  dsimp only
  have hdiv_add (U V : Tensor0SField (I := I) (M := M) ∞ 3) :
      covDiv0SField g (U + V) = covDiv0SField g U + covDiv0SField g V := by
    simp only [covDiv0SField, metricNabla0S_add, metricTraceFirstTwoField_add]
  have hdiv_smul (c : ℝ) (V : Tensor0SField (I := I) (M := M) ∞ 3) :
      covDiv0SField g (c • V) = c • covDiv0SField g V := by
    simp only [covDiv0SField, metricNabla0S_smul, metricTraceFirstTwoField_smul]
  simp only [bourKoszulFlux, hdiv_smul, covDiv0SField_sub, hdiv_add,
    bourClosedTensorPairing_smul, bourClosedTensorPairing_add, bourClosedTensorPairing_sub]
  rw [bourRicciCrossed_adjoint g bourKoszulFirstSlots (bourRicciWeight α g) K,
    bourRicciCrossed_adjoint g (Equiv.swap (0 : Fin 3) 2) (bourRicciWeight α g) K,
    ← roughLap0SField, bourRicciRough_adjoint]

omit [NeZero (Module.finrank ℝ E)] [I.Boundaryless] [CompactSpace M] in
/-- The Koszul flux evaluated at the native velocity of a regular metric path. -/
theorem bourKoszulFlux_eq_original (g : ℝ → SmoothRiemannianMetric I M)
    {D : RealTimeInterval} (hG : MetricFamilySmoothOn (I := I) D g)
    {t : ℝ} (ht : t ∈ D.regular) (K : Tensor0SField (I := I) (M := M) ∞ 2)
    (hK : ∀ x, K x = deriv (fun s => metricTensorField (g s) x) t)
    (x : M) (v w z : TangentSpace I x) :
    bourKoszulFlux (g t) K x (Fin.cons z (vec2 v w)) =
      (g t).inner x (leviCivitaVariation g t x w v) z := by
  have hderiv (x : M) (v w : TangentSpace I x) :
      HasDerivAt (fun s => (g s).inner x v w) (K x (vec2 v w)) t := by
    have hD := (tensor0SEvalCLM (I := I) (vec2 v w)).hasFDerivAt.comp_hasDerivAt t
      (bourMetric_hasDerivAt_regular g hG ht x)
    change HasDerivAt (fun s => metricTensorField (g s) x (vec2 v w))
      (deriv (fun s => metricTensorField (g s) x) t (vec2 v w)) t at hD
    rw [← hK x] at hD
    simpa [vec2] using hD
  have h := leviCivita_variation_koszul_of_metricFamilySmoothOn hG
    (D.regular_isOpen.mem_nhds ht) K hderiv x v w z
  have hFirst :
      (fun i => (Fin.cons z (vec2 v w) : Fin 3 → TangentSpace I x) (bourKoszulFirstSlots i)) =
        (Fin.cons v (vec2 w z) : Fin 3 → TangentSpace I x) := by
    funext i
    fin_cases i <;> rfl
  have hSecond :
      (fun i => (Fin.cons z (vec2 v w) : Fin 3 → TangentSpace I x)
        ((Equiv.swap (0 : Fin 3) 2) i)) =
        (Fin.cons w (vec2 v z) : Fin 3 → TangentSpace I x) := by
    funext i
    fin_cases i <;> rfl
  change bourKoszulFlux (g t) K x (Fin.cons z (vec2 v w)) = _
  simp only [bourKoszulFlux, ContMDiffSection.coe_smul, ContMDiffSection.coe_add,
    ContMDiffSection.coe_sub, Pi.smul_apply, Pi.add_apply, Pi.sub_apply,
    Tensor0SSpace.smul_apply, Tensor0SSpace.add_apply, Tensor0SSpace.sub_apply,
    Tensor0SField.domDomCongr_apply, Tensor0SSpace.domDomCongr_apply,
    hFirst, hSecond, metricNabla0S_apply, metricCov, smul_eq_mul]
  unfold LeviCivita at h
  linarith

omit [NeZero (Module.finrank ℝ E)] [I.Boundaryless] [T2Space M]
  [CompactSpace M] [BoundarylessManifold I M] in
/-- The native tensor derivative on the actual regular metric family is
a smooth section on the time slice. -/
def bourMetricVelocity (g : ℝ → SmoothRiemannianMetric I M)
    {D : RealTimeInterval} (hG : MetricFamilySmoothOn (I := I) D g)
    {t : ℝ} (ht : t ∈ D.regular) : Tensor0SField (I := I) (M := M) ∞ 2 := by
  let L (x : M) := deriv (fun s => (g s).inner x) t
  let F (x : M) : Tensor0SSpace 2 I x :=
    (((continuousMultilinearCurryFin1 ℝ (TangentSpace I x) ℝ).symm.toContinuousLinearMap).comp
      (L x)).uncurryLeft
  have hSmooth := hG.contMDiffOn_inner_time_deriv.comp
    (f := fun p : M × ℝ => (p.2, p.1))
    (contMDiff_snd.prodMk contMDiff_fst).contMDiffOn
    (fun _ h => ⟨h.2, h.1⟩ : Set.MapsTo _ (Set.univ ×ˢ D.regular) (D.regular ×ˢ Set.univ))
  have hJoint := joint_to02 I (M := M) (fun p => deriv (fun s => (g s).inner p.1) p.2) hSmooth
  refine ⟨F, ?_⟩
  exact contMDiffOn_univ.mp (hJoint.comp (f := fun x => (x, t))
    (contMDiff_id.prodMk contMDiff_const).contMDiffOn (fun _ h => ⟨h, ht⟩))

omit [NeZero (Module.finrank ℝ E)] [I.Boundaryless] [T2Space M]
  [CompactSpace M] [BoundarylessManifold I M] in
@[simp] theorem bourMetricVelocity_eq_deriv (g : ℝ → SmoothRiemannianMetric I M)
    {D : RealTimeInterval} (hG : MetricFamilySmoothOn (I := I) D g)
    {t : ℝ} (ht : t ∈ D.regular) (x : M) :
    bourMetricVelocity g hG ht x = deriv (fun s => metricTensorField (g s) x) t := by
  apply tensor0SSpace_ext
  intro v
  have hv := (tensor0SEvalCLM (I := I) v).hasFDerivAt.comp_hasDerivAt t
    (bourMetric_hasDerivAt_regular g hG ht x)
  change HasDerivAt (fun s => metricTensorField (g s) x v)
    (deriv (fun s => metricTensorField (g s) x) t v) t at hv
  have h := hG.hasDerivAt_inner ht x (v 0) (v 1)
  have hderiv := (by simpa only [metricTensorField_apply] using hv :
    HasDerivAt (fun s => (g s).inner x (v 0) (v 1))
      (deriv (fun s => metricTensorField (g s) x) t v) t)
  exact h.deriv.symm.trans hderiv.deriv

omit [NeZero (Module.finrank ℝ E)] [I.Boundaryless] [CompactSpace M] in
/-- The spatial flux of the genuine Levi–Civita derivative on a regular slice. -/
theorem bourKoszulFlux_native (g : ℝ → SmoothRiemannianMetric I M)
    {D : RealTimeInterval} (hG : MetricFamilySmoothOn (I := I) D g)
    {t : ℝ} (ht : t ∈ D.regular) (x : M) (v w z : TangentSpace I x) :
    bourKoszulFlux (g t) (bourMetricVelocity g hG ht) x (Fin.cons z (vec2 v w)) =
      (g t).inner x (leviCivitaVariation g t x w v) z :=
  bourKoszulFlux_eq_original g hG ht _ (bourMetricVelocity_eq_deriv g hG ht) x v w z

omit [NeZero (Module.finrank ℝ E)] [I.Boundaryless] [BoundarylessManifold I M] in
/-- The smooth-section pairing equals the original slab pairing on the native speed. -/
theorem bourClosedTensorPairing_native (g : ℝ → SmoothRiemannianMetric I M)
    {D : RealTimeInterval} (hG : MetricFamilySmoothOn (I := I) D g)
    {t : ℝ} (ht : t ∈ D.regular) (A : Tensor0SField (I := I) (M := M) ∞ 2) :
    bourClosedTensorPairing (g t) A (bourMetricVelocity g hG ht) =
      ∫ x, inner0S (g t) x 2 (A x) (deriv (fun s => metricTensorField (g s) x) t)
        ∂riemannianVolumeMeasure I M (g t) := by
  simp only [bourClosedTensorPairing, bourMetricVelocity_eq_deriv]

end
end SmoothPoincare.Bour
