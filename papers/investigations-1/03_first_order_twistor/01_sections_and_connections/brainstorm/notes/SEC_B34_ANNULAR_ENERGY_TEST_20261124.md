# SEC-B34 · Test the metric difference on a long annulus

24 November 2026 (America/New_York). Prepared for Edward B. Baker III with LLM assistance: Claude Fable 5.2 (`claude-fable-5-2`), Claude Cowork, reasoning effort max as the session's configuration records it. The author asked this session to continue the research, and it acted as lead. The Astra/ultra lead and the gpt-6.2-sol/ultra helpers that the routing recommends were not available in it, so the packet issued here is executed by the same model and is not independent of this decision. [Handoff](../../continuation-notes/04_AFTER_SUBCRITICAL_BACH_CONCENTRATION_20261124.md) · [Fixed-margin assessment](../../reviews/SEC_SUBCRITICAL_BACH_CONCENTRATION_20261124.md) · [Owning register](../../research-progress/REGISTER.md)

## The choice

The handoff proposes one finite test, and this decision adopts it without change of mechanism. Take an oriented Euclidean chart on
\[
 A^*=\{r/2<|x|<2R\},\qquad A=\{r\le|x|\le R\},\qquad R\ge2r,
\]
and write a smooth Riemannian metric there as \(g=\delta+v\). Tensor norms and derivatives of \(v\) are Euclidean in the chart. The data are
\[
 \varepsilon=\|v\|_{L^\infty(A^*)},\qquad K=\|D^2v\|_{L^2(A^*)},\qquad
 \mathfrak B=\int_{A^*}|B_g|_g\,dV_g .
\]
All three are unchanged by dilation of the chart. The test tensor is \(\eta^4v\), where \(\eta\) is a radial cutoff equal to one on \(A\), supported in \(A^*\), and built from one fixed profile at the inner scale \(r\) and one at the outer scale \(R\). Insert it in the first variation of the full Weyl functional, whose gradient is \(-4B_g\) in the conventions of the [manuscript](../../manuscript/twistor_sections_and_chiral_weyl_curvature.tex), equation `var:bach`.

The estimate to prove or refute is a bound for \(\int_A|W_g|^2\,dV_g\) by a function of \((\varepsilon,K,\mathfrak B)\) that tends to zero as \(\varepsilon\to0\) with \(K\) and \(\mathfrak B\) bounded, with a constant independent of \(R/r\). A factor \(\log(R/r)\) anywhere in the bound counts as failure of the frozen statement. The contributions of the two cutoff shells are to stay visible. A premise of vanishing derivative energy on the shells is allowed only if the proof needs it, and then it is reported as a dependence.

## Why this test

For a smooth metric the first variation gives
\[
 \sup\{\,D\mathcal W_g[h]:\ |h|_g\le1\,\}=4\int|B_g|_g\,dV_g ,
\]
with the supremum over compactly supported symmetric tensors. A small total Bach norm therefore says that no variation that is small in the supremum norm lowers the Weyl energy to first order. A flat annulus within \(\varepsilon\) of \(g\) is such a variation, provided the second-order terms of the Weyl energy along the segment from \(g\) to \(\delta\) do not spoil the comparison. The test measures exactly those terms. The compact-gauge theorem [E57](../../notes/SEC_E57_20261124.md) used the same pairing with compactness in \(W^{1,4}\). On a long annulus no compactness is available, and the term quadratic in \(Dv\) has to be controlled by the amplitude through an interpolation whose constant must not see the length.

## Fixed comparisons

The scalar model is the function \(u=c\log|x|\). It is biharmonic on the annulus, has Hessian energy \(8\pi^2c^2\) per unit of \(\log|x|\), and oscillation \(c\log(R/r)\). With \(c=\log(R/r)^{-1/2}\) it carries the energy \(8\pi^2\) on an arbitrarily long annulus with no forcing, and its oscillation diverges. The packet records whether the metric problem has the same feature inside the frozen hypotheses, where the amplitude is bounded by assumption.

Two examples are fixed for sharpness. A high-frequency perturbation \(k^{-2}\sin(kx_1)H\) on a fixed ball tests whether the Bach term can be dropped. A metric with Cartesian components homogeneous of degree zero is a cone, has energy proportional to the length, and tests the dependence on \(\varepsilon\).

## Not decided here

The chart is supplied. Nothing is claimed about extracting it from the fixed-margin hypotheses, about a sequence of charts on dyadic annuli, or about quotient necks. After the packet returns, the lead records which norm on adjacent dyadic annuli would produce the chart and whether a change of gauge between them can accumulate. If the frozen estimate fails, the return names the term or the example, and this decision is reopened before any substitute is tried.

## Routing

| Task | Routing | Output |
| --- | --- | --- |
| [SEC-E59](../../research-progress/handoffs/SP4-FOT-SEC-E59_REQUEST_v1.md) | gpt-6.2-sol/ultra recommended. Executed by the Claude lead, helper unavailable. | Proof of a length-independent estimate, a counterexample inside the frozen hypotheses, or the uncontrolled term. |

Working inputs at HEAD `fa6ea89938d32c4dd96cfac90846b1201e244b25`, SHA-256, paths relative to the branch.

```
793f03326c6f6696ef90977890985925ae3226752eba0b2a26c30cc4735595b8  continuation-notes/04_AFTER_SUBCRITICAL_BACH_CONCENTRATION_20261124.md
35d5f719e9fa7849de44ddf5e56cdb10c674dd4428fb90f118a3c6e3043ce0da  reviews/SEC_SUBCRITICAL_BACH_CONCENTRATION_20261124.md
7854160925920435a9b3a90a21f6c1f5c15265d30fe4ba778aa8abae86bc7ed0  manuscript/twistor_sections_and_chiral_weyl_curvature.tex
1f1cdde8dc84d7f4fa53c0e2a64f8edd61b4ab7b5c937de59546bfdddc2c66ba  notes/SEC_E57_20261124.md
932c383c66c5e614712b29c545de85856556c4053914d89e3deb0d916005c74b  notes/SEC_E48_20261124.md
```
