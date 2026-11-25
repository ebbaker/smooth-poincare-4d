import FirstOrderTwistor.SpinTwistedSquare
import Mathlib.Analysis.InnerProductSpace.Calculus

/-! # The combined Green current in a normal spin frame
Prepared for Edward B. Baker III, 25 November 2026, with OpenAI Codex.
The covector components are measured in the same orthonormal frame throughout.
-/

namespace FirstOrderTwistor

open scoped Quaternion RealInnerProductSpace
noncomputable section

private theorem spinBackClifford_adjoint (i : Fin 4) (u v : ℍ[ℝ]) :
    ⟪negativeCliffordVector i * u, v⟫ = -⟪u, positiveCliffordVector i * v⟫ := by
  fin_cases i <;> simp [negativeCliffordVector, positiveCliffordVector, spinUnit,
    Quaternion.inner_def] <;> ring

/-- Cross terms in the derivative of the Green current contribute the connection norm
and minus the Dirac norm. -/
theorem spinGreenCurrent_cross (B : Fin 4 → Fin 4 → ℍ[ℝ]) :
    (∑ i, ∑ k, ⟪B i k + negativeCliffordVector i * frameTwistedDiracDerivative B k, B i k⟫) =
      (∑ i, ∑ k, Quaternion.normSq (B i k)) -
      ∑ k, Quaternion.normSq (frameTwistedDiracDerivative B k) := by
  simp only [inner_add_left, spinBackClifford_adjoint, ← sub_eq_add_neg, Finset.sum_sub_distrib,
    real_inner_self_eq_norm_sq, Quaternion.normSq_eq_norm_mul_self, ← sq]
  congr 1
  rw [Finset.sum_comm]
  apply Finset.sum_congr rfl
  intro k _
  rw [← inner_sum]
  exact real_inner_self_eq_norm_sq _

/-- Derivative of the scalar Green current paired with a covector-spinor, with the
two factors differentiated in the same real frame. -/
theorem spinGreenCurrent_component_partial {T : Fin 4 → EuclideanFour → ℍ[ℝ]}
    {v : Fin 4 → EuclideanFour → ℍ[ℝ]} {x : EuclideanFour}
    (hT : ∀ k, DifferentiableAt ℝ (T k) x) (hv : ∀ k, DifferentiableAt ℝ (v k) x) (i : Fin 4) :
    euclideanPartial (fun y => ∑ k, ⟪T k y, v k y⟫) i x =
      ∑ k, (⟪spinCoordinatePartial (T k) i x, v k x⟫ + ⟪T k x, spinCoordinatePartial (v k) i x⟫) := by
  unfold euclideanPartial spinCoordinatePartial
  rw [fderiv_fun_sum (u := Finset.univ) (fun k _ => (hT k).inner ℝ (hv k))]
  simp only [sum_apply]
  apply Finset.sum_congr rfl
  intro k _
  rw [((hT k).hasFDerivAt.inner ℝ (hv k).hasFDerivAt).fderiv]
  simp [fderivInnerCLM_apply, real_inner_comm, add_comm]

/-- On taking the trace, the derivative of the first current factor contributes
the curvature pairing. Its trace follows from the covector-twisted square. -/
theorem spinGreenCurrent_trace {R : CurvatureFrameTensor}
    (v : Fin 4 → ℍ[ℝ]) (B dT : Fin 4 → Fin 4 → ℍ[ℝ])
    (hTrace : ∀ k, ∑ i, dT i k = frameTwistedCurvaturePotential R v k) :
    (∑ i, ∑ k, (⟪dT i k, v k⟫ +
       ⟪B i k + negativeCliffordVector i * frameTwistedDiracDerivative B k, B i k⟫)) =
      (∑ k, ⟪frameTwistedCurvaturePotential R v k, v k⟫) +
      (∑ i, ∑ k, Quaternion.normSq (B i k)) -
        ∑ k, Quaternion.normSq (frameTwistedDiracDerivative B k) := by
  simp only [Finset.sum_add_distrib, spinGreenCurrent_cross]
  rw [Finset.sum_comm (f := fun i k => ⟪dT i k, v k⟫)]
  simp only [← sum_inner, hTrace]
  ring

/-- The zero-order contribution to the current derivative is calculated from the
antisymmetric tensor Hessian, including its cotangent curvature. -/
theorem spinGreenCurrent_trace_of_commutator {R : CurvatureFrameTensor}
    (v : Fin 4 → ℍ[ℝ]) (B : Fin 4 → Fin 4 → ℍ[ℝ])
    (H : Fin 4 → Fin 4 → Fin 4 → ℍ[ℝ])
    (hH : ∀ i j k, H i j k - H j i k = frameTwistedCurvatureAction R v i j k) :
    let dT (i k : Fin 4) := H i i k + ∑ j, negativeCliffordVector i *
      (positiveCliffordVector j * H i j k)
    (∑ i, ∑ k, (⟪dT i k, v k⟫ +
      ⟪B i k + negativeCliffordVector i * frameTwistedDiracDerivative B k, B i k⟫)) =
      (∑ k, ⟪frameTwistedCurvaturePotential R v k, v k⟫) +
      (∑ i, ∑ k, Quaternion.normSq (B i k)) -
        ∑ k, Quaternion.normSq (frameTwistedDiracDerivative B k) := by
  intro dT
  apply spinGreenCurrent_trace
  intro k
  change (∑ i, (H i i k + ∑ j, negativeCliffordVector i * (positiveCliffordVector j * H i j k))) = _
  rw [Finset.sum_add_distrib, frameTwistedSquare_split (fun i j => H i j k)]
  simp only [hH, frameTwistedCurvaturePotential]
  abel

end
end FirstOrderTwistor
