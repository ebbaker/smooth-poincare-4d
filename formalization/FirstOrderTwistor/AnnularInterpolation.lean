import FirstOrderTwistor.FluxDerivative
import FirstOrderTwistor.InterpolationHolder

open Filter MeasureTheory Topology
open scoped BigOperators

namespace FirstOrderTwistor

private theorem coordinateNorm_continuousAt {ι : Type*} [Fintype ι]
    {f : ι → EuclideanFour → ℝ} {x : EuclideanFour} (hf : ∀ i, ContinuousAt (f i) x) :
    ContinuousAt (fun y => coordinateNorm (fun i => f i y)) x := by
  apply ContinuousAt.sqrt
  exact tendsto_finsetSum Finset.univ fun i _ => (hf i).pow 2

private theorem tsupport_subset_of_vanish {f η : EuclideanFour → ℝ}
    (hf : ∀ x ∉ tsupport η, f x = 0) : tsupport f ⊆ tsupport η := by
  apply closure_minimal _ (isClosed_tsupport η)
  intro x hx
  by_contra h
  exact (Function.mem_support.mp hx) (hf x h)

private theorem continuous_compact_of_tsupport_subset {f η : EuclideanFour → ℝ}
    (hcompact : HasCompactSupport η) (hsubset : tsupport f ⊆ tsupport η)
    (hcont : ∀ x ∈ tsupport η, ContinuousAt f x) : Continuous f ∧ HasCompactSupport f := by
  refine ⟨continuous_iff_continuousAt.2 (fun x => ?_),
    hcompact.of_isClosed_subset (isClosed_tsupport f) hsubset⟩
  by_cases hx : x ∈ tsupport η
  · exact hcont x hx
  · exact (HasFDerivAt.of_notMem_tsupport ℝ (fun h => hx (hsubset h))).continuousAt

