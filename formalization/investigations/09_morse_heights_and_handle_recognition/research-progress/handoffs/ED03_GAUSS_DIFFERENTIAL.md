# HT-E02e · Weingarten equation and the principal Gauss Jacobian

25 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. Actual serving model and reasoning effort
were unavailable. This bounded E packet covers the local differential
and the identification of the critical unit directions in the indexed
height argument. Manuscript SHA-256 prefix `d294f6e4600927f5`, lines 43–50.
The checked inputs are `ImmersionChart.lean` (`3dc69a1955cff56a`) and
the actual height index leaf `ImmersionHeightIndex.lean`
(`19e025647baeb75a`).
[Indexed height source](../../../../../papers/master/manuscript/immersion_entry.tex#L43) ·
[Height index receipt](ED03_PRINCIPAL_INDEX.md)

| Declaration in `SmoothPoincare` | Result |
| --- | --- |
| `ambientOrthogonal_eq_inner_smul_normal` | In Euclidean five-space, a vector orthogonal to four orthonormal tangents is its projection onto a supplied perpendicular unit normal. |
| `principalNormal_derivative` | The derivative of the unit normal germ in each principal direction is the immersion differential of that direction multiplied by the negative principal curvature. |
| `principalNormal_gramJacobian` | The square root of the determinant of the Gram matrix of the actual normal derivative in that frame equals $\lvert\prod_i k_i\rvert$. |
| `principalHeight_unitCritical_iff` | A unit ambient direction gives a critical height at the supplied point precisely when it equals the specified principal normal or its negative. |

[Lean module](../../../../SmoothPoincare/Heights/GaussDifferential.lean)

The derivative and Jacobian apply to a differentiable chart normal
germ for the actual smooth hypersurface. The germ has unit length and
is perpendicular to the chart differential on a neighborhood, and
its value at the center agrees with the frame normal. Differentiating
unit length gives zero normal component of its derivative.
Differentiating tangential perpendicularity computes the tangent
components using the actual second fundamental form of the induced
metric. The immersion differential is isometric, so the four tangent
images and the specified normal make an orthonormal family in
Euclidean five-space. Linear independence and the computed ambient
dimension give a basis. The same basis proves that a unit critical
direction is one of the two normals.

In the principal frame the derivative Gram matrix has diagonal
entries $k_i^2$, with zero off-diagonal entries. Its determinant
therefore equals $(\prod_i k_i)^2$, giving the absolute product also
at degenerate data. The formula uses the actual normal derivative
with its ambient inner products. Applying it to a global oriented
Gauss map requires the normal realization and the sphere measure
and multiplicity area formula for that map. The indexed integral
and the global Morse regularity of heights are further steps.

## Verification

Lean `4.35.0-rc3` at `470d5ce1400764999581fd26d5d72b00d990b0f4`.
Lake manifest SHA-256 prefix `839111aae86b6935`. DifferentialGeometry
`788efe97894474c032de6dfb1289d515f613d15a` and Mathlib
`c55e6e786f49471c72fbddbec5415808896aec1e`.

- `lake env lean SmoothPoincare/Heights/GaussDifferential.lean` passed.
- `lake build +SmoothPoincare.Heights.GaussDifferential` passed (9,733 jobs).
- The importing `lake env lean --stdin` checked the four public
  declarations. All four axiom reports list `propext`,
  `Classical.choice` and `Quot.sound`.
- Checked module SHA-256
  `3cc3c6d0781891ec9986fa9c74a282c3b041e87f8e5f5d6a61252dd1e3050dbf`.
