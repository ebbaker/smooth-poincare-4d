import DifferentialGeometry.Geometry.Curvature.Metric.Defs
import DifferentialGeometry.Geometry.Metric.TensorInner.Fiber.MetricData
import DifferentialGeometry.Topology.Manifold.Orientation
import Mathlib.Analysis.InnerProductSpace.Orientation
import Mathlib.LinearAlgebra.Matrix.Trace

/-!
# The geometric self-dual Weyl block in dimension four

In an oriented orthonormal tangent basis, use the complementary pairs
`(01, 02, 03)` and `(23, 31, 12)`. Their sums divided by `√2` give the
self-dual basis. The curvature operator pairs `(a,b)` with `(c,d)` by
`g(R(eₐ,eᵦ)e_d,e_c)`, so a round metric of curvature `k` has operator
`k • 1`. The trace-free part of the self-dual compression removes the
scalar term. The trace-free Ricci part couples the two chiral subspaces.
-/

open DifferentialGeometry DifferentialGeometry.Geometry.Curvature DifferentialGeometry.Tensor0SBundle
open scoped Manifold ContDiff

namespace FirstOrderTwistor

/-- Ordered frame coefficients for the curvature operator, with its positive
sectional-curvature convention on the diagonal. -/
abbrev CurvatureFrameTensor := Fin 4 → Fin 4 → Fin 4 → Fin 4 → ℝ

/-- First oriented wedge in each self-dual basis vector. -/
def selfDualFirstWedge (i : Fin 3) : Fin 4 × Fin 4 := ![(0, 1), (0, 2), (0, 3)] i

/-- Complementary oriented wedge in each self-dual basis vector. -/
def selfDualSecondWedge (i : Fin 3) : Fin 4 × Fin 4 := ![(2, 3), (3, 1), (1, 2)] i

/-- Compress the curvature operator to the normalized self-dual basis. -/
noncomputable def selfDualCurvatureBlock (R : CurvatureFrameTensor) : Matrix (Fin 3) (Fin 3) ℝ :=
  let coeff (p q : Fin 4 × Fin 4) := R p.1 p.2 q.1 q.2
  fun i j ↦ (coeff (selfDualFirstWedge i) (selfDualFirstWedge j) +
    coeff (selfDualFirstWedge i) (selfDualSecondWedge j) +
    coeff (selfDualSecondWedge i) (selfDualFirstWedge j) +
    coeff (selfDualSecondWedge i) (selfDualSecondWedge j)) / 2

/-- Remove the scalar multiple of the identity from a three-dimensional block. -/
noncomputable def traceFreeChiralBlock (A : Matrix (Fin 3) (Fin 3) ℝ) : Matrix (Fin 3) (Fin 3) ℝ :=
  A - (A.trace / 3) • 1

@[simp]
theorem trace_traceFreeChiralBlock (A : Matrix (Fin 3) (Fin 3) ℝ) :
    (traceFreeChiralBlock A).trace = 0 := by
  simp [traceFreeChiralBlock, Matrix.trace_sub, Matrix.trace_smul]

@[simp]
theorem traceFreeChiralBlock_smul_one (k : ℝ) :
    traceFreeChiralBlock (k • (1 : Matrix (Fin 3) (Fin 3) ℝ)) = 0 := by
  have h : ((k • (1 : Matrix (Fin 3) (Fin 3) ℝ)).trace / 3) = k := by
    simp [Matrix.trace_smul]
  unfold traceFreeChiralBlock
  rw [h, sub_self]

private def kronecker (a b : Fin 4) : ℝ := if a = b then 1 else 0

/-- Constant sectional curvature coefficients in the operator convention. -/
noncomputable def constantSectionalFrameTensor (k : ℝ) : CurvatureFrameTensor :=
  fun a b c d ↦ k * (kronecker a c * kronecker b d - kronecker a d * kronecker b c)

theorem selfDualCurvatureBlock_constantSectional (k : ℝ) :
    selfDualCurvatureBlock (constantSectionalFrameTensor k) = k • 1 := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    norm_num [selfDualCurvatureBlock, constantSectionalFrameTensor, selfDualFirstWedge,
      selfDualSecondWedge, kronecker, Matrix.smul_apply, Matrix.one_apply]

theorem traceFreeSelfDualBlock_constantSectional (k : ℝ) :
    traceFreeChiralBlock (selfDualCurvatureBlock (constantSectionalFrameTensor k)) = 0 := by
  rw [selfDualCurvatureBlock_constantSectional, traceFreeChiralBlock_smul_one]

