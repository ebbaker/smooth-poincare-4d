# VAR-E04c · The quadratic chart remainder in L²

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex
assistance. Bounded E work. Actual serving variant and reasoning effort
are unavailable. The checkout was `b5de9758f16e14f22162b4a1e091166ea126c389`.
The SHA-256 prefixes were `4e356dda0d8ecb0f` for `ChartSpliceJets.lean`,
`45260991e7582a12` for `SpliceDensity.lean`, `e31283f6c8429f7f` for the
first-order splice source, and `839111aae86b6935` for the Lake manifest.
[Lean module](../../../../SmoothPoincare/Variational/SpliceRemainderL2.lean) ·
[Chart jet proof](ED03_CHART_SPLICE_JETS.md) ·
[First-order splice source](../../../../../papers/master/manuscript/first_order_splice.tex)

`SmoothPoincare.abs_chartCurvatureFirstJetTerm_sub_le` estimates the
difference between the actual pinned lowered first-jet remainders of two
smooth metrics in the same chart. Let $n$ be the chart dimension, $K$
bound the absolute entries of both Gram matrices and their inverses,
and $\eta$ bound both corresponding entry differences. Let $G$ bound
both first jets and $d$ bound their difference. For every curvature
coefficient the estimate is

$$
|Q_p-Q_q|\le n^4\left(\tfrac{45}{2}K^2\eta G^2+15K^3dG\right).
$$

The proof sets the Hessian to zero in `jetRiemann` and estimates the
remaining Christoffel terms, the derivative of the inverse matrix, and
the final lowering by the Gram matrix. Products are compared by
telescoping and applying the triangle inequality, and each coordinate
sum introduces a factor $n$. `abs_matrixInverse_sub_le` also proves
that, under the common inverse bound $K$ and invertibility, a Gram
entry error $a$ gives inverse entry error at most $n^2K^2a$.

`SmoothPoincare.chartCurvatureFirstJetTerm_sub_memLp_and_le` applies that
majorant to the actual measured chart coefficient on one fixed
measure. With $G,d\in L^4$ it proves membership in $L^2$ and

$$
\|Q_p-Q_q\|_2\le n^4\left(\tfrac{45}{2}K^2\eta\|G\|_4^2
 +15K^3\|d\|_4\|G\|_4\right).
$$

Here `quadraticRemainder_memLp_and_le` derives the product bounds by
Hölder with exponents $(4,4,2)$. Measurability and the coefficient and
first-jet bounds are explicit inputs. The comparison with the reference
metric $b$ is used twice, for the splice $h$ and the source $g$.
`quadraticSpliceRemainder_memLp_and_le` bounds the full first-jet splice
term $Q_h-(1-w)Q_g-wQ_b$ by the sum of those two $L^2$ differences,
for measurable $0\le w\le1$. The corresponding pointwise triangle
inequality is `abs_quadraticSpliceRemainder_le`.

`tendstoUniformly_quadraticRemainder_l2` takes a uniformly bounded $L^4$
majorant, a first-jet difference majorant vanishing in $L^4$, and a
uniformly vanishing coefficient error. It proves uniform $L^2$
convergence from the same quadratic pointwise bound. In the geometric
application the caller must obtain those majorants for both comparisons
on the chosen fixed physical chart, including the derivative of the
cutoff in the first jet of $h$. The chart measure and measurability must
agree with the projection comparison. Conversion to moving chiral
frames, the projection-density estimate, and the globally marked
transplant are subsequent inputs to the energy argument.

## Verification

`lake env lean SmoothPoincare/Variational/SpliceRemainderL2.lean` and
`lake build SmoothPoincare.Variational.SpliceRemainderL2` passed on Lean
`4.35.0-rc3` with Mathlib `c55e6e786f49` and DifferentialGeometry
`788efe978944`. The targeted build completed 3,999 jobs. A fresh import
confirmed the actual chart-coefficient type, the weighted comparison, and
the uniform convergence statement. `#print axioms` reported only
`propext`, `Classical.choice` and `Quot.sound` for all seven public
theorems. [Lake manifest](../../../../lake-manifest.json)
