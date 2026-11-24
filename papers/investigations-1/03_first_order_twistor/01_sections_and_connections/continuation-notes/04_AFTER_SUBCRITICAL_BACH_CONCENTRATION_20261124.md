# Continuation after subcritical Bach concentration

24 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. Author-selected lead settings retained. Actual lead backend and effort unavailable. The [assessment](../reviews/SEC_SUBCRITICAL_BACH_CONCENTRATION_20261124.md) and [sole register](../research-progress/REGISTER.md) give the exact dependencies. The branch [manuscript](../manuscript/twistor_sections_and_chiral_weyl_curvature.tex) covers the earlier E39 milestone.

## Where the global question stands

Fix an oriented smooth homotopy four-sphere with a supplied positive-Yamabe round-marked conformal class. In the curvature-operator conventions let \(4\pi^2\le E_+=E_-\le 8\pi^2-\delta\), \(\delta>0\). The open question is whether \(\mathfrak B/E_+\), for \(\mathfrak B=\int|B|\), can tend to zero at a fixed margin. E48 would force unbounded radial strain in that event. In working on this question keep the following results available.

- A supplied complete smooth nonflat ALE limit in unit-volume Yamabe gauge with a full embedded core must have one Euclidean end and a smooth Bach-flat compactification on a homotopy sphere. If \(e\) is the source energy limit, then \(4\pi^2<e_X\le e-\kappa_\delta\), with \(\kappa_\delta>0\) uniform and unspecified. Only one nonflat smooth component can fit. A smooth positive-Yamabe Bach-flat homotopy-sphere base cannot absorb its remaining energy. [End count](../notes/SEC_E50_20261124.md) · [Link](../notes/SEC_E51_20261124.md) · [Compactification](../notes/SEC_E52_20261124.md) · [Uniform residual](../notes/SEC_E55_20261124.md) · [Accounting](../notes/SEC_E56_20261124.md)
- Over **all** smooth homotopy four-spheres, let \(\mathcal C\) consist of the positive critical values below \(8\pi^2\) for closed smooth positive-Yamabe Bach-flat metrics. If nonempty it has a minimum \(a>4\pi^2\). Every compactified nonflat smooth bubble has \(e_X\in\mathcal C\). A supplied class in the interior of the chosen band produces a marked fixed-band sequence with \(\mathfrak B\to0\) and actual radial strain at least \(c\varepsilon^{-2}\). Producing or excluding such a class remains a global geometry problem. [Stationary level](../notes/SEC_E58_20261124.md) · [Reverse construction](../notes/SEC_E53_20261124.md)
- If the almost-Bach sequence has uniformly elliptic compact \(W^{2,q}\) conformal gauges on the original smooth \(M\), for some \(q>2\), its Weyl tensors converge strongly after subsequence and its limit represents an actual smooth critical class on \(M\). The marked volumes must vanish in those gauges at positive energy. In particular there is neither such a compact sequence nor a nonflat supplied smooth ALE bubble at a limiting energy of \(4\pi^2\), and the conclusion extends some unspecified distance above it. [Compact gauge test](../notes/SEC_E57_20261124.md) · [Closed gap](../notes/SEC_E54_20261124.md)

## Recommended research decision

Begin **SEC-B34** with energy on the annuli connecting the concentration scales. The specific unresolved term in a proposed smooth decomposition is at least \(\kappa_\delta\) per chirality if there is a nonflat smooth leaf. Study whether a geometrically controlled annulus can carry part of this energy when the global Bach norm tends to zero. The exact compactness theory in E55 is already used to its full strength for the closed exact subclass. An approximately critical sequence has forcing in a scale-invariant \(L^1\) space. Its local estimates require their own proof.

For a finite first test, supply a single orientation-preserving Euclidean chart and conformal gauge on a sequence of enlarged annuli
\[
 A_i^*=\{r_i/2<|x|<2R_i\},\qquad R_i/r_i\longrightarrow\infty.
\]
Write \(g_i=g_{\rm eucl}+v_i\) in Cartesian coordinates. Assume uniform ellipticity, \(\|v_i\|_\infty\to0\), and a uniform, scale-invariant coordinate bound \(\|D^2v_i\|_{L^2(A_i^*)}+\|Dv_i\|_{L^4(A_i^*)}\le C\). First prescribe vanishing derivative energy on the two boundary shells, or keep its dependence visible in the result. Choose a smooth cutoff equal to one on \(A_i=\{r_i<|x|<R_i\}\), supported in \(A_i^*\), with its scaled derivative norms bounded independently of the length. Test the **unrestricted full Weyl variation** against the compactly supported tensor \(\chi_i v_i\). Attempt an estimate forcing \(\int_{A_i}|W_i|^2\to0\) from \(\mathfrak B_i\to0\). The difficult term in the comparison is quadratic in first derivatives. Test a scale-invariant interpolation or integration-by-parts estimate with the small metric amplitude and the boundary errors. Verify each cutoff derivative at both scales and the absence of a factor \(\log(R_i/r_i)\). Compare to the linear fourth-order scalar model as a check on the role of bounded amplitude.

This is an intentionally supplied coordinate gauge. If the estimate works, record precisely which norm is still needed to obtain it from curvature on adjacent dyadic annuli and whether a changing gauge can accumulate distortion over their logarithmic length. If it fails, give the term or model responsible. A collar with finitely many ALE charts on separate compact subannuli does not supply one chart with these bounds. Direct investigation of closed critical metrics at \(a\), should one exist, remains a parallel conceptual alternative.

| Task | Routing | Output |
| --- | --- | --- |
| SEC-B34 | Retained lead and effort | Choose a fixed annular estimate, state gauge, boundary and convergence data, and record the assumptions needed for geometric application. |
| SEC-E59 | gpt-6.2-sol/ultra, after issuance | Prove the length-independent estimate, exhibit a counterexample satisfying the frozen hypotheses or identify an uncontrolled term. |

## Pasteable continuation

> Continue the sections-and-connections research from 04_AFTER_SUBCRITICAL_BACH_CONCENTRATION_20261124.md. Read AGENTS.md, the workflow documents, the branch manuscript, the E49–E58 assessment, the sole register, and E50, E52, E55–E58. Start SEC-B34 on whether an almost-Bach long annulus can carry the residual Weyl energy. Freeze the first compactly supported metric-difference test with scale-invariant boundary estimates, then delegate E59 to gpt-6.2-sol/ultra. Distinguish the supplied coordinate control from extraction or neck regularity for the original sequence. Keep the retained lead and effort, preserve the pause on the separate CME work, record proofs and source checks, refresh chat if available, and finish with an assessed handoff.

Assessment SHA-256 at handoff: `35d5f719e9fa7849de44ddf5e56cdb10c674dd4428fb90f118a3c6e3043ce0da`.
