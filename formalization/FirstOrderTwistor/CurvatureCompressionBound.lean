import FirstOrderTwistor.FrameEnergy
import FirstOrderTwistor.GeometricChiralBlock

/-!
# A four-slot bound for the trace-free self-dual compression

For an arbitrary real array, each compressed entry uses four coordinates with
weights of magnitude one half. The coordinate sets for distinct entries are
disjoint. Removing the trace decreases the squared Hilbert–Schmidt norm.
-/

open SectionsAndConnections

namespace FirstOrderTwistor

private def orderedWedge : Fin 3 × Bool ↪ Fin 4 × Fin 4 where
  toFun p := if p.2 then selfDualSecondWedge p.1 else selfDualFirstWedge p.1
  inj' := by decide

private theorem sum_orderedWedges_le (f : Fin 4 × Fin 4 → ℝ) (hf : ∀ p, 0 ≤ f p) :
    (∑ i, ∑ b, f (orderedWedge (i, b))) ≤ ∑ a, ∑ b, f (a, b) := by
  calc
    _ = ∑ p : Fin 3 × Bool, f (orderedWedge p) := (Fintype.sum_prod_type _).symm
    _ = ∑ p ∈ Finset.univ.map orderedWedge, f p := (Finset.sum_map _ _ _).symm
    _ ≤ ∑ p : Fin 4 × Fin 4, f p :=
      Finset.sum_le_sum_of_subset_of_nonneg (Finset.subset_univ _) fun p _ _ ↦ hf p
    _ = _ := Fintype.sum_prod_type _

private theorem normalized_four_sum_sq_le (a b c d : ℝ) :
    ((a + b + c + d) / 2) ^ 2 ≤ a ^ 2 + b ^ 2 + c ^ 2 + d ^ 2 := by
  nlinarith only [sq_nonneg (a - b), sq_nonneg (a - c), sq_nonneg (a - d),
    sq_nonneg (b - c), sq_nonneg (b - d), sq_nonneg (c - d)]

private theorem hilbertSchmidtSq_selfDualCurvatureBlock_le (R : CurvatureFrameTensor) :
    hilbertSchmidtSq (selfDualCurvatureBlock R) ≤ frameTensorNormSq R := by
  let r (p q : Fin 4 × Fin 4) := R p.1 p.2 q.1 q.2
  unfold hilbertSchmidtSq frameTensorNormSq
  calc
    _ ≤ ∑ i, ∑ j, ∑ b : Bool, ∑ c : Bool, r (orderedWedge (i, b)) (orderedWedge (j, c)) ^ 2 := by
      refine Finset.sum_le_sum fun i _ ↦ Finset.sum_le_sum fun j _ ↦ ?_
      simp only [selfDualCurvatureBlock, Fintype.sum_bool, orderedWedge, Function.Embedding.coeFn_mk,
        r, ite_true, Bool.false_eq_true, ite_false]
      convert normalized_four_sum_sq_le
        (r (selfDualFirstWedge i) (selfDualFirstWedge j))
        (r (selfDualFirstWedge i) (selfDualSecondWedge j))
        (r (selfDualSecondWedge i) (selfDualFirstWedge j))
        (r (selfDualSecondWedge i) (selfDualSecondWedge j)) using 1
      ring
    _ = ∑ i, ∑ b : Bool, ∑ j, ∑ c : Bool, r (orderedWedge (i, b)) (orderedWedge (j, c)) ^ 2 := by
      refine Finset.sum_congr rfl fun i _ ↦ ?_
      exact Finset.sum_comm
    _ ≤ ∑ i, ∑ b : Bool, ∑ c : Fin 4, ∑ d : Fin 4, r (orderedWedge (i, b)) (c, d) ^ 2 :=
      Finset.sum_le_sum fun i _ ↦ Finset.sum_le_sum fun b _ ↦
        sum_orderedWedges_le (fun q ↦ r (orderedWedge (i, b)) q ^ 2) fun _ ↦ sq_nonneg _
    _ ≤ _ := sum_orderedWedges_le (fun p ↦ ∑ c : Fin 4, ∑ d : Fin 4, r p (c, d) ^ 2)
      fun _ ↦ Finset.sum_nonneg fun _ _ ↦ Finset.sum_nonneg fun _ _ ↦ sq_nonneg _

private theorem hilbertSchmidtSq_traceFreeChiralBlock_le (W : Matrix (Fin 3) (Fin 3) ℝ) :
    hilbertSchmidtSq (traceFreeChiralBlock W) ≤ hilbertSchmidtSq W := by
  have hProjection : hilbertSchmidtSq (traceFreeChiralBlock W) =
      hilbertSchmidtSq W - W.trace ^ 2 / 3 := by
    simp [hilbertSchmidtSq, traceFreeChiralBlock, Matrix.trace, Matrix.smul_apply, Matrix.one_apply,
      Fin.sum_univ_three]
    ring
  rw [hProjection]
  linarith only [sq_nonneg W.trace]

/-- The squared Hilbert–Schmidt norm of the trace-free self-dual block is at
most the ordered four-slot squared norm, with constant one. -/
theorem hilbertSchmidtSq_traceFreeSelfDualBlock_le_frameTensorNormSq (R : CurvatureFrameTensor) :
    hilbertSchmidtSq (traceFreeChiralBlock (selfDualCurvatureBlock R)) ≤ frameTensorNormSq R :=
  (hilbertSchmidtSq_traceFreeChiralBlock_le _).trans (hilbertSchmidtSq_selfDualCurvatureBlock_le R)

end FirstOrderTwistor
