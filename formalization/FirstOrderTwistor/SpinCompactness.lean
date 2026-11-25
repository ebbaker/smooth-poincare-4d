import Mathlib.Analysis.InnerProductSpace.Dual
import Mathlib.Analysis.LocallyConvex.WeakSpace
import Mathlib.Analysis.Normed.Module.DoubleDual
import Mathlib.Analysis.Normed.Operator.Compact.Basic
import SectionsAndConnections.ThreeAxisWeyl

/-!
# Attainment in a supplied fixed spin gauge

The domain models the reference Sobolev space. The compact embedding models
its inclusion into reference `L²`. Transport of the varying metrics, spin
bundles, operators, and norms supplies the convergence hypotheses.
-/

namespace FirstOrderTwistor

open Filter Set Topology

variable {E L F : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [CompleteSpace E]
  [NormedAddCommGroup L] [NormedSpace ℝ L] [NormedAddCommGroup F] [NormedSpace ℝ F]

private theorem hilbertWeakDoubleDualSurjective :
    Function.Surjective (NormedSpace.inclusionInDoubleDualWeak ℝ E) := by
  intro functional
  let riesz : E ≃L[ℝ] StrongDual ℝ E := (InnerProductSpace.toDual ℝ E).toContinuousLinearEquiv
  let pulledBack : StrongDual ℝ E :=
    (WeakDual.toStrongDual functional).comp riesz.toContinuousLinearMap
  let point := riesz.symm pulledBack
  refine ⟨toWeakSpace ℝ E point, ?_⟩
  apply ContinuousLinearMap.ext
  intro test
  let z := (InnerProductSpace.toDual ℝ E).symm test
  change test point = functional test
  calc
    test point = inner ℝ z point := InnerProductSpace.toDual_symm_apply.symm
    _ = inner ℝ point z := real_inner_comm _ _
    _ = pulledBack z := InnerProductSpace.toDual_symm_apply
    _ = functional test := by
      change functional (riesz z) = functional test
      simp [z, riesz]

private theorem hilbertWeakCompactClosure (bound : ℝ) :
    IsCompact (closure (toWeakSpace ℝ E '' Metric.closedBall (0 : E) bound)) := by
  apply NormedSpace.isCompact_closure_of_isBounded ℝ E
  · rw [preimage_image_eq _ (toWeakSpace ℝ E).injective]
    exact Metric.isBounded_closedBall
  · rw [Set.range_eq_univ.mpr (hilbertWeakDoubleDualSurjective (E := E))]
    exact subset_univ _

omit [CompleteSpace E] in
private theorem clm_eq_of_weakCluster_of_tendsto (A : E →L[ℝ] F)
    {v : ℕ → E} {u : WeakSpace ℝ E} {y : F}
    (hWeak : MapClusterPt u atTop (fun n => toWeakSpace ℝ E (v n)))
    (hStrong : Tendsto (fun n => A (v n)) atTop (𝓝 y)) :
    A ((toWeakSpace ℝ E).symm u) = y := by
  have hWeakImage := hWeak.tendsto_comp (WeakSpace.map A).continuous.continuousAt
  have hStrongInWeak := (toWeakSpaceCLM ℝ F).continuous.continuousAt.tendsto.comp hStrong
  exact (toWeakSpace ℝ F).injective <|
    eq_of_nhds_neBot (hWeakImage.clusterPt.mono hStrongInWeak)

/-- A bounded sequence with asymptotic unit `L²` norm and vanishing varying
operator defect has a reference kernel element with unit `L²` norm. A
subsequence converges strongly to that element in the `L²` embedding. -/
theorem existsUnitKernelOfCompactEmbedding
    (embed : E →L[ℝ] L) (hEmbed : IsCompactOperator embed)
    (P : E →L[ℝ] F) (varying : ℕ → E →L[ℝ] F) (ψ : ℕ → E) {bound : ℝ}
    (hDomainBound : ∀ n, ‖ψ n‖ ≤ bound)
    (hOperators : Tendsto varying atTop (𝓝 P))
    (hDefect : Tendsto (fun n => varying n (ψ n)) atTop (𝓝 0))
    (hMass : Tendsto (fun n => ‖embed (ψ n)‖) atTop (𝓝 1)) :
    ∃ u : E, P u = 0 ∧ ‖embed u‖ = 1 ∧
      ∃ subseq : ℕ → ℕ, StrictMono subseq ∧
        Tendsto (fun n => embed (ψ (subseq n))) atTop (𝓝 (embed u)) := by
  have hDifference : Tendsto (fun n => (varying n - P) (ψ n)) atTop (𝓝 0) := by
    apply tendsto_zero_iff_norm_tendsto_zero.mpr
    have hConst : Tendsto (fun _ : ℕ => P) atTop (𝓝 P) := tendsto_const_nhds
    have hOpNorm : Tendsto (fun n => ‖varying n - P‖ * bound) atTop (𝓝 0) := by
      simpa using (hOperators.sub hConst).norm.mul_const bound
    exact squeeze_zero (fun _ => norm_nonneg _) (fun n =>
      ((varying n - P).le_opNorm (ψ n)).trans
        (mul_le_mul_of_nonneg_left (hDomainBound n) (norm_nonneg _))) hOpNorm
  have hReference : Tendsto (fun n => P (ψ n)) atTop (𝓝 0) := by
    simpa using hDefect.sub hDifference
  obtain ⟨compact, hCompact, hImage⟩ := hEmbed.image_closedBall_subset_compact bound
  have hMem n : ψ n ∈ Metric.closedBall (0 : E) bound := by
    simpa only [Metric.mem_closedBall, dist_zero_right] using hDomainBound n
  obtain ⟨limit, _, subseq, hSubseq, hStrong⟩ :=
    hCompact.tendsto_subseq (fun n => hImage ⟨ψ n, hMem n, rfl⟩)
  obtain ⟨weakLimit, _, hWeak⟩ := (hilbertWeakCompactClosure (E := E) bound).exists_mapClusterPt
    (f := atTop) (u := fun n : ℕ => toWeakSpace ℝ E (ψ (subseq n)))
    (tendsto_principal.mpr <| Eventually.of_forall fun n => subset_closure
      ⟨ψ (subseq n), hMem (subseq n), rfl⟩)
  let u := (toWeakSpace ℝ E).symm weakLimit
  have hLimit : embed u = limit := clm_eq_of_weakCluster_of_tendsto embed hWeak hStrong
  have hKernel : P u = 0 :=
    clm_eq_of_weakCluster_of_tendsto P hWeak (hReference.comp hSubseq.tendsto_atTop)
  have hUnit : ‖limit‖ = 1 :=
    tendsto_nhds_unique hStrong.norm (hMass.comp hSubseq.tendsto_atTop)
  exact ⟨u, hKernel, hLimit ▸ hUnit, subseq, hSubseq, hLimit.symm ▸ hStrong⟩

/-- For a bounded domain sequence, strong convergence under an injective
embedding to the image of a domain point also gives weak convergence in the
domain. This applies to the subsequence in `existsUnitKernelOfCompactEmbedding`. -/
theorem tendstoWeakOfTendstoEmbedding
    (embed : E →L[ℝ] L) (hInjective : Function.Injective embed)
    {v : ℕ → E} {u : E} {bound : ℝ} (hDomainBound : ∀ n, ‖v n‖ ≤ bound)
    (hStrong : Tendsto (fun n => embed (v n)) atTop (𝓝 (embed u))) :
    Tendsto (fun n => toWeakSpace ℝ E (v n)) atTop (𝓝 (toWeakSpace ℝ E u)) := by
  apply (hilbertWeakCompactClosure (E := E) bound).tendsto_nhds_of_unique_mapClusterPt
  · apply Eventually.of_forall
    intro n
    apply subset_closure
    have hMem : v n ∈ Metric.closedBall (0 : E) bound := by
      simpa only [Metric.mem_closedBall, dist_zero_right] using hDomainBound n
    exact ⟨v n, hMem, rfl⟩
  · intro weakPoint _ hWeak
    apply (toWeakSpace ℝ E).symm.injective
    simpa only [LinearEquiv.symm_apply_apply] using
      hInjective (clm_eq_of_weakCluster_of_tendsto embed hWeak hStrong)

/-- In a continuous local Weyl block, an exact spinor with dense nonzero locus
forces every coefficient to vanish, including at the spinor zeros. -/
theorem weylBlock_eq_zero_of_dense_spinor {X : Type*} [TopologicalSpace X]
    {W : X → Matrix (Fin 3) (Fin 3) ℝ} {spinorNormSq projectedNormSq : X → ℝ}
    (hContinuous : Continuous W) (hDense : Dense {x | spinorNormSq x ≠ 0})
    (hIdentity : ∀ x, 2 * projectedNormSq x =
      SectionsAndConnections.hilbertSchmidtSq (W x) * spinorNormSq x)
    (hProjected : ∀ x, projectedNormSq x = 0) :
    ∀ x, W x = 0 := by
  have hOn : EqOn W (fun _ => 0) {x | spinorNormSq x ≠ 0} := by
    intro x hx
    have hProduct := hIdentity x
    rw [hProjected x, mul_zero] at hProduct
    have hSq : ∑ i, ∑ j, W x i j ^ 2 = 0 :=
      (mul_eq_zero.mp hProduct.symm).resolve_right hx
    have hRows := (Finset.sum_eq_zero_iff_of_nonneg
      (fun i _ => Finset.sum_nonneg (fun j _ => sq_nonneg (W x i j)))).mp hSq
    ext i j
    have hEntry := (Finset.sum_eq_zero_iff_of_nonneg
      (fun k _ => sq_nonneg (W x i k))).mp (hRows i (Finset.mem_univ _)) j (Finset.mem_univ _)
    simpa using hEntry
  exact fun x => hOn.closure hContinuous continuous_const (hDense x)

end FirstOrderTwistor
