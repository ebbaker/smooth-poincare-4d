# VAR-E04a · Curvature commutator in the splice chart

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex
assistance. Bounded E work. The actual serving variant and reasoning effort
are unavailable. The checkout moved from `483ad3c` to `b5de975`.
The SHA-256 prefixes were `e31283f6c8429f7f` for the first-order splice
source, `98189f6ba6435a32` for `Defect.lean` and `839111aae86b6935`
for the Lake manifest. [First-order splice](../../../../../papers/master/manuscript/first_order_splice.tex) ·
[Local replacement proof](../../../../../papers/master/manuscript/variational_comparison.tex#L100) ·
[Lean module](../../../../SmoothPoincare/Variational/ChartSpliceJets.lean)

The interpolation is the actual smooth Riemannian metric
$h=(1-t\chi)g+t\chi b$, constructed by `SmoothRiemannianMetric.convexComb`
on the original type. Fix one extended chart and work in the interior of
its target. The cutoff and both metrics use that same chart throughout.
Spatial derivatives take $t$ as constant, with the result applying to
every $t\in[0,1]$. The chart coefficient identity follows from
`convexComb_inner` in the same chart basis.

`SmoothPoincare.spliceSecondPartial_sub` differentiates real coefficient
functions using the Fréchet derivative along the pinned chart basis.
Its metric specialization is
`SmoothPoincare.chartSpliceMetric_secondPartial_sub`. For the outer
direction $m$ and inner direction $i$, the difference between the
interpolated Hessian and the weighted input Hessians is

$$
t\bigl[\partial_m\partial_i\chi\,(b-g)
 +\partial_i\chi\,\partial_m(b-g)
 +\partial_m\chi\,\partial_i(b-g)\bigr]
$$

coefficient by coefficient. Smoothness of the pinned chart Gram entries
and the chart expression of the cutoff gives the differentiability used
in the product rule. `abs_spliceSecondPartialError_le` gives the sum of
the three absolute products as a bound uniform in $t\in[0,1]$.

`SmoothPoincare.chartRiemannLower_eq_principal_add_firstJet` begins with
the pinned `chartRiemann_eq_jet` and lowers its output with the Gram
matrix. In the second-derivative term the product of the Gram matrix and
its inverse is the identity, so the principal coefficients are constant.
The remainder is the lowered jet curvature evaluated with the actual
value and first derivative and with the second jet set to zero. The
principal part uses the pinned `chartRiemannLower` slot order. With
$D_{m i a c}=\partial_m\partial_i g_{ac}$, that part is

$$
\tfrac12\bigl(D_{j i l k}+D_{j k l i}-D_{j l i k}
              -D_{k i l j}-D_{k j l i}+D_{k l i j}\bigr).
$$

`chartSplicePrincipal_sub` applies this linear combination to the cutoff
errors. Each output coefficient is bounded by three times a common
absolute bound on the input coefficients, via
`abs_loweredCurvaturePrincipal_le`. `chartSpliceRiemannLower_sub` gives
the corresponding equality for actual lowered curvature, with the
additional difference of the value-and-first-derivative remainders.

The first-jet remainder identity is pointwise. Passing to the splice
energy requires a finite $L^2$ estimate for that quadratic remainder
from the $L^4$ first-derivative bounds, as well as the coordinate
conversion to the oriented orthonormal Weyl blocks and density and their
uniform operator estimates. The integrated interpolation identity used in
`weightedDefect_tendsto_zero` also requires the marked transplant,
unchanged exterior, and admissible endpoint. [Measured defect proof](ED03_DEFECT.md)

## Verification

`lake env lean SmoothPoincare/Variational/ChartSpliceJets.lean` and
`lake build SmoothPoincare.Variational.ChartSpliceJets` passed on Lean
`4.35.0-rc3`, Mathlib `c55e6e786f49` and DifferentialGeometry
`788efe978944`. The targeted build completed 3,998 jobs. In a fresh
import, the stated metric Hessian and curvature identities elaborated.
`#print axioms` reported only `propext`, `Classical.choice` and
`Quot.sound` for the identities and the two coefficient bounds. Lean
checked that the cutoff error vanishes at $t=0$ and for a constant cutoff.
[Lake manifest](../../../../lake-manifest.json)
