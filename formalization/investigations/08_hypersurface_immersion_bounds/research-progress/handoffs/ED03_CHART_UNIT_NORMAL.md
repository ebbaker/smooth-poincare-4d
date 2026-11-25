# IMM-E01n · Local normal from a nonzero second form

25 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI Codex assistance. Actual serving model and effort were unavailable.
This bounded E packet uses the actual induced metric and immersion of
the [immersion manuscript](../../../../../papers/master/manuscript/immersion_entry.tex)
and the [Route 08 register](../REGISTER.md).

| Input | SHA-256 prefix or revision |
| --- | --- |
| Master immersion TeX | `d294f6e4600927f5` |
| [CodazziJets.lean](../../../../SmoothPoincare/Immersions/CodazziJets.lean) | `8d4279c5d32919ca` |
| [ImmersionChart.lean](../../../../SmoothPoincare/Immersions/ImmersionChart.lean) | `3dc69a1955cff56a` |
| [ParallelShapeCurvature.lean](../../../../SmoothPoincare/Immersions/ParallelShapeCurvature.lean) | `9656f4c37eecc802` |
| DifferentialGeometry `Geometry/Submanifold/Gauss.lean` | `2e30710dc57f9f16` |
| DifferentialGeometry pin | `788efe97894474c032de6dfb1289d515f613d15a` |
| Mathlib pin | `c55e6e786f49471c72fbddbec5415808896aec1e` |

Lean `4.35.0-rc3` at `470d5ce1400764999581fd26d5d72b00d990b0f4` and
[manifest](../../../../lake-manifest.json) `839111aae86b6935`.

## Scope of the proof

`hypersurfaceChartSecondForm` is the covariant derivative of the actual
written immersion derivative in one chart centered at the specified
point. It uses the pinned source Levi–Civita form
`metricChartConnectionForm`, and the ambient connection is flat in
the Euclidean target. Neither the source chart nor the constant input
vectors changes with the point in the chart.

`hypersurfaceChartSecondForm_perpendicular` derives orthogonality
to the full image of the derivative of `F.localMap`. The
isometric chart identity comes from the actual immersion's isometry
on all tangent arguments. The Euclidean chart bilinear form is the
constant inner product. The second derivative is symmetric by the
symmetry of the Hessian of the written map and the source torsion-free
connection. The proof uses the pinned
`bundleMapCovDeriv_orthogonal_of_symmetric` and the source-metric
compatibility calculation from `Gauss.lean`.

`exists_smoothChartUnitNormal` takes a nonzero value of this actual
second form at the center on two given chart vectors. Smoothness of
the written immersion throughout the chart target and smoothness of
the fixed-slot Christoffel contraction give smoothness of the second
form throughout that target. Shrink to one open neighborhood where
that value persists as a nonzero vector field and the normality
identity holds. Its normalization is smooth there, has norm one, and
remains perpendicular to every tangent image of the written metric
immersion. The reusable regularity declarations are
`IsometricHypersurface.localMap_contDiffOn` and
`hypersurfaceChartSecondForm_smoothAt`.

A nonzero principal curvature gives a center value by the checked
`immersionChart_secondForm` identity. Keep the first input equal to
the chosen principal vector and scale the second by the reciprocal
of its nonzero principal curvature to obtain the prescribed unit
normal at the center. This is the conclusion of
`exists_smoothChartUnitNormal_of_principal` for either sign of the
selected curvature. The construction needs no pre-existing local normal
field or locally smooth principal frame.

## Verification

- [ChartUnitNormal.lean](../../../../SmoothPoincare/Immersions/ChartUnitNormal.lean)
  has SHA-256 `6441d13c6e7db7fbfb98acd0506dc875bfdb4d930c4f8315ab65782897d5a1a0`.
  The pinned Lake target built as a dependency of `NormalChartTransition`.
- An imported-module screen checked the proposed signatures and derived
  the differentiable unit normal germ, with the required unit inner product
  and orthogonality holding eventually on the chart. This uses the actual
  principal frame and an arbitrary nonzero curvature at its center.
- `#print axioms` on the checked normal and smoothness theorems reported
  only `propext`, `Classical.choice`, and `Quot.sound`.