/-- Buffered Euclidean interpolation with the scalar cutoff of SEC
`msneck:interpolation`. The cutoff constant can be taken to be just
`‖Dη‖₄`. The field needs `C²` regularity only on the cutoff support. -/
theorem bufferedInterpolation {ι : Type*} [Fintype ι]
    (η : EuclideanFour → ℝ) (u : ι → EuclideanFour → ℝ) (U : ℝ)
    (hη : ContDiff ℝ 1 η) (hcompact : HasCompactSupport η) (hηNonneg : ∀ x, 0 ≤ η x)
    (hu : ∀ j x, x ∈ tsupport η → ContDiffAt ℝ 2 (u j) x)
    (hU : 0 ≤ U) (hUbound : ∀ x ∈ tsupport η, coordinateNorm (fun j => u j x) ≤ U) :
    let dη := fun x => coordinateNorm (fun a => euclideanPartial η a x)
    let du := fun x => coordinateNorm (fun p : ι × Fin 4 => euclideanPartial (u p.1) p.2 x)
    let d2u := fun x => coordinateNorm (euclideanHessian u x)
    let c := interpolationL4 volume dη
    let Y := interpolationL4 volume (fun x => η x * du x)
    let X := interpolationL2 volume (fun x => η x ^ 2 * d2u x)
    Y ^ 4 ≤ U * (4 * c * Y ^ 3 + 4 * Y ^ 2 * X) ∧
      Y ≤ 4 * c * U + 2 * Real.sqrt (U * X) ∧ Y ^ 2 ≤ 32 * c ^ 2 * U ^ 2 + 8 * U * X := by
  let dη := fun x => coordinateNorm (fun a => euclideanPartial η a x)
  let du := fun x => coordinateNorm (fun p : ι × Fin 4 => euclideanPartial (u p.1) p.2 x)
  let d2u := fun x => coordinateNorm (euclideanHessian u x)
  let flux := fun x => -∑ p : ι × Fin 4, u p.1 x * euclideanPartial (bufferedFlux η u p) p.2 x
  have hpartial (p : ι × Fin 4) (x : EuclideanFour) (hx : x ∈ tsupport η) :
      ContDiffAt ℝ 1 (euclideanPartial (u p.1) p.2) x :=
    ((hu p.1 x hx).fderiv_right (by norm_num)).clm_apply contDiffAt_const
  have hcutPart (x : EuclideanFour) : ContinuousAt dη x := by
    apply coordinateNorm_continuousAt
    intro a
    exact (hη.contDiffAt.continuousAt_fderiv one_ne_zero).clm_apply continuousAt_const
  have hgrad (x : EuclideanFour) (hx : x ∈ tsupport η) : ContinuousAt du x :=
    coordinateNorm_continuousAt fun p => (hpartial p x hx).continuousAt
  have hhessian (x : EuclideanFour) (hx : x ∈ tsupport η) : ContinuousAt d2u x := by
    apply coordinateNorm_continuousAt
    intro q
    exact ((hpartial q.1 x hx).continuousAt_fderiv one_ne_zero).clm_apply continuousAt_const
  have hflux (p : ι × Fin 4) (x : EuclideanFour) (hx : x ∈ tsupport η) :
      ContDiffAt ℝ 1 (bufferedFlux η u p) x :=
    (hη.contDiffAt.pow 4).mul
      ((ContDiffAt.sum fun q _ => (hpartial q x hx).pow 2).mul (hpartial p x hx))
  have hfluxSupport (p : ι × Fin 4) : tsupport (bufferedFlux η u p) ⊆ tsupport η :=
    tsupport_subset_of_vanish fun x hx => by
      simp [bufferedFlux, image_eq_zero_of_notMem_tsupport hx]
  have hfluxOutside (x : EuclideanFour) (hx : x ∉ tsupport η) : flux x = 0 := by
    have hz (p : ι × Fin 4) : ¬ x ∈ tsupport (bufferedFlux η u p) := fun hp => hx (hfluxSupport p hp)
    simp [flux, euclideanPartial, fderiv_of_notMem_tsupport ℝ (hz _)]
  obtain ⟨hCutContinuous, hCutCompact⟩ := continuous_compact_of_tsupport_subset hcompact
    (tsupport_subset_of_vanish (f := dη) fun x hx => by
      simp [dη, coordinateNorm, euclideanPartial, fderiv_of_notMem_tsupport ℝ hx])
    (fun x _ => hcutPart x)
  obtain ⟨hGradContinuous, hGradCompact⟩ := continuous_compact_of_tsupport_subset hcompact
    (tsupport_subset_of_vanish (f := fun x => η x * du x) fun x hx => by
      simp [image_eq_zero_of_notMem_tsupport hx])
    (fun x hx => hη.continuous.continuousAt.mul (hgrad x hx))
  obtain ⟨hHessContinuous, hHessCompact⟩ := continuous_compact_of_tsupport_subset hcompact
    (tsupport_subset_of_vanish (f := fun x => η x ^ 2 * d2u x) fun x hx => by
      simp [image_eq_zero_of_notMem_tsupport hx])
    (fun x hx => (hη.continuous.continuousAt.pow 2).mul (hhessian x hx))
  obtain ⟨hFluxContinuous, hFluxCompact⟩ := continuous_compact_of_tsupport_subset hcompact
    (tsupport_subset_of_vanish hfluxOutside) (fun x hx => by
      apply ContinuousAt.neg
      apply tendsto_finsetSum Finset.univ
      intro p _
      exact (hu p.1 x hx).continuousAt.mul
        ((hflux p x hx).continuousAt_fderiv one_ne_zero |>.clm_apply continuousAt_const))
  have hIBP : (∫ x, (η x * du x) ^ 4) = ∫ x, flux x := by
    calc
      _ = ∫ x, η x ^ 4 * (euclideanGradientSq u x) ^ 2 := by
        refine integral_congr_ae (Eventually.of_forall fun x => ?_)
        have hgradSq : (du x) ^ 2 = euclideanGradientSq u x :=
          Real.sq_sqrt (Finset.sum_nonneg fun _ _ => sq_nonneg _)
        change (η x * du x) ^ 4 = η x ^ 4 * (euclideanGradientSq u x) ^ 2
        rw [mul_pow, show (du x) ^ 4 = ((du x) ^ 2) ^ 2 by ring, hgradSq]
      _ = -∫ x, ∑ p : ι × Fin 4, u p.1 x * euclideanPartial (bufferedFlux η u p) p.2 x :=
        bufferedInterpolation_integrationByParts η u hη hcompact hu
      _ = _ := (integral_neg _).symm
  have hFluxBound (x : EuclideanFour) :
      flux x ≤ U * (4 * (dη x * (η x * du x) ^ 3) + 4 * ((η x * du x) ^ 2 * (η x ^ 2 * d2u x))) := by
    by_cases hx : x ∈ tsupport η
    · have hdη : 0 ≤ dη x := Real.sqrt_nonneg _
      have hdu : 0 ≤ du x := Real.sqrt_nonneg _
      have hd2u : 0 ≤ d2u x := Real.sqrt_nonneg _
      have hηx := hηNonneg x
      calc
        flux x ≤ |∑ p : ι × Fin 4, u p.1 x * euclideanPartial (bufferedFlux η u p) p.2 x| := neg_le_abs _
        _ ≤ coordinateNorm (fun j => u j x) *
            (4 * η x ^ 3 * dη x * du x ^ 3 + 4 * η x ^ 4 * du x ^ 2 * d2u x) :=
          abs_bufferedFlux_contraction_le (hη.contDiffAt.differentiableAt one_ne_zero) hηx
            (fun j => hu j x hx)
        _ ≤ U * (4 * η x ^ 3 * dη x * du x ^ 3 + 4 * η x ^ 4 * du x ^ 2 * d2u x) :=
          mul_le_mul_of_nonneg_right (hUbound x hx) (by positivity)
        _ = _ := by ring
    · rw [hfluxOutside x hx]
      simp [image_eq_zero_of_notMem_tsupport hx]
  exact bufferedInterpolation_of_fluxBound volume η dη du d2u flux U (interpolationL4 volume dη) hU
    (Eventually.of_forall fun x => ⟨hηNonneg x, Real.sqrt_nonneg _, Real.sqrt_nonneg _, Real.sqrt_nonneg _⟩)
    (hGradContinuous.memLp_of_hasCompactSupport hGradCompact)
    (hCutContinuous.memLp_of_hasCompactSupport hCutCompact)
    (hHessContinuous.memLp_of_hasCompactSupport hHessCompact) le_rfl
    (hFluxContinuous.integrable_of_hasCompactSupport hFluxCompact) hIBP (Eventually.of_forall hFluxBound)

end FirstOrderTwistor
