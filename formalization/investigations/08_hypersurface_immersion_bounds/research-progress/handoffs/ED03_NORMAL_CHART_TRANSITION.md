# IMM-E01v · Scalar normal second form across actual charts

25 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI Codex assistance. Actual serving model and effort were unavailable.
This bounded E packet follows the induced metric and immersion of the
[master immersion manuscript](../../../../../papers/master/manuscript/immersion_entry.tex)
and the [Route 08 register](../REGISTER.md).

| Input | SHA-256 prefix or revision |
| --- | --- |
| [ImmersionChart.lean](../../../../SmoothPoincare/Immersions/ImmersionChart.lean) | `3dc69a1955cff56a` |
| [ChartUnitNormal.lean](../../../../SmoothPoincare/Immersions/ChartUnitNormal.lean) | `6441d13c6e7db7fbf` |
| DifferentialGeometry `Topology/Morse/HessianNaturality.lean` | `6b6d9de2c347e790` |
| DifferentialGeometry pin | `788efe97894474c032de6dfb1289d515f613d15a` |
| Mathlib pin | `c55e6e786f49471c72fbddbec5415808896aec1e` |

Lean `4.35.0-rc3` at `470d5ce1400764999581fd26d5d72b00d990b0f4` and
[manifest](../../../../lake-manifest.json) `839111aae86b6935`.

## Result and scope

Fix two chart centers $p,q$ with $q$ in the source of the chart
centered at $p$. Put $y=\phi_p(q)$ and $z=\phi_q(q)$ for the two
extended-chart coordinates. The theorem `chartNormalForm_transition`
uses the actual transition $\tau=\phi_q\circ\phi_p^{-1}$ on the
overlap and its Fréchet derivative $L=D\tau(y)$. If the fixed ambient
vector $n$ is perpendicular to the entire image of the immersion
differential in the centered chart at $z$, the signed scalar normal
second form in the fixed chart on $(X,Y)$ equals the centered-chart
form on $(LX,LY)$. The sign and magnitude of $n$ are unrestricted.

The written immersion in the fixed chart agrees locally with the
composition of the centered written immersion and $\tau$. The
first derivative chain rule transfers perpendicularity to the fixed
chart. Pairing either covariant second derivative with $n$ removes
its Christoffel term. Each remaining scalar form is the Hessian of
the ambient height in direction $n$. Its first derivative at $z$
vanishes, so the critical-height Hessian chain rule removes the
second derivative of $\tau$.

`chartNormalForm_eq_secondFundamentalFormAt` then identifies the
centered form with the actual ambient second fundamental form of
this immersion evaluated at $q$. These are local identities on the
geometric chart overlap. A neighborhood field may be used by fixing
its value at the point, since the scalar second form is linear in
that value and uses no derivative of the field.

## Verification

- [NormalChartTransition.lean](../../../../SmoothPoincare/Immersions/NormalChartTransition.lean)
  has SHA-256 `3f5b19d6cfddcfa3928c7db1f1bc69b8fbb0e17efdaa6ac854d9e84b905166f5`.
  `lake build SmoothPoincare.Immersions.NormalChartTransition` passed.
- The imported-module `#check` and `#print axioms` screen passed for
  both transition theorems. The only axioms were `propext`,
  `Classical.choice`, and `Quot.sound`.
