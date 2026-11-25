# VAR-E03a · Weighted defect on one fixed measured chart

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex
assistance. Bounded E work. The actual serving variant and reasoning effort
are unavailable. The checkout was `9c579f0126ceb8e9a3b2d9b2fcc935b5743b2ad7`.
The SHA-256 prefixes were `0c9b1dce4aa655be` for the variational comparison
source and `839111aae86b6935` for the Lake manifest. [Source, `thm:local-min` proof](../../../../../papers/master/manuscript/variational_comparison.tex#L103) ·
[Route plan](../../research-plan/PLAN.md#decisions-and-subsequent-packets) ·
[Lean module](../../../../SmoothPoincare/Variational/Defect.lean)

`SmoothPoincare.fixedCrossTerm_tendsto_zero` works on one measured domain
$(D,\mu)$ with values in a real inner-product space. Weak convergence to
zero is expressed in mathlib's `WeakSpace ℝ (Lp F 2 μ)`. For a fixed
square-integrable test $v$, `innerSL` gives the continuous linear map
$r\mapsto\langle v,r\rangle_{L^2}$. Evaluation is continuous in the weak
topology, and `L2.inner_def` identifies its value with the integral of the
pointwise inner product on the given measure.

`SmoothPoincare.weightedDefect_tendsto_zero` fixes a measurable cutoff
$0\le\chi\le1$, a square-integrable base density $H$, and square-integrable
defects $r_i\rightharpoonup0$. It takes a bounded-below admissible set $A$,
source energies $e_i\to\inf A$, and endpoint energies $c_i\in A$. The
supplied integrated energy identity is

$$
c_i=e_i+\int_D\bigl(|H+(1-\chi)r_i|^2-|H+r_i|^2\bigr)\,d\mu+\epsilon_i,
\qquad \epsilon_i\to0 .
$$

The proof puts $\chi H$ in the same $L^2$ space and applies the fixed-test
theorem. Expansion of the two squares supplies the weighted term
$(2\chi-\chi^2)|r_i|^2$ and the cross term $2\langle\chi H,r_i\rangle$.
The inequality $\inf A\le c_i$ gives a vanishing upper bound for the
nonnegative weighted integral. On $\{\chi=1\}$ the weight equals one,
which gives vanishing unweighted squared energy on the entire level set.

The measured model can be instantiated for either chiral matrix density
with the Euclidean Hilbert–Schmidt inner product and a fixed restricted
coordinate measure. The geometric application still needs the marked
transplant, the curvature commutator and projection estimates supplying the
integrated error, weak convergence of the actual densities, and admissible
membership on the original type. This packet uses the endpoint identity at
$s=1$. The uniform path estimate and the subsequent compact variation are
separate obligations. [Independent local comparison](../../../../../papers/master/reviews/E08_LOCAL_REPLACEMENT_CHECK.md)

## Verification

`lake env lean SmoothPoincare/Variational/Defect.lean` and
`lake build SmoothPoincare.Variational.Defect` passed under Lean
`4.35.0-rc3` with Mathlib `c55e6e786f49` and DifferentialGeometry
`788efe978944`. The targeted build had 2,935 jobs. A fresh module import
checked both public statements. `#print axioms` reported only `propext`,
`Classical.choice` and `Quot.sound` for both. [Lake manifest](../../../../lake-manifest.json)
