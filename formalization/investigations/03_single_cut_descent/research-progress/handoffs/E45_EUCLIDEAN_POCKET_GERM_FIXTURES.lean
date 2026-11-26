import SmoothPoincare.Variational.EuclideanPocketCapGerm
import DifferentialGeometry.Geometry.Metric.Euclidean

open DifferentialGeometry SmoothPoincare Set
open scoped ContDiff Manifold

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "I₄" => 𝓘(ℝ, E₄)

-- The round density at the actual center includes the square of the scaling.
example : transportedPocketRoundDensity (1 / 3) (0 : E₄) = 36 := by
  norm_num [transportedPocketRoundDensity]

-- The inverse formula for a literal Euclidean metric on an open pocket.
example :
    let F := (Diffeomorph.refl I₄ E₄ ∞).toPartialDiffeomorph
    ∀ p ∈ F '' Metric.ball (0 : E₄) 2, ∀ v w : TangentSpace I₄ p,
      (euclideanMetric (E := E₄)).inner p v w =
        @inner ℝ E₄ _ (mfderiv I₄ I₄ F.symm p v) (mfderiv I₄ I₄ F.symm p w) := by
  intro F
  have hSource : Metric.ball (0 : E₄) 2 ⊆ F.source := Set.subset_univ _
  have hId : (F : E₄ → E₄) = id := rfl
  apply euclideanPocket_inverseMetric_of_forward (euclideanMetric (E := E₄)) F hSource
  intro z _ v w
  rw [hId, mfderiv_id]
  rfl
