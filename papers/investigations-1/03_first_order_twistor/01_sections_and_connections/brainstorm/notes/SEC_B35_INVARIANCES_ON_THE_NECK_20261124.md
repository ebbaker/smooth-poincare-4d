# SEC-B35 · Use the invariances of the Weyl functional on the neck

24 November 2026 (America/New_York). Prepared for Edward B. Baker III with LLM assistance: Claude Fable 5.2 (`claude-fable-5-2`), Claude Cowork, reasoning effort max as the session's configuration records it. Lead decision in the session that executed E59. The recommended Astra/ultra lead and gpt-6.2-sol/ultra helpers were not available, so the two packets issued here are executed by the same model and are not independent of this decision. Exploratory calculation in the same session preceded this text. [E59](../../notes/SEC_E59_20261124.md) · [Decision B34](SEC_B34_ANNULAR_ENERGY_TEST_20261124.md) · [Owning register](../../research-progress/REGISTER.md)

## Where E59 leaves the neck

In one chart \(g=\delta+v\) on a long annulus, E59 bounds the Weyl energy by \(C\varepsilon\,\mathfrak B\) plus end terms, where \(\varepsilon\) is the supremum of \(v\). The constant does not see the length. The bound is attained by cones of every length. What is missing is control of \(\varepsilon\) itself, and a statement for necks that have no Euclidean chart, in particular quotient necks.

The scalar comparison in B34 suggested that the amplitude could grow like the logarithm of the length at bounded energy. E59 recorded that the scalar example is a flat cone when read as a conformal factor, so it does not decide the question for metrics.

## The choice

Two finite questions are issued. Each uses an invariance of \(\int|W|^2dV\) that the test of B34 did not use.

1. **Linear model, [E60](../../research-progress/handoffs/SP4-FOT-SEC-E60_REQUEST_v1.md).** The flat metric on \(\mathbb R^4\setminus0\) is invariant under dilations, and the linearized Bach operator has constant coefficients. Determine whether the linearized equation has a solution of homogeneity zero, possibly with powers of \(\log|x|\), whose linearized Weyl tensor is not zero. Such a solution would be the metric analogue of \(c\log|x|\). Then bound the part of a perturbation that is not removed by diffeomorphisms and conformal factors by the \(L^1\) norm of its linearized Bach tensor, with explicit constants. The \(L^1\) norm is the borderline case, and the estimate has to use that the linearized Bach tensor is divergence free.

2. **Conservation law, [E61](../../research-progress/handoffs/SP4-FOT-SEC-E61_REQUEST_v1.md).** The functional is invariant under diffeomorphisms. Write the corresponding divergence-free vector field for an arbitrary vector field \(X\) and an arbitrary metric, with the divergence term of the first variation explicit. Take \(X\) to be the generator of dilations of a neck. Decide whether the resulting identity bounds the energy of a neck without the hypothesis of a nearly flat chart, with no logarithm of the length.

## Fixed comparisons

For E60: the field \(H\log|x|\) with \(H\) a constant symmetric trace-free matrix, the homogeneous field \(s_H=(x\otimes Hx+Hx\otimes x)/(2|x|^2)\), and the fields \(\mathsf W_{ikjl}x_kx_l\) and \(\mathsf W_{ikjl}x_kx_l|x|^{-4}\) for a constant tensor \(\mathsf W\) with the symmetries of a Weyl tensor. For E61: exact cones over arbitrary cross-sections, the product \(\mathbb R^2\times S^2\), where every term can be computed by hand, and a metric that is not a cone, with a vector field that is not conformal.

## What would change the direction

A homogeneous solution of degree zero with nonzero Weyl tensor would mean that long necks can carry a slowly varying deformation at no linear cost. The chart of E59 would then be the wrong hypothesis, and the next decision would have to quantify the drift. A flux identity that leaves an uncontrolled term at the far end of the neck would be of no use for length-independent estimates.

## Not decided here

The nonlinear amplitude estimate, the existence of a chart or of a nearly homothetic vector field under the fixed-margin hypotheses, and any statement about the closed problem. Numerical work is limited to checking identities and constants. It is not evidence for an inequality.

## Routing

| Task | Routing | Output |
| --- | --- | --- |
| SEC-E60 | gpt-6.2-sol/ultra recommended. Executed by the Claude lead, helper unavailable. | Classification of homogeneous solutions in the stated range, explicit constants for the logarithmic family, an amplitude bound in terms of the \(L^1\) norm of the linearized Bach tensor, or the obstruction. |
| SEC-E61 | Same. | The divergence term and the conservation law with proofs and pointwise numerical checks, the consequence for cones and products, and a neck estimate with exact hypotheses, or the term that prevents it. |

Working inputs at HEAD `fa6ea89938d32c4dd96cfac90846b1201e244b25`, SHA-256, paths relative to the branch. The first three files are new in this session and are not in HEAD.

```
759a56659800006c7b4536daab7c0f4fa7a94e6d9ec586683ae7ecf3475410e4  notes/SEC_E59_20261124.md
cc2a9cc6c3d0ac92a9f2370e08b56567740c24b14a163d62e09075a423e2e4b9  research-progress/handoffs/SP4-FOT-SEC-E59_RETURN_v1.md
b487b1dfeea2d6ed7035b277664955850e340e15ff4cef4b5cd9110ddb7761be  brainstorm/notes/SEC_B34_ANNULAR_ENERGY_TEST_20261124.md
7854160925920435a9b3a90a21f6c1f5c15265d30fe4ba778aa8abae86bc7ed0  manuscript/twistor_sections_and_chiral_weyl_curvature.tex
69bc55bb66c215a627bbc6c06897ccc5a1cfcddec9f21727182d4aba5a0e67ed  notes/SEC_E24_20261124.md
1f1cdde8dc84d7f4fa53c0e2a64f8edd61b4ab7b5c937de59546bfdddc2c66ba  notes/SEC_E57_20261124.md
```
