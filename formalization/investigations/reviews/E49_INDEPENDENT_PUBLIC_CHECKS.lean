import SmoothPoincare

/-! E49 applications for Edward B. Baker III, 26 November 2026.
OpenAI Codex assistance. Actual serving model and reasoning effort were unavailable. -/

set_option autoImplicit false

open Bundle DifferentialGeometry DifferentialGeometry.Geometry.Curvature
open DifferentialGeometry.Integral.Measure MeasureTheory Filter
open scoped BigOperators ContDiff ENNReal Manifold Topology

namespace E49Readback

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "I₄" => 𝓘(ℝ, E₄)

section SpatialAdjoints

open DifferentialGeometry.Analysis.Elliptic DifferentialGeometry.Geometry.Connection
  DifferentialGeometry.Geometry.Operator DifferentialGeometry.Tensor0SBundle
  DifferentialGeometry.Tensor.RSTensor SmoothPoincare.Bour

variable {H M : Type*} [TopologicalSpace H]
  {I : ModelWithCorners ℝ E₄ H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  [CompactSpace M] [BoundarylessManifold I M]

local instance : NeZero (Module.finrank ℝ E₄) := ⟨by simp⟩

-- The first adjoint on the 3-slot flux takes its sign in the physical metric pairing.
example (g : SmoothRiemannianMetric I M)
    (A : Tensor0SField (I := I) (M := M) ∞ 2)
    (V : Tensor0SField (I := I) (M := M) ∞ 3) :
    bourClosedTensorPairing g (covDiv0SField g V) A =
      -bourClosedTensorPairing g (metricNabla0S g A) V :=
  bourRicciDivergence_adjoint g A V

-- Moving the two rough derivatives preserves the coefficient of the Ricci term.
example (g : SmoothRiemannianMetric I M)
    (A K : Tensor0SField (I := I) (M := M) ∞ 2) :
    -(1 / 2 : ℝ) * bourClosedTensorPairing g (roughLap0SField g K) A =
      -(1 / 2 : ℝ) * bourClosedTensorPairing g (roughLap0SField g A) K := by
  rw [bourRicciRough_adjoint g A K]

end SpatialAdjoints

#print axioms SmoothPoincare.Bour.bourRicciDivergence_adjoint
#print axioms SmoothPoincare.Bour.bourRicciRough_adjoint

end E49Readback
