import SmoothPoincare.Immersions.InducedBlock

/-! # Codazzi jets at middle-signature saturation -/

open DifferentialGeometry FirstOrderTwistor
open scoped ContDiff Manifold

namespace SmoothPoincare

/-- The signs of the principal curvatures in an ordered adapted frame
on the rank `(2,2)` saturation locus. -/
noncomputable def saturatedPrincipalSign : Fin 4 → ℝ := ![-1, -1, 1, 1]

private theorem saturatedPrincipalSign_partner (i : Fin 4) :
    ∃ j : Fin 4, i ≠ j ∧ saturatedPrincipalSign i = saturatedPrincipalSign j := by
  fin_cases i
  · exact ⟨1, by decide, rfl⟩
  · exact ⟨0, by decide, rfl⟩
  · exact ⟨3, by decide, rfl⟩
  · exact ⟨2, by decide, rfl⟩

private theorem saturatedPrincipalSign_ne_zero (i : Fin 4) : saturatedPrincipalSign i ≠ 0 := by
  fin_cases i <;> norm_num [saturatedPrincipalSign]

private theorem saturatedPrincipalSign_range (i : Fin 4) :
    saturatedPrincipalSign i = -1 ∨ saturatedPrincipalSign i = 1 := by
  fin_cases i <;> norm_num [saturatedPrincipalSign]

private theorem saturatedPrincipalSign_pair (i j k : Fin 4) :
    saturatedPrincipalSign j = saturatedPrincipalSign k ∨
      saturatedPrincipalSign i = saturatedPrincipalSign k ∨
      saturatedPrincipalSign i = saturatedPrincipalSign j := by
  rcases saturatedPrincipalSign_range i with hi | hi <;>
    rcases saturatedPrincipalSign_range j with hj | hj <;>
    rcases saturatedPrincipalSign_range k with hk | hk <;>
    simp [hi, hj, hk]

/-- In a supplied adapted orthonormal frame, let `T i j k` be
`⟨(∇_{eᵢ} A)eⱼ, eₖ⟩`, and let `da i` be the derivative of the
common positive magnitude. Codazzi symmetry, self-adjointness, and
the differentiated diagonal equations imply that both jets vanish. -/
theorem saturatedCodazziJets_zero (T : Fin 4 → Fin 4 → Fin 4 → ℝ) (da : Fin 4 → ℝ)
    (hCodazzi : ∀ i j k, T i j k = T j i k)
    (hSelfAdjoint : ∀ i j k, T i j k = T i k j)
    (hProjection : ∀ i j k, saturatedPrincipalSign j = saturatedPrincipalSign k →
      T i j k = if j = k then saturatedPrincipalSign j * da i else 0) :
    (∀ i, da i = 0) ∧ (∀ i j k, T i j k = 0) := by
  have hDerivative (i : Fin 4) : da i = 0 := by
    obtain ⟨j, hij, hsign⟩ := saturatedPrincipalSign_partner i
    have hDiagonal : T i j j = saturatedPrincipalSign j * da i := by
      simpa using hProjection i j j rfl
    have hOffDiagonal : T j i j = 0 := by
      simpa [hij] using hProjection j i j hsign
    have hProduct : saturatedPrincipalSign j * da i = 0 :=
      hDiagonal.symm.trans ((hCodazzi i j j).trans hOffDiagonal)
    exact (mul_eq_zero.mp hProduct).resolve_left (saturatedPrincipalSign_ne_zero j)
  refine ⟨hDerivative, ?_⟩
  have hSameSign (i j k : Fin 4) (hSign : saturatedPrincipalSign j = saturatedPrincipalSign k) :
      T i j k = 0 := by
    rw [hProjection i j k hSign, hDerivative i, mul_zero, ite_self]
  intro i j k
  rcases saturatedPrincipalSign_pair i j k with h | h | h
  · exact hSameSign i j k h
  · rw [hCodazzi i j k]
    exact hSameSign j i k h
  · rw [hSelfAdjoint i j k, hCodazzi i k j]
    exact hSameSign k i j h

private theorem saturatedMixedSectional_zero_of_commutation (R : CurvatureFrameTensor)
    {a : ℝ} (ha : 0 < a)
    (hCommutation : ∀ i j u v, R i j u v * (saturatedPrincipalSign v * a) =
      (saturatedPrincipalSign u * a) * R i j u v) :
    R 0 2 0 2 = 0 := by
  have h := hCommutation 0 2 0 2
  norm_num [saturatedPrincipalSign] at h
  have hProduct : (2 * a) * R 0 2 0 2 = 0 := by nlinarith only [h]
  exact (mul_eq_zero.mp hProduct).resolve_left (mul_pos (by norm_num) ha).ne'

section Immersion

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  {g : SmoothRiemannianMetric I M} {F : IsometricHypersurface g}
  {o : ManifoldOrientation I M 4} {p : M}

/-- At a supplied saturated principal frame of the actual immersion,
curvature cannot commute with the shape operator. The frame slots
`R i j u v` mean `g(R(eᵢ,eⱼ)eᵥ,eᵤ)`. The commutation identity,
which follows when the shape is parallel on an open neighborhood,
is supplied here. -/
theorem saturatedPrincipalFrame_noCurvatureCommutation (P : PrincipalFrameAt F o p)
    {a : ℝ} (ha : 0 < a) (hSpectrum : P.curvature = ![-a, -a, a, a])
    (hCommutation : ∀ i j u v,
      let R := metricCurvatureFrameTensor g o p P.frame
      R i j u v * (saturatedPrincipalSign v * a) =
        (saturatedPrincipalSign u * a) * R i j u v) : False := by
  let R := metricCurvatureFrameTensor g o p P.frame
  have hZero := saturatedMixedSectional_zero_of_commutation R ha hCommutation
  have hGauss : R 0 2 0 2 = -a ^ 2 := by
    dsimp only [R]
    rw [metricCurvatureFrameTensor_eq_principalGauss P, hSpectrum]
    norm_num [principalGaussTensor, pow_two]
  exact (neg_ne_zero.mpr (pow_pos ha 2).ne') (hGauss.symm.trans hZero)

end Immersion
end SmoothPoincare
