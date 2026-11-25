import DifferentialGeometry.Geometry.Curvature.CurvatureOperator.Ricci.Basic
import DifferentialGeometry.Geometry.Metric.Convergence.CovariantDerivative.Pullback
import FirstOrderTwistor.GeometricChiralBlock
import Mathlib.LinearAlgebra.Matrix.Symmetric

/-!
# Symmetry of the metric curvature block

The frame coefficient convention interchanges the last two arguments of the
lowered Levi–Civita tensor. Pair symmetry in this convention uses both
alternating-pair identities. Compression and subtraction of the scalar
part preserve symmetry.
-/

open DifferentialGeometry DifferentialGeometry.CheegerGromovCompactness
open DifferentialGeometry.Geometry.Connection DifferentialGeometry.Geometry.Curvature
open scoped Manifold ContDiff

namespace FirstOrderTwistor

/-- Swapping the two wedge pairs transposes the compressed curvature matrix. -/
theorem selfDualCurvatureBlock_isSymm_of_pair_symm (R : CurvatureFrameTensor)
    (hpair : ∀ a b c d, R a b c d = R c d a b) :
    (selfDualCurvatureBlock R).IsSymm := by
  apply Matrix.IsSymm.ext
  intro i j
  simp only [selfDualCurvatureBlock]
  rw [hpair (selfDualFirstWedge j).1 (selfDualFirstWedge j).2
      (selfDualFirstWedge i).1 (selfDualFirstWedge i).2,
    hpair (selfDualFirstWedge j).1 (selfDualFirstWedge j).2
      (selfDualSecondWedge i).1 (selfDualSecondWedge i).2,
    hpair (selfDualSecondWedge j).1 (selfDualSecondWedge j).2
      (selfDualFirstWedge i).1 (selfDualFirstWedge i).2,
    hpair (selfDualSecondWedge j).1 (selfDualSecondWedge j).2
      (selfDualSecondWedge i).1 (selfDualSecondWedge i).2]
  congr 1
  abel

section Geometric

variable {E H M : Type*}
    [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
    [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
    [T2Space M] [BoundarylessManifold I M]

local instance : CompleteSpace E := FiniteDimensional.complete ℝ E

local instance : IsManifold I 1 M := IsManifold.of_le (by decide : (1 : WithTop ℕ∞) ≤ ∞)

variable (g : SmoothRiemannianMetric I M) (o : ManifoldOrientation I M 4)
  (x : M) (frame : OrientedOrthonormalFrameAt g o x)

private theorem metricCurvatureFrameTensor_inner_riemannOp (a b c d : Fin 4) :
    metricCurvatureFrameTensor g o x frame a b c d =
      g.inner x (riemannOp (LeviCivita (I := I) g) x (frame.basis a) (frame.basis b)
        (frame.basis d)) (frame.basis c) := by
  unfold metricCurvatureFrameTensor
  rw [metricRm04StandardAt_eq_inner_riemannOp]
  exact g.symm x _ _

/-- Alternation in the first wedge pair of the metric frame tensor. -/
theorem metricCurvatureFrameTensor_swap_first (a b c d : Fin 4) :
    metricCurvatureFrameTensor g o x frame b a c d =
      -metricCurvatureFrameTensor g o x frame a b c d := by
  simp only [metricCurvatureFrameTensor_inner_riemannOp]
  rw [riemannOp_swap (LeviCivita (I := I) g) x (frame.basis a) (frame.basis b) (frame.basis d)]
  simp only [map_neg, neg_apply, neg_neg]

/-- Alternation in the second wedge pair of the metric frame tensor. -/
theorem metricCurvatureFrameTensor_swap_last (a b c d : Fin 4) :
    metricCurvatureFrameTensor g o x frame a b d c =
      -metricCurvatureFrameTensor g o x frame a b c d := by
  simp only [metricCurvatureFrameTensor_inner_riemannOp]
  apply eq_neg_of_add_eq_zero_left
  rw [g.symm x (riemannOp (LeviCivita (I := I) g) x (frame.basis a) (frame.basis b)
      (frame.basis d)) (frame.basis c)]
  exact riemannOp_metric_skew g x (frame.basis a) (frame.basis b)
    (frame.basis c) (frame.basis d)

/-- The Levi–Civita curvature has pair symmetry in the frame's operator convention. -/
theorem metricCurvatureFrameTensor_pair_symm (a b c d : Fin 4) :
    metricCurvatureFrameTensor g o x frame a b c d =
      metricCurvatureFrameTensor g o x frame c d a b := by
  calc
    metricCurvatureFrameTensor g o x frame a b c d =
        metricCurvatureFrameTensor g o x frame d c b a := by
      simp only [metricCurvatureFrameTensor_inner_riemannOp]
      exact riemannOp_inner_pair_symm g x (frame.basis a) (frame.basis b)
        (frame.basis d) (frame.basis c)
    _ = -metricCurvatureFrameTensor g o x frame c d b a :=
      metricCurvatureFrameTensor_swap_first g o x frame c d b a
    _ = metricCurvatureFrameTensor g o x frame c d a b := by
      rw [metricCurvatureFrameTensor_swap_last g o x frame c d a b, neg_neg]

/-- The actual metric curvature compression to self-dual two-forms is symmetric. -/
theorem selfDualCurvatureBlock_metric_isSymm :
    (selfDualCurvatureBlock (metricCurvatureFrameTensor g o x frame)).IsSymm :=
  selfDualCurvatureBlock_isSymm_of_pair_symm _
    (metricCurvatureFrameTensor_pair_symm g o x frame)

/-- Removing the scalar part leaves the geometric chiral block symmetric. -/
theorem geometricChiralBlock_isSymm : (geometricChiralBlock g o x frame).IsSymm := by
  unfold geometricChiralBlock traceFreeChiralBlock
  exact (selfDualCurvatureBlock_metric_isSymm g o x frame).sub (Matrix.isSymm_one.smul _)

end Geometric

end FirstOrderTwistor