/-- The Kulkarni–Nomizu product of the orthonormal-frame metric and a
symmetric bilinear form, in the operator slot convention. -/
noncomputable def metricKulkarniNomizuFrameTensor (S : Matrix (Fin 4) (Fin 4) ℝ) :
    CurvatureFrameTensor := fun a b c d ↦
  kronecker a c * S b d + S a c * kronecker b d -
    kronecker a d * S b c - S a d * kronecker b c

/-- Compression of a metric Kulkarni–Nomizu product retains only the scalar
part of the symmetric form. A trace-free Ricci term has zero compression. -/
theorem selfDualCurvatureBlock_metricKulkarniNomizu (S : Matrix (Fin 4) (Fin 4) ℝ)
    (hS : ∀ a b, S a b = S b a) :
    selfDualCurvatureBlock (metricKulkarniNomizuFrameTensor S) = (S.trace / 2) • 1 := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    norm_num [selfDualCurvatureBlock, metricKulkarniNomizuFrameTensor, selfDualFirstWedge,
      selfDualSecondWedge, kronecker, Matrix.smul_apply, Matrix.one_apply, Matrix.trace,
      Fin.sum_univ_four] <;>
    linarith only [hS 0 1, hS 0 2, hS 0 3, hS 1 2, hS 1 3, hS 2 3]

section Geometric

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  {M : Type*} [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]

/-- An oriented orthonormal basis in one tangent fiber of the given metric. -/
structure OrientedOrthonormalFrameAt (g : SmoothRiemannianMetric I M)
    (o : ManifoldOrientation I M 4) (x : M) where
  basis : Module.Basis (Fin 4) ℝ (TangentSpace I x)
  orthonormal : ∀ a b, g.inner x (basis a) (basis b) = if a = b then 1 else 0
  oriented : basis.orientation = o.orientation x

variable (g : SmoothRiemannianMetric I M) (o : ManifoldOrientation I M 4) (x : M)

/-- A choice of basis in one tangent fiber, using the actual metric and the
chosen orientation. -/
noncomputable def orientedOrthonormalFrameAt : OrientedOrthonormalFrameAt g o x := by
  let D := (tangentMetricData (I := I) g x).metric
  letI : InnerProductSpace.Core ℝ (TangentSpace I x) := D.toCore
  letI : NormedAddCommGroup (TangentSpace I x) :=
    @InnerProductSpace.Core.toNormedAddCommGroup ℝ (TangentSpace I x) _ _ _ D.toCore
  letI : InnerProductSpace ℝ (TangentSpace I x) :=
    @InnerProductSpace.ofCore ℝ (TangentSpace I x) _ _ _ D.toCore.toCore
  have hdim : Module.finrank ℝ (TangentSpace I x) = 4 := o.dimension_eq
  let b := (o.orientation x).finOrthonormalBasis (by decide) hdim
  refine ⟨b.toBasis, fun a c ↦ ?_, (o.orientation x).finOrthonormalBasis_orientation _ _⟩
  rw [← TangentMetricData.inner_eq (tangentMetricData (I := I) g x)]
  change D.inner (b a) (b c) = _
  rw [← MetricFiberData.toCore_inner D (b a) (b c)]
  exact b.inner_eq_ite a c

variable (frame : OrientedOrthonormalFrameAt g o x)

/-- Evaluate the lowered Levi–Civita curvature of `g` in the specified basis.
The swapped last two arguments give `Rm(u,v,v,u)` for a unit wedge diagonal. -/
noncomputable def metricCurvatureFrameTensor : CurvatureFrameTensor := by
  letI : CompleteSpace E := FiniteDimensional.complete ℝ E
  letI : IsManifold I 1 M := IsManifold.of_le (by decide : (1 : WithTop ℕ∞) ≤ ∞)
  exact fun a b c d ↦
    metricRm04StandardAt g x (frame.basis a) (frame.basis b) (frame.basis d) (frame.basis c)

/-- The positive Weyl operator coefficients of the actual metric at `x`, in
the self-dual basis induced by `frame`. -/
noncomputable def geometricChiralBlock : Matrix (Fin 3) (Fin 3) ℝ :=
  traceFreeChiralBlock (selfDualCurvatureBlock (metricCurvatureFrameTensor g o x frame))

@[simp]
theorem trace_geometricChiralBlock : (geometricChiralBlock g o x frame).trace = 0 :=
  trace_traceFreeChiralBlock _

end Geometric

end FirstOrderTwistor
