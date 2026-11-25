# SP4-FOT-SEC-E59 · return v1

24 November 2026, America/New_York. Prepared for Edward B. Baker III with LLM assistance: Claude Fable 5.2 (`claude-fable-5-2`), Claude Cowork, reasoning effort max as configured. Executed by the lead session; the recommended gpt-6.2-sol / ultra helper was not available. [Request](SP4-FOT-SEC-E59_REQUEST_v1.md) · [Evidence](../../notes/SEC_E59_20261124.md) · [Owning register](../REGISTER.md).

Observed HEAD was `fa6ea89938d32c4dd96cfac90846b1201e244b25` and the seven working-tree digests matched the request. The B34 note is new in this session and is not in HEAD.

| Frozen item | Verdict | Result and scope |
| --- | --- | --- |
| (i) length-independent estimate | Proved | For \(g=\delta+v\) on \(A^*\) with \(\varepsilon=\|v\|_\infty\le\varepsilon_0\): \(\int_A|W_g|^2dV_g\le C\varepsilon[\mathfrak B+(K+\varepsilon)(1+\varepsilon K)]\), with universal \(\varepsilon_0\), \(C\) and no dependence on \(R/r\). No bound for \(\|Dv\|_{L^4}\), no smallness of \(\mathfrak B\) and no condition on the end shells is used. The gradient bound \(\|\eta Dv\|_{L^4}^2\le C\varepsilon(K+\varepsilon)\) is a conclusion. |
| (ii) removing \(K\) | Proved | If \(v\) is divergence free and trace free in the chart, \(\int_A|W_g|^2dV_g\le C(\varepsilon\mathfrak B+\varepsilon^2)\) and \(\|D^2v\|_{L^2(A)}\le C(\varepsilon\mathfrak B+\varepsilon^2)^{1/2}\). |
| (iii) sharpness | Resolved by examples | A plane wave \(ak^{-2}\sin(kx_1)H\) and cones \(\delta+cs\) attain \(\varepsilon\mathfrak B\) up to universal factors; the cones do so for every length. A field with constant linearized Weyl tensor attains \(\varepsilon^2\). The examples are evaluated to leading order. |
| (iv) what is not given | Recorded | The chart is a hypothesis. The norm that would produce it from dyadic information is the \(\ell^1\) sum of the dyadic \(L^2\) curvature norms, the scale of \(L^{2,1}\); the energy is the \(\ell^2\) sum. This is a statement of dependence and is not proved. The function \(c\log|x|\) marks the borderline for functions and is not a counterexample for metrics, because \(|x|^{2c}\delta\) is a flat cone. |

An addition outside the frozen items: a comparison inequality with a second metric \(\bar g\) (Proposition 3 of the note), which shows that a metric with small total Bach norm almost minimizes Weyl energy among uniformly close metrics, and which gives the strong-convergence mechanism of E57 locally with second derivatives in \(L^2\) and bounded total Bach norm. The extension to a nonsmooth \(\bar g\) is not written.

No escalation: the mechanism of B34 did not change. Not covered: construction of the chart from the fixed-margin hypotheses, quotient necks, and any claim about the closed problem. No external source was used. The same model wrote the request and the return in one session.
